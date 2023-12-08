Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D22F6C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:47:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBE610EA09;
	Fri,  8 Dec 2023 06:47:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB03310EA06
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018050; x=1733554050;
 h=from:to:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=CkjGUOAB+rB5vC4yYdKYOy9g+RwKpJWbIjsYL4gxEMI=;
 b=mi7kit+LSIaD6EUbM6MDZeyrlQtTquZlHi5p1ATJ/vN6uHB4HYmxSXxM
 uHifSWnn9Nhvouj8UDf8BLuzWdpUbMwSoda30pdguXNspKoRoiQoOtjox
 X3ZPMzAAvVyLZ8Pc2+MsEPpVAgW9pvppKDxj1hhqCTXfpxvWfIxq72+1d
 EVjVYBGNyaVSk7EyYKcSijK/s76hYh4lQog11AcbIy4SpiH+SDjMrx2X1
 WBsWmTvaAqNQDILOu1vLtZSgEVkrSihqMXITyF04mcU/vYvvM+DlB30IC
 TxikYmjSyp5jPwuF1NVooX6JrTiaaVYoMHjuiH7nnIMTDZjtRM1PTJ70W g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="393235560"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="393235560"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:47:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="721769625"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="721769625"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:47:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:47:29 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:47:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XJ+mfwdLU6syWoJde4ru8JDWaqFeGZkUY4DhiSwgEGC2aBsdEWjAM3DiNa7JwOshKSGYeVDKrWrPl9OCol63lHd7Z+bdvS5D1hVCJa+sX1FwFMMwYVSJ7pEmcRQEYKUfLk3Uiw2WO5M4dS/HRynXJB5xdLySswOCudmRSu5dFG6pHSMdLxNpq/N1t4aJ6HlbyNj3f6r8bNzQ8VgsaR5naFbFYnncxctb5Yym5Xya8bDH3/JULprFk3AvmPQtA1NYV20P6dA1jH96suDvHqllWVnJf40VVvWiZ71gYUihZn9hPgC1DmkncBRWtMk5dpylBO2GWzDYc4Pek4rFrQPIHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fNCfMDns/5PFZ/1MUBt4Y5Mn1f4UH/2a8/29zTEu4t4=;
 b=YKYDM+ULQRw3A4Es9dmmNUx1WSjOjvf6KCu5rb7GOE9JOTd5cUz4Ylmp42RA8vdT8gdwQ8sYydXL2Z4/oK/dFh5P/9OQOuPCvP95pnm4wN47AaFs5x5j9JJI5G1MWGj2cuznJiXlJBYtTwrsw5DDTLPc2ioEXO6y+DqowgxUQy3cOmQMeEIIX4O1nogFZyBaVTepb1REa4vhu1DUXy4iM2UKFcuwwwXxyKRUgVew8tuxKlSe/ugZ4uyxKfxztwOa8zWceFehyPtUw/i04c0EdU3CUo5ULgbpBiAP+UBC9AdQiCocrgrg6kELFnn4znKVf4w9nArer+RbGpzDN0kKgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB8256.namprd11.prod.outlook.com (2603:10b6:806:253::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Fri, 8 Dec
 2023 06:47:28 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:47:28 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: [PATCH 14/16] fixup! drm/xe: Rework xe_exec and the VM rebind worker
 to use the drm_exec helper
Date: Fri, 8 Dec 2023 01:46:41 -0500
Message-ID: <20231208064643.877688-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231208064643.877688-1-rodrigo.vivi@intel.com>
References: <20231208064643.877688-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::36) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB8256:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f73d28f-a6cf-4560-9dbf-08dbf7b98b41
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RGChMl+JykTo63yxKzmICgSQcwHTcr5hgfzA6OYmI0lQdQQIXvxZmy1jdnFDErzdmMGA0mjZ8NbUMyVqxI4Hmpu5m8ozi3MDFX/tjezXl8xOtCzrLTFnDaShYCTjJUyCTIWpQPFtyvQc61WW116L1DKcKUPzzoWt+2vn0p5n82nkTiGhm4GZfJzRZiQDieJqGraYzN4p772cuo/8+LUUu/v/SLKMAf+2ETZZmLz775xjFiBKcGqn47ysLPki78is7c1hu1Xosn75nNfUZPKZxqhyjUMdZFJARZtxL3XoAOBIyx+cDqYZCf7EVMQh3RFMJqOYqbJv7jPsGLWBeYN10WKaMT5ey3FVpB2DB+X4JXcwhgKKCuHuMTBr9OcjqHKoCJmjg5DDFQVjeFLgEUktbE0d/FZekxOcEkhutA/LHltHNesqKKNcG0tVTFdHDCdcmoEYcd0rFu7QaARTo+PJpTz4UgVC6lqQigAnfioiStoxgmUECg3QCIWH3XwoP14HWi+IcB8ZHclcbhkyNrJQ7u+MZ+ivABOrDc3reUfGJUv7fhksZqzxLlTPDcyw6tNF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(376002)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(83380400001)(6666004)(1076003)(6512007)(2616005)(6506007)(26005)(66476007)(316002)(66946007)(66556008)(41300700001)(5660300002)(4744005)(2906002)(86362001)(8936002)(8676002)(36756003)(44832011)(38100700002)(82960400001)(6486002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XkVp0ep6ei1e8ERkKbWwB7wk0RhgZxSOhdsJmNCHkX6Rl8kDySUyhZmYcwW4?=
 =?us-ascii?Q?EiJfa3+JDmMNuIHlo3sil5zdN/Mayxhliu6ywFj3TWhEaTlJmxqLiSmQwgsO?=
 =?us-ascii?Q?w0UJrXellRhhC4hs22Zv1MSQZwiVNmGpQcl4XLQWuP5V69dsaV/3ykDdzluq?=
 =?us-ascii?Q?994UpMuCin1cxwyCFuh5IhUwu3SjxpBM79b3xjx/4XRNViI6fHr1AXvtwcFW?=
 =?us-ascii?Q?0EOrEdsSds2RKjqOLf1CzC8tz8jxV0/0tr7qmyUs4Tv8EMh9XS2D+h2efhoi?=
 =?us-ascii?Q?xDJGn4Efkwa+s/P9GNSrg4hl+jgk6TMNt7sEtrjC6p27z6IWoT+hovoi902n?=
 =?us-ascii?Q?h6elTL6mAoA60sKmrz4lIrYSJsg7SIff8BbQvgEF4GBv6PIn/g4n74d+oCRH?=
 =?us-ascii?Q?a6jUkfa722KUG3sNZ9otuc1qeTfy8dZ5CcTxMshBszhpqnwhtQhoGXzzFsAF?=
 =?us-ascii?Q?zyyUFBQOgnDQrxUDAMNHgMHiuQa0oh5RGkucfw9DOhZkh3gMrcYSqp+/O4Yx?=
 =?us-ascii?Q?9eW5P5Np6KrSNgo+axV8DdskvJLKNUbIzA5aRbRnaHx/6pKwYHqAchKhR8oT?=
 =?us-ascii?Q?8Nb5yw5y41+ww5JheVUsdgFsS1VHz1Tuutk7ZnnSwJr0ZmP06JddivEdrD4R?=
 =?us-ascii?Q?x2nHgKjUdRDK4zoOoS9jmOHE9MNj7CqedqJHUeOs+Dc5A2T2AFaw4sZv1m+w?=
 =?us-ascii?Q?2unZp1sLEHQ492FItscxAo4O5Ivjx/yHWuBWde5wcIZdlxaLPtrHySoCNDX1?=
 =?us-ascii?Q?1bpHGdeBtDNp5/87tj+E4wt7Tny8dhtb8f/AM8a7sx9UcpgiCsqLb9mCK7QJ?=
 =?us-ascii?Q?/JF4NOd+aWFX8kFvtn1CFU9vdFWJdifGE6BbRlhojfK/yE15vHik3b3H9gfB?=
 =?us-ascii?Q?EjWnatPNn+bGL2DUlpld5Q5AoX7P48FU3CTkdbi9DOlYFfdbEYCN8tbvxR2V?=
 =?us-ascii?Q?JcEFS+syYQMEbQygUWzgHBUUV8/W5Dp48CMDGmlxQRRFmt6sFAJaHSLCx8h6?=
 =?us-ascii?Q?gPw6Bj9iWrkX9dM5dSmBEpg97qMgoaNkRjgKaIo9GcjKISw3QBadnym+vDqy?=
 =?us-ascii?Q?CAcPqUTWBy/CdEnfrUH7wg8JLsFiTC7eo48ICJ5v7GQrU9MItyx2yZAQv7/D?=
 =?us-ascii?Q?hsBdf/nNU/i3Z+zPElhiRomI7ZjzEIueDEP08fHqUVIajv6+etI5F5qP7hKa?=
 =?us-ascii?Q?jaarf3nOnoXtLhe1++gZdsRzSeQfokRSWUnEUeh5mu7pinSMrVZdgYsC/Rba?=
 =?us-ascii?Q?cuqTFz3Kv0LjBXM0j/298NvnwsDvDwm9C5RfdFTp6e9Soo3ElKynCpgG+HT8?=
 =?us-ascii?Q?wFIpUJPuHUr4bDY45EVGL1+gX7ZoFr1+HX5bpUXSNkF9Xg0qJuLBY6ZNEW8M?=
 =?us-ascii?Q?z6mnWpbmEsvB4v8q5NYCZcOKWwb7x1JqIRAykyMnWNarkPWzDHos53yqVwBs?=
 =?us-ascii?Q?C+V3COVzY9dOM3VTBHJzB6iDU1idL71pT3czYOvjhiCsvwAjTOuOm3wGgDJa?=
 =?us-ascii?Q?nVQWM+C5sjWYd/OOnI+ZH7euKePFQJ7uh0fXWzKrqtusgbEkgoxMAmkOOFhi?=
 =?us-ascii?Q?cba/Xz1y9oUNy5WHQIqtbUuFSh1vxde438vKm4gJx5H2QmzIPzSBSPLLRsZS?=
 =?us-ascii?Q?oA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f73d28f-a6cf-4560-9dbf-08dbf7b98b41
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:47:28.2373 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ormTRYNp+fQ3ZDB3v+5WrGOuzaE+F5psXFSh5yrk/8oW+iWlqXb35ZkUnH50NguM0PIjPOneB1bZ74WkhTg1vQ==
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
 drivers/gpu/drm/xe/xe_vm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index a5edf5cad369..1c621f073d70 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -452,8 +452,7 @@ int xe_vm_lock_dma_resv(struct xe_vm *vm, struct drm_exec *exec,
 	lockdep_assert_held(&vm->lock);
 
 	if (lock_vm) {
-		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm),
-					   num_shared);
+		err = drm_exec_prepare_obj(exec, xe_vm_obj(vm), num_shared);
 		if (err)
 			return err;
 	}
-- 
2.43.0

