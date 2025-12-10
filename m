Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91C74D3B9B7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Dec 2025 01:01:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507BE10E231;
	Wed, 10 Dec 2025 01:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nSD35ub2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDFF310E231
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Dec 2025 01:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765328463; x=1796864463;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=u0vtigVsu4MxS6vKARXolfLPRpVDuJY3E9pf7HBOwKc=;
 b=nSD35ub2tEveabUhyMDuLfT7XLp33sH1fkrd3GQ5IZg/aS2Bpv0qtGQI
 36YqedbSO1FV8LFOjJkYNHVE9B02dM01ECvh5WfS4kke1K92nG7bzNfiV
 jSVauENVpXqw3roRn3fo/xDb4QNWdw9ObGMrBiryafwqKEHUPEz+YQ3CY
 jqOOcNGeqFPB9o74RPazfK+qmDBsDcPddCGLqRG8nLFAqKUh+oPFPHEh9
 TmiiqcRo8mcKsrT0xR3IYO3K7vjYw3aaY2qoe5gVzhihxQ0AFP3CkMgyA
 489qsg20zVjOY+R9hUZXcQzzw43MKV5WdeYLg8DS85rPsoIgKwvhFpuVH g==;
X-CSE-ConnectionGUID: OEhnofD6TveSGdcpXqmqqg==
X-CSE-MsgGUID: xaOczzRESlO3PjZySI/D4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="67189523"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="67189523"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:01:02 -0800
X-CSE-ConnectionGUID: 5B3U3p91TXmGgPCKqTbs3Q==
X-CSE-MsgGUID: Piva4Q76SLG1uGsbamuKgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; d="scan'208";a="200860297"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2025 17:01:02 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 17:01:01 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 9 Dec 2025 17:01:01 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.15) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 9 Dec 2025 17:01:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fX3JzpgpgYNpae0kzzngRhbsPy8tLYIMcFYSLduEs/pigGiV+AuMSiOfUpZyskylpiQy5Go+X3zhEF21Sp9fZ0uqmTg6d1BaQA2e4TPRGn+FmndqftX+hgpRkdzQEf8R/tsTVd4Uerl0SUJzqR85tfz5+fN+XZ42Fb5IZgttOwViJLZXz8JuAUnYiOX0msIJGyALhiCUyNAM9fdNs3XZ5gtq6eqU5Elqcx3k6lh8uX/MG0g2LlxwN/UD0aYTK7dQl7WelcniIzdIadDuij9bqlYtL04HKBC9iHE/aU1/Z0N3QdlEk8x8ISg50NCp1tnF6rOdI2WukEr3aXI1Nihkgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OetfyUMilpXZncgMoHZVyUdm4WOiiILfiKe2OAIQrjw=;
 b=To4am69OUd9p/AiGVu12B9ata6ccO6DzI47EDjmCMEq4sg08jkh4FOwHXOKltQA4ypuhpRg3Ujgd6M50Myit/68YYvKwBGcZXDDQYY8/tr/IS1j1ODQ9GVxSqRqCh9sw8Hm/TR9dtsJFPoZapkgpdUCIsiuJhXn1qD4mp4E0QhLck8eny0YNIkPf8QMqXl40sR+IngXelDua/3oPcu7FQrmGQ2a71tferKjksCCzZ3Rfd1sb1VPgbkLOf6ors05xmvPhXyCpcU0GnDoHEeyEmrm0WsMpcbk/uyKCeY9AhiG1YB1saLrikFe+LIYBdpnBRWHMlpo8B662hyrdLsbv8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SA1PR11MB6568.namprd11.prod.outlook.com (2603:10b6:806:253::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Wed, 10 Dec
 2025 01:00:57 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 01:00:57 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v4 07/10] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v4 07/10] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcaUenvC/sraYPWUKUZGnWqOeODrUZwzAAgAABr7A=
Date: Wed, 10 Dec 2025 01:00:56 +0000
Message-ID: <SA1PR11MB8839F3B839758F028FDC592FAAA0A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251209200815.2570770-12-brian3.nguyen@intel.com>
 <20251209200815.2570770-19-brian3.nguyen@intel.com>
 <aTiHQkJ1Z2QkfM0x@lstrano-desk.jf.intel.com>
In-Reply-To: <aTiHQkJ1Z2QkfM0x@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SA1PR11MB6568:EE_
x-ms-office365-filtering-correlation-id: c20c865f-d56c-4b89-3739-08de3787939d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?pBnEYpUoTk5orjfkArUBJkNtfp35QkmxqlAG7hlCCI5VK7S23LnrgJvI/Irz?=
 =?us-ascii?Q?F6fO6UqWjw6/i8fqC/6HgVO0cK8Lfpf3Cd2uxjaPw3s4S+OZUt7+Pp0bvaqj?=
 =?us-ascii?Q?9S2e0vygMzSZXnjw//42FBPyaxhUjTp1rS6W5kr7id6niUbK2T/TbqXp/qV9?=
 =?us-ascii?Q?rv1gl6h6BmgUnfrlnOJnfPS/ORapqnyLd5Ls9X3YiatwYpWSRMQgOPgQhKi4?=
 =?us-ascii?Q?s8ZRVRMXrulzo0t2xyqqkssEnwP3v+CM9y3c6Dp4QkfDj/t+ZiiCESIKDq79?=
 =?us-ascii?Q?kjoR3ZPNIq1lUayKxRgdwziW2zKA/fEsWmIv9iZLnC8iq41YonbpsY0AGsaQ?=
 =?us-ascii?Q?mx7aApFjQwhGo+AFtsqfOIJOhTirELvPXNYIObgEeKrtzlFQCn5oOiKxvPKa?=
 =?us-ascii?Q?EsHtzqbhmwCaugdGOWyuFobqa4RjQWNGA39AAv+FeUKZpFiOYwjye8Cd+Uk3?=
 =?us-ascii?Q?+TNaM3ZgM37iReXWvxA7zWjz1tCQoL4h3Y8DRI0zB8uDz7rRQAogs/F1iH1h?=
 =?us-ascii?Q?LiqTZgmK4eiKsSShlTYQy0jJTfmgVsbISe/ORljbPZ8Bqe5AaFahMU5ml6va?=
 =?us-ascii?Q?HM8bcJly9/A1f+w0Qlz85Tu6UWk3K8EqzIahy/exhlhNhBbMceA7qCtfqeVT?=
 =?us-ascii?Q?0VyWJkkqfblWQV/n1JI4xNqZpUZSzqJ1rIbyVQdPLikRPMy/67CbRSzni8C9?=
 =?us-ascii?Q?myw0gqeq/GH64sCz49mr8RVJf+j45kBRSVoKAtetXteLuqjlV/vgqo0BxqJX?=
 =?us-ascii?Q?rO4iufN/dn6fXDUDGoVBH8ApTEUV4CS6SMQGUOOyGjhVRgiTDR5XAY4ia4wz?=
 =?us-ascii?Q?dZ8G15GqCNBVa20z+bsdpiucTXanA033fEYbNMKWXO156v+/2e4cb84zFfxH?=
 =?us-ascii?Q?W0RaFuOgb26V1kQMObzX7yjs0J8KYxSu2K5UCOEH7IDKsH9yuMFEoJyQuweM?=
 =?us-ascii?Q?T7EbMCobQZDokOPivCr2J9kEQBL3wLaWbOvpC6NkEyD4lzTXJJWXIovk5A8K?=
 =?us-ascii?Q?WX7ivSJI18FUsp61pkJhSSWhBpG55GgmkouLbbZIoUgxTjTCZx+u11nw3HMo?=
 =?us-ascii?Q?gv6VD1VZy9WrscG9ruvp+4gBaqaZ/BbJwRNejU9fMh34XUhGz4S+TgM/8KVN?=
 =?us-ascii?Q?umv0AKFXak0PUbbH4Yo1Qhzn98HjvWzuJRbFlovDsuY6DhHiF1MZ0+jzObRy?=
 =?us-ascii?Q?p7iJ5PPp+iWDOr3TJRxlEFR+2fGThHsJA/BT10v/vEQBiyV18F0vdNesYsmp?=
 =?us-ascii?Q?gM/J3x4bnyV0qwsYqVu5HQMMXte+nTF8abAzRS1Asv+JDYrljCF7qCnkn5nr?=
 =?us-ascii?Q?RwH2aZphs8TjNlznFB3nkq+LWQifq2UFXKEk1sLZyNXMMvivOj5qA66d6agq?=
 =?us-ascii?Q?aP54IruoZaUqLwvJn4WmR4JstmdfH3N7e+FWhX+vOFgm+nAKNkpHdgPaukQh?=
 =?us-ascii?Q?HMm+H/kLY7U4wu8dwUuy1FtcFPagkjLnb8UAc+lo5EyFKEaqmKoRYpUABfdO?=
 =?us-ascii?Q?tLqegszwxB2b74lkspf8JYhgB/ArVuius/N1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ROHtef42B1rlowpINBX7QmNovKCMHTxPUj5UODxNdp70j+IXWgDxpOTTFkoR?=
 =?us-ascii?Q?NPCaCcjl8/r9vknH2hZm1CTXltm763YsNS266EMhebCGWZfFX9GPeu2jJdzR?=
 =?us-ascii?Q?U3gmq75PJ2BD8iM1LgFxBIqaFX5uXbQ1rnuPdfLkmtUW7ZjTdyIHgzmd26gu?=
 =?us-ascii?Q?ZvHMZvnG175TLngNEV7pJ43BSwz7g7kad75dg/kmBmrdXDYvH7QCMTO5DZMp?=
 =?us-ascii?Q?ICEs2iIjUrsgbDPXVZURWeI0rwM+ktKmDIz/wButcE18JGL64TcgT6xbJjBg?=
 =?us-ascii?Q?aR5HeR1r1cEon5VGurVaqjh6xtVoVameiV/Iq/hv6Y3y60d8jjwwdcu1QgK0?=
 =?us-ascii?Q?PFs+yzfy+KtV/ELb5t3aQnfIWykKszsKhmf0hGTlimD9NCUHXQTxDOqPA6Jo?=
 =?us-ascii?Q?0hC5YyRfOV87TBR5zrjsxkVKqiZfIo2FIOYx8nbN1/+LWkftHnXsV4ZGW69a?=
 =?us-ascii?Q?yzRKhuZHwtfPPEoHaYWPsDhWSQ/xAlVFPVGe8StzGi/rkQ3OUjPcrkg6YTnt?=
 =?us-ascii?Q?vqJllGksxikjmBzifgbvgj9OshE3cl/wvtPlz2CqcsXXVzhTWZoGHaH4JFsF?=
 =?us-ascii?Q?a2+YA3LNWnZSg7YnSqRta/uNiu3YvPBNkOeq1dTFBU8vxvpv9WFIP7bPC6U6?=
 =?us-ascii?Q?+sFx/hFcC9WeFgt5lOkMcQ4ZoQZnKIULUHHhzYz9SC97T6uX0U4748fh75U2?=
 =?us-ascii?Q?gq2jSjpqPdo8HnRewxIsl5+ziXF2BwmnCwGhnurP1KThk926Xj7BrLNxnXu5?=
 =?us-ascii?Q?fxcqwSsQocCJqTpvAMY7nReeOMlY5ZaewCYz1rDwzV7NAT4siiESWZnPyP96?=
 =?us-ascii?Q?GAbhpVr1VJJtTyGSG/NahVwUMmSup7U5va1YMYctV9vXa+bckDvqf31wTpcQ?=
 =?us-ascii?Q?LAr/DaZNFsEHxbWcN3PkA0grJspEV/Kx4PppjvzjtD934IBJaFDGpdLSZE5T?=
 =?us-ascii?Q?3VzU6Ng1LsUR7+3lNpxD1k/ynLEjs8LF16APak9jAJROdq2AjVjUykJ1WTYz?=
 =?us-ascii?Q?xtpc6DGka6L8YmNlaZwYWN/GeCWwsibwCFCWFzYzyZ7bGXJIZKMLone4lpqm?=
 =?us-ascii?Q?vm5uubbolQSDeKiiHRnU5uDiacDRfMp5ARUtEAtkmoHq1jJkz2v76q0hMuLB?=
 =?us-ascii?Q?UWbrpvcGvLaSjIoaAzc3viDRc8qMCXtxLdVyUWzJ8DHcyDGjuurZFW8EZN72?=
 =?us-ascii?Q?LyAnEWJThr13By4Rx0ArR0WOP5uNRavflw4/11TzFnjFCqAo4lgV64N5EkNx?=
 =?us-ascii?Q?6+DJ3k9yx3zINQjyncggPRywDr3axhZ6m6l4PQkaBFEb+RbYIZojEjaEctDU?=
 =?us-ascii?Q?/LEgl325GhW3F2NjPqN4gBwC4d2gGS5gJe4iH559VmGEOZpNYFBJp+gf1NQ7?=
 =?us-ascii?Q?0gYIecMTogzyNcrW/iar7kLi3i9b7hiZYcDHKw/wA4wLnOIQIMgWKePTiXnj?=
 =?us-ascii?Q?Khp0baEzuIA6b2WLKd0rw7amN7yK2szhwFfjU47TKmhnw9W1catngEZ24Wr2?=
 =?us-ascii?Q?3uUX663uC0aCqdJVGgJfvXrHG/Wp4pSdenw6vGeZ7PzU9IUCkTaBj7P+af2K?=
 =?us-ascii?Q?cE80eMmP6DnMig4vT3SLM9JQ4NJWZUtu1aVeCpap?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c20c865f-d56c-4b89-3739-08de3787939d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Dec 2025 01:00:56.9386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: p/xdq3tA9rgFpHdqdhrthNjzBPwvUNJGV+NUGLcz9vTrzPbDh+y8EsmLDkBlFmpIcfCmsYRD3Di9OxBxzHsu8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6568
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

On Tuesday, December 9, 2025 12:32 PM, Matthew Brost wrote:
> On Wed, Dec 10, 2025 at 04:08:23AM +0800, Brian Nguyen wrote:
> > Use page reclaim list as indicator if page reclaim action is desired
> > and pass it to tlb inval fence to handle.
> >
> > Job will need to maintain its own embedded copy to ensure lifetime of
> > PRL exist until job has run.
> >
> > v2:
> >  - Use xe variant of WARN_ON (Michal)
> >
> > v3:
> >  - Add comments for PRL tile handling and flush behavior with media.
> >    (Matthew Brost)
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c            | 12 ++++++++++++
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26 ++++++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_tlb_inval_job.h |  4 ++++
> >  3 files changed, 42 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 5f27d0a64013..b774195e32e9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -2509,6 +2509,18 @@ xe_pt_update_ops_run(struct xe_tile *tile, struc=
t xe_vma_ops *vops)
> >  			goto kill_vm_tile1;
> >  		}
> >  		update.ijob =3D ijob;
> > +		/*
> > +		 * Only add page reclaim for the primary GT. Media GT does not have
> > +		 * any PPC to flush, so enabling the PPC flush bit for media is
> > +		 * effectively a NOP and provides no performance benefit nor
> > +		 * interfere with primary GT.
> > +		 */
> > +		if (pt_update_ops->prl.num_entries !=3D XE_PAGE_RECLAIM_INVALID_LIST=
)
> > +{
>=20
> I hate to be that guy, but would a helper like this be good thoughout the=
 series:
>=20
> static inline bool xe_page_reclaim_list_valid(struct xe_page_reclaim_list=
 *prl) {
> 	return prl->prl.num_entries !=3D XE_PAGE_RECLAIM_INVALID_LIST; }
>=20

NP, makes sense. Adding it mainly to the "Create page reclaim list (Patch 5=
)" definition and
modifying throughout the patches accordingly. Alongside this, I realize tha=
t we should cleanup
the other usage of XE_PAGE_RECLAIM_INVALID_LIST with xe_page_reclaim_list_i=
nvalidate
helper to just clear the entries as well to make things clearer. Will be ad=
ding that too in the
next revision.

Looks like only minor changes 1 to 2 line change in other previously review=
ed patches but
most changes will be in patch #5.

> > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > +			/* Release ref from alloc, job will now handle it */
> > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > +			pt_update_ops->prl.entries =3D NULL;
> > +		}
> >
> >  		if (tile->media_gt) {
> >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt); diff --git
> > a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index dbd3171fff12..40e689063a57 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -7,7 +7,9 @@
> >  #include "xe_dep_job_types.h"
> >  #include "xe_dep_scheduler.h"
> >  #include "xe_exec_queue.h"
> > +#include "xe_gt_printk.h"
> >  #include "xe_gt_types.h"
> > +#include "xe_page_reclaim.h"
> >  #include "xe_tlb_inval.h"
> >  #include "xe_tlb_inval_job.h"
> >  #include "xe_migrate.h"
> > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, st=
ruct xe_tlb_inval *tlb_inval,
> >  	job->start =3D start;
> >  	job->end =3D end;
> >  	job->fence_armed =3D false;
> > +	xe_page_reclaim_list_init(&job->prl);
> >  	job->dep.ops =3D &dep_job_ops;
> >  	job->type =3D type;
> >  	kref_init(&job->refcount);
> > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, s=
truct xe_tlb_inval *tlb_inval,
> >  	return ERR_PTR(err);
> >  }
> >
> > +/**
> > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > + * @job: TLB invalidation job that may trigger reclamation
> > + * @prl: Page reclaim list populated during unbind
> > + *
> > + * Copies @prl into the job and takes an extra reference to the entry
> > +page so
> > + * ownership can transfer to the TLB fence when the job is pushed.
> > + */
> > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > +				       struct xe_page_reclaim_list *prl) {
> > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > +
> > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > +	job->prl =3D *prl;
> > +	/* Pair with put in job_destroy */
> > +	xe_page_reclaim_entries_get(job->prl.entries);
> > +}
> > +
> >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> >  	struct xe_tlb_inval_job *job =3D container_of(ref, typeof(*job), @@
> > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref *ref=
)
> >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> >  	struct xe_vm *vm =3D job->vm;
> >
> > +	/* BO creation retains a copy (if used), so no longer needed */
> > +	if (job->prl.entries)
> > +		xe_page_reclaim_entries_put(job->prl.entries);
>=20
> Nit: xe_page_reclaim_entries_put has a NULL check.
>=20

Ahh yea, missed that, removing the check.

Brian

> Matt
>=20
> > +
> >  	if (!job->fence_armed)
> >  		kfree(ifence);
> >  	else
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > index 4d6df1a6c6ca..03d6e21cd611 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > @@ -12,6 +12,7 @@ struct dma_fence;
> >  struct xe_dep_scheduler;
> >  struct xe_exec_queue;
> >  struct xe_migrate;
> > +struct xe_page_reclaim_list;
> >  struct xe_tlb_inval;
> >  struct xe_tlb_inval_job;
> >  struct xe_vm;
> > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, stru=
ct xe_tlb_inval *tlb_inval,
> >  			struct xe_dep_scheduler *dep_scheduler,
> >  			struct xe_vm *vm, u64 start, u64 end, int type);
> >
> > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *job,
> > +				       struct xe_page_reclaim_list *prl);
> > +
> >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> >
> >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job *job,
> > --
> > 2.52.0
> >
