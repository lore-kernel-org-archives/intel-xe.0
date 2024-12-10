Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8932E7717F
	for <intel-xe@archiver.kernel.org>; Tue, 10 Dec 2024 22:42:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FC510E17B;
	Tue, 10 Dec 2024 22:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ezMAtfKp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC310E17B
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Dec 2024 22:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733870553; x=1765406553;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=4JHztUltXf5z0bg85TeCUzXX/klHDrKqUJD7gW823WE=;
 b=ezMAtfKpsg03f4b89POKt/EHo0xgou+rebYcsY2+W4Q9jqKiH0Jwits1
 a/5pYnBolrc/OpvraCWlgFy05aoEj8svTFlCZ9kZxP4L+7mnylJW6LeT/
 PNxjD9VOi8oNRyBK1Ov8b10IP9ELtinJNTRkmQnwa63vDh6c88K206qqO
 Z148Kxpp2iLCRqlM/wRirvC8KkHFzMQmgLW41p39JRxh7C93NJvxhFx9l
 2tbWUHO8AYdxsjSUx3vB7eZgAUb6+7UfW5kCLzTzBr79df4SD2zRGQkDu
 pCvPQWJLTaHJOia2KERz7kCk1eal8hvwfTsotOXpdmGynEV3QTbUtZt9O A==;
X-CSE-ConnectionGUID: PyUMWERuQ/ipOmNbiuegEg==
X-CSE-MsgGUID: edM7Tp0iQIGa9+LOUE9QvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="56714900"
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="56714900"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2024 14:42:33 -0800
X-CSE-ConnectionGUID: WLcfs5OTQJKSZm/KFP8nNw==
X-CSE-MsgGUID: xQjduDr9QPquvoObdUEswA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,223,1728975600"; d="scan'208";a="126378907"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Dec 2024 14:42:33 -0800
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 10 Dec 2024 14:42:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 10 Dec 2024 14:42:32 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 10 Dec 2024 14:42:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzfSZdNvfIu4ZCg7+YR1/ac2xCiOXrVREvsjqf70QGrSVFcdLWoquCCATnZJ1vPyrMvHJVwcXJcQKzgadOTZ/sxxO9XfIUX6rkMZzrRGRJYARxXsi8/SWqHFUgvxuswJWBbEaW01B+jhrOFV13DHlRdCwxZbbelLQjXRnDGAfXk0gwARFMMh7F+Xi6zPoLJeRMoII5Q6qwJM9h32B9O35AuYgwGgdG6h2X8s6p4PjRgtr2AWZ6RE7UArybR08rK/owB1USpiKKGSDGCi7ZRs1HDe7Lmj8qx10uGOzl26Z/YYSJbkm3usU1czlzQXdeHK37/DtO+yFXAt0C0pMD4wzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FLrjy0QL0C1Mloi/W5aWwF0pk47VffFNbuyDZo4ym+M=;
 b=HKJ8TucB3b/DRIga8upiXPbyyluDF687ujrGqXYoRb2h6ZgpAvAVapkGZJYAM00vcKivv7Ipt76zoDPM1DDRegkf+UEnYrUO9dJ9ZgaVOikd3D8NqENNwBgaZI2MTMtlKmTTvIynYh1p4i54eW91g2BD+l4WHL2RRjMyNe/JYlqtO8+a1hZzoXpWKGm20KJdkFe/oKtFZfrI+h+KemmYDQ0jLMeTArvh04J8vNognUybfTIC7dbXC7S0YAjlOIeL/A2hwOuW5Le5/Hl+Sid5pJjN9NMelz1kgxW2hp+l/iVr1YOqdFXfg1uEFUMv+GXfvltKHJo1C20gJv0Xi9oA4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8185.namprd11.prod.outlook.com (2603:10b6:610:159::12)
 by BY1PR11MB8005.namprd11.prod.outlook.com (2603:10b6:a03:523::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Tue, 10 Dec
 2024 22:41:48 +0000
Received: from CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb]) by CH3PR11MB8185.namprd11.prod.outlook.com
 ([fe80::1be5:55ed:3261:fefb%4]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 22:41:48 +0000
Date: Tue, 10 Dec 2024 14:41:45 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, John Harrison <john.c.harrison@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>, <ashutosh.dixit@intel.com>
Subject: Re: [PATCH v2 5/5] drm/xe: Apply whitelist to engine save-restore
Message-ID: <20241210224145.GX5725@mdroper-desk1.amr.corp.intel.com>
References: <20241209232739.147417-1-lucas.demarchi@intel.com>
 <20241209232739.147417-6-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241209232739.147417-6-lucas.demarchi@intel.com>
X-ClientProxiedBy: BY3PR10CA0018.namprd10.prod.outlook.com
 (2603:10b6:a03:255::23) To CH3PR11MB8185.namprd11.prod.outlook.com
 (2603:10b6:610:159::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8185:EE_|BY1PR11MB8005:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d310fc3-d52e-48c4-0ad0-08dd196bd4c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FNcFRmjf/37cfsS8Snh5CL9Ww1S66Nfl9OkfOr9dgnof2QbCTHp01bAszltl?=
 =?us-ascii?Q?o/SxmI9qZQDNpKeXBaksbR1kf80qOBmCh4E69ltBt2Y2TayAYTbnEBR3v63m?=
 =?us-ascii?Q?BLDVxm+w2jTrNWHw71ySyNCeWIih6xLevkQJzVUGHedNXXpLLr21QCfYBSdx?=
 =?us-ascii?Q?GfzVxdM8N9GbpDKH5c0LNrTIuyukgtdONlkzS+nFscUcZCTHE+Mzs+XV6ovX?=
 =?us-ascii?Q?vElNaDWTx8Ur8+lQoC92yhsgLFjaPdFeU9QQfQz3dAUjBk8ZFiduMYPHxhFA?=
 =?us-ascii?Q?zaoNAa9hlH2TIzumOcly4hXZtiYiqNlpOTYOguPynJyqOWnL9RjNrBw+dn+3?=
 =?us-ascii?Q?TM8/l1UY4JCxHwajk/cYQD5fc1PmsnlFvOT+eoFRTgY8Hecrx6v0hXh8hDoU?=
 =?us-ascii?Q?hDpaZaSZ7q7UrTxwxR5QIAmhioE/SeQy+4OOEdXOvWpv51qj3UzDPmpJ/9t3?=
 =?us-ascii?Q?rK7d+eGAXeRF00WuVINv4NnLdvIx6BrMemhBmyZF0C18M2QUhVQ59yrSsyuY?=
 =?us-ascii?Q?gr40WB33LwCTTNCAW79fkGzlUBosNZo5z9KgE99bh5a09aY3FQTG2735mfxK?=
 =?us-ascii?Q?KOKI3JFxPCjZ+bkW1qsp81Q6HXhwdXNpCaUj+9hv/LoGzqrk1VTG4eYIKGie?=
 =?us-ascii?Q?WJyUoTlyuEv7xw7qt8OoCDzsqn3I4rRyiozRjZ1O0kYSlPmI3ERYkEbPJw8U?=
 =?us-ascii?Q?7JXaNtPBRWWHHjGRIWDAxm/3u/0CX7YZcBTV10TsEUkyliW+JAQ2HXAwbH3o?=
 =?us-ascii?Q?oIMRpjz0bLirYokUS5X90RruUjmv2rNw6Hr7DMebvd9YfZ+LbWsr+b/FCYIy?=
 =?us-ascii?Q?SDtJOctuM7LCpVBy44xU7+FMh28irS2W9qhN0NuW4n5p2OhILeCpw8URZGwL?=
 =?us-ascii?Q?v5AeSqcxoBPyV30RQdCRJoZNJY1PpN/ZEROCWZAPIPh9cpKYtaoTvf7bjhyL?=
 =?us-ascii?Q?1p5U+MpzgOST1VbJFtOmZgUHjVof8Ciqrp8IJm5Hm4XUyTfP9xoHCxS0Fp2a?=
 =?us-ascii?Q?n/kp8TfNTBkxH0VE7Wsh5zZvGPTlpGW7CvwLX7SYWE8w3+SXF6oQT82eBu0N?=
 =?us-ascii?Q?R/AHp75XUGQptavnT4vlnRFXIKWpYnqoBpqYcaHo3oCH0VPJMoWc3qTl8Lrq?=
 =?us-ascii?Q?MF8S0aaRoiBt2m7mDrEHHjOaSYVedtQ06G3XP3d35vKZSGttKdRz98rirXDr?=
 =?us-ascii?Q?nakzqKn4NZSKCE7WbCu01gNnXqyAT7gHrGXauoBmK7y6sy1NjhJGBmoHLOb6?=
 =?us-ascii?Q?PEiJ605fDc7Uy/FqbR6uDJFsoLxTygCGD6AFRdlB8rcM5EsX4amMyRKxCGFI?=
 =?us-ascii?Q?7Nmj6eN7k5RBJAHzCSchqJyYjqYpE33xUyuHUfpzJtIe2w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8185.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C7OjfrF5KcsIw6kUYfT8OS6mRXBycsZ75q/yMR7shiXGipyIVvUvbElADdb5?=
 =?us-ascii?Q?c+/jdp/J6VC89ut2lN8y2Yt2rZt/VZrFpvHuN2pw52izs8wRJuSXHJhv8oyA?=
 =?us-ascii?Q?dAArrwmmbDoNiFGC4D4C7hmP3o655SVosUf6GoRT3SimW9FBsD17M9zqXzdH?=
 =?us-ascii?Q?S1m23mG5HRlsmCy0NIENyC4gaJ2rBxhz8JAGEEUjvU+pDQm8JxYiyoedkQtS?=
 =?us-ascii?Q?Eb1ZuC13QRNpSWPHDSklITGKPMJLLx7RkQ5vUymIXOsTDwyk3sHlO4dSaP4G?=
 =?us-ascii?Q?VV5Oqd3dkSFdGQNBBWsCzg+MlI1yzcOvqRq10YCrJmKmBanIO739FgnKrRmX?=
 =?us-ascii?Q?ViSB6jqm2nAT5YQ87G41GC4PeoQANSL6w/9TokC3O27w51eW5ckw4P+0hxsY?=
 =?us-ascii?Q?12pjQiUxLZXHehRDB05fEkxRbR3TTG+hM5uw8Ql359EvPuBanz/i1Cj2z8oU?=
 =?us-ascii?Q?GTJCO9I8UT7QOWddnI1q8AHwa1XKFjfLtY/v0lNYaYZyl1AF8Cf8EVxxVyLG?=
 =?us-ascii?Q?M1aQ5aVznHlnvLpGm9DltGupzH1azjJUrDvv9tY9/CpnCc/G5fO2W3UlOhZL?=
 =?us-ascii?Q?Nxmj7ZhgOLTLWMdklbi/rXxzR4dVgzloOGtintMroOh3yMVJHBs0WpBE5bqG?=
 =?us-ascii?Q?uhGKiQFmA7Axw9IdqrPwlIIH32VdCAO0PgTPhktabDyIU2Wg0OFu0xtl2h/G?=
 =?us-ascii?Q?NjJTnYwUsNwHyKt5dDBtcLCsybHZzz3udaS1PHX2fjww0E8VPmc+k3LJtchi?=
 =?us-ascii?Q?OombCZmIDEgq1Mn6x3neC/vo+Ir3E+Pkp0RyWKuYvsLaY60HJ7khxDcXHOln?=
 =?us-ascii?Q?uRrsru8TTOhIO1KfmfcSING1xydgyDIvkSLDnWKFeMG4KgNIxpVz/uZZd9Bn?=
 =?us-ascii?Q?1K6LSJhjijAtMWzD+RnzZqoffN6Qvpd2H6L0sQX1KUMvePqTwEugnrkQl9jP?=
 =?us-ascii?Q?3YkTczA/plV/Sl2gJvqCYOjfSoy9vT9PnG+mb8ViSbr7fx1i0ZJrIj+6jrl1?=
 =?us-ascii?Q?13jG3LuqkMoiSzkPxS6LpwAwR+5JUYTrk0w1dXRApAtfboezVavk6UevRzil?=
 =?us-ascii?Q?VRvTOVDa+i43cFJk1eS0ozhcjmZK4s2FRr6PDaNtp63Ellx/oubo83TQtdOb?=
 =?us-ascii?Q?vdFI+YNOBSVNLqvPz7aFy/ZeWELO/PJVDuJjiW5Gbd1h6zWt72GQZbmlsdd3?=
 =?us-ascii?Q?MbpJJXkXT+370FnfIN0I8FGsYr6D8Rzx1ZI+cuqzmffj3JJsQOvUoY/ngrr4?=
 =?us-ascii?Q?dBVSIT/yOnMDX2ufyEUqBbI9iFzNmIVNgq5XZWASJh/d2Skl3o35b5GayNW4?=
 =?us-ascii?Q?TMwmUL0a7wLXG1t50jMdh/AOQSBydQ33GTk1VGMfRs2RVKgq2uteKt7biniI?=
 =?us-ascii?Q?u3LBv2BxQENfO0YLJ7Rg1KwMGDeO7u3hsrjefhldhuPsQsIDUDF+lFhltfDe?=
 =?us-ascii?Q?zu+BUwDetH5WrhXOGB78eZ7GIwa5t1KUX6te9b9JFeMLkaToDfVakxYjgIkL?=
 =?us-ascii?Q?kyDWgGTPrl0UkU8xdBokzSsccndItR0TvaqsYJ3BziuhEl+bMhtbWqBMfJvw?=
 =?us-ascii?Q?RKJHNyHiriYIaj8aEfoxVz1oAlMh/A6aHftv+Xa4/RnDQc2GILSvTOLp9S7L?=
 =?us-ascii?Q?eg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d310fc3-d52e-48c4-0ad0-08dd196bd4c5
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8185.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 22:41:48.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SURcA/gwJzMGcJkA3VNnYK7+82wrEXg0UK5daAolymAFPzUAnM4e52J3qB7zQcfIA43BKJepnmDXY8ezkvlgNAKnjpsymRiUalkC/RxBDbE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8005
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

On Mon, Dec 09, 2024 at 03:27:39PM -0800, Lucas De Marchi wrote:
> Instead of handling the whitelist directly in the GuC ADS
> initialization, make it follow the same logic as other engine registers
> that are save-restored. Main benefit is that then the SW tracking then
> shows it in debugfs and there's no risk of an engine workaround to write
> to the same nopriv register that is being passed directly to GuC.
> 
> This means that xe_reg_whitelist_process_engine() only has to process
> the RTP and convert them to entries for the hwe.  With that all the
> registers should be covered by xe_reg_sr_apply_mmio() to write to the HW
> and there's no special handling in GuC ADS to also add these registers
> to the list of registers that is passed to GuC.
> 
> Example for DG2:
> 
> 	# cat  /sys/kernel/debug/dri/0000\:03\:00.0/gt0/register-save-restore
> 	...
> 	Engine
> 	rcs0
> 		...
> 		REG[0x24d0] clr=0xffffffff set=0x1000dafc masked=no mcr=no
> 		REG[0x24d4] clr=0xffffffff set=0x1000db01 masked=no mcr=no
> 		REG[0x24d8] clr=0xffffffff set=0x0000db1c masked=no mcr=no
> 	...
> 	Whitelist
> 	rcs0
> 		REG[0xdafc-0xdaff]: allow read access
> 		REG[0xdb00-0xdb1f]: allow read access
> 		REG[0xdb1c-0xdb1f]: allow rw access
> 
> v2:
>   - Use ~0u for clr bits so it's just a write (Matt Roper)
>   - Simplify helpers now that unused slots are not written
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_gt.c            |  4 +--
>  drivers/gpu/drm/xe/xe_guc_ads.c       |  7 -----
>  drivers/gpu/drm/xe/xe_hw_engine.c     |  1 -
>  drivers/gpu/drm/xe/xe_reg_sr.c        | 45 ---------------------------
>  drivers/gpu/drm/xe/xe_reg_whitelist.c | 37 ++++++++++++++++++++++
>  5 files changed, 38 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index d6744be01a687..41ab7fbebc193 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -748,10 +748,8 @@ static int do_gt_restart(struct xe_gt *gt)
>  	if (err)
>  		return err;
>  
> -	for_each_hw_engine(hwe, gt, id) {
> +	for_each_hw_engine(hwe, gt, id)
>  		xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -		xe_reg_sr_apply_whitelist(hwe);
> -	}
>  
>  	/* Get CCS mode in sync between sw/hw */
>  	xe_gt_apply_ccs_mode(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index b0afb89d9d90c..943146e5b460d 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -243,8 +243,6 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>  		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>  			count++;
>  
> -	count += RING_MAX_NONPRIV_SLOTS * XE_NUM_HW_ENGINES;
> -
>  	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>  
>  	if (XE_WA(gt, 1607983814))
> @@ -729,11 +727,6 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  	xa_for_each(&hwe->reg_sr.xa, idx, entry)
>  		guc_mmio_regset_write_one(ads, regset_map, entry->reg, count++);
>  
> -	for (i = 0; i < RING_MAX_NONPRIV_SLOTS; i++)
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  RING_FORCE_TO_NONPRIV(hwe->mmio_base, i),
> -					  count++);
> -
>  	for (e = extra_regs; e < extra_regs + ARRAY_SIZE(extra_regs); e++) {
>  		if (e->skip)
>  			continue;
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index c4b0dc3be39c3..b193667441488 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -574,7 +574,6 @@ static int hw_engine_init(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_gt_assert(gt, gt->info.engine_mask & BIT(id));
>  
>  	xe_reg_sr_apply_mmio(&hwe->reg_sr, gt);
> -	xe_reg_sr_apply_whitelist(hwe);
>  
>  	hwe->hwsp = xe_managed_bo_create_pin_map(xe, tile, SZ_4K,
>  						 XE_BO_FLAG_VRAM_IF_DGFX(tile) |
> diff --git a/drivers/gpu/drm/xe/xe_reg_sr.c b/drivers/gpu/drm/xe/xe_reg_sr.c
> index 0a5c0e62d6e88..9475e3f749580 100644
> --- a/drivers/gpu/drm/xe/xe_reg_sr.c
> +++ b/drivers/gpu/drm/xe/xe_reg_sr.c
> @@ -24,7 +24,6 @@
>  #include "xe_hw_engine_types.h"
>  #include "xe_macros.h"
>  #include "xe_mmio.h"
> -#include "xe_reg_whitelist.h"
>  #include "xe_rtp_types.h"
>  
>  static void reg_sr_fini(struct drm_device *drm, void *arg)
> @@ -192,50 +191,6 @@ void xe_reg_sr_apply_mmio(struct xe_reg_sr *sr, struct xe_gt *gt)
>  	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
>  }
>  
> -void xe_reg_sr_apply_whitelist(struct xe_hw_engine *hwe)
> -{
> -	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> -	struct xe_gt *gt = hwe->gt;
> -	struct xe_reg_sr_entry *entry;
> -	struct drm_printer p;
> -	u32 mmio_base = hwe->mmio_base;
> -	unsigned long reg;
> -	unsigned int slot = 0;
> -	unsigned int fw_ref;
> -
> -	if (xa_empty(&sr->xa))
> -		return;
> -
> -	xe_gt_dbg(gt, "Whitelisting %s registers\n", sr->name);
> -
> -	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> -	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
> -		goto err_force_wake;
> -
> -	p = xe_gt_dbg_printer(gt);
> -	xa_for_each(&sr->xa, reg, entry) {
> -		if (slot == RING_MAX_NONPRIV_SLOTS) {
> -			xe_gt_err(gt,
> -				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> -				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> -			break;
> -		}
> -
> -		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> -		xe_mmio_write32(&gt->mmio, RING_FORCE_TO_NONPRIV(mmio_base, slot),
> -				reg | entry->set_bits);
> -		slot++;
> -	}
> -
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -
> -	return;
> -
> -err_force_wake:
> -	xe_force_wake_put(gt_to_fw(gt), fw_ref);
> -	xe_gt_err(gt, "Failed to apply, err=-ETIMEDOUT\n");
> -}
> -
>  /**
>   * xe_reg_sr_dump - print all save/restore entries
>   * @sr: Save/restore entries
> diff --git a/drivers/gpu/drm/xe/xe_reg_whitelist.c b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> index 3996934974fa0..edab5d4e3ba5e 100644
> --- a/drivers/gpu/drm/xe/xe_reg_whitelist.c
> +++ b/drivers/gpu/drm/xe/xe_reg_whitelist.c
> @@ -10,7 +10,9 @@
>  #include "regs/xe_oa_regs.h"
>  #include "regs/xe_regs.h"
>  #include "xe_gt_types.h"
> +#include "xe_gt_printk.h"
>  #include "xe_platform_types.h"
> +#include "xe_reg_sr.h"
>  #include "xe_rtp.h"
>  #include "xe_step.h"
>  
> @@ -89,6 +91,40 @@ static const struct xe_rtp_entry_sr register_whitelist[] = {
>  	{}
>  };
>  
> +static void whitelist_apply_to_hwe(struct xe_hw_engine *hwe)
> +{
> +	struct xe_reg_sr *sr = &hwe->reg_whitelist;
> +	struct xe_reg_sr_entry *entry;
> +	struct drm_printer p;
> +	unsigned long reg;
> +	unsigned int slot;
> +
> +	xe_gt_dbg(hwe->gt, "Add %s whitelist to engine\n", sr->name);
> +	p = xe_gt_dbg_printer(hwe->gt);
> +
> +	slot = 0;
> +	xa_for_each(&sr->xa, reg, entry) {
> +		struct xe_reg_sr_entry hwe_entry = {
> +			.reg = RING_FORCE_TO_NONPRIV(hwe->mmio_base, slot),
> +			.set_bits = entry->reg.addr | entry->set_bits,
> +			.clr_bits = ~0u,
> +			.read_mask = entry->read_mask,
> +		};
> +
> +		if (slot == RING_MAX_NONPRIV_SLOTS) {
> +			xe_gt_err(hwe->gt,
> +				  "hwe %s: maximum register whitelist slots (%d) reached, refusing to add more\n",
> +				  hwe->name, RING_MAX_NONPRIV_SLOTS);
> +			break;
> +		}
> +
> +		xe_reg_whitelist_print_entry(&p, 0, reg, entry);
> +		xe_reg_sr_add(&hwe->reg_sr, &hwe_entry, hwe->gt);
> +
> +		slot++;
> +	}
> +}
> +
>  /**
>   * xe_reg_whitelist_process_engine - process table of registers to whitelist
>   * @hwe: engine instance to process whitelist for
> @@ -102,6 +138,7 @@ void xe_reg_whitelist_process_engine(struct xe_hw_engine *hwe)
>  	struct xe_rtp_process_ctx ctx = XE_RTP_PROCESS_CTX_INITIALIZER(hwe);
>  
>  	xe_rtp_process_to_sr(&ctx, register_whitelist, &hwe->reg_whitelist);
> +	whitelist_apply_to_hwe(hwe);
>  }
>  
>  /**
> -- 
> 2.47.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
