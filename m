Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29B3C531DE
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:07:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6405D10E401;
	Thu, 15 Aug 2024 22:07:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTr0VlOM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E56E810E401
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759665; x=1755295665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Fij2zguv6ZuXHVDpcjuqFZMVnQ5AZ12pXxacHabxtTA=;
 b=nTr0VlOMWY80n+sUHapnv523p/R5UkEJx1o8aYkDWp7/zze3DWnIiP6o
 nvq4f3RlVIWkvjMTqbzqwdi742G16Ng+5FBOoiOw8UQWmPJ9GZeQHK0oi
 S6jF7ln3uDDPcrMxPXGYidu1sNe59XImKZhF4EVvubdkCF4N1dMUoiwHK
 QLKDuuc6wk6wpWqGc0oCFPFmtfaV96YIFGVB5VKgmiMkuP5cDUnvrM5iJ
 +sLlcWKppaud+OZpA1mXBp3HEJczLfZZoRyVc2HnhG10CJkI39SnNDrMm
 tm/kfAChRxnPZUEmUHTd+kxIBpIcKYS21KXFsTBzQlQEDG8YA/u6ywFnU Q==;
X-CSE-ConnectionGUID: Z20p0pQ/RVyX+tbZNtI3ZQ==
X-CSE-MsgGUID: vrAXTc6+T3+lO83Vnnd6jQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="22213864"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="22213864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:07:44 -0700
X-CSE-ConnectionGUID: EQAic6SuSfC8I+D8HHq/cw==
X-CSE-MsgGUID: B6DKLB1qRHOhtdmWXF9rKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="59766455"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:07:44 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:43 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:07:43 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:07:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVhhLGPFoGVqM3c+dUG9n8GG2AIYDMQDiX+UbJF1kqZNfPpJxz39w8LskeENC4gwMExX13vYByEkAUP4Pk2eTzT+DlLaCGGh09cd1YRT1yfN6LpZrKxsgnKw2iyWZNua4vdJAw25m1QCFzHWOThR32sd2bnfrFTdIyQLAYDOvIGm14jXJgFqJLDbrrgB9s13wQPLgDAsSIjcyNdG5ZtUnHyRsGGBHdGGraypIQJLMUwJOdKUpsIiXB040iSmegr2GNNB3b+ifEi5bf8B919Ng4ARVvZQljmaw1cCx3N2BrGaJSCDYacCI65E0M0Zg2WWBx0UF08+V77qvw5C3wfKGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNS8PU8sBu2nEvuBKtH5uvVrs2cjIro+V3KD3u94Ldg=;
 b=cSzx1Hx+PrjqmczpCA/GhmBpayYXWnIxQHH2e40gCqj28YCVKoBkg8tr3ABT90xqDUz/iw1snN7nndHyuQV8u9l38HCUeMiwBMmq6PtLYjI/jVTdnuyk6dU61D+z7UZASqFQBQdDrHwR3JH48Chb184seAeLc2Q9Ae/j4hb7yy12iRebTOlW65mlop7g+MKuoMM29W7Zvg1+Ja9DwTyr+qhdNuHvjFDlZhzHl7GZGOzT0zQYNyDpcKWNnOjU9mukAYW7ggtP4JMCPJx2/5lrTVBjpdWfM1NFhSWPoQUEY3WbIXumgGjTM0ybBT6vKyiMjTn/uVo15FpSgQz1rIcGfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:41 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:41 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 02/12] drm/xe: Introduce GGTT documentation
Date: Thu, 15 Aug 2024 18:07:22 -0400
Message-ID: <20240815220732.49675-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR11CA0080.namprd11.prod.outlook.com
 (2603:10b6:a03:f4::21) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 33735d48-72e6-43d0-3c1c-08dcbd76aead
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zXI6u4dxyrY7/cO/I8D/YoJ9ocgyHSGLwfo2msdTuTBsW//fXQaDpKlCNNc1?=
 =?us-ascii?Q?tTJtmjsWogB5zUb2GtSyBls7Xt7+847y7PBDBGDQfq5eYagrJWW/IyUUjDCu?=
 =?us-ascii?Q?Gh7CQ4IbM4L5uUXvaM1xjZLMYDYosDgLzgzHa6Q2Lfni2Lys2+y+cPzeJFkQ?=
 =?us-ascii?Q?frLqTRx74/qTUzRDEBrpcyxzPRL4P6nxMotApyUBFY3CAkAseB+SzXGgwH5l?=
 =?us-ascii?Q?vhFbBlqbXVlGYaHxSk6jYZaoStD0vZIvwenfj3d1piGqgypAB1gGKib8QHak?=
 =?us-ascii?Q?5oJ4zwtbjm/8voBmjhhzsxvtCeEdh94It6NPDWUZ/klRjuO/9m4eXzlO4Zmh?=
 =?us-ascii?Q?f3Mt3xZYeGR7sth0qfhfahsxvbIeu9ZyGiDdyyPZgiXf0q9Qgq4nZuVFppkG?=
 =?us-ascii?Q?IelD71UOhszOQV+VwvKsOwoj19ZeGeLSPRdIRdmIEks95djYc3yDONtjilhj?=
 =?us-ascii?Q?n3aWIfBGv+HUclYwX4AVCf23dr/HmbRhjPivlA61Zvt11FGYpLgxALcLjHKs?=
 =?us-ascii?Q?AsOSaHFxyKnu4q2VnpNEY230RNkQsE9ubMnrUi4mfuAJeTyPrzqVUBTK81wK?=
 =?us-ascii?Q?rz7veOmyuUkfo6lOsYjWD8oCrcoQhWGwP32HfqUE8eY8QDCxSTCUvY67udoN?=
 =?us-ascii?Q?y7QnFE5Fw887gdg7nOtmDa7foahoRPgFVRRW98XotCxUv1+yYAFdsUTc9/C/?=
 =?us-ascii?Q?AunmsTaAmFZFsMYu9Obu4dYPhPGiDrgL5qOq9PT8XRMTx7Eeh3jwnZHagroZ?=
 =?us-ascii?Q?VXE832DYjAPlJDPg4fnqzkGwhg0qZ82ZkpE8TSMLS/g6kpBYW40htrsL9x11?=
 =?us-ascii?Q?zT6HeewbND/QnUFjnvKTjQuzhVHRqqu0N5Z6rMJH5zZumr6IpA5HPD5p/Vpw?=
 =?us-ascii?Q?134q9kywpVsScaRNPduO0RH3liArkOw6gcwAoS0WEYN+oBLU9LLN3DyezTWi?=
 =?us-ascii?Q?B4nwKVf0RuBG4OZ5dCoLCBNBWr/T6LeO38GHb9G+rQ+92v3AGYwn7YvCrR1C?=
 =?us-ascii?Q?+HpRhc4GydrhavGMiScZW+4AYRR1P0AS0J1av4XLUa7v/NmFZ8v20bW5uYtU?=
 =?us-ascii?Q?1Ac2rKqO/EAXntVfKE76M67m/X2FzSTWFLhWsqi4q8yxoLJHaL12EjNI3H2Q?=
 =?us-ascii?Q?BLDrfGwI1AtJnpbAKonunZBthAzJ1vVmN6fHKyVSgxOPkElk3C5y84Ml2kn6?=
 =?us-ascii?Q?NFoO4tIAcLdc9NaV2GEX542lCLR0VwRZVe9O4ROmH5SSQYUbckxZx+lH/y+Y?=
 =?us-ascii?Q?0k+uhM9sJnmzUeEZpXM0+pi1I9Tn9cl5eTEwap4lBXxGaYRi/Ljn3RNvSOn1?=
 =?us-ascii?Q?3lGsH37jJaYh1WkG6rJBqLuwJWa8mHHtekgJtEkSXhaZrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GmCOxemQdYE64yHR5oD3RwwlMC6ReM3Wnrk8EAjO1NTfvLeXNMLo8RKeXOf1?=
 =?us-ascii?Q?lCrwutgKG31z/9xbJX6xZ+cnDrf+hq3/ls3tkarnfY4e4+QS0NhnVlW8i9Yh?=
 =?us-ascii?Q?Di8RkwWALb+OAnZpqi/Ldp+aHknGki76ERa+iYq5Vrqs4cMiKzTyJQzJ2b/W?=
 =?us-ascii?Q?DxYlxMWrrq7XQ4xaT+W7C4FgK5nbhmY9cBSlT6NcdhbJbMyqpNtUhf3ppLdu?=
 =?us-ascii?Q?FywTFi2iQ/IzLDp3NFwLMu4GpZCWv22RrE7z7NrnJH5w1xb3zfWHx8lfRv92?=
 =?us-ascii?Q?+f6nwykLmt4b7JDQnczrlrdcYJvy7Nm1LFquhcxwhz9fz0Nz79ugVkdBsSuC?=
 =?us-ascii?Q?IHiMcCDW2iKzd4SX8nCndCcQAFirrcgwCTr6crYcto0ICX5yqTT/r1uv7kTa?=
 =?us-ascii?Q?WMHJ4AqprNYz8D7sqb88nNW1nVKof5sPa+mqiLPqecLj50jV1T2HllsZYh+W?=
 =?us-ascii?Q?C4mNMmGSgXmDSoD8aqwBev+7XpEwPK00NWl2+SsODXZVNVQkoYevJF2cuOHd?=
 =?us-ascii?Q?hIN+V0pECBH7JZkpcD75U5Sep0KKzyCx6gKZay+iuiNi7DYnjsH8SGg1hkMA?=
 =?us-ascii?Q?C7NfZ9VT3JB5mZvPXtVb6moP1Dy8afw49qJI1v+DTtmltgRcNSeZG91PsPL5?=
 =?us-ascii?Q?o7MGVf2sA68t4X3BXfXfeUADxNx2Fpl62T0mK/UUC4qQFpWMwBbpEIJk2Dnh?=
 =?us-ascii?Q?ZjixPNwUpaNUeMK4LIaoKDS5lsIdn61P0ftytL+lg13ruOjR7nqNzCeJw0RY?=
 =?us-ascii?Q?7tYjKiLYCte7mB/z7+pYbt515r6vEnXYT2UbAUWvRRTShohEBh17djFGm9u9?=
 =?us-ascii?Q?bTSFXCwm9Dlr5pmBrL0XTF80+ILZhMlLRI6jzrRhBT9BsamdSw93IHX8/H/O?=
 =?us-ascii?Q?ZuSi7/XLx6Jak07eFKFwi1DVza1jrwa/y6LutuL2s+uF4mXPjLDFkuE71TsY?=
 =?us-ascii?Q?sDVo8DSjfvSnkmHu7SNoln5hD3jJVHWuqpAm6sv1zmAWhtXowXSUul7gB7sB?=
 =?us-ascii?Q?8Ff55bCPwKXGNZQPD3oCAsl68aAd4DmNjlseIczbiS1v0yzSO5xJlRrD/yog?=
 =?us-ascii?Q?oPzjyCbgNxvArUCCwQ+Yz6t5YDJxH3CcAoQTfIpO3Uq9xL84hvjHGby7mP4L?=
 =?us-ascii?Q?deIVw7j5sOV4IZ3D/Nd4lYA8Bjt9cX83yRnRL49kIlQL1JpxdTnvmHo7KVYK?=
 =?us-ascii?Q?44/XryVtg7SlSjTz06XqLZhee0My1X/GR16naqKrZKN03n4ce7kEtVBedWDR?=
 =?us-ascii?Q?boE/rGol2QAue2Kvs9KwkMfKrZpc1naJpOsilZiIGRjjrzfeLQAwWZI7hOHd?=
 =?us-ascii?Q?rIXRD9PZ+YdRqoYlEiWlNH2qosQiaHFyL1rLTiVWj3WFkwP+bVwXJjtpH/xs?=
 =?us-ascii?Q?T8Br0PkRXFNQB5m6U5QsTHY0/snh7rpQA/chyr212e2wajRYwPyaDyvbsnAp?=
 =?us-ascii?Q?KCS2bv+LGjjHOgb3s8SRcbPoLV9iA4esMT5212+3oniQevxF4QCWGt+rgEfP?=
 =?us-ascii?Q?BGx/EdEpHkCMPMH+jGO/8+wBcbi/2XgmIYfHy8AKB4Oq5sJhhZmLWndRL6gs?=
 =?us-ascii?Q?AvQn+7wP7zqEvmm99K+K+t3LvN96fGcxleeiJbm76VsREolzSYbs1JAabNWc?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33735d48-72e6-43d0-3c1c-08dcbd76aead
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:41.6102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njI40xmVlv56GQl1ukJCXqVhDqB3fmcN945mkFTOqMrjD11Xe8bRJnxynCQFpjzbZedbDldFLgLk0cMuHMtnfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7133
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

Document xe_ggtt and ensure it is part of the built kernel docs.

v2: - Accepted all Michal's suggestions
    - Rebased on top of new set_pte per platform/wa function pointer
v3: - Typos and other acronym fixes (Michal)

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v1
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 Documentation/gpu/xe/xe_mm.rst     |  15 ++++
 drivers/gpu/drm/xe/xe_ggtt.c       | 136 +++++++++++++++++++++++------
 drivers/gpu/drm/xe/xe_ggtt_types.h |  34 ++++++--
 3 files changed, 150 insertions(+), 35 deletions(-)

diff --git a/Documentation/gpu/xe/xe_mm.rst b/Documentation/gpu/xe/xe_mm.rst
index 6c8fd8b4a466..95864a4502dd 100644
--- a/Documentation/gpu/xe/xe_mm.rst
+++ b/Documentation/gpu/xe/xe_mm.rst
@@ -7,6 +7,21 @@ Memory Management
 .. kernel-doc:: drivers/gpu/drm/xe/xe_bo_doc.h
    :doc: Buffer Objects (BO)
 
+GGTT
+====
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :doc: Global Graphics Translation Table (GGTT)
+
+GGTT Internal API
+-----------------
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt_types.h
+   :internal:
+
+.. kernel-doc:: drivers/gpu/drm/xe/xe_ggtt.c
+   :internal:
+
 Pagetable building
 ==================
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index add14f3dea1f..dd5cd0df705c 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -30,6 +30,39 @@
 #include "xe_wa.h"
 #include "xe_wopcm.h"
 
+/**
+ * DOC: Global Graphics Translation Table (GGTT)
+ *
+ * Xe GGTT implements the support for a Global Virtual Address space that is used
+ * for resources that are accessible to privileged (i.e. kernel-mode) processes,
+ * and not tied to a specific user-level process. For example, the Graphics
+ * micro-Controller (GuC) and Display Engine (if present) utilize this Global
+ * address space.
+ *
+ * The Global GTT (GGTT) translates from the Global virtual address to a physical
+ * address that can be accessed by HW. The GGTT is a flat, single-level table.
+ *
+ * Xe implements a simplified version of the GGTT specifically managing only a
+ * certain range of it that goes from the Write Once Protected Content Memory (WOPCM)
+ * Layout to a predefined GUC_GGTT_TOP. This approach avoids complications related to
+ * the GuC (Graphics Microcontroller) hardware limitations. The GuC address space
+ * is limited on both ends of the GGTT, because the GuC shim HW redirects
+ * accesses to those addresses to other HW areas instead of going through the
+ * GGTT. On the bottom end, the GuC can't access offsets below the WOPCM size,
+ * while on the top side the limit is fixed at GUC_GGTT_TOP. To keep things
+ * simple, instead of checking each object to see if they are accessed by GuC or
+ * not, we just exclude those areas from the allocator. Additionally, to simplify
+ * the driver load, we use the maximum WOPCM size in this logic instead of the
+ * programmed one, so we don't need to wait until the actual size to be
+ * programmed is determined (which requires FW fetch) before initializing the
+ * GGTT. These simplifications might waste space in the GGTT (about 20-25 MBs
+ * depending on the platform) but we can live with this. Another benefit of this
+ * is the GuC bootrom can't access anything below the WOPCM max size so anything
+ * the bootrom needs to access (e.g. a RSA key) needs to be placed in the GGTT
+ * above the WOPCM max size. Starting the GGTT allocations above the WOPCM max
+ * give us the correct placement for free.
+ */
+
 static u64 xelp_ggtt_pte_encode_bo(struct xe_bo *bo, u64 bo_offset,
 				   u16 pat_index)
 {
@@ -164,12 +197,16 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_set_pte = xe_ggtt_set_pte_and_flush,
 };
 
-/*
- * Early GGTT initialization, which allows to create new mappings usable by the
- * GuC.
- * Mappings are not usable by the HW engines, as it doesn't have scratch /
+/**
+ * xe_ggtt_init_early - Early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * It allows to create new mappings usable by the GuC.
+ * Mappings are not usable by the HW engines, as it doesn't have scratch nor
  * initial clear done to it yet. That will happen in the regular, non-early
- * GGTT init.
+ * GGTT initialization.
+ *
+ * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 {
@@ -194,29 +231,6 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (IS_DGFX(xe) && xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K)
 		ggtt->flags |= XE_GGTT_FLAGS_64K;
 
-	/*
-	 * 8B per entry, each points to a 4KB page.
-	 *
-	 * The GuC address space is limited on both ends of the GGTT, because
-	 * the GuC shim HW redirects accesses to those addresses to other HW
-	 * areas instead of going through the GGTT. On the bottom end, the GuC
-	 * can't access offsets below the WOPCM size, while on the top side the
-	 * limit is fixed at GUC_GGTT_TOP. To keep things simple, instead of
-	 * checking each object to see if they are accessed by GuC or not, we
-	 * just exclude those areas from the allocator. Additionally, to
-	 * simplify the driver load, we use the maximum WOPCM size in this logic
-	 * instead of the programmed one, so we don't need to wait until the
-	 * actual size to be programmed is determined (which requires FW fetch)
-	 * before initializing the GGTT. These simplifications might waste space
-	 * in the GGTT (about 20-25 MBs depending on the platform) but we can
-	 * live with this.
-	 *
-	 * Another benifit of this is the GuC bootrom can't access anything
-	 * below the WOPCM max size so anything the bootom needs to access (e.g.
-	 * a RSA key) needs to be placed in the GGTT above the WOPCM max size.
-	 * Starting the GGTT allocations above the WOPCM max give us the correct
-	 * placement for free.
-	 */
 	if (ggtt->size > GUC_GGTT_TOP)
 		ggtt->size = GUC_GGTT_TOP;
 
@@ -262,6 +276,12 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_init - Regular non-early GGTT initialization
+ * @ggtt: the &xe_ggtt to be initialized
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_init(struct xe_ggtt *ggtt)
 {
 	struct xe_device *xe = tile_to_xe(ggtt->tile);
@@ -382,6 +402,18 @@ void xe_ggtt_deballoon(struct xe_ggtt *ggtt, struct drm_mm_node *node)
 	mutex_unlock(&ggtt->lock);
 }
 
+/**
+ * xe_ggtt_insert_special_node_locked - Locked version to insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ * @mm_flags: flags to control the node behavior
+ *
+ * To be used in cases where ggtt->lock is already taken.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				       u32 size, u32 align, u32 mm_flags)
 {
@@ -389,6 +421,15 @@ int xe_ggtt_insert_special_node_locked(struct xe_ggtt *ggtt, struct drm_mm_node
 					  mm_flags);
 }
 
+/**
+ * xe_ggtt_insert_special_node - Insert a &drm_mm_node into the GGTT
+ * @ggtt: the &xe_ggtt where node will be inserted
+ * @node: the &drm_mm_node to be inserted
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 				u32 size, u32 align)
 {
@@ -402,6 +443,11 @@ int xe_ggtt_insert_special_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	return ret;
 }
 
+/**
+ * xe_ggtt_map_bo - Map the BO into GGTT
+ * @ggtt: the &xe_ggtt where node will be mapped
+ * @bo: the &xe_bo to be mapped
+ */
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
@@ -449,17 +495,39 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	return err;
 }
 
+/**
+ * xe_ggtt_insert_bo_at - Insert BO at a specific GGTT space
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ * @start: address where it will be inserted
+ * @end: end of the range where it will be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 			 u64 start, u64 end)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, start, end);
 }
 
+/**
+ * xe_ggtt_insert_bo - Insert BO into GGTT
+ * @ggtt: the &xe_ggtt where bo will be inserted
+ * @bo: the &xe_bo to be inserted
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	return __xe_ggtt_insert_bo_at(ggtt, bo, 0, U64_MAX);
 }
 
+/**
+ * xe_ggtt_remove_node - Remove a &drm_mm_node from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @node: the &drm_mm_node to be removed
+ * @invalidate: if node needs invalidation upon removal
+ */
 void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 			 bool invalidate)
 {
@@ -488,6 +556,11 @@ void xe_ggtt_remove_node(struct xe_ggtt *ggtt, struct drm_mm_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_remove_bo - Remove a BO from the GGTT
+ * @ggtt: the &xe_ggtt where node will be removed
+ * @bo: the &xe_bo to be removed
+ */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	if (XE_WARN_ON(!bo->ggtt_node.size))
@@ -544,6 +617,13 @@ void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct drm_mm_node *node, u16 vf
 }
 #endif
 
+/**
+ * xe_ggtt_dump - Dump GGTT for debug
+ * @ggtt: the &xe_ggtt to be dumped
+ * @p: the &drm_mm_printer helper handle to be used to dump the information
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index 2245d88d8f39..154de298a4e3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -13,30 +13,50 @@
 struct xe_bo;
 struct xe_gt;
 
+/**
+ * struct xe_ggtt - Main GGTT struct
+ *
+ * In general, each tile can contains its own Global Graphics Translation Table
+ * (GGTT) instance.
+ */
 struct xe_ggtt {
+	/** @tile: Back pointer to tile where this GGTT belongs */
 	struct xe_tile *tile;
-
+	/** @size: Total size of this GGTT */
 	u64 size;
 
 #define XE_GGTT_FLAGS_64K BIT(0)
+	/**
+	 * @flags: Flags for this GGTT
+	 * Acceptable flags:
+	 * - %XE_GGTT_FLAGS_64K - if PTE size is 64K. Otherwise, regular is 4K.
+	 */
 	unsigned int flags;
-
+	/** @scratch: Internal object allocation used as a scratch page */
 	struct xe_bo *scratch;
-
+	/** @lock: Mutex lock to protect GGTT data */
 	struct mutex lock;
-
+	/**
+	 *  @gsm: The iomem pointer to the actual location of the translation
+	 * table located in the GSM for easy PTE manipulation
+	 */
 	u64 __iomem *gsm;
-
+	/** @pt_ops: Page Table operations per platform */
 	const struct xe_ggtt_pt_ops *pt_ops;
-
+	/** @mm: The memory manager used to manage individual GGTT allocations */
 	struct drm_mm mm;
-
 	/** @access_count: counts GGTT writes */
 	unsigned int access_count;
 };
 
+/**
+ * struct xe_ggtt_pt_ops - GGTT Page table operations
+ * Which can vary from platform to platform.
+ */
 struct xe_ggtt_pt_ops {
+	/** @pte_encode_bo: Encode PTE address for a given BO */
 	u64 (*pte_encode_bo)(struct xe_bo *bo, u64 bo_offset, u16 pat_index);
+	/** @ggtt_set_pte: Directly write into GGTT's PTE */
 	void (*ggtt_set_pte)(struct xe_ggtt *ggtt, u64 addr, u64 pte);
 };
 
-- 
2.46.0

