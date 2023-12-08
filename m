Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7E6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5E710EA01;
	Fri,  8 Dec 2023 06:47:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8747310EA01
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018046; x=1733554046;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=ALI+oxDDUwazPqSf6cPEwmMzuJXM7WOfVzSIGjjavvI=;
 b=FSyvIEJRIShYd5jOlV85Jw9cdS/k5dbvPqPwOpXF8CF2SXICvsIUPHkG
 LHY0/93fXRtMYe23fpQNaroiH8QilzA9syyR7T4fIfG3nDH10JuVsAWoK
 cb0GtbNzGAXZ3wAg7FJAYGRRAqANh+tKfqvXp1ut3agLmGKePHK/+ZbSq
 d8PRuodo8XXutRyxTVneO8wd7dfdH1keiFkHSWlWcs1aOlnq8QYn2+URe
 STzgQdVgUMyYpEAmHWvLgbPWeZoxeHicidHJRhk9+2OYvp4t7xEaDATkp
 22o5QHWTbmBH9Ak0lZPGWaOrsiNCyLP9uW3nfvjGXP4HfLX7ssOkj6K2R w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393235554"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="393235554"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721769620"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721769620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:25 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:25 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:24 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:24 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZjnZU8evZJnXKS2HwYr4M+y0LTpbiwB+r7ZUOiTTtvZ+aSdeCYgJVURmUu/Dd2WwsJwCsOe3e35UbmEfJGU+NoJ7vQTN7xl/iZExTlk4hdH3LS6pxDUmgLH7C0MPnIo/xuGQIXj4sikIQGzWYGMRqavIPTLO2w50stF5+N0dhsQSkCXKthM+3gyMxuSNciSIthlQQA7NoFYyRY7YaJPkhM6VnAB0p3mWgVqDt0PL5BHZpPyfi9vQejhAMciLC1GkVJeq0O6xiDySTvriiJMC9KwcVXMLCg+a4wljxahyoMHOQqr0h+vGUnq5akPgjimpC4b9sXXqMSmgpb0I3TAEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x8v+Ogadw51jiAJ3/lyw1OcK7xNCnIDrQLIo8qEL+PA=;
 b=LEFRK/t/lHQ/FlcAifSwAwQs+zPeUXMBoTlWP0uCTuxGwwvvnMYZpBeIgK9oUlPe0+BeI0dtVQ8oIX2FRUsrOQUNKem1pSa2Dk/ykGEyLgejvy5745c4JwNb+l5LYMNWFmJQKzaHh1DNEO5Rl8pUyBZzWOkLxN7HwN4M3zZaJATXQa+KT+eT4BLvwvtWlbEBHvGBf2tO0GSdtqBMNhnCvNFaTVEDudC9TwroXZqFEop+CEfEJOkGhV3oDtlO+H9Uhf5nyaAcz2CoSBsgxR5rQ5j+WFX2ztlTSGZ/JkGom9PNxvTGi1kznE/sm41bI+stcuA1kmxDdyWU+JkLI3ZPLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 06:47:22 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:22 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 12/16] fixup! drm/xe/vm: Simplify and document xe_vm_lock()
Date: Fri, 8 Dec 2023 01:46:39 -0500
Message-ID: <20231208064643.877688-13-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::25) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ecd3acb-fb9e-4be8-87e7-08dbf7b987a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xuB3HGVWbtfeJn6t5hz2yJ5tqYs3mFoC7kieHkEydVjr2ER953EBvNvU94op/HxKNt3o7xDm1itfeoUbSRaFoL5bDRv+Ipy5HUmkVdStSl96UxNysB0g+Yj0y93RrYMqVFkai9UX0FCou6QlvFboYLtmmc9aEnE3Ocb4wpIgOrR+cEmTy458U38G1vec6fGq3fKm9MtdfK9+qu6biw5nrwHoM2uQbctYP0lpCUJGWvYErdEwilY8FSM3j24tsvkddpUyJ4WWMd4SU4/STLS+/NhWxm/vDLlv+C+F3SKMgktPabXI3Zp0ROYsesZ6JqGfhYFb1R8vblodyjqAPkV6+h0a8fe0KEBGTC2Tz4E/kkpyE9zLgSzd9ycMidJNdK+qh+ETW648e+NQ8jTVaScR+5M4ucLpnV5l+KAUayQA6IUX8xrTPo507/5FgPfaqCT4P8H2ecLYp2io5eqjRuznWaSVfS+uoj9HPM8+54JqHRIO3dPJz8Egz3OfsGBUMU7bnImo/GJi+gGktRMkGkLmUkswmaNuhtsn/lca4JVBre1g6B5woWowaO8BW6KWyAuI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(6666004)(1076003)(6512007)(2616005)(6506007)(26005)(66476007)(316002)(66946007)(66556008)(41300700001)(5660300002)(4744005)(2906002)(86362001)(8936002)(8676002)(36756003)(44832011)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I3jgM0WAEbGqTohJN/ZBzvobd7Ty1+unSbMzpi0NM/YybfxDK53/fehTEeZE?=
 =?us-ascii?Q?6FfPHfIR4kUGdXN12RVnDQrHd1wUlcV/6jislh2UYVU16KUFjlDzkh+1307i?=
 =?us-ascii?Q?fioAbn+I6cTrfofti9FaBp2leT0adLKPArCmu6HtL008kjPGJVGNNeiY9K7T?=
 =?us-ascii?Q?u5Ank729cpFQ1ADZtUz7z1rfmQIkyP5F64E2zbbAFb/wA4p90L6PnU+N5S9e?=
 =?us-ascii?Q?JID0T1EyRvIVldY3J2roskZ2Eq8s4yJgeYVTH0Z2F+9qoH6VTbFOm3FAfY60?=
 =?us-ascii?Q?hIPF8icAoAP8N0AV73nUkIjVmT3u2zWgCtAclPm84jU/zL84lpjiO1r9spJG?=
 =?us-ascii?Q?rNMKxHrTRSvqHQBW143wJjnlwcaLAgoibsnWNahT8AQ9p0GKZSn+dHIGPyIW?=
 =?us-ascii?Q?gv7pLQzlu+BJDe4503GZNY6R+/I5pUZAc9BHzK8qSdJJSvUux3oaYRr2ESx8?=
 =?us-ascii?Q?JAuDW99mT/9yiaaXh6LsNUKR/gdhkyj8HiNa4yfWO1q5UeMx8miQHUL5U1d1?=
 =?us-ascii?Q?RwM+gQykyECwbyg1WBawxm4fDn5BPAUwXvVAcgKgrMHlFAVlQRGjxEzbyY6y?=
 =?us-ascii?Q?zl1VBPvj4NJW1oG2GIL4+Ps03pp+dXouofzs6/ZMseo6QnLgHHUcGo/oybzu?=
 =?us-ascii?Q?/paTbP1SE6Z0m+WC6jiT/Ob1wJxXioEU/FjqX9sagGVciYoKhJdx9cZa8o3d?=
 =?us-ascii?Q?dTqOrFW+1Sv4p8VsSSStbTUSMWlGrrKq/P11YUhwXtW3msAxJFfsnmQ3S06z?=
 =?us-ascii?Q?0lrS5U0xJLm4PA+gzAmsl7/7QpCxcnSkorXA4daFfL9ZACc/x2ogdUyNV3t0?=
 =?us-ascii?Q?IQ6I3++duJ9/qTQvTfYSca3RmBAZi2p6cvJkqqU4BCphbIRWGqziJiq1fN5y?=
 =?us-ascii?Q?muyy2WII0lGzCJ5jAboUdVLRG1jNJ2BHSoIDff4oPVjateQRc9wEpsaWzZvz?=
 =?us-ascii?Q?6Aa26YRZubxNBy78+o838BZm4WKbFJFZyWQDY1jx1aWTEMKKgnJUT8xbb9jK?=
 =?us-ascii?Q?vWa+QsZO4YdAFhY/i0+HpCIv0tOLxAIrhJNMj9G/GAZzdYE/Rg2JvksuZkxG?=
 =?us-ascii?Q?hZ/VAmVY3OUCdBf/mxGvSQJAihKTInQXptMBnwUeMBkzz5dBLTs+VEqpfpuC?=
 =?us-ascii?Q?IcRUHF1m3nfrmh3FH5L9c1M8tYdCWW9kam0f5Y27N4Zo6h59CCgY5pHEaf9V?=
 =?us-ascii?Q?0SRL33JGJPcgH0uKYB6MHmUCvTmyZm9U99EhnEKg1TBoCh3r8mQsWkxW5LwN?=
 =?us-ascii?Q?6ocNE0I3DM0MiNXvxFzRAgRWxJEoufC5gWaDBWV4Wnz7QJOWQVWrXEEbboTq?=
 =?us-ascii?Q?9jCe6JAllYlJRr4aUgjJqEVZJp4MdN1uvpthlQbDV4yrMMTV5X8kXqL2KdNF?=
 =?us-ascii?Q?4aAaBHqGbK/lPUZAgJTYrVzX9mQ3qmIpoz8e3bWyNYN7qH6Z1l+iFLZ7ib/y?=
 =?us-ascii?Q?jwm0b9mGeesU8CArNuKO1njS3ONKB+Nq+NPqQgqXstZUOpAjql9fH81Etyl7?=
 =?us-ascii?Q?4bXy+d0vE5KhuYowWT/2Y6kVvk//Dbb5BHgVssvY6fi3dL4uJVCFqOg8Hzna?=
 =?us-ascii?Q?5ZSWH7FGqdi+paDqY4r6SUHTcwm33TcI0ef1gqrQylG1AjMGFXCuvDwXdnip?=
 =?us-ascii?Q?bA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ecd3acb-fb9e-4be8-87e7-08dbf7b987a4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:22.3034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TE//t3FwEiYrOej7Gd99L/mtsEMalRHgKGYRIPwU6PVtp1N3GGagrcS1YER0fU8ryqo26hWXW75K5ng7hTiGqg==
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

---
 drivers/gpu/drm/xe/xe_vm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index b8e22d50d30d..795497662e18 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -3205,9 +3205,9 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 int xe_vm_lock(struct xe_vm *vm, bool intr)
 {
 	if (intr)
-		return dma_resv_lock_interruptible(&vm->resv, NULL);
+		return dma_resv_lock_interruptible(xe_vm_resv(vm), NULL);
 
-	return dma_resv_lock(&vm->resv, NULL);
+	return dma_resv_lock(xe_vm_resv(vm), NULL);
 }
 
 /**
-- 
2.43.0

