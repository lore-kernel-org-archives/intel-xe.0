Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6185ACD1288
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 05:35:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC7431124A7;
	Wed,  3 Apr 2024 05:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RljC4Avr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435981124A5;
 Wed,  3 Apr 2024 05:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712122547; x=1743658547;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bSYG9YJD6z9MGN00qzVgzIbMkZz9L8I8hwUIcMqv/SI=;
 b=RljC4Avrw0crIqaWDMkPxKQS2I2k/sqet9WUePUT/fGWVL2GgZImK2aS
 P1x6gALkdk3PNTsZfDdI34v4KAISr6EnO69mhh4oasI5HJvOypa8BPG6n
 Bbi+3N7U3Q8vtsnFGIuqe+1uNXTKcfmqVtNjGvXaoItzdfHLCr1p8TDoS
 IkH9VOwiwRiPoRUjp9+4FXRI47ydaGQYwHwlitRsLs9TJ36ExeHY1nXSZ
 4Se4acr0ncgsIF+9Cs9hZcXSa3AcApTs6CbFWVjjvk4IPc/4zowz6NRBh
 5ikuBS6OYw9KGuOWGqF+7XY9t8hPtutBIy0fGCJProMvFANMZgjDj/LLo g==;
X-CSE-ConnectionGUID: qdnNv+1wTSSKr3q7KCFhew==
X-CSE-MsgGUID: 2Ua+wJ72QL2IuSkahyYjjw==
X-IronPort-AV: E=McAfee;i="6600,9927,11032"; a="18057525"
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18057525"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 22:35:46 -0700
X-CSE-ConnectionGUID: o1pgLXnwSj2UzlRvbvQCGg==
X-CSE-MsgGUID: OQTGJv//T0eC16lEK6tYqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,176,1708416000"; d="scan'208";a="18144731"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Apr 2024 22:35:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 2 Apr 2024 22:35:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 2 Apr 2024 22:35:44 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 2 Apr 2024 22:35:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgs7Q8LU8n6YTJmuMOLynIIMuB6URNoNTvaZJEuXt1T52usSEU+NO1nXMsQ0YK063hP4i+31TL0kqT68E/k3FRqZSK+D3y41iKaWie2SJ9yO97eUlao4MEcYEn6/F+/ymihQxKTEzsJwWlCDsqdNv/X/8n+SZ66iIXBE2WdFvbUBwPKWyzW+6H6xvmbMeO08bDxPePd5fotwutwKme4fXYsVFcq0UpPIXSR40KbUKlog1ge/D9VrlmdTFR4jWmUOVa48gMfPt5saZS0/bs0AKU16qFToVsXFg0HdqFE4fePLI1vYk1wr47cg0fdjpnLU7opwUPNTPHED8gTv84W9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XC7WSW4uH8z+JqWJENObu7cSxusdku20H/9FJxvxtfY=;
 b=FPSqpLS69AALyI1xSe35HjpQNeEw1FrmulJbt/LnYGRurFTJKhYcODmw+iYFxkVMAcQF1a29sYs8fq5n9cbe8ndgfX/MXIJZqlwIiuAzoITe32Omg9QuIoMnCLDmnKEBhrpgcxWLT9Zuw9Rcfe7PWXBLSV/8nKXO9MpC6dWy32dpsaOHhn52jSdqN/b211BJEa5zo0ImMCyDoANw3EIWKxQt37aZ8I+zNd2oOSE8kju6Zv9nBZ5KKuoNftp0X4VKeBKiiRqZPoBD1Zy3QnbfRhc5/URZqe/AcyudxhTspX22eqIYoWl/P7RPfuP9NFARGEsYFQVFUJASwum1wwTLMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by SA2PR11MB4953.namprd11.prod.outlook.com (2603:10b6:806:117::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 05:35:40 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 05:35:40 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Harrison, John C" <john.c.harrison@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Topic: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
Thread-Index: AQHahPafLEfGR8IzR02LuXk/Od8ojLFVYUCAgAAVBACAAIxecA==
Date: Wed, 3 Apr 2024 05:35:40 +0000
Message-ID: <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
In-Reply-To: <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: john.c.harrison@intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|SA2PR11MB4953:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AQb94DIWTwVuomN57YUZVciqd204tUf9oNOGoJDOPNL+SQadkLvpcFUlVB2y7UbmlKhAWQKscYmueD+CbxkWHl+CeRsI4rOcSuLByXo25qxB22958YhTX0PVEjwAcUVsQGCpEn2WIysGtSmFmUSpf7wdHH+YCFiaGVKdmL8xvyGwoHiUasbG2EpkphdRJtbW0cd563Lx2QTaI7yNOe9TXGUOVRUHjNFAl8+vvNxTtWYjeU4zkZDkipr2ZJidJ58JQOKEQRMXnhvc6rLLlc9euSdMLZPZY2TmH81/OO1Dtxe36UOQXfyhQcbyLo0nguDuHgMM5GHzvDLWrKP+XY2DoABtr774RvfzO/p0mQm/V24cvUV0NlWmfdAgEYyzkxSi94Qej2hWRLznXy10D5KW5sYhJk5IMfFE5RMEDwSbhz2x+4FUyC3kY5Flj4xaPKzGmJ/wjjjMj0PlAJ6gVH/t+2fYhLxsFq9OcLQR/n1Kv5gIcre9gdP57XUR8+FIyAik8LezXglzJxyucWUIirfY8KMKhm5pBLwX0JrZVB2I4ynFI1dbt+7WLc69Y4hVZF0ofDmbg6k/JGuZvIqorjcbSLGl+Td0VvqBOS0bVwehkOiezYjSkSTiy7+p1U8XeTiCxfq3jRBs4VBt8fgkC1WZyaZkDh56ulztYbhp3f8OdzE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ieOr+k7pNN3xZavlOjhYDvllkEK47i2TAvWgmu2PAiZkcNtQlfzYA8bvQL3l?=
 =?us-ascii?Q?T+b5X28pRpfIzDzyIxHgfe6CpshcnC6NM5xwWMmgJ0pRGPVpRmZFeFy8Xujn?=
 =?us-ascii?Q?mBj4IW++LsrHzUnrqIVzHkOS1GLxBMnXfZAfg8aUwH9mbHf9ZD0kmkD81H05?=
 =?us-ascii?Q?vk03KSrXhdoecKNN231/o0Sl2oHXlNVpxrgCFeSpeU9Z2viRxZNxN9n982sQ?=
 =?us-ascii?Q?oFJnrVLTjZf6QbcRAHVt2q1ZU+9LSTpwzPOrO2bN1ydNY9gdYliMBknchdoT?=
 =?us-ascii?Q?lpqlNSdJxFuXpagCWdhL4XBAUzkx6YTN0/vNfd3lmkCwk45aB/A4rP0Qas5e?=
 =?us-ascii?Q?1oGZrLmnFN5kg/xp1SgQvCAQDRdoFjYT9KsdsIcIlZU8qnhiNePv6to3UOjR?=
 =?us-ascii?Q?svelpxf/jZHR35HSO+zaKh2fzc1+wzQGcyGX60J6L3u9tHGCVodIU3Unt+dE?=
 =?us-ascii?Q?mn9q0DJCrIUo5vRMd5uiIpzC9PxhthH5JgFpu/pAGgJcvTA3S30qcgu7XSUF?=
 =?us-ascii?Q?p6m4jDIVr5gD2jEDtBWn3m3tPetlvytUOoIXrV5i3oSwjbAIl8GDMgACO7Bc?=
 =?us-ascii?Q?xDGiTI0eQLjmkTOniNCzldqak8DRUnQFRzl3ioqFOtGoKLR2F9obkyQCU2qA?=
 =?us-ascii?Q?017UzJtUYVbecuNFWlWDEbEuW+WuAFR+T7XuxovFt0Qfa6zazA/UplcVGqUW?=
 =?us-ascii?Q?bf9qx5c4/Tg2J2wLmBZGmc9P/hojpg3DMsx4eB3JU65XNuOsd1q4j8M455iD?=
 =?us-ascii?Q?dLkQ7FxkpfTWYXnGqVfZJfnf7mX+dG438Qs1NBB0Wk6G6lTsrHGETX62KRp0?=
 =?us-ascii?Q?zlYS8QeJT6ZkTQ8neORKgb9Zdqw5EkWzWm46NlXAyAdgaKL9LWK3SizdmTIN?=
 =?us-ascii?Q?Uk/PK8+rd+2uPiC3V2ah3Q8q6lDImt7ew9nxWfonW6PH0OGISKoKBa+nlEo6?=
 =?us-ascii?Q?OHO/4qij9Bf0VDbAqpshZ9Js206Qnq3j9JFOQfiSZndxIftvL/G5oIVd8ZbX?=
 =?us-ascii?Q?+/vQ+GOoj4Co8LUU3cDy6SHeo2wFo9I5YaYskhGwfastV7XzM42VKuOs9FRj?=
 =?us-ascii?Q?ygCm+v78HA/5NxJ1FNSVbHCCPWoh81eNhabUpxj40Vllwuftq37qriGnNo+T?=
 =?us-ascii?Q?qMHyg4WbDYF1+upF7MkEd0z9SnQcl1k/Xgovnsw09AIEiN5fMCLf2q75JUz9?=
 =?us-ascii?Q?MrEfdVKYG3HCPtKzfDd9pVPH+alFGqphb0WEjd2GAjRQ0ntIF5NNdWp3UPSj?=
 =?us-ascii?Q?71ZSigEonG52HKyPqrm9pw42uRjRDwMrFVjXd1w3RhCEsU+i8yVlf/tHb6Ou?=
 =?us-ascii?Q?W3Fa/E0capPmIHm2k87JDkBEteDUX5pmAoXAA/p0ZarrDsvuyzRw76/2nEgv?=
 =?us-ascii?Q?uNQynvALN2NvYj3eYQSjj0ZWyO8OvGyoMc6b/8hnabjbRl1lBDIamXjW79ja?=
 =?us-ascii?Q?DcIWZn4n0wFBnIJpzgWavL3FKKtAAh/dUMqc1vd8QgepQlYLLJWRO3x+zkKZ?=
 =?us-ascii?Q?d08n6Cv+Sy3wqoJ5GsvhoLt7AqU1DPhAuLI/OEtCOsc2hB/TXOt3s0KY3Juo?=
 =?us-ascii?Q?GPJAQKjHx36f+C/jAWmqoIclIKE5r23wTvZVu254?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77f4707b-5aa0-4a43-e1a9-08dc539fe645
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Apr 2024 05:35:40.7512 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8rjEwHJUAxz+jgfun/8bH8Ez8Bq5+olV+IsD3BBgIxdeyixjQw0RNVhQhsdjLeagIpGSoY4E/gI4LJuZRF5jD5xs/Sg6578JMFZmqfNjUaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4953
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Wednesday, April 3, 2024 2:26 AM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost, Matthew
> <matthew.brost@intel.com>
> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests rese=
t
> domain aware
>=20
> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
> >On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
> >> RCS/CCS are dependent engines as they are sharing reset domain.
> >> Whenever there is reset from CCS, all the exec queues running on RCS
> >> are victimised mainly on Lunarlake.
> >>
> >> Lets skip parallel execution on CCS with RCS.
> >
> >I haven't really looked at this specific test in detail, but based on
> >your explanation here, you're also going to run into problems with
> >multiple CCS engines since they all share the same reset.  You won't
> >see that on platforms like LNL that only have a single CCS, but
> >platforms
>=20
> but it is seen on LNL because of having both RCS and CCS.
>=20
> >like PVC, ATS-M, DG2, etc. can all have multiple CCS where a reset on
> >one kills anything running on the others.
> >
> >
> >Matt
> >
> >>
> >> It helps in fixing following errors:
> >> 1. Test assertion failure function test_legacy_mode, file, Failed
> >> assertion: data[i].data =3D=3D 0xc0ffee
> >>
> >> 2.Test assertion failure function xe_exec, file ../lib/xe/xe_ioctl.c,
> >> Failed assertion: __xe_exec(fd, exec) =3D=3D 0, error: -125 !=3D 0
> >>
> >> Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >> ---
> >>  tests/intel/xe_exec_threads.c | 26 +++++++++++++++++++++++++-
> >>  1 file changed, 25 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/tests/intel/xe_exec_threads.c
> >> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9 100644
> >> --- a/tests/intel/xe_exec_threads.c
> >> +++ b/tests/intel/xe_exec_threads.c
> >> @@ -710,6 +710,17 @@ static void *thread(void *data)
> >>  	return NULL;
> >>  }
> >>
> >> +static bool is_engine_contexts_victimized(int fd, unsigned int
> >> +flags) {
> >> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
> >> +		return false;
>=20
> as above, I don't think we should add any platform check here. It's impos=
sible
> to keep it up to date and it's also testing the wrong thing.
> AFAIU you don't want parallel submission on engines that share the same
> reset domain. So, this is actually what should be tested.

Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA which helps=
 to run things parallelly on engines in same reset domain and apparently BM=
G/LNL does not have that kind of support so applicable for LNL/BMG with par=
allel submission on RCS/CCS only.

@Harrison, John C please reply if you have any other input here.

Thanks,
Tejas=20
>=20
> Lucas De Marchi
>=20
> >> +
> >> +	if (flags & HANG)
> >> +		return true;
> >> +
> >> +	return false;
> >> +}
> >> +
> >>  /**
> >>   * SUBTEST: threads-%s
> >>   * Description: Run threads %arg[1] test with multi threads @@
> >> -955,9 +966,13 @@ static void threads(int fd, int flags)
> >>  	bool go =3D false;
> >>  	int n_threads =3D 0;
> >>  	int gt;
> >> +	bool has_rcs =3D false;
> >>
> >> -	xe_for_each_engine(fd, hwe)
> >> +	xe_for_each_engine(fd, hwe) {
> >> +		if (hwe->engine_class =3D=3D DRM_XE_ENGINE_CLASS_RENDER)
> >> +			has_rcs =3D true;
> >>  		++n_engines;
> >> +	}
> >>
> >>  	if (flags & BALANCER) {
> >>  		xe_for_each_gt(fd, gt)
> >> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
> >>  	}
> >>
> >>  	xe_for_each_engine(fd, hwe) {
> >> +		/* RCS/CCS sharing reset domain hence dependent engines.
> >> +		 * When CCS is doing reset, all the contexts of RCS are
> >> +		 * victimized, so skip the compute engine avoiding
> >> +		 * parallel execution with RCS
> >> +		 */
> >> +		if (has_rcs && hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE &&
> >> +		    is_engine_contexts_victimized(fd, flags))
> >> +			continue;
> >> +
> >>  		threads_data[i].mutex =3D &mutex;
> >>  		threads_data[i].cond =3D &cond;
> >>  #define ADDRESS_SHIFT	39
> >> --
> >> 2.25.1
> >>
> >
> >--
> >Matt Roper
> >Graphics Software Engineer
> >Linux GPU Platform Enablement
> >Intel Corporation
