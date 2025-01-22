Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0837C02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 22:31:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B8910E205;
	Wed, 22 Jan 2025 22:31:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RyM4BkjW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E78C510E205
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Jan 2025 22:31:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737585088; x=1769121088;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6qNzbxteBLzNGDHPTQ9SPAOYu8LcVUj6iPMeiuhFWOU=;
 b=RyM4BkjW0qn1lqO2E58PcgJosxDeaFbXuVJuxXCOFhJphaY7/j9ycSiQ
 S6npwtW59YAfPOwHx+0tHgAntmHSrPYnl6Cxp10Q8/8uBO8el9Ttg3exR
 aKZkJivN9i/hfbLfEOmaUq+Wbnp0LhhIql01MLLhJbW9wBbKTgHXr4C49
 iaqOWVfbtWNPZD/7FYWU0jxiJUQOHuof8Ruul5lpY96WASTng0FHlVRgp
 JQlAmZJRUBnPTIG3ukDqnyTXJKvwRCeSmsXI21ZJ5q27YkHGXsRuWdwVW
 ZOiiU28hF3E0u3I3rCXupfHvFr7dZi6O/wy8qemvtSlLoQGJDaYOg367d Q==;
X-CSE-ConnectionGUID: a28vQDZST5yqOcEJ7mI0QQ==
X-CSE-MsgGUID: GbMjduxjQyexCcPhi9vT2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11323"; a="37765466"
X-IronPort-AV: E=Sophos;i="6.13,226,1732608000"; d="scan'208";a="37765466"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2025 14:31:27 -0800
X-CSE-ConnectionGUID: Rlwnd3MxRdeAmZECNNux0Q==
X-CSE-MsgGUID: bUkDituoSgG7vNj3Id+EkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="138145861"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Jan 2025 14:31:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 22 Jan 2025 14:31:27 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 22 Jan 2025 14:31:27 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 22 Jan 2025 14:31:26 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ON3VmS/w8380ppun5nAbzzUN8tK4WGKu/qYxGUyLjjjM1N27QmMCHNH7e7nX3FYR5hbUUd+uAo3A0J+zhZmiQwjDgXSVqO+wPMQY3asOpo+helxL/TuKnB03rJIGMw4cJKRAbFGHeCnO0/qtVDu+dBW4RbqPKK4i4PUSEiKlrHzR8Z58Yinjo8X5LbDGNnZQ08taIAPxp8+lMaS0s4HlmsCyuUCvLQvFwsteMQTDiuuTd12gKQd5hrLPmfHbd1hae+cIu9G94Fv1L18jAg7cSyqXBUj8h1qlXewT7LTj1YQHr7zyvx/4d2iiuj1Ik5X9H5a+FTkHleIjlmSKdML4hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MMRJj1ziFSwPJ6CWszUGhPZW3W4zv3McSUBiCI5Scck=;
 b=M14FDC2zI/fVakY/DN4TXI+EW30DWMpiTMts+CpRSBBZv35/9MwrGBZT9QvMZ4ZrD1fDoTVPzfsNUQlsrUWtNOFypsrGYy9H/xkUn3F9DO4B7DvcUTk8LKLEgtRRN8wXnbRoGa6YrerQ/L3KHFzx/kdhTZaFOfBI4jT+fefwEAld4wIHMk0uDrqz9Z07ztxwl1jmkdCgHufsZoKULLJNjxkKWLi8wbWiw0G60yldBRimXjDsttwIyx6NGlhTJmm56GLae2xYbx04wOOdChLISYBKNfvIQcpz7cPv5Zp4ljfjNCESd34gaPpDB0a5X9EyzLd+HjY11AuL3CbjexCovA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS0PR11MB7734.namprd11.prod.outlook.com (2603:10b6:8:df::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.17; Wed, 22 Jan 2025 22:30:55 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8356.020; Wed, 22 Jan 2025
 22:30:55 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 =?iso-8859-1?Q?Thomas_Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 2/3] drm/xe/pf: Add reclaim annotation to the PF master
 mutex
Thread-Topic: [PATCH 2/3] drm/xe/pf: Add reclaim annotation to the PF master
 mutex
Thread-Index: AQHbbRfDdAGz7pEbE0mCd1Ha2SKUR7MjXCaQ
Date: Wed, 22 Jan 2025 22:30:55 +0000
Message-ID: <CH0PR11MB54445541DACC8D1E26F991B3E5E12@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
 <20250122214955.632-3-michal.wajdeczko@intel.com>
In-Reply-To: <20250122214955.632-3-michal.wajdeczko@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS0PR11MB7734:EE_
x-ms-office365-filtering-correlation-id: 0b6beb84-5ee5-418e-4751-08dd3b346fc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?AaUle44hbRsO7rKoxTBOwbVQ5yMnzIqGH16VdVE0tKHiaXNhHlZnnGYOG2?=
 =?iso-8859-1?Q?NuQhXN6PxeX1M4OByMvBSgdh+LSKf5AfNW78UcmIko1DiCEL6wZQtzrimg?=
 =?iso-8859-1?Q?ifB3ty14EJDfPJ4QFVqg9pdNkHMV4F4KP2HKiYjvEoJ4e0l320Og1p8c1X?=
 =?iso-8859-1?Q?V4Wd0qCq6O+e6xL0ETymYfeC+f1AkNbgDHB9hPGb/TVHdJRYYGd1/gdfZs?=
 =?iso-8859-1?Q?t/Wx2/hEHe0MF01ci4vG+C56SBJVPwOHhUjr5iwVRSEvSATC4XgGGMMsST?=
 =?iso-8859-1?Q?j0l65MHCDENv/h2zh3L+lk+ZdPwNxjPmO+f2keQHxdzxuuKaaTwlcFYRC3?=
 =?iso-8859-1?Q?+t13sXUOj7GK+mqX46z5XtXt8h6KZuIWpwDaSEdrTCwOzbgi4Lx796N3lD?=
 =?iso-8859-1?Q?/otP+sTpYtWNRDpRx5fXiFGieCRoqKtOMyBvRY61WSPDgFJANt1528RHU+?=
 =?iso-8859-1?Q?evLdCcITfP7I/R85jWYwjKirtoQU1Ak4n8hNMc5D+GbZcV5qG5dlpk80ii?=
 =?iso-8859-1?Q?deff4PLDJFM0U2th78kJUDFBhgyA6MeFsDsrIrytTSQYjrUiW9fuZOXVuu?=
 =?iso-8859-1?Q?UqCo/YGs8YMSoBnTQpg3Rx/NRqg3SFedoc4GkZTY/bT/b4Bd2Nx7l2dw8t?=
 =?iso-8859-1?Q?LmKSfhKLoyAMA150lycE7/NWV29efYuG28ohUCm7A9kn/CuV/Qbl4iCDaf?=
 =?iso-8859-1?Q?sADJ4WvSx42eAqRgbc+RD1XOA9MWtEkZSX6l+z6i3sEwhJ3Ls+pbiYtB0O?=
 =?iso-8859-1?Q?WmuckLAGKJrdyVrpEdjEZ8q0xL3k8cEgY0ACLfsqyUkZj7gpoKwNndrw30?=
 =?iso-8859-1?Q?2vhA/sUnGUSCpC5LYIUIa+6X8iCU37+kb0IfHXG9BsgPYjBO/uXl6omKlG?=
 =?iso-8859-1?Q?VjEvq4z65oWxuJYgXzW7dmIl6uqaZ6cDXuagzeWzYlqJjLrjwH/ocJ0XsE?=
 =?iso-8859-1?Q?/WKyc+9K1kwNFu9Zwbg5XM2tqcpYUgk20luLBDqijyZtJfeycMCMaZt+Vm?=
 =?iso-8859-1?Q?UTOZJJvwGZfcowhq3Di5pDTnvmuAvnCjSF/+Q3HCBbbdokj6rnNB+9U98f?=
 =?iso-8859-1?Q?VjzWAUuLMkVcH4BFKgiaozi7z85nSoMrhaZgRkgq7uSo4kOmfFXD5ftObd?=
 =?iso-8859-1?Q?RrkC95mQLBvdRmr/mc/rb4G0IeXtA+bSHBh34aneHVK+JAnJvS3rlGCuzi?=
 =?iso-8859-1?Q?PFTCJwXKg/um/qDSEa2NmVQ054t7B2pILSM0N0DfM2lfCItroFk/NdORsf?=
 =?iso-8859-1?Q?5lrTWpKh5df9/8SnTuRaS0ckecCspFAvJIYg/3bf9gzg1FOzywJuHadT0b?=
 =?iso-8859-1?Q?YiArbVmETbyd8UZ8c/ayjAMNQ9qSOOX9y9UAUexF1zuTkhr4dP36fG43EV?=
 =?iso-8859-1?Q?w5GEVoT/Zt8Uf6qXt0BZQJ0tc5ym/WiTf3cuanYpblXUQc0KmvTsqhQ6SB?=
 =?iso-8859-1?Q?aOeWCRvl9rrLI+jxDcIK0fixHmDP+fJalPfJXYkVZr05xnqi53lxx+MpyS?=
 =?iso-8859-1?Q?uIjnQVHxO62TLyd4WlKq8W?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?2++MhaarSv6rzI6plujcJRdxdRqJoHMEl0VfW7gWeVYjrsCsGqF3X7wBAF?=
 =?iso-8859-1?Q?7jowSageaOD4HLucD4AOZWwUcE9iGARbl6F5sMrY6QAOijgdBBd/Nqzun4?=
 =?iso-8859-1?Q?z4w5qR66vul56eq0D3QJx7qtAneCHxCDuxReGOv1K2jO3+uBGUyX+LR+Kh?=
 =?iso-8859-1?Q?i4/++D0tSbcqjJCK7aMy23niix3oQLC/VPU2C8kbc7SevwNJOiTwSoGY/T?=
 =?iso-8859-1?Q?NUAk0Gcf2uDJPNaj/kiM7q7ArldEvSM5XdiPwdPxoIZsVWCsz7nZY/9D2z?=
 =?iso-8859-1?Q?k0UlFl+Qf7BhS3lBCRaKuuN2N4gTYno3wve9rc4/taWKX8CM8p3eleJL+j?=
 =?iso-8859-1?Q?9yenpPAqN5e9ADYrH64LTqb5xpoIpcPkGw9pa0mLw87X9gzvywgRqrpJET?=
 =?iso-8859-1?Q?P6QeK+RgToAdlRwLRj9flnHOQGErWi/Fgsx327FJAa5WUggBI+e/GsJbtX?=
 =?iso-8859-1?Q?aTJ190lhHJtGxFyUZaEbPTOtBqT2Gp9CbDONvnvM/+VuEqZu+ZcwgJ2/7O?=
 =?iso-8859-1?Q?oXzgeOve8KNyaCfCXoKnfBuWBlPjas3gk4sFjHMB7CvIsk9VDe89Pluf12?=
 =?iso-8859-1?Q?oBbsPPmOD91TkiWLIHm6W7W1crItWDnlSj8sWisEIkZ+wiycqR5xX6wcKL?=
 =?iso-8859-1?Q?S7bW+1LfVZVDPKOKD+JT6yf8D442qkDR+21+geKuPAJF+BrcCZ8QglRBUz?=
 =?iso-8859-1?Q?NC2qxFsS9DWrA62Q9c1ZQ/4p0AsQPHvC8S5PPzposbjWkE6/IL4uwXJgVt?=
 =?iso-8859-1?Q?p16231CX2K0uhernqLLxwUdPQzjnE73/i8etkgWzM99+5QyQJSEylEDcS9?=
 =?iso-8859-1?Q?kpH/H/eg97HdpocqTgbj3Hib86OURWQ9cLg8Xm2R+v7zVdwbKFFnCLhmbe?=
 =?iso-8859-1?Q?foV1hxs7Z2sN+IgjUK5RXgL/u3T/Ohx8GEeZnCWcFUIhPVdMO3otbaturF?=
 =?iso-8859-1?Q?XZAUhSfF/mVzO7R49EbY3Js8bLdZvcPqWP6h9o+S5HMBlBTj7NaUHp056Q?=
 =?iso-8859-1?Q?L0pOzqtL6eUHttVAKWFyphXB9Djy0DebMyHvGlVK9RtG1hVMeBU8qm0VGQ?=
 =?iso-8859-1?Q?LO9RBCdxfexHW4S9i3COD5L6lL5Xvly9k5sqmUovZNSP0qD9nXvo1Fq04S?=
 =?iso-8859-1?Q?L6AQd44+6HS6gD4Oj1Se56+7Paq06RLHPO1uP6gc1B9LJJQI3co3U3F1Hv?=
 =?iso-8859-1?Q?kmmM7fTqA7YnJEjlrJZoJLqWKs7s9EdXYZwuseYPm1O8Jf+UOp5fc8TMBS?=
 =?iso-8859-1?Q?T3KJ3ahC7OSkE8i6/GWyBUHmKhtxNu9UhdZzD7mJxnRdv+TgP/fpO0vON1?=
 =?iso-8859-1?Q?O8s5IH7sQ9Z1mlTMTuPRzW9ekp+uJu9NgEV3l9BdQGTQyFlFi2HzgkS6Sy?=
 =?iso-8859-1?Q?WjIAk+eUmQ3w1OZltOLQOkq8ufExmfxzTbJJT/qmkJsRPWu0RWqFpwHEFl?=
 =?iso-8859-1?Q?mSi3cLjGubU2PSlDeMCr/YZuUkm06944JgrOLdsfn6ucKvqnMF7rpg1wCr?=
 =?iso-8859-1?Q?3ksiMehxZPTREYEa4G7Jp94xUACCm9tMzlka6SaPSjjHciyVdI9wwp7DqJ?=
 =?iso-8859-1?Q?6gotEKQptZjzoIZA56BlpkYcFUwO5nQbeYBs/CHsYBrAyH5AjnuBZvn16H?=
 =?iso-8859-1?Q?aLbn5S2KX3d8sckYMj8LUrv9SM1lyeZpkA?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6beb84-5ee5-418e-4751-08dd3b346fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2025 22:30:55.5481 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4KDTo1eeufhCcTjTyWXpf3Oqe7bvStfqQejv6AYse0hgNeH3GZzrjQpEk5F4BPSdkiRJ7ru5CczsTZViPYWBO0Kiyhd24GU4nYbN13RJGbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7734
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal=
 Wajdeczko
Sent: Wednesday, January 22, 2025 1:50 PM
To: intel-xe@lists.freedesktop.org
Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Thomas Hellstr=F6m <tho=
mas.hellstrom@linux.intel.com>
Subject: [PATCH 2/3] drm/xe/pf: Add reclaim annotation to the PF master mut=
ex
>=20
> We need to avoid making allocations with PF master mutex held
> as we are doing VFs reprovisioning during reset/resume steps.
> Add annotation around PF master mutex to catch undesired uses.
>=20
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellstr=F6m <thomas.hellstrom@linux.intel.com>

LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_sriov_pf.c | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf.c b/drivers/gpu/drm/xe/xe_sri=
ov_pf.c
> index 0f721ae17b26..2286a08657b0 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf.c
> @@ -10,6 +10,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
> +#include "xe_sriov_pf_helpers.h"
>  #include "xe_sriov_printk.h"
> =20
>  static unsigned int wanted_max_vfs(struct xe_device *xe)
> @@ -37,6 +38,13 @@ static bool pf_continue_as_native(struct xe_device *xe=
, const char *why)
>  	return false;
>  }
> =20
> +static void pf_primelockdep(struct xe_device *xe)
> +{
> +	fs_reclaim_acquire(GFP_KERNEL);
> +	might_lock(xe_sriov_pf_master_mutex(xe));
> +	fs_reclaim_release(GFP_KERNEL);
> +}
> +
>  /**
>   * xe_sriov_pf_readiness - Check if PF functionality can be enabled.
>   * @xe: the &xe_device to check
> @@ -80,9 +88,18 @@ bool xe_sriov_pf_readiness(struct xe_device *xe)
>   */
>  int xe_sriov_pf_init_early(struct xe_device *xe)
>  {
> +	int err;
> +
>  	xe_assert(xe, IS_SRIOV_PF(xe));
> =20
> -	return drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	err =3D drmm_mutex_init(&xe->drm, &xe->sriov.pf.master_lock);
> +	if (err)
> +		return err;
> +
> +	if (IS_ENABLED(CONFIG_LOCKDEP))
> +		pf_primelockdep(xe);
> +
> +	return 0;
>  }
> =20
>  /**
> --=20
> 2.47.1
>=20
>=20
