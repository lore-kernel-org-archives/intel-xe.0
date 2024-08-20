Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFA4C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 20:26:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1AD510E2D7;
	Tue, 20 Aug 2024 20:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPChZReR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F3010E2D7
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 20:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724185573; x=1755721573;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=VzSiYljYX8AgmHFI5CtXv7iZUSwOmiaQTnAkCiaKuv0=;
 b=BPChZReRl0dQqJzByRI0/cSYYk1s9NAlDThhAQb71qFOQCU99naK95C0
 EUnInC4aIg8EpXsQI2i/bOaghmjr/O0ib/vVCYerDsSZeo1HXH9GK2OxU
 ujGFBXO3ZGl6IlnGN7OvyYiHVesfNYEctTH/gyd7D9LuoSvXHAIz7I5Xo
 W3f2zVwCvcQok1W8AjPA61al8v+2tOqmxC1ucuPF98QUv/ZKcIAOG/EH/
 BvhTWLjHjjoiFpzExIg1gK36NfkzkD85nnREp9dnZCdu0c02JbuMnfbPq
 7K7ypDGLoiUTWAkY6FwyBxGBre1YFT4I+X8iG+VEexvIWRKRahPwscc64 Q==;
X-CSE-ConnectionGUID: v0w8VkVEQ46ucGJSmgIBkw==
X-CSE-MsgGUID: MIEgp+sWRauW/9OSIUCQKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25413568"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="25413568"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 13:26:12 -0700
X-CSE-ConnectionGUID: x+LOLBW1T8KG8Y/KXUI80w==
X-CSE-MsgGUID: TnJvbpVlRkG2lpNwZ3GxIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65809721"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 13:26:13 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:12 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 13:26:12 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 13:26:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ElsTBqCUEsdfYVAw++xDvvMFVvmZu7ftxycaYyspsRp25cTAiJGXcRq8mb2vvsT9D9vUCleYEO+wMJJktQx5YdKwdKFXy/vgMYUQAu/jR4af161xt6+Qh6OvTvyw4FMxs2xALXn4PxZdrXliEOw1eNpaubQZ6Ahpz2dgU941x92Qpy2/2n8ypCusuUpwUycR3/YXG5KGdnPCG0npaMpGnRib+KcL8FZ+hppQ9HuAGPWbPlF569FOGKTskI6FoWiQkuXYD0l3gQ4ETuEgZ+m63HGWU3jRyLCvo/rEzwYx3qCmF8YnIVEHvWljFUUrrXLaoRG2w6at8VyHGoIBC+SJag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sVJCjNogDncuDE4OuwLFEzLj8N0KMbBT5xInlRdCffo=;
 b=spSeUUwnR/d01+YgZBoGDKbEiiyrcG3RrQmmaVExrXiWOHMGWx8nVi8x00nEoEIbfXg2usfiiY/69pYX/G0ZYl/p3assF/4ax+/tdPRXbFifMjU9kQyEbzzNGRK2s4lJDQuVRC7tVm90tvDlo+U2LeOgGgEHNAVCybsBamaRuF1ngzcgj0ftGzsyVDIkl+oPgWafubiWmrCQ3YarvegtG2MpbkMeGap3Z0+Tsa4vjq0c68hssoSwkf7bHE9kKDKlepXPTznvpnRsFyDwduBnFFfVkgsdRMl1mrPhetoxYjkgejiiXHoJmsTxu3EhfQ+DL+FMFHEUftxSf8y+aVmvww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CH3PR11MB7724.namprd11.prod.outlook.com (2603:10b6:610:123::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 20:25:58 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 20:25:57 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 "Matthew Brost" <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Juha-Pekka Heikkila
 <juhapekka.heikkila@gmail.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [PATCH 04/12] drm/{i915,
 xe}: Avoid direct inspection of dpt_vma from outside dpt
Date: Tue, 20 Aug 2024 16:25:39 -0400
Message-ID: <20240820202547.300257-4-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240820202547.300257-1-rodrigo.vivi@intel.com>
References: <20240820202547.300257-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0135.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CH3PR11MB7724:EE_
X-MS-Office365-Filtering-Correlation-Id: 38afb75d-cb74-4aea-9228-08dcc1564c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZnghcetQA5xGXJOyb2E40ro6so9uqJiz17pzjOd6nEegT0gOZlMuz0FMQDry?=
 =?us-ascii?Q?C3yckmo6VkRaUJhH5GrmeKD9uNacf7EEmWjPOYPMTsSCnOQejENHuohvJIdq?=
 =?us-ascii?Q?BdtgyIAb91YQm24ALMu4FziKgWphUT9lytQPDO4x+L9Q2/LbPBe2s1nLcMxK?=
 =?us-ascii?Q?qio16JkL26M7mNXZKW/xmMZv8eN63b4OsQJ+5KyyV3BcTwj9Wt9sJNhymLuV?=
 =?us-ascii?Q?EszbPQ4sYPx77+/AvE3L52e+wRdPF1iMPr9pGc/hIDTDd7JvxF797jPQ5BCm?=
 =?us-ascii?Q?2Y8GaRxEae5PtUtLidGfB3WBSs1FF+I2bUx9/+mlY0WVFiQLHvqoHNCYn/VG?=
 =?us-ascii?Q?ii5jAHWiftbbH5xC4UT78UhNwgSPXdpZqUlQWjtUcb22P5E0WSRT32mh5dcY?=
 =?us-ascii?Q?Iry3FTJFH3tY4AIg7JvJ+m2i3TTjL79/jajtllZu0mvWLFw8JRFtAbaJi8vt?=
 =?us-ascii?Q?IDk9hNSRdp0bd5Hg9guVSa8BUTEbuDCFT5B4uwcdEqVkHAw54Xa2PrWDp5eg?=
 =?us-ascii?Q?2mpuGLPCx3gxv4EsIDw4NqCxbY/CCQDw67QGRZbSwnxywhGtA62u36WL/nO+?=
 =?us-ascii?Q?V86jIkZvTGr39LCb8Hsx3MNc4Q1aNRNaUwoWvhEwxc6G00tWb7AMJV1gudfc?=
 =?us-ascii?Q?iQZDJFpbm1FQH4DObYSIv/Ec0RG5MzZCAay0Vz7wR94WmOjZHCh6W72Qyxdy?=
 =?us-ascii?Q?SrxhnKwNM8ojjXIvT3txfvGMFUmUl3rdMTr5MV8AuGUV+K3nvOzTaHOZSTdn?=
 =?us-ascii?Q?PAblrmWSrU1x0UmQuCE/Kx+r5pD9iDTCA2ApVk1IKkXrqMmsg/p6kOfyGPdF?=
 =?us-ascii?Q?ovcDM+cNuG6Ko+Xm4DmINPBje7304Knh3Ia7apdbTazdcTxVVoXRipIVgK8b?=
 =?us-ascii?Q?he8WKUd+Xy89wUF9eXw4Z5mJnmGUTurnvKjKLMsnXbOZ+Jro39iCiI2vFc85?=
 =?us-ascii?Q?4tgoaBA2xF5rOKadl26eajEGWxvW+7xnRk6Q0cjch7Ku/XRw+TLfvNcPQHhw?=
 =?us-ascii?Q?W1tKsEdLIu9SnLvXdqDgjFx4HFj9TA+pQGrwIhMSGCshhopEV7stCL8QXltS?=
 =?us-ascii?Q?VjChH8aVG95duqmCrgvkJuH1VgHjGEAJIAl3wOkZ1rv/05du2vkN5mAbjf6O?=
 =?us-ascii?Q?gwQY8n5RPuLfEnD8QISRL1y/eWgtUMNkvqhkn/KqirlgpnZOmDFuXXbzSrxz?=
 =?us-ascii?Q?xxM0D6AkbeZv+Wl4LvBlCL8QpZ6/qvTqdebOSAH7LXvwVs10w28lPrT13XOy?=
 =?us-ascii?Q?mUB/JRviK9RQujkCWo5ByJGk8dfvDWRlDw7XKH393GtGBb42zTWGJkmrg0Dw?=
 =?us-ascii?Q?Cn3Lc1A4WkHRfVqXpk+1CyBL/AgJ4RGAhhoDPm/OzwMXIw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1QdYiMCv9xIVoKumy08FOZNLLsk4TPG+5aff6mxMRpLmy9uNLRJWh138a9Yb?=
 =?us-ascii?Q?nLog42z/cgec6uee3+7v3TPDwqsAvNp4B8PDdwZBcFFYiumtyXQkB1PTVWZR?=
 =?us-ascii?Q?WHed8FuhkBXW+wiOKYBmj9Jnbhw1ZS1XsFYY5lUSMYN9LgQLcM1lCO0HeTNN?=
 =?us-ascii?Q?8USWp6a+aombGegb3kF1Bvsefr0gxg0xT8icEcv2qAPd7VhngH9o5u2PQhHg?=
 =?us-ascii?Q?gA0Xmt9i00c0DXa/jE6vPHE/Hhpj2jSno4e7lY2F8D+MMqYTMmWX1Vi4Z2by?=
 =?us-ascii?Q?55f9+DZYJV/XdSozuOIuMAuO31zLLUpnJg/lu8ZByVVGu5/m3yVZpEku6j3P?=
 =?us-ascii?Q?2jdKcl3BGti2E36w6mXCgE+uGgmcbLVgfbIYyskEHwZv7mWRjZsxL0BOC92b?=
 =?us-ascii?Q?+H/fcfH7u7n+/uhbkOz93ty3I1wWFPt4dItQm+ACPk7Lgo+WcNxyld6sQIKo?=
 =?us-ascii?Q?Zw+XytCbJAYHjrtfLyc5k3hRBCaLuc+8RTg4kAZvSi3H/N5g/PW6uh3MEXV9?=
 =?us-ascii?Q?5Xu8VgwjpArSXB54CE0GYh4IWtq7+GhH40Kjc0Z96LttFi6LPlC8AnjWL38q?=
 =?us-ascii?Q?G+h7PLqb8Bfw1dJtmAcQdjBmBYThlJkkwIu+N1ffby9VJoG935sOuRMDvVby?=
 =?us-ascii?Q?6k/1bXdWf9raPM/oiQy5P8DKonjNurrKNh1Gm4uMEW7EZzrLQ+QctV3RTD6f?=
 =?us-ascii?Q?+FnnIgTFT6QoG+IJCz4xQCSFm9tUNnZd6eHSpZHpfOBuHDt3JQsDfkGwY77q?=
 =?us-ascii?Q?JSgeI5MnhX2Y3F+c12lS7ATcQ6Fw03VJG+C3ZabZbdSZLV3+Dy/1U3kUcNgW?=
 =?us-ascii?Q?G6w1u/57UK5JFDIe51s3nAD+Fcqe4ORH+YLUjwBOBFlTmJweYUMj0CucF4Yw?=
 =?us-ascii?Q?sCVghlPH6zCx3dmeYhhGss/1l+AzKBTc/rUhdGoil6SsApYnFB8Hs3yN34Cw?=
 =?us-ascii?Q?dYVxjHeGkpU/MPt7Abg2HRrCJITvDionCI7Cb+QQk6nAREup1dYQU6B/7qGR?=
 =?us-ascii?Q?vnW2xBTXVEL+ohIhVBoJK7RnnpqxGeFOuIEkMby98Sh4CmT5SM6nTa8bBBJp?=
 =?us-ascii?Q?XEheJv89q3G4jbG+47yE6LHKt82ZdFxq3T0nNc4QPIbPwin7KRo//Iv1mTAU?=
 =?us-ascii?Q?5dX5E9zWUf3nss5P+9FROkuFkscRuyZt4DaxeFexHydj8FPVVaNajRhtESME?=
 =?us-ascii?Q?YciI6bFGgMOv0/YIIfx7S4ay3kl7lU3/IhPm55+JW2eomYjUGgCjy0+0XCmc?=
 =?us-ascii?Q?+MNLAs2Qj3sFdr/2MORlzmInEnMpKsEvfqgvbqh44tSHVlb4ozkSmr8buv3B?=
 =?us-ascii?Q?+uq0bjPgqNWD7lUqASkJ9TENShjxGB2uEkYbJyB/sGr40YeEXrp/UkejSd20?=
 =?us-ascii?Q?PHAhajW1zOayrbUuNXHw/jtHT/E6ZXnAD5qv7XoSE/xvZrXQaBhzEVAzeHc1?=
 =?us-ascii?Q?+ng+9PB1XABeor2fGBtpQHg69AT8oS3z0iex/8pOSWpobCgCj+93gBsSsVj+?=
 =?us-ascii?Q?szjSM8RIF6m5BInyrC6DSd5OINwLx8TeVgb5NoZLZC9YW/9CGHRRNFB4g8st?=
 =?us-ascii?Q?rL8hBPef4q1r76u12/px6dP8tWTcm0quPzvILUwH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 38afb75d-cb74-4aea-9228-08dcc1564c8f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 20:25:57.7509 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k2b8ZxeemxnX8gMyJUctk94OgsfC3RMUNcNef3TBNPBKKnDzbwrnXTp0VgBROFJ7winL0ZKmKiIctOd0Ors8Iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7724
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

DPT code is so dependent on i915 vma implementation and it is not
ported yet to Xe.

This patch limits inspection to DPT's VMA struct to intel_dpt
component only, so the Xe GGTT code can evolve.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c           | 4 ++++
 drivers/gpu/drm/i915/display/intel_dpt.h           | 3 +++
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 3 ++-
 drivers/gpu/drm/xe/display/xe_fb_pin.c             | 9 +++++++--
 4 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index 73a1918e2537..3a6d99044828 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -317,3 +317,7 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 	i915_vm_put(&dpt->vm);
 }
 
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return dpt_vma->node.start;
+}
diff --git a/drivers/gpu/drm/i915/display/intel_dpt.h b/drivers/gpu/drm/i915/display/intel_dpt.h
index ff18a525bfbe..1f88b0ee17e7 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.h
+++ b/drivers/gpu/drm/i915/display/intel_dpt.h
@@ -6,6 +6,8 @@
 #ifndef __INTEL_DPT_H__
 #define __INTEL_DPT_H__
 
+#include <linux/types.h>
+
 struct drm_i915_private;
 
 struct i915_address_space;
@@ -20,5 +22,6 @@ void intel_dpt_suspend(struct drm_i915_private *i915);
 void intel_dpt_resume(struct drm_i915_private *i915);
 struct i915_address_space *
 intel_dpt_create(struct intel_framebuffer *fb);
+u64 intel_dpt_offset(struct i915_vma *dpt_vma);
 
 #endif /* __INTEL_DPT_H__ */
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ba5a628b4757..1cf1d5c8b9dc 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -14,6 +14,7 @@
 #include "intel_de.h"
 #include "intel_display_irq.h"
 #include "intel_display_types.h"
+#include "intel_dpt.h"
 #include "intel_fb.h"
 #include "intel_fbc.h"
 #include "intel_frontbuffer.h"
@@ -1162,7 +1163,7 @@ static u32 skl_surf_address(const struct intel_plane_state *plane_state,
 		 * within the DPT is always 0.
 		 */
 		drm_WARN_ON(&i915->drm, plane_state->dpt_vma &&
-			    plane_state->dpt_vma->node.start);
+			    intel_dpt_offset(plane_state->dpt_vma));
 		drm_WARN_ON(&i915->drm, offset & 0x1fffff);
 		return offset >> 9;
 	} else {
diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index d7db44e79eaf..42d431ff14e7 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -377,8 +377,8 @@ void intel_plane_unpin_fb(struct intel_plane_state *old_plane_state)
 }
 
 /*
- * For Xe introduce dummy intel_dpt_create which just return NULL and
- * intel_dpt_destroy which does nothing.
+ * For Xe introduce dummy intel_dpt_create which just return NULL,
+ * intel_dpt_destroy which does nothing, and fake intel_dpt_ofsset returning 0;
  */
 struct i915_address_space *intel_dpt_create(struct intel_framebuffer *fb)
 {
@@ -389,3 +389,8 @@ void intel_dpt_destroy(struct i915_address_space *vm)
 {
 	return;
 }
+
+u64 intel_dpt_offset(struct i915_vma *dpt_vma)
+{
+	return 0;
+}
-- 
2.46.0

