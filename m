Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116D8E8FDBF
	for <intel-xe@archiver.kernel.org>; Tue,  3 Oct 2023 23:12:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347910E322;
	Tue,  3 Oct 2023 23:12:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 224BF10E322
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Oct 2023 23:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696374759; x=1727910759;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Ch3PCvbVwJtCxBCGs21JQFNRNFV6wl+EaOVjYh1MnE4=;
 b=kq5E7pD1BGpXvM1i23S+vKTSW+uKTBtQX55qa6JoLjzoJ0BkJuiOl08z
 sf9VXr1m/GL8/dNX1gBUIyWiMfJlR/DBcV2SmtIyv/psZk8JpSaDY7dXu
 qa3q4ZEv8r8Yj6Ipr/uLAhhiHhSJRa+5YNA4S3lDHeqneGN+SW7hLz3aA
 EZc5SDPkKN7SsZBI/2TYGDRhGQsE03Z83ZNaOGmkQxue9Hnof/LRHqnD1
 QRllBmrNtaFeY+70vEfcBr9NcxNIaQjq+oTIQ0ko52CEK9BmA3VdUGrXU
 Z4N/+TDkZMlVIxZf86s5g/kJHYyEhVJdVL/IVyr45fvyG/EDXRS78e3Or Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="373338382"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="373338382"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2023 16:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10852"; a="744667684"
X-IronPort-AV: E=Sophos;i="6.03,198,1694761200"; d="scan'208";a="744667684"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Oct 2023 16:12:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 16:12:27 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 3 Oct 2023 16:12:26 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 3 Oct 2023 16:12:26 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 3 Oct 2023 16:12:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTHt5CDJReQJsljFFMm+OMIFx/EZBKcCEG5oed2Mst4ACpujM7pY10b81D8+J9ouLA4FyjoIeObS5Irw7RE3JEPR4B1lqoubrYPI7gokr+T1wE3nX4N++IbXs1N0oazHTk8KR5Q82R5Yef/dtEibkjeed3gfO7XNDd6HfSt3z4wgo4vvTZP54rwy08vLTzjUwghrb19mdnMERQ5ZoFRurXKWhE8untbSnhYA2H8CZReTpeu1RcuJtLbyrpcl6aJ+x/TNQJ2hHe3Zzg8t0vgi/kxg4+hyidWNolc302cDV81BzajLl1KSrJcnBviqc+nVGh1aVyLSVlznibBKs9GD1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQANfjXihg0uFOgBl1rQ2zZrwq21CWA/d+0CYLdZ7H0=;
 b=b+6f0LoR6j8dK1frbtspOjdZ5hIuBmbSVXXWsr99w/LUitvDp6T4hG1J6l6Gv1t9QUsND+D5OoN5aZr/U+9m1yiE48e1Hl48Ho7lZ5g7+j0oBNX9oxLl4zU+47mRt2dFiNjkiXLeBr9wQI3R91PjHiqw2quRd6RxQVI93ZsrFi7Sq8IvpKViFR3qKs/KLslnuTJO7mNFiYmbC7pQeFtPoSGFIw49zPT4EGKbx/Vj+RIyFQaeKEbVq9/7IdsMNW3Laep8uzaI+GWV25C7AwRxH42beYGx89Lx/SnI8AVmCg/T4soGtuKRBz2WChVUWj3+3o1PIpL1XHFnCn9qx1W+lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by PH0PR11MB5096.namprd11.prod.outlook.com (2603:10b6:510:3c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Tue, 3 Oct
 2023 23:12:23 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Tue, 3 Oct 2023
 23:12:23 +0000
Date: Tue, 3 Oct 2023 16:12:16 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: David Kershner <david.kershner@intel.com>
Message-ID: <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-2-david.kershner@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231003222145.4090918-2-david.kershner@intel.com>
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|PH0PR11MB5096:EE_
X-MS-Office365-Filtering-Correlation-Id: 687cec2e-440f-4af7-dbef-08dbc4663369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DZMsy976a0UPTEO91asMDcewNkW62gihjmRjXXEIL0aexYOMm5tQXoukW9iB7JjWU9gTUbi8le1xjqvi1eg27hI7PUHi4wq9Tn3XtU7J2lgq+nCf2KGBgYia14vEHWH2Lf7zmDk99/IicLZgBTu/NsEh9quawCAxohSIpazw+rOYa8KMYrjJ2m6Y+Xv+LaagnfWtgLeLhEFzxleJaWg3fSG3xES8/sZbvb9r35Gx0U/5JtRtFzai+qh9JiKPrsJelBFwXe1b2vSH398J2X5BuT/v/dXp0chKy4JhgqvZYjN28o/hO9lrA+yxEsTJPnaITU7hxXEx16WfH2o0FyPrxu1YMIctdvzWmfYDgQqE5pKaNe2Oq9/L+LKWwlp3dpGm98pheoeFxI8RD6DvRdl/mgj4SX+wX8yJ6hIie1RCyRcXaEyAyBCnQIBmqHNFb1dbNyM70ne9ulsPevLt1hqFwZHYS/3FWeE2o7qUFh9sIUBgAVe+99m5faHIPOQ+Iegbz2biktt3zsRhdzKk+bHzdD+KFkRWdG1rakOYVzoS54RyFrbVsRnKiFm6q90mY5EZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(346002)(366004)(376002)(136003)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(26005)(6666004)(9686003)(6512007)(6486002)(6506007)(4326008)(44832011)(107886003)(478600001)(6862004)(2906002)(8936002)(41300700001)(8676002)(33716001)(66556008)(66946007)(66476007)(6636002)(83380400001)(5660300002)(316002)(86362001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F/IPgF34V3sLfjM4FZnlBipomBSjCBtB7quVm9Ak+ntJQwGnDQGr0ZG6GBgd?=
 =?us-ascii?Q?9DFJikEGtABkglBeAtcyJ+sIxX2ZkVa4gncv7HUZLXOSTsKHTsHa+jYk/E3w?=
 =?us-ascii?Q?uLqCMmOrEjzvudTGq2uX6ij14iOzuwlrXaHnYQObqxAJIVMfHSFTn8zC6sXG?=
 =?us-ascii?Q?iCf4CC+DGsLHAiX+n+o8Rjeazxi0GneVstUeqCECVOfeieQS63AVwT9l8sPE?=
 =?us-ascii?Q?H5ChYj3mXe4EwanNJsSESz1gCQJaK0dt7f8iWoq3W0ebuUBQgjGxc3kBvr0B?=
 =?us-ascii?Q?Sbly9SiMi4bjOUPnjiJvb6glfDJKPpE1dchNQNnMP1Jsw7kLzzxI4ufMu4ji?=
 =?us-ascii?Q?OTyR7Fn61pzIIUVQXW1eifrPu/crczCS52bho+NgcIeYBCit3pztDTgCG3yF?=
 =?us-ascii?Q?kSb/Qh3/6B9VcXp1k/5c4QqJyiF8OKuYKkwsFcat/g8Mb17fiMixwixasOS9?=
 =?us-ascii?Q?1ynDlFiDot0+tVGf5J6oB1WkX3f10bqMIdDQLhYJuir+M8XqsdLoqcBW9sqr?=
 =?us-ascii?Q?ZE13GPQkDjUI37Bl/nn+cFvWGgvH7uSl/413uHOG0G2ZxrtBQMlImTj4qT5j?=
 =?us-ascii?Q?3cZkn6V9oruvVcsXsMwZGfiFAVFTwXeUf6Cj+k2WeoOhgezWtN5RdwOvPYwG?=
 =?us-ascii?Q?qJ3mMOfBYDdoNuSV0aS4L8x4VkF9q/FnVegyW4n37dAem7lyJEC0oTXDeWvX?=
 =?us-ascii?Q?Xk+FErVcj/MgH+jIg6R+2RqcyjgZh4pmC7WcupgBrCE+U9zeWY2Z/dZqpczL?=
 =?us-ascii?Q?fRxPTzLph/MXkuYhz7z3467hqxkUXQHlKw5bqBNIiAev6kSIRUf0wo0V13c/?=
 =?us-ascii?Q?R1o/PEJWlHm4/P5EdJzPNf0lP5b1JT6jEzYlvZOj5yENjhCcrvNK1qYqTkZe?=
 =?us-ascii?Q?mb5tM7KMGq5A4u4Hu0iZg0DU9L2OYqWBVQrm7wMHgeAok9+/5JTTcVthDDtL?=
 =?us-ascii?Q?ZKD9DWuk/IB3q5TdPjhg/dv+X/OzAa6ErbzpVq+zBtK9n5MsPenukVMkHeM1?=
 =?us-ascii?Q?3A8DlB3VMuqLCBVAbCor7AEJem3QsJ26zTwB1VX9uhqBJ44DunnJTJxal4Ot?=
 =?us-ascii?Q?5qasLB/5AAQGgSyLH3EC7mtV/TGLkaKKKcJ1V+wPHO4/4cmogO/vXcfx38CJ?=
 =?us-ascii?Q?rl7tTDBcC+dCZ7E2fuRQnrBZFFZBZXx5PQEaLGREV9cBzpvonNwIyyTLSW08?=
 =?us-ascii?Q?g6is+mdSnibIuKGCWRCW73ltFtWOaefGs10q+E1KJZ9JdCfvmfebCqj8QjOC?=
 =?us-ascii?Q?WbxCCFl9O1xOKFgwz7GS61riDJwKT8UWYJ1ZoyfVYq1daYZ2L7fzS8LiOLC/?=
 =?us-ascii?Q?BfVPIRcP5jmDCq85GhuQVct+HJSSd4/WjDeDi9BEqvyN0hEj1G8x3f+42Dm1?=
 =?us-ascii?Q?1oYozTdOj3tFljw6l/JaDNn0UvDKZNn3/XBBhhK6ZJBP1I7Ig0id9ucCkrL3?=
 =?us-ascii?Q?r6F3KfK8SipoQ+9G6Otsmw3tNMogWYY/dPfbl6PJThY+PYXAlymnwFUw6fPM?=
 =?us-ascii?Q?+y5vTqTFwT27BGzb35d5H4z5im2Lapbr8h47x/siVkN57zdYj1yqFk6W8mHF?=
 =?us-ascii?Q?kqCfULT2cDgTpHrkS3fmY+fvPnj37FMS/oIQ9PPCDqq5lP92y8BNgzvLG4pv?=
 =?us-ascii?Q?ocPfnWcmiHW+TsHKKMEOGl8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 687cec2e-440f-4af7-dbef-08dbc4663369
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2023 23:12:23.2441 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WKYc5fUwW1kPLx5hGOy+ucq0seK5t8IbJWjrbVgwfj9AgMJLKp2LdSh7waGC3tfOnr4hUyUo+nI33h8FYGyjNS+rFpZKT1942wQlh1T25qvcxC1AG3b9+VulFTwv8g/d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5096
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset
 for page table entries.
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
Cc: john.fleck@intel.com, stuart.summers@intel.com, matthew.d.roper@intel.com,
 intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Oct 03, 2023 at 06:21:44PM -0400, David Kershner wrote:
>Device Physical Address (DPA) is the starting offset device memory.
>
>Update xe_migrate identity map base PTE entries to start at dpa_base
>instead of 0.
>
>The VM offset value should be 0 relative instead of DPA relative.
>

Overall looks good to me. Some minor comments.

>Signed-off-by: David Kershner <david.kershner@intel.com>
>---
> drivers/gpu/drm/xe/tests/xe_migrate.c | 37 ++++++++++++++++++++++++---
> drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
> 2 files changed, 47 insertions(+), 12 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c b/drivers/gpu/drm/xe/tests/xe_migrate.c
>index 6906ff9d9c31..75b06f0bd755 100644
>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops sanity_ops = {
> 		} } while (0)
>
> static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>-		      struct kunit *test)
>+		      struct kunit *test, u32 region)
> {
> 	struct xe_device *xe = tile_to_xe(m->tile);
> 	u64 retval, expected = 0;
>@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
> 						   bo->size,
> 						   ttm_bo_type_kernel,
>-						   XE_BO_CREATE_SYSTEM_BIT |
>+						   region |
> 						   XE_BO_NEEDS_CPU_ACCESS);

In this function, we should now change the bo name from 'sysmem' to 'remote'
or something similar.

> 	if (IS_ERR(sysmem)) {
> 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>@@ -187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
> 	xe_bo_put(sysmem);
> }
>
>+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
>+			     struct kunit *test)
>+{
>+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
>+}
>+
>+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
>+			   struct kunit *test)
>+{
>+	u32 region;
>+
>+	if (bo->ttm.resource->mem_type == XE_PL_SYSTEM)
>+		return;
>+
>+	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
>+		region = XE_BO_CREATE_VRAM1_BIT;
>+	else
>+		region = XE_BO_CREATE_VRAM0_BIT;
>+	test_copy(m, bo, test, region);
>+}
>+
> static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
> 			   struct kunit *test, bool force_gpu)
> {
>@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	check(retval, expected, "Command clear small last value", test);
>
> 	kunit_info(test, "Copying small buffer object to system\n");
>-	test_copy(m, tiny, test);
>+	test_copy_sysmem(m, tiny, test);
>+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
>+		kunit_info(test, "Copying small buffer object to other vram\n");
>+		test_copy_vram(m, tiny, test);
>+	}

Probably we don't need IS_DGFX() check. tile_count check should be good enough?

>
> 	/* Clear a big bo */
> 	kunit_info(test, "Clearing big buffer object\n");
>@@ -366,7 +391,11 @@ static void xe_migrate_sanity_test(struct xe_migrate *m, struct kunit *test)
> 	check(retval, expected, "Command clear big last value", test);
>
> 	kunit_info(test, "Copying big buffer object to system\n");
>-	test_copy(m, big, test);
>+	test_copy_sysmem(m, big, test);
>+	if (xe->info.tile_count > 1) {
>+		kunit_info(test, "Copying big buffer object to opposite vram\n");

s/opposite/other/

>+		test_copy_vram(m, big, test);
>+	}
>
> 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
> 	test_pt_update(m, pt, test, false);

This test update should be in a separate patch.

>diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>index 15f091a7bba3..42942aeef595 100644
>--- a/drivers/gpu/drm/xe/xe_migrate.c
>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
> }
>
>-static u64 xe_migrate_vram_ofs(u64 addr)
>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
> {

The convention is to have 'xe' as first argument, so it is better to
follow that.

>+	/* Remove the DPA to get a correct offset into identity table for the
>+	 * migrate offset
>+	 */

Comment format followed elsewhere is,
/*
  * comments line1
  * comments line2
  */

Better to follow that.

>+	addr -= xe->mem.vram.dpa_base;

Should never happen, but probably a good idea to add an assert
that addr > dpa_base? Otherwise, we will endup with hard to debug issues.

> 	return addr + (256ULL << xe_pt_shift(2));
> }
>
>@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct xe_migrate *m, struct xe_vm *vm)
>
> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, xe);
>
> 	return 0;
> }
>@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 	} else {
> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>
>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
>
> 		if (xe->info.supports_usm) {
> 			batch = tile->primary_gt->usm.bb_pool->bo;
> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>-			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>+			m->usm_batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
> 		}
> 	}
>
>@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> 		 * Use 1GB pages, it shouldn't matter the physical amount of
> 		 * vram is less, when we don't access it.
> 		 */
>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos += SZ_1G, ofs += 8)
>+		for (pos = xe->mem.vram.dpa_base;
>+		     pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
>+		     pos += SZ_1G, ofs += 8)
> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> 	}
>
>@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
> 		cmds += cmd_size;
> 	} else {
> 		/* Offset into identity map. */
>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>-					      vram_region_gpu_offset(res));
>+		*L0_ofs = xe_migrate_vram_ofs(cur->start + vram_region_gpu_offset(res),
>+					      tile_to_xe(m->tile));
> 		cmds += cmd_size;
> 	}
>
>@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
> 	if (!ppgtt_ofs) {
> 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo, 0,
>-							   XE_PAGE_SIZE));
>+							   XE_PAGE_SIZE), tile_to_xe(tile));
> 	}
>
> 	do {
>-- 
>2.35.1
>
