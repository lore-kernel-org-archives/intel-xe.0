Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 255A0C77B61
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 17:50:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9AD810E048;
	Fri, 28 Apr 2023 17:49:59 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC76D10E048
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682704197; x=1714240197;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:mime-version;
 bh=SCgBwVO4uKApdp9dMJ5cLbrWKW2pKVE6JPSzPcuZwNk=;
 b=igMUI6INjFnq+cuEAeOr5k1jVeOj98r3CV3oP2TkDT9Kl9ignhSj7Y2a
 B9D/ei0/PIFSbE72r+28tWyH5Ws0LoVNgOfCpKl7MNo9wmPibPB8xGS9j
 L8f37ytKHUIjbBdHBMqby9JVvx5cNrEujm3RDD6NJdLHN02q8XXK2H99l
 Hif+UuCvwCbPuK1V6JiXDAJdbl6Pcy/H95nsOeSKbXV2WlM2WReLbE2Dx
 mCsX0NujgBzEW3nfrzlPtPuf/wDWh6deU643SktzOv4j4F8lXS4+iTmRi
 ZbE85uTRrLfXCpeM8a6mdnS/9snTbxRI62Q6H50vQNv/C5u3NIx3j9wXE w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="336888044"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
 d="scan'208,217";a="336888044"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 10:49:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10694"; a="1024698586"
X-IronPort-AV: E=Sophos;i="5.99,235,1677571200"; 
 d="scan'208,217";a="1024698586"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga005.fm.intel.com with ESMTP; 28 Apr 2023 10:49:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 10:49:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 10:49:54 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 10:49:54 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 10:49:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BqoXTe4mKiydabz6L1Q/d+J03VMAkn7ec0cZYXrzEjr/nFX0vwtsnRZVbIkpfRRrymr6lxg/EPSWt1xFr1MFjDIDy9l4QKtExWyjnOsXlMkTu4fPQGB7rJG2JAoN2xW0tKboP837GoAmByW98UbWptNmGxU6w/I7fuyiwCJl9CDc+PiQawoQdgolQe+pOOrCJ+dDdHHAIP3QOZs+3Yt0gHqsdf5FAt/wuChytnakRPanOScrDUMUl3+dn4XB3kc1WL4xJgMa688EW4Ff0bkroON/HQPk0cboUfMwrL5lakEBym/WiI5Xj0f4Y7Ys33nW/ElIDoDxbi9C+GoGwaFJyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VN/M8c79l3ahVeSjNNnX4BXU/D9sdQL+pkTEn4GNN5o=;
 b=n0N7DRGm+PtytWwVPR6XQ0AzDJamXcIRl+yV2dlUjIsTOeNhZqoOlpg1bN0RWd7C1COJE9zspOWbuWZozkrGYc/CHIHnUTRs6yO9cdabaWDYZyzT8h8+tYnlL2U3Gvu6cK+FYN4c5kdZtRyKqynFKcmfo99oVNqGqTi07hTXtvIs3soaj80OeU5qRlNnp4BxrrILEe1B5UvnwMV03483hHDREaIW+l0sdWBEOMJkBo+MVeQUIWlZDjIe80jFEo3u0JDNaWSwMK8SWapIji8F+DY8uqvk+VcWZV+UZEYEwpxxIRAALwwCI6kZe6LztAmaoVVjHxZToz49nSbQ7hNR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM5PR11MB1324.namprd11.prod.outlook.com (2603:10b6:3:15::14) by
 SJ2PR11MB7672.namprd11.prod.outlook.com (2603:10b6:a03:4cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Fri, 28 Apr
 2023 17:49:51 +0000
Received: from DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166]) by DM5PR11MB1324.namprd11.prod.outlook.com
 ([fe80::8f6:8ec:1c7d:f166%7]) with mapi id 15.20.6340.025; Fri, 28 Apr 2023
 17:49:51 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Thread-Topic: [2/3] drm/xe: Size GT device memory correctly
Thread-Index: Adl5vzP0su11Q7P5SKWmDOHuj401dAAOOPhw
Date: Fri, 28 Apr 2023 17:49:49 +0000
Message-ID: <DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9@DM5PR11MB1324.namprd11.prod.outlook.com>
References: <SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM5PR11MB1324:EE_|SJ2PR11MB7672:EE_
x-ms-office365-filtering-correlation-id: 2f4b75e3-7df6-4a25-8834-08db4810f6cd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: nRdHVwa6x9IxaXLzjwHal0rvW6x5qwB+m1oVoCJMjSBtC1IL+OzBD2hqckwQOrlEhpUOMY2ZdD0cxAVVWN5iqMugYZPaBezKMGKW0Gk0wcg8/qcRTlSW7oEVjw8qvpPFII+vmU7GuB0uOpduyMA4KwdfZZ1hu3Y9M8GE6jB2TwTujBjSFglXNOJLs6GKDGUYNUtdWk9bHxE3guGHUcJuXAguJo8t/Ul5IWp2Pg+hQcCnHYEY7F4CUlig38QqWczJZMMNvAZOFNbSjxZ+jZhDkwLnQy9jMEcz+ubY/Id2tOoiIGYnisRecjUhN3iF/KhvT/zTXwzWXVYAHbdxAs1hc+bfs3ph4Qrtjv0BDfe05O64Bj7xHtJotUfeRn5Vx9LGoJXQ1cQX5vr/zdzCMkURRsdznndsmVivNEphD22LrkkRV1+SPauV89zrFB8sZSYtRbWCKK38EyMPYs4/AAZO0iby8oDB96wAiG2DCYwMtblCEtDyTGVSf/hsc8fueiYEF9fU5CK3LFotPtXrsvFeo/hXQ7e4VFhYtDmqzJ8a5D0yEOxOmCeWclAphVkvEvpg7Jr2kw6qYquN5H7vxhPvevRva8aWccN74JZxfnRHIpJmd8np74PAtTFfr73SW7TxnXAGv4DXY19pHqvOVMgMsQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR11MB1324.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(346002)(39860400002)(136003)(366004)(451199021)(8936002)(38070700005)(8676002)(6862004)(478600001)(4326008)(66476007)(6636002)(55016003)(66946007)(76116006)(66556008)(122000001)(66446008)(64756008)(82960400001)(41300700001)(316002)(30864003)(2906002)(38100700002)(186003)(52536014)(5660300002)(86362001)(33656002)(9686003)(53546011)(26005)(6506007)(71200400001)(7696005)(9326002)(83380400001)(21314003)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ayUwGOWCVWDqCm2SraSjnzMA8r6jWWsTztOPOY3DgFUlfmOGOsdjXjz44zSf?=
 =?us-ascii?Q?gngRDkg4dzcbGWzLMbEqysHp3WtnEb3V8lQqQZP9A+0b9mRIs4gBHWs9/CrI?=
 =?us-ascii?Q?BJ6HSRKht7nK4z545xXGK+EYBIkJT10meuwxzHUWqIFV6prfhzkSk0q6F9sk?=
 =?us-ascii?Q?Zkq4uWJpusu7n+Pw9GLHtR1Wy3xwmf6/Q0CR6IhwQqNsOb7iWDsueTOynoI2?=
 =?us-ascii?Q?1xUu/LcPFxlyCOz8w07raZeJyHz8C0/oNsFXE9Wm783t8iscHD+GF8PeVWoe?=
 =?us-ascii?Q?EYmeXvAXU9tU3AlboSEiRyFdS+De38LNFRgBe6DlwOwka4bFmjXZhAGofq5O?=
 =?us-ascii?Q?Q2uhf6z3y6AB5bN2HDbsWZKvHyoxhwWmNKn7eV/vBwz9P5XsihjXQGn6+iDc?=
 =?us-ascii?Q?uUaLjnvsWdenhUVmCdQUQ/krnIMJ9kIVEeThY7sj8rElg2hP8AU7qkRKbZWU?=
 =?us-ascii?Q?E1+cZ2CWYfVkopnqf12y0DfAgxgWdZPf0Cl46GUXEjYCRTXvoK2VQ84Uqt0k?=
 =?us-ascii?Q?7kPhyMlKfhR9KfPEnVlNS3p7FVhe5p2GJwP/gRZ9I2ycVTHzY9tm5SRazFpR?=
 =?us-ascii?Q?ZfgMEoFj96lPikR9AY66+bYaA9eMI6l0LHl8nM6vm8MP10UhXFbxBgCU2r7v?=
 =?us-ascii?Q?ydnmtg7gj8ba1wKDpNRlPlHbT/LM6s7sVGoF4zfYa4BN38N1Mrh3AJV4bi6z?=
 =?us-ascii?Q?pjUryTg36NkrprS2sjXIOme2RiwGV0eEMTslYcVstZflsKgTaydPnDiAlcP7?=
 =?us-ascii?Q?6+QPLml+jhIbKpFmzXD/6gUaSHteZtbn0dh92NtBaK3XBa4hatZBJaxAQm9N?=
 =?us-ascii?Q?XQhflf7qYAPgF84AN0lfHW1DvA2GxLUVSr2lD8ywR9y4yzH9vXIxzeM7rUyp?=
 =?us-ascii?Q?i5Pfx/duk9BTGowtl2pGORZ+81j04GaUpJOT0kRoNsqKC+feBE9doj84WleR?=
 =?us-ascii?Q?SBuvxvT0pr5CnjOc2cAOZ3gvJKEfE3kk/NXOdhY9RPQPX7921Vzl62q4QznX?=
 =?us-ascii?Q?k+pcon/m4S62EkqxWicNS+/Wbkud8EOhtJNOIv0qxad34l9gHrFyJ/3ydl6c?=
 =?us-ascii?Q?zeuBSb9gINi3IU3wu/xJ29HsZKNFG4kWyZRk6Aa9SSVp/1nKU1j4WyqRMMwp?=
 =?us-ascii?Q?c1UT+fmbr62My4+bgGd4HPsY7633YLSP4O/Gi0UMfSKqu5SnrXO2ljLJNuwU?=
 =?us-ascii?Q?5QcYZvzbWF2cBJVyvJbWgAsZhvN3hW+ZJSEckVaUEnYtg4o2yKWq1+fM6yOD?=
 =?us-ascii?Q?QjWAzaBfakiis9ow6SUPmMnJAvTvNtDtV/7w4fsp1FCOuoYdRbChDwncuYRu?=
 =?us-ascii?Q?6VksOaf/gvjW+ejaE3vr/a74VC7Jys+i5rgWslMGZEL6M+56+SEwFyHBbNmd?=
 =?us-ascii?Q?blSnED/b7CPKsjOpb9wUSxRdJUDKIkgIdoYe3xQaBVJRWLH6wmqTSKnTyviP?=
 =?us-ascii?Q?OaLwbVtvO7UbNBD5Dv01iLs6fd7cCLRCABzEA/tZk42Ui6JhvoTYtWM7m52i?=
 =?us-ascii?Q?kge45hmVIm8vF0dNg7AlGm7mDycFi7Z0hVIa2Ioe1FltkOvdeLpOlCKqxGfj?=
 =?us-ascii?Q?hppIr09WI+uL30uUV4Ev/bpz7j8+WVyRBYTiLw7x?=
Content-Type: multipart/alternative;
 boundary="_000_DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9DM5PR11MB1324namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM5PR11MB1324.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f4b75e3-7df6-4a25-8834-08db4810f6cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 17:49:50.0136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pFaFDLclLF5E684jTFEvi2ifiWINhIo4dz9nnmBK4mXiJrHpQpnnUxUbVgQ+7I3y5dwOVZKzvV4ZqvD3dZ3xQ78Pd+nsSA8bhWuzAAE9Hhg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7672
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [2/3] drm/xe: Size GT device memory correctly
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--_000_DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9DM5PR11MB1324namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Tejas,

[mjruhl] comments inline

From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
Sent: Friday, April 28, 2023 7:05 AM
To: Ruhl, Michael J <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [2/3] drm/xe: Size GT device memory correctly

Few comments inline over email as I have not yet got subscription :

First of all I could  not apply patch, it looks like some patch landed yest=
erday which needs you patch to respin.

[mjruhl] Hmmm, not sure why... I will make sure to rebase

diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs=
/xe_gt_regs.h
index 05a03129dc54..dac24b99f526 100644
--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
@@ -75,7 +75,8 @@
 #define GEN12_VE1_AUX_NV                         _MMIO(0x42b8)
#define   AUX_INV                                REG_BIT(0)

-#define XEHP_TILE0_ADDR_RANGE                    MCR_REG(0x4900)
+#define XEHP_TILE_ADDR_RANGE(_idx)               MCR_REG(0x4900 + (_idx) *=
 4)
+
#define XEHP_FLAT_CCS_BASE_ADDR                  MCR_REG(0x4910)

 #define CHICKEN_RASTER_1                         MCR_REG(0x6204)
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_d=
evice_types.h
index 24dc5d2e9e05..ebd297ff6fcd 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
/*
- * Copyright (c) 2022 Intel Corporation
+ * Copyright (c) 2022-2023 Intel Corporation
  */

 #ifndef _XE_DEVICE_TYPES_H_
@@ -202,6 +202,8 @@  struct xe_device {
                         * known as small-bar.
                         */
                        resource_size_t io_size;
+                        /** @base: Offset to apply for Device Physical Add=
ress control */
+                        resource_size_t base;
                        /** @mapping: pointer to VRAM mappable space */
                        void *__iomem mapping;
                } vram;
diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_ty=
pes.h
index 7c47d67aa8be..a2417cc2f696 100644
--- a/drivers/gpu/drm/xe/xe_gt_types.h
+++ b/drivers/gpu/drm/xe/xe_gt_types.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
/*
- * Copyright (c) 2022 Intel Corporation
+ * Copyright (c) 2022-2023 Intel Corporation
  */

 #ifndef _XE_GT_TYPES_H_
@@ -149,12 +149,14 @@  struct xe_gt {
                         * @io_size: IO size of this VRAM instance
                         *
                         * This represents how much of this VRAM we can acc=
ess
-                        * via the CPU through the VRAM BAR. This can be sm=
aller
-                        * than @size, in which case only part of VRAM is C=
PU
-                        * accessible (typically the first 256M). This
-                        * configuration is known as small-bar.
+                        * via the CPU through the VRAM BAR.
+                        * This can be smaller than the actual @size, in wh=
ich
+                        * case only part of VRAM is CPU accessible (typica=
lly
+                        * the first 256M). This configuration is known as =
small-bar.
                         */
                        resource_size_t io_size;
+                        /** @base: offset of VRAM starting base */
+                        resource_size_t base;
                        /** @size: size of VRAM. */
                        resource_size_t size;
                        /** @mapping: pointer to VRAM mappable space */
diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
index 6c1591a4f43e..60c1b92a87f7 100644
--- a/drivers/gpu/drm/xe/xe_mmio.c
+++ b/drivers/gpu/drm/xe/xe_mmio.c
@@ -3,6 +3,8 @@
  * Copyright (c) 2021-2023 Intel Corporation
  */

+#include <linux/minmax.h>
+
#include "xe_mmio.h"

 #include <drm/drm_managed.h>
@@ -184,32 +186,83 @@  int xe_determine_lmem_bar_size(struct xe_device *xe)
       if (!xe->mem.vram.io_size)
                return -EIO;

+       xe->mem.vram.base =3D 0; /* DPA offset */
+
       /* set up a map to the total memory area. */
       xe->mem.vram.mapping =3D ioremap_wc(xe->mem.vram.io_start, xe->mem.v=
ram.io_size);

        return 0;
}

+/*
+ * 4 possible sizes:
+ * - io size (from pci_resource_len of LMEM bar)
+ * - TILEx size
+ * - GSMBASE offset (TILEx - "stolen")
+ * - CSSBASE offset (TILEx - CSS space necessary)
+ *
+ * NOTE: CSSBASE is always lower/smaller offset then GSMBASE.
+ *
+ * The actual available size of memory is to the CCS or GSM base.
+ * NOTE: multi-tile bases will include the tile offset.
+ */
+int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_siz=
e, u64 *tile_offset)
+{
+       u64 offset;
+       int err;
+       u32 reg;
+
+       err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
+       if (err)
+                return err;
+
+       if (gt->xe->info.has_flat_ccs) {
+                reg =3D xe_gt_mcr_unicast_read_any(gt, XEHP_FLAT_CCS_BASE_=
ADDR);
+                offset =3D (u64)REG_FIELD_GET(GENMASK(31, 8), reg) * SZ_64=
K;
+       } else {
+                offset =3D xe_mmio_read64(gt, GEN12_GSMBASE.reg);
+       }
+
+       if (unlikely(gt->xe->info.platform =3D=3D XE_DG1)) {
+                *tile_size =3D offset;
+                *tile_offset =3D 0;
+       } else {
+                reg =3D xe_gt_mcr_unicast_read_any(gt, XEHP_TILE_ADDR_RANG=
E(gt->info.id));
+                *tile_size =3D (u64)REG_FIELD_GET(GENMASK(14, 8), reg) * S=
Z_1G;
+                *tile_offset =3D (u64)REG_FIELD_GET(GENMASK(7, 1), reg) * =
SZ_1G;
+       }
+
+       /* remove the tile offset so we have just the available size */
+       *vram_size =3D offset - *tile_offset;
+
+       return xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
+}
+
int xe_mmio_probe_vram(struct xe_device *xe)
{
+       resource_size_t io_size;
+       u64 available_size =3D 0;
+       u64 total_size =3D 0;
       struct xe_gt *gt;
+       u64 tile_offset;
+       u64 tile_size;
+       u64 vram_size;
       int err;
       u8 id;

        if (!IS_DGFX(xe)) {
-                xe->mem.vram.mapping =3D 0;
-                xe->mem.vram.io_start =3D 0;
-                xe->mem.vram.io_size =3D 0;
-
-                for_each_gt(gt, xe, id) {
-                        gt->mem.vram.mapping =3D 0;
-                        gt->mem.vram.size =3D 0;
-                        gt->mem.vram.io_start =3D 0;
-                        gt->mem.vram.io_size =3D 0;
-                }
+                memset(&xe->mem.vram, 0, sizeof(xe->mem.vram));
+                for_each_gt(gt, xe, id)
+                        memset(&gt->mem.vram, 0, sizeof(gt->mem.vram));
               return 0;
       }

+       /* Get the size of the gt0 vram for later accessibility comparison =
*/
+       gt =3D xe_device_get_gt(xe, 0);
+       err =3D xe_mmio_vram_tile_size(gt, &vram_size, &tile_size, &tile_of=
fset);
+       if (err)
+                return err;
+
       err =3D xe_determine_lmem_bar_size(xe);
       if (err)
                return err;
@@ -217,57 +270,53 @@  int xe_mmio_probe_vram(struct xe_device *xe)
       drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_star=
t,
                 &xe->mem.vram.io_size);

-       /* FIXME: Assuming equally partitioned VRAM, incorrect */
-       if (xe->info.tile_count > 1) {
-                u8 adj_tile_count =3D xe->info.tile_count;
-                resource_size_t size, io_start, io_size;
+       /* small bar issues will only cover gt0 sizes */
+       if (xe->mem.vram.io_size < vram_size)
+                drm_warn(&xe->drm, "Restricting VRAM size to PCI resource =
size (0x%llx->0x%llx)\n",
+                        vram_size, (u64)xe->mem.vram.io_size);

-                for_each_gt(gt, xe, id)
-                        if (xe_gt_is_media_type(gt))
-                                --adj_tile_count;
+       io_size =3D xe->mem.vram.io_size;

-                XE_BUG_ON(!adj_tile_count);
+       /* gt specific ranges */
+       for_each_gt(gt, xe, id) {
+                if (xe_gt_is_media_type(gt))
+                        continue;

-                size =3D xe->mem.vram.io_size / adj_tile_count;
-                io_start =3D xe->mem.vram.io_start;
-               io_size =3D xe->mem.vram.io_size;
+                err =3D xe_mmio_vram_tile_size(gt, &vram_size, &tile_size,=
 &tile_offset);
+                if (err)
+                        return err;

-                for_each_gt(gt, xe, id) {
-                        if (id && !xe_gt_is_media_type(gt)) {
-                                io_size -=3D min(io_size, size);
-                                io_start +=3D io_size;
-                        }
+                gt->mem.vram.io_start =3D xe->mem.vram.io_start + tile_off=
set;

-                        gt->mem.vram.size =3D size;
-
-                        /*
-                        * XXX: multi-tile small-bar might be wild. Hopeful=
ly
-                        * full tile without any mappable vram is not somet=
hing
-                        * we care about.
-                        */
-
-                        gt->mem.vram.io_size =3D min(size, io_size);
-                        if (io_size) {
-                                gt->mem.vram.io_start =3D io_start;
-                                gt->mem.vram.mapping =3D xe->mem.vram.mapp=
ing +
-                                         (io_start - xe->mem.vram.io_start=
);
-                        } else {
-                                drm_err(&xe->drm, "Tile without any CPU vi=
sible VRAM. Aborting.\n");
-                                return -ENODEV;
-                        }
+                /* io_size "could be 0" for small-bar systems, so no CPU a=
ccess */
+                gt->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
+
+                gt->mem.vram.base =3D xe->mem.vram.base + tile_offset;
+                gt->mem.vram.size =3D vram_size;
+                gt->mem.vram.mapping =3D xe->mem.vram.mapping + tile_offse=
t;
+
+                drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n", id, gt->inf=
o.vram_id,
+                        &gt->mem.vram.io_start, &gt->mem.vram.size);
+
+                if (gt->mem.vram.io_size < gt->mem.vram.size)
+                        drm_info(&xe->drm, "VRAM[%u, %u]: CPU access limit=
ed to %pa\n", id,
+                                gt->info.vram_id, &gt->mem.vram.io_size);
+
+                /* calculate total size using tile size to get the correct=
 HW sizing */
+                total_size +=3D tile_size;
+                available_size +=3D vram_size;
I think you can make this available_size =3D vram_size; instead as last GT =
for which this loop runs,
Will get total available size. Otherwise you may get more size than actual =
available. For example,
10 bytes for tile0, 10 bytes for tile1, 20 bytes for tile2 should return to=
tal 40b, but I think with
Above logic you will get 10 + 20 + 40. I am assuming offset is incremental =
per tile. If you can give
Memory offset overall snapshot, that might help in case I am wrong.

[mjruhl] vram_size, tile_size, and tile_offset are accessed for each gt. so=
 vram_size is the "tile size - any stolen" portion.  So
vram should be the "available memory for the specific tile", not an accumul=
ation of tiles.  So the addition should be 10 + 10 + 20.
I will double check my logic.

-                        drm_info(&xe->drm, "VRAM[%u, %u]: %pa, %pa\n",
-                                id, gt->info.vram_id, &gt->mem.vram.io_sta=
rt,
-                                &gt->mem.vram.size);
+                if (total_size > xe->mem.vram.io_size) {
+                        drm_warn(&xe->drm, "VRAM: %pa is larger than resou=
rce %pa\n",
+                                &total_size, &xe->mem.vram.io_size);

                }
-       } else {
-                gt->mem.vram.size =3D xe->mem.vram.io_size;
-                gt->mem.vram.io_start =3D xe->mem.vram.io_start;
-                gt->mem.vram.io_size =3D xe->mem.vram.io_size;
-                gt->mem.vram.mapping =3D xe->mem.vram.mapping;

-                drm_info(&xe->drm, "VRAM: %pa\n", &gt->mem.vram.size);
+                io_size -=3D min_t(u64, tile_size, io_size);
       }
+
+       drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_s=
tart,
+                &available_size);
+
Here it can be little more readable, but its my opinion, up to you :
drm_info(&xe->drm, "Available VRAM: start addr: %pa, size: %pa\n", &xe->mem=
.vram.io_start,
                 &available_size);
[mjruhl] Yeah waffled on adding the start/addr info.  Will add.

       return 0;
}

@@ -287,9 +336,6 @@  static void xe_mmio_probe_tiles(struct xe_device *xe)
       if (xe->info.media_verx100 >=3D 1300)
                xe->info.tile_count *=3D 2;

-       drm_info(&xe->drm, "tile_count: %d, adj_tile_count %d\n",
-                xe->info.tile_count, adj_tile_count);
-
       if (xe->info.tile_count > 1) {
                const int mmio_bar =3D 0;
                size_t size;
diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
index 1a32e0f52261..1c588db0b074 100644
--- a/drivers/gpu/drm/xe/xe_mmio.h
+++ b/drivers/gpu/drm/xe/xe_mmio.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: MIT */
/*
- * Copyright (c) 2021 Intel Corporation
+ * Copyright (c) 2021-2023 Intel Corporation
  */

 #ifndef _XE_MMIO_H_
@@ -120,6 +120,6 @@  static inline bool xe_mmio_in_range(const struct xe_mm=
io_range *range, u32 reg)
}

 int xe_mmio_probe_vram(struct xe_device *xe);
-int xe_mmio_total_vram_size(struct xe_device *xe, u64 *vram_size, u64 *fla=
t_ccs_base);
+int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vram_size, u64 *tile_siz=
e, u64 *tile_offset);

 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe=
_ttm_stolen_mgr.c
index 9136c035db0e..acc11f580db4 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -12,9 +12,11 @@
 #include <drm/ttm/ttm_range_manager.h>

 #include "regs/xe_regs.h"
+#include "regs/xe_gt_regs.h"
#include "xe_bo.h"
#include "xe_device.h"
#include "xe_gt.h"
+#include "xe_gt_mcr.h"
#include "xe_mmio.h"
#include "xe_res_cursor.h"
#include "xe_ttm_stolen_mgr.h"
@@ -51,21 +53,26 @@  bool xe_ttm_stolen_cpu_access_needs_ggtt(struct xe_dev=
ice *xe)
       return GRAPHICS_VERx100(xe) < 1270 && !IS_DGFX(xe);
}

-static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr=
 *mgr)
+static s64 detect_bar2_dgfx(struct xe_gt *gt, struct xe_ttm_stolen_mgr *mg=
r)
{
-       u64 vram_size, stolen_size;
+       u64 stolen_size;
+       u64 tile_offset;
+       u64 tile_size;
+       u64 vram_size;

-       vram_size =3D xe->mem.vram.io_size;
+       if (drm_WARN_ON(&gt->xe->drm,
+                        xe_mmio_vram_tile_size(gt, &vram_size, &tile_size,=
 &tile_offset)) < 0)
+                return 0;

        /* Use DSM base address instead for stolen memory */
-       mgr->stolen_base =3D xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) &=
 GEN12_BDSM_MASK;
-       if (drm_WARN_ON(&xe->drm, vram_size < mgr->stolen_base))
+       mgr->stolen_base =3D (xe_mmio_read64(gt, GEN12_DSMBASE.reg) & GEN12=
_BDSM_MASK) - tile_offset;
+       if (drm_WARN_ON(&gt->xe->drm, tile_size < mgr->stolen_base))
                return 0;

-       stolen_size =3D vram_size - mgr->stolen_base;
+       stolen_size =3D tile_size - mgr->stolen_base;
Should it be tile_offset instead,
stolen_size =3D tile_offset - mgr->stolen_base;
[mjruhl] The DSMBASE value (register)will be the offset to the DSM plus the=
 tile offset.  So I need to subtract the tile_offset
from the register value to get the base.  Once we get the base, the size is=
 calculated with the above tile_size value.
Thank you for your comments!
M

Thanks,
Tejas
-       if (mgr->stolen_base + stolen_size <=3D vram_size)
-                mgr->io_base =3D xe->mem.vram.io_start + mgr->stolen_base;
+       if (mgr->stolen_base + stolen_size <=3D tile_size)
+                mgr->io_base =3D gt->mem.vram.io_start + mgr->stolen_base;

        /*
        * There may be few KB of platform dependent reserved memory at the =
end
@@ -133,7 +140,7 @@  void xe_ttm_stolen_mgr_init(struct xe_device *xe)
       int err;

        if (IS_DGFX(xe))
-                stolen_size =3D detect_bar2_dgfx(xe, mgr);
+                stolen_size =3D detect_bar2_dgfx(to_gt(xe), mgr);
       else if (GRAPHICS_VERx100(xe) >=3D 1270)
                stolen_size =3D detect_bar2_integrated(xe, mgr);
       else


--_000_DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9DM5PR11MB1324namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Consolas;
	panose-1:2 11 6 9 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.EmailStyle19
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi Tejas,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"background:lime;mso-highlight:lime">[=
mjruhl] comments inline</span><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:none;border-left:solid blue 1.5pt;padding:0in 0in 0in =
4.0pt">
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0in =
0in 0in">
<p class=3D"MsoNormal"><b>From:</b> Upadhyay, Tejas &lt;tejas.upadhyay@inte=
l.com&gt; <br>
<b>Sent:</b> Friday, April 28, 2023 7:05 AM<br>
<b>To:</b> Ruhl, Michael J &lt;michael.j.ruhl@intel.com&gt;<br>
<b>Cc:</b> intel-xe@lists.freedesktop.org<br>
<b>Subject:</b> [2/3] drm/xe: Size GT device memory correctly<o:p></o:p></p=
>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Few comments inline over email as I have not yet got=
 subscription :<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">First of all I could&nbsp; not apply patch, it looks=
 like some patch landed yesterday which needs you patch to respin.<o:p></o:=
p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span style=3D"background:lime;mso-highlight:lime">[=
mjruhl] Hmmm, not sure why&#8230; I will make sure to rebase</span><o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div style=3D"border:solid #CCCCCC 1.0pt;padding:12.0pt 12.0pt 12.0pt 12.0p=
t">
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/regs=
/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h</span></b><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 05a03129dc54..dac24b99f526 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/regs/xe_gt_=
regs.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/regs/xe_gt_=
regs.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -75,7 +75,8 @@</span></b><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#define GEN12_VE1_AUX_NV&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _MMIO(0x42b8)<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#define&nbsp;&nbsp; AUX_INV&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; REG_BIT(0)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-#define XEHP_TILE0_ADDR_RANGE&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MCR_REG(0x4900)</span><span lang=3D"EN-IN" =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+#define XEHP_TILE_ADDR_RANGE(_idx)&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp; MCR_REG(0x4900 + (_idx) * 4)</span><span lang=3D"EN-IN" style=3D"font=
-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#define XEHP_FLAT_CCS_BASE_ADDR&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; MCR_REG(0x4910)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#define CHICKEN_RASTER_1&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MCR_REG(0x6204)=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_d=
evice_types.h b/drivers/gpu/drm/xe/xe_device_types.h</span></b><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 24dc5d2e9e05..ebd297ff6fcd 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_device_t=
ypes.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_device_t=
ypes.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">- * Copyright &copy; 2022 Intel Corpor=
ation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * Copyright &copy; 2022-2023 Intel Co=
rporation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#ifndef _XE_DEVICE_TYPES_H_<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -202,6 +202,8 @@</span></b><span lan=
g=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;struct xe_device {</span><s=
pan lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;* known as small-bar.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;*/<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resource_size_t io_size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /** @base: Offset to apply for Device Physical Ad=
dress control */</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-=
family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; resource_size_t base;</span><span lang=3D"EN-IN" =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /** @mapping: pointer to VRAM mappable space */<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; void *__iomem mapping;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } vram;<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_g=
t_types.h b/drivers/gpu/drm/xe/xe_gt_types.h</span></b><span lang=3D"EN-IN"=
 style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-l=
anguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 7c47d67aa8be..a2417cc2f696 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_gt_types=
.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_gt_types=
.h</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">- * Copyright &copy; 2022 Intel Corpor=
ation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * Copyright &copy; 2022-2023 Intel Co=
rporation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#ifndef _XE_GT_TYPES_H_<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -149,12 +149,14 @@</span></b><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;struct xe_gt {</span><span =
lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;* @io_size: IO size of this VRAM instance<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;* This represents how much of this VRAM we ca=
n access<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * via the CPU through the VRAM BAR. This can be =
smaller</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * than @size, in which case only part of VRAM is=
 CPU</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * accessible (typically the first 256M). This</s=
pan><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * configuration is known as small-bar.</span><sp=
an lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333=
333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * via the CPU through the VRAM BAR.</span><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * This can be smaller than the actual @size, in w=
hich</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * case only part of VRAM is CPU accessible (typic=
ally</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; * the first 256M). This configuration is known as=
 small-bar.</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-famil=
y:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; &nbsp;*/<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resource_size_t io_size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; /** @base: offset of VRAM starting base */</span>=
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; resource_size_t base;</span><span lang=3D"EN-IN" =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /** @size: size of VRAM. */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; resource_size_t size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp; /** @mapping: pointer to VRAM mappable space */<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_m=
mio.c b/drivers/gpu/drm/xe/xe_mmio.c</span></b><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 6c1591a4f43e..60c1b92a87f7 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_mmio.c</=
span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_mmio.c</=
span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -3,6 +3,8 @@</span></b><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;* Copyright &copy; 2021-2023=
 Intel Corporation<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+#include &lt;linux/minmax.h&gt;</span>=
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_mmio.h&quot;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#include &lt;drm/drm_managed.h&gt;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -184,32 +186,83 @@</span></b><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;int xe_determine_lmem_bar_s=
ize(struct xe_device *xe)</span><span lang=3D"EN-IN" style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(!xe-&gt;mem.vram.io_size)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EIO;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; x=
e-&gt;mem.vram.base =3D 0; /* DPA offset */</span><span lang=3D"EN-IN" styl=
e=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langua=
ge:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* =
set up a map to the total memory area. */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-=
&gt;mem.vram.mapping =3D ioremap_wc(xe-&gt;mem.vram.io_start, xe-&gt;mem.vr=
am.io_size);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+/*</span><span lang=3D"EN-IN" style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * 4 possible sizes:</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * - io size (from pci_resource_len of=
 LMEM bar)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * - TILEx size</span><span lang=3D"EN=
-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * - GSMBASE offset (TILEx - &quot;sto=
len&quot;)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * - CSSBASE offset (TILEx - CSS space=
 necessary)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-famil=
y:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ *</span><span lang=3D"EN-IN" style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * NOTE: CSSBASE is always lower/small=
er offset then GSMBASE.</span><span lang=3D"EN-IN" style=3D"font-size:10.0p=
t;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ *</span><span lang=3D"EN-IN" style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * The actual available size of memory=
 is to the CCS or GSM base.</span><span lang=3D"EN-IN" style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * NOTE: multi-tile bases will include=
 the tile offset.</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ */</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+int xe_mmio_vram_tile_size(struct xe_g=
t *gt, u64 *vram_size, u64 *tile_size, u64 *tile_offset)</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+{</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 offset;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
nt err;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
32 reg;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
rr =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);</span><span lang=3D"EN-IN=
" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (err)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;</span><spa=
n lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#3333=
33;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (gt-&gt;xe-&gt;info.has_flat_ccs) {</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D xe_gt_mcr_unic=
ast_read_any(gt, XEHP_FLAT_CCS_BASE_ADDR);</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D (u64)REG_FI=
ELD_GET(GENMASK(31, 8), reg) * SZ_64K;</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
 else {</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D xe_mmio_rea=
d64(gt, GEN12_GSMBASE.reg);</span><span lang=3D"EN-IN" style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (unlikely(gt-&gt;xe-&gt;info.platform =3D=3D XE_DG1)) {</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_size =3D offset;=
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_offset =3D 0;</s=
pan><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
 else {</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D xe_gt_mcr_unic=
ast_read_any(gt, XEHP_TILE_ADDR_RANGE(gt-&gt;info.id));</span><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_size =3D (u64)RE=
G_FIELD_GET(GENMASK(14, 8), reg) * SZ_1G;</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_offset =3D (u64)=
REG_FIELD_GET(GENMASK(7, 1), reg) * SZ_1G;</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }=
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* remove the tile offset so we have just the available size */</span><span =
lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *=
vram_size =3D offset - *tile_offset;</span><span lang=3D"EN-IN" style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
eturn xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);</span><span lang=3D"EN-IN"=
 style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-l=
anguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+}</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">int xe_mmio_probe_vram(struct xe_device =
*xe)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; r=
esource_size_t io_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0p=
t;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 available_size =3D 0;</span><span lang=3D"EN-IN" style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 total_size =3D 0;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;f=
ont-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; str=
uct xe_gt *gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 tile_offset;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 tile_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 vram_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int=
 err;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 =
id;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (!IS_DGFX(xe)) {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.mappi=
ng =3D 0;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.io_st=
art =3D 0;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.io_si=
ze =3D 0;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, i=
d) {</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.mapping =3D 0;</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =3D 0;</span><span lang=3D"=
EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_start =3D 0;</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D 0;</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;xe-&gt;mem=
.vram, 0, sizeof(xe-&gt;mem.vram));</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id=
)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas=
;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;gt-&gt;mem.vram, 0, sizeof(gt-&gt;mem=
.vram));</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* Get the size of the gt0 vram for later accessibility comparison */</span>=
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
t =3D xe_device_get_gt(xe, 0);</span><span lang=3D"EN-IN" style=3D"font-siz=
e:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; e=
rr =3D xe_mmio_vram_tile_size(gt, &amp;vram_size, &amp;tile_size, &amp;tile=
_offset);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (err)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;</span><spa=
n lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#3333=
33;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err=
 =3D xe_determine_lmem_bar_size(xe);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(err)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -217,57 +270,53 @@</span></b><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;int xe_mmio_probe_vram(stru=
ct xe_device *xe)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm=
_info(&amp;xe-&gt;drm, &quot;VISIBLE VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;me=
m.vram.io_start,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&amp;xe-&gt;mem.vr=
am.io_size);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
/* FIXME: Assuming equally partitioned VRAM, incorrect */</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (xe-&gt;info.tile_count &gt; 1) {</span><span lang=3D"EN-IN" style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 adj_tile_count =3D=
 xe-&gt;info.tile_count;</span><span lang=3D"EN-IN" style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resource_size_t size,=
 io_start, io_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* small bar issues will only cover gt0 sizes */</span><span lang=3D"EN-IN" =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (xe-&gt;mem.vram.io_size &lt; vram_size)</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&gt;d=
rm, &quot;Restricting VRAM size to PCI resource size (0x%llx-&gt;0x%llx)\n&=
quot;,</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; vram_size, (u64)xe-&gt;mem.vram.io_size);</span><=
span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, i=
d)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_gt_is_media_type(gt))</span><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
--adj_tile_count;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
o_size =3D xe-&gt;mem.vram.io_size;</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_BUG_ON(!adj_tile_c=
ount);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /=
* gt specific ranges */</span><span lang=3D"EN-IN" style=3D"font-size:10.0p=
t;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; f=
or_each_gt(gt, xe, id) {</span><span lang=3D"EN-IN" style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_gt_is_media_typ=
e(gt))</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; continue;</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D xe-&gt;mem.v=
ram.io_size / adj_tile_count;</span><span lang=3D"EN-IN" style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_start =3D xe-&gt;m=
em.vram.io_start;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_size =3D xe-&gt;mem.vram.io_s=
ize;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_mmio_vram_t=
ile_size(gt, &amp;vram_size, &amp;tile_size, &amp;tile_offset);</span><span=
 lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#33333=
3;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)</span><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; return err;</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, i=
d) {</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (id &amp;&amp; !xe_gt_is_media_type(gt)) {</s=
pan><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
io_size -=3D min(io_size, size);</span><span lang=3D"EN-IN" style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
io_start +=3D io_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span lang=3D"EN-IN" style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_sta=
rt =3D xe-&gt;mem.vram.io_start + tile_offset;</span><span lang=3D"EN-IN" s=
tyle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lan=
guage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =3D size;</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; /*</span><span lang=3D"EN-IN" style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * XXX: multi-tile small-bar might be wild. Hopef=
ully</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * full tile without any mappable vram is not som=
ething</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; * we care about.</span><span lang=3D"EN-IN" styl=
e=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langua=
ge:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; */</span><span lang=3D"EN-IN" style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D min(size, io_size);<=
/span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; if (io_size) {</span><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gt-&gt;mem.vram.io_start =3D io_start;</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
gt-&gt;mem.vram.mapping =3D xe-&gt;mem.vram.mapping +</span><span lang=3D"E=
N-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (io_start - xe-&gt;me=
m.vram.io_start);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; } else {</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
drm_err(&amp;xe-&gt;drm, &quot;Tile without any CPU visible VRAM. Aborting.=
\n&quot;);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
return -ENODEV;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span lang=3D"EN-IN" style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* io_size &quot;could=
 be 0&quot; for small-bar systems, so no CPU access */</span><span lang=3D"=
EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_siz=
e =3D min_t(u64, vram_size, io_size);</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.base =
=3D xe-&gt;mem.vram.base + tile_offset;</span><span lang=3D"EN-IN" style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =
=3D vram_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fa=
mily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.mappin=
g =3D xe-&gt;mem.vram.mapping + tile_offset;</span><span lang=3D"EN-IN" sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;d=
rm, &quot;VRAM[%u, %u]: %pa, %pa\n&quot;, id, gt-&gt;info.vram_id,</span><s=
pan lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; &amp;gt-&gt;mem.vram.io_start, &amp;gt-&gt;mem.vr=
am.size);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gt-&gt;mem.vram.io=
_size &lt; gt-&gt;mem.vram.size)</span><span lang=3D"EN-IN" style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: CPU=
 access limited to %pa\n&quot;, id,</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; g=
t-&gt;info.vram_id, &amp;gt-&gt;mem.vram.io_size);</span><span lang=3D"EN-I=
N" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast=
-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* calculate total siz=
e using tile size to get the correct HW sizing */</span><span lang=3D"EN-IN=
" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_size +=3D tile_s=
ize;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available_size +=3D vr=
am_size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">I think you can make this available_size=
 =3D vram_size; instead as last GT for which this loop runs,<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Will get total available size. Otherwise=
 you may get more size than actual available. For example,<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">10 bytes for tile0, 10 bytes for tile1, =
20 bytes for tile2 should return total 40b, but I think with<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Above logic you will get 10 + 20 + 40. I=
 am assuming offset is incremental per tile. If you can give
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Memory offset overall snapshot, that mig=
ht help in case I am wrong.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">[mjruhl] vram_size, tile_size, and tile_offse=
t are accessed for each gt. so vram_size is the &#8220;tile size &#8211; an=
y stolen&#8221; portion.&nbsp; So</span><span lang=3D"EN-IN" style=3D"backg=
round:lime;mso-highlight:lime;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">vram should be the &#8220;available memory fo=
r the specific tile&#8221;, not an accumulation of tiles.&nbsp; So the addi=
tion should be 10 + 10 + 20.</span><span lang=3D"EN-IN" style=3D"background=
:lime;mso-highlight:lime;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">I will double check my logic.</span><span lan=
g=3D"EN-IN" style=3D"color:black;mso-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"background:lime;mso-highlight:lime;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: %p=
a, %pa\n&quot;,</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
id, gt-&gt;info.vram_id, &amp;gt-&gt;mem.vram.io_start,</span><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&amp;gt-&gt;mem.vram.size);</span><span lang=3D"EN-IN" style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (total_size &gt; xe=
-&gt;mem.vram.io_size) {</span><span lang=3D"EN-IN" style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&gt;drm, &quot;VRAM: %pa is larg=
er than resource %pa\n&quot;,</span><span lang=3D"EN-IN" style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &=
amp;total_size, &amp;xe-&gt;mem.vram.io_size);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
} else {</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =
=3D xe-&gt;mem.vram.io_size;</span><span lang=3D"EN-IN" style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_st=
art =3D xe-&gt;mem.vram.io_start;</span><span lang=3D"EN-IN" style=3D"font-=
size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_si=
ze =3D xe-&gt;mem.vram.io_size;</span><span lang=3D"EN-IN" style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.mappi=
ng =3D xe-&gt;mem.vram.mapping;</span><span lang=3D"EN-IN" style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;=
drm, &quot;VRAM: %pa\n&quot;, &amp;gt-&gt;mem.vram.size);</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_size -=3D min_t(u64=
, tile_size, io_size);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+</span><span lang=3D"EN-IN" style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; d=
rm_info(&amp;xe-&gt;drm, &quot;Available VRAM: %pa, %pa\n&quot;, &amp;xe-&g=
t;mem.vram.io_start,</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;f=
ont-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;available_size);<=
/span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Here it can be little more readable, but=
 its my opinion, up to you :<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">drm_info(&amp;xe-&gt;drm, &quot;Availabl=
e VRAM: start addr: %pa, size: %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start,<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;available_siz=
e);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:b=
lack;background:lime;mso-highlight:lime;mso-fareast-language:EN-IN">[mjruhl=
] Yeah waffled on adding the start/addr info.&nbsp; Will add.</span><span l=
ang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -287,9 +336,6 @@</span></b><span lan=
g=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;static void xe_mmio_probe_t=
iles(struct xe_device *xe)</span><span lang=3D"EN-IN" style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(xe-&gt;info.media_verx100 &gt;=3D 1300)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;info.tile_count *=
=3D 2;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
drm_info(&amp;xe-&gt;drm, &quot;tile_count: %d, adj_tile_count %d\n&quot;,<=
/span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;info.tile_coun=
t, adj_tile_count);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if =
(xe-&gt;info.tile_count &gt; 1) {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const int mmio_bar =3D 0=
;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_m=
mio.h b/drivers/gpu/drm/xe/xe_mmio.h</span></b><span lang=3D"EN-IN" style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 1a32e0f52261..1c588db0b074 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_mmio.h</=
span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_mmio.h</=
span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">- * Copyright &copy; 2021 Intel Corpor=
ation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+ * Copyright &copy; 2021-2023 Intel Co=
rporation</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#ifndef _XE_MMIO_H_<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -120,6 +120,6 @@</span></b><span lan=
g=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;static inline bool xe_mmio_=
in_range(const struct xe_mmio_range *range, u32 reg)</span><span lang=3D"EN=
-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;int xe_mmio_probe_vram(struct xe_d=
evice *xe);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-int xe_mmio_total_vram_size(struct xe=
_device *xe, u64 *vram_size, u64 *flat_ccs_base);</span><span lang=3D"EN-IN=
" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+int xe_mmio_vram_tile_size(struct xe_g=
t *gt, u64 *vram_size, u64 *tile_size, u64 *tile_offset);</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#endif<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_t=
tm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c</span></b><span la=
ng=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">index 9136c035db0e..acc11f580db4 100=
644</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_ttm_stol=
en_mgr.c</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fami=
ly:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:seagreen;mso-fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_ttm_stol=
en_mgr.c</span></b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fami=
ly:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -12,9 +12,11 @@</span></b><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#include &lt;drm/ttm/ttm_range_man=
ager.h&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;#include &quot;regs/xe_regs.h&quot=
;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+#include &quot;regs/xe_gt_regs.h&quot;=
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_bo.h&quot;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_device.h&quot;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_gt.h&quot;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+#include &quot;xe_gt_mcr.h&quot;</span=
><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_mmio.h&quot;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_res_cursor.h&quot;<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">#include &quot;xe_ttm_stolen_mgr.h&quot;=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -51,21 +53,26 @@</span></b><span lan=
g=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;bool xe_ttm_stolen_cpu_acce=
ss_needs_ggtt(struct xe_device *xe)</span><span lang=3D"EN-IN" style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ret=
urn GRAPHICS_VERx100(xe) &lt; 1270 &amp;&amp; !IS_DGFX(xe);<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-static s64 detect_bar2_dgfx(struct xe=
_device *xe, struct xe_ttm_stolen_mgr *mgr)</span><span lang=3D"EN-IN" styl=
e=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langua=
ge:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+static s64 detect_bar2_dgfx(struct xe_=
gt *gt, struct xe_ttm_stolen_mgr *mgr)</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
u64 vram_size, stolen_size;</span><span lang=3D"EN-IN" style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 stolen_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 tile_offset;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 tile_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u=
64 vram_size;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
vram_size =3D xe-&gt;mem.vram.io_size;</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (drm_WARN_ON(&amp;gt-&gt;xe-&gt;drm,</span><span lang=3D"EN-IN" style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; xe_mmio_vram_tile_size(gt, &amp;vram_size, &amp;t=
ile_size, &amp;tile_offset)) &lt; 0)</span><span lang=3D"EN-IN" style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</span><span =
lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; /* Use DSM base address instead for stolen memory */<o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
mgr-&gt;stolen_base =3D xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) &amp; =
GEN12_BDSM_MASK;</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-=
family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (drm_WARN_ON(&amp;xe-&gt;drm, vram_size &lt; mgr-&gt;stolen_base))</span=
><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; m=
gr-&gt;stolen_base =3D (xe_mmio_read64(gt, GEN12_DSMBASE.reg) &amp; GEN12_B=
DSM_MASK) - tile_offset;</span><span lang=3D"EN-IN" style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (drm_WARN_ON(&amp;gt-&gt;xe-&gt;drm, tile_size &lt; mgr-&gt;stolen_base))=
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
stolen_size =3D vram_size - mgr-&gt;stolen_base;</span><span lang=3D"EN-IN"=
 style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-l=
anguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; s=
tolen_size =3D tile_size - mgr-&gt;stolen_base;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Should it be tile_offset instead,<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">stolen_size =3D tile_offset - mgr-&gt;st=
olen_base;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">[mjruhl] The DSMBASE value (register)will be =
the offset to the DSM plus the tile offset.&nbsp; So I need to subtract the=
 tile_offset</span><span lang=3D"EN-IN" style=3D"background:lime;mso-highli=
ght:lime;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">from the register value to get the base.&nbsp=
; Once we get the base, the size is calculated with the above tile_size val=
ue.</span><span lang=3D"EN-IN" style=3D"background:lime;mso-highlight:lime;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">Thank you for your comments!</span><span lang=
=3D"EN-IN" style=3D"background:lime;mso-highlight:lime;mso-fareast-language=
:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"color:black;background:lime;mso-highlight:lim=
e;mso-fareast-language:EN-IN">M</span><span lang=3D"EN-IN" style=3D"mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;mso-line-height-alt:10.=
75pt;background:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
C55A11;mso-fareast-language:EN-IN">Tejas<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if (mgr-&gt;stolen_base + stolen_size &lt;=3D vram_size)</span><span lang=
=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;io_base =3D x=
e-&gt;mem.vram.io_start + mgr-&gt;stolen_base;</span><span lang=3D"EN-IN" s=
tyle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lan=
guage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; i=
f (mgr-&gt;stolen_base + stolen_size &lt;=3D tile_size)</span><span lang=3D=
"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;io_base =3D gt=
-&gt;mem.vram.io_start + mgr-&gt;stolen_base;</span><span lang=3D"EN-IN" st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; /*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nb=
sp;* There may be few KB of platform dependent reserved memory at the end<o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<b><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:brown;mso-fareast-language:EN-IN">@@ -133,7 +140,7 @@</span></b><span lan=
g=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN">
</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;=
color:#A020F0;mso-fareast-language:EN-IN">&nbsp;void xe_ttm_stolen_mgr_init=
(struct xe_device *xe)</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int=
 err;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p; if (IS_DGFX(xe))<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:s=
lateblue;mso-fareast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detec=
t_bar2_dgfx(xe, mgr);</span><span lang=3D"EN-IN" style=3D"font-size:10.0pt;=
font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:d=
arkcyan;mso-fareast-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detect=
_bar2_dgfx(to_gt(xe), mgr);</span><span lang=3D"EN-IN" style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; els=
e if (GRAPHICS_VERx100(xe) &gt;=3D 1270)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detect_b=
ar2_integrated(xe, mgr);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all">
<span lang=3D"EN-IN" style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; els=
e<o:p></o:p></span></p>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</div>
</body>
</html>

--_000_DM5PR11MB1324ACB1F1C2DC00FF6FB72DC16B9DM5PR11MB1324namp_--
