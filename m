Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D3BC2BA1A
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 23:14:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB42810E296;
	Wed, 19 Jun 2024 23:14:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kRpfYiRP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D6310E2AD
 for <intel-xe@lists.freedesktop.org>; Wed, 19 Jun 2024 23:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718838872; x=1750374872;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=uuYRWhixN2jMM2IHX/y3Go814AQXxthp88t593+xOT4=;
 b=kRpfYiRPBRJf4S2ftHbCNgzqOPAHy8hDfEYu60xiYlS9M1KZkLg3EUsB
 nAn3R+KhWIrymRmubPCdBoYvvcm5izDBMEgVIEYpMyZ2yn3PbFHZW/q6Z
 OpSw4/j/FbJIG60RyReCIywhOSeVh1yzCWDJq/hWFz7luUhoK+pFkRlat
 tlKmtuRP4n4I3Ve4jX83RqVOXcKq0/aINpz3ePNYy5k+8F1yVt9nonZCp
 2qF5poaz1PjlQwXJP91PbsvkIHHl9gNh2C7UNlyP4d6AEaCgldD7y0Y4F
 VpG37rh8Z/X3eRd2TU9nb5RId3in1/PmVsNzSZq2snMk8D5CuQG+JX24R w==;
X-CSE-ConnectionGUID: oPJRuAFDSQ6vu1TlUTR2xQ==
X-CSE-MsgGUID: j3cJMIV9QV64qbnwqsU8Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15507184"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15507184"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jun 2024 16:14:19 -0700
X-CSE-ConnectionGUID: rCPw41INREy5IopgIbqFeA==
X-CSE-MsgGUID: 0a4aDqlGQlWin4HA2/szgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="46424643"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jun 2024 16:14:19 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:14:18 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 19 Jun 2024 16:14:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 19 Jun 2024 16:14:18 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 19 Jun 2024 16:14:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu7sjPTOmmAktIUQpDReGjFwn4a6o2joTHtQ7sjUcsot9cLVJyn5vwanfydgQxVtMKtDcRw9VEBd308cpnSN7yO0NNSNMEgpjpXun6GjvP4PFv0R/tdMClSauyT24cqhddB8GiahrPqptYWvVrd9EBJ8qN36gPBWIDT1Yh835ZjeKWyQZQ0e0xFTMeG0pKH9k/63btYSmM8c1b0wZd0snr74YssTQVfgZNCuxUbPcf9TdDM4fE3saZEYJxjnxMtwBk4gI7iuibMuPs+/FX19Hhxo2DFXCDooG1xjhyWe4NXiJqpaBXSNOZ89+kk8yCnMWUqXo+ERLFBhb0ipN1/XBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzNiu4qZveijruYSsLpfG1SdPfqot/b1BVRBc8R+Q+I=;
 b=R8BHiaIzzYec0QBlw2pwREyfXOPKwCHTIZ0LJFPWS5d8cwtK9fKleWEiXJgcj5h69gd4i+JmHovCObB9429Bsd1vxxDz7fcFsqonHFRCkMB4lEK9umyhXtRsW56G5XfIhCxXbM+Ck3fvJMBVQdRehJr6WuKP1nT54Nj7zlHswkEZXpfROZagds5GXCVdnuJmax4mQCz96o4jOWM3nji/65OmUSXevoUCV2P76sO9JeYHGcJj0rTKyEOsSxfJl35w+NrvGYaiInngA3ol+Me6Z5T/WgOudWvgE/Ih0hEpohrXQEzO/SJeOP2bpZpqFSvlbs6KBex9QEJLiCH6fCMKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6405.namprd11.prod.outlook.com (2603:10b6:8:b5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.31; Wed, 19 Jun
 2024 23:14:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7677.027; Wed, 19 Jun 2024
 23:14:15 +0000
Date: Wed, 19 Jun 2024 23:13:38 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 7/9] drm/xe/vf: Don't use register based TLB invalidation
 if VF
Message-ID: <ZnNmIskfVCxr/8Xv@DUT025-TGLU.fm.intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-8-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619214557.905-8-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR11CA0106.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::47) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6405:EE_
X-MS-Office365-Filtering-Correlation-Id: 000fce33-75b8-4cb9-53c9-08dc90b589b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nPnYsstJp8SaEwdpN6rSKboKT6D4T2o58+GxH+QXQhgN+WggD4FT29vZK36A?=
 =?us-ascii?Q?tTOc3VTsWLWJos5NPeTrBIiciymGoh0ugQFAOoQI9re1vJhpe8V5ZWF3kpIt?=
 =?us-ascii?Q?xkVDDSob2sdgoG+V1qUq1hCm2Y7dh1Pd1G8lbbqN82SmQg+auFUAA3L6iamj?=
 =?us-ascii?Q?C2d1buewNyc3mnmDimlob70O23TQAYxgxd8ptHbyTm4dPhV+7lnBAys5WdST?=
 =?us-ascii?Q?exnvhq9MHt7w+IO2boQfkaEOueWahu1h07Gh3L22aJc/sXdLDA563nrh5/VO?=
 =?us-ascii?Q?1f3Pd7Ed5SvK4qVXrCPHDPmLj7NT1HrgMhVii6oGW5QsyXcCxCOqKVPCh/1i?=
 =?us-ascii?Q?wklYn2ULBWx9t0YyP8ODATU4Tx+Sbcwpr4iqTa4nYfrbTGKzcMFXuhhWHAfG?=
 =?us-ascii?Q?cizRKSLtxvdddLP/UrI/GWagvaaANeG8xwCgLyasph67Sx83jH4ZHdemrP7p?=
 =?us-ascii?Q?JVS/cAxmqbSS4rbLP6uwNahSk5Fk024JNbrK/VlXenK9zyelvjHNH/GnmkSP?=
 =?us-ascii?Q?hhjhzVWAcYkyi2LrojeE2DvyouxpLlhW51GZw3xepcz0BVRHhAYXR/DZeqFy?=
 =?us-ascii?Q?jvg1C9Iz54L151jBPpIhZHzLdM5jOcUJyTviEkENi1Q/P/+Y4p3zF4Ih1h+O?=
 =?us-ascii?Q?k0oMMgLU+bXID3HFdG/Pecg7RfR+eonlXrus/gHwM8M+i1GPjfu0uc01vg+Q?=
 =?us-ascii?Q?+uBj3mG37vTgFbxveKGTz5F1ie1da42usoMrqjtqWx2QWfSnMSYKb8GxrX2U?=
 =?us-ascii?Q?IW9IrskEvbz4av9yGqq4fInXc11vq0SU+dfM6lTs0e52hHtAAi6DK/3Gqu+X?=
 =?us-ascii?Q?wgGKpNUCEYejZQUichjNmhNDBNuRZdGHjM8AC7iPPJBlNcC5XoLz5Q+Vmg31?=
 =?us-ascii?Q?j6P7W3NGLE/di/yvTDY79bLeSdu9ddDel4d6sHfgSBhv9k8VvlB2sIY/oill?=
 =?us-ascii?Q?Gc7VWGLnw+BuU8N6a5vImuq5Go+x+0t8G2j6DZ1uggY4rbX9BWrRICcvWbZk?=
 =?us-ascii?Q?Bq/9eDMLtvm4Npvf/Zb8hc+FfSUG81VA5y2/3B6vKP/2tDTOYG7BcUz8UX6e?=
 =?us-ascii?Q?iAzCLYT8DqXKDXdFkmOSXonnYzDyRx7PJjOD9fd36kgAc89+7TfTJliL2RBA?=
 =?us-ascii?Q?H+r5w1KCHLFVuSgnumobEyascr+3j9hJLm9CdKU/ZGhG7r75tH2j8KaKuW/Z?=
 =?us-ascii?Q?1hKCX5doaVj2OZnsQVqzOcPXitsnPpo03q5QkX/kLsn1CzbcFxEMCVyyw+vL?=
 =?us-ascii?Q?RUQ27i+hgk9ExswYjMSDCjLaE5hg6VkkriQp2oMf8hdbbySDRzx8T28J6D8q?=
 =?us-ascii?Q?xGJW+QGeiJfjU1xNublH0o1/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1Ec/8LGzOOj1gC8nrgx1B/3gFhCOcTqnyhpQwMo+kv08I2OaXwfDVpXLBKVG?=
 =?us-ascii?Q?YtYk1yFWE2Nbi+1thVmXhQ0YiuzB7CZ3x6dSS4ZKUvcujp8/e/UohZCeJ/et?=
 =?us-ascii?Q?m4yYmwB3Tj0DJY6Dmp6fBy22NgTbGDnrbYg3vbVLVUfurBVJzNXlJuaVuODa?=
 =?us-ascii?Q?BLoisgzy1Imt4fqZ4Ad+UxJkivRFEf+srD5uSgX9lZq80o0Fqb8roZDWurNE?=
 =?us-ascii?Q?Xior5DDjGCD4tgIJXTiuk2Crksu8v58I+5+Zr+jRv+SUZt2KFDliiLf2iTcC?=
 =?us-ascii?Q?hMYmof0HWKz16e3y8pTfwko6zYTmzmGmIsgrNzLmvKWWh5AsoqjHfK97zEtV?=
 =?us-ascii?Q?P5+KHYk6r6WwVIONEKKyR673cIkCFE4s6393cq/ZqRD3OwdDHzMQUaTk3T+/?=
 =?us-ascii?Q?oeaBp4gx2TmnhlWUs3ZIGrBA/xJZgCrhioI7afkj0OYLwKkz1j/SXi7gLESh?=
 =?us-ascii?Q?iBvMAGyckEcmyCJaMmdrIa48VI1wbfwaBHIa3TKGSW/cVrriR4S3kp/sGvJE?=
 =?us-ascii?Q?ShoyZpa0Xm4xRmEqm8sLxdiHWsKdMSCmAoBBgBo90fivXL8xyEYdgch06fuA?=
 =?us-ascii?Q?jLy8YdhKCvud/8ZotEdJv2HkkJzp829kG6WtPPa2hHc0J6VdwtuFXzCltBEs?=
 =?us-ascii?Q?YFmPYCnXuOaJI6aMoMsdL2fPkmcUKon4SG41X/nUdLbXBHlmRY0avgmqNrm6?=
 =?us-ascii?Q?FNjSA/U96PQ5rVHw2RUn3I5a/sHbKiDB7zkfRJcn3kLkHbS2ezpw+6rnB6O+?=
 =?us-ascii?Q?fYqtPt9Jn5wF5de1DzVNkeJZF2eTHcoNEKkpjG4geN/qdDVdOjlcWB+p5UI4?=
 =?us-ascii?Q?SbxQ51DNW3OkP8cfBHzGSAkYvySGFfcnRP/wfy2zI/AefDfxVyQ1TDDAk21V?=
 =?us-ascii?Q?ozud/JQyDYp7zOafh2G31ZvOOHXOhUfo7JHlJm0NFs3yfixqTF6HT6nXfmJx?=
 =?us-ascii?Q?BOFGqUhsGVj9ETGRX9t0aGJtlLBzFjOKPjMaiWzG/X+/GQh1bdjFdz/R4IsR?=
 =?us-ascii?Q?39kyKFcvXrNfhj9C3lJpMP3ZpI7LTGdNkhJWQTa2rAU63s2l56v+2OJk19jW?=
 =?us-ascii?Q?hFIeCeQHii6Q38I0iqMtp1za7CjzlALRw15fwof7JUkwn1wDzgAWdxmLFNf0?=
 =?us-ascii?Q?N+Ay20t5PxrJpO0jZKdw/KAeCo5dJuYAD2H6lsVN/kvSCqmFmwOWfHmQAszt?=
 =?us-ascii?Q?CwqD567oDtLqeUCMwEQ4qZOSkPtiZHe7Pe0+kOaCkizJB5FGWCdCX7FIiwCC?=
 =?us-ascii?Q?A+R3Yl8JbDD2dPvMhjCd4tvxxyiBcP7JNyFVzkZrQQmM8Q0J+mnJXQzWWcRp?=
 =?us-ascii?Q?PfM0Xo2+g/h6qJIl2ooGHea6FRj5ITCxGjqihctM3zoU7AyKps0+YNmJXA+B?=
 =?us-ascii?Q?8h5HG6Urk3Hjto6DjB1IdKAu8C/+81VYmlyQR/5NaHO4+UpfnnhB3a6QDszD?=
 =?us-ascii?Q?75dO87t1GIIuPNnpxFBaZjqWVaUw5X9/hZBTNm2Ww6tMZiGULq/CzWSisUmF?=
 =?us-ascii?Q?uaVV8bnu69312i46IIRswQ0D4muEw24LhYlFAz81cU5i4jlmd5YbEIB1Jy0i?=
 =?us-ascii?Q?rwNwsqC3nO/4X7mUWNJVlHx5FtwYByxTiHwLEmg9/Bw5tf2odQa5IZ5Xl/Qg?=
 =?us-ascii?Q?cg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 000fce33-75b8-4cb9-53c9-08dc90b589b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 23:14:15.4908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4b63SMXuGso0at4p4bsnqbWNuVze9NwLSNZAAuhqx0Ryji43fmEeHbydXGA1sDcy64HK10u1IyooPwalzbGBww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6405
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

On Wed, Jun 19, 2024 at 11:45:55PM +0200, Michal Wajdeczko wrote:
> VF drivers can only use GuC-based TLB invalidation, as they don't
> have access to the related registers. However, VFs shouldn't need
> any explicit TLB invalidation before enabling CTB communication,
> as there will be an implicit GGTT TLB invalidation issued by the
> GuC itself as part of MMIO-based action handling.
> 

Does assigning / removing a new GGTT mapping on a VF involve a MMIO
action?

Not touching registers on VF itself makes sense though.

Matt

> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> index 23d397a246a8..e1f1ccb01143 100644
> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> @@ -13,6 +13,7 @@
>  #include "xe_guc.h"
>  #include "xe_guc_ct.h"
>  #include "xe_mmio.h"
> +#include "xe_sriov.h"
>  #include "xe_trace.h"
>  #include "regs/xe_guc_regs.h"
>  
> @@ -249,6 +250,9 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>  
>  		xe_gt_tlb_invalidation_wait(gt, seqno);
>  	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
> +		if (IS_SRIOV_VF(xe))
> +			return 0;
> +
>  		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
>  		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
>  			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> -- 
> 2.43.0
> 
