Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EEF3C77B73
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jun 2023 13:19:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EFEC10E13A;
	Tue,  6 Jun 2023 13:19:04 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D5E10E13A
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jun 2023 13:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686057541; x=1717593541;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=bHboRZMQA1ypw9+mD0k+fha6uHc9n9kI8zjWB7tbaUI=;
 b=Q0IibKdYboZGDhaVVx+N6ofIRCSdBO9z1JL1Lr2J8w3Lf390eGLdGMd6
 4EzMnK+Pdw633mOx/ErlWpdA1bOSDQCJed8OLWWGGt2NWTyRZfIseSXRz
 YA+inM0uPL4uyl4yqZ6Ptug5PnsXLr0WAoRHhhJYqDZtizkOVrdTEFfC+
 qC6CaRdvOai+WgFhW5gFWfEeTdGP4GblkogBm5pI3WMaoxwUGR4anZmF/
 QK3NxthvMFUsAZlosBtReo5jmXu3Gt7CNCNlReFdca1iM5FxFhehqhwtF
 FxlrvA4+PBkXDGtUXnvmap0oaqNkW8VXKr+/YHhPU/IlCYYl7ah74WHeU w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355521556"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="355521556"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2023 06:18:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712207909"
X-IronPort-AV: E=Sophos;i="6.00,221,1681196400"; d="scan'208";a="712207909"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga007.fm.intel.com with ESMTP; 06 Jun 2023 06:18:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:53 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 6 Jun 2023 06:18:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 6 Jun 2023 06:18:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TLEVDHLPxeD8RkIVsSn7Nim7AKtNjE1HU+tdJz0dyDdSzdsnoLE6tAvrVFsb9z+k126x129lQpdujrkOoI+dmDlBsqBvn3kybtKPazffEsjbBE0mhkM267EavpML0OJD02lfXea5qNdZ54q/GhVcreOaiLugSPLDYxYDv9sLy038iIRFxI3tv8++AauSHwGIWB+yeO2HuvV8rm5N8txss/cNUKFly7TTHKth5XEMARDhaH9FbhwQ7wfLEjF+gtD7vnX6qyFkJm+ajjEqHG+d3Ydk+GzggtV3upFEI5+FbjgJ1gjqaaKANI9nGZO90XbyOEUmriK1QPLJkT4PbOagQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=upLn13C1eHcq5W/tZ3I11RfmW6dqij6tHrflz41nDRo=;
 b=Z3bogfkpv9JiSwbOHfeecaL6U/za57EJREHiIQMkonbxy3f4r9rgDSxG0uI9t/iz6qhv/kSbBFO3c/4dqKxYIu0qMsvGBqEM69rxopYCQ+nv98hrC792LsTBOzVT4DH4DlcVOFKB+BnP9wdMRdcg3SbXCybCgUlgxA1I6CNZXkXbZN16ZYWHcqVd56mFlQaZYZwsRiN5l7nKiFvGTndYq3qZVfpvTVYy+ka0PRmU53vTwnfl7dVL4nIlIoO8yO5tbB4R85/sVRfno/fubh6/YNsIrDHbx5FGtDUL8x2mU0lHFqRqJc2HQi0xYuLv9IGZB8SDjh+M6QxSVS+DCrxu4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by LV8PR11MB8606.namprd11.prod.outlook.com (2603:10b6:408:1f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 6 Jun
 2023 13:18:49 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::3204:9161:6e53:13f8%6]) with mapi id 15.20.6455.030; Tue, 6 Jun 2023
 13:18:49 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
Thread-Index: AQHZmGcXkDYuNuVE5EG7O9XvY827Ea99pbSAgAAQO9CAAAZcAIAAA7oAgAABz3A=
Date: Tue, 6 Jun 2023 13:18:49 +0000
Message-ID: <SJ1PR11MB6204EBA18C8FBD283C2C3C8D8152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230606111255.2072426-1-tejas.upadhyay@intel.com>
 <20230606111255.2072426-4-tejas.upadhyay@intel.com>
 <MW4PR11MB7056AE15AD5B95237C28ED1FB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <SJ1PR11MB620486DDD4FDCBABDF7C9F558152A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <MW4PR11MB7056695EA2578997C75D3258B352A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB70567C5690AAF98A0C8FC5DDB352A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|LV8PR11MB8606:EE_
x-ms-office365-filtering-correlation-id: 200abd85-8420-4ad3-c8a2-08db669090d4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: A+YVIsXkKR1p0XXP76vjZ5nnAW+vtQ0+VcCDlta1AF/y3rCP3d7Bm3chnTnpGWwnK7+Emn52URHCh5Dpp2vdoY64rodZWvuICFYLY/hjzaF2Z6BSfLzl6UTyJ2yP+655aSy1E57J34AgKc2s8jrPKkVtG+6ZconiOk0+ZaglOhOzLZ/dwmRN1uyxTWt2w3V4Qa1zLNamw+RSzNuV9rEkXUnpp5WCxuRGOYa3sIjvU77uE1cbAp3eSQZOY1Twe+WMrJ1/rRcGiZtXOMTnObcpIn26YVSY3hOKEXOlh7VquaNcIXIQbro4Uhqww8Y7W/AtLuGiJDTQQcow3XQZ1Cb98HrK9BbFElPBzABxm9/Rn4Hx60MfSDVWqgSoqsJ+BBSwddD5nC6l3ERkJIQ1vJeFprdUeAeNE8wTA10WXvtmP13U8/HpUKnA2PjX+8VUh4LCKqWtUk1P/vBkGbTJiqbhtek6WS0iV5XyZvNa8IlXazDe1NN09HC47M3sj35zEZEW3NhCYCN0qxmDBDv1kJrcbyiLCF0qG7SabKAOkeDLVyveNbBgmnTpdoDrXEXhSct6XrvdMhQNtcvc1MvL8WL6rDZRZyxV+8DuC68HB88QdDRGsDTmO4YhZzukEj2A45Qc
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(346002)(366004)(136003)(39860400002)(396003)(451199021)(66476007)(66556008)(66946007)(38070700005)(52536014)(8936002)(8676002)(76116006)(64756008)(66446008)(5660300002)(316002)(86362001)(110136005)(41300700001)(38100700002)(478600001)(2906002)(122000001)(82960400001)(71200400001)(9686003)(7696005)(26005)(53546011)(55016003)(6506007)(186003)(33656002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?diZfGEHSq1WGdV5PuYuGygLqZsVMw/WBozmWNkd1b/YUB0j9Lw8wK+d2Sjk7?=
 =?us-ascii?Q?uUAz1CgI2pbu7q6EFWckrQ8lWooeSl87eaWdAmDtmHYyg0ZnCChWHNNljPGb?=
 =?us-ascii?Q?ogi/OxfXZxv/zJm6CqR5k2ZpmeQ7XOPb3QJ2r256kTHb/v55gKPYxZnXkBQO?=
 =?us-ascii?Q?lDZ/WudA7P5K243rTp65etQsYZwjNI+lkkF/QUATyTaA9s9NvrIMqEddkfNj?=
 =?us-ascii?Q?Gnn4mrb4/15/QzQzu6PyP0RUf1shep2U7GyL8TbkcqUMbUQpzTSoEltJW1t7?=
 =?us-ascii?Q?OBuTBmB0yYpmUtrNGQ/IlYEFlhGzbnF1RJ50meaZJOLQjwKRxe3GYj/SZB33?=
 =?us-ascii?Q?cV/bXcNiJDo2VYu9KQlrCwqvE1pDbDLD+CuAOXJUSTfN804RC1pRqegXrJSr?=
 =?us-ascii?Q?qlPoyEk71ViltGBOqsisvBSA7pgaBrt+/rpO5LQ4vmdEbrZ1SfoVidhQcbrR?=
 =?us-ascii?Q?uDcR3XkbalUHoZTN9Wz7udSnFdzOJ0boTztgSmol26r40a+/pGvSW5bROcYV?=
 =?us-ascii?Q?Y2ZvmebDHRWbV2uzsft0gf4P8pJXM+cPQPez4tG+SkYKIpHBajGnMMd0FliC?=
 =?us-ascii?Q?5mBhUOlmE37fIZkRQ0aMi+vXXr7Y8H9vPIh4N/W02XjMH/cdYKlli9Dn4NGM?=
 =?us-ascii?Q?sh87t8tkfb+2IW8UzM7Fdc44WtQLfwMqCRdq5WoWUWuGsxHoDSE54UpqkRSY?=
 =?us-ascii?Q?gbCP8wK2rk75vrMUb2tEBV08l6VrMUDS+8ygZOvYqaAodC5lwevTBXBcpAwq?=
 =?us-ascii?Q?c37ZoKFRfOfX1dfP0oYCUXO/Z0XPuOdRqdIeuVHoeljBAJ3LqM4OrTQ7jOMk?=
 =?us-ascii?Q?KdW8BfT3uQdwlwajJjRkQRUGJUomxYyfao9yqrtd9943wXciv+ROTGpZmJrT?=
 =?us-ascii?Q?qpky7h4Ec8toThoKGOap8KrLGx1TEoctxxJgeZ2vrFm51Qj7lf1My2dEW6Ph?=
 =?us-ascii?Q?eBnqAHP1ntRm2MpzKYiDg2IqOjLIK+lS4W1TerfPIJNe7R+o1bBMUeMbYUhm?=
 =?us-ascii?Q?Gp2RzNjwl0xiSdzmkj+Mx2YqnL5PwYRQogNUJhS/iiIaX7dWKG3MME1BaM6k?=
 =?us-ascii?Q?JkA7npwz5tpaZTOVf2OVLrBtQSuOCwyXGJdNrsSbroA37Ht15XbR+fXT4ray?=
 =?us-ascii?Q?V1r1+aCRrwPP8OpCQK+vqx4birZHkVJAf5cMMrkVcmX1CXDeAwvZ48sVOKCZ?=
 =?us-ascii?Q?cU/QbbbB5aSDmlTfOvgdZYZDvFoyiaE34IxLPkb94MJeGDSz/2QSZi5iQ9XD?=
 =?us-ascii?Q?izPZhhyIpQ2kOxwvVcK5VvbUtOjocXGqYzG/NYnV8hvclVDeviQjIckwhxyQ?=
 =?us-ascii?Q?YeETmqFEGFapAw5dypYV/VcRvIH3P9A8V3g4jlh/1XGnHigAVyX2sLhS+dHU?=
 =?us-ascii?Q?3wHI3/ZEKWYx1R4JD1XmtYSH7jZxq0B81e4nClGBTz/DxltoTiupsRoUQ88u?=
 =?us-ascii?Q?jD7odiTcMf7xm4PaB24Yru+UUGflClnjGIE9HVSUs+SOmnjaODw4jswnGI6G?=
 =?us-ascii?Q?RL0wHCMGWuY+MHSaKvtPEKD9TKKGNa23zrCHbzJMfSzHgxR/4Pq4i5TP/nVX?=
 =?us-ascii?Q?ljPx/YwlP1x4TtsQBCx58sBoNdit4BOxNc/P52Tg?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 200abd85-8420-4ad3-c8a2-08db669090d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2023 13:18:49.3992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Gs0N70fLix0IJHkYmnheiU5DVyXx75IffHIvEtgLRiJ5bh74tHbrpYXzZwlMoc197UW1NQSkJljmF6pbUQQtJBUHgAJNaBBh2za58jzjKEY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8606
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per
 tile memory size
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



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, June 6, 2023 6:42 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report per=
 tile
> memory size
>=20
>=20
>=20
> > -----Original Message-----
> > From: Ghimiray, Himal Prasad
> > Sent: 06 June 2023 18:28
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > xe@lists.freedesktop.org
> > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to report
> > per tile memory size
> >
> >
> >
> > > -----Original Message-----
> > > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > Sent: 06 June 2023 18:06
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > report per tile memory size
> > >
> > >
> > >
> > > > -----Original Message-----
> > > > From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > > Sent: Tuesday, June 6, 2023 5:07 PM
> > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> > > > xe@lists.freedesktop.org
> > > > Subject: RE: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > report per tile memory size
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On
> > > > > Behalf Of Tejas Upadhyay
> > > > > Sent: 06 June 2023 16:43
> > > > > To: intel-xe@lists.freedesktop.org
> > > > > Subject: [Intel-xe] [PATCH 3/3] drm/xe: Add sysfs entry to
> > > > > report per tile memory size
> > > > >
> > > > > Add sysfs entry to read per tile physical memory including
> > > > > stolen
> > > memory.
> > > > >
> > > > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_device_types.h |  5 +++
> > > > >  drivers/gpu/drm/xe/xe_mmio.c         |  1 +
> > > > >  drivers/gpu/drm/xe/xe_tile_sysfs.c   | 47
> > > > > ++++++++++++++++++++++++++++
> > > > >  3 files changed, 53 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > index db61da4d6212..7b5443aebd00 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > > @@ -107,6 +107,11 @@ struct xe_tile {
> > > > >
> > > > >  	/** @mem: memory management info for tile */
> > > > >  	struct {
> > > > > +		/**
> > > > > +		 * @actual_physical_mem: Track actual LMEM size
> > > > > +		 * including stolen mem for tile
> > > > > +		 */
> > > > > +		resource_size_t actual_physical_mem;
> > > > >  		/**
> > > > >  		 * @vram: VRAM info for tile.
> > > > >  		 *
> > > > > diff --git a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > b/drivers/gpu/drm/xe/xe_mmio.c index 475b14fe4356..86a7c65c301f
> > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > > > > @@ -283,6 +283,7 @@ int xe_mmio_probe_vram(struct xe_device
> *xe)
> > > > >  		if (err)
> > > > >  			return err;
> > > > >
> > > > > +		tile->mem.actual_physical_mem =3D tile_size;
> > > > >  		tile->mem.vram.io_start =3D xe->mem.vram.io_start +
> > > > tile_offset;
> > > > >  		tile->mem.vram.io_size =3D min_t(u64, vram_size, io_size);
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > index 821bd49de277..d48c599e8cc1 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> > > > > @@ -22,6 +22,43 @@ static struct kobj_type xe_tile_sysfs_kobj_typ=
e
> =3D {
> > > > >  	.sysfs_ops =3D &kobj_sysfs_ops,
> > > > >  };
> > > > >
> > > > > +typedef ssize_t (*show)(struct device *dev, struct
> > > > > +device_attribute *attr, char *buf);
> > > > > +
> > > > > +struct xe_ext_attr {
> > > > > +	struct device_attribute attr;
> > > > > +	show xe_show;
> > > > > +};
> > > > > +
> > > > > +	static ssize_t
> > > > > +xe_sysfs_show(struct device *dev, struct device_attribute
> > > > > +*attr, char
> > > > > +*buf) {
> > > > > +	ssize_t value;
> > > > > +	struct xe_ext_attr *ea =3D container_of(attr, struct
> > > > > +xe_ext_attr, attr);
> > > > > +
> > > > > +	value =3D ea->xe_show(dev, attr, buf);
> > > > > +
> > > > > +	return value;
> > > > > +}
> > > > > +
> > > > > +	static ssize_t
> > > > > +addr_range_show(struct device *kdev, struct device_attribute
> > > > > +*attr, char *buf) {
> > > > > +	struct xe_tile *tile =3D kobj_to_tile(&kdev->kobj);
> > > > > +
> > > > > +	return sysfs_emit(buf, "%pa\n",
> > > > > +&tile->mem.actual_physical_mem);
> > > > > }
> > > > > +
> > > > > +#define XE_DEVICE_ATTR_RO(_name, _show) \
> > > > > +	struct xe_ext_attr dev_attr_##_name =3D \ { __ATTR(_name,
> 0444,
> > > > > +xe_sysfs_show, NULL), _show}
> > > > > +
> > > > > +static XE_DEVICE_ATTR_RO(addr_range, addr_range_show);
> > > > > +
> > > > > +static const struct attribute *addr_range_attrs[] =3D {
> > > > > +	&dev_attr_addr_range.attr.attr,
> > > > > +	NULL
> > > > > +};
> > > > > +
> > > > >  static void tile_sysfs_fini(struct drm_device *drm, void *arg)  =
{
> > > > >  	struct xe_tile *tile =3D arg;
> > > > > @@ -50,9 +87,19 @@ int xe_tile_sysfs_init(struct xe_tile *tile)
> > > > >
> > > > >  	tile->sysfs =3D &kg->base;
> > > > >
> > > > > +	if (sysfs_create_files(tile->sysfs, addr_range_attrs)) {
> > > > > +		drm_err(&tile_to_xe(tile)->drm,
> > > > > +			"Setting up sysfs to read total physical
> memory per
> > > > > tile failed\n");
> > > > > +		goto err_object;
> > > > Will do kobject_put and return 0. Which is wrong.
> > > > Better to do kobject_put and return err here.
> > >
> > > I don't think I have any action to do based on error, clean up was
> > > already done. Am I missing something here?
> >
> > In case of sysfs creation failure, you goto err_object do the cleanup
> > and return 0.
> > Should you be returning 0 incase of sysfs creation failure ?
> > >
> > > Thanks,
> > > Tejas
> > > > > +	}
> > > > > +
> > > > >  	err =3D drmm_add_action_or_reset(&tile_to_xe(tile)->drm,
> > > > > tile_sysfs_fini, tile);
> > > > >  	if (err)
> > > > >  		return err;
> > > > >
> > > > > +	if (0) {
> Doesn't make sense if disabled for default. Move to sysfs creation failur=
e.

This is for future sysfs entries, which can point to same goto err_object.

Thanks,
Tejas
> > > > > +err_object:
> > > > > +		kobject_put(&kg->base);
> > > > > +	}
> > > > >  	return 0;
> > > > >  }
> > > > > --
> > > > > 2.25.1

