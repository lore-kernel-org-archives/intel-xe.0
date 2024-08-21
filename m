Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ABECC52D7C
	for <intel-xe@archiver.kernel.org>; Wed, 21 Aug 2024 19:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B04610E6AA;
	Wed, 21 Aug 2024 19:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="azjm2VWH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6910E6AE
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Aug 2024 19:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724269144; x=1755805144;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=I0k8XJC6xssSUQJ2pLMQxB+z46DGpNqs2OPZeRqoDQM=;
 b=azjm2VWHj8+viUZjG6eOpT9dmQKErPoLqmc3STM/8cmKBR8cCcCUglQq
 ZZNLNlDGMHDKqCMFHgbXVurzSr2aFfok3N5hJPe99gsN43+/hGqf1299g
 8BKd2pfIATAPs2pIXJdy0801ZjNaNaI69CC8Dv46sYqukDosu6VSrW9Rb
 Rk4D2picw8mr4PccxJLAInClcbckYkAdBGGTFq/tTzAQ7qhiv7f92bHKa
 4j1c+ThzU7LDXgRHrooJz12jTGlb2o0/YlmOqZD+siF8C7dZANPfURqe5
 aCMyUAr6lmoVGnlMLUukUf+pm64q4dI44/dvZhMGtAETaEF4iqjiE8fbp A==;
X-CSE-ConnectionGUID: u+c0jTP2SvuwWnmHdb5aTw==
X-CSE-MsgGUID: oiND0FY2R2mpQCUgdCKX0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="40165099"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="40165099"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 12:39:03 -0700
X-CSE-ConnectionGUID: gyy2cj8IR1etTIocHcL1ZA==
X-CSE-MsgGUID: MGNtZpzmSJqfQfqrt5pJfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="61720375"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Aug 2024 12:39:04 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:03 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:03 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 21 Aug 2024 12:39:03 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 21 Aug 2024 12:39:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ojo7DCW54gYZgnBfhf2Tbo7+9QDAza2mmXlOFdfFdGSZ6MSGgmZwujKvRWxSz8Xbqa9pMst/s6DJkP+ab2M2uYA7XrLK7dYV8/xHCI7/uYk+3UVvWNxbm2lHhL6rs3x5mfp0ODsQ77NfouDLb82BjM3QePHcALW/7Fi4OP7VmEQcvRoKE4Nnju49yKJ26VBO2WArYBpbBacQjKWL/Jdt5vtpHteWbXHEjRNAJC6eaPYzLlwDGs9Vw/YIGds4Hz5VHVb9C5OuXEEcVWOCfP6WbQCjfSS05tAX/DFFaZxFeDI83MZDS7Vm7BN/sHxe/+hexuoSDDjSFgQAsW/Jt52/6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gpu52xo7uZLNR4XVR56Ntg7G3RAYeL/ewVb3peA6Pj0=;
 b=keh5MH+L1IIpvzeyQk/mQ4molowN6SnI60RYvKZDE9ehEz/qvKd5w3gO3X4D04sq62djZC5WXAXon4yy6hfGRKb18uY6AYrytKkmbWCsAXK93hayTKme/+gohTJEUK1klaSgDXqiNdpIQCtwb72kyUHr5IcSUPNRqbzDDFKTgbIMwn9XiwKKXUv/kjq1VazA5ELoWwmVy0tCQntTgp5sdgHiIEseUWqLFsaSkcfUa+E4j2jIgbpDpK/DYOL1akbI8h2ZXji0eNwxKFA8st3vZEv6yRxvweoVNFeJNYCYWdImF9+MSocevlZdr4Y6aTTXQ7KxpM9Y4bX9NFmxUcZ5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by MN0PR11MB6232.namprd11.prod.outlook.com (2603:10b6:208:3c3::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Wed, 21 Aug
 2024 19:39:01 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Wed, 21 Aug 2024
 19:39:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, Matthew Brost
 <matthew.brost@intel.com>
Subject: [PATCH 07/12] drm/xe: Limit drm_mm_node_allocated access to
 xe_ggtt_node
Date: Wed, 21 Aug 2024 15:38:37 -0400
Message-ID: <20240821193842.352557-7-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240821193842.352557-1-rodrigo.vivi@intel.com>
References: <20240821193842.352557-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::14) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|MN0PR11MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fe52846-2fd7-417b-b4da-08dcc218e7de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kVdWnQzO2JBB+HjmjKHyxpLmbHN1LB6yGr6iR+JKYA1HNIafjkWy03+82gYb?=
 =?us-ascii?Q?3v7DmIIqBJwVbcTWzHZS1HU7SORrgvFhnU5wO5w8QmIP91mFhYIRmfO7Bf08?=
 =?us-ascii?Q?Mv1cxCwC4hd3W4ahwbd7zQ8cl37+UMDR4jslkatAt8T9+Y+D0NY0hhzdidl/?=
 =?us-ascii?Q?kyQ6oadIod7Yg3GeRy50hGWsiWNoqeHWqBtxybIBPqFU6XYnLlfu57LRJttk?=
 =?us-ascii?Q?VT1L02QLPf8UIxrdwBw/F7Sh+jL1fbiRMF0XKIPjXZOIIRKjQRxrkw4InSZd?=
 =?us-ascii?Q?7/utG9NPHGtkUEcb3wSU/6sNLFyzXaRFB4018ACF7ExXx21r1Iz+gFBB6y3l?=
 =?us-ascii?Q?yCrayMsbCzonH8sN8U2BtoNmYoXZugBICySzz2hTxtWVTEA/1qZeGYpZbN1P?=
 =?us-ascii?Q?VEr5AF6f12E3aV31TdS27hkUMsyhu3Zz7+wfi/k6Dk9ds/JXeIMrlFf4v1DW?=
 =?us-ascii?Q?ErG9OZY4b36dCbrcO2aMbhBWwM4YlQqL5PSxaRoaKGJAvkAp4T/q6UMSsreH?=
 =?us-ascii?Q?DskBzMfGeDY5Nghd8nruuHEn2MDiD+2QRswAB6T63gPWx5mE1dfmHwVemC5p?=
 =?us-ascii?Q?WBSoCNncx0j5AlrEP/+9jtNWbDaSKB1zShiORslraaGJp1xFpv+xd1TkoC/s?=
 =?us-ascii?Q?8qDo31uB54CZtm/JOXf82ES4VMj8fWGGsgzNma4pgnnnK+yo6rVwv86+jXTC?=
 =?us-ascii?Q?Bg89O45m95nkMC5zx+UsngasTsYdWu3I4Jujh36uqvbnalWNEpgne7EwXZ/7?=
 =?us-ascii?Q?IPEsA3urn+TaLE7euxb4vT2HmE5wETMbvJQLke5gr5629No7sSrK+ikkcqjD?=
 =?us-ascii?Q?3CbwRL+zhNcbjuAc6I6sNfsYxye54Ag1n2TxNv2NAPfUs2yntvi1/ZuOi0YV?=
 =?us-ascii?Q?oJYwQzPaoSfoZ0Q8pS4nm/HUQYuXKTLrX16+IZpkZy+R4Xn270v06JMOFifn?=
 =?us-ascii?Q?9+XpeQTUDfsbYPhp7oi47ff4AKrlI6x3nqhkG3nRjB7j4JzCnQ3QJDzE7Njv?=
 =?us-ascii?Q?B9l2Pml/0q3IZeqpJFAapEPOZ8+6/ZpMDCKioHGN5rLTAWcPqt1LqMIZKCzD?=
 =?us-ascii?Q?OGZnNcPSBg0kyxYmfvn+aOhJjTK0hoSVgX0plr0sPFipxF73090g+aEx647d?=
 =?us-ascii?Q?QftDFyB225uHQKEHXso0hdeleEhvpG/85nJ54KbihuYuX7e+nJbBge5ojCJL?=
 =?us-ascii?Q?9XX+5sYppo/nsra7c3ZM29/DuFZwL+jNO6OtHBk9C6VkdgutwLCMHvIFVcM0?=
 =?us-ascii?Q?mrQvWDWfZgpK3nybU6stWs4BSu/+Pnq6AgH3auyk83W4i1u67UrvsGE/nzuw?=
 =?us-ascii?Q?AV1ElBMdU2NYrynJE0jQPT+ufRsWaf34dKmeiq0JiybEkg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?egQDWDdgse+TW4CYGJZJpC4GcytFLoNdH0HQiqNzUOj/17W0wtW8S1PX5rmB?=
 =?us-ascii?Q?oM00OSGOnI/OFfujjV6fw5K0ghkYp2rNpaoCsy6qgcdUgfO3FXyFWMJAMMKV?=
 =?us-ascii?Q?UieNcjYVmQZiQxgDBDHuaxqN/qO/ozpaWtzb1jwxI0N3MepQcxk4KKsra1Qi?=
 =?us-ascii?Q?fEQd6+5wuecljIsVK18dsRNiMUU8yZakmY0gIwBu2f5vUioR2tpkAzMJjJ4d?=
 =?us-ascii?Q?716V7xMw2k0E+3i8TxZzBm5X4+e1qbvxwX9c/BQJto9p3CNv8peZgyzasgYo?=
 =?us-ascii?Q?tTaX9+BRTVr9BuvsEAgkYeYjRmqwJty/Kbb/Ir4s7eV1n61yuzkWn6njgZPh?=
 =?us-ascii?Q?02Y5uTpF23PNB8E3rJ3JCwB+x5Fo1s7vsqCMPJ32yjPMdlMU4WKX4aMKf3fA?=
 =?us-ascii?Q?4BYw3/sXR+Iyl6SxSBPYzZtSbSY6TclnyONrUSelgz7wFIKZ3t74DS674NvR?=
 =?us-ascii?Q?ZXwGfRfwUeLwb69zXGuo9NGy3BNY3x2FQ/0odU3UrP/9Cc0/68AJi7ope5D8?=
 =?us-ascii?Q?NLl7UsWLtnayStDDtQLxNOW1UXDDkdDwJaSyVsR1q3q9G8qmNgRqQKfZ+oeh?=
 =?us-ascii?Q?FKgt5jEPCE4tn4Vs7gplNhQvzRwE0e7rd7MLQXe1M91UWmeJ2OLufVw7HVpf?=
 =?us-ascii?Q?Bs2+8PeCv2ygkIv33VhfibOvyggSRDNIXQab6F1gAOSmqlmM7UUkVK5Vyw6O?=
 =?us-ascii?Q?VwcdgMYDA+sr99XvfZvkMEnCHogVWCNCV988ebnFiIlMPkIAzVOG+vgzvCsF?=
 =?us-ascii?Q?YZFRD4EdARsfPCVpaewkMkOMKwplk1MRZ47Q0mUy13I08/sA0Y61vscxRU9v?=
 =?us-ascii?Q?x20ClJrjC7iFwZIAvyJFY/B3ID6ZjY25Ofus4lNB7J/hMUVavTbM6z+twRtF?=
 =?us-ascii?Q?NeqnaeVxG2FJVP8wqiygpGAlyVyhdof+SrWlOErqwdraKZBUZ0rRmw+IGCMY?=
 =?us-ascii?Q?q+tGpffa0iA6vEUSUYeomXq4uLmyZYUBUgI6tm6AiJik10kvRLkKfNCj9JG8?=
 =?us-ascii?Q?poJLcsDMyksCd7LA2kHrgn7N4l3D1cx1QfvQvqAtEOz5oFCEoW/OiPZX6kIM?=
 =?us-ascii?Q?3JzT+2rjZb1xrFvt0iA1eSTjzOdtzDD7K5zReHADZgMOenQPdqJyiPaiq4Uq?=
 =?us-ascii?Q?4iguaA+tJD9sPnuOFmkIYMoIHXXyxbUiZNbO2DMcdoJdURfZy3oiCbf3sSpY?=
 =?us-ascii?Q?J1c6riEbEKrts8RZTKPz5NTgGdEep1h9erExx3uP1ywqZa8KuvoePSBsExNS?=
 =?us-ascii?Q?gi6ESTw19vlini2Ju5fgydwXCk6og9SsJfeYcSbBNCsA9d4TcvQOe+pGnvEb?=
 =?us-ascii?Q?i1uopvO/PwY5so2y3KEwnfhdhE0k4ILpjc/mjHOjeaCBQQOEwJ46CODF6e3Q?=
 =?us-ascii?Q?sI+Vx5fE4ICFAzbBQG01XPELyr0kMWP09pis0M5sfS/bsI0u9dnSnD5WaqSJ?=
 =?us-ascii?Q?1q6me8BHj71HS5AH3GvtGADhjzRMmdnL3MHpjO7ZLExgb2ncpXkt++Jx3FWf?=
 =?us-ascii?Q?tytfst78Z9OJQ98Oap+wYReifwvEM/+7nTWDp20dnq9TSDP6TLlzugsMD0jA?=
 =?us-ascii?Q?u5rll8iRg/2ixx9wytGTwLCniuKuWl+yhR6WTj9KmPwvtNTa2w9fiaPYSALd?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fe52846-2fd7-417b-b4da-08dcc218e7de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 19:39:00.8687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27L07FXUs5J0SxNKZWZ5ng9FwuL2jBppG+6ViWPoYB/KP1LSMk6XLfvm87JAZUxtTty/D3eiIdIuh2Qeu/mp6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6232
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

Continue with the encapsulation of drm_mm_node inside xe_ggtt.

Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c     |  2 +-
 drivers/gpu/drm/xe/xe_ggtt.c               | 11 +++++++++++
 drivers/gpu/drm/xe/xe_ggtt.h               |  1 +
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 12 ++++++------
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index db74c3395ef8..de4930b67a29 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -323,7 +323,7 @@ static void __xe_unpin_fb_vma(struct i915_vma *vma)
 
 	if (vma->dpt)
 		xe_bo_unpin_map_no_vm(vma->dpt);
-	else if (!drm_mm_node_allocated(&vma->bo->ggtt_node.base) ||
+	else if (!xe_ggtt_node_allocated(&vma->bo->ggtt_node) ||
 		 vma->bo->ggtt_node.base.start != vma->node.base.start)
 		xe_ggtt_node_remove(ggtt, &vma->node, false);
 
diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index e0da24bb5774..7c8bbaa30fca 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -477,6 +477,17 @@ void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 	drm_dev_exit(idx);
 }
 
+/**
+ * xe_ggtt_node_allocated - Check if node is allocated
+ * @node: the &xe_ggtt_node to be inspected
+ *
+ * Return: True if allocated, False otherwise.
+ */
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node)
+{
+	return drm_mm_node_allocated(&node->base);
+}
+
 /**
  * xe_ggtt_map_bo - Map the BO into GGTT
  * @ggtt: the &xe_ggtt where node will be mapped
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index 5147930357de..f816b3c0732b 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -23,6 +23,7 @@ int xe_ggtt_node_insert_locked(struct xe_ggtt *ggtt,
 			       u32 size, u32 align, u32 mm_flags);
 void xe_ggtt_node_remove(struct xe_ggtt *ggtt, struct xe_ggtt_node *node,
 			 bool invalidate);
+bool xe_ggtt_node_allocated(const struct xe_ggtt_node *node);
 void xe_ggtt_map_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo(struct xe_ggtt *ggtt, struct xe_bo *bo);
 int xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3ca98f8a0eae..947750d97d7d 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -235,7 +235,7 @@ static u32 encode_config_ggtt(u32 *cfg, const struct xe_gt_sriov_config *config)
 {
 	u32 n = 0;
 
-	if (drm_mm_node_allocated(&config->ggtt_region.base)) {
+	if (xe_ggtt_node_allocated(&config->ggtt_region)) {
 		cfg[n++] = PREP_GUC_KLV_TAG(VF_CFG_GGTT_START);
 		cfg[n++] = lower_32_bits(config->ggtt_region.base.start);
 		cfg[n++] = upper_32_bits(config->ggtt_region.base.start);
@@ -376,7 +376,7 @@ static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
 {
 	struct xe_ggtt *ggtt = tile->mem.ggtt;
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		/*
 		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
 		 * is redundant, as PTE will be implicitly re-assigned to PF by
@@ -406,14 +406,14 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
 
 	size = round_up(size, alignment);
 
-	if (drm_mm_node_allocated(&node->base)) {
+	if (xe_ggtt_node_allocated(node)) {
 		err = pf_distribute_config_ggtt(tile, vfid, 0, 0);
 		if (unlikely(err))
 			return err;
 
 		pf_release_ggtt(tile, node);
 	}
-	xe_gt_assert(gt, !drm_mm_node_allocated(&node->base));
+	xe_gt_assert(gt, !xe_ggtt_node_allocated(node));
 
 	if (!size)
 		return 0;
@@ -439,7 +439,7 @@ static u64 pf_get_vf_config_ggtt(struct xe_gt *gt, unsigned int vfid)
 	struct xe_ggtt_node *node = &config->ggtt_region;
 
 	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
-	return drm_mm_node_allocated(&node->base) ? node->base.size : 0;
+	return xe_ggtt_node_allocated(node) ? node->base.size : 0;
 }
 
 /**
@@ -2028,7 +2028,7 @@ int xe_gt_sriov_pf_config_print_ggtt(struct xe_gt *gt, struct drm_printer *p)
 
 	for (n = 1; n <= total_vfs; n++) {
 		config = &gt->sriov.pf.vfs[n].config;
-		if (!drm_mm_node_allocated(&config->ggtt_region.base))
+		if (!xe_ggtt_node_allocated(&config->ggtt_region))
 			continue;
 
 		string_get_size(config->ggtt_region.base.size, 1, STRING_UNITS_2, buf, sizeof(buf));
-- 
2.46.0

