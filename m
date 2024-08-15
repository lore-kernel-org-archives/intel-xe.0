Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9197C531DF
	for <intel-xe@archiver.kernel.org>; Thu, 15 Aug 2024 22:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 927B110E4A1;
	Thu, 15 Aug 2024 22:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WF004LS8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F76310E43B
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Aug 2024 22:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723759686; x=1755295686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=040j/YrP3A676ui0cKzCLVpHepUU3kYPFVSLx1AboJI=;
 b=WF004LS8e+7TAuHM+JNC3SgCnX3k3zhmM9bG2E+hbXaQ1UBuoXBo566B
 2BJvfmwQKmAyPErzjJ1RnBkwW5xER5zP0GTCVLy6zcoIgoBCu7bBz6xju
 Vpny4MS5MTJ+eS0U/5Oy6+Wbo8e2EmRFM/MXO134wwkIs1cabm67w1cvt
 XzYaA13p5EPqc9MgUsBOPCsLlDagOPXJruX3GFlYzYFkeagyCh7RSFzug
 v+xzXjnwFhy9365oOEcKIgPABSbAHF6kCQTk2uZ0Jo8fHnY8SlNz6nvI/
 xUuOClWx5zaPxNbetuRp34E4hA8N7tUrr0k8Dfx/aHsKKbjyujmMJDjW4 Q==;
X-CSE-ConnectionGUID: J9BFDB2ZQKiLTVCqDlK8dw==
X-CSE-MsgGUID: pkkZCTCcT+SvzLJw79xwJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11165"; a="24943254"
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="24943254"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Aug 2024 15:08:06 -0700
X-CSE-ConnectionGUID: EL/gSk/UTXSBULE1rLMryg==
X-CSE-MsgGUID: yWzt7x1pQgKY979+wBWy+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,150,1719903600"; d="scan'208";a="64335967"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Aug 2024 15:08:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:05 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 15 Aug 2024 15:08:05 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 15 Aug 2024 15:08:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ip31nDAYDnk2gpZPmU14p9Wh5Uiw7LfrGRneTdjHgX3elfnz6pkd92XnBaQCXY4yFbDTRil8k2TTgDk/1N+ZXuBBnyJ9mQcJAiDOC3NhxacRfLJqUivSDDglVhogPB6Bjl3tj1OEOarFXFponn8HS3I/4QTq+/qGee2+t8nq6WsxgxizeQiQca6iTkvsj0xZwX6glgJ6uvpkT9WNXoncNW/Kx+uXIf877UVab9M2pU4H6M1Rrcksc3UlvotWoAtXvsS+kRBZpZWqwH5CWpDivtuHywiv2+9SfZU5UaIH3UE7dBxjlykXidj2N071ZaON+v3XKx70xTWGedY2NU+ZVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiY8MN8TKNHhQe2ZfMFjIlFBXWPTUYZFDvvha+c6E1U=;
 b=xB+W2WYlmxKfZdtrxNn/YUPXDz1YRgX40L3BmeYMrXbsSGO9TY2BXFQ4Z9v2nWXyRFwJeoLTOQnTct3T4vzQ3HzBNcXr5JCgDm7wdHw1m7BVneW9V5nx377yYkjOdbckLFSytfB45y5vQDqfAIFNnVV3/P5+g019LVIAh+4NKPByGE6aQksLKmCoZ5qXnfvFGtrb8t+KRQZSdxT+gOUJpgD0PukUtV6TUt3wbPkaqzTbm+MdGZUkckLUK5BvhQOHAPx0NmTwgvhETaAvwIIwpp68QJPMKtVuXASXx0xyt6ZQspPxMr7fHPdAsy5it2kZA8VGO83DCj4lLmRy4fVvYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7133.namprd11.prod.outlook.com (2603:10b6:930:63::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Thu, 15 Aug
 2024 22:07:57 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7828.023; Thu, 15 Aug 2024
 22:07:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, <jose.souza@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 09/12] drm/xe: Introduce xe_ggtt_print_holes
Date: Thu, 15 Aug 2024 18:07:29 -0400
Message-ID: <20240815220732.49675-9-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815220732.49675-1-rodrigo.vivi@intel.com>
References: <20240815220732.49675-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0023.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::28) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: adab2839-dbc2-4472-f65c-08dcbd76b850
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lCrTOxXdOUjUxyoJnYjbAIDke802nEhwKuz+e9PnAoa7IgIV7vAG5W3ZZUd1?=
 =?us-ascii?Q?WYye3wUQuZfe8si8c7QdLyCDy5J3zfWmDFseB6r0QOsvC1k6YIN/kJXtJ6nK?=
 =?us-ascii?Q?f7C6WXba4QUrY1qf55N///WtVBbRQaPSPQDGMsRsOHuRr5bzcTAMsUZDX/1p?=
 =?us-ascii?Q?9Mqq2G9UvttFR7oRzxUiRmkGpNTDGwFJ25scTSnQq1zdDjf0Bg4Lyg33XZcZ?=
 =?us-ascii?Q?AtTLBLIIpPZyIdF/HvMulqXRF55XBIZGPHFNFUGkQckGcvmj2rwoiyzRP1/j?=
 =?us-ascii?Q?KsK0Ryi5SSVynTp13eV+wYO1a06C2Ur3cfZ701WvRxbAw0TUeALslSpljaco?=
 =?us-ascii?Q?4J2/NL2yp1xQGjVBdcnrYC88B62bJ6i6GXC4NNEzeEnIvFwyuv/oEF0d6gNI?=
 =?us-ascii?Q?emHjkmaPJV1OhVBxdK9hG4i4HkEYt+QKVYLcYBRwaOlPlAK3w3EIhfNfBOad?=
 =?us-ascii?Q?iQSMw0auCd1Hmxg5+dHRiuEFb+WXD7QQ2peRoCPa/qW3YfvAkLohqo/cNQCk?=
 =?us-ascii?Q?d9kvB++0uw8znxS26PIHFJkPwekKP2jnpZJp98LQn4z35nY2jmcQc+GsDQO8?=
 =?us-ascii?Q?CWpFYXrEm+f1yTusCX56/CkvLm0bjT3nlPOoEd5PAFtsAl6NMDjRrAw/6dXi?=
 =?us-ascii?Q?w2iMRXtchgTX0ARCov/5DPl3uKGuTO02vl2MA+j68oJHr//vD0EGgPUFipW3?=
 =?us-ascii?Q?84LyTYXQ9sh5AOueMroGdGoZPXud+Elja+2meSFyATKdM3uGYM4aYIuzguP9?=
 =?us-ascii?Q?uRLIv3CRKJV9//baFzURdTkCKSwzQqVph16xW5tSv3X5qROc7uGwQifnUseG?=
 =?us-ascii?Q?rH8m3S9jQZ5HAoosSpR+PwE/SEQM8rbgdee63Okc7TXmIXyJY4VJPY98XOcZ?=
 =?us-ascii?Q?wX2UpWu3brBvVvZW04Kzs0AAoTigfZSgbDD6umIsAcmFAmJtZEPbwgNeBcl6?=
 =?us-ascii?Q?R+VQ1gUW0VMy2Ekkfq0IXq1uedaP3E0qQ9LYXKYJx4cOaTgtsHj/7mNyxjso?=
 =?us-ascii?Q?ArBrsCAoXjHn0z7qgkGK9LThpWWpfGUaeIqXi9SF+NHpZE5sRXCTq4Zo/wjj?=
 =?us-ascii?Q?CnjpdpFz014f8Bk8BkdqgjBClMJAXA2vFy1fOUReitk9SQqjN/sBrpwyDtaY?=
 =?us-ascii?Q?Jn2ilzD9V4Qf0LWwy0xw6fToSWAbLGuemX3d0njrFAezuepomoqTBOudsECL?=
 =?us-ascii?Q?rh2pAfIekoFZXtP7An/rE4YMG/6Pqs8my8ZOSytmfLtlXeeQAVxYCwZqOvhh?=
 =?us-ascii?Q?IRbQ8M3yCHKE8FCWpV9/F9nl0j6qn7yGqDBIyKB5x1TolZhb/q70ZXFQa1Yr?=
 =?us-ascii?Q?ldu0NIsr8+9JdFRD4UGAjfVqdQdO6I568kbrQYK5Oikh7A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?84cb6rkss0ix4UYelGL7f+n3JyfHQCA2l/J088e3V8IC2jHIyUfXfG/CD3PM?=
 =?us-ascii?Q?DeezzGmHe1VZLDBagI6yzRAcxpOnZGjfPc+Y1SpAG6yB7PxRVqMZVd2LFI0X?=
 =?us-ascii?Q?GrzeQeYUBphFpqJQ+Hk1tbEnaun4/mUvxQLiEf/etox2oIWWclUmaZc3t8sa?=
 =?us-ascii?Q?52v/XMx0UBGiylawCosCQ2aMFjrja8nBqa2/xRfRYl7O4NyP3mImqbRtKYSy?=
 =?us-ascii?Q?0yIJu53Z3ARrlfRPkeIRrsJsnomPHarKkB+lnYprxZgVIqmrvseQd0UF8z+6?=
 =?us-ascii?Q?HjTQfJbejZT1OHU3JYvwDtC3qLCGEK+jKVO6McJrzZh9GQeJUYencYHEq1O5?=
 =?us-ascii?Q?XhqTSk6gn8ZrtridfAmiMOa0vDuFpavSrY3jI6YQ2e8lLq2DyieCiSSxWExF?=
 =?us-ascii?Q?/S5M/qU4LwVi5cD9RGeGPJB1i7kxHRnGKi8fM86oemCK/d1nd1cyORLbLnOH?=
 =?us-ascii?Q?9pNhEqxYJTTpNM0kItkCzORKQ32QWKJlAolq8ezVuJfiFrT7znfAGXp37yjh?=
 =?us-ascii?Q?8ji6uBJQhB6znz74rWyV1QgPmR4sYJIKZClJM2+IdoOl/ZBxUKLqBolnwVtA?=
 =?us-ascii?Q?VdyZ4cTtesSfdl/G4QwI9Cc5SmqoPCOYwaEYHmngLk3DGKfdGIOO2pFamRn9?=
 =?us-ascii?Q?efYXc+fObWg4Ub0NKjlTBUdpoesoW0eqfL+FxRwBcqdEDQOSEwEQAinBovYg?=
 =?us-ascii?Q?gh2/krWa9W4IrQrv747Ww6Y60sFWljRKsxBXrRai3+hOAEO978ZZpVz5YWBw?=
 =?us-ascii?Q?2FwftVW4InjyWuqqT4aDWi05WFYCyg8IXow49d1XLAiGX4imrw8GHFjhV08y?=
 =?us-ascii?Q?AZq0nxhannSIDVSe6m4kiSqCyVkQTtRwqyk9+P+uTS3x0c9wyDkqe3z8AbNJ?=
 =?us-ascii?Q?OzrKH9zTOYlgNRa7dBjuXMP8RH0EZ2SYKDejGAiiOZmoL6OhjyfT1ByM+rXM?=
 =?us-ascii?Q?m5EnPRPoAGu3Gu3VaYOvpLVnS5+TwrfJzW+MC8X4tqhzAbJgNTXexpIqAmOo?=
 =?us-ascii?Q?yV2a486DYJzeb8I3IDvbIKa5mJIdsmFSp3YgeBboh+iCs7eDZ4uYV7WYgXjP?=
 =?us-ascii?Q?ok1hkSNJLnQ383IipyOeChv5UahekLvFbHy363LSU6xnVtCn0zNbzmJ1498g?=
 =?us-ascii?Q?b8A1kn7QHYhM4+NIAsqtTMUtp0a8BNvacjKmFdqWTdmYr7tSDbbuAn3v78c2?=
 =?us-ascii?Q?6KD6oN8W/3DgG62xWuQ5raEssD7qt943JsO1TBIMh9q0xP6AzaZ/BSXNih3x?=
 =?us-ascii?Q?avW/8eHs4y+PJlN+QoNs2uRM5xT6PGvBcoYkLxOsN92jrRdSK42s3kwAaJrL?=
 =?us-ascii?Q?JKUgn9Xygvejq7fPvK9Y93GrTm6iRn5pyPREMPLTrJs+VnKSOg6KS4Go7NHk?=
 =?us-ascii?Q?2LElEnxzThMF4GICHvsOQGTeLrybHOA91/7Ex0oCkH+lPL9sAdUEJK0lkZA8?=
 =?us-ascii?Q?rCKsf6YH8GXOeBZamJnn4vt1t/A4D1IIF9DKbRm536CHJ36XtzxjC/Qnbh6T?=
 =?us-ascii?Q?WaIY9p0ipxnPpik0lrfzIwNtGb0BONngTDiqYQ/X8HLX9pQ+A0bMXw1B8RAU?=
 =?us-ascii?Q?noWGALfdfEvdmlGCeApVObll5DBcP7LbpBul+jlg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: adab2839-dbc2-4472-f65c-08dcbd76b850
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2024 22:07:57.8412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MXdyCW3Tq+b49vaNyWqThsEp+uJZX9ayLTND6RngrtXIujMtlGn8I0nPWqmGXyZjSgVRcqjuOOZlTJH3mCAzUw==
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

Introduce a new xe_ggtt_print_holes helper that attends the SRIOV
demand and finishes the goal of limiting drm_mm access to xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c               | 40 ++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 25 +-------------
 3 files changed, 42 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 2d055f489879..960f5a28b7ed 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -682,3 +682,43 @@ int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p)
 	mutex_unlock(&ggtt->lock);
 	return err;
 }
+
+/**
+ * xe_ggtt_print_holes - Print holes
+ * @ggtt: the &xe_ggtt to be inspected
+ * @alignment: min alignment
+ * @p: the &drm_printer
+ *
+ * Print GGTT ranges that are available and return total size available.
+ *
+ * Return: Total available size.
+ */
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p)
+{
+	const struct drm_mm *mm = &ggtt->mm;
+	const struct drm_mm_node *entry;
+	u64 hole_min_start = xe_wopcm_size(tile_to_xe(ggtt->tile));
+	u64 hole_start, hole_end, hole_size;
+	u64 total;
+	char buf[10];
+
+	mutex_lock(&ggtt->lock);
+
+	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
+		hole_start = max(hole_start, hole_min_start);
+		hole_start = ALIGN(hole_start, alignment);
+		hole_end = ALIGN_DOWN(hole_end, alignment);
+		if (hole_start >= hole_end)
+			continue;
+		hole_size = hole_end - hole_start;
+		total += hole_size;
+
+		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
+		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
+			   hole_start, hole_end - 1, buf);
+	}
+
+	mutex_unlock(&ggtt->lock);
+
+	return total;
+}
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 31060fe7644b..67ae5f1602a3 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -32,6 +32,7 @@ void xe_ggtt_remove_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 u64 xe_ggtt_largest_hole(struct xe_ggtt *ggtt, u64 alignment, u64 *spare);
 
 int xe_ggtt_dump(struct xe_ggtt *ggtt, struct drm_printer *p);
+u64 xe_ggtt_print_holes(struct xe_ggtt *ggtt, u64 alignment, struct drm_printer *p);
 
 #ifdef CONFIG_PCI_IOV
 void xe_ggtt_assign(struct xe_ggtt *ggtt, const struct xe_ggtt_node *node, u16 vfid);
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 1852ff45bea4..e133594cc6bd 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -6,9 +6,6 @@
 #include <linux/string_choices.h>
 #include <linux/wordpart.h>
 
-/* FIXME: remove this after encapsulating all drm_mm_node access into xe_ggtt */
-#include <drm/drm_mm.h>
-
 #include "abi/guc_actions_sriov_abi.h"
 #include "abi/guc_klvs_abi.h"
 
@@ -2103,11 +2100,7 @@ int xe_gt_sriov_pf_config_print_dbs(struct xe_gt *gt, struct drm_printer *p)
 int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_printer *p)
 {
 	struct xe_ggtt *ggtt = gt_to_tile(gt)->mem.ggtt;
-	const struct drm_mm *mm = &ggtt->mm;
-	const struct drm_mm_node *entry;
 	u64 alignment = pf_get_ggtt_alignment(gt);
-	u64 hole_min_start = xe_wopcm_size(gt_to_xe(gt));
-	u64 hole_start, hole_end, hole_size;
 	u64 spare, avail, total = 0;
 	char buf[10];
 
@@ -2116,24 +2109,8 @@ int xe_gt_sriov_pf_config_print_available_ggtt(struct xe_gt *gt, struct drm_prin
 	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
 
 	spare = pf_get_spare_ggtt(gt);
+	total = xe_ggtt_print_holes(ggtt, alignment, p);
 
-	mutex_lock(&ggtt->lock);
-
-	drm_mm_for_each_hole(entry, mm, hole_start, hole_end) {
-		hole_start = max(hole_start, hole_min_start);
-		hole_start = ALIGN(hole_start, alignment);
-		hole_end = ALIGN_DOWN(hole_end, alignment);
-		if (hole_start >= hole_end)
-			continue;
-		hole_size = hole_end - hole_start;
-		total += hole_size;
-
-		string_get_size(hole_size, 1, STRING_UNITS_2, buf, sizeof(buf));
-		drm_printf(p, "range:\t%#llx-%#llx\t(%s)\n",
-			   hole_start, hole_end - 1, buf);
-	}
-
-	mutex_unlock(&ggtt->lock);
 	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));
 
 	string_get_size(total, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

