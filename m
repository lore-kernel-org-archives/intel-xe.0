Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 020C7C001DC
	for <intel-xe@archiver.kernel.org>; Wed, 26 Jul 2023 09:24:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2D3D10E440;
	Wed, 26 Jul 2023 09:24:27 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD0110E440
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Jul 2023 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690363465; x=1721899465;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MDGNy8fUbqhD4bmLvbiwo15NEo1N6eP21QH6q/u6yls=;
 b=VDy56aIoXT1LxMeTyeANrj7qzR8tDsfjSo++h+SoVxWH8tA9X1MZ4Czj
 2dHoo01w5AIvIQnfeuCDNPJXhcnMtlE//9wCZ6TMrkkyL5JIVNDuT2PmH
 qn//04x8hL2vwbJz7/xaarFn4zVTpb4jeCPHMwMSczXwgTQdw7KyziUUU
 AuN5WwSaQ9v4UdTiyGKF1gi0QTr8CrYbWnUxaARjeaga5j8I4+kbPVgpj
 zF+MNJ4F0TmxV1YoSyJZDLx6QfexSHStPoSTQ+ThO0EWaq4Uny+XZFoVR
 D+KckGekiFpgDgaBJpbKljU8VTeGSbwrotQukGHshW7Iv/4H0N5XTPq31 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="371573181"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="371573181"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 02:24:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="900350969"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; d="scan'208";a="900350969"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 26 Jul 2023 02:24:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 26 Jul 2023 02:24:23 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 26 Jul 2023 02:24:23 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 26 Jul 2023 02:24:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f7xnqUZNtqud428HupRkSFOmNcxSrLA5fRQZ8/BWj8HG09Pd0xbc3ctBHPqvOyN3jKDIABJLLC4hTwXS119qicov3U5JNgL3IS8OIEh9C5pHQUaAJdEAhKyuFc5LL8/Xtblw1takfqIuPeR5ZDxhz4T7ndcJLGs1OBaEW+jbpuYYsTrBymF++AxMi+CqyTFZyc82AntaTbBYmLelWi18SE9SrH9BYA+et+0RK6XFMjD8zwH2uU8hdAUwV5TrPTedvp1bf5nz1h1eBMrPEJVXZ0uLyovc2xncFc2qxNF8XhXDtBIP5x1/EHyuh9zBvjnULP8Lz6QXCaNgcBRQEiTa/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p4nQLFfWSzGYmGKbd9j+0jfnsCUXVjlJdHd+qwUjXWo=;
 b=gj/bW52kR2cnN5Y9wQuO3thJMjs3it8anncRGmU3JFUcf2iI2mIISTDBM5tccv2SeSuLnf/BWkSjILUCeix5/tJBq6RfCWs6EbH+UQkF80FAIPBqfe8jnahCs/ndx1R/1SThKTETDh8ZqdkFN7hQMm/6UIMyFSxLmPsjPW7w1Zq3Uvvme40l04FMBDqkTc/xs1beEW5xncAFbdxE01F8FFy8PjYYS+k4kiQoD3Iq7Fmtm/l1xWDkKcQ5zWe+7ZC8gjf4a2Lbzbj7J5t7KyMbHTjNbn5MTdpe5MVYeGrliMs5DrsojzvC5HLf7A2dl+0//CnpAeNpBzr8NJhSpP2TkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH7PR11MB7477.namprd11.prod.outlook.com (2603:10b6:510:279::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 09:24:19 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1a96:db0e:58b5:123c%4]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 09:24:18 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>
Thread-Topic: [PATCH V7 1/6] drm/xe: Add sysfs entries for engines under its GT
Thread-Index: AQHZvu08InN732UDlk+ZJRbsyHXFQK/LlZAAgAAxctA=
Date: Wed, 26 Jul 2023 09:24:18 +0000
Message-ID: <SJ1PR11MB6204A97DD9A7E1AC9ADE320D8100A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230725115003.785982-1-tejas.upadhyay@intel.com>
 <20230725115003.785982-2-tejas.upadhyay@intel.com>
 <ZMC76FK6rMOGnn38@nvishwa1-DESK>
In-Reply-To: <ZMC76FK6rMOGnn38@nvishwa1-DESK>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH7PR11MB7477:EE_
x-ms-office365-filtering-correlation-id: f504012d-794e-4673-5d40-08db8dba16bf
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: etrJMlq+Rk7h3bLV9MP/YHgnN3qOAEJ7iXp8p5U1/p7Rx4LSyquf4SRq2R6piPhHTDzXnH9tMYrupJi+3scXJfsGvzK4NRTXjFPZcjwwoiVr4txpDKTxNmh+hV4A95K9ehlNESYQ4ns5v8MEZU+EONblyYLWgS7sArcIZjrF0szHrN/JTYDKuWDsb7mUTkaXj7gemDS4WnF8RNJ2NVWb+YSWObfOqQv7gW+HJNiX82nfTVSEb32dkncR1I/azeF20NaUUqg972WihDKGwD5pHnk1VhLkwMsmbG2rtJJWvs5uDnphOHuKT2OdA/HyRmh1hkXuGCJLy4hZkIojmkd3S5fH/LEfeW/6cRobbZpjr/br8uBUAMHTKVoK1E0cQcfzcQJsLF6jQEYWf7pM44hvZSkrOAkNYuQxe+jZBg6ZvOcEoaaplNdUWxROjgmUCylPrqD3Vak2DK7sCw5tkuwNLNkCORH1dG7owNyKkT/wvruHyqAowd0oQ6uDmb1AChRUTZwUFz9GUaq9JxLasCoygSRap9lLoEk+f56eTO+T1yQY/FgZECkQREV3Yo7HhzD7kZYu5bj2M1e1Lqm9hBCCpR5Vn1yjxGQsgyjBPEyaUDZ8Bd2ehwEwrbEjoMO0fPwc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(41300700001)(26005)(71200400001)(53546011)(6506007)(478600001)(38100700002)(9686003)(86362001)(6862004)(4326008)(8936002)(8676002)(107886003)(6636002)(76116006)(186003)(66446008)(66946007)(66476007)(66556008)(316002)(33656002)(64756008)(122000001)(5660300002)(2906002)(83380400001)(54906003)(52536014)(82960400001)(55016003)(38070700005)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GZVBl5RDjEcD1leUiDl8+ArbBfyxjTcuvuA7UhgrydL+1NuqAdLUgLUASmNQ?=
 =?us-ascii?Q?caF9LV7b6Y9ch5o3X4nVVEuagK6D4PHm0eWc4xna14/4fVfifp3befd0gqnt?=
 =?us-ascii?Q?VAcRgLk5nET15p8ry5RegMa5bxhY9EQH5XPM4sqxS/5JL+Rsn0bDI8OK1C0Q?=
 =?us-ascii?Q?qOcE04cDlohuk7zdBjENw1LbbGbhsfAN6la7iCfgadXKcv8DVqmBI1VflyuF?=
 =?us-ascii?Q?7VXo7m2grjIcNhxz40gYrBgCEGWRGFs+EC0HUOkem47vG0dXN97soLBnlGPX?=
 =?us-ascii?Q?eQVRvMibr8gh19SMBf+CZYDjL+WaOV1fUh3LvjdNgIg5Xzk+bdCv1sLO1Axu?=
 =?us-ascii?Q?HZKdaNy1iYS6Hbr8uEoVlavsYNdzJKH82vbc18oOFXkqVvBYX50V0roSRVIO?=
 =?us-ascii?Q?TNqOp/EE0uAkb5qjKMHQi0sznJB1oh7Q0fCG6ZKRjr+5si7g8c3hg6BEaIAx?=
 =?us-ascii?Q?uGDMMDzWdAujjiTFX19qGQkY+4kp3KVrIjCPLEjWjQ4zmWIQ/4hAe+NcGF/Z?=
 =?us-ascii?Q?HLM60TOCS0+/zZUvQTMiHjZo4NUtEPfymhytclTUP7t9XPgNVDpxP1BG55vz?=
 =?us-ascii?Q?51O+VYEcKxbCcOhxKJTgOoOs5H7N7Rd5J7+smvUQXoyHI05WXLKpQI9ULkdo?=
 =?us-ascii?Q?LVq+9lzJAPTjvbF0qMB/VgNrXGydqQB56EQUONXjkYExcqyu4nKB4Tk18T+g?=
 =?us-ascii?Q?8nNl9JbqThq+klSEgLobHlGsHYK10fEeb3NAMLaLuCWSycydmJ8ZLBzDarH+?=
 =?us-ascii?Q?ILT2gkL8cAjQy6iJJCXakShRI8ixdcgMWXTubkOpXoqj+uvbe0Ud3KKskcGC?=
 =?us-ascii?Q?f9D9hOHBnVIx7Bwh1yA+844ElgGiXK5uc13bfjNbhj+kOXDJPCf9L2TPOTEC?=
 =?us-ascii?Q?UbXTG+ROnPkqEdcwhv2kMmWp7djnWm6dA3Vy4uUwMc80wPxUlSTmBujBbIBz?=
 =?us-ascii?Q?6qO96uhw0CfQ3MudbDybSAbIAF92IyID9LyREZDpbS565CpQXHxEXJEzAQ52?=
 =?us-ascii?Q?8A2EHkubWTfmVSErG3EftR8UyrWlIo419JcCBmpsD9wasRR+5waCYdrP1977?=
 =?us-ascii?Q?3vbVEJ4k1NHwS/sQO4L6WzNFG9LTT7rR3z4DDNQQNmHIrnA8PaY9/DJ4gWB8?=
 =?us-ascii?Q?nUGBbjhH5dJGmnoXn2LnOE9TaCEXCFnVetPCv6a7OSLansj9VkBkRd+HGjvl?=
 =?us-ascii?Q?mRfMCtaGe+Htd9mPRNV/8HKtlLyAlEx9R9sZVmsqtUxPrHtWgvvC3WjwPDth?=
 =?us-ascii?Q?XPw4k37u9YBsPtPU8VLQKRlKjWPdvimZaqCbQWY12v+5hAwlyEhxeuPzUTB5?=
 =?us-ascii?Q?Y85QVutSDsSKNvYeyvu03H0fhzK7JNTg+kwFiyRzBsKEXZl0i0ESQHBQOIC1?=
 =?us-ascii?Q?w0rnQ8LhdjtY/mpCvv+Aji7ktQb2ckoWDso4xNWE+STj+hsD/PH4kI9pkA3l?=
 =?us-ascii?Q?gucQlCRoDDte+ltdl7LStTm4jZJVy+v0/pMVj50Vghx5wVx7VwCdnwgpszWW?=
 =?us-ascii?Q?2ydvd7PHvdDj8fttwCSS/s85SDH6ti16cQg4Mxu0xk27/bDd/pL9s8BKQWhF?=
 =?us-ascii?Q?fWUPwFSCaQrWLqaEDsoAV5Hj2RCqUJnj6eR4XNSJ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f504012d-794e-4673-5d40-08db8dba16bf
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2023 09:24:18.7828 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3aE6V2vUJ2d62H3X3uaKWlksOBkkf1sPiR0mZRZTktTjbnkZCnQ5IckmewMQPs3fsurykreEbQPYvb2vjAhVYmbeb/A6d0JJBj2lLCTRLc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7477
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V7 1/6] drm/xe: Add sysfs entries for engines
 under its GT
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



> -----Original Message-----
> From: Vishwanathapura, Niranjana <niranjana.vishwanathapura@intel.com>
> Sent: Wednesday, July 26, 2023 11:54 AM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH V7 1/6] drm/xe: Add sysfs entries for engines under i=
ts
> GT
>=20
> On Tue, Jul 25, 2023 at 05:19:58PM +0530, Tejas Upadhyay wrote:
> >Add engines sysfs directory under its GT and create sub directory for
> >all engine class (note its not per instance) present on GT.
> >
> >For example,
> >DUT# cat /sys/class/drm/cardX/device/tileN/gtN/engines/
> >bcs/ ccs/
> >
> >V4 :
> >   - Rebase to resolve conflicts - CI
> >V3 :
> >   - Move code in its own file
> >   - Rename API name
> >V2 :
> >   - Correct class mask logic - Himal
> >   - Remove extra parenthesis
> >
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > drivers/gpu/drm/xe/Makefile                |   1 +
> > drivers/gpu/drm/xe/xe_engine_class_sysfs.c | 111
> +++++++++++++++++++++
> >drivers/gpu/drm/xe/xe_engine_class_sysfs.h |  13 +++
> > drivers/gpu/drm/xe/xe_gt.c                 |   7 ++
> > 4 files changed, 132 insertions(+)
> > create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> > create mode 100644 drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >
> >diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> >index 4ea9e3150c20..7ced39ee52f8 100644
> >--- a/drivers/gpu/drm/xe/Makefile
> >+++ b/drivers/gpu/drm/xe/Makefile
> >@@ -52,6 +52,7 @@ xe-y +=3D xe_bb.o \
> > 	xe_device_sysfs.o \
> > 	xe_dma_buf.o \
> > 	xe_engine.o \
> >+	xe_engine_class_sysfs.o \
> > 	xe_exec.o \
> > 	xe_execlist.o \
> > 	xe_force_wake.o \
> >diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >new file mode 100644
> >index 000000000000..9959b0362d71
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.c
> >@@ -0,0 +1,111 @@
> >+// SPDX-License-Identifier: MIT
> >+/*
> >+ * Copyright (c) 2023 Intel Corporation
> >+ */
> >+
> >+#include <drm/drm_managed.h>
> >+#include <linux/kobject.h>
> >+#include <linux/sysfs.h>
> >+
> >+#include "xe_engine_class_sysfs.h"
> >+
> >+static void kobj_xe_engine_release(struct kobject *kobj) {
> >+	kfree(kobj);
> >+}
> >+
> >+static const struct kobj_type kobj_xe_engine_type =3D {
> >+	.release =3D kobj_xe_engine_release,
> >+	.sysfs_ops =3D &kobj_sysfs_ops
> >+};
> >+
> >+static struct kobject *
> >+kobj_xe_engine(struct kobject *parent, char *name) {
> >+	struct kobject *kobj;
> >+
> >+	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> >+	if (!kobj)
> >+		return NULL;
> >+
> >+	kobject_init(kobj, &kobj_xe_engine_type);
> >+	if (kobject_add(kobj, parent, "%s", name)) {
> >+		kobject_put(kobj);
> >+		return NULL;
> >+	}
> >+
> >+	return kobj;
> >+}
> >+
> >+static void xe_engine_sysfs_kobj_release(struct kobject *kobj) {
> >+	kfree(kobj);
> >+}
> >+
> >+static const struct kobj_type xe_engine_sysfs_kobj_type =3D {
> >+	.release =3D xe_engine_sysfs_kobj_release,
> >+	.sysfs_ops =3D &kobj_sysfs_ops,
> >+};
> >+
> >+int xe_engine_class_sysfs_init(struct xe_gt *gt) {
> >+	struct xe_hw_engine *hwe;
> >+	enum xe_hw_engine_id id;
> >+	struct kobject *kobj;
> >+	u16 class_mask =3D 0;
> >+	int err =3D 0;
> >+
> >+	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> >+	if (!kobj)
> >+		return -ENOMEM;
> >+
> >+	kobject_init(kobj, &xe_engine_sysfs_kobj_type);
> >+
> >+	err =3D kobject_add(kobj, gt->sysfs, "engines");
> >+	if (err) {
> >+		kobject_put(kobj);
> >+		return err;
> >+	}
> >+
> >+	for_each_hw_engine(hwe, gt, id) {
> >+		char name[MAX_ENGINE_CLASS_NAME_LEN];
> >+		struct kobject *khwe;
> >+
> >+		if (hwe->class =3D=3D XE_ENGINE_CLASS_OTHER ||
> >+		    hwe->class =3D=3D XE_ENGINE_CLASS_MAX)
> >+			continue;
> >+
> >+		if ((class_mask >> hwe->class) & 1)
> >+			continue;
> >+
> >+		class_mask |=3D 1 << hwe->class;
> >+
> >+		switch (hwe->class) {
> >+		case XE_ENGINE_CLASS_RENDER:
> >+			strcpy(name, "rcs");
> >+			break;
> >+		case XE_ENGINE_CLASS_VIDEO_DECODE:
> >+			strcpy(name, "vcs");
> >+			break;
> >+		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> >+			strcpy(name, "vecs");
> >+			break;
> >+		case XE_ENGINE_CLASS_COPY:
> >+			strcpy(name, "bcs");
> >+			break;
> >+		case XE_ENGINE_CLASS_COMPUTE:
> >+			strcpy(name, "ccs");
> >+			break;
> >+		default:
> >+			kobject_put(kobj);
> >+			return -EINVAL;
> >+		}
> >+
> >+		khwe =3D kobj_xe_engine(kobj, name);
> >+		if (!khwe) {
> >+			kobject_put(kobj);
> >+			return -EINVAL;
> >+		}
>=20
> NIT...having khwe here and replace it keclass in next patch seems like
> patches are not self contained. May be it is better to start with keclass=
 in this
> patch itself?

I don't think it is good idea, engine_class_intf includes sched parameters =
which are part of default scheduler parameters, that is part of second patc=
h. For this patch to introduce top level engine directories only kobject is=
 enough.

Thanks,
Tejas

>=20
> Niranjana
>=20
> >+	}
> >+	return err;
> >+}
> >diff --git a/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >new file mode 100644
> >index 000000000000..f195dacc1ec6
> >--- /dev/null
> >+++ b/drivers/gpu/drm/xe/xe_engine_class_sysfs.h
> >@@ -0,0 +1,13 @@
> >+/* SPDX-License-Identifier: MIT */
> >+/*
> >+ * Copyright (c) 2023 Intel Corporation
> >+ */
> >+
> >+#ifndef _XE_ENGINE_CLASS_SYSFS_H_
> >+#define _XE_ENGINE_CLASS_SYSFS_H__
> >+
> >+#include "xe_gt.h"
> >+
> >+#define MAX_ENGINE_CLASS_NAME_LEN    16
> >+int xe_engine_class_sysfs_init(struct xe_gt *gt); #endif
> >diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> >index 3e32d38aeeea..a8176de9f536 100644
> >--- a/drivers/gpu/drm/xe/xe_gt.c
> >+++ b/drivers/gpu/drm/xe/xe_gt.c
> >@@ -14,6 +14,7 @@
> > #include "xe_bo.h"
> > #include "xe_device.h"
> > #include "xe_engine.h"
> >+#include "xe_engine_class_sysfs.h"
> > #include "xe_execlist.h"
> > #include "xe_force_wake.h"
> > #include "xe_ggtt.h"
> >@@ -322,6 +323,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> > 	if (err)
> > 		goto err_force_wake;
> >
> >+	err =3D xe_engine_class_sysfs_init(gt);
> >+	if (err)
> >+		drm_warn(&gt_to_xe(gt)->drm,
> >+			 "failed to register engines sysfs directory, err: %d\n",
> >+			 err);
> >+
> > 	err =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > 	XE_WARN_ON(err);
> > 	xe_device_mem_access_put(gt_to_xe(gt));
> >--
> >2.25.1
> >
