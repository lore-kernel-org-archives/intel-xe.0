Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BF9C25B7A
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 17:01:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B5A10E1D9;
	Wed, 22 May 2024 17:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DH4Hz62l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E0DD10E1D9
 for <intel-xe@lists.freedesktop.org>; Wed, 22 May 2024 17:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716397297; x=1747933297;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=3nNr7L+T8OSWCrJDVWVKQT9i4LrN+2tiHlF7pLOmI/0=;
 b=DH4Hz62l3aqmpDboVXgbafZenxr6Kayk1UuR2i2S2JVx0KzdWITbzWkt
 sSnQrNejX+CCk5a2qm+tjXHJ4r+JhI7BrSm8kxXnPnZuEhYX08cd3aGud
 uAbJMJbzmLQ4TKg4DPkMk41AdExuj0BfM3pvq+Ia4p/zEM/uVjqetbY7D
 ydCdTb2+CS93psXjaCixeC9dDfPayfEecnK06UCw7v1yVLcpKDYuYe5n7
 0ggPj/PXmxBfYNO4GYgmR9v/z69L63ccwtO0LZ7MaTcs50JaotHDrUce7
 BncL6bqeEc7oFlLvj5fV919rech/6Ho6eF2wWSpOIgSwmuWXh0WX1/PwZ A==;
X-CSE-ConnectionGUID: zd7cXiR1QluLVF9sF81Wkw==
X-CSE-MsgGUID: CzmVqQe7Tw2D03C91PnWhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11080"; a="23239497"
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="23239497"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2024 10:01:36 -0700
X-CSE-ConnectionGUID: cUTqRxRRSP+9PmVOsHKE/Q==
X-CSE-MsgGUID: MvTVgCcuRPq16yhVXGP5Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,181,1712646000"; d="scan'208";a="33218523"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 May 2024 10:01:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 22 May 2024 10:01:35 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 22 May 2024 10:01:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 22 May 2024 10:01:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWuuHbdk4O/W1pmWRcmwn6yKI7UPfemVhxBwxi4lV9+nHHqHkBnYONg3E+DHp3HZk7LEwYF93/t+rAse/h4yYtls+8Qf86fxvTyi6QlCmKCDqwK8ydAlvBGVhuVygZcytqfAkYdy6O6i5pd//gL8U/9Zdf9VcZ9EY+/KNKHsOA6gi1o6BW2DcpHMGtxO+vv+opLn6Lm787XB1VypyazSCMWUwt+cARhrCL+aly+ydWSZSG7Aq7ZcKo82RL5CHQbGyA24HiewrWcgvaCcDx9n1SZg2ZOTDAH1GBtx3NQoCoMuo+zgds7szx+GTH5wzbUarl8ZRbiJkGv8j+Bq91qmeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pzm35NWCa/1KzZlTDhmZO8oBNpgLBrSBngwM2j5YWc=;
 b=WJ4E29HTVZ7Vu7nTwBTCVVLVO6Q6SWgb/V9CrRxtuQbJHXUgobo1uoZZpJoiVy96vyHu4Cr+8Xl9nMix24I2yUoH2MrXiVPs3nTnLgt04xDR08/ZTi0M5LeFDHtdXmOZfkz0IuhEijyq46vxT2QDYx1G44BLDogHbJ2TisTBi1C5RlJvYgZs1UJ8uJhLj4bkCyuSnZCIGFY3gnK/EN+U6aFmG3+K74NPJg8J1K9BkjIGFKhPM5MveYEIwcB8N44+rYx0MJE+rPsUz3w/m6u7FmUal/IGus5v81mEi50sErUqaSj/Smjp6QAke9HrVNkiywpmNmrTcAMlQ6Uy5LaQ/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by DM4PR11MB7253.namprd11.prod.outlook.com (2603:10b6:8:10f::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Wed, 22 May
 2024 17:01:30 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 17:01:30 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Anshuman Gupta <anshuman.gupta@intel.com>
Subject: [CI 7/7] drm/xe: Enable D3Cold on 'low' VRAM utilization
Date: Wed, 22 May 2024 13:01:05 -0400
Message-ID: <20240522170105.327472-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522170105.327472-1-rodrigo.vivi@intel.com>
References: <20240522170105.327472-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0070.namprd11.prod.outlook.com
 (2603:10b6:a03:80::47) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|DM4PR11MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: a20f03e5-4be6-4901-9731-08dc7a80d355
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zmV5f1HMLEszwFsxIlBPmOl85a304a50LaG02tIUN4y/0vyk4jpp0d+cw2qt?=
 =?us-ascii?Q?nerfBt+jqCABC6LbpAZhjfhQUA5UO8nf5VUYUYLd0ep7eFZE8/fKf0AATcXL?=
 =?us-ascii?Q?ZiTlDijN5ZcXnvvVsRyKCbl7p4cYVORaeuI18ntnQA/KzVjXmUId/aWoobJv?=
 =?us-ascii?Q?ceXz/WeBRSx93sHxxjRCFbyVXCnkvzoIxGJUwJdiXKsRuADBYIbYhISZFSqB?=
 =?us-ascii?Q?UBH17/fPqPexjDA1DyMuANnkz/H3MgSHDu0Yi+qWjq5VojZ8OA4Vfw1toTm/?=
 =?us-ascii?Q?fd0xDzmG0mfoguiFbLH/oPwIdqyRWYbz0x1trGDrYSCvjcoo03ZxPZTHtrdu?=
 =?us-ascii?Q?rgJcaPVzT1vbfaYCc6moA8QliXgPnI5+2E1shXr6NjTgfyyaCCR/O92WZ6Vc?=
 =?us-ascii?Q?wfZ6rh+X9yLAlxtCjRqCG8Pt4yozvf7lh7deHuO5D5wouKcWjlp4kSPFPwlQ?=
 =?us-ascii?Q?rPyh7EK4jrLDYJv5NgZ1Y3T1GLjHLcP8e8btHVGu0cZgRrVei5yooA6H4tZx?=
 =?us-ascii?Q?6uOjuXyrw7nLbq1YG2sVTnkpzAioSkAY8zrLLBJhSVMQQgiNf4+kaBemLAig?=
 =?us-ascii?Q?tf4daz5pywNJRPaksQ5/+iOTtSQ4UaB4eacDHHaLuezuz3S7XGqeOabXBEka?=
 =?us-ascii?Q?FTzOezlmCy2SjIrFr95496PIxr+bOyZj21V6eXABqndwp4V4mtB8T64fDR2W?=
 =?us-ascii?Q?x/XsmNtVGcyJLWJp4QYXFnJqYIseOMHpqaYoS9mPWNvtfA/Q+g8DOiF5R1bA?=
 =?us-ascii?Q?31WXwGOA4F/CYmgXdhhDgLZsqVT5P94bNgXi+mhFbZxxC7ObIQVt7NhL/Cxa?=
 =?us-ascii?Q?/t3rPHlBOA55LhS8XFN5CD9T8Wkngwwmfs39/qFFsHfXwxMoaYTob9GwaEDT?=
 =?us-ascii?Q?tEhh8JMsA7aT4MytoqSi5yOHMCk+YC0eHULp/kp5BuLQgVKxD9hLbC1sIr5i?=
 =?us-ascii?Q?NVFQnuTnL9WoT5EUhdxSohGQ13/mFX+n1Hu9S322enIC1fCSFuk8JuSDxZWA?=
 =?us-ascii?Q?CtHOMdJyTSnjRVr2DYM9hUwT4KmviwXwOGroLNqqlSMWn1Er1qeUIz87oXpf?=
 =?us-ascii?Q?AlWgpIIlUGcNXMgMM7ljG59QarmXVKv+ZA5PW1J+UHn1T31xYdTmEeg+zmRS?=
 =?us-ascii?Q?LtX2O6/+vwNKQEfHlhjRLtW/6ClwxPRkucGTlIFVTDEnEPeKowffTW4aXbdF?=
 =?us-ascii?Q?ppaiyJD+U0ku0uZtKXI30YoOCrtEGKPrcw6NJJYK3SZWinJ0VBKj+rpuDUs1?=
 =?us-ascii?Q?LRaq95t0AuvIAAPPl7J+g57CC4bq9qWB4nBOvBPU0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D/WDzrhxc1pdp8Y9eHOQmjkktjCY02+ruTNuOK9WEddXkHWHB9kQxupDY71J?=
 =?us-ascii?Q?YArNcG1MTyaz6oD8/6VTW/2On7ljOLdrHVssycQn1QT9ccF8LcqmOnf1wtOK?=
 =?us-ascii?Q?spt+GEz0T1z3OvH0pUdrYmZwVu+0MaL3MhwQOGh7FIKqPB1vRDruF8WwIKeT?=
 =?us-ascii?Q?EtQl17WJ9PUTOelrp7RYfSVfetOWDk7IJTl90Pw++TYUriIHF5QdR+HoLVjp?=
 =?us-ascii?Q?+NNNgmEw685CZNBzhAVUwhMaMSAM9RqycH97j2e/sKDW/+qOQVO1B0cCEu79?=
 =?us-ascii?Q?ze25N1kabbzEVa26HCqoiAm3psDWWg0jYD6B660FxG9NqWpUXmVWATCqSSJo?=
 =?us-ascii?Q?oBMSezcMX49+E3F+ROy+WRBv4GhgqbMeEYG5yoIEC1A9pDTNWi8tWM6qtVPT?=
 =?us-ascii?Q?nWV/LSNvCzL/N3/r2We0BOgkhMkGTsiJB0gDZdwccHAYWA/ZuTOJK8ECVEcW?=
 =?us-ascii?Q?eBe8nkdB9L2Dls5Hhj4g8DfU8GCXVpDr5d+EnQiutFnLPSlGjnB7GsDyCs7U?=
 =?us-ascii?Q?LIyTtnPdFEaRC2BVOE1IAIU37qoZe/0XhOIecXJ3GtjtgNITcifugWQNeXIz?=
 =?us-ascii?Q?lJy47wRiWiIGHD33HFdBKN7HIlFf7b74cz+dvokVaSYORwECQTDM8UMSc4vQ?=
 =?us-ascii?Q?A+ClTTumrxTSuBCKUIP2DQQBdYhP2zhtX2Zmf8OKFh85MCujEpYfguPwMIAo?=
 =?us-ascii?Q?9jdzEkZkjDWlP8kzyqNsCmIPk9gYfrqWl7fG+CDqyY4oQjRn33H+o+3PwGwt?=
 =?us-ascii?Q?DCjPxd9qv/b1xloWNvDFKYAQ6rynu61TZduZ+1nKWSdYtq4vWEkgTEVnwmSY?=
 =?us-ascii?Q?02uZdI2+8iqs/3YOzozLqqlMBoZAzG4+gia131xDJJSIvyyMDu3Js76Eik1M?=
 =?us-ascii?Q?+gmVLe5mwSjPnjvkWumcA4HA5BzeeV72a0lX7YI8veBz+tLjuH6qBPoM0ELI?=
 =?us-ascii?Q?DTR1fLFfh1MwioT/abTGu2i8eF9/PDSN5wecnFwDAH9u53JaLBT1GcNs9mCZ?=
 =?us-ascii?Q?MNx57HsZmAUUqpXDM+WEZTTJQKlNFgPPWEhjI1AxWHYbCzlz7IhzJ4HA7LcE?=
 =?us-ascii?Q?74oenN6OxAF+9fSQ+O1myZ+Pqr3BAgq907+iX7ry4ZbMs0bEiOcTKGOw2YJo?=
 =?us-ascii?Q?aiwCGRok5fdMcRKapcknfb5FzTHGUNBOy+48gAxHkZ9er4pl3uNJxbjzBdx3?=
 =?us-ascii?Q?OUbXuaHUm9nIGahAKBW9gHwtbsORIEosKbQsFRTKE0L3Ex8joAyLlH6b5xLI?=
 =?us-ascii?Q?ooYW66UMfTKizbrab4csQJ8dZWCenuitQAx226aoeYatibDDlMv7PJm67I2B?=
 =?us-ascii?Q?7ZUTO9nVuUtl2GSAzTQlVE03VAUpGTaNaZ/mpV9ADMjRS3qd2W+PSHbZ4tPF?=
 =?us-ascii?Q?tnulIuJQmoKN7R1s5PoXPL0MRFq3LiOk00jhilKhvvDCvQCN3lmWttzgxty8?=
 =?us-ascii?Q?e5peH1xhtDXUr2qTcrIyQbfDI4nPpOV07qXuKW8PYSsp59BZ/XfeMxZKUZRJ?=
 =?us-ascii?Q?9Q9dX9B71WT9OFpUZjczuGZL+76nJPNWQOI+G0yh2H8VECiJ1aki6zUVBFLY?=
 =?us-ascii?Q?hoeQDz+kQ4csiXkEetGCWl+9huixk/5xvLzVvkS55jyfeoSnjtQB4119gOt8?=
 =?us-ascii?Q?Qg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a20f03e5-4be6-4901-9731-08dc7a80d355
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 17:01:30.1503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 03eiwG74tpR8gNtb1uy4xdSSJMcUWaxlKo0HZIkawAGxq2VS0/i4KvBr947LOVLnp4TYTaMBd+7PiCKbzsnlgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB7253
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

Now that we eliminated all the mem_access get/put with its
locking issues from the inner calls of migration, we can
allow D3Cold.

Enable it when VRAM utilization is lower then 300Mb. On
higher utilization we only allow D3hot so we don't increase
so much the latency on runtime resume due to the memory
restoration.

Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_pm.h | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
index f694005db278..104a21ae6dfd 100644
--- a/drivers/gpu/drm/xe/xe_pm.h
+++ b/drivers/gpu/drm/xe/xe_pm.h
@@ -8,12 +8,7 @@
 
 #include <linux/pm_runtime.h>
 
-/*
- * TODO: Threshold = 0 will block D3Cold.
- *       Before we can move this to a higher value (like 300), we need to:
- *           1. rewrite the VRAM save / restore to avoid buffer object locks
- */
-#define DEFAULT_VRAM_THRESHOLD 0 /* in MB */
+#define DEFAULT_VRAM_THRESHOLD 300 /* in MB */
 
 struct xe_device;
 
-- 
2.44.0

