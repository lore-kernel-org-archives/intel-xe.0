Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB25C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 17:22:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A555510EC1A;
	Fri,  7 Jun 2024 17:22:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fXhz0Mfj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9637910EC1A
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717780966; x=1749316966;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=f5RWB/9WAbU398nRn9zf0c/+PRL08upcLlSl7jfkElk=;
 b=fXhz0MfjftIpm73uU1NVE+zEMj7oFFptfQpL33gVL1A88c1KSUPgrt0c
 B2xsFpC66QP3suuqxnBRv7ZpkPcEAQzGQ8X/cf7njZC73p6gVeHVrqgkD
 f9ZPaqCmpToSdbprjmcd6jl67Vox7eEf6/5ozZq5ZOaR4muOLLK5/qBtX
 1WzBV6ikVdpso7Iisyj+5wRAS0JlUOoqz9zzr+JZX0yGV9L7DZoOXHT+S
 G39Pq6ONWm51qjOKvoMq9q6wgnQZvxifSCOs7P7mgc2lPsD2saT+QwDqB
 k/R3QnuDkwnhFQKFkP57sbI6CjF5GPyyFLx2T/RB6+I56LClDlcBE83IF A==;
X-CSE-ConnectionGUID: J8+GEeVvT/2EqedTHIBZHQ==
X-CSE-MsgGUID: 8fvOkdKzSoStg2tXU9Am9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18367175"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18367175"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 10:22:45 -0700
X-CSE-ConnectionGUID: WrZT+M7qTiyhCreNIzcAUg==
X-CSE-MsgGUID: nyH8OmcjRfiYIzYHlH0wBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38470349"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 10:22:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 10:22:44 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 10:22:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 10:22:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m1Tklzk7b7kz8AlCnjETlWdMzcIqgjDsJHDTqESCneIdUis6Axi5Wri3JpRVw2TbcB1Jq+eWORlcieRH6HlI02+2ruuRIoKRBdK3IDpdiVc1t3vEuOY6x3JiCitodTLOAffQLSZl+77fu6L5DyH6wsw9ZC+ffDwSKOArEB1ah+jX95EfeQx+Tm8k9wjtbb9rlDnW53XRRBE64Q16TwhPMQ+f0E5REJ74bg1bo6aoL0BBxiZT1HaBV9Zdhp2uaYTvXrVRnsM8o0TxeoboUkiA/Eu3oa3hcQVCYZJkkvZljdPJtXm4b6URKyMZZ6Zkq140wWfFUKCqtc2Ny0uU9BKzIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YaeHkG4RhUhCDPElJVT5uPSMjYGyT71ZFj2NURAzSvI=;
 b=mByxg/eylrb2pQ+CPStM91NNWL9d3i+7oM9b15WAP5j82CtQX/ayi9RC8cjmP7qkPbtzvNeT1fP6d87IgnQj08aai8e/Z/gRDwyXggUBY2jOQ4Hd3EYQ9JVUuqAGl5jtZ6ITGXqkWLKhgPIgzPojfjk0Tp83LjRQb6wMk/odxOxb/apB2rCVJym618RHDGjgackHQ2dGfYiqtbr2cKWaM8TJKDOAB5QR2LOL/DyfhjW9TEaltNDbdCTUYkveUx1z/rJnlt099gqjh+i1nlq0oMDYGMgrWcliOO8Oy97NJ1GUIT6KxF8Qsee7EEf1fXTZ3vgEHeFZFp8aSvFluBOUzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH0PR11MB5928.namprd11.prod.outlook.com (2603:10b6:510:144::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.31; Fri, 7 Jun
 2024 17:22:42 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 17:22:42 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Thread-Topic: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Thread-Index: AQHairlgkTW2q3siFkym7J21ANSCgbFiYeUAgFqFqTA=
Date: Fri, 7 Jun 2024 17:22:42 +0000
Message-ID: <SA1PR11MB6991A1D7325C383EB37EE4E992FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-32-oak.zeng@intel.com>
 <ZhdREN0UWjNV0TXG@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhdREN0UWjNV0TXG@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH0PR11MB5928:EE_
x-ms-office365-filtering-correlation-id: 3f231c50-3ffc-486f-7c7e-08dc87167037
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|376005|1800799015|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?K0hiK6Fs5WawPf/PUFnqtKV7sl3Xd/G3zZoEwX8zdj84Z4c8DAgJMvG2SXUO?=
 =?us-ascii?Q?/W/B3G2XJeDjwUFAdps7OY+e4lukyO0Zwl1IxAiA0lqARvt1F9SHrYeaB8mX?=
 =?us-ascii?Q?/FAEAbC6dB8uQs8WyYNN3TOmP4WUbSdifrgBcU7X7KIyRsKsMwtmXb8fvO47?=
 =?us-ascii?Q?FkX2oe3T7jn8L27DC7XPX7xifdMh0vvqUxHhLxjc1NkVQtic9V0yhGwWU8sY?=
 =?us-ascii?Q?qvqRbTUxGV5fj6c38OYVm/b55MpfZbGhIl12dPNg02o9gQDL/pUjA0FH2WFO?=
 =?us-ascii?Q?ELUvHMs8ptJGZ78KbCRpsICqvnqfB7JLioY3I+KwDLHG2QhfbLkAM0OhJQ8Z?=
 =?us-ascii?Q?NLv2D6xXJcugs4o1YluMtNX/m0WUZJVYys9ftfnqhRL5I6jmL8yHYRkYd7AQ?=
 =?us-ascii?Q?2aY3ZPluJDrhhQhiIddtu0/qvo+4myDvTqF/pOFDt0B3OWCOhzNrpDUFtiRE?=
 =?us-ascii?Q?bbIbkM1x0YqkLOg15VR3DzO9oxygttuKADygH2rTLIwaLf0921l9C9HmOz5s?=
 =?us-ascii?Q?Q1gPkUFqYjJcgSiZ+Utb10dNOTnfGxWni7dVUk56ZFcQE/GQKI5+n168H8Sv?=
 =?us-ascii?Q?JZYOM6TZjdmxS5A+A4LoZgdb7VbWAg7HAM3rfWkvS1PI3mIhtEvkfhveh85H?=
 =?us-ascii?Q?0CIqPmU4gDVSQ/IHxDFS3MqHi0PwTTBxHAq5026HP6TRbbDkFbtT2o9IwEv+?=
 =?us-ascii?Q?sg2XIEZsilfX9S8TI25RRKCsIpf0vXDxjRiv/oHiatCXWnIU4BU/5iKjVQOy?=
 =?us-ascii?Q?rKCbAlq//UMvUFl6Jmg6KUJV+2eq1nJAkWjmVlAyZil0wOBZco0fB4OTTpH0?=
 =?us-ascii?Q?zrz/ATUO3z9pRfX54Oo62M3h6zXInfTFi8WMKw/empjebOgV8PpXIMM3NDwk?=
 =?us-ascii?Q?rXnUSxd53gDZ33NS0YteelLq+Z0SJt0F6VcfM2jcBTvv6UUY+5QgI4mTf/GP?=
 =?us-ascii?Q?5ipf7Lx4uTRwf7wqhAkQn3bi6vSaSUiHON4mleTAc768zPCyA89+e2M7p+ql?=
 =?us-ascii?Q?0GpT6vcBTg4h3Ey3XYysdnqIhkuy+tFo3fb9KwNjAz77N9MzBRRCsxKVSCqj?=
 =?us-ascii?Q?Ycs/sp7nYIEZVuxdmkcdNgTuTkpS1BtZBNVbgYZHgpK8ZogqRhRW2HY1vlCy?=
 =?us-ascii?Q?fDiIa1zPTRfQeIUH4IYBtg6oxpBOFeSnQHdCQXtvgF8wxziGt78OVH4FRLqC?=
 =?us-ascii?Q?hFE6OZkH1LOtIkQMMTQ2qB4jbP1ht4jNvmsDHCbcCe00frZu8aNB0+ywUWTR?=
 =?us-ascii?Q?A4+SKnv4wKc5NhJve/3P649zb3Pd+c7R9S6HY9cWsF7vsNYQUGwTlPCeJnxA?=
 =?us-ascii?Q?SPfNsb53fwEwqaWorkNguz4S?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jrMoZRGYoodqznD0kQKLNhemIHRgAEi3rSL/Pldq1nqX6cVwkq1TjPfUI5Tx?=
 =?us-ascii?Q?9Kxj3iiU/VJwjWaRVV3bagzWwEW1DBXjvI9J2MEoOLIZyuf+SKHj/xtwNJyW?=
 =?us-ascii?Q?nJfViqlTBIxDvbHTCH2uKnDD9BPAC1T8R4kyQvqobNaSMu+llK1RUoRqM3ya?=
 =?us-ascii?Q?r2Hm91v3tm7E/gaMael2gPzBUrUQqMwcbd76tCypYw7rzknJxh0kELD6JlnX?=
 =?us-ascii?Q?FcBHKjfpFWZRpEGjibPB9KjTE1WeBhstKyaG+dve9wPVcNSbGFAlmQOwUMLq?=
 =?us-ascii?Q?DxSe8hIgzm2dXw9o62q3u1lurV8RVBNBZYMWG2hYnUeL8npDKGXygqaGnhvk?=
 =?us-ascii?Q?49OaIMBAmrN2T3J4BtrLsk62lTuytFE2LpIcpvNAULZyUWoNh1oq5wGAY3kg?=
 =?us-ascii?Q?RfINQLh+fP4GT/JYJJAmXK3ewpGv9Z+0DXSPPo5t2/zb7c3jshYvONaTCBMH?=
 =?us-ascii?Q?kITpjwsRbI7u55V1Gvgp4QdpVxsqVB7BwLuMDGcJxESNxLfYCKZvP1x/TsAc?=
 =?us-ascii?Q?YwzhnA2P8GbU1Es+VjWT0F6Yju6XVs3rxXE3H6pLifZ1N+IiGrSEaXz7pzdE?=
 =?us-ascii?Q?IGdDP10ihcqyF0BxyhKm3wzD6ZGVei7D4rvw8XHNzdOI2nIIqmpm6XeWiFqb?=
 =?us-ascii?Q?pNoRPGroo+RtBMZc21HqM2sX+3jCik+4qDm007FMQqOs36GZyAgRUevmNH99?=
 =?us-ascii?Q?f/WctYyZTHIAx5ABbJK6ZnmmdJQ1Z8XmAH14H1NsPIDZKZ7yBNzPD6W4Xy6x?=
 =?us-ascii?Q?OAEz1ncf6b/l49t/gAhqdTMEyznXS14mwfSFYJTvuY7hrkj0TCL4pjHqLNQB?=
 =?us-ascii?Q?nuJyWbX09nE6s+Ov5Q2NZ6j5BrWiN5tziJTnG8uAbPvOZUoLw+tr1f8LSfNJ?=
 =?us-ascii?Q?uK+L/lK8TfwKyUVKj/LDvPyPSqsMIxFBUaS+5/9qSlDRpnhtepnshrlsn+6I?=
 =?us-ascii?Q?d4jg48ZGbHxQNILiBkpkukLlRJ/KORRnpSRbwZ7VE3BV5T9Y874owTOM/YnO?=
 =?us-ascii?Q?bjTWHtQI+6kA/Oya8oKSS0f2HzLdEFz4o80ehntH/cxDcz2nViGg+QlNGbpL?=
 =?us-ascii?Q?xt/dQb/TBk17l/Wt4jmBO4HulW88RGFLWr/PS69sc89oxnS92lOQ7TSDJK5u?=
 =?us-ascii?Q?JXMqmtVqN7ahV9bAkrC0XZLfCSyt32hRTx25ws7R/Ofjmcw9M4mz7TK0cbyJ?=
 =?us-ascii?Q?MeSdc5C9iB4NSEXzrZ7W4vgQfwrTmPndSdMakJvTDUfMIwIyZfsbPIC19kGY?=
 =?us-ascii?Q?nE9UUsgtMHDoXEHh/QrChgFs5W8lqPgHQoWbJaqGUKIQ4ibuOhopM/g0DEd3?=
 =?us-ascii?Q?/numxH4lRN9GasjCl/hc/y/kOVkkGyfEY9Ao0z3UP4NoRRxnR5P77VwMgiX5?=
 =?us-ascii?Q?EIvnnRln7RmnXGe2SyCgXdXsoStBVVNesw85O4kVQxRaYhV4FiumUAyCZUst?=
 =?us-ascii?Q?Kn2+tFg1a5wAOTtyKhG2anKA9jJXn103wew8ArgwMgjBnkP/df3va8VL7KAU?=
 =?us-ascii?Q?KGrhtNH1jFFtsuJXxF0PgiLIHjkjX6OQHlM5qS/FOwWgnm/q/N7bejn8gcMY?=
 =?us-ascii?Q?CJ00hXZg1gjxkqh8DyI=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f231c50-3ffc-486f-7c7e-08dc87167037
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 17:22:42.1132 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g6TPaaOvQtTApeB6k+KygK0KAp0rt4rbazDpdJLJjS+jCzWoLrtv520d+qsCYrW7uZog/5syOCJ1j0E4MHt+2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5928
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

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Wednesday, April 10, 2024 10:55 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for syste=
m
> allocator
>=20
> On Tue, Apr 09, 2024 at 04:17:42PM -0400, Oak Zeng wrote:
> > If applicable, migrate a vma from sram to vram for system allocator.
> > Traditional userptr is not migrated. Only userptr created during
> > fault (aka userptr splitted from system allocator vma) can be
> > migrated.
> >
> > FIXME: The migration should be conditional on user memory attributes
> > setting. Add this logic when memory attributes are supported
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 9 ++++++++-
> >  drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> >  2 files changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index 668984f0769e..c6ba00049964 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -20,6 +20,7 @@
> >  #include "xe_guc_ct.h"
> >  #include "xe_migrate.h"
> >  #include "xe_trace.h"
> > +#include "xe_svm.h"
> >  #include "xe_vm.h"
> >
> >  struct pagefault {
> > @@ -209,12 +210,18 @@ static int handle_pagefault(struct xe_gt *gt,
> struct pagefault *pf)
> >
> >  	if (xe_vma_is_userptr(vma) && write_locked) {
> >  		struct xe_userptr_vma *uvma =3D to_userptr_vma(vma);
> > +		struct xe_userptr *userptr =3D &uvma->userptr;
> >
> >  		spin_lock(&vm->userptr.invalidated_lock);
> > -		list_del_init(&uvma->userptr.invalidate_link);
> > +		list_del_init(&userptr->invalidate_link);
> >  		spin_unlock(&vm->userptr.invalidated_lock);
> >
> > +		mmap_read_lock(userptr->notifier.mm);
> > +		/**FIXME: Add migration policy here*/
> > +		if (xe_vma_is_fault_userptr(vma))
> > +			xe_svm_migrate_vma_to_vram(vm, vma, tile);
>=20
> Agree we need a policy here...
>=20
> See my comments about locking in [1] thinking if we migrate we likely
> want to hold the mmap lock until at least the bind being issued to
> prevent races with the CPU fault handler, at least initially.

As explained in [1], I will continue to use mmap read lock for now. And the=
 read lock only covers migration and userptr-pin-pages but not the bind. Th=
e bind correctness is guaranteed by a retry mechanism and a userptr's notif=
ier_lock.

>=20
> [1] https://patchwork.freedesktop.org/patch/588542/?series=3D132229&rev=
=3D1
>=20
> >  		ret =3D xe_vma_userptr_pin_pages(uvma);
> > +		mmap_read_unlock(userptr->notifier.mm);
> >  		if (ret)
> >  			goto unlock_vm;
> >
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 498b36469d00..8a58fe144a02 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -71,16 +71,12 @@ int xe_vma_userptr_pin_pages(struct
> xe_userptr_vma *uvma)
> >  	struct xe_vma *vma =3D &uvma->vma;
> >  	struct xe_vm *vm =3D xe_vma_vm(vma);
> >  	struct xe_device *xe =3D vm->xe;
> > -	struct xe_userptr *userptr;
> >  	int ret;
> >
> >  	lockdep_assert_held(&vm->lock);
> >  	xe_assert(xe, xe_vma_is_userptr(vma));
> >
> > -	userptr =3D &uvma->userptr;
> > -	mmap_read_lock(userptr->notifier.mm);
> >  	ret =3D xe_userptr_populate_range(uvma);
> > -	mmap_read_unlock(userptr->notifier.mm);
>=20
> Now you won't have the lock here other callers of this function...
> Probably need to have locked / unlocked version or arguments here.

This is addressed in v3.

Oak

>=20
> Matt
>=20
> >
> >  	return ret;
> >  }
> > --
> > 2.26.3
> >
