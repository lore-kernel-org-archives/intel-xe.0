Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E64DC27C50
	for <intel-xe@archiver.kernel.org>; Mon,  3 Jun 2024 21:52:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D6C10E3ED;
	Mon,  3 Jun 2024 21:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B4eX7+UV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3C0410E3ED
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Jun 2024 21:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717451550; x=1748987550;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=A9FuoZDCePvJnpuSS/EswkFj0kt7PBIntLQ/QBEIVmQ=;
 b=B4eX7+UVcHEWo97umvoJ96LeOMdKvsk8nCz8FbzaEvUrdW5G//U+lIuw
 Dz68Dewu+pE1o9fNVr+ZpcR0kZVS28dFVfjxvSyNFgIqjmVDIvAI4OUHC
 zjUoJS40/VuowYLhhyHghAGbGvJcReCGE0AHca65IKJxPXzTzmWeSIxND
 JUakTR/2WJ5qqi4LvV3XMCzHAZYhbNfjxDd/T5vRvbZ2JlXeROkiUMntO
 kMxeyiIdBD0oTUu3ACfi+6ut8ObELnKWMGpn0cVBIJSjkC3d7wfKxeUrO
 1m8H5QvFkOJRCJY3lJF5FdCNYMMAcoZydj1P2FT+HafnLdXq0+4LEUtyL A==;
X-CSE-ConnectionGUID: UkGBraGBTR+SpA1+KM/aSw==
X-CSE-MsgGUID: 03PwHVkORQqNuvLnkfiAxg==
X-IronPort-AV: E=McAfee;i="6600,9927,11092"; a="13776518"
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="13776518"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2024 14:52:29 -0700
X-CSE-ConnectionGUID: hHaXHKtSQHWGSED2+H+wbQ==
X-CSE-MsgGUID: fzz6s6BUQ+6Bwcj0EJOAWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,212,1712646000"; d="scan'208";a="41943410"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Jun 2024 14:52:29 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 14:52:28 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 3 Jun 2024 14:52:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 3 Jun 2024 14:52:27 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 3 Jun 2024 14:52:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PWrjuglQTVp18PvBTSBW1qZkrnudYRsAMsY10p2R9gcIpRlTvWDJPvaYngEv9EUdLKj3awRMPzHujNX46e3aDfRgVGnbJpSR9egAjEEZuPOjW+8kGiSmFRMbdnFd4CELzHDjlOxfxdSftCOoxL3+tM+2miZlWt/u+5YqfWzud26hRgxyl6A+i0sjg2jvuau9mlR1Dicc925vG9H8Cy9EqNbkn9bLyUl6eEMPg5Lrj4KO3WKDhFnuav8yqoxM2cElWMUEbcCuCt2907BXiER4xmmVu9VO6cMN5n4ha0gx9CmgzuTcDz6yLkg+YWa4bxJsLd7wvkntJ8Kd/+NopYGPlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NShS/3owB5ooGhIfgxQxiFcwG5OfLigEZeYwnBqRlU4=;
 b=MtNXUY1+Mz5b87FP3eD/1dXNCC5BeSQm/Lo5DLgh7QttmEo/U9+SYjYsyyuSPDsetO/Z4vUIdjmwLqGCyroko8QiqV+gvX2aosbm4JL6IwrcipSb2Az6rn6kMuWYtIOquf5SR3xebGIDSYf6lcqiUTrcJsvgkAxnENKEA1AagjxvBwycTsubtjo9WO9vMw56bDPv4MWtQrXjfkeP/7xbQk9xfSlpmH+aOTZev4Io0CD3UMMEUnS7zR6qtU60JQ9bidiZFWzL1ZkuquARly4RAOXLA1vtBzRF/LES1nPqW5FqCgI3iXK1INDnf1ZQTq1duHTOPki0SM2gGiM1ltmMrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ1PR11MB6276.namprd11.prod.outlook.com (2603:10b6:a03:455::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.24; Mon, 3 Jun
 2024 21:52:25 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%4]) with mapi id 15.20.7633.018; Mon, 3 Jun 2024
 21:52:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Paulo Zanoni
 <paulo.r.zanoni@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>,
 Francois Dugast <francois.dugast@intel.com>
Subject: [PATCH 2/2] drm/xe: Ensure d3cold is only allowed in DGFX
Date: Mon, 3 Jun 2024 17:52:18 -0400
Message-ID: <20240603215218.14278-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240603215218.14278-1-rodrigo.vivi@intel.com>
References: <20240603215218.14278-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0059.prod.exchangelabs.com (2603:10b6:a03:94::36)
 To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ1PR11MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 8300345d-292d-4672-06b6-08dc84177479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZYemsaXecPb8Eb9Kc6aerXNwq7iwX0/dP6YgU1gINJvaaeCxvKBqq2fn981Q?=
 =?us-ascii?Q?Luh202lz9yVzyrzBZXPa9rLdJhkTsO74fpNPL0k7h7c5jRk7HE2gfCHIsC5F?=
 =?us-ascii?Q?ZHRxGVfyATK43eBB6youH4MpzZWG2R7sDjVnbmndHvgqHPR7GUTxt+Wb88WX?=
 =?us-ascii?Q?zy7/BreHEByYRl8o2fEr/8sjacusrgCGG0/u6kOyyMu37d+zeXhQnCdJdsHW?=
 =?us-ascii?Q?+CEVwLni9M7gAnKK/LmSfMhZiOKb0QeMMhXHd2HQ4rbL6zaSNwJV8heUeL+r?=
 =?us-ascii?Q?TXohAStlO3dcEt/a6v1Fonp7fzDj7HgoHT7BDfp8b2qbFnaVGmC7/ERbrhwe?=
 =?us-ascii?Q?Qby8sejUJEpEmNSIecBGNlGQ4z5V7eyvS2sjRbzBfwmfb6Vr4ALpsV+irIPq?=
 =?us-ascii?Q?WunmCwuTu2RRX3G0sZfk5cXKYTLnu9vcMjUh68XInZc7sma11UC2ZS+ekHEM?=
 =?us-ascii?Q?rMNJFEkRnVZW8F2+9H1r8AhYTYhNen4haDx239/3pHCrpqpuYbLHfJaYoBqO?=
 =?us-ascii?Q?KNoaNa9tQI5s9InUmJdukH9M9LCPVnuAftCbqpw/ken+EghXtwOLuImqs+V1?=
 =?us-ascii?Q?j348JpQmjXZ2DjRSpi3av+7z8jjf+wYFbpkl+RrmM0z+dQtFobnSHOspudnr?=
 =?us-ascii?Q?3D/m11IED077YCAlm1EuGsSQC0zWPenjz320eiX+D5l72IEkqOyQI7vCvCR/?=
 =?us-ascii?Q?UEqFPiEr3qA6GGUjcBf0K+hOg/1crpDFt2AnHPajIIXBEZvI2wh94WbLOyMK?=
 =?us-ascii?Q?mTt3rehbtA6gNp2u0RuZMLwsNCmhYK8TwcPWl2yel5rexDZjb0SAgYrGVc4D?=
 =?us-ascii?Q?LMw40SDTgL51AGG7+NiQ0Hd4gg11iBn1wZ4RJFMGg8gZvhU3GrhvTcwTAXOl?=
 =?us-ascii?Q?/3DwGwngZofgZQRhVdM12Jk816mma5Eb2PmUU25GQEIKB4C0bxoNvr+8ZBr8?=
 =?us-ascii?Q?P990QehNBPEK7/AZ2jR6tJlUErIS7Ysc6JBc+Ez8mYyoXRYzHEr5HOvT3DTs?=
 =?us-ascii?Q?mCfNk5KcdCn/AWWwPNZPhY5CCVB/zpKs8ufhtpHVOUmoDzmvFIQkxDDUWEj5?=
 =?us-ascii?Q?kJ5U0IFAE/5bylot8Frso3RXztos9Ep9qJ1PL0PqSV1AqnVRDSfYHJ78qlQF?=
 =?us-ascii?Q?Q9ooDv8h7xU7fRM6FvOuw+9E3Po7NLbt29rjblwkGcBgxO06Y63DjyxXIzzn?=
 =?us-ascii?Q?6alYAcDa9et4nhM/zERU+N9w2/yJCL1dkSN6UOWHPVQ1LOOhvAxIDGR1iWum?=
 =?us-ascii?Q?hdmFkcp4piTcdbhGzP7fkVRS3TC2riwrHabivo4CJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mOFrEbkrT6czrM5I6C56xe1TW7YvNsOaSo/NscmR6QB7DvJ1IxBvFYOwBVpm?=
 =?us-ascii?Q?JOGUEWMH4/nKoYkeiKmwVEu4Xwx5JXgN4+CaWTz1jFkjsouP6nd9tkK+a65e?=
 =?us-ascii?Q?Xw06TkNt/0t0YvOcbsVa9T2vsFtJNDRc4XwWUjYb7iBaQoa7AKRhSrXpKsav?=
 =?us-ascii?Q?FH7DZ2bop2KBcxkAEJZikV6Mnw4xFNPES0UTQYxNuSCpPxehwZKrIfDx/iW6?=
 =?us-ascii?Q?aLstJAUgo7PoXKb9CRd2XMvcVdAG7yAbB95tqfrlTExkL9yPV6/8HeFDUM7f?=
 =?us-ascii?Q?ha6Fdi/qmkMZ9wjI9k5+AdP7z0+D7di8PPuBZHCFE2OpiD85+E6ArucDDrsW?=
 =?us-ascii?Q?UBMGk3D3Ycoel+RRzwmid6z90da+7mvOrS5ImeRX4Xmkv4SRswLQm8hXELgs?=
 =?us-ascii?Q?aAYB6tc8A9lJ9FzgvD0BPwvgcgfsdeziSHI9n5vHRa3xIbTp0c5g1Mna2WX6?=
 =?us-ascii?Q?B8LyqaMAt1wHypmW7BL+4EvU0Mu2r9kNzjytWmSqyIly6xK0aFU4ROJG3JI7?=
 =?us-ascii?Q?6w/7KXsV/7Waot21wPfHL7wb7rW/YNJuMO4AaxcRdB67qk0EWKhv6q9ZL1Kq?=
 =?us-ascii?Q?62m9Io7ewFRD7ZfmQXS2d6TW3J5sbD5yBmW1QHem7ZFdJCOxr1ab4mvER++s?=
 =?us-ascii?Q?8qhNsOI+Se31M6fgygibPMyWUnxEwTQiKwF1/yStZB6mbKlCSo6rSdkPwTDy?=
 =?us-ascii?Q?Jq/Fo3sRdrEwjB7GRebNbSJOHjMp5Q/SJTmWoWEqRZU3oyayP70wpXFI03mT?=
 =?us-ascii?Q?XntozUSeqcWCrb2Q2kpukUS8RtsRXXQpoIKBL8sG7hs9TbaHGeTzL/hB1uPU?=
 =?us-ascii?Q?rddF0M1HxAjJZ7STBUUnRQxyGW4ouDFH10cWsTi6bn+t/D3hc3/Eyu8JKQ7O?=
 =?us-ascii?Q?Kk2iJuDKt3AHM2hsgcbAqnQwiE3S45eHapqwdwtFqTNREmfV3/15mU2LDILz?=
 =?us-ascii?Q?wrwYXOWNhZa2GtU3QaXUqBM5+Ph8qVUJppN/mL2gJUMRuQ9Sgvn2wQjZ+i37?=
 =?us-ascii?Q?CJu+ASpDjqhKXptWzZWkBTOzZzWWMuqDm6sABOrN+Q0XHE+zYukhUNXT1r5o?=
 =?us-ascii?Q?fKYWrK5b5K+KRXm27EFJm/XWY3CMkKIRZ8GKMzTREg+EJdbS33elaM3wGGKj?=
 =?us-ascii?Q?aP3iHVW0jQ2O9L3ZqDesCQ+apVBZ9bZN2CivmQrwcb8EKEaAanLdloMV2LZj?=
 =?us-ascii?Q?JWrOVKXErQhH7eFUpAY9ZfOBoasavwBthPghvp9l+6IPr6kNUuLnLtaZ+gP+?=
 =?us-ascii?Q?PuJYICglw4JJOmgiLxZO3nXVZl6ksXEjv1x/yUyHCJN6AjNo/vSL8d97Jb4Z?=
 =?us-ascii?Q?msoVYkyXYsF3jXXo7MthWpBxXtdmWBcGTJukQvgeatLzERQRG7sAkCdt26FV?=
 =?us-ascii?Q?hZe491M0kNtrvzDMIT0LiHVQINy9GpIpSgJi1C1iKnAWhEfhACHdFW2cSQrl?=
 =?us-ascii?Q?tQM53/aNSyjsDYEWFAsSlQUXzVeVzQBdOPIhBlnZ77lh5Bq6yled7ZLqsG8W?=
 =?us-ascii?Q?LgRq0i3nqHQgYAHL6SCwurlJz8heHTvbUKs+i2+8/6vD9zXX/H8YZcggyZxe?=
 =?us-ascii?Q?6q5eHQ4Z9GT/yYFJm6s+CzBCoo3mq2AV4DPcixf1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8300345d-292d-4672-06b6-08dc84177479
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2024 21:52:25.3733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8T81qKa4DA78WUOSG1IhRe314+beyJCftuSZtfxMbXMOz4iusep7WSXaQ/5VPNrLJJpyATYsa+qJ3IjKDGhDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6276
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

For our integrated parts, the GPU is part of the CPU package,
hence removing the power at the root port is likely not possible.

Let's add this extra layer of protection to ensure that we are
really not seeing d3cold atempts into integrated devices.

Cc: Paulo Zanoni <paulo.r.zanoni@intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index de3b5df65e48..1facb7dd8b66 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -172,6 +172,9 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 	struct pci_dev *root_pdev;
 
+	if (!IS_DGFX(xe))
+		return false;
+
 	root_pdev = pcie_find_root_port(pdev);
 	if (!root_pdev)
 		return false;
-- 
2.45.1

