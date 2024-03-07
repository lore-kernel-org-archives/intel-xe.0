Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E9BAC54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:16:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5077113605;
	Thu,  7 Mar 2024 00:16:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J+GXHSQO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA357113605
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:16:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770582; x=1741306582;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+yvl+gCfu3GfrlSHXOxorP+5ab6wiY3QvFZqBN9pxkE=;
 b=J+GXHSQOV6WBKMadD4vY/t3atqps63PotfoD2jdrZ9rRQwptHHI8q5BK
 /Dgf9w4A2ujrCWzmJyaKqE9u7Z3Ex4zazastOLQY8R+QzM9l7whznffl5
 NyHUykhdx+gGYcvmO6QSXsLm8ooYSnpsnCkhvXXysDSYnTvlMFtjq/8iU
 W46XCZ/LqLQwLFTaM6zvfvPB8HRFTo5/mYXXfzwVlKoHnQrUknuKOA8ve
 hp6FRzhn5NS/P78TpVI/yeRW7luybTY8WNrFMBcAm9yTrCnfsSA+T2Wl0
 P3iTnLq3VIP88BQhOqOxHhMNXNngh2GKcnsuhU6iSjDKR7M0Yv4tzWy48 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="21940019"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; d="scan'208";a="21940019"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:16:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9911853"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:16:21 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:20 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:16:20 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:16:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jtxjJrBPJErKrFDRYd8d2yMeMZOdPKSSFEtpN7BK9CvxJDTxWUt3WZiF9Xff5ShqTCjfalweD5oY4GK2hyMDJmQaOPV7x7jl12hDGVY50FzN9d1tL218isxzJTmrrMp6RFWOVNfK7qzsKW1VngAyzaSfbsjMIOrHMyUtWUeQ+pmg2ezdjJuzITRRhFjYIJNT5t3VC60L1PWCJvU1fhkK+lKC0VqLg5IyNsUZgfuOMiV97pJN0ud1D07wHDTgMWi5aU1dxk1/hduH5QK32n1j8UNYznFTYG3SNBCkai8IE1Tkdq8HB2PJyivvLXJtCkgPkmat3P9TRQGuRv+d76jjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/p5hesl4yDuh6TzsZ4WZX0nP8z8gd41BOx6fcS9A7E=;
 b=MVh3HeRJT06+YFV3hXOxEsEWXUWeVM9VgK4FoQnph8xa6cXMtjcavQL5nDknjHD8zSt6Pae0gjDOG3Ue8/9ivxqbgLqqreonmxh/ytaElRoU3Ev6GaFlOXvlyOIUACj6wzEZJMa/vXvFcPHhSs1YnqesyZ9FWaL3/UI/4Jj9Kl2/1YMBx/QouSW4Bc1StBDnB501Kn4LThWYDZGweNvrItIMu+9pqlQYFBCkyHNQPF8lQZuiX7V3mt6qvjilRWHBxQfSmqsdEuPIZd58hSaZLQ3D/T9m/fPr6rTS9XpHx/Y41wGZzF7u8oZe5UhavvTObYsGzERA1Lz2fRUJsm1igw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:16:13 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:16:13 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <intel-gfx@lists.freexdesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Matthew Auld <matthew.auld@intel.com>
Subject: [PATCH 06/10] drm/xe: Removing extra mem_access protection from
 runtime pm
Date: Wed, 6 Mar 2024 19:15:50 -0500
Message-ID: <20240307001554.162153-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240307001554.162153-1-rodrigo.vivi@intel.com>
References: <20240307001554.162153-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0079.namprd13.prod.outlook.com
 (2603:10b6:a03:2c4::24) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 846f9aca-e8dc-48cd-30c6-08dc3e3bcc29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hzwFU56u7jaACBJIqveXQu1IeVTkASYNQHh/uzh41+cPgZN6B1hOODCX8ZEnNG2dnHaD5FKv7EFCMm9w2MkalwfkrlQsA93MWmf8MFbVbh6/TyRA3T1m8L2+/RSHjVXUH/DOMvJFjioDTUMuN+wyeCsX6ErlQA5Yxscqkpyty52PnB98Q+BK24aGa2D4LdI0bO2rmr5kgvTq31dkdEJz+ZbXxjS1CRsoinQLvWyaACTaseojVICnyemeewvDxeXMA4OaIk4dPg7Ro7HaSzYOvNlkohJycn5152YMu/0kWxCmAkuLJaX3oB/Itis/LiGn8DAUY4EvZLj6YhQfpwbJzO8qpYvTi2YB7mPiPHTi7l10u1d0YVrIjO4RMau0/Rr7PsEZ/P0PD9O9ssCYNkhDOgREKB1cIHncPtMoY6JDUbHZj1Edli8s6RU2H747bdfH5YzYTeZKaMifvDDt/qq4zt5MtCitD9ivl49TPIRinu1o9MaBurd4HhOAt/v5XeSG2vql+51GfYtxfYPN9YZJaAE7tJnMzPviAPI4y/7CQK08z4ec62rqFY+dcRCbSV0Mx/IQUR8VgHXPPJMr59kjnvDkS/OzvKbGaDlVxDcpIWzgk2I2CgIb3vAQmaxuZeYuzHWfU4Sj9k4DBZUexxrD9NS6niG9E6vstJAWFIeHzAg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6Qks6WENRyr9I0L5GxHZZMWnRfcwS7929pX+rP14dZmCY/01Kktm8wTKK0wx?=
 =?us-ascii?Q?AVUZpPXHAF3HQsZdo7jdgkWNQ2X8BqkiGcmpcaQ9zkIVDW5NkmTSDCsUXLkm?=
 =?us-ascii?Q?JfSuBTDFA8GmlFa0G1ot+K8rLN4ITa2r82w5RUh4uG0WoHzTRPu1ksSyQtK9?=
 =?us-ascii?Q?yN15s6FZzRqr8EgZl0RTSyMhysPYGd3Hz7FlFLh8qcZKedqjpFWhSP3Bt+tr?=
 =?us-ascii?Q?UhLDzaXZJ/zYgEfJTqHqGVy5SES9IbEOyaDwSsF2xfc7I+8cheTEDvzdqmBj?=
 =?us-ascii?Q?ntcB7g7ctbvzCUZ4u44NhQywt1+PCOO7FipqGheEGwEtD5PsbvKPj8jXhbjr?=
 =?us-ascii?Q?KF08/E1JzJwBpsccKW9UGMXQ9f/M0EtWHe/3zjwB4OfmO8ib4lPXTQ5C/Z0e?=
 =?us-ascii?Q?COGasUbZVnLCsGWD66MuJ6Oh5AzHhBYFpTYCcuQ2ojlOnUuZc17Zpepxxvgj?=
 =?us-ascii?Q?OfBvsra/6vM1X5ss4Z48cuqpyayO+DO6yB4LbbpTN7kEcTtC7fD6UdplDOA2?=
 =?us-ascii?Q?Y1QEhOShkNNvFfOyHus4hvLtg852H+npM6dTrfF0EryyrpzUPBAKENmafwYF?=
 =?us-ascii?Q?lM6L5EpxE/vAArahr0FbVZo+UwODwWvtyijbrcUb8W2suM4BW8BT43fya8Ck?=
 =?us-ascii?Q?dS3+g60H1JGpqQpW7vTICLRFqI7C7FWUcHx+1y9vdsMJZd9QLNOpBkT9Gjk9?=
 =?us-ascii?Q?Lo73CiFivz5DDa7MtltUlF50e01aXx7aYzYVLUAFpEsmuJLnkIusi7o/wPgf?=
 =?us-ascii?Q?VbDhuJlhmKE9sg7PcmjfsMC5lbYfF8fg53CagTOtilU1c6VL/LF4YsJUfa37?=
 =?us-ascii?Q?ITQ3C3SB17vpK4JevDDXp21byF+GtrSpunjEppyS1DCO4U+XRtT/OwOALBVU?=
 =?us-ascii?Q?Tw4MCQrCef6kpDaAELMfZS+fZQofJMEvxbsOjClNp4Saea3JdL7iYwo0mqZD?=
 =?us-ascii?Q?OAFFn7bXEMBO92CTHXklsDrXP8+mqUof77w/TXxETt8suipZe84ZFtP+ki88?=
 =?us-ascii?Q?FRay/lwlrZy976BmxwIVfQBSphj2Rr8KT76U4/+fsJTfMTpaWyFe33nVqLe9?=
 =?us-ascii?Q?3802L5p1w5afzvIZ7fwFTicwS++O9vD46QwyYCE6yD80uf9PqBZQ8QLynrWs?=
 =?us-ascii?Q?OLnFqzfIlYhw2/8FaE2QZUV7Y8FV8T6Zg1cVIXR//Cp7Es1Oh0qKgtSxMaeh?=
 =?us-ascii?Q?S4uJvi/bb5Hl1FoMAqJNE28jo98WBfdcMbQvWqK7Nzl9wfVF1C5ehwO0WT5k?=
 =?us-ascii?Q?f7ItWh+gp0etUNTLU/vkh/iIfvxiO0ipSzB967nWXOYjNBKFYrAUgFRUVGWV?=
 =?us-ascii?Q?mUHmTqszjvc3dBW37bs2stWZguPv4YuInr+drEvCJi+qY3SUMEoi5cX6KJ3g?=
 =?us-ascii?Q?b4YoY+YD/U/SMPMovAr4mp2pAjhsBdv/YJp1R3JgKtlcMQU0sKWxjOC7v6la?=
 =?us-ascii?Q?Mel/1fpMpdVJr48V/5QLh2gu+Hrc3I7PDGazYtbj/2gnfdmgypdkdVcLWzTI?=
 =?us-ascii?Q?swivDUQY0haylpOLeqffO6rbAM9diO5HW3VcEo/rgNoAgjG+IC0PylQdlkOJ?=
 =?us-ascii?Q?F2tJpOL6ui7XpH8gRUwRGCEHP7kmEAngQpnCyiv59HcH1ucMWA/HBE8v4KBY?=
 =?us-ascii?Q?sw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 846f9aca-e8dc-48cd-30c6-08dc3e3bcc29
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:16:13.1619 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YpuW2x1ZVHNxHxX9sB3mndN65GUYzJH64S444pAoSEEW+ORfpIdThBx98Ve5PszGOyRsjppjAGg+LpcMVVMxJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
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

This is not needed any longer, now that we have all the protection
in place with the runtime pm itself.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 8 --------
 drivers/gpu/drm/xe/xe_device.h | 1 -
 drivers/gpu/drm/xe/xe_pm.c     | 3 ---
 3 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 49a413725c8f..a9128bde85c1 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -639,14 +639,6 @@ u32 xe_device_ccs_bytes(struct xe_device *xe, u64 size)
 		DIV_ROUND_UP_ULL(size, NUM_BYTES_PER_CCS_BYTE(xe)) : 0;
 }
 
-bool xe_device_mem_access_ongoing(struct xe_device *xe)
-{
-	if (xe_pm_read_callback_task(xe) != NULL)
-		return true;
-
-	return atomic_read(&xe->mem_access.ref);
-}
-
 /**
  * xe_device_assert_mem_access - Inspect the current runtime_pm state.
  * @xe: xe device instance
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index 2653f53bee4e..2327b6c0ae6a 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -138,7 +138,6 @@ bool xe_device_mem_access_get_if_ongoing(struct xe_device *xe);
 void xe_device_mem_access_put(struct xe_device *xe);
 
 void xe_device_assert_mem_access(struct xe_device *xe);
-bool xe_device_mem_access_ongoing(struct xe_device *xe);
 
 static inline bool xe_device_in_fault_mode(struct xe_device *xe)
 {
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index b534a194a9ef..fcec3ad2c903 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -296,9 +296,6 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
 	u8 id;
 	int err = 0;
 
-	if (xe->d3cold.allowed && xe_device_mem_access_ongoing(xe))
-		return -EBUSY;
-
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-- 
2.43.2

