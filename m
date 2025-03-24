Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18326C36002
	for <intel-xe@archiver.kernel.org>; Mon, 24 Mar 2025 22:15:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C945D10E15C;
	Mon, 24 Mar 2025 22:15:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RizfqPDo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 524AD10E15C
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Mar 2025 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742854502; x=1774390502;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cXfCixqLxhIfaCmaDPBrBWSrOWtip3P8PGBgfAdS6T4=;
 b=RizfqPDoWdFHH1mIjqoRGHCbjNh6NGC1mX/1bzGxsxIpc42Rt2ZjAW04
 m0v8gAmbr42lBIn/mXX2JBVcNbTW5gNMIBtUoSABWjmdtZSEM5qG3Xq61
 YIrWo+3bsjcsXmnypigLY1DQ5Ldd9k68SbaL284pQFqFY/9jCxiyS5P8W
 SXobsfVrEt7ppS9Xg0ESsy7hF2SaMGLSchhvT5xevcrgGNlIyeY0fBTHy
 8Rb1PmjgRKnZSCm15svIeByByBW9TPAeBVxUoymUpMZR0ieLgB30CZKGd
 Rs1UGw0urnAWOa1SKbuB64PddJChvc+YCiRiTF76iGAo1x9ZxXU7p70ZU Q==;
X-CSE-ConnectionGUID: lUy6FXrIQuWKI5DNyurNwA==
X-CSE-MsgGUID: lEofneyjTm20HlgoPqAzsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61607344"
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="61607344"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 15:14:59 -0700
X-CSE-ConnectionGUID: gVz2cqEsSeGHghf+z99/Aw==
X-CSE-MsgGUID: +aEioufJRNebxmA0QSMamQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,273,1736841600"; d="scan'208";a="155089354"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 15:14:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 24 Mar 2025 15:14:58 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 24 Mar 2025 15:14:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 24 Mar 2025 15:14:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IlG0qdu7YCpiMZeskLUnoR+SWwAN+xVdthMm+6NO4jjE184cHFn3cGCKLGA2B9j8n81AWg0MP3P1fRo6Mo0foQ5E6HPB7Rf9ZpQBZC44yIpmOtFretoakT1ZU1kudmi8UJ1YKPES5HqVvwE1JUYq8gmNfM5YPPlm+lN1FzwgP6+/x9Ltee99SVkD7Yigj4NiNY52mmO76ZravXouMyD6MXy/nnDk6Uu5PzloVCO0sfep2i9VR+Uxxxe5tgGqemXqlT1r4ouv+jEbHpVWmRHnCSvTR2zGlY4GotRRP8+5lxxh5um89LYtt3np5crqOu4vxVsZwJcp0V+Tw6QrsMqWSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mkDldZzFONGjgy2jULZdQ0eiC8imbEtPOttqdQP1yUE=;
 b=la1Qg6fTOKXlKkMnzonVGEcjCHrvw4Dv+oY/2WAHhjm1Rl/kVpN+pt5AHuc9b1HvYZRQ7uQZQwor1eSLdoZMdIbf6gBz2F60wnV0bLXSYpq8o5kwwc5JInER/qTHrRDba9nPtT/46F8PNXqVycoNZebAr2I4YJxca/vhwMsqNFqG10N7AQGZUVtZMkwYnDcRT8+vy3qofV7aV0Dht02ydhTd1C68JoVoOAo2aLgABzIDTJm1MPx979itGfziUhW+A/YDdrNGeLKp2WlKM+oC9/R3to+TDY8VXY6jY1bDK5m0URlCkjN9R86ejsCfpjgzE6Qcs676oJ/iFXEcHs5YMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH0PR11MB4949.namprd11.prod.outlook.com (2603:10b6:510:31::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Mon, 24 Mar
 2025 22:14:55 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%3]) with mapi id 15.20.8534.040; Mon, 24 Mar 2025
 22:14:55 +0000
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>
Subject: RE: [PATCH v3] drm/xe/pmu: Add GT frequency events
Thread-Topic: [PATCH v3] drm/xe/pmu: Add GT frequency events
Thread-Index: AQHbkuRCDo09nh+KqkCZYWjej5lrhLNxnJmAgAyjeICAAO4BAIAAiJ2AgABfQACAAnbMgIAALXkAgAARcYCAACEN0A==
Date: Mon, 24 Mar 2025 22:14:55 +0000
Message-ID: <DM4PR11MB775771A5CE91C519E4C62A1D85A42@DM4PR11MB7757.namprd11.prod.outlook.com>
References: <20250312001408.804125-1-vinay.belgaumkar@intel.com>
 <vx26ng5q4asspsg6lktrj5ok73gbiy3bfg7icu4fybekyt4zad@5h4bsek2mukm>
 <4283fcec-5ddd-4d06-9eae-8e622e9695ee@intel.com>
 <azol66l3wmb6r6cy6kh2j5ooglx25bduwj2ybifdxtpvpej23d@jxw766ana4kv>
 <87o6xsai7y.wl-ashutosh.dixit@intel.com>
 <iizcoecokne5qgkpr7kp4misfdok67eo2scj5czijpo6vqitks@xs3ehyr3kcbb>
 <87ldsu9z1s.wl-ashutosh.dixit@intel.com>
 <bmooz4uz4lutnr3hnbcjj7dltpnlxmctd2unltcde3wxahcbap@htjihczan7ks>
 <Z-G8FXgZY7WnhYTw@intel.com>
In-Reply-To: <Z-G8FXgZY7WnhYTw@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB7757:EE_|PH0PR11MB4949:EE_
x-ms-office365-filtering-correlation-id: 452a0920-de94-4c19-51eb-08dd6b214e8c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?x1wMW9+QLnkhhohaXljFrH5j0aaO5AZ/EkbKsQXSVbG4D13wLBZlaNJKYj?=
 =?iso-8859-1?Q?POEm/b0L2hNHk8AOHjXn/N3XgOjaR6wsevIaGEhi33N4WNZbcTMxvU1f1p?=
 =?iso-8859-1?Q?yJSoYOznSNPf5G8A5zj+ddQMJmplVQ/eYO5UlPa5y/irroisjd2SxsBWlO?=
 =?iso-8859-1?Q?LmXhAKr7X5CLXYWPXAxr870WNtX+S2iODgMun6aURS4fevTuVsBrOHKn/h?=
 =?iso-8859-1?Q?K+AEXIAMvuMAD3oe3AKPkjm9hy9vby22Ml8UjFlEWZHFN9XPKCz4LylrMG?=
 =?iso-8859-1?Q?FaI/445b7brc694PoDg1T5YiSXhgB4P0y9841p0AM86qOAPECoHKGnXT9J?=
 =?iso-8859-1?Q?BHJaJvuMUNtYxGjKU35LPAy7DTgrnt7ECJXXNaVsp9MW9AmmCKYBLlvtk8?=
 =?iso-8859-1?Q?zpLNM6cFNDWDtwblD0n85aHNTYF1Sc9IzBCvx1A+6fN6zJ04XfVRq1ISMH?=
 =?iso-8859-1?Q?VjWH3zlMQfYuIA2M201ZdorjEDD9J1Qch1+VdhPyoov8T7ZM2hzPrmtBRl?=
 =?iso-8859-1?Q?NLRpJ1KFUr5qqWAN0CcZQk1Sjj551J9xm1JSQpoKsTbpRIARPdExyg/3VM?=
 =?iso-8859-1?Q?7UTn7zpYJ46lU3tjvsbWVdEKIvOgMQH+2PGpiTDIe4BFW/MFIQDGg6hUYX?=
 =?iso-8859-1?Q?w3wclXhqc8BH2kcuSwZZJlKB8CFlyDagIV1d1WSbtyVuFUVwnMo5ZTtx0N?=
 =?iso-8859-1?Q?1H9PK5/uoxBR79LEQBa/P0FPEOCVQO1AjR8EgzvL5NfdVoeqH0J1B+VofV?=
 =?iso-8859-1?Q?vlVEMHfv5Bj7TZV02KgzCLBkMcb3Z+BqQUBIfm9cSuBRL+M7qSiaQXNdj5?=
 =?iso-8859-1?Q?7oU+u5ssyxvkADwiilq9epoaS75w2betPwvjEALykeOukUgudDVtYSHCCq?=
 =?iso-8859-1?Q?jPDA5Mx/ubzmm2MIASwmivEUF/vmFDU1K76WIczgR3IeSm+AsMxhkWx18p?=
 =?iso-8859-1?Q?U56M9nEukjos/bp8ptB8Rq+UBmXBbh0bwTOU7buThCpqQTbyDSmwpeZqki?=
 =?iso-8859-1?Q?fpnvsAWLyzuRp0yLujCLb1I24d5UFyJBJ7u291ubPPDPr50FVu6tYJQOwL?=
 =?iso-8859-1?Q?8LDhO13Eg3FIWji9txv11u1LHqxIiBUqKQ/g+MBOTE0sKYxmqXdeHetRAk?=
 =?iso-8859-1?Q?qB0EQF/hD6acHQX8WOWW6kD9piB6BySviFtTINMrZWhKU/rmZwMChN8EcJ?=
 =?iso-8859-1?Q?A5v0mvytHLSFuldCyjd+9qvB9aln8HtHVovRMk+v5HITTpVJxzvG7nR3ou?=
 =?iso-8859-1?Q?oupFqLd4+oKeXYbApmtZRg3UkI9cbpm+LcVG/WNUiYGxNlQ0jv8PiqjRXA?=
 =?iso-8859-1?Q?IHwdp6Rd7sI9aXpULMLkMv4mhJ/yXRC/atEyC1UdiZy4jizatyjH81reU5?=
 =?iso-8859-1?Q?pi9iBrWLtj3qZ3dexsVNpMA+ZEGjH7TaFF+gngZhrV3M0TedL4V2PJShr9?=
 =?iso-8859-1?Q?Uv43NQUXP65sdt9cCjbKWOfkf7cOtvBRr4P9u+1TmFghVnKIFL7jOqHM9f?=
 =?iso-8859-1?Q?c=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JtXnbQpgh/DYMx81l3BX8YuaWui657E60CEK58U7BJPSPEVLMHfDRYUlsS?=
 =?iso-8859-1?Q?CfIzijq/OFXQ/B9fKAh8xznMhiD8oiSj/V82bJpCU9Lq0yBv3+5ctucveA?=
 =?iso-8859-1?Q?51wnkoGJxZ6c2CDtU51QK4ob4qFuhoNXUkFqDaYOEFslzau8WxAdmGid4a?=
 =?iso-8859-1?Q?PCRuFXxnBazbEunnwvi0kgesvmhNwXQCGDjS93D5MwQHfBe1OPCXKrAsQf?=
 =?iso-8859-1?Q?mRyE0O7DcOTNkIPg+GpQscpivEpuq3bYpwodGoGk/LklLAWz+fdkMSdGyl?=
 =?iso-8859-1?Q?BfQc+wZ3x33W6dXN9oyGJPyUJSkfe9TzoaPOBm2nbfCbeDau0JtArzarc4?=
 =?iso-8859-1?Q?DCx5Htg9iaypK4R4J5/0U9GIK4qeKyMHKd9sWVh/osZ/lzjSa1PGoqTTu0?=
 =?iso-8859-1?Q?zPPE5i5NYIYKyGAfkknj8TRGA9+Ls4dME4CG81lYWXN0LecH9KbbeNdVi6?=
 =?iso-8859-1?Q?MzyJCEGdas0ExGAMagVZJ7aKhwtHFPWQeHFsteGwMN6J9BbEA0mXopwVSi?=
 =?iso-8859-1?Q?YzrH3ir7tbEVcZYGiP8dYDjIopWqkESvcxAc53uHEmSC44obNGs4XadsI9?=
 =?iso-8859-1?Q?A22Nf9qLoWnjmhvZiYbVHF3Faq33/14QcZWok42+yfyVR3AZla12NIxUlb?=
 =?iso-8859-1?Q?aVsAOA+bmXHe3dD/jLnZlhZKNNPzSHIr0QoQO210aOR7H2lDeWQDNsZYoq?=
 =?iso-8859-1?Q?dslz9yIScn+a/NJ5vgW1fhb3AeJzgZQmwhSS/BgX+e6xFHOW95O4SNTEu6?=
 =?iso-8859-1?Q?1Dv3StzKrqFOiz6zC/ZbhUzw2iW312BpW9NgKU1wcFlMaPlmx001Tl2Umg?=
 =?iso-8859-1?Q?uJ4huhZSkVQ67YpdMoVQ154dS9njv5wNOYmwQ2o73rx00d/Ig+YmLSW2Yc?=
 =?iso-8859-1?Q?owvuB0OczDFeyHFJu63zv4n9IEg33vQOoWjgpdvXgo6xdogx9kaOX//iDo?=
 =?iso-8859-1?Q?C6HAzBSbE/8DGy4DapHPIzxpdfdr0WicoYztw/kWKOzSEYMgfaV5lacAOj?=
 =?iso-8859-1?Q?WOwY44bnn25ZKG9ZaLPAjkX2BdISblo7Ls378DiUe5WbHJM6wFi69HVvhU?=
 =?iso-8859-1?Q?IIQ3eoeP6QCNHGy0G8dkSAbqzHmoxqg77BGhSDQIfQG+2+ac/nuM1otpuR?=
 =?iso-8859-1?Q?PnsKQ6TMpV50YIk9t1bYrLttWxS6v7WB1Is01HKib6HtvRjMt5weyfQxz2?=
 =?iso-8859-1?Q?HoUiLpgJG5kcjlr3UQeyAPqlu3kpRYvsvoPpityoV9HrESBSvfSlJACPda?=
 =?iso-8859-1?Q?ggQS/KoQivvPj2cr1CjGm5rxNSroDQBl5r962UaxrRSEfgpXiN3r3v+JZ9?=
 =?iso-8859-1?Q?Qw3Idg+f4cKUasXLjfgO+ouR6xQwqr17XJ6VLCnJr1ibZn6qjE7kapp+/B?=
 =?iso-8859-1?Q?+MLf7o9+UqDrKYxKvmLYTbLpFC6cbb1AA7crtF0dtwbdAFZRIeVt3yrMK2?=
 =?iso-8859-1?Q?oEUZX4N6o4JAtevX7K7gha3ZAK8CRkfb595DI++FphqnDbwmYLzft6trii?=
 =?iso-8859-1?Q?lNXSyrEUhpjXWR57UgBv05bS3kZe3TmnNX5fUTaIZSw8zwjUt1+JosO6wb?=
 =?iso-8859-1?Q?QYrgudJvdjvKd2MP9wWonirXnqJHmi6zm66q1a8kWyecEbP3GMHLxfPILf?=
 =?iso-8859-1?Q?iycvWeCMRhNnbpMsJr5gzNHV2B2zOB27Je?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 452a0920-de94-4c19-51eb-08dd6b214e8c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 22:14:55.2025 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OrmRWMGc0tqV6ThXS2RfFrwzAb4f9K4+EbJT31y4EO97k+Q++voJwxdR+jTSjCQT5/HD7XKrfHtTP3nfM3UnqSDUixkgfIzdBDKjkugOui4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4949
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



-----Original Message-----
From: Vivi, Rodrigo <rodrigo.vivi@intel.com>=20
Sent: Monday, March 24, 2025 1:10 PM
To: De Marchi, Lucas <lucas.demarchi@intel.com>
Cc: Dixit, Ashutosh <ashutosh.dixit@intel.com>; Belgaumkar, Vinay <vinay.be=
lgaumkar@intel.com>; intel-xe@lists.freedesktop.org; Tauro, Riana <riana.ta=
uro@intel.com>
Subject: Re: [PATCH v3] drm/xe/pmu: Add GT frequency events

On Mon, Mar 24, 2025 at 02:07:32PM -0500, Lucas De Marchi wrote:
> On Mon, Mar 24, 2025 at 09:24:47AM -0700, Ashutosh Dixit wrote:
> > On Sat, 22 Mar 2025 19:47:04 -0700, Lucas De Marchi wrote:
> > >=20
> > > On Sat, Mar 22, 2025 at 02:06:09PM -0700, Ashutosh Dixit wrote:
> > > > On Sat, 22 Mar 2025 05:57:12 -0700, Lucas De Marchi wrote:
> > > >>
> > > >> On Fri, Mar 21, 2025 at 03:45:21PM -0700, Belgaumkar, Vinay wrote:
> > > >> >
> > > >> > On 3/13/2025 2:45 PM, Lucas De Marchi wrote:
> > > >> >> On Tue, Mar 11, 2025 at 05:14:08PM -0700, Vinay Belgaumkar wrot=
e:
> > > >> >>> Define PMU events for GT frequency (actual and requested).=20
> > > >> >>> This is a port from the i915 driver implementation, where=20
> > > >> >>> an internal timer is used to aggregate GT frequencies over cer=
tain fixed interval.
> > > >> >>> Following PMU events are being added-
> > > >> >> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^
> > > >> >> why do you use "-"=A0 instead of ":"?
> > > >> >>
> > > >> >>>
> > > >> >>> =A0xe_0000_00_02.0/gt-actual-frequency/=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 [Kernel=20
> > > >> >>> PMU event]
> > > >> >>> =A0xe_0000_00_02.0/gt-requested-frequency/=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 [Kernel=20
> > > >> >>> PMU event]
> > > >> >>>
> > > >> >>> Standard perf commands can be used to monitor GT frequency-
> > > >> >>> =A0$ perf stat -e=20
> > > >> >>> xe_0000_00_02.0/gt-requested-frequency,gt=3D0/ -I1000
> > > >> >>>
> > > >> >>> =A0=A0=A0 1.001175175=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 700 M=20
> > > >> >>> xe/gt-requested-frequency,gt=3D0/
> > > >> >>> =A0=A0=A0 2.005891881=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 703 M=20
> > > >> >>> xe/gt-requested-frequency,gt=3D0/
> > > >> >>> =A0=A0=A0 3.007318169=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 700 M=20
> > > >> >>> xe/gt-requested-frequency,gt=3D0/
> > > >> >>>
> > > >> >>> Actual frequencies will be reported as 0 when GT is in C6.
> > > >> >>
> > > >> >>
> > > >> >> I think we need to document somewhere, but at the very least=20
> > > >> >> in the commit message what the event count actually is. Let=20
> > > >> >> me see if I get this right:=A0 if userspace is sampling every=20
> > > >> >> 1sec, and assuming the gpu is at 700MHz for the first 0.5sec=20
> > > >> >> and at 1.4 GHz, userspace should expect to see ~1050 as the=20
> > > >> >> value. Correct?=A0 I find this frequency handling very=20
> > > >> >> different from anything else reported via perf. Other than i915=
, are there any other cases you know of?
> > > >> >
> > > >> > Yes,=A0 user will see a gradual ramp. One thing that could work=
=20
> > > >> > is something along these lines:
> > > >> >
> > > >> > @@ -324,7 +327,10 @@ static void xe_pmu_event_update(struct=20
> > > >> > perf_event
> > > >> > *event)
> > > >> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 new =3D __xe_pmu_e=
vent_read(event);
> > > >> > =A0=A0=A0=A0=A0=A0=A0 } while (!local64_try_cmpxchg(&hwc->prev_c=
ount,=20
> > > >> > &prev, new));
> > > >> >
> > > >> > -=A0=A0=A0=A0=A0=A0 local64_add(new - prev, &event->count);
> > > >> > +=A0=A0=A0=A0=A0=A0 if (is_gt_frequency_event(id))
> > > >> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local64_add(new, &ev=
ent->count);
> > > >> > +=A0=A0=A0=A0=A0=A0 else
> > > >> > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 local64_add(new - pr=
ev, &event->count);
> > > >> >
> > > >> > This will give us instantaneous values and will not need the=20
> > > >> > use of an internal timer.=A0 Should be ok to do it this way?
> > > >>
> > > >> yes, I think it'd be preferred. It's much simpler and don't=20
> > > >> prevent us from eventually adding an avg_* event if the needs=20
> > > >> arise. Which would also be clearer on what that is.
> > > >
> > > > Instantaneous values would show 0 if the sampling instant landed=20
> > > > when gt is
> > >=20
> > > instantaneous values make much more sense from the perf point of=20
> > > view IMO. perf is **sampling** them - other than the same thing in=20
> > > i915, I've never seen an event that returns an average (not even=20
> > > documenting it as such).
> > >=20
> > > What would also make sense would be to support perf-record so the=20
> > > samples are recorded in the buffer that is passed to userspace. In=20
> > > this case setting up a timer to save them (since we don't have=20
> > > interrupt for our pmu) would be nice.
> >=20
> > Afaik, typically userspace calls into the kernel for PMU counters=20
> > relatively infrequently, say once a second (1 Hz). However, if this=20
> > low rate does not yield good freq values (say freq is showing lots=20
> > of 0's), now
>=20
> why do you say it's not getting good value? is 0 not a good value?
> Should the kernel be returning something else instead of doing an=20
> average with "lots of zeros" and returning it?

well, zero is not a good value because it is not real. The register is zero=
 because the GT is sleeping, but that is not the accurate thing.

but tbh we are already taking this decision to our sysfs interface:

$ cat act_freq
0

But well, for this instantaneous it may be good... we just need to educate =
the consumers to see the zero as gpu sleeping in a chart.
but zero is an outlier to the average of the frequencies that it will bring=
 the mean to a very lower levels and the charts collected with PMU will be =
so out of shape to the point it might be useless...

True.  Better to stick with instantaneous value in this case.=20

>=20
> > userspace will need to call into the kernel more frequently, say 10=20
> > Hz to
> > 100 Hz, just to get good freq values (all other counters are fine at=20
> > 1
>=20
> It should be perfectly fine for an application to setup a 10Hz timer=20
> and getting it multiple times if it wants to average.... I don't think=20
> it needs to be at the hundreds frequency.
>=20
> > Hz). This increased rate of calling into the kernel may be ok for=20
> > 'perf record' but not sure what happens to say 'gputop'.
>=20
> oh no, perf-record works diferently... it's not calling into the=20
> kernel with that frequency. It's perf-stat that works that way.
>=20
> For perf-record it more like kernel pushing samples in a ringbuffer,=20
> shared with userspace, and then waking it. We (currently) don't=20
> support that mode in our implementation:
>=20
> static int xe_pmu_event_init(struct perf_event *event) {
> 	...
> 	/* unsupported modes and filters */
> 	if (event->attr.sample_period) /* no sampling */
> 		return -EINVAL;
> 	...
> }
>=20
>=20
> >=20
> > I think considerations like this went into i915 deciding to average=20
> > in the kernel.
>=20
> as you noticed, maybe there was actually a lack of thought on the=20
> matter and then later it couldn't be changed anymore... ? I saw=20
> several odd things in the i915 side. Exposing something with a Hz unit=20
> is one of them.
>=20
> >=20
> > Also, if we are going to expose instantaneous freq, if gt is in C6=20
> > (when userspace calls into the kernel to sample), could we save and=20
> > return the freq /before/ gt went into C6 (to avoid returning 0 freq,=20
> > and returning the last freq as it was when workload was running)?=20
> > This might be sufficient and remove the need to sample more=20
> > frequently, though not sure how complex to implement.
>=20
> if that data would make more sense for userspace, then I think it=20
> should be ok. So, let's say gt in in C6, what does make more sense for=20
> gputop-like and turbostat?
>=20
> 1) read 0 from the kernel and report 0 to the user
> 2) read 0 from the kernel and report min_freq to the user (min_freq they
>    can read once from from sysfs)
> 3) read min_freq from the kernel
> 4) read the last frequency before going into C6

The GT requested frequency will already show us the last requested value. A=
ssuming no throttling, there is a good chance this is what the GT was at. B=
esides, KMD does not control when GT goes to C6, GuC does the idle indicati=
on (since we are using GuC RC).

Thanks,
Vinay.
>=20
> Lucas De Marchi
>=20
> >=20
> > >=20
> > > > in C6. Also instantaneous values are already available via sysfs.
> > >=20
> > > with the caveat of a slower interface, but yeah... that's why I=20
> > > was asking earlier: do we really need this if it's already=20
> > > available via sysfs? I was told turbostat wants to consolidate all=20
> > > the data to be read via perf instead of reading a bunch of files from=
 sysfs.
> >=20
> > OK.
> >=20
> > >=20
> > > > Also, the way i915 calculates the average freq is itself=20
> > > > controversial. i915 computes average freq when gt is awake and=20
> > > > disregards those intervals when gt is in C6. There was this=20
> > > > patch to suggest that average freq also take into account those int=
ervals when gt is in C6:
> > > >
> > > > https://patchwork.freedesktop.org/series/109372/
> > > >
> > > > But it was not accepted since it would change uapi.
> > >=20
> > > one more reason not to fall in the same trap. Let userspace decide=20
> > > if it wants the average or not. If it'd need to sample too=20
> > > frequently, then I think we need to look at supporting perf-record=20
> > > rather than doing the average (which is actually an integration,=20
> > > using the rectangle method, and then dividing by the perf_read=20
> > > delta time). At the very least, rename the event to make the avg expl=
icit.
> >=20
> > OK, we can return instantaneous freq for now and if that doesn't=20
> > work out, add an average freq later?
> >=20
> > >=20
> > > Lucas De Marchi
> >=20
> > Thanks.
> > --
> > Ashutosh
