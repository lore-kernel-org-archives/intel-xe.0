Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49FE8C7115A
	for <intel-xe@archiver.kernel.org>; Sun, 22 Jun 2025 05:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B1F510E31A;
	Sun, 22 Jun 2025 05:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVUseOyh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAC310E31A
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Jun 2025 05:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750571871; x=1782107871;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=hhic5c9JKC+pnpIbGoCVJuq9tK1DFTB7RruT914ic3M=;
 b=NVUseOyhAhUsPPpzTU4Ntw9JcYCWqUFa6tB3A6k0qLDC2+P/2MLHT37A
 O0lzYNw5qWmSIvcEm4gOgkrK2xwbWc3/6PCpigA9FEZzEuYIBIMbFfBff
 lQV8Faj14xKzmWW3hsbB+ja9m6vIqJFJWPJWLYcsO/CWGbrC83IEJm1rJ
 bgPbfegTO4tDbKW106iRcdXAbuy0TccDzGXxzTn1PjUdH9MCQJPafQmCC
 WUFBOkkZNJmr08qy7NbhVpvGJk2a5yyV5MQDhUMaB6pRst+zPpQdhjHRe
 l8CsYK22IomM96aEDwQhXeHgtWSr5n5r5t80nSuYxlL22dZHYQavNq6KD w==;
X-CSE-ConnectionGUID: t+hAsvb+T6aSfJpR0AOfQQ==
X-CSE-MsgGUID: NN886NyZSzidytTI6k733g==
X-IronPort-AV: E=McAfee;i="6800,10657,11470"; a="52018642"
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="52018642"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2025 22:57:50 -0700
X-CSE-ConnectionGUID: YWC4a99gQSCqkaiAu0kkrg==
X-CSE-MsgGUID: IqcdEHEvRVaNlbFX6ccbYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,255,1744095600"; d="scan'208";a="151492887"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jun 2025 22:57:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 21 Jun 2025 22:57:50 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sat, 21 Jun 2025 22:57:50 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (40.107.100.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sat, 21 Jun 2025 22:57:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PqZCT/L7khzdEeoIPaQNy4bMa6t4jmj0QSmq5qlL+Lhv//RA+rTT34xNOzUVUOwNSKl80UrWnqWMotKW5mW4jTc4ziIeqsZrMqK8nAMhXduBVbYQ6YI8rHys93Ckg6cf0nPtG0fAJ7IVvS3FI7tSJvRdzHLdPA2lWJduVcrClZWERSmsZ6kfyujw1ky0TlYtn+a7EMFD3F5t5jfubQLHLAAUmp+SzgLl7jWDOD6dEOHg6qIOAY23Y9eeRoW26egiOLxi+Ee/h84Gui1UH7T1/JlbKOgQ1ZLWylFRtYfe3GYENNKhWa/BFfmO71G7I37eyas6n14bhdFl+Rqgmd9y4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rl2m/xBf4ohLBedU/7otuP3EmMNPbnD5h1JbD0bb86A=;
 b=PyGKtUsMkHDoccDj9Q86wrU0cL/2MZdTT5VVU3eTaT2RW8JhpqPBxAmoqUnPWCqshz7cdmcdjxkd4EtytQbfL9M+ZRyxMmfgA5ouhMyG4MZVhywQCoANldtF3FyIiLgLcZC3qvLBV5q2pBLyRffAN43Actf7qQ7J82G7VjkaaAyzmc7+ViRqMkdj1LzY3flNDWaiL2S3BVJJxiymhDjNYBZnDFGpKU/NNPCPIf4DcR1d4V4UjWBcvBLFrmhNKbYWQ8GZKXHA/LjaFA+veMerYEHRZiFeSj0Z82kKaPH+zVQUxN8MPGrwecGy431M9cGEu473y6LSI+rpjs1jr/oZGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by PH3PPF4EB9556A6.namprd11.prod.outlook.com (2603:10b6:518:1::d1f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Sun, 22 Jun
 2025 05:57:28 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%4]) with mapi id 15.20.8857.022; Sun, 22 Jun 2025
 05:57:27 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>, 
 "Tauro, Riana" <riana.tauro@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Nikula, Jani" <jani.nikula@intel.com>
Subject: RE: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Topic: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie
 link state residency offset
Thread-Index: AQHb4dw/+q1qPUjUFkynQkEyqZUaP7QOsRxg
Date: Sun, 22 Jun 2025 05:57:27 +0000
Message-ID: <CY5PR11MB62112134B7E3BECB3514228C957EA@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20250620120356.3289744-1-soham.purkait@intel.com>
 <20250620120356.3289744-2-soham.purkait@intel.com>
In-Reply-To: <20250620120356.3289744-2-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|PH3PPF4EB9556A6:EE_
x-ms-office365-filtering-correlation-id: d02941a8-c1c4-4963-ff29-08ddb151ab0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7053199007|38070700018|921020; 
x-microsoft-antispam-message-info: =?us-ascii?Q?uVH6Po2XLNjP8AzmrG75KSa8tACt78jb7z8SPcD7OTJV1rCif4nWRQ3nvVnZ?=
 =?us-ascii?Q?28jxcPCZ2MWcRO2A4ApdXZuaAMJx3704JE/44unFZORnC8CZTWwZGbwQp+gA?=
 =?us-ascii?Q?4YVgfnw8QXdzfpfrdfSm/TSZVwUAbPbgFvSzMdMkKEhoqQtkHdcx0bGZn9mP?=
 =?us-ascii?Q?pVXgIO1xVAVzcojGt04BwxkRMBGLFNaIF9+XkLrxghlrcSievjt/DAKzZqx6?=
 =?us-ascii?Q?G1T8VomIKDOvFtVkGDeBr0z2innVplZxFX+bGbiMIdruMTxN0oJQgPZbq4wX?=
 =?us-ascii?Q?bKauj4KrpClMhUNtud/HQeUKj6MmTh+Y9MBkjQysvQQIWhNoMnEW58sAPCo7?=
 =?us-ascii?Q?mJ6mKKG7X/R6m8spNHLzPo/lvUl4fTCoN533Z7tVbxtDnQG3c1I0ztieiUBd?=
 =?us-ascii?Q?GIbIjjYP6+2WI2uZwwKI+YYFAMQ4lTzAxmz/GBreOTCLiWx3IIp9VSush0K/?=
 =?us-ascii?Q?qaDtpeymbNXRUosoBfCTpBHIwUllZTdkYTMjlmz8ZbxnvBQUZOx/uJbGMhE8?=
 =?us-ascii?Q?iG35fZrnLFPX9UCr9GZyG8rsI/NfaDLKytpW/lVcb1Tkf6PS4SVNelMtwfpZ?=
 =?us-ascii?Q?48KMzgn/NLe6mtGUaeDdyzh1O+O11FSYSmWMf58RoI4YnsngnCmZNESPESJ5?=
 =?us-ascii?Q?HqZBBegVbrhPNYCs1VAkZLj53KEvtEE938L6KG3afIPqCnOeC3EMiDCD8cBn?=
 =?us-ascii?Q?m9CAKLnUPJeXO4Zv20WdPD1OD/LUfWr+ugiSmG1+g2aLqMWmtVxT24ljXjgB?=
 =?us-ascii?Q?ifsvMx3K3lwdmYGfl9ZGXujpgyj1bwd96YUY+CXkmkTGsTUMXBWr/o/zDlrb?=
 =?us-ascii?Q?B09KwlxHgZgUall3RDblKiYwBync1Y2IkXhzyWOmCn+LrA81uiGt3VruBdOi?=
 =?us-ascii?Q?qFnqPwTcrAA0Id47m4uPA/5iODyL1QzzSjZTvsodZBzL4j7x0cByJtzAVXE8?=
 =?us-ascii?Q?eUEExrhBuOTBgyMKM9vGJGRnNYCan1qKebJMO1SJjg8lr2eW9yoK0VIQ7FNU?=
 =?us-ascii?Q?5zcS9OgdhxqkXRtfkBtRReB9oJKhBUGDfCt2t3i03O7YHowcE0uU8KgD6Xgs?=
 =?us-ascii?Q?ccpL9ppYzNqY2hgtj65xHqIH5zENwarhDaSBrJvfoComh4YgH0HYsq4f7yse?=
 =?us-ascii?Q?z23Nlz3kQy672ZuB5ajOYiVkzaNFHMbQncXCo2Fi8Q/qMpkWF5KOKe1W8qDi?=
 =?us-ascii?Q?vmnroU21QjX5O1ZLzj6ODg8C/3rTNU9MMqT4d5FK+WQvsU14ow5BcrQyx2lp?=
 =?us-ascii?Q?0FTDUQ83xVl7eBo8cqDsQUqja0RL3CAkr/2PgoTSDfTAWN5bY7L0jomCK1Ft?=
 =?us-ascii?Q?e7kOonmnhZN25uMhNdClAOeXvIVPO7UQeBKYVjP93QRMHGe1b9GS/VrdR0fB?=
 =?us-ascii?Q?DKsq/yYRhQiLE9WoESJP80zGiejtfA76fG/BYAXLJPzlTyrR+jJroj89VAeU?=
 =?us-ascii?Q?yr2JpByAxhnuXQm6P40X9C4+UayffOFL16Yj3w5UVKW226v4xepYs/AFoTJy?=
 =?us-ascii?Q?Aec2YneBhB9gIes=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007)(38070700018)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MWqashEeBT9PtZME9ALHIGaYTlVpd3p8YdhkGcVNnbvp+MHdhnH2k1Uqfh2I?=
 =?us-ascii?Q?GtMykr5H/bmPU8F3U45nq/MQV8bpWRTqdkvwFKQh9IiWI0A0HQbQzn6hXGL3?=
 =?us-ascii?Q?sRPToQjpMm+WDe2stX11XZTAqNuTtCO8JI9l73G4Vq0hIvLTJtHBG0kePb0/?=
 =?us-ascii?Q?p1IygF8SyHLa6cgf6RzGk0CJBUOu50lKRL89maiGNFay61JRaYm7XfTNjP3V?=
 =?us-ascii?Q?Q6BNJpIamx3Vg5AM3jzU7wot9zeLZKVx2ALKL4SELw21voijB3r6D3GXQrwn?=
 =?us-ascii?Q?nPK2HMeLFeT1FHRWwKtMtmCha6TEUkzqgsvM+bW0cCReY8mykEKMa4n2lOdm?=
 =?us-ascii?Q?tMx15F50QGQFKwxZsBimmQyymzoYfIFQ2rF4IBCvqtSNcPpkUjEv429dUDRB?=
 =?us-ascii?Q?KI0WN6Ip56XYDPfvSpvkpyLhIWyOuj3at6smn3kKNe89BkIjb4XV9QRpefRO?=
 =?us-ascii?Q?K5RVdUpXZhkzBVYnC1u9q2h3cFpgX0xj0r5Ix+RPQBBptBUuEIifvn6A6YAW?=
 =?us-ascii?Q?zkbQ2LMhjI1PjkYTmPLpwXDFbGqUrboWJ5opv1266n+VpmvQU8KdpFyIsvwZ?=
 =?us-ascii?Q?xusr0T+Au+sJg9ZGDvBkj0mnPClJOKmDgtOQHH9n70g0ccedSSH9Md65zQoa?=
 =?us-ascii?Q?v55gfFIvA+8GCtsZnQxRpZIZP72dLaXrVs9zYdFCvLN4Kw8LJ6j9BDXkLIn6?=
 =?us-ascii?Q?zXLsiPbsdTigMvxpCJ8xQ0PVxzcNiL+eqfeUqsrf0aDFqUnQA1mH+U1U82mb?=
 =?us-ascii?Q?VQIZH7ORVJHf6y7id3BvhlxlpSDeHV9VgWpQhQpBu4qLMhgBqgp7RFnc+Kwb?=
 =?us-ascii?Q?ZXAawhv2NuxCUXvwuJol5B2+hPgwWmHOyQhTi1TBTDzqZWz7xvSKuXr3kl8i?=
 =?us-ascii?Q?gzzhzNsFj9/qyjoEnY9CbYZd/swR0EKnGQWTjpSkdtkrjRH3Vuyy5XsATFBR?=
 =?us-ascii?Q?H8KM3bV0PINYBa2qST0PqboZ/UuI1WrSEAbaAa13ZLUCRwPkpFJxYj9ijh+9?=
 =?us-ascii?Q?c2qhOOy3VCRSL+IXSXPjFrbl5OpZ72X8O15FruD6bkvRb49YF/YDaAygk2oY?=
 =?us-ascii?Q?q6syJY2SYxUX2NWZCc5+7HSHzDy1z1/axCL+xnXkb4ZCMq3AnzaI1gzPi+ef?=
 =?us-ascii?Q?rXjFzbmP5hhJDADnIAlHEUcmyYRxIXYMBKHTj3FzoETkPVnd2UhU6wy2f8ZC?=
 =?us-ascii?Q?ZTcmeA0jhcnZOCvWJMuaceIpWP3YXWauiL6eNCNKYsVl7pxi3u1aXJJNsGDf?=
 =?us-ascii?Q?fz5QKysx4uWd3QUVRrzoWoiMY5TC0JP7xCjt3v/uJbnePlq2gwPMhGD+Jjyn?=
 =?us-ascii?Q?//NtwmzWRLTYmIdLmTELnOuDuJuU2mKErL7eYVXqNZEMRICZqYLhrl8q9cYx?=
 =?us-ascii?Q?trCvIbd4ce6pO85dLqcXQ3pGWlPBJr3tgpjNFQRV5A8jUTaqnVQL9P8sR2V7?=
 =?us-ascii?Q?AGjH0V8s4MWnD4/wo+KvBROQbsAxp6AjasXJGPW3iJpslQ2O/I7bgRPbEfrP?=
 =?us-ascii?Q?bh97Pcpm2K/uHKrHXUt9icsvzPHICP9Eg5AptstbOAvvKcfv5peKn7kE0qKs?=
 =?us-ascii?Q?2hkw8YeMoHekifDhwCV9JJWIi42QoKZ3fhjgdXsK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02941a8-c1c4-4963-ff29-08ddb151ab0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jun 2025 05:57:27.6629 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8lAEd3ps/u0A9/H6KKfQ/K9+2v9rZUWO9C2VQU/EwbgWw4/hZpCw74DDALvw2vl6kbl61gV8bv7/5PNU5EdqsVNs7irfaXT+ofi63WNCXnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4EB9556A6
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
> From: Purkait, Soham <soham.purkait@intel.com>
> Sent: Friday, June 20, 2025 5:34 PM
> To: intel-xe@lists.freedesktop.org; Gupta, Anshuman
> <anshuman.gupta@intel.com>; Nilawar, Badal <badal.nilawar@intel.com>;
> Poosa, Karthik <karthik.poosa@intel.com>; Tauro, Riana
> <riana.tauro@intel.com>; Cavitt, Jonathan <jonathan.cavitt@intel.com>
> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham
> <soham.purkait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
> Nikula, Jani <jani.nikula@intel.com>
> Subject: [PATCH v5 1/2] drm/xe/regs/xe_pmt: Macros for G-State and pcie l=
ink
> state residency offset
>=20
>    Add G-State residency and pcie link state residency offset macros for =
G2, G6,
> G8, G10, ModS and L0, L1, L1.2 respectively.
>=20
> v1 : Moved offset macros to drm/xe/regs/xe_pmt. (Riana)
>=20
> v5 : Reordered commits to reflect the correct dependency hierarchy.
> (Jonathan)
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_pmt.h | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h
> b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index b0efd9b48d1e..4e377b6eac92 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -21,4 +21,14 @@
>  #define SG_REMAP_INDEX1			XE_REG(SOC_BASE + 0x08)
>  #define   SG_REMAP_BITS			REG_GENMASK(31, 24)
>=20
> +#define BMG_G2_RESIDENCY_OFFSET			(0x530)
> +#define BMG_G6_RESIDENCY_OFFSET			(0x538)
> +#define BMG_G8_RESIDENCY_OFFSET			(0x540)
> +#define BMG_G10_RESIDENCY_OFFSET		(0x548)
> +#define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
> +
> +#define PCIE_LINK_L0_RESIDENCY_COUNTER		(0x570)
> +#define PCIE_LINK_L1_RESIDENCY_COUNTER		(0x578)
> +#define PCIE_LINK_L1_2_RESIDENCY_COUNTER	(0x580)
If these are BMG specific offset, these should be prefixed with BMG.

Thanks,
Anshuman.
> +
>  #endif
> --
> 2.34.1

