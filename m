Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEDD5C02180
	for <intel-xe@archiver.kernel.org>; Wed, 15 Jan 2025 14:53:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D6710E70C;
	Wed, 15 Jan 2025 14:53:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DFCYb1MF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3BFA10E6ED
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Jan 2025 14:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736952817; x=1768488817;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=EGVGUnXQsqdPuPGZgzWrnjb9+S1vhb7sGGdyu1kfnBw=;
 b=DFCYb1MFERkl3tO8VG2q1INdzLQ9VVc2G4E/vTBef8600ZByS/YjKAAf
 V2e9/WUXX/tlYqepp5VkmQLlJ0S73pXGbZJjOZ8kcyRjwHWY7uSIUi49e
 qG/+78RH75/cUQE4JhhUjwE8nKCWRdFlV3IXYAKdV/Gs5/p1UCqHe5n6E
 jp3tCEQyskuoiT+denlESpfWLBjV8OSkwDzivGZUk7U3UguVGQI7lXsW9
 pHXm3OceDU1YBFISlTRiU2a7DtOlGmNCbqMGSj/4oCJQfNyHA5i56auWn
 3chhzkLzsouF+Ulm6S1s0gQtdkjk1w7WBTemt1pZuYllU3gd4tjWASy6B g==;
X-CSE-ConnectionGUID: hV0UZq4+SIiZzrGLzVQe4Q==
X-CSE-MsgGUID: WVSdWyCCRSWgAaMvDjrOkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11316"; a="37319169"
X-IronPort-AV: E=Sophos;i="6.13,206,1732608000"; d="scan'208";a="37319169"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2025 06:52:28 -0800
X-CSE-ConnectionGUID: V6zTwklITTer03QRsWsK7g==
X-CSE-MsgGUID: vdOMe98ySoyZcIqKL2lSdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105637206"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Jan 2025 06:52:25 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 15 Jan 2025 06:52:24 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 15 Jan 2025 06:52:24 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 15 Jan 2025 06:52:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9g82ldqWTzyDclQAnbHGId3DGdsdpDpoVA/IvbojAIRE57beEf98dUPOyu5zuDARGLwTs7g02CKt3VFsUVhjKQwdnDg6UBpz7idx1HZNn9B05IUr27kVH+2ALbv9JR3vuJNDMNHAdbQUiyfZ+kLI4sO3LfZ6HgQk9wDgmByotI5iraN/y4GsMRo2SeC/ZWno8A3nVacBzMJRyFCplcGqNMsYVOcOmjx8b/jeV7vPqBFjx5pUSr2OIBuO1DxLfFLrzTTgeeCBfr1jZgUg87SXW66ia9e3gDMsQ3kii0FiZ17J2scnAgbc4TtqESI+tEa6NgtB9pvonZhH3Ewgn5/wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l2um21v0XZDYRFzQBwESm7T6hTEYQIPEzygr/1VrrE=;
 b=GJBMO44Yyw3q+er72BmAUAKUEvOi8mURPNYfkvCtI/zKrDf26ZQt2GmMAVBDFXQjosT+TQSgTdrTQxQQTMfRfE3ebUuj1/Sq4tKf6ddL+9PcHdyTiXoCyeWHq1dbqIKeun/L5ni9o/QD+NWXQXtQ00tuuyH5MYT4GwywK6ntHGtrZgccScuGANl79w+zkqNjmOaBw+geyb231TtMt0cI5LxvYfwfckNC+aaQ9H/ImvtWqTKtlovaUky/xL/lge59xhg6ITiAMxLCyy3DFIg6lstMwmHXYm9nHxh8aeTy1qE8WgcyG3ZyLOIFQdgcJ9nTdR7vf/sYRQKQCRfUEhvHDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 14:51:00 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8356.010; Wed, 15 Jan 2025
 14:51:00 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Vinay Belgaumkar
 <vinay.belgaumkar@intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: [CI 2/2] drm/xe/lnl: Enable GuC SLPC DCC task
Date: Wed, 15 Jan 2025 09:50:53 -0500
Message-ID: <20250115145053.1142023-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250115145053.1142023-1-rodrigo.vivi@intel.com>
References: <20250115145053.1142023-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MW2PR16CA0024.namprd16.prod.outlook.com (2603:10b6:907::37)
 To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|SA1PR11MB6991:EE_
X-MS-Office365-Filtering-Correlation-Id: dc505109-add7-4d9d-5629-08dd357406ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fYwf434UAsgYcajOJnY47QR3qnGCz/FRgqVc+bfAZ9Rl5zF52JEGX8psJqjq?=
 =?us-ascii?Q?HnvvzgvJX9aiZ37kI5SltjUBnZqHjPMttfVT1aU81D7lLb3j+cYQweHQsCbQ?=
 =?us-ascii?Q?qyfvlzPmMS0jt6yFAeTdrLVlUhepuzMtAyGiNaZE0r8XRKAMt1qyT8WU9Jca?=
 =?us-ascii?Q?fa3HV43aCgRNqls8YdGXM1MJwWutPBH4jaF76LCAD5EqELV+WGikLZaRCmtG?=
 =?us-ascii?Q?R9FRuNXqVRUZnleQMkf3XKywhw7qLgQWDi1BuiCKRv7F6MhIQwT16hs/BK2T?=
 =?us-ascii?Q?v1dcqYJNh10Ynnthr3AHn6wtavSwIBFHbq3GwyBMeBW8ty/vNtn/8WHdz/Jq?=
 =?us-ascii?Q?avTgLWpONjGbuFznIA27o/SRdK4xtCSJR1ZBPJwLrWPyf2j76Q0ps1cYUUHH?=
 =?us-ascii?Q?l0JRzbNDkaq8B9yK93+SG6hemzrlalOoAZNGVnkDs7/vCzE0ep3V209V7Ii/?=
 =?us-ascii?Q?E8oemtsaiuRPFb1j3CGa58c13D5dpcaxKz6yeK8V4vnTUVKs1EHxT+r0E979?=
 =?us-ascii?Q?46supU0KpJ2fhgly9lImMdid2HGyQkzr6f/32fwUxpV5ZMA5HwN87g6KWlJm?=
 =?us-ascii?Q?s6Ps+SkLMbnwHRl4oRa07bpMau+rsC2LNdhNiHQ5fb/6jYxm9JXVdODK1D0z?=
 =?us-ascii?Q?vh0XXENxnM4NyQlrdxC6Wj0B38HMWctF2jZ2einoQYt9tQPJXtdAOTiRnVK2?=
 =?us-ascii?Q?dzuQJ9PzLjGLzYRV/2x9dk9Q9mJI4b0cVsXV0uym5Iqt7AxadpRC40RV047T?=
 =?us-ascii?Q?Y7BHM0BWm0VGJkNfOG7WhVIZnvkjDrvB5M7NiJsZ+hCq5JFM9VBiMEwzenXK?=
 =?us-ascii?Q?Rtxbg2Rd7UxIYaRk1xR1BXvlxJkGvyGa7k/IHdgEo3fJTlWX1woa2AfZK8S4?=
 =?us-ascii?Q?jVYfQDI8PQsmjvabIrJiS8Te1O3WfRsPHxfA2nu0JkqhnNPNdWbEsIHYKXm8?=
 =?us-ascii?Q?ias36ilFced/XBisWalLpQm93KgHUkFXL+GRfELcpkARCrGWfyhOSncSrySL?=
 =?us-ascii?Q?a6F7QTGJgfj67vjhXtrmP+KPVhCdtIykA8rrIt+092+d2Jx8MnsecFGV1tR5?=
 =?us-ascii?Q?vlZLfCChxhmw4pIktq58h6qaejz0BoHT4w32/ECwGL60XLsQnDYkzH7S8yJV?=
 =?us-ascii?Q?HVddZ6GqdIDqS5CIoIxBO4kkbd7FCKOpYZiU751gkLvCLiCy1r/vElfMCrnt?=
 =?us-ascii?Q?4ufMC/BVSCHC16PJoTnAyS0q8Orwf96bkRb4aYjG7F0DVMR62oWCcBaRPN9E?=
 =?us-ascii?Q?w3psxwr4N2TV8h5y+/hXbgYx/cj/eG0BIgBkLmd1zFnMoEako+ZR/ATgdz/y?=
 =?us-ascii?Q?0u5CwfgkS+DEDcOkqYvkIuqjMx34uGvbjcY6yQG0J9EifIBj1+fpFWptkocM?=
 =?us-ascii?Q?dUTL8uItMz7Dzt5TyCu2tEBCu18q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8yhyegysi80kcHWd3SHGjMD0YRBynRHxYqpPPLKuh49JG5Ogv4tYTrXUb7db?=
 =?us-ascii?Q?4nTyAaY2I+5D52e0GlcHzuPCRDLzeN1iaOn2hc3fPowuHvLFtawubNuB8PnM?=
 =?us-ascii?Q?2c87QYQ0CImE4JDie84+pSGWXgBKLXnSttim0+tTjJv6YrOwTk2KbzeKVCcl?=
 =?us-ascii?Q?jOkEG0ezDsjYqM13SsSoJUgZMJmSTIzkm2X/RNJbce3v8C8udILfVtCwC0Zj?=
 =?us-ascii?Q?B0JQCA1EAm0bO2hMIkpj+DbHtexu/wZgfdCGqNGsIYQmfDhFNoPirUEjY1y2?=
 =?us-ascii?Q?mosJviDUxQJ4zznAeZz7oJZ/Io/zwCvN2xkDtKDyKK2VdkWzPMJ7NGUwt/fb?=
 =?us-ascii?Q?VL93Pomc3ezi3Wz+KZGlhNHApItr7sHoS6pV/L9AG3TvOnQkqzlgvkwKY64J?=
 =?us-ascii?Q?gZTajack6MeTQfY29pTtqF0HZNYo+7KW/UxJd+8fCMfgGsSyH047w3osbKFd?=
 =?us-ascii?Q?DKwCqT+dDIVuMI0hlrMbwY6OadVr4Zl6/Su0opxNZmK5XnM/VKrs33WwxRuN?=
 =?us-ascii?Q?QgSVQpoBYFD8qDrA8KbS43+YtoaGT8CabW9ChyX2BjQW06XEhmYuzkP2EEvX?=
 =?us-ascii?Q?rEBBV+2GhdW08tgTyZtG4VlOVwASkd7d2kt0adfO1xnEfsU1x0yK+2IXXvak?=
 =?us-ascii?Q?fgZtbRZkoV+MCnz4lXBxxS+ThSDxpqcqEOPCZCBFSEXC/yXLfDTBS5yTYssO?=
 =?us-ascii?Q?Zbzc4BoTln5ESqRrEqNJriRLBb7YAIhhM5fJJH5JIhfhsSgszXOkXq3BI6g2?=
 =?us-ascii?Q?cYQbzCIkc6k9gM6FpXUL8JSKH+5awk6qLHJdb3ibBFjwxLutsWI3n2UWJ1ux?=
 =?us-ascii?Q?sZpoXrLzXlpYRy8C4IYX89DBDTdHVuAbn2ijiLW0jd3dPFjPQpoJZXaN6JNv?=
 =?us-ascii?Q?vdcL7Fn7aniS6B7yxSX++937hjfHNq2bHuu3pSh3iWeNzunEzvbLHDRRgYkk?=
 =?us-ascii?Q?+m9+lfwnMW4sUPy0chXlPlftgz3Cj+uU4FTRvMLM7z7V+VF0U0QmXmDUV/4t?=
 =?us-ascii?Q?2QtCBBeetL2o4saObZHklX/I+qcisU6Gx7q04CaoEEk6r+P6rJNm8HWKN7sK?=
 =?us-ascii?Q?aNxLFBdDn6BOAYrgNriB+9OicRGTi2tjzd+Ca5ss0HzbmY3OBRquz3zNmJO7?=
 =?us-ascii?Q?vyrNu3yjGjIMze7YmZqrRMSkRLLCTWJ5jS7H1yrWgcPqMJrsGP3X2biiA34e?=
 =?us-ascii?Q?sKsciS1/Cd1cNnv82WrG3X6uoZOmLwVm+xE10CmtYqkS+joUEiw1BV4RWclQ?=
 =?us-ascii?Q?Ey9wAzJ3VjsSI6x9wPGTCYzJ9RgDr6OJVDIRzK4zz+fpRatMN7lmOtblclFn?=
 =?us-ascii?Q?x/mrJ8yd30Gkb6/p7IDY5fVP0Y4gRvxXnM2xpodrs0OftJwY6SRoA5/fZ2sK?=
 =?us-ascii?Q?d1IyKv919NNeOO0SJ54WeGX/jB0Sv4IB3tqxIhTyWvyIViXIwutlL/wdL5j6?=
 =?us-ascii?Q?b7OGz5sGpAeSRUCvy370lrGlfBz3r5hI98Gd9kJk1XisbAlczQj7mdOZvKuw?=
 =?us-ascii?Q?eZWDAs6XTsCM33VqU6dMucT8UyFC8kt5k65cqXhljctRKrY03LBmaywnf8me?=
 =?us-ascii?Q?E5uw8wmxbrLvHfTdoIuok168GGbpEPDn7tm4movuA/4NC4s0quqqA5scxUJo?=
 =?us-ascii?Q?eQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc505109-add7-4d9d-5629-08dd357406ad
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 14:51:00.2995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ChsECBSFADtEUS0RHog/s3sJLt1pM6h9heGKX+qxr2zNDKaq/WRPI6dEqQIpSM7maVvW2WNDj44C9r29Uu7KTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6991
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
v5: Avoid lnl_ prefix (Vinay)
v6: Finish renaming...

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com> #v3
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_pc.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
index 43f9617baba2..44b5211066ef 100644
--- a/drivers/gpu/drm/xe/xe_guc_pc.c
+++ b/drivers/gpu/drm/xe/xe_guc_pc.c
@@ -993,6 +993,27 @@ static int pc_init_freqs(struct xe_guc_pc *pc)
 	return ret;
 }
 
+static int slpc_enable_dcc(struct xe_guc_pc *pc)
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
+		return slpc_enable_dcc(pc);
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

