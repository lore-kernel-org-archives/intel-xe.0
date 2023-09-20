Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81B35C04FEE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 19:54:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 488D110E545;
	Wed, 20 Sep 2023 19:54:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FABD10E545
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Sep 2023 19:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695239683; x=1726775683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=6B2OCu7880PH9ovujp5IydafjXSIASbaZ+KZrZRLuv4=;
 b=R9a4vEGbWg387ULFG2WVtkS02Q+nfBA7uER2bTtO0M9NBNAwcVdSiNFc
 kdr4ntDYiL+mzuBotw3/trC/syplGOMmPrBJ/yksAJhpxDj+OTq58MXPW
 B425ftzRDM5km8+xg1FpbIVhS9cX1tRNPTVfvtkA7tWKEeKE0oeY8Mon6
 eigjE46Q0Tg8+YE08s3pLYij/TTYhx+6aPbsVojPVdgbvl785yXLbcNat
 dVFNEXEWGKK/90XXJHG0tUx9vZ6giAXD3huFKNEz5PRMx1MFDjjBVuooD
 vG994s9X1/3mFjcxdF2pZ1gb+FkhY283UmMqUjFIVPVTSRvO6JGFBay4f w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384160191"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="384160191"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2023 12:54:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="746778781"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; d="scan'208";a="746778781"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2023 12:54:43 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:54:42 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 20 Sep 2023 12:54:42 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 20 Sep 2023 12:54:42 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 20 Sep 2023 12:54:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lf+crvF41xEYpKCd4QRUdn/uKi5yvPtKQXXezYpSwCHub6qtkEzgfNiQQs1jm0xHAQfsYHF263rESUOBSL6zDLG9/YFFdJUR9D97lrcITaLNcvnDjAs+kyUxMjknuFKxNjFDZg2dIuvQnVlVQE2YAm25EHpLz3ZbC1wx3zn/rL0W44P23aWgpr29nF2RGtiu2PvC8me9cIFrL4pXaiFxktMhAZuisLz16bP60fZZofWPPusqcU3aRRyRqiYzZ6KitTpc96S27OzwECOFbWF6Ipl7gTsd4vEEE2TdKKZ0lHWXpDCoj423jDqj1POfUB/4AkJto9wz0iJlloFxUOxv6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn7oGCMfWQrgDUkawcli5oTwvVeuAfbryPG9dFqi0yM=;
 b=IsYlbFQLJ8CnZcyFUr/2loWvHoJ13LX+lZBufi6iItVZlEFc6QPLFa8d+MlftLuWqEp+mIZfW/8swkiD7W58ev9+V0UD7tSOYnxn6eFxprFELiuT8kpg5yFnZdN54RvMYTeJWQTGyEpnPDer2OIaOzWZqfXpHdGXAwdR1P43pjt7tRs4vljc28guHXXCnHjQ7LGqtnlvGtDe9zLy4/3iVMjQFmXJWbSVK6j7yCghzYVS79HewUx6A+D4CvjY4/qLt3iTJ3A/ONrF2JJhqADEv4owinirHdTuqyibGvu5TVa78ov6wK6DN2yK7AW6Z0yRjUsjFy4KcD3Im/L7hhBa2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by IA0PR11MB7377.namprd11.prod.outlook.com (2603:10b6:208:433::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Wed, 20 Sep
 2023 19:54:24 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%6]) with mapi id 15.20.6792.022; Wed, 20 Sep 2023
 19:54:24 +0000
Date: Wed, 20 Sep 2023 15:54:20 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
Message-ID: <ZQtN7L7NzdfM0/cX@intel.com>
References: <20230919110541.1243785-1-sujaritha.sundaresan@intel.com>
 <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919110541.1243785-2-sujaritha.sundaresan@intel.com>
X-ClientProxiedBy: SJ0PR03CA0099.namprd03.prod.outlook.com
 (2603:10b6:a03:333::14) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|IA0PR11MB7377:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b4b8ead-cdc5-4675-930d-08dbba136354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7e92T3G7RrbyVk5Du3OcqxVlh69Otr9tZJdjrYdQRIFpUc3lmixb6B06hLJG70bkbAcEgFqW428TWXnUll126esrmEVK8lrR+VouLiKrTcvF2CbMCrfPz2Hv6PzKIs69spZJJwDPrCDyaTKWKitKCuuJj23rWXdrhSBH6U2naZIpn5u/TY4eWlkwLNYhHcTiJENXheAD+j9SYMVlmkWVLAvWqwYQRQ3q0XCDkwNeM5+VLS5ZD3ylhjl9kK9P0Q7jcLe1Fvq/JDAOO4w6DCdh1uf0hO7z6Efy0KEdsw71Ihy1AT2HuVrUkp+OOODkaJq3utBVUYBUjXgVFVZ/C9EZKKE8aQAc91ftqoR4gDGzgEh5eFUeWiJKEk6rZaiueddozVLL+H87DO5Ke5eBEvm8WAj632ET7ZQjJjMlR+ura16G5gYsCqG6C/ptshYI3NXrmrSBkLZDRHg0lrOz+5tYSjrT6NA+1YNXS3fxloM0JXWoa37evRIXN5/4XH9hi+f4qBZ56vc0fb3ZDExkD0cfumCAf3alEGVK7gLUhyA54VMCB5Rqzg7VkOrAYG0jl8kx2Q19NvFhfSr+JIwsjd9id9RVxNZvIBsFF7fF/f+HEZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(1800799009)(186009)(451199024)(26005)(82960400001)(8676002)(8936002)(2616005)(6862004)(4326008)(83380400001)(2906002)(30864003)(36756003)(44832011)(86362001)(6506007)(6486002)(478600001)(6666004)(5660300002)(316002)(6636002)(37006003)(6512007)(66946007)(66556008)(41300700001)(38100700002)(66476007)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UWhJbXRMRlFSMXo3a2R0UWl5ejdJQW1uK1lkT0NlLzlMNThIR3cxRjBOMm11?=
 =?utf-8?B?aHhkS2N0UXFaRUxNTjZTS1RrcWcvUlR6UUJSM2R3OEtFTFBkWSs0bjY3cCtt?=
 =?utf-8?B?M012TUpmVURMZ1lndklDdWowck5XZXJjRGQvZzU1K3JqTkljVXRTUVN3Vngz?=
 =?utf-8?B?ZXllR0tBL0xDWGowMVBUMGdWY21vckNkYVFNQy8wUmdxL1VGV2EzYmc3WjdD?=
 =?utf-8?B?RDJzVW5MdFNaZ1Naai9SVjQ4dno2MUp0ZFVpbEU3ZHJMNjBBN0NMM1psODgz?=
 =?utf-8?B?WGp3anlPN1ZVbzVxZjFrbDFHS2x2V2dqbk5LTkd6NjFCRXBDcTZBcEh3MWx6?=
 =?utf-8?B?a0RHc25WSXhhMXF2VVh5a2M3QW44MDJKYmtrT1BNY0pGNU9IclFzUnYzVS82?=
 =?utf-8?B?Vitpd25IZmUwRG5LL3Jqa1k0YjhYTUY0SmVRdjVaUFI5QW1QOUhFb0JBRldL?=
 =?utf-8?B?aWNkeVZTcWpudkJXRFI4bmY0TURoZGtjK0lIYUlBTGVaeDM3ZFhXcEgzcW1P?=
 =?utf-8?B?N0Rqa29ReWMvNWFQSkc3WlMrVDErUnNjK1RMTkRLY2h2bU4wVFBUZjQvcUlQ?=
 =?utf-8?B?YjlFN0xyMVozUUdUaGlPUkNkd0tTcmhDaEV3enVKWThtbkVPZlJ2Y0JqZGFK?=
 =?utf-8?B?TGFOd3JaZkhVeG9qWEZVeWhVQlZNUStTVGNzblJFR2lrM05SSFplSUFWSTN6?=
 =?utf-8?B?ajNUVlBLWUs0TU15NmZuUGx3dVllUlQ2SWgxbkJtMFhGY21kaFhwZjFhczVG?=
 =?utf-8?B?WTRDbm5zZkpiMkozK1IxaklkTFRTTlZoR3VHMjgvZ3ZDN3dQcGdUUXBmNHRQ?=
 =?utf-8?B?Ui9tSUxUNjI2WVgyUmF5SVlGTTM5VGhFS2EwVlUyK1llZ0pCYlpYTHRicVpO?=
 =?utf-8?B?V0xiYUFSRy9NUXlIZ0U2cTZmVENKdVNVazRNdjFBYzIxQXNJMzViT2F6SEVC?=
 =?utf-8?B?S0tKbjFhWUtHZGlJTGNNVTBEM0d6MkRqb2k3TzFnZGpXT3lKQ1pMaHY3V0tL?=
 =?utf-8?B?aEphVFNiZFVqamJ3bWIra3FkN1ljdEpBcE01ditFQ1hSZ3E4YlVieUtaaEtt?=
 =?utf-8?B?djcxMDJaVEQzNmhPY0JTbU5uUzhIZ1hqQ2g4ZDZ1aW44ZWszYU1UaDNSMCs3?=
 =?utf-8?B?Sm4wTVgrc2pkNFV1R3k0Vnl2N1c3TWdMTmR6ODh6QWQ3TTl4c3pLOTByNXRp?=
 =?utf-8?B?Q2VTanlQZnNJK1E4RzlTUEdYSUFTZkxJRTIvTUsvdEI2ZUp4OHRPdU52UkZM?=
 =?utf-8?B?aHZ1RXJJY1lmamkyUS9Fa2xkWFczSmpjSDlaZDcwU1FDZGpydXlqNTdVS1pL?=
 =?utf-8?B?TkhVRHB0MExaU1R3ZnpIeW9UcU9ncm01VTVyK3d0MWEvYncxK2tySEYzZXMx?=
 =?utf-8?B?a2VvZG9Kekh3eittYnpGYk1oNUkyYUdxcy83QzlzTndBVjlIR0g2SXpEM0hw?=
 =?utf-8?B?Z3JvSTZDaVBZcjZpWlJ4R0hNN1praTNOWG5uTDUxb004bmJBN09BOENpR3VM?=
 =?utf-8?B?dVpMOVNZcjA0eDV3RDZmU3U4V0phWVJsTWhPNlJ0dlMwb3VLMVdRUzd1QXhz?=
 =?utf-8?B?a0MvOEJDY29VejVDOFVIZVdhN1RNcVVEMkgwMVNnM3h0SGx6dXJWRDZFZTZp?=
 =?utf-8?B?OVRpWUFEaE80MkxCQjgxaUdsQlczZHIrN21CVSt1dFZKY2hsTWM3MnNXSFRH?=
 =?utf-8?B?SFZyUnpLbldtYk9odkg2ZUd0SjNGZWNHV2RRY2tXME5pb2pFK1FPb3Z6ZHkv?=
 =?utf-8?B?Zlo4aXJTRjA4RTVBblJSK2Q2c3YwN1YzNGJoNFhra0o2dXlJVjE5NEpGYVFU?=
 =?utf-8?B?cmhhTiszSHJuZVRUMlBmTEZpb1RaWVFoeTM4WmNTZnVJOGtVdnY4UnFoZnlY?=
 =?utf-8?B?VTk5Tytvc3JTWFVxb1N0aS8vbVBydllPMXJJQ1cwTUtMdE1kb3FZM0F6UG9S?=
 =?utf-8?B?WWNLTVpGWUJnbm1WVkYzWGVFeVBoUkJ6TlM0UHErMU5PdUl3VUl1Um1nYXV3?=
 =?utf-8?B?MGYxRk00N2w2Z2lJbGZzZWxwdU0xY3FmVzdQV0FlYU81b3Y4OUg4c2MwSXVQ?=
 =?utf-8?B?K25ndFY3NmxjOWFCc2MzMDErZlJQN0Rod0JWU1dTNUlOa1JZMDZoRndFcmVz?=
 =?utf-8?B?QkRNQjhkN1VHb25XUjlkbCtDNlJmMWhtdTBROG4yV25DUi9MaWREMHJHeHBi?=
 =?utf-8?B?Z1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b4b8ead-cdc5-4675-930d-08dbba136354
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2023 19:54:24.1558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BnbFuN42cyq6lGmO7MZ8mG1XSeNteu/mbmW60Msifx6+SwuNIkquUmwoAXLBldcicwZ5SNoU17He2Uwq5ijYag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7377
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/1] drm/xe: Add throttle reason sysfs
 attributes
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 04:35:41PM +0530, Sujaritha Sundaresan wrote:
> Add throttle reasons sysfs interface under device/../gt#/
> Currently there is one overall status and eight reasons
> attributes.

I wonder if the xe_freq should come before this component here.
and maybe 'freq' deserves its own directory under 'gt<n>'?!

> 
> The new sysfs structure will have the below layout
> 
> device/tile<n>/gt<n>
>                ├── gt0
>                │   └── throttle

I was going to suggest that 'throttle_reasons' as the name of the directory
would be better, but then I read the doc below and saw the status field.
So I agree with you that simply throttle is a good call.

>                │       ├── <throttle_reasons>
>                │
>                │
>                ├── gtN
>                │   └── throttle
>                │       ├── <throttle_reasons>
> 
> v2: Fix review comments (Riana)
>     Move init call (Matt)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile                   |   1 +
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h          |  13 +
>  drivers/gpu/drm/xe/xe_gt_sysfs.c              |   3 +
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c     | 281 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h     |  17 ++
>  .../gpu/drm/xe/xe_gt_throttle_sysfs_types.h   |  15 +
>  drivers/gpu/drm/xe/xe_gt_types.h              |   4 +
>  7 files changed, 334 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index cc95a46b5e4d..7e1c4be0ab7f 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -63,6 +63,7 @@ xe-y += xe_bb.o \
>  	xe_gt_mcr.o \
>  	xe_gt_pagefault.o \
>  	xe_gt_sysfs.o \
> +	xe_gt_throttle_sysfs.o \

maybe we should call this component simply xe_gt_throttle (without the sysfs)?

>  	xe_gt_tlb_invalidation.o \
>  	xe_gt_topology.o \
>  	xe_guc.o \
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index e13fbbdf6929..f9ba57c3bc4b 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -410,4 +410,17 @@
>  #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>  #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>  
> +#define GT0_PERF_LIMIT_REASONS			XE_REG(0x1381a8)
> +#define   GT0_PERF_LIMIT_REASONS_MASK		0xde3
> +#define   PROCHOT_MASK				REG_BIT(0)
> +#define   THERMAL_LIMIT_MASK			REG_BIT(1)
> +#define   RATL_MASK				REG_BIT(5)
> +#define   VR_THERMALERT_MASK			REG_BIT(6)
> +#define   VR_TDC_MASK				REG_BIT(7)
> +#define   POWER_LIMIT_4_MASK			REG_BIT(8)
> +#define   POWER_LIMIT_1_MASK			REG_BIT(10)
> +#define   POWER_LIMIT_2_MASK			REG_BIT(11)
> +#define   GT0_PERF_LIMIT_REASONS_LOG_MASK	REG_GENMASK(31, 16)
> +#define MTL_MEDIA_PERF_LIMIT_REASONS		XE_REG(0x138030)
> +
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sysfs.c b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> index c69d2e8a0fe1..d4839ade7240 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sysfs.c
> @@ -11,6 +11,7 @@
>  #include <drm/drm_managed.h>
>  
>  #include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs.h"
>  
>  static void xe_gt_sysfs_kobj_release(struct kobject *kobj)
>  {
> @@ -52,6 +53,8 @@ void xe_gt_sysfs_init(struct xe_gt *gt)
>  
>  	gt->sysfs = &kg->base;
>  
> +	xe_gt_throttle_sysfs_init(&gt->throttle);
> +
>  	err = drmm_add_action_or_reset(&xe->drm, gt_sysfs_fini, gt);
>  	if (err) {
>  		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> new file mode 100644
> index 000000000000..0dc9c7cada5a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.c
> @@ -0,0 +1,281 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <drm/drm_managed.h>
> +
> +#include <regs/xe_gt_regs.h>
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_sysfs.h"
> +#include "xe_gt_throttle_sysfs.h"
> +#include "xe_mmio.h"
> +
> +/**
> + * DOC: Xe GT Throttle
> + *
> + * Provides sysfs entries for frequency throttle reasons in GT
> + *
> + * device/gt#/throttle/status - Overall status
> + * device/gt#/throttle/throttle_reason_pl1 - Frequency throttle due to PL1
> + * device/gt#/throttle/throttle_reason_pl2 - Frequency throttle due to PL2
> + * device/gt#/throttle/throttle_reason_pl4 - Frequency throttle due to PL4, Iccmax etc.
> + * device/gt#/throttle/throttle_reason_thermal - Frequency throttle due to thermal
> + * device/gt#/throttle/throttle_reason_prochot - Frequency throttle due to prochot
> + * device/gt#/throttle/throttle_reason_ratl - Frequency throttle due to RATL
> + * device/gt#/throttle/throttle_reason_vr_thermalert - Frequency throttle due to VR THERMALERT
> + * device/gt#/throttle/throttle_reason_vr_tdc -  Frequency throttle due to VR TDC
> + */
> +
> +static struct xe_gt_throttle *dev_to_throttle(struct device *dev)
> +{
> +	struct kobject *kobj = &dev->kobj;
> +
> +	return &kobj_to_gt(kobj->parent)->throttle;
> +}
> +
> +static struct xe_gt *throttle_to_gt(struct xe_gt_throttle *throttle)
> +{
> +	return container_of(throttle, struct xe_gt, throttle);
> +}
> +
> +u32 read_perf_limit_reasons(struct xe_gt *gt)

when a function is not exported in a header file it should be static.

> +{
> +	u32 reg;
> +	if (xe_gt_is_media_type(gt))
> +		reg = xe_mmio_read32(gt, MTL_MEDIA_PERF_LIMIT_REASONS);
> +	else
> +		reg = xe_mmio_read32(gt, GT0_PERF_LIMIT_REASONS);
> +
> +	return reg;
> +}
> +
> +u32 xe_read_status(struct xe_gt_throttle *throttle)

if you are not exporting the function you should use static,
if you are exporting the function it should have documentation,
in any of the cases, the namespace of this function is confusing.

xe_read seem something bigger on the xe driver as a whole...

in general do not use 'xe_<component>_' for static functions...
although we have many cases out there already.
But when you export then you need to make that very specific in
sync with the component name... in this case something like
xe_throttle_

> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 status = read_perf_limit_reasons(gt) & GT0_PERF_LIMIT_REASONS_MASK;
> +
> +	return status;
> +}
> +
> +u32 xe_read_reason_pl1(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl1 = read_perf_limit_reasons(gt) & POWER_LIMIT_1_MASK;
> +
> +	return pl1;
> +}
> +
> +u32 xe_read_reason_pl2(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl2 = read_perf_limit_reasons(gt) & POWER_LIMIT_2_MASK;
> +
> +	return pl2;
> +}
> +
> +u32 xe_read_reason_pl4(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 pl4 = read_perf_limit_reasons(gt) & POWER_LIMIT_4_MASK;
> +
> +	return pl4;
> +}
> +
> +u32 xe_read_reason_thermal(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermal = read_perf_limit_reasons(gt) & THERMAL_LIMIT_MASK;
> +
> +	return thermal;
> +}
> +
> +u32 xe_read_reason_prochot(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 prochot = read_perf_limit_reasons(gt) & PROCHOT_MASK;
> +
> +	return prochot;
> +}
> +
> +u32 xe_read_reason_ratl(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 ratl = read_perf_limit_reasons(gt) & RATL_MASK;
> +
> +	return ratl;
> +}
> +
> +u32 xe_read_reason_vr_thermalert(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 thermalert = read_perf_limit_reasons(gt) & VR_THERMALERT_MASK;
> +
> +	return thermalert;
> +}
> +
> +u32 xe_read_reason_vr_tdc(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	u32 tdc = read_perf_limit_reasons(gt) & VR_TDC_MASK;
> +
> +	return tdc;
> +}

it looks you have many functions to make static and remove the 'xe_'

> +
> +static ssize_t status_show(struct device *dev,
> +			   struct device_attribute *attr,
> +			   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool status = !!xe_read_status(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", status);
> +}
> +static DEVICE_ATTR_RO(status);
> +
> +static ssize_t reason_pl1_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl1 = !!xe_read_reason_pl1(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl1);
> +}
> +static DEVICE_ATTR_RO(reason_pl1);
> +
> +static ssize_t reason_pl2_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl2 = !!xe_read_reason_pl2(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl2);
> +}
> +static DEVICE_ATTR_RO(reason_pl2);
> +
> +static ssize_t reason_pl4_show(struct device *dev,
> +			       struct device_attribute *attr,
> +			       char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool pl4 = !!xe_read_reason_pl4(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", pl4);
> +}
> +static DEVICE_ATTR_RO(reason_pl4);
> +
> +static ssize_t reason_thermal_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermal = !!xe_read_reason_thermal(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermal);
> +}
> +static DEVICE_ATTR_RO(reason_thermal);
> +
> +static ssize_t reason_prochot_show(struct device *dev,
> +				   struct device_attribute *attr,
> +				   char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool prochot = !!xe_read_reason_prochot(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", prochot);
> +}
> +static DEVICE_ATTR_RO(reason_prochot);
> +
> +static ssize_t reason_ratl_show(struct device *dev,
> +				struct device_attribute *attr,
> +				char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool ratl = !!xe_read_reason_ratl(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", ratl);
> +}
> +static DEVICE_ATTR_RO(reason_ratl);
> +
> +static ssize_t reason_vr_thermalert_show(struct device *dev,
> +					 struct device_attribute *attr,
> +					 char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool thermalert = !!xe_read_reason_vr_thermalert(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", thermalert);
> +}
> +static DEVICE_ATTR_RO(reason_vr_thermalert);
> +
> +static ssize_t reason_vr_tdc_show(struct device *dev,
> +				  struct device_attribute *attr,
> +				  char *buff)
> +{
> +	struct xe_gt_throttle *throttle = dev_to_throttle(dev);
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	bool tdc = !!xe_read_reason_vr_tdc(&gt->throttle);
> +
> +	return sysfs_emit(buff, "%u\n", tdc);
> +}
> +static DEVICE_ATTR_RO(reason_vr_tdc);
> +
> +static const struct attribute *throttle_attrs[] = {
> +	&dev_attr_status.attr,
> +	&dev_attr_reason_pl1.attr,
> +	&dev_attr_reason_pl2.attr,
> +	&dev_attr_reason_pl4.attr,
> +	&dev_attr_reason_thermal.attr,
> +	&dev_attr_reason_prochot.attr,
> +	&dev_attr_reason_ratl.attr,
> +	&dev_attr_reason_vr_thermalert.attr,
> +	&dev_attr_reason_vr_tdc.attr,
> +	NULL
> +};
> +
> +static void gt_throttle_sysfs_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_files(kobj, throttle_attrs);
> +	kobject_put(kobj);
> +}
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle)
> +{
> +	struct xe_gt *gt = throttle_to_gt(throttle);
> +	struct xe_device *xe = gt_to_xe(gt);
> +	struct kobject *kobj;
> +	int err;
> +
> +	kobj = kobject_create_and_add("throttle", gt->sysfs);
> +	if (!kobj) {
> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
> +		return;
> +	}
> +
> +	err = sysfs_create_files(kobj, throttle_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register throttle sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, gt_throttle_sysfs_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> +
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> new file mode 100644
> index 000000000000..809213c3bba1
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_H_
> +#define _XE_GT_THROTTLE_SYSFS_H_
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_gt_throttle_sysfs_types.h"
> +
> +void xe_gt_throttle_sysfs_init(struct xe_gt_throttle *throttle);
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> new file mode 100644
> index 000000000000..5ee0d45d0a9f
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_gt_throttle_sysfs_types.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +#define _XE_GT_THROTTLE_SYSFS_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +struct xe_gt_throttle {
> +};
> +
> +#endif /* _XE_GT_THROTTLE_SYSFS_TYPES_H_ */
> +
> diff --git a/drivers/gpu/drm/xe/xe_gt_types.h b/drivers/gpu/drm/xe/xe_gt_types.h
> index d4310be3e1e7..7829bbeeb5d8 100644
> --- a/drivers/gpu/drm/xe/xe_gt_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_types.h
> @@ -8,6 +8,7 @@
>  
>  #include "xe_force_wake_types.h"
>  #include "xe_gt_idle_sysfs_types.h"
> +#include "xe_gt_throttle_sysfs_types.h"
>  #include "xe_hw_engine_types.h"
>  #include "xe_hw_fence_types.h"
>  #include "xe_reg_sr_types.h"
> @@ -299,6 +300,9 @@ struct xe_gt {
>  	/** @sysfs: sysfs' kobj used by xe_gt_sysfs */
>  	struct kobject *sysfs;
>  
> +	/** @throttle: frequency throttling reasons in GT */
> +	struct xe_gt_throttle throttle;
> +
>  	/** @mocs: info */
>  	struct {
>  		/** @uc_index: UC index */
> -- 
> 2.25.1
> 
