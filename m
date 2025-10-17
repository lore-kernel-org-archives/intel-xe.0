Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10561CCD199
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 17:39:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C219810ECB7;
	Fri, 17 Oct 2025 17:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OCo6tGTX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B552110ECB7
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 17:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760722742; x=1792258742;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=C3g3yNZROFX0g/RCX9BEmMrgljfijcYbWRGxdYgxeOc=;
 b=OCo6tGTXy367b8Gdtif6aiUgNZOWLcmW7FOc7s+EdnjcHD/ufa5ytvQH
 gkFnIj1mCP51RGrdYF2J+tRAvzeVzP+HEAfPvmuK2iFXP8C2DVCMwsbjN
 z9G+EvpPgfVq9iWBCSGO3A9x+D6tpjCWGSplD1OzcuIaQjmY6lYRCyKie
 /cuvSqHM+Kkj24eVViVw3jI/v43o0gLqyqwEhuO8fugxOalj/zrXHfRcL
 qb/6qx+XOr64PMkaXeTc4yVAC68dO72b18Pv5m5OycrtDOw2HUxgcLK5e
 YqrJ+ungzXQO35abTJNWyMcWZzaujAqcKdqzjPKtSzVb1ejxlJxkFs6s9 g==;
X-CSE-ConnectionGUID: UXwXcI5fRsWFC5ZlhPF3uQ==
X-CSE-MsgGUID: HeTnUt+KTqyGvHaaK8s+wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="66584806"
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="66584806"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:39:02 -0700
X-CSE-ConnectionGUID: eR3zq2GmTYmt2YLCOIPLBw==
X-CSE-MsgGUID: 6ycbJxMISk6fYOSdAMtIBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,237,1754982000"; d="scan'208";a="213394263"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 10:39:01 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:39:01 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 10:39:01 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.27) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 10:39:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VbewDPOr3vJGuR49qcpATJGgThxZlnErMdk9/QapmS9t6SPmyUNK+VoWx7jKO/Byoc2+DkyinIyzvzS/gYeZPAm8svpc/wYk7hp2uJuj6txGLYXvdhCRePKAW+cuSLENm/tWjCjwhNSlWTF3Roz4UCEYc2Vw1G3mHpe87IPhVKaxfqYxmRuLXJNzU3xNyTzv9sLGqpNBYuyn7JDALVuifoznkN+LXc96xM1MwCOW05v3KBwlxkyNUQqA/wXM1iJ7ZJkpWIJ0p/e5kYcNt5XOpxc/kY+Ss4FLV6hc4ZBiE79Crdid8OLwzpYBH/pDIHX9b7TVmHhFofBSKcJZ9K6FSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Muc8JQQNImRsHg0YJM4hyBt5F1GzMR/IeUTmiuHxsKU=;
 b=wsEChxGuLDeCzZSHI0MtplBAxVIKGAa3foxWiI3P9B2Al9yJqKB53/U1XcCMXDfhIeY9QhctH3uFdMy5kx87lHgtZo4q60DBjUo7rTNMtAL4KXKbKTCqX9p2SX+KdT1WrszrhHZ4wkO5+tNEW13EjS4Yqk5JihI5xn1yth55lB1QRW+aYAV74KFBiDsMYhVsMt5MsmhjzvLeAYpbAMtVQ/GBo/RCTz5HrkSxRIIpPOMK2V8xv9CYKAWVzsAyoXHWBxjSbyNaLln4hiy5yrlb2yqQ/+o+LIp7wkFihfyd8vyzEE624Bj3smFr6ajTSLQ5Oml/Ivg3j900cbpcYmaS3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB6653.namprd11.prod.outlook.com (2603:10b6:806:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 17:38:59 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.009; Fri, 17 Oct 2025
 17:38:59 +0000
Date: Fri, 17 Oct 2025 10:38:56 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Nitin Gote <nitin.r.gote@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
Subject: Re: [PATCH v3 0/3] drm/xe: add =?utf-8?Q?V?=
 =?utf-8?Q?M=5FBIND_DECOMPRESS_support_and_on=E2=80=91demand?= decompression
Message-ID: <aPJ/MHpLDJ4yxF65@lstrano-desk.jf.intel.com>
References: <20251015104709.44476-1-nitin.r.gote@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20251015104709.44476-1-nitin.r.gote@intel.com>
X-ClientProxiedBy: MW4PR03CA0286.namprd03.prod.outlook.com
 (2603:10b6:303:b5::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB6653:EE_
X-MS-Office365-Filtering-Correlation-Id: ab66d4db-5b33-44d2-865a-08de0da40dc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pWe5GTWESHF744O2H6nnUm2F3xpCFxhUuOaqXdYT4231bgP/XNIEqQhFml41?=
 =?us-ascii?Q?EM8RaMAXCKzJnaDTK0mEZCLEK4h4mzgz+sZoewAsO5+JuXJQRqHbr55tdocM?=
 =?us-ascii?Q?lQK5fbWJ9mo2WZO6HJx0+pyH7hfxjjVc0n4zRvo2wTwXOSOQRddng1Gv1Xe6?=
 =?us-ascii?Q?I5Zh5AjKwl5qiBByrD9H0O6pfM7P/8UZ5J6gaDurG4ULU2eR3Vy1lxM0AM5c?=
 =?us-ascii?Q?ab+xX7LzklPs8zjPfWz/y/rHBro8+08WjkSS27qB2jXa+5xriifyjClOaiv/?=
 =?us-ascii?Q?7S7lVoaOopDbqbG9UCUo7DfJNzZVdfguD7fpf43DBR2G//PS19WYFRVIpMOf?=
 =?us-ascii?Q?PVEkExuI9tPBv1XcEz6mVzXejoemSteSVxliF4hwjVrEIXEzMK0kIvN0j9rG?=
 =?us-ascii?Q?hNKuy7VDkJ/q34R/J25750Gs8hrMcLzFCQZQ+ccZ7lD1Sd9Rd8ITI83sQQtB?=
 =?us-ascii?Q?muiFnjmGeFr/p/H7PhHOZuz28Z3sOYxQve8NRrleSFDN/peEGRTEFz7JKGgh?=
 =?us-ascii?Q?KEVxOQx76j14Pd7j1J6RQwni+w2V6NEucYUPinV8A8jw0cTwjkQIRlYSsmwC?=
 =?us-ascii?Q?1bECjOP2/KRvYSkX9Rqry8IIe0+9AHrzBpqOwXHL1gvToF9vw7OKB1GJ87tf?=
 =?us-ascii?Q?cLl4LWdAsRpLpY0yzzI/zj//gAA/l5IBfbwzMYXnRomVRJ9rStu+nfJANVWI?=
 =?us-ascii?Q?ktZAonjZOpU+DQQ6mKlix80bjeiqO3X5WHumFRdO0y8+7IdphDkYZjPj41rM?=
 =?us-ascii?Q?cYG71yf9J+XrzTG/uszFIrsJbS3NdoqDNcr5vew3lnjfz3P8xc+gWw0gtNNK?=
 =?us-ascii?Q?+vBLneTi80gADk8WDDxdOqtXLN5m1+O+g5X8/kzvqK8ymgmzQAeo73bGcEin?=
 =?us-ascii?Q?gYwyF5k6VBxRsyIWPzSL695aZ6vl45v62fh/R3aZjA0r3jvYlJ3yy2s/J7TC?=
 =?us-ascii?Q?vKFt5C0EqPcffg5rBsC1VmqdGAFpJDBBS5IncMKkyEaZwcrptguPvVOo5SPK?=
 =?us-ascii?Q?TT0jtY2qmxCZe9EJ03qm1DZqQwelewQgbBBV5sVI+7BJlMnZwWO7lbUhpQEG?=
 =?us-ascii?Q?60C3VS5M4fwSFb9W7jcSBM8vo5vz3znkezP8nAx3Va6+nr2+hyyMnS/4ji4d?=
 =?us-ascii?Q?q4sge2+4LO1J5TQtYLW/amVwFH4dgVFGtSic3xeUbwKf336E10I1kj3RCTUA?=
 =?us-ascii?Q?Sn/7OOZBnQs+Kxm3J5XEpRpA2y+c/ziw5GTEO5HTTPVZdFUs+mL9QagdKAZP?=
 =?us-ascii?Q?a9yIpojy2e3aORQV5JF5QPIeBgDDjKQKOmxx4xwcB6Pm89tamwO90/JcifNp?=
 =?us-ascii?Q?YEXHzXepBqpPgiYajor0Pcpno4nenEVZXBAIY+62S/SDOXV1lxqoY6aCQUhY?=
 =?us-ascii?Q?jk74JcG7S/Ea6xSwBCXjwY7XH52oMiScOR1Vx/0xFGJRsjOFBA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PkaSVC1wcFAcY13aG9eOVOqSbeNrzCTRcvR0rTM3veO2qBeCgH38sBOX4nZr?=
 =?us-ascii?Q?gdK+/PHnLiGiz4L16r0c5dyOiYEzfVc1leg9UI+HKjTA8Gv68cNhRHto+I4E?=
 =?us-ascii?Q?4dt/MEc2SOVvhHVQEzgppTpWEFDJzH9eaCLKd1XrHUkNK1SimXqfItjJtOiP?=
 =?us-ascii?Q?393XvGgxijiFNk5nZW/xarUhnmPY5E16FYS+9PgIpnpz/J1PdJrRIuocN30X?=
 =?us-ascii?Q?zkmMhIBxTgxO+miZdr7EMCwiGQMY4QqXg0536c9TnDx7O3KMf7yFQC6ac98v?=
 =?us-ascii?Q?vHIbo9DkxfxYGQRWzWPiE2RC9CkyAigzwxog1RuQqyDnEeYXLtFx/Y+BmULe?=
 =?us-ascii?Q?DnmnRhms3fDAt3LdeRYmlfyVz1Uex3tC9r9PvUlHIaDatBnCJ0yqUKrPvJB2?=
 =?us-ascii?Q?/cmAsMGLekh4f3sbY6thFP9dglwyQK+Zieas4d1f3mDW1YgdIiZ2ygYqzgmN?=
 =?us-ascii?Q?kZE1gVdidCBHSimoeYRypG/rg6iNg50QURt6qj4ZIVwr871EI3+aBiZOucyO?=
 =?us-ascii?Q?yiCvSdYWyqSww4Cfnjm6w1461/5wLHCKVUIkgTOSqhTWhHiPqz7y7bzZ+HqP?=
 =?us-ascii?Q?88oUebrKO69JhhkJ17xZ9Yz4vjCq2WH44aWejiDrrp8o/jGdlgZgWdE9D5i7?=
 =?us-ascii?Q?C4OLGgk/uqOUwM+Ak4fa7avVGgskn8P4ylPAEx3k3X8nIQNOCNPotjEHICgI?=
 =?us-ascii?Q?95BeySgpRIQFtuVrvW/Xje6X0DLYbjGuqG1wtAtaxGYli/JUpjuLyLSustW2?=
 =?us-ascii?Q?oYyZC0RjVlxXxnFFMbC1CgVyQoP3qdwZIe00KfT0phHn2OCA3s8LlklTuoej?=
 =?us-ascii?Q?BsQfqmFEjz4JbRS5oOOIJkpxy/DUZoPJB96WrY7wdwTEtHRbiXDIoGzTCgqo?=
 =?us-ascii?Q?f7fCj+D/QvSPnVj4q22zUS3359DmnGn1vfAbVjEBRwC8z7+AjpFRyEoXQ5KL?=
 =?us-ascii?Q?bcBGo4/CT9bl+9n2ytSxSn8Cgq1fhuKu7m/kRb68JpW0/xtQSWa334uz/IDy?=
 =?us-ascii?Q?AWZaJH59ASLnJKblk5ReVAlM4V1RDqbGzB9s18n8uwFMJO21BCVd6vVCuYYf?=
 =?us-ascii?Q?50tTbPNQOGJTDNYVme2OHEXG8zowuSkiqwJbkxqOf3kA4DGkiAFQutBL2o8T?=
 =?us-ascii?Q?3QgoIj6nDw9ofwLqeLJ9m4CkocyXTPRaIYk5Wm1pXkQrB023Cz0ilNrkS1Ls?=
 =?us-ascii?Q?O/9rjwdX/CxNNVV41dNoNhdnt9VfYzsXMEk/zHKv8LADIADR76M/yBu38vJj?=
 =?us-ascii?Q?RDIDpKdMrhFjcm6JWGCFsLw4jDym5pWogRdlUTiIQuNNO7Pl9TqV+m2kmUBY?=
 =?us-ascii?Q?Pzgx7h6tBUzxowVeYiTxHwUiZFuWdgZz69LaIbqn9Mfj6BT6tcqV/3kh9coM?=
 =?us-ascii?Q?wi5swbmW1RdX3Jc+IKaVCi1No+dlWhRa5bsm7KoRPlXLfB8QUXM5n/ioMSly?=
 =?us-ascii?Q?jEAOZsvVxmYaNpygSyCSeNAvfGRyu3962xY+EEKEl2hn4qVzI3d7S5luX5Rf?=
 =?us-ascii?Q?ZqQzlN+vqXhCI7YZp/fWX74hWdVZEOQX+ffl2d4vexvsdUwSmsU2/t4AajfV?=
 =?us-ascii?Q?vUkrVEGArdsaZT5B+G/hedtUeUbvIgPMCWeS97jnoEq/ilji8f6mibubhV0+?=
 =?us-ascii?Q?ag=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab66d4db-5b33-44d2-865a-08de0da40dc1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 17:38:59.1134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: buzNzvgNbeVG4GJyUZ0nsu8SY8ypSaRRi6+Iwrn99ox9lWD+wub8rMlz6axUQDWwgkuRsSfKnN+g8GRNb52BsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6653
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

On Wed, Oct 15, 2025 at 04:17:06PM +0530, Nitin Gote wrote:
> This series implements VM_BIND decompression support in the XE driver
> for both non-fault mode and fault mode.
> 
> Tested with https://patchwork.freedesktop.org/series/154711/
> which validates basic VM_BIND DECOMPRESS behavior for both
> regular and FAULT_MODE VMs.
> 

This series is getting close to being ready to merged - I'll do another
review shortly. But to merge this we will need a UMD PR which uses this
new uAPI. Has the compute UMD tested this code yet? Can you see if they
can post a PR which can be referenced in the cover letter?

Matt 

> v3: (Matt)
>    - s/xe_bo_schedule_decompress/xe_bo_decompress
>    - skip the decrompress step if the BO isn't in VRAM
>    - start/size not required in xe_bo_schedule_decompress
>    - Use xe_bo_move_notify instead of xe_vm_invalidate_vma
>      with respect to invalidation.
>    - Nits
>  
> v2:
>    - Add kernel doc (Matt)
>    - Move decompression work out of vm_bind ioctl. (Matt)
>    - Put that work in a small helper at the BO/migrate layer invoke it
>      from vma_lock_and_validate which already runs under drm_exec.
>    - Move lightweight checks to vm_bind_ioctl_check_args (Matthew Auld)
> 
> 
> Nitin Gote (3):
>   drm/xe: add VM_BIND DECOMPRESS uapi flag
>   drm/xe: add xe_migrate_resolve wrapper and is_vram_resolve support
>   drm/xe: implement VM_BIND decompression in vm_bind_ioctl
> 
>  drivers/gpu/drm/xe/xe_bo.c       | 50 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_bo.h       |  2 +
>  drivers/gpu/drm/xe/xe_migrate.c  | 90 ++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_migrate.h  |  7 +++
>  drivers/gpu/drm/xe/xe_vm.c       | 40 ++++++++++----
>  drivers/gpu/drm/xe/xe_vm_types.h |  2 +
>  include/uapi/drm/xe_drm.h        |  8 +++
>  7 files changed, 161 insertions(+), 38 deletions(-)
> 
> -- 
> 2.25.1
> 
