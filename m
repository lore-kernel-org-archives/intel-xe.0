Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C15E66891
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 21:56:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B48810F0E0;
	Fri, 19 Dec 2025 21:56:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HG7Wkd41";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0D110F0E0
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Dec 2025 21:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1766181387; x=1797717387;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Mb03MTCB5ICSPmAOlc+FliwKEtsBzYFvX8N8H/grSPA=;
 b=HG7Wkd41UOhOcIuFx8JOmYp7Oe2bsSFHCopuiAT7XUAiHytYpw91/tfs
 QsVxcvlHMri9Jolaxs3d0RQ5Sx0MbWIGHI+AOTHyurbEh05SwNUCSCCnY
 OYooZPtfQtAwhV3JSN1EwudKvdc6QiZEGAqPO8BCwlNvCy+tXr/sAyHpw
 MYVGPq0rV/GO1T+cRh6OtanzMSPzMrtDlPzE5vKVSRXtnkn2dP8DnH2EZ
 uO3TpiQdOvH5wu/Tn1cFe3bR2BDMlCXSWp81wchVpFfkm9Fw+Qqp9fDVF
 cxZ75YZ2MhNekWkY2w/Ctj7cWRDiNvj7OKuX82yu6AqBaZXw6FHAxSDSG w==;
X-CSE-ConnectionGUID: EpqCtMGfSzWGZiDL+O/Oag==
X-CSE-MsgGUID: pirg3qRYSDuUQcRkBEUrkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11647"; a="78861296"
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="78861296"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:56:26 -0800
X-CSE-ConnectionGUID: NQaZv6ZqSiqwPNcgQ4cj+A==
X-CSE-MsgGUID: 68oVcOcdRDKpJDguhFB75g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,162,1763452800"; d="scan'208";a="198723006"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2025 13:56:26 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 13:56:25 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 19 Dec 2025 13:56:25 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.55) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 19 Dec 2025 13:56:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ts2Y9fewa8z6aDyMSd5F+FPVkwN9yknAU/9YByGTp1+ykhlU7gUkgYBT8HhPb2KrmsHIAgMgOTSCLUCd2usAVSlCOaKOplo1WLKJe8Ct8SvPjhzuZEW3VFYxFkrvqWDLRz1sqNLhDrg4ByJxyTZ8WdsRt+EgZgCYN5HFozG68KVNsojiqf4h2oNwy19+SctVkqiscmaBFDLQsySpDSyJrTUshYTrkqe03yn7xqOrGQg97Ld7GvvIq9UqAU83gDHHfFnImhB8i0wsfWHkxiNUGz8iOa1qcN5mIeuhQCp3NSsE8zFPlEpk897mLNM/jP+/GRFfYvvBAEdD8fWu+sGccQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0n6UmhrOfaAY6UayLNYE7MwDkL0F1jdI/gHa/ibWWU=;
 b=ZVoqOXhxCJFLuVpJz7sqNcIEPljtWxMOuyVB5NqKH7Y3mjRY9dl3krNW/Afrze/U+iL0vvFemhEVVFDH0sPIYRbDDztxy0ySpAXO5gyO+Hft055hWcV8Vk2+Eh77blrxxzKwTTX1q81WNCHN0cgn7g1V3ZBZ8mC7b4zBezvzYIv2UhUuw0EjCzHXGrMX1t8vNl2eYQQyZnkxGZ+bD+ogo1iweb09yVVBmLvC/E0ALhDqvF2CnhkTvjwzEi/jyXm3ytKHXzNsytnto1aOhejzff/2dK379J6romx8amRcMPj4Wu+lw1dxMZsl0wz7USK2FkP+NG/YBRMRvkqKCBZLWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CH3PR11MB8314.namprd11.prod.outlook.com (2603:10b6:610:170::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 21:56:17 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 21:56:17 +0000
Date: Fri, 19 Dec 2025 16:56:12 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lukasz Laguna <lukasz.laguna@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v11 1/4] drm/xe: Validate wedged_mode parameter and
 define enum for modes
Message-ID: <aUXJ_BYnvRSXhd2k@intel.com>
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
 <20251215174613.3701-2-lukasz.laguna@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251215174613.3701-2-lukasz.laguna@intel.com>
X-ClientProxiedBy: SJ0PR03CA0087.namprd03.prod.outlook.com
 (2603:10b6:a03:331::32) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CH3PR11MB8314:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a8cda8-81fa-43b1-d7de-08de3f496f76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?al4H8CaLrdd3qmfTLZTfXtb+w3dlV9Kakd6PnNLf6Sy5fVIDF+i34pjrkLg9?=
 =?us-ascii?Q?2iqzqWnDTFoNKWpQSFM1/qYFOjqvkUgYBLLJQ9C9pAjLKsK3drBcu/cPgaTy?=
 =?us-ascii?Q?YejOsb8Pw34/6kmd8NjNAGxHT42OC+TbF1FQnj2JCBm+6+b1uWxyfb4OV597?=
 =?us-ascii?Q?PhKHA76jwf0kHr4U+o+xxBHnjYjio81eVYgzsnb6mlGEj5p5GPaS6jtmpYBf?=
 =?us-ascii?Q?mUcjvbFsGM7bUUtlGXEx17otWxlSgQhjNV0JMoadMWB5PIsIahnhRXULKkZ4?=
 =?us-ascii?Q?DLNotkcMH1PQdXeIhSmpj+5FUaGLFwSrl87tSDDK9/QBt5JFtzw3ZTk2qkAT?=
 =?us-ascii?Q?0u+nXieG4uXAcMzZ0S1FqOzrCEgbyvXsRk75kxnTfEGcbqTIUiSoMMm4hdu+?=
 =?us-ascii?Q?R8zWJZ8GdTGzYggl279hPByz8h6hHMO9ip94x1T/GOn0qLs/p0naSCTFypVd?=
 =?us-ascii?Q?rKwQaL1iSe/g9dpwGGZxnSnWJp40lZmqtFZ//wVZvbmrh39urW7BGqWKucfb?=
 =?us-ascii?Q?MjiU7wddOlFjj3FX7ivLy9ZZXol2ex0x0sTVfpBXR2kI+pWILdDfkCD0S7WQ?=
 =?us-ascii?Q?5uk/iizgSR8qwLSvqv9CO4nKp2iHoqJJEM/6EW2V7pAdAuQ9sq4XDjhWItjv?=
 =?us-ascii?Q?U/dvazR4SCbyKEuE8LgvbisJC0gGEYZYcUw1+HT37xR5QsPMLSoHwH/83N2+?=
 =?us-ascii?Q?p52KUSC6yyWd3Jh9HoXwqJjpVzVYrXVrbiP53oK3+JNtzKN+znZU4581MbGf?=
 =?us-ascii?Q?XF0CCQcQ46EWMNJmDa9bsvAt/rZzKOuSvrUZ7hljHSpKEAhi7/tLr4U2GBKQ?=
 =?us-ascii?Q?Y60ZE8oa4995wMOk06K0y1AgHpNolzRr5SkTI6ZtEyL/eOyZqEVuOlO3uzku?=
 =?us-ascii?Q?J9/OHJtT94GdeeYPXWXcSbVpKGMrEZoMYNbKcz0lITMBu0AD2e91gDtLyN/1?=
 =?us-ascii?Q?O9HxndHSKcDJRUfHlPxRBCK7tKH2iER9d9bgQgOj+8UPYWI0NmIS9Fr9SK4R?=
 =?us-ascii?Q?2KLGVUFhQx3j39J5z6UFGkZnJyDDdnctNspp6gepZv1jVrldi3KeDrdS1r2e?=
 =?us-ascii?Q?2zSCwu7i07XQkPPitd/auQrBAVJ+L/KTc3i8ECyBNxHMGeT4Ir3aS0EtUG4j?=
 =?us-ascii?Q?8ClzEsQ3OjrOWwpISgse73m0SGKAne+UZKk13kiXr7N+a3+Py5/R7Vq45l7p?=
 =?us-ascii?Q?Jb+UDGREnkzX8f5IX9VKVh0OvuoUAKVsZDKHQ8XXyC22ibEahT8ds5lSjUZs?=
 =?us-ascii?Q?QRt6gqEtS78ObdaOU5LFRUNzFeiIue5etdUO1qV5LAA2kT2vyN8WxXC/4ofo?=
 =?us-ascii?Q?0iByc9L5HTWRxf99gixQtLIXI9P7G6kp/jR9Nf8PBipgTy1VpjHTId4hGCKP?=
 =?us-ascii?Q?bq5WGCt4Q4zbi9wEck/nWFXnr4QYlQhl/TODozOXzfTihvBxdVdkJIbr8S9K?=
 =?us-ascii?Q?2MNOdBMx96TLyeb2y4SelZqC/rzZKgY6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tdJyl2Sn12voDG/yoWb0OXUQR0mSDvPt2hkMBa/0ZzNyx5ZVIUiwWTO/fxo1?=
 =?us-ascii?Q?rHsgLwwGAGjMV2shiwMAG0giObmhY1ZoKC/XgQYx4PJe3lAz8Sx0n0uaq+Dp?=
 =?us-ascii?Q?sue2Z12SGO6f4lqTmMjPeDBKCvPu+4E6FUr3UaXy/RwHF1Chzm6ERas+XdN+?=
 =?us-ascii?Q?anAnIArhcP85e+bjr0BO+YmYNtR4iwaOFmvAcltR/MhatnV/tDJt7qEPAWzA?=
 =?us-ascii?Q?w6z5Y3TqQZMJpr2WlfcvZU9k3Y5mXawuD4FRDQ46OUYJBAPrY7KwWZ9Azp+n?=
 =?us-ascii?Q?PjpUtAOszuy90tKqzmSqbIVZhvl9oS8sQqFDkkpj9JV/8Rqw2nv/vQwiiL9M?=
 =?us-ascii?Q?svWe1dUe4f/bZUZwAzeWp4psWllnRXWBPDz7G/55KBzFRH6K3DpZwZVWUOEW?=
 =?us-ascii?Q?/qt5wR4Cuq1Va6BiH7QWS0oiCpbpkkSetxCSJComrxA52BSirMWKqNZwBp8c?=
 =?us-ascii?Q?AnCnIe4QAHeBWCPfn3fMswnVhASqJGmjkWqLg5FCShlA/voEoh1x8mNaa8yS?=
 =?us-ascii?Q?KkEgxGkWYNxb5m5F/Psu4nauIifT+cFACaSQUiFTk96f83VxYz8KQ0i8WvMH?=
 =?us-ascii?Q?mG3WO7D8/sIMEnw6USb6amZVvhwkarUt/XR9FVKj1FsGBta/ADorCWvSqT7N?=
 =?us-ascii?Q?ZxdNzK1FhGlU78PH/wcfXRdyMkkaSjBQX+1Vhje61hWvria6DgzsX4tqAWG1?=
 =?us-ascii?Q?N45SD5gvUA8Js8xAIa7QeNHEJEUvZ4neEqV33zmxQ8k89l0FPfx2fttYmyiC?=
 =?us-ascii?Q?nDJEGqkfDIW5+jvokGVg3ixygpM+En7eb8hpyzQjNWoCwHGwnhb8Qg19e/YI?=
 =?us-ascii?Q?xkUwAzMDNc35EC/BFzLGaTEbP5jj/BRNdIhtdn9cKquQpcAvbE1QEkNAbnJh?=
 =?us-ascii?Q?jH5qOfdU67J9u6zUh6lmf3bPKJNOqHSa0tZVbJZtVx+htM/LGZJTsQbDm3z5?=
 =?us-ascii?Q?kcIq8I+vuIMNkaX201ae3HxLH4DRqH+L1Oeh8vQ0EOMHISuG6ApRmJhW9ZZB?=
 =?us-ascii?Q?9Qv4ndkxMw246bUTPck9RFOWqZ3UXp/T39YfLk5zIO/kn4ZY/z1sNKvYpRZr?=
 =?us-ascii?Q?/CP31sn99UVF3NrvXDq/m/AOZV+kvVvmnfDukw8+RsQrctsAnYSoOYsgsJ+H?=
 =?us-ascii?Q?Vgd9hRhnfKcynmH5T8q9kb+vmzoMSEjL6zg9agFQKrW24Q8qvkVRO4iTBMSI?=
 =?us-ascii?Q?+lqhb9u7k7dsugWLG3iUyTik8dx0uHr95OU1sebecbAKW+ZWdfds/Nbuk/RT?=
 =?us-ascii?Q?2mpgNjleuB853xV0nDrsVIzEwjbLUAW9B2NhpC8tL8NB19M4GNj3Nm+FkKsG?=
 =?us-ascii?Q?c+M/Oz5IQJ415rxoyub9bhZ1MNhjqb/L788OiCQ8vlmYsQdPdzSJ6B8Q+Gly?=
 =?us-ascii?Q?Sfatqn92xtCLiq6puU240IvTE1FUc2a+91kR4LVInC9s//jEUPPwPd8rg6s+?=
 =?us-ascii?Q?URS6tqqHK2SiZxWfg/Go8YPkgzPeeqgNOMwV5T9SdZiPNQoqTSatRWx+ySSK?=
 =?us-ascii?Q?aCcDG4xdxYVYDZ/Q9Xvsb/yo6lBp6Cye3/2llcoRZms3i+L7U+PziC1krzZl?=
 =?us-ascii?Q?ensgS6vmWwUvuSxVfw/QH8xaANTjHThOm71NnbZEEIOpVyMzsw0CzrML6b8N?=
 =?us-ascii?Q?C0gY4G9WSSkuSkzSE74jLiWwpBGx+9DkGTpZ0CfV3iUYIIU3lJqOg4+nHSnD?=
 =?us-ascii?Q?iAGmzIm6X8fCf7Y9Po5+j62iF2741jbnAPzynGukXi1YZ+aaJ8lhc9jBu8r1?=
 =?us-ascii?Q?0AtTWyBP0A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a8cda8-81fa-43b1-d7de-08de3f496f76
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 21:56:17.0654 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDKCXjrIjZKI6Ovx524e31V4CbYtSkdiid8OftdYNmrCtspRfR5nqZ+gzGoneqRO9B0klx65uNP/Wg5G3RtoAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8314
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

On Mon, Dec 15, 2025 at 06:46:10PM +0100, Lukasz Laguna wrote:
> Check correctness of the wedged_mode parameter input to ensure only
> supported values are accepted. Additionally, replace magic numbers with
> a clearly defined enum.
> 
> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
> v11:
>  - update the Xe Device Wedging doc (Rodrigo),
>  - change the name of XE_WEDGED_MODE_UPON_ANY_HANG (Rodrigo).
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c      |  5 +--
>  drivers/gpu/drm/xe/xe_device.c       | 54 ++++++++++++++++++++++++----
>  drivers/gpu/drm/xe/xe_device.h       |  2 ++
>  drivers/gpu/drm/xe/xe_device_types.h | 21 ++++++++++-
>  drivers/gpu/drm/xe/xe_guc_ads.c      |  4 +--
>  drivers/gpu/drm/xe/xe_guc_capture.c  |  9 ++++-
>  drivers/gpu/drm/xe/xe_guc_submit.c   |  7 ++--
>  drivers/gpu/drm/xe/xe_module.c       | 10 +++---
>  drivers/gpu/drm/xe/xe_module.h       |  2 +-
>  9 files changed, 94 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index ad070055cef1..0b65c3940f41 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -267,8 +267,9 @@ static ssize_t wedged_mode_set(struct file *f, const char __user *ubuf,
>  	if (ret)
>  		return ret;
>  
> -	if (wedged_mode > 2)
> -		return -EINVAL;
> +	ret = xe_device_validate_wedged_mode(xe, wedged_mode);
> +	if (ret)
> +		return ret;
>  
>  	if (xe->wedged.mode == wedged_mode)
>  		return size;
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cdaa1c1e73f5..492446fdc4dc 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -767,7 +767,10 @@ int xe_device_probe_early(struct xe_device *xe)
>  	if (err)
>  		return err;
>  
> -	xe->wedged.mode = xe_modparam.wedged_mode;
> +	xe->wedged.mode = xe_device_validate_wedged_mode(xe, xe_modparam.wedged_mode) ?
> +			  XE_WEDGED_MODE_DEFAULT : xe_modparam.wedged_mode;
> +	drm_dbg(&xe->drm, "wedged_mode: setting mode (%u) %s\n",
> +		xe->wedged.mode, xe_wedged_mode_to_string(xe->wedged.mode));
>  
>  	err = xe_device_vram_alloc(xe);
>  	if (err)
> @@ -1246,10 +1249,10 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * DOC: Xe Device Wedging
>   *
>   * Xe driver uses drm device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> - * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> - * used. Certain critical errors like gt reset failure, firmware failures can cause
> - * the device to be wedged. The default recovery method for a wedged state
> - * is rebind/bus-reset.
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot
> + * be used. The conditions under which the driver declares the device wedged
> + * depend on the wedged mode configuration (see &enum xe_wedged_mode). The
> + * default recovery method for a wedged state is rebind/bus-reset.
>   *
>   * Another recovery method is vendor-specific. Below are the cases that send
>   * ``WEDGED=vendor-specific`` recovery method in drm device wedged uevent.
> @@ -1314,7 +1317,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	u8 id;
>  
> -	if (xe->wedged.mode == 0) {
> +	if (xe->wedged.mode == XE_WEDGED_MODE_NEVER) {
>  		drm_dbg(&xe->drm, "Wedged mode is forcibly disabled\n");
>  		return;
>  	}
> @@ -1348,3 +1351,42 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		drm_dev_wedged_event(&xe->drm, xe->wedged.method, NULL);
>  	}
>  }
> +
> +/**
> + * xe_device_validate_wedged_mode - Check if given mode is supported
> + * @xe: the &xe_device
> + * @mode: requested mode to validate
> + *
> + * Check whether the provided wedged mode is supported.
> + *
> + * Return: 0 if mode is supported, error code otherwise.
> + */
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode)
> +{
> +	if (mode > XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET) {
> +		drm_dbg(&xe->drm, "wedged_mode: invalid value (%u)\n", mode);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_wedged_mode_to_string - Convert enum value to string.
> + * @mode: the &xe_wedged_mode to convert
> + *
> + * Returns: wedged mode as a user friendly string.
> + */
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode)
> +{
> +	switch (mode) {
> +	case XE_WEDGED_MODE_NEVER:
> +		return "never";
> +	case XE_WEDGED_MODE_UPON_CRITICAL_ERROR:
> +		return "upon-critical-error";
> +	case XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET:
> +		return "upon-any-hang-no-reset";
> +	default:
> +		return "<invalid>";
> +	}
> +}
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 6604b89330d5..b6ef72e95a3d 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -194,6 +194,8 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  
>  void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>  void xe_device_declare_wedged(struct xe_device *xe);
> +int xe_device_validate_wedged_mode(struct xe_device *xe, unsigned int mode);
> +const char *xe_wedged_mode_to_string(enum xe_wedged_mode mode);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 96acc43b94e1..20a847965b20 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -44,6 +44,25 @@ struct xe_pat_ops;
>  struct xe_pxp;
>  struct xe_vram_region;
>  
> +/**
> + * enum xe_wedged_mode - possible wedged modes
> + * @XE_WEDGED_MODE_NEVER: Device will never be declared wedged.
> + * @XE_WEDGED_MODE_UPON_CRITICAL_ERROR: Device will be declared wedged only
> + * 	when critical error occurs like GT reset failure or firmware failure.
> + *	This is the default mode.
> + * @XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET: Device will be declared wedged on
> + *	any hang. In this mode, engine resets are disabled to avoid automatic
> + *	recovery attempts. This mode is primarily intended for debugging hangs.
> + */
> +enum xe_wedged_mode {
> +	XE_WEDGED_MODE_NEVER = 0,
> +	XE_WEDGED_MODE_UPON_CRITICAL_ERROR = 1,
> +	XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET = 2,
> +};
> +
> +#define XE_WEDGED_MODE_DEFAULT		XE_WEDGED_MODE_UPON_CRITICAL_ERROR
> +#define XE_WEDGED_MODE_DEFAULT_STR	"upon-critical-error"
> +
>  #define XE_BO_INVALID_OFFSET	LONG_MAX
>  
>  #define GRAPHICS_VER(xe) ((xe)->info.graphics_verx100 / 100)
> @@ -604,7 +623,7 @@ struct xe_device {
>  		/** @wedged.flag: Xe device faced a critical error and is now blocked. */
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
> -		int mode;
> +		enum xe_wedged_mode mode;
>  		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
>  		unsigned long method;
>  	} wedged;
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index e06c6aa335bf..e95604416f2d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -451,7 +451,7 @@ static void guc_policies_init(struct xe_guc_ads *ads)
>  	ads_blob_write(ads, policies.max_num_work_items,
>  		       GLOBAL_POLICY_MAX_NUM_WI);
>  
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>  		global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  
>  	ads_blob_write(ads, policies.global_flags, global_flags);
> @@ -1004,7 +1004,7 @@ int xe_guc_ads_scheduler_policy_toggle_reset(struct xe_guc_ads *ads)
>  	policies->dpc_promote_time = ads_blob_read(ads, policies.dpc_promote_time);
>  	policies->max_num_work_items = ads_blob_read(ads, policies.max_num_work_items);
>  	policies->is_valid = 1;
> -	if (xe->wedged.mode == 2)
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>  		policies->global_flags |= GLOBAL_POLICY_DISABLE_ENGINE_RESET;
>  	else
>  		policies->global_flags &= ~GLOBAL_POLICY_DISABLE_ENGINE_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_guc_capture.c b/drivers/gpu/drm/xe/xe_guc_capture.c
> index 2cda92f7b323..bdd700ac1e54 100644
> --- a/drivers/gpu/drm/xe/xe_guc_capture.c
> +++ b/drivers/gpu/drm/xe/xe_guc_capture.c
> @@ -1889,7 +1889,14 @@ xe_guc_capture_get_matching_and_lock(struct xe_exec_queue *q)
>  		return NULL;
>  
>  	xe = gt_to_xe(q->gt);
> -	if (xe->wedged.mode >= 2 || !xe_device_uc_enabled(xe) || IS_SRIOV_VF(xe))
> +
> +	if (xe->wedged.mode == XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
> +		return NULL;
> +
> +	if (!xe_device_uc_enabled(xe))
> +		return NULL;
> +
> +	if (IS_SRIOV_VF(xe))
>  		return NULL;
>  
>  	ss = &xe->devcoredump.snapshot;
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 21a8bd2ec672..fd41b06d11df 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1288,8 +1288,9 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  	err = devm_add_action_or_reset(guc_to_xe(guc)->drm.dev,
>  				       guc_submit_wedged_fini, guc);
>  	if (err) {
> -		xe_gt_err(gt, "Failed to register clean-up on wedged.mode=2; "
> -			  "Although device is wedged.\n");
> +		xe_gt_err(gt, "Failed to register clean-up in wedged.mode=%s; "
> +			  "Although device is wedged.\n",
> +			  xe_wedged_mode_to_string(XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET));
>  		return;
>  	}
>  
> @@ -1304,7 +1305,7 @@ static bool guc_submit_hint_wedged(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
>  
> -	if (xe->wedged.mode != 2)
> +	if (xe->wedged.mode != XE_WEDGED_MODE_UPON_ANY_HANG_NO_RESET)
>  		return false;
>  
>  	if (xe_device_wedged(xe))
> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
> index d08338fc3bc1..9934f90691fd 100644
> --- a/drivers/gpu/drm/xe/xe_module.c
> +++ b/drivers/gpu/drm/xe/xe_module.c
> @@ -10,6 +10,7 @@
>  
>  #include <drm/drm_module.h>
>  
> +#include "xe_device.h"
>  #include "xe_drv.h"
>  #include "xe_configfs.h"
>  #include "xe_hw_fence.h"
> @@ -29,7 +30,8 @@
>  #define DEFAULT_FORCE_PROBE		CONFIG_DRM_XE_FORCE_PROBE
>  #define DEFAULT_MAX_VFS			~0
>  #define DEFAULT_MAX_VFS_STR		"unlimited"
> -#define DEFAULT_WEDGED_MODE		1
> +#define DEFAULT_WEDGED_MODE		XE_WEDGED_MODE_DEFAULT
> +#define DEFAULT_WEDGED_MODE_STR		XE_WEDGED_MODE_DEFAULT_STR
>  #define DEFAULT_SVM_NOTIFIER_SIZE	512
>  
>  struct xe_modparam xe_modparam = {
> @@ -88,10 +90,10 @@ MODULE_PARM_DESC(max_vfs,
>  		 "[default=" DEFAULT_MAX_VFS_STR "])");
>  #endif
>  
> -module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, int, 0600);
> +module_param_named_unsafe(wedged_mode, xe_modparam.wedged_mode, uint, 0600);
>  MODULE_PARM_DESC(wedged_mode,
> -		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-errors, 2=upon-any-hang "
> -		 "[default=" __stringify(DEFAULT_WEDGED_MODE) "])");
> +		 "Module's default policy for the wedged mode (0=never, 1=upon-critical-error, 2=upon-any-hang-no-reset "
> +		 "[default=" DEFAULT_WEDGED_MODE_STR "])");
>  
>  static int xe_check_nomodeset(void)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
> index 5a3bfea8b7b4..1c75f38ca393 100644
> --- a/drivers/gpu/drm/xe/xe_module.h
> +++ b/drivers/gpu/drm/xe/xe_module.h
> @@ -21,7 +21,7 @@ struct xe_modparam {
>  #ifdef CONFIG_PCI_IOV
>  	unsigned int max_vfs;
>  #endif
> -	int wedged_mode;
> +	unsigned int wedged_mode;
>  	u32 svm_notifier_size;
>  };
>  
> -- 
> 2.40.0
> 
