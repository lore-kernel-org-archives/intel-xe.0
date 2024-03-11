Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E400EC54E58
	for <intel-xe@archiver.kernel.org>; Mon, 11 Mar 2024 19:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A50F1112C3B;
	Mon, 11 Mar 2024 19:29:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fPJJwsob";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9003112C3D
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Mar 2024 19:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710185381; x=1741721381;
 h=resent-from:resent-date:resent-message-id:resent-to:from:
 to:cc:subject:date:message-id:in-reply-to:references:
 content-transfer-encoding:mime-version;
 bh=D+RihmXYC+bAQsE4LJEaV9QlNfMYv6I2owL6UZ7uuqY=;
 b=fPJJwsobDPAZ9IUgL8mtxFcC0Le9OqtoZSX8+KRdVgPxHmklusQQ5gLn
 3KsOsK5g+GU+j9DueY5FqAle/IpDj2JFgbVm8+G6+IieN6JUUTG0vUSOK
 fGJvEC9qalbfmmt3WmIaaAIsj0+4zHb9+Xj1Qx5nC9t9AIZSZLdiYtF4C
 TdLMzdEgwlGHvAq6XItOqtWtVjwA7st/XWOXRWG0VcGKwEqW2onPG4KdL
 YydHsnktjoFna7QYFlfwT0yDk13+mLsMphJMZoWfck6r3G55OzEYPv1Do
 EgahFkiJ/b1nkhipw1wn1ZlhTLxcMFWWfUuEfb3WyrNri7kQ4tWj1Zzea Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="4986607"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="4986607"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 12:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; d="scan'208";a="11266845"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Mar 2024 12:29:40 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:40 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:39 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Mar 2024 12:29:39 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Mar 2024 12:29:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5EaklvFAgApQsTfUZNoxa31/4Pm+gaXbL16CJreF9X2PUvFI+Yy4JWe+cIyZJ4Jj/fr5EkGnkIyYezu/amOpXZ02TQRACnAYks+7o/PuzLLuddMcmvHDla751bl+ZR3+aI1QRTnIypMvLqRy1vAeSZ8GU4aA0zJwdkCp5U0lJ1lGUZIxMzjVoLVBjtu9ARhkBR9OkCTUrPoxzqgt6x+Z05BVkT2lOmQrjc0ukIBmGgzU1KPXes1CyrsClYpkwQwJU380shM3u9uIN4cMbnLLq54weFOHb1xN+2kdA42el09YBN825vZJdkO905mLsqq0FRVIVY5KHobv2EeCKaZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=24zD2mAbeMS+ji9nUAohFYLguz2LBzIyZuIrnbwaUs4=;
 b=BoyPPDeYATBstjYn+VZR4ll9isjJByBqHmIhRnL0kfZIqKBHWbmSWtZ/y9Db0wcKix9AcBQ3gwPH1b+VjaPGvg2mr4kihbQzxkIVBU2TrmRMZN0yM2Dcyc/e1Peg8QNre8Eu6OwdopqlLzvSE3jQdIy/DbKjm3iPUaxx33HHotMO7R6JblpnoCpr/ZIXR7BioZ8CWyytFkS4W2DdJqASESKjkcrVN3noY1UE2NLGS8iopgkmpHHd9QrvqIstiTx7fW+kcY9oVAEWxn6KKeEV6XEI2FR/2NMPvpxUCCjeu+EEqeEj9ftmv8nqkU1a44FA5wm4N/QiRC1prYo3qvQw9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CH3PR11MB8548.namprd11.prod.outlook.com (2603:10b6:610:1ba::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.25; Mon, 11 Mar
 2024 19:29:37 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7386.016; Mon, 11 Mar 2024
 19:29:37 +0000
Resent-From: Rodrigo Vivi <rodrigo.vivi@intel.com>
Resent-Date: Mon, 11 Mar 2024 15:29:34 -0400
Resent-Message-ID: <Ze9bnopbNmWl35Bx@intel.com>
Resent-To: <intel-xe@lists.freedesktop.org>
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-gfx@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 06/11] drm/xe: Remove useless mem_access during probe
Date: Mon, 11 Mar 2024 15:22:58 -0400
Message-ID: <20240311192303.33961-6-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240311192303.33961-1-rodrigo.vivi@intel.com>
References: <20240311192303.33961-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::35) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA0PR11MB4526:EE_|MN0PR11MB6059:EE_|CH3PR11MB8548:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ab19ce6-c6cf-428f-e11d-08dc420196f4
X-Microsoft-Antispam: BCL:0;
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-CrossTenant-Network-Message-Id: efe6835a-34e5-4f79-dbaa-08dc4200b8c4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:23:24.9244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJZf12zJiwLBvEMrhjgdHpLe1b5MyaA79S83j3qoewyYj7NLGIjK/vUaB4Xa9b+VmQSX9w2rQJ9q0ByhDznhnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4526
X-MS-Exchange-Transport-EndToEndLatency: 00:00:01.3023690
X-MS-Exchange-Processed-By-BccFoldering: 15.20.7386.010
X-Microsoft-Antispam-Mailbox-Delivery: rwl:1; ucf:0; jmr:0; auth:0; dest:I;
 ENG:(910001)(944506478)(944626604)(920097)(815096)(255002)(410001)(930097)(140003);
X-Microsoft-Antispam-Message-Info: /xTB7ztfKR6Vt7ARHpNFzuEx6hU3Hkv+mlOPHlQdifWTi2HT8eZ/ZKQAmtXqAJ+xB0oDMImqek4b3I3Ud2MAXm7Er2BWEKYigHzO5fy0nWEr6vA+/Hp9OXi9PnRYXui2dCYEn+xgo28pz4XGMVGFfN1fzMp++BkptIoVT97HzD3NYoqLGDico7iV0sJ2MWxh8PUamUS0NrjO8SOjovaFTGCF14gNMvepWwST6S+aIjDNFIJkI/tmkwtUwlgIgoV7lySVEMgxVF1X+OuhIDRGk0/LQe8brLg/fqv0iZGoJAli3MnTOgWSLWSqQRES9wW55TogX2WOl9OrPVq0OwgUFyfrtM7PRnMZQjuDwtytPtombk8swFwEEVjNMKEEAkm+KsCVF4FE/rZvhPlf6x2mcxP4VjOSctznydUfc/AlSh0shXVgoivjbwr71GqB4RKyGMO4zBneLzdAzkF8VjiH2yAZfQhXShWloMVLtQQV3Z7ZtkNZhUxIXs2pWqn5+AtV5yElP38jOf9HjQL6MeAeAgH5UrOyzbkwXJ1K7m6yE+QzKMIo0ucFMwqT/qYVIOsZqJunyp52NjLNarfeg3ndWry0OPHmGcunMAz6WOqw4zCiOX6pDeZSIdp4DTDjnXBORYJVTMAnV+pu7MdaA/FBQWaBULiLHCEZC6fmYPud6XA=
X-TUID: 2K8kaRPjqTi0
X-ClientProxiedBy: SJ0PR13CA0022.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: efe6835a-34e5-4f79-dbaa-08dc4200b8c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fEu7yD/DYTHuVUS1pE86jq6hTv9voQUwQa4z51x+JMPZgDyg6uJ24H5R23df?=
 =?us-ascii?Q?lUIyJSHBMg4rGiuWi7tSumeNHrHrkJMEJUHBQTz2z2+S0jw6sVGHnWafc9YJ?=
 =?us-ascii?Q?IZDGrmE9qUWq6P6v+z9zgGI/AvYGGD+zLWdQiC8dcrlEVJ9OGaPFGji2k//h?=
 =?us-ascii?Q?Jo0BncS4GGb8fer7Zhc7b3TSVv35lx/Z9bv7Owe1Yw5v6hkcpRtE6Myl0ArN?=
 =?us-ascii?Q?Z8Ty9QV7ax9Mw1zboIA8eH3GwZlDCHNCUK6/N5xtUjT04vgKoHkWXPestL91?=
 =?us-ascii?Q?agt5miQAjUHijsxnG45q2JHuGLq44+75nYMuJsYTFXQ394760ww7gvVh5xd0?=
 =?us-ascii?Q?DaJaigKdFEKdUrOIBpGBGsnXcEbw9EmAsTXRsrRGvDsPycWiuMNSiYInX380?=
 =?us-ascii?Q?xr5N+DqsXBLOanBAETZsos6SqohoXYSZZS1XiSFFFyHYrc/L6jz78AIbePoR?=
 =?us-ascii?Q?C+YUjgmwZ+ekqCG4GrXNkgQakep2E21heXCvfPVNi2BoUKGRwKCuN8lTg90S?=
 =?us-ascii?Q?oCEZsu0jeZUfX7aZ9EVg3676iGNeUMd3una/Yw8kNYj5GSQqJ0qQdwS2SGDO?=
 =?us-ascii?Q?qyBKaxAEs79klK0wDOMRFB+dnTzXWpF8x3JSRKgTjioI3iTB+ypRfZEozWFd?=
 =?us-ascii?Q?PuqDfTCXx1QQxUjXd2Xk5WgFJcqNxjVN3YLaPnyoDugwK12S3vKa+yx1ptTp?=
 =?us-ascii?Q?kzEADE7Fmj+DdYzDXfiW65WzEGK+qLSbQcAgZYDzcPO5slCHr9KDp+Qou5jJ?=
 =?us-ascii?Q?qiyfOYN1XCjVDAFCNZbct58dh4B1yy5aT9OOhHySPE2bkilBIUKZ4cuo/R5K?=
 =?us-ascii?Q?KGIRYIODWALQnDS3c+hsERqxXGzVljKiFWydLfGozUx8F0IEGgQEf3fjJfjj?=
 =?us-ascii?Q?ldsCJYUMhP8jYqQumZtsy1KOJuPXIrDBY4I9dsHlBjr4NFf/gRYrdpQA1Niy?=
 =?us-ascii?Q?aAO0CC6GPRjcdhxA7cqO7ABZHRwQabFrX2Bil1rnGVzbkkb9oq/2RpyTIGgq?=
 =?us-ascii?Q?zJoqv6Au8xivCSpr+5yRwcvtdmLIWuD4LMR/XPAOdSphlKU2oMMlBNFnp+2E?=
 =?us-ascii?Q?mKJWAqIq+BlTU4Unphz3KXdWRddV82SN4eM2r9+pkD+Q181MM8at37o1h708?=
 =?us-ascii?Q?mjXMRTu+bExtZ9BEvGhV+NSLMN/Dq7sVy2/z5jTpQ8d76B8fqGLM/XsBY9ru?=
 =?us-ascii?Q?WPu2FXUxW5KTdC0JDjKnRC5yNiOzyVuO00Zb0pu+yNlj8jt2rnpUf8MqW9VF?=
 =?us-ascii?Q?Mj0RT29AjUmBdev25d1sXdkcwojg3NChxzS1oHM+YP6hlJZU8ojzC+fo8umZ?=
 =?us-ascii?Q?q3KwPtHEzLEL6GmoScdSNtrqphmtvmG0jFZisH2NOcjTR6gOkr7qYJT4GKYw?=
 =?us-ascii?Q?Uu4Rj5o1eoYw05gSjsP5E6zjTw11QZnuLm25fmTUr6Rf5wHtG6RtYWTkNGEz?=
 =?us-ascii?Q?KFx5bgzkInZWLY8xgye271Wf4g5YsFJf1fdASY37qijqvIxckYssNuVPCJcn?=
 =?us-ascii?Q?7sNEU7s9XOFRQKPXduypMDomBjkhDqOcZPA/mFvXzm6CIAM/Es94DWvrLc6/?=
 =?us-ascii?Q?3aAqLCZC44h0qNFNfpm9J2Po7cWnV36mtX7Ec1yH2aFCGeZS/A4muUzlb6vp?=
 =?us-ascii?Q?sg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ab19ce6-c6cf-428f-e11d-08dc420196f4
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 19:29:37.6932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFnBPuyyNUnCFinv+gAEL5dd2Dx6i+5mdn/0jSsGX+454aIt0FqD0F0cEP4MXz9RdaChVAkTX4h/0ovkxucRtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8548
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

xe_pm_init is the very last thing during the xe_pci_probe(),
hence these protections are useless from the point of view
of ensuring that the device is awake.

Let's remove it so we continue towards the goal of killing
xe_device_mem_access.

v2: Adding more cases
v3: Provide a separate fix for xe_tile_init_noalloc return (Matt)
    Adding a new case where display HDCP init calls which
    are also called at display probe time.

Cc: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c             |  2 --
 drivers/gpu/drm/xe/xe_gt.c               |  9 ---------
 drivers/gpu/drm/xe/xe_tile.c             | 15 +++++----------
 drivers/gpu/drm/xe/xe_uc.c               | 11 -----------
 5 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index a221f0cf4bac..b2bd56a9b76d 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -70,7 +70,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	xe_device_mem_access_get(xe);
 	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
 				  ttm_bo_type_kernel,
 				  XE_BO_CREATE_SYSTEM_BIT |
@@ -90,7 +89,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	hdcp_message->hdcp_cmd_in = cmd_in;
 	hdcp_message->hdcp_cmd_out = cmd_out;
 out:
-	xe_device_mem_access_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 325337c38961..0f96b7db6dcc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -206,14 +206,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	u64 start, end;
 
 	/* Display may have allocated inside ggtt, so be careful with clearing here */
-	xe_device_mem_access_get(tile_to_xe(ggtt->tile));
 	mutex_lock(&ggtt->lock);
 	drm_mm_for_each_hole(hole, &ggtt->mm, start, end)
 		xe_ggtt_clear(ggtt, start, end - start);
 
 	xe_ggtt_invalidate(ggtt);
 	mutex_unlock(&ggtt->lock);
-	xe_device_mem_access_put(tile_to_xe(ggtt->tile));
 }
 
 int xe_ggtt_init(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 85408e7a932b..063b710a8c7b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -347,7 +347,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -389,7 +388,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -399,7 +397,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -408,7 +405,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -474,7 +470,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -483,7 +478,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -496,7 +490,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
@@ -519,8 +512,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 out_fw:
 	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 out:
-	xe_device_mem_access_put(gt_to_xe(gt));
-
 	return err;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 0650b2fa75ef..74ecb5f39438 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -160,24 +160,19 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	int err;
 
-	xe_device_mem_access_get(tile_to_xe(tile));
-
 	err = tile_ttm_mgr_init(tile);
 	if (err)
-		goto err_mem_access;
+		return err;
 
 	tile->mem.kernel_bb_pool = xe_sa_bo_manager_init(tile, SZ_1M, 16);
-	if (IS_ERR(tile->mem.kernel_bb_pool)) {
-		err = PTR_ERR(tile->mem.kernel_bb_pool);
-		goto err_mem_access;
-	}
+	if (IS_ERR(tile->mem.kernel_bb_pool))
+		return PTR_ERR(tile->mem.kernel_bb_pool);
+
 	xe_wa_apply_tile_workarounds(tile);
 
 	xe_tile_sysfs_init(tile);
 
-err_mem_access:
-	xe_device_mem_access_put(tile_to_xe(tile));
-	return err;
+	return 0;
 }
 
 void xe_tile_migrate_wait(struct xe_tile *tile)
diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
index 7033f8c1b431..4feb35c95a1c 100644
--- a/drivers/gpu/drm/xe/xe_uc.c
+++ b/drivers/gpu/drm/xe/xe_uc.c
@@ -32,11 +32,8 @@ uc_to_xe(struct xe_uc *uc)
 /* Should be called once at driver load only */
 int xe_uc_init(struct xe_uc *uc)
 {
-	struct xe_device *xe = uc_to_xe(uc);
 	int ret;
 
-	xe_device_mem_access_get(xe);
-
 	/*
 	 * We call the GuC/HuC/GSC init functions even if GuC submission is off
 	 * to correctly move our tracking of the FW state to "disabled".
@@ -65,16 +62,8 @@ int xe_uc_init(struct xe_uc *uc)
 		goto err;
 
 	ret = xe_guc_db_mgr_init(&uc->guc.dbm, ~0);
-	if (ret)
-		goto err;
-
-	xe_device_mem_access_put(xe);
-
-	return 0;
 
 err:
-	xe_device_mem_access_put(xe);
-
 	return ret;
 }
 
-- 
2.44.0

