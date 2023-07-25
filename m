Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B173C0015E
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 22:12:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F9C910E1A6;
	Tue, 25 Jul 2023 22:12:19 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABE810E1A6
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 22:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690323137; x=1721859137;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KklGiarl/59rwc+3QcFNH7gww0XXGAZVGYrRsBdu4Yc=;
 b=kXk2eTijHN0APECMQi5q0PxWJdiYX8bu+j2NvRhVZ+BY1PqxTNwlyURf
 zNkCxWo3qHtiUMNUpStDlBXxl52v0iQYDXphT5k/Ds2xq2q4Q5GVxF6oG
 +FB6XtYgQ5P/iFisGNh7WokeswcwGbJmDGX56NFhsf2Hib6aHRSOTgXvF
 cRr5azR0wgqNVieurq1D5oi1iASLEdCu9T3VkbrIHX1rF61Zp9Tp10DFv
 WPVTJPxh20o75fn66MjMGgDzI17n839cnSfYp2HKwk4tkq0LI+omM679y
 z3nVf5aGQyGzRtKM0SJh1ft+W1unbW8tCqCIGSxDCN6MVd5SWQkuQHILe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="398775354"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="398775354"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 15:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="729552581"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="729552581"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 25 Jul 2023 15:12:14 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:14 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:14 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 15:12:14 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 15:12:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XoRLW7cgvzzwKGj8Ln5R+2Xn3Fyte7fL5rayUxwBb1TZ8C/RtKxWn+qFJK6dqw2+OKCPu8RR+DfYrNb2rW0VnY5+g16MPVEz8nFPuL6JMk9AUU+KYCB2yZPQQ93EXb0J6YUSeNXnhWvLPd3StlH7cJaBNBfj9lYHlUnqtJc2jVhdTdrEVZUHU9cRohwUl8e19tIvDHhx26nAwDu34GUvKmcRN8tB0ct1sQeoP12LcPuli0i63TBOwtSshsmJbc2h5zvEr+D2kSmTM2Bmn//bbtA2Yuqp0SHrlqjsbpi2V00FV1+V9OI8sk0vtt3K8hIw6DOS8YMyIN8naJOVrP7W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fsqP8ZVVbVqzc4NtCHffl2zYSL2fw9eZfCq1A5rKUmg=;
 b=ISSrFe1isXGFTDn8AXwFVnz4ab917BEeqRgBrkcs/KzxygPtN27Bv/gSWf/tACXTRjp/bUoEomM2eXw/RNhZ1th6lxA/xuhYrfUSMkJPaccOBQg/4M4IytU34LKzfcY9KZzOm8u+d7tW3LxZYkemTvg4Verbx6KGZz9CpMaRCBaGl7dp13sygcnOjXawtb0ESnqatNFQizxgdy+xioYOaT1rv0pg1fHGe0OOjOW92vpCScGvCbKN/ZzyE36T5CoUbJaFcyhSyTC1SgABeFY53TACJaA1hLiaKGVTu/Nl+jSTaAotzBX41FpaOb85LdZjSE0Xhctaib+kT9v7S4V+eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB6781.namprd11.prod.outlook.com (2603:10b6:806:25d::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 22:12:07 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 22:12:07 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 25 Jul 2023 18:11:56 -0400
Message-ID: <20230725221159.354618-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230725221159.354618-1-rodrigo.vivi@intel.com>
References: <20230725221159.354618-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0030.namprd10.prod.outlook.com
 (2603:10b6:a03:255::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d7f43ad-5966-4e6d-f5c8-08db8d5c2f01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K10Wx6hZFnmfHiW9cZjXfNn3UZSNek39aRNx2elgJxXQ/Ep2JQpCj7t5WSbXLMACrsZZKLKctajqHNYjbtx9I7m3Ws//7A9YNk+wKvhUs3+LOg7RZ5NwN7fk7fc+xF0Uf1tc7GLVtoHca3F050KnQTgUyFWq2ZzoGP0dybVtGUls5IfNmDSAym5Ldgm/yJRtah+s757HvMZGSaZ2XcPQScPOSE9g67TVFiWNtwWLrZy/7xIye9IblSjW1GAWUw09Yize0bsybvBX6FdayAavibacxenmf/ROQRdoyIDJlXPpNQG9IdgHvqhb8S0oK68/0L2m7ISGy4bza26ZHm4PkgV3deG/mqe7VGYy9udHaLjnstdjCOMKeQSc2n13+Idvu0O3ZkXtJXNwr67oVnae+7Mc+32GF9Pit/j5aFN2sQL3UPRLtJm0FBy0w5xh3zUcpCMWAUtaTtEfezK9JPqg3DmHm3nCLifXLkPDMXK24OBnPmoPHgtSEPO2kNhIIr7Gub4FwuxkYNdy/gZbGDfEkItbhXZ4jDhxbF1tbJOwMExvttNvpHYJbr8fYnR4HW20
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(136003)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(44832011)(5660300002)(41300700001)(316002)(4326008)(6916009)(2906002)(54906003)(66946007)(66556008)(66476007)(6486002)(26005)(107886003)(186003)(478600001)(6512007)(1076003)(6506007)(6666004)(82960400001)(86362001)(36756003)(2616005)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DytIlkWmWrlRknNnPiZMlarLDbhv9FztQDmYvv/Q7Rz2O2PzijmJJ/5fAdXJ?=
 =?us-ascii?Q?5UR24NLOneRVmj3s3b6Fo1pCFXvvB2xuTRkFYO4DSxCllOwriHelUZmY0l75?=
 =?us-ascii?Q?ZJ0MXd4G6MI7U5S9kNR8ecZIC0M8aPLCw544Wl9seEYle+Npxon37wR3Kdnc?=
 =?us-ascii?Q?T+lrQ2jfXKDBnBgKZ45NUKbf+5UYPq9tD6JUeIRjq09X0Wherf4Wq3HUh6PC?=
 =?us-ascii?Q?dD3ZPdH2znI99EmUiee/hK0dVaukLqpFHGdXLhiTfyC7tlIGvCO8/KDDDbAn?=
 =?us-ascii?Q?eLfoK5jm+84GIXUEt2mkrrgUkTlQl29voMJVl0NvjnFZqiF7eR8/djtvOBq0?=
 =?us-ascii?Q?COCL03N1DF51KGT076ijaeNVPYOkJ/zkkKKISqwVCMbNheZ8ns8Mfv1nl/1c?=
 =?us-ascii?Q?j8n9Qn4JtPycFhzMl0MZ61gQFpfAut0FWPoK9JgPgpDbTocRimqgbdlFVDal?=
 =?us-ascii?Q?rfVj1KqVDcU+rcQZEDt3y55OnxeZ6N/qom1GqF1/GmyZ4NH0GbSxE0pDIjDR?=
 =?us-ascii?Q?Pvrt8IuPSpYzOIRUDIFGt6WH9S4aPlfatvGbnxDlTeiuW8FENdrTIlMaw3iS?=
 =?us-ascii?Q?lYkwHwASVQpePf10qraDzi9wEaQmo/e+f7mWynye/eIMs5hIfFVLX6VaRvrE?=
 =?us-ascii?Q?emC/jp1xFdSCVKGTND1ex42w0V++HNW4aXEz+aW8dzRWErkr6p21dVSZbFVV?=
 =?us-ascii?Q?V2weaDFMqiWnNf5AYNPzg6EaF63DKxU3deZ8pwy9YRMMkeMeF96C1H9bVJUA?=
 =?us-ascii?Q?C08rv0Wx7ktRva3QssV3FlOkHuoBqUiVt2VNJnX3O/I8/lfQoGsPACZVLYQd?=
 =?us-ascii?Q?ur3A//eei6uhUdvPen0NTr4tVrjCPgwS1zvVWUP7rVGtZ7OB4tuzwbwskxUv?=
 =?us-ascii?Q?LQmH0XjQwxL09eG1gcQnhBHwvf83fChI14CmcjQ65/B3Ufnx3BEk4EzC1Aqi?=
 =?us-ascii?Q?lizHBK0JCRR1pFqoK5GEENVuIX1cMmIGBTfIlgo0v32vEWy3dsCx32TVi5Vo?=
 =?us-ascii?Q?FTTszLpvz8bIGB1KlVsIVudoblaNws7MVEqapfdBF03tGL/x8vK+R9PfNkj6?=
 =?us-ascii?Q?73NGk/fTojZEOZpEc8a3R9Hz97Zhocm4qAfaQpuIQ2BWcG/Yl5ulmdZbeHVK?=
 =?us-ascii?Q?NNopQwV+BAk9vd64Q3nPpsb5beDAFHIRn0K7/sSWubVcHlqjf4KeZuNg+bG8?=
 =?us-ascii?Q?QvyM05adF12u8Yf3Cft6fVDDdcgLMsqOaJOSTk37i+y2NDqRZhJSC+ehAxSJ?=
 =?us-ascii?Q?yjyiWR2Yd+cPlQPVMePla1OK1Amk+pdeORnr7tB5hOXrgZWFuFb8zA9EBUPS?=
 =?us-ascii?Q?0LBgmQDNR6iqf9OhJeroLiZeCZz9QOvMtdOatA8hqHEWgdJizNPWcwiH2cM2?=
 =?us-ascii?Q?qyp28Oug1DCCSkcl5Xz/NI+aiJx6S24p8mbupQw3Abgco0K0UQOaooLeXsbM?=
 =?us-ascii?Q?p1IUHZBVCfidEi9PJssYI2N9qJ92hh4ZxXbaDqFXorWNSAWsa4Ge26PQlO8P?=
 =?us-ascii?Q?ifPmHH4xYBIgYv6n16dviuxt9Ew81yZvPE04F/7qjs2ZSKx5Q6XRaw6IIwz7?=
 =?us-ascii?Q?0Z7HomIIjqr7/8gHCEwvfuBDDyYSz288PTFXL6Oucze9blB0uVU4j8TK7So+?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d7f43ad-5966-4e6d-f5c8-08db8d5c2f01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 22:12:07.0675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0WJMrolGxdBcWf0AMSIIgW7a8i8LRvcl9wz8/6JYgKMnFPVTjhRoN6Rckxx/kBxTLWJkTQkA5iyuobQ4UWMyag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6781
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 2/5] drm/xe: Move d3cold_allowed decision all
 together.
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

And let's use the VRAM threshold to keep d3cold temporarily disabled.

With this we have the ability to run D3Cold experiments just by
touching the vram_d3cold_threshold sysfs entry.

Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
---
 drivers/gpu/drm/xe/xe_pci.c | 15 +--------------
 drivers/gpu/drm/xe/xe_pm.c  |  5 +++++
 drivers/gpu/drm/xe/xe_pm.h  |  7 ++++++-
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 0c4051f4f746..06759afb4224 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -834,20 +834,7 @@ static int xe_pci_runtime_idle(struct device *dev)
 	struct pci_dev *pdev = to_pci_dev(dev);
 	struct xe_device *xe = pdev_to_xe_device(pdev);
 
-	if (!xe->d3cold.capable) {
-		xe->d3cold.allowed = false;
-	} else {
-		xe_pm_d3cold_allowed_toggle(xe);
-
-		/*
-		 * TODO: d3cold should be allowed (true) if
-		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
-		 * but maybe include some other conditions. So, before
-		 * we can re-enable the D3cold, we need to:
-		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
-		 */
-		xe->d3cold.allowed = false;
-	}
+	xe_pm_d3cold_allowed_toggle(xe);
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 592765315f74..add6f7975b82 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -353,6 +353,11 @@ void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)
 	u64 vram_used;
 	int i;
 
+	if (!xe->d3cold.capable) {
+		xe->d3cold.allowed = false;
+		return;
+	}
+
 	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
 		man = ttm_manager_type(&xe->ttm, i);
 		if (man) {
diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index 08a633ce5145..6b9031f7af24 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,7 +8,12 @@
 
 #include <linux/pm_runtime.h>
 
-#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
+/*
+ * TODO: Threshold = 0 will block D3Cold.
+ *       Before we can move this to a higher value (like 300), we need to:
+ *           1. rewrite the VRAM save / restore to avoid buffer object locks
+ */
+#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
 
 struct xe_device;
 
-- 
2.41.0

