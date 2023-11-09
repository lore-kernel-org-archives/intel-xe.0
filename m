Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF91C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 14:55:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8951710E8C3;
	Thu,  9 Nov 2023 14:55:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5DC10E8E3
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 14:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541711; x=1731077711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bbAweRZJmuFS8yyXJk2F/ZCzF2NDEVqEC4bSPG6pbww=;
 b=EaowsFhFR1TQs2jb+cr3L7854/2w912k/tegOs3me61EdbKnSmUFSA74
 bYWeUszBGsOd02bZzhBtiun94KT1Ycj5DVQI7OPA/4AQf9bNKWYLyFXaJ
 aBinS2KNKJQWljCOkhgOgfCI/RW0u0Mf5yvaBLuo15vUjXX4MAripV5uy
 IsxhLA+oGXJDUMpLRdqI+fDsDLQPjbDuYSj0ocYAiYVemFlf0PqX/+tna
 QdXb0MGOD7YO+cnGNAD1POWteAVlMEKmc25ANZNph7Cxv5+m/8PiIE9+M
 sXf7TqcrOV9dkIQEv79c4PbEqPXjTdciCJRGPiFAuxCiYAjmN/BbrnBY3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3028238"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="3028238"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11169891"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 06:55:08 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:07 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:06 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 06:55:06 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 06:55:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JRGT6DbeGlliQB4iPoGJDX3FGzRoQQqSaIOr7ftes1x0oP9X3inTpX6Wc9UU1JpLPgxaUEj3JidcusJrN8+MVWW2A7hHS6IkcDhm6uA7cfn/3QXtD+mRwQuAbzh/tRGPppCfOodwuFzTi4C7mYpOPc2HYuewZN5bTQMx2/4svg4hsfpLEhfXQ2ULTk36e5DalrzCMe6HVnLKP4aWTbOHGxX6/Kuz7mVKHAOAiANTzE0HfFY8L6UQAXcFO155yTZDN1TKDsiDe6AUncToZizLXRNaRgETsrlA3KMYruTlBG2T7kXyKMOPMQAF7Arf8rs5myetV30tLhP/ZdAByCKUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ao2rPgFrO668IIU50EBPngoiu0IBaSP3uRC3pEVrvgU=;
 b=WcOqgdA9c/bOZNDaCFoh2UjHRlQSJ4ZPmq6yJsoDzA6B/0JX19gKZRPIfjdWfgOk9sR8rcs/v7Wi+xRRNSut3qtRVuzeMbG9XqiG+n8dOFUgAtCyBh7P9H5+XlZ4kxqRUMsFeOWEPz2Pn5d3I+/RL817Ye2XRiXmOGB2ad92FSrxzX6UxGJiRSOsu1AG0dms97fCVvfndKIjdNvUuJutUojIZmkT0rQ7T1xvDelXpjjjhmyxNh4i4ONg+v7BV2sb8fhGpcg7d7et+RkNZvEcyXFJ5ra6EOb5dUNRHOn+Y+ndGztLVmUwOHNXVaIyFYPHF3d8pBvBiIQ9jtIKd5BcYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MW5PR11MB5788.namprd11.prod.outlook.com (2603:10b6:303:198::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Thu, 9 Nov
 2023 14:55:05 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.6977.018; Thu, 9 Nov 2023
 14:55:04 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 9 Nov 2023 09:53:37 -0500
Message-ID: <20231109145347.345120-20-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231109145347.345120-1-rodrigo.vivi@intel.com>
References: <20231109145347.345120-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0067.namprd04.prod.outlook.com
 (2603:10b6:303:6b::12) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MW5PR11MB5788:EE_
X-MS-Office365-Filtering-Correlation-Id: 01c2f26f-c11a-4364-1d37-08dbe133dba1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnucY9VYdKuTSZKNDzBIIs6pUt5Hxz3x0TspK6J742tNyGhuMdoZoMt5CTYv12cPAB5I3EIv7NUnt3CfavGs9DohYw9vxfppjHphIZopl20PdO6HhpzKdZfQ0YyK5+1v64zxhijI8PqgJAKBw9M5yh08z20whRrPpa7j0BrKcrG9+WolOi8Xs8Poayc4Sbb3/Bxp8x4f9nNg6qa7SLlWYCQy+VpugFADG8lBBkj3SwaLgyxatJro8eryWcU2HKaTd6BVrBUKBEaRYFP68hGTTXcmsp8LlOLAXMsTVsfREkVlB/p33aWhi7Cn/ulpPSlCQUfTBYIeE8ep9fz/s+l5hBrtssOyRwsi+UdBj9Ji1HGu0QKBLJOF1ZR8okj8oHzy5A6PP/aCHVuoYlCLvmtzZweTg1UEZUHp5S/3FH0yc/BWZAMs+DJ3cxPw2TYfojGyKpyaH02AdbLZ1VI+2K55KFiU+3SLujiP1iJDeNIUfIjOrUqOkDq3E8oGFaH6dxVI0A3xHuYzbp17T3vLtjEFhGzv8l8Ipt1m1RKD7qOmVerUoR+qlCzL1r8n4g5ubyIO
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(136003)(346002)(366004)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(6506007)(478600001)(6486002)(2616005)(107886003)(44832011)(6666004)(5660300002)(36756003)(38100700002)(6512007)(82960400001)(86362001)(83380400001)(66556008)(66946007)(41300700001)(2906002)(26005)(4744005)(1076003)(66476007)(6916009)(316002)(8676002)(8936002)(4326008)(54906003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?p2aDAcfc1HEzKcjKU1MKFCKLNUyN4pOCnyst0Qi2XFu1OMc6zEXgXVHo/VFj?=
 =?us-ascii?Q?HduiYp+K7Hj/Pw6kzb/laN14VYmhflmcuIzd73mpbPeMoT3y0/B0UVf6QMJU?=
 =?us-ascii?Q?D0WAQSWm8zWuevU7AO7seafpStyZOdEbbRYlXXBNLekIcXv2ZqKB7Mzzoy2r?=
 =?us-ascii?Q?ogQxUPIZ2VFdCAgg+/a/isBlSGrpi+r1+uuXtWsiejX7tsgF+vtVHRjUX+wG?=
 =?us-ascii?Q?YTJ2f1UL99Vegr6yx1MNGERBwnB2KCr1cfPaOf+xyOuoagDHCqbaJp+S/7uC?=
 =?us-ascii?Q?UfhA32BpkZaM1rgSw8e7mXpCXF59ZA762aFBPE4NYryRIVTWiuuemgT3GzJ/?=
 =?us-ascii?Q?ruYv7JRnBBVhhQiOO5OEGGIy0ssG2Ut3NWecSl0JlFtUVCaUHmDwHHUWZnTy?=
 =?us-ascii?Q?3oTHxGvaJSLIXQPrVeFhWao7q0BVcKtIRfz2HRXOtzIBf+mN5D+J9FP5Iq+o?=
 =?us-ascii?Q?cM+IlWDCwnXZIyIbKLo/gHa6rVG3gv9Wnut77AIj1CydDFWOIH0l8nsLTEaO?=
 =?us-ascii?Q?PW/NRl+cQWQzbLoTVLxfbxBkhLNjG0ZPt6owImGtD06XLz5GEGRAoBeTGrVi?=
 =?us-ascii?Q?slp+wiEchM7Oi2rvItvRVUCCXXSgY2S34Oi1VR0FHWXH1t7HJEyR2Ex95cIo?=
 =?us-ascii?Q?+QYQydQFrLhm4MZkNtcHanOyYTvYFwAvUlIPemKo0wnwXOBXyOXDKiDzz18Z?=
 =?us-ascii?Q?aWHB9dWV8520pH/aGVAt2/2nzGueDf9KIVI7PGg8iDoG1F70EDNmeMCZwyYb?=
 =?us-ascii?Q?jYK5+hdx9Oo0MwlQgpnW6hE2kPyO/HsVk7mIArFBujy+Fl/9TXEv9p3wvOKM?=
 =?us-ascii?Q?OABN+cpQtKRTGS5qxdorGnr0+Gs6GZZLDtC3pMr1KoemLX4BIOuv8/jBlILc?=
 =?us-ascii?Q?L9Ik+wwwXSrU2byQMVeZMM/tGJ8fn0Y9UxUgSAhJbAOQo+extozRkxLfb4mJ?=
 =?us-ascii?Q?wVmKpoxJVt+VO1DY/GlCVQnrebw8tDROK0TXXMQ/mL6woqnbdcOk679DiQW/?=
 =?us-ascii?Q?STekVUibjpN0Mkv0gEsUT7XrJr/dPe9yS4EoWtV39FQelXO66jmXjaCR2msE?=
 =?us-ascii?Q?tzHI0G24A06Qh7ZyqnQMR95bS34M/lHjYhe/YfFpPEimQqqbEq53vkqc0jyK?=
 =?us-ascii?Q?UclDr//TO5FINPrStg20cLIuBDMKKEB7btiax/tV1raeUinRgFr06vGFDN/o?=
 =?us-ascii?Q?VskJsv+ppp8qsySgnqj/ORZSWzhtg1wIDrgSlOWG5n6GNjOtJXl93GPcgLP5?=
 =?us-ascii?Q?FdaaeyRrjN+mBm86y5dfiLPdHzBdvJPce6kA3GKru+IFpb1rxwAW/+1UcqaR?=
 =?us-ascii?Q?67zACfks1HP/MZ6L4/YXCYC2ZgxEGSH1ULe8PSq2w3Z5/MeSsWg8cnHwpEHf?=
 =?us-ascii?Q?eKYB5sgHXmKLInEeNjTjAEOkMG1htdnGSEtkKu2mSeCiLigeE8vxYUv7Ze67?=
 =?us-ascii?Q?22sVyQYy6PwrQaZCc2JWGU2PLVYXKg2TYNcdT8Nhf+nKFCUFGeHFHLd9tc69?=
 =?us-ascii?Q?RbhZxyLgqnWjD8DK2yjAeQbO7GMTW04AOgQkQsRdKHdETlOUR14qBMjkD3FB?=
 =?us-ascii?Q?F2WFsdc/47puBjl7Xx83sx8JAybGppxQIUo516Tk?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01c2f26f-c11a-4364-1d37-08dbe133dba1
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 14:55:04.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLRZAViMHgwS3mSfZh4O0QhPXyge/Vm9/n10svIjadWYXgB41VUBn8sevVqaVo7t/7KD26+3UoHWURRNExZ5Qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5788
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH 19/20] fixup! drm/xe: Fix potential deadlock
 handling page faults
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

From: Matthew Brost <matthew.brost@intel.com>

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index e6a31f90ebdb..ed2f3f5109f3 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -395,7 +395,7 @@ struct xe_migrate *xe_migrate_init(struct xe_tile *tile)
 		return ERR_CAST(m->q);
 	}
 	if (xe->info.supports_usm)
-		m->q->entity->priority = DRM_SCHED_PRIORITY_KERNEL;
+		m->q->priority = DRM_SCHED_PRIORITY_KERNEL;
 
 	mutex_init(&m->job_mutex);
 
-- 
2.41.0

