Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7965C46CD2
	for <intel-xe@archiver.kernel.org>; Thu, 28 Dec 2023 02:13:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0F3910E260;
	Thu, 28 Dec 2023 02:13:44 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CFA510E25D
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Dec 2023 02:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703729619; x=1735265619;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=dJQT31dIdAK0uAvRJbjE+NTsYCulePPAYVgJhott4SY=;
 b=dP0UgmxbonioOGizrO3gYI2HqQ2pjLxZ9Ow3vsnREALK1TOOnkbnxHBd
 0Np8Kn2ZDeloZuDfJqvDhv9vBO4V24wtrqcu8kyytF0LYrgnP8LGz2uCP
 BGkOqydn6pJnu8OKwq6U3OtPYiSRT2/kIyaTOjXqTw8gWzPNwGcGYu8ew
 VNh1xkw0jWzK70dAZRBa/gUI9TaZ+qzed925lm5BVV/QFdDcVTn74Wgy2
 sKIIEGkCPOkedC6HPPtQ6TQ0r13fsG3n8AIj8pfv45BEiMifC7b84cd1c
 4HCTRXJKlYzTCp2r3JE2H9hNDW6Mjre0q2uQDkO68c5mrfXaIEu5b2ODF Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="482684596"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="482684596"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Dec 2023 18:13:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10936"; a="754611226"
X-IronPort-AV: E=Sophos;i="6.04,310,1695711600"; d="scan'208";a="754611226"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Dec 2023 18:13:38 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:38 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 27 Dec 2023 18:13:38 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 27 Dec 2023 18:13:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EGIXyDrTj544eifjDTsJEdG1TDV/q7FTp8kRP/hY7RhsZDG7OgKEaE982T8nA329Q9sBQmueyYrZWg5l6Lcb7cShE+g2vbRm5h8XwFIXQ8uzUdpDrHuyIlPqfDlnhkbwdczpEXm/bdAS0RNMJR7PP7mqYJtN9Do2VxhVNcgtocYqwCvXqvj+mTgLDuMNfETkwOn9uXi+JVSlZKYLCeaZwRqlFL7q90Hl6RjHkN6ZCAiE/+UlkDuDiS70nUyf7veEjLuS38jTxvW9IN9wq+q6C2MbgEJBbPJ1oF8TLMmJ+MHu1jmzWOD98afNGADgEtHhIDPl6N4BAUYwsyrv/3ELJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYO14445268yR+etFTnTYHb+dZSxZivF+z2fcUlYn6I=;
 b=gCAvtUzaWNl6AzRTppKQGlOB+0KNOEvOTeZVLhwLu23uY5gPCZT/0xmo8/7l8g1xTzdmmAYX0XkWOLdpuvOTHNr3uMM7D8NBSrufhfHIC6JdGuRiWxmeyTGpRNZSXcvMDxrOAdHvPjccsbNU88CqT5Ak/J/9s+V3JriuZ+e4emSk648esbXi5IvWt00Jay+2EFazo4XBgY3XnuCVreKvIVgtQIyfoQr1aowMOuWvHXyxOOmCeTKq3oeIFjZo62zOjCb5dovLU0rC4+FDGJheU/cMmub0lS+Hsx/w6J97LO6ptPRadaX5LCgmzK+OC+47ghDCPFG0mnmpv4zXHK7e0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by PH7PR11MB7146.namprd11.prod.outlook.com (2603:10b6:510:1ed::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.27; Thu, 28 Dec
 2023 02:13:36 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7113.027; Thu, 28 Dec 2023
 02:13:36 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [RFC 18/20] drm/xe: Convert hwmon from mem_access to xe_pm_runtime
 calls
Date: Wed, 27 Dec 2023 21:12:30 -0500
Message-ID: <20231228021232.2366249-19-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
References: <20231228021232.2366249-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::19) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|PH7PR11MB7146:EE_
X-MS-Office365-Filtering-Correlation-Id: decb7e1b-45d4-42f7-db86-08dc074a9996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I9IaaIW7dpTZMkmNkISLh5fu7+rtWSGF3FUoS5aRCMisTVdVktTNlUpad4UnZRNOLO9BvHWOs4/o2zH0g15cKgH6oTC7m6WQLFUQIQP7MhDccgEX2yNCCvxogrNQLkzkF90CNBUd930i5weNCvsp++897YrNOW9rX2SXp3L584KnC9bRCLVb9vKX6JJQeGLJ3znxL639wuwK7otrwcm4KOLPqMw33+NzXBJLMsb2x5V9NqmQcdNcWjuPhFePsiu4u4YNDv14uKp8RDW6o/H/JIgfPePPVrav5NFzK80k1CPtzvW48LADDPlBnwiT5f7azZfiD78U+MD4VKvG0G2RneSAQ67Rt3JWeLCDxcT5OvSHM3LBVlFpVYiEQI3lUnqxztKX3MtwT0uXZKD+gT1xs3Br5i4l5IDA4HiIIzYXenn5pt/FwWL8pLmTeZUMkFJ+K3gcCMTqFKcsavftD27OMtnJJv/LiEI6ghZnTjgDZEs7zhjs5L9g3a2lbF92TxFz4Saeh1Vr47lvInybt97z6jR3E5Mz/rsat/rVWUlo+e7u9fI8CBJ7EJ8z33azARhn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(376002)(396003)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82960400001)(2906002)(38100700002)(36756003)(86362001)(41300700001)(66556008)(66476007)(316002)(6916009)(83380400001)(66946007)(6506007)(478600001)(6486002)(26005)(2616005)(107886003)(1076003)(6666004)(8676002)(44832011)(8936002)(6512007)(4326008)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b9u2AuGEPuV3XszzsPsDV8NMlWR7J/3zH4NOhvv8LDFHUQHK/vajuJQNZJuv?=
 =?us-ascii?Q?JD2Pvz0MurqlYDQ3O3kBt/bFstropVaNRcsxBktSAPaZKrs7v4y9XJMHmCiu?=
 =?us-ascii?Q?2uYbtVzv16ud+BjnHVuHjKXgpfrWmB4Wm5FLEmVGXiZaasn3eYRFYT/J0BIX?=
 =?us-ascii?Q?CkaTvcrUKd7Q15vl0hZK/1Rdir/D1qt05Mvr1cC0s2a1x12sWBxq0rsj+/VR?=
 =?us-ascii?Q?pQLw+/rTDnHRJr8yLrWbNdOrMD8XxztXKIHXseNzssdzOUt17PcjOwlp67Qy?=
 =?us-ascii?Q?lna+H6vz20NLXCPXZxjLFQNPgn3oRR88ytjESFwbtyZb40WTDQq2r3clnfZZ?=
 =?us-ascii?Q?+t474eom4sd7fPbfYLrt4kFpqCFdjr7nO0Om6b2EnXvvce/DT8d5J4urAVlv?=
 =?us-ascii?Q?oFV4Ypz6Gp3cILkJC6EY0cHjc3Pw1dez7ZhDAwMGVD45nWAamFR/gTXuAGIZ?=
 =?us-ascii?Q?8ikip5ysi0J9A2Sub3ld92ihHNt7VgaXl/ZblrLRZ2+FFSlDUCTB0Aw/xGZb?=
 =?us-ascii?Q?hmDmynmo/nDuoZsfE/aA/q2+JrBi5MK/coKOsZc6/FGpnUjoJ4gb39xKkEDq?=
 =?us-ascii?Q?oRffGfeohntk+jvWiripj9KDO7MfkpMxCUadd7lHPSeVA52olYlPGukE5qpy?=
 =?us-ascii?Q?xhBKLVpPDHBdcCjOyiHvHudMieiwz1wyMGKr0779fXiVOXQZGDUo2gVDfx1j?=
 =?us-ascii?Q?kjr+qt13gudUx0YcmDNGx0Spgh/ZNjH/2Jy0ybG1jn5PO6z+FS2c8cmY7V3/?=
 =?us-ascii?Q?vdswiDh/ApPOuu/juzN9O2LY0pxH9CWaaZCs8nSyGCXgIlPt/2tFatcx8RDV?=
 =?us-ascii?Q?VwT0+QH/v5rqd0Bt7zIXyCiHXEAbqLtpa5cAJ+vjw9qJAnx2FrbSyCZCrldD?=
 =?us-ascii?Q?KhLKSiWv3MjB0i9M17ki3DPcStlo0lAtwWR8yACoXpH+LYgFLP3L6x7wxaQn?=
 =?us-ascii?Q?lBHzSDp7IVItv9SRalAwiGC3D6llXwVCsDeoITU898aYBAQTR85bHlGXPOve?=
 =?us-ascii?Q?r8Q8+1AiRFrOTwuoRcVKIpoTG8ORkfTVxgncyZgNSWsgxSbYuOVZPk6sypzT?=
 =?us-ascii?Q?JFgWXg2H2P3KRo7r8ki9/9nl9kZIf1fVtCx9si8m/8qn3dtQ9xThRRpyd62+?=
 =?us-ascii?Q?6DZ2PRJavghC2kVmLFEpQ4QjvGSeGA4oJ5ol52myYjZO4QOpx/Un0PTkn5Gj?=
 =?us-ascii?Q?Ofz2026WcboijjYaI9nQYoV/tLCwpYxBeBUfQlzMXBRIvHBY9WW5ZxXsPO2f?=
 =?us-ascii?Q?g0AGTwtCPxns55SaGuSFaXt8UNOZuY9zvEJ8UJv71tUjje8yGFXWefTtk2d8?=
 =?us-ascii?Q?i77/PtbyuVacWbe6vXROodDxhA9cDYiyw5z6a7ywIEhr2kEHyL2oXSG2idIQ?=
 =?us-ascii?Q?pPB4SWB3hEq46rLbi7K4UOonl8trJp9/Ob1F0IC4zEH0bBdx4O7HwDD4e28n?=
 =?us-ascii?Q?8Z3y94Sm6Ffqrs8ZZh0vydgLkQTjGruSxrj7E61ssuHxmPIcF+ZSTBco7N97?=
 =?us-ascii?Q?SrZEDdJFh1fC9pqxH6+J3NGjThAFpNfZI1zE5OJROja6PpIKwtSmIYYWaFzm?=
 =?us-ascii?Q?ecRkkXbrTAyNsYt+Prd89LmghjsQAh6RyMnEaPL/1usB5uVCCZJ7sp5H8B3U?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: decb7e1b-45d4-42f7-db86-08dc074a9996
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Dec 2023 02:13:36.8750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wS+cHdbohLQrRFdTBbQBqVykzOBZAIbpBMkM6b3uGGmOm6gUfS+zIXpF6SgJqg+cPn76Wd/TD+cfojfRmNSqRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7146
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Continue the work to kill the mem_access in favor of a pure runtime pm.

Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_hwmon.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index 6ef2aa1eae8b0..e7e001198097a 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -16,6 +16,7 @@
 #include "xe_mmio.h"
 #include "xe_pcode.h"
 #include "xe_pcode_api.h"
+#include "xe_pm.h"
 
 enum xe_hwmon_reg {
 	REG_PKG_RAPL_LIMIT,
@@ -264,7 +265,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -273,7 +274,7 @@ xe_hwmon_power1_max_interval_show(struct device *dev, struct device_attribute *a
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
 	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
@@ -352,7 +353,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	mutex_lock(&hwmon->hwmon_lock);
 
@@ -361,7 +362,7 @@ xe_hwmon_power1_max_interval_store(struct device *dev, struct device_attribute *
 
 	mutex_unlock(&hwmon->hwmon_lock);
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return count;
 }
@@ -382,12 +383,12 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
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
@@ -608,7 +609,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 	struct xe_hwmon *hwmon = (struct xe_hwmon *)drvdata;
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -628,7 +629,7 @@ xe_hwmon_is_visible(const void *drvdata, enum hwmon_sensor_types type,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -640,7 +641,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -660,7 +661,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
@@ -672,7 +673,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret;
 
-	xe_device_mem_access_get(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_get(gt_to_xe(hwmon->gt));
 
 	switch (type) {
 	case hwmon_power:
@@ -686,7 +687,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
 		break;
 	}
 
-	xe_device_mem_access_put(gt_to_xe(hwmon->gt));
+	xe_pm_runtime_put(gt_to_xe(hwmon->gt));
 
 	return ret;
 }
-- 
2.43.0

