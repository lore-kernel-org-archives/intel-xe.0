Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56D4D1CA3B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 06:48:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E4610E117;
	Tue,  5 Nov 2024 06:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FQjGEUja";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA4F10E117
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 06:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730789291; x=1762325291;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=80KzDZB0b8djRlIbKjj0piYyyd+8x1ZJScgDrvWmKLc=;
 b=FQjGEUjaCdHqxzuxI2Mpi0s/IQWzG2GlbDCgzVZMfNGRpSeE8Mr4oOcy
 5z/ScaTs5BS2x6xvTRZvCkubvJl7c/TsrXVTQzDoAvucALLI+8wAJ5GIf
 e5hANpJJDoFZHwx7PO+p3218/0APftoXHDtV0ARj8n3imFRWpfMTJ+aXP
 QEO9/LoUkYrtnelRH1e67TytRtyjDTCHI/rpVBbzrbfkIgleEOdh5dVAO
 ozyIiPFJdFVv7d84rXESeK8d0/KG4uLlyEfQS81ozs5wZyzGI8eqfh4MD
 44jpzgwj8uOh3lOT/dPq+b2kUrjbvglNd3lEbRU4iQfIghHYc+p7UBijM g==;
X-CSE-ConnectionGUID: mrFhVXLYTsirBmgPBxWsww==
X-CSE-MsgGUID: 14LALs7KQK6U459qpk19cQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30633602"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="30633602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2024 22:48:11 -0800
X-CSE-ConnectionGUID: /dVlMZ2MRDS/h8vfQ5acug==
X-CSE-MsgGUID: suR4+MgGRdCBej2YwHdQzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="83838773"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Nov 2024 22:48:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 4 Nov 2024 22:48:10 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 4 Nov 2024 22:48:10 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 4 Nov 2024 22:48:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rMWOryVE3nVHkLBf1gCoJLw+toujcf5h+OzPCxadmSd4oCjBaL8GkSTFntAhDS3geul8nSC33tsDQ588gppTUtwjnBlszsggVVeqLC4GpsFO1yFGmUB0b4VJlABrTXzuXHgu4cnZEgvJaMLzPq84NobUzwJpg0m6jPEHBmAnwQG3uEepLZgPW2ZWhcmTddlVeHfp6jDxVm20aiExX1tRp5QKuSZ9K6cuRNCiKE47YaJIfarHjg+T6UL8babBVzZ0HZwQHOeafEK3RJ+yfUAD839daaOQn7lNA6O5SFbJuoPMJt1Kvc3mwFQwiezUwBmeZ8rgV+NbP4/C1rKMBRr8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OqhCjPkJhR55T13GJcTDvD1uK15SAULb+gbFgsClIUc=;
 b=h+W6uDOTOwH8K19fLLDvUPbJW7+Mebq2u386aUMzVSIUC4d3Tf1zxpZH4GzUt1QIEfkJgeo6zQhvQT98x3Imt7O4yrGPqC1DJaVNLNuQ5tkpMY4fVsU7h8dK4x0aRotViJ/5lS+1mQbYFhfpbxaMpTvOkR8OLHMIAg3DeyhrzRJK9WAqiGHe76pNFB4tRxJMaL5Tstgepi2C59zN7Z5u052LpvWNkXjoPvvBdvtWq2XZvfzxHBGzgiCvDFmw/7WSiE6mXiGJkouOGQe0schEJbLM5zDn5DFhriaKkLklkWv0HfhOonLJAKPWYHUYCHAkaDBZqo1XrLBAHdLtdGtLZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by MN6PR11MB8172.namprd11.prod.outlook.com (2603:10b6:208:478::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 06:48:06 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 06:48:06 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Thread-Topic: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Thread-Index: AQHbLzwqKxiyU2suF0mc1SIqxSqFXLKoPtBg
Date: Tue, 5 Nov 2024 06:48:06 +0000
Message-ID: <SJ1PR11MB62049695AD27571D6990F0BB81522@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
 <20241105043524.4062774-2-matthew.brost@intel.com>
In-Reply-To: <20241105043524.4062774-2-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|MN6PR11MB8172:EE_
x-ms-office365-filtering-correlation-id: e29967e3-a178-4004-1b3b-08dcfd65cdeb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?kQGQiO9Lfup0OgRyXzyZWkt8X1nsROK6ooIZeFIAznPZNzaXBFeQjHxRG+LB?=
 =?us-ascii?Q?GgJRazb9RjiL4To4F9PI57/AMfp2abRFbrSWfa5UV9+hS4EKCvlwdTn+Xp0o?=
 =?us-ascii?Q?u1vDCrz7gFtnmyyARdqje7R0a8YXoDeBInZf5oWwQNUG2gKN+rkkJZNuuQGp?=
 =?us-ascii?Q?9OxwjxCKplz48UN6uxz63qqE2BQ8wkufOchSnVVoGskzo41H20/TVzMr9hwo?=
 =?us-ascii?Q?04Ddb2CV6AfXT5XHPEmfmF7D+zy80cywgIBA+P2OOWdeUjRP6oPU0lCn2rqU?=
 =?us-ascii?Q?ja9BuSaLwRC7+cLUsQYOrWNzSXAlz836gATMdM8ythGVtxoIaXlFaUgn4UGL?=
 =?us-ascii?Q?YjH+YMf7n3UiPkOc4UMsgYHXOb9XgGOp8EPMZWxm8X2luuwAfTB10xfFWego?=
 =?us-ascii?Q?RhKhnOxzIGFZA5BTaz8eyF21LN6+5lhtp+cKcJLGHkcHKz6YJCSRaPPA5hNF?=
 =?us-ascii?Q?pRm8Gm09ioMpjVx1okejOVQbI9T3N7vXkNzsdFzOBEffGcDA8k8pBt8xesxn?=
 =?us-ascii?Q?qMBgJRYgsEesXaOQ8kZyV7DhtJBjHeejEHDuSvNuf7beZE5Fv4egQhUR5zxI?=
 =?us-ascii?Q?x6Yxx8lIN/0hAWcbPwf+UsUxqra5XhdpHpcCqNffJ3/N6u+OMPOVY3tEfHEP?=
 =?us-ascii?Q?0JzYEyNutUruUtIUuzaPsJ0rvn9Q+oT2nyqSRNj2FGfESSgbNVxz0rfCsigP?=
 =?us-ascii?Q?oUVMrGNmoHIbQ1cBZYQngqh8ogCxgXvBVpJ/6paKhnCNkTeEpujXXle5gZos?=
 =?us-ascii?Q?9HudHmnrP0bbHMO8ubRcUehkxBboBmt+joB5mDjqp3ti97yvquRCNX2KCtjS?=
 =?us-ascii?Q?c5jcIHLQLe448HjNQo+HFM2JAdwsFFdB7D2YothlajoK2QPUOkQDHk4RtoJx?=
 =?us-ascii?Q?jXFP5qrlGrdQOULaxC/x8GgtkTHZ1GhF2qHghB2vDwhrZH/5wQD1keHhGLve?=
 =?us-ascii?Q?YvQgRpPX4w9y20Zhfp91WFTVu2DAhqkhT/hLIjLn67hzLX6qZB2r+Q0isPLx?=
 =?us-ascii?Q?wxeO3FyshQI91XVHqawSgJcqySosKGRLLocOxDozpgYTSaGIW+9h2oHHsefy?=
 =?us-ascii?Q?BPuAOSrE35DztJFDVGnDhAIhd22irMe9UGFT3STb82UjjTf91YPZ/sLwT/D2?=
 =?us-ascii?Q?Bj4Yqup5KqJSpk2+r5THFzx3OoJ74u0sQ6FTOQiqeSReQkT1TGlAnL7opNcD?=
 =?us-ascii?Q?noqkKP4O5GxzI+39Oh4zoZxRlHNgZVjXogGgi8S+nrPBbn1g5TMPhFouUvQx?=
 =?us-ascii?Q?ZbKlZAxhxiS1z+owNbv7VIDJ+y1nD+QA82/SIg47HPNVT+McMwbPduGTIHY9?=
 =?us-ascii?Q?xBbV8++C/7dF7VlllWdyOqrjRq2w4EivVHGLQq+KoscKmTEPxE1RwnM/k0QG?=
 =?us-ascii?Q?hS/XQKQ=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dydw8rmgG5zUHA4IJaAipu1srULWyS2WIoKBfvKFWmof8GLUhqqlLYEc6va1?=
 =?us-ascii?Q?eEwinvv+FSgXlBHn1KQKBMbU404MYNYJT1Hu6Moh+d1tblcdGOHjI6arKtwg?=
 =?us-ascii?Q?fF8DxOMotk0GNjWnCloM7TWwekWoS6QNmCWK878JsFQLK2YWgXPTm4vLd2RX?=
 =?us-ascii?Q?8qj2f0UlaWnOZjv4s1RchqwidGGAYFQ3rdiacVG2DmDPjLhKBw1KJ2JQwJLe?=
 =?us-ascii?Q?GNGADKjTGrXv/MEZNvbegr5OFLXXKA8ZFnc921DqN6xDl/lQRJ2gAiB0MPqK?=
 =?us-ascii?Q?soWYSaXo16CqBGvcOkvvhVI7OcRDr/ZtQwgWMFIAPTJ7dlCMRJiSZthaoASb?=
 =?us-ascii?Q?FZRfdrTPx/jXGhyp3ekwECWMUUeS1xCVXF4kGVn1HyCT1/56yOkpkhzoM/r0?=
 =?us-ascii?Q?xfZ5ZyHpfVbeGoWcFfMcUtXhQeFewWhbsRcOJn5/MpgJG9h00Zv4HuTR07FB?=
 =?us-ascii?Q?XCWuRx90stmDgGuFq3KbVQk6ZF6j84IHS/XlM+sxGbqSh9CIGfTzZjb4Bq1o?=
 =?us-ascii?Q?L4CW6IYzFI5XLpPJahV3s53YiPwzwwHJn1p1MONqkTqJUDAfupPl+h0EkIzM?=
 =?us-ascii?Q?msxaSNvF2TspA31GXbw/247kfl0kGYDAYrmwvLzIhh17u4GmhDpqq67YISKC?=
 =?us-ascii?Q?wqIxRPtlIgpK9jcPBgwXO6T8HTtiCgO3DOjVcOzcdDyVHOyWdCbb9/jw+pLs?=
 =?us-ascii?Q?TNqPF6bkxKo3oHcAgefuHTHt4nimDCPvnKn4umXronM8+eeuWRWEAWDKuTzj?=
 =?us-ascii?Q?YeOJsd8IpKUyHJ2du8F8NDb2iz5Wtu1as0TAPE8boTVGAWVumEm7OO8NcKoI?=
 =?us-ascii?Q?3KEXbxf0YmX+RSUQxLT3aGzwGqDyP6zWJZvqzXu9o0F8cjFYRL3vcICYIxzE?=
 =?us-ascii?Q?xV/COMqBkbY+HDli5gu8ld38fVlpfMAYAFnhlW5iPJd8FSi29h3N31Q8oCzq?=
 =?us-ascii?Q?KMmy7n22CATm1HVqkh/ZHLJqCFVVqqwe02d51WpKr7e4y9cVSx1B77TERvUT?=
 =?us-ascii?Q?inm4eDYA96aSk03HYFWh0lM0M91MFHPrqs53AV9NdiqkOpl7/JR0E1jqpSfF?=
 =?us-ascii?Q?kC1PiGV5EHnj/g163JQncV5vs6cxU0BSzA68yW3Khrn85COUNBEEqRp2njUE?=
 =?us-ascii?Q?a5YKcyAw9vQNYsE91F1HP8inT9+fYHpJbBjignAcKpWHbuULJ8JwtPXgA3D7?=
 =?us-ascii?Q?/kLB+BLT8cCBivC9QQIAWBLohg81iMOdmIFYD5Re76pA8Ga4oLdRs2Ori5KC?=
 =?us-ascii?Q?GBAsGnuMqEtBGgYm5eg0LoLg/6QwjHj55ePGiDp+QuypTTO80E2LEjLn+V0P?=
 =?us-ascii?Q?lIH5Jv5AKJxt5rLdxdu2K8VZ9NKbyA9K1nlY+gPc83qMnKDyNC6lZiBIyTIK?=
 =?us-ascii?Q?CUdhW8F72qSirrj7MlybKACE87AUJhqBPahUwrGmAxbxlwSI+Kac3sToq7zV?=
 =?us-ascii?Q?K/VwdgSwkcCibk/+PqwfdtvIbVAEXphnX69pFzo5iE8QghclTNH5wXmnqmxc?=
 =?us-ascii?Q?L/U7mSC0p2Y09QixavFipeyA+m9cs4yHUY/C5bPajfy8USrQeHNMd7APR84b?=
 =?us-ascii?Q?iM0kzMwir2QIhpoIxopSJFs1natGnjDg6P5A4wsp?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e29967e3-a178-4004-1b3b-08dcfd65cdeb
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Nov 2024 06:48:06.7749 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5TP/Wht7hlvWAwP0CPV48sGRm77bBRLE1ORENzMreKd5gUrFv7Yf77zSJP8nR9CLwIyRWOhd67EZxR/7OwcGz6Y0o+y+Z9B17uI2W3prMwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8172
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
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of
> Matthew Brost
> Sent: Tuesday, November 5, 2024 10:05 AM
> To: intel-xe@lists.freedesktop.org
> Subject: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
>=20
> In a couple of places after an exec queue is looked up the exec IOCTL ret=
urns
> on input errors without dropping the exec queue ref. Fix this ensuring th=
e
> exec queue ref is dropped on input error.
>=20
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Cc: stable <stable@kernel.org>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_exec.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index f23ac1e2ed88..6de12f91b865 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -132,12 +132,16 @@ int xe_exec_ioctl(struct drm_device *dev, void
> *data, struct drm_file *file)
>  	if (XE_IOCTL_DBG(xe, !q))
>  		return -ENOENT;
>=20
> -	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM))
> -		return -EINVAL;
> +	if (XE_IOCTL_DBG(xe, q->flags & EXEC_QUEUE_FLAG_VM)) {
> +		err =3D -EINVAL;
> +		goto err_exec_queue;
> +	}
>=20
>  	if (XE_IOCTL_DBG(xe, args->num_batch_buffer &&
> -			 q->width !=3D args->num_batch_buffer))
> -		return -EINVAL;
> +			 q->width !=3D args->num_batch_buffer)) {
> +		err =3D -EINVAL;
> +		goto err_exec_queue;
> +	}

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>=20
>  	if (XE_IOCTL_DBG(xe, q->ops->reset_status(q))) {
>  		err =3D -ECANCELED;
> --
> 2.34.1

