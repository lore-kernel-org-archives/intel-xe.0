Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A95606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 05:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=T+h2Nrhe
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7830D10EC52;
	Wed, 21 Oct 2026 05:04:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB9410E0BF;
 Wed, 21 Oct 2026 05:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792559065; x=1824095065;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=99KT0gzisCL7yGZ+//8m/TqbHoFsw3UuE/vKmgVgtN0=;
 b=T+h2NrheOfnr7zGSuBLhXw/YFdkbm+kkDy+qbPfbyqk/0bteTGv82Fta
 cYcopFeTtCCDGFoOo4G7dzc0l2OAHzJEeer1oAM8GtPk5C9FuaAQ9iGa7
 3ACCOrff7pDdJE1477Khlh3VPCGSHrWAi1nfnaWJNCHpvDYTB0mkrIfX6
 dbEvYzsLWEFBAnuoBx9z14GR7F8mTlh5KDJF9JZ6aoCcHxUmxUWVXQnkw
 gtWQygN0odJ2MzzMBGdS+xlM7tPLFpqozQBJN6955J28197vlb3NSN/+x
 zpa39EPQzvVVYukHHVXsMBp/niHWt2T+RZVX7WsgJW6FWDe87x7auRhAL g==;
X-CSE-ConnectionGUID: Ok1iE95gRyCaZF3qQ/DpZA==
X-CSE-MsgGUID: C/GHfBENR6S1nyYv+r3SVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1173926"
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="1173926"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:04:24 -0700
X-CSE-ConnectionGUID: iQlC8b+cSLeSxVadzHLiLQ==
X-CSE-MsgGUID: AKkcXysbQkGVJ6ba7PqWtQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,169,1787036400"; 
   d="scan'208";a="3038126"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2026 22:04:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:23 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Tue, 20 Oct 2026 22:04:23 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.46) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 20 Oct 2026 22:04:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xCdgxCgJfv/rJN5FvcHIeee7voyeh/HoTaIEcM5IP9pB5ikb5NTABcY/Q3SMt4rsmSqvYXrX0n1HQ90SWh+gtnQhrA7HV7T97UBwY1dQwnKSzGpombG9X1dT68WRVS7vROMFv0T7cRzQoEbKFrMppq0hsCnQU/whNX8CxARWVovqT2ZpeTbm5bZz2bIx5wBjhzjApJoBoZAqwUAbWWt2sALzuxWty1yiLo7Q2FDdQ7q1i7CBJEvHqcDRBe+g/BM/dKuw74ms/TwMnVUBP0mkNyIbdImxulA90OmaFn2AdMbHcDT5/gI87MsZ44CoUKQ1Xs5GW08DsZI/I27Jc4U0Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JZe6am6fvqaFAuja7GYM2+tAk7oKgqNMS4ZEiCubGwY=;
 b=oy0KQ1B1FtFuU0Selw6K1Jh5MLe2p1Xh10/afQwkS4KWF6ZnMoDAtvmv6Q2SLXi2/Jd/84l1ICnK6QYqkOdZFhwZzKOcjMR+tVFTSAfb7RN5GqvH9tk6a0kIbjONpoh64/SKHYuZ1cykxkgO4uHv+9ghMUd3rTRv7XCvcWoWuE5+SxEVXM1NXbNWJSVS0tKOMT2LCROttlM1vk6C8gnLydzDX9nWBvkY32Q2mnlq0Mvn5fbaUNAahBDyFcn/DEoFNSr8TtYRZrt6p9EFbtaOJrHuniiQqYh8mORc8gxbsK0Rs1O1mMZo+akmTxs6GtFmzTpsWnZ0QlXZyfsEWqa+CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::5b) by IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Wed, 21 Oct
 2026 05:04:19 +0000
Received: from DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff]) by DS4PPFE901A304F.namprd11.prod.outlook.com
 ([fe80::19f5:13eb:df52:68ff%8]) with mapi id 15.21.0522.012; Wed, 21 Oct 2026
 05:04:19 +0000
From: "Kandpal, Suraj" <suraj.kandpal@intel.com>
To: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, "Murthy, Arun R"
 <arun.r.murthy@intel.com>
Subject: RE: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Topic: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
Thread-Index: AQHdRmJ7vNiU0Hc4CEWFGB/BwH4jbLb+7aOAgAi3G5A=
Date: Wed, 21 Oct 2026 05:04:19 +0000
Message-ID: <DS4PPFE901A304F5A8516D04139559A7602E3662@DS4PPFE901A304F.namprd11.prod.outlook.com>
References: <20260917050649.871960-1-suraj.kandpal@intel.com>
 <20260917050649.871960-3-suraj.kandpal@intel.com>
 <BYAPR11MB3783D41F61AACCC6928B351DB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
In-Reply-To: <BYAPR11MB3783D41F61AACCC6928B351DB29C2@BYAPR11MB3783.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS4PPFE901A304F:EE_|IA1PR11MB8200:EE_
x-ms-office365-filtering-correlation-id: e12e1171-3f74-40f7-d822-08df2f30c358
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|366016|10070799003|376014|38070700021|4143699003|11063799006|56012099006|10067099003|260925021311599003|260925022911599003|260925021911599003|261009223027099003|22082099003|18002099003|3023799007|6133799003;
x-microsoft-antispam-message-info: 6iXcKkhC4hpTY66IyhLlNUP3DJQE1Wpz1o4rQhfJ+6DvMVu3+k3cd3L6p2yswjvQ4XPMAi8Ri2kHg8qHHEAn57dnf/CItUnEK8WLQ3TV4FJYEu9cZRgC7v/Esd1O+ORhpIvNBNJotbfzPUOHDk27RebPSNG0BKo0SZwM2RS24HknklEvFIeUzF5RnbHbvHjqtga8a0FIWRvQXP8J0Vwz3nl9VOyHgg7msG7VOHePPAb/54xbhZnc/x553JyxBlvDlJbUh6OCGsONQ7dQuYA6sLe69TBwyPRPsyOUUWrShhZ3Fp/OU5Wgws8v+o5BolZMyVEEDu685W53IbMkM1aMFs1a5e1rR5eJ/jqO39nbIVN4upyzXA8a0hi16adhGetos3hHWBvkHZm2D40zaYkNpvxdBDQMEyRv4mYv/qgVgqS32mDNtupj8EKOYNBCzg7QCTPn7BOczaUSWR6qEgI7O2TFp+s1PoP7hWozoVohSKoLHYt+kNmwBWdydU2N7nsck3Xg0tTv8mllrQsIbzssFfvs95JeFh8MjkiDYREsjldPECDa56AV4LApDUr/zZaz4gd0HbfndoxpX6aWoeKZZ0seb2ScVXo/QxdVl4FzM+JjU1O9cPp7bWvlSIoT3bQDTmzIz2rPhyxFeIQTtjuboF8dze8i+W1s6FlqF8+SJnIRmhBLxA/8+8PTgskX3Az3Yj0wkHHlJK972eA68J3KqZmNmUfR4uBBC6zfXxx/0ts=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFE901A304F.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(38070700021)(4143699003)(11063799006)(56012099006)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(261009223027099003)(22082099003)(18002099003)(3023799007)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jbfxbP04zzi1LiL3IKnhrVCOmjafBTnXD/hSvhc1jhXi3q2rNb/IYJUibc/s?=
 =?us-ascii?Q?7LetM+CZLjg6zHNVVLsxTkAjkLMMRBOUBoLw96e/dOf28kSbElw6mjYecrp3?=
 =?us-ascii?Q?/KyloWdvtSJAhp4Ar+wtg8Oxz2mt8t/VRCuWP83KTfGkDDJjIFTRnlbuqO77?=
 =?us-ascii?Q?R0qMTruc38tCW0cqtw7A65/Qx0wYbpIpuKvPvfc7QxcKMW23HyXCcz8Cd18R?=
 =?us-ascii?Q?nBB6AM7BgLqRzZTs5plfSXcLyXiAeFeS1Am1sGwFvo1kZvIG3SGu9qHPbU5t?=
 =?us-ascii?Q?NfYLTYSc4fiELA5OZTYCPEKVoPxG1CRjqzJdN9STfKxs/VlocQEUcXEXDI1N?=
 =?us-ascii?Q?+9fIM14vr7XJRfJCOYG4WOMBgetqTCQuVzG8YbDZcvVcQiHBXd5FDKdY2MuY?=
 =?us-ascii?Q?GdyNzf8sedSVjxXqRTqowE8F7tkonMg7RYJg6mMRpYfsL3MLWI/Vwbx7w/gR?=
 =?us-ascii?Q?bORoHyTUPXek5mYhVCyOkMkLOOBXnIOp8uN0eilwf99FpPhAWG3mM6yxZOeG?=
 =?us-ascii?Q?BZgZubgMKSMbiqOfEsgkTM4I9OaHbHkHDrIiOn8QozrUVcz6bLrteBaD4JDH?=
 =?us-ascii?Q?cOHCLQ0LLMvxrL88pp22cRk3VwA8NExaHL46zkrK/LpQAXizspOpcXQd/yYs?=
 =?us-ascii?Q?SuuR7URKFjumuWBazIlimX1xnfQ8AqP6iP6Iacn1i7t0SpZtt/MAzVPAaoYy?=
 =?us-ascii?Q?c8wZZnxUjobWXiZEGpmVwQQ+CeDmS0qowD7lcojYBpV5M8LtRLqEZNOAZfkv?=
 =?us-ascii?Q?9VqF6PrifXEu9lavgLOveV3vWgdardX4d5ooQ56pnYF9JeWhVNl+sKhn2yhY?=
 =?us-ascii?Q?7wqqzbQSd3Gx/AdFPlIv6SAmjEwt6U+c0PK4053xUjC+Tlmjb0HXtGSZvjSD?=
 =?us-ascii?Q?Z+2+Dk+CVO1mtzT0lWkmwYHiYwu/9rdbrHb9ecPVngBKC0xahlVypII3O1+b?=
 =?us-ascii?Q?F/CR0MfZPjfplPIs8jDLEgRlT90hlwnzonAFM+5PE+XtSL4AYbfY6GAF/B9Q?=
 =?us-ascii?Q?AM5fTO+gZDNHdTNWFSE0JdIN+2TuZfwOkavFGVFMGwV2OJMlmrobu7mcweZI?=
 =?us-ascii?Q?G1kvZ6UJEz4QqxacTWfGxPSOHEz8MkZIj6jsEcnCdF+v0dw+g0/Ej2E4z06b?=
 =?us-ascii?Q?9NDRyHD9NfdEOhF8BdixZoLYKOFgR/KBL5vb9FcophoBx6LR+Ks6SIriAs1n?=
 =?us-ascii?Q?Bf2l/m1xqu11vxkCZ1SB/AY812PEtimDhKAvJRPkFCN1oQkyhVbaDKJeNEoC?=
 =?us-ascii?Q?daFM90Og0nvf1WsMUlOYA3yHey4KcrUswRfQj7gZEJ1VvbQHredT9/15heIh?=
 =?us-ascii?Q?o3j+YnMzv481WwLRBP5eqebcDCiSyGPsllJd+HFnY1ODG0CgIBKfZPLFvjv6?=
 =?us-ascii?Q?IkyJ489P0xorGYVmen3r+vK9a1O6v4PTxr6nGzt9trlPVfDfp/6iYZ3i+wBK?=
 =?us-ascii?Q?ghxt1P4T/rghE4f+Wa2VsQg1CkIsI2/GzTyBlfm24JdmQyT4yhBkSkWVl2d6?=
 =?us-ascii?Q?l/G94/Us+XESRkIGySVwnvSM7NRSEIAgz3nZg502LnOuD/DCvTX72mLSJ9qz?=
 =?us-ascii?Q?SeKR/SJUhY8tE2lSGMqyf+5gHUtT6xmyyEzlte07Cep9VoeuMLd8e7LuNft8?=
 =?us-ascii?Q?dok//NvJiMslR85u1GT5EAB03qgMLYX+O842VRJxLC5Uj2ncRYuYLZ/zAXpo?=
 =?us-ascii?Q?w/f3Gc7Pz2SwOy+wVdw1aCgvp2dt5TkcXW0b8VnPQ855wJC1ZImRdJYTfyhz?=
 =?us-ascii?Q?NEr9Avrx4SK0lSBh2YxmOrGnr0pGH+c3hdv3Owbh7JonOt42viS6+zb21IZZ?=
x-ms-exchange-antispam-messagedata-1: RmfRi+3kY3plow==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: dfYIqQMYDGf/zE9wW3a5bCqT4oNUVpoh0TgmUUVjN6Dtx8CCrvLvPZIoVg6v4JsY0JljjOpru15c/o+bUcScyNO5+lK+M1UrUaaqNBd+PoLlcCKyGU9f5XI8ZDaxYGqQitkmH+X/+poH8SzqfSbEN3HXH4hCU1J78P8F3nEK23gHhZbpaE6JWRliODw8FGKJ4qjgmiFJYedk46HY3EpppIOvI6JxZR1EKG+QCNRtXyR30rzZvgqkp1VDCxJ16LI10w9sUswFxYqStws0iqeLIIIGxNHLJJVyi0y8TXlhp+UB2zRJ8Gg0Yk9cxmMWY2pK4Ttlv9OdiJY4QRc1ipMR2Q==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFE901A304F.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e12e1171-3f74-40f7-d822-08df2f30c358
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Oct 2026 05:04:19.1813 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WpTzs7cf5WyOFTlK5wJUHv6dHE9N9XiddMYRzLri6knW/pvaupj8QIpw1xUvizHTvtRzIwHxcl7lMl/QRD28LA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> > Subject: [PATCH v4 02/10] drm/i915/dp: Limit M/N ratio for DP SST
> >
> > The hardware cannot support DisplayPort configurations where the
> > ceiling of the Link M/Link N ratio exceeds the limit the transcoder's
> > timing generator DDA can track. This limitation has always existed,
> > but it typically wasn't encountered without the use of joiners and DSC.
> >
> > With higher resolutions and combinations involving joiners and DSC,
> > this constraint can now be hit in certain scenarios.
> >
> > Restrict the link configurations to those satisfying the constraint
> > while computing the link config limits, so that the SST and the MST
> > paths both get it, and so that a mode which no link rate can support
> > fails early rather than deep inside link config selection.
>=20
> Nit: This check is inside intel_dp_compute_config_limits, which
> mst_stream_compute_config_limits also calls, so MST compute is already
> constrained. The subject ("for DP SST") and the "applies only for SST" no=
te
> contradict that and the "SST and MST paths both get it" sentence. Please =
say
> that MST compute is covered and only MST mode_valid is left for the follo=
w-
> up.

Sure will update the commit message

>=20
> >
> > Also prune such modes in mode_valid. Note the ratio is the pixel clock
> > over the link symbol clock, and the symbol clock is not monotonic in
> > the link rate: it is the rate divided by 32 for 128b/132b but only by 1=
0 for
> 8b/10b, so e.g.
> > HBR3 has a higher symbol clock than UHBR20. There is therefore no
> > single best link rate to evaluate against, and mode_valid walks the
> > link configurations instead, only rejecting the mode if none of them
> > can satisfy the ratio.
> >
> > Note: This change applies the check only for SST. Support for MST will
> > be added in a subsequent commit.
> >
> > v2:
> > -Move the M/N ratio check to the link rate configuration phase instead
> > of during M/N computation. (Ville) -Prune modes that cannot be
> > supported even with highest link rate due to M/N ratio restriction.
> > v3:
> > -Rebase on the link caps iterator based link config selection.
> > -Set the constraint up in intel_dp_compute_config_limits() by
> > narrowing the link config filter, and fail there if no config
> > qualifies, instead of skipping configs while iterating them. (Imre) -Us=
e a
> limit of 4 on DG2.
> > (Wa_14014191401) -Walk the link configurations in mode_valid rather
> > than evaluating the ratio at the highest link rate, which is not the be=
st case
> for it.
> > v4:
> > -Add iterator for all dp configs in intel_dp_mode_valid_m_n() so that
> > we do not prune any mode that could have been supported (Sashiko)
> >
> > Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> > Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c |   4 +-
> >  drivers/gpu/drm/i915/display/intel_display.h |   2 +
> >  drivers/gpu/drm/i915/display/intel_dp.c      | 101 +++++++++++++++++++
> >  drivers/gpu/drm/i915/display/intel_dp.h      |   2 +
> >  4 files changed, 107 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index f04a6f97e05a..c53163d7c082 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -2641,8 +2641,8 @@ static void compute_m_n(u32 *ret_m, u32
> *ret_n,
> >  	intel_reduce_m_n_ratio(ret_m, ret_n);  }
> >
> > -static void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> > -					   int pixel_clock, int
> > link_symbol_clock)
> > +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> > +				    int pixel_clock, int link_symbol_clock)
> >  {
> >  	compute_m_n(link_m, link_n,
> >  		    pixel_clock, link_symbol_clock, diff --git
> > a/drivers/gpu/drm/i915/display/intel_display.h
> > b/drivers/gpu/drm/i915/display/intel_display.h
> > index eecafff167d3..404168f4213b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display.h
> > @@ -523,5 +523,7 @@ bool assert_port_valid(struct intel_display
> > *display, enum port port);
> >
> >  bool intel_scanout_needs_vtd_wa(struct intel_display *display);  int
> > intel_crtc_num_joined_pipes(const struct intel_crtc_state
> > *crtc_state);
> > +void intel_display_compute_link_m_n(u32 *link_m, u32 *link_n,
> > +				    int pixel_clock, int link_symbol_clock);
> >
> >  #endif
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.c
> > b/drivers/gpu/drm/i915/display/intel_dp.c
> > index 0cd5e6b5034c..f6a2152c4432 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.c
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> > @@ -61,6 +61,7 @@
> >  #include "intel_cx0_phy.h"
> >  #include "intel_ddi.h"
> >  #include "intel_de.h"
> > +#include "intel_display.h"
> >  #include "intel_display_driver.h"
> >  #include "intel_display_jiffies.h"
> >  #include "intel_display_utils.h"
> > @@ -1265,6 +1266,34 @@ bool intel_dp_has_dsc(const struct
> > intel_connector *connector)
> >  	return true;
> >  }
> >
> > +static int
> > +intel_dp_get_max_m_n_ratio(struct intel_display *display) {
> > +	if (display->platform.dg2)
> > +		return 4;
>=20
> Please route the DG2 limit through intel_display_wa()
> (INTEL_DISPLAY_WA_14014191401) instead of a bare platform check. Right
> now the Wa ID only appears in the changelog.
>=20

Ill add a seprarte patch series moving this into its own display wa framewo=
rk rather than doing it here
Since this series is already adding a WA

> > +
> > +	return 10;
>=20
> Also, what's the BSpec reference for the generic limit of 10 ?

Will add it

> > +}
> > +
> > +static bool
> > +intel_dp_can_support_m_n(struct intel_display *display,
> > +			 int pixel_clock, int link_rate)
> > +{
> > +	int max_m_n_ratio =3D intel_dp_get_max_m_n_ratio(display);
> > +	u32 link_m, link_n;
> > +	int m_n_ratio;
> > +
> > +	intel_display_compute_link_m_n(&link_m, &link_n, pixel_clock,
> > +				       intel_dp_link_symbol_clock(link_rate));
> > +
> > +	if (!link_n)
> > +		return true;
>=20
> link_n can't be 0 here: compute_m_n() fixes N at 0x80000 and only halves =
it
> while M/N exceed 24 bits. Please drop the check.

Will drop it

>=20
> > +
> > +	m_n_ratio =3D DIV_ROUND_UP(link_m, link_n);
> > +
> > +	return m_n_ratio <=3D max_m_n_ratio;
> > +}
> > +
> >  static
> >  bool intel_dp_can_join(struct intel_dp *intel_dp,
> >  		       int num_joined_pipes)
> > @@ -1300,6 +1329,31 @@ bool intel_dp_dotclk_valid(struct intel_display
> > *display,
> >  	return target_clock <=3D effective_dotclk_limit;  }
> >
> > +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> > +pixel_clock) {
> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > +	struct intel_dp_link_caps_order order =3D {
> > +		.key =3D INTEL_DP_LINK_CAPS_ORDER_KEY_RATE_LANE,
> > +		.dir =3D INTEL_DP_LINK_CAPS_ORDER_DIR_DESC,
> > +	};
> > +	struct intel_dp_link_config link_config;
> > +	struct intel_dp_link_caps_iter iter;
> > +	bool found =3D false;
> > +
> > +	intel_dp_link_caps_iter_start(&iter, intel_dp->link.caps, order,
> > +				      INTEL_DP_LINK_CAPS_FILTER_ALL);
> > +	for_each_dp_link_config(&iter, &link_config) {
> > +		if (intel_dp_can_support_m_n(display, pixel_clock,
> > link_config.rate)) {
> > +			found =3D true;
> > +
> > +			break;
> > +		}
> > +	}
> > +	intel_dp_link_caps_iter_end(&iter);
> > +
> > +	return found;
> > +}
> > +
> >  static enum drm_mode_status
> >  intel_dp_mode_valid_format(struct intel_connector *connector,
> >  			   const struct drm_display_mode *mode, @@ -
> > 1454,6 +1508,9 @@ intel_dp_mode_valid(struct drm_connector
> > *_connector,
> >  			return status;
> >  	}
> >
> > +	if (!intel_dp_mode_valid_m_n(intel_dp, target_clock))
> > +		return MODE_CLOCK_HIGH;
> > +
> >  	/*
> >  	 * TODO: Even when using a 4:2:0 sink_format
> > intel_dp_output_format()
> >  	 * will always choose a 4:4:4 output_format if the DFP can do the
> @@
> > -2654,6 +2711,47 @@ intel_dp_dsc_compute_pipe_bpp_limits(struct
> > intel_connector *connector,
> >  	return true;
> >  }
> >
> > +static bool
> > +intel_dp_compute_m_n_ratio_limits(struct intel_dp *intel_dp,
> > +				  struct drm_connector_state *conn_state,
> > +				  const struct intel_crtc_state *crtc_state,
> > +				  struct link_config_limits *limits) {
> > +	struct intel_display *display =3D to_intel_display(intel_dp);
> > +	struct intel_connector *connector =3D to_intel_connector(conn_state-
> > >connector);
> > +	struct intel_dp_link_caps *link_caps =3D intel_dp->link.caps;
> > +	struct intel_dp_link_caps_order order =3D
> > +		intel_dp_link_caps_connector_compute_order(connector);
> > +	struct intel_dp_link_caps_filter new_filter =3D
> > INTEL_DP_LINK_CAPS_FILTER_NONE;
> > +	int pixel_clock =3D intel_dp_mode_clock(crtc_state, conn_state);
> > +	struct intel_dp_link_config link_config;
> > +	struct intel_dp_link_caps_iter iter;
> > +	bool found =3D false;
> > +
> > +	intel_dp_link_caps_iter_start(&iter, link_caps, order, limits-
> > >link_config_filter);
> > +	for_each_dp_link_config(&iter, &link_config) {
> > +		if (!intel_dp_can_support_m_n(display, pixel_clock,
> > link_config.rate))
> > +			continue;
> > +
> > +		intel_dp_link_caps_filter_add(link_caps, &new_filter,
> > &link_config);
> > +		found =3D true;
> > +	}
> > +	intel_dp_link_caps_iter_end(&iter);
> > +
> > +	if (!found) {
> > +		drm_dbg_kms(display->drm,
> > +			    "[CONNECTOR:%d:%s] No link config with a Link
> > M/N ratio <=3D %d\n",
> > +			    connector->base.base.id, connector->base.name,
> > +			    intel_dp_get_max_m_n_ratio(display));
> > +
> > +		return false;
> > +	}
> > +
> > +	limits->link_config_filter =3D new_filter;
> > +
> > +	return true;
> > +}
> > +
> >  bool
> >  intel_dp_compute_config_limits(struct intel_dp *intel_dp,
> >  			       struct drm_connector_state *conn_state, @@ -
> > 2770,6 +2868,9 @@ intel_dp_compute_config_limits(struct intel_dp
> > *intel_dp,
> >  		limits->link_config_filter =3D new_filter;
> >  	}
> >
> > +	if (!intel_dp_compute_m_n_ratio_limits(intel_dp, conn_state,
> > crtc_state, limits))
> > +		return false;
>=20
> For MSO (eDP splitter) this uses the unsplit clock, while the programmed =
link
> M/N uses crtc_clock / mso_link_count (computed later in
> intel_dp_compute_config()). Does the DDA limit apply to the per-segment
> clock? If so, the check is too strict by a factor of mso_link_count.

We use unsplit clock here and switch to using mso clock later in patch 4 so=
 its not a problem.

>=20
> > +
> >  	if (!intel_dp_test_compute_config(connector, crtc_state, limits))
> >  		return false;
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_dp.h
> > b/drivers/gpu/drm/i915/display/intel_dp.h
> > index 04fae203bb69..aa58833a405b 100644
> > --- a/drivers/gpu/drm/i915/display/intel_dp.h
> > +++ b/drivers/gpu/drm/i915/display/intel_dp.h
> > @@ -239,6 +239,8 @@ bool intel_dp_joiner_candidate_valid(struct
> > intel_connector *connector,
> >
> >  u8 intel_dp_as_sdp_transmission_time(void);
> >
> > +bool intel_dp_mode_valid_m_n(struct intel_dp *intel_dp, int
> > +pixel_clock);
>=20
> nit: This is only used in intel_dp.c. Make it static unless the MST follo=
w-up
> needs it, and if it does, say so.

This is used in a later commit . will mention in commit message

Regards,
Suraj Kandpal

>=20
> > +
> >  int intel_dp_link_init(struct intel_dp *intel_dp);  void
> > intel_dp_link_cleanup(struct intel_dp *intel_dp);
> >
> > --
> > 2.34.1

