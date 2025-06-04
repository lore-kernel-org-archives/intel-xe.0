Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9257EC5B552
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 05:25:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C76C10E231;
	Wed,  4 Jun 2025 05:25:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="T8yiN5f+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C22B510E231
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749014722; x=1780550722;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zEee3riBIj6q9mT54Qd1tgZkBfEf3rvG48UzIyapHQA=;
 b=T8yiN5f+8RMhW55yg/nLgRQk2v19q9xbHHC7GqsCuogWeSGOgi3eyIT4
 v4hXuRypr0d4n72v0hlSMsWNTz318qXhPH5BMx9pIhZzW8PgN3BKuG6wv
 72AsXSTVmbmL9jLAWXygE2RrlBl1JjOzKqMbyG22/At0yyp6ak/9P5WDG
 joYlIAwonTir0MAas15fJrCUiY5fDv9nDQjCQLPLPZOQ02x8+t0wbZ90C
 RLpG1j5uv/y+Xcra97omz6j4WVRmffL1Bcb0jc15zmGDuvR/adCcOY87r
 hgwJjSuUunxOU7ET/d3PGCKfTHvcAQG4MuQM+rA6SFjPKCIuEQdceE9r9 w==;
X-CSE-ConnectionGUID: CXVImjQURUeJ6fUmDJPPyQ==
X-CSE-MsgGUID: GosGx7swSf2+Gk2DSl6e9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61344069"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="61344069"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:25:21 -0700
X-CSE-ConnectionGUID: JadGKfaLS4yKWDjltlJrsw==
X-CSE-MsgGUID: 5D8hJXOJQb2sHl1pKPh0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; d="scan'208";a="144956811"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 22:25:21 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 22:25:21 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 22:25:21 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.69) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 22:25:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MGWaabZwPpGUjH6QN0X1fqB21awbz0EM1GBAuCPeLfEO/ezMm5fCjZ1hdEPENJBLyrXKESZiSnXEByUpP8DabVe5paZB8Yf38i7rwiFwE0L0owsrLfgfln2C/jSAixRa9R31rL6Y0ETGFypZThVqegm7qLT80VshlorumiQkUgvY6FRVosMsVmZzjkkjl0y93krQyunyomG9IoAaBTXgEGdvmKRplBOfrerf4l24Srxsezcm1VYpCy/GTUfqzFxAcmw3xBfaJtWEMcFLY2cYeV49ptypkBPDZXIHKRmKJ7V+LpUwX+/GAvmlhafimkJzHdgLzx6pgrTUULhhPIUG4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/+8BWKPG3cynt6MqBaDk8levT0M8pTwNCvlZ8O4Z+k=;
 b=nf6+F3j8qqQq5htiwlIrTOiDI/lN7jgYWAU8cMQgcx72b8Qmx+Fl6PMar8nJmrg5BGVCZQ8obFlxCoFSjYrC2Gm7pVkO350Pes7nPw1JFB6Jtb9CAlktxK0aZCJ21vqmx4hAVNT7Tj5X/uWbg3nzmpDiCGi/dqC53hU3IhE1E83hGc2NOjwmoJMnBdSlBIko7KYajUzldXVqS7i71HnQLxcwDT0l6dzZ919cVHFeMvL0uFSSvfpPjndxXS4XAHT8rgB8k2/xqxvpJPHDxVEPwruMdLBcSn+Vft8vnHWE1Ecu1U+HGM/kNVAGWUkMKAgUaw534cM46Sdtnr9jc5qA+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA0PR11MB7185.namprd11.prod.outlook.com (2603:10b6:208:432::20)
 by IA4PR11MB9419.namprd11.prod.outlook.com (2603:10b6:208:564::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 05:24:38 +0000
Received: from IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b]) by IA0PR11MB7185.namprd11.prod.outlook.com
 ([fe80::dd3b:ce77:841a:722b%4]) with mapi id 15.20.8792.034; Wed, 4 Jun 2025
 05:24:38 +0000
From: "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To: "Nikula, Jani" <jani.nikula@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>
Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Topic: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs with
 no display
Thread-Index: AQHb1AueDyKfPtK4wUKk30yboke+L7PweLGAgABYcsCAAEclAIABQ5mQ
Date: Wed, 4 Jun 2025 05:24:38 +0000
Message-ID: <IA0PR11MB7185E199BA1AC3599471432FF86CA@IA0PR11MB7185.namprd11.prod.outlook.com>
References: <20250602221118.306395-1-vivek.kasireddy@intel.com>
 <20250602224801.GE6239@mdroper-desk1.amr.corp.intel.com>
 <IA0PR11MB7185A38AE8BC13D4B6CAEBA7F86DA@IA0PR11MB7185.namprd11.prod.outlook.com>
 <13b240abd3144e1830bf18d133cfabeca3261653@intel.com>
In-Reply-To: <13b240abd3144e1830bf18d133cfabeca3261653@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA0PR11MB7185:EE_|IA4PR11MB9419:EE_
x-ms-office365-filtering-correlation-id: e6819ef4-88fa-4443-607b-08dda32819e1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?HvPHmqL0aQPPNdaTtJ2AwMv0FaVOeIYDsU86NER37RpqcWtUCB+X9cmHp46/?=
 =?us-ascii?Q?BBnrDjJVFI19soZPJwjhxfJr3ueL7VMzPvDt/hZuOIVzcXKepZxRi28/ByT8?=
 =?us-ascii?Q?EIck9kiy/s/c0kxYA9l6vtAvAkzD4f+wedaMvG0oUL4BvrSJxKy7UolPKHq1?=
 =?us-ascii?Q?veH1kyfrObBKlN5/jJPIvfCapdewYkPUtKttYXVpnGSd57Esi8NaYSGLbVda?=
 =?us-ascii?Q?s4AFfi8kGe5CKwtzUIb9GqY9zNMSYsfVoKHuwFklPYslNFGNgV4gYjHOMZpZ?=
 =?us-ascii?Q?KaAN5t968GhpqQu/1ADsrSEWMnKclsPB8fHsBFlCaO1vs2Hl7X62OvEga29v?=
 =?us-ascii?Q?pAVgGdZhWG/PxfuWgDq+BSSkjLdDQN+82HSZ0LlpBBXjlE/jC7oJe7i/azPv?=
 =?us-ascii?Q?AeUh+lqvMFx+fP+oHVwaSdhZWcRYKWoi0XnmvwQRu7HvZRLzdPLltM30QY17?=
 =?us-ascii?Q?j5hr9j5x4CKo6bTWzecEXmK/WtwXVLfy5MBq2WR/I8p/vQDWigEzS1bXjEqB?=
 =?us-ascii?Q?9qk5gDn9nA2/2pwoAkM078boTwHXLJhhG3aiYl3DGXtdfDp2LoGGbdKYYtP/?=
 =?us-ascii?Q?Y13nx2O/fqGEcZcYtXqY9N0zwBwZwIJ+DeDtyyHxsrBT+MjUir//JGdkowO+?=
 =?us-ascii?Q?tkN6WRg9gfTtsEgtrJaIp1pfMB9NHaUNhfZVRfLQ6rTNcyodCI7m5HDvpQRL?=
 =?us-ascii?Q?WvEvy5VrCJMez3tfskGHO2ua/IuZoZRbukKhlyw7LejmA8fvj67tyA4GKYOc?=
 =?us-ascii?Q?1PvtVYqxGsLZuZQ1R1VJbwkdqeRIPBQHJ21T6wnpjAGcrGkPmraKIBzqXilb?=
 =?us-ascii?Q?641t56orN6Sc3k41TAHPQhAnXH/U79d5K5LJ5bP0lfGUhQ4bjGxfx4ZRl9uL?=
 =?us-ascii?Q?9nS0dGBfrVTTdJOBOrrJh+NPJkFfK2xJvrr0jV3u1vBw+7cmC/bt8nPoZ1od?=
 =?us-ascii?Q?8NIoAhtrX3dgoxmxZb6+uyXwp5Rh7TY5CEcxLC1HeGi95cPvDs+MKyDTOUVh?=
 =?us-ascii?Q?1dY4XK/dtjnT4/jB5ln9C2Wn/yKmSG7htKBbc3OhostSfrzmKqbZ5/frDhMC?=
 =?us-ascii?Q?sGKrnDJswpr/kAvLQPEkmUsRDUjp/mmofXVqQonZk8BTO+GnPe99AxW50gXA?=
 =?us-ascii?Q?PCnZUnpAk5WrCadohwfk1mBFHxhOs2XRL6DkU3rAu8NZ+6hgJBy7zyAcuQOt?=
 =?us-ascii?Q?TjaZsXbg/udHJVdGRMVobWwpVQZdt0+4XQleCgBA1yV/0E/RW9Xs16xohOJm?=
 =?us-ascii?Q?ylnEGoWm7ll3pmbH0ENPXXfkS4AYGGKZZwLNadFLEWyK1C3MMeClyKNvGHNK?=
 =?us-ascii?Q?bmwJeKRzoHENLKb7M4hiImiF+Nk3CUEu1LrPh+jiAlJdKf1FJA49sLptSJPu?=
 =?us-ascii?Q?g+1wVg8P2lsfU66pkhQ5cpIVUUUoBlWaXxGv3d6GUJAtIE0i4tOQUk3HLeaB?=
 =?us-ascii?Q?ZJwNPtOo+okHP1kG6nTkgnNJ87ohtWTI3Fl9vgfbyNIBd+wkFEHfPA=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?lG2PGiJkQzvBBhFKq1qmQHmf1hUVuH70puKXveWy+x73Sx443Yf26K0tDfik?=
 =?us-ascii?Q?mooilPe2hI0sDxU6hxJPedJO83AEcLHce9pGjT6cYzu1cOZJ0/MI4q/Qcd31?=
 =?us-ascii?Q?ypuodgx42bRwPf0hJSZsbl9LKt3e6cqsaaxdExhOVgRT32c0rfBg/E+vdJvB?=
 =?us-ascii?Q?vigL+CdKQcOCMyUZg4tafZx5eTYwKQGZMLwoTex6fdhV0L88sUBhqfCUcoDK?=
 =?us-ascii?Q?Mo6M80Z5bl9T7v6DcsfyBaXnUBprGvY93s28OuuGGW8k998SxFCvVuUtUVYM?=
 =?us-ascii?Q?k+FKMTx2yC11yxHX+wwPtqrwiDjsFw42g39Ue40j8jrFTQHQqbsFd+YJZBG7?=
 =?us-ascii?Q?afXGJXot/ma3/3KW+YhNf7xj4PZev1jyQqYNS4BNSuyKM2tIwhvJIIQKujxf?=
 =?us-ascii?Q?YDiNEXL44lan5CrjOx2XsgI+HDFCte3QClYwfkoAiZRK2rWPafiBfJaoFROc?=
 =?us-ascii?Q?jjZ/7NzrfFVoFTm2eFfFiiRLBZSVk3sUH88p1VkA/RMPaB4gNJL1U4BBNPOa?=
 =?us-ascii?Q?vTT37LuCWcdARc71ev8VOgJeTLWtR3SBppxWzHutz6RuCCTywmCGzHhFvWIv?=
 =?us-ascii?Q?LwcOALgsc/CVtyez+vWhcpwIv8X/jN1Q2rUkey/R7DICKnLP5puodajmYfDD?=
 =?us-ascii?Q?CyNJO6ZAHXNIHf8V5tMuYk4lEggz5zN8Bp9s/9rKfuTsLuFAIXj73HGlA1kk?=
 =?us-ascii?Q?o6Kd7XF2yBv++YFJl8ScrbZSC+FNaZk40Q3RGTvZnj2z8DzR5eXsMQBiow8F?=
 =?us-ascii?Q?4WUfSNXs6ILipzvjzQiwQFE+k7SEPquTt9hQyNX05p8FfbZon79adRGMePl4?=
 =?us-ascii?Q?i/JPNAqt0c7AB4Sx6VuatIB/hOph/+xh/ELAQrhCG5sw0E3y9D0sFuk16xAm?=
 =?us-ascii?Q?iiV8c9/xlAxKfyfbLBiFiANu+iSvVL0FLGIEGiKfQtfsNntixZhQqx5cSRLz?=
 =?us-ascii?Q?u9rjZP62TSfi7s9H32L6logoZu/A5WbuORPZcBt1utN1y9ImwOsj6fchGIKO?=
 =?us-ascii?Q?OuA919icXw2YiQSB0Hel32qAZH05ygNbvgxL+3TFgpVr2B2ZuzpRKXjpEv4G?=
 =?us-ascii?Q?NZR0xUMWxFChgIsmF1fAXdVNkrG/WkTaJMEQ5yBVmkxssAepQW2YjbMDIr4N?=
 =?us-ascii?Q?vaw8OwTYYuXhXWsopmoZ3gHf04c8s8ycISK7FOXNRcNlkRNzSkWrgPQjcYuz?=
 =?us-ascii?Q?iBMwo2CEp9lT4iKJ83rwTnaepA3Ghfnd8UilBZkJcU2rcTSQ9/qEe5dfmFmh?=
 =?us-ascii?Q?uzujqhkHn2R06dVQ5cNuKxm6fgCSs4ZQ7jIcL27gn0bgcYexAoU9Q1l0skrM?=
 =?us-ascii?Q?mvivjJJHm7yDnMh0iqGgGE2sdJcWW59Iy3JXSk6twqsveLazQEN1SgtIYMiX?=
 =?us-ascii?Q?Tv7NRUtqTiq9Y50wbONiTdhtu5ogdh9AJ3ATRsIG5QAHyCbC55+cCcL24rfo?=
 =?us-ascii?Q?1sYwVjsNR5u5EyySWBhz7+zK52Jfd8JKKAPA4l7XSwNA3LfD4K1lrq2Gdn4F?=
 =?us-ascii?Q?sGQpNcmJrJrejZfPngARzqCEiDVRtl+89lVNAcpeBgfUV/TSbbHOdGE+2iej?=
 =?us-ascii?Q?wN/23lsEhIC31sRXF1I4xphDn5gPnRrbpS+EXrIq?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6819ef4-88fa-4443-607b-08dda32819e1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2025 05:24:38.4297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: niGKX3R5/xHT5TDCOtXXYY4idxl+A2g4m5xMtBdW0TTelygdBEd1VZbk52RxEGh2f3m2lCL7/9iN3Mlr5poqZa4n0hQs2GL/teTX0DC/8k4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9419
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

Hi Jani,

> Subject: RE: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SKUs
> with no display
>=20
> On Tue, 03 Jun 2025, "Kasireddy, Vivek" <vivek.kasireddy@intel.com> wrote=
:
> > Hi Matt,
> >
> >> Subject: Re: [PATCH] drm/xe/bmg: Fix NULL-ptr deref during probe on SK=
Us
> >> with no display
> >>
> >> On Mon, Jun 02, 2025 at 03:11:18PM -0700, Vivek Kasireddy wrote:
> >> > Some SKUs (or variants) of BMG do not have display capabilities and
> >> > are intended to be used as compute-only devices. The Xe driver is
> >> > expected to work with such devices by probing/initializing all
> >> > other capabilities except display. However, the following crash is
> >> > seen when Xe tries to load:
> >>
> >> Can you provide the full dmesg log?  It's not clear exactly what "no
> >> display" means in this case.  What's making the driver think there's n=
o
> >> display?  Display GMD_ID reads back as 0?  GMD_ID is normal but all
> >> pipes are fused off?  Something else?
> > At-least with the BMG SKU I am testing with, GMD_ID_DISPLAY reads back =
0,
> > and as a result, probe_gmdid_display() returns NULL.
>=20
> Hmm, do we not have BMG in xe CI? Why did this not blow up then? Did I
> miss something?
I suspect the specific display-less BMG SKU I am testing with may not have =
been
added to CI yet.

>=20
> >>
> >> We already support other platforms with various flavors of "no display=
"
> >> so I'm trying to understand what makes this one different.
> > It looks like this is a regression that is caused by a recent patch. Sp=
ecifically,
> reverting
> > 5a9f299f956e ("drm/xe/display: use xe->display to decide whether to do
> anything")
> > also seems to avoid the crash.
>=20
> Right. Xe sets
>=20
> 	xe->info.probe_display =3D false;
>=20
> for all no display cases, and uses that in subsequent checks.
>=20
> i915 OTOH retains non-NULL display pointer, and uses HAS_DISPLAY() for
> the checks.
>=20
> I don't think the patch at hand is the right fix for i915, and will need
> more work. This was also not sent to intel-gfx and thus lacks i915 CI.
>=20
> This might be the minimal, safer xe fix for starters:
>=20
> diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> b/drivers/gpu/drm/xe/display/xe_display.c
> index 3f92bf51813e..87262acc9513 100644
> --- a/drivers/gpu/drm/xe/display/xe_display.c
> +++ b/drivers/gpu/drm/xe/display/xe_display.c
> @@ -538,10 +538,10 @@ int xe_display_probe(struct xe_device *xe)
>  	if (err)
>  		return err;
>=20
> -	xe->display =3D display;
> -
> -	if (has_display(xe))
> +	if (has_display(xe)) {
This would still not work as has_display() uses xe->display; which is only
assigned below. Replacing the above check with HAS_DISPLAY(display)
will work though.

> +		xe->display =3D display;
>  		return 0;
> +	}
>=20
>  no_display:
>  	xe->info.probe_display =3D false;
>=20
> ---
>=20
> The alternative is to revert 5a9f299f956e ("drm/xe/display: use
> xe->display to decide whether to do anything").
>=20
> No matter what, xe and i915 need unification for no display cases. Xe
> oopses on display being non-NULL for no display, and i915 oopses on
> display being NULL for no display. ;D
I guess we need a short-term solution to address this problem, at-least
for Xe. So, do you prefer the revert option or the minimal, safer Xe fix
you shared above?

Thanks,
Vivek

>=20
> Further comments below inline.
>=20
> >> What is the
> >> actual NULL pointer you're hitting here?
> > I believe this is a bit vague, but inside xe_display_flush_cleanup_work=
(), the
> line
> > spin_lock(&crtc->base.commit_lock);
> > appears to be causing the Null-ptr-deref as the crtc object holds some
> garbage value.
> >
> > Thanks,
> > Vivek
> >
> >>
> >>
> >> Matt
> >>
> >> >
> >> > [  115.582833] BUG: kernel NULL pointer dereference, address:
> >> 00000000000005d0
> >> > [  115.589775] #PF: supervisor write access in kernel mode
> >> > [  115.594976] #PF: error_code(0x0002) - not-present page
> >> > [  115.600088] PGD 0 P4D 0
> >> > [  115.602617] Oops: Oops: 0002 [#1] SMP
> >> > [  115.606267] CPU: 14 UID: 0 PID: 1547 Comm: kworker/14:3 Tainted: =
G
> U
> >> E       6.15.0-local+ #62 PREEMPT(voluntary)
> >> > [  115.617332] Tainted: [U]=3DUSER, [E]=3DUNSIGNED_MODULE
> >> > [  115.622100] Hardware name: Intel Corporation Meteor Lake Client
> >> Platform/MTL-P DDR5 SODIMM SBS RVP, BIOS
> >> MTLPEMI1.R00.3471.D49.2401260852 01/26/2024
> >> > [  115.635314] Workqueue: pm pm_runtime_work
> >> > [  115.639309] RIP: 0010:_raw_spin_lock+0x17/0x30
> >> > [  115.662382] RSP: 0018:ffffd13f82e7bc30 EFLAGS: 00010246
> >> > [  115.667581] RAX: 0000000000000000 RBX: ffff8be919076000 RCX:
> >> 0000000000000002
> >> > [  115.674675] RDX: 0000000000000001 RSI: 000000000000004b RDI:
> >> 00000000000005d0
> >> > [  115.681775] RBP: ffffd13f82e7bc60 R08: ffffd13f82e7bb00 R09:
> >> ffff8beb0c1b06c0
> >> > [  115.688869] R10: ffff8be7c034f4c0 R11: fefefefefefefeff R12:
> fffffffffffffff0
> >> > [  115.695965] R13: ffff8be9190762e8 R14: ffff8be919077798 R15:
> >> 00000000000005d0
> >> > [  115.703062] FS:  0000000000000000(0000) GS:ffff8beb552b6000(0000)
> >> knlGS:0000000000000000
> >> > [  115.711106] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >> > [  115.716826] CR2: 00000000000005d0 CR3: 000000024c68d002 CR4:
> >> 0000000000f72ef0
> >> > [  115.723921] DR0: 0000000000000000 DR1: 0000000000000000 DR2:
> >> 0000000000000000
> >> > [  115.731015] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7:
> >> 0000000000000400
> >> > [  115.738113] PKRU: 55555554
> >> > [  115.740816] Call Trace:
> >> > [  115.743258]  <TASK>
> >> > [  115.745363]  ? xe_display_flush_cleanup_work+0x92/0x120 [xe]
> >> > [  115.751102]  xe_display_pm_runtime_suspend+0x42/0x80 [xe]
> >> > [  115.756542]  xe_pm_runtime_suspend+0x11b/0x1b0 [xe]
> >> > [  115.761463]  xe_pci_runtime_suspend+0x23/0xd0 [xe]
> >> > [  115.766291]  pci_pm_runtime_suspend+0x6b/0x1a0
> >> > [  115.770717]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> > [  115.774797]  __rpm_callback+0x48/0x1e0
> >> > [  115.778531]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> > [  115.782614]  rpm_callback+0x66/0x70
> >> > [  115.786090]  ? pci_pm_thaw_noirq+0xa0/0xa0
> >> > [  115.790173]  rpm_suspend+0xe1/0x5e0
> >> > [  115.793647]  ? psi_task_switch+0xb8/0x200
> >> > [  115.797643]  ? finish_task_switch.isra.0+0x8d/0x270
> >> > [  115.802502]  pm_runtime_work+0xa6/0xc0
> >> > [  115.806238]  process_one_work+0x186/0x350
> >> > [  115.810234]  worker_thread+0x33a/0x480
> >> > [  115.813968]  ? process_one_work+0x350/0x350
> >> > [  115.818132]  kthread+0x10c/0x220
> >> > [  115.821350]  ? kthreads_online_cpu+0x120/0x120
> >> > [  115.825774]  ret_from_fork+0x3a/0x60
> >> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> >> > [  115.833768]  ret_from_fork_asm+0x11/0x20
> >> > [  115.829339]  ? kthreads_online_cpu+0x120/0x120
> >> > [  115.833768]  ret_from_fork_asm+0x11/0x20
> >> > [  115.837680]  </TASK>
> >> > [  115.839907]  acpi_tad(E) drm(E)
> >> > [  115.931629] CR2: 00000000000005d0
> >> > [  115.934935] ---[ end trace 0000000000000000 ]---
> >> > [  115.939531] RIP: 0010:_raw_spin_lock+0x17/0x30
> >> >
> >> > Therefore, to fix this issue, we need to make
> intel_display_device_probe()
> >> > return NULL if it does not detect the presence of display and ensure
> >> > that its callers check for non-NULL display object before probing ot=
her
> >> > display related capabilities.
> >> >
> >> > Cc: Jani Nikula <jani.nikula@intel.com>
> >> > Cc: Matt Roper <matthew.d.roper@intel.com>
> >> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> >> > Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_display_device.c | 5 ++---
> >> >  drivers/gpu/drm/i915/i915_driver.c                  | 4 ++--
> >> >  drivers/gpu/drm/i915/selftests/mock_gem_device.c    | 4 ++--
> >> >  drivers/gpu/drm/xe/display/xe_display.c             | 2 ++
> >> >  4 files changed, 8 insertions(+), 7 deletions(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_device.c
> >> b/drivers/gpu/drm/i915/display/intel_display_device.c
> >> > index 1d8c2036d967..c9494cbf5ba7 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_device.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_device.c
> >> > @@ -1705,9 +1705,8 @@ struct intel_display
> >> *intel_display_device_probe(struct pci_dev *pdev)
> >> >  	return display;
> >> >
> >> >  no_display:
> >> > -	DISPLAY_INFO(display) =3D &no_display;
> >> > -
> >> > -	return display;
> >> > +	kfree(display);
> >> > +	return NULL;
>=20
> I quite dislike functions that return distinct error and NULL pointers
> for different cases. It should probably return -ENODEV for no display,
> and callers can handle that as an okay condition, instead of special
> casing NULL for that.
>=20
> >> >  }
> >> >
> >> >  void intel_display_device_remove(struct intel_display *display)
> >> > diff --git a/drivers/gpu/drm/i915/i915_driver.c
> >> b/drivers/gpu/drm/i915/i915_driver.c
> >> > index 3b0bda74697d..0bf8125aee8b 100644
> >> > --- a/drivers/gpu/drm/i915/i915_driver.c
> >> > +++ b/drivers/gpu/drm/i915/i915_driver.c
> >> > @@ -757,8 +757,8 @@ i915_driver_create(struct pci_dev *pdev, const
> >> struct pci_device_id *ent)
> >> >  	display =3D intel_display_device_probe(pdev);
> >> >  	if (IS_ERR(display))
> >> >  		return ERR_CAST(display);
> >> > -
> >> > -	i915->display =3D display;
> >> > +	if (display)
> >> > +		i915->display =3D display;
>=20
> Right now, i915 has never been tested with i915->display being
> NULL. It *will* oops.
>=20
> After that's been fixed, and it may be a bunch of work, I think this
> should be something along the lines of:
>=20
> 	display =3D intel_display_device_probe(pdev);
> 	if (PTR_ERR(display) =3D=3D -ENODEV)
> 		display =3D NULL;
> 	if (IS_ERR(display))
> 		return ERR_CAST(display);
>=20
> i.e. returning ERR_PTR(-ENODEV) instead of NULL from
> intel_display_device_probe().
>=20
>=20
> BR,
> Jani.
>=20
>=20
> >> >
> >> >  	return i915;
> >> >  }
> >> > diff --git a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> >> b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> >> > index fb8751bd5df0..cb1928d52869 100644
> >> > --- a/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> >> > +++ b/drivers/gpu/drm/i915/selftests/mock_gem_device.c
> >> > @@ -186,8 +186,8 @@ struct drm_i915_private
> *mock_gem_device(void)
> >> >  	display =3D intel_display_device_probe(pdev);
> >> >  	if (IS_ERR(display))
> >> >  		goto err_device;
> >> > -
> >> > -	i915->display =3D display;
> >> > +	if (display)
> >> > +		i915->display =3D display;
> >> >
> >> >  	dev_pm_domain_set(&pdev->dev, &pm_domain);
> >> >  	pm_runtime_enable(&pdev->dev);
> >> > diff --git a/drivers/gpu/drm/xe/display/xe_display.c
> >> b/drivers/gpu/drm/xe/display/xe_display.c
> >> > index 3f92bf51813e..027690e4992b 100644
> >> > --- a/drivers/gpu/drm/xe/display/xe_display.c
> >> > +++ b/drivers/gpu/drm/xe/display/xe_display.c
> >> > @@ -533,6 +533,8 @@ int xe_display_probe(struct xe_device *xe)
> >> >  	display =3D intel_display_device_probe(pdev);
> >> >  	if (IS_ERR(display))
> >> >  		return PTR_ERR(display);
> >> > +	if (!display)
> >> > +		goto no_display;
> >> >
> >> >  	err =3D drmm_add_action_or_reset(&xe->drm, display_device_remove,
> >> display);
> >> >  	if (err)
> >> > --
> >> > 2.49.0
> >> >
> >>
> >> --
> >> Matt Roper
> >> Graphics Software Engineer
> >> Linux GPU Platform Enablement
> >> Intel Corporation
>=20
> --
> Jani Nikula, Intel
