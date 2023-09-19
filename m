Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 150C5CD5BC9
	for <intel-xe@archiver.kernel.org>; Tue, 19 Sep 2023 14:25:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0BC410E27A;
	Tue, 19 Sep 2023 14:25:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166D810E27A
 for <intel-xe@lists.freedesktop.org>; Tue, 19 Sep 2023 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695133520; x=1726669520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=lxpAcTFocvZvRBV+BbRImJeIOms+uGP99X/4j0Jy4Ec=;
 b=ZC+W/7/evuuCreQj73iQivJWAEwzb8O62NK0Kd4vNDtbhpv9NWZUaYG+
 N73d2eCvIJreo4ATMEawSoNUW6Xc7J7CvMFCy935RzbXze1d6McXxBkEC
 s2T8sDLdaD3q9RG2A+CqbvKm3wlspn2s8VSg+LQEP34RXht3EUWjaaKcF
 YxJlXlH9Al9SXBLtA3jaGA82m0hv5cMbkuVfXU73PRcKOoR7m8aoKBq3r
 76EHVEFhWGgL5y3gKyzRM4v7yoBGtueDfIEBXjAka1eaL7n+5D5wLZIDD
 +VQullV8viyA08NzseQXUXvNpZdE19fYwm/abXuVOcCJH6H7x7W0zk0mn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="466278482"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="466278482"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2023 07:25:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775574114"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; d="scan'208";a="775574114"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2023 07:25:19 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 19 Sep 2023 07:25:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 19 Sep 2023 07:25:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIqm1JjPc5TULOYOgEVpNNWNuKLCbJYYeJtt33g+1EvVFNCBw9q0j74h8ID7Y3p0udqVeKoGplMOdKEUGFsO8Me07JSR5nSlAXH9CG5q7MTDqO+XGiXLo47mKoMJw69R43QiqAyYCwRMyN4/2H0G+iZ/TLkW1ChBPeNo1MVHTKqw6lTjoascXMbw9za5XuhYEklrfNdtOYL2edeYpK+oSyNyS0YraFpIiA3RfPdgcZo7IL/unS3qH7gPmtZaQc5UkmuaVjJp/1lK7LwIn4QX0/zpBR08shNflZDsEcMCXBPC8mY8pQ7vN6ft/Pd60JSW+YYTgMQXT+FsrvFVoDKTIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qmJXDWlSyevxnhaqXkHMak2xMkDoJvQiVBjgSlhGq28=;
 b=cxIpjEI5URVoYRlY72VkvTEGKNSsx3K9Pl2X6hv3sODQz1nz2QZkIj6qlBoTW7spt2rgqRYY42OPSubQunvJFOBOwxypDTLbr06VqqcppyAoEpyUnUnRx2TMrQE33RHZ8k9SlqRAMfaVBFglD9GP+AS8zcvy/avncOEf78GHTdxDm8Kpzu0pDCSlrYtl1r49Sb0CHk4renY1MQTRBseoxL79d61kSmKhc3k9APxKFpkpVEyAPWqDFIwvYjtZEVMoY+SwKqvYmtZ39gZtod3JAIZfJ5+DCotpicDuhjZ5k1HsPPTlFw9a3QYs7+bqCI1llhAukNZB7qMjFO5TKU2Fqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO6PR11MB5585.namprd11.prod.outlook.com (2603:10b6:5:356::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.28; Tue, 19 Sep
 2023 14:25:16 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Tue, 19 Sep 2023
 14:25:16 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 19 Sep 2023 10:24:49 -0400
Message-ID: <20230919142504.91652-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230919142504.91652-1-rodrigo.vivi@intel.com>
References: <20230919142504.91652-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::13) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO6PR11MB5585:EE_
X-MS-Office365-Filtering-Correlation-Id: 30448e59-5505-43b7-f5e8-08dbb91c3e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: a1VL/hzMdlW/HVwxJYstJTRrN58e49KXWMaUpSTKgOfwUMOCqyIfGNnuuDZzjwruijJNhGONHjcWtvfWrOQ9pfZghtQQ1UPV7W85BISiGuYP4Z6+dlUt4MTzvLCGl/rP8404y94UlKWKn+e8cUM+Ib3nLb5B1v700fj1/mGMyQEaco3MraL+Cwa12MdXUTmY5yX/HrQe0rsH5RXipgxsFbudmzukAc6VKcHmyV98dKgrzcX55cG1ZS0KwND60+f045N91q1pqIhZSmKeFw24RvFuBv1peJ8DTeht2bMNDnfzSqO1s/672frpNCih27LUwndB8yBzRME0SlJSlkwNxMPJYr/bGzyVubbh3V+9FWlTmcJZaV2L9RRW5e1PrQK+LkhtEBw8m124QonUM0W0OXym93gMsDiI6JhGTYhIW/Fp1erTjVcgAYhwJRmC+tAEdDJ2fUffS5KyF7bZ3LfTrb4EhWzjq/AOv8Ait98/Te578a6Nk1RaMTow9lmqziyMRBVydnYfgq5aOB84xCB8CYJfBuDEiPZySz3uFia5ZviZv1cs/m2yc0k7Z+u9UvQS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199024)(1800799009)(186009)(36756003)(44832011)(5660300002)(83380400001)(86362001)(4326008)(8936002)(8676002)(41300700001)(6506007)(6486002)(6666004)(82960400001)(107886003)(26005)(1076003)(2616005)(6512007)(66946007)(478600001)(2906002)(38100700002)(6916009)(316002)(66476007)(66556008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qHz9WN+nGdFTVsO6Y2n0hcsKpyRAb87ZOWFfipanesQYEaiSp5xXF01iPdvi?=
 =?us-ascii?Q?EuaJa7YYNV1Ge2xOE6VzEqL6IZsFJm12PpxrpI3mimnBUI1vrdtCOiEM+JAz?=
 =?us-ascii?Q?jU9mmKE0fCx7NfLrCO2vCRWbPFwBRnzWSoE3qNp3H3yrcPHxuOzn1RTJpU2a?=
 =?us-ascii?Q?b48zi4MCT+0ibysJbnbDCTn9HVbBFhywwqYrfykM/gYkfFZDiPSuXeAPQF3w?=
 =?us-ascii?Q?CT7T7oYv78ob2NiuTCD3POnOHwK8h2BLgW+cQXdNnHJRwSZ8fGnJ82MCUeD8?=
 =?us-ascii?Q?RNcGd33dIfRpFU1SasZdko8lj15osP0IROKMmI4Cats6vY8XhPs0aNmQ73Tf?=
 =?us-ascii?Q?+O06cH5AuvUJWNMT4a81Dz8dIthYRZqFK+bS+h8yeFp8mPtPxm50vDzVocc5?=
 =?us-ascii?Q?jD919Y2PHvCGdPaZGFui92q61Vz+fjmZAUXgneps2xqDP7wpvUPMS/NI1/AG?=
 =?us-ascii?Q?UIwJ2X+xk4eTQULooygn/BjUwPF0H+9g0TSjlIJwOAPDi32vJL/yDefDpoFJ?=
 =?us-ascii?Q?tbWIQ768rT0gsD3DEp+hy++tOHnsFFrog4NvY1ohBCG97JidSTJ9jIbwEHGq?=
 =?us-ascii?Q?e1Qv2X1k2KSb9zoHRdBxq3MPTI5HuWxOOQaym6GguHfJgZNm548num2hY/ce?=
 =?us-ascii?Q?3EpH0ECT+a0bPvWBFOvyD4rBpnFcLpIOPJoIdx4ESR6as/s0wBLzBE8S0s82?=
 =?us-ascii?Q?dr1ZEgrkuHaiC5dibTWmZQHyS1UQ8f1tRkvonfftVBMSxonAL9Yd4pvzCuaI?=
 =?us-ascii?Q?xpkELfZ+jd2n6x+7L+K7TVgVq1R2OvR/rbPyTOVeo4cpmoafgobaMlgs+Of8?=
 =?us-ascii?Q?cDBuXpNjLM7SUP+XAszZIGRANwM6M/tV5zPmKF21ruxqG0tgTc7DJ26oB58I?=
 =?us-ascii?Q?o/A9Gk90cmbDIFg58xIdFcdGZIZca/w07r+IKroVrBxJrAg49WfzHbHI91rE?=
 =?us-ascii?Q?9pNynAGyX3LiLfzaZZ+trSUjKRpEJ99JKmQNUn4/j+1dqD3ugJ5vZH6slu+y?=
 =?us-ascii?Q?tSIffVuwCUZ3iJsemlo8Hv7tPoNQasaJ+njdg0tvhtecnjRRdcJCuhib65A9?=
 =?us-ascii?Q?LBpjRxxNrIKZ85ifjs63DRdMhb5gqYLS1ykM/bx4OozdcHygiQCVXEE/DTtH?=
 =?us-ascii?Q?ZDEDrCHyYR5baKcYSee13JZzx7/Nxk9uMJYCim2GxVgcLCdEFhOySXkS9yfi?=
 =?us-ascii?Q?MpQhntVGZaJGXRLbi01tghl+VFRQcM3jnjRo+VJX+DHuCbqMCUR83eo2qM+c?=
 =?us-ascii?Q?MBuvryPJZll5dA4I0q2djAox2sTOW3ls18Bmg8og4DXbJZ9m3Vp2zx6XAyjl?=
 =?us-ascii?Q?8As8AJHopgqvzrJPHpKtq2BU5u6+6e8a4fqjPCNDMIJV+LQw+XeJQ2I9jru8?=
 =?us-ascii?Q?GGE0uki++oPe7If7rBQMBeU+JDV6CsO5K0IACfxLKtdZ67fSeIVmtet0VSq3?=
 =?us-ascii?Q?ayGU2qtS/TmUd/IhcYyAij5eUjmAET91CXVRhpygzEKH0BMhb0lUUo4u4HEX?=
 =?us-ascii?Q?uSuhk7k2hct0edhd7jo3yaO5S3vOxrdkUhGMStxCumaV+8EJmjMOI/tuuNX1?=
 =?us-ascii?Q?ytCAfBVmyKGmN4n6n8EvGSOE87v3+DytLu9+FLkVaYmXz2SHqaJbWXp7sUtY?=
 =?us-ascii?Q?mw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 30448e59-5505-43b7-f5e8-08dbb91c3e46
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 14:25:16.0050 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QQODEa2jv3Q6SY5D76o5s4oHawDk4Sn/Uu2iFzd48p0yhuXl0vW06NE1XpKHsQgd4IVA3HLXHUlF0qhI7NLUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5585
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 02/17] drm/xe: Set the correct type for
 xe_to_user_engine_class
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

From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

User engine class is of type u16. Set the same type for the array used to
map xe engines to user engines.

Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Reviewed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_query.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e0c2203e428e..cbccd5c3dbc8 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -19,7 +19,7 @@
 #include "xe_macros.h"
 #include "xe_ttm_vram_mgr.h"
 
-static const enum xe_engine_class xe_to_user_engine_class[] = {
+static const u16 xe_to_user_engine_class[] = {
 	[XE_ENGINE_CLASS_RENDER] = DRM_XE_ENGINE_CLASS_RENDER,
 	[XE_ENGINE_CLASS_COPY] = DRM_XE_ENGINE_CLASS_COPY,
 	[XE_ENGINE_CLASS_VIDEO_DECODE] = DRM_XE_ENGINE_CLASS_VIDEO_DECODE,
-- 
2.41.0

