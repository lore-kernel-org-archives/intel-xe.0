Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A76AFC44524
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 05:34:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C2BF10E522;
	Thu, 23 Jul 2026 05:34:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U7/YHhbg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CEF10E522
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 05:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784784878; x=1816320878;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=p9cvgnuelCC2w5euwyBVhKSeZqM3h/I57jyd1BgPspY=;
 b=U7/YHhbg5eKigJMfpct6RdXeEDKjm4USMN/ztcRVFW2YAANMa/x39zVM
 gmJhs+MCNtIiax8rXWh2DZ8uQWYCJv9kmjAkY8qd8zZ9+VaZWPLQTFoFF
 47mz37HLd0EnIB4mhmwyG00sXFCAaFfkoCpDHH7cXYW8vbSMSKWTU8TSu
 gO2egS+k+ICLNv2F4GB/m2Qc9b4g59fF0Quclj7lSRBLU9toSaxCgL+3W
 zw0LJ/fIK/6XDoqS5+DqaqS8Sj/8cqfdlw/piY3n7QnH3qLfkA/pvFnfq
 fBbdzcnqPNuF2uFG2bcqGb8jPJlgTNXEHG14Q3c2n7ql9Ln2H9U1g3/iv Q==;
X-CSE-ConnectionGUID: 9qQi2qJZRsGwVm4GGdjOtg==
X-CSE-MsgGUID: wplxBpYtQgmteLkkXLkjzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96571422"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="96571422"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 22:34:37 -0700
X-CSE-ConnectionGUID: lv+cMPleQIaNZqerW65xkw==
X-CSE-MsgGUID: DhEsG0RUSTihY8tDg7zseQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; d="scan'208";a="254375623"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2026 22:34:37 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 22:34:36 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Wed, 22 Jul 2026 22:34:36 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Wed, 22 Jul 2026 22:34:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f7GR/JfU/A0sdPIHqI5jndPX/oMnjB3KfHWh4WECztZTrHEAfEmtlRpACq+9luEV2+Bj03KM+3AYrGGxwv/PQAFQtMFAWJS91j9VttLrb6fV7MPwSlVhZwOuGtO8yJNZsnj/Ff0Nj0csdPJm4bZJ1lUhCFLJEeHY2FoUwfCMF7qGkSkpMFpyem5UK8lzDd7ndFUWoDkEWFA3Hmimvc++ndyowhTYtUXix51EKBH8fi7xQZ/1ssYR39ygSHoGfIOAJO7xNG7LaNsdsFD7JkFBpA3j+z9VNCxSsV4z+EsvnRv5PLP6EB2nOeaM6vZTUXMwxh8OFFN+6sp5mWMeiQqNOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RyxEMPCecvDm33OrwSFYOD/O+zelQ7bgAVQcC7esT6U=;
 b=oe6GwN6CqVF+JLFEMAt95Tjlfc3T9YNeFI7HigmNycZ8ZYBMvCUAIbQVpLrhAUxpyCACABuhiUF0ERZ8pByZObEILtSBpmXCjAESjejOdmQCrv3SKhJcGA7rRgbEm69TuZmXCFp5Fa/JF0w0qtmFcl+OgTrLp1MaXI6+r9C13wpDt/l6UwEJYXrPkUQYh4cMBYZeCWTMsW+9TWHB84m/4vWJhJ39nFZ/8xxG+4Wunx9VJvX9uUBbXKfG2Lgk6wcQUcYeGbFKFgaZVkg+ptZLVbzUsFlbaeWtihRy/u/5i9kgZCIR2AKboPSkVO7M1cX9JZk7E6CzXDfHKeDS7PqL6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8706.namprd11.prod.outlook.com (2603:10b6:610:1d1::22)
 by IA1PR11MB7823.namprd11.prod.outlook.com (2603:10b6:208:3f3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 05:34:34 +0000
Received: from CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d]) by CH3PR11MB8706.namprd11.prod.outlook.com
 ([fe80::e419:ae5c:91ec:1e9d%7]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 05:34:34 +0000
Message-ID: <81657587-8a95-46c8-8b61-fb0d9c5438ab@intel.com>
Date: Thu, 23 Jul 2026 11:04:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] drm/xe/hwmon: expose fanN_max
To: Karthik Poosa <karthik.poosa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260717041757.2759084-1-karthik.poosa@intel.com>
 <20260717041757.2759084-4-karthik.poosa@intel.com>
Content-Language: en-US
From: "Purkait, Soham" <soham.purkait@intel.com>
In-Reply-To: <20260717041757.2759084-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0234.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b1::8) To CH3PR11MB8706.namprd11.prod.outlook.com
 (2603:10b6:610:1d1::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8706:EE_|IA1PR11MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 675331ef-5819-4002-fdee-08dee87c13bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|22082099003|18002099003|11063799006|4143699003|10067099003|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info: UeYLLfd4VsJhzGjCWt/HNLl41q3xVHR7ndHEBanL04vpnYAQFdCeqgvFtgMhwTpMAbpZpWSMw5uy9qKUQdr+BNT09VtU51Hd+Dwnj9XfYosjsu2sUx1cBivxb1QxPd05MPMa8O9p0o4R1j7l3c1pOSbS5giApkYUVNnPyFLb/kZm0xuY+E91MVZeLMgx1pr74tpzyZKiGjmFBlp3+TAfo+aWTHl3hXiVtcYKM5z4uukG74VV8NueS99E0btSdlyEwpuunePvcZ8nfxq6p879H6vFz6Aw99NFxJcC4KczRyYlRp11CTB3ZHQivhyEuO+7NdsK/+AbfUZATCMk78iRRkFeCZ7Jl0sJHF6/NtE4MdO0duEDOEtIAlSAt4sp9VF18X8bC+Bu63PDfus6vMUL0cdQk5OEw38q1/TgDwmdJJBjcnytV9iXG48tGC1LXCaEvVaD5EAFavVHcdXacCV65naIfKihNKswQn64z6o97nbZc/h81LTssUx3YoV+IvQdtrsHxnvTLRwa1XMXLw81GObBtzx1LJ5nvV2l9KJ7/h/CEHWmc98jotmm0rhFrtf0Z1m9SCC/b+z/QweTvT566vP/1X46bv6kKtd+H36LG3GaUv3TdzCYKkUiGQbGMhIJnGeqWl/uQzvztEWrf9cnIRV1Nn/Cd1qQaGhCSaXwLWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8706.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(22082099003)(18002099003)(11063799006)(4143699003)(10067099003)(56012099006)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ank1OVo5MUQ1MWNWM3lHeE5kTS9BWXBhVmFFUzdKbS9PMWI0bmJzaUFJWTNr?=
 =?utf-8?B?Mzl0akVlbGJjVjNZaUpaMEs1a3FnNE12emdlallKYUhHN0JWMDFHTU1FdTVN?=
 =?utf-8?B?RnJpYjFHTWxhckUzck1FZkZTQ2x3Y01SMUVXd09ZZVFSUUNlU3RLdGZWUzN6?=
 =?utf-8?B?elYvYkNnOStLb1pTWnNoMUw5eVhrSUNlTGRncE5RTW45TjF1UlQ5empsM2My?=
 =?utf-8?B?VGFYSFNTOUVvdnRwTHpDbGdqUFo3ZU40MXBiS0ZrTDEyYTJ0MDhJOC9zSkRa?=
 =?utf-8?B?Rk9SVzJZNnAzaUlIQWV4N3lPTjhNdnY1SFFwekNFZmJlSGt1T3AxSml3MDZr?=
 =?utf-8?B?OFBwSmVnU2h1cU56Y0ZuZUxRUWQ3Wk1nWmQrSUpDdGVVekxndWpxYWRXdTNj?=
 =?utf-8?B?Z3lkd2lDY21wUWtJZjdCY1h3RGRtRFBaeEtCSmFhczQ4UW1BYi9PK2ZXeFFt?=
 =?utf-8?B?K0RhOXlCb0N6ZlFQZW5yS1g3M0dhekxxNFE4VFAwWlpidUpGUnVuTjdQMTdY?=
 =?utf-8?B?NlJvZHJJQlVKZ3g0NmtERklYWWY4a1BsNXQ4akxxNS8rNTZVSFJJSUIrMFpS?=
 =?utf-8?B?QmVzbU5VR3FwQlJxK3YrTnpob3lnV2sycWFud2VGVUdQWDNEeXBHdHJ5ZXF2?=
 =?utf-8?B?MWtxbmZkelcyZUpKaVVxeGFJV1Z0TGtlM3VJRWtmVSt1Y29wSDBXRlVGMmY0?=
 =?utf-8?B?QTNpR1FYRkttR2VKZ2o3VWxrZ1p4aTNXYXhtTEJGajluSVVGMDF6TDFMcncw?=
 =?utf-8?B?aVUyV00xTXVPeFpEeGhvdnlNNzJoL3BNMmp5S0lTNFRuai9kQjZZMjVXeEVV?=
 =?utf-8?B?QklidXovUWZ5NEJ3dDlGeFVSQ3dzZnZGT3pvOW5SRDlRaXBQdUtRL1BaZzY5?=
 =?utf-8?B?a21qdHNacG5KaEJDMGQ4S3J4UmhFT2p1UGlXUHVvZmhoL29sd2MvK3lmQTYy?=
 =?utf-8?B?QVlnOC9GMCt3MzRGd0doUHNKS3dUMnhLNW1EMDFXdEh6UDZmQjhIN0xzK3V4?=
 =?utf-8?B?M2VsZVlmTEFlV3QrazVjRW4raG0xb2plMG50VWN2anRMTjBDcDVvNGtxbDE1?=
 =?utf-8?B?TVRKOUFaYjM3UFFuSEhmZUIwcWwxNWVsU3NWRDFMYjh2T0JMbEJjOEJtWWkz?=
 =?utf-8?B?dm82MjNoRm84cFA4U2cxL3VoNjRtSjZOMnRKa1dmV0JPWU9DQjBmelFaQlFD?=
 =?utf-8?B?NmZ5b3JYdHd1WUVDTXJHSVhWMTFQeW5aci83Z1BLY3pZSlBkOVZ4RjAxVENU?=
 =?utf-8?B?Q0FFSldaejhrUzV4a3h5UHZHNnlzcUNBRm83SittdlBIQ3laV0k0Skd0QTRG?=
 =?utf-8?B?QWRWTGJ1cDN3cDZvamdLUWpIYm0zbkF4b1dBT2c5TDNJSVhNdU1KTXVRSkZx?=
 =?utf-8?B?ckJWZDVFSGltU3p5V0J0QWRvZFV5NFVkaVlPemZBUVdpdlVCQWFYSGFRUVE5?=
 =?utf-8?B?aW15TE81TVFZZ0c4N0NuemNZWStsYWtQbEVxdWZxcks1djlnRDBDclIvNjVP?=
 =?utf-8?B?WHZvakdaYVVRNXlxbTg3VHNCRVdqRHY0WHg0RnpjZkxiR1NhYjNXc1Vzek5E?=
 =?utf-8?B?TFFvNytBK0hpN1hLRXlnRnVOMGU0Z0F1Z1lWZE52MUg3Z2tpN1RlNFp0dDR3?=
 =?utf-8?B?WnZIcG9rVmhpeUxseUlCMnZEY0NHRGw2eWx3SWx1Q0U2d3YxdFVaQVZJTE4z?=
 =?utf-8?B?bnlvZStYaGFOZ2YzOUo3M00vOUlwUXZoWHROWVA0UXBERGsvZzJSbGNsK2pQ?=
 =?utf-8?B?cW5DV01zK21RUUtrUkwweE9CUDdTN1NGQWtTRjYxa3o0K2NmL1NxM1VHcG51?=
 =?utf-8?B?SjZnTmNlUXZvdnRGUjhORUhFdVc4WXpweUtINmtDNnNDNXFvNFpCekltNE52?=
 =?utf-8?B?bm9LdC9OT1k0VkZBMGordy9hNDIwR0h6NTN3RU9wMWw2SDBrU1MvbVdUaGVj?=
 =?utf-8?B?QnNpOHd4SHl4L0NTVzQvUFBxckc5UXpONXVVU00zUE9pYzduc1lLSmhyOXdr?=
 =?utf-8?B?UG4ySEVDMm9wdDJNbWRZZnhUSVZReDlya0ticjhocXpoRXRzQU5JVnViZzg4?=
 =?utf-8?B?NGc1aFdIK3kwUVhkaTZVL0Z3eUw1ZDJSRXFyRHoxWEJOMGVIK3hVU2RtY3lz?=
 =?utf-8?B?SUp1b3VMSU1YRmRxbzFwVGNZYnE5NlFqbXNpcDNhbUJxMWZHaXJGQzF1NHV1?=
 =?utf-8?B?aThOclhMZ1k5Z2NKMTdmWVIzYTdHa1YvQkFVb01KQ01XV0hXNUpNTUhOV0My?=
 =?utf-8?B?TU1LQmozVys3WjJub1R6SjZ4bEdVL0oxa0dUVGxvUkErZ3FXMWRiRi9GTW9O?=
 =?utf-8?B?T3Njdkg4VWh0VzBtZGt2aVFCRzgzTTVleUlRY3JGZlloaWFWSWN5UkprVG1F?=
 =?utf-8?Q?v2P2lkygzHnQgUFM=3D?=
X-Exchange-RoutingPolicyChecked: RmeTKKZsSALZoTiI8ZAouTok7mP6e51Y9ZU4pO6YL7AZ8cIM4YFfV9HfFiARuofF02bhjAr4xSwuIfcB/h5l5pTW6Ia0hnZ4hzGc6tUOAOYFEcA33c7dUXM7UyrAFfZRHqfAfKoRG3Q9puE4AxXjL4KFjDABDsBk+JpTrzAILGc63zyqeRAR6zyN0nM7Di7fGV68Vaw35ZRReNX8mbPPa+A8tAz/oL4AbH9eqmofVahOrtvjhhRfyv4qJLSq78jqWkSIXXI5xIwVDcLzBibMzu49MKgT88LJL5X2kOQR1AUtBuqukxhYcYh5r7T72Pf2Run2SFyeM8GBiJtBP/ywYA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 675331ef-5819-4002-fdee-08dee87c13bd
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8706.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 05:34:34.2169 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QfZlQTAM1NbyTFJB5rrE289Xi83bzaeYkv9cB7uUnSN8nM65MFMtvVcHrO4EicxNGhlDQKteFO8v6M72dcFJVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7823
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

Hi Karthik,

On 17-07-2026 09:47, Karthik Poosa wrote:
> Expose fan maximum RPM via fanN_max.
>
> The value is derived from the firmware-reported maximum fan RPS and
> converted to RPM in the fan hwmon read path.
>
> Update Xe hwmon ABI documentation for fanN_max.
>
> v2: Use xe helper for dmesg logs.
>
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Assisted-by: Codex:gpt-5-4
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon    |  8 ++++++++
>   drivers/gpu/drm/xe/xe_hwmon.c                  | 18 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_pcode_api.h              |  1 +
>   3 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 0da739d9a816..ec0b94d76e22 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -266,6 +266,14 @@ Description:	RO. Fan 3 speed in RPM.
>   
>   		Only supported for particular Intel Xe graphics platforms.
>   
> +What:           /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/fan[1-3]_max
> +Date:           July 2026
> +KernelVersion:  7.2
> +Contact:        intel-xe@lists.freedesktop.org
> +Description:    RO. Maximum fan speed in RPM for each fan channel.
> +
> +                Only supported for particular Intel Xe graphics platforms.
> +
>   What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
>   Date:		May 2025
>   KernelVersion:	6.15
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 0a416e3e7b8c..769f4d1da83e 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -165,6 +165,8 @@ struct xe_hwmon_fan_info {
>   			u8 speed;
>   		} fcp[MAX_FAN_CONTROL_POINTS];
>   	} fan_table[FAN_TABLE_MAX];
> +		/** @max_rps: maximum fan RPS */
> +		u32 max_rps;
nit: fix indentation.

Thanks,
Soham
>   	/** @min_pwm: minimum fan PWM */
>   	u32 min_pwm;
>   };
> @@ -799,7 +801,8 @@ static const struct hwmon_channel_info * const hwmon_info[] = {
>   	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>   	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>   	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> -	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT, HWMON_F_INPUT, HWMON_F_INPUT),
> +	HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, HWMON_F_INPUT | HWMON_F_MAX,
> +			   HWMON_F_INPUT | HWMON_F_MAX),
>   	NULL
>   };
>   
> @@ -987,6 +990,14 @@ static int xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>   		}
>   
>   		xe_dbg(hwmon->xe, "fan %d min PWM %u\n", fan, fi->min_pwm);
> +
> +		/* Read max fan RPS*/
> +		ret = xe_hwmon_pcode_read_fan_control(hwmon, FSC_READ_MAX_FAN_RPS, fan,
> +						      &fi->max_rps);
> +		if (ret)
> +			xe_warn(hwmon->xe, "failed to read fan %d max RPS, ret=%d\n", fan, ret);
> +		else
> +			xe_dbg(hwmon->xe, "fan %d max RPS %u\n", fan, fi->max_rps);
>   	}
>   	return 0;
>   }
> @@ -1406,6 +1417,7 @@ xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>   
>   	switch (attr) {
>   	case hwmon_fan_input:
> +	case hwmon_fan_max:
>   		return channel < hwmon->num_fans ? 0444 : 0;
>   	default:
>   		return 0;
> @@ -1457,6 +1469,10 @@ xe_hwmon_fan_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>   	switch (attr) {
>   	case hwmon_fan_input:
>   		return xe_hwmon_fan_input_read(hwmon, channel, val);
> +	case hwmon_fan_max:
> +		/* Convert RPS to RPM */
> +		*val = (long)hwmon->fi[channel].max_rps * 60;
> +		return 0;
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 669010f1e2d0..419ab4f416fa 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -84,6 +84,7 @@
>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>   
>   #define   FAN_SPEED_CONTROL			0x7D
> +#define     FSC_READ_MAX_FAN_RPS        0x3
>   #define     FSC_READ_NUM_FANS			0x4
>   #define     FSC_READ_STOCK_FAN_CONTROL_POINTS	0x5
>   #define     FSC_READ_FAN_TABLE			0x7
