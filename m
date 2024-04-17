Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE904C4345F
	for <intel-xe@archiver.kernel.org>; Wed, 17 Apr 2024 20:40:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 695D210E7EE;
	Wed, 17 Apr 2024 20:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hEkFn/Fv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C516B10E7EE
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Apr 2024 20:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713386407; x=1744922407;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=zamPHjeQYg+h9x2ixfJFTWSZRHhW39ZDq9H+TMurx70=;
 b=hEkFn/Fv+p5mTg7NubbqQ36C03GBj3VIjY542k1f59t7dEpPSAJBcaKL
 SSp475fykO2uE8e6KOL8VbM4bdURsR13TdGoTG/MN0nyO5bl4y10Iqpcz
 h5SdHv8o3S5aX81nZvkv+a1tjyE5FbrPsTcw1RV9sGB4PQWAV4ayiE1f3
 ScBKnX8rmqFvbGXpuixUYRLn6JJbiLaAaOluYEqAfMOzCMNvJxFKr4hX/
 wkVBeoDcEEozKIG0T0wcwhFQ7ZMPNiMnX/IC6KNhnQfFn51miljG6VDZH
 mV1vS5r5FDInLkuulnTleoJZpwtIqjpVaLJJTDkpvpN2SU1/uhODerZyy Q==;
X-CSE-ConnectionGUID: IIp8RSmjT62NOf2p1XEyjA==
X-CSE-MsgGUID: 3vDsUyITQmGFWKUbM5dYWw==
X-IronPort-AV: E=McAfee;i="6600,9927,11047"; a="9070441"
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; 
   d="scan'208";a="9070441"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2024 13:40:06 -0700
X-CSE-ConnectionGUID: 65GsaWzST5Cdqro0aIiquQ==
X-CSE-MsgGUID: S0sZwNyBR6y6slPS2LsQZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,210,1708416000"; d="scan'208";a="60171933"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Apr 2024 13:40:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:05 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 17 Apr 2024 13:40:05 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 17 Apr 2024 13:40:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z3s5B1BM9eHAN+cQz+oXYe/m1522c2D1mmeDRgf/3C2o8IsTOTwl87gkMVFgATy7PgLOxLfXoez+GMiTMaHl90BPDYHSu3XF7ohpIkp0Ps9WdAlZSXlxmgr0z9iuGafcTAbrzblWVIku8ODVqgkxeHxEcmgWaqImAWv+rqGd4LdNxCIGDvXhCXJ3fyeABKm5MJJu6xASDjaxkTF2CAZbkMPEYysNFt3BI2vED2ZGfsIGYwrk2xohRPCaQXyP485iJ1cWn8Xhi81x56iSnTYOjo4QhtXGKi0AnAWq9PXGHI1yaseSs7PN44qTCblVawzZuOPZ5ABCInpvw/p89cX6Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B9RUCpwzoKbQFY0hKMjrQ0kwXdYnG1GotDV+VV+lrTQ=;
 b=iryEU5/FzfyWq7T6aUaflFINzghhzHG0x6+OAGP+UHZqQYrzfrurFsUZdZxW6E0s+YavT6xD9Svmg/49zz3JNmAlFnhxAHcNliC2DMJd8jdesoJ96ynEyDFsE024bcEQQhyA7p3O2miwsMSX8S55rcKeMDhR8yg3QldyKmw9QNoCoSP5RdZrgguu7lCn0wDV6O5gbCkW5+g4B+li8RdAXVY0HVYVPNZW9lCMu6WTgNTxD/E93xGJGMpZDqjte/vq0RR4kyksNxCXSvWzQGtXMKCj9HJL1n1+l5jzRIEqiYmRDS5LlwhXqEvFwJ/zj6+EoDVw9hGXAg+n9ygHRL2iOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CO1PR11MB4964.namprd11.prod.outlook.com (2603:10b6:303:9e::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.27; Wed, 17 Apr
 2024 20:40:03 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::cf6f:eb9e:9143:f413%5]) with mapi id 15.20.7472.037; Wed, 17 Apr 2024
 20:40:03 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Francois Dugast
 <francois.dugast@intel.com>
Subject: [CI 02/10] drm/xe: Introduce intel_runtime_pm_get_noresume at
 compat-i915-headers for display
Date: Wed, 17 Apr 2024 16:39:44 -0400
Message-ID: <20240417203952.25503-2-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417203952.25503-1-rodrigo.vivi@intel.com>
References: <20240417203952.25503-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR07CA0017.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::30) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CO1PR11MB4964:EE_
X-MS-Office365-Filtering-Correlation-Id: bd0e0a45-04bd-452c-f376-08dc5f1e8f04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O0zT8mSnheGQazYqaZ6D/u0VSgfzdWdp4bLMPfBz/sDsKIwIbyhLyIleiLkosJN9OSteP7zNXWi79WLGkd3L0DCma0k/qPumbt6DnmXxFJGU4+a0DZoAp8FUPZ6ENh+8Oqu90pHBj6yuOg9QBypm2SZlaQYicAprKXRsudYhbZNbQlaD9QMvF768GqWk6qhgGhHQ3RTBoS/p/6jafIgPA8URZouYxgnj6eFqMQwSwnyzKQgC03W9DnlpO1Xktw+1dpY1G0W81HxXt+yU3WZQIniOz/jemmatqJmYl8XNJzUiSr6IXtJ1W0y/IV1pGj01FQ7TXtkF9q/7mG8euv9iFvARUC6oR4pFcvvWgOGdh8m01HfYu64o6TJmHKVVh6APSPhDTLwvb5TwdpeYSSR3V5oM9X1vcIhi4V28T9JX2LVEXs2/uUX1GZIu2v2TqxIPQTgY7RYnvkty7p1bfPT8sTE128kYLM3psq/69dqQxd+bjIteScLyLF9UBdqWQ3ld/I/gm/neKtMh0IJBGjXY5Hzr61At5j45r3PsxyT/yTJ1LH4ggwx2Q3Ad8NlqaBx5cNW4xxVfQ+i4R+b5OG7n7ZKAu2BaOIldJkTub8FvDJTS8h4s5qASvfiH9eGjaxRjNVw3ImTm5eKIDSXDIfeckLNpqzXel5fsrPINmdAECdE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GqMgDaEJN/n4U1vOc6ayeSV7FCJPoAY4FfK8wfEZEHBBc577Ed+CoSmuric+?=
 =?us-ascii?Q?kBmdDJkjFp/fif50xxpj4EE2V4OG5SjxiA3YrqYEd3Cb/e2hAdVvoNcSociE?=
 =?us-ascii?Q?r1myjJNkc2foc0v0dnz/2Vcg3wMqCac8lAUH5jkxhRL4zZM7scRnsQmuFlPh?=
 =?us-ascii?Q?tulTQEiWy7lLNnG9vQlWhK1lvZZmrpvA7G1K7s7lj8BsnIKp/2lW7Q+68W8r?=
 =?us-ascii?Q?osG3gMsW9ELEwENZT41zA8bEG/maef3PTAWuxdeq1TT/WFLK76XviTy/jGhk?=
 =?us-ascii?Q?EIZpfcL2VFWeyWL5u8qaSkVJg207VDPFXq74JKFABU29D1njMWr3jOEjM1cR?=
 =?us-ascii?Q?FPcvd55ZdtY1aptxU+PQ26QXwvzaoRgV3TYEQ39q/WYEr7aCnbfxglxi9Pk7?=
 =?us-ascii?Q?3Wt3PzuomdWJt3DUf51nX8IkNOp6+WNOGJV49CD4erMiJmxKHyE/Q53ibJJN?=
 =?us-ascii?Q?oV+y7nmUw+HAGzVBwJLVsXN9zXSmM1KjRayUkP9QQ+icWoW6/oO/Tdt98/lW?=
 =?us-ascii?Q?6PQAOfsKgZ6wq7Lbtjr7/7SOVvtj13AFv4a90v11rQmburWE6rZDh8UhcdiX?=
 =?us-ascii?Q?XITv2ubPyXQNvCgZEfSAtDDCJJPSH+R2chvP3msI0c1PumKAtcc03JcCTyAq?=
 =?us-ascii?Q?hA3Qp359NNzp2aznHd3CYyNIT+A9CC+xHuTBSPT5WdwWWWHgdDgPMSc9MixU?=
 =?us-ascii?Q?yPrp9Fd/8Tjh48Hpiw9jBF7DRtc/jMUi3ESHhh0MchFRH5bPahDIjbyrJ0Gd?=
 =?us-ascii?Q?wzLW0W3nrus8Glq6BjRl7d+KxocJjiiNMOoucimd4L/CkVAoiJzEZ+vameL4?=
 =?us-ascii?Q?vKhKNFzdC6wvcTzyDqNX7tARo3QarzBe5c9sqCk1y7bPUvXfohKP3vcjKXCS?=
 =?us-ascii?Q?ZdYobL1+quhu8ZlnFn7JBrFJQbJzDRkV+5G7LfHDx10CxENyZ1YXFo9SRG67?=
 =?us-ascii?Q?oNnZqGCvLmfCWMH5e2zL1FHwiIK6PDyYQvOporQe78JrpRlAYijdQuUXzaoX?=
 =?us-ascii?Q?OqRo29VMgQD+nfTKjygkNGMxAWPBYqqhnd7n3ffnDnh2wUVg143agxfAoYRV?=
 =?us-ascii?Q?mvgrSfPtTKBWZoZ1jz1kEve//41TVdWuqazluJbFO25J7k5LdsP0MB7m+m0x?=
 =?us-ascii?Q?3ELRIHieZ6+LmMINJ+axpbBjtDcpEawlcRMSXbH5Skf04Btg6NiYTtr9TFuk?=
 =?us-ascii?Q?wrcizmlUZH5H2YJLkhXxWKQRyWgONKSPTO2kldJaHAibmZOeZoTtKSai6okU?=
 =?us-ascii?Q?z1nFMd5xOH7wGG6SoU8JxPzAUZNaOIly47zfTiVNp7PQHRmCLdjtvtj1PiV5?=
 =?us-ascii?Q?AavmL+0nxbJGjoK9AlEoZpEHEH8mtn0BF1pv7CNbSS/NNeOq9StW3iNVO8+e?=
 =?us-ascii?Q?iMIK+XK9p+XYa6C7mKDdBoa9XQwbAcXvHCRhlMfaupMS3TvO8YWetUKRkUvV?=
 =?us-ascii?Q?KOrLDuq42J3rSqbrMGh5CezfaEs51BahQ+cxNUK16j6pOKBD7lIkeK4gsdSx?=
 =?us-ascii?Q?iGrjqZu70gvWaupw1vFHnZf2516A+JD2ZHWpJGoCuBcdNYDd7WzyJGHO8w4b?=
 =?us-ascii?Q?MXasBrSdl+suMQXL5BH+5Upcw2eazGApOljWig3hDxFDcIv0/dZ3UciXhrAg?=
 =?us-ascii?Q?AA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd0e0a45-04bd-452c-f376-08dc5f1e8f04
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 20:40:03.3818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xgBKD/x0K5OlDyF4iv6iEHpsfcb/yiQSPwpHLD4uGYg9ZQwczXm0v8N0AFrk4jXeTU9NoH95tTAB3OktFVXHRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4964
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

The i915-display will start using the intel_runtime_pm_noresume.
So we need to add the compat header before it.

Reviewed-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
index 484a71cbb807..ffaa4d2f1eed 100644
--- a/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
+++ b/drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h
@@ -138,6 +138,14 @@ static inline intel_wakeref_t intel_runtime_pm_get_if_in_use(struct xe_runtime_p
 	return xe_pm_runtime_get_if_in_use(xe);
 }
 
+static inline intel_wakeref_t intel_runtime_pm_get_noresume(struct xe_runtime_pm *pm)
+{
+	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
+
+	xe_pm_runtime_get_noresume(xe);
+	return true;
+}
+
 static inline void intel_runtime_pm_put_unchecked(struct xe_runtime_pm *pm)
 {
 	struct xe_device *xe = container_of(pm, struct xe_device, runtime_pm);
-- 
2.44.0

