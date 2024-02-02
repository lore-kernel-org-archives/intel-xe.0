Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BB6C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 17:54:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC9BF10EE7C;
	Fri,  2 Feb 2024 17:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SltYPkua";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA50610EFF0
 for <intel-xe@lists.freedesktop.org>; Fri,  2 Feb 2024 17:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706896494; x=1738432494;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=lWWyG38CJCU/iTstNIFJS9xRsHG/fPbPpufHeTfx7nc=;
 b=SltYPkuad+BdNAZ/Rt7qjVV4qlt713mb6A+YnQxcQ7pfzPZvGMxSJVc8
 bXzIXLuAWjsSu6nw4lMhCOUQdWW/5kbhqPuetS4UCDiCgP+WdXw/kjVPi
 XaTy8fdZZrwdMCPcoXrzHjuLO1EpsLUPh/9V66uLummppAawJjOdsoJ3X
 epg04PUFblW0EoD2FBGNrA9tUjU9ttVk07wwwNdcap72iJ6/zWZRGl9Ck
 NzfrmY7FxivdpxmzRVfN2NyOyMCg3FdG+BLMSUXmVGnbSxk8feuYVVxkk
 VcuIlMcMqT/YNguHcf3VtlySqtwV5/gLHcEEwVQLLZaq3KA6G4ZUTiGdY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="435347370"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; d="scan'208";a="435347370"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2024 09:54:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="137336"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Feb 2024 09:54:51 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 09:54:50 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 2 Feb 2024 09:54:49 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 2 Feb 2024 09:54:49 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 2 Feb 2024 09:54:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEbz/ZcA3Yu8VX4CXWPVnAxBJi7eeAeNj/F8apV7Au0uin+R8aG+UYWjJ70fmKI3Z3t35HHsIArjlXqF2kk9fnLKkrBiK449ats9qTFLhxUjUFYVpoTiG8oMOFh5QQa7kNZ+wV2RWjK4ZGMWK7U+XReDFAdLMnTi6AftuFoyyJZ8+kTUu8ZWZpO6NSwcOc6YE/i06BLBH40SJCOE0nijduuWrOg7ENghro7CQWSRS3FU/7izkhtlE6JVrs4ZP6srYCNdFFKHtQf417PYe/TSpLeKLqBtajnnevOIJWM0sb2EXcF2kWoaD65FlpVvBOtrTAxyNkWIR/xcyYljks2QoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GaskoHtT5YdC6XOO6UuOR+ylU1BZdcDI0IpX7MpmXBs=;
 b=ON2U5ste4xZMMDdJS3PKVXPt0k2GyQIEyxlnzq1fBPbkjwe3yvhWdA7UeTGxIg7crwPpOnyQfD9N/mkFe0AWW/Mz+Lc9D8ZV0iNMOcJvB5muBIknkcSyFh7ze5YXwARczgl+WOHPWTqX/46IR5xqtdbr5jGEw3oYrS1VmIwsCFz/U0ed3m7tBQI6NhIEa/nBrSw7mgzf9CjpmKjiJ2BU+n9IJQ/q6k8rU/AX5pYGAH3MLMYDPCGgfJmeJB+ipVe72j8TMWyB/OjOiGAtxl3ssWoIrhJ5PZwkqELqFc8uXQFLonRbN28s6qlO08QaxA1MLpTDiol7ZHsElauuF4FhEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4647.namprd11.prod.outlook.com (2603:10b6:208:262::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.30; Fri, 2 Feb
 2024 17:54:42 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::b9a8:8221:e4a1:4cda%4]) with mapi id 15.20.7228.040; Fri, 2 Feb 2024
 17:54:42 +0000
Date: Fri, 2 Feb 2024 17:53:35 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Map both mem.kernel_bb_pool and usm.bb_pool
Message-ID: <Zb0sHwkNiM4aXl9N@DUT025-TGLU>
References: <20240202033440.2351862-1-matthew.brost@intel.com>
 <d7537d1996d822493036d10a8be4d90a7bb4244f.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7537d1996d822493036d10a8be4d90a7bb4244f.camel@intel.com>
X-ClientProxiedBy: SJ0PR13CA0086.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::31) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4647:EE_
X-MS-Office365-Filtering-Correlation-Id: 7867a90a-2caa-4aaa-6810-08dc24180842
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: owjTACA5O8YvaBihr6JaI5j+ofDcCeRYEghXsrEgdSzMgR2lflL34Xue0+oKc5RhzkJyxxs+sht5O6tyl8KvE/aVuDUOe+7SDQyducJIx8sJsD0r6wmuYMGws3wuocaZWLGYc/dl1YNGePlskllBefg3WCCW9/ew3Jkidoax3J46KSDr7Dz+chZVjj90mh5y1CrrLbewwt0HkarcadMcbpu3EBLKIo8e6gi92E1FwMapyDlQYJmoFQ59xuol+4qsp7z9G1H8yr5mLf/GFuh9yMJ7U1C3tryTIgxXYqxPpQAPoTMtZZREwPucwxYGR1wxg2gFy/Z3v0FZkMd+UIhQolWwJ7xSkYbFYv0Fm7QvW0DD0tpxR8TyuWvihpdUTjU86skNFgCJz9cqQ8OpLiZ/eF9IyC7MnqwvFBkNqmhTv9+fqDs6JZN9V0PGs7Yt8JMi6rvp38MhcfKwQIKpAJ2sGGqLlUyWecC2RDhZ8SoGDEc2BnKn2UKeS/Llmzvjn7fEwyIVq0CN2XKUqRsmdAFeJVrgRZnEVCnfquLG1q1brnocBO94B+2rnHP4hCEYOtu/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(136003)(396003)(376002)(366004)(230922051799003)(451199024)(1800799012)(186009)(64100799003)(38100700002)(82960400001)(6506007)(83380400001)(6512007)(8676002)(6862004)(9686003)(316002)(44832011)(86362001)(5660300002)(6636002)(8936002)(4326008)(2906002)(6666004)(66476007)(66556008)(66946007)(6486002)(26005)(478600001)(41300700001)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?MS3nQPO1x3hhyo8w0J2GdFyrv8pHK75LDsXLcJ4GvbZDSZBtRLea7H8n4J?=
 =?iso-8859-1?Q?1q2QDiSH0HW5XGypYivF12o3OsZJqxyDwuP2Oug9pgkSyHc0cKfHuszWAC?=
 =?iso-8859-1?Q?upTm2TTnAdqjUufvUPqdnnu6dSiGexFm46w8pEZdJlNC4I4vggdHcRueD0?=
 =?iso-8859-1?Q?hBlPmN2R3N1rZuOGgrDIwG0mDXadeahaZKbQ/CGjnuxpdnz+2WEI/bcFLO?=
 =?iso-8859-1?Q?qoZPAxsP6n5mYddZAM96lcUKY8vV5AWIaFQazju6mb92YK/tp5nlQJIvgP?=
 =?iso-8859-1?Q?UZbvEAJ0CQoQXZIXd6GiAWfz4Y9Q5Ner7DopG6RgGYXGjAma++oAjMO2w2?=
 =?iso-8859-1?Q?ryoH+NA+i7HJH2SdLndZVHVfpK/utwxCqG2B+2DJ6DQgKvTAQAp7/G9akF?=
 =?iso-8859-1?Q?C1Mn4OOuCGE28tAG1sbMPN5EypKRoSbkE7vDVmMLP7HZIFBezk5Ie3L/c+?=
 =?iso-8859-1?Q?DM/Brm0CBNY8spvTzb2Afx2aceDBSbgHq0ph0bXSLd1z0fgsD/LJ9PW89Z?=
 =?iso-8859-1?Q?cxrZ5vJpHOd0gccl60V6wCvPEVRDrVNbi5Umt9EtIcbp42hXtD4MoJ2uiK?=
 =?iso-8859-1?Q?rgiBXFAF/O8ncZvSrp0PauoLSxHp7KQcnDG1KXYVrQiJCk/Xln7BYAOqQk?=
 =?iso-8859-1?Q?ccthkJQ7iuu/Lt6Wrjp53aCg7AjYV9HTbIxyXqbpwf2AVYqE6k/vZF1yXJ?=
 =?iso-8859-1?Q?56X6FcQtsQzjgrqWXkOu8dCOWoPKQf+PJkXQpE/IIvO/jueAASVbgdgJvB?=
 =?iso-8859-1?Q?uusa4AIcJ602pyh984I9Lfi0/jc074vuOAdX+vxXS0J+/S2L1G2rAPXFxI?=
 =?iso-8859-1?Q?ZDDyCNDLH19Ne1PLujVnKI0VZ/5VsgLB4KrbhjjwVBrFtkyoPWSw5izcQl?=
 =?iso-8859-1?Q?aAEyxVbVrJwcuIOVXDm0brzJuoQlJcImQI6uT4ETPHtpbq17qKSPQyF8uk?=
 =?iso-8859-1?Q?v0t+EDYn7GPgcXARRBp1L4ikZkkbR8c90dcx5unmYzJ1NqcbJEdAqk7jIY?=
 =?iso-8859-1?Q?HwRFODx1OwEY/TUJgsMAdCWKNESF3fRcli6nuYQw/s+Vl5ziSBFxxHsy8P?=
 =?iso-8859-1?Q?gXQOVLo8lfDE5cE0U25m3mK9RD1vzrikvzIoorc5kqb27ICzEesDVdpTon?=
 =?iso-8859-1?Q?Qf5Hm5FI0ALUL3p9JhWD3TEaf1ZqY3/PJbwghlkfrEpXEA41ZWs52w8i9R?=
 =?iso-8859-1?Q?7As9PDlEY9RFKDiTFrZ1WQABytdxcQuQ5DmKo/ATY7Ao6FHd4YFcPdqj7a?=
 =?iso-8859-1?Q?1uphbZT+iNiCw6RTbLnQEqW96PLCNn1vR/AsYtgqwJoGsmy2KFAioBOO8M?=
 =?iso-8859-1?Q?/fyGO3NsqH9kYdT3k1ZTW/GMYypfP8kxcG/JpEB7JcNW5hQwePIhf6JqDi?=
 =?iso-8859-1?Q?tlMiGUBRjUqr2QH8ETM0rtjq0kuxcT9Cq+kCZdJBwt0jqCSNH53j8rFE1b?=
 =?iso-8859-1?Q?oTfbg5ih3Ni9evczCBuRDdKUu3rVXWkS1zQhtxdyFhqL+Wt1pPL/4j9Pz0?=
 =?iso-8859-1?Q?hOSVo72ZgO16UCACDWdQil1+gqcsvHa0lu+WhcrIBPskFagVt9Zo3ba3TJ?=
 =?iso-8859-1?Q?JwFX6idenumYouutHOW9SQt2DhxczbiSv7iXQJFBKGSFEFNU8ad91Jm6Za?=
 =?iso-8859-1?Q?KzmIqKXnRDS60z3F9WpkE9+rAxGbyXn/tqRu+A8MAMjRS+/kul55TzhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7867a90a-2caa-4aaa-6810-08dc24180842
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 17:54:41.7479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1PsLPeGg1pxdIWp0in7gH4pH2YTLezDkhXwVYeH3zzH+wkdeeyQcz9pmzlazlsTxQhYxFJ6wIrYZpetHJaBuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4647
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

On Fri, Feb 02, 2024 at 09:58:32AM -0700, Summers, Stuart wrote:
> On Thu, 2024-02-01 at 19:34 -0800, Matthew Brost wrote:
> > For integrated devices we need to map both mem.kernel_bb_pool and
> > usm.bb_pool to be able to run batches from both pools.
> > 
> > Fixes: a682b6a42d4d ("drm/xe: Support device page faults on
> > integrated platforms")
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c      |  5 ++++-
> >  drivers/gpu/drm/xe/xe_migrate.c | 23 ++++++++++++++++++-----
> >  2 files changed, 22 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 675a2927a19e..295cba1c688f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -456,7 +456,10 @@ static int all_fw_domain_init(struct xe_gt *gt)
> >                  * USM has its only SA pool to non-block behind user
> > operations
> >                  */
> >                 if (gt_to_xe(gt)->info.has_usm) {
> > -                       gt->usm.bb_pool =
> > xe_sa_bo_manager_init(gt_to_tile(gt), SZ_1M, 16);
> > +                       struct xe_device *xe = gt_to_xe(gt);
> > +
> > +                       gt->usm.bb_pool =
> > xe_sa_bo_manager_init(gt_to_tile(gt),
> > +                                                               IS_DG
> > FX(xe) ? SZ_1M : SZ_512, 16);
> 
> Would it be better to use a modparam for this size/offset? What if we
> decide to change it at some point?
> 

That doesn't seem necessary.

> Also is this supposed to be SZ_512K?
> 

Yep, good catch. Didn't have a LNL to test this.

> >                         if (IS_ERR(gt->usm.bb_pool)) {
> >                                 err = PTR_ERR(gt->usm.bb_pool);
> >                                 goto err_force_wake;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 9ab004871f9a..7465f8d14028 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -180,11 +180,6 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >         if (!IS_DGFX(xe)) {
> >                 /* Write out batch too */
> >                 m->batch_base_ofs = NUM_PT_SLOTS * XE_PAGE_SIZE;
> > -               if (xe->info.has_usm) {
> > -                       batch = tile->primary_gt->usm.bb_pool->bo;
> > -                       m->usm_batch_base_ofs = m->batch_base_ofs;
> > -               }
> > -
> >                 for (i = 0; i < batch->size;
> >                      i += vm->flags & XE_VM_FLAG_64K ?
> > XE_64K_PAGE_SIZE :
> >                      XE_PAGE_SIZE) {
> > @@ -195,6 +190,24 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >                                   entry);
> >                         level++;
> >                 }
> > +               if (xe->info.has_usm) {
> > +                       xe_tile_assert(tile, batch->size == SZ_1M);
> > +
> > +                       batch = tile->primary_gt->usm.bb_pool->bo;
> > +                       m->usm_batch_base_ofs = m->batch_base_ofs +
> > SZ_1M;
> 
> Same here.
>

Yep.
 
> > +                       xe_tile_assert(tile, batch->size == SZ_512);
> 
> And here.
> 

Yep.

Matt

> Thanks,
> Stuart
> 
> > +
> > +                       for (i = 0; i < batch->size;
> > +                            i += vm->flags & XE_VM_FLAG_64K ?
> > XE_64K_PAGE_SIZE :
> > +                            XE_PAGE_SIZE) {
> > +                               entry = vm->pt_ops-
> > >pte_encode_bo(batch, i,
> > +                                                                
> > pat_index, 0);
> > +
> > +                               xe_map_wr(xe, &bo->vmap, map_ofs +
> > level * 8, u64,
> > +                                         entry);
> > +                               level++;
> > +                       }
> > +               }
> >         } else {
> >                 u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
> >  
> 
