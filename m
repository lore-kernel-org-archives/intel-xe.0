Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48844C02194
	for <intel-xe@archiver.kernel.org>; Tue, 28 Jan 2025 22:33:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF5910E715;
	Tue, 28 Jan 2025 22:33:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaU8eCtn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55AA10E714
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Jan 2025 22:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738103595; x=1769639595;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=g/ZbJe6ZPrveP5wM8w4IC6mq7exjIMLgUXaBrFbKgvA=;
 b=FaU8eCtnkaDl4z22VuqSpIDeY8sYUfl8nfsGZC3R+Iz6PhrK3wP51x5t
 5/kKhwslz+HB6Qz6c5BGMGxZDw6KDWJelU7QC8ojbfAc0ayRgxTfK46xF
 8cd8oQYSl+fzM7PcVykT4pI2x57JVzt8fempRAKr1qq2i4j96yP/sWjfJ
 g9f6TFqc8ICBkbHnOjj5jHTwDEkxPXFGvr28e16pdYq1E5ELaw0STIN0g
 P4yWbhgo0DZ3RMme9h8opSALLa03nD/2FcY4EFJAqoVVIuVfd6BBfzmfk
 pcAiktzpfEJLaJCatBQnqtc1dfQPpzJUYcoxmHJv5l1HabcKXO5XccXiP Q==;
X-CSE-ConnectionGUID: IO966Oo/Sa6I8NY/Ff+fTQ==
X-CSE-MsgGUID: JZS9MW5mT5OFY5UTcAbjHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38860959"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38860959"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 14:32:55 -0800
X-CSE-ConnectionGUID: 6QTIqZoJQE+JzR7mho+v2Q==
X-CSE-MsgGUID: m8hyOzfCQFGaAO/GqKv1uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="146067489"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jan 2025 14:32:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 28 Jan 2025 14:32:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 28 Jan 2025 14:32:54 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 28 Jan 2025 14:32:55 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrwjwuOdUpDppxPqwXIe8xVdET2BRWTJABz80Ba36sivSknO95pWseVixmQJrI9BdxTgKZ7dhjFOq83mXRV7ZzUtsriXasKGNTspA73L5SK8LNmVLXNW/IHyjAE8buSH53Jh/xhKlvPiUNrqfHcg7emAwFHQbUlogNr7LtGuUsve+lbMAq6pPC2IXhgW4jnL/KGQuw7YD+dvBGhqxW9k3qrfP0Yc2x04DWKMzaK42KRpJ5f1lA5ZExde9ykm5O5GG+Gvib9+eTR/tfu6tO2C8bcZ+ZsfSQnU/d9Pvdp+aRrlanZSbMMBax1pMZ/pAFOp9DhsuI+c4HtDsIGQiDR5zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vV08+mwqD4ubXcYpyCZWntXVBDTsRVUJyp+g5tt9x6s=;
 b=rbcHyISYUojFovesYyLOAyVhk8tOi4EcXssedgyhHyCQCAM8TKI87e+k4NxnYzrFILWoXjak65+FbWMnLXTO6vCqCJISaTP7TEbMhqWbZIkXyYiyl6PN4/cf0Oye1TRo5Z1msZbrTJC9BYA7Afl2Ryu9QlvLy5GOSoMKe7jb1u8T9Kp3h5nj2AlgD18Lp4MZGMYblWETaM1jQXEJOnBk7yTMTLZhOFFR6/nyaNgXpG6pBGKq0mWI2OsPpmx1vxI4fMZvoxrnrxzfX689s3WHUMtCkEKZFAZx5Hsezp6PBpL+Ni2ZfMG8eGXWxXpxY2Hutw8QbvlokY6LKyl0oIhZxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA2PR11MB4988.namprd11.prod.outlook.com (2603:10b6:806:f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.21; Tue, 28 Jan
 2025 22:32:52 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 22:32:52 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH] Revert "drm/xe/lnl: Enable GuC SLPC DCC task"
Date: Tue, 28 Jan 2025 17:32:48 -0500
Message-ID: <20250128223248.660748-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0023.namprd16.prod.outlook.com (2603:10b6:907::36)
 To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA2PR11MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: 5179554d-52dd-499a-7b0d-08dd3febb3ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MQ0uHl+N184fBNxulwnan8RJYquVAC8mZ2ZHp5ASUA3EcgWqOypWfTT+sIZt?=
 =?us-ascii?Q?gOz+o+h2kgmdTnldQpOGhMpc5r9vSjopcSQ/uMHsL+8r2Y89wsWQbJkE2tjB?=
 =?us-ascii?Q?wTyEH2cwM7VOgtCZcWdFYrvWMCGaSFXLW7cHcvETIpzTAUqPn/XfBBq5vri5?=
 =?us-ascii?Q?Qs0eANlUjf+JUHMcfsh/GpE8qSfijx08BNwkAc1jnfUfETR4itrWjSCaBRD5?=
 =?us-ascii?Q?33KmFQdbYpIvd5pwj6AckCH1AOYFmtaYkO7IZYKoQZ0v3xEsCcX/kd/Rd4SS?=
 =?us-ascii?Q?xwPgoT+QmI1LMI9n2dKARR/7iY2FP1pYlHkeLe4bPUIqYnLBH2gkwllIcRm3?=
 =?us-ascii?Q?r7Cmt+O28eBViYaaXDnqk+MzpbZgjeKC4PLWSFfBP5l5pkFIPUj/t9p5TaxD?=
 =?us-ascii?Q?kJn00e7DWA+r51EOtXdO9MEOzskmQBEXWS050+03PDjOeHpXekOnKBxHVHY0?=
 =?us-ascii?Q?zdikqLpv+8svf2pRDqhC0AwhXbgdREP7CWXnJmg2c5D3fvAgDlTpNLffhQy9?=
 =?us-ascii?Q?r00yuwLNalC8z9JLPqdeNAedic+KgH+xz2KwlNvKk1TbJGwUPHQ3PGmqaYMI?=
 =?us-ascii?Q?pKw5IXNun0p+V6fq2tRs+lZSdL9aXeJD4WXVX/+8MEEfechk/Y8Obrf+1cxE?=
 =?us-ascii?Q?bbc4R5/RM+sN2MmUDSpvI4HlM/tk+bi1/JX9HaG0OwnWPuy+cRA8Zdx3aTfA?=
 =?us-ascii?Q?5Vi1b4ApefZV1R92sUBAR077Gw4Tr1il62EqVfe9RFm/4fwtUbzwrQQZcVJd?=
 =?us-ascii?Q?jBU39JDtyrdh2W+pgnJgnQqLD67fHkCb7GgB/eKZIABcoh8Eq705QmHaaity?=
 =?us-ascii?Q?6e/Gj4iI8IAOQzrxb5hT/thrYB7UyuPjmurGlrb9bt2LVtY/AL0vOSh7JGpm?=
 =?us-ascii?Q?mHHC4/tk76doavckQP/MUXBp81QqTsyYBaa0yLcEKUd2DPA6eHIS/QpwlFDJ?=
 =?us-ascii?Q?838xfcCdQS8Xtf8ZYr2aAVBmgJBRmKuN8EsPP01pLlibShW55y0rEYMAHmi5?=
 =?us-ascii?Q?9QsjCXLulve+Hjd4Hkfh9AExkKTx9Hw7Lu2WWAHGRbTjSPjJ3lSFHRwBX0D/?=
 =?us-ascii?Q?/NNqSCaqPDVbv9NfhpAqMOlUeLkEzE+5YXkYf2pc8e7Xia/gIbYzPF/UKCfA?=
 =?us-ascii?Q?JiuxnPSf86NR6ehGPVHyYBXva9qWLfwpYedvsfqjvLcJQtA6Ze4DF0ttWhCe?=
 =?us-ascii?Q?7cqncdqgAR6npNFRZkaaf/wdbkFSt4VV6E/TwGHuHQpSXDf+LArx19Gxvlhs?=
 =?us-ascii?Q?otNwkDt0FG6fEufuS9U4CnRJzAUms4cJ/Aee2KwQku07+mYl21b2n5tt8nJR?=
 =?us-ascii?Q?+tL6DvV7pIeo25nPTSrT3YrBxZVOfzxDAZy8rTSxmbUnELgkfgNO/SPAPW+F?=
 =?us-ascii?Q?tMFiYyyP9g+V2VCNGhpIN8M+6/hN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X2qvA1bCYx2JaLzOvD+g2R1WWbSxurbHgHUpCzNwnxorXTrw9JilhUzPWUDi?=
 =?us-ascii?Q?gLfXRL3n9VKJbLdAkIdYKIe/XsWV3EX9n4YTdDsZ4Tbx7quHxck0f9RvQiZT?=
 =?us-ascii?Q?uLS/FxedONj68mjvjwGVGxnMhWD1Y1OORTHfpsIacWcMtPjcmhfcuhaPLgXJ?=
 =?us-ascii?Q?Bp1n+1ri/D85efhkGRUS1b4OtBvOEG8MwIcP7b+gVkStmcnDx3d0S9jfdNhj?=
 =?us-ascii?Q?uuprmjIBxNwX0OBqkscFwlpeltKUefoZIG7gkK4apaRgN1JwPcls8MfxnOdD?=
 =?us-ascii?Q?n4MsODW4qzmj6PeoU5V1QkwZIb70WbG6jhhpO03U/Sd4Var+l4U1Q6W1zBmK?=
 =?us-ascii?Q?IbQ+fjJAZRhWeo3vF01cLXd1oA/GSrucoiMOeWgxpFNrb2vQjJjUXuexODnh?=
 =?us-ascii?Q?G5gHnA3ech9u7R0RuNXYUwCHnxN0NqSQLaItGVtC7HH24QLDsWaEVbmntNI/?=
 =?us-ascii?Q?GA4fJ+2S7r7JPmvfXvf/HSbKnjwfouTqP+F463HNBHSuhKn+j6pIKb4SyZAn?=
 =?us-ascii?Q?4t6wHpmzG8ctaqtfjSkDjR7hxR+tMfoWZFhhu/scTT9gUtpcTCdTcm2fSgTB?=
 =?us-ascii?Q?Hp0hRPJgiSeFZNirjItqlE1qRWIaFUSr5Hcq6M+kaxQFNEGhCJXlQPJ7ufH5?=
 =?us-ascii?Q?FHFnFERyls0EYZC21j4IcS/h6dMZeSWaOZAFDXWxbkx/5o1yODy8BASSGuIU?=
 =?us-ascii?Q?n09Xday+SruOzJD6aKmCM7/rmihs/5yfBwgaGcYMKNEk5WKdJXwYxX3l4NwS?=
 =?us-ascii?Q?89UUFa+NIbVNM3R+6ImrS5r9m1vpHBOB7//X2SQU5Vn+rvtK0UW2I4R6vD+O?=
 =?us-ascii?Q?goGPefd47yZzQzJv61tuRQcp5RE0cv8fzKkAvX6rFXQD0y1jzMc/y9wAX3t4?=
 =?us-ascii?Q?LYnBo9C73tIwOkNKfS8B07Xh3f9Jv3rIb8hKnjJ0ZUEanDfDWNdPbuGz+Efu?=
 =?us-ascii?Q?T+pb21en747V6JXr/gMAERa/l0dkMrL8EKePNePEIdcXZPJlf3BeIy9ESUwp?=
 =?us-ascii?Q?L2tAYsRJGaY2FxG4HWvu/l6cKEm03aLFr+049pScqSoJCdR3QDDS2yu0BvqZ?=
 =?us-ascii?Q?C9GFQ/EVXEXnt24PXCDgyODEHn0Ym8qF+FpzDBJ3YMoza5PhIdfmjK/lgQZA?=
 =?us-ascii?Q?QcdzyqLOzM8jdSlL0Md4fLzB5LlY6W2+Wnsq3hHw6/Um1/AvsIN530eVGFh+?=
 =?us-ascii?Q?zWZpRXCQASajepwD/ZV04M6HrHeKjbqZ2Yq5fj86FUJNJ0kvKelbZbQcbaUK?=
 =?us-ascii?Q?15cVuK4TvyliyRLljReciC3qPdUQW/0E9ZtHWX8HkY4wvjhsckhjJws1Q0hl?=
 =?us-ascii?Q?hpSLjeC9orSCAGrm7PlTfP+dF07QoXq2wKLaW1rBY+mrnGYZMnuTjmlIjXeN?=
 =?us-ascii?Q?d6JL3DoX+HdfFQQvxeIHfbZGfQPHLfaYuWzFijRjWR7FQWu1vokVju+MpvgW?=
 =?us-ascii?Q?eHD+owGA+n4olscTK7Rl39NXucg07znOupTsAxQySJfNyU70N1sugZIMocVT?=
 =?us-ascii?Q?uwyRwNou50EQfZ1Dszw/abouTeIgrT6Q4TxzPaMQTcuUVYHCfVauJDriLcCq?=
 =?us-ascii?Q?Ca0PpV2auNumgvxndGFtgMFrreshT3prhNIRmtx3kI4bVH7GyZBsGW8Tx/A0?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5179554d-52dd-499a-7b0d-08dd3febb3ed
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 22:32:52.7378 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s+xAD5EX5n0YGD9Y7SEoMJIth5JJflRcdkh63hnyVNwgzH8fhy2ZPvWAx94/kh2/VF18q0axZvvLagJ+GuyUig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4988
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

This reverts commit 50554bf3e56dd0c78ef1eedb685d0ab36c9c9987.

DCC in LNL should be disabled. It was a mistake to decide
to go against GuC platform defaults in this case and this
could lead to regressions in some TDP limited scenarios
instead of helping.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 44b5211066ef..43f9617baba2 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -993,27 +993,6 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
-static int slpc_enable_dcc(struct xe_guc_pc *pc)
-{
-	int ret;
-
-	ret = pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
-	if (ret)
-		return ret;
-
-	return pc_action_set_param(pc, SLPC_PARAM_TASK_DISABLE_DCC, 0);
-}
-
-static int slpc_set_policies(struct xe_guc_pc *pc)
-{
-	struct xe_device *xe = pc_to_xe(pc);
-
-	if (xe->info.platform == XE_LUNARLAKE)
-		return slpc_enable_dcc(pc);
-
-	return 0;
-}
-
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -1058,10 +1037,6 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 		goto out;
 	}
 
-	ret = slpc_set_policies(pc);
-	if (ret)
-		goto out;
-
 	ret = pc_init_freqs(pc);
 	if (ret)
 		goto out;
-- 
2.48.1

