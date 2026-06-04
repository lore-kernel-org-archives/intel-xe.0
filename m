Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0720BCD6E4A
	for <intel-xe@archiver.kernel.org>; Thu,  4 Jun 2026 14:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B974B10E0F5;
	Thu,  4 Jun 2026 14:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YXN9yh+9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1782910E0F5
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Jun 2026 14:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780582956; x=1812118956;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=coZ3KkCj/cMNrCyJzgBBs69nZ+AjGftJIKPHegnQTUQ=;
 b=YXN9yh+9w9UmnjZt6IOFst8RQRvZSURPL+WQpBntzdTS+usvRc1+u6jr
 W5yxe3Fbr+6MTwN2PTK225muSsD9WQqKN+JDgRCUhIul4hII1kP2sdOjM
 QtTyYWLoP0FRdnh6ddCuauYYv/HXiAEucmVwMqA1oi8J/ADYRk94anWYo
 K7fHrRdpbzGWqB7Jod5W1gYzebhyKbkutEm/7lo9jBfv2K36WWrbY+m9L
 FAcAJSrL6Dm+hP9NTso4LZbtIOCFmC6zWOtJfCa9evWo1GYFw2I7z4Qgj
 CYCdBtbQgl05/9EpeyoV+muIJJEM5HN2G4j62a93QJ0oXC+5t4ZxNMatk A==;
X-CSE-ConnectionGUID: 3e88yfKDSpqWNSdG+D94hg==
X-CSE-MsgGUID: mqR+HONJSyyXYzmOVsLZ9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="85263802"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="85263802"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:22:35 -0700
X-CSE-ConnectionGUID: WaCoColzTNqwjlPxAVTQKA==
X-CSE-MsgGUID: r90q4LzWQNyXEb69hjiiBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; d="scan'208";a="249477830"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2026 07:22:35 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 07:22:35 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 4 Jun 2026 07:22:35 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.33) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 4 Jun 2026 07:22:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QONKMxZ58XFGXZs5tER+JRMonLHDTzrFkWnMN/zW6sa66FN8wFi57FId+t8rm7vfrcJqV7b6oB43sYvlpkVpc5lwKJs60BZVwMM9pByDPF0+R0M435oiVGNDPpeJRr2oIxKbyRNz+AjFQxT3z4LLBjiv78Vu99Jt9Llvu0DZG2dIPEgaIDTkOGZb733tCbpNn9E0+qtWE991t/Zg7XefBk8iab1jDh3syOX7Yt0tP7ir+l62WsePerA7bmN8/V6NzTn7ojOj2WmTPie2bM8hrV977RHJzxG/Atxx8dXL/9y6FBSe7eRjIZIOUzg+DfRIv5UcETOq+Ln7LKZdQlTLRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zfGeHS5aa+UzKxhi+Nh99P57hhOJJ8QZrvTLMoZtF9o=;
 b=BmvkqnytU/5AHrn21tJGcLellAmo5DSUIuhWZgMkZcxPuYOlwDEKt/36IVh1KqGIphY9+/AzDPycIqpPFjM5mLz4okDJCOIUD1umgvsUdy2MGFNJuthFTcrzSJ1r4SrmG5MrtBMytqbuLiWuk7K/6+fdNTsFpQI3i48orI5vEzGgxKscDLy3BoVwX2ox2atHMewftpK1Ax5mwt93uuR6Q7Gz+0k5/WF3+oSI4AN0Pu5e6wwVE4LJNNI7Iz6yLEoAVbxDPpuK4+31wCuN4VwscnECUzn+aOcGRWbz3bkpOAm8Jw8OMuoGkosxJQ/X25M8dTz9AIki0aRrYZI3+dugng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 by CO1PR11MB5122.namprd11.prod.outlook.com (2603:10b6:303:95::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Thu, 4 Jun 2026
 14:22:31 +0000
Received: from SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5]) by SA3PR11MB8118.namprd11.prod.outlook.com
 ([fe80::b2e3:da3f:6ad8:e9a5%4]) with mapi id 15.21.0071.015; Thu, 4 Jun 2026
 14:22:30 +0000
From: "Gote, Nitin R" <nitin.r.gote@intel.com>
To: "Sousa, Gustavo" <gustavo.sousa@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
Thread-Topic: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
Thread-Index: AQHc70v8cf5c1nQnlEunekhxEkV7cLYk81eAgAlFLOA=
Date: Thu, 4 Jun 2026 14:22:30 +0000
Message-ID: <SA3PR11MB8118D6D70617E735B6D64BDFD0102@SA3PR11MB8118.namprd11.prod.outlook.com>
References: <20260529095306.443350-2-nitin.r.gote@intel.com>
 <87h5nqs7u8.fsf@intel.com>
In-Reply-To: <87h5nqs7u8.fsf@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8118:EE_|CO1PR11MB5122:EE_
x-ms-office365-filtering-correlation-id: e1958b55-f572-4c64-3908-08dec244b685
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|22082099003|18002099003|11063799006|56012099006|4143699003;
x-microsoft-antispam-message-info: TqpmUrGWbKhI88K58BQoWdgPknh2MTXBZAEQLY5+884WVhzZVFA8LuKJ50mAnPntwG8gslRn69G61mBdSslUJAUnTUTOicqbqM1hs983oiicsX9Nslz0rNB/HpmjjFQjlUNhuRJeZSw4J8fJhwf/Ovd0MkQoV6InJyl4zYGA3FQbpWufqobb1Pw41TCEGLuWOqCZ7iQsq2SPoRfr41KRJk6V2eJq2LHmyH7qiEF2F+SuUSaulad26LJ321jV/2W4xIcX4+mpoxHMMERQWYUB8rjOPJYdfPCw523Cbg8kKZ06yMtIVRTJMR453VckIcTTP9gAViXmq9R54v0pRvMsG80Vdu3HUqxIFHXXuw77Jkc8gV5YSLDYLqrarSIBZATqUvj18WD0j2l+JPX+LTELun3Irff5LEvKtn86btlT6IKmdmC+S8zxJM3RzueX7cV8OIzNMKvwa0lH1ido0TxFIg7g9/ZfNJKpjFGtJUVfOu6Snb7O8xiExy50g2QTMm0I/rTVm1/1Bz4ClUuVlWMEdWkVig5wQzVptLyOsEVPc1feKDXKXqr/qfaaQGscrmnqzBfOQgevjnKbsvpujhG3Ml4GzYCDuYu1guXDIPT87yGW05e4g5EGJbuXN9qCeVZDxqA+o3owZVZPYKMhDQB8SEbs0hWijIaiDCohIxWMTIxO8XbQ5p/SoG9ppWRR1yjHdf1j8I9dQVpB4Xd8i72INjEuv/FU+deCuMHnUN2K9l3mP9cfUmMjPE58guGfOYOw
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8118.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?pkFt7+llKfvvWXnWPrrJaoW/2HcLhhZiGrqflqOw8r3iRCRou9xMSVwRK0N3?=
 =?us-ascii?Q?WNSysKg5XF5ohOrmeyUjWXgLydzvvJskqiLBLiVKCeGfDYX6gYDm7tqwLyqg?=
 =?us-ascii?Q?Lf3EPqeyToylv/7CpRPgR7yNZRL7AYy4NYjRcdsmzwUsj+SnxPgsR4IvOD4H?=
 =?us-ascii?Q?AWbFEHC2EfYzvhtS/5hEyve/AeJAy1aGnRx3buyi+6Sji4ZeClVcKF9PA2fQ?=
 =?us-ascii?Q?UQ028YdCESn/PzZZ90lOXyxtFLsyZUR9UPGWDg2691Xgatu2Curx4ibLgOUd?=
 =?us-ascii?Q?8fCPCU37vHC0wp1z7BrRAG7QX/VacFqvZoX7dkXErWuDc2+7WjB9iGWplM+x?=
 =?us-ascii?Q?RjDFAmpOKm3cwwo2ZkzX7sPFKHFAqOhc4rsejp4ymz8OqRv4X5tMgloMlTRY?=
 =?us-ascii?Q?rp+/2jXwzL5Jk6cGMAjLf8h9diY5HkRirDdR0Ml57B9exUV16laixczaxuOa?=
 =?us-ascii?Q?ZDGUvpGSR6OnH+pjCXywSjBpepRalzqlW4ClGzyrx/wF4SFIrecbXI6UAvWs?=
 =?us-ascii?Q?Su+/CUws9jtwJ10bCg7eGR0mJSS8egaaSgvVom5ZnYBVO5aulhzL1v55fyzi?=
 =?us-ascii?Q?Uv3NWiewbVNFg/8J3cB1o3BNA/2b+Hr+ILhW6A8Fgsn614dOY8eIq2FMHaaO?=
 =?us-ascii?Q?5wdQndE0mYqf2mZAqFXcYCl09RRtis3PzP0XkeBCf9+heXdqHCokD2tfu2WC?=
 =?us-ascii?Q?/LTcozE/QQeBp6i2ZE4K70EKwT45ctUqxLUhTdPVb+PkftGo5i1EL2cX+9LX?=
 =?us-ascii?Q?8keHMf4pY/OeJMg/RmaV/Gom/CsivbRXyVNxnRWp/g8mC/QpJQPF7R0945k/?=
 =?us-ascii?Q?Yxg4aoufgQLN9WPA64wrYf02EwKkWmbYOqWTSh7jNvdF/oQFy/eqx/850WOf?=
 =?us-ascii?Q?z8SsQxMph8qHI57wxOH5aDTVWMkX0hRg53HKRGxnYpkGqMjBYOGJhCbP6rGI?=
 =?us-ascii?Q?hKKXjwL0jsa/PDX8SulFgH5vCQBzzvOf7KGARkJbI+zH5CGw9xZWxAoOFgUi?=
 =?us-ascii?Q?PieX2QM3surKm6ES+dRsVpt1QNcCdZhl7YvK5jglodcoG2xhg3NpuM7EZBa/?=
 =?us-ascii?Q?HW2jMQL8XbxdyN4Duf1E6YRPOS119fxgBkVaV3PgROll6v+CZuQJirsKm+V0?=
 =?us-ascii?Q?4O5SsUVgRXhoFpeX7o9RqQtyWhc3WpzrhKSR1qcMQBq9Bl7MoTPMBc++SKtF?=
 =?us-ascii?Q?DOxyKfCtXQ0E1AS0id8w1XCXVPVEHZjNPLnSsaSXX57w1b7Q227eDhnLlBUG?=
 =?us-ascii?Q?M9FfGsDRAi9v6qT3/0NIySbp0tydqcfMfaOidgezH5B4tCFAAJP1YNMZ57eZ?=
 =?us-ascii?Q?MAGek/rUxgW6dLsch90aqAkYC/Fhd0ThY2peqOJzF/+h619X+xrQ8zLN5dXU?=
 =?us-ascii?Q?JtKZvSmUqC9xyldV2ExRfH/tPTl2oL/9T4V7WEUKlVXL8QeoA6LUdHIaW+1r?=
 =?us-ascii?Q?WXFJlKGGaKQyuA0n9QheyQkVQOsVIpLjxGDKMVdaEaNmIUgldeAPqLvlcek4?=
 =?us-ascii?Q?qUFrlutISmpoXn03VoO1VKqOQlTHk3u4NlzYogsZRKCZ2VlpRsMMv8B1Trx5?=
 =?us-ascii?Q?6ZfIE+q/JxE//Q9yN5GyjFxYWuH3mW7bjcIJWDLRomBMXia9WeoiGIizzvct?=
 =?us-ascii?Q?IqMEvuyHhba/Un2IXT4FrufnxVEVGaW4QEo9FIq6JXIHoutz4YtiPsKuNW0E?=
 =?us-ascii?Q?H2tdj65hNCrF+BVLBqMjzRPlC31530l+Z5gubJ5W8IG19J1C8Ese2ZCHGzNi?=
 =?us-ascii?Q?ftdoqo5vDQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: MymWBR2yKhQjxkrKBK+JtVOzcjoSa+2OQ9Kj1nlEgiTM4V15zLme+9IFhJ5LaARPZcsWWZMHkeUe1Hyu3HxBcHJwewZchf7m5kAivjNm3CR8pSLRSVv2HMhR+l9SmFQAsjWtBxu/QMiJtRDp9QapA6CxjX2IQDrCaYj3CyEPiPkHEglzZqsgizp5C6vUDskKYOe4uKLgNK0/YvTpjc+IXdPVBla5lSYX+62tm/WVdWhB6XDGXvZMku4xzgBZzPB2wXEmT3tEAZgGoFpDAxTBJjSug6QOg6rZtUaeA9yxnf/O3zFYzdVO2lNzXAiUZ4J5BTwjr52A8xFJpnmA/TamxA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8118.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1958b55-f572-4c64-3908-08dec244b685
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2026 14:22:30.8365 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fW4Cs/maOT7+HG/CsUM8qOP9XkPwhr9WY6Xhi+fTApJGhIjP64geDOl50i6Q1cVCNPBv1IkPJG3NsGPM109C5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5122
X-OriginatorOrg: intel.com
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

Hi,

> -----Original Message-----
> From: Sousa, Gustavo <gustavo.sousa@intel.com>
> Sent: Friday, May 29, 2026 6:15 PM
> To: Gote, Nitin R <nitin.r.gote@intel.com>; intel-xe@lists.freedesktop.or=
g
> Cc: Gote, Nitin R <nitin.r.gote@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH] drm/xe/xe3: Apply Wa_16029380221 to media
>=20
> Nitin Gote <nitin.r.gote@intel.com> writes:
>=20
> > Apply Wa_16029380221 to Xe3p_LPM.
> >
> > The Xe3p_LPM media page walker is hard-wired NonCoherent and cannot
> > observe CPU:WB cached page table data. Force page tables to CPU:WC by
> > clearing has_cached_pt when MEDIA_VERSION(3500) is detected.
> >
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c     | 9 +++++++++
> >  drivers/gpu/drm/xe/xe_wa_oob.rules | 1 +
> >  2 files changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c index d224861b6f6f..8a6f494e11d5
> > 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -948,6 +948,15 @@ int xe_device_probe(struct xe_device *xe)
> >  			return err;
> >  	}
> >
> > +	/*
> > +	 * Wa_16029380221: Xe3p_LPM media page walker is hard-wired
> > +	 * NonCoherent, so page tables must use CPU:WC (uncached) to
> > +	 * be visible to the media engine regardless of stepping.
> > +	 */
> > +	for_each_gt(gt, xe, id)
> > +		if (XE_GT_WA(gt, 16029380221))
> > +			xe->info.has_cached_pt =3D false;
> > +
>=20
> This will also disable the feature for the primary GT. Do we really want/=
need that?

Yes. On NVL-P both GTs are on the same tile (max_gt_per_tile =3D 2) and sha=
re the same page
Table, xe_lrc_set_ppgtt() programs vm->pt_root[tile->id] into the LRC for b=
oth GTs.=20
Looks like a single BO can only have one caching mode, so WC must win for t=
he NonCoherent media walker.

>=20
> I wonder if we should change this setting to be a per-GT one instead of g=
lobal to
> the device.  Perhaps one problem would be page tables shared between medi=
a
> and primary GT.  Is that a possibility?
>=20

Page tables are allocated per-tile (xe_pt_create(vm, tile, ...)), not per-G=
T.=20
As of now, I see there's no mechanism to give the same PT BO different cach=
ing per GT.
And Yes, they are always shared on the same tile.

- Nitin

> --
> Gustavo Sousa
>=20
> >  	for_each_tile(tile, xe, id) {
> >  		err =3D xe_ggtt_init_early(tile->mem.ggtt);
> >  		if (err)
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index f8a185103b80..9027365f0043 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -65,3 +65,4 @@
> >
> >  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
> >  		GRAPHICS_VERSION_RANGE(2004, 3005)
> > +16029380221	MEDIA_VERSION(3500)
> > --
> > 2.50.1
