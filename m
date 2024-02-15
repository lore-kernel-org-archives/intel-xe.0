Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1353C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6644A10E651;
	Thu, 15 Feb 2024 19:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lmV7dl/w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A6310E68B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025733; x=1739561733;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bzCGgVyU9kSfHQ4T4ItlyZs0ZyzVYuvSxFLAsqi2eLI=;
 b=lmV7dl/waC3ETYkmZAjcPCiZgilNqZw+oFKv+yZlT9Ammx/89p1Iq2Ek
 VCtCYv66zxQFI5FG+wX81x+q2kUEu+5aFtyPhpZFGR7dc3/ST1GnFVqGJ
 OBjbVfZn9pYboWkMEr0JJ6FKNCRgBRY1mSiNT9nK1zSzXTx2Rqs72I78+
 xegkae8Mw7Ej82IQtXZXKGmpxo3DQeJlWd6LnNst+8xe14VGS9OsGI403
 nKnus0t20ACChtNpJzjvCq08TCkjA4T4FtfmIKzS02tJaVOi71X656ZjL
 GI7USLW1XA/GMDWPrSeXSqM84CoUcK9gbPc50mpT9asFsEHx9kiha5mUb g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13539287"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="13539287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8309716"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:33 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:33 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kRijRHjsUh1iaNqQdZDgxtqlKzx/CcKa1lkVbAFvRjfHi7Bw4auXv6wzZrk++EcBkCjdWZ8YkjgVrHhc+m/IJK6vnFqzoFOT/X0zSl6tcDophlBwHBBz+kv6Aw44I2ClbBRMof97L2yGO529HUEZnbJvkbyciYajP1EZHPSnCkaMNVtzFNpToDB8SVkj6SQ5u3uUJ/9g+cWeY6Dg7nMqw5EJN7BqGILJCCD2oc7QWWCN7J+6kzDJgwkYmAH5bgxN7151Maq0AROhJmNuwzdYS8pIK3Nzr622rm7RpkwsdXgtjNY6sMEjC6RdHK9zpmaUACJfGIHMJgPKOMIoGkjbFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UkdCxdoO3GRS17sLia+qjRTU5OAsorAKw2t4j4L4Wh4=;
 b=Kslta69omk4nyr3xkCqED3EeIxYTE/PMLuF5iohGLeJgEc/cGXgYDthkkItSoBZIv6Bh4flqajKfk2Dob4nsUjxDHCnDQ0eUnWTSOx3A8Mbkk07tQOzXT6gO9pv/K39OdjxNgTn79wtKACUJvKlyktFwvT7TgiAhe0KDYHbLfA1qQR4rNrOtsfs5rzPM+hhe3Bkmrh7e35Ii7mZGKOAUiEpuyLAMuUi8JaWYeVj4kIqjq5YSFHpX+3HQmodZsqIeRGV6FU+iHb2B+pzxz8I7LPVhjW7SJMwpN2i17I0hpeCD9NwhVM2ddcW6YVMBZRbNiKXCfSxU2J2AyJ3IUZmNxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:23 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 14/14] drm/xe: Remove useless mem_access on PAT dumps
Date: Thu, 15 Feb 2024 14:34:30 -0500
Message-ID: <20240215193430.130106-14-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0299.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: ff2c365e-4c79-44dd-7279-08dc2e5d40dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XCbmE5G5MhVDlGNtK5rBlH+2UgjfZ96BHH9rAgSeJB2Wsc0BCbfO+KL8R+1kR49NFNLZ139e2INOF9QrADMFEKBGwBMrz+icQZD8maTUJTXG32BG7Tm+H8kl8aR0FHkCn9XMkX+DViRsWUo2JWKvedQ8vQy6AUwEDwtW42fJfnQRv2FkoM4jV/hxSVcmMadUbPpvvpejM0lBYV6d/NidiW+CH6p8VLhHQfFxjF5MZ3a/rEFLaIxl8xMYY13DCEl4pVBfLTxs8orxCnGhHXY1PvmqDm8hkAPov/BewJGize0Yv9/k2SXOf1NL7N8AzdVKBFrY/XHgxv24S0I/+Lgz3UFtJVAv1eIzRMmjmTzcOs/GzxBkzDPwFNitnPSYzGsGetrmA5tXrxXqeGCNOs6JVHgzhOYaaGOIGcd3Icmv93S0L4ain1uQvJEfqdKec94eAgKQ72k7Ro7CkfNVRgUoPQk0U0bJCe+sgWtTUH4zfw7qnA3d52VYpLT+emA5zFeHnmCcZ1U9uCZnnHkGWCuxHCm9QwTMiWgbaO8aHoGoA9UdL/wkfSMuPrGyb/wivOIU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AtYVungsaHEfJqCwRxoPyVWaF0Akb0EwYfLcUvbkEEKQMSBqKeOPIp16RrIV?=
 =?us-ascii?Q?DayvJM/9d+9qIfjQigOPTu/wriYYoVpFJEvycXzHYpp9RwDgCC2oaxoyFQzK?=
 =?us-ascii?Q?0kCZlwcNmuBBbSJe1hitb191Qt0N6ttavX6U3kHrE1lOj2dfZxz820Yc+Etx?=
 =?us-ascii?Q?QWBTIt+Lffo7H5vtWP0zQSEXvvez5XzObgW9aHBQlWSGowvE0jY12IKgK1kL?=
 =?us-ascii?Q?3I5GHhIKGrROQVZu99rtJERuLVCZMbCZa7W6bXSf6T8D5fef3llLdu0iSuCO?=
 =?us-ascii?Q?8KJFhISjHoIw5H4/l2Yvgq1i+JTdEbC5MXchsAynCC8MuFkFPCn096eikmA+?=
 =?us-ascii?Q?NP5GQPbqnxYcMNNONHFOwcAPwW5edHJCR9oB00oQ69mkjIqc2R5yFet2jcde?=
 =?us-ascii?Q?P3k0D5MS5EjCHN1Y7T1ceCx0kNj7TUZ3/Wx2drmwS2uARQSxDkQJNC4gtiHw?=
 =?us-ascii?Q?HXs1qiHCxW4SK1Y1InFU1SlYwTN11IAlHZiyNKc+kP4AHCAg9wkY5Z+WwAD8?=
 =?us-ascii?Q?+4/opNWOw8WclB9VmO97k/wpHPOQPOwL13415Zy67+unlwH6w8tCjw0MyE1o?=
 =?us-ascii?Q?atzIpcuVSCUg3OU3baNMsnaWUPnWHs7vkZmcIG/d4DdIJ6kR/xXE4w2xxUUH?=
 =?us-ascii?Q?RNAnfmdXkxw076U9Qvec6wvqwZru5QFxCxpxRpI1UzqnWoR7ilURsJ2grvyy?=
 =?us-ascii?Q?2Ad8ZCj+boIX78RxUWhAymuChAHEwiuealDWrvO2aI9b5b2hwr3Zk6iPsY6i?=
 =?us-ascii?Q?sLuLTLP/tjEqHyTlrepNxG1PHPzZPkmXnmv9B/Xo3NU/dJI7oIpvNLSWKEwu?=
 =?us-ascii?Q?BH22ahNhn/XP4HfUIdkqyM8IqkDLW3V1iTNnlQPMRcdwpdRmHhq2KaFwACGP?=
 =?us-ascii?Q?PBNXSGn98Y7aBndsf5kbE1vjLObiTwVEUg/7crxal2A9Y3p7ByZ4wiGqis0s?=
 =?us-ascii?Q?QIFcQdxAXCXmnhck0yy3GrTS3LgRP8uOWL0dCZwlWnjpmu9O8WrmRpFopawS?=
 =?us-ascii?Q?fFGX54BZ1ntTi3IThtLujg5EpPNk58RYfc2Fhm5ypxr7zm/o5XhfWotmOG+e?=
 =?us-ascii?Q?NQmLWMTs11oOviFjjcnKLxdqXWF5QDbK2ej8B8mfd0+BK2RydbvDxyH/vS5R?=
 =?us-ascii?Q?zimwzn2ZiFlghECfYd3dQK4jKesj/i0ydQ+NzRLlOieITBB03Sawx/ASL5qt?=
 =?us-ascii?Q?7x6LuCQZU1k9lroo7Hkjl4DpmWKYFZsVYSZt0RTjNLNOs8M+stP41SrPpeaU?=
 =?us-ascii?Q?R+KPTuhMMUUjUMYmGxvMPgmZQSNPTmQmdzL9TAeenw/lXlTcsXHUt5YAF56T?=
 =?us-ascii?Q?zFU+i2IPMdDy8HjP3pSoBg7EOCnx6+LfTMmSpwotpvr89t5Q6Qjyn/Zjm48y?=
 =?us-ascii?Q?VNFvUzZhi3ZPPzvvyBnfA9tm3bUhtm1Th8dHO3MIR6uG+dqHRRx76/HsZR1Y?=
 =?us-ascii?Q?cElL5wbImDPBSDLogDlJlPjBDFhtCmyz4zS5732qj5zNKv9K8sbcVTERW1Jr?=
 =?us-ascii?Q?/fmiN9VsnX3IlsNJtzr/MZxmlP/fXcaZAuTWgcAyNFbiYsmU1MR9ZQNaCVSS?=
 =?us-ascii?Q?Z0FarIjaJ1Yz75oBIRTEdJNosMsENi6dyY+b2SPPBQloE75MqxokchPY/JF7?=
 =?us-ascii?Q?ow=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff2c365e-4c79-44dd-7279-08dc2e5d40dc
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:23.6762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B08V7KYuRQSqRY/LNqwErvcxr2BaZ9YBGVm4PSNKfUT7NzzqEipf8riwXZReF5wELdze9pjeRUfpy8m/WpPY1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

PAT dumps are already protected by the xe_pm_runtime_{get,put}
around the debugfs call. So, these can be removed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_pat.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
index e148934d554b..66d8e3dd8237 100644
--- a/drivers/gpu/drm/xe/xe_pat.c
+++ b/drivers/gpu/drm/xe/xe_pat.c
@@ -174,7 +174,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -192,7 +191,6 @@ static void xelp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xelp_pat_ops = {
@@ -205,7 +203,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -225,7 +222,6 @@ static void xehp_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehp_pat_ops = {
@@ -238,7 +234,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -256,7 +251,6 @@ static void xehpc_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xehpc_pat_ops = {
@@ -269,7 +263,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	struct xe_device *xe = gt_to_xe(gt);
 	int i, err;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -292,7 +285,6 @@ static void xelpg_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 /*
@@ -325,7 +317,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	int i, err;
 	u32 pat;
 
-	xe_device_mem_access_get(xe);
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_fw;
@@ -370,7 +361,6 @@ static void xe2_dump(struct xe_gt *gt, struct drm_printer *p)
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 err_fw:
 	xe_assert(xe, !err);
-	xe_device_mem_access_put(xe);
 }
 
 static const struct xe_pat_ops xe2_pat_ops = {
-- 
2.43.0

