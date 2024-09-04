Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314B2CD4855
	for <intel-xe@archiver.kernel.org>; Wed,  4 Sep 2024 15:04:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03F110E6C3;
	Wed,  4 Sep 2024 15:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eTiIHv75";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87A4810E6C3
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Sep 2024 15:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725462250; x=1756998250;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=MgnTxUA8dEWID0WzemBxv3zBTFghzk1/P6/f8B3Tt1o=;
 b=eTiIHv75QuFLVIcphH00cKQjU6hxWPp7OEm2KYxufvf6HW+lN5Hou0zn
 cpyze7Lq2LwS/W4zKLTPiDwKEjFc+DCmPoN7H8e/v85F0viyxpBNVeq80
 Nx4C9LXetNNWwoj6ID+4bxz/q5QpXf7Z707IbEX9TXnnvDZPFpJWx57WC
 9NVQi+iiiCnxZFopss/oflB7GprYVnm/5eiEBsPfIzHomw+6cGOnGEm85
 bHsGVyJaBbi7u2k7bu7kFN8QlpI8FT5oiVbij0R+/qc3F8Kf5yIXNzRwS
 pkQiKa3vky9W74siluQnBaegtQkko/Y84Fr4uAXc4pnLb5C4BgPM0iwXS A==;
X-CSE-ConnectionGUID: 9dtUsEABQWKKFPSnuHfOlw==
X-CSE-MsgGUID: VyR2UIW+RqilLBPzxYteLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24272837"
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="24272837"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2024 08:04:10 -0700
X-CSE-ConnectionGUID: S7Elp3YETFyF3ymSn5qP/Q==
X-CSE-MsgGUID: CUhYc7tOSwetx7R9Jq4ZGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,202,1719903600"; d="scan'208";a="65821198"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Sep 2024 08:04:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 4 Sep 2024 08:04:09 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 4 Sep 2024 08:04:09 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Sep 2024 08:04:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v4MJof1Cp6PHs6o2djzfl7LXgt/ygEPVkZk1chn5NrfyiOmGClvbT7TqtnSV6bj2idEdBPEinTXwcBNnHHENNSHorYt7MTJ4asMUmtCcy4yIetkgLPYi5ywVytqdWqWZMt3gc6QAVmYOEaJAN8TXGckjZBSW7F3LcAIzf0O30mn+0p1xxONGXhfkTZtWcRt5MijCurBN6wXmWjv+lebjaGodR3ZMU9lgZM4+MCE6osrdwxCHic+JiIOOWS8B1Pk+NMf71Xq9tbV8UEQvEA6ef15eCTL8EdM3kcAxSGOGuDv+qUUm2UWr0HlGacLaiNsmiL+qo+Qq3doBBV82ExhS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N060Vj8lWW4F9pT/ajcwf1GUP8cSqQUlk9FjVSQU7ck=;
 b=plNWFU3IF9VBP9AFFf4cB6XnVe/WpL7S08isW8bRPf64Ceq3TR2/BtP1beKf78IepAyV56kB8Clrr4nJlAbbVyDi7MRbp4JYjLa/ucVh1jPNw1X2EwN7i5PQKxMBLB6kdfgcaygQG/oGeuQUKA6EQ/NVBXeAuacVutzb+1xWHVj8fLSLz6wP6wBt8QY1+zFJn5PdRVdoZo8JNIHJ3OQsPay9huh0bJ+Z1c2sJd5WAaJOE8TFvBLlCZ3tOYvdpsjkvksIwSQfwVGSTrtZVnz/eewLJhmNRwUgn1st3k7Fm0JFyNvEgu8QRnQYfPWtOZqzmMCUp09PPFNJrJVgG4lGlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by CY8PR11MB7847.namprd11.prod.outlook.com (2603:10b6:930:7c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 15:03:59 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 15:03:58 +0000
Date: Wed, 4 Sep 2024 11:03:52 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Brost <matthew.brost@intel.com>, 
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe: Kill missing outer runtime PM protection warning
Message-ID: <Zth22JdcjlcSAzin@intel.com>
References: <20240903223822.380841-1-rodrigo.vivi@intel.com>
 <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23623c0f-f3e5-4227-9a84-7490ae3978ec@intel.com>
X-ClientProxiedBy: MW4PR03CA0112.namprd03.prod.outlook.com
 (2603:10b6:303:b7::27) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|CY8PR11MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: e4bbb4d5-3be0-431f-d18b-08dcccf2cd65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ISo/xQozD7V3G4f88WJFEvmyYF31i4LAcxF8Iw2V1b7DuDV9tdUeqheLcW?=
 =?iso-8859-1?Q?GQ6HE6fN+Ttv2fdguURAdswGHgzloacAaXrbO8ggBcJa9LoH+gK94YxCvY?=
 =?iso-8859-1?Q?sQmYz5UVCrulMhVibfeAtOL7kDvJ7p+wEEfku+JJ0tJIqQqGZm+Lj7DUYS?=
 =?iso-8859-1?Q?WFEdc6IwbEuJaWVsvISwb1t+s1MZS+PjAXyoNxnCPX57XOpHLE0sR8bK0X?=
 =?iso-8859-1?Q?7gZq2w3UddaNw0eEHSqfdzdfGFvC1gy5o9+7j3VirLtUTL6QjSiqZuTDBN?=
 =?iso-8859-1?Q?fkPi0bGnWjyOwjrBE2OoLTl3GJS4i/8EQt9enJIw330FJ+RFz1iVhA3hn+?=
 =?iso-8859-1?Q?AqDmqgbKLKAX0LJPtimojZqP/X1lfcOjLj3x2ZT+aWf267m87hPTQyhdEb?=
 =?iso-8859-1?Q?S3Al0hLOCci7EZBUUL9+CyJ+IQ3yBbTVsTU+pHMIuXYUm/3f70qeZcm36W?=
 =?iso-8859-1?Q?DGg1Z0G3dz7SFvGk2iBjo7VUDYa0Ojwt6jbgNeZl5HNiQs5E6+CbamuPEz?=
 =?iso-8859-1?Q?d915XzgMCd1h543h2IJ4rzX3akrUsjXzlbA0mT0bd/DeBw1ZHupZ4BpHbI?=
 =?iso-8859-1?Q?tn5g9Cqr0iWaXiAlqigyuCgZpe4bqaLuE5GvzHksosXQFv+mZdcYgl/sHB?=
 =?iso-8859-1?Q?UWzp0jgmi3diZbPIew2iQzlC37cui8aFGfh/KeQisYabhbyvQsjgFm5Q4+?=
 =?iso-8859-1?Q?wAq1dTvcmTOh0wp55rVxARyQZ/wy9jRGIKi0AyUPWz3vhHQ9NF5kNErTS0?=
 =?iso-8859-1?Q?yDobHjWwUBGPFfL+b5pm18uLeOIkaA17WF1flfdZYg9O8c/HHpQ9DN1u7z?=
 =?iso-8859-1?Q?oZl2bs8lUxFi8CdCAXOgrBAzLKyEyawBRDhvPhzcixNURd3qG+RO6y8wxK?=
 =?iso-8859-1?Q?6Ff93NiFOZv0mHKCbetg5UsHRyLjlhLoYQeF0bUBcn0aiK7rew+O4HWJ8Y?=
 =?iso-8859-1?Q?50BsEQhZKKN64YpaaVtjr392gtG04EYx23xTYYpxrsqwlVTOE0wDvk/pVH?=
 =?iso-8859-1?Q?m7CQkdpaVmqTaPjM+MNFcLGl7pcRON6B5PlO6LTNrWyYnsel6l6fe9wmhZ?=
 =?iso-8859-1?Q?dHMS7UrRKab5h5Eo0wKgz5l9uxV6aDBWsVQh0Sy5tCnhGn9R4M6kSf8lPM?=
 =?iso-8859-1?Q?MFiGN5BX/RCPgsnWAMP3TfFS51g1RNTTIT9ocE7kU4cnGVf9OJvTVjMb0t?=
 =?iso-8859-1?Q?4Gu2BYH8N4LnZxL5G0tow/ODoYvg4uj6pQd2b6pN0pmvpGEQBOdvmwNYLw?=
 =?iso-8859-1?Q?0bMD0Z4HMQQFnJiSNBM/+JOQmDx13gUQXYHUDBYobiGgBMLyWvYz20moh7?=
 =?iso-8859-1?Q?d/G/LhpqLjk6QkDHEre8PlKi9hJr9weCS1M3QAEn9pK4Jo8DaJucpyes7a?=
 =?iso-8859-1?Q?9kx4/K8yEsb/lpbFhNf6HWXGOZ7BudSg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5t4CgiDTA6+quYN6qMweB4vLKh6s8fCDJPvHmWtoivn7WOGJDv6zs4rB1w?=
 =?iso-8859-1?Q?YO8dqVod6q1886cN7pKrUeaqv1ggs9/YkxITHOgAz34rOS94k7vk27YeQv?=
 =?iso-8859-1?Q?WatQIMpRkZoh5OtRtOYQLttBsL+LfIRlrZWLf8pECqwSDC+/rS5wjniSr8?=
 =?iso-8859-1?Q?PK7v54oCEoBwgcHQdUDVR2oUNzRDpbRNXejgLqtD3T6yPCFyDHuhez5jEL?=
 =?iso-8859-1?Q?SdFSw2cWkEfxhet8lTZDhO4huqgO+rgm0lnrYoZxcaVB+iBmHQGX4wtC3Z?=
 =?iso-8859-1?Q?tFvskFlaA1Fv7kTSu2Rg2/FK5i8aOHViW36nWzaS3hIcJ8VIhb3/DOHISz?=
 =?iso-8859-1?Q?q3J0xyRiUswITF4BxKeVA5qXOcM5JIJE/3jQs/zGigE6JjptCwNi+o+AQ+?=
 =?iso-8859-1?Q?RgEaooZvon8YonpmKIzRCAJpncSo3xJWaf99M7pdxMmSVNoSIyRcBTDTW8?=
 =?iso-8859-1?Q?+Kwzq0WoUkgbXTgto7Ggz2HvvWq8daNThqyK6Us7g2y829PMK4GmiZrjSM?=
 =?iso-8859-1?Q?9B1desFu/ORNVGpQC7vZJX17I4bzl3xFVEn+fWA5q15fNo7dXrBjJt+VqZ?=
 =?iso-8859-1?Q?9ATs9nrkKOCWgTh9eVM6NWAPe28jbM8QhYEfRWX/qAl+35ZVRQbGWiixJN?=
 =?iso-8859-1?Q?AksgXPJ8a9D8s8thciPjnRE+ODpuxkPDF+t1C/WsKyUHeSXeoMs3ASZT0n?=
 =?iso-8859-1?Q?288IsLavyePgkKD4CctOSv7gt9Qa/Uexcx5xA5nleti9FGIPOR7AgwD7wN?=
 =?iso-8859-1?Q?XVUSTBL2b5pvozQ9WR9AHGVf5wPR8E+g1KYA88C81QE6zlPu1BAW+ZJizA?=
 =?iso-8859-1?Q?kebjuMl87VsAvNEFHILgHAspLs7NCZsFAs1nQNtPX3InN95Kl+efFKc0xy?=
 =?iso-8859-1?Q?mGaVynK18OTvkY170gSE0Rqt9cXxSALPIOrBwyaUghS2pfnpRT9lXpsJTm?=
 =?iso-8859-1?Q?p8ravt4C32QBCDtOkLPJVard9xYzSiC6ZR9EP76CjJxFquI/WA5vGP5qOj?=
 =?iso-8859-1?Q?RvBGcNWIDwDvFc65UkEezyGKYxSRT4arAr4SZeVjBCf+qwOLuXhtG2Ej1x?=
 =?iso-8859-1?Q?qgWgGIDtSaJCAt8CMh9FDtgFu+8h/yfFuqhxu5vnO+0vrneVpyFvkcBm57?=
 =?iso-8859-1?Q?8L1XtOKmerKyMocmF9ax316n7nWgc7iRORhPU1BB5j507/rAVdc6yIgySY?=
 =?iso-8859-1?Q?ZGCxWxoqHk/I/iKSnHBbgd6AJ1s2Lh5JsmFEArxGVCg9tCWiLLqNhDh20b?=
 =?iso-8859-1?Q?aKIsIv4zqpS212bZcMRHruQNLHJQ2QnGPNdsi1Da12eD7HqBeB3Rgol4kN?=
 =?iso-8859-1?Q?wzX0esuz1gOcwPFpWpBxbZgTLxfKfkhlcoHnTllceY/VS4C9NOtV9WNOt4?=
 =?iso-8859-1?Q?1ZJgT5G0rrH2l0fHo86YviDyyGKFktvs3lfmeUcD8PZW1EdVouftbPDId+?=
 =?iso-8859-1?Q?HHOAsKfG4rQPwPNI6tByNXObVHtWlsPSaDWGLcSjnNciijxBkWxtMBTuyk?=
 =?iso-8859-1?Q?IbjA7rAvOeQvP/dP/2bzNTk6aNrcxtEip+68bsaV5E2KDktOq4b1YCg86h?=
 =?iso-8859-1?Q?WosztYQvWSsDiDTlGvY1cp06KBDDr1Znb91eCl2pWKcy0Fb9+qGFMz7Df9?=
 =?iso-8859-1?Q?eMF7JsRfeiX/k7PiDoQurpXwzrU2n36CAyU+FYmeh3pN8do1P+Q85wEw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4bbb4d5-3be0-431f-d18b-08dcccf2cd65
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 15:03:58.7586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +6YF96Z8zakvrHSiXn1aMng43x6Cm2sLSKxH2SD0i8gmU5sTCrK4jOvVQ9vyV9vPkADvL96fiLMCc3tKf6aZ2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7847
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

On Wed, Sep 04, 2024 at 01:49:47PM +0100, Matthew Auld wrote:
> On 03/09/2024 23:38, Rodrigo Vivi wrote:
> > This message was very useful to ensure that Xe was taking all
> > the needed outer runtime pm references. However, at this point
> > it is only a false positive. So, remove it.
> > 
> > False positive cases:
> > 
> > 1:
> > [184.983389] xe ...: [drm] Missing outer runtime PM protection
> > [snip]
> > [184.984096]  drm_ioctl+0x2cf/0x580 [drm]
> > [snip]
> > [184.984710] xe 0000:00:02.0: Runtime PM usage count underflow!
> > 
> > In this case the underflow is the problem since we are sure that
> > the ioctl is protected. But something else is abusing the 'put'
> > calls.
> > 
> > 2:
> > rpm_status:           0000:03:00.0 status=RPM_SUSPENDING
> > console:              xe_bo_evict_all (called from suspend)
> > xe_sched_job_create:  dev=0000:03:00.0, ...
> > xe_sched_job_exec:    dev=0000:03:00.0, ...
> > xe_pm_runtime_put:    dev=0000:03:00.0, ...
> > xe_sched_job_run:     dev=0000:03:00.0, ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > rpm_usage:            0000:03:00.0 flags-0 cnt-2  ...
> > console:              xe 0000:03:00.0: [drm] Missing outer runtime
> > 		      	 	       	     	     PM protection
> > console:               xe_guc_ct_send+0x15/0x50 [xe]
> > console:               guc_exec_queue_run_job+0x1509/0x3950 [xe]
> > [snip]
> > console:               drm_sched_run_job_work+0x649/0xc20
> > 
> > At this point, BOs are getting evicted from VRAM with rpm
> > usage-counter = 2, but rpm status = SUSPENDING.
> > The xe->pm_callback_task won't be equal 'current' because this call is
> > coming from a work queue.
> > 
> > So, pm_runtime_get_if_active() will be called and return 0 because rpm
> > status != ACTIVE (but equal SUSPENDING).
> > 
> > The only way out is to just grab the reference and move on.
> > 
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pm.c | 10 ++--------
> >   1 file changed, 2 insertions(+), 8 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index da68cd689a96..e1a5e43b0f34 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -592,20 +592,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
> >    * xe_pm_runtime_get_noresume - Bump runtime PM usage counter without resuming
> >    * @xe: xe device instance
> >    *
> > - * This function should be used in inner places where it is surely already
> > + * This function should *only* be used in inner places where it is surely already
> >    * protected by outer-bound callers of `xe_pm_runtime_get`.
> > - * It will warn if not protected.
> >    * The reference should be put back after this function regardless, since it
> >    * will always bump the usage counter, regardless.
> >    */
> >   void xe_pm_runtime_get_noresume(struct xe_device *xe)
> >   {
> > -	bool ref;
> > -
> > -	ref = xe_pm_runtime_get_if_in_use(xe);
> > -
> > -	if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
> > -		pm_runtime_get_noresume(xe->drm.dev);
> 
> This has proven to find real bugs in the past, right? If so, it seems
> unfortunate to drop this completely?

You do have a point....

> What about making it slightly more
> fuzzy with something like:
> 
> drm_WARN(!pm_read_callback_task() && !pm_runtime_active(), ...

I don't like inspecting the status directly because it can be racy,
but in this particular case it would for sure avoid the case-2 of
our false positives. But perhaps something like this:

@@ -600,12 +600,14 @@ bool xe_pm_runtime_get_if_in_use(struct xe_device *xe)
  */
 void xe_pm_runtime_get_noresume(struct xe_device *xe)
 {
+       struct device *dev = xe->drm.dev;
        bool ref;
 
        ref = xe_pm_runtime_get_if_in_use(xe);
 
-       if (drm_WARN(&xe->drm, !ref, "Missing outer runtime PM protection\n"))
-               pm_runtime_get_noresume(xe->drm.dev);
+       if (drm_WARN(&xe->drm, !ref && dev->power.runtime_status != RPM_SUSPENDING,
+                    "Missing outer runtime PM protection\n"))
+               pm_runtime_get_noresume(dev);


> 
> That should avoid the false positive, at the cost of not finding some real
> bugs, but at least gives us something?

Well, right, this eliminates the false positive case 2.
But still at least the false positive case 1.

The big problem that I saw with this warning at this moment, was that
CI-buglog classified all the "Missing outer runtime PM protection"
in a single bucket and that was ignored because we had the issue of
the pending ggtt_node removal case to handle.

Meanwhile we masked all these bugs that I'm hunting now, because
they all looked the ggtt_node removal.

But well, I guess we could workaround and continue the clean-up
on the CI-buglog side and workaround false positives instead of
simply removing this protection and going blindly forever on
the unprotected potential new inner callers...

thought on the diff above? (&& dev->power.runtime_status != RPM_SUSPENDING)

Thanks a lot,
Rodrigo.

> 
> > +	pm_runtime_get_noresume(xe->drm.dev);
> >   }
> >   /**
