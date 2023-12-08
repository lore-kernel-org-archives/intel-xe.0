Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A201C10F04
	for <intel-xe@archiver.kernel.org>; Fri,  8 Dec 2023 06:59:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6130D10E9E9;
	Fri,  8 Dec 2023 06:59:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E13E10E9E9
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Dec 2023 06:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702018783; x=1733554783;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=bT1D/hFe8D/UNhxN/xXKDIsaCmRlxLKpoW5tz612z/s=;
 b=KUptkiYSnWV5rccNVUZMbQfRfFkE9SL9uNBwjwbes1zyKgGlX7t8KPBp
 ObIWLgvgnmSQUyGpXtk92rnxzublkgnb6J9vbxTX18i7uSB3gs4iW9sm3
 vWxGxExTHlAHHC/tpQBufyEgFhBlphRkQErwd2XydVa/MQ/bbV+wcChxo
 bwa/OA/zBlT5vqfFoAELkCPrkbYuj/6gkd0nn01xA8ldCNRpKIkaT7HWO
 rGMy9i/3esrMeKI1gsMNqIsltX10nGX+qIr4ruf+o125PbN1PGJcR5tnU
 s3pUng3TKBgaLf3gxqDTqqQKat/ACzZhL4rTXfxKTkGloVE2GsCmMTqG3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="460845647"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="460845647"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2023 22:59:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1019242079"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; d="scan'208";a="1019242079"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Dec 2023 22:59:41 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:59:40 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Dec 2023 22:59:40 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Dec 2023 22:59:40 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Dec 2023 22:59:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnAXTs17CK7Wa7XQXyoOgbRp7NCvstTF8zQbvumQ+6HlXo3SibK4cZvb9oG8HgQXo99wmTXt2vQUmm850d1oUSaaj5q3sZEEsQh8INy6Qpxy9bcdMjIvOOqaTNjLw+VJQ/rFB9zN9WDa8UPeP2Ff4bbqCd63ykpmntYiUEz2q2HVSreEJN6OGt4k6dkJRUqz1uaowaqbgO/bzf5+H/N6AtLZv5tbEIBDzjYVTPuZff7bsboteZHGAtHVPqWI7vIzslXi8BpB9cIgHE7wmyfNWRlineilOFhp2ASKWvpQ40nxf7cc0FPGZ6bdVKnRXSmS6b4OjvlnB4DLHjiAld25gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C3D/eDNd5fH/uyCmh+FH6pxiC/khIgSMaydx/TuRh28=;
 b=kbOrhZFgXDlHF6I+iQLe0G9ReuBfFIgz/MOD9lTlAAJG7zmbqDAT4KdZbYsV3EQZ64ekUrfHiiv2n2BpQn+Hfgk6+Ky/5tV4QKrig8BeQgu8ZQR8/8ZTWJbapqNzpfktmxqTwcot/tDkaMCI/oOJvzQd5xjSUvgcL+bIs3FQtBxfZ2JXoEIw1fxcHMel/dJ+fRqIqBrqt/lJRadfdD/5MFC+mpluY3xQLLnLaUE0tb+yHQnt2E8AEubSPPhS+i0bj5LEtBe/U4qAwLAPSiq7Y7m7lsjMgQVoG2tR/IANP1l+EZP1JC4JAmgM/ceRW6MV4/6G905k/cH5EZlk0PqSBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SA1PR11MB5899.namprd11.prod.outlook.com (2603:10b6:806:22a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.28; Fri, 8 Dec
 2023 06:59:38 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::ada2:f954:a3a5:6179%5]) with mapi id 15.20.7068.027; Fri, 8 Dec 2023
 06:59:38 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: [PATCH] drm/xe: Add frequency throttle reasons sysfs attributes
Date: Fri, 8 Dec 2023 01:59:33 -0500
Message-ID: <20231208065934.881570-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <4b0e993f-36f3-4bce-a65e-7043c90890e3@intel.com>
References: <4b0e993f-36f3-4bce-a65e-7043c90890e3@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SA1PR11MB5899:EE_
X-MS-Office365-Filtering-Correlation-Id: 1089906d-48d8-45c5-9be6-08dbf7bb3e01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 36IbWQwjXZ0nN2DVtJFjknZjoCLV/hKe501KP0rya9u5ibFBt/QDP349zFXk7Fe1YE6r6IG163/aqGBZcx8EeRWzgCNnYtR8mUo7k/n/u1rOl/tbIkUgvAwxqt+qft+FuLx6q3qws6Q6xQIBwTmXeTl6ui7XMiiKAaXQQR4CCw+r03z19Qs0J5SAHmnWXwLOoedhXvD96JzcPz+v6vNYKdBGt2zImzwCF/284M82Hrh86QBPHxArKKdSag8Rn5S99ANwc/EHPl6o3qUP09uT93qgayDdN4fDAGMJBi5Ec2yI4+KxI3HMQwcuRr7N+nVkkY/tRlg8lQ/F8JgDaJepYU1ex/DgEAxNYiHtnkhnNfO15QR3Ub9LKW3QMu8Au/XmmDLnF2BU+3Ov7Gupinkp827h/5VZTS7tzNohJDeLV1rdXsiceWFZ4Q9ts5O3Ebv8ibysGHOT5yuXRiu1t4hMbUPkCqmklCBGkQO+WdUr+hhKjUq4i4Qcz8pksPawWPkpL9g0av3UkXA7bsDKBq0AY1UkVqYcNzhqMRG3jPeG9LLLhdflzq0lCC0777WQPFgj1q62cuVBzqcrwY/J/U2HBazmMmcnkzXo8bQpzY9liMY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(366004)(136003)(376002)(346002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6666004)(8676002)(478600001)(26005)(44832011)(8936002)(6486002)(4326008)(38100700002)(1076003)(86362001)(36756003)(6512007)(107886003)(2616005)(5660300002)(41300700001)(6506007)(6916009)(316002)(66556008)(66476007)(66946007)(54906003)(83380400001)(2906002)(82960400001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wks1ZXVSS0R6UDU2MldqV1ppUnFqTXBvZ3RIcEJaTHVUU211SGQ1YlZINkc3?=
 =?utf-8?B?dFJTNEZiTVJFNUQxVE4yTTBLejVuQTRxUGNqekt6ZWJxTTRGTjJvTDRQK21J?=
 =?utf-8?B?WlRpdTlhZzAzSXl4YWY0aEFYcjF6OXN1N2RZUVJKUlV0djR2VThkcEh4bWhE?=
 =?utf-8?B?eEw2QW9mTmpHQVVrUmk5NjllWGxQaVZ3Q0locTRzNnhYTDBrRHM4Q2EwUTY1?=
 =?utf-8?B?WURRelVuS3ZmUFJnVEVnUmtqazgzL0NpRjhycWRnMkVRVEl2Wm0zOE1rR2JB?=
 =?utf-8?B?dWRKU2h1eS8wSDFrc0l0WkFoUmZXYko5NkYzVFFnZlUxWksrRU9pWkhJVFJC?=
 =?utf-8?B?c2ppeVliY2hXV2EzVHlQNWNZVUoya1dJa0NTUXZoZjU0MXUySDhaTEcwWStJ?=
 =?utf-8?B?MjllNEVPUGhUNnQ3WlRBQTF1ckxOa3NjeGwxUloxL2ltSmdDbVZwVEdCRklN?=
 =?utf-8?B?Q3RrTEdyLy9XcHVnUXNhOVJySTgwYUlMOHBzYVRNUncreVFOamRubFYybFZG?=
 =?utf-8?B?cHJWVFhPbkNlbTdubEJBcjBxaWZFcDJjVW9WSUZINklwdm9QNlU2Y3V0bkE5?=
 =?utf-8?B?K21WMXRwRUJCamd2Rlc5RHlMWHllVEtlRUZ1N2JBaDF3WmdMMGJhUmdaNklx?=
 =?utf-8?B?bVhRcm14WGk3RGVZZFptT28yR3ZqTm80N0xrL01rTWJ0YVBaN2paeG1QU0ov?=
 =?utf-8?B?amZrb2VJRmlaMUNCZUlBSFp0UExPbnJubW1PN1NyVkhraEQ5cTNxVHZCdkJI?=
 =?utf-8?B?Y01MRTg4azU1UmRDLzRYbUN6UnZYYURFdEsvb1FkeWF1Qkx6azljRk9LbVh4?=
 =?utf-8?B?SFZNVHpnaDlNT3VQVmlOdjZhR2V2RlZJd2poS1NlSHhLYUlTcmxZdEVFVld6?=
 =?utf-8?B?Z3RDRVJ2MTNwczZtdVVlRWh2RDhuRFdDOFNmQ0NkRVZoMW5HanF2NUp2TGlH?=
 =?utf-8?B?aEpncXdXVGZ3NVNJcjdzYXJWRFo3dWVkWVdVZEV1QUVxdWFEMWxlaU5uK1dZ?=
 =?utf-8?B?VGtlY055ZUN3ekNZdkhVcm8xeU9rS2pRMk9BQjZNV2k1S2VKemI3aE9pTlRM?=
 =?utf-8?B?WXJUSTA5bytLb2NlWThtVmFYRkdhNEVxcGpGa0JJZHkrd2gxcm9SMDIrS095?=
 =?utf-8?B?TjA3VWx5c3oybDNEMEhHZk5ieHdFUVRFZ2twZUpZWUV5dFFuL0g3SEkrZHBU?=
 =?utf-8?B?SXhVUDhNS1MyTWxYV0p1cTl4eDF4dkhMdVh5Q2cwMm9VRVVzRC9LWDVLS3Nj?=
 =?utf-8?B?R0RoRDR3dm9obktFYlcxRlA2YW9qTGlFZ0RsNHRFcXFnVXVlcHc1bUxUQkls?=
 =?utf-8?B?bk5EY3RXK05BQVFiS2xCWDI0dkxyZDdzQUFoTElRaHBWMkk1RDZNOHRkTDRI?=
 =?utf-8?B?bWxDaGp0dzI0QmhsbnQxZmNKNmlFOWpXWUFROVJlRU5naHdZRUJsWWlWeC9F?=
 =?utf-8?B?R2xUNE1Bak91bCsrTElsOUNybi9VZytGOXlNeHVKYkw3Q2tWVjlHbS9zOXl2?=
 =?utf-8?B?K0toUklwZ1B2L0tFY1I3NVhGNnNBRFZ5eTZRMEp2OWFkMDhKK1VieWJJeFJG?=
 =?utf-8?B?Yzd5WVRtRnRsMm1BMkdkT1Z4TzQzSjU5b1FMOXFiWkY1VTZiQS9XRjhHVmdq?=
 =?utf-8?B?WkxxTVhPV0xyaG1kNTZLNzdOZHQwTDRCRE52d3pkQ3ZVRVJjc01TTW1rbCtm?=
 =?utf-8?B?Wkc2VEJjM0MyR216MzZ6N0xCa2NPMmVlVzBuSHgzVFBEWG5HbjhyL2lUclNU?=
 =?utf-8?B?Wm1lbnp6MGF0OWEwREVxZ21DUUZUa0FkR0VUbG1tT0lmdjNuTmVPQmZUdk5z?=
 =?utf-8?B?V2lHSmI2ajMzMDkxVzBRN1lPNnhldzBka3cyb3hENTZYbEYzSmw4eXliMjho?=
 =?utf-8?B?Sm40ZFZzT1JydnFHelRNNit4SzJzTnB0VDBCbWxqR3JsVmxOYmN6cTA0WmFj?=
 =?utf-8?B?U1FSbWplY21iNUJ4Z1J0N3RXdjVyZjNEMzd4Y3hWWmExL055N3BMaFZZajhw?=
 =?utf-8?B?U3FLN2pRbGVQVXA1T2gzTVREKzN4MEFmY0R3OE1IWnpFcDdCVm5hdGN5RC9j?=
 =?utf-8?B?YndUTW41WkpnTnN5TnFUbWI3MXNvZ3dieTNhTlp2T2wyQjlPQ25lUW92eWUv?=
 =?utf-8?B?eDBMZVVEaEdtT0l4WldScUZsdVNzcjZjZVlwMGg0R3c3OUQ4d3lENUxoQWVC?=
 =?utf-8?B?Mmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1089906d-48d8-45c5-9be6-08dbf7bb3e01
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2023 06:59:37.6072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IU/m0OYXc5nWb2E5z3KA77ZQXxlAEqprZ5SAIUS2G4gPQndCvqTf6lvenVe7UqK11XXZOunBvHzq71HK5EFt+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5899
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
Cc: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

From: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>

Add throttle reasons sysfs attributes under a separate directory.

/device/tile<n>/gt<n>/freq0/throttle
			|- reason_pl1
			|- reason_pl2
			|- reason_pl4
			|- reason_prochot
			|- reason_ratl
			|- reason_vr_tdc
			|- reason_vr_thermalert
			|- status

v2: Remove unnecessary headers and clean-up action (Riana)

v3: - Add missing 'tile#/' to the doc (Riana)
    - Add missing documentation (Riana)
    - Remove extra line in header (Riana)
    - Remove extra header inclusion missed on v2 (Rodrigo).

Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/Makefile               |   1 +
 drivers/gpu/drm/xe/regs/xe_gt_regs.h      |  12 +
 drivers/gpu/drm/xe/xe_gt_freq.c           |   3 +
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c | 257 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h |  13 ++
 5 files changed, 286 insertions(+)
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
 create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h

diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 232627e0946e..d35548e437f0 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -78,6 +78,7 @@ xe-y += xe_bb.o \
 	xe_gt_mcr.o \
 	xe_gt_pagefault.o \
 	xe_gt_sysfs.o \
+	xe_gt_throttle_sysfs.o \
 	xe_gt_tlb_invalidation.o \
 	xe_gt_topology.o \
 	xe_guc.o \
diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
index 9744ed0be3a5..5f5a72e9d0d8 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -478,4 +478,16 @@
 #define PVC_GT0_PLATFORM_ENERGY_STATUS		XE_REG(0x28106c)
 #define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
 
+#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
+#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
+#define   PROCHOT_MASK				REG_BIT(0)
+#define   THERMAL_LIMIT_MASK			REG_BIT(1)
+#define   RATL_MASK				REG_BIT(5)
+#define   VR_THERMALERT_MASK			REG_BIT(6)
+#define   VR_TDC_MASK				REG_BIT(7)
+#define   POWER_LIMIT_4_MASK			REG_BIT(8)
+#define   POWER_LIMIT_1_MASK			REG_BIT(10)
+#define   POWER_LIMIT_2_MASK			REG_BIT(11)
+#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
+
 #endif
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 2c3830d0e9e5..08eabcafe7bc 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -13,6 +13,7 @@
 
 #include "xe_device_types.h"
 #include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
 #include "xe_guc_pc.h"
 
 /**
@@ -213,4 +214,6 @@ void xe_gt_freq_init(struct xe_gt *gt)
 	if (err)
 		drm_warn(&xe->drm,  "failed to add freq attrs to %s, err: %d\n",
 			 kobject_name(gt->freq), err);
+
+	xe_gt_throttle_sysfs_init(gt);
 }
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
new file mode 100644
index 000000000000..c2e420b83e35
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
@@ -0,0 +1,257 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#include <drm/drm_managed.h>
+
+#include <regs/xe_gt_regs.h>
+#include "xe_device.h"
+#include "xe_gt.h"
+#include "xe_gt_sysfs.h"
+#include "xe_gt_throttle_sysfs.h"
+#include "xe_mmio.h"
+
+/**
+ * DOC: Xe GT Throttle
+ *
+ * Provides sysfs entries for frequency throttle reasons in GT
+ *
+ * device/tile#/gt#/freq0/throttle/status - Overall status
+ * device/tile#/gt#/freq0/throttle/reason_pl1 - Frequency throttle due to PL1
+ * device/tile#/gt#/freq0/throttle/reason_pl2 - Frequency throttle due to PL2
+ * device/tile#/gt#/freq0/throttle/reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
+ * device/tile#/gt#/freq0/throttle/reason_thermal - Frequency throttle due to thermal
+ * device/tile#/gt#/freq0/throttle/reason_prochot - Frequency throttle due to prochot
+ * device/tile#/gt#/freq0/throttle/reason_ratl - Frequency throttle due to RATL
+ * device/tile#/gt#/freq0/throttle/reason_vr_thermalert - Frequency throttle due to VR THERMALERT
+ * device/tile#/gt#/freq0/throttle/reason_vr_tdc -  Frequency throttle due to VR TDC
+ */
+
+static struct xe_gt *
+dev_to_gt(struct device *dev)
+{
+	return kobj_to_gt(dev->kobj.parent);
+}
+
+static u32 read_perf_limit_reasons(struct xe_gt *gt)
+{
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
+	else
+		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
+
+	return reg;
+}
+
+static u32 read_status(struct xe_gt *gt)
+{
+	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
+
+	return status;
+}
+
+static u32 read_reason_pl1(struct xe_gt *gt)
+{
+	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
+
+	return pl1;
+}
+
+static u32 read_reason_pl2(struct xe_gt *gt)
+{
+	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
+
+	return pl2;
+}
+
+static u32 read_reason_pl4(struct xe_gt *gt)
+{
+	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
+
+	return pl4;
+}
+
+static u32 read_reason_thermal(struct xe_gt *gt)
+{
+	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
+
+	return thermal;
+}
+
+static u32 read_reason_prochot(struct xe_gt *gt)
+{
+	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
+
+	return prochot;
+}
+
+static u32 read_reason_ratl(struct xe_gt *gt)
+{
+	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
+
+	return ratl;
+}
+
+static u32 read_reason_vr_thermalert(struct xe_gt *gt)
+{
+	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
+
+	return thermalert;
+}
+
+static u32 read_reason_vr_tdc(struct xe_gt *gt)
+{
+	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
+
+	return tdc;
+}
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr,
+			   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool status = !!read_status(gt);
+
+	return sysfs_emit(buff, "%u\n", status);
+}
+static DEVICE_ATTR_RO(status);
+
+static ssize_t reason_pl1_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl1 = !!read_reason_pl1(gt);
+
+	return sysfs_emit(buff, "%u\n", pl1);
+}
+static DEVICE_ATTR_RO(reason_pl1);
+
+static ssize_t reason_pl2_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl2 = !!read_reason_pl2(gt);
+
+	return sysfs_emit(buff, "%u\n", pl2);
+}
+static DEVICE_ATTR_RO(reason_pl2);
+
+static ssize_t reason_pl4_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool pl4 = !!read_reason_pl4(gt);
+
+	return sysfs_emit(buff, "%u\n", pl4);
+}
+static DEVICE_ATTR_RO(reason_pl4);
+
+static ssize_t reason_thermal_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool thermal = !!read_reason_thermal(gt);
+
+	return sysfs_emit(buff, "%u\n", thermal);
+}
+static DEVICE_ATTR_RO(reason_thermal);
+
+static ssize_t reason_prochot_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool prochot = !!read_reason_prochot(gt);
+
+	return sysfs_emit(buff, "%u\n", prochot);
+}
+static DEVICE_ATTR_RO(reason_prochot);
+
+static ssize_t reason_ratl_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool ratl = !!read_reason_ratl(gt);
+
+	return sysfs_emit(buff, "%u\n", ratl);
+}
+static DEVICE_ATTR_RO(reason_ratl);
+
+static ssize_t reason_vr_thermalert_show(struct device *dev,
+					 struct device_attribute *attr,
+					 char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool thermalert = !!read_reason_vr_thermalert(gt);
+
+	return sysfs_emit(buff, "%u\n", thermalert);
+}
+static DEVICE_ATTR_RO(reason_vr_thermalert);
+
+static ssize_t reason_vr_tdc_show(struct device *dev,
+				  struct device_attribute *attr,
+				  char *buff)
+{
+	struct xe_gt *gt = dev_to_gt(dev);
+	bool tdc = !!read_reason_vr_tdc(gt);
+
+	return sysfs_emit(buff, "%u\n", tdc);
+}
+static DEVICE_ATTR_RO(reason_vr_tdc);
+
+static struct attribute *throttle_attrs[] = {
+	&dev_attr_status.attr,
+	&dev_attr_reason_pl1.attr,
+	&dev_attr_reason_pl2.attr,
+	&dev_attr_reason_pl4.attr,
+	&dev_attr_reason_thermal.attr,
+	&dev_attr_reason_prochot.attr,
+	&dev_attr_reason_ratl.attr,
+	&dev_attr_reason_vr_thermalert.attr,
+	&dev_attr_reason_vr_tdc.attr,
+	NULL
+};
+
+static const struct attribute_group throttle_group_attrs = {
+	.name = "throttle",
+	.attrs = throttle_attrs,
+};
+
+static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_gt *gt = arg;
+
+	sysfs_remove_group(gt->freq, &throttle_group_attrs);
+}
+
+/**
+ * xe_gt_throttle_sysfs_init - Initialize throttle reasons sysfs
+ * @gt: Xe GT object
+ *
+ * It needs to be initialized after or along with GT Freq.
+ */
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt)
+{
+	struct xe_device *xe = gt_to_xe(gt);
+	int err;
+
+	err = sysfs_create_group(gt->freq, &throttle_group_attrs);
+	if (err) {
+		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
+		return;
+	}
+
+	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, gt);
+	if (err)
+		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
+			 __func__, err);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
new file mode 100644
index 000000000000..9f545938f679
--- /dev/null
+++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright © 2023 Intel Corporation
+ */
+
+#ifndef _XE_GT_THROTTLE_SYSFS_H_
+#define _XE_GT_THROTTLE_SYSFS_H_
+
+struct xe_gt;
+
+void xe_gt_throttle_sysfs_init(struct xe_gt *gt);
+
+#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
-- 
2.43.0

