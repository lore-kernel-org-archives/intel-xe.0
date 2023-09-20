Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67488C04FF1
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:31:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EC1710E547;
	Wed, 20 Sep 2023 19:31:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5B810E544
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:31:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695238261; x=1726774261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=KAwNfAtuWPMDqCAqdlPLML7s9EuhqyTdI34Vmiyd+sg=;
 b=WruNYI5kNEgYVtAvHGZ/GZ3SJnppsY24n/ar41KwKUFLjAJudFRFqPlu
 kkCiahVMEeD28SOhETT4flARddy4cPIdM1LAHuBqrtRx84SymHU9Ca33A
 myLrrcLGnsammEtlIatr3AaKe7Z2jPAoraawOs3rvOy9yE294bqs5egOE
 IrZ+RrqzFVtTMoBYJfm4nbbzneZz05JK+hfkNKCrnPtAnw1aNdQntuUPE
 jvXrd7liEI6CB2bpGPIulF/BrehyPkAGK5yjPz8COi98BdLmQ7HZkMg+c
 0I4mbaEVBS1llzMezAJB7q/2GGkNEZ6ADwmyX+bHqAny8i3I7SnxVZb3D g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="466630423"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="466630423"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:30:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746771858"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746771858"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:30:43 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:30:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:30:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmUth7lGWY6XceDvD7ZURmxVo2yagrduyPNhPAcj/fC7BapA2QcAJuIbnCCZej1XRy7oMX1xC5pqJwpJqN5kLxkYtTesaujsouJuIu4+bClvFJmq6Hq+2zg908LT0zhSvymtf4Wgp2KmdCsTsm/SevL3cew0lQPjv9Mij4VyZhiH+UcyO/JCLZCZqLWyqWxJb7HrTKsI6oqtzJPvs31i5tdPm1YibO1GvxBdiaJLKP/vgz5E96ocvDjZOjy4N8J4Xx8rXpbFPKxRQVc3k8eaLziQvuWIIo1IE5oHU9JuCSEN4rWr1sfO+0+lHqZFRlhiNWHNXwJj83GGE8DNyIjXyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5mOLGXAMufl3T1eC15gu0cPgqayIqDUX25SY78ooDRE=;
 b=Uw0IcU3FAkHJ1/QCqe0UrKxCYsZX8uZ/hAkHYAJkP1zc3jI4BVQwHKcPxyxM/sgGTuGxXpChZpnyhudtT+a5RT1YVznvym6Tc+D4FjJxz3IJ9dpdwWj3bUpP+pA7DuTPlEhFEHedRIwh+sDv4Af53tEgLxM6/yJVD2gw8errgHH/SBFRqk08hiJZkO+NaTqqL/juZlRP6bZ7mrLt87eGo2oWRZ8vPKRc6Tm4WNVQB6yRpZivihB0sOYtzx2AktJuUPT/Vqz0nxBSFUzW8tCBfL9kblI1Adi2+6yRy35DrJ5BZSQv7U1hIEagH4ZAhphtEp4U1+JWlbvXiuzGN44MEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH0PR11MB4951.namprd11.prod.outlook.com (2603:10b6:510:43::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Wed, 20 Sep
 2023 19:30:39 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:30:39 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Wed, 20 Sep 2023 15:29:34 -0400
Message-ID: <20230920192940.135004-15-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920192940.135004-1-rodrigo.vivi@intel.com>
References: <20230920192940.135004-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR04CA0001.namprd04.prod.outlook.com
 (2603:10b6:a03:217::6) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH0PR11MB4951:EE_
X-MS-Office365-Filtering-Correlation-Id: d56b4427-3d89-41b6-e160-08dbba101228
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hkcB6e/vAeUcwHJsTC2oSXoUftG2xy9UUZBcqRhTJtaJWMZEu2fZ+aWRiSPH3yo06A7RJlgJadAyxB8AdrHx/Ua8rHBb1UIggGV/K/xg856zW55pDHfKIZbF4XOveqRZYBAkIlh3/UDaIE7e/LXPoUq8FaCWPz4lu8tWsq/ULfux4wMYZ2WXBfxFVhBQxqlV3N38XeJo3OzPhbdnfGJFK/AMRyAmNc6roNj4Aszv3QxG3iTB28OWzf9Qi7VL69e3783UW3fve8wyfL5S0lQBGzVkh5Nx5vRLlMj/hqbvSMtN24GNrZMV3vS1iwBqrv/GGxNPUfNANA4i8l5PK7idZetwaaSLczk0p9LxCjUSIoQERP7SBbL9s1/Ljvhfz9Q1E+Ma+YJElBht7Ucb8+Hmd7IdPj5IZKenhSCLevocYdE5EbdbVk4yGG2KmMQupO7NTwFiXQFh5FfkWgscdix552eOX4d80/HHTHJKLpguiLrcgyJgrJhFyOl9c6E4MZ3bXJ6eBPqtEdE/KS5PkQp5fB6LUrAWBvteixWc9PSwkTZK6ukTrCvAgaXiNc2EQfZY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199024)(1800799009)(186009)(6512007)(6486002)(6506007)(36756003)(82960400001)(6666004)(83380400001)(38100700002)(86362001)(107886003)(2616005)(26005)(1076003)(66946007)(54906003)(66556008)(66476007)(316002)(6916009)(41300700001)(2906002)(5660300002)(44832011)(4326008)(8676002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?elO9fy4W7d92DVuw+OzZL3fDIYb1GlR17EFRks8H/ij8tNK3RmYmw0KlEJ1C?=
 =?us-ascii?Q?QlhGL/jzcdVQgcDdQhR46UEBj3ABU95VZis2BeWfgPgKWXMwUb0VZEymdi0O?=
 =?us-ascii?Q?4YOlgIxGJNIWqs9QziP3sYELIi9+daq1kS83Fvs3UQrmf2Pqnr1Zpy7APqRG?=
 =?us-ascii?Q?me0aozgxglBtC4pqxxlJ2KMm+zYiD85xCuzvV0wghd168OY5o76odHe4RT2p?=
 =?us-ascii?Q?WgGKN3fo5pXsGkq4MlhjenULqHD2JXazfiin25XTGFy7GQ3GTjE/Hz/riuRL?=
 =?us-ascii?Q?kOe+UGpS1ZdUI2mx3iWnqFIAN6/xnJ3K0JghsNhcQp639zjgZq5B1HK0KwFW?=
 =?us-ascii?Q?EA+8nG5o5BWsVTZ7Vm0kz8K7r8h5s7ZiJ4rk2x3zHO+IB2RqwRpRC2AI1y3B?=
 =?us-ascii?Q?r2TNFXVrMNKfBEUD82/yW0pHpSCfWR7IJTMdAURsYeYUsDDwWejX959rdCZX?=
 =?us-ascii?Q?miGWpmPaLA9m4PALoiLn9+iXe6n0/F5R1gn311FgGxYZjQpR3Pubu/2aq5R0?=
 =?us-ascii?Q?+8XOhtLYFf/i6ibRJPVyYxh9NyHz0S/D0nf0JcbGHWh9mCIL4l49WF/sJTzz?=
 =?us-ascii?Q?pmVMZjRhJj2lhv6unycAKxRO9+QybJVnopdMNUamOyY8PRwQsu23r3G3bP6h?=
 =?us-ascii?Q?xgij9wywVyYEeydQdcpPbns7UO5M3Pm1x1HzE12YxvKpw1vWBBvSVK9gVIgt?=
 =?us-ascii?Q?bYhyiapHMnt1Rj8CUAIW/Ld6Y8VWG4ahH6egm1o9SaHMj6Dgko/CYPZi3GqO?=
 =?us-ascii?Q?4jh2AeFjgEcMe4VgDVBX/XSemlLE+k9C9ZUApt2+6YbOO7rXGvJp8uaqQtVj?=
 =?us-ascii?Q?UNFQ/TxVfEq0vyFFFlC4uwzGESsod7bYDA7G6IGbSDZI7WBmCCyD1IO+KaT4?=
 =?us-ascii?Q?zEMw7wMm2rkNoZifoJmsCvY4QcdMGrLoUkMOYtCzYRxRLo5q2ReN9MCrTjW/?=
 =?us-ascii?Q?v26QQq5n8isgjG9+cbBgSZZwehsFSx2vcmWaFBRtnFRkWYU1h/ERpSidFYRE?=
 =?us-ascii?Q?3TUFmDWs/GR54gp0aZOqHPYxGYgM9i1Wr8cyrV+jpmLKej4ceWrb3MGT73R4?=
 =?us-ascii?Q?tL1Px4bQA5RPaqfJ5qwQJaw+bp/sbCSugU7r2LPw67ubcPqHi+Fg3XNV2syx?=
 =?us-ascii?Q?btMWGV3h9VMGzgNxgDNe+HwNBdyqhsdQvTu0Vbns34pMusRw4wYYJgzheRfI?=
 =?us-ascii?Q?QS5ED0E4WUjCF906lFY0SazQdNy6L1w70pDTk3l92qK2TFFqW3zzcf1YZa1j?=
 =?us-ascii?Q?1/QOtNWaoF1m97H+Xh1CF+mBm+v+zuq+TODe6pKrYUewqVauI/LiEfxaDfYW?=
 =?us-ascii?Q?G+x6379XyCfyCdN/LrFr5PcJehrxH+1+PRHblTCE9/nlJMaI/HZKb1fRmPgm?=
 =?us-ascii?Q?u8vyER7MjrZYZtQ/ycc9DOa5RbPQUQjlqE3Mh9iYBGvO7EJ1XIYg8v3PhPq+?=
 =?us-ascii?Q?DwDG6fLYEvVllnZkrjZpCh8L/hprLDn5vyZRJLMjQddjxt6VQWJ+ARH+CSbb?=
 =?us-ascii?Q?aCJDKQ/6RHvsKDSBJNTjykxUZZqOvOBUq1wF5DhI0AawDNkFRHI7zK7i96C9?=
 =?us-ascii?Q?4sI7Z8tOoBzfpc3c0M/mU1kwyZr8qgmZaxOmzN0azkQTzwlo0mYc31kjuOJ7?=
 =?us-ascii?Q?fA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d56b4427-3d89-41b6-e160-08dbba101228
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:30:39.1938 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJY893GLOAqWdbH7OyBsv5strGHbtk/VJASGDqy4bilVH+9pC48t0O+8mrT1dtctrJYpJsuITcWukxjGe76+tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4951
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 14/20] drm/xe/uapi: Replace useless 'instance'
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Let's have a single GT ID per GT within the PCI Device Card.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
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

