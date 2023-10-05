Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519DBE936EC
	for <intel-xe@archiver.kernel.org>; Thu,  5 Oct 2023 00:17:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1892D10E14B;
	Thu,  5 Oct 2023 00:17:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84EAD10E14B
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Oct 2023 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696465053; x=1728001053;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=WB8PuqlysjnuhtbxO/dSGdofcKVkh0xpbudnt1FBnR8=;
 b=DT1wH8qqoBhyYgD8CCkAm0ToGrFuyBgAPZEilVOlMjpB9nPbLVtl57k7
 c3EXHe2VtfDV+GnVKbfY1mhO0t4e1d0A1RYSxZ6cSKNM1ihTLQdtXYBg2
 zeZaw08qdsLG6M7AJ2i5rUKcN1/SJyxe34ZTmLh1jhUDD7SNquQcXYPj9
 aDWA+l9CjYwMZxOwMGH9DRMg2xcfIXuOa3Kwmkto6R+eSzApDrAjKEgFi
 sKHps/ldnGdakC0il8IUlQ1kt5z8QihbAIbmTZNqWrEi6MHRvQcl0+LUH
 rE4jWSthz7VqeKh+TlxQxKUZ1B/YJ1fzbrMxCE6uri2uzZNa2tlvOnmw2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="386181792"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="386181792"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2023 17:17:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="821893463"
X-IronPort-AV: E=Sophos;i="6.03,201,1694761200"; d="scan'208";a="821893463"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Oct 2023 17:17:32 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 17:17:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 4 Oct 2023 17:17:32 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.46) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 4 Oct 2023 17:16:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hOQMcRtGtXRsligp39VAMXU3gpW50cmEAVMRh6cirViOhOIMoEPNfjRfvzfrCokD7RmZVTdrKzUTZi7UZHi68YyX4RxBXhbEPlcKE7MfHT859S7uylUGvZk2br6pLvLEqahTcaTR4fOaJAbXrUC9waPcsm8Np6isP+AZE76cB2HR31Cfydew62/NHkbi3VRlt85vh8zteb7bE2vGlouHW5uxqMacEXW9SalcJ2+phSbQ5ZwEr7bjY6UJ8o3jBNY+E6SCf3W1e4Q6yGP8uOtNdt2IgHrkM43i5vJuTG1oQd1DtqdY37+xVjqIOmNJjBkxRqcTVTc/NqBn0zBFStzJfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RprCnuK5bb7JazyvaF4+RMiFip6U1wpb4wyneAjdVWA=;
 b=LKAyvlmwiBlDIE+1fUsNEv39kjqOeolqEUXHjuf5ULCjnRLmuNImmKkm982kC+ZpxiY0wUXLtRmB1GC2TFSruzq/bMe6s5DoOUTFDUjt1VyoOdSRJyQu6YhW5YMeM7OfUzXX+Wc1LaVJPaHg6PoFpb60+cc5aLnF/6N44gN1PjtlFiiAgxZb4cignjgUCLQnGROhAssRmjXQ+ukeWHc+fKCLLzAQjmvhO0/qXGIfYxhqsbYA+BhEcS25NA7PFinHGzkD8Z7WlTJIZ4xKsbjx9Mvs5khmR++EYq+5HrK04qFaua7jbxMEUyT6vID3RXpjakkX9XIIE0oetyk/3+zevw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.29; Thu, 5 Oct
 2023 00:16:35 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::4182:281:404a:1042%3]) with mapi id 15.20.6838.033; Thu, 5 Oct 2023
 00:16:35 +0000
Date: Wed, 4 Oct 2023 17:16:11 -0700
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Message-ID: <ZR4AS+gpJei7laWo@nvishwa1-DESK>
References: <20231003222145.4090918-1-david.kershner@intel.com>
 <20231003222145.4090918-2-david.kershner@intel.com>
 <ZRyf0DHi/DXWAoHP@nvishwa1-DESK>
 <IA1PR11MB6418FDDD2C32B80A3E3B1E2DC1CBA@IA1PR11MB6418.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA1PR11MB6418FDDD2C32B80A3E3B1E2DC1CBA@IA1PR11MB6418.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4P223CA0014.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::19) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: add2d3d9-1e08-4bf3-6f1b-08dbc5384a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qWMyEYC3eVCHNkkSAx07vFIEXFG0giCyHHOKrJrzEsYNCaTLPg363pwh1z6HrmNWO8pkKN+Hj4w+JuDwuco2v0bfUvavsXO33zf6O+FcSsE8uWxiydhy1fXfRym1i1j7s64rJUKJ5KDS4mUztyjzHetKsWRx4WBJbirxu1I/LILZwXmr/EWCLCjJ69h+lJY3G363eWMFR0Re5bLh5hVuBUPDxnT1k7SI7sI+B2huc4slJ2gUQ7pWFGibWNNJ+MhQpF0CPWoh2kBZ6sGNCy/eef4LDmagVdXXPiUg8DIOluKOyHI185aSesHssARJepBP0wq8vdn6wKRFCPF+tHLWsOivUDG77z68yUPFYNoacU9PptDj3coqUXLH+BMt5+rxiFRYD5Y3b9AXCjpjYWbuzC6eANz4ebS/McVVQuL0yqQgJ9Qqtw3sqx2Jigx9tdHLfGkM2r/kGZZQG9aNhGkooMCjrt1NFT1vQIuMtzrDRBSRBymASOMB8g9+utwMzwfvMythtMbvXowwWUbtoXLG711+ZgIxiZK5VDkebf23F3f5tPJ99ilL/5pFtX38XEyBgvEprK0NLFv4OkpcrJgT55RLyGpb+y9FQ6Noqqtfe/Y=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(39860400002)(376002)(346002)(366004)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(66476007)(54906003)(66556008)(66946007)(6636002)(316002)(41300700001)(107886003)(6512007)(9686003)(26005)(6666004)(6506007)(478600001)(6486002)(38100700002)(82960400001)(86362001)(83380400001)(33716001)(44832011)(2906002)(4326008)(6862004)(8936002)(8676002)(5660300002)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mHDzHlc3nyHA4h8toLjlWVm1rpijoYJcB2RZNUKLiQbeYeKkzWFAkBxPijdr?=
 =?us-ascii?Q?kknSuzREERTcgKmfCi0cjb+jtBSOqsbKO9k0LRP2lVG/TyHCxXISHAo4g+Wp?=
 =?us-ascii?Q?lxX0Mdhbc8FwNIJgcSHrXv4XW9LFYieLQTSd1OF6YmppdCd5+v/hoFflEW0A?=
 =?us-ascii?Q?Zbdh9LlNjIKrPGrVGZArj9kHi5oOkWgfelgJQYER4TxK/7DuCunjQLkn8waZ?=
 =?us-ascii?Q?CUw5aBRwoZ59FXSgOf8Niw4Y4wCZhSWTbKdeqWPBbCUEjEQWq/A9oK8UwcAU?=
 =?us-ascii?Q?HBG4vORGJc8Wh71ZLRav4Fp87/ljNFE/RMXOKkb7RNlkqxejy76hMfn4UFvs?=
 =?us-ascii?Q?sV4PiXqcSryF6/hUX19+kE9SiTXKGdv66kZAW1KuVDWe4g94Vn9l8QGrZ4jL?=
 =?us-ascii?Q?nCjcNjEGkPuwioSNrzs6iOfrp+iiu27ujnWfrTQkKbTqEfgnI9Ce80kzA2Xh?=
 =?us-ascii?Q?vBwwocbEUesy8RyQW7IWUk4oVwHSuus5/g2HAoMyg3oGkzks93MzAIH4y9P3?=
 =?us-ascii?Q?BWzOrvllP0O4f0gYMlOC1I4i+sSTP8j+EhjZsKZWPwTy0G+MrYU0M23QFxO8?=
 =?us-ascii?Q?cO+zwuXQLFhScX6Kbl3w+9UqPsMWdSUgyhlixTCOHpslFw+FmnXwNFkUwCa9?=
 =?us-ascii?Q?kxzXaw0qucLx7Z2GASujmhixsCUrHyPOKsnRTbI7JNm0A2FhUc4e7qmAEdGj?=
 =?us-ascii?Q?hFURx095RpMxalefQ2baS0vbIULFoPjcRRC1xHo3zqBUEcc4KB+ApKVYC+0g?=
 =?us-ascii?Q?EHvqU+qlowvVv4bfDNJN5muap9n4WOCXR1UCzm50akDy4xCMfYCFx+vVaQYp?=
 =?us-ascii?Q?3Rh/Xv5KmzyR1yKKJpO/TJwMoa8r7siwvlyQBJI7srGZQuKmlX8NJ5Z3B1x3?=
 =?us-ascii?Q?b0e9o59Mso+eril3HYHKGTZWd9lfhtTewnORzybfgwNVdjEq+QjRtA7wQNl0?=
 =?us-ascii?Q?zdjJy4u+DefggtRPiCl2sMnEcj+lYuaXiIxR08Cu6pA/1l4ndDCcO4+VSjqO?=
 =?us-ascii?Q?EqQSYDphNgDt4PpUOGyA/K72r9F2SVUSiLsIuW1Ggv6VvbEIR//PIgHZX6Rl?=
 =?us-ascii?Q?ZnmenkcTrv+QvI5ip6pqISwtG5Faj7cKHj3IsVEo2y7WwaDfWRXWpoKbcpbU?=
 =?us-ascii?Q?eRJ7MkPiqswv40pgmQZkKNZLKrp4WTKDBs8QOQXjtaSYALuDekptD8H3aBJp?=
 =?us-ascii?Q?qWO6UBaZFndBM1j7tlw9+QtlRe+w4kNtZYzAyaonGBXRW/1HCHajjDSXmIEC?=
 =?us-ascii?Q?CGLzaBjmIrIlRjzBK6YLxNdB0IlxKzBgedY4I7e0a7sV63dOFZaiy+42UUDO?=
 =?us-ascii?Q?RaDnK3cqTiqoq/RX4FqAfcfde9BFbiAJ8eme/juEgTLbDWGwllJpKDxGBOoU?=
 =?us-ascii?Q?dd53NB2MLNFcJwAlZmerkEMlS+VmGgmkbTx7HuDrrmSY5Q+0QkeRESqfX2l8?=
 =?us-ascii?Q?eZPyt7n5w2BFOUkIv5LhTsrjetS17gf/JLSqUSdTZ9xtRd/i6BTgHlquYPvb?=
 =?us-ascii?Q?tIINoL4NCghZZbGCxycj7P2/NP5AM8G8PgfA+8eqUYdTAdCNbxghOGPzqDAD?=
 =?us-ascii?Q?imAS1EskyNhC9rw1dUcg7++mUDCF0VGFddCPHl4CVAQUQ3W+6og0j8xf+AN7?=
 =?us-ascii?Q?W/iI7jBP/Nofdnzf9LRM3sU=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: add2d3d9-1e08-4bf3-6f1b-08dbc5384a5b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2023 00:16:16.0766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ejF78sR7YExbIAtRED031baLxMYkLwE06CE+7MeyPfTHoUojyHoep+V6GHAagWVwfYhs0j6j9MVaXxsd2rxvqzt28XtsOlesYiX+VOmYBnUgFHoDZL3nN/s5LDIWEAvv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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
Cc: "Fleck,
 John" <john.fleck@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Oct 04, 2023 at 04:31:44AM -0700, Ruhl, Michael J wrote:
>>-----Original Message-----
>>From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
>>Sent: Tuesday, October 3, 2023 7:12 PM
>>To: Kershner, David <david.kershner@intel.com>
>>Cc: intel-xe@lists.freedesktop.org; Ruhl, Michael J <michael.j.ruhl@intel.com>;
>>Fleck, John <john.fleck@intel.com>; Roper, Matthew D
>><matthew.d.roper@intel.com>; Brost, Matthew <matthew.brost@intel.com>;
>>Summers, Stuart <stuart.summers@intel.com>
>>Subject: Re: [PATCH v3 1/2] drm/xe/xe_migrate.c: Use DPA offset for page table
>>entries.
>>
>>On Tue, Oct 03, 2023 at 06:21:44PM -0400, David Kershner wrote:
>>>Device Physical Address (DPA) is the starting offset device memory.
>>>
>>>Update xe_migrate identity map base PTE entries to start at dpa_base
>>>instead of 0.
>>>
>>>The VM offset value should be 0 relative instead of DPA relative.
>>>
>>
>>Overall looks good to me. Some minor comments.
>>
>>>Signed-off-by: David Kershner <david.kershner@intel.com>
>>>---
>>> drivers/gpu/drm/xe/tests/xe_migrate.c | 37 ++++++++++++++++++++++++-
>>--
>>> drivers/gpu/drm/xe/xe_migrate.c       | 22 ++++++++++------
>>> 2 files changed, 47 insertions(+), 12 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>index 6906ff9d9c31..75b06f0bd755 100644
>>>--- a/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>+++ b/drivers/gpu/drm/xe/tests/xe_migrate.c
>>>@@ -99,7 +99,7 @@ static const struct xe_migrate_pt_update_ops
>>sanity_ops = {
>>> 		} } while (0)
>>>
>>> static void test_copy(struct xe_migrate *m, struct xe_bo *bo,
>>>-		      struct kunit *test)
>>>+		      struct kunit *test, u32 region)
>>> {
>>> 	struct xe_device *xe = tile_to_xe(m->tile);
>>> 	u64 retval, expected = 0;
>>>@@ -111,7 +111,7 @@ static void test_copy(struct xe_migrate *m, struct
>>xe_bo *bo,
>>> 	struct xe_bo *sysmem = xe_bo_create_locked(xe, m->tile, NULL,
>>> 						   bo->size,
>>> 						   ttm_bo_type_kernel,
>>>-						   XE_BO_CREATE_SYSTEM_BIT
>>|
>>>+						   region |
>>>
>>XE_BO_NEEDS_CPU_ACCESS);
>>
>>In this function, we should now change the bo name from 'sysmem' to 'remote'
>>or something similar.
>>
>>> 	if (IS_ERR(sysmem)) {
>>> 		KUNIT_FAIL(test, "Failed to allocate sysmem bo for %s: %li\n",
>>>@@ -187,6 +187,27 @@ static void test_copy(struct xe_migrate *m, struct
>>xe_bo *bo,
>>> 	xe_bo_put(sysmem);
>>> }
>>>
>>>+static void test_copy_sysmem(struct xe_migrate *m, struct xe_bo *bo,
>>>+			     struct kunit *test)
>>>+{
>>>+	test_copy(m, bo, test, XE_BO_CREATE_SYSTEM_BIT);
>>>+}
>>>+
>>>+static void test_copy_vram(struct xe_migrate *m, struct xe_bo *bo,
>>>+			   struct kunit *test)
>>>+{
>>>+	u32 region;
>>>+
>>>+	if (bo->ttm.resource->mem_type == XE_PL_SYSTEM)
>>>+		return;
>>>+
>>>+	if (bo->ttm.resource->mem_type == XE_PL_VRAM0)
>>>+		region = XE_BO_CREATE_VRAM1_BIT;
>>>+	else
>>>+		region = XE_BO_CREATE_VRAM0_BIT;
>>>+	test_copy(m, bo, test, region);
>>>+}
>>>+
>>> static void test_pt_update(struct xe_migrate *m, struct xe_bo *pt,
>>> 			   struct kunit *test, bool force_gpu)
>>> {
>>>@@ -349,7 +370,11 @@ static void xe_migrate_sanity_test(struct xe_migrate
>>*m, struct kunit *test)
>>> 	check(retval, expected, "Command clear small last value", test);
>>>
>>> 	kunit_info(test, "Copying small buffer object to system\n");
>>>-	test_copy(m, tiny, test);
>>>+	test_copy_sysmem(m, tiny, test);
>>>+	if (IS_DGFX(xe) && xe->info.tile_count > 1) {
>>>+		kunit_info(test, "Copying small buffer object to other vram\n");
>>>+		test_copy_vram(m, tiny, test);
>>>+	}
>>
>>Probably we don't need IS_DGFX() check. tile_count check should be good
>>enough?
>>
>>>
>>> 	/* Clear a big bo */
>>> 	kunit_info(test, "Clearing big buffer object\n");
>>>@@ -366,7 +391,11 @@ static void xe_migrate_sanity_test(struct xe_migrate
>>*m, struct kunit *test)
>>> 	check(retval, expected, "Command clear big last value", test);
>>>
>>> 	kunit_info(test, "Copying big buffer object to system\n");
>>>-	test_copy(m, big, test);
>>>+	test_copy_sysmem(m, big, test);
>>>+	if (xe->info.tile_count > 1) {
>>>+		kunit_info(test, "Copying big buffer object to opposite
>>vram\n");
>>
>>s/opposite/other/
>>
>>>+		test_copy_vram(m, big, test);
>>>+	}
>>>
>>> 	kunit_info(test, "Testing page table update using CPU if GPU idle.\n");
>>> 	test_pt_update(m, pt, test, false);
>>
>>This test update should be in a separate patch.
>>
>>>diff --git a/drivers/gpu/drm/xe/xe_migrate.c
>>b/drivers/gpu/drm/xe/xe_migrate.c
>>>index 15f091a7bba3..42942aeef595 100644
>>>--- a/drivers/gpu/drm/xe/xe_migrate.c
>>>+++ b/drivers/gpu/drm/xe/xe_migrate.c
>>>@@ -114,8 +114,12 @@ static u64 xe_migrate_vm_addr(u64 slot, u32 level)
>>> 	return (slot + 1ULL) << xe_pt_shift(level + 1);
>>> }
>>>
>>>-static u64 xe_migrate_vram_ofs(u64 addr)
>>>+static u64 xe_migrate_vram_ofs(u64 addr, struct xe_device *xe)
>>> {
>>
>>The convention is to have 'xe' as first argument, so it is better to
>>follow that.
>>
>>>+	/* Remove the DPA to get a correct offset into identity table for the
>>>+	 * migrate offset
>>>+	 */
>>
>>Comment format followed elsewhere is,
>>/*
>>  * comments line1
>>  * comments line2
>>  */
>>
>>Better to follow that.
>>
>>>+	addr -= xe->mem.vram.dpa_base;
>>
>>Should never happen, but probably a good idea to add an assert
>>that addr > dpa_base? Otherwise, we will endup with hard to debug issues.
>
>How about:
>
>	addr &= ~xe->mem.vram.dpa_base;
>
>?
>

I don't think that will work.
Now I am thinking that given it is a static function (not an api for
other parts of driver), it should be fine to not add any asserts.
So, we should be good here.

Niranjana

>M
>
>>> 	return addr + (256ULL << xe_pt_shift(2));
>>> }
>>>
>>>@@ -149,7 +153,7 @@ static int xe_migrate_create_cleared_bo(struct
>>xe_migrate *m, struct xe_vm *vm)
>>>
>>> 	xe_map_memset(xe, &m->cleared_bo->vmap, 0, 0x00, cleared_size);
>>> 	vram_addr = xe_bo_addr(m->cleared_bo, 0, XE_PAGE_SIZE);
>>>-	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr);
>>>+	m->cleared_vram_ofs = xe_migrate_vram_ofs(vram_addr, xe);
>>>
>>> 	return 0;
>>> }
>>>@@ -225,12 +229,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
>>*tile, struct xe_migrate *m,
>>> 	} else {
>>> 		u64 batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>>
>>>-		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr);
>>>+		m->batch_base_ofs = xe_migrate_vram_ofs(batch_addr, xe);
>>>
>>> 		if (xe->info.supports_usm) {
>>> 			batch = tile->primary_gt->usm.bb_pool->bo;
>>> 			batch_addr = xe_bo_addr(batch, 0, XE_PAGE_SIZE);
>>>-			m->usm_batch_base_ofs =
>>xe_migrate_vram_ofs(batch_addr);
>>>+			m->usm_batch_base_ofs =
>>xe_migrate_vram_ofs(batch_addr, xe);
>>> 		}
>>> 	}
>>>
>>>@@ -268,7 +272,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile,
>>struct xe_migrate *m,
>>> 		 * Use 1GB pages, it shouldn't matter the physical amount of
>>> 		 * vram is less, when we don't access it.
>>> 		 */
>>>-		for (pos = 0; pos < xe->mem.vram.actual_physical_size; pos +=
>>SZ_1G, ofs += 8)
>>>+		for (pos = xe->mem.vram.dpa_base;
>>>+		     pos < xe->mem.vram.actual_physical_size + xe-
>>>mem.vram.dpa_base;
>>>+		     pos += SZ_1G, ofs += 8)
>>> 			xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
>>> 	}
>>>
>>>@@ -443,8 +449,8 @@ static u32 pte_update_size(struct xe_migrate *m,
>>> 		cmds += cmd_size;
>>> 	} else {
>>> 		/* Offset into identity map. */
>>>-		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>>>-					      vram_region_gpu_offset(res));
>>>+		*L0_ofs = xe_migrate_vram_ofs(cur->start +
>>vram_region_gpu_offset(res),
>>>+					      tile_to_xe(m->tile));
>>> 		cmds += cmd_size;
>>> 	}
>>>
>>>@@ -1062,7 +1068,7 @@ static void write_pgtable(struct xe_tile *tile, struct
>>xe_bb *bb, u64 ppgtt_ofs,
>>> 	xe_tile_assert(tile, update->qwords <= 0x1ff);
>>> 	if (!ppgtt_ofs) {
>>> 		ppgtt_ofs = xe_migrate_vram_ofs(xe_bo_addr(update->pt_bo,
>>0,
>>>-							   XE_PAGE_SIZE));
>>>+							   XE_PAGE_SIZE),
>>tile_to_xe(tile));
>>> 	}
>>>
>>> 	do {
>>>--
>>>2.35.1
>>>
