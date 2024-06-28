Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06DE1C3065A
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 19:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE79210ED1D;
	Fri, 28 Jun 2024 19:28:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gIUohw14";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA010ED35
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 19:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719602918; x=1751138918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=NkYsQpuTnDcLRJWWqe+BNjS7Z0qXBcgPs7Vqjfbz3gs=;
 b=gIUohw14159u+AISHzg1wBC1k/n9Htz6GU6nkO54UDSNizLHoQBcEE88
 VrFfqzMT/BOi3BO2CaaHATiJRV2QgQzFHJeumiIbWyqFATrpnkp5jHX7n
 LP0tMvbZo29nB1mdI+l0mHunMiAaqXJPznrf+Ybjj4NJ4IfZ7jSLkAALJ
 M8hLbA7MPsO1P+B+0SOxRzQzQDlhk4Kkh4Fi+GAHwMMkgrZGdv8+FCMmu
 B5mxkX9/x13p+Qf06v1Cmjnz6HtqM84V15gpJfflKsP23Dy/DQygHVcdk
 l3P//cYhNErrm4ZKCPiDtWvkzhMWMOwmnNOEl+xdU46X1Fw8fvqJB2zmy A==;
X-CSE-ConnectionGUID: XEoBC3aBS0i/Mo4iYpo2Ew==
X-CSE-MsgGUID: fNZJCHtuTgKSkjAqEdr+uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="27931015"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="27931015"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 12:28:38 -0700
X-CSE-ConnectionGUID: yRqg3PFxR4SLZhpoWhSEXA==
X-CSE-MsgGUID: SJc6/2WPQ0GJ8JVWCofEWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="45253819"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 12:28:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:37 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 12:28:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 12:28:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XegB0jpA575IOffarzYdnWrV6AXvs+T1/2SiOQNc7oJYUH3ZldE0Tq//KdQkGeWI2PAFPg3eCvdCKSBgWPih3kFW+J2VgyiqEBPHWJncjNQ3d+TBHQGw5htlsifNo4hucAapapyeCoexZr0ldl3bTL2i5D7/CJlDOt9gTHz5YsrV9ZFBVBhoAT7vn6mJxNPH57l+rZq8gXbBwi8QKLcMDrnM/emD/5YEzok2ZJEpxXfgilDaJ+6zP8Tyd6GrDrASo4dPoaaJZXWcLxnoeBKfO+DLyQg+q5CmvNPcj2RKqYnM6plhkrxODjcTCXU9vmg6R4IDifvtAIkOjWbMMTb38Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NOuSI97nT7atjokEfeCuQ9J7s1ImFNnyxPMVhKPbGWg=;
 b=eT/Nh9EZard3gesMiNwM+u4cB81KAcCGEDCxRx2nvivedHrLeEjPl5DrY8nIEuH0TnG1BslMFXV/IQCG7DLlqHkVxJD+JCMrjkOydxGpIBpP5X0p+NAAqIeYLO69f6QLMT7nH91SHaJMppuqjel8uDUp1mIk3Zepa4rOHW1B7QkQI9gD1NDQvS5KYxa7i/mBDeWBLRjizk4T59aGxsGnM5+NBDgFVuGHEhNAG1nO+4SfPEjQScvcKRyfRKZkAmQcMWeRHDa7adb5bBnzTXGFEiRBCre1J6Os2e/hIzODOXmH8ZcUFkajac8AZGPAnGOy77syXJE+H5RDx7TML10YAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7483.namprd11.prod.outlook.com (2603:10b6:8:147::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 19:28:34 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7698.033; Fri, 28 Jun 2024
 19:28:34 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld
 <matthew.auld@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [RFC 11/12] drm/xe: Make xe_ggtt_node struct independent
Date: Fri, 28 Jun 2024 15:27:52 -0400
Message-ID: <20240628192753.386137-12-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240628192753.386137-1-rodrigo.vivi@intel.com>
References: <20240628192753.386137-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR10CA0020.namprd10.prod.outlook.com
 (2603:10b6:a03:255::25) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 448f8e2d-cf8f-4a77-587f-08dc97a88054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?p4+Q+gDLPTemc8rKWfN/nv1LdQz3Cb0VyYb8yEk8HDY8bM3mg5F/fZp2Cq8H?=
 =?us-ascii?Q?0hQ6YmSvC4Jx7gfJXEdiIWh1+KIQC6ZkiCMsD6rYOi1RtMLuumyBkdtpZPP4?=
 =?us-ascii?Q?k11BY9brTfxx8/spRhj6vWS5v4Gl2dErFz5ugtmDiizVNOG5XD97T0YyZPiV?=
 =?us-ascii?Q?ZwjF8bZdGbUZta9iQqkK/Bim8ideooEI608NV6SxC8oGmi34l8dKjnSJbIvd?=
 =?us-ascii?Q?52Tru5LSSeDLIYHHICphK72XfdTV8kPa1IOXBhZ1dY4GmFW5QN6bB/qBh7qr?=
 =?us-ascii?Q?ELFhAhrhxSagAh9x0iQ8YxE2vCY2hYkiHRjOjkQ9KBJzOrhapFeyDfdRgzkc?=
 =?us-ascii?Q?QMCdZUeXMPw0FHFHXJRid10JC0SAhUTlX1V9G7RXC/cPg9QoVdnxdHvCAbp3?=
 =?us-ascii?Q?oGBaWDH2ahYosXhguvToD1js39SDuo9KoGFrPaXmH1PPLahl3103UHQAhSME?=
 =?us-ascii?Q?qS3RyxviCoEYedS1pBJ3w6OVib4Zj6kF7uNjM6Dgr2cKSyvvEoABhdkVuiEr?=
 =?us-ascii?Q?r0HyYifQ05XBqoUYw4QwZ/vCLXyq4HegiPqYV9NHuGyOvikt+S2Dc3dm9UCI?=
 =?us-ascii?Q?f705kHFkYK5f3xI7dDmB2G4t11ErhgkaZwqL1QNBOLucsprrvo5co8eqxwjs?=
 =?us-ascii?Q?Qz0mnHkVvhIDtDlMv6/3rLulr4KNulgVMAjMmx+/Glp+bt+cfPPS2vHhy8mI?=
 =?us-ascii?Q?JlNys6xlWxDBJRYozsHfVz3TLPbbPOb3ENuQa4be34wzT2rxb18N8/zW4O60?=
 =?us-ascii?Q?Pp5KuuHAYrIXld0Ch+PNqLRjtIl2XkDBvXLNilKyV777eFnE+OiyGeoapeon?=
 =?us-ascii?Q?WyjM1lfzMqf2QpLatugXCwdb1mhzaQDSsfY1y/9xYFDnEGi3cJWerTDR3DX8?=
 =?us-ascii?Q?pazgJPUrfaIoRvo4EgnJ7/5+lCFNQ+QDSSvGyI3wsCsUHOwsXpwyoNl//sBv?=
 =?us-ascii?Q?yMsd+CYkOHrLy20LXfjg2G2pJW87XPysGQsMgOcLHAtHwp4fKDu8xZzaTyLP?=
 =?us-ascii?Q?2MnDgaGrMy0wMxjiRI5V3de60YYaxewKK3w4uMLTZHJAfCgNITFd5GRN9jMC?=
 =?us-ascii?Q?5iYoEixt16Md7yIN+RCqrQCoxRXvGGxhR7uhp5WcuOTU+rVX2HrR3QKFuFvu?=
 =?us-ascii?Q?7mucWdwVSmjRQvkmyIMcqFE0OSTT34FfMeuInGO0bhcnkTUb4n3+y7olNmQf?=
 =?us-ascii?Q?JowyFXGTKUATAidcxW/t8f2+oUg3sxV94ZTv9bzhJTJUYv0gtd1iB6QeJl0r?=
 =?us-ascii?Q?Oo57Y53uPyetNuvnbuZbFOmMID9a9TlYUX56GIctuNnowfeTyRuiigljl64R?=
 =?us-ascii?Q?uXmMdgGM5WYdBE+76aWMQz97Ft82ksPVX5vM5B+yrlfVLA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vb0yF1M0671LaH0CPvE+PuTDRnTdpNlDOV/9qjTWCGC1UNruCBesjYJOCD71?=
 =?us-ascii?Q?nqfWuK9aJnj7blBMBC1JN2M0OqsgyEx1nRbyD5XcVQdy6z7AjPjuQ3mMhnB1?=
 =?us-ascii?Q?WIbAuo1TytZ63XDCY5rt3KXkXfsXDp8MdMp4THPC7WQdO1uOfHnloLLuPsNX?=
 =?us-ascii?Q?JA5Kyd1FvIyq4c40UTfWkDz/G0CE93oPHGHKrfgjGEnWZznT/vAQCFbgQ/XL?=
 =?us-ascii?Q?yOXVcNSGzWT/h3JMV5l7Lw0MJR/25cJFAabn+q8Qn7fynYOuhwL4C+TvGyOy?=
 =?us-ascii?Q?PBXv8KaaOAdO3MaI+R4XiVtHak3Dy1Z0pFHu3iPLGGo0iRo3QGK3zj3aDz1/?=
 =?us-ascii?Q?0Kny0sEZJ1MRyy2dGzm1w3tQ7mZzZKA3AsjIECOqQ7YIW0pb51y5IZDUqwk+?=
 =?us-ascii?Q?UGuYpGhkDvFNTgBKHDMbSy77+OVVGT9TzHDGOOelkxPx44sFZE1x9gwxk3/a?=
 =?us-ascii?Q?4xxWJ8Kfoeu5gTScH5saldss5RTgat5otaG7JjGJuCfNS4Cy93EETN5alPyd?=
 =?us-ascii?Q?VJkmIbp5VKqk2JtRZnosRg7TICeV7mcVwAQic26mZRrELLGFsV/NLWvOKB3D?=
 =?us-ascii?Q?oRxXKm/gCfr3C9X5P68oCbV1Goe8Vaim2R3YSOfiTVOrqpKG4k9CBRX+Z/3O?=
 =?us-ascii?Q?QQvM+VCBAh7WV+ami8zAVapZKol/GkewqmuuQRCmAoEKr2nhejTPSrlVdNq2?=
 =?us-ascii?Q?xUpFMUI6VhUD/DObRJrtPpsGxQAoKomEGaPMC12inC3jcjjr2jLxX67KjK5g?=
 =?us-ascii?Q?0Es494tjF9+AJvw+UtiA7GQJvKnGyxmNHgt4nONipNkTCvm971CxX+sFhQMo?=
 =?us-ascii?Q?FlvVdPYlU9nHHvoJ9i+WG7/YqAC+JHhP0+TzpqOgPCMp/uYcGwq6HQSKc1cZ?=
 =?us-ascii?Q?7BfydhrAfACS7qHv7ChgUvVxImUVNolPLUwNMCq3NoaYEJw84BxgMDn8Vocp?=
 =?us-ascii?Q?QnLO6x2kiwKxI3bx7Q6ycayz7P5i1S15LRkS5RetOuvrw/qScksc+iYpZhwv?=
 =?us-ascii?Q?C3CZKoEqUoqDM8oE5eIOAQjq3gS687RvK5tpy4IOwd/iceeOzAO7hqO0+Qed?=
 =?us-ascii?Q?2tlBVKlRa0LDMFEZ8acgG5KkqszB0cLghsxBw00/EK+mfOvvAkGzq2NlVvPy?=
 =?us-ascii?Q?UceoscSlr3B0UiUD1jZT2uqUqEVNKcJZtWwbK5ea1zWf9WvxDoJ1rsm299BT?=
 =?us-ascii?Q?qmFEo85tSScCg+3PR/aVqx0Mj/3XfULYTBukU69t3uEXb4hiQXLAn9RWNn+H?=
 =?us-ascii?Q?979VVyiPWybDj4vZg+qFFtALAXd1tRzAe6lAh7rZd7Zc5UpgteCtNbH4l1zM?=
 =?us-ascii?Q?8kPwq2DZjXcY7IskWoZI0k/VYwU3CP7hHXA0IB3yQiLYlwYDj+OPU1PrQg73?=
 =?us-ascii?Q?ESP1cc384PC4HwfAtrRtOZlYssejCUtvQJyqTfcIvp1M6gTWkh3N+ohL5ZyM?=
 =?us-ascii?Q?0uTX3vrgcG4d++yRzVHYr5bFxiuQK4TxKK6eVEbNA3b7tLroTOqofBZta7N6?=
 =?us-ascii?Q?lnAoHuSkHP9fK83iZhj6XSfn+zC98Pz8CC/ab20uY0NXLmdX0CcqgXXvzDLP?=
 =?us-ascii?Q?gEpknxti3T7z1fkDfociTqgZxdWaH343ilvmzAmwMPuyvQ4CLanOjgMUvMc6?=
 =?us-ascii?Q?9w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 448f8e2d-cf8f-4a77-587f-08dc97a88054
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 19:28:34.5333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kJgDCIdUhmv1dd9ycMskIiHR+L/2Q5aEzh/I4bWgPvcy5P9TIvS72J6rkuxFcXWQjRtc0DDd2wV8p3c/DvTpXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7483
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  24 ++--
 drivers/gpu/drm/xe/xe_bo.c                    |   2 +-
 drivers/gpu/drm/xe/xe_bo.h                    |   9 +-
 drivers/gpu/drm/xe/xe_bo_types.h              |   2 +-
 drivers/gpu/drm/xe/xe_device_types.h          |   2 +-
 drivers/gpu/drm/xe/xe_ggtt.c                  | 103 ++++++++++++++++--
 drivers/gpu/drm/xe/xe_ggtt.h                  |   2 +
 drivers/gpu/drm/xe/xe_ggtt_types.h            |   8 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  34 +++---
 .../gpu/drm/xe/xe_gt_sriov_pf_config_types.h  |   2 +-
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c           |  26 ++++-
 12 files changed, 169 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_vma.h
index 97193e660f6c..ac860414b91f 100644
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
index b1532fcfdfb6..7a2d7066e82d 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -203,20 +203,22 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		align = max_t(u32, align, SZ_64K);
 
-	if (bo->ggtt_node.base.size && view->type == I915_GTT_VIEW_NORMAL) {
+	if (bo->ggtt_node && view->type == I915_GTT_VIEW_NORMAL) {
 		vma->node = bo->ggtt_node;
 	} else if (view->type == I915_GTT_VIEW_NORMAL) {
 		u32 x, size = bo->ttm.base.size;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_force_fini(vma->node);
 			goto out_unlock;
+		}
 
 		for (x = 0; x < size; x += XE_PAGE_SIZE) {
 			u64 pte = ggtt->pt_ops->pte_encode_bo(bo, x,
 							      xe->pat.idx[XE_CACHE_NONE]);
 
-			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node.base.start + x, pte);
+			ggtt->pt_ops->ggtt_set_pte(ggtt, vma->node->base.start + x, pte);
 		}
 	} else {
 		u32 i, ggtt_ofs;
@@ -225,11 +227,13 @@ static int __xe_pin_fb_vma_ggtt(const struct intel_framebuffer *fb,
 		/* display seems to use tiles instead of bytes here, so convert it back.. */
 		u32 size = intel_rotation_info_size(rot_info) * XE_PAGE_SIZE;
 
-		ret = xe_ggtt_node_insert_locked(ggtt, &vma->node, size, align, 0);
-		if (ret)
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
+		if (ret) {
+			xe_ggtt_node_force_fini(vma->node);
 			goto out_unlock;
+		}
 
-		ggtt_ofs = vma->node.base.start;
+		ggtt_ofs = vma->node->base.start;
 
 		for (i = 0; i < ARRAY_SIZE(rot_info->plane); i++)
 			write_ggtt_rotated(bo, ggtt, &ggtt_ofs,
@@ -320,9 +324,9 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
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
index 88da797dd16e..ece0640bc431 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1081,7 +1081,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.base.size)
+	if (bo->ggtt_node)
 		xe_ggtt_remove_bo(bo->tile->mem.ggtt, bo);
 
 #ifdef CONFIG_PROC_FS
diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
index 7c95133cc32b..c8a90e5bbd6b 100644
--- a/drivers/gpu/drm/xe/xe_bo.h
+++ b/drivers/gpu/drm/xe/xe_bo.h
@@ -194,9 +194,12 @@ xe_bo_main_addr(struct xe_bo *bo, size_t page_size)
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
index 9bbc66af3ef3..d983f04501af 100644
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
index 63e39e83344a..2e2c29eb7b9a 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -199,7 +199,7 @@ struct xe_tile {
 			struct xe_memirq memirq;
 
 			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
-			struct xe_ggtt_node ggtt_balloon[2];
+			struct xe_ggtt_node *ggtt_balloon[2];
 		} vf;
 	} sriov;
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index a4202bcc4ccb..2355fcd16349 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -348,6 +348,7 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
+ * It cannot be called without first having called xe_ggtt_init().
  * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -356,6 +357,9 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
 {
 	int err;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
@@ -387,14 +391,20 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
  */
 void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 {
-	if (!drm_mm_node_allocated(&node->base))
+	if (!node || !node->ggtt)
 		return;
 
+	if (!drm_mm_node_allocated(&node->base))
+		goto free_node;
+
 	xe_ggtt_dump_node(ggtt, &node->base, "deballoon");
 
 	mutex_lock(&ggtt->lock);
 	drm_mm_remove_node(&node->base);
 	mutex_unlock(&ggtt->lock);
+
+free_node:
+	kfree(node);
 }
 
 /**
@@ -405,6 +415,7 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
  * To be used in cases where ggtt->lock is already taken.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -412,6 +423,9 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
@@ -423,6 +437,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
  * @size: size of the node
  * @align: alignment constrain of the node
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
@@ -430,6 +446,9 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 {
 	int ret;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	mutex_lock(&ggtt->lock);
 	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
 					 align, DRM_MM_INSERT_HIGH);
@@ -438,6 +457,43 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
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
+	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_KERNEL);
+
+	if (!node)
+		return ERR_PTR(-ENOMEM);
+
+	node->ggtt = ggtt;
+	return node;
+}
+
+/**
+ * xe_ggtt_node_force_fini - Forcebly finalize %xe_ggtt_node struct
+ * @node: the &xe_ggtt_node to be freed
+ *
+ * If anything went wrong with either xe_ggtt_node_insert(), xe_ggtt_node_insert_locked(),
+ * or xe_ggtt_node_balloon(); and this @node is not going to be reused, then,
+ * this function needs to be called to free the %xe_ggtt_node struct
+ **/
+void xe_ggtt_node_force_fini(struct xe_ggtt_node *node)
+{
+	kfree(node);
+}
+
 /**
  * xe_ggtt_node_remove - Remove a &xe_ggtt_node from the GGTT
  * @ggtt: the &xe_ggtt where node will be removed
@@ -451,6 +507,9 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	bool bound;
 	int idx;
 
+	if (!node || !node->ggtt)
+		return;
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 	if (bound)
 		xe_pm_runtime_get_noresume(xe);
@@ -463,23 +522,29 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
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
+	kfree(node);
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
 
@@ -492,9 +557,14 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
@@ -510,9 +580,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
+	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 		return 0;
 	}
 
@@ -521,15 +591,26 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
+		xe_ggtt_node_force_fini(bo->ggtt_node);
+	else
 		xe_ggtt_map_bo(ggtt, bo);
 	mutex_unlock(&ggtt->lock);
 
 	if (!err && bo->flags & XE_BO_FLAG_GGTT_INVALIDATE)
 		xe_ggtt_invalidate(ggtt);
+
+out:
 	xe_pm_runtime_put(tile_to_xe(ggtt->tile));
 
 	return err;
@@ -569,13 +650,13 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index e68cede2e6b5..9ca0a3da8903 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
+void xe_ggtt_node_force_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt_types.h b/drivers/gpu/drm/xe/xe_ggtt_types.h
index f3292e6c3873..60cbce3170d1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt_types.h
+++ b/drivers/gpu/drm/xe/xe_ggtt_types.h
@@ -48,9 +48,15 @@ struct xe_ggtt {
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
index 6e235f305831..f4ddd17fc96c 100644
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
@@ -415,9 +415,15 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 	if (!size)
 		return 0;
 
+	node = xe_ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return PTR_ERR(node);
+
 	err = xe_ggtt_node_insert(ggtt, node, size, alignment);
-	if (unlikely(err))
+	if (unlikely(err)) {
+		xe_ggtt_node_force_fini(node);
 		return err;
+	}
 
 	xe_ggtt_assign(ggtt, node, vfid);
 	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
@@ -433,7 +439,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 {
 	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, vfid);
-	struct xe_ggtt_node *node = &config->ggtt_region;
+	struct xe_ggtt_node *node = config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
 	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
@@ -1921,13 +1927,15 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
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
index 6d0d9299bafa..44dc0a6e90d1 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config_types.h
@@ -19,7 +19,7 @@ struct xe_bo;
  */
 struct xe_gt_sriov_config {
 	/** @ggtt_region: GGTT region assigned to the VF. */
-	struct xe_ggtt_node ggtt_region;
+	struct xe_ggtt_node *ggtt_region;
 	/** @lmem_obj: LMEM allocation for use by the VF. */
 	struct xe_bo *lmem_obj;
 	/** @num_ctxs: number of GuC contexts IDs.  */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
index a478e6e1b20e..5c540e20c785 100644
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
+	err = xe_ggtt_node_balloon(ggtt, start, end, node);
+	if (err)
+		xe_ggtt_node_force_fini(node);
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
-		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[0], start, end);
 		if (err)
 			goto failed;
 	}
@@ -536,7 +552,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	start = config->ggtt_base + config->ggtt_size;
 	end = GUC_GGTT_TOP;
 	if (end != start) {
-		err = xe_ggtt_node_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
+		err = vf_balloon_ggtt_node(ggtt, tile->sriov.vf.ggtt_balloon[1], start, end);
 		if (err)
 			goto deballoon;
 	}
@@ -544,7 +560,7 @@ static int vf_balloon_ggtt(struct xe_gt *gt)
 	return 0;
 
 deballoon:
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[0]);
 failed:
 	return err;
 }
@@ -555,8 +571,8 @@ static void deballoon_ggtt(struct drm_device *drm, void *arg)
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
 	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
-	xe_ggtt_node_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[1]);
+	xe_ggtt_node_deballoon(ggtt, tile->sriov.vf.ggtt_balloon[0]);
 }
 
 /**
-- 
2.45.1

