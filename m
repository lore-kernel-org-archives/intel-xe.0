Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2763FC0219D
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 21:08:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4ED10E3C6;
	Mon, 10 Feb 2025 21:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cv4nhS4d";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45F2910E3C6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 21:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739221700; x=1770757700;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=AYzybi+CRoFeHZ+/G29cvZdMvHP6YDQzEyzHqZDxcM8=;
 b=cv4nhS4d+J22YXsGh1hyxKNBWZgI+m0ETqg615+jtCMhxtx6BKpIbZuN
 u/UVBm5bRL7sddOuhfRkjXz1p05xVSbWKQYprGxrVOpgWG7MaA9bOZXub
 uuTBm0/osVmeF0qwsLVJEsnVSH5u+1HL0/5F5hlrgR2dqf7BYpatkT8lp
 V8OIuEAY7ak6bbLaiSi9Pvml29VDybV4jpEdAcCoVwj3EI4M+iYJXw4ww
 uFJ6JygVm608mYzLt906REUvzilsrv46MyyjKmXONnfmA9wDVVbPpAfEm
 zbJAjwyeFo2jYeNL73rsDgHujVNm9XhkWenm3xzJGwtkAJpvO7IleqExt A==;
X-CSE-ConnectionGUID: uBiy3B7JR4af0iP9mad2AQ==
X-CSE-MsgGUID: KRjw7FLcSz+vDQ85s9hXnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="43586030"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="43586030"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 13:08:20 -0800
X-CSE-ConnectionGUID: z88aJr53QXidAD6hcuLaMQ==
X-CSE-MsgGUID: bld3uBC2T2eltXDpttFtBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117380988"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 13:08:18 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 13:08:15 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 13:08:15 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.172)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 13:08:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BnkTZH6pPx0KQEnbM+iKANxmaTSHjhquyeHNfoIUbmguuQ0ERQgazez3weq9d61PtVqcTELelS5wd7UP7HXRpGXaZFgkFRMVC+dRiK5RP5OYDDeAEeMZcYWzL5dvJKuwP451eeR39yNsPUS/0XfnM33LU5TBezUHRLXh5+lSR9IcuCtubepDnM7/RmcxknqirvIzwoLTgsLPh3GSwTWCsRuEs4nvZ+sbeYYk0l3I3Jfp+Zxv/61QIFOYmum9bsgVnurvornuXiEHt5dzl7zzESi+XNBsB0cdRDPM3DQnUxf2SOt6SBxLyDqEk2MjLoWuRG056dsDm40UqsW8nHYpQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pa9tzqQVkc5bxr9m/xFvoEXsOEVTHrTXaOZZlYJpBxc=;
 b=HAyv2Jz+d49Mez0UgPlM83gbFhF9GQ5/Nv8qJVrI5/3wcuJbx33+B3OdO7f7SvsBx2qPA+ohHfc0XGVzmdHuM3S2jVDm7pQhEhe05ChYSJ82jxUfALU4Q4QJ5dmkQIWnapwe+P1V+PMJUloGuqfI5vneREuRs+H3WJFoMenFpaUM60gzQEAIn5Lh/9K79XjmnY5/d2Bw4V3uiEjc+jbcH7D8IlZAy980XjndJLkI720YpQMN1RTSBDbS0p5C59G6UnfdKd2YAtokv3TV7mQAwiqASh8WYb6Gus153bKGJhJ8pucEK/RBGkQvoiM5QJ+OeOzzD5YyWIhyrLICESamqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB8290.namprd11.prod.outlook.com (2603:10b6:303:20f::21)
 by MW4PR11MB8292.namprd11.prod.outlook.com (2603:10b6:303:20c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.15; Mon, 10 Feb
 2025 21:07:25 +0000
Received: from MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4]) by MW4PR11MB8290.namprd11.prod.outlook.com
 ([fe80::4a98:509:3b05:29b4%5]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 21:07:25 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/2] drm/xe/guc_pc: Remove duplicated pc_start call
Date: Mon, 10 Feb 2025 16:07:18 -0500
Message-ID: <20250210210719.477386-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210210719.477386-1-rodrigo.vivi@intel.com>
References: <20250210210719.477386-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:303:8f::19) To MW4PR11MB8290.namprd11.prod.outlook.com
 (2603:10b6:303:20f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB8290:EE_|MW4PR11MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 853f6e65-f807-4156-14b9-08dd4a16eb2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Rkjf2r7uw8GU8c1CjqrQJBl7kXLWzsKkCLfoH/B3pFq2M1+aF2qh6idvGoi?=
 =?us-ascii?Q?k93C/v26JJMTK+Q3wuBlT7DmaxELFvdLWKDPVjqeGIPP3AS5sF6hDSTplq97?=
 =?us-ascii?Q?D8GCPCBd6ZXghdSpc33Cere0063Bqq5Ly3HMXAv16y2WlX5/pfX18PrXCB+i?=
 =?us-ascii?Q?sotf/CNImUvKdpeDEnyoIshwilpIZ40x/nI8M+2AADRvxqQ5V0KVvqdLFsTl?=
 =?us-ascii?Q?ybjb7aLRUlkLJk7HSJB/A8JsO7Ryc8fLF+TfuN92FgOSZd9p9oYrMWI9iacF?=
 =?us-ascii?Q?v4wyCu/Yb1XGuyd4UWyLcCTTKmPrHEMg/7yeSenFxwnoqhNsxNh2V7xx9zjP?=
 =?us-ascii?Q?5qLA16VZTdpwZJfq5QJyqByoUej2sQfwtuN/2dm/xoT+xCCViMbJKfIv4uqw?=
 =?us-ascii?Q?A0EaRXi7I3lvXBxhCg/tQr50JG/JaaHPkcvMP0nmLf6WUFA61l6hvah0D6k8?=
 =?us-ascii?Q?p/vi71A4rDH5J5xd+Uwc31ucPHzBvWpcd/XqRWc5UhG9IjGhk+ylkcg08IgX?=
 =?us-ascii?Q?vVCham/gz39HwjjKWsAksqm8vZQ4mZYcrmkV8kCLObANSpBV8rofoVfDK0G7?=
 =?us-ascii?Q?oj8LJctVci2rKdUDqxkieEQhUR+dWpB+RIRZjONpTYIF0VRwa+Ez78JH4MLC?=
 =?us-ascii?Q?VNH1WjKf3Xbfc57SkrXCgujWUXd0bdJQV1vCr2hJIE4+FE1E1UW4sq4Z8zk4?=
 =?us-ascii?Q?hyANiy9F7yMoI+jVNsX0W7f2p7Yf2MLzkAzCe2CTN8SzDMr6g3QxK+KSMGqU?=
 =?us-ascii?Q?eGtR/eSi1+AUeOUEftWJHSLUKSRXNfbUndZOrgAvpT6Thv2t+D4zmtWTcwcb?=
 =?us-ascii?Q?SSgJxiYiElrNQkJYQL6Esw1wGyPMd5OvpIQc2SNFYpB8LmwIVGyJPZM2qsa9?=
 =?us-ascii?Q?QPM63yBf8Uui8xt+rnWmvdljZ8I6fNgcVh6O4PuiOECXAmpkzSneheLspjND?=
 =?us-ascii?Q?2+fmr30uF83VoNbEQXvREb2RKom+6//0VXWg3r/xL7cknyKjz120Jpa/7mY0?=
 =?us-ascii?Q?AQQCFetDUxKlTFz3NDKQZ/BdyVWXu29NEPBAOgC60LdZKNBip1gSGqc84okC?=
 =?us-ascii?Q?z10vqreqX0GkApV4DeAYpuNiMQzh/K+fAX5LEGVkd9RlhOfKYdzhuEi5CDOe?=
 =?us-ascii?Q?HQwBK0m0lGd95s5b4MTsDjVD+gSJ0BX7MLTRVxtePwKSs0Boj6BeTVCTEmim?=
 =?us-ascii?Q?KbnWorwvIWDFPzGLEJb7m/jXgEXXbciOdGYYRwp0Wf1/QIluKqUm+De5MxBn?=
 =?us-ascii?Q?rGim7BO1TbDUW++F7WqWVNWd60id8iCJzOFfP9HaUdhHTcdNS+tAOhr1b0sR?=
 =?us-ascii?Q?NudmaYPJMpyojfMShAEpKbXeV1P/Wq4bQCm5oQelO48+vxfC2WSahFUZj3XW?=
 =?us-ascii?Q?rGBswgxmP/Dc7kB4+Yg6zjygmeeG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB8290.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4plGoYFKlfdtKk6IcuLTjVF1oY6SQNNOK4m/ff6kzCPRG3coeTLBFj330ERP?=
 =?us-ascii?Q?VhZk7bcfCb2Ll/2Msrrh3NovlHsk1ZKvx3qPEjBJB8bL/tR6Ab4SN7fGArw3?=
 =?us-ascii?Q?A3tCLpM0a8Dkgl2eMMHCmWBQbIjASBizFUDNyZlwj6sWqAfrFocls2YlpX0e?=
 =?us-ascii?Q?AHRKRIuOjLAtjilLfja+7P2f1DngsbcI5gOYzF9JNlv5rwuYAvecsVhCWkyS?=
 =?us-ascii?Q?48fJsmVfbhDPRcjALB7AK7B1c0TzsFphluxqv8GtnE3dOeQCEwsXHCw+Cj7Y?=
 =?us-ascii?Q?5i9NIlqhgo1EsndhVHhPpgaRt5RJn5anDiFTxI747g5W95joWPeU4iTH87TN?=
 =?us-ascii?Q?zmM+6WxgX20yiDA+iCbxx01pySfsG1zpbPqlqMjeAKGVWccq6TcMUdnKbyrz?=
 =?us-ascii?Q?19Eou23DuxnP4LoFALoSU0Jr3fykivle2Dzy5DSArjdkpAV8cCeeNOjpvf8M?=
 =?us-ascii?Q?Zb3Z2zEQA0/jWaeUriAxJ0ZaCA/vAwqCTAzjXOjkIx+ay5oSF6ZMfCYhbll/?=
 =?us-ascii?Q?IsQupJW8n5aeehbv+BMQLXSjO9uDOCOz6UbQ7JcPzqmA3Hy0AsejwOsuyxbx?=
 =?us-ascii?Q?3b2V7gg1R8rhqwiQfcOelmPX4zVe6zzz/4F21MPrHOgY3DkUio/yTIVoL4iK?=
 =?us-ascii?Q?GR3kvg5TUJQZMICEbXUq64sRl7Qc6t4JoA65zNYcViTzSpNw4rlZpk9TwqAn?=
 =?us-ascii?Q?10pkT4EzJi2tHm65Mw9L1iz6ikookGzVj0Ao17UoMMPtdDpuBcAJKpOA4/kC?=
 =?us-ascii?Q?yS5yo0aG7+LqBkVDxTNu10atQ23WXIvVHxT9jeumU0/KvpP+Y5dV94kKnbaT?=
 =?us-ascii?Q?PYrArwDyydnbMNhjbqsDgmrQNu4A5ZFAQpazP008FK94kDHpbeKN8Z97VBBh?=
 =?us-ascii?Q?IgurgdWeiIA9NinqEgUew79ifXixGsjAndo5+NOsSl/vlCQaqNMqbTduBXAe?=
 =?us-ascii?Q?6duhhGdEdwEpGQ9t0V7DRAZSXk73idimGlj/qddmh8cGwvlFfHerS8aWBKqD?=
 =?us-ascii?Q?nu3rQCwGyfo4dZohryXF//K4++Emil9h6oS8u/GE17WS+sS7sjsO4yUN2gXy?=
 =?us-ascii?Q?7npZ3SvIDPkH1InOni2GI+zJ6ilW4BnGZRR7jmHDRiIx6N4/F6VZ7SltZwuw?=
 =?us-ascii?Q?GRLwQEPxRFQkijBuYEtcO4QpRVPmlohEWZlnoxFHapPf7KQscZx6Nr6aAKoF?=
 =?us-ascii?Q?ob+5N0F9R1KwnYz3TGVfhTzib0osr/1A0p2r6ZJv8p2tuBl3VJfXHAx3FGYn?=
 =?us-ascii?Q?HGHm4EiKT50yltV2fvTCt9eT2f78+uR1Bp98Bcl/WjzhkyRmFt7/n5UOaXxW?=
 =?us-ascii?Q?gGm8XYogvDvnZQBmimcL6A7WUEJ5+vM0+ZjQUSAUgLcADO3K455mR6vVS2jT?=
 =?us-ascii?Q?Q1S9VJcJQqy5luLxqFHzqhhztjK/tEG7kqiLiKAomWxXd6BiwYUSCr/YuDrE?=
 =?us-ascii?Q?Y+uQab+vakrX6WP5Y5/hLJmBxRlvu4/8w0KsPHPyFi5rvF7CPCkBQimkea1B?=
 =?us-ascii?Q?7K2OBMvOmVrJ76OcTEEHEwW2YHyTxND1GuuoAYDTphbbVphvEUb83VfdVNod?=
 =?us-ascii?Q?N/sMzr3/xD9aDmQOpOnbH4ondUXSJA+w/2sOf++/t+Mlrb1r2DJiWDX/bTrv?=
 =?us-ascii?Q?/Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 853f6e65-f807-4156-14b9-08dd4a16eb2f
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB8290.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 21:07:25.5436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jcpv/y+sCxO5XNbWnB29iHkCmMDBo7oVyHmiu9rbOAVRLGaDydAigoDadjFjptvSenAHXgEUfb2ucP3xoZMs4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8292
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

xe_guc_pc_start() was getting called from both
xe_uc_init_hw() and from xe_guc_start().

But both are called from do_gt_restart() and only
xe_uc_init_hw() is called at initialization.

So, let's remove the duplication in the regular gt_restart
path.

The only place where xe_guc_pc_start() won't get called now
is on the gt_reset failure path. However, if gt_reset has
failed, it is really unlikely that the PC start will work
or is desired.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index 1619c0a52db9..eaa035b25aa8 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -1491,14 +1491,6 @@ void xe_guc_stop(struct xe_guc *guc)
 
 int xe_guc_start(struct xe_guc *guc)
 {
-	if (!IS_SRIOV_VF(guc_to_xe(guc))) {
-		int err;
-
-		err = xe_guc_pc_start(&guc->pc);
-		xe_gt_WARN(guc_to_gt(guc), err, "Failed to start GuC PC: %pe\n",
-			   ERR_PTR(err));
-	}
-
 	return xe_guc_submit_start(guc);
 }
 
-- 
2.48.1

