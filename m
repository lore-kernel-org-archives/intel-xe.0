Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F291BC77B7A
	for <intel-xe@archiver.kernel.org>; Mon, 29 May 2023 08:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA2210E05D;
	Mon, 29 May 2023 08:45:10 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E373810E05D
 for <intel-xe@lists.freedesktop.org>; Mon, 29 May 2023 08:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685349908; x=1716885908;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2ujhZZC+BxGryBOYNqsJDi63STSJcH5oiVu3TxZ75vs=;
 b=XwL09JWB+969DcVibVMrQeQo6IEyN39vfU0ZmreA92+AoXSpQAjYlyzu
 khpyMtZCecmUavhhWtKPY69puyI6kQlv0QZ6P5ndLn0WKsfrSeF9NhoWe
 Ddh9kl64O9Uj13rRT9JgvUvuIDWODC8+5opM1/JNthfBh9hlTcs7ojUxl
 U/jPSclzMIrIVourlFk4MCZbjQ5uv5fcCtet4bLuXDWrY0Oc5T9CihbrU
 kMpxgl73QKAamRs3VUwzAmu2D3uSmz6o8RZsEFjdAinvQYbKk0szs/g4h
 4euANPhy4PWB0oaVlor4iBmIhNd0ujBYX/TsRbaihh8iiZBlv5CtHhr6X Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="382911550"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="382911550"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2023 01:45:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10724"; a="705985429"
X-IronPort-AV: E=Sophos;i="6.00,200,1681196400"; d="scan'208";a="705985429"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP; 29 May 2023 01:45:07 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 29 May 2023 01:45:07 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 29 May 2023 01:45:07 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.44) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Mon, 29 May 2023 01:45:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAGfGzmbx+JF/n6/LFWApFk65Dw3axuZYI810xV/o5YukW0jIFbcSf671O6SpN64dvkFwEsmEiFEMHyY/qyMCQzn/uL/wTTFaVZQg1jRa6Qhwo1ItkyqAeUf5byQeP9VELSGISqAC0MfDKMPMsUGVQjeAm3CjY9ZFh+IM1bn7klEJ6pn8h0Hum8+aSdhYeaEYyS4y9xy/2YoM1OXbFsN8BWM9aGi2Pbrp7At6QqnC8z9WhdqOvGqEnYez7zjq4TkXTl52CLYePmbMg8cKWTFDI6ktskgEkPe2XFIdx8gB8QcDN/QD5qvt1LbYMDAaq18ywEsthjbkLH9mRjXkmlQnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CEBKu8IFo0XrMmvHFP3cjNqNbiDVrDdDoQCX9NxTYWM=;
 b=h3AI3sBgX50gV6C1IMJasZc+nnJe6vBAYhDHOUL7BeEKVIEpW24uUGJiFJqzeNcZ2ugjQ2a+NRXw0oVn263A9iPLBMs2AvKmfI7ScT6HIDblDSMg2CG9TNHjMuLqaUnor70jOpCdR4HsoUaNpfqfkZNV5WvxSuf2nMckflYys6GuaOY0DFi8JrwSq1ZNnOCLMoXCsgubiOXm6CKH8kqWIesiVL8oO2f96K/dOAsl3M52QgOmUBbtAtse+FHcSH9xt5X+vfqa2N8KV8y3kS0Qj3agyjaRIc8zw+By/O3eGFStpeQbjBrA/V52ss8ysUwpr+HFURKszaNwCfowzWtlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by PH8PR11MB6830.namprd11.prod.outlook.com (2603:10b6:510:22e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 08:45:04 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::4921:b87b:297:f312%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 08:45:03 +0000
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory size
Thread-Index: AQHZfnnA442CWcpcwU+iRKJIP+adcq9xFVWAgAAAXsA=
Date: Mon, 29 May 2023 08:45:02 +0000
Message-ID: <CH0PR11MB54742C54B5F0E7872CE9DC718C4A9@CH0PR11MB5474.namprd11.prod.outlook.com>
References: <20230504112020.300498-1-tejas.upadhyay@intel.com>
 <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB6204AD929734B440C251F235814A9@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5474:EE_|PH8PR11MB6830:EE_
x-ms-office365-filtering-correlation-id: e3a115b2-aa70-4853-0668-08db6020fe92
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yBPMmSqMugNkiESA94v9kuyaekmHUIU18G1QEVIPQoblPMba/08sO1Rqri/WLYGCoyGz12iWtgKfAc/jguRihEIcICJun5aEUaCM4oTFsgWuFT28d/lqh1xm2LB1QePB1JXdvNRfU2dF7id/ksq2B5Avtl58k2yxZCYKxUNHJqiTCplz8PBifjdig+EAocjedYNJUfKunG4+wbjxCdVqU4EI5D/kLRM72lAImmy8/pcOFYMeMTnrc+W2xFl0cjy0oK5eFH2ru+0cMpuphyrEAkGTQCRFZw/hYIbp9rfeiGZ93d1t1moA8oXAP2fSG5eFawyO+W5610k5qHQ+a+svEdDDlEUv2cfQibrseUJXVhZjC4xA+WEqz4rcUpV29DjKJ2Qk3veC/dCUej3oCbpHkPE/HdjB9g58wJel2JlYPKmPegJxDOTJJddfj0XZstOndk2kUtE42kd5/9BDk8wU890WRAm5w0YSzQNumq2LsdxR3Ueztq1sp6LzvXHz507MeaW/Pau60kQwBzXzds/fhVAHiCx36LzksGJAKwOOrajO2zquck7UgYAXxE61lmw0
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(136003)(346002)(396003)(376002)(39860400002)(451199021)(26005)(7696005)(53546011)(9686003)(71200400001)(6506007)(2906002)(316002)(33656002)(186003)(55016003)(52536014)(5660300002)(107886003)(41300700001)(8676002)(8936002)(966005)(478600001)(82960400001)(122000001)(38100700002)(110136005)(54906003)(4326008)(86362001)(76116006)(66946007)(38070700005)(66476007)(66556008)(83380400001)(66446008)(64756008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Sf4pwhNhuZqfJL2ZBv4bWlBEUu++e3fPIl10noKLSqcKQnzsJnQbD8m1hvQE?=
 =?us-ascii?Q?E2EnkugBqnbXMMudzSaTzIAbGF885mXirXbOFOp1Nl7PIbLe2heBNJvObx/M?=
 =?us-ascii?Q?lkySUJZs+0WDCL6dyuxO2PwEaxA+DxBDrk11HOF10QtpQKyEYJWLT9ya01J/?=
 =?us-ascii?Q?hNGTO3jkW2Vn8VlleV6cl6n+La2Qt2JXlnt9mNwyIJM38IhB7+t0+7j5/NT9?=
 =?us-ascii?Q?z+lwdR5Y9FPQCjTAMcyxftgvt2cx0gyxVcgVpjoJdV/AwCf79O1ZQTQyPNyA?=
 =?us-ascii?Q?7kBLQ41iSX8ZZOB278lZUnUYVJbtdSX7amaSwH5ux4q1u4/ouxOt71Kzb6CI?=
 =?us-ascii?Q?kj99yVlkpb7N3An3QHbT53BzfxjHAU5WCZybBfdqE2W8SY6GF/iv9tKfFeFm?=
 =?us-ascii?Q?HqSuPrSKZHHQRnz87aBxC1UE2rDL5QyjwV/sQg25UBbVgzDLvnzpieAv+Gg7?=
 =?us-ascii?Q?JSeZgclKw+HHugZ7B93bokEzg1ah8aj+xn6iNgFMarxIm+RiK/sprIrhx80v?=
 =?us-ascii?Q?nf/nJ2g9Uo0Zp/YK+RS/lkerqd0ASfEFEAQ9daavWkgoyEmBsOTEuESpEScm?=
 =?us-ascii?Q?1yd3u7kHGu9LRgNWiXuqsFP0upQSCuLGcg5q4NIlvvmM8UZAhO/8kHNr3FHB?=
 =?us-ascii?Q?IrAWiTpkqLi0BDEl6kAYvJkQn1ZY8yXPKpHR3m40Q/DiUd36OGvqNlo9EkQg?=
 =?us-ascii?Q?Xyo8bSMwfHdiKOWzl2qu9xJlVVFBoldvSwH6dmm1UgOjlavO5ZtAToEGWzBD?=
 =?us-ascii?Q?dHhZagXN6ClOK4CdRkmFrI3WXJoZbRHDOhVGSi5er439Cr9cbcP/qZaq+nUB?=
 =?us-ascii?Q?PPnxKRE3ncfQJsfbhgEANCNK2gToqqTZ3LmaE/9bRS/6ujBonynhCBzblQ2d?=
 =?us-ascii?Q?RRvPTA5T27p4toSiR8GOZ+xGpQZ9lwYbQ8zl+LS0CKGASJa1j2gPLTJZ5SIw?=
 =?us-ascii?Q?GDeOBzExBseMMAWKu/PcxVsl1ZJzcfDEzc7ylmP8M/C2OyY1MKWFxQ+4I+n7?=
 =?us-ascii?Q?TVh8z7aQs7TOfQANw9mK2HG2B1gRhHH04Tc20aPr9MgkMTWGflfdeh582dxv?=
 =?us-ascii?Q?UCJeBVzIfjlM9ivMvJVOWz/29aSSvty6ZDnJbLS/BLY8ANIkTZqxTlOKqXIg?=
 =?us-ascii?Q?6lpXBH40iuE1NfStzdpmXqx9KxE9ss4dQUDsv7jx2Zv0NUskbDjK43jrvRLl?=
 =?us-ascii?Q?KZQrDLtmLCCwPJZDfYNdNh72o20arDYXJBkuL4vOpVZ4IS2GGhpt+jXqZgwR?=
 =?us-ascii?Q?7tRjbwXuDmaA8rjJR39gGIVdaoHvAwmqOSyYnwtMb+e9H7plzMW+zdqfIpBP?=
 =?us-ascii?Q?qh24OVgmfNMa72eAp9X1fOKixhuT00++Vn2NPPXhh6gUlXPNfLjl8RMT8X6e?=
 =?us-ascii?Q?TWmf/Hy0LL+kMBlItE6opWBmKfA4RsMDAgF79O/odKkECbUbYGnUs75L8tPa?=
 =?us-ascii?Q?st3XP7glMkwJGM3uRWria6t6a5EfYxwbCSRuLBMoiMK+t0pHFvKZiZnVcxus?=
 =?us-ascii?Q?I+It5g1YRNM2q8qPlUORUlZE5WKRVDDymT37ovd5J2lmtT8h0ckKK/vpxvBq?=
 =?us-ascii?Q?24VmTA2jJG7ymVuWgFByMIxPse4rBBP1kaztaGiUChA9eQSiHb5ilVgbbaIy?=
 =?us-ascii?Q?uA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3a115b2-aa70-4853-0668-08db6020fe92
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2023 08:45:02.8716 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YLbpLQPjYRBmuQ3yYlstxb0gJ6usFVs31pv4xdAiZoWjtx9CJVMhHaMLkuMYjcQt34tnmQuNilzOkfjQr3RohiAfU4ruqzBvk4x9eBHOySY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6830
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 0/3] drm/xe: Add sysfs entry to report per gt
 memory size
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Sent: Monday, May 29, 2023 2:10 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Vivi, Rodrigo
> <rodrigo.vivi@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>
> Subject: RE: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> size
>=20
> Initiating discussion on sysfs path for this inline below :
>=20
> > -----Original Message-----
> > From: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Sent: Thursday, May 4, 2023 4:50 PM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> > <aravind.iddamsetty@intel.com>
> > Subject: [PATCH 0/3] drm/xe: Add sysfs entry to report per gt memory
> > size
> >
> > Add sysfs entry to read per gt physical memory in total including
> > stolen memory.
> >
> > The sysfs entry added can be read using:
> > cat /sys/class/drm/card1/gt/gt0/addr_range
> > cat /sys/class/drm/card1/gt/gt1/addr_range
>=20
> We already have gt#num directory created under device folder, should we
> create addr_range under that only. I think that would be straight forward=
 to
> start with.  For example,
>=20
> /devices/pci0000:a7/0000:a7:01.0/0000:a8:00.0/0000:a9:01.0/0000:aa:00.0/
> drm/card1/gt0/addr_range
>=20
> Initiating discussion there to conclude on path on this sysfs entry as we=
ll as
> scheduler interface entries as well as under "engine" folder under card1.

Scheduler/engine entries are not related to this feature let's discuss them=
 separately.

Thanks,
Aravind.

>=20
> Please provide your inputs.
>=20
> Thanks,
> Tejas
> >
> > As it involves drm_class, it required movement in xe_device init flow,
> > patch for same is part of this series.
> >
> > Actual physical memory per GT was dependent on infra patch from Ruhl,
> > Michael J, so I have added it as part of this series to pass through pr=
e-
> merge.
> > Patchwork: https://patchwork.freedesktop.org/series/117126/#rev3
> >
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >
> > Tejas Upadhyay (3):
> >   drm/xe: Rework multi tile device memory initialization
> >   drm/xe: Register drm device prior to gt init
> >   drm/xe: Add sysfs entry to report per gt memory size
> >
> >  drivers/gpu/drm/xe/regs/xe_gt_regs.h   |   2 +-
> >  drivers/gpu/drm/xe/xe_bo.c             |   8 +-
> >  drivers/gpu/drm/xe/xe_bo.h             |   2 +-
> >  drivers/gpu/drm/xe/xe_device.c         |   8 +-
> >  drivers/gpu/drm/xe/xe_device_types.h   |  20 +-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c       |  74 ++++++-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.h       |   1 -
> >  drivers/gpu/drm/xe/xe_gt_types.h       |  21 +-
> >  drivers/gpu/drm/xe/xe_migrate.c        |   6 +-
> >  drivers/gpu/drm/xe/xe_mmio.c           | 279 ++++++++++++++-----------
> >  drivers/gpu/drm/xe/xe_mmio.h           |   4 +-
> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c |  30 +--
> >  12 files changed, 291 insertions(+), 164 deletions(-)
> >
> > --
> > 2.25.1

