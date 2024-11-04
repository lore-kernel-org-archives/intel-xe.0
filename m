Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EC8D1BDC0
	for <intel-xe@archiver.kernel.org>; Mon,  4 Nov 2024 16:11:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9915710E481;
	Mon,  4 Nov 2024 16:11:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M2y2sOgo";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C848C10E481
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Nov 2024 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730736712; x=1762272712;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ba5kGJ104kGeYYo6BH703rftHi5z3YI8j1SOMmgsr5I=;
 b=M2y2sOgo5Kpdi2BIKyl+6yVlSWjVAUw60z155GEluoLYNNfc7wcXNyph
 78VgLeMYNfYdzAoQla4VabyoARP9jJlO4rsvx1RF9olHhFsSQBJTLA0Y6
 2CX+pBE6XPBfwzqAt2u/OF8yajZJ+JIuVqut2LqTFMJWVQNwd0k9JIkCU
 wvf9/CPl80B6O0IxuesxM2mrJzOTST6furCkZNaoQiWnGs2q+mA8aCuTe
 WQRsSdVzJAXZKK0kIGrX89zVu2mrRLyNgf9/0tfsLm+HL3957Bg2OmDV7
 PgpC46bgzItNmF8N9fyHt3BFZh5iEw8T+kChXLisxDVnC5ZF/1AWBn7Qk w==;
X-CSE-ConnectionGUID: meqeq3ywQxWX9nTrO5VLKQ==
X-CSE-MsgGUID: ZopoLW2uQEK2MVmhrc6/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30553634"
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="30553634"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 08:11:48 -0800
X-CSE-ConnectionGUID: +5GiujVvQ3q1K+Jn+FWa1g==
X-CSE-MsgGUID: QjTfoqReRxiacSvoqMGk8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,257,1725346800"; d="scan'208";a="88274819"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 08:11:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 08:11:22 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 08:11:22 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 08:11:22 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gqsfdpT1J0xW+jGWAliDdfY1i3TMvpviu4Abf8AypVp9prXJxO+vp6fWWm1na3RIw5gi9vkz6dHUHZSYRMy3JclXjR2ZcgoP5JimeUow2klmP0BOfjoKUL2UY/xSaS6M1SPfjohAGs5mFDH6b8DBHE+SSjzxScLqaOBe+JEU7zrpEqyeJOOB5a0C4GU8qUFMUXcAaZhsJGUsnGNR7QLzhwdRRoGjMrJxV6r0/nFDtTbWrKf3rPsEIew88LxFAsL8uhYACyGV8K8CJPUwo2eOnagMgOxva9RLL/M5kz+B4you9wjEXF3wiaPhp4CKRy4hlZrU8g3PQ0qf5aNSwbWXJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mKl0/sj0V0P8LBNHkvX8IckS7O4hlH1AuBU4vkVYF4=;
 b=p/1Tqut62sKm3aasLvq4/lBWCfnrteHqGsrFuN/9D04iPOCwwuWtHZK1AhMp4qOnNtFk8dXOJjouJnh1IRT0/zMR+NLAIUVA3em4VEcZod4KlukhfJApS4rq/V54qY8JqhtfmxVd/hoEjP+KgwFmGsOybTxCdOAFofH99L42jB3TSO7MjvpI+XaeCPjMa5ZC0Nm3sOJ7h0TytjyGGTwAW6wLaLbci/0QihCxjCDcqlk4QF30M6alUkallIN3Kz/DY/4Q4CIvcZlnVWCyvGvnZq8UmdIsCIwGDvCO3JV1zM+C6fLfMwzq59oZ111UUWiuU4gXk0EcOxvcbhCs84u/ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL1PR11MB5445.namprd11.prod.outlook.com (2603:10b6:208:30b::7)
 by PH0PR11MB7543.namprd11.prod.outlook.com (2603:10b6:510:26c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Mon, 4 Nov
 2024 16:11:16 +0000
Received: from BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161]) by BL1PR11MB5445.namprd11.prod.outlook.com
 ([fe80::b1a1:c6a6:403:8161%7]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 16:11:16 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Topic: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
Thread-Index: AQHbLseCbdhAgrQ2Z0mmFOAWuFiS2rKnO7+w
Date: Mon, 4 Nov 2024 16:11:16 +0000
Message-ID: <BL1PR11MB54450989B36755C082301F49E5512@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20241104143815.2112272-1-lucas.demarchi@intel.com>
 <20241104143815.2112272-6-lucas.demarchi@intel.com>
In-Reply-To: <20241104143815.2112272-6-lucas.demarchi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR11MB5445:EE_|PH0PR11MB7543:EE_
x-ms-office365-filtering-correlation-id: a16a5ee9-823e-4e5e-5eb4-08dcfceb4fbd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?xrGoDaRjeI7BbiJc89C6YyFGTWDJAoQQG+vCq1bhf7+um33cDh2TgHKhg2RB?=
 =?us-ascii?Q?wP2v6R739VFTOEaQbd97otSETVxZIDbSSLek/2HY1PU/BTMnljbn6JoSM5Pw?=
 =?us-ascii?Q?rhWZO7VAf0D5J2xrtroLopgffCk0h/48jjvH7WYxPQFipsQQpIbmBcs4nW72?=
 =?us-ascii?Q?+KMp3E95vPmykb6NVNkMHl8c9uwC84CB64XkUC75FFGL/CSx4+3ESoiKavlh?=
 =?us-ascii?Q?zduqgHCaVUlAwWtZWIGuklirFTl0pZmpQ+wviyX3tnTljDC55VXDCFQgO3vi?=
 =?us-ascii?Q?HS8G2izhabFZTHqaaH/9EVZX/3NAPZPrC0cKLbpUI7AWhGd7YVi/tpV2qxWf?=
 =?us-ascii?Q?fu2SzIbAsfefs48kbHjmJzu+aPcx/pwom54S2qbdNjiGkB5Lexfa5FZS5WaR?=
 =?us-ascii?Q?nnK0EyeqnWJBvr3cCTpRCaFQcg2o0ETskwHbf9c8qTH2mnqkHJaR5AmDjqC8?=
 =?us-ascii?Q?HR/UnGpz6p/fdx6wxZcJlDc78L7/R/h0MRTjaN/MEVnsojrhVbvaytCfjeLo?=
 =?us-ascii?Q?x+ux34lAUlg8gv0IFpqNWTWJZ97cIGtNX8d24jsFuDb+l2QPDNXlvSvHK9rl?=
 =?us-ascii?Q?pWdjpWvoLAj4o7XXJIbDmcqJ7zg/4PrWhBsJ3n5xkbtBHkxAB6pQ9DyDuPcA?=
 =?us-ascii?Q?JiZvgaM5MzUtFX20ZIvX1xDLFCbpe+NZ7UzLbCu9D6f5fhQGtt2apGhGY5VE?=
 =?us-ascii?Q?eO6GGeCIx4RpIHCKNez1HDJEoZ5GmAFs3sbtKeA5LX3KU5jqQqJ1xcySqDv5?=
 =?us-ascii?Q?D5F3EylyyGwLs5b0wEqJgXN0/jQSpbsnNKEWXeRhDWvboV7T1QDcxG+rJxAs?=
 =?us-ascii?Q?OJzB4crZI6Mvy1hA9AJXxeHiVTDBTVlpr858FDb8QZ4wUrIBOp+7URnfLrDp?=
 =?us-ascii?Q?PWly6OZFZfoQkkQLhtevGgjO15ARoTI07OdB4N3SQ0G170i0Hc2DvYvCLiwQ?=
 =?us-ascii?Q?f3kgdUoPsZo2FpkUd9iNEj98eDg6WI0Bm1woLFlqKZyaayFPavUbrpIuEFd/?=
 =?us-ascii?Q?mJbD/VVJh4ue0MNqrS/y1VULswLzv0tqhxiQoBXRsjoYcT9VMP4db7pu98SR?=
 =?us-ascii?Q?hCobDd3JVHj3q08N2JQ0vXz5dX+fke0iNLRhU2s3Lw1Qhq6O4gUhSSKgHrOy?=
 =?us-ascii?Q?06eArUMsSnI9PIvaMGslws3UOLsrSnGuJzI4NTkzwBOGpjU39eLRrtr4o83H?=
 =?us-ascii?Q?wu8sP3HpnhgeH2sELmKn1I5fA7qKq7t4hw3vIQMFvBH90lmclmj9wJcGfm7f?=
 =?us-ascii?Q?yyq59WoxOsbXzohGYJldsfiGtLf9GV/MqeJXOFo4EcrQfuObUk8FPK59YOvN?=
 =?us-ascii?Q?rggsvxvkcfjIjsB1xkCLgbqWRGf5qp/zwi9UToTC+1inBCB8t5kzqca3VZoQ?=
 =?us-ascii?Q?6Pj94pw=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5445.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?W/gIUbADyGTLraMk/JjYH152fo8aQIggCJldZJCuWEpIiTPsKMhapZyNrnPr?=
 =?us-ascii?Q?4tAG55Rz+qfpIU2w5uAwmGsN/HruW37X7nXmThSONfpX5Z8rxrmTySPyT21E?=
 =?us-ascii?Q?TVO3bHB/J7SGm8l2mCjChaYSfGIWv172hTVz05d6JahfbwDC/UriIyLRIhu4?=
 =?us-ascii?Q?J3W1l9y93vFXlXxZZNvrXfABBEKrH6hr1P2ljdBQFUWlnHy9FgaylxZRlUrq?=
 =?us-ascii?Q?gzx4rdnyzQd1VVWdJZ7WxKLRTkrg96DKFOMHFsl0u0zf8Aj+UT7993CZeXSd?=
 =?us-ascii?Q?yAsXXy+7UVG8D7mt/9Ymfst4vUCUsKfjJdpgtM+5hr9esBzdtCnczYiO8YFp?=
 =?us-ascii?Q?5hP3did5UItfKhYGKoeSKbDwXnCDsz2RqONToe3hkDC/iNdZPM0FijlBYgMS?=
 =?us-ascii?Q?340Tkf7MT00D/j6NP7RiUwnOHuaOXlIlRJoocD4tvy1PJ9ZBq3cIbpCSa4XI?=
 =?us-ascii?Q?Ku8MPz5trqllI0kUR6yQencrZkiw9jEKAJAXE2DCVZxKfhJSFsd/Osg8sGsM?=
 =?us-ascii?Q?Lz7/m07tIxWZ5YnWbBYSfXvsMsPu1DZWlJXQ2RG54otc0Q+zx8oyGuT6tCUj?=
 =?us-ascii?Q?a9D7XtcONTUrvWgz+gjSaYOFsyKmGH9lSt8CUqf7bQvmOZGYjl8Fc3TZLyrs?=
 =?us-ascii?Q?ndoOeFhOXBWr1e2h6HKTBPvoUm0IlQfNtjKX/A2rg7ADq/o38iVuz2qIaC8x?=
 =?us-ascii?Q?LiVYUR/6ISfMson7I8jgyzWfL7Uq8ZBPkGggbDgQvQZll51Tgx5104FUHbgR?=
 =?us-ascii?Q?3w9r0AUuG7Akf5PGUYIqoh3tWzMj+RvtiSP8I9i1q2lc6+3PpM99Tg/FRLmi?=
 =?us-ascii?Q?cAuRCLHHHq1re7GTm1Ym+ko8bwBNv1t3vC86Cii/+R2YF/Lhc2+oQaB3QRzk?=
 =?us-ascii?Q?lOnoTdOZVKSO7cDGJebiTUkkbJxgLqJKMtoSm+YHkIgem+sIyJ758SSq6Raj?=
 =?us-ascii?Q?zjstVRy5OEdTCLgLwJCk3zFfqOoM+UK0hhsdvxA+pW/WlDnE89UwvieD11Sk?=
 =?us-ascii?Q?OSVO8QRBg7rKokpR1peOjwqZHom98eFtajBnW/cU7cu7XC9ND/RjOXVhdcjs?=
 =?us-ascii?Q?Kjil7gkkzGTzSIuCF92H29UbeObBi9oA2pxcmkvYYd5SexXQIsntN5wzpB6B?=
 =?us-ascii?Q?mmBbrQk8G8qF5uWeMrbpBo0/R6t4XJgimcBPjMG18NWcHOzs7VsyWzaMTO4B?=
 =?us-ascii?Q?iV78E5yQ8+vc4aRbh2/KmZn5TgQbXQ433P+zkgxJWiDAPdRyU0kU2qXQ/Y5I?=
 =?us-ascii?Q?Dgwi0DakjzV0ONPUCMAaWzjM2BIAluOdL2h6/mfPE326hxVzfflVHU0xjHQu?=
 =?us-ascii?Q?qamQ42TfuJAAy6JfBR6eeaOWVD3uDSLMQ1UNhywuqV9ipW9GFbA9EWntaJi3?=
 =?us-ascii?Q?a6bAO5Hd1Mb1z5HgjCSgpmNk6J20tD8WXOc9u0G5F8a24Umz6NIOZAWqyS+f?=
 =?us-ascii?Q?UP+x6cD7ZBnweLejYXxQyf7SfMqGM/wWOrrT0JqUjy/7CE0tHvd9aiCgwiXc?=
 =?us-ascii?Q?pRKTq//BBgUPI+orCWXRHXuZ59X6ikhsDheIMxAZnQMobXBuQJydtWjX0LKy?=
 =?us-ascii?Q?aW7E9F4MLzAxnyEPW8ETgadSXQwsJVIYdrjkOf9D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5445.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16a5ee9-823e-4e5e-5eb4-08dcfceb4fbd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2024 16:11:16.4556 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +R4n9oYhlQAgHOanwkHfcTMt0rmKfOJdHDSNhbzG6PfWQ2HNS73aOwg+l96aytzvYHuzC9wWqyPivSmHYqfWeO+UFEaYTIfBkrhDXIU9z1k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7543
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Lucas =
De Marchi
Sent: Monday, November 4, 2024 6:38 AM
To: intel-xe@lists.freedesktop.org
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
Subject: [PATCH v3 5/5] drm/xe: Sample gpu timestamp closer to exec queues
>=20
> Move the force_wake_get to the beginning of the function so the gpu
> timestamp can be closer to the sampled value for exec queues. This
> avoids additional delays waiting for force wake ack which can make the
> proportion between cycles/total_cycles fluctuate either to more or to
> less than the real value,

s/either to more or to less than/around

> depending if the delay happened in the first
> or second sample of a top-like application:

Top-like application?  You mean a spinning application?

>=20
> 	sample 0:
> 		read_exec_queue_timestamp
> 					<<<< (A)
> 		read_gpu_timestamp
> 	sample 1:
> 		read_exec_queue_timestamp
> 					<<<<< (B)
> 		read_gpu_timestamp
>=20
> Additional delay in (A) will cause the utilization to be bigger
> than it should. Additional delay in (B) will cause the utilization to be
> smaller than it should.

Maybe:

"""
In the above case, utilization can be bigger or smaller than it should
be, depending on if (A) or (B) receives additional delay, respectively.
"""

>=20
> With this a LNL system that was failing after ~60 iterations, get to run
> to 100 without a failure. This is still not perfect, and it's easy to
> introduce errors by just loading the CPU with `stress --cpu $(nproc)` -
> the same igt test in this case fails after 2 or 3 iterations.

I'd say either specify the failing IGT test or cut this paragraph.

>=20
> Although not perfect, this could be viewed as just extracting that ugly
> loop to "find the forcewake for any available engine" into a separate
> function, and at the same time improving the results a little bit.

This seems like an aside and can probably be cut, though if
you think it's necessary to keep this section to make this
patch more likely to successfully land, then IMO you
should probably merge it with the first paragraph.

Something like:

"""
Move the force_wake_get to the beginning of the show_run_ticks
function so the gpu timestamp can be closer to the sampled value
for exec queues.  This cleans the code by extracting the for-loop
that finds the forcewake of the first available engine into its own
function.  Additionally, this helps avoid additional delays waiting
for force wake ack which can...
"""

Note that by saying it "helps avoid" rather than "avoids", we go
from a full fix to one that reduces harm, meaning we don't have
to specify the imperfection of this fix later.

>=20
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_drm_client.c | 63 ++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_d=
rm_client.c
> index 24a0a7377abf2..874c2157baf49 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -269,6 +269,40 @@ static void show_meminfo(struct drm_printer *p, stru=
ct drm_file *file)
>  	}
>  }
> =20
> +static bool force_wake_get_for_gpu_timestamp(struct xe_device *xe,
> +					     struct xe_hw_engine **phwe,
> +					     unsigned int *pfw_ref)
> +{

This is amenable, though perhaps we should just call it
"force_wake_get_any_engine" or
"force_wake_get_first_engine"?

> +	struct xe_gt *gt;
> +	unsigned long gt_id;
> +
> +	for_each_gt(gt, xe, gt_id) {
> +		struct xe_hw_engine *hwe;
> +		enum xe_force_wake_domains domain;
> +		unsigned int fw_ref;
> +		struct xe_force_wake *fw;
> +
> +		hwe =3D xe_gt_any_hw_engine(gt);
> +		if (!hwe)
> +			continue;
> +
> +		domain =3D xe_hw_engine_to_fw_domain(hwe);
> +		fw =3D gt_to_fw(gt);
> +
> +		fw_ref =3D xe_force_wake_get(fw, domain);
> +		if (!xe_force_wake_ref_has_domain(fw_ref, domain)) {
> +			xe_force_wake_put(fw, fw_ref);
> +			return false;
> +		}
> +
> +		*phwe =3D hwe;
> +		*pfw_ref =3D fw_ref;
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
>  static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>  {
>  	unsigned long class, i, gt_id, capacity[XE_ENGINE_CLASS_MAX] =3D { };
> @@ -282,6 +316,9 @@ static void show_run_ticks(struct drm_printer *p, str=
uct drm_file *file)
> =20
>  	xe_pm_runtime_get(xe);
> =20
> +	if (!force_wake_get_for_gpu_timestamp(xe, &hwe, &fw_ref))
> +		return;
> +
>  	/* Accumulate all the exec queues from this client */
>  	mutex_lock(&xef->exec_queue.lock);
>  	xa_for_each(&xef->exec_queue.xa, i, q) {
> @@ -295,27 +332,7 @@ static void show_run_ticks(struct drm_printer *p, st=
ruct drm_file *file)
>  	}
>  	mutex_unlock(&xef->exec_queue.lock);
> =20
> -	/* Get the total GPU cycles */
> -	for_each_gt(gt, xe, gt_id) {
> -		enum xe_force_wake_domains fw;
> -
> -		hwe =3D xe_gt_any_hw_engine(gt);
> -		if (!hwe)
> -			continue;
> -
> -		fw =3D xe_hw_engine_to_fw_domain(hwe);
> -
> -		fw_ref =3D xe_force_wake_get(gt_to_fw(gt), fw);
> -		if (!xe_force_wake_ref_has_domain(fw_ref, fw)) {
> -			hwe =3D NULL;
> -			xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -			break;
> -		}
> -
> -		gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> -		xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -		break;
> -	}
> +	gpu_timestamp =3D xe_hw_engine_read_timestamp(hwe);
> =20
>  	/*
>  	 * Wait for any exec queue going away: their cycles will get updated on
> @@ -324,11 +341,9 @@ static void show_run_ticks(struct drm_printer *p, st=
ruct drm_file *file)
>  	wait_var_event(&xef->exec_queue.pending_removal,
>  		       !atomic_read(&xef->exec_queue.pending_removal));
> =20
> +	xe_force_wake_put(gt_to_fw(hwe->gt), fw_ref);
>  	xe_pm_runtime_put(xe);
> =20
> -	if (unlikely(!hwe))
> -		return;
> -
>  	for (class =3D 0; class < XE_ENGINE_CLASS_MAX; class++) {
>  		const char *class_name;
> =20
> --=20

I know I've written a lot of suggestions at this point, but none of them
are particularly blocking, so just clean up the commit message a bit and
this is

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> 2.47.0
>=20
>=20
