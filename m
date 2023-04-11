Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AC3C7619A
	for <intel-xe@archiver.kernel.org>; Tue, 11 Apr 2023 19:28:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 948AA10E125;
	Tue, 11 Apr 2023 19:28:54 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0273E10E125
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Apr 2023 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681241332; x=1712777332;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=DqPild3SBBC2+6FidPEO/GhvyRCX8e9LPmAdWM8fEmw=;
 b=aCxwFTG5QOPf8Koef7R6SXs3nl0TZm4opBPKksmklYmV+jFBKjSAnU+4
 aOU0j/6le7RoW7XLCI5tTygKaLd/namVpE4IbL7fLD9YcpFzMzxV+ohcp
 /9OmwUoSzH1ph6qm54zZhcokk4zbJdKyUkL/4ZIEbf/ysJEZV5Q/yiIAm
 Q7Bi8e5pzw+ehZYulT61ih8ENFfjdGZ1jiynlnM9fFU13kiKnvvZrP2NF
 FbLDO1ytL2TU/Iqb6PUFBdAI79kPY//F47A+ihYE7KvQ+JSTCim4dAIYl
 7OfLRJbcbpyWJbBaR2nA3m0oPJj2Xj5ISgavSLX3IYYuwxBYsoPC3NMD4 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="345505307"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="345505307"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 12:28:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="800040792"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; d="scan'208";a="800040792"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP; 11 Apr 2023 12:28:50 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 11 Apr 2023 12:28:50 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 11 Apr 2023 12:28:50 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.105)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 11 Apr 2023 12:28:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KD7GPXQJpwH+8JH1fJj4IDNBN904dAhvBK2y2ZT4NsIu9mNOt7Q/yKjBfr5r3zJsBs3lESluf7rgFamsbSHjmwxvQRza3nl6UlMntZ3Q0JYeBU/ij6lPVdYKq221ID6AEDJPY9qFGqpsQKuq0EK9Jx5NHIXfmSVJfEPn4nvvD9UFaFu7gs88h4Mag/SZUypa4TqxhwC2dO1SUU7VkiGh0HEg9hD/1CakTfgYP2j98lRuqvHuSfF8o2FuMLU33WcvDjihggfjcptSSXjDmQr+827JVsm1hCXnRgPlPLbS8W8u7tIvnJPGUAdQuM9zDnU7RVckNiS4rZZymgcEMnxGlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hUO1A428SQuqIMGLDdiiFaMjVXGJIASKiA5LKeDHuvI=;
 b=E5D5DaJ7vqBIxzwRrENuAdgPqLe0OjE0tGXu69fvDNK0ZbNac83EMlsSfjh30a1jG4yw9cd8S4b0svTsk5Qhjh3n/DxAEp0EtXSUHLzqiKUtyCit1DWz2rnShASihbSui0QsQkkGciFLGlJI4TWBznv2uccXrtgEZWW/NEESc9x1WmSHxC2KAHs22Px8eCKeL7XpWV40i0qW58G1ml1Z9Jf/T6RvjMFmcOps5UFUhueb1SbZYK1db1vsFJe4UwnhaFuZsN/IkCbpVfevItP15DWBOYS5gwf5mHiw06pvSZURRfHPqH5JozdYXsCD0kkyiilM8iHMC8Amxo4lu1dTYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH7PR11MB6006.namprd11.prod.outlook.com (2603:10b6:510:1e1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 19:28:47 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::449e:6409:5bb1:912d%6]) with mapi id 15.20.6277.031; Tue, 11 Apr 2023
 19:28:47 +0000
Date: Tue, 11 Apr 2023 12:28:41 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <ZDW06QOXMfxSQpLW@nvishwa1-DESK>
References: <20230410200229.2726648-1-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230410200229.2726648-1-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR04CA0013.namprd04.prod.outlook.com
 (2603:10b6:a03:40::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH7PR11MB6006:EE_
X-MS-Office365-Filtering-Correlation-Id: ea740d0a-304d-465c-69d9-08db3ac2f8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4fGhEgxdw71DiRJrfjIuPQvk8cBqpa/CenOPP1osmhs82pBSH4LBK+0EJODOv1KScDX6sZrDP/5hFClFDNvaWdOXY7Tw6vPlZustDevt6+3ORNSUWVZn7NLHWyutVW1vicBteYKP1ezF8GralYpq/cbzr9JN5QFpYzZ3wpa4MjImgLJXZS/cs06wg5IYFyqAkIqSSwgb4ZUhFzEu3tN5ITQPxs1yJhieBGKScnx3jn/9LYW747wwLl0Zy565sDJdtb4QKLY8JZZy4pjqqtGOZqiKI9YG8lq0AzsOdQ1KJMZ7/8AGUCqBUUPg4uccLG9zPmYe1WTXtIinZYRGzVuP6r19rjRq0LB2vy6HA5owkZaMCxqfY1dnjJ0dAywi5PglfZFxy3CWuqexMjKPp/trJEHy5GD90TA1iiB5OGDLrFDiLKP9eCv/4KNjXmd3Njeo+8CFyXyamjRQGoqYK3oAqfosGN3lU8wOfqmWuoUVEijxLrrUjPcmQcGpwp9oKdWaj/2MqFEhpNUQlCqs25d/XVgPAYvapI8h5m6Hsx72GMIBAoMPsVVwuV9gMXnh2Wcf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(83380400001)(6486002)(6636002)(66476007)(4326008)(478600001)(66556008)(8676002)(66946007)(41300700001)(316002)(86362001)(26005)(9686003)(6512007)(6506007)(6666004)(8936002)(5660300002)(44832011)(33716001)(82960400001)(6862004)(38100700002)(2906002)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EO+TyC+HOow+iq2iFW8Panch6pvnR+Ln2yT/XPT6lIaysCNp6DX/c+h8GJAv?=
 =?us-ascii?Q?vk9uB/vYA7TR+5r6mnUMzUHUyirFS4TJjzXTWc7NDPUXWrTfvTwHE/jdyEbm?=
 =?us-ascii?Q?HZ/RMKHROZMlt8Cf1fM1iMnHBY2XUWBn5eL/pt44SiS4fvk68dx4ZWSbMBD7?=
 =?us-ascii?Q?WWaO+RbF5YAk2GUUnh1xduf0KBnpgo7la1db7Jlgeo9RKNfnpNBiSV9dq+/p?=
 =?us-ascii?Q?LJqI15LpJAk8ujQ3ylEfwZl94Hq5aTKHDDI4LgKDal8AyyfHjLBF0Kn8/iru?=
 =?us-ascii?Q?SI5BWSa6BvbUVZc0965Aq/WKwEkCzb12pei600k9M7gtBufDyAzqw/2+/mL/?=
 =?us-ascii?Q?CtqgkrwimzZywpkiT3xV2kJUMDlfql8euoiBhhzRFPUbpF4rCcWI66aq22RI?=
 =?us-ascii?Q?tPRunH977eeuKuEEqWORZGHZSFdX7vRhfHO7w/z2LCIMk4PnDMeLzBvKYjxk?=
 =?us-ascii?Q?z5guqFu17uksgL0qlnDsvoMSlrDw9XSF9H319/WgYXAyYsZ0h20QFZbd9wAu?=
 =?us-ascii?Q?sp/tDVM/VO3qSPMIpoSwumZFA94JcKRUY3H8EKr5TkeoW/RSu5uIq4bGIFBy?=
 =?us-ascii?Q?vhwLjF2wofOHDonYvHIvJI56pLlL2FwF0ea9fg+IDRsy0w5qvWQpA9AjqBzw?=
 =?us-ascii?Q?Pi750K/gKCw1H61kzBAluswiby8ytGx0padZHsG5C1E2nYFa3bsBf51evuY1?=
 =?us-ascii?Q?aaUb0WyZvsUvjtBeYwc0x90FeaiKw+r35F0UyY4ubaf94O5QCrFUCqdg6CbM?=
 =?us-ascii?Q?HCjdZHVZJ0u7gS8w4ucwHbdwouGxWonIdJndbdKzPfrPJCytLsLeqHwRGH1e?=
 =?us-ascii?Q?G4rsZKTJo6U2lKycuCgkTG2qH+MvvjX5rzy/S3xQhBHvSfqEjqGvjcIZWM9u?=
 =?us-ascii?Q?ow5M9/l2+DNBZj2Ms8yKXSh7VgsNqQ9+yB7PsUBWYmiERD9Ti1zTPpmmHRyX?=
 =?us-ascii?Q?6hViG06r1xMVPZ8wTHYmlzKXqUX/GKuE2HG39ePp6GqzJ+4KslzqSUdkRwHw?=
 =?us-ascii?Q?+BqPWSUOasjQfYIORt2Q7Fa8ahCiBqlat1GL6Lk6lxvpDJPHphkL6h6mr302?=
 =?us-ascii?Q?9t+VDP8xDABF/p8K7Npb8P1tmwfldcZreVSn7WfpaAuFPHM6e3d/BBy/pNYP?=
 =?us-ascii?Q?oSB5WxoEOmFbnKctkehZEvla6nPZ+Hgmb2Sz0RIip+l87T7bhRhBLx+GU7b2?=
 =?us-ascii?Q?cZk3dZpO8x4SfqfI7kT97Bfi/DpdSXU7nIhuhAaGHAGqx049nOVFEsPSrrcG?=
 =?us-ascii?Q?zpOontwIBV+/zcPXO3V81VQwB0QVpfsFMtEEWnGndxzzdMbBHq6IGFJ6xymq?=
 =?us-ascii?Q?pwFLEtsMW/Eyohq5r+ttPs7s6y85wGCW3UQD7mQWNEB6ZG8zh7q2iEjDfxOt?=
 =?us-ascii?Q?kY4VYml1lLqjN+dawzwxnVaIcKr4t/d0TaZhdf+gYpygXXRbNAo6UFs20p+G?=
 =?us-ascii?Q?8Ssl5wY0cpzlYIC/c9S1lnl7ScSj/AcazK7po3m26jKnEq3rz/+jAJWh0x4a?=
 =?us-ascii?Q?4TbLpYqlpquBzAaLCYr0kbZF1ke4ht5fL9kABoTfIvxjDFwQh1Nhz1XMAblt?=
 =?us-ascii?Q?wgpZn/juWZ9U4s4JsOLSlEo3o4Ybacx3ztFbIXv3bIaOQqm3qxBnK49msBLP?=
 =?us-ascii?Q?d/mBn1ArJ9hopfMwpnI8+qM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea740d0a-304d-465c-69d9-08db3ac2f8aa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:28:47.5031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c1sxI6RkZNsQ6XbwC0R1ygHd7YY17bVd8dg4rW8B9OzdOmvtCQDuZ4+nC7cfJ4D946rsV+ECIHIed+0VbEleRu7yHrNw9tUU18p9ReeklfORgIQsFGlywBwivEGmZt04
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6006
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Let primary and media GT share a
 kernel_bb_pool
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

On Mon, Apr 10, 2023 at 01:02:29PM -0700, Matt Roper wrote:
>The media GT requires a valid gt->kernel_bb_pool during driver probe to
>allocate the WA and NOOP batchbuffers used to record default context
>images.  Dynamically allocate the bb_pools so that the primary and media
>GT can use the same pool during driver init.
>
>The media GT still shouldn't be need the USM pool, so only hook up the
>kernel_bb_pool for now.
>
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_bb.c         |  2 +-
> drivers/gpu/drm/xe/xe_gt.c         | 32 ++++++++++++++++++------------
> drivers/gpu/drm/xe/xe_gt_debugfs.c |  4 ++--
> drivers/gpu/drm/xe/xe_gt_types.h   | 10 +++++++---
> drivers/gpu/drm/xe/xe_migrate.c    |  4 ++--
> drivers/gpu/drm/xe/xe_sa.c         | 23 ++++++++++++++-------
> drivers/gpu/drm/xe/xe_sa.h         |  4 +---
> 7 files changed, 48 insertions(+), 31 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_bb.c b/drivers/gpu/drm/xe/xe_bb.c
>index 7172801ee570..3deb2d55f421 100644
>--- a/drivers/gpu/drm/xe/xe_bb.c
>+++ b/drivers/gpu/drm/xe/xe_bb.c
>@@ -42,7 +42,7 @@ struct xe_bb *xe_bb_new(struct xe_gt *gt, u32 dwords, bool usm)
> 	 * space to accomodate the platform-specific hardware prefetch
> 	 * requirements.
> 	 */
>-	bb->bo = xe_sa_bo_new(!usm ? &gt->kernel_bb_pool : &gt->usm.bb_pool,
>+	bb->bo = xe_sa_bo_new(!usm ? gt->kernel_bb_pool : gt->usm.bb_pool,
> 			      4 * (dwords + 1) + bb_prefetch(gt));
> 	if (IS_ERR(bb->bo)) {
> 		err = PTR_ERR(bb->bo);
>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>index daaf93e23bbf..4186f7f0d42f 100644
>--- a/drivers/gpu/drm/xe/xe_gt.c
>+++ b/drivers/gpu/drm/xe/xe_gt.c
>@@ -137,7 +137,7 @@ static int emit_nop_job(struct xe_gt *gt, struct xe_engine *e)
> 	if (IS_ERR(bb))
> 		return PTR_ERR(bb);
>
>-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
>+	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
> 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> 	if (IS_ERR(job)) {
> 		xe_bb_free(bb, NULL);
>@@ -186,7 +186,7 @@ static int emit_wa_job(struct xe_gt *gt, struct xe_engine *e)
> 		}
> 	}
>
>-	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool.bo);
>+	batch_ofs = xe_bo_ggtt_addr(gt->kernel_bb_pool->bo);
> 	job = xe_bb_create_wa_job(e, bb, batch_ofs);
> 	if (IS_ERR(job)) {
> 		xe_bb_free(bb, NULL);
>@@ -439,26 +439,32 @@ static int all_fw_domain_init(struct xe_gt *gt)
> 	if (err)
> 		goto err_force_wake;
>
>-	/*
>-	 * FIXME: This should be ok as SA should only be used by gt->migrate and
>-	 * vm->gt->migrate and both should be pointing to a non-media GT. But to
>-	 * realy safe, convert gt->kernel_bb_pool to a pointer and point a media
>-	 * GT to the kernel_bb_pool on a real tile.
>-	 */
> 	if (!xe_gt_is_media_type(gt)) {
>-		err = xe_sa_bo_manager_init(gt, &gt->kernel_bb_pool, SZ_1M, 16);
>-		if (err)
>+		gt->kernel_bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
>+		if (IS_ERR(gt->kernel_bb_pool)) {
>+			err = PTR_ERR(gt->kernel_bb_pool);
> 			goto err_force_wake;
>+		}
>
> 		/*
> 		 * USM has its only SA pool to non-block behind user operations
> 		 */
> 		if (gt_to_xe(gt)->info.supports_usm) {
>-			err = xe_sa_bo_manager_init(gt, &gt->usm.bb_pool,
>-						    SZ_1M, 16);
>-			if (err)
>+			gt->usm.bb_pool = xe_sa_bo_manager_init(gt, SZ_1M, 16);
>+			if (IS_ERR(gt->usm.bb_pool)) {
>+				err = PTR_ERR(gt->usm.bb_pool);
> 				goto err_force_wake;
>+			}
> 		}
>+	} else {
>+		struct xe_gt *full_gt = xe_find_full_gt(gt);
>+
>+		/*
>+		 * Media GT's kernel_bb_pool is only used while recording the
>+		 * default context during GT init.  The USM pool should never
>+		 * be needed on the media GT.
>+		 */
>+		gt->kernel_bb_pool = full_gt->kernel_bb_pool;
> 	}
>
> 	if (!xe_gt_is_media_type(gt)) {
>diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>index 9fab8017490f..c45486c2015a 100644
>--- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>+++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>@@ -66,8 +66,8 @@ static int sa_info(struct seq_file *m, void *data)
> 	struct xe_gt *gt = node_to_gt(m->private);
> 	struct drm_printer p = drm_seq_file_printer(m);
>
>-	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool.base, &p,
>-				     gt->kernel_bb_pool.gpu_addr);
>+	drm_suballoc_dump_debug_info(&gt->kernel_bb_pool->base, &p,
>+				     gt->kernel_bb_pool->gpu_addr);
>
> 	return 0;
> }
>diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
>index 9d3117fad2e4..7c47d67aa8be 100644
>--- a/drivers/gpu/drm/xe/xe_gt_types.h
>+++ b/drivers/gpu/drm/xe/xe_gt_types.h
>@@ -214,7 +214,7 @@ struct xe_gt {
> 		 * behind any user operations which may have resulted in a
> 		 * fault.
> 		 */
>-		struct xe_sa_manager bb_pool;
>+		struct xe_sa_manager *bb_pool;
> 		/**
> 		 * @reserved_bcs_instance: reserved BCS instance used for USM
> 		 * operations (e.g. mmigrations, fixing page tables)
>@@ -304,8 +304,12 @@ struct xe_gt {
> 	/** @hw_engines: hardware engines on the GT */
> 	struct xe_hw_engine hw_engines[XE_NUM_HW_ENGINES];
>
>-	/** @kernel_bb_pool: Pool from which batchbuffers are allocated */
>-	struct xe_sa_manager kernel_bb_pool;
>+	/**
>+	 * @kernel_bb_pool: Pool from which batchbuffers are allocated.
>+	 *
>+	 * Media GT shares a pool with its primary GT.
>+	 */
>+	struct xe_sa_manager *kernel_bb_pool;
>
> 	/** @migrate: Migration helper for vram blits and clearing */
> 	struct xe_migrate *migrate;
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index e8978440c725..8686a2a7b035 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -161,7 +161,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
> 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> 	u32 map_ofs, level, i;
> 	struct xe_device *xe = gt_to_xe(m->gt);
>-	struct xe_bo *bo, *batch = gt->kernel_bb_pool.bo;
>+	struct xe_bo *bo, *batch = gt->kernel_bb_pool->bo;
> 	u64 entry;
> 	int ret;
>
>@@ -229,7 +229,7 @@ static int xe_migrate_prepare_vm(struct xe_gt *gt, struct xe_migrate *m,
> 		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>
> 		if (xe->info.supports_usm) {
>-			batch = gt->usm.bb_pool.bo;
>+			batch = gt->usm.bb_pool->bo;
> 			batch_addr = xe_bo_addr(batch, 0, GEN8_PAGE_SIZE,
> 						&is_vram);
> 			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>diff --git a/drivers/gpu/drm/xe/xe_sa.c b/drivers/gpu/drm/xe/xe_sa.c
>index 96c4b0ef24fe..c16f7c14ff52 100644
>--- a/drivers/gpu/drm/xe/xe_sa.c
>+++ b/drivers/gpu/drm/xe/xe_sa.c
>@@ -33,13 +33,18 @@ static void xe_sa_bo_manager_fini(struct drm_device *drm, void *arg)
> 	sa_manager->bo = NULL;
> }
>
>-int xe_sa_bo_manager_init(struct xe_gt *gt,
>-			  struct xe_sa_manager *sa_manager,
>-			  u32 size, u32 align)
>+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align)
> {
> 	struct xe_device *xe = gt_to_xe(gt);
> 	u32 managed_size = size - SZ_4K;
> 	struct xe_bo *bo;
>+	int ret;
>+
>+	struct xe_sa_manager *sa_manager = drmm_kzalloc(&gt_to_xe(gt)->drm,
>+							sizeof(*sa_manager),
>+							GFP_KERNEL);
>+	if (!sa_manager)
>+		return ERR_PTR(-ENOMEM);
>
> 	sa_manager->bo = NULL;
>
>@@ -49,7 +54,7 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
> 	if (IS_ERR(bo)) {
> 		drm_err(&xe->drm, "failed to allocate bo for sa manager: %ld\n",
> 			PTR_ERR(bo));
>-		return PTR_ERR(bo);
>+		return (struct xe_sa_manager *)bo;

NIT...'return ERR_CAST(bo);'

Niranjana

> 	}
> 	sa_manager->bo = bo;
>
>@@ -61,15 +66,19 @@ int xe_sa_bo_manager_init(struct xe_gt *gt,
> 		if (!sa_manager->cpu_ptr) {
> 			xe_bo_unpin_map_no_vm(sa_manager->bo);
> 			sa_manager->bo = NULL;
>-			return -ENOMEM;
>+			return ERR_PTR(-ENOMEM);
> 		}
> 	} else {
> 		sa_manager->cpu_ptr = bo->vmap.vaddr;
> 		memset(sa_manager->cpu_ptr, 0, bo->ttm.base.size);
> 	}
>
>-	return drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>-					sa_manager);
>+	ret = drmm_add_action_or_reset(&xe->drm, xe_sa_bo_manager_fini,
>+				       sa_manager);
>+	if (ret)
>+		return ERR_PTR(ret);
>+
>+	return sa_manager;
> }
>
> struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
>diff --git a/drivers/gpu/drm/xe/xe_sa.h b/drivers/gpu/drm/xe/xe_sa.h
>index 742282ef7179..3063fb34c720 100644
>--- a/drivers/gpu/drm/xe/xe_sa.h
>+++ b/drivers/gpu/drm/xe/xe_sa.h
>@@ -11,9 +11,7 @@ struct dma_fence;
> struct xe_bo;
> struct xe_gt;
>
>-int xe_sa_bo_manager_init(struct xe_gt *gt,
>-			  struct xe_sa_manager *sa_manager,
>-			  u32 size, u32 align);
>+struct xe_sa_manager *xe_sa_bo_manager_init(struct xe_gt *gt, u32 size, u32 align);
>
> struct drm_suballoc *xe_sa_bo_new(struct xe_sa_manager *sa_manager,
> 				  u32 size);
>-- 
>2.39.2
>
