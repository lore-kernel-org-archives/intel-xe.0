Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65B6BC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 18:01:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 144B110FD7F;
	Mon, 18 Mar 2024 18:01:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E5k2WY+S";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A475610FD8C
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710784915; x=1742320915;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=G+4voLQnN/VtaQAigrY0QUY0W9JtV+bipYaWgZIgikE=;
 b=E5k2WY+SvDHjFATPrGJ5SI/KxmC6zxkbuYxVZp3QV5USnJLTdcap9yWI
 LSmvHyyOAoSFc5MWywDZ1wcv4JsOcoJHURnKoEM7CDW2hBKM2TJlvX1ok
 aJFm6lOMGsRG9omwKRa0P1KliyeqBKek3iJPpkomv/iwBcEAM3r7CHvKQ
 JZaRmpj7prAMVMcvYkdul5zDRN9I/nEloET7D6brVYgBNlcGfZI7L4YbY
 ccIiqOPcQxAApW7x2c6fUYMn873HqV2WTP6PXRpfDgjbGbmSa9VD+xtdq
 Smg553pt9PoPeEFNydg7VDptzEy2YA9YYjivvARG5mXzsHmCfzp6JCGW/ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="23072285"
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="23072285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 11:01:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,134,1708416000"; d="scan'208";a="50965089"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 11:01:52 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 11:01:51 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 11:01:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 11:01:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C+8Py2DvzIAcm/thYYVN87TyChZuqXhFVoanKHF6JtTSPxEfjdSr9TFF8yf5hm1Ll5Zqvhc0Vj0LW5oIP6Sa7u2REUGO0H8FyF5KP15b797mQfHaeMdKCZRXHtsbP189pm6n2ZJPOs+WOjIqXapY8fZfVDrOB9e8FaQ3CDdDOMwNUsmyliaLYTT6cg5HSl7erv2hkNqk3beD7kQhV6YA7vdyJG+MoIt5aD2afNtCQl3f5UpRrbsrMH4Q5ORX1ojPly/CL0qo16D2VwvjLuDYmUEpXw02wRIED0UE+vS83QPxFloX02oE0YbpkrRZmQy3qwg/7DtMiatMttPWmw1qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MxLTkG8u0SkdStVGn8BVK+Q4aSQm0LL8NH+ZRps3x+Y=;
 b=KcsB3s8gzJqZgWWcLuzb4Bq5CnPv5JdULFQyPnWNEsjeaTUvDGATkct0DcckknfJxki8Hg5x+LdIeIJEIVlOXzLqeGyd9ChiiigJvNNBgkSVKKzKOkRYtfzhvLrvyNzICDH5xN2D+9ABgut98BhmB1CDUIBV6WSt+ixeviSdL6c+ALW29bK27z1iwEWAHn+12ETi7yTBs4G7wpM8CMdiR2mCme3S1m7Sdy8DlxnrpszGHUxoLrifKrQTf5JqEv3JIL13hsUHpgck9+yATBrHiTE/RS4OiTiOwlK3FPDXbWqusb54371EytjpRLeSvpG7spvmcz7bJHIeWKoeNtCmGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB6867.namprd11.prod.outlook.com (2603:10b6:930:5d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 18:01:49 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7409.010; Mon, 18 Mar 2024
 18:01:48 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <francois.dugast@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 2/2] drm/xe: Add dbg messages on the suspend resume functions.
Date: Mon, 18 Mar 2024 14:01:41 -0400
Message-ID: <20240318180141.267458-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318180141.267458-1-rodrigo.vivi@intel.com>
References: <20240318180141.267458-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0103.namprd05.prod.outlook.com
 (2603:10b6:a03:334::18) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB6867:EE_
X-MS-Office365-Filtering-Correlation-Id: eb812b3c-2fa3-4606-e688-08dc47757b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mGMdgaUc35yUuRMKIVT+X21k6TfPZYWVHAaBGS0dnDGRKWnd9W34CGM5gb9J0B2rfCacmGDrtV5Ax84v2oX4GhiM8leY3TMqQmsnPy/CU/OS+AUGbDJdnceSMbK48JUS3s0jMELJAG005Ecbu5GquyOw7kCIvbO4xZDVcag42wYqif2OJdbVrazbKE/8qIh6ggpESXDOM6b7rDaWSKx5YqXgzPwxq/jWzjYHuggmoOt53B6M0Xtziop+WIKff59N7dJetD081usaiB+9P1IBmyXEAAPk8nyhLgDHbg0+w0wvDYHE4OCEH81a68FKZd9NCRSg2/9eaBAY/6r8WOCHDxKK5bM1VInQDQaLEls1+Oj89ncLpeH5Sr8fNANhNEG5no1gj3RppH1/LpfunN39ZqrGBhnZpWUoHrCGA9G7MBxypAxC4mES7T8DnngDY0ebMlFhLoF6rqtLclwKPKMNTFyAJSXMSaGOP0pqmitAL+hyMo8cKTRZXreX3GM94vu/jB/IG71j1KAN324w7nRJEfeoHih8b0OW5EM8xtWfjU8s1/O1PEySSKbIADWlAF2TSouy22ZybsWNviTjgCCp+uuj5OpL29/OTT+nErhimsE3yPASnQ1V1H3a42YHUDx2sOrtfNRZ0mIZlxN3FEcNI/ptHSE7jpo+ZdZFG5FoL9U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xF0SV101+k0UkE6RSUkk3fpcQnS5jrJ7KrwlUSQoj5l/9sTMcniuX1/ThQmb?=
 =?us-ascii?Q?Zxj3GTkLQhI0pIUUo6fbkSR2kLUuux2KR1ZhHC2Hvh0cnyTX4XA/YqBO7X1Y?=
 =?us-ascii?Q?9YmgG9j/JWEVP64WWjE9mkXVBneo6S0CqkWo/UgOJL4vD8SixdMGbQ/9lYKB?=
 =?us-ascii?Q?+UeDX16aU6GFrdg3cHGmwDlVlD4M0hzkr59v51keo8l49vHhYv/+Mvd0EsKk?=
 =?us-ascii?Q?NRR4q7hSJ6L+PapJ6YygdOuvm0tXFrl8Z8U0htxK0KQG8PjDJWbRgUhld6ya?=
 =?us-ascii?Q?T7u59+rTJZXsJEMpz+n7EXC1axybgjGnvQBrpXs5ThXuAxoG/BzaDl28A4qI?=
 =?us-ascii?Q?tc6vvGDAcp0pIsZgC/ar0Rvkfj5bsnO+Sc76qYEDyHMliBqQQNd+C3vMW5on?=
 =?us-ascii?Q?VFtAoCz/7H45CwFh+ovrI1QrX6mZe7naAvpxMVHuVgtTPWemDliNnZldL8pu?=
 =?us-ascii?Q?miBuDIyLknciFnVCdK2xjj+NcTTgcQqBhtw49AxwE5MMTBOpuLA6JPBjXEoV?=
 =?us-ascii?Q?mTI87sNvHxPwN98zFB5lYE/XkVVpSrOsuxCjUK+CnkwU+WKCSl2uTMXroBGc?=
 =?us-ascii?Q?ynR1JJSofdQ7vuB94nTimJ/rcrA37kpTQ1mtekBIkVNXehS8JMubX5ramOsX?=
 =?us-ascii?Q?wTvt7xpTnpOMP5+2CzA+iGrRkCFAc2cKiy4IJXLnKeEIN6QwstGs16lyLSUd?=
 =?us-ascii?Q?YJ2rWwXu/q75WQs81Mx7hdbHSHQ8x4cr4SgJWGtj6PSK6gDK4H7tzi4JRzBh?=
 =?us-ascii?Q?aTRWySOSZz9YxG2FTNEbyAZEm2H5u93KO0WMW4MudRas79GFU5hpiN5Fz9fC?=
 =?us-ascii?Q?4zVQKeSHboouT5l7q5crO5U0rbK39wflseQGc29klUMSt2hVkFSESZLM8bDn?=
 =?us-ascii?Q?Drvast6eveqTxcNPfqFVhK2DJv6xnCvDU9VgxE8RBy/Dc40LdK1XORBhOCUZ?=
 =?us-ascii?Q?e8zGtSBA8rT+j7uG/Kaxu3hlYXHKgvtcpow0kr6r/xV3OJdIJVNkotZfBvY6?=
 =?us-ascii?Q?0jtwkCXI8ST3xeWhBwxakwitMA+XYFtiqhT2/MDui8S02GKET2SPCoJtNlua?=
 =?us-ascii?Q?ibkVYXxcyiDjiayQT3re61x4Ct8nqc0kN0wLhni7rsWGY0LHnsLALLBzWIk/?=
 =?us-ascii?Q?FaybnfsVdr0CN9DTXqsvBKrXcZZ32csw1CRIYZIr+1VoYTJEFlT63Cz96UKH?=
 =?us-ascii?Q?CBS9E9avw1ZmiL93g68bC8QQ/eO31ukmkxC6pWI58P7JH9o3no1QXDPCB6rb?=
 =?us-ascii?Q?f2g2/N8jOHM0cuJEMOomzeduqRs4QQ78+l+krumut7vFCcIFiWiPVRRMRD2v?=
 =?us-ascii?Q?SeIsUJ0YGdSnCks37bZUE2SHS6IoiQmJpJ7FGf71otTdbIrET/1L6cnhaAMX?=
 =?us-ascii?Q?U4QdReYHG8vriuEPXebeEj8MrTEpRa/ygV9XalpaeNyWtZd/ruRFh9BDwHV2?=
 =?us-ascii?Q?hY9nTbnjJppFpMHXmL3ejY6vO2lPPM7MlKDFz/e4zdwbfGSLDfBWxxK7tR/v?=
 =?us-ascii?Q?ry6HYD6QHxYyt6qGIolTOOw2rdV12B4lePAYlk3vxpsVZYrlZCoIsIRDPP0I?=
 =?us-ascii?Q?5KPQ+yfBZYKLwUSYoTDxC/cUDYx3P8nvxPys2+f9?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eb812b3c-2fa3-4606-e688-08dc47757b55
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 18:01:48.8722 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/gESf5d4M35aLB5L38wYrv0Trm977LIIzf9HQrsUPK5wKtbpANnhiWYtl9VIXaUXI0zyn0dtsFqoH/jNftaEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6867
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

In case of the suspend/resume flow getting locked up we
can get reports with some useful hints on where it might
get locked and if that has failed.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
index 9fbb6f6c598a..cc650a92c2fc 100644
--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -80,13 +80,15 @@ int xe_pm_suspend(struct xe_device *xe)
 	u8 id;
 	int err;
 
+	drm_dbg(&xe->drm, "Suspending device\n");
+
 	for_each_gt(gt, xe, id)
 		xe_gt_suspend_prepare(gt);
 
 	/* FIXME: Super racey... */
 	err = xe_bo_evict_all(xe);
 	if (err)
-		return err;
+		goto err;
 
 	xe_display_pm_suspend(xe);
 
@@ -94,7 +96,7 @@ int xe_pm_suspend(struct xe_device *xe)
 		err = xe_gt_suspend(gt);
 		if (err) {
 			xe_display_pm_resume(xe);
-			return err;
+			goto err;
 		}
 	}
 
@@ -102,7 +104,11 @@ int xe_pm_suspend(struct xe_device *xe)
 
 	xe_display_pm_suspend_late(xe);
 
+	drm_dbg(&xe->drm, "Device suspended\n");
 	return 0;
+err:
+	drm_dbg(&xe->drm, "Device suspend failed %d\n", err);
+	return err;
 }
 
 /**
@@ -118,13 +124,15 @@ int xe_pm_resume(struct xe_device *xe)
 	u8 id;
 	int err;
 
+	drm_dbg(&xe->drm, "Resuming device\n");
+
 	for_each_tile(tile, xe, id)
 		xe_wa_apply_tile_workarounds(tile);
 
 	for_each_gt(gt, xe, id) {
 		err = xe_pcode_init(gt);
 		if (err)
-			return err;
+			goto err;
 	}
 
 	xe_display_pm_resume_early(xe);
@@ -135,7 +143,7 @@ int xe_pm_resume(struct xe_device *xe)
 	 */
 	err = xe_bo_restore_kernel(xe);
 	if (err)
-		return err;
+		goto err;
 
 	xe_irq_resume(xe);
 
@@ -146,9 +154,13 @@ int xe_pm_resume(struct xe_device *xe)
 
 	err = xe_bo_restore_user(xe);
 	if (err)
-		return err;
+		goto err;
 
+	drm_dbg(&xe->drm, "Device resumed\n");
 	return 0;
+err:
+	drm_dbg(&xe->drm, "Device resume failed %d\n", err);
+	return err;
 }
 
 static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
-- 
2.44.0

