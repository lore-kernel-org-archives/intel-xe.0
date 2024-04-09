Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEAD3CD128A
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 22:15:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5397B112FB4;
	Tue,  9 Apr 2024 22:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bPGvwRzu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E462112FB4
 for <intel-xe@lists.freedesktop.org>; Tue,  9 Apr 2024 22:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712700937; x=1744236937;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=D6QdW7k28tKnFsl7jhpkZS87zY1A6ww7MzOzdBF3lf0=;
 b=bPGvwRzuvAX5fZjDn40gG6QBOS/COkmqfDmSPo71yfjeEY4EtavNaf7l
 lNemZE/Jl6BA3c1DTosSskVIqKTccFBGIHTqs7bm7gWX0ac/JOfseLt/g
 5/TlC1JjQ2Thdnq2BpGY1lqQiQGnCPp4xTvyBS76xdan3TanoTulJ17po
 4e8HqgrnQGt6cxH4Top5agzBGM0R84NsyoDc+BLe185p0BpDUaG4NLD+2
 FUCRBjJY934OJ/90oPD2fqrGR804ELuYu54/Qzm6nOiKeDqfgbXB1GUZZ
 nf3pAWW9irY4p0AESNjY3gp+qxfQVG7raGBzDphEafsDgbS1rp1TPhEbM g==;
X-CSE-ConnectionGUID: 6a/luweWT76z1LTvzVbNYg==
X-CSE-MsgGUID: IAKaX3i+SXirgCV+LB/3BA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="33446649"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="33446649"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 15:15:24 -0700
X-CSE-ConnectionGUID: 8flxW1o/Rm6VBhTMw/cMyA==
X-CSE-MsgGUID: blDbQ0irT3iWK39GZJKQCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="20793459"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 15:15:24 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:24 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 15:15:24 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 15:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7ARfSTDpMLFpn35xgdQWx1di7ZGOUs4/tlYeBC8GxLz/5EHi3DGcdccMnaluZFjrhG99PrBJPGBjp+OS+eLnCIzUmHmeciBorY531QHbTMzITRuqXG0h6FMqpQWOfCuk+x0hYTGiJJCI8HnnMAKIwL1teoM9XibMbOQvQIGra/iQvIaFsIZtueVaXGb2syo2ecO8WghyonmquKtGB9qQpbw4LPUO36cTsEMr4l8bfKObAcpAglXzJBsPEugRnZBZmkJXlUpm8S9LWXRc9Bw241G0WivbqGLsflFsAza2VsmC2AeYk9FfGmd7hIt1C6BVyw42pi0naJzNIKyufynJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l8bJXfhpZGIdOdCoNoHtqNSAOelrageoaANHhoK4bfU=;
 b=gjZpsNMyrUUO+bS/3MYmfJ7uVkPGPLmx4JE7RO0X/fprvwG2m8CgsKGWzeOqiw1zWPvsKVR5D9zZSTtHtsqjHwTcoX0xCSIWG3nrLonLIxTdrMArkdSM7lCJSWge23siqS7/qwA9lBN6s77uOnkOO0ljHIHSQHe41v1Fns7m6JD7LhejebYS9tQO4IOhBUVByBAb0n/N4FCgIRqxEujaCZQ5+Cw9NmugBo6L6+EWPJ2aVZDPqaxPZvRoxtJI0XOZAJkJvI2FxgcN5r+CZx90lwtvOlm1NHmrALnK/C5rBtxk6xne6zpUJIj0LY01yxmSsuIYDmko9RnWAZkLZpQZ2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by LV3PR11MB8604.namprd11.prod.outlook.com (2603:10b6:408:1ae::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Tue, 9 Apr
 2024 22:15:21 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7607:bd60:9638:7189%4]) with mapi id 15.20.7452.019; Tue, 9 Apr 2024
 22:15:21 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Dafna Hirschfeld <dhirschfeld@habana.ai>, "Lucas
 De Marchi" <lucas.demarchi@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>, Himanshu Somaiya
 <himanshu.somaiya@intel.com>
Subject: [PATCH 3/4] drm/xe: Force wedged state and block GT reset upon any
 GPU hang
Date: Tue, 9 Apr 2024 18:15:06 -0400
Message-ID: <20240409221507.1076471-3-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0097.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::38) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|LV3PR11MB8604:EE_
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pPekxnGQiLadItnHnCoNgKiirjMR5mvai2xirwddGJ2WeC6S/G4WKndGwSjTxjQgYuNzMswrKqILs3dhnri3wrF+nti+9+8Sa3f8EBI7iHcdvTAAzo4cRKaJxkW4q7Wr8XMOTecI8PqBQseNN8yyjbF37U0c4MwyqDWahw+6Wz2mKXjuE+F0o/uSngMLHXwzFgFYe4RrPJB7Dcn7X+QU2N4HbmVIy0HFo68DESeLkD+XZFwh3Gkii0/FPSkd+ILOji7DcmJAE1Kff5zo+AsnC2iWl6kAB4f6zsmAC2pB9wBFECUJcz+eYiWEJ/enVktjyc6PlxU1CWDTwySTXzwi7QZBU3mY2N6iTUuh/prjBoMW2JyygY2Z39H1QVRhmudbI7Fc6o7GS6pe+qLIJN1V+vgdoPAecyuBNvf2R1YM8pkzIO5SqM1EcmZKnlTf6a2rtmrrDVJOwVj4nQzXoFjY7UYxxnCEROfKJAmPfvL8B4t0peYxnHPs+4I2dO0fvpM1nBiYECMg23bGuXM9aeFF+bm6SP+1G9y8IXOduat+hjdjd3n89eEHImx5R7bBQ2jgu4AauaPej8sKZ0p02o6ka0BARCv7wcaU5UCLkbY6ERM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CvyMyhrwYhLA4azTVW3TZx22NaQsBQIqf075RGOsokrv1W6lYOSSgwBlB3Bt?=
 =?us-ascii?Q?NAPtlKP8JL0qmSjlLpdxf0EyGgZN6zTSWEnVOdkz52R/xDhWJhDc2btp+PLF?=
 =?us-ascii?Q?HHB/bZ8/n3ufi/b2e2xITxXS50ddQD+FV97ol8BSCHctkoxKVX/hK5G1jgtU?=
 =?us-ascii?Q?UQdYIntCs0MBFlA+eSDQUdTAC9nD2bJONjmtulEfzmBMZJqu3P/StpGI7335?=
 =?us-ascii?Q?zdbTGvENJ4OIhhhj75mVBWi09+sIbFcPJ72w8bJPI+W4jbXKqZuKtH5YVI8l?=
 =?us-ascii?Q?sWrfLbI8hocIVVh105V75rfDd2J/CGzYt8pDFyTfQIfNRmsfUsDSL2z0wmf/?=
 =?us-ascii?Q?+1FyWI24qrWKhr5ylA9YVP+wcza1FCooYe29zW34Pc71StvYAVQz10NHKMWT?=
 =?us-ascii?Q?elzIcYvoLiAOA826sVrEUGS/1Nd7BiW9XcyVfiURJ5AYe/knGJa/lYJfn4NO?=
 =?us-ascii?Q?ZD7/xcJj7e590ARuvqsJEG6jHdLpbENDASo+yZdpOM8smLuAKpCLh9p0MrGM?=
 =?us-ascii?Q?QVKhzHhg2HOhpdOl2LcoUyPQtXI8fU+pYk4ebYm+jZ9tcu6dRHFxLCrUSus2?=
 =?us-ascii?Q?pveFUj+AEYxJKRwpaHrQ4P3ttx7JDEpfrpWeHgfOSYT2g7hRSDIJRLLG9QE+?=
 =?us-ascii?Q?OEjovUmgUOXLkoMrZzXtxUltEtzmzb+Kaze4fmdpIpFlc29DW+jVtn96BEU5?=
 =?us-ascii?Q?nr1Erl8snVoq2ogmg0uZ/uVNQE1oNBU2j8/N27miA9Ab+KQn7ydGqMIfP4q2?=
 =?us-ascii?Q?IVU1aL1pPLr6vPv7Cj2GRaMjlLenjz5e+X0HDz40Pchco9287pqXuJU4QdIb?=
 =?us-ascii?Q?SZ8PNkHSh8y0fRGPLXlyJtfQwgdomddphezxr8Zbj/NVShbyh4/l0pBwd2Pe?=
 =?us-ascii?Q?/RNdmcUWX9W551nO3zPmM4Z+hHPNkTI0QIE+kaYogVIbzbaoniqh8LOAzus2?=
 =?us-ascii?Q?Zn0PLNNcaDc1VrnFo9gsfWKH/n1mn6WtdD6FWgVMdNn6cl+UzwZsBbJuqmhB?=
 =?us-ascii?Q?p61kyCD+3pN1DGfhieq54JQcIcihPDNdxhybd+biU2JP5QjE479rkaSFBgf0?=
 =?us-ascii?Q?iaUFSRFecUeIeyvQ6+v8zRndotqGpNnty+WDdIVpOQzS3jY9Z3jWhBGmURVK?=
 =?us-ascii?Q?EPgPmE5++Bx64bHnWlp5mGuLiCzxUibQEV7+OtxINZw4r2JTrOzRxjB0ImSK?=
 =?us-ascii?Q?ebh/a8XVoj/NOW9MLrTwXjvlLszN3q/rlNLhaLAd/os5yU3H6iBS021mzF6G?=
 =?us-ascii?Q?8JFbVYE68GvMvUHBjOlPhAUs/CGwlHHBN+rNQ0GO5smfYLbnjgiogz3F1TWO?=
 =?us-ascii?Q?Q6CiCnV1ePxE+LhFbUbB2YNXJ1hL8QUjf63J7L4jEtHPBWSIcEzTPGkdA4/z?=
 =?us-ascii?Q?S9eCL+1UmhP6nyoVJ8wsxYMivVnrOzdzBfnq3lK1MFXqW6V6gilgyPKInAER?=
 =?us-ascii?Q?ueHmAbj2D2cx5gQSGcuTJKnuHVrT84QEGubu3OpIyakADpgK0a0vZ0AuE4Av?=
 =?us-ascii?Q?I6NOB+yNxcJcrlH+jOxPg0uFm/Y9vDXWNeSfLQ9sq8ZjdM1cyo7k0EQNDTC1?=
 =?us-ascii?Q?YKYbilto5OQhTrIA8hYwBMJwZqzHk3skziINNCoqTx0n01UW+eOE6a2VEzqN?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9caad593-fd18-4396-18bc-08dc58e28c1c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2024 22:15:21.8790 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xeyuGm9HftCRpzzkWAMWGmnpRXeuRpS78HxE0PaPxH1hHrWSjna0l/uH4r0TjvmSf7lRJhJhwQSZsAG2Nh39w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8604
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

In many validation situations when debugging GPU Hangs,
it is useful to preserve the GT situation from the moment
that the timeout occurred.

This patch introduces a module parameter that could be used
on situations like this.

If xe.wedged module parameter is set to 2, Xe will be declared
wedged on every single execution timeout (a.k.a. GPU hang) right
after devcoredump snapshot capture and without attempting any
kind of GT reset and blocking entirely any kind of execution.

v2: Really block gt_reset from guc side. (Lucas)
    s/wedged/busted (Lucas)

v3: - s/busted/wedged
    - Really use global_flags (Dafna)
    - More robust timeout handling when wedging it.

v4: A really robust clean exit done by Matt Brost.
    No more kernel warns on unbind.

Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Dafna Hirschfeld <dhirschfeld@habana.ai>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Himanshu Somaiya <himanshu.somaiya@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_device.c              | 32 ++++++++
 drivers/gpu/drm/xe/xe_device.h              | 15 +---
 drivers/gpu/drm/xe/xe_exec_queue.h          |  9 +++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |  2 +-
 drivers/gpu/drm/xe/xe_guc_ads.c             |  9 ++-
 drivers/gpu/drm/xe/xe_guc_submit.c          | 90 +++++++++++++++++----
 drivers/gpu/drm/xe/xe_module.c              |  5 ++
 drivers/gpu/drm/xe/xe_module.h              |  1 +
 8 files changed, 132 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index 67de795e43b3..7928a5470cee 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -785,3 +785,35 @@ u64 xe_device_uncanonicalize_addr(struct xe_device *xe, u64 address)
 {
 	return address & GENMASK_ULL(xe->info.va_bits - 1, 0);
 }
+
+/**
+ * xe_device_declare_wedged - Declare device wedged
+ * @xe: xe device instance
+ *
+ * This is a final state that can only be cleared with a module
+ * re-probe (unbind + bind).
+ * In this state every IOCTL will be blocked so the GT cannot be used.
+ * In general it will be called upon any critical error such as gt reset
+ * failure or guc loading failure.
+ * If xe.wedged module parameter is set to 2, this function will be called
+ * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
+ * snapshot capture. In this mode, GT reset won't be attempted so the state of
+ * the issue is preserved for further debugging.
+ */
+void xe_device_declare_wedged(struct xe_device *xe)
+{
+	if (xe_modparam.wedged_mode == 0)
+		return;
+
+	if (!atomic_xchg(&xe->wedged, 1)) {
+		xe->needs_flr_on_fini = true;
+		drm_err(&xe->drm,
+			"CRITICAL: Xe has declared device %s as wedged.\n"
+			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/unbind\n"
+			"echo '%s' | sudo tee /sys/bus/pci/drivers/xe/bind\n"
+			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
+			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
+			dev_name(xe->drm.dev));
+	}
+}
diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
index c532209c5bbd..0fea5c18f76d 100644
--- a/drivers/gpu/drm/xe/xe_device.h
+++ b/drivers/gpu/drm/xe/xe_device.h
@@ -181,19 +181,6 @@ static inline bool xe_device_wedged(struct xe_device *xe)
 	return atomic_read(&xe->wedged);
 }
 
-static inline void xe_device_declare_wedged(struct xe_device *xe)
-{
-	if (!atomic_xchg(&xe->wedged, 1)) {
-		xe->needs_flr_on_fini = true;
-		drm_err(&xe->drm,
-			"CRITICAL: Xe has declared device %s as wedged.\n"
-			"IOCTLs and executions are blocked until device is probed again with unbind and bind operations:\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/unbind\n"
-			"echo '%s' > /sys/bus/pci/drivers/xe/bind\n"
-			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
-			dev_name(xe->drm.dev), dev_name(xe->drm.dev),
-			dev_name(xe->drm.dev));
-	}
-}
+void xe_device_declare_wedged(struct xe_device *xe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
index 02ce8d204622..48f6da53a292 100644
--- a/drivers/gpu/drm/xe/xe_exec_queue.h
+++ b/drivers/gpu/drm/xe/xe_exec_queue.h
@@ -26,6 +26,15 @@ void xe_exec_queue_fini(struct xe_exec_queue *q);
 void xe_exec_queue_destroy(struct kref *ref);
 void xe_exec_queue_assign_name(struct xe_exec_queue *q, u32 instance);
 
+static inline struct xe_exec_queue *
+xe_exec_queue_get_unless_zero(struct xe_exec_queue *q)
+{
+	if (kref_get_unless_zero(&q->refcount))
+		return q;
+
+	return NULL;
+}
+
 struct xe_exec_queue *xe_exec_queue_lookup(struct xe_file *xef, u32 id);
 
 static inline struct xe_exec_queue *xe_exec_queue_get(struct xe_exec_queue *q)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
index 93df2d7969b3..8e9c4b990fbb 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -245,7 +245,7 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			return seqno;
 
 		xe_gt_tlb_invalidation_wait(gt, seqno);
-	} else if (xe_device_uc_enabled(xe)) {
+	} else if (xe_device_uc_enabled(xe) && !xe_device_wedged(xe)) {
 		xe_gt_WARN_ON(gt, xe_force_wake_get(gt_to_fw(gt), XE_FW_GT));
 		if (xe->info.platform == XE_PVC || GRAPHICS_VER(xe) >= 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
index 757cbbb87869..dbd88ae20aa3 100644
--- a/drivers/gpu/drm/xe/xe_guc_ads.c
+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
@@ -20,6 +20,7 @@
 #include "xe_lrc.h"
 #include "xe_map.h"
 #include "xe_mmio.h"
+#include "xe_module.h"
 #include "xe_platform_types.h"
 #include "xe_wa.h"
 
@@ -394,11 +395,17 @@ int xe_guc_ads_init_post_hwconfig(struct xe_guc_ads *ads)
 
 static void guc_policies_init(struct xe_guc_ads *ads)
 {
+	u32 global_flags = 0;
+
 	ads_blob_write(ads, policies.dpc_promote_time,
 		       GLOBAL_POLICY_DEFAULT_DPC_PROMOTE_TIME_US);
 	ads_blob_write(ads, policies.max_num_work_items,
 		       GLOBAL_POLICY_MAX_NUM_WI);
-	ads_blob_write(ads, policies.global_flags, 0);
+
+	if (xe_modparam.wedged_mode == 2)
+		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
+
+	ads_blob_write(ads, policies.global_flags, global_flags);
 	ads_blob_write(ads, policies.is_valid, 1);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index c7d38469fb46..0bea17536659 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -35,6 +35,7 @@
 #include "xe_macros.h"
 #include "xe_map.h"
 #include "xe_mocs.h"
+#include "xe_module.h"
 #include "xe_ring_ops_types.h"
 #include "xe_sched_job.h"
 #include "xe_trace.h"
@@ -59,6 +60,7 @@ exec_queue_to_guc(struct xe_exec_queue *q)
 #define ENGINE_STATE_SUSPENDED		(1 << 5)
 #define EXEC_QUEUE_STATE_RESET		(1 << 6)
 #define ENGINE_STATE_KILLED		(1 << 7)
+#define EXEC_QUEUE_STATE_WEDGED		(1 << 8)
 
 static bool exec_queue_registered(struct xe_exec_queue *q)
 {
@@ -175,9 +177,20 @@ static void set_exec_queue_killed(struct xe_exec_queue *q)
 	atomic_or(ENGINE_STATE_KILLED, &q->guc->state);
 }
 
-static bool exec_queue_killed_or_banned(struct xe_exec_queue *q)
+static bool exec_queue_wedged(struct xe_exec_queue *q)
 {
-	return exec_queue_killed(q) || exec_queue_banned(q);
+	return atomic_read(&q->guc->state) & EXEC_QUEUE_STATE_WEDGED;
+}
+
+static void set_exec_queue_wedged(struct xe_exec_queue *q)
+{
+	atomic_or(EXEC_QUEUE_STATE_WEDGED, &q->guc->state);
+}
+
+static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
+{
+	return exec_queue_banned(q) || (atomic_read(&q->guc->state) &
+		(EXEC_QUEUE_STATE_WEDGED | ENGINE_STATE_KILLED));
 }
 
 #ifdef CONFIG_PROVE_LOCKING
@@ -240,6 +253,17 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
 	free_submit_wq(guc);
 }
 
+static void guc_submit_wedged_fini(struct drm_device *drm, void *arg)
+{
+	struct xe_guc *guc = arg;
+	struct xe_exec_queue *q;
+	unsigned long index;
+
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		if (exec_queue_wedged(q))
+			xe_exec_queue_put(q);
+}
+
 static const struct xe_exec_queue_ops guc_exec_queue_ops;
 
 static void primelockdep(struct xe_guc *guc)
@@ -708,7 +732,7 @@ guc_exec_queue_run_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_run(job);
 
-	if (!exec_queue_killed_or_banned(q) && !xe_sched_job_is_error(job)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q) && !xe_sched_job_is_error(job)) {
 		if (!exec_queue_registered(q))
 			register_engine(q);
 		if (!lr)	/* LR jobs are emitted in the exec IOCTL */
@@ -844,6 +868,28 @@ static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
 		xe_sched_tdr_queue_imm(&q->guc->sched);
 }
 
+static void guc_submit_wedged(struct xe_guc *guc)
+{
+	struct xe_exec_queue *q;
+	unsigned long index;
+	int err;
+
+	xe_device_declare_wedged(guc_to_xe(guc));
+	xe_guc_submit_reset_prepare(guc);
+	xe_guc_ct_stop(&guc->ct);
+
+	err = drmm_add_action_or_reset(&guc_to_xe(guc)->drm,
+				       guc_submit_wedged_fini, guc);
+	if (err)
+		return;
+
+	mutex_lock(&guc->submission_state.lock);
+	xa_for_each(&guc->submission_state.exec_queue_lookup, index, q)
+		if (xe_exec_queue_get_unless_zero(q))
+			set_exec_queue_wedged(q);
+	mutex_unlock(&guc->submission_state.lock);
+}
+
 static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 {
 	struct xe_guc_exec_queue *ge =
@@ -852,10 +898,16 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	struct xe_guc *guc = exec_queue_to_guc(q);
 	struct xe_device *xe = guc_to_xe(guc);
 	struct xe_gpu_scheduler *sched = &ge->sched;
+	bool wedged = xe_device_wedged(xe);
 
 	xe_assert(xe, xe_exec_queue_is_lr(q));
 	trace_xe_exec_queue_lr_cleanup(q);
 
+	if (!wedged && xe_modparam.wedged_mode == 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged = true;
+	}
+
 	/* Kill the run_job / process_msg entry points */
 	xe_sched_submission_stop(sched);
 
@@ -870,7 +922,7 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
 	 * xe_guc_deregister_done_handler() which treats it as an unexpected
 	 * state.
 	 */
-	if (exec_queue_registered(q) && !exec_queue_destroyed(q)) {
+	if (!wedged && exec_queue_registered(q) && !exec_queue_destroyed(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
@@ -905,6 +957,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	struct xe_device *xe = guc_to_xe(exec_queue_to_guc(q));
 	int err = -ETIME;
 	int i = 0;
+	bool wedged = xe_device_wedged(xe);
 
 	/*
 	 * TDR has fired before free job worker. Common if exec queue
@@ -928,6 +981,11 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 
 	trace_xe_sched_job_timedout(job);
 
+	if (!wedged && xe_modparam.wedged_mode == 2) {
+		guc_submit_wedged(exec_queue_to_guc(q));
+		wedged = true;
+	}
+
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
 
@@ -935,8 +993,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * Kernel jobs should never fail, nor should VM jobs if they do
 	 * somethings has gone wrong and the GT needs a reset
 	 */
-	if (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
-	    (q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q))) {
+	if (!wedged && (q->flags & EXEC_QUEUE_FLAG_KERNEL ||
+			(q->flags & EXEC_QUEUE_FLAG_VM && !exec_queue_killed(q)))) {
 		if (!xe_sched_invalidate_job(job, 2)) {
 			xe_sched_add_pending_job(sched, job);
 			xe_sched_submission_start(sched);
@@ -946,7 +1004,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	}
 
 	/* Engine state now stable, disable scheduling if needed */
-	if (exec_queue_registered(q)) {
+	if (!wedged && exec_queue_registered(q)) {
 		struct xe_guc *guc = exec_queue_to_guc(q);
 		int ret;
 
@@ -989,6 +1047,7 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 */
 	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
+
 	xe_guc_exec_queue_trigger_cleanup(q);
 
 	/* Mark all outstanding jobs as bad, thus completing them */
@@ -1028,7 +1087,7 @@ static void guc_exec_queue_fini_async(struct xe_exec_queue *q)
 	INIT_WORK(&q->guc->fini_async, __guc_exec_queue_fini_async);
 
 	/* We must block on kernel engines so slabs are empty on driver unload */
-	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT)
+	if (q->flags & EXEC_QUEUE_FLAG_PERMANENT || exec_queue_wedged(q))
 		__guc_exec_queue_fini_async(&q->guc->fini_async);
 	else
 		queue_work(system_wq, &q->guc->fini_async);
@@ -1063,7 +1122,7 @@ static void __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
 
 static bool guc_exec_queue_allowed_to_change_state(struct xe_exec_queue *q)
 {
-	return !exec_queue_killed_or_banned(q) && exec_queue_registered(q);
+	return !exec_queue_killed_or_banned_or_wedged(q) && exec_queue_registered(q);
 }
 
 static void __guc_exec_queue_process_msg_set_sched_props(struct xe_sched_msg *msg)
@@ -1274,7 +1333,7 @@ static void guc_exec_queue_fini(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_CLEANUP;
 
-	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT))
+	if (!(q->flags & EXEC_QUEUE_FLAG_PERMANENT) && !exec_queue_wedged(q))
 		guc_exec_queue_add_msg(q, msg, CLEANUP);
 	else
 		__guc_exec_queue_fini(exec_queue_to_guc(q), q);
@@ -1285,7 +1344,8 @@ static int guc_exec_queue_set_priority(struct xe_exec_queue *q,
 {
 	struct xe_sched_msg *msg;
 
-	if (q->sched_props.priority == priority || exec_queue_killed_or_banned(q))
+	if (q->sched_props.priority == priority ||
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1303,7 +1363,7 @@ static int guc_exec_queue_set_timeslice(struct xe_exec_queue *q, u32 timeslice_u
 	struct xe_sched_msg *msg;
 
 	if (q->sched_props.timeslice_us == timeslice_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1322,7 +1382,7 @@ static int guc_exec_queue_set_preempt_timeout(struct xe_exec_queue *q,
 	struct xe_sched_msg *msg;
 
 	if (q->sched_props.preempt_timeout_us == preempt_timeout_us ||
-	    exec_queue_killed_or_banned(q))
+	    exec_queue_killed_or_banned_or_wedged(q))
 		return 0;
 
 	msg = kmalloc(sizeof(*msg), GFP_KERNEL);
@@ -1339,7 +1399,7 @@ static int guc_exec_queue_suspend(struct xe_exec_queue *q)
 {
 	struct xe_sched_msg *msg = q->guc->static_msgs + STATIC_MSG_SUSPEND;
 
-	if (exec_queue_killed_or_banned(q) || q->guc->suspend_pending)
+	if (exec_queue_killed_or_banned_or_wedged(q) || q->guc->suspend_pending)
 		return -EINVAL;
 
 	q->guc->suspend_pending = true;
@@ -1485,7 +1545,7 @@ static void guc_exec_queue_start(struct xe_exec_queue *q)
 {
 	struct xe_gpu_scheduler *sched = &q->guc->sched;
 
-	if (!exec_queue_killed_or_banned(q)) {
+	if (!exec_queue_killed_or_banned_or_wedged(q)) {
 		int i;
 
 		trace_xe_exec_queue_resubmit(q);
diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
index 110b69864656..5e023df0bea9 100644
--- a/drivers/gpu/drm/xe/xe_module.c
+++ b/drivers/gpu/drm/xe/xe_module.c
@@ -17,6 +17,7 @@ struct xe_modparam xe_modparam = {
 	.enable_display = true,
 	.guc_log_level = 5,
 	.force_probe = CONFIG_DRM_XE_FORCE_PROBE,
+	.wedged_mode = 1,
 	/* the rest are 0 by default */
 };
 
@@ -48,6 +49,10 @@ module_param_named_unsafe(force_probe, xe_modparam.force_probe, charp, 0400);
 MODULE_PARM_DESC(force_probe,
 		 "Force probe options for specified devices. See CONFIG_DRM_XE_FORCE_PROBE for details.");
 
+module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
+MODULE_PARM_DESC(wedged_mode,
+		 "Module's default policy for the wedged mode - 0=never, 1=upon-critical-errors[default], 2=upon-any-hang");
+
 struct init_funcs {
 	int (*init)(void);
 	void (*exit)(void);
diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
index 88ef0e8b2bfd..bc6f370c9a8e 100644
--- a/drivers/gpu/drm/xe/xe_module.h
+++ b/drivers/gpu/drm/xe/xe_module.h
@@ -18,6 +18,7 @@ struct xe_modparam {
 	char *huc_firmware_path;
 	char *gsc_firmware_path;
 	char *force_probe;
+	int wedged_mode;
 };
 
 extern struct xe_modparam xe_modparam;
-- 
2.44.0

