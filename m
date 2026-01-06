Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FD8CEFCE1
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 17:12:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9A6710E09D;
	Tue,  6 Jan 2026 17:12:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RPDqZAfU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE6B610E09D
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767719564; x=1799255564;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZTnfbR1kt1d9PT+8wO/u0hg/IrYAk8vqbMGUw2wDR1U=;
 b=RPDqZAfUAMqD0r59RXAT0sTBZxO+XaIxQJNnh9KRZNusPAC0I+Slq4U3
 yHlFLsgUefrQxCM2KWqiJ8H2fU10colKE1IjPzz39nHS861exdoY/zFnD
 LYYajQmZ7wGUFKlNRjMKrLAkpXyxTDyfTEc0z3ReRQFCI4nFNfFif0+OJ
 gH8SbUebaw0+Pn29EVbAEQgnsi7CJs27Mi7x2E/FYNWl6tpqVuzp8H7ZG
 dsFQHc+4kf4sE/FaATU1rjjYl1PAoyqpHfiV1m9J8j+1IEZE8HYUcTiSB
 zaM/Cs7aZ2HwjO/c3uQqT9Xm1XPhxu0dT7c5jFNj8honNO2XJpHnIFfij w==;
X-CSE-ConnectionGUID: jVV1cSUfRLiSMbbbKe2w6w==
X-CSE-MsgGUID: 8nQml5lCSUKfeOJlebBPBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="72934181"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="72934181"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 09:12:43 -0800
X-CSE-ConnectionGUID: S2tZj/KEQeaaSdG/F9l4WA==
X-CSE-MsgGUID: /118XiTwRKmZhrT66v1Rjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="207745223"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 09:12:44 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 09:12:43 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 09:12:43 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.3) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 09:12:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EzJMtFhNpPP283KhwfpLBzoEJPAXhJMGfwta1BeeQ6N+8vNz8S0u/A7MRSZ5i/OErKPvcHeF62dT1JqMTSbSg7yTi2+PESRWqK9HKM16uyqILgTiGVaX9rUIjlSYLfXioAXUKD2fW5hbUH8HdlRGrsZ9haAXgpc6ryXGFDuyJ6NN2ZOClEeZ+lq6inRHRbB1RJ1wKmR2PaEdDRhoY0dsnIHfdkwdn6wi2Lb9YLuU8Eo9CJ0qlP2nYFnUz/HYUS3YaWcRAch3Qganpo6vEOheasZJSONydtQxeuHaN5Z5Rcv0tyoHsxxbUhj/AClRIRo4Vfqr5p+uiTxW4xEMAlbKWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QD02Q1/YRAPj6OaQx15RJbJQpwUJufmBq8QETSsgJCc=;
 b=pPyIIBNPoE/GQbe+jfgAW21w5RH3cuM3XLXsMJxxCCuW3IycyCJD+DarcI5W6/aFMliElJ/plz0NgGDuJfVApzzwCIVmARYmilowem6e+HH8pN5ehWqnMH0qFIRBrkLBaDETE3Jg5siWvPj4muRyRTaQCnKWJbt0Qd++SPsSuXhn9Y+0wMvZ0fZAAafteq0aITFmb4LTfNig1ixZiJ+Ag3whCqjjqeN2XDswyBCVSDTK45bBj53VwRaYUtQsciqWEOovboTSTfX9aqGVygOhwPa4XKybhKHhHNs91kipknq7a7CgcBnya+2G9OQW2QVvILT8ZpWwZbkN2LubuqpQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by SJ5PPF3A51834D3.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::821) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 17:12:40 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 17:12:40 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 3/4] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Topic: [PATCH 3/4] drm/xe: Fix page reclaim entry handling for large
 pages
Thread-Index: AQHcfpvYigKI4kBLZEmGy+Z2qS4LI7VFWYUAgAACngA=
Date: Tue, 6 Jan 2026 17:12:40 +0000
Message-ID: <SA1PR11MB88395D5AD86CCA537779410DAA87A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
 <20260105233351.3753716-9-brian3.nguyen@intel.com>
 <aV07VAFD8K8YaGlV@lstrano-desk.jf.intel.com>
In-Reply-To: <aV07VAFD8K8YaGlV@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|SJ5PPF3A51834D3:EE_
x-ms-office365-filtering-correlation-id: a86c20d9-aab1-45dd-71f9-08de4d46cc70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Mftu6L9ygaLz9StMQf/un8pK4NpSEW/QyltG7v4fNaKB04enAAjkGUEB193e?=
 =?us-ascii?Q?lWezBRja4Rxat5KgkgjLDZJ5rhCml686mPJHklAtFdurF3x4uc6UEmSWuT52?=
 =?us-ascii?Q?n3/iDAxzwGWTjPj4RkeOh6BPQJdT300Nz0VI3/AyuQI90ZPP28HPXPcEBrFG?=
 =?us-ascii?Q?l1+cEBgCoaoNBTLbBny3uK2JHjV0xPAiBAw5ZhMTp/wADBgwNBAvcGFSAaIE?=
 =?us-ascii?Q?8ws4VrRQY2sNvZIV7VeHYsOBSke8Yc9lnTPm3e9zOnu+iDKOhPN9ORTFJmhK?=
 =?us-ascii?Q?0x+f0fOM4iwQjnazuKO96aRwuf+uhLR5FXET8itHVhRKqUr6XIPjAj+Y33yN?=
 =?us-ascii?Q?sXsApvPm8WFwNJ3+eQs6XDF/k17X7N3Bfp+SxJyYOtD0fLY1UrJuhFC5e4cL?=
 =?us-ascii?Q?qY7hO2lGs5gyb1jyhKBmlv3OIyyZU9Lk7UPLTMb5+honkLHIwgCW2bP7754q?=
 =?us-ascii?Q?9w2Og+S1ph+1Jd0/J0EXjyE4n0qWdwwZnZvX+bhar9IdD84y6kPoTq93jUYg?=
 =?us-ascii?Q?tcq4qITgZIQEvnmda/A1/0VLNJ4zRjNtqoGgcTvZwuXYQkiVaGgkDsQ+CNK4?=
 =?us-ascii?Q?nr4Qr85ylrOLhOn1nG9nDUlyFihpD/MMkpevfmj51bFJxiVf+/GYeEiNtnc8?=
 =?us-ascii?Q?1BzF+L1DBR0dlNWXoC8o15IM4FaLR0o+3I4XqPk7lFY31OcAN28n8cSkSYD8?=
 =?us-ascii?Q?1qUG+hnisjHh/mwtXkPb+L4BwDQy7GAZp44xSTxY3CgODB19NWDBphy2gOOC?=
 =?us-ascii?Q?i6NP/z415t30Kfc4jKVcvkOWte5rujpQVk+HgVS8WKaA1pa1f/JJv2XWkP8w?=
 =?us-ascii?Q?c+DVvq8YFvVTeZ3eA002mAzd3aQPuYa4zSilEDyxTXn5pmGnV2VG1W0560JR?=
 =?us-ascii?Q?1qBZ+U/rUqzIWq3ELHCOSuyCqmIC1apJgW3tKnpmi2Ye3vt0nRMVvkBEO7rj?=
 =?us-ascii?Q?yoHBXgIO/kXYkqcYREaeFhflKRyWukhvpIPonY6mwpYewNdrDiFUgGYOWWSQ?=
 =?us-ascii?Q?DWc8khQYLV2Tz9NyjcLB5u/a4J8wcnwXvyOi4/4C+2bcMmP/2kiqWOWIGmAS?=
 =?us-ascii?Q?OIDv2OOTkuIOTOCZ58BlddynGIPpmarx523x1MRymr+WD2y1pe2LPAGT5y0G?=
 =?us-ascii?Q?n2WR7EHjW3tOR9VxZoh0rfPEahfo5mtDtWTI/bfznoq9WKYfAAXs4Qg9X7+D?=
 =?us-ascii?Q?GEU2ynlfrSZeWJCqB/QvU5PIxBWOPowDyogEGPu7peFftYd1/FWhrhs6pJAB?=
 =?us-ascii?Q?b1/xzE5X9gQSWoPqtI5Qj/uoug6oOPTKixLSi37WoVV0azppGZpi8PuoguCa?=
 =?us-ascii?Q?7UaaUphbENobIp4YU3hgnszTBuKhrA9XHuNuWcrVSqwRw8OyZS4OKqPoWLvA?=
 =?us-ascii?Q?sJC+B7j2NmiuxExJ0ATC3UDDkKQwj2felJ6hJnX0KZv9hy/gZ3Lt6SM1+Vj3?=
 =?us-ascii?Q?/EYBhAVdg07xH0nLcpT3Zr99vxTMvxM1/7DkFWwYDhGcdI7vRzLS0hjQ55af?=
 =?us-ascii?Q?cEDx1MoNffmy9Mc0ldxAxUxNHG3h9JKENeoI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4JB4p7bqHVLYyXyPK81erh2j9tSCDWIOjtnUP0k6qjKedfVhDuSY4RNw0QjQ?=
 =?us-ascii?Q?TkhPgiuh4ZXHN7JKrp1qLiwSmWwu/JpuR+ekfHygsak5ZP23yhugTKVjfrZV?=
 =?us-ascii?Q?BmuoJ2XrgstsPOZFPPZWt4LXL9ub44cptGsdeS2QElazdsrlisFo3MBqIZxj?=
 =?us-ascii?Q?r93/pDCTiKDfqbHuhFdAZ++aBqcv99jdD7V5yxHgWeGHwnl+qk4WivSaveVf?=
 =?us-ascii?Q?1zDeYC3T9K/Pv0w0gSNViSwu6g6bY0JNG+7Yh4X7tiO5GpnJlnwWDB5HUuNm?=
 =?us-ascii?Q?f6oWIi9S0gIuqpBa+0e7oHQFIgOCp2qizsxZOiBuwuKzaObMjGo+F7qkd/MG?=
 =?us-ascii?Q?1w/a1+8Q27sU8KKguSds2ZDycsxwqS71o9HwY41kog+dbnz/Vv5oySBDtE3Q?=
 =?us-ascii?Q?GoOOK8FhP+zSArHKx59G/KjGIQIi20vKzsc79qLaw2xLze/K6lPP3HeWIW2/?=
 =?us-ascii?Q?fUiRcp67swxk46Mhiq28XkqAyAUc0Meb000IXvEjTHquWyeTEVNk02rrBN55?=
 =?us-ascii?Q?Q5qcw+Xw11nxdyjECmVjwZdZCZQ75W+Hwv/idq6zL9yhiUYD8rlZv7LH+sJb?=
 =?us-ascii?Q?uJbhAdaGs5lrIlC70b7KbWj+geN4kPT9au95zS6XHbDOl+CZ+N1fpUiBLYQf?=
 =?us-ascii?Q?NxoltAV8z0RzIB9KSQLTeYb7cE1E1HU2oC/2/Rl3O2jpEhoLZz9Y1YWqjV11?=
 =?us-ascii?Q?hOj7tIhWyW+X79Ym8ygahe6RbUTtXOzoGCecRsqyltIBBLDAr6J97juIM1J1?=
 =?us-ascii?Q?rcEIE4EQ4KGTvpiPRDjltmh5NZbKoHcifN+TXUzk66d3cltipPy4X+Ij71+G?=
 =?us-ascii?Q?p7srCyHM5ncFk359dUOJqkNr75KHCu2KLio1XoSWqZvOyqo4A27sfWK0j6S2?=
 =?us-ascii?Q?uzbhCoiGQoFzYYqt87FOsi5VTXeG6WKwkA+zy8hwAhjdv6lQSPUKbGts2Oyo?=
 =?us-ascii?Q?OowZVW8CyrtDwk7shrTFnbVRFh1zFQEa+KIjTDMO7/t7BnP6f9GnxEYKKYgG?=
 =?us-ascii?Q?cUy3rgSTVi5nBnhq0QzOhWGS5niNn0mBnoO8k/mD6W27VNOpqyjxw6W6VwS/?=
 =?us-ascii?Q?oNSGjIAvLoGlJky0J80D6LGmmp5GzPxplwKI1Q4h4e6O0u682Fh4EVbctUVj?=
 =?us-ascii?Q?jpTdwUuagyagWmdkMhGXW0FdVW4i7gNXR/HeSUB7GQY63xTQYP0A2TVOWig6?=
 =?us-ascii?Q?GZ3AiQS84qu+Ug1umTO5U8W7uyYQOIi8xtjOqPqcuuNQuAjpzJwN9iudF2ya?=
 =?us-ascii?Q?pOoVnd0JOWSQD36/KJpf7aBHe5qgbGJ0J37xLshCO+pM2Nn2uR76hqllb1wj?=
 =?us-ascii?Q?yjwd7QrPFY1WEpAeF/VKOS8z4pw2Vd1ShbRxCfsGDsWXUbfG3hbmzDhaB9Ss?=
 =?us-ascii?Q?3Chk7trAaZvO0GXrlJKSo2z8N7+sSkTqmpGAKWTetmATUzNI+ltMLjyjSYTR?=
 =?us-ascii?Q?jTCpmy4mjhu57KuL6hWsKsKns10xTDbmIvKlFi0PPJrNA4UkSq0xqNeYVV5B?=
 =?us-ascii?Q?bCdVRdMD4cWDQQrD1+4mrEFu01i2f5m42uAbgMdUWG05l0VjWPyY5hSSaqtW?=
 =?us-ascii?Q?0WNXU9pBF1U76H2Cb83F3U6BID6oAjEIIY6mVoM7QrUcI/8ets3RnP60VQVy?=
 =?us-ascii?Q?7mJb+vTd3UhZMLcXyqOK546tFxQ9aiT0YLqDMRgGUjhHGzjML4Y7fdB7KPpG?=
 =?us-ascii?Q?XUQl+ZkZFAFmFobpy5QPkPXo81yih1nSpAwcNx/Vco7Ru4jtb3+MP8x4CsBH?=
 =?us-ascii?Q?kQpiROaSG6+uf0pYkkiVomO36LrSQKr4HIi8Uunz9ro20ul8I0TNrM30HTp4?=
x-ms-exchange-antispam-messagedata-1: Ol7g+phrNRnzow==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a86c20d9-aab1-45dd-71f9-08de4d46cc70
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 17:12:40.5795 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lDRIr1zQlmIOZ26MyPfVXRgCs96A47DZZ7PVLqof2IBcQpyVOipfvjaGl6RowHO2L/QYRZ5TrFs8ZhrCFqONGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3A51834D3
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

On Tuesday, January 6, 2026 8:42 AM, Matthew Brost wrote:
> On Tue, Jan 06, 2026 at 07:33:55AM +0800, Brian Nguyen wrote:
> > For 64KB pages, XE_PTE_PS64 is defined for all consecutive 4KB pages
> > and are all considered leaf nodes, so existing check was falsely
> > adding multiple 64KB pages to PRL.
> >
> > For larger entries such as 2MB PDE, the check for pte->base.children
> > is insufficient since this array is always  defined for page
> > directory, level 1 and above, so perform a check on the entry itself
> > pointing to the correct page.
> >
> > For unmaps, if the range is properly covered by the page full
> > directory, page walker may finish without walking to the leaf nodes.
> >
> > For example, a 1G range can be fully covered by 512 2MB pages if
> > alignment allows. In this case, the page walker will walk until it
> > reaches this corresponding directory which can correlate to the 1GB
> > range. Page walker will simply complete its walk and the individual
> > 2MB PDE leaves won't get accessed.
> >
> > In this case, PRL invalidation is also required, so add a check to see
> > if pt entry cover the entire range since the walker will complete the w=
alk.
> >
> > There are possible race conditions that will cause driver to read a
> > pte that hasn't been written to yet. The 2 scenarios are:
> >  - Another issued TLB invalidation such as from userptr or MMU notifier=
.
> >  - Dependencies on original bind that has yet to be executed with an
> >    unbind on that job.
> >
> > The expectation is these race conditions are likely rare cases so
> > simply perform a fallback to full PPC flush invalidation instead.
> >
> > v2:
> >  - Reword commit and updated zero-pte handling. (Matthew B)
> >
> > Fixes: b912138df299 ("drm/xe: Create page reclaim list on unbind")
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pt.c | 50
> > +++++++++++++++++++++++++++-----------
> >  1 file changed, 36 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 2752a5a48a97..668a981696f9 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1576,12 +1576,6 @@ static bool xe_pt_check_kill(u64 addr, u64 next,=
 unsigned int level,
> >  	return false;
> >  }
> >
> > -/* Huge 2MB leaf lives directly in a level-1 table and has no
> > children */ -static bool is_2m_pte(struct xe_pt *pte) -{
> > -	return pte->level =3D=3D 1 && !pte->base.children;
> > -}
> > -
> >  /* page_size =3D 2^(reclamation_size + XE_PTE_SHIFT) */
> >  #define COMPUTE_RECLAIM_ADDRESS_MASK(page_size)				\
> >  ({									\
> > @@ -1594,7 +1588,8 @@ static int generate_reclaim_entry(struct xe_tile =
*tile,
> >  				  u64 pte, struct xe_pt *xe_child)  {
> >  	struct xe_guc_page_reclaim_entry *reclaim_entries =3D prl->entries;
> > -	u64 phys_page =3D (pte & XE_PTE_ADDR_MASK) >> XE_PTE_SHIFT;
> > +	u64 phys_addr =3D pte & XE_PTE_ADDR_MASK;
> > +	u64 phys_page =3D phys_addr >> XE_PTE_SHIFT;
> >  	int num_entries =3D prl->num_entries;
> >  	u32 reclamation_size;
> >
> > @@ -1613,10 +1608,13 @@ static int generate_reclaim_entry(struct xe_til=
e *tile,
> >  	 */
> >  	if (xe_child->level =3D=3D 0 && !(pte & XE_PTE_PS64)) {
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_4K);  /*
> > reclamation_size =3D 0 */
> > +		xe_tile_assert(tile, phys_addr % SZ_4K =3D=3D 0);
> >  	} else if (xe_child->level =3D=3D 0) {
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_64K); /* reclam=
ation_size =3D 4 */
> > -	} else if (is_2m_pte(xe_child)) {
> > +		xe_tile_assert(tile, phys_addr % SZ_64K =3D=3D 0);
> > +	} else if (xe_child->level =3D=3D 1 && pte & XE_PDE_PS_2M) {
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /*
> > reclamation_size =3D 9 */
> > +		xe_tile_assert(tile, phys_addr % SZ_2M =3D=3D 0);
> >  	} else {
> >  		xe_page_reclaim_list_abort(tile->primary_gt, prl,
> >  					   "unsupported PTE level=3D%u pte=3D%#llx", @@ -1647,20 +1645,39=
 @@
> > static int xe_pt_stage_unbind_entry(struct xe_ptw *parent, pgoff_t offs=
et,
> >  	struct xe_pt_stage_unbind_walk *xe_walk =3D
> >  		container_of(walk, typeof(*xe_walk), base);
> >  	struct xe_device *xe =3D tile_to_xe(xe_walk->tile);
> > +	pgoff_t first =3D xe_pt_offset(addr, xe_child->level, walk);
> >
> >  	XE_WARN_ON(!*child);
> >  	XE_WARN_ON(!level);
> >  	/* Check for leaf node */
> >  	if (xe_walk->prl && xe_page_reclaim_list_valid(xe_walk->prl) &&
> > -	    !xe_child->base.children) {
> > +	    (!xe_child->base.children || !xe_child->base.children[first])) {
> >  		struct iosys_map *leaf_map =3D &xe_child->bo->vmap;
> > -		pgoff_t first =3D xe_pt_offset(addr, 0, walk);
> > -		pgoff_t count =3D xe_pt_num_entries(addr, next, 0, walk);
> > +		pgoff_t count =3D xe_pt_num_entries(addr, next, xe_child->level,
> > +walk);
> >
> >  		for (pgoff_t i =3D 0; i < count; i++) {
> >  			u64 pte =3D xe_map_rd(xe, leaf_map, (first + i) * sizeof(u64), u64)=
;
> >  			int ret;
> >
> > +			/*
> > +			 * In rare scenarios, pte may not be written yet due to racy condit=
ions.
> > +			 * In such cases, invalidate the PRL and fallback to full PPC inval=
idation.
> > +			 */
> > +			if (!pte) {
> > +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl=
,
> > +							   "found zero pte at addr=3D%#llx", addr);
> > +				break;
> > +			}
> > +
> > +			/* Ensure it is a defined page */
> > +			xe_tile_assert(xe_walk->tile,
> > +				       xe_child->level =3D=3D 0 ||
> > +				       (pte & (XE_PTE_PS64 | XE_PDE_PS_2M | XE_PDPE_PS_1G)));
> > +
> > +			/* An entry should be added for 64KB but contigious 4K have XE_PTE_=
PS64 */
> > +			if (pte & XE_PTE_PS64)
> > +				i +=3D 15; /* Skip other 15 consecutive 4K pages in the 64K page *=
/
> > +
> >  			/* Account for NULL terminated entry on end (-1) */
> >  			if (xe_walk->prl->num_entries < XE_PAGE_RECLAIM_MAX_ENTRIES - 1) {
> >  				ret =3D generate_reclaim_entry(xe_walk->tile, xe_walk->prl, @@
> > -1677,9 +1694,14 @@ static int xe_pt_stage_unbind_entry(struct xe_ptw *=
parent, pgoff_t offset,
> >  		}
> >  	}
> >
> > -	/* If aborting page walk early, invalidate PRL since PTE may be dropp=
ed from this abort */
> > -	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &=
&
> > -	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child-=
>num_live !=3D 0) {
> > +	/*
> > +	 * If aborting page walk early or page walk finishes,
> > +	 * invalidate PRL since PTE may be dropped from this abort
> > +	 */
> > +	if ((xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) =
||
> > +	     xe_pt_covers(addr, next, xe_child->level, &xe_walk->base)) &&
> > +	    xe_walk->prl && level > 1 && (xe_child->base.children &&
> > +	    xe_child->base.children[first]) && xe_child->num_live !=3D 0) {
>=20
> This is pretty confusing if statement. I'm not really following the 'xe_c=
hild->base.children[first]' check. At minimum can the comment
> above this if statement perhaps explain all the condition here?
>=20

Sure, will add a comment here for the conditions.

My line of thinking for the conditions were:
xe_child->base.children[first] addition was due to xe_child->base.children =
check being insufficient for page directory above level 1,
which would correspond to the 2MB pages (appears to always be defined even =
if it's a 2MB leaf). In that case, I am looking to see
if that 2MB page directory has a child at the corresponding index and if so=
, we can determine if it's a leaf 2MB page table or still
some sort of page directory.

xe_pt_check_kill was the check to see if we kill subsequent page walks.

xe_pt_covers checks the condition where we'll walk a page directory that pe=
rfectly corresponds to the range so it
will not continue to page walk. The worry here is for a case such as 1GB ra=
nge filled with 512 x 2MB pages, we will
walk the 1GB range but won't enter one level down, which will drop this ent=
ire range if not handled.

xe_walk->prl && level > 1 is nullptr check for PRL and to ensure we don't f=
allback on a pte killed.

xe_child->num_live !=3D 0 ensures that the range killed is one that doesn't=
 have any children, then there's no need to fallback.

Brian

> Matt
>=20
> >  		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> >  					   "kill at level=3D%u addr=3D%#llx next=3D%#llx num_live=3D%u\n"=
,
> >  					   level, addr, next, xe_child->num_live);
> > --
> > 2.52.0
> >
