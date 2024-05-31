Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EC3C25B75
	for <intel-xe@archiver.kernel.org>; Fri, 31 May 2024 16:27:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D05210E0E4;
	Fri, 31 May 2024 16:27:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cxw/h4FB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6868410E288
 for <intel-xe@lists.freedesktop.org>; Fri, 31 May 2024 16:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717172823; x=1748708823;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aBiyqTF+UXxlEhxE/uN3EUd0ThDUZ0GMYGvJR/cVrZs=;
 b=Cxw/h4FB3TL4y6Ob5iT5sYmcIm1Ft0hSfIDW3LHlzcfnc1VWE/s/+5kv
 40ZHcPEUSd0JDYEYgjuD4JKF0ipsSJpZai5W3ANm7hnF5yVZeSne6zNnD
 ZZI9RH3NwUnV251qhiBJHtBLT86K9sL/3CcKhBgQnG92jBdqwE2ETKMgO
 gPZu1aeNN3g5VgcdeFqmM+ISFRgTGm2DGr3cgoYfCvU9Jp7weB9kOF2kD
 TN1zGJIoWOtk1wVnwf1dzCr4AsQ9uNgRGHYsoa2eYhvgDnaCsLw8TqnmB
 iD0W6FUzyoMpRLNjBOaA1D21nEutQmGyRuUDo3IRkGuZ+qskUK2bedkQ0 g==;
X-CSE-ConnectionGUID: NadIq6RcTNaU9qDR+T3a4A==
X-CSE-MsgGUID: rop9T0IrRlqXf09jwttg8Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="25127097"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="25127097"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 09:27:03 -0700
X-CSE-ConnectionGUID: Ce/J2+jMRuqD83lELI8APw==
X-CSE-MsgGUID: wv5xHZIcT/SemFX8BngkIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36294162"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 May 2024 09:27:03 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 31 May 2024 09:27:01 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 31 May 2024 09:27:01 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 31 May 2024 09:27:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkbmToBzmfO1Cm20PXzKWB6AKUFScDcPH8EEeqErabhMtFuovUG0NpmANj9L6Cdt7THKlz7GZ2rwZJ2kMT1dY7mugP+7HdpOdkIGlTKoYqDEXWW6rdDVppADqYpvwXAhj4qJZrvIb8gMLNC37sHdPOTMg6mXwa+q6W5K5JTV91ZVj+T+bkVEg8Q8xK2+ZLn1jt3TXWOYwgYgw3gVMdW3yM8dgCJtYtHKhZgQ6c7CaNvRdZch/OYSKICfhrn1Temxbjlu6IkoVbUIMkViXLEZFGUt2HDO1vGlfMdqS8UJHco8jiPh3nndL1D6QxElBxFQgTJ/rnMZIaxMfIWnirogYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a0Ks9jUkxhOXWFH4wbaRGPQ7V6TplpHUOBG1Zxs4kFM=;
 b=jO2TGq7FMd8x2a1afwY42t6I0gzUEJZWVgVjd3fbxczUR9TFWosELNJFeUKNY3Ry2qdN5MZb4ky+5+wsxsFE+kd0/GVbML4MmyFONu8NIwPxXwlatPHCQxdmCDSwnkYxP0pWMzr5qbuaCdW5AHpyTeYNacTfZR9q5nUs3dARtdOJFMyGrnW5BoM3fLnpbgGhpO4hC+WKOmLQ9a+jy4OL/7WifZ/8RhhjO57IihbYPLpfZBcMYsZJtXzk54InSNke3aLzUoC+nlZpWFuBZC3vZFl8yFMOvMw+dS69/YcUKiOUYgQEme6FhomZjgEnmh1oQ1XDLcKgM2+SQ/1EnMqd6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA1PR11MB6917.namprd11.prod.outlook.com (2603:10b6:806:2bd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 31 May
 2024 16:26:58 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Fri, 31 May 2024
 16:26:58 +0000
Date: Fri, 31 May 2024 16:26:29 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Yang, Fei" <fei.yang@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Subject: Re: [RFC PATCH] drm/xe: Don't overmap identity VRAM mapping
Message-ID: <Zln6NXwSXfLFZyMN@DUT025-TGLU.fm.intel.com>
References: <20240531070717.1904762-1-matthew.brost@intel.com>
 <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BL3PR11MB63624632546B03D6551C4F0C9AFC2@BL3PR11MB6362.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0152.namprd05.prod.outlook.com
 (2603:10b6:a03:339::7) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA1PR11MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 894961c8-56d6-4d3e-ab45-08dc818e7e5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ofPTUB4Rf4OQbblYGAEdbrKH/onU+q7dGM0fVfFe9rFVyITF5BrremFKnvry?=
 =?us-ascii?Q?G/CJQ9ykqg+jKn3H8ovW9AamFh/MVoT9xuwDhS/HpCz2KPAc0cpAMkaob6PZ?=
 =?us-ascii?Q?N5Kdhs0ZgZGE3l2aB3m1IjxtDvTr2weHZ0XoaNQV/I+rUOwKbs/5gFokMV1a?=
 =?us-ascii?Q?XU3mCnIF5AySTTrs6auXpHXEjb1b9bPJX0mW+cwPKhyT8Q+/7CxWly476khE?=
 =?us-ascii?Q?QNP5P+zYaoW/71ysBLTLaluvd2TeoFQm5tXqsg3zysIkfLbcYXjSafBVrz6n?=
 =?us-ascii?Q?riBQCGKQAKy+HpwVQC28NWUMZV4HghTUviSoJ8HA8ns/Vfh0NZV/GZ5b/Veb?=
 =?us-ascii?Q?Wnqin8wsjnvg+2et/5SlwgueY3/UIuNfmtz5YArLB/UIqWFiw48POeO8Cd7U?=
 =?us-ascii?Q?ryaL0PcfiQhUb7oU0yJByiW60v6X5AJATb6Bouer2MZuZdPOjpD1mDWtacHh?=
 =?us-ascii?Q?ibw2fwU08qsOgJVdFFQE//SyIa0NxgOnC6kjj6Tcp9afO+X1sB2Z4PTmZxK8?=
 =?us-ascii?Q?DNepyeG+wkVj67jLelZ5T6FecPl0XCOII2zE/7rDVwJMetls8hDeFI1U6v3d?=
 =?us-ascii?Q?PSmcBEAWn6Fh8Q0jVRPqQbZKHTJY4kXRIaPOujY45Ia1wrBhbeQBFSF34w7O?=
 =?us-ascii?Q?yJb6m/0jP2y4i7WtKUiTzEIWeQBYc5yZ/pKmj5q61JFjWPNz5lV0HV2B6pqH?=
 =?us-ascii?Q?acydjkKUg9xhYvbMBxEl5XVAOT6bLDlkUQYIRtiOGWKgCzMEoEYvbGotrMeJ?=
 =?us-ascii?Q?ex2eVQLX1XV4MeREqoCKoLFKjkcD7G02OqgpP3mHhHHvTRAqoBFsgp9N0GQD?=
 =?us-ascii?Q?Zrn8YguqJSHiFDCsmgKvMgBr9BAGz9/xn0k1r0fjG7Jy2fPLSrlkgDc9+FRu?=
 =?us-ascii?Q?puIhOOEwg3iwTFpLeO6S2QIOi3g6y+lyqd/llh7Ewb77AMZos0hHEBoJF40R?=
 =?us-ascii?Q?ZCvK1JNdj2i3THZd2b58k3E4T2EaVfaveoA+sMPxkYaXWn3jdCnN7KbnJYVO?=
 =?us-ascii?Q?EdTNCITm649rdocM/cuUuyaMzITh8NY9+/XXvpcPK08L/cT2S1fjbEZFJcL8?=
 =?us-ascii?Q?BCah22DqHf4CegOGsj7J4WYML+/81o8p1X6+u85k4l3MquEUgmusn5yykNRp?=
 =?us-ascii?Q?lcmDR5k3/xP/D68CE+9CFFxDuXv1yQgEVxTBSGElGfn8Ms2HH/is1pR6yIqk?=
 =?us-ascii?Q?d3F5G3QWXudbbSMahiTkmupYF4lxJAKwvnYkCJ1CX0AfQLKdZAZK4uwNWgYt?=
 =?us-ascii?Q?M6zLxiZ7+MFDBEFNsGfvA9QKopY8iBjP3ZJ/hGxOgw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?15wh83a88kyFYaNdAyPbzvQ4nqQefY9dZzhegWgRegTFgIks4v1FzRatcbMo?=
 =?us-ascii?Q?gffBgrL1ez7ZbtYS95O048jM73VpqlJxbJdD3SAIL7+nfMa0QuzeyeEHYCk2?=
 =?us-ascii?Q?/1JaTaRrMYOjF/NffgWrTi4WDvNULU14JIIS7Gyo0zIvrDsfEcl8KoGWEeog?=
 =?us-ascii?Q?VupGmoIThe5YXDF2J3eM3E7BKTNoEIOVK9jioiVJRzqMNgZCyCtKDhXWrLvW?=
 =?us-ascii?Q?iOnz3AMrrkatagitSCJOYb/1fpwfJVlixtloDChMt44w5aRtdaERU7xEcCSV?=
 =?us-ascii?Q?GxNpxNvfA/tlHd8l07s/Ytm9Ltho/3k8bnt/VzmHjz+PLWtWL+/LC1eoo42/?=
 =?us-ascii?Q?sTQq9YcF9aQzrG9T485FVVxcwOv/pcFZOioai8yq7Zkfc3bUlEN86KUXM3pS?=
 =?us-ascii?Q?OC45VV01rIC7acw4QBktnmK6AhdhX6DhByHE3cQyAl5S2dXGyIkKxfECxZJX?=
 =?us-ascii?Q?yUqMB9Wh6Z3DWB+8+N1OpCu5ErvBgkAYYmOAWVTMQj/Bm8fAJI0+LWQnlggz?=
 =?us-ascii?Q?TK9PCL7mPCVm5obFHOIjTuSmpSHG2zOj2iVWdFqG3ml4MGQWrbObwUj1Ro15?=
 =?us-ascii?Q?d4sCMnHkmLiAQ53HxaELKXLuWu6+dw8cpBd/XE+9X2MJXtqYsn9Hs63EC7h1?=
 =?us-ascii?Q?S/Lyng9tev6Fy1K2XvfURD9D2tQdfutyXuziOxI5M7Pp/ViDbSDdukU0YLId?=
 =?us-ascii?Q?/Olw5NdDL9RbSPzx7TbF48Wuwad+Yp6AZe/cWO4UYZFiLkpuPOUQAxa0BH3K?=
 =?us-ascii?Q?G2gY5ysGHtWUDI6VWCa/53tadeMahxZFXPAae4XMGWTGWSNClI9VFOHoJu3p?=
 =?us-ascii?Q?xcwIel/FUfmnF7qPJssD60iJfSowgAAOLQ3NCuoavnVInlgxpE7RN9uBZ9Fj?=
 =?us-ascii?Q?WXGmB7+8RLf2zvyKYnvvBFLZUkhokfwoddSZgE2xux3v4hfWl6sEyHGD6uBh?=
 =?us-ascii?Q?DE3AnvKRftfEG5OwCuMdr7IioIl8I6P98bKWaFJJQJyEC2jgmB07BJLtE3hm?=
 =?us-ascii?Q?g50SA+woYScptS4dPIhaDc7pLTmfaqDY4dO6jqPxyjZ41srDNYrukvxN13BZ?=
 =?us-ascii?Q?lDpdTsTE1JYsMBw188IEaiHxbK+Zqif0yAJg7vCzC7wLCknyUIvHx+zxUbEu?=
 =?us-ascii?Q?NH/RiKiZXCXwIlLfmzKeBof/0gvM6Ya23/lLqdxyVQ4mwl9pLmma/wIKMWNE?=
 =?us-ascii?Q?qOGmWYQ46Wbu4p7ICYzFp0GVD96FFql+6T5USk+H9oiq6lx/LbS/XCtrdaRo?=
 =?us-ascii?Q?b8rH5/BnvyKaZ7bFVkw9zA6xn/UPiK/uarwxvzjXvcqFA4xQU7n2bnBpOW8Z?=
 =?us-ascii?Q?DXw0lTeUkD9C78y7XVjYHnw90qF6Ju1OVVDxzKeR5QRj4Dr1TSeNS3kGJCv6?=
 =?us-ascii?Q?CV+q+OPuVcBhwJr4WqdVTBLZ1cys5Rl9PGZkXLlvtm42nGZpf4tJ+He0lMtf?=
 =?us-ascii?Q?7YPlPNUwEMHG1e0D/kqa/VdT8rTxOkRnatC0/NKHbNeKehFmenMuEg/Q2Per?=
 =?us-ascii?Q?HCQ76MvdlHe1bQ9YcsMoTqifuX6DuV4PVVjZP2mbM993zcdqWcxSsF5em8or?=
 =?us-ascii?Q?c/O8m8tw6AOnyJKy/C/Ro4eqo7jIUKxjEfLAducBMorD5YfxQn6U8NvPcBRy?=
 =?us-ascii?Q?Ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 894961c8-56d6-4d3e-ab45-08dc818e7e5b
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2024 16:26:58.5759 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g4XI7ZQ9PKEg1ynQNRJ54LbXy94QzIndnBkQ0nF/AaMdb1E1DdnDl6qTHus0dpqY8N0o7Eyw+q7HmyO2sPDZ+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6917
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

On Fri, May 31, 2024 at 10:20:26AM -0600, Yang, Fei wrote:
> > Overmapping the identity VRAM mapping is triggering hardware bugs on certain platforms. Use 2M pages for the last unaligned (to 1G) VRAM chunk.
> >
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Fei Yang <fei.yang@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 54 ++++++++++++++++++++++++---------
> >  1 file changed, 40 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c index b882d32eebfe..2d92ec27981c 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -69,7 +69,7 @@ struct xe_migrate {
> >
> >  #define MAX_PREEMPTDISABLE_TRANSFER SZ_8M /* Around 1ms. */  #define MAX_CCS_LIMITED_TRANSFER SZ_4M /* XE_PAGE_SIZE * (FIELD_MAX(XE2_CCS_SIZE_MASK) + 1) */ -#define NUM_KERNEL_PDE 17
> > +#define NUM_KERNEL_PDE 15
> >  #define NUM_PT_SLOTS 32
> >  #define LEVEL0_PAGE_TABLE_ENCODE_SIZE SZ_2M  #define MAX_NUM_PTE 512 @@ -136,10 +136,11 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >       struct xe_device *xe = tile_to_xe(tile);
> >       u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> >       u8 id = tile->id;
> > -     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level;
> > +     u32 num_entries = NUM_PT_SLOTS, num_level = vm->pt_root[id]->level,
> > +         num_setup = num_level + 1;
> >       u32 map_ofs, level, i;
> >       struct xe_bo *bo, *batch = tile->mem.kernel_bb_pool->bo;
> > -     u64 entry;
> > +     u64 entry, pt30_ofs;;
> >
> >       /* Can't bump NUM_PT_SLOTS too high */
> >       BUILD_BUG_ON(NUM_PT_SLOTS > SZ_2M/XE_PAGE_SIZE); @@ -159,10 +160,12 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >       if (IS_ERR(bo))
> >               return PTR_ERR(bo);
> >
> > -     entry = vm->pt_ops->pde_encode_bo(bo, bo->size - XE_PAGE_SIZE, pat_index);
> > +     /* PT31 reserved for 2M identity map */
> > +     pt30_ofs = bo->size - 2 * XE_PAGE_SIZE;
> > +     entry = vm->pt_ops->pde_encode_bo(bo, pt30_ofs, pat_index);
> >       xe_pt_write(xe, &vm->pt_root[id]->bo->vmap, 0, entry);
> >
> > -     map_ofs = (num_entries - num_level) * XE_PAGE_SIZE;
> > +     map_ofs = (num_entries - num_setup) * XE_PAGE_SIZE;
> >
> >       /* Map the entire BO in our level 0 pt */
> >       for (i = 0, level = 0; i < num_entries; level++) { @@ -233,7 +236,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >       }
> >
> >       /* Write PDE's that point to our BO. */
> > -     for (i = 0; i < num_entries - num_level; i++) {
> > +     for (i = 0; i < map_ofs / PAGE_SIZE; i++) {
> >               entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
> >                                                 pat_index);
> >
> > @@ -251,6 +254,9 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >       /* Identity map the entire vram at 256GiB offset */
> >       if (IS_DGFX(xe)) {
> >               u64 pos, ofs, flags;
> > +             /* XXX: Unclear if this should be usable_size? */
> > +             u64 vram_limit =  xe->mem.vram.actual_physical_size +
> > +                     xe->mem.vram.dpa_base;
> >
> >               level = 2;
> >               ofs = map_ofs + XE_PAGE_SIZE * level + 256 * 8; @@ -258,21 +264,41 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
> >                                                   true, 0);
> >
> >               /*
> > -              * Use 1GB pages, it shouldn't matter the physical amount of
> > -              * vram is less, when we don't access it.
> > +              * Use 1GB pages when possible, last unaligned chunk use 2MB
> > +              * pages as WOCPM is not allowed to be mapped on certain
> > +              * platforms.
> >                */
> > -             for (pos = xe->mem.vram.dpa_base;
> > -                  pos < xe->mem.vram.actual_physical_size + xe->mem.vram.dpa_base;
> > -                  pos += SZ_1G, ofs += 8)
> > -                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +             for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
> > +                  pos += SZ_1G, ofs += 8) {
> > +                     if (pos + SZ_1G > vram_limit) {
> 
> I'm afraid this patch wouldn't take effect on platforms where vram_limit is
> 1G aligned. Even for the last 1G, this check wouldn't be true.

We shouldn't use 2M pages if the VRAM limit is 1G aligned. This leaves
this code in a risky position where the 2M pages could largely remain
untested. Perhaps introducing a Kconfig option to enforce the 2M path
could be considered? However, excessive Kconfig options can be frowned
upon, so I'll defer to the maintainers to decide if that's a good idea.

> Should be if (pos + SZ_1G >= vram_limit)?

No, it is always better for performance (TLB usage is better) to use
larger pages if possible. With that said, the logic is correct.

> 
> > +                             u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
> > +
> > +                             entry = vm->pt_ops->pde_encode_bo(bo, pt31_ofs,
> > +                                                               pat_index);
> > +                             xe_map_wr(xe, &bo->vmap, ofs, u64, entry);
> > +
> > +                             flags = vm->pt_ops->pte_encode_addr(xe, 0,
> > +                                                                 pat_index,
> > +                                                                 level - 1,
> > +                                                                 true, 0);
> > +
> > +                             for (ofs = pt31_ofs; pos < vram_limit;
> > +                                  pos += SZ_2M, ofs += 8)
> > +                                     xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +                     } else {
> > +                             xe_map_wr(xe, &bo->vmap, ofs, u64, pos | flags);
> > +                     }
> > +             }
> > +
> > +             xe_assert(xe, pos == vram_limit);

Also while I'm here, I think this assert will pop on 2M pages. I think a
break is required after writing the 2M pages.

Matt

> >       }
> >
> >       /*
> >        * Example layout created above, with root level = 3:
> >        * [PT0...PT7]: kernel PT's for copy/clear; 64 or 4KiB PTE's
> >        * [PT8]: Kernel PT for VM_BIND, 4 KiB PTE's
> > -      * [PT9...PT28]: Userspace PT's for VM_BIND, 4 KiB PTE's
> > -      * [PT29 = PDE 0] [PT30 = PDE 1] [PT31 = PDE 2]
> > +      * [PT9...PT27]: Userspace PT's for VM_BIND, 4 KiB PTE's
> > +      * [PT28 = PDE 0] [PT29 = PDE 1] [PT30 = PDE 2] [PT31 = 2M vram
> > +identity map]
> >        *
> >        * This makes the lowest part of the VM point to the pagetables.
> >        * Hence the lowest 2M in the vm should point to itself, with a few writes
> > --
> > 2.34.1
> >
