Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE84ACCFA05
	for <intel-xe@archiver.kernel.org>; Thu,  6 Nov 2025 17:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5570010E99E;
	Thu,  6 Nov 2025 17:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A6RQMmhT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0C1B10E99E
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Nov 2025 17:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762451133; x=1793987133;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6pyeWGTpLu9tLcaUDMfHHncxLi/At9i937HSHTj84c0=;
 b=A6RQMmhTJ3rO3HR5ceMoVKIyTGnaOS5kcJKJ9gueMr/EnE+mOCET7/XA
 dD4wY09tTeTNT954t4sEy5CumDxNMYZxGOGZ9tDBRboYDLlhrsr0LmhT5
 jPEOFfoqlsyxLkwMb42cZeSjBeV8xIe9wrFnaKnyzxs3+FtR6VziEkAAN
 zqFkXHocqHppJovDtTTp9Tliwl+IMEuAAa7Qa/o+UtKwZ98EZWRswo9A/
 uE+JTvYeG1pWqYmMKgVlVHcllJHzd5xzhnKqozf/vhUMOhJpN7Psk1lEr
 0XQh0VHJ2g1ewVJ3UAjdYQySTdFYLREbAWW2lhfBGLp8SehmyuitRwPlk A==;
X-CSE-ConnectionGUID: wSHgfko+Sfm3yOuAsNTQ2g==
X-CSE-MsgGUID: UG+EDFyGSPSQnJySRPJNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="75206902"
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="75206902"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:45:33 -0800
X-CSE-ConnectionGUID: YMkcjgeUTFqGo6+Gzaz/JA==
X-CSE-MsgGUID: kgd+g9kwT1OsmINL/z+xDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,284,1754982000"; d="scan'208";a="192176289"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2025 09:45:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:45:32 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 6 Nov 2025 09:45:32 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.28) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 6 Nov 2025 09:45:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HjgAXZ7PljlBisPLCyRYCsozHRSb4ClwzQRFHUTSCmKSRyLgdfU7CFJA2HMkxt0LlbJJUTjwYB4SeZoHy3g7NNbOr2bLUvEFsX9ClAkQqtlwcdSGxMRBKFVwb/MGFQ/xuFxlaRdl+djfu6SjcHNB92Pnpoq0f3Ne900PKZX3EY9c8OtgqAGM0/qkRSK8Ehzbrqc18rib3FbNlATYXFFBEg7C9h2rkm/qL6Lk1FEizUaDctNc6ncv7YNVla3y6vPC8ucmVgm5Jq/aXwMjHdWVWwqTtyY4f+KM1PydXBGkU7jGiss2e/lXeAEh9qFhD5A0NjNZ56fndpoysj54h1ekrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2DheVQIdN+yVcSUnw1ocU96tXW7qFBBiyPw4XiE2fw=;
 b=gst/FrpH302cC4r0jj+CNmR8RI/c/pH/0bILqszsXP1glgBXa9l/Fz08C3apXfjFiJxMjBuk/MQZn8W1zWlpHrS1ppJ4w7hJvzyD5MBs7tP2i6aOu6F/HWpno19N7Gt2XQX5Dd0MPcXzTFG4QbwuqRAiWGlmQwVFIvvd76YmOPF8Z4e8NAnmzFdR1gCoWQDwALveYat6Fc3twwfqLziQ5h7j8bCUc1BG66BbsvKs0diwCTD20Ahe1uQ2DYJt1xL9UCB9gA2Vg9KTLixRjU7+tJhz4S0EHyNIEOqxd1KxRvPQpYiww9nseABETb14kvm9g9fwQxE6XqXPJ7xU7VeC0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by CY8PR11MB7036.namprd11.prod.outlook.com (2603:10b6:930:50::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 17:45:25 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.9298.010; Thu, 6 Nov 2025
 17:45:25 +0000
Date: Thu, 6 Nov 2025 09:45:22 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3lpg: Extend Wa_15016589081 for xe3lpg
Message-ID: <20251106174522.GD3905809@mdroper-desk1.amr.corp.intel.com>
References: <20251106100516.318863-2-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251106100516.318863-2-nitin.r.gote@intel.com>
X-ClientProxiedBy: SJ0PR13CA0211.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::6) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|CY8PR11MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 2980595c-0cb6-4f4f-6448-08de1d5c442d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xH4NHLV5qCa7GcRyqqOjGI4VN9WpIxOuWRM1YSFz2lWguGwNvED0MHaSrc8s?=
 =?us-ascii?Q?4wcZvwZiUaV+kiDD6R6zG+YGvfJDTf+jTqqHlzK5b0a9rmHZvYRJ8ppx99Q0?=
 =?us-ascii?Q?8Xf/glx5UMSiQH6I2E2ZeI6v9c39bQtbH/UarkyNrn7K0wqSb3vE+YfXT7uc?=
 =?us-ascii?Q?9YrtrmhvYQsSljpX5N0mxCZcTH0CRkSBRB9B1/AIggy7NvucCY2gOdBhO3+T?=
 =?us-ascii?Q?0kyAbc88R0fNsmyU7c282WWLveUaOu2EbDtg1loMqhhRATu5AcA7EvZyuFZP?=
 =?us-ascii?Q?M/ye+0nPlx1XzFhfCzyG/ZHF1ZCR9La2VBy50cR5jf0w56ROPQ+4lfVXEz17?=
 =?us-ascii?Q?5AtewYX6dV6J4Jogol3p8ZPKZFKa5qyQfvihYyMadUcMFbMH/2NV99P+412y?=
 =?us-ascii?Q?0hslr1eDU7K2P8nBHP2OOEaIo7xmQlWuV6oGpGZLqszvpp1m1P8yTpZd+K6N?=
 =?us-ascii?Q?VK7GOdoY3xuaQyjza4BfUEPCTS/YjRmPfqsd9/d5esEabl24xlX8rI9CtILX?=
 =?us-ascii?Q?ZhxL5v0T1YQ3Vq6LRXxezh+w7aqRbj1PlIVfvNSMLMXfCQYpYXUtbdNRhj77?=
 =?us-ascii?Q?ZAu0uI+m4tDGJS/Er2DQnVt3mjgWn3bgGF+U69agbfU4o4e1XhjIm2NSgHCK?=
 =?us-ascii?Q?/MHqa5hrM2qE2DYJFhILyjeCHwyrvU1lWpNrMqmR6V1yNHnTMSYyB/M92TfS?=
 =?us-ascii?Q?cHQcUnNRYEek+GHc6mxVA05w5JTdKryeCd7FmJo9sstCyBbiQYJ1jGqM36AE?=
 =?us-ascii?Q?0mUXorFsQ5TOI4ppzyIEIPw7g2lx8M0wKoKYd3mUyqXPvVWos6nLL+/VBlT6?=
 =?us-ascii?Q?Rf/QVMjT6r4L0IO3ELpohRhKL1fZJ+1oP+Ht+U9Av05lR8wtNY8E1y0xUn5A?=
 =?us-ascii?Q?imC6kn+5s/aRs5R9zKA2f/Zn0wnHWJDNYKZXU5qN1j8sRnpfMTnpl1970BpH?=
 =?us-ascii?Q?vd0aSWeeTNb0cyS07f5c+XybassD+nfCu2V1+2oCqBCkRltIZ2CM+44hb2Yv?=
 =?us-ascii?Q?qahPRqI9PMiiyxhhaYtl+Hq5R+a49JWb5UXP/cSPAxIAzfzgPok8Acv0R0vH?=
 =?us-ascii?Q?yVZ/gZPdxSJdG+GrloNsE5rHURsp4Psb+1SLi9o4Uet5vhAgoDATmnki5U1M?=
 =?us-ascii?Q?aOJsyD7Chp7q7dQQOSiMt1aLxffSVaawsWBVPxm+5Ia7IoyoFqLM/VXpls11?=
 =?us-ascii?Q?7yrHMB+FqeZ+NYkxFAAxW15lXDCEdph1pz2dvM9zxx+ngUn0gQrq0FFFzf+g?=
 =?us-ascii?Q?IEPgs8e9e151EQPKp4AAMnbD6YD4Ec1vDRlBRPIRhKzIv2q9GvXS9awJwl2b?=
 =?us-ascii?Q?z1hw/JilYFpd+otdLvQ9bXFVDF3pMHsp3qSuFnjgLVElEbmf0Yd60lct8eYJ?=
 =?us-ascii?Q?dlCdsRUXTAGILSZHgjhN/mgo8r7SukmwZBdcY8crJvI2szb6Bca839UDxkVC?=
 =?us-ascii?Q?q6rLsTkOntYZooVAVdbMBeyJPW+e7qrt?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?r50S9XlfjLHkVNuFsH40dNYuLlY0zczVmgUJ1wP3HMFB/E1pGu9whyHaC9Mq?=
 =?us-ascii?Q?h87vJaWiZWsAqZ4Ab7m/e+8PAl064pRdIpushyz+iEU/s1hee+NcDaHwjdPY?=
 =?us-ascii?Q?ktEJQv/Ds/N6b04Mp9DHLwmBX8VfHw363QcT4V5mGCrsjhPBqEtJ0xkoyQP3?=
 =?us-ascii?Q?41mt2/ZJYDGU4n9Uma8dRW1kROTVPslrPDAmw6p/NinDpmyYZzZnwV/fOwF+?=
 =?us-ascii?Q?n+fMsXjn5AjlindnqI5X5G9pWhUF2vcKGXX4+jJndjTHixb09mLPioJ9V4ga?=
 =?us-ascii?Q?FBvFOwetnIdvJZ8BrriGLmMto9ksM+8VWs/SWNBXDgtc4gmKzxQcYpqZy0ov?=
 =?us-ascii?Q?gwX3fNo41xZnekUF6KrSyj31pN4KGDMj9IDPCtxMvrAf0r1m+Iknx0b96xQR?=
 =?us-ascii?Q?NcxZKPrzTOEm75LH+AkXAZvgeAdvTmQWQM+DDn66oPcqeF6lTkmhHCp2E5fE?=
 =?us-ascii?Q?b4segoMr/vqohS3MT3nVzC7RGduqMpnYW4aKyMfNbcVHRXaqwMxOVUfgcKAP?=
 =?us-ascii?Q?YSvMFkXZdtIZug37TWUDvesRiMJv1wQ42vqvJlxDOMioF/EWxczjh53zK8ml?=
 =?us-ascii?Q?3NiccNQPVFtDytQFMIyDkRbyLF410+zjacMbizBhHzYsWXOS3uf4bCLProRa?=
 =?us-ascii?Q?oyjfLAQvh6lSk6BWputIg4KZrBbHg+HNaVyY3T7tML0RH9SD9mv0ewgev6IZ?=
 =?us-ascii?Q?/I3u3CkhoOQNb8/upRinvZIC/8VWQY2zAW0HYMGe05+qNsQmkYkAQVbTeCzB?=
 =?us-ascii?Q?me7FPil6/PLYN4O2agxOMe5+VXKNtmaV7+8Nu+YzFrVpP9apdIHVNq3xW23i?=
 =?us-ascii?Q?60we824lMe3NkS4mQ+ZCIm8VjKFzC6PrL8URDhGxmLSRMGhhguosBitp25B9?=
 =?us-ascii?Q?bF45SZ9+Ww4oHXclo6YMEY4BDpNoPFzig7Yw3PwYjOUnKrUWXrVawqa3hWl+?=
 =?us-ascii?Q?n7h7NkFx3oFRfOkJ9d+uYXHN60pSNV8JLtuttKqoDVIrtfg7g/nmk+93DtqL?=
 =?us-ascii?Q?uxmHo1nRZk0gxVrcaqQ9w1olFMFeCG5KWoFPsxiGUQ/e/M1AAvysOEnZ3xng?=
 =?us-ascii?Q?SYFDrT08tdCOAzsmwjjX4iFrICgNzyC93OsHrrheT6cRy5RzUkyQ3wS46oy8?=
 =?us-ascii?Q?Y9enw77YWJXYvDQhEON+63lVjia+Ufja9T0ns0I7+xcfNduk8Q3oTWWfCnB5?=
 =?us-ascii?Q?5LVG0N1LcG9BJifN8Kcx2+JamhBXTn5LKx3c12ef/XwrgBFZ6Q15Ov7LCgR+?=
 =?us-ascii?Q?zV7hSaWslgJn5WY/NmXA2/CwQiijiZBkT1Fif+u3xIuhd1mlAoYpP+pWMPuM?=
 =?us-ascii?Q?QIUwPAAW9I2fts2+DkdiGA50YblWfZk4r2NG/wgqNbJ2yE/POYyOv8hJVRyp?=
 =?us-ascii?Q?TIeMNOXTBMALf7etdG1/9MxEQO00BjKrVXUF6iepzHD1ZHzYBfbmQPxMZfsC?=
 =?us-ascii?Q?YXSJ0svktYp7+eKVFn3L4it/86z71t8VZTj160bTRJ0Ky+THQDdAoMbeRlMZ?=
 =?us-ascii?Q?cc/J9lvCOdrZ2fkCuuMl+/rm6eCX2/kaQ6Db7I/yFOid/FHE1ATbYC92Ttgt?=
 =?us-ascii?Q?R1rugMcJqqlxr96jKpLP23Ajwzy16onbPZMh4PAO/ar1uRQ4BK7Lfni5Mykt?=
 =?us-ascii?Q?gA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2980595c-0cb6-4f4f-6448-08de1d5c442d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 17:45:25.2701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YFpZLwXkZzdI86Z0ug+h8H4D+SOGxgMUGS0ZRBbzOb6JQt9dAYURc9uqOmSf2hFIAPZvIg1YdxXLEHcfJXxEvchcOoYxpKsiplYkmf8dB+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7036
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

On Thu, Nov 06, 2025 at 03:35:17PM +0530, Nitin Gote wrote:
> Wa_15016589081 applies to Xe3_LPG renderCS
> 
> Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

and applied to drm-xe-next.  Thanks for the patch.


Matt

> ---
>  drivers/gpu/drm/xe/xe_wa.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 81e62291af45..3764abca3d4f 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -922,6 +922,11 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), ENGINE_CLASS(RENDER)),
>  	  XE_RTP_ACTIONS(SET(XEHP_SLICE_COMMON_ECO_CHICKEN1, FAST_CLEAR_VALIGN_FIX))
>  	},
> +	{ XE_RTP_NAME("15016589081"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0),
> +		       ENGINE_CLASS(RENDER)),
> +	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
> +	},
>  };
>  
>  static __maybe_unused const struct xe_rtp_entry oob_was[] = {
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
