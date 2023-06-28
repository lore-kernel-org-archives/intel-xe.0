Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1013EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:16:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9828410E0ED;
	Wed, 28 Jun 2023 11:16:32 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330D710E0ED
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687950991; x=1719486991;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=obRvZdD8szjic2yR/+bL5sBD9TZv4VU5+Sxw31Yaagg=;
 b=INitjAAppJZ2XcMoFMSOxHsBlXI39Ob302Ol3mE3P294/rEeFuBHQtA4
 xHpvK/IUo4pIHWhqOgUhMOpvv0mJTgB1LHCPht9JeuiU2rAHnyZidVFRd
 AJYJWJPWhnnB6QqhMBRgVongIM97y7Nh5eMnmJkVwI9vrfVmdZb3ayKYf
 qLhxEhZ8qQmwI1rSzdQMRFSkf/xlliW2AKzNcJ5nWnJV2Eg15IghiaR2M
 lcRWLnRiNbqagihPqTrqEEfPzjytxkWpdnglGqZV6HaUryTW+eRI5Puq8
 LSeHxlUSqQfHScPAJSLK1IBzRfZOFwFBjusODYSQ7KHBUTdkavypxT+c1 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="341402247"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="341402247"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:16:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="891006508"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="891006508"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga005.jf.intel.com with ESMTP; 28 Jun 2023 04:16:29 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 04:16:28 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 04:16:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 04:16:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXZAaQwQoTXmhLvxPKQlUdOxZKWX+JflobhhrsX3qUScj8ERQ+kgCno/7CduNK3lb/HhnpuTrzBwouDQhwXQ5e3gmDNgi0yI5FF85/aE7gn3j5panaXo7e3dxz9z05zSyoMWG4HapNcnSp6cmGB6WmS3Cx0N7/ubGb4h78VZ46hHjq7QTek9gLT8WPSDCnYhU8ZIT+kkOiaP+oOZVshwX7HZ/ujm0PRJDaYIbn6Q//I+xrA5vzAx0q4hQqzozcTjHRR5KgHR3zEpeZueF6UP9cRJv7mwOOg0Cuwbioi0O08p3w9MS8e9uQKUJtmsETtC3pH01PUb3+stgjvrOQclyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wY6YKla/dHAXnyU+dn+wxF3lCY/Cy3eeAB5KUMlwTk4=;
 b=n+cvvCVbtytoxoGXpNb7snNatFGs8bi8/7rVS1Mzi5TSpaWC0tHlquLxk3veC3EgdMo6/VWdQ2ll/VWQIjEGVvpzcuDH3B710CcBnrSW+MS7iF+lqBOnT2qWoUjiHUNJGcIOzto3Fu69rSFdas3YMW8MVpjA1PvXh/uAleLqE864SlhRQxj5RHraaM5uKX1SXLmH5hlm2cETRvvwOrltTogP4hj2WCZMM65jpveNriM0VnsRQ2XUOniBsRUUaWy0YS/jUCypV6VFNVUXr7jl56j/Is/GnHmKc+dIi07eu4+xRzLclnL/e474gbsoJu7aUvwocig82yawL87hISYYwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 11:16:26 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 11:16:26 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engines
 under its GT
Thread-Index: AQHZqBZ8zZjSlqkzQ0WwTXAbzbRn16+fy5wAgABHxYA=
Date: Wed, 28 Jun 2023 11:16:25 +0000
Message-ID: <SJ1PR11MB6204EF6B36C83E3B851DDD548124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
 <20230626101648.3480340-2-tejas.upadhyay@intel.com>
 <MW4PR11MB7056C42A9E92C8047321835BB324A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056C42A9E92C8047321835BB324A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB4908:EE_
x-ms-office365-filtering-correlation-id: c79ed2f6-3205-47a5-2738-08db77c91cec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: C3FJMz+YZAobRIPSs8qQmqbPPrw+XGmzrav8xmiG1lyB+veUxkLyurbvT/14mkdw1wdvEqXXYlMaH+H4UqoeXdf0BfMvFyAGmfDy5oqThKw3i9k6C4oM2HDyESQXbKQGEaI+b+ytm4EyPYF66tuBLYAux35JtNt39G82SCXtPpBeB85f9uE4oyS1vJaEKq64p7CinWNE7QIaN+07VPOHDd1UhZn/TAQ0w7UtOsxvhthk5jz9zGlfZ+/rjfHr78wMw3lYadCPsRTF0kL9uNQ3rytOr6wcvrtmft6Mt67OhnaW5+UuBUKgKSHn1OQVbvGe8Uv3OLQ77ljYmnlGRw6m7acdKLiRW3N3EyhSAbW5B9w0v7JIwJRTs4Q4aCXf/awqHQN1J9OzysJvSTqmPOv0syXsbKzc9wfTZTUwWfK+gRtglEM+Nq4C+e4WnYPUidcgP/wG7EkNrD/QL2THq6iCLcyVM25ehSopFmIAGixDCq2uTYkot28vywH3leyHGASHGnT/UKFcuh8Vwym2OSxGlwVrlbo9+6aTB34SEkwWW59U7Fq3cYP6xpGilyPTCSvCCMPJ23d50wAioUcMdP3r1GJWnTEiw/9H/YkK5qn0Ns8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(33656002)(38100700002)(5660300002)(86362001)(41300700001)(66476007)(8936002)(66446008)(8676002)(38070700005)(64756008)(66556008)(316002)(122000001)(66946007)(76116006)(82960400001)(55016003)(478600001)(110136005)(966005)(52536014)(186003)(6506007)(71200400001)(53546011)(9686003)(26005)(7696005)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?icgNWX3wMDNThetI2MOVjLYMYCOTx0/ruyjEpuafPS6PYEXi31bcvf/rBB3e?=
 =?us-ascii?Q?veuwl0pG61txZxXCOpeu7uaVFNVo0+wVEEHv0ocSwMCTSurxTuW2UUTxdkp3?=
 =?us-ascii?Q?og42k13He7DF7FeYyd2JkAIc6QTT9mpqytZh1fz3HqAlIgABQefsTmW1vOfb?=
 =?us-ascii?Q?2i1oxTCvcE1RC3i1I5zO+iwFx0OzHlef4wIplqnKbP3JMuD51tnpz49qcVDN?=
 =?us-ascii?Q?Wx390IkwZvZPif6NnyHdoMOjV1ucitTOKT/1KcgsccM12bABd+zaSs5isExM?=
 =?us-ascii?Q?wft9tHvoAVq+AdKwMCPRcWuFSItEYmFqE3KYAsMA/ct4AnCAFDN3Rmb1GgQZ?=
 =?us-ascii?Q?8q7HMdOKyM/lCBWlNDBjHuQG+Ja6tjW6MUmgWmXrTQLuLjKsxSUd2+8B/fPV?=
 =?us-ascii?Q?PVvF1V2jeavgXRqt3O8SRvDayyMznWSDZ+2Vk9zUVvrIgupN8peMJMHWGfHV?=
 =?us-ascii?Q?yy7cZK4fb8UP9gH05KPTkaTRb1L+RRcWvzxM+/N/FXAkSdfj40cYTDkE23xN?=
 =?us-ascii?Q?AaKhWWPbYhTMrbJ5TZYQQAJ+3tg+y/AeMFK9/Lw45V+JedfSHosmosG4vn1s?=
 =?us-ascii?Q?UIMC+yarGIpUsFvPoDpJKMW73O3+YM35r5qIlAWZ2USoojSWjSfu6hZdnWeh?=
 =?us-ascii?Q?J6SO/uN9SVBXXVatVQcsW/CbcpkOgYIhXGy0JgRR7CtAaFERFxJdFYdMJBPY?=
 =?us-ascii?Q?HH13xOU/17xgK+QgUZz7tbzG5q1BbrKwJoP+i7rcbj3slJX5IMKFV85HgI6B?=
 =?us-ascii?Q?DVNzhIbqKyXHZyJdJQ7NtRPk26spuE7hbv1vEV/zb9OytwyyOUuKa6bXrFTa?=
 =?us-ascii?Q?R0ICKv9iPhDovCDJHUOD8pXqC/pDjtKED7TMLJqjNUKMU40qgyGg75A42u+I?=
 =?us-ascii?Q?boXaSPfb1lYpF77vpDmzfwIgOWRuzcLSc4M7fP4Lcl6qWFswICJqwz1p/lmz?=
 =?us-ascii?Q?uzewju4t/DZLaJwEx3xZlO6Yj2cly9WNOXCXn/juu9bBGUcwk+F7ws9mi0Oc?=
 =?us-ascii?Q?JRTQ0gQszBZXa/5r5iul8BVmd1hWbqKZylgTN0pP+I2tgVXP4F8K0p1Kuo3V?=
 =?us-ascii?Q?gvwOUvjXuNWT1CeIkdIomor4Iy/rfn32c/G7WE6Mu1FCN/uQQNnqH2vETvWO?=
 =?us-ascii?Q?yGoK6OwV38imuBm3RvlcoP4p1PmEuAcn/BLcy06g/P0yV1Y04fCuoS4E+6p6?=
 =?us-ascii?Q?Jkolwmh7RKX3AXg5IUs4Dk6pFRn7Aq6VNpOuGAgZ/54evUWLhu6JOqw0/eL+?=
 =?us-ascii?Q?Pl0tDk5zuI0cOtBnmMVXTXOm0GF0xCQmjdDcHwkwXc6c6iRarLuU4rLR06XQ?=
 =?us-ascii?Q?ij36zjsXDPdinnqYpnHkf41tvCccxbG+2uW1YoKXUXX7lcVqslqBYThJk6T5?=
 =?us-ascii?Q?+4417njI9WAyJnhv899O41GWfIZsCOZpzY72FPtyUzGeL1JhWJ6olP99w6uv?=
 =?us-ascii?Q?he5OH7FqWOaiXDcUd1loTYL/r6QNNUzeWZPygiADIlU6QRh2lp/YP89FUG+z?=
 =?us-ascii?Q?Ot4/HMkUXDQT46/Lke7aWrBKhiTH/mSAfSJzEtztfQmMq7g1GFhoryvGJpFN?=
 =?us-ascii?Q?446wOYpLqtSzLhj77oWE8fb0Q1qkVWNr2b7uchWp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c79ed2f6-3205-47a5-2738-08db77c91cec
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 11:16:25.9806 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rj4JuO7O3c3p83EN1B9NpkdxX8DO7ShU/qNBFAcWdww84/PVz38NBP8wdDXniyqbjdZLVpBVQ7z/3nv0ap5tmBKFip+yQvZm5ED2cqzy34s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engines
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Wednesday, June 28, 2023 12:28 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for engi=
nes
> under its GT
>=20
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Tejas Upadhyay
> > Sent: 26 June 2023 15:47
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH V2 1/6] drm/xe: Add sysfs entries for
> > engines under its GT
> >
> > Add engines sysfs directory under its GT and create sub directory for
> > all engine class (note its not per instance) present on GT.
> >
> > For example,
> > DUT# cat /sys/class/drm/cardX/device/gtN/engines/
> There is series https://patchwork.freedesktop.org/series/118927/ which
> brings in gt* under tile*.
> Please address the sysfs path accordingly.
>=20
> And better to have directory name as engine_classes  instead of engines/
> wherever applicable.

Till series is merged need to address based on gt dir only. As we don't kno=
w which patch will get merge first.=20

Thanks,
Tejas
>=20
> > bcs/ ccs/
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c       |  6 +++
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c | 92
> > ++++++++++++++++++++++++++++++++  drivers/gpu/drm/xe/xe_gt_sysfs.h
> |
> > 3 ++
> >  3 files changed, 101 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index 2458397ce8af..19c7964a064f 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -319,6 +319,12 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  	if (err)
> >  		goto err_force_wake;
> >
> > +	err =3D xe_gt_sysfs_engines(gt);
> > +	if (err)
> > +		drm_warn(&gt_to_xe(gt)->drm,
> > +			 "failed to register engines sysfs directory, err: %d\n",
> > +			 err);
> > +
> >  	err =3D xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> >  	XE_WARN_ON(err);
> >  	xe_device_mem_access_put(gt_to_xe(gt));
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > index c01cc689058c..7528cc723699 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > @@ -22,6 +22,98 @@ static struct kobj_type xe_gt_sysfs_kobj_type =3D {
> >  	.sysfs_ops =3D &kobj_sysfs_ops,
> >  };
> >
> > +static void kobj_xe_engine_release(struct kobject *kobj) {
> > +	kfree(kobj);
> > +}
> > +
> > +static struct kobj_type kobj_xe_engine_type =3D {
> > +	.release =3D kobj_xe_engine_release,
> > +	.sysfs_ops =3D &kobj_sysfs_ops
> > +};
> Make kobj_type struct const.
> > +
> > +static struct kobject *
> > +kobj_xe_engine(struct kobject *parent, char *name) {
> Instead of engine/engine_class seems appropriate.
> > +	struct kobject *kobj;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return NULL;
> > +
> > +	kobject_init(kobj, &kobj_xe_engine_type);
> > +	if (kobject_add(kobj, parent, "%s", name)) {
> > +		kobject_put(kobj);
> > +		return NULL;
> > +	}
> > +
> > +	return kobj;
> > +}
> > +
> > +int xe_gt_sysfs_engines(struct xe_gt *gt) {
> > +	struct xe_hw_engine *hwe;
> > +	enum xe_hw_engine_id id;
> > +	struct kobject *kobj;
> > +	u16 class_mask =3D 0;
> > +	int err =3D 0;
> > +
> > +	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> > +	if (!kobj)
> > +		return -ENOMEM;
> > +
> > +	kobject_init(kobj, &xe_gt_sysfs_kobj_type);
> > +
> > +	err =3D kobject_add(kobj, gt->sysfs, "engines");
> > +	if (err) {
> > +		kobject_put(kobj);
> > +		return err;
> > +	}
> > +
> > +	for_each_hw_engine(hwe, gt, id) {
> > +		char name[MAX_ENGINE_NAME_LEN];
> > +		struct kobject *khwe;
> > +
> > +		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
> > +		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX))
> > +			continue;
> > +
> > +		if ((class_mask & hwe->class) =3D=3D hwe->class)
> > +			continue;
> > +
> > +		class_mask |=3D hwe->class;
> Seems error prone. Once   XE_ENGINE_CLASS_COPY is handled class_mask
> will be 3
> and for  XE_ENGINE_CLASS_VIDEO_DECODE  and
> XE_ENGINE_CLASS_VIDEO_ENHANCE if ((class_mask & hwe->class) =3D=3D hwe-
> >class)
> 		continue;
> will skip sysfs creation.
> > +
> > +		switch (hwe->class) {
> > +		case XE_ENGINE_CLASS_RENDER:
> > +			strcpy(name, "rcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_DECODE:
> > +			strcpy(name, "vcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_VIDEO_ENHANCE:
> > +			strcpy(name, "vecs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COPY:
> > +			strcpy(name, "bcs");
> > +			break;
> > +		case XE_ENGINE_CLASS_COMPUTE:
> > +			strcpy(name, "ccs");
> > +			break;
> > +		default:
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +
> > +		khwe =3D kobj_xe_engine(kobj, name);
> > +		if (!khwe) {
> > +			kobject_put(kobj);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return err;
> > +}
> > +
> >  static void gt_sysfs_fini(struct drm_device *drm, void *arg)  {
> >  	struct xe_gt *gt =3D arg;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > index ecbfcc5c7d42..a531aebd10d6 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > @@ -8,7 +8,10 @@
> >
> >  #include "xe_gt_sysfs_types.h"
> >
> > +#define MAX_ENGINE_NAME_LEN	16
> > +
> >  int xe_gt_sysfs_init(struct xe_gt *gt);
> > +int xe_gt_sysfs_engines(struct xe_gt *gt);
> >
> >  static inline struct xe_gt *
> >  kobj_to_gt(struct kobject *kobj)
> > --
> > 2.25.1

