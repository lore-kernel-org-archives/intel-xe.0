Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0830BC02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 12:43:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF51C10E3DA;
	Mon, 20 Jan 2025 12:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WH/NlxPk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB3910E3DA
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Jan 2025 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737377014; x=1768913014;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AP5g+TE+OzPwLDWjuVk76ugoa8SCIGXKCTfHKfEupG0=;
 b=WH/NlxPkmy3M/oTXNn7iWLtsJQeE1KuP/AF+a01UanFv+/0L0ByOpV+R
 7fhxz2iu/Y0L4qfkWIOdKwUELW1At0wCN6lMem3Y9Dkh7203bs8/1B0ha
 IRkUFWebwVOzaF6yuDzkDcPD+UCwvgUuej4Rtn2sMCzHzAQka87UH5ZmM
 gZayQl5MqZsAu4cGe8FTWCYjz5VCsYoV4tZ2OaiK/E6vaPid/wFH81jKL
 DV4YhM75hMd3lGE/Icav2ekptNobcc91cT8h8fAUdq61HglH3eCeJnatm
 EG0MxEXGnyOkfTUua3xaG7lF49ybnoAmZIfxPKeQejX5p0pr3Lvj4T+K7 g==;
X-CSE-ConnectionGUID: 8xE3i2MWRayE7FPNYv2RDA==
X-CSE-MsgGUID: ntO97cLuQvywaeiks5QSkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11321"; a="37791743"
X-IronPort-AV: E=Sophos;i="6.13,219,1732608000"; d="scan'208";a="37791743"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2025 04:43:24 -0800
X-CSE-ConnectionGUID: ZdFvhopHTTCsjs1CmeF6VA==
X-CSE-MsgGUID: 6MaJyWrNTcW6QkAxr3hvQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="111593734"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jan 2025 04:43:24 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 04:43:23 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 04:43:23 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 04:43:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdSsHBTQEhImoA0D+78ajuH++so5T1iwd3leXMrL69pYW156aCXSZ5k/PT88SsBbZf1X59s0Vmjllx3MHPtkRyROnbU2p4qdT0H23//iljqbETHk93Zaekcw760dvu0qmA5BVDmEOg2x6eAFglp37HRISf7jAzekq/TRLqJ0W6RQOsIASXG8SpR+kYuu3bOP8/2ALvMjZfw75KHK8eA3OobZq/gw+A7/Cck5Ugb+acGC+U1n21bHI5on6NqBx5vT20QJfzwRQnmU0DxBUhsfOoK/B+jf6rIZqMkUrw9KOCK41Tz/wnwKaGW/ondrXa0kRLs9/mRIYxDX0+JYBjyrTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SQs2nJ2cvCYLM8k24JB5ScBSOlVYZnPgZWPCc8F9Uo=;
 b=Rj8aXeabdph02QpP71qFWptz7wqBmFo62Qp6FzhPzwLZLfCpUvOiX7v5LwQtqcHOHFogGR/vrv/dbS05qMQZx1htEYfwYE45kkeoovZBYo5L/lw1gQNNe2AxIVHrQ2obP3a1arIudJByBFeV4S8iZDK4P1yDum0ddgc1cvC3j+yUDhECMHd2ykVY4PFKKzSuR4tvYYrKiind6JYzDRFB2L0nSP6u867ySIqvLr5n7v+KyNlIoAPMqCpljQeL0xK8vApo4Y0fmxRaPYB2rp0lvv+57GxcYRg7BGd7YpnS7oXTUSjta+jugzxo54aGq6u88TGuaarq2m7GPIecgnX8vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB5109.namprd11.prod.outlook.com (2603:10b6:510:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 12:42:54 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 12:42:53 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>
Subject: RE: [PATCH v3 1/2] drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
Thread-Topic: [PATCH v3 1/2] drm/xe/xe: Add Wa_16021333562 and Wa_14016712196
Thread-Index: AQHbawHNME2C2U2Wo02nFri48VeUu7MfmD/w
Date: Mon, 20 Jan 2025 12:42:53 +0000
Message-ID: <SJ1PR11MB620423F6F566F5912ED9B4D681E72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250120060916.778406-1-aradhya.bhatia@intel.com>
 <20250120060916.778406-2-aradhya.bhatia@intel.com>
In-Reply-To: <20250120060916.778406-2-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB5109:EE_
x-ms-office365-filtering-correlation-id: 9c4c1f27-bd8f-48bb-ce9c-08dd394ff545
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?mYSxhxJqXiISkydI/NihwWWRBQGbzgy5p1atuNkdJxAbhGXMTHJfr+HDpEHV?=
 =?us-ascii?Q?b4+KjFAYQjAN03OzUWPbaNCo6uUYGcekcs+6PxTxRwFUkv4tF5X67bE7ObH1?=
 =?us-ascii?Q?NRMjzrD1A6nUAL0xh84LFt3KumBczjTh9gfYKsQ4kr4ELpjQzyGFVx5VSm27?=
 =?us-ascii?Q?XnLDkPENHPnRbOQ+t5U2BVlhk/HYFiGDbzqaJiEPisBS8fA9Z++rGRWxL8Xg?=
 =?us-ascii?Q?JYT5Yyk1GQT7xjzu+FO4bNiQ63ws0+hSrmpMviTShczLzSJSKfPl4qS19FmE?=
 =?us-ascii?Q?G9jlOeTf7OrmR8YKxpBOCVbbkk1My5NkqUmI6MjkvogHqNjccd4qKB4k4RaM?=
 =?us-ascii?Q?NQOU/ovkQN4t5G45G9hiFlUn3t32kZmAXZueLbpyOJLzAndhDvikyl5svPTW?=
 =?us-ascii?Q?rgWx/sUTywh9xw4DQzZePWpy6YaUf2OVGnpxVu8hqoqY+QVJw41XMKoQ1mWE?=
 =?us-ascii?Q?O5FGRtEwnOkqqe/c4g1boRJzxadGQteYE7G55f4iGPUNUKy1Jy3rorDLKyF6?=
 =?us-ascii?Q?x5xGdCOlTa0A2xdI1q4sDVWbrupQe1KhkO3fUKSZIMO/JHHRf6uPu4ybBnY4?=
 =?us-ascii?Q?6Ec81qpti9HOJ1+zf+wAEyeQIixNLhDF26vEVS8t/ccyR0VJ2QIYU2Wibc8t?=
 =?us-ascii?Q?wiulHMs9+VK6AGtFMHV+0w3AeenBscUTHtEAXc7tTAJcMfSoDoDoCEvQ6kps?=
 =?us-ascii?Q?roO84OlhLmCLQ40/MV0bjLXrabeNxbhJqgvh1F8HNZ5zw2mTNDc522mHB6+l?=
 =?us-ascii?Q?R56k5Uci3rsKhsMv2vJ5JwwmEssCZiQvM7E2l3bbDXYFLVViO4Fa+zw2N4fJ?=
 =?us-ascii?Q?z3X0cvjC94P3HRgEkGhCHVr6yMVpRjo5gCFckqk95/MhDzO1lK1UvQLD63N+?=
 =?us-ascii?Q?W1eVvk2EbUVkZSJIbAIuOy0irVnpf1wKNW3NQ8PB9VSQ6s1TuEfgzW2W8Ljy?=
 =?us-ascii?Q?+zNYbFe18rnqySlhN54Y7zQsZ2K7yMbyZWgBeMsIL4yjSB4q2QMi4vcZt05a?=
 =?us-ascii?Q?J9L6WbJkl5eyjRCSJipbgWn77Eyju/hFx2ccauTnddeIRHjc+XZJD9nOboSB?=
 =?us-ascii?Q?qMbput4fgM/UzeSlM83i9OyxM25pF/cWhciGxqE/J4WuSYAsDFxvYRPJ0YrL?=
 =?us-ascii?Q?sJ4e69mrCujnSOjy1AbnKtAoCRCnz3Y3jPQcn+QuDj23ubRYoNmRsvi/ghpz?=
 =?us-ascii?Q?uxsLo8tChf+zU2jOAzNKJWxh7eiUXsNitnZyNfACnK2apKGt/V0SRxr7jetP?=
 =?us-ascii?Q?29+mHJEM2Jx5PA+Oew4hOTTyvuBVrBn5pZ8ZbFhyOCrOQxx3P7i9RoWYE0Q7?=
 =?us-ascii?Q?JjVrfmy2zYPE/rB0gTZCnZJ394JL/BXwraLxixf/SCO9WlIYJKUe7oGNPD++?=
 =?us-ascii?Q?8H6YgAPT0Ng1XeSjHoojVmOo9wU5TCqQTOySVHTUR8Ezb81MUHQCGIlEsyfP?=
 =?us-ascii?Q?fW7F/j7IwgqrFdAR0ZZhUTkI6vY3+UQp?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?oJQtV1h1weX99guerjo4GZnj6xsL0KH8vX2vuQVyGpejDD8tTJ7Te5bQYgIT?=
 =?us-ascii?Q?uN/e0IORwIU9/6uRQ8fLqEWIiil1VUjP7GFvb9zn1huc6AUlfYhU8OFhi/a9?=
 =?us-ascii?Q?sic2pFFR9XSTPOXuXgLiw/NEWVsDyCh0MBgKJM9IakQChVH1c78n9n4JIfXK?=
 =?us-ascii?Q?Y4Wjg6inX1VKpVSQiXsliKPT38QoNQ/xkgi0NwMZAUxxLEfS+KzuRmj5itHa?=
 =?us-ascii?Q?eVqPOBYyZrJxXGsCcTXsQzjW+49geZaW7mevD20VtgkL9izcDLAi2HrVlcQj?=
 =?us-ascii?Q?2wIXrP4/SycFJduXfhmFykBHcFfA0B5Y6cM6FaWVKZzC26XguIlJDeQzYpRN?=
 =?us-ascii?Q?SzBXQBPEv9XBAiMR1UfS/3e5LfksvFFsHU/foU5b4EQXTLToChpZg76snH6h?=
 =?us-ascii?Q?37RC7LD17IHBjahAxAuWvJdMPM8q5ZeBFhN7tpuFvNhITsasjcigNhIAPSmC?=
 =?us-ascii?Q?urP+CSu1ENTHdRm7mlyDY9hUq4RqXPqKJfpODi8Unj5bSo5/GJYdCOw0Rjh6?=
 =?us-ascii?Q?CaV/3ittbJX/kR430mL3lXPo+2MRs1tpi/ke9K/zL2x1X6JSxd0hBSNK7qvW?=
 =?us-ascii?Q?501EBO2GQ09TD756VBdwIiVYDhjjNomHkWCo54e6MrhRZiWgeHognZdkQTJG?=
 =?us-ascii?Q?EQiBPkcQ2Jz3gNXyyFIJPhri/fjzWsrVVeQBjE+ScEaKNF1Lp06T4YFw1V7F?=
 =?us-ascii?Q?N9jPQht3osOfBsLP7SNgGoy/J1jRT9UZu/evtQw4dWEXDpBGF5pV78613IJ7?=
 =?us-ascii?Q?CQ+47qu+QYsy1EFEtNbko/ebHGMxeXYKn/94eVmLObuOL5D3P9ZYLJTxOKiS?=
 =?us-ascii?Q?mtCWOkXpvGpxLXIcacMZJByTnFuNN0b3+VTkGcDiWmfhIaNeb3gpldgh0cuO?=
 =?us-ascii?Q?xNOL/4rM3Rt9trSEHrRUVjVDPwsmBmrwOLKFyXEjyQ78JhXj8Y5fz+ZFNheF?=
 =?us-ascii?Q?haS5NYRIO4hDCcph8vZf578vYZhM9+Kbk/5h7qF8sDXX3jpdRHWMvfh5NZRv?=
 =?us-ascii?Q?E3QDPBfyEpZRSKu/EnKEADEeC4jTb3my2OMq0Ige5m7nToICg0QfaiNgTYha?=
 =?us-ascii?Q?ZoTAIP+5ATyGPu86NR7R3FC4blDZzRJlz3AtxuuTSNNZLyI3VLg9r+BQNHyw?=
 =?us-ascii?Q?0zgj8BD0PnVwRsOCc7ciWVWiJyMUjnOhpyEZJbt8oaW3ivtxfOW70Aa3bk4H?=
 =?us-ascii?Q?9z/9gqjc4YUGBd4KMc5D9yTdy0vuG01XoOQCl4whTBOidFt6vm8089yCUhm8?=
 =?us-ascii?Q?A3R4uPdDwCiI09doXphEXerwr0ksZ4woiaEWEQxHKGw3NlcXGxc53zZH8fyz?=
 =?us-ascii?Q?WMQmStSmL/AiAgPvGfWeE7JL8CYBTuBclDIiX7K6MCgzOiVZtSxQJ/zp03zh?=
 =?us-ascii?Q?1W34zUkiCvHWZezocJoPmEdDu0ZXS7jUzHRQcAD0KuGMlbmabfY/ni2pcgkr?=
 =?us-ascii?Q?DYPtRMm+6DOAbTAvbmrZIWw8DTh/YM43CjVPrpRLtiklVX1MYX/GnGniFlz8?=
 =?us-ascii?Q?nHl8vA7fbZ4W1H+hlCNmxZM8jdfuqnJ8BrLuLVS27XoVaqQje/v4JWXr7ZI4?=
 =?us-ascii?Q?+0WlWm9HK+ym76wjl1NqsIIhySybgsLrKKVhLuei?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c4c1f27-bd8f-48bb-ce9c-08dd394ff545
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2025 12:42:53.6192 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jNFBcEKBTJI+5R9h/L7fdoPWVT9g2XU14Dp2emtwHQrVMFDcd0B6pYU7iRnT6vqaViPnJT/G6Ix1spi8E6hWgq7J5G3ia88M6S0eNeFjrjo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5109
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Monday, January 20, 2025 11:39 AM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; De Marchi, Lucas
> <lucas.demarchi@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Siddiqui, Ayaz =
A
> <ayaz.siddiqui@intel.com>; Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Subject: [PATCH v3 1/2] drm/xe/xe: Add Wa_16021333562 and
> Wa_14016712196
>=20
> Wa_16021333562 and Wa_14016712196 are permanent workarounds that
> apply to multiple platforms. Wa_16021333562 applies to platforms ranging
> from TGL (12.00) to Xe_LPM (13.00), while Wa_14016712196 from DG2
> (12.55) to Xe_LPG (12.74).
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    | 5 +++++
>  drivers/gpu/drm/xe/xe_ring_ops.c   | 3 +++
>  drivers/gpu/drm/xe/xe_wa_oob.rules | 4 ++++
>  3 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c
> b/drivers/gpu/drm/xe/xe_guc_ads.c index fab259adc380..8ef044ddd682
> 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -376,6 +376,11 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>=20
> 	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET,
>  					&offset, &remain);
>=20
> +	if (XE_WA(gt, 16021333562))

You can OR with existing check!, like if (XE_WA(gt, 14019882105) || XE_WA(g=
t, 16021333562)) . Also there was firmware check, although xe might not be =
using that firmware version, so should be ok.=09

> +		guc_waklv_enable_simple(ads,
> +
> 	GUC_WORKAROUND_KLV_BLOCK_INTERRUPTS_WHEN_MGSR_BLOC
> KED,
> +					&offset, &remain);
> +
>  	size =3D guc_ads_waklv_size(ads) - remain;
>  	if (!size)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> b/drivers/gpu/drm/xe/xe_ring_ops.c
> index 9f327f27c072..22c226c30df9 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -192,6 +192,9 @@ static int emit_render_cache_flush(struct
> xe_sched_job *job, u32 *dw, int i)
>  	else if (job->q->class =3D=3D XE_ENGINE_CLASS_COMPUTE)
>  		flags &=3D ~PIPE_CONTROL_3D_ENGINE_FLAGS;
>=20
> +	if (XE_WA(gt, 14016712196))
> +		i =3D emit_pipe_control(dw, i, 0,
> PIPE_CONTROL_DEPTH_CACHE_FLUSH, 0,
> +0);

I think offset you need to pass is LRC_PPHWSP_SCRATCH_ADDR

Tejas
> +
>  	return emit_pipe_control(dw, i,
> PIPE_CONTROL0_HDC_PIPELINE_FLUSH, flags, 0, 0);  }
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules
> b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 40438c3d9b72..d7f7d617d490 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -42,3 +42,7 @@
>  no_media_l3	MEDIA_VERSION(3000)
>  14022866841	GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)
>  		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0)
> +16021333562	GRAPHICS_VERSION_RANGE(1200, 1274)
> +		MEDIA_VERSION(1300)
> +14016712196	GRAPHICS_VERSION(1255)
> +		GRAPHICS_VERSION_RANGE(1270, 1274)
> --
> 2.34.1

