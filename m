Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8288BC0218F
	for <intel-xe@archiver.kernel.org>; Sat,  1 Feb 2025 02:54:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAE1F10E062;
	Sat,  1 Feb 2025 02:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QBXUzjYD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C62910E062
 for <intel-xe@lists.freedesktop.org>; Sat,  1 Feb 2025 02:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738378442; x=1769914442;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=7aG20e6YX1mleOL/HDTpYNHwUfCKkhVc1VOBR3NU+jg=;
 b=QBXUzjYDsWHniAebZfV1NDzZFH2+/8rd+4S/q1MEEK+bEG8zxdHAqt+o
 rVwr8a2fsQ1EImOxlGsCSL/f5qC5u0Yzi3fdZQvTTtcc4WbcNjQsiMZMW
 hHBbIIfiGjvic6+So2TTFQgf3ltjJKzCDqmQyi8gRYpDeHcoVXK5BDuOX
 ZUQfWoMMCRyYTqtjPZ32+hfljLcZ4z8ZEjxYHhK6nlt4uVlg1p1qRGJDW
 4aB8m7B+1BjMOKNSOzrJWfLCq5/8UD4rKoWI41tcl5bRybULmrA22vMii
 Sl59a9+vlq6rVPQBijZMQ0OGrUzZrOH4G9hFpmJKLdW5y4o9D5jEbXXcU g==;
X-CSE-ConnectionGUID: fvMBpjHCSaqzSn/CLgUMlw==
X-CSE-MsgGUID: 5PgG7viZTtmfDzXR3rVPog==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="49945264"
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="49945264"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jan 2025 18:54:02 -0800
X-CSE-ConnectionGUID: oBGOHo1UQIiuv7EKTU/vGQ==
X-CSE-MsgGUID: yVz0EMPjQUi2umT9KjJcpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,250,1732608000"; d="scan'208";a="109566495"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Jan 2025 18:54:02 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 31 Jan 2025 18:54:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 31 Jan 2025 18:54:01 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 31 Jan 2025 18:54:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3pHkKQWauIM2DKXLsoImTF1JndHJU5KRa+F0nTJytyNiv/dANQm7b41gF78B9/fwZePZwuyPMcRY+DFP7sxwIGV5w+AC6tPUhGzl/lJvTcLU/zv5riFxTpN0T9yGILcqFCKFaCO6W0sRCH1wHUUKULkkvc5DozFUis7M9VpA0tv6R2KExbSRM0ExkD/E3gusj2XDP+YCqkDlLN+4jdjHZ6tDa+ShNCOUOnis7v/DtcI/jOQDMYNks2ccr3IOoR6epFhFkUQr9x7XkvLioJ4ZKe7XgfvEEcja9RaZrBxOFyUfyh13DSbL3ayt9t4NJgXpjjnPdHV5bMJPcSqxlfRXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OYV8SOFoF2tI7ebO/y5VvxqMu8d6OPA0q7dDF3vTKEc=;
 b=RK1UbEOGVmFoTOjlhG+/JLAJV9FS32PcyergMeVwlh5lIhEvAmGtcd77VJB4ug1PyTOpkclYIVYWk0q6iiM6xOFd8kGwdJ01XVLZ39dEzn8dlFYcGkNQeTF0xzE2npKqzvRyF4eteyiWCh0qevIO3ac9/GjGb4EdCtC6CpgS8FdNhnl8zGJuPhYyqqa4Ccg1dy3bssjPRq/oFiHc5rsfbLTt0N2Xx2YhDwbE4Cw442gJ0m9pjUibD5Vn2bpbtTodqGhw4/dw+QwN+0MR/q8aO8063OjKFrL204TmAEm7E215PcPW84gimU1QUwUtXHZTYryDEqpMSjw8mQQqtsD5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB7986.namprd11.prod.outlook.com (2603:10b6:510:241::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Sat, 1 Feb
 2025 02:53:57 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8398.018; Sat, 1 Feb 2025
 02:53:56 +0000
Date: Fri, 31 Jan 2025 20:53:55 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>,
 <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <soham.purkait@intel.com>, Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 7/8] drm/xe/xe_pmu: Add pmu support for per-function
 engine activity stats
Message-ID: <lr2zu67lxbnf3dqvpfutw7w6cmeiphziagpnpu4bbzv2skxy2m@bx4q6egwrfow>
References: <20250129101653.1976699-1-riana.tauro@intel.com>
 <20250129101653.1976699-8-riana.tauro@intel.com>
 <fvycaneavttc4bj2ue22oa4tguepz7dtyr3stmibs3pd7yeofe@s7dzrdswg6kv>
 <Z513K1oUUOcpFwy8@orsosgc001>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <Z513K1oUUOcpFwy8@orsosgc001>
X-ClientProxiedBy: MW4P222CA0029.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:303:114::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae7b217-aa8e-417b-1f93-08dd426baba9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KWZtgnE34nuyrF5BMbnBRUVRLbNE9nbv8hw1z+rMcLJ5VFZI85V1iRYmrSNy?=
 =?us-ascii?Q?YdhvlBqGmKvtaI3Oc+lAibSIMCyUrv5opNEOms4N9KbaksciGG/EiUGuLHya?=
 =?us-ascii?Q?dZLraTRLdTfa1IWrDRYDf5fYdN/ESlPkMgn4dSZn5N7EyFqHUBBBGaWy+d6A?=
 =?us-ascii?Q?uCFc9Ea9EurpdhUIHaMuwRTmPtDEzz0VZgglaDMm2OPee4+wgPcBEJRsatxx?=
 =?us-ascii?Q?oZdCK3FRfb5UHn2hHMwkNgnNh4mxR09rbO5zzmXQMDCxgtpFo6JvuK69C83r?=
 =?us-ascii?Q?m3M8j6c/Bgf2HFElw1Qm+bB3nxxr8ox5+FdhVPOm3qhUnsTaLPiijL8+sLx9?=
 =?us-ascii?Q?WzKYuHl5pLtE7U1hzfxEvXSN3NXop+U8th2WLbg8anO12A0wV6nQhEACvlLl?=
 =?us-ascii?Q?Al3xtxycRr/wxRLIompiC+fWfIsp164wteDBfaf9Ctsl5yYrkr4zfIhdA0n7?=
 =?us-ascii?Q?CvHSXl0N9GolOBJyWJuUvOhN4bQ4WCeV80tBYzx2CmHxhnoWboJdW0FYtBXa?=
 =?us-ascii?Q?qPkxfoD9YMuIAAfNUV3wXHtCDlQIoDmxzIeu0cV8DZZ6Z3rQ40jHMI3Td/tW?=
 =?us-ascii?Q?BhJRmTF7e5g3SWLJ5pRL5h+j7vPsQK7npqGPhB9ZCKbjbxvWSBrW1QgudR6r?=
 =?us-ascii?Q?lhpkRqelVXU+aLz+tQRx2wYg+kwCBv1xCGne0fVXa4aLjeL8vTn64956lwVF?=
 =?us-ascii?Q?fCCzu5Ru10x176q6bY/xvw6FSiMrRWcFt5QurFE5++f+JElS5ehaj5N2OjRL?=
 =?us-ascii?Q?QY8IQZrBlFGJYoZ8HDMFtzO98gn+SRm3z4jBeMwce8Shk0Bgp+Cqm73lrft9?=
 =?us-ascii?Q?/dp+APC0CGqpf3jbV5fPLefL5sOw7+AZPMOYFeoRnjehTIrYFC28HVIhCgvk?=
 =?us-ascii?Q?Ctn18bwlgnhR4wJLsBXzJbNcgNAkew2Zie3tS8p2rk142bQuRCpDndNOd7R4?=
 =?us-ascii?Q?+1TluFjBp0uN1vA6mANBuFMOd/TFtKg6VEhTRSmmA2Bg3Xn7LXH6uWh4cHhk?=
 =?us-ascii?Q?/XJYyeIt8xLbOmY+Ql6LIbR80Y6NaYkENO6szR8qTm4XER2SvKw6lQWLhHXp?=
 =?us-ascii?Q?gBDk3vYNi/Mk/SckTfvngF2PoYmfYkGbYAHdMgf3aYD18KgZDv/hzqHji/gp?=
 =?us-ascii?Q?FVQ8WEqZP55bP5gJZlIvODmMU0T9XEpb3PV9LwysdoMt39PSUJ3ErvLF6Zcz?=
 =?us-ascii?Q?JDHGGyxhG1I+/IlI6etSAgfgN+IPU/spkWyHAV4EmRBDurluSxchrGgTaeD7?=
 =?us-ascii?Q?4vBozf2FPXyOPx4wlYnEWig8eArpxhzBKNt4LD451EIgOuTChyrn5zg6WOqO?=
 =?us-ascii?Q?82B5yPVd9K/NyPt6U/SsS9Neh3LW/0+PKWui7zTjo7NPaOVsAC/7vfwkqyZU?=
 =?us-ascii?Q?gafS64Ibtl1m3K3gkVINQiRsvZyc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VvmMnaJ8bGfcPNbuWnTiV8/ePF7xXR8g/h2rkiGDkHV+bTAU13rcZLhcZ1Kn?=
 =?us-ascii?Q?GeqPq+QIPlAkvpBQptGSkLzevpBnmUxHofBUnJLfL7ewEzwTW+BPlyh0rNUa?=
 =?us-ascii?Q?tJ8I1yd8nSL0tAvSAfuUrwGuO1ogYGKKDjaX/SslRxnXoXNqR8zbSjFiMD/h?=
 =?us-ascii?Q?uodhm8CnTcNVbeEYSBsoKWMCeEA2GXzmT2flFxZjk4eAfu8cUKLc3XWu7wrh?=
 =?us-ascii?Q?1OiUPpK8sFHI46/+UaNmjdVZnV7TBmgxcb5+VTF6Hllw433UXy2yudsxKeoJ?=
 =?us-ascii?Q?AhBNNct2r8Ljw6sNXrF7l2NkHsm41PH7lk/RxkU06n36zJkN6r03Mpp7UacT?=
 =?us-ascii?Q?phf1wLHa2qOol9JWT7PRq75snLza4W3oX8G3CselpdbYH6cyPWDIaVsV6O1j?=
 =?us-ascii?Q?XuU1nSOQ1lhrShKfmYXJdfF/YBBzoqXhisD9F07Vo+f5FnwWwl8n8hTr86nP?=
 =?us-ascii?Q?LLs1GdhyoUTL4M5A/HfhU+JSSnzYJxYgmj88HJRS7JFKno4PuPSQzLI/7yy/?=
 =?us-ascii?Q?DLj3XIK0nQfZC1MqZNKJOSRSXF6HPbYYBESZnnw3qhdzM2/nyGo5qVY8Iv8O?=
 =?us-ascii?Q?35MiArMrrcdCTxqmqDH73e1JCqcSRHcN0tJf8UnExGT0g5pOohwhcQ0tK+1D?=
 =?us-ascii?Q?nn2NIdUtwhTznW+LTFK9FM0u949fSG+9oq4cOgQJie2+ts5H+22DH1gA0biy?=
 =?us-ascii?Q?d601+BUoOGRZ6QrmenGWL+xUpXO71okYrDQ45XqYI+bMZdlG91KfTpX0id6F?=
 =?us-ascii?Q?e3ubYsi+fWe5fnqqD28yTdhIYUUckXlbT5f7gMz9CxT00+aAP/rd87WOpPgJ?=
 =?us-ascii?Q?S7gQJ1p01lBdLoZN71J3sgAznFkLy5V1bAK8Aav6713R+jS1ptzjOe3nCK6g?=
 =?us-ascii?Q?6zoLf8BvaO8FCOpIEUoBL7cGJ3PBO+Qyslk3HOQV+g0ZRQyDFN4p90UBl44e?=
 =?us-ascii?Q?+NPsjPdpjbKNpBKJOG6T5g8Qf4C+iF4OlsRKuDZ+nZFdhnPzL2QYCLvfHfLB?=
 =?us-ascii?Q?zDNBN+LoLHowV6K8u5CWl09c320AoFQuPLcSsNzv15H+hPC7IZNdXwpPVADB?=
 =?us-ascii?Q?7eG/JxC6CE9o3AU3kUW0LYcIgtNE64NCZ77fqXajkfK4eY7sJxKaigFhMF+C?=
 =?us-ascii?Q?GtAiY5K+dEaUNIEejcMa+/PLAfhEZ5xc1iVPW0QtksYqWk/awD68XGj/7ffe?=
 =?us-ascii?Q?IykZ55mvj7LZ2W8cDbFFsdjLUjyPmpK3g+NCUORMWiKmDRpiZ186p2SJPK/0?=
 =?us-ascii?Q?yGjTSh6rcTHRryrJTnqYjSEuyoOOu+a+6DJENa8kMhAmonf0kygAoBs7vO0y?=
 =?us-ascii?Q?/kQR+QAs82J34SO/Z/WBzzwQYZe2eraCnPaPhtK6MM+PtGQ8wq9cOYZ6UMr8?=
 =?us-ascii?Q?/KOTBFvDFN62l1HhxL2adwOlmJFgk269XJiv7jc4CjC2I1trHUQ7k7W+agcQ?=
 =?us-ascii?Q?WffKKw834WKwzH+BmUPntjj7pVfokPLYf1nuRBEXBTHbmAy2gHT2Wm/dRry6?=
 =?us-ascii?Q?AMtAYororfumYhP/KDQbuAeutt+5jA3F+W640ltQ/1Sfb4mRxfk+z/K5KRD2?=
 =?us-ascii?Q?pQ4QbLLTLVVVtWlqql9BCrMnYTRp2XtgTyQR8DDLiytYewMz4qkUpc4PlElr?=
 =?us-ascii?Q?Vg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae7b217-aa8e-417b-1f93-08dd426baba9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2025 02:53:56.7978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lJ1cjrtOWFe5QS71HEwKXNOxWCKv/xJIa0+ybjvXI8sEsXGoDP4eoTsncjhmHXlJBtbuEXLo53TMuIj7Rq/i+icfFQwDmTS1K5MOZp37ic0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7986
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

On Fri, Jan 31, 2025 at 05:21:47PM -0800, Umesh Nerlige Ramappa wrote:
>On Fri, Jan 31, 2025 at 06:23:05PM -0600, Lucas De Marchi wrote:
>>On Wed, Jan 29, 2025 at 03:46:50PM +0530, Riana Tauro wrote:
>>>Add pmu support for per-function per-engine-class engine activity
>>>stats.
>>>
>>>per-function per-engine-class activity is enabled when num_vfs
>>>are set. If num_vfs is set to 2, then the applicable function ids
>>>are
>>>
>>>0 - Global per-engine-class activity
>>>1 - PF per-engine-class activity
>>>2,3 - per-VF per-engine-class activity from PF
>>
>>IMO that's super confusing. The pci function is already part of the
>>pmu name and hence event source:
>>
>>	/sys/bus/event_source/devices/xe_0000_00_02.0
>>					 function --^
>>
>>in a pf/vf scenario, what's the point of the global one?
>
>From a use case perspective, it should be possible to add up the 
>utilizations across the pf/vf to get the global one. We are exposing 
>the global one because
>
>1) We get that info from GuC anyways
>2) Backwards compatible with tools that implement Native only support
>
>I am open to dropping it though since I am not sure how tools will 
>consume this from Xe KMD.
>
>>Also is it monitoring per-vf, all vfs or what? The interface looks
>>confusing.
>
>From a PF, KMD has the capability to monitor (1) Global = PF and all 
>VFs, (2) PF only and (3) specific VF.
>
>w.r.t the interface:
>
>I forget what was decided (if at all) on how to expose the individual 
>PF and VF values. Did we plan on going ahead and creating a separate 
>PMU event source (and PMU device) for each. In that case, this should 
>be:

not for the common case, which is the driver attached to the VF is
actually running inside a VM. Remeber that there's no driver for the
global one - there's only the PF driver and the VF drivers.

If the host needs to monitor the utilization by the VF, then maybe we
can use a bitmask to specify the functions, but I'm not sure.

>
>/sys/bus/event_source/devices/xe_0000_00_02.0 (Global) (should return 
>the same counts on Native as well as SRIOV)
>
>/sys/bus/event_source/devices/xe_pf_0000_00_02.0 (PF monitoring PF)
>/sys/bus/event_source/devices/xe_pf_0000_00_02.1 (PF monitoring VF1)
>/sys/bus/event_source/devices/xe_pf_0000_00_02.2 (PF monitoring VF2)

that won't work... as per above, there's only one pmu driver, unless you
are attaching a vf driver on the same host, which is done only for test
purposes, not for a real case scenario.

>
>If in future a VF will be able to monitor it's own activity, it should 
>be
>
>/sys/bus/event_source/devices/xe_0000_00_02.1 (VF1 monitoring it's own 
>activity)
>
>If we do that, then vf index parameter can be dropped. TBH, I like the 
>current interface where vf index is being passed in config, but open 
>to other ideas.

maybe we only need to clarify the names and the global vs pf
distinction. Let's bring Michal to the discussion and clarify the
usages. I'd prefer to start these counters without the VF part, but in a
way that it can be extended for when we add it.

Lucas De Marchi

>
>Thanks,
>Umesh
>
>
>>
>>
>>>
>>>This can be read from perf tool as shown below
>>>
>>>./perf stat -e xe_<bdf>/engine-active-ticks,gt=0,engine_class=0,
>>>			 engine_instance=0,function=1/ -I 1000
>>>
>>>Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_pmu.c | 45 ++++++++++++++++++++++++++++++-------
>>>1 file changed, 37 insertions(+), 8 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>>>index 15e9a57aa429..2968fc9a358c 100644
>>>--- a/drivers/gpu/drm/xe/xe_pmu.c
>>>+++ b/drivers/gpu/drm/xe/xe_pmu.c
>>>@@ -12,6 +12,7 @@
>>>#include "xe_hw_engine.h"
>>>#include "xe_pm.h"
>>>#include "xe_pmu.h"
>>>+#include "xe_sriov_pf_helpers.h"
>>>
>>>/**
>>>* DOC: Xe PMU (Performance Monitoring Unit)
>>>@@ -29,15 +30,21 @@
>>>*
>>>*        60        56        52        48        44        40        36        32
>>>* | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>>>- *   [ gt ]
>>>+ *   [ gt ]    [             function              ]
>>>*
>>>*        28        24        20        16        12         8         4         0
>>>* | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - | - - - - |
>>>*            [   engine_class  ] [ engine_instance ] [         event             ]
>>
>>I usually like ascii art, but I'm not sure this buys us anything
>>compared to the GENMASKs below, particularly because they don't apply to
>>all events and they are **not** set in stone. Userspace is supposed to
>>read from sysfs what are the bits correspond to each parameter.
>>
>>Lucas De Marchi
>>
>>>*
>>>- * engine_class and engine_instance bits will be applicable for
>>>+ * function, engine_class and engine_instance bits will be applicable for
>>>* per-engine-class activity events (engine-active-ticks, engine-total-ticks)
>>>*
>>>+ * Function id applicable for per-engine-class activity
>>>+ *
>>>+ * 0 - global per-engine-class activity
>>>+ * 1 - PF per-engine-class activity
>>>+ * 2 .. (num_vfs + 1) - per-VF per-engine-class activity from PF
>>>+ *
>>>* The standard perf tool can be used to grep for a certain event as well.
>>>* Example:
>>>*
>>>@@ -49,6 +56,7 @@
>>>*/
>>>
>>>#define XE_PMU_EVENT_GT_MASK			GENMASK_ULL(63, 60)
>>>+#define XE_PMU_EVENT_FUNCTION_MASK		GENMASK_ULL(59, 44)
>>>#define XE_PMU_EVENT_ENGINE_CLASS_MASK		GENMASK_ULL(27, 20)
>>>#define XE_PMU_EVENT_ENGINE_INSTANCE_MASK	GENMASK_ULL(19, 12)
>>>#define XE_PMU_EVENT_ID_MASK			GENMASK_ULL(11, 0)
>>>@@ -58,6 +66,11 @@ static unsigned int config_to_event_id(u64 config)
>>>	return FIELD_GET(XE_PMU_EVENT_ID_MASK, config);
>>>}
>>>
>>>+static unsigned int config_to_function_id(u64 config)
>>>+{
>>>+	return FIELD_GET(XE_PMU_EVENT_FUNCTION_MASK, config);
>>>+}
>>>+
>>>static unsigned int config_to_engine_class(u64 config)
>>>{
>>>	return FIELD_GET(XE_PMU_EVENT_ENGINE_CLASS_MASK, config);
>>>@@ -116,7 +129,7 @@ static bool event_supported(struct xe_pmu *pmu, unsigned int gt,
>>>static bool event_param_valid(struct perf_event *event)
>>>{
>>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>-	unsigned int engine_class, engine_instance;
>>>+	unsigned int engine_class, engine_instance, function_id;
>>>	u64 config = event->attr.config;
>>>	struct xe_gt *gt;
>>>
>>>@@ -124,18 +137,28 @@ static bool event_param_valid(struct perf_event *event)
>>>	if (!gt)
>>>		return false;
>>>
>>>+	function_id = config_to_function_id(config);
>>>+	if (function_id && !IS_SRIOV_PF(xe))
>>>+		return false;
>>>+
>>>	engine_class = config_to_engine_class(config);
>>>	engine_instance = config_to_engine_instance(config);
>>>
>>>	switch (config_to_event_id(config)) {
>>>	case XE_PMU_EVENT_GT_C6_RESIDENCY:
>>>-		if (engine_class || engine_instance)
>>>+		if (engine_class || engine_instance || function_id)
>>>			return false;
>>>		break;
>>>	case XE_PMU_EVENT_ENGINE_ACTIVE_TICKS:
>>>	case XE_PMU_EVENT_ENGINE_TOTAL_TICKS:
>>>		if (!event_to_hwe(event))
>>>			return false;
>>>+		/*
>>>+		 * Two additional functions are required for global(0)
>>>+		 * and PF(1) when SRIOV is enabled
>>>+		 */
>>>+		if (function_id > xe_sriov_pf_get_totalvfs(xe) + 1)
>>>+			return false;
>>>		break;
>>>	}
>>>
>>>@@ -194,15 +217,19 @@ static u64 read_engine_events(struct perf_event *event)
>>>{
>>>	struct xe_device *xe = container_of(event->pmu, typeof(*xe), pmu.base);
>>>	struct xe_hw_engine *hwe;
>>>-	u64 val = 0;
>>>+	unsigned int function_id;
>>>+	u64 val = 0, config;
>>>+
>>>+	config = event->attr.config;
>>>+	function_id = config_to_function_id(config);
>>>
>>>	hwe = event_to_hwe(event);
>>>	if (!hwe)
>>>		drm_warn(&xe->drm, "unknown pmu engine\n");
>>>-	else if (config_to_event_id(event->attr.config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>>>-		val = xe_guc_engine_activity_active_ticks(hwe, 0);
>>>+	else if (config_to_event_id(config) == XE_PMU_EVENT_ENGINE_ACTIVE_TICKS)
>>>+		val = xe_guc_engine_activity_active_ticks(hwe, function_id);
>>>	else
>>>-		val = xe_guc_engine_activity_total_ticks(hwe, 0);
>>>+		val = xe_guc_engine_activity_total_ticks(hwe, function_id);
>>>
>>>	return val;
>>>}
>>>@@ -305,6 +332,7 @@ static void xe_pmu_event_del(struct perf_event *event, int flags)
>>>}
>>>
>>>PMU_FORMAT_ATTR(gt,			"config:60-63");
>>>+PMU_FORMAT_ATTR(function,		"config:44-59");
>>>PMU_FORMAT_ATTR(engine_class,		"config:20-27");
>>>PMU_FORMAT_ATTR(engine_instance,	"config:12-19");
>>>PMU_FORMAT_ATTR(event,			"config:0-11");
>>>@@ -313,6 +341,7 @@ static struct attribute *pmu_format_attrs[] = {
>>>	&format_attr_event.attr,
>>>	&format_attr_engine_class.attr,
>>>	&format_attr_engine_instance.attr,
>>>+	&format_attr_function.attr,
>>>	&format_attr_gt.attr,
>>>	NULL,
>>>};
>>>-- 
>>>2.47.1
>>>
