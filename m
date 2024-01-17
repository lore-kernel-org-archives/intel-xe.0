Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B45EC47422
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jan 2024 07:43:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7C310E626;
	Wed, 17 Jan 2024 07:43:14 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA66310E626
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jan 2024 07:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705477392; x=1737013392;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=H/fCDIC3IgKmeioaxLKjT8tI0Ian4NVnA1pGZYBD1FQ=;
 b=CArqGswZ/SPiCT73zgMO9ZDhifrSM/iFz//Yc+HHSQ5kqZ4M5DYJKcxZ
 EKA1Z/BPeHNHFx6jpBdFutkkbc6gz7nG2JTvEy+YlW2P3NWQ+0fFrIVrh
 /Ms0ad50URV7JmW+GnkLd1oEOPb299KlAJpmybG7IxFrq5STGZDU0pVqz
 eQ7JxRPjcGaOlhWqkrZLwlCQU+S2zMB2P3EUUUvPanmBH2H4jcZVxLbpi
 27fA5rhxlTAwHOxv/tyLMra76zao3FWosCQCxv9KwzU0u6NyVgPCLamxX
 AwW22ml8AJBZlFCLTd6cG8A/zDjJKZ0XNimZN1msV5oTcf1UaXSiz9pYQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="6854584"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="6854584"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 23:43:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="733890757"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="733890757"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Jan 2024 23:43:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Jan 2024 23:42:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Jan 2024 23:42:59 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Jan 2024 23:42:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LYqUTOWAh6tnhNavHPUBU8E64TckTGiQ6eQCfYbwZ/h25ozqsl4hyX1lqqPEgM83tD38EqrZktv48vBlrSOAgkvJqLnHSV+6EmWvfxpFlgbqR5oMNqJBGkQo95fpicQWugf3yesKrpL9GERu/wl6Nm2/O9r50j4kfdUnSqEHFr2a5EY7p4Odc0LKZJBoeqWkNN/RQEzpugHHmOwqG5lccA//bcnkqSFR49GbXSAsMNhtSF4/JzSrMFYbHKRGIQKryal3sm6BXj5W8wyr9f8yZ/fgYxMvFwqNqBB4LqaBzAu1GA3ZL1yyCPAbgcSKQrdahZr5GJt2EF/8gR+CiW4Vqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYJnOX7tg1JTgUVvj6PYZ+v54phGoKJrO3C1z1tT1Ig=;
 b=QVEzEfOYvlPXvL8lXzpfWp0iST+RgKq0jwZemLrzTQDtZuICWU/cNBdwAnA4Hbue9Skukf118irW+t7/Db8o7LXPF/G+RDVKt5peFettpfdMqii+G7X0GH9T95VC0+f3KWSETarQwUxhseKks96vcFlK18dQOlXmuGiiZurnissG6ZHf6KCOBloenDTfBSRpp9UrHkUCaAu20LLvQcHkxMRG5jjaTiap0gOE/P9wHQ1uuvPJpp5Isx+015PcwcPhpkkjN6JLa5Q/V49rerLz2WG0ptGKR58wth2uI96NopFrvl0fVcO+v1QAx6wlrNLnm3zBSr2fFPMniN/iRf2aIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6952.namprd11.prod.outlook.com (2603:10b6:510:224::13)
 by CYYPR11MB8386.namprd11.prod.outlook.com (2603:10b6:930:bf::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.30; Wed, 17 Jan
 2024 07:42:57 +0000
Received: from PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd]) by PH8PR11MB6952.namprd11.prod.outlook.com
 ([fe80::f6ca:b25e:ebc1:10fd%4]) with mapi id 15.20.7181.026; Wed, 17 Jan 2024
 07:42:57 +0000
Date: Tue, 16 Jan 2024 23:42:49 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 1/3] drm/xe: Cleanup CCS mode related code
Message-ID: <ZaeE+U2urHOqFCCY@nvishwa1-DESK>
References: <20231216214120.7394-1-niranjana.vishwanathapura@intel.com>
 <20231216214120.7394-2-niranjana.vishwanathapura@intel.com>
 <vyqdj7jwut56pord3gz37ncgajlobnqfumfshthfei3yzmyd2a@5wltdwata2t2>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <vyqdj7jwut56pord3gz37ncgajlobnqfumfshthfei3yzmyd2a@5wltdwata2t2>
X-ClientProxiedBy: SJ2PR07CA0018.namprd07.prod.outlook.com
 (2603:10b6:a03:505::22) To PH8PR11MB6952.namprd11.prod.outlook.com
 (2603:10b6:510:224::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6952:EE_|CYYPR11MB8386:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d68a6e-0974-468a-3648-08dc172febcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xsBhmK+5IJjmWIt0rtF/ct2dPpvv3e8LSlrVi47naLKOCf4BSWXpuA8X016sDNseo3QpWf9gQ9+ptuDoUowN8w6RtWHUi9z/xs+1K5rbhioThdySM770s10lbOME8QruxBXG3GBrJPVANLby4zRPhMwAr4cNf5QVVpO3FEsdqOuhx3lO8tL8dSgeub6mPwL97Sb0raarxOgiR2sHHNrHZ1u5l+1d6ZhZpfz0ROAioY4NLYZ+hqut2GpTKqDVoNd/zv9TNDvwMUMgojIZZJWBm6ZcanNIFdx6AlqtQgBDQU5OXueSBeTU4a0D3Mc/JiVBAY1oBILMjBzf7gErxIov41Ma2+FO8ap09SzM9AiAjO9lIwCBVwqMXaOqCqqUMuZBXBlp+2Mu0VfqSUgRdURFPWzbh5rXsHXw5P0SWDzWQ5lYeY875ICM3rdl+n4HuV4GfbxaUN6GEuk4hfGXcbA9qw1Y9v0avxeMDuCyc17EEkdiwTF+fGAN9MBgoTyAutw3F0YaKMKnm8yZ77YftdSvOe6VCnNxIEi4oZuQzjfWaAGHWlpkrp7S0LwSDOm427LT0goKkBz81d+bfFzaPvdHzvrunBqtK2loAX3++5KBOIY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6952.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(346002)(396003)(366004)(376002)(136003)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6666004)(6512007)(6506007)(9686003)(26005)(38100700002)(86362001)(82960400001)(2906002)(41300700001)(33716001)(6862004)(4326008)(44832011)(6486002)(5660300002)(83380400001)(316002)(6636002)(478600001)(66946007)(66556008)(8936002)(8676002)(66476007)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QMwn7o6SVzjU48nfmj3+Ejj5BW2aHgGFSzuW1wWUIL2D0hQzZp+x4lU3/zxr?=
 =?us-ascii?Q?xX/r1ERp549pGIOOXEk8QxppzbOleVwbIXYpVhZBPxreBiBQrF4AuqFweOMH?=
 =?us-ascii?Q?3RZsrhDg0KAQLG/TV4+ph6kfyFYcV2EVb93zwEej5pS3v9k414QMETZ2/YGR?=
 =?us-ascii?Q?8VzZzugz9BtyMorzTgjMR5NZz9w0IvJCzGX4GUUtk0tdSbIvcMZFmtEoLwtE?=
 =?us-ascii?Q?y1TinwLO5SSxqgOFGJx+s8E/3npsP6qzmk9SN0vXiehFcu6X/UHQoPglXm8/?=
 =?us-ascii?Q?WHA5LMd3UcAukxfE+wxWqQsRWS5tpOsqcCgU4DgoC5ZcSuUeRjS3UamheXCq?=
 =?us-ascii?Q?SLQQNrW0lBvv71Xkphs3tpX3ZjToihqrD7PkXoSbtdybJIE/VvOsVcL9AqtL?=
 =?us-ascii?Q?mCrPcbIWPlhS1otIuQfKc0QrxO2ICYL37pF7P0szMtFRlF4/0xvAvySdJvhi?=
 =?us-ascii?Q?kuoTiuo0j0Ob9RuMRfox7eobSpwJcbOnROsDRjpyW7UGkSMvoPCOFXoVB1XI?=
 =?us-ascii?Q?0/tkTssstyccZLnvasboMSx76WA81P1xBsNwriOjTP1z1Zk842/yzBNIG/s7?=
 =?us-ascii?Q?Ya+Dx63SK7zQS2KAMGOACIV67Y4RzIodpDq+YPKctjig5xKsnulx24k8u+KO?=
 =?us-ascii?Q?YNlWMHvZczsbwWIlkwE1YW6rRPu2IHVeLI6cbcvrtegQcDWkFx/6cIbOd3K0?=
 =?us-ascii?Q?NSz74UqrO0ChZ9FC0/rs7xilDmIjwBWc2dUPzON00SzappigXooCXmFWyW+d?=
 =?us-ascii?Q?NitiSrY8eTs07LgfxYah/BGsiKaV8ym7n81pFgibNkta+6uQvDXc+Lim8tvm?=
 =?us-ascii?Q?vFIQdMuuQICl+ga0GGLvpdSYWAV/4QxI0eD6lYveYd4Q9VGMV89j5ID2s/Rz?=
 =?us-ascii?Q?Hsfr+97QeDXRLw2XtcfQ1xdvcwxlyYfS5Nlg1onGG7Yvh00aQQpSbrQftg5H?=
 =?us-ascii?Q?EXxrofjQICCacO0eBp7At4xwhGckQSsQdCP8/1MaKbps1hmpz5krEIGIWVzV?=
 =?us-ascii?Q?C8edM0gekuSGMBQB3WsyiUAI576RA2dY+He7YZwrnX8gmdYvgxxhvVWHhgig?=
 =?us-ascii?Q?Ia2vOgHF1YV2Uw28pAcjqMMYD8tf7ZWw5g6LhMyByIY4/8CgbOaw6mztIa+v?=
 =?us-ascii?Q?CLi3GeqmK8cofJRy4OFRJPXxjltT0CJKSY9PsWORF68crxAnJh2NEbCO1x5b?=
 =?us-ascii?Q?7UAAduyuh13qcK1Oh4DBLU28qfF7aSKf86lNGpRYtsog9m7HlrIx6SDBoHql?=
 =?us-ascii?Q?aofWXwjLx5EGr01oPfgnHoDk+RZ7ATTHUc1wfGf1ZoDoB6P4CT5l7jXGyts7?=
 =?us-ascii?Q?o8XBdJuPTZY/eV+ozglkduQBd+cPpw+XszsNkuDavar6JLCKs6QRdg2z+sAS?=
 =?us-ascii?Q?tZmQjst6H0dC8X1tqKz/rDYXUagrsLMJGtXW8nSu3Vb/JAK0qzfKLk4axT45?=
 =?us-ascii?Q?uu4HqxVmIrXtoDnYkARzdB05yM4c9vMMi+JFcSJRDTUTKqcrxNW/3FfowqhL?=
 =?us-ascii?Q?Tk71RmDNBrdidj/8PBg0bhN29WV7ElGBi7PE/fy+C5mBImlRLokqZcO3zzhK?=
 =?us-ascii?Q?oVVcayCDB89hZsudnarQwUAOYyxsH9l5wbP4sSx4FIbxjh+Y52+4LpMgUnYh?=
 =?us-ascii?Q?2/XGjIsMflXc8zvhbPc4Hfc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d68a6e-0974-468a-3648-08dc172febcd
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6952.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2024 07:42:56.8401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EzRtybRav1M8uoaOnDwW0MmpzGTCkSN1XzPUA8zJ8Tn/BoDWnOQRln/xzTxbKK8/s4pxXwRwRbYrHiDrROBmmd5QVePkc8ufXA6Jzm3L2q7uKeIXlgwFJ0ZctfgBUATN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8386
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jan 16, 2024 at 04:25:12PM -0600, Lucas De Marchi wrote:
>On Sat, Dec 16, 2023 at 01:41:16PM -0800, Niranjana Vishwanathapura wrote:
>>Refactor some of the CCS mode related code to make it compliant
>>with the coding guidelines.
>>
>>v2: Fix macro usage
>>
>>Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>>---
>>drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 +-------
>>drivers/gpu/drm/xe/xe_gt.c           |  4 +--
>>drivers/gpu/drm/xe/xe_gt.h           |  2 --
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 45 ++++++++++++++++++++--------
>>drivers/gpu/drm/xe/xe_gt_ccs_mode.h  | 12 ++------
>>5 files changed, 37 insertions(+), 38 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>index 1dd361046b5dc..2d9c004838437 100644
>>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>>@@ -386,18 +386,8 @@
>>#define   RCU_MODE_FIXED_SLICE_CCS_MODE		REG_BIT(1)
>>#define   RCU_MODE_CCS_ENABLE			REG_BIT(0)
>>
>>-/*
>>- * Total of 4 cslices, where each cslice is in the form:
>>- *   [0-3]     CCS ID
>>- *   [4-6]     RSVD
>>- *   [7]       Disabled
>>- */
>>#define CCS_MODE				XE_REG(0x14804)
>>-#define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>>-#define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>>-#define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
>>-#define   CCS_MODE_CSLICE(cslice, ccs) \
>>-	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>+#define   CCS_MODE_CSLICE_ASSIGNMENT		REG_GENMASK(2, 0)
>>
>>#define FORCEWAKE_ACK_GT			XE_REG(0x130044)
>>#define   FORCEWAKE_KERNEL			BIT(0)
>>diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>index 3af2adec12956..342f82f245f39 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.c
>>+++ b/drivers/gpu/drm/xe/xe_gt.c
>>@@ -462,7 +462,7 @@ static int all_fw_domain_init(struct xe_gt *gt)
>>	/* Configure default CCS mode of 1 engine with all resources */
>>	if (xe_gt_ccs_mode_enabled(gt)) {
>>		gt->ccs_mode = 1;
>>-		xe_gt_apply_ccs_mode(gt);
>>+		xe_gt_ccs_mode_apply(gt);
>>	}
>>
>>	if (IS_SRIOV_PF(gt_to_xe(gt)) && !xe_gt_is_media_type(gt))
>>@@ -584,7 +584,7 @@ static int do_gt_restart(struct xe_gt *gt)
>>	}
>>
>>	/* Get CCS mode in sync between sw/hw */
>>-	xe_gt_apply_ccs_mode(gt);
>>+	xe_gt_ccs_mode_apply(gt);
>>
>>	return 0;
>>}
>>diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>index f3c780bd266dd..11265e851a811 100644
>>--- a/drivers/gpu/drm/xe/xe_gt.h
>>+++ b/drivers/gpu/drm/xe/xe_gt.h
>>@@ -17,8 +17,6 @@
>>		for_each_if(((hwe__) = (gt__)->hw_engines + (id__)) && \
>>			  xe_hw_engine_is_valid((hwe__)))
>>
>>-#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>>-
>>#ifdef CONFIG_FAULT_INJECTION
>>extern struct fault_attr gt_reset_failure;
>>static inline bool xe_fault_inject_gt_reset(void)
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>index 529fc286cd06c..ee1065c44da7f 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
>>@@ -12,17 +12,38 @@
>>#include "xe_gt_sysfs.h"
>>#include "xe_mmio.h"
>>
>>-static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>+#define CCS_MODE_CSLICE_WIDTH		ilog2(CCS_MODE_CSLICE_ASSIGNMENT + 1)
>>+#define CCS_MODE_CSLICE(cslice, ccs)	\
>>+	((ccs) << ((cslice) * CCS_MODE_CSLICE_WIDTH))
>>+
>>+#define CCS_MASK(gt) (((gt)->info.engine_mask & XE_HW_ENGINE_CCS_MASK) >> XE_HW_ENGINE_CCS0)
>
>if you are using this as argument to hweight32(), you actually don't
>need it
>
>num_ccs = hweight32(gt->info.engine_mask & XE_HW_ENGINE_CCS_MASK)
>

There is a usage below where we use it without hweight32().

>>+
>>+/* Get CCS mode mask to disable all compute slices */
>>+static u32 xe_gt_ccs_mode_disabled(struct xe_gt *gt)
>>{
>>-	u32 mode = CCS_MODE_CSLICE_0_3_MASK; /* disable all by default */
>>+	int i, num_slices = hweight32(gt->info.__engine_mask & XE_HW_ENGINE_CCS_MASK);
>
>what's up with the use of __engine_mask here?
>

The __engine_mask gives us all engines including the ones that are fused off.
I am using this so as to use the disable mask for fused off engines (not really
sure if that makes any difference, but it is cleaner when we write to ccs_mode
register).

>>+	u32 mode = 0;
>>+
>>+	for (i = 0; i < num_slices; i++)
>>+		mode |= CCS_MODE_CSLICE(i, CCS_MODE_CSLICE_ASSIGNMENT);
>>+
>>+	return mode;
>>+}
>>+
>>+void xe_gt_ccs_mode_apply(struct xe_gt *gt)
>>+{
>>+	u32 mode = xe_gt_ccs_mode_disabled(gt); /* disable all by default */
>>	int num_slices = hweight32(CCS_MASK(gt));
>>	struct xe_device *xe = gt_to_xe(gt);
>>+	u32 num_engines = gt->ccs_mode;
>
>
>this is a source of confusion I mentioned. Just above you do:
>
>	mode = xe_gt_ccs_mode_disabled(gt)
>
>in which "mode" refers to the register format. Then here you do:
>
>	num_engines = gt->ccs_mode
>
>so "ccs_mode" means something else. Am I misunderstanding anything or
>gt->ccs_mode should be called something else?

gt->ccs_mode is just the number of compute engines enabled by the user
(as documented in the kernel-doc comment for this parameter). As 'ccs_mode'
is the name used for this in all discussions, I kept the same name in
gt->ccs_mode.

>
>>	int width, cslice = 0;
>
>cslice = 0, but still using num_slices rather than num_cslices. Similar
>thing here:
>
>        /*
>         * Loop over all available slices and assign each a user engine.
>				   ^^^^^^
>

num_slices are changed to num_cslices in the next patch in this series.
Yah, in some comments, "slice/s" is still being used. I will change it to
"compute slice/s"

Thanks,
Niranjana

>Lucas De Marchi
>
>>	u32 config = 0;
>>
>>-	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>+	if (!num_engines)
>>+		return;
>>
>>-	xe_assert(xe, num_engines && num_engines <= num_slices);
>>+	xe_assert(xe, xe_gt_ccs_mode_enabled(gt));
>>+	xe_assert(xe, num_engines <= num_slices);
>>	xe_assert(xe, !(num_slices % num_engines));
>>
>>	/*
>>@@ -60,7 +81,7 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>			while ((CCS_MASK(gt) & BIT(cslice)) == 0)
>>				cslice++;
>>
>>-			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_MASK);
>>+			mode &= ~CCS_MODE_CSLICE(cslice, CCS_MODE_CSLICE_ASSIGNMENT);
>>			mode |= CCS_MODE_CSLICE(cslice, hwe->instance);
>>			cslice++;
>>		}
>>@@ -72,14 +93,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>>		   mode, config, num_engines, num_slices);
>>}
>>
>>-void xe_gt_apply_ccs_mode(struct xe_gt *gt)
>>-{
>>-	if (!gt->ccs_mode)
>>-		return;
>>-
>>-	__xe_gt_apply_ccs_mode(gt, gt->ccs_mode);
>>-}
>>-
>>static ssize_t
>>num_cslices_show(struct device *kdev,
>>		 struct device_attribute *attr, char *buf)
>>@@ -189,3 +202,9 @@ void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt)
>>			 __func__, err);
>>	}
>>}
>>+
>>+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>+{
>>+	/* Check if there are more than one compute engines available */
>>+	return hweight32(CCS_MASK(gt)) > 1;
>>+}
>>diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>index f39975aaaab0d..0dc191a59525c 100644
>>--- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>+++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.h
>>@@ -6,19 +6,11 @@
>>#ifndef _XE_GT_CCS_MODE_H_
>>#define _XE_GT_CCS_MODE_H_
>>
>>-#include "xe_device_types.h"
>>-#include "xe_gt.h"
>>#include "xe_gt_types.h"
>>-#include "xe_platform_types.h"
>>
>>-void xe_gt_apply_ccs_mode(struct xe_gt *gt);
>>+void xe_gt_ccs_mode_apply(struct xe_gt *gt);
>>void xe_gt_ccs_mode_sysfs_init(struct xe_gt *gt);
>>-
>>-static inline bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt)
>>-{
>>-	/* Check if there are more than one compute engines available */
>>-	return hweight32(CCS_MASK(gt)) > 1;
>>-}
>>+bool xe_gt_ccs_mode_enabled(const struct xe_gt *gt);
>>
>>#endif
>>
>>-- 
>>2.43.0
>>
