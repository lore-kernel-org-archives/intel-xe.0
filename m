Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CF8C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA6D10E765;
	Wed, 17 Apr 2024 20:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jfW6pnld";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F33010EB48
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386415; x=1744922415;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Tx4ekzDygBAPP9GR5jlli31YELa+ADqlN90xt5E5GVc=;
 b=jfW6pnldwYQn+XTfKDVNHVdpAQp3gF+2lwTuHri303L86TSqtCbP8fwx
 aGSOi1qezzeT7WgH1TsmdZfoddjKyOQm4fv/vXNSNAD44CNMxjaQJbWB3
 l3qfkhcK1Mdo/JqZdR2Ir2t39ROiqhJrHoOpTFlaJCGjVYrZMEzm3hgI1
 pkfogin/f93MY3QYYUx8gqloo+n0X2ItNtdHXhMrpxYr9YxurMFrX+agU
 bPwwFUtqVFECNP6+IwHdJCdXfTpbYw7Qr2z2qOU61q5K8lO2Ym3DyQNh2
 jR5SJHFkK11Nk6ExVRxfyc/U0l3zXn7MFo1tA3Pr390ae/y5M8RiD8JOx g==;
X-CSE-ConnectionGUID: RlwO07b9QrCFdfTQxhYpkA==
X-CSE-MsgGUID: oh2dBYCMQRKQF0SuPqj6xQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="12684275"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="12684275"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:15 -0700
X-CSE-ConnectionGUID: f6wC6MjkTlaQYhW2Bh37qQ==
X-CSE-MsgGUID: XyNbA1fiRZSNxt/dGnE85Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="27546198"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:14 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:13 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:13 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fx8dSinuvHDiSKFphYWk8Sg1+5AwL/6JjQKs4uERE8eCPfL9igLkYowTokKGy1eSIi2oIL7n8x05UMqDXDawudQ3B55f0j8R/7uq+/X7rv25wbazsv3Ju3bttd//Ri7NL5CEQiB4gggSUMRgvELJFLFlupezIMUopm/uD4TtYwG9AMCve6j2RQ3zm+0jKq8nMz2Yg/RZGkFERfKxdbpTwXw0CmV4+7yc29L8gin3GkQ82r5xZhG4zXiolwa6vj92NrsbZ/C10e8roOC48cmQ2oF9PlYAGEpEnPycQ8YZ7LKb874IEg/yPJxvrKTEvqr0Tym4JpCe+3Jb97JaK3yauw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pKr9G6fmk4duhq7pU1JZv/2FjAt+kwBiw3olxqKHYwU=;
 b=aEsq78w/tljTiI7+6Rrm/YyhJIYfnR6GwBxKvyLtr+qvhEyWoxTZe5J35UTnsFwcvhFsAIpDHjDSAT1yErxOjbavh1YvS7vZIhuZBINsZig/V/N8Mzxo3ZAxsrIb+o1Jjh9fr6nvmsjI4igtLfDx22kuVep+gghidjR62UfOtkKxsozz53ZclWTMJBCaR1oZob1Okr/KNm3UJTfNj2O+1qxEhsu9AvXHUcrJDhVRjbwg0xjlH+glRKCTIiMb/AxQDCja5qJU7aiyqyExU2urHyOK1T8zHpwGuYM+Dr8fQSTg+ZTr29K6sTt0btkDEaZwrGaE5CEuGgw/Eg2gBjSUQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV2PR11MB6048.namprd11.prod.outlook.com (2603:10b6:408:178::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 20:40:12 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:12 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [CI 05/10] drm/xe: Remove useless mem_access during probe
Date: Wed, 17 Apr 2024 16:39:47 -0400
Message-ID: <20240417203952.25503-5-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0001.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV2PR11MB6048:EE_
X-MS-Office365-Filtering-Correlation-Id: ca53009b-a83b-45b7-bc16-08dc5f1e9421
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1H7zf6IBpA6c90mib0739Ms6KsqOKgmFHboqrWjKYoOYvk+aVA7h1C0X9PNJuASMD5bZFqYF8SPoi5dNHyRW28kRkl/bsz/Cm/cwwo/9sYKPUlSidjPqnmJFKiJQKI+wIlqs9BPgteUeOYoPszR2F4KkE/z9OiUOjkp3JgcoPWgUMdoG5n4asD+N6PD78TtKX2Eq3rCZ41tHwuqMZ1k5djES/pAXUk20bZZAn34LSvvaQkVwBJrpkP0ZHxUkdmqyDS5ySeJxbiske3GhUBDK+Eav9r1wFeoNU3b/5l9QL6yv6pfaeMhsmMwj2YFylAcGGcHkSuBLXD9y9ZpNDJ7HRseUNWcbvcK3PkxZ6UWQMuWHt3ZdpR1766KymMNa5s2wp47zwfVFceGOsC6Vt3nZ0OeOARJ0q7qRn/bnjJ330mjHrt6t1I+HiCHRTRmyXJUbyh/VvWJLl3Z2ciWPX9RiaC5l01PX+nK6Pb53sL+zt48fxQvIF2/waUXLH4pwKH8KkbDishM/wpcbQy7MQgAi2SFKO0hBrdvdxYYa/7udjCa2BE2r7YQEUmvSpvLLvJ7Aog8Iu+nNNqISTn1CoH8aUPuW1W9X87n/ZZfLYUS8fmmr6cZ5yX4lpN/GUJAHsnQGqZeiCMvbOmk3z/ejTc+HXpX4bbGCRmSLsIYN8zg4Hg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p1CU+7/iDVlZDUXRywqIVPOFb2xyrEFkapns8ob5o96CrvIbCzAGesdlx0P1?=
 =?us-ascii?Q?Ym5wB4966vRI7uuDtAPf53qD3/zwzP4jIqdqLGSRESlrjv2u3LaN1dqAlJaZ?=
 =?us-ascii?Q?qix7ESlmi1mPju4RdU2dZ2xVa4ELelGL68h6v1ZdB9Cmv8/hFCdFDmNAHshL?=
 =?us-ascii?Q?mKeyKxvoc/TEyS5pAKG577ajppZhGZPOzsglwTgul2KXl8UE5JYxT0Qj/DX3?=
 =?us-ascii?Q?faLm9sCYg6XwZqsVNXovPrzbed6csE4c8My6W3VK3GXgUOiAWJqp5I7TqZH9?=
 =?us-ascii?Q?1QKvxhlyAkH77K8JthzHBtliSaYbLkQsH1m1s3vkPCIOOXwbIYZBHVKBrmd4?=
 =?us-ascii?Q?3U9vhd1FXR9AYvqU99GoTJhwsvZqwZXA3oqCHbzDaVdhewVkICIy6UMNeX0H?=
 =?us-ascii?Q?pOSvG+RwEYYLt9SJ3vy2yBmF8haiH9cQ/OCucGBbcPgzAdE3VeBAYS4H76mj?=
 =?us-ascii?Q?WluEfHK7152FJdtNg5jvpfvHZVwpyjVyamFx0J8Ul3ax2DvoOvBXUuj2OP+B?=
 =?us-ascii?Q?28fIfy23J4oDhGBzUUPT3Mtq45dls4RCu+n9FvWXltvWd0DlVLZPorndTNIy?=
 =?us-ascii?Q?Z3Z5xEy3bHCGQaHEYEreNpKBym21Q7DiRy6v0PMMewMkqf7oM5EG37qntE9G?=
 =?us-ascii?Q?olXvZBePf/p5+YtGYLPfp7n48hNE6FSnrQqIxh3WbKnk1Je+qkwWhYsJ3HKS?=
 =?us-ascii?Q?Z1fx36TSzb2AIK/YIS1vfdLFwRoGgf3h7LfKIEaDF1Dwpi4/2yitlKId5byq?=
 =?us-ascii?Q?HqudeHETMpo9DFFgld/EMZHPlJBDM/nwOukM2MEovBFwcKyfRKE0k7fnUX5z?=
 =?us-ascii?Q?gR2CndX6m9jH46y3FqEGc05pAnZO1c62/5PAH80VGDmCujE5ug5qDIyygxQI?=
 =?us-ascii?Q?Gk+cQaqLOKneqrpIHADYlp4Bw/bcbqsYIDYXq7qacL3LdFxLD1scHht9MiOE?=
 =?us-ascii?Q?36qLpyu7IBdTrDh15RQmDgpElh0+iLuT8R/fMSTe/ArsjKrDzu7c0g+SA3JJ?=
 =?us-ascii?Q?8BwoYh02HQp+1EmzeRYa5AqCQVyIip4yP+LrWLED3WxThI8Yv7xSjNl7YDzU?=
 =?us-ascii?Q?XAs9N2Nduc/sjdCFG/PxEU/MiHFT2qpMMOrXOhGgsCw/Ls6otmya+HQ/Z4Ss?=
 =?us-ascii?Q?iztZgmKmhK5WpFV4snZLaDmMrIYLehQlXsOt5Q27ysEaul4jiZ5YRnDakyQ6?=
 =?us-ascii?Q?1mrzF3k2h0wpDmryZNz2cWSHqFzPXnWone9MePc3g62qmMC+pNB/7IHqvyad?=
 =?us-ascii?Q?3nlPYkUo952q2U2PhhxfPUf0oaEGGDkUzKq3Fgn4wlBlIV+UmENcMDE729NX?=
 =?us-ascii?Q?yS0geDXg1rtyWdGo5ldj6ToCG0bw59mvK/De8N1bFDQHCbE70KBIX1kriuyo?=
 =?us-ascii?Q?g7Pk5tclpF0N33Qm1pt9Y52lJqF0/u/HL4CcP6VSmN33ldjZ2snUGKPaxwk3?=
 =?us-ascii?Q?+P4ZDDdn0s3F9gfNYAz/RZpHFqaUjZsPEFxll5aCZPbARFi65vX+BbNwyLl7?=
 =?us-ascii?Q?W+76I/KFC5JNAPFMsr0g1Pq3K2A/pKSFbzYjtcx3/nJVAPxEzgvwc4PS02vd?=
 =?us-ascii?Q?3CCwmlpqAWEl+aHYYccm+LPm+0YxBOFbEgyfMaEu9dTZgMTCwHwpuJXLdM0W?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca53009b-a83b-45b7-bc16-08dc5f1e9421
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:12.0187 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: irW+mkCP4quA8vAbdLoPbJ9YRAWa84NevfLq4Ic4BtVJCZjgUJw0HsqmGqrD3KFEtc2V6yEz3rqvLTiHIe8S6Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR11MB6048
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
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_hdcp_gsc.c |  2 --
 drivers/gpu/drm/xe/xe_ggtt.c             |  2 --
 drivers/gpu/drm/xe/xe_gt.c               |  9 ---------
 drivers/gpu/drm/xe/xe_tile.c             | 15 +++++----------
 drivers/gpu/drm/xe/xe_uc.c               | 11 -----------
 5 files changed, 5 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
index ac4b870f73fa..264b957f3639 100644
--- a/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
+++ b/drivers/gpu/drm/xe/display/xe_hdcp_gsc.c
@@ -70,7 +70,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	int ret = 0;
 
 	/* allocate object of two page for HDCP command memory and store it */
-	xe_device_mem_access_get(xe);
 	bo = xe_bo_create_pin_map(xe, xe_device_get_root_tile(xe), NULL, PAGE_SIZE * 2,
 				  ttm_bo_type_kernel,
 				  XE_BO_FLAG_SYSTEM |
@@ -90,7 +89,6 @@ static int intel_hdcp_gsc_initialize_message(struct xe_device *xe,
 	hdcp_message->hdcp_cmd_in = cmd_in;
 	hdcp_message->hdcp_cmd_out = cmd_out;
 out:
-	xe_device_mem_access_put(xe);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index f090cab065b8..38f6c94c722d 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -203,14 +203,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
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
index 38956b60e084..091c0eb6ce2b 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -354,7 +354,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto err_hw_fence_irq;
@@ -396,7 +395,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -406,7 +404,6 @@ static int gt_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -415,7 +412,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 {
 	int err, i;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	if (err)
 		goto err_hw_fence_irq;
@@ -481,7 +477,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 
 	err = xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
 	XE_WARN_ON(err);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return 0;
 
@@ -490,7 +485,6 @@ static int all_fw_domain_init(struct xe_gt *gt)
 err_hw_fence_irq:
 	for (i = 0; i < XE_ENGINE_CLASS_MAX; ++i)
 		xe_hw_fence_irq_finish(&gt->fence_irq[i]);
-	xe_device_mem_access_put(gt_to_xe(gt));
 
 	return err;
 }
@@ -503,7 +497,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
 {
 	int err;
 
-	xe_device_mem_access_get(gt_to_xe(gt));
 	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	if (err)
 		goto out;
@@ -526,8 +519,6 @@ int xe_gt_init_hwconfig(struct xe_gt *gt)
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

