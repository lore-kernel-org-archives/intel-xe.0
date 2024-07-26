Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00C2DC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 19:20:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C340F10E9ED;
	Fri, 26 Jul 2024 19:20:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RsOvsV56";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C1FE10E9ED
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 19:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722021657; x=1753557657;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SpcnQAmZJ9YTOAksyoAWrTrUkXTCI3py0q22WgNb3Hc=;
 b=RsOvsV56VWKUDHOud8nTXVv7OyNc202by3BgH35Eg0YG+k5v18N6Xcp1
 bF4vtOltvhanANX16lFewzmuXh5g4jW0NtBZcBSBA18b/W8gnD72AZV5Q
 f5DCyIIy2/dXySsEjs/GqdO/6Qs2QxhjJrYbYeME8xaJGb7r2HhVsQfwv
 koA2PKyPAa6BumkrV4GW6uABrO25ut+GIA+SozAqeF+8dbxGrL6nd4WF1
 T3Gsr6Vy59pJpsCLOQlNj3QCZgTWka/Wn6qEHwf/YJ5wBgCxCeL7XV9E3
 byj075LKEPt8qVt4F/S5e4y/p0Kdu0QBylopLOUOIvQA0ZDsaeXpjphkp w==;
X-CSE-ConnectionGUID: pnf8yhpQQIiEvGO+icz/Dg==
X-CSE-MsgGUID: qySQn8L6TNiPuJBAEEexgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="23683000"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="23683000"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 12:20:57 -0700
X-CSE-ConnectionGUID: iJTNhFhgTJaxSDpqWX8vtw==
X-CSE-MsgGUID: nf1xvsgzTr2camyYqpEuMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="53362356"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 12:20:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 12:20:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 12:20:56 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 12:20:56 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 12:20:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fRYoFYs6fUMo/MKtc7YrVwxSnmzRhiHPEy1WZCr5ZprpDvIoVQRe3evw0TG2bOkEYvqbg1T13ntAV3ZEe/cSRzbOpPFu7EtmU3kG0tQBqjIRCfUjJow3ZaeRUhTbvoRj9B64FDnKTuE3I9PSgQyrFhhfH1rI8kpTDWWPcQ+JrcR8r/qqOVG48SqSDnMXlKgi4egZpJlBU29K6uNX2uXGb9/ppD5cYhKesnnooPUhgOS9vy+iB6tGbvkMZOB/n7tvAzk5myDzdhiwh9MLjLNzPanVtXDt83ofFeMxPD29EpP8GqgTpWrULj2fyW2Hti3gjZTtDmfaTvZrdSm5X6FSZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k9yoRYFdHcf2ZBQgSODB+WMf/7WZHdu2Ri6MVS8Flw0=;
 b=sow8ceqGWE+Ev9r6FsTGuwWI8fnDYj4lE1IsncPCRLm6dSsFNGXlvhmKg9kztUFgU/oVyKjeSQd7gPGjCQ3KeeY/DkECZkDRPJLzPuiGnV93DRQKiyz+zCyrGmaB58OLZQLATIqtJZmF5v+EVAA2gromxBmsFHd8rdJ8dSaHRmghaGt9/qFANlqOYMklCAx16uxeQQFKZ9o8sd8EDocUS2RBpT1oZydSIkoNL+DL8jNLpl+KtbuJHet7Oi9TvI8wMqGG4U3/pNZCb2PurjMIMP2zvdZdXdXnnewW0ztEqQI3lU2eE4mDWnXVV556Q11aJ/de3NxpYskEi+8tL2EimQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7339.namprd11.prod.outlook.com (2603:10b6:930:9f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 19:20:53 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.7784.020; Fri, 26 Jul 2024
 19:20:52 +0000
Date: Fri, 26 Jul 2024 19:20:02 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Dominik Grzegorzek
 <dominik.grzegorzek@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>, Matt
 Roper <matthew.d.roper@intel.com>, Maciej Patelczyk
 <maciej.patelczyk@intel.com>
Subject: Re: [PATCH 03/21] drm/xe/eudebug: Introduce eudebug support
Message-ID: <ZqP24ijtGBw2Gud2@DUT025-TGLU.fm.intel.com>
References: <20240726140818.54304-1-mika.kuoppala@linux.intel.com>
 <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240726140818.54304-4-mika.kuoppala@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0008.prod.exchangelabs.com (2603:10b6:a02:80::21)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7339:EE_
X-MS-Office365-Filtering-Correlation-Id: f5898b5a-6b8d-4940-a61e-08dcada810c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GIjRbOARAT+yGcoWdfQIWYU0me8IjbAEwEjT/tGwSMPc3D9nFat/yicvYA?=
 =?iso-8859-1?Q?Y2UHPx4hKy5EJWO/JHbfH998UmqB/GXfLmO1v1xLWjeRU9MwaW0poOkj2B?=
 =?iso-8859-1?Q?ZMay9col3nXnCbCs08ksglDgmRN8ZByxC2dD74gDwy/XsJOUhkeWY12MZw?=
 =?iso-8859-1?Q?JRK2+KlOBkX5z7a52y0pqvKQV7p/meURkzgQJpMYHonxPwbcFi16tRclzN?=
 =?iso-8859-1?Q?7Bm5NcK6oUk0Yik8GlQcBpBcNmwY4fHjDf4m+8vriEtdmBN/4MQtxv9Idz?=
 =?iso-8859-1?Q?pBAcOFjYxkQ92KFonFAPfNexs2rn9oUn+k1allEEyOb/DPltYFsQdy0ZX/?=
 =?iso-8859-1?Q?wQxoxz2u0R4K0b1ge/cMIg0LRFKsRxjEDdsVRb5aYtATCHhYXNMc2625ZX?=
 =?iso-8859-1?Q?a3Wy9T4bHGdxD5MCtOwOXRzbh0Lu0Hx0IM0gNgqPL/eEkZD5z/0olAaeIn?=
 =?iso-8859-1?Q?wxSW1DMd1M7VFc7Z152iJzxDOxZe1nIMFzgua362d+q3qYNHjm+H9Of6Wk?=
 =?iso-8859-1?Q?fZd0+4bMltGOH2tMqoPF8HOSqIiEOQ2lEHDkE6ygbEn+hbklT4vJGyDSOQ?=
 =?iso-8859-1?Q?qe49B77flCEcTdP0PzRpn8Ticc256t+zHhVQ1Ypjv2ddJx5Z60utK9jffU?=
 =?iso-8859-1?Q?8dJDGyatrn47yGNUWI4lQVllwNG13nWu2VD2VyScSA7LcxI43mmrdlHxX5?=
 =?iso-8859-1?Q?t6iUZmy5NcS5Bf/TKwgXOOwVpvbIpUkMOYB75xzw8zHdjt7D/sIpGo+cWc?=
 =?iso-8859-1?Q?tASyOJfifPucKLjgOqP6oMtT7X+rUOrHT9uYvX2nPjlr40pQvSFONSG5Ds?=
 =?iso-8859-1?Q?a0ipghVw0L/4f9ak3HRMekgsDwsWGJhlI5W2VYBTbj2XRM135WVu6Lufkl?=
 =?iso-8859-1?Q?inQrjqMPwycPLgC6i1N5SHTZrc3pdb/0xR54zpPJ/l6o0PBJ8IfaahX8m1?=
 =?iso-8859-1?Q?qFCZvWGZG+R5Nh6FessUQu/jezdJhQkRRcoIhurn26T2oxp9VPuzwJDAIq?=
 =?iso-8859-1?Q?NH+qz035ABO6UGO4fEhJsWKHITMmUYc8dsGqQQEnjhkwOKkAkjWgfcdn4k?=
 =?iso-8859-1?Q?1TOT+RqSH9fgpXhoI70NhZMyY7d8JoqnfdVGXlQr5cC2sj4qcCqusFnGjr?=
 =?iso-8859-1?Q?+NXcbyBPfIoNpHZWpMwbvWS4rC4iLGcVuzEcqkdVPLcdXnjqjBg8EyHdH4?=
 =?iso-8859-1?Q?oXkbnvG4Y4eJSFA5znEPcFLcvvdNK9urItMzVsSkNtJiqOOzV792CXKE1H?=
 =?iso-8859-1?Q?eXkLC3l2+Qb1+XFTCY+dDicubhFl4F9D0N9MC6BRkBzdRxbDpwwp3aNoay?=
 =?iso-8859-1?Q?A5iQSDDs/s1eU0aEEmCjEZ1GvIZ5+Jr6cXUwtvhreXCoU7rk0cy7NOBY9q?=
 =?iso-8859-1?Q?pQKrfXVQ4M7x7V8MJYbEbZc0PVxqNbdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ilnOg0IvBNDNXqhVG65iHVCe4eVkELV2H5XbgqXWom3tHUEZ8xHE4PQrpz?=
 =?iso-8859-1?Q?Nh9d1xJFMpe6QdMmNqyMAejGHykceDX8a9mJ7k+s8DHj2sgap9wRmpyKrQ?=
 =?iso-8859-1?Q?EBvfu4aoMXCNI5rbcijRmh6syxN/upkhk+nNaFdG0V4wJjTviyo/OylWe9?=
 =?iso-8859-1?Q?+iMtdtRbWsQxp9y0d6NgcTnhY3mYxyj1Lw8fNQuRkOvm7PsLaDMHXjL7zq?=
 =?iso-8859-1?Q?DmUfn0lLTijqo+/ZKKm8vt3ORDFmEXNHAM+tC4/bcxH/9x7uLg/Rmi94J2?=
 =?iso-8859-1?Q?zZ9EBvEEavELTzQUuCAzJ6m+ImPAyYWdKfI5SHeFFny1kSAsTWZl3kAoYu?=
 =?iso-8859-1?Q?93ihcN0P13Ht1EP/kCa2xkfnGax8aXz/DE+JUifxIBZJuiojh3L53cyvih?=
 =?iso-8859-1?Q?ZS0LzJ41OVbivBCioU8L6FolMswCedkHw0P+lUTfR9r5/aBmjVja60EyX+?=
 =?iso-8859-1?Q?B0LxcPyJyf+wH5EjdzZi7zKjKHOCwdukG7fc797BKoWXB7gntITR98I/n6?=
 =?iso-8859-1?Q?6GyxGWrpxIBQtHw46J3fPRi96VTCMB2sR1ytHGR98IdYC5ZsbBh53X4AFG?=
 =?iso-8859-1?Q?iBuqMUkZYQDADXkcA+N7XPxUlkmgTP0NADZCO/fxcRFcMUxWupmU+Q6i3F?=
 =?iso-8859-1?Q?Rit+uLbXZJmlcN/KSArOyWvSkzXMH3US5EyeCDVBgybl79sxAtdwMfS91s?=
 =?iso-8859-1?Q?Ii1VA6qRmp2jlIWyLzrwVhOG40KXf60R09fmNuEKkY7pPkkCuT/ijOTvft?=
 =?iso-8859-1?Q?Q6VmrR4kwY5fni33Vcy0Ozt4G7etFlBeqNWaTcvPvcIX+g0j0IVvQIYauy?=
 =?iso-8859-1?Q?SKxIhZI1v4KAwLWYVrrmLBOX/IrPToHc0BzJYu4knOjwd3NLExY6GPlamn?=
 =?iso-8859-1?Q?DjBARoDOzcd38iIyMEYQBFbovrreiSzr01VzQ2fZhmhZVeV8P5FBG4qnxp?=
 =?iso-8859-1?Q?v+i/odtj9cQIy1p0GT4py6ZYUqgoIuyCEYpyhvOc9LZfRpBiSYYlfhmNb2?=
 =?iso-8859-1?Q?XVBzSNm/S273TciooQzbgJtf9RLa7FO4Q5MQgDrtmYY5wlJDVvzkI2djjd?=
 =?iso-8859-1?Q?BcObR0QrTglrM6w8Zci7cHSedx2Qu3MpLYKWrdvPEKxuby3HxIS7Hqsp9O?=
 =?iso-8859-1?Q?vg57QJ6Lz/Jd78q5Cw3jjw1lsTIroEmQcLIsQHg3yqSpXtl8D1ZZUxQGRw?=
 =?iso-8859-1?Q?bYQSUEhSY+NKqkIxtr5hpIkdGIIX7wUn7whRnz8bf1dajTHVRyL5py1Sg0?=
 =?iso-8859-1?Q?tCUcaX6Ly8lK5rd1oLHKZrB8XZS/DO64+SebAOZArF0YqEo+HKD7OBRxR/?=
 =?iso-8859-1?Q?PliunGmA7oyxVHK8z0bhDm40+RckeG0oXLqP8Asvh8YOU3gqz/hwa1d0//?=
 =?iso-8859-1?Q?ZhNF1h/cgk54KbH3X/aTJliBe0JgGgklSor0RGrTron1zzGu3NauYLg1Xf?=
 =?iso-8859-1?Q?jMXa5SXdailzR3Ue09SKFznW2cTG7/FjkgS30rLdCU8rUA11Ldmhb/5M+t?=
 =?iso-8859-1?Q?+/1i/14faV+6Q3jgkD75AgTqfEkYwhSsgWi4sp5hG77i/acWQC7SVHrqbx?=
 =?iso-8859-1?Q?FqBr38O0bxf7o8J1ZmPS6hoSsgUn/Wd0jgRD9nIHLqOlX3XLGeHl2TAV3K?=
 =?iso-8859-1?Q?qInz4KKEmd3e6xii663R9H+fzWMrdO9gxYV1DDtfRe+OkiHWWKwaQHhQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f5898b5a-6b8d-4940-a61e-08dcada810c6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 19:20:52.8589 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cFZZeOe6g8DGOYqvqLeAwspDnK+AdPMIR2f9weCSxsCsawiw1hXEcgE4BZnszV97GVrR7RtKsA5RWBKBV72s/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7339
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

On Fri, Jul 26, 2024 at 05:08:00PM +0300, Mika Kuoppala wrote:
> With eudebug event interface, user space debugger process (like gdb)
> is able to keep track of resources created by another process
> (debuggee using drm/xe) and act upon these resources.
> 
> For example, debugger can find a client vm which contains isa/elf
> for a particular shader/eu-kernel and then inspect and modify it
> (for example installing a breakpoint).
> 
> Debugger first opens a connection to xe with a drm ioctl specifying
> target pid to connect. This returns an anon fd handle that can then be
> used to listen for events with dedicated ioctl.
> 
> This patch introduces eudebug connection and event queuing, adding
> client create/destroy and vm create/destroy events as a baseline.
> More events for full debugger operation are needed and
> those will be introduced in follow up patches.
> 
> The resource tracking parts are inspired by the work of
> Maciej Patelczyk on resource handling for i915. Chris Wilson
> suggested improvement of two ways mapping which makes it easy to
> use resource map as a definitive bookkeep of what resources
> are played to debugger in the discovery phase (on follow up patch).
> 

Not a full review just an idea. Do you think it would be worthwhile to
add a Kconfig option to enable EU debug support so if we don't care
about EU debug it compiles out?

The layering would have to be fixed up to make this sane (e.g. all
common Xe code calls into the EU layer so we don't have 'if
IS_ENABLED(CONFIG_EU_DEBUG)' sprinkled all over the place. Fixing up
layering probably isn't bad idea anyways and as common Xe code really
shouldn't open code EU debug specific things anyways. This would enforce
good layering too.

Matt

> v2: - event printer removed (Maarten)
>     - trim down kfifo accessors (Maarten)
>     - xa_alloc spurious locking removed (Maarten)
> v3: - use list for clients (Matt)
> v4: - avoid reporting clients too early (Maciej, VLK-56889)
> v5: - return from wait if disconnect (Mika)
> v6: - read waitqueue (Mika)
> v7: - ENOTCONN early in read_event (Mika)
> v8: - consolidate resource error handling (Mika, Maciej)
> v9: - ptrace access check (Jonathan)
> v10: - detach error handling (Dominik)
> 
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: Matt Roper <matthew.d.roper@intel.com>
> 
> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Maciej Patelczyk <maciej.patelczyk@intel.com>
> ---
>  drivers/gpu/drm/xe/Makefile           |    3 +-
>  drivers/gpu/drm/xe/xe_device.c        |   24 +
>  drivers/gpu/drm/xe/xe_device_types.h  |   26 +
>  drivers/gpu/drm/xe/xe_eudebug.c       | 1093 +++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_eudebug.h       |   27 +
>  drivers/gpu/drm/xe/xe_eudebug_types.h |  169 ++++
>  drivers/gpu/drm/xe/xe_vm.c            |    7 +-
>  include/uapi/drm/xe_drm.h             |   21 +
>  include/uapi/drm/xe_drm_eudebug.h     |   57 ++
>  9 files changed, 1425 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.c
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug.h
>  create mode 100644 drivers/gpu/drm/xe/xe_eudebug_types.h
>  create mode 100644 include/uapi/drm/xe_drm_eudebug.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 1ff9602a52f6..06badc5f99af 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -114,7 +114,8 @@ xe-y += xe_bb.o \
>  	xe_vram_freq.o \
>  	xe_wait_user_fence.o \
>  	xe_wa.o \
> -	xe_wopcm.o
> +	xe_wopcm.o \
> +	xe_eudebug.o
>  
>  xe-$(CONFIG_HMM_MIRROR) += xe_hmm.o
>  
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1aba6f9eaa19..6c5eceaca4ab 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -54,6 +54,7 @@
>  #include "xe_vm.h"
>  #include "xe_vram.h"
>  #include "xe_wait_user_fence.h"
> +#include "xe_eudebug.h"
>  #include "xe_wa.h"
>  
>  #include <generated/xe_wa_oob.h>
> @@ -100,6 +101,14 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  		put_task_struct(task);
>  	}
>  
> +	INIT_LIST_HEAD(&xef->link);
> +
> +	mutex_lock(&xe->files.lock);
> +	list_add_tail(&xef->link, &xe->files.list);
> +	mutex_unlock(&xe->files.lock);
> +
> +	xe_eudebug_file_open(xef);
> +
>  	return 0;
>  }
>  
> @@ -158,6 +167,12 @@ static void xe_file_close(struct drm_device *dev, struct drm_file *file)
>  
>  	xe_pm_runtime_get(xe);
>  
> +	xe_eudebug_file_close(xef);
> +
> +	mutex_lock(&xef->xe->files.lock);
> +	list_del_init(&xef->link);
> +	mutex_unlock(&xef->xe->files.lock);
> +
>  	/*
>  	 * No need for exec_queue.lock here as there is no contention for it
>  	 * when FD is closing as IOCTLs presumably can't be modifying the
> @@ -196,6 +211,7 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  	DRM_IOCTL_DEF_DRV(XE_WAIT_USER_FENCE, xe_wait_user_fence_ioctl,
>  			  DRM_RENDER_ALLOW),
>  	DRM_IOCTL_DEF_DRV(XE_OBSERVATION, xe_observation_ioctl, DRM_RENDER_ALLOW),
> +	DRM_IOCTL_DEF_DRV(XE_EUDEBUG_CONNECT, xe_eudebug_connect_ioctl, DRM_RENDER_ALLOW),
>  };
>  
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> @@ -285,6 +301,8 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  
> +	xe_eudebug_fini(xe);
> +
>  	if (xe->preempt_fence_wq)
>  		destroy_workqueue(xe->preempt_fence_wq);
>  
> @@ -330,6 +348,9 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	spin_lock_init(&xe->irq.lock);
>  	spin_lock_init(&xe->clients.lock);
>  
> +	drmm_mutex_init(&xe->drm, &xe->files.lock);
> +	INIT_LIST_HEAD(&xe->files.list);
> +
>  	init_waitqueue_head(&xe->ufence_wq);
>  
>  	err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
> @@ -356,7 +377,10 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  	INIT_LIST_HEAD(&xe->pinned.external_vram);
>  	INIT_LIST_HEAD(&xe->pinned.evicted);
>  
> +	xe_eudebug_init(xe);
> +
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq", 0);
> +
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
>  	if (!xe->ordered_wq || !xe->unordered_wq ||
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 5b7292a9a66d..bef7c11bd668 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -355,6 +355,15 @@ struct xe_device {
>  		u64 count;
>  	} clients;
>  
> +	/** @files: xe_file list (opens) */
> +	struct {
> +		/** @lock: Protects xe_file list */
> +		struct mutex lock;
> +
> +		/** @list: xe file list */
> +		struct list_head list;
> +	} files;
> +
>  	/** @usm: unified memory state */
>  	struct {
>  		/** @usm.asid: convert a ASID to VM */
> @@ -492,6 +501,20 @@ struct xe_device {
>  	u8 vm_inject_error_position;
>  #endif
>  
> +	/** @debugger connection list and globals for device */
> +	struct {
> +		/** @lock: protects the list of connections */
> +		spinlock_t lock;
> +		/** @list: list of connections, aka debuggers */
> +		struct list_head list;
> +
> +		/** @session_count: session counter to track connections */
> +		u64 session_count;
> +
> +		/** @available: is the debugging functionality available */
> +		bool available;
> +	} eudebug;
> +
>  	/* private: */
>  
>  #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> @@ -596,6 +619,9 @@ struct xe_file {
>  
>  	/** @refcount: ref count of this xe file */
>  	struct kref refcount;
> +
> +	/** @link: link into xe_device.client.list */
> +	struct list_head link;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.c b/drivers/gpu/drm/xe/xe_eudebug.c
> new file mode 100644
> index 000000000000..8aab02824f8a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug.c
> @@ -0,0 +1,1093 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#include <linux/uaccess.h>
> +
> +#include <linux/anon_inodes.h>
> +#include <linux/poll.h>
> +#include <linux/delay.h>
> +
> +#include <drm/drm_managed.h>
> +
> +#include "xe_device.h"
> +#include "xe_assert.h"
> +#include "xe_macros.h"
> +
> +#include "xe_eudebug_types.h"
> +#include "xe_eudebug.h"
> +
> +/*
> + * If there is no detected event read by userspace, during this period, assume
> + * userspace problem and disconnect debugger to allow forward progress.
> + */
> +#define XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS (25 * 1000)
> +
> +#define for_each_debugger_rcu(debugger, head) \
> +	list_for_each_entry_rcu((debugger), (head), connection_link)
> +#define for_each_debugger(debugger, head) \
> +	list_for_each_entry((debugger), (head), connection_link)
> +
> +#define cast_event(T, event) container_of((event), typeof(*(T)), base)
> +
> +#define XE_EUDEBUG_DBG_STR "eudbg: %lld:%lu:%s (%d/%d) -> (%d/%d): "
> +#define XE_EUDEBUG_DBG_ARGS(d) (d)->session, \
> +		atomic_long_read(&(d)->events.seqno), \
> +		READ_ONCE(d->connection.status) <= 0 ? "disconnected" : "", \
> +		current->pid, \
> +		task_tgid_nr(current), \
> +		(d)->target_task->pid, \
> +		task_tgid_nr((d)->target_task)
> +
> +#define eu_err(d, fmt, ...) drm_err(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
> +				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +#define eu_warn(d, fmt, ...) drm_warn(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
> +				      XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +#define eu_dbg(d, fmt, ...) drm_dbg(&(d)->xe->drm, XE_EUDEBUG_DBG_STR # fmt, \
> +				    XE_EUDEBUG_DBG_ARGS(d), ##__VA_ARGS__)
> +
> +#define xe_eudebug_assert(d, ...) xe_assert((d)->xe, ##__VA_ARGS__)
> +
> +#define struct_member(T, member) (((T *)0)->member)
> +
> +/* Keep 1:1 parity with uapi events */
> +#define write_member(T_out, ptr, member, value) { \
> +	BUILD_BUG_ON(sizeof(*ptr) != sizeof(T_out)); \
> +	BUILD_BUG_ON(offsetof(typeof(*ptr), member) != \
> +		     offsetof(typeof(T_out), member)); \
> +	BUILD_BUG_ON(sizeof(ptr->member) != sizeof(value)); \
> +	BUILD_BUG_ON(sizeof(struct_member(T_out, member)) != sizeof(value)); \
> +	BUILD_BUG_ON(!typecheck(typeof((ptr)->member), value));	\
> +	(ptr)->member = (value); \
> +	}
> +
> +static struct xe_eudebug_event *
> +event_fifo_pending(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	if (kfifo_peek(&d->events.fifo, &event))
> +		return event;
> +
> +	return NULL;
> +}
> +
> +/*
> + * This is racy as we dont take the lock for read but all the
> + * callsites can handle the race so we can live without lock.
> + */
> +__no_kcsan
> +static unsigned int
> +event_fifo_num_events_peek(const struct xe_eudebug * const d)
> +{
> +	return kfifo_len(&d->events.fifo);
> +}
> +
> +static bool
> +xe_eudebug_detached(struct xe_eudebug *d)
> +{
> +	int status;
> +
> +	spin_lock(&d->connection.lock);
> +	status = d->connection.status;
> +	spin_unlock(&d->connection.lock);
> +
> +	return status <= 0;
> +}
> +
> +static int
> +xe_eudebug_error(const struct xe_eudebug * const d)
> +{
> +	const int status = READ_ONCE(d->connection.status);
> +
> +	return status <= 0 ? status : 0;
> +}
> +
> +static unsigned int
> +event_fifo_has_events(struct xe_eudebug *d)
> +{
> +	if (xe_eudebug_detached(d))
> +		return 1;
> +
> +	return event_fifo_num_events_peek(d);
> +}
> +
> +static const struct rhashtable_params rhash_res = {
> +	.head_offset = offsetof(struct xe_eudebug_handle, rh_head),
> +	.key_len = sizeof_field(struct xe_eudebug_handle, key),
> +	.key_offset = offsetof(struct xe_eudebug_handle, key),
> +	.automatic_shrinking = true,
> +};
> +
> +static struct xe_eudebug_resource *
> +resource_from_type(struct xe_eudebug_resources * const res, const int t)
> +{
> +	return &res->rt[t];
> +}
> +
> +static struct xe_eudebug_resources *
> +xe_eudebug_resources_alloc(void)
> +{
> +	struct xe_eudebug_resources *res;
> +	int err;
> +	int i;
> +
> +	res = kzalloc(sizeof(*res), GFP_ATOMIC);
> +	if (!res)
> +		return ERR_PTR(-ENOMEM);
> +
> +	mutex_init(&res->lock);
> +
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		xa_init_flags(&res->rt[i].xa, XA_FLAGS_ALLOC1);
> +		err = rhashtable_init(&res->rt[i].rh, &rhash_res);
> +
> +		if (err)
> +			break;
> +	}
> +
> +	if (err) {
> +		while (i--) {
> +			xa_destroy(&res->rt[i].xa);
> +			rhashtable_destroy(&res->rt[i].rh);
> +		}
> +
> +		kfree(res);
> +		return ERR_PTR(err);
> +	}
> +
> +	return res;
> +}
> +
> +static void res_free_fn(void *ptr, void *arg)
> +{
> +	XE_WARN_ON(ptr);
> +	kfree(ptr);
> +}
> +
> +static void
> +xe_eudebug_destroy_resources(struct xe_eudebug *d)
> +{
> +	struct xe_eudebug_resources *res = d->res;
> +	struct xe_eudebug_handle *h;
> +	unsigned long j;
> +	int i;
> +	int err;
> +
> +	mutex_lock(&res->lock);
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		struct xe_eudebug_resource *r = &res->rt[i];
> +
> +		xa_for_each(&r->xa, j, h) {
> +			struct xe_eudebug_handle *t;
> +
> +			err = rhashtable_remove_fast(&r->rh,
> +						     &h->rh_head,
> +						     rhash_res);
> +			xe_eudebug_assert(d, !err);
> +			t = xa_erase(&r->xa, h->id);
> +			xe_eudebug_assert(d, t == h);
> +			kfree(t);
> +		}
> +	}
> +	mutex_unlock(&res->lock);
> +
> +	for (i = 0; i < XE_EUDEBUG_RES_TYPE_COUNT; i++) {
> +		struct xe_eudebug_resource *r = &res->rt[i];
> +
> +		rhashtable_free_and_destroy(&r->rh, res_free_fn, NULL);
> +		xe_eudebug_assert(d, xa_empty(&r->xa));
> +		xa_destroy(&r->xa);
> +	}
> +
> +	mutex_destroy(&res->lock);
> +
> +	kfree(res);
> +}
> +
> +static void xe_eudebug_free(struct kref *ref)
> +{
> +	struct xe_eudebug *d = container_of(ref, typeof(*d), ref);
> +	struct xe_eudebug_event *event;
> +
> +	while (kfifo_get(&d->events.fifo, &event))
> +		kfree(event);
> +
> +	xe_eudebug_destroy_resources(d);
> +	put_task_struct(d->target_task);
> +
> +	xe_eudebug_assert(d, !kfifo_len(&d->events.fifo));
> +
> +	kfree_rcu(d, rcu);
> +}
> +
> +static void xe_eudebug_put(struct xe_eudebug *d)
> +{
> +	kref_put(&d->ref, xe_eudebug_free);
> +}
> +
> +static struct task_struct *find_get_target(const pid_t nr)
> +{
> +	struct task_struct *task;
> +
> +	rcu_read_lock();
> +	task = pid_task(find_pid_ns(nr, task_active_pid_ns(current)), PIDTYPE_PID);
> +	if (task)
> +		get_task_struct(task);
> +	rcu_read_unlock();
> +
> +	return task;
> +}
> +
> +static int
> +xe_eudebug_attach(struct xe_device *xe, struct xe_eudebug *d,
> +		  const pid_t pid_nr)
> +{
> +	struct task_struct *target;
> +	struct xe_eudebug *iter;
> +	kuid_t uid = current_uid();
> +	int ret = 0;
> +
> +	target = find_get_target(pid_nr);
> +	if (!target)
> +		return -ENOENT;
> +
> +	if (!uid_eq(uid, task_uid(target)) && !capable(CAP_SYS_ADMIN)) {
> +		put_task_struct(target);
> +		return -EACCES;
> +	}
> +
> +	XE_WARN_ON(d->connection.status != 0);
> +
> +	spin_lock(&xe->eudebug.lock);
> +	for_each_debugger(iter, &xe->eudebug.list) {
> +		if (!same_thread_group(iter->target_task, target))
> +			continue;
> +
> +		ret = -EBUSY;
> +	}
> +
> +	if (!ret && xe->eudebug.session_count + 1 == 0)
> +		ret = -ENOSPC;
> +
> +	if (!ret) {
> +		d->connection.status = XE_EUDEBUG_STATUS_CONNECTED;
> +		d->xe = xe;
> +		d->target_task = target;
> +		d->session = ++xe->eudebug.session_count;
> +		kref_get(&d->ref);
> +		list_add_tail_rcu(&d->connection_link, &xe->eudebug.list);
> +	}
> +	spin_unlock(&xe->eudebug.lock);
> +
> +	if (ret)
> +		put_task_struct(target);
> +
> +	return ret;
> +}
> +
> +static bool xe_eudebug_detach(struct xe_device *xe,
> +			      struct xe_eudebug *d,
> +			      const int err)
> +{
> +	bool detached = false;
> +
> +	XE_WARN_ON(err > 0);
> +
> +	spin_lock(&d->connection.lock);
> +	if (d->connection.status == XE_EUDEBUG_STATUS_CONNECTED) {
> +		d->connection.status = err;
> +		detached = true;
> +	}
> +	spin_unlock(&d->connection.lock);
> +
> +	if (!detached)
> +		return false;
> +
> +	spin_lock(&xe->eudebug.lock);
> +	list_del_rcu(&d->connection_link);
> +	spin_unlock(&xe->eudebug.lock);
> +
> +	eu_dbg(d, "session %lld detached with %d", d->session, err);
> +
> +	/* Our ref with the connection_link */
> +	xe_eudebug_put(d);
> +
> +	return true;
> +}
> +
> +static int _xe_eudebug_disconnect(struct xe_eudebug *d,
> +				  const int err)
> +{
> +	wake_up_all(&d->events.write_done);
> +	wake_up_all(&d->events.read_done);
> +
> +	return xe_eudebug_detach(d->xe, d, err);
> +}
> +
> +#define xe_eudebug_disconnect(_d, _err) ({ \
> +	if (_xe_eudebug_disconnect((_d), (_err))) { \
> +		if ((_err) == 0 || (_err) == -ETIMEDOUT) \
> +			eu_dbg(d, "Session closed (%d)", (_err)); \
> +		else \
> +			eu_err(d, "Session disconnected, err = %d (%s:%d)", \
> +			       (_err), __func__, __LINE__); \
> +	} \
> +})
> +
> +static int xe_eudebug_release(struct inode *inode, struct file *file)
> +{
> +	struct xe_eudebug *d = file->private_data;
> +
> +	xe_eudebug_disconnect(d, 0);
> +	xe_eudebug_put(d);
> +
> +	return 0;
> +}
> +
> +static __poll_t xe_eudebug_poll(struct file *file, poll_table *wait)
> +{
> +	struct xe_eudebug * const d = file->private_data;
> +	__poll_t ret = 0;
> +
> +	poll_wait(file, &d->events.write_done, wait);
> +
> +	if (xe_eudebug_detached(d)) {
> +		ret |= EPOLLHUP;
> +		if (xe_eudebug_error(d))
> +			ret |= EPOLLERR;
> +	}
> +
> +	if (event_fifo_num_events_peek(d))
> +		ret |= EPOLLIN;
> +
> +	return ret;
> +}
> +
> +static ssize_t xe_eudebug_read(struct file *file,
> +			       char __user *buf,
> +			       size_t count,
> +			       loff_t *ppos)
> +{
> +	return -EINVAL;
> +}
> +
> +static struct xe_eudebug *
> +xe_eudebug_for_task_get(struct xe_device *xe,
> +			struct task_struct *task)
> +{
> +	struct xe_eudebug *d, *iter;
> +
> +	d = NULL;
> +
> +	rcu_read_lock();
> +	for_each_debugger_rcu(iter, &xe->eudebug.list) {
> +		if (!same_thread_group(iter->target_task, task))
> +			continue;
> +
> +		if (kref_get_unless_zero(&iter->ref))
> +			d = iter;
> +
> +		break;
> +	}
> +	rcu_read_unlock();
> +
> +	return d;
> +}
> +
> +static struct task_struct *find_task_get(struct xe_file *xef)
> +{
> +	struct task_struct *task;
> +	struct pid *pid;
> +
> +	rcu_read_lock();
> +	pid = rcu_dereference(xef->drm->pid);
> +	task = pid_task(pid, PIDTYPE_PID);
> +	if (task)
> +		get_task_struct(task);
> +	rcu_read_unlock();
> +
> +	return task;
> +}
> +
> +static struct xe_eudebug *
> +xe_eudebug_get(struct xe_file *xef)
> +{
> +	struct task_struct *task;
> +	struct xe_eudebug *d;
> +
> +	d = NULL;
> +	task = find_task_get(xef);
> +	if (task) {
> +		d = xe_eudebug_for_task_get(to_xe_device(xef->drm->minor->dev),
> +					    task);
> +		put_task_struct(task);
> +	}
> +
> +	if (!d)
> +		return NULL;
> +
> +	if (xe_eudebug_detached(d)) {
> +		xe_eudebug_put(d);
> +		return NULL;
> +	}
> +
> +	return d;
> +}
> +
> +static int xe_eudebug_queue_event(struct xe_eudebug *d,
> +				  struct xe_eudebug_event *event)
> +{
> +	const u64 wait_jiffies = msecs_to_jiffies(1000);
> +	u64 last_read_detected_ts, last_head_seqno, start_ts;
> +
> +	xe_eudebug_assert(d, event->len > sizeof(struct xe_eudebug_event));
> +	xe_eudebug_assert(d, event->type);
> +	xe_eudebug_assert(d, event->type != DRM_XE_EUDEBUG_EVENT_READ);
> +
> +	start_ts = ktime_get();
> +	last_read_detected_ts = start_ts;
> +	last_head_seqno = 0;
> +
> +	do  {
> +		struct xe_eudebug_event *head;
> +		u64 head_seqno;
> +		bool was_queued;
> +
> +		if (xe_eudebug_detached(d))
> +			break;
> +
> +		spin_lock(&d->events.lock);
> +		head = event_fifo_pending(d);
> +		if (head)
> +			head_seqno = event->seqno;
> +		else
> +			head_seqno = 0;
> +
> +		was_queued = kfifo_in(&d->events.fifo, &event, 1);
> +		spin_unlock(&d->events.lock);
> +
> +		wake_up_all(&d->events.write_done);
> +
> +		if (was_queued) {
> +			event = NULL;
> +			break;
> +		}
> +
> +		XE_WARN_ON(!head_seqno);
> +
> +		/* If we detect progress, restart timeout */
> +		if (last_head_seqno != head_seqno)
> +			last_read_detected_ts = ktime_get();
> +
> +		last_head_seqno = head_seqno;
> +
> +		wait_event_interruptible_timeout(d->events.read_done,
> +						 !kfifo_is_full(&d->events.fifo),
> +						 wait_jiffies);
> +
> +	} while (ktime_ms_delta(ktime_get(), last_read_detected_ts) <
> +		 XE_EUDEBUG_NO_READ_DETECTED_TIMEOUT_MS);
> +
> +	if (event) {
> +		eu_dbg(d,
> +		       "event %llu queue failed (blocked %lld ms, avail %d)",
> +		       event ? event->seqno : 0,
> +		       ktime_ms_delta(ktime_get(), start_ts),
> +		       kfifo_avail(&d->events.fifo));
> +
> +		kfree(event);
> +
> +		return -ETIMEDOUT;
> +	}
> +
> +	return 0;
> +}
> +
> +static struct xe_eudebug_handle *
> +alloc_handle(const int type, const u64 key)
> +{
> +	struct xe_eudebug_handle *h;
> +
> +	h = kzalloc(sizeof(*h), GFP_ATOMIC);
> +	if (!h)
> +		return NULL;
> +
> +	h->key = key;
> +
> +	return h;
> +}
> +
> +static struct xe_eudebug_handle *
> +__find_handle(struct xe_eudebug_resource *r,
> +	      const u64 key)
> +{
> +	struct xe_eudebug_handle *h;
> +
> +	h = rhashtable_lookup_fast(&r->rh,
> +				   &key,
> +				   rhash_res);
> +	return h;
> +}
> +
> +static int find_handle(struct xe_eudebug_resources *res,
> +		       const int type,
> +		       const void *p)
> +{
> +	const u64 key = (u64)p;
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h;
> +	int id;
> +
> +	if (XE_WARN_ON(!key))
> +		return -EINVAL;
> +
> +	r = resource_from_type(res, type);
> +
> +	mutex_lock(&res->lock);
> +	h = __find_handle(r, key);
> +	id = h ? h->id : -ENOENT;
> +	mutex_unlock(&res->lock);
> +
> +	return id;
> +}
> +
> +static int _xe_eudebug_add_handle(struct xe_eudebug *d,
> +				  int type,
> +				  void *p,
> +				  u64 *seqno,
> +				  int *handle)
> +{
> +	const u64 key = (u64)p;
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h, *o;
> +	int err;
> +
> +	if (XE_WARN_ON(p == NULL))
> +		return -EINVAL;
> +
> +	if (xe_eudebug_detached(d))
> +		return -ENOTCONN;
> +
> +	h = alloc_handle(type, key);
> +	if (!h)
> +		return -ENOMEM;
> +
> +	r = resource_from_type(d->res, type);
> +
> +	mutex_lock(&d->res->lock);
> +	o = __find_handle(r, key);
> +	if (!o) {
> +		err = xa_alloc(&r->xa, &h->id, h, xa_limit_31b, GFP_KERNEL);
> +
> +		if (h->id >= INT_MAX) {
> +			xa_erase(&r->xa, h->id);
> +			err = -ENOSPC;
> +		}
> +
> +		if (!err)
> +			err = rhashtable_insert_fast(&r->rh,
> +						     &h->rh_head,
> +						     rhash_res);
> +
> +		if (err) {
> +			xa_erase(&r->xa, h->id);
> +		} else {
> +			if (seqno)
> +				*seqno = atomic_long_inc_return(&d->events.seqno);
> +		}
> +	} else {
> +		xe_eudebug_assert(d, o->id);
> +		err = -EEXIST;
> +	}
> +	mutex_unlock(&d->res->lock);
> +
> +	if (handle)
> +		*handle = o ? o->id : h->id;
> +
> +	if (err) {
> +		kfree(h);
> +		XE_WARN_ON(err > 0);
> +		return err;
> +	}
> +
> +	xe_eudebug_assert(d, h->id);
> +
> +	return h->id;
> +}
> +
> +static int xe_eudebug_add_handle(struct xe_eudebug *d,
> +				 int type,
> +				 void *p,
> +				 u64 *seqno)
> +{
> +	int ret;
> +
> +	ret = _xe_eudebug_add_handle(d, type, p, seqno, NULL);
> +	if (ret == -EEXIST || ret == -ENOTCONN) {
> +		eu_dbg(d, "%d on adding %d", ret, type);
> +		return 0;
> +	}
> +
> +	if (ret < 0)
> +		xe_eudebug_disconnect(d, ret);
> +
> +	return ret;
> +}
> +
> +static int _xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
> +				     u64 *seqno)
> +{
> +	const u64 key = (u64)p;
> +	struct xe_eudebug_resource *r;
> +	struct xe_eudebug_handle *h, *xa_h;
> +	int ret;
> +
> +	if (XE_WARN_ON(!key))
> +		return -EINVAL;
> +
> +	if (xe_eudebug_detached(d))
> +		return -ENOTCONN;
> +
> +	r = resource_from_type(d->res, type);
> +
> +	mutex_lock(&d->res->lock);
> +	h = __find_handle(r, key);
> +	if (h) {
> +		ret = rhashtable_remove_fast(&r->rh,
> +					     &h->rh_head,
> +					     rhash_res);
> +		xe_eudebug_assert(d, !ret);
> +		xa_h = xa_erase(&r->xa, h->id);
> +		xe_eudebug_assert(d, xa_h == h);
> +		if (!ret) {
> +			ret = h->id;
> +			if (seqno)
> +				*seqno = atomic_long_inc_return(&d->events.seqno);
> +		}
> +	} else {
> +		ret = -ENOENT;
> +	}
> +	mutex_unlock(&d->res->lock);
> +
> +	kfree(h);
> +
> +	xe_eudebug_assert(d, ret);
> +
> +	return ret;
> +}
> +
> +static int xe_eudebug_remove_handle(struct xe_eudebug *d, int type, void *p,
> +				    u64 *seqno)
> +{
> +	int ret;
> +
> +	ret = _xe_eudebug_remove_handle(d, type, p, seqno);
> +	if (ret == -ENOENT || ret == -ENOTCONN) {
> +		eu_dbg(d, "%d on removing %d", ret, type);
> +		return 0;
> +	}
> +
> +	if (ret < 0)
> +		xe_eudebug_disconnect(d, ret);
> +
> +	return ret;
> +}
> +
> +static struct xe_eudebug_event *
> +__xe_eudebug_create_event(struct xe_eudebug *d,
> +			  u64 seqno, u16 type, u16 flags, u32 len, gfp_t gfp)
> +{
> +	struct xe_eudebug_event *event;
> +
> +	xe_eudebug_assert(d, len > sizeof(*event));
> +
> +	event = kzalloc(len, gfp);
> +	if (!event)
> +		return NULL;
> +
> +	event->type = type;
> +	event->flags = flags;
> +	event->len = len;
> +	event->seqno = seqno;
> +
> +	return event;
> +}
> +
> +static struct xe_eudebug_event *
> +xe_eudebug_create_event(struct xe_eudebug *d, u16 type, u64 seqno, u16 flags,
> +			u32 len, gfp_t gfp)
> +{
> +	return __xe_eudebug_create_event(d, seqno, type, flags, len, gfp);
> +}
> +
> +static long xe_eudebug_read_event(struct xe_eudebug *d,
> +				  const u64 arg,
> +				  const bool wait)
> +{
> +	struct xe_device *xe = d->xe;
> +	struct drm_xe_eudebug_event __user * const user_orig =
> +		u64_to_user_ptr(arg);
> +	struct drm_xe_eudebug_event user_event;
> +	struct xe_eudebug_event *event;
> +	long ret = 0;
> +
> +	if (XE_IOCTL_DBG(xe, copy_from_user(&user_event, user_orig, sizeof(user_event))))
> +		return -EFAULT;
> +
> +	if (XE_IOCTL_DBG(xe, !user_event.type))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.type > DRM_XE_EUDEBUG_EVENT_MAX_EVENT))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.type != DRM_XE_EUDEBUG_EVENT_READ))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.len < sizeof(*user_orig)))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.flags))
> +		return -EINVAL;
> +
> +	if (XE_IOCTL_DBG(xe, user_event.reserved))
> +		return -EINVAL;
> +
> +	/* XXX: define wait time in connect arguments ? */
> +	if (wait) {
> +		ret = wait_event_interruptible_timeout(d->events.write_done,
> +						       event_fifo_has_events(d),
> +						       msecs_to_jiffies(5 * 1000));
> +
> +		if (XE_IOCTL_DBG(xe, ret < 0))
> +			return ret;
> +	}
> +
> +	ret = 0;
> +	spin_lock(&d->events.lock);
> +	event = event_fifo_pending(d);
> +	if (event) {
> +		if (user_event.len < event->len) {
> +			ret = -EMSGSIZE;
> +		} else if (!kfifo_out(&d->events.fifo, &event, 1)) {
> +			eu_warn(d, "internal fifo corruption");
> +			ret = -ENOTCONN;
> +		}
> +	}
> +	spin_unlock(&d->events.lock);
> +
> +	wake_up_all(&d->events.read_done);
> +
> +	if (XE_IOCTL_DBG(xe, ret))
> +		return ret;
> +
> +	if (!event) {
> +		if (xe_eudebug_detached(d))
> +			return -ENOTCONN;
> +		if (!wait)
> +			return -EAGAIN;
> +
> +		return -ENOENT;
> +	}
> +
> +	if (copy_to_user(user_orig, event, event->len))
> +		ret = -EFAULT;
> +	else
> +		eu_dbg(d, "event read: type=%u, flags=0x%x, seqno=%llu", event->type,
> +		       event->flags, event->seqno);
> +
> +	kfree(event);
> +
> +	return ret;
> +}
> +
> +static long xe_eudebug_ioctl(struct file *file,
> +			     unsigned int cmd,
> +			     unsigned long arg)
> +{
> +	struct xe_eudebug * const d = file->private_data;
> +	long ret;
> +
> +	switch (cmd) {
> +	case DRM_XE_EUDEBUG_IOCTL_READ_EVENT:
> +		ret = xe_eudebug_read_event(d, arg,
> +					    !(file->f_flags & O_NONBLOCK));
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct file_operations fops = {
> +	.owner		= THIS_MODULE,
> +	.llseek		= no_llseek,
> +	.release	= xe_eudebug_release,
> +	.poll		= xe_eudebug_poll,
> +	.read		= xe_eudebug_read,
> +	.unlocked_ioctl	= xe_eudebug_ioctl,
> +};
> +
> +static int
> +xe_eudebug_connect(struct xe_device *xe,
> +		   struct drm_xe_eudebug_connect *param)
> +{
> +	const u64 known_open_flags = 0;
> +	unsigned long f_flags = 0;
> +	struct xe_eudebug *d;
> +	int fd, err;
> +
> +	if (param->extensions)
> +		return -EINVAL;
> +
> +	if (!param->pid)
> +		return -EINVAL;
> +
> +	if (param->flags & ~known_open_flags)
> +		return -EINVAL;
> +
> +	if (param->version && param->version != DRM_XE_EUDEBUG_VERSION)
> +		return -EINVAL;
> +
> +	param->version = DRM_XE_EUDEBUG_VERSION;
> +
> +	if (!xe->eudebug.available)
> +		return -EOPNOTSUPP;
> +
> +	d = kzalloc(sizeof(*d), GFP_KERNEL);
> +	if (!d)
> +		return -ENOMEM;
> +
> +	kref_init(&d->ref);
> +	spin_lock_init(&d->connection.lock);
> +	init_waitqueue_head(&d->events.write_done);
> +	init_waitqueue_head(&d->events.read_done);
> +
> +	spin_lock_init(&d->events.lock);
> +	INIT_KFIFO(d->events.fifo);
> +
> +	d->res = xe_eudebug_resources_alloc();
> +	if (IS_ERR(d->res)) {
> +		err = PTR_ERR(d->res);
> +		goto err_free;
> +	}
> +
> +	err = xe_eudebug_attach(xe, d, param->pid);
> +	if (err)
> +		goto err_free_res;
> +
> +	fd = anon_inode_getfd("[xe_eudebug]", &fops, d, f_flags);
> +	if (fd < 0) {
> +		err = fd;
> +		goto err_detach;
> +	}
> +
> +	eu_dbg(d, "connected session %lld", d->session);
> +
> +	return fd;
> +
> +err_detach:
> +	xe_eudebug_detach(xe, d, err);
> +err_free_res:
> +	xe_eudebug_destroy_resources(d);
> +err_free:
> +	kfree(d);
> +
> +	return err;
> +}
> +
> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
> +			     void *data,
> +			     struct drm_file *file)
> +{
> +	struct xe_device *xe = to_xe_device(dev);
> +	struct drm_xe_eudebug_connect * const param = data;
> +	int ret = 0;
> +
> +	ret = xe_eudebug_connect(xe, param);
> +
> +	return ret;
> +}
> +
> +void xe_eudebug_init(struct xe_device *xe)
> +{
> +	spin_lock_init(&xe->eudebug.lock);
> +	INIT_LIST_HEAD(&xe->eudebug.list);
> +
> +	xe->eudebug.available = true;
> +}
> +
> +void xe_eudebug_fini(struct xe_device *xe)
> +{
> +	xe_assert(xe, list_empty_careful(&xe->eudebug.list));
> +}
> +
> +static int send_open_event(struct xe_eudebug *d, u32 flags, const u64 handle,
> +			   const u64 seqno)
> +{
> +	struct xe_eudebug_event *event;
> +	struct xe_eudebug_event_open *eo;
> +
> +	if (!handle)
> +		return -EINVAL;
> +
> +	if (XE_WARN_ON((long)handle >= INT_MAX))
> +		return -EINVAL;
> +
> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_OPEN, seqno,
> +					flags, sizeof(*eo), GFP_KERNEL);
> +	if (!event)
> +		return -ENOMEM;
> +
> +	eo = cast_event(eo, event);
> +
> +	write_member(struct drm_xe_eudebug_event_client, eo,
> +		     client_handle, handle);
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +static int client_create_event(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	u64 seqno;
> +	int ret;
> +
> +	ret = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT, xef, &seqno);
> +	if (ret > 0)
> +		ret = send_open_event(d, DRM_XE_EUDEBUG_EVENT_CREATE,
> +					     ret, seqno);
> +
> +	return ret;
> +}
> +
> +static int client_destroy_event(struct xe_eudebug *d, struct xe_file *xef)
> +{
> +	u64 seqno;
> +	int ret;
> +
> +	ret = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_CLIENT,
> +				       xef, &seqno);
> +	if (ret > 0)
> +		ret = send_open_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY,
> +				      ret, seqno);
> +
> +	return ret;
> +}
> +
> +#define xe_eudebug_event_put(_d, _err) ({ \
> +	if ((_err)) \
> +		xe_eudebug_disconnect((_d), (_err)); \
> +	xe_eudebug_put((_d)); \
> +	})
> +
> +void xe_eudebug_file_open(struct xe_file *xef)
> +{
> +	struct xe_eudebug *d;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	xe_eudebug_event_put(d, client_create_event(d, xef));
> +}
> +
> +void xe_eudebug_file_close(struct xe_file *xef)
> +{
> +	struct xe_eudebug *d;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	xe_eudebug_event_put(d, client_destroy_event(d, xef));
> +}
> +
> +static int send_vm_event(struct xe_eudebug *d, u32 flags,
> +			 const u64 client_handle,
> +			 const u64 vm_handle,
> +			 const u64 seqno)
> +{
> +	struct xe_eudebug_event *event;
> +	struct xe_eudebug_event_vm *e;
> +
> +	event = xe_eudebug_create_event(d, DRM_XE_EUDEBUG_EVENT_VM,
> +					seqno, flags, sizeof(*e), GFP_KERNEL);
> +	if (!event)
> +		return -ENOMEM;
> +
> +	e = cast_event(e, event);
> +
> +	write_member(struct drm_xe_eudebug_event_vm, e, client_handle, client_handle);
> +	write_member(struct drm_xe_eudebug_event_vm, e, vm_handle, vm_handle);
> +
> +	return xe_eudebug_queue_event(d, event);
> +}
> +
> +static int vm_create_event(struct xe_eudebug *d,
> +			   struct xe_file *xef, struct xe_vm *vm)
> +{
> +	int h_c, h_vm;
> +	u64 seqno;
> +	int ret;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0)
> +		return h_c;
> +
> +	xe_eudebug_assert(d, h_c);
> +
> +	h_vm = xe_eudebug_add_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqno);
> +	if (h_vm <= 0)
> +		return h_vm;
> +
> +	ret = send_vm_event(d, DRM_XE_EUDEBUG_EVENT_CREATE, h_c, h_vm, seqno);
> +
> +	return ret;
> +}
> +
> +static int vm_destroy_event(struct xe_eudebug *d,
> +			    struct xe_file *xef, struct xe_vm *vm)
> +{
> +	int h_c, h_vm;
> +	u64 seqno;
> +
> +	h_c = find_handle(d->res, XE_EUDEBUG_RES_TYPE_CLIENT, xef);
> +	if (h_c < 0) {
> +		XE_WARN_ON("no client found for vm");
> +		eu_warn(d, "no client found for vm");
> +		return h_c;
> +	}
> +
> +	xe_eudebug_assert(d, h_c);
> +
> +	h_vm = xe_eudebug_remove_handle(d, XE_EUDEBUG_RES_TYPE_VM, vm, &seqno);
> +	if (h_vm <= 0)
> +		return h_vm;
> +
> +	return send_vm_event(d, DRM_XE_EUDEBUG_EVENT_DESTROY, h_c, h_vm, seqno);
> +}
> +
> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm)
> +{
> +	struct xe_eudebug *d;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	xe_eudebug_event_put(d, vm_create_event(d, xef, vm));
> +}
> +
> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm)
> +{
> +	struct xe_eudebug *d;
> +
> +	d = xe_eudebug_get(xef);
> +	if (!d)
> +		return;
> +
> +	xe_eudebug_event_put(d, vm_destroy_event(d, xef, vm));
> +}
> diff --git a/drivers/gpu/drm/xe/xe_eudebug.h b/drivers/gpu/drm/xe/xe_eudebug.h
> new file mode 100644
> index 000000000000..df577b581364
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_EUDEBUG_H_
> +
> +struct drm_device;
> +struct drm_file;
> +struct xe_device;
> +struct xe_file;
> +struct xe_vm;
> +
> +int xe_eudebug_connect_ioctl(struct drm_device *dev,
> +			     void *data,
> +			     struct drm_file *file);
> +
> +void xe_eudebug_init(struct xe_device *xe);
> +void xe_eudebug_fini(struct xe_device *xe);
> +
> +void xe_eudebug_file_open(struct xe_file *xef);
> +void xe_eudebug_file_close(struct xe_file *xef);
> +
> +void xe_eudebug_vm_create(struct xe_file *xef, struct xe_vm *vm);
> +void xe_eudebug_vm_destroy(struct xe_file *xef, struct xe_vm *vm);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_eudebug_types.h b/drivers/gpu/drm/xe/xe_eudebug_types.h
> new file mode 100644
> index 000000000000..093221a707df
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_eudebug_types.h
> @@ -0,0 +1,169 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef __XE_EUDEBUG_TYPES_H_
> +
> +#include <linux/mutex.h>
> +#include <linux/kref.h>
> +#include <linux/kfifo.h>
> +#include <linux/completion.h>
> +#include <linux/wait.h>
> +#include <linux/xarray.h>
> +#include <linux/rbtree.h>
> +#include <linux/rhashtable.h>
> +
> +#include <uapi/drm/xe_drm.h>
> +
> +struct xe_device;
> +struct task_struct;
> +struct xe_eudebug_event;
> +
> +#define CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE 64
> +
> +/**
> + * struct xe_eudebug_handle - eudebug resource handle
> + */
> +struct xe_eudebug_handle {
> +	/** @key: key value in rhashtable <key:id> */
> +	u64 key;
> +
> +	/** @id: opaque handle id for xarray <id:key> */
> +	int id;
> +
> +	/** @rh_head: rhashtable head */
> +	struct rhash_head rh_head;
> +};
> +
> +/**
> + * struct xe_eudebug_resource - Resource map for one resource
> + */
> +struct xe_eudebug_resource {
> +	/** @xa: xarrays for <id->key> */
> +	struct xarray xa;
> +
> +	/** @rh rhashtable for <key->id> */
> +	struct rhashtable rh;
> +};
> +
> +#define XE_EUDEBUG_RES_TYPE_CLIENT	0
> +#define XE_EUDEBUG_RES_TYPE_VM		1
> +#define XE_EUDEBUG_RES_TYPE_COUNT	(XE_EUDEBUG_RES_TYPE_VM + 1)
> +
> +/**
> + * struct xe_eudebug_resources - eudebug resources for all types
> + */
> +struct xe_eudebug_resources {
> +	/** @lock: guards access into rt */
> +	struct mutex lock;
> +
> +	/** @rt: resource maps for all types */
> +	struct xe_eudebug_resource rt[XE_EUDEBUG_RES_TYPE_COUNT];
> +};
> +
> +/**
> + * struct xe_eudebug - Top level struct for eudebug: the connection
> + */
> +struct xe_eudebug {
> +	/** @ref: kref counter for this struct */
> +	struct kref ref;
> +
> +	/** @rcu: rcu_head for rcu destruction */
> +	struct rcu_head rcu;
> +
> +	/** @connection_link: our link into the xe_device:eudebug.list */
> +	struct list_head connection_link;
> +
> +	struct {
> +		/** @status: connected = 1, disconnected = error */
> +#define XE_EUDEBUG_STATUS_CONNECTED 1
> +		int status;
> +
> +		/** @lock: guards access to status */
> +		spinlock_t lock;
> +	} connection;
> +
> +	/** @xe: the parent device we are serving */
> +	struct xe_device *xe;
> +
> +	/** @target_task: the task that we are debugging */
> +	struct task_struct *target_task;
> +
> +	/** @res: the resource maps we track for target_task */
> +	struct xe_eudebug_resources *res;
> +
> +	/** @session: session number for this connection (for logs) */
> +	u64 session;
> +
> +	/** @events: kfifo queue of to-be-delivered events */
> +	struct {
> +		/** @lock: guards access to fifo */
> +		spinlock_t lock;
> +
> +		/** @fifo: queue of events pending */
> +		DECLARE_KFIFO(fifo,
> +			      struct xe_eudebug_event *,
> +			      CONFIG_DRM_XE_DEBUGGER_EVENT_QUEUE_SIZE);
> +
> +		/** @write_done: waitqueue for signalling write to fifo */
> +		wait_queue_head_t write_done;
> +
> +		/** @read_done: waitqueue for signalling read from fifo */
> +		wait_queue_head_t read_done;
> +
> +		/** @event_seqno: seqno counter to stamp events for fifo */
> +		atomic_long_t seqno;
> +	} events;
> +
> +};
> +
> +/**
> + * struct xe_eudebug_event - Internal base event struct for eudebug
> + */
> +struct xe_eudebug_event {
> +	/** @len: length of this event, including payload */
> +	u32 len;
> +
> +	/** @type: message type */
> +	u16 type;
> +
> +	/** @flags: message flags */
> +	u16 flags;
> +
> +	/** @seqno: sequence number for ordering */
> +	u64 seqno;
> +
> +	/** @reserved: reserved field MBZ */
> +	u64 reserved;
> +
> +	/** @data: payload bytes */
> +	u8 data[];
> +};
> +
> +/**
> + * struct xe_eudebug_event_open - Internal event for client open/close
> + */
> +struct xe_eudebug_event_open {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: opaque handle for client */
> +	u64 client_handle;
> +};
> +
> +/**
> + * struct xe_eudebug_event_vm - Internal event for vm open/close
> + */
> +struct xe_eudebug_event_vm {
> +	/** @base: base event */
> +	struct xe_eudebug_event base;
> +
> +	/** @client_handle: client containing the vm open/close */
> +	u64 client_handle;
> +
> +	/** @vm_handle: vm handle it's open/close */
> +	u64 vm_handle;
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index f225107bdd65..9e101c992d9c 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -39,6 +39,7 @@
>  #include "xe_trace_bo.h"
>  #include "xe_wa.h"
>  #include "xe_hmm.h"
> +#include "xe_eudebug.h"
>  
>  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>  {
> @@ -1818,6 +1819,8 @@ int xe_vm_create_ioctl(struct drm_device *dev, void *data,
>  	args->reserved[0] = xe_bo_main_addr(vm->pt_root[0]->bo, XE_PAGE_SIZE);
>  #endif
>  
> +	xe_eudebug_vm_create(xef, vm);
> +
>  	return 0;
>  
>  err_free_id:
> @@ -1853,8 +1856,10 @@ int xe_vm_destroy_ioctl(struct drm_device *dev, void *data,
>  		xa_erase(&xef->vm.xa, args->vm_id);
>  	mutex_unlock(&xef->vm.lock);
>  
> -	if (!err)
> +	if (!err) {
> +		xe_eudebug_vm_destroy(xef, vm);
>  		xe_vm_close_and_put(vm);
> +	}
>  
>  	return err;
>  }
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 29425d7fdc77..a68734ff12f4 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -102,6 +102,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_EUDEBUG_CONNECT		0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +118,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_EUDEBUG_CONNECT		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EUDEBUG_CONNECT, struct drm_xe_eudebug_connect)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1694,6 +1696,25 @@ struct drm_xe_oa_stream_info {
>  	__u64 reserved[3];
>  };
>  
> +/*
> + * Debugger ABI (ioctl and events) Version History:
> + * 0 - No debugger available
> + * 1 - Initial version
> + */
> +#define DRM_XE_EUDEBUG_VERSION 1
> +
> +struct drm_xe_eudebug_connect {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	__u64 pid; /* input: Target process ID */
> +	__u32 flags; /* MBZ */
> +
> +	__u32 version; /* output: current ABI (ioctl / events) version */
> +};
> +
> +#include "xe_drm_eudebug.h"
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/include/uapi/drm/xe_drm_eudebug.h b/include/uapi/drm/xe_drm_eudebug.h
> new file mode 100644
> index 000000000000..a1cad9c005fc
> --- /dev/null
> +++ b/include/uapi/drm/xe_drm_eudebug.h
> @@ -0,0 +1,57 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _UAPI_XE_DRM_EUDEBUG_H_
> +#define _UAPI_XE_DRM_EUDEBUG_H_
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/**
> + * Do a eudebug event read for a debugger connection.
> + *
> + * This ioctl is available in debug version 1.
> + */
> +#define DRM_XE_EUDEBUG_IOCTL_READ_EVENT _IO('j', 0x0)
> +
> +/* XXX: Document events to match their internal counterparts when moved to xe_drm.h */
> +struct drm_xe_eudebug_event {
> +	__u32 len;
> +
> +	__u16 type;
> +#define DRM_XE_EUDEBUG_EVENT_NONE		0
> +#define DRM_XE_EUDEBUG_EVENT_READ		1
> +#define DRM_XE_EUDEBUG_EVENT_OPEN		2
> +#define DRM_XE_EUDEBUG_EVENT_VM			3
> +#define DRM_XE_EUDEBUG_EVENT_MAX_EVENT		DRM_XE_EUDEBUG_EVENT_VM
> +
> +	__u16 flags;
> +#define DRM_XE_EUDEBUG_EVENT_CREATE		(1 << 0)
> +#define DRM_XE_EUDEBUG_EVENT_DESTROY		(1 << 1)
> +#define DRM_XE_EUDEBUG_EVENT_STATE_CHANGE	(1 << 2)
> +#define DRM_XE_EUDEBUG_EVENT_NEED_ACK		(1 << 3)
> +	__u64 seqno;
> +	__u64 reserved;
> +};
> +
> +struct drm_xe_eudebug_event_client {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle; /* This is unique per debug connection */
> +};
> +
> +struct drm_xe_eudebug_event_vm {
> +	struct drm_xe_eudebug_event base;
> +
> +	__u64 client_handle;
> +	__u64 vm_handle;
> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif
> -- 
> 2.34.1
> 
