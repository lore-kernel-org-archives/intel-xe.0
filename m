Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12261CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:08:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5FC210ED6D;
	Wed,  3 Apr 2024 15:08:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fjV8Ll5G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43C4610ED6D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 15:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712156905; x=1743692905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=HXQ1PLf5kPPJWOlYvC8qjGt1c9eWviaBLM8SEzkfJM4=;
 b=fjV8Ll5G+lGMsEENyzs9E5sB/HAMXQauB0s9D/bIZTmVn9OFDQmZA2au
 wQ4JuCJPiG/HbWvn0CerdVSnj5rDMt3slcpQ1pMw77FJPz9xvJ+KS3W1/
 ebxiXKg7bJFWNRWNCx1Xx5YmaG/3SIgAYhO1++DwnPXR6Gv/FDnkvHQu9
 FS5PEY+rE812w2GOojmEqxBdMuWXiH0K4cNxiOMuGLZ1PiXYRbEnjWMNF
 rVQLjHp7+yWPX0BSHsibe/Y3kHnU+v+x25rJ20Z7UZLuxtod1/3E6bQyP
 ysFhG8H+qdwFSMIjApQ4Bbf4v7eHIYdlZzZK32Fq8aIeaFvh0V4rAb0C3 Q==;
X-CSE-ConnectionGUID: A138YzVXTnqWrx6BrxeDeg==
X-CSE-MsgGUID: Ebqn70o4SFif1rUb1nIqTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="18007691"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18007691"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 08:08:25 -0700
X-CSE-ConnectionGUID: wQZugnerTLO9J7SStmSEcg==
X-CSE-MsgGUID: xLLPtuwBSwSdSb3fiaSc0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="22934137"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 08:08:25 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 08:08:18 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 08:08:18 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 08:07:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NUiGSthBLsKAFUCZtfHjw7s+/7e97KJlIVmByPe4YVx1ATSLgo9oIvV+QdjoI5sAOi214Q8JuyPRzJs+H0xFmgAT/mr8vdjGOti7cOnKEUxMB+LnnPkaSKvFlXVaxn8nzDBHy6avtqWQzcZYoIVtTK8OhEwR7fqPFXCOwvwU/Jt1B0HKgXmbIom6Kht9dq4tZPUkLNU8z3Bd4ymGBbl2/+u+qPY9CIRLY+9/CzlYQi3fKU+6SVtw9owmdhVinfMDY9kE4rHp8gIG9wRWpqlN3cHND17Skm1/lS91PC2lDCku+BrE9BDplH77kQjbmTQJ4afiPCWxow+op4SL501LOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v32lKfdPRVzlKRDHs7sgeTAlzBt4kwqz5rubtWR3+Ic=;
 b=Amu7JDEefkW+y6rycPdNRsJcQDFAdFxinJROzqag2ncDyNj99GiMErcpq8f526osW5Q32kG3vpkJnime4ZC26NOTRFKKw8yeB/ug/byuGnnxv71oop2N4MWApsvM5S3Snij4PDgAssdiOdSt0eZoqr1V+x5D/bbwmvupYzKG9dgHS+Fn7arsgVzPCl05B72aH/2bvLpEQ2Y9LyOaGcGhCH7GYrf4rKkr7QaQFVJtxxjiqR7BnSsmJ+QOOa+YiBL176hsoOtPRDXRjfl/hPB3vqXynfypm2zYYnyAjy67I22mltMh3A8ZSVa/et1jJjXJIwRMP5xanNj4YiCN1sG20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW4PR11MB6689.namprd11.prod.outlook.com (2603:10b6:303:1e9::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 3 Apr
 2024 15:07:44 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 15:07:44 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <lucas.demarchi@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: [PATCH 2/4] drm/xe: declare wedged upon GuC load failure
Date: Wed, 3 Apr 2024 11:07:30 -0400
Message-ID: <20240403150732.102678-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403150732.102678-1-rodrigo.vivi@intel.com>
References: <20240403150732.102678-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0192.namprd05.prod.outlook.com
 (2603:10b6:a03:330::17) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW4PR11MB6689:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zi3iPOwXlFa6CvzI6Fv5vEVfbLzHyVs8xY5NCDvWqpx5U43hLXJEnd580VLUD4ykiOpeSH0eBhZC5/AfXzGB5FgZa6b87Fu8AZ2Io9AdkLmHmVFhaOzhyfRnzvGDv+M4QMFe6S3kzAx5WcIWDlyaU3M4Z/s3SriP0V0zUGLZS+OuITIlJ7YHugew/18lMozt4McDtNZ75Ob24A5WXKxvdsoCpL/y0ggvl1j7qu0Sz5QZ8Hoxzf4cbTcHJpGJaqZB9EiIoCR2z7sc4UJa7G8UC4Zhw0i96QgK+VcAQQA+DQAxDu5dceqWsExnB2xINqpEXIOpZUcVUFRhxjKtn7QOv69PedBFDAdL2YL/CfBnEhqADM2mrM9ZwjtmEfS5/TxXoVEPctD6iLO3KID89h95PpjlhA78Ik583iGorghSb4P48KCHmF28oRggf9SvqXFAeARiwE3kNEkuXaZ/o/sUMJWsKCboYbilTLt7MxFP2CDN9Mui13k7BcL5SDz+7WYs7MEcgGGdLpM0ZPVlOgdWLnnY4Ywqca5B91LT1rzgL/fc8EWHo+ZTX/f1UmKm9LsOVvGshtfTcewZbrsRj5h4be8zwOuaEzPWLfBgShmB9Q6cv56RiySA2Qi272Ht67FLXtuTUoEITxqaY96p2Q8ElsS5fzPUrWdX7mQU69nhkuY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qe+dyyqBTzjqcrYU9U9L10Xs0maHXjZprxF75t9/PWoWMrTHggPrMEFJTshJ?=
 =?us-ascii?Q?1zlMKRGbBfzk7kVvf/kyVWdn/i4g1UIcWKwJQxdfFqBL8P8yLw5WnfGGITDz?=
 =?us-ascii?Q?juw34CMFElFhP7Obt16SFqrg0Y+sU2hbkgDdT6RJnmSxa4mftJxYL4PHIZAD?=
 =?us-ascii?Q?pNknmmBp3xwqdrqyDuUbrlvxwbYnZ2qsFh5rlbiyJGm4h014apjQ4MeuZN3W?=
 =?us-ascii?Q?tLtz8954ux1H9iqIVY+1bPky4bVCN+yGB7NkZAPchC00uOjtCzyxiG/6GPjY?=
 =?us-ascii?Q?9EajD3othU/Fk/i0v+edj6sM2q+Mit1K6iWxTeYRnAXaG9fNOg/H4GSR6UCU?=
 =?us-ascii?Q?ZXsrZ4JG2vM9eehacwsHXJDHwtu+BVrdUarGhpBKZedhbAAADzdWlymmkk3C?=
 =?us-ascii?Q?AH7XBjoGpCDAFM2hSD8MRtnycfJYKJTsi8ucMa/doF4YzKWZ3IJNSo6QrP2p?=
 =?us-ascii?Q?UOvMk9Z7s6/sWSHsh24SMDUIGi2oa+ADZ6JHxqGPUniXBPMUYp3zL3odju8v?=
 =?us-ascii?Q?Rqq/VfrQG48uajQMkAPt1l86BpUSZaUmjZteyZKcXsRU03cveC5UfI8SvkRB?=
 =?us-ascii?Q?4bVfn1/vNOZq7VULk6TMTfPH6W+RoDMrfnh9/LWZGiE2ujSvJ0Avm9NS9s2b?=
 =?us-ascii?Q?dY1+fD4uhrQjcYdc+mnfZxndsWoEFPbsdi4Wvi831uV8zaqrA8pwN+IS5ROT?=
 =?us-ascii?Q?4NsbTPC/gyzqOTYkOSygqFfPf+YTzpzFpRe8VKaTPUxZn6iIGVZjpUlvqsli?=
 =?us-ascii?Q?7GsIhlpU1krwCtx1ZTfs02jSsl7pGdLmURGP6n0pcEY3Odi41XrbV5Rm8428?=
 =?us-ascii?Q?Oetvu58O9UABi3ElFCKdgb6+tJ8c3O+esAI0YJfpVBzDs/N7sEHTf6W7zJnN?=
 =?us-ascii?Q?LCq2mtfgmTVPAEss6B6GDU1OR53bi+YrJEbee/9y/SGUsrWjbVYVeoiSXz8a?=
 =?us-ascii?Q?N3SH6b33XqiFInCoXOsEwu0jwBl0Di/ZTnh5Pwt8wtfY/XU+70KWNXXwoc0V?=
 =?us-ascii?Q?2BC+De/d4PP75vwRhv60rCHgsPZU/GycuXhkGmmi4DqL0gX+QorMPFq7DCSx?=
 =?us-ascii?Q?YkBl42racCO58GiESJjDA3pu+IBLfdmRUufA0DadXKus2VM1s0hInrRDyBsi?=
 =?us-ascii?Q?9BPde2ldlkZLMSW1aFzhjQBIyly843fAlJIcuB0WUBKq3D0U0AqcKusVwDyS?=
 =?us-ascii?Q?x3PZ8xIXG2Rrxv6uUJw5FJ7aF6WXUCzP4BWx5AKEM7z3lyOr+M+C8dm5N3/5?=
 =?us-ascii?Q?yq9Q/Q1yg6Lamm+O1aYNxJepLDtIFr83hJMFykaDkJY8/5mNEExo/WRcKsKi?=
 =?us-ascii?Q?vsm8kShmGO00JJdVdAai810XuXWdkrU4eZXd6/7RU8RldclAzcjarkT9ccJy?=
 =?us-ascii?Q?NWhaqrV4sLv0hOnhBvciZdqHu7y7VVI6U4+jXxpeKgs0ujr9Blhjj1u0uOyj?=
 =?us-ascii?Q?P3GgD7zIHCeZUSSgsCvf1ZShr4jCmRzp0Z1GdRkYg1Bvnm5Tm9yvDO04jg5+?=
 =?us-ascii?Q?tT7gLJ2LW3LWrHvPK64QbSfc+Ol2idfKnwccj7WKMithIrXRk/7LdjXMvMGJ?=
 =?us-ascii?Q?9QtlLOT3u7BHdkTn3ZKAZsLLLUbdHVQB8oD1Jkig?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b5d0ef4-8b86-4ba1-84e9-08dc53efd06f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 15:07:44.1896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KChyzQlCNtcB9H/Uk/aOXghpe2cjUaqyZ2MHKw9z1GwSjGlkM/EbxG3ajWmgG9Jga21FA8x8cJTqFkOSqGnABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6689
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

Let's block the device upon any GuC load failure.
But let's continue with the probe so guc logs can be read
from the debugfs.

v2: - s/wedged/busted
    - do not block probe or we lose guc_logs in debugfs (Matt)

v3: - s/busted/wedged

Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 41 ++++++++++++++++---------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 77be3bc2d7c0..a7cd65a9cf32 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -452,7 +452,7 @@ static int guc_xfer_rsa(struct xe_guc *guc)
 	return 0;
 }
 
-static int guc_wait_ucode(struct xe_guc *guc)
+static void guc_wait_ucode(struct xe_guc *guc)
 {
 	struct xe_device *xe = guc_to_xe(guc);
 	u32 status;
@@ -482,31 +482,28 @@ static int guc_wait_ucode(struct xe_guc *guc)
 	if (ret) {
 		struct drm_device *drm = &xe->drm;
 
-		drm_info(drm, "GuC load failed: status = 0x%08X\n", status);
-		drm_info(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
-			 REG_FIELD_GET(GS_MIA_IN_RESET, status),
-			 REG_FIELD_GET(GS_BOOTROM_MASK, status),
-			 REG_FIELD_GET(GS_UKERNEL_MASK, status),
-			 REG_FIELD_GET(GS_MIA_MASK, status),
-			 REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
-
-		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED) {
-			drm_info(drm, "GuC firmware signature verification failed\n");
-			ret = -ENOEXEC;
-		}
+		drm_err(drm, "GuC load failed: status = 0x%08X\n", status);
+		drm_err(drm, "GuC load failed: status: Reset = %d, BootROM = 0x%02X, UKernel = 0x%02X, MIA = 0x%02X, Auth = 0x%02X\n",
+			REG_FIELD_GET(GS_MIA_IN_RESET, status),
+			REG_FIELD_GET(GS_BOOTROM_MASK, status),
+			REG_FIELD_GET(GS_UKERNEL_MASK, status),
+			REG_FIELD_GET(GS_MIA_MASK, status),
+			REG_FIELD_GET(GS_AUTH_STATUS_MASK, status));
+
+		if ((status & GS_BOOTROM_MASK) == GS_BOOTROM_RSA_FAILED)
+			drm_err(drm, "GuC firmware signature verification failed\n");
 
 		if (REG_FIELD_GET(GS_UKERNEL_MASK, status) ==
 		    XE_GUC_LOAD_STATUS_EXCEPTION) {
-			drm_info(drm, "GuC firmware exception. EIP: %#x\n",
-				 xe_mmio_read32(guc_to_gt(guc),
-						SOFT_SCRATCH(13)));
-			ret = -ENXIO;
+			drm_err(drm, "GuC firmware exception. EIP: %#x\n",
+				xe_mmio_read32(guc_to_gt(guc),
+					       SOFT_SCRATCH(13)));
 		}
+
+		xe_device_declare_wedged(xe);
 	} else {
 		drm_dbg(&xe->drm, "GuC successfully loaded");
 	}
-
-	return ret;
 }
 
 static int __xe_guc_upload(struct xe_guc *guc)
@@ -536,16 +533,14 @@ static int __xe_guc_upload(struct xe_guc *guc)
 		goto out;
 
 	/* Wait for authentication */
-	ret = guc_wait_ucode(guc);
-	if (ret)
-		goto out;
+	guc_wait_ucode(guc);
 
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_RUNNING);
 	return 0;
 
 out:
 	xe_uc_fw_change_status(&guc->fw, XE_UC_FIRMWARE_LOAD_FAIL);
-	return 0	/* FIXME: ret, don't want to stop load currently */;
+	return ret;
 }
 
 /**
-- 
2.44.0

