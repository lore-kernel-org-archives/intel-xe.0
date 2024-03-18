Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A2F4C54E5D
	for <intel-xe@archiver.kernel.org>; Mon, 18 Mar 2024 19:25:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41B2710FE08;
	Mon, 18 Mar 2024 19:25:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ecoZKFUC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65B6610FE08
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Mar 2024 19:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710789944; x=1742325944;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0998+pHCnTsuscr2wSE9UByjOrbYQNDKiMMu+AoU+8I=;
 b=ecoZKFUCQVbVLW7gZYXxffd3XprVN8f8Ok6aL8AEuo3YE3xBEEeAAtea
 jeF9blOY4sIKB4BsXYNv2YACYRyM0hcNSFeJ0YUt6fNgGMkDmXK4f1GC0
 nLxxg9wwHsl6EPbOlQbdSXuDgztSrjMMve8eDwmA0xIIIJ30vYC/bsW0X
 VWvTUQQ2jwIBPVjILLmNm3urpEOtNweUCOkztXabAaIZpdvxzlMw1PWVI
 5/0VUGuYQ3ZtWn7VACdfxVxkTc87+YmE/DRURQpnkeNtoreYR8g/7/abJ
 e8E5Gm1nD8WhZE6G/tAW+loeD1jdpDAeTURSdmPm5YT1bQFxugEbhyCoC Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="5486232"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="5486232"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2024 12:25:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; d="scan'208";a="18039566"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Mar 2024 12:25:43 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 18 Mar 2024 12:25:42 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 18 Mar 2024 12:25:42 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 18 Mar 2024 12:25:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b5a7B0gQx8YZJjpE3JwGMYPDtKcXRUxK+J2A6IY3zS5//PGPzPC1305LqaOTFQDIuu/HgcVNKa/L6qT7KgM/ojtaleuhIgBTm+tPaJYWetVFM/cVXZkNY7nxBq2Dyh9u4Go8ZbRJNIEFhf9s0eu2fi1rv82RuZhIKRyXL21ybzzfHYc+h+7n0Z+oJQztzCznqbfgmDKfY+rvblff9r6xajoBo2kaII0E1dkX3Ja7b4+74PGYBc7aVXwX4dmQYO1w7GMfEEv/4cp5WBnnwHqjOVPCKhC6y2A70CQO5AHRCM1eQjIP9Q5OaianUy+GjkLosst7f1jMgOcQaLXVGMDF5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZNkrC7F7rA4aWt2Vmw7FWY3LisUrdoYSKPEejjzH1o0=;
 b=hsqCBV4v5v8ZBzoA4+QVoMqCfPQgz3KjKniJ40kcPhkZx0eYZRJasypL5+LsA9lWqme/73mUApI51DysbUBjkjQLnz/tYvrJ1KwLu0YNlmIIJ+ZaqKQpWlMYRjYc7OlNbEUAMtKO5RITD859SnF1tKH0HZmihTpGWcY3jsBToWTrVJdfOMggNWeJthWEEH1KV1IvUJoHvu7VG2cAYVwFItdhE0kGnZ4NvG0UfVlUS08IWCJ/zf9nFxNqETtdI5O0hzhDHeK71KIl/qiKW4AWXulkdufaf8pGkPeY7GNrcv4dWOP3X+3BPmtzkSMUwMjlgRZqw5+KyqcnCB34RMG4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ0PR11MB6693.namprd11.prod.outlook.com (2603:10b6:a03:44b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.11; Mon, 18 Mar
 2024 19:25:40 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Mon, 18 Mar 2024
 19:25:40 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Topic: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Index: AQHadb8bBxOarH+uokOgL+zi+HiXOLE3gYaAgAF/+BCAAJb1gIAEUA6A
Date: Mon, 18 Mar 2024 19:25:40 +0000
Message-ID: <SA1PR11MB69913084A8E767458A5D5D0E922D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
 <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69912484F35F776FD70B692C92282@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZfT2841h44bVO85l@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfT2841h44bVO85l@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ0PR11MB6693:EE_
x-ms-office365-filtering-correlation-id: 9b35e563-ad01-4513-f29a-08dc47813260
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rL5we8IrxGr7Pq7MBNHLecqkIas3Q37GAqLcGN+bwts4u8s7R9OCE4DtjnrB+q8cx3ft2S1yoKMtPDNhuIa57FZKZQPuXDL+TOIcRfRY2fQ5XaSluJnYsXiPKkrLBaYmjv+tLz9vnxJnuLz5H5EnRKuuaQglrQ7vFtC+lqVugBo4jIYcve+lJmwXc2pZaZXZ+ZvwVgRNvehY4cN0oaar4LaZ3rim04KchnMEJht6F2V1R0lQvLN0AplYiGHbfvt9es4WjkD2xkpuGFPNK0TaXi95jALWleI/hrAu1ujqvULYmUq+FFPl42eyB1Fea9BuP4aXzwLPQXDERYN7HcLZQAz0q6yxT/YMEJ6QgPjGHGYVGsoMwuN8Z6RkOBl9WIm8KQ26kd63OGIusJLrrIecDClQxxzXRq/HpEpyH/kdCvSUunQctVbl+8mgJoW1EYl1vODyO5gWmMKIf8U8ttHkVOAXhxiMtKHHvF2xYVdjHqjP2x9EBwBks0wzNFwNhAaGRkA5z1/Fu2F3fzN42Tj8RUkqnGpmsqDU0JCCdVsLEc9U1G+l3rbMLvowrVbsZKIDOarf9avpf6gYPPWjkE5wtdOUAvwmZKIPvULQGKeWWr4ERaWgaroJdLucaMkLz2o6Qf2BaHjVQXortlWaFEgAEnpKI6j5lhWriytyUHSW5Q+OrC4vGB8IUKudSfZluptaFomveTCIu5C9owywbqqG8kiBtUnTrqihwMe/8dyaowk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?bRrkuuHTmONh7PcDiuuKyhJ/n48d7Uw8xA6Doyfpo+nohu/cBleIkU9zuwIn?=
 =?us-ascii?Q?JZtol5bADLbZoNDYEuf0Jx3DuEFi63qZXQYB2Kri4lHfoHLRZhF/o5dTS64h?=
 =?us-ascii?Q?o6c3QEXxHpFUubz+iAJcE6AVX9hrfHeb8jbUBbmP8QuP6K6n824YfqgrjNvw?=
 =?us-ascii?Q?McaH/f5vyJI9BrZ2xkKEPTB8eAJEBAU1p7Pd69hvdQtqd8wpwWW41bVAE0lv?=
 =?us-ascii?Q?A4/FlQ82Xjgk2DqIugHzlDCd9hkl8SrKvLzZQHk4Gj8Oai+PVOEl4JWNO+kw?=
 =?us-ascii?Q?Xq2sqNf6ElNyotXzTJIv3g1sglLSSRIhlVcj6dF4/kGqYv5qWaDC2YM2IV72?=
 =?us-ascii?Q?O1P5hyrgNCqaS2Ikhx7m8wWG7kMKHssJ8nzbAXGsr0CEsAdfgLpFOIqJsqUz?=
 =?us-ascii?Q?shNLxcfQCiR3ASQ56yazAtbZVLxyI+c03ixbsvPKuAUQi/ZmbnSLiu2pa+ny?=
 =?us-ascii?Q?CiH9/iw4cc6XOZiucgOluOgoCyzKaXKtkacsChr3VxFHtejFupn0ccI1P5sn?=
 =?us-ascii?Q?Ua0pCe1Xz7ktd0jnuN6Wbdn4HgPaPoTHzPchGXoML69tk8akcrE+5vWkrwXl?=
 =?us-ascii?Q?GHydVDeegH8RscnTJ5/1jO/E6NDGP3sPUooD6EF2lhmmtR94yOOKx53MJCug?=
 =?us-ascii?Q?ow/rgH7lLBvky775t8T8UoZVQtej7FirfPL7TmwZbFDMh9O3VFu/uvNxN15O?=
 =?us-ascii?Q?b7hZOuHI5zaLASA5/djpig4o/VvLKe+Pk/H3CqOOvRTWReeT9NJPID3OL5Lt?=
 =?us-ascii?Q?jdJIbKwlgWeDXGdo5clL5ISJIUHYjLVTtCujksPDXQwxse43yDSyjT4yuH1m?=
 =?us-ascii?Q?Ze2JBKLXMTbL8szYscC07atcsNaEAtHyDBMjWZqRuSQBxqpg61U6Jx5NC+zX?=
 =?us-ascii?Q?pCg2Vo2kxVJHNSuI1McbHf6RUYAagPDbAu5gYEzw1Fjx2Mb9MFwwp2IrOfbJ?=
 =?us-ascii?Q?83BOLYRi2PIfsssMGGmeZgolX0tIffGG9bNlBuUNWT6HBJ4oBWreR/1xR9Ao?=
 =?us-ascii?Q?nOY/71EYqrw85U/9LPQ1jKEfXv4Ha2bzE1RzNgEq0HgN0Wk4qx2Nkdki2SAR?=
 =?us-ascii?Q?0KMB7jQPT7yhWoIYqjwU/BEqZw7ZorlYS9aa6pgwJ5Soj0ncisIJqEy/+6dt?=
 =?us-ascii?Q?2PJupSuprFCOTFn40SJWnWOXhmE/YECE3LeJf6u1Kpt4at0OtSRXDJ4wbd3V?=
 =?us-ascii?Q?mzTf2i8KvtcqRyg2nB0nza+cWwzPmFk+M3n6fBYtZNCyYz6VuwTFU3LfQJB0?=
 =?us-ascii?Q?A5KcoJgH7pba3t8pFc7GDV0xaNTYVWv0wozXKNWnjd40O2V38FiiT7rGK6Lp?=
 =?us-ascii?Q?pIeN9/wg+7lyMyd/Gb9NT0MvxFfhwv7Yrpg11MLYCguacY//RK1ZrdfbAHJa?=
 =?us-ascii?Q?Uk8MrlPuQqt9I0MMIR0FAM7isv8jFOIhvE/aWFjSNPby883wR7/LQuPNzXGc?=
 =?us-ascii?Q?adwjCedNwuJoJC8tveovCsbU2bX1Ei2gzC7qk8zuCm9BDJudEUb+MyjBbq8m?=
 =?us-ascii?Q?EA8ZRLDr0rhQTQKfTSAhwP00NKtR1FUbtPcVCZ38Nj97vKzy88QhBspIy2bt?=
 =?us-ascii?Q?6r5/ihmYj+UAfL30pq0=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b35e563-ad01-4513-f29a-08dc47813260
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Mar 2024 19:25:40.1248 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NioUTfAtiLiQwQUBKB8bxMuUg9ScJu3lXL13h4tyTWnfnHwsKB4CwPdUo2T/xigjQ8PXIgbawPnFe2ekJMJS9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6693
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



> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, March 15, 2024 9:34 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
>=20
> On Fri, Mar 15, 2024 at 11:29:33AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, March 14, 2024 1:39 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> > > <brian.welty@intel.com>; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>
> > > Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
> > >
> > > On Wed, Mar 13, 2024 at 11:35:51PM -0400, Oak Zeng wrote:
> > > > Since we now create struct page backing for each vram page,
> > > > each vram page now also has a pfn, just like system memory.
> > > > This allow us to calcuate device physical address from pfn.
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
> > > >  1 file changed, 8 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> > > b/drivers/gpu/drm/xe/xe_device_types.h
> > > > index bbea40b57e84..bf349321f037 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > > > @@ -576,4 +576,12 @@ static inline struct xe_tile
> *mem_region_to_tile(struct
> > > xe_mem_region *mr)
> > > >  	return container_of(mr, struct xe_tile, mem.vram);
> > > >  }
> > > >
> > > > +static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pf=
n)
> > > > +{
> > > > +	u64 dpa;
> > > > +	u64 offset =3D (pfn << PAGE_SHIFT) - mr->hpa_base;
> > >
> > > Can't this be negative?
> > >
> > > e.g. if pfn =3D=3D 0, offset =3D=3D -mr->hpa_base.
> > >
> > > Or is the assumption (pfn << PAGE_SHIFT) is always > mr->hpa_base?
> > >
> > > If so can we an assert or something to ensure we using this function =
correctly.
> >
> > Yes we can assert it. The hpa_base is the host physical base address fo=
r this
> memory region, while pfn should point to a page inside this memory region=
.
> >
> > I will add an assertion.
> >
> >
> > >
> > > > +	dpa =3D mr->dpa_base + offset;
> > > > +	return dpa;
> > > > +}
> > >
> > > Same as previous patch, should be *.h not a *_types.h file.
> >
> > Yes will fix.
> > >
> > > Also as this is xe_mem_region not explictly vram. Maybe:
> > >
> > > s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa/
> >
> > Xe_mem_region can only represent vram, right? I mean it can't represent
> system memory. Copied the definition below:
> >
> > /**
> >  * struct xe_mem_region - memory region structure
> >  * This is used to describe a memory region in xe
> >  * device, such as HBM memory or CXL extension memory.
> >  */
> >
>=20
> Ah yes but still as the first argument is xe_mem_region I think the
> function name should reflect that.

Sure, will rename it then.

Oak
>=20
> Matt
>=20
> > Oak
> >
> > >
> > > Matt
> > >
> > > > +
> > > >  #endif
> > > > --
> > > > 2.26.3
> > > >
