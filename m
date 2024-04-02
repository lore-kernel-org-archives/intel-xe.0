Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78CBACD1284
	for <intel-xe@archiver.kernel.org>; Tue,  2 Apr 2024 05:32:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1658C10F9C9;
	Tue,  2 Apr 2024 05:32:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JxLJkc8e";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8344A10F9C9;
 Tue,  2 Apr 2024 05:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712035923; x=1743571923;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mSJC/RxrSTSo7J90e9/2sGT/jRWytsKLh7HMSmVIRho=;
 b=JxLJkc8eOUYfLB911T+Ll/VZW/rLDqNi7XfyieHefF8/00NyPgbdQ62u
 grIEd91dWzB/lMu7coeeFoD4bhnsl5B4YJWpTTxf1JRPpNGuNDQJxh+z8
 EIOQ8J1A/QMOVxCx8Ei1rtxHGJ05gkVN5QRpkBIq8yVUj6z0zkcIeYvP6
 X27lriq7anWSBba9gxMwDIPR7SD+fwKwrNuHPgqzdBe/trQTz8+sjPOvJ
 +lC9+O2rxrVLC55ZKLP0GwI/oexzIo9NF/v6EpBumlRm9t67q5UHllz8T
 CzdFgwyP2aiBKeaMs5NntYoRFlG7am7WQqyGuFJdTWD10xaT3RMrgl7NB g==;
X-CSE-ConnectionGUID: HqAQJWL7RJWE7Kjsnrnq3g==
X-CSE-MsgGUID: PNwFIXDFQQSG/W1JKdXJ5Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="24682640"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="24682640"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Apr 2024 22:32:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18028073"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Apr 2024 22:32:03 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 22:32:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 1 Apr 2024 22:32:01 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 1 Apr 2024 22:32:01 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 1 Apr 2024 22:32:01 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DQQgjx4RaitAq08U7ypKouHcfx+cY9kr5Q2nP+FmHqvL+a7TkWY3aU2HhIz201/mxSpaozIVl3aj5vcowROUcEExKSnF3ZdpQLKg1JaOMVog0RVVuh5DYIEj1D19TS1BMz4QRDEzI+dFsrrdCB/ISdM94wQmGMU/P00Vhl3b5g8KOjt6fa83iUtcfojc2sYCmkR6k3nO+E7VXMHTpd0kClQ6hircTzhVrftGmGvHe3fvw7Tgo0e02Oy73FH44Vfb1og6q4l8YW3SRd2x0A+fLQRaFjuEMJAp7hobK33GEvz0BQs2FV7DM0c/v4Jcy5AhYfzTlQ/mI7dR697ZeZLCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qp6HuD5Rpi8xCJEKrJDkH/OekAfrVl0ev4Pl3LebDk=;
 b=VlRXVyc9OMdTTsSMPRfHMXp+k79bxa+eK7J9I5HtfI3tOxNBqtwDiXpoiNo9q4NFKXL9vz4N25b2EE6pk/zml/vhE6qs4M9mffjA6yZ0NtfaWWB23EP5uVwgGgkLz0fqXfS0jUgWvbbmALVgFgYcNNURr7HYkVViORY/MAEvc6IQZkKLmQ3zFoF96ewzwZKXcQPTHTY9v5dZV18U+2xQl3YMGemOUTfkK+J5WG3Wdv8V/si+EsWNU9a/ogBI2MudIhuE2arYHyJYy8Q7jQD5JIVaGxxELsIgHiCl3HUqgCRztzUmpcp+44EZWN+ILo3EKrThUalH+c+RnkWaHpXXbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7855.namprd11.prod.outlook.com (2603:10b6:208:3f8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.33; Tue, 2 Apr
 2024 05:31:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::1604:d970:ed05:4729%7]) with mapi id 15.20.7452.019; Tue, 2 Apr 2024
 05:31:54 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost,
 Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
 legacy mode
Thread-Topic: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
 legacy mode
Thread-Index: AQHahEHoleQQPMgxeEGG8U8gtuHG1rFTkxaAgADiKKA=
Date: Tue, 2 Apr 2024 05:31:54 +0000
Message-ID: <SJ1PR11MB6204471B0104146DA783C21C813E2@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240401144834.577481-1-tejas.upadhyay@intel.com>
 <j7oll4xipndqfcfplyrgjvvdmjylu3blar7ar5lnd5lwhbfvhr@sfl3padlczqi>
In-Reply-To: <j7oll4xipndqfcfplyrgjvvdmjylu3blar7ar5lnd5lwhbfvhr@sfl3padlczqi>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7855:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QUCaISpQ8azO4QvaCHwxZoo/xk7Iifa+dkvuruJqCK1Fik1DHQ+qssuMMCdkDKUk1kwv8KjBpNtRzc+JZ31+r78vKEoWACPzjN24GOUGD8oAK68MoOq9ns/+iRmpcEEY6Of6GfEvSZkSvXRhE6u2wuLY0aLiOYYP1J6hUfd0H7ScEyKU0Ypy23Y6H0InPmLqQQkYzE3im1l8enysLKfHq0PsVjy1U6AI0MfbBvZ/tpa67+W3g3ezMdCTTXTcu0uvoWUvA0yUrEy33U+U1YcpsO8Ya5XPUd7D27DvniWMXTGmruLHRhjcXwzZ/5aV1E5PdcNamO5isoBH/wSeODeb2IuBWQztwZCZ51gyeKqyABWbxOhtLYHaM0tm1NDbau/QFQ6VovY8t2Sm9mHthaIL1uQMpRvbNLIlW4+1ER6QloMt3E1qv2j9cDs+Ed3piWlM0f1mAESc5K5XFQiG3alDON9NrueeAeah2BosMoOtdVABIHF25b5bUmrKq89n8cXA1hLHhMbLLR5tlSjOePaH8uQNKt+ajyDkuAPvnKn3zNSv1Jb4QqOkPvx24gwssUcu+ePA2cD0yC/QVoRdKGdpUVfTwtnLYhON3bKSTgsdT7bo9lczmMM335KybrGV7qkW0fQkpZ/U5Srvju1k/dBi1N7k2fxn3ue+UdlYCxpDC+E=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lPdKXST3a1ShkjOnJMKmAziw7gzxrdGnnc6H58Eian5tZomTQu/0y4hr+/Im?=
 =?us-ascii?Q?VfUnSV3r6Wv/pE3y0RkFMmSf1hKFAHe86frNzrCsXg5sUDU1IET30QsWjWsV?=
 =?us-ascii?Q?A0V1/acM/JWfTJZkuzy3fqcLAwpmyFQZeAi271sfddb+nrRa9X0c6Z9ADiCJ?=
 =?us-ascii?Q?vZV/h5DTHp2rC+R8SBPBBA3fhKJIzi9qjeP9j5caf6aw1phtJPAkcJvdVdm2?=
 =?us-ascii?Q?XWQ+xoDtyxbUT03LL+hc7jeJiWjSRb5NZQMWQ99je4K4xQZFL7UOkTnBkQht?=
 =?us-ascii?Q?MLm5ar4MY3OS0GuHRSW4HaWvwC5aEpZtXLyTIReDI2GdPdpYie4Ir6GEJRO2?=
 =?us-ascii?Q?T9rTgkZJ8DCq+mZqRihD+vojMTmHpeVL+x3RyI5e67OR77tL0SZ6VfOOornR?=
 =?us-ascii?Q?2yjod7c3SLHuexKZh3wwovKUuO44rqgIM3h+wUeooArQplQnX37zFmfabn0j?=
 =?us-ascii?Q?rPB/WvGU/+fm/qoYC4FBDnsRZNARugm0PZnHprgRenz9OKW0tiGniawOE+ST?=
 =?us-ascii?Q?za1/K9Czw2zy0wTfcU1itBU1jWIXmlGADhZhtjJgIlmGlUc71vo8ajGQggB5?=
 =?us-ascii?Q?0l/+dVn5sGzpwgMfs7sONHT9dp029noYdd5i6VIw5doqa/PvDmdnCnuW83ZT?=
 =?us-ascii?Q?7Jt3MyIZxBpLnymJH5qaIYhPJI5mIuWrfK5I7zhrfILO30VXmEXzqukNuaKL?=
 =?us-ascii?Q?/OKq+TDabngU1ZjoZniDrvFR5Yh+bo4K7sZ+EQYYaXJI4JHbcvS046X9ibWM?=
 =?us-ascii?Q?nyNYgCF13uPS4q9GuHzpu/l9PZmSJejm9DLHX9v92iVvSXYKeq5nXopM2BWk?=
 =?us-ascii?Q?Gxe8YFaH6nWYL+8JBZ9Gi1fW8xWlwYyH3QtpDDjUChuD1evCoNepU9cmXgfu?=
 =?us-ascii?Q?keGNynNG5ZClztU4oO+OhKEAwF97cAiaKPH3SiATY+ZldJSnIo9lEeAbhifC?=
 =?us-ascii?Q?B1vKn2laDJ5EnaNb4tGwe7d3MKo92m++ytsZXR+nkgBRAnImolTGdkd9hEn2?=
 =?us-ascii?Q?RrR5p0MsdOkcLBYakaqrIDRM02z1w98dHUnUzN1Z3b0nyJWbYMfR5KWHn+pS?=
 =?us-ascii?Q?0b8Fh/uFVLMPjejtVGSdS9O7XdbEGa1zdtajk2abEeOVZ2WflUTmyMAC8ZDs?=
 =?us-ascii?Q?pMSZDQVHkulh6M65v4pLHVF3yYg0Pdn8RPsOM2HV1dc9z8dheaXkAV5eGNCp?=
 =?us-ascii?Q?FbyDa/Ml0vg5hK/m+9eImHBvxvR+lib9MqVB/kQITuASC182iu6GZ7gOw66A?=
 =?us-ascii?Q?D7hUVscG9fyRUju2tx6OxJTydyPQnKRXnas3xWebSolSPjI6ZCqRc8QrDmMV?=
 =?us-ascii?Q?wsXTjiEEoEY9Vi3qBVQCNbqFAxtYAQh4kOSLnLflg8f7fwnaiMAvFgsTfOQg?=
 =?us-ascii?Q?kfdE/YRgkx+s1mErfBzZ/Xa2SYpGOdu+Nos8s4CzK2Kuudx06SmrZXwAM8dy?=
 =?us-ascii?Q?gDyPlBd1HB1FYyUf+ddFvj+jmg2kIn4r7L10GVHyb93nTbn6mEG+i1YsGomR?=
 =?us-ascii?Q?7KehZZ58ZOKpMdKiBNRmYJj0slVBKgcPCUglQxY3loDMhLollirmj7u4CueW?=
 =?us-ascii?Q?ymQ3ihvNUnraLQ/6fEGwHp3qhJYVZIED6HWDvcCo?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc46b38-545d-4d43-6112-08dc52d6350d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Apr 2024 05:31:54.5853 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ihkPeeXj1xXLA1pOBV0pOPKq2Cwo3kmgbzhwC4eUOxI7DnHtBd1EuwhyCPS+uBNuCCNbsyxP3zDpptq0jCwE8xQqW2DavPLuYY5Orhoe75Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7855
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
> Sent: Monday, April 1, 2024 9:31 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: igt-dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org; Brost,
> Matthew <matthew.brost@intel.com>
> Subject: Re: [PATCH i-g-t] tests/xe_exec_threads: Skip Compute engine for
> legacy mode
>=20
> On Mon, Apr 01, 2024 at 08:18:34PM +0530, Tejas Upadhyay wrote:
> >RCS/CCS are dependent engines as they are sharing reset domain.
> >Whenever there is reset from CCS, all the exec queues running on RCS
> >are victimised.
> >
> >Lets skip parallel execution on CCS with RCS.
> >
> >Fixes: VLK-55941, VLK-52341
>=20
> these shouldn't be here.
>=20
> Also in the title of this commit, what do you mean by "legacy mode"? It
> seems you are just blocking CCS regardless of any flags.

Yeah, I missed few other things also like platform and checking availabilit=
y of engines. I will float second version with handling all of that.

Thanks,
Tejas
>=20
> Lucas De Marchi
>=20
> >Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >---
> > tests/intel/xe_exec_threads.c | 8 ++++++++
> > 1 file changed, 8 insertions(+)
> >
> >diff --git a/tests/intel/xe_exec_threads.c
> >b/tests/intel/xe_exec_threads.c index e9588f9b9..b1c65e1c5 100644
> >--- a/tests/intel/xe_exec_threads.c
> >+++ b/tests/intel/xe_exec_threads.c
> >@@ -996,6 +996,14 @@ static void threads(int fd, int flags)
> > 	}
> >
> > 	xe_for_each_engine(fd, hwe) {
> >+		/* RCS/CCS sharing reset domain hence dependent engines.
> >+		 * When CCS is doing reset, all the contexts of RCS are
> >+		 * victimised, so skip the compute engine avoiding
> >+		 * parallel execution with RCS
> >+		 */
> >+		if (hwe->engine_class =3D=3D
> DRM_XE_ENGINE_CLASS_COMPUTE)
> >+			continue;
> >+
> > 		threads_data[i].mutex =3D &mutex;
> > 		threads_data[i].cond =3D &cond;
> > #define ADDRESS_SHIFT	39
> >--
> >2.25.1
> >
