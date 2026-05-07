Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85D7CD37AA
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 21:05:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FC110F26C;
	Thu,  7 May 2026 21:05:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RQFlPSjE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C2E10F27A
 for <intel-xe@lists.freedesktop.org>; Thu,  7 May 2026 21:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1778187955; x=1809723955;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=d/9Xlokpp7N1j+l3z9QFjd3f0lrG5wicoOGE0QiGpKQ=;
 b=RQFlPSjElqKaKGBP/m0qsmFuJgJTyyekopb3tB1CjcMaErIoDFtWm9E7
 Nw6ame2a7iGDG9VLqIV+Xifs/2dTte8plm/SwczeliujvqVd4dNZ82/cN
 ebv1ex9TRneISq/3plNckPm9TlE4Djcs8ngVtHbzVZVPjixpM0WxxtX6/
 xnJfUJ+NisobhmD2KE6NelFLNB7dWIHuZ86iuUzmiJZ3EyhmXy5zDwCKt
 pFky3ZRbIY81AYJJY00XrM71+zgI/CxR6ENYjyqhT+X/EwXfFFfBoi17P
 hcNvOiM9KXfwfVUxGDHuQRh4o3S8e28PsmKnn7GfnDdoz+6OTv30+zkKq Q==;
X-CSE-ConnectionGUID: YXCC4OXVTPGcmJ/EITHArw==
X-CSE-MsgGUID: cNUABKxwRn2tWpcDEOaIAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="82997766"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="82997766"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:05:54 -0700
X-CSE-ConnectionGUID: UJTD5MV/RdirrkvQx1DPfg==
X-CSE-MsgGUID: tnfLlTjlQRuYz+ko2KLySw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; d="scan'208";a="236677244"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2026 14:05:54 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:05:53 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 7 May 2026 14:05:53 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 7 May 2026 14:05:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fFcAQ0sWL6XMFKS0LuxIrxDQQDILgpghYQXOUZpY0LqRWLUrx3KxyI8Tp9SiZ9Wy41B/VlGmD5VIgFnjBH9eyN3xoypHLxcAwiM3kPs80Sf+9KM4kyyF5FMD3P2m44AmJsRU+PUjb4ZtrGf2pYuoq/IsXjxx5+mmCeeOwphwr0fs0rw+vM1ArptkSKZjg7ZLzal3LhpldpCiwTybe6RIfXPKWhR8CSnNEJR8TEPC4dDw2FBbKVGElmBsHQCouO1ttqmLhSl3SdsBnS6jYhL7qR/ow3byvYRJg9IoDpomRU1/Y6/23V+4QSEBJuj0x5xkW+cnfkYTF3riMFhha09T9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38uqBQk8rT33l26sSRdTtuPqYwBBNkx2Z952FFgxZkU=;
 b=kbVub395s/PD7OqL/By5OoDdg6moua9Y1itFEWmq46qtU2G2Vmc3LCiokkCWcKTEWIGQXfrQX7cSt+wI4BRoQypNKF80QiPuxjAYMzbOuxM4Dkj0x7LMf6uKHFpX3eJzEMpqQ7J6EIVBVMm41rTeh4SOpOTis+YsTIZrT08ziaBhK7daq5qIrri+WhErFVFaZe/M0gS4g25ob0nbT3plk8SocqhKqLCGZ5GYoKTnKeVzLhQgBG9viyH+jXbc05XohEXgyRdy7eoMItdjsF9NbeZ4PbadIBaDUHgGyw5lFyi+iz5FOltdx66hfu3nyi3wCc7x2EH6Hf4bz17/qJgp1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by PH7PR11MB6931.namprd11.prod.outlook.com (2603:10b6:510:206::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Thu, 7 May
 2026 21:05:49 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9891.008; Thu, 7 May 2026
 21:05:49 +0000
Date: Thu, 7 May 2026 17:05:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <umesh.nerlige.ramappa@intel.com>,
 <badal.nilawar@intel.com>, <aravind.iddamsetty@intel.com>,
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <michael.j.ruhl@intel.com>,
 <paul.e.luse@intel.com>, <mohamed.mansoor.v@intel.com>, <kam.nasim@intel.com>
Subject: Re: [RFC v1 2/5] drm/xe/fwctl: Add uAPI definitions for Xe FWCTL
 support
Message-ID: <afz-pzOEAVlwg4m8@intel.com>
References: <20260320072528.1780651-7-anoop.c.vijay@intel.com>
 <20260320072528.1780651-9-anoop.c.vijay@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260320072528.1780651-9-anoop.c.vijay@intel.com>
X-ClientProxiedBy: SJ0PR03CA0212.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::7) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|PH7PR11MB6931:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dd06fbb-1b05-4a84-7238-08deac7c6a0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|22082099003|56012099003; 
X-Microsoft-Antispam-Message-Info: rSVVSokWjGIIcaNIZH9nxgnnPlmS6xP20CSEE2IgsRR8E35Ik136xG3Iufcquft3Na6HK60VjvSm7rCXVEUzlp8Sbf5DKK7xAlsq4Yeva+TgWFlc5122rsAuhmX6tfNHQXC9DYeyXXVpretkKogzRJSW14+OniEwBC26PJ2qC9bCVMvBWyc9ubQmbv9Iu8064fMMeWHSla6zHF6F5LCfsoZONtEgyyQh7qic5HsHEPhaYFox+qdNwCI86vxIQG2SKmRJiGiTqE6rYx6ow5RtoN74SLMrxkHoOTeAZlSsZHaE55EfZ9v4c16J8usNrC9EhWdSJGtqiZ/Acsx7zHuaup9LcaeIgOO5o++rMf7rqtCQoAT6j0mTQm54YXZoOlMVrXRQyRMMg/1wNKRwd9TwpCJEVpm6YuD9259dE7w3YiBdT7M+6aJb2Tj0ZKjju9+8ZEmKVsly64TWACPuU6gPNLIczYcfKMZMmWV6k048ZgAeKiOcvxiqo7KDxbcXgeMPAQka1cDRZicyP1M751c4Vu0I+1YVT+MkIPF8oXhnrXi8ck/HHeI+MzQKHv+XUiudvpenv5EEMSeeoCSWvy+QzBxkC5Ewzi3tkmEcXy1QDTTAeA/4RF0JmztIEyWY8zbkPUT4lUtrzvM/edAS0ZmwlB+uhRGgIT6pCprhrhaS4jjbKrT/edSDuwNafXzRFexr8QFcoKt7/tAjfP75P6pTFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(22082099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?oovq6z/sQUjtwik3rNVGleko1cW9pAiElwZDJF/93EvpoaIxtv7gWRmMC6?=
 =?iso-8859-1?Q?W38jCLwDlJCQ949XAqwLowgszAiqvFVNdpbhiPuGowWaBlUQVvfe+Q9KIb?=
 =?iso-8859-1?Q?eTmvMpCGeqOX/3L5XIGkHi9O+nQLp1kg0Qiz1h3Jn8cRia4Lfqz18YYoSb?=
 =?iso-8859-1?Q?jeUSZ5h7DUoPtKevvEm2k3JoiE+xYSgke3r0amM5Q9ozf2HctSPMmw7kok?=
 =?iso-8859-1?Q?6gzxPiF2QPQpTkNioursAtgXuK9juioV7ia0isQ0qTrRGEGe2R/7w9IgDA?=
 =?iso-8859-1?Q?Dn1hcR7EcZPQNKEWJTfk7qhkHaQkkUIEP3JFYi2GGnCaqwth79zBY+eZs5?=
 =?iso-8859-1?Q?qmaQfcWtuTKPpvWIjCdaMoLDLhGctIKr/J1vZxE/RGgSiY9+jdUC7IbMCO?=
 =?iso-8859-1?Q?T5snIRbI9F+Azm+CJPYh9a7cWrIPgD80ejuWE80OZ+V9eOKqfsxWgyMLZ2?=
 =?iso-8859-1?Q?5+RLUf7U2WC1yVdsJU4c4Z7jolVAS5ICH7rfkUdMGVLm6MEHcSFilVVG8P?=
 =?iso-8859-1?Q?snjLS/ud1D3H1783l8zQnhJ28a4qWh95O351NBPiJPvx2WZfLdpjq7IePi?=
 =?iso-8859-1?Q?L+yP4qTA00XAVHtweBjplHkGNelEZexQGSDkMojtYyFBI1/JYZvI5pSu76?=
 =?iso-8859-1?Q?CZgPdT6E4NSR5t6zSPjAUVqV3LaXj8u4DwhMI77996H5pvlr1osb2jG7fu?=
 =?iso-8859-1?Q?lCHp3E1LlejGHxn8nC/4X78dssfcUeZg/3I947+XFbH+tUXu0GH4Edfz7b?=
 =?iso-8859-1?Q?10uJ9h829kyM0p8tlxFsW/CqJj+GQnzHhXQ/xcXdQJfqzYgvNLrgi01uAR?=
 =?iso-8859-1?Q?+Of1dZyma1A/Mf+AMYH0SqSe1OKpf7yAOe0rhaxM3guYfKWG9AfSlNRNT7?=
 =?iso-8859-1?Q?oRFYPCMN6gFJevt9z7WsKGhWw83iKZ/VVZ6IekBBpuInIGXY7bq2kBwFlU?=
 =?iso-8859-1?Q?Ld51OPgUCS8T3hQbqK4wiBoNv2xhHUmXKeFZsHtFHwyptHiP4VqScclGzp?=
 =?iso-8859-1?Q?WgOv7keN7HTH3NNZXzv0e5R7Bl7HR/exuigrKUglT65EndXQ+zDmWUmFIs?=
 =?iso-8859-1?Q?eGGL2IHxlpYSsS2cCVx5+VsGNiG/9jcmlQP1YnwLonzknXbuu9kG87Lr7/?=
 =?iso-8859-1?Q?/NpZcF1kyDFpF7CbOcxtlsELWK/UUIRN9+EN/d2xpbv3SW5biuteuiVkOB?=
 =?iso-8859-1?Q?L+6k1bQPgAIsigBW89CDE4/EtLTmep6tTsCEsE63wSpELdXYeYMuk+oKn9?=
 =?iso-8859-1?Q?JrIV2a21CJDv2p7GxZpgoZRFfFRpMGejTDHrEHXLRdjVKz4Z+b2Ola6xED?=
 =?iso-8859-1?Q?8EneWBc7e5cDqDJmFSmZWh4p2ulPW9ReQ2oV6/CvwNd10QZvWlVJZ8reIK?=
 =?iso-8859-1?Q?Cc8NB38W9xhf9mFn2CFHMPOQA6lgJBcofoR1wjDxeetZ6xBWIxDL07Xyn6?=
 =?iso-8859-1?Q?VNtx5D9EQYurYg9SLUZoL1fUYenbUfrUbViUeJP4fzhhPNAa+Hb+GBFtZw?=
 =?iso-8859-1?Q?PeJbiAGbbwwOxwlWveW4l1YiD8a8ci6gjWcLDsdgGuzYYS672tY3v9xO3B?=
 =?iso-8859-1?Q?pHIiXfVQ4GxAIIFglbD0Re5khfbv2wfeS2n8Tqyeavw74dBPhOKAsLDzUB?=
 =?iso-8859-1?Q?QdZUB7btO+QnnjChRy3+YsGAmnz6VXZ/CtoJ/mfePT/aVE0BJOFWl/mpNz?=
 =?iso-8859-1?Q?/fytSK9mhmjVLZ659ay8IsEsqyKUQG+muKPzkKh7y+/QGzPX8mha3f0nTT?=
 =?iso-8859-1?Q?HSrYrn4er7wotB3UqRNBJy+POxVkm4v9/RpzXpUSpkRK65UcmBffZSMQza?=
 =?iso-8859-1?Q?Y5U+fRcpaA=3D=3D?=
X-Exchange-RoutingPolicyChecked: JfnTdeW4gYQCidXLx2a8tAIkBDu1MjM0wk8d1PDBQqhcPdvl2BW60uFihyZJoFThBkkHLY6BAtCs4pnUsYLG7svGt1PR6n/lVkmnjA2GD6qb0XanMWZMC0N0vzE81ev9FHz19cncDQ0+/DgntyN0YRrzMFETf8udTAWqRucJOEe4d28viNHv6PdjbboWUDAwx67v20rusvj9Cxa0tJm5lIgsASZlHwM6EHeoXMMUR1wKDV/4SQuQnydrHcepSRrhOk5xJCRjELGmdbb+5QZG8BB8mWCpJze1P80ZgmSUSkBB6DuaWFPO1fIapcmgz5DtHJXc3LFcLq1mtLVmWOtGVw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dd06fbb-1b05-4a84-7238-08deac7c6a0b
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2026 21:05:49.2340 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PmMB5ewNUnbXZeDsNU3iCLPqDkGUiqfm1gLX93vUoNebwnKpYliIYOyVzeXxoauV2KiFLNcE91IKAdBusYtCjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6931
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

On Fri, Mar 20, 2026 at 12:25:30AM -0700, Anoop, Vijay wrote:
> From: Anoop Vijay <anoop.c.vijay@intel.com>
> 
> Add Xe-specific uAPI definitions for FWCTL support. Introduce
> include/uapi/fwctl/xe.h to describe userspace ABI for Xe firmware
> control operations, and extend core FWCTL uAPI to recognize
> Xe device type.
> 
> This patch adds uAPI definitions only. No functional kernel code
> is introduced.
> 
> Signed-off-by: Anoop Vijay <anoop.c.vijay@intel.com>
> ---
>  include/uapi/fwctl/fwctl.h |  1 +
>  include/uapi/fwctl/xe.h    | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 39 insertions(+)
>  create mode 100644 include/uapi/fwctl/xe.h
> 
> diff --git a/include/uapi/fwctl/fwctl.h b/include/uapi/fwctl/fwctl.h
> index 716ac0eee42d..c63bc15159d3 100644
> --- a/include/uapi/fwctl/fwctl.h
> +++ b/include/uapi/fwctl/fwctl.h
> @@ -45,6 +45,7 @@ enum fwctl_device_type {
>  	FWCTL_DEVICE_TYPE_MLX5 = 1,
>  	FWCTL_DEVICE_TYPE_CXL = 2,
>  	FWCTL_DEVICE_TYPE_PDS = 4,
> +	FWCTL_DEVICE_TYPE_XE = 5,

I don't believe we should have a generic XE component here, but one per
FW since we have many different FW underneath and each one with its
own different Mailboxes.

Check: https://lore.kernel.org/intel-xe/20250429073804.972137-10-badal.nilawar@intel.com/

>  };
>  
>  /**
> diff --git a/include/uapi/fwctl/xe.h b/include/uapi/fwctl/xe.h
> new file mode 100644
> index 000000000000..fb5612dec610
> --- /dev/null
> +++ b/include/uapi/fwctl/xe.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _UAPI_FWCTL_XE_H_
> +#define _UAPI_FWCTL_XE_H_
> +
> +#include <linux/types.h>
> +
> +/**
> + * DOC: Xe FWCTL Interface
> + *
> + * The Xe FWCTL interface provides userspace access to firmware subsystems
> + * on Intel Xe discrete GPUs. It exposes firmware management capabilities
> + * through the kernel FWCTL framework.
> + */
> +
> +/**
> + * struct fwctl_info_xe - FWCTL Information struct for Xe
> + *
> + * @fw_caps: Firmware capability bitmap
> + * @platform: Platform type
> + */
> +struct fwctl_info_xe {
> +	__u32 fw_caps;
> +	__u32 platform;
> +};
> +
> +/**
> + * struct fwctl_rpc_xe - Common Xe FWCTL RPC header
> + * @firmware_type: Firmware type
> + */
> +struct fwctl_rpc_xe {
> +	__u32 firmware_type;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
