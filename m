Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D8FC982C1
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 05:25:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951BD10E3D9;
	Thu, 17 Sep 2026 05:25:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KdYlOJc5";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3760710E3D9;
 Thu, 17 Sep 2026 05:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789622735; x=1821158735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5qjVqnzqq7TbCw4KsG6XkhWxbA9KdZy06dLg53o4LfM=;
 b=KdYlOJc5rKJ/wqxRsaic2QekxEkwZelwNGqcfN+cFKETlzr41K1A7QL4
 JgwOVP9/cAK9XaQ+zI8srtNogNoc6rFM1NAi1KncI1jVs0L3USuJPG8T+
 BhYfh3S/+6d8XBwrzLz7v7dd2LugnGhlJop3HWJ6AbMc7xhANPA107muY
 g7kWt/F7QfBmAExQBlwoIn0crm8ltF0TtoPDHr02eVz+Zm1w9HKwtQlHS
 4CWUaX45lEG2nrWJ1KKAv8fYPmJjbiU2fh53I43xrPELKH7QsAgYTQEOA
 Gf6KEWgGeFbZKo1Z7b6QshOGGxfZrt4o1elQjJyjMAtjBgKwvt9eDepMy g==;
X-CSE-ConnectionGUID: cuS8ruNjSAGh8I8ZLCF1gw==
X-CSE-MsgGUID: UjHmALqcQPCjVaVr49MbBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="107512598"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="107512598"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:25:35 -0700
X-CSE-ConnectionGUID: NIxASSASSsWwNx3g/qCL2g==
X-CSE-MsgGUID: dzwaq8wGQX+F7DN8IMzuBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="1976847"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2026 22:25:32 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 22:25:32 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 16 Sep 2026 22:25:32 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.60) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 16 Sep 2026 22:25:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O+AB91Kc7rYZYRBryqrHxhAxyEMAfHJX/0b3+dT+drjEEY7gnnQyHbrC6a9iFK9FphLfmPsTEyERaHglT9C7KA1j8AP4Pj8auyOAGqfdDD5CHJEuEC1WPCxjMZG68Ek9msMh2tHITCy51M/FWZAGKC1gI+X2HLE2pM+u4czWQMlJGRljgmREV7de5dBpXURrJvjKfmaos7ttXwCH2lHfdrByeiDuvyK2xBnmTQAm1Oafyb47oiTr3AM8ATVkp7HOGIOmxyeEQdf7Vt9VWpShXBlqCCMjlg1oAz+o9O1OKrf4bcnCNWutOCir82mC5Hmkf3RCWNyUiLzqs5WPrel/4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMarCMVIVPpFqgycuCQxdyjIxSxhQeLwX/7Akr8+B3Y=;
 b=dYyXRfe+msW/vDyrh5SZpO6xBZJLactN9lFWZe25YKzn5UXrwxQ3Fp2cF2c5BGvfq3RUgLP/+t6gBMfnGY1WxRg/k9L8dG7/h2BtyZOFACwS54mE19KKzGOUOjskdq9GE8ZAArTvOBQIDcSgjGBzaTKuPdtjBS0dVRclYe+oqZR7p+uFFRz4qnaHTqpErXFlJnmqFDeGMgdpA38OQsmkQD148ySRNMe+7ijP6R9bMJbmc3rkdUMWgKEuSWqGB4o4W9SJzcc66pIXpjO1Kvuflzr4t4B6sXBFCo3+fHHryYBEv/rybwAQ0zkhSBmPe0lvSwpWS3nRetG2dRKF9pBVmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6348.namprd11.prod.outlook.com (2603:10b6:208:3af::16)
 by LV1PR11MB8818.namprd11.prod.outlook.com (2603:10b6:408:2b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 05:25:29 +0000
Received: from IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31]) by IA1PR11MB6348.namprd11.prod.outlook.com
 ([fe80::5a70:4005:6905:8e31%7]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 05:25:29 +0000
From: "Golani, Mitulkumar Ajitkumar" <mitulkumar.ajitkumar.golani@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Subject: RE: [PATCH v2] drm/i915/display: Add command line param for DC balance
Thread-Topic: [PATCH v2] drm/i915/display: Add command line param for DC
 balance
Thread-Index: AQHdRMgs1BklRkQ020evG4b45+xHN7bQz8YAgAAfooCAAA6TgIABQMEQ
Date: Thu, 17 Sep 2026 05:25:29 +0000
Message-ID: <IA1PR11MB6348A542E7DB2354CD0BDAECB2B82@IA1PR11MB6348.namprd11.prod.outlook.com>
References: <20260915040015.2451786-1-mitulkumar.ajitkumar.golani@intel.com>
 <cc91cacab48c7134647a12da0bfb8c3832e2fc5b@intel.com>
 <IA1PR11MB63487EF9C59CDB94B9CD19BFB2B92@IA1PR11MB6348.namprd11.prod.outlook.com>
 <afe6c530dee1addee7da2f8e1909e2392767518a@intel.com>
In-Reply-To: <afe6c530dee1addee7da2f8e1909e2392767518a@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6348:EE_|LV1PR11MB8818:EE_
x-ms-office365-filtering-correlation-id: d3a1579c-bde9-4374-f660-08df147c168f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|18002099003|6133799003|22082099003|3023799007|38070700021|10067099003|5023799004|56012099006|4143699003|11063799006;
x-microsoft-antispam-message-info: 6qwjbZQ1JLBoP5b5QeyxcQnw17NLLk7KZsrUuGP8/v8myS058GI/HnoZBV1xymnfxSzHtGjmLXYzl2WDTGpUv1kp/0UKyvsEeVDOYb/D0DxRPyEwuP+/b8tCiya8XY7fBhT+51prlSNo6hUzy8dUr/kSQ9oaPN5eDFS+AcfJf0Ckw1uu0v8yGzMv7+3RxoZ3kMcKTOr7eu9CULAibEn7zq5wobZlfqtwRQCf7NV27OuRHx3eN8fVWVX2IiD4pWXW6hhbpY1ZAAu78Fv/i5rs2IsO+/B3ptGNblVnnybr/bHMw0Ed9Vpj7IUm/VaNSYvDwtn1glvq+dgl82HMTqFlrB6yzKzMMx0eDbUHmB+/3niMd7uvaACYz5jhlDdJTGQCTa2puvzfHO0eO3YV467U/F5nulH0ZWIamGRLUfQU912+RM0qF074Td+X32J2AfZt4yuoJOZiTaur2NzmyWHaZsf09CGriyfsSQrwUNWBgjLPT3ekAVqQV0rcPaVv+C8ktVJBw02mnond5WC0YvINzhqro76l8d0KfY7WT+Hl2eoDFGTtNM7rzony+Z31MaOPUpnuuUUWapW8WCncsxfn+4chaYf/k6Pe2/fbVcWViOHavBQrcsRsZstdQHo2s1wOvwbQR26gGLLnn4RVUP6XFy7NOCMO7AjSHywJfWxPt+1GNEfe1SHhHM4dRO4kf6dka+yeH61Fp7IYg7gN4dvtYHLDWr4SZqoCKYKPCKDQxnc=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6348.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(18002099003)(6133799003)(22082099003)(3023799007)(38070700021)(10067099003)(5023799004)(56012099006)(4143699003)(11063799006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3w6y8p7RvKcsuTdLcBJqyZtdkbUmk+6r5bWBkbc6V8PdecJoLlF1/UIsn5aD?=
 =?us-ascii?Q?3hNUkZmS5Fl+Lxa373IdltNvf+v1HAZMjHABfR/g4R7cBizpbtuqjKkMiOLq?=
 =?us-ascii?Q?SZgElEFmpDU5LiXGGgdmb32eLFUFYjck8z1k9DB8+21EvDWlPMNroxEbcovq?=
 =?us-ascii?Q?c5dOS9N8vrEMqbrGnDUGAcK+sikpCyzA0voQ3OlAQPp92TVeC1x+0oMQIvEh?=
 =?us-ascii?Q?d8JcV3AChk52QbSojfCCd1TAx6egZ67LD/j8/EAnoA1u7UIOmYlgTmuUBggj?=
 =?us-ascii?Q?/vt0U21GdcGLzKyFc9AidwbmeZggsJQJWlpmOsQWmVLONH2YNJPv/YEuYkKI?=
 =?us-ascii?Q?16bcFwaTSHJ54LXX2iz+4Kw9u/WIhXv3HS8inhJqHsqMP3VxPbdSs7nnHhOY?=
 =?us-ascii?Q?ZlATQJIKLP5EapPQGqNyGko89Lofh0pS3wQ2GutoQevCBxwUix1JAlcACRvR?=
 =?us-ascii?Q?ivnAz/R062Mtn5Hha3aaBYyPo7JMscRV3kzHJL4KRAxOfljrsl6ouw9L3Zo9?=
 =?us-ascii?Q?jhtlGCfiH0hhMkytvzjNmm39fIeKDXkijyZK5+zlyld1LcndDjgZBQ6Vno76?=
 =?us-ascii?Q?n4j5eqFsj9i4O3pt5WHFiegSxYdFLC8nzR7vCnIIPWk9ZCHzC+bGa7eeVJkO?=
 =?us-ascii?Q?bt511UvCYgT1l8nPdCbgQpJnJYTlbVqc6+LsHLcoSqNehO56ZzfH9ZUTwndA?=
 =?us-ascii?Q?TXjta+ObpP7jdVNJDgUgWVzaA/v8fw9D4ZRKG9ftPResGXlYRK3A3tL1hYvv?=
 =?us-ascii?Q?reD8hgTzlp4s0kJAYKqL8KABO7F8CnEdqlfaoDftt2A3Ewpptay+Dcknqly5?=
 =?us-ascii?Q?4GlwePuYvLadfAFbbtnW2LGXIEZ1hLsiVu11sX9l7FfG3ENnBjdeighQMtcv?=
 =?us-ascii?Q?jIlE0KSEVEO5V5k5k03jKGei8VnsHyfwhUQnm6qzI0el8IqWRg09kXGT4t26?=
 =?us-ascii?Q?SLZkTI1dtI6EhjS40X9rgH9KFBMwCH0mze2S/Sy5y97j6I+1Pa4XOdygAZjN?=
 =?us-ascii?Q?X4hr8pMSPtionF3Wk9P7WeICIC/7x4A1ZLaEt2vPELeVFs7LM1mwb3FQ5X2C?=
 =?us-ascii?Q?OSqfnWdGx+M1q54drh4G0Z/rW4ctqriakYw4TgG+G4rDXIChtvPP94TU81xX?=
 =?us-ascii?Q?Ra9xw02DCFjpy7ajL2MqE4bSEbog9svh7xKNop59x1XOJIJEd/p8UqmMZm0w?=
 =?us-ascii?Q?Ju61DmTQjpJiXKPN9IHjJMG3g9NnqGj1N/HSWZxYIJ/WOIds/XVUUJWDLPZG?=
 =?us-ascii?Q?j5hh5Sl06JGNUKnS4hiaMhNbZqAmThx7EMYs4yvwTrhDL5MqRvPdf4UrMtML?=
 =?us-ascii?Q?hHNjmsK3E2JtLay0B4tuSvB7nV2Adpd/JBGvAowOXI3BrlgMXtXICzDbuVhg?=
 =?us-ascii?Q?PiDOrNLGsWAQU88X2sE3Zv3BNc9rv0av4O/J5ex0y4oeJ5LCixOnyPHCl4YF?=
 =?us-ascii?Q?QvR7v/pcTrhxOalaWm1VX3MsNJdwzL2Lcs93wO4C+Sp0q+hqnpu6Qm8OV6T2?=
 =?us-ascii?Q?cVCueE9YuY/dw4kw4S06G3jtYFovAi1xOmc1vvNepfupA4oJ+64r2tsT1f1T?=
 =?us-ascii?Q?zIqP4npfu9XAqHQR3XZPovSu4bo4m3jafL/tsWdOLB6Kg4/upE5Cr59v3ohK?=
 =?us-ascii?Q?D6y7NZ4jDNAbpBOdO5YA86OmqnMMNKnIGB5F4bf6Qof65V1tl+JMbzq+TAp5?=
 =?us-ascii?Q?+yzxZtllhYpbTY9eWzbD5aWVu7rPDF9Uq2p9cknXmF1Q4om99m8glLle46Vf?=
 =?us-ascii?Q?y+cxviiYvErSj+Y3aDVHWf6tGnWO/4ZDqfHNP/VBD6iEwNqMLr6+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: EowxzPBJqjDKS0gXErvkhthwLkTctrmo5BhtgId1l9rxitLaqCrEZCUZBFb0F3mrnpL0NJmGTUZRI3NuUiAa+RFsHWBpDwQtSKCEq72VEU1n7myoIWKIfTxpEQKwxQMNuLpJPyjl50boniFf+WtU3vg3Uk9H2X85BmpGkRLk/OK4yNRDnJEKT7iXu+sVP4w5uQiIxl1CDNg9W9SbSQjqWRXXaTrPR1LdcUcXWLLNIjD6Cu5BYUkoe8sTQbFaInGI9hQo/8eHiOxKc13Hq33JvoRzu6utQGovk8P4voA18v5+24kftIMm2V5gCnOmMZ1hSzRt+ATDhrwBvr1beiLgMg==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6348.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3a1579c-bde9-4374-f660-08df147c168f
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 05:25:29.6030 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BRXaU34kr+O0jcL+GBaGJDjNdKY8aFh/45xXBipUa3OZEhRwkYe82zQQWgbW+NumPztXs4emnsFlVFIzw7MCEm8ULZIR/ABL+1PA4jYSrwqdJWAVvXkCXVX1TdrygTJz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV1PR11MB8818
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
> From: Jani Nikula <jani.nikula@linux.intel.com>
> Sent: 16 September 2026 15:42
> To: Golani, Mitulkumar Ajitkumar <mitulkumar.ajitkumar.golani@intel.com>;
> intel-gfx@lists.freedesktop.org
> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> <ankit.k.nautiyal@intel.com>
> Subject: RE: [PATCH v2] drm/i915/display: Add command line param for DC
> balance
>=20
> On Wed, 16 Sep 2026, "Golani, Mitulkumar Ajitkumar"
> <mitulkumar.ajitkumar.golani@intel.com> wrote:
> >> -----Original Message-----
> >> From: Jani Nikula <jani.nikula@linux.intel.com>
> >> Sent: 16 September 2026 12:56
> >> To: Golani, Mitulkumar Ajitkumar
> >> <mitulkumar.ajitkumar.golani@intel.com>;
> >> intel-gfx@lists.freedesktop.org
> >> Cc: intel-xe@lists.freedesktop.org; Nautiyal, Ankit K
> >> <ankit.k.nautiyal@intel.com>
> >> Subject: Re: [PATCH v2] drm/i915/display: Add command line param for
> >> DC balance
> >>
> >> On Tue, 15 Sep 2026, Mitul Golani
> >> <mitulkumar.ajitkumar.golani@intel.com>
> >> wrote:
> >> > Add an 'enable_dc_balance' display module parameter, disabled by
> >> > default, so the feature can be explicitly opted in at driver
> >> > initialization on configurations where it is known to be
> >> > beneficial, while preserving existing behaviour everywhere else.
> >> > intel_vrr_dc_balance_compute_config() honours the parameter, so no
> >> > recompilation is needed to try the feature.
> >>
> >> How does this preserve existing behaviour? This disables DC balance
> >> by default. Why?
> >>
> >> What are you trying to do? What is the goal?
> >>
> >> We shouldn't be adding module parameters to begin with, and the
> >> *only* reason for adding them is *debugging* only. Nothing else.
> >>
> >> "feature can be explicitly opted in" is *not* what we use module
> >> parameters for at all.
> >>
> >>
> >> BR,
> >> Jani.
> >
> >
> > Hello Jani,
> >
> > The intent is debugging and diagnosis rather than providing a feature o=
pt-in.
> >
> > We are currently seeing timing-related issues with DC balance on some
> > panel/TCON combinations and are working with the DMC firmware team on
> the underlying fix.
> > We are also identifying affected TCONs for appropriate quirks.
> >
> > Keeping DC balance disabled by default allows us to preserve the
> > existing VRR behavior while using the parameter to enable/disable DC
> > balance during debugging and isolate issues caused by the algorithm ver=
sus
> the underlying VRR/display behavior.
> >
> > I will also update commit message accordingly
>=20
> Right, so the change to highlight is "disable DC balance by default", not=
 "add
> module parameter". The module parameter is completely secondary to the
> main change.
>=20
> When was DC balance added? Bacport? Fixes?
>=20
>=20
> BR,
> Jani.
>=20

Hello Jani,

DC balance was enabled by commit 5558192707072 and included in v7.0.

I'll update the commit message to make disabling DC balance by default the =
primary change and
use this commit for the Fixes: tag.

Thanks for the detailed review and guidance.

Thanks,
Mitul
>=20
> >
> > Thanks,
> > Mitul
> >
> >>
> >>
> >> >
> >> > --v2:
> >> > - Make enable_dc_balance a bool and keep it disabled by default; fix=
 the
> >> >   parameter type/value mismatch and correct the description (Chaitan=
ya
> >> >   Kumar Borah, Jani Nikula)
> >> > - Explain in the commit message why the feature is gated and why a
> >> >   module parameter is used (Jani Nikula)
> >> >
> >> > Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
> >> > ---
> >> >  drivers/gpu/drm/i915/display/intel_display_params.c | 4 ++++
> >> > drivers/gpu/drm/i915/display/intel_display_params.h | 1 +
> >> >  drivers/gpu/drm/i915/display/intel_vrr.c            | 4 +++-
> >> >  3 files changed, 8 insertions(+), 1 deletion(-)
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > b/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > index 2aed110c5b090..ca0ef466bb103 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.c
> >> > @@ -120,6 +120,10 @@
> intel_display_param_named_unsafe(enable_psr,
> >> int, 0400,
> >> >  	"(0=3Ddisabled, 1=3Denable up to PSR1, 2=3Denable up to PSR2) "
> >> >  	"Default: -1 (use per-chip default)");
> >> >
> >> > +intel_display_param_named_unsafe(enable_dc_balance, bool, 0400,
> >> > +	"Enable VRR DC balance (0=3Ddisabled, 1=3Denabled). "
> >> > +	"Default: 0 (disabled)");
> >> > +
> >> >  intel_display_param_named_unsafe(enable_panel_replay, int, 0400,
> >> >  	"Enable Panel Replay (0=3Ddisabled, 1=3Denabled). Default: -1 (use
> >> > per-chip default)");
> >> >
> >> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > index ba01aeaf89440..5c5a1a1358c32 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> >> > @@ -46,6 +46,7 @@ struct drm_printer;
> >> >  	param(bool, enable_dp_mst, true, 0600) \
> >> >  	param(int, enable_fbc, -1, 0600) \
> >> >  	param(int, enable_psr, -1, 0600) \
> >> > +	param(bool, enable_dc_balance, false, 0600) \
> >> >  	param(int, enable_panel_replay, -1, 0600) \
> >> >  	param(bool, psr_safest_params, false, 0400) \
> >> >  	param(bool, enable_psr2_sel_fetch, true, 0400) \ diff --git
> >> > a/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > b/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > index e36db11744405..1698c54e258b4 100644
> >> > --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> >> > @@ -439,10 +439,12 @@ static bool
> >> > intel_vrr_dc_balance_possible(const
> >> > struct intel_crtc_state *crtc_st  static void
> >> > intel_vrr_dc_balance_compute_config(struct intel_crtc_state
> >> > *crtc_state)  {
> >> > +	struct intel_display *display =3D to_intel_display(crtc_state);
> >> >  	int guardband_usec, adjustment_usec;
> >> >  	struct drm_display_mode *adjusted_mode =3D
> >> > &crtc_state->hw.adjusted_mode;
> >> >
> >> > -	if (!intel_vrr_dc_balance_possible(crtc_state) || !crtc_state-
> >> >vrr.enable)
> >> > +	if (!intel_vrr_dc_balance_possible(crtc_state) ||
> >> > +	    !crtc_state->vrr.enable ||
> >> > +!display->params.enable_dc_balance)
> >> >  		return;
> >> >
> >> >  	crtc_state->vrr.dc_balance.vmax =3D crtc_state->vrr.vmax;
> >>
> >> --
> >> Jani Nikula, Intel
>=20
> --
> Jani Nikula, Intel
