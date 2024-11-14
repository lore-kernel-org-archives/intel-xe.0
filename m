Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F34D6A222
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 17:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F3A010E2CE;
	Thu, 14 Nov 2024 17:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DL2xj0Gv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4BBB10E2CE
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731605936; x=1763141936;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=SuJMfCC2DkFbaD2cATx3fUmJvAKg3qqO6VTiw9ni8kg=;
 b=DL2xj0GvQZs5forlrkr6QQEROH1esqf8JLpm6Qs1SwqRRo+lOSzeQcoh
 Br8ZEtoGS+Q5nr1vp8oT55TaLdwuaEEzx9wvxL6y8zoVtd7uPqiolWZsm
 yhI0ks7NbFlwBwqU7oiR/TMzihq566ObknQ907n70mZ/OiGfFFp6IqJv5
 IpDfQBmD99m8PXTTr38YwxVQqUitZglUUBxCfmF7KrQUHYOKnc5lLrGvj
 WaBi7TXFPpOPta5Qona8m2V0Fpm+SvI6TcR5ExgeogCAeSXug7cTQXv6c
 0qHZLnijPcpFanvz6hBKNkihJUOXiaoqu6jeAgVL78LLmm0yi9AxarrMP A==;
X-CSE-ConnectionGUID: /KSympjOTHGmNDDi3RUWAw==
X-CSE-MsgGUID: 7s5npJQ1ShKHVlGyI4UHhQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="42959136"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="42959136"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 09:38:55 -0800
X-CSE-ConnectionGUID: X0N8iK6jQTeIrzvooLVWyA==
X-CSE-MsgGUID: 38XVHvLZQT2uATjyXcPOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="92358997"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 09:38:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 09:38:54 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 09:38:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 09:38:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bixxwzMXlzfNjEqhiCraUomkl/37i/+9Mjj9mQXJk4xkjcYmgsl8A83qJG+JgH/2U5ILEHVv9jnGMrKhJ2u0gzd38gdK21Jq/Rh6XYmD0frnYqNq3qGapHiErZa8G+bhk5vrtkm+AmhadSD4CFmLZZm6efNbljT9kijAhJPtsywIr/QufblND7O7eTUCOIgOoJg42WCr0rZVkdJCUngem03EbHqFYA2+My6P/2MyfWHj8vYlujFBx3ttEq9E1IzPfPsxwDvriHyiMGjQ+pMPC4gutWSohguxpCOPd6DwuhJ2bBk6YHeTTpfaN8K7WpUzcryr9Bdf6cWULR6fmFqzvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G1GlE8IullTmetHz39n2vtHGp/d9hDUKZEDELzGmDuY=;
 b=ahannHOQ3/QIXAGA0iuxgiTqT1u0kPRFuxrBDHrgSqO8GvqWfI8KEvZqysCBP//3wntEirsLYr8v2gsTWxyRYQuOqN3oJLsZ8XKbRRODo3QkTniuvke53BdNzuajPzJJRwztF9Z/I692yVpU19xGMkIcHbfHWIZ8s3fxHiYk3yXWtOOSyW5d3qcLsSOdCdQsmm99UIo0XcBFlOJK1zAcvfFsDt2z+gxCL1X46VflPcsrN+mNBkXYE7MLCtSE5z4gr8IATVQAxO9sf2ufhpRm3VDJWfiLncEEeGQDKF1XEE1hfJYJlb4d7kfVw/4j7H+DiylPOErzAC9HFxR2Dv3bsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7684.namprd11.prod.outlook.com (2603:10b6:8:dd::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.18; Thu, 14 Nov
 2024 17:38:51 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%7]) with mapi id 15.20.8114.020; Thu, 14 Nov 2024
 17:38:51 +0000
Date: Thu, 14 Nov 2024 12:38:47 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alexander Usyskin
 <alexander.usyskin@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 3/4] drm/xe: Drop HAS_HECI_*
Message-ID: <ZzY1p-PELMKHPthI@intel.com>
References: <20241114152148.572447-1-lucas.demarchi@intel.com>
 <20241114152148.572447-4-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241114152148.572447-4-lucas.demarchi@intel.com>
X-ClientProxiedBy: MW2PR16CA0043.namprd16.prod.outlook.com
 (2603:10b6:907:1::20) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7684:EE_
X-MS-Office365-Filtering-Correlation-Id: 8beac98c-19d2-4d2d-7b4e-08dd04d333ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lti7/Sv77gUQPKo27t0VQ5UVuozciAD50f5Tjm1N20mNgsgUC2wS2R+5sGKb?=
 =?us-ascii?Q?AT859g+9P7H+lTApE9JY6M7hnT/AgB1N2eJI7MFNVSTA8JWILNBs+QYXAtF/?=
 =?us-ascii?Q?wFiDgYrwgnYuQIEMYJw/O318t3TyuvoBmEAValfKY/H9Dan1Aj5PWT1uOD7R?=
 =?us-ascii?Q?2GglR8EJisyAntJHO7hYON15jzaM+gMTQ6uJxdWjxwniMUtoVqQVeQTTYqtt?=
 =?us-ascii?Q?BUWQC6yZqp3bVx2ApNR4LsG7RRVSX90pPpCAdBg1oKYWLkvAnh+qMo4WHurp?=
 =?us-ascii?Q?xGWuarybLNnyVR1mB66zwXjlO3YmwcQSOPy0R60DZ1BxDcoVoA8mYhbYrG3c?=
 =?us-ascii?Q?oo1DkpXVon6Yw5ft7vPluf4VHZdE/yUJGsxlFcoPv/WWuskyzDBdJ5wjAn/W?=
 =?us-ascii?Q?uZGUXLT5qU/GqjGaFV74SFlY0uwQG3/TjD80Y2HAmuere2LINfHokoiywSOd?=
 =?us-ascii?Q?hhy/4ccaUSxkWbnIaOwdmfhTCkV3nXEkAAkaPnaGFtASQmWG5TGFh0h0tocz?=
 =?us-ascii?Q?XBIgdBxGWke9mTGunMjLjc9nCyamIcBY+L8Xd22I8YDII3vp0hu+EWfvQ4iA?=
 =?us-ascii?Q?gtY+6z1mjA5cPpfSVdL+Sbm+3e1fEK1a51DbYYKIYMnBxc5b2C7kxuRqoNt+?=
 =?us-ascii?Q?Hjt2QcskyDncFUPzRyFMV2uH19GDP7W6MlnX6v5JrVP57+rrtY8QutsO6acI?=
 =?us-ascii?Q?nsdkyUG6jIdOu8c28x2RSVBUXWaYa5m2fYQXaWTQnNuL1WnASzgogyGFExtx?=
 =?us-ascii?Q?/NteBj04pnilpbbirVl88Zfsn5FPWKWja+xyqPfJo7zR/O8g0DRVts2C2+4f?=
 =?us-ascii?Q?+ZgmJJ2Q/QFnaUWtjZoqRdM+F/YuI2UEx12xcYLALd4Yh24A2WWb5ULt89wT?=
 =?us-ascii?Q?XgSgLywrVN2BfJPcamigava9Hc6GCujp2sbLzsnIw/WqGs5xd3mYp1hG3HTv?=
 =?us-ascii?Q?9/FnMV9l03FsbUmz5gDGX3qs1TkTZi/fbc1FkP5PMKU7bAVTjG20690PkC0X?=
 =?us-ascii?Q?eFFg1UK7lRAhxN+e1ZwYcj1gkXPbX2k6PtuqDjvfYIj/7edgaNsKnEyCe+1f?=
 =?us-ascii?Q?kIWMQDOgUhf1gx6Fhu7nqN4sHRsw/UcoDke/6ZgynVh+SF073Ud7z7K5meTZ?=
 =?us-ascii?Q?SVD03yw7Lki/KEOCsaeMD5IObxwmEVvASSwtdf2NkHogKCU/NBwZFaSB+3dy?=
 =?us-ascii?Q?DnUhOCzLM2Fu0j3pCIzYhWLqV7L9ZS8B1TEe6w841w+8DN9/jBoTc1OYcJ2O?=
 =?us-ascii?Q?ExI3goQ+M0GKepd67YOB7lDkfYsI1SPIAcys0Ko0QexIBQYLyn01MCM0JG3K?=
 =?us-ascii?Q?IrCKJf2/CNB1qvJycIQV7Yp9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?oSXu5nu9/NxP6X7rxDihnyTlVFIO+Dy30DoL7cka49p2nTEuNucYJCFb/l1v?=
 =?us-ascii?Q?PdSq/bCBp9eANrbg6XOdx8oW1+22EHsJv4NvTTcJwcENmWsHLS7/OPb+LKuo?=
 =?us-ascii?Q?ck7tUVOO4Y1/f7axopXpbVSvqjzF9EUOmlCES2kSK2iwiNGlhyI8tarAicfH?=
 =?us-ascii?Q?bQtMDeI5VkDm8dTeZP4uXq6boHt8Q2rkmtSN4Kvm0fmlvOkpEVomfezsFzVg?=
 =?us-ascii?Q?aZW/FMYqmoFgPMrnsiGwcXFVh7r6DUg/g7KROXvjh2JX/7ru6CBpn4dnKqwz?=
 =?us-ascii?Q?gPmQOAgTKI3DdUvok/V2l0htDaGv2aCKLCX+5nnGB4XerCnWm/MuI12IHEz0?=
 =?us-ascii?Q?Kh71tcwfSHJylxMwt6wESLpHHmGEQ7U8tAfkv21yv8fFH8l9HhYGtX38TAgd?=
 =?us-ascii?Q?z/O6JT/sKywW8i49mwEWSFEvgG30gZexxKQfQeN++iQAE9OfFioQwvwudktb?=
 =?us-ascii?Q?Hmd7blk9YZ9wwkHvkgqeT3TRLEsCi+4gGPLEtcuE4iNA8Nin0iExt+4rdG2Y?=
 =?us-ascii?Q?GjSSb0WMo0kEaPJiBXuYzJLy+SaWV668KDMUrtUIQWJKkYHuyXOJPsM8ssPF?=
 =?us-ascii?Q?l8e+WOD/XCBm6KcbFb6btkOqyuqEQy2E2vt1jaE2jzuI8iU6N9U4XfIJAAY7?=
 =?us-ascii?Q?M5uig0wMhC64jn2GYKxoefm8TFrgkDrbyYoizB9l+KMckZ4lXu1Eiya5XLF2?=
 =?us-ascii?Q?bicZ28VUWDqmZdIfnU74gTaRYmRGXC2UEho2ElfsdsNqOG2G1lv9Es0J+SqU?=
 =?us-ascii?Q?mFYnQxsBwOmxgZqU2w9KPSoB4LzVKgxbAOmjt+DapjLgtVO125b5Rk7sV12c?=
 =?us-ascii?Q?L7rR2sbfOdf/uaoFjEaqNKbbA/D7ERTH8RNEa9D7YKR9qfERFVy8FkLm3kV+?=
 =?us-ascii?Q?F4Tl7RfLlhkvri2QFFnXGzvLVXE3k8nLXtwHN7lQj7n5f7FgaKeswLx2vjId?=
 =?us-ascii?Q?Qmp1evOTN2iwh+GqkUeqbzNrZtRUOlBhbYFqsqJocxJlnOljjg+CLL+VKFcX?=
 =?us-ascii?Q?0g2w7qB+jHlnJZktqUxIwPDduE1IjQNsNL/NcOV9BxhJ5k5dfoYOLwoZoO5F?=
 =?us-ascii?Q?FYNp8hTpd6SaeKeU73bZYFlMx7L3rkyW+dFKFBxMmhJ97vdDo5kPpdYE/QPa?=
 =?us-ascii?Q?xuzkZvbDkaKGgkdbj01p02YS+bPjlmYIcf9De41CMfRiTa5HCa94KM/Ymr4/?=
 =?us-ascii?Q?sNmWEeG6Lv+hXRyJBoR1sMp2LVMVWyfY3fvYf+BeQD96XH4Bhpl0XUi9cbiR?=
 =?us-ascii?Q?xwLDYn2x5AJ1cSEWDC1lUwIvoPPWdSxGnUZ/s6W9rLb/bnEp6oxy4wrSCIvK?=
 =?us-ascii?Q?R8Bi4rtBC8s3i80QvO4b2dQKu/7w3bGRRll6oB/SaTaUyZz/41hPls2s0yFR?=
 =?us-ascii?Q?ZI0CSXVcZZSNVguQjjOBxAMXiRDbRQcE6s94Z83t2N34Fbvqo/dJtZEYl6QR?=
 =?us-ascii?Q?00BG0sR80CcXWsJBwiJ2TEdmPurPvp2y9BAigsVRqIBRSGfu5GGOYNfPJ638?=
 =?us-ascii?Q?DgqxV+Pqs2fMtPp7Pf1uwfwdSgpuXLxEJOGjs9dd3yLS97Uzh3dtS2gN8fPS?=
 =?us-ascii?Q?j/2H3P3a/n4wzR8/sRxiCDiLoJ0Fnvk91m6NS3deEFsO1p1gcYxcp+rYdYe/?=
 =?us-ascii?Q?oQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8beac98c-19d2-4d2d-7b4e-08dd04d333ce
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 17:38:51.2157 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZyFbg+zCYKrfncOjXP7k8cQqar2d+LW+/7pEpKtlX+uMjKgetRQq0qRsthHFjKcIE2KNj3i8U0eB24cvSp8M5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7684
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

On Thu, Nov 14, 2024 at 07:21:47AM -0800, Lucas De Marchi wrote:
> Just do the same as for other has_* flags, without a macro.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_device_types.h | 2 --
>  drivers/gpu/drm/xe/xe_heci_gsc.c     | 8 ++++----
>  drivers/gpu/drm/xe/xe_irq.c          | 8 ++++----
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ff19bda9ddadc..27a3d82560498 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -42,8 +42,6 @@ struct xe_pat_ops;
>  #define GRAPHICS_VERx100(xe) ((xe)->info.graphics_verx100)
>  #define MEDIA_VERx100(xe) ((xe)->info.media_verx100)
>  #define IS_DGFX(xe) ((xe)->info.is_dgfx)
> -#define HAS_HECI_GSCFI(xe) ((xe)->info.has_heci_gscfi)
> -#define HAS_HECI_CSCFI(xe) ((xe)->info.has_heci_cscfi)
>  
>  #define XE_VRAM_FLAGS_NEED64K		BIT(0)
>  
> diff --git a/drivers/gpu/drm/xe/xe_heci_gsc.c b/drivers/gpu/drm/xe/xe_heci_gsc.c
> index 65b2e147c4b92..d765bfd3636b4 100644
> --- a/drivers/gpu/drm/xe/xe_heci_gsc.c
> +++ b/drivers/gpu/drm/xe/xe_heci_gsc.c
> @@ -92,7 +92,7 @@ void xe_heci_gsc_fini(struct xe_device *xe)
>  {
>  	struct xe_heci_gsc *heci_gsc = &xe->heci_gsc;
>  
> -	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
> +	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
>  		return;
>  
>  	if (heci_gsc->adev) {
> @@ -177,7 +177,7 @@ void xe_heci_gsc_init(struct xe_device *xe)
>  	const struct heci_gsc_def *def;
>  	int ret;
>  
> -	if (!HAS_HECI_GSCFI(xe) && !HAS_HECI_CSCFI(xe))
> +	if (!xe->info.has_heci_gscfi && !xe->info.has_heci_cscfi)
>  		return;
>  
>  	heci_gsc->irq = -1;
> @@ -222,7 +222,7 @@ void xe_heci_gsc_irq_handler(struct xe_device *xe, u32 iir)
>  	if ((iir & GSC_IRQ_INTF(1)) == 0)
>  		return;
>  
> -	if (!HAS_HECI_GSCFI(xe)) {
> +	if (!xe->info.has_heci_gscfi) {
>  		drm_warn_once(&xe->drm, "GSC irq: not supported");
>  		return;
>  	}
> @@ -242,7 +242,7 @@ void xe_heci_csc_irq_handler(struct xe_device *xe, u32 iir)
>  	if ((iir & CSC_IRQ_INTF(1)) == 0)
>  		return;
>  
> -	if (!HAS_HECI_CSCFI(xe)) {
> +	if (!xe->info.has_heci_cscfi) {
>  		drm_warn_once(&xe->drm, "CSC irq: not supported");
>  		return;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index b7995ebd54abd..7bf7201529ac8 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -192,7 +192,7 @@ void xe_irq_enable_hwe(struct xe_gt *gt)
>  		if (xe_hw_engine_mask_per_class(gt, XE_ENGINE_CLASS_OTHER)) {
>  			gsc_mask = irqs | GSC_ER_COMPLETE;
>  			heci_mask = GSC_IRQ_INTF(1);
> -		} else if (HAS_HECI_GSCFI(xe)) {
> +		} else if (xe->info.has_heci_gscfi) {
>  			gsc_mask = GSC_IRQ_INTF(1);
>  		}
>  
> @@ -325,7 +325,7 @@ static void gt_irq_handler(struct xe_tile *tile,
>  
>  			if (class == XE_ENGINE_CLASS_OTHER) {
>  				/* HECI GSCFI interrupts come from outside of GT */
> -				if (HAS_HECI_GSCFI(xe) && instance == OTHER_GSC_INSTANCE)
> +				if (xe->info.has_heci_gscfi && instance == OTHER_GSC_INSTANCE)
>  					xe_heci_gsc_irq_handler(xe, intr_vec);
>  				else
>  					gt_other_irq_handler(engine_gt, instance, intr_vec);
> @@ -459,7 +459,7 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
>  		 * the primary tile.
>  		 */
>  		if (id == 0) {
> -			if (HAS_HECI_CSCFI(xe))
> +			if (xe->info.has_heci_cscfi)
>  				xe_heci_csc_irq_handler(xe, master_ctl);
>  			xe_display_irq_handler(xe, master_ctl);
>  			gu_misc_iir = gu_misc_irq_ack(xe, master_ctl);
> @@ -508,7 +508,7 @@ static void gt_irq_reset(struct xe_tile *tile)
>  
>  	if ((tile->media_gt &&
>  	     xe_hw_engine_mask_per_class(tile->media_gt, XE_ENGINE_CLASS_OTHER)) ||
> -	    HAS_HECI_GSCFI(tile_to_xe(tile))) {
> +	    tile_to_xe(tile)->info.has_heci_gscfi) {
>  		xe_mmio_write32(mmio, GUNIT_GSC_INTR_ENABLE, 0);
>  		xe_mmio_write32(mmio, GUNIT_GSC_INTR_MASK, ~0);
>  		xe_mmio_write32(mmio, HECI2_RSVD_INTR_MASK, ~0);
> -- 
> 2.47.0
> 
