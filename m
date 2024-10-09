Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B05C1CEE33F
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 18:37:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8211F10E7C7;
	Wed,  9 Oct 2024 18:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AqQsSpnR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D1310E7C8
 for <intel-xe@lists.freedesktop.org>; Wed,  9 Oct 2024 18:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728499027; x=1760035027;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=xqotrDkeZWRI9xzhIJuafA6bKSCYfXoXnhKF0f+ySEw=;
 b=AqQsSpnRKZj/qgWSGxU4UbjFoR4XG7eUvntC8fjkdCifG0tw1HYflO2b
 7yLx4zydUkGuvR6NzMb2silcnckqN+bCQAExVx7jAA/ipb0YJr31dv96H
 B4Ibzh6f6DrMyfevf5F/NV6TW2ef/K34me8RnZGkZBvZEDCe5YaG0sM5f
 KeglHtot85afKtTatSqIe6nmzgKtLixnZiLyLLtkcQnjWMraeyotgILXE
 O48VMzbvf4ugETLUKiGy/nBro3UNtQfHJd/+Y3JGpLErYQ0PlCmhh9ZVM
 xpbWmXDNpy6zX5B6sL68lcxSFeohbJm2g06WOYFlVJz+oGI8SsfnRHRnf Q==;
X-CSE-ConnectionGUID: F0sfF3d/Q3+kRAaFvlQGSw==
X-CSE-MsgGUID: gX8QRW1CQ6eRFIENgJR3MA==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="45340297"
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="45340297"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2024 11:37:07 -0700
X-CSE-ConnectionGUID: oFTlgNqnSg2pxwAHtQDc1Q==
X-CSE-MsgGUID: taGoYDicRE60tp39CEpaTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,190,1725346800"; d="scan'208";a="76548012"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2024 11:37:06 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:05 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 9 Oct 2024 11:37:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 9 Oct 2024 11:37:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F+UE8k9IAai+Zvg8r92qKbjT+xxI0OWxKbvSi2znk2MDblBjXMcsUUnc+kB5WMALINSiJhvgZM8uUme7dXp2e9MFRKqgoxINyIHucG7thvJjBBuFZKkfVa1GS7lS9maKp5hCEMgAzFJzBFsV1c4iOFoLziKd7ZRGWYUwvj+Q9ZbRgX/X71fdh87ciVO5yt4QzOoVZdfjuANx/7Q90sOUMNKXzPvWH+PtKfMXZ2Wf0CXUP6JTvZkQt80qsdhO4ukTN47qUicDZj4mdVMjxqIEInIb1xlxoydosS/aA+TnJAv8ttvPpp4jUYlKqEfpLg1qIFwDbqcOMKrqwlRnfGMioQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WwbCJUC8fK2jNUaWIAnIU1ksxtKXawPKZfPTlT8YJt4=;
 b=IhNdiBkfPls8aGrpbZiIIGJatgFmSHht6kUtGaDr+M0Xw75FAQG2q05ydhQKKwZVKWgxecJPuYkrxBJvh8KfSq3oImUBHeaJbmOs6JWqbZ/Xz9016aMUyFRVzHUt272WjDhioOSBbmKygPP9pNx1AwKxusOJGzqFFHbTLaeDXiU/0MD62TxrZT+iSfJbuonbkTP3YHtiFxMZcjdqZdcIdlv2ETEbWALhLZGVEYp4yOOCkRqRTEnLI4TE4AhJKQV6ZqwWFrXeA4A9Ft38XCzxTuo5Yikb/N94NMb3qAfsvhXaB/Qrj6Ac2A6K/E3L0VWBmTnrd27oPdOQL27nIRw7Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN2PR11MB4631.namprd11.prod.outlook.com (2603:10b6:208:262::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.16; Wed, 9 Oct
 2024 18:36:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8048.013; Wed, 9 Oct 2024
 18:36:59 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>
Subject: [PATCH 2/3] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Wed, 9 Oct 2024 14:36:47 -0400
Message-ID: <20241009183648.36948-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241009183648.36948-1-rodrigo.vivi@intel.com>
References: <20241009183648.36948-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW4PR03CA0074.namprd03.prod.outlook.com
 (2603:10b6:303:b6::19) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN2PR11MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: b2c68a14-852c-4a8b-08c0-08dce8915bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LWU8UU8HwRZ39pkziGw9v2erEq7NYEXCv645tnj+37xFQLEylhnf7fWra3VZ?=
 =?us-ascii?Q?Crgj8TCEr1fCpRnH0Ovib9f/DG2Ne4CE7bEp1T+9j9P0zUN+Coe4hVgM0PcK?=
 =?us-ascii?Q?eDwwFBCbgEW8lkBiNloRN6k0Kue+szGzKz/NvOORWSkmwNVXOqRVJeYdHrcj?=
 =?us-ascii?Q?JMFRUTnLumoJTq79aLQrZOUxz60/FMOMXpT0cpzbPtv6QM2UYuVbJ3f7c0Gw?=
 =?us-ascii?Q?4fCPU8QB5E9wQDD0N52HOWY/+Ys2KIi/vJAmfiX0z8kgrqKtGUQEDJdW0PTB?=
 =?us-ascii?Q?SpwZehtkFB8UpRFDAh+vjynriKLgpvJmw5rfXRiJkaFUA5D3S3LxHtctid6T?=
 =?us-ascii?Q?XkM77AES5EljTuZqFZtGnuI8jduAXkzX7kkiDAhwHl0KEf9SU78qqVaC+7F3?=
 =?us-ascii?Q?41uzgQBOKVaPLvc6PEKxEkhCuK5jGTrRAEOmFq3uQJqiF23PAACmLDbtiEPO?=
 =?us-ascii?Q?03Y7Zcs5B9Q8SmYPZ+umEz+D3MBy9trOAxxwBCKdKxyBQ9sU1JKt0TJq/mSM?=
 =?us-ascii?Q?DA9PGGfPXavdufoEZvbfX4m5SP7qnTnSk57D3rjgu/9ZXuQ/9YruQNwdqRXR?=
 =?us-ascii?Q?TXuudvb5b0OMkNf/RuTirKIur0sPKX8mmxWGKj5Q1/tR5j2REUfxBY0vSPwT?=
 =?us-ascii?Q?TeIOF0/mChKJ3gstbA2DWzpU2ORUugFeDUTt7VWiJDZPRhYcNVyMj8U4GZhC?=
 =?us-ascii?Q?XcUkaRLJFHjPTB6mHNudnmYxJPfM8y00YWEfPH4dDNTdXSXVbeFP7cHa5hW3?=
 =?us-ascii?Q?rQojoIFFN9lKAP9tZryknLthCkN6+yoFWxzkRDEpiwna3WxkKofiXcGFleNS?=
 =?us-ascii?Q?7KwCmCQMghmOjN9BGd4h9ZTqTlBzU1/VIqg0D/vvXlf3puLcz4vt8u8yQGgz?=
 =?us-ascii?Q?54ChBqhsmaGd26U/BubIRh4cAujwKYMvYpUPKJVzD2uSDw8eG5zpn8+k189t?=
 =?us-ascii?Q?Q372itHutqHIfsR9ph5j2KQNts0I06kAJoPEw9xL2WTm3Af3H6MweA6mix68?=
 =?us-ascii?Q?9heWU8/XEb2+yswXtIh3S/rgIj4KP8w1aijhol9nDCIyGtgVT8Pdzb5Ix1vo?=
 =?us-ascii?Q?VgUh4jr53IFiqO5hsU5M/6QWOp4Cm5mzQai+sTG8vc+jGFNreot2Hz80a3dF?=
 =?us-ascii?Q?sH2RtGmRp52aE4f/zKhUk528Tqw7nxLcBImeapDTHNYyKIDFtnK8shKD6Aj1?=
 =?us-ascii?Q?UKaXc7BZhCkxquP6Iz1NvMzqOAN+9I3VK18t0KWDtHHBq2k9VTM1yZ7Lkvl3?=
 =?us-ascii?Q?D19HU/9Bf5aMej6FYIgKiN3QpPNdRawZIn8DhKfPeA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lOSdhcgRO2A7+PIUQD2r2CqRyrHBnkC29faBXM5BIxvrm9kPw1Vl8MG+fGUX?=
 =?us-ascii?Q?9R404pHiHxjN5dtl0QEDZhwild3530tdRjAEZ/G15BzTblDQfL/J5p8tNnKs?=
 =?us-ascii?Q?qLb+YyelVUmdVl1Wh7pU4opr7OuKeDBFtHWG9FHrnk6nPHnlOQo7WD0whhhC?=
 =?us-ascii?Q?vwdquZF5lyrnZiGJVgACF6aBRVgW1jfyiJk4B1/D61eO1t+Ag4QaWH9hlyTA?=
 =?us-ascii?Q?rvY3xv0A41aFoSfg0VXTm4/7NcmM5RRT7BD4GABJ6cTMcsOlkUx8OFIqRhEU?=
 =?us-ascii?Q?SwxL9uGCxjPYJC9SY5gvTFl9PLoxpUGUnVj8WoBBfkWD8iM5Zhd7+rx2aP6g?=
 =?us-ascii?Q?gwKpx9rg8oLKLMimZuOFBTaHhcw3l/cg2k8FOCvs1balfTMcNF0QWBoOytiB?=
 =?us-ascii?Q?G0fPwDUG+UnDp/E4uLXydTEdKR0e7WSM1DHu4TVL5Ix5XRuJ6Er/yJrRyX47?=
 =?us-ascii?Q?beSLtmlB9i4Q+VRX6dkREBoo2V/ERqRgYGztwi7Wo6qWuib+lHtlfSJTGPz3?=
 =?us-ascii?Q?JThoaOZXAXJSLUHfdQtUxXNSTCNBSSnDbfrGMJnbw5vMFS81v88klAxfGmWN?=
 =?us-ascii?Q?07wPhWW1LBloByQdr9tlDHWcl3443ZpddFkBW2bGsIQ6jGGqvCUCVYpvaVDj?=
 =?us-ascii?Q?unMt/SevNhpjMNb+9lV8OGlqkE/9XgBFKxcec/zhm3R/bRKYg0J56c1hLnRM?=
 =?us-ascii?Q?HHURpSjWFnyoPqJB29wInbi0CcZJj+MFeq+Uq7oQmWqzcBsE9nJkEh1OFvlx?=
 =?us-ascii?Q?RXqNjnXk7Apfg8ljrZDR9zJP2pJlpH4fEbCt/OpkMIFAd8lAwJopf+NvdD6U?=
 =?us-ascii?Q?ZlDTxWrfnV08s1FH+Y01XSmkvXvSoUUIZBPEccnh8aVPOOrVz1B0GpCDOz0V?=
 =?us-ascii?Q?/BVTgSwYDw/qXiTDZW1sCyvGuUX1rZOX4aSDF2NiGpEh2x+ZWn/cXwi+Uddp?=
 =?us-ascii?Q?T1TtEs6Ppmi9ATo2HhTk0DWghILVhsDf38Qiv4TsCJII2yxkMnDE3UseEP+N?=
 =?us-ascii?Q?6wpBbDpISD0Bzs5bCZN6/fku/Io2954Xvcqb9TPQdOI5fcj+8EDq3MZLB2xQ?=
 =?us-ascii?Q?bnvvHLY7OEI+EpSaEURZU2mp8LWdm06EZNOwq1Ys6sP2VEHdiuSLoY7/hs3M?=
 =?us-ascii?Q?2MhpUXUJAp9v4g7C6jBsASXdGYNKXWgcktbC2Lh0sBDthpNG0lmXUXTit1Xf?=
 =?us-ascii?Q?27Hy/DxKH/dOVLNuROMZ2R47y7Nl1z4QBIyt0FfqC3L+OziJ/jnsZxWmbrvm?=
 =?us-ascii?Q?269E0Z1cwtAe90XyyGiF7xE1P7TVymsxMKuYH/rtp4vOLtWMzsYGzMKhYruX?=
 =?us-ascii?Q?Y7r5WDvv4z5qlkBpLR3TI/WfC3dfIlhrD5jwr76hP2sHJXLTkv64/hihB0GU?=
 =?us-ascii?Q?LIqgtE+G3b7XIwh93HkY31XmXYkakOLw7G+bTC9Ssuf18VsYAMHeGozC9bZ3?=
 =?us-ascii?Q?FCFS5t/UNUaST+A++8gyEjyGT4ehAVpyk0fhSRCvN5KX+zD/zXghTXpK2t7p?=
 =?us-ascii?Q?bvd92tFv2WmK0gtncUTIwzuy3NPjkxF+8rB98NlVP4WwNVC2ojCdMyAYrQlH?=
 =?us-ascii?Q?SybsgJv7xIeCDr2ejP2kJQUFnuyYf+Ug5EkSgl1el+QV6mtVgfW6CpSDIf+F?=
 =?us-ascii?Q?rw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c68a14-852c-4a8b-08c0-08dce8915bbf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2024 18:36:59.3547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 83STROdx5TO9CGJWBcRlgzZrUbL8nIgm2P8FAWsqS/E05fRZt1UXMiW+G2Q6auZJbDjYRdzVWOyWunSW+tHDQA==
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

Enable DCC (Duty Cycle Control) in Lunar Lake.

DCC is the SLPC task that tries to keep
the GT from operating inefficiently when thermally constrained.

Although the recommendation is to enable it, LNL GuC is leaving
it disabled by default on LNL.

It would minimize the GT frequency oscilation on throttled
scenarios, what could potentially reduce latencies.

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 4b38523c49e9..d141165e016b 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -948,6 +948,16 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int slpc_set_policies(struct xe_guc_pc *pc)
+{
+	struct xe_device *xe = pc_to_xe(pc);
+
+	if (xe->info.platform == XE_LUNARLAKE)
+		return pc_action_set_param(pc, SLPC_PARAM_TASK_ENABLE_DCC, 1);
+
+	return 0;
+}
+
 /**
  * xe_guc_pc_start - Start GuC's Power Conservation component
  * @pc: Xe_GuC_PC instance
@@ -983,6 +993,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
 	if (ret)
 		goto out;
 
+	ret = slpc_set_policies(pc);
+	if (ret)
+		goto out;
+
 	if (wait_for_pc_state(pc, SLPC_GLOBAL_STATE_RUNNING)) {
 		xe_gt_err(gt, "GuC PC Start failed\n");
 		ret = -EIO;
-- 
2.46.2

