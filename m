Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FBECEE33B
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:37:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D3C710E7C8;
	Wed,  9 Oct 2024 18:37:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Os0amWmc";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891FD10E7C8
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 18:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728499030; x=1760035030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=1w78SrnzpiVseCRVsy2/TeVLEaEvJTMU8DlcIaxKLGc=;
 b=Os0amWmc+SH9RBqHGvsuU2A72hd+SkO7/pN/6AXcy4PJ2XLpu6wyTZD0
 vOVdEpAM9xooUAykEbgHuDHhtEd3YQXO5ieVfUT4zFAYgjzdXc75oaUZg
 vxmRi1Yiv5OnHwM2Gfh0cR2Ox5AsW1Zque8wK6gmmMW6UUcXX+NVwFm22
 tQKnCNUm8d7GMOFzccK8jTb/rPilTUl1LIfGAT4TS0cyvAWYbj78NAzpD
 y58RrnP7V8ZK+ILLKAPWn2onvpAW3+fV4gP85brsF0NNyfAEWp8dnaMkh
 Ryg4dMCnmmN4Yf1ZK+7kok4Sdx60IZFxpbdYeWNl47ymEwxSItMlr+eQA Q==;
X-CSE-ConnectionGUID: aXnFjIuZTKujmyf2B8smXA==
X-CSE-MsgGUID: x3UaP2wgTFu0s2z5A/BP2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="27268485"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="27268485"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:37:10 -0700
X-CSE-ConnectionGUID: bEoRS/VvQ3Kk6k7qXO1TBg==
X-CSE-MsgGUID: fl9kJCbhQHaSFzrf1ahjIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="75955707"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 11:37:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:09 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 11:37:09 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UnwS2P8KkLFCUNvrFAilZ7Y+eLblfS6wjLPHHFEZjALwOJIzNCX5idyDsqGT92SKVyHoK45JuXS6sfHYh/nzZdyKPnrz+l84hO2bMauO3Bp+S+ylk8kNhwh9co968XI/UOaUczRipCoC8SD76R0jKEQgyD4jeowIxH4IuKeNWIPG1dJnwGDndnhoWX1lq0J7kvqN9/Gml+6M6NwgDs2O2XXpLgRDdYG4Mr3kiRjTPXdcR8TseGEGfZUpzPk5xgrVTKySWqdNhJ3a/moiJiItUV2+yLt1BRymg8GogmWjIhhqBoUyMASfft+BUeiEKisLY6uv0GXlzxDmZxvYHGcogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9DOFZE189wzqAcfgXYrKnfmBDZ5uoF8FzTRPBIervE=;
 b=LSyLV1mUl6bcyogOy+YS8OJ8NzpEc9rz2xt2H3srYgstuh6xijbgKGmtaDbLMsMF3MSjKiw0Y5WzDZGZ4f3BNq4vcuwU4Bde5NXBYUkN46P5vi0HJBMbdcJVBMAJGu3n4I+AGwFYUPjY1bVPlul6v5YCEL7n0Y2tHjlOabZTMmWqH0zssx42PTZkQoJcOorNohL6dia4dRzjkXn6KeAFSB4bk0SgQ5K/p8/YHgaIWJeL7m+V8H7QuhZsBLeklxSfuSZjbyQ6/FfJiDva2Br/4CEop6BcUUCiDdXLXqJGNOKXIyYSAWDBszfI0N9YCv+zOP7bTCkjNN/QKUGsXFmnug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 18:37:02 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 18:37:02 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 3/3] drm/xe: Introduce the RPa information
Date: Wed, 9 Oct 2024 14:36:48 -0400
Message-ID: <20241009183648.36948-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009183648.36948-1-rodrigo.vivi@intel.com>
References: <20241009183648.36948-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0073.namprd03.prod.outlook.com
 (2603:10b6:303:b6::18) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: ed2c8bb7-9fba-4d6f-7fc6-08dce8915dba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ads41aIGR4YWCSui00M3JUSqqh5ZmQi0vtCA3T4lpd+nmMA4E1B8+90Qyuve?=
 =?us-ascii?Q?7x7CpAqd525dYjKPXzDdoctTKBBiUgCILI51DuyrBZqtbc3ZDlGBnNgC6ADx?=
 =?us-ascii?Q?EJmrvR0GSm8blp8H6sW6Wlre/PXbTM33wk6oRaT/mOvwm/rlTj+YKo7N8Cdm?=
 =?us-ascii?Q?fVt4u3eoBJ/ihhXtbdXaqdpbw7/2zxs3gQNWP1wRsyW1DSL6eqGO73KArE9t?=
 =?us-ascii?Q?DookKNUFZC57zP+FO2UVFXpNBTDDDsydh99Jm7YvBSBd2iykADLYMJ2DqiVM?=
 =?us-ascii?Q?mQP8x+Vm62mRCCRV3U94x7m+toztQtgoB0TUVKhFeFwRukgeHbQ8LlOEsTU6?=
 =?us-ascii?Q?fus4dV4tMI5/BESe/qYz7QQEfpDWFazMNBPVFrR9AjE9ftz22w26xMYjOHpt?=
 =?us-ascii?Q?qr1FXl1n44eTMouozF2x+xIHsbmfLUy2g4whOcpxevQqjfw7F6zWeTIWhCRQ?=
 =?us-ascii?Q?Z7qVb9LTBqMO9BLaFuTjg+nhPPCkM1dBetk1eL6/XlFcr08vIpXLfIjuXnEw?=
 =?us-ascii?Q?ByRkLxneyU/Br9u0aL1EcLwSOmq8z+qSl5fPlPigB1O1i8EPyREf4vR5zeV5?=
 =?us-ascii?Q?DkACOz2ALjzXQcum1lmXC1yQLKgKGdiPLXJIzjXOAILAyFKFhxYTGY7dUTsx?=
 =?us-ascii?Q?P8o0lhLrjUoq3T2yiRXUTgpLkcnAdOvF7sAANzKI69GfZdl29NIHSsDm+F08?=
 =?us-ascii?Q?TppyoMGpKn7ULTzuQfNj5jyDus/vcjMLTF7CsEK3nfzpphJYe3Nlz/nrRBDS?=
 =?us-ascii?Q?MdkLkTu3N31mYeF7LlWjYQQxrPG4oXgx3T9ZI1IVKBD+E2zBWue1V2X2V69k?=
 =?us-ascii?Q?4UWQvME85Im3O+oFiEHKHexo687Omt6rnXPg41EB2A/Znp8iEWV30mkIxeiH?=
 =?us-ascii?Q?6+BM7P5AwWXebXQfklvKqvZPbB3vBK+TP2VGkpuPqUABdxHKJn3BIaEpCRrt?=
 =?us-ascii?Q?41SVa9N9PNgxKtxN2k7nRbJX0k6H3Mm5bmArrY90raJ62h588jTchS1ND46N?=
 =?us-ascii?Q?foDrou3Te9nv4YP0XIYFKOhBUi1y18M8En5GxMUeDclXat39+5eaGrv/MWZA?=
 =?us-ascii?Q?sfEyn71GyE41TXqhaJqjN6niG9iK566skGWmNPkH5s7WOe8RVPoFRBAiFMdj?=
 =?us-ascii?Q?ft8MMrVLhP8pHMFbGeQM6ThRm8GdqjIsnRc0VEnOfgAOM2mQN8YrEHHDS+ay?=
 =?us-ascii?Q?zh0JsWSkYSz1OSTeUndbHHZtI6+Vmdwv+YYQgj+Bc1QpfJBh1ySDQ5dddasx?=
 =?us-ascii?Q?4kzOTNevIg4xxWll4k8lnYwarhV8OwAVjWYS2Xbp/w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EXmgpVBhynD05brEqw3eJLc15w9l1zTurNQXQ+ampkuRx0n7hSs7R82KDxYh?=
 =?us-ascii?Q?kWnmVjYPDQIPopgS4Uvo15Z+77tQq1i/b8t7Uu7oCtiOM8DW7FgWhQbUEjJ0?=
 =?us-ascii?Q?ULsUm+0VzjZHcQ7rK/CYGKrRTiP10cgRYgeJD+nG85B13BaZiVRONV55h8RV?=
 =?us-ascii?Q?oBKWqT8Yo8YYsmG5QuUXsWCSWQlKv48zeLthdXenXgnl5FbIQIZ2lvroitph?=
 =?us-ascii?Q?RJ58kUD9YEGlryNwOlTgLfbXU6Xe4T7Pj01aTBXbBG7A893oInqZxNPvdbt2?=
 =?us-ascii?Q?Qi4YNmUtNsjQCMJiRQANwAdh7F8m/0Cf5bLu2kBkoL89zoSd2oHv6kt6OJ+d?=
 =?us-ascii?Q?HblHcp7txDswNfO3sZOpLIqKIgI4i9A01pAU0p+UxQfAHwHdSxGtNgvm37jT?=
 =?us-ascii?Q?3WDegc6pjskgmoaCofG5RoApODpJB81z/72ft7lBJS7SXDO4FdUCZZdAvjDx?=
 =?us-ascii?Q?Q07/GGuwgh/sGqXlHdn94xXyCkK3KeFvEp0dS43FVX6vjnzVa8VkA1AhWLZ7?=
 =?us-ascii?Q?Z0f+GZ/ufr4BUTIZbih72le4N7sFF51yXYr44PbsyerM39GsBC3DNnfBtF0A?=
 =?us-ascii?Q?LclNk/4atmaanSeB7vlogyT5Ru2xlRovZ1Dgzo4kOXLbpk7JcETp08scqWOM?=
 =?us-ascii?Q?NPplbeAjCHvkA/JOudLWszq6SuoTECLSULM8tqSrjJBngNcd2upfPg9aIBQB?=
 =?us-ascii?Q?VF0QHndwGxo+Mf84f6sywXztdr8EZR6eLw1VoJ3sW14m95pfHP44Lupm4r65?=
 =?us-ascii?Q?CSm+hLWJDnMqTTwSDtS9rFr962zCJ54ivrQNhTiYI3bb/4bHuJaC2B2BWnx4?=
 =?us-ascii?Q?pA06b7knTGI4bzCtyAJ9GTWhXOOBdqVTJKny4FhUWHSX1JcY/G7K7Rt4PkbW?=
 =?us-ascii?Q?b9VELK0BiB1ELO47B+O/xKxozGnW6NzSYp9S9Lwlqd+47UC6G2z9vAa+uclB?=
 =?us-ascii?Q?Io13tWaHkBWq0J/8AxYEh/z1fSnDaB4DvovrBXCGdcP+6AYRZU7rHJenynrh?=
 =?us-ascii?Q?BUVt/vyicdluCDk1ySr4A8gID6Hs1Rz6vBonqfjBR5bu/m79eoYu8J6m+dBs?=
 =?us-ascii?Q?/bvVDGN+gb9urXAgcZtG5kJNfKYJf45L28/t/HlCHrjN+lQRqY4lLsveJYyY?=
 =?us-ascii?Q?7K0C4mK7hmNql1nJkMYEVc1Xczj8i5Arw73HkKEgd5d9s+gRi/hWlzpL2RaB?=
 =?us-ascii?Q?jhYig8VhdW1eaiaz0w305cacORXbWwKxY/7TUIPEFwR/MZLgZDOcS0yDW4l8?=
 =?us-ascii?Q?B0txvEiBVjj5Pm34LpPG6P+MyVlaeVIMiGnfMo04GbDpJtavdlXee/ZM7ati?=
 =?us-ascii?Q?ShfK7+MoBGKYd7r3cncUEPdn7RlujQAmelJOtSSQ4PdqrOByJJ/VT0Ge3Xeq?=
 =?us-ascii?Q?PbzOxtc3eUQF0FK/+OrA+LNXV0XdsDFMY822JopgAzW76q4LBUYYwW2bKbK+?=
 =?us-ascii?Q?G+eyN/AMr7wXQkdbH9u32WmaOdgCe1II6hlLVZh5oL9hw/nzcQA/Mn3KjAen?=
 =?us-ascii?Q?vmmkW5eiYtd83BhKGARiSrj/y99vATkfrrzzoBHJ0gSaz0SVwyxceFr5hX2A?=
 =?us-ascii?Q?FDMHJe+jNbSOgWWilHZzXgvURnBsEYax+k086jyuiC+7oU80S9Xr0Cqc30xi?=
 =?us-ascii?Q?2Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed2c8bb7-9fba-4d6f-7fc6-08dce8915dba
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 18:37:02.2525 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XDrkPRe+fCCKdI+zvxre00ioOyEJ7qtFJJZO4uiJN11NA1EDCKfojsIgdyTlXl8f7e8r7Lqz9vstnqeqs0Rr1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4631
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

RPa is the Achievable frequency, defined by PCODE at runtime
based on multiple running conditions.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/intel_mchbar_regs.h |  1 +
 drivers/gpu/drm/xe/regs/xe_regs.h        |  4 ++
 drivers/gpu/drm/xe/xe_gt_freq.c          | 15 +++++++
 drivers/gpu/drm/xe/xe_guc_pc.c           | 53 +++++++++++++++++++++++-
 drivers/gpu/drm/xe/xe_guc_pc.h           |  1 +
 drivers/gpu/drm/xe/xe_guc_pc_types.h     |  2 +
 6 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/intel_mchbar_regs.h b/drivers/gpu/drm/i915/intel_mchbar_regs.h
index dc2477179c3e..f78865526f16 100644
--- a/drivers/gpu/drm/i915/intel_mchbar_regs.h
+++ b/drivers/gpu/drm/i915/intel_mchbar_regs.h
@@ -219,6 +219,7 @@
 
 #define GEN10_FREQ_INFO_REC			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK				REG_GENMASK(15, 8)
+#define   RPA_MASK				REG_GENMASK(31, 16)
 #define PCU_PACKAGE_RAPL_LIMIT			_MMIO(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
 #define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
 #define   PKG_PWR_LIM_1_EN			REG_BIT(15)
diff --git a/drivers/gpu/drm/xe/regs/xe_regs.h b/drivers/gpu/drm/xe/regs/xe_regs.h
index 3293172b0128..6cf282618836 100644
--- a/drivers/gpu/drm/xe/regs/xe_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_regs.h
@@ -44,12 +44,16 @@
 
 #define MTL_RP_STATE_CAP			XE_REG(0x138000)
 
+#define MTL_GT_RPA_FREQUENCY			XE_REG(0x138008)
 #define MTL_GT_RPE_FREQUENCY			XE_REG(0x13800c)
 
 #define MTL_MEDIAP_STATE_CAP			XE_REG(0x138020)
 #define   MTL_RPN_CAP_MASK			REG_GENMASK(24, 16)
 #define   MTL_RP0_CAP_MASK			REG_GENMASK(8, 0)
 
+#define MTL_MPA_FREQUENCY			XE_REG(0x138028)
+#define   MTL_RPA_MASK				REG_GENMASK(8, 0)
+
 #define MTL_MPE_FREQUENCY			XE_REG(0x13802c)
 #define   MTL_RPE_MASK				REG_GENMASK(8, 0)
 
diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
index 6bd39b2c5003..604bdc7c8173 100644
--- a/drivers/gpu/drm/xe/xe_gt_freq.c
+++ b/drivers/gpu/drm/xe/xe_gt_freq.c
@@ -115,6 +115,20 @@ static ssize_t rpe_freq_show(struct device *dev,
 }
 static DEVICE_ATTR_RO(rpe_freq);
 
+static ssize_t rpa_freq_show(struct device *dev,
+			     struct device_attribute *attr, char *buf)
+{
+	struct xe_guc_pc *pc = dev_to_pc(dev);
+	u32 freq;
+
+	xe_pm_runtime_get(dev_to_xe(dev));
+	freq = xe_guc_pc_get_rpa_freq(pc);
+	xe_pm_runtime_put(dev_to_xe(dev));
+
+	return sysfs_emit(buf, "%d\n", freq);
+}
+static DEVICE_ATTR_RO(rpa_freq);
+
 static ssize_t rpn_freq_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
@@ -202,6 +216,7 @@ static const struct attribute *freq_attrs[] = {
 	&dev_attr_act_freq.attr,
 	&dev_attr_cur_freq.attr,
 	&dev_attr_rp0_freq.attr,
+	&dev_attr_rpa_freq.attr,
 	&dev_attr_rpe_freq.attr,
 	&dev_attr_rpn_freq.attr,
 	&dev_attr_min_freq.attr,
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index d141165e016b..4274f04c8808 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -39,6 +39,7 @@
 
 #define FREQ_INFO_REC	XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5ef0)
 #define   RPE_MASK		REG_GENMASK(15, 8)
+#define   RPA_MASK		REG_GENMASK(31, 16)
 
 #define GT_PERF_STATUS		XE_REG(0x1381b4)
 #define   CAGF_MASK	REG_GENMASK(19, 11)
@@ -329,6 +330,19 @@ static int pc_set_max_freq(struct xe_guc_pc *pc, u32 freq)
 				   freq);
 }
 
+static void mtl_update_rpa_value(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	u32 reg;
+
+	if (xe_gt_is_media_type(gt))
+		reg = xe_mmio_read32(&gt->mmio, MTL_MPA_FREQUENCY);
+	else
+		reg = xe_mmio_read32(&gt->mmio, MTL_GT_RPA_FREQUENCY);
+
+	pc->rpa_freq = decode_freq(REG_FIELD_GET(MTL_RPA_MASK, reg));
+}
+
 static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -342,6 +356,25 @@ static void mtl_update_rpe_value(struct xe_guc_pc *pc)
 	pc->rpe_freq = decode_freq(REG_FIELD_GET(MTL_RPE_MASK, reg));
 }
 
+static void tgl_update_rpa_value(struct xe_guc_pc *pc)
+{
+	struct xe_gt *gt = pc_to_gt(pc);
+	struct xe_device *xe = gt_to_xe(gt);
+	u32 reg;
+
+	/*
+	 * For PVC we still need to use fused RP1 as the approximation for RPe
+	 * For other platforms than PVC we get the resolved RPe directly from
+	 * PCODE at a different register
+	 */
+	if (xe->info.platform == XE_PVC)
+		reg = xe_mmio_read32(&gt->mmio, PVC_RP_STATE_CAP);
+	else
+		reg = xe_mmio_read32(&gt->mmio, FREQ_INFO_REC);
+
+	pc->rpa_freq = REG_FIELD_GET(RPA_MASK, reg) * GT_FREQUENCY_MULTIPLIER;
+}
+
 static void tgl_update_rpe_value(struct xe_guc_pc *pc)
 {
 	struct xe_gt *gt = pc_to_gt(pc);
@@ -366,10 +399,13 @@ static void pc_update_rp_values(struct xe_guc_pc *pc)
 	struct xe_gt *gt = pc_to_gt(pc);
 	struct xe_device *xe = gt_to_xe(gt);
 
-	if (GRAPHICS_VERx100(xe) >= 1270)
+	if (GRAPHICS_VERx100(xe) >= 1270) {
+		mtl_update_rpa_value(pc);
 		mtl_update_rpe_value(pc);
-	else
+	} else {
+		tgl_update_rpa_value(pc);
 		tgl_update_rpe_value(pc);
+	}
 
 	/*
 	 * RPe is decided at runtime by PCODE. In the rare case where that's
@@ -446,6 +482,19 @@ u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc)
 	return pc->rp0_freq;
 }
 
+/**
+ * xe_guc_pc_get_rpa_freq - Get the RPa freq
+ * @pc: The GuC PC
+ *
+ * Returns: RPa freq.
+ */
+u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc)
+{
+	pc_update_rp_values(pc);
+
+	return pc->rpa_freq;
+}
+
 /**
  * xe_guc_pc_get_rpe_freq - Get the RPe freq
  * @pc: The GuC PC
diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
index e333eddafcef..39102b79602f 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc.h
@@ -23,6 +23,7 @@ void xe_guc_pc_print(struct xe_guc_pc *pc, struct drm_printer *p);
 u32 xe_guc_pc_get_act_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_cur_freq(struct xe_guc_pc *pc, u32 *freq);
 u32 xe_guc_pc_get_rp0_freq(struct xe_guc_pc *pc);
+u32 xe_guc_pc_get_rpa_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpe_freq(struct xe_guc_pc *pc);
 u32 xe_guc_pc_get_rpn_freq(struct xe_guc_pc *pc);
 int xe_guc_pc_get_min_freq(struct xe_guc_pc *pc, u32 *freq);
diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
index 13810be015db..2978ac9a249b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
@@ -17,6 +17,8 @@ struct xe_guc_pc {
 	struct xe_bo *bo;
 	/** @rp0_freq: HW RP0 frequency - The Maximum one */
 	u32 rp0_freq;
+	/** @rpa_freq: HW RPa frequency - The Achievable one */
+	u32 rpa_freq;
 	/** @rpe_freq: HW RPe frequency - The Efficient one */
 	u32 rpe_freq;
 	/** @rpn_freq: HW RPN frequency - The Minimum one */
-- 
2.46.2

