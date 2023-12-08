Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D0BC4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B18F10EA06;
	Fri,  8 Dec 2023 06:47:36 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 957FC10EA06
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018054; x=1733554054;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=QVDJPBsXzq1gg/HVwD1V/uRUn9kPNw/2qVAppLomGSc=;
 b=NcUxKISHX/6a5v4wSAvwQ5JK4Ksf1hQoHEXd6XeHTxHtGRGLXTmG4dMa
 2x1CHsKBKkWJuf7+FM70GuA7JMR0Tbq6v0xPBrU7K3vFzeKDOPYOcLbO/
 ZtBOKDYTyUYx+dKWO0CwhLuDohSoLcOMz7cuyYTEjN4GZSlksRRbpcBmm
 Sujqv9L3UB1ZwV9RW9b5GYuX4OFBZP99pEGfe9ohBMQmGwEZcVu/7EuXa
 XM65EUMII51J3/z2is5KP8SbfuCdKm38v2lpQKunVBkaWSrYf9xmkK1ex
 cYoFKV/R6a6U4JYryrekMBB9y9AWQZDOJiVKJezvnRIDpCIO7wSVTITBG Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="391534102"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="391534102"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="890020485"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="890020485"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:34 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:33 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:32 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfDVKstyFt2X+ui5i3elzS46+/bLVE3xywZirdOx4t3dE2ZmSXiXBJ1d15BoQYl4dxf1LTWbYE6wrbgBDZacNGVWFoeLuum52Dg7E4rqbmgcg7xEhRv3EVoUQeDCc3udSQSt/Il/4HdhHoXgdS0VkjjH48DKo/XfhkJsOQzWyfTGs9GvsvYqL/WfbIIzWeoDoLENzXXvxAp8gODqGRDFgso6nobA6wa+5+Byy4C8gLg3ZeAKOnX9MW2JEWqyeqY0EesgA8ZrhNZPU1OSAlQoH00Frp9Ys/ASzp4JDiLXX0UX1NOvE2UW0MRh+lgMas1w5YXUC+1Mf4P8o93okNIb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CsHkpBlsZ+AnEfZMEg4J2stunAxaIrPDcUZgMLJ5ogQ=;
 b=mSXOysh/D1fE8xyCUx3cz0gSdBEGzlfx8dmSB3DcM99PtgLclinwcoeB43KOSVh770UTVqpeIcIvdhWZZxURF/+P+sLlM3DVmG6fMNe99+gxQI37JBgwH+HfT4SYd0OLNlWf1ycj4qSmrPwn5e1RcivXfLgh+y4/OYPXrFWsGuKaCCvttuymdCY851/m8EJiEnUkeeejuYzvOZZezDcU3lfaD6S9xSxbSF/HCgvKCavmXZgdcV4vwSRrliJ3FK34mkdguhgA39u8UmK95MqwyIX1ROPRVgrE6Y9QOlGNqW+W1BS23+VYQDwld6Bisnp4RzJz7+fJ6oIMEYsyp43Q2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 06:47:31 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:31 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 15/16] fixup! drm/xe: Convert remaining instances of
 ttm_eu_reserve_buffers to drm_exec
Date: Fri, 8 Dec 2023 01:46:42 -0500
Message-ID: <20231208064643.877688-16-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0006.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: a9e28ebc-a0f8-451c-15c8-08dbf7b98cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ujfpx6pGM8lIMbf17qC70gZFnOXdhHaNTbd37Bm9BItFJBOHkiiBPVEAxzlhINjWqGJ30dQadUWxefgPOz0exSd0D6Ff8EyeWFNoVhSghXjrI4sbLovukTwB5B45fIFApv8FVHUXXFTQyoPRRDMpGPGHPQCV1mqjZDQUq6KEL6X6WYYc/Zk0TFDKp47M/9nJBl92OTp5K/wNJaxNR8I9tn+gOTNTf4NdmRckFWQ4Y53cH+R4cTxprQJGHTMmaoWvqao8KDn44btCbBRFHwGhoyJ+MV3I0D+5oV+YLBsuv0qbiAlow916dZFzxtxL8qKeQfbJl1gh8FnuFs0y5QAUl62i3kgMiQiVxhuZsFMM2HwORHasW0AnoG0YqqPYOIH24hLsnvJ6vA4eogbKqX75XWY62VyyrqOjb3APy7b+eFc6aV4zozMVTJWDir1W+xQynAM974rVX2Kk68EUVTZY2dW4ddm+TKDecrKuCCBc2v0+NZUe4fEBuHGoBCr9xJk0bh5Hb4JLoYEQG92zARfLQh5HQNBjyXDCiN7QCdhVhaUWbEJliPNSHpwb4N+/shPG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(6666004)(1076003)(6512007)(2616005)(6506007)(26005)(66476007)(316002)(66946007)(66556008)(41300700001)(5660300002)(2906002)(86362001)(8936002)(8676002)(36756003)(44832011)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2WKYkFd5wdhkqEbQguWeInWzJkHnlwjpTvHRaXVW4nARtn3DuarI46Lz813/?=
 =?us-ascii?Q?azfiJ3Z3QeZIC4PLZ7CS3QokIeMw3vpa1AKlVkSAtZdgaAKWuLPuO87WTgwU?=
 =?us-ascii?Q?nwHyGlp3iusW2ntIhVe+FG+clms9Ym0DqA3G+5udw4MCXgUPGrnsCK08Bk9o?=
 =?us-ascii?Q?IGA1FBvca+6KMg0QZUYhuOQAnk87ym97h2DsJtzieQ5kk4PYUmYAh8t41DJt?=
 =?us-ascii?Q?+j+H8+dV6K0CXZGI3n1SzSjQOsQRHugWceSon1jxyAvwQuO9xGp6JDKK6Z6N?=
 =?us-ascii?Q?XrDTdZ2XxOMWVeMSiFqtI5+xXlVPEepSMMi+hEaZbjW3kr+afA6qiKE/e1/m?=
 =?us-ascii?Q?rAnwa5BHq6cObPriEUtg6q3O/wY+7fduhRzuVRyQd5lS4tBj7ZJHDyUW5DL/?=
 =?us-ascii?Q?nCe1BOsi3LAf19eEUNYpGkQS1ECBqNqtKA2dNl4jzhu+SrQfVsEwFjXrY8iJ?=
 =?us-ascii?Q?pQreahIF6BV/SdZ78g25sYHIzHpZ3n5e/40ZI4J4RT1P04XZCoWxar6l+lBF?=
 =?us-ascii?Q?c6nzMx1Z2vQIs7vi+idPHEuv32221zFyygs+tWL1GL1yIFbLuOWdw/Khl6uw?=
 =?us-ascii?Q?Mw3K0rLqRvTyS4kwJQL6fjVea5K08pk/s33zQPnr5UgLxTYGO2ggxugMB+J0?=
 =?us-ascii?Q?sfWHJFXYr1OUYzpAGCOO0d0tIK2yXxNF2dtwbzcuP/RUN+wCpc8BHGz9HRRL?=
 =?us-ascii?Q?xSl1GhqwxdAc1GUfYS4MPR+IGVIcUYzaH1e58p/EdfOd1WMu4KPQD/nZEQLy?=
 =?us-ascii?Q?tri+Ff4oFjpfdRZpfDrjHmhy/YZo5QDrWduko0fu4sq7kH7BAd3xLEmKx75f?=
 =?us-ascii?Q?DqONoBDApVAFtdF2h2GxeuVGZvV6vQI20I+03Ur/veCXXvRvFgw8ooeUwLbW?=
 =?us-ascii?Q?6rIFGJ2duftyNylT5En4vjy71XRn4j/aMQXXVr5NJGe78pmM8lh1e7jmgnwI?=
 =?us-ascii?Q?QwWaHBdPy3fGFwXOeGCCepGuRbAriBS1TnCZawYTzRbf5LFDlWa305rNrTXL?=
 =?us-ascii?Q?BRwcI9E3ZUpHY1LuD7U6P3P0u1EF5M7vz+IVnnFRGuRukHXO/WGYQca39Ybf?=
 =?us-ascii?Q?G40RzRyxBU9TTUziz6n3NTmhSCeRAFTFFLkJDvgNmBmnwtJz6rcwBq/IQ6nd?=
 =?us-ascii?Q?XCBV2WzOYnPkx9AIKc1MOPB+78TubFGZfwlS4k1J1T8ww9GHlXY0/5y8kEEb?=
 =?us-ascii?Q?lVIvJiKWVd1CgEJ6Soqzgf5ob0fAIi0pU2DzQIXxi7BoYTWw9pWK1Z7Q3ACc?=
 =?us-ascii?Q?MirwMu7LFUILC+eRPeu5aZxGVZh/V50qw5S9j+mPcevfBHoDWF4DYxBjHslR?=
 =?us-ascii?Q?30pCBgd1/MtXq5fbjdk28drAeNffLA5fmJm6gbA4Id7Pd6rkyrlLcFFwpd5W?=
 =?us-ascii?Q?PPh5nDmlwtlNyrSRfx9+kanibi95jfN/5f4IQNhZTH1ykjnH9Rx90M2LkuGD?=
 =?us-ascii?Q?fhtPIfxPGWglQe6P95d6bBoc566aO5Eq4aMLTDNng5kB9APxtYY/nI4OS4gC?=
 =?us-ascii?Q?lJlPA5024ni2hkUVrk3N0ejPVkubmLlOqKY39DI2YEwAjICpHIknOv9lV7Fl?=
 =?us-ascii?Q?rscbEuMQE5qBvACLiXwGMzGtzfIlba1iD8QRYyJ53V4CxLjrZ5kR23N9+vzK?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9e28ebc-a0f8-451c-15c8-08dbf7b98cfd
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:31.1177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fAnz9551M57PmFcdOJOa/YMJbCwhsYj3exTophdaMYoG4KIWYj6YPpZe9fsZ7Q04qxBi5/kXMxMUX0fU91nTzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8256
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

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_vm.c | 9 ---------
 drivers/gpu/drm/xe/xe_vm.h | 2 --
 2 files changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 1c621f073d70..0b55f040cdeb 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -2096,15 +2096,6 @@ static int xe_vm_prefetch(struct xe_vm *vm, struct xe_vma *vma,
 	}
 }
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm)
-{
-	int idx = vm->flags & XE_VM_FLAG_MIGRATION ?
-		XE_VM_FLAG_TILE_ID(vm->flags) : 0;
-
-	/* Safe to use index 0 as all BO in the VM share a single dma-resv lock */
-	return &vm->pt_root[idx]->bo->ttm;
-}
-
 static void prep_vma_destroy(struct xe_vm *vm, struct xe_vma *vma,
 			     bool post_commit)
 {
diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
index 9a0ae19c47b7..eaf072974d94 100644
--- a/drivers/gpu/drm/xe/xe_vm.h
+++ b/drivers/gpu/drm/xe/xe_vm.h
@@ -182,8 +182,6 @@ int xe_vm_invalidate_vma(struct xe_vma *vma);
 
 extern struct ttm_device_funcs xe_ttm_funcs;
 
-struct ttm_buffer_object *xe_vm_ttm_bo(struct xe_vm *vm);
-
 static inline void xe_vm_queue_rebind_worker(struct xe_vm *vm)
 {
 	xe_assert(vm->xe, xe_vm_in_preempt_fence_mode(vm));
-- 
2.43.0

