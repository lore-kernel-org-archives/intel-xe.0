Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25ADDD46C15
	for <intel-xe@archiver.kernel.org>; Wed, 28 Jan 2026 23:10:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD02A10E77A;
	Wed, 28 Jan 2026 23:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iY4p92dY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF1610E77A
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Jan 2026 23:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769641806; x=1801177806;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xJBVthQf0D81hbAturdWJ0m8jokzj9Bj3jCeIaKHh3A=;
 b=iY4p92dYQ6hBIxBRMC3EWDYVt/GdHCJmQGX1tH/wQgpnYOlOclZCuJBu
 F31DgSRifd27xAS+vjFs/OdGggVIAK8aGI8qdL5Iso5Dr/VCo0WsoTdYC
 Psjgjupng1P0/0O1r2p+xR8C+b5TZL40IqBa6RQLutBv/osaLuwhcl6XQ
 rncg0tIVFXrVW+ZdMQkrOgxt+zHPTyALifNOZKyp3Nw51P3r1tCEjmwKk
 XCPr2YNEGIkAs0ZUNcmkD9MLiF3vqjq17C5tTP3jUW1Vhqr2GH5NoYvi9
 BwJjpHaNIG2QvdYvQZ1TzLAj516pGGnqhOSiPPVW24fGSePJE0BFxGb8v g==;
X-CSE-ConnectionGUID: vX1LY0lZSweJUocXMvY/Zg==
X-CSE-MsgGUID: dwg69DBOSH2I3r94smcwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69883703"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="69883703"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:10:06 -0800
X-CSE-ConnectionGUID: rsfs6XLhRHiv3jIe+mNzdQ==
X-CSE-MsgGUID: XW2TUl7mSlC4UbZI03PPXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; d="scan'208";a="246001851"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2026 15:10:05 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:10:04 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 28 Jan 2026 15:10:04 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 28 Jan 2026 15:10:04 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XK8OofInQuXSfBpOeP7ZjR7c/JH1RVBXbgilyOes2Wk7XoKwehCxf7qLyehtL7KsOrHqRVAVrmhsKiOmJnzc0Ab6Aw6nGq6U4TRL+WOvYdItEnFbbNFtBCRzv/Mu7h7dEudzu/ZWeUP5caRRiB+19N5Ddc1GevcWQqWKyniLLcGvwV+iMvjeugCmzUjkzweiRebC1BZ32Vco7mnIW9jsNvaP8q9GxNINgEQ7Dr4eVqaWLw4SXiddz/VlB5OdjGLdO1K6O6qzPXvb8osMvg9nAsnvqQhilkQUnQdKcCNY5acf6pu9YM54sFY8084Ak+8I+jh7PbW8rzqjSK7zZskEbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E16oWPt0lgd3KhOXqk1Z/NgMvlXEIDkiRjzcNmzLcSc=;
 b=ltXdLpZAgAZVrRX479bV0VQ/ECp02O7fjQFlfBRwEusXzypLaqyu9RlnpocYSekNS+3ZaWkYWTCzB8OG4n4Ip3ioApVqwfGxWroqlyjll46YugpxcwpsHv6Drm2g97XM68PXOW5wiW3HqFMV3EvBsnDkfmVZjNTfr2cfgE+t5P2oHM3CDelLJoCHb63ZSZJR/ZEtlb3oB8/Ta4j+nY7Z3hk3UarITeVVJe9aVOWGgiehvuItd5HKEx7Uq98cfm/nXsusE7CPfIWWS/VYYv7NrbQn8etzgS3r81JGqKm7VK75OGYZGTJihdpnzDbODv+4Ytd0vZ0iwpnWgRwXk3LcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DS7PR11MB9451.namprd11.prod.outlook.com (2603:10b6:8:261::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 23:10:02 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9564.006; Wed, 28 Jan 2026
 23:10:02 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>, "Ruhl, Michael J"
 <michael.j.ruhl@intel.com>, "Luse, Paul E" <paul.e.luse@intel.com>, "V,
 Mohamed Mansoor" <mohamed.mansoor.v@intel.com>, "Nasim, Kam"
 <kam.nasim@intel.com>, "Vijay, Anoop C" <anoop.c.vijay@intel.com>
Subject: RE: [PATCH v6 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
Thread-Topic: [PATCH v6 6/6] drm/xe/sysctrl: Enable System Controller for Xe3p
Thread-Index: AQHckC5J7NSkWn+HwEO3P4ZK01J4orVoNK2w
Date: Wed, 28 Jan 2026 23:10:02 +0000
Message-ID: <DM4PR11MB5456593F49FD1AC9AF504DE6EA91A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260128081403.3138456-8-anoop.c.vijay@intel.com>
 <20260128081403.3138456-14-anoop.c.vijay@intel.com>
In-Reply-To: <20260128081403.3138456-14-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DS7PR11MB9451:EE_
x-ms-office365-filtering-correlation-id: 8c629b3c-41cd-4fb6-2b88-08de5ec25dfe
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?NVpUuwyjmAjErxG8y60d0fASKBEChrWNfId+cOKeGzj/Yn/IHMu7z6QgQ7pG?=
 =?us-ascii?Q?V+xJ7O+GXGdpTysfV50odbtosl1ZVqsBHQiJE20J+oINOlVSsQaLgwGK797w?=
 =?us-ascii?Q?5N0IJHDdBlhjygsskbvYm59teFghY1RlZuo8zlGZZvM6bPee4Zn5/1E9lgSv?=
 =?us-ascii?Q?bHji2t/54QM2knw0FMBa5SAyEwMd0vYLXIZQFhoHikLK2RIZNoq9S1w2NTgG?=
 =?us-ascii?Q?0rrflxb/r0gq86z9FUCigE885GL0lnMTC3ccm1QdUtnUla5RbpuCMKOVMWVP?=
 =?us-ascii?Q?EciA3G4WnQduJzz+pbTa2sqvvFwIDxt6g2h6/uyubmORe0I2iWubvuPMYatx?=
 =?us-ascii?Q?5Ypm74VQQ6uWgX0ScJouuhxxqL8R9NbQm3USa/BB60DYZlAlLcE/B65ol2yU?=
 =?us-ascii?Q?l093S2WYZ0ODYJqsmCL0J6JyBG/XYC7nlELO6ztZ68U7DFzRICT90FRN1BTy?=
 =?us-ascii?Q?1Ax7FjDXyrtb3kOZGhTt8hSpPjLL0sDAWSDvhptU3zN8WS9zZyeBPmfBWQwz?=
 =?us-ascii?Q?0I3HnN31pTp4Xd+MmTX9ow3DTQTaOmumXxvNyxTi2sD9zckm7LZ17gR90iSV?=
 =?us-ascii?Q?KIucRQ6zQN9RrgMx2JavdQLMIn/nRoA9ueiYYB4344o6BR7s2HUos+WCyJKF?=
 =?us-ascii?Q?feUufhAsF1/60HfH2QuH2Ped9Ijgp1JX3oc+A8gmPkJWpHTLsP7Mo34NgEHk?=
 =?us-ascii?Q?c4bxzso/Yl90l3+huMf1uar1wurxipHr9ibxEBlrLBAjEWFmYf9j5bY7DFss?=
 =?us-ascii?Q?2q9EZjzIn2R05X8oDCzSNY6oqFDOgbIrtS/tKfgI7jIGtOR37xPd8Hoth6bV?=
 =?us-ascii?Q?44Cp6MekJ6VWBipKbazdWCdRBqb4+PnVMxISg3x/IJ0Ojd3Aqlw5SH9L9MaF?=
 =?us-ascii?Q?4Mjj+9/4uBD9oXj15WR/rgMxHVJggTqQThK0sTv6um8IQqVq3K37UVLAnREC?=
 =?us-ascii?Q?uGqObBB9zQDzXVFsi0xQ86SKAPoz56oOMRAF5vH2F17yaDVTL1sMZ7TJHovf?=
 =?us-ascii?Q?LgjHRIALsFQA1C7UJPII1NJxC/wH/SB6MYKgNh0zNqxZP3wI0XHeCCbJ8I50?=
 =?us-ascii?Q?flqojZU6pWxQyaYTeZ9V3aacwU0NSgZ7+hY5hijRjnYbtnG5whN9fH9JMnEv?=
 =?us-ascii?Q?di+aF39EhSVeJVDLnblZSnmZGOAyAg+JiPUTHrU6XpSXdNVp4e/5SKlgf33r?=
 =?us-ascii?Q?Kfpjg8+qf81CMv35lY7z7t4YxJllbxv8OgrBEDN6z22ropIt+JvarXIvwbOH?=
 =?us-ascii?Q?PmIVz6U+IphodvHm4p7EUOLyA8qLNJHOMla8SxhvfsmSZsLqWvAyGHx8PzKh?=
 =?us-ascii?Q?mYG50NqC4rsC+B06H0NCIllIyprVO0MpjGy/5KNvMa/rGuFNham+g2Xx2365?=
 =?us-ascii?Q?boxud3Rd7KFil/ApgdgDNJ3PEciVJqHR7Ue8zPWeqy316Vun93AJYfZi5J4y?=
 =?us-ascii?Q?2FFQcx6q05FvRj8WQ9X9BWx/kNohPBVzNXdbHpfS9JjBXPKzr8iIRL5rvPZq?=
 =?us-ascii?Q?hpDrGbP71dxWEUrTGcKfxUAT0cCOx8DMBev4Nw69ECd+WrGPzqXO7wEFzMi2?=
 =?us-ascii?Q?S8EaDve5f1QAuG69qs0ZrMkB9+hcblxYKug32swqMsnMHZXc/K1LsNF7f5DJ?=
 =?us-ascii?Q?E6P7uizWbXqDDMskDrkM+OY=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ZTnLzkQ4XvFXEOisLc4OiHD1h83axV/0wZL2J2k5lHLjOyhSINkdzlFjkbUE?=
 =?us-ascii?Q?Vkm9pOck6dXUqOnApz3unqucPreUPXMyY01CuKWY4KmBktku4ttZeiP6gYQd?=
 =?us-ascii?Q?MUyBA18OwyXoN9E9fg20LXryRiStTwiEc4nOrN6RLPKD5D9RO5JBUuiJatzO?=
 =?us-ascii?Q?YIvgFzncks/yrxHFBFtsLnwuukyM2YeV9KNphM8P0S7tOjxSgc4CuddBo1rR?=
 =?us-ascii?Q?P4E4aggw8hukyXISpMA4aBLVPtnCqCbQI+A/F3rObtOpAj4oNkX9LVLoG6KR?=
 =?us-ascii?Q?sKr6Z8uWVBrzyxEx3TpvtAjEiOn9D4u/5WKFu8vKk3eBelUjbuKyKzQA1dpT?=
 =?us-ascii?Q?f498Zc2BrYKhq3b9IjsX3nnAAwGTE0DhXv/51drJxaSaslgqeHmfs/lSRpbC?=
 =?us-ascii?Q?6r+HmOiN0zLyTQUXuJmQwPjg9UPjiiclr9cmHvV6EZ62063t1tFrINU25ZM8?=
 =?us-ascii?Q?QzYoOTrzPBxxMu0Yg4DppgsciozHxM9weOMY0Gv0yxQw90vaC43RKL4bIDBN?=
 =?us-ascii?Q?XO1c5oVuQh60qSd/cq+26QcR0yBTfEpqw2JIn47DK31uOxy7yuUdPKg/eq1Q?=
 =?us-ascii?Q?D34FwVDeX3mH3glpghqdhtvweOE+mbsYkrOnsoAGehPFifxZc3BOEogu4Nxw?=
 =?us-ascii?Q?bJJ0mntLxAavfmiuoEHHbHrVdn4/Y2k5D5bB2PKQobNEY9j65yKH5L58+rPI?=
 =?us-ascii?Q?D08G/u+H3U4DehYL8l6IbXGt1Yz4lBbGRnHCpF9bdlBNFW/LHpogKfk+oNDH?=
 =?us-ascii?Q?TE25FlXM4KioqLihD7GBfR6fxo6AcNZ1uEdmSNojgXrQjfRNRzesTctDhiqS?=
 =?us-ascii?Q?E2GUSbalhL+9JqvseEWeYhd1tZtnpik/ur96Iwll7UT81DFvJgy37T5t+wP7?=
 =?us-ascii?Q?wdr0dhGjO0n7V+hb20VhAWM1NSYMygYr4WSep8wVzskLfTyFK0brvI74LRJ6?=
 =?us-ascii?Q?tmicJ45OFMSY23El/7UFsSny16mBJRXFjh5KhQxKBWEX/KGEEycnFr+jhjC9?=
 =?us-ascii?Q?7U/zBohlFzDbw0nbRNQgcn0iGilCdCHEtXeGBHB0rmNJMUBTpCgyzXYjlLKK?=
 =?us-ascii?Q?sub+nmoeL5QINKn0xvO4jpm261axGP38q+J2+5o8aquXoB+5UOJTsHSxnktX?=
 =?us-ascii?Q?m442Rwj1yHyVfrTolM3tUGy1ru6Tyq4J7YDI12Rk8Z4iBgRH+EIA6cpJFcAC?=
 =?us-ascii?Q?+15o/RmvCYbEr8AXOvWM8EUqg10pcZLnWDb41NJ3wYRV+RWYKvQeEfl5KbQ/?=
 =?us-ascii?Q?tuc4RE9JeAXQe4TdZOgixyywQt4C7z6PwrDPwd80wG+VURlVseHpELnhCKtX?=
 =?us-ascii?Q?xOhAhzeIdwh/dwA7lCi6rO9G0xA1bJhAC6iVdugPYWuSbaoSPdFIMITqHKJ4?=
 =?us-ascii?Q?xNfUiAbrXee0KNSuuSe/IrYR8nSopzJ88LmlNEE+pZDr9zG7lU6eAcnJcaP9?=
 =?us-ascii?Q?CQQESW4ASr2CTdBtXbArNOiZKp04jtRpSS2GcpnThRHObh2J+M5mWfBMhOeH?=
 =?us-ascii?Q?khYlt90kQHo1WPwuo+dB3YpLIXjl93iV01IVyQQFPfp6510kAumZIdZ/OSGe?=
 =?us-ascii?Q?G87hCh57juXLmP4zXx3YC9Tn2OyK4/1T1VQhsJJUO0SbT4CdqUGS8bPNDItv?=
 =?us-ascii?Q?t+TaorbtS7B9FMjcJeE46VvK1XVJpoHh1B/I8bxgeKp4KgGNfO+XWryKxHuj?=
 =?us-ascii?Q?qMteecWgu8VukJH9ONCpfoGXFf8LGprMEvMIsx5vpJgxj89gjCLLnlTAku//?=
 =?us-ascii?Q?mvBBv907Ow=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c629b3c-41cd-4fb6-2b88-08de5ec25dfe
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2026 23:10:02.6412 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wgY8prFVPwVCw354uhk9AcdwE6DHDc4uzoINZogJFPnTqHrv+uNTasbInSjTfnBw6FjNDEZN1qpidED/ScCJFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB9451
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

On Wed, Jan 28, 2026 12:14 AM Anoop Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Add PCI device detection for System Controller capability and update buil=
d
> system to include System Controller components.
>=20
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile       | 2 ++
>  drivers/gpu/drm/xe/xe_pci.c       | 2 ++
>  drivers/gpu/drm/xe/xe_pci_types.h | 1 +
>  3 files changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile in=
dex
> 2b20c79d7ec9..947fbcac65d5 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -121,6 +121,8 @@ xe-y +=3D xe_bb.o \
>  	xe_step.o \
>  	xe_survivability_mode.o \
>  	xe_sync.o \
> +	xe_sysctrl.o \
> +	xe_sysctrl_mailbox.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
>  	xe_tlb_inval.o \
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c in=
dex
> 91e0553a8163..b6dc3030b673 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -426,6 +426,7 @@ static const struct xe_device_desc cri_desc =3D {
>  	.has_soc_remapper_sysctrl =3D true,
>  	.has_soc_remapper_telem =3D true,
>  	.has_sriov =3D true,
> +	.has_sysctrl =3D true,
>  	.max_gt_per_tile =3D 2,
>  	.require_force_probe =3D true,
>  	.va_bits =3D 57,
> @@ -701,6 +702,7 @@ static int xe_info_init_early(struct xe_device *xe,
>  	xe->info.has_soc_remapper_telem =3D desc->has_soc_remapper_telem;
>  	xe->info.has_sriov =3D xe_configfs_primary_gt_allowed(to_pci_dev(xe-
> >drm.dev)) &&
>  		desc->has_sriov;
> +	xe->info.has_sysctrl =3D desc->has_sysctrl;
>  	xe->info.has_mem_copy_instr =3D desc->has_mem_copy_instr;

NIT: this line has been removed in latest xe-kernel, so this patch is rebas=
e needed.

LGTM.
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

>  	xe->info.skip_guc_pc =3D desc->skip_guc_pc;
>  	xe->info.skip_mtcfg =3D desc->skip_mtcfg; diff --git
> a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
> index 5f20f56571d1..53e44a32883d 100644
> --- a/drivers/gpu/drm/xe/xe_pci_types.h
> +++ b/drivers/gpu/drm/xe/xe_pci_types.h
> @@ -56,6 +56,7 @@ struct xe_device_desc {
>  	u8 has_soc_remapper_sysctrl:1;
>  	u8 has_soc_remapper_telem:1;
>  	u8 has_sriov:1;
> +	u8 has_sysctrl:1;
>  	u8 needs_scratch:1;
>  	u8 skip_guc_pc:1;
>  	u8 skip_mtcfg:1;
> --
> 2.43.0

