Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ED4CE7AFE
	for <intel-xe@archiver.kernel.org>; Thu, 28 Sep 2023 04:41:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E5410E5CD;
	Thu, 28 Sep 2023 04:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2419F10E5CD
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Sep 2023 04:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695876091; x=1727412091;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UVaSu6KvrUkOKm/oizt35VEElQjTJvovUSVIxyuyJx4=;
 b=lOtLxeUa/wlTYjr0NmkapOl6a16NamkLpg6eQxKWTv4LFmMNfPAUhWLi
 MLb4GokihNTtt4wg3A4WbrB9KA2MGYz5gnT39BbX9Jb/8093yiTjHtCv8
 3XHJS3HPhP/N9mpxUX9p+akRtsAEtBm2SZnPh1pXU/NINn4qe8kdDwqmK
 8MchMvdmQzEgipzQT+Q6kqo62EMqD86MYuJMkD5on3pYUtsnZoboqag9L
 SwOBZ0mONnh2FJLokCLXuKHYeoj27+7MSqyXCYz6JLoyfZm2+AXhoLGL4
 TxDXAkKCA0Mh5pg1r/sir1r1ZZbYEi0B7Xzj2VNZI5qaZ0e3PGW5aX8Wk w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="380863914"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="380863914"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 21:41:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="815106572"
X-IronPort-AV: E=Sophos;i="6.03,182,1694761200"; d="scan'208";a="815106572"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2023 21:41:30 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 21:41:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 21:41:30 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 21:41:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMxsZ6pVjo155X0/VSlh6dEY0YCMP1IKv5GaSF2JPCgqYFBXbXYs0BulbwWwPMRpzZCnv0OXvSCkc6qigiUQYA+1rZAXZPI4zCTLod5lIayu+RE6m+ldZW5F8sKfDVWjc7QOIGbk8aUjQMjUSaXCY8jew1tNit6jPbW4ZoUh36iBq8OIdnBHWH1Kbn4cs4rJiOEFBx9nBY4cg+74xl2KkOp2kmA4BQ653j3uqJQdc5xaK7VfyaSMemZF2Zw1vg6fDr7yilssaBOusiMIaNx+bXVd2rac982+64zIPBr6FTRyZ1TZzpsjKnYJufqgfVrctVOTSyzEevxYcyREtDzVBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DKYq+Mn/rqxFOsrHrUBWivBc6ocXIi1QIBZB0HBUWGI=;
 b=aOKdXf3lmBI7TvmdyRgsK1i8poglAO2sl5ianvx5On/yjSF2cGYOEQcE4Ehv2lg2OOtsnC47bM+PzjmWk46u8NbaEd8MB/9cKmUim+q+ujfnnlDcgKvap70rqgjoG6R+QEiJP5sO67wWEkCRdoVSSSmTz0F4El7PgdyiaOFRoY8bRFfEZQuLQMICwgdkEaY33CL99idTWyzn4qx9zkqQKH/VLWtijDWV+70DZ4/OuRGOLbsNWHoKcLfeiMrppuRsfuT80CfEVVrevvN765g1XzCwauqEhlKSeQiVbsPKJtRXSdmgj8sIQkwve2vdn17WGqbfIZRj5/zD0NPZ12TeWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CY5PR11MB6390.namprd11.prod.outlook.com (2603:10b6:930:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 28 Sep
 2023 04:41:22 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6813.017; Thu, 28 Sep 2023
 04:41:22 +0000
Date: Wed, 27 Sep 2023 21:41:19 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZRUD75aMKbxBK+kH@nvishwa1-DESK>
References: <20230927110005.291917-7-matthew.auld@intel.com>
 <20230927110005.291917-9-matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230927110005.291917-9-matthew.auld@intel.com>
X-ClientProxiedBy: BYAPR01CA0060.prod.exchangelabs.com (2603:10b6:a03:94::37)
 To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CY5PR11MB6390:EE_
X-MS-Office365-Filtering-Correlation-Id: 73199839-3998-4a88-ac0f-08dbbfdd2a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZyK4OuLrZi8fjv9pA2DUX4tCSPu1j1fJYJiP1ansDHITCIy0MCZPDWaHVpejFToKj2Tp7cZ8RPtyKbp82LFTq5L0IGTumTJzdKlnhQZbkBPN7t6OlZ03P1euoEAO8pFSnxYThDnEmrqYhO+122GyTVxOoGkV7yJ96tYO8amzkrKf16tni+fhmtr7hd3Rq5jRFS+DHeXvuAT1sOXnLD7XsYnLb0nHyVOmc/BwzDeevrrT1NZjPa/sv4FmEHbrS56YvORwLwzcgZDlKrt5wF1bPFWBXvzHs4OPZiKRo+Cmeg1UP2H2SRX/Ja8g6wv9Bt08Z0V+cBUMuzSh+unX7Bnf7IlkSwkHN5w+fmSN8iMPUBwu072jVl4uD3xEN+FdO5yS8dQS/5Cpd3UT4PIgNMSgEVSccWbiKjP7S6vj/mcAw+3iTea6zfITPrm0qFibCgyj7YQWs6XcDf4ttxVliqSbSy27CB+2jny74moJh9xPZgE1v1DbJVhy9q0Gh0e69fY9ksuOy0GMDnQP9F+9SVjwZapJFDLo7N4bfhLj0b3+5RpjfWGSUdEMR1QmCl7wFNv9D0+rraT5XNP/fACpHawNdVF6wErw5ufbIY6yJl/rZTk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(136003)(346002)(376002)(396003)(366004)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2906002)(6636002)(30864003)(316002)(44832011)(41300700001)(8676002)(4326008)(6862004)(5660300002)(33716001)(54906003)(6666004)(66556008)(6512007)(66476007)(86362001)(6486002)(9686003)(6506007)(107886003)(66946007)(38100700002)(478600001)(26005)(83380400001)(8936002)(82960400001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lTNK/RfOxBjLLHkmWU3QDN4e7UXqfEhU5JQfo2hSljmWs/kfxExftHmWrNT9?=
 =?us-ascii?Q?bB+8+bTe5n66nKnBr2zSXjfcKi1p7OAW2E7TxjTBYRETx8ENvSFj8eZqqcAN?=
 =?us-ascii?Q?CrKD9JKdjD1CH20EwxmM0B1jSuDfEL1A2BeKn7VmWb3iGSAqE5rBwAVhvxFO?=
 =?us-ascii?Q?oua5WpTBMrUK5Zr9Wf+qs0fK8YIz0CK970IgqCVM18wv0GXiUYtXb/xfTGvU?=
 =?us-ascii?Q?v2dID1czegk7lY4Cxf5s1t1MDymNxtg9/IVG9oKKuHEnuCpAOrD3V+JIlbb1?=
 =?us-ascii?Q?zVe+4hp6z+PtyHSrbdH9gZmZZ8I0z9NCMbqD1OpU9z8Zui7GQE8yoLuDk5wX?=
 =?us-ascii?Q?KPYd9CG+Qlbj+ZGjvudBwT3PjVY00IDzcoOcYzRkWo/F8OW1PkEkTIH+azqS?=
 =?us-ascii?Q?djnJLzeMs4Oba4fktKx6GcBA1IBjEN+HZ6Lcv0xN1gXt/KHyiGI3QO2bSjBf?=
 =?us-ascii?Q?hN8+4Ly4g2VZZCdZaO3j6R1xaPKd3o2QIajjTF4EekaKoX3aN05dAf7A4vHf?=
 =?us-ascii?Q?dmz7McST6DYcJgLknrnireYNfGcd5UzV9beGkFIJseb6lCLa9Dc+G0eEdgSt?=
 =?us-ascii?Q?vvHo+Wse8Ere7ELT5mt3y0xBLDHR6YQn/f3ul4VRaJ7ay7tG42TFtQcfi+3V?=
 =?us-ascii?Q?RfHKmhwaKM/n8ZUKkI1CsLA4LK9EGkSy9/oqaqBYjMoswS3b/44sD+/pQmTJ?=
 =?us-ascii?Q?gKVzNNtLUWqdZWJ0D0MaxuLdbuAKpubCw6P2KOdXTvrqE38FS295Z/FXY9KM?=
 =?us-ascii?Q?0Rmgq+qGp02J8cmQRV9lhozKH3juZhYjz/XzaqByhcDHcOiyCxgMl+ZeMIIs?=
 =?us-ascii?Q?NMhyJPXKrt6mHKBG6IWmnWS1itZAcV5DYUOLir1MtQ8JkvMbY58lys/3aF/P?=
 =?us-ascii?Q?XuCjD9pW7G3PQwmXpte5gJObJG21jIxodXD4/ma1jzqFsMTSME13Yzo2BhFG?=
 =?us-ascii?Q?5ZRN29BwvYM02WW8Ata+mXRbyuDwUdxf5xwD5zVa9ZktQlo2bDTeNYH2h991?=
 =?us-ascii?Q?vzzGzkmj0TC/EVuz7sTwUWBSfjtjM7vbsP0iF6px1pozJKT/2Fzqygb7xMI6?=
 =?us-ascii?Q?+Y0yEatCjLjtVT4bSgM3SCa1WJtXSo21qJzZxcTqo5TReTDcZGWINLjdgum1?=
 =?us-ascii?Q?6ZChzOKSQ19enjd1jO7eGTkKpQNepZQ8YXuNY3xhto+qKYkxnpTGyHlI6WMH?=
 =?us-ascii?Q?NLA/xkTkxn2AEPtWWr9SpwOsdV4IAXV4B/uqUqzvfo5zER3iFxBxbT2+SSA3?=
 =?us-ascii?Q?1avHRtioDTE2SQZez+zGlO+QLbFjZoZAqniKuog2CCFS2ogDnOPGampS5lbf?=
 =?us-ascii?Q?nQA2LOIwYHzXT+P1p+duuquSugeOKKkqXbVn5i2n3T/BIwziPVFJdBbTa2Vm?=
 =?us-ascii?Q?zpcD0/bso1iN7vsAeIdUXaoHDUCaCXwHWxUO0anW29qiHRLJKnGwuQr0wvdy?=
 =?us-ascii?Q?IJuE2Gn6fH2coXkp1PkMiC6NL9ajYQkuibWymICZHewVImqmpqi3O/et3wDc?=
 =?us-ascii?Q?v14HWqg17Xjm8G27QzEe6DKPf0z4JrWW9DDZnUz7+W9fh6bvfHZiBs+T+Fb+?=
 =?us-ascii?Q?xVGL5AohJYVSXKQYRd9QtKXptSSQ5L9b8Ybz2A2rktFkthohGWKyVfRmcAvy?=
 =?us-ascii?Q?2iFaCzagfdqFN5BhF8Wd9qE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73199839-3998-4a88-ac0f-08dbbfdd2a18
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 04:41:22.1722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12h/eXWbO0HeWN3hEP8A0+464Z9CfJ21zbBSXqK/Q3rKg4ed1cRHm1ox6um0wOwBaIofL9H/k3XStAX0YX5rDakU1zYIGUZb+wt60/+g4QVOb8U58saKL2Uk0Tu5nSx9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6390
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v4 2/5] drm/xe: directly use pat_index for
 pte_encode
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Sep 27, 2023 at 12:00:08PM +0100, Matthew Auld wrote:
>In the next patch userspace will be able to directly set the pat_index
>as part of vm_bind. To support this we need to get away from using
>xe_cache_level in the low level routines and rather just use the
>pat_index directly.
>
>v2: Rebase
>
>Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>Cc: Pallavi Mishra <pallavi.mishra@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c       |  7 +++----
> drivers/gpu/drm/xe/xe_ggtt_types.h |  3 +--
> drivers/gpu/drm/xe/xe_migrate.c    | 19 +++++++++++--------
> drivers/gpu/drm/xe/xe_pt.c         | 11 ++++++-----
> drivers/gpu/drm/xe/xe_pt_types.h   |  8 ++++----
> drivers/gpu/drm/xe/xe_vm.c         | 24 +++++++++++-------------
> 6 files changed, 36 insertions(+), 36 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 99b54794917e..2334c47c19cc 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -27,7 +27,7 @@
> #define GUC_GGTT_TOP	0xFEE00000
>
> static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>-				   enum xe_cache_level cache)
>+				   u16 pat_index)
> {
> 	u64 pte;
>
>@@ -41,13 +41,12 @@ static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> }
>
> static u64 xelpg_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>-				    enum xe_cache_level cache)
>+				    u16 pat_index)
> {
> 	struct xe_device *xe = xe_bo_device(bo);
>-	u32 pat_index = xe->pat.idx[cache];
> 	u64 pte;
>
>-	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, cache);
>+	pte = xelp_ggtt_pte_encode_bo(bo, bo_offset, pat_index);
>
> 	xe_assert(xe, pat_index <= 3);
>

Looks like this file has couple instances of pte_encode_bo() calls which
needs to be updated to use pat_index instead of cache level.

>diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
>index 486016ea5b67..d8c584d9a8c3 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
>+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
>@@ -14,8 +14,7 @@ struct xe_bo;
> struct xe_gt;
>
> struct xe_ggtt_pt_ops {
>-	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>-			     enum xe_cache_level cache);
>+	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
> };
>
> struct xe_ggtt {
>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 258c2269c916..90a1ff1aca9b 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -158,6 +158,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 				 struct xe_vm *vm)
> {
> 	struct xe_device *xe = tile_to_xe(tile);
>+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> 	u8 id = tile->id;
> 	u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> 	u32 map_ofs, level, i;
>@@ -189,7 +190,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		return ret;
> 	}
>
>-	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, XE_CACHE_WB);
>+	entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
> 	xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
>
> 	map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
>@@ -197,7 +198,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	/* Map the entire BO in our level 0 pt */
> 	for (i = 0, level = 0; i < num_entries; level++) {
> 		entry = vm->pt_ops->pte_encode_bo(bo, i * XE_PAGE_SIZE,
>-						  XE_CACHE_WB, 0);
>+						  pat_index, 0);
>
> 		xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64, entry);
>
>@@ -216,7 +217,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		     i += vm->flags & XE_VM_FLAG_64K ? XE_64K_PAGE_SIZE :
> 		     XE_PAGE_SIZE) {
> 			entry = vm->pt_ops->pte_encode_bo(batch, i,
>-							  XE_CACHE_WB, 0);
>+							  pat_index, 0);
>
> 			xe_map_wr(xe, &bo->vmap, map_ofs + level * 8, u64,
> 				  entry);
>@@ -241,7 +242,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 			flags = XE_PDE_64K;
>
> 		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
>-						  XE_PAGE_SIZE, XE_CACHE_WB);
>+						  XE_PAGE_SIZE, pat_index);
> 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
> 			  entry | flags);
> 	}
>@@ -249,7 +250,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	/* Write PDE's that point to our BO. */
> 	for (i = 0; i < num_entries - num_level; i++) {
> 		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
>-						  XE_CACHE_WB);
>+						  pat_index);
>
> 		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
> 			  (i + 1) * 8, u64, entry);
>@@ -261,7 +262,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>
> 		level = 2;
> 		ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8;
>-		flags = vm->pt_ops->pte_encode_addr(xe, 0, XE_CACHE_WB, level,
>+		flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
> 						    true, 0);
>
> 		/*
>@@ -457,6 +458,7 @@ static void emit_pte(struct xe_migrate *m,
> 		     struct xe_res_cursor *cur,
> 		     u32 size, struct xe_bo *bo)
> {
>+	u16 pat_index = m->tile->xe->pat.idx[XE_CACHE_WB];

NIT...probably use tile_to_xe() instead of tile->xe here and elsewhere
just to be consistent?

> 	u32 ptes;
> 	u64 ofs = at_pt * XE_PAGE_SIZE;
> 	u64 cur_ofs;
>@@ -500,7 +502,7 @@ static void emit_pte(struct xe_migrate *m,
> 			}
>
> 			addr = m->q->vm->pt_ops->pte_encode_addr(m->tile->xe,
>-								 addr, XE_CACHE_WB,
>+								 addr, pat_index,
> 								 0, devmem, flags);
> 			bb->cs[bb->len++] = lower_32_bits(addr);
> 			bb->cs[bb->len++] = upper_32_bits(addr);
>@@ -1190,6 +1192,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> 	bool first_munmap_rebind = vma &&
> 		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> 	struct xe_exec_queue *q_override = !q ? m->q : q;
>+	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
>
> 	/* Use the CPU if no in syncs and engine is idle */
> 	if (no_in_syncs(syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
>@@ -1261,7 +1264,7 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
>
> 			xe_tile_assert(tile, pt_bo->size == SZ_4K);
>
>-			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, XE_CACHE_WB, 0);
>+			addr = vm->pt_ops->pte_encode_bo(pt_bo, 0, pat_index, 0);
> 			bb->cs[bb->len++] = lower_32_bits(addr);
> 			bb->cs[bb->len++] = upper_32_bits(addr);
> 		}
>diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
>index 4d4c6a4c305e..92b512641b4a 100644
>--- a/drivers/gpu/drm/xe/xe_pt.c
>+++ b/drivers/gpu/drm/xe/xe_pt.c
>@@ -50,6 +50,7 @@ static struct xe_pt *xe_pt_entry(struct xe_pt_dir *pt_dir, unsigned int index)
> static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
> 			     unsigned int level)
> {
>+	u16 pat_index = tile_to_xe(tile)->pat.idx[XE_CACHE_WB];
> 	u8 id = tile->id;
>
> 	if (!vm->scratch_bo[id])
>@@ -57,9 +58,9 @@ static u64 __xe_pt_empty_pte(struct xe_tile *tile, struct xe_vm *vm,
>
> 	if (level > 0)
> 		return vm->pt_ops->pde_encode_bo(vm->scratch_pt[id][level - 1]->bo,
>-						 0, XE_CACHE_WB);
>+						 0, pat_index);
>
>-	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, XE_CACHE_WB, 0);
>+	return vm->pt_ops->pte_encode_bo(vm->scratch_bo[id], 0, pat_index, 0);
> }
>
> /**
>@@ -510,6 +511,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> {
> 	struct xe_pt_stage_bind_walk *xe_walk =
> 		container_of(walk, typeof(*xe_walk), base);
>+	u16 pat_index = tile_to_xe(xe_walk->tile)->pat.idx[xe_walk->cache];

why not change xe_walk->cache to a xe_walk->pat_index?

Niranjana

> 	struct xe_pt *xe_parent = container_of(parent, typeof(*xe_parent), base);
> 	struct xe_vm *vm = xe_walk->vm;
> 	struct xe_pt *xe_child;
>@@ -526,7 +528,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
>
> 		pte = vm->pt_ops->pte_encode_vma(is_null ? 0 :
> 						 xe_res_dma(curs) + xe_walk->dma_offset,
>-						 xe_walk->vma, xe_walk->cache, level);
>+						 xe_walk->vma, pat_index, level);
> 		pte |= xe_walk->default_pte;
>
> 		/*
>@@ -591,8 +593,7 @@ xe_pt_stage_bind_entry(struct xe_ptw *parent, pgoff_t offset,
> 			xe_child->is_compact = true;
> 		}
>
>-		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0,
>-						xe_walk->cache) | flags;
>+		pte = vm->pt_ops->pde_encode_bo(xe_child->bo, 0, pat_index) | flags;
> 		ret = xe_pt_insert_entry(xe_walk, xe_parent, offset, xe_child,
> 					 pte);
> 	}
>diff --git a/drivers/gpu/drm/xe/xe_pt_types.h b/drivers/gpu/drm/xe/xe_pt_types.h
>index bd6645295fe6..355fa8f014e9 100644
>--- a/drivers/gpu/drm/xe/xe_pt_types.h
>+++ b/drivers/gpu/drm/xe/xe_pt_types.h
>@@ -38,14 +38,14 @@ struct xe_pt {
>
> struct xe_pt_ops {
> 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>-			     enum xe_cache_level cache, u32 pt_level);
>+			     u16 pat_index, u32 pt_level);
> 	u64 (*pte_encode_vma)(u64 pte, struct xe_vma *vma,
>-			      enum xe_cache_level cache, u32 pt_level);
>+			      u16 pat_index, u32 pt_level);
> 	u64 (*pte_encode_addr)(struct xe_device *xe, u64 addr,
>-			       enum xe_cache_level cache,
>+			       u16 pat_index,
> 			       u32 pt_level, bool devmem, u64 flags);
> 	u64 (*pde_encode_bo)(struct xe_bo *bo, u64 bo_offset,
>-			     const enum xe_cache_level cache);
>+			     const u16 pat_index);
> };
>
> struct xe_pt_entry {
>diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>index beffbb1039d3..962bfd2b0179 100644
>--- a/drivers/gpu/drm/xe/xe_vm.c
>+++ b/drivers/gpu/drm/xe/xe_vm.c
>@@ -1191,9 +1191,8 @@ static struct drm_gpuva_fn_ops gpuva_ops = {
> 	.op_alloc = xe_vm_op_alloc,
> };
>
>-static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>+static u64 pde_encode_pat_index(struct xe_device *xe, u16 pat_index)
> {
>-	u32 pat_index = xe->pat.idx[cache];
> 	u64 pte = 0;
>
> 	if (pat_index & BIT(0))
>@@ -1205,9 +1204,8 @@ static u64 pde_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
> 	return pte;
> }
>
>-static u64 pte_encode_cache(struct xe_device *xe, enum xe_cache_level cache)
>+static u64 pte_encode_pat_index(struct xe_device *xe, u16 pat_index)
> {
>-	u32 pat_index = xe->pat.idx[cache];
> 	u64 pte = 0;
>
> 	if (pat_index & BIT(0))
>@@ -1238,27 +1236,27 @@ static u64 pte_encode_ps(u32 pt_level)
> }
>
> static u64 xelp_pde_encode_bo(struct xe_bo *bo, u64 bo_offset,
>-			      const enum xe_cache_level cache)
>+			      const u16 pat_index)
> {
> 	struct xe_device *xe = xe_bo_device(bo);
> 	u64 pde;
>
> 	pde = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pde |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pde |= pde_encode_cache(xe, cache);
>+	pde |= pde_encode_pat_index(xe, pat_index);
>
> 	return pde;
> }
>
> static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
>-			      enum xe_cache_level cache, u32 pt_level)
>+			      u16 pat_index, u32 pt_level)
> {
> 	struct xe_device *xe = xe_bo_device(bo);
> 	u64 pte;
>
> 	pte = xe_bo_addr(bo, bo_offset, XE_PAGE_SIZE);
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_cache(xe, cache);
>+	pte |= pte_encode_pat_index(xe, pat_index);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo))
>@@ -1268,7 +1266,7 @@ static u64 xelp_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
> }
>
> static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
>-			       enum xe_cache_level cache, u32 pt_level)
>+			       u16 pat_index, u32 pt_level)
> {
> 	struct xe_device *xe = xe_vma_vm(vma)->xe;
>
>@@ -1277,7 +1275,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> 	if (likely(!xe_vma_read_only(vma)))
> 		pte |= XE_PAGE_RW;
>
>-	pte |= pte_encode_cache(xe, cache);
>+	pte |= pte_encode_pat_index(xe, pat_index);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (unlikely(xe_vma_is_null(vma)))
>@@ -1287,7 +1285,7 @@ static u64 xelp_pte_encode_vma(u64 pte, struct xe_vma *vma,
> }
>
> static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>-				enum xe_cache_level cache,
>+				u16 pat_index,
> 				u32 pt_level, bool devmem, u64 flags)
> {
> 	u64 pte;
>@@ -1297,7 +1295,7 @@ static u64 xelp_pte_encode_addr(struct xe_device *xe, u64 addr,
>
> 	pte = addr;
> 	pte |= XE_PAGE_PRESENT | XE_PAGE_RW;
>-	pte |= pte_encode_cache(xe, cache);
>+	pte |= pte_encode_pat_index(xe, pat_index);
> 	pte |= pte_encode_ps(pt_level);
>
> 	if (devmem)
>@@ -1701,7 +1699,7 @@ struct xe_vm *xe_vm_lookup(struct xe_file *xef, u32 id)
> u64 xe_vm_pdp4_descriptor(struct xe_vm *vm, struct xe_tile *tile)
> {
> 	return vm->pt_ops->pde_encode_bo(vm->pt_root[tile->id]->bo, 0,
>-					 XE_CACHE_WB);
>+					 tile->xe->pat.idx[XE_CACHE_WB]);
> }
>
> static struct dma_fence *
>-- 
>2.41.0
>
