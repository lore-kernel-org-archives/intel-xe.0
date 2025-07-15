Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B509C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 18:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A553710E630;
	Tue, 15 Jul 2025 18:49:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="a6s/5V6G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB07410E630
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 18:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752605354; x=1784141354;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Qk/0iSnt592lxWKI8cYWqLI46uRTfiCLPoBHfOBCdbA=;
 b=a6s/5V6G5NoJqobMetXuTsjEcIMJzYi1fHtdavyJ8CCRBQ5kJxZa9qPA
 dKzS7BZF5JiMuilDFaT6W6MDcbwttxHEp7w5GEK51hc3qTGjMNvhMXVy3
 gT/jwq8ORnw+4PHuEb/G9JR7BZ3ZHtzBk2GvaWXiT7ztaCkQouWrPqaYe
 WQCk8O9/vJZBIRum02eTk10r19BTbEq+kyP1x8WCAgWwGllDWitQKqDeo
 8Wh9K/0CJSG0DLv9JYC3KGhQF7Qr0HocsBAMaLx5K3ZfLgxxajyKwNZk1
 6VNV8FVwdNK9HZAauF03MIT1OH+JXTPGg99d1YL3EWeFNGwGI8zDO84nZ Q==;
X-CSE-ConnectionGUID: ME+yDWRSQ/KduBseygVRQg==
X-CSE-MsgGUID: mGzO+9s8QsuLRzHsqxmE0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="54928828"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="54928828"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:48:31 -0700
X-CSE-ConnectionGUID: daFtgtNHRNKSsScvnDJicA==
X-CSE-MsgGUID: g/DU6bu8RCGO1XidcmIJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="156965344"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 11:48:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:48:27 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 11:48:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.71) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 11:48:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2wDFcZnXgfnhobXTGYbkt4CJyrfx8BijTe5TKWTVH62dyay3HbdZ5c+Z89FL4tXGHKJMuMYwmLJ13ccB+LaWParjc0KQcyZMW9s7NmnAd4zxjsKb3il0FPipwjvD6qSZvBiIAhRux/GhquGtx+ri/NMZ3x8ofeZaaD82kK7tMBuQSXZpLbSyiS5kCtPVridYmHoq78d6mGT2LaPHjlPzoJVquvNIeSkZD0bJoT2TU8IQUHxBmIFt3Jx0y9xhBhsbPqD5XELSw3nfUbOuqz1qduMFoox29ou+3z0yqUhS/fCv8k+NEvnjCmHocqDrOcIfNqHSoT4Tdf4+9AHuWA3Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wSZjrN9XPAAmeerWccOAVhXSHP8OBezgHVHzppA7U4o=;
 b=mNeLDjQk6B4xZyvaJpOGiRLjTk8OO4SEw9G938Z2EXyLBk6wmWTYt/d1G6LJrMwNObMn/SHK+pv7zA2iX5tQE9ie0UOsrJ8exz+P2WDeYQOeQ/Nlq7yD88PR/liwxVGjo1jsr6y/QXjRoPhftvVgwBnBjsl76SrZx6SSctmJvz48p41eVEYvSZcXg1+yaL21AY+qGNRYRzkJ9P/TlEAb2wahmNouZxPasVLK59WTThJa8FbNUNt0JoQEpypoRWFP+X3nmytOh0jHWGZNXIlAtCzsDmrIm4I0INshCSBXPCY6JukGzwJcp5PeqEfuaTHT+LEK8WMn8l51LWbK7d9keA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ2PR11MB8369.namprd11.prod.outlook.com (2603:10b6:a03:53d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.29; Tue, 15 Jul
 2025 18:47:43 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%7]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 18:47:43 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>, Thomas Hellstrom
 <thomas.hellstrom@linux.intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Topic: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
Thread-Index: AQHb9bRmPQnZvo1mEEyH84It6bFi47Qzfj7QgAAEFICAAADNUA==
Date: Tue, 15 Jul 2025 18:47:43 +0000
Message-ID: <CH0PR11MB544430AE643E37CECE0FD3FBE557A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250715181419.807-1-michal.wajdeczko@intel.com>
 <20250715181419.807-5-michal.wajdeczko@intel.com>
 <CH0PR11MB5444C731316EA811DE6ADA58E557A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <357a4f2a-574a-4433-b893-a2f52089c8ef@intel.com>
In-Reply-To: <357a4f2a-574a-4433-b893-a2f52089c8ef@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ2PR11MB8369:EE_
x-ms-office365-filtering-correlation-id: b5097503-38ce-4a16-3393-08ddc3d0156e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?XcSQbQ6Vy2FtT90UQazGYDh3Sxg0ZsBTXfGjXwVgtWjQgb0Zx1ObFoS/04s8?=
 =?us-ascii?Q?8Ecm9g+cjreiMQY61qUYnB03g5mG7u66vaUNYciNIbn+qrGEuLiatGqbYY/q?=
 =?us-ascii?Q?dpQTof9sDq0FjqcYW6FMLQUZsyeEgcJxd1g+nRnMaZH761tagyCpz1vYim8i?=
 =?us-ascii?Q?0rAoH5wriOyWNsNXuD1PV+X0oaIXzI58gld+mbP3Ed67eG71ZggInN2Hmj7v?=
 =?us-ascii?Q?rijVHsof6xUgevbw/67/SAj+1CoYh21XZPn17oRhJYTT1xkyjI8BKIglch7w?=
 =?us-ascii?Q?YvEleisdEHJTleV6252sMepPYNPDD/Ql9JnSFfQZjpEkqNiSCkfIKzRchPgm?=
 =?us-ascii?Q?osZIpQXujV8nn0DV61tAlPuNp+Lq7Qll5UF4Lbwf5QkC3KtIdtIsWTKtTxp2?=
 =?us-ascii?Q?i3VdROiSOHfagXZsvWn8ifQ98JdKTVLf4tQXyhY02R0sAktjn9wIumrNp9GZ?=
 =?us-ascii?Q?Du3cwMaLO5K26HBYPARH7A3iqs7UHP6nW2b3yb9JZdSKBWyg/pJSoGRpSTzH?=
 =?us-ascii?Q?+vtDSpqmLMmYVgt87Wt6UuH1EgKDCbZ9t4geJ3bXNDmjtx6pIln1r8hwUWgd?=
 =?us-ascii?Q?OBF3/K+L698BdBlIFcpXWnYbsAu9jcFdJM5W4jcu+NnVl/dmU4JLZjtyrlSb?=
 =?us-ascii?Q?3RnPRCejbaCxF5mJfqXsCPASuO+uTh8oNaDgcDT0S65J+cLJPJJwRQ8DKM/z?=
 =?us-ascii?Q?Fkq6oO728zLf7j4khCvj/742yxzH28Zh4MO5vhL+cpnTx8Qw15iW/FI8cGop?=
 =?us-ascii?Q?yzsb00d9o2h5dURClZOONmn+0jwX7X3u1BJGo72NquCsDmHOL0/b08vEQp4v?=
 =?us-ascii?Q?YvRr7sxn86LgcAvKOvmzbqEpPSWzoJoU/90pyURm+wDANuZOuBLK9UKS8Z2T?=
 =?us-ascii?Q?3AfwUI6RI4CDmGxENPfAiIdsNgtiKj6mgvTt7CRMXK52ZWR0oyDVD6Q1oN5E?=
 =?us-ascii?Q?h1YwMQuRhHBKvgFN0aQtc594cOYwiEWcd/qtRNDcQF1DpzMrVNkUmG09y0iE?=
 =?us-ascii?Q?9zXc5CcMIlw+/I81OGqXkmOdqxx9RfkNrWKWZQ0nC7RJiNnwzpRZUuZZm2tX?=
 =?us-ascii?Q?58QUcVYpqrMN92yDN1zvQQMmMV32L76zWzUelVeVpRsM89INNqvkYj+hXeqL?=
 =?us-ascii?Q?GOotrD3WwnbH+XWxdXLN2TphUFzTr6Z6Q4xWygnqaE0eojm4wnXsivrFnCcl?=
 =?us-ascii?Q?ydbVcxRxtG3AqZWUkho+iohFGpIBfE/j6ADLbu0DCTOqnx0dGp89WS5r30t5?=
 =?us-ascii?Q?mxk5VhUGodlWsSn6CFtiYWKQFm1Lrxc8Ibkq89nffTrDvZKmfFBJQ1Y+OdhR?=
 =?us-ascii?Q?xniqAlptvFWD636E7RoRw2CwsxIEM4dZXx+6VHGMHMKcZH8FMnm/CTDJy7RX?=
 =?us-ascii?Q?CyPWsyLa+cwnIb4RbWmN+PEZ7tOwG7zXCkURF1RrBgNO2/f62hxChIM9Z5TM?=
 =?us-ascii?Q?K6jVRB66Gec=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?gcMpOHvdyBnJMnST9/J1elg0+NOwXbj7XBL9JyjGjkAQS9HlV6WLZF0ccekf?=
 =?us-ascii?Q?lFpt6PdWFJv0BHV+3Qh22a2N0aYhNSJ6av1xKU8NEy9k/+Og35oAB9q4368d?=
 =?us-ascii?Q?Bc6cVZCmuWfBjYTCFEdr7J+e/wsn0pULgn1Pe4C79Vfs0yaOdOr1tKOc1wiq?=
 =?us-ascii?Q?/C2xoprNypXfwazVQDQkzz0JwEe250R+CJiV2Hbuf6s5qJjTKsc1OSTk1CEX?=
 =?us-ascii?Q?Ad6V7z9+e/H8PfNU9/oRbvbm8GDidIfVk+Q9Yczanh5b7BuE715zkiypZAkk?=
 =?us-ascii?Q?EF2C5MiwGH4tH/eKAOadyG/oggO56bGPUDa30NeUTOvrt8hiz9KHDzpB6jsP?=
 =?us-ascii?Q?E/z9CZBcL8pSHoG1NDf2cYmY6O6fypjzZ4oBVcyBBP/Zcyjgvb9s9MWW+kj1?=
 =?us-ascii?Q?w+x0e3Jtx/wwsl9XkOynSP5/bBY9XhtT8Sk2qwo6+9QvyH5nsVQcyW1n3gN5?=
 =?us-ascii?Q?dNgD4SZS6Y/gyjJ0ZV5uWtPG2iwn8xPi4QHFLN8TPI9j5LF7kIHjtsXTxewE?=
 =?us-ascii?Q?R0l3uF4ZI3TNDcXQIyE2xqzbkYN3CMGuC/AbiMJG9xHCLYavHIv+QIppCGf8?=
 =?us-ascii?Q?/2ZyQOse3dUFPgoiD5phLpJec1SCNYCsF1VhHo5RD6rPWcnbBtWVsp0QISTd?=
 =?us-ascii?Q?g5qUymqszVbcGO2ENd3B6rLVxXe23dvzrJG/YeEW632n2bcAWGs/ZtJvtSd3?=
 =?us-ascii?Q?kIQr1I3333Qb7KGh3wTLYChUutN+OTY1mADrGQtHLoKF8dzaOCF2Q2NaK7w4?=
 =?us-ascii?Q?LcNAIk0Gre8RlAfH23hXUVTVOI1488/GVAh1Ml5MtFEdkEafA+hjn1AHVhT0?=
 =?us-ascii?Q?gG5UUlOA1PUd0nXIpe1AwLt9pT4fAv9+uFY06GqO+Smr1bLkFnsRVoYe5He6?=
 =?us-ascii?Q?r4c9ZBMDGBXQ/F83FtvUni+Y/slqQuKRWYzeQagLqg++i6lS2DvVus0Hkf1q?=
 =?us-ascii?Q?oakp0v0qW7QRrT1nrBXf3boKCaStqo+Bynviz7XC8rnP/Z4RntNVGvvfWYj/?=
 =?us-ascii?Q?irMJIYRsGITOaic0UNZnDTje5udbcQRNR3Pmc6O2bU5a1JHCPOIB5JNSfHRv?=
 =?us-ascii?Q?bjhk9gcoxmfjXHNINAnIvoDM9/pWlFWdo+Rg0YzK1E8UNxtA+0MUxkE/E6Ai?=
 =?us-ascii?Q?o9asdmVG26ASh2iHMPTmlqFvPYhMM9tPOhDvxuSX845Qyj3POCNVeR+qnWrk?=
 =?us-ascii?Q?0xVdHe5/pcrD5n3tbX69OO8J5t7cT93+BmDsojfRUhxloaKyCtBs9pTulUGi?=
 =?us-ascii?Q?n8Udptlks8Po66MFiPX3d9jq7CaY7FXP35PYy6x0hUX/SCGv4naYYk77v+V9?=
 =?us-ascii?Q?R1RQn3ht/qRt8jSVYyv4gzwH/h+0mM7WGmCCyskxkGfplujS5bHTHB/UsxRg?=
 =?us-ascii?Q?NWzyf2PiwCYXjhviGuJhX6CqLhB9kN7biWpVCWgxzkermJRkfo5VwAEOth95?=
 =?us-ascii?Q?U9PDI/wowSqo8xZckiHxAf8HxhP62FJD3ClF0zfK8Al9PHWtZ3PTI5gISnri?=
 =?us-ascii?Q?Z/0HY7e4m+JCTqu/vHnzds1SSYfjHtV0n+v/JtoYAK3FU+Onybm2L63PBGJx?=
 =?us-ascii?Q?Awq0s4J4Vuzzp44MyRUZaPD57GaQOYYK54gNif1UcYqKQ0I8qaBcdAGU6Q6Y?=
 =?us-ascii?Q?Vu8uSZKt6PKcR4JVUeQ07dQ=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5097503-38ce-4a16-3393-08ddc3d0156e
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 18:47:43.6304 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xhNhz7hMAh1Sr5KcHBBOvrjZuc0/i8bpWztlAd16v7ofDy24J82fSGe93e8r2OyIJApxMU3z2ndt/IOjrMdW8/9bCDQBPHZRb+iL3yBA1mU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8369
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
From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
Sent: Tuesday, July 15, 2025 11:33 AM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>; intel-xe@lists.freedeskto=
p.org
Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; De Marchi, Lucas <lucas.demarch=
i@intel.com>; Thomas Hellstrom <thomas.hellstrom@linux.intel.com>; Ceraolo =
Spurio, Daniele <daniele.ceraolospurio@intel.com>
Subject: Re: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
>=20
> On 15.07.2025 20:24, Cavitt, Jonathan wrote:
> > -----Original Message-----
> > From: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>=20
> > Sent: Tuesday, July 15, 2025 11:14 AM
> > To: intel-xe@lists.freedesktop.org
> > Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>; Vivi, Rodrigo <rodr=
igo.vivi@intel.com>; De Marchi, Lucas <lucas.demarchi@intel.com>; Thomas He=
llstrom <thomas.hellstrom@linux.intel.com>; Cavitt, Jonathan <jonathan.cavi=
tt@intel.com>; Ceraolo Spurio, Daniele <daniele.ceraolospurio@intel.com>
> > Subject: [PATCH 4/4] drm/xe: Enable SR-IOV for ADL/ATSM
> >>
> >> We should now have sufficient changes in the Xe driver changes to
> >> run it on ADL and ATSM platforms in the PF mode, to configure VFs
> >> and successfully probe driver on the enabled VF devices.
> >>
> >> While some more changes are likely still needed to fix all corner
> >> cases, we will not find them without running any tests. To start
> >> testing this feature by the CI, we need to mark which platforms
> >> have basic SR-IOV support and let the driver run in the PF mode.
> >>
> >> Since this feature support is still in the early testing stage,
> >> make all enabling available only for CONFIG_DRM_XE_DEBUG=3Dy and
> >> keep it on CI topic branch.
> >>
> >> Note that from this point, on selected platforms, the Xe driver
> >> will be acting as a PF driver, will some SR-IOV specific changes
> >> compared to running in the non-virtualized (native) mode.
> >>
> >> However, those specific changes are visible mostly on the debugfs,
> >> and should not impact normal driver execution, unless VFs will be
> >> manually provisioned or explicitly enabled.
> >>
> >> Once we finish adding the remaining SR-IOV tests to the CI and fix
> >> any issues that we find in the meantime, we will replace this patch
> >> with proper series outside the topic branch.
> >=20
> > We're reapplying this patch with the purpose of removing it from the
> > CI topic branch and putting it in its "proper" place, yes?  If so, then=
 we
>=20
> no, this patch stays in for-CI topic branch, it was just rebased on top
> of patch 2/4 that will go first to drm-xe-next

And the rebase was necessary because
"drm/xe/pf: Add max_vfs configfs attribute to control PF mode" (patch 3)
needed a partial component of this original reverted patch (patch 1),
so patch 1 was split into two different patches (patch 2 and patch 4)
and patch 3 was inserted between the two?

Why did patch 3 need to be inserted between patches 2 and 4?  It seems like
it could've just been applied on top of everything else, at least from a cu=
rsory
glance.

-Jonathan Cavitt

>=20
> > should probably remove this sentence, as the replacement mentioned
> > in it is being done presently.
> >=20
> > My RB otherwise stands.
> >=20
> > -Jonathan Cavitt
> >=20
> >>
> >> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Acked-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Acked-by: Thomas Hellstrom <thomas.hellstrom@linux.intel.com>
> >> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> >> Link: https://patchwork.freedesktop.org/patch/msgid/20240711192320.119=
8-3-michal.wajdeczko@intel.com
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com=
>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >> [michal] rebased, for drm-xe/topic/xe-for-CI
> >> ---
> >>  drivers/gpu/drm/xe/xe_pci.c | 4 ++++
> >>  1 file changed, 4 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> >> index 53d45779cbe9..dc4c8e861a84 100644
> >> --- a/drivers/gpu/drm/xe/xe_pci.c
> >> +++ b/drivers/gpu/drm/xe/xe_pci.c
> >> @@ -193,6 +193,7 @@ static const struct xe_device_desc adl_s_desc =3D =
{
> >>  	.dma_mask_size =3D 39,
> >>  	.has_display =3D true,
> >>  	.has_llc =3D true,
> >> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> >>  	.max_gt_per_tile =3D 1,
> >>  	.require_force_probe =3D true,
> >>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
> >> @@ -210,6 +211,7 @@ static const struct xe_device_desc adl_p_desc =3D =
{
> >>  	.dma_mask_size =3D 39,
> >>  	.has_display =3D true,
> >>  	.has_llc =3D true,
> >> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> >>  	.max_gt_per_tile =3D 1,
> >>  	.require_force_probe =3D true,
> >>  	.subplatforms =3D (const struct xe_subplatform_desc[]) {
> >> @@ -225,6 +227,7 @@ static const struct xe_device_desc adl_n_desc =3D =
{
> >>  	.dma_mask_size =3D 39,
> >>  	.has_display =3D true,
> >>  	.has_llc =3D true,
> >> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> >>  	.max_gt_per_tile =3D 1,
> >>  	.require_force_probe =3D true,
> >>  };
> >> @@ -270,6 +273,7 @@ static const struct xe_device_desc ats_m_desc =3D =
{
> >> =20
> >>  	DG2_FEATURES,
> >>  	.has_display =3D false,
> >> +	.has_sriov =3D IS_ENABLED(CONFIG_DRM_XE_DEBUG),
> >>  };
> >> =20
> >>  static const struct xe_device_desc dg2_desc =3D {
> >> --=20
> >> 2.47.1
> >>
> >>
>=20
>=20
