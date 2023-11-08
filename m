Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01591C4167B
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 00:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6CB110E329;
	Wed,  8 Nov 2023 00:34:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A54E410E329
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 00:34:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699403652; x=1730939652;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=+GZCs9+y7w1nYlKZPykMjZCZrABr2RKr/WGdBXcnuvY=;
 b=S+jyXzolDt6yCxSMo910QBKiVG7vDVoCkCOq5JsO406U+zGAzQq7XLnS
 OEQ9taXBwsiZb2wYwDm2q0EmJifx7OA1GIQBpO8Lv2Xh1y1xHSoc6qYjD
 6GBMI1V45VN7vzrEbcvXsGBE4onT5LlmhXICGqr/0s3mHkDnoiKIDkXIz
 her4SPjky225OZ2QBKsC1d/yGGVzvzMYdVcgsQlfwQRJOCO4l0Yb/hADP
 A+p4RdSebYgKsr536iENPqGEmk5gv/M0eWKFV91aEu72R2bRF14cI6W1i
 3IjK7sLRri7Vs98AHWUpd0BFVC9vJhHc8yziFg0AWtQojG6YuJvg2uAi3 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="368991644"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="368991644"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 16:34:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="762889604"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; d="scan'208";a="762889604"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 16:34:11 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:10 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 16:34:10 -0800
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.41) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 16:34:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVHn7p+y+yMsomgAyDQVp3iX3EsuHWGBL86PUOyUgecHf3ezvNZjJLqHCoeHOMpAMWL+KduHaRe6WjtsrUJCrXDcCysbTsrlX5cQKOmbsXDDcjWlkPoxPwcyN5sgFjVKb47/V9r5WK0Kbl1N0qqDwSfr9S7n1mAWtHt0RWiz+yAnOOzMYlhnqMTfV0M/Ybf2uA3QKRzdUkbe7uXGfgtBawORUpomGQgNgdhDN/gz1qbCoZ+2KULVgxnlnsvAL5q/f3BDiRkHt0hNItGCWv7F8GiIujkwbkECDm8nGGKOi6DyrzedCEKwaJtOujmBbOeIYviwUXi3tktOfHUJxBIdNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chkuosaKPJvYOnnSeJOMQqnnscAuDXhHpGXXEbHgrhs=;
 b=i66GBGeSB2yylr+A6qTBSVKarBMwFbGwNZSj1YgmmD+lO5RKdNDxdiM65HpCvR/o0kmEGIWgYpKx/yoMmZrqa3NSSYj3IiWJ3L52nUh6X/2M5Fs09dWXKiRsLNGcq9j8498t2I0hKJaxasISIXRR1ICIm6c/XBqa/7tc+ZcOK3u0DfAnkZc7pgfglD8pNxgylGHcx8RuveRL2IYDrRxPtfjj/Fkp0/Ft+7Kp/3M3VDcuDEWc8JeUC9xVWePhE8gCQmKOKi2N7CBeVeljOIzsm2ems2iSFHId5yRGea89ebIU19OJAfJzpeGvtXQ4sfUAdOFFg33bfD6h+aGjoGRPXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 00:34:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 00:34:08 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 8 Nov 2023 01:33:34 +0100
Message-ID: <20231108003344.1169016-3-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231108003344.1169016-1-michal.winiarski@intel.com>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::17) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: a75de15a-f115-4b99-c3af-08dbdff26bcf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zJB3v4Df1M+AA8jbwX5TLoACqaK7odHGqeGANaoFvPYUlvSeJLduIjR7PLDyb+45MwvZFPhk81EK3EMLG/ULrom4Bb3AxmyHOQ45MQmguUa2o31m+YmIPZhbx301/T8AL7HifrE155I4Y37BDjkURHiGbLHf5UuR6ZPCarArCu6YxZ1ph33UJXJiVMpSBn0kG6t1YI8QZzh7+SBIu9JAM1C0R4Sck/kfZSmwCYo6p4aLb+HZCnHhKk6wOHIwTq4nKKVy80nWMzOUvqjBP4YHD00YsjVu6YE1Ji4BYp4o8+YYgbZ4x9Q1fmoZI8PpVS3afu81E9FXjRiPG2uJ5pun14gZD7vzfdHTVRLlxG0sq7IxWHeN5gCh51QcOYtCwPQZk5RwZs+o0A/+qMvprUxeu47HI0M+H4fqZuPgbmNG1btJGrkN5gMYToxZ5uLFyNFS0+57pnTmeNxj/Oj8Ic6UOlRHocq8znUURNtH9yiFG8lz+zTTi8913+rKi2IHNODwDw661qJGg7BCvFa7vhhrJipc+D8s10H/J/G1GM7DoIDEZjSDqNAEcKZYorsfKrs1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(366004)(39860400002)(346002)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(6916009)(6666004)(8676002)(8936002)(4326008)(82960400001)(2616005)(6506007)(6512007)(5660300002)(41300700001)(107886003)(6486002)(1076003)(2906002)(83380400001)(26005)(478600001)(66476007)(38100700002)(66556008)(316002)(66946007)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUxjSmg5MHRKekpzWTlucU9XLzFtN1E0VHV3MzkrSFd6eWhzVFRsMSswUWRr?=
 =?utf-8?B?NW9YZWw5MEhOT2RTdk81T1BJdmNrdDdCZmxuRDFhOFBwSmsxam9zd3EzRnJz?=
 =?utf-8?B?UUc2enY1OFJIS01US1ZHcWZpSSswV1QvdU9mUnpubG9OZzNPSjFnV0lpZUxR?=
 =?utf-8?B?cjYyZ2hNQXNXbksvZmdwWEZuL2FMZ0c2T1c5M2NDN1ZYSWszazJ3YWRyTFFV?=
 =?utf-8?B?SmdqVG9qNTRXVkIwamFZYmJZQUs0amc5MVJtWHhJL2NJYW1XNXc4VGZLVU1S?=
 =?utf-8?B?SGNQSkVxMGsvSktyQjltZVdjWXB0NzFkZHc5ZWNKdEhMbkZseHVXbTBZTWFt?=
 =?utf-8?B?MDE1ckxyNnVoQXY3S01DbldCaHVKb0V5VXVnaURhRmdMTWJTWjNhRG51TVpm?=
 =?utf-8?B?S0IyeFB6Q0grSUQ4TmFxWWs2OVF5Sjlrcmg5TSs4ZUJTbEFvdEd3ZnFQemN5?=
 =?utf-8?B?Y1VKeTlMc1JhQTJpK0VhbmNSeUR6S1A5TTh3SVkzS05OeStORGQ1VSt5eVJk?=
 =?utf-8?B?NVN6Q0FqMTdPNUJXZ1ZPL3pMem0vdC8ydnBEUUlwUmJsSFBjUjRmRnhsS1VC?=
 =?utf-8?B?WVQvVGVHdTdUazVkMVYwNm9OV2FoSjdCU0hXOFMyZy9hRXprMVVvSEZMbW1n?=
 =?utf-8?B?Z2FPYktaRnNrSUFrL28yTmo3aWh2eGU2OENlcVBTd2pLTDNWRlM4ZnZDR3JT?=
 =?utf-8?B?VFUzMGZ6OVNxOVk0c2VEQTlEaEJuTXJvRm54ZFhaKzJLWjlYZDd3NHZQdWVZ?=
 =?utf-8?B?bTFsVjJxbHhoelBuL0JuTG81Wko3bk9WY0t0R0RlWGVUbnEvRXBNTWtRODB2?=
 =?utf-8?B?MTkxczI4S1V6eS9TZUR3RTJKaHBzdmxlb0NJUVhnVXhoUGJTdEhCdVJ1c0do?=
 =?utf-8?B?QzZXeXZITmMraWhLT3FvOVpvckF5bUJGL3h6YWFrSmtsUmd4elQvT05pby9q?=
 =?utf-8?B?cWJ6d1B4a2w3cEZJTElBb2s2SUFqQkpaOEVjNE5FNGpNaUkxb3UvYytWbWxU?=
 =?utf-8?B?YklLb3ozRUZFWHFyeVdVd2o5S0tDMllDUnFqdkNKVStoTUphRmtSSnJ5akl1?=
 =?utf-8?B?OUZpamtuNkxUN0YwckRwM0xYYlVISEg3RkFvZGdQSjZxLzRaanFtbWw2QS9N?=
 =?utf-8?B?aldraDZseWliN1Q3OFdjL1YySHA5WUwxMys2TW5mZEVOT2dlWUJ6U3AyaDFt?=
 =?utf-8?B?cnFuY1FaMjlnN0JVbE9sWVN2RUkrVkNTUHU0V0c1dklkeXNuMzdzZnFKVkhl?=
 =?utf-8?B?bWNtVVRFWXNFM0pGV3pSeVJ0VE0yZTNxVjlob1pRYVJLOHpyUzZ3aGRpekNI?=
 =?utf-8?B?S0EzT2ttaFQrRGNUL1pLa1E0OS9RTEU3S2daUjU5SjhuS29GL2VtMHdiMVZS?=
 =?utf-8?B?MDVsc2xldjhIbjhRY1loOGFYRm5XNUZkTW42a0RCeWNpSU5IVEJRZzdrN1VC?=
 =?utf-8?B?eXdST29lT2FUL1IvaUpmY1l6SDhwZ2UybXR5UXczQStqazZVZEY4LzVORUVZ?=
 =?utf-8?B?VWppU3dHM0dQTVpVK1loalNVNHVlbUxnN0ZFTUNXb2djcHRnRWJ1Q3J6YkdP?=
 =?utf-8?B?YWdUNm53QUcyVGpWZUk5ZXVQWnV3TjRQWjlFSkUxZ2FDOHcvL3oycUhtQmNK?=
 =?utf-8?B?aWdIN3FRZFd6SWFXMi8wT0dKdnhyWGxtWTM1V3U3aDRiTlpiSCtNT2lRN2FP?=
 =?utf-8?B?aStiVzZWK2MzUVZEazVIUnhkdmxMdkw1Zy9Tam9VV2ZPUWt2VU9uc00yQ29J?=
 =?utf-8?B?MHcySDlDOVVkLzhIMmJNNEROdUR3d1Y1TUNLVUNPYnd1OXIrRGM2cjc1cnFn?=
 =?utf-8?B?L01LUXRtdDZHbnJsUjR3L2hCMGFYVStsWW1ka1E5QnNIczYrdXUyM3g0Z1ZG?=
 =?utf-8?B?ZlZOSmh2NTVDdnRCS1U1VVlxeVdHQnNFbGhERDh2U0VYYlJudjYwSDZzdkE4?=
 =?utf-8?B?SmxnOU5wL2Q4Tmt1aGJhRks4eFVZM3Rlc05WdTB3YmN0RjRQb3psdFJkblhL?=
 =?utf-8?B?dDQxYTJSdXpabG1FVlZHdk5kVlRHK3BuOVBkK1hBYisvRGJFcUVEZzRBUVI2?=
 =?utf-8?B?TXFwMWNWaUdlQ3l4cXRJWHRLVzhnK1kyajZmQnl4Mzl4TnB3aHU5bmxqN05N?=
 =?utf-8?B?Tmptb3BoeGlkZFcrZkFwRGpvMFhNbXdmQVNPMWxzR0pVLzB6WHFOTkxWOWZ3?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a75de15a-f115-4b99-c3af-08dbdff26bcf
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 00:34:08.7972 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gPZinPd8NJqsl7ilYSyQp3zhiVR6OjbJpZpg2FmmWIT4H2oGI12Toqx15QCZCxAIDPo7vaj3uCwR6uRpX+59tJI1JX8UlEK2dD1jFAiqDkM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 02/12] drm/xe: Skip calling drm_dev_put on probe
 error
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
Cc: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

DRM device used by Xe is managed, which means that final ref will be
dropped on driver detach.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 12 +++++-------
 drivers/gpu/drm/xe/xe_pci.c    |  5 +----
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 078c92576062a..78374997cbf6f 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -217,11 +217,11 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 			      xe->drm.anon_inode->i_mapping,
 			      xe->drm.vma_offset_manager, false, false);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	err = drmm_add_action_or_reset(&xe->drm, xe_device_destroy, NULL);
 	if (err)
-		goto err_put;
+		goto err;
 
 	xe->info.devid = pdev->device;
 	xe->info.revid = pdev->revision;
@@ -247,18 +247,16 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
 	if (!xe->ordered_wq || !xe->unordered_wq) {
 		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
 		err = -ENOMEM;
-		goto err_put;
+		goto err;
 	}
 
 	err = xe_display_create(xe);
 	if (WARN_ON(err))
-		goto err_put;
+		goto err;
 
 	return xe;
 
-err_put:
-	drm_dev_put(&xe->drm);
-
+err:
 	return ERR_PTR(err);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 007e272d2758f..84f3e4d901502 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -700,7 +700,7 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	pci_set_drvdata(pdev, xe);
 	err = pci_enable_device(pdev);
 	if (err)
-		goto err_drm_put;
+		return err;
 
 	pci_set_master(pdev);
 
@@ -742,9 +742,6 @@ static int xe_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 err_pci_disable:
 	pci_disable_device(pdev);
 
-err_drm_put:
-	drm_dev_put(&xe->drm);
-
 	return err;
 }
 
-- 
2.42.0

