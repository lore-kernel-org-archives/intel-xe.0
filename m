Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99AD3C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 04:44:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B2C10E11C;
	Fri,  7 Jun 2024 04:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FC1wBFe+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C065410E11C
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 04:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717735482; x=1749271482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=K+jQ++QVExdocEFXDUl6RaLHDyJswpy/KW0Xz2XV0pw=;
 b=FC1wBFe+KLyFUxCc8/pP5DAdsHEEQC1hTCK6z0oxYh1ZmLoluJVeirAy
 zZM8mE2R1kEFSqzAEnfHoQOFCphYxgLGdKwiVtGKkmxe1BxM9XaDuZXjk
 j8kkI7UWFquO6L5Fuw9dahdJBpXL7xB2pzjX3Pg4pLxZ0UWw3UgA3PYjX
 33Rixy1tryDaFMAwlMkdvYQwHl16MyCdCpt5ZCkAue1blm8o+owhCrG3H
 IH99XIJosIz2t4hNfFHesCRbbe/iTQKxZdIxMihTfaf3VXe6LYzrg1gzV
 gkBGcvytvhHsgZIXAGwQZnhhEWU5LuZuISrmopc6e56LrADSjCKwv67pu A==;
X-CSE-ConnectionGUID: nZW3v0+WRiGcVmciUJm/eg==
X-CSE-MsgGUID: nT/rAvFiTzWn4U58XAwhlQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="14394244"
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="14394244"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2024 21:44:41 -0700
X-CSE-ConnectionGUID: Qa0pSIS+QSW+S+xTj+be9g==
X-CSE-MsgGUID: HOZTwujWTiOFkrLu0Uguqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,220,1712646000"; d="scan'208";a="38265429"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Jun 2024 21:44:41 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Jun 2024 21:44:40 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 6 Jun 2024 21:44:40 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Jun 2024 21:44:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmLpG1dkSaC5tLPZEw92wF5cX3GP/I0IicHvoQzvjS7hCsm/0O5OOawZIa3ZHmCHmB9/8Y399KzdagRRw8O5w/QGkVvxwB1Kp2+HUgI8xLX204FTM3q4QjvoKRFeJXgc4FrZU20osw6uINbILJz3vPt/0pChv07YKpCLYeYYMLsAfNnEwJ5wVDAMy/iBP41la7N7iBK8UTQHu8K17Ez+kpspYfoxKtb5wYtZN4YZHiFSz0Dj0gUMVykGQ9l1rOfDHbCd1hVOW47c67yXSoOATiSMgWv/wYoXeD0w0NoqAPXmsVyAmlzo6bCnzZzGq0GAJq8vje63uny52JC0UsSRdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yT6R5UD3Abo3uxxvooRv/TRfZQIqcX1mylbtcL/HAIs=;
 b=YPOYxdcwJ8voBw9CBePAOTrGzqan0Fgt5gHI7TTSy+KLEmJPdcunXA4/gBayrdQTACM1n2ZXTqAfLfJeSSZ/2IBet+FkooF5OGbqhBkvSm7C84n4iZ/yy9ebWrNXToIzq3C4w3xGTVx5lR6jhX68bvIp8+CpUcR5aiOzTqIFrhthwysiKvfA3Q3FkxwkpH/0B7ccaX6ytSE64xQBpu0aeb0GlcpdxnfmKhrkmJdODlO6UP1EQJ5eB2pz/6PEe0EIx0BC12cbuw+KpRqy/KrlIaS6eSZ4fMy8rfbcmcplTF0ELz8kLp2KqkSmNffGW6q7x+kE5ghNDDEoXQGJI/eFgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by MW5PR11MB5884.namprd11.prod.outlook.com (2603:10b6:303:1a0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.32; Fri, 7 Jun
 2024 04:44:32 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::4a2d:3dc3:a8ff:2dc5%3]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:44:32 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: RE: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Topic: [v2 27/31] drm/xe/svm: Handle CPU page fault
Thread-Index: AQHairlbYWseFE6xEUWVygHR4om6n7FiVI2AgAEE3GCAAZqhAIBXH0GA
Date: Fri, 7 Jun 2024 04:44:32 +0000
Message-ID: <SA1PR11MB69913F8DD3EDBA0AA19C161392FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
 <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69919A436E1D1098148A1E0992042@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zhl5KFMvLbP2FvjJ@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zhl5KFMvLbP2FvjJ@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|MW5PR11MB5884:EE_
x-ms-office365-filtering-correlation-id: 4fc6d07a-af97-41a4-d04c-08dc86ac861e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?rmAEW1aLBCG8WfHu9znllQYNgEOf5KDFpEQlSHZrsbx1/pDoWV6fNMGiTu?=
 =?iso-8859-1?Q?xA7Jg7IzECvXZ3W4nbmn7YJITv6yqstoDNZi398LuatEcOmh4pkFwzqFyH?=
 =?iso-8859-1?Q?N6CAkPMwXHyPzFQ7bNhiMrqyCQ7tURxTKQf1Ps7w/u3nH/HEYaJgHhfGFm?=
 =?iso-8859-1?Q?vODxBYlhDyYDhwjxq/2lYihnZ7TOE+9BAc24MADV+hC5r0YbJnzu197ao4?=
 =?iso-8859-1?Q?rkN7tpz60aiBlitkMorjb2jFMskr3ljwUvYgCGup6/FsfaIueWBAsgYJaQ?=
 =?iso-8859-1?Q?2zb8avAa0yZzn2do4I3ogUR0biakdSmWKBPsW5CkXtoq9rCAHWONJKNv6X?=
 =?iso-8859-1?Q?tcbaatNs6NNnKY/5zDk6Qjt/NCwKr4tYcXtvPV635/wjTvAsiNwKFORKeb?=
 =?iso-8859-1?Q?I+lGrQ2QXQOC12JhU4+UKNd5r1lwn8SfTioc5aQlx5VucLhlGOJ3musO3N?=
 =?iso-8859-1?Q?a5tMmBUXinVneO2AUiS8HjvWh/TM26ZSxwAst6B8V/JU6Q8yhV8x+2UbR5?=
 =?iso-8859-1?Q?m/24a5f4QG/RE+t2dQ6NxEdIua4HPmY0R64G48f9Jv6w+1YfgWbjD4pAnl?=
 =?iso-8859-1?Q?i/PKzmzK7drXFAo9XPc5k0B00j2v6EuwNPvqISBn87O5RndKiN1+fyy5/Q?=
 =?iso-8859-1?Q?rAtvjtmsnPG6O649KRlbgvoER4YhriZo7v/ZhUGi9C91S5aAMUJTSCdiDn?=
 =?iso-8859-1?Q?iAJi9mY6u8LS0/Y3hMATF+nT0bGQzRs3rNSjNaVURyOsMuF/a3qA9wMND9?=
 =?iso-8859-1?Q?hLmNuUiH354HCQRbOWJiX+zGxswRu4c/RTPrh6TxLaivUCpeg3ORS7U+Dr?=
 =?iso-8859-1?Q?ZgnpZF7ltpvMCE3zI+Bp52StKPGaM1uVP6ONGxvwmjapp4+++2KvAsBfgw?=
 =?iso-8859-1?Q?ssXYs97dpRbmwjTh2f55F2C2Oef1OwVlcojPeQr1jUT98HejWF52Py0AtK?=
 =?iso-8859-1?Q?htZK5SD/kCSTShfMSJXZTLb4mahyu8qobP+6lICFycVwnvfmIaVoDnGxIA?=
 =?iso-8859-1?Q?xNyuFUOY+mJAjAA1FqsxUvl9FtWICzXaoctL2CHH+VZKNkiF2EkOBCpNS6?=
 =?iso-8859-1?Q?8q3w7nQcMbAYcXfT68X7QwYmKtAsv2/c7QYwg+wZY5unGgf5m49mVrB04y?=
 =?iso-8859-1?Q?oeyCaob1yE8R4sZd8jEF9M6MDbVyKs4Dj4hA0GgvQs3bVsu/Or153TIu17?=
 =?iso-8859-1?Q?2vmrKouadz3Qlb1hcMCAfg34Hfp6dBI//mEy3ilNlwAjr2UOtD/4luaayK?=
 =?iso-8859-1?Q?kKjKI5+s6kcZxpRm3L+/sr/Dorvo63akVL3sAWr9k/O7vDJGIIFJR6SCYI?=
 =?iso-8859-1?Q?YukHycJsbFotMpQVNgKbw4ISv8Fce8SA9CHR7RpGKiH93XQmQ46SJOio0z?=
 =?iso-8859-1?Q?Hqxq6qyqcP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?U81hrlFyf4nyCscD25bumL2cOIdXCzvZX5Pas/+6e7dgN2C2HBhDkOsG2W?=
 =?iso-8859-1?Q?WkY9xdRHkyvbv0OqqaVxHgaJVaXp6yCPqlTP0nOyIPS2I0XrYolO705WXr?=
 =?iso-8859-1?Q?y/daTi/BPQMpYeiMl+/jdGv0jPuWP21TGh3s6XlZmpacQTURf64UoHai/w?=
 =?iso-8859-1?Q?DhxWpUMlyLoU+7wG8H3KQ0nCnmsPDI7wZzPgdLzmRCVkGl8H2y9xbkwD+F?=
 =?iso-8859-1?Q?8p8BWwEIbSXtRGA56uy29yM5OedyTbEdFrI8FOTYHtmQ2NlRv199dZ4nHm?=
 =?iso-8859-1?Q?LjJqPWxZEv0YF/QixTbEWW2lIqjq8i0mO4FNhUqEhRs87q06X9UgIRsnXc?=
 =?iso-8859-1?Q?b0Kht46c6OjqeVwEGJ9RRHt9s0zceNqFj3OvXc51bveSRRv89h23vTzZfw?=
 =?iso-8859-1?Q?1gHNebS1Dq+9gCq2xSCLKQvLC+IcWXyWpZnB0kpgT9pulBmx/E4q1goURE?=
 =?iso-8859-1?Q?onqnPSzNQjGHzdl4FQMC0qLhxE7Rb+LhceFvg0VAjbEF1l9J+jwc0jBxJJ?=
 =?iso-8859-1?Q?twqR6fTPwyobtCa7PJfMyJEBfYKBToPA/8xfW6bOxWrX5NBd+dcOF4kmAp?=
 =?iso-8859-1?Q?PbcQ14XVf8E1pFw/UWlU6sdtC5sFrS9u110yPVF9rfnBXByWSQT51HVulm?=
 =?iso-8859-1?Q?ZMAL/Sw0KI/vBrUfss/7wxTjMZe2WXSJtp3+vcpt9lkHg3Pv8aiQWsmmgb?=
 =?iso-8859-1?Q?EgzN/VvGuQllOh9WObdIPgmZ/3xdIK48NvgMS+M8c+9FNG7GspV6VyPCI3?=
 =?iso-8859-1?Q?tzP6y0BoSI6cWRg3xF8sHO+0gpnixdAX7b98QtACmUqSvloHqxhW/qD1zM?=
 =?iso-8859-1?Q?StE3MErIeDxLYEWYISG6Q1LG3OL84sP/PEQxz277eT2MeT2ghRxhe4ArEO?=
 =?iso-8859-1?Q?XUI9Jc5nuIWg6Ayxwa1eHjwtvgEx2/saoNJZ59gvJhHybmliQxvvmnsIT6?=
 =?iso-8859-1?Q?3Zajf8omaGiJT9Wkpu+Y4Z2S6Oy/T+EsmjU+6GCJ3tBBelkJ60b8HpYIhR?=
 =?iso-8859-1?Q?CX4bOFgJcNxi4Qpbo7zH6WAMtfzez7u+VZ5ybX4eT+/USLRJePPx24ZFoG?=
 =?iso-8859-1?Q?urnX8v3kzH/isC4D7DYWF3auoyYPqz8ICm76NtmnizkCYHL8IMZTcFwR5d?=
 =?iso-8859-1?Q?LrUsBG7hMR6k6wiWzH4SVSyXLdBMAbCdrTp9WoKycbF4MyTGoO0ZE029Lq?=
 =?iso-8859-1?Q?XW3nbrxgpH1WxMNHmQRT7RjE7hREaYPWMTTeMFjz1WKCWB6qdAEr6i1Jat?=
 =?iso-8859-1?Q?bElUU4FNgc7MZ6ZZOfJvoqKAq0TL8aCe6KW+MstDRDvVNIDW6LI+I3uwrN?=
 =?iso-8859-1?Q?sLubT9wcf98j3eJu4G1uIi1AmURC2d59hL9CFNEmwHiYfXcq4HTDm07cRj?=
 =?iso-8859-1?Q?lEKXmCzXmS7n6orcqHqAKMbS4NjMjy61/U5CIAX4HNMaKxxf4D8FDahhlk?=
 =?iso-8859-1?Q?cKskrUtJWM3ycdMedr15rmnyKCH8M0d86yuxutQQLP5lQuesiOdCB4NhPp?=
 =?iso-8859-1?Q?SOwStw5If2uQliFew6aqobKBTjQ5ai4yAOdODsQzU5yPbunJZsBvLCQi1T?=
 =?iso-8859-1?Q?/W0VNh0MCoyMmH2uElprkU4hFsk+hPJvWvTt4I7GldevA6DQDzYXMitNhA?=
 =?iso-8859-1?Q?hzoi8mVRgMA00=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fc6d07a-af97-41a4-d04c-08dc86ac861e
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2024 04:44:32.2397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mpZCG1QWNrg1jDTe3VQV5VacsAy8U/Lpsn48GX/kvGr+IHOvlQ/YAdakMfpnLxfskZFkSFd7rBT9Btcl3Gcf8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5884
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
> Sent: Friday, April 12, 2024 2:11 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> Brian <brian.welty@intel.com>
> Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
>=20
> On Fri, Apr 12, 2024 at 11:24:06AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 10:07 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com;
> Welty,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
> > >
> > > On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> > > > Under the picture of svm, CPU and GPU program share one same
> > > > virtual address space. The backing store of this virtual address
> > > > space can be either in system memory or device memory. Since GPU
> > > > device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> > > > Any CPU access to device memory causes a page fault. Implement
> > > > a page fault handler to migrate memory back to system memory and
> > > > map it to CPU page table so the CPU program can proceed.
> > > >
> > > > Also unbind this page from GPU side, and free the original GPU
> > > > device page
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > Co-developed-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Signed-off-by: Niranjana Vishwanathapura
> > > <niranjana.vishwanathapura@intel.com>
> > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > Cc: Thomas Hellstr=F6m <thomas.hellstrom@intel.com>
> > > > Cc: Brian Welty <brian.welty@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/Makefile         |   1 +
> > > >  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
> > > >  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
> > > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 222
> > > ++++++++++++++++++++++++++++
> > > >  4 files changed, 230 insertions(+), 8 deletions(-)
> > > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/Makefile
> b/drivers/gpu/drm/xe/Makefile
> > > > index f89d77b6d654..65289acdd563 100644
> > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > @@ -131,6 +131,7 @@ xe-y +=3D xe_bb.o \
> > > >  	xe_step.o \
> > > >  	xe_svm.o \
> > > >  	xe_svm_devmem.o \
> > > > +	xe_svm_migrate.o \
> > >
> > > See comments about file org, same thing applies here. Let's put all o=
f
> > > the svm implementation in a single file.
> > >
> > > >  	xe_sync.o \
> > > >  	xe_tile.o \
> > > >  	xe_tile_sysfs.o \
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm.h
> b/drivers/gpu/drm/xe/xe_svm.h
> > > > index f601dffe3fc1..c9e4239c44b4 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > > @@ -7,11 +7,11 @@
> > > >  #define __XE_SVM_H
> > > >
> > > >  #include <linux/mm_types.h>
> > > > +#include <linux/mm.h>
> > > >  #include "xe_device_types.h"
> > > >  #include "xe_device.h"
> > > >  #include "xe_assert.h"
> > > > -
> > > > -struct xe_vm;
> > > > +#include "xe_vm_types.h"
> > > >
> > > >  /**
> > > >   * struct xe_svm - data structure to represent a shared
> > > > @@ -31,6 +31,9 @@ struct xe_svm {
> > > >  	struct list_head vm_list;
> > > >  };
> > > >
> > > > +#define xe_svm_for_each_vm(svm, vm)
> > > 	\
> > > > +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> > > > +
> > >
> > > Don't think this is need, see below.
> > >
> > > >  extern struct xe_svm *xe_create_svm(void);
> > > >  void xe_destroy_svm(struct xe_svm *svm);
> > > >  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct
> *mm);
> > > > @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > > >
> > > >  void xe_devm_free_blocks(struct list_head *blocks);
> > > >  void xe_devm_page_free(struct page *page);
> > > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > > >  #endif
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > index 088ac209ad80..32ada458f1dd 100644
> > > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > > @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
> > > >  	unsigned long bitmap[];
> > > >  };
> > > >
> > > > -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > > -{
> > > > -	return 0;
> > > > -}
> > > > -
> > > >  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offse=
t)
> > > >  {
> > > >  	/** DRM buddy's block offset is 0-based*/
> > > > @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head
> *blocks)
> > > >
> > > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops =3D {
> > > >  	.page_free =3D xe_devm_page_free,
> > > > -	.migrate_to_ram =3D xe_devm_migrate_to_ram,
> > > > +	.migrate_to_ram =3D xe_svm_migrate_to_sram,
> > >
> > > Again single file so this will be static function, no reason to expor=
t
> > > this.
> > >
> > > >  };
> > > >
> > > >  /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > new file mode 100644
> > > > index 000000000000..0db831af098e
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > > @@ -0,0 +1,222 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2023 Intel Corporation
> > > > + */
> > > > +
> > > > +#include <linux/gfp.h>
> > > > +#include <linux/migrate.h>
> > > > +#include <linux/dma-mapping.h>
> > > > +#include <linux/dma-fence.h>
> > > > +#include <linux/bitops.h>
> > > > +#include <linux/bitmap.h>
> > > > +#include <linux/kernel.h>
> > > > +#include <linux/slab.h>
> > > > +#include <drm/drm_buddy.h>
> > > > +#include "xe_device_types.h"
> > > > +#include "xe_device.h"
> > > > +#include "xe_trace.h"
> > > > +#include "xe_migrate.h"
> > > > +#include "xe_ttm_vram_mgr_types.h"
> > > > +#include "xe_assert.h"
> > > > +#include "xe_pt.h"
> > > > +#include "xe_svm.h"
> > > > +#include "xe_vm.h"
> > > > +
> > > > +
> > > > +/**
> > > > + * alloc_host_page() - allocate one host page for the fault vma
> > > > + *
> > > > + * @dev: (GPU) device that will access the allocated page
> > > > + * @vma: the fault vma that we need allocate page for
> > > > + * @addr: the fault address. The allocated page is for this addres=
s
> > > > + * @dma_addr: used to output the dma address of the allocated page=
.
> > > > + * This dma address will be used for gpu to access this page. GPU
> > > > + * access host page through a dma mapped address.
> > > > + * @pfn: used to output the pfn of the allocated page.
> > > > + *
> > > > + * This function allocate one host page for the specified vma. It
> > > > + * also does some prepare work for GPU to access this page, such
> > > > + * as map this page to iommu (by calling dma_map_page).
> > > > + *
> > > > + * When this function returns, the page is locked.
> > > > + *
> > > > + * Return struct page pointer when success
> > > > + * NULL otherwise
> > > > + */
> > > > +static struct page *alloc_host_page(struct device *dev,
> > > > +							 struct
> vm_area_struct
> > > *vma,
> > > > +							 unsigned long addr,
> > > > +							 dma_addr_t
> > > *dma_addr,
> > > > +							 unsigned long *pfn)
> > >
> > > Weird alignment, also I don't think we are want to allocate a page at
> > > time...
> > >
> > > Beyond that, can't say I'm a fan of 2 arguments being return and
> > > populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
> > > haven't seen a lot that style function in Linux.
> > >
> > > Probably makes more sense to have a function which allocates pages,
> > > locks them, and populates the pfn array (migrate_pfn) rather than doi=
ng
> > > this a page at a time.
> > >
> > > > +{
> > > > +	struct page *page;
> > > > +
> > > > +	page =3D alloc_page_vma(GFP_HIGHUSER, vma, addr);
> > > > +	if (unlikely(!page))
> > > > +		return NULL;
> > > > +
> > > > +	/**Lock page per hmm requirement, see hmm.rst*/
> > > > +	lock_page(page);
> > > > +	*dma_addr =3D dma_map_page(dev, page, 0, PAGE_SIZE,
> > > DMA_FROM_DEVICE);
> > >
> > > The device is writing to these pages so I think DMA_BIDIRECTIONAL is
> > > needed, right? As mentioned above I think this should be broken out i=
nto
> > > a different step too.
> > >
> > > > +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> > > > +		unlock_page(page);
> > > > +		__free_page(page);
> > > > +		return NULL;
> > > > +	}
> > > > +
> > > > +	*pfn =3D migrate_pfn(page_to_pfn(page));
> > > > +	return page;
> > > > +}
> > > > +
> > > > +static void free_host_page(struct page *page)
> > > > +{
> > > > +	unlock_page(page);
> > > > +	put_page(page);
> > > > +}
> > > > +
> > > > +/**
> > > > + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> > > > + *
> > > > + * @vma: The vma that the page is mapped to
> > > > + * @addr: The virtual address that the page is mapped to
> > > > + * @src_pfn: src page's page frame number
> > > > + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> > > > + *
> > > > + * Allocate one page in system ram and copy memory from device
> memory
> > > > + * to system ram.
> > > > + *
> > > > + * Return: 0 if this page is already in sram (no need to migrate)
> > > > + * 1: successfully migrated this page from vram to sram.
> > > > + * error code otherwise
> > > > + */
> > > > +static int migrate_page_vram_to_ram(struct vm_area_struct *vma,
> > > unsigned long addr,
> > > > +						unsigned long src_pfn,
> > > unsigned long *dst_pfn)
> > > > +{
> > >
> > > We definitely don't want to copy 1 page at time. I touch on this in [=
1].
> > > Basically this going to perform poorly unless we use larger copies, t=
he
> > > migrate code supports non-contigous sram addresses, and vram
> addresses
> > > will likely be contigous due to the buddy allocator.
> > >
> > > [1]
> https://patchwork.freedesktop.org/patch/588548/?series=3D132229&rev=3D1
> > >
> > > > +	struct xe_mem_region *mr;
> > > > +	struct xe_tile *tile;
> > > > +	struct xe_device *xe;
> > > > +	struct device *dev;
> > > > +	dma_addr_t dma_addr =3D 0;
> > > > +	struct dma_fence *fence;
> > > > +	struct page *host_page;
> > > > +	struct page *src_page;
> > > > +	u64 src_dpa;
> > > > +
> > > > +	src_page =3D migrate_pfn_to_page(src_pfn);
> > > > +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
> > >
> > > I'm going to say this is a bug if !src_page ||
> > > !is_zone_device_page(src_page) || !(src_pfn &
> MIGRATE_PFN_MIGRATE) and
> > > we return -EFAULT (or another error code if that makes more sense). W=
e
> > > are migrating from the device where we know we have backing store
> from
> > > the original fault.
> > >
> > > > +		return 0;
> > > > +
> > > > +	mr =3D xe_page_to_mem_region(src_page);
> > > > +	tile =3D xe_mem_region_to_tile(mr);
> > > > +	xe =3D tile_to_xe(tile);
> > > > +	dev =3D xe->drm.dev;
> > > > +
> > > > +	src_dpa =3D xe_mem_region_pfn_to_dpa(mr, src_pfn);
> > > > +	host_page =3D alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn)=
;
> > > > +	if (!host_page)
> > > > +		return -ENOMEM;
> > > > +
> > > > +	fence =3D xe_migrate_pa(tile->migrate, src_dpa, true,
> > > > +						dma_addr, false, PAGE_SIZE);
> > > > +	if (IS_ERR(fence)) {
> > > > +		dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> > > DMA_FROM_DEVICE);
> > > > +		free_host_page(host_page);
> > > > +		return PTR_ERR(fence);
> > > > +	}
> > > > +
> > > > +	dma_fence_wait(fence, false);
> > >
> > > Even if we did want to migrate a page at a time, we only need to wait=
 on
> > > the last fence due to the ordered nature of exec queues.
> > >
> > > > +	dma_fence_put(fence);
> > > > +	dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> DMA_FROM_DEVICE);
> > >
> > > With above, will likely unmap all dma pages in a single function once
> > > the last fence is signaled.
> > >
> > > > +	return 1;
> > > > +}
> > > > +
> > > > +/**
> > > > + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU
> page
> > > fault
> > > > + *
> > > > + * @vmf: cpu vm fault structure, contains fault information such a=
s
> vma etc.
> > > > + *
> > > > + * Note, this is in CPU's vm fault handler, caller holds the mmap =
read
> lock.
> > > > + *
> > > > + * This function migrate one gpu vma which contains the fault addr=
ess
> to
> > > sram.
> > > > + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i=
.e.,
> > > create one
> > > > + * gpu vma for one cpu vma initially and try not to split it). So =
this
> scheme
> > > end
> > > > + * up migrate at the vma granularity. This might not be the best
> performant
> > > scheme
> > > > + *
> > > > + * This can be tunned with a migration granularity for  performanc=
e,
> for
> > > example,
> > > > + * migration 2M for each CPU page fault, or let user specify how m=
uch
> to
> > > migrate.
> > > > + * This is more complex due to vma splitting.
> > > > + *
> > > > + * This function should also update GPU page table, so the fault v=
irtual
> > > address
> > > > + * points to the same sram location from GPU side. This is TBD.
> > > > + *
> > > > + * Return:
> > > > + * 0 on success
> > > > + * VM_FAULT_SIGBUS: failed to migrate page to system memory,
> > > application
> > > > + * will be signaled a SIGBUG
> > > > + */
> > > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> > > > +{
> > > > +	struct xe_mem_region *mr =3D xe_page_to_mem_region(vmf->page);
> > > > +	struct xe_tile *tile =3D xe_mem_region_to_tile(mr);
> > > > +	struct xe_device *xe =3D tile_to_xe(tile);
> > > > +	struct vm_area_struct *vma =3D vmf->vma;
> > > > +	struct mm_struct *mm =3D vma->vm_mm;
> > > > +	struct xe_svm *svm =3D xe_lookup_svm_by_mm(mm);
> > >
> > > I don't think this is needed... More below.
> > >
> > > > +	unsigned long addr =3D vma->vm_start;
> > > > +	u64 npages =3D vma_pages(vma);
> > > > +	struct xe_vma *xe_vma;
> > > > +	vm_fault_t ret =3D 0;
> > > > +	struct xe_vm *vm;
> > > > +	void *buf;
> > > > +	int i;
> > > > +
> > > > +	struct migrate_vma migrate_vma =3D {
> > > > +		.vma		=3D vmf->vma,
> > > > +		.start		=3D vma->vm_start,
> > > > +		.end		=3D vma->vm_end,
> > >
> > > So I know in my PoC I had the fault user pointer (xe_vma) =3D=3D stru=
ct
> > > vm_area_struct of the GPU fault. That is definitely wrong. We likely
> > > want to allocate sub-range of vm_area_struct for the xe_vma, we can c=
all
> > > this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, an=
d
> > > finally 4k in sizes trying the largest first... The chunk sizes are
> > > trivial as we likely can just have table with values, the key here is
> > > the vm_area_struct vm_start / vm_end are not what we want to use
> here
> > > rather xe_vma_start(vma) and xe_vma_end(vma). I think we get the
> xe_vma
>=20
> After I typed this, realized I made a mistake here...
>=20
> s/xe_vma_start/xe_vma_userptr/
> s/xe_vma_end/xe_vma_userptr + xe_vma_size/
>=20
> But you get the idea - the zone_device_data points Xe specific chunk
> data (currently xe_vma, could be xe_pt_state our something later if we
> switch to 1:N).
>=20
> Check AMD's + Nvidia's drivers and they both use this field in a similar
> way.

I got your idea. But as explained in a reply earlier, I am not convinced it=
 is a good idea of using zdd to point to xe-vma.

>=20
> > > from the faulting page vmf->page->zone_device_data field unless you
> have
> > > another use that field...
> >
> > You are right. Such work is planned in the memory attributes part that
> Himal is working on. We have a migration_granularity attribute which allo=
w
> user to set the chunk size.
> >
>=20
> That makes sense. The chunk size is always just hint though, right?

We will have a default chunk size of 2M, which can be overwritten by hint


>=20
> > >
> > > I also comment on my patch with my suggestion implement chunk sizes
> too.
> > >
> > > > +		.pgmap_owner	=3D xe,
> > >
> > > Again helper for this.
> > >
> > > > +		.flags		=3D MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > > +		.fault_page =3D vmf->page,
> > > > +	};
> > > > +
> > > > +	buf =3D kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL)=
;
> > > > +	migrate_vma.src =3D buf;
> > > > +	migrate_vma.dst =3D buf + npages;
> > > > +	if (migrate_vma_setup(&migrate_vma) < 0) {
> > > > +		ret =3D VM_FAULT_SIGBUS;
> > > > +		goto free_buf;
> > > > +	}
> > > > +
> > > > +	if (!migrate_vma.cpages)
> > >
> > > This is an error, need to set a return value.
> > >
> > > > +		goto free_buf;
> > > > +
> > >
> > > We probably should check migrate.cpages !=3D npages too as I also thi=
nk
> > > this is an error.
> > >
> > > > +	for (i =3D 0; i < npages; i++) {
> > > > +		ret =3D migrate_page_vram_to_ram(vma, addr,
> > > migrate_vma.src[i],
> > > > +							migrate_vma.dst + i);
> > > > +		if (ret < 0) {
> > > > +			ret =3D VM_FAULT_SIGBUS;
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		/** Migration has been successful, free source page */
> > > > +		if (ret =3D=3D 1) {
> > > > +			struct page *src_page =3D
> > > migrate_pfn_to_page(migrate_vma.src[i]);
> > > > +
> > > > +			xe_devm_page_free(src_page);
> > > > +		}
> > > > +
> > > > +		addr +=3D PAGE_SIZE;
> > > > +	}
> > >
> > > I touch on this above, this should be reworked to roughly:
> > >
> > > - alloc pages and populate migrate_vma.dst
> > > - dma map sram pages
> > > - migrate a chunk of contigous vram addresses at a time
> > > - wait on last dma fence from migrate
> > > - unmap dma pages
> > > - unlock and free all pages
> > >
> > > > +
> > > > +	xe_svm_for_each_vm(svm, vm) {
> > > > +		xe_assert(xe, vm->mm =3D=3D mm);
> > > > +		xe_vma =3D xe_vm_lookup_vma(vm, vmf->address);
> > > > +		if (xe_vma)
> > > > +			xe_vm_invalidate_vma(xe_vma);
> > > > +	}
> > >
> > > I've touched on why this isn't needed... I think one of these
> > > migrate_vma_* functions will trigger all MMU notifiers registered for
> > > the range. The notifier owns the invalidate then.
> >
> > Very good point. Yes after read migrate_vma_setup function, I agree thi=
s
> function will call mmu notifiers with MMU_NOTIFY_MIGRATE event. Today
> we invalidate vma with this event. So yes, above codes are not needed.
> >
> > I do identified one potential improvement: when mmu notifier is called
> back with MMU_NOTIFY_MIGRATE event, if the migrate_vma_setup is
> called from the gpu page fault path, we can ignore the gpu vma invalidati=
on
> as we will update gpu page table later after migration anyway. I think an=
 page
> table invalidation is not needed in such case. But this should be just a =
minor
> improvement.
> >
>=20
> We skip invalidations if the initial_bind flag is clear which should
> cover at the initial GPU fault. There is certainly room for improvement
> / optimizations in the MMU notifier though, it is kinda messy right now
> too. IMO work like this can be done once the basic design is working +
> tests in place to verify changes / optimizations.

Agreed.

>=20
> >
> > >
> > > Beyond this, maybe I'm confused about a few things and how this fits =
all
> > > together. Doesn't every user process have its own unique mm, fd, and
> vm
> > > (e.g. own address space)? If a user want a shared address space then =
use
> > > threads with a single mm, fd, and vm.
> >
> > Yes, this is also my understanding. Each user process has its own mm st=
ruct
> and device fds.
> >
> > In a shared address space case, such as there are multiple pthread crea=
ted
> through pthread_create in one process, all those pthreads should have
> different kernel task_struct, but all those task_struct (say we get it fr=
om
> "current" macro) should share one same mm struct, which means they all
> lives inside one cpu address space.
> >
> > Now with this work, we are now basically extending this shared cpu
> address space to gpu program. So both cpu program and gpu program can
> share one address space.
> >
> > Since we allow user to create multiple gpu vm for one device (lets focu=
s on
> one device for now), so each shared address space can have multiple gpu
> vm... each gpuvm should be able to register its own mmu notifier to core =
mm,
> even if those notifier has the same address range. But I will have to tes=
t this
> out. If all this works, above codes are not needed. If different gpuvm ca=
n't
> register mmu notifier for same address range, then we would need a fix...=
.
> >
>=20
> The mmu notifier code is implemented with the interval tree which
> supports overlapping rangers (i.e. we can have multiple VM's register
> notifiers with the sam address range in a single MM).

Cool. I understand it now.


>=20
> >
> > >
> > > So even if we had to resolve the xe_vma's here and do an invalidate h=
ere
> > > very confused what this is doing. This is this the case with multiple
> > > devices and each VM points to a different device?
> >
> > Right now I only focus on single device. See above. This is to solve on=
e gpu
> device but multiple gpu vm case. But as said above, for now I don't think=
 this
> is needed. I need to test more on the mmu notifier behavior: whether it
> allow us to insert two notifiers for the same range for one mm....
> >
>=20
> Agree that our focus should be on single device now. If that design it
> well thought out I don't think extending this to multiple devices will
> be a huge change either.

Agreed.

Regards,
Oak

>=20
> Matt
>=20
> > Oak
> >
> > Again so that case I
> > > don't think a xe_svm structure would be needed, on GPU fault we shoul=
d
> > > be to detect from the faulting page zone_device_data and pgmap owner
> > > if the fault already has a physical backing on another GPU and resolv=
e
> > > how to map it into GPU with a fault... Jason suggests this in the
> > > following thread [2] and I think I agree with him.
> > >
> > > [2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-
> > > 240632fd3e35@amd.com/T/
> > >
> > > > +	migrate_vma_pages(&migrate_vma);
> > >
> > > This logic is going to change but ...
> > >
> > > On an error I think we only want to call migrate_vma_finalize to reve=
rt
> > > pages back to the original state (i.e. migrate_vma_pages commits the
> > > page changes which we don't want to do on an error).
> > >
> > > > +	migrate_vma_finalize(&migrate_vma);
> > > > +free_buf:
> > > > +	kvfree(buf);
> > > > +	return 0;
> > >
> > > I don't think 0 should blindly be return here, if there is an error
> > > return VM_FAULT_SIGBUS. We likely want a high level error message too=
.
> > >
> > > Matt
> > >
> > > > +}
> > > > --
> > > > 2.26.3
> > > >
