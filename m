Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63123C4332F
	for <intel-xe@archiver.kernel.org>; Tue, 14 Nov 2023 11:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2125910E446;
	Tue, 14 Nov 2023 11:45:32 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D43110E447
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Nov 2023 11:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699962328; x=1731498328;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=T39H9ca4wXvo+NiEHjsZh0oYkcScFtcQc6ErFSdJDsQ=;
 b=c9hqKJL0RmQsYZ8dDAZ1qdndQDxfyejPcK8aQV/0/5IqJg4IkjGOMRJF
 6v7HqM3umWM3YMI6XTXewep/OH379i6Gq5UbqWywPuVJj8gE8QFjpE6Og
 6G0L5F0wCgpib9NCMw9o20yrF3GiR4qvnZ+uHlCBNFUJPfk+4nxTRsx9m
 Ce/NAv0ZSS0LVL4e6dHX0/DW/5/fAaksKVF/+goBWlUaacHuVJB0aZl6e
 FFJcdU6huyrSopzpmSKLBTBto88bHARgMxU3V7MV/F7/b8v7vB+z1JiAj
 nRegPt/aqC0BsbbHQiIal1IODrmdA7JJ7rlU0BkABrIfz5VoY5bf+q0Vn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="369982140"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="369982140"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 03:45:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="835009000"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="835009000"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2023 03:45:28 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 14 Nov 2023 03:45:27 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 14 Nov 2023 03:45:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0Ye2Ey4BH/8ebry447mDhylDPZrUmMctDVzKsCZTlCATk7hWEfIxTgx75WUXonZyn8X2yhD1C0BeUk8tpQYoFSbLlKchFb6l1uRnd5WGDj11hu9lT1AYFXH+/6w/88qtUtfW6ZKyJJG/qZBoZA9qW5vkaPWYhU9TOu7Uds6OcdAQeNQwB1tIclpTGCWe+x5V9Sxd/7/9gD5wU89ed2GDgCt6+QZCq5mVwUNINnUR4TRSoIwSWzbXcFC6EdDTH4L+h1MgCrCxYPjyrFx26nofWm6dIuBDHNAq7VHqH4v5Sh109iYlpqGOCA8lITAoRvW/ly7EJltCWjLwR3ilbMNaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=53KyOLk0wYvMXAH4NHjBcPRSb+nvCZ7DOeXkSCDfK6g=;
 b=fkxCNrxJ0Tto5We7/Ft/UiPbf9nPp3EOFekz+FQWl8iRzQ6/PO26GlUwf3bR4oMwXssppbcOZe0SCdsIYqCnESsv10/XaN+E9Wmb+dFqUJNk8C2xLAmUEj1DOUAoUexpbSVyLZgKICP+lLw5vHy6eQqEh9lLDA7MoIfRGbYwou9LjMD1X/VHtG253bjgQjL9Y0bmYnZeEO17AvrQpyc+zIiXAYQip5/d7WUa03eKXmPTCnHDnQANdKWpVXBKRdBXkadRAmfGAsOvgwu5cMApAqkyHzpB1ziyuZiYnMYwH0/gvz9+dkxmYRIDFyHhOVqHfAynxIeaANjk8zX2B7oGbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 CH3PR11MB8707.namprd11.prod.outlook.com (2603:10b6:610:1bf::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31; Tue, 14 Nov
 2023 11:45:25 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::d5b4:6e20:2de9:ebb1%6]) with mapi id 15.20.7002.015; Tue, 14 Nov 2023
 11:45:25 +0000
From: =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Tue, 14 Nov 2023 12:43:56 +0100
Message-ID: <20231114114405.2207747-12-michal.winiarski@intel.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231114114405.2207747-1-michal.winiarski@intel.com>
References: <20231114114405.2207747-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0019.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::26) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|CH3PR11MB8707:EE_
X-MS-Office365-Filtering-Correlation-Id: 5463a6ca-ac17-4375-11d9-08dbe507313c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: h+Zsf6GXSGjHm+XVfka8dvVYsN9asSLMMdVGSkOQkV+a71RjD65+13I7qzqb/slvtjmbjVjzNLn/yVdqs95jitGTkOve48ZVjlqFA8yoL7tuYhFvcSmkwmtu3fJLBqTLuIbLtwxJ2RUlW33g0fQb0syusANivJtNSNuJtOjAvXYNGZzHrzrGghNir81j2mKKHX8iXjGUNopZGPVmUpPleVmi9NDz0CitEo01VFGtIEO6x6H5Rg+I8pwVd6SMxY1otXKzB4rk678aNxWq+eHRbp6n4Rq9eGvVY11uHlXYvJjbIGyIOQRkaEVA/KgS39RwGB5OVgE2sDg+i4hYQEpobpPj547gdznelxxHcG2QE+8qriycCvm1f79zwVPkbrvFOcjI3I9wKoF+5LtDETHU55mCwexu5BTSoTbQJEC/jiUY9UaiHGVHV9zc/MibBOyKNqcrUDwMm38eV+KsYMAQ+pcykx4HnPQEUW4aKd7UQufHRBF5FcS+mpX6fFuX91PjFD2LWYJarU7hrMpp1PcKbU1gyyDPvPCOuZYhylIADJo74XeygPbZebkxhxK1cpd6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(346002)(396003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(6666004)(83380400001)(6506007)(38100700002)(2616005)(6512007)(86362001)(41300700001)(4744005)(5660300002)(8936002)(8676002)(4326008)(36756003)(54906003)(66556008)(66476007)(66946007)(6916009)(2906002)(316002)(26005)(6486002)(1076003)(82960400001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2ZGQTlYc09qblpERWZ0T1d3UEJ2WkVwVTd3c3psV1V4YndpU3dqUkhGTDlz?=
 =?utf-8?B?dU1USU1ZUFNLTDlYdVQ3Yy9TNk9sRloxN0hpM3RRNWRhYmZJRFh4RWN4TUJV?=
 =?utf-8?B?K2NSUDNUeld1aUJJSFdJYVFZa0VnRjhSQ0lsTGxBVDFHRzRwWE50QWxNZy9y?=
 =?utf-8?B?Q0JTTllMdlNVTy96amgwclJIVEdRMGdwbERBdXZTdEdMU2sxUktOc2JiQVZF?=
 =?utf-8?B?UFhTczBybnFwdFNZSm1RL1V5WncxVDhLMUF0V0hPSEp1clRsTFVoY0JaN2lX?=
 =?utf-8?B?R3lFZTN5eUt3enRnZFBaTDB5SlBFUzVkSzZXRUpBUUlRRmM4bVl5ODdKTXM4?=
 =?utf-8?B?NXVMcWhMRHVIakdERlhGVFJuOVpWSlN0R002NitYT2srdFUyN0tXVFdFRnFS?=
 =?utf-8?B?bllTY3J1SmloWU9OeER0b1NOVXo5cFNvS1YzNUdhZjNWdDFoemt0YTMrUWti?=
 =?utf-8?B?eTBXbnpXeHg3TlFPQTFlMlg5Vjkrc1M4emlwRUtnQkhtSG1rMUNLM1dYc25q?=
 =?utf-8?B?V2JDYjZMelpJQ0VHdHBhSERXT00xdmczUzlSTTVLd2lMSFozcFM1UVRuLy9Z?=
 =?utf-8?B?VUoweVliaE11bzMvcmJxaUxwMG9sTVNmK1BaU0E5MDI3YlFUL042K2JZL0tl?=
 =?utf-8?B?c2hVVEJ3S1RXWGpIZjVsWDBYRkMrUDNQaTd3bXIyUkpVeFlmQUE5ZVlpdTkr?=
 =?utf-8?B?bjYva01Hc0ZKZ0l1OFhHQUFsVzh5VHVYSkgxWWdCcUVuK1NLdDI2ZkVlejBW?=
 =?utf-8?B?Q2FwWjZjTldDT3dBdmJrTThlcDYzWUM0M1pRYnBUSVZLdFE2ZFlSUUVYd2hO?=
 =?utf-8?B?VjJvNkpSZ2hUTzZ3RzlkeElXQTRnOUg0WUVhcnpWajlMTmJnZ2c3cEJ4Q3Aw?=
 =?utf-8?B?Zk5qajRMUFVJdGhVYnk4ZzFlWEVuY1VwaDJxb3lPL3RSTmxXS3Rqd1hwaDRz?=
 =?utf-8?B?TVNQQWEvbnQzWGJOMGxhdnZrY1RNVnpTM0oyaFBEUWJNL3krQXN6OXcrUFlz?=
 =?utf-8?B?ZVIvZ2krS3JtZFg2MjMrVG4yNkFQckVPbFl2TFFuUWRlN2hOYzBzUVBKck1Q?=
 =?utf-8?B?TGg2ZFIwdmhKRHdGSUIxdmZCV01sT1UxUUMvVmJvZFlXTnpaaENSZHpBeHo2?=
 =?utf-8?B?a0RmQ0s3NmVtQmc5eUZ3aVZOOFFOMXByMVpIVGRGM1Z0d2Q2ZnRCL0tjWG1O?=
 =?utf-8?B?MWJwU0x2bk5tRFlQclpnWnJYWVljY1BRN29jMTlGZXEydGJROS80YjBJZ3pq?=
 =?utf-8?B?MGhjL2dMNHRQd0dzcHYrc1VlZXg5b0w0SVNOSHBoY3lwTXljaWdoaU9XMVU5?=
 =?utf-8?B?VXRvT1dCaW9SNGVmTlQ4UjFwVTlBODVnMC8zTWNGcnNPRXFiOHYwYjRwVUpy?=
 =?utf-8?B?eTdJbmFkTzIvYjdNMTBUdXU0UW1Id1NHcGsvdEo4RlRQUm5wQ2dxTVViSFUy?=
 =?utf-8?B?Vnp3WEpzUGxPd28wZXJhcklaa1pvMVNMdklSckZLYWszNUxpSE1ORWRhUkJQ?=
 =?utf-8?B?N2tHRDBUeWErYVkzRUtOR1BNaFdwelFjdUNMRDIxdlBlc2h3cFFIQ3cxelc5?=
 =?utf-8?B?VlYweWxNb3d5Y1pFOElJdWhKamVNTThuQ0xMclVzdjBISUR2QUNwUE9uSjhL?=
 =?utf-8?B?MDh2Q0FXSE1CeloyYTBzM2JuVlZ4cjU5RmI1MU9lWkNPaW1DZTEydzUvSzlL?=
 =?utf-8?B?cXFYbFV4NjZua21YdUU1aXhienp5WFdUOFo4NlVMUmRJbXFveVdDaTUzd0ti?=
 =?utf-8?B?SWtBVUNWRXFNaVRMdGR4M01qaFhtR1RkMHgxbit0WGJ3enA1dm52Vmo5eWpT?=
 =?utf-8?B?eTBRN0dnc0VTaGcxcXA5eXh4MU5zN1RpWWcwZFc0MmRYNmpZSC9Fa2hZMGJM?=
 =?utf-8?B?UlVsTzl4d1haQXMrb2lVV3Vxcy9sQjZCVXR6dldHcVJNS2lDQy9UZ0UvNWtm?=
 =?utf-8?B?WXgwd1hRdldKQVBEWSsrdDV6UTdxalZWbDdRM0txNUpvU05KRDAxVml6dGwv?=
 =?utf-8?B?NDNkMFBXdVVTMTBQU3I1aXJkMWc1SzA1b1IzUlYycm45UmFpVTN3cDM3Si9o?=
 =?utf-8?B?UHQveWVHUVlYSWloWlhhalg1TzJDYUEwZkRzL1A4aUp3OXFjWDRsN1gzT2o5?=
 =?utf-8?B?a3ozYk9rVG1hbHU0cnNYTkVPSHFJbXlxb0JrUUNaQjV5TFRjL2JKVjdHWDVy?=
 =?utf-8?B?elE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5463a6ca-ac17-4375-11d9-08dbe507313c
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 11:45:25.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ga7/kiY5ly2hqUBdYcygXOgR5pA2P7c+b84mF/qDa+GssjopqueCub1ntpzSs9FkzY5QLP2mYMAp+HoDXNIDRjDWDf4ew75xC82lhC2O+kk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8707
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [PATCH v2 11/20] drm/xe: Move system memory management
 init to earlier point in probe
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

GuC will need to be loaded earlier during probe. And in order to load
GuC, we will need the ability to create system memory allocations.

Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 6fe669fdf1c0a..a89b5a32c093d 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -402,6 +402,8 @@ int xe_device_probe(struct xe_device *xe)
 
 	xe_mmio_probe_tiles(xe);
 
+	xe_ttm_sys_mgr_init(xe);
+
 	err = drmm_add_action_or_reset(&xe->drm, xe_driver_flr_fini, xe);
 	if (err)
 		return err;
@@ -430,8 +432,6 @@ int xe_device_probe(struct xe_device *xe)
 	if (err)
 		goto err_irq_shutdown;
 
-	xe_ttm_sys_mgr_init(xe);
-
 	for_each_tile(tile, xe, id) {
 		err = xe_tile_init_noalloc(tile);
 		if (err)
-- 
2.42.1

