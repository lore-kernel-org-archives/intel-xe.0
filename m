Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED7FC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 18:12:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 610B610F4CF;
	Fri, 12 Apr 2024 18:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FoBixYw6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A659710F4CF
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 18:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712945528; x=1744481528;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=m01nUP/DAm4a+DR6ky9tXFJ2XPaTTL0u+JIvJ23+Ols=;
 b=FoBixYw6frC1vbe41Xck+QfyJknXdw2hb9nkymzfTgL/kwjJ6m59w7Te
 MLcPjD7AP3u9SWFJ6wuAR0WWOMiW4dIfQj5CaCmN9kEX5qZZWMKcqU/sQ
 97N4JM7GFULy1z4gqqLkkc0hMwi8sPbqV+gSh+Jg2tNaCvlxvPs83OCwg
 lNSPDM8KL2690mpW2budPDT2jdBP5YaHKUTjDBK7TpXohNZIdowL6G0bc
 nwXgA+oxT43vO25kOfxl8tsWSjLLNZGhaBRsw8Czd8z+OxIKh+QlSCzsz
 eahCJASP6JWldupsvWgPCGW7d2Dwx7S9F1a3L4gTXnZwkr6XEU0cCCzg+ g==;
X-CSE-ConnectionGUID: l8J5HrJMTm+bjgG/zSCpNQ==
X-CSE-MsgGUID: Ntis3+FCTeSZy2ekD+j8FQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="25869613"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25869613"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 11:12:08 -0700
X-CSE-ConnectionGUID: P2SuuenVRFe6gnnw3doNOQ==
X-CSE-MsgGUID: /JfDmG8ARVi+kQtEuq/SvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="25994901"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 11:12:07 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 11:12:06 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 11:12:06 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 11:12:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GqJJfCfj1sl8joTsdv7krTlpX4XrUd0NRxeQArioPy8lzKm6mjhuWlFiwrgYHV3uA/Jsz5Jm/w6Dt99DK1dHoWpv6MRGHRfkAVp8R4Okfl6vaa2pGcnX+93dkXnsTQbviQ0bWkETbhySPPK7yge4q7um49j4NvdcupNKv1FBHdOAEdVNvNgcYbCQZBmmMAZXg6/HEo/WZb9BgkiS70C3EoYeo/AGtXJhAep8I2BxbN2pdGKDSwGUEQy0m4VYiOQrErQrvr6bDxws5c3AB/Ga9dqweD+tGs1EaWFfO/DmrHsZGY1yibA6roRqj+v9fpMFgi4//zpCNkglycCOC8srYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mvrI/ZSjAteIGnRVDRFK0U7FGgfg0dIz+qdP1IWBgg=;
 b=Fc7llNjiwthKxP/ZkP2kveIBVDKiTWlh/L5x0d0xTe34INIxDVS0QAtWkmwhAaDnJdZPvDK5zSp5iif1IgcTAS9vHlyHa8o92JruBES4dKlO9hwj1svBbaz5ozMexea53sB7eNnyo2TK/JwL3crUdjqBaOM6mEeZiNeI7qEoJ6OZvOdtLk5KLyzBnfxZyq+yZ2cfRLxYBzRQXRu6LrKhx9yswgoS490dhKQ17suFmUz4p8R7DKbze1r6IITtiL2/by+evJwEk/+zlW2RKr0JQoqyg5K5SIYqiL0UKWgrbnSZ2EH+NZe72cwZ/oLDWRLqgQrIlUQrrBCkHyzUE0B0Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DS0PR11MB7359.namprd11.prod.outlook.com (2603:10b6:8:134::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Fri, 12 Apr
 2024 18:12:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7452.019; Fri, 12 Apr 2024
 18:12:03 +0000
Date: Fri, 12 Apr 2024 18:10:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
Message-ID: <Zhl5KFMvLbP2FvjJ@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-28-oak.zeng@intel.com>
 <ZhdF33hVByZy0od2@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB69919A436E1D1098148A1E0992042@SA1PR11MB6991.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SA1PR11MB69919A436E1D1098148A1E0992042@SA1PR11MB6991.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DS0PR11MB7359:EE_
X-MS-Office365-Filtering-Correlation-Id: e41249c6-d98a-427f-731b-08dc5b1c0dd6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ryYzY05on4Mt+psmzDA/VNE/sBKl/YpRseorx3GnCeUDpOJTQeQXG+TP3ZFT2iwyDou4hV0jTRuCstXjqPBoWPZsw4mrr18JSJieS9HNDm1LkORsn652UeRImU0ISTAKRcxlqBDWMbkwU4OQhDa8kUOtus1nRvQxaCD4YSqeRQmCjJwjkKvVsWpEOamYhXXl8oQrNqQcQSWeEYeqLsOG19VmGdAsbJbdoLqqXpF5jw5MFJNqVU6n1dnx+EO1BIyPn6W/G8e+ntTQ8aB6S5FBbLbNPDO41BWt71l3RCVqLDt+mumEqrFEEeHQ92XDivbuikWLcNG/auOE7hoEQCQOOwGJRY5A3zBFTLcFblTa2ovQRBqWoN9F3yjYT+Zm+H5W3VXSaI7qoO3zN6jM06EP6nRPLjU7d/4rY5GY9V+MILyfFpzZBHLAfuq/BZKGFys8K1Rn0PEjfIALzITfUKLPP7c9aBTmD+GJoXfxtVzduLzoi66mBOWYSMf9pRcSbVLTu4XJcuX04qJAYcE/8IgoZtVBG2/T+j41zlW1VWPsNEoYZ8j3qgj+ralrb0kUiupixNblEHerhYRwsuZdDAzf2J8FcjOtGhm+3IYC4vzrgKoaDk05wAwX7E49TQ+n69Ij
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?W1U8o1sjW1C3eiZ0bh0oiFGhzqrCXiJEylbR8XWLvR9ce7rZNnTWbSYii6?=
 =?iso-8859-1?Q?A0ITbF2ylUSGP85Oz6EwHeHttt00QxTI2QuLLtOo9kdmcKQYeMl2bZzGg+?=
 =?iso-8859-1?Q?fNGxuHIHcAoA1JH3zuhySKBJ8r2OvYyBRgLx39jlUGg/KqO+YYufNiDBs/?=
 =?iso-8859-1?Q?hdS/uMOFUQZi0UgOD17mvwC3ZUFNMOvPP7/bDUieMgW7gr60irBPUioiV4?=
 =?iso-8859-1?Q?5sl3UvpykcWa4OlBOH0+WXDYsS3HaSk7dcbvAtRvtwbvzSdrOKgCbNClEE?=
 =?iso-8859-1?Q?f65kOWzXq/l0i5beTV7Xu2eFJhIz3H+miinCA03jmuutv60O7YWaNvXbVr?=
 =?iso-8859-1?Q?GUmwXYf5TIva1S9zlzRi1CMIcKbxTektws0cmeI8vg0DMD03GG5DKLSr2W?=
 =?iso-8859-1?Q?UhTvM5BO/1UoK0+sKOYtpOfOGPxeFvyhPGd1zgbcgHFk6cPRfBszr7q2GI?=
 =?iso-8859-1?Q?XE9Si94yO7yBHtWdm/V6QE0xJsKwZXG9JcxBni6i7ZQLIdCFauAvTIJqU6?=
 =?iso-8859-1?Q?l/2IF8SS6p3kFBM7ajikO3q4Ly7K9G0hhKeF5Rrs39N+i3eEKvKOHmxRN5?=
 =?iso-8859-1?Q?mGXbni1DCqpRGNrE6QifbUo4/6l/7sbAlWBZ4Kr2kt+gyoGg9/InGAkfV4?=
 =?iso-8859-1?Q?ze5++He6/TO84hz3SART+++1YJmPQkjFfhZJcG+0OzZhfLigLgfomUrDex?=
 =?iso-8859-1?Q?SDnQNY7txHzaL5nizgS7lVBZgT2f7mmyxIUIKm87yKBb/3WNkBpqigl2dh?=
 =?iso-8859-1?Q?TpbEdzgain6qoC1ah35lp8mzai+VGNr9BZuwgy5H8Hw1RWrnqaVWFViL8D?=
 =?iso-8859-1?Q?bfsCOnG+NFSoP52G6qdjmpEfNhRBOAaIr5vnt2O+WE0AJhig9I3TSNeHTC?=
 =?iso-8859-1?Q?laFoLWODK82C94Qk9MITOMa9S7rVhTt+hUu+uqJ2c+XNVBIy9vTtbREw7f?=
 =?iso-8859-1?Q?NwJ3p5puWUHn/WlQ2opP9KuIvzdz6Z5S+PUwEZ5dPmTUuOABMRxfRLBa+W?=
 =?iso-8859-1?Q?P3Lb4itIHDPISMzSj4qUe/lyrZKbyHRW5IF+80Z0ONEfX2ckRIzDBCPKaO?=
 =?iso-8859-1?Q?06vBsKGB7ARaiKaYCWMjUzIr/MVSbNOjpl6QDokTDGtOWv2pTSW0SdYVrt?=
 =?iso-8859-1?Q?l8kKouhXYt0rHlkgd72TdLCz9R5XL0AZVmDhJRdtsfZRvijkiGjWfkFOJ8?=
 =?iso-8859-1?Q?/yOrILJ+akwQie/nBkusppDkBITJdQXewahiw1IQqsQUfaZWwqyCLhSFxK?=
 =?iso-8859-1?Q?5oTWKS3HCSI2klgk+DkxthbbnWXZsTJGGZxLm247Nz52q+50kW0Sm4qdG+?=
 =?iso-8859-1?Q?lW0tdBIGFrlU5d3eLlBNc7fvvdR2vKzd3JgwlgiHT69oIBKwSoBzqF0xeZ?=
 =?iso-8859-1?Q?zzGgwluaMPhdpl4psrVINGdSoMYbTt6EXQ2KPTZfpthjSuDEQCPDQhb5kr?=
 =?iso-8859-1?Q?z3ieykgORUGjiCjcGzmPxo5/f+kV1zk32D/mmSRDUjG/U4se4pw8WCscKW?=
 =?iso-8859-1?Q?9neqVCmERlU5vCqe3hgF6NfC2phhVSjp9wqHL76qTHy126IAa01ij21rrK?=
 =?iso-8859-1?Q?WmYnRhDo0GBva12KV9qsgggm/EE2G2AmLuIdtVG5yGt+csC88L8CT0ODVT?=
 =?iso-8859-1?Q?9J6UzWT1MPXDQhWkgb4StghFjhRjzlaKGesSxsczcAGqQTiYsFsQDIvg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e41249c6-d98a-427f-731b-08dc5b1c0dd6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 18:12:03.0710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hAdp/NLZy2r+Nghy6jvLn0f92b5KcE6tiYAu3XmcmAJz/3xEcw8vuaY6sMJfQp2p4+TgQNmEZDy9J+mqr/FYTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7359
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

On Fri, Apr 12, 2024 at 11:24:06AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Wednesday, April 10, 2024 10:07 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > Brian <brian.welty@intel.com>
> > Subject: Re: [v2 27/31] drm/xe/svm: Handle CPU page fault
> > 
> > On Tue, Apr 09, 2024 at 04:17:38PM -0400, Oak Zeng wrote:
> > > Under the picture of svm, CPU and GPU program share one same
> > > virtual address space. The backing store of this virtual address
> > > space can be either in system memory or device memory. Since GPU
> > > device memory is remaped as DEVICE_PRIVATE, CPU can't access it.
> > > Any CPU access to device memory causes a page fault. Implement
> > > a page fault handler to migrate memory back to system memory and
> > > map it to CPU page table so the CPU program can proceed.
> > >
> > > Also unbind this page from GPU side, and free the original GPU
> > > device page
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > Co-developed-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Signed-off-by: Niranjana Vishwanathapura
> > <niranjana.vishwanathapura@intel.com>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Thomas Hellström <thomas.hellstrom@intel.com>
> > > Cc: Brian Welty <brian.welty@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/Makefile         |   1 +
> > >  drivers/gpu/drm/xe/xe_svm.h         |   8 +-
> > >  drivers/gpu/drm/xe/xe_svm_devmem.c  |   7 +-
> > >  drivers/gpu/drm/xe/xe_svm_migrate.c | 222
> > ++++++++++++++++++++++++++++
> > >  4 files changed, 230 insertions(+), 8 deletions(-)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_svm_migrate.c
> > >
> > > diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> > > index f89d77b6d654..65289acdd563 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -131,6 +131,7 @@ xe-y += xe_bb.o \
> > >  	xe_step.o \
> > >  	xe_svm.o \
> > >  	xe_svm_devmem.o \
> > > +	xe_svm_migrate.o \
> > 
> > See comments about file org, same thing applies here. Let's put all of
> > the svm implementation in a single file.
> > 
> > >  	xe_sync.o \
> > >  	xe_tile.o \
> > >  	xe_tile_sysfs.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index f601dffe3fc1..c9e4239c44b4 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -7,11 +7,11 @@
> > >  #define __XE_SVM_H
> > >
> > >  #include <linux/mm_types.h>
> > > +#include <linux/mm.h>
> > >  #include "xe_device_types.h"
> > >  #include "xe_device.h"
> > >  #include "xe_assert.h"
> > > -
> > > -struct xe_vm;
> > > +#include "xe_vm_types.h"
> > >
> > >  /**
> > >   * struct xe_svm - data structure to represent a shared
> > > @@ -31,6 +31,9 @@ struct xe_svm {
> > >  	struct list_head vm_list;
> > >  };
> > >
> > > +#define xe_svm_for_each_vm(svm, vm)
> > 	\
> > > +		list_for_each_entry(vm, &svm->vm_list, svm_link)
> > > +
> > 
> > Don't think this is need, see below.
> > 
> > >  extern struct xe_svm *xe_create_svm(void);
> > >  void xe_destroy_svm(struct xe_svm *svm);
> > >  extern struct xe_svm *xe_lookup_svm_by_mm(struct mm_struct *mm);
> > > @@ -79,4 +82,5 @@ int xe_devm_alloc_pages(struct xe_tile *tile,
> > >
> > >  void xe_devm_free_blocks(struct list_head *blocks);
> > >  void xe_devm_page_free(struct page *page);
> > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf);
> > >  #endif
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > index 088ac209ad80..32ada458f1dd 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm_devmem.c
> > > @@ -37,11 +37,6 @@ struct xe_svm_block_meta {
> > >  	unsigned long bitmap[];
> > >  };
> > >
> > > -static vm_fault_t xe_devm_migrate_to_ram(struct vm_fault *vmf)
> > > -{
> > > -	return 0;
> > > -}
> > > -
> > >  static u64 block_offset_to_pfn(struct xe_mem_region *mr, u64 offset)
> > >  {
> > >  	/** DRM buddy's block offset is 0-based*/
> > > @@ -168,7 +163,7 @@ void xe_devm_free_blocks(struct list_head *blocks)
> > >
> > >  static const struct dev_pagemap_ops xe_devm_pagemap_ops = {
> > >  	.page_free = xe_devm_page_free,
> > > -	.migrate_to_ram = xe_devm_migrate_to_ram,
> > > +	.migrate_to_ram = xe_svm_migrate_to_sram,
> > 
> > Again single file so this will be static function, no reason to export
> > this.
> > 
> > >  };
> > >
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_svm_migrate.c
> > b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > new file mode 100644
> > > index 000000000000..0db831af098e
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_svm_migrate.c
> > > @@ -0,0 +1,222 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2023 Intel Corporation
> > > + */
> > > +
> > > +#include <linux/gfp.h>
> > > +#include <linux/migrate.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/dma-fence.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/bitmap.h>
> > > +#include <linux/kernel.h>
> > > +#include <linux/slab.h>
> > > +#include <drm/drm_buddy.h>
> > > +#include "xe_device_types.h"
> > > +#include "xe_device.h"
> > > +#include "xe_trace.h"
> > > +#include "xe_migrate.h"
> > > +#include "xe_ttm_vram_mgr_types.h"
> > > +#include "xe_assert.h"
> > > +#include "xe_pt.h"
> > > +#include "xe_svm.h"
> > > +#include "xe_vm.h"
> > > +
> > > +
> > > +/**
> > > + * alloc_host_page() - allocate one host page for the fault vma
> > > + *
> > > + * @dev: (GPU) device that will access the allocated page
> > > + * @vma: the fault vma that we need allocate page for
> > > + * @addr: the fault address. The allocated page is for this address
> > > + * @dma_addr: used to output the dma address of the allocated page.
> > > + * This dma address will be used for gpu to access this page. GPU
> > > + * access host page through a dma mapped address.
> > > + * @pfn: used to output the pfn of the allocated page.
> > > + *
> > > + * This function allocate one host page for the specified vma. It
> > > + * also does some prepare work for GPU to access this page, such
> > > + * as map this page to iommu (by calling dma_map_page).
> > > + *
> > > + * When this function returns, the page is locked.
> > > + *
> > > + * Return struct page pointer when success
> > > + * NULL otherwise
> > > + */
> > > +static struct page *alloc_host_page(struct device *dev,
> > > +							 struct vm_area_struct
> > *vma,
> > > +							 unsigned long addr,
> > > +							 dma_addr_t
> > *dma_addr,
> > > +							 unsigned long *pfn)
> > 
> > Weird alignment, also I don't think we are want to allocate a page at
> > time...
> > 
> > Beyond that, can't say I'm a fan of 2 arguments being return and
> > populated here either (dma_addr_t *dma_addr, unsigned long *pfn). I
> > haven't seen a lot that style function in Linux.
> > 
> > Probably makes more sense to have a function which allocates pages,
> > locks them, and populates the pfn array (migrate_pfn) rather than doing
> > this a page at a time.
> > 
> > > +{
> > > +	struct page *page;
> > > +
> > > +	page = alloc_page_vma(GFP_HIGHUSER, vma, addr);
> > > +	if (unlikely(!page))
> > > +		return NULL;
> > > +
> > > +	/**Lock page per hmm requirement, see hmm.rst*/
> > > +	lock_page(page);
> > > +	*dma_addr = dma_map_page(dev, page, 0, PAGE_SIZE,
> > DMA_FROM_DEVICE);
> > 
> > The device is writing to these pages so I think DMA_BIDIRECTIONAL is
> > needed, right? As mentioned above I think this should be broken out into
> > a different step too.
> > 
> > > +	if (unlikely(dma_mapping_error(dev, *dma_addr))) {
> > > +		unlock_page(page);
> > > +		__free_page(page);
> > > +		return NULL;
> > > +	}
> > > +
> > > +	*pfn = migrate_pfn(page_to_pfn(page));
> > > +	return page;
> > > +}
> > > +
> > > +static void free_host_page(struct page *page)
> > > +{
> > > +	unlock_page(page);
> > > +	put_page(page);
> > > +}
> > > +
> > > +/**
> > > + * migrate_page_vram_to_ram() - migrate one page from vram to ram
> > > + *
> > > + * @vma: The vma that the page is mapped to
> > > + * @addr: The virtual address that the page is mapped to
> > > + * @src_pfn: src page's page frame number
> > > + * @dst_pfn: used to return dstination page (in system ram)'s pfn
> > > + *
> > > + * Allocate one page in system ram and copy memory from device memory
> > > + * to system ram.
> > > + *
> > > + * Return: 0 if this page is already in sram (no need to migrate)
> > > + * 1: successfully migrated this page from vram to sram.
> > > + * error code otherwise
> > > + */
> > > +static int migrate_page_vram_to_ram(struct vm_area_struct *vma,
> > unsigned long addr,
> > > +						unsigned long src_pfn,
> > unsigned long *dst_pfn)
> > > +{
> > 
> > We definitely don't want to copy 1 page at time. I touch on this in [1].
> > Basically this going to perform poorly unless we use larger copies, the
> > migrate code supports non-contigous sram addresses, and vram addresses
> > will likely be contigous due to the buddy allocator.
> > 
> > [1] https://patchwork.freedesktop.org/patch/588548/?series=132229&rev=1
> > 
> > > +	struct xe_mem_region *mr;
> > > +	struct xe_tile *tile;
> > > +	struct xe_device *xe;
> > > +	struct device *dev;
> > > +	dma_addr_t dma_addr = 0;
> > > +	struct dma_fence *fence;
> > > +	struct page *host_page;
> > > +	struct page *src_page;
> > > +	u64 src_dpa;
> > > +
> > > +	src_page = migrate_pfn_to_page(src_pfn);
> > > +	if (unlikely(!src_page || !(src_pfn & MIGRATE_PFN_MIGRATE)))
> > 
> > I'm going to say this is a bug if !src_page ||
> > !is_zone_device_page(src_page) || !(src_pfn & MIGRATE_PFN_MIGRATE) and
> > we return -EFAULT (or another error code if that makes more sense). We
> > are migrating from the device where we know we have backing store from
> > the original fault.
> > 
> > > +		return 0;
> > > +
> > > +	mr = xe_page_to_mem_region(src_page);
> > > +	tile = xe_mem_region_to_tile(mr);
> > > +	xe = tile_to_xe(tile);
> > > +	dev = xe->drm.dev;
> > > +
> > > +	src_dpa = xe_mem_region_pfn_to_dpa(mr, src_pfn);
> > > +	host_page = alloc_host_page(dev, vma, addr, &dma_addr, dst_pfn);
> > > +	if (!host_page)
> > > +		return -ENOMEM;
> > > +
> > > +	fence = xe_migrate_pa(tile->migrate, src_dpa, true,
> > > +						dma_addr, false, PAGE_SIZE);
> > > +	if (IS_ERR(fence)) {
> > > +		dma_unmap_page(dev, dma_addr, PAGE_SIZE,
> > DMA_FROM_DEVICE);
> > > +		free_host_page(host_page);
> > > +		return PTR_ERR(fence);
> > > +	}
> > > +
> > > +	dma_fence_wait(fence, false);
> > 
> > Even if we did want to migrate a page at a time, we only need to wait on
> > the last fence due to the ordered nature of exec queues.
> > 
> > > +	dma_fence_put(fence);
> > > +	dma_unmap_page(dev, dma_addr, PAGE_SIZE, DMA_FROM_DEVICE);
> > 
> > With above, will likely unmap all dma pages in a single function once
> > the last fence is signaled.
> > 
> > > +	return 1;
> > > +}
> > > +
> > > +/**
> > > + * xe_svm_migrate_to_sram() - Migrate memory back to sram on CPU page
> > fault
> > > + *
> > > + * @vmf: cpu vm fault structure, contains fault information such as vma etc.
> > > + *
> > > + * Note, this is in CPU's vm fault handler, caller holds the mmap read lock.
> > > + *
> > > + * This function migrate one gpu vma which contains the fault address to
> > sram.
> > > + * We try to maintain a 1:1 mapping b/t the CPU vma and gpu vma (i.e.,
> > create one
> > > + * gpu vma for one cpu vma initially and try not to split it). So this scheme
> > end
> > > + * up migrate at the vma granularity. This might not be the best performant
> > scheme
> > > + *
> > > + * This can be tunned with a migration granularity for  performance, for
> > example,
> > > + * migration 2M for each CPU page fault, or let user specify how much to
> > migrate.
> > > + * This is more complex due to vma splitting.
> > > + *
> > > + * This function should also update GPU page table, so the fault virtual
> > address
> > > + * points to the same sram location from GPU side. This is TBD.
> > > + *
> > > + * Return:
> > > + * 0 on success
> > > + * VM_FAULT_SIGBUS: failed to migrate page to system memory,
> > application
> > > + * will be signaled a SIGBUG
> > > + */
> > > +vm_fault_t xe_svm_migrate_to_sram(struct vm_fault *vmf)
> > > +{
> > > +	struct xe_mem_region *mr = xe_page_to_mem_region(vmf->page);
> > > +	struct xe_tile *tile = xe_mem_region_to_tile(mr);
> > > +	struct xe_device *xe = tile_to_xe(tile);
> > > +	struct vm_area_struct *vma = vmf->vma;
> > > +	struct mm_struct *mm = vma->vm_mm;
> > > +	struct xe_svm *svm = xe_lookup_svm_by_mm(mm);
> > 
> > I don't think this is needed... More below.
> > 
> > > +	unsigned long addr = vma->vm_start;
> > > +	u64 npages = vma_pages(vma);
> > > +	struct xe_vma *xe_vma;
> > > +	vm_fault_t ret = 0;
> > > +	struct xe_vm *vm;
> > > +	void *buf;
> > > +	int i;
> > > +
> > > +	struct migrate_vma migrate_vma = {
> > > +		.vma		= vmf->vma,
> > > +		.start		= vma->vm_start,
> > > +		.end		= vma->vm_end,
> > 
> > So I know in my PoC I had the fault user pointer (xe_vma) == struct
> > vm_area_struct of the GPU fault. That is definitely wrong. We likely
> > want to allocate sub-range of vm_area_struct for the xe_vma, we can call
> > this a chunk size. Logical chunks sizes would be aligned 2MB, 64k, and
> > finally 4k in sizes trying the largest first... The chunk sizes are
> > trivial as we likely can just have table with values, the key here is
> > the vm_area_struct vm_start / vm_end are not what we want to use here
> > rather xe_vma_start(vma) and xe_vma_end(vma). I think we get the xe_vma

After I typed this, realized I made a mistake here...

s/xe_vma_start/xe_vma_userptr/
s/xe_vma_end/xe_vma_userptr + xe_vma_size/

But you get the idea - the zone_device_data points Xe specific chunk
data (currently xe_vma, could be xe_pt_state our something later if we
switch to 1:N).

Check AMD's + Nvidia's drivers and they both use this field in a similar
way.

> > from the faulting page vmf->page->zone_device_data field unless you have
> > another use that field...
> 
> You are right. Such work is planned in the memory attributes part that Himal is working on. We have a migration_granularity attribute which allow user to set the chunk size.
> 

That makes sense. The chunk size is always just hint though, right?

> > 
> > I also comment on my patch with my suggestion implement chunk sizes too.
> > 
> > > +		.pgmap_owner	= xe,
> > 
> > Again helper for this.
> > 
> > > +		.flags		= MIGRATE_VMA_SELECT_DEVICE_PRIVATE,
> > > +		.fault_page = vmf->page,
> > > +	};
> > > +
> > > +	buf = kvcalloc(npages, 2* sizeof(*migrate_vma.src), GFP_KERNEL);
> > > +	migrate_vma.src = buf;
> > > +	migrate_vma.dst = buf + npages;
> > > +	if (migrate_vma_setup(&migrate_vma) < 0) {
> > > +		ret = VM_FAULT_SIGBUS;
> > > +		goto free_buf;
> > > +	}
> > > +
> > > +	if (!migrate_vma.cpages)
> > 
> > This is an error, need to set a return value.
> > 
> > > +		goto free_buf;
> > > +
> > 
> > We probably should check migrate.cpages != npages too as I also think
> > this is an error.
> > 
> > > +	for (i = 0; i < npages; i++) {
> > > +		ret = migrate_page_vram_to_ram(vma, addr,
> > migrate_vma.src[i],
> > > +							migrate_vma.dst + i);
> > > +		if (ret < 0) {
> > > +			ret = VM_FAULT_SIGBUS;
> > > +			break;
> > > +		}
> > > +
> > > +		/** Migration has been successful, free source page */
> > > +		if (ret == 1) {
> > > +			struct page *src_page =
> > migrate_pfn_to_page(migrate_vma.src[i]);
> > > +
> > > +			xe_devm_page_free(src_page);
> > > +		}
> > > +
> > > +		addr += PAGE_SIZE;
> > > +	}
> > 
> > I touch on this above, this should be reworked to roughly:
> > 
> > - alloc pages and populate migrate_vma.dst
> > - dma map sram pages
> > - migrate a chunk of contigous vram addresses at a time
> > - wait on last dma fence from migrate
> > - unmap dma pages
> > - unlock and free all pages
> > 
> > > +
> > > +	xe_svm_for_each_vm(svm, vm) {
> > > +		xe_assert(xe, vm->mm == mm);
> > > +		xe_vma = xe_vm_lookup_vma(vm, vmf->address);
> > > +		if (xe_vma)
> > > +			xe_vm_invalidate_vma(xe_vma);
> > > +	}
> > 
> > I've touched on why this isn't needed... I think one of these
> > migrate_vma_* functions will trigger all MMU notifiers registered for
> > the range. The notifier owns the invalidate then.
> 
> Very good point. Yes after read migrate_vma_setup function, I agree this function will call mmu notifiers with MMU_NOTIFY_MIGRATE event. Today we invalidate vma with this event. So yes, above codes are not needed.
> 
> I do identified one potential improvement: when mmu notifier is called back with MMU_NOTIFY_MIGRATE event, if the migrate_vma_setup is called from the gpu page fault path, we can ignore the gpu vma invalidation as we will update gpu page table later after migration anyway. I think an page table invalidation is not needed in such case. But this should be just a minor improvement.
>

We skip invalidations if the initial_bind flag is clear which should
cover at the initial GPU fault. There is certainly room for improvement
/ optimizations in the MMU notifier though, it is kinda messy right now
too. IMO work like this can be done once the basic design is working +
tests in place to verify changes / optimizations.
 
> 
> > 
> > Beyond this, maybe I'm confused about a few things and how this fits all
> > together. Doesn't every user process have its own unique mm, fd, and vm
> > (e.g. own address space)? If a user want a shared address space then use
> > threads with a single mm, fd, and vm.
> 
> Yes, this is also my understanding. Each user process has its own mm struct and device fds. 
> 
> In a shared address space case, such as there are multiple pthread created through pthread_create in one process, all those pthreads should have different kernel task_struct, but all those task_struct (say we get it from "current" macro) should share one same mm struct, which means they all lives inside one cpu address space.
> 
> Now with this work, we are now basically extending this shared cpu address space to gpu program. So both cpu program and gpu program can share one address space.
> 
> Since we allow user to create multiple gpu vm for one device (lets focus on one device for now), so each shared address space can have multiple gpu vm... each gpuvm should be able to register its own mmu notifier to core mm, even if those notifier has the same address range. But I will have to test this out. If all this works, above codes are not needed. If different gpuvm can't register mmu notifier for same address range, then we would need a fix....
>

The mmu notifier code is implemented with the interval tree which
supports overlapping rangers (i.e. we can have multiple VM's register
notifiers with the sam address range in a single MM).
 
> 
> > 
> > So even if we had to resolve the xe_vma's here and do an invalidate here
> > very confused what this is doing. This is this the case with multiple
> > devices and each VM points to a different device? 
> 
> Right now I only focus on single device. See above. This is to solve one gpu device but multiple gpu vm case. But as said above, for now I don't think this is needed. I need to test more on the mmu notifier behavior: whether it allow us to insert two notifiers for the same range for one mm....
> 

Agree that our focus should be on single device now. If that design it
well thought out I don't think extending this to multiple devices will
be a huge change either.

Matt

> Oak
> 
> Again so that case I
> > don't think a xe_svm structure would be needed, on GPU fault we should
> > be to detect from the faulting page zone_device_data and pgmap owner
> > if the fault already has a physical backing on another GPU and resolve
> > how to map it into GPU with a fault... Jason suggests this in the
> > following thread [2] and I think I agree with him.
> > 
> > [2] https://lore.kernel.org/all/5495090e-dee1-4c8e-91bc-
> > 240632fd3e35@amd.com/T/
> > 
> > > +	migrate_vma_pages(&migrate_vma);
> > 
> > This logic is going to change but ...
> > 
> > On an error I think we only want to call migrate_vma_finalize to revert
> > pages back to the original state (i.e. migrate_vma_pages commits the
> > page changes which we don't want to do on an error).
> > 
> > > +	migrate_vma_finalize(&migrate_vma);
> > > +free_buf:
> > > +	kvfree(buf);
> > > +	return 0;
> > 
> > I don't think 0 should blindly be return here, if there is an error
> > return VM_FAULT_SIGBUS. We likely want a high level error message too.
> > 
> > Matt
> > 
> > > +}
> > > --
> > > 2.26.3
> > >
