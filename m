Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7F6CD6E57
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 10:23:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EDF3113EE7;
	Thu,  4 Jun 2026 10:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cG5pFX/8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6436113EE7
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 10:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780568634; x=1812104634;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mq2lb7/uZOHNkluecSqAQCY6niFEOxn7usZdvLQ7258=;
 b=cG5pFX/8DzcsGtMfcFMHKnXAbFJZoUwa2PGqErn90JhF0FoxkKNDx2CD
 9fbEV2u6ueM6nN1i8j3m4b5gnFiiLGNX5wOVTLvVezMVV3QGTf7YvJVWl
 DzSC5dF94tOemhEyVd9grAbKNcl4mBbq1AmXaM9dkPHAybq2WiCsCQUlS
 FH9dYYGKLVzF86/PJP2ldQ6sgfqP0n0b/RJWZ/eftkCbnXo9Sbup1wx+I
 7zZhax/hAzBesK6WV88uCl1wBKcNtKORdMWbBl+PlA0r0W7OLhRDypiA6
 cOPDwUKlS/xr9y9TQRRhXjUBQIzRbFqZ7t37BE1wv6h/D8xYi4iCcvadt A==;
X-CSE-ConnectionGUID: KzQxpp9MRIqgU5W4ZTxRNw==
X-CSE-MsgGUID: bEBOQXS7RwWLg/yO80vHBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="80428036"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="80428036"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 03:23:54 -0700
X-CSE-ConnectionGUID: nBTkJyxlTwmGL3zCjwHzXQ==
X-CSE-MsgGUID: lZ0iP8SfRSu4c1fgObAuSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="241535695"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 03:23:54 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 03:23:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 03:23:54 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 03:23:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WzVd9rPiyEYLMYejSKaYURMPkRMa7SUF4xiIjAp+ENeAfBu3l7UPVtWJ7aoOBqVIprfg+g6REF+loow735775h1hFpsU7n0JzaY10HxhwVpT5rsccgGCEQoFTcCTCsJBsU9g/MomKmhZhg5kNgMnZ8cg+oJFmZjEYUnATKZUS5/nqyn80rM2zSXNsVEoBzGaJZCA2N7fJibkyQJUyFTxq4r1sXHjXqoEdmKFV+djzP0/ne6v91G7wqK1FPUq/aotRttIzK77A/XvtzSlywZXxQBJYk/CPEhkqeXQt3R0XlA3EfE4L6dSo3WTA78O1S3X3BonYQ/8wONv0Wh/mOhEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A/+jOIBwip2FWJnrQSX8YdWH9jgZ/zwWI2r45Wxmx6Y=;
 b=qey85bkatAnFhXG2q/WH+wru1R377h0MNkNOFOBXoHmPo+g8g9ZMaMKxfC6ysa4RYQr5VrEkMIeXRkb4nvIMXOFAbheDAgXsld+2lG+psCU5qQ4Y2c4vEIC2/8YRz5AFJs/ipr9VBFtxch3nZDXDz1P9sAi/SdWJEsK4jnGOhWNwHbWFdvGmQ/EJ7iT7j+VULG8z8PMsvwWAsmFIAwinJP2ZFoVll9Ycq+ja/ZSRtVqxhysmHNVVVY/Tytc66XJVD1I/UkId5ZkkuCMesnWbdmUxI+0HuVhfLI1yUpT6hEPQs99bR44RzrMc92fqTZopSoICsw29UqxFd3ePMD1NIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 SA1PR11MB6616.namprd11.prod.outlook.com (2603:10b6:806:257::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 10:23:50 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0092.007; Thu, 4 Jun 2026
 10:23:50 +0000
Message-ID: <90d1f6d6-e191-47a8-ab90-86111e406596@intel.com>
Date: Thu, 4 Jun 2026 15:53:41 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/15] drm/xe: Skip device access during PCI error
 recovery
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>,
 <soham.purkait@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Himal
 Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
References: <20260525100619.3155663-17-riana.tauro@intel.com>
 <20260525100619.3155663-22-riana.tauro@intel.com>
 <eaf3ae99-272f-44ed-9b3a-4aaaef99a8bc@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <eaf3ae99-272f-44ed-9b3a-4aaaef99a8bc@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0247.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ae::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|SA1PR11MB6616:EE_
X-MS-Office365-Filtering-Correlation-Id: 9778cd39-a521-4927-344b-08dec2235ebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|22082099003|18002099003|6133799003|56012099006|11063799006|5023799004|4143699003;
X-Microsoft-Antispam-Message-Info: dzal1/7yQBl9mLl7i/iqs4a06o3WIKqZbiBJUMcNbBByM8xH/3ldUqZftt1wHNbDoc4sW4QzELDMR+U/mzTC5htbXvl5ZBMZIaaqsC+5TAPFjS+sx7gsnBE7cCKLZ44MLxjtQnysfLaskdY4bqP4EaaiJ75LuCcroVsJKahFqVAODllW33ijE72wBicXVH0N3QBGq1ld1r270eckkbbBNDEpi9ZwpnJC57d4UGXF4PIVQ16reYOjncmUVlYUd15p+WsIBuEZloOkHIcXbTFIfTyejAfC/Or0YweFJKznZcAP8jpnqYOB3ldRozDQmYWrIyFRWsnD6Vme8PKAMfenwPdEugMw3RCyb79nKBn2jiqy2ClL4gQVC9qsTcb1UGLEPrSjLjjPSKl1tJLvfNYKKiT493JtKsLQtwK3khxmkDGmCMnuzgJZI2f7uwWZD2WZM9Ssz/pJ2CkKD1mRkX8s64/FD0GPbvlVoZ+swsLtdRN+vcUcPygob8eUcZ1fkzBSEGH4fiVXOtcI/yyuWbLCJMRBz4ztyu4hOJ90kPKxsyhIZSpZQQj+O/dn/hFcUuDGfBkFKM4PlLjgfEdkJ0xqk7L7jUkaYooB3cNtu4kOKwNAR86Ux8Twvwud2iMij+Zj2Ut4gyQrKx2OVe28Qfa1YWiZ8EsDGMbAGakqeS0lEjQN7jAnHtddFm4AOb5+uZwo
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006)(5023799004)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RzFtMjJ5M0ZFYjVuY0pJZUFMNmova3M3M29oWDBXYlRtYk5RUmx3eEs3Z0VZ?=
 =?utf-8?B?K0p6anYrSGE0SnZKTkZhNDZvQm8wS2tuRzZJVmNkUGROam9kMFNGb29lMWVn?=
 =?utf-8?B?K0MwNlNiV1J3bnlEMUtOclVYT1ZiZTJ3cU1yV1dmRmlPZjJqaVRsL3pNZURK?=
 =?utf-8?B?akF0UDJ2T1JoMW9UamNBclU3RFF3akUzcGF4SFpJTS9NU0ZBbXVEdFJpeUZX?=
 =?utf-8?B?UXBOOVdIMVIrUlpuYXA2OHVicEtDS0kvNHJ6ZWtERk9zNEd5dklXMENiV0pn?=
 =?utf-8?B?VHVFVzN6eWd3M3pYOFp1bFZ4U2RBZjlGb1JhYzBJZHhMaWZ6WUh6WmZQZ0ZO?=
 =?utf-8?B?Q3BNeVQ5ZXcrSW9JMmx3WVBDNFNTODkxY3M0Q2FtRDNLZHVPa3I3OExxZUFN?=
 =?utf-8?B?c1Vja0ZCOG1jVi9ReCtKK0NBSndTT1JDMVl6QUlpc3lpUzhOTm5EcmVUeVlY?=
 =?utf-8?B?VHJUcUJwbTloai8vTjVocXJORnBkaDZNS3NHWUJEUDZDYVAvRU00WEtoV2FP?=
 =?utf-8?B?Z3NScmN6bWZJQ3FvN1QwYW9LaTNLeEE1a2hZalovSzZxU3grZmhGSmc4L3hz?=
 =?utf-8?B?UkhObmFiVmNnbGRKRFQ5cG1aSmozWVNuQ2luZW5Ka1VwZkgwSm85cVJ4REdU?=
 =?utf-8?B?bmJ4T29hcCtHTDA0TGQ5R3hKaEJkSVQzU0RzWlZJVzd3alhMN1NVeHZEUTBm?=
 =?utf-8?B?TUg2YSsxZUZHRUx0NUtCZ3NCUGgwaldjR0toRDFFa3JJRDNmdG9laFVReHNM?=
 =?utf-8?B?ZXA2OWJlajJzUDNtbWU4Q0NYN0NwQW96NG9NVzFwMVArOWN1bi84SnFCL283?=
 =?utf-8?B?S1JUcnVxOFdZSG5hc0dhdnVRRDFDK1JkczV6NHpPMXFoWWZOQzlaTERZdUZN?=
 =?utf-8?B?dEYzN3p3UnJ0SWVMRzZwSXVvN2QyMkVZWEF1eEVvemRMQmhMRjJqYndJL3U0?=
 =?utf-8?B?WkFreXdYVk5XOEJCNkR3VSs1R1A1UFl1TjYrQ3dWbTNZMkZwVXhZYjZ4M29C?=
 =?utf-8?B?ZUxFY2dIREdQbHdDNUdCNHRzT0xpZ3liNTN0YkRwaENGbTE1NTY0Q3VoVk5P?=
 =?utf-8?B?MjJvYkk5dzA4L2ZNemdaVXBNSG5zRDNBQjlpMWdwWVFvYThHY2huREZPYzZU?=
 =?utf-8?B?QXdUbGN4cWRnTEVqa2owa0ZtM0xkVkFKQVkyc0tIQ2ZUS2xuK2szSUVsY1Yw?=
 =?utf-8?B?UTVwWnorQm1oR1ZadkhOc2ZGNE9aWHo4dHl3b0N0UGhkVWhxcnFFaDk0WG5P?=
 =?utf-8?B?RHFXUTdXRmZCL2hSZldQYkRhQTFzOWZCaVFnbmtLS1c3dVJJc1F4eWROWTFE?=
 =?utf-8?B?bWJQaG9USnJ6L1ZoMkttRk56R0YrQVpIMDNKcEJENlUydnc2N2FKbUJqbGhn?=
 =?utf-8?B?Q2R3NUNTc0lUTTF5QjlQYWVkVmhTa3dNOWhJMi9USXI5bVV0SCtSdldDSm5u?=
 =?utf-8?B?WVJQMlZicTNNOFJ3d21hL0doYXFCcTZNZE92VTdyWmpIZC9iYmdCS2hVVUpr?=
 =?utf-8?B?cERXOGNEWGJWbE9KYUhDSlUvQUMxcHNOMld3dE9LV3Rvak0reS9EZkFHSmds?=
 =?utf-8?B?MExBTG1jVFl3amFYVUpwN2JJN3cxYkNWbDZMbXVtdkZFd3NEbjQyRG8yWlJq?=
 =?utf-8?B?ZlpNVUZWc3RVTDZMZHVaTXBiV24zV2VSL0RTVXAzU25SM0FuQVhwekpveTEv?=
 =?utf-8?B?d3ZoRDZobUhTaENtSFFINFNaUENNWHhndGc1cjZGRjdtcmZOTVBTOGlKQWpJ?=
 =?utf-8?B?eEltTGVCWGxwN1poLzZpR0ZCaHBwaUJUaTA1S3JCVjdkc0t5ZHh5c0Z3M0FP?=
 =?utf-8?B?ekExazZja2NiSloyYkx4TFllNlJ4MnZWZkRwcW5YL3hNOVk0c2hrT056RGFL?=
 =?utf-8?B?NjFwaHlTWG0rMXlDd1dYWjFOQ0dqK3BvbGgweFRZVUcwVldwSEpnd1l1Mm95?=
 =?utf-8?B?V045dXczSFVvTzVsbXc3Mk1GRUNUR3EwQ1hVOVdxZmx6dkpMMmFzSUJORHB6?=
 =?utf-8?B?RGhSTHBsR3Z2MXVSRUtWVGI0S054cGt5Q0hKVE9oS0VHMkpBdmFJVWl3OEUz?=
 =?utf-8?B?Wk5Pa2dRanpQZWtmUWZabnVqNlZXWTlJZDhacGUrNDE4ZXg4eDBnV3g5Wllw?=
 =?utf-8?B?NzVrMlJwcDlXdTZONGJDKzQxbXp0UDA1QTZzMkFFVE5YdkNBTXVTRDJwLzFs?=
 =?utf-8?B?dWhnZ3o1MEZRZGNsRHZsdGVvSXR0Q2FETkhiNnE4amV0dURkam92bmVQL3dR?=
 =?utf-8?B?SmdSM2hDY2JDRDZTQUxMRjFhMm9BVmphU3VBbDlsZjhncmo1R2ZHVWZVQnI2?=
 =?utf-8?B?a2NqaHhyU2psTXlROTdVNkpLcWpsQksvWnUrczQ1RUdrMXdHSHFPdz09?=
X-Exchange-RoutingPolicyChecked: tI2b8Bl4Xdb2wDPay+lmH6DA2gPpw+DK6tJZ3E5np1BG5BDJVb9/TVgBF7PzNayqadBLleatnCrG/ScxQymRXb0ZtqrwhH1kQZGFREjK/RNb9jjg4+x2SWR2yT8SdU9PHAT2/WqJ8uUdcAsOP5+mqk5P+hMKhV1AtDZwIeWNOiZmOgdTnaoc56Fchlqq3VY0uTbs9fXVr8mLSGmO0LQxNhegGYWLvg7nqZ3dvL82mWyrhGnzTjC9XJtAPujTlxk8zK6hJUwoabQqnlR1eEG4IItGqef0MNMK8aegZwOVtCM/69iA3vktFXcyD4f5wR7tjIu8a9RlpDXw7hPHyp9A9Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9778cd39-a521-4927-344b-08dec2235ebb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2026 10:23:50.4798 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D5rAoNPV8puMLCRLc1qPcdRDsr8KA+s9+RFu8NrKgP6GfgJW7tw3QvQ7aIzD6Mq+9oFnnY0rta0M539NCc7R/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6616
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 5/29/2026 3:47 PM, Mallesh, Koujalagi wrote:
>
> On 25-05-2026 03:36 pm, Riana Tauro wrote:
>> When a fatal error occurs and the error_detected callback is
>> invoked the device is inaccessible. The error_detected callback
>> wedges the device causing the jobs to timeout.
>>
>> The timedout handler acquires forcewake to dump devcoredump and
>> triggers a GT reset. Since the device is inaccessible this causes
>> errors. Skip all mmio accesses and gt reset when the device
>> is in reset.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> v2: add check in worker (Mallesh)
>>
>> v3: add in_reset calls (Raag)
>>      rename in_recovery to in_reset
>>
>> v4: fix typo
>>      combine gt reset log (Mallesh)
>> ---
>>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++++++++++++
>>   drivers/gpu/drm/xe/xe_device_types.h |  3 +++
>>   drivers/gpu/drm/xe/xe_gt.c           | 14 ++++++++++----
>>   drivers/gpu/drm/xe/xe_guc_submit.c   |  9 +++++----
>>   drivers/gpu/drm/xe/xe_pci_error.c    |  3 +++
>>   5 files changed, 36 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.h 
>> b/drivers/gpu/drm/xe/xe_device.h
>> index 355d69dc8f54..765e90f4220f 100644
>> --- a/drivers/gpu/drm/xe/xe_device.h
>> +++ b/drivers/gpu/drm/xe/xe_device.h
>> @@ -181,6 +181,21 @@ static inline bool xe_device_has_mert(const 
>> struct xe_device *xe)
>>       return xe->info.has_mert;
>>   }
>>   +static inline bool xe_device_is_in_reset(struct xe_device *xe)
>> +{
>> +    return atomic_read(&xe->in_reset);
>> +}
>> +
>> +static inline void xe_device_set_in_reset(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_reset, 1);
>> +}
>> +
>> +static inline void xe_device_clear_in_reset(struct xe_device *xe)
>> +{
>> +    atomic_set(&xe->in_reset, 0);
>> +}
>> +
>>   u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size);
>>     void xe_device_snapshot_print(struct xe_device *xe, struct 
>> drm_printer *p);
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h 
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 714d2e25d3b0..f64e1a149cee 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -483,6 +483,9 @@ struct xe_device {
>>       /** @needs_flr_on_fini: requests function-reset on fini */
>>       bool needs_flr_on_fini;
>>   +    /** @in_reset: Indicates if device is in reset */
>> +    atomic_t in_reset;
>> +
>>       /** @wedged: Struct to control Wedged States and mode */
>>       struct {
>>           /** @wedged.flag: Xe device faced a critical error and is 
>> now blocked. */
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 783eb6d631b5..d904527a8898 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -917,6 +917,9 @@ static void gt_reset_worker(struct work_struct *w)
>>       if (xe_device_wedged(gt_to_xe(gt)))
>>           goto err_pm_put;
>>   +    if (xe_device_is_in_reset(gt_to_xe(gt)))
>> +        goto err_pm_put;
>> +
>>       /* We only support GT resets with GuC submission */
>>       if (!xe_device_uc_enabled(gt_to_xe(gt)))
>>           goto err_pm_put;
>> @@ -977,18 +980,21 @@ static void gt_reset_worker(struct work_struct *w)
>>     void xe_gt_reset_async(struct xe_gt *gt)
>>   {
>> -    xe_gt_info(gt, "trying reset from %ps\n", 
>> __builtin_return_address(0));
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +
>> +    if (xe_device_is_in_reset(xe))
>> +        return;
>>         /* Don't do a reset while one is already in flight */
>>       if (!xe_fault_inject_gt_reset() && xe_uc_reset_prepare(&gt->uc))
>>           return;
>>   -    xe_gt_info(gt, "reset queued\n");
>> +    xe_gt_info(gt, "reset queued from %ps\n", 
>> __builtin_return_address(0));
>>         /* Pair with put in gt_reset_worker() if work is enqueued */
>> -    xe_pm_runtime_get_noresume(gt_to_xe(gt));
>> +    xe_pm_runtime_get_noresume(xe);
>>       if (!queue_work(gt->ordered_wq, &gt->reset.worker))
>> -        xe_pm_runtime_put(gt_to_xe(gt));
>> +        xe_pm_runtime_put(xe);
>>   }
>>     void xe_gt_suspend_prepare(struct xe_gt *gt)
>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>> index afd8cc7bd231..f21a1f709c4a 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> @@ -1514,7 +1514,7 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>        * If devcoredump not captured and GuC capture for the job is 
>> not ready
>>        * do manual capture first and decide later if we need to use it
>>        */
>> -    if (!exec_queue_killed(q) && !xe->devcoredump.captured &&
>> +    if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q) && 
>> !xe->devcoredump.captured &&
>
> nit: Check the length.


Length is within 100. Don't see any checkpatch warnings.

Riana

>
> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
>> !xe_guc_capture_get_matching_and_lock(q)) {
>>           /* take force wake before engine register manual capture */
>>           CLASS(xe_force_wake, fw_ref)(gt_to_fw(q->gt), 
>> XE_FORCEWAKE_ALL);
>> @@ -1536,8 +1536,8 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>       set_exec_queue_banned(q);
>>         /* Kick job / queue off hardware */
>> -    if (!wedged && (exec_queue_enabled(primary) ||
>> -            exec_queue_pending_disable(primary))) {
>> +    if (!xe_device_is_in_reset(xe) && !wedged &&
>> +        (exec_queue_enabled(primary) || 
>> exec_queue_pending_disable(primary))) {
>>           int ret;
>>             if (exec_queue_reset(primary))
>> @@ -1605,7 +1605,8 @@ guc_exec_queue_timedout_job(struct 
>> drm_sched_job *drm_job)
>>         trace_xe_sched_job_timedout(job);
>>   -    if (!exec_queue_killed(q))
>> +    /* Do not access device if in reset */
>> +    if (!xe_device_is_in_reset(xe) && !exec_queue_killed(q))
>>           xe_devcoredump(q, job,
>>                      "Timedout job - seqno=%u, lrc_seqno=%u, 
>> guc_id=%d, flags=0x%lx",
>>                      xe_sched_job_seqno(job), 
>> xe_sched_job_lrc_seqno(job),
>> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c 
>> b/drivers/gpu/drm/xe/xe_pci_error.c
>> index 7e714a02feb2..8792ccfbddf2 100644
>> --- a/drivers/gpu/drm/xe/xe_pci_error.c
>> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
>> @@ -20,6 +20,8 @@ static void pci_prepare_reset(struct pci_dev *pdev)
>>       struct xe_gt *gt;
>>       u8 id;
>>   +    xe_device_set_in_reset(xe);
>> +
>>       /*
>>        * Wedge the device to prevent userspace access but don't send 
>> the event yet.
>>        * xe_device_wedged_fini() releases runtime pm if wedged flag 
>> is set, so acquire a runtime
>> @@ -89,6 +91,7 @@ static pci_ers_result_t 
>> xe_pci_error_slot_reset(struct pci_dev *pdev)
>>        * TODO: optimize by re-initializing only the hardware state 
>> and re-creating
>>        * kernel BOs.
>>        */
>> +    xe_device_clear_in_reset(xe);
>>       pdev->driver->remove(pdev);
>>       devres_release_group(&pdev->dev, xe->devres_group_id);
