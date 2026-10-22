Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF738606A31B
	for <intel-xe@archiver.kernel.org>; Thu, 22 Oct 2026 12:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PJQynfSV
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B64031125BE;
	Thu, 22 Oct 2026 12:41:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09CA11125BE
 for <intel-xe@lists.freedesktop.org>; Thu, 22 Oct 2026 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792672909; x=1824208909;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ARGxFDJ6ZXW6lYFttbja7X/kRBRYyFAdUr058rANE84=;
 b=PJQynfSV74ZIaZxF+P4/OmwNCZGLfM31CWPCpKt55LgnUe1S3BYAj3Sy
 PbcjMsNl8Ieo6YsnYojmSaSBM0UQl8C/NtRYvZfKEAqa/hq645R4cTe3f
 NsOkfrWmdHZojY4tGp47Z2JLfvycSNTUiuTEqdZykcCGJkxfBbqPk+DRc
 HHB4YGTSpLpQZYOX63kYXNuqxzOzfZ3jovhIjn5tMmpNJQ94ycyqR17lq
 A6OcaE3hYyCIs7nq40weVkoMs82Fl/y2Y4IbxfRWeFqROjVCKIvE/WcXd
 eXrHZh5qmPLgIqwcYTBCJ2hEsi2pc/C5+vjnaDG34xGDR8F65kl6WYuPt A==;
X-CSE-ConnectionGUID: d9gHF3E1S8Glj9J68XdPNA==
X-CSE-MsgGUID: f9SvLbl4Qx6dmnlBkV39Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1433520"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1433520"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:48 -0700
X-CSE-ConnectionGUID: K2hKQe2SSdS2LpbMm6IcDA==
X-CSE-MsgGUID: pMmeMEuVQPSafsZ/2KB+Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3342356"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2026 05:41:48 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:41:48 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 22 Oct 2026 05:41:48 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.49) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 22 Oct 2026 05:41:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hN61r1EWX2BYn7f3orzvg6cz/jiMxCxioEVsodFAwZvX4pMwFaORHFHhww7vYzQ4t489jMovb4BonF9t38gB/PV6+9wMfkDVVjPYJs9J8PEdTEKvEKLzpXllyJYJO9E2RTzVk3tSjW1BRXj7ScbscweoshhgTUBrKv/QaFUgsnP/QIzAsnjRNSFFivsWqr604nxQp/YY4fML+e6eNF++/5MCCZDUV9ffyxhB2nGu9gfJUfWIxEtZxVwj21RnfoZcNYVofsiBywJ/xIFTUDkthKa5CAQXnK/kBkPTSTL8wyR28DKLxVb+ZQY57RpQfIU3k27WItQKOs2SNhaxamq42g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DaRupqI/BXDjf09DpBPqPNK0qx/5ioRzcug351QidNE=;
 b=eLGESd4bLE1fHu5AlcJf320ysPUAk0FBf881rA72EJQ9mWezYTn1tZYStFCvqWR8v7e9gOESpYvB3Q1BAkwWV4tYpr3uNxMml2NoQ6BHievuGCdo+ZAUDIN6mU3hQt6CAahCO+f99xeOyYGhzWRDATsA/AajdrvvB127iqsv6mYSk04NTh3jJkl5B4eVUbeXiqVCfjuxx4CY5u9Jc69gtF/fdrmwCmCxWqoxsUuKZkt21Q9Va0dN+3WGlE+3qSsqKbkP13acxujYJ2VxZ81l17GhFa/7Zc/F17xzQAo1PA6qyC/KjH+HjVM/xKaMDF57lCAj0pvLrBsY/69MPU0NNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB8718.namprd11.prod.outlook.com (2603:10b6:8:1b9::20)
 by IA1PR11MB6099.namprd11.prod.outlook.com (2603:10b6:208:3d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.16; Thu, 22 Oct
 2026 12:41:46 +0000
Received: from DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c]) by DS0PR11MB8718.namprd11.prod.outlook.com
 ([fe80::6aa:411d:4bfa:619c%4]) with mapi id 15.21.0496.021; Thu, 22 Oct 2026
 12:41:45 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>
Subject: RE: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Topic: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying
 an index
Thread-Index: AQHdYh47VO1TljzQpECaHxB1DvZv87cJgK0A
Date: Thu, 22 Oct 2026 12:41:45 +0000
Message-ID: <DS0PR11MB871825975B301935CD33606381652@DS0PR11MB8718.namprd11.prod.outlook.com>
References: <20261022120915.138606-5-matthew.auld@intel.com>
 <20261022120915.138606-8-matthew.auld@intel.com>
In-Reply-To: <20261022120915.138606-8-matthew.auld@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB8718:EE_|IA1PR11MB6099:EE_
x-ms-office365-filtering-correlation-id: ac4dca06-c50f-4d13-2d15-08df3039d538
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|10070799003|366016|38070700021|56012099006|11063799006|4143699003|261021121427099003|261021123027099003|261009223027099003|10067099003|18002099003|22082099003|6133799003;
x-microsoft-antispam-message-info: BsbgHc+Mbu+DXPXYDy2MXm9rNlvLi3PYKKfZ8+Un/QKMvKIb9745L9WrJV4l0KiRhDj5xItDK8x4JehZbEysksE9QvFRl6MqyC2sHfOnXqpgtknPciJ1FGw0ql/b9cEe6PDMjn46+QlyR3EHtBHvi/qYigRN1cFVV46PIIXsSe49WPNS3bNmXnu66ZOHY2a+O7QzPqoDOTfuabJh57I7Cpl9PfsP97HNI6s2B0lGgK8qXqdygHNkt4C7WDr80rhqm2btL8IJ+BLs9COluOo5J1kHsSbma1sWs2lT9UvkKJRbFPgKiWRro+oDmmSoM5E4sCXzV3GxCDKyD0vGOJINTfv8Ilja7UkpIEvG6IVi++fZFRgnvHvTRuGEwPuVj/bXfQThxDzcXQmkeV/7mqEJCaln2lt+b3Jxe9YINw4AX+o2IFZ0NacLLbVtDAmzg3+1FhlL1a1rYwR7EUyukexcUQ9UwHrAf5l4WIFmRsJOmSSfaSiMmT84iMTR3zyYIU3crsPDOuaoLNOMu62ptfsHCDKwDz4iFWvwpC/BQ1Mry77AhWEOafBKJM1UwKDALgjeJBg7j+0d34XHkmR58GrdwUERDnzH5JcEU++Bsxm7JNIFaYY5bBVJKujfB/ppI/cG7UowWdkD1noBruUX5HziWm4yHsk7fMDElR2cbUqO7Qr4UYK/Rcq07DsTyDzEpvA/kaOEMMWu+RGMw+cA9+2YPx3/3ZO01JhweqYjXs1yyEM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8718.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(10070799003)(366016)(38070700021)(56012099006)(11063799006)(4143699003)(261021121427099003)(261021123027099003)(261009223027099003)(10067099003)(18002099003)(22082099003)(6133799003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LtyP6aUTsXmDbsEJMZaA6hzcB+1EU8FtH3UVU/XxNz+11BlEbUI7Vl3HPBYy?=
 =?us-ascii?Q?xeuImYJxsdryKAHJs7UcVewmsuXYhiJ9p3ACeKY2kOFMYiEDTHp4U2hcWdm9?=
 =?us-ascii?Q?1ysAGDlWB5N4AsdtpaFgSsPFWPeVLUplSo0yE7V6OlxkFM9QByMLPTxUSIkC?=
 =?us-ascii?Q?ppWwRFNej6wAxORXryMiyC8Jg8EmTQwVgjLZVQf6No6sbrOp1/WgY93LsnTa?=
 =?us-ascii?Q?zpoY4xVM11E0xfhBM5Q0GPQghnIiGybG0ferchbTMhbsO5NFHgS3nPxsZANc?=
 =?us-ascii?Q?J5RLEc8xmDKcKxepTk0UQzCg1/Z+nalDW/SeHiHHPWUHo1JGtodHyq0/Qqw6?=
 =?us-ascii?Q?baddiu0aOSBIsYeg088UPU3SXWRvwpyphudeAUzh8dZ2khj1FZT31G4jtLao?=
 =?us-ascii?Q?L463BPgBWDqXIt9JgQkaU6WLxKk/2SYjuIb39STI+eUxhbTsnpfJweloNi6R?=
 =?us-ascii?Q?O/eo9ElqFBJNBRCyBLMYBs5GsB10NqG5BzVUe7CwOWfKFLdBCqC4Set6zEp6?=
 =?us-ascii?Q?yZAkpWcWaxNDZplsrI3Efw5U0G+7N8ZFRHb9EguvptknvlYxRMVXQGpwxrP2?=
 =?us-ascii?Q?r/hsW6n2le/Tfcq2oXyOy3rQsjMjYvn1z+OR4wSV5s0jsuikcV2BTwnDo60x?=
 =?us-ascii?Q?KZYerILbO94GCw4ctNdizrD8r9UrlREIIQNfu8KjPBPiqv0xsJJSW92ZqPQC?=
 =?us-ascii?Q?5gxwhpZEF4nnUAURh55JF/ygxQAhJA8NMZJqu2/7ItYuKHgblHdreg3mXOfr?=
 =?us-ascii?Q?ETSy8zcSRDJ6S0KQkMC4OCowwnQ1OUHjB69W8XtoEjIvBAvceTTFRi826YLP?=
 =?us-ascii?Q?EIRVTYlVQ+8c205CvezZBovdNfyRLgEEP9sZf4skvWCb6xJfzwjWztx+24Bt?=
 =?us-ascii?Q?UGnLZzylMz7WrDgT1i7g8KeD9cGFEemAYtCx4YDbejrbGkKltcB4xL/bpBj7?=
 =?us-ascii?Q?0Mm9kfwyKJxz7tu4ZcH37QMHr9Dry9kLYbYgOubw2BqbJ53ksaGyOfs+sHef?=
 =?us-ascii?Q?lfqf7+Z6WB5hAuCo3Rszep0sBf7Gc7rOMwXeuWqcjNlAUE7wvaP5F7avmZ61?=
 =?us-ascii?Q?zzpbsPOqvGCOTJbXsu53eKhZX5ArvZksfdBjnev0UTVPuD8C8iAi6fWJeh5F?=
 =?us-ascii?Q?Qb9l2pGKcUA/oLQpq04P3rxiqvNeNErPqV2UEbjBjc7GS/PwW9WExcJsH/yP?=
 =?us-ascii?Q?OCbR9SaZ9Ab9tjFhsCUnqgrTB9AQ2+OhHMwyzX/9C7ONl4Yfi9K8kyoYnn5T?=
 =?us-ascii?Q?D9EuGbxu8CgQ3cekLqCLXXmGIPUYjZCZ9jiQsajV7u0YBXBglTuqeJva2k9T?=
 =?us-ascii?Q?r1FjaFdyWVPPbqu57f25zjxAFQ9miaXaZ2LpOuBlUqY+XaTNDB0SJAegnYdK?=
 =?us-ascii?Q?Xoom779t+wE0oTH5oTwmWDolAVkOu7hnw5j4usOB6SRboPnC0munz63IPbue?=
 =?us-ascii?Q?HI5mHoPVRP336wM4Na6E2G14DUNVLlntO5gKUB/HNAPNgSbzsSXVzom9ZK88?=
 =?us-ascii?Q?Y++vGzFTntwXfgnTUyFKR+1lg4p9eol0WEXjlRCW0m2HECMxpIdnFdH+WnZH?=
 =?us-ascii?Q?cRDnxNMm0euK76hXiMygBPDFhhME8rND4JbGJy06XfU2gr9+IwKdEpeGvvxg?=
 =?us-ascii?Q?zWBEtg0vl6s0a7QWIH6FecTHL6TFSvDFhKU3I3iqdJaHZWZ4kCXgxjWtyaQE?=
 =?us-ascii?Q?PLicXQX3PGd1TL+L+bujSk9zKDY8yBp4Gx6VZZwEDQbdhLMHnw78BZGkMvqv?=
 =?us-ascii?Q?Yqf2sY3sm6pNh1aYPF4bpkycKnQBDqjeT925w7Os4+zE1tfOriQ3V2o6Lp3q?=
x-ms-exchange-antispam-messagedata-1: 39u/mBttQO9lkg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: t4qGknmmi90vl2Qiy2ArTHjof/UFt0u5wA1ChF1MKrU4Akaa6qwxZgBo8P07MF0YyQ8VoNJAVz/fKsR5megQkXEsYicdcE3q6AKb6XQjxx5DPCOH+VllnQitUj8K9J6KfNrvFaE/jiMPebeyk+/PyfvpJkSn333F28pgH+vLk1V6hHE0j/KCaLDneUbXeqjpfazVxkaVpcQrwKURGFuR5Wt9QTLc6EMWA0CSHCQCPjFo9jnGC7HwPHLH40YqV1j8LPJWI79jgWjuoWTRjXPwt4hz/HdoISv5x1IDjj0L+ZR7NRqYQfDk1duLKs5Um+NQZeFyWFNukB6jzadKRqWcCA==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8718.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac4dca06-c50f-4d13-2d15-08df3039d538
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2026 12:41:45.7792 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yEtCUR3DZv3q7MkMvBhPofAKN1ALwoFKAOoirGDlUSkOR0Z97Zqyn8wUHkISK/qi4P6RPgEKkV66cJR5AITREZsvKOgNa2lQOEwppVLbS6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6099
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



> -----Original Message-----
> From: Auld, Matthew <matthew.auld@intel.com>
> Sent: 22 October 2026 17:39
> To: intel-xe@lists.freedesktop.org
> Cc: Teres Alexis, Alan Previn <alan.previn.teres.alexis@intel.com>; Upadh=
yay,
> Tejas <tejas.upadhyay@intel.com>
> Subject: [PATCH v3 3/3] drm/xe/pat: always check is_valid() when querying=
 an
> index
>=20
> Make the bevaviour consistent. If trying to extract comp or l3 on an unkn=
own
> index, just treat as a programmer error, like we already do for coh_mode
> (implicit).
>=20
> v2 (Tejas):
>   - Make is_valid() return false for an index which is out of range, to
>     avoid multiple WARNs.
>=20
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pat.c | 10 ++++++----  drivers/gpu/drm/xe/xe_pat.h
> |  6 ++++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c in=
dex
> d239693b803b..53c5f4030bf8 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -297,13 +297,15 @@ static const struct xe_pat_table_entry
> xe3p_lpg_pat_table[] =3D {
>=20
>  bool xe_pat_index_is_valid(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	if (WARN_ON(pat_index >=3D xe->pat.n_entries))
> +		return false;
> +
>  	return xe->pat.table[pat_index].valid;  }
>=20
>  u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));

With that we need something like below right or else still we will have 2 w=
arns for same check, let me know your view :
u16 xe_pat_index_get_coh_mode(struct xe_device *xe, u16 pat_index)
{
    if (!xe_pat_index_is_valid(xe, pat_index))
        return XE_COH_NONE;

    WARN_ON(!xe->pat.table[pat_index].coh_mode ||
        xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
    return xe->pat.table[pat_index].coh_mode;
}

bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)
{
    if (!xe_pat_index_is_valid(xe, pat_index))
        return false;

    return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);
}

u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)
{
    if (!xe_pat_index_is_valid(xe, pat_index))
        return XE_L3_POLICY_UC;

    return REG_FIELD_GET(XE2_L3_POLICY, xe->pat.table[pat_index].value);
}

Tejas
>  	WARN_ON(!xe->pat.table[pat_index].coh_mode ||
>  		xe->pat.table[pat_index].coh_mode > XE_COH_2WAY);
>  	return xe->pat.table[pat_index].coh_mode;
> @@ -311,13 +313,13 @@ u16 xe_pat_index_get_coh_mode(struct xe_device
> *xe, u16 pat_index)
>=20
>  bool xe_pat_index_get_comp_en(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>  	return !!(xe->pat.table[pat_index].value & XE2_COMP_EN);  }
>=20
>  u16 xe_pat_index_get_l3_policy(struct xe_device *xe, u16 pat_index)  {
> -	WARN_ON(pat_index >=3D xe->pat.n_entries);
> +	WARN_ON(!xe_pat_index_is_valid(xe, pat_index));
>=20
>  	return REG_FIELD_GET(XE2_L3_POLICY, xe-
> >pat.table[pat_index].value);  } diff --git a/drivers/gpu/drm/xe/xe_pat.h
> b/drivers/gpu/drm/xe/xe_pat.h index f6b0fac2000a..16beda6db97e 100644
> --- a/drivers/gpu/drm/xe/xe_pat.h
> +++ b/drivers/gpu/drm/xe/xe_pat.h
> @@ -57,7 +57,8 @@ int xe_pat_dump(struct xe_gt *gt, struct drm_printer
> *p);  int xe_pat_dump_sw_config(struct xe_gt *gt, struct drm_printer *p);
>=20
>  /**
> - * xe_pat_index_is_valid - Check whether the given pat_index is valid.
> + * xe_pat_index_is_valid - Check whether the given pat_index is valid.
> + Index
> + * must be within valid range.
>   * @xe: xe device
>   * @pat_index: The pat_index to query
>   *
> @@ -75,7 +76,7 @@ u16 xe_pat_index_get_coh_mode(struct xe_device *xe,
> u16 pat_index);
>=20
>  /**
>   * xe_pat_index_get_comp_en - Extract the compression enable flag for
> - * the given pat_index.
> + * the given pat_index. Index must be valid for the hw.
>   * @xe: xe device
>   * @pat_index: The pat_index to query
>   *
> @@ -88,6 +89,7 @@ bool xe_pat_index_get_comp_en(struct xe_device *xe,
> u16 pat_index);
>  #define XE_L3_POLICY_UC		3 /* Uncached */
>  /**
>   * xe_pat_index_get_l3_policy - Extract the L3 policy for the given pat_=
index.
> + * Index must be valid for the hw.
>   * @xe: xe device
>   * @pat_index: The pat_index to query
>   */
> --
> 2.56.0

