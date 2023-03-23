Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D548C6FD1C
	for <intel-xe@archiver.kernel.org>; Thu, 23 Mar 2023 23:09:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AF3410E02C;
	Thu, 23 Mar 2023 23:09:07 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038B910E02C
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Mar 2023 23:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1679612945; x=1711148945;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CbHrqNejDWS+64lnhumDl5oYlpGfmc4ZJ+NLZxb2wbI=;
 b=MG1hsGiuLX3/ceJYdpiGMynACyFR/XIfD/ASFtJYCkVne8swNJeDW75H
 XdmQtfokU/SdVkzOzZ1nUk7CbKZoKmuYxM0BlR6JKHgekF7rw6o02TWTB
 SpUel1GX6hJ0Y/CneuN6+CX9auTwnSAGBOQAoCh6oqzwgQlyUss3PGjal
 YdAHZkGSXtDJ+vayHTMs0Yvv89ln0UL9KFaQgJcXVGpbPro3jiX76jmBT
 7iIJhiQgRwKZ9LYbFiU4B7C7nnslGmi7AvBC9a0aDlfaNpTrBYmKbJRgw
 QZooKJWnyNO7kZXZcx3AGs8PqRmG8M/I37W6EGN2mIGSeqH+yeQNOCH+l Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="367388331"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="367388331"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2023 16:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="684937370"
X-IronPort-AV: E=Sophos;i="5.98,286,1673942400"; d="scan'208";a="684937370"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga007.fm.intel.com with ESMTP; 23 Mar 2023 16:09:02 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 23 Mar 2023 16:09:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 23 Mar 2023 16:09:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 23 Mar 2023 16:09:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0AjUT7xGmW7GjlLz4FV9F9YxgzfiTL5OXME9hVM3j5RZT/8/mH6s/EMJC0vWecZzdJ+Vsjju09RsfR5hpHzOzysXbxu0RdY2rYuU9oDWXzVzF07wAGjfORo4bkE3WSm1tkTPeS1G+cc714U85zFcIBAYfENUjnU9EaWoCWqymwWsPVj2SvR/8hH1dn/3sVP+ZsImjeFkIEN0UIMiSJixbeCI+qQJSy6lYPpN/C8ngZCZxUXx7ejqVN0BLZn2d38+RJN2h/38asKYmcgLwib24h5c7ThH9DJ0mW/wxaloZMWqJBezj+0Q0GZszbFEjXmDRdkz99H5rGAYciBnZjCqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IuShIJbefMNAOhox2kVaUanRUKGbQwQND9jPLaCDI38=;
 b=mD1YTs23w+bqUSpvyTRXM3QktK4TInY88JM5A0qq0hXRPTAouR/dL9I081rXLb/CLa2b94edWQ9hwUMeeWxi11XngVWlSLjK4AFnlbkX6OVwMa/OPyEUAaUnKtit42lHMD/PTSZgO1+DignNcUx5QJMJZNTpko+7wKZJsR82vq9wfgDJlhlieQfLoLD5tSxcB0ctc1lyQggx8rpO72rvhi9BnJJ6UuNnMMix2dteL+4VZYze6Da2pD3iBwuMSj3I8lTNcq+UCZ1IB9Vkmyz4hKF7VYoTaRBrZtaYqXfaMgJK+bQ2fcFwhoeDAbVPCvY7uWXhC+t5QGohA/QeaBF3Kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 by DS7PR11MB6125.namprd11.prod.outlook.com (2603:10b6:8:9f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38; Thu, 23 Mar
 2023 23:08:59 +0000
Received: from PH8PR11MB6950.namprd11.prod.outlook.com
 ([fe80::1d0f:2d98:2be2:77]) by PH8PR11MB6950.namprd11.prod.outlook.com
 ([fe80::1d0f:2d98:2be2:77%8]) with mapi id 15.20.6178.038; Thu, 23 Mar 2023
 23:08:59 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
 if guc failed to init
Thread-Index: AQHZXdpJTAsK2/AuE0m/FE6dTpuzua8I+4Kg
Date: Thu, 23 Mar 2023 23:08:58 +0000
Message-ID: <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6950:EE_|DS7PR11MB6125:EE_
x-ms-office365-filtering-correlation-id: 5b2dc344-510d-41ee-8a8b-08db2bf39589
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0xOL/FRASm6YmYcILqZjlklEOr2vcOobVE7U2ieYRC1NeKu1b+z+M9Cqh0tWzPjHrim0vCu3s5N6ZCjFF6k50obwVs1tEz98vV9XZY1p1a3vtSWbuLdSQXSfRdjlyiOH1AQnhUL14VqU39PMBOkJanOG7DOkdvRcSvsaNCla7dOtpiudLobv81y8nT3+39OpepHBtvtmLaY9qa7fogwM0qPUDd4G8s1xzl6yveGxy7YNR19/IuNl+qhnm7ch7XgES7sWWNG1FkBMClbXsJMSltey9xDGrKBZGE8Esxol5Rtd7LVlOCjuD6W6YZU4k6pfc9apmKq03gGtF1RCyxe5sXiRtCfZ84OmZ3kDB53nAvdDHkibYVzafsWBFf6CJ3YvWq+B1HD4AdaEj4zGIqxLG44AjJkBOzUWHSu7B2bIk/7wuUvhanaNgX7LR3Jyjj09nluEIa1SVlNAQ5YoF3ighmDbo+xhi8l2dTmwEnms4R/pcLmiKUU075Yn9WPl57rkF+0ImqmEC6JmDNduG/ljMlXFQ3Op+hSsX/yC2jkAKSGk39rOD+WLg0Ct+4GcDrHnujorr+LP/2gh/MfQ24phjuQ2LVq94ffGPrZk+gysvVg53hIfbPmyHZ0ARrB6EL3WetEN0XtcolCm2ZSyfnqvQhqZ3GdvqROPGVv8PiHlO3jMUvDP33SCfBMRP+Sh8qofRq72uhGk0PKouOvP4ABqZw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6950.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(136003)(346002)(366004)(376002)(396003)(39860400002)(451199018)(66556008)(66446008)(8676002)(66476007)(76116006)(64756008)(66946007)(4326008)(6636002)(41300700001)(5660300002)(82960400001)(122000001)(52536014)(6862004)(8936002)(316002)(26005)(53546011)(6506007)(186003)(478600001)(9686003)(83380400001)(71200400001)(7696005)(86362001)(33656002)(55016003)(38100700002)(38070700005)(2906002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6F6GkyG1SHd+KA1TqAAh7mDSbUgRZ2qy6aqYseyXjLMAcKCJlAdFi07xrmuc?=
 =?us-ascii?Q?FpHcTzVAuoygeNh6Lm7KeknNZnkA5zqgGOLKBS432BZW7hUpeNj2isPFJhGG?=
 =?us-ascii?Q?Vs8a2eQr9iyhVKD9QoaMHXMoQ8tm+kUEeG02Srw/Kb09sL10WBKbBmTtcr0A?=
 =?us-ascii?Q?IMM8nefj/nK7caFwwteraaUoaBVbM4j/CaRfDAh0Dv33zZmnVoK295TaXOsc?=
 =?us-ascii?Q?zWgvO6hsoeAUu/E0oksx6NNF7h4oQT3htPNg8d0V0V0pQT0LLN2eSgofH4p1?=
 =?us-ascii?Q?kxBqoyCcOFORfHaVXNXwBU3h/yU2BvvARYZu/x8aY/fIClDT9wFXxnTv2IIg?=
 =?us-ascii?Q?pgNf2rR4yVTbvLK1s4xWcr9GyYT59elqitgbNNhCgW5v3j7yINDuXLrPDixm?=
 =?us-ascii?Q?2D1J73SjWeZ7iEOcbHrb11eZi6PW3dj8rhSocqcDikn0LivUZURm9mGoQyVT?=
 =?us-ascii?Q?OjXETqpdYATl/HIxKCuR8YuFHFScpgi7WD7Vv1YQ0dT7aE0e0oSPwcj2hkVk?=
 =?us-ascii?Q?8iInqtttPMvao/GSCZ2e6RLXLhEB539EquULZ3PX8C5kk7i9ycI/kQQbwTCf?=
 =?us-ascii?Q?Tz1s/UyyL+7VGfBAaZE01jx4AQ2mfpm50WygnQ/nBxSzmzGb1ZAVfUHgNw5G?=
 =?us-ascii?Q?6fnzIqydBEvaK/Zmu/aFtE4F4XPihD9nzvfXFJRpk1o7d3mNURFzp2mgY6LG?=
 =?us-ascii?Q?Ygx21EXyyyRPvEXE6yssLCxV4ZKaUTKsr3rn+vdIR50jPF3J6v6E+DxwUFbU?=
 =?us-ascii?Q?ZcU+bchOOHw5HHWgzjhl3bQcS0vdht/W6f41EuZU+gJQ1+PLTa4kMZ1lyjf1?=
 =?us-ascii?Q?Ql0jmAdczOcjz/1EX8B7L2o8oEO4QHRISZU85w+jL42u3RmgJgngUBwdzfh6?=
 =?us-ascii?Q?rReyR86TjGvGaPxDPR/gcxUP5LZ12qk2oWahSAh4jpmc9bRva8wu51kbDVpY?=
 =?us-ascii?Q?uBnCNPK5YTgk+EXaxEqJN8PU9XiblL/Z1xxOifI8XACnpJK+3XVt6I3MspD4?=
 =?us-ascii?Q?f2NRn7tPeRlEwOCCj5LZtY8QRWLfYeh8oIBUJvRhqW4QBwb9kogU4YUgfYjP?=
 =?us-ascii?Q?JpE1RhztfU5bLKnDx2vVwPl6GUqlmei9VPrEcBcfuoMVhnHrX8Ft2iq+tsOH?=
 =?us-ascii?Q?cfGAfN7xhy0MmJabtYsY9IGVzIcz6yvw1e59/NX4ObNN8CVNdsWOc9nfCFKm?=
 =?us-ascii?Q?i2prM6lhl2NXN0o/HxEP2SITBwcifQJoN1LaPe9G1WZMK5BsJyjBS1L8qYsf?=
 =?us-ascii?Q?sTZ9Ci6O5ejQuHuNJril8tsYdx7SlR6UiH5ZqEdVxTzk8A2mHY3qmOYyoe6q?=
 =?us-ascii?Q?5sSJnDjMDb9yFblNgQ3BCuXUtOyJT4JFYQOHwefltI2hsmfJhXJdZbcOy5Ib?=
 =?us-ascii?Q?Yt5sru+DhRBvHhVpdkDoHYPzP7o7PxTPSNIQ5L/3IjXkBfNEZX9gf8Gp+w2x?=
 =?us-ascii?Q?wVQxxtmYvrWpc2bwWcQBPSW7+2lX2Z3i8SXvKwKSUoYccvJm1XJ18uA4HQII?=
 =?us-ascii?Q?HdkcAT7Q+ypWuRUy54kcGTqlqdPpEqgDfSAp5PTUJfrLfZy5ZzAG8VihIPJT?=
 =?us-ascii?Q?56qSTNGu8YCBF6lYbqxRjqbKRW4gIayO4Ua61hPT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6950.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b2dc344-510d-41ee-8a8b-08db2bf39589
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2023 23:08:58.8611 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F61+rJW+1LdOCsj9oB/iP9CpXjwM1VCXshaUO+xww9Ll6dPbydba86DvQJq1LrbX6gvrgi4Q6VnCEjeCsOfZhCP8ZtaYzNZnXSRxN4qUL3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6125
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist
 mode if guc failed to init
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 23, 2023 3:53 PM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist =
mode
> if guc failed to init
>=20
> On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > In general, this is due to FW load failure, should just report error
> > and fail the probe so that user can easily retry again.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
>=20
> I have not tested this but assuming you did:
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
Yes, I tested on PVC and it used to fall back to execlist mode and constant=
ly=20
print out EXECLIST_STATUS. Now all those are not showing after this change.

There is still other unrelated issues during __pfx_ggtt_fini_noalloc, and n=
eed
to be fixed as below.

[  223.839894] BUG: KASAN: null-ptr-deref in ttm_resource_free+0xe4/0x140 [=
ttm]
[  223.847211] Read of size 8 at addr 0000000000000018 by task systemd-udev=
d/566

[  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted 6.2.0-xe+ #4
[  223.864921] Hardware name: Intel Corporation WilsonCity/WilsonCity, BIOS=
 WLYDCRB1.SYS.0020.P84.2103030140 03/03/2021
[  223.877365] Call Trace:
[  223.881707]  <TASK>
[  223.885658]  dump_stack_lvl+0x5b/0x85
[  223.891200]  print_report+0x499/0x4aa
[  223.896690]  ? ttm_resource_free+0xe4/0x140 [ttm]
[  223.903268]  kasan_report+0x99/0x1a0
[  223.908683]  ? ttm_resource_free+0xe4/0x140 [ttm]
[  223.915210]  ttm_resource_free+0xe4/0x140 [ttm]
[  223.921621]  ttm_bo_release+0x3e5/0x550 [ttm]
[  223.927811]  ? __pfx_ttm_bo_release+0x10/0x10 [ttm]
[  223.934530]  ? ttm_bo_kunmap+0x11f/0x160 [ttm]
[  223.940775]  ? __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]

> > ---
> >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--
> >  drivers/gpu/drm/xe/xe_uc.c | 3 ---
> >  2 files changed, 2 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> > index daa433d0f2f5..8a436c95591e 100644
> > --- a/drivers/gpu/drm/xe/xe_gt.c
> > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt)
> >  			goto err_force_wake;
> >  	}
> >
> > -	/* Allow driver to load if uC init fails (likely missing firmware) */
> >  	err =3D xe_uc_init(&gt->uc);
> > -	XE_WARN_ON(err);
> > +	if (err)
> > +		goto err_force_wake;
> >
> >  	err =3D xe_uc_init_hwconfig(&gt->uc);
> >  	if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> > index 4ccf2b3435e1..70eabf567156 100644
> > --- a/drivers/gpu/drm/xe/xe_uc.c
> > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> >  	return 0;
> >
> >  err:
> > -	/* If any uC firmwares not found, fall back to execlists */
> > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > -
> >  	return ret;
> >  }
> >
> > --
> > 2.25.1
> >
