Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2189C7115C
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 14:19:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805ED10E740;
	Wed, 25 Jun 2025 14:19:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A5dYsOQa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B044610E73D
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 14:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750861170; x=1782397170;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3gWwekD5xyzhzq7RqzT27Kr2G89MsTZbGOsb79fcikQ=;
 b=A5dYsOQaHB+aQY5AaGX6UZujoQ4Co/w+NUt+feDgEbMBCPwxz07V95ic
 5cL+MvBSFoeoV5W4rf/xx1jL3iDqGnSxbNf1NuH62ogEYaAOOMnOCkp76
 HfQHFnFvq6XUhCLY1KWQPhUlw/DoGgi+8NcPeY1zZryqKtm3UFQShBhQX
 i/BCT7LhEf4Ran08BZTQBcQcI0T8bG3HJrNcVecMeMo3Tqmi2o/+uiQ5j
 oDa5JHguelGfcUTa1Sl64bjdHnTR5F0UmcpOx0qjdZk3d+YgmoVptPp2m
 Nh2WFiK6DDcmUFHS9qPFIPtbzNgzrOW2BMS3HnOyvsyXbvGAatFTPdajT A==;
X-CSE-ConnectionGUID: RJ8MvuvCQReAjwBh5T/UxA==
X-CSE-MsgGUID: 2TbC7ijJRpSt6XQzf4vkxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="78561986"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="78561986"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:19:29 -0700
X-CSE-ConnectionGUID: OSghK9YwRTOU8Omo/h8VVQ==
X-CSE-MsgGUID: W7rD2DOsTDKJXO2pEBssww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="156796463"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 07:19:29 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:19:28 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 07:19:28 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.64)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 07:19:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H9Q3I3ueSn0XR/yDDMc85uECtzxSoz+BRHsrxV3CSRMVtJFaTtDx8t+5SRqjIVGPivJ45EykFKrTFU+a19CN3SeWVkwMOQzzxOhqyFheW3ErXlNGucICHQo+9uQBe8xPQNlPEA0/Wd2T/v9upwMvJX5mNTvxjUQFiHYF0wEz+UPtk1DqNtji+gDYpUJE7sreAqFqRBFh4qaluyJHQDnRGcBpdY+CRI5UsppOfxGmBBQEHM5YzeGTvpLLUCvcDXQAZax9CoKFm3OgOQC5Lw0rjQatKEjNWyZj5PiN2qKAFHvVV66FEYQBeP2DkE2gwOqXpXrIDwWGdjZkSwYQFCEqmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFXHby9BhUrj0CViEIcTe65HLpw1lotJTrx1wkmFEwg=;
 b=x8vU4oLWcPG8ulr68qnRjDznaWrk/yLqI1apEXl73Y/r8df0IEmNnz2Odbt7UmSHomUJEfI04cWf/5qLFFynH4CqXPiLrfoT4wr/WwaH4NPlZzAyRovqFhOQ1OMrrIpJ+lIgbBNSmZo+aW1rbrRRfQW7ryckh21hZ+Zs/uq7CHvCgsnBi74dExg4DYvK8d76b8Lqkh5HSwV+mc1C7PiXJODPl0w+6SD62wcB5tj5STWzwCuIYa58eeHA2NXqeRL5EsqYgEfOcIynmOG0p3QSbj0Rg55o3+SkGSlhPqY2V2lA8X1Y4CX/Ktp6cNn+o09B5PkF6xZh0yF5/CtC1lx2NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SN7PR11MB7708.namprd11.prod.outlook.com (2603:10b6:806:352::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Wed, 25 Jun
 2025 14:19:12 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8880.015; Wed, 25 Jun 2025
 14:19:12 +0000
Date: Wed, 25 Jun 2025 10:19:09 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
CC: <intel-xe@lists.freedesktop.org>, sanirban <sk.anirban@intel.com>, "Badal
 Nilawar" <badal.nilawar@intel.com>
Subject: Re: [PATCH] Revert "drm/xe/ptl: Apply Wa_16026007364"
Message-ID: <aFwFXaiNFr1sDyxk@intel.com>
References: <20250625001202.1616606-2-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250625001202.1616606-2-daniele.ceraolospurio@intel.com>
X-ClientProxiedBy: BYAPR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::23) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SN7PR11MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: f1e98029-cc1f-45cd-3d27-08ddb3f341d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PvQedF6noTlfcUon2MTZFDRN6Kh3573Zuz48NhtJCJZcrxLI6+B2oq9AKkaH?=
 =?us-ascii?Q?npSXU6xxJtYdZotN7G7CaA4ynXZfHodvnhNN7pzWg8HC37Bphe6vQnbjZKQU?=
 =?us-ascii?Q?z9KLJFhXYGvM+E4QsDsah9oseEXsVVaqWZXB8zN5jC7Q+0IVQaPPZZ4Dfm13?=
 =?us-ascii?Q?XzSrhXbvU6PsSPGufh6QwJq78UYwvDFAj8PVCBH0PeHKuSWxruG53WiyncRB?=
 =?us-ascii?Q?MQkYthi7ScEjkq4DSRs4AnN7mNB16X7ywFkrYVUJ5bmiEOfM4kWa3mZXJMs1?=
 =?us-ascii?Q?DLoyFxp34Pg+JileHiwDu6KIb+DJ9t6dXjO3Oi7G/6Q6mTfG8XgR6md+v6v6?=
 =?us-ascii?Q?wCEWFLizVapxKXy5U21eZ4ZaSgshoAMp26yw7+HNceqA2SmOIkh4BcjSTmDW?=
 =?us-ascii?Q?/JV0VCbD7bxoZFub1m9t3eMsByJWJRYPABu81Qk+X/otJBgfeLvbJEnqq+/8?=
 =?us-ascii?Q?SxszC584y9UxC8LMHKpDBSSlyW88D+K2gkT/0Ud9SH05gMTm0rgsuAUmlKYZ?=
 =?us-ascii?Q?opTRa1uQ//YMVoHcaz40Ab1MaPI8sOfmnI2BPmHNWWdVpcS45Qdn6zkJZ6Os?=
 =?us-ascii?Q?YkQzokc9GqmSfXt435FfymF0fE8wNtC/A290jgAYhDmv6B6buiEkh9LyCjNW?=
 =?us-ascii?Q?TlOAz7NBbmIXeeQRmKgBv5TcK8ifxYR1apz14EJBWhQmRiQZgzUzubSqeDEb?=
 =?us-ascii?Q?AcsxQFM2AE3DF4OrdWUXH+DX2ssDBC7aZg0/oqS9lXzxC5HJZ9UPFoIW3GJx?=
 =?us-ascii?Q?Tfs7wD0NdcXtUbsyL7YL4pML0JawxJ1ax/mzbhJ+0nfwENQWOP8Cz2Nn95kD?=
 =?us-ascii?Q?MJ0C52N7I1a0QRBUqEyJuUruMZboU7/RK0neZUifpln0L095xvJCm+Atu12C?=
 =?us-ascii?Q?0AMvRGY/RG/gJwfLFT8Ii0waIC4Vk2H6Frd3ij7L7iYHvkM1hPENIjNJsV39?=
 =?us-ascii?Q?hS1jsPC/Rj2jWTg2n+sv5OBvwvhCFBgu0Ver0SHCs7UgU0wUflVbm7rgjLYF?=
 =?us-ascii?Q?M/HsJlRMykh2X6Eu4aTGhSUcGxKs3EjSDGUbOH+SpndDO/KVuwxCY3wNWbl4?=
 =?us-ascii?Q?Aniz7Av2/UqP/Dx+/oA85uXcrk34hCvLv5WijR/ve+vP0hKiVZcDBgSr6WSU?=
 =?us-ascii?Q?yNFtTG11Jmj1ytKuW3SZ2+5wyVzR78nqG28HUUJeC6pG0jcv2987pVNnIm1D?=
 =?us-ascii?Q?HjRVc1V3GAf3qlF9cSLEg/nP+2fl1z9ILQIrF+AaOymYQhfpu7CIVP5fBNro?=
 =?us-ascii?Q?mFdXsTH0l5UuEeJBeG+cQG1lqx5BF8Ef6aYIHWmjXxR1BfyDXlJdb9UwWjnn?=
 =?us-ascii?Q?s+Y2tdz/JSqJsEpT5MbFFn12ekMGMyuPL6XfU5LxlqHKRvX94t8mf5cA8As1?=
 =?us-ascii?Q?mSg2AmVAvsb9/FGZLezv/eqduqjFsTjy9JsXi5kuhAWJfAmQiwCRdkjYSgk/?=
 =?us-ascii?Q?BCDPEfBnwCA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MrpdzaKwwglkUUQOG3no4RSvSQXhdbdEhHyVPATda+dB5POiJ+sozSJo8lNA?=
 =?us-ascii?Q?Po3XXFCS7LciTOOC+tXahcA0y0vXsLANVy187Ni0IAQ/B218Sc7s/l8wn8eH?=
 =?us-ascii?Q?zePg65/p5DUEMYsVGCyYuVyxo+EewKh73al6ortgxUdcsH1XiQMILEYjxSkW?=
 =?us-ascii?Q?I7qwR4BWI5oC9kL/D79RbyVF7m5JFf5D527hfYb9ym3ozLZoIjskstU32Dut?=
 =?us-ascii?Q?y0Vd26zCGUbiGtxcPhWpdEJZcV/jvCZCNtZC8drnW0YFQhNGfY8PZWTONSoM?=
 =?us-ascii?Q?9evBEdV7Q8prqAvzKj2tDrx1qgVjdZV+ynBcI2EZ0aD63yifzUfL8VFbGXYX?=
 =?us-ascii?Q?ncLbRBRfcIGtP+qtcADIirAEK1Ez2uJrxIt8Xw/rfOKsI5ln7OwdjlIyHT+v?=
 =?us-ascii?Q?uljFlh7SVkfIb6t24Y3PoDyxhtHyrjkGcy++/AK/72zT+qx7UTXw32WsUYAg?=
 =?us-ascii?Q?h/ANw0N4baX2pp6SO+BZb+t23CNVuB6X+LJCQwAzYLCsJAtybCtRgBN90MER?=
 =?us-ascii?Q?P8l/ZNNXg8kKijPVjguoYzQK8HY9JoGU2V7NlV4Og6VygllTAeRimCWbvw8/?=
 =?us-ascii?Q?s4BWyBL/dwLlBCUptJ3aMp1+pSTBIB3y2JeLD2XcSug8UJvMFgLfk5RmJb+j?=
 =?us-ascii?Q?LzIA+YRLKmQVBjAo0VUdhDCopPu5tkIpV0anWjwM/9v+iD/CoI4uNkja9SzF?=
 =?us-ascii?Q?zvnoesTWLsCQZ5tc4P4Lq46OAjlWJAxacmhDShqGZMH6QEb/pE9O9ZT+WwLx?=
 =?us-ascii?Q?3kIZitcFYl20+sfYby+NFeYszrIu3z+X0nDqk5o8Qhj12d/dX0N6XdLnpye1?=
 =?us-ascii?Q?gbSjBKOeeGwm9EK+23z0l/lyAbtVPjjPkOXWwnDKRSusvAayQO3v3ZXlLsWU?=
 =?us-ascii?Q?rC37okA4NBNVt5sCip5xP31x5gQoIZvUw7Rvnsd1+p3Qmv5z54loHJZEmaOj?=
 =?us-ascii?Q?OP9XZixZrOHJIiR6KbgVl0dwT4bhyp58Wyq2+t/RlJqjGtD5ddyTbQUNRgk0?=
 =?us-ascii?Q?tlFYrqX+aWPsQQeYbKvvSXFPlyBeMA3GfZOVbI+HSroR86SjbFkTKTIO5oic?=
 =?us-ascii?Q?d6DrghAuiU8s4aOirprbUMDCeSDhYlKsXgw20uua+19f2UfCo3WvRr2XOeqw?=
 =?us-ascii?Q?5rObKeVuaHLAtETV2eykNySHpp8MJVk+SgqLXGUkw6pTHvEIX++bOdZOdKOh?=
 =?us-ascii?Q?p+Car2w8P03pL75FHgzYjWn2Tk92GUlhK5Wbtb6lHXQJ7VhCmo64Lcn8GRlJ?=
 =?us-ascii?Q?n82SQT8f55RvqLFfFSzS6P2cG5Ug2aBvu9Oq3kjo0S1bRX1HzklDdhV9JYXk?=
 =?us-ascii?Q?WO/usamytHQgVpvirDRITafyzYYgJjC2u4gutYI7qyvgxcsdgTPutvXdwi6Y?=
 =?us-ascii?Q?Q7hoWXUcXzwAaPRTn1jI/Hu+4hD2QH/oKP9T60KO5yfpk/MNFuU94Pe6/VzU?=
 =?us-ascii?Q?zW/HrTq+ap19MZCwXyqpNUcc8HbiVRbDgms5At6uRPUkWOrMzFqbHqtUSU0z?=
 =?us-ascii?Q?r9BO6+bbhE7AV3B4iUEc8wRDj/G6wbqNN78Zyq3DKq7UTpKvLaT0wfQe/3pz?=
 =?us-ascii?Q?JLmHeMU6y1qiriViTALQyV/PbDxxGfzotV68nTvxstkwjLGjAaPNl4R1eztl?=
 =?us-ascii?Q?sQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1e98029-cc1f-45cd-3d27-08ddb3f341d9
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 14:19:12.1880 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P6CP6lsRFWRo7hY3lhS2W+Y2JYTyDDgU0ly+Zi6NR7rrnZ7mSzblEep+/tPHPNfc0YnmjirCXKVWH5dpMF9iWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7708
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

On Tue, Jun 24, 2025 at 05:12:03PM -0700, Daniele Ceraolo Spurio wrote:
> This reverts commit 3972872e459d812ab5e481a231a6066cf4f4d0f4.
> 
> There are several things wrong with the way this WA was implemented:
> 
> - The KLV is only supported on GuC 70.47.0 or newer, so we shouldn't
>   apply it unconditionally.
> 
> - The KLV requires 2 DWs of data, which are not currently provided.
> 
> The GuC currently ignores any unknown KLVs, so on versions older that
> 70.47.0 nothing happens. However, starting on 70.47.0 the GuC attempts
> to parse the KLV and fails due to the missing data, causing a GuC load
> abort.
> 
> Given that 70.47.0 is the first GuC version approved for public release
> for PTL, let's revert this patch so it doesn't cause the GuC load to
> fail with that blob. We can then re-apply it properly fixed after the
> GuC definition is merged, which will also have the added benefit of
> running the KLV addition through CI with the right GuC version.
> 
I added
Fixes: 3972872e459d ("drm/xe/ptl: Apply Wa_16026007364")
to help tooling propagation and pushed to drm-xe-next

> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: sanirban <sk.anirban@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/abi/guc_klvs_abi.h | 1 -
>  drivers/gpu/drm/xe/xe_guc_ads.c       | 5 -----
>  drivers/gpu/drm/xe/xe_wa_oob.rules    | 1 -
>  3 files changed, 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> index e2583761a70d..7de8f827281f 100644
> --- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> +++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
> @@ -368,7 +368,6 @@ enum xe_guc_klv_ids {
>  	GUC_WORKAROUND_KLV_ID_BACK_TO_BACK_RCS_ENGINE_RESET				= 0x9009,
>  	GUC_WA_KLV_WAKE_POWER_DOMAINS_FOR_OUTBOUND_MMIO					= 0x900a,
>  	GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH					= 0x900b,
> -	GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG					= 0x900c,
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index f3c74f9a40c6..07a027755627 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -382,11 +382,6 @@ static void guc_waklv_init(struct xe_guc_ads *ads)
>  					GUC_WA_KLV_RESET_BB_STACK_PTR_ON_VF_SWITCH,
>  					&offset, &remain);
>  
> -	if (XE_WA(gt, 16026007364))
> -		guc_waklv_enable_simple(ads,
> -					GUC_WA_KLV_RESTORE_UNSAVED_MEDIA_CONTROL_REG,
> -					&offset, &remain);
> -
>  	size = guc_ads_waklv_size(ads) - remain;
>  	if (!size)
>  		return;
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index 8c2aa48cb33a..96cc33da0fb5 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -70,4 +70,3 @@ no_media_l3	MEDIA_VERSION(3000)
>  # SoC workaround - currently applies to all platforms with the following
>  # primary GT GMDID
>  14022085890	GRAPHICS_VERSION(2001)
> -16026007364 	MEDIA_VERSION(3000)
> -- 
> 2.43.0
> 
