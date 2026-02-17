Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0636AE83844
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 13:20:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B7A710E23B;
	Tue, 17 Feb 2026 13:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ke69SgHj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7841710E23B
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 13:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771334405; x=1802870405;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PNBw6nDTaHNwaVkg8LIjzWBJcrjL2gP8P+QmVVPpclQ=;
 b=Ke69SgHjxirVXPEIjsKS7+E15iarVlOcVuvV8gkx+u7DynrIgfwXdfZz
 ijJ1CyPk3loAu33Yhfzqf1naFtXNvC/+EfVu1eeByirOmqKLIV5Bm0qp1
 97GNTZaUXIA+yxP/JAPidmJ4/bQUmvuKxkK2JVJuEZQ7BQHfk1iIoAMg9
 fQSr6+RbjhwnYO9nyjPYqHRAidsEi3ff8wbY1ompjvBDONT/sJ//E2pRS
 C/IUQqK98oy00x94zmBikpETng7mi/Bw0ycRDhGYQAdNRnpvRFGlPqrHU
 BKu0OFzaJs2JPNbKiyi+zhCfIgaOkm46+159FyvwqK5AzCZ1vGQlt5nOU A==;
X-CSE-ConnectionGUID: kQU50WkdS2KAtK8znPsT7g==
X-CSE-MsgGUID: IToOHLyQTE+sAEVSVK3PmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72443436"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="72443436"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:20:02 -0800
X-CSE-ConnectionGUID: P2Qwc6P3SpOze6R4Dp5Xsw==
X-CSE-MsgGUID: r+cCEYbfSeClRbbmUkzBuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; d="scan'208";a="212351395"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 05:20:01 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 05:20:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 05:20:00 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.62) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 05:20:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zc6J+KZihMI4vpH7OSk3FutXAO1+s5pzNYbVCkneyotg+Omy/y8QW2BU6fFJAnWJxAqEKdfor/HlH9n1X2EoYEA1L8CvTN6HTDv9/XCpLLG4fp3kDJW3PCtb+VJQGaitsjSm3rrLcyraQnrTK6fxe2tLenj8rJxUq71sRLfOdfce8y96F/g9SKHiVIZx48BMzNig839/iRtyYW61DGv4Yc93Yonn5mECd/nZNu/7lcNVBhIfckICLQnVd44lJ3dRoflvyIWroBzF4iRN8YDXBdV7ACIKWwpJoxu50ZxtkK61gK2BP91Hhr0vbxRQZmUyvDzBFgWlCY9P1Mg/ccmWWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3S4TfI/QkCCTcBzWr2oW8ZPp2fE4o2EFGuULTdnm18s=;
 b=P4Y9cTJQubI9fn0obDFuwT4iQHO9hYW97bvd++OXqrUISsJ5B3EyT9oia7ejqyuZNKGqVcFqeYlUYBmDdsSUVZcRSV92vCE12xB3hrWs3zWLkubIfOxJ4MRBnykYrJBeG0Qg4v9X5iPTqYXi4PNk8IZ+QHz1x9ZNwFxe9eYyuiDUk4+5aCOaK+qP9+a9eKasdTgVVWN2899+b11ROFlF4XbENdJlD5gUImcCIm9O9gBIhbK3L7gchQ2SWM/X3mTajhFvf07adKFIuFgmr3LsvuV8VmbmUA+Hxkm1P809pGdpdqwqQV+WywUI7ZnsUHkxOTezoFL4noUSQC60fbEEPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18)
 by IA3PR11MB9422.namprd11.prod.outlook.com (2603:10b6:208:57e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Tue, 17 Feb
 2026 13:19:39 +0000
Received: from BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5]) by BN9PR11MB5242.namprd11.prod.outlook.com
 ([fe80::5657:45bf:d335:24d5%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 13:19:39 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vijay, Anoop C" <anoop.c.vijay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Nerlige Ramappa, Umesh" <umesh.nerlige.ramappa@intel.com>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ruhl, Michael J" <michael.j.ruhl@intel.com>, "Luse, Paul E"
 <paul.e.luse@intel.com>, "V, Mohamed Mansoor" <mohamed.mansoor.v@intel.com>,
 "Nasim, Kam" <kam.nasim@intel.com>
Subject: RE: [PATCH v2 4/4] drm/xe/sysctrl: Add RAS error injection interface
Thread-Topic: [PATCH v2 4/4] drm/xe/sysctrl: Add RAS error injection interface
Thread-Index: AQHcn1PyCcb08jsUb0SCNmppcKLpJbWG4ImQ
Date: Tue, 17 Feb 2026 13:19:39 +0000
Message-ID: <BN9PR11MB5242AA1513F419C47A46E19E956DA@BN9PR11MB5242.namprd11.prod.outlook.com>
References: <20260216145232.3942399-6-anoop.c.vijay@intel.com>
 <20260216145232.3942399-10-anoop.c.vijay@intel.com>
In-Reply-To: <20260216145232.3942399-10-anoop.c.vijay@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN9PR11MB5242:EE_|IA3PR11MB9422:EE_
x-ms-office365-filtering-correlation-id: 9474082a-814f-41e2-0819-08de6e27342c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?GRePqyuVZjVbnh83ZupqtIMx5ES35BsfitFMd9D+NwSGQeJFA9+78iF/FX1t?=
 =?us-ascii?Q?wB4FzsZVTmMDaJhbLSvCMtUeL6A5w28ASgciAhZP/2zCVOlybqMe+Hi6oxwo?=
 =?us-ascii?Q?greT87+KbhEbgXyjOuWbUcOybYIhBuzMF2DisnNmg4VY4p97WXyfpUX2lKsW?=
 =?us-ascii?Q?FiSR8yG+Tib+FA04q6Kv5dlidrgjHN2X68h3J70eH+zJ9qdmv11QcPW6xkH3?=
 =?us-ascii?Q?BqA+14y4lXrcl8YUDCztaYYXf+JQvERXdI6ABoiqE1ga8DBnOTXaDi0kzbda?=
 =?us-ascii?Q?obGQfMNTLK6xlloIAnlKHiceZfXD/HgmSwd8O4rO5Gr5sGjQsB6g92+Mez5M?=
 =?us-ascii?Q?kzeTWsi7pZ+ulkEyfoQyTKNZ7waxlgxRvNCaQisfoJN6mYgW5u+DNqQCqGNc?=
 =?us-ascii?Q?1C8f8Jk+v/WruaJs7tEIRHKNWChwLk+nOsLqkus6nDOgFf1oCavSYjyD1Zkz?=
 =?us-ascii?Q?Pq/u+6cCkAQ3rOygGH+b9sM0T8DotvZxj/fw67YukuT1sioEsnv7rTqf5EmW?=
 =?us-ascii?Q?NT4XOt+ucvLaC+h6YuEpfwOrIsG7P+PCevSFnE0bGWQYAErfF25EpLe/jwbx?=
 =?us-ascii?Q?zFmwCd3s067GtWuLZBMLSgxBxt6Vk8uSDNJf8h7t9iuRwevKScDQEtlRaeeL?=
 =?us-ascii?Q?9mhJ8aI36ilkqeiU16kwxUSm4PCVALeafOX+FA7eilkWetlSGg6YBkSDq8n+?=
 =?us-ascii?Q?xwF+fEyZ/mQ9Yg0HVvEq5doM67F/Hy7OFHpjQQT20dj595kSbe8Um50Qzi0t?=
 =?us-ascii?Q?xk0bpi4FI2mQvBKu4ALOyAHUSzq2J/iYaI9Lkr5hEZ8OBsDdDsqLCV7fuew0?=
 =?us-ascii?Q?ajDuD/+YEDQDzDqFcU1KN9YIxwMms5uZXlbU7KTYams3iQSGhCOcqqNiREQS?=
 =?us-ascii?Q?u5MnGa4YJWikocCwhnaxDYl2wF8ASPjERZEoZwpGt15l7V9Xw00DPBZPnqhc?=
 =?us-ascii?Q?4DazKqdvuj+qH/g7cK677+GtwiIWSQuElHiR1KCmrfMOAMrJWdHQNrr7Yf8R?=
 =?us-ascii?Q?MIH2FhYa0lBzn2MSCkVcUvFaHZ6BgmPKztiS6hcG4wnVKAY2QBLfqT0hDzWH?=
 =?us-ascii?Q?iDWon3ONieMTjQRFjVY/lyDM0HlM8Mw78LEMeH0rCOze6XzYl8UGQLkMrdSP?=
 =?us-ascii?Q?YDSgaSrMKAa5r7I+YIvYEEr+rC14HTElScsfycZPU2ST6B2VtfL1mFMVCkGP?=
 =?us-ascii?Q?QrSBawZwQ8FDdNfWmjcfK14RjefApq/s6N2cEsIkCwGJfbnupzSjnYxXPKlX?=
 =?us-ascii?Q?QdggA5c1cTsu/oM9BScIiQJMjZapI8SPm8r7xIkdmuej0tH6WT+qD6Ezw2SA?=
 =?us-ascii?Q?tDAWG9JU/kOcDSVvj50poINxjb8prAZZPtCq944Rj6SCAM4OGFa3WXaHVXSy?=
 =?us-ascii?Q?UJ1YMOt4VXVXn7vS4RE29TqQz4recgBuDY10GANGCULlEkpQRVy19jU4QYvK?=
 =?us-ascii?Q?FuPVvTmdfvKqzOHq7rnbNPkIkZ+EzJ9YHW+4ez2uA71TzAJlnFg73IIhgkR7?=
 =?us-ascii?Q?914W7Z7iV8nQTJXsQ8zEfj95r8WOx0P91S1z0B4yRelLfsSpxsTzZUeg4AIn?=
 =?us-ascii?Q?1W4VcKNjYNGlmq3Y5DJz0DZeb53JHf6Sn7DPsf8sptrFtdJ8kNN4+PhVTqWl?=
 =?us-ascii?Q?IJr7zZoa2q5Ckn36rU6rN8A=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5242.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LcuKAt3TEI71+bKEwbSSKJwOpXmIlvfeuEF3dzK41l6QYKKHV1opi0sgzYVL?=
 =?us-ascii?Q?YLX/S813c4uxQsLmjikrfdG2lHTCpOOP04tJ8pBWwjhr3XkWq1JRIklNBvUh?=
 =?us-ascii?Q?svbzcUKjwFOIyno2rUE3rPhJenx7vt3enGKo+Jf8x2695VEaR5PvIuaHAnAa?=
 =?us-ascii?Q?DtGJme64JHyeJ4O+JG8NevYnScJDpRXr6B8ofpkh0uK477RUNkcE2XhFEvsW?=
 =?us-ascii?Q?YvoWO5FpRXSYX87lxQ8IIHau/ClKkaQFRTdkBGeUoe+mcZU0zlJg5Lv/hZl2?=
 =?us-ascii?Q?ZWXlUn8h0cNK7qp5K3+pgfB8VQcxSW4/VYEPZvVrJLSpiatTCNBZyNLUmwlP?=
 =?us-ascii?Q?DoI1MHliHHfFat3G7WMAw124fMOLv+qed0983gQMftckDCdcujDfO16hDG1l?=
 =?us-ascii?Q?5ns2KV0qPr43vPz3IJENauvSPijPBVNsOAMeoXeJxr+9wSSd974mxpnvHaT8?=
 =?us-ascii?Q?zdA1OlfXEgVnv28NnDR8d6bfot/ojbafchuGlc+Hr7pn4ZvdkyGtGwaaPyuM?=
 =?us-ascii?Q?00WFI2TqluKTRhlbznqAJgy9FLenhciVNzLEw5LrOmM8OGuNhoitvJ/P3LnB?=
 =?us-ascii?Q?59RJ1A57mvTFnyoWYlnppayP8L+aqxBKvBuK36LV++17ZRsmdaJheD2XgZaR?=
 =?us-ascii?Q?eHtPk/7ukgZYJ6LWAIW5cydgGbUMkqNdrHZBL/T9YNTASEYLlSWPdffWuvLQ?=
 =?us-ascii?Q?6VW8iC+jlkb8PbQVDlwFK13ata2h2D4kZtM+ewGJGM5KS14Jqw/iAu7sPYdJ?=
 =?us-ascii?Q?oGlt+7IUfxKgoZOR50hSNbpUWn5tEh+7oLeOWSYJjf2yoaucccnAkcsj/LiG?=
 =?us-ascii?Q?r/YPIeBFlGQPq7+RBS+BaIoYN0L4j4367yK/1cJWG5pW5ux9h+T8KtGhed0O?=
 =?us-ascii?Q?bdNqyqOi973QvBNoAeJ8duxZ3NKOCm4dk81qKu1WGhsFpLTEDWiTELxJ3Pp3?=
 =?us-ascii?Q?0CTnh13CYWQxLB0gOhDC0ZHtCt5n2Q4zYH0Z3AB5bv7jJXSVgS16T/VSQvgr?=
 =?us-ascii?Q?Uh1J8utQ9vgsfXEXSPzITKEg2G6ik2nYQXWyC3X0jnYz8OnXVA83vU84JN1z?=
 =?us-ascii?Q?iyXnaw4XDlfyBNA84f1+7s0AYAuz8fq6wKsSZ1YWvCIhSaZjeyCRbl1hF/1N?=
 =?us-ascii?Q?H8wWbR/O/vUMGO1LAWjVZtFhLJ0eCTrqdeEBXozUyPNifHR1kn+KiTmMTLcg?=
 =?us-ascii?Q?RkhgO2xIA7TMAw+3Y0ipoQPbPHJwZgBN4Rw48GJeuBwwxBwmbj8zSOvQPMSy?=
 =?us-ascii?Q?/kO2oY4YWAxaFnCIZFJpPYM1tC2dXj7iQyEJLJg95kV9TFei6BoyAoQyPa9E?=
 =?us-ascii?Q?eqyqoVtZSxP8KjnYs+WlfA8atq7IVMMRe8AxV4Okt7AEbhhjAoveznTeOBCx?=
 =?us-ascii?Q?gl4hBY4cTFq7k+m5jAr/UGFq/5qEjixOkLWfgNX/5gfs2+F94G+2Z2uk6xXo?=
 =?us-ascii?Q?g8FwvXFOWDdB/qQxaSP3QdDCTvIgeZVwSBAoAFKZLinnynKdTld5B6HxKEv4?=
 =?us-ascii?Q?wyLyHoVODwJYZA+cclFaL2Oqe+aHhb4NoxxbfLkucowtJx2NDrTRBOQPrDA7?=
 =?us-ascii?Q?9uz1gUvCdgGknwYLof2vExeSYgwcjl1x7DY7ye7ctCn6BCBZ2BT/PVtasbeR?=
 =?us-ascii?Q?rw+xjBzdCrYKK9SvYG/CTHdjIld7kiNIQZWNiykFcuui/5TLMVFeT/hhbhUV?=
 =?us-ascii?Q?O+k9GgAumweSWB44CQLf1KFRjvbox1j5hUfU2tH9eMselo1lE5s//S8vp+EF?=
 =?us-ascii?Q?w9P9VrQHBw=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5242.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9474082a-814f-41e2-0819-08de6e27342c
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Feb 2026 13:19:39.1007 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AV8bC4TBcAUWSHlN7zzjpPRZEERkCk6X6S8tCKOawt3qnet7sujAsN/zcFvm1jAJzgDWGhy0ml2wcQMzXqGHraE+A0kGLFNSaNeUgMloj8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9422
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
> From: Vijay, Anoop C <anoop.c.vijay@intel.com>
> Sent: Monday, February 16, 2026 8:23 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Nerlige Ramappa, Umesh <umesh.nerlige.ramappa@intel.com>; Nilawar,
> Badal <badal.nilawar@intel.com>; Vivi, Rodrigo <rodrigo.vivi@intel.com>;
> Iddamsetty, Aravind <aravind.iddamsetty@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Gupta, Anshuman <anshuman.gupta@intel.com>;
> Roper, Matthew D <matthew.d.roper@intel.com>; Ruhl, Michael J
> <michael.j.ruhl@intel.com>; Luse, Paul E <paul.e.luse@intel.com>; V,
> Mohamed Mansoor <mohamed.mansoor.v@intel.com>; Nasim, Kam
> <kam.nasim@intel.com>
> Subject: [PATCH v2 4/4] drm/xe/sysctrl: Add RAS error injection interface
>=20
> From: Anoop Vijay <anoop.c.vijay@intel.com>
>=20
> Add debugfs interface for RAS error injection testing.
> This allows validation of error detection and recovery paths.
>=20
> Command details:
> - Group ID: 0x02 (Diag group)
> - Command ID: 0xFC (error injection)
> - Usage: echo "0x01 0x02 0x03" > /sys/kernel/debug/dri/0/sc/ras_error_inj=
ect
>          cat /sys/kernel/debug/dri/0/sc/ras_error_inject
>=20
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_debugfs.c | 55 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_sysctrl_debugfs.h |  3 ++
>  drivers/gpu/drm/xe/xe_sysctrl_types.h   |  3 ++
>  3 files changed, 61 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> index 28e46695c900..d6ffd8a8185f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.c
> @@ -136,6 +136,38 @@ static ssize_t xe_sysctrl_cmd_write(struct
> xe_sysctrl_debugfs_entry *entry,
>  	return len;
>  }
>=20
> +static int xe_sysctrl_ras_error_inject_show(struct seq_file *m, void
> +*data) {
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +
> +	seq_puts(m, "System Controller RAS Error Injection\n");
> +	seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D\n");
> +	seq_printf(m, "Command: group=3D0x%02x cmd=3D0x%02x\n",
> +		   entry->group, entry->command);
> +	seq_printf(m, "Status: %d (%s)\n",
> +		   entry->status, entry->status ? "FAILED" : "SUCCESS");
> +	seq_puts(m, "\nUsage:\n");
> +	seq_puts(m, "  echo \"<ras block> <sub block> <Injection Type>
> [params]>\" > ras_error_inject\n");
> +	seq_puts(m, "  cat ras_error_inject  # Check injection status\n");
> +
> +	return 0;
> +}
> +
> +static ssize_t xe_sysctrl_ras_error_inject_write(struct file *file,
> +						 const char __user *ubuf,
> +						 size_t len, loff_t *offp)
> +{
> +	struct seq_file *m =3D file->private_data;
> +	struct xe_sysctrl_debugfs_entry *entry =3D m->private;
> +
> +	return xe_sysctrl_cmd_write(entry, ubuf, len); }
> +
> +static int xe_sysctrl_ras_error_inject_open(struct inode *inode, struct
> +file *file) {
> +	return single_open(file, xe_sysctrl_ras_error_inject_show,
> +inode->i_private); }
> +
>  static int xe_sysctrl_loopback_show(struct seq_file *m, void *data)  {
>  	struct xe_sysctrl_debugfs_entry *entry =3D m->private; @@ -186,6
> +218,15 @@ static const struct file_operations xe_sysctrl_loopback_fops =
=3D {
>  	.release =3D single_release,
>  };
>=20
> +static const struct file_operations xe_sysctrl_ras_error_inject_fops =3D=
 {
> +	.owner =3D THIS_MODULE,
> +	.open =3D xe_sysctrl_ras_error_inject_open,
> +	.read =3D seq_read,
> +	.write =3D xe_sysctrl_ras_error_inject_write,
> +	.llseek =3D seq_lseek,
> +	.release =3D single_release,
> +};
> +
>  static void xe_sysctrl_register_cmd(struct dentry *root,
>  				    struct xe_sysctrl_debugfs_entry *entry,
>  				    struct xe_sysctrl *sc,
> @@ -235,6 +276,17 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *=
sc,
> struct dentry *parent)
>  		.mode =3D 0644,
>  	};
>=20
> +	static const struct xe_sysctrl_cmd_desc ras_error_inject_desc =3D {
> +		.name =3D "ras_error_inject",
> +		.group =3D XE_SYSCTRL_GROUP_DIAG,
> +		.command =3D XE_SYSCTRL_RAS_ERROR_INJECT_CMD,
> +		.resp_len_type =3D XE_SYSCTRL_RESP_LEN_NONE,
> +		.fixed_resp_len =3D 0,
> +		.user_resp_len =3D 0,
> +		.fops =3D &xe_sysctrl_ras_error_inject_fops,
> +		.mode =3D 0644,
> +	};
> +
>  	root =3D debugfs_create_dir("sc", parent);
>  	if (IS_ERR(root))
>  		return;
> @@ -246,4 +298,7 @@ void xe_sysctrl_debugfs_register(struct xe_sysctrl *s=
c,
> struct dentry *parent)
>=20
>  	xe_sysctrl_register_cmd(root, &sc->debugfs.loopback_inv, sc,
>  				&loopback_inv_desc);
> +
> +	xe_sysctrl_register_cmd(root, &sc->debugfs.ras_error_inject, sc,
> +				&ras_error_inject_desc);
This is broken piece of S/W ? will this work without the error injection fi=
rmware loading by late bind ?
How a developer uses these debugfs for debugging, without loading the error=
 injection firmware ?
Please add some documentation as well how this error injection will work.
Thanks,
Anshuman
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> index 26bd8c62b916..374aa73b180a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_debugfs.h
> @@ -14,10 +14,13 @@ struct dentry;
>  struct xe_sysctrl;
>=20
>  #define XE_SYSCTRL_GROUP_CORE		0xFF
> +#define XE_SYSCTRL_GROUP_DIAG		0x02
>=20
>  #define XE_SYSCTRL_LOOPBACK_CMD		0x01
>  #define XE_SYSCTRL_LOOPBACK_INV_CMD	0x03
>=20
> +#define XE_SYSCTRL_RAS_ERROR_INJECT_CMD	0xFC
> +
>  struct xe_sysctrl_cmd_desc {
>  	/** @name: Command name for debugfs file */
>  	const char *name;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> index 30d8b34dee47..46e68ea3a32f 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_types.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_types.h
> @@ -91,6 +91,9 @@ struct xe_sysctrl {
>=20
>  		/** @loopback_inv: Loopback test entry (inverted) */
>  		struct xe_sysctrl_debugfs_entry loopback_inv;
> +
> +		/** @ras_error_inject: RAS error injection entry */
> +		struct xe_sysctrl_debugfs_entry ras_error_inject;
>  	} debugfs;
>  };
>=20
> --
> 2.43.0

