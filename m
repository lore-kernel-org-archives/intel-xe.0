Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E45AAC5B543
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 20:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A39F310E78C;
	Thu, 29 May 2025 20:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PIYZa0I5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1F8E10E78C
 for <intel-xe@lists.freedesktop.org>; Thu, 29 May 2025 20:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748552278; x=1780088278;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6Xbl2EvVgRMhpkJ5GlDAhDw4RedUZ0N959w/oi8WCdU=;
 b=PIYZa0I5rJdJJ2eqHK6qImIOCjp5KCh4y016VxGBvYmVLtKIiuHBMOxg
 KbCGPfBhT09zgEvIEbFocf+4bw4zA8wK49fLTKG+VoGW/2Dz25tMqU20h
 13Sg/MpNW+W5sGqq0vfEHBvy4lhV7CvoJi1U4nipbNEGk8vNP1/lBTYAd
 Nr/rdWbQcPtBkiR3eJoFqRqT7ve6N+7PNsJwBIQHAzKJo9bhHaPW/frGh
 nKCvqKGKZLEUdERIfLCahYqVv8jh3QhzubUfQZ9PBJAc1/V26oJ1VuNRA
 fMxR7hpm/OPZz9vWA40lfyfhK8GWWIDLrucWE8oewpFDzdPMbF4IT2zXj Q==;
X-CSE-ConnectionGUID: hLdPVKK9TymhxUtBnyrADQ==
X-CSE-MsgGUID: xGRgHQgSSBaL4VpCiDcCOA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61688277"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="61688277"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:57:57 -0700
X-CSE-ConnectionGUID: feZMPU9KSaOEAjxucUXRgg==
X-CSE-MsgGUID: 6wSegXwgQJeaY8BmPIqbHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; d="scan'208";a="144008856"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2025 13:57:57 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 29 May 2025 13:57:56 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 29 May 2025 13:57:56 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.81) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 29 May 2025 13:57:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOshfru7lEIMbv4NprHXga7FDYOPqS1Z4ddkas5E2Wb9xQQR6/7PTXlrmMKO8pjr6RepCorB2eblhUtSqEhkJUcFjNiAMIek4VYsYNj2mWyTiuZTzBSVulYhEHUGxKChmCqDd2IBg+cxAXcDxfkV/++OYAc+MOc8ckiTwmJF60X9D/CvcYr5sTHEib4yTSQCf+IjekZJs1eWciXygJyt62UwBq2Tujn1ZvTI+tYqr4ocV/1RTLPA/GVlQ40JduCyyHmQMzLYg/Cl5fnUKMVvNoXKPMQXNolLWXT/zg0j79+YyK61S6ctPrs9o50y6mMrEX3uzFrKeaWU0sbS2LSwnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/fM5JlfVhmK35gZGMAbDp3iN9WD7ae1839q7ZXlMjo=;
 b=b3SVTgK5Nufyb5fwZHzJQSp28e+AsBsV2Ed+G5A9iK7nKVvx/SHCqcbR/V8pBXes37VvYKDu0qlUt0Xa3wFMmflxVSoO0kmuDL4kTknjxPjR0uBt5dPiJLyXlRzfiScelfoezDmYDcx+wtMyKPss+whxxqN/SJroOZGIQtwazrm9IImc4ox0UcesXHW3R0j04QgAxbwcsCxM6WI3K9gUWuwyHBGPbp7Muj1kbn5ECcdIlNNMp7AJSucibCuYAyAgL5SGzuioCNGL04QArcwWzdYuyXXhJVwJHuzbVZiu0oH5VLAROsnF2svCr70407cV4aQYq2K1NnTmgKC+okOSnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SJ0PR11MB4960.namprd11.prod.outlook.com (2603:10b6:a03:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.27; Thu, 29 May
 2025 20:57:26 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8769.025; Thu, 29 May 2025
 20:57:26 +0000
Date: Thu, 29 May 2025 13:57:24 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Shekhar Chauhan
 <shekhar.chauhan@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/xe2_hpg: Add PCI IDs for xe2_hpg
Message-ID: <20250529205724.GX5080@mdroper-desk1.amr.corp.intel.com>
References: <20250529120534.531237-1-dnyaneshwar.bhadane@intel.com>
 <20250529120534.531237-3-dnyaneshwar.bhadane@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250529120534.531237-3-dnyaneshwar.bhadane@intel.com>
X-ClientProxiedBy: BY3PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::31) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SJ0PR11MB4960:EE_
X-MS-Office365-Filtering-Correlation-Id: 2747bc80-3e0c-4bb6-a975-08dd9ef36ac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XlSdqmt28EBWGcZ5nIZB6gOut3v9eRYUYRE5LRVr0oTbfuyNoVtRmVTzN9s7?=
 =?us-ascii?Q?GqpSnMBWfiJmj5kzOTR7MUEFf01bSwmMMMBUQ5kAAoJId+P+d7w+VoYOM/ME?=
 =?us-ascii?Q?GGMu+HjrfhOGk4Ob9ZpUOzP/tKCZ6P4Qx7SQTENldc3/KBdXvEr8T37nVp/X?=
 =?us-ascii?Q?5TsilzVv9I+kqGVr8NqrGeqGkI3oAquvVPLt2SW2xDrvm5sj86hzTzaOrkl8?=
 =?us-ascii?Q?lqNYt6HdmBQNBFI8rg4maQTm/BOEaQjIJAhnSXJWggh3++b/iVs4SnCpkCfO?=
 =?us-ascii?Q?Y9rjnBSgc/DCdvqFcoxiu2w2TmZ13CGsuWC8ZTvzRorvkUhgmF54urKJqbnf?=
 =?us-ascii?Q?EEsYofx9usF7vgc1Ret9BzBtONCTwBfrrMXUaeyFxjksH32kD0mY77gBWei/?=
 =?us-ascii?Q?TC9+ASf5TLJ2gCoNz6RfkHVIugas7c9l0VgOmAM6D/Jqaz8voQ8buBYCXXHJ?=
 =?us-ascii?Q?5JVb77sgJWOcngy6YXdFmyNvwsi9lWhmcjN9VjqYXA8BEu4uEANR78Q7kwG8?=
 =?us-ascii?Q?7Ht9ylrH8KLvjhG8MF8a6gSqbV+bzQnhG8FQPEpPxE5aePwlTu4AIOvL8nct?=
 =?us-ascii?Q?0ZXSgqcWytjx0YLWDQKt0ZDiPm5WhQavp6GBtTgCf8msXOIsolYmimwr8bSM?=
 =?us-ascii?Q?MTPCITVENK59y0GrakqtVEypZ4keOsiidQtMkj9RI9HvAwmpJYBCe8/UCFqP?=
 =?us-ascii?Q?4KKYLJN/yZzQclhnl3YculXx0IZBkQeNTMP5mJ9NLJ7TtF4QeGLvKSMffRor?=
 =?us-ascii?Q?/C03Arc4Vk9Yo5K0XuNJZYhd3je2gANISWq0UvTXYh3kF8/RFc3t1uMOG76I?=
 =?us-ascii?Q?22rhJn9Ig9BKope1EtDqFzhOsBHqPbvKro43B3/HnZ12iDLLMDVPNKIaAodV?=
 =?us-ascii?Q?Zh8k7NojIePy3XydBBinRz31PmVxgqoAgVmGEF9LJRHtwIu2/EBSxJOrzUmB?=
 =?us-ascii?Q?y677Yq77XxCag0KWLibUn/bf+pSQm/yOKxXjy4Nb7VOf0SnVWN2wj28//UFJ?=
 =?us-ascii?Q?dz5yF0G8QLFNzWdo/2bQqxIo+VYf7wTwmaPCKynScaCL1QSZBdvP1FZPzCnC?=
 =?us-ascii?Q?fcDQ7BrX+vvPihnSUog1TPat0vS1Z3MxcyUf+jPYhnlUGRQba6VVXWCtstCT?=
 =?us-ascii?Q?SZ2HbqwF1v5BRIeC+Vb2egOJTS52t7Nb5Qr3RswlLcDSlKu+HpW3livYFCqZ?=
 =?us-ascii?Q?EBIHpe09SVdOQfZOdTrMSdhOCCcl5ikijk606ylExPMT/qyDeuxQnKe209HY?=
 =?us-ascii?Q?jDvyDR5Nxu6TuqhcBPs5YsQDjt1/LzhmO2rA0S2PxSEQ+Lmkjjrrxr7dCpNO?=
 =?us-ascii?Q?hMJ6sW9k39WDa2gcKkhgKAVPn75QUhlww1++cSj/jQVrzZEdvljC4EQhUI+y?=
 =?us-ascii?Q?jYb3CMualMGXOA5TW/OmXtNPR+1xP8R5O0wr+rXApNT8kle0Fx4nsC2rZkES?=
 =?us-ascii?Q?3MmRH28dvgU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?anIq/gGrykBwh/9OOSUQVrojcMOsOSQ8rIFGY41X+V46ZmOijELGmD+MLKNM?=
 =?us-ascii?Q?HkxSfZR27xOpiUUMdufdcTKYYBBoxhZ1aiUo8J8PYGvVP9jeg8OsYI6LcG/r?=
 =?us-ascii?Q?nBnivyISH7lEEKi/9OqrKOhAiySf9dqsE2MmkvYyKu3wDNC7uy11iULGsVDE?=
 =?us-ascii?Q?9A2+D8OTtmrmyxzOr+b0Kx4wug+WXVgsbVWCSyBjUVFFOC913tkV9gAOmb90?=
 =?us-ascii?Q?MzCdpmtMU0t0MT/8vL6WzlB64JIUkDINeyTz2XJ9Woh5+/XIW0djRzROTGF5?=
 =?us-ascii?Q?cfsBfNGnu25HEOOeTFWprc0TjZaDwsVnz5aUeM1asIcqeG9as2QQN8GnXEWm?=
 =?us-ascii?Q?ld9HILG3gAqTNO3lyMLBl1zqqL+l71OWGfi8TDL85TE3wEdQUJ1CGoP+oK4I?=
 =?us-ascii?Q?SbtZtlDwpmzxR3pZOTEbP7kkgyG6nz00iATOox7nj87wxkDmK5sD4yGosUlT?=
 =?us-ascii?Q?K+OV3m1T5RoSay53FoclWaSAvO98NBOBreb8ngNjnFUniXD78tWKAaeugZkU?=
 =?us-ascii?Q?NQa1r0CVuUOK179/7a7BjdmBP/m+xzgaUP3ZvNa/qDjeCVZPiek9yhw4iBpT?=
 =?us-ascii?Q?vdnNAR4tqIMVxPBwbM6VLlT+EIwJWNLy97QDayK8UMZ5fagk1FZhmUey4rox?=
 =?us-ascii?Q?4biekftiN7PWi3FFfxE0wwAUVcBAdrM9xYaQ4NUj8I4kDrswLFyTIgF0Vqyf?=
 =?us-ascii?Q?ZrcX/uyLz+9rSWTXhbtFGqoMFnwrzMmlMhmgFozyqLnbPo9byFwz7scC7We9?=
 =?us-ascii?Q?87ZWHkF25Egj+Y9hdBpmQPSFPF2JuX/VQNbu3763GjPNOYPVAjLzufU2G1K5?=
 =?us-ascii?Q?8HrD8uz1G5zjkVj8ojd7/FqRPirvqr0CzojqT7fLa1lwHbMg5QBPn9MH7C3G?=
 =?us-ascii?Q?4koO+an9at4cdPQbfwQAZ5drv2rfSemHsaF9x4FxFKT4lEmiIqHzFxKqPamE?=
 =?us-ascii?Q?NDSgAuy16MKs5TkQeVOystjLekzLKo6kMJuSuJ3Rd/EpXvU9NO1uQ8ns7AX3?=
 =?us-ascii?Q?9CnQQnBvg97dpetxjmDtpl9FXpD65HC52KBuuXAVKlseFJbIC4yCjWQ1iKsG?=
 =?us-ascii?Q?TBOFaJeYcwmq7gP1nWz/DEXMBcF9vDdxHwBKcoSJnBJ3kU//zjrnC6xWMUr4?=
 =?us-ascii?Q?3S/+9HdjQ4niaDJI+ckCegS5XFnMVf9lkgvE9vrT1FyKx1mnwcaO9LU819IS?=
 =?us-ascii?Q?1RuQYU3xmy8NZV6dlEQzyVCpvWx/mGHQ4dO5luq+9KbUEAyYaj1Lo4vAnHPT?=
 =?us-ascii?Q?KCq6Qe4OjyvO+B6a59jNQUvDkOrwgsjKFghbKtIodmWTez9Y1i+4AAjTm9BQ?=
 =?us-ascii?Q?Hy2KatkSys/mlNoqsW/xoOMLrv4JgYFXpv+x9A8Ux0qbpn0VFYTdaeeRsRSx?=
 =?us-ascii?Q?zBu2PHrkwmIp7F0SIS0CpfXyybeZejamDCvLouiIAw4y6piNNBoEl07Rdhor?=
 =?us-ascii?Q?iryvFcxYHtw0OJDhG11B+VIZdfi5Y2sC4Xbm5c9dEPgBK1f8Ijytn9DpPS+H?=
 =?us-ascii?Q?+1AcSnytNXJyJ7oTGAj99DavhjveUHYjuNnMC+75LKtAcrJhjCbcus3t/Axx?=
 =?us-ascii?Q?R2Q5LZx3y+Q49bQcXgxzeobY7zGvZu/+u9pjBZYmLoahmtGSSqTYgnIpwn08?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2747bc80-3e0c-4bb6-a975-08dd9ef36ac5
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2025 20:57:26.3338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xjSV67rojVq/a+c56VIO8Cvlv9zjKbvHGa0GAB4wphPMkjO2dsQTyoeL6XPDljC8jyYvBwDzh8tuah2yJH91mwdrBd1uv0ISyoDno3CRoLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4960
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

On Thu, May 29, 2025 at 05:35:33PM +0530, Dnyaneshwar Bhadane wrote:
> From: Shekhar Chauhan <shekhar.chauhan@intel.com>
> 
> As per updated Bspec, Sync PCI IDs for BMG.
> 
> Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>

Bspec: 68090
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  include/drm/intel/pciids.h | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/drm/intel/pciids.h b/include/drm/intel/pciids.h
> index a7ce9523c50d..129c3172aa5f 100644
> --- a/include/drm/intel/pciids.h
> +++ b/include/drm/intel/pciids.h
> @@ -852,8 +852,11 @@
>  	MACRO__(0xE210, ## __VA_ARGS__), \
>  	MACRO__(0xE211, ## __VA_ARGS__), \
>  	MACRO__(0xE212, ## __VA_ARGS__), \
> -	MACRO__(0xE215, ## __VA_ARGS__), \
> -	MACRO__(0xE216, ## __VA_ARGS__)
> +	MACRO__(0xE216, ## __VA_ARGS__), \
> +	MACRO__(0xE220, ## __VA_ARGS__), \
> +	MACRO__(0xE221, ## __VA_ARGS__), \
> +	MACRO__(0xE222, ## __VA_ARGS__), \
> +	MACRO__(0xE223, ## __VA_ARGS__)
>  
>  /* PTL */
>  #define INTEL_PTL_IDS(MACRO__, ...) \
> -- 
> 2.34.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
