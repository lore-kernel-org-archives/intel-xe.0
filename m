Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7560FC4829E
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 19:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 259E610EA2A;
	Thu, 15 Feb 2024 19:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZjdSZnCP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D67F10EA3C
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Feb 2024 19:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708025714; x=1739561714;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=t29lv8neiifptQBPCkHw1lJgBTuKUa8FO9HUMgBLHs8=;
 b=ZjdSZnCPtsiBft0uSEbA9xFasrOMo54VkxNsvyiOMHtTHynRT8xAnN3d
 7VnCt1+DmHykGo2x3Whll4i9nt3Q7q5EC3/2Ru1j7iWDeJkVzmmAktzqT
 MTljp0g/lHoV125wzZKKKO+mM/5p0n/vESFRwOglbA2HN9ZyS7EDuph1p
 u8EotcIwFtrtF+lnWw21XT48oU54aTiwWTd+37tSIJg2UVovMvUoX3vNo
 q2IhDZnNb89J1CLUVuEYUHmlmVpWMZZ6Pl240AxWw63l+AJ3G8kTvcXgQ
 BlWdaK0SLW2njaFFGRaMOM/WRpIwX+RcwCfkVnFLFYkLK1y5JpqI92gl2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="12688092"
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; d="scan'208";a="12688092"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 11:35:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,162,1705392000"; 
   d="scan'208";a="8230701"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Feb 2024 11:35:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:13 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:13 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 15 Feb 2024 11:35:13 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 15 Feb 2024 11:35:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kK0wfVR1IYpd0ezJMvBlPqnepmYI0i2hlGCxPm2gQpgKlLttluJT7/f175iCZSuThcbBw75Sz12XFptxPNdDe2KvrZT+3cx8PsB7V5AdLXn/w0Aclu2e4z+4op+vOAVeqWFgeqM+9jn53Or8VMmFnazsJrBHPw2vPDKqavbBpbUIH1SvSri5sTT0ct6rBbO2hBua7fejy1X6i6irqWRwOgGrFffZbhIlJRI0BjY3k8hQVX23mrKyePHbu7kRiIixbfmos+WaRRxCwLJrH/Ua1CnG7m46UiTEv6xBBns6NH1BtylTQc4ELXuDd6TEZm/2wgczQeo6p32WVgs35vaahg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=18v6w+r3YkFOVGvy1vmsqssmAS6FnVpEfVxmTEZ+saY=;
 b=AIUhcP8AD7oTUgMQwazmfq6amFk6+2ElXT8FEFcQy3v9ctskvQaBW31shLfzP9UwwUgB631U+k6djsVeHz8Vb6nDd7i2rEz06Vfa0T/b4LYwgQnpMcj9AFRpD0LTOZCR4jGkSuuBZxJkEXCp0jIaPZbMa6oj88QbidFctlfGSna5yicsT4Rmi2JYE4ya12o0chVbypbt/Oa7SbbbitT5cmwnI164byDEHrGyg0jlDuFBBGQNVhX4MDe3tgB4GrCt9q0xSGiuHprv7DxyaiEiRr3ICs7nxkDcmcc/huEecUIv4fEK8bifOvEIm2PiC/WLhC8HN+1YOdXSDg80kte8DQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA3PR11MB7977.namprd11.prod.outlook.com (2603:10b6:806:2f3::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39; Thu, 15 Feb
 2024 19:35:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7270.036; Thu, 15 Feb 2024
 19:35:08 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 09/14] drm/xe: Convert hwmon from mem_access to xe_pm_runtime
 calls
Date: Thu, 15 Feb 2024 14:34:25 -0500
Message-ID: <20240215193430.130106-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240215193430.130106-1-rodrigo.vivi@intel.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0026.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::39) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA3PR11MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: 94c53d73-9788-4d98-bd8b-08dc2e5d37da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZfjY6+MIY734IfE/LTlimOU/VMHh42VPib436uButtA9tvAVBhpcSmHM+qFFbNaaxnFmOW1TlZTBT3Xk3KV6JvHvVPujwhlyFJLqIyVWgZOnOwyibFaUqdNwCv3BoW6lXtaOcllDfqF8HTmcvZD7QGJxvvMZ/zpUva6XrYa3QONTXwWTckfkJGp+yjOiYe0zL483kmD0QKjoBjJagLyU4TVx2ymWV3wifa49GvKIfZv+jWA0F94d2k6emC0v/jSUpC2wtIvbmZr7Pl1xAAULp3yXrElEl/72jSwSzh/X09NA4+70L7SN5zcof+jHr9cX9+UPZJdTxfWV5GqZS8KLxo/JUroUQdurKfeGIsTZeHD53UuWMSEZVW/Guespi9paKHwlaf0xr3PahAlmfbzLh7z0wjRDcmt0a7UVf/Lx462xy7LEIz7j7VenM3rozmig+v4Md9oq9vHyK+bj7Cf8DyHhTGVPZq+lWvlgc4Y5/+reQTwY4dIplgh8oGyfXZvTBa/4xe3MzQt/ooV0MZzae7spiXyCebCV884RwHPnVs0MKkOLBqit+t4nEqUtwV9t
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(39860400002)(366004)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2906002)(44832011)(36756003)(8936002)(6916009)(66476007)(38100700002)(4326008)(66556008)(8676002)(66946007)(5660300002)(82960400001)(316002)(107886003)(41300700001)(83380400001)(1076003)(6506007)(86362001)(6486002)(6666004)(2616005)(26005)(54906003)(478600001)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pBw4WW8CGMD23jnRKGEZ4llxXPa3a6VBRmRiG6k1PE9iGi6cw4LnpOH7gARt?=
 =?us-ascii?Q?ewyBIzZGOIfVsn9kY53iCbDpUSm3GbcULOY9M6H1fehxDOhrg4Bfd2TNU4QU?=
 =?us-ascii?Q?vUexn2hB/jmfZSK29KBDbaBQiRSmq/zcljsm6cXEvvmT4+AWAC9i8lierObl?=
 =?us-ascii?Q?ov0kKKkd1zDSkCRxsdVdb6/7gTl0TurcIAvkUCiY9dcHGmb6+uAEgjH392VW?=
 =?us-ascii?Q?8HvSq8mG/9GmEybu3UmXu1pERSRDSfvrrdp4h6vSPtcy01xILpK67ydWUrtV?=
 =?us-ascii?Q?aB15pV9MF1JcRYTGZvYbZCAvB3wsX2iRWQdI4paMtCgzxo03KQ1PLRWn440W?=
 =?us-ascii?Q?sDSMx4zIzGmMvc4y0IiDLMXfCTd4Mjif+EvO1GsHwFY22I5HsXBKKQFHjED5?=
 =?us-ascii?Q?c64GuFZZ61TYCttFrBXTB6I+DX0zihbfE87pqe07Pv9iRT6qmXn0tchuKmTI?=
 =?us-ascii?Q?7LGsHgkAqC96aXRMa/i+KB0KfBsp8IK11mz3HbjeaWLtnQfcsjkji3IVlBWs?=
 =?us-ascii?Q?Q7m8QG1MhAtWXhVo+PubO098AkY19hB15rdEPOUnAVeeS5ufLHk0TWExL0Fl?=
 =?us-ascii?Q?Dcbk5t4T63qTOMqXLf0I/6FqkbAP9w0BjwBFLR4eSoqDpEvjfKho6aNp3v+G?=
 =?us-ascii?Q?Ok9ekAEza4tRfePZgV9+HROqwBR7HjYxWyL4T6gs7rE1U6Rxmr3wvxzbV7hV?=
 =?us-ascii?Q?w+fcU/AnmbvLEcn2rhB+A9xWHeALRY/p1ZeLa8drutAcslxSvmXYa/6zyNI8?=
 =?us-ascii?Q?X4w7br3emAu9AkSyuCuZKwY9IS8YT1kP/dMPrQvE6uLZwg6gJwO5lO+Qydat?=
 =?us-ascii?Q?M+g1BN8LiL2x6iJ5bqEkefQ5knyaGZZ+Zy5jq2akPAH3mxEwLYUrDkaEb3Yz?=
 =?us-ascii?Q?Ie4mAPU0BFQvEqprPiAWwD5YUSmRnyrf/Vr0qzRCU+KmBUXRp6CY3UwmfIWU?=
 =?us-ascii?Q?CyxZZw74C6AdG018BcspXEYFKgSBVkgqFxZy265B+iYqoa4MBeBcD1dZczD2?=
 =?us-ascii?Q?DFzQ53xOhyVhKZ20RgNF6DLq2MNCvjj5HHEKu++n9dHxLMRK9mvJnbleU1Tv?=
 =?us-ascii?Q?8W/Gs0OGbthySE0o4qLXgty51hk7lQO4pnqNW/dbwNDohh73OMGn9Gwe5rmE?=
 =?us-ascii?Q?L6kHGyG9BvGYNIyv3MMoSr893ThzfMsdgnI+CJ3lYgKVEGovaQ+ZZQtquAev?=
 =?us-ascii?Q?B2iBG3wBHd0cxMri7pDSfcmmaaQQ6Qm+tz9F/1hCbHfnkMbBbSzNszzqESMR?=
 =?us-ascii?Q?M9P9mFii99BjlrOUs+CTQGq47n+MGB4aYfSYHKqTn6e4MDukaOkDBv5a5OsD?=
 =?us-ascii?Q?w+7bZ7HOkVTTBX/IASlMm1xCMINyNAem60ixWzhaAoP4Hu0EC1Tf8ZtREe/T?=
 =?us-ascii?Q?JBhIeH2yGd1qIEB902ty82zFjNsTdCiZNgAE9FILkTan/8TdKvBQ66D/EfHk?=
 =?us-ascii?Q?QJgQ0WiwoodBodGFUDaGCAkU3N5irDHJyDQywy+xKwf80pfWm3NKgjJTaBgY?=
 =?us-ascii?Q?ClPBT3Ijt1zQRngob0q1pw2oZXOZC3/Eh37eGa2jyd96/haFys/pwCL8u/Te?=
 =?us-ascii?Q?yRBNYf7l6Ddkx1+lBeFMI3EEgdNzs8iUD4A5xNSrdKJa86mWwVKXbdpN4ZFg?=
 =?us-ascii?Q?mA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94c53d73-9788-4d98-bd8b-08dc2e5d37da
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2024 19:35:08.6355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5s//nbuWEsnzdKZ8mLocec+e/IZ9MIfykZsF6WbGEAoxUyAvUYf3I38j03TKi0B4oqxpMwZOEv6EPoFI2i2Nyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7977
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

Continue the work to kill the mem_access in favor of a pure runtime pm.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index b82233a41606..a256af8c2012 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -18,6 +18,7 @@
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
 #include "xe_sriov.h"
+#include "xe_pm.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -266,7 +267,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -275,7 +276,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
 	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
@@ -354,7 +355,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -363,7 +364,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return count;
 }
@@ -384,12 +385,12 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	if (attr == &sensor_dev_attr_power1_max_interval.dev_attr.attr)
 		ret = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT) ? attr->mode : 0;
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -610,7 +611,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -630,7 +631,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -642,7 +643,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -662,7 +663,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -674,7 +675,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -688,7 +689,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
-- 
2.43.0

