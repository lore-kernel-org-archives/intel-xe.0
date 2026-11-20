Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D760A260B
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 15:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Sa9Z2s8Y;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BJMqNeDP
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB10D10E14B;
	Fri, 20 Nov 2026 15:28:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EA6D10E14B
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 15:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795188499; x=1826724499;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LwyPAmV2EgDYJovWaQNd7z2ThdPQtrNFK0oYr8ebHt4=;
 b=Sa9Z2s8Yr+ZlE34hcTCKINBf/DqIV2t4bA4WeKmLf3OW09uBoycAnYw6
 z47xHUz734c4hmaHwAUJR05dkPORz2W+/RgDAbIbs+DsyUHI2A2Bnt8F7
 UT3va2Xle6qbNd0KDpkbQdfZlBIWQQ5P9KjVaiBrNRTgyO3C9tvtiWAQ7
 33l2IDVfoyU0Q1VD9e9wf6K184GDgWIPV1qEdrMNslQu+JYpNAhJBzyft
 0EWbrW17CnEENTRbs1ZAVolTyxnBmghr6hENwM/9IjWzZ/QjQiRLyhTJs
 lpCcyoA1dHyvpw4Q4c8VMDzZuniAiu39+vyRQP6O1XuoKt06TuHErTr9M Q==;
X-CSE-ConnectionGUID: FWRH3bC5TeG1BN9fbDGC7g==
X-CSE-MsgGUID: GGRTJ3o1RqWTx3X1m+MQkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4148193"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4148193"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:28:18 -0800
X-CSE-ConnectionGUID: DTsB1sj5QSGlpGd74bGDvQ==
X-CSE-MsgGUID: /FsDXm5aS/ibMslmYLhxEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; d="scan'208";a="11014610"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2026 07:28:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:28:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 20 Nov 2026 07:28:17 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.49) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 20 Nov 2026 07:28:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwjMsyH/gMF8GGtsq706XgpVF7BkVwghFtbvdE6V7znDoBkvOWV1ByWmbhhCP2zaXQbtVewVvjndC6dF4mDPrGNlcqnrtsqRQKaUwSbB4S6MgqN2f0bStMomMtJiwM+ly8ywpWmek76a6kku8v1JIQOySjpPwwU1VE2noRqlaShYlrnhuEzUvq8YZI3hZ/wYD/RkCYhAHHCpRgnGQNl/f76lbQozmAu6zqX+py0pU01LjEKD7mOBbyOlN2AuVgxli/sWanPoBZ1WqrXkTbEn96EdELWcd5no2kuHBUbmz6WkyK+eV8HI/FvBz5fzol1LFR5ybuGxegbDtqLcK3XDCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKGucKbvAl3FDcIwYqiGXUlNq8rqr7MlxlMh214qLFU=;
 b=EzCXLrVywelwyz58jmdPfiiqCptIDkSzUzBI2dCAIWY62As/a9o1/t3oxI1oiO75kk7jaFRm37W0n+EWVAFkSwWHmh0JLKYZW0OKuedZmPb4t7NlBN15OtJF+RuabE0fYBGl8y5A4N76LCfr5/QrmfGEHYkGeZeAYNz/rTQ895ODs7BrYhZ20RojOmLJ+wPqzgO9tGT+brjLKzXFot/H8qlxCnD8/BulWEcFyYAvUPqmunVfVl4bBIihSvvlm15LSOeM1RoLsz/up555jOx9Dc9w0KChkmQK11VYEtHiLYT2KunptXg0Fqy5tK9xFjYhrEle+pNJKsisp8Lpm3Mx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKGucKbvAl3FDcIwYqiGXUlNq8rqr7MlxlMh214qLFU=;
 b=BJMqNeDPGLvUY3NAvOEnfIGa82/zh5wTKACVCJc4M4ylI1XkuFooX5HUn0Fa35S2EXcFe6az9XCzReosDx0I9Mpo8lIOecUgx+upDRe6dqBIn19/Pq25zJOGuRVQzCzMyMsFEfueVAAXTQxzfOJwkoXs18fs44VZHAWosqNMats=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by EA8PPFFD174C06C.namprd11.prod.outlook.com
 (2603:10b6:30f:fff5::79b) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.13; Fri, 20 Nov
 2026 15:28:10 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0639.011; Fri, 20 Nov 2026
 15:28:10 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Karthik Poosa
 <karthik.poosa@intel.com>, "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Subject: [PATCH] drm/xe/hwmon: Unregister hwmon before the device is unplugged
Date: Fri, 20 Nov 2026 10:27:54 -0500
Message-ID: <20261120152753.1346010-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.56.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|EA8PPFFD174C06C:EE_
X-MS-Office365-Filtering-Correlation-Id: b4ac072b-8395-4898-7bd0-08df471ae1ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|18002099003|11063799006|56012099006|261021123027099003|10067099003|261028144727099003|261021121427099003|261026121527099003|261009223027099003|261102123227099003|261022105027099003|261022075727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: egjizrTzs95+iZ24wfxY58DQuYVXwcMU2x67kwJXs06qmzL6XD62E/ewQ+pg8ZbpYyPImoq+15+dq9jWEoX006ODHhYPy9GBhkrW5FFvGnmqTFVHluYqiK236mSqYvTgjWlDJrAFMrL6sQzmeJdJTD6U0SW4rk+UB6Z4ENpcbOsK0GBJp9vijhq7C5nHKPf5zceSN4Oe76J1/mjrQoxN37B44gQ08Z0omvLwNP0H74ZVQ6TnpVWSa7AvfSKRfFV8lf+JYwuZYsu/M0toRz5feTPHnFKRp8dptBq9MIRZ4kkvYOpgXrhfErVFbS8Xdk8GRQaILGhz2xuImtiVs91OPAmnviprJG6k3YYsnv8WCCSCqTYvtVfgCVB+GD52MP65EhE7w5bU+rliumTsfS6ffa0d2PXWigYvt41fMMC4uMyHaoVPmtDRGIQOcuL/OQZYPpcvz6jlcXIy0yswVFkc0EMTMQ4fSvyGWw60KfRVNj5S0TVqlT4OQLguvdb8KCRzcU/B/dF7M9IuvULFYzryy5aO5ikJRY9ECpu1dMKfR3SOqBNJBwEhHj11Y23/aC6/pk2GuvgUK8kLFj9VNvnMf769n13dgBCBWh+7zb4qx7Jf8ao+eBG9itSw+y6ie1GbdxQtT46R56vagtNGCR8bEfKrfoJPCbDy/888ZsuvUE8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(11063799006)(56012099006)(261021123027099003)(10067099003)(261028144727099003)(261021121427099003)(261026121527099003)(261009223027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MBXbeMCeKxaCsdV35xrcGuh/iagA5t7ns+WMfevTZgRpS4lTj/uLnbmP9JQ0?=
 =?us-ascii?Q?jAq/NNRN4ULv0TO2G5/CLOz/rhFmrPVAnl2WmAYESRQsk61yAodH++YjmN0z?=
 =?us-ascii?Q?AI7j4zzCREiz5TGjSCFg04KU7WbZU/gzIu+3AnpbI+x8eswuH524vB70s+E6?=
 =?us-ascii?Q?4xcEDFfI43z2TwxSZB/3LjwzeDgC93sXhGWyWMfGpd3QtNbUFRK93GhcJZq1?=
 =?us-ascii?Q?PdhUAtSvabPFCv7YooOnabWQd8jD+VMN6DheBUMKLWiP93AmKVxK1GgXVGcK?=
 =?us-ascii?Q?2vymER4Hb+sDSf94PwfHf08PExQQ7B6L6vdYuhmv/9U5//njyYkr/tfokjB2?=
 =?us-ascii?Q?xfTmF7+jlLttsb+tswh0CzbnbDQXUAABBU1sixBO5pYF5CQgvYI/N+EnLUqL?=
 =?us-ascii?Q?RqzEXl+0LKNCcos9VKeeOWC2PTLOtPm9VI8pDTi1wq/sN8hfEjrOFVIwrDYj?=
 =?us-ascii?Q?RpiTbCJLVDeLNqHE6gCAOuf1yzhu4A5HT4Lxr4B1iUXDL9WbSUjGovdC4kum?=
 =?us-ascii?Q?iDDKq2ituPTbFNl3Mb8VQ7Ia7zC8F5j0zR4+bwFXqPHK1VdOMLH+sveNztrO?=
 =?us-ascii?Q?W9JbSs2RwqvqfDbrXPDRkC+GKJGild3Tpxl8+HIG5yHRsGgXmhUem+65QGKs?=
 =?us-ascii?Q?txMZMqh68m4zDBwm0PgjHIlQLgMCLcUPRypIghHUz2o9WALwAADRPZA1qAwX?=
 =?us-ascii?Q?T7oxfcsM0eyB3JIeVPb6f6z6YrEyNupBm6/cZjpovCiIlaVjzJZ8+QAfGAIZ?=
 =?us-ascii?Q?9ptvLZnYT9N/VotKIvFql7DESFuyuKwdtLrQDCxc61LkkpGL9kwFEtw2yGBl?=
 =?us-ascii?Q?SHe/iNacDnDK28cYPOomiQ9PMnsoIPa5+9tosOfTBCHdt47k6zTCub0LmbAG?=
 =?us-ascii?Q?/2+zSZ+5a8AJUdCX669FH2QPvaTGwIv9hBdWFxYzhKEKsVAA6PSLsSuXu+q4?=
 =?us-ascii?Q?5Z2I97pi0fmqLB7rydWeSEAR7F0yJI03gEtjRlD7s2t1cZAwdKYzjpZRmxVL?=
 =?us-ascii?Q?1Yoiul1ctc9G+3W74OmfDjstQZ1dAB938E0pgqqMidbybgJqDBrsL08odEcQ?=
 =?us-ascii?Q?WG//pujodxfBGAFFayyKasTqhBU+09NTKADMquo1xCTB3oCEUQZn629eoJII?=
 =?us-ascii?Q?bTCbU7LfmFGx5tc2YZrZkjjnqxRg1vhmZMPTZ/NMjvltrd3RL6tt+Pdh9DEF?=
 =?us-ascii?Q?G47MwkZ2kd+Oj2JJkuWl0fgVDDOLb2dzG4Vc+rVXkABKxpBAQaO2zBG4InN3?=
 =?us-ascii?Q?oFzkO4vEtlkbS2fT+95DyYFJ0ypYE6avOfJd4GIrhgBaAnUc8Ks0gm+bTES5?=
 =?us-ascii?Q?yXlfNBXi1sUvmBD2UBEF8VQKPvpREQ84HNGo7+OfliEg+DMZAqnrCwbHOEBo?=
 =?us-ascii?Q?lbX/jVKICnU+8PgfwGXHOE2hBSjGYk6jt1k8dXOf73CEjENVTraVinq2J7FD?=
 =?us-ascii?Q?VsZOwSBJlZQsuQiQP431oyvm/Fdnsu3AVjLckreyb2Yibx6sdEFlOLa6Gf1S?=
 =?us-ascii?Q?G4stteDQ4UF37nGxCqK98YPa/8QXqihqIzfm0UXgwq25w+rPTcBNKmlJt6Rr?=
 =?us-ascii?Q?YdZeBF0bXuqKHXuqsJeYtIpITXm0gWVHwVoLSxLGm3pdkExOH5k2TmrY+7Yw?=
 =?us-ascii?Q?Ni6/4/TiMyMNm5eBkwepu5ds2D4iMtFRWXiQo8yM36kIQufFUCTDa+UPGUBj?=
 =?us-ascii?Q?F7ZVSjEcWJZHm9F+/WXiPOENpy4CJcNkBFum6PQ3YS6O306LnfcsGHWCNSzL?=
 =?us-ascii?Q?sOk/1PR+hg=3D=3D?=
X-Exchange-RoutingPolicyChecked: Hm3f+2Hc/K4JrN/1VTJgLFdfv3opsomJ/owblYzUz4GaT5LoY0kqeeEMpsKTIEHo7Sx04Ikkt0Rbwcrm4MKAXCkyJY+F5QrSUC+e+f8xuhvaOcPxJ3JB0wKqLpTXAah4RrRW/7bPWUNVz5l+a6X3EXUXwRJTu2qAWUw+HOs91KWA6IcHNP+Em2QHLFAAeCU4zuqcgMkxU77NzCnL441n2OZRacj/u2J4wKeA5VFedstrXP+tW4/Zlk+GvDqbxQEaS4z2MbjLsn/l2SainAPTQPfZ7aFyyvx4n22n+iNfq+hpmKOVdcC44jbSfC2Tfiy58xhv9J3aoVS0m+eP/nhwEw==
X-MS-Exchange-CrossTenant-Network-Message-Id: b4ac072b-8395-4898-7bd0-08df471ae1ed
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 15:28:09.8692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KlyISG0V64c/ouQL6WNAbwrphJcEpoSEU+yfzK97xj7AZygE6tS/6Q5W9s8qA2n+uuMeXuPr4J9RPK0rMroVSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: EA8PPFFD174C06C
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

hwmon was registered with devm, so its sysfs attributes stayed
reachable after drm_dev_unplug() until devres teardown. A reader in
that window accesses an unplugged device, e.g. the PMT energy read
on BMG.

Unregister it explicitly in xe_device_remove() and in the probe error
path, before the device is unplugged. Removing the attributes waits
for in-flight reads, so none can run afterwards.

Cc: Karthik Poosa <karthik.poosa@intel.com>
Cc: Michael J. Ruhl <michael.j.ruhl@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c |  9 ++++++---
 drivers/gpu/drm/xe/xe_hwmon.c  | 22 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_hwmon.h  |  2 ++
 3 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index f5a581d39c96..30863c988cca 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -1096,22 +1096,24 @@ int xe_device_probe(struct xe_device *xe)
 
 	err = xe_i2c_probe(xe);
 	if (err)
-		goto err_unregister_display;
+		goto err_unregister_hwmon;
 
 	xe_vsec_init(xe);
 
 	err = xe_sriov_init_late(xe);
 	if (err)
-		goto err_unregister_display;
+		goto err_unregister_hwmon;
 
 	detect_preproduction_hw(xe);
 
 	err = devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
 	if (err)
-		goto err_unregister_display;
+		goto err_unregister_hwmon;
 
 	return 0;
 
+err_unregister_hwmon:
+	xe_hwmon_unregister(xe);
 err_unregister_display:
 	xe_display_unregister(xe);
 	drm_dev_unregister(&xe->drm);
@@ -1121,6 +1123,7 @@ int xe_device_probe(struct xe_device *xe)
 
 void xe_device_remove(struct xe_device *xe)
 {
+	xe_hwmon_unregister(xe);
 	xe_display_unregister(xe);
 
 	drm_dev_unplug(&xe->drm);
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index defe8aaca7c1..9cbb65891aa4 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -1900,9 +1900,9 @@ int xe_hwmon_register(struct xe_device *xe)
 	drm_dbg(&xe->drm, "Register xe hwmon interface\n");
 
 	/*  hwmon_dev points to device hwmon<i> */
-	hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, "xe", hwmon,
-								&hwmon_chip_info,
-								hwmon_groups);
+	hwmon->hwmon_dev = hwmon_device_register_with_info(dev, "xe", hwmon,
+							   &hwmon_chip_info,
+							   hwmon_groups);
 	if (IS_ERR(hwmon->hwmon_dev)) {
 		ret = PTR_ERR(hwmon->hwmon_dev);
 		xe_log_err(xe, HWMON, ret, "Failed to register xe hwmon\n");
@@ -1915,4 +1915,20 @@ int xe_hwmon_register(struct xe_device *xe)
 	xe->hwmon = NULL;
 	return ret;
 }
+
+/**
+ * xe_hwmon_unregister - Remove the hwmon interface
+ * @xe: xe device
+ *
+ * Called before the device is unplugged, so that no hwmon attribute can
+ * be accessed afterwards.
+ */
+void xe_hwmon_unregister(struct xe_device *xe)
+{
+	if (!xe->hwmon)
+		return;
+
+	hwmon_device_unregister(xe->hwmon->hwmon_dev);
+	xe->hwmon = NULL;
+}
 MODULE_IMPORT_NS("INTEL_PMT_TELEMETRY");
diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
index d02c1bfe8c0a..e67e0134f02a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.h
+++ b/drivers/gpu/drm/xe/xe_hwmon.h
@@ -12,8 +12,10 @@ struct xe_device;
 
 #if IS_REACHABLE(CONFIG_HWMON)
 int xe_hwmon_register(struct xe_device *xe);
+void xe_hwmon_unregister(struct xe_device *xe);
 #else
 static inline int xe_hwmon_register(struct xe_device *xe) { return 0; };
+static inline void xe_hwmon_unregister(struct xe_device *xe) { }
 #endif
 
 #endif /* _XE_HWMON_H_ */
-- 
2.56.0

