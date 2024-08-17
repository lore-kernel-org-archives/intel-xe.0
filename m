Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A07C531DF
	for <intel-xe@archiver.kernel.org>; Sat, 17 Aug 2024 10:36:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD7110E06D;
	Sat, 17 Aug 2024 10:36:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FTjCXZj5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511E910E06D
 for <intel-xe@lists.freedesktop.org>; Sat, 17 Aug 2024 10:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723890986; x=1755426986;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=wnZyuazRxJkCEh8KfgN64Kb75r4+NAb8cqfR7j+T3GA=;
 b=FTjCXZj5qHUs4dva0/M3paNBYq5/L5edq6WsH3818VDkSGferMAOvcPc
 NDFqDe6ziqDwLh62Q/wZqXc2LdnVGVRiRfXoEtIhl9WLpMH/oi3EyR7mq
 gV8GrrHuzDe+cgNxpBnmFttUqhITAZFga9PxQFFXQJorRskZRkJhQvkME
 eybbwsteHeYOEJ03cc6E6clipbiKJaGBcmwDsdv8KtZ41awNsftCWKIM4
 daKB1B5wRatUFHa06lEB8Ew+dKu37Z/LkjpJjjR/CldBHdz7gh3jQ4DKa
 LT6Uja8S8H4JpoezpIH+sqr+hMUtV9349lITTnL/XfmTvqvBZY6rkguIj w==;
X-CSE-ConnectionGUID: K+GhCaaxTDW7w8R0DzFmuQ==
X-CSE-MsgGUID: IsuI+OdpRM++fEHcpoLFgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="21993421"
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="21993421"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2024 03:36:26 -0700
X-CSE-ConnectionGUID: 3aCq/RRHSduiXVq6kJEdxA==
X-CSE-MsgGUID: CC/PWOBHQMewbn1nr3BfpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,154,1719903600"; d="scan'208";a="59755251"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Aug 2024 03:36:26 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:25 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Sat, 17 Aug 2024 03:36:25 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Sat, 17 Aug 2024 03:36:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IZFBRNSRbbEip9ZEA6UoGfT1SM9gpRogXWIN1jUiy+t7l1mbW7x1FQaHs06eMjRSqB5uSDKk8ncfY/Zq5YE36/PLqylN9neIU+NFyBldJ30tzgJElMhYobbm5MgSYce8lC8kEXAYLo7wkquWJRYVkSrjFqj3lM9wy9bEfQtNVmIxeX2gJF4zKcQoZRFISPwYJ6v715BmynmVZwCmAqaaq6ZBjoZ5BT35ZN3WhYRpE8Dc4vM7fJk2z6DBC0FfN2pKg39ILh0mTQw93DN7WRfbcAPOyfB9WYW0nDrFvVqKIfRpQfOC/hkf6xSJBhbSCnPSq2Hj4g2JT9nQ2EtJqmCSBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5ULF16shusoqWGGyDp8d6A8mYaAq79/3FcsRinSbBuU=;
 b=b4KXe3bJZX5QFL/b8Y+dDek0gpuToEPbKLQY9EhQPD0MMQpfq0X771ptZiX9lkszpaLyoD0V85krN+Gh/3iykgWmvqX2uD3OxLMKZygYnuPPw66RZN17MjM2X+s9IXzx1Nbw9yUz/zjHvgQm+DrJqYjQ//8CzFSksP+tJO0GWwyZbqxOL04pprnzfSpvemMfLtZ/gRrmy2GC3Myp0wpZGu6dkHxA+LEuTHJUfOjwQz2JzIpDaSvTZQs59FE3bNiWKhX63YWKFLr9U9v9WNc7199rTacC0vRyMQPYPvFMwTSAfBYjGuG7sXhkC4fp3HLuZXhk3Uwg/2ISrkQDf00S3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SN7PR11MB6679.namprd11.prod.outlook.com (2603:10b6:806:269::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.18; Sat, 17 Aug
 2024 10:36:23 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Sat, 17 Aug 2024
 10:36:23 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 11/12] drm/xe: Make xe_ggtt_node struct independent
Date: Sat, 17 Aug 2024 06:35:54 -0400
Message-ID: <20240817103556.163783-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240817103556.163783-1-rodrigo.vivi@intel.com>
References: <20240817103556.163783-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:a03:254::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SN7PR11MB6679:EE_
X-MS-Office365-Filtering-Correlation-Id: 24758ff5-15cd-49eb-914a-08dcbea8709d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l8x1A071cPfXVOPhCULq1SZmw/cM1ipBdM/p3ByW3rxTwdUylswTp4p1UJOS?=
 =?us-ascii?Q?nIytfvvrVFwa7rN+NcvBgt9CvPaW9bR0HEAJCiE3HA6frSPT+lnhO6IigqtW?=
 =?us-ascii?Q?1ssTSEJFpKEHf0/v0N7Hghl4/HSsMuobISDOgVy4hnYW+7bIeFH5W/hV/P7y?=
 =?us-ascii?Q?50BBxV8w4BwOC0VgTs7ATME3wpbqtFH3hpgBkw4SBFkpgLUtGDeob0jA82ux?=
 =?us-ascii?Q?mvPvR8I5kSAk6gLXR37puoiFD/AqjAvRlTMyDtsN4IrWL6nNTQVbFxad3QtC?=
 =?us-ascii?Q?G2fgThlnHaiDldfDfPMZf6HJYo+RZKkLFABYIf+c5WSHAtuuvzQgiXXOuW4k?=
 =?us-ascii?Q?Cjja+x0yNW2W9E4IdzBnVxJzMj5WAvV1loBz7kOpeFeSY+8RxzhstRrOQ69r?=
 =?us-ascii?Q?J0FfwZ47HANnjezwgZvF8RmzCF0+a0wsT6HFTgJZ5nfdIBLsKMJgHXj10CRT?=
 =?us-ascii?Q?16eIBFN+WTp8YLoKxu5vS7XCYNPuBO4PydtRfQ51EwzaYl8R5AGUffo+q+BA?=
 =?us-ascii?Q?kf8NGBGK99mlSmNwv3hF0OGVRWr/x54ERbfjKjvBBrK+SkNk2dvRI/S1dd6+?=
 =?us-ascii?Q?WJBuzidXWCCO+JzKX0RXsvAw+I1nLJ1+mdN/ZhylD8dbMM6qLAoQpVjFgtYu?=
 =?us-ascii?Q?hygut+I2mvLA1hOMFa9PGfp6IMeMENJeOx5Zozg0VL0MZRL2E6lsKFtVBHr5?=
 =?us-ascii?Q?eP3KpfRrY83lag3XinfXpnXkrdLd/Mz3HY8ueN1k5LghwFx2l7tAPLBtpbtq?=
 =?us-ascii?Q?ZcA3T2GbbJuYzaKpA8n+8yqBaMzLoAyo8monUhCJ3OT0yMi5g641sWN7Q0Kc?=
 =?us-ascii?Q?GmFbfx/GIybHyqIE4bhIuBf14eWcMflD2HJzAb1j4HcVRylPD2OGfmB3HVGy?=
 =?us-ascii?Q?6Pgt6xCUY1xcsCQFYUZMIZQWK8s8Y1V0uXXqEEByKgbSXaa0DyFP8msfneBl?=
 =?us-ascii?Q?qw/QjUa/X746MYhNTukN5aXZ7u/m+YKo/o24/OdMyNQj+E1XD5RkD1BpLhVQ?=
 =?us-ascii?Q?Gl2dOLdXzjfjJsZgPKK4m+36vq6Y2HRyismliLMs9DuWLFmetZw+yWDLY/IY?=
 =?us-ascii?Q?rx3YdxmEiEyeChWyddhYT1ON0lQ1VLRgrm/HPNfiub8FV9QgWiqMpwYRjiHt?=
 =?us-ascii?Q?41WLxaIPu5iZp6y6FHSqks40rw6Box8+xyf4t6lR6nT6nxShQht+pDGrlkZm?=
 =?us-ascii?Q?jEht+/1ulDJFTJzDyCoplf9U3uLDrmb3JSQQTg3Nu+3v9Zw/jJnA1TSWYR+J?=
 =?us-ascii?Q?ZXMTR6zfN/GFfZxGqjVZ22q3Dzdg4sI4LDdYAZGBisMl5n+3sBJDosiFP6Cn?=
 =?us-ascii?Q?46fuJlNkI7Gx3xLjTfH7tPYcxy0+y0jtc2Vi0Gblk77Lsw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HxD+8NaCqqm/kcYkK/PjUBvyTZieIFtUo5F3WUF7hUCwPp966ryfT6Cyzvwc?=
 =?us-ascii?Q?6MMgCrN+0MfbZcxJ1cCxTMhnzh/0cwsJMKjHyls9gn+VYtX49KMiMu5iuK0K?=
 =?us-ascii?Q?qbxo+QUt0AhCuajc1QplTMrzy3OgbR5pzO4CFre2peUvJAHKQvWxTt0kMVP2?=
 =?us-ascii?Q?wWVUKeqzxuKmmDl03ikUIeW7W25pF9dyTKo4tKn+y8oJe9FH21HTuuDbKyax?=
 =?us-ascii?Q?pTs71WEq9mdKNxxQ76avjFowpNMa4rcj+LNPQHKcRYyEiEMxRhsISWCZN2rW?=
 =?us-ascii?Q?XfEs97z3/6TVJRRmRcMD+X5dKKLE5k0qt0pEn2Li2C2NiG5UxEOckd0Onl13?=
 =?us-ascii?Q?4W2hruuhxTSVZAM5xKckDLchClMRzkDLiPDWCUF1jW+psrqpvPAqxGyNmxZn?=
 =?us-ascii?Q?MBPavC4t15Fkq18rsD8gKo70yIF0Oze2HjN6GYNFrtELuEOieFTV41qKr50U?=
 =?us-ascii?Q?Ah9bUMbrezE4UROF1/hohhNBkg72QkuTT09VkL6QD3/hzONTEsNivIfxxBTt?=
 =?us-ascii?Q?fIIJtzsTxXHT06f9bMRSUt3tFPRA19WcpQpVwUVb54qLNSLIHcv4N83Z/bVb?=
 =?us-ascii?Q?a0qQWGGqTCE0lgSE1D+NzRsaNwnYx5y9qS5hGCHqNakqhQs+J9eeij/dCwe3?=
 =?us-ascii?Q?VwN8I0ifieEmxB7aTRfACmzRoBgij7DAUdWuvkWnis4I5RSo9CVmbhCi0J5W?=
 =?us-ascii?Q?H+lTIdiRa/1NHyb6q81pA0kXsj9Z1SeL28bt/0QHSgC1rUgVHyZ52hvGsiFZ?=
 =?us-ascii?Q?8hdFImfx9KTvOdwdgAIHOwiGTC/PE2ew4lSCjM0rGyrZB+5aPoHIsbaWOuYc?=
 =?us-ascii?Q?scQltmifzrxSP9ajgtk0Kh/bqW7gzH9lcUlr6g/UbWXtZwR5aEWyMMJ/HN7F?=
 =?us-ascii?Q?acuAL3j+fqo9ZHiOzjq5QKX1C0iXYb2afx+6gPe3RzqllQLVhxZbLOJlBgg2?=
 =?us-ascii?Q?jxadUHj3sI9Btpt41/GwdUS/Gs33QLO7H5j+gTCnaqSX4W6qA/Eiu1y9R7RG?=
 =?us-ascii?Q?A6OCvDqHaRGlMHSCDzXItKHhXm1wT4Jk5n9YEgcYM2GpVmoIddMVIhIFq+ZA?=
 =?us-ascii?Q?LQN6TocUqgnmQYLDyBwNb9jTpxN6VVvUkPCvY1edNncULcF7mLuDPOB/fp2x?=
 =?us-ascii?Q?bsOvpr0GAEvqNTfXB31tyIOLYmUi/hfeYbgRV8jLm7+T1zLTj5LPBKq1tbnc?=
 =?us-ascii?Q?8XKDI+E/9zHxHw/dGA92lxoaByiTlPmRJxL2WgRQ9HaOXlIXVD//eCLwT38m?=
 =?us-ascii?Q?yzBDXRH0e229D3IcC2aeHD2jhBHL78PUfKTHOXgGF3AexPKFPYvNh5/AEygZ?=
 =?us-ascii?Q?cN2bOqbXlHj9b48r1yAGufFsFMqiUyX7MfcMcZKg+TMB8JRNJmz50hjqkWvm?=
 =?us-ascii?Q?U57aHQyZAg23sGFrZ+wAQDJa44kBK9wp3Aftc8WiwBp4tD90EVseb4eX3ro5?=
 =?us-ascii?Q?0KOS7r+Wn9gTRX88bsmTdi2oFOyu6HOLRbwJtJxP/H4i/MRYmnLKGlD4gRsh?=
 =?us-ascii?Q?wJbJ97LaUF4l43mL2xZ5Mfjd/NJ15doM9md4pbfII1/5hONEh4b8vRzm3FwD?=
 =?us-ascii?Q?9IKEQk8A6tXOIFlY7IdM682t9LkpjsvRsto/fhhDz3hGQPP5mH7BPy8S9qmM?=
 =?us-ascii?Q?Lg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24758ff5-15cd-49eb-914a-08dcbea8709d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2024 10:36:23.6644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aCYLdcxdysa2dJBpB/uaa/Qa57tdX3Piogk18o87tOuwd21FMATVjB/z3qNz0b3wiL9DWqfW6f4NT9wqLAx3Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6679
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

In some rare cases, the drm_mm node cannot be removed synchronously
due to runtime PM conditions. In this situation, the node removal will
be delegated to a workqueue that will be able to wake up the device
before removing the node.

However, in this situation, the lifetime of the xe_ggtt_node cannot
be restricted to the lifetime of the parent object. So, this patch
introduces the infrastructure so the xe_ggtt_node struct can be
allocated in advance and freed when needed.

By having the ggtt backpointer, it also ensure that the init function
is always called before any attempt to insert or reserve the node
in the GGTT.

v2: s/xe_ggtt_node_force_fini/xe_ggtt_node_fini and use it
    internaly (Brost)
v3: - Use GF_NOFS for node allocation (CI)
    - Avoid ggtt argument, now that we have it inside the node (Lucas)
    - Fix some missed fini cases (CI)

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com> #2
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  36 +++--
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 145 ++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h                  |  14 +-
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  41 +++--
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  27 +++-
 12 files changed, 209 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 3028ac1ba72f..bdae8392e125 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
@@ -20,7 +20,7 @@ struct xe_bo;
 
 struct i915_vma {
 	struct xe_bo *bo, *dpt;
-	struct xe_ggtt_node node;
+	struct xe_ggtt_node *node;
 };
 
 #define i915_ggtt_clear_scanout(bo) do { } while (0)
@@ -29,7 +29,7 @@ struct i915_vma {
 
 static inline u32 i915_ggtt_offset(const struct i915_vma *vma)
 {
-	return vma->node.base.start;
+	return vma->node->base.start;
 }
 
 #endif
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index de4930b67a29..f7a9649745c2 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -204,20 +204,28 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
 			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_fini(vma->node);
+			goto out_unlock;
+		}
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -226,11 +234,19 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		vma->node = xe_ggtt_node_init(ggtt);
+		if (IS_ERR(vma->node)) {
+			ret = PTR_ERR(vma->node);
 			goto out_unlock;
+		}
+
+		ret = xe_ggtt_node_insert_locked(vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_fini(vma->node);
+			goto out_unlock;
+		}
 
-		ggtt_ofs = vma->node.base.start;
+		ggtt_ofs = vma->node->base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -323,9 +339,9 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
-		 vma->bo->ggtt_node.base.start != vma->node.base.start)
-		xe_ggtt_node_remove(ggtt, &vma->node, false);
+	else if (!xe_ggtt_node_allocated(vma->bo->ggtt_node) ||
+		 vma->bo->ggtt_node->base.start != vma->node->base.start)
+		xe_ggtt_node_remove(ggtt, vma->node, false);
 
 	ttm_bo_reserve(&vma->bo->ttm, false, false, NULL);
 	ttm_bo_unpin(&vma->bo->ttm);
diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index ae8a786f5d65..f89a382124ca 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1098,7 +1098,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.base.size)
+	if (bo->ggtt_node && bo->ggtt_node->base.size)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index faffbda55517..f588e3a98105 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -195,9 +195,12 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
 static inline u32
 xe_bo_ggtt_addr(struct xe_bo *bo)
 {
-	XE_WARN_ON(bo->ggtt_node.base.size > bo->size);
-	XE_WARN_ON(bo->ggtt_node.base.start + bo->ggtt_node.base.size > (1ull << 32));
-	return bo->ggtt_node.base.start;
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return -ENOENT;
+
+	XE_WARN_ON(bo->ggtt_node->base.size > bo->size);
+	XE_WARN_ON(bo->ggtt_node->base.start + bo->ggtt_node->base.size > (1ull << 32));
+	return bo->ggtt_node->base.start;
 }
 
 int xe_bo_vmap(struct xe_bo *bo);
diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
index 4b1de9f5be00..2ed558ac2264 100644
--- a/drivers/gpu/drm/xe/xe_bo_types.h
+++ b/drivers/gpu/drm/xe/xe_bo_types.h
@@ -40,7 +40,7 @@ struct xe_bo {
 	/** @placement: current placement for this BO */
 	struct ttm_placement placement;
 	/** @ggtt_node: GGTT node if this BO is mapped in the GGTT */
-	struct xe_ggtt_node ggtt_node;
+	struct xe_ggtt_node *ggtt_node;
 	/** @vmap: iosys map of this buffer */
 	struct iosys_map vmap;
 	/** @ttm_kmap: TTM bo kmap object for internal use only. Keep off. */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index d2b3d8a0c1bd..06fcb92568c7 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -204,7 +204,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node ggtt_balloon[2];
+			struct xe_ggtt_node *ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a359d94a979e..8ea223301ab9 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -348,20 +348,25 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
 
 /**
  * xe_ggtt_node_balloon - prevent allocation of specified GGTT addresses
- * @ggtt: the &xe_ggtt where we want to make reservation
-
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  * @start: the starting GGTT address of the reserved region
  * @end: then end GGTT address of the reserved region
  *
+ * It cannot be called without first having called xe_ggtt_init().
  * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 end)
+int xe_ggtt_node_balloon(struct xe_ggtt_node *node, u64 start, u64 end)
 {
+	struct xe_ggtt *ggtt;
 	int err;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	ggtt = node->ggtt;
+
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
@@ -386,64 +391,112 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 st
 
 /**
  * xe_ggtt_node_deballoon - release a reserved GGTT region
- * @ggtt: the &xe_ggtt where reserved node belongs
  * @node: the &xe_ggtt_node with reserved GGTT region
  *
  * See xe_ggtt_node_balloon() for details.
  */
-void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
+void xe_ggtt_node_deballoon(struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(&node->base))
+	if (!node || !node->ggtt)
 		return;
 
-	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
+	if (!drm_mm_node_allocated(&node->base))
+		goto free_node;
 
-	mutex_lock(&ggtt->lock);
+	xe_ggtt_dump_node(node->ggtt, &node->base, "deballoon");
+
+	mutex_lock(&node->ggtt->lock);
 	drm_mm_remove_node(&node->base);
-	mutex_unlock(&ggtt->lock);
+	mutex_unlock(&node->ggtt->lock);
+
+free_node:
+	xe_ggtt_node_fini(node);
 }
 
 /**
  * xe_ggtt_node_insert_locked - Locked version to insert a &xe_ggtt_node into the GGTT
- * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
  * To be used in cases where ggtt->lock is already taken.
  *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
 
 /**
  * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
- * @ggtt: the &xe_ggtt where node will be inserted
  * @node: the &xe_ggtt_node to be inserted
  * @size: size of the node
  * @align: alignment constrain of the node
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
-int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			u32 size, u32 align)
+int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
 {
 	int ret;
 
-	mutex_lock(&ggtt->lock);
-	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
-					 align, DRM_MM_INSERT_HIGH);
-	mutex_unlock(&ggtt->lock);
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
+	mutex_lock(&node->ggtt->lock);
+	ret = xe_ggtt_node_insert_locked(node, size, align,
+					 DRM_MM_INSERT_HIGH);
+	mutex_unlock(&node->ggtt->lock);
 
 	return ret;
 }
 
+/**
+ * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
+ * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
+ *
+ * This function will allocated the struct %xe_ggtt_node and return it's pointer.
+ * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
+ * or xe_ggtt_node_deballoon().
+ * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
+ * in GGTT. Only the xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * xe_ggtt_node_balloon() will ensure the node is inserted or reserved in GGTT.
+ *
+ * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
+ **/
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
+{
+	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
+
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->ggtt = ggtt;
+	return node;
+}
+
+/**
+ * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
+ * @node: the &xe_ggtt_node to be freed
+ *
+ * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * or xe_ggtt_node_balloon(); and this @node is not going to be reused, then,
+ * this function needs to be called to free the %xe_ggtt_node struct
+ **/
+void xe_ggtt_node_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 /**
  * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -457,6 +510,9 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	bool bound;
 	int idx;
 
+	if (!node || !node->ggtt)
+		return;
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 	if (bound)
 		xe_pm_runtime_get_noresume(xe);
@@ -469,23 +525,29 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	mutex_unlock(&ggtt->lock);
 
 	if (!bound)
-		return;
+		goto free_node;
 
 	if (invalidate)
 		xe_ggtt_invalidate(ggtt);
 
 	xe_pm_runtime_put(xe);
 	drm_dev_exit(idx);
+
+free_node:
+	xe_ggtt_node_fini(node);
 }
 
 /**
- * xe_ggtt_node_allocated - Check if node is allocated
+ * xe_ggtt_node_allocated - Check if node is allocated in GGTT
  * @node: the &xe_ggtt_node to be inspected
  *
  * Return: True if allocated, False otherwise.
  */
 bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
 {
+	if (!node || !node->ggtt)
+		return false;
+
 	return drm_mm_node_allocated(&node->base);
 }
 
@@ -498,9 +560,14 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
 	u16 cache_mode = bo->flags & XE_BO_FLAG_NEEDS_UC ? XE_CACHE_NONE : XE_CACHE_WB;
 	u16 pat_index = tile_to_xe(ggtt->tile)->pat.idx[cache_mode];
-	u64 start = bo->ggtt_node.base.start;
+	u64 start;
 	u64 offset, pte;
 
+	if (XE_WARN_ON(!bo->ggtt_node))
+		return;
+
+	start = bo->ggtt_node->base.start;
+
 	for (offset = 0; offset < bo->size; offset += XE_PAGE_SIZE) {
 		pte = ggtt->pt_ops->pte_encode_bo(bo, offset, pat_index);
 		ggtt->pt_ops->ggtt_set_pte(ggtt, start + offset, pte);
@@ -516,9 +583,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
+	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 		return 0;
 	}
 
@@ -527,15 +594,26 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 		return err;
 
 	xe_pm_runtime_get_noresume(tile_to_xe(ggtt->tile));
+
+	bo->ggtt_node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(bo->ggtt_node)) {
+		err = PTR_ERR(bo->ggtt_node);
+		goto out;
+	}
+
 	mutex_lock(&ggtt->lock);
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node.base, bo->size,
+	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node->base, bo->size,
 					  alignment, 0, start, end, 0);
-	if (!err)
+	if (err)
+		xe_ggtt_node_fini(bo->ggtt_node);
+	else
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
+
+out:
 	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -575,13 +653,13 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
  */
 void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
 {
-	if (XE_WARN_ON(!bo->ggtt_node.base.size))
+	if (XE_WARN_ON(!bo->ggtt_node))
 		return;
 
 	/* This BO is not currently in the GGTT */
-	xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+	xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 
-	xe_ggtt_node_remove(ggtt, &bo->ggtt_node,
+	xe_ggtt_node_remove(ggtt, bo->ggtt_node,
 			    bo->flags & XE_BO_FLAG_GGTT_INVALIDATE);
 }
 
@@ -648,7 +726,6 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
 
 /**
  * xe_ggtt_assign - assign a GGTT region to the VF
- * @ggtt: the &xe_ggtt where the node belongs
  * @node: the &xe_ggtt_node to update
  * @vfid: the VF identifier
  *
@@ -656,11 +733,11 @@ static void xe_ggtt_assign_locked(struct xe_ggtt *ggtt, const struct drm_mm_node
  * In addition to PTE's VFID bits 11:2 also PRESENT bit 0 is set as on some
  * platforms VFs can't modify that either.
  */
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid)
+void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid)
 {
-	mutex_lock(&ggtt->lock);
-	xe_ggtt_assign_locked(ggtt, &node->base, vfid);
-	mutex_unlock(&ggtt->lock);
+	mutex_lock(&node->ggtt->lock);
+	xe_ggtt_assign_locked(node->ggtt, &node->base, vfid);
+	mutex_unlock(&node->ggtt->lock);
 }
 #endif
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index d61f4f976a5a..96f79a3c8aa6 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,13 +13,13 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
-int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node, u64 start, u64 size);
-void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
+void xe_ggtt_node_fini(struct xe_ggtt_node *node);
+int xe_ggtt_node_balloon(struct xe_ggtt_node *node, u64 start, u64 size);
+void xe_ggtt_node_deballoon(struct xe_ggtt_node *node);
 
-int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
-			u32 size, u32 align);
-int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
-			       struct xe_ggtt_node *node,
+int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
+int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
@@ -35,7 +35,7 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
 u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
-void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
+void xe_ggtt_assign(const struct xe_ggtt_node *node, u16 vfid);
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index af312a7d1031..0e8822ae13fc 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -50,9 +50,15 @@ struct xe_ggtt {
 };
 
 /**
- * struct xe_ggtt_node - A node in GGTT
+ * struct xe_ggtt_node - A node in GGTT.
+ *
+ * This struct needs to be initialized (only-once) with xe_ggtt_node_init() before any node
+ * insertion, reservation, or 'ballooning'.
+ * It will, then, be finalized by either xe_ggtt_node_remove() or xe_ggtt_node_deballoon().
  */
 struct xe_ggtt_node {
+	/** @ggtt: Back pointer to xe_ggtt where this region will be inserted at */
+	struct xe_ggtt *ggtt;
 	/** @base: A drm_mm_node */
 	struct drm_mm_node base;
 };
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index e133594cc6bd..c0313d13c27b 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -232,14 +232,14 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
+	if (xe_ggtt_node_allocated(config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.start);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.start);
 
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_SIZE);
-		cfg[n++] = lower_32_bits(config->ggtt_region.base.size);
-		cfg[n++] = upper_32_bits(config->ggtt_region.base.size);
+		cfg[n++] = lower_32_bits(config->ggtt_region->base.size);
+		cfg[n++] = upper_32_bits(config->ggtt_region->base.size);
 	}
 
 	return n;
@@ -385,13 +385,13 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 
 static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
 {
-	pf_release_ggtt(gt_to_tile(gt), &config->ggtt_region);
+	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
 }
 
 static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 	struct xe_tile *tile = gt_to_tile(gt);
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 	u64 alignment = pf_get_ggtt_alignment(gt);
@@ -415,25 +415,32 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
-	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
+	err = xe_ggtt_node_insert(node, size, alignment);
 	if (unlikely(err))
-		return err;
+		goto err;
 
-	xe_ggtt_assign(ggtt, node, vfid);
+	xe_ggtt_assign(node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
 				vfid, node->base.start, node->base.start + node->base.size - 1);
 
 	err = pf_distribute_config_ggtt(gt->tile, vfid, node->base.start, node->base.size);
 	if (unlikely(err))
-		return err;
+		goto err;
 
 	return 0;
+err:
+	xe_ggtt_node_fini(node);
+	return err;
 }
 
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
@@ -2006,13 +2013,15 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!xe_ggtt_node_allocated(&config->ggtt_region))
+		if (!xe_ggtt_node_allocated(config->ggtt_region))
 			continue;
 
-		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		string_get_size(config->ggtt_region->base.size, 1, STRING_UNITS_2,
+				buf, sizeof(buf));
 		drm_printf(p, "VF%u:\t%#0llx-%#llx\t(%s)\n",
-			   n, config->ggtt_region.base.start,
-			   config->ggtt_region.base.start + config->ggtt_region.base.size - 1, buf);
+			   n, config->ggtt_region->base.start,
+			   config->ggtt_region->base.start + config->ggtt_region->base.size - 1,
+			   buf);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
index a73d9a4b9e64..2d3b73d78f14 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -18,7 +18,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct xe_ggtt_node ggtt_region;
+	struct xe_ggtt_node *ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index db9761a68ce0..6ea5fa016a82 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
@@ -495,6 +495,22 @@ u64 xe_gt_sriov_vf_lmem(struct xe_gt *gt)
 	return gt->sriov.vf.self_config.lmem_size;
 }
 
+static int vf_balloon_ggtt_node(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
+				u64 start, u64 end)
+{
+	int err;
+
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
+	err = xe_ggtt_node_balloon(node, start, end);
+	if (err)
+		xe_ggtt_node_fini(node);
+
+	return err;
+}
+
 static int vf_balloon_ggtt(struct xe_gt *gt)
 {
 	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
@@ -528,7 +544,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = xe_wopcm_size(xe);
 	end = config->ggtt_base;
 	if (end != start) {
-		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[0], start, end);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +552,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_balloon(ggtt, &tile->sriov.vf.ggtt_balloon[1], start, end);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +560,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -552,11 +568,10 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 static void deballoon_ggtt(struct drm_device *drm, void *arg)
 {
 	struct xe_tile *tile = arg;
-	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.46.0

