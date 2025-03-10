Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAFDC282EC
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 05:07:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3621D10E0DB;
	Mon, 10 Mar 2025 05:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HgKMg5Td";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBC810E0DB
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Mar 2025 05:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741583232; x=1773119232;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0dnZ9SGReJv9fbeBg56AaFoG0hOlVaJzII319A3pCWQ=;
 b=HgKMg5TdhNvNj5HNemOX61syGOR3AvSuNScO2ySeEq1fAVdZ22PwPx5w
 0t8Y+sdZecwmmcFju0+zX4b0cG0vk9bXBsUz5Y/xvLIzlsMVBde7b/9ut
 1cIa+MHVNqXgIlXoIASZzDr1J0UV12F6csj64m2J1M+B+Ww84f4Rv6VY+
 O+JB5hDhcTEB/S4iYDJ+vJ/HqLbjbuT25E5ItKm8oMrfvWX0RuUrFDFrg
 H10nh4U9NCyx4vooKzNnuqNYex0zTD2mJDjzCiEkOTgTGFAu+ubNcKATp
 gvELAO8xxHBt/LZtCFGb5QFYeQ35OgszTbBQkf9+72Yns5IFMN5HaudCs Q==;
X-CSE-ConnectionGUID: Bw+FxZv6SvWv81tij53CMg==
X-CSE-MsgGUID: RAjwMv/STTiB/OFZJoI0tg==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42411019"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="42411019"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:07:12 -0700
X-CSE-ConnectionGUID: y1jyv+kcRN2Q8zvDjpoUIA==
X-CSE-MsgGUID: cdXsJRQaRpiUTHt1kUrwMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600"; d="scan'208";a="119878703"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2025 22:07:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1544.14; Sun, 9 Mar 2025 22:07:11 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Sun, 9 Mar 2025 22:07:11 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.177)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 9 Mar 2025 22:07:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EC3gXEaqxM9yW9IJbDF9cJkvVXpCHH5dUxJkQvmtBeguzA+9TCPojx17Bo/TrZnwMhweCrO87bI06bgwZoc+l8bpo15yt/6Gf+YjAicDKZaqk5bRi1iE8Y2Cr7p+WZFofBGzKtFQk+4pV23vdMqzI1E2QEE6eQOO7IRUOJqbhaU38GM0j4HmK8/I8vrEeSw6Az8RIQtg/X2fHKI/uwEEiRsO5Mr/vtPWwUk7LEpiMN05Kmj8HYURndxXdAZJYfUQxGFVow4YTuy08xlUhIqEOAb1uZLX0g3hJPZrBZG0VA055tut+uNcVk8S2znrSb2FxZZOzpvlXDV2xur0pAbyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KYqB2vHKfRjE8b17SMPzy6Tno8hQEvi3Uofo9WfPMaw=;
 b=oz7/tq39LZc0ebHhpYEiiT3+a0iO+ew5tDMiprar6x6AsjBhL0tbRSBSDfCyP+ETF3K9MMNjAl9kHe3kizFdAduipHftlXYIa/hNYYPRa9jGMA5BCO7U/wodGnio/GYtKB7wJGkAdw5QeiKSaKQpO/u0XEoTItOxqJ4/2PO8PKbEBYntSMkAMB6bNN7vFOgBxaC/bRFUl5Iw8RjTmwvFPQqFReoUSunVOLxrZHYqKNVds1FBlroW1YGXmvJlINIiTWsp0mB2SyVOSrnSWg+4CYHIoSkmceRwY5m/dzIvkzyaVbi212qIM4nkuBvyYPCGgA4YBchqry5kHt5Blrgkng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by CY8PR11MB7081.namprd11.prod.outlook.com (2603:10b6:930:53::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 05:07:09 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%4]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 05:07:09 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Topic: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
Thread-Index: AQHbjuRQ8HFSiJp+RkOSXEnRVu5xI7Nnl1OwgABJR4CAA/YMMA==
Date: Mon, 10 Mar 2025 05:07:09 +0000
Message-ID: <SJ1PR11MB62045A9572C231E0D45A722D81D62@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250306-drop-gen-v1-0-03683e56006a@intel.com>
 <20250306-drop-gen-v1-2-03683e56006a@intel.com>
 <SJ1PR11MB62041E43EAF79D2F89F0F40081D52@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <a3katq6p43gfiuoibpmoxpl6syocu3itqrzoyjezyyr73fydtb@2yqiydazcwea>
In-Reply-To: <a3katq6p43gfiuoibpmoxpl6syocu3itqrzoyjezyyr73fydtb@2yqiydazcwea>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|CY8PR11MB7081:EE_
x-ms-office365-filtering-correlation-id: c5372415-3c36-43af-91fc-08dd5f9168ec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?nQa8UEVmknQKNGDdN4ERyQnJ6zG7u1ix9UyGpsgt9prHoRzVeZDHWE7CrFVU?=
 =?us-ascii?Q?YybkaocsyH2v13lRJ5XArnLhSKKP3cNMU+lip+U6TeSichv8uW0G+LoDNvBV?=
 =?us-ascii?Q?USGRVN2Bd2U+//ceVAT+xNfRnQ4B7Hx4mtJUFrEZn9kn3i74Rf+CG9sqO0SU?=
 =?us-ascii?Q?srUUhhb6GmQoaoIbTfXQGpwDuP8LWUEIVFBlLCuHCMde8wNy6TbpT2aVX+Tc?=
 =?us-ascii?Q?IYOEmQ0wkFRm6CBL5R580rrVezFHQXgvGL3M4oAVVrajf5iFNhHaCQ4NOtiI?=
 =?us-ascii?Q?+2rw77fLJBFhcZgIv0wpKahz/5ov1grR9rr5C8jsMB2FZUbZDudQ3X64VQ/U?=
 =?us-ascii?Q?qzOG9vphIHQRuN4OrCU6fCn44PW28tzCTqhhQs1skFBtBuK5AG2zQufDTeTF?=
 =?us-ascii?Q?LgCI6OnI0gBH7fgHHyIEZsPEe6ZC+/JJpcbvhbObcLx0KjYszXAsamcjZ/QA?=
 =?us-ascii?Q?ifq+7nxG1eA6ZkfjPa0QnaphJztm0nLe2mWXuZ4qF0+8IgMm0HjopEUGTkHM?=
 =?us-ascii?Q?NyPdtOyZSYhXIoyjD7yqY25Mrwo8eEq3VVgV1jDoRquO1FQPn3CE/gjfV76r?=
 =?us-ascii?Q?JvmLvQnAXx9bXFw5i3t0WcO+3FkVU8Stxdt0MzUZ3qUiBPDLvc2VuduwBZ/n?=
 =?us-ascii?Q?P98XQMJwhqOHYc32kb/eRsfBtvN9NLy92qHy5oGfCFEP5XEvTtJXUdn2gD2f?=
 =?us-ascii?Q?Bc8zQahzQyQSYsEyPZcev+TJ/7ovDDvhOwK8VRV8x3w9IA6dtugE55ZvYAnF?=
 =?us-ascii?Q?jzpfYdIYpLZMsqNQszBdv69M1c9cW8zQQovx50SpMBs5gpUD1qpofaI8SemZ?=
 =?us-ascii?Q?kAaY/WGGZnE4IMHhlW3Hl0XjbaW12si1cOt9bb/yWfcMjngmXekfjFmSo9b5?=
 =?us-ascii?Q?KK68t5KvfTJ/lsxLZcXVV0qhcGClw/wJGfJzhS30nMUqdPCf5/gFLKgNAegf?=
 =?us-ascii?Q?RHoOHUGdNtBjVfPfIiQ37XKX1JV9dm8tmjtmNVR8XellbniTDx0GnwKmiTi+?=
 =?us-ascii?Q?cOhh3/E+Sayj5W59jGvw7jSsI7sHpF6EMcvIfHjCTKYjQTlcpOVTMCHEglGE?=
 =?us-ascii?Q?MtzV1+Q0keYguog4AiYFlOw3lfh/VIOe5tl9RUV9mcrm+OaryQz0seFG4PJ4?=
 =?us-ascii?Q?0xsaqTh5bVb0yE/V71ziwu+55bZaQsDQa3wLPtt/hO4U25XM8mKbi3OEdTls?=
 =?us-ascii?Q?ECb964iIbYH1nHiY9ltRKZf1HGXuNMmanyYjACDBVXCT59r5tHhoByujraOK?=
 =?us-ascii?Q?d1LENSBiXtIGuEbwDboCJvhogKIAdQfXr0UR3nBs5eQN9I42JCCe0E2RhESD?=
 =?us-ascii?Q?hJb5tjIngxBrBAtDIYhtyf7V6omGmYERR45ePQsMTsEPnrOTpLfkelyPsM8g?=
 =?us-ascii?Q?qWQZjY1sfD4ffOiDZKJ0bys1iOQW7ZEVhCM4VoyNesdFjbQU1hvvxIfnyYh3?=
 =?us-ascii?Q?BHe/931Xegv4rl+UYgklk0zaDudEcHz7?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?ib/QHpA4AVvZ5fQtYsmqh25+Sf6UoT/BXi8O20+w/IsRvJpwYsytzaZhM9nt?=
 =?us-ascii?Q?du2MtP8Xl+aLMbnhF42rXGYWDAk8Yls4vlql6mB3MV+m/Ge+8NtQjk53v+bA?=
 =?us-ascii?Q?m4KYIZWzGUbaUzt/xh9HIVkeMt3/au83wgiI7onlWq4boSBP5Bqe5pWxjanp?=
 =?us-ascii?Q?Ib0r5X5XexLprJlEhgjeIPtxyGWiiCtzDOzaglcbQmXcuzm8/3ByrR1uOL8B?=
 =?us-ascii?Q?CMrCMD5KC8JNFccIpYE9xvcDxm88IjD0sFq3EOMDIiHvUsFdb4UH4R042Nsh?=
 =?us-ascii?Q?/KDJ9UYIoBehKb2HzkqtRtlKeCQHFjUsW5rpyhuhIk6Dp5TJKWy7VaZH9ZC7?=
 =?us-ascii?Q?O6GjKaSoNukUGmnCglyd9+T3uymQLHAbGqzrlL1l2B9hOAe7zIuJShEdhzke?=
 =?us-ascii?Q?GmUrLaYnfl0AUmKcKnBZauC/JfSFBsa5cPf64N5fsP2q36pYe0geOrCSFZOl?=
 =?us-ascii?Q?kt/Ypzlxv3CFmpgIbM8lBJnZj+qqxgSjVIp64LF9LF2CrFbMQ/CU+1XHRNN8?=
 =?us-ascii?Q?d9Vdp1CI0nWqYEY+zC1k3NlkQWWBVjUVZ7wvNLAH01upWC6KfcZErMgnqVpa?=
 =?us-ascii?Q?/dqCMwF0d+JDTr83JRLzMwtz6iLB2SibPFzy8thOULghmPfu1f5wGR+DsJaS?=
 =?us-ascii?Q?zMp6ooVrXH0wzdKS/7ht7Z36PZlqMb83G/3RSVf9ReORVt4cT5/9Q7TM2UXg?=
 =?us-ascii?Q?P8l3Uu1dcOaj8barTW6fREYMwnWCgJiG9HVxvHVcElOvNBaVFbMS4K35y30b?=
 =?us-ascii?Q?IRv+3bkOnARGlUta4dBRLrEwKMn4z4ToNPwANXxrZYwjiFB5yuDpJ4GubnXK?=
 =?us-ascii?Q?nCKjdMtffnZ8HH/wUBL6LDtNHgJR/9CJ1K56eFrcXHg/1KeXjfm+Wgi6fvDf?=
 =?us-ascii?Q?DtwQ4Gm2YyuFOvIIEYFszB9cpgLF9LpDYAH0ZBNvBV5oPKSjoeWKFZPYoZH1?=
 =?us-ascii?Q?Kn+p+DB4echW0ZKq6jcL5mVw1HTfljamA95Ol3Fy0bHkYG5Erlw+gvDLmxwF?=
 =?us-ascii?Q?eedSDSsjf4xGhQ7m6HJhT5p4Kdd3HtnIitynbECnIMx+OF2xrHnnm8Jq3su1?=
 =?us-ascii?Q?Ys130npeXxBitH1/HL2Mx9o6ODGVWgwDvlP7drI2nXIHAsQRk1QEFCpCDEsA?=
 =?us-ascii?Q?DGbvLEtTzQsYRxKuQ7KOdahOmxq3SXbqCU2OXW9b96t3dHZ5xj9VCATQ/qyC?=
 =?us-ascii?Q?5NS7GhD1tzRPVOc/dbb3g9JeB15t+Kizyp1tVwt2nYFRWslkJC3TZwloAtSL?=
 =?us-ascii?Q?0RPS/KQtmdKjII5gCKaMOEj+WjfqPRu+X9QmDUb/S5/+423r0hUNzx5FNfK9?=
 =?us-ascii?Q?aWAoPHHZeoORutUnNCoAr+Zmuy3gfF9yWMu3FoNrA//8s27KRwwZTPYOjGV8?=
 =?us-ascii?Q?h7RQdB66SulehqVC04heWF2wZYliDPVUprPHogxvelJZ6wmyltBsNvVDmHuk?=
 =?us-ascii?Q?J9lhXcJc7RchVts8kHOjSRfOZEUFHgYX2wYkl61a513ETF2YaR2UtxJehGt2?=
 =?us-ascii?Q?Dp4XTxJjbtkkmpJybe2pao+ImMPxgH1nr0d3TDNMwq+ZNLFJsI98Y6/z5TSi?=
 =?us-ascii?Q?YBR8W1HCwuH6tB0g7kBBJoQDyZb5r3zuKtt6IpQH?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5372415-3c36-43af-91fc-08dd5f9168ec
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Mar 2025 05:07:09.1468 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKd91JuyO9+qQNQAHHGxOtIJwF5v+Dp7wwgDnvzU+LQTcLvZQdQLhgavBODNSpo9VoeQkkJ1q4m3f0VrsTGINCfN1p/hm8o+wqB/RVH2ZHA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7081
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
> From: De Marchi, Lucas <lucas.demarchi@intel.com>
> Sent: Friday, March 7, 2025 10:07 PM
> To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from
> documentation
>=20
> On Fri, Mar 07, 2025 at 12:19:21PM +0000, Upadhyay, Tejas wrote:
> >
> >
> >> -----Original Message-----
> >> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> >> Lucas De Marchi
> >> Sent: Friday, March 7, 2025 3:38 AM
> >> To: intel-xe@lists.freedesktop.org
> >> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>
> >> Subject: [PATCH 2/2] drm/xe: Remove GEN11 prefixes from documentation
> >>
> >> The registers are already named without the GEN11 prefix. Do the same
> >> in the memirq documentation.
> >>
> >> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_memirq.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_memirq.c
> >> b/drivers/gpu/drm/xe/xe_memirq.c index
> >>
> 404fa2a456d5870837fce225b5150398733d1e98..49c45ec3e83caf9aeff279
> >> 912b80a0b109bc4a94 100644
> >> --- a/drivers/gpu/drm/xe/xe_memirq.c
> >> +++ b/drivers/gpu/drm/xe/xe_memirq.c
> >> @@ -86,7 +86,7 @@ static const char *guc_name(struct xe_guc *guc)
> >>   *   This object needs to be 4KiB aligned.
> >>   *
> >>   * - _`Interrupt Source Report Page`: this is the equivalent of the
> >> - *   GEN11_GT_INTR_DWx registers, with each bit in those registers be=
ing
> >> + *   GT_INTR_DWx registers, with each bit in those registers being
> >>   *   mapped to a byte here. The offsets are the same, just bytes inst=
ead
> >>   *   of bits. This object needs to be cacheline aligned.
> >
> >commit 6b7ece97dd21d2b80a41f6192f89f8848c3b1d76
> >Author: Matt Roper <matthew.d.roper@intel.com>
> >Date:   Fri Mar 31 17:21:02 2023 -0700
> >
> >    drm/xe/irq: Drop unnecessary GEN11_ and GEN12_ register prefixes
> >
> >This commit does same but probably missed in some documentations.
> Should we add Fixes tag?
>=20
> There wasn't xe_memirq.c in that commit:
>=20
> $ git show
> 6b7ece97dd21d2b80a41f6192f89f8848c3b1d76:drivers/gpu/drm/xe/xe_m
> emirq.c
> fatal: path 'drivers/gpu/drm/xe/xe_memirq.c' exists on disk, but not in
> '6b7ece97dd21d2b80a41f6192f89f8848c3b1d76'
>=20
> ... it would be in the commit that introduced this file, commit a6581ebe7=
685
> ("drm/xe/vf: Introduce Memory Based Interrupts Handler").
> However this typo fix is not critical to propagate to any previous versio=
n so we
> can keep it out.

Sure, lets keep It out.

Tejas
>=20
> thanks
> Lucas De Marchi
>=20
> >
> >However, LGTM,
> >Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> >
> >Tejas
> >>   *
> >>
> >> --
> >> 2.48.1
