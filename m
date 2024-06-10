Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A1EC27C55
	for <intel-xe@archiver.kernel.org>; Mon, 10 Jun 2024 14:45:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6325D10E2DF;
	Mon, 10 Jun 2024 14:45:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="igAc4Kvy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B501910E2DF
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Jun 2024 14:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718030701; x=1749566701;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=39PRtS4BBdPyN/Esr7CtgXCCZwlYPqay3poW8Vd4fbQ=;
 b=igAc4KvyGo3QRKjqmGbx9GUrkj4X/zgHCOvnYUJfq1HaI+Np3Vly2IyF
 Tl9bk1AMKsUD0wbE0xBNfEgz3trHoIaJ1YV2k9G/whDG5QKchnA2mQP1F
 eG24nfp6Jc1bzj/LuRBoyBm8nzPuEY9EUzUoy+7G558AQgTQjWYePRSs0
 yB5rlxI3PoAgsz9zeFgb9XOiQpes6vBdl4e0eCgFDSW1WdfGXapniJCcu
 o9nMW8doUqPqvCOymGlnaG31rdpoemcfb232Ke0zbSsU751M5kMBxSFqw
 9NsgFwDjFyXHev/YI/HyD+iACuNHaz+rM6dUC3m6sr481qRT71PVdqqMD Q==;
X-CSE-ConnectionGUID: L2NL9bwxSGKYojVYHVHVDg==
X-CSE-MsgGUID: 5wbnm74JRuebGyXs1f/ulw==
X-IronPort-AV: E=McAfee;i="6600,9927,11099"; a="18480366"
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="18480366"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2024 07:44:58 -0700
X-CSE-ConnectionGUID: nAS/7ct7S5i4Tyxq9UQD7A==
X-CSE-MsgGUID: sD4ZQvWJQLyyX40XdpPlDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; d="scan'208";a="39530140"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Jun 2024 07:44:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 07:44:57 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 10 Jun 2024 07:44:57 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 10 Jun 2024 07:44:57 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.48) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 10 Jun 2024 07:44:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/08OF3B9vbmRWp5PDgkyek2gWF6v91cqfcpWxQZ4ghqehCQd2+mC1YgnmqdhnjUT0wFfiW7aeOez2xwFNQPjcVV1yPJiaXk8llqPBtKibLrw+4VKd1PxKaDuJoFWzqWaExxf7MtawlIVusq+xZ9D0xpzWquIS2oM7f4r4+cekZK8oMpHq+wIU9lPafsIx50atsNqvBvav63YJDrjazmh1bZEfyG1EvAOTuSL9qrab8rsO3K+gIAr3tUef24SvTlaBlJbZlULIChEVtsqsRNOkjFY7AY2Wc4yyHsCH84VqzTDZnBkOEy6xbanNeJgOYuUoya63AaLkKN/nZnZpU0Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lT10X3Z2KGm4n2OTcwIYdNtnZ2FecoDZ9+oXOFOT1ro=;
 b=Q4WaLKIErapUcCKTnh/zjJhiNis/4uiMvePAEIR4lz1s8OiEjsLBiFybU+7foaKvVjlP/gRMHaNouIdncNDwQH9h0LxXnUD+HPhkvhM7T8mIAdktsdAJ5xAdokx4dcWtNaSq0zuAlQpN64BHOnR13pClfGTkg6mpjlBoO082RdbKszJRiiZKgw2IPN+VkUtchViMLUOZOI0MRyOS1mE5G/pY8JoxY+16+u4rwex5w7JM4OuXcSh7QBuCqy829qooubSdjBuwk/jHB43MIpL8mdbwDey6pFed+e23PU6eE40R8usRT+kzGj54Z9TgtBCafNfwAv8GaZ26Nrv/1+Xi4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by SJ1PR11MB6201.namprd11.prod.outlook.com (2603:10b6:a03:45c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 14:44:49 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 14:44:49 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v5 03/10] drm/xe: Emit ctx timestamp copy in ring ops
Thread-Topic: [PATCH v5 03/10] drm/xe: Emit ctx timestamp copy in ring ops
Thread-Index: AQHau0EOElQYvNlHOEaMEbZvHtPfabHBEhgg
Date: Mon, 10 Jun 2024 14:44:49 +0000
Message-ID: <CH0PR11MB5444F0E4C482F7ADAC7D7AD3E5C62@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20240610141823.2605496-1-matthew.brost@intel.com>
 <20240610141823.2605496-4-matthew.brost@intel.com>
In-Reply-To: <20240610141823.2605496-4-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|SJ1PR11MB6201:EE_
x-ms-office365-filtering-correlation-id: 8e146716-4d45-46af-07d0-08dc895be13d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?swa8c6V3cm4cs0N+GKGOZ94Pv3ZleaYiWFhsJpiCipsZlxjSxMyWoEUMTKje?=
 =?us-ascii?Q?WvRVmCJzr8zxZGzy24wTwpc/kX8YmLH+uciKeZWjE/bwC/hFr6GoIpbKZ42L?=
 =?us-ascii?Q?H17xJWMQ2gQTnQIrFSYRWWbfNGU/V0XZ3E4JkPHcrjhwj5TAgohpgUBSyjl9?=
 =?us-ascii?Q?HnsJWKFBgpR30BLevrZcjQml4qglKphmRoQRW5aDo6aJz3MTw92YM5eIDeso?=
 =?us-ascii?Q?ZSHmTvE1slbbzEC/ir62VXE7ANDUus9RlwF3rcHVHlbXJ9SRbyoBf1Lot6sz?=
 =?us-ascii?Q?XSALNzpE6D836QDiEMZuBjH37l/H+oL0mIEZ0lbaoI645AyP1zdhvfbC9SWT?=
 =?us-ascii?Q?WBJI2qTVP86GQitfFrqA9tehAR8xQ0fKqFp+NVJmGybJe7WXhu4iQmWnQtbd?=
 =?us-ascii?Q?I+YOzUxllxlraJULlCghbeNBcQacmvOdD7Gyk1sOgjjxeNfjPd8H3IJw7OhJ?=
 =?us-ascii?Q?XjMf2UYHan2C2tuVkP5gaL0Is5TTsR4JixwoiCDkrpd9PHLrB1FAIyFhkthY?=
 =?us-ascii?Q?8au0yZ01Fj3MW+7XguWUBtXTkCy9LwHYanz/i+3H/CbEam8VWYTFHTRwqGGT?=
 =?us-ascii?Q?9h6gMYexj6CazMiGBYzvb3wFv6wpyTI/HTSbyTU/yn/189LJ9wc2RhER4R7I?=
 =?us-ascii?Q?ZxcOKama6KhACkXmE6J8ospXMt4VXWyyC3Aub7MJ1xefwR8AlwisVSt8hOb2?=
 =?us-ascii?Q?NUFASmk/W+YVlVwE5PLxwOf11MNEkefJooG8wsgvlc/5UoCsnkEt19ZqiKRb?=
 =?us-ascii?Q?3WeXH9Z3Trf1Mt8pYNLdReNLbuPb1kYi8jFEsxKXWWiY1fuKSx4Z3pCE/y7s?=
 =?us-ascii?Q?A0uUCy1v++quNfhTnbB4qhXQzyIKraZ7PAZEFbP8tIYpNTNahS4qHQxX8soh?=
 =?us-ascii?Q?TSemyyOQEgiL4zz1RvFWG2DTvunzX4CNynFBL3vyxrBqHy1N6+0lkwwy0IZC?=
 =?us-ascii?Q?7K3shp8nx1JzjGkSRMQocLHIsKulFb4RqoosVGnnNb9mG2cb5Toc6gmvMz0M?=
 =?us-ascii?Q?NtBMLaVquZU4CgoGgDO5T2W0YIB+x3hqg47uv9MrQN+6u4bT8lNJSSxDCtff?=
 =?us-ascii?Q?PQwttLeZnfcChjWnF69SOQYzyLa68yif3RMrZ/HxV/WpVL2NOIfYw4a2UNTo?=
 =?us-ascii?Q?f4o2TZnyUXHNGsIyi7OAIj8qcz31so5/whnbLIU8veT4vymeJs73E02+Oj6f?=
 =?us-ascii?Q?Fo5dmUVkHQfrleeLa4uvB/3OwjlFsWzXfI9zaNqwbmOqryHcGj1qT9Pi68n0?=
 =?us-ascii?Q?MZdidd8371X/2GGWBcjLPC+rG8BSE7yH7mp0AD5Gegg+UMA4tQegHnNdMDiV?=
 =?us-ascii?Q?O/yse8Ecjt2/ZvbXLMHmZrQ7bcwB4f+k26T6hXgyISopYqenVxakGo5zfiCg?=
 =?us-ascii?Q?s81Pwio=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2INXPd0NYv9oZ9RRdUdgtaDVQlUWUrlaCvIxVBvTS9FRRUNRFd4tTaog9Rf1?=
 =?us-ascii?Q?wPC/8OKyZZqytEQ0UtBrnpZCLCldtyGPvmIoga+9T1aNR9NVkP7zJKq7y12D?=
 =?us-ascii?Q?4pRIEmUYAraN8nNks4qHQcf9q4+MU8OninB1gjFbskQswHkSF6Qn4gMrovdw?=
 =?us-ascii?Q?UTQBSdChGsVvgwrFect7n8gly0CRh+C0izSeYnpyqE8cwJD8Pc6z8xMfaRfe?=
 =?us-ascii?Q?R7Si/jZC6MhYans+yWm4hvLSNt5Yy8HlNO60zJEzkSK+h9s5vLkdaQBA2HtN?=
 =?us-ascii?Q?UrTLTi9ROyjariIKnY5VszDCFZbInopbZ0KBVefvV6F+GcdnT9le+20mXleN?=
 =?us-ascii?Q?oqGp9lAwVAv1NxTr4SVu1Y3Ra+bf7XXnv/LCVPZJ+PGr7/dd2oig2hqtYEWZ?=
 =?us-ascii?Q?Hk2KTshN4W9yZbOZJ7bllVL76NtuuPEIPZF51SNrDtYWNiHDMI0OPPgWgBza?=
 =?us-ascii?Q?+4hr+rztx3eobGN2MGVkocJIxnNxfnPLA+z1y6v8+7aiTRee4RzlHRLE1bJu?=
 =?us-ascii?Q?bbhpiuCZ18qY+WlAk8k8jBACLlWssswX+j0CvGP9NkSo8QQrFk3wsDXLvjz6?=
 =?us-ascii?Q?1hiU21Z4X4FbDiPMDEWris44SZH+sCFVw2nrg6nvaBqZkhrwG5oF2gN5oi8g?=
 =?us-ascii?Q?GdDJDA7nL9Bsv6nvePchAp3/CKfXGmXJ7a3VG1haRFr4AM4GySSaiqAQtSzM?=
 =?us-ascii?Q?UgerY4m78r8XMLahXKVq7y0E5TgK4fIenMLnho3O8KvyF2+T0RfmVM5a9unP?=
 =?us-ascii?Q?VKkFWyXyfdBnjrUlkYaZ3w0/3Fi5eyLE9/6uNfQhQJoOraLrbEpZun9Hi5Tt?=
 =?us-ascii?Q?AJBtae5ZLPXvGZRY0Cu23JmR3CLHr260bROMyjWNKtHsNEka5374gkZHy3T3?=
 =?us-ascii?Q?qhL3S9F/hJm+wH7LS3lvPN/Yyr9IAKhVKW94YFXze4E/1keLm4hnKV39Vi6B?=
 =?us-ascii?Q?9CLtl9di/MRhngWzn0WiJWCEKCO5Ef56rxcc87V1PKxfsb+foNYqKni3aVnH?=
 =?us-ascii?Q?9A016p6fCqwYAynNIbynXt3KFiZfpxXi3N6OFJPLlRvy28fMNL9tDRB3aKGg?=
 =?us-ascii?Q?kaKp/E7BJzq7YA+CiLzLaj2hOPPYGwzrVdgD5vf80+CemjNt2efRwV4u7Loo?=
 =?us-ascii?Q?+8tutPR1ChnMuixsVkoEpzYJXJKLGFGhK7YVXzlz3rpytsWnWJ5Q3C/eY6C2?=
 =?us-ascii?Q?1e8xcnZP0SYkow4j2me+K0dTP+AUC+/P8a09iEn8SBkZ9WUZ5u0zEBNaXGdy?=
 =?us-ascii?Q?hkDVq8eGfHWRA8u3LAhQFlcDPxw/l6gSgN+ll+Y+hGm/+zomLZL+db8Z2q3A?=
 =?us-ascii?Q?CzCmOc9YQcRXSx+CoXX7p2JFxoRPJ8RixZAQuECeILrhcmrQ++HLIaJiLsZF?=
 =?us-ascii?Q?kp3OqtG+zEIynxcFyiINw1jl59Lho/FvGZiWiocNV+O79z7fwhgYdA0bZI06?=
 =?us-ascii?Q?qfbVDUHmxKupeH/PA4sq35dlOTOyMGL/8XgVrDOD4+acs8D7dAUjSDFBVBfh?=
 =?us-ascii?Q?GijptoJLXBrkMOQZTbepgD8v579iskSOtGzA69xrYLFYIvTsbRaPGUEJ8o+M?=
 =?us-ascii?Q?VWcGjVch7UU3qg0Zj9A7ojurfZm2MxPkRNKhx6m/?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e146716-4d45-46af-07d0-08dc895be13d
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2024 14:44:49.3126 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Oei1cZvoUJWymiEL1ROEXp93DhvszHRk3BlKXoVa41wAtB2Yqi9uztjKEDE7tEKA3qqq8H5l+8QsIlTmslFXbkwM5Ag2Q0NgJ4tIZsNGOHc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6201
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Matthe=
w Brost
Sent: Monday, June 10, 2024 7:18 AM
To: intel-xe@lists.freedesktop.org
Subject: [PATCH v5 03/10] drm/xe: Emit ctx timestamp copy in ring ops
>=20
> Copy ctx timestamp at beginning of every GPU job to a saved location.
> Used to determine how long a job has been running on the hardware.
>=20
> v2:
>  - - s/ctx_timestamp_job/ctx_job_timestamp
>=20
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_ring_ops.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_rin=
g_ops.c
> index db630d27beba..0be4f489d3e1 100644
> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> @@ -224,6 +224,19 @@ static u32 get_ppgtt_flag(struct xe_sched_job *job)
>  	return job->q->vm ? BIT(8) : 0;
>  }
> =20
> +static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> +{
> +	dw[i++] =3D MI_COPY_MEM_MEM | MI_COPY_MEM_MEM_SRC_GGTT |
> +		MI_COPY_MEM_MEM_DST_GGTT;
> +	dw[i++] =3D xe_lrc_ctx_job_timestamp_ggtt_addr(lrc);
> +	dw[i++] =3D 0;
> +	dw[i++] =3D xe_lrc_ctx_timestamp_ggtt_addr(lrc);
> +	dw[i++] =3D 0;
> +	dw[i++] =3D MI_NOOP;
> +
> +	return i;
> +}
> +
>  /* for engines that don't require any special HW handling (no EUs, no au=
x inval, etc) */
>  static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_=
lrc *lrc,
>  				    u64 batch_addr, u32 seqno)
> @@ -232,6 +245,8 @@ static void __emit_job_gen12_simple(struct xe_sched_j=
ob *job, struct xe_lrc *lrc
>  	u32 ppgtt_flag =3D get_ppgtt_flag(job);
>  	struct xe_gt *gt =3D job->q->gt;
> =20
> +	i =3D emit_copy_timestamp(lrc, dw, i);
> +
>  	if (job->ring_ops_flush_tlb) {
>  		dw[i++] =3D preparser_disable(true);
>  		i =3D emit_flush_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
> @@ -283,6 +298,8 @@ static void __emit_job_gen12_video(struct xe_sched_jo=
b *job, struct xe_lrc *lrc,
>  	struct xe_device *xe =3D gt_to_xe(gt);
>  	bool decode =3D job->q->class =3D=3D XE_ENGINE_CLASS_VIDEO_DECODE;
> =20
> +	i =3D emit_copy_timestamp(lrc, dw, i);
> +
>  	dw[i++] =3D preparser_disable(true);
> =20
>  	/* hsdes: 1809175790 */
> @@ -332,6 +349,8 @@ static void __emit_job_gen12_render_compute(struct xe=
_sched_job *job,
>  	bool lacks_render =3D !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
>  	u32 mask_flags =3D 0;
> =20
> +	i =3D emit_copy_timestamp(lrc, dw, i);
> +
>  	dw[i++] =3D preparser_disable(true);
>  	if (lacks_render)
>  		mask_flags =3D PIPE_CONTROL_3D_ARCH_FLAGS;
> @@ -375,6 +394,8 @@ static void emit_migration_job_gen12(struct xe_sched_=
job *job,
>  {
>  	u32 dw[MAX_JOB_SIZE_DW], i =3D 0;
> =20
> +	i =3D emit_copy_timestamp(lrc, dw, i);
> +
>  	i =3D emit_store_imm_ggtt(xe_lrc_start_seqno_ggtt_addr(lrc),
>  				seqno, dw, i);
> =20
> --=20
> 2.34.1
>=20
>=20
