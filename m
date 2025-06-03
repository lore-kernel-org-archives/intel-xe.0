Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32987C5AD49
	for <intel-xe@archiver.kernel.org>; Tue,  3 Jun 2025 04:30:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EC4410E5B8;
	Tue,  3 Jun 2025 04:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aU06U6P7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52B6410E5B8
 for <intel-xe@lists.freedesktop.org>; Tue,  3 Jun 2025 04:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748925036; x=1780461036;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rcGFLyZxEhfDeSTO3VFvOFMXEok9clm6UXlna3acOtw=;
 b=aU06U6P7OdR2FDkcS9HpShXv7dWKQoLJHNOg0tWDWZwHeWiwnekGziPg
 fGVVkrW9qth1ajlo7uIjTcdtCzwLUi3GQUEy2YBnKecuvqFBa0LYX4lks
 EbnGKNVtx85nqlhDjyM17HE8oQHtXo7jXXC777knRqFZ8GvfsBD1eW3zl
 ficMh5HoeHqplPMTjhnib6iP2mYDKkWvJV+TWQOuS1ya4zNvDEmLiNBmn
 SWfMWRGqqdTJ3ci+lD04CeEuwJY2VUN80NQaQkWSBZylMmUCZGR/aZ9D/
 1eksAVtBJbSZZF/rVWa+LivgxAWysbBsgGy1mPSNfdRHoRjfDaeeKjsuu A==;
X-CSE-ConnectionGUID: fWpHbs3uT2Kw2DwtkW8ycA==
X-CSE-MsgGUID: fBbdgu1zTOug9Tflv5xexg==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="50070048"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="50070048"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 21:30:35 -0700
X-CSE-ConnectionGUID: FZLtHfRbQKmgKoqmbUgV0w==
X-CSE-MsgGUID: Xkbm9knKT0q291s+Pm6ONw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; d="scan'208";a="145360889"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2025 21:30:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 2 Jun 2025 21:30:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 2 Jun 2025 21:30:34 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.63)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 2 Jun 2025 21:30:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oiykdSygV6VGn5b5nJwmetGDse8aozUMlXfe4MdBVrWumsEbVgkaNKNNqXPpKHEIFmdyDBFrzLi9huNuF4F2C6zxxDTiHL6w9E9b4usU/U05j/TrY22RJno9Ksbx1m5yfQABP2KC3vnyQo4+/7Fl/vg9/KoekJU3Oc0umLCwzhfcyJQYksBoOM/piqlWTifJ5gCh4E/Jf8n6zXEet5db+o51syY8HKu0cG+2PeFFpbttKGGhRk+IuDYtqnL0417iOFhc2LNWZ8VbVGEQSbtM7jlPlzVKXdwhQXOPk7ulyiUxltC3sbgfc2O6CM5VbHRWKdr0nEfDwlFBZ6rMeLadsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGL+vbFDDvgYsktE8/7Vl5cE7tdUonkmmzOmDyOGajk=;
 b=BmtwVOykcKx3DOJwYg5sh/ZE9ryd/cT3Ea5raXBgJiAcabCgOBglsuO2Ryre0WmFf8HJXce+tRR/0lSm1qw0DNAdA2WW5JNtZJlr3doFzMROS8k0TpbajqYXlepUBIAwH1Et4ePYMJE1XhuAVS8CDPHLTElbdGsVoKy1w6DSCIGeEDoc+9TRdTkaSVkGcR7lEGpmDUMuolmaYXIajew1jzs4W1qYHgeNkw0/2mlXt7OrjCxfEsYa9D0SeCYSrVGR6zyOfttHX9E+Nl5W4ZJsyYEH7nNma9iLYGcgaUG1S/2jMBTLv2fX7xn9udRvxhoSR95Odu9lGFHh8xIcHXokuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by MW4PR11MB7055.namprd11.prod.outlook.com (2603:10b6:303:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Tue, 3 Jun
 2025 04:30:31 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 04:30:31 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nikula, Jani" <jani.nikula@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Topic: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Index: AQHb1AueDyKfPtK4wUKk30yboke+L7PweLGAgABYcsA=
Date: Tue, 3 Jun 2025 04:30:31 +0000
Message-ID: <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
 <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|MW4PR11MB7055:EE_
x-ms-office365-filtering-correlation-id: 56049d15-e552-4ee2-bda3-08dda2576050
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?IP+HbiTmNfvcD+zp4mnPt9Jop6htuPvdSmvZsntKHW0tMqgO3Si4PHA6qVoW?=
 =?us-ascii?Q?al2uQId3w0v24Cf4JCH9LqQ+X7C5XWlgLbEeJoTAd90hyoVUXb/70CDDezE/?=
 =?us-ascii?Q?VDCXsgAiKuVMldcH60yuBxobkXL5ZLWZyKYJU2tqcfJO07W4H3L9+ytu7DuG?=
 =?us-ascii?Q?grQdbrfNmHxPrCvRaNhc6M79BN+hyklg5jJkUbK7YlVI7LVa9/Eq6J4m7ZC0?=
 =?us-ascii?Q?aVqS2XQTKsD7e4hEOpl2DjvjdOC8bNp6u5OEOshS5jGpd9ZXok6Bw6iBckfF?=
 =?us-ascii?Q?izdd5JzyFd/evJFvDbASK4K9qoC2DR9bzx1ND4Gxd1Ny3oLsL4nHhWlzQ7iS?=
 =?us-ascii?Q?ZtRoggyBsoW0d2FLerVT5nEuDDRRAoddXjF0sMDYyC0q+76OMpu7GZzcPWqD?=
 =?us-ascii?Q?JoRELNO0TPelVMG3M0fgJE96NDjmb9WyiDNiurEPKfxLrxSrhVqHOeD9jbzT?=
 =?us-ascii?Q?ggU0InNwzuz9cZBigItGVZW3VeT0rAY9LLNmvf1jG7vArlqea12ZEw2C6UaL?=
 =?us-ascii?Q?uSN2oreQAgsDwp+h7KGowlirRORECknSr7V7gxY6bRNNCca5MfEXy/IQLlIJ?=
 =?us-ascii?Q?JZDjchff6oFPmWYG92qpn1xGkwczFSS2BoKxAfwRDbv5azP9Vdps7tF+iT9x?=
 =?us-ascii?Q?2T4ifRhthpciHTkyWOrcLJZkfpMG8g+NOMtwJnGKD8lopl9YgDsiwzM2Y7DT?=
 =?us-ascii?Q?W0QOtNCFK6MRJgf18mSEadcKc+4FA6LTItiWb9QCud6WcK7n5YJ+GjBzE07Q?=
 =?us-ascii?Q?1J5HQrX2Q6TOyLfez77zIy4a8H3n9+kBBPIsSlBvqV18zTUfHyBiPgHWbc3Y?=
 =?us-ascii?Q?kWrn8kVvCb40jPHMxfb1lRs6t1CaxlTYNu+Qt/aHHZAdiiI1+04fvLIWkOlg?=
 =?us-ascii?Q?jJlPTnQiECvnrhvBzjuZuetLN+Xb1CmyuV5GVdM128tth4L42qERmgGbhFZ7?=
 =?us-ascii?Q?lp5PhuPs3ogkYjSgPySUMqNn8Pmtn22ZpvTzeTPdF54mxTny77fBXi5DOvXM?=
 =?us-ascii?Q?SLZV5WuZXIqfObfU2WEV03QSlJd0TFdxUxW6RCvtE4QIj/FBvksji+mzj7aZ?=
 =?us-ascii?Q?bEjvpNNqn09CANlFtm9Gb/ez9AMte0bCmWmt3Bcjeu6ybZt8GWfYxT7WSFJZ?=
 =?us-ascii?Q?mbbtu/A8YWB75n67W/B2Iw6GJFNnrcu7PZujowI1lLg7cv/eUb+x6qoEkTWS?=
 =?us-ascii?Q?A+gHOD3a9eXV3v/OejjuiT5oX3Wnj0OBnL+9gJDEQD+tb2RUzibui34j99Bb?=
 =?us-ascii?Q?wcxaL5t949UzVJr6Twuo2Qt6ZisMlkWzQ7yo45vsk5DMlipJt+Bmdix1ACJL?=
 =?us-ascii?Q?BWCJSUmidOYV0DyAqpUhW2D8YsWz4b3Tvn9AaD1BS6Tr92Zx0u8s8ZEv/Yhx?=
 =?us-ascii?Q?r3q82GWNr7dR08VlrhbUBwheKcTsD9gq4sVQ6yFAPiwAw33eh6ELRdQZ+yn0?=
 =?us-ascii?Q?fe2w2FoElFaToXY8K9XKSnxOaoK/vk2f0lO14Fkehl9DOXHwZWVUqw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cj+gyzyqZ8dMccl70ZKFrvee0RttXSsYyc+pgSXdXxS9Tf75AqBE1sqV6Z19?=
 =?us-ascii?Q?EeXdu3+7/2VqgH6/uU0Acw1pYtEXawqatWg1LdYJlEqN3HkUTN4rdg9soXC7?=
 =?us-ascii?Q?hw/eT4RQTEMN8Rx/rlo7V4PBNmKgLmYGUy90kMIYAgpGCtcyCdBRDVQ1tKok?=
 =?us-ascii?Q?ZdAYq+qhToiyAFOMdco2hUO6oG4bZt0fr9g4VDd8CvO7EJavqtn+MV5KaNue?=
 =?us-ascii?Q?WuuNNgxujvELKpbEDstlTSEqPSoYvZWbQxPX3B8arKif5ZrrW3mzgBzrBiI0?=
 =?us-ascii?Q?HmWR2z6NEQi8Kjor7cMahVKnViQHoNOouMGleJFlJs1QUARZEJzzvRax1XVt?=
 =?us-ascii?Q?uWPiCTLP1NLB0utLgme0KIDG8fR/q39BODJsq51lchxwKWRkCD5EtTauBZYf?=
 =?us-ascii?Q?h48AOrpsn9YZA3eV0JXGK6itfSmQANfAFoi9TWcQ25xF54XC1sefJ1frQJq0?=
 =?us-ascii?Q?VQfEXrcJZ3w8qC/n/HJb9Hg27j4X/VI59aQksLcpILZU/ByoD1vC3ZsHjQAj?=
 =?us-ascii?Q?T8BIrTXMGEF6fK9g3+p/CqObjIHPjRbwbT9SQgxqYMNOC66OwliEUEzKENk0?=
 =?us-ascii?Q?FgxEiPNT4CdvWEZYodyOIA2zWTHbBbopBtC6B0xAOKGG2BK0aQtEEdAomJoO?=
 =?us-ascii?Q?iha8gEhmEPqvBEM5chj6WZyljxMDLfsgvpv6G8hDJ205TgOHfWZLJ89Q2ics?=
 =?us-ascii?Q?+Pm/ETSRhdNXsxJSHsepmuU1NoRQhNyNJ/7DC2uyXsj43jcgrvi+81aF00Ie?=
 =?us-ascii?Q?/N53NE/SXLbUQCQPqLONUqPFhDijpckW142qtZaOCZohvpjYZSEZN5t6A5Vl?=
 =?us-ascii?Q?83IPt5883kjiKTuDrntbMAVs8qTmdcy8JOid5hJL2georPellMMCzXeCaMhm?=
 =?us-ascii?Q?C8p/+8+ZriP9Rglg4XTUB+dVJ8KLcUuCtBAq4MEmqEkSI/OLHUrLXBROxpD+?=
 =?us-ascii?Q?BF0YeWS9NkunX39YENFCGvYt9CiNLLnBATV7L+IFNix9IuzQ+Yd6tRuqRyp+?=
 =?us-ascii?Q?k/mmLwdbFOVn1NhzeyUO45raCzc0LkHf6D5LVHFpgVusNmv9S6ovTf9G1AbD?=
 =?us-ascii?Q?NIdvdHnIJcPlr/PJJl5oQ98L8o4u+paTtFJXsInhR0C87TIQWiXyAwCXOklz?=
 =?us-ascii?Q?3iHvYIWZEWN9gU/fHmhJyQ5VrY75h8Ec8ZaTwaXMgUpCPMVlGcJHIQuEBuIf?=
 =?us-ascii?Q?4kq8LJNraWJH0tJebssWbJxp+hqwy3FNUJXPDcBxURFcKvDyeUZL9Saz8qRl?=
 =?us-ascii?Q?W9lG0ZN5j2722RU7tc51EmSxZJA7vMWSgsRyBhVBqDVyTk/f96bayJCX+fsv?=
 =?us-ascii?Q?Q3/p+fe/VfJJw6TPDPgrY09/DytciHBY5f8RJoby0dgk1P6zuF90Lg0UirGi?=
 =?us-ascii?Q?x/mL9gjWT6dXdOhoWJC5VjlSA3N/bYFd+hzvwd5g7AfKU3B3WqnI4yaFE18r?=
 =?us-ascii?Q?EgUhqxoVY6fJqRJ3IPKWPXscn4h2ClpHLMn3ZABsatUxrQ0eQ+JNLOIBqQMp?=
 =?us-ascii?Q?8FzcGk2S6siVVgG7Noyj2zBbxDGGnYp190w/NtYr9ZgCQR/bhSC3eEDCIRZc?=
 =?us-ascii?Q?N5fAWUmxd0R3sDX+MTUuCnXrvLiYW9fgDp/nZ42i?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56049d15-e552-4ee2-bda3-08dda2576050
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2025 04:30:31.7837 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rkxIjsoUSpT8AX837LMAAgdgxHjq0/PsnYCEaI76W0Elbu4UNRZdD6SNvQapkWgZ9aJBnOz/8hc1v3I744Vzd2eBGDU7Dh1I9SnECyN+PzA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7055
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

Hi Matt,

> Subject: Re: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
> with no display
>=20
> On Mon, Jun 02, 2025 at 03:11:18PM -0700, Vivek Kasireddy wrote:
> > Some SKUs (or variants) of BMG do not have display capabilities and
> > are intended to be used as compute-only devices. The Xe driver is
> > expected to work with such devices by probing/initializing all
> > other capabilities except display. However, the following crash is
> > seen when Xe tries to load:
>=20
> Can you provide the full dmesg log?  It's not clear exactly what "no
> display" means in this case.  What's making the driver think there's no
> display?  Display GMD_ID reads back as 0?  GMD_ID is normal but all
> pipes are fused off?  Something else?
At-least with the BMG SKU I am testing with, GMD_ID_DISPLAY reads back 0,
and as a result, probe_gmdid_display() returns NULL.

>=20
> We already support other platforms with various flavors of "no display"
> so I'm trying to understand what makes this one different.
It looks like this is a regression that is caused by a recent patch. Specif=
ically, reverting
5a9f299f956e ("drm/xe/display: use xe->display to decide whether to do anyt=
hing")
also seems to avoid the crash.

> What is the
> actual NULL pointer you're hitting here?
I believe this is a bit vague, but inside xe_display_flush_cleanup_work(), =
the line
spin_lock(&crtc->base.commit_lock);
appears to be causing the Null-ptr-deref as the crtc object holds some garb=
age value.=20

Thanks,
Vivek=20

>=20
>=20
> Matt
>=20
> >
> > [  115.582833] BUG: kernel NULL pointer dereference, address:
> 00000000000005d0
> > [  115.589775] #PF: supervisor write access in kernel mode
> > [  115.594976] #PF: error_code(0x0002) - not-present page
> > [  115.600088] PGD 0 P4D 0
> > [  115.602617] Oops: Oops: 0002 [#1] SMP
> > [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: G  =
   U
> E       6.15.0-local+ #62 PREEMPT(voluntary)
> > [  115.617332] Tainted: [U]=3DUSER, [E]=3DUNSIGNED_MODULE
> > [  115.622100] Hardware name: Intel Corporation Meteor Lake Client
> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS
> MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
> > [  115.635314] Workqueue: pm pm_runtime_work
> > [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
> > [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
> > [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX:
> 0000000000000002
> > [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI:
> 00000000000005d0
> > [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09:
> ffff8beb0c1b06c0
> > [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12: fffffff=
ffffffff0
> > [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15:
> 00000000000005d0
> > [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000)
> knlGS:0000000000000000
> > [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4:
> 0000000000f72ef0
> > [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> 0000000000000000
> > [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
> 0000000000000400
> > [  115.738113] PKRU: 55555554
> > [  115.740816] Call Trace:
> > [  115.743258]  <TASK>
> > [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
> > [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
> > [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
> > [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
> > [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
> > [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
> > [  115.774797]  __rpm_callback+0x48/0x1e0
> > [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
> > [  115.782614]  rpm_callback+0x66/0x70
> > [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
> > [  115.790173]  rpm_suspend+0xe1/0x5e0
> > [  115.793647]  ? psi_task_switch+0xb8/0x200
> > [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
> > [  115.802502]  pm_runtime_work+0xa6/0xc0
> > [  115.806238]  process_one_work+0x186/0x350
> > [  115.810234]  worker_thread+0x33a/0x480
> > [  115.813968]  ? process_one_work+0x350/0x350
> > [  115.818132]  kthread+0x10c/0x220
> > [  115.821350]  ? kthreads_online_cpu+0x120/0x120
> > [  115.825774]  ret_from_fork+0x3a/0x60
> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> > [  115.833768]  ret_from_fork_asm+0x11/0x20
> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> > [  115.833768]  ret_from_fork_asm+0x11/0x20
> > [  115.837680]  </TASK>
> > [  115.839907]  acpi_tad(E) drm(E)
> > [  115.931629] CR2: 00000000000005d0
> > [  115.934935] ---[ end trace 0000000000000000 ]---
> > [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
> >
> > Therefore, to fix this issue, we need to make intel_display_device_prob=
e()
> > return NULL if it does not detect the presence of display and ensure
> > that its callers check for non-NULL display object before probing other
> > display related capabilities.
> >
> > Cc: Jani Nikula <jani.nikula@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++---
> >  drivers/gpu/drm/i915/i915_driver.c                  | 4 ++--
> >  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 4 ++--
> >  drivers/gpu/drm/xe/display/xe_display.c             | 2 ++
> >  4 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
> b/drivers/gpu/drm/i915/display/intel_display_device.c
> > index 1d8c2036d967..c9494cbf5ba7 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> > @@ -1705,9 +1705,8 @@ struct intel_display
> *intel_display_device_probe(struct pci_dev *pdev)
> >  	return display;
> >
> >  no_display:
> > -	DISPLAY_INFO(display) =3D &no_display;
> > -
> > -	return display;
> > +	kfree(display);
> > +	return NULL;
> >  }
> >
> >  void intel_display_device_remove(struct intel_display *display)
> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> b/drivers/gpu/drm/i915/i915_driver.c
> > index 3b0bda74697d..0bf8125aee8b 100644
> > --- a/drivers/gpu/drm/i915/i915_driver.c
> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> > @@ -757,8 +757,8 @@ i915_driver_create(struct pci_dev *pdev, const
> struct pci_device_id *ent)
> >  	display =3D intel_display_device_probe(pdev);
> >  	if (IS_ERR(display))
> >  		return ERR_CAST(display);
> > -
> > -	i915->display =3D display;
> > +	if (display)
> > +		i915->display =3D display;
> >
> >  	return i915;
> >  }
> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > index fb8751bd5df0..cb1928d52869 100644
> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> > @@ -186,8 +186,8 @@ struct drm_i915_private *mock_gem_device(void)
> >  	display =3D intel_display_device_probe(pdev);
> >  	if (IS_ERR(display))
> >  		goto err_device;
> > -
> > -	i915->display =3D display;
> > +	if (display)
> > +		i915->display =3D display;
> >
> >  	dev_pm_domain_set(&pdev->dev, &pm_domain);
> >  	pm_runtime_enable(&pdev->dev);
> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> > index 3f92bf51813e..027690e4992b 100644
> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> > @@ -533,6 +533,8 @@ int xe_display_probe(struct xe_device *xe)
> >  	display =3D intel_display_device_probe(pdev);
> >  	if (IS_ERR(display))
> >  		return PTR_ERR(display);
> > +	if (!display)
> > +		goto no_display;
> >
> >  	err =3D drmm_add_action_or_reset(&xe->drm, display_device_remove,
> display);
> >  	if (err)
> > --
> > 2.49.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
