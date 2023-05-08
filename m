Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2BF5C77B75
	for <intel-xe@archiver.kernel.org>; Mon,  8 May 2023 17:06:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FEC10E0FC;
	Mon,  8 May 2023 17:06:53 +0000 (UTC)
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7C3710E0CE
 for <intel-xe@lists.freedesktop.org>; Mon,  8 May 2023 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683565611; x=1715101611;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=FSgpNlrJgzkYMZVc9jDOG+fNmmv5P8nUUktrIzBQkkU=;
 b=WJ3yONKWGg9koFuK+pp226nhXjkgo8d7YQyMMj0eLH+39QRJQH98TTiL
 FMWPz731fb4JPDcxGetqhEyyr+voVvdO3LI6YyORQ+Qkdnx+fLt8I95hO
 1d9v5+KA0ScHb5vpEX67Nh+pqRJ6kNJHDS1jf0CTbZaFJcWgQq43r094X
 privml5HWm5zK3xooTyXpT+5IxP1kE4Bb6yC55cUqZln2TjJW7xwQB/aj
 XIAZZi/iaCc4gRCStIFPRRxmQQxSBdPB1em6+tu8cZpUSjnXQvetqJAq0
 fuT+FUfEW68rqZmB+PQE2N0/fX+w/Vv6LtDH6re74+eFC1i13DQmjDgRS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="412963294"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="412963294"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 10:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="676122879"
X-IronPort-AV: E=Sophos;i="5.99,259,1677571200"; d="scan'208";a="676122879"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2023 10:06:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:38 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 10:06:37 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 10:06:37 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.109)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 10:06:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hhjM+O3PiM7cUtLfn/I1udqdK+gaCkwfPj0nuCrpg6kkGLCShpaMQURO5okVakm5Z1Jo70wZPtTWuZZqxw8KhK6OusYU7A5uW4SnyurPmeIOirXki/NqUPnkgh2hqAt8B34uHIc1wKcIMFTtTf1m2DlMDd5FtHwqYjLDszAt0mUDMHlDjOLYlrYWaBv03GkZbFggTV4u8qsyN+suR2wf/Hjb+LJR0k7Y1Q9cgvnNHvYpa1tS1MEvkKrPlXGIh7QXXolparnYdryt8ObwWYt41NifrOkXeAGZXMcRGaqpwdTc518bhUw3wXngpNcsZFxtVSu7whmjpYAbOJHPe53DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=19JZXXEvb8ie5ybac5ekGWIxdcNArSDGUHrAn/SaweU=;
 b=Qdqh0pCFRrznQ+rr8hgfRoYBGI1TbMFtP2BDDLNzNpsrPB2hpc6iZiQQyNxY3rwwsosr4MCFTs4LD1tJFMW3bZCIIcD58mjKvyZdTFkL1ETJ+v8FvXO7gBpkc1qB2lw9+lrsqoYGPOVYJEus/mKkgt6RfsOmkhmyyAlxzNSxjSUEzbUr8garvzy6iCEc+6cDCHt8hpigI+bNfKCsjz/cK2KTOJq+beJ6/Yykz6wI4HKrGLAx9Xd+CicZdMjUO0MfWDnVYXKZOOqcfgB/jeZ8jiY32GtINgew5vhpqTwLB8ylKCt3TerdPcsurIWg3B4nUqcdPoWQvugcObhwJG/QSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4913.namprd11.prod.outlook.com (2603:10b6:303:9f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Mon, 8 May
 2023 17:06:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::f7ec:aae9:1e7b:e004%6]) with mapi id 15.20.6363.032; Mon, 8 May 2023
 17:06:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Mon, 8 May 2023 13:06:07 -0400
Message-ID: <20230508170616.1289914-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
References: <20230508170616.1289914-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0141.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4913:EE_
X-MS-Office365-Filtering-Correlation-Id: 35b0b610-9fc4-4de2-e36d-08db4fe69487
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B62QBX9StB77GeKcX/+s6BemrfhC9bevbrGtZBKR/Oh0TlU5hMtG16tQMQMY1oqJHmb1NiHTF81VBhSSJDXP1KDffxu2UfdwuVkqPiq/fGXpVuAuZY7rcM81KjjTk7/DRYoSzX1d8/8AuRR9xWC0sRftO3uSSyEouXqBG3U3Jmq9aQPjbKDclJHiG1SLqBowqRsoZOBJwXnm38K9wlanvCeoPWCcmwJGmyuYGQwnPP64PoYyXWE8S6Q5XLxCP+WlyeS72enSM5LaIkh+L4MedDMtw0fTpCBEO5OhQBV8j5WcPdJFz8ju9/WHed8EU5UGVPrFDGQUPXd1F2MSJ9gPA36Tx8pcHWMEyxQZdsbpfM+65U2dKvWW0cftoZ6ZbmGrdcphU9wKrEFvKU1iH/T1yxEXbhqd3FSHMIHJ3+KJuYxJnuMr7cDcKDzIZvSlE92u1XllWHLuNsCc7i+47PvHkkz2fmOMMbSfXwXlw9XCtFxS5orJgI3YGnTSDp1zKRXilSrpuLfDaJLcqoE/aFJYxiZA+PC9Xl97WYtCCKyuSL6n3SdPU6vy408zzlB1bPZx
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199021)(54906003)(2906002)(8936002)(316002)(478600001)(8676002)(4326008)(66476007)(6916009)(5660300002)(66556008)(41300700001)(6666004)(44832011)(66946007)(6486002)(1076003)(6512007)(26005)(6506007)(107886003)(186003)(82960400001)(2616005)(36756003)(83380400001)(38100700002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tArzILZTVgR5iEmwVQvstsX2WCovZcQj0vMIuGhQr0qDwv/TEY99qNAa1h62?=
 =?us-ascii?Q?zQTsBpA4haJBLwEqyOTXWrGnS47YteC4BLBVK0qKRw/j7h8r8gUUoqHRw/Zv?=
 =?us-ascii?Q?Y7xbh/+AT1kYiT7XzcAQ1BFq431cmk4QOHFdTiXaZtDrVsGkIaWu161WQR7c?=
 =?us-ascii?Q?fMz+sKwCxazJJn7FukxlV+gD5QYiv9j+ETxCxjDvDI6FSCwdUzx5imutClDC?=
 =?us-ascii?Q?bOwPrtUndhgwZbN67b0FQwkcQlaUxIsCjvQDQV7LsN5tC7/hNEgxTvUDoBDS?=
 =?us-ascii?Q?FlUgsOA/IZsbDQNcA8+49VG0yxg4gf+A+uYnuskDPZKaUt+XrYXngL3A+TNh?=
 =?us-ascii?Q?nv14htYZKdXodA1KLNRGd2lPwz5FAOdC2XAb11td0qckLrB+u/1hZ5H57XGm?=
 =?us-ascii?Q?4tOnjHvaLdMCJQa61VeX/BO24pcQUGcK3gHcMFnYhENtG9HgpfaaXE38MStG?=
 =?us-ascii?Q?MKSqcgTvHyVlzeFrmAQg+mPBDpjJRusEi1k/aqZoiwAPQtyLQU0l6/4PZQe+?=
 =?us-ascii?Q?B4kIdMFc1mzW7ZQkysa2GSecrDw1LJkyxQVRFQf0fCvpv2N0dutWSbdByIh6?=
 =?us-ascii?Q?wwliDxDOGkQazqDcgcL9TZc75cioS1v2QgJ12xJf0zZiLqmuq+mgOKOrN+uA?=
 =?us-ascii?Q?4cTLDQRFtSIjJETQ+79bYOEDssKE351jd3dar5MqF7YWHMGl8jY2SwJ1YYvX?=
 =?us-ascii?Q?MiJyx8lkgh7h6GSvgKlM7Xo6/bGDgQYpg1WzdsI+Jx2EDLtds78ePS4/v1Tw?=
 =?us-ascii?Q?k6JeX4YZtLyObIBDTAcnUzgigHywRbMX1siROSYmSwoYlon0CTiAkTtL7kUa?=
 =?us-ascii?Q?K2UWdcXmcvQ/fFtb+0JweSPyAnYo5Fpu86I0seVhzSNEWZ+WDiseAt0XrhaP?=
 =?us-ascii?Q?3SadnmgeraMisuZGP4qnu2oCnmky8XUvONuTKmIz1tV/EbGOLbRpOqrkQWsV?=
 =?us-ascii?Q?t/93kFk6xT7XQcFja4l7mz2dnytV5LmtuVuTy5XLzzKKD6jZVJb0S+JzaBQk?=
 =?us-ascii?Q?sxmXAiFmEMnJZexc00c1yRS6L2Mny+KTRmtvR9++5T7+Lkml1JR9u3PbSVGF?=
 =?us-ascii?Q?GmGPgoAeCcNPQ4Xzw3QY+qzx0O8x4/owoiJZQKt6TFYWZzDFXflMgl104E80?=
 =?us-ascii?Q?JQ1bqLd1NM5jARm8+fLeGCQG+BDU8lUh3MghxlzHZsHTnZRxwH+UJFcPiOfN?=
 =?us-ascii?Q?aywG9VLvCvfPNvtcMm1begd7hloNnKTRMBOkFPKpSlnR7ySkMh4pULSL3+4i?=
 =?us-ascii?Q?TD3skS2r+6GUt+90p3AgKcGRmCkHYUHJpoY+oT6WiMpDB99ijYtx/8AvaGfx?=
 =?us-ascii?Q?5gDQHgU2f1u54f0x8dSY+w5BHBl2pTJw2AI+d5MGPJkIKv7ARKLV9wJDbNtG?=
 =?us-ascii?Q?BzyeCMmRqjDBIPIPlHqjrYA0oWBucaaTkq/nr8c5+GVAV6zQXuYv7FFxj807?=
 =?us-ascii?Q?n4BpcddLZJF/ZO7Hgu4QjWSF3ky8Q/4syTN3TS0OBcBiEHB0Ws9Z2JizbbK9?=
 =?us-ascii?Q?VNeo9LrmeY327L7vMfi00bOKJ4JXalfKdSSLIl/cHwroy2PEnKsi5VXWdfOt?=
 =?us-ascii?Q?FPNUFQMAYJuLLBbuDch1EaMT+Sxp46sx7zC/Rvje?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35b0b610-9fc4-4de2-e36d-08db4fe69487
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 17:06:35.8758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VAnouioGoMfhaXNkuYQ/srbWwZhn+Jz+uQzb3bL8H1xXRa9zeL5xJsNzpIqjWhVADmWsN6NB1CNcXojdTQsYzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4913
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 02/11] drm/xe: Do not take any action if our
 device was removed.
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

Unfortunately devcoredump infrastructure does not provide and
interface for us to force the device removal upon the pci_remove
time of our device.

The devcoredump is linked at the device level, so when in use
it will prevent the module removal, but it doesn't prevent the
call of the pci_remove callback. This callback cannot fail
anyway and we end up clearing and freeing the entire pci device.

Hence, after we removed the pci device, we shouldn't allow any
read or free operations to avoid segmentation fault.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_devcoredump.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
index 132b72be4777..ae6ce92682e8 100644
--- a/drivers/gpu/drm/xe/xe_devcoredump.c
+++ b/drivers/gpu/drm/xe/xe_devcoredump.c
@@ -42,6 +42,11 @@
  * hang capture.
  */
 
+static struct xe_device *coredump_to_xe(const struct xe_devcoredump *coredump)
+{
+	return container_of(coredump, struct xe_device, devcoredump);
+}
+
 static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 				   size_t count, void *data, size_t datalen)
 {
@@ -51,6 +56,10 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 	struct drm_print_iterator iter;
 	struct timespec64 ts;
 
+	/* Our device is gone already... */
+	if (!data || !coredump_to_xe(coredump))
+		return -ENODEV;
+
 	iter.data = buffer;
 	iter.offset = 0;
 	iter.start = offset;
@@ -80,12 +89,16 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
 static void xe_devcoredump_free(void *data)
 {
 	struct xe_devcoredump *coredump = data;
-	struct xe_device *xe = container_of(coredump, struct xe_device,
-					    devcoredump);
+
+	/* Our device is gone. Nothing to do... */
+	if (!data || !coredump_to_xe(coredump))
+		return;
+
 	mutex_lock(&coredump->lock);
 
 	coredump->faulty_engine = NULL;
-	drm_info(&xe->drm, "Xe device coredump has been deleted.\n");
+	drm_info(&coredump_to_xe(coredump)->drm,
+		 "Xe device coredump has been deleted.\n");
 
 	mutex_unlock(&coredump->lock);
 }
-- 
2.39.2

