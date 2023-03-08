Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38E0C6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 00:53:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD28C10E14C;
	Wed,  8 Mar 2023 00:53:02 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C45D10E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 00:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678236781; x=1709772781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=kUadaEIGn3KlFOCE7RYqt+xGjYzsvFv9yEyvq3dGju8=;
 b=diHrjZd6XWNFtWTwpau7Vj0OqEaVk6oDgyqiqwNpzY2assTttbQFQYJa
 /XyCiO0h0ormB1DGRJBLXuoNH36W9mIscpZDhRmxHO7F4Rd5lWy1fn+Bl
 jbVplf1w70rRsTIW2z5BleDXb19zfw3/OkOeGX82iNfWbkDs2PzcbFIMQ
 2w8G3IP59YRzwBSxSQPXDw1JVtMLc8kbr5i8Y7h0hu8+DObXkkTRCO37d
 o+RtrjmitO6tsijpgxDhxOlogcfS/Sfty4/2LXpeFrUmypMQeVAOlUjCd
 6uWqD+FCEr7uErpOnDeT7kbBEfEsappF80Jmj0K/87HQkTcaRRD50Kdlb w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="333490467"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="333490467"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 16:52:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="1006098865"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="1006098865"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga005.fm.intel.com with ESMTP; 07 Mar 2023 16:52:59 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 16:52:58 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 16:52:58 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 16:52:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NyVY2oJG6JLcH7qFsE9hlO+b7ihtjbc0aqdN+06Jx38h+ucR//vM9zICXdtVKC/p0Pl7LysSCgDCHFTs5b/NS4rVdsKUFL6jj+P564w6mZ5+lwCxQTjBVLC6LKYaEcukbEzWD9Kcqjv/62ELzFlAsdEWmkw6SC3JbaAnckpTtUuoQT88ouwwuREXXntuLvRAaJfW9oK7t0FITJjcnKZpqlhszHy8YiNfzr9vJNhDyMAby1nvHNkVSW1I/i3zVSJMxedBRhfp5dCQyqWy6phYzVDNJ3fzqnKIIgCEfMp3f16DaQeO8ezqJNzyVmg3V9PrniZsZxSrMf1MEVHuHO+hQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oDfR/evrLDZRVTVdyuQk0tmg1DenGAocP2vH7h6W9rc=;
 b=Q8uD23entNrKXEH6MgFH8lxE/xXVR5p4DDUya+46+QaCS22kI2C0PB7uiy3Yy456wY7uDNRYom2WmBOOFQeqa3JBL9Dp/JeHXMnzhoHB7K9gDtFoeq2cWiNNkUfQSAGnHy3BiUb9tCr/KEhz+KH6BwDcy6zA8095mRBoRu0SmyOfdcVhCDj4Y4sF+TBNE7tuGZrLS1drewqFl2+JZFOH2VIVm3Vv7SpJPr4aj237B0/5WvxDApTlY3DF0NZjsf1Lb8wNKb7csnKKkKClxa4CC0C+fB7zpe4LBOZ6DuC+bNKPUVWUHDvdUW8vPmJE0kI6sDXuoveZSlsLACvHa2xCWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 PH8PR11MB8259.namprd11.prod.outlook.com (2603:10b6:510:1c2::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 00:52:56 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::7333:f4b:7dbb:36b%6]) with mapi id 15.20.6156.028; Wed, 8 Mar 2023
 00:52:56 +0000
Date: Tue, 7 Mar 2023 16:52:53 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308005253.GS1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230307080916.275289-1-balasubramani.vivekanandan@intel.com>
 <20230307090643.z5ncdvt6vmyimosf@ldmartin-desk2.lan>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307090643.z5ncdvt6vmyimosf@ldmartin-desk2.lan>
X-ClientProxiedBy: BYAPR11CA0087.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::28) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|PH8PR11MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 8900fc89-1346-41e6-a33c-08db1f6f74a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ozaLaA0nwZ26hVeZ/9yhd0KAuzge9S2aPRmZJXcBdCV7/gqGoI/15CAU7Ypg6k3E2tg0zLImU8VBxbUscF9tM2PxjVVLBNmxEOC44Uv8k1Woq1DkZMlEakVvhSq/rwIY2+HdGpETPF7N7CUrfsTYdjbFh2/Np6XG6gy6IOsauOX7wxU79LulzmEQNy5cTxI1hftM452syvg7/Lu4rOtqyGNqoIwVG4RDvnLGgJwCaLJjDk60RG78GbxWqBYuIlkXeaP9JHUGoWXY5lBqIrK+W4g1O2jZYVMtk73r2Pt3SMmn3CT2wRYGWTBGeCTla1PmAEdctGRXgJOEj+AT8+Q+zRu5eyuNO0u+2kea4LH6gPuzO7t/ox4gvqinkAZY2GSkJ7Y2SgJFCbvYTZs4/jBFKS1ueaSSEC/lyNm71kra2XYs5fHd/4tQkjBYcl0UzhCJgEAh3V9RbAiYQtebwrSRRXAXg10yB2vOV93ey86i1VqDTXpzKgWjOavVqWpjzC6iEtQOYrGbxfTmL+sTvug2Cc6v0TDxgVE42KbbWgN46ryyUgLGW4ZEuEsVLpfLnhy5NmFW1kPvtvzFneB8gYlNgasTUoCVxq4GpMICL1Z54pQYw1MA/gH+f/Qpi1RCom0m1pTx4HYcYKuH7yWxZqO4Mw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(136003)(396003)(39860400002)(346002)(366004)(451199018)(66946007)(66476007)(66556008)(6636002)(41300700001)(82960400001)(8676002)(38100700002)(316002)(8936002)(4326008)(6862004)(5660300002)(478600001)(2906002)(6486002)(26005)(1076003)(33656002)(6666004)(6512007)(6506007)(83380400001)(186003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?48Uwgj5vcUsdQVoj8P9+6PTjwpByjwVIh+z9Dcs+0G4W98AKTW1CpEVmIn1N?=
 =?us-ascii?Q?JCd13xnnpux2yevEfX7QKsnyPcUD+cbLkyayYSjnrgb4q7zGH5sQ4hqRzatr?=
 =?us-ascii?Q?iMuhgqNpTv0w05FOHiP1KUWatKXMDkUC2pT19KGYwNLkoVR2feIOLZV2Sae0?=
 =?us-ascii?Q?pYaoalZv1wfNrpjb2ye5GBqGN/nzLbrjCtF4tMzGvmCPeVegYc4BtOl27/fI?=
 =?us-ascii?Q?aGuUzOgMK6MDkGGXEKRkk34iYPrD6+mZpvgdkTmnZI3slbZ1ejIl8uOhBITs?=
 =?us-ascii?Q?n0w1CJQlKtFL3F1TuRd6yBHUUKiv+8I4wR/K0WzuW51NiAOmw0x9JsvLFFie?=
 =?us-ascii?Q?WmLoXtcal/lRZO4oyLrLk6s5kPmrXc6yglRDuZ604sMc6dlv+JjtJyKGIvCh?=
 =?us-ascii?Q?SK4VW9O6fuIs1I1sndhjT9Iks3lRYIYpmGe1cL2S5PhVASKt63fUyLxCxWs/?=
 =?us-ascii?Q?EEs7rLHSz2n70aCFfMARAsPtO68HUl7YdtesS+zsDfgU30qDWMX6CbAj87Sv?=
 =?us-ascii?Q?HO0uJUH2Ys8x0XlNeaia2TwY5JGnVh44EzgTR91Bxs/ApsnTh565bkJofX9i?=
 =?us-ascii?Q?SOZ1vd9LWDnGGh4Y9iEfKx1sUj4dIBEj86eqY2vdkYwskAmWw1GGdH8mWHVB?=
 =?us-ascii?Q?8m2sM7BBijpvD8COg6fT05K0Gfe+/jne+n/ln9FL5G2ykq+0zUU2PEanqtBC?=
 =?us-ascii?Q?vPlZ7WrW16jXRps9o96I8TFTfs9spL9tP00P278x5WnnRtvai+KsDgDPuuas?=
 =?us-ascii?Q?9X54L7BK1uhITRrdhUb2DxNYGwkgMtcNLY4DSQc4UDghjV/bJhSM085GKKJR?=
 =?us-ascii?Q?2iJzwjOujpHaipPwCC1La4rPM1MM3zfxJFT4T+bj572HjyCKpfNqpGxQEFW6?=
 =?us-ascii?Q?BVMgwRhLY1dx3wpQMmbvrpO4XU7qoNe4/QFl+azMlkrAVmBgtXunKj0svy71?=
 =?us-ascii?Q?yEtEs3lk3iVyhq4yznpKvRtG1H2Dc5sz+rhONo7OrXr0Kdm912geKf3r2uKo?=
 =?us-ascii?Q?G/HYQhgs13YNNjicPXzB9+1jWN4tK1MfHM1/+UyTFcbGhV8VpbWBFR5J37WG?=
 =?us-ascii?Q?e6ddw9xLPEYjhDq/Y1sUJQloca4LUqMufhr9Z8EggnztWYtfkie4lg01aGNI?=
 =?us-ascii?Q?WAwmb6gHFSYjNUWiDiTBm5YuUdEEEv5gBqKj9OQx+sgxOObWA/BCO768B0rt?=
 =?us-ascii?Q?xWNUHBnvFjMrJqPUjS3O9vXC9d4O2bsZpCmEsFukXG0wLXRMQzAxcM3DJ2Ap?=
 =?us-ascii?Q?fjLv3CAokYw/UR41iE10LdoxFlGjGZ4haugNPeD8T+/8AjbhWfqtckZ84+DR?=
 =?us-ascii?Q?5U8OjWTTBHr67xIJE7SBpLKCIyjSwO5i/mV0emBNmTS3wE/MNsff3F7Pzco1?=
 =?us-ascii?Q?dIvu2s1DPyAJEgbpR9YCV8NChLm51266fyBTNZioYmbm+b6GL2ivRBR3vMuE?=
 =?us-ascii?Q?4COl50hya3fT7nMwf/fBwcQtGLGQiq+kjdULKHYfWNKT/qnA9w3vs7fqb8sa?=
 =?us-ascii?Q?nzEmxhGx63M4oxCMA+7g9eayTZbfeNa9O2Lb9q2X8YU59DbQRyYjAKLHyDUV?=
 =?us-ascii?Q?oTyQAUfhNBD+5ZJLeo8e8njzww+qDnMTvjHKdk/thNCQrICzKs3fVgvkcU36?=
 =?us-ascii?Q?ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8900fc89-1346-41e6-a33c-08db1f6f74a7
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 00:52:56.3906 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /bUICZVpYHbzflYbaZv+TmfXzIwtbzIP/xQvSnTDUMkbqiz9ON5cc7sqTvz/wqkScbwVd3akaBiyXfEowQS2LuwwT16nOYNTaPKpqKkhscs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8259
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Skip XY_FAST_COLOR instruction on
 link copy engines
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Mar 07, 2023 at 01:06:43AM -0800, Lucas De Marchi wrote:
> On Tue, Mar 07, 2023 at 01:39:16PM +0530, Balasubramani Vivekanandan wrote:
> > Link copy engines doesn't support the XY_FAST_COLOR instruction.
> > Currently this instruction is used only at one place to clear a ttm
> > resource while migrating a BO.
> > A new device_info member is created to know if a platform has link copy
> > engine. If it supports, then instead of using XY_FAST_COLOR instruction,
> > MEM_SET is used which is available both in main and link copy engines.
> > 
> > BSpec: 68433
> > 
> > Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> > ---
> > drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  9 ++++
> > drivers/gpu/drm/xe/xe_device_types.h      |  2 +
> > drivers/gpu/drm/xe/xe_migrate.c           | 65 ++++++++++++++++-------
> > drivers/gpu/drm/xe/xe_pci.c               |  4 ++
> > 4 files changed, 60 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > index 288576035ce3..df9ed4fbf2bf 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
> > @@ -6,6 +6,8 @@
> > #ifndef _XE_GPU_COMMANDS_H_
> > #define _XE_GPU_COMMANDS_H_
> > 
> > +#include "regs/xe_reg_defs.h"
> 
> for the uses we are making here, it should suffice to
> include linux/bitmap.h
> 
> > +
> > #define INSTR_CLIENT_SHIFT      29
> > #define   INSTR_MI_CLIENT       0x0
> > #define __INSTR(client) ((client) << INSTR_CLIENT_SHIFT)
> > @@ -56,6 +58,13 @@
> > #define GEN9_XY_FAST_COPY_BLT_CMD	(2 << 29 | 0x42 << 22)
> > #define   BLT_DEPTH_32			(3<<24)
> > 
> > +#define	PVC_MEM_SET_CMD		(2 << 29 | 0x5b << 22)
> > +#define   PVC_MEM_SET_CMD_LEN_DW	7
> > +#define   PVC_MS_MATRIX			REG_BIT(17)
> > +/* Bspec lists field as [6:0], but index alone is from [6:1] */
> > +#define   PVC_MS_MOCS_INDEX_MASK	GENMASK(6, 1)
> > +#define   PVC_MS_DATA_FIELD		GENMASK(31, 24)
> 
> wrong order. Should be defining the most significative bits first,
> like they appear in bspec.
> 
> > +
> > #define GFX_OP_PIPE_CONTROL(len)	((0x3<<29)|(0x3<<27)|(0x2<<24)|((len)-2))
> > #define   PIPE_CONTROL_TILE_CACHE_FLUSH			(1<<28)
> > #define   PIPE_CONTROL_AMFS_FLUSH			(1<<25)
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> > index 199bd37fce9a..a73c5e1d7503 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -95,6 +95,8 @@ struct xe_device {
> > 		bool has_4tile;
> > 		/** @has_range_tlb_invalidation: Has range based TLB invalidations */
> > 		bool has_range_tlb_invalidation;
> > +		/** @has_link_copy_engines: Whether the platform has link copy engines */
> > +		bool has_link_copy_engine;
> > 		/** @enable_display: display enabled */
> > 		bool enable_display;
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index bc69ec17d5ad..59fd588a1faf 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -750,32 +750,57 @@ static int emit_clear(struct xe_gt *gt, struct xe_bb *bb, u64 src_ofs,
> > 		      u32 size, u32 pitch, u32 value, bool is_vram)
> > {
> > 	u32 *cs = bb->cs + bb->len;
> > -	u32 len = XY_FAST_COLOR_BLT_DW;
> > +	u32 len;
> > 	u32 mocs = xe_mocs_index_to_value(gt->mocs.uc_index);
> > +	struct xe_device *xe = gt_to_xe(gt);
> > 
> > -	if (GRAPHICS_VERx100(gt->xe) < 1250)
> > -		len = 11;
> > -
> > -	*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > -		(len - 2);
> > -	*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > -		(pitch - 1);
> > -	*cs++ = 0;
> > -	*cs++ = (size / pitch) << 16 | pitch / 4;
> > -	*cs++ = lower_32_bits(src_ofs);
> > -	*cs++ = upper_32_bits(src_ofs);
> > -	*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > -	*cs++ = value;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -	*cs++ = 0;
> > -
> > -	if (len > 11) {
> > -		*cs++ = 0;
> > +	if (xe->info.has_link_copy_engine) {
> 
> I wonder if instead of doing this we have here one example of function
> hook that could provide some value. +Francois.
> 
> And take a look at the discussion in 20230303145015.1018870-1-francois.dugast@intel.com
> 
> I wouldn't block this series on that though.
> 
> 
> > +		/* MEM_SET command supports setting only 8-bit value.
> 
> leave a blank line:
> 
> 		/*
> 		 * MEM_SET ...
> 
> is the more usual style.
> 	
> > +		 * This function is currently used only to clear the address
> > +		 * range.  So the value agrument is not really used. Need to
> > +		 * have a better handling when there is a need to actually set
> > +		 * a value. Print a warning if a value bigger than 8-bit is
> > +		 * passed
> > +		 */
> > +		XE_WARN_ON(value > U8_MAX);
> > +
> > +		len = PVC_MEM_SET_CMD_LEN_DW;
> > +
> > +		*cs++ = PVC_MEM_SET_CMD | PVC_MS_MATRIX |
> > +				(PVC_MEM_SET_CMD_LEN_DW - 2);
> > +		*cs++ = pitch - 1;
> > +		*cs++ = (size / pitch) - 1;
> > +		*cs++ = pitch - 1;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = FIELD_PREP(PVC_MS_DATA_FIELD, value) |
> > +				FIELD_PREP(PVC_MS_MOCS_INDEX_MASK, mocs);
> > +	} else {
> > +		len = XY_FAST_COLOR_BLT_DW;
> > +		if (GRAPHICS_VERx100(gt->xe) < 1250)
> > +			len = 11;
> > +
> > +		*cs++ = XY_FAST_COLOR_BLT_CMD | XY_FAST_COLOR_BLT_DEPTH_32 |
> > +			(len - 2);
> > +		*cs++ = FIELD_PREP(XY_FAST_COLOR_BLT_MOCS_MASK, mocs) |
> > +			(pitch - 1);
> > 		*cs++ = 0;
> > +		*cs++ = (size / pitch) << 16 | pitch / 4;
> > +		*cs++ = lower_32_bits(src_ofs);
> > +		*cs++ = upper_32_bits(src_ofs);
> > +		*cs++ = (is_vram ? 0x0 : 0x1) <<  XY_FAST_COLOR_BLT_MEM_TYPE_SHIFT;
> > +		*cs++ = value;
> > 		*cs++ = 0;
> > 		*cs++ = 0;
> > 		*cs++ = 0;
> > +
> > +		if (len > 11) {
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +			*cs++ = 0;
> > +		}
> > 	}
> > 
> > 	XE_BUG_ON(cs - bb->cs != len + bb->len);
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index c4d9fd2e7b2b..e555f13395ab 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -72,6 +72,8 @@ struct xe_device_desc {
> > 	bool has_4tile;
> > 	bool has_range_tlb_invalidation;
> > 	bool has_asid;
> > +
> > +	bool has_link_copy_engine;
> 
> I'm not sure if we should tie the availability of
> MEM_SET instruction to the fact that the platform has link copy engines.
> It seems to be an instruction to carry forward regardless of the type of
> the copy engine.
> 
> +Matt Roper for opinion here

I think it's probably okay; the bspec tagging for MEM_SET and MEM_COPY
operations points at the hardware change that introduced link copy
engines; so I think they're intertwined in the hardware design.  At the
moment PVC is the only platform that falls into that category; although
MTL is a "newer" IP version number, it doesn't have link copy engines or
MEM_SET/MEM_COPY so using an IP version check wouldn't be a good idea.

On future platforms I think it's expected that link copy engines and
these instructions will continue to be tied together.  It's possible
that a given platform may have all of the link copy engines fused off,
but desc.has_link_copy_engine would still be considered true for that
case.


Matt

> 
> Lucas De Marchi
> 
> > };
> > 
> > __diag_push();
> > @@ -224,6 +226,7 @@ static const struct xe_device_desc pvc_desc = {
> > 	.vm_max_level = 4,
> > 	.supports_usm = true,
> > 	.has_asid = true,
> > +	.has_link_copy_engine = true,
> > };
> > 
> > #define MTL_MEDIA_ENGINES \
> > @@ -413,6 +416,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
> > 	xe->info.has_flat_ccs = desc->has_flat_ccs;
> > 	xe->info.has_4tile = desc->has_4tile;
> > 	xe->info.has_range_tlb_invalidation = desc->has_range_tlb_invalidation;
> > +	xe->info.has_link_copy_engine = desc->has_link_copy_engine;
> > 
> > 	spd = subplatform_get(xe, desc);
> > 	xe->info.subplatform = spd ? spd->subplatform : XE_SUBPLATFORM_NONE;
> > -- 
> > 2.34.1
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
