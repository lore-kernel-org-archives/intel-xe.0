Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FE2C25B74
	for <intel-xe@archiver.kernel.org>; Tue, 21 May 2024 10:39:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C9F310E853;
	Tue, 21 May 2024 10:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e4HXFbxC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C539310E853
 for <intel-xe@lists.freedesktop.org>; Tue, 21 May 2024 10:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716287968; x=1747823968;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=wKMgw2/JVKjym5zs8KqUsmlV7R+fwOc+PtrlpIWtXYo=;
 b=e4HXFbxCreUr/aC4ahTo/TkdIqU5L7xh2ALzPZu/Ru47j+rD7FgPrxC8
 kXmHaRudZ2mVhUdouXP0bbhRAANZWsV2tlAolqkSIF97r83E/2GA3u0kF
 KyauYClDg8gFWgIhHVXvD8pwePbMTFHNsRlXJvfo8GAH295kCeC/Gfgcc
 OjsCCSwNsE20JuuMdy518SQM8GaxEtJsf95ChDjZ1juBq0t8h+os7sRE4
 ujZL+6ZmpOw6R13q401r89gmnJdHqIU3o4KEtNLrPVBxxMbUpmcL0mpnT
 eQYrF60XnTJaFKx1VvPKLvynEvGud/6MHfHS0qd/p3B/WQIkYNUGXNAKS A==;
X-CSE-ConnectionGUID: lzG9rIIHQl2i4knLz2+smw==
X-CSE-MsgGUID: S+SfDLHDSNG3x2Q4wUwS3w==
X-IronPort-AV: E=McAfee;i="6600,9927,11078"; a="12407993"
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="12407993"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2024 03:39:27 -0700
X-CSE-ConnectionGUID: mWJGWU64T3KirRf0A+bVWw==
X-CSE-MsgGUID: VKyw4SIJQ/SmWqdjOjZUBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,177,1712646000"; d="scan'208";a="37724113"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 May 2024 03:39:28 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 21 May 2024 03:39:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 21 May 2024 03:39:27 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 21 May 2024 03:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OseperS/luNh1r9PgrdMyAv1WpUcybAwzR90y3D58YhMKl8N9edd/ewiFCFzzY5wyNYMH0W2DYnYFa/mLOtNOEflZaDyUXtBHyvLdXSqG0Bi9wYneCCZvJ9rZdCdicGAieKO53EFU3Ib9owNvWTMObbnP+dwxHgb+A2UpxZ3bMnB6b61uWXdvlFgqVyPHeaZ95DaKLFxUL6P7yDeRmXSqsodvM147iJsGqzc5B4wqFHXixORv9xEaPsBpn6hBJ1QTyUO6ihRdA4ASI+F0uDHEGkSPoTDYyME58b8asy8khiCLgkQ38pXSLsELGON6wHKjt9kvljHGeRALpvGbkSiXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUBUJOn4dRDQQdLF1qiVCtZbho+W0V3c32ucrRCksFU=;
 b=m34R7JK1eSR6OOvw9bGeKSbO59BCW8UsQUgeQUGGF/pJryMIMGrGKUEj0xGhGxZU0MgZ5UyqKKv1+DkNiSs/xr1LD6/mVuW4RbIXSfZWmL+vseSvQ+XCKbyWwMw4dm3MPIYL/5X01bIoSkBdxnCJ6Shy30MV0buNLCDXnoD2OGN9rfWJTEzpbcHCorhZAaOCXALi+Ynq6v+9D2alnpDeNjKPIrCyHF+jWIuCZzgPsm2ziEP04yxZy77K5YU8hqbln8s4ET3BiHDVa7DGhGwx1ofhiZqd4KVBKEAFzWDgaxyf1/W4ewj/YxIJazAmKu5OvY6vtUjkC7kLE8QgZ/7XtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by PH8PR11MB8064.namprd11.prod.outlook.com (2603:10b6:510:253::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 10:39:25 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%3]) with mapi id 15.20.7587.035; Tue, 21 May 2024
 10:39:24 +0000
Date: Tue, 21 May 2024 12:39:20 +0200
From: Francois Dugast <francois.dugast@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/4] drm/xe: Fix xe_gsc.h
Message-ID: <Zkx52E4KmX7StVN5@fdugast-desk>
References: <20240521102828.668-1-michal.wajdeczko@intel.com>
 <20240521102828.668-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240521102828.668-3-michal.wajdeczko@intel.com>
Organization: Intel Corporation
X-ClientProxiedBy: DUZPR01CA0263.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b9::11) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|PH8PR11MB8064:EE_
X-MS-Office365-Filtering-Correlation-Id: 438a3a9e-319c-4ce2-fb0d-08dc79824847
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SWcnjR3UqYV/5aC1Mw84z+nofgp1yDH/dpvNb/c2+l69KZQpBVspZjT/pzrm?=
 =?us-ascii?Q?f1VqEMaqhyu8xYQK0xFB83RfLmgG2lyWQqTGwwsnCJiuAeXYQJF9p3p5kswV?=
 =?us-ascii?Q?jEIstaIKwFnM7hIRNMH/S6yO60jyiiJCTk8q1u1hBVBj/Knz41mXfj8wVfRq?=
 =?us-ascii?Q?/jMgmEDmKEHnc+8oc1LPP5DXBYEmr7axTS96zMycMD7tKl3C30v9E6R7TZ5f?=
 =?us-ascii?Q?nQXXGvaKnSp/ll3DfM8T4VoeTOMlGwbujhiOIuwBC25cLTkidPYvhQf1BS43?=
 =?us-ascii?Q?gYCZJjg8Z7g4f9t4X+XuGiu8y+5oz6HzZJszBLg0hIqkP7RXC5YTeAHpFAdc?=
 =?us-ascii?Q?Wa47NZS2CmxedEdFUUQgKBbwGp91pZeKfqDoXgr8RSuCeWAo7p+s4QR01ROT?=
 =?us-ascii?Q?dFW1hcujc+axUpnT8ffTQymWmlghBWzYo87RVlkGKuXBePLQRZPczvDRqDom?=
 =?us-ascii?Q?nplfOBCg0ZPakRXHYb/nJTM4OZcbJJ+VZK4ANZqOCr8oFkdYZ04Iabg5nzPF?=
 =?us-ascii?Q?o1+KTGZUNhYppiCVQqy8zLQ0d2WUqQXeBrIBlg+xew0RwJ3dHhAwqqZemPmk?=
 =?us-ascii?Q?d/vyGMGRwQf5W8Db/NkuoEHC35sXoX+Gz5LVvRRxQW1YupngDm4hwkyM/lY/?=
 =?us-ascii?Q?RPCGkoAcI625PESG+KGPGPononAsjqspWc8Lm0f098/SrRvHieC7QxGBUNfI?=
 =?us-ascii?Q?Axa5Zw0+KmlrmQi1axaUkU3rkhnORxxiaDGy81tWMc1gHOVWqzEEw71H/IAp?=
 =?us-ascii?Q?qzEE1w2dBMtdXpNbvuJ/Bq9pM+Swm/xmv5z5l9aQ9nDiGzITZP5mWlnx+K90?=
 =?us-ascii?Q?NGObmE2w+zRXDyskyh4Cyh4LxwlQMvTef8dFrvX9TH4Ii4I6/eQgG+7hmqIb?=
 =?us-ascii?Q?+zksCdcW/VyIM48+bUhhdJ2PrlMPbEStIHEZtQHhAlmhAqNYK6kNZq55CuzY?=
 =?us-ascii?Q?K2se4YLsMBOlWYoLtmRzauDsyy0VV7YCMIh1w/i5RBA3sNRJytUlZP6Y/nk6?=
 =?us-ascii?Q?msSaLm9w2b9QOOEn/750cZy+f8xTj4UOg4xvUPcAlrP30ZzuTonlngxqsaL1?=
 =?us-ascii?Q?ErWyOY13hisGj6ToLdG41dDG6gt56oW7AQ/gouBnJvs+zbdmBUT+kTuSK+sR?=
 =?us-ascii?Q?Y6iUYe+qU8vG5e9xGPlKKcw3xzHltlVPjBRZ8cXZzgLzZfurjcimR5Vx/f4f?=
 =?us-ascii?Q?NBmC3OFzUsi/zlNulLcB0a4+gSQXaFHXQQdabuB3bXppI5dsFxbHHoAi5QTZ?=
 =?us-ascii?Q?R45LJQVk02QGhQji5MAKa/QYOjwfNp54ZADzRJaSaQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WhkBHAWbuMNtUM5DLuTh7X/lI23gyG1qtTxweHaJ6Y9gBwcYCNdX80sDB67e?=
 =?us-ascii?Q?dYkErlZdj81cnP3kZn+H0HlCgOWbThhOWB/lMBjKMtRSdMFVh55b7J0JFvCZ?=
 =?us-ascii?Q?M5u14Sfk2NTnD3jAoPc7tJkeyKdwuqkuIlfbFRzy1kNEVxwZN09F1ln9XEAg?=
 =?us-ascii?Q?mWNxZ7EOrROpWqKR46ET0Xshckp3igEz7FBDoJ5cLNXJTkUDnD9d5ty7kdEQ?=
 =?us-ascii?Q?h00LIQcwm/GkvU/ajyaiq4/IMig8JxYpJek/nWtAyI3Z7bxNG28AJGwotihR?=
 =?us-ascii?Q?Po3pz5F004OYHsVvLPSeNQoI1yU3ZwH4AB7M1Xe2MVjCABJHSpWptnd/ZdPk?=
 =?us-ascii?Q?XqoTeHuOYdcFJheSgpJROQkllQPIjiP1miKWxuc3s7hqqADRioL6fmvE99Gd?=
 =?us-ascii?Q?qn/An+INT/OeG1ODOvU3jqWNWskxYcETJa3N+4ZsA7/7fnHr8AKwGuKmPOeS?=
 =?us-ascii?Q?oP8kQHK1aL3FZVLbLk3NgzBf3fNqsRajmiJ9Mw7IleDRUAkMChXsRRylNC3J?=
 =?us-ascii?Q?iLT0NNdXRyE7kpu95fKCn7wuER9F1e/M6TDTLiNWoNFdyFk1GEkMnez4wM6e?=
 =?us-ascii?Q?02dgxHRhfnHVcuA+bysAta0cX4L88AgDGOXp7AHEi1m1WKJkkD5vP5+/Sv/f?=
 =?us-ascii?Q?7YdO0wEV3bJtJpETINliYBfQrL7wn/avR4H6T6GqqJcQODnBengu0TLJzG0i?=
 =?us-ascii?Q?oVyw6MeNDSF9fM/YA+Xo21Wlspp7bHUav3Us/eGiO/rhWNRDMi4+Cg+NHS+R?=
 =?us-ascii?Q?7ZQ1CUwnWTT4JWNzqkAvR/T/HjHhsyFfDMivVbrV4SfgHdophj+cM5SyVXTb?=
 =?us-ascii?Q?ycQPnLT8tO1uUQ+GMX7HY03+vwMkN3iWTbAOyZmhr46KqAi6hLvPEwz9iRAM?=
 =?us-ascii?Q?9wB6hiE0ZAQ2JiVw483s6kj5QkK2yLz6HmOBN8AIkFCcmZCLflq5DVQZNEcR?=
 =?us-ascii?Q?cBuZAF/iuMYQ3rkYV/0qIHyHCTuDD2F0EtaYNcdFbQdW+mkk2ny5KdNdD4WL?=
 =?us-ascii?Q?fGao2pdoDW0ZwVARiPYZpJC4RpcK/83RjOyyDmIcCsRUbfPcC3CGqym/k7ML?=
 =?us-ascii?Q?ZGqbHrdgreS+kKDmnU/QHx88IclhvF1I9R1cYvSDGuSwFXFCStQuF21KCYtU?=
 =?us-ascii?Q?gc7kkL4xG0YcJTx5erGxXf53Q5sg+mfsqlxS/WWOgWe3NlHZCHKYk6SREgyU?=
 =?us-ascii?Q?lTUXcTnEpWHj+cSDHZDcAPmWo5PAQlVMmr6uE4IbUxXvzfu0Xoi2MiyN8De2?=
 =?us-ascii?Q?xkULHF08eroS4A4cbLboNzVtDzCkce0XQ0p8nIQ09Ae0JU6NQxLyYPSiZXiC?=
 =?us-ascii?Q?WyW5gQjXRJRhE7KF6T5YtnkKtcKEvb9ZZkk66Vv5Bq8qShPSbOVm25lga8tf?=
 =?us-ascii?Q?4jCV1cIYX8dd9olzwTEd9OBbet59uBFyNrdvVOIZJhkORB6ZmCPgvkM8+Q+Z?=
 =?us-ascii?Q?rGxieP88+SFCKh/Lq/+bGQOTOKhfdcVLjICieptlEI1DUZEckAT78MaWdxt8?=
 =?us-ascii?Q?J/NJKwvSKadhNKeR6WD+l0IUyRfKVOCapeomVc8zCkaXA2zYIV0sVRc6bBD8?=
 =?us-ascii?Q?mAmPqCb0mYacEhZlmSIpoy/xo+6/PFULsE0BRMUAHuXBHavwoOuena663aav?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 438a3a9e-319c-4ce2-fb0d-08dc79824847
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 10:39:24.5789 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BTaz2p3+EvaCTB8rmo4GeogOAWR0jxOwRnz1OkOmA1ZzDTY7GizrVhw9u02NHywI5Khzf8WpkRfAzK1ysqsQxCu74hnArdBnU87890RuoxI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8064
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

On Tue, May 21, 2024 at 12:28:26PM +0200, Michal Wajdeczko wrote:
> Prefer forward declaration over #include xe_gsc_types.h
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

Reviewed-by: Francois Dugast <francois.dugast@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gsc.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gsc.h b/drivers/gpu/drm/xe/xe_gsc.h
> index dd16e9b8b894..1c7a623faf11 100644
> --- a/drivers/gpu/drm/xe/xe_gsc.h
> +++ b/drivers/gpu/drm/xe/xe_gsc.h
> @@ -6,8 +6,9 @@
>  #ifndef _XE_GSC_H_
>  #define _XE_GSC_H_
>  
> -#include "xe_gsc_types.h"
> +#include <linux/types.h>
>  
> +struct xe_gsc;
>  struct xe_gt;
>  struct xe_hw_engine;
>  
> -- 
> 2.43.0
> 
