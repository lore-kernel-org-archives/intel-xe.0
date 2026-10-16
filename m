Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B63CCF2C3
	for <intel-xe@archiver.kernel.org>; Fri, 16 Oct 2026 19:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF8A211299A;
	Fri, 16 Oct 2026 19:33:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D6C10E3A9
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Oct 2026 19:33:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792179189; x=1823715189;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=ANz/D26k5ZPoTKvyLzoznPEdkYuE1HML7DH4r00lKl4=;
 b=oHylh0kW/A44o1VH9b0jcE6XmFiesOmSkScTneSSVv4hdsiLUUZk+4Z+
 b/gSYljl0gARLOs3kSXx98w/xbWOM/o7cDBaIUmkW65QxW8kty1i9Or36
 M2H2Y9ln8JBqTrHCpy3MIj0GCU7/H2E3ahWmbzY+nRx7su7DWeTTTSiWF
 FtM6sXfnVvUHLG1IvMiMy4yNOE5ni94Fv16adIhPUnu/ks+MbigvLr77H
 49c1q4CwOx6FDpo6tmvqv8cYd81CH7WN4/z8fuvj7AxQkHm67ytNPFthk
 K5Civ9IQzwhm3LO8GJIjvgCmjN/g+HuuxeVR+vE45nRkKEsvFsskhgzuW w==;
X-CSE-ConnectionGUID: F+3d7aA+T0aTCe0TejbZxw==
X-CSE-MsgGUID: JIooNmQwRvyNDmgMgng7vg==
X-IronPort-AV: E=McAfee;i="6800,10657,11937"; a="872858"
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="872858"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:33:08 -0700
X-CSE-ConnectionGUID: SxqZY0f7Q/W6cPvtoWt+Fw==
X-CSE-MsgGUID: I/gAdDCoTHSbQkM7EBXRPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,162,1787036400"; 
   d="scan'208";a="3862785"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2026 12:33:09 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:33:08 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Fri, 16 Oct 2026 12:33:08 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 16 Oct 2026 12:33:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nEPtos2FjPtMuT+fhf145NAcRAh/gsMOIiN29y0Mm9zSGr+nHaHaPtIp55M7Uzg1XWD5197uY8AVKeNk7nfTXNFLFCVHFOP0afsaSYUTj7penO9vJP6SlYILXhT2JrjZGB2L6eSchEJVz6AWuIilEmQCAgEhUDOc/Ly0rIAke8Qsj0hXb/iMoAfqKSABHseUA7vj8RSxwxoLXnMQVIqaoF3dolaPxh7SUdbsihlOSDUh/V36NU+uorwl1TbfDpWHuwS+lCb6m6a1Cr8Cbo8xSAAJTDCQHRzvt5r94RqpgM5BYQCI1MTzWbGd21XuJXsWCLP3Nkmf3qUALWhg+LWpqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D4bVNnMOwjeg/i9ZlhtwGSfcfHvmziAfNYi3zmJ4UJo=;
 b=yjQMDpaqPr4GfY6S73WobA/Gq7t0zItMBxsZfGGhE1vN/+nkCDhhpQEHBj0H9HI0fMoJg33/q0FRQZ2wu3z0Sck7cy3oSiIhC8MDv3utU6EDyPWVlRdArpruA3v0jcOHwzT9IdcZr4nkQJpqXOfGFEXe3/TScPwNRXxlrGqY2WGp5+jqdV0ul/7p0c+TPn2fojSET2itA8/uKmDlfZtH6CmD3iABB+fP17xAEw8R2MlKhc8WEtkjnytGSIPRzI/7srv+xVpdLWh4/UGsDnPkEkVeRH7fRfFXJww48eoT7fYfD/7BhCgZZ7EAGvynJ4RDN9y1X6Ue0l3RRIlAO87UwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7181.namprd11.prod.outlook.com (2603:10b6:8:113::13)
 by IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.17; Fri, 16 Oct
 2026 19:33:06 +0000
Received: from DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a]) by DM4PR11MB7181.namprd11.prod.outlook.com
 ([fe80::89ec:90c8:3170:5f0a%4]) with mapi id 15.21.0496.021; Fri, 16 Oct 2026
 19:33:05 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel test robot <lkp@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Date: Fri, 16 Oct 2026 15:32:55 -0400
Message-ID: <20261016193254.3042071-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016191838.GH578251@mdroper-desk1>
References: <20261016191838.GH578251@mdroper-desk1>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0001.namprd10.prod.outlook.com
 (2603:10b6:a03:255::6) To DM4PR11MB7181.namprd11.prod.outlook.com
 (2603:10b6:8:113::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7181:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: 71f770ea-e7f1-4b38-ee65-08df2bbc4cc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|6133799003|22082099003|10067099003|18002099003|11063799006|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info: Bw9My3EjSWaycJFR23wFuB+OxjCml7cZy1NRaYiaGWB9UEo08wXnbJlO/EeEGjmJ8OaQ/nU2If674fzZ40iXCR3NUGGd9h29W10HYzJHR/ZZCuiSb9bRZape9+xvu+ORJVuvK6lrWGk8FtthQ1DVOK1rOwtZgNnGiILHYwwkxvzPJTakmNATC5OyUGDohoqRfN+67EwCZcBzbK1KqMWdBvzaEsXKpn5X0UUo5zXRPeKt/AS6T3c33PCzzHrrmQcpwlxlzxV3JWhNkG0sPvJuRqYRmkpqh4hrJGzI7CHB/35YzUrxDgoRhuZSyp4/Vcv1FncwZQ1AOmrJfsaL4R78ZgGp0WRO+7QpRcCoYVL33cc5men+L719Sfnjimn4SYR9PXb/ozXvH/0p+/GQQHefm3h43dEmWo33ulmCF+/IrsKFnHAnyfVoHWrE87QKkNj7fO0F9Q8ztl1d5MifBgJeblMh/v6oek+ppsYF4AT3KcqZLEaKgS5E545BL/XUTLrmarOAF8N+1jcc+bB+0pSPJAotbRLaPAL522+mT0oH3U1Snx2AgDWTcI8JkI7mgnjfiLHfft0WsveiWpokqwvexKoo24jQ8XgT12wpQ6Ct0gPx1ij5pCQQv6YUv7Xuox+s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7181.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(6133799003)(22082099003)(10067099003)(18002099003)(11063799006)(261009223027099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+bmtHiUA5Ue80Gt7k0enksX9rYLoR4DFbEjKIz2qyV7YgPnT6QQnHHUXQQNa?=
 =?us-ascii?Q?tIwUuQOdZ2229wn8csvDCh1GoTJPAYUt8DKnlqde5Va/XyaNDPAcI6PuK6M5?=
 =?us-ascii?Q?2HKDQg8x6RobEonkO5/JoRV8FZ/Ay844ZF5abp+K/rxocjD82BWKavMOQZy+?=
 =?us-ascii?Q?vMAMPzTsy7T4C060MctAPq4AHCVdhfIbJupRicdWMnQn/fTwK0aBtnx5Cjeb?=
 =?us-ascii?Q?/psxb8kaD8M6AyHiSHzO4YqJxQpczKtlnUbOM7pikGxLYfaSBqMU94EnT53N?=
 =?us-ascii?Q?ABlclUidzg7VEaRT1EP+aCdllyouSFdxoc+lC6NtELUh1rCZk/d4muIv9FBg?=
 =?us-ascii?Q?jNx2r8M5wd3Zj+AKXCsvCtGQ7tNDx/ea4Utsb68iXa+GDbCtQWyEyAHGZaKn?=
 =?us-ascii?Q?Z4HhgV4EuFx259YJ6yzNTHD0z16OOHY7vI9+MNV/lt0fKiXc9Xw2UwzLAJFH?=
 =?us-ascii?Q?E+1J+40WCabxGhHJzfjxQq0XMFz1K493hV8qHChap8q07kwNkSW17N2Tb4Ic?=
 =?us-ascii?Q?WVCjrzHNfOV+Cnxl1+4FwLpMoiIzAjqHQBJa3IyugnR9/enL+zGzu1nGGHJy?=
 =?us-ascii?Q?LR2v0g0fZMXOBtdmFEiulUhtJTVEK/e7xshggdWITOXWIbODFbCm8WBpq/1o?=
 =?us-ascii?Q?Tt1dBUop29hTMJ4Wb5DLw7ouyouZLzQwRbjaj3XlztX3wDow9HICcyzlxbJD?=
 =?us-ascii?Q?DIYsmnQbnrepEfwp/lL1cKbGUokrQnf/zjnvuKAMtaX6xyKjgeQa8Wu7Emvy?=
 =?us-ascii?Q?CAec2fwIaiczaxSk/y8aCa8aZGOeD8iUyjlbOPFYZKLN0W76raVGNJrxue5z?=
 =?us-ascii?Q?040o6NIXJnIo0P+X/NU/FrE5ByxfK6t8GdpYpHHIkjPk9lxT6Aam+UWoKAf4?=
 =?us-ascii?Q?oh8HglEkPHF+EnbNY1pu3FFA0Ds0xSFE/GniYImp7JDXD8o7n19u5lGkoI2l?=
 =?us-ascii?Q?0YXCElcg8ZYDUbhP9l/so4e+dBVgXjC3fEgVL7irKQysVRRKGPrDij1e8zwM?=
 =?us-ascii?Q?zfsU20O5RSn1xRozeKoWAUS7zAWnDHUDWAEKXeeRm9BA+B7xnuDES7hAzL8Z?=
 =?us-ascii?Q?gKdIKZ4HO6P3aqUDLGqguxiODBtUhmrK8DoaCWSs/k1vl4Xk2tB5crRg0Jjt?=
 =?us-ascii?Q?u+FcP/p584MgRRP0IrGgzOWmIXwOGSoEdm0trgqc5HOr/QasW2QvG0sK3Vpd?=
 =?us-ascii?Q?OB0ro5mhLnzJfQNhzewPzLVs6UCWfMfo4eOC8jKEvqpa7MQPreFVYU4n+VUF?=
 =?us-ascii?Q?lu1HmErSBKQrcTmvNnYpJAzRpl0xonUPCX+QSdlIV0NFUqSig+vF+m1ctsS1?=
 =?us-ascii?Q?+pFo90suyOoOdwrdT7dCjVsLE3MDwuGdaXhIuAraF3wKSitF297TxQ8WHO9x?=
 =?us-ascii?Q?OHlxSDeBC9TMu5I5nDzi8I1QErMa7YpeNS4uCNVUL8ihbKA9oQ2NVXJLtAip?=
 =?us-ascii?Q?yvhmX7mJrPtt4Si4Y6d6NSQmYojGsZkpIKMiW8BP8aft3uOBNngsf0IbdwWJ?=
 =?us-ascii?Q?hjXM9dcOz4JUBXlqPf4RtbMJ/6XtkQQa8M7xKf/8lD3BwjLLOopWaIiKXgMQ?=
 =?us-ascii?Q?kDTmXYftpnxX88aSftWAllqiTnwXYO+rWSvOJf5gks9CU8g4IIduRCAVOn3A?=
 =?us-ascii?Q?d2vapUWkQ2oYnxNPCemj2L0MbSNpOiRdjfNrPGkUpx7OFjmjKFoH3vluLMOi?=
 =?us-ascii?Q?UUPpjEoRHj2Sk1kodtjs2CrVe4LuX0p3v6kt9J9h0Z4CzIo95svn4UwQkl98?=
 =?us-ascii?Q?qLwajI9VjQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: 431VkcD186e/aG+skiZDQL8wHPMS9lSNwXAwTbms6APIX/6RrkYpvvvHCLJMQwqHPfc5YrIp8XIHRS4JHAkn59BZYPJmPODicrrQDGXZ3vVhk2E4Dk35SOZErKd5m53PaE0uyhfUs331+Bx2N8l+YLjIkUZGGsYu2lJ4hlYvJRGAxn0CsMI76rHDNEax14oYHkZpJdIyzw27CholgqWNkwX+DkYb0rDexEKrG33o9IUsB7Dp8Nazn5ENzydDIK8AMFxbaTxlvpx55Ob1Ns66+xaLGz3PugfTwYmsog7cpd9y36FN971lx90XT7HRNjHE2bJT9or0kFfKqEPD4w1h4w==
X-MS-Exchange-CrossTenant-Network-Message-Id: 71f770ea-e7f1-4b38-ee65-08df2bbc4cc8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7181.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 19:33:05.4376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q4uCZLVne8g6OeN9824g+lc9+8KClFk0+K+5mLRcv8MOvo92dU8sUd5r5q9OhMUR4RCDmxBcQ6/vwyWLKHLT7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
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

When xe is built-in but configfs is a module, xe_configfs.o is not
linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
still exposes the real declarations, leading to undefined references.

Use IS_REACHABLE() so this case falls back to the stubs, the same as
CONFIGFS_FS=n.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 10a00d6bbf8f..327b648944ff 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -14,7 +14,7 @@
 
 struct pci_dev;
 
-#if IS_ENABLED(CONFIG_CONFIGFS_FS)
+#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-- 
2.55.0

