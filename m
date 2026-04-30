Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58925CD1297
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 05:47:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1704F10E03B;
	Thu, 30 Apr 2026 05:47:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Em21ujWJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C0810E03B
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 05:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777528060; x=1809064060;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=+sykXLWk7GtzavACRhvRz/TTyR34N0DJNSMZ6H7ku78=;
 b=Em21ujWJVHoB25RwoXmVi6lCKz6QNqZaj1HViK3/OoJwOGnPBU3BtZiF
 UmD8g1IP7L4lsGwWIB4EpgtslExHoGVuIDGZ+BctN7kMVyZatt1mtDizh
 GPH1pE76Lbx1twvaDbV9sLMiaUwDzwi2XQ0Ar6PkPj9vJOnTRfRGROmqq
 jlvZTCu83G+OMTzyKnVjnGif5Zidny2fQDGpbdk1t9tgY1UDJW2svD50X
 ybmzI7IQagblzIZvDYgnvQwP0ZmbRx1flP7wzrY3T6yui7GL8dRJ8YBwk
 L4LC2BTNNMZqctdaX1cA422Um0GKcq6Ea4OGbFdKTTYQ88T6v/abfaprA w==;
X-CSE-ConnectionGUID: VpU8fgw8SuaY8pGk+OLQ5w==
X-CSE-MsgGUID: ylChrxWGRdK4vhOWfno1oA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="81043604"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208,217";a="81043604"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:47:39 -0700
X-CSE-ConnectionGUID: b3q66T7UQKOFkCTFdLERDg==
X-CSE-MsgGUID: uR0Q8pc7QqWBs8isNgbpww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
 d="scan'208,217";a="234368247"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:47:39 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:47:38 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:47:38 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:47:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J7/InzY1XymR2i4/s6mLzEIIjAuPG9lYNjQZCbg3Icn2qtKPCmOw9l98yu/tmv07DFhi83a+FGzoyhuvpogOlo6sqbPe0ukbwqVM15Uaqc6k7nMEtkeopmjH5HTWgnJ6tmDOPWoPTXiyYEZw6Pbh2K6hMkxtL/yMfn9h776dp1/Iw8sEwYO8zCj9HiZsJnR34RIuCUArrlAR+ZicPlKCkzODhTDb+UvF6vRhstyOJ3eHlUHXKAxGhqUM3QdE3ssC8dEsimc42zWEZnY+0CwSZSRBqXmyLFqYZ8qf5o2rNp7YKazhR/kv3gkBNI7z1QOGEh1g8n+vtDuX/DXkgOMUXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrMf/k0t+JR2bNyjDv/Oo1on4hquiXvPE5Z5X8Tp+bI=;
 b=VLO+j0sbj9kOFEG2zFJm7mkmUhbNJ3HPxZuDwIgeaV4ConSQEazvZZdIKIbui9OG+Fzezm3aumvg9qO8xICAKovgqGmCXeR7NHazU23zZ8zD7CI5LQ6iQSv25LJ/dusutBguswMZARvfvVm85OaUsET/tU6LAy+mk8y4XRu9iYrSJ7FsxIhAjhs3trB0QMjtSEpgatWCOzGSAgAM1ECoyYLg606TcwNxmnMEYW+ZZ6I7/iOFrQOCkVhjCH9ivXZuIOrk1W3v+Iy62+MTIAROKYP2rlxvUIJ3rdFRUxSB/CT4+nw0T1ig0WlJl1T1cdliPFdm5P8DO/W7O6o4depNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by SJ5PPF33E90C8BE.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::81f) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 05:47:32 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::ccc3:3fd6:58f5:927%3]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 05:47:32 +0000
Content-Type: multipart/alternative;
 boundary="------------y2VOE0D6ATHXmHaEgXZ8bIsG"
Message-ID: <717e3687-60b0-46fd-937e-c968adf08bcd@intel.com>
Date: Thu, 30 Apr 2026 11:17:27 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] drm/xe/hwe: Allow to replace
 xe_hw_engine_handle_irq() with stub
To: <intel-xe@lists.freedesktop.org>
References: <20260428142722.582-1-michal.wajdeczko@intel.com>
 <20260428142722.582-4-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260428142722.582-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA0PR01CA0078.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::20) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|SJ5PPF33E90C8BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 95915405-b1a2-41db-9c71-08dea67bf931
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|22082099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: DT2AFmpqIqhDPcun11Qyt68/AxUUg2wnX7KCxhDtImYYocChzEQ1Jx2fXlK5dozMlT76Yi34Av5njuprIOFlIbzoc0LrjyQWhx7ZuSyMA6DXitoT8D7YpEGsTl/W1k6ZnNkYl1IRw9swGAjyY1fa5vt4x/cXAWxYcmR4wRnUetSlBGdWawuxDPKPzreur/5wlA0qBd7q348FYvByhU4Jv3PUGJs+eH4OjF8nYwBw7HOp6Lm0msB1k6Y7FlHryTq7/AUqBrtK2DkGUy/RDysZVCkeLtdgGGgbCdIOg84w9/OUa2qHhn8NAMDrOdjTYaQALntZtGBMr3oGhIllWpQzZerGHa48io0mQ5f5mGUYP7NRcth6Lh1IG2uSmT7/F1zwb+RVZL92XXFk9pdbaDC2Hxx0747eHy8dZqck8NQp5AMgK7qzcb/5cLvMd1gKzSdRApp7t3MT0q0QgaGrIvsD3qfoHCzYrHyHHX2dAO+mbyJua9AfuifgffkDtWvTshORfhloeuNcygeIgRN2IYn33ZkCXiglblahD+AY5yx54Xfmv/60tpv7LlZSJXQXL5xuNEiPi5nGbsNgUqMFtLrsuJN89b5hfSRScG11ThjV3p+kEQV2/NNauYujTqSrJuwX8ieN0s8RBHxkRsk9eZn8jRGYDlqj+M1kefbQQP7Szy/5gB+3ETZX/bi5rlHj31DIY1rxBozo/P1qNekZvMTKn6KD7UHmITSQPknblnSNccQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(22082099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWZTWldpbURlRkJoSm5BV3p6Y1BzNFRwSGpaSjhJaHRtckJTRHFVanBkQmIy?=
 =?utf-8?B?WDRuT3VmeDgxRURXR0pna0ZBTXU2cUhtS0FEWnFmSDVRV3hvVG1SblBNN2pM?=
 =?utf-8?B?c0tiTUVUWnA2VGtKb1ZPa2lvNHVUUXBjZUEyU21CUndzM0JhVzVuVE9mRUpE?=
 =?utf-8?B?Qks0S2ZUdXBKVjl6bDByUXc4bWUrRVpZYWR2UnowVjBqWktHbFVxZDVaRnNX?=
 =?utf-8?B?Yi9NUlEyL2ZjeDdwWExGbnpsRktLRzZnd0JsT3JaZ0FTM3NleDBwTEQrUmJG?=
 =?utf-8?B?NnZ6Sm5XWllSVXkwTGxDMXdtdEtrN3pEa3dqY1NMWGIrcG9iNUd0a0VISjM0?=
 =?utf-8?B?NTlaTHltbWZLcUJ4QWtEVWNCNXVKdUYrUXY1Z3VHSjZ3TlduVm9hVXZDT2Fx?=
 =?utf-8?B?SW8rUEZMV0lJUDI3ampBQVluKzZmakU2SnR0WDh3eE5zN1I4R2hvSjFadDg0?=
 =?utf-8?B?NGtjV01EenFzREFnL1RQMU8yaDVCaFhhVzI0TFROUTIvVG8rSDdQM0JzakVl?=
 =?utf-8?B?SWpUZ1hJYm5OY2Z3OWZMbjRBaFoyQ3E5YnZUUU1odzBmaElzV3duc0Fyd2xS?=
 =?utf-8?B?MWtGVE5xdzJDVkUxZHoxa2RGc0NvNDIxeTNTQkFBUm5hZDZzUk5DaUdEZFZB?=
 =?utf-8?B?eVp5cXVXc2xXa1hyZmh4N0ROeE1XUjZPYVM1RGJVQ1IzdXNrWWFqQlRFbkg2?=
 =?utf-8?B?azQ1NVMxa2I2SVRacTlocDJqbXBvcXcwOUdHOWtrNkppK0xqc0piZnVIVkc0?=
 =?utf-8?B?Nng2YTQ1d1diRnkydFNHbnAyYTZnNEkxRjV1Rm1Ba3BkUE1NR3VDWXdib2h5?=
 =?utf-8?B?dDB3MER2ajdaQVFLZnZESzArWHZXZ29pM2JxRUJUSGxjTzlxR3pwaUVvZnZX?=
 =?utf-8?B?cjZ1VFhmRGszRllsNkVQT0JXMWxUTDZsOStMdzM1MGp0R2dlNERlcEZEZTVE?=
 =?utf-8?B?UXlEbDRkcFFvallSREF0NXgxc29PZ05yMU5oSDFnMzM2alA0cCtBYkV1R2RF?=
 =?utf-8?B?ZjJBbjdScWh4QXZTMExIQjVrNndNMzlKMzZLMHVid3VlQktWdTV0cWlxT2VT?=
 =?utf-8?B?bnBVRWVycGg5ZXNOR0Rkb0EveTAvdy9ndkV3VzV2cG9zMDU3YlJPcWQyNXRV?=
 =?utf-8?B?OVB3SlB5ZEFQY1RSWEpueURSdEdqUk04RzdqU3Q5QXdxcURSSzk2ZEhTK2hG?=
 =?utf-8?B?WmhiN25YVVZPOE5OdExmMnEyUnYrOTE1U0ZRZ25keFUwNnRWbGwyUnZFU3l3?=
 =?utf-8?B?WEdhQzdidTVQbmJPSi96Q1ZSaHBZS1llZWx5NC9vR1lJMEdFNlJQbGJDY3BD?=
 =?utf-8?B?Rlg2VG5yaGtBaUpya2xCNnJNSWpDR2s0Y3daU201VzBudFY1MUMraHVFWGdR?=
 =?utf-8?B?UnA4YlJBWnY2bGZQR0o0bENrUEQ1anU4dzVBNFI1NEkrQU1ieDZ6RDVYbEFu?=
 =?utf-8?B?T1R0Ym0zTTlrMytsWkNjbHNYRGNLaHZJcnpxcW9MUmw1dFArTVFRcGlEQnFq?=
 =?utf-8?B?QzVCNjg4UHhycW9xckRQUEQyM00rMXJIcWlQRnBZYjN4dGNWN1NKQ0QrRGVB?=
 =?utf-8?B?TytIMlNJWGhKc1g0REJyMExxRlNmcVB2QjdwYnZRbVRIbUpWeXh6WloveXZn?=
 =?utf-8?B?NkVFc00zR00vYTJBYVdmUEsyZTNwWnV0U3FqV0xWSHo4R2dZTDdyamE5ZW1M?=
 =?utf-8?B?S1NGWUVZREs4WmI5bGJ1eDFaSFpqKzRlUmhrTE81a2RjVzlxd0xYS1pqOWI3?=
 =?utf-8?B?bzY5bEVhSW5KS3Q0MVhuQWErRkc2QjlVNDBNNEhqbWI0K0NQRmxnVEQ3SUcr?=
 =?utf-8?B?QkQzMlh3MnRpWmw1VzdsVWl4YkdCVFBVVDRNamhrcXJhRUFXK3puU2ErRWVV?=
 =?utf-8?B?a3B5bk4rekJHWjZKcTFqVURXL1F4Szh4Z1pKYUEveEUwa2g3MXRMamYwaWRu?=
 =?utf-8?B?OFNiN3gzZEtuWjJTZ1g1NDBTRldWa3dpazFZUTlRTFVNbWhCL2xHcEYxWmhO?=
 =?utf-8?B?SnA5Q1p3QW4vNWRzQ0swTi9odUVGN1JHa05yYzE4c1pyQkpZMlFWengyTGtt?=
 =?utf-8?B?RkxqVlY4TkQyYlZma1VBbjJNa0p2TjBiVlhOQ3ZlYVJ1K3dOcW43NkZqeit1?=
 =?utf-8?B?b2pJU0I5YkNLS09EekFBWE16ZXBpM3RIYVphaEc4aURzZ0VESG9OMS9HcWEw?=
 =?utf-8?B?SDdCSklnQkhQb0xYUVB4ZzRnaG90ZVRiOWVuZUxyL2liMDl3aFNSSno1Q29k?=
 =?utf-8?B?ZUlXbDBJWVA5R0cybE1xNUZ4aGNWZ1BVcy9uVVJ5VVB2UUNhQlBzK003Wk90?=
 =?utf-8?B?VGdscHZzZWtHbDB2MXI0enBGRjEvdWdZZXR5Z1NMcXduK3Y0QThmYnIzKzds?=
 =?utf-8?Q?jNLILFher6u3cZyY=3D?=
X-Exchange-RoutingPolicyChecked: e2T6J0RbZK8pDPG5UkG9ka9m1xbdAS6dH9+2RTZ1nJrF38YDCON98+Gt+Y7FVXEfvehN1utk5KXsoFmxwtZhi4ZZ810FccEPCwCMlGLRZ+v8dpg9Qpm5jhgCdSYPuHWZK/bscnflOSn3Ku5Ishs2hJGLGVkP4OTfbaXsm7CbNcWpdbChQwnlObOtIjl1PxTn+tNSwit8mDjDMDZvghbWNRPsKPmXPmFIHZz3Q/Zauh1mJ/EB3+bT1WSGCHM/BQHvaQIh2kc3FWe+lIZFyLmxfIYHvnZaBcHaEBBN2PY1of3PVLyUJ8GIIU0ZY0rzQRz6jasTktpR5QtHs7FCfmDq9w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 95915405-b1a2-41db-9c71-08dea67bf931
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:47:32.6920 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JP6U+/YaASmygccof3MqlyEbOYBIPOqfm3vZO3Obi5ilQ55kJXwUm7gm+MTGYzhWlArBFCtMXuJTapyOdfXuLKvkUAFthmkQMYTjTpPTXws=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF33E90C8BE
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

--------------y2VOE0D6ATHXmHaEgXZ8bIsG
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 28-Apr-26 7:57 PM, Michal Wajdeczko wrote:
> We want to use replacement functions in upcoming kunit tests.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 0f0e08bcc182..fb1bd2550160 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -6,6 +6,7 @@
>   #include "xe_hw_engine.h"
>   
>   #include <linux/nospec.h>
> +#include <kunit/static_stub.h>
>   
>   #include <drm/drm_managed.h>
>   #include <drm/drm_print.h>
> @@ -882,6 +883,8 @@ int xe_hw_engines_init(struct xe_gt *gt)
>   
>   void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
>   {
> +	KUNIT_STATIC_STUB_REDIRECT(xe_hw_engine_handle_irq, hwe, intr_vec);
> +
>   	wake_up_all(&gt_to_xe(hwe->gt)->ufence_wq);
>   
>   	if (hwe->irq_handler)

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------y2VOE0D6ATHXmHaEgXZ8bIsG
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 28-Apr-26 7:57 PM, Michal Wajdeczko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260428142722.582-4-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">We want to use replacement functions in upcoming kunit tests.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_hw_engine.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
index 0f0e08bcc182..fb1bd2550160 100644
--- a/drivers/gpu/drm/xe/xe_hw_engine.c
+++ b/drivers/gpu/drm/xe/xe_hw_engine.c
@@ -6,6 +6,7 @@
 #include &quot;xe_hw_engine.h&quot;
 
 #include &lt;linux/nospec.h&gt;
+#include &lt;kunit/static_stub.h&gt;
 
 #include &lt;drm/drm_managed.h&gt;
 #include &lt;drm/drm_print.h&gt;
@@ -882,6 +883,8 @@ int xe_hw_engines_init(struct xe_gt *gt)
 
 void xe_hw_engine_handle_irq(struct xe_hw_engine *hwe, u16 intr_vec)
 {
+	KUNIT_STATIC_STUB_REDIRECT(xe_hw_engine_handle_irq, hwe, intr_vec);
+
 	wake_up_all(&amp;gt_to_xe(hwe-&gt;gt)-&gt;ufence_wq);
 
 	if (hwe-&gt;irq_handler)</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20260428142722.582-4-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------y2VOE0D6ATHXmHaEgXZ8bIsG--
