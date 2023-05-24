Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C96C77B73
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 06:19:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CBEE10E03A;
	Wed, 24 May 2023 06:19:01 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A34110E03A
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 06:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684909140; x=1716445140;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lyQ+CGQU5Hn48grWjT3WFV3WD3zboKsfbpZf8GtEgG4=;
 b=aF0I3Q780cgIWJKBVJiLX7XRr3GtaCUq+56XPoqlUw4THLRcDIR0dMqr
 9qOWJaG/sVUMYvaOSoYnhp98vAaUYNzhqk0ENwl9n6iod3Fi3R6KqDWMB
 ScAQGz/dfcQ03ScB6rFjqDjTeDvla6W7BYG3zNF6YW9cw2k5vUGzT2xG5
 8k0sHPUDF+ZAy8qXeDw59/djXUvm/4U4Y5XGcSWxCikRl7jQBi5fKrw4Y
 yijbw2tuiAyneDWQBVexAY8qmcLXhjDm9ctlIyPc6LqYCka3N7gZPL8TU
 yGJNcde2eoHOqOp5qXXKFMnZyrNXpJMd00s8dle0GNXZJYSLFivOvtTRl g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="356695483"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="356695483"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2023 23:18:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10719"; a="704212972"
X-IronPort-AV: E=Sophos;i="6.00,188,1681196400"; d="scan'208";a="704212972"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga002.jf.intel.com with ESMTP; 23 May 2023 23:18:57 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 23:18:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 23 May 2023 23:18:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 23 May 2023 23:18:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.102)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 23 May 2023 23:18:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=He3gyBJ4lBtZh24pcvR/gPpSCzpq9sAAoQdZGnk3Suy6rmhwkRQhDkAZplfyfPCqv+HaPaXljmjou15VLoi/AQMfO6Z9ZnAeZjBfmotD7Crvil4Qqme/ROZ6H20+s0Paib5dddqMZE4Tpyd5qz+hDunxUjBLyfwQPuV/SU5BcLugZ1zehlu72+1UpiD1h3imdwMYi0c0wswPEuceUWrzpdHiwN4JLwUgSqymsAN4MHr45hDxLhw+IIGpf7u2Ad8gwmtcLKwt5Wm35KP3zcOtkHt07FoG5we/n8seogvS61vN2cAc86j/4SUaVa7sp7axekWLGtyjZNpsJ6oClHCDag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiwqUJKr8+v18BBST7FhkneEKGsB+ZblnaWT9KaX9K4=;
 b=U5ed7QMNRqferIeNnaW8QHwV5sFygqG2gWJsWhO2eXlG3c2sWbf2zahEOyQSIUZUlVsX7KoCOT7srCcUvUoOpaPIQIq9spNn6291dZdFUm4//HSWKpJm0BwL0u8pURcfQIjexIrH0MlffO/oPlIVMHrUizcYFdoPAJ5ye3TxXJKvG2K9zYabGDSFn7JfuQDfUhg8cDH9dkApeRLs1gF6Z9t4l5wC2O7ZOOxaxjzwedSB1dVxhRlq5BfJn4KSKTgdl03fdDwd/JfYWdei8xm4bePWk47NzP9QtmUDWP1IfIG3YjgCRfEV7F92IZPEf0EClWm6ncQqF9lISiKI6oinDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 06:18:56 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::875c:90e1:89a3:9c5e%5]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 06:18:56 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@kernel.org>
Thread-Topic: [RFC 1/1] drm/xe: Add a debugfs for faking gt reset failure.
Thread-Index: AQHZjIsLMNHAVB0m9kKXiw6KzeMvsK9mcVIAgAKDpwA=
Date: Wed, 24 May 2023 06:18:55 +0000
Message-ID: <MW4PR11MB7056B424FB55905794317579B3419@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230522085817.1347213-1-himal.prasad.ghimiray@intel.com>
 <ZGuPZP6Wxl52Trts@rdvivi-mobl4>
In-Reply-To: <ZGuPZP6Wxl52Trts@rdvivi-mobl4>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|SA1PR11MB6821:EE_
x-ms-office365-filtering-correlation-id: d0e19025-7511-4d0d-2e74-08db5c1ec0ea
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VB9wyY5jhfyizwf3uSovu6Ojcoy4+yjoP/r3KFLrnckjy83imQZ0JJBGSZ5yoB7Gb5zXja9PK6JnZwON1XHXdUe18r1ya2ZOlEG00dY7FgCSgae4XH/isQSRvKMME1a5c1StSfDpay/QQqZSauAs4tyfoN3cQcl2cjU2Y53Dl8ebb9meaIZl99ifbOIhWBRnv7If7dtjp1iJFZ2DWZFPdCspqkq96hVd8WkKYKyaJLGdCGvlAbNW+icfKMFZ8T08TXX4/al0yyO7d5PV8BXFksj+ZPAo+EfAr1vru5rcpJtfBOrrSY63lnXWpNUpPVtqN5Rg/7CLEFPXput5g8Ktk5C/T0X+BdJ4uP5xdyX1cmv+J+mQcpr7SG8f4vUy1kIptFBqC31eQzF3edVimZGIWJ6k9lqgPzVO2+rTM7AFDaQgPAD5/Vzd1oNh3MOFj7pS2hEIKrjbNlk8ArvHlBPYCzASSYcxnaSJGb7Q2IC8NYVd8bFrxKkPDzq15oBHGBVb2ijyk7Ujq9mhPfvmMlsq9ShhzyJytcBmKu3yZKl/0A1hAU9cIIeCl4ex6objLT95idI4tPOnpz24xl4MXCf49fcQlAh7qzaS15nSaOoK1RxOMczYXovHqlEleeHoTWRn
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199021)(76116006)(82960400001)(478600001)(83380400001)(38070700005)(66556008)(4326008)(6916009)(66446008)(66476007)(66946007)(64756008)(122000001)(54906003)(38100700002)(71200400001)(316002)(7696005)(41300700001)(86362001)(2906002)(5660300002)(55016003)(8936002)(8676002)(26005)(9686003)(53546011)(6506007)(107886003)(33656002)(186003)(52536014);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?0OaMBCqz1LQqf8oUasQnb/CKFB+SWchxfEReZ09OieSq8hZ6gY5jfMd8IPto?=
 =?us-ascii?Q?XNSyaCy626YOqlAFEMjYs3kLyJl9J4u8vMULJ6Nz0Sfizl58iUdWP+z8y8QO?=
 =?us-ascii?Q?aghuOji/mGl0EG5tBHfyuuIKYXj5IT7jRjJSpOI7IQWt0TNkt6y6hQ+1TEaI?=
 =?us-ascii?Q?qygiKu0GSu+yZF/y0yDYsN1js71+lunIzIlcpbwobABLcLXrFHxpRh0CjGpR?=
 =?us-ascii?Q?bq7TlrLWD2kNAGDek5xBfpriS+t2/ZdR72fRMnFlRoQyB6SaNYAGRfUfgVpq?=
 =?us-ascii?Q?E/zqW4Fde0ooE4VbnAkNMZD93q6d/26NMdvVZSUhKZ1DnE+hFD7Ql3M1DygA?=
 =?us-ascii?Q?uKujvn2kjK1qqIgpUBcY2acCYYmhBQvWLAq6zAik760upxsvdG/i+ncb+Fh6?=
 =?us-ascii?Q?vKYEE2gYTOnAnJHaHWx1iL1Xg69HwMfCwkomNigORwpeWXLdhz072dHmTjt0?=
 =?us-ascii?Q?TpiUcU5hS75G0yiwyYyMsExIlzjbxS0VwR4VBFPQBdTXDVgg5rW2Yd3vWb7j?=
 =?us-ascii?Q?9YJ4leVgGnjN7Fd/mnRI8/sgqBsDDo46cP4l/vzHpW7K55bx8e7W44Y2mCQt?=
 =?us-ascii?Q?ri0IGZZ9PKiO2QX9dLni9/5PHIQ2W6il0bQKZfiLZFRdLoQZung6rEGQMNp+?=
 =?us-ascii?Q?sFe+iDva7zZ++i5vSFjO7JYYkImLdx3T0mPOgM7fdw7GCYgCLG3v2aXCVtRZ?=
 =?us-ascii?Q?bB2B8pAZjxOtKYbSfCBC615naafNkjol72YlaFfBxrBroHxAMNGDIvD7W0a7?=
 =?us-ascii?Q?PfR0s7LiNcAUWkWtVSDfqr5QOR4NwDtVkQF2P7fwrhbCU8MPQOFU8+LPpOSs?=
 =?us-ascii?Q?CgUzcwJirkd17Fi31larBOYxBPD40vZv/8+FU8VNDnctv7wvK+xXWSFnKue0?=
 =?us-ascii?Q?86gehCJiqwXkbcSkIgIu7PrKLVkckPb+Ig/jgINEQKf/mNfGl9C76EjLHs+s?=
 =?us-ascii?Q?W1fRT4dQXZ1v84kcREA88xAnCoMRxERcHsPPIERPcZQdkv6KvVqtoOV+pMI9?=
 =?us-ascii?Q?5bY9inCTS3XKJHXROjmqX8HYr/j5fQduLBT0c7tttGqrZrcQRjOfFC4E3J+q?=
 =?us-ascii?Q?d1f/ulxX9hsJMlBv+ULezHIOiCVOJJSTGJVnys5lnie0z5G2LI7Z2iR+LZU1?=
 =?us-ascii?Q?12bUke8pxHibSFW2IdIHEjc3dugujT89m/jq7pg5fBY6bri+wWqeKcgcjyZJ?=
 =?us-ascii?Q?VYvL2bD055ugYsxLNfusUtUUgMbomOIkY2MlAluLICpQAmDUbZf2Snt2n0Mu?=
 =?us-ascii?Q?L6BFBcWAV3U6zSvD+q1NxVb40Q/C+uFeuYdwopyODFtAwjpT2TkxQQn2f91f?=
 =?us-ascii?Q?2ByELlDUY1Z3ZLGOARKAUip5SD880A7nItkacG3Urc8Pty1wYhbOGRlt5u0D?=
 =?us-ascii?Q?FSgQnxOrhTHFdKn6pWUcf4MdS9XwPRrIrjYJ3P75n6UXKN1K+v6QNI2+bgEE?=
 =?us-ascii?Q?yrkA5t9071/xMtVFl2SDZ+6Pa7/IkU8jYeQZEMDCddrfS1WZmHWuof+Noci9?=
 =?us-ascii?Q?iMEb4VHf5IaZz8qosDdFMCememn1xin1vmXXRiqoB+hj4ie5Z5N67u7e8NBp?=
 =?us-ascii?Q?24A0njv5lb6F5Gx5Un1rZE9Qnd6W4Y800KpVbBnAJPEdX2o5OP85RWHNm1Q0?=
 =?us-ascii?Q?sA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0e19025-7511-4d0d-2e74-08db5c1ec0ea
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2023 06:18:55.7954 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xYoEaZDJHwPKVpQh7mofmpj9NrPE80lcKR2D6/8fLeeVxq4qJ6EttJPiasbzI4O0qumFGZrDcQ8BnFMw7qlLZ9fRPWGQjoQN592VydxUsZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC 1/1] drm/xe: Add a debugfs for faking gt reset
 failure.
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



> -----Original Message-----
> From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
> Sent: 22 May 2023 21:21
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Vivi, Rodrigo <rodrigo.vivi@intel.com=
>
> Subject: Re: [RFC 1/1] drm/xe: Add a debugfs for faking gt reset failure.
>=20
> On Mon, May 22, 2023 at 02:28:17PM +0530, Himal Prasad Ghimiray wrote:
> > In case of gt reset failure, KMD notifies userspace about failure via
> > uevent. To validate this notification we need to ensure gt reset fails
> > and there is no mechanism to cause failure from hardware.
> > Hence added a debugfs which will cause fake reset failure.
> >
> > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt.c         | 26 +++++++++++++++++++++++++-
> >  drivers/gpu/drm/xe/xe_gt_debugfs.c | 11 +++++++++++
> >  drivers/gpu/drm/xe/xe_gt_types.h   |  3 +++
> >  3 files changed, 39 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index d98761d9eeba..e05615ca13e5 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -301,6 +301,9 @@ int xe_gt_init_early(struct xe_gt *gt)  {
> >  	int err;
> >
> > +	/* Reset is supported by default */
> > +	gt->reset_enabled =3D true;
> > +
>=20
> I'd prefer to name this variable as something more specific
> fake_reset_failure_in_progress. In order to avoid future abuses or misusa=
ge
> of it.
Sure. Will change it.
>=20
> >  	xe_force_wake_init_gt(gt, gt_to_fw(gt));
> >
> >  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FW_GT); @@ -605,6
> +608,16
> > @@ static void xe_uevent_gt_reset_failure(struct xe_device *xe, u8 id)
> >  	kfree(reset_event[3]);
> >  }
> >
> > +static int reset_disabled(struct xe_gt *gt) {
> > +	return !READ_ONCE(gt->reset_enabled); }
> > +
> > +static void enable_reset(struct xe_gt *gt) {
> > +	WRITE_ONCE(gt->reset_enabled, true); }
>=20
> Why are you using these write/read _once variants?
> Do you need some mutex?
Seems we are already ensuring gt_reset call is dropped if one is already in=
 process.
Will not need mutex. Will make changes in next patch.
>=20
> > +
> >  static int gt_reset(struct xe_gt *gt)  {
> >  	struct xe_device *xe =3D gt_to_xe(gt); @@ -617,8 +630,19 @@ static
> int
> > gt_reset(struct xe_gt *gt)
> >  	drm_info(&xe->drm, "GT reset started\n");
> >
> >  	xe_gt_sanitize(gt);
> > -
> >  	xe_device_mem_access_get(gt_to_xe(gt));
> > +
> > +	err =3D reset_disabled(gt);
> > +	if (err) {
> > +		drm_info(&xe->drm, "GT reset is disabled\n");
> > +
> > +		/*Enable GT reset for next call if disabled
> > +		 * for fake reset failure.
> > +		 */
> > +		enable_reset(gt);
> > +		goto err_msg;
> > +	}
> > +
> >  	err =3D xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> >  	if (err)
> >  		goto err_msg;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > index c45486c2015a..1c3e673c8c60 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> > @@ -127,6 +127,16 @@ static int register_save_restore(struct seq_file *=
m,
> void *data)
> >  	return 0;
> >  }
> >
> > +static int fake_reset_failure(struct seq_file *m, void *data) {
> > +	struct xe_gt *gt =3D node_to_gt(m->private);
> > +
> > +	WRITE_ONCE(gt->reset_enabled, false);
>=20
> or you create functions for everything or you don't create functions for =
any
> of them. But be consistent.

Will address in next patch.=20
>=20
> > +	xe_gt_reset_async(gt);
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct drm_info_list debugfs_list[] =3D {
> >  	{"hw_engines", hw_engines, 0},
> >  	{"force_reset", force_reset, 0},
> > @@ -135,6 +145,7 @@ static const struct drm_info_list debugfs_list[] =
=3D {
> >  	{"steering", steering, 0},
> >  	{"ggtt", ggtt, 0},
> >  	{"register-save-restore", register_save_restore, 0},
> > +	{"fake_reset_failure", fake_reset_failure, 0},
> >  };
> >
> >  void xe_gt_debugfs_register(struct xe_gt *gt) diff --git
> > a/drivers/gpu/drm/xe/xe_gt_types.h
> b/drivers/gpu/drm/xe/xe_gt_types.h
> > index 7c47d67aa8be..7ec19ad0365d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> > @@ -175,6 +175,9 @@ struct xe_gt {
> >  		struct work_struct worker;
> >  	} reset;
> >
> > +	/** @reset_enabled: GT supports reset */
> > +	bool reset_enabled;
> > +
> >  	/** @tlb_invalidation: TLB invalidation state */
> >  	struct {
> >  		/** @seqno: TLB invalidation seqno, protected by CT lock */
> > --
> > 2.25.1
> >
