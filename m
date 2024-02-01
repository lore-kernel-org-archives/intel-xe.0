Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CB9C4828E
	for <intel-xe@archiver.kernel.org>; Thu,  1 Feb 2024 19:12:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31CA410F2DA;
	Thu,  1 Feb 2024 19:12:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUDsv+Um";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0135F10F2DA
 for <intel-xe@lists.freedesktop.org>; Thu,  1 Feb 2024 19:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706814755; x=1738350755;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sRN4vjMiKRZviVUwwE195nQtLVRH6OgJP3crSjghbdE=;
 b=DUDsv+Umq7TBdaJ0CJEBfMWxUDK7zLg7xmcApGehdY1Bkv3vAsjwpgZW
 oLIN0D4zcxvBXBPVbmSgkDjmqQAOSYEMkpohFOL21VAazFuxkGD5TLZ9W
 U4fbvTApkYbEiHhEujE3xHmzfYBN8SezS3NCatleJh9B32/mOBF4x8NcA
 BnDJfUaoxMtzAla8mkaqf++9FmAwP+htwWGvpQgn9IqQywi+NUxYzo2Pc
 waeMGIGr0Af0AwJMjvKQFWhSt+U/oexO6DLUgKVRP/b+a7BYq/uJ6hdFA
 Mg+wRXnUCYLbIQicfAQIYqq7GfNKZe/fmhn3kNcbT4VwWlKb+q6UGZyEQ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="407696753"
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; d="scan'208";a="407696753"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2024 11:12:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,236,1701158400"; 
   d="scan'208";a="4475215"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Feb 2024 11:12:35 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 11:12:34 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 1 Feb 2024 11:12:33 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 1 Feb 2024 11:12:33 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 1 Feb 2024 11:12:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LxGHwhOrKVMuv604sT9AvY8/k6XUyyTFYRJUvd5E2Wkc8lj2UWDj/PlsYczAWbZaq03p2Sj+hAL7gHVKRZGwBOI9sQ+djS79zBEUu6ofaQt+1qERFasizHkuifn9k+Vt0Cq9EqIKU72g9nHzLQ3l9U7Nn6q3ZvdeqrIVHtEjyBbGO2QUYGgg/TJCy5J2YtUUtTQr8mFpFf3V9RUvGqdDPzt5ywLhd8PVmcCDwxVQTI1bK6r0n9WvxLkR/6VueCZskTIBElWZ1Bkf2Ee/Qr6aAZGsSbLMcHuWqEZXLLQf981Pozi2rAjctppeeOAUvM5kvui5X7fLjQypWiQBlnvQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e2rHLyc9+ygArabiKf2YIWFgidhWnjJtuTRCJRu9k6Y=;
 b=BnxUdrTIGML/B3eJF8hylmOsqnmkMwywqpq4j73D/CvRP5MIesYrj58G1s7TTUEFAdZYvuD93YXiMCuXY0ahAXr0tTrzvWDRv2Qw+bdiYwDslR3NcmjXwu8EmQDX1FEgfxHTspbF1BiF+GKtWa+hIbaUpuuNvJSBp6EOziiuxcqiO2gdM2hvPYg6uFemhYf3TIm4tJDrWycFxxTnBXdcenaAGWcEsZzN3OtBm5KtWpRa9zztIfS+nWFISI0cx8TljB8zy5MwMXvoyBPEmfG7SqAV3ub5/qyziv+g5bOdvZtXQp/wIEEBIDopjt2d+rDcJP1J1ribIS4cQ3+JE/FAeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by DS7PR11MB7689.namprd11.prod.outlook.com (2603:10b6:8:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.28; Thu, 1 Feb
 2024 19:12:29 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::b8db:cc2d:d64f:f7de%5]) with mapi id 15.20.7228.029; Thu, 1 Feb 2024
 19:12:26 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH] drm/xe: Drop rebind argument from xe_pt_prepare_bind
Thread-Topic: [PATCH] drm/xe: Drop rebind argument from xe_pt_prepare_bind
Thread-Index: AQHaVUBSCcDUwdygVECsvgNQtjbcR7D12pDQ
Date: Thu, 1 Feb 2024 19:12:26 +0000
Message-ID: <SA1PR11MB69913F3A111FB9454768A97292432@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240201184844.2317004-1-matthew.brost@intel.com>
In-Reply-To: <20240201184844.2317004-1-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|DS7PR11MB7689:EE_
x-ms-office365-filtering-correlation-id: 4812d9cf-e345-4fe2-269d-08dc2359ba56
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 24oStO2nqyPUPRMJZeImaRJEFJ2N9xKreWiKzKrOBIHdM2rcXrfCSbsyPBKPk+27up3jhSkmDnWk7zVDqhgNrt6eBB0Nvg1kEqF+ivDEDXbLz0VvyYKqxK4lyF7ZTVX1q0qczRmKQ979M/cZ90ZpcAIS7seiA9tb9GmW/aylEsHgR80+5X7t1eb/LAsMDc8/oUwrXQwVP3wPLIl//NXvob7RNpSSV59rALjN8G2+gCDP+ejoiIEeJsb+qsunVxpTfLWi3cEdWNtjfLFFvPnVdJ7pnVmWhOsM67ou9ixxtF/CR5/QpVnc+L0F8/Mju43Cbc9LIw84VQGgmVaew/7JUNEPnQXulH9TLZU7LDDf2fetJ6Xjj4pIqKmbnSa7FjbZCW4B3XDCKFTkrHVlAYJa7fPFESx3LZ3Kd808d5yyC3gatJ/4ftvkULP26/kK/NNCqEnJBEnWf8b7DiRgVdO2p5jas+8zK431aOivLwkpCnIJn+3FL2duQGEDcQy+kfJ+i4qpjVoUS3FsfYpSjMDQqNYzc1rS804/x7W9OSD6RjuavwS1Ab+JiXmaFOVQzHmxQj3NaJ1sS8xCT1M7oHYTpk4sONOhhxfBWvP740SRVX5CVGBnIFSRxbMV0Xi2YqwQ
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(376002)(136003)(396003)(346002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(316002)(76116006)(64756008)(110136005)(66446008)(66946007)(66556008)(66476007)(4326008)(8676002)(8936002)(86362001)(478600001)(5660300002)(33656002)(38070700009)(41300700001)(2906002)(52536014)(83380400001)(55016003)(26005)(107886003)(38100700002)(122000001)(82960400001)(7696005)(6506007)(53546011)(9686003)(71200400001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?wYrZPvajrWfoUIk+QvZtNvTYOTm0rBENDJKBdRhqSffC0Tql4qTtJc99NnDr?=
 =?us-ascii?Q?DyTrdiq8jeUSR6KZunm8PbgEt+xCBI5oelSQCXEcWhDoa22mUUWMl82U9/fR?=
 =?us-ascii?Q?YeWEz1EHGcuQbMo5jDIErtLhcBXsl/SOSz3/6k6zumt83b2XLonhpGb3EBzM?=
 =?us-ascii?Q?K9IJgEVJeBi3xtCs2jVxtZnCntd3k6UAmk4wUgnWg6gUgnYiQpb1ICa+mLsf?=
 =?us-ascii?Q?wt5pLAG5w+Dm/iFDp3b1/PASwcmRg1h5chEIjmoIfrsI0mqb82MVW81bhVdY?=
 =?us-ascii?Q?ER8+/I5XB9BInlQN3q267HeJtbgOUZ4wtqwnHJ4bm1ZNL73LMiET7/Zz/D4H?=
 =?us-ascii?Q?axUwcSk4mNLAoHIcFRXqyc1y+rROJN1x+sjmPopQFJRkcMCgx5P5oPr5WBN/?=
 =?us-ascii?Q?a0xnAhPykLET0dHVggcP4k5eqtYpztfMMHBQLOJkeMZRPGSoMs4w7+tBLrE+?=
 =?us-ascii?Q?mPj4ASHIwOjnsXUH5p8RiJstJZO4vpfcGgm6mY4ou0PnTxO2N6qnp5Je+daE?=
 =?us-ascii?Q?mXEa6DaXZGaI3m8nd6AS/AIH94nvZnY3GvNc0SzbqQsvk1GPQc15+WiqrgBK?=
 =?us-ascii?Q?QeopB9UwemFChBfehUVOdht43ncq2FVtMYWnvAoo+LCaFm1Sd4hqZ3fJRzEl?=
 =?us-ascii?Q?PSRtucnwh5WxwcwVLKXfCv+AhdjFHLzMsZc9fZSwpLLZD3gDnPrsJuAyMTvC?=
 =?us-ascii?Q?8CxmjKRIYS0kneNfskWAllujzTq3Mb55vMKw590dPOt62ALwd72xz5zPrC3l?=
 =?us-ascii?Q?Ua8icMI+hAo0P4W7iB1WFrF5fktooj8k4qKTi51UYlKeCl99LPsHHZMx7+nm?=
 =?us-ascii?Q?ua70wkQVMv4Djti/ogz2+EXp5fVjqAx1qCQ09D/8DTkOcVwLOlx93NtpOcIz?=
 =?us-ascii?Q?pJ+8ySjXKR04waSBPAeMjFM7i+cb77uDFiB84T6ov2pRe19dMAOaj7oCrNXn?=
 =?us-ascii?Q?c4pSJ5Z2YASIqojh1ecrEn2Tq34dAVkllPhR8ocTLEIpkJXxQedExzvRmlC6?=
 =?us-ascii?Q?PivJaoVLjzWnNMlfVRdVehRkzyi5spA8e7aT4uOmvpTLgdkv/sFNqkhs2nSB?=
 =?us-ascii?Q?pdetXUcJYiTWdIduMXQ/doGOJORtv3y77VHmn/vf3ghGgI9dDfzbKQClIKa8?=
 =?us-ascii?Q?f9ZCni2VF0ZY5wtbXlZwtqbO4+F5exMf/oy8IQBDEe5lH2vUDNBVR+o+CtCz?=
 =?us-ascii?Q?iDVgqPk6XoVnmP/H+g+k/vOuvTY44hvPhIDNn5qGQ2LEXq5Hr7phwVjNOUZH?=
 =?us-ascii?Q?6AJ9PINTbnkQL/SwnpKhIYl9Une1cUrL7miHBEyifJDqz7gT+ZzHFZAWm7Nt?=
 =?us-ascii?Q?BeZCOOr5Ck47jiBeXa1nLrPO9S5nodlLcDLMw45zy9+MeMaCYvoefrx5U2O8?=
 =?us-ascii?Q?eSPqEOOLLr93UyNOwEBwFIPomg/OmlgrX0IS2lJ41BK8UlTyuWlV38ZQOVLJ?=
 =?us-ascii?Q?tvLP9owlaRiJU1PU+TfkbVAEfNhEJOJXr3MgGyt8Yn90mOLi0r3akA/9y8Rq?=
 =?us-ascii?Q?0Rq1sZ/b2mzZ/oGbANvYQ3wjJHe1P9woWGIl8pclnAVmAtDpXV4iQwFNzkz6?=
 =?us-ascii?Q?6o2j1UPwcySkwaY5FX97KkmhLZahYrpPyfzorOTU?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4812d9cf-e345-4fe2-269d-08dc2359ba56
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2024 19:12:26.4847 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GG9/gwX1VS4zEmYQ94RVqy1QokJy4IiqhFPqUIUhFN0LGJLmWQ9zvsZCNZ5OERi1QtP4CWWsxgGMmEbXMWfsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7689
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

Lgtm, Reviewed-by: Oak Zeng <oak.zeng@intel.com>

> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matt=
hew
> Brost
> Sent: Thursday, February 1, 2024 1:49 PM
> To: intel-xe@lists.freedesktop.org
> Cc: Brost, Matthew <matthew.brost@intel.com>
> Subject: [PATCH] drm/xe: Drop rebind argument from xe_pt_prepare_bind
>=20
> This is unused, drop it.
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index de1030a47588..359867612398 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -861,8 +861,7 @@ static void xe_pt_commit_bind(struct xe_vma *vma,
>=20
>  static int
>  xe_pt_prepare_bind(struct xe_tile *tile, struct xe_vma *vma,
> -		   struct xe_vm_pgtable_update *entries, u32 *num_entries,
> -		   bool rebind)
> +		   struct xe_vm_pgtable_update *entries, u32 *num_entries)
>  {
>  	int err;
>=20
> @@ -1218,7 +1217,7 @@ __xe_pt_bind_vma(struct xe_tile *tile, struct xe_vm=
a
> *vma, struct xe_exec_queue
>  	       "Preparing bind, with range [%llx...%llx) engine %p.\n",
>  	       xe_vma_start(vma), xe_vma_end(vma), q);
>=20
> -	err =3D xe_pt_prepare_bind(tile, vma, entries, &num_entries, rebind);
> +	err =3D xe_pt_prepare_bind(tile, vma, entries, &num_entries);
>  	if (err)
>  		goto err;
>  	xe_tile_assert(tile, num_entries <=3D ARRAY_SIZE(entries));
> --
> 2.34.1

