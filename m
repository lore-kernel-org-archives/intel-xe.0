Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84BB0C4345F
	for <intel-xe@archiver.kernel.org>; Wed,  1 May 2024 03:52:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D8B610E888;
	Wed,  1 May 2024 03:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XlbGXbu0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F9110E888
 for <intel-xe@lists.freedesktop.org>; Wed,  1 May 2024 03:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714535556; x=1746071556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pqo2H7EXF9SGPqsjPNdz5g28xGdjPChUtZR+M0IKg6Q=;
 b=XlbGXbu05PJEsnFX2Ite9MRbedEs9x4Y351McFISlJvgR15cQrAU14Cg
 I7wOMI7u8j54hgpbGzTanI4W5nyU0coQX74uXrK7bDqbKL+dn2GQqLuit
 3CHX/G4KeuaULTrefR13+22i59D2Ee72ABBvgYhkqB4ZLGHU0tOfr529D
 hT1GuzhXvLEPLqazIzcX3znKUsV+cKwIR04BizYqO9nXK6ZaVIwQGANdL
 Jv2S85CHNFjXn7IcCVNmAADGUFBA9KwhUeMKrJRp6syCX0wn74Rk6f8lE
 LneKASKzp4gsmVum8HMPi8MkR1rWQhS1++aiu9rW3dZo224+NsBi8/Qqy A==;
X-CSE-ConnectionGUID: ZpywNI/qRXSU/SJnSQWINw==
X-CSE-MsgGUID: cpsknwP1SvOUZQtvValbEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11060"; a="35653457"
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="35653457"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Apr 2024 20:52:36 -0700
X-CSE-ConnectionGUID: y33zpElPTU6Nwmm0B6xB/A==
X-CSE-MsgGUID: AczZu7HLRwWh9V07bq6R+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,244,1708416000"; d="scan'208";a="31384342"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Apr 2024 20:52:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:52:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Apr 2024 20:52:34 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 30 Apr 2024 20:52:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 30 Apr 2024 20:52:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AIHab45aqOnnlfuX6vCeQm7+Z9QRN3FWvFE4gp2a12Ag1igcblbA0pk+kRCYn+h2i9lRqoYjhrHLx/ZYd3AmycvkI6jb5qXlgM+lkTnkkY564c1zMD2nBaGdqRs5ki4J9WoOcKrfOAkJAXpg0FoOgdXI+kIVUt+8o3E3WL3kBsh6VxTVPKQ4U8XH4G0tFrwimT/1/XQjAc9FMcXDNfZx/TTWSc4IMu8KWFCfvkubPhUFe1soSHoSa2tE5r+l9/qO2NWVeuOdOzHfViijNxl3h3GvhZpYbaY842ZbzfhczQWDDudHSnjGEVdvR8EGnkbntQXK/ZYebNZuJ/t7mYGr/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9q8JWzxgLF9yUFlDnIjzOKLI8MGosWyEM/Bsl/amZOo=;
 b=R5NxFzAkR/0TItPUa3DMtr45KhBZQUo5A/8w9uu4lPDTkFBkNTTIIWpDdMQ53N0t9oFxcxrGv2t4X+u7raZ1hqQVuw37HPkeYW/K5pBprRBHSbhmQ4odqqnlEWP0jelDsPKNYrH5fNFFOaCy5FMZcClrHIRuIYgwDaZz+CYTJBr4PiQQzDN6VE/j+CR+G2mMvX/q59vFiq4+r8CKkaiivIKiQYjK+gC+BAE2OxdHqX9E5RDcHu0hjlrpjmMBIJfE4lpxBRrHSk+Zvb0WZe8I2z+NL1Mq/ZJCX78AUfX2t+dpGqF6PfrjN80fJhmaFhN18sFd/i0GkvxqF/pA/CG3tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6440.namprd11.prod.outlook.com (2603:10b6:930:33::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Wed, 1 May
 2024 03:52:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.7544.023; Wed, 1 May 2024
 03:52:32 +0000
Date: Wed, 1 May 2024 03:52:23 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH V2] drm/xe: skip error capture when exec queue is killed
Message-ID: <ZjG8d8J4ygt6rNGD@DUT025-TGLU.fm.intel.com>
References: <20240430131229.2228809-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240430131229.2228809-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BYAPR11CA0104.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::45) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6440:EE_
X-MS-Office365-Filtering-Correlation-Id: adea4e49-1204-410f-e31e-08dc69922132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YJ1oAobQ8NETf1q555Ca+vmROItVPbMnHQhrR00tRGKKcTmwR+72sLotLrOs?=
 =?us-ascii?Q?qnm0+ajC9g9b+mq0r5su2A1sfHU2iR52CospzlkTUqgvFkXyr4LvjtvtJd67?=
 =?us-ascii?Q?lqX7AYfr+3sbbWCus5erxVLy9e37UBieE4hOipNi0j6AqqyDpMICsbgRtbYO?=
 =?us-ascii?Q?niFXhaTjih/nEtluUcyrrUnVwU8KutfUBubyMVKD2vlJY5/h1QvDwdWAed2v?=
 =?us-ascii?Q?3zISMXcn6cYhT9139eYpQbe/O2E1PtBHI50PT8YsI5nqO1vzwTG1U+jf/ND9?=
 =?us-ascii?Q?LkG4JzmyWRPoJKyX5zAcBGsUd1m2FYsJjKW5mXCwd6yggt8oQZDJWY7sD6Tt?=
 =?us-ascii?Q?xe1SUVWMfx5gXBNPwivHyqoa7a+mBQ71hvaz38lEfLBo+HRncVXfBezltaLM?=
 =?us-ascii?Q?a8pO4hwYnvn4WE5V1sznTm91M1vKWwLyeEL3q2UoRnHVX8xrzxfXy2NtQgP1?=
 =?us-ascii?Q?6OqTZJ+NpZUrR4nZ18yIh7StWSfdpDZAwQMlkTqy0eSIw0Afwhcf4orcuzLe?=
 =?us-ascii?Q?DtZD6E6Ia2ja0Ndym5+0+bJtVQhuCVfThEeAoUNOCIABBPo8gnKOYm5EN4ek?=
 =?us-ascii?Q?eUX0mcW4RDXSgjTCQACuG5nqwofHYROzhOh2hai0uenP10R/e3SIaiV7ksOc?=
 =?us-ascii?Q?yCr7Kh02vdAxw8fxD+M0FTyRpwKVahWzKDfFqFeGWik4f0Yx19jFw2oVaGAn?=
 =?us-ascii?Q?EzkJGymMG5YYgOPA/tz5zfbxvMqqVarRziIHOyjkuwSl7xrXhWIdvewMET2+?=
 =?us-ascii?Q?01NG5bc1/YGVGJnDYVEFGA9NO89kR736v+GRL2vTHDCyyFm30D40PRV+7zzu?=
 =?us-ascii?Q?qPNOzv81cLOhmRwgE2KoeowfZtt86cGKdYUfVmjgiPbYeqd+YoVaoYm3e+Wi?=
 =?us-ascii?Q?eb7f95PsmU+/jDxcFDeOHzwktNanTaB1jo4e30RkfmQ6Ha3bpY4A5VjXvSqC?=
 =?us-ascii?Q?vduWittT10xHfWqt+8fzAokmwO2AUOMCRbLBM9fNkIEQMtXCcr9izyPxR9EF?=
 =?us-ascii?Q?XM4jpCSQR860+CdUfM9Kr4NuEhimQ+d3iw9d+MGLbjrvcNmgi7ndnov+3S2o?=
 =?us-ascii?Q?X6Yj978Vg5iPfD3N66du+TH4o7mAEOaQKvUKrj6FV7eKwZvmelbOP1NysS45?=
 =?us-ascii?Q?hYAJMOv7Dbv0cvNWoAY13tK4jhsTQemm04MLQfI7UHIrrePN4i/xTqkCPsjW?=
 =?us-ascii?Q?iMveFjSYb6dk59psbjxEyORo3xtyl4NCRHZORwJvgx8Z7hPiTVWOh7jNHcfY?=
 =?us-ascii?Q?Tmv944ZY5QLFiOemyqcQ82frmFvpZBWQugzPTaXMmg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m9N45spYmmHZaE1rGcKgZEohlaggDl3BF+uG85c5bLIwEoNr95zFY72r2FzO?=
 =?us-ascii?Q?zlnr+yt6wrm9/7qYpq6RwdcbDDlYwyWzJ5AbUVLWT0XP6NsI7sRWsRK7R1uU?=
 =?us-ascii?Q?FFmvigwdSbN0Te0OXQ19VjrkLGIOGHBRUDPGZns9WkkMMd/2xR2Tsr9gHoti?=
 =?us-ascii?Q?ll8C6LT+VTrTt2xFotdwu7SxH38EAiDbRopIpK1m6Er0ATWueOV3RkF8XYch?=
 =?us-ascii?Q?O5tJDiHRWW/5JlxzBsatYk0w770iwZELKJhLOsLwxKiU0GL+cyUETbTjcdPH?=
 =?us-ascii?Q?I/8FUBru7TdQrF0HxUWcA+4LdG4Pn9DDZoWpK9QBfJv0jEG4l1Qya8/UVOpV?=
 =?us-ascii?Q?NqLxRTJjkm3DxRy40u2wzXKKLRMZNOX9euTvWDEvmyHpr3+FNNfBMhNDsrXs?=
 =?us-ascii?Q?OhywWO2J7W1TqThlyLnL1Qma8Pz6SPd3Vrde5pfBbV1gPe4KIcVrsmVD/g5Q?=
 =?us-ascii?Q?ToyTfXGVjS3E1rnsUuqyPxnz2rBq2aiWZNJbdyJLT4zyh9lrosoG6H7Xhtdd?=
 =?us-ascii?Q?Rca4eG7g8N+xA2CKE99fr2ScLgaRBwg2RqFeGRaKZM9LI6TgI3JLjzPKEu2o?=
 =?us-ascii?Q?/7T2prfkoNNtgzwWhSJZ92Ivm7WsUnD6v8+GLZMW7bBUC4gtknlxfPiTGo+T?=
 =?us-ascii?Q?85G+oByTbkEgkw5itUsJru8CaL+iORA50VY+6jKqyqRiYMO57a9pcaMUVo/e?=
 =?us-ascii?Q?gIPz+LyB72dvl3e8A/8VvKku4UQp6DXPwQt+j8g6IziAuH2dSjgkXUNTtfE0?=
 =?us-ascii?Q?axd6OXMR7g0GufMLQ/z2wI9GlhLx3F8LFlJGtAP5tT+gXonAye2IrgfN0mam?=
 =?us-ascii?Q?0hlJnk6y+jzmh8zz2E+tBu1HpYJtlVuw4x/jOpHntxvdYVNlmU0I3k9LYFHj?=
 =?us-ascii?Q?HudRVH4OzMl+sgnSEgZqk3SJnY91unsE09m9fj1Tx7IyUDYAFvcru1H1zCqo?=
 =?us-ascii?Q?9Y/AAE4KoXHoc8WEnRbeFzUfCAlTbD/dbMTgSm87MlyKlXkUE0grgy3V4Fys?=
 =?us-ascii?Q?CSMt4NhrFODCkuj2Gs5JaFYP4sQPC0hI7wal7gAKixFZmE7tHbfdvAL1M7xc?=
 =?us-ascii?Q?mZ3HsLl5pZCW/YszLXEHr26V8iPGNLCjNui28KQxre+1UEIv3xa8JMck0Rss?=
 =?us-ascii?Q?NxMdTAg4tXsGrqG2aS830baXxKNUWEGFbdQahPClUXOQeyWRzL2Za4BJX3VV?=
 =?us-ascii?Q?OzPj2Ps9TQkgfiU5lj0CEAxWvnVyPwZQsloJYNaP6MsYNs0pAjMCRDRaGwFO?=
 =?us-ascii?Q?anLm9bvi+RqzkV3/HCaZrsA8M0csp+4O98Rouk0dTGBfnkI5NzPJv/0zn8j0?=
 =?us-ascii?Q?TtyK+5SJ4ZRSBSM0SdbUGHa7rj1K6iXvBcK+617C0JLUJJQ3f0QKFd2y3mqp?=
 =?us-ascii?Q?PADXSDcu9YpYnJrzJSuNdfe4cJyyYebq6eexxDkJ8gxFiH02ld2ZW/z9Szq6?=
 =?us-ascii?Q?h48liOMcIw6PfCshJMm2DQrsfUfYEQ9o4w1Jx8tUlhyEPtHP+RvvtLGud4hZ?=
 =?us-ascii?Q?NKbHcEdwhdFxZlXel1YrwZ7rmrXL58VR0fCF9UhgxSR/Ob8nrRVHj4Qu9LQe?=
 =?us-ascii?Q?EyqtBMdn780yECGzlTpHfoQjYhIVqWgiaYerlCe6lS+1kAwWSe57pJOCTtsi?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adea4e49-1204-410f-e31e-08dc69922132
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2024 03:52:32.4696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ERb/yWrXDmGPsE1oflOXsX6VPeiLVTrheLlXC1zXNs5S3AvYvow1jOZzm0R54WQYtkew8cuy2g+JQLquFUHjoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6440
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

On Tue, Apr 30, 2024 at 06:42:29PM +0530, Tejas Upadhyay wrote:
> When user closes exec queue soon after job submission,
> we are generating error coredump. Instead check if
> exec queue is killed during job timeout then skip
> error coredump capture.
> 
> V2:
>   - Just skip error capture - MattB
> 
> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Finally send to right verison...

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index d274a139010b..2c0aa3443cd9 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -980,8 +980,10 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
>  	xe_gt_WARN(q->gt, q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q),
>  		   "VM job timed out on non-killed execqueue\n");
>  
> -	simple_error_capture(q);
> -	xe_devcoredump(job);
> +	if (!exec_queue_killed(q)) {
> +		simple_error_capture(q);
> +		xe_devcoredump(job);
> +	}
>  
>  	trace_xe_sched_job_timedout(job);
>  
> -- 
> 2.25.1
> 
