Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C453EB64DA
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jun 2023 11:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E213C10E0ED;
	Wed, 28 Jun 2023 11:13:15 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E8DC10E0ED
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jun 2023 11:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687950793; x=1719486793;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Pj7Zj+vxxH4MsgeeLOiCuNiStTf8mchCEBAGY3VetM8=;
 b=cllexNO6z/9TZMivcZSs+HAHceBppGRMX2/HvK7zppwrVJjnvM+8FA9G
 BhQqYV+NEMhb4LFWKzYE6XHzRfDH8UQlzrmj+WkRy+Oyyv3w6LILj6/O7
 McTJ8J8dWZTzObBqFV3DgHrywPUJBpPvVcobdUF4dZ5ATG2Zxgc2pFQbS
 nsog2kIpexXTxkkVZ/9H7ZPhMnXE3IpN9IoWBjsEztHY6+0mXtD94Ll1+
 aV7fxsIWQYXfozTP3/lV4tBHGApY2mRg7xjQ0RVOAwW1LBB+IzQL2JSEf
 G3OyUshxpKrANGW4Kq3oeKk3v4Bf1MU1sbJ3Rkxk+rS2Z+OiwSrFAtTsx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="359311328"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="359311328"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2023 04:13:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10754"; a="787004763"
X-IronPort-AV: E=Sophos;i="6.01,165,1684825200"; d="scan'208";a="787004763"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 28 Jun 2023 04:13:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 04:13:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 28 Jun 2023 04:13:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 28 Jun 2023 04:13:10 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.42) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 28 Jun 2023 04:13:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fb3ukDmWORYNG/DwrBj/6j//qUKTGLfvAmQbSjCN7GYnrEf0L5XLQLwtN9hF7g5eNyaOt8Hp2I2Ml/eaTa4fxmqnJLWqYZ/4ioH9rDNKyuJre0UCw68jNoze/nHAuM6hS7QuG44PbG1C0SBe/A83+m663HljhgSQzKqN1oZgYGNuiumdnra4K+TkZd3OOxru/CkoY4wNjcFhIBXNWe5ope9WDG5BfKRvy+Gc4kfIBNS7lSY0teu2UlXMR8DQqdBD8sulebbeRvweB6kGkWu7eONCCPVhCE09Dh5N2A5tG0efhKa3d4nFkIjYAkGd7GfF8a0cPnHoSWoCDutA2Hz0fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=we4Xl9zdVAPQwxNm411I9uuDo4whCePi6H5FLWPfNcE=;
 b=Vam14/od+31ZEK5Iu5boJxHny/4EM1M3pze+zomn5o2wFQ6bK62/pI3vckhLg2eqJdyClokITYhnqmRH3iD1GdBi53x8V0OMMki779cTJOExQoX945vbRAn0CPwUfTDufxIpSdNT5Pee6TKdpDTkGv6JtiRROxmLD6ZhP22Rbop084JT74+wIdl945S34Fk91fyYkzx8P7ZD1+bSGaFPbtgGU1m0WYW/u3cCAofPrnxDyt6YSsueiVJEJaU3BB2SI6ee/qe5WWgZ5hS9T4S6Q3b9KXA1ipfeihzPAdEPV0o2xUdEO49ecfWZ+sAZXhp63iilJ+iDZoy8stjYIZnvJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB4908.namprd11.prod.outlook.com (2603:10b6:806:112::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 11:13:08 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::2bfb:7d63:f348:1a4%5]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 11:13:08 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Thread-Topic: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
Thread-Index: AQHZqBZ+x/PUBE+RIUyU0p84eoQabK+f3e+AgAA0hvA=
Date: Wed, 28 Jun 2023 11:13:07 +0000
Message-ID: <SJ1PR11MB62045422AFE55ACB52AD42B88124A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230626101648.3480340-1-tejas.upadhyay@intel.com>
 <20230626101648.3480340-3-tejas.upadhyay@intel.com>
 <MW4PR11MB7056A00067B1C823BC026482B324A@MW4PR11MB7056.namprd11.prod.outlook.com>
In-Reply-To: <MW4PR11MB7056A00067B1C823BC026482B324A@MW4PR11MB7056.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB4908:EE_
x-ms-office365-filtering-correlation-id: 12a2dce7-0ab4-4fca-1b95-08db77c8a6ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5irIv8jrc9GeeoYgi6AVxq4DrW+uAXUfQIWMWKqbvNXJmUuahgZB1u8C9g8D0yjVG8UedkluxjW1wXBQ82E8g07xl82zC1/DwcjKSB9b8v1JJvKjwqYYcu7/I45WBSJKWtgO62zu7avki8n39NyNMxbV3tbObVDUqYArioMOF11Suix5oRbvKpi41/cQ2lLl3v/iWV3fsw4+i5hL/wV16bGsULqvx0Sjb9/yfei83/wGUWgY9sIkC8NLjX06P+Hr4LtdHRCL6CeXgCG6cxb0v7P7AEnU3QL/jQ8mTqWmxtxt94aI9GpQbZvM0e7yssiR8z/X6Q9mIOpRIkpHB0dDKTZQztPzzgJdET/NXyvwOF4BH28fkf6Qdw4wfC9daUO2pLub+ZUt1R62fpUA0X07Hwsz9wM2M68fv7HAnPmZP8LR3uWXiHjvi0F33IDsEWO3zYIAfMQs05VvLPXcTmmLQqhF8yl1rBGqpkhFp5Rd1oQWKZZbuqhdoZ5iPyQSKil5OR2ZBoQ0Ow/NGSqe/JzVcjFmUxnhrOa9abUhN543n7a0xR/fqxe7a/6vuUyp9xNtd1rMz2nz0wu9HsFTiWDd/TECVFBmNfyyri1TrXYpUzi/pZmV6ki/vmxj0ADeS0FS
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(66899021)(33656002)(38100700002)(30864003)(5660300002)(86362001)(41300700001)(66476007)(8936002)(66446008)(8676002)(38070700005)(64756008)(66556008)(316002)(122000001)(66946007)(76116006)(82960400001)(55016003)(478600001)(110136005)(52536014)(186003)(6506007)(71200400001)(53546011)(9686003)(26005)(7696005)(2906002)(83380400001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3t61jh7A6xnWmrjKMO6sSv0nA+VH0G078ekzqXHnoNYkq/jPmvsufLW34HlA?=
 =?us-ascii?Q?KCWw5hYsAkaoW631EmT5iRQ5O94Iw80/f1+whmmMFqdPt4LxyILXdEGnH7Qh?=
 =?us-ascii?Q?KtYN2AKlot2zc8DcLnZgHTHYKpPfOCZEMipEYNgsQcTw/6wQGgpd7vF2tRGK?=
 =?us-ascii?Q?nPotFAK41jFMq4SeHMhYAn53ch6ZdFvfEWSj3mHECB1I8J2/Ye7aozICwrbZ?=
 =?us-ascii?Q?/Dp1jm/mWUBsJGBu3VWXbun8EdEY2wlXx/73ucJU63kBCdyCJ3JfjxfPruP+?=
 =?us-ascii?Q?AUQL1daxmULmB9aQvnMpnwTLrPNfuabuSvT8lFFr6oyd9IRTVLP8DyiB+FNL?=
 =?us-ascii?Q?fj9/v5yrZa4I1wxKzeRYo3aac/hZahTifTE6Fs8uvcC/Vu9hRCHbLCG1iuX+?=
 =?us-ascii?Q?Y3U23bEkkKZHzU9gOYR4fkHqzAq47/of6TxOPWkERW/PJF08z1bRo1OPK+zx?=
 =?us-ascii?Q?8EwuWkd91c/HZJHFtyMMtfll+WtRsWaAo7Ze8Mh/A1ZJK7cfiCmxBCcE5CTA?=
 =?us-ascii?Q?5SCwpb4OG0/kqjwN5UDwAcVQxeLA2dRqIbu1M82rnsvlZ4y889aVb2p2Smrt?=
 =?us-ascii?Q?C+NBYu7lAACwCXHromfJ+evP6Iu+6/TbL0E2Vt05vmV4swoikXxCdueAJ79L?=
 =?us-ascii?Q?wSf7xGN1KbyX8INhHx9GOzAWSvz25XotlBRzh08oQ6xgPH1RH2L0fvtzc298?=
 =?us-ascii?Q?hBhcnllS8zoO0PTUScEdNSAwLxwAiAgdOWG7SSGklp3HvZs6hSQKpMWSaq74?=
 =?us-ascii?Q?iw+FWQe1bm7I4ziQVl3K56n+3IXsFqiN3GaVTosz3b+i9p+Ntt3IQHOSF193?=
 =?us-ascii?Q?BTkSxaH7H9bW/R5kfZytaO9V2+5KX4AJtuYEvL/fZvcH+RhyDDdtkEBn6WdS?=
 =?us-ascii?Q?FZnssouCxj4lyruZcz8T+zqYKZiGZk9z5Ezz1oOqCGhrRUTSdjOOw0CLXWds?=
 =?us-ascii?Q?biYpWFSTrZAEbnXG+0aAYUL/sFZudACFi9AbOqHqxOg1zJucHtJz8irSeyM1?=
 =?us-ascii?Q?T5sfbD/ECJtxpdxbRCYUsPr+w5YNpKIPY3oWVE1fenX+DFiCb2QY8bqCt8nn?=
 =?us-ascii?Q?VxS6VbctMzFHidw3vVQHeBPgGnewsHC2qweikaILf5ynn3o585uuYvNLMsU3?=
 =?us-ascii?Q?uqcsxzIdS2fhTv+xPS2xa8V3bUYQ3r1S5WBT5ti+ieA+RuHDOcgMpzsd/foL?=
 =?us-ascii?Q?8noxaZ9JV8egYt6FvggxIWDfERrPldD8v6TVMnZsrte2KWlsgWGr2jaz+XrN?=
 =?us-ascii?Q?GzOa8cMIY8O/wRKoP/gO+XAzz8p6G0OfuNqagKAJct9IOYWllCcIOKpBRvvo?=
 =?us-ascii?Q?QVrxqYCzhthNCEjR4I+tmTfZRKp1sMCvS8NQ2nOWnOPOWLQ8so9F/zpWWu42?=
 =?us-ascii?Q?U/LQOB0tNMhSkPX7tdz6jlaoSY+XerITLjPCRdvK844JaySGFie5tMO08Hzj?=
 =?us-ascii?Q?yBafFhwaGDmMZS8pewxA7GUfI9DmlE8NLRHAFIy01lDlS3YVjthEOhNZGVuw?=
 =?us-ascii?Q?8uCzV3tFey37TJfh4xmTAUIdz5guvCjcvdjgNXa6zRLG6HfPRGcq9TEivRSC?=
 =?us-ascii?Q?DVwf1IkFB0wQT7NMHk0bV2D+/BSHaF0s+4fk3FCl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12a2dce7-0ab4-4fca-1b95-08db77c8a6ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2023 11:13:07.6380 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cQ8RShfqpPU7T25mY2QUPYwaxXALZWoLVPezT1TaUs7PWnTQ6kwI8VvRJpAtQ5xoXcohjhibmp5s3hhBaJ30d8OCe2ShiPXdcmYUW+tz3a0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4908
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engine
 scheduler properties
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
> Sent: Wednesday, June 28, 2023 1:34 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>; intel-
> xe@lists.freedesktop.org
> Subject: RE: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default engi=
ne
> scheduler properties
>=20
> Hi Tejas,
>=20
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Tejas Upadhyay
> > Sent: 26 June 2023 15:47
> > To: intel-xe@lists.freedesktop.org
> > Subject: [Intel-xe] [PATCH V2 2/6] drm/xe: Add sysfs for default
> > engine scheduler properties
> >
> > For each HW engine under GT we are adding defaults sysfs entry to list
> > all engine scheduler properties and its default values. So that it
> > will be easier for user to fetch default values of these properties any=
time to
> go back to default.
> >
> > For example,
> > DUT# cat /sys/class/drm/card1/device/gt0/engines/bcs/.defaults/
> > job_timeout_ms         preempt_timeout_us     timeslice_duration_us
> >
> > where,
> > @job_timeout_ms: The time after which a job is removed from the
> > scheduler.
> > @preempt_timeout_us: How long to wait (in microseconds) for a
> > preemption
> >                      event to occur when submitting a new context.
> > @timeslice_duration_us: Each context is scheduled for execution for the
> >                         timeslice duration, before switching to the nex=
t
> >                         context.
> >
> > V2 :
> >    - Use sysfs_create_files in this patch - Niranjana
> >    - Handle prototype error for xe_add_engine_defaults - CI hooks
> >    - Remove unused member sysfs_hwe - Niranjana
> >
> > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_engine.c          |  4 +-
> >  drivers/gpu/drm/xe/xe_gt_sysfs.c        | 93 +++++++++++++++++++++++--
> >  drivers/gpu/drm/xe/xe_gt_sysfs.h        |  5 ++
> >  drivers/gpu/drm/xe/xe_gt_sysfs_types.h  | 13 ++++
> >  drivers/gpu/drm/xe/xe_guc_submit.c      |  5 +-
> >  drivers/gpu/drm/xe/xe_hw_engine.c       |  5 ++
> >  drivers/gpu/drm/xe/xe_hw_engine_types.h |  9 +++
> >  7 files changed, 125 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_engine.c
> > b/drivers/gpu/drm/xe/xe_engine.c index 6e6b2913f766..33d1fbae560d
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_engine.c
> > @@ -54,8 +54,8 @@ static struct xe_engine *__xe_engine_create(struct
> > xe_device *xe,
> >  	INIT_LIST_HEAD(&e->multi_gt_link);
> >
> >  	/* FIXME: Wire up to configurable default value */
> > -	e->sched_props.timeslice_us =3D 1 * 1000;
> > -	e->sched_props.preempt_timeout_us =3D 640 * 1000;
> > +	e->sched_props.timeslice_us =3D hwe->sched_props.timeslice_us;
> > +	e->sched_props.preempt_timeout_us =3D
> > +hwe->sched_props.preempt_timeout_us;
> >
> >  	if (xe_engine_is_parallel(e)) {
> >  		e->parallel.composite_fence_ctx =3D
> > dma_fence_context_alloc(1); diff --git
> > a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > index 7528cc723699..43be5efc1865 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> > @@ -12,6 +12,8 @@
> >
> >  #include "xe_gt.h"
> >
> IMO all these implementation should go to separate file for example
> something like xe_engine_class_sysfs.c. It will be more cleaner.

Thanks for opinion, but as engines are part of GT it should be ok to put in=
 GT sysfs file.

Thanks,
Tejas
>=20
> > +int xe_add_engine_defaults(struct kobject *parent);
> > +
> >  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)  {
> >  	kfree(kobj);
> > @@ -32,22 +34,91 @@ static struct kobj_type kobj_xe_engine_type =3D {
> >  	.sysfs_ops =3D &kobj_sysfs_ops
> >  };
> >
> > -static struct kobject *
> > -kobj_xe_engine(struct kobject *parent, char *name)
> > +static ssize_t job_timeout_default(struct kobject *kobj,
> > +				   struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.job_timeout_ms); }
> > +
> > +static struct kobj_attribute job_timeout_def =3D __ATTR(job_timeout_ms=
,
> > +0444, job_timeout_default, NULL);
> > +
> > +static ssize_t timeslice_default(struct kobject *kobj,
> > +				 struct kobj_attribute *attr, char *buf) {
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.timeslice_us); }
> > +
> > +static struct kobj_attribute timeslice_duration_def =3D
> > +__ATTR(timeslice_duration_us, 0444, timeslice_default, NULL);
> > +
> > +static ssize_t preempt_timeout_default(struct kobject *kobj,
> > +				       struct kobj_attribute *attr,
> > +				       char *buf)
> > +{
> > +	struct xe_hw_engine *hwe =3D kobj_to_hwe(kobj->parent);
> > +
> > +	return sprintf(buf, "%u\n", hwe->defaults.preempt_timeout_us);
> > +}
> > +
> > +static struct kobj_attribute preempt_timeout_def =3D
> > +__ATTR(preempt_timeout_us, 0444, preempt_timeout_default, NULL);
> > +
> > +static const struct attribute *defaults[] =3D {
> > +	&job_timeout_def.attr,
> > +	&timeslice_duration_def.attr,
> > +	&preempt_timeout_def.attr,
> > +	NULL
> > +};
> > +
> > +int xe_add_engine_defaults(struct kobject *parent)
> >  {
> >  	struct kobject *kobj;
> > +	int err =3D 0;
> >
> >  	kobj =3D kzalloc(sizeof(*kobj), GFP_KERNEL);
> >  	if (!kobj)
> > -		return NULL;
> > +		return -ENOMEM;
> >
> >  	kobject_init(kobj, &kobj_xe_engine_type);
> > -	if (kobject_add(kobj, parent, "%s", name)) {
> > +
> > +	err =3D kobject_add(kobj, parent, "%s", ".defaults");
> > +	if (err)
> > +		goto err_object;
> > +
> > +	err =3D sysfs_create_files(kobj, defaults);
> > +	if (err)
> > +		goto err_object;
> > +
> > +	if (0) {
> > +err_object:
> >  		kobject_put(kobj);
> > +		return err;
> > +	}
> > +
> > +	return err;
> > +}
> > +
> > +static struct kobj_hwe *
> > +kobj_xe_engine(struct kobject *parent, char *name) {
> > +	struct kobj_hwe *khwe;
> > +
> > +	khwe =3D kzalloc(sizeof(*khwe), GFP_KERNEL);
> > +	if (!khwe)
> > +		return NULL;
> return -ENOMEM here too.
> > +
> > +	kobject_init(&khwe->base, &kobj_xe_engine_type);
> > +	if (kobject_add(&khwe->base, parent, "%s", name)) {
> > +		kobject_put(&khwe->base);
> >  		return NULL;
> >  	}
> >
> > -	return kobj;
> > +	return khwe;
> >  }
> >
> >  int xe_gt_sysfs_engines(struct xe_gt *gt) @@ -72,7 +143,7 @@ int
> > xe_gt_sysfs_engines(struct xe_gt *gt)
> >
> >  	for_each_hw_engine(hwe, gt, id) {
> >  		char name[MAX_ENGINE_NAME_LEN];
> > -		struct kobject *khwe;
> > +		struct kobj_hwe *khwe;
> >
> >  		if ((hwe->class =3D=3D XE_ENGINE_CLASS_OTHER) ||
> >  		    (hwe->class =3D=3D XE_ENGINE_CLASS_MAX)) @@ -109,6
> > +180,16 @@ int xe_gt_sysfs_engines(struct xe_gt *gt)
> >  			kobject_put(kobj);
> >  			return -EINVAL;
> >  		}
> > +
> > +		khwe->hwe =3D hwe;
> > +		err =3D xe_add_engine_defaults(&khwe->base);
> > +		if (err) {
> > +			kobject_put(kobj);
> > +			drm_warn(&gt_to_xe(gt)->drm,
> > +				 "Warning: adding .defaults to engines
> > failed!, err: %d\n",
> > +				 err);
> > +			return err;
> > +		}
> >  	}
> >
> >  	return err;
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > index a531aebd10d6..a539cf031c7d 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.h
> > @@ -19,4 +19,9 @@ kobj_to_gt(struct kobject *kobj)
> >  	return container_of(kobj, struct kobj_gt, base)->gt;  }
> >
> > +static inline struct xe_hw_engine *kobj_to_hwe(struct kobject *kobj) {
> > +	return container_of(kobj, struct kobj_hwe, base)->hwe; }
> > +
> >  #endif /* _XE_GT_SYSFS_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> > b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> > index d3bc6b83360f..d0a5eae1bbb4 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> > +++ b/drivers/gpu/drm/xe/xe_gt_sysfs_types.h
> > @@ -23,4 +23,17 @@ struct kobj_gt {
> >  	struct xe_gt *gt;
> >  };
> >
> > +/**
> > + * struct kobj_hwe - A hwe's kobject struct that connects the kobject
> > +and the
> > + * hwe.
> > + *
> > + * When dealing with multiple hwe, this struct helps to understand
> > +which hwe
> > + * needs to be addressed on a given sysfs call.
> > + */
> > +struct kobj_hwe {
> > +	/** @base: The actual kobject */
> > +	struct kobject base;
> > +	/** @hwe: A pointer to the hwe itself */
> > +	struct xe_hw_engine *hwe;
> > +};
> >  #endif	/* _XE_GT_SYSFS_TYPES_H_ */
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index 86c445903560..ecea38e9e639 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -1128,7 +1128,8 @@ static int guc_engine_init(struct xe_engine *e)
> >  	ge->engine =3D e;
> >  	init_waitqueue_head(&ge->suspend_wait);
> >
> > -	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> > MAX_SCHEDULE_TIMEOUT : HZ * 5;
> > +	timeout =3D xe_vm_no_dma_fences(e->vm) ?
> > MAX_SCHEDULE_TIMEOUT :
> > +		  e->hwe->sched_props.job_timeout_ms;
> >  	err =3D drm_sched_init(&ge->sched, &drm_sched_ops, NULL,
> >  			     e->lrc[0].ring.size / MAX_JOB_SIZE_BYTES,
> >  			     64, timeout, guc_to_gt(guc)->ordered_wq, NULL,
> @@ -1136,6
> > +1137,8 @@ static int guc_engine_init(struct xe_engine *e)
> >  			     gt_to_xe(e->gt)->drm.dev);
> >  	if (err)
> >  		goto err_free;
> > +	/* Record timeout value, in order to show current set timeout */
> > +	e->hwe->sched_props.job_timeout_ms =3D timeout;
> >
> >  	sched =3D &ge->sched;
> >  	err =3D drm_sched_entity_init(&ge->entity,
> > DRM_SCHED_PRIORITY_NORMAL, diff --git
> > a/drivers/gpu/drm/xe/xe_hw_engine.c
> > b/drivers/gpu/drm/xe/xe_hw_engine.c
> > index b7b02c96e998..bd94155a28b3 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> > @@ -361,6 +361,11 @@ static void hw_engine_init_early(struct xe_gt
> > *gt, struct xe_hw_engine *hwe,
> >  	hwe->name =3D info->name;
> >  	hwe->fence_irq =3D &gt->fence_irq[info->class];
> >  	hwe->engine_id =3D id;
> > +	/* FIXME: Wire up to configurable default value */
> > +	hwe->sched_props.job_timeout_ms =3D HZ * 5;
> > +	hwe->sched_props.timeslice_us =3D 1 * 1000;
> > +	hwe->sched_props.preempt_timeout_us =3D 640 * 1000;
> > +	hwe->defaults =3D hwe->sched_props; /* Record default props */
> >
> >  	xe_reg_sr_init(&hwe->reg_sr, hwe->name, gt_to_xe(gt));
> >  	xe_wa_process_engine(hwe);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > index d788e67312b9..7a8d275df6db 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_types.h
> > @@ -107,6 +107,15 @@ struct xe_hw_engine {
> >  	void (*irq_handler)(struct xe_hw_engine *, u16);
> >  	/** @engine_id: id  for this hw engine */
> >  	enum xe_hw_engine_id engine_id;
> > +	/** @sched_props: scheduling properties */
> > +	struct {
> > +		/** @set_job_timeout: Set job timeout in ms for engine */
> > +		u32 job_timeout_ms;
> > +		/** @timeslice_us: timeslice period in micro-seconds */
> > +		u32 timeslice_us;
> > +		/** @preempt_timeout_us: preemption timeout in micro-
> > seconds */
> > +		u32 preempt_timeout_us;
> > +	} sched_props, defaults;
> >  };
> >
> >  /**
> > --
> > 2.25.1

