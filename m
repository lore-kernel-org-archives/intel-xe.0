Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903F4CD4F54
	for <intel-xe@archiver.kernel.org>; Thu, 28 May 2026 17:51:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D0AE10F4EB;
	Thu, 28 May 2026 17:51:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CG6zNspa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1F710F4EB
 for <intel-xe@lists.freedesktop.org>; Thu, 28 May 2026 17:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779990713; x=1811526713;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Uj5HODF5bnYjai1Z+c0GUHRQ2rDzdHd3m+5AfZTpu2w=;
 b=CG6zNspavjtKh6HT1PibSJFnBfWUGVZkZbdsvQbayqF6uebT2khAt2yz
 tw7U1XZ8XZuVjXkpq5zLhJkPfPX6SSJV5g34dmDlcVeTP4KNAEaaFYjHi
 o8mfC/om4jQT3c1E7aoBv88JKuLe/ILfzG9x3Zo8es0IkYhOpqzjwZ3Aj
 Aj+5YAASJZcjBFR4ICSjN2YIcqCps99o9jhh+0b13AK9VcowgLm1Zrg05
 IWT4AOXz0szTohI+bIm2CxFPL1X9ZkkAZnYdOibbPQp5K59W9G0Txw2ON
 j4DrgZZ9T32GUKJ40raRBdCDIp4sSZgaSS3WX2REdQR3NxTiErTWfNXbM A==;
X-CSE-ConnectionGUID: NSNBUJhOQYmiavhwLGkW8A==
X-CSE-MsgGUID: KWpu/XPASxmEEO8GDyUc0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11800"; a="80564315"
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="80564315"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:51:53 -0700
X-CSE-ConnectionGUID: R6zrFygDQgOC4w//PVs0iQ==
X-CSE-MsgGUID: T2+bnBw0RGaJOCFFarFhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,173,1774335600"; d="scan'208";a="244435802"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2026 10:51:52 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:51:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 28 May 2026 10:51:52 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 28 May 2026 10:51:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAEwOwCtErZ55SzPEkea2L7mPwTa81H9r93CizoEFbxa1hx29voBGOVwqTHzsPwdCTPVZBtM0Z2PBfeFYcI/ej+if2p+e5G/30Vl9IA/K6KP4x/RI9mDp3txu6lHlVgwdfhqsgbI+SV0q1mkXx5MpDYqNofl7bPdw2WzbfV6u8W/eRxX3d5s+TV6myHJiXAHuYJX5XR++2yBOC3i1gAVqo2Jtv1KRIAxo5dte7mdk4m15tqegUdDBlCpViEu7fFsZMYg0Blanu1zj+j2lxPP+bWtIDzaVfTapwxY7sDb8qO18vuPO2aN16YUWVnAKkRpJ+IgEsBKjQ/6si9lKgeyJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FgR6ytMpngR0l2P7VPeGfUGOWZj0twcC9iSxnoXODCU=;
 b=JdjQz07QDn4YO2PuHe0hS6cMjiAllmBa8WhGz2/8DIem7SLOGNaTUlpmZpZf2JPHT+FtqnJFeCm5i+eryw4sqhXsQCCvFVdCCOucblFqRotoxloiRrscPkGQOToi5eC0n+fOQaBGtLanOCj/fvyqL7NxNiSuxtCC+Wu9Uas6AuW/BEUE6FwJ1fi0oN1fsHLhFAVHuhBzNTrjB/DtH1w0kjwm2HUA7t2YerCb1fVYRe9TJRWPELaSic7AK5nu0rkkyvHASq4GxSJCViZRrxZgLkbnOMvqiIXasPasd413PzE2W1zjcZMhAWGNaDHfJDSgXVy3rV8gN18BeKy1hmSEeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by IA3PR11MB9183.namprd11.prod.outlook.com (2603:10b6:208:57e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Thu, 28 May
 2026 17:51:50 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%4]) with mapi id 15.21.0048.016; Thu, 28 May 2026
 17:51:50 +0000
Message-ID: <a6a6e2a8-876e-4112-aab5-094a57270072@intel.com>
Date: Thu, 28 May 2026 10:51:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/guc: Compress GuC log and CTB dump with zstd
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260511194924.2016315-1-zhanjun.dong@intel.com>
 <20260511194924.2016315-2-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20260511194924.2016315-2-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0229.namprd04.prod.outlook.com
 (2603:10b6:303:87::24) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|IA3PR11MB9183:EE_
X-MS-Office365-Filtering-Correlation-Id: bb86aa9a-73c3-4e16-e4ec-08debce1cb57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|3023799007|6133799003|4143699003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: xul/JzFqBV5Hg2VW+CiqjtTuJhdgfg/IFmUkopoXEf6br1gyqLjAWOSllc+wdpyboKIlnbJNuboIS1YyYeJimcF9YxPitSXmIz6WFCQIEyJH8QbJbJ6Co1imbFfWNqBEG4JCLBgh9ZaOKWBYmt+q64GElp5ownJY6Mw4GQZXiojvs4n3VIrtxKzz8PO6rC3DQOO8u8LLxPjy7Xm5kF8IrKfQzx9EmHgGx207R/LG5vWckm6dGy/ILTuTSf+DEBjdiELtkCEoR+yMqZa2XLeIwz+/7bAK6GiD/eGvDneu/SFSlt3UUmA/6YrkjWvmkqRK1L1VJuGhWzMSd6pxPXHPVz9+4HvQTvaIsbCQ30DwB9g8MgDOi0N8FA1EtvHP5LAx2HMQpm84c0w2ed2fNUnTnnoj44vHPYLH7OhLIJOcFjOkuPbEtt0OPp9I2f8B11fH8MCRjp1n91IiHwoXQ1edNKV/vuF5pMBcSHb3SBcqY9/8mDNCswl0rNilH3wICYfXBZrtQ78lpz70cBIiLDSvAY+dGu/NgKxMYVwSZROa5zGP5RQlwBFJNGE4OP4sun96bl4LONGjduGrXYMw5+fcyx8nnOi5WA8iYIU2783gsDQpJtiRn5twyByMneMM90IegrYmXf+/hhOPKt976IYaCiaFw7BHcQrJ5yoeMc9qc37O4fIZ2mc8Nd4MRBY7nDTI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(3023799007)(6133799003)(4143699003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVR2cU4yUmdkblJzeXNwYTlRZnNjdU81M3dyZVJGeXBGekQ5Zkh5SmI2NVh1?=
 =?utf-8?B?bFVZL1pXNHM3L1pybUdzVWpBc0ptbTliY2xGY0I5ZlU2aUdxZ0FYcFpjL1dD?=
 =?utf-8?B?dSt3T1NaTzJuM2xDUXRlZWxaU1ppbXk4cmFXcHVUNGR4a3RWcVZ0Y0RDcTk2?=
 =?utf-8?B?aGdQSXU4cHZrTjJaNUxocWptQ292NTQxYWVCNmRwdTlLOEpURmI0bjJmVUFR?=
 =?utf-8?B?N2QzUDkzK0E2VkUvUWxMR0Fsb1MydHRRVXlRdzFjRFo0Qk5rY2ZHc2RNdEpK?=
 =?utf-8?B?dGZKT2RSVm9lQkI2QnJHLzN0S1ZaSzRmV3pXam5MQlhUQ0VNenBQbkNEay9X?=
 =?utf-8?B?UXRyODYzMS8yS1FJMzA5MnZLT1pFN21kNndad0N1WjhsOWduWWx2UnVkSG9x?=
 =?utf-8?B?Ulp6djg1QUdzZFdCS0VnaVNFcTcxeUs5djk1bVYzZ1g5ekU1aGQwNlpKU3kz?=
 =?utf-8?B?RmNaOUcxWEZNemM2aHk5a2RMWHE4L1dld2Rqalk2aDhJd2pybTB1Mk0wdlVY?=
 =?utf-8?B?Z0M2T2RtRWpsK0RpSXUrRCtIeDlpU2RYZUtCMDVtenhVazBSa1NrTXFyRlFR?=
 =?utf-8?B?S09xUmhrWjY0SFdjY3NUTzhFbVVLWERjVzU0dTB3bmdZZmF2ZUtLNzA0Rlpi?=
 =?utf-8?B?NDBJRnVHZG56MW9jbkUrZ09EZmg4RHhNd3VKeG5BWTYycnFnT3hjYWVmcXpW?=
 =?utf-8?B?S0M2RGFVS2JnTjIrU3lGMFN1eE5tOXk0OHhiZDYwMGY2TkhnTWMyTnNwVlc4?=
 =?utf-8?B?NytuMTY2S3ZyQ2dJaW1hbllCc2o4VlhKbUhmYSsxYk04OStSQ1I4Wks5Tnc4?=
 =?utf-8?B?SktQdktVT3R5R3pPcWRKeCtLM0phS0c5d1lRdXppQjJjd0JoNUk0VHl2OGVD?=
 =?utf-8?B?NEt6K29DeDFLbUsvdXpVYitqT3BjZFh1NVN0Nml6THVRbzREUXo1VldZc0hr?=
 =?utf-8?B?aUw3eldCNU1zcDFLdzZPMlJkVGRjQXBSbURSTDJjbFdzdmUzMVJsWkJlelNK?=
 =?utf-8?B?eHNiUDlLbmMxZmx2TnEwMVdUdDFCNUFRZmRKd0Jwb2FWZkpUZnNOMThlUXoy?=
 =?utf-8?B?d3VWNDJ5ZERuUDdxUnJkcFhpd2ZzVysyREF6cWxpcjRFMUtOR3ZzUEpUZmt3?=
 =?utf-8?B?WFc2SWxKWDhmbWVvakN1dllkT0JxV0NuNTQ0Z3dSYUFkME1zeHRoU3gxZmJG?=
 =?utf-8?B?anM5aG1hUUdrK09meURkL3V0MFliM0drckVNOWVjVXp6K3lESk40TENzUUJI?=
 =?utf-8?B?RjVVdmVQODR4ZVdNS0xjOUNEaTk1UFIwTkh5YU5nOE5BZlFhcHVIY0RuTjFz?=
 =?utf-8?B?Q1NTL2VCdHAvdnMwcUhtMzF2cE1rZDNXYjVyUkFPaUNQVDBVM2tPUUEzSzlM?=
 =?utf-8?B?TVhrRzlwajM5Z1hmR3IzdExzcThoOGZqYTVLVk9aMGRZdVRzenVwQXVnYlMx?=
 =?utf-8?B?TCswTERwMTI5TkMvUEw4Q2FEUWZiV2Jhank2U2ZMRkhVOHlnVDNUSVkvMGxw?=
 =?utf-8?B?L2R2ckc3N2pEcFg3cnJUbld0eDFCbXlhTVk0V0krRklHRlVDYUJxOFRHODNv?=
 =?utf-8?B?aDA4S0ZIVDF0SFlWOWN1bW9GdVB1TG43Qjc1OW90SmZDUHBVRFVnMGxCbmdj?=
 =?utf-8?B?V2NpRktGZXZNb250bm1IK1hZajFhMGJsNkE3bXM0TnRqOHU1S1R3U1Izendv?=
 =?utf-8?B?NUkwWXQ3S0dyS2Q2V0d0bHRXYmMvZ0wySDlDWHM5ZjFtOXh3WDlMbVJ5TXBC?=
 =?utf-8?B?Njg0YUUwalJxUWtmcFRBN3l2bHJLTFZDNFFxTkRSRTZCL21FdmpDTm5nWDNv?=
 =?utf-8?B?S3F0VmJlZXQ2bWc3MVhCOVE5ZzhMSGY0OHd1QjBsVG9nSi9TelRkaitMN2lX?=
 =?utf-8?B?elVHY2MzVEg2MlRNa2szajBwcVM1dStiTE82SVQ2RkxBZ1RsK3krbE8yd1Uw?=
 =?utf-8?B?TkVueWlDaFJJTWdNbDlob01zem9OQWk1MHREd0RLNVRId3BEdGF2UlFub0JK?=
 =?utf-8?B?VGUrOW9UT0pyL2dHVmJvUVM3T0xWV3pZKzU2WjFKTUpldHpOWXlQUDV5SnlU?=
 =?utf-8?B?RDdKMXM4QjRKUTNQTmhKUGw1eFp3NEM1T0lNU2Z0UVlPMHd4bW1kdUdKL0Iv?=
 =?utf-8?B?QkRtWFBadGlBV05xTlpsU3YxMENtTm95OUFUdHBPTW90bi9oYTdiQ2lMWWIw?=
 =?utf-8?B?dm5iNWpINitDVUlxVHpmbXRhejg1UFdNMzk3ZWFKaEtiWEhqRVJOakNDNmsw?=
 =?utf-8?B?RWxLaWFaMFZkR2VFZk9qc3lINmlhb0ZRZExRNXNDTzV5Zm4rVUlmd2pMa1hh?=
 =?utf-8?B?MzRiR3gyK01jZDA2MTJtTjFWQ3BMbEZMTFBBVW5JVG1BdlhLUk1qRlRtWGMy?=
 =?utf-8?Q?PkVLLwKPQKGB6Wzw=3D?=
X-Exchange-RoutingPolicyChecked: XzM3qfcdYXQqnraopR6cEO/IBlurMroBVXC2xWQj9n+9a/167E6P15W42Tozr2fMEOwu6Mjdmo09864p9JoL5XDl8uRx4XlHPmc3T4uefDmDAj+OfBOxbxhl1SpYJAI2ZXZV2RuluaGjxCCOyr9Pp0a8xecyVK66unn/6J38JujEweLefjX3vb4+aYUSbSHkrCp/FF4+k9/e33JUObHVCzf7n6YxHnd7khpnsNurGYPaOW16DSlCnWf1LlboWayxwe/FtHgekIeAdzuTLuMdU3fP4TTSgsm03tk9X6XMeyNRjxIESnXL2uRjc2AdJ4MhjgmXX3WSxrNJhJFHGD/q4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: bb86aa9a-73c3-4e16-e4ec-08debce1cb57
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 17:51:50.2547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4yanNTq6/773PP4n16I9hYZ1gAm+fyhAB1SU19UXzp2EAugUfNb2OI+HfuK0BVSiIVdXb+Id+YhqEASgCbeMaU7h6Hy+TGmTqGGMXsVWno=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9183
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

Minor comment for consideration. Changes to printing, stream compression look good.

Should replace 'pr_err' with 'xe_gt_err' as we use elsewhere. With this change.

Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>

On 5/11/2026 12:49 PM, Zhanjun Dong wrote:
> Replace the raw ascii85 dumps of GuC log snapshots with a
> zstd-compressed ascii85 stream and reuse the same helper for CTB
> snapshot output.
>
> Use zstd streaming with default level-3 parameters and an estimated
> source size of 0 so the compression workspace stays bounded even for
> multi-megabyte logs.

...

> diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
> index 4d7dcaff2b91..a6fbd7233c09 100644
> --- a/drivers/gpu/drm/xe/Kconfig
> +++ b/drivers/gpu/drm/xe/Kconfig
> @@ -33,6 +33,8 @@ config DRM_XE
>  	select ACPI_WMI if X86 && ACPI
>  	select SYNC_FILE
>  	select CRC32
> +	select ZSTD_COMPRESS
> +	select ZSTD_DECOMPRESS

Decompress is not needed since we only intend to use compression. Possible that
both are needed in kconfig.

