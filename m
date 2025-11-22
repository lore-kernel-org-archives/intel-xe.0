Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342DFCFC516
	for <intel-xe@archiver.kernel.org>; Sat, 22 Nov 2025 01:56:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38CE10E043;
	Sat, 22 Nov 2025 01:56:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="arW48bVB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3C410E043
 for <intel-xe@lists.freedesktop.org>; Sat, 22 Nov 2025 01:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763776596; x=1795312596;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=L59bgWW/mDDlM9V0slOMRJH4VVKQAbWjK9CHTJlQxek=;
 b=arW48bVBk61QFWdDw2En7NUcewkaBmK9FCwxvJZ4SUuNv0DUlVDrUKi1
 roIx8icKv2orkNbv96rqeKWf3ROi7tHQO7Iy5o5hqD41MdNQ45OEza+a6
 ADim8ymV35h0zTvVcrgD9KJ14HnsJrYJ7pL/poGXxUD+Adq+cRuqhl8Nk
 tgwUizBcFcCgtzU2tdeDNb1baK6KpYHwPK3nUcjrdV2pxbf2AzkPw29tZ
 tsGXXhhSH4N+4NNQ8XuNHmMXmjxtCxkYWyloqDPsVYjwqSXI3LNgznQdy
 r6tJv9kdBzF01K3ca7t4GPi+xz+volnpmEeY/uil1VHgSmOzXrXYUCdRn A==;
X-CSE-ConnectionGUID: yrS8AqBfQO2NiwnnrbVgEw==
X-CSE-MsgGUID: ziSg0/HMSh6e1vRrSnDQmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="69731195"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="69731195"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:56:36 -0800
X-CSE-ConnectionGUID: goPtsBHwRLGCBZqwH+CNKA==
X-CSE-MsgGUID: NC1WkkS4SrSxq4CshvSuqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; d="scan'208";a="191718315"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2025 17:56:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:56:34 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 21 Nov 2025 17:56:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.17) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 21 Nov 2025 17:56:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RN+MRkWYuRCVFScts5///pPiWrLz93ScRM7oCQx4neUCimHn03YqaQpZpr3bb6sUNX8p5Itzz+KVEUhddeJScKEJqja49J2lClwwGrsYJlbpg8JvaR9SwaIAKuJGypoK72svm4KzLguCKuFHx5QW0AwoID+M3ChKXZU1NEcPSKfF5417CA41QEr4IcOdNsn4VTYDv94ovhEkQ+zRBfPOEE5pNC8AI6pNGgAzc92q99OCgklpcAPqVr/9Vdta38/fPxkrAxkx83ZDqTQQ5LR+dqh/Qrnuu5omUQyftYGZlTwx+qTPbXVtTrFwh8R8+Pw6MhPWW5otmo7MTKAwv198VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvlxcNKcbFD363HzH9EqBPC8mYyt0NiQplTWxtKajqg=;
 b=XpWuXBfz9XFhTiDo/7xmH3Gzjc5qSDycF7NjJiIMah8Mz0nt5bcnY5Pu6IlYVkyTyxATNoGVqryUnjrgGQ2UjTOZzo4Np9LgWmXVxM5Ocq4aVR44DPeVP7AZuKGQdgC3KHH3747A0wMiE1fmDciWSadFa7G7S55qrqmv59ZnucqEoGFsmGsAVDdciZanpZF5WKA71D/CK0UAdsa+72jGe3NisQQJWnAcEiHkxZ7iw2YxqN36z3pZsM7WXnEBznbgCdoWMzQF/Z/IU1ScoV9+A8SiN0o17sUeWioqax2/KSR53LF8d4UUA+eJdzmTjoblBJe199ED1yjgbydXHAU9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by DS0PR11MB7788.namprd11.prod.outlook.com (2603:10b6:8:f5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Sat, 22 Nov
 2025 01:56:28 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9343.011; Sat, 22 Nov 2025
 01:56:27 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Topic: [PATCH 05/11] drm/xe/guc: Add page reclamation interface to GuC
Thread-Index: AQHcWGqWpTzm3Skg70Kp92AqSOQDsbT9ea6AgABOGRA=
Date: Sat, 22 Nov 2025 01:56:27 +0000
Message-ID: <SA1PR11MB8839340F6CB3C3E374DAAF07AAD2A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251118090552.246243-1-brian3.nguyen@intel.com>
 <20251118090552.246243-6-brian3.nguyen@intel.com>
 <DM4PR11MB5456D83789C73B756FF7F570EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
In-Reply-To: <DM4PR11MB5456D83789C73B756FF7F570EAD5A@DM4PR11MB5456.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|DS0PR11MB7788:EE_
x-ms-office365-filtering-correlation-id: 68582fd7-9f99-4aba-17ff-08de296a596a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?qmY0SvXoVgdFYU66gZTj6uJo9HEV8IDh+NNzi9CDYHpt7H/7Wkq03fxiF42M?=
 =?us-ascii?Q?oU+AqXc0Ze4bgFy8ynxlhFbx/YAuTvhhiNu4ymZttDb0QWbgvdrOFOodo49q?=
 =?us-ascii?Q?LeQM4w9LeTwDDXt2vWhQAQisECBtCtJ+E9kEpJY/NTBpBD7CWXiv4tKY6De8?=
 =?us-ascii?Q?2TWxtZ7vGK8WDnjQdhRUmm75QhM/rDRhBbXjXksShekr8QsT2Al7RR849oZW?=
 =?us-ascii?Q?ijWpukvtpNeXXRsxrtOwG/wrPkEPPR5Alk5lKyuIzeHk49bA1s5VuZ2xiTGl?=
 =?us-ascii?Q?MxEBV8yZ9//CIuS7G/rboZh7Kom7rfp0/K61eYxynSyXpkgb3CJ/C1YqZ43m?=
 =?us-ascii?Q?dg5kvb8hUkCznAYu9yAW9kQqpE7mycjkpqwr68IZ9nT5+kK3RA/q5ne2DFnM?=
 =?us-ascii?Q?ggXKpb9MbEVyAKmWsTM93rLMgjCcrtTfEvOauu5xTxgWnHpM2Td8UkUrDDIk?=
 =?us-ascii?Q?KNX75p2ordiLJvvU4kTeeEDu9idAAM01w7Rs6N9s2geBEQP9ENTbnQN0sZZm?=
 =?us-ascii?Q?a82OSaHL5nJkitlZokNiKtwDKJez4xqPHZHeTeQmnKDGFqT89Iy++vuon2dA?=
 =?us-ascii?Q?tRGdOwe4PcADS4m6Yxo/uvY5f8/So6emOsjWbRsvNl2tm4BMrcwHgob4w6tQ?=
 =?us-ascii?Q?OpTOpsMFHKORn74zdFoxOdXpXbpXyTIOzwqXDmFVvSpfFTxL0GiFwNgvz8FU?=
 =?us-ascii?Q?VWOJd/LlNDs1dR/iG9mSyXDHBA3vhROoA6RlvvHbQUUwyajAMzRff01mUrhh?=
 =?us-ascii?Q?WWWfl+MXYCukF5UabGY0fC7NYERHEr2dWRBAIevUv54R2gJ739pGUsRjQTol?=
 =?us-ascii?Q?oua2su6tFggp6aHQc8bSQTncN/xNcX/DSmE/80cQ//NVNzh0SDQ3MZ5LFNV0?=
 =?us-ascii?Q?kF3WhnKL6d335wePV8pLcPrB/MeGleuN5JXr4v8oAILcip8WPp7pH2rgXVLQ?=
 =?us-ascii?Q?f0fap3azsQXC9nFUIEFFi8kzsHTppjzNAplfnd+djp2b+AEltZRTYT/jAfm5?=
 =?us-ascii?Q?6+WTixfYaXblJWOkWp3kGGNcTqHN7Bb5d5IP0l+DLuL12sY5vtWeiLPtv7lB?=
 =?us-ascii?Q?gNYGE+hy93u72jSCw7sgOnjbFenGacR8gL/xpmWKLr0R7qn4W/NWXoneBOCA?=
 =?us-ascii?Q?B7CLNPh1N2gt5HlUcGzc3bZUNbHVI/v9BiDaj9BriM5M+xaOS4gkEDVT6Jx3?=
 =?us-ascii?Q?JpbowfmytWozWev81LWGyDoFfQ60fWb070oDnx0+o5fol+66ADKGLYIDqyO0?=
 =?us-ascii?Q?xrBzm8iyu3XbHQI4deJ1YThxlGWQUDos4xpfqAUHgBDcjcQRligs77eu1x2i?=
 =?us-ascii?Q?3WY2QbdKrhn/cA+IAK66FkD1739TNesuaaY7xZKW4uJ8QQucRftANb8Sk/ke?=
 =?us-ascii?Q?j2Mh6Bh/M0SVen1cuzRCVcRqkw4ENxSOh6xTUNhsn0KOLFz2lDun02yhDRxp?=
 =?us-ascii?Q?rULo056OUuy/O7kuhr4n352rSHsbK2RmxG0RPCDkgYBMI3IxabR3/5ruicOM?=
 =?us-ascii?Q?qrXJWWVdh5aI0Td/SADMKQhsgG2VareaGP9w?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2t5+eTAIwe5MpKJS6rV1wODGqtku7EIyvJ1CwsL+vzG0CiBUq6fmqInupd5R?=
 =?us-ascii?Q?oiLz/aF0/J3spjIhr6304j/pJ6zRWGYC9GO3Ooiq8bT0t7Rj/sgqAhnKWl/u?=
 =?us-ascii?Q?v4Epq8ZQ7pk3etXkLkaS+uQdEp/kzCsrc29OBzHDpPn+uZ0NRTOeEYsFJ9+t?=
 =?us-ascii?Q?m1/Mg+NYPYPSnlytkXzCz00PwnyJ/6OHGf9Fxju324UWqZ+sqigo2Vtosp7V?=
 =?us-ascii?Q?DIyaRmlCuVTAlO/XHk8I3uPIcmymW+vH9NE/Wgdgt3enNikGxXHex3Q0yl5t?=
 =?us-ascii?Q?5/mqYOvXdrFyWnwgrK0MHlR8zFQQbH6RILpv0U0Nvwfn13YAOCM6DjHzRBMI?=
 =?us-ascii?Q?EuV0behtMji7tnxc8NXZfeff+tAR0lI7NzoAoWKZTKdvfL4jy7dhNGNNWlmb?=
 =?us-ascii?Q?RcVP98NER1szdrycygHLG4MGjk7X8QF4TFBPImCIgGWnlSuHZnwogRJeNbbd?=
 =?us-ascii?Q?xNEdJRizEf9UrQwIzx+OwFl039MLl93n8WPMBadq/YSw9cAy14baaNXP7duA?=
 =?us-ascii?Q?/QCppMTEbg5OcSzLFI+BSp1pkJuH1EL33rHKHOc2k4Q3ZC/DIkzrS87xjTYW?=
 =?us-ascii?Q?xNfeRLvnrtb50DVOyl8EUMyT0bQDnKy1Mdii3z8nmJRhzBt0u+u98zkJvF3j?=
 =?us-ascii?Q?vFSwO4yuxBl1DK5WQQWK7R2UStr07lFBcc5DrnQWELuSLBYgOwRMxQARKPB1?=
 =?us-ascii?Q?8N6SoVwahS4UwJpwtJFvAfvp+HiUwxdQlv58nHkn6prT08BdVEeHDQJF/WGy?=
 =?us-ascii?Q?SvGGBxA0oqaRk9IaO7oTX1UPKP6Twflio1DMJsd2FdeD5HRzMZWVtTDgOrtW?=
 =?us-ascii?Q?MrLAEwTCYF0osoOwPpCIkxDy4DtaxmXEpz0ev7gtAKVLlsEGbXW6ULGeyKQz?=
 =?us-ascii?Q?oA+4lS3b5jwe8D4GZ7f+XaOZQan94/tlEMgZ1H9t9rtaiVVGeWMQPl0E7dXu?=
 =?us-ascii?Q?4XKsD3tzYfUsUFwN3KEcEjsZ38xAr6hnwiqQESDmfFOV+XCXwVe8oqtEYoRz?=
 =?us-ascii?Q?Jl+FGSNngxufbCbs5YCt+4hcIuUybgj8lyWiDAAu8RXZkOoBbL/5+p3xVZUI?=
 =?us-ascii?Q?wwA0xdAhGnAAy1AoYFm1/Z3hIPjzr9N2RpdpAOSCyEQ+eWP2g19+kouW0pT6?=
 =?us-ascii?Q?d2O9Z72ydnFE6E97Q5ayLQ+VPNKOu9ngF4BHe8uiCm6xu7yI3Qd2IigQ3ags?=
 =?us-ascii?Q?+lB8vWpI30WcIX2KhRpfqks2QYkVvCm4pz2hvCz6zfLpAMzv6wJM6/DBLpOm?=
 =?us-ascii?Q?NvWJlLAEsH7d59BxvOQAbKLzbJsx1yJ2cZrsG7PL4Leuulf8/6NQhjmKZxmH?=
 =?us-ascii?Q?UlPUhELIZB0RXF5ytWtVMtML9Xpzo5+a58dhwtQWBOpytd4PyBWwHFsoSVH+?=
 =?us-ascii?Q?8eacaRO0qsfNWpGZZk+Igce3fpxfdWCxIC3d4MdxKY/+TsJ1HE1eEdNWoeW5?=
 =?us-ascii?Q?P4HAjhFI8Wmiunj+LvGq4hSWfWTCNP9VW68ABLBvz8grNHgllZ+xSdxxizNq?=
 =?us-ascii?Q?WP7tUCf3T7Dk5ZWU1SLujdV4qFKAhvgB+UAWaT8dXN3FSaziHfs5uElT6OnD?=
 =?us-ascii?Q?Gv5xekNWa/35TZt+NhhHLTl8AcxFXr20A3BJzlh8?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68582fd7-9f99-4aba-17ff-08de296a596a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Nov 2025 01:56:27.6049 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NmcaLdGeTGOaOMeIWukLQ1J1gmt1xIop4LzgjetF2FaKt9AZ6crfNWxmYCramkcG1AZD9Gw+nmq2ucrLGgAaOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7788
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


On Friday, November 21, 2025 10:33 AM Lin, Shuicheng wrote:
> On Tue, Nov 18, 2025 1:06 AM Brian3 Nguyen wrote:
> > Add page reclamation related changes to GuC interface, handlers, and
> > senders to support page reclamation.
> >
> > Currently TLB invalidations will perform an entire PPC flush in order
> > to prevent stale memory access for noncoherent system memory. Page
> > reclamation is an extension of the typical TLB invalidation workflow,
> > allowing disabling of full PPC flush and enable selective PPC
> > flushing. Selective flushing will be decided by a list of pages whom's =
address
> is passed to GuC at time of action.
> >
> > Page reclamation interfaces require at least GuC FW ver 70.31.0.
>=20
> Should driver disable this feature if the running FW is < 70.31.0?

Default FW version is above this at time of patchset submission so
I had assumed it not to be a problem, since the danger is a user
forcibly using a bad FW which already has unpredictable results.

However, in hindsight, it is easy enough to skip if FW version is lower,
and we can safely fallback to default TLB invalidation, so I'll proceed
with adding a check within the later patches that'll disable
page reclamation within the xe_guc_tlb_inval.c unless there are
any objections.

> What will happen if driver send this action while GuC doesn't support it =
yet?
>=20
> Shuicheng
>=20

AFAIK, if action is sent before correct FW version, it'll report
out GUC_HXG_TYPE_RESPONSE_FAILURE in g2h
due to illegal operation, eventually triggering reset.

Brian

> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/abi/guc_actions_abi.h |  2 ++
> >  drivers/gpu/drm/xe/xe_guc_ct.c           |  4 ++++
> >  drivers/gpu/drm/xe/xe_guc_fwif.h         |  1 +
> >  drivers/gpu/drm/xe/xe_guc_tlb_inval.c    | 14 ++++++++++++++
> >  4 files changed, 21 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > index 47756e4674a1..11de3bdf69b5 100644
> > --- a/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > +++ b/drivers/gpu/drm/xe/abi/guc_actions_abi.h
> > @@ -151,6 +151,8 @@ enum xe_guc_action {
> >  	XE_GUC_ACTION_TLB_INVALIDATION =3D 0x7000,
> >  	XE_GUC_ACTION_TLB_INVALIDATION_DONE =3D 0x7001,
> >  	XE_GUC_ACTION_TLB_INVALIDATION_ALL =3D 0x7002,
> > +	XE_GUC_ACTION_PAGE_RECLAMATION =3D 0x7003,
> > +	XE_GUC_ACTION_PAGE_RECLAMATION_DONE =3D 0x7004,
> >  	XE_GUC_ACTION_STATE_CAPTURE_NOTIFICATION =3D 0x8002,
> >  	XE_GUC_ACTION_NOTIFY_FLUSH_LOG_BUFFER_TO_FILE =3D 0x8003,
> >  	XE_GUC_ACTION_NOTIFY_CRASH_DUMP_POSTED =3D 0x8004, diff --git
> > a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> > index
> > 2697d711adb2..e13704e61032 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -1311,6 +1311,7 @@ static int parse_g2h_event(struct xe_guc_ct *ct,
> > u32 *msg, u32 len)
> >  	case XE_GUC_ACTION_DEREGISTER_CONTEXT_DONE:
> >  	case XE_GUC_ACTION_SCHED_ENGINE_MODE_DONE:
> >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> >  		g2h_release_space(ct, len);
> >  	}
> >
> > @@ -1546,6 +1547,7 @@ static int process_g2h_msg(struct xe_guc_ct *ct,
> > u32 *msg, u32 len)
> >  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
> >  		break;
> >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> >  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> >  		break;
> >  	case XE_GUC_ACTION_GUC2PF_RELAY_FROM_VF:
> > @@ -1711,6 +1713,7 @@ static int g2h_read(struct xe_guc_ct *ct, u32
> > *msg, bool fast_path)
> >  		switch (action) {
> >  		case XE_GUC_ACTION_REPORT_PAGE_FAULT_REQ_DESC:
> >  		case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > +		case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> >  			break;	/* Process these in fast-path */
> >  		default:
> >  			return 0;
> > @@ -1747,6 +1750,7 @@ static void g2h_fast_path(struct xe_guc_ct *ct,
> > u32 *msg, u32 len)
> >  		ret =3D xe_guc_pagefault_handler(guc, payload, adj_len);
> >  		break;
> >  	case XE_GUC_ACTION_TLB_INVALIDATION_DONE:
> > +	case XE_GUC_ACTION_PAGE_RECLAMATION_DONE:
> >  		__g2h_release_space(ct, len);
> >  		ret =3D xe_guc_tlb_inval_done_handler(guc, payload, adj_len);
> >  		break;
> > diff --git a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > index c90dd266e9cf..34d74a71c4f0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_fwif.h
> > +++ b/drivers/gpu/drm/xe/xe_guc_fwif.h
> > @@ -16,6 +16,7 @@
> >  #define G2H_LEN_DW_DEREGISTER_CONTEXT		3
> >  #define G2H_LEN_DW_TLB_INVALIDATE		3
> >  #define G2H_LEN_DW_G2G_NOTIFY_MIN		3
> > +#define G2H_LEN_DW_PAGE_RECLAMATION		3
> >
> >  #define GUC_ID_MAX			65535
> >  #define GUC_ID_UNKNOWN			0xffffffff
> > diff --git a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > index c05709a5bc98..3185f8dc00c4 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_tlb_inval.c
> > @@ -95,6 +95,20 @@ static int send_tlb_inval_ggtt(struct xe_tlb_inval
> > *tlb_inval, u32 seqno)
> >  	return -ECANCELED;
> >  }
> >
> > +static int send_page_reclaim(struct xe_guc *guc, u32 seqno,
> > +			     u64 gpu_addr)
> > +{
> > +	u32 action[] =3D {
> > +		XE_GUC_ACTION_PAGE_RECLAMATION,
> > +		seqno,
> > +		lower_32_bits(gpu_addr),
> > +		upper_32_bits(gpu_addr),
> > +	};
> > +
> > +	return xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action),
> > +			      G2H_LEN_DW_PAGE_RECLAMATION, 1); }
> > +
> >  /*
> >   * Ensure that roundup_pow_of_two(length) doesn't overflow.
> >   * Note that roundup_pow_of_two() operates on unsigned long,
> > --
> > 2.51.2

