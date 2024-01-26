Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AF8C47422
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jan 2024 20:32:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3DEB10FE65;
	Fri, 26 Jan 2024 20:32:07 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A8610FE60
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jan 2024 20:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706301118; x=1737837118;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=7dE0fk46p+JldRHyW+kvHdrVaHTq4lI/7R5i7wRYIkA=;
 b=FQa7L4BqnQOR+4O3KbiVJOweZewPKWPaODTLD0gjMTvkblx95STlpepd
 xgRqliFRCrS0hGOkvO9unPE8c4qTEfS9WuW6Os70dwlSFaLwNbPDRI6FO
 vTi//BwMsTZfOSZd/WN92/oX9g3i+G41rCMDJ8z5kOTqIL3EPiGQUZYgo
 yegvrnzfloWB8d/DVnJ9bHB5iz7y3RU6Dz9bylLM4MFur/uKSn8ukFFLc
 H7T5Ek2QH3Nheznl53x18wPgYD6u45NuLsdRlNBz+VlB1ZlwJZpsKU5SD
 /8aWFgrGVJeLl8/AhiwH7HiTOa3DAUbDYef58LK4OBlNIV0NzvIup2xPE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="24031333"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="24031333"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2024 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="736790822"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; d="scan'208";a="736790822"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jan 2024 12:31:56 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:56 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 26 Jan 2024 12:31:56 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 26 Jan 2024 12:31:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QFLAJ7AORdZIKwggnTKbPjqT2zQdAcHlFA8q/sPFL7mo2tjgiUCOO0NRq8pSlvohz758tAocjl6H5XVu20DDwG/77xI9rXTdziV0AvwX2auh4hWaREvNl9kBPo3K9qfvwFuG4/AddU3FPWTsc86ufnkTxh/x2XxmduZvgTLdusL9UbZHSOAu5EalOoqOJFpJUflKEhTVwB+b8ieTaCiYWU3zAsE4Ls/HTilT6MKdX8hHwE+MCSzz5CrhgD/QZDu7YLXuvHfG6iaNqEOhImik7nEU2yG+HaMJuj44fmqdms5+SqK8vPUyJV86HYR6nmjhqfXV5X+XIev3+Bn+UcQDlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceSW3LrGWNy5bHUsADrSCfPj7DYcUvfwbSiLljaQZwU=;
 b=hZTY7COowY91ZTNRM6+8MINE6sLMZXAItQ3dywb42zEgaIZgxUhI3UrRJP27h65+aa3W35r/FicHDqQ1kbmK3SO/o89AU6wxVRyDRtevk0mZq/akcrs2EXI3e0i9NxWFB5Pf2duOB31/6i4R1EQWtDvTs8gVv73d6lNPSW1fQuGrp04zL1jBEH+Vm13TzfcuKTZG548WgRrrCSuCb/000DlLgHdhCNhf/u4MNfkp2XTCqilzLC7fZgyYryf4kLJVi+znHt0EPzUmIZzBhexf7I/w8vPlv6Zz5/ezELbsrsK+WaT9lmUoLSH/G//koV0TxpR3JcuE2AO6JWfnxkEsdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CYYPR11MB8407.namprd11.prod.outlook.com (2603:10b6:930:c1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.22; Fri, 26 Jan
 2024 20:31:51 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7228.027; Fri, 26 Jan 2024
 20:31:50 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 20/34] drm/xe: Stop checking for power_lost on D3Cold
Date: Fri, 26 Jan 2024 15:30:29 -0500
Message-ID: <20240126203044.1104705-21-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
References: <20240126203044.1104705-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0029.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::34) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CYYPR11MB8407:EE_
X-MS-Office365-Filtering-Correlation-Id: adbeab7e-012c-42db-1962-08dc1eadd376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pyqH256YuU3CIhdnk17OhftgXhbuHFXTQNnd1YCE3CAvpAv7LIfAX6nWK4Hh9UPO+jPq1tn8b5vX4+5cDcHaKAuZPVc2p6+TdNVXIS4+SCkaUaY0CXeANPZe5tlK5ytpwWd4/9xK+W3hJb6Uktd/E+cOZW2/Z51ScVlVP5us9orEkX660gedBsUl6C09tTn1QKMky2oVpTxc6qaN6tOT+DoqMPe3BjbIJtysycB7UCaBbC7G2OctSOWd1Sv3hVcUqBQvs6z0VZkyv1kxNzlbM12xpjgYceRNE02otn84ZDLu4GL/iMx61KgqztI7VGYpVDSTj0ejF6DZDdeplw1NNMF8WYXZ9ZTAxvSVVEL2Ng/cJEjZdFqjOTVifmxI17YfvD+BRaY/llztmHgGAP7sV3DLxYr7F7r+cShCNgrXM06I7DlcBBy4aNWQKZd50KpRU+X28qSUQUBGcxkCKDyEA7Y24tr2ViY4XkvH0DpusMp/f+yUFKfZ3JBApbkj2HvvJyUuoBzuaXAyGE0599i6tkCthHS/OpxMWNHvYm1SJI3HP5d+pWvUrwOPzIXNdX7yT8iqQ9e9AbMsntAO9W58gjsVrSMj3aA6EiXjSJQpLxw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(39860400002)(136003)(396003)(366004)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(38100700002)(82960400001)(6666004)(41300700001)(6486002)(478600001)(26005)(44832011)(2616005)(83380400001)(6512007)(6506007)(316002)(2906002)(4326008)(36756003)(8676002)(66556008)(5660300002)(6916009)(66946007)(66476007)(8936002)(86362001)(107886003)(1076003)(32563001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vr9CHKGMHX2J3aoet91cbUrFgUQzt28C0kVzItXtcO+sr2PnhAJqgWwkmUgO?=
 =?us-ascii?Q?+uzS3oeWB77BSXnIlTkeLDb+OMQ37r9TK/kaNh1wBnRlxPVa1pqctLZjEihb?=
 =?us-ascii?Q?/zPz7taxr0jgrJEhTIut5wFU44mHXiWS6QJwo7r2Mo8NAYIK+y1cB5FdIrjE?=
 =?us-ascii?Q?iH5kX1v/1YdPjeHfr8OVUAWAQ/MRCS0J5C6v6ZwlV4qduC4EPADDOUVNXv/X?=
 =?us-ascii?Q?M3TR3Gw2Zqh4IwFlz+IgZWkNhPveNmpM57j2I+kiDCfMA5t+4ch3FzGA2dO5?=
 =?us-ascii?Q?BDFQC2HBjuzPbk+dERSXN7k9sK9n7rzsXhBNwQ9Oaj0JF5z0Qj8/7bn+eJQo?=
 =?us-ascii?Q?WdNHJ0fwDRNdnJHKFXB41FW0VVgg4+GZPYDdmC8RbmtfSl2FR3rP2RHe+H7Y?=
 =?us-ascii?Q?RzWvnfii1yR27fxm+2t1lKrcCtrNGf2YwqJ2c+phkQGToTOL6FbtMyUw8z2B?=
 =?us-ascii?Q?7Fn9I2TTA/8oM6alJMH7PpQJo+Pbvps+IL2VTy5+zMpUjpPacW7RoZhhMeyK?=
 =?us-ascii?Q?t3OEICLGQxidnFNMm5JQQicO0Xtty1b4l+xI/zuAF9z9XrFAAoazS//C+XJ1?=
 =?us-ascii?Q?iycApyBqfD4sFBRQ5N4m1LUNVNIc/+yu+OJymGj4fsVF1xZhrDV7MX8PYOHB?=
 =?us-ascii?Q?2CRtowvvZ56f5G1/R3s77zTA4TBjNvUAvZsexkYH8a9ZUDNr6+ijP3R37qxD?=
 =?us-ascii?Q?TbfWqMe5S1mJrNLoelErFIvK+qmKd096eGf531IBd5ddyNqcjVqtfYCmsdka?=
 =?us-ascii?Q?7vkXH1llf/D44An9IdcgVwmK+0nb94Gu4R9+dI5o1YWi5Cs2IYMvO9PI6q2Y?=
 =?us-ascii?Q?xOayENNinHirraq5Vj/IAmgSKVIWVXcJjSaV+jarN0/aWKDmMFP273rS0t3h?=
 =?us-ascii?Q?hOomALo7s0pkUfeT42GoRKQBCC4VKQQxrnG6sMVi91FnT8MSxdsHWf90C0QV?=
 =?us-ascii?Q?S4KfLgOE4MGKa4+Cd/s37S5ayCKSJTak9hu3gdjBUewcyxU309m2w4KYqGkI?=
 =?us-ascii?Q?1SoFQROS+IKziwv8CLlNUI0rEe9yhoB89U0s3aSHSYW5Q6G/ISBx0+XQk1KA?=
 =?us-ascii?Q?EU2/Iieyk0U0K1gvUx6P4RyUdY81Z4F5zxRvwPcEm4FQuFo3OUOJfPNhRMcE?=
 =?us-ascii?Q?dTxZuJ1Xmx4J2txLCRlCAWsRhCgKhbTqqHHEqa/JU4ybxMDhJK1SxwBMYlj8?=
 =?us-ascii?Q?wtuilhHzq1imOJ3LLUjgsGTmGqqj6K6MGXrqmErVGNMwOeidPEnty4CkFT0Y?=
 =?us-ascii?Q?GceMWm7NjL9m4afa7+2C5Ri29vfQCblO2usAoDXJdKJXyElRlieDA8dIHi9C?=
 =?us-ascii?Q?l6djNN3qX7KN2mxm3EHxql4e2WWi/YZ8UWhlwKzr+Yr1Fwa2UVpVOYKiz/Ea?=
 =?us-ascii?Q?FsxJkCyMK/6c+AnYDhl0KIgSH1JBpzIQvzd8KISOvBnv8eTiXjEBsfzbL1+0?=
 =?us-ascii?Q?OyR9rToPi4pglRSIqRQxeGEteA7iPQOWLb70Vzz907TCNwh4xmdpblxt+t70?=
 =?us-ascii?Q?2FDr9CBHrqwYKczkrOibKCNtcLuQm5Bj9aLnniD93qk1TclO77Q2CejuPwtI?=
 =?us-ascii?Q?ZVIXYpVrjFzgs/PxPkvrEG9isiWMUqUxScpTWx1MlxB3/DUqJu+futtv6y9g?=
 =?us-ascii?Q?MQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adbeab7e-012c-42db-1962-08dc1eadd376
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 20:31:50.8814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wXaGo0vYjzBeO/Cpp/pofdiCsemn2e1DUiiAkm8EO9vU+4hoL6qG7zWRiyymZ9wJuxXW0M0fL+Oi7tEOfGc21A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8407
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC reset status is not reliable for this purpose and it is
once in a while ending up in a situation of D3Cold, where
power_reset is false and without the proper memory restoration
the GuC reload and Display will fail to come back from D3Cold.

So, let's do a full restoration of everything if we have a risk
of losing power, without further optimizations.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device_types.h |  3 ---
 drivers/gpu/drm/xe/xe_pm.c           | 12 ++----------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index eb2b806a1d23..6914cab9191d 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -431,9 +431,6 @@ struct xe_device {
 		/** @d3cold.allowed: Indicates if d3cold is a valid device state */
 		bool allowed;
 
-		/** @d3cold.power_lost: Indicates if card has really lost power. */
-		bool power_lost;
-
 		/**
 		 * @d3cold.vram_threshold:
 		 *
diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index f49e449d9fb7..8bec1f175c9d 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -331,15 +331,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	/* Disable access_ongoing asserts and prevent recursive pm calls */
 	xe_pm_write_callback_task(xe, current);
 
-	/*
-	 * It can be possible that xe has allowed d3cold but other pcie devices
-	 * in gfx card soc would have blocked d3cold, therefore card has not
-	 * really lost power. Detecting primary Gt power is sufficient.
-	 */
-	gt = xe_device_get_gt(xe, 0);
-	xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
-
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		for_each_gt(gt, xe, id) {
 			err = xe_pcode_init(gt);
 			if (err)
@@ -362,7 +354,7 @@ int xe_pm_runtime_resume(struct xe_device *xe)
 	for_each_gt(gt, xe, id)
 		xe_gt_resume(gt);
 
-	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
+	if (xe->d3cold.allowed) {
 		err = xe_bo_restore_user(xe);
 		if (err)
 			goto out;
-- 
2.43.0

