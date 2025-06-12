Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8EA5C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 19:53:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BF410E1C2;
	Thu, 12 Jun 2025 19:53:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AWqrz8n1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5641C10E1C4
 for <Intel-Xe@lists.freedesktop.org>; Thu, 12 Jun 2025 19:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749757983; x=1781293983;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2EG5EXsBqBxptqhRtoSATOmPGWYO600zKyzM++b86rg=;
 b=AWqrz8n1mWOsnTa9lvW4OZ5pprNThE3uY8axvZTK3OrWaREFHOUfe3TV
 y1BTfYmF4ecWSFFrGzT+YvwyUGAnNhbZa660ack8XGie9XlcxE7GGQiFC
 nV8Rv8SNh2BUJIqEbowieYeYvfIGxiXrUkzXsS0/OljrE8t58bvVcbXsJ
 JcLX/S0xSUFwz3dY5Feh0v3fDwNqFvtWkld6XwPH1yxd/vFHnjQqi+Piv
 G2zhrKG6SekBqT9WPHiVq6LLYcZU/tHRIVqAooh0CUla+kZeYruGpCcQc
 uIaUoefw3COx0dHqWRYzCxblMM64D+Ow+NHeHTMdcdPGnBRUIXpbCay1+ A==;
X-CSE-ConnectionGUID: u0OuMTw+S0uWHmX2EfwCdw==
X-CSE-MsgGUID: w0mtPuyRSxSzC6lwRDVgKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="69400694"
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="69400694"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:53:01 -0700
X-CSE-ConnectionGUID: /XEFkabPS72nMkv4IYCQZg==
X-CSE-MsgGUID: MviQiuoBTQq2fb41Nqca9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,231,1744095600"; d="scan'208";a="147499208"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 12:52:59 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:52:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 12 Jun 2025 12:52:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.88)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 12 Jun 2025 12:52:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFTvoVX2hGpE0E56E1opKy7htm6NceUIfxijr0Y7askEnv3z6/J91YB8CXBPaIYdFJTELRp9FDucAbEM5fhmkTwgNNnFJ3mj5q/pGdSW/UnSnKYLXKxJ5XCXtiokfX7RKwazLMNzxjPBB10x9Vp4RZr0z7vuksSG3ywOxY3bv/BJamlpzKHYv358X14aOtH6rZr+yCxyTWrbpwChiNoCeg0RZ23azRgUAVYFtinWTz3cBnT2+DxZm6RRHcvHGPlEV75FWFlnnrK6XknsynRr99vZncGl06dK7BDB+skf96KyvhWD+IXCNR7E2ALHFBesIAZybKxa2uPoWhU/Nz2qSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TxvRyGNOuSrekJ+kos+O/Etu1rYiWthe/IiUA11UC+I=;
 b=jE/vVxBiQrO6WnzLZRIIJCqP1Bc0G5VTptQrqGNv8bBRLAhuW9fCZpVM0bYP/liot2JByv41csenmlqNtV+Jns/IrcONHNgurMpmFJAdDHoOu8AowU4VQMlcTUkHqeYqkVzXRjItqnQ1mrvAgAW59KRyM+89ZRekzCcws4rXwsExyyAAEd3Xc/7YXXHvxvS0Ou8wP2mTygbgl+GG0oEc9h9FnBik7fwUYSz4rnxe5g+m0phJf3F+wA/7417L6cEPC7zRm592+SsunYvg5MU71kScu0vTfkUw093M7kIAbQT09vzaVltu2o9tOZq9YAbGiWf0AIn9xNwxNmHeOPO5eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SN7PR11MB7466.namprd11.prod.outlook.com (2603:10b6:806:34c::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Thu, 12 Jun
 2025 19:52:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8813.024; Thu, 12 Jun 2025
 19:52:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Harrison, John C" <john.c.harrison@intel.com>,
 "Intel-Xe@Lists.FreeDesktop.Org" <Intel-Xe@Lists.FreeDesktop.Org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Topic: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log target
Thread-Index: AQHb2xS1G6L4Gnmrj06JQMCG4b4JFrP+fC9wgAAmsgCAAPFNQIAAOmQAgAAAXICAAA+rAIAABoVQ
Date: Thu, 12 Jun 2025 19:52:55 +0000
Message-ID: <CH0PR11MB54444D7178910E4E0EE1E0AAE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
 <20250611210553.3756700-3-John.C.Harrison@Intel.com>
 <CH0PR11MB5444BB01251782688FECD0E6E575A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <a47f94c7-7677-4945-ba4e-cba894428472@intel.com>
 <CH0PR11MB544461EFF28E40A16C84A175E574A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <f466922e-2884-4e42-ad64-4d1ce063b4fa@intel.com>
 <CH0PR11MB5444E69BE6FC406E515DC61BE574A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <733f6db7-ce2a-4f67-9c66-d44702a03ab0@intel.com>
In-Reply-To: <733f6db7-ce2a-4f67-9c66-d44702a03ab0@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SN7PR11MB7466:EE_
x-ms-office365-filtering-correlation-id: 453fed1e-2d88-408a-75fe-08dda9eab976
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?vR1N6DO9d5MGY8wWJzz46ObzMJCHH190tUehqdtI2SDJVSTqn7ttQA0ff2Qm?=
 =?us-ascii?Q?hemdLhnz+dLL7c/rzuCfwlf0+tBU2OBzKMXfnINlqg/5JO2+XxyAcELAxrpM?=
 =?us-ascii?Q?8aztVl7DJKeJUiY6Fy1Mp3iRpKGPxnfiYfF6y2SFnW6yrD0NonlHWb69iDZ+?=
 =?us-ascii?Q?+M0/Dpov4EGwzQt7qJTKdnq3xi8EWruoQrK5pct97GbqsUZGqXXiQhaybj/S?=
 =?us-ascii?Q?AwhqdJrJX7pGcMl4TaXzH9nDTQO5P1wpUWCjlkdEAifBTCA7Awpmt1HVuM1G?=
 =?us-ascii?Q?/Ny+ocXnbPzP9g0PVeqVeOJhO0JDikC5BLn24xTiCVUZml6JzwV9G3+TI9IV?=
 =?us-ascii?Q?Ijs1bUxviomKgOC6IqmJaWbZNfVaNy9DNagERb9FOBMlArTeItE88f5KmFVj?=
 =?us-ascii?Q?qVbixslP9KLwVNVU3YZLowk9gQB1Yod3ZifDrg82qeYtJ0dbBY92IMfNnA1G?=
 =?us-ascii?Q?S/U4m1HiwkC/C5GXu1vSfNagHlEUhIqXizS2TLDpbPiwRtK3VReV3mHD60Ba?=
 =?us-ascii?Q?IlQY3oTaxKumm3geKZqp+RpMBtH9qpNj1zeR+U48pOEAIVmB+SLUPkdvMHHF?=
 =?us-ascii?Q?Zlr33hPKPmYu8/rfuBE+hCbCzaWVc/vQ2vLBIXeQGdb1NomSUsClbgrgNk0r?=
 =?us-ascii?Q?9jydYonQ9GYPBZOSWD68Ix+YmsLcU5W8Sgg8jDPSLC28aiDZ75m4jKuPAGYX?=
 =?us-ascii?Q?hRcYnCJMMq+XyR1jPqXVrkulc+yk1ukQIlSS/NEfXR9GGbVyXE0PZeGX2kkd?=
 =?us-ascii?Q?JnMbB50/B9fI2L5wHao0JF1/gaI5dVQranTBxHoMzK/v7w0vDBhhmWseDL/Z?=
 =?us-ascii?Q?1a8jfFUUzG7mqVPHHSCuWzUA+JQxZm3mroD8y/RuHEGCKQNlY4IXR6n4gKK/?=
 =?us-ascii?Q?O0rtOHkIx4/Mhw9nsMKnCblocQa/onbKN0lKVpGmEWcyWaJaAt+VzQzrRFs+?=
 =?us-ascii?Q?9pTyDucZrWrHS72tfBlaqpKWnBeT999yUSxM7m7GFMA97mzgABrZfZFW4Nik?=
 =?us-ascii?Q?IrFkszOIUddgOyI9LZSRxBx2bkJk9ZynHTOZ6Fqc1AwlZ6e8WoK3w8p3nOAj?=
 =?us-ascii?Q?SDaqXAvLG4GO/tjSNpEgInOBzW+/cpVoh9PHc7GRLQA9wgkQ5XunIBNx/hv0?=
 =?us-ascii?Q?IVzbMZR17lrtodlsIF+M5tl27Iy0jZMYrl3fcticb4KzfoqR02P+ouHllMju?=
 =?us-ascii?Q?ZTJCD4qbUixlbQenEWfN9ksHEgTVw5UFvJvTihgPOcgnRO56DcS564itIANd?=
 =?us-ascii?Q?G6ohzGcSer6g4Caj8FPfzQW0iiOD0n1QEBewnO7SrD/o03pho5o0ZcA4Z2nM?=
 =?us-ascii?Q?GkS8K7oizYmMZ4mh7M5c6ZT+pcI8AzWjNaZx0SiUUrOBDA+plQuTF0TLN4J8?=
 =?us-ascii?Q?mJ1yg7+cHLh6PaXA+DnlBGMr+rP+dXk8kkv9NG4hf2QwUU7nlCzgJrEyTKFO?=
 =?us-ascii?Q?08S9bmQvX3EgwIOU8QtQnmGWYpqptoMDMKDmQ8E31AD0azwaKT+g3A=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xbFHeOMlSHnqjU3ldkTrG8cr0dHO1T8MDDAtRIQBiNlg5XGB/SUxOCmy1lPu?=
 =?us-ascii?Q?0jEEQr9kuSfwFwZ8rUGdLD+F484F/X7mEveomm8nNph/Nrwmq0rtRDTdhtDt?=
 =?us-ascii?Q?BqWlpmaudY2p+C5j3W8N8s9EsXPsafJypxVmQRpEFWctIOzq7hjq/RiqUMQl?=
 =?us-ascii?Q?OeqaptebKHki9VBpL85tMOFtzBGl3WRgyvXuPhpQTQY0+Vgj7fY9H55btNPv?=
 =?us-ascii?Q?5XkVL38G6xAu+AqfklR72WHQt2BBCG/qFCe7YmGrXrLdz/GfKc2j3i00HT3U?=
 =?us-ascii?Q?dryROhNEyETiVtw79SlTRVsA7Ex0lv+tzUamgQAxTedkEY7GW5jUAYFc9g6g?=
 =?us-ascii?Q?NOEZF70dZfb1qFK88tuu7G82GceJXMmW+9nyh+fpNyXetR039bNKAc6YDEu/?=
 =?us-ascii?Q?lz+YLz/6iUjHL+tQzpciEl11bhptch9Pr1UbxWFYiIscK0u2gPCD5onPZ0Fl?=
 =?us-ascii?Q?kbPtaKXjUp0UBSJ+MkuAXWIGuGhllbHep2TCEe5G0JfAlaL7XGin1o0dknDT?=
 =?us-ascii?Q?hG21loVOrWhcNK3owJiJC9+uBzbPaTkqzo9W8rFlOCLs/bQsIWdiQmzaqnnf?=
 =?us-ascii?Q?e5B0tyxHNAe2Z4lVOz/dj/vVE8Stmv+xfttjTOjSsUc2/OsljCrcDpSh1Ipw?=
 =?us-ascii?Q?6Fc5PZDcGd1QCVCQ/p0SvZxgrwUbvcj1J143GrAO6Bwg61NXUMCsgdlWF6Ka?=
 =?us-ascii?Q?D2fpgNQ8wIqyvV79LBHBZ9MRjzGP338tR/NtWTQxLj2uKgn0rVwTrRLo1wTh?=
 =?us-ascii?Q?tDC5AsC/me3apKAoq3mP7NNOzutqqaJJxv1tNbTtmpbrX9OhYfav3dp/mvoS?=
 =?us-ascii?Q?6VCQhQFzvCvIJEndgcoa6ouaLZyVWrb2gFWh61Ptd7hmK+CQ6qlDOU2onw3P?=
 =?us-ascii?Q?HYay73MUDRknYyM9+0dB+ESL6IAojelllE9iQhryweBmdtMYCOlX6g+yXlXX?=
 =?us-ascii?Q?Ck2Y0Gsd+/Vo/qCiZoIXXbpN81iu7JFSrnXqAXbIwnlTBPdLH6z4Nn6ppKbd?=
 =?us-ascii?Q?l++Ot7SD4RXK2EJBN46IH5A8utLI0eThy26J8sayfJ05fDJQEpJYLgfhmwBH?=
 =?us-ascii?Q?3oLdcItmMVpU/jbwHYCrTbMGuOtjTohjPG8lzg4sFTZg6QrBGiDwJSlYrR+K?=
 =?us-ascii?Q?mVJla2ZMHvzAHYY5xjlLW7z5JrnNfLRUv9viL/DbkV1jL2pwG5myZmIj8tGJ?=
 =?us-ascii?Q?65gqdeqW+hyZOQh1Gm4T4REzFZrcqFESy1NCbK82azmHW6iAL8MEpCqoGsDs?=
 =?us-ascii?Q?f2hZvNqKI1Zkv+HM8jr4l7tmHLXyb/GxQqhI6AK4reBEy2Yky/IEwmBu4lLi?=
 =?us-ascii?Q?QLuJWetdTlVBXaIRh/GpUAuOGF5Wdz4ozucVjo/HqLtTpF9U4tREwhgf3d2S?=
 =?us-ascii?Q?oVpdBDfABCHJ+SK38EPHNaef/oXLU6AZQK5gmxASgthIckgQpsWUSIaNFajI?=
 =?us-ascii?Q?Cftign7SDld8fdUc24dKgGJ78RfzG8n4dAFSTOJWsbXhn5w/zwJMQ5VrIu+n?=
 =?us-ascii?Q?FexSeno6GeVlN967FXebQVwXud238MthmAnMzc8LNCrA117HquLTWIa0whxK?=
 =?us-ascii?Q?ozr2W/itdj0tSwrFI0jFPK+pzNrADc7eZo8dTKTS?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 453fed1e-2d88-408a-75fe-08dda9eab976
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2025 19:52:55.5270 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1fsDutfYPIr3pLAzWtt5PNS9H1XYlv5N0R25NL0waRXDWKN8bpOYr+5Rl8pEZsrnXnprEsaevR5UL6sFQhgu4AuFxMBI14CZoT4AnkiTWww=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7466
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
From: Harrison, John C <john.c.harrison@intel.com>=20
Sent: Thursday, June 12, 2025 11:47 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDeskto=
p.Org
Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log targe=
t
>=20
> On 6/12/2025 11:27 AM, Cavitt, Jonathan wrote:
> > ----Original Message-----
> > From: Harrison, John C <john.c.harrison@intel.com>
> > Sent: Thursday, June 12, 2025 10:50 AM
> > To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.FreeDe=
sktop.Org
> > Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log t=
arget
> >> On 6/12/2025 7:32 AM, Cavitt, Jonathan wrote:
> >>> -----Original Message-----
> >>> From: Harrison, John C <john.c.harrison@intel.com>
> >>> Sent: Wednesday, June 11, 2025 4:57 PM
> >>> To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Intel-Xe@Lists.Free=
Desktop.Org
> >>> Subject: Re: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log=
 target
> >>>> On 6/11/2025 3:04 PM, Cavitt, Jonathan wrote:
> >>>>> -----Original Message-----
> >>>>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf O=
f John.C.Harrison@Intel.com
> >>>>> Sent: Wednesday, June 11, 2025 2:06 PM
> >>>>> To: Intel-Xe@Lists.FreeDesktop.Org
> >>>>> Cc: Harrison, John C <john.c.harrison@intel.com>
> >>>>> Subject: [PATCH 2/2] drm/xe/guc: Add support for NPK as a GuC log t=
arget
> >>>>>> From: John Harrison <John.C.Harrison@Intel.com>
> >>>>>>
> >>>>>> The GuC has an option to write log data via NPK. This is basically=
 a
> >>>>>> magic IO address that GuC writes arbitrary data to and which can b=
e
> >>>>>> logged by a suitable hardware logger. This can allow retrieval of =
the
> >>>>>> GuC log in hardware debug environments even when the system as a w=
hole
> >>>>>> dies horribly.
> >>>>>>
> >>>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> >>>>> So, this is basically a new modparam value that redirects GuC logs =
to
> >>>>> a specific IO address?  I take it guc_log_target =3D 2 is the defau=
lt value, and
> >>>>> guc_log_target =3D 1 would print the logs to stdout, then?  I'd ask=
 why we
> >>>>> use 0 as a default value and not just default to 2 all the time, bu=
t I think I
> >>>>> already know why (we need to guard against guc_log_target =3D 0 any=
ways
> >>>>> to prevent printing to stdin).
> >>>> Um, read the patch - "(0=3Dmemory [default], 1 =3D NPK, 2 =3D memory=
 + NPK)".
> >>>> The default is zero. And no, nothing prints to stdout. This is about
> >>>> hardware level debugging. It has nothing to do with stdin/stdout/std=
err.
> >>>> Those concepts do not exist in hardware nor in the KMD. If you send =
the
> >>>> GuC log to the NPK target then you need a hardware debugger (JTAG, e=
tc.)
> >>>> to read it, as described in the commit message.
> >>> Ah, okay.  When I read "This is basically a magic IO address that GuC=
 writes
> >>> arbitrary data to", I thought that was indicating that we're writing =
to the
> >>> in/out/err IO addresses, and that the data being logged "by a suitabl=
e
> >> You say "the in/out/err IO addresses" like there is such a thing.
> >> In/out/err generally refers to stdin/stdout/stderr, being the default
> >> first three file handles of a unix process. File handles are not IO
> >> addresses. Such file handles also do not exist in the kernel. And they
> >> absolutely do not exist inside the GT hardware. My comment was referri=
ng
> > Okay, right.  The last time the distinction between I/O as a device con=
cept
> > and I/O as an interface concept was relevant to me was about 8 years ag=
o,
> > so I can understand how I got confused there.
> >
> >> to memory mapped IO addresses, i.e. hardware registers. On a normal
> >> system, there is nothing connected to said hardware so the logged outp=
ut
> >> goes nowhere. However, if you have a hardware debugger attached to the
> >> system then it can trap those accesses and record the log.
> > You know, sometimes I forget that the intended customers for these
> > products are major companies that end up shoving these cards into
> > giant server racks and not PC users with screens and keyboards.
> >
> >>> hardware logger" was occurring separately.  I guess I also thought NP=
K
> >>> was a writing protocol and not a hardware address.
> >> NPK is neither a protocol nor an address. It is a block of silicon
> >> called North Peak, also known as the Intel Trace Hub.
> > "The GuC has an option to write log data via NPK. This is basically a m=
agic IO address..."
> >
> > If NPK is "a block of silicon" and not an IO address, then perhaps this=
 would be better
> > worded as:
> >
> > "The GuC has the option to write log data to NPK, which is basically a =
block of silicon..."
> NPK is a block which implements a register which is written to by GuC as=
=20
> an MMIO access. The point of saying 'basically' is because this is very=20
> simple view - GuC writes to a register. All else is irrelevant. If you=20
> want the full details then there is a white paper about it. But=20
> generally speaking, if you don't know already then it isn't relevant to=20
> you because you don't have the hundreds of thousands of dollars of=20
> hardware required to make use of it. So complicated descriptions are=20
> pointless.

We can still keep the description precise without overloading it with "poin=
tless"
details:

"""
The GuC has the option to write log data through NPK.  NPK acts as a
transport layer that can send arbitrary data to a dedicated hardware
logger if one is connected.  This allows for the retrieval of the GuC log
even in the event of catastrophic hardware failure.
"""

>=20
> >>> It didn't occur to me that we'd need to directly write the logs to th=
e
> >>> hardware logger in cases of catastrophic failure because we already h=
ave
> >>> methods of streaming the logs directly via the serial ports.  Though =
I
> >>> suppose that we're talking about different "logs" at this point?
> >> I don't know what logs you are talking about. This patch is quite
> >> clearly only talking about the GuC log. Which is generally accessible
> >> via debugfs snapshots or as part of a devcoredump capture.
> >> It is not ever 'streamed directly via the serial ports'.
> > I was referring to the dmesg logs at the time, though I will admit that=
 I forgot
> > there were classes of logs that never get printed to dmesg.  I don't
> > personally agree with the practice and think that all relevant logs sho=
uld
> > be printed to dmesg if possible, even if only at certain debug levels o=
r
> Sure, lets write to dmesg from inside the GT hardware. I'm sure we can=20
> add that in to the next product...

Your sarcasm is noted...

>=20
> DMesg is for super important kernel messages. Sometimes, it is the only=20
> way to debug kernel related problems because the system dies and=20
> userland is no longer functional. But it is absolutely not meant to be=20
> the default output method for all possible logging systems. For example,=
=20
> the ftrace mechanism exists precisely because dmesg is not the right way=
=20
> to log many things.

We can agree to disagree, I guess.

>=20
> > upon direct request.  However, I can at least see why we'd want to stor=
e those
> > separately in the NPK silicon block in case of catastrophic failure giv=
en the files
> > they normally get saved to are wiped on system reset.
> Nothing is stored. NPK is simply a transport mechanism here. If there is=
=20
> nothing connected to it then it goes nowhere. /dev/null if you prefer.=20
> And there is no file to get wiped. The normal target for GuC logging is=20
> a memory buffer. Any access via a debugfs or sysfs 'file' is just code=20
> being run inside the kernel to read that memory buffer and return it to=20
> the user.

Regardless, information is being wiped, and that's preventing us from
accessing the log after system reset because the log (or I guess "the data
used to construct the log" if we're being pedantic) doesn't exist anymore.

>=20
> John.
>=20
> >
> >> John.
> >>
> >>> The reviewed-by still stands.
> >>> -Jonathan Cavitt
> >>>
> >>>>> I also take it this is modified on boot by, for example, writing
> >>>>> "xe.guc_log_target=3D1" to CMDLINE_LINUX_DEFAULT as a part of the g=
rub file.
> >>>> That is generally how module parameters work. You can also set via
> >>>> modprobe.conf files as long as the Xe driver is a module and not
> >>>> compiled in.
> >>>>
> >>>> John.
> >>>>
> >>>>> Yeah, seems good.
> >>>>> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >>>>> -Jonathan Cavitt
> >>>>>
> >>>>>> ---
> >>>>>>     drivers/gpu/drm/xe/xe_guc.c    | 4 ++++
> >>>>>>     drivers/gpu/drm/xe/xe_module.c | 4 ++++
> >>>>>>     drivers/gpu/drm/xe/xe_module.h | 1 +
> >>>>>>     3 files changed, 9 insertions(+)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_g=
uc.c
> >>>>>> index e16d19b44bcc..9c0e3113f7d5 100644
> >>>>>> --- a/drivers/gpu/drm/xe/xe_guc.c
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
> >>>>>> @@ -35,6 +35,7 @@
> >>>>>>     #include "xe_guc_submit.h"
> >>>>>>     #include "xe_memirq.h"
> >>>>>>     #include "xe_mmio.h"
> >>>>>> +#include "xe_module.h"
> >>>>>>     #include "xe_platform_types.h"
> >>>>>>     #include "xe_sriov.h"
> >>>>>>     #include "xe_uc.h"
> >>>>>> @@ -74,6 +75,9 @@ static u32 guc_ctl_debug_flags(struct xe_guc *gu=
c)
> >>>>>>     	else
> >>>>>>     		flags |=3D FIELD_PREP(GUC_LOG_VERBOSITY, GUC_LOG_LEVEL_TO_VE=
RBOSITY(level));
> >>>>>>    =20
> >>>>>> +	if (xe_modparam.guc_log_target)
> >>>>>> +		flags |=3D FIELD_PREP(GUC_LOG_DESTINATION, xe_modparam.guc_log_=
target);
> >>>>>> +
> >>>>>>     	return flags;
> >>>>>>     }
> >>>>>>    =20
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/x=
e_module.c
> >>>>>> index 1c4dfafbcd0b..fc8c681819b9 100644
> >>>>>> --- a/drivers/gpu/drm/xe/xe_module.c
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
> >>>>>> @@ -21,6 +21,7 @@
> >>>>>>     struct xe_modparam xe_modparam =3D {
> >>>>>>     	.probe_display =3D true,
> >>>>>>     	.guc_log_level =3D 3,
> >>>>>> +	.guc_log_target =3D 0,
> >>>>>>     	.force_probe =3D CONFIG_DRM_XE_FORCE_PROBE,
> >>>>>>     #ifdef CONFIG_PCI_IOV
> >>>>>>     	.max_vfs =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG) ? ~0 : 0,
> >>>>>> @@ -45,6 +46,9 @@ MODULE_PARM_DESC(vram_bar_size, "Set the vram ba=
r size (in MiB) - <0=3Ddisable-res
> >>>>>>     module_param_named(guc_log_level, xe_modparam.guc_log_level, i=
nt, 0600);
> >>>>>>     MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=
=3Ddisable, 1..5=3Denable with verbosity min..max)");
> >>>>>>    =20
> >>>>>> +module_param_named(guc_log_target, xe_modparam.guc_log_target, in=
t, 0600);
> >>>>>> +MODULE_PARM_DESC(guc_log_target, "GuC firmware logging target (0=
=3Dmemory [default], 1 =3D NPK, 2 =3D memory + NPK)");
> >>>>>> +
> >>>>>>     module_param_named_unsafe(guc_firmware_path, xe_modparam.guc_f=
irmware_path, charp, 0400);
> >>>>>>     MODULE_PARM_DESC(guc_firmware_path,
> >>>>>>     		 "GuC firmware path to use instead of the default one");
> >>>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/x=
e_module.h
> >>>>>> index 5a3bfea8b7b4..4d978f6f26b6 100644
> >>>>>> --- a/drivers/gpu/drm/xe/xe_module.h
> >>>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
> >>>>>> @@ -14,6 +14,7 @@ struct xe_modparam {
> >>>>>>     	bool probe_display;
> >>>>>>     	u32 force_vram_bar_size;
> >>>>>>     	int guc_log_level;
> >>>>>> +	int guc_log_target;
> >>>>>>     	char *guc_firmware_path;
> >>>>>>     	char *huc_firmware_path;
> >>>>>>     	char *gsc_firmware_path;
> >>>>>> --=20
> >>>>>> 2.49.0
> >>>>>>
> >>>>>>
> >>
>=20
>=20
