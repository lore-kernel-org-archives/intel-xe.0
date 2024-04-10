Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC44FCD128A
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 21:10:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB9610E90A;
	Wed, 10 Apr 2024 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m4f20QjZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 979C510EED8
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 21:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712783423; x=1744319423;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=WAn/aOFYRdrkyJhLk6TIbx81w44IgjROTcHtTappbO0=;
 b=m4f20QjZ+WbWjy4yl/AucUtzMMQGL/f8Q60sSgC9cYWZJAVusBDTbjOS
 bGK7fzDz2h3pvOirdyc4RQaxx6Obd7/7D2pdUXwC2GHXlyoPYl8eJo9E1
 B+TBJGHf5DdYe07AEC/MRhU7GQOIYtu2v3yAL5e5hGvtIStLNJFavz0+K
 FGXtf19R5OvzF2lKOtR1rAzdFd2gGLaCjnJz4cS1BLFTR06OgPHPtJccf
 OczoZ5uW2SSKbxr1/i7Xemg2GbFD+C4fSckxfdby+6YcNT+Pn24FzMKyk
 VY+S/Q0bXIMoiAxI/DSdDrKqNL0Zc7k6WDq5zHffWDI5ATlF7AMvUy3m/ Q==;
X-CSE-ConnectionGUID: 0Mri5eBhR8KsguYVuZMNpQ==
X-CSE-MsgGUID: u5Kz2vakTICsQlph2N8YnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8048080"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; 
   d="scan'208";a="8048080"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 14:10:22 -0700
X-CSE-ConnectionGUID: wn9YnkH2SSe3G8FXR1SGRA==
X-CSE-MsgGUID: l2jX2IaiTPejMfch/IzHxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="20744624"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 14:10:21 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:10:20 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 14:10:20 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 14:10:20 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 14:10:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWSanX+9/KH4R/NtaeJtVRGzy7Xa8KZMWh32uBSVttm5TNW4ut02y7nx2wOtw1ShRiNrpV93vGbXFokBgSuvmxmKOwyB23muC4mJnmM9h5OQUp2ffnqkRh/jUmfmZ4Q7hHa63ol564RluU2Gud9yWijFVrQdv9p4tz24aMdbo3h5SjWUwaQQ2aMzhpDhRK6KCw16VDj4YlLzPVyfzcVcPtcy4d3pAbjlL6LS/aoThNmjm2P+1Ngdy8gEc8HRIrAjFOStiC8SWIjG62iBN9hufGgdWbw3yYNzcXuhKfqtdgC6JTLgiS3/WXYKck/LWWLsry6hVUDWTWx1UQNLGhpJFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wLvcIshf5QTZEegP/0daC51/doONFqobHtlhUds7V80=;
 b=ajQuwhlzRhIkqqoTRdgHxU+d2MOTjtwq25XNgs7xb+RD9VgROUbQO8uLHQI4je/Q1lmXqRqUmEe/oFJVM7j4cYBRjjsB9r6LhJjC3ON47mIU+L5Iy3ddM2OtAMdLAFO6phDlHLcSzwJ57oYFzfIoDIiAJnX5QlvIuTl3Q+eBcmN0NWAyranrqDRWOugCr4fo2yfLw/0nvQDGjnXVWPJ6+SThW6EuwAbPICzeWL9MkOmTszaLzFAo86KTNIfmsK6/vxi0Zwl3mWnm5u2Mn5r462Y7KYkQXbiicy0q6ywnawMV2BAVjLWhc8F+kS4ipSqaq+A5qhTFzFtu9eV7WJdVIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 21:10:17 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 21:10:17 +0000
Date: Wed, 10 Apr 2024 21:09:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <himal.prasad.ghimiray@intel.com>,
 <krishnaiah.bommu@intel.com>, <Thomas.Hellstrom@linux.intel.com>,
 <brian.welty@intel.com>
Subject: Re: [v2 12/31] drm/xe/svm: Remap and provide memmap backing for GPU
 vram
Message-ID: <Zhb/9yvZeGUBk4rU@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-13-oak.zeng@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409201742.3042626-13-oak.zeng@intel.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7310:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQvFvl98kLVejX2Wi890Ij0XcVpCcg5uEHby6m1TpHlgm9c1BNBRbLeE4Juk/KqteCpOWTSj8QtcIFvaDx1qMZdAHiSG3KdSlK9i+MSYXUMRzentuDhxIYRk2n6wBvG/LA32nenbiYDVtYRIqK6JPIYeXuO1GWMPI5beabk+zn9dDv4hORNBK+oYOy1MH4B7FpYAcWcrglHcHf6rVKCf2aR4xLehu9LEyVFK/fVmX7evdEtvN6ADRy9EV8I+7xW5xTL86ZWugsBrmAcxHkqKL6iqIAdSIwpLqEgf4YD9a+2kdx1+P1DTbi5SGyAKrWIY8GqVjCr8+V9ilf7mSFXYujjVaxzOZN1eQcn0nWGZe1VMHyu6ALDro6k0KV0mAxnipwT2F0b6wDg8I9yN9gn5RN/3BKvWC7uSbTh8Zp4xhsRxramEbINBixTUEoUG8gL98OIIh/lFYFxDU/fvJHK063jT7P6XcboV96u2jXQNhLNZIoArXRCTYzGnYQccVAJi+EUEDnoG4n2O/w0r8/gMwZTj1JdratR6UU0PxPk+tUu5sS/EfjZYB3J62187xdB5eqzASwo+4E8iRRUqBnXecGOazRrqvwH4y/kCWnY/zwPwS+piEFJ1VyjnZW9jY7k9eMFKRdVoG8V+5GUBEsr9sMbnSiAraRc0fE+kNZM+yoI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?YXcGBKsaMrMLKK+JMpJ21dCEeEiXT1pq1mcZF7YhJl3QJBjaVR4NHQljrW?=
 =?iso-8859-1?Q?UjSdgE35GbMnfIrzsJvmsapu2Q7TCNGK0n1GIEgBuB+d+iAe9wkWlO8VO4?=
 =?iso-8859-1?Q?EnSu8mvBN/XfLDa99XMb37kr1cFxa81eOZbWk24JbBNN1loTyCfg27feLH?=
 =?iso-8859-1?Q?EXF49hgjtHBlFeAHc686BrRTBaZRlVy+Jz3be7ts5IZR8sbZDU9El1S6rX?=
 =?iso-8859-1?Q?qm3tf+/LOVr2keuu94aIjusigxu3XRlFcYZ9JwfJA6OVGXgQsyX9fs/QOU?=
 =?iso-8859-1?Q?6EmxORRQYv2i3+f8Sy/LDJ+xlIGYEQXvZNIUZabttmi5yt6a9IaaPdR21R?=
 =?iso-8859-1?Q?kpIPgI13JM7u2g6RXd25b4yKCemJlmzwPMT5hW+M6glnjI8C1lSQE5wSzx?=
 =?iso-8859-1?Q?bqik+1A9NDvWyRs/CewyGCJT7pYo86vwLy+mEM20ZJVJxlBCEkkfoF762W?=
 =?iso-8859-1?Q?YbsxzSoNKsODu8vfBLfERSTSj0hbWdRTn5SVf7XLltRf3R1IcLCV6+b/xN?=
 =?iso-8859-1?Q?bjnQb7W+Lnw5U7l4QCNk8LNPxS2BdKkui9MmN3z5Q4ACcKaYgvtEw5XE4l?=
 =?iso-8859-1?Q?LVp7c5UF/p8FTEfdaZiNh/6jIm5N/ozcJ+/z+TVXg7w5ldiBqnXDTFYjlT?=
 =?iso-8859-1?Q?zmB2DaLg3zEQdPnmtomUiZtEGWCmXB6XU78JdjUVy4QuN1qxH8B/ZHd9NF?=
 =?iso-8859-1?Q?XrRp3tGIXb7WcjCgp+TzklaovLN+EiIoQM6zyWXLHxPv7V+U/urMWdBb+d?=
 =?iso-8859-1?Q?pOII0veEGMfI368p4lLoDzdMWlzE2SyZ6Nt/GGPr91RkJjSnmAKKCDL3e0?=
 =?iso-8859-1?Q?ZGSakP1ZriTzGlYmR75n8jGOdqmi+zNfiq+nuV3gVra6sjgfPNcpoFqazZ?=
 =?iso-8859-1?Q?PiEuDauCsNBznriPpBuSxHBdxE+nylp9p7sJOhtlFHwGoScCYZmnZTK5xf?=
 =?iso-8859-1?Q?xwJxhC7b97RRBD0ZMQ3xKPde/JcBBG4XxLZX2+AEgaAhJuViF+gGtF5TMI?=
 =?iso-8859-1?Q?/zvwVBrGWU8tu1jc0SS+OsYoJLj2GajEmERnlfGAa0///5/KXwdsJUMeME?=
 =?iso-8859-1?Q?LJr0r77LAwhHdeeRg5kgoGuMQiXlvrx2j2aAHor2EtmSUJREY9cDM7CwKo?=
 =?iso-8859-1?Q?9zIcYrYaCRn3m4ChR3q/Io9x/+ejcsyU8cbZlUgVg/NYtcFn6Ln81gaarY?=
 =?iso-8859-1?Q?jOZ/Xw1bmu+PCLBPq9a1UngE8aY9fZSQcTZ/21uiLqj3BVwuaEfx21q5Wl?=
 =?iso-8859-1?Q?nZxKD222aLaiQlycNQI/ys2CRoNtGkkQ4Gmt1GxjsAvsN/xnFrhpCY5SKp?=
 =?iso-8859-1?Q?Haubk6fZKktAq/x7ZhsLsOUxsTJo2GNohnZajsIX/vCql8ssiooWC5uQiP?=
 =?iso-8859-1?Q?RJp+jfIt1e48Qe0PP+6tkuU9DTmhtwqmo1khunLsLTSu715JJfBC4x0v6j?=
 =?iso-8859-1?Q?RT318kQA/zlPBiT9ggvRjjU/M3NzAHRvq3tiHyUM2ng3XrtszDObDwxPYQ?=
 =?iso-8859-1?Q?XHYs6LUzBQt/0t3YENUjyL/mPgn7+Al40erxSFjLnw2CVyosQjrizGm411?=
 =?iso-8859-1?Q?V/drNRwRPOxNRdSzNOaXZXWwWY9LKX0mBjjjDGQOC4tNscRnyCkV2lF42C?=
 =?iso-8859-1?Q?rkFYH2vvRQIO4iWEVVmMN4hhbgj1sjinXU+ylxbEH7DEqEnbfrtJ/eBw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 597e9c74-cbbd-4147-2e50-08dc59a29f83
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 21:10:17.7067 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YeHad64b8fidfZ/ZJ570uDoveFrSIgtYVYlq+h1gMT3/CA+faCmWaUnc52KYmflHsVNRiNloZEu5aOn9e0CO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
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

On Tue, Apr 09, 2024 at 04:17:23PM -0400, Oak Zeng wrote:

Oak - Doing a very high level review due to early stage of the code.

> Memory remap GPU vram using devm_memremap_pages, so each GPU vram
> page is backed by a struct page.
> 
> Those struct pages are created to allow hmm migrate buffer b/t
> GPU vram and CPU system memory using existing Linux migration
> mechanism (i.e., migrating b/t CPU system memory and hard disk).
> 
> This is prepare work to enable svm (shared virtual memory) through
> Linux kernel hmm framework. The memory remap's page map type is set
> to MEMORY_DEVICE_PRIVATE for now. This means even though each GPU
> vram page get a struct page and can be mapped in CPU page table,
> but such pages are treated as GPU's private resource, so CPU can't
> access them. If CPU access such page, a page fault is triggered
> and page will be migrate to system memory.
> 
> For GPU device which supports coherent memory protocol b/t CPU and
> GPU (such as CXL and CAPI protocol), we can remap device memory as
> MEMORY_DEVICE_COHERENT. This is TBD.
> 
> v1:
> Changes per code review feedback from Matt:
>     change .o order in Makefile
>     fix indentation
>     change code order in mmio_fini
>     remove unnecessary header file
>     uniform xe_svm_devm_add/_remove parameter
>     use tile (vs dev) as pagemap.owner during memremap
>     only remap vram for platform that support usm
> Changes per review feedback from Brian:
>     s/xe_svm_devm_add/xe_devm_add
>     s/xe_svm_devm_remove/xe_devm_remove
>     move calling of xe_devm_add to xe_tile.c
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> Co-developed-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> Cc: Brian Welty <brian.welty@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile          |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  8 +++
>  drivers/gpu/drm/xe/xe_mmio.c         |  6 ++
>  drivers/gpu/drm/xe/xe_svm.h          | 15 +++++
>  drivers/gpu/drm/xe/xe_svm_devmem.c   | 89 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_tile.c         |  4 ++
>  6 files changed, 123 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_svm.h
>  create mode 100644 drivers/gpu/drm/xe/xe_svm_devmem.c
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index fff70fc9a09e..cd5213ba182b 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -129,6 +129,7 @@ xe-y += xe_bb.o \
>  	xe_sa.o \
>  	xe_sched_job.o \
>  	xe_step.o \
> +	xe_svm_devmem.o \

This goes for the series - IMO let's have all the svm code in one file
unless we have a really good reason not to. For the series I see 4:

mbrost@lstrano-desk:xe$ ls -la *.c | grep svm
-rw-rw-r-- 1 mbrost mbrost  8975 Apr 10 11:17 xe_svm.c
-rw-rw-r-- 1 mbrost mbrost  6774 Apr 10 11:17 xe_svm_devmem.c
-rw-rw-r-- 1 mbrost mbrost 10636 Apr 10 11:17 xe_svm_migrate.c
-rw-rw-r-- 1 mbrost mbrost  5940 Apr 10 11:17 xe_svm_range.c

Personally I'd like the name xe_devmem.c (or xe_devm.c) open to xe_svm.c
I guess too.

Whatever name we land on let's also try to make sure all exported
functions (in *.h file) start with the same prefix as the file too.

>  	xe_sync.o \
>  	xe_tile.o \
>  	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index e73b9a086718..d6a14327986b 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -103,6 +103,14 @@ struct xe_mem_region {
>  	resource_size_t actual_physical_size;
>  	/** @mapping: pointer to VRAM mappable space */
>  	void __iomem *mapping;
> +	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
> +	struct dev_pagemap pagemap;
> +	/**
> +	 * @hpa_base: base host physical address
> +	 *
> +	 * This is generated when remap device memory as ZONE_DEVICE
> +	 */
> +	resource_size_t hpa_base;
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7ba2477452d7..12923fe6abae 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -22,6 +22,7 @@
>  #include "xe_module.h"
>  #include "xe_sriov.h"
>  #include "xe_tile.h"
> +#include "xe_svm.h"
>  
>  #define XEHP_MTCFG_ADDR		XE_REG(0x101800)
>  #define TILE_COUNT		REG_GENMASK(15, 8)
> @@ -354,6 +355,11 @@ void xe_mmio_probe_tiles(struct xe_device *xe)
>  static void mmio_fini(struct drm_device *drm, void *arg)
>  {
>  	struct xe_device *xe = arg;
> +	struct xe_tile *tile;
> +	u8 id;
> +
> +	for_each_tile(tile, xe, id)
> +		xe_devm_remove(tile, &tile->mem.vram);
>  
>  	pci_iounmap(to_pci_dev(xe->drm.dev), xe->mmio.regs);
>  	if (xe->mem.vram.mapping)
> diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> new file mode 100644
> index 000000000000..e944971cfc6d
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm.h
> @@ -0,0 +1,15 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_SVM_H
> +#define __XE_SVM_H
> +
> +struct xe_tile;
> +struct xe_mem_region;
> +
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr);
> +void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c b/drivers/gpu/drm/xe/xe_svm_devmem.c
> new file mode 100644
> index 000000000000..31af56e8285a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/mm_types.h>
> +#include <linux/sched/mm.h>
> +
> +#include "xe_device_types.h"
> +#include "xe_svm.h"
> +
> +
> +static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +	return 0;
> +}
> +
> +static void xe_devm_page_free(struct page *page)
> +{
> +}
> +
> +static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> +	.page_free = xe_devm_page_free,
> +	.migrate_to_ram = xe_devm_migrate_to_ram,
> +};
> +
> +/**
> + * xe_devm_add: Remap and provide memmap backing for device memory
> + * @tile: tile that the memory region blongs to
> + * @mr: memory region to remap
> + *
> + * This remap device memory to host physical address space and create
> + * struct page to back device memory
> + *
> + * Return: 0 on success standard error code otherwise
> + */
> +int xe_devm_add(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct device *dev = &to_pci_dev(xe->drm.dev)->dev;
> +	struct resource *res;
> +	void *addr;
> +	int ret;
> +
> +	res = devm_request_free_mem_region(dev, &iomem_resource,
> +					   mr->usable_size);
> +	if (IS_ERR(res)) {
> +		ret = PTR_ERR(res);
> +		return ret;
> +	}
> +
> +	mr->pagemap.type = MEMORY_DEVICE_PRIVATE;
> +	mr->pagemap.range.start = res->start;
> +	mr->pagemap.range.end = res->end;
> +	mr->pagemap.nr_range = 1;
> +	mr->pagemap.ops = &xe_devm_pagemap_ops;
> +	mr->pagemap.owner = xe;

Nit: I know I suggested this another series too - helper to go from xe
-> owner which can be used in various places we set this.

> +	addr = devm_memremap_pages(dev, &mr->pagemap);
> +	if (IS_ERR(addr)) {
> +		devm_release_mem_region(dev, res->start, resource_size(res));
> +		ret = PTR_ERR(addr);
> +		drm_err(&xe->drm, "Failed to remap tile %d memory, errno %d\n",
> +				tile->id, ret);
> +		return ret;
> +	}
> +	mr->hpa_base = res->start;
> +
> +	drm_info(&xe->drm, "Added tile %d memory [%llx-%llx] to devm, remapped to %pr\n",
> +			tile->id, mr->io_start, mr->io_start + mr->usable_size, res);
> +	return 0;
> +}
> +
> +/**
> + * xe_devm_remove: Unmap device memory and free resources
> + * @tile: xe tile
> + * @mr: memory region to remove
> + */
> +void xe_devm_remove(struct xe_tile *tile, struct xe_mem_region *mr)
> +{
> +	struct device *dev = &to_pci_dev(tile->xe->drm.dev)->dev;
> +
> +	/*FIXME: Does below cause a kernel hange during moduel remove?*/

Goes for the series, try resolve issues rather than having FIXMEs.

Matt

> +	if (mr->hpa_base) {
> +		devm_memunmap_pages(dev, &mr->pagemap);
> +		devm_release_mem_region(dev, mr->pagemap.range.start,
> +			mr->pagemap.range.end - mr->pagemap.range.start + 1);
> +	}
> +}
> +
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index 0650b2fa75ef..f1c4f9de51df 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -14,6 +14,7 @@
>  #include "xe_tile_sysfs.h"
>  #include "xe_ttm_vram_mgr.h"
>  #include "xe_wa.h"
> +#include "xe_svm.h"
>  
>  /**
>   * DOC: Multi-tile Design
> @@ -158,6 +159,7 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
>   */
>  int xe_tile_init_noalloc(struct xe_tile *tile)
>  {
> +	struct xe_device *xe = tile_to_xe(tile);
>  	int err;
>  
>  	xe_device_mem_access_get(tile_to_xe(tile));
> @@ -175,6 +177,8 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
>  
>  	xe_tile_sysfs_init(tile);
>  
> +	if (xe->info.has_usm)
> +		xe_devm_add(tile, &tile->mem.vram);
>  err_mem_access:
>  	xe_device_mem_access_put(tile_to_xe(tile));
>  	return err;
> -- 
> 2.26.3
> 
