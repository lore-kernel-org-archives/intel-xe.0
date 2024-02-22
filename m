Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEDF7C5479F
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 16:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9798610E9C0;
	Thu, 22 Feb 2024 16:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="i/vX7Epl";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC97110E9B5
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Feb 2024 16:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708620014; x=1740156014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VKPKDlvXYyGKDlmtQ0i5Aus/qnJOqXA/BHj+PfUzllE=;
 b=i/vX7Epl0R0HVXvzP+j67xGG2GjKaV7BtcfggKNc0ugdc3VbFnibzIuV
 pJUXpXfGbHEN0DFHd68NIBK2y8F6ot3Tm/UEC69ZYsURLw3OSphoIDXSg
 8H2/AdTDLoGWZMAS++dszVksQ3ZVMKIj1c+fYBhKkFowibqhabe44kR/+
 P/VtsjoKT+Tvmmhto8Y4SG4+r88VfHeYxL2hCFDuJf9oIrNZYUauaNFD4
 bFcCBK6S4mBYP/OkTM1EDHdx1XFZRoz+OgVZh8pElH+eFOIvYoN3llYo8
 K33nSWQaiPH7Pepvra62unqZEmP02Qx87sN90TM2cNsSzG8CCF1VP0WaQ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="28296280"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; d="scan'208";a="28296280"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2024 08:40:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5490344"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Feb 2024 08:40:13 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:12 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:12 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 22 Feb 2024 08:40:12 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 22 Feb 2024 08:40:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ka4QghdJsIaW6grNnfIqNOH6YWfeYdiBRMEE+/CA1brvCkMs8+6lP6nF4v978BNoMz9zPtBxwO9jE7ZFb2OJMSwHGbvnoL8RvvsN58TT/p0YC72TXEAdXCkJ8d7jZU/r9mRLts59RNkuOc8/FceefMCYYNNvqbodJlnCRKtyVZzMCeXV7uGg1VDCGWm3qCgaxKfl8tCV0d/QoJ3z0vW+01Y4+aoN/KXTnDzZLSRtxrfl3SJ55VTlya4KtL9VzgABUeMHmZeW3P1bviyWja2as0wExKYmx51ykzDXcw02shuZyjj+6ep9sUfO4Osv1XIG6tS9IoH+olx+qCTQp9J0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=++kEMvwpGEuTBo7c73i90HNzMjD66BbLLsdj5kY5rGE=;
 b=V0wy5FKnJ0YOsQlgQJ/mUBScM7TJtoYWAR56CvQjiDPjiJTL/g0I5I2lC6XLEnTsJtoC0qcu78qHp82MBFcwSSkOOCZMYJjgey2Em4hAqH5I4qoX2yrucsMim/dLqxUa3MPFPAoefuVnORD2rwaXmDTx0b4MWQf3cLBIwuR6V+9p2Ikq+W133aGemAbehfyPOJHuoL5QZNBK4EvNXgXwbQVN+Hlm5KlgPQefzQyPeOT5LpvEgtXx3kQjrs2/JkKKznMRJFJKz+OhShZWedJwV7brKXuZfAFu9dw+IZ3lKxN3OH5jkdTHlqdcjGzun3KJwA7qDnxhoGm8mmn+JOTsbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DS0PR11MB8764.namprd11.prod.outlook.com (2603:10b6:8:192::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.22; Thu, 22 Feb
 2024 16:40:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7339.009; Thu, 22 Feb 2024
 16:40:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: [PATCH 09/14] drm/xe: Convert hwmon from mem_access to xe_pm_runtime
 calls
Date: Thu, 22 Feb 2024 11:39:32 -0500
Message-ID: <20240222163937.138342-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240222163937.138342-1-rodrigo.vivi@intel.com>
References: <20240222163937.138342-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0171.namprd03.prod.outlook.com
 (2603:10b6:a03:338::26) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DS0PR11MB8764:EE_
X-MS-Office365-Filtering-Correlation-Id: cbcc40d9-e184-4381-3b9a-08dc33c4eec5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XvSxB9gFeNw0w7B94FDwcFnCIoJyOqLne/SgOjBN9qVymu45hJEqpEs52+d4MsZwcnpWXlY/oDq2mq70tkv6xxKexYonE6WgKfqoqea0FsbwrRyq75Rle+g1cIpN5XD75kyX9uubWBTA1B1r5LJ2A23+oEY5qHFG2pcxZNlEvIdZor6zRHKK+DJvj04yRwBK4qzEK+1kiXE/inDBz14T2LFYQbfJsYoJq3ux/6EogkOfwl6RnjjfwIQNEOfEWfS3U6daklrMa98tErb/w5e/LzC6eaKqJrgVaGr3Asx8ztM+92n7YjeZdUglsvE1fJLI3hjX0MnfC2+bqKOePXnUWbpjkX90YOTufgF13sfrhRD7AN5Osia2Luaw2VXBSZdMnzhkZMaTJX63EqKARfSwDH3jEYl+Pg5KzRwqp1fyFDesPLk1vQYLssqXctvz7Gnek2tH7eq1i0aFwUqa7Kwa+9Qkn9joJ8VGAlDbR27Gh+kWGGgbLwBsPpm1SyNsyinpXW0WfDeIrn8Ivm8WlVNTCLLmxN0JF4ZGZrfwolQbCps=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hj1ZazyFjiSSI08t7k6FASUuSGWw7U/awo2St84LJZXt4G/+slf8u5lfq2Io?=
 =?us-ascii?Q?VYdYvJk60CiDbxqsY0SU6EFVLUPcJie/bFoaChCN+BJtO08k/OzV3EdfcJK+?=
 =?us-ascii?Q?XcOA8KKIOpQNnBOWC+6dRGrEJcQha3Idh7Vh6ZNMT+KUPlifZp75Fdnyaf0D?=
 =?us-ascii?Q?taqGfFer0jZmfMZMqJieH4KPOmyIJshbnRdoOgcD/PjdiBZtU1KKCK2WTkVl?=
 =?us-ascii?Q?R6ZX1OjuKw/QYWcIqsp/dIRnhiRkKTs3Cot0ivzCf0iLL2/6PR+4/4nH1FT8?=
 =?us-ascii?Q?YvaQaGOcViXriO/CDvNhaEWKa7VdWCT7xa/DejUQKo/OIi2sgG65a3tAf2XJ?=
 =?us-ascii?Q?3dRjg6IOFAp5ruSDrWyKhI4S7T1TkMSlUqVqtS+Nq4pDzEyju+TB6M+qgrWl?=
 =?us-ascii?Q?tOr7i2NxiWrLnkqdWQz+oEfQCNBl4METw5Us7wDMQYcaEF55jULcLpRelGFd?=
 =?us-ascii?Q?CX2q5DKUEQNuBB8l1JwUb0WtlgN1TTys5ee4MC+0pgH2XrZfA6MmHhSM7NKe?=
 =?us-ascii?Q?otojnPNdJhbc7oBtgafSAsvHCSxOOzXgNF40tt+gcnQ6PdwKeAm/FID3Fx6c?=
 =?us-ascii?Q?gISkFpGl5tYkXEtv+449B7bLz4jfCaHWze6CbYEPnTbPCvyh+K7en/WgnsOf?=
 =?us-ascii?Q?BClQb6FqkimUapTBxt+tK7LcqwoOFd65xBAMrhkuKsB2oZL2ijLeYUHyh9pj?=
 =?us-ascii?Q?/21eJbIUPClWhr6yp4FX7/L3La7NHs/nV2AuUsMeACibhfJsBc+erxjwBBo0?=
 =?us-ascii?Q?g0K9vOBTMXrZFN4UdIfOOLnJiT7EA1v7L+LPwrpalbH1wrRHb4TKMOtEWV+s?=
 =?us-ascii?Q?ciAcNMvEnuMbImmbNQgRDS55Bw2PG85p6M30NtlOPN8b2eoJhmQc2nn5xzak?=
 =?us-ascii?Q?jrVIlHfD0Dzsm2/4Wo6DjbXOqoIR0BM6mMlckfLVvHWAl4HWuy0e1ECkP+3u?=
 =?us-ascii?Q?vwctd9C2WPX6wbHJyzmZGVlJIHM1sgAbBrgfJE6/xbG5EQCWjE8Loyteisun?=
 =?us-ascii?Q?ctuWvqFkMo5ZiHAaDTD0PAsej4Mn5P27UDJrjkm0mzRqZ88qDtaUqe+dP6mK?=
 =?us-ascii?Q?j4iGClYHRhmBjEc37XV0rL2bDMmca3UEgbmU/NuPAi9x8Re9N9XBPbtBtDuO?=
 =?us-ascii?Q?sEhj77a+Q9BKOfcCNElCRqf3BxMk4m+zm9z7xadHISbT7S16boL07Ockbo57?=
 =?us-ascii?Q?RRZ4sRZ7ybl5qBjeBVk7lb1RuUhJ//3kEiuK6pG9ZZVEwrXkoT0Nf1A494GJ?=
 =?us-ascii?Q?k1VVXTuDHbimIGpf/zdP1cMZH6zp7ZF9zvFlmk38uP6Hl3a2YW9Lxuckt3cq?=
 =?us-ascii?Q?PVEhDYpDoHNla+Ye8Hb9sf3Td4YQsj/6odLm9KXDKapJcF595BEoANecj8rf?=
 =?us-ascii?Q?wUz5WUYeUtturth9lWiUAdxMhkYdYXD9+VBt7JpxU10F3D85eScSYAPfW0mY?=
 =?us-ascii?Q?bpIIfn8e1OHVU8vEWflBmjPe0VS+JPt+xznb8ss5BA9J7J5DgnnAsakeNXmS?=
 =?us-ascii?Q?0F6puyFoWxYKlQotp/Y+hgOxQo0N80eGZKaWeoB/bmVD6hRX4lkkGqAXQ+6f?=
 =?us-ascii?Q?j76GVVGNiZt/O3SJLUPO0aRjbsANWFVsgIax6/3K2lFBwalMiB0a//etDLYY?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cbcc40d9-e184-4381-3b9a-08dc33c4eec5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 16:40:09.5223 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tZg5/YMqP+Qv15GDtgnTNlYqr1QDkUn1FbS6GQPmPUOFcRwjBFCKoJnLvZNuXuBmtrIHm777GxhPFVZECuoMdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8764
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

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
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
2.43.2

