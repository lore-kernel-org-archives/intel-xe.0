Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D71CCFA13
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 18:40:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F55A10E2E6;
	Mon, 10 Nov 2025 18:40:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gl7z8PSw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495B610E2E6
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 18:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762800003; x=1794336003;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=3whF0CzsMhm0Vz9RO/3cmpzdTm7mHnF0M8gl2bhKckE=;
 b=Gl7z8PSwB1aFBfCmyrr15avX53cL5mjWoq/qkIJlxCyYoWtbvtJBKOpL
 HQv9tM9UCFeuE2Cq0XELlq0OC/YkV8OrbYPo0wTbJLSFXKlKV7aRppgme
 6OTCfJ75LielVK9gdGxt710wKVZmtZQbDI99oI8zJFonIcjTnIxzVD6zF
 qyhOLNANHO+NBZKomVIil7N4p1D54ZKL7oTl8l5TC2JnOWfSQnAnmp1y6
 3H7Q3pAfg9SR4Zs56zzMOkGjdRxsUqyBBPJta0wfXlgZONwUoRPPW/Xkv
 9kw8Y7MKFs2z93CtC+uq48j6auEq0pgcmI78FWRrXNfDnh2SWe9rQNpOj Q==;
X-CSE-ConnectionGUID: 5Xlg4M96Sbe01BuiaphokQ==
X-CSE-MsgGUID: R/N3fyQgRvG3LROm/KN+6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="75962055"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="75962055"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:40:03 -0800
X-CSE-ConnectionGUID: jPa2KrNpS/y1702p8wwbxQ==
X-CSE-MsgGUID: KjtOesvcS966/xfYlUkbKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188582188"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 10:40:02 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:40:01 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 10:40:01 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.55) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 10:40:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lTFJcIxDdgiijCAy4SISK1/wF4KAwyBNRye2jac4oOqLk/DXG/U2iJnuf0Wwjw9EAVfEFPtJfUBCIL8WrCglBmkaZOgdcsG1srrV0y1ij4NdpBaUXV3+4KyaWkJXbvCIdvzCbFZWrVm3PmRXkmpOi/nay3agBwGFka+b+yp2FH0YLIk1sYmTUD9euBAbwrujgHlaBe7RELPJFT454IhxVDMkJp7OUw3O4GQDcNLnRpQOrE6DairaJBae//F9+MQdXcJ9yivT5ALpBr7VRlWr2VuPRJqshCBXhHAF+gLvk+Aj7J3kZ9VV4o8i9VHtGeQ2Y6EmWF5dhWq+NEBxQufBxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuzUH9v5jtGWlA7oSBdFZbcfE4iftq3SJok4nKP6vEg=;
 b=WL3h/akJ5A//kZ2QA0dNOkzcJ2gJppsnk2c/NsE+QMW+LVLRwEldbcDXKuQ0eYhLYirS0ZQO92n0yjCVd6EI9TaiOT+yt+PzRrgUw3ptuTeHfM5J962BK8dTiDSUQtFZ6u3/gx9EFgfooUxB1YpoV0ACVWyiKGEkCz/1CJevlrv+S7CfJTIOn0pznjMwMpbePt2JTzgivF8ZNJmX2CrGaXPRbBYEwdBoKdjLBY3ESdHW+l7teF063pA8vDWwlb/c8jkmMEWIJ8CQqGhycGfFOcAB+lsAbmDWFKXSQjOoCdCXQ/VLgyxDPENbba1ycHtBq++S5rm7KdWWXJFIujHcbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by MN2PR11MB4760.namprd11.prod.outlook.com (2603:10b6:208:266::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Mon, 10 Nov
 2025 18:39:59 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 18:39:59 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
Subject: RE: [PATCH] drm/xe: Fix timeout and add cpu_relax() in
 gt_engine_identity()
Thread-Topic: [PATCH] drm/xe: Fix timeout and add cpu_relax() in
 gt_engine_identity()
Thread-Index: AQHcSDYXfgIp3d0FJ0WL2n7IGC5iw7TsUYGw
Date: Mon, 10 Nov 2025 18:39:59 +0000
Message-ID: <DM4PR11MB545670A37AF86C1F8D50AD75EACEA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251028180454.3599689-2-shuicheng.lin@intel.com>
In-Reply-To: <20251028180454.3599689-2-shuicheng.lin@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|MN2PR11MB4760:EE_
x-ms-office365-filtering-correlation-id: 80b834fd-079a-4fe4-0b82-08de20888d66
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?qdxTRKYIyDRXf7EMpQdFk4wlud+4i6mLg5EWM8mVQANKbxCNze5vth5Vlkwu?=
 =?us-ascii?Q?M+d6IwGJQRWZIwqcswvIicLdHKOxl8BWL/NLt+xexMxIQG8TdYgnX9fKBscG?=
 =?us-ascii?Q?jHpkVCHGK1/lQSwMujn1x/W/NXCwgjkwFN/DvQ6mFZaNdwWrUHOu5RDGTMX0?=
 =?us-ascii?Q?ZeGVeKeZpdaYK7qvRlrYKXNuPOof12/Grl3jKuANY+TxUpyO7+kY5LKjxqNB?=
 =?us-ascii?Q?gZhMW149k4PdE+yVvCdG0d7jRWDV2j3VxiYpqE8exHIUyJLEcLjnoNSjpli/?=
 =?us-ascii?Q?wGMA7cc/9EUQbHEFKNIl3RMZQXcoFAUJ+p1BC1yH1SOvz6E6lb72hs4uNX0j?=
 =?us-ascii?Q?NKRr9Lta5nicAtbXXO7JLNJBfKlFKbfvj0SYbBNxEMu4yY4oItrupAQhIMbz?=
 =?us-ascii?Q?IANUBK6l7oHhdd1zKawX8FMnk7JBYpYXmXUHxhImyIoOSgESUu5vw2VPWd56?=
 =?us-ascii?Q?mJfXludh8oux9E2j4yJePnDKTBkCWNIkG8qAra+37oAC2Ulg66Jze9GXRvz7?=
 =?us-ascii?Q?G92Dfugb9tBWL/IEb24LK6jIV8QlFA+vBjfcPHsDcn1VMT7mQBTHvByMem2n?=
 =?us-ascii?Q?f5GTtlBsHBAIjnD6z1R5fUSoGL4RiSUwphPlhY/mpBuFPCd+Q9WN5S0xu2j+?=
 =?us-ascii?Q?UaTAQtW2ea+wClwlc/szrX4mCLIUe25vEHVwCy05QC48fWxrY4/2GLuoZdBH?=
 =?us-ascii?Q?Dqu0jrUm8CbtejgKOMhMtptcMZ1zLVZocUnRigJlR1YSBJVu4locdpCfGHQG?=
 =?us-ascii?Q?EQpkcrs4ah6LiFqVEX5tGvK10cWb7v89T0Sl+7sF/Lhyh3aOd6btXTFrRKSa?=
 =?us-ascii?Q?iFclz7vGU4F+VNTKnSBFsbp+Spk33KCTe/nY129Jpm2HcBswqHTxIefWg2VO?=
 =?us-ascii?Q?vG3WriDJUDxIq7jtPfzV62GPBFPCA+wHPdj5aDlJhtn94mXsAAWcG9HsCI8h?=
 =?us-ascii?Q?R2dx0gWokjg8VKfmjIpyY4pM3qx3ytXhU3fasyvUE9tUB1RfWwVRja2EvWRM?=
 =?us-ascii?Q?XOkuk3k0EhOwUXQUShr2zRNCFNwD/cHAUlxMzJ8LjyXU4QiBVRVWfDUGI/yx?=
 =?us-ascii?Q?+fVfdpCxniHtmc1BAVd7pCj6RB4XVEKpYRffGAwVTedndGsD64V/JhQrnxJH?=
 =?us-ascii?Q?6hrwoN5VbouLL9I2RgCv1QejNReuKOKP7U8ybpXcE8igzh56mhT1+xPifLlY?=
 =?us-ascii?Q?W7hzqlIN0xl3zuk1zdp5SHXxIb9vq7ZKiIRnGQrcfTwy+5JEG5cD54jrsN3j?=
 =?us-ascii?Q?YTAXHOY2YqpbRNEU3HVbJgF1r7RSA6oeEUv1PfCT3XV4kb+FgtGgG1KpMoh2?=
 =?us-ascii?Q?aw5YYg6R2Ugq7PVXrg/tm4S/ToHwpn1GWReS5HuZxaV5H3TffatETGsB/1PV?=
 =?us-ascii?Q?reLuL4ZvF6vZoTRRI47+JJ4kZwVGK4cWCT5P6FeN7cJcE2y2kitpxJO0X28/?=
 =?us-ascii?Q?N7ZO9+KA2v8axqEsYOzsyCQ9E5QrfyVSWuzMw9WVYbwe/1WiGya3UQX0pssK?=
 =?us-ascii?Q?AGhO+AKo4M317pNCsfB4Jsm5ohVuW/WN4H1V?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?qYMdZ3lEltvN/E07yNzrfN4kLyJeP6VOgtJF2/ul3RIFf4ZNz2quv8KFMzZP?=
 =?us-ascii?Q?IJuISgqatM9GtUqHIhwidvEI9hr6xUohwyELMk8ZLo62SNUaVJEkGjzOGqZ/?=
 =?us-ascii?Q?O/Z1jgBjeSmvU2U8zX/pPcjEzt1DN5SZXDR1PpBEkoWmh5ZzRb0VOKwZhPiy?=
 =?us-ascii?Q?6+xj6RSdn4ZMQCXSOCg2I27/pGwwlRsaBVkNxCwB30E10i1Eni0vbnBwaeoG?=
 =?us-ascii?Q?+ChsjY6uwCJvOAdf7gjmmkO3mjqN/WZuPphd5GSLEwqJtyXsNLEvOnLyavcU?=
 =?us-ascii?Q?2ZoYgTk8zVip8goyKHFMOlI8PnmPFS/ylEQZbA+yxgBIEuB508yPqFjVi/We?=
 =?us-ascii?Q?Qxkqqfve4GBFgGRjMvDampsnqspj6xPB2L+GcAu2fqJfrTi3XTUY9+5q4tt4?=
 =?us-ascii?Q?ola+R3gMEkwsCaYEtfBVtZtUHdnJGNQqddxX/ZSXQsYEqHCGp/phyqWfpiKc?=
 =?us-ascii?Q?y2JsmDPcGZKwGG8yUsc4Jt7Nwa+93BbByui7jmpcEe5PlIDAA9Ab1Z1qxpMx?=
 =?us-ascii?Q?juINNv2scWLwIBY1d8e9PNsg3X1SgHPvyvZPT7XuJm1IHlxOXxiHKscndnmo?=
 =?us-ascii?Q?9nuDtEU99cym0G8KHBBW52ZiQLPQJRxr/zRdPPWq/Xq00EeqkDUxlOmGIPA/?=
 =?us-ascii?Q?Dna+Z/oAHLsHHD/2fwJkAvXVuDn/xa0aXMiEarTdbwRklrbRKtdaDTSK2F0k?=
 =?us-ascii?Q?FN/QfD7Yb/QAwlOteiDO1McqpVyFS+wXc/ekjaFsEgOFGPGoglSacGSg2bcu?=
 =?us-ascii?Q?z9SKuchZWjDtdDr+SxR2VYB8n6kihCYSY8R70oTTHvLaLgJ8SbuKh1T/t4C/?=
 =?us-ascii?Q?odKYmek/D3lp1mvhBiIqCF+99dPmVa9mYA5XAlo22f0EZtLSO/ewvs5NSVVj?=
 =?us-ascii?Q?wtk3ZYBQ2POq0fecX9C4sxD9YMaefUEN+DUEJqwvgaXOtSLZw34zg+FCaZ6+?=
 =?us-ascii?Q?Tm4tW+WcFhGjgeCeK/2A1jTk6uzefrJmSVGUGSj3QwYAIsGh0TBrBcGnb9fi?=
 =?us-ascii?Q?EftrKs30cx+tFhcwrH2kyLIMmIHakA4ukArH1kVqa/sDbLG7GWaMdIsBqRAB?=
 =?us-ascii?Q?e8UlgVFP6Z9HvsdW2Rhg5gHaoEVdBeQSxZQra4z0jt6hkQXO7q2Wsl/2qW1i?=
 =?us-ascii?Q?DrNVrBm/XmzCOUPc45e+/boCWbwOKRHhDp/Mvpzoq3scvkuBg1K1uetaxsqc?=
 =?us-ascii?Q?XVy3JZn9Dium9Q37KN6NzpAE6nmZJDxGRfn3sP1byH2baUepKBRDCo4OdLNx?=
 =?us-ascii?Q?WZdNlKAYaCSM1l5DNhHIEk/k/rPirDu9DEcYgPu9gU9U+vzCKISPyUdBoIhv?=
 =?us-ascii?Q?W6hhnOPBqUBWpFwcjqOVsbTIet5CvtiusGUWoggrG0YGRjjcJZdbfUYlzDls?=
 =?us-ascii?Q?bDOrxhHCN0nrl/RENX5TMLlV0dv5aBkyw4z8/1WM/j9vusprswEIera6zQIN?=
 =?us-ascii?Q?fn6g4eroKM15Mp9oWzo0+AHM3OkCGcJnrAmLOoD+wXJ+Gxqm9HDUbOjX2pOm?=
 =?us-ascii?Q?lVdjrKKuXmBon3kUoXxYUa0K6u+z2remdBq1+QJEdf/gzDCKoHXcynX1q0hr?=
 =?us-ascii?Q?5yMsOJHathYcsGsIW4hbUBUdC1OIdQD4I8POsRQl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80b834fd-079a-4fe4-0b82-08de20888d66
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 18:39:59.2823 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nqpEvPkciRPwnK7SRopeG///B68OPEtKMgHYNzSTCA3kchCxzzW5jYtK+7mnrm1wVdbfyvizOWBTVECpBhRRvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4760
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

Hi all,
Could you please help me review it? Or let me know if there is any concern =
about it.
Thanks.

Best Regards
Shuicheng

On Tue, Oct 28, 2025 11:05 AM Shuicheng Lin wrote:
> local_clock() returns u64 while time_after32() accepts u32 only.
> Switch to 64-bit timestamps for timeout calculation to avoid overflow.
>=20
> Add cpu_relax() in the polling loop to reduce busy-wait pressure in IRQ
> context.
>=20
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_irq.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c in=
dex
> e5ed0242f7b1..e1a459744ff0 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -274,7 +274,7 @@ gt_engine_identity(struct xe_device *xe,
>  		   const unsigned int bank,
>  		   const unsigned int bit)
>  {
> -	u32 timeout_ts;
> +	u64 timeout_ts;
>  	u32 ident;
>=20
>  	lockdep_assert_held(&xe->irq.lock);
> @@ -285,11 +285,13 @@ gt_engine_identity(struct xe_device *xe,
>  	 * NB: Specs do not specify how long to spin wait,
>  	 * so we do ~100us as an educated guess.
>  	 */
> -	timeout_ts =3D (local_clock() >> 10) + 100;
> +	timeout_ts =3D local_clock() + 100 * NSEC_PER_USEC;
>  	do {
>  		ident =3D xe_mmio_read32(mmio, INTR_IDENTITY_REG(bank));
> -	} while (!(ident & INTR_DATA_VALID) &&
> -		 !time_after32(local_clock() >> 10, timeout_ts));
> +		if (ident & INTR_DATA_VALID)
> +			break;
> +		cpu_relax();
> +	} while (!time_after64(local_clock(), timeout_ts));
>=20
>  	if (unlikely(!(ident & INTR_DATA_VALID))) {
>  		drm_err(&xe->drm, "INTR_IDENTITY_REG%u:%u 0x%08x not
> valid!\n",
> --
> 2.49.0

