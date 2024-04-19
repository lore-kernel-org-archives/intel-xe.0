Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E39FDC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 19 Apr 2024 18:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EAA10FC25;
	Fri, 19 Apr 2024 18:35:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A0W98Jhh";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD6410FC25
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Apr 2024 18:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713551735; x=1745087735;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KQAANOFN/O2LKIDwSlJpj1MqiDHwOGAO2XYa4axwX7o=;
 b=A0W98JhhqzqA6imeK9ei1GPdOXbYsmyoHl6ALw5dmevVprSexVVXBuq/
 bvmbncO4iSHYHONjHdo3Gqxa5yZXa6heHPvEgQzrTq3XqU6WaZeAuOWkf
 jB8Yy43msrAhx//DepzCehbrmCubbv9p1cgTzTqnnlo2YlTdpFfbpaiSZ
 nmvdI/4aSCqpVnxHGqhi9Mx0lWp0EsopJzbpERJg4qn9ejGUTJE/oSVjM
 OMFnSIHJp95d85UWWGEAQq6Ocq1+O7HKiLFJYMSvJom3Nu7bKLFw/FMAz
 xI2R7q9M5gWHJvFwjgBR8cAiSPUTa1508V8a4fRNJOLr/xWTUpZk06rjp A==;
X-CSE-ConnectionGUID: saFN9KiUQOqS8OZHj+7Uaw==
X-CSE-MsgGUID: db/if+noQDO76ogAii4FTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="12949541"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="12949541"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2024 11:35:35 -0700
X-CSE-ConnectionGUID: uEXVfTUBSj2waMCgGM5Aag==
X-CSE-MsgGUID: Y9rllgIsQ7WfjODbWnDznA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; d="scan'208";a="23855091"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Apr 2024 11:35:35 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Apr 2024 11:35:33 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Apr 2024 11:35:33 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Apr 2024 11:35:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gY2agwM8AnzXr9yGoK3UAeObFFql1iiPkKR8Gg5FeByfVmAuu9Znepr2BhvT3zhW19MMMd1lpGdhX1Bj7E4AkThTGMl7DEOqalDAgd/m1fv35HrVDGcP7wToJlc6C61m7D4DrY3I26WFMKrCt25mPkyc97n/T6i9uPxPqdfI402RcHDta3qpLja//Krb5W8H0+Ck6Vko0FIX5z/zan96cSsI/a0VuQO8rMJO+9G5xBXnKD+ktGE7La0wSlqcKKwAMx3Z3DM/4TdxwpHj7QYXmX1NpSgCM3CPqKMcH2UOM+QLhjVEoIljQboTFWTpgHK5GZZk30uEksqDQPuX+Z0S2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yfs8Iuz7VTOYMFqOnJzFC5u4ns8LLPCPveeDAlOlMsc=;
 b=eiikTHfujsmSLPzz0py/AudXRJ/hTc1emLThx6mNIq78dXhWPYcFTQIseZGa1wBMI+9H6EcAuM+9+drwUdW5UUUpTSBnAR0GZhTaRqTAfctWeLOyqO8Po84xD2HlIEDZbL1NosgQrJv62wmPl6OY7Tk9i5OGQopD17CXMSy/eKkDK6qkO3VeiWjrwJBVAlnOdEaQBQc7oZGD+KL0ma755Z+1058YOS666KRXTD19dKIDXaQm2QwoWLJwTCUaCm577wvbxmCOpD9TALltIGib0pgv57TRdeMFt81yRD4BNpt6x3CMdICjDvJFFQj3gd9mufPcT+4tS70IB009+MBLxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by PH8PR11MB6855.namprd11.prod.outlook.com (2603:10b6:510:22c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.14; Fri, 19 Apr
 2024 18:35:31 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7472.037; Fri, 19 Apr 2024
 18:35:31 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Das, Nirmoy" <nirmoy.das@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "Das, Nirmoy" <nirmoy.das@intel.com>
Subject: RE: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
Thread-Topic: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
Thread-Index: AQHaj0a0HQ4E8rgToEaF10jsxeM1HbFv2XNg
Date: Fri, 19 Apr 2024 18:35:31 +0000
Message-ID: <SA1PR11MB69915FD38304C44B99E5880C920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240415145214.25641-1-nirmoy.das@intel.com>
 <20240415145214.25641-3-nirmoy.das@intel.com>
In-Reply-To: <20240415145214.25641-3-nirmoy.das@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|PH8PR11MB6855:EE_
x-ms-office365-filtering-correlation-id: 294bc29a-b49a-4ab7-8875-08dc609f7e8a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?WHgtVsQjQdyK4qlwzUH4PRzeMKVaIoI2uNZ099gHl+FrfBsY+ZCI5irE9t9G?=
 =?us-ascii?Q?fA0NRagGLjUU49SZ8w6i61uYjsoOxDQFwMbxoPtNCqOwtJ/pq/WnpA4hpXYx?=
 =?us-ascii?Q?IKGQiPJpF5XK8xoYDdT5eOCwLa/0q1wZI7qjBfhtpWTue0No5lW4emDeoaH9?=
 =?us-ascii?Q?kC2wfGAqTRD8TX+Xwka2yFjVn54sLRm9jsAGQgiognG+WFsVRPSZqT917dEW?=
 =?us-ascii?Q?yqx/U7w3+IbhPk4iTw8r9RTjskW8rC+wKFHSV4/h6EZwqG+ACNebiy1/n4UR?=
 =?us-ascii?Q?OdwVLv5HPDZIfO0FitNmb9jCLwLtIBjAURtNBX6/xOR3coJ6kqIFdUNG6bJA?=
 =?us-ascii?Q?SnczVOUTqcTKPMcZ76gPKNcKVKQ0pvnvvspkzc6RDD/RszbC6L0mFtHhcN9s?=
 =?us-ascii?Q?wHhirfmSJAtXzQu1YQPtgOyei7tBf96eVM26MyKeJ9BDBF1FQdYriq4tycgY?=
 =?us-ascii?Q?QV9hTVXNo4V+aavVPARbKiaW/lS66ej2+yUad9iTTMJ8V1JRF250vtdZQYqr?=
 =?us-ascii?Q?O3+LqABsXAIye0fRSlCVzQJFaxssiex2NwGnLzUse7lsmHt1MOZwK1loyvMg?=
 =?us-ascii?Q?sW+aFy9PlYXHexBU1bhkxx6/0su5bPcGW4ZjcegkDTIjBIBUfGR9pXSYDL+Q?=
 =?us-ascii?Q?JQvLDBWxQFA0hT8ys4FmqFUJxv6lP2mre0knvji3UhW4Y9GQbu7KxIo5eU+a?=
 =?us-ascii?Q?EvlA0HuhM/xzJFwMUM7dtGHXO6yuECFmadXATH2shZ8zDoBSWt0ktmz5pmnV?=
 =?us-ascii?Q?M1qW/vMUVZ0C/rm902yUMfjm/EPOUU9gkDM/6WRuCTnA6eo7dKwKhuKS2XQS?=
 =?us-ascii?Q?3sMa8l3N1apMK3BJrLS9XtFupfJyDQwzL8ggyvyGReF6OSjbfBy/6Y4W7W6g?=
 =?us-ascii?Q?TfRMcEM5bmZMyjpC/U0vX6J0hnKEritPl/CJ1XON1xhbkGxdCx3es5kLnNLf?=
 =?us-ascii?Q?o4WK/zEeiQE+iOhz1Ga4bU2TEEAbtY6UQUQSr6maw1b7NtssLiY7S+qupBqb?=
 =?us-ascii?Q?702Eh70kNF1XFJWQY+/r884r0AiJT+PYm17DDSVJPPsYbbeulLoMxwBQFmKa?=
 =?us-ascii?Q?89BXKdp9fHQH/uYzkfPAW2+WrhXLJa8UO//8lzvT/9CaqKH+aHIpgprT0lkX?=
 =?us-ascii?Q?sl7QUSQh6SKGwSist2CDux04PT+D6n+8vNyPFG9k+hgmsARbUqu/IVVrltRH?=
 =?us-ascii?Q?y5e/3zoDwUMbACyRECY08Xvq2dWMdtvZhhRsuJo8vYLWUj5vYDNQjUYKvZUD?=
 =?us-ascii?Q?CREnQUXt/e68sUKXLX48XMIaj9WeUjKuw8JQsQfItFCqtKTjqSNh+QELM4wd?=
 =?us-ascii?Q?H62U71Jzq1wmGFlaagdApQCkSKax/dYf0UxeNDxt0RpGug=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?LsDjEkhGxLOgDUOhgVTuVQhml67frz8+zUO/i4K4Ev/dKHFoneL5RDjwp0KE?=
 =?us-ascii?Q?YOFhAzuf7vYbHYjgSkBXPFA3JSKJSCPZcAbx0wyVrSRAQ7cwQlNMKFpY/ogG?=
 =?us-ascii?Q?+2xOasA7JKM+Ti4UF8dUp+1PC9UFtgFtZiPA+b73DrF/qJ1u7iwb6X9RC3oR?=
 =?us-ascii?Q?9prm1kAxjjx12dsor6AqBx6O3/zknVYKKI6Y4qZIz2COC+jK30g1V1c04i/w?=
 =?us-ascii?Q?DqHYlm9bAI/EStK246JMi5VeKMt7/Wd1MxtE33Da8U5UbBtCMD7nfAJlvrWt?=
 =?us-ascii?Q?c/gOP0EiDWhyobx0RzWxSTbYKLBqrKa4N+/ApKrrzi5d7ukUaIqmY8oXwdJo?=
 =?us-ascii?Q?cGYJcu1TxQ81C0KovWcvlR8bgIc7lxuYn/BrGit8j2H4su/HPYVfs+0CHQkj?=
 =?us-ascii?Q?Lpm+f3xJ/YREjeoFpD8A9NcH0bGpW8Umcfo7SWShg32whjFIjow39A/y465C?=
 =?us-ascii?Q?dkoeGgB2NzjO+s7cgm/436ZVbHWiPLjwMKsoR5a6BuzpG7syotKIuiGVUrXp?=
 =?us-ascii?Q?5ywpytaaiGIYW8UczYqtQc9/z+0LH0ApEHIwZfHCasakBvVCnjMZu59KY1YY?=
 =?us-ascii?Q?d5oI8MCgU2ON1OWvCXFWKW1u71+xhOK0Cugc8yRRmH0Tb5jHjyx55pxvb0x0?=
 =?us-ascii?Q?OFD1ZsRQc0XGCWjI9smW14Vg3l2YEUW/j1WOIQxKDXLBXWE75GVf05Pj9PJU?=
 =?us-ascii?Q?/tXQ+gjAhU9e1ijhdPRhMg/3z3tCyDG8Y2KbiLIoF1Og3pWpC/4eMxY6rYoC?=
 =?us-ascii?Q?HJTJD7koKXZEUYEW/mbsKfwkjecfDe2NpmSeI6kqYbtjjJ8wRAOW7d8ritkk?=
 =?us-ascii?Q?D8E2ZpygwPvGB333n4JYRk7fCldbV9X97GvuVIVlfl88a9O7y61znUVjhIej?=
 =?us-ascii?Q?NtIdfLvBXfwzXjFEaXrJuMQhKSxZF4MVIamK10821ECR0jam4anFAp1PPt8J?=
 =?us-ascii?Q?SfkLN2zBwVec+SvBtosaNyOKNewh9jG/mRoSBQAeTrnNYQayf4XQB5GFlV0w?=
 =?us-ascii?Q?5F39wZLo5tSZT3HLbGY4VJkxw8Hjp1qgtOgLr8qdn084+rAyo4eTg+xCxbM9?=
 =?us-ascii?Q?qM+wV5/P/BpUS4kg/jJ7VHqZKuqlBinKNwKJKj0L52bJTez4pGAISCju0LGU?=
 =?us-ascii?Q?wjsUYHXHVUqQ5Lb3GuZooFXk6cCifoswo4WHWT4skdk9vOKgsHdFhBXCubX9?=
 =?us-ascii?Q?JFoauYlz71izOfX8Eopxh7O5ap7pbgRC6ePjaZG/EF4m1ZbX13vfK0cNS2OV?=
 =?us-ascii?Q?d/aXf7Qx799iq2/4uaySXhSICmBtNx542geSuzzEUkJHe86UhIF1wazRi+HY?=
 =?us-ascii?Q?WmQpkXIQ4N0nU2R67Mhi4j26aC1jXS/24BS9rptTvL1d/n7m8h1FJ3ZYa7yM?=
 =?us-ascii?Q?pMRkekBb4pUP/g3bOQmk1X1Aw2lfo4YSq/nF/6W2wrrAk5Zlc8hnobAoHRvA?=
 =?us-ascii?Q?c2Ns7psxl8Tm7Nfr+T5R34RIYhrM18ER+cYR65yDuweN3D4glXog8riNqvw4?=
 =?us-ascii?Q?eRuYqX/gjQ5d3jytCVFrymZB1yS9erMc7/cITtcyLWirNBRzhuWUCnCpzYRB?=
 =?us-ascii?Q?ie6raV0vlHN9ad9ryYEOgKuAYBsnQMeQyz+xUXdY?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294bc29a-b49a-4ab7-8875-08dc609f7e8a
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Apr 2024 18:35:31.8824 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fN7Sl6tn+LFQqKcaXekQQX4qJggIisNFn6HpI0/lshFAB8J5DlqSxVtxg8CRmPr4sSU1SBOvTGfbT1kQm7b+ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6855
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
> Nirmoy Das
> Sent: Monday, April 15, 2024 10:52 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Das, Nirmoy <nirmoy.das@intel.com>
> Subject: [PATCH v3 2/7] drm/xe: Consolidate setting PTE_AE into one place
>=20
> Currently decision to set PTE_AE is spread between xe_pt
> and xe_vm files and there is no reason to be keep it that
> way. Consolidate the logic for better maintainability.
>=20
> Atomics is not expected on userptr memory so this patch
> also making sure PTE_AE is only applied when a buffer object
> exist.
>=20
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c | 4 +---
>  drivers/gpu/drm/xe/xe_vm.c | 7 ++++---
>  2 files changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 5b7930f46cf3..7dc13a8bb44f 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -597,7 +597,6 @@ static int
>  xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma *vma,
>  		 struct xe_vm_pgtable_update *entries, u32 *num_entries)
>  {
> -	struct xe_device *xe =3D tile_to_xe(tile);
>  	struct xe_bo *bo =3D xe_vma_bo(vma);
>  	bool is_devmem =3D !xe_vma_is_userptr(vma) && bo &&
>  		(xe_bo_is_vram(bo) || xe_bo_is_stolen_devmem(bo));
> @@ -619,8 +618,7 @@ xe_pt_stage_bind(struct xe_tile *tile, struct xe_vma
> *vma,
>  	struct xe_pt *pt =3D xe_vma_vm(vma)->pt_root[tile->id];
>  	int ret;
>=20
> -	if ((vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT) &&
> -	    (is_devmem || !IS_DGFX(xe)))
> +	if (vma->gpuva.flags & XE_VMA_ATOMIC_PTE_BIT)
>  		xe_walk.default_pte |=3D XE_USM_PPGTT_PTE_AE;
>=20
>  	if (is_devmem) {
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 2dbba55e7785..b1dcaa35b6cc 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -806,9 +806,6 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
>  	for_each_tile(tile, vm->xe, id)
>  		vma->tile_mask |=3D 0x1 << id;
>=20
> -	if (GRAPHICS_VER(vm->xe) >=3D 20 || vm->xe->info.platform =3D=3D
> XE_PVC)
> -		vma->gpuva.flags |=3D XE_VMA_ATOMIC_PTE_BIT;
> -
>  	vma->pat_index =3D pat_index;
>=20
>  	if (bo) {
> @@ -816,6 +813,10 @@ static struct xe_vma *xe_vma_create(struct xe_vm
> *vm,
>=20
>  		xe_bo_assert_held(bo);
>=20
> +		if (vm->xe->info.has_atomic_enable_pte_bit &&
> +		    (xe_bo_is_vram(bo) || !IS_DGFX(vm->xe)))

This is vma creation time. The xe_bo_is_vram works for device or host alloc=
ation. But for shared allocation, we can't decide bo placement at vma creat=
ion time, as bo can be migrated after vma creation. So I think this should =
be determined somewhere right before the page table programing, at lease bo=
 migration is done.


Also regarding the IS_DGFX... I think on some dgfx platform, we can support=
 device atomic to host memory, for example, when dgpu is connected to host =
through cxl. I need to double confirm this with HW=20


Oak




> +			vma->gpuva.flags |=3D XE_VMA_ATOMIC_PTE_BIT;
> +
>  		vm_bo =3D drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo-
> >ttm.base);
>  		if (IS_ERR(vm_bo)) {
>  			xe_vma_free(vma);
> --
> 2.42.0

