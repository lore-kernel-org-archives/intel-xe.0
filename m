Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7C35C3DA41
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jul 2024 20:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 609C910E00E;
	Wed, 10 Jul 2024 20:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U8nQ7aOI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56E1810E00E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jul 2024 20:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1720641794; x=1752177794;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=WyWpQU2El1l9UF9q8cEDWyxbeXxZRCcjQnOjeoV8JRA=;
 b=U8nQ7aOIx9o//oKzBKETgIPajCHe/+4bpdFV9rq00dIxLPybGJAhqakP
 /yMzf59NEKiuBfMtlXSW3b2oGP8FPT4nwVSBFfy2Z9mvlP7kZ+j7JjMky
 7mh48Fo54S4CDulHavsEMcEUCfCtp7zxjH7iDxA8lPlDGELCpxCSPQ2nq
 RWqPjBTk4AUmeuFea2+cFJn8adHim9Ygng8a+yyM0G1yHRbdSnX7NtFd+
 wa9ORIeD4SvLivXu2I3l5cRA+I1KL2P1Wc5KfFhlCjv8HBL1sUVaPJb3T
 l3pm2/5iItDcgsyAw4gJRrXNbbPbjAimp7aCxN/mLTAfNx8TV5b8/2G3n g==;
X-CSE-ConnectionGUID: mrKyU9/uRQ6l3Uy1y7y0Hg==
X-CSE-MsgGUID: vS6EhB4VRwujgLbXiKAATA==
X-IronPort-AV: E=McAfee;i="6700,10204,11129"; a="29391898"
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="29391898"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2024 13:03:14 -0700
X-CSE-ConnectionGUID: NWxujBHZT+Kmye5Zm5Q0oA==
X-CSE-MsgGUID: +obOf2LrQQO5OCMTWQpRgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,198,1716274800"; d="scan'208";a="48205291"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jul 2024 13:03:13 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 13:03:13 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 10 Jul 2024 13:03:13 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 10 Jul 2024 13:03:13 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 10 Jul 2024 13:03:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=as4vvfTJSQ2z6BEPSiVoRl82k5yttnpRoKMEqYe8qhq/PIsPvK013WsbvIh2813VECdLxc2YIoqeCzJGNwymf/GDb0vFS5W3YEybXxA4TXnDj3pGiEadt6sraCO/08IQ/K9cvfEYVizkttj/ESqlPjTC6mGXRV5VbajdGHKn9adxae9B0QIpjQLF4HRGTBvlQNxftBo2TD4ZxU4kSw3k2zX7ZzaYbfzlAjyz7/dJqrp7j64ZnUnEx4HvTcFuPMHRsqyDO8nrW0Y+KtC3LWTheTJunkAcfdty0FYqgMNqwjq0N67eOEkklYWO2t/A2lJpNjqvnhnUy60IYG+wS+aE6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3qEpgXMUPnSrgRTVQNFkkZrh2bsFFq3OBNIYqPK05+A=;
 b=SrXIJW489BeG1Ju7Xaiz58KPD1a6mc96Ik9VxE8VgC/z7H+AHeFYgNbrbXflcLE7xbsLjP0jXOXoB2R5OJybDb2sWaAzF4Ffz0tfLjVNx6XdD6hfKe2g1+cAL7+u11ykQ7Sj49KPHRXQCYGR0wcIY/FAbSdeAYCeyLxQjufU8SRklNV1q97gOfb4DiGbqKt6KUrMQWtT10slolRDpPptuESF8qc5vk1T6PdqcOdwV3qSgc1uLzIOShJfh6of3iJeuhBFsS1TfKDqF4DWpQC7wcW5juOF2qSsuJakTRfSHGe6OygR2JW0jCY6M5jcJbsY6ns3zWHerDQ2rB6ctWXJWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Wed, 10 Jul
 2024 20:03:11 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 20:03:10 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Wajdeczko, Michal"
 <Michal.Wajdeczko@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
Thread-Topic: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code layout
Thread-Index: AQHa0g+eS8O8WL5/JEGZUdx0iBNobbHwY7/w
Date: Wed, 10 Jul 2024 20:03:10 +0000
Message-ID: <MW3PR11MB4748C172CF07100F2CE9DE6CAEA42@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
 <20240708111210.1154-5-michal.wajdeczko@intel.com>
 <e4nrt3j4tq7tuoz3umqcyodyahdgevcf3rggysn72f7kcapdqs@ds7vo4t5gb2b>
In-Reply-To: <e4nrt3j4tq7tuoz3umqcyodyahdgevcf3rggysn72f7kcapdqs@ds7vo4t5gb2b>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|SJ0PR11MB4896:EE_
x-ms-office365-filtering-correlation-id: f5c1eac1-8104-45db-f896-08dca11b52c4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?ptzrYVZtBzc6udZElg77L6HvkKEZiBCjHUT5pljn+4xHvppiVE/HD63fe8Rl?=
 =?us-ascii?Q?n96iAEOVzzZSnWXWxMkLqZJc/MkNwdz7TaudV8LujLukZHi7HT4ql/8DlV17?=
 =?us-ascii?Q?1Z4nys5LGl1//IxbUpd/3AgI6FxYzP+0XM8RvRR6shAEB7nHCrj1BSgeK9pU?=
 =?us-ascii?Q?amaIZhe7aW8AtcyiCmz1ylL+XGYpWSYiXSBsOigrC0xoR+KWwkLdZ/4B9xYU?=
 =?us-ascii?Q?JYXx3c+lj8eUicyYrivuH3+LTQpfyi9DCiJFssgHCENNmXIyY/MJ7ViHdEQ3?=
 =?us-ascii?Q?E2Cr1LpIB58r6QhczhwamxEq1qiCJLUkQ4v2nCEHiEEEfMOGIsqfld+e40vQ?=
 =?us-ascii?Q?9o+2OSsNcsjPfejiPAfIVOicMSCuzNIve+DsHMSNgEBg1kI601+dN45ffFQa?=
 =?us-ascii?Q?zpiMvEytVq9+HfwKWwfcXMNZLwdDhG/Wjz5fkHBlhjz11r9K3QbqR0C4A1X0?=
 =?us-ascii?Q?NwdAscDtly4eMA7XTh9poLEkvgzbV4FEQ1d3u6UMpqwnE9I+TMg76YU2cqRV?=
 =?us-ascii?Q?096nBqseIOmANeLf24ZWvPwo9yUT5nPEyYNChrobdxJTA1ypHqWbARsRN/wj?=
 =?us-ascii?Q?N/ixSryapxrLFqKCwb5FBy1UnGpVvnA/8EgCi7RKSUBuc30MAeFmSbE9ZwRn?=
 =?us-ascii?Q?cISkDafB8C8kJXJdKnV1zOp/vOXPrx4Gzv+NatEIJCjQJcrMtPQkW4ClljFe?=
 =?us-ascii?Q?hViNH5c/oqY7d5P00b0u8Uka9csQpb6prORBZNhvBQ+wE7O9bIq9PxGrSZOu?=
 =?us-ascii?Q?42Lb0fwWayXj+qeUgTK4X+fa3syjL3RAwgqvqxDoc/MbVlhG6NMTvnb/SHv8?=
 =?us-ascii?Q?0hUN5ciO9B/rWLgTm7+vAiuJPZhSqCcSwYTkxsrqrdVqFI446cJrVuCauKZR?=
 =?us-ascii?Q?uEEyTyD5oR3tvd2v/YkEjV6up6h+60BcPF186e7DZLPM3s7jmQZJ8cvQtqkv?=
 =?us-ascii?Q?V8+ouzfr6LCcl1OCEIIK7O4sQ/+JVYxhSl7wt+QvSFsRwe29r4eWyG3ykXsN?=
 =?us-ascii?Q?qPqnGZyQGlUSpIfo4L+JclTffbOQr5pwdM0fFjWHCATO1FckSlB2Qck41PvC?=
 =?us-ascii?Q?4Q3ggAfFFVJJ6z1KRssI+GqOG9C8/Z7h5jtMOn8/cj8Ud6IfMNO2Mykb/j/Q?=
 =?us-ascii?Q?cauDz4iQvznbjJj1fKhBk7DO6mi3mvgWFMj4gvl9vYiPHG4xy/yPlQyj4B4x?=
 =?us-ascii?Q?8CNlmO2MN4P0JwzR0puStR7etsbKGxmG3BglAnuAjXpqCzDWeOBdb8IrWUnF?=
 =?us-ascii?Q?L/xw9BrZgs+EN6E8GL921/Fj/dO6a0iN52VtzmbxSBU/QA41Zx6svR7G2Zs4?=
 =?us-ascii?Q?ITd/n4xUnTCgCw3obMjrnHuoomC5eZV+K1MLdPreSJH/rzJUAPE7uouh5POD?=
 =?us-ascii?Q?UAIrkMTpseWp17OuDm5lm2xEcQ3hQg1eB1+f/PQ2TXUc3ffukg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?PE6BbfATDGiwEpldBxSMtovAy+vNmZHWQRxS4rd03NZP2KawVr3Hp1piH5ou?=
 =?us-ascii?Q?obKL2InX5/1a1j6WvVR4lJwdKo/+HlAHPI+TMvFHJ29HlLu4j3xJQpZgJ/14?=
 =?us-ascii?Q?U9Zy+5wc/uOn7F9xQrt3xk5sn8Sv2VP3EoYNeTewd87ySC0ScEwcARlpeKGS?=
 =?us-ascii?Q?usRve8CUjRvKaGZ+bcpRfpNGT4fuDB6LbiAobPlj/ZEgRCBMIyct3UyQCQOU?=
 =?us-ascii?Q?GOKIjJ49H/QIN/gg3+PSDmZk2F5a6O8w3Gi3KPIgVejTNTQY73Da/I9X5iN8?=
 =?us-ascii?Q?iWzgGh1BsMSYJr7k7QWu82YvO2UBLl3x9KGivebvZ2+mbo+bUR0wEDnsD3zc?=
 =?us-ascii?Q?9RkpwopJIKLHWhK8Te3m277p1F0gzDitmeTuL0r7x8sapgGszBrBczTVTK/F?=
 =?us-ascii?Q?uwjCh0gblfzCbiNHOKYKTyM6QuNd59v1dBRUyq4oSf6r2UIMXW8jKkSqY9ST?=
 =?us-ascii?Q?c8sMJ7qPqls4OkuuTDaIgV563JBvXpczDB+77I9cAc1MeeFvJkManH0dLBlg?=
 =?us-ascii?Q?DcmeiAEQvI9IDd8wheR91l7nySwB2Yd17EKH7ogNQ6yoGrEZp/irNXA0/uop?=
 =?us-ascii?Q?G74IYds44GX/uIYftAQYanXIuIhmfJxNzYFV6UlF8BEEJ1Ton618bsUugzvK?=
 =?us-ascii?Q?aVH8eGsw/7KlU5dJuE7SyW87lAi2LWorB3fyxFGlH8MasBuxoL1c+fM5MP4m?=
 =?us-ascii?Q?yu6Lq0SbGFaDtxWtXmYKZO+WzDvvvb7+KYlcUEW8qn8kkX3aqn2Rd6CshNbm?=
 =?us-ascii?Q?otiYMi4gmeJ8LnJKsDmzrPWq5mbKd/ZL4LylTVY3XkQwZz6RpsSGHyFbr/qW?=
 =?us-ascii?Q?yq/7lRhcfZDex3dUHnNH+AbMsG8jQA8tf0HWeXIurXbd09GF/XxoSEVgjbC2?=
 =?us-ascii?Q?8orV6CKrDiS9PXXqLXe/xovKZCpUOUkxjDIR7HUZephDsDy0bqrPxYwPEJ23?=
 =?us-ascii?Q?HzO7Q3iU/6aJamg+FrFKjZZBrmH7OaOFht+yPgnovuHwKkF0hMuXMHfLstNk?=
 =?us-ascii?Q?OlLo8xrfKM0F1KeUYWFAMjPvfZXzCkFcDGge+MejpS7rHC0O7Y1+LZP2xUo6?=
 =?us-ascii?Q?rfehfc4Pjz9kEGboTfnLXG5cTUL6adICtauD2e+fkq2HxnXXCWunNquaMAw8?=
 =?us-ascii?Q?yxPQPUMO5fNFzlgYNPpm2oe6uSDauh9NjHxGB35kTmKuNV3LSwrP/PDE3d9y?=
 =?us-ascii?Q?VZkMaXdOcWXgFM2RAeI3gb3Xk9CjXjD3jeVquBeY1C4cMy+OFeR9u+TMO4y5?=
 =?us-ascii?Q?wqEk6VzuJm6N2+5Br6v55uMMRnuDpgb512XpVZuxWexD1cJHL733pe5AArI+?=
 =?us-ascii?Q?lPJ/n7xzA0LhVsDMAIx9fPtZYT+nHwzU38HVlqLXCTiCKwah/0q8Bl6HNzYs?=
 =?us-ascii?Q?D5Q1pXRvjhvcrur+h8cK72hTXInEI4nFEiolc/Z54COsmMeKQHOs3gm258W2?=
 =?us-ascii?Q?x294MxobdjNk6ZFJMDjJ1x3j9cjvFkykVyB/oBHKPXaasa6sX6mbC72grzg6?=
 =?us-ascii?Q?VtBoKZENlUhbDArb721MY3d5qgNAjsBUsHsZKP4zbVBzUopK/1lBIcoq7uoY?=
 =?us-ascii?Q?IVZu0RQVtcjQIX9oPG+2DAlu77SZyoWQCdyHmwF5fbINLM/RnUtbgEiU7rbq?=
 =?us-ascii?Q?PQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5c1eac1-8104-45db-f896-08dca11b52c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 20:03:10.4316 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8jeX/pCbPT6ddpT2H5uoDI8/2pLt4Ag7Xd8KLS2A1CckmTK+DvTljWhJiNGmVJSjVei/SSYRLe7G3u5HkIx/8ggMqbOR+tle9uuVIIS8tus=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4896
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
> Sent: Tuesday, July 9, 2024 8:22 PM
> To: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH 4/4] drm/xe/kunit: Simplify xe_mocs live tests code l=
ayout
>=20
> On Mon, Jul 08, 2024 at 01:12:10PM GMT, Michal Wajdeczko wrote:
> >The test case logic is implemented by the functions compiled as part of
> >the core Xe driver module and then exported to build and register the
> >test suite in the live test module.
> >
> >But we don't need to export individual test case functions, we may just
> >export the entire test suite. And we don't need to register this test
> >suite in a separate file, it can be done in the main file of the live
> >test module.
> >
> >Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>=20
> +Matt Roper, +Janga
>=20
> We ended up implementing the mocs tests on the igt side that can test
> additional things like keeping the values across reset. Is there any addi=
tional
> value in keeping the kunit live version?
Mocs Reset IGT tests are not yet added. I will be working to add those igt =
tests.
Once added will remove these live tests. Till then we need these tests to b=
e running.

Thanks,
Rahul
>=20
> Lucas De Marchi
>=20
> >---
> > drivers/gpu/drm/xe/tests/Makefile           |  3 +--
> > drivers/gpu/drm/xe/tests/xe_live_test_mod.c |  2 ++
> > drivers/gpu/drm/xe/tests/xe_mocs.c          | 20 +++++++++++++++-----
> > drivers/gpu/drm/xe/tests/xe_mocs_test.c     | 21 ---------------------
> > drivers/gpu/drm/xe/tests/xe_mocs_test.h     | 14 --------------
> > 5 files changed, 18 insertions(+), 42 deletions(-)  delete mode 100644
> >drivers/gpu/drm/xe/tests/xe_mocs_test.c
> > delete mode 100644 drivers/gpu/drm/xe/tests/xe_mocs_test.h
> >
> >diff --git a/drivers/gpu/drm/xe/tests/Makefile
> >b/drivers/gpu/drm/xe/tests/Makefile
> >index 32ce1d6df0fa..0e3408f4952c 100644
> >--- a/drivers/gpu/drm/xe/tests/Makefile
> >+++ b/drivers/gpu/drm/xe/tests/Makefile
> >@@ -2,8 +2,7 @@
> >
> > # "live" kunit tests
> > obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_live_test.o -xe_live_test-y =3D
> >xe_live_test_mod.o \
> >-	xe_mocs_test.o
> >+xe_live_test-y =3D xe_live_test_mod.o
> >
> > # Normal kunit tests
> > obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o diff --git
> >a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> >b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> >index 4c1e07a0d477..5f14737c8210 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_live_test_mod.c
> >@@ -8,10 +8,12 @@
> > extern struct kunit_suite xe_bo_test_suite;  extern struct kunit_suite
> >xe_dma_buf_test_suite;  extern struct kunit_suite
> >xe_migrate_test_suite;
> >+extern struct kunit_suite xe_mocs_test_suite;
> >
> > kunit_test_suite(xe_bo_test_suite);
> > kunit_test_suite(xe_dma_buf_test_suite);
> > kunit_test_suite(xe_migrate_test_suite);
> >+kunit_test_suite(xe_mocs_test_suite);
> >
> > MODULE_AUTHOR("Intel Corporation");
> > MODULE_LICENSE("GPL");
> >diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c
> >b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >index 67c65e88c384..b344608abdbf 100644
> >--- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> >+++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> >@@ -6,7 +6,6 @@
> > #include <kunit/test.h>
> > #include <kunit/visibility.h>
> >
> >-#include "tests/xe_mocs_test.h"
> > #include "tests/xe_pci_test.h"
> > #include "tests/xe_test.h"
> >
> >@@ -134,11 +133,10 @@ static int mocs_kernel_test_run_device(struct
> xe_device *xe)
> > 	return 0;
> > }
> >
> >-void xe_live_mocs_kernel_kunit(struct kunit *test)
> >+static void xe_live_mocs_kernel_kunit(struct kunit *test)
> > {
> > 	xe_call_for_each_device(mocs_kernel_test_run_device);
> > }
> >-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_kernel_kunit);
> >
> > static int mocs_reset_test_run_device(struct xe_device *xe)  { @@
> >-175,8 +173,20 @@ static int mocs_reset_test_run_device(struct xe_device
> *xe)
> > 	return 0;
> > }
> >
> >-void xe_live_mocs_reset_kunit(struct kunit *test)
> >+static void xe_live_mocs_reset_kunit(struct kunit *test)
> > {
> > 	xe_call_for_each_device(mocs_reset_test_run_device);
> > }
> >-EXPORT_SYMBOL_IF_KUNIT(xe_live_mocs_reset_kunit);
> >+
> >+static struct kunit_case xe_mocs_tests[] =3D {
> >+	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> >+	KUNIT_CASE(xe_live_mocs_reset_kunit),
> >+	{}
> >+};
> >+
> >+VISIBLE_IF_KUNIT
> >+struct kunit_suite xe_mocs_test_suite =3D {
> >+	.name =3D "xe_mocs",
> >+	.test_cases =3D xe_mocs_tests,
> >+};
> >+EXPORT_SYMBOL_IF_KUNIT(xe_mocs_test_suite);
> >diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> >b/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> >deleted file mode 100644
> >index 6315886b659e..000000000000
> >--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.c
> >+++ /dev/null
> >@@ -1,21 +0,0 @@
> >-// SPDX-License-Identifier: GPL-2.0
> >-/*
> >- * Copyright (c) 2022 Intel Corporation
> >- */
> >-
> >-#include "xe_mocs_test.h"
> >-
> >-#include <kunit/test.h>
> >-
> >-static struct kunit_case xe_mocs_tests[] =3D {
> >-	KUNIT_CASE(xe_live_mocs_kernel_kunit),
> >-	KUNIT_CASE(xe_live_mocs_reset_kunit),
> >-	{}
> >-};
> >-
> >-static struct kunit_suite xe_mocs_test_suite =3D {
> >-	.name =3D "xe_mocs",
> >-	.test_cases =3D xe_mocs_tests,
> >-};
> >-
> >-kunit_test_suite(xe_mocs_test_suite);
> >diff --git a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> >b/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> >deleted file mode 100644
> >index e7699d495411..000000000000
> >--- a/drivers/gpu/drm/xe/tests/xe_mocs_test.h
> >+++ /dev/null
> >@@ -1,14 +0,0 @@
> >-/* SPDX-License-Identifier: GPL-2.0 AND MIT */
> >-/*
> >- * Copyright (c) 2023 Intel Corporation
> >- */
> >-
> >-#ifndef _XE_MOCS_TEST_H_
> >-#define _XE_MOCS_TEST_H_
> >-
> >-struct kunit;
> >-
> >-void xe_live_mocs_kernel_kunit(struct kunit *test); -void
> >xe_live_mocs_reset_kunit(struct kunit *test);
> >-
> >-#endif
> >--
> >2.43.0
> >
