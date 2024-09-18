Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7434CDD54D
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 18:39:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590C510E294;
	Wed, 18 Sep 2024 18:39:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MkDn+4Oq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECB0610E294
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Sep 2024 18:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726684781; x=1758220781;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=UdDoaVGGOgrWZvClhGsxCmlExQl36Lp77KAZzneyc8g=;
 b=MkDn+4OqOxEAK6nrk/UxlWDWim2qPWrd+3+3QzeTxsX4GVvAR6rOybBA
 ib3Ujdg+KulVDPc6qpcd+3YwyxFmRqW2BfMVdc5fzxeyX1F8qsERY+NNK
 UkqzzzS0/PIEXJYDkS70FQSXmi/4+JdDPMcb/QH7oUm4piQicYM2nBa6t
 zFdbO8msAdbv/9kzEtk9LqGCJ8k8hYxMDR1rPDzS1m9jWPoncxEq1sROc
 7ppVe840+eXUSOiBPgP+IXEFh5NIE6JDtHUrFZAnRNCRs7Tob9c6/Q5WF
 1Y9nOy4TGvL3Y4Id/JrN4aQgONEhag/dobTiM8CLlqATTawFWXMj3as5P g==;
X-CSE-ConnectionGUID: CcJpgLpcTYyGNCUAsCffKQ==
X-CSE-MsgGUID: BXmIw9qCSMyPphJGYsm+Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="25100407"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="25100407"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2024 11:39:38 -0700
X-CSE-ConnectionGUID: I7zuj8gNT7uTUvj8Zxudig==
X-CSE-MsgGUID: NQsOK6/lQiqxJW/tz1R5WQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; d="scan'208";a="100378924"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2024 11:39:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 11:39:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 11:39:37 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 18 Sep 2024 11:39:37 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 18 Sep 2024 11:39:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODqSDDmQIzZrFjYPmro+6c/IJOGkNfxbcgYoKLvqqJr3AgnZgTD4UQvDa4r3yoRmBUtnDBi4elaqAcdYa1JFT9chJvNftLkABPY0zfyHqTz/2wVPxY89Pjz46pE377meysnjshaS8Ru+g48l0Xmc4mgJCXkBt2UU50SB8W4VDzj/WvX1IEKeE2aMZ5qQV1iTJo3hydWquOI/4eRA/UeMNYHwXycf+dXzCE2kWk/jGVQHYqgp+H2xIA26SOgBjeShZtGsuLw0dOsXBwBc2oo5hCoynjVPjFpbuRtCofXGHCOOKMruK1V8JrE44lVBpJgRDb3t5oqaYp9rgp2+IjaQNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sEaX8D6XY4ufJTjHJHLwBTM3oSu3RcM8FStIR6Q/lKs=;
 b=quDNKY4JEB+NxN6r9klsLSyEDC8i6FXCZYX4/dJIfz1geZh/T7GQtPwFmbONu4o6viJxhzqXuJcmvbM6exHvDYtjBvjFLjOKqyUH+ksZfP3KySRNP+Z5Atbf0q/lTzG2mSAaGdfEaUvQJutkBqOJYDblDuPL2zACNFo3K6e4hmYw6O6v4nghZn8QHp4QA3NklKljhhxqlE7v/sgSo4FjbPqExJGNkUSgNGR3gNF+jgxB4cdfUKVQvP+XdtYuJxgclX6Z3U5EhNnxUMnoCd7HWA/8+ysFQUAKDOtgDHqiE3zU3c1KR5D5S/9M22vkPNqZzyLdZgq75Ks/15KNcyJvLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM4PR11MB6142.namprd11.prod.outlook.com (2603:10b6:8:b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 18:39:33 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.012; Wed, 18 Sep 2024
 18:39:31 +0000
Date: Wed, 18 Sep 2024 18:37:55 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Oak Zeng <oak.zeng@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dakr@redhat.com>
Subject: Re: [PATCH] drm/gpuvm: merge adjacent gpuva range during a map
 operation
Message-ID: <ZuseA6s2nip+PbTC@DUT025-TGLU.fm.intel.com>
References: <20240918164740.3955915-1-oak.zeng@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240918164740.3955915-1-oak.zeng@intel.com>
X-ClientProxiedBy: BY5PR17CA0008.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM4PR11MB6142:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fb9dc86-3b4b-420b-635e-08dcd8113bf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eMNdCbzSBCu1TX5RkOHTn2H3V2/NTF9aw8FtkyWWKREGzeg5aryBORt4y6uh?=
 =?us-ascii?Q?wskyLbibs6b9PwaiB68R4zO2M0DNp6g6lvhgE2VRoA6kJW3x35UbButwrbp0?=
 =?us-ascii?Q?5CHpNRWv1UdEk6i7+m7mPko+l0moqrcFzIE/aWMpsT2maarL7SWCUmgadifM?=
 =?us-ascii?Q?tCFbgyhk7208T/A4zVMwRme/+UbGTwcQeKAfnqyoibWBWR0EDX6UB+fn3lE1?=
 =?us-ascii?Q?fl2UE4kOsSxeCw5jWo+CEn3Ezt4Q7QpaCw1NsTGU+RYb9ya+l+MMc1EXGRaI?=
 =?us-ascii?Q?v4NRIPzRL7UzuZkiOx8U7Ds/zD+SxpRCdIqAYBbpCYT0DYJgFdz+tqLYQjK+?=
 =?us-ascii?Q?LTK01YDpf29a/vz/Cn1d/5eQkiGM3vEU4zXCSO7nWU8p6ePf/o2Bw/PjPyrh?=
 =?us-ascii?Q?imQTpWNDAW96LMQVyyICCJ96k4PTg4rLUINqvZiZTu3Jgr3uxGDYx7NpYqf4?=
 =?us-ascii?Q?07Zu5EP0ygF7IMnj4sJDLARFIH0C59zn9TKckOtAes1f6/eiXfbkOujAsTTU?=
 =?us-ascii?Q?xw+3tM2y+RI6OfcCsKRm8PzTe5vQLMN6vr2thplnNMRiJewc686l5REOdf9Z?=
 =?us-ascii?Q?ih3vm9YVUY1DZsPQRNMO18oaJe54kbQu37U2VDh8XXbvgW07F7URAivSRYmk?=
 =?us-ascii?Q?vTD28XwqV5O7g6yzFfIcWPnPAahTvTSmZx7bPlVlm0LWgbQGri2W4/zj5mAe?=
 =?us-ascii?Q?hl2SG37j2a8vf91odxrf0EHUDGMaUjv2WVl+FUXfZoLuzbmzwhKHz+hLg7Vh?=
 =?us-ascii?Q?W5wYtIUW51ia1etKglnKf5sQ8T0qYcXNhFPIjXbHydBstYo6h2unGQVPPOHR?=
 =?us-ascii?Q?jr8uHLvg+qmBdNutKyzswmxH6tDAwNIc/1mtsiFMuCiaY3v8GN81if7Au0BQ?=
 =?us-ascii?Q?TNytcitVsMNBcy34du78lEZ4zh0nVM5WFyRcHS0XWhJnPsS97NUjy8NdElr4?=
 =?us-ascii?Q?FgreMTBeYYBS8sAHnigKSQ3tdVto0e97BKGIbZEhdqE60DBiPOAog/jNl8YD?=
 =?us-ascii?Q?z61c5VPvM4mFn3WnqnRMbX45rOyD+W0YKfxjgHWxcGk4AdJFcDfaStg4aHze?=
 =?us-ascii?Q?dKdIK7TozZ5Kq+YksF+MzVzT8p0NKNtOdNLfRLYDPWTbD/ia/dstUn+BKZyf?=
 =?us-ascii?Q?OQhWgufMhL1c640+w0t5YFSeO0GGKKrOQ4JOrmJsjotp2gqJxzb+qlAgZgKy?=
 =?us-ascii?Q?UjZarVnnZV0rH16W9aVkQ4YQRWA2PiS7I8L6oaWYATCD77L2p80CP+cW6SIz?=
 =?us-ascii?Q?hdjsnzDCvoNjlNmr5CVuuu2IJgMYP145jCZdLl5jhI17VpFe1Urn9NNGKuLO?=
 =?us-ascii?Q?1Cxv/BfwlafBNTyimvL6DEvhsYFPb9FoLYKCXADq8wv0Rw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w2C+WZB/3s3Kt0pY9lETO3/FIdsd6YBWUrYKKXNyxvyi6RxTsXmg37R0cpEX?=
 =?us-ascii?Q?vt+IADxX57Usrr6DfUnzcPLNj9YsHra5qroOapGtOCHY1C8fmhACvj4GuzS7?=
 =?us-ascii?Q?xlRVZQTdBrw45T+tr7AbbK7Jm75LND4ss2bMwA2+Eg873Uqzyznx0Zxws25P?=
 =?us-ascii?Q?4MHC/CpsqujLncumr5gN7s3TkVJoKzx8VtSG3fK3XNXJxhrtspy18tbxpLt7?=
 =?us-ascii?Q?B+5sXaF/zD5c/gmtcKgbNr/iROmUJJm+nSHXTc3m+OE/wgMCq3UVnbWULQ72?=
 =?us-ascii?Q?u2Ro9G/jf+jHzgReeKud5Ea2sXtFTSS7gxejYi0t1dbvequtbwhGnOOcyOSN?=
 =?us-ascii?Q?raDKU/cxPsgWuja+Bnh2kI9jydk7Hi4TYpYb5bZH7s0oZeI+MesUMgvY39Nn?=
 =?us-ascii?Q?i3o8vSNDabVjpbK5/80j4HVG//tQwZOpLNBziHZxjEWL4KJp4crXAoMqvXSO?=
 =?us-ascii?Q?Oc5T+v1LUgzIuDzFmqPb/qVRqvxPOV/AcCtRaTru3XJJLNOLPd0Tpv3xDzex?=
 =?us-ascii?Q?x9gNjsfH34AYukuyqbgqJidoBIqY/ot5sKK8S8uz1Bdl77yZgjTtbBW1X0N9?=
 =?us-ascii?Q?DSzq/TDb5CXtBRliNTrfPEzDvbdUi4/zr90TFUOXgvCy3WKUBYmgMKDV5vDv?=
 =?us-ascii?Q?ZwzvZ91fZfRJ7Edxl3EKk5QROUcs6Y+jHQGxHDbolFUYAU8+GvscHbDF3rkW?=
 =?us-ascii?Q?FIft+ncdxfV3kEVPCNvEWWy+3721Rg5yMYRECIuUVrpG9MXok7rju9rDdbuE?=
 =?us-ascii?Q?MpXCI8rDvcQ/WjJU70NMdhSJaxN0/CT8GOPuvY8siNdYXYiYfN54cANvmNUk?=
 =?us-ascii?Q?8QAF6dwJByWh+8Xe2YqNyhtq+e7rh+EvXRM4RQZSKQ8D8MtTUx4Pg4mpSggP?=
 =?us-ascii?Q?FslSJYTSaDUX3lV25Ocb13EdeAuafkbyyyIPNheijaOnd+mYqj2cg+sZ04xT?=
 =?us-ascii?Q?KSMb/oOXSSqhmgRUEiKgbwQy7t0BC9nQpU3FPP3zUxz8BTKlK1Dbjk4B4sin?=
 =?us-ascii?Q?sCiOg1X8G0hofCgfpj7GSV1Ze5Ffidhzaf8AJ2Oa2o0olmaHks5UuTByaD2W?=
 =?us-ascii?Q?s4WtWTVslY85kZk5we3kzCPFePBw3YXjQolk+sKbl4bE/5Ikr3+vKt9dvWty?=
 =?us-ascii?Q?0YQTMLpOnnSfG+NYsV0hQwnnaVZDC+4LevJAQfFLwFcpaA0nYYu42qn0x17a?=
 =?us-ascii?Q?VZ01nM7Qi9nqq9YBLpiaonbddQjrRek68DHTczjfRgYB0BcOyBuviE46Zwnk?=
 =?us-ascii?Q?IXJC6qYLE9x3s1rgSKKHSDI34PPkFnUgnXEUbj2WmjlJkf/TMB17AvTJ2CaF?=
 =?us-ascii?Q?D4Ttt3xNMpUM6T9xC2oJlUcVwKYzP57y0oyfqbdYNR7GSidkNebnpMio/I2A?=
 =?us-ascii?Q?qMFx+5XhD2RYZhZArckR0tGraZIARfnFY9lgYHVzUkmaYHYwmdi++pIK2r2z?=
 =?us-ascii?Q?wxW9w6LfNNIClsD3bCTou3bOjQcUAFi74LibwP3a2StUAddYXSvCvGPAImrq?=
 =?us-ascii?Q?dEZNNtxKZQxMur4ujzRC8zINpmNNVSbonmSNj6LbGO07rODw+8St+//IJHy0?=
 =?us-ascii?Q?Ugl6L4Wetf2F3eSRbU+ndagQltHsgbjka7pHYGRhzOpm8OhhlxOEmsxIVaF6?=
 =?us-ascii?Q?AQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fb9dc86-3b4b-420b-635e-08dcd8113bf3
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 18:39:31.2569 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8MGvXI59dS28UiisW4tB6FI86IfE/X3bSITwOGyMPUApgFXcsGhiJBH3zlUg3AYNFLxd+Wzd5fs0bYSqjP7LvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6142
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

On Wed, Sep 18, 2024 at 12:47:40PM -0400, Oak Zeng wrote:

Please sent patches which touch common code to dri-devel.

> Considder this example. Before a map operation, the gpuva ranges
> in a vm looks like below:
> 
>  VAs | start              | range              | end                | object             | object offset
> -------------------------------------------------------------------------------------------------------------
>      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> 
> Now user want to map range [0x00007ffff5cd0000 - 0x00007ffff5cf0000).
> With existing codes, the range walking in __drm_gpuvm_sm_map won't
> find any range, so we end up a single map operation for range
> [0x00007ffff5cd0000 - 0x00007ffff5cf0000). This result in:
> 
>  VAs | start              | range              | end                | object             | object offset
> -------------------------------------------------------------------------------------------------------------
>      | 0x0000000000000000 | 0x00007ffff5cd0000 | 0x00007ffff5cd0000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00007ffff5cd0000 | 0x0000000000020000 | 0x00007ffff5cf0000 | 0x0000000000000000 | 0x0000000000000000
>      | 0x00007ffff5cf0000 | 0x00000000000c7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> 
> The correct behavior is to merge those 3 ranges. So __drm_gpuvm_sm_map

Danilo - correct me if I'm wrong, but I believe early in gpuvm you had
similar code to this which could optionally be used. I was of the
thinking Xe didn't want this behavior and eventually this behavior was
ripped out prior to merging.

> is slightly modified to handle this corner case. The walker is changed
> to find the range just before or after the mapping request, and merge
> adjacent ranges using unmap and map operations. with this change, the

This would problematic in Xe for several reasons.

1. This would create a window in which previously valid mappings are
unmapped by our bind code implementation which could result in a fault.
Remap operations can create a similar window but it is handled by either
only unmapping the required range or using dma-resv slots to close this
window ensuring nothing is running on the GPU while valid mappings are
unmapped. A series of UNMAP, UNMAP, and MAP ops currently doesn't detect
the problematic window. If we wanted to do something like this, we'd
probably need to a new op like MERGE or something to help detect this
window.

2. Consider this case.

0x0000000000000000-0x00007ffff5cd0000 VMA[A]
0x00007ffff5cf0000-0x00000000000c7000 VMA[B]
0x00007ffff5cd0000-0x0000000000020000 VMA[C] 

What is VMA[A], VMA[B], and VMA[C] are all setup with different driver
specific implmentation properties (e.g. pat_index). These VMAs cannot be
merged. GPUVM has no visablity to this. If we wanted to do this I think
we'd need a gpuvm vfunc that calls into the driver to determine if we
can merge VMAs.

3. What is the ROI of this? Slightly reducing the VMA count? Perhaps
allowing larger GPU is very specific corner cases? Give 1), 2) I'd say
just leave GPUVM as is rather than add this complexity and then make all
driver use GPUVM absorb this behavior change.

Matt

> end result of above example is as below:
> 
>  VAs | start              | range              | end                | object             | object offset
> -------------------------------------------------------------------------------------------------------------
>      | 0x0000000000000000 | 0x00007ffff5db7000 | 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> 
> Even though this fixes a real problem, the codes looks a little ugly.
> So I welcome any better fix or suggestion.
> 
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>  drivers/gpu/drm/drm_gpuvm.c | 62 +++++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
> index 4b6fcaea635e..51825c794bdc 100644
> --- a/drivers/gpu/drm/drm_gpuvm.c
> +++ b/drivers/gpu/drm/drm_gpuvm.c
> @@ -2104,28 +2104,30 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  {
>  	struct drm_gpuva *va, *next;
>  	u64 req_end = req_addr + req_range;
> +	u64 merged_req_addr = req_addr;
> +	u64 merged_req_end = req_end;
>  	int ret;
>  
>  	if (unlikely(!drm_gpuvm_range_valid(gpuvm, req_addr, req_range)))
>  		return -EINVAL;
>  
> -	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr, req_end) {
> +	drm_gpuvm_for_each_va_range_safe(va, next, gpuvm, req_addr - 1, req_end + 1) {
>  		struct drm_gem_object *obj = va->gem.obj;
>  		u64 offset = va->gem.offset;
>  		u64 addr = va->va.addr;
>  		u64 range = va->va.range;
>  		u64 end = addr + range;
> -		bool merge = !!va->gem.obj;
> +		bool merge;
>  
>  		if (addr == req_addr) {
> -			merge &= obj == req_obj &&
> +			merge = obj == req_obj &&
>  				 offset == req_offset;
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
>  				if (ret)
>  					return ret;
> -				break;
> +				continue;
>  			}
>  
>  			if (end < req_end) {
> @@ -2162,22 +2164,33 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  			};
>  			struct drm_gpuva_op_unmap u = { .va = va };
>  
> -			merge &= obj == req_obj &&
> -				 offset + ls_range == req_offset;
> +			merge = (obj && obj == req_obj &&
> +				 offset + ls_range == req_offset) ||
> +				 (!obj && !req_obj);
>  			u.keep = merge;
>  
>  			if (end == req_end) {
>  				ret = op_remap_cb(ops, priv, &p, NULL, &u);
>  				if (ret)
>  					return ret;
> -				break;
> +				continue;
>  			}
>  
>  			if (end < req_end) {
> -				ret = op_remap_cb(ops, priv, &p, NULL, &u);
> -				if (ret)
> -					return ret;
> -				continue;
> +				if (end == req_addr) {
> +					if (merge) {
> +						ret = op_unmap_cb(ops, priv, va, merge);
> +						if (ret)
> +							return ret;
> +						merged_req_addr = addr;
> +						continue;
> +					}
> +				} else {
> +					ret = op_remap_cb(ops, priv, &p, NULL, &u);
> +					if (ret)
> +						return ret;
> +					continue;
> +				}
>  			}
>  
>  			if (end > req_end) {
> @@ -2195,15 +2208,16 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  				break;
>  			}
>  		} else if (addr > req_addr) {
> -			merge &= obj == req_obj &&
> +			merge = (obj && obj == req_obj &&
>  				 offset == req_offset +
> -					   (addr - req_addr);
> +					   (addr - req_addr)) ||
> +				 (!obj && !req_obj);
>  
>  			if (end == req_end) {
>  				ret = op_unmap_cb(ops, priv, va, merge);
>  				if (ret)
>  					return ret;
> -				break;
> +				continue;
>  			}
>  
>  			if (end < req_end) {
> @@ -2225,16 +2239,26 @@ __drm_gpuvm_sm_map(struct drm_gpuvm *gpuvm,
>  					.keep = merge,
>  				};
>  
> -				ret = op_remap_cb(ops, priv, NULL, &n, &u);
> -				if (ret)
> -					return ret;
> -				break;
> +				if (addr == req_end) {
> +					if (merge) {
> +						ret = op_unmap_cb(ops, priv, va, merge);
> +						if (ret)
> +							return ret;
> +						merged_req_end = end;
> +						break;
> +					}
> +				} else {
> +					ret = op_remap_cb(ops, priv, NULL, &n, &u);
> +					if (ret)
> +						return ret;
> +					break;
> +				}
>  			}
>  		}
>  	}
>  
>  	return op_map_cb(ops, priv,
> -			 req_addr, req_range,
> +			 merged_req_addr, merged_req_end - merged_req_addr,
>  			 req_obj, req_offset);
>  }
>  
> -- 
> 2.26.3
> 
