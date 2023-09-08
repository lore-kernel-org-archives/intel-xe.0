Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A79EEB56E
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 20:33:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C5A910E94D;
	Fri,  8 Sep 2023 20:33:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D121510E94C
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 20:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694205202; x=1725741202;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=k/4DNFUD4YNzGmUa58R9PzkvEGkBf6j0U67i/VdMejs=;
 b=Oy643JvHLktdpW71Whkn0KpmUMzPKvL5Y3s/3eMxudfEbjnKT03vRECI
 kwN2r35ymO1TqK0loTpHXHoELOCZa6Gf1GC0wQ73PjRfHTb+a+t9CFaMf
 Iw0LdAMErHxyrNS7uAJMeIY2sYDhdWEUi8dahmVLD2HEMrh20JojusDi9
 Ki1rFFGel5Z/BUvxmk5HzNkJVwAe6Pu1IOWPcyx2Dw1Fa2RI5h+FIRgx2
 7+7nrqq29NGeRJ8WXd1oTZXWSFp+a/m7gQPzpR+ymhh+n3uAS7DwaNuUc
 N/ZLDr1mrL8UdCF7/lSEc0XFP7XYdg9d5x4gyKBgbEhxO89CGAp8H0sL+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="464110343"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="464110343"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 13:33:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="989395899"
X-IronPort-AV: E=Sophos;i="6.02,237,1688454000"; d="scan'208";a="989395899"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Sep 2023 13:33:22 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 8 Sep 2023 13:33:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 8 Sep 2023 13:33:22 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Fri, 8 Sep 2023 13:33:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N5BHq5bfxYT0IkJZQJzdoo9Yy1uOyzXeaTkGr22aPUozxGWLNaeGZCay5CjMEFEhC53P1NcXYlYKDNNV43awmCJDVi1Y9eGZAYVrnpWSXEsOjXJzDjvS3oRUn0GKWLvWZAqd3L1+UknXkYYzuvJA5/VuVVGkn/9FgVH7o2V42pgLnyQ9FGnMMSyMV3hpGLlkouTj7JUoLh4kqsxZOsfZKbB151e85epYNcRF2IZAVFhtPq+c6bKzh5a4stdB9js8/9ztXiRlYzFjc9aDen/dEvZYtkst88BFiYZyWyeH+FlwEuHlcUsQodB/epEF7LAmRVJ3mZekbuBiznp2M0ORPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I2SGkENm74Qb21ep0tFQttw08RCIuf56vRF6XP/SOHE=;
 b=JmhDuiNBU3J2KbRcBSew2v26oVSDhr6SkOoocpqsT3qqJ9W3emcCjfzvrOJEtrNIKppttsTnbkVmpCQ4Si1S5RViO6x0tE1MlNrDODpPrInPwvUW0wZbhmt8H7RKb1f/MjjgeoYK6LlEaOo6vH3jQM79IFFfWkemYxiC1qZ+qlmMbPDqBPD56FEoDKf3s1sn/NoTSx/EwVzKX93kT0MKsnMRY8bUhXTXOsKETCQ3riyWaJUkfq63Yjeb/A/oh/s4NWyzn3dNytk+6Xoh3k2igxZQZEuLct2P35ezuF2rk46CKJj9FTEhtwqECnlL4OwP7CLvvLXJFqyx9QGsnW332Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6053.namprd11.prod.outlook.com (2603:10b6:510:1d1::8)
 by BN9PR11MB5226.namprd11.prod.outlook.com (2603:10b6:408:133::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.30; Fri, 8 Sep
 2023 20:33:20 +0000
Received: from PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c]) by PH7PR11MB6053.namprd11.prod.outlook.com
 ([fe80::d9de:17f6:8118:f7c%6]) with mapi id 15.20.6745.034; Fri, 8 Sep 2023
 20:33:20 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Fri, 8 Sep 2023 16:33:00 -0400
Message-ID: <20230908203302.449041-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230908203302.449041-1-rodrigo.vivi@intel.com>
References: <20230908203302.449041-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0322.namprd04.prod.outlook.com
 (2603:10b6:303:82::27) To PH7PR11MB6053.namprd11.prod.outlook.com
 (2603:10b6:510:1d1::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6053:EE_|BN9PR11MB5226:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c92b62c-74ec-4791-67dd-08dbb0aad6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TlM1gzolY1kbTnV+wa4wmzPU4uCixTAB8uFRZ6w5t2DoGfrgTF3hAlPVndeif6pm5VGmwy9wlw9XhEp3zUvn2Bv+nuwoNMzckENe8JwpggiMOhxmbHehi+RcNQmR2dXtqf9WbjqjZD6PSzGU4clbNpikAJZk/lViTRWDtykWpLuC1ycNSca7xfNRCfkNpEe+QPm1QeqMdarUA0WOu+3dYjADnUB7V3HJhTH4isi7iAPtchS4P9s+2tefy+O90kRj2Td1OYacVuqBfkr2DBBUKEQk6j0GGzngyEhwamXL913PORKLeL995s+auz2B2h4pSxsFkaRE6gXWZvXjwXTgXyI9Cj/uhb6SnBwuGO7qTYBFIAg6px8i+osBgcCb3qlgeOAaXO2uq/6v8MCtcG+w2xdagQxVSSCzvLxg55akFIt+BUFqC5R07hFEtPL0v3vmBtyan7rySllEd1E8sRU7XRy8uxexlKXD9VeQDQK7KFFs73P1/J606ZwXgeGboxL0RoUm5ybU4l1EZ/dG/intvEG279TLyml3P7/Hk5ml3B7yxMibXdqIW2/OLQIdU+Yt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6053.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199024)(186009)(1800799009)(6666004)(6486002)(6506007)(6512007)(107886003)(36756003)(82960400001)(38100700002)(86362001)(2616005)(1076003)(26005)(41300700001)(83380400001)(478600001)(5660300002)(8936002)(4326008)(8676002)(44832011)(2906002)(66946007)(316002)(6916009)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Z1HnnW2pHrlR8U+3pQ0o4FnTDCx6pt0ly3AAqOw9gHErHZl/wiVkonGyZz4v?=
 =?us-ascii?Q?JpD3JkEyyIt5aGwvTlQgNLTs9ZwMVmjjcU63A/pIrSptxY2UMLyD8MB7viD+?=
 =?us-ascii?Q?ex7FalC9gyYzZ1Pstf7BkGfICdJ8c91U7XpxqxrU71BTGQLph9KwL/iju4UN?=
 =?us-ascii?Q?6hsmWGt5oB3HNyBNWBwrVf6DTQGtzkohtFapUOK/7/v1xoMgki/lDaTPyw57?=
 =?us-ascii?Q?OxHFQHcB/252PFodQBbM/TJUlG8ZHmKyFCOU89OEKIeUGu1WK/IbtdL3zoqc?=
 =?us-ascii?Q?zz9cJqrLkMLBhQcXmAOm8ahPWTkgq9MdwLDRJfaS7C0xC4q6L9Ea7bN9Ykux?=
 =?us-ascii?Q?NPLnppWUKlnmi7gGbsLP/A0ew52bcDzaFvbjNDhGFDHCs6q6NZlR4StN8suB?=
 =?us-ascii?Q?zya/Sju8Jdfp/Loyd6xOlbFKG3x0IwSMQAFNheAlgthXqmD8ooXl63fiuDaO?=
 =?us-ascii?Q?dEReKTQsumWVR0JIMgitMtjZYVu1jnntbjS7M2OiXQQ6u/hok3MmXBHVsv4t?=
 =?us-ascii?Q?f0ArsAuhEEKrwvkw2t22XgZLZGMvb93ZCvr3lr5/nJqldR8JwS5zFPpzUQnt?=
 =?us-ascii?Q?bB8YOtflkpgypUozR9g23e3XkUjYvowdIwzPURZnzmbeqtuJH2LCCNqN12Wr?=
 =?us-ascii?Q?DQIprGseAXfkh29yZtUYmwi96nxWpUk13aKd/if0x8NMltjUSw41NWJ9DiGd?=
 =?us-ascii?Q?TX4IP57TxLsuBQ5viOqEpUlLlMoVA2k2V2PyRnz86YttDyQ0lb8En3W7mdjX?=
 =?us-ascii?Q?/LLJ67nzmzl+xXoy+Pkx2K4OVUIkI82410w+iHlTz44gm8pQwGMtAJRjk9vt?=
 =?us-ascii?Q?KJNisFuViuGD2//HueljzGWTz9hJSQp5+TGoc3BnRCILQ3g4qPu/BhOAg5qv?=
 =?us-ascii?Q?PuMzuVOBFHqSeGQ+AlXmPgWA9qOZgkZFBO++Oqd1asLDsmdFSlT1o8xU90yR?=
 =?us-ascii?Q?R2yGpFPVOVG4d0nxgU7Y++wf8mKAHphXJMXiiBYUXctcaG3hK76lTEEatx+E?=
 =?us-ascii?Q?brhrQQB2We+olaFX2QWiD6KlLatDRfkUrJpgBsxRKg5SsMLwG0S47hfKoKMf?=
 =?us-ascii?Q?gMKcpgdA03UllDFT035nRLOJul8a2VtbksAY7G3JBBnffKzkkKgtaOjqjoa1?=
 =?us-ascii?Q?8/sbS/ZkfShOgqwRcea4uMD6oTq+m7E8hkUEnBA2yMTxTEGFTFGXILUCWdoE?=
 =?us-ascii?Q?h+9A+TzPeFyL61wuYyv0F8BPV4T0L9CUK8YC3LUxdIUbAM0tU7QTmoVmMLbW?=
 =?us-ascii?Q?QfL1zOFmnN8rSBtiwtHTegkvmk62jG4XwKPy+17odWc94zWGg3qRFgLoqmum?=
 =?us-ascii?Q?pCQrQL50+Oz7ZjCKaglEkqq2I2mRV1/psB0SII5NZxjye4cmbyqXDTMrTDxt?=
 =?us-ascii?Q?CLS1Hjc6YDCOY18DGUnRC2n3e5kVQviCHh9RfcrmyDaxShYcZWPhLy9TTTkf?=
 =?us-ascii?Q?yD0POuama6KB18NNmek3JoeGSK59XsKQYg+zA1xggowfXsazqP8+2Gj6/a3U?=
 =?us-ascii?Q?z6CE4xwcneAlG0Tv9kb3n8/aqke5hQ0DYdtC5YUPd3q90MlgQA0nzq08mRgl?=
 =?us-ascii?Q?j18fKMDucjIhrcO4DE/HCs+hlMwEvqwbfxvdsjoX?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c92b62c-74ec-4791-67dd-08dbb0aad6cb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6053.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2023 20:33:20.0572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UzUDX8FBPoWJkUG7psRmIRT2VUIQrvLSSvy5xRCl3RDkqjDYOKD+ifqaU9fZjOItzJkONtje35vPUFt7Sw9DFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5226
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC 3/5] drm/xe/uapi: Replace useless 'instance' per
 unique gt_id.
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

Let's have a single GT ID per GT within the PCI Device Card.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_types.h | 2 +-
 drivers/gpu/drm/xe/xe_pci.c      | 4 ----
 drivers/gpu/drm/xe/xe_query.c    | 2 +-
 include/uapi/drm/xe_drm.h        | 4 ++--
 4 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
index d4310be3e1e7..d3f2793684e2 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -105,7 +105,7 @@ struct xe_gt {
 	struct {
 		/** @type: type of GT */
 		enum xe_gt_type type;
-		/** @id: id of GT */
+		/** @id: Unique ID of this GT within the PCI Device */
 		u8 id;
 		/** @clock_freq: clock frequency */
 		u32 clock_freq;
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 24b16863bf3d..91c71d7fa551 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -599,10 +599,6 @@ static int xe_info_init(struct xe_device *xe,
 			return PTR_ERR(tile->primary_gt);
 
 		gt = tile->primary_gt;
-		/*
-		 * FIXME: GT numbering scheme may change depending on UAPI
-		 * decisions.
-		 */
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.__engine_mask = graphics_desc->hw_engine_mask;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index a951205100fe..280274b7a507 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -239,7 +239,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		gts->gts[id].instance = id;
+		gts->gts[id].gt_id = gt->info.id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index 4bcee709bef9..d95111944c45 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -276,8 +276,8 @@ struct drm_xe_query_gt {
 #define XE_QUERY_GT_TYPE_MEDIA		2
 	/** @type: GT type: Main, Remote, or Media */
 	__u16 type;
-	/** @instance: Instance of this GT in the GT list */
-	__u16 instance;
+	/** @gt_id: Unique ID of this GT within the PCI Device */
+	__u16 gt_id;
 	/** @clock_freq: A clock frequency for timestamp */
 	__u32 clock_freq;
 	/** @features: Reserved for future information about GT features */
-- 
2.41.0

