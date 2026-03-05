Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADDE8F30924
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 09:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7184110EBD4;
	Thu,  5 Mar 2026 09:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMJPD3iU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6043D10EBD6
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772703115; x=1804239115;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rilCgcd+LNati83LDxbwV6qSoHQEP7F7wygyua8LTQQ=;
 b=KMJPD3iULT+KB4WXklL+/QTS9nRSmN/oxYHHDktZUF+FEDJRr0iAvWez
 9e05EvBwiLIAUzmRA5J4a1cD3jiD5QQZ6ssOMPmvkh8UlpGYqkPYr32SQ
 y5o+IVQ6YW88q/okbZQuQTKxBbvsIMz4q9ooLgTLsLoTa0BdahSPqmUAK
 dPAug+A2HlRGCuGK7I+/fuWLB6mm5z2VPAxBQvCnWZr0FNfPE0nC1pq8w
 xNl8CdPeNObF7cQAR25YX5EPQMF8pmrVGi/XZgxNIYWsfFHhYnJB/4U+1
 eNBdazAzK8eRir/C9khXTZHQjfeuoYapn8Z5tAn8cC6BakyyPo1l97EG7 Q==;
X-CSE-ConnectionGUID: FOUX4FaGThO380tpeRXf5A==
X-CSE-MsgGUID: /gfDMhS5Syqp06xEcMQIVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73754399"
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="73754399"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:31:54 -0800
X-CSE-ConnectionGUID: 5q2wlFjFQh+Ox0/caFHTwA==
X-CSE-MsgGUID: /C2lj2VpQui6wf0rZaItMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,102,1770624000"; d="scan'208";a="216434359"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2026 01:31:54 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:31:53 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 5 Mar 2026 01:31:53 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 5 Mar 2026 01:31:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q/KAi8NF9gq0oe6xga30BWT7741FET3MihtPI80L5f1bNiKe3UM7+aFU8gGQJ4PdGXJuXm86QKlUBkVy5XZtFKTzuHyHiHeos2+Dsn6qpud6EBvQM46bY6jQazXCKNYKOD47x6Z87xO+HF+QrYSFROVmtMVQ1ugtOu8YtvXOznQXyXUZqIDEX+BJLg0lD6IgiKW0HM60QYnjdeMwl6ZakjqTVY934EP8LLGGga5GtU+fV7yQezCHSqO+1riWgBo6BjeMYJUBL8X6xyZGuh90IWhS22E8A4r21OYW/oTwO9vMDbDYaPxm4RGyT+CmAZJ/8UGIWFQfe/7gsJFcUY3TaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQe2t1iLUBesTyNDr4lrFLslsZiw2uP2Yzit7+FVgds=;
 b=pN16g7zu4sRMF28Ul/xKEgN/A6Cm5a930/03eXYyvfPN/kVOcV6sC1hWkqfm8YfaDNVxbqj00dsQPSOTFSOh5JhipA/5fqWbHur4/bo1cwDqG1WcTEeLicVIiaxfxHzeveH2CvvCWYYjtYTrbq9sTjUf0kBsNJd0FfMnMk974n5teAouyeRIRPO55LBx3JIHY1SpITqAndaDJS461/6F5TB6BjAYG+/YwQDIf5oQv/XevosRbxdtKFrJjGkk0oMLkX/cCSreDid/urRX/dNoljmTmvu/akgZ9IuCE1jnkrRsZgAwNy2ZzKT3EJgVTMhAEkDNNQW0CpA5qgk8lnBBug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by IA1PR11MB7943.namprd11.prod.outlook.com (2603:10b6:208:3fc::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 09:31:51 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::7c84:683c:21bf:e437%6]) with mapi id 15.20.9678.016; Thu, 5 Mar 2026
 09:31:51 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Gupta, Varun" <varun.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v3] drm/xe: Add Wa_14026578760
Thread-Topic: [PATCH v3] drm/xe: Add Wa_14026578760
Thread-Index: AQHcrGpjuCRel70n802yifcZiDwQE7WfrLKQ
Date: Thu, 5 Mar 2026 09:31:51 +0000
Message-ID: <SJ1PR11MB62048689AB2E55DDF944817D817DA@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20260305063553.3665044-1-varun.gupta@intel.com>
In-Reply-To: <20260305063553.3665044-1-varun.gupta@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|IA1PR11MB7943:EE_
x-ms-office365-filtering-correlation-id: 596f01bf-392a-468a-8ae6-08de7a9a0813
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|376014|38070700021|7053199007; 
x-microsoft-antispam-message-info: 2Ja2n4WSUoBKJgEv2V7qesVa9/o0+/K2mzs/iXJf1/Fa08W7hg96w3AF4JYRJ6qmQZucA/he+1TYLUPWWdTJzXwq98xwa6WWZp/XOybmo0PRgpDZoeDpFd5DQcTr6TBF9FdDD/dnJBC7Z27wV/moLpA5wgsPGnlSHfG/f9G687Pull4/1PhoIDbgrNjntvM5Lqht8iU4W2DpLSL3PRjgVql1DItnZBqMaNx7UaeJjPko0lr1ZSMEM54+n9wdiZBFjzIw0VLfZ9/3Qcbng9gzDLfmwWJSs+/SI2NLsqL4EYkNvjBNqEOthDz3/4rZfgRV7mxhjRnHcZtcPNQ+hg10eL5OCapl5YJbtJr4P8T7lektbfVIFyMQ5Eid+I9WyKSKBQ3qFOmY8oAZosd1hDvK/elEseBjca8doUasHcA90rxOnBGqZYrqJscoCUZESqzcwb0+p8Stih2VW8/D9Dl5dp/9HwSGGLCOnzfVqpnPmg8pKMLo6LLp5l4TfFUEL4xMp/ZWmcu3T/ba90HFcDBBsCtS92SFuqFDXynW+/6CiozASJ0BxXr6fGray2kUQabXsr5qZs2vrXTmPwTAEMBja37kFolVkPX3r+vNuap/XzczhEwpNia9dv81E0K/WCUiyds/Awgawzz67hVtLPKKqMxZ3Tk/PQFH7IsUgskAsYaHbR88y+JkDXuTXHS42kG7FIRMe/gZ+8KkA+HUhQ4GxTeDQxwgp7kjQ24pBZaWVC35tdH/njl/e/AX58FLpbeksYXcANVhjCBUZ4wShOYYebzcpvu+cfb+dz+dlRupwqk=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(376014)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?8ti45bhfcfQS+bpyztIuKlslzozI3AjjZWpdKCxpi0dbd0yp3x/rR0pXIaME?=
 =?us-ascii?Q?6AnTXB0fp4MYhum+nJ9hlNdhr8BvFVGpRGsoWRDWAJxiEqFz32jGrUf2HaA4?=
 =?us-ascii?Q?8oCKzu1pJ6I3MeCY2FEzxcWg3JgKWaI8JZAeSD8CAO99W9ROYicNV55MSyEx?=
 =?us-ascii?Q?YEo4EOZf+XrRUaALCURiTJTfMHUg9EXBDOQX1EFX1aDenPiAFKVRdtEu7b2z?=
 =?us-ascii?Q?8fNT0irdz1T89vkmMu2aDYAeUbNLk+0z2DXZS8CrTX/LoVD76nw8Bi3EmFXm?=
 =?us-ascii?Q?JQEuRJZJtHKKf9my2AEYKTTlVi6MwhrE6r71oprHs37CSspL+OEkc6Ediycx?=
 =?us-ascii?Q?vOWJD02xnSJGGi1CFnmNHSkazwh+9VrGy1Hkgr8QDsCLxJ3SY1uqgHPo6TOJ?=
 =?us-ascii?Q?ATC5qRQTyUuGxekuOF+DPW4yuCDvaeP21Chd4eqspwT7WxOxRfZ6UjV0xmtY?=
 =?us-ascii?Q?4nvS5gEHXEt6peW5Rk2vbXWUfb1DSLJMhyaJ3yXjW+6aLHX9IJsmhr4S7vkG?=
 =?us-ascii?Q?cbMogIruaV63V6kBUnWy8Q/40obwza+SKfHXOJFUQv14xdybWkiIBhrbRPHM?=
 =?us-ascii?Q?T+mTl0nObtZrGc0TEanNMleoX0v988IKerK1xCw4RyWNduEu1HE2CV023RDw?=
 =?us-ascii?Q?q9w6nFnS1dCV1AFpDi+OWsYGklRDxLDlcl39RAhx3r2fth+ueqLnMHXENxL9?=
 =?us-ascii?Q?TxKZU4ou8Z0NOz0VozuTj4ZKCicyC0RQLiv8u8kRLMNbXscAcDiOJVk1V66r?=
 =?us-ascii?Q?HVJlRVn6vjVSIfDV48287V6UP3uNSgqWHW8gnpY/yRyZ8dyMjBlRUmYyWcOz?=
 =?us-ascii?Q?dLmqxZ43wmDZAh465dERdl7aImKYDkf6x50bwHzP6gwjVOhmKpbAiEP2RPTK?=
 =?us-ascii?Q?RAKFNX4XF03+E9OQ0kS6mA7Fz2Eb/r7f6TIn8g7/uPnVKuwwDmINRd7jW7WR?=
 =?us-ascii?Q?T1eY026JPPL1MjLl+RVRVsAXUqmXeph83fJLGVvyQUoSfG3Yp3IdNH9PrOAi?=
 =?us-ascii?Q?jj7jRRnFG5aacipNMrfhoroAPR8SFLPoPsbU0I4patRQbm8yeqEEWnPlUcTK?=
 =?us-ascii?Q?xwvkc1cUGuNYaWVtyJsF1fCvFdIyurZuSK6iTjxL/9uL5kua4D+mgucIwWgt?=
 =?us-ascii?Q?mH8YQsSn34MAG4LfATeu7RkKZCayz+ld7jMXK8JxdBA7vpw6db/JDvdGXAfk?=
 =?us-ascii?Q?4TQftbLPSGS/wiV29LCd7SJV5yvhmZAFcpCXjofzVeYQSQyWCXzDudfWyYQJ?=
 =?us-ascii?Q?bJMkzb4Xds8W8xgIlFtBm756VqPiOKp6AtGpTapnU1CU2Gi507wEXCm5OQw+?=
 =?us-ascii?Q?ZyISnmC+padpA/S2L0pkSK9VUt2N3tAxMbe4t8SBwOp6Lc+FmEpsaExW/8pq?=
 =?us-ascii?Q?WpB1pbvI1/lhCogfpr2EXIiOm6XP+AKXCu0Usm+sQ+LK913B0D0dRrY1B4O1?=
 =?us-ascii?Q?rRMejR1bNB49es3K5X58LhcawbZkDSrTEOZmI68ahi8G+RCNp0G4uzWDNitc?=
 =?us-ascii?Q?mRnoXrmrAj1K43j2LPArmubHD9CUtFlZOKcdwYXGhOX6HhSSUCgB8QBS4LYi?=
 =?us-ascii?Q?IFQf9Zbjn0Ih5Oh/h3eIlGbM4YiiE9c3ScwfrF8b8R034q8iSqLMjfsRQmD/?=
 =?us-ascii?Q?TG40yWg3g2duS435KAzOPsUuTfWKNmr35tqXxj/GSr+73oaivxE5Hib++n4w?=
 =?us-ascii?Q?d0y0f+lxLiH6uCLxMoNEfg6PXryi7z2JOb6npmfpdaXFgfk3osVxKvhd31+2?=
 =?us-ascii?Q?Bs3w0fbAgb1/9zkeQCJcFVN8vPsNzf4YhDN1O5GvUKwutkh7/8iQGMekDUF6?=
x-ms-exchange-antispam-messagedata-1: ynwW6uaQMHYK9w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: qTe+NbRLkspMnhUjsOFDECWxpVQK7zYIUaYYiL61Th3ixH0OU2INn8z6KwD1bc+h1qn1LchrMKGUWckjmffkWQ6lCY2XPmhkW6mWI8CYlNlNxRQNo59jZoFQG5//hXLFeXVBcgAUbArl2+XYCRF6ZclE9eM57P/wu7HxtYcZxF0GsbmkYfPnu7gcIuLznfz1QsmJgQ8YiiAZXRtck6tNel86c2i7x2DGIZEn0rzpfrB4EKlP1BVIrWW5GzIE3RPRHg3g98F+BCRMxNhD4edIm6XDNZLewCY3XR55A7gHDByYPAAT9AZ+AoRbFvqZdJCqAeACLVSr/AMospBlH/7PxQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 596f01bf-392a-468a-8ae6-08de7a9a0813
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Mar 2026 09:31:51.1768 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BU9uWyCXWNKxRJ01O9W0B2/Sfv3hPPcMO2uUF1ucl3H5fWfQw0t86C9EBqkbkUwCDbP3BwEcy/DNVRRYmSnAETm8fKOjPk0FU91Ju2b8yxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7943
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
> From: Gupta, Varun <varun.gupta@intel.com>
> Sent: 05 March 2026 12:06
> To: intel-xe@lists.freedesktop.org
> Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: [PATCH v3] drm/xe: Add Wa_14026578760
>=20
> Add GT workaround Wa_14026578760 for graphics versions 35.10, 35.11
> and media version 35.03.
>=20

LGTM,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

Tejas
> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
> ---
> v3:
>  - Use separate register defines for graphics and media (Tejas)
> v2:
>  - Fix register define ordering (Matt Roper)
>  - Broaden workaround scope to cover graphics 35.10, 35.11 and media
>    35.03 per workaround database (Matt Roper)
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  5 +++++
>  drivers/gpu/drm/xe/xe_wa.c           | 11 +++++++++++
>  2 files changed, 16 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 90b9017770ea..c4da4a5c02a5 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -100,6 +100,11 @@
>  #define VE1_AUX_INV				XE_REG(0x42b8)
>  #define   AUX_INV				REG_BIT(0)
>=20
> +#define GAMSTLB_CTRL				0x477c
> +#define GAMSTLB_CTRL_MEDIA
> 	XE_REG(GAMSTLB_CTRL + MEDIA_GT_GSI_OFFSET)
> +#define GAMSTLB_CTRL_3D
> 	XE_REG_MCR(GAMSTLB_CTRL)
> +#define   DIS_PEND_GPA_LINK			REG_BIT(13)
> +
>  #define GAMSTLB_CTRL2
> 	XE_REG_MCR(0x4788)
>  #define   STLB_SINGLE_BANK_MODE			REG_BIT(11)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 26950b8a7543..fe6e42517799 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -164,6 +164,10 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  		       MEDIA_VERSION_RANGE(1301, 3500)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN,
> DISABLE_SIGNALING_ENGINES))
>  	},
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3510, 3511)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL_3D, DIS_PEND_GPA_LINK))
> +	},
>=20
>  	/* DG1 */
>=20
> @@ -303,6 +307,13 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3510), GRAPHICS_STEP(A0,
> B0)),
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN,
> DISABLE_SIGNALING_ENGINES))
>  	},
> +
> +	/* Xe3P_HPM */
> +
> +	{ XE_RTP_NAME("14026578760"),
> +	  XE_RTP_RULES(MEDIA_VERSION(3503)),
> +	  XE_RTP_ACTIONS(SET(GAMSTLB_CTRL_MEDIA,
> DIS_PEND_GPA_LINK))
> +	},
>  };
>=20
>  static const struct xe_rtp_entry_sr engine_was[] =3D {
> --
> 2.43.0

