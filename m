Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB9CC3ABAA
	for <intel-xe@archiver.kernel.org>; Fri,  2 May 2025 16:59:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639AE10E94A;
	Fri,  2 May 2025 16:58:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M+7AXTk6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2AE810E94A
 for <intel-xe@lists.freedesktop.org>; Fri,  2 May 2025 16:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746205135; x=1777741135;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=JkXLXLb+maC8gNlpfSSvJAvb3yJCYUBFkiOT5x6JasY=;
 b=M+7AXTk6Rr+LtHYZVoObzfPtIJxRGCko1/WHy8gqmTIuVrNQz1dmmCnU
 some4DfwYyfROURTxP7UkNKOvfT11Ve9AeXC9PaVq0n4DbCNbNuOXhziw
 pZmOm/8y2Yqv+CsbLl5XJG5vlE+v80/wVD9FFEPpz+db37xlDmrcrRXZT
 R6h0SA/TN4BjYoxp+VnZBMvnAVFE4kQ01leF1hVAmtQ9qcBTru5tM/P2b
 lwo/usexF7MFTOMtK2kWcAhjg3GagFzg72s9/Xz4pWyRr5RTl4P+LqheW
 3nD/zxpRapJhodxWPPWSSgzikcxOmR3m7B6xoM+uZg9Na0cXF4olTU5Xb A==;
X-CSE-ConnectionGUID: bhgmZQCGRQmK/x5edZWfgg==
X-CSE-MsgGUID: uVDNDaCYQX6h0hl9GqVhxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11421"; a="58098639"
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="58098639"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:58:54 -0700
X-CSE-ConnectionGUID: /YIy5BpGQgmjSkpDruO+FA==
X-CSE-MsgGUID: jB12QiNWT5SeyLbvZ2W/Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,257,1739865600"; d="scan'208";a="134603164"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2025 09:58:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 2 May 2025 09:58:53 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 2 May 2025 09:58:53 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 2 May 2025 09:58:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ix4ZBpgGAuzTLxoJyjmnUmYM80DiByBF2/m0Xy3Zf7G3wk6wUll197oohr+gM9kQjkqOCTFxdfhvCf8TowycgXkXoKWMS/vi50bxunAXyQogrklQT/pipSJKxud2RrtQCBQMvi1pVkNhCd0QktwSDfDZXL7Z4DS1h1J76s28DIXDmbI37fPI5svPpwXOwpWYfdCp7tEpClt8cc6UKEZO68pVwE9JwZLlt9/tYCzXoaYzsFQS+4TK97D9vQx9g0ZIpBebQJJqmA28sQPGuRaLgnzWuloEfE475+KJJSXG99/UJPbC8uWqz35MNrYEcPmWdKxuliZHZhzEL/96doBQJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cDF06Xa0+lyLZadlyFFKk1xgu+GmFpwe2YAfq43mPeU=;
 b=VwENL5yV9PkzDFAzET2OGyKzesJs5sejd0Wk+awVHCRJbDdcmzvsy23e29z3SuIlzLVXpmvqtmc1J3OzA1kBTp6OpKgl1LmAN1OcVNIfgH0rGCTUA46CsNiO8jpdjmsqlShM8IoMNqfb123hJy5h6HVJs09T7Fc9L/1Bzy9VmcJz8dcjyxfoX9mr322VCPUdAxCu13lFGMTS0+KuJs6dWAEkzFplxekltPZ4SOFmXYxVjJCohao/n1vtSnTMTaLFoyNO/fZsBcuqt3Yx1+8g++Vpf2BmTuK1rxCTDV9lFRHCBTuRaFuo/QiZIFVEPfKTHwZpMQhesmiss6IJiPqxhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4727.namprd11.prod.outlook.com (2603:10b6:208:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 2 May
 2025 16:58:22 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.012; Fri, 2 May 2025
 16:58:22 +0000
Date: Fri, 2 May 2025 09:59:46 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Maarten Lankhorst <dev@lankhorst.se>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/4] drm/xe: Fix small leak in migration error path.
Message-ID: <aBT6AoCXxR6sNtPK@lstrano-desk.jf.intel.com>
References: <20250502093514.510621-1-dev@lankhorst.se>
 <20250502093514.510621-4-dev@lankhorst.se>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250502093514.510621-4-dev@lankhorst.se>
X-ClientProxiedBy: BYAPR06CA0006.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::19) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4727:EE_
X-MS-Office365-Filtering-Correlation-Id: b15fa373-f170-4ad9-a0dc-08dd899a8bcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NQ/gadKhQi4F2be1VQPm0W6H9Xv1M3s+6iU4FrdRPTGfeHsp8WPeXdSTCsro?=
 =?us-ascii?Q?YUOby0uhrW08k4HMChW24taOTa7DQ4PqPOBX+AAftAflC/LW8fFzhTamttdx?=
 =?us-ascii?Q?U+qsFSlfRfNQxMHyKDPcNi9bjw9iiXKzabuLcpCNLipTCS32OndSPALf/XxY?=
 =?us-ascii?Q?83G146aw+3dTMHejkzNjJg066TFhNPnX4AnoQTDfaF87oAHOTvWEwlQIjy1R?=
 =?us-ascii?Q?aRco3+l+8oXNmIUFk5CStgWD/3BtVz4QavqQuIdDxJOP39v1wv568Gi2gOSa?=
 =?us-ascii?Q?T1CBwJvitNNVRH7s7Y/j1Ze+AuyFjpTeS4lY2GdqZqQ6B96aWbx0PbFAS33r?=
 =?us-ascii?Q?v5BCMiJIiRlEplLC/cuM7uVuMhhoFe0bR1ncxkz6TIZMKHm+6//hAN5dgZSw?=
 =?us-ascii?Q?oD+vCxV42vYrM1RrNaoig3NbdxjDLcqZfx+RJoo8TE5nBCFYhXs1T/KT1GQu?=
 =?us-ascii?Q?WwpcRr0vwVF7AFd51fcJtjVxGjFWR/PISVYBQg7JlntrqBZN2EAhLUSi4GIF?=
 =?us-ascii?Q?di8cGgkwa9YdR91vHxXhEzTSbhUeqxx0N7JOEUifetrhmd+vEKZEitXTSpJj?=
 =?us-ascii?Q?y47dgAyrlU6b6cypmNS0bfXCd2vr9qi7coJvGC3B4YLwtsKxhynQWtMFDzSb?=
 =?us-ascii?Q?dwIz9bdg4ZMqt+6hbldp3JOjO50VYu7+b6XdTvmrsXijX6LmBZDjg78sjUqg?=
 =?us-ascii?Q?5h4F9nSZ33jcptV6C/AdhhYnp/Nb8sFxto/R1vVglj1D9BO0PDC5PztKnp0E?=
 =?us-ascii?Q?aM2130QrMYLfUaUT4VwAnblydrqpV2mOKtKw/RyTdT6rdvjEJ332QIXFrdG7?=
 =?us-ascii?Q?JFg2ZEy715sQUWX4oqtRgY1qnq0xPHhdCvR3Rchu1zzOPsUYpQWqMJogIPZr?=
 =?us-ascii?Q?IMQd9ASk9RuTvHYXABqrZparngu/Ri39dU3A7rh0ntn7ERmDV+4kJ30BL27U?=
 =?us-ascii?Q?J1w3K3dOawt6TId+sTG+KZJgBkMDNnc+u2yxak5RB8h/+EiEOBG2ED+OJN7i?=
 =?us-ascii?Q?MNYO1QJgR5KeiOKz2TcHdEkvxcbSUGWOlLy/97Sak4S2WOiPgwQRf5oYtmYa?=
 =?us-ascii?Q?NbqfUc5yuv1Z0z9K7Wxo35WAooRSNg7rfCOMiJ7iebNcynlPTIEM3inTh1yY?=
 =?us-ascii?Q?a4dGZ6TIZ4TOx4iY7jA0Xg4xQPbJq8MXRYE1QObWQ+CTJKZhpwX9HGzu5X02?=
 =?us-ascii?Q?bFh1k+QvpSsxVlJxtay19UKW3jrOEFzcXYeLWALbYVIlvLazgV8beyHAv9Z8?=
 =?us-ascii?Q?5C7789KVsnGEbxERLK6mggmg+HLv/anWldj63v3oKijRKTmfGquaKs30ZrCQ?=
 =?us-ascii?Q?/yKLa8iMb1vKwfOzJrfA10DHvQWxe1f3211TV9fNuR7b4eM3A4Zg5RHfpwr8?=
 =?us-ascii?Q?DDTT0qpzrdjz0lsqDrLE7q8QzckofhVUpx6pV9crqk9A3DL8L0cEyCiT54QY?=
 =?us-ascii?Q?FRZoBW3gwuA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m7QCCOZIP54CtEeAVGOGLOemuR3FJE7txvQ/14Idil/fItxbRKgjJAiL4m/d?=
 =?us-ascii?Q?d2k194I2azqRbttw8FSe7jIAniJ9Y2Klsvg2v+34K6FYa0fBGIxaCO0Yqn++?=
 =?us-ascii?Q?82lhqDm+oEnVM/Tskzh5r9wT3N2dptmtmsIWrWeDW0OhN+e0JxkxfamFOxqr?=
 =?us-ascii?Q?jMOmgO8Zevsg4qcSVs/LUbeQTFmge7kACbWZ+3+PZy5TpjBQzX3uAveott6Q?=
 =?us-ascii?Q?yVfStbPCLtpK90raG+IswSuXe4cvhu4rFQjDsE7sxERCswWyYrfJcyeKNruo?=
 =?us-ascii?Q?F0E8uYzEuOOndlVly/Q++yCgosBMINZ4ttFJaVPTnMKO++ss30RIlP43WTgd?=
 =?us-ascii?Q?m9d5UbGhB2fCqupYgzDgTlcq4gIhK470cM4f+Mqjir/+HuT2Vjk4Yjng2yIC?=
 =?us-ascii?Q?lwgIHvyH2jIV3aeTRIVi0hWqvsRR0a4XLMOMzXWfHPU6AXEMDO/HCJo45zzG?=
 =?us-ascii?Q?WRkWZlElKr8osk6zHF2ahEfK9jX2aENfYlLNZrSoNOeTTXGjsODv1yMP9z7V?=
 =?us-ascii?Q?h+ku2Pk6HEFV1sVyDfoQCdpDDCoxEzDMus8cHj3kKsHSSwIF4B7PxZ9OsJ7h?=
 =?us-ascii?Q?5wp1fpnkEA0WvZ2263ccrNUEr3/crnL9tpSE1+cDsG7uAkAytRGWvk+2O13k?=
 =?us-ascii?Q?6PPXbGkcH2uhXmnqXn4yWZEJkkGv6kQD4qdth7gqrR/1PdrUCHy7Jo841b8K?=
 =?us-ascii?Q?aoxq5Oe84RI5SaBdhb1aWRYxMCcfswNpTvFtvlrvEO3L0T5KAl+Tie+AM7nD?=
 =?us-ascii?Q?pbh2THkjgroQ/kFBmI150Rlmft7+q1uUc6V12o7UVgIp2/O8Qb3vwVA/j3X8?=
 =?us-ascii?Q?3at429/X0M9T16CrI30eUpAI3jXmeYNNoi3kPW171w2OCmuVpIb7EM3LOCpe?=
 =?us-ascii?Q?nGYRCo2VEuES6hdCsRHq3qQFx8LN5MYnhC7EP5KDjo3eyH5DEu+ezl1JdV6N?=
 =?us-ascii?Q?4IUKabSALDLko5Z0920ThIG9WbXLj3ZouY1l8FfEh7jN1p4DABTg3tuEk3s3?=
 =?us-ascii?Q?uJ3J9Hw3WHwLU3SUtkwkCFC7hMMdfP25f51yUDgjVwbYyL1sedqgfY9JHXqM?=
 =?us-ascii?Q?YqZabuTiWA+DeB4AJyVRuHVteRFZXRNrUYKsh9LWGKhEvCPDdQw6xHOuMpmV?=
 =?us-ascii?Q?WVdlJPlUvC9Tj4onRE/NVdh8JhUyQo8MapunEKFULZgm1XugYOYACPaBcWBE?=
 =?us-ascii?Q?v8XmdwEsDujrvqO4bhG6GqZtGlU+Uv1AS7CCVavFV4PpOJgYAaJpaXzFZg8w?=
 =?us-ascii?Q?jXWeB2iDzVhtTBt8inxelTQk/fv+aJ9rqmItu4YELgD85UB/D9VKAA3TMj0V?=
 =?us-ascii?Q?HccxWlQjQZ/LfbTxNxyGJfVh6U4Pbo5T2nmm3xSEmyBIYe82nXZNrQ/ax45O?=
 =?us-ascii?Q?npsobJi4gxxdDLrks/gWSQijrBRGc+V5ofk0Y0uk2XJRvhbO+lsb2vfHEnYk?=
 =?us-ascii?Q?ozxyhgm/J+05t0OVxVmOZUaMsuNB3Mc3igaGiG57K8aTyz3Id/3LCOw+XI+P?=
 =?us-ascii?Q?iOzhD2lW8NLrGOuz0kl/KMgq7HyIeHdOWjJ4biOnCeFExk/DQluszXhqbWc6?=
 =?us-ascii?Q?b60u92btKl4Jj2Ta+cd0+JwUzpKcvhCGE0xRyAFWJURmWL5dR81tglvMglru?=
 =?us-ascii?Q?YA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b15fa373-f170-4ad9-a0dc-08dd899a8bcd
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2025 16:58:22.1607 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IF+PJjySfVM/zl2mHmcb/EdSKSkobqEFJf7jTunCB1IAiC/PHZvD2b3cXoSKbqj8ko69kNAniA7LMSmTkYmfXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4727
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

On Fri, May 02, 2025 at 11:35:12AM +0200, Maarten Lankhorst wrote:
> When logical_mask or hwe are zero, we should call xe_vm_close_and_put,
> and on error, m->pt_bo is also not cleared.
> 
> Also call xe_bo_unpin_map_no_vm even though it is a vm bo,
> to ensure the BO is freed.
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 60 +++++++++++++++++++--------------
>  1 file changed, 35 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 673a5d165482e..7ee27c9f77bac 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -386,6 +386,38 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
>  	return xe_device_has_flat_ccs(xe) && !(GRAPHICS_VER(xe) >= 20 && IS_DGFX(xe));
>  }
>  
> +static struct xe_exec_queue *xe_migrate_create_queue(struct xe_tile *tile,
> +						     struct xe_vm *vm)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_gt *primary_gt = tile->primary_gt;
> +
> +	if (xe->info.has_usm) {
> +		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> +							   XE_ENGINE_CLASS_COPY,
> +							   primary_gt->usm.reserved_bcs_instance,
> +							   false);
> +		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> +
> +		if (!hwe || !logical_mask)
> +			return ERR_PTR(-EINVAL);
> +
> +		/*
> +		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> +		 * PVC, may want to revisit if performance is needed.
> +		 */
> +		return xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
> +					    EXEC_QUEUE_FLAG_KERNEL |
> +					    EXEC_QUEUE_FLAG_PERMANENT |
> +					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
> +	} else {
> +		return xe_exec_queue_create_class(xe, primary_gt, vm,
> +						  XE_ENGINE_CLASS_COPY,
> +						  EXEC_QUEUE_FLAG_KERNEL |
> +						  EXEC_QUEUE_FLAG_PERMANENT, 0);
> +	}
> +}
> +
>  /**
>   * xe_migrate_init() - Initialize a migrate context
>   * @tile: Back-pointer to the tile we're initializing for.
> @@ -395,7 +427,6 @@ static bool xe_migrate_needs_ccs_emit(struct xe_device *xe)
>  struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  {
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_gt *primary_gt = tile->primary_gt;
>  	struct xe_migrate *m;
>  	struct xe_vm *vm;
>  	int err;
> @@ -420,32 +451,11 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
>  		return ERR_PTR(err);
>  	}
>  
> -	if (xe->info.has_usm) {
> -		struct xe_hw_engine *hwe = xe_gt_hw_engine(primary_gt,
> -							   XE_ENGINE_CLASS_COPY,
> -							   primary_gt->usm.reserved_bcs_instance,
> -							   false);
> -		u32 logical_mask = xe_migrate_usm_logical_mask(primary_gt);
> -
> -		if (!hwe || !logical_mask)
> -			return ERR_PTR(-EINVAL);
> -
> -		/*
> -		 * XXX: Currently only reserving 1 (likely slow) BCS instance on
> -		 * PVC, may want to revisit if performance is needed.
> -		 */
> -		m->q = xe_exec_queue_create(xe, vm, logical_mask, 1, hwe,
> -					    EXEC_QUEUE_FLAG_KERNEL |
> -					    EXEC_QUEUE_FLAG_PERMANENT |
> -					    EXEC_QUEUE_FLAG_HIGH_PRIORITY, 0);
> -	} else {
> -		m->q = xe_exec_queue_create_class(xe, primary_gt, vm,
> -						  XE_ENGINE_CLASS_COPY,
> -						  EXEC_QUEUE_FLAG_KERNEL |
> -						  EXEC_QUEUE_FLAG_PERMANENT, 0);
> -	}
> +	m->q = xe_migrate_create_queue(tile, vm);
>  	if (IS_ERR(m->q)) {
> +		xe_bo_unpin_map_no_vm(m->pt_bo);
>  		xe_vm_close_and_put(vm);
> +		drm_suballoc_manager_fini(&m->vm_update_sa);
>  		return ERR_CAST(m->q);
>  	}
>  
> -- 
> 2.45.2
> 
