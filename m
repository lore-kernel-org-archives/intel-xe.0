Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE9AC5CFDB
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 13:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCCD910E140;
	Fri, 14 Aug 2026 13:46:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LR61iFO+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511AB10E140
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 13:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786715191; x=1818251191;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Unav5h5HdoSswvk1VADOTo6zsaKp1tVFjg20384oZCU=;
 b=LR61iFO+eXtwKiX2rj2pAEh18+TVnA5JlDtBX8/T213b8XXwoMVah3mD
 UJkwcmx0wwc4UbPg3Jl19TMW2DRLG492+0/PkRt4IbNto29VZwged7X7d
 NAH5KxEQL5QQddgpjXg+2t/aR9RZiMGIv1WoFXNcB342zj1+l7L4g4UfE
 +ehAs0DuX7l9vGO4gftdPtiwUypR0stemsXyOf2T2lZ86wENtsNmFttzj
 WS5Wsqq8yOZBirujMalUcONfj5WVPa2gOfgcbK2u9oiFb6hQJ0KGkVrQR
 fuNYBF4f4AhfD07Gc+CSWaTc8oCoxIdb7W5sD3PVNbf1tLMLG9W4OeTDC w==;
X-CSE-ConnectionGUID: KPU0ei1gTqmF7fhMUlKiQg==
X-CSE-MsgGUID: Yv8O+sSAS/+ftpxjTByWyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87217245"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87217245"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:46:30 -0700
X-CSE-ConnectionGUID: zJ0rGycYR6upCfy7+lgWAA==
X-CSE-MsgGUID: Ry6FxyPoRPSyocAVXMJoWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="268086468"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2026 06:46:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:46:29 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 14 Aug 2026 06:46:29 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 14 Aug 2026 06:46:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XXe1Sb5aWJa6s5bSFfWGNtSd41eJyQmMrloPlqpwF6YfxoAQ44lBPDdcQ09xa1AGrCEdJAXDgDGiQCFdTj9W2pehEuIIqE3Cwfj6ehazmxXHdRV17FNUKIN2UIXBrYidSsQSHknKGGR9UDvGNUhetmqZYnkZ2Yqs2ieh2y7ZiDQkHL/XCiFVkYeC7e6GUrbDZVgmu/EWeeDwOV5B4GCgP/UbfkMDl+EcTC/rmFX6DND3YWvrurTipozmUQaN+KPcJmbokanQXZpKoOFAhOehG8pIT309VWS2HqPSf8Ze/Sl4NpvhHzmyoLrqRA6GZaKMOg1b+WH7S67D/CnUzfXQRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=daB06aY7HOeQ1YQZWXhPqF76VnrN3rCQPcEKZtuD8aI=;
 b=JDhR0mL1LK8h+qqzMUlhJ+c7s3/BUve5QLMorq18dGVscvhvoIdSPgmcoPi2rGMsulBcy2RVxOihXS8CQt3wxmf8O0AkAk/cWgPXooH97xdKxmX+PDA5CUrbIHkY0WRiSwKdh+/KYw658bkh20YXxkrKKB27Opx76y1l+8wo9ZvkaRphJZeofGFVkbHFHY42hXHgxBrRWghcPfjzRYGFA14E7CU1ly2goB8kcycvUZ5yta6fmZ3WZeLizF4E/jBk9j3Ycrz7V89HoLAVtlkfa/DmFcl7cH8IAKcKYGHxARz7tGM0Jl6zENOVdS5cOcDI/jcQ9unJoYzrHHSvF1K4Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB9728.namprd11.prod.outlook.com (2603:10b6:510:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Fri, 14 Aug
 2026 13:46:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0315.011; Fri, 14 Aug 2026
 13:46:27 +0000
Message-ID: <460db56b-0c75-4ca4-b851-36ace8faccad@intel.com>
Date: Fri, 14 Aug 2026 15:46:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/32] drm/xe/survivability: Report 'Runtime Mode
 enabled' status using SIGID
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-24-michal.wajdeczko@intel.com>
 <f203ca92-c042-46e1-be7d-773f63d9bb5f@intel.com>
 <d2bd1735-94bc-44cb-8fd2-dbde99db4ec9@intel.com>
 <5db999eb-2925-4301-ba60-8b90f56f8a5d@intel.com>
 <42553db5-2467-4891-b579-431ae9fa1e4c@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <42553db5-2467-4891-b579-431ae9fa1e4c@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P189CA0020.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:802:2a::33) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB9728:EE_
X-MS-Office365-Filtering-Correlation-Id: 32e5b484-5af6-4c20-f66f-08defa0a7007
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 94HyCOJwfjo2fqtMRst0oUkiC0V7XHBLmsS7YljLTlCdN9ws8U4FvSF8TPWnEAsJ0ZzQiiy8lpjjlV0kHuTnwr/f6DGhbFsryA8o01QjdgWhCMnSqn+lOekT7CaxOnvEZnTjVgh2sy87Yxsiy2xnPDU+wUFDDMe3/LIcTOmIwT/CxTFZSeHWO2IJ8w5nGOj2QNFXRPsxUvd5I9ckkSMzzPx8JdFcmW5wL8XFcJ7DVtGduNzLvrSHEzPql3fDoVkd/PL0AnnKD7y0ZCuufjv1/ez6govul6/i9IU1Y/oA8aO8gFuGK/c8X9KtdWqRY+SFztvsY4v2E5iYLw9mXhFkX5soQITaFHk5dZ8jzPcWFshb1BK+za12DNlzGljvrJsL+87lJ0C9LpEGzwx1y93Zj4AdPvfe7EnnGUkwaYK93cOOojB2ur9E9OqXAY5vtyAhkcn7DTMRbyRJfkosSoBhwR5Pcv4zqlZGPDkqQ0w1YXlTKSisiqCjlhXMDHb2qETytUX5EycFkV7pwInE7bAJ+/3Y8+MhMclu6g3rlKXkrzmmK9CwAEmcBnqfQGS8D+66CmgAjNdN31lVg+74UVuq1o8Jl4l9PvZGX9Fi1bSKXB7wdkHcNELpZvzhuVxaXjN/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDdPTEVxbk8wY1BzMFB3Z3pWdHRtSkwvVUo2NXlCVENKUEtoMXV2T1VUYjJR?=
 =?utf-8?B?ekNNanpBd2pCQXczc0svSkRMSmd1VnVwVHp2QWtxbGJQY2ZsTkJEcVAvTFFV?=
 =?utf-8?B?USswZFVLZkJoT3BGdTdmQXdTSkFJS2YvQm5rWnU0TWVET1htMWFNeWRKemRj?=
 =?utf-8?B?WGZqeDU0dWF5U21PT0tWUHUwQXdNWFJ3dkZ4WkhycC8yNjVvY1lJMFljRXds?=
 =?utf-8?B?a1pramkxYTdxRDlRRkl1cVRMMlM0SEpuNG1adHlybTByYzZocUFMeWlFUXNm?=
 =?utf-8?B?NUFuVS9tM3lDR3ZUYytiWExqMTV2NlMrTUtidWhVWHN2U0RTdWNWaWxlL0Qz?=
 =?utf-8?B?RzZjeDJobHhkUXIrQytKS2tjL29JbGtqV2h3RGtvVTIxbUFoUlppUGJBS1Zj?=
 =?utf-8?B?L01CaUhtclJlc0J0d0M4TmpLc1lmVXREbGJQSUJRUDlJdmpKWFBHTDBQN1Zo?=
 =?utf-8?B?ZDFQeTQwNVFhQk5MWWN0L3V3S1d6WnVCVFRyM2NTejFKOHdaVEw0bHU0akRI?=
 =?utf-8?B?d2FuR041dlpXUFRkWUk2ZUY2SHVCUWdjNS9NYUc2TzR4QlBKeVJ3QUpuRzRS?=
 =?utf-8?B?b3ZaNThFZGtmZWVTNHc2TTA3aEoyOUJoQW1zMlBoNDNLZ1p3M1RmdmFGaTNw?=
 =?utf-8?B?azBSWjRsTXpVS2VqUVgxamFIcnpnUGpqZENxUVR3Zk9xK0RuQUNJYzFpSUw4?=
 =?utf-8?B?N0Nnam80L2tuNjZ1OUR0S3NuUDFzNlZiRkVBbEIrdlpqdjFpeEMwK2xWTjJ4?=
 =?utf-8?B?VmxRcWFiRXJJREVWbXhKazVrUFZhdi9qV1RXTzR1Sk9MbTBEWkFacmpTNzJx?=
 =?utf-8?B?MDBQT1JKMCtFVlZLSW5HUExia29oK2NBWEFVTEFRbUlBOWdkTVpENjFpNDE3?=
 =?utf-8?B?ZmoyNmEwVzJYOGduUXlrWFQ1S3FEZ1VNdEVxUWJGU0pnUVVkL0xtbk91REk1?=
 =?utf-8?B?QXNCR0Jpcno5UEt1VGYxQzFUSWt6aHVwQ05vb0RKalZZZUI3YjNSQzdyaFBS?=
 =?utf-8?B?MVp2cHRaRHV1MlBpKzdoZFg1blpuY0R6cm1TcmcrbVhzYXI4MlZFMXRLMUJY?=
 =?utf-8?B?dE1SNEtqOXpaVENuc3o1NVBUeXA0WU9BN213NmVlVjRJbXdNQ21LazZqTDZM?=
 =?utf-8?B?blYzKzd6K2o5YUYwT0RSc0dXS2taSW1HQXd2ckpodEs2TXNCd3BmdGNQVTJi?=
 =?utf-8?B?WFNOUTN1a3VnYnhBaGphaHZ4ZkRsTG1KN0dJOGpUb2tuSUdmY0phQXRnVlp4?=
 =?utf-8?B?dS9yV1d4OWI4T2dxK1luQWFpR2RtMW0vVU9yM2xqamJSWVBFNDRRU2FuOTBi?=
 =?utf-8?B?Z0hXZlNFd3gvMFJZVTYraWx5U0hpcHVpNkxKTUtySDdTQVJncXFzWDQvOGVS?=
 =?utf-8?B?dkQwc2M1bERPZHNsRWZkVFJuZHBFY0djS3BLKzNKK0ZHSndaRUNyYmVzemtY?=
 =?utf-8?B?UTBlZ1FIWmRZYmhqQjAvOWhkcXRPRmVVYmxkdmpGaTZqaGo2U0Evc3BoK0tP?=
 =?utf-8?B?blJJQzFMbzRMMGxMK20xT0tjNVBXT3JKVlFoNUxIYW1ITGk2NHF1OHZKWWFN?=
 =?utf-8?B?SXN3MTRkbHVNS1p1SFdDaHZTeVFZMURkb29ZK2F5QjZCY2p2dFo4ZmlQSEE0?=
 =?utf-8?B?ejhpY1U3QjN1Y3BoWVZmS0QzNWlwN1dDRUhSVlVOVGgzOFhTRmV0bkhDR2N3?=
 =?utf-8?B?ek1Dekg2cldBMDRVWlZxUHpUenlRY2hvVUdlOFFOMXpGMHV2UG4vRWVDbXRj?=
 =?utf-8?B?SEJFK3l5anplMW10aTFESHhScGRGME5DUmIrRmxtRjhBSUNDNjRGVmhZY25F?=
 =?utf-8?B?UStlRy8xaWlvVlNhb1hUczByTkJhTjI5OFNvN3JPc0tXcUg4d2xiaGprTkJG?=
 =?utf-8?B?NkNjOXI1a2RJUTJGL2hwcDZhZlcxREdYT0Q3TzNYVTY3UUhBQ0dBdHM5Qzl3?=
 =?utf-8?B?UVdocW9LWXRISUdmUTZCMURkKzZKeUtYRzhiZ1M1eFBwVWRNcENTenUrLzE1?=
 =?utf-8?B?aHJKeHlHelg4SGhXV200cGxiVllQUnpvWk82N3h6VTBqT044NXNvS25lSmVm?=
 =?utf-8?B?dXdQNmwxUWZtM2RPaVk3VTNVZnc3ZG5FNGUrTU1UVFArVUIraXZIajl1M1RY?=
 =?utf-8?B?aFEwT0pLQ2JHTXpxRmplNFR5VktRYnhyMFU0eXlpNWh6TC9wY3RWSXpPc2tw?=
 =?utf-8?B?NzNxQm41bUpYdVVGS3dpaUx0K1lxWEpLeFFocHBrSWlQSzBsWWdwZCttUWFC?=
 =?utf-8?B?ZDFVNitlaTFLWGtKc1BaN3NEWnE0ZWppOFBOcnR1TWtaQTJSNnlDYkxobnRj?=
 =?utf-8?B?amZrNmdyNnF3R1hLVVBieDl6aE9XUUtLYUVyV3JNQ0N2U2RUS3IyQkU3U3Z2?=
 =?utf-8?Q?tZrGufpG7pS/kC0c=3D?=
X-Exchange-RoutingPolicyChecked: aJfiXVBccNdOwj3BlYjjkhDNK4Zz8jia1xk3QSVqNbFpEJhuZ0y91/vm3YePKDtuSru7HW3CIrYGCOql2ZFoOD6MV93UFx6okM1g5CiOJhmv2eRxzGwOs0kZU0/OS4TixT1//CbcTRF+M8eFNog8Oh74PuVk8P2GZZidHDgQDjB94yn8GyCAZ0LwK0Hv1hEnR/d36vFCv6yhaRFRIWOH+SJleIvdstcBo0NMSBx0PVEFyyAElJ7+GOCP8kNcGV6DLDTzjTnzfQFVnjUwfagg2gHR4Jpr/adfa8tC6WE5IPkZ3796PBBpvHEMFVU8u5ZtkZ1Uzcz/tjYs7VJqR1ZmQg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e5b484-5af6-4c20-f66f-08defa0a7007
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 13:46:27.1333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUAOe2nwCBbfJzX7gHddHoaXC/4l5Nh8+ETwOpGxn8qiB29ONhZ42JY8KdqUUYl5TaLCStT7Ka5WxGKjpVP3ItR69FJgttYBmE9c9/FBDNg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9728
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



On 8/14/2026 3:00 PM, Mallesh, Koujalagi wrote:
> 
> On 14-08-2026 12:36 pm, Tauro, Riana wrote:
>>
>>
>> On 13-08-2026 18:16, Michal Wajdeczko wrote:
>>>
>>> On 8/13/2026 1:40 PM, Mallesh, Koujalagi wrote:
>>>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>>>> Report 'Runtime Mode' status using various xe_log() helpers.
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_survivability_mode.c | 10 +++++++---
>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> index ebd288986c11..5d3315ac735c 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> @@ -18,6 +18,7 @@
>>>>>   #include "xe_mmio.h"
>>>>>   #include "xe_nvm.h"
>>>>>   #include "xe_pcode_api.h"
>>>>> +#include "xe_printk.h"
>>>>>   #include "xe_vsec.h"
>>>>>     /**
>>>>> @@ -405,7 +406,7 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>       struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>         if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || xe->info.platform < XE_BATTLEMAGE) {
>>>>> -        dev_err(&pdev->dev, "Runtime Survivability Mode not supported\n");
>>>>> +        xe_log_err(xe, SURVIVABILITY, -EOPNOTSUPP, "Runtime Mode not supported!\n");
>>>>>           return;
>>>>>       }
>>>>>   @@ -413,11 +414,14 @@ void xe_survivability_mode_runtime_enable(struct xe_device *xe)
>>>>>       create_survivability_sysfs(pdev);
>>>>>         survivability->type = XE_SURVIVABILITY_TYPE_RUNTIME;
>>>>> -    dev_err(&pdev->dev, "Runtime Survivability mode enabled\n");
>>>>> +    xe_log_info(xe, SURVIVABILITY, "Runtime Mode enabled!\n");
>>
>> This should be xe_log_err
>>>>> xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_VENDOR);
>>>>>       xe_device_declare_wedged(xe);
>>>>> -    dev_err(&pdev->dev, "Firmware flash required, Please refer to the userspace documentation for more details!\n");
>>>>> +
>>>>> +    xe_log_info(xe, SURVIVABILITY, "Firmware flash required!\n");
>>>> IMO, we need to use xe_log_err (recoverable) here instead of xe_log_info.
>>
>> Same here.
>>
>>>>
>>>> Already mentioned in original changes [1], runtime firmware errors cause device unstable:
>>>>
>>>> [1] https://gitlab.freedesktop.org/drm/tip/-/commit/a2ca0633a0fef925a0d8125d8f3e4495a5ecb310
>>> but in recent comment [2] you said that Arch team wanted that to be logged as info rather than fatal
>>>
>>> [2] https://patchwork.freedesktop.org/patch/743324/?series=171022&rev=3#comment_1373731
>>>
>>> @Riana, @Rodrigo, @Aravind ?
>>>
>>> I need a decider here
>>>
>>>>
>>>> As I know xe_survivability_mode_runtime_enable function need to carry errno as parameter to pass into xe_log_err,
>>>>
>>>> however we need to create separate refactor patch for that in future.
>>
>> Why do we need error no here? It should be 0.
> 
> To pass correct errno to SIGID helper function.
> 
> btw, for that we need refactor code, which we can handle in future.
> 
> 
> @Michal
> 
> Please post complete code to check.

but errno-only SIGID helpers already support 0 as err
in such case, there will be just no "(%pe)" emitted
similar to what we have in case of info level helper

what refactor/complete code do you want here?

> 
> 
> Thanks,
> 
> -/Mallesh
> 
> 
>>
>> Thanks
>> Riana
>>
>>
>>>>
>>>>
>>>> With above changes:
>>>>
>>>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>>
>>>>> +    xe_info(xe, "Please refer to the userspace documentation for more details how to flash the firmware on %s!\n",
>>>>> +        xe->info.platform_name);
>>>>>   }
>>>>>     static void log_survivability_info(struct xe_device *xe)

