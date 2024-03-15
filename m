Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E1C1C54E67
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 17:29:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3BF1123D6;
	Fri, 15 Mar 2024 17:29:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J3rrAInf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCEA81123D6
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 17:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710523778; x=1742059778;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Dczfh374Bnq59xpmTzWdVUpltw+Dgg696MCKll5LN2k=;
 b=J3rrAInf4EO/k7kbZcXqgwruWZP3of0dyrhZuZlLixSWU6qPcauBbGwO
 bH/d/e37u3BPcZPw8Wj23/fqSyUhbb3JvB3Vq1b5fA2WPqA/W2qO6GMbs
 oUSf+TmAN8QktIuqOU/Nfv+57httb22DeQuxbhxsmo5Pg0SffAID9XxHq
 wtDyKkxWrIdWSN3loJYJkYNUOZobymPU4ohvlkcNcahjOoVFoUsOFJ/IV
 J1hSd14PkoifVtg7ND/ShcW5ASsOgE8r4t+bpmunp2YODJLVNdl5kRlkM
 l+WpTtKIznQKFI4DljA/+RmsSesQmyD2tdlX3b8L+WmAL3nF862mfG6D5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5540285"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5540285"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 10:29:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="12693951"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 10:29:38 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 10:29:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 10:29:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 10:29:37 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 10:29:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MnnbC0NgU13cPb3lYAqBkMC3/ugXSP6FSKkqCYeS4XjV2iemZ0VGEEv8cXdOH26L8qBjNMhBJYHwX9ZHqHpuIsHboqXmF00Mvm/T0kPiudxW0hfKP3UWj4FppzIzCWXL3R74gWR5NUHYIoTcdyHJy0AOnvtSifT0d0jnZunBLDHo9m9JVhh2e3ElY03F2212Mrs9FTGaA70bBPxGmqD7ZpnevDycZ4WXpFjl2ae8CJT99SqLe09uVtBRq49mAvABoPMxGh2VTjYoy1+13i4YRW+2Ex5nY997wbW0IiCKdnWZMBiUjaLkasfkU+E/QFOxftaYHcXWLsyO6MlAb2m15A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NZ7b87NLSPgB7AdzXx0lTWGdVId512UlZXnCvLy8qDU=;
 b=fmVPuXCcsjHiqCG9239TCbcTZ83ScmpCqcxYtMJ0D76fMsvtiiaXOoxDMGep86xN3QEtkccwShXnjsXpgY3tnJvawsjQ3DJ6IErmSGn3ZMSy6GqGeqgArXOvzN3ZvCaCz1GfNWgBYKUDKYdjwi10hsJGt8FasbSFdjaJyefrwDsdHe+UUmlv17PbhzIgm+XCLge8Hmdh1VqHIrlknI2JLU1AryzZqm4d6Xl+uwCyJAvuKzhYkv6zZLM7vhsrtG+THvNjJpE8jDORb0v9T/NC1hyJuq5w5AgOqwhKl6rjT/35OumrtYBB7K8R+o6SIsC58EzB3fe+tdPHsnpTW1spcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH7PR11MB6794.namprd11.prod.outlook.com (2603:10b6:510:1b8::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Fri, 15 Mar
 2024 17:29:33 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Fri, 15 Mar 2024
 17:29:33 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "airlied@gmail.com"
 <airlied@gmail.com>, "Welty, Brian" <brian.welty@intel.com>, "Ghimiray, Himal
 Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Topic: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
Thread-Index: AQHadb8bBxOarH+uokOgL+zi+HiXOLE3gYaAgAF/+BA=
Date: Fri, 15 Mar 2024 17:29:33 +0000
Message-ID: <SA1PR11MB69912484F35F776FD70B692C92282@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240314033553.1379444-1-oak.zeng@intel.com>
 <20240314033553.1379444-4-oak.zeng@intel.com>
 <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZfM2OYmQ8/XiT7/D@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH7PR11MB6794:EE_
x-ms-office365-filtering-correlation-id: 7aa937ff-db07-4956-990a-08dc45157aeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: CryFhxuappvGybQYRIKGJr40qemBhiK7pu2xV6Bn0J3ifd4QtkZYszE02gaczGOsp09kAjj4FwqLAzxL4Myr7xmbJUp3wKPIV60JcrOXrUq/rTL+r/19kXDxL+pvFW1/Eiw4yukzEhQixATLKxZGCNCbB1qC5QJXJf3JeWOgJoJt0d2fBNT1SiQsaSy3kMVLHSKr2UB3dgl1kz/Yn4bz4V43G8KLIvOlzzeahTasjMaIcRygFmu2iUDQYpxokNERmLm3VWKTgPPk4zQUlZB81h1P/41kQ8lxvsLftVitSYz7jBuOknIuxW6BsRTxVaRuxM+3zvjZE6vf+lGPIpN4LLJ8OvyH5JkO3kPSKCB6PKpcxOSrMqMcuWFk5bcioGblcsAyFhWF/u00/axHM4qGOI0zOXZOEe7iD5dIbHKv0KZAVkGoFqFSch5raDhgMQLiK3448BR5Auy84vGhYFwH0R6W39ysJpc0JU0cxoihnyLWbUdpCr5POvTDcrEG1rSg5eerprTZOuG88cRFxGpka+mOKkunoEqnGiuo7Bf/ZY/raTKMIYbyHwKnXDGjMTOqkDlPrCEEWuiciSmwdrrGwLBx01+SNgVJqdPvPeOGu69V3FdB60j3VsLjaGwJy+EcG0Upy3NKTWZDhCnpQQIHIgmRqcb7sfysyqID+dKywYDHXeh+ioI4eFRBMntMN1yopCoxeVqsZNOoGVMkJN/8voUBm0DrutjHYGa09SwITx0=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dFQPcA+j2H53xv7mi36pNVZlH6WFge9jI/PTXLmLSgDKBWmzJiJP2Zgxo6ik?=
 =?us-ascii?Q?9NnRMCGPX5XwfvXgS1xWgpgwMqP/b2rFjoNdP9WHVa+cTlp595Vbxk+HkL+t?=
 =?us-ascii?Q?eD+DJYBSG3s+G2xNFmeiRE6N3YjFZIZJsulAfTmEafBa2u/gD0Ta8HFepTtR?=
 =?us-ascii?Q?ffNrvDyWZ3Lt2SgGg21ToeGerwZjkoc8PPA5ygDxDWQHhLeWzBm50NORzO7f?=
 =?us-ascii?Q?v8tG260jfQ8aOMGVGtWXLz87Oq1v5r3CN3MlcRydjFmzzYfOB7qkApkE8pjb?=
 =?us-ascii?Q?hwxl4R9Nt85XxG+c9LQP9rozZRGE+YkTh5YRrkpXSIaTjYLINzkLdHl9NjCL?=
 =?us-ascii?Q?sEes7mtYiWsDsk2bAKYVLBzV1xsIz5kmR7iRr/gVBmc4EGoXzleheDNu8wBx?=
 =?us-ascii?Q?DgbuB5f1pE//Zfpmyz4wvoPGtqwCZExW3eMjBFb2CG3bLj+WFi+RuIybpfft?=
 =?us-ascii?Q?+SjQmA+1qJ74z3PmCKkmGI1/1q9QKM4kZJv8h/9d4fF6vIXUG5mAPYLpUVf0?=
 =?us-ascii?Q?tyxajLOfNwl3wzGMaSDnI22CTdfFxClA5t8hkV5H+bMBCGdnBzo7YERq8bJg?=
 =?us-ascii?Q?2HPkjFgbmLW0VMi6oh/UaaiLP4P7oOQ9uguXwTNhbmKYaetTTrE9vPM3Qj/j?=
 =?us-ascii?Q?rtn7rRcyvSpnTsT6YVGk+q7gcMsmIsCn1g4eNrfW2xdJMOhBd77C21tBvEmu?=
 =?us-ascii?Q?TX6baX/2jP+Ll9TqSK2seCAt5/3n1q88d+PVxkfl731/S1IUbT8j2qaVlmFs?=
 =?us-ascii?Q?lYRTNCJxMnmF+OToB0CUJ+ZKSdPVaWgv70JQX9oB99TdY73G9qsnWQVLF1en?=
 =?us-ascii?Q?BR9IZvlM6s4TJi6sg7w/Fbw7ps7vKlBfl6f2rTz51s/lbcoqCbmclR2jwV/k?=
 =?us-ascii?Q?EHHtznu+gO9ib07a9ycsxzqGpEu3IeIVa1Pn2PHlMmEp6toA1mK4Zm25sh7f?=
 =?us-ascii?Q?zzL5h5sjU8IAiubUAM6kNQAwheBOhTAx4iUfTqGwhIJjgHKmQZfsY0k8t8OC?=
 =?us-ascii?Q?rOX0ZdAD2PBXghcQDJPZCBFbeRknvwqQ0M9eK+tCWvPgryt1deE1+/z21oFs?=
 =?us-ascii?Q?HT+2lEuJ3kLt8yTEsWwlIfZ8X8C0yqLsb0j6phPhk6IjMao0bw+Gav5vuzix?=
 =?us-ascii?Q?Dnt2FCMl+f85kleQKvqypEbOt4sAVNX3wHfdlEfO9N/Jd8wwybLuKv7YZf7b?=
 =?us-ascii?Q?I8HKqmu1TYMSxathJree2pfYh3ZrDJ0t9ULzEXHTRLPz1jNynS3yXV1tF3Ch?=
 =?us-ascii?Q?xlH8utz+z1LndfJRphxgA/3oI29j8lafuNX9Tp7S1H8sXaJIAUZOds83NHHn?=
 =?us-ascii?Q?VufRkwmUywtsmL0SfUFnzSMOR27B9jN7COlPueiJbipZSPW/9tFQAz/dyX3v?=
 =?us-ascii?Q?kR4LqBJj2rlRVcg3i/yTPkc/JXVGkR5r/JBSZQ8ssI6aYKNtosDAKImK8x+/?=
 =?us-ascii?Q?BnHS+kVksQXzM0U/2u85gvM67x85kRxGM4Z5HNEMEWOGiq1TuCRFh8n93Ns5?=
 =?us-ascii?Q?e7XHq+BOxOx//4sH6ohD895hhCqoiRqafMQirimfOe+gActOn1M1PGpur4Cw?=
 =?us-ascii?Q?REaxXfJ7aIuO2KYzbqA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa937ff-db07-4956-990a-08dc45157aeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Mar 2024 17:29:33.8452 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dZs/17h/6gPd4zTx3VbDHBcWwa47kuLViRvNgeL0FxEeaWSksi89KdsisFBifty3QK6HRocQ+KK8IcfPYgy+Mw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6794
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
> Sent: Thursday, March 14, 2024 1:39 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; airlied@gmail.com; Welty, Brian
> <brian.welty@intel.com>; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>
> Subject: Re: [PATCH 3/5] drm/xe: Helper to get dpa from pfn
>=20
> On Wed, Mar 13, 2024 at 11:35:51PM -0400, Oak Zeng wrote:
> > Since we now create struct page backing for each vram page,
> > each vram page now also has a pfn, just like system memory.
> > This allow us to calcuate device physical address from pfn.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device_types.h | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h
> b/drivers/gpu/drm/xe/xe_device_types.h
> > index bbea40b57e84..bf349321f037 100644
> > --- a/drivers/gpu/drm/xe/xe_device_types.h
> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
> > @@ -576,4 +576,12 @@ static inline struct xe_tile *mem_region_to_tile(s=
truct
> xe_mem_region *mr)
> >  	return container_of(mr, struct xe_tile, mem.vram);
> >  }
> >
> > +static inline u64 vram_pfn_to_dpa(struct xe_mem_region *mr, u64 pfn)
> > +{
> > +	u64 dpa;
> > +	u64 offset =3D (pfn << PAGE_SHIFT) - mr->hpa_base;
>=20
> Can't this be negative?
>=20
> e.g. if pfn =3D=3D 0, offset =3D=3D -mr->hpa_base.
>=20
> Or is the assumption (pfn << PAGE_SHIFT) is always > mr->hpa_base?
>=20
> If so can we an assert or something to ensure we using this function corr=
ectly.

Yes we can assert it. The hpa_base is the host physical base address for th=
is memory region, while pfn should point to a page inside this memory regio=
n.

I will add an assertion.


>=20
> > +	dpa =3D mr->dpa_base + offset;
> > +	return dpa;
> > +}
>=20
> Same as previous patch, should be *.h not a *_types.h file.

Yes will fix.
>=20
> Also as this is xe_mem_region not explictly vram. Maybe:
>=20
> s/vram_pfn_to_dpa/xe_mem_region_pfn_to_dpa/

Xe_mem_region can only represent vram, right? I mean it can't represent sys=
tem memory. Copied the definition below:

/**
 * struct xe_mem_region - memory region structure
 * This is used to describe a memory region in xe
 * device, such as HBM memory or CXL extension memory.
 */

Oak

>=20
> Matt
>=20
> > +
> >  #endif
> > --
> > 2.26.3
> >
