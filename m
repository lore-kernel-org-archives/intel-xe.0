Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88CE9C05051
	for <intel-xe@archiver.kernel.org>; Tue, 18 Jul 2023 23:53:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3714D10E3D4;
	Tue, 18 Jul 2023 23:53:03 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0106210E3D4
 for <intel-xe@lists.freedesktop.org>; Tue, 18 Jul 2023 23:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689724382; x=1721260382;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z9F8gPXfW3sv+G06YJ4K0XxxZ/OysJPWRvbrkg26uGQ=;
 b=QQ3/+IyCsxNOAICVK8bSLGQGVvh84q8RPygfxI7DCztQAMgRJmbRXdMa
 vAHfd7RlSTGfEfm/+wDOpStj/CL2GYBxDiamo/lnSEVlfrHo4yB4g4n7I
 xRSbRRDzeCM+nxAlyumm1IkHEi28ScXLgRGEd1oobjMUnzj9iSQxSUIox
 hnQeC0V1M9X5FcogTMOtyepqrGdGiWiuXyq8WlmOQQ4Wuf+hgJHE4452t
 aqs0cZ2hnRm2oyU4lO8Z3GQvU1QDy0zRglfoJjR1HWEc0jL3Cmf1FoRca
 JqMWh0CWIdXieNWqvFjX5mBVM7jTcMi9V7XMUte/Vvl6s3JocmlEhzL13 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397186397"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="397186397"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2023 16:53:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="789237060"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; d="scan'208";a="789237060"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP; 18 Jul 2023 16:53:00 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 16:53:00 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 16:53:00 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 16:52:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YtT49IELx5++H2OOje++x4Rj1i2fL6y+8/mJmUjp5XBsyPWpJ6bzmFJGpFN1SbNYLCAG9D9l72MbBRxb0seMIjODTDNCTP7Tique4ptEqvWHDT8OITewsemARQfLC+WwI/vtIRP0ut/fe/5Yh4phC+AkL3NvgdLBaEbE/fp41yJJ6MGnjZygH+YkM3xTXR+EVSen0AmZzwkcJfnpz4zcX5XUXBKgDA/TZ7e4YZ37Vwxf8oU3rKXUwHlc8mR9OEQfHOe+wrLyVMQep+jkfSxG+kdJ5IXDX6MMnhW3F59g1aaTSd+k9jcFMXB5ghBtVb46/3aKvz+aBnRQVRdCsAbasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCKXChJEk+Imzx2euslSYbhhJWEZFFU9+TrIMkOr9s8=;
 b=Vz5GIjrLmxp5Oq5xJkgchJ+lwXg6yWRlnaEiuFZHDinKsNVSPkU0riOfczGdwKaR3QsbZeTKpZdY7pZ9R4+8PD73wjSs3sAKg6H5WU522rSQjXdU1dJLKZNt8RrQ+pHNYMiYNkQmYIOy875uVoG+FpAjeU88d1kLjiAbWQa3EBTIMG/09azXR94zpiRXYPowz1UbkMyxHX51aYzBrwS0v8TrSxqVOdMMq6xaFMfHXiWTxvFTNuFvG1T8GEj95Rlrdiq1w2dHHT0y+J2lNBDqbWDjfD+IErroRLiJqJdGcTP7mD6HR3RUMPkDpzsoXrDBOHgAEDm6Cuq/IghbPFCHDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB7854.namprd11.prod.outlook.com (2603:10b6:208:3f6::5)
 by SA0PR11MB4640.namprd11.prod.outlook.com (2603:10b6:806:9b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.31; Tue, 18 Jul
 2023 23:52:53 +0000
Received: from IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::fb89:bfe0:22be:a78d]) by IA1PR11MB7854.namprd11.prod.outlook.com
 ([fe80::fb89:bfe0:22be:a78d%7]) with mapi id 15.20.6609.022; Tue, 18 Jul 2023
 23:52:53 +0000
From: "Roper, Matthew D" <matthew.d.roper@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Thread-Topic: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt reset
 fails
Thread-Index: Adm50veK+0XR18/Q7kC0gitUgHlRgg==
Date: Tue, 18 Jul 2023 23:52:53 +0000
Message-ID: <20230718235250.GL138014@mdroper-desk1.amr.corp.intel.com>
References: <20230718133216.3079521-1-himal.prasad.ghimiray@intel.com>
 <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230718133216.3079521-2-himal.prasad.ghimiray@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR01CA0049.prod.exchangelabs.com (2603:10b6:a03:94::26)
 To IA1PR11MB7854.namprd11.prod.outlook.com
 (2603:10b6:208:3f6::5)
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB7854:EE_|SA0PR11MB4640:EE_
x-ms-office365-filtering-correlation-id: 98ff917d-ba39-4447-ef27-08db87ea1a05
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OOZweKXhj6jgNNqxyDdJBAMTefb1n/X+BWf7of8iVxzkYENpiHDZHlZihA94MG8f1vF+uz0qzL/CIeGnbb0paAgOpvo8LhCojxd8oC+iH9xw/nRgyQf32pgzyseuxtll12PBJl3kXa2bnrmGyEoFUlNWwMdlLQytjCxXJC1ccb/h8nE/TeNJpwnpTh+5mM853cZqCMfzNPVlho+g9p4B96CiHgRwB3Vy++EgkJVFuPUSyUhJ8fmNg7jetbFDYEttaBetf1WLbiWlZW4RwEFlvdNAL40pwtCMwYkyMEVbdPvZDrGa1QIJSl3w3oTiZ2Js/BHbtVdmEW7IjJd1Qjbeq4DnCvvWjE1Nysb/3MXGhYdzjegzTbE9UB2STmfoaEBOABmUDlzUNzMLn2SFGbwnGroYNlN50GdK3Fpz61MOqasLIsYpfAR+16EHtUflcOlJOZJSZwSxS2F97mxieJsg2d4iP393XvMpcp/aODSSrR6qh3QjwKlDC+2hQ9xgpPHjuURZ1/CruSPInwcdWVKCq/62fm1lJ1ZPIr8pPmdX5D8OUAfDzgI2wJEl9KdptSyS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(396003)(366004)(39860400002)(136003)(376002)(451199021)(86362001)(2906002)(6862004)(64756008)(66446008)(8936002)(66556008)(5660300002)(66476007)(41300700001)(4326008)(8676002)(316002)(38100700002)(6636002)(66946007)(186003)(54906003)(122000001)(1076003)(82960400001)(6506007)(478600001)(107886003)(26005)(83380400001)(33656002)(71200400001)(6486002)(6512007);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?mOWNrYAfhHWo8Ljovg3pyU1X+PY7XJQ54LGpaiQcbbhaUCPpDUM3Xm11pgdu?=
 =?us-ascii?Q?27/uBllBtsOSIHa0ff0HpzHQzThJWxB7Jtw+RTvE5vvdW9mVIfQFx9Ie3xqH?=
 =?us-ascii?Q?RZIpynddtR3clnPzFVHGkmwJhqrwBwgG4FxdRAhpVYm6i/Evs8cY6r1CnCOR?=
 =?us-ascii?Q?v7ihMYxxCk4ORwLw05B/b0k9UXhQ3O7pe36fqsjP4uenEwIbABGdshrW9GIp?=
 =?us-ascii?Q?FR0AXG120a0Nuh1dbpOlIvo0YXsxakqiUmV+gyIhqAp8Z6fq/J/uhiHFTc84?=
 =?us-ascii?Q?8xLNg6SIzoJdD6Vjs4NycuctkiNj256fCNNKtg4iT4C4UZJRPC6tVecRM7rw?=
 =?us-ascii?Q?6rN0xPlp2RkoY7Btoz7UxqY25XY7caVSFtd97RTHrD1TgwmeygHxdStL0msb?=
 =?us-ascii?Q?O23qhMukNsM/AxB7y7TlebUkcv1e2Oz7ykZ+hXaXAxG39j6OukoLLfhH3n1J?=
 =?us-ascii?Q?TR+PFhEJVjQN4wjlY2iIiH+KKpB+yM/imzUc0PmiEBqjorEV4bsHIGiGIBvT?=
 =?us-ascii?Q?wSniY9FhndEMHVuDAJuex2oklTPpUvZfy8jOoevlfCaCoDLLELzZ48B/rC03?=
 =?us-ascii?Q?DoEOZ98TfIIr4Sm6GlrMxRxhM8qSsKUcNUXifrn2hQywud0ua0wDnbJ5phzL?=
 =?us-ascii?Q?YiAZ9YlXhu/WgzJpxSJ0D7uyBsJHzPlh+ShYZYY5jOjvCOFnvReDU14OxSQq?=
 =?us-ascii?Q?/gAwqLaz5ELpWuYoVqREVCPAPGYuUtHUKQuz4ms8OsSJPWa5GpzrZAPLyeNZ?=
 =?us-ascii?Q?xB6HncCrYeZOZ6WfQA0M7so4GOJauFYrP9DQ2BPjCXwBQ39udPR/kzA7AVU+?=
 =?us-ascii?Q?G+S4oRkYmqkzXs+SQoYNYVE/bO6v9IHcbSeowRUzvCOeQbtO70kqwkPc3Ae0?=
 =?us-ascii?Q?OjaT0eOGCG31lp+BoRHXChPtmrQtfwJj487FOqknE8u1qArrJ3y5PoJOpvbg?=
 =?us-ascii?Q?lEMEZImOXor67fRr/OcgC+PONAaqewZfcM7C2TjlTGd+uGZvOysMeE2yKSvy?=
 =?us-ascii?Q?zzHavWA8aJIxBzd75wXln9BYoV+DBbnFabekxcDAr8iN/tmuYLzgC4O6fUs2?=
 =?us-ascii?Q?GsD8hQaoLkd8GHXeU+Yt8w6FdlzHDopWtUlnsop+1TrnPdKs5ESVM/UEANTW?=
 =?us-ascii?Q?Rm4QV8abkXRnbJMqJtgK1DladWB752GhUb/z8D8mi9bgh26ZqHad2aRvEj/7?=
 =?us-ascii?Q?8ddanLYmLfKX+wJiTXA4SuXyw/9cWPzL9RmDqdD/Kf0eA9ntNyPh2hPgCGkl?=
 =?us-ascii?Q?f/scM0du+7CbACzmVpyAWN9+ahGNhi/ETd+U85kZ9/VudKymRB+YGPl9A28d?=
 =?us-ascii?Q?l0K2+8iih22JdAqxvDyt3STVl2cq1GHn7GiBrXthYsC8NhflTYGDrz3vrslq?=
 =?us-ascii?Q?fcs0wCGB1jAyBhpOAJlphRDuJkN3awQto5ZCPq6HaRMS60G5pwcpyZWaxemQ?=
 =?us-ascii?Q?LF4xQrp34fLPdpgKId1XFtZLZ5JkLj5bKQuARsW4X5BQCkKMaj9pidwxWYDh?=
 =?us-ascii?Q?TSV1yy8nvLuwR6xU+GU1GOgl9IpVCIRxVEI0uEFFozXhRXZqgWyKLal8wwzd?=
 =?us-ascii?Q?i7uaar1j55zwEqLcd2X1VWYjPVTIvoVBSdZz6usxfidI1N6lDgxwR4qzDFdU?=
 =?us-ascii?Q?Zw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <9438C8F8B6B6C64FA717F525BB024D8D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ff917d-ba39-4447-ef27-08db87ea1a05
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 23:52:53.1670 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hDLc78kjmGubj5QTjPU10eGK/0R5INRYHD/FdSrJaHAzDB53Z2zz7KMiiywWzRiWi729kqB/xf1+yaXZonz17OH+lZOfp5vyqnFgTdvY3cc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4640
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v5 1/2] drm/xe: Notify Userspace when gt
 reset fails
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
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Jul 18, 2023 at 07:02:15PM +0530, Himal Prasad Ghimiray wrote:
> Send uevent in case of gt reset failure. This intimation can be used by
> userspace monitoring tool to do the device level reset/reboot
> when GT reset fails. udevadm can be used to monitor the uevents.

This seems a bit questionable.  In theory a GT reset shouldn't fail; if
it does it either means we've either got a major software bug or a
really catastrophic hardware failure.  Letting the kernel driver just
blindly move forward after reporting a uevent doesn't seem like a proper
response to a huge problem like that.  Relying on userspace to pick up
the pieces seems insufficient.

Right now the return code from gt_reset() is just ignored and no
meaningful action is taken within the driver.  It seems like we should
at least be putting the device into some kind of 'unusable' state
(similar to i915's 'wedged') so that other parts of the driver know that
everything is completely broken and that they should stop trying to use
the device (or some subset of the device).  We could also potentially
attempt recovery ourselves by escalating to a DriverFLR.

I'm not sure why any userspace would ever care about the specific
condition of "gt reset failed" --- it seems like it would pretty much
only care about the device being in one of three states and wouldn't
care about the driver-internal details about how/why it's in one of
those:

 * Everything is good; can use device as normal
 * Device partially broken; it's no longer possible to use these
   specific GTs, engines, etc., but other units should still function as
   expected.
 * Absolutely everything is broken and nothing works.  You _might_ be
   able to unload the driver, issue a PCI FLR, and reload the driver,
   but otherwise all hope is lost and the device cannot be used anymore.

Even if we decide that some uevent is appropriate here, this is new uapi
and will need a real userspace consumer too.  The fact that we can watch
any uevents raised by the device with udevadm doesn't seem like it would
be sufficient for that purpose; that doesn't feel much different than
claiming 'cat' as the userspace consumer of a sysfs node or something.
What we really need for new uapi is a meaningful top-to-bottom solution
that gives us confidence that we have an appropriate and maintainable
interface defined.


Matt

>=20
> v2:
> -Add NULL check for xe_gt_hw_engine return(Aravind)
> -Arrange variables in Christmas tree order(Tejas)
> -Check GUC_GSC_OTHER_CLASS(Tejas)
>=20
> v3:
> - Rebase
> - Remove notification for engine reset failure (Rodrigo)
>=20
> v4
> - Rectify the comments in header file.
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt.c | 18 ++++++++++++++++++
>  include/uapi/drm/xe_drm.h  |  8 ++++++++
>  2 files changed, 26 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index a21d44bfe9e8..1db4d610f2fd 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -8,6 +8,7 @@
>  #include <linux/minmax.h>
> =20
>  #include <drm/drm_managed.h>
> +#include <drm/xe_drm.h>
> =20
>  #include "regs/xe_gt_regs.h"
>  #include "xe_bb.h"
> @@ -500,6 +501,20 @@ static int do_gt_restart(struct xe_gt *gt)
>  	return 0;
>  }
> =20
> +static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> +{
> +	char *reset_event[5];
> +
> +	reset_event[0] =3D XE_RESET_FAILED_UEVENT "=3D1";
> +	reset_event[1] =3D "RESET_ENABLED=3D1";
> +	reset_event[2] =3D "RESET_UNIT=3Dgt";
> +	reset_event[3] =3D kasprintf(GFP_KERNEL, "RESET_ID=3D%d", id);
> +	reset_event[4] =3D NULL;
> +	kobject_uevent_env(&xe->drm.primary->kdev->kobj, KOBJ_CHANGE, reset_eve=
nt);
> +
> +	kfree(reset_event[3]);
> +}
> +
>  static int gt_reset(struct xe_gt *gt)
>  {
>  	int err;
> @@ -549,6 +564,9 @@ static int gt_reset(struct xe_gt *gt)
>  	xe_device_mem_access_put(gt_to_xe(gt));
>  	xe_gt_err(gt, "reset failed (%pe)\n", ERR_PTR(err));
> =20
> +	/* Notify userspace about gt reset failure */
> +	xe_uevent_gt_reset_failure(gt_to_xe(gt), gt->info.id);
> +
>  	return err;
>  }
> =20
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 347351a8f618..c28bb54812e5 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -16,6 +16,14 @@ extern "C" {
>   * subject to backwards-compatibility constraints.
>   */
> =20
> +/*
> + * Uevents generated by xe on it's device node.
> + *
> + * XE_RESET_FAILED_UEVENT - Event is generated when attempt to reset
> + * gt fails. The value supplied with the event is always 1.
> + */
> +#define XE_RESET_FAILED_UEVENT "RESET_FAILED"
> +
>  /**
>   * struct xe_user_extension - Base class for defining a chain of extensi=
ons
>   *
> --=20
> 2.25.1
>=20

--=20
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
