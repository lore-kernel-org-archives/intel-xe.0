Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77EE8C7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  9 May 2023 06:04:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ED2410E1E3;
	Tue,  9 May 2023 06:04:57 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 553F910E1E3
 for <intel-xe@lists.freedesktop.org>; Tue,  9 May 2023 06:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683612295; x=1715148295;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=OpNfKFKiYAwYtS6PP3O1ldpl+1ukjrI4aoJUcCHz6Us=;
 b=anY2nWvuDEzjnov5t30KygA1BCRW/+WM0ywEgyvaMTVHWZ/xyC7bToU2
 PWBbCNXtD0h3kWDpYTWMMzYkaDJ1u1hvfb9cpO5BMNF5lcoJIqIJRAh5e
 tPcYY3gMVpnOrL0b39XSqFJsvOs8rnuL9cR0is5r85Esdu+mNh5qW+wVp
 KOEoWJ3VWRv+0YRdC1qO3NuPbI972iGYmogC5a9TBGU7p18B133P89tWy
 6mJYF6C3zboOsdeE1aMe3vJz7TTqejqFoYyaCvFAtVuQpOOlvmpznosym
 AOA1IVIM9IMcB0f/K0mXKkod7EAVH4mt6CR870Em8gqjI6sq9H2fsq2uJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="349852370"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
 d="scan'208,217";a="349852370"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 May 2023 23:04:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10704"; a="810527597"
X-IronPort-AV: E=Sophos;i="5.99,261,1677571200"; 
 d="scan'208,217";a="810527597"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga002.fm.intel.com with ESMTP; 08 May 2023 23:04:39 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 8 May 2023 23:04:38 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 8 May 2023 23:04:38 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 8 May 2023 23:04:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G7RENzt5WB+ZudFbqN3Q3fZnJNApg/9UBMSPZpaSj6C8HzRjzDL6361lM/RjaBhyQ1DW9GIn29jBoHx2DY0HUcCUCnPDOoxAY8SbByh5MR5Nysv9AOYUYnHzqt+9o0uh1RpfNdWfSMV0eHF3WbSNXc+4D8QnIME4Nhl6VakrgT5PXJPBmTfdiln8r4+n4lSQnMKkDWhbCr8OKiDtMZGWJp3G+UC1fhyn+HZeA+4ZzR9FBWJVllGmFGnPtPhJtrBLcx32Hz8YT0uIFkbWxgpVab/qeMABgquM/5FM8cKpnW+vGa6GuNwvaj6C3+59KvmyK1lP1OuT1Ul0z42GrBk/Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cdZ4IMpalPw24lurcwOxpr2mfXPVEfWxq9PuxE6kX58=;
 b=NDFaw1Dcrctc05QIIPBnMV8FPSy7xVTtfPj2iIwC+qp+1fupkNo+tbvaXS/q47jlmZ1fkf0UoaG8ivRz8dnRMZqAoejFSY1OGQhWewAq6qUnoxFy2zodZNmI9YuGh21QiasRVbvEgqvvxuQQEbQYgZ9XQXGQxj89+cB46ZVx9AAg8aWA/DzdHw97xB+QTls5rwEukUCQpRhPQm+kP89RROma2k4TBy14mP/8JCcQ72lMjSr8dWjkD1qv72Ni0eFOrxaipm8r/hqDr9m7PpzUlNkcbkYuHhaWcYmAkX68mdjcNxC6H+mzA6ZZ0F6h4aNaC4kwY6lwRc2hnC0TCnBLcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CH0PR11MB5347.namprd11.prod.outlook.com (2603:10b6:610:ba::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 06:04:36 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::f6ff:ca66:f20b:bd43%7]) with mapi id 15.20.6363.032; Tue, 9 May 2023
 06:04:36 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [RFC, 1/1] drm/xe: Notify Userspace when engine/gt reset fails -
 review
Thread-Index: AdmCOrvLORxQtyV4SASjKO8QrfjN/Q==
Date: Tue, 9 May 2023 06:04:35 +0000
Message-ID: <SJ1PR11MB62040A764D956C82A0D7DF7181769@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CH0PR11MB5347:EE_
x-ms-office365-filtering-correlation-id: ca299738-cc10-48a4-d62a-08db50534427
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: by+yESu6K2VAopSmcgKtStZkev1Ll/JHc5mOfI1bkZaVT1eT4c+ZoETIboLN+JLxCMqjoL7aCSrD1wfDGQG7fKYXwYTPmb5tQ9GAqcK3Vw/oDMyBwdSwyxc0q3XKLD6yd4aim7dfAhfsUypjJ4+wWsYlTMb/ElEjQAXWSx/xC4KeIliyL+onTPxCbx/GJseJ9lyZs6WNRcb57CEnMxfCIjhGAoMp0IrYEQVn+ZqpubI7sQAYfQ1p5fXc08V2Z/6JyLYGNU8RYadnSqHCA9G2aoZ8YymAr5TQpn+H47WzWn/PEE1iSFIowxXwuZNZcyF3WbZOaJkxHJRYzKnkYPTgHdvrPG6Bv/73K6kTbSqvy1vIBEA6OodoFrSx9QTugeW/Jkp12qjgTl5McIH6L+XGkbh470jHd4WlsgIbzgy3xuZ0dVl6qP7sdV59GkhO5UG1wwoERWpw+urGo2Hey0SUUabyHwmBqOVH+UsZURSYrg9Di3inkWDKNrtEX39ihp4ZaQ7QJUA7mtchRSQPNRVcSSY2+w3xr2t0PMm4ewNW13ntYX1aMlOJZFnmnclB48V7wT/Pxq/+aAub5xJVXDlr37vD7914c0UmwnMxEFODulOvUwyVJDU7m7diIHNPs6S/
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(136003)(346002)(366004)(376002)(451199021)(83380400001)(186003)(2906002)(38100700002)(86362001)(33656002)(38070700005)(82960400001)(122000001)(55016003)(5660300002)(52536014)(8936002)(8676002)(66946007)(66556008)(478600001)(6916009)(4326008)(66476007)(66446008)(64756008)(76116006)(71200400001)(7696005)(41300700001)(316002)(107886003)(6506007)(9686003)(26005)(54906003)(559001)(579004);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kzea05D80vT5cxnJCq2onBnCFCNj+pnHhx/ENQErpWKu7DvpiO3cv+JS3aJ9?=
 =?us-ascii?Q?NQIwm2twBG5pOgjbHqf776qq1OoZ6UdWNpDQGZbXdS0NjA01xeTTaCdorGN6?=
 =?us-ascii?Q?JHj9oU7G8PVVChKh0VvqH4HHC6wwGC8U81fH10P28VK0dTu36pFFaj1uwzeF?=
 =?us-ascii?Q?DccgFwxSWx9nqIvPtEX8bu+/R0hQgsE/M8dBt7J1qPm8raKELcsb7BDUq015?=
 =?us-ascii?Q?yftXGBQ0u1QW73RoZ2BFNFaAxRcoRdvOGS24rZFEjVln/O40MhiuZF/iNQ6G?=
 =?us-ascii?Q?/vgk+GI8jpWDEGNwmrocAkPhpyytIMT0xIv1XOeJyFufahvn/zG2KcaD3O9X?=
 =?us-ascii?Q?rEuZxk3ZHFNFH0NAgpmYI3/UtQePQDiA3PA+uAlZryFjepd2h86TNxC+OBWk?=
 =?us-ascii?Q?YpXsRPpLEERyR5MQ3Zcsxq5R22g0o3RaWgyliGTLCJTJvot0tFSQ+snEGCET?=
 =?us-ascii?Q?R68JHz6ppEnSrp+BOB+n1+sPxBLaa+x4ROXN64sur9fll/odWOm1fSNcv4aB?=
 =?us-ascii?Q?YAms8pc8RM//+6mfp/Pmw9eVUX7MgykBQY5fN9ScPOozn9NLvI01/dRRpfPD?=
 =?us-ascii?Q?fMgNjNd3F4d7ERR2r8RCzZVgY7ttruX3Tz2PKuqRQKO8mDZBsk4DBAMP8amz?=
 =?us-ascii?Q?lP8dOnJLB1BaG4SlAdHnNKjVA4cKyQ2avb+CzN6S5aZc2itZcAbuRLu5FzvS?=
 =?us-ascii?Q?2A/Zoyhu27igJ5U6NuiJo6Bz3Y9Hh5C55BKsvYQcY+V+nfsLbHDziKNu/oX6?=
 =?us-ascii?Q?hHQXTmfSJY9yB01TulQES/GMfExsnplVSSggGrCzbUFOWNLd5WPk3NxpEclg?=
 =?us-ascii?Q?xKBC0t9uIEtIteSUpsn/LMa1fBMqbeNmOdBv9le7PmUdEMU1bVG2Oa9hTrPH?=
 =?us-ascii?Q?fYy/WzQHG8TYpPTSmj69wNml4+LmO6ckHJYJETs/mcc/FWWXiC4mIA7d/mcc?=
 =?us-ascii?Q?ZSnGwXNuhiB59lZSWXGwdE76NjEawPUjMUOP9NmlsffQtpqc1C6Bz8r5+Lpu?=
 =?us-ascii?Q?hE4yQta1yblrl7faJOqf/xXAZldXeJL8f0uQqITfhgAPfXIcmwGfujcwQvqF?=
 =?us-ascii?Q?0Qryk+k5pjuPeQVX5RHTziQDkgJSbHswSlvFkjdkdzybg6PgEsNLjIu18Seo?=
 =?us-ascii?Q?APN/Bjbb7Lu2jqoova82ehBKEeMOyNefRxiVGS8AQnqvEi9xyxBd1KeBnUOy?=
 =?us-ascii?Q?W2FghwKkv2x5V7PNufTSuEgaeJwvLpPZJeebauRKCJpfeLlUvGGfsvmYEWcs?=
 =?us-ascii?Q?CLcySuHbp7MRxX8aqngxJHLqRumajxaZpYrAqYvnKkruIcpJgWCFVFBtwc/a?=
 =?us-ascii?Q?gGKj9ksdsCF8b7lnpHMm3m43eV1R0r9PIkmDQAYBmO+lewKRVqQ/PG8F3yAI?=
 =?us-ascii?Q?suAQ0SZFrwNZk+dqeFsOq+ZHgzkP4eV77WW+Nqxa9YhnK2ald4Z6zxOJzR1C?=
 =?us-ascii?Q?i6AttLzSobSazC+kOUWDbg70gYYvqbG6M0TH+QaILUnZS+DghGR4tHGgo7/8?=
 =?us-ascii?Q?5OKYv3DI9euZfmCXArsqinjgcnxpG0g0M6WEXFrWEliropIChJw5Ye9rOoV/?=
 =?us-ascii?Q?6k5nWDEI4kDGUhotjA0iO31MaQk038v676NoPply?=
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR11MB62040A764D956C82A0D7DF7181769SJ1PR11MB6204namp_"
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ca299738-cc10-48a4-d62a-08db50534427
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2023 06:04:35.8944 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /H37KB0LTMqaDPiB/h6RoAGIRaLoDFhXy2v9+IJxEUoT0XaYZ1bJ96Kbt88faXdMnXEPdOmcsEvV2jWvQf73mwcC5WbTL7bzsOtLDxqiinQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5347
X-OriginatorOrg: intel.com
Subject: [Intel-xe] [RFC,
 1/1] drm/xe: Notify Userspace when engine/gt reset fails - review
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
Cc: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Siddiqui,
 Ayaz A" <ayaz.siddiqui@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--_000_SJ1PR11MB62040A764D956C82A0D7DF7181769SJ1PR11MB6204namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 3afca3dd9657..2c3ffa1db74e 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -8,6 +8,7 @@
 #include <linux/minmax.h>
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 #include "regs/xe_gt_regs.h"
#include "xe_bb.h"
@@ -590,6 +591,20 @@  static int do_gt_restart(struct xe_gt *gt)
       return 0;
}
+static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
+{
+       char *reset_event[5];
+
+       reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
+       reset_event[1] =3D "RESET_ENABLED=3D1";
+       reset_event[2] =3D "RESET_UNIT=3Dgt";
+       reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d", id);
+       reset_event[4] =3D NULL;
+       kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset=
_event);
+
+       kfree(reset_event[3]);
+}
+
static int gt_reset(struct xe_gt *gt)
{
       struct xe_device *xe =3D gt_to_xe(gt);
@@ -639,6 +654,9 @@  static int gt_reset(struct xe_gt *gt)
       xe_device_mem_access_put(gt_to_xe(gt));
       drm_err(&xe->drm, "GT reset failed, err=3D%d\n", err);
The codebase here looks like moved on, in current code there is no drm_err =
logged it seems,
Though should not be this under if(err) ?

+       /* Notify userspace about gt reset failure */
+       xe_uevent_gt_reset_failure(xe, gt->info.id);
+
       return err;
}
diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
index 74a74051f354..845c57b95562 100644
--- a/drivers/gpu/drm/xe/xe_guc.h
+++ b/drivers/gpu/drm/xe/xe_guc.h
@@ -56,4 +56,22 @@  static inline u16 xe_engine_class_to_guc_class(enum xe_=
engine_class class)
       }
}
+static inline u16 xe_guc_class_to_engine_class(u8 guc_class)
+{
+       switch (guc_class) {
+       case GUC_RENDER_CLASS:
+                return XE_ENGINE_CLASS_RENDER;
+       case GUC_VIDEO_CLASS:
+                return XE_ENGINE_CLASS_VIDEO_DECODE;
+       case GUC_VIDEOENHANCE_CLASS:
+                return XE_ENGINE_CLASS_VIDEO_ENHANCE;
+       case GUC_BLITTER_CLASS:
+                return XE_ENGINE_CLASS_COPY;
+       case GUC_COMPUTE_CLASS:
+                return XE_ENGINE_CLASS_COMPUTE;

Should you check GUC_GSC_OTHER_CLASS to return default here?

+       default:
+                XE_WARN_ON(guc_class);
+                return -1;
+       }
+}
#endif
diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc=
_submit.c
index e857013070b9..663908573d5c 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -12,6 +12,7 @@
 #include <linux/dma-fence-array.h>
 #include <drm/drm_managed.h>
+#include <drm/xe_drm.h>
 #include "regs/xe_lrc_layout.h"
#include "xe_device.h"
@@ -1589,9 +1590,25 @@  int xe_guc_engine_memory_cat_error_handler(struct x=
e_guc *guc, u32 *msg,
       return 0;
}
+static void xe_uevent_engine_reset_failure(struct xe_device *xe, const cha=
r *name)
+{
+       char *reset_event[5];
+
+       reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
+       reset_event[1] =3D "RESET_ENABLED=3D1";
+       reset_event[2] =3D "RESET_UNIT=3Dengine";
+       reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%s", name);
+       reset_event[4] =3D NULL;
+       kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset=
_event);
+
+       kfree(reset_event[3]);
+}
+
int xe_guc_engine_reset_failure_handler(struct xe_guc *guc, u32 *msg, u32 l=
en)
{
       struct xe_device *xe =3D guc_to_xe(guc);
+       struct xe_hw_engine *hwe;
+       u16 engine_class;
       u8 guc_class, instance;
       u32 reason;

On upstream last time I got review comment from Andi saying this should be =
in Christmas tree order, something you might want to consider.
@@ -1608,6 +1625,12 @@  int xe_guc_engine_reset_failure_handler(struct xe_g=
uc *guc, u32 *msg, u32 len)
       drm_err(&xe->drm, "GuC engine reset request failed on %d:%d because =
0x%08X",
                guc_class, instance, reason);
+       engine_class =3D xe_guc_class_to_engine_class(guc_class);
+       hwe =3D xe_gt_hw_engine(guc_to_gt(guc), engine_class, instance, fal=
se);
+
+       /* Notify userspace about engine reset failure */
+       xe_uevent_engine_reset_failure(xe, hwe->name);
+
       xe_gt_reset_async(guc_to_gt(guc));
        return 0;
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index b0b80aae3ee8..79ef5947c172 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -36,6 +36,14 @@  extern "C" {
  * subject to backwards-compatibility constraints.
  */
+/*
+ * Uevents generated by xe on it's device node.
+ *
+ * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset engin=
e
+ *     or gt fails. The value supplied with the event is always 1.
+ */
+#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
+
/**
  * struct xe_user_extension - Base class for defining a chain of extension=
s
  *
xe_uevent_engine_reset_failure/xe_uevent_gt_reset_failure can they be clubb=
ed as one, up to you but most part looks same so though of this. You can ig=
nore.

Please include me in cc next time, somehow I am not getting email for xe pa=
tches.

Thanks,
Tejas


--_000_SJ1PR11MB62040A764D956C82A0D7DF7181769SJ1PR11MB6204namp_
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
<div style=3D"mso-element:para-border-div;border:solid #CCCCCC 1.0pt;paddin=
g:12.0pt 12.0pt 12.0pt 12.0pt;background:white">
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/g=
pu/drm/xe/xe_gt.c</span></b><span style=3D"font-size:10.0pt;font-family:Con=
solas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 3afca3dd9657..2c3ffa1db74e 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_gt.c</span></b><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_gt.c</span></b><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -8,6 +8,7 @@</span></b><span style=3D"font-size:10.=
0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &lt;linux/minmax.h&gt;<o:p></o:p></span>=
</p>
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
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#include &lt;drm/xe_drm.h&gt;</span><span style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &quot;regs/xe_gt_regs.h&quot;<o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_bb.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -590,6 +591,20 @@</span></b><span style=3D"font-siz=
e:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;static int do_gt_restart(struct xe_gt *gt)=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
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
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+static void xe_uevent_gt_reset_failure(struct xe_devi=
ce *xe, u8 id)</span><span style=3D"font-size:10.0pt;font-family:Consolas;c=
olor:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+{</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *reset_even=
t[5];</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333=
333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[0] =
=3D XE_RESET_FAILED_UEVENT &quot;=3D1&quot;;</span><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[1] =
=3D &quot;RESET_ENABLED=3D1&quot;;</span><span style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[2] =
=3D &quot;RESET_UNIT=3Dgt&quot;;</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[3] =
=3D kasprintf(GFP_KERNEL, &quot;RESET_ID=3D%d&quot;, id);</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[4] =
=3D NULL;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kobject_uevent_e=
nv(&amp;xe-&gt;drm.primary-&gt;kdev-&gt;kobj, KOBJ_CHANGE, reset_event);</s=
pan><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-=
fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(reset_even=
t[3]);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
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
ast-language:EN-IN">static int gt_reset(struct xe_gt *gt)<o:p></o:p></span>=
</p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *=
xe =3D gt_to_xe(gt);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -639,6 +654,9 @@</span></b><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;static int gt_reset(struct xe_gt *gt)</spa=
n><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fa=
reast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_device_mem_acce=
ss_put(gt_to_xe(gt));<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;xe-&g=
t;drm, &quot;GT reset failed, err=3D%d\n&quot;, err);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">The codebase here looks like moved on, in current code =
there is no drm_err logged it seems,
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Though should not be this under if(err) ?<o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Notify usersp=
ace about gt reset failure */</span><span style=3D"font-size:10.0pt;font-fa=
mily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_uevent_gt_res=
et_failure(xe, gt-&gt;info.id);</span><span style=3D"font-size:10.0pt;font-=
family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span=
></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return err;<o:p></=
o:p></span></p>
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
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/=
gpu/drm/xe/xe_guc.h</span></b><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index 74a74051f354..845c57b95562 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_guc.h</span></b><span s=
tyle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lan=
guage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_guc.h</span></b><span s=
tyle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lan=
guage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -56,4 +56,22 @@</span></b><span style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;static inline u16 xe_engine_class_to_guc_c=
lass(enum xe_engine_class class)</span><span style=3D"font-size:10.0pt;font=
-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<o:p></o:p></span=
></p>
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
east-language:EN-IN">+static inline u16 xe_guc_class_to_engine_class(u8 guc=
_class)</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+{</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; switch (guc_clas=
s) {</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3333=
33;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GUC_RENDER_=
CLASS:</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_ENGINE_CLASS_RENDER;</span>=
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GUC_VIDEO_C=
LASS:</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333=
333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_ENGINE_CLASS_VIDEO_DECODE;<=
/span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;ms=
o-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GUC_VIDEOEN=
HANCE_CLASS:</span><span style=3D"font-size:10.0pt;font-family:Consolas;col=
or:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_ENGINE_CLASS_VIDEO_ENHANCE;=
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;m=
so-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GUC_BLITTER=
_CLASS:</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_ENGINE_CLASS_COPY;</span><s=
pan style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareas=
t-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; case GUC_COMPUTE=
_CLASS:</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#3=
33333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return XE_ENGINE_CLASS_COMPUTE;<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Should you check GUC_GSC_OTHER_CLASS to return default =
here?<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; default:</span><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; XE_WARN_ON(guc_class);</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -1;</span><span style=3D"font-=
size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }</span><span st=
yle=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-lang=
uage:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+}</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#endif<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/d=
rivers/gpu/drm/xe/xe_guc_submit.c</span></b><span style=3D"font-size:10.0pt=
;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p>=
</span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index e857013070b9..663908573d5c 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/drivers/gpu/drm/xe/xe_guc_submit.c</span></b>=
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/drivers/gpu/drm/xe/xe_guc_submit.c</span></b>=
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -12,6 +12,7 @@</span></b><span style=3D"font-size:1=
0.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &lt;linux/dma-fence-array.h&gt;<o:p></o:=
p></span></p>
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
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#include &lt;drm/xe_drm.h&gt;</span><span style=3D"fo=
nt-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-I=
N"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;#include &quot;regs/xe_lrc_layout.h&quot;<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">#include &quot;xe_device.h&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -1589,9 +1590,25 @@</span></b><span style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;int xe_guc_engine_memory_cat_error_handler=
(struct xe_guc *guc, u32 *msg,</span><span style=3D"font-size:10.0pt;font-f=
amily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span>=
</p>
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
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+static void xe_uevent_engine_reset_failure(struct xe_=
device *xe, const char *name)</span><span style=3D"font-size:10.0pt;font-fa=
mily:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span><=
/p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+{</span><span style=3D"font-size:10.0pt;font-family:C=
onsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; char *reset_even=
t[5];</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333=
333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[0] =
=3D XE_RESET_FAILED_UEVENT &quot;=3D1&quot;;</span><span style=3D"font-size=
:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p=
></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[1] =
=3D &quot;RESET_ENABLED=3D1&quot;;</span><span style=3D"font-size:10.0pt;fo=
nt-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></s=
pan></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[2] =
=3D &quot;RESET_UNIT=3Dengine&quot;;</span><span style=3D"font-size:10.0pt;=
font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[3] =
=3D kasprintf(GFP_KERNEL, &quot;RESET_ID=3D%s&quot;, name);</span><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; reset_event[4] =
=3D NULL;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kobject_uevent_e=
nv(&amp;xe-&gt;drm.primary-&gt;kdev-&gt;kobj, KOBJ_CHANGE, reset_event);</s=
pan><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-=
fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; kfree(reset_even=
t[3]);</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#33=
3333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
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
ast-language:EN-IN">int xe_guc_engine_reset_failure_handler(struct xe_guc *=
guc, u32 *msg, u32 len)<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">{<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_device *=
xe =3D guc_to_xe(guc);<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; struct xe_hw_eng=
ine *hwe;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:=
#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u16 engine_class=
;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;=
mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u8 guc_class, inst=
ance;<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; u32 reason;<o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">On upstream last time I got review comment from Andi sa=
ying this should be in Christmas tree
 order, something you might want to consider.<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -1608,6 +1625,12 @@</span></b><span style=3D"font-s=
ize:10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;int xe_guc_engine_reset_failure_handler(st=
ruct xe_guc *guc, u32 *msg, u32 len)</span><span style=3D"font-size:10.0pt;=
font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p><=
/span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; drm_err(&amp;xe-&g=
t;drm, &quot;GuC engine reset request failed on %d:%d because 0x%08X&quot;,=
<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; guc_class, instance, reason);<o:p></o:p=
></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; engine_class =3D=
 xe_guc_class_to_engine_class(guc_class);</span><span style=3D"font-size:10=
.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></=
o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; hwe =3D xe_gt_hw=
_engine(guc_to_gt(guc), engine_class, instance, false);</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Notify usersp=
ace about engine reset failure */</span><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_uevent_engine=
_reset_failure(xe, hwe-&gt;name);</span><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; xe_gt_reset_async(=
guc_to_gt(guc));<o:p></o:p></span></p>
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
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">diff --git a/include/uapi/drm/xe_drm.h b/include/ua=
pi/drm/xe_drm.h</span></b><span style=3D"font-size:10.0pt;font-family:Conso=
las;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">index b0b80aae3ee8..79ef5947c172 100644</span></b><=
span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-farea=
st-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">--- a/include/uapi/drm/xe_drm.h</span></b><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:seagreen;mso-=
fareast-language:EN-IN">+++ b/include/uapi/drm/xe_drm.h</span></b><span sty=
le=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-langu=
age:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<b><span style=3D"font-size:10.0pt;font-family:Consolas;color:brown;mso-far=
east-language:EN-IN">@@ -36,6 +36,14 @@</span></b><span style=3D"font-size:=
10.0pt;font-family:Consolas;color:#333333;mso-fareast-language:EN-IN">
</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#A020F0;m=
so-fareast-language:EN-IN">&nbsp;extern &quot;C&quot; {</span><span style=
=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fareast-languag=
e:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; * subject to backwards-compatibility constraints=
.<o:p></o:p></span></p>
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
east-language:EN-IN">+/*</span><span style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * Uevents generated by xe on it's device node.</span=
><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-far=
east-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ *</span><span style=3D"font-size:10.0pt;font-family:=
Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ * XE_RESET_FAILED_UEVENT - Event is generated when a=
ttempt to reset engine</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ *&nbsp;&nbsp;&nbsp;&nbsp; or gt fails. The value sup=
plied with the event is always 1.</span><span style=3D"font-size:10.0pt;fon=
t-family:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></sp=
an></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+ */</span><span style=3D"font-size:10.0pt;font-family=
:Consolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+#define XE_RESET_FAILED_UEVENT &quot;RESET_FAILED&quo=
t;</span><span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333=
;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:darkcyan;mso-far=
east-language:EN-IN">+</span><span style=3D"font-size:10.0pt;font-family:Co=
nsolas;color:#333333;mso-fareast-language:EN-IN"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">/**<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; * struct xe_user_extension - Base class for defi=
ning a chain of extensions<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#333333;mso-fare=
ast-language:EN-IN">&nbsp; *<o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">xe_uevent_engine_reset_failure/xe_uevent_gt_reset_failu=
re can they be clubbed as one, up
 to you but most part looks same so though of this. You can ignore.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal" style=3D"margin-bottom:7.5pt;line-height:10.75pt;bac=
kground:white;word-break:break-all;border:none;padding:0in">
<span style=3D"font-size:10.0pt;font-family:Consolas;color:#C55A11;mso-styl=
e-textfill-fill-color:#C55A11;mso-style-textfill-fill-alpha:100.0%;mso-fare=
ast-language:EN-IN">Please include me in cc next time, somehow I am not get=
ting email for xe patches.<o:p></o:p></span></p>
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
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ1PR11MB62040A764D956C82A0D7DF7181769SJ1PR11MB6204namp_--
