Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2D7D1A42C
	for <intel-xe@archiver.kernel.org>; Sat, 12 Oct 2024 02:40:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944FE10E03B;
	Sat, 12 Oct 2024 02:40:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V01nWdJA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4F10E03B
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Oct 2024 02:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728700810; x=1760236810;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gkrXd79gsbr5qBTXlTAA+WIcwBFOtKk7O50IdrL/xzQ=;
 b=V01nWdJAt03gJgwDelsxtmKnOH7qVyK2ekVNPx5OOeP39zfQh06jZx+N
 ugizmhqK/bIpVu4iCvJtZxx9FPIudcmf9JO1DiG6+VY+wQ18N2N7xTaV7
 hHT01jGF8q3mQCmUZxnaf38kBXrVkV3nGd93ZZz52UVHGHn46y5DFGeza
 5l8Hduj+OfEoYzy0oAEawCkR/4YARpdZyViviiTwYUcbSvPWTVBiQ62TQ
 ZDQEEA/rmEzmw/H6iPbpJGat/DPMmHkSl5CFA3DYcQbP5sEKWaXfk42lF
 g5htpC8kRXQBld2u1NC3fT1rT5kT9bLY9fcZQcKpj+dE+dwL8msUV8FxC A==;
X-CSE-ConnectionGUID: paC4t5hrRbCL+PTWeB+jPA==
X-CSE-MsgGUID: 4E1WIExwRSGlOzZxfLc/JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="53536892"
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="53536892"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2024 19:40:08 -0700
X-CSE-ConnectionGUID: IqcAM1y0SlyC4mu4fYZAWA==
X-CSE-MsgGUID: jh7O6u2ZQ9yTZRVibtOdMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,197,1725346800"; d="scan'208";a="77077440"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Oct 2024 19:40:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 11 Oct 2024 19:40:07 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 11 Oct 2024 19:40:07 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 11 Oct 2024 19:40:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F5NC5ZEHPZc2shmsHPpo8wKs7AsAPWIoIHfbPJcTtHu1w9TXCg+ceoCOKE4xeC+j9GrLhhcUW/eBOltWMcBx0TWwheerT9s1s3cwKsTfxvoyIVg+OAKB1M1mYzulR03E6qNEoBlrshCmO2poVLEqVV1utNUGiPUPRH0dQfYbCx2vZZXmo/3i7hFdox6yZUOf0aMNVAunBjRupYpXN3kFei4N23SF+Tgj3cPV2hknSJHSZvnpGexe3AQIKPnBnkcs2ToJbviGki6YnLpYEexEwBcQzhjgoLM7ky/XxGNqmSNLgVOQP8oFSbb4zGQeQIiYGI8kiLUqzbZ7yj0shlGStA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XPesGyVhMSkv5h/PpudlyFvztVDtJb2Js8317DTg//Q=;
 b=FAO9WKITtPf1hpvZAFSJ+ZKz80rw40UN3HRSj+YXBpMD/b+RP/AZ9eA/yjgun4nJIcrVN+rSuMPXYzwdqoyutef8+f2EjKwgyf+y9/9w4xKNQ8ArpifeIgXXaoxEdMP7YP8tqYYNQ84zUUVZLeLf5DCHykcziXirw9i7LAGEQAEvfd8gnc70jObQOMEXmIaTMOydG1c58CSJDsXh8UvUjq1GpPJSE1r67hwQ2TK5pN9HX1USLGI82kS1gT8WQgsUhCKuqqIlVhQAxYufGIEnnrCn9zl32Fk7LcJs6l9yQ8COWDE7nGbDqcG6gM4ehYug/5C246XvXfNhp+yIJyIW3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4567.namprd11.prod.outlook.com (2603:10b6:208:26d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Sat, 12 Oct
 2024 02:40:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.017; Sat, 12 Oct 2024
 02:40:03 +0000
Date: Sat, 12 Oct 2024 02:39:39 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Maciej Patelczyk <maciej.patelczyk@intel.com>, Jonathan Cavitt
 <jonathan.cavitt@intel.com>
Subject: Re: [PATCH 12/18] drm/xe/eudebug: implement userptr_vma access
Message-ID: <Zwnha/P1zWiIrNcf@DUT025-TGLU.fm.intel.com>
References: <20241001144306.1991001-1-mika.kuoppala@linux.intel.com>
 <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241001144306.1991001-13-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4567:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a3eefc-112e-41b1-3faf-08dcea672cde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9dbN1ByGzxfycqvsLBZHmDBNtO7HJr1uFKwZzFzIT3PAbpZW3SSQvc93pLLD?=
 =?us-ascii?Q?89V4Wx1RpX0gzdxlSYZc67LGxgAnq6f6Eyh1A4qt9DWH6KU9eeJwMjmZYiMe?=
 =?us-ascii?Q?G9HOBZgjMib1BTKrlJ7zxEGj0qWxRlaXlRYEmzBG71YxsAnEsAgR5YKiLCB0?=
 =?us-ascii?Q?AauVHPbgqEbXB5HwRVXnvghhxcghymoCeBnovMqcUCPfHfF0eOWH5LJWaNtC?=
 =?us-ascii?Q?QxtukhstI1df11/Wt5njZMAWuqSp4U54Gogvc88hUnGVkTd4ZclSD0BIIq0w?=
 =?us-ascii?Q?2SPcF2IRP9NFNk/1juPL96R/qrt2nNbkOZQem5VuCDMoEymCHYOR6xVBYWm8?=
 =?us-ascii?Q?/DthPl1dvScurYAyPQXViZmko2dUQAFZExnb+mPTqg6YotQVsgqv0flyLIet?=
 =?us-ascii?Q?q+AOUx2IuED9qc3MN1k78SUlOaSi/di3N4RADbIThtytRJVGT6aSBe0vWufx?=
 =?us-ascii?Q?uAYnVM+JySCb1WCJ6TzxkCxsRrEeiXXQyVIJzC/s3tqo71MH9EyTBvzl9uwD?=
 =?us-ascii?Q?CvUMVgifFSK7DWNcV+YkDGYDljBGJEHajfSs2Qkq7rrUALX9ELTXTdEdh+Vi?=
 =?us-ascii?Q?or3MHXSm6t1HLjhMal8snkt9p05dLKRz47xhhBv4PX2ZCV+hKc8R3MXJymz/?=
 =?us-ascii?Q?AiO0uPWCH1eTl/I2mwRT98BWA4yJYCr+vEeGYfgTLJhhwXImKTBODUw9ML1M?=
 =?us-ascii?Q?rNrbzzJ9kFO9lwRSUGNsEXhAIK7BoUj6tdpEhXszsMPmfhJfcXLrMMhJsixL?=
 =?us-ascii?Q?JeE6+yQGBg2FQcZxCb1x0wosv1KzXkD5AiLrs7FaFAcCiwBORnxZMpT1qpAW?=
 =?us-ascii?Q?ioYX38n9W7+5ThollQLeyP3NY0y4fkEzA40hIcyDBPKiIjBg+ruYSSS2+eNL?=
 =?us-ascii?Q?PvngiIvhfYyXd4Q6adcWtrnXt1DiRza1e0NXuRVRtEZxTdV0u5wS4z2JhUMq?=
 =?us-ascii?Q?o5HesT2cHXIl0FfzoYMZcrJGnI3tr/yWDthJh7oXHJPePF5Lv3OOqTBlqKMg?=
 =?us-ascii?Q?IOrXNqQj4q0CSGxilKA4Tuf7a9p5dJfbFZ3CwJQWkC0IQPym9zx+mAUJEC8D?=
 =?us-ascii?Q?flgZer+BywsyIsUe2E/i5IJz2PhY47FPWvpu7mztXaa5ztp88DmNTp2xoDxR?=
 =?us-ascii?Q?DJw/8lWzLamieNT8EPAUdCQWjbAZNO3SiZN4qUCO+ye1tqs09UU8Qg7eMBq0?=
 =?us-ascii?Q?/FNmVhJtMEQA7OjPA2nFdeP50vob2fP01pEhpP+W4ZMkfjLSS/8GdjWZUy8?=
 =?us-ascii?Q?=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tT8y1wPf/3sqmLEYm25F+VoOiDDsMT8RK+0GyLdVL3ldQ6F0n6cWJHDOCVM8?=
 =?us-ascii?Q?iT9SkfkDsD8/+yt/3y2NYbZUdtlgC1YI60gIOM3ZcPpB9MeP9Fsp2+Lri+/5?=
 =?us-ascii?Q?OxekcUxLW48YuvPEkQPrTbtHx9EdMEr7kAVLgYyE0ZP/+Ak5pW0dx0b7LNjN?=
 =?us-ascii?Q?+N3kSx/QTgdzxpcGc6N+5dh2DQ+HfzXgw2hOy13EPunSlb40rFLDINzaPFxm?=
 =?us-ascii?Q?wtp1cUa/zZveuH2YWKnp1OprRM5475RwN9FQvO+CjnUtHymWOW5KZ7bpgue6?=
 =?us-ascii?Q?zjUHz1SOEVOu0Sf1AWYbRGvFgbzoxX8bZKHdKYUxNalOVPyYD6tLJ1tOZvON?=
 =?us-ascii?Q?TLBwBRwO6EQc2sYMfkkXAPxWBzHeusfOmEQAwGV4ugHnHV6aJtmreS+TH3B0?=
 =?us-ascii?Q?ZK9SWf6I+LnAe27sjvN3BrR4PgrmQ9yr+cC9kvW4WO7xm0YJkmk7KhMplX9p?=
 =?us-ascii?Q?EWt7wH5FdATtD+hjSKRE/GEg5r4/OmS3NfdbzoMVRC1jDPDbrikkT69EtNIy?=
 =?us-ascii?Q?Nd2lXjv/DqQxpGoUW5+sFLU6aWHDpaQX3Q7e1GOJkDExxhmE+n6SRYlEBmc3?=
 =?us-ascii?Q?dN3XOxcdajit6VrXqDb/Zma22StrcVs+cVu8eVCSFXXL+2Wgbx8VYSHur3ws?=
 =?us-ascii?Q?QOvLkJZ8rNfK4niQRT8FfFVeD7cHWJsjpL0KDIVBuJdhNuMaZpWtlJ0/UkQs?=
 =?us-ascii?Q?20lduTJgkhftM62i39oHixvdx5VCRaiiUsI17wQp3zQB91QrRU62zwjARgD2?=
 =?us-ascii?Q?vwKFU71H884hpRT/cbC1ZmFANDgl99S0LTk5N8XrUi8u+D7YgBhRqiakLjgr?=
 =?us-ascii?Q?YgOA4KKyBENgtq6aLDzh3GYhujv3ym9hqqp/vDI5s1uwAcR4sGJ3ba2AvWvd?=
 =?us-ascii?Q?oYlIoXNKibrEHJvMekHDSvHJ5pPMzM991GdLA9gf+CJbXJovVilm6fuL/w4P?=
 =?us-ascii?Q?UhgOHaWYmn9YBmULAmfQ+z3H3UY5zGuce4rPT5xgglypUC4wRBj2wy8LAuVE?=
 =?us-ascii?Q?RdCxQFCSL1Q9sNKv8mEPJknqWYK/UFz6fNZz5Fn3ncqH+I4BwI+9kTJh12eU?=
 =?us-ascii?Q?w4Y37kvp/pgBSQzjfjU2sYiDizK/cvhe2+6Ws2zYfu8ip3uXFplCEeBHNnWO?=
 =?us-ascii?Q?lAI0/KOozchxdwpuNpuml6kZqdgrzdIVyzE+hin9vK9QfSyzirwmpChHBpZw?=
 =?us-ascii?Q?op2iF6n70+RPWNcDmu/NYiFuoP0HdEQJ378qI2VdqpL19prYapNt02tX0hIZ?=
 =?us-ascii?Q?HRhykXFmgIEXMPufDN7QVakPQVhcKaQpYaTv32wJ/uRrW/6QxwVQwnxEttim?=
 =?us-ascii?Q?3FlKGFnnRXJA4zbqzJK2InVFQWDnA7a3jBFgcN03OFN2bzHEWK3AHMa1avQw?=
 =?us-ascii?Q?szO0mq1RRc4CliZ0HGA9GkOb2vr29ZtuJk3G3RvfoY6xgmoAXP7BmClgGmTq?=
 =?us-ascii?Q?+saOwCqBqRK6wQb9tQj6LhMJoXob4GRH/zfXkfTb7Z53PMnUXgDeUtjzBe8i?=
 =?us-ascii?Q?mTM0xfbPHVqVvDpB64HpV9LRKSDixqvKGc/4cH0XmXzL7mvPT2d4MaSJETkE?=
 =?us-ascii?Q?mccWM0u7q1oAljfUXDOdSyFJxUQW7fvjOhZzjQV+cRs6hBpaWvFdjNB/vFor?=
 =?us-ascii?Q?iA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a3eefc-112e-41b1-3faf-08dcea672cde
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2024 02:40:03.7758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M7luaHD4o6GHBksxuZo6Id8dEu2LjyHxLA7ftSCJxk3HCuJMUGyH7o/m5Hesc6IAgaC+V3IPQPdvzVUBNConqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4567
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

On Tue, Oct 01, 2024 at 05:43:00PM +0300, Mika Kuoppala wrote:
> From: Andrzej Hajda <andrzej.hajda@intel.com>
> 
> Debugger needs to read/write program's vmas including userptr_vma.
> Since hmm_range_fault is used to pin userptr vmas, it is possible
> to map those vmas from debugger context.
> 
> v2: pin pages vs notifier, move to vm.c (Matthew)
> 
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_eudebug.c |  2 +-
>  drivers/gpu/drm/xe/xe_vm.c      | 47 +++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_vm.h      |  3 +++
>  3 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> index edad6d533d0b..b09d7414cfe3 100644
> --- a/drivers/gpu/drm/xe/xe_eudebug.c
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -3023,7 +3023,7 @@ static int xe_eudebug_vma_access(struct xe_vma *vma, u64 offset,
>  		return ret;
>  	}
>  
> -	return -EINVAL;
> +	return xe_uvma_access(to_userptr_vma(vma), offset, buf, bytes, write);
>  }
>  
>  static int xe_eudebug_vm_access(struct xe_vm *vm, u64 offset,
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a836dfc5a86f..5f891e76993b 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -3421,3 +3421,50 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>  	}
>  	kvfree(snap);
>  }
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write)
> +{
> +	struct xe_vm *vm = xe_vma_vm(&uvma->vma);
> +	struct xe_userptr *up = &uvma->userptr;
> +	struct xe_res_cursor cur = {};
> +	int cur_len, ret = 0;
> +
> +	while (true) {
> +		down_read(&vm->userptr.notifier_lock);
> +		if (!xe_vma_userptr_check_repin(uvma))
> +			break;
> +
> +		spin_lock(&vm->userptr.invalidated_lock);
> +		list_del_init(&uvma->userptr.invalidate_link);
> +		spin_unlock(&vm->userptr.invalidated_lock);
> +
> +		up_read(&vm->userptr.notifier_lock);
> +		ret = xe_vma_userptr_pin_pages(uvma);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (!up->sg) {
> +		ret = -EINVAL;
> +		goto out_unlock_notifier;
> +	}
> +
> +	for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +	     xe_res_next(&cur, cur_len)) {

This doesn't look right after reviewing [1].

A SG list is collection of IOVA which may be contain non-contiguous
physical pages.

I'm pretty sure if the EU debugger is enable you are going to have to
save off all the pages returned from hmm_range_fault and kmap each page
individually.

Matt

[1] https://patchwork.freedesktop.org/patch/619324/?series=139780&rev=3

> +		void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> +
> +		cur_len = min(cur.size, cur.remaining);
> +		if (write)
> +			memcpy(ptr, buf, cur_len);
> +		else
> +			memcpy(buf, ptr, cur_len);
> +		kunmap_local(ptr);
> +		buf += cur_len;
> +	}
> +	ret = len;
> +
> +out_unlock_notifier:
> +	up_read(&vm->userptr.notifier_lock);
> +	return ret;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
> index c864dba35e1d..99b9a9b011de 100644
> --- a/drivers/gpu/drm/xe/xe_vm.h
> +++ b/drivers/gpu/drm/xe/xe_vm.h
> @@ -281,3 +281,6 @@ struct xe_vm_snapshot *xe_vm_snapshot_capture(struct xe_vm *vm);
>  void xe_vm_snapshot_capture_delayed(struct xe_vm_snapshot *snap);
>  void xe_vm_snapshot_print(struct xe_vm_snapshot *snap, struct drm_printer *p);
>  void xe_vm_snapshot_free(struct xe_vm_snapshot *snap);
> +
> +int xe_uvma_access(struct xe_userptr_vma *uvma, u64 offset,
> +		   void *buf, u64 len, bool write);
> -- 
> 2.34.1
> 
