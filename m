Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DEF1C02185
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 23:25:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08A6810E487;
	Tue, 14 Jan 2025 23:25:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VO1S53qK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E724910E487
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Jan 2025 23:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736897106; x=1768433106;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xQu2tqCHChe3N205T6Un3aWD6l/7UuXA1qDyVC5m4nE=;
 b=VO1S53qKmfhdPxWtj1yaH+9iPQR/bDyLPNFbu+Ti+8G4ex/L/gWCBzFu
 TC0g6epQgOnBPKiEn6lDg4DAvg0vZPCXGdJmITQoWQ991wjrROguygIOG
 yF/XjsoQ7qE56dolpUomFEyOJhOoPdT+nGW3WuktVvt8dwFP+p8OYcu0I
 3LS2KRvF66x8gVbZsOi9LIrQaZ6HoSs/2JYwGT+M6ZAnCvFNCtJiosd5Q
 xDFCDlfZvFgKMrO8868L8ZLEa/5Iq/w2GdotNOPtwu+U/u9jP/RRs9t2o
 4WdAC3kWPIQgcj2ZMmhN0Xbax9TOpu1cgATwRRH3B6nxxD+ebXs3P6WXG w==;
X-CSE-ConnectionGUID: YRciLZFbSJOJbh5VhraAcQ==
X-CSE-MsgGUID: AbNN6XqESQKDDWJHIK8Z1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11315"; a="36911990"
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="36911990"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2025 15:25:06 -0800
X-CSE-ConnectionGUID: eO6CJO76Sre6NAdwmNLJvQ==
X-CSE-MsgGUID: kSCusz0LT8CpL4+ScsRNOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,315,1728975600"; d="scan'208";a="109926596"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Jan 2025 15:25:07 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 14 Jan 2025 15:25:06 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 14 Jan 2025 15:25:06 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.43) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 14 Jan 2025 15:25:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2q2w7ycHQKEWgHprKM6dCkdxqHmftH2C/XRC5pwfsFNpSsQiRrAWzovgr5bmh23Hayzv25Yi5lfm3nIllk4JxKqHzMh5ElCJLYjXpAm/A1UKLtNYd3CvH+CN8Z5uBKIDIhTH8Q5ezE8gd2Wyd9q9We+iZgIS3/NiSkzmRw6lzkPbWUrt+ub+PyvVbO4YFSBHDdASf/y/v8EzjtOw1L7Kx3qjjD8E2PlZgf55uMGA2OJ9Ny7tVOZCJE5yt+UiYia+Icfngzp4+mptdskVlosmL5EwVWGDosfSkI+wivF54eWM5flSKF2q0f5qIDC0w8Us2m7QTEeDvuqAQy7tosGpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mxwjiOXNzhN7h1MaXrz7xn0s2K9RLEtt2xRs+fH5UD8=;
 b=Jj7/hvySuKT69G3EPaq9VOvPfuaDZp6HsJv/pGYA8WJeTiNKlKxfM0fuZO12obCY+Dkom3HSRcQmDHujuYjwzdOFh/3IRKpytRrdAJCeIKt5aDBfaYAP1IPLRtFvG+oZE4S0T4rs+n4LkafcbOohJoGkkwymkEvSLCsUlskmdGnakSuJVQbbb1nk9oCsFUPkAhultwujKF65zZKq4KP1arCHjRXYDYoC6wq3t9ljeDGhXQdsrKHN9LgwOumMQ5MH2T93prmrZfvI5/0DaI0Bwf4GiVaZ/RINpJTI6Vzc9H71dTn3kgo5UPhvcltwy5Io/IBSa5GQwMDOhFb2dFhbxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by MW3PR11MB4538.namprd11.prod.outlook.com (2603:10b6:303:57::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.19; Tue, 14 Jan
 2025 23:24:49 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 23:24:49 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Tue, 14 Jan 2025 18:24:43 -0500
Message-ID: <20250114232443.1135355-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250114232443.1135355-1-rodrigo.vivi@intel.com>
References: <20250114232443.1135355-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR04CA0088.namprd04.prod.outlook.com
 (2603:10b6:303:6b::33) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|MW3PR11MB4538:EE_
X-MS-Office365-Filtering-Correlation-Id: dc8b6fbb-6452-42c8-06d3-08dd34f2a3c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yWzHoP4d020abmq1Jj0ndBjhLD0Di6PDFVoG+XYHdwOWfFpYXVniZ7wD8job?=
 =?us-ascii?Q?BAQ06EutgUqMbQolRBQ29iR1ta0GrX48T2PQa7XUjQKj1X1PTPw3DGOY4aUD?=
 =?us-ascii?Q?Dzgm+SDWwUpo6WiSh6ANVJwiDbcUQ5i2lRFbpAuIwhDxBYwrOTstiwmOYgce?=
 =?us-ascii?Q?iFPhPoAQ3fgwuvy2WFUC2TzMqKbcr0eRm6ARQV2oHNfej0E+09VHB9ZUgwD6?=
 =?us-ascii?Q?kyFNxuQdvOyu0SQuQpmA+h/SodL6PWKndkRJS6xjy0dY/6tWwYkGfnQjlnLH?=
 =?us-ascii?Q?4WNnxtzm8xjDbXK3lFj0QAi0pAuIRJSrOO7tzpuywWt2CKPidMm+ApZWT9mT?=
 =?us-ascii?Q?3a1BGrHOxo12u0GhIrCqAbHtXRGwEU6u1JnrkJ0K4qKrcmXqjMSakporXyJY?=
 =?us-ascii?Q?jHdHkQDhjZpwxz6dE0chTpkElGWpxwRPJFJ7YyRcnp+ofyW7xa6xwTTrvFZu?=
 =?us-ascii?Q?9EkiEyKaWG/dCUmWiHMSF8tY46cVS8X8Kl6nVWxtc2obZzVP0NzsTVVJxg2D?=
 =?us-ascii?Q?KXfjHRna7qdqnOiRLnGhyK2UHQl3V8A2L12sQCCcnO0w3Z8mjfKYPjdxOYk4?=
 =?us-ascii?Q?ONnJpjjE5lyyBh/2o/9d26r7XhDwE5CpKBjQT3fVpm6Yj4SWxCgmVYM1xraQ?=
 =?us-ascii?Q?OKgncpIc1ptRnv+t4z58jnJhYyDd63RWXYFlW+o4DsHOIy4fzb/21XSMrqQi?=
 =?us-ascii?Q?83hZ4+AgiouohUI/klizSd1qH+EUF3V7XUq+ifIaoXsw9xQ4quT340KEPPBz?=
 =?us-ascii?Q?aQ4o8fL9yE3WVC9FxuL4FaPTF+zXiLQbxh5pWeqANItoRP6O75Jk2sEFAYLs?=
 =?us-ascii?Q?dtHVcm8C+Y7u5p8byS5GknCViuKe4lY10Qo0ZvvyG+w9Zl0J30gQOokJ1eC3?=
 =?us-ascii?Q?kOMNCjHbD1hsFzw9HlaL8Rz4cO8TLj3zKKa22v+9cqaS+YrENWWhKcHw61M+?=
 =?us-ascii?Q?3W3cHXXH83lQcrx3RpEc4BLv5feXzr/BSNhpiYKncUw+a2oSLwo1/tRFY1Ci?=
 =?us-ascii?Q?Ku7jyWsUrcJ5h8Oth5PaScoNYt0v/mMJP3uwKEtMa256A67zRbKa1wc1OING?=
 =?us-ascii?Q?aZyOlbk8t2ioo1jOmlLZSoAo+lx4k1qi0UqOp/bUN+q9GwozX6ToHK70Ao/D?=
 =?us-ascii?Q?Dx6go1kjIVeKcZhFt07SrY6G+eV0nJ7Ayx+nCprPUtyOeXUGOt7z+c8yMNhX?=
 =?us-ascii?Q?NVbIPK+zGmlwM1LiIWA3HV7qe5anT1wDMWmkvWudUtXDjrHAUz5Q1ccnRUWy?=
 =?us-ascii?Q?63wI5fiAYZmjYPFYjFEuxwYmcbZ3XRYtF4brskDly+tzlAnHp+oEsv+SfCu8?=
 =?us-ascii?Q?RxuXRs7+O5Xv243iXIDD9DBt5Hd8OtWkeBsB1ARWQJk6pmFeuQNirLvcBAOV?=
 =?us-ascii?Q?jg8BT3NE+vgHCgmXS+Bv3yWs/FJ+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6VhzVO8bHgyGx+lkUtT3Zz9V0T+SElPknl0Wy3AGYgWJMNjj8nusGN5MW8v+?=
 =?us-ascii?Q?/AXMcqHHu/doMEIkAIMhhIRsHZUUrjRsK896Wb1XCdZcI3yjvOvtC1C6xHy6?=
 =?us-ascii?Q?nTzWiafvFuX/fui4/kZgEoKk/DRViuiXYIoizfbFeD9Therbirl265iwiErU?=
 =?us-ascii?Q?5cLplODD/PUNB3/LOZrJ9o9Eb0fkVigPY2zheXvWcX40SIN9HmdoSUeRvuvE?=
 =?us-ascii?Q?LHaNL2FE2jbXiDO7iJvMIn+aVBfNCVk17Pkm6vyld6SQw45sFhrLGys0tPqk?=
 =?us-ascii?Q?guVPEkt96rcOtIwPVFNJtSPN1hffMj1DS1akUSpyaJlCDOwfx8ZC0bMEAp9G?=
 =?us-ascii?Q?rGP8H00fyvDAl0UolP51CKV5gXQ+SxQEhhLN8O80T1YFFokIMSDVrBcuTgaX?=
 =?us-ascii?Q?Ab3PuMqs3lhu8hqGV+cl7Mwc86BWYheS+CbR3uXYq6s0GRTo9wUwVy44BMmn?=
 =?us-ascii?Q?HuI+atsy5wbMpedv7Bo/BDoCCeUNVLwvBKWanYWb3VAeKitz5uyBRDPj6ZI3?=
 =?us-ascii?Q?GZutVICE1w5BZCgwO9YKgBhgm6CpCLxh/VW4KMZA6sh0CtCLANuF5KLo4y4p?=
 =?us-ascii?Q?pGsCcDpMQdLr4nL+MVWOMFeqtf6JpqLeoAPizCyVdfYZGStWHJF5uASd2q54?=
 =?us-ascii?Q?VhZGgXdoWQBDQWd5E2ojSE0Z+cJmqdaFiih+ZrVz2sGUMrKzn4Yg/Vq0Q4Jz?=
 =?us-ascii?Q?JTcyvJP2hznHvXdAorHSnjXVmKHV972Ks6MYJapGnYr/Yc9LyeCoET0kR2Ib?=
 =?us-ascii?Q?5KNURhJco5kmfBEen6NbAc/WlLm2cTlXinYhO4TdE6nrEvFkIPmXiE3S/C+Z?=
 =?us-ascii?Q?+ValMwKM92MetM0F9srFexICVoMnxBJHL+fO5Qy/LLQcCl18kpZu21i5Lp4Z?=
 =?us-ascii?Q?v7QJonUUN5eGwGlX6V9gxTzMEzIEb2kxevHR7z4BqfjTfmB0/zjP+oO4O8SJ?=
 =?us-ascii?Q?zvXDYFvkb8rhfdHNMss740fy2eyMARy9nVkJTEg/AsFVMh84N99d/FQsag/P?=
 =?us-ascii?Q?R6P3t3JglVqo7blRAMAxFo2rx4BMuXUUAcAiLA5uARFhlqzwBai9wGjs5vfq?=
 =?us-ascii?Q?QETuaFw9L1A18Hs6eFV3LLYbRRyIy4PXSxP+fB21U4vIM+e1RPwN/En+Wid3?=
 =?us-ascii?Q?cOwElAbApRqBXx7mT5dxi+1HSPY9Ghisb9QbizGgM1CFsjp/t/q/ah2PKski?=
 =?us-ascii?Q?8C2ur/jpfur/K7sir/CGaobMFSHkRyIKMDRK5eKo1oUSrmy8vD0+aVqHTu+z?=
 =?us-ascii?Q?eIfgZjCdDGNNl5CzQ+gg015uqdItwoJkK0lkLuC1hU/wvs5ZuDBGuyFDhiwH?=
 =?us-ascii?Q?C5Wow9iW1VmNJwg0qpKXO/ZW86HujEiaHxObp2vm9zdcvGAELWebR1/LkbZx?=
 =?us-ascii?Q?AM9kAxJDNU59Fh+oAmB5HChtbbBCVOe2/KZTbIvu9ydWPP3NmGu3yupohDgw?=
 =?us-ascii?Q?hmJaufaCxOvrcsLrcJ66Zuvyqx2VDyZwnHVnMm0T9lx6vcV68aKe6bzcFkkO?=
 =?us-ascii?Q?ZyGfpLfqOxnPVLeKxobg4c3iVHIy4ylsidGQlfzS+PWfcdAe3Kqt5/rBuNh9?=
 =?us-ascii?Q?rgIzh9bb2+W6Yghoi3xlyMaquNzJ+gxcECv/rrNK7elAxseWwVoeZ7fReYq2?=
 =?us-ascii?Q?Xg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc8b6fbb-6452-42c8-06d3-08dd34f2a3c1
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 23:24:49.2882 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fn6PPH7nDrcyCFlqOLh3OROSp82WCLtt1+xs4lGoC1MjRxaS8n9Gkp97mryq49BLH29GZI1MEgi1iADRg+U1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4538
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

Enable DCC (Duty Cycle Control) in Lunar Lake.

DCC is the SLPC task that tries to keep
the GT from operating inefficiently when thermally constrained.

Although the recommendation is to enable it, LNL GuC is leaving
it disabled by default on LNL.

It would minimize the GT frequency oscillation on throttled
scenarios, which could potentially reduce latencies.

v2: Move set_policies call after wait for running state, so
    we ensure it is not overwritten. (Vinay)
v3: Fix English in the commit message (Jonathan)
v4: Also set disable to 0 so DCC can really get into effect.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v3
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 43f9617baba2..e4f5db787e36 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -993,6 +993,27 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int lnl_enable_dcc(struct xe_guc_pc *pc)
+{
+	int ret;
+
+	ret = pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
+	if (ret)
+		return ret;
+
+	return pc_action_set_param(pc, SLPC_PARAM_TASK_DISABLE_DCC, 0);
+}
+
+static int slpc_set_policies(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.platform == XE_LUNARLAKE)
+		return lnl_enable_dcc(pc);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1037,6 +1058,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
+	ret = slpc_set_policies(pc);
+	if (ret)
+		goto out;
+
 	ret = pc_init_freqs(pc);
 	if (ret)
 		goto out;
-- 
2.47.1

