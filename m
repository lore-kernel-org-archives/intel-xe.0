Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FB48C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 00:21:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 044A110E109;
	Tue, 12 Dec 2023 00:21:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397E110E109
 for <intel-xe@lists.freedesktop.org>; Tue, 12 Dec 2023 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702340467; x=1733876467;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=INwv+YGLtszfJ5XLI9xlwpPmTo2hgBmoxxbDPfyMaeY=;
 b=GMxfHOGmeZGsd+9t98EhvknE/IPSLVNre60p11UjMnt5vQvzAdJK/jGJ
 rJIjV3sTItHA3N9p9eY1Arskb9TXZGGNojkP9S/uABVD7PGjKxYhiJJGm
 Z4IOJ+1q258d+NNtH5G8Gg/nkA3H2S2DfDcB5jteVbRK/gt1F2ZXn0ssf
 qUzThcpm/Yx2e9vpX1lpG2LY2HzMk9yYiKh1eUTFJVcWHXwdPqcmG4vtm
 LmAHz1IW2Jdm5qelaoY6QIrG3NoWFen6eCd7ui4tnOIb7GttW3e9dy9S1
 rElkw15XkNJn/B3a68RSoFTYPiYECWcqJt42cgAxlZRQA5Z52KgFSjVqd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="13423709"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="13423709"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 16:21:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10921"; a="1020464175"
X-IronPort-AV: E=Sophos;i="6.04,269,1695711600"; d="scan'208";a="1020464175"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 16:21:06 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 16:21:06 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 16:21:06 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 16:21:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVLumJ77GWDShNKbdMSKxCAztPZ5m5IUvOp8NQcznrQOBUG7mwD8ikEMY2Gf3viA+ZMNqyVNjacky6rI8YHvSA+nv/HdonQyPlgDO5jHpWU2HbZAxqxJkv+cjDp4sqHAGgw4ZYCQiPBdwkD0b8xgh2fiNkCrDgc/nnXrKA0m6h4UmugewKhrYytPyihRJVKwmXrwPtmcq/gkAi9NUJrLaL0hYcqBraA4BrLLS8CyXP0D0ma6YJ7gxSqfEFvVR4Qaj5hUuDSFfP68UZsUe/o6ysS4fI9LlfQTWHxLKdCQTdmbXH1VA3QAChZa9pQQPqkvXipz9MNQX51RrHC3hOMzdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTqnuDReqEZyTbbXrTaVyreprEFnnZcMIukzBuF6MLk=;
 b=gG6MJItyX9fpSBrgH8Xk4ZXQTFrPpm+axWXNKp7gpP0IrBIs6zS6OsoZlsSXwTuMp4QvutVgywGuanjqAtuL8lbzI5M5x3b1/7jFkFClg9rUlNfTDv96pN8vzTumI60ibw0iweWcT3XQ8LgHqLkxHMHY4l59rFUu0Gv7ALXNrNqp3a6gN5YSK/B+rEpTSRh0lqZnxCP4QXZn/YfYPXCkDETnd4GwoNQTyW0/c1HfuCwzLliPuxnmMvRsz2HEzEZMxEeLclqCkAsHOs/VWZxZgMDSqeaBNaaerNCJWAQBuewz2X+6nei/nFP8nFdAHv4+x1iO+v2xqJ6iV6EAlIxBgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.32; Tue, 12 Dec
 2023 00:21:02 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.031; Tue, 12 Dec 2023
 00:21:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Remove vram size info from sysfs
Date: Mon, 11 Dec 2023 19:20:58 -0500
Message-ID: <20231212002058.1105898-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0007.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::15) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB5533:EE_
X-MS-Office365-Filtering-Correlation-Id: 7729a68e-3fc6-4054-b65c-08dbfaa838f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FVxfMioP4jGYtAJWe8zvwMxbAvq4mxbUFay39K6EZoJkeLKbuW5Y5gPwhwZDS6AECCGzukPMhZIgOZJG0+4i555gU3NLtGAXqBmyMXp0i7D7SnZzkOVkNywg+ng9/AOoujVHUhypInSk7BByEV8R7U9MsY6huuPK2dF15j1j4h8EVVikfUDv6sofQcBmKskB81DlCRGh0XLNsQOj8EBi55uV/ax4LZNb0viaAP5uK22mOSaT2NYmccqvTCJPaKTEhhLQtJfHQWIkoOF4d3ohRMDJiKdDK/ryV+eMrBxQugRW1lT0ezCdgi4K7E7gRNVPIuuJfksnx9ESchtn2/k9iWtWzm1241jq4CiaMZqT2Tp+P1+5H8t6rsts69dC3/yo6NJzsxVAZlkViailCL8vQUZo2gJupdOMue24IiYZuhCWkLnCuzT/Xwyy1u8lpiCIaw/CgcK7tyVMhEiGoKHj6lpjY71xcogX/NQe/+6XYiRloLl5fs5NDHX7irO0JMSsFqH7MkcYRKi7TQNgqsVvHMzFVPfSBn8fpc066/FRYRuOa3/MFdhKEZ74QNw7GUWc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(376002)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(41300700001)(38100700002)(2906002)(5660300002)(44832011)(316002)(4326008)(8676002)(66946007)(54906003)(6916009)(8936002)(66476007)(66556008)(82960400001)(2616005)(86362001)(36756003)(6666004)(6512007)(26005)(83380400001)(1076003)(478600001)(6506007)(6486002)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VanQO0KGOWqhy8SfIairLchYiwNIOwtBbiFxlcyp4mEbvRBFZBya6l0GP3Ma?=
 =?us-ascii?Q?FGbwxjOIZ2+RAzrTLMnoBNNjwAZI12B+SQWxDV9O9Ekg6sG2COl8HR/xgthk?=
 =?us-ascii?Q?0dAxE1wdBW4gmU9x0FFXhE+TvJzlIgQ/TAAoSJYu2jOS2npi4x0dvDzrd0zF?=
 =?us-ascii?Q?oWcObLv1Ymtjk8CopG7lGlcADbCcRvReF20sgIPGHuMdfoFaH/k824nSDklY?=
 =?us-ascii?Q?KZzrLuXykLZwenUsgXeNImexvTbCyJbXrsf6n8C2S4WIUz0wgRWMRE882qBo?=
 =?us-ascii?Q?eDxfCLvfoKo5OAPmN7KEe/mtO3eXdQdMEvdvgndIrkxD2KJ3Wa6sz64H4jfr?=
 =?us-ascii?Q?os/1ESjMaUDld3u6yW+9m24/sW2jTVu+5nEYcZMWJbqDwgPb/dyeM4/6p91o?=
 =?us-ascii?Q?L7DRsmvkCOyyLOw7wtkRSj6kpiQmJURdRlLl1ytcz+4YlMdUbT8bHLDlf9FW?=
 =?us-ascii?Q?aD5782n8gSyqw205wAPWnm+ZN5j4G6BMlH2zNWE5uXkwB8RxE/zrAs5F3LJL?=
 =?us-ascii?Q?fCbxdip3kfMNkgwzzvpmFfbAaTWalexE1j9MJi+Ei4rUcO08+URQ9LuTRA4i?=
 =?us-ascii?Q?9RlAnQy7+RLx4Ts+8OAzH9aaLItZALmckrtjxY2rj9A+hFo+NZOeZcXVGWqt?=
 =?us-ascii?Q?EEdp8d7CqlJZ8DowX0LrwdFJ6UuGjkoLavlEphIQqOS1eQT+j2HRMIxjzAZG?=
 =?us-ascii?Q?LKcFlBqdDqAkK6Rb11yB+lLCAuKDynOsBDuZRmE/inv8YmWG0HkipViIsUWI?=
 =?us-ascii?Q?ZvIKgkUtWk8VZon1pn+IqNZ+rKfMArhpBQc8eBukr4ue9RiD3aA8OcZUiUN4?=
 =?us-ascii?Q?rFMwc1FsxIUxyVNIJ4GSTzM8wsKnmsIoQgIhoGqCyyJ7LNZXWVAtn4/EkhSt?=
 =?us-ascii?Q?Q3iR6CFbKnNjBq1FO1RgNwP6MqiyB/3wqsgoOrC/sGvgS95vkAdHJL9JEyT+?=
 =?us-ascii?Q?q4i64ZxLKa7H9XLQWWMrPAX5eBXbdkqCYc/EhskZmHMfsMRLU1ymLrdwqkLc?=
 =?us-ascii?Q?7jlsVHisfMCYnTUb6XRl8IV2nirP5tROxjAmSZKdy2o9AKMLE2YAE0wrPyGD?=
 =?us-ascii?Q?y83oxYGC27Ag0GachhlD2Wyt4udZwlCD2M5jvJZXmZ8BPq+hRIVJ2gHTHitN?=
 =?us-ascii?Q?zxoCTlhQYQr3f9/cjhQIx8nqTAD9hRbTAA8rOomrand6bvNqD13haBoDslzU?=
 =?us-ascii?Q?BFjFzGITz9W5UGpJ69QPzU5bQZw3pyzlFnAw2RUGrt+jCWkM3ODhOa6qlLOx?=
 =?us-ascii?Q?x9Nu59KXbTBzOWWlFi/6Y5b5izeq4Ib+SKn0DPd03MPPvQUgCR8V65vYSBuN?=
 =?us-ascii?Q?P+7xdI1KMrxfbBdqxa83c+yq0ZHboYyzBONgQrveTiJ4DbtuGVz57LZJE7Y7?=
 =?us-ascii?Q?lRJ4iBZ35D0SfmjWSsDguGmgmGQjVDUeswrkGfqzLjTDSXp39+tb1spQLurI?=
 =?us-ascii?Q?/buNT290ooVsRxohjprWN4sq/7PrYA5TjJPV0P/AuxRBe8AVcIOfCO4PrQrs?=
 =?us-ascii?Q?dEe1lftyOrkC3NxLenrXiGRXHLR1YuR1lBcYrLDOEY+0ZJvdhs8JSHf4bDa8?=
 =?us-ascii?Q?lWzrDM9igXhSKoIrTXHkLw0uBZuC3to9y2JQG76UduEkLDs8M5nai9b4nOxD?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7729a68e-3fc6-4054-b65c-08dbfaa838f3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 00:21:02.2052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Wbm9cKBuZVrZXjPz7fSSzOsrJgVEbs2/vHnh2pDcztarqybNDMNhZ1oHROS2+GoGHPyzCM4/323S3mSamvVoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5533
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This information is already part of the query IOCTL.
Let's not duplicate it here in the sysfs.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_tile_sysfs.c | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
index 16376607c68f..0f8d3e7fce46 100644
--- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
@@ -20,20 +20,6 @@ static const struct kobj_type xe_tile_sysfs_kobj_type = {
 	.sysfs_ops = &kobj_sysfs_ops,
 };
 
-static ssize_t
-physical_vram_size_bytes_show(struct device *kdev, struct device_attribute *attr,
-			      char *buf)
-{
-	struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
-
-	return sysfs_emit(buf, "%llu\n", tile->mem.vram.actual_physical_size);
-}
-
-static DEVICE_ATTR_RO(physical_vram_size_bytes);
-
-static const struct attribute *physical_memsize_attr =
-	&dev_attr_physical_vram_size_bytes.attr;
-
 static void tile_sysfs_fini(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
@@ -64,15 +50,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
 
 	tile->sysfs = &kt->base;
 
-	if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
-	    sysfs_create_file(tile->sysfs, physical_memsize_attr))
-		drm_warn(&xe->drm,
-			 "Sysfs creation to read addr_range per tile failed\n");
-
 	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
-	if (err) {
+	if (err)
 		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
 			 __func__, err);
-		return;
-	}
 }
-- 
2.43.0

