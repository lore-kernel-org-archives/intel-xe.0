Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B367C61DA4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Feb 2023 20:18:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40B2810E0A4;
	Fri,  3 Feb 2023 20:18:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EC1C10E0A4
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Feb 2023 20:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675455504; x=1706991504;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=u2RKDdhr8xkf/b8krR46zor4U/Hp8tbVnqyZ1xycdto=;
 b=dX3rkuGtnS2hwDWRUKrkCTaD8Qmg3BDJPJ34imBdBsM0CvbWxfPjEdNi
 HdhWx1vLZYnfCb2AmPGDm1n34qE/kiDjjO6LtUHNmr9DNERIFhC43JRX+
 wzCrjAHjSDaUl+hohZjW1VWDy8Qcd6ZDLDpaoVrWbZbtZ8h+UxNaaeoRm
 lsAzp0uQliX5iXCjawhnQcxOxeRjilqzjdQDUlNBNa8gjKBI49rBdjBNK
 cA97P7DuhVJnuhK83+nY37wad9S/L+cL4L0SiikP6hcrhJ4M26DfZA7gD
 8RzNn/SU2Om9FO0dXCmBKtlzY1ACBxRIKyl/Jh0IZARHUfKFnKesiD0os g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="328861925"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="328861925"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2023 12:18:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="994630150"
X-IronPort-AV: E=Sophos;i="5.97,271,1669104000"; d="scan'208";a="994630150"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 03 Feb 2023 12:18:23 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:23 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:23 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Fri, 3 Feb 2023 12:18:23 -0800
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.41) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Fri, 3 Feb 2023 12:18:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fc586OEaS9j1GxyOzQ7pOtwWcF7dFGGHo2mvM2v48t2KPRK+VjMKqZjInm7FroYjwTt0VAY+2aqafu3LkaxLd8Q68eWZFfk051RhZ//lC/Yrpv+C9BhH8P+z9WXmbBKZyPpo6bx4Ol+zr3RdRk4YwFQACxvL8RKncwUirSZN0mRS0AJXPstMx73j5WisWV2CcyEMzKCBn3RJPf6Hlh/oEk1hobCXYZWoASG25uykFJTOLNpqmfJdImdQ+voVZS9KgiUYr+nfoTpXplbEjJ2/fI4yVMmaMPeiaUJ0UMBSCAVpdQF79Cf9JYcr44Hb8LVeGp9KK+DU+bwTy0vKAElvfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jFqCldr+2G2srWnRF2IwWcI3+oWo9yTwATD3RICKdF4=;
 b=EFPF295IT9bzmJUSJmrHwoRWDp8pmDT0p9GvSrzGtsS3DEgau59+ANeNUWRSQFpbIQUt3qlP+plcO3+cwOmDSPCRrzh0jdtvD33bJHjlR8nsEGjqQfOw6ROA+YLpoS055wENCYxIb9MzgIu2tql5r5b25X2O9LsAvfD6qUyxoNBmSkdb3UmWxttWJxcShvTMxljNw2xY8VWqdRY2Z926CUbIDUkb+lUJYQCXfx//tNAq/NG4dITv/bZ5OtSCrBAIbRkJxwpF+CfCBqDOlq2HqduGHruoesEttcFdBDT/Ep8H8rCOyA++ojs0SXMfBmDypuSWx04hTlgYF2LXnPK3jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH0PR11MB5706.namprd11.prod.outlook.com (2603:10b6:610:ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.29; Fri, 3 Feb
 2023 20:18:20 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::3bd5:710c:ebab:6158%7]) with mapi id 15.20.6064.022; Fri, 3 Feb 2023
 20:18:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 3 Feb 2023 15:17:58 -0500
Message-ID: <20230203201758.573775-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203201758.573775-1-rodrigo.vivi@intel.com>
References: <20230203201758.573775-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0075.namprd05.prod.outlook.com
 (2603:10b6:a03:332::20) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CH0PR11MB5706:EE_
X-MS-Office365-Filtering-Correlation-Id: 73500507-dc2e-4bfc-17e8-08db0623cb1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LgUc3rMcuwCg0QwG++/t5fbQesfLspyRJfj5Ag/liUadUVpzsH0/VzAYuoCO2vU6nFOKRD0mxshnpO89EimnPMXJG8trfgRDVskDgmdWxVLCP/Hk0via67pxQOBdL2JV+RKdDkPDmfU+MssWc5YuCu79qFrnqaeDmlodjs6g1Aal7Itlzmao7ZJN/B/YOBGxITiLZanx0Oc2Gi0kfhIMAqpu9P/aTIgwj88jTxNTZA896gjHRYXRHNHIn7O21eRVnzdKNhSyRVel6hx+cb8PlFV442PIcMiONwrbYmQhB/Z5ofOf+mHlcMwX4FScBXW9POLPg73lCs1x2QQOeAwBTbvp7gSkWwmigRsmSmz+d/IHN/EiZTmZFtMxONxzQb3HMf0yCLUb5uC6S7EQ3hT/9hJnsRCs64602ggRSDQlwLaOrZwhVVgK7Ap7VY78ymNeG9owVl/aIJsdXklumX7UcCx1Q2YNmk17ILbOo7VWmUDJPwnJCENwM59Uilxqa1whUpcQyarmGARxR4yoaaM2VhTCzAFK9ddtbZv/Evt6sDnfzZiK1OPDJqOm7X5ljURbPnjO/5IcqWHLamHQPAQB3dNeup+u/xcs/D9JG0OEcobFWvyaFtzxaS03LnmiCjKmzW8176HLurKci3eYleIMWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(396003)(376002)(136003)(346002)(366004)(39860400002)(451199018)(6486002)(6666004)(66946007)(66476007)(2616005)(8676002)(8936002)(6916009)(4326008)(66556008)(6506007)(5660300002)(41300700001)(1076003)(44832011)(36756003)(2906002)(26005)(83380400001)(186003)(478600001)(6512007)(86362001)(54906003)(316002)(82960400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?e+y+z/BiIma0pGydoUv+Jb+Lno3HAi7y/N7pMqAJUfT9FNZaeynAm3VBe7sB?=
 =?us-ascii?Q?29KWtyuEXlvvAezDZkvo6yjRzIJa3+IvU7wGpxi6R5MbSsSRLHkTXm0DMt86?=
 =?us-ascii?Q?pwT/bgGGMznp1Omfn7eLnWEWu0UM9EbxOXbhBf5myS6pVhJtD/2Qjjc0a+XI?=
 =?us-ascii?Q?QknGmmfMH/Y+9e/zf5zXO+fVX+UfcThpvq3nghJki/U54WQWS2ozxD6QGwjn?=
 =?us-ascii?Q?dda8lJLR8WeQ9lOvbL4M+kNYmk+hdrMHE5Y2CuzlgHIHe76aEvWJKUXag/3C?=
 =?us-ascii?Q?QKh7192Oe1aaYp9+0Ht7ZGVVeE1UkzdwH1EZEEENjITQ91dm8kfz4Uc1sxoP?=
 =?us-ascii?Q?NwtqwiU1uG8rus6covqOghh2I7d6eW1xuXb4Rvy8RxFGonL5PhH/1q3a8dvg?=
 =?us-ascii?Q?L3WW4iwmzLYqGZIRaad6jhfUdGEnixbDL/eE5RW8SZnThl1L9nhO8Qdn0huS?=
 =?us-ascii?Q?EYf9wrnSUv3tDkB0SLiMMqxlT//c8vARSB65x3nbt6CndaZHOsJhwWLC8tnN?=
 =?us-ascii?Q?MMfGFh9CP+4AwaK52Eazh9to2CDki8Jcm0wmWc1NykPvSQM0MD5Q59xNGc6w?=
 =?us-ascii?Q?8aKXvmQRcftOxm2YmHlGjOMlv+TlcbpL3u3v3oGEP0nWSq+Aun94kD3fn/CE?=
 =?us-ascii?Q?oQkuUW4fi+17FUNwahSHPgpMk3p+5y5D/Wtsfsw4yq+4w62YEmKKcuoGh7fq?=
 =?us-ascii?Q?B114q1eNZd/13FqBgw1fz6A8VZfyertgFLmhLuVkBuIJk120UDZITDl8cm8Q?=
 =?us-ascii?Q?RrHAFIlUuZFXoPa1hwlE6w6SM7stldATrDsD8L9l+bJM2eTE61dcTNPeO04I?=
 =?us-ascii?Q?zPg9Pa4HUSkuxghnfCN5ys5mvwPkN2Rfv8nFtz/MvR5BOsPj2GJqr0O+OWtc?=
 =?us-ascii?Q?qnrpgWBbPLbBeVUtSypI1urF9Z1fAMFRzjm3AEJ8odotgvCe+CPzAKdAa7bQ?=
 =?us-ascii?Q?cPlqDf00pgTWuCkCJ6CftkgWIfG2vgZri1vWF9nxrFwZ2WeCYVyVl6Ggm2m2?=
 =?us-ascii?Q?emdYuWJ0yF4xqpSj19TKe47JI8ssLyf3y+ZTCR/ZmtXrwXj8zH5XnaAv7NMt?=
 =?us-ascii?Q?ur81E8CuGx+1eROOAkR4ipu9Swt2j1sE7EZDeyAKzHIa0jonfCDikNmyPsn1?=
 =?us-ascii?Q?EnA1FgX2dEI9MZYwc/0EQ3/QS+o6O3d8nRJIb1i7lSK+K8wb/dxe6JotZ5Cv?=
 =?us-ascii?Q?S/G1YctGXsBiyMZ80mb8yj1M1na0IC2XORe5D+AkE4VyATIoT0RhWI/1xPpQ?=
 =?us-ascii?Q?rJ6koJG8AOkHs7HXhGn/u+LVJFTC/vBBAIU0nENB7xNqugAYSW8eqwnmgauE?=
 =?us-ascii?Q?SZwVjfC6pNA076x9oI6JFuuAqWgTakVd9DbYtc4f0kbk3kQ4LItqXPeyvbe6?=
 =?us-ascii?Q?mnSP+tKSRwFjEhAycTRuivIJjJIf7MNR9J0z1Kg+TbmPKxHA3XJbAZVXvNiI?=
 =?us-ascii?Q?GBAHUxURKo8UExilEn1eBJ0DfJLdVI5pG9uG/+GlOgs9CoNysq8wG+XGZNcI?=
 =?us-ascii?Q?JXObAYZkpXrl3KN+OxKeqem7pUX2yRMPseVx/p9nEMzDKhM5ifFErvU4Dgf9?=
 =?us-ascii?Q?evGWTvCHvTX13hg2ItNOEdbtUT095wlrgpyw9QAk1Wsg9ihFCbhaYgEy19V0?=
 =?us-ascii?Q?lQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 73500507-dc2e-4bfc-17e8-08db0623cb1d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2023 20:18:20.8266 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7x4uE7agNvq+RP3H7pSOkCxQdiEHbYm7m5o1aPU0UW0MBq0/WDIu0Fqi3VeO29JwRwJ7EiKGagb94mJMaDR0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5706
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 4/4] drm/xe: fix DRM_FBDEV_EMULATION dependencies
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

The intel_fbdev should only be added when framebuffer emulation
is enabled.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Maarten Lankhort <maarten.lankhorst@linux.intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 3d716b71e54f..74fa741b1937 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -170,7 +170,6 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	display/intel_dsi_vbt.o \
 	display/intel_fb.o \
 	display/intel_fbc.o \
-	display/intel_fbdev.o \
 	display/intel_fdi.o \
 	display/intel_fifo_underrun.o \
 	display/intel_frontbuffer.o \
@@ -213,6 +212,10 @@ ifeq ($(CONFIG_ACPI),y)
 		display/intel_opregion.o
 endif
 
+ifeq ($(CONFIG_DRM_FBDEV_EMULATION),y)
+	xe-$(CONFIG_DRM_XE_DISPLAY) += display/intel_fbdev.o
+endif
+
 obj-$(CONFIG_DRM_XE) += xe.o
 obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
 
-- 
2.39.1

