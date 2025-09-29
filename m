Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E63CAC5B9
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 15:41:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B37710E23E;
	Mon, 29 Sep 2025 15:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hTHISeSw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B3210E463
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Sep 2025 15:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759160516; x=1790696516;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gOF1lzAj1zllnVjad6hsX0liqVlw8s5fyuxFsQJWflQ=;
 b=hTHISeSwoDR4TSf3vLXpRNkcbw95jPIl4EpQbJcYhaSx3MQ1scRzgDhy
 eL/IRVx+LAAil6Rp5v10d0Caw3WhmXy4O4DIqTVlicytMjoM4l1+T7rpn
 cLTeUZLac+/uH/ebRx6lwPk+f/HLOMyc1OnBH745kLNZ+hDm9GH4U8+em
 YqReHoG+/ss7Kh0HoTdPw83lwqcsm2qgr80fsSUxVLWwuC2L4tLHM9t35
 IuzkI/Z4jBu4LWmcIlXqnK/fk6ZVgovFhrfNgxtAgNQihuXNpnV4jIOF4
 hXbgfLBKox6QQE9Q71WchPGyQHsw/hyFwMea5nMNkA8BkNSrf4H9qzW4w A==;
X-CSE-ConnectionGUID: ywc7fgflTqCJilC5d1J6OQ==
X-CSE-MsgGUID: 17yNCXf9QeKJOP9AuLugyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="72833981"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="72833981"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:41:56 -0700
X-CSE-ConnectionGUID: Kn9yQtUGQEWNz4pWfPL9XQ==
X-CSE-MsgGUID: kvCqnnofSmyXAknC3lFNVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; d="scan'208";a="201946296"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 08:41:56 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:41:54 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 08:41:54 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 08:41:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=myRXJmHbAKr/j7jtaX+9hrGmyEpgJGsyQEwpQj2Ev1K+oMagi6l80omRHyrH3oVZnLBTSOwWIwTKE7oaSSqbXESK5LhlPbGJWhvmWOI8OOWokt49rjIjWPEMk/Ey/zDFiAxKj/uSQyz/uNkyzioNWkJ9ziP0Rf9N9ZeqGiQRyBuDM3BBcqD+kVMSuf5mhGa377a2SjfsYGo4I0nkCAxuB4p/rxT+nU0k/u6VDX6qSpGO4Or54qQhsYC+WA0sInEHOSwKMppDpgfacaLJ7V4GS99U5Lmh2b/CduJfYxK5CJ2Yt0xH1H1W5RneQkVwfRXRg9FqUSForZe6H+nKPmSfsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qsa46qbzHXBqYT0DqHzhspIp3ELJZpd/C+6fn/f+SKI=;
 b=Q5o3tPXcVlS1c/X5OeqyYSlLQDUVXDctKt2H2F2HzK2ozf5A+Zb5yeIryo7MfGnvc1ddVIf9TEQmLa5vIO5e7EMqQ28TlSy8oqrX6W5sKaSEQUDE3RhaK2TpTshmuRRwPcPdmw6IGGS7U5Oum0Yl8hlTyDNi+eyrdQ4E3F4nY7cBgf8JgxVzS7t05sHYeVIrtxWVVgve/H6WiOc07tMS/U7TYYWAOBTXsZMQ0QfjvniaRXuPS4o9cS4vFTjyhnHQ2UZ8vmYlIqIwgZaJfzSBrkEobNsYE4VXTzHM8E97pQ9GqBT7/XfjfnL/hCLf2Tt1PGyTi4AA7QN9JMS3mrqSdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7211.namprd11.prod.outlook.com (2603:10b6:208:43f::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 15:41:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%3]) with mapi id 15.20.9160.015; Mon, 29 Sep 2025
 15:41:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Thread-Topic: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
Thread-Index: AQHcLv6dxMv3P3oceUqLNZNRgmWJtrSp/Q4AgAA606A=
Date: Mon, 29 Sep 2025 15:41:50 +0000
Message-ID: <CH0PR11MB5444509C3E40A85F158C1D3CE51BA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250926155948.145934-7-jonathan.cavitt@intel.com>
 <20250926155948.145934-9-jonathan.cavitt@intel.com>
 <SJ1PR11MB62048BB29D6FD62F75921492811BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
In-Reply-To: <SJ1PR11MB62048BB29D6FD62F75921492811BA@SJ1PR11MB6204.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7211:EE_
x-ms-office365-filtering-correlation-id: 14400ed3-2922-4887-d36d-08ddff6eb51b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|10070799003|366016|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?UojFn7CehosmXAXTh74DAdSNn4nF+pJ8aNY2NqJsA+hyWnvTorLtleORf+n1?=
 =?us-ascii?Q?HIGNeYim0/0lL1n4bWHuEQvJBF3Hpnd96oeZvKOMSqsCL0XxM1qnn9tW8bJq?=
 =?us-ascii?Q?biDftYlTCA8xloVzPuKaq+P85eKxle1xeXHlIYSvrse5EAeLiIkaYi2TZNfv?=
 =?us-ascii?Q?EL5Q7WO1uqgPZn1l7GIwbXMV/CKCnSrLYuMp8WzXPYz9GvkrLCZe0iODFJ7R?=
 =?us-ascii?Q?WIBdzJTJ7W/HrGaSoABkczFflV16/j7B+SMv/Ah83RLpt0i2jm6w6A8sJL4X?=
 =?us-ascii?Q?KeDfZsEKbyEbgA6mvdAMyCA2LB0U+Nnkow+OJq3go59gnNqBjjvrwbJd7Gpy?=
 =?us-ascii?Q?U2K+RqL2qPANjJVtwcocJEOfPaO+H4NRyyjB/ii2W8Y8n8iByepFqm5YeMIi?=
 =?us-ascii?Q?V2yyxnDdeLoM7Ic9zzJiWwTxXmS60p2QLCnW+KH2k7hX6YvEUx0yie8qjg+/?=
 =?us-ascii?Q?0vDRVmq9YA/N2bmYp8U7r4PRTAv0P2AZJi1AuvW2WT95yAHFx7EqvlbDBh06?=
 =?us-ascii?Q?gxa1xaDK2mg2ghC5Od8CeKgwcws0uPCI2hFlURN9CMYCtOuAYE4Tbv3/xPH7?=
 =?us-ascii?Q?geq5xU1Ie/ikDduXxxHZtd4fhO8XQ+hDZ0TOvSdc/Z1NBHml//We7MVm8IUB?=
 =?us-ascii?Q?QDgmBU5i/zmUcR/h9GBa11g+G17ShxBxGuhHubTzXE9w12QyzzGBZSb0WLbY?=
 =?us-ascii?Q?euFxctC2lpExXhUS5hWOFBTN9QZN1EdWcPmRovkFYQaD+JHHd8iCxlQ4RHyB?=
 =?us-ascii?Q?rq6vrPsQ6HrhDyyU33wEa8a3Z4iwuTO11d61z3SAVySAZRo63mXM501cbo+H?=
 =?us-ascii?Q?e48oRgnL0HYG53NsXka0enYJR1ZRJ9nEWwDvSO4SGNlxGkaiIjGbuDodhaGY?=
 =?us-ascii?Q?lLUTbBpl3exRwCowJvYOgXC8KcwSol0rNqzv0q2mNFeMY5BqD6AUu5E/bysG?=
 =?us-ascii?Q?vVc1nagLE403JENDBXKDG7jafDyI1Vh+Zi6NdgGyQuoLWF/ovID6XOOT5PHu?=
 =?us-ascii?Q?e4iCgRdLYQcInz328xohePAOfLhf/hihw5z1Ck7lYgmNy9tuSTJMsX0AFRAU?=
 =?us-ascii?Q?VA8eOc7IFfPwcEbPu6f6hQ0sSPa9PqtGcPylplGe+evtp6qE0zFruKC4Ac0g?=
 =?us-ascii?Q?Y7fvxGr5zvS4sZv4zuFMe9RNhhJW2G8tY++rjHjpRer/Qw7a1H6oSVnfNgaj?=
 =?us-ascii?Q?v66e9EQ6SC3MowkBbraujQDUz18NwBNouRVS+IesjxqsO+ZYIAmXOlSXriN3?=
 =?us-ascii?Q?whE8wlXBt6aMz9089KGx4ga4rEaAL2pya6PY5WqFvmMyNOy7hRsJZ7GK9MgC?=
 =?us-ascii?Q?G8c4cwtss2cAsCbA/ETou1Kc9X7YQKGqy5NwishblN1FmH5SBm5f7THLiCw8?=
 =?us-ascii?Q?kH5ggdMY0tVnW1OkxxnWlN27YUQLSyA8aKEyYdVBqvRta+98ez32fI4/PbLr?=
 =?us-ascii?Q?j6uq6d3HEIiu4dy1iVTX+EGQBLe1Vk2WFnrTqpLB6Nx+2O+eJvDegrhys4Qy?=
 =?us-ascii?Q?qe1Xzz/zKAnX6EAk3BwSfqXuUc/sVWIqrLTG?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?x/IzvLsbTRWQbE3sgqORoTyB57RHwHiRPi0Ot8aj6Hl0eiKgFbGrpyUGb9up?=
 =?us-ascii?Q?KTdhoiF/+enGMl9n/+W4P3WnEFqLaX/pjq3hHN+lQq7+at7ECBO/2K0F6j2F?=
 =?us-ascii?Q?WMzVGUU9jgAtAJQoWxWThq9KYl4OP5Pn7rPFxEu/GYK2i++cTuQXkl23q9qe?=
 =?us-ascii?Q?M2yvzOSeXUErHHKmFmIlSZRutL1542PMGOuN/uXAcdBukUWUFGWdSLtmEY1T?=
 =?us-ascii?Q?gfPyyStQyFNeQCC9iRVl6NeJw/C6DimtXkLcQlu71Euys7d0fvbITkGM8hMT?=
 =?us-ascii?Q?/06dfQzZ6HWpwWBH+qgjTSsNQ2ac1k3RNIKdrUmSjVtsjwujCXBKwTRGgtIO?=
 =?us-ascii?Q?PfgE+DQbm0hWnsBiSzK7ogm6ek7Z3uZKgev7aZ/TAm0qKWJ0UvHGBzSq1ijT?=
 =?us-ascii?Q?oGETPVLSlphhx2/At27F8lzwlKOvEnWlbjjINsqD7qXjP2hvwh1Ey1x9jloK?=
 =?us-ascii?Q?EJcm/9W9LZy4VF2RRlaNiogUXLUWL9lpWEFg/3W5j8pu/qdvtpCgd0+KwBTS?=
 =?us-ascii?Q?OHHyScH6b0xhb0KDc7H+G04Fls+JejzDK7ePX2fy2SM/eDI9sOL48eg2Skt/?=
 =?us-ascii?Q?Pq0tcrYEBhXf0kJNuURoyEPEK1PCr2E84oG7c6nQqwDIMy4ln2GivaOqch7P?=
 =?us-ascii?Q?slSpdXHnYUuJxY3s9ECwg2wj/0iJgbEPonugoTK5FscJvyh05rIscK9Ir2TO?=
 =?us-ascii?Q?bjjEZdYzLnpdb9xH5KsFhNhbk97lhJb7xx0DbjwmCE0BKeeC3/2k/kKMW60j?=
 =?us-ascii?Q?PZRCttD1qoxCQHyUUo7K+jnoSeD94+u/GsY5TsQZey4Nb2vqolgebRWqnXtg?=
 =?us-ascii?Q?26N+xEVakDG4uniorlYEvcpBE01hQ7h67Nft4DApjJ/o7pR6YSo3VcM1tAOh?=
 =?us-ascii?Q?AIdZ2d0e14Fus7FfLfsfXotIgDPX6+IuEk6iDLMvEJ9vuvt4jhNH8KibiTMO?=
 =?us-ascii?Q?5/d6sQzcJv5n3ZWxkgjxls4RRQFG4uBKFO9q0RKLgQk4lghni36sLjvDW+dk?=
 =?us-ascii?Q?/oi+73r27YpLgPTdMLttfslaA4Ppm6t9Sklm2vEb5HFDlf36/mqQ14iOqyUp?=
 =?us-ascii?Q?/8mhxJsTX7KCvqmZD4zvgeEP0xNQ/G6Sa3ECv8s1EOCClISXXxHX7CPOCVhE?=
 =?us-ascii?Q?j7tsC4adCA4dkZuS33Cd53hc6v+l3mze/EDbbzonG0SKBJY54L6gH1Uq2Qnh?=
 =?us-ascii?Q?FKpPwWRnsaTqM32g15aWDnhxK4PRU9VyR4zIoHQNLMVuyNkgLjSVMiMk9SUc?=
 =?us-ascii?Q?bl8tz/jabp6XMqsVo1hQDNs6Pc4QlmfPoVskZQMmJfcMZanY5sqoAXoTQcZs?=
 =?us-ascii?Q?ulC1WptdLOdnNnApp5xR8bghCC8mFkDIXC8mMpt5CSk8F3XYp92ogIbQlbHv?=
 =?us-ascii?Q?rppy74bViz19wT6yzqdALBCoRvCtr/mEN1ZQNpZyrtDx2u47ge49GzU9eKj1?=
 =?us-ascii?Q?X16c/nUlmNlFXY27dgEfY5xdy6QjmVTAaCgxL2qx/oyMEs8aWGJQFkBdju12?=
 =?us-ascii?Q?UXp4Vsyd3f+f30hTniK7PPXHM2xZ6Y0jdOoJ8D/ZDoG2WP+JVb0GTxNFzfGB?=
 =?us-ascii?Q?/AHV1OK9WO9ZEulCbTAHbL04QA9LkM56zEHomCXG25D2/UHVejz4OGOWs9yS?=
 =?us-ascii?Q?sUJuqw/BYaEDTYS+d+tQQLtcm5EI9LXfAfZyS3zO2dfE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14400ed3-2922-4887-d36d-08ddff6eb51b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 15:41:50.5929 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JhwT73syIJknz3gGK2h+gQWH6wivjdrHSdkUbbjBtCc6bgD+9SljKaeyyM+xSjxK3F3x8wO/ofdSTwW/MQS/O6OespNDxS1nSh4ljcQDCWM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7211
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
From: Upadhyay, Tejas <tejas.upadhyay@intel.com>=20
Sent: Monday, September 29, 2025 3:41 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg <saurabhg=
.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko, Michal <Micha=
l.Wajdeczko@intel.com>
Subject: RE: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
>=20
> > -----Original Message-----
> > From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> > Jonathan Cavitt
> > Sent: 26 September 2025 21:30
> > To: intel-xe@lists.freedesktop.org
> > Cc: Cavitt, Jonathan <jonathan.cavitt@intel.com>; Gupta, saurabhg
> > <saurabhg.gupta@intel.com>; Zuo, Alex <alex.zuo@intel.com>; Wajdeczko,
> > Michal <Michal.Wajdeczko@intel.com>
> > Subject: [PATCH 2/5] drm/xe: Guard against NULL GT in xe_pmu.c
> >=20
> > Static analysis reveals the following issue:
> > xe_device_get_gt is theoretically able to return NULL in some cases, bu=
t several
> > use cases don't check the return value before performing a dereference,
> > resulting in a NULL pointer dereference.
> >=20
> > Add guards against this in xe_pmu.c:
> > - Use xe_root_mmio_gt instead of xe_device_get_gt for the tile 0 case.
> > - Check the return value of xe_device_get_gt when this is not possible.
> > - Return early from xe_pmu_event_destroy if GT is NULL.
> >=20
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pmu.c | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> > index cab51d826345..531022d80731 100644
> > --- a/drivers/gpu/drm/xe/xe_pmu.c
> > +++ b/drivers/gpu/drm/xe/xe_pmu.c
> > @@ -142,6 +142,9 @@ static bool event_gt_forcewake(struct perf_event
> > *event)
> >=20
> >  	gt =3D xe_device_get_gt(xe, config_to_gt_id(config));
> >=20
> > +	if (!gt)
> > +		return false;
> > +
> >  	fw_ref =3D kzalloc(sizeof(*fw_ref), GFP_KERNEL);
> >  	if (!fw_ref)
> >  		return false;
> > @@ -219,6 +222,10 @@ static void xe_pmu_event_destroy(struct
> > perf_event *event)
> >=20
> >  	if (fw_ref) {
> >  		gt =3D xe_device_get_gt(xe, config_to_gt_id(event->attr.config));
> > +
> > +		if (!gt)
> > +			return;
> > +
>=20
> I think we need to reverse state of device even in case of gt is null!

This is done in v2 of the patch.

Granted, v2 is very different from v1 in a lot of ways, but with respect to=
 this
request, the change is present.
-Jonathan Cavitt

>=20
> Tejas
> >  		xe_force_wake_put(gt_to_fw(gt), *fw_ref);
> >  		kfree(fw_ref);
> >  		event->pmu_private =3D NULL;
> > @@ -497,7 +504,7 @@ static const struct attribute_group
> > *pmu_events_attr_update[] =3D {  static void set_supported_events(struc=
t
> > xe_pmu *pmu)  {
> >  	struct xe_device *xe =3D container_of(pmu, typeof(*xe), pmu);
> > -	struct xe_gt *gt =3D xe_device_get_gt(xe, 0);
> > +	struct xe_gt *gt =3D xe_root_mmio_gt(xe);
> >=20
> >  	if (!xe->info.skip_guc_pc) {
> >  		pmu->supported_events |=3D
> > BIT_ULL(XE_PMU_EVENT_GT_C6_RESIDENCY);
> > --
> > 2.43.0
>=20
>=20
