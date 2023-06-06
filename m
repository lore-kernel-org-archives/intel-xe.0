Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A24BEC7EE24
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 04:03:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CEAB10E206;
	Tue,  6 Jun 2023 04:03:28 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1951E10E1F3
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 04:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686024205; x=1717560205;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=N5sZK1S5gAnOGOyNEqO3fXR+JiXub8MRG+LQKiw1ncM=;
 b=G4rTPrK8NDBrxYbdJcZgrYZXQF5XF2CFQ/4xjy/XKxm4f7rspYI/0sEe
 xO9o6wHPp1boPtUNM7hkepIRZmrzT1Z53AU5stC8G1n774we6lRrMJ4q6
 zoBKdfV2rc2ZUQg6GN8AC4lnTG9rCCyBQLK4x+tasCv7HfG0o/x/Sx11D
 o5x5y6tMYq6edL9fbyykrcHEcogWYOCtsXIzur9oQYFm9RxPaNunscmM+
 hQ7VNqFIkSDkHkWzyRQB+ZYkrsyf7PyM+HfMKU5MVZ4yP5LSUjJ6zNQR9
 VlZwwHTm5FkCcvkpHJPUtEXi78rI5VJi8EKxSS85bs106bDbogbmVWFdY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="384863285"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="384863285"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 21:03:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="738602216"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="738602216"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga008.jf.intel.com with ESMTP; 05 Jun 2023 21:03:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 21:03:23 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 5 Jun 2023 21:03:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 5 Jun 2023 21:03:22 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 5 Jun 2023 21:03:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cIPUDt/Yq5gUpzsCNmgrBmbHEwHwtL9EyGOIUBOmUgI6sJQwGG5m3EfU5vkTTQLtrmJhMl7v9eBAtBwFoY+3IEwb2tI/7U2P4VsGHtvoD4vAM3yBLP0/4ldjhxJs1pB1Z4t5k3gsYJAmhUjfaGRiY4N3HFvwRywKtWNSVls0nGh28itH1h08AphKN+WeucCFnssCz4tieiv7Mjy9Zj795ui3BaksMOsaxxSJHiMWlABjwINUzfQILiizV51yTDTE/NQmqhVkGvHMQTyJlu6qxYfCRuhH4+PkuVNWwJSEECJQsCgjGdOHJSypqd+trq2b912jqvrrlEfaaY9lxWzHXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGdK0Gi5b8kho1ycBFE9ewMYzQITNZ5Pg6H1RghzhJQ=;
 b=jfr6uhulVmvBqETGwxD9SV9G6yfKx0dT9mq1Nmcpun9ozA0DhlM0TclqQDOHjGddovlnQDeHohBCfbIuWTUXQfmNKM/qYLFgpKvppK/ClpBFPCJ2rvqFcGMFUahOHGTJjitIcJI40Dp9lP+7rGV0wK7zEM1VJsvz4AFOj3J9gy4t97e6VWuQqEFEiuvZwBEh75yNu4MFEs0KTkp6V1oI3VnxyufoSbtYV+I38Teb0v8gI4LTiQaU7++BaNMBdcmY1UAeFJD8r2LozGPfSx7zclBv1a2kdsVqzCpNq8FJuxS4cTGYHnvR4jpUKk9AGTfBOwNhkF0dAioWMf7Zr627Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SJ0PR11MB5199.namprd11.prod.outlook.com (2603:10b6:a03:2dd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 6 Jun
 2023 04:03:20 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6455.027; Tue, 6 Jun 2023
 04:03:20 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
Thread-Index: AQHZjg3GEpQ52Tr3U0+LzA70gnJZCq9pnQUAgAAEl4CAAAHbAIAA3nuAgBK4YBA=
Date: Tue, 6 Jun 2023 04:03:20 +0000
Message-ID: <MW4PR11MB7056B78BBD72CADF823802EEB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230524070641.1601255-1-himal.prasad.ghimiray@intel.com>
 <ZG461NbVPLb7utFZ@bvivekan-mobl> <ZG4+rQfYHFvwiR5f@rdvivi-mobl4>
 <077e443da6439d4ae30428cf86a2e478e821c045.camel@intel.com>
 <20230525080621.196a76cd@maurocar-mobl2>
In-Reply-To: <20230525080621.196a76cd@maurocar-mobl2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SJ0PR11MB5199:EE_
x-ms-office365-filtering-correlation-id: d99d7ccd-af06-4680-f39c-08db6642f711
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LrQdWDAJRJj9/C/4pczWgIlnAFytRK+2Rbf7ylJaQrSpku3kw1DweQXx9K1pJ1D7vt3U/aToXPhE3CGByDywH3L4H8h25uTyf7P1VtIgVNLXavEhm7rlT9vuKY+RDDG0sjIZ0XPGG0Lb07dAJGbe6pJyagR1GfF0dA06Nd8eAInXLg6yasJq1PXqLdQfvYTnBbV8bUh3nVfr9oH7Oqyn7f6I8JD4GXHU589T1SDe0VoxTM7QJVsW/wjUf+KGIWUWIequszNwHqvHvcBF+A68QYjRJUTXIDq+pbwcyeMnTxoANIoFL69iA0kOLEkOPSM7hJyWoAJg8CNn9t/ZKyFqPUggF9gZm0IK0kTqUBRE6LCU19vOTB9QCQyWfUw4rPack/9xho9N89OCtLUuZhVq7XHfYldpptht4xa2gAP6BsAmSAD9NcNzisHYri5b3OrwFBpQdYeGnStPusGnD1ULcPsiDraRknchEFI/oYZ3s1jBW5ok8NV3jswABfbl6ME0JwlbGYJY3JjcTd/TKH29kdgYmzk7G19n3Kq1xNbTQxnbcfVMeORJZpzBaoSzdBKDgWPHsg9sp4HhcHO/4+JhehYrlNSyEoclHBeIAEbAbnJgb+xLGCi6TUrxFn4WLcsH
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(39860400002)(376002)(451199021)(2906002)(110136005)(54906003)(71200400001)(478600001)(52536014)(8936002)(5660300002)(8676002)(38070700005)(86362001)(33656002)(4326008)(66446008)(66556008)(122000001)(6636002)(66476007)(64756008)(316002)(76116006)(66946007)(82960400001)(55016003)(38100700002)(41300700001)(53546011)(9686003)(6506007)(186003)(26005)(83380400001)(7696005);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Nj3ocSJUj3lHxo/UH9QgaledG6TOqJcvdrh6nJ63iJHT0k7BWp1j61gKXpux?=
 =?us-ascii?Q?m4t5ctJSldTLjsDJCBSedtF0H8EvyB/sAucyUrzC7OOIfcqakRj6Li7dDc6d?=
 =?us-ascii?Q?eDUCwtXH0+PpjJwsS7ysB6+VZRop8+aq9oKXBMdAqXgkzbfDmwInivtId5O4?=
 =?us-ascii?Q?x2etkLlvQg8KgGKgItGu1IfNsDIAEvZbv6WOyf7aNjumCxc9bm0pp7T7rIup?=
 =?us-ascii?Q?aJHP76nVCoVwyR9QUsYAaroACLHB79S0rKkq/zMDE38CcbgVEImPRkz3y5xR?=
 =?us-ascii?Q?7B4GF6svAlni8ddoOiGsVMs/MKQ+Kb6oE8oVAsegjxSZBewWKreI69WFzaC+?=
 =?us-ascii?Q?8dMoTwgvhmH8GE8RN97en9X22Vbo5VA88Q5OtGX4UK9gsE2hOycJufU1sHLl?=
 =?us-ascii?Q?AGiGlClbZ9EHXLv4IQoFhFnaLVX7aL05IxYFOn8T+ZEMtT15d14YOB2qGALr?=
 =?us-ascii?Q?DxtrviABuAgyih4OMlQFF8fKgOLzxPoGphjy0HtZaO6pEdVecRCEMdR0pxid?=
 =?us-ascii?Q?qPUaQCR78aBNjjzUkUw17DQVCQfkTvo40K3edCQXu5tIuAOVWza2O84Aj47L?=
 =?us-ascii?Q?5FcaTfWoTtGuSNmyhehsKEFre24ppAiFZwKxJ+UOlJ0KBtq/3bN5YpwEQ2Tn?=
 =?us-ascii?Q?XEcAtijeKyXzlbYJfT+rOOsOe7BG6iq6RGor6JsHMB0+e9pny8VMJqiZEQgB?=
 =?us-ascii?Q?InNgBAUKU6Jqx6S6+20qMSbgqnkugLO0aiCy9HChBHrNeHSalHxure0uYdav?=
 =?us-ascii?Q?P31OoTFOAGAQHo4gMtJ7tilXY+HkHJzs2FSPMhtI8WPTKIkvkHAOPCw0FEIi?=
 =?us-ascii?Q?n1ZwwNP2x2VCX91h8bbCs3awjBuIFdKYgmlEQiufPHFpc9zS2/czKUveluBg?=
 =?us-ascii?Q?mg0pK6wwqAg3pvl/0HRdGCOEk0Hevfq3bVUBPiAyXAMAND7oEYh8fIcPGPCy?=
 =?us-ascii?Q?do1YKX/rSSAnQMhkVNbWKOos6ydILLF8Y/yyeEJ1/89hQwO0sSEH7CVfV7sJ?=
 =?us-ascii?Q?oUj7gZLc8O4Z98agXg6VZn6S/dLeDK8/woOSaPCh2g/XpitWMQbIWdnziLX9?=
 =?us-ascii?Q?WTOydvN0XPk6CstlrIfXNkk4rRk1q1pn8gFdU+I0PXAjbdFiWVTHSX2b1l32?=
 =?us-ascii?Q?ePJKz6+vMTe/ekLY1fETT4IeOdPMpVjWq8hDCCDulvb8HTyFwif0mD3N46r0?=
 =?us-ascii?Q?Sm6bYvlBN7eUp6GkfByK7I5tdRhRL9VHAdmIOTEG3fMwYIQC9hSDe0CZjxql?=
 =?us-ascii?Q?rBsrPvMlGMQZjwHkbclaSJOHtNVrspggaQq820gwy6TP5pI1FWugXRr1pXQC?=
 =?us-ascii?Q?O+FHVI3/qheIGFLGFZAscxnIYnD4I1PzCx62JbTHDZfHA5Z+Cpr0C3Rm31bI?=
 =?us-ascii?Q?0zwAOtE30L9uoECyYt5Ac1+e1gwY0+b10o5y9bGWZMndORb6sf9efy/LQeWz?=
 =?us-ascii?Q?06KO576nnDWMeMbUYrZvNkLLohZ966iqNg7UOlIn2mG7FHT/0MKdOWo69ZTw?=
 =?us-ascii?Q?BMt+0N4MCCA/AVBm4yveimcJrK5q/94x9Ko+YCoAYxIbKgF01lUg+gzL/dBq?=
 =?us-ascii?Q?KJy2nKYMN8F8gsSVRvWPHXn3CwphlwbaI+wzwwdCbZvWT9g5py03Dh3+FnLr?=
 =?us-ascii?Q?xQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d99d7ccd-af06-4680-f39c-08db6642f711
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 04:03:20.2032 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mwwLYPVpDPopY31sRfvI2YlYXr35BgwXYkh0+iRu2oNpc1wJXOpCyuPQf46TuI6fq2U9Rm9AQEtXW7ZS72+U4S+2/So5J7+yu/9NOtot8fM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5199
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking gt
 reset failure.
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
Cc: "mauro.chehab@kernel.org" <mauro.chehab@kernel.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Mauro Carvalho Chehab
> Sent: 25 May 2023 11:36
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: mauro.chehab@kernel.org; intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add a debugfs for faking g=
t
> reset failure.
>=20
> On Wed, 24 May 2023 16:50:04 +0000
> "Vivi, Rodrigo" <rodrigo.vivi@intel.com> wrote:
>=20
> > On Wed, 2023-05-24 at 12:43 -0400, Rodrigo Vivi wrote:
> > On Wed, May 24, 2023 at 09:57:00PM +0530, Balasubramani Vivekanandan
> wrote:
> > On 24.05.2023 12:36, Himal Prasad Ghimiray wrote:
> > In case of gt reset failure, KMD notifies userspace about failure via
> > uevent. To validate this notification we need to ensure gt reset fails
> > and there is no mechanism to cause failure from hardware.
> > Hence added a debugfs which will cause fake reset failure.
> >
> > v1(Rodrigo)
> > - Change the variable to fake_reset_failure_in_progress.
> > - Drop usage of READ_ONCE and WRITE_ONCE.
> > - Follow consistency for variable assignment. Either use
> >   functions for all the assignments or don't use for any.
> >
> > Cc: Rodrigo Vivi
> > <rodrigo.vivi@intel.com<mailto:rodrigo.vivi@intel.com>>
> > Signed-off-by: Himal Prasad Ghimiray
> > <himal.prasad.ghimiray@intel.com<mailto:himal.prasad.ghimiray@intel.co
> > m>>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c         | 15 ++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h   |  1 +
> >  3 files changed, 26 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 80d42c7c7cfa..b3ac8b3ab455 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -506,6 +506,9 @@ int xe_gt_init(struct xe_gt *gt)
> >         int err;
> >         int i;
> >
> > +       /*Fake reset failure should be disabled by default*/
> > +       gt->reset.fake_reset_failure_in_progress =3D false;
> > +
> >         INIT_WORK(&gt->reset.worker, gt_reset_worker);
> >
> >         for (i =3D 0; i < XE_ENGINE_CLASS_MAX; ++i) { @@ -601,8 +604,18
> > @@ static int gt_reset(struct xe_gt *gt)
> >         xe_gt_info(gt, "reset started\n");
> >
> >         xe_gt_sanitize(gt);
> > -
> >         xe_device_mem_access_get(gt_to_xe(gt));
> > +
> > +       err =3D gt->reset.fake_reset_failure_in_progress;
> > +       if (err) {
> >
> > This doesn't look the right way. It should be something like
> >
> > ```
> > if (gt->reset.fake_reset_failure_in_progress) {
> >
> >         err =3D -ECANCELED; or whatever appropriate
> >         ...
> > ```
> >
> > +               xe_gt_info(gt, "Fake GT reset failure is in
> > + progress\n");
> > +
> > +               /* Disable fake reset failure for next call */
> > +               gt->reset.fake_reset_failure_in_progress =3D false;
> > +
> > +               goto err_msg;
> > +       }
> > +
> >         err =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >         if (err)
> >                 goto err_msg;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index 8bf441e850a0..13d2a974bc00 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *=
m,
> void *data)
> >         return 0;
> >  }
> >
> > +static int fake_reset_failure(struct seq_file *m, void *data) {
> > +       struct xe_gt *gt =3D node_to_gt(m->private);
> > +
> > +       gt->reset.fake_reset_failure_in_progress =3D true;
> > +       xe_gt_reset_async(gt);
> > +
> > +       return 0;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] =3D {
> >         {"hw_engines", hw_engines, 0},
> >         {"force_reset", force_reset, 0}, @@ -135,6 +145,7 @@ static
> > const struct drm_info_list debugfs_list[] =3D {
> >         {"steering", steering, 0},
> >         {"ggtt", ggtt, 0},
> >         {"register-save-restore", register_save_restore, 0},
> > +       {"fake_reset_failure", fake_reset_failure, 0},
> >  };
> >
> >  void xe_gt_debugfs_register(struct xe_gt *gt) diff --git
> > a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7c47d67aa8be..746d65c4aacc 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -168,6 +168,7 @@ struct xe_gt {
> >
> >         /** @reset: state for GT resets */
> >         struct {
> > +               bool fake_reset_failure_in_progress;
> >                 /**
> >                  * @worker: work so GT resets can done async allowing t=
o reset
> >                  * code to safely flush all code paths
> >
> > @Rodrigo
> > This feature is purely to support test the driver and not something
> > which helps debugging. I am concerned whether such code should be part
> > of production build. I am thinking if this feature or any such patches
> > in future could be made part of a kernel config, which can be enabled
> > in CI when the driver is subjected to testing.
> >
> > I like this idea of having things like this behind a kernel config,
> > but we need to be careful to not simply break IGT or force IGT to
> > always depend on this flag.
>=20
> Well, debugfs is actually something that shouldn't be used in production =
;-)
>=20
> Granted, read-only debugfs nodes that would be just printing the engine
> states without affecting the driver functionality can be present on produ=
ction
> environments, as those could be used by sysadmins to report issues to
> distribution vendors.
>=20
> On other words, we may have two separate groups of debugfs entries:
>=20
> - entries that won't be changing the driver or GPU state machine;
> - entries that will be affecting the driver, like forcing resets
>   forcing reset to fail, etc. are more dangerous and may deserve an
>   special Kconfig entry.
>=20
> On such case, I would be placing a scary message at the Kconfig.debug fil=
e,
> like:
>=20
> 	config DRM_XE_DANGEROUS_DEBUGFS
> 		bool "Enable driver development debugfs entries
> (DANGEROUS)"
> 		depends on DRM_XE_DEBUG && DEBUGFS
> 		default n
>=20
> 		help
>=20
> 		  Add special debugfs entries meant to test Xe driver.
>=20
> 		  Never enable those in production as those may cause
> 		  malfunctioning at the Xe driver.
>=20
> 		  Set it to "N", except if you're debugging Xe driver.
>=20
> I would also place those options on a separate debugfs list, e. g.:
Hi Mauro,
Thanks for proposing on this. For the time being can we go ahead and introd=
uce this debugfs in existing list ?
Once the changes are in for separating debugfs list  it into danger_debugfs=
_list  and debugfs_list=20
we will move fake_reset_failure debugfs  to that list along with other appl=
icable entries.=20

BR
Himal=20
>=20
> 	static const struct drm_info_list danger_debugfs_list[] =3D {
> 		{"force_reset", force_reset, 0},
> 		/*
> 		 * Whatever other node that writing to it would cause
> 		 * side effects at the driver
> 		 */
> 		{"fake_reset_failure", fake_reset_failure, 0},
> 	};
>=20
> In time, DRM_XE_USERPTR_INVAL_INJECT is also a dangerous option. Btw,
> shouldn't it be enabled only via a debugfs entry too? If not, then perhap=
s we
> should use a menuconfig where we'll be placing all those error-inject
> features altogether.
>=20
> Regards,
> Mauro
