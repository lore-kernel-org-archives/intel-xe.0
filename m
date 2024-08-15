Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE056C531DF
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99ED410E4A4;
	Thu, 15 Aug 2024 22:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Dc7/PnU3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 335C210E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759688; x=1755295688;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=fers82WYlW3waWwox8qwR4wF0CYFP/mfQB2qx3iX4/k=;
 b=Dc7/PnU3eTbUBeUfhqbbCOf2u0BlaE/xthBBGSIUdFHO47hK1y3ReMQh
 0617q9iYyi0HPbgLNbkraj/gm0FtfKb8d7wClRiIrPJi06HhyJJ4HXZhi
 7eYFfqPwIoi1CCZv8/5ASBRzKa7FwX7fSOlp7MzrsXKytAPSv8pFX8wK+
 FKniUzGqUevKNxCXZPtOd2dx1vm0XEXXv6wG2sd7wS30Vr0iroFLX85RL
 pWwQAZL6T+nLCrs7Man5GVA8l0tk6tsN0jLaNTPhwa5iLIb4uQIFMDyYW
 huUzztq54xsgwYy1kxYgdto4mQ0un8QU652JHb5pvPXtYrqvLrMn18NKN g==;
X-CSE-ConnectionGUID: DRPSq9CsQ0GCgFYMufdejg==
X-CSE-MsgGUID: 6yv/jK/jQY+03LlHsXqN2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24943260"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="24943260"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:08:08 -0700
X-CSE-ConnectionGUID: pBpKquGMSyqo3MYvvlh3Dg==
X-CSE-MsgGUID: c48/XPdaS8icMJhR/mOK1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64335973"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:08:08 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:08:07 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jfDUN1zFuOXtnEkDfDV9yVLyDrZukx+lMIqWAqP16UtrNO8CboW8yG9QcQ5FOW/Qys2oKBPGVViu7PQqRjR695+OJqL19fBPoMqU3uACGaZs84ZVt08YeHHv84S4xCR1VjG8aZzCsC2RpP2yoclcxiu6EGnRmXTZwjhoZoTKS4+QV6MyYsbaBT1XA70CwlfEHdpCBOG2GagC9kon6gQjEMSKumEEfXZru8OKEb8CKiTaX9yaMio4S1gyjPofQNTFxGgpdqDd12yvDVHDXpKWW3HhJVaPyHflX0ANjNXGmLECIFkRgCFxlGb81xEJea3a0cWeVqrGI3EQHPhXsDrJ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q6P+H1PdOk36Cr8rxQ1JIVqL5sm6SUbjOblwCy2aQ0=;
 b=VsDZQc/twrjaDj4imUV528qMrvEWPX3lm6xHORseh+FaRpgR2Dn7SXYNaZYF783jbxTg6tHsz5fipnPyUOW3Tc8xeoAiUfo5fUzLoOrhO/ZnEtF4Ph5nLXwU3uQZTdfL4vlRsROPdkYjP3mlVVarYpG0q3jYcpXjKkSRp5lvKeC6d4vFgSBA46HOs0cMRmeBI9ZTJAd71k+L4LIpmsRW2s5tQfKbzdEe8hfyC2tXzAbkQOIv0GwIjC6iVpJO5CHHGN4tRZsF6GYlOCWxcrKJVk38/SfZU/MByW/dX2pjPxdQiy4YebgCk/N4ZdgimBsLNXHJdlNICkkfLZ2T+WAx8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:08:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:08:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 11/12] drm/xe: Make xe_ggtt_node struct independent
Date: Thu, 15 Aug 2024 18:07:31 -0400
Message-ID: <20240815220732.49675-11-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR20CA0015.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: 2223899d-2c16-43b5-4e0a-08dcbd76bb25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?T2ts9b0Vco4u4Tg6GtBBRiWAMcPj42nEhbSTKoTzQUTSAkS8UH8nlnYlEP5W?=
 =?us-ascii?Q?YHfczW6lreNvM7MIwWq+s7Rc/6Ebb04tW+sfgBAW9z8nRA6MmCr84/EpK5uo?=
 =?us-ascii?Q?yY00SWkBfzXt3OR4j0IOKlkRF6+MR0rH/wx/FF6MIyHrme8c4RlIm5VmFu0t?=
 =?us-ascii?Q?zkC0iPoQsYnkOrvdHgo2lJqe1D2vyZyzjqlmbEBq4TRPcLZKrJ5LgN4hVzx/?=
 =?us-ascii?Q?WJEriBCnRH9WAF7Ypi8WBX+zQGPBAvopECkVklvkKOcOu2lwN10/FJNMDHI7?=
 =?us-ascii?Q?09+8t1XEnLWn85zrkaTodLj7pQDCg/OEQJyghHs6IFVkuG3Pk75TkFQYHy2A?=
 =?us-ascii?Q?McaQuvFqwNjFrw6/Bp90gv2pViNM8c/8PnvQ8r1zG5L8E51/8Yz2KTeVm21L?=
 =?us-ascii?Q?8PmiFK0UT0Xo1j7eRbYH+fqrjKucSAFHwLVS1IYYAwO7GyY2RDOiQmKCFfTu?=
 =?us-ascii?Q?NK76QRfggHBp8IoXvTBNQkxwsWzCeSDYfsEgWnaMxeEyZIByt3eQJQ5485OX?=
 =?us-ascii?Q?be5U5svspCyGIAvnVxdXPYDQmAIx/gNemKLxnyO+6rUd3Mz12841cOkPuN5E?=
 =?us-ascii?Q?021KQIo2tXKWyW0LkYE57DUcHeUHPRoC+76t7KQEAfrxeKl6UqrYGXlxMhKK?=
 =?us-ascii?Q?oEGtTh+5eqyBQLPG18vkTGELBle7FwfNXjPu2curCb6riy7ufyUcmItCZZAc?=
 =?us-ascii?Q?W0KpIXirLNsOh+MOL2GtbX0AAskJRd7D8XEWHTTDrCxVNis817qq/OzeeSbM?=
 =?us-ascii?Q?GDG4U84ly/krFiBlHNyB8Co5QOZ9HqYHhkLojrfddF9tv1iMHz46jqb9d2/W?=
 =?us-ascii?Q?hjb4m6LOzXrv6Bcu5Vgfg0vEnjzotQer3GVOnJEpM8Jt+Rh7LakkaiKMBxqF?=
 =?us-ascii?Q?ulXZEzMIR/v0L6EhkBqAlaSbxiDZcsF+NwnAgfNF23CG4/oRXPm4QBSRtsFC?=
 =?us-ascii?Q?mr6/W28d4a/xLCJxFCt2wW6c6jzVAVYP9BPEux3s36wDFEQpI0czKKbaPb+L?=
 =?us-ascii?Q?+1Y09kZxNhM1uMVvLe2KU8wlHuMOG/J8byy+na+6xSSPeVjpk6+QIWKF0UUb?=
 =?us-ascii?Q?y1yPan6AUICqVmxeVGczw2f2ufna0RqODK7zqBLtmINUG920A4kT1hxOTlwc?=
 =?us-ascii?Q?7qdeCoYT7IiOX3O5BgYYypW0I3d+6zwimKGIa/4SuU8Qz2SVsq0vIuxVsXkH?=
 =?us-ascii?Q?1EY6SBX5TqdrEylD+D+jhfn3yskpGVPwCCuZud4/1pwLJYee5L5BOqMSVHB6?=
 =?us-ascii?Q?U24JwxoJ7I07Gg/7KMn9LpGFbu99hO76HTHzC2iZjLncRQzdM4c0yB2+hIVc?=
 =?us-ascii?Q?Pfb6i1ItZCMLckTDeBb87swtWV1Vx69+p/6NgiY40P1yqQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uPkt6gAVsDVaYfddk9+G4ScomPACQ6nqcTv69WmT4TqOnEA42V8dOD13qM4K?=
 =?us-ascii?Q?0S1dDtxlPHmTZiqLVMivTQMF5febuKLXYXDBYwPJi6v/ISCy/g+MWSWQx9G5?=
 =?us-ascii?Q?nPOIbaDNgApPvTq7MPBwcvHYf3PPuhOH0waKcXdy9K4KOvj86yCvW8+4b+8a?=
 =?us-ascii?Q?OScN5eQi0Y83gG6j9BX6S+Z+53Ba5S92FtL1b9znX2w4v2m1LK0FvDqQVrG0?=
 =?us-ascii?Q?v0q1F5fLTOTlbsD6OxD+2UcKbJZ1HXpx0sndfGlcut1+/7oUkQITa/L1TveA?=
 =?us-ascii?Q?4hXF8kPb3bKoZKbwZPMgK6M8+vv+f3UWek0d8I0Tgj0QEjgGvWVa6wEU8A0p?=
 =?us-ascii?Q?I5NxJMQ7x2jr3FvWNuGhmivimjaQKtJomeiVDtiNCyH8VdJaeWM/E3FuhHpK?=
 =?us-ascii?Q?KSHUgZQMtKqRztX7yS8FswRE9/8QVtYFi1GJ/d8N16uhz5V4/sCCOJ5lptnJ?=
 =?us-ascii?Q?AI16+fjsl3SAhTC7F4ny4zPW9XbK8Ac0h8Ftap86jjn7DcnZtn97I3aHJiS9?=
 =?us-ascii?Q?QoSsZEIlBWhfDwnCDJIXD4LlJbUezdJEjpt0VZSD/csvrKg73YqOLy5BTm/D?=
 =?us-ascii?Q?ar5Z4NiJ+HRO6gFCSGTK7AYjPGdldGr1kDoOkr4LmoiHxU/rSlUVc5ftuE09?=
 =?us-ascii?Q?RPCaW0ZW0rzpiIPR8nwTHzDFpjZsp02G2TPx5sMBnhNeuKpnTUy5zZCUh0hJ?=
 =?us-ascii?Q?g8cM+mYJMX1i74mZA82/Uo9p1qM54Jdzi2RMom3RWUuEuTn23hujyoP0/BJl?=
 =?us-ascii?Q?KvPiC0JivRsg5H33g88ncp3YoRF/CDmfEe3mfDOo90gFE4qosBpnBWDlY4+4?=
 =?us-ascii?Q?bd4XOqsqE1dKqJ0UnAzI3wvWuxPsoKZv/obsoUG+RQ4tHn9BHAlaUrpoFAym?=
 =?us-ascii?Q?HbyPXdv4dEKf3zd6kl7ZGG3KEltymuTzjgBUn0D1jKt9mikSIsqsiV5l4wD6?=
 =?us-ascii?Q?xWfxBIQQ+E4po50B+y9Lv2IanuO0pLkZs3Q70HLVUYibhlmlbqEPS+bW4Cw+?=
 =?us-ascii?Q?wpNqeVYUaPfOXMp1KGsEzFcyIQfH1T21zPqiTKvJiu3WnPbYd3c2XqD+JFeV?=
 =?us-ascii?Q?u/pQKzwwuDPcIJAq8Z9KchZJxV0Uw1uyMH0lbAO2OW69mIOizh0AKOO+ZUzZ?=
 =?us-ascii?Q?zig+tJVbySFMfUhmtep8xeesTShYTxkZauCaxuNCd3HYXgfbiIksI6OqR1qZ?=
 =?us-ascii?Q?LiHBpRYtzC51SsM9Y2esf0n/bpYd5cqWGq8spg4VNmxHVwbuNPaOSe+NcmC6?=
 =?us-ascii?Q?pBiiTto0WsD7K70EQEWFX1rT7Ds/Ka+Qqlg+YtUJFXevbC0G/HEudRnzYNNe?=
 =?us-ascii?Q?vlf1rBQi2LPIqCigrbX5fmZUwNwQKidILuQsuqoPaZAwiDTB9Pi0IouzKNFe?=
 =?us-ascii?Q?nPGGVGpB2iwH/HYBFGBmf5kHmZqIyoAZtwwz0qcDUNaslfB3VVW9CnM25OcF?=
 =?us-ascii?Q?giusuqs9VLCKZR1WnHm2+VFoyWhG/0zZOIJSpLOV3Jyl173hWAZ+Y7DFd7Mx?=
 =?us-ascii?Q?vYWU7aZlfnZYbQ/4K29XAtHLSlJDowPUYoaBLJSWp98++fto9SJ9UKs/A36+?=
 =?us-ascii?Q?TzbVaA8WcUMQAELyf12zM4ihIakIF/vqPR8wXaxy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2223899d-2c16-43b5-4e0a-08dcbd76bb25
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:08:02.5727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bh9M7QMJOCn1aqeOPOGZkfQKgLYhBucXXLedj3NIl8gaM0yK4YrOhaL+1LVeGZkylRgH+td8Wi841fRwwH/spQ==
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

Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 .../gpu/drm/xe/compat-i915-headers/i915_vma.h |   4 +-
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  36 ++++--
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
 12 files changed, 181 insertions(+), 49 deletions(-)

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
index de4930b67a29..087e553d9c65 100644
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
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
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
+		ret = xe_ggtt_node_insert_locked(ggtt, vma->node, size, align, 0);
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
index 74c850777246..c4261527b1c7 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -1098,7 +1098,7 @@ static void xe_ttm_bo_destroy(struct ttm_buffer_object *ttm_bo)
 
 	xe_assert(xe, list_empty(&ttm_bo->base.gpuva.list));
 
-	if (bo->ggtt_node.base.size)
+	if (bo->ggtt_node)
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
index 05c3e6e929ae..5c04c1bc8417 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -353,6 +353,7 @@ static void xe_ggtt_dump_node(struct xe_ggtt *ggtt,
  * @end: then end GGTT address of the reserved region
  * @node: the &xe_ggtt_node to hold reserved GGTT node
  *
+ * It cannot be called without first having called xe_ggtt_init().
  * Use xe_ggtt_node_deballoon() to release a reserved GGTT node.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -361,6 +362,9 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
 {
 	int err;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	xe_tile_assert(ggtt->tile, start < end);
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(start, XE_PAGE_SIZE));
 	xe_tile_assert(ggtt->tile, IS_ALIGNED(end, XE_PAGE_SIZE));
@@ -392,14 +396,20 @@ int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 end, struct xe_ggt
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
+	xe_ggtt_node_fini(node);
 }
 
 /**
@@ -410,6 +420,7 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
  * @align: alignment constrain of the node
  * @mm_flags: flags to control the node behavior
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
  * To be used in cases where ggtt->lock is already taken.
  *
  * Return: 0 on success or a negative error code on failure.
@@ -417,6 +428,9 @@ void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node)
 int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			       u32 size, u32 align, u32 mm_flags)
 {
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	return drm_mm_insert_node_generic(&ggtt->mm, &node->base, size, align, 0,
 					  mm_flags);
 }
@@ -428,6 +442,8 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
  * @size: size of the node
  * @align: alignment constrain of the node
  *
+ * It cannot be called without first having called xe_ggtt_init() once.
+ *
  * Return: 0 on success or a negative error code on failure.
  */
 int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
@@ -435,6 +451,9 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 {
 	int ret;
 
+	if (!node || !node->ggtt)
+		return -ENOENT;
+
 	mutex_lock(&ggtt->lock);
 	ret = xe_ggtt_node_insert_locked(ggtt, node, size,
 					 align, DRM_MM_INSERT_HIGH);
@@ -443,6 +462,43 @@ int xe_ggtt_node_insert(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
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
@@ -456,6 +512,9 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	bool bound;
 	int idx;
 
+	if (!node || !node->ggtt)
+		return;
+
 	bound = drm_dev_enter(&xe->drm, &idx);
 	if (bound)
 		xe_pm_runtime_get_noresume(xe);
@@ -468,23 +527,29 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
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
 
@@ -497,9 +562,14 @@ void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
@@ -515,9 +585,9 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	if (xe_bo_is_vram(bo) && ggtt->flags & XE_GGTT_FLAGS_64K)
 		alignment = SZ_64K;
 
-	if (XE_WARN_ON(bo->ggtt_node.base.size)) {
+	if (XE_WARN_ON(bo->ggtt_node)) {
 		/* Someone's already inserted this BO in the GGTT */
-		xe_tile_assert(ggtt->tile, bo->ggtt_node.base.size == bo->size);
+		xe_tile_assert(ggtt->tile, bo->ggtt_node->base.size == bo->size);
 		return 0;
 	}
 
@@ -526,15 +596,26 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
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
@@ -574,13 +655,13 @@ int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo)
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
index e68cede2e6b5..0e6f8c396ae1 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -13,6 +13,8 @@ struct drm_printer;
 int xe_ggtt_init_early(struct xe_ggtt *ggtt);
 int xe_ggtt_init(struct xe_ggtt *ggtt);
 
+struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
+void xe_ggtt_node_fini(struct xe_ggtt_node *node);
 int xe_ggtt_node_balloon(struct xe_ggtt *ggtt, u64 start, u64 size, struct xe_ggtt_node *node);
 void xe_ggtt_node_deballoon(struct xe_ggtt *ggtt, struct xe_ggtt_node *node);
 
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
index e133594cc6bd..c617cdc1e4db 100644
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
+		xe_ggtt_node_fini(node);
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
@@ -2006,13 +2012,15 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
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
index 9a1be23ae71d..3d9f6a700564 100644
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
2.46.0

