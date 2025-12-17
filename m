Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD2ED65C53
	for <intel-xe@archiver.kernel.org>; Wed, 17 Dec 2025 17:23:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C7D010E587;
	Wed, 17 Dec 2025 17:23:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQ8Daeq+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95E2F10E587
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Dec 2025 17:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765992227; x=1797528227;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=vJUDYeHXWu9qNDQ9Hl8+WuQoYct8WGCXkvuzlSAiIug=;
 b=gQ8Daeq+jCS7ju3GCD90C629gVYynY5EYmIM3ZADdy8SS6jH/mdx/Lo5
 bqHNesdh25VANaY3a5Idtf4rJpX4+W27R0bBGBycl2oCeBZx3o6r99UBX
 uhXHiduHkRwIxKmyAERCrlTMvfZwey00nnDDWn/jI4HWdhANa2y35qEw5
 iHczcd18P84BnCZvBbX+q1dIMIdioQPMLGG+P5TAwzwfKb1zsL8Mw2tMq
 AN0ni7/rkUuJwnGS2REy1Aypc0AlRX9bAw9sOt9PaMJ/RvYL9MuePF+S8
 PdwBYcIEL5YUeU8NRrSfgFEnwR5gToPau5rgE034acEBYbpagxi5WkAyP A==;
X-CSE-ConnectionGUID: 0NzUiYdrQFOsFtIhpVZ/BQ==
X-CSE-MsgGUID: HUv5mSOrQiusixkWxXsSqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="85357217"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="85357217"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:23:46 -0800
X-CSE-ConnectionGUID: 0n489gB3TI2xhjf3+HwpfQ==
X-CSE-MsgGUID: IVJQeG7uQjGHRGUI+N3lsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; d="scan'208";a="197483683"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Dec 2025 09:23:46 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:23:45 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 17 Dec 2025 09:23:45 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.2) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 17 Dec 2025 09:23:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=flL5ChZxNSKnmTY2qppmJ6Gah6/I8bf581KoNQdyGeJb3ppRtcMmYT4qKkRbQFBMc/Qh82l+c2+N9QhuoGQBE4Odiy5xx/eTUdNlaD80l+o+FfDzDpJP9NyJYRifGAvTzHvdR3gPwEH4vo+uO/3uAXMsQgqGs6tklEGn4Ls4RR4PPJvwlYJDj8uAlcGylAytOkR6EuEa2M054PkfYGMGFjmwJO0OpNcXwxNTdIQLmmxwBGWdisFKpXiNyhYgHoVYdL4Ha1dmNMXCyuAYUMGt65ZkP2CE8bx/LLaEcFGWi0SRWHYl+P+edi/TJPn7k6MGRAJdsPOys5OTeDD6uvw/1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J5Vku6s685ahKi3Vw5Vjb/FoQOq3z37zo5w3wB8OVSM=;
 b=yp9oRT893XBoEDLPqWGURn0f7fylgOpFV62RSLr+KxwRiVBV4JsJSKRpj/WeG8BqGs1ga0chOB91wTj2jwhhenxKv3WwzMyLi/XpxIhdpLJV2ZklewTeGz8A0VocxQ5Kw6ucpjX1lNgdKN3XtFKjRLgKJb6m0uUywow0ZI2uXcwC+3MTN6r7qmdQLa8fa2ZGhCAIf30q8im/NuAU8e/ylgspUQLBv7/fYQrKyaNAKfY4xurZPHNuyYz/ZG9NSsID8tpv7fqTOhz0/pdeBWaX6r4XtKPYwNvXatfxppzBn8IXIvNcvH9IXQonjTb8HI+PM7mh8c63hIHvE9HQhXvmUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by BL3PR11MB6458.namprd11.prod.outlook.com (2603:10b6:208:3bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 17:23:42 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Wed, 17 Dec 2025
 17:23:42 +0000
Date: Wed, 17 Dec 2025 12:23:39 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Fix typo in function kernel-doc
Message-ID: <aULnG7jGU0RwR0Hp@intel.com>
References: <20251217150702.2669-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251217150702.2669-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR21CA0026.namprd21.prod.outlook.com
 (2603:10b6:a03:114::36) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|BL3PR11MB6458:EE_
X-MS-Office365-Filtering-Correlation-Id: 6e087ec5-2034-4a65-4bc9-08de3d9106a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JjgxM4cMp0gpKy7Bc4V9PLfb3CUgmf4TtLdFSAzN6rGkZHyZHKMayDfrQSmn?=
 =?us-ascii?Q?S9cxyZ5hw8DsuV4cyc8yxhdNUWPJ+yEFncFxAI7XnKoCLgWP0iBer1iSUfvQ?=
 =?us-ascii?Q?8oir+f/SwuLWoYSUCjHShsuk1AL4TXMEV6KyvVioOmgqqaOtJKgPczCdhThZ?=
 =?us-ascii?Q?rTUTATV0J3+mFy5S7QX2g1c3Smytxmt6tlGHZdO/lR9NdJaUBQu8dAXGp+Xf?=
 =?us-ascii?Q?JJ8kmx9q0lSAzsRvaiULSbHVrisKeJ/kYVft62yJHUKXHCqbgkYMU3R3VElg?=
 =?us-ascii?Q?ihRF/YLuWur5Z72ikhih3TSDi+T2YQpwkkMRoaaZyrWcHEdEeOXQU3BkmVVk?=
 =?us-ascii?Q?cqvXfVBMwdD2+9Ekx4jvmPa8UyMLc9AFgJzXZwgjuTrC8H14b7/KJRzK3G1K?=
 =?us-ascii?Q?Z5hfh457DzsC02xRssJGZszhX/EjH8+2EyBicFDFwzzt0GOFGFwmFA95jhgV?=
 =?us-ascii?Q?XPn/EK2ieBA1Kydht6+xJraFoMc4VwbEvLIr9mcHHUilEDQSeJcxJRYA/e44?=
 =?us-ascii?Q?AZzOapdpeT+unsuoQpNqZ4TeEiDjmlLU8JyfIme/2iClYO3e3tFz/ExGzptK?=
 =?us-ascii?Q?NwJcLOYww5ZB8NPk8KcnoeCjbsG78oPWBNqACVlNGCwRdCH9p2+uyvFjN38e?=
 =?us-ascii?Q?RrGImO9VDoxbaFdULF3g6gohfnuNJb6PV1N241YBgQIxzn0T8mKyJ+9O89M3?=
 =?us-ascii?Q?Ct5hzDOzLza13u8t0medQsGRKuL2irZoYC/qAT1oJhcsKYYZnwKn8fLsd/i3?=
 =?us-ascii?Q?WZWubq9sj6TgXxfMi//NwQFXQ72Oj7UBvmgRNFXSv6qDT8NuS558S/C7Vf2V?=
 =?us-ascii?Q?eVYU2gTFirT0MZcWU9fVFux1r8pZQ8NJE0nAWOOTomHVQtNYh3uO4i+1Zd99?=
 =?us-ascii?Q?7fXaEevKVY8mpjgl08eGfokLTluEvBXUsRBIp7SJNNRKWw/UoDpZn4uzuWpN?=
 =?us-ascii?Q?JCMsnAkzHAwrCOwBkIC7NJhMuM1tjYFriPiF+NJomhHFQpItA4Fikffrc5gs?=
 =?us-ascii?Q?g6f3vrLqBAMC42i+PXUS4R5lgI2qDWJjhEP8s9SoxPUTGdyOG1l6s6zxuQdS?=
 =?us-ascii?Q?VGeDgoJnt11gJjoRAeoAINknA6bGLL2/RZYqq95qr9TY1N0zbKAOimSwWOY/?=
 =?us-ascii?Q?UySUymdUAh+CNJUKhnBPcaJbXS53Qb2tBGLQxb3SepzJX/Eyu8kiHAfWy2eg?=
 =?us-ascii?Q?44HXXylgze0HGIxuTAWCgvWUca6pFctztR0bJOdJ8fw7VdIB3wg12IhWkKnl?=
 =?us-ascii?Q?Xt3Hws+ue+E+8NtxpAweIJA2QrkHe5CjbXoSqsd/rsQgg9rwwsIYhNkeVFkG?=
 =?us-ascii?Q?q6r6rtPVaKnmhRhBoDdozWmVGzBhZr9TTUwxZqL7iTuGzmKQy/1Ow04kzgiu?=
 =?us-ascii?Q?UrOgUl9p8n4kcrp+krgVaiAjo8SMV24vC6ZWAGMKUkZGtRPq2VAbT8o+tapP?=
 =?us-ascii?Q?6aLnIcWbXrz7VV7A770OPlXVYkisPnkf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2RqDfjuWXwrt0wCRe0pWIqPgoNOMqGZs+hkaF2hLUTAGdQckdfkH1/So2ln?=
 =?us-ascii?Q?IyvNRkOCgKxFE5Gjku6nq4N/rW6Pvzk2BWq1vaDFjyetvwCjdsvgXuwJZqrQ?=
 =?us-ascii?Q?dIpUHcz+islX3/j8pEDRkMAxO4QP49Mh2tOoXT1dHXulpAQBHvB7AU4aumL4?=
 =?us-ascii?Q?wTQXaCVo1H0q/hQSikgagkeYzfSbQAID/FX1oUByCEjIPOHVYZbqD2Ht9EH5?=
 =?us-ascii?Q?2NNrTo92pgqlUsdwbJrlaI/GQ+2fQdh40jsizNMQMRxccLKJ4PFJCFCfLuEi?=
 =?us-ascii?Q?yFGqiat971rq99giQmXDwAsLJ0BDtamwsPdgeNO2CYyuSdqyBEBwkt6G+lC2?=
 =?us-ascii?Q?dTvYFUvPBuS16yQlzdU6Co/O8Qkd9zAUm8w15VjIkloMTUjcGbPniAEIwiW9?=
 =?us-ascii?Q?oqB7crniiGlrYC4wmY+UrvpyNrSIyFyEK74/+cjCe/dt55nCoikH/Ib8kyjw?=
 =?us-ascii?Q?bCKHkiSjVNuc3AwiSVHbwPxscG4FeqtU4mznElPSQEKUhAsVQP1wUp2auo+i?=
 =?us-ascii?Q?db9Tdbbat1v78Nb5E9VaiFYw3meGcMU1yzaOGWONst0iiqWD2nl/+JhVyZK5?=
 =?us-ascii?Q?XSO0r6ktd4PO5S6MKQVB7VKxg0ojHLr644jEJ6YtY4mUiQH3itWOI0heNEjS?=
 =?us-ascii?Q?G4gP49fpQAWVxWGmQBljRXq50hAcey6E/0ZpoaLrDhTNGaA4Z8GWiDiZzVWQ?=
 =?us-ascii?Q?rIUDgaVCYTsxAfTA7QFXjUlL+xEtGYIBqNxpmYIBQprNSJm0Subr7GwMmKiF?=
 =?us-ascii?Q?ZH5YPL5n7J1AwLJvoTNvLk4J6KXTUPQUQYplWUqlsIL8DZccacyqGijQ8xZi?=
 =?us-ascii?Q?P9oiZlcZrSpDyED8/UcqbiROx32rfQQsnomdnvHR5DHXkfec8nMsjU9nt7vd?=
 =?us-ascii?Q?iZ8erIYDcdMTiYfvWnBFmiiMf685IhvjSxz0uwchY0MoDxZVQ26dfuGvvgFk?=
 =?us-ascii?Q?97DbHSI6ZTyci1DUAigy+pdb0NTTuCmzGV0a0WmBnXskd7kQ7YC9xszGsFh/?=
 =?us-ascii?Q?PP8mjPxNvlKpuMO3GMDksgRNYmYys30xwLXf9MQSO0SQPrjZgfnMtgRcqeLG?=
 =?us-ascii?Q?wLNQDmRqGpz7H7h0+S/yOmSN7Rg2ZZJhSC4OvwGrbdBvnxo87EIgPVEDOlEe?=
 =?us-ascii?Q?xHgb/Nc78wzWgHssErI9cYghDVVWiKv0AUoheK2ozDDkyUYaXWDRxBJPCyzg?=
 =?us-ascii?Q?C8Hkp/qtEXxwm/cKVs6gpQj423w3WRJikUx7HEkf9Lt3Voo10QH7nycgzVWQ?=
 =?us-ascii?Q?whS/K5Pi8rLiSJi3QgRfYcv4tulC7j3/0FDRIid9ELV4hgzunKQ7TyiDFzLX?=
 =?us-ascii?Q?FoH2SNCBpQVGstDY+qxskChlllo69PLScqjAEjxSRpGnwR6xbM1o6wYvxNGT?=
 =?us-ascii?Q?p4KVUn0raljoK5CMn1si9pg0slxOooikVw4GmwZnS+6ccxWd3CBs59QdBvcV?=
 =?us-ascii?Q?98zXgRJbERIdCnGpwSVNXxIVGfOPvI80C8Oklt5SuZCSoqjAE6hOIw+lk9Ph?=
 =?us-ascii?Q?MpQBQc83F2CGlY4ANET9Q8n5vrjyqFjpwa5Zq8INFyInbspGNt7tTGUyYAq/?=
 =?us-ascii?Q?ORJRtaf14GTlLPWarism/oRoLGvHkQtDCSuRhTP5stC+lMIYQ2+cJ3FpKfBi?=
 =?us-ascii?Q?aA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e087ec5-2034-4a65-4bc9-08de3d9106a8
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 17:23:42.7462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jWFUWGSwntDIODv9AJiCECtgxv9Iky7amdFBmVXmvFkK0g1f/nW8q8OZvHjyqus/AfXz3Ir84YMqwJrrFzUXLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6458
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

On Wed, Dec 17, 2025 at 04:07:02PM +0100, Michal Wajdeczko wrote:
> The function name is missing an underscore, which results in:

I'm glad you wrote this. I was looking to the patch first without been able
to spot the difference! o.O

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
>   Warning: ../drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c:1261
>   This comment starts with '/**', but isn't a kernel-doc comment.
>   Refer to Documentation/doc-guide/kernel-doc.rst
>   * xe_gt_sriov_pf_control_trigger restore_vf() - Start ...
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> index bf48b05797de..5cb705c7ee7a 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_control.c
> @@ -1259,7 +1259,7 @@ int xe_gt_sriov_pf_control_process_restore_data(struct xe_gt *gt, unsigned int v
>  }
>  
>  /**
> - * xe_gt_sriov_pf_control_trigger restore_vf() - Start an SR-IOV VF migration data restore sequence.
> + * xe_gt_sriov_pf_control_trigger_restore_vf() - Start an SR-IOV VF migration data restore sequence.
>   * @gt: the &xe_gt
>   * @vfid: the VF identifier
>   *
> -- 
> 2.47.1
> 
