Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD1EC35FFC
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 11:18:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AE3E10E542;
	Tue, 25 Mar 2025 11:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="POwqOM9r";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D3B10E542
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Mar 2025 11:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742901521; x=1774437521;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o69+fbgDmPoDNVVeOPO8GPQJS1DhxdTQ/oGwNulXrnk=;
 b=POwqOM9r4X6J1zIx36rnZeSP7n7cPXlEtzqN7GU5g2JkLqF8US06BQOJ
 H1gCSejgVwMuhWSi7Q2dLTVY6/q3WfYX29EQx0085CnWm/5lQzCfC8YWC
 jzZMLzpwe2ljxTWDbKGkm7Hyd4lUd6e/AG6bNafxdfbGQkd+CwTGWVSeY
 qzVCTrQcjJjgP6j4ghYNkgdwyuDsIzaQoNxCRynFcuHvMF9FCMFaXRxzA
 lWFgHlaYYXNF+Ux+Kd2iZSUcYiW4Ip6hnWfbOLCBQv30utHBS4QhBvO1X
 RuM9MgiFZQRSU0z0nRLsMWt3t67YCaSfQAxqQ/EWVU+Elm6qKcKIy24Rv w==;
X-CSE-ConnectionGUID: Y3Gg7IzuTa24qECtTWZuZg==
X-CSE-MsgGUID: hFcCuloKTNqQ4DZigFD4fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="31744941"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="31744941"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 04:18:37 -0700
X-CSE-ConnectionGUID: ap8w5FBNQz2uPMjNwKG18w==
X-CSE-MsgGUID: pmEqSrNFQBi43NE7jn9yXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="125130274"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2025 04:18:37 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Tue, 25 Mar 2025 04:18:36 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Tue, 25 Mar 2025 04:18:36 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.43) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 25 Mar 2025 04:18:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M2Rf5bK4loGdsDi7qEAYnEeOebrqQapb1bw/7TiXvGmSsTJQFw9RVbQQTV7hCgA/3qxRy/EPVIoN3niJpNndHFtYj1zb9/nH7P514M57bEKNvNrFqMJyVHGe4OTBNGlybQFpUfxolRIh0w3LXo+KfVSNdL+D7t267FOOdspxDgRyvmJwyCCXpDtRavYHzI3iE/J3dl+dtloORfgXmUm3f83EGrImmIItT8Q5tToI5KfpVfUZCeIM01ldnk0y5E561oaeU3Vdu2W0C7JM2o7/Hi0oe5UkqA/wBX3sMf6ya5JZhnYL0qCikc4TfKHL8a1Kse7Lg+E40FGcwfwigJPYqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R+hAXboKwHB5LPl+tw0v13dXtIo35mRsdUyD0JWlta0=;
 b=DJXuIkaRShhvYsEqEEgF6i6ByEo8FNwA/N5Ip0eI5JhLPaqGDXN7Q9Kgl4h8Vtn2/t+x/6+KfR/c1bmG8Q76ZIHUTb4P6+N8bqHIYZyXn2YRHgAPDGemJSwjQ0H8ywUiGy+hFKH8bOzvL6Q49/hPjpgFrZp5aQ0X8r0kqFVamaMtDxLowtP6uzVBJj+kXRyKIQk1kpGnMshOX+vYBKHue47IzMipupl95J2kiR8UoPO7f6qGZdhWN5Pl6XQIFg2O8Nsa2StiL4ONR9rEJBBs+FgJMNDxB2ruKV5DZ650K/nbBa5Ti55SDyMd4bPe9SedatEw2yG7zp5+sp5Bg7sMRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by DM4PR11MB8204.namprd11.prod.outlook.com (2603:10b6:8:17d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 11:18:34 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%6]) with mapi id 15.20.8534.040; Tue, 25 Mar 2025
 11:18:34 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>
CC: Intel XE List <intel-xe@lists.freedesktop.org>, "Siddiqui, Ayaz A"
 <ayaz.siddiqui@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/xe2hpg: Add Wa_16025250150
Thread-Topic: [PATCH] drm/xe/xe2hpg: Add Wa_16025250150
Thread-Index: AQHbnVHIaU8jIAN/vkiXN9I0wGnvjrODs6qw
Date: Tue, 25 Mar 2025 11:18:34 +0000
Message-ID: <SJ1PR11MB6204A5E9B5DDCDB283F53EE881A72@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250325064434.970748-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250325064434.970748-1-aradhya.bhatia@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|DM4PR11MB8204:EE_
x-ms-office365-filtering-correlation-id: a502a227-8f4b-4ecc-a924-08dd6b8ec803
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?VXBiTtPc7yFSTP5++IOad330t9fQ94TyypW9YglddspVBAA8EB4hXbbuuHY5?=
 =?us-ascii?Q?wUHI33Xt4gdtvIbDq94hj3yE6rx6x/V3OlbnO1Vy3f0h2EX45G9H4pCLQDW2?=
 =?us-ascii?Q?n4vZ2+b2tyGI8clsC6EY5aR/k1WosfWyaSgKpR5FRfDhfrSqld+hGDLVi1lF?=
 =?us-ascii?Q?QL9Ev3W/u6e7Ll3FPiW322mkj6ogrMEqPl9SUHJN9vzw1z2sQI1ZM5HT6alX?=
 =?us-ascii?Q?MUzShRHgCf5sPZEbeUxyq330ty76Yzi9v7KdYzUSAp3CDPhpAd4eHh1ap4Yl?=
 =?us-ascii?Q?ThixKCg3GWalaUYH3GPujNnnDykMukj4T8mlbcY8A+hUJojXBl8fgS6ArFgW?=
 =?us-ascii?Q?AnZ9MvTLKy/n1+5h8KLd3wBI47sCifESxJDnBlW96IlDVcuvF+FTtVycQBR7?=
 =?us-ascii?Q?lGBt6/b4FmHREsTdfjuuUnMj87jusCLWgAPfNkcX1kqW1Yn+eOlOS90PsXoC?=
 =?us-ascii?Q?1sLLaVVYtTZM72adO8aAMy34h4Yr/4lNfyxVgeuvLUUAVcUXRiyh0tsNWNFD?=
 =?us-ascii?Q?gLlaskTJNySwIGH4dwjCQh30NFgGnzWEFuwU8J5PJmvjEJPzSPkgDIi0MW77?=
 =?us-ascii?Q?ioUuWpbOD6Kb78atCfApTH/TPDEXFMiLenT7TM1h8bv97CIaGaveOvWCrxxl?=
 =?us-ascii?Q?5buIZAYY75HQRwSSNQCyS7vkIXPh+uGuwQBcwv+Sdf58O8IWNxGMJhz4EdEu?=
 =?us-ascii?Q?w7U4MCbqzH0vXxtgkhd3px5sJgM/B4HsZUYSh1B6/m4/K8PXZYCvDqxJGv49?=
 =?us-ascii?Q?qyw6+4bH0CnkEKLuA3OZJ04TfbNgiBt8sxfB9ARy3SdT4KKv4n41s4gXdy5R?=
 =?us-ascii?Q?pEcBNWQjyzGwGnKchowc2V1H+teTo0I+n/hA2o4UUV0gRO1e3YJIWn7rlwIJ?=
 =?us-ascii?Q?P1wYS2V04jfA2EFZbpELqWvK/SsTFkOSfoMCfcQA0cPKXAd2/wCDjWZAfXNT?=
 =?us-ascii?Q?sh6fTy8VxyueLHuMWXRp7ahMPYAA7z4l/NaaklZiWdDMiorirJZ2tmz+DksU?=
 =?us-ascii?Q?nMSqkIfqm3xmIHYbTjT/VIt8Hzqc4sxDruuh4NBRTxfO1HIViq7ytKKRAzY6?=
 =?us-ascii?Q?J1S6wAxzMRL8p2glooefQzCflwwoPgXZvfGNw+pyVnWyziiDeByVVsNsy9hf?=
 =?us-ascii?Q?p/yT5bCpWh8whnhAwwpRkfsXFCpdgBQkvobIm6138px8nSsLT8TkaU6e7CZW?=
 =?us-ascii?Q?zFQyPIxCdMe2MSZAU+subeg4cInqw23Fkgf1T1nokxr+Wzh8lC+noukzQexP?=
 =?us-ascii?Q?RvvpNu/dmHUXgFl5png+/LUMIkzDq4ju1MZG5z273mUJGB+VPu2/Ci+Vh+LD?=
 =?us-ascii?Q?XA6a4RsUFHLOnYSnhHPdDM3o81vjD2Npd3cd2gqv0tWLp8mfzp6d60Cfe8gN?=
 =?us-ascii?Q?Ph9agZSpcZKl+UBi0W3tAiAuUYbbnhkalUYsuwhxNwtQb+IQAtMOzftlurY9?=
 =?us-ascii?Q?T3sfv7LQyHpn2GV7+ijKb74puo6wa9kn?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1Xkmq1Y9DanFMl0JUPoTVaK0X77VsbXb3Vrs7BFVxZNKAx4o0Fs8NPZhsTUC?=
 =?us-ascii?Q?6yhtZ9Fcz8zemkb5ZaDCU36q6y2E/QZGKYuGOM3xy7k8DfEp4X54Fko2I3CN?=
 =?us-ascii?Q?A0sM18nb8NTtixeIpsX60NvHIRRX2E6bFeElZw7oyZYVZd40WBexd9bNQ0kG?=
 =?us-ascii?Q?GFKiN0lugCBceqap2VGnGxJm4C/FX8B+lkVSJ+kW7MDWSaxnk3fwOjA7xjXC?=
 =?us-ascii?Q?+c7EwAVAuwAlUDPOqJpAJ7rpJwLB4geP7QLAygxl4Qpee3g2A1Rz2g5bkDzx?=
 =?us-ascii?Q?QBVs7YNGWlUY57emHecfN77HIIaD8AuTaaYAz3xG/gsArQwx5Xv2kAIIRULh?=
 =?us-ascii?Q?NEAw/Lrr5Fq7cLQljlbBwVbAjDr4dZGj1YA1PMVxGdoiabTpug1qqZbvzWJU?=
 =?us-ascii?Q?2M4sFKZRYfBK7eDht29qRJAG/QOWpjemVJz/itPLtiYYuk0ByVXqxSeyaclR?=
 =?us-ascii?Q?PPHectHX/Z0sklr0hqBqquQWD52JLjkH4VzrcdgUgTBAdZHqcU/Dr3UQOiuX?=
 =?us-ascii?Q?dVI+2HSfrUpuEFnDulH20DKb6Kb+gpngt+34SJIWtiV8nVJEBt3U5VddmW2P?=
 =?us-ascii?Q?ALLJ4cPKn+qqqCoelwKB2xeLt5ERr44uiiTE6W+aiXXIhFOZUCQLjnu42jTb?=
 =?us-ascii?Q?AvdjqYyh21eapMrHuQ08UrnXgl7ZBjHf4ZuoCKREO534rP/SbvzhVAq8fmz8?=
 =?us-ascii?Q?9h+1gJ+1uAbv+98EnVty2CzCgZRe8eWHO3vXKHg2apmeiqyl9xmqfUFOZga5?=
 =?us-ascii?Q?JA4AFGK75wyGfrtd0w9Z7ZB+VATotK8eyA26iWotEYmw4vcHdQPttc2gI+Ka?=
 =?us-ascii?Q?rrKTyfFDAOp9ceIGWBnqXIAp/TvHQiTczFyzAgOX1U1gvKnFzAQtlF0CJ4uD?=
 =?us-ascii?Q?V0LsdnT+qdJzbYDcXdgawWT1R4+8zFv6xlyhFOrixQy+U9JCNQuBMJUOn9zU?=
 =?us-ascii?Q?cDen0+sFVvGk4//eHxugNecJms8msJLKsJ3mPOPw1YiELsBSi0A1L2eqnQ7v?=
 =?us-ascii?Q?/iY9ZuZyq+nkrpY4cD8Lyzgq2AKGfYXl/N/fLuSOHQ+/EefHP3eST9eFzzQH?=
 =?us-ascii?Q?bbbGtbUgpoCRyqnWWxiENgi4wlqOfnSvS/Stxd9qheFZw9kJTey7C4MxWkw3?=
 =?us-ascii?Q?wRPP2vkInB1MJVtBJPTwXWnx5ev4UW6q95mh5h+bM/+o3P7I0YddrL1wCS6X?=
 =?us-ascii?Q?Hm5Ofs9nEiwPQjbhR1M10MB0++EY4HaX42dIWZFVlcjG+PUWdTE7Lz78OCU7?=
 =?us-ascii?Q?1PDhamxFX4YTyQGvkd2y419gjr3X8JcL6HrpChFhqdY4b4K/ye/2n1/idJl4?=
 =?us-ascii?Q?sVZ0BaLrcNlSQkbOKTsowK+OENQn0KD9uCc9mj9saKSPfHAfmZ83F3L6+11a?=
 =?us-ascii?Q?unIS6k+NHsNK/T2RUXe9hAfXKmmo7uK7/89zAs03vJWs3j12l+823h8VJb24?=
 =?us-ascii?Q?892IUKl+3C09dwJoshJ3Q1IuJSi7SXBxwDvOCOPmMpOKH4M8QH655/jqY5nj?=
 =?us-ascii?Q?N2/3jcLLrvvfXLHPJbFYdKje56fqPgcsZqgUKuLcGFhXma8d6yN/2q3F0yoT?=
 =?us-ascii?Q?aLd0vlILwy6PLw1UbOBvpkou/7FmuwQxLjCELc15?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a502a227-8f4b-4ecc-a924-08dd6b8ec803
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2025 11:18:34.1182 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jc+O8n7uBfxxYprAr9e8OFml4mJsQpICotcZ75JFdiaJfLZIBH9h2fXnhlUxG8NjgogVam7FNCEk3NSQ6eOKLPVYYL1F6vFE4KhL3NtP6HU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8204
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
> From: Bhatia, Aradhya <aradhya.bhatia@intel.com>
> Sent: Tuesday, March 25, 2025 12:15 PM
> To: Roper, Matthew D <matthew.d.roper@intel.com>
> Cc: Intel XE List <intel-xe@lists.freedesktop.org>; Siddiqui, Ayaz A
> <ayaz.siddiqui@intel.com>; Upadhyay, Tejas <tejas.upadhyay@intel.com>;
> Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Bhatia, Aradhya
> <aradhya.bhatia@intel.com>
> Subject: [PATCH] drm/xe/xe2hpg: Add Wa_16025250150
>=20
> Add Wa_16025250150 for the Xe2_HPG (graphics version: 20.01) platforms.
> It is a permanent workaround, and applicable on all the steppings.
>=20
> Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c           | 12 ++++++++++++
>  2 files changed, 24 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index da1f198ac107..5c1946f92e0c 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -392,6 +392,18 @@
>  #define XEHP_L3NODEARBCFG			XE_REG_MCR(0xb0b4)
>  #define   XEHP_LNESPARE				REG_BIT(19)
>=20
> +#define LSN_VC_REG2				XE_REG(0xb0c8)

This looks to be MCR reg so use XE_REG_MCR

> +#define   LSN_LNI_WGT_MASK			REG_GENMASK(31,
> 28)
> +#define   LSN_LNI_WGT(value)
> 	REG_FIELD_PREP(LSN_LNI_WGT_MASK, value)
> +#define   LSN_LNE_WGT_MASK			REG_GENMASK(27,
> 24)
> +#define   LSN_LNE_WGT(value)
> 	REG_FIELD_PREP(LSN_LNE_WGT_MASK, value)
> +#define   LSN_DIM_X_WGT_MASK			REG_GENMASK(23,
> 20)
> +#define   LSN_DIM_X_WGT(value)
> 	REG_FIELD_PREP(LSN_DIM_X_WGT_MASK, value)
> +#define   LSN_DIM_Y_WGT_MASK			REG_GENMASK(19,
> 16)
> +#define   LSN_DIM_Y_WGT(value)
> 	REG_FIELD_PREP(LSN_DIM_Y_WGT_MASK, value)
> +#define   LSN_DIM_Z_WGT_MASK			REG_GENMASK(15,
> 12)
> +#define   LSN_DIM_Z_WGT(value)
> 	REG_FIELD_PREP(LSN_DIM_Z_WGT_MASK, value)
> +
>  #define L3SQCREG2				XE_REG_MCR(0xb104)
>  #define   COMPMEMRD256BOVRFETCHEN		REG_BIT(20)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c inde=
x
> 24f644c0a673..6f6563cc7430 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -230,6 +230,18 @@ static const struct xe_rtp_entry_sr gt_was[] =3D {
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
>=20
> +	/* Xe2_HPG */
> +
> +	{ XE_RTP_NAME("16025250150"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION(2001)),
> +	  XE_RTP_ACTIONS(SET(LSN_VC_REG2,
> +			     LSN_LNI_WGT(1) |
> +			     LSN_LNE_WGT(1) |
> +			     LSN_DIM_X_WGT(1) |
> +			     LSN_DIM_Y_WGT(1) |
> +			     LSN_DIM_Z_WGT(1)))
> +	},
> +

Apart from above comment,
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

>  	/* Xe2_HPM */
>=20
>  	{ XE_RTP_NAME("16021867713"),
>=20
> base-commit: 9a42bdcde0f77b2c1e947e283cc3b267b1ce2056
> --
> 2.34.1

