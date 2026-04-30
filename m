Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAC4FF886F
	for <intel-xe@archiver.kernel.org>; Thu, 30 Apr 2026 05:03:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C401F10E0CF;
	Thu, 30 Apr 2026 05:03:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z2QziqQj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12DD10E0CF
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Apr 2026 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777525384; x=1809061384;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RaPfuZ5K7nY70g5cqYA7UsHnRhCNnF5GSU0H4U1cTv8=;
 b=Z2QziqQjp81bSVDVd+rOLymaTuA4R+of4hEFf3A0uZJy7/AyNfxNJTba
 3u4IBalDVu3juiLfwJUWxKDSe+W3aeRHvs3y9EPRPnoaxTgJ/uVPggMvb
 dUtZx1g0OEUQvecJmqFE4ZOk2eisrp0m0KxficaUs1Y/vfF7O+FacL6PT
 vNp0xg4QhLOjGEfhcG/EjwqBiZKHP5Hr6wFBmjpGTvi8HsBV/8Fk7z5hr
 6NiK3ajT70dmyXsE5p+eCTuEJNqo2EmU2gagLw8LnDHYAOFdMZpwLMAZa
 fPL4ZKH/GlBsiENtYxNIMfxv5X2rLhwNwsjMKQuY5VDQnCxkIqXB1wLRU Q==;
X-CSE-ConnectionGUID: qrkvwSzhRPu2YQ4P0lv9Gw==
X-CSE-MsgGUID: xHWuoNPGRq6D0kQgw5YRow==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="78385650"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="78385650"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:03:03 -0700
X-CSE-ConnectionGUID: JR6Xc/IfQUGRVJUmKYxKcQ==
X-CSE-MsgGUID: qOHVK49STkq4PU0zrA8Bmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; d="scan'208";a="239458963"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 22:03:03 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:03:02 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 22:03:02 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 22:03:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y2v6GWmup32O05/tfvHI8Ldq5ge8aUIEVAPSu4Qzo+v/oByIV1mGK2sRiufTI6rZQ0K82DD58RZk2wbGYMeU1nh3cbbIQItmJyIQGkw2HOWuJxwlueN3Gjv8Ol6zN3qP5VEQb82ABjQXhV41WLP3bEeeNgpKgSvWmcxPxcybHdgOSaMsk1wsFBXe7htIDHA2B/XkVqM290t9/el+bcDy9oVasfMmNQohmXlEXaCjpIMTyeyYBaXihqFKG9eajWyvk4I4JDuSdfhIeQV62e3q8BeMBCgJmb+sUrJe7IWkqijvppmyHpcLo9ciSh6NUUxUQb5w0LI/W6445pgnyYtaZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TupyCHm3xHd93cZp0/BZToM1GghyeMf7cVeRotMZ8l4=;
 b=XTbTQaYDo0fQUATzPebymiN9xurp5ZeLxOB0B7xsmNJhxokNOws/u/yW+BMgNCgkNs7rWeHh2fIOwkjz6qN0iankREHxSDsUCvwYSfCc7AbWnKVCp6LY/l5QQpsTWs5+UbFqk634cn4gvcLMrTJXS5pqgqNRlpH0zP5+9BU1uUyfKecUND19o5An4UHOPb0HYelC+EJlZ3CTwZzJnTtCihWPpQ7tH/R9t3jgSCSN1BSo2TSMjl0qBgP1Q3+Ew/YJoMm2t8fyi/zfcOeHZ8E7vMVBziL/bzT2+Rs8MUWVTIhLIiYBAO8+N+3RuZvb10BK0FR7DjvZ7a0ppWPo7bwC/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by MW4PR11MB8267.namprd11.prod.outlook.com (2603:10b6:303:1e2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.19; Thu, 30 Apr
 2026 05:02:53 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%7]) with mapi id 15.20.9870.020; Thu, 30 Apr 2026
 05:02:52 +0000
Date: Wed, 29 Apr 2026 22:02:48 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Arvind Yadav <arvind.yadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [RFC v2 7/7] drm/xe/svm: Correct memory attribute reset for
 partial unmap
Message-ID: <afLieKDV/IA5Ftku@gsse-cloud1.jf.intel.com>
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
 <20260406085830.1118431-8-arvind.yadav@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260406085830.1118431-8-arvind.yadav@intel.com>
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|MW4PR11MB8267:EE_
X-MS-Office365-Filtering-Correlation-Id: d109250b-3c14-4459-fa96-08dea675baf1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: WIxcKPRAX45JqqK652wBzmdhzkt41T35Rn9mWxhGJjpLLHKb6hClcn9qLJjefJKoZcqKlaRQQr5l3DwGeaBOLjQLl9XvVL2R/k2CMkCVNCIY6G9j5y/IuIzb3hZVvq5BGMHgSELCBCileG9O6WhThPjNRvl2PwRacTPoTuxm18GC99Fs0tKdhIbqMGNhmsa/BlK4vzQTB3DFoncBAtqwbTRk0MhwZlIMFzMm8NDF/Si16qRJqNKeczmMV4GVjUIzFPYvQsQLREIao009VlI8Slu+5heQCuwy3zmOCCQqVF4Qeph0Pkj1b7E7mp3EFq2C6vRH4ATpl9tcyk1ovlEK3LBi8uYyjeIzPdjJ44XU7PoJfxqSe95kPn1cRO+FbT79nFhvtZb8Qe+OUzdoJZ+FMh5ulojUHaBh/QfvSXaSeX+H59skZzGDUe+VO796RBG6Nyy2fp4JF3c9VaEl309UYcfSWbI8ueUaW783MYP6+EPUAjoMHCfXnv8QkdaFnmSkBngqzU5Rifyjqy+E4NWZLmkatVfusq+k9LMWCmuiTB2MgpjpHwAZwwMbybNeyP+gxlcEIi+1av5gB6UKeLnehT0xf/tAUnHLgH/na9BvHUHn/MP1NucPgwre6Enq4mg1XdFT2vU6oUKHnZC6JVzrqjw2lF2l9fWE2dXZHnXemYbQEp2R2B+hKZcmUtXx+7G9i6YVr6UwHUGEW9os5zaHP8uVXSjp2RVWLCq2M5ydMRQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DkMvsLbZwJIvUEQEzDDCHNU4A1xqJYGP0GQch/Q1A5n+V1NN5YKzEta92q?=
 =?iso-8859-1?Q?mre8Rm22MgYlAvS3X/PF4THB1TkW8Ho18r3DxwagFH3e1Tm9/KyW19W/5N?=
 =?iso-8859-1?Q?SJ5RAIIdwRiIG3X2E7aRrhbNa/8oXt4AsCdPHibcp9Y/Yr/thpZp3RsohU?=
 =?iso-8859-1?Q?q6bzI9dq825F1a5gdCdx6nj5bae9dPye+ZT2VC49o6h8e1WVPwl3hukqlQ?=
 =?iso-8859-1?Q?B6eQ5EMUA7XNpIcUXaAYOKL6WXrWmKDci9g31mSriLpkoL3Qd2j+R0Dxca?=
 =?iso-8859-1?Q?S39D9mqWkciZEsBG0LkiRbiCQwpp1yDLTgHlFsE4JGWVZnfzIjVjqnC5pj?=
 =?iso-8859-1?Q?/ejVgt8NI5VhEGAtjcqeaxXXC8JpOdgw9tsCfg15GnaCc5CwJctKomHhc9?=
 =?iso-8859-1?Q?PsAkYqJXMITRYtG7F0FOu2z4c3Nqpx81oKbvoTPsm+7dnzQzjCESTrOJcH?=
 =?iso-8859-1?Q?Pi60T0C3xgLhqh0EOhFvrrMTTJuunZPHCu7yLggV+GouUjwNZYm58HpiJq?=
 =?iso-8859-1?Q?fToUd1SIhZe1Z10/lgYiYjOw83P39z46vB6w2X/dQ0Y213jIYrhYX9mUhy?=
 =?iso-8859-1?Q?B5BrbQM3qZif2yleZtOD3Vbik+/t0xe2mqfExFDpQ+tBajhLcDtWxpgcom?=
 =?iso-8859-1?Q?+wKgT0BDIhwXV9TDns3PXHux2fhuOXjAH5YIS0riWw3J0d8XaxoTNMUTsG?=
 =?iso-8859-1?Q?ToHC0t82xfqzi6PCR5Vya+C+tca7HO+6aFncdkFHEX4jsYrsQRZXmzoaAe?=
 =?iso-8859-1?Q?McmCC38jgaO2s/IcUVpyaDmcKk1yA0/eFdZgasOU0Ww6CpwxJG8CSObUfg?=
 =?iso-8859-1?Q?+c+cxNCyd9zhU5zq2fPfo8+6ot5yZkYpKFHtHK6o4atmAtYA+uhpkVyc6E?=
 =?iso-8859-1?Q?S/2Lks8C1x+QzLnyrrork45T2hk2frXWPXiwqsZXWZJQi+xeEmpHLZEGCR?=
 =?iso-8859-1?Q?a2DIEeSeWxyqurK6hSUL0YRsFDCQZAy3Hp8VrC8lzaxeaGhwwSTzTPBhC8?=
 =?iso-8859-1?Q?4GI1EdlupsNAP3xb3xUK3z0HZPtqGsib88milnWzmi7mOipK7Q5QVy2ckN?=
 =?iso-8859-1?Q?BZQK1SmI+JSgsxsWnTaOUX+3FBXmRnmgHDws4zAJP1R2UVYiS30TIBOQFN?=
 =?iso-8859-1?Q?V8TLSqWy4OdJR0tnOV/3KZp8WgnsKxVQyAtpxbxaxm7mZnby5igfAKUzKl?=
 =?iso-8859-1?Q?Zeys98oHOpAe4iUyKmyHdpeZpreW/5z0o5meFrlLwXrMpq70klcvaX0kcD?=
 =?iso-8859-1?Q?nuYcmSqNiWe63O2udJZtm9sLzBcK1tt9W95uOWXjpy/lFnjlgLznnDc0VF?=
 =?iso-8859-1?Q?D6lfNqMli4vEagqHY4XrXIGI3fm0RvfoQADEwPS1zpERsOcGqS2bQd8nEW?=
 =?iso-8859-1?Q?CW78NPgcE1t6UyzswY0FRXsS+qIJoO80A0OcgL8lNuT6JGLu12KUIADcmG?=
 =?iso-8859-1?Q?DFBFM8YfX/DvWiwIrjAD/hF+LA0J7xtZpvlt9ol8qDf7zRPHtdtnggXbsY?=
 =?iso-8859-1?Q?KSB9nIvCm9pvcVMRlAxsB4LkpxfJbKchPxWwB/9rqn4IwhX3JqusVy5BuW?=
 =?iso-8859-1?Q?N240F+bEbXkZ5Nrb2FFjetKweu4JlwD/WeR3AQgc8Lawfqy5VYeLMc/pfI?=
 =?iso-8859-1?Q?cUq+o3jsd7BZ4ElEY7KbYAcEeSDHjgRbm5XpwQjfTjpMD3ppEWVfI3Jorg?=
 =?iso-8859-1?Q?pTkmzcgyddVOy70FQ6qWNiQ4plC5L4eiJktn08NXP1rRJP1aTCVRqJQYWY?=
 =?iso-8859-1?Q?Xci5JhH/D+nPIaPNvzkAOBT74I0jSyb31gQhhz5x9lBaxy0PQn1YmiH/ar?=
 =?iso-8859-1?Q?0ku5yKDt9cf0uNCZxQtBr3qHa00wtcQ=3D?=
X-Exchange-RoutingPolicyChecked: RoeRHwpbDUQ4WRVD4NoQ/ZTo447PCyM7RrH+xuSmahUE25v7BWG0rbhUHfQoxpZndudApPiMZjEaXmrDEUxKR6Uyn8liIM3OskHj4hLQ+67eTiS+hH7yg2/D0vFHIHU1VUG6hlIQ5XXmiKQUJiLb4KFcivGqsfcUJKcWBcTpaOxU3bZOaUSrDnFfo4Dfk4o0bd+IwBclmek+oa6XWDKFiAmxOZspka2ylaun05Na+ptrU3R6Qp5jIsnxtVyY8qcdLbl4LZqygj9GVtPBmyTwjRRi3E2m9LZHL4FCLenpj1teSpAUXPGKV1QG5lpCSLGW6GIhSioC2Vf3yikZ5/F0Mw==
X-MS-Exchange-CrossTenant-Network-Message-Id: d109250b-3c14-4459-fa96-08dea675baf1
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 05:02:52.5735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsJCXlSD2JbpP60wDDJlczON3+Nopln0wI9aCP33+TNJmZ7nZKvyGGI7PASL5+vZfD0ZwOUAocroYInwLfNqog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB8267
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

On Mon, Apr 06, 2026 at 02:28:30PM +0530, Arvind Yadav wrote:
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> 
> When performing a partial unmap of an SVM range, the memory attributes
> were being reset for the entire range instead of just the portion
> being unmapped. This could lead to unintended side effects and behaviour.
> 
> Fix this by restricting the attribute reset to only the affected subrange
> that is being unmapped.
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_svm.c | 56 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_svm.h | 10 +++++++
>  2 files changed, 52 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> index 89668ada38ca..f533cddf4d2b 100644
> --- a/drivers/gpu/drm/xe/xe_svm.c
> +++ b/drivers/gpu/drm/xe/xe_svm.c
> @@ -58,6 +58,8 @@ void *xe_svm_private_page_owner(struct xe_vm *vm, bool force_smem)
>  	return force_smem ? NULL : vm->svm.peer.owner;
>  }
>  
> +#define XE_SVM_ATTR_RETRY_MAX 3
> +
>  static bool xe_svm_range_in_vram(struct xe_svm_range *range)
>  {
>  	/*
> @@ -127,15 +129,23 @@ static void xe_svm_range_free(struct drm_gpusvm_range *range)
>  	kfree(range);
>  }
>  
> +static void xe_svm_range_set_unmapped(struct xe_svm_range *range,
> +				      const struct mmu_notifier_range *mmu_range)
> +{
> +	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> +	if (range->base.pages.flags.partial_unmap) {
> +		range->partial_unmap.start = max(xe_svm_range_start(range), mmu_range->start);
> +		range->partial_unmap.end = min(xe_svm_range_end(range), mmu_range->end);
> +	}

Can you blindly set range->partial_unmap.start/end here? More below?

> +}
> +
>  static void
>  xe_svm_garbage_collector_add_range(struct xe_vm *vm, struct xe_svm_range *range,
>  				   const struct mmu_notifier_range *mmu_range)
>  {
>  	struct xe_device *xe = vm->xe;
>  
> -	range_debug(range, "GARBAGE COLLECTOR ADD");

I don't think you should delete the above debug statement.

> -
> -	drm_gpusvm_range_set_unmapped(&range->base, mmu_range);
> +	xe_svm_range_set_unmapped(range, mmu_range);
>  
>  	spin_lock(&vm->svm.garbage_collector.lock);
>  	if (list_empty(&range->garbage_collector_link))
> @@ -380,9 +390,10 @@ static int xe_svm_range_set_default_attr(struct xe_vm *vm, u64 start, u64 end)
>  static int xe_svm_garbage_collector(struct xe_vm *vm)
>  {
>  	struct xe_svm_range *range;
> -	u64 range_start;
> -	u64 range_end;
> +	u64 unmap_start;
> +	u64 unmap_end;
>  	int err, ret = 0;
> +	int retry_count;
>  
>  	lockdep_assert_held_write(&vm->lock);
>  
> @@ -397,8 +408,13 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  		if (!range)
>  			break;
>  
> -		range_start = xe_svm_range_start(range);
> -		range_end = xe_svm_range_end(range);
> +		if (range->base.pages.flags.partial_unmap) {
> +			unmap_start = range->partial_unmap.start;
> +			unmap_end = range->partial_unmap.end;

Then here blindly use range->partial_unmap.start/end?

Matt

> +		} else {
> +			unmap_start = xe_svm_range_start(range);
> +			unmap_end = xe_svm_range_end(range);
> +		}
>  
>  		list_del(&range->garbage_collector_link);
>  		spin_unlock(&vm->svm.garbage_collector.lock);
> @@ -412,13 +428,25 @@ static int xe_svm_garbage_collector(struct xe_vm *vm)
>  			return err;
>  		}
>  
> -		err = xe_svm_range_set_default_attr(vm, range_start, range_end);
> -		if (err) {
> -			if (err == -EAGAIN)
> -				ret = -EAGAIN;
> -			else
> -				return err;
> -		}
> +		/*
> +		 * Retry set_default_attr on -EAGAIN (VMA was recreated).
> +		 * Limit retries to prevent infinite loop.
> +		 */
> +		retry_count = 0;
> +
> +		do {
> +			err = xe_svm_range_set_default_attr(vm, unmap_start, unmap_end);
> +			if (err == -EAGAIN && ++retry_count > XE_SVM_ATTR_RETRY_MAX) {
> +				drm_err(&vm->xe->drm,
> +					"SET_ATTR retry limit exceeded for [0x%llx-0x%llx]\n",
> +					unmap_start, unmap_end);
> +				xe_vm_kill(vm, true);
> +				return -EIO;
> +			}
> +		} while (err == -EAGAIN);
> +
> +		if (err)
> +			return err;
>  	}
>  	spin_unlock(&vm->svm.garbage_collector.lock);
>  
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> index b7b8eeacf196..4651e044cf53 100644
> --- a/drivers/gpu/drm/xe/xe_svm.h
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -46,6 +46,16 @@ struct xe_svm_range {
>  	 * range. Protected by GPU SVM notifier lock.
>  	 */
>  	u8 tile_invalidated;
> +	/**
> +	 * @partial_unmap: Structure to hold partial unmap range info.
> +	 * Valid only if partial unmap is in effect.
> +	 */
> +	struct {
> +		/** @start: Start address of the partial unmap range */
> +		u64 start;
> +		/** @end: End address of the partial unmap range */
> +		u64 end;
> +	} partial_unmap;
>  };
>  
>  /**
> -- 
> 2.43.0
> 
