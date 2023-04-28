Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 287F5C77B60
	for <intel-xe@archiver.kernel.org>; Fri, 28 Apr 2023 11:04:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 031CC10ECC9;
	Fri, 28 Apr 2023 11:04:40 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05FE10ECC9
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Apr 2023 11:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682679878; x=1714215878;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=dFY6B6RgN3rOISrdE90er0shuQFFVS8xS0modnf1jnM=;
 b=XbMblVPMNO+F7/t/0syTb7Myn6HUbyr9G7btvbv3yR+3RUqYFoEV/K6s
 xf/ZoHWOolb0Dy3RfWZUK+82Y5hTNGn37nyvJFLkvuTjA6Awa/HxhJGX+
 51IFXwXdN/tOABjjQZzu4/cKHazihJOL8dP4UG7Lhae4w3BC5XPT7qmvg
 hujiBHTeqJVXXhUbtnE4mj4HluUdPucttWhItcKEkCzXcDcF0Srl36jMa
 JLOU9/m5INWrsTlK7R5Z0hmfHeTAqF6v7TjSJnttPt72PB1/dqF6XrQOq
 DBXEFCb717zNy0WbkxsU4p+emAc8HN7z+l28ldGKggfIJy6ojUEk7yS/+ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="375709788"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
 d="scan'208,217";a="375709788"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2023 04:04:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="697502075"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
 d="scan'208,217";a="697502075"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga007.fm.intel.com with ESMTP; 28 Apr 2023 04:04:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 04:04:37 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 28 Apr 2023 04:04:36 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 28 Apr 2023 04:04:36 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 28 Apr 2023 04:04:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k93aDfaPYtWm0RjUXIcsJS+0NfcgB+CjEd/5zGZIRoXwqgMqbtZQVHsllq8IP6nxeKsLEfqZnA0HmFzN+HC1KzPpUm733hxQgS5/MJ2lG469NvNqpmZExrHaQBxNn78AinofpZps9PskV0JpiozTxlzgAgumbjSCvlXkKssQ9IdpqqR9EGJZpfkiVTp38YlRg118Oam6j2ZfKeGD/hbdOLg28FokAFTRK8UzK/sOm/lTAUBi67/7vHcDIzTI/PVuNHpXGQoBJJCLNzfUgOMG7uUJk0fBE/7UC1YBpVgL/hUNcSBKCm6v5e9X/R72+4ewoUY+8zVnDjnzjG7yYit6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZbSNh0xCpLPDqkn8UUePrUdgjacXYu0Lg5fYd5JF7o4=;
 b=PtpAKhthvW9Mq01Lmpuw/ZDbcADEVbEvbujilbfX8maLQfdSfhiys4b6ijPA3SwDFJiTZrcKCs0GNwmVKP6SYijFEpvD/h3H3+VGgBMBpujFeUtPAJILkNa7c+xI4Poqwl229duLSHNFKTCOxXDSoYxBbS0naZ4TyCmrJwzoak+Suydrr/5wrmuqWNK+CF11EpRSg63r5UBMPhFXBQ4U0JDpiWdvxgbErt0fcJKI7+Hg+sUn3S4HVgeMqogPvhoBq6nr0aYBmnKWuskhB0KstMkCIodNy1QPOT9h264jVvEuGOKGOdAigQ0TuHrb/1PEjpvCKBdn/3I5VHODe2+hVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Fri, 28 Apr
 2023 11:04:33 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6340.021; Fri, 28 Apr 2023
 11:04:33 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Thread-Topic: [2/3] drm/xe: Size GT device memory correctly
Thread-Index: Adl5vzP0su11Q7P5SKWmDOHuj401dA==
Date: Fri, 28 Apr 2023 11:04:33 +0000
Message-ID: <SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH8PR11MB7093:EE_
x-ms-office365-filtering-correlation-id: 2690dca7-4bbd-4295-6644-08db47d858d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: JcpBB5rgyfLUN1D4+t1RildOtIl6o3eNRSc0pM0UBh7VePPM2Enujm/fkQYFe5avb3zGeNDtiRoAogJ+W/l6thP9xrsbk50oCVCq6zlgZcCforH7oPZo3jV92rcyUtRhNjoRrccK/7pkfnGhTqreu9AnDds5Moa0FAXSFxhXxmKRkS4h2BGQZGTXolDLtTDwzLPGHUVGp1g8Dmv3mOd+ie/SYLyc2bcQdyhE4GJQN3UUP0YRAtLBVJX6gOw7LSWiEVZ5NOU7iSLSKU+eE7W2JvoRNi4U6fsHCze5zTYrFwj5R9BtXOarTngBVKWWoxf28H5GhWpZOnPYSH0OrpsA6I1x/0OajLnlyPDv6rXFJqNZXJ3E95WnTJz/JuWCr5MZ566OAo5BhDUU+69UnEPogqswQtEBXuGokbsFLzcSoxP4Z8uZCa3OeDvMRhUZNAVlO2KyWcJWUbr/ODaxewHH/B+DdoezMqVV6r+UXnAhtpK6CJUZzybR3IdowRoyePkPMvaYTIhuMPut+Igs8ZwZKTWIMi3SMDa0uwrhRJc7h2ApSJekGpva9uMhYViEOrYHjB9tPfD0avg4QcaawA/VKZqPhz3fHGcdnopUppyuQx81j9SRJio5Z2u7KnCe0mBrd5wAQgrI6EEAvBoHHcvBKA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199021)(66446008)(66556008)(76116006)(316002)(66476007)(6636002)(4326008)(66946007)(5660300002)(55016003)(82960400001)(52536014)(6862004)(41300700001)(8936002)(64756008)(8676002)(38070700005)(2906002)(38100700002)(30864003)(122000001)(186003)(6506007)(9686003)(83380400001)(33656002)(86362001)(478600001)(71200400001)(7696005)(21314003)(579004)(559001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wUiMnPntpY5t9vW+Ii4mZf5wQMP8WuOSMj/5qNVFIbDl+cTr82/GMtNYdjNn?=
 =?us-ascii?Q?/4XsARbym0SUJnpy1ScNHsBcnl/0UlTm06U3my92X8bJ1kjlVX6JhsBm9g6p?=
 =?us-ascii?Q?U1PhBDLcZeqTnZSFTTvQ5HFXiu1QqLR06n2B0IOfmo6c5LCCpko/PJhD2HKs?=
 =?us-ascii?Q?QVeZNyY9SZupqQygotha5G4Tch2wpvjIynUT3T4EPDx4VZ/t3VCxoQuVTefK?=
 =?us-ascii?Q?0fUnPojtRfF4wo95WuWOk7ZlQBAqoq6Hjb5uvBdpqJpFaWob1RMGGT3lcWVu?=
 =?us-ascii?Q?Jf+nz7LxOPZJGjebyeQDUMQ/KYVH3uOTvnE0+mm4QrkLAVXqvbCkCmYFokWW?=
 =?us-ascii?Q?nMcUSZAJLL+2TPBc3lqoXjmMuw4JLT84RK74VO3o4v+4V1BwtX2pL84Dtc5u?=
 =?us-ascii?Q?cdAMwmbn20UEHcey8ySMQQYa+wYFEakaL4i6fFrmFQVRATUGxZU5TWSVRC21?=
 =?us-ascii?Q?v+XBPJg5E9wDp6rGnEuIXWWKv0CRVvGyGes+BmyMraW5Ha85Rzozlna/pOLe?=
 =?us-ascii?Q?TUx8pw7ZJsmo8HoxFetq3VH2xQ8dJyOi489v4BMwzlX+HWxsa1siFIfEPAP3?=
 =?us-ascii?Q?PQQmmUEZVMna26VdU2Si2hQAyBvh5y+uB0YVTOYla+YnTnXu+zIA1Ab4joih?=
 =?us-ascii?Q?Qj7jETc9dUS7iyGGdjbeFXPHIlRoaOE53BNL9HQEkLMOqNB37oyHckn/oYrC?=
 =?us-ascii?Q?PZ3HZE+kkyrIRrGo1UEfx9lfAd6ytQEGIKJ6PaO0AiZ8yAjO+ZTwUCGvtB1w?=
 =?us-ascii?Q?EqHWQyZ0VJyjrP6ITrSHaqEfFrNWVAQtMzbcDiSR6rtTLbdTamVmYPKCsAqy?=
 =?us-ascii?Q?Zpwp0H0qvRcT0dNSFd7c2pJQSYCEfMxjg23fyS8iyWqOSvjmqlEaGRwq/JnK?=
 =?us-ascii?Q?gNV7l+GSb30SfhqYgbxVnkeRC4UUZFUYqbuv1VXm4I5OFwG9pboqZ0nOB6KO?=
 =?us-ascii?Q?vGg5ULeSBISyMikJ138gww8VzaUlOoS9UUIhyX00jcniYJ8afPJqe/pLcYoN?=
 =?us-ascii?Q?xQzlH7zJfw4fmKyHYBJMfu4vno4oMbdWKc5wdxKnjYMKuUaI5ehpX8vcyP4B?=
 =?us-ascii?Q?nOq6Q8eTGwfEdNPIvDjiv1eaQ/sHFkP9bmCwCkEP2L4JyukGxfdqood0Aiwo?=
 =?us-ascii?Q?EZexP2cz/0CWDHkSOE9bLU1cdzcESQa+wAsl9SHh11tQaAbTxSnND0fpb98+?=
 =?us-ascii?Q?ynDsr/pQvp0PjcGHHHVTiaJ4aOPALxE3C6Y6EBjFs4VkHxc1apqh6IX07gKE?=
 =?us-ascii?Q?rP4epQwpKp7ablDb+XObJnVT4IzJB5CtD8fiMBQoikdX2Tja1lfNd59dXU0f?=
 =?us-ascii?Q?2lsfV14RwfsuOKDr40O5Pcw1yywiRvMLjoxdb1FhDF3L6j00TcB8sw559iT0?=
 =?us-ascii?Q?i2sPdoKl6+Sc7t7WwzwzISPeJ7t+KExUYDeEylcFfadpctDK0Zg+ec3rsLdO?=
 =?us-ascii?Q?WRqZDH3OcPP/mvyz4YhZsEckyVCk+yCUtwulUzUSpgjy2YKTrsixJTXhaM5T?=
 =?us-ascii?Q?BH+tZETynsRMl/GV10h+Q8ozpMgRKEb1VjksRNzTGslxzwnNZ69WEoQxEZYd?=
 =?us-ascii?Q?hienuPIh6sAAFQRXbRnHdiy9lNEwvAByHyguHcf+9AwufVLrwikMh5J8nI++?=
 =?us-ascii?Q?tIlK2u/eunVYI8S4oVy4ZqiES9DMTf12iKD3tsEOwNLP?=
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9SJ1PR11MB6204namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2690dca7-4bbd-4295-6644-08db47d858d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2023 11:04:33.1645 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qdc4uuXLMSHWWmYoST50ayD3PV9QHI8M+gxis8MybScUNQNejwrmXnhLibfW0X+onGRbKzwQ49ZhxZGkFhysZzIs6IMRQozljXKl6krULoA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [2/3] drm/xe: Size GT device memory correctly
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

--_000_SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9SJ1PR11MB6204namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Few comments inline over email as I have not yet got subscription :

First of all I could  not apply patch, it looks like some patch landed yest=
erday which needs you patch to respin.

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


--_000_SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9SJ1PR11MB6204namp_
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Few comments inline over email =
as I have not yet got subscription :<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">First of all I could&nbsp; not =
apply patch, it looks like some patch landed yesterday which needs you patc=
h to respin.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div style=3D"mso-element:para-border-div;border:solid #CCCCCC 1.0pt;paddin=
g:12.0pt 12.0pt 12.0pt 12.0pt;background:white">
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b=
/drivers/gpu/drm/xe/regs/xe_gt_regs.h</span></b><span style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 05a03129dc54..dac24b99f526 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h</span></=
b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h</span></=
b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -75,7 +75,8 @@</span></b><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#define GEN12_VE1_AUX_NV&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; _MMIO(0x42b8)<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#define&nbsp;&nbsp; AUX_INV&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; REG_BIT(0)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-#define XEHP_TILE0_ADDR_RANGE&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; MCR_REG(0x4900)</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#define XEHP_TILE_ADDR_RANGE(_idx)&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MCR_REG(0=
x4900 + (_idx) * 4)</span><span style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#define XEHP_FLAT_CCS_BASE_ADDR&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; MCR_REG(0x4910)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#define CHICKEN_RASTER_1&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MCR_REG(0x6204)<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_device_types.h b=
/drivers/gpu/drm/xe/xe_device_types.h</span></b><span style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 24dc5d2e9e05..ebd297ff6fcd 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_device_types.h</span></=
b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_device_types.h</span></=
b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">- * Copyright &copy; 2022 Intel Corporation</span><sp=
an style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast=
-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * Copyright &copy; 2022-2023 Intel Corporation</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#ifndef _XE_DEVICE_TYPES_H_<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -202,6 +202,8 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;struct xe_device {</span><span style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;* known as small-bar.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;*/<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; resource_size_t io_size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /** @base: Offset to apply for Device Physical Address control *=
/</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; resource_size_t base;</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /** @mapping: pointer to VRAM mappable space */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; void *__iomem mapping;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } vram;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/dri=
vers/gpu/drm/xe/xe_gt_types.h</span></b><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 7c47d67aa8be..a2417cc2f696 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_gt_types.h</span></b><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_gt_types.h</span></b><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">- * Copyright &copy; 2022 Intel Corporation</span><sp=
an style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast=
-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * Copyright &copy; 2022-2023 Intel Corporation</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#ifndef _XE_GT_TYPES_H_<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -149,12 +149,14 @@</span></b><span style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;struct xe_gt {</span><span style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;* @io_size: IO size of this VRAM instance<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;* This represents how much of this VRAM we can access<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * via the CPU through the VRAM BAR. This can be smaller</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * than @size, in which case only part of VRAM is CPU</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * accessible (typically the first 256M). This</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * configuration is known as small-bar.</span><span style=3D"fon=
t-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN=
"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * via the CPU through the VRAM BAR.</span><span style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * This can be smaller than the actual @size, in which</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * case only part of VRAM is CPU accessible (typically</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; * the first 256M). This configuration is known as small-bar.</sp=
an><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-f=
areast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; &nbsp;*/<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; resource_size_t io_size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; /** @base: offset of VRAM starting base */</span><span style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; resource_size_t base;</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /** @size: size of VRAM. */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; resource_size_t size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; /** @mapping: pointer to VRAM mappable space */<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers=
/gpu/drm/xe/xe_mmio.c</span></b><span style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 6c1591a4f43e..60c1b92a87f7 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_mmio.c</span></b><span =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_mmio.c</span></b><span =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -3,6 +3,8 @@</span></b><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;* Copyright &copy; 2021-2023 Intel Corporat=
ion<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#include &lt;linux/minmax.h&gt;</span><span style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_mmio.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &lt;drm/drm_managed.h&gt;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -184,32 +186,83 @@</span></b><span style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;int xe_determine_lmem_bar_size(struct xe_d=
evice *xe)</span><span style=3D"font-size:10.0pt;font-family:Consolas;color=
:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!xe-&gt;mem.vr=
am.io_size)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -EIO;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.=
base =3D 0; /* DPA offset */</span><span style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* set up a map to=
 the total memory area. */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.ma=
pping =3D ioremap_wc(xe-&gt;mem.vram.io_start, xe-&gt;mem.vram.io_size);<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+/*</span><span style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * 4 possible sizes:</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * - io size (from pci_resource_len of LMEM bar)</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * - TILEx size</span><span style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * - GSMBASE offset (TILEx - &quot;stolen&quot;)</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * - CSSBASE offset (TILEx - CSS space necessary)</sp=
an><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-f=
areast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ *</span><span style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * NOTE: CSSBASE is always lower/smaller offset then =
GSMBASE.</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ *</span><span style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * The actual available size of memory is to the CCS =
or GSM base.</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * NOTE: multi-tile bases will include the tile offse=
t.</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ */</span><span style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vra=
m_size, u64 *tile_size, u64 *tile_offset)</span><span style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+{</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 offset;</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reg;</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_force=
_wake_get(gt_to_fw(gt), XE_FW_GT);</span><span style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;</span><span style=3D"font=
-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gt-&gt;xe-&g=
t;info.has_flat_ccs) {</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D xe_gt_mcr_unicast_read_any(gt=
, XEHP_FLAT_CCS_BASE_ADDR);</span><span style=3D"font-size:10.0pt;font-fami=
ly:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D (u64)REG_FIELD_GET(GENMASK=
(31, 8), reg) * SZ_64K;</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; offset =3D xe_mmio_read64(gt, GEN12_G=
SMBASE.reg);</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (unlikely(gt-=
&gt;xe-&gt;info.platform =3D=3D XE_DG1)) {</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_size =3D offset;</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_offset =3D 0;</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reg =3D xe_gt_mcr_unicast_read_any(gt=
, XEHP_TILE_ADDR_RANGE(gt-&gt;info.id));</span><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_size =3D (u64)REG_FIELD_GET(GEN=
MASK(14, 8), reg) * SZ_1G;</span><span style=3D"font-size:10.0pt;font-famil=
y:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *tile_offset =3D (u64)REG_FIELD_GET(G=
ENMASK(7, 1), reg) * SZ_1G;</span><span style=3D"font-size:10.0pt;font-fami=
ly:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* remove the ti=
le offset so we have just the available size */</span><span style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; *vram_size =3D o=
ffset - *tile_offset;</span><span style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return xe_force_=
wake_put(gt_to_fw(gt), XE_FW_GT);</span><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+}</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">int xe_mmio_probe_vram(struct xe_device *xe)<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resource_size_t =
io_size;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 available_si=
ze =3D 0;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 total_size =
=3D 0;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_gt *gt;<=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 tile_offset;=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 tile_size;</=
span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 vram_size;</=
span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 id;<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (!IS_DGFX=
(xe)) {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.mapping =3D 0;</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.io_start =3D 0;</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;mem.vram.io_size =3D 0;</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.mapping =3D 0;</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.size =3D 0;</span><span style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.io_start =3D 0;</span><span style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D 0;</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; memset(&amp;xe-&gt;mem.vram, 0, sizeo=
f(xe-&gt;mem.vram));</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id)</span><span s=
tyle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lan=
guage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; memset(&amp;gt-&gt;mem.vram, 0, sizeof(gt-&gt;mem.vram));</span>=
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Get the size =
of the gt0 vram for later accessibility comparison */</span><span style=3D"=
font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN=
-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt =3D xe_device=
_get_gt(xe, 0);</span><span style=3D"font-size:10.0pt;font-family:Consolas;=
color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_mmio_=
vram_tile_size(gt, &amp;vram_size, &amp;tile_size, &amp;tile_offset);</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;</span><span style=3D"font=
-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"=
><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_determi=
ne_lmem_bar_size(xe);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -217,57 +270,53 @@</span></b><span style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;int xe_mmio_probe_vram(struct xe_device *x=
e)</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&=
gt;drm, &quot;VISIBLE VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start=
,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&amp;xe-&gt;mem.vram.io_size);<o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* FIXME: Assum=
ing equally partitioned VRAM, incorrect */</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;info=
.tile_count &gt; 1) {</span><span style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 adj_tile_count =3D xe-&gt;info.ti=
le_count;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; resource_size_t size, io_start, io_s=
ize;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3333=
33;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* small bar iss=
ues will only cover gt0 sizes */</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;mem.v=
ram.io_size &lt; vram_size)</span><span style=3D"font-size:10.0pt;font-fami=
ly:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p=
>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_warn(&amp;xe-&gt;drm, &quot;Restr=
icting VRAM size to PCI resource size (0x%llx-&gt;0x%llx)\n&quot;,</span><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; vram_size, (u64)xe-&gt;mem.vram.io_size);</span><span style=3D"f=
ont-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-=
IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id)</span><span =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; if (xe_gt_is_media_type(gt))</span><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --adj_tile_coun=
t;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_size =3D xe-&=
gt;mem.vram.io_size;</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_BUG_ON(!adj_tile_count);</span><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* gt specific r=
anges */</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#=
333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, =
xe, id) {</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe_gt_is_media_type(gt))</span><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; continue;</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size =3D xe-&gt;mem.vram.io_size / a=
dj_tile_count;</span><span style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_start =3D xe-&gt;mem.vram.io_star=
t;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; io_size =3D xe-&gt;mem.vram.io_size;</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; err =3D xe_mmio_vram_tile_size(gt, &a=
mp;vram_size, &amp;tile_size, &amp;tile_offset);</span><span style=3D"font-=
size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (err)</span><span style=3D"font-si=
ze:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o=
:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; return err;</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for_each_gt(gt, xe, id) {</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; if (id &amp;&amp; !xe_gt_is_media_type(gt)) {</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_size -=3D mi=
n(io_size, size);</span><span style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_start +=3D i=
o_size;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }</span><span style=3D"font-size:10.0pt;font-family:Consolas;co=
lor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_start =3D xe-&gt;m=
em.vram.io_start + tile_offset;</span><span style=3D"font-size:10.0pt;font-=
family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.size =3D size;</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; /*</span><span style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * XXX: multi-tile small-bar might be wild. Hopefully</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * full tile without any mappable vram is not something</span><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; * we care about.</span><span style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; */</span><span style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D min(size, io_size);</span><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; if (io_size) {</span><span style=3D"font-size:10.0pt;font-famil=
y:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram=
.io_start =3D io_start;</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram=
.mapping =3D xe-&gt;mem.vram.mapping +</span><span style=3D"font-size:10.0p=
t;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (io_start - xe-&gt;mem.vram.io_start=
);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; } else {</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;xe=
-&gt;drm, &quot;Tile without any CPU visible VRAM. Aborting.\n&quot;);</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENODEV;=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; }</span><span style=3D"font-size:10.0pt;font-family:Consolas;co=
lor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* io_size &quot;could be 0&quot; for=
 small-bar systems, so no CPU access */</span><span style=3D"font-size:10.0=
pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D min_t(u64=
, vram_size, io_size);</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.base =3D xe-&gt;mem.v=
ram.base + tile_offset;</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =3D vram_size;</=
span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.mapping =3D xe-&gt;me=
m.vram.mapping + tile_offset;</span><span style=3D"font-size:10.0pt;font-fa=
mily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM[=
%u, %u]: %pa, %pa\n&quot;, id, gt-&gt;info.vram_id,</span><span style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; &amp;gt-&gt;mem.vram.io_start, &amp;gt-&gt;mem.vram.size);</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (gt-&gt;mem.vram.io_size &lt; gt-&=
gt;mem.vram.size)</span><span style=3D"font-size:10.0pt;font-family:Consola=
s;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: CPU access limited=
 to %pa\n&quot;, id,</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;info.vram=
_id, &amp;gt-&gt;mem.vram.io_size);</span><span style=3D"font-size:10.0pt;f=
ont-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* calculate total size using tile si=
ze to get the correct HW sizing */</span><span style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; total_size +=3D tile_size;</span><spa=
n style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-=
language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; available_size +=3D vram_size;<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">I think you can make this available_size =3D vram_size;=
 instead as last GT for which this loop
 runs,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Will get total available size. Otherwise you may get mo=
re size than actual available. For
 example,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">10 bytes for tile0, 10 bytes for tile1, 20 bytes for ti=
le2 should return total 40b, but I
 think with<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Above logic you will get 10 + 20 + 40. I am assuming of=
fset is incremental per tile. If you
 can give <o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Memory offset overall snapshot, that might help in case=
 I am wrong.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM[%u, %u]: %pa, %pa\n&quot;,=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; id, gt-&gt;info=
.vram_id, &amp;gt-&gt;mem.vram.io_start,</span><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;gt-&gt;mem=
.vram.size);</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (total_size &gt; xe-&gt;mem.vram.i=
o_size) {</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; drm_warn(&amp;xe-&gt;drm, &quot;VRAM: %pa is larger than resourc=
e %pa\n&quot;,</span><span style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;total_size,=
 &amp;xe-&gt;mem.vram.io_size);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; } else {</span>=
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.size =3D xe-&gt;mem.=
vram.io_size;</span><span style=3D"font-size:10.0pt;font-family:Consolas;co=
lor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_start =3D xe-&gt;=
mem.vram.io_start;</span><span style=3D"font-size:10.0pt;font-family:Consol=
as;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.io_size =3D xe-&gt;m=
em.vram.io_size;</span><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; gt-&gt;mem.vram.mapping =3D xe-&gt;m=
em.vram.mapping;</span><span style=3D"font-size:10.0pt;font-family:Consolas=
;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe-&gt;drm, &quot;VRAM=
: %pa\n&quot;, &amp;gt-&gt;mem.vram.size);</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; io_size -=3D min_t(u64, tile_size, io=
_size);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;xe=
-&gt;drm, &quot;Available VRAM: %pa, %pa\n&quot;, &amp;xe-&gt;mem.vram.io_s=
tart,</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333=
333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;available_size);</span><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Here it can be little more readable, but its my opinion=
, up to you :<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">drm_info(&amp;xe-&gt;drm, &quot;Available VRAM: start a=
ddr: %pa, size: %pa\n&quot;, &amp;xe-&gt;mem.vram.io_start,<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &amp;available_size);<o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -287,9 +336,6 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;static void xe_mmio_probe_tiles(struct xe_=
device *xe)</span><span style=3D"font-size:10.0pt;font-family:Consolas;colo=
r:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;info.me=
dia_verx100 &gt;=3D 1300)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;info.tile_count *=3D 2;<o:p></o:=
p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_info(&amp;x=
e-&gt;drm, &quot;tile_count: %d, adj_tile_count %d\n&quot;,</span><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe-&gt;info.tile_count, adj_tile_cou=
nt);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3333=
33;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (xe-&gt;info.ti=
le_count &gt; 1) {<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; const int mmio_bar =3D 0;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; size_t size;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers=
/gpu/drm/xe/xe_mmio.h</span></b><span style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 1a32e0f52261..1c588db0b074 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_mmio.h</span></b><span =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_mmio.h</span></b><span =
style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-la=
nguage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -1,6 +1,6 @@</span></b><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;/* SPDX-License-Identifier: MIT */<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">/*<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">- * Copyright &copy; 2021 Intel Corporation</span><sp=
an style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast=
-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * Copyright &copy; 2021-2023 Intel Corporation</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#ifndef _XE_MMIO_H_<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -120,6 +120,6 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;static inline bool xe_mmio_in_range(const =
struct xe_mmio_range *range, u32 reg)</span><span style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;int xe_mmio_probe_vram(struct xe_device *xe);<o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-int xe_mmio_total_vram_size(struct xe_device *xe, u6=
4 *vram_size, u64 *flat_ccs_base);</span><span style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+int xe_mmio_vram_tile_size(struct xe_gt *gt, u64 *vra=
m_size, u64 *tile_size, u64 *tile_offset);</span><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#endif<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c=
 b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c</span></b><span style=3D"font-siz=
e:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:=
p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 9136c035db0e..acc11f580db4 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c</span>=
</b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-=
fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c</span>=
</b><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-=
fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -12,9 +12,11 @@</span></b><span style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &lt;drm/ttm/ttm_range_manager.h&gt;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &quot;regs/xe_regs.h&quot;<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#include &quot;regs/xe_gt_regs.h&quot;</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_bo.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_device.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_gt.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#include &quot;xe_gt_mcr.h&quot;</span><span style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_mmio.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_res_cursor.h&quot;<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_ttm_stolen_mgr.h&quot;<o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -51,21 +53,26 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;bool xe_ttm_stolen_cpu_access_needs_ggtt(s=
truct xe_device *xe)</span><span style=3D"font-size:10.0pt;font-family:Cons=
olas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return GRAPHICS_VE=
Rx100(xe) &lt; 1270 &amp;&amp; !IS_DGFX(xe);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">}<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-static s64 detect_bar2_dgfx(struct xe_device *xe, st=
ruct xe_ttm_stolen_mgr *mgr)</span><span style=3D"font-size:10.0pt;font-fam=
ily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></=
p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+static s64 detect_bar2_dgfx(struct xe_gt *gt, struct =
xe_ttm_stolen_mgr *mgr)</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 vram_size, =
stolen_size;</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 stolen_size;=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 tile_offset;=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 tile_size;</=
span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u64 vram_size;</=
span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso=
-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; vram_size =3D x=
e-&gt;mem.vram.io_size;</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (drm_WARN_ON(=
&amp;gt-&gt;xe-&gt;drm,</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; xe_mmio_vram_tile_size(gt, &amp;vram_size, &amp;tile_size, &amp;=
tile_offset)) &lt; 0)</span><span style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;</span><span style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><=
o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Use DSM b=
ase address instead for stolen memory */<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;stolen_=
base =3D xe_mmio_read64(to_gt(xe), GEN12_DSMBASE.reg) &amp; GEN12_BDSM_MASK=
;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (drm_WARN_ON=
(&amp;xe-&gt;drm, vram_size &lt; mgr-&gt;stolen_base))</span><span style=3D=
"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:E=
N-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;stolen_b=
ase =3D (xe_mmio_read64(gt, GEN12_DSMBASE.reg) &amp; GEN12_BDSM_MASK) - til=
e_offset;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (drm_WARN_ON(=
&amp;gt-&gt;xe-&gt;drm, tile_size &lt; mgr-&gt;stolen_base))</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return 0;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D=
 vram_size - mgr-&gt;stolen_base;</span><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D =
tile_size - mgr-&gt;stolen_base;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Should it be tile_offset instead,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">stolen_size =3D tile_offset - mgr-&gt;stolen_base;<o:p>=
</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Thanks,<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Tejas<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mgr-&gt;sto=
len_base + stolen_size &lt;=3D vram_size)</span><span style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;io_base =3D xe-&gt;mem.vram.=
io_start + mgr-&gt;stolen_base;</span><span style=3D"font-size:10.0pt;font-=
family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (mgr-&gt;stol=
en_base + stolen_size &lt;=3D tile_size)</span><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mgr-&gt;io_base =3D gt-&gt;mem.vram.i=
o_start + mgr-&gt;stolen_base;</span><span style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /*<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;* There may =
be few KB of platform dependent reserved memory at the end<o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -133,7 +140,7 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;void xe_ttm_stolen_mgr_init(struct xe_devi=
ce *xe)</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int err;<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (IS_DGFX(=
xe))<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:slateblue;mso-fa=
reast-language:EN-IN">-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detect_bar2_dgfx(xe,=
 mgr);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detect_bar2_dgfx(to_g=
t(xe), mgr);</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else if (GRAPHICS_=
VERx100(xe) &gt;=3D 1270)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; stolen_size =3D detect_bar2_integrated(=
xe, mgr);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<o:p></o:p></s=
pan></p>
</div>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
</div>
</body>
</html>

--_000_SJ1PR11MB62045FE4FFB7FB14C55FEC26816B9SJ1PR11MB6204namp_--
