Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C59BC4450A
	for <intel-xe@archiver.kernel.org>; Thu, 16 Jul 2026 14:59:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B97F210E351;
	Thu, 16 Jul 2026 14:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8N4oD1S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BC210E351;
 Thu, 16 Jul 2026 14:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784213979; x=1815749979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vrXnVYVKbEimFlppVjfQ12z8nQ/5hsv7dRfew+IFmzc=;
 b=K8N4oD1ScqpJoVsN8uFpo1uVlrhsn/g7wu2LHhN3k8R+mFwPErVWKZ3T
 i1sy8YmtQG47xnw3of8xiMiCSEjHZjRdC/rmq5NxVKU4q/hVjModMeody
 dioEl4Lkite2/Q27w8DBXZkHMv768+Dcuhspr6R7uFW6qrW05WN+CTbYT
 v1KgdCMuK4eTI7B01PqxGhtXcD3kvfuXA65KwWphO348GDBbSeXumqi2Z
 7xFF43Tv+sKIcmlMK+9ZqQzTgAzERQgiVRxk/S7x3GCWkForW90v0LgTr
 Kd0sR172d4eqts9B/ppU2hfq6uxQX02L32Pu1WrbWHUiyBHwcV/6k90Dx w==;
X-CSE-ConnectionGUID: NgovR2EmQbS7NJ/T4fF1gw==
X-CSE-MsgGUID: DBbnwyUpSVWJQbXK9y8FXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="84756276"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="84756276"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:59:38 -0700
X-CSE-ConnectionGUID: aopNvNZwS9mF7833Ek16RQ==
X-CSE-MsgGUID: jQCeFX2YTYCZ0OvLTG6wjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="252538630"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 07:59:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 07:59:38 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 16 Jul 2026 07:59:38 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 16 Jul 2026 07:59:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wR8b5aa89d70YeFgCM/JDQnzWdcHQkASZXeCmfkP1RRhHdkfHYUdxYxfbpIgPvBWZ9IhQ1iLl5brirTlz0j5HxATZ+iVnKo/qudhkhmmdV3lY5F+80s7f90kiNShk4kIop29sjW9B6TaL1dnV0A4dij84admj1yl7/iJjoHFTLR6ESxrsY2hWGiA+/S4q+JF4ink/wWH5YKr70Q25tVpumfntNkQQ7UTPG4lnY2gGtYjuKXKN14L68ZnxHgFTOWKoCccaj30p+flJT3CKiW3GoQ4+gRmRpgi+No4Vo1xWWCd1lTY/ItO/vdmnjKftus/CSi8zTW/rrgIIAzbffLokQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HxhpnwwwKmZH+qfUetrkxauY8O0pjKpjdXcelM3HltE=;
 b=bedsnOA0RV5R7zc3xvn2ikuvtGVOtDJ4EPNnRMe2d5KN3vaEDFyN8CHsG7m7MCoSPgPmXPotPyvqUL4SknT5tblCZxxChlYDYDqTFcwdqLWLhO/G3YPk0cC0BjB2S6jDKKF6qMZha0t4jJtgLB2LlXqe8zDF7ryFyFY2GRMQRBcTfumGtM0Xz7mAyssDLpBgGKJyc70ZkDYeZKjEIDgQGlT9O0y6LHiXwX/rrZHeXRuGAu6lVUrzyOVo5sGVP8WiFQNyMOTjXop7Pcj1saabgf62yjp1txD3pQ3/uLlpKzdutlEVvYMRlap3WKSGPrTHtWJhEK6OZVgwQwHalugt9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH0PR11MB7636.namprd11.prod.outlook.com (2603:10b6:510:26f::13)
 by CYXPR11MB8732.namprd11.prod.outlook.com (2603:10b6:930:d6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 14:59:25 +0000
Received: from PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b]) by PH0PR11MB7636.namprd11.prod.outlook.com
 ([fe80::d611:6fa9:bc34:46b%5]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 14:59:25 +0000
Message-ID: <13b9c1ff-60f9-4a09-a386-ef2898631902@intel.com>
Date: Thu, 16 Jul 2026 20:29:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] drm/i915/vrr: Add per-CRTC vrr/cmrr debugfs control
To: "Naladala, Ramanaidu" <Ramanaidu.naladala@intel.com>, Mitul Golani
 <mitulkumar.ajitkumar.golani@intel.com>, <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>, <uma.shankar@intel.com>,
 <ankit.k.nautiyal@intel.com>
References: <20260714103938.2371448-1-mitulkumar.ajitkumar.golani@intel.com>
 <20260714103938.2371448-2-mitulkumar.ajitkumar.golani@intel.com>
 <c6731e27-483b-4437-a135-4ad535eed472@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <c6731e27-483b-4437-a135-4ad535eed472@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0195.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1aa::14) To PH0PR11MB7636.namprd11.prod.outlook.com
 (2603:10b6:510:26f::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB7636:EE_|CYXPR11MB8732:EE_
X-MS-Office365-Filtering-Correlation-Id: a6ee39d4-5514-4dc1-dcb5-08dee34ad3c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|6133799003|56012099006|4143699003|11063799006|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: okmUo5UkxsKvl9qqNap/d5JH/1Hw41QhhtW6FrhV/JJH6ItuqSiA9PwMijZ6UYazb3OAQfXUu+lC96mcBx19Yq/b0aUMbOUsMGONzviDpVrHXfWJpsv/E9XSKwzeQjjRg/urcUx50azdwZT66FlliaM2f9QoECXnqD7hF+JJopQIdVPPPo0YunT50YQQ+588N96R54H9HJK9e0l5OeylmHiTJNUYVPO67KY2Q9/K+bLCxbLjEwSVfKo1gpA0eKMzBRQqau6CkQ08pvcgLZWsModdeLJkFhPj4nz12F9CCDMiIUYZJZXSy+WQtCN3/C2uBYkDsR/X869HjnzwRnqIQvzZOpH9FxC/1pity0bTF4a73y2BYZxhMx+AsWf1rCd9BYuVThVsDba3SYpxznyH4MsKYXng6IHKLry+Jw6RPWH86u3mxLPqY4CDXOdOEE8r8DlJx5RvOQm+HtZ2w2kmGmWwzG40SvXqup1fuP90LZZ6NNG57wt7Dgwj73hsisK9Pm10RuI3IaTiKMDyhbSpmvWtGPXtGte2dJYYFAVY9quX1KiZUVQnOCEqMuZh7AXRAhe8EW7F/add83Zoa6iU+19ZA/tmwn1GQ2sWaoBV5xkSvNURhVnVjqiXIYEsWga3QuNb/GUM9MoFiZKWKySpmP5Ecmv9o0bI7t8GODFG24w=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB7636.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(56012099006)(4143699003)(11063799006)(10067099003)(22082099003)(18002099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3l1ZHdXbHVQNlN3a01BYnhwOGNHUm10Vi9mSmxiMVNiTlVaTzlKczZzVHVZ?=
 =?utf-8?B?S1N1QUpNL1h3OEFneXllb2tUcHl0LzAxQm81NTFZV3JiYmFkUlFjUzVNMWw3?=
 =?utf-8?B?S05KZG44MDZWOXJ4U3cvQjFNanZHOTAyMkI5TVVjR0hkd21Md2YxanZzRGwv?=
 =?utf-8?B?UTVRUzZIN3lmcFZ5YnZwVDY4QTBsdFI5cU41RDRYRnUvOHpUdk14c3hRVDFM?=
 =?utf-8?B?d3U3WFUvVzBWd0xLZi9hM0J2azdxMWZXN3F6WkovTW14L0hqcXhscHA4c0NY?=
 =?utf-8?B?Tzl5SlVvS2UrQldKNkR4bGc0SUwweXI4M3BKbW16TzM5K0ZIMjFtbi9oV1lJ?=
 =?utf-8?B?eWNyaWVEdmd3bUZkdU1TaXdZdHNmazJoakZYa3dnVFVtYXR3WlpzdEVPd2Er?=
 =?utf-8?B?bko3RmxOU0JwSUlvZ1hYbmk3K3RxWFM0alBUeHZNUmdWQjVMY0FQTDBoeWlV?=
 =?utf-8?B?YzRDZkRJUWtnTy84Y0hHeU9rMnRLVnVrb1dmYjVuKzd3RHBrNTFkdUt4dGFT?=
 =?utf-8?B?dHZ6U0ZKS0M5bkZNd2wwb2M0OTY4S2wvWVlOT3pOaFVDNnVRdXl5cjZIUFJx?=
 =?utf-8?B?dEdBczlsYU9TNDA1S1dZY3ZuZTZ6d3FmRG1qN1orbThPVUJCOEh4dTQ4WlRP?=
 =?utf-8?B?cGV0amNJWlZiek1yallLNlBaN0IxT0J1R3NGczFISDZXTm9RdjZmelFvMVRs?=
 =?utf-8?B?UjFPQzJjWnlERzR6Q0lJL29DaFh2SlcwZ284aEQ1bVpPcjB3UC96ZUJUakFv?=
 =?utf-8?B?VUhQT3NVZzk5SDhiM1ZoQjVwczNJNzNIVFRCT2NUTjBJQWc3d1pZQVdNb0Ux?=
 =?utf-8?B?Z1hPRjkrbW5OZm1RUWpGY3hTcnFKYS92QW1MZFlyNkFSQ3BQbFpRdjVvSGp6?=
 =?utf-8?B?aEJjVWIxOU1ieExTc0lHTDN1eVh3Q05LTG1wdkJJcnYrSlJyL0FkVlF2ZmpQ?=
 =?utf-8?B?bW1MRXVvTFZVdWVkQmpyQmluMVR1eUpLOXphWk9YS2QrNlN6NndXbFM1eVh4?=
 =?utf-8?B?SWdybDVmcWpqN05ncXNJcHU0NzN5Y1VHODdqWDRpc3ZFYnU3TlpLUVozN0xr?=
 =?utf-8?B?NkdJSkNIUkcrK2VLcjJaWDlQRXZ6Ync4STd5V2lJNFZSMGluR0pTNm40MTJu?=
 =?utf-8?B?S2IzTFNLZFErcW1EcldiRk1Oekx5M000SWd2NTVFYS8ybHFJa0ZrM0RNM0ww?=
 =?utf-8?B?T1hoMDNzdUJYV0VlZUJFeTBpTEFJeFllc3dGcThRQzhjc3hKZ0F2MEhYa3Q2?=
 =?utf-8?B?YmZwRnUyemZlS1VCSy9leTlJWUVDK0l3bGhxMCtYYThIeXZZVFVhWW9UOFZJ?=
 =?utf-8?B?Ky9CTktBVC9TMTBkandGV051ZG53Y2k3bS9yQ0ZwM3pGOWx1TXFKKzV5UVZT?=
 =?utf-8?B?dmNHekY2Ykw2S3pEN0dmV3lJSEwyS1BwU3dBS3VXZjcxUjdFYzVFM1JPbk5L?=
 =?utf-8?B?RDNoTStpWFRBZC9oakNZNFRqT3J0eE5qRWtFdWZVTVU0dDd5UGRpZjlkVFJU?=
 =?utf-8?B?a2R4S2hJN1BlU283bEk3ek9reWF3S09PNjYwWFpYZXh1VnllYlpVdHVtZDFF?=
 =?utf-8?B?S3pwWlZ6cTZLeTJaVTVaTmVKMmphUG5zUmZEVTZRSmpJcEhXcUpQdGc3UURX?=
 =?utf-8?B?S09XS3pqT3ZmUEVVOXFjQ3EyNkxXcEJ3VDJuN3ZiL2h3Y3hCc0RHMEFUMzBG?=
 =?utf-8?B?dkFEamMyQlhpdnVYMkhKazlXN3JHS0xvSHBteXQxTkZEMzdFdDNXYklBeWdt?=
 =?utf-8?B?cERlMnQ3aG5hYU5yM2tETlBPRkovNUh2cGZmZVV5YTZZWWJhOGtLZ2Z1ZVBN?=
 =?utf-8?B?RksxSllHNkR0SU5qMmI0V2k4c0wybU9ZdEZ2d0c4d2QyTFlWcHdTb3pRd2tB?=
 =?utf-8?B?S1hpeUZQK0dxd1Fvc0lwRDJ2RUx4cXdBbDNVSjR5RFRUWEtkeUdNb0RuTUdB?=
 =?utf-8?B?VTZBZDdKc2dTSTdyb1huWEFWZzFldEpCNXRDdHZicWw3cDZ6cGN0UkFjNVNQ?=
 =?utf-8?B?S1ZleUJrbFBnV1JGai9Za1RLcVMwdHJadEFzN0VuOUtySU4vdTNYYndsaUJ6?=
 =?utf-8?B?YWp2Ri80bEpKeGFrMW9EYk5KV0lQWk9LYzlncEJDWE9VbXRnWDY5ZHRhT1RB?=
 =?utf-8?B?SDhMNXJMa1kxN3k0UXJmN0xheGdlTitwVDZGWVJyZi9iZHhCeGliQ0JwTW9K?=
 =?utf-8?B?RFJWaENZUGFYQ1JoNDJpdmpsemdWbktGOE8rU0l3Um9CSVZ2TlU2YXdmMTUr?=
 =?utf-8?B?TVpLNDVzSDBFM1hQYkRlVVE2czZrOUF0aEdseTJzc01PYUpFcVgySktWdjU2?=
 =?utf-8?B?WnYyNUFOUGtaMkZ6Tjl6ODJPOXhTVFdKQURjRFZIVkVPUGMrYTRUbDFNdEF0?=
 =?utf-8?Q?KtJClKfFp4aDwqrY=3D?=
X-Exchange-RoutingPolicyChecked: V4WVA+1KRDz+uVU4s6erzvejlDhK8gUR4FBJCXr68Zj0TIA/HIbR7lP86sLDA0S16Fm+mFYPgpruikdOQdSbvvkV4vjYIZrzFuvT/fNxS5lNXFOaG4rgyL1CMD0o8PSXlkaMqjpIvh/dyEAq4XIJbCAN/a7RXzfg1AUERy/86gQYakSiaHiEYWVroe8oHg3QUByaoqbyNWjvEca93jBOcpRra/XHK12FXENUTDPerurQkjU2UJHKNDnke2dnPxzJ+nx9odu0792DxdPQOhN52A5duWwVuB/105p4tKnUlyLGLjaYU6fjK5FIipvZNlchur3p1oac013jlxZYFU3N9A==
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ee39d4-5514-4dc1-dcb5-08dee34ad3c2
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB7636.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 14:59:25.6045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Jv+ooJNAFx7RwLVE0VdZyjP+Pr2GRO5uG/O2Jfu4Sc5XTw34GCOIlBjxiC/yI5ambbiKzs3yE+Gbe2AN75gs9oHbOKtSibfda+oslrOcTXw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8732
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



On 7/16/2026 8:07 PM, Naladala, Ramanaidu wrote:
> Hi Mitul,
> 
> Resending this, as it was previously sent only to i915 by mistake.
> 
>> Add a per-CRTC debugfs file 'intel_vrr_cmrr' that lets the user force a
>> CMRR target refresh rate and video-mode requirement.
>>
>> The file uses a "numerator/denominator" format:
>>    - numerator:   requested refresh rate in milli-Hz
>>                   (refresh rate in Hz * 1000, e.g. 60000 for 60 Hz)
>>    - denominator: 1000 for a 1:1 ratio (no video timing) or
>>                   1001 for the 1000/1001 video timing
>>
>> Reading the file reports the currently stored values; writing updates
>> them. The file is created only on platforms with VRR and CMRR support.
>>
>> --v2:
>> - Drop the "vrr" debugfs subdirectory and expose a single flat,
>>    intel_-prefixed "intel_vrr_cmrr" file (Jani, Nikula)
>> - Rename struct intel_crtc.cmrr to force_cmrr to make its purpose
>>    explicit (Chaitanya)
>> - Fix parse comment: numerator unit is milli-Hz, not KHz (Chaitanya)
>> - Add debugfs/intel_ prefixes to the debugfs handler functions 
>> (Chaitanya)
>> - Expand commit message with debugfs entry semantics (Chaitanya)
>>
>> Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
>> ---
>>   .../drm/i915/display/intel_display_debugfs.c  |   2 +
>>   .../drm/i915/display/intel_display_types.h    |   5 +
>>   drivers/gpu/drm/i915/display/intel_vrr.c      | 103 ++++++++++++++++++
>>   drivers/gpu/drm/i915/display/intel_vrr.h      |   2 +
>>   4 files changed, 112 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_debugfs.c b/ 
>> drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> index 3f02868ef105..2bbf4760dc30 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display_debugfs.c
>> @@ -49,6 +49,7 @@
>>   #include "intel_psr.h"
>>   #include "intel_psr_regs.h"
>>   #include "intel_vdsc.h"
>> +#include "intel_vrr.h"
>>   #include "intel_wm.h"
>>   #include "intel_tc.h"
>> @@ -1395,6 +1396,7 @@ void intel_crtc_debugfs_add(struct intel_crtc 
>> *crtc)
>>       intel_drrs_crtc_debugfs_add(crtc);
>>       intel_fbc_crtc_debugfs_add(crtc);
>>       hsw_ips_crtc_debugfs_add(crtc);
>> +    intel_vrr_crtc_debugfs_add(crtc);
>>       debugfs_create_file("i915_current_bpc", 0444, root, crtc,
>>                   &i915_current_bpc_fops);
>> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/ 
>> drivers/gpu/drm/i915/display/intel_display_types.h
>> index c048da7d6fea..84a6d016e226 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
>> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
>> @@ -1546,6 +1546,11 @@ struct intel_crtc {
>>           u64 flip_count;
>>       } dc_balance;
>> +    struct {
>> +        u32 numerator;
>> +        u32 denominator;
>> +    } force_cmrr;
>> +
>>       int scanline_offset;
>>       struct {
>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/ 
>> drm/i915/display/intel_vrr.c
>> index 51e4f3309b8b..8b6e36ee9f55 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
>> @@ -4,6 +4,10 @@
>>    *
>>    */
>> +#include <linux/debugfs.h>
>> +#include <linux/seq_file.h>
>> +#include <linux/string.h>
>> +
>>   #include <drm/drm_print.h>
>>   #include <drm/intel/step.h>
>> @@ -1231,3 +1235,102 @@ int 
>> intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state 
>> *crtc_st
>>       return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>>   }
>> +
>> +static
>> +int intel_vrr_cmrr_parse_ratio(char *str, u32 *numerator, u32 
>> *denominator)
>> +{
>> +    char *sep;
>> +    int ret;
>> +
>> +    /*
>> +     * Parse a "numerator/denominator" CMRR ratio string. The numerator
>> +     * is the requested refresh rate in milli-Hz (refresh rate in Hz 
>> * 1000)
>> +     * and the denominator selects the timing: 1000 for a 1:1 ratio
>> +     * (no video timing) or 1001 for the 1000/1001 video timing.
>> +     */
>> +
>> +    sep = strchr(str, '/');
>> +    if (!sep)
>> +        return -EINVAL;
>> +
>> +    *sep = '\0';
>> +
>> +    ret = kstrtou32(strim(str), 10, numerator);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = kstrtou32(strim(sep + 1), 10, denominator);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (*numerator == 0)
>> +        return -EINVAL;
>> +
>> +    if (*denominator != 1000 && *denominator != 1001)
>> +        return -EINVAL;
>> +
>> +    return 0;
>> +}
>> +
>> +static int intel_vrr_debugfs_cmrr_show(struct seq_file *m, void *data)
>> +{
>> +    struct intel_crtc *crtc = m->private;
>> +
>> +    seq_printf(m, "%u/%u\n", crtc->force_cmrr.numerator, crtc- 
>> >force_cmrr.denominator);
>> +
>> +    return 0;
>> +}
>> +
>> +static int intel_vrr_debugfs_cmrr_open(struct inode *inode, struct 
>> file *file)
>> +{
>> +    return single_open(file, intel_vrr_debugfs_cmrr_show, inode- 
>> >i_private);
>> +}
>> +
>> +static ssize_t intel_vrr_debugfs_cmrr_write(struct file *file, const 
>> char __user *ubuf,
>> +                        size_t len, loff_t *offp)
>> +{
>> +    struct seq_file *m = file->private_data;
>> +    struct intel_crtc *crtc = m->private;
>> +    u32 numerator, denominator;
>> +    char kbuf[32];
>> +    int ret;
>> +
>> +    if (len >= sizeof(kbuf))
>> +        return -EINVAL;
>> +
>> +    if (copy_from_user(kbuf, ubuf, len))
>> +        return -EFAULT;
>> +
>> +    kbuf[len] = '\0';
>> +
>> +    ret = intel_vrr_cmrr_parse_ratio(kbuf, &numerator, &denominator);
>> +    if (ret)
>> +        return ret;
>> +
>> +    crtc->force_cmrr.numerator = numerator;
>> +    crtc->force_cmrr.denominator = denominator;
>> +
>> +    return len;
>> +}
>> +
>> +static const struct file_operations intel_vrr_debugfs_cmrr_fops = {
>> +    .owner = THIS_MODULE,
>> +    .open = intel_vrr_debugfs_cmrr_open,
>> +    .read = seq_read,
>> +    .llseek = seq_lseek,
>> +    .release = single_release,
>> +    .write = intel_vrr_debugfs_cmrr_write,
>> +};
>> +
>> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc)
>> +{
>> +    struct intel_display *display = to_intel_display(crtc);
>> +
>> +    if (!HAS_VRR(display))
>> +        return;
>> +
>> +    if (HAS_CMRR(display))
>> +        debugfs_create_file("intel_vrr_cmrr", 0600, crtc- 
>> >base.debugfs_entry,
>> +                    crtc, &intel_vrr_debugfs_cmrr_fops);
>> +}
> 
> The debugfs interface accepts non-zero values, but fails to reset the 
> value to zero.
> 

Yeah I think we will also need some magic value to let the driver know 
to disable the feature. Since 0/0 is the default value shown by the 
debugfs entry that makes the most sense.

echo '0/0' > <file name>

to disable the CMRR. IGT can use it restore the state after testing is done.

>> +
>> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.h b/drivers/gpu/ 
>> drm/i915/display/intel_vrr.h
>> index 55e9c429f579..19c7990be1b2 100644
>> --- a/drivers/gpu/drm/i915/display/intel_vrr.h
>> +++ b/drivers/gpu/drm/i915/display/intel_vrr.h
>> @@ -56,4 +56,6 @@ int intel_vrr_dcb_vmax_vblank_start_next(const 
>> struct intel_crtc_state *crtc_sta
>>   int intel_vrr_dcb_vmin_vblank_start_final(const struct 
>> intel_crtc_state *crtc_state);
>>   int intel_vrr_dcb_vmax_vblank_start_final(const struct 
>> intel_crtc_state *crtc_state);
>> +void intel_vrr_crtc_debugfs_add(struct intel_crtc *crtc);
>> +
>>   #endif /* __INTEL_VRR_H__ */

