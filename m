Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982B0C25B76
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jun 2024 22:16:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 328D610E1CA;
	Wed,  5 Jun 2024 22:16:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k56T9vDj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F6A10E1CA
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jun 2024 22:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717625800; x=1749161800;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2qO8PS5855QKKDAhR9cDNzbGM0FWiX/cjouJchpVaps=;
 b=k56T9vDj3Pmmedym4dE0tVFuQsGz3gooX4/OpEkL/H+TV19ZVSaHzPBa
 ZsEq9cIUFtOkhHbPkjobDnOVsPsEJx8h9KXbbw076fWmexHZaBh2wZ34v
 wbsmIdgt/cKPzRiro7Q/42/BqeO4VzUPCeqaZ5p7YJy/vwWbhSi7XawDS
 HcbpeNfelMBAeQOWFMMw1OVmjPDk93DrS076jyeEnwJyzP91rqMMXhogG
 WWgU8JH2qAc2v4I7rvcvzkoN17kSYYEcL3L1RR+N5vDDCsV6MkqF/3k9A
 BqHuFDdkU9Im8RH2gk7Yjd13+PluqKTT3p3O8meA5If7lzfafDHYXq7+F w==;
X-CSE-ConnectionGUID: tK6XFlraR8K6Dkx8w5tfkQ==
X-CSE-MsgGUID: qZ1lL08dQ8uIiieT0KUGdg==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="18111066"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="18111066"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 15:16:39 -0700
X-CSE-ConnectionGUID: 5A23AdL/TOSfeKYwUchocg==
X-CSE-MsgGUID: XSnSEU3lS+ORWAPmHaPfPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; d="scan'208";a="38391317"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 15:16:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 15:16:38 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 15:16:38 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 15:16:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG/Ia+7enJKCEMrB7MoruAI3r8YoBB+4dmoNCNzeaYC/011BYlIwUbDXxA9YLI50WUbIpGBxFJZ2Cx7QXd+jDrlwsabyfTCVqEFWdYiLiCrpk+3iaQiPd8AxvWgrHM+ZvKZz1dBLqX/A94i1809owiday04sx6vApTIzRNUq1b95Z5WqMT9yoPK0n02j4xn0S1h/mBnV3zckL/yT0+69uUuzNZ/miUhOYAE0S40wbsuMrRmhUUPxdzeABXYk2DlXaoLmI7mSszirm+Zf6oGbJTclfXFdFfDIB22JPhvTsBZO7jY6/ntNeCCCcvcWM9PbKB1RLJgWPziLLsizyAIk9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRSOTtK5azNk03+qKS0ouxJJGjivd4iEF7it38NL2Z0=;
 b=Ek0TiSMRKji84qRSlIu6sRMq+IjWNE2K7cNpqTb0UtXA+GV2QcCdYxjJ1gFbtkrEm4nWiKk1eyyJcwHTgRRlkh06P8OPRvWovYhkAEHbFiyUcwF0Lr+yLYqwBAWIyeMbGQ4yEgy5asONSQqxugsCXQ8Ox783udrx8CQ5DmIESVSxDHiK0raIF753b7SbNaEIpL88l1ZlmKOL3SR2//p3GIhPDDolgJrnfO98dOVwwxs2/ZgW1xulOoT6p3NBnj9TnRAKtsd4b7wVFTWb5c/WSU5LCLR8orO3iQmcyiMn1Ie4jCHHHzAkRmyGjktrx83RbnDiSuH6JMutku9XdZC7Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 by SA0PR11MB4525.namprd11.prod.outlook.com (2603:10b6:806:9d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.27; Wed, 5 Jun
 2024 22:16:35 +0000
Received: from PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::8c26:2819:d0f9:1984]) by PH7PR11MB7004.namprd11.prod.outlook.com
 ([fe80::8c26:2819:d0f9:1984%3]) with mapi id 15.20.7633.021; Wed, 5 Jun 2024
 22:16:32 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Topic: [v2 22/31] drm/xe/svm: implement functions to allocate and free
 device memory
Thread-Index: AQHairldo1MA+p2em0G7f3zr/kPtirFiFhSAgFf3amA=
Date: Wed, 5 Jun 2024 22:16:32 +0000
Message-ID: <PH7PR11MB7004D00816F98BE869CEE31B92F92@PH7PR11MB7004.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-23-oak.zeng@intel.com>
 <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZhcRdy+QnvrA+sye@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB7004:EE_|SA0PR11MB4525:EE_
x-ms-office365-filtering-correlation-id: f016de2a-6f79-48c0-eb6f-08dc85ad27e0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|366007|1800799015|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?52oHRjI2XJqfS/oTV2UgSSLv4+fLpOn6KFci3oA+eM+7jOKK95Iz/zMcBy?=
 =?iso-8859-1?Q?2nhhhiLYI9PqskGdVLlpfD6ryDEORrGh9p3lOrqgTcHkqsLpBH3gZH8uBq?=
 =?iso-8859-1?Q?iCxGUwouWnHZxTuHW4z8kNUPWYjkR7UJotpG8TuXbG8Oxw9KN/xGw1CGd8?=
 =?iso-8859-1?Q?/rLfnKmvKF8BWD2kFZG6ju4+lSpc/cHS13b8XXcyWZ7uEnS87PpVN7UNFB?=
 =?iso-8859-1?Q?mcgonOvjRY7getkI5Ntdi35TK3ui+IJcOSQFGYLu5YeSH7oSUr2qXnlhU9?=
 =?iso-8859-1?Q?6cI9PMbl51UDJ9kvdQgAGet6C9DLfJe5UAkPbuGewktkpvYnrzIZj1j+o5?=
 =?iso-8859-1?Q?yPhkBN70FxLxJni31Y+5Z6W6kWHNr5EzhM+av7g1UESZiqStqwEHe1sDX1?=
 =?iso-8859-1?Q?6boc08NlxIqo9vKE0nG42t2bb0t/InnIeIUygWu3g+x1hzfCQM2fdA4Azz?=
 =?iso-8859-1?Q?QZGLS7DN5YL6KTHeo6gxqjkyOykcjDHKMjhwZhfB3jdfAd6+O7GmhV4HCS?=
 =?iso-8859-1?Q?jXA3krvOl/SERsCF04DuhAs7W4OM103+IlY5wHZZJhxaY86nT9vImS0cR0?=
 =?iso-8859-1?Q?fM0WJrS67A9MusJw6yGcqCL4M3R2iXtJmnoGPndZw3CXF+z4996Xl/6H32?=
 =?iso-8859-1?Q?tdRZLErEgFPjmG0oWXJNUOEAQE9b7kLCd1dDBtHho1OtuoqJlTCycWJwGB?=
 =?iso-8859-1?Q?d+GE1KDkxtpTe7/y91eTVWR5SijunCKT7qI8qczvm7MTwEz9uVUgNPMZva?=
 =?iso-8859-1?Q?AKkdSiR1GDw0FovYSyEl0yiSFQ5am05SSAWXaD95OOevDewfBTwBxM3kqi?=
 =?iso-8859-1?Q?7RaX0QOUA98kT16ZrncuT0Q5amGdj3N+G1lr4W2utqic8Rtg92h9H3CRwS?=
 =?iso-8859-1?Q?yA2WlfsiKWg9sH4exiUXYiDh11L/0s6KZwWmA6zkvrpi3chE5rPmWGLFQ/?=
 =?iso-8859-1?Q?tON3Nz4XYTMDNd/Qq/BCpMykL0ombNjxQLqxltq909wwTyZIZJLFeXQkwr?=
 =?iso-8859-1?Q?FSA5oJ8fa0j+Ak3AqjUFLmknM5aax/TnP6sTljiOSo3ilxjjMAqRzh3t2y?=
 =?iso-8859-1?Q?y7eqy79MjpmhhZlQDkNKAcHnrg7IWm1VRdkTZLRlPncu6MnKzW7SHIEmHM?=
 =?iso-8859-1?Q?jM1xiiMirvr4eHnl078idBGP+CcxvQP9p/zjUq2qy4J3AWG/lz6FJYSpdx?=
 =?iso-8859-1?Q?GD0ptDrrqnUiPqdYdLPA1gpw7iXUHQbHRsIdbnNDZOiks3uM5xXOgPlS35?=
 =?iso-8859-1?Q?qGPRiYEfc81JCXCVW/qsFKXZx9XqYn05rXZOJsXo2do7ZJnvrnW8fTrBm/?=
 =?iso-8859-1?Q?UzmbfkWfVceYwZrjQpyUehYlsTyIICL+gTxwVepPH7UpDrjKUIzS85twU0?=
 =?iso-8859-1?Q?Lw9+U5cvvAhjEH5ss6Eq9rbnd/mCtmJQ=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7004.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?JhLfYiF1F/Dc3Lsdff9liV+v2ca+QDZXlBAH3xgQsDHA52c+rOlxtmc8q1?=
 =?iso-8859-1?Q?un60I/iO8+rDbqu1yLfX1Rr/KSpcaxIQCDyZW4FBBYLUcDtGmUPvQGsDci?=
 =?iso-8859-1?Q?U9wPkoAY6HhZDaIGXqAP/qg1jT9+k6c5nE4xl8v/i1QO9MtanV8jX9Uveq?=
 =?iso-8859-1?Q?0ieuiX1jtLCHAV7yOVT0/CJt5ylJr/7QCesnDi/cllk8u7P5U7HjOQLi7f?=
 =?iso-8859-1?Q?ZauVFEGJ0KGc553nkoE1SpkKMyosgTKfcrWMt3aK5AjB8CjzqjslliDBoN?=
 =?iso-8859-1?Q?6P/J/2ukGF5L1eaAK/apGhjLah45zVZMkmL+cQh5HHYnS8d3WnTkxY/GSa?=
 =?iso-8859-1?Q?9+djolQV1Vy1+hpJUQzUdJ6NY2vwBIq2Coxfu99qRGzoiktbsjxcRXlOBz?=
 =?iso-8859-1?Q?QoGy+IRmTE8FRySQIlvyqhszeGSSsd0n6vGooODYR31sGFk1dGAV/dzguQ?=
 =?iso-8859-1?Q?v0e8wCq5EnvMlw6rwxn7tYDluN8TaGwX3LlARB51OtHTsB0BuU9EJspsT5?=
 =?iso-8859-1?Q?a/T23WPcjc1OBjjKhGX0GwFWx0oBLC7Rb9OuWP+MRy4/A90u75omT2F+zZ?=
 =?iso-8859-1?Q?anlIDiQR1grbi8iEDC5xTxKkPSyIRG7dL9MdY7dsltcNOSfk58dnQgB7VF?=
 =?iso-8859-1?Q?qepd98ebQB1rRQdURkbVgPf7TcZkDY5k6QqQFfrRfVWcxryiwSALQNF756?=
 =?iso-8859-1?Q?5socnvlO9nbMPO6ILDGOwd0OyABDoDc/ghlBuDTprhqHwuK7EkrHyuAomu?=
 =?iso-8859-1?Q?o9Zq9dDou7ivCQWqOeZaFOfNC30tg4tVtegg5pObnHJOZ8wV09dC1nVVIZ?=
 =?iso-8859-1?Q?TlWIIL1jPyePOY3cyqrWJauEz8bZgHYnXhXeVhuFun5s4BgqVuZcoHWA+c?=
 =?iso-8859-1?Q?UrNOUGzp6mxhwgNPxCRwfPaSJfxIu01YTJbszPb7ctpemUyYxPk4CQ7Wc9?=
 =?iso-8859-1?Q?cC9AyBPhk+l7DNYu+73mD0DBt/QJN0QUifCLRJ8OwzCCHx1n2MXT60rOQv?=
 =?iso-8859-1?Q?6omS8zwwO+W9Lua7F3/T+iXnBtUvA5JhYNjOtMv9cU3VH4saDs31AvbPl/?=
 =?iso-8859-1?Q?8HMXOGUh9aG2EGynodVO3gqFAU5sWUzlXYNjtGl484xRVDHsPXj74h6hC3?=
 =?iso-8859-1?Q?/KwTvILlF0KpMd21Cog4p4TjQqIdnbtidcWY0znp/L3l7O1Lm1nNbfDVpg?=
 =?iso-8859-1?Q?NAS4fbztGrDrqsDoToK0V6ACJtcbdvaiDdPmTJ4i6Cb5rPuaJA3lh2DogI?=
 =?iso-8859-1?Q?vUEa9MNVvBzPPpePOu8W8scli+uePtUMSkg3zacEulY3c7y1/GrdYg6I7Q?=
 =?iso-8859-1?Q?qsxR+lGa4n7BokaknSg0eciXI9+mCFnMaYSzISF8KLfILdLkijlXvn6AfZ?=
 =?iso-8859-1?Q?VAAKcjZkLo9yO37P/M98PaKrPS7d8fHYvj8NxrIp5H5vJlxe+q7tORz13x?=
 =?iso-8859-1?Q?JcrgJvi+7oc8r01eRllEIhUhWy+FEMVU6AnZ38Q2f/18RcvTSHFEWsLT5p?=
 =?iso-8859-1?Q?yGnwS/R3JaCPKVbGo9H2D5/53bGHhWAMR3CGRe2eFV5IOeKUH9EXp6CBwg?=
 =?iso-8859-1?Q?xBO9ADvjvDyu3jdRZrIL1VSmWuEXliS26ShWm7+fY7JdrRa81Jm8EOciY6?=
 =?iso-8859-1?Q?g/QdEvRHab0Mg=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7004.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f016de2a-6f79-48c0-eb6f-08dc85ad27e0
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2024 22:16:32.4021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SDkizEpCw2cR1363mjisK9DbDDXqyd5P6A8Gw0m71iIEruQGwnJJP+H8vlZ9s6uEj/ijUt1KHiqAi0EtE7omQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4525
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
> Sent: Wednesday, April 10, 2024 6:24 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 22/31] drm/xe/svm: implement functions to allocate and
> free device memory
>=20
> On Tue, Apr 09, 2024 at 04:17:33PM -0400, Oak Zeng wrote:
> > Function xe_devm_alloc_pages allocate pages from drm buddy and
> perform
> > house keeping work for all the pages allocated, such as get a page
> > refcount, keep a bitmap of all pages to denote whether a page is in
> > use, put pages to a drm lru list for eviction purpose.
> >
> > Function xe_devm_free_blocks return list of memory blocks to drm buddy
> > allocator.
> >
> > Function xe_devm_free_page is a call back function from hmm layer. It
> > is called whenever a page's refcount reaches to 1. This function clears
> > the bit of this page in the bitmap. If all the bits in the bitmap is
> > cleared, it means all the pages have been freed, we return all the page=
s
> > in this memory block back to drm buddy.
> >
> > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > Co-developed-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Signed-off-by: Niranjana Vishwanathapura
> <niranjana.vishwanathapura@intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > Cc: Brian Welty <brian.welty@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_svm.h        |   7 ++
> >  drivers/gpu/drm/xe/xe_svm_devmem.c | 147
> ++++++++++++++++++++++++++++-
>=20
> See comments about file in previous patches, they apply here too.
>=20
> >  2 files changed, 152 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> > index 624c1581f8ba..92a3ee90d5a7 100644
> > --- a/drivers/gpu/drm/xe/xe_svm.h
> > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > @@ -46,4 +46,11 @@ static inline struct xe_mem_region
> *xe_page_to_mem_region(struct page *page)
> >  	return container_of(page->pgmap, struct xe_mem_region,
> pagemap);
> >  }
> >
> > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > +						unsigned long npages,
> > +						struct list_head *blocks,
> > +						unsigned long *pfn);
> > +
> > +void xe_devm_free_blocks(struct list_head *blocks);
> > +void xe_devm_page_free(struct page *page);
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > index 31af56e8285a..5ba0cd9a70b0 100644
> > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > @@ -5,18 +5,161 @@
> >
> >  #include <linux/mm_types.h>
> >  #include <linux/sched/mm.h>
> > -
> > +#include <linux/gfp.h>
> > +#include <linux/migrate.h>
> > +#include <linux/dma-mapping.h>
> > +#include <linux/dma-fence.h>
> > +#include <linux/bitops.h>
> > +#include <linux/bitmap.h>
> > +#include <drm/drm_buddy.h>
> >  #include "xe_device_types.h"
> >  #include "xe_svm.h"
> > +#include "xe_migrate.h"
> > +#include "xe_ttm_vram_mgr_types.h"
> > +#include "xe_assert.h"
> >
> > +/**
> > + * struct xe_svm_block_meta - svm uses this data structure to manage
> each
> > + * block allocated from drm buddy. This will be set to the
> drm_buddy_block's
> > + * private field.
> > + *
> > + * @lru: used to link this block to drm's lru lists. This will be repl=
ace
> > + * with struct drm_lru_entity later.
> > + * @tile: tile from which we allocated this block
> > + * @bitmap: A bitmap of each page in this block. 1 means this page is =
used,
> > + * 0 means this page is idle. When all bits of this block are 0, it is=
 time
> > + * to return this block to drm buddy subsystem.
> > + */
> > +struct xe_svm_block_meta {
> > +	struct list_head lru;
> > +	struct xe_tile *tile;
> > +	unsigned long bitmap[];
> > +};
>=20
> This looks not needed to me but admittedly haven't looked at the LRU stuf=
f.

I am moving to page granularity memory eviction, so we can either use the l=
ru in the struct page itself, or I will have to introduce some other data s=
tructure which have a lru.

Yes, I removed block_meta in v3.

>=20
> I am thinking roughly...
>=20
> - I think we drop all this special tracking (kill xe_svm_block_meta)
Agreed.

> - Have functions to allocate / free the buddy blocks, store buddy blocks =
in
> userptr

Why we need to store buddy blocks in userptr? If you do this, you would nee=
d another block_list in userptr.

I currently use the struct page's zone_device_data to point to buddy_block.=
 It seems work for me.

> - Blocks are allocated before migration to VRAM

Agreed

> - Blocks can be freed on either CPU fault after migration or on VMA
>   destroy (probably depends on madvive hints for VMA where we free
>   blocks)

My current understanding is, once device pages is allocated and handed over=
 to core mm/hmm, driver doesn't need to worry about the life cycle of devic=
e pages, i.e., core mm/hmm will take care by calling back to page_free vfun=
c.

> - Blocks allocated / freed at ia chunk (xe_vma in this code) granularity
>   (conceptually the same if we switch to 1 to N ratio between xe_vma &
>   pt_state)

As said, I am moving to page granularity, moving away from xe_vma granulari=
ty, to address concerns from the drm community discussion.

> - block->private =3D=3D memory region so we can get pfn from block

In v3 code, block->private is not used. Will use it if needed.

Each struct page has a pgmap pointer which points to xe_mem_region's pgmap =
memory. We can use this information to get a page/fpn's memory region.

> - When we need migrate_pfns we loop over buddy blocks populating
> migrate.dst
>=20
> Also I noticed the drm_buddy_* calls in this file are not protected by a
> lock, we will need that. Currently it is tile->mem.vram_mgr->lock in the
> VRAM mgr code, we either need to reach into there or move this lock to
> common place so the VRAM manager and block allocations for SVM don't
> race with each other.

Ok, will add this lock. Lets keep the lock in vram_mgr->lock for now for si=
mplicity

Oak


>=20
> Matt
>=20
> >
> >  static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> >  {
> >  	return 0;
> >  }
> >
> > -static void xe_devm_page_free(struct page *page)
> > +static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > +{
> > +	/** DRM buddy's block offset is 0-based*/
> > +	offset +=3D mr->hpa_base;
> > +
> > +	return PHYS_PFN(offset);
> > +}
> > +
> > +/** FIXME: we locked page by calling zone_device_page_init
> > + *  in xe_devm_alloc_pages. Should we unlock pages here?
> > + */
> > +static void free_block(struct drm_buddy_block *block)
> > +{
> > +	struct xe_svm_block_meta *meta =3D
> > +		(struct xe_svm_block_meta *)block->private;
> > +	struct xe_tile *tile  =3D meta->tile;
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +
> > +	kfree(block->private);
> > +	drm_buddy_free_block(mm, block);
> > +}
> > +
> > +void xe_devm_page_free(struct page *page)
> > +{
> > +	struct drm_buddy_block *block =3D
> > +					(struct drm_buddy_block *)page-
> >zone_device_data;
> > +	struct xe_svm_block_meta *meta =3D
> > +					(struct xe_svm_block_meta *)block-
> >private;
> > +	struct xe_tile *tile  =3D meta->tile;
> > +	struct xe_mem_region *mr =3D &tile->mem.vram;
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +	u64 size =3D drm_buddy_block_size(mm, block);
> > +	u64 pages_per_block =3D size >> PAGE_SHIFT;
> > +	u64 block_pfn_first =3D
> > +					block_offset_to_pfn(mr,
> drm_buddy_block_offset(block));
> > +	u64 page_pfn =3D page_to_pfn(page);
> > +	u64 i =3D page_pfn - block_pfn_first;
> > +
> > +	xe_assert(tile->xe, i < pages_per_block);
> > +	clear_bit(i, meta->bitmap);
> > +	if (bitmap_empty(meta->bitmap, pages_per_block))
> > +		free_block(block);
> > +}
> > +
> > +/**
> > + * xe_devm_alloc_pages() - allocate device pages from buddy allocator
> > + *
> > + * @xe_tile: which tile to allocate device memory from
> > + * @npages: how many pages to allocate
> > + * @blocks: used to return the allocated blocks
> > + * @pfn: used to return the pfn of all allocated pages. Must be big en=
ough
> > + * to hold at @npages entries.
> > + *
> > + * This function allocate blocks of memory from drm buddy allocator, a=
nd
> > + * performs initialization work: set struct page::zone_device_data to =
point
> > + * to the memory block; set/initialize drm_buddy_block::private field;
> > + * lock_page for each page allocated; add memory block to lru managers
> lru
> > + * list - this is TBD.
> > + *
> > + * return: 0 on success
> > + * error code otherwise
> > + */
> > +int xe_devm_alloc_pages(struct xe_tile *tile,
> > +						unsigned long npages,
> > +						struct list_head *blocks,
> > +						unsigned long *pfn)
> > +{
> > +	struct drm_buddy *mm =3D &tile->mem.vram_mgr->mm;
> > +	struct drm_buddy_block *block, *tmp;
> > +	u64 size =3D npages << PAGE_SHIFT;
> > +	int ret =3D 0, i, j =3D 0;
> > +
> > +	ret =3D drm_buddy_alloc_blocks(mm, 0, mm->size, size, PAGE_SIZE,
> > +						blocks,
> DRM_BUDDY_TOPDOWN_ALLOCATION);
> > +
> > +	if (unlikely(ret))
> > +		return ret;
> > +
> > +	list_for_each_entry_safe(block, tmp, blocks, link) {
> > +		struct xe_mem_region *mr =3D &tile->mem.vram;
> > +		u64 block_pfn_first, pages_per_block;
> > +		struct xe_svm_block_meta *meta;
> > +		u32 meta_size;
> > +
> > +		size =3D drm_buddy_block_size(mm, block);
> > +		pages_per_block =3D size >> PAGE_SHIFT;
> > +		meta_size =3D BITS_TO_BYTES(pages_per_block) +
> > +					sizeof(struct xe_svm_block_meta);
> > +		meta =3D kzalloc(meta_size, GFP_KERNEL);
> > +		bitmap_fill(meta->bitmap, pages_per_block);
> > +		meta->tile =3D tile;
> > +		block->private =3D meta;
> > +		block_pfn_first =3D
> > +					block_offset_to_pfn(mr,
> drm_buddy_block_offset(block));
> > +		for(i =3D 0; i < pages_per_block; i++) {
> > +			struct page *page;
> > +
> > +			pfn[j++] =3D block_pfn_first + i;
> > +			page =3D pfn_to_page(block_pfn_first + i);
> > +			/**Lock page per hmm requirement, see hmm.rst.*/
> > +			zone_device_page_init(page);
> > +			page->zone_device_data =3D block;
> > +		}
> > +	}
> > +
> > +	return ret;
> > +}
> > +
> > +/**
> > + * xe_devm_free_blocks() - free all memory blocks
> > + *
> > + * @blocks: memory blocks list head
> > + */
> > +void xe_devm_free_blocks(struct list_head *blocks)
> >  {
> > +	struct drm_buddy_block *block, *tmp;
> > +
> > +	list_for_each_entry_safe(block, tmp, blocks, link)
> > +		free_block(block);
> >  }
> >
> >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > --
> > 2.26.3
> >
