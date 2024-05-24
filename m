Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DFAC25B74
	for <intel-xe@archiver.kernel.org>; Fri, 24 May 2024 03:12:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8A910E046;
	Fri, 24 May 2024 03:12:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="abaluTVV";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC57A10E046;
 Fri, 24 May 2024 03:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716520326; x=1748056326;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=l2V5nQ92IhuITi9cEder2WIrKXf6vt1Cwnlxt/j3Lvg=;
 b=abaluTVVkZmzLToTWW9QYxrhyoEkyCZPKaPCLYDLKGLMLC2kgH7IYdTq
 UuSjF3hM8uoetzeIp+nLOewzfDgaJJclk85HZJGNUE6hoiuyL7mMH8IhH
 2SDT3vD/AgIi/0ORSP5XmnCdPIajttDi51oaIRZpSmR9IvcdDBK1DaEnI
 lRF2z8WCe4PY3eq+xltg6VswZCUvkeXELlYx+gwtcYwSZ5yDoXDRSgHx0
 EKEp443qRdJfbEgC5qCDLj1f7s/RAQ1pmiPqEM4AnbFgPgotaGVUB+kpm
 KVz5s4kmsxcCWdJflSU3u9Oqo57kO7uWNtAV9n3oCGfOJ5QfqtRoziXKi g==;
X-CSE-ConnectionGUID: YizrXcOCSHuyCYrJk6ox1Q==
X-CSE-MsgGUID: SnupS0GqQX6g9PpoPlekFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11081"; a="16672151"
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="16672151"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2024 20:12:05 -0700
X-CSE-ConnectionGUID: 8PYSAQtwTjyqq/43a0eAyQ==
X-CSE-MsgGUID: 2XtH7yZGRl6tjLhPl36wHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,184,1712646000"; d="scan'208";a="71291526"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 May 2024 20:12:06 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 20:12:05 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 23 May 2024 20:12:04 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 23 May 2024 20:12:04 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 23 May 2024 20:12:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW/J/PD4YxRGSfg5JCQVeetKEeHZnA8e9/E9cSVLPqLlu95klRiJNSPHc7BNT9uPDPSxdsiZH1O11Z2BM7IgmL7gSeWTrNGbBk1QMrMP/uFZ6GryEQ1ZGj+enRLCIKoakEBq5p7WYLOI776kSEdyPb64lHWgT4jRQtKJMp45bclK7xdimZWiBICLPHxvvKXeN5Uxnd0aXluBAmjVImJ1F3kY1XdllPKIPQF8sbtWbk+/KGBYaTkNi6km3WXEUBGNHSbZNUU7I7GA+9/qXw4aVdt2liL9wt2miC2X6YpIFPbPEycqLBdZT7lCtWZAdBR6puI8/Su7tiCbfQozdC1S4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHGgJgpJiOJpH5vsQA/zqUOHVqELeARRkmKdDVS8B0A=;
 b=YhgH+DWksvYlDhlWRVAqFr3jX89JXb/2R9A8zsCQvr1cvWh24Eyh1itBwC685U9Hm5GLTf+TruSrRv4ToPJXCJ+sfok67Qa0pERVcpAxNoe24GYKX0VL7fhsjLj3x2XbbsbUi2qCzL4GhtJeHZcDiYn3J9JposVUZ1lJiavmjZWN8hXf2kbVAxWMMAwuSTbmOqPn0blllXKgI7/qyXQLgTIBcip3NFZGZh8uXmC3ZRVPNKhjAOVMOhwudjE6zXNry0t5NTlFfALiJAltmEbRBam7bYul+MP8coBRmWFxU9JtuDs0PHT9GyxSO4xVQ7adaIkJSm6weI702e40wYxwYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by SJ2PR11MB8451.namprd11.prod.outlook.com (2603:10b6:a03:56e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20; Fri, 24 May
 2024 03:12:02 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%4]) with mapi id 15.20.7587.035; Fri, 24 May 2024
 03:12:02 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>, "Bommu, Krishnaiah"
 <krishnaiah.bommu@intel.com>
CC: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Thread-Topic: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Shared
 Virtual Memory (SVM)
Thread-Index: AQHarD0mUxkBmHBk7Uqqu25eJFFxfrGjPaYQgAHWtYCAAAPlkA==
Date: Fri, 24 May 2024 03:12:02 +0000
Message-ID: <SA1PR11MB6991FF018BD39991C49AA7A792F52@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240517114658.810283-1-krishnaiah.bommu@intel.com>
 <Zk3ZKogBOM/YVWq9@DUT025-TGLU.fm.intel.com>
 <Zk3aEQd/2n/fuBXC@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991921B29B701D3E9E0AE3592EB2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zk98Y11X/vDAzvH1@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zk98Y11X/vDAzvH1@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|SJ2PR11MB8451:EE_
x-ms-office365-filtering-correlation-id: d6387c99-d855-4266-cac0-08dc7b9f4830
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?9tDxHi3FpnZNHxBdxoXvghIiH1m80G0Z1D4tB2vu0UJ9XbjuuFPkqycTpY9S?=
 =?us-ascii?Q?HYaLdrnjBfUfsRgsmElupNoKN2ET31UrUq18dQcc35TovTPOBH+AhN29xZDq?=
 =?us-ascii?Q?Y6VxKlqSVffPSqKYZ8qx/8hhy/PPwcRx/Z0qmhDfF/dlYrUIFeDAv6Kk4cn5?=
 =?us-ascii?Q?X7iuMeZcGdaNorLH7z6gIPFhA7uGO28f3XuLPrEn6bDxwPbXLWabea5PL2l9?=
 =?us-ascii?Q?E6z7oqTswHP7QG7oISlUPwSTEswRoDiIzyUeGc/zoaUYML/c7WJGToO2qaMp?=
 =?us-ascii?Q?lDDwYyT94BpsUSyB/L2wdNCoANvgXstUhHk8N1JmJja3JUW9pc0Wt0TuOREQ?=
 =?us-ascii?Q?UuBXMXmWDk5Ts8bmWFIS+2tokEnJWcQIIjndxU7kk7BUyBGRVp4RMuutl0w0?=
 =?us-ascii?Q?L2zRpsOo31og5B/RW6Oqz97rzw5LFv6/d3I8hY3Mjoq7HLZTVSw5usmftVEO?=
 =?us-ascii?Q?ZvORwoo4DjekyS3FQgiebvOjgqpRFa/FhzA7o6k5IaXZe2Ce2p8l3mp8jrYN?=
 =?us-ascii?Q?zXnBGmYzPwZGU6XPZAvhXbPw1YTESOzExeJacbc4IdUyjiGPK198/LNZHgh6?=
 =?us-ascii?Q?vCR9ri7o7eCGGOMI+vu1SR91NMIIKUbz2EElFJhA4MnbUryPsEB0v79OTDrL?=
 =?us-ascii?Q?EgQAZG66mdsc7nH+OAgV58ee+IIELU7NV51+sRz4wraw8zWZp/hsXodbVqQ7?=
 =?us-ascii?Q?Xn9krdB0PsycUuR7D2tGoUgOIX4Ghso/8RPbFV8igfTQRVxh7F9BvFvbk1rt?=
 =?us-ascii?Q?RrUWxMrmrd/twU/OuELbX+t2YMSDB0GHUpvQagnu/TKdL0yR9SzINjPX8XXJ?=
 =?us-ascii?Q?4aPGsYikMUW3ljJ6ajKVDX+xFSoLoQnlBt+VkDr2m4cwrjtxa7rA+Zjwdh/A?=
 =?us-ascii?Q?QbAC7C+KlQk1WcWFOB3+VCSGkLh+toQWC1z+tnzEbcJv3yptC1X2IUHyJXLz?=
 =?us-ascii?Q?QTWsDMxyKC/ddojQJKFVEhynYSJ+C/wA/cYu7VFnL9Ts5ef2ClnF5m5OEcW5?=
 =?us-ascii?Q?isCODT3WhTrrjcu+aqnSjoi8oTNsEXJ8oT4+wR17QoTcMI6EPU09VY/VYPLe?=
 =?us-ascii?Q?uNvk6e8Ie5JsmkcGfnlBfv+RCu8AmuToVCQPW6cOkAsJ7ICB3za2r1X6TFnr?=
 =?us-ascii?Q?UkihiUwSlxMJL8FJzvLrM3SUUf9ET1jp5dLk5l0QlndhfNmI6KW5jBnpw53/?=
 =?us-ascii?Q?7yFjsQC/SSrG/ZzCHNkIxqSSk8eGalDaQEEW0VQgl9K2Nbterdg2Ym7KVZmq?=
 =?us-ascii?Q?CvLTtRuuE6+RbyiLVfo3n6lYf2AdIJjKFU+3PWNYjFqfKKIY19bZwmGcCS4/?=
 =?us-ascii?Q?3wo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LNFYOJ0VWzjyc+Tglvm2vwFUZ/M1sVAjnP/mLUhvnxtMmUXepjbH1dDUqXwv?=
 =?us-ascii?Q?XxT6FkZgFq1loe9d4nFe+g+uYuwh/ZXSb9XuVkAPVWEv0iXQQTv2NFZuTPy4?=
 =?us-ascii?Q?2MHUZtbg25DjnuxefS8+K/H2aSnSZ41C0umUKeAkTldvwOGejyh7dVpZ/hr+?=
 =?us-ascii?Q?XCb9IguLQa35buznXXVifwhTpC5gTEGVmEq/A9cylI+yDUsx76T6JCxnsK6E?=
 =?us-ascii?Q?niai4/qGZPGmysmtS5gFb/aqgB42SADBbqd40Oevxn+9H43aU2aRDfhAcSBi?=
 =?us-ascii?Q?lZFK8/qyUdPMRdSf/hx+p/0ZDitdHBpa9CdA4GkD7m5WZump1p5KlVtB58cU?=
 =?us-ascii?Q?732/pzrljIBR7yC2oQIsyHeWHv6BGY72DM+wOzTPm80k967rOfTCNok/ibHO?=
 =?us-ascii?Q?9kXU/PTrAVwkiRWWnqsQ/D8dQXNDod07fJQs9Vrnfe+AB63x8OcbyhkIfoUT?=
 =?us-ascii?Q?fWw61YAQ3zQgnycQEFkgbqnigX/ThVsFfCtdF/O7GP736iU9Eqnu+z3mfUC0?=
 =?us-ascii?Q?QLMQqPvPrCC+1V56kqkW7vv/lke9CTYug0OIx1UBHoWU/KUs7loh3eOxCK+b?=
 =?us-ascii?Q?9tlAJ1TsWiO8R6RP98NI8bFc7Llsr2dvhdkbcd1oZbY4MmwI1uoR9i1vM4Cd?=
 =?us-ascii?Q?Cn741YSGLE2Q7bpJGTF49nDdzdE97neVN4a34YGxJX7TnLDfBTcOjUx5CYv+?=
 =?us-ascii?Q?Ae1dkHTO46Xmwl4Hkgsl7eL76wzh294iQR43OaLdJXlt0UDdyfgmY+nj4ou/?=
 =?us-ascii?Q?ohlleEwX7CotmN3XPkAhTX69Z5wWk0dx/w1mtuJzjiUECRNm1wV1QLEdxrGo?=
 =?us-ascii?Q?fTjoEAFHoFRN64XpR8Q+5hSyjEUA3m795SZM37YVqzM2YenERRFDV2PIjmRi?=
 =?us-ascii?Q?vVLvrCWYe4dUu2wBfYyV/OyB5iec0vgaLR+bXnUV/zUwDpHiw5A+V7uK+CKE?=
 =?us-ascii?Q?vg9UK2mZOzqcua10RXRhg7vjWhlt//c1LHonxSUf3h1ji9VibgYbBrSSrWHf?=
 =?us-ascii?Q?STEHcKRLbl/jWY3YBtqZDrheCtodFKJorGsWtzcDZDgXmgzaZULMw6QTbdtl?=
 =?us-ascii?Q?XtWyf3aFXfCQInFgdNVgGlwrDA/84kmNE//Menv8iktUvzpvHdpiPcM/vtT5?=
 =?us-ascii?Q?RftEp7zUqq7v7nv9gMKLYmTfCGknj4lyCq7XX/zRAJ4dNGXemIxpgVC7m9DS?=
 =?us-ascii?Q?tfvzab0kEbIHLajdWQHPcj/vRUr0kaTQi/DNTqFZAuNN6H09q+J8zhAuAZIY?=
 =?us-ascii?Q?pW8ukkJlnzdV+dub2s2jpGqPSzHeKsMUuR7cgVL/vhHdZdwBuU5JHYzSG1o8?=
 =?us-ascii?Q?ZrDkwUCYhsauV9sKCEs4XgN1Rg0RqolgPK9I1lGGz1GsJSvYiCBNfmqnYFn8?=
 =?us-ascii?Q?OGyqyHkMDFUv+RrdKBC9C3myONOUN/V78RNKA0mKcgxnV8/N9ZcWdPcwjM/X?=
 =?us-ascii?Q?AwsPPxAs0QY4Rfj/FOUMBmitDXnoYHXoe24/cvNL+PV1IxGqGKJ+/yfoOunf?=
 =?us-ascii?Q?B1L26BTX+PEnBKgJLal62pnMPhtdH0y+B8tyx98ybTJF1YH5ZikCF32o2lve?=
 =?us-ascii?Q?q8pw8elDIr/Zi2RA2oU=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6387c99-d855-4266-cac0-08dc7b9f4830
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 May 2024 03:12:02.0560 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GUp8cHQtlreNCr8pHTYjiAgZ/3SGjVPC3jwZ9Mw1F5GOQOXy1cyXks4lgyUYnlKSzPxkCfkfcU8cNnjO5JFLHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8451
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

Hi Matt,

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, May 23, 2024 1:27 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; igt-
> dev@lists.freedesktop.org; intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for Sha=
red
> Virtual Memory (SVM)
>=20
> On Wed, May 22, 2024 at 10:53:05AM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > We will investigate your tests and see whether we can achieve the same
> coverage with our approach.
> >
> > See also comments inline.
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, May 22, 2024 7:42 AM
> > > To: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> > > Cc: igt-dev@lists.freedesktop.org; Brost, Matthew
> > > <matthew.brost@intel.com>; intel-xe@lists.freedesktop.org; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Subject: Re: [PATCH i-g-t v3 00/10] tests/intel/xe_svm: Add tests for
> Shared
> > > Virtual Memory (SVM)
> > >
> > > On Wed, May 22, 2024 at 11:38:18AM +0000, Matthew Brost wrote:
> > > > On Fri, May 17, 2024 at 05:16:48PM +0530, Bommu Krishnaiah wrote:
> > > > > Introduce helper functions for object creation, binding, submissi=
on,
> > > > > and destruction, applicable for SVM and other tests
> > > > >
> > > > > xe-basic test is validating the helper function introduced in
> 'lib/xe/xe_util:
> > > helper function'
> > > > >
> > > > > svm test cases:
> > > > > svm-basic-malloc
> > > > > svm-basic-mmap
> > > > > svm-random-access
> > > > > svm-huge-page
> > > > > svm-atomic-access
> > > > > svm-atomic-access
> > > > > svm_invalid_va
> > > > > svm-mprotect
> > > > > svm-benchmark
> > > > > svm-sparse-access
> > > > >
> > > >
> > > > There's a lot here I dislike. Let me be direct.
> > > >
> > > > Firstly, this isn't an SVM test; it explicitly binds userptrs and B=
Os. So
> using
> > > > SVM prefixes in the test names doesn't make sense.
> >
> > It is SVM test. Those test use BO for command (batch) buffer. But the
> buffer GPU read/write is malloc'ed or mmap'ed. So it does test SVM/system
> allocator functionality.
> >
>=20
> I did miss that read/write addresses are malloc'd or mmap'd.
>=20
> However, I don't see a huge bind anywhere in the series.=20

Yes, I pointed out the same in the code review. We need to fix it.

Buffer Objects
> (BOs) are only unmapped, not returned to the system allocator bindings,
> creating holes in the system allocator space. Additionally, BO addresses
> are statically assigned, which does not align with the system allocator
> design of calling malloc to reserve address space. This was the source
> of my confusion.

Good points. We need to fix the issues.

>=20
> > Malloc'ed and mmap'ed memory can also be used for command buffer. We
> can add a test case.
> >
> >
> > And having RBs with
> > > those
> > > > names makes even less sense. With that; This email is directed at
> > > EVERYONE
> > > > replying to this series.
> > > >
> > >
> > > Didn't send everyone, CCing interested parties.
> > >
> > > > At a high level, I've expressed my views on generic helpers hinderi=
ng
> the
> > > > ability to create truly powerful tests that provide the necessary
> coverage
> > > for a
> > > > complex driver. See my thoughts here [1] [2]. I don't see anything =
here
> > > that
> > > > comes close to addressing my concerns.
> >
> > I replied again to [1] with more details. Please take a look.
> >
> >
> > These tests are so simple they
> > > won't find
> > > > any bugs in the KMD beyond the implementation being completely
> broken.
> > > >
> >
> > Agree those tests in this series are simple. But this is just a start. =
We plan to
> do more complex tests which are documented in
> https://jira.devtools.intel.com/browse/VLK-59767
> >
>=20
> So we agree that my concerns raised in [1] [2] about only being able to
> build simple tests with this design were not addressed.
>=20
> Having plans is not the same as addressing concerns. If you believe you
> can build complex tests achieving good coverage using this design,
> great. Please post that. Until then, I remain unconvinced.
>=20
> I briefly read the Jira; a lot of it is covered by the code shared. What
> is not can likely be added in a similar way to the HUGE_TLB example I
> shared in the previous email.
>=20
> One thing I noticed in Jira is that it's written basically as unit tests
> (e.g., test feature A, test feature B). Unit tests are okay, but truly
> powerful tests do a lot of things all at the same time, in parallel.
> This is the advantage of the style of tests I write. Six lines of code
> in my example (data path code, that is; tables and documents added more)
> spawned over 100 tests doing this in the aforementioned way.

Yes, I had the same thoughts.=20

They are basically two categories of tests:

unit tests. We will try to cover as much as possible in the simple unit tes=
t.

integrated test or stress test.=20

I tend to think we want to have both. Of course we might have some duplicat=
ions, such as some functions are tested from both categories. Hopefully thi=
s is still acceptable.=20

>=20
> > We will also look at your series to see whether we can have the same
> coverage.
> >
> >
> > > > This is what I think an SVM test should look like [3] (for the reco=
rd, I
> have
> > > > shared an eariler baseline of this code too). While it has some com=
plex
> > > coding
> > > > patterns, once understood by a developer, it's quite easy to extend=
 for
> a
> > > new
> > > > test case. Let me give an example...
> > > >
> > > > Take a look at this diff [4]. It's a few lines of code that add HUG=
E_TLB
> > > > testing. This simple change spawns over 100 tests of various variet=
ies
> (e.g.,
> > > a
> > > > single exec with HUGE_TLB, two execs, many execs, multi-threaded
> > > versions,
> > > > multi-process versions, etc...).
> > > >
> > > > Before change:
> > > > ./build/tests/xe_exec_system_allocator --l | wc
> > > >     938     938   32872
> > > >
> > > > After change:
> > > > ./build/tests/xe_exec_system_allocator --l | wc
> > > >    1070    1070   37852
> > > >
> > > > Being extendable like this ultimately reduces maintenance costs ove=
r
> time.
> > > >
> > > > The test I've shared creates true coverage and is just a starting p=
oint. It
> will
> > > > need to become more complex over time as the SVM uAPI grows.
> > > >
> > > > I suggest investing the time to learn how the code I've shared work=
s
> and
> > > develop
> > > > within that framework. If the same level of coverage/extendability =
can
> be
> > > > achieved with helpers, great. Anything less, in either area, I don'=
t think
> is
> > > > acceptable.
> >
> > There are two fundamental design difference b/t your approach and the
> approach we applied here:
> >
> > 1) Whether to create/use helper functions:
> >
> > Our helper functions created concept of xe-buffer, xe-command-buffer. I
> still think with helper functions, we can simply test writing.
> >
> > 2) use one big test to test many functionalities vs many small tests, e=
ach
> test one functionality
> >
> > It is obvious, our approach is much easier to maintain and understand.
> >
>=20
> This is an opinion, disrespectful, and rude.

I sincerely apologize if those words hurt you. It is not intended to.

>=20
> I've provided a concrete example of how the style of tests I've written
> in Xe are quite powerful in this email thread. In my opinion, it has
> been responded to with speculative arguments and opinions rather than
> code.
>=20
> I have very, very valid reasons for being concerned about testing. This
> series [5] was posted in a completely non-functional, untested state. As
> reminding and to record this publicly, this was developed off a basline
> which was tested with userptr SVM faulting working. I provided the
> working baseline and a flavor of the test I have shared.
>=20
> Going from a tested working KMD with an IGT to untested broken KMD
> plus a promise of 'obvious, our approach is much easier to maintain and
> understand', well I'll let everyone decide how that looks.
>=20
> [5] https://patchwork.freedesktop.org/series/132229/
>=20
> > So the key is, whether we can achieve the same coverage as your series.=
 As
> said, we will take a closer look of your series and give it a try.
> >
>=20
> I highly suggest you study the code that I shared.

Yes, will do. Let's see what we can come up.

Oak
>=20
> Matt
>=20
> > Oak
> >
> > > >
> > > > Matt
> > > >
> > > > I can't find PW links for [1][2] so instead have shared the email t=
hread
> > > subject
> > > > lines. Everyone on this email was on those chains as well.
> > > >
> > > > [1] [PATCH RFC i-g-t 0/2] helper function
> > > > [2] [PATCH] lib/xe/xe_util: Creating the helper functions
> > > > [3]
> > >
> https://patchwork.freedesktop.org/patch/594807/?series=3D133846&rev=3D1
> > > > [4] https://pastebin.com/jUN5BwUy
> > > >
> > > > > svm kernel implimentation:
> > > > > https://gitlab.freedesktop.org/oak/xe-kernel-driver-svm.git
> > > > > branch: origin/drm-xe-next-svm-unify-userptr
> > > > >
> > > > > v2 igt patch: https://patchwork.freedesktop.org/series/133096/
> > > > >
> > > > > Note: xe-basic test is validated without SVM. Remaining tests are=
 not
> > > validated because the SVM driver code is still under development
> > > > >
> > > > > Bommu Krishnaiah (10):
> > > > >   lib/xe/xe_util: Introduce helper functions for buffer creation =
and
> > > > >     command submission etc
> > > > >   tests/intel/xe_svm: basic xe-basic test
> > > > >   tests/intel/xe_svm: Add SVM basic tests using malloc and mmap
> > > > >   tests/intel/xe_svm: add random access test for SVM
> > > > >   tests/intel/xe_svm: add huge page access test for SVM
> > > > >   tests/intel/xe_svm: Add support for GPU atomic access test for =
svm
> > > > >   tests/intel/xe_svm: Add svm-invalid-va test to verify SVM
> > > > >     functionality with invalid address access
> > > > >   tests/intel/xe_svm: Add svm-benchmark test to measure SVM
> > > performance
> > > > >     with a simple benchmark
> > > > >   tests/intel/xe_svm: Add svm-mprotect test to verify SVM
> functionality
> > > > >     with read-only memory access
> > > > >   tests/intel/xe_svm: Add svm-sparse-access test to verify sparse=
ly
> > > > >     accessing two memory locations with SVM
> > > > >
> > > > >  include/drm-uapi/xe_drm.h |   1 +
> > > > >  lib/xe/xe_util.c          | 214 +++++++++++++++++
> > > > >  lib/xe/xe_util.h          |  40 ++++
> > > > >  tests/intel/xe_svm.c      | 476
> > > ++++++++++++++++++++++++++++++++++++++
> > > > >  tests/meson.build         |   1 +
> > > > >  5 files changed, 732 insertions(+)
> > > > >  create mode 100644 tests/intel/xe_svm.c
> > > > >
> > > > > --
> > > > > 2.25.1
> > > > >
