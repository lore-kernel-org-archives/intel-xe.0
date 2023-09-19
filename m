Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D0BBCD5BCA
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372BA10E28B;
	Tue, 19 Sep 2023 14:26:47 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DED810E284
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133602; x=1726669602;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=LGEbNqyxvL53A2zPA18+b+QQe0uuGhTvgvfv8Y/iQcU=;
 b=XfdYOpbcI8SCFV/hGbJVNzHYH3g//AB/x/4ZVKT+iq5gZjwtPRxhY/GT
 12GseLfl/19vpOWqaKd5T5/7YLa6v9B1eTR8QwuEZ7GEJLL69uD4iUFDr
 8E4hDGaFQnIfwS0Qmas5rIzHSZb82C5A+IorSxXYQVKwGkQ3UXbE9ilLR
 ggxTPVGPYkn5piVndRSyZrvyw6dSie763EJ5+GIv61iEiNNF/zjhdffnL
 foPxsgbMJ6NHrBa1QAkbZZXe+eJFk8zDhJnNNs6S+bEAgnMc9TpjWER1T
 t3AppALKHZKHhd8GOdb/89Yjki+HPLyzlmGd0z087SKH6/nnbznYEZDo+ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="382708012"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="382708012"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749498881"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="749498881"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:26:41 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:40 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:40 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:26:40 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:26:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SqYfKNwXttEsDLMl/5S4IAzwO+jGE4O5P79ebP4B9Dj/ZOzxrj7Y7Hk57lYukWtD5eUUC1XRHbMvmsDBWI4Y5OEgwfN7ZCJzU7oovHRhRBe8yxtlGDbBqF33LQ3qsXmNgWDFvT5jF20rv1q8kvMitA0LcADyrq4R/iQr7vwnsTkWVw8Ig0m4huEI6IWF5RSHT6zok17X3ouWvaN/c0HfndwNQayHoaUjAIcCrP+WTbpkw4kXGYerTR2Er/fHiPCzVGDW4RWpQUwW6BONLnd948W4gt93BD+QQ1GP9u97cf5uEqjPWgDFxKkuxKbKh3ZTTpHIb6x18Me0BHd4X8ZNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3psXzoXupb6BZ0kk2swLk4Gce8rd58JXpreqo/7H1jU=;
 b=gwH0g8OxQB09adOnzGrSesL8zGbASl+z4cObbxUNf3a/29TXDrJ5wUB+BoCvXRRL6+KIqvi8K0ImdJ2fWwoCf5Q2NRYVn0qodYgACyxXJjRnVArjh0+leQO3R8tptBvL4XlZvsw6RgBpjT5dQMevnxacyoRAAyS/Hz1f7GEIvLfpI9ZZJLjN/vch4UovwFiRgxCTmSqde3XiPuJgxsTJLeqsS+Q8qArnQf92BT89NfQv9Yc4xiCZYmhU2KBBQG+fVXVbCCaYskYxxgL50USFldykuHKctfl3CjlVOv0YMFoVTF8jixboVYVwUXjq0UiKUF0CLo5sx7Ax3ETg80ukew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SN7PR11MB7591.namprd11.prod.outlook.com (2603:10b6:806:32b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Tue, 19 Sep
 2023 14:26:33 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:26:33 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:25:01 -0400
Message-ID: <20230919142504.91652-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0018.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::23) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SN7PR11MB7591:EE_
X-MS-Office365-Filtering-Correlation-Id: f449abfa-309a-46a5-bba1-08dbb91c6c84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fDGfbgqhglRC6t+TKUiQTaZLoZWO2So+8uhNk0OE8BU5IG7yhgEhwwB+II/lzZKwihj5svxDrenYiON2h+o94O69sHqFMZ7V3RrtxiNRZI/qtAbceAZEu0yZ18RgHNzXZQ+CRRJW4DEoEhj8RkB+Qi3kD++FDNZUyeHQu3Mt16jyteMflPDvBter3iY8g/6TMGhUXcZAafqNfUl+56fSA2kIongl4FtslsU7Qyj5TLJ2wLFZTwBWGVeS3+Vddaz1hqxlqPkDevFU+3FE1L5DzBJb+dN37UmGcGx/aZizrepgPCfvcDCTAk9pFW1POTUeIhW1BoxixKKPz8+7nIWSt3HrsF59F6WBwVS/MxZEyI6tD0sx9dkn/ZzGKB8lkJcp9zyZpey8NkKp9/WY7vHp4xOHfRC4Ys8TQNGcOH6TP39hhEa+yarUHFrEckpuPMW2sGR74ln7iVXDknR8yP1PASAXG3UF0Vnm9I4bCa9ouDMIGAAt2hxrVII+/ku+8hQiQfROAGAVYdOdp6/U+bHD2VqhlcXkqtepHPktPDHVUl0HapfOoaRv3B1FlZFvU0kP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(39860400002)(346002)(376002)(366004)(136003)(451199024)(186009)(1800799009)(316002)(54906003)(6916009)(8936002)(8676002)(4326008)(41300700001)(1076003)(107886003)(2616005)(26005)(83380400001)(6512007)(478600001)(6486002)(6666004)(6506007)(36756003)(86362001)(82960400001)(38100700002)(66476007)(66946007)(66556008)(2906002)(44832011)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S4serlZNVnhddVVgEZM3bfV/JnN9dcJiWmxmdLK7ZWmNFaIcK9K4dk/Wn2xC?=
 =?us-ascii?Q?DFNq5rJ+NMtNHNCDXRPcoVG2jC33uCnhm2mxTnHgUkdFaeHd4U33vbmid/wa?=
 =?us-ascii?Q?oup85T5aMurw85VFzeSHrrgffGDC3eqAksqwEsUOlmm7Hp7UAW1GE9mGN8Yi?=
 =?us-ascii?Q?u/IZ83mj+DfKUq8Iovl3US2wpeHEBBSYLhaHZ07sVr0mUN2MK9iCmi4Qw7OP?=
 =?us-ascii?Q?TzelX8VpLd3iscnawxSQlRHtShlAlV2RB4eRrVMwvo98xE8MZFnAvPucw2eN?=
 =?us-ascii?Q?uyEI4h8rXFRlv3N/cfJQTwqT70EduwTL6Qw0VK1b23O14MjLFe1KOkAYcekb?=
 =?us-ascii?Q?S5iXk66Tal3nznyBkX2nlCiL1vrMMdlIhA+mCXXH92GmRsQNYW31w8aucgYz?=
 =?us-ascii?Q?u0R9RiDiXXfLQP1w2ILaYTWzMbn4Qc4dEY84sDl98iEG05d/t2vb2xdHHzmj?=
 =?us-ascii?Q?9XrzrJ11KGDDYoBknsO5C98IE/HL/ZzxPTnbtYCirV5r1ShVTaNqBXhlq10Y?=
 =?us-ascii?Q?cPkxY6DvVT1qjYHw3x+7q58UsQSAEwYMtFN/eqqyCto4cw93DjEzzvv+w2tk?=
 =?us-ascii?Q?HHMUsfZPyHPn4eaPPgTr1DbAPbPiACl+phoxhPN5RjD0BCCnO+yYcEySTQxn?=
 =?us-ascii?Q?s+DigAwt7duGdConveDiztTK0FhBNlWKQ7AGpdYOubx/eYhrf7ktAEPP3g5E?=
 =?us-ascii?Q?v/S2uzvVG6jh6GpM3vL6jQhwcdR1X6jK+DEF6t7K7Scw2KCeLtM2Lt/hC9tn?=
 =?us-ascii?Q?bnANjVVpWNv9Gu6+XBQTDH0VTxHrZL+mTsjxCo4LF+cOPHvB5GgOVxvTfuIN?=
 =?us-ascii?Q?PjnWVLEz8jZaOneOZU1ZObSf09d1WVEb8qO9tfY9kqdWRYXvjY9+/zd24v9O?=
 =?us-ascii?Q?ecRnE75vX7P+Kp2+OuiqL5EMhQVTxUDKCXFySp5uosOhfBd1QaYH8jUNm/vi?=
 =?us-ascii?Q?N9PITtf4V7Ts1fucTnok/FlKmEImdXGFM7ZoDowwpE2yXkhcEmV4C3p47OsH?=
 =?us-ascii?Q?RPrrGXYidnswWuhfNR+eKNkRqw2aEUaULcwLuwv6eh7FKandFou4iAkkcq5L?=
 =?us-ascii?Q?Md2uR9vKgoGwRH7TMPWWgS7MuYg14/xfKSrbsuJT49lN80G/Z7nY7L4PcT50?=
 =?us-ascii?Q?nwLFGig42CgxZYBNzVP8eormP0XD0R8dKMobnbzzKpUjIdYLN2ASCac/trfG?=
 =?us-ascii?Q?7jRYCF7ImtI7z4kkrHuawiHoDvspsrunAq5UDwxJjpoafWMlHZrjNQJlCP5n?=
 =?us-ascii?Q?y3clKD9/wH2TasrPQLvxBDXTPTWjEquRSCUarEX7WYT2AikOYTkIZwRt24ae?=
 =?us-ascii?Q?/3oCap8rnN8zFDDQBJsIV8ZPwulrOS4wEPXwdhULrroZ3htSvcnGs2EnWoB+?=
 =?us-ascii?Q?6nWWPCqK0vtVA4vLjxfUvhfZgCauGRpVSZoFb+tSEUlp+U2vimYqmvZ0uEki?=
 =?us-ascii?Q?iIGp7zHuYzcWJ4UZ2Q0DHfOKeBhoPp2FYK4MY7BbnLMf2Ab2EZuXHU71G7f4?=
 =?us-ascii?Q?iKW67Qv8602zOiJ2GvjThYpnIhh1qpUQNvbQg41khEp4b+MgL7PkFeNWfmQ0?=
 =?us-ascii?Q?AytFfwIdbTeszDWxsr8FpReSXiK2qakKJvgPEC27?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f449abfa-309a-46a5-bba1-08dbb91c6c84
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:26:33.5924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L1/dVZ+ft0h1geeGNBcpNoF70lvR7oHFhuyhApFYBPPOlitFtjLR4KiOg75DHo0IQIzSv5s7VA4Z+DRzj+pT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7591
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 14/17] drm/xe/uapi: Replace useless 'instance'
 per unique gt_id
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
Cc: kamil.kopryk@intel.com, filip.hazubski@intel.com,
 Francois Dugast <francois.dugast@intel.com>, jakub.chaberek@intel.com,
 effie.yu@intel.com, bartosz.dunajski@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, carl.zhang@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's have a single GT ID per GT within the PCI Device Card.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
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
index dc233a1226bd..c6cd0c7b1082 100644
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
index be9affd4f181..fb448e76fb0f 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -379,7 +379,7 @@ static int query_gts(struct xe_device *xe, struct drm_xe_device_query *query)
 			gts->gts[id].type = XE_QUERY_GT_TYPE_REMOTE;
 		else
 			gts->gts[id].type = XE_QUERY_GT_TYPE_MAIN;
-		gts->gts[id].instance = id;
+		gts->gts[id].gt_id = gt->info.id;
 		gts->gts[id].clock_freq = gt->info.clock_freq;
 		if (!IS_DGFX(xe))
 			gts->gts[id].native_mem_regions = 0x1;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index ad344b3324c6..ca93b43fe3c9 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -350,8 +350,8 @@ struct drm_xe_query_gt {
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

