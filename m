Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F971CCD185
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 20:05:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 615AB10E4F7;
	Mon, 13 Oct 2025 20:05:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpMSjt7B";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51E0910E4FD
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 20:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760385952; x=1791921952;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UwEwZCrXJFH6wSy+qDyDaelaERAvfDZxUG91ZdYKYLc=;
 b=HpMSjt7BZy38T+6azA0ybX0Lv6lvKVuhOpgUqKAI/MC7IHVqQYtwwKbh
 xAlWMqyBTrtL5dNK4C+yPd6ALYL3v0e29ru+IYgx1W62NKVVMNJs9NxJO
 52B+XScVFHx0K2Xord+DW5EkrqsMz/WWOPopT1u95n4uhUvpG/HvqJtiV
 jGG2OtO+Gq5flYRrwAXhIGPxMnhsaHjB5vBh1QqIgUy77nGenlQvt1WZ0
 6yrSeftjPB0ZzCOtqLSNOEChIF17qBeDhoZWeMgy0QuQBxxXuiqHtv0B6
 KT9GioopLOhva5Ook6T+/+Um7Dk8eqpN4sees8fO6fHInq5vCczzPgQDC A==;
X-CSE-ConnectionGUID: /Q6p0kNXQqWrKFGXRHZNxg==
X-CSE-MsgGUID: pyl9JYF4SEO7z6VkdL9Y1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="61576504"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="61576504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:05:52 -0700
X-CSE-ConnectionGUID: 9rM436sgTYKjgu1VqjYgTA==
X-CSE-MsgGUID: 0jkSmbXhRlmC9hGXNZCP/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180919644"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 13:05:51 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:05:51 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 13:05:51 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.34) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 13:05:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ovIas1zqD9mh3hVQIktlLBdmRsm7Ry21fTKb7j5lkhV3L+1MB8MBtu3hl6tqKFw0LolysqinrHe0dXQ0B9zB/ldDZyHi3d5VOOmPC5nOV/DGJwYTVJwc0HceqGyT+2GPH0S8hZVMflgtdpZ/OCfPXxdE2HbFCpObxSBAQmikhrPEaly6DrPvMYfAp9SFzbSiFq/vOv7HrZ7ailMAO6GBKHk4S5e0YYAXkRxefG5fK7J8uYjhhjW7sTSPE0ygUj+zyj4PXOh8x4N2XnN8oY5azStRx7/6e2DAXtKfIrWtc46AARkPQFk6lDuFeNXmQ+11wKbUNFKx2R+7s7h3TBtOtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VoAIxsSSjv216MdF8LhAfi+/cKLk8qH09P++hPmmEs=;
 b=aLQvfB4u2sIhjfDLrJsb4qmr/dEmIkwE1luMU+uJWz6m/y/wY5bmHZZ6F0F3WKjkKjDuZIR/iOpZ6PvBzVjRL0HkLp402w/pAxRVJwpGv9Y0JUO69VtiBoRAlV3qrFJm2/v1z0veYcxAIMoTE7XUt3WTMPZygOQsg9L7pecJB9Cx/OXY8MwsMHgq+WUSyWh4OhdY80tx4/l1OyoR6q3sE8hz8a3XbisiKSGZ1izdVCdLg7Brzwyt/75LeX6mubdRFnWyHymKI7A43EBVqtM25OFnkrbYhexPHTjZ9WQRhOsINWUSCIaxbfOR7s4oVz0TltIAEZh39p7gUy605hkyEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7603.namprd11.prod.outlook.com (2603:10b6:806:32b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Mon, 13 Oct
 2025 20:05:48 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 20:05:48 +0000
Date: Mon, 13 Oct 2025 16:05:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sk Anirban <sk.anirban@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <raag.jadav@intel.com>, <soham.purkait@intel.com>, 
 <mallesh.koujalagi@intel.com>, <vinay.belgaumkar@intel.com>
Subject: Re: [PATCH] drm/xe/guc: Eliminate RPe caching for SLPC parameter
 handling
Message-ID: <aO1bl1mk5CL7uP6i@intel.com>
References: <20251013064214.926115-2-sk.anirban@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251013064214.926115-2-sk.anirban@intel.com>
X-ClientProxiedBy: BYAPR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::47) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b798f71-798b-49cf-5655-08de0a93e6b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?X+sIK5vr9UYLKg5yunrG2+o5y0n+zjErn9DDeipBJRhkSTTlo0jzRcTP5Ael?=
 =?us-ascii?Q?tbMpBB9AMkv1cGJrLPC0kOQ3XHM0vrROCdir+vTPpAooAmz5MasWbf8GH8oa?=
 =?us-ascii?Q?eNr6x61r+I6R0SOPuaUmzUE+W0Klkzx+LCDRC6RA8gwIjH2Ly+PDjBJxNUdl?=
 =?us-ascii?Q?H9WhV9H/c4NTBRU0LpzN9sRY2MJF16306B43WmsFPzbd50CDwGYu0EeXh8cA?=
 =?us-ascii?Q?CLIQGd9Qel8wvA9KUZCGi63CZdyi2mUeeFmw3DdYYA6dEmJjuaqQIwV/rj+f?=
 =?us-ascii?Q?nweLsXLGuqPb0JqoE12c2qe/X3cyumo6JCpx21JLsxXPT2Pxb4SenKNort4a?=
 =?us-ascii?Q?GzwB5FKShZdRr47XqfV75nbs+eL7AoVaqN0heQ+bGJ0Bt75YqWTztseBupUp?=
 =?us-ascii?Q?N8Ly9qGEsU/ygLq15BNycA9pPCQ/H1eBTE7tfx/5bg1ejFHDVqbfwIRNUhCc?=
 =?us-ascii?Q?Bs9d9wWyo76/JFzMsAqFjs3SkMtmazgcbrPcbCi0b6lDdVW82SK0K0fyPtBx?=
 =?us-ascii?Q?iajBACQ2ti7tVCaS8JubJ3+dULkBufva8nDp/ufig0nSGPXU7TOIRp/OOApU?=
 =?us-ascii?Q?HuW3NyltzKkdXIVxtBOL6kn9rcodQXGioEOjqOUIJ6cAWEq6wE8pa6hWnL84?=
 =?us-ascii?Q?3X6vfjj+CA8PCTCKJPk23RNVRjOhqQPoMP4tNVykh/6MSMScYtrstUkrJo8C?=
 =?us-ascii?Q?asaSfNeN4OhZVTpjO0lvaaHkQ1exNGFnhdiI/XSjzHqwl6m5yIzIAt+NosfD?=
 =?us-ascii?Q?wBfS5i8UXhIwKVxLGNxmjVu/M3awbkjqLPcDA/aoFjBrfhW3iXJgm0UBWUTC?=
 =?us-ascii?Q?LanI8hmR9F1w1+3R2AHl5JY2k13YquGoDVJORMWpJFmm4V2JhWV5nom/qN9D?=
 =?us-ascii?Q?IdAmF45LR0V2wFBHmwPk6mWq4755ztt4M0ASzDXAKjCQOo9pEQ0fIlXPc9KI?=
 =?us-ascii?Q?FokraLRYDirI9mIUhmiIlp7T/oWx8R7UPtBSPi017gV4khpBZDqNl34qElfU?=
 =?us-ascii?Q?+KMdXTDHzSIeig22UreVfRfob+xpuH8QVdAkRP1QlQQqPiNRQbV8+XEoEDET?=
 =?us-ascii?Q?OZKh+iQV20kTNQCaYR6kIA0+HdEr0ySgAKORhSdoDI2Fe6o8I+89k8C0UevI?=
 =?us-ascii?Q?DkQvzq7Y+zF1u5J6HwAujvzNJb9UAdqpssPENoo/0pZRi5mnlybSg/lnuP2q?=
 =?us-ascii?Q?GHp5LS+8cRa6/4mlNzMxRSwjPngTSVZ1Aug3PuJF0qBwKK7QVysZCptnTAkL?=
 =?us-ascii?Q?lJw5KPcdj0w4IlLSu7+3ihic5ZiA6W5QX8E8qWMn4IWmXRaEY0yywNgex3J4?=
 =?us-ascii?Q?vVXkT6d2byeoTDbv/wRqZxuY55TC0hAcO6HMDDp1eoK3yWMXHYTDALWiNFzb?=
 =?us-ascii?Q?fMMjKiI5gwWfCPcPx3E6hu6VDmbN69ASisY18o1xjlq34x/dPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Kg3/0CgNnV7SL+9MBA2EVV1FH1QhMcYsK0FTjfu6YJgejjrMoAU50ydQT3mj?=
 =?us-ascii?Q?7aIb7zjodvvpOJwPGVY6g5JUAB33zZI3pSWIT6p7KhCplRo3cK1fVTswpD0x?=
 =?us-ascii?Q?8B9ZcXGLkGdL78pH2tMe3+BuL+WpahRDEj3w/lp4N2XU5dNt3x9shVot9RXr?=
 =?us-ascii?Q?WGszF3BM0Fiy/JaYdY6i5ZcJx2Y5Frj3fqzlgHyGOXjV7lobmgiTX/wLkJ10?=
 =?us-ascii?Q?z2QUy69emnspnBQlmM5liiNf4DzIvTVa0AGmV8T+m7HfgBt8KNWa7HkeIkjM?=
 =?us-ascii?Q?Eun/xt4Hxcol4CYkLELSuOZ4O948IA46bNbqD2iiAQ6cBsOT1twe2ighi0oQ?=
 =?us-ascii?Q?eCWdQDu56/S+yjzclZBFghbt/skPq4wtP0bqAXFW/qIiB24yC9UnJM0CMdoz?=
 =?us-ascii?Q?nzMk+u9KHr8WmK83xEdHH1DYoXz5Om7hq0wdVJO+rj1PfKiAGW/7wZTqstXR?=
 =?us-ascii?Q?EUT5Dg+cnEr2aTtcv/unoDRFUxaIWs49gEJFdqR2763MvDeoNl7eMS4bYgmD?=
 =?us-ascii?Q?HI99EzNvvsKPP9fjfcjdzc9L5TCkYOFAWMaUitp696EHJ5Djyz5kAoc1rC36?=
 =?us-ascii?Q?2hJ2yJVbMxID1cxd4LILaLPwlteeW19mbMbNJQFw7X0HoE9ouwHfOzsN4Nzy?=
 =?us-ascii?Q?/o9eYL0n++XfdGZ9o6DY52X42k8jXn7OjAA53cWOUUUVfwfHjsgBL/kIBbbq?=
 =?us-ascii?Q?ByYes15RkYmJFuxvxcYm28pDF2QK4C/GuiWwR9sfGu56c3cLCBy9i38wl6dC?=
 =?us-ascii?Q?xH26n8HyzcKFy9eM3ig7sN9OBlbVXdNTcluRTq+khQwmcZ9ijSfxd4xY0wrp?=
 =?us-ascii?Q?RSlJNjfAwkvO+aoEP8/rCof1/Rla/+4UuJBVis1llCNGrdok5uVBBdTIH1zj?=
 =?us-ascii?Q?9thJ2ZY2Ut4m9Bkv7lniSalRWZimRxtSi+NK0Rc+i+Yqotx1oST7Thgp1+sz?=
 =?us-ascii?Q?XzLiJLrN6Ozpgr1PZDnfYn/02YXifeo849KTD45AG2wes5Uja5XfoBQBQq5B?=
 =?us-ascii?Q?wqbBscIH+yDSepch/2QScNoN1AWVtyDwOCaangP422sim6mTs0XyZrXof/Ji?=
 =?us-ascii?Q?EFz382cUQrXxZ90TJ/NlpJRkZW6l6YOmlFElN5tPotSbv/devGwEfAQduk3G?=
 =?us-ascii?Q?0O7IKGRsn67kMXiFZ05DRO/aaAxam0iRpwLg4ua4+yGS2yH93//acDWIl/eV?=
 =?us-ascii?Q?DHMw+nGb9myk9lZj1fRpcKzSg/W0lZDRGPr5wVwAAc/YH658rvIBJ8YKkM0u?=
 =?us-ascii?Q?f5kUBYVpheHSxcV8qfazs159XNCCQz5G0PtnBDqJGSUjhX6z5krP6khbc88P?=
 =?us-ascii?Q?CGoxPu39xArBdqGUNbobqhvzA1C0xO3FwuDpi00ezDKe+Okg4CcmKbh5jjPK?=
 =?us-ascii?Q?Vb7TZmr+kCHJP7iFiuyNzZl7iUnyy+4CriWrCCn5dT+HpCq8SDyIcOOqN+pd?=
 =?us-ascii?Q?tXgEEwJT+l0gtzjTXDkQwRX5mc7+kjiG8AGiS3+38sUZ6Jt6pflmUJFVaja4?=
 =?us-ascii?Q?ZZykr0W+Oa6LswDBtXxn+oV3YgFX6dSR4th0D6XBkU2qF3TrwdX6ebZrmJEn?=
 =?us-ascii?Q?ovp68aPnFTjXSDO7gOWxwTIptUIlUtIgeKULWgS3V7yajYCf2prdxheXVm93?=
 =?us-ascii?Q?wA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b798f71-798b-49cf-5655-08de0a93e6b7
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 20:05:48.2530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o8dOmi8Jjreq6wiG1uRSgg1oWFFFfSD6tQsdthZzhlYqVj/rm706344QQaHleA3DsG/9VMnSciX1l5yaEsgExw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7603
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

On Mon, Oct 13, 2025 at 12:12:15PM +0530, Sk Anirban wrote:
> RPe is runtime-determined by PCODE and caching it caused stale values,
> leading to incorrect GuC SLPC parameter settings.
> Drop the cached rpe_freq field and query fresh values from hardware
> on each use to ensure GuC SLPC parameters reflect current RPe.
> 
> v2: Remove cached RPe frequency field (Rodrigo)
> 
> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/5166

Is it passing cleanly the igt/tests/intel/xe_gt_freq ?

Thanks,
Rodrigo.

> Signed-off-by: Sk Anirban <sk.anirban@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_pc.c       | 36 +++++++++++++++-------------
>  drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 --
>  2 files changed, 20 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 3c0feb50a1e2..2d1d5121555e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -330,7 +330,7 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>  	 * Our goal is to have the admin choices respected.
>  	 */
>  	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < pc->rpe_freq);
> +			    freq < xe_guc_pc_get_rpe_freq(pc));
>  
>  	return pc_action_set_param(pc,
>  				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
> @@ -375,7 +375,7 @@ static void mtl_update_rpa_value(struct xe_guc_pc *pc)
>  	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
>  }
>  
> -static void mtl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 mtl_get_rpe_value(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	u32 reg;
> @@ -385,7 +385,7 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
>  	else
>  		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPE_FREQUENCY);
>  
> -	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
> +	return decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
>  }
>  
>  static void tgl_update_rpa_value(struct xe_guc_pc *pc)
> @@ -408,7 +408,7 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
>  	}
>  }
>  
> -static void tgl_update_rpe_value(struct xe_guc_pc *pc)
> +static u32 tgl_get_rpe_value(struct xe_guc_pc *pc)
>  {
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
> @@ -421,10 +421,10 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
>  	 */
>  	if (xe->info.platform == XE_PVC) {
>  		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
> -		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	} else {
>  		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
> -		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
> +		return REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
>  	}
>  }
>  
> @@ -433,20 +433,17 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
>  	struct xe_gt *gt = pc_to_gt(pc);
>  	struct xe_device *xe = gt_to_xe(gt);
>  
> -	if (GRAPHICS_VERx100(xe) >= 1270) {
> +	if (GRAPHICS_VERx100(xe) >= 1270)
>  		mtl_update_rpa_value(pc);
> -		mtl_update_rpe_value(pc);
> -	} else {
> +	else
>  		tgl_update_rpa_value(pc);
> -		tgl_update_rpe_value(pc);
> -	}
>  
>  	/*
>  	 * RPe is decided at runtime by PCODE. In the rare case where that's
>  	 * smaller than the fused min, we will trust the PCODE and use that
>  	 * as our minimum one.
>  	 */
> -	pc->rpn_freq = min(pc->rpn_freq, pc->rpe_freq);
> +	pc->rpn_freq = min(pc->rpn_freq, xe_guc_pc_get_rpe_freq(pc));
>  }
>  
>  /**
> @@ -560,9 +557,16 @@ u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
>   */
>  u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc)
>  {
> -	pc_update_rp_values(pc);
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u32 rpe_freq;
> +
> +	if (GRAPHICS_VERx100(xe) >= 1270)
> +		rpe_freq = mtl_get_rpe_value(pc);
> +	else
> +		rpe_freq = tgl_get_rpe_value(pc);
>  
> -	return pc->rpe_freq;
> +	return rpe_freq;
>  }
>  
>  /**
> @@ -1021,7 +1025,7 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>  	/*
>  	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>  	 */
> -	ret = pc_set_min_freq(pc, min(pc->rpe_freq, pc_max_freq_cap(pc)));
> +	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
>  	if (!ret)
>  		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>  
> @@ -1339,7 +1343,7 @@ static void xe_guc_pc_fini_hw(void *arg)
>  	XE_WARN_ON(xe_guc_pc_stop(pc));
>  
>  	/* Bind requested freq to mert_freq_cap before unload */
> -	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), pc->rpe_freq));
> +	pc_set_cur_freq(pc, min(pc_max_freq_cap(pc), xe_guc_pc_get_rpe_freq(pc)));
>  
>  	xe_force_wake_put(gt_to_fw(pc_to_gt(pc)), fw_ref);
>  }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 5e4ea53fbee6..f27c05d81706 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -21,8 +21,6 @@ struct xe_guc_pc {
>  	u32 rp0_freq;
>  	/** @rpa_freq: HW RPa frequency - The Achievable one */
>  	u32 rpa_freq;
> -	/** @rpe_freq: HW RPe frequency - The Efficient one */
> -	u32 rpe_freq;
>  	/** @rpn_freq: HW RPN frequency - The Minimum one */
>  	u32 rpn_freq;
>  	/** @user_requested_min: Stash the minimum requested freq by user */
> -- 
> 2.43.0
> 
