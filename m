Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F9FC636CC
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:18:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7CF510E247;
	Fri,  3 Feb 2023 20:18:21 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4400B10E189
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455500; x=1706991500;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FMrKLIOwSav8GCd4gxWkFr/yvX0gKqjpdlXoH0QkV/o=;
 b=cXUXoMpYHFjZ0lO1Sx/a6cINs6RMqiohzUIWLdAw6YKsXB0d5/vVd5pg
 DLh9YfQjM1abXsNpgEmvL+j4lLN6qgMpI/Nz48Gzp7J3FVQdPR92KxZJJ
 rPttI8R4edHUlS3qUc7InwPKG180Mdx+1h8I8X8jTEbC6sIIerlu5/FSy
 C5jghKb7XyIFybwsuVkgeWBYxtTh6JQbaVgOTal/M16ZLTXnsl7RrUhvn
 awEPLTz+evtrp3UzsjguA8O1JbFjd2Yd2RATJ8OV6V1OGozQMJMbn2zaP
 Y9YB0Bd3v4NKlo7il1cZdkQgl40LljPaI6rS/G/xpYMXbjDpjPlgLMpK5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328861899"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="328861899"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:18:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="994630142"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="994630142"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 12:18:18 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:18 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:18:17 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.46) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mj3xkreyk0OcB1vyAPHAbbqo/n8CJzlrfS147r4D6G6vXvC1TsgOlepbbW5FYJSVM6jlZu33X+4sQuzL0goSFhc2Jrw4newsUiGffwGGH7QgtcgCtv7hemxs4y2fn+9/fsuiJRtT/YlF10soFTNnOxQJVd6RyaMy9Vln5HdXsyPHA1f+XE0IGj2eDLhF+xWeHyT0uf2MUJmg7mU7LQ+KNn9eF0qhFAJswbcQwtgUUYFj/r7uibH065pmzZkCG3KFoyiLft4WJmoZH8ixHjYxsp0vvrHSOs84Tb7tz0dlrjxlaorFVo4q3p7kB3f0mGKpYJaYSPjzQgfnv+TCjwuToQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y7iGwMHELtQpPfc2UN63Hy7ecOTnzNazCf42yYhEVys=;
 b=PX2dxnj/8dvQ0h/45PEcISbAO93ZTui8FH/k61czk2F8KBilb6VtjreqCyi5Opx2HVzDuV1wZ+I4nsWopzmkheBtVF4qwE62Y4u4d2akLC1AFVa8HvpnOuYwkx+71Zftf7RP3woot5DoXHVBQ/a5r+C+mLPcbxrj80HVoN9M+5tU78tpPGVrvmPvML87sIdlfEth83UKK7tupzKdwaieE81pgoNFDUAJ8kZwHaLWPrCuXXLyMnicwQfOTTs2x6/bxNPRxkTvZCwoOvgXynGNrrJAYYCPLI04oA/XhjrFUOIjf8E5h0D6NHyewJ7/3Q120gi1sXY4cSxZUur3mNm2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:18:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:18:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:17:57 -0500
Message-ID: <20230203201758.573775-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203201758.573775-1-rodrigo.vivi@intel.com>
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f7b34b0-29da-4caa-0b50-08db0623c8aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IRV5EknWhmsOwTluuzuY1c6+pSdLoYBCBE1m1M0Vx8HwYkRJvJxBxFt7zws42LUpyRA//n4K6Rg6VP6Bl1PdRsrzgP6LW5IBe+Bmy7pfksxaZLChoOisWwrHB6EbN+xnHeFNYYEDspif6CSCRonOS4H9QHvZeiPI9ZwaaQ5vPJAW2v9MR+/BJq+30OhDWR+kjZuvzsNrSGD1q48PbtHTeXa+nrIqAgCmPp1BZo7UuDyhQqCzXQIX1nwKYaObROKK2ExIKVD8qNdNi+cru1WLfpc2/dd4i5SRfeGSY+quEkAncDzvMNlCphcI8p3Hk0G3prdiTMsYjea9ho0zp6dmhM6KADwjc9SLlnd5NOMOokQRBQzMFGbw4nwHxc1M6cKcOECU+7IqsaxplJEpHp0lj0T/NPS+dfPwcSbiF3dMQtXf+Nsh0TZD6Ss4UaQTpu5YXBRlcc7csivJACR7kRCjCiNPNNfcqXicjzNUHNiF1l57jP9/ubX0iO4vxyqRV3tQ9W44xDKYjtI/vpP5xa2WtvqLOyi6WCuc8ptA+eY7Bu0vIaW6wHydstQoIw9FWS2no0YBz7Nul8DEY9+gjMsTmTcArtG5ujP5EVYbQsLTNQB4Ds59GbiWAOgzFOhBdOYmk+P8rIR0VDtssKlvK+hbjjiOEg+shfwOCPfRncfAGfvF01jPfC8gcPVbHZnLnJ/b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(6486002)(6666004)(66946007)(66476007)(2616005)(8676002)(8936002)(6916009)(4326008)(66556008)(6506007)(5660300002)(41300700001)(1076003)(44832011)(36756003)(2906002)(26005)(83380400001)(186003)(478600001)(6512007)(86362001)(54906003)(316002)(82960400001)(38100700002)(550224004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wh86sYH5APE6j4ypNapy1h0Maa0zvmReazCIQhyKRGistnZXqJE79hryu2dd?=
 =?us-ascii?Q?TiotcZ9QahbHedUVIbTTxVD+FTH1pA+ISszZT3coiXRHlKhAj+8LaSVQ1DAS?=
 =?us-ascii?Q?XsBJXoQKbtAv1jNRb9HOsWJU+N6afvOssE/OOzCMjVZ5o6/8okLE0eY1wUNr?=
 =?us-ascii?Q?AHTLGrjaLlRPJdiEcjzl9dq602VIJ0EjQ1AMX/oyFhepx6m0eqzYSAnByRpJ?=
 =?us-ascii?Q?9Xnh4w5Z1Ye0o/XHNtuPFQbJe4DT5IPMkHujSSwxRVhNUNkN8g/WLjvBh5vu?=
 =?us-ascii?Q?RdWhIZ6KobIN78PwdDcSuiGvP1nJGQo/ARMCDLBuvyaMe7zUV2Xxc5GwlkAo?=
 =?us-ascii?Q?XI1CPY9vDQt5r2k2CfG11zw15XC2pCWpScBxis0zmtrdnYD0/r7eOD+iREe7?=
 =?us-ascii?Q?jC3y/sglCxW3UjfRQU1i3JHt4CpOZ0jj3VC+rIINf1XUTFi1S+ioD/Vhuxpr?=
 =?us-ascii?Q?Hb7PmQQiP3WAn+4epAr4shP+m0sCSk1Me8MM2i24W6V4QM9m3CAaY27MFSUW?=
 =?us-ascii?Q?8D7LxnaDfjIDWos2+K6Gx5N8jKJaD9YhFb5qbOgLOQczVWJTc9lSznL2UbFj?=
 =?us-ascii?Q?VszYZZlNqJC4jdrmVBvNsyhw/M+eHMsH9kkaMbKEClQvuzIw8pMVU7y3bzR5?=
 =?us-ascii?Q?llUFn+NbbpiLN7u1XHYR06s+y1cb0e1CzcKbNcFA/Qquj9AUmEKS1O4u8h/H?=
 =?us-ascii?Q?RkP/V1iQRtkFUfqJbLK1zOYRu/mrT1/eTeeO0Btiw1skxz+MUYZRci0l+ml0?=
 =?us-ascii?Q?TRlK8HdbKIq+p3RdAxnIaOC2EYTB+Lcv0QoOoGeaTmPPvK4UQh86AzLe0q/m?=
 =?us-ascii?Q?AYGp99p27VoNqNu4vMaVFJOicCW1il/F2lgk0Pei+XCPMSkwXSG5ZhovXSQX?=
 =?us-ascii?Q?p+MljktQ4+ZCX1w5NeBaU8WQDth7qTkFB7h6Y9/RL3Y01T2OYl+pCjWF3oWr?=
 =?us-ascii?Q?xV9lk6n6B0p3lQZ90KcRXn0fTj6BVhjb6TOmmnIVKSVO/NWI3NlHnGI+m4vf?=
 =?us-ascii?Q?HgC8K6lXyawcyHjYB6mjLkxAYr7msXpCy45+Q61ABqJARegWod0Y0RqAMrb+?=
 =?us-ascii?Q?L0PAHfv9Yevf8zpFVv7rxfu7nE8oc2QX6/yt6q4ZUHTedSbR8Hdqag/9PapY?=
 =?us-ascii?Q?kWW6Ab95YsF+F/yNxlszQxKNR6hSp15N6ej+SfwtOIHGW9HHvbxUe5w4U5XQ?=
 =?us-ascii?Q?JsQDBRNQQmwo/VpmrgiKxxOdR6TC9vqylvrpF+2lIkQ/SjNqJGuN2pmtXSkc?=
 =?us-ascii?Q?hv1NWY4Tg4D86fljR99L2D+6RuyHGL8m2PlRDdKLBCoavlXuIc1B0M3S9uRp?=
 =?us-ascii?Q?492Yn+cSvyEh4Ud+3jf7LQr6PPisC0YcE2k7ROKVIdS6ubsA7XzWquz/hVmL?=
 =?us-ascii?Q?4Jm0//17ydf+GtS405HUiMQ47kQPEVEhZbLs+G/V1fM0bGh405dLpunlNtMS?=
 =?us-ascii?Q?hTwNzFNjtB6JJyAswU90HToEJNqqVbegVmKd5D9ZnnClAoEaiYg4MII/K7y5?=
 =?us-ascii?Q?IEHOZE4zBrchDapX1Sl4h4TAmcAUmnTy0hvR4XEP4Zt/yEbwPcm+xDsW4LR6?=
 =?us-ascii?Q?8F6PYrWfcMqTGX7XvJToL6ZQ2p2TpoIrNKKULS9wNGRfIPiOYWVAf0PnBpGy?=
 =?us-ascii?Q?KA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f7b34b0-29da-4caa-0b50-08db0623c8aa
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:18:16.5609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZYv2Yr/ObtkKTq1mMtImVq/5ncRaRVfgbfcVC0lRnjhx7kReo+V0WM51Lmi77rJLP83K3n3BFymdAqHNWw6d1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 3/4] drm/xe: allow building XE_DISPLAY without
 ACPI
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
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Mauro Carvalho Chehab <mchehab@kernel.org>

It is not needed to make XE_DISPLAY dependent on ACPI. All it is
needed is to not include intel_acpi and intel_opregion.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Kconfig.debug | 1 -
 drivers/gpu/drm/xe/Makefile      | 8 ++++++--
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig.debug b/drivers/gpu/drm/xe/Kconfig.debug
index 6f7123e90563..6726caa63acc 100644
--- a/drivers/gpu/drm/xe/Kconfig.debug
+++ b/drivers/gpu/drm/xe/Kconfig.debug
@@ -99,7 +99,6 @@ config DRM_XE_USERPTR_INVAL_INJECT
 config DRM_XE_DISPLAY
 	bool "Enable display support"
 	depends on DRM_XE && EXPERT
-	depends on ACPI
 	default y
 	help
 	  Disable this option only if you want to compile out display support.
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 76cabaee562f..3d716b71e54f 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -132,7 +132,6 @@ $(obj)/display/intel_%.o: $(srctree)/drivers/gpu/drm/i915/display/intel_%.c FORC
 # Display..
 xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/icl_dsi.o \
-	display/intel_acpi.o \
 	display/intel_atomic.o \
 	display/intel_atomic_plane.o \
 	display/intel_audio.o \
@@ -185,7 +184,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_lvds.o \
 	display/intel_modeset_setup.o \
 	display/intel_modeset_verify.o \
-	display/intel_opregion.o \
 	display/intel_panel.o \
 	display/intel_pipe_crc.o \
 	display/intel_pps.o \
@@ -209,6 +207,12 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/ext/intel_pch.o \
 	display/ext/intel_pm.o
 
+ifeq ($(CONFIG_ACPI),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += \
+		display/intel_acpi.o \
+		display/intel_opregion.o
+endif
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
-- 
2.39.1

