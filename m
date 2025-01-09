Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7B0E77197
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jan 2025 19:52:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 700C410EF1B;
	Thu,  9 Jan 2025 19:52:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlHWp3pT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0132D10EF1B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jan 2025 19:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452349; x=1767988349;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=VuaFAn9yPJ+pC2qyxvGupz1PzPxFMSy+Ge/9KbrwcnM=;
 b=FlHWp3pTUSQ5Pz9jr9V8hWtLwIl07bg5Lf8Zrp5LnVg83Tlr6NGN6AcP
 gENMSkNLUhlmc00NrL5uOswN9KqS0I82ihvtmuWHvPgoC7d9CSNQT+mh2
 FH/QQQWkRcb3pXPthhTWEKouqQm3G1bxInzHiyiOXKsWJ+zF/j+9lO/VA
 nEouzbn/txuzFf46L+0zBHVUXG4haZEvnClp0Mt+jaJ+fLe6y1dTMSB+q
 2WTPcQZt6ZiAxF86VRnU6iFDx9D9sKUuG0bo4i3ukk4b9oCin5niZe+Z+
 vqxuVls9WMDOsBZHhRBbVpte0pZIgC/fGCYDU0n4+WCVlQC4gS2YhGEAk Q==;
X-CSE-ConnectionGUID: N5NGsoRJSsaUtfkDYxBaxw==
X-CSE-MsgGUID: xWQJ20vwRMeMneJUuY/BDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36018797"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36018797"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 11:52:28 -0800
X-CSE-ConnectionGUID: 82RizuM9R6GKmzoTzv51+A==
X-CSE-MsgGUID: LQpo71soRHymlu2YAgjklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="134342916"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Jan 2025 11:52:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 9 Jan 2025 11:52:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 9 Jan 2025 11:52:27 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 9 Jan 2025 11:52:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3DICcPYXcgouWXfSR1pS3062X4LGzgKkKDHYEuI6rTzO1AfopjaVZSVYDeNKh7Odu0NDOMsOQ1OFdoigTEvjTyZGSRvBtVXWO7/jy1Yv8/262JNHUGxaQpc342Gg8/6oTHOZepwarWs47sFrazsVSpzCx9TuD6EZnogIXgJSWb9yxuhpPXvBw8lvSrBX045tbnosbGJPRg3Fv4uCWj/200rWrlrFIial+iOvFVNDj+knaagVihSnthx7c68iAjle5/NlY1DxwWAmfHn0MHNwIqa6d8tSCSPxca9z1W3tJkgHmg3G4XUvzd/Ioz8clUSmiRDKtM20Tcdtolpf396ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jdh05mSN7vQMQOUxdMCHnldL1zWtHo6zQgTqKvkM24o=;
 b=s5CkUBZBw0l/Pa4ntYRwi/sqG3j3wkv3evUoH01GLZrafNunJGZGqIrj0/ximOY7keoa1JMZA4ymdn4DRBBHWiETfv/XcLAHr1HVDIXyTrNvKhT8B3lOHwZjwGKp+v0JfKs8l3ejPORoSSBhsPkVl7yrY9uc3fZ027LW1iz6uORS2b5dlLlVGtTIesemAbNhUbYYImkS6Ui+CaEpOXQYJ1sDxRTw1C6fIdsc4oXM4cv2S4g+CPThBq8++iRkhFtPNnjmLSjWvnDnnZry88A3b6n5Wi8SJiiHxCchfaF+9uMzIGaFVwvv2GJ/Irlo11zeDWAWQ7MEKdoX6hEeO8bv5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by CY8PR11MB7900.namprd11.prod.outlook.com (2603:10b6:930:7a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 19:52:25 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.011; Thu, 9 Jan 2025
 19:52:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH] drm/xe: Fix PVC RPe and RPa information
Date: Thu, 9 Jan 2025 14:52:19 -0500
Message-ID: <20250109195219.658557-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::8) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|CY8PR11MB7900:EE_
X-MS-Office365-Filtering-Correlation-Id: 094299e5-f2a1-4cdc-3837-08dd30e7239f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v3lm8+3EB4rGXqE/3aUkrZCImBhtrTUGE8OV52UuOQEOrC8amLpvQAhSOPVS?=
 =?us-ascii?Q?wKASvNfQDJ2W17tM8fJdDA5rwMhQh6LvaJEEVjcszsGTNh2FXCjXmwxGJ+II?=
 =?us-ascii?Q?3z3MZvQKwKol7/Pvtt+s7OtuupHignhv4RobON6WCzjIRE0icQpvJKYabhQ6?=
 =?us-ascii?Q?D9TUAdHG5rw5C67VqFvj1EL3b6j/tv8eoMUiPoE4SPVbMO2G5vVd59KzdZ0h?=
 =?us-ascii?Q?CaF2P7yOP9QYS8VRMZs9MYatHAgRQl3fGOSMN2e7YCvtDhUXAt4QiYJFPjPl?=
 =?us-ascii?Q?/vQqtfWLgUYUF/uqN2XSh5LyNn3//L3kdv76tUQYUiQtPSCDyx4TeDeOUPgr?=
 =?us-ascii?Q?18Pms7iOu1WD5OaJO/NVBf6yxwvCkwgTPbAlaZsyR6Sw9oCo3H0rNPVqBPCy?=
 =?us-ascii?Q?Z7XVqn6+2mzY9R5NSuIF8u1y/zy+RZWexOOZaFNS81v1o2NbQZtpKnLKxGv3?=
 =?us-ascii?Q?+AbfyWd6DiNj5K34PORh05LyJL6pXLloDFreSer1ExA+l6B0n4a6QC2jIoUO?=
 =?us-ascii?Q?AQadC92gUPLPaar32//ujaBji+t/X1wLIzdTIaRetTU9vFBuAn2qixoIUL6Q?=
 =?us-ascii?Q?9glomcQFcOKkKFHgsS6Gf3sVzQcHrfonCxbPTmAhFexjn+zbnz1OvKCwxnPy?=
 =?us-ascii?Q?Y7yG2f9ZSJ1pmCJ/mhre6+HdtX7orS8GBwsIPSknHtrSiIv3tm1DFr0rE+xo?=
 =?us-ascii?Q?YcPrC/eH6+JKoYZKvB3VVie+EtqRVelc5JPEcsTsU10KqbKUJAZ/yulW63Ry?=
 =?us-ascii?Q?liGR6afkkVKBYu/evyXEbHFIEMX8UClG4pstdEdz+tF2c5mPzYTfn0m9yXXt?=
 =?us-ascii?Q?Vrnyz6tIntERUfQTakE7brwZwqoqkI63mQT7SYe4cifohkE7vyHGI3wpEyns?=
 =?us-ascii?Q?RmFe+KciyUaI7XaBf0vK9ZvNf7Y/Pibk25ReaYY/GGi2zKwmnrsKoD3SLJ4N?=
 =?us-ascii?Q?p4X2222oNJ134LwolfRORzn8v03J5hOellLoS9r7JWjydPuNplDM7Q7hWo4Y?=
 =?us-ascii?Q?Y28at8SwdHf1+Cy0zfpC0Cn/gor1ma5VzF9T1ZWl+25k/KB3VMikzvsLjK4i?=
 =?us-ascii?Q?codOn43xkLZFjxkUQuX7XYda0r3H6pra6Y5405W6NbfN/N+BItuu5AfOZZLu?=
 =?us-ascii?Q?6fl9YwSc746/jw54sTkVEPOKJa/w8eQTya70ZaMkLs3A1/wuFR980arojM3d?=
 =?us-ascii?Q?g6E34wSe8nyZzjuEzhtp0HqOfhV4R/8oJE6wc0MUbx001YVs7GYyPgpIC1ZD?=
 =?us-ascii?Q?n+naKGgBcHUdkFGkJi7XcpDw8jI0FsUhxCRf9xrZsFgwaCcjPkfukHkFl1JO?=
 =?us-ascii?Q?2farpseJ1lRoL9Ls7GHei6WvF6xQLuzxBBXw5FuHOSMWRs84CTJ/X/Xrp4Ll?=
 =?us-ascii?Q?9FRAHtQlghQ8rjjcyiF1yx3DMYgP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HLlR5ZRLhZJjfzQqgyUKFwraVLULUtmuzzlMsg4Iv2j3z5pogU+sI5U+JKWH?=
 =?us-ascii?Q?qWwK3LUluoyCNTOnefen7GWfWMYkG//DvUfZOcQ3OoMIdPAoYZMbMqGIukiH?=
 =?us-ascii?Q?8RoKpywAXkwGuZeIA+FP6noD9AABg1Xz9d/avRolYyA6G06FGjxcpvzTenMC?=
 =?us-ascii?Q?lgh7mgRSmM+zABorc4jTfH6+R3+NAj9ob6MkJGdg4SyeG24XRGU3eWoRLyQe?=
 =?us-ascii?Q?mgSnLEgzet/3iNSbBTJzRPOybl1Q9wU2hHd9ZuUvietNeiDToBfAmL4m/Rm1?=
 =?us-ascii?Q?qWHAtFgoc+HO9poYnnOySIREndCkOJ2XY/tmJREMME2Vcf48+dyXpQh2HHbC?=
 =?us-ascii?Q?fzErNYt34ZNa1TbBg18yOlv1HAs89uRkOahbYAZpSbIjXLLRAGSQiYipqwpi?=
 =?us-ascii?Q?9c98fCKOsmmCArOy1CzqlQM6T9CKPKm3sieddQYhTyGD8uHLEWz7ZsiQ04Rv?=
 =?us-ascii?Q?1gmCp7rw6fZ98f55POMEhWOAArVANVNxGLpGK8RmU7sP9bqcnZg37DFFhdJB?=
 =?us-ascii?Q?DfNH7kZboiov4zH266LtGiQO3IrADdWwh1TwmffZwsodASkqVmDxhg/A3rzu?=
 =?us-ascii?Q?hfjtOllcEAehX0wiHu7llXAw47HX0h1U0KK+OeqAq3REOkzgLvmgTCSsTmwO?=
 =?us-ascii?Q?xwwWb7CsTv+qfpmxMVu6a/DEORFVjsnZmW7S3FH9txURsvWOeuQy0CyR/9cZ?=
 =?us-ascii?Q?7RPFdtqu6nRNs5RXZSmpTsnU7ViT2tSq2sb98xSxSVxtMswcaFAzQ/hBaob9?=
 =?us-ascii?Q?uQz5mYmE/jar4wZntHv3uz/9AqqN6f66uA/tf615vWou+F5g7qgVLkismiJC?=
 =?us-ascii?Q?PMwW7u4j3sYmG8mWvq1HNTwGjdWvBBcSX/u1jLVu9SLWFP1oGtkuVQzqJmQc?=
 =?us-ascii?Q?hbdeUeXdDLh7fyoTxBQbVxgaLhvvZX2QvlcOIYwHxcDksw0NarIC5hfiZrSf?=
 =?us-ascii?Q?ZiGmiyKp3E/hxmco1P4G1A2nVjiie38azbS2D6cBV3gql0mRDvYWYlRj26AS?=
 =?us-ascii?Q?Dzqs6llLDRR0UzKRem7i863UStU/v4z1Epn2rNaOUUFOHJ0GgYXouTeAx4dD?=
 =?us-ascii?Q?lUUpN4Yg4spqvpvY9PYesPftEe76COcnYQ+tAD0vEy4npOtPURQulk29xv87?=
 =?us-ascii?Q?GR7guUfuX2mjT7Utu4lfFWzU/sbZ71ywbxVoy44ylDqEXjSJ6JDWdg2RRq3v?=
 =?us-ascii?Q?fb4Omm9PxCOdEGfpDmeLYK+x/N8qvxF8nTPd60P5CJ3wSKmyJqeU0ofPU006?=
 =?us-ascii?Q?IqIiOhgOhlRg6zSTVbhv9d8ps9R/Wcd3PYxWOMY5mJpEOeHS/yTaXB9LDoTD?=
 =?us-ascii?Q?WYaVYrD4jrQFzV593ldxnfWyHkmSl7F+9pN09/UZk05YG+IRLbQviZsWHeXq?=
 =?us-ascii?Q?XQ0iwZIfUPs1CIoehylfgkWutjjMVgoiMnQ5/SoTI7mL3CO9eVrQnzDPXdIU?=
 =?us-ascii?Q?laYHcDCX6Gw6YCbgSf9h7SKnZF7MASwRVY1JBRuAE47rNWD838OObtNboaV6?=
 =?us-ascii?Q?RXjDi0DpRwkTTe/7JY/p7S45ybSGuJVlf7KSvuFLnOR83b3hMLGqf20YuJ5d?=
 =?us-ascii?Q?9e5QODinWbzSQ1Hjq+uI+7592tiUe2roCnL5zZedAM85cVxLZT0TQ9Fa1l93?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 094299e5-f2a1-4cdc-3837-08dd30e7239f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 19:52:25.1819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0Gn0NPImE9HFTUGfxnl9CbEbmQC6xvXptXQktn6BQSQC+B8n58h4yC/n59yV5aZm63lT/yzlR57OmdFliDTtOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7900
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

A simple lazy buggy copy and paste of the PVC comment has brought
the attention to the incorrect masks of the PVC register for RPa
and RPe. So, let's fix them all.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index df7f130fb663..e06f8584608c 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -362,16 +362,17 @@ static void tgl_update_rpa_value(struct xe_guc_pc *pc)
 	u32 reg;
 
 	/*
-	 * For PVC we still need to use fused RP1 as the approximation for RPe
-	 * For other platforms than PVC we get the resolved RPe directly from
+	 * For PVC we still need to use fused RP0 as the approximation for RPa
+	 * For other platforms than PVC we get the resolved RPa directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC)
+	if (xe->info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-	else
+		pc->rpa_freq = REG_FIELD_GET(RP0_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	} else {
 		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-
-	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	}
 }
 
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
@@ -385,12 +386,13 @@ static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 	 * For other platforms than PVC we get the resolved RPe directly from
 	 * PCODE at a different register
 	 */
-	if (xe->info.platform == XE_PVC)
+	if (xe->info.platform == XE_PVC) {
 		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
-	else
+		pc->rpe_freq = REG_FIELD_GET(RP1_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	} else {
 		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
-
-	pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+		pc->rpe_freq = REG_FIELD_GET(RPE_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+	}
 }
 
 static void pc_update_rp_values(struct xe_guc_pc *pc)
-- 
2.47.1

