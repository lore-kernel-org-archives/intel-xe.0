Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0339AC54E64
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 12:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B343210E299;
	Thu, 28 Mar 2024 12:45:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FaIABP+P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37F8C10E299
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711629942; x=1743165942;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zczHgCcOUuJJkA1oisCynv/4mk7dJQd3jiHu6QlP3Tg=;
 b=FaIABP+Pes+ut83Uh+uPPgeGDfKkuHHfmRaVseW6/ReSeCn6RPbcpBvz
 Aw1XdiPubSVL2MORlOMjGFUHHW7DKxiCZc21R6i13HB2oO6ONFM5qDrcm
 77cyIaq4hRKX4/3O+rkn/eCnex6qFIFbqdjCQqZ2mFamANYnoYdD1Txwo
 Gs/8eYXiSxJFu9Nugeteb2N0Eki1c7gFwBFjn8MXLDL+2GsLydQvTzIOa
 dS1As0+4Penzx9hs+yJu/xbgx57CnK4algm9Gaiy/ra7e97fp0sF88M15
 cScn61JqEBmTwNfQvXWzioLqSiCiJAIS5a5jwnGCs0X1Ys3oY3VCG0afw g==;
X-CSE-ConnectionGUID: NqOBawJ7SdCi9s7m0TUlgA==
X-CSE-MsgGUID: I9TrpmQkR2WDOQtCs1bZig==
X-IronPort-AV: E=McAfee;i="6600,9927,11026"; a="7378418"
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; 
   d="scan'208";a="7378418"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2024 05:45:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,161,1708416000"; d="scan'208";a="16472866"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Mar 2024 05:45:41 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 28 Mar 2024 05:45:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 28 Mar 2024 05:45:41 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 28 Mar 2024 05:45:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ku1WlyjEyiWGsr/rllb7VdEOgei+W6ptEPS6qNFiHKsquNTxXTX/i8oyqRH9DEu0smdU4mlf1Jegrxy9UBxo8WA8LUAWbsC0WdenVHEjg3PPD5ZAkjCfUThvwS9jegO81Za0nF1ks5lX4KMoBI814P1SXHRU0LXWutCGHE+nTI/ey0eTMYkzNkxdqg28Bog4LA1+pRFIDugoNhDPneF85vFdozOvS5EcfoStQiLvw460zeGW3B6crccfS4XzLVLbPGim2BTVBu9y9nGmCXqMPz2zpfYLhCz/iR5z7hhyc8bHgN4+k0YMO1TxC8uBMjlgxqXswwzVarPnOpesA+CaSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNyICIfpcSbd5j4mHyzBdxNJAA/HSoGdid5PG9qSYDQ=;
 b=jVbxF9551+LhLjcfoBNE+FtrVbxrgpbhKiQmDbON9WORk+odcN+qcPQKXCKx4FAfuWtcXAQzD/Ou92cWT6RvrUcPSP8m19JlKolUmN788em2+ZvoPpfHQ3GrNMclx2jRfTWatSHqBevn3WO9vDD9gOSGb6AF+m1RvFeD34UzHPX/1cnI2mE6g33cKn6wf1IYpUzcXnoHBnYn6CMCYSxzz8VG0LbBzsWJ+ZzAstqKt21Oqd6VzlJfsI23lZBLYLJ+FkFyovctuZNnB5NZMgCNfQXRbDWfmRcbFhtKUPJ/mExyhnTo3VtMnxLSytNDM0uitvfX6fApGiJRvtL5QJxtPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB6398.namprd11.prod.outlook.com (2603:10b6:8:c9::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.33; Thu, 28 Mar 2024 12:45:33 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.031; Thu, 28 Mar 2024
 12:45:33 +0000
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Subject: RE: [PATCH v4 2/2] drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit()
 for attr's _show()
Thread-Topic: [PATCH v4 2/2] drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit()
 for attr's _show()
Thread-Index: AQHafopi1CP0ysWpzUWXtSNuSIXAb7FNHlxg
Date: Thu, 28 Mar 2024 12:45:33 +0000
Message-ID: <MW4PR11MB7056EAAB203F341DD47DECCEB33B2@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20231209235949.54524-1-krishnaiah.bommu@intel.com>
 <20231209235949.54524-3-krishnaiah.bommu@intel.com>
In-Reply-To: <20231209235949.54524-3-krishnaiah.bommu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR11MB7056:EE_|DS0PR11MB6398:EE_
x-ms-office365-filtering-correlation-id: a762eea5-e36a-4192-5a32-08dc4f24f556
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: LBLaWhx+3FS22HKpaXyx6KEntbXqBfDSaSi/l4PRgLTEgbtPJ2ZqldHx3eY+IMrWRFjTnxNPK5g8xqrzLl5/BCgKzISntfWEZg6vqhuzmcAZnESSkx9cE/89jmJCNeHN96puxBd0DbiXR2JcYv9kZOxqKXDB8mSjSLhFWtm9nyMID3X8vCRKrpRmDU+a4IuCHSxq8sewkVs6YVLhuVnCN7wQBf1xpduFrwFP+g0pEP8+ZkfaKyg4KmnRjUZlKUBJYqKtd4l2JZu7nORdHVd6ir1YxOZBP5lQoQvcEkmK/PmnrwgH3nvOqlwQLI30sZyNlXttOr3YifCg55zMCi2zHSgCf0wdY2n6wDFIhIiVw7y+s+N9OoMD0nVawmBZO3JFdNa0KDeZndh97ru+LTX4Z0zWbor5vGGfGNqlAQXB1VfCviEyq33ETv5nzzJ5Zr8ogjo19auRRlX0kom5wfwuluY2WTCgZAdT3qFYbLbP0Fug817YzP/Q6+A0TSIZqAFWbeyv4aVdIgu4DkxcrBTk/dD/zGDfXW0ZoUIFBQpBnu5tYrs5lQuJF4ktb+zkFhj51usQDmKt6bFTWsrg8tRcMl0cKrvW3MTwFbiDc33EHwNolZi5Piufs0ujuB+AjRTyyB2gmYF09STwKhkwh2l3iVwbXGK3YsOFfgGb8SQxZZcKkNW4D8VhpNwe8Of3HDC455ItVONQtF0h27hQ88SNzD7hzwgjy5euwPh6ZHqLHjI=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5jHeoStOvFfdWNCHgbqFfhGZCwMgPoec31OUCpmh51dJfmVzuMefzfT3rRWd?=
 =?us-ascii?Q?GVDQ7MNc+xcXe1CYelS58tdYEx6bD0GGqaMvdeIqus8BtSKN8yXCcTYJ5eTj?=
 =?us-ascii?Q?GljvcgqSUsdtMpR5OtXNgBg/7np4g8fyTTIsM95WCMl7ZrSRHValgb5aD/sZ?=
 =?us-ascii?Q?ux3besmZcs34VIIm3QQ+ly7tAIGMNA/7mGyWy1lvYgCRVc1Tml63pGGlqhHU?=
 =?us-ascii?Q?9dsrY/Uicabr6KZr523iAM4opwtpZP4+1sBRuvR7jl/8eadHcQn7nu9S9B3t?=
 =?us-ascii?Q?6w8HkUdhUnb76bil+zJjS35gRcM81XlJ3hUibE/k1G3ywDS5WbZhvulhBLSq?=
 =?us-ascii?Q?GsDlLUa1m+ii7L4Nrvg2y4lb3twEUAXMUQdpXkM9qWKFINN8L/4aGovkpCO2?=
 =?us-ascii?Q?1FO7DCOq3+EJPMV5BPlvWsMhEy0htsO7VUIEFVTAXdvqFfLzlVQVzsnD4KR2?=
 =?us-ascii?Q?M7Ag4hZrAI+boH3N9fMb88xC0zpub9NJFwsBZ4HyxaQAa0i5g7Vi3W7FMRMw?=
 =?us-ascii?Q?a98CXw+/39NgheTbmpQr6QXkTI6+XyqmLMu2fMwvY3c120UO72O19EVuE2yC?=
 =?us-ascii?Q?1s3rqn14o8o//o3Ko9ZDxWA5gvgjiN6R6vdREv3iOZovRmGxRHFcKTPBE2/7?=
 =?us-ascii?Q?dYkPa8jsap/bddKCWhyRFvNI4ITKYrwLk47IVT/OpdrWQZqjxOanyFbh3sTf?=
 =?us-ascii?Q?KLKVnkrOTCAJ7d9ObOXFBNgqb/Nj02jYRkK+2UdHjsKS4n1GBk3K9aGmm8KB?=
 =?us-ascii?Q?HLT6I7lCdwkttljeYhIp9WnecDyjHl9ZbY7uosFfsevknyhfwl4AVPqm2rVJ?=
 =?us-ascii?Q?YMrNgBlbLzA9RlhnXH3tInNAPRTj1b7OIjmfCF5PhDIWW39dth+ngdPZ/17n?=
 =?us-ascii?Q?5hksI6SG6B2zNa2jVM5c89BCN7ZdteOtXyLLdpxjkwOmP3M3x+L6EQh58Sd4?=
 =?us-ascii?Q?hKJkm9hlSEEi08NG0yZEOjLokeF9HHDDut4ggH1lsMKkHph5tBLehLQTTXk9?=
 =?us-ascii?Q?mP0uJ00cL4Kbs4ZzlpuWYsH595tX7qKunXp0h5BrPKMfORBxg7BPWQDHXUIB?=
 =?us-ascii?Q?uaq3swALpi0DvarJcMXetbWgrJeibUwu4WJU05gZcdXxczs1AYY57RCp9Skt?=
 =?us-ascii?Q?HY50SGH5tt3brDBlgMKTc0ScOKCRSx4bvw5LmRNEEudcBNlsLlllAwBOBmav?=
 =?us-ascii?Q?DDXfcuHpDq7CLgKc0xBAbty/aPV/hg1JPlzt9B6QeUwzbtehJ3GGebLauBJc?=
 =?us-ascii?Q?0FPl+8ysVutJ2Z/c85yIClVvBzfRKhrNwOyymFDrm4hWvu0oMMQh9NLWEEtj?=
 =?us-ascii?Q?4x+IOjrGnAQXGksFlzScBAN0sKMLXq82u5QAGljSMUbe2hoKVsvvYLTK/8Iz?=
 =?us-ascii?Q?q2z9sC2McrvdeEKXr8NX+68BuC37g8fZX3IBkl/ci5XZyaVvvUdTM7fn5LeB?=
 =?us-ascii?Q?lA5uAW3p1xXm0zRaE3xirpNeL6UTZym3rdjbJtvtAK/8IHm3VkwyOG7XjyKs?=
 =?us-ascii?Q?QA2bNK1djD11s0NFczROX6LAlNTzmOh7PWYkTR/UP00LajFCPukE8gmFhAC1?=
 =?us-ascii?Q?jDB5q+SMov7bBxpOGYb3dbOk+vnvgta3iDQSMao7JQxVlaagzXhIwTB7Hx99?=
 =?us-ascii?Q?oA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a762eea5-e36a-4192-5a32-08dc4f24f556
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2024 12:45:33.3060 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kb8z4cIYuFylVFRw/mup2Dr0LlqT9Q1N22e6eYFVcN1vsRhPDe58KO4VPniM6+blRIkRUJpA9YjYLjFn8opP2b+LMpmXk5CKIV0RwR2g8WU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6398
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
> From: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>
> Sent: 10 December 2023 05:30
> To: intel-xe@lists.freedesktop.org
> Cc: Bommu, Krishnaiah <krishnaiah.bommu@intel.com>; Ghimiray, Himal Prasa=
d
> <himal.prasad.ghimiray@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v4 2/2] drm/xe/xe_hw_engine_class_sysfs: use sysfs_emit()=
 for
> attr's _show()
>=20
> sprintf() is deprecated for sysfs, use preferred sysfs_emit() instead.
>=20
> v2: used sysfs_emit instand of sprintf
>=20
> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c | 36 +++++++++----------
>  1 file changed, 18 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> index aba01edffacd..c5084d94c442 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> @@ -72,7 +72,7 @@ static ssize_t job_timeout_max_show(struct kobject *kob=
j,
> {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_max);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_max);
>  }
>=20
>  static const struct kobj_attribute job_timeout_max_attr =3D @@ -108,7 +1=
08,7
> @@ static ssize_t job_timeout_min_show(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_min);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_min);
>  }
>=20
>  static const struct kobj_attribute job_timeout_min_attr =3D @@ -141,7 +1=
41,7
> @@ static ssize_t job_timeout_show(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.job_timeout_ms);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.job_timeout_ms);
>  }
>=20
>  static const struct kobj_attribute job_timeout_attr =3D @@ -152,7 +152,7=
 @@
> static ssize_t job_timeout_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_ms);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_ms);
>  }
>=20
>  static const struct kobj_attribute job_timeout_def =3D @@ -163,7 +163,7 =
@@
> static ssize_t job_timeout_min_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_min);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_min);
>  }
>=20
>  static const struct kobj_attribute job_timeout_min_def =3D @@ -174,7 +17=
4,7
> @@ static ssize_t job_timeout_max_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.job_timeout_max);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.job_timeout_max);
>  }
>=20
>  static const struct kobj_attribute job_timeout_max_def =3D @@ -233,7 +23=
3,7
> @@ static ssize_t timeslice_duration_max_show(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_max);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_max);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_max_attr =3D @@ -2=
71,7
> +271,7 @@ static ssize_t timeslice_duration_min_show(struct kobject *kobj=
,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_min);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_min);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_min_attr =3D @@ -2=
83,7
> +283,7 @@ static ssize_t timeslice_duration_show(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.timeslice_us);
> +	return sysfs_emit(buf, "%u\n", eclass->sched_props.timeslice_us);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_attr =3D @@ -295,7=
 +295,7
> @@ static ssize_t timeslice_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_us);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_us);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_def =3D @@ -306,7 =
+306,7
> @@ static ssize_t timeslice_min_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_min);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_min);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_min_def =3D @@ -31=
7,7
> +317,7 @@ static ssize_t timeslice_max_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.timeslice_max);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.timeslice_max);
>  }
>=20
>  static const struct kobj_attribute timeslice_duration_max_def =3D @@ -35=
0,7
> +350,7 @@ static ssize_t preempt_timeout_show(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_us);
> +	return sysfs_emit(buf, "%u\n",
> +eclass->sched_props.preempt_timeout_us);
>  }
>=20
>  static const struct kobj_attribute preempt_timeout_attr =3D @@ -362,7 +3=
62,7
> @@ static ssize_t preempt_timeout_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_us);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_us);
>  }
>=20
>  static const struct kobj_attribute preempt_timeout_def =3D @@ -374,7 +37=
4,7
> @@ static ssize_t preempt_timeout_min_default(struct kobject *kobj,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_min);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_min);
>  }
>=20
>  static const struct kobj_attribute preempt_timeout_min_def =3D @@ -386,7
> +386,7 @@ static ssize_t preempt_timeout_max_default(struct kobject *kobj=
,  {
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj->parent)=
;
>=20
> -	return sprintf(buf, "%u\n", eclass->defaults.preempt_timeout_max);
> +	return sysfs_emit(buf, "%u\n", eclass->defaults.preempt_timeout_max);
>  }
>=20
>  static const struct kobj_attribute preempt_timeout_max_def =3D @@ -422,7
> +422,7 @@ static ssize_t preempt_timeout_max_show(struct kobject *kobj,  =
{
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass-
> >sched_props.preempt_timeout_max);
> +	return sysfs_emit(buf, "%u\n",
> +eclass->sched_props.preempt_timeout_max);
>  }
>=20
>  static const struct kobj_attribute preempt_timeout_max_attr =3D @@ -459,=
7
> +459,7 @@ static ssize_t preempt_timeout_min_show(struct kobject *kobj,  =
{
>  	struct xe_hw_engine_class_intf *eclass =3D kobj_to_eclass(kobj);
>=20
> -	return sprintf(buf, "%u\n", eclass->sched_props.preempt_timeout_min);
> +	return sysfs_emit(buf, "%u\n",
> +eclass->sched_props.preempt_timeout_min);
>  }
LGTM.
Reviewed-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>=20
>  static const struct kobj_attribute preempt_timeout_min_attr =3D
> --
> 2.25.1

