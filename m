Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA948606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TQb1lYq1
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF2F1121E9;
	Wed, 21 Oct 2026 19:46:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0711121E9
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Oct 2026 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792611986; x=1824147986;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LXDwta5tziAQ0lvW4++VRTqiiJI1d4vsz1oNFhJqCtQ=;
 b=TQb1lYq1Nm84/RBxqTCHgAMscPN+3FVEAGLQdWBKXN8nWU6H18zfzpJZ
 gli2OjOhMsZ5YI/1ZASU0cWqtwwGGsSBBPbKOWxLuFfYtm6uIsO8N7hjx
 InvpMDVUsjzZq6tN6tl+ppCsEVjLmfoaPeZGgUkakIrh/m+9GHnASTDGG
 0U+hc9ADyOe/yUldzKIgjWCg8esrcYDrrIghNVmOObgbCga9xYlCMOGUs
 ltqXDOFJT4aktiI8mUrYify+Pbd69fhiC10aw0ZR5l4vUtn2DOw0AloT4
 Fh89uIz2srSu09wUn2KzFzNqD3bCcbxpHhfD+fQDPEheboOGveUy6x4o7 g==;
X-CSE-ConnectionGUID: k/OZTywUQKGcytLUcijp4g==
X-CSE-MsgGUID: 38IiLXW3QWeGkHKIwrRWFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1239606"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1239606"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 12:46:26 -0700
X-CSE-ConnectionGUID: 1gi85ciXQryOdx9I2JdP+Q==
X-CSE-MsgGUID: PY6LPibdR/yzW1+JgB5LHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3114310"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2026 12:46:26 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:46:25 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Wed, 21 Oct 2026 12:46:25 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.47)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 21 Oct 2026 12:46:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA+ItHaSLnEuOo1sXjEmpnt7O9bualuML5cKEn4IoH8YVCEbsJ/1puiBAqat57QxHq76/ZKf53zCH/tq+UCu6OsyA/Vuc6ScqQ4j0EO3eywDA5Rg4QwKyyRR11Bj4BWOxgAm+UWeOE6V6pLuzeCAneXajaiVzwimnbIcFsndELovEeTtmTMXPqmJGUn6us6rrPtxEs+gDUl7FhAB+/WzUT1eXCMTUTabcWugfvb49MVzJjwhFcy4SQLGDaHxJ2ikoRVm7UqCVBWz3QzeZE19LKq8aE+M4f4UTnYJaDWnA0f0YRY0h0koBeP82h4wR0v9q3pX1Xl/DIcYTMPe9h9pkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj3PHuCWBk6wXwXCwM69V0X/tx6EL9WV9gXhI2/xc20=;
 b=ck62GNtF2UdT95NOcaA1sEx/c+H445J514FrXgXBYlvYFztZGxuj57HXJpG5hUQaRreaRZfjIMtGhfld/t2S5aFT/0b5jXvwI9vF7TYAUMSdw5T4OTzJ2sxb9/q7WCQuOZBrbDFX+AvF3peel2P9Tng7HbRgHhvp9gADQKIxFQWUDLj8wUCZla+v6LiTg+EX+fKsnRIdNuSrNQmuURmJG8LQChlYD/MRzZZY/L9uiHd6uQ2v/9T4mRCHnwtF78SD7koids8vyynbB6+oeWazW037fQCIGZOzTpNgnd1uRaIVaa5zXTCbHjCbEXVH6u5W9Kz1uIUcKLsBhT6syDSUpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0SPRMB0020.namprd11.prod.outlook.com (2603:10b6:208:433::21)
 by DSVPR11MB9960.namprd11.prod.outlook.com (2603:10b6:8:3bc::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Wed, 21 Oct
 2026 19:46:21 +0000
Received: from IA0SPRMB0020.namprd11.prod.outlook.com
 ([fe80::289d:f5ff:d1f4:a9ec]) by IA0SPRMB0020.namprd11.prod.outlook.com
 ([fe80::289d:f5ff:d1f4:a9ec%4]) with mapi id 15.21.0522.017; Wed, 21 Oct 2026
 19:46:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, kernel test robot <lkp@intel.com>, 
 Matt Roper <matthew.d.roper@intel.com>
Subject: [PATCH] drm/xe: Fix build with DRM_XE=y and CONFIGFS_FS=m
Date: Wed, 21 Oct 2026 15:45:56 -0400
Message-ID: <20261021194555.2171344-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0001.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::7) To IA0SPRMB0020.namprd11.prod.outlook.com
 (2603:10b6:208:433::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0SPRMB0020:EE_|DSVPR11MB9960:EE_
X-MS-Office365-Filtering-Correlation-Id: b495280a-03b5-4fc6-ee6c-08df2fabfb48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|261021121427099003|56012099006|261009223027099003|11063799006|10067099003|261021123027099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: ByNVUOwx1Q4kExshggEc/qhWMHf3AjYet+xUy14FqB6711Iw5Tk7v8Udmh8npz5MmnTassI/uZdTY464hhcY/wrzECbIk1ARFi4E8j8GhHeX1TvF7ghLygrU8GVfSfChH79KQ9AuFbcdcdj2sllRvbLYo+7fagHCDlDGsU7I7YwvkVXGaxaX4JYRAbcoQJUwGKejf0CrohUZ89nqOGVRyPDhkWLGU7DQr+9P80VPJEi6DvZmrTLf+2YdQDomcR3vQmk9o4rJ07qfCggEY78drrzhZc62nMWBnM5QtPpYs3EWE9ooNQf/iwrNodU/n5LTxy+5LtEZU4JpJpcR0YVxTaXReuQZBCbB9czfoxOnKwjGDLq7jZWN0UNTqTi0dLJ8cHXENrf2BPuNazbsF1Z8r/ho0E6PhACQMRrhzSN5upFzzYXnuFLflbF8SzfRLmhMR9o/pbQWUs/hQG5mcVGcGQEuq7/KQhPFWdfmPteSDNgJoRH8jQkO79COdLWBaH+nf+/i/eHQFIp+aPyUH/6bJqT6CKpVEvtqRVwx/jg2jcs33x8tqfQNTR7EstcPjgYl8ZAjEU/2eJI7JMEj0k/0jv7upmMayGwRaRsJjSHUolr6/E6t7TFtigmQjogjrdTX
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0SPRMB0020.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(261021121427099003)(56012099006)(261009223027099003)(11063799006)(10067099003)(261021123027099003)(18002099003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5wJjp30mKjJpBRGdZ2MrWScU0DqE1Bzyqxlj36BMV5aQZyE7fIiVj2bC+Qz?=
 =?us-ascii?Q?DMmlsf88TMfj4vfRHnIOYCC0hVFA05Tzady8EdY3fyXqfxzXiXv7CPP7dwAh?=
 =?us-ascii?Q?sTYhxkzhBJQxDQbqelCTseI7Y2oTBie5O1xyBDmjM5sv+OfCynDW9TWXKHk6?=
 =?us-ascii?Q?CYlRTV1GXzfO8WRaGZx5mNlNWDXsmisRw06ofwUIQP0IROoD1XoZLCfKtaMq?=
 =?us-ascii?Q?Ot6qT1PtA2Dc2fWpTDZBn01Z7YkLlsH8yuoXmJB+kt9hDPUwx2N0P5P3HpHr?=
 =?us-ascii?Q?IGpTd+2z+OM8tff+DNurlw484DWioLJ82lI6QuGIuVQcmnw0l0y6HHBul6Hj?=
 =?us-ascii?Q?SRB5la4y39gzaHmOdEd4eNQvY8fvoxPqHuEXk+krrx5hPf+Kz7OZja6Hl3G6?=
 =?us-ascii?Q?jtXMwKLaXt+tMnxWL5LPYFBhWvWxLVxu3SbtaTfGIuNI9MiIqoES/Kw1UJ5I?=
 =?us-ascii?Q?hIwF2i26sOXJ30UmMTGqL7No+ZfohvwPQUl4RKQOCL960jNys3Kb6ba+ByvU?=
 =?us-ascii?Q?PYHhWS4Ln2Ze9qkjsGWywu3w++8jS8mI9um4HrsnRMJVVGycVBkbrnASwuTd?=
 =?us-ascii?Q?wN+FJBzQOoYSelKdzBL0a6x480/D59yYbbHbhKgIzsTJovfgmkje/F+yFRXW?=
 =?us-ascii?Q?lR+knUysQQK65Z6Vl7+KKFJM7fvYOmLqjwGAOcLr6pQSYA3q4u2FXO4GqGhx?=
 =?us-ascii?Q?ze98qe+5XEPctOaycN0prRMZ6xPWkNDiWTXReYK7Z6C194cdVaRQtGRvj4Fq?=
 =?us-ascii?Q?XEi7O8Zeuc+swyMaCe4RaQfdbe5HxE6t+Wm1hvtudcnLUaiJpXJcLmIPsFwg?=
 =?us-ascii?Q?3tOBKB4MWHxZj2lLk/KLUj17CGMi0Z7mRA4tVtm6zWtYL1qVLUpPROLinQoX?=
 =?us-ascii?Q?vJplFUiawkj3D5ttMMEcJNUi8W/0P9AIiOhTPQoF3bglRtWP6+xkXoP29fZp?=
 =?us-ascii?Q?/gqZrwTIQuGULp4LElcBoECqe4KlbszKJq5bID41hHt+2k6UXy0gxaKUOFBl?=
 =?us-ascii?Q?5GQuVk8YJ6Bhn5y4zZQt5FiMjRNEuP7LWMyUW5M1rpJY4w/mts9vSJTDh4LV?=
 =?us-ascii?Q?57Sz9MMZDrn9Vl8ljGC7IdsNCQGr6seQuYZHlazTRbL6TuPUff28i7lyJvUj?=
 =?us-ascii?Q?OdRqiKChsXuQpvHFMDLyvfC5TkXKjM3sNI5KdxcyjZjVI+bE2AQL1WTdbp2H?=
 =?us-ascii?Q?zTDmc2B+9Tj/knovZlTc58NC5/TQyizJ4/7YOHO5l6IuLe9p2P6+i4FOxmUi?=
 =?us-ascii?Q?zSNcHmNQspX7vExAFUYawV+AYYdEsGgX7fO4oMGiaF8ua56bEHsNqYQanrDe?=
 =?us-ascii?Q?UunlsQPIbDvAy7Ymop27JY/KB9HLGloJB16cHmpuJUk32OmzzgXJKMQCaJxg?=
 =?us-ascii?Q?v5zw8SKCsZfBJEPieUcDigPevWaGjpNd8/yLD8X0RQ/juo5fBbatgONZraZB?=
 =?us-ascii?Q?PD4DfWwp4WrbpybDIkgL7nceaVRIYgkaSSI5SK3VRQD8vEgl5luzB3pIAT81?=
 =?us-ascii?Q?ZA0rk3vNjSKuocAwHsjjKFxdbu783d2xMJaDRlWBIu133hpDRG2zKg72vuw9?=
 =?us-ascii?Q?h4WBislXAyM9zM6ViLMJGqvhPZfelDFEnZi+ttpPtlY7vdMxqFDEv7Rf3ZdQ?=
 =?us-ascii?Q?oE9PbUCTVCNrwWJqH8tHi8rHeUmXJlu8ocRXxeDkxMHRwBW5QYnzkPS94Bns?=
 =?us-ascii?Q?oPB4728rui4QXb/GwlJ4q/ttgBOb/8F+JmFIy2CRG37yybqOIg7KCK0NPDUD?=
 =?us-ascii?Q?0yjVzcEyeQ=3D=3D?=
X-Exchange-RoutingPolicyChecked: fLsW52jmvEo8JdwSMxewwmtdWfTWBEzdi1YcTwwKRPIG4gOns3fNi2ja0hFE12nTz0znxgfWxP5p5OEikJvPG4RAISAJWtqWvkLkAtoqnI0vW2iD0c8BFkOLgnpGqWxsZdKIrgcyqRG4si6BKz9XnBdETX6f9A+Xp5PoIaSC+co4iK+EpIEkgR9Yxsuk9tRnjvx146YbybfrbPxeyUjK2OAgNia8H+iEg8bo/n+s4XYbsibFkNwPDeol1d0tIfsGQRMGBZ1todSjt1YZSGRqb/ncgOxo+0ndqlXtAeMqwDYQsh4s5rhslYSSCgba5/bQ2OAUj/Ln3ZFdnEQRG4fHUg==
X-MS-Exchange-CrossTenant-Network-Message-Id: b495280a-03b5-4fc6-ee6c-08df2fabfb48
X-MS-Exchange-CrossTenant-AuthSource: IA0SPRMB0020.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 19:46:21.3546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: okY9JAdZ0dJkaBeLJtTXlh/IQUBo1a4OXE2zG+ZENAGGspy2tpkdS6bbmBp5tyBb/IcxCp+bbUkZsI+xULlsbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9960
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

When xe is built-in but configfs is a module, xe_configfs.o is not
linked into xe, while IS_ENABLED(CONFIG_CONFIGFS_FS) in xe_configfs.h
still exposes the real declarations, leading to undefined references.

Use IS_REACHABLE() so this case falls back to the stubs, the same as
CONFIGFS_FS=n.

Fixes: 16280ded45fb ("drm/xe: Add configfs to enable survivability mode")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610160935.Qk4ZxBxY-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202610162335.FEwMdGY9-lkp@intel.com/
Suggested-by: Matt Roper <matthew.d.roper@intel.com>
Assisted-by: LLM
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---

v2: rebased and added a reference from a new report that is same cause

 drivers/gpu/drm/xe/xe_configfs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/xe_configfs.h b/drivers/gpu/drm/xe/xe_configfs.h
index 10a00d6bbf8f..327b648944ff 100644
--- a/drivers/gpu/drm/xe/xe_configfs.h
+++ b/drivers/gpu/drm/xe/xe_configfs.h
@@ -14,7 +14,7 @@
 
 struct pci_dev;
 
-#if IS_ENABLED(CONFIG_CONFIGFS_FS)
+#if IS_REACHABLE(CONFIG_CONFIGFS_FS)
 int xe_configfs_init(void);
 void xe_configfs_exit(void);
 void xe_configfs_check_device(struct pci_dev *pdev);
-- 
2.55.0

