Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADA3C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 14:15:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D95CB10E12A;
	Tue, 20 Aug 2024 14:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DNbzaDsF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB6410E147
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724163355; x=1755699355;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=jxsAukYUvHtMgq1HB9Kkq7Rd3WgkiVGKPfffn9htcpw=;
 b=DNbzaDsFcforHNEKbVQwvdHMaUSQJIU6f3xLIuyi60s5Pc5sRsMq4plD
 61t1kdeovtqE+DSY9Fe7FJMwiKoDUgY3xc7DSGhGRuEyj74e1JWx2n/mj
 Y4Cr3NOT2H/mWT5C/UsIMwY9URnuaf0s4O1dTMt838IqBpSmg1jcTz6uN
 icjhT4uTgMu3EyqQAfOm/Dgdt8os2jLFlR4LL8LL/s56iF3I3YSDz1itF
 GV/1sUt+v44jtFiDBYePst2r9p9wt3xE9VHAQdttaT2kJzLljuHD2EaGg
 0xFQAsNrvBzLJZFuGR8PNYugjIzyusK1mlFTc8L3S5b7AglUwAZ9B24Fy Q==;
X-CSE-ConnectionGUID: v8/XS+8SQU288t+bQZx4bg==
X-CSE-MsgGUID: UtDCbkltSLeIhKjaUY4OuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="22002269"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="22002269"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 07:15:54 -0700
X-CSE-ConnectionGUID: ykA+BrKkSziA/ICr6UTV5w==
X-CSE-MsgGUID: ojqElxNkQ6yk075pTDWLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="83953763"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 07:15:54 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 07:15:54 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 07:15:54 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.42) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 07:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mg1V8A/EMSRN7z5aPl9HORUIEQ8hR4OoFvHbGRS/o0WB7o49bprct92CNHx0m0Ag9pb6uXLxVCqbf3b3i7yhcJDUeQ0+C7XJNrf2hOiytYLGEpLLFAPTcsvj1E4V+s0rRwFoxNycpB8OglQfRR2CigntEI/YcvqjpjAOrcA2+Mt3mU1FvGHzwcw4xViTura/T6f5JMeQ2DN9cjbm1UymDkHl49EmiZM6bwWiQWMxobsb//jvK9B9qOQARPWoIGXlml7eS9sqMShHneAch0jsiFy2ZNT6rC1/hCF1pQPRil3z820jmMyr7UXWEn89xor4AilPdVfc7YdS73d3DD+nDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HsJCDSTEHDIL4BV1doYWjbbNLinQt/OZdlaX6WJPJB4=;
 b=HwggOOb7BWhLs2+qsTnImmB8eEYjKC074ykNxv5ZaR3+onMcF97v19Hm+f+aMj2Kh3Egb9uJBYY3RKUpCTZT76nngPpPrjPF94DRqdX0VTqYuuoKPgKIIOVV9NAXOio0DJZHostUk36Xlo6i/zllZGpwC2itr0nbc+kyxIM5tb9dBm9lIdtNurSV9DGM3DnD28hxFCea2YfIFpMsfB7s2asePr88L+J0OOWrNBmZB+ymJyDU4Sis1V8Tqx7A7vRvepRzXEAETfpkDTMYtuFfC76rUyHhcJeUhtsJgxCzEA6ZJExITeLe2InYC4afFXn3DHLl822C1imnOk0vBl0jCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by CY5PR11MB6260.namprd11.prod.outlook.com (2603:10b6:930:23::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.25; Tue, 20 Aug
 2024 14:15:51 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%6]) with mapi id 15.20.7875.019; Tue, 20 Aug 2024
 14:15:51 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>, "Souza, Jose"
 <jose.souza@intel.com>, "Landwerlin, Lionel G"
 <lionel.g.landwerlin@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 7/7] drm/xe/oa: Allow only certain property changes from
 config
Thread-Topic: [PATCH 7/7] drm/xe/oa: Allow only certain property changes from
 config
Thread-Index: AQHa8pwS1KjPIR62j0eAur5y6ZWnCLIwLaDg
Date: Tue, 20 Aug 2024 14:15:51 +0000
Message-ID: <CH0PR11MB5444B6260D259FEB4A06E24CE58D2@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240820005808.1412649-1-ashutosh.dixit@intel.com>
 <20240820005808.1412649-8-ashutosh.dixit@intel.com>
In-Reply-To: <20240820005808.1412649-8-ashutosh.dixit@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|CY5PR11MB6260:EE_
x-ms-office365-filtering-correlation-id: 22100184-2ed7-4d0c-f681-08dcc12298df
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?V4Q476KRmf7ug/NYvfKukagkqQqAgIlnJf7ymU2Td0cvS2YmP1vOPTUnedPF?=
 =?us-ascii?Q?rHtch21VvXl5UnotNwsr20JP3M2gS3MuJaIsQeYCwbfVyZsnCWekfC1D7JZL?=
 =?us-ascii?Q?9AAeTls2LTKTEQ9yu1oXT1QqIfda+fgMQl6Z8qNJeDN4sAlIuzTdsgHQUVaq?=
 =?us-ascii?Q?Pnq85dQcKmAMq86L0E5zJbLCy43g8f9xNXsWytW8Zt+JKyRxR28OLVBlT+7/?=
 =?us-ascii?Q?87bxZYtsS/IvKLKFDYXg1SzIicIwCc/PRs1jgfUS8CPFIowJS/hvCRS+H59P?=
 =?us-ascii?Q?leOB9Io1Yj0M4Jcpv61D8/HwzGW7affE9lcTr+PaOXJ2Zi/CpPPyFl7SsAv+?=
 =?us-ascii?Q?zEllY1J3kH7GBGilgXcm/E6w1tFHrVBOmlabxZnp1wDQ6jti623hg896Xpmx?=
 =?us-ascii?Q?euqJ+aepVtsUK8esvo5UPvfUzujUz4Lz5WMP7CODwxN2MmRz991+LnUAQeEe?=
 =?us-ascii?Q?yNQh/Fs/eLhrZg+dr1NrbDuFShNaM0AFFJt+zEj9RUqML9UQvszevNgCYIU+?=
 =?us-ascii?Q?IBEnmOcb+WD+PHissH3YRedCJxxIdXQJvSjhSeyRvA9BmGFiEAj20WEXpcB0?=
 =?us-ascii?Q?xvA9zbHYTpkA5/6epHBaRhjku0WRSoABc49Mp5vLVaMpPXtNf0bTrwOpajS+?=
 =?us-ascii?Q?eT3jULmu7fRMEKVUFncAZbiF9XMJvykz0wh4S/IkynMN+yRQ9r38FZ/mNRzU?=
 =?us-ascii?Q?JUm2VOpBLuM5CHZgWlw2mcp200zD3OtaUrOsZPT54pJ1Futy1FsyKdT1Gqkj?=
 =?us-ascii?Q?Q9xXEUzN1/6qfA2ydb/YgvjdbGCAbw/3CbTq06ZKj6xDhfZxq9NuQVn39Mii?=
 =?us-ascii?Q?XzV9YbuXeouvG1y4x3Z0mr9augr1O+Zi4c4ou3KqHn++qFrCAjXhzog439L0?=
 =?us-ascii?Q?/TXbSucnMkUAd0ZN4rAY1T9VI7j5zi5hkocVj+gp3PFUOnNqpySqu6YuND/D?=
 =?us-ascii?Q?RLwy1gnM4uPrNOCgsqmu6VCJGNvPP0wf413/uH9MFrBIiZrHKD3aETj3cnKy?=
 =?us-ascii?Q?C58V4Tz7OBICbBhVxRw9jR+UlUUyBctWUyh41SSjZvhT9iUf2o+i9xL5dKOA?=
 =?us-ascii?Q?Sx6j9S6wk7uvsq60mUVG9G/bnFamR6ac4I/kn645U7c0nKrLTxeUCnFREHtv?=
 =?us-ascii?Q?fVu7cTC6r64GCSO2zOPu856lrqRpLkNKNMGQP/2N0GAk6r7PXt/jOxvp9S+y?=
 =?us-ascii?Q?X8JGihftGJSWMF6oMVKSaP/HvB1h6ezIhW934LYjx7IF6IIe8I0or0eD3XmA?=
 =?us-ascii?Q?mbsAF5IePzlyot4Oax70yteyLnyttEH/e5SKg7NTur++0NJ7fY/LGxsr42Er?=
 =?us-ascii?Q?TRgfodKPBXc05C7G0i6/ureAQmuux0/jsgmor/CcyR9cqO+Nhfx4gU9WmiD2?=
 =?us-ascii?Q?nK984dapelt6sQmsNczptqN00q2+1u2Zdg4AvXT6d4a7U948dw=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Hb7Guz2b/L49c0e85LMm6EH4sFtOtqMzhdQoCxQBkdJyZhRCS6Ffv14HlCd3?=
 =?us-ascii?Q?nZ1cLhcwSmRzinaRCWA1tFca+sV0YpUkuz0/A4epWbs/8YK4xFXd4iIvEwH5?=
 =?us-ascii?Q?SVMH7h0SjOM6w6uHzZDxkTQLnynW30+CoaydAcBN8L0oVRY/XeNBz2bmrauz?=
 =?us-ascii?Q?xRmYSNhaFEki43WvjbU8koLuE8H9oFyQU5mbVC4pOOkkp/DRENQve6MRH+JX?=
 =?us-ascii?Q?vXYCetog1v6yaqqHTIjcTaW/FU2RrScMFbjRKTTWTBZZA8L2kDsRZz9Tuwqr?=
 =?us-ascii?Q?37cUP41/QNMZ14CO3mp4iEqbzfQ4GpEo9XqWX6xH0g2VrlzUZo8keH8b4/dw?=
 =?us-ascii?Q?1+7oHDSWQgZt+dfLFn6iXJUPIVQg5yYN3gGY95z6nWa5+mBNU2gzVrGOLbDZ?=
 =?us-ascii?Q?i5J67BdjiVQN1Sjs/TFmWyUjvxO2ziIQ7wYe6m0IeuOBBwwetGHp3bZbqqj5?=
 =?us-ascii?Q?Yy6bGuVoGQ9wCnnjVEJA11EZTdyKCUQ508VkavJu8qP83pZVWal5UvgHURkU?=
 =?us-ascii?Q?/VpYZxYsnd8KZHf9Xm4OUNjgke4Nmf1lMr6rOhs+YgvRS5IkVEps6Rv0FGsd?=
 =?us-ascii?Q?85v59ueqiMniKN066OusvWxPvhsMmEGb0/Rc0h3nK4YT6tse5DaHnDZqn4Yp?=
 =?us-ascii?Q?1mwVSd19Tx9GHryLnxf59aaYHnuQQttnIl8P/w/1e+G7xGDj+xlwm47+4B9L?=
 =?us-ascii?Q?AvWpF7rrMAHDStFrdmqv0orArvFCBjL5hDRNCyUHlfasAcXKkwpwvlQa2LAR?=
 =?us-ascii?Q?DTye60Nrv476EGYMM/MvlXB72OP519CPT+idvYDKc4pNJCZgqVsNH1EB6IAH?=
 =?us-ascii?Q?YgvpsWKLEE55ndLpd9jpI5UWFb/cxrN+3I5fXEpy+Nt6fMNDU1SVF9loYI0j?=
 =?us-ascii?Q?+mGkPew88lUGmmMwrir/lXRkbJr1T/RsnLUmoj9IfZDBGQQYJPc9FEXEKLRT?=
 =?us-ascii?Q?kCFdUbKJ0E1Czlz2wXFm3Ht1DqhrYktABVXSbiMjE6+qBjCCGbvIWXeE1wl8?=
 =?us-ascii?Q?eYJp+YjSnP2mQX9DhrOjY8ERLkL8ljrHwtE9UiGbH4YGZXmk09P06uHfQMlZ?=
 =?us-ascii?Q?reFv7GfMpUm/NG37nUF6YcDBtPLsZsc5uqSUT0h4ubzB8oe/RZ92xwcZrOoo?=
 =?us-ascii?Q?zLWqqUYlAZyB4fxaavYyUd1uwqyAopoqQIYGsZUVirMT4f+3DOqyPgOLVF/c?=
 =?us-ascii?Q?KkWbAk2eJMgPM+E4WIRxcswOeEsCZUpvh3jDIJI8a00qIh5N1+lKmnNIfMHH?=
 =?us-ascii?Q?KdXD/3/1BOmksbAfeaB0GIssTqwYOXNwx9HNN7Z88TnQOLtF5NRkUOZ8gzAA?=
 =?us-ascii?Q?ZxcUcA6H4gtoXKD2VAvtMsb0uWSY2NE6cXvGMhiwqik05F3/Lx1UUkPATbjf?=
 =?us-ascii?Q?VKZhcq8p7gkDtFZYQ0rHSIeT0alvuIyFAh3ehWVesK7iyCYmlyfqwW/0jRW6?=
 =?us-ascii?Q?luIncraXkXmhIXO1295+1x0R3JIZzRShDA6O7GKI8/HO+dLIcVWqzXaC7bp3?=
 =?us-ascii?Q?lB+EtP7IXJBjtOlv+hx0JRwRopmqp13cFN7catmE9RPHTLTQYDt94iawkr3u?=
 =?us-ascii?Q?fiYV5HzjWnRTfSbjCr1vxRsjDXcNxjeLMahj1Vlv?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22100184-2ed7-4d0c-f681-08dcc12298df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2024 14:15:51.7156 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UokFPjlGhqbv/tmZ62nzWq3nt1N4IfJymRmABGngFBIkGZ7OFUj/p1rtdgt4g1tdSBF2LTzSZxFuI4/jz1Yo3YmvcXKmx/sJgNMtuNy+woI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6260
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
From: Dixit, Ashutosh <ashutosh.dixit@intel.com>=20
Sent: Monday, August 19, 2024 5:58 PM
To: intel-xe@lists.freedesktop.org
Cc: Brost, Matthew <matthew.brost@intel.com>; Souza, Jose <jose.souza@intel=
.com>; Landwerlin, Lionel G <lionel.g.landwerlin@intel.com>; Nerlige Ramapp=
a, Umesh <umesh.nerlige.ramappa@intel.com>; Cavitt, Jonathan <jonathan.cavi=
tt@intel.com>
Subject: [PATCH 7/7] drm/xe/oa: Allow only certain property changes from co=
nfig
>=20
> Whereas all properties can be specified during OA stream open, when the O=
A
> stream is reconfigured only the config_id and syncs can be specified.
>=20
> v2: Use separate function table for reconfig case (Jonathan)
>     Change bool function args to enum (Matt B)
>=20
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>


Minor nits below, but otherwise LGTM.
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>


> ---
>  drivers/gpu/drm/xe/xe_oa.c | 51 ++++++++++++++++++++++++++++++--------
>  1 file changed, 40 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index f43767e0a75ec..96420c3ea10fd 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -47,6 +47,11 @@ enum xe_oa_submit_deps {
>  	XE_OA_SUBMIT_ADD_DEPS,
>  };
> =20
> +enum xe_oa_user_extn_from {
> +	XE_OA_USER_EXTN_FROM_OPEN,
> +	XE_OA_USER_EXTN_FROM_CONFIG,
> +};
> +
>  struct xe_oa_reg {
>  	struct xe_reg addr;
>  	u32 value;
> @@ -1246,6 +1251,12 @@ static int xe_oa_set_prop_syncs_user(struct xe_oa =
*oa, u64 value,
>  	return 0;
>  }
> =20
> +static int xe_oa_set_prop_ret_inval(struct xe_oa *oa, u64 value,
> +				    struct xe_oa_open_param *param)
> +{
> +	return -EINVAL;
> +}
> +
>  typedef int (*xe_oa_set_property_fn)(struct xe_oa *oa, u64 value,
>  				     struct xe_oa_open_param *param);
>  static const xe_oa_set_property_fn xe_oa_set_property_funcs[] =3D {


Perhaps we should consider renaming this to match the later funcs array.
"xe_oa_set_property_funcs_open" for example?
Just a suggestion, not blocking.


> @@ -1262,8 +1273,22 @@ static const xe_oa_set_property_fn xe_oa_set_prope=
rty_funcs[] =3D {
>  	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_prop_syncs_user,
>  };
> =20
> -static int xe_oa_user_ext_set_property(struct xe_oa *oa, u64 extension,
> -				       struct xe_oa_open_param *param)
> +static const xe_oa_set_property_fn xe_oa_set_property_funcs_config[] =3D=
 {
> +	[DRM_XE_OA_PROPERTY_OA_UNIT_ID] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_SAMPLE_OA] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_OA_METRIC_SET] =3D xe_oa_set_prop_metric_set,
> +	[DRM_XE_OA_PROPERTY_OA_FORMAT] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_OA_PERIOD_EXPONENT] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_OA_DISABLED] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_EXEC_QUEUE_ID] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_OA_ENGINE_INSTANCE] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_NO_PREEMPT] =3D xe_oa_set_prop_ret_inval,
> +	[DRM_XE_OA_PROPERTY_NUM_SYNCS] =3D xe_oa_set_prop_num_syncs,
> +	[DRM_XE_OA_PROPERTY_SYNCS] =3D xe_oa_set_prop_syncs_user,
> +};
> +
> +static int xe_oa_user_ext_set_property(struct xe_oa *oa, enum xe_oa_user=
_extn_from from,
> +				       u64 extension, struct xe_oa_open_param *param)
>  {
>  	u64 __user *address =3D u64_to_user_ptr(extension);
>  	struct drm_xe_ext_set_property ext;
> @@ -1279,18 +1304,22 @@ static int xe_oa_user_ext_set_property(struct xe_=
oa *oa, u64 extension,
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.property, ARRAY_SIZE(xe_oa_set_property_=
funcs));
> -	return xe_oa_set_property_funcs[idx](oa, ext.value, param);
> +
> +	if (from =3D=3D XE_OA_USER_EXTN_FROM_CONFIG)
> +		return xe_oa_set_property_funcs_config[idx](oa, ext.value, param);
> +	else
> +		return xe_oa_set_property_funcs[idx](oa, ext.value, param);


If we want to extend this in the future, we might want a map between the
xe_oa_user_extn_from enum and the xe_oa_set_property_funcs_config.

Something like:

"""
static const xe_oa_set_property_fn xe_oa_set_property_funcs_list[][] {
	[XE_OA_USER_EXTN_FROM_OPEN] =3D xe_oa_set_property_funcs,
	[XE_OA_USER_EXTN_FROM_CONFIG] =3D xe_oa_set_property_funcs_config,
};
"""

Then, here, we'd just need to do something like:

"""
return xe_oa_set_property_funcs_list[from][idx](oa, ext.value, param);
"""

I don't think this is strictly necessary, though.
-Jonathan Cavitt


>  }
> =20
> -typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa, u64 extension,
> -				       struct xe_oa_open_param *param);
> +typedef int (*xe_oa_user_extension_fn)(struct xe_oa *oa,  enum xe_oa_use=
r_extn_from from,
> +				       u64 extension, struct xe_oa_open_param *param);
>  static const xe_oa_user_extension_fn xe_oa_user_extension_funcs[] =3D {
>  	[DRM_XE_OA_EXTENSION_SET_PROPERTY] =3D xe_oa_user_ext_set_property,
>  };
> =20
>  #define MAX_USER_EXTENSIONS	16
> -static int xe_oa_user_extensions(struct xe_oa *oa, u64 extension, int ex=
t_number,
> -				 struct xe_oa_open_param *param)
> +static int xe_oa_user_extensions(struct xe_oa *oa, enum xe_oa_user_extn_=
from from, u64 extension,
> +				 int ext_number, struct xe_oa_open_param *param)
>  {
>  	u64 __user *address =3D u64_to_user_ptr(extension);
>  	struct drm_xe_user_extension ext;
> @@ -1309,12 +1338,12 @@ static int xe_oa_user_extensions(struct xe_oa *oa=
, u64 extension, int ext_number
>  		return -EINVAL;
> =20
>  	idx =3D array_index_nospec(ext.name, ARRAY_SIZE(xe_oa_user_extension_fu=
ncs));
> -	err =3D xe_oa_user_extension_funcs[idx](oa, extension, param);
> +	err =3D xe_oa_user_extension_funcs[idx](oa, from, extension, param);
>  	if (XE_IOCTL_DBG(oa->xe, err))
>  		return err;
> =20
>  	if (ext.next_extension)
> -		return xe_oa_user_extensions(oa, ext.next_extension, ++ext_number, par=
am);
> +		return xe_oa_user_extensions(oa, from, ext.next_extension, ++ext_numbe=
r, param);
> =20
>  	return 0;
>  }
> @@ -1460,7 +1489,7 @@ static long xe_oa_config_locked(struct xe_oa_stream=
 *stream, u64 arg)
>  	struct xe_oa_config *config;
>  	int err;
> =20
> -	err =3D xe_oa_user_extensions(stream->oa, arg, 0, &param);
> +	err =3D xe_oa_user_extensions(stream->oa, XE_OA_USER_EXTN_FROM_CONFIG, =
arg, 0, &param);
>  	if (err)
>  		return err;
> =20
> @@ -2011,7 +2040,7 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev,=
 u64 data, struct drm_file *f
>  	}
> =20
>  	param.xef =3D xef;
> -	ret =3D xe_oa_user_extensions(oa, data, 0, &param);
> +	ret =3D xe_oa_user_extensions(oa, XE_OA_USER_EXTN_FROM_OPEN, data, 0, &=
param);
>  	if (ret)
>  		return ret;
> =20
> --=20
> 2.41.0
>=20
>=20
