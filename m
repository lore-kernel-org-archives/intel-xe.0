Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE28C74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 20:00:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB9F10EC05;
	Wed, 29 Mar 2023 20:00:46 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B920F10EC05
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 20:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680120043; x=1711656043;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=D1tYrfgCWI79RRIgFfcjA3lyjDSeR5lLvxnijfBArKE=;
 b=DKEZiBoObKVA4DSYBSCUHsGWgV6Lsjvnpw2GsyHAlsByEXZwgdCzxNgM
 bUmkjZqm6/f5SzCrbw8TDN/dcDj/+vBwM7uttio66Z+9x1LA6Vs7hT3GE
 +lj7JmlgXvib81YXxbq0nr4MiLE7PQK5C9hoHqSH+PmFuDCYK8iPO7Ni6
 EUgPIRrZKn7pH3V/WWTF2dfJKvFqJW/E6hKnXGkCKEfkpadPSMIg3JkkZ
 fAQ4NpI12lfF4j3CP8fJDZ1I5rFyc11HBi1w257GgO8+bIkqEvESzeMz/
 MTPdrrogjmL/YnpLHFuV5tQWH60dtJRV7M7BU74tAJ1bnTM2nhZupHMX2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="320645285"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="320645285"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 13:00:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753733642"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="753733642"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 29 Mar 2023 13:00:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 13:00:42 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 13:00:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 13:00:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K9lB0fsRNp1T3xESttYfN/tco9/gEPdhcG00lsC4CYwf4OmtltdywanY4i8AihkOqf6LdyFNQLBriSRQZZUx53v12U2+oZ+BrfJae8OFu+fM3uCEUjQLNk2JdIxxSMErtGv9EKTZo/miTijrcAn7gvykVy72k85eY95S9M7fzh/kC7WIphPDPQ0rcMd4gqx+qUBYBKXaeoYPROuzPGQ53IdsXqTsxoGGk4fUWbESM7D5tHLJOIlgbict8/Vzkz/mayjH6fgovMp71IJBTJUAzqtLRfJ/bCErGa3xUXrq83qB2zGEuHdcPqit4lh/CFatte4r3aJiDgXJgs/h/haPjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyQeksc7uXo+a8rjr77qsnxGdFMXH4M7Wbn965zgr38=;
 b=OAdF9S2jb73aSJn+zuZjRnPVSaP+OKow3Tt2eSMjRbx7vbTsh692jtbxyoz6t644tSw3yhJ3RGfn0YNq1EDcyxVOnzHx0gpm/tGqxz1UhzuQWU5XQCpFP9odx+HNVSKzz9Sb4OU8QLt8hls3GgXL0UbkOUK79Zc/T4f3VuZ07Few/XE3WqGcR2utCoAn2jPhJ9MBoevF7jccde3/JOJAMNzhJ/1aLpns/883JAjWr0QuW0qXkylwGUE4gwgIk57dt94o7IJp82cs+00NZlwchvdoM2dPEzCyC3uzi/8W+80QRy0wfsPUjM3azaHtZs3rPdqzEmWiJkHPf17VfzUoEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY8PR11MB6940.namprd11.prod.outlook.com (2603:10b6:930:58::17)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Wed, 29 Mar
 2023 20:00:35 +0000
Received: from CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876]) by CY8PR11MB6940.namprd11.prod.outlook.com
 ([fe80::69f8:7f28:f29:2876%8]) with mapi id 15.20.6222.035; Wed, 29 Mar 2023
 20:00:35 +0000
From: "Chang, Yu bruce" <yu.bruce.chang@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Thread-Topic: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist mode
 if guc failed to init
Thread-Index: AQHZXdpJTAsK2/AuE0m/FE6dTpuzua8I+4KggAEgeoCACA1tgIAAAG0A
Date: Wed, 29 Mar 2023 20:00:35 +0000
Message-ID: <CY8PR11MB6940B98AB197C6940808DED4C3899@CY8PR11MB6940.namprd11.prod.outlook.com>
References: <20230323202313.3523-1-yu.bruce.chang@intel.com>
 <ZBzYPLlnwL86qo0d@DUT025-TGLU.fm.intel.com>
 <PH8PR11MB6950295C09940BD29EE7EF52C3879@PH8PR11MB6950.namprd11.prod.outlook.com>
 <ZB3Mn1atvjMFK29G@intel.com> <ZCSN356SJZFVB7w6@intel.com>
In-Reply-To: <ZCSN356SJZFVB7w6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB6940:EE_|BL3PR11MB6338:EE_
x-ms-office365-filtering-correlation-id: 43042321-2ebc-46f0-17a0-08db3090426f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XOqhj+Ys0RcrHTP8HFMMffjk+8pS7jotJjEuD8qxV9v/nxyusxqDUhnDiWLGHyx/PiNiuJN+dasVga+KIDzGJhSXTcKYz2qRoAaDfAd+hqGXbUFEDJllWOyJX+Kr1ZFjMrOEpnkUpIYyDcOyiMYz13czzXU15taVy4YEDVKZhvfTprZioME+Ve9YU8z9x7yGS8hUgk3aAcW5RNMFDwki0tPjKvyFRTmPo/aAyPMW1qUzGcuMogjUv9WZWfp1mYa84zvMGPgE1VceUTZ9mlohISjAk0q8N+l1ywTFHbYkySChwX4igw0HmIj/37ujfu8jCHdYKIJrOj8QfXyMh47Fovm0ajs8mxSMvCsByuH0EvWwB9yn5Miq6f84gQF2WXOnkI9IGkmOFRrEg/IDPDOOB3nTLYQ0AVZo//B75QyupI7IGy1Wk3hbCmRKAD2R8YkdOfr9AalHtVVDsjG8T8x9MbtupY93PV2Mt5BqW5nuW/8mIA4ry5DE/VPJQDhx3jbxZzDKP0qkipiJ5pWx5Sdmz8GHQDMgrsZ4WUvpYOknESnUmSbRfrBfImklUxplqiDCZYkI4D2ekxixVgXrSr/hl4UDep2fBiKLewx7TT1/dNqK3U19VNbAqBPeYRlQFkso
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB6940.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(2906002)(83380400001)(6862004)(5660300002)(8936002)(52536014)(55016003)(38070700005)(33656002)(38100700002)(86362001)(82960400001)(122000001)(9686003)(76116006)(316002)(53546011)(6506007)(66946007)(4326008)(8676002)(64756008)(66446008)(66476007)(26005)(186003)(7696005)(71200400001)(478600001)(41300700001)(6636002)(66556008);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?nmpmMFTYP6LgJ8nsyyrTOj/0o0YvYp+Y6HaBbHwRySzIDIZ5Ta/xosDoKxSi?=
 =?us-ascii?Q?iO6wwpJYP3A4+lFYGope4aSfC2hDe0+zxZvLn12FLo5dun6Lt+QegeleE1Iy?=
 =?us-ascii?Q?oDXjMAXsq5WwUF0at9q9lYLgkJAhEwTiKlKqt6CVWteh1MJi6+02QtbJmiV/?=
 =?us-ascii?Q?wHhYtOq2ws0cdmKAm2RrJRyRRYedQBaGDu7FAO2HYn8ro0bFa+AyIDOWEesN?=
 =?us-ascii?Q?WBb86JAuBMVnQ3tD1FEzaF20nhpDK8RdU9gJRPUO52rFgFJGXeqHOyqyJBWg?=
 =?us-ascii?Q?ImYvzTP2GrdB0aQ9B+hi5nUzw26ZR7Fajhv0xFDRYb2CTppckwdmXV/1si7l?=
 =?us-ascii?Q?tKAzURV7Q0U71DZ3hPU+Bok0ZRYdNuZno7K96OIYindeILRrxMU3YvpRA/aL?=
 =?us-ascii?Q?8BuytgAZTydtvj69FuV3qUEhztDJ/74fRTMr/YZbiCYXFBw+YFNgNbbtidsU?=
 =?us-ascii?Q?maMMvwp51M1ZE+SUwOMhoywbUsawf5lrNXLjLOVtqkedmnja9f4qYUiwOAAk?=
 =?us-ascii?Q?hNA/mb3NstU70wDBgi6PAaNmFRNv0OegFc+4wx6ckPHFmIeKbSKFFPGYHS/I?=
 =?us-ascii?Q?kwK7uj2NFrGBmwGNrj5A4UEkPNileUYStZLuoKUcVUyMo3iiUZnDU8Fbpn/r?=
 =?us-ascii?Q?AYof9COEK/2M0EHK4A8bnYIyEAaPgKiFgdCpdNsCLiauzVw0p109EUvK0yBw?=
 =?us-ascii?Q?ISPIw/Qlrkb5gkxYIQV9EY01+sXEoeMX+9EK4l+O62FpnB1P2oT1SOTjndEA?=
 =?us-ascii?Q?ygquGPEEC/ubSOBiIHlm56K/A8E+10n1UZCM+0Koq9/UAdmSdyPqL+y3Q/BA?=
 =?us-ascii?Q?LkCKYLpy00tUwDCIuol5gTvK0VrIDJqmsUX0XaWuY1mXm/O3/QMJoT7ZsEqX?=
 =?us-ascii?Q?9Ggwf2vSQs6j7GNJ3JaX86tDrH+n2KoqVWcPuvkg3906FvVRLa/BqmEsw4Zg?=
 =?us-ascii?Q?8atCXpYUK1iTMHaY/De3fzx6RrREUcB1fxtqaVeigAAEC9E/MiOUXyL9wLOf?=
 =?us-ascii?Q?uVYyYFE5qAEzLuavscnQI5fZbkl8EMKKkDw29sDWfvqhmDZwfFCrs4P0MK0E?=
 =?us-ascii?Q?9skikbMzui9yMkXs1KOR0clab3vfGuKTWAHUtXrJ1bAElR58/hz9bDZb1eBg?=
 =?us-ascii?Q?fNo16Q5NrEKrAGovKyWoRZtsqrWfB+qSbmT4lW8/va3cezmRYLiLEtqhI9qT?=
 =?us-ascii?Q?yWGZZCI11zD+R7mGhAYPI51E5qcukHqHCxTRmRqlCGE6dZfCSXYnUi9blK3r?=
 =?us-ascii?Q?8uJYIhU7Nkm5POIG20VYzkCYT4mQTFXATDUdH/L6yLD5Dg/jfAPed7D8yyLX?=
 =?us-ascii?Q?1j84vy5wL9QREucb0JsSrMrlr2sFuSSb3auA8aj7hSsKW5OIxB2ZKzSK8srn?=
 =?us-ascii?Q?FqOWnVZ2KEzvA4eEjB0DtCUsuchXpr77IpDLKZcU1G3ezAskURcC2iQjK5K7?=
 =?us-ascii?Q?FA804uoEjmfMTIObZzEx/o14YuPFQsq4GKqZFiTP+v+F8FZ8p4/Z1yt3a/g9?=
 =?us-ascii?Q?F69Rrj1+fBk8VVxwV8juXqzqiHBxRtmxrexXzqHYTEtg6lCBD+afwPzlaJRh?=
 =?us-ascii?Q?rAfsXC4XaLaIzvKu4ukGhtL03MyumKv8mxhqyJ6b?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB6940.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43042321-2ebc-46f0-17a0-08db3090426f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 20:00:35.0662 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xKh/jPfLXKF1nK82h/Tttc/em+yVWpvrHh5DcJ0bLQHeWSEBEd3D4Hzwj+M0LkG1/AQDbGJQD9m1w4jQEMDXfkyfkc5ylW/baCmpCalBcSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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
> From: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Sent: Wednesday, March 29, 2023 12:14 PM
> To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to execlist =
mode
> if guc failed to init
>=20
> On Fri, Mar 24, 2023 at 12:15:27PM -0400, Rodrigo Vivi wrote:
> > On Thu, Mar 23, 2023 at 11:08:58PM +0000, Chang, Yu bruce wrote:
> > >
> > >
> > > > -----Original Message-----
> > > > From: Brost, Matthew <matthew.brost@intel.com>
> > > > Sent: Thursday, March 23, 2023 3:53 PM
> > > > To: Chang, Yu bruce <yu.bruce.chang@intel.com>
> > > > Cc: intel-xe@lists.freedesktop.org
> > > > Subject: Re: [Intel-xe] [PATCH] drm/xe: don't auto fall back to
> > > > execlist mode if guc failed to init
> > > >
> > > > On Thu, Mar 23, 2023 at 08:23:13PM +0000, Chang, Bruce wrote:
> > > > > In general, this is due to FW load failure, should just report
> > > > > error and fail the probe so that user can easily retry again.
> > > > >
> > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > Signed-off-by: Bruce Chang <yu.bruce.chang@intel.com>
> > > >
> > > > I have not tested this but assuming you did:
> > > > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > > >
> > > Yes, I tested on PVC and it used to fall back to execlist mode and
> > > constantly print out EXECLIST_STATUS. Now all those are not showing
> after this change.
> >
> > But now the entire execlist code is bogus.
> > We should remove it entirely or at least add a parameter that allows
> > that to be selected.
>=20
> :( My comment was entirely ignored and the patch was pushed.
> Well, I complained about dead code...
>=20
[BC] I was thinking you were discussing to remove execlist completely.
It is hard to make a decision in the code review.

There is a "xe opens" document, I will start a conversation there, and
will @you as well.

> after removing the fallback we need to either add a paremeter or kill
> execlists entirely. My preference is for killing that entirely.
>=20
[BC] there is a module parameter "enable_guc" to go back to execlist mode

> But also I just notice that this patch actually only does half of disabli=
ng the
> fallback.
>=20
> When fw is not found we still have the fallback in place:
>=20
> @xe_uc_init:
> err:
>         /* If any uC firmwares not found, fall back to execlists */
>         xe_device_guc_submission_disable(uc_to_xe(uc));
>=20
[BC] the xe_device_guc_submission_disable(uc_to_xe(uc)); and comment should
be removed, can you please double check the latest from Xe?

Thanks,
Bruce

> >
> > >
> > > There is still other unrelated issues during
> > > __pfx_ggtt_fini_noalloc, and need to be fixed as below.
> > >
> > > [  223.839894] BUG: KASAN: null-ptr-deref in
> > > ttm_resource_free+0xe4/0x140 [ttm] [  223.847211] Read of size 8 at
> > > addr 0000000000000018 by task systemd-udevd/566
> > >
> > > [  223.856141] CPU: 0 PID: 566 Comm: systemd-udevd Not tainted
> > > 6.2.0-xe+ #4 [  223.864921] Hardware name: Intel Corporation
> > > WilsonCity/WilsonCity, BIOS WLYDCRB1.SYS.0020.P84.2103030140
> 03/03/2021 [  223.877365] Call Trace:
> > > [  223.881707]  <TASK>
> > > [  223.885658]  dump_stack_lvl+0x5b/0x85 [  223.891200]
> > > print_report+0x499/0x4aa [  223.896690]  ?
> > > ttm_resource_free+0xe4/0x140 [ttm] [  223.903268]
> > > kasan_report+0x99/0x1a0 [  223.908683]  ?
> > > ttm_resource_free+0xe4/0x140 [ttm] [  223.915210]
> > > ttm_resource_free+0xe4/0x140 [ttm] [  223.921621]
> > > ttm_bo_release+0x3e5/0x550 [ttm] [  223.927811]  ?
> > > __pfx_ttm_bo_release+0x10/0x10 [ttm] [  223.934530]  ?
> > > ttm_bo_kunmap+0x11f/0x160 [ttm] [  223.940775]  ?
> > > __pfx_ggtt_fini_noalloc+0x10/0x10 [xe]
> > >
> > > > > ---
> > > > >  drivers/gpu/drm/xe/xe_gt.c | 4 ++--  drivers/gpu/drm/xe/xe_uc.c
> > > > > | 3 ---
> > > > >  2 files changed, 2 insertions(+), 5 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/xe/xe_gt.c
> > > > > b/drivers/gpu/drm/xe/xe_gt.c index daa433d0f2f5..8a436c95591e
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_gt.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_gt.c
> > > > > @@ -455,9 +455,9 @@ static int gt_fw_domain_init(struct xe_gt *gt=
)
> > > > >  			goto err_force_wake;
> > > > >  	}
> > > > >
> > > > > -	/* Allow driver to load if uC init fails (likely missing firmwa=
re)
> */
> > > > >  	err =3D xe_uc_init(&gt->uc);
> > > > > -	XE_WARN_ON(err);
> > > > > +	if (err)
> > > > > +		goto err_force_wake;
> > > > >
> > > > >  	err =3D xe_uc_init_hwconfig(&gt->uc);
> > > > >  	if (err)
> > > > > diff --git a/drivers/gpu/drm/xe/xe_uc.c
> > > > > b/drivers/gpu/drm/xe/xe_uc.c index 4ccf2b3435e1..70eabf567156
> > > > > 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_uc.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_uc.c
> > > > > @@ -54,9 +54,6 @@ int xe_uc_init(struct xe_uc *uc)
> > > > >  	return 0;
> > > > >
> > > > >  err:
> > > > > -	/* If any uC firmwares not found, fall back to execlists */
> > > > > -	xe_device_guc_submission_disable(uc_to_xe(uc));
> > > > > -
> > > > >  	return ret;
> > > > >  }
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
