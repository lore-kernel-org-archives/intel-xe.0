Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5A6D35E4B
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 20:52:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A13510E42F;
	Tue,  5 Nov 2024 20:52:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ItyqdQuQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8C4510E42F
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 20:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730839971; x=1762375971;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=b6EKjI7WGEeuDeDCJ5WJZhCuYt+6fqWEBM6TOvfXKO0=;
 b=ItyqdQuQ4GyJES7Z2rhosOBop+p4nRXCAyKcWGBLWpE0qzfBQ75ypPHZ
 FmnmUZK/xOilXWWa48onhxDWiSDDU/ULiDjDEUdPqUYp9o5pH8YENfooP
 g32J0/efQajsD3dqiS6Z2Dbk1B23E1lLJD3v22QewSeiUNfuk4v0I04R3
 idot6rfTXpmPvNWL6FdeyMZkm/xhED0rpJQnGt8gYNCKKXHO4/cjqOipk
 nysffpSy029DaST/tVSDOzy425MsEXw4uv5L82QqAQanabMh9c+T47DAI
 qC1yAdTInfRvmtZkftCfGIBp3r3F4pXtZoHprldnZQBhzhiQXtHIs5rs1 w==;
X-CSE-ConnectionGUID: g7uap6/eRymju9FbRob+Lw==
X-CSE-MsgGUID: PPx9r/23Rf6BElPs9z5zgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30464636"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="30464636"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 12:52:51 -0800
X-CSE-ConnectionGUID: KaFlfRLxScm6BymD3iyjyw==
X-CSE-MsgGUID: R2F+InkIRsqqWtX/W6As7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,261,1725346800"; d="scan'208";a="88663158"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 12:52:49 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 12:52:49 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 12:52:49 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 12:52:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6UuvXW21PZ/Ta2PwFAs8loRgaf3HMBWiUUFkTAncQp8A0WOLNk1OZIko1qO3xNaXW+7r1BQy06Qhu0RZsEdJJzS57xk17ovfDpQCNjPhWNswp4JYC3/n3RtmRZm+UKndYpyuzfFrgv+LQeXZ6LIaMyv50Kj4lG8qPIClTjfEE+jJIbr6DqT/UNxu/aSezYaYEpmisz4vwCnGVou+xP751kJ0V+ar7fQyeXuL91OMRXU1mdKaO0NhU4/qJH5wKwTb+VuHDmjnVc+rCU28o4r/K5vmHkU6RYB3i/wG5HZ6I93OAiMQRPSvW9rCqXgRPOjG7v9ccnPzEgPMGtAevB2vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b6EKjI7WGEeuDeDCJ5WJZhCuYt+6fqWEBM6TOvfXKO0=;
 b=DuNpWLdqIUCtXNHp6m054M4MpNmLoocrDwG+mLrUHPy/exYVFsJrJ4tZihx+UrwnTX4l/H2LkWipzCUaWQLolnlOKpb3gHc6MAPpENcgHMQdKDdDLSrq0IKyG6Jr6H/XuAw8Wp5BdcIwXS8r2BG69Mxxr8JwKBBwJFw68cYF+Pnv2Qcrck5ddyNNb9tQh6Y3m3Hl5MJn/SbM+bVJTAbsD1X1eIOusT8DkLjMcjyz17XUVMoEKsAJyn1OcPLHq2k5VNesvPqyKJw8iGoS6ZnTBSFvwO5URIx9TvXlDAg0hh0ZsOcBb7SZ4rhwhiMlz9KPYXEBB2Qt3oTgQVXDyGfcBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7089.namprd11.prod.outlook.com (2603:10b6:806:298::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.30; Tue, 5 Nov
 2024 20:52:39 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 20:52:39 +0000
Date: Tue, 5 Nov 2024 14:52:37 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/2] drm/xe: Fix possible exec queue leak in exec IOCTL
Message-ID: <d4yutg3q4fqvwswaftnkupehipf77iy4ohph6kd2mklm7i3jje@vwoc2ow4lqe3>
References: <20241105043524.4062774-1-matthew.brost@intel.com>
 <20241105043524.4062774-2-matthew.brost@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20241105043524.4062774-2-matthew.brost@intel.com>
X-ClientProxiedBy: MW3PR06CA0003.namprd06.prod.outlook.com
 (2603:10b6:303:2a::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7089:EE_
X-MS-Office365-Filtering-Correlation-Id: b442b675-4b60-4257-62df-08dcfddbc947
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tHnKxIv3WUOo2wIVxSuXrhJMQlQkT8NgnRKA73OKVEbR5fuArFPcdEK9AR6J?=
 =?us-ascii?Q?wQnryZ3rLYrijeZBssodcayhHE6E8cjXxbFmsaketv9LdBb45Wec6AtoeKnU?=
 =?us-ascii?Q?MLVbi290BoacUgRQLljrnGdA8pPv9J0TexJcbrQ8x4+3brN7R660HwnWdffO?=
 =?us-ascii?Q?qcn7fHOMr046HzC/Lkt+7ph8PuQaR1veaeh046NVVhizkgYQc3cMWsM/WBWt?=
 =?us-ascii?Q?RPW5yzkg3R6Pq0X1caJikpJTBt7W5cuVU+N7sIIbFoxgTpbsaFbDYPU1Zjwl?=
 =?us-ascii?Q?kcuzZFCb9m/UGL/WatW2F+qM3d2GolL6QmYf+sj1miPtVEFlMVij/99XZZKu?=
 =?us-ascii?Q?eZoJAvT/zOPWT4kjEA8xfSJzVm00r78bu0hHyOo0M/g7xPRqYrsqcTNoNyiW?=
 =?us-ascii?Q?vJfA6dmDKv3eV+BbQ/EiuuWhOpkEetK7sxfQ+VKmZOc1BqNDz/OecCwYzwsY?=
 =?us-ascii?Q?3ufe2Qv6s5xVyxOsV7k2vSAdVliiWYL3J0aXRV0IMhkIJU7RwwRXb3KVvnDr?=
 =?us-ascii?Q?IhKSeZs75vqNGT2DbOsMHBZKfCcT/uOb7E5kl2MlqTHSIv4U0Zs82n3xE0Xo?=
 =?us-ascii?Q?+MD+SDPUhnaZsJYGYAUZZBrWVJxFaZvJJJUQ8OojXc/WyudxYKYPQwYBLR+Q?=
 =?us-ascii?Q?rP7q2bmh5r4U+p3i5d/PI2ki4vUWpJyyN9c/J7B5/9MIQDT6hiA3zPyMUv54?=
 =?us-ascii?Q?lQW2rOUvCVPrOruGoDER3Wcsq6HUm8gUSjuMvWFYY141T7Xus22eJkylrG4q?=
 =?us-ascii?Q?YMfuc9iMdKbnTysj1oG2YLzN1C6GLSX/l7B7S4wvgGBalcYxh3Uz85EvZCF3?=
 =?us-ascii?Q?NaJ/unqgjiSUimWFswAJ8fYSWWfgil4PaAQR4SoJY0zSjA4IetfclesDCZQu?=
 =?us-ascii?Q?nPDGplgEVsUXCa20g+ErkuFNx0+Vdpi/uOt/wUJXSSggVHjqvv9gbgYAN/wA?=
 =?us-ascii?Q?dfXgDrF+4+VEAcyVcI969QIlOIs/xo6dds1TlRo4ECDk3L5opPBLu7kwkJ0z?=
 =?us-ascii?Q?h1/rw63CZJfx2KDM8fButomxLq33JnIobhTyOCKe33nD+snfTa7xc8Q6Pn6p?=
 =?us-ascii?Q?c1egH9ciBxLHxcsQUdJrcLnozq37juk0zcAX5kTXymyJhcvzcMNp1mudzQuL?=
 =?us-ascii?Q?EjRA1MYmScnyYwYxqYVq6zYJaFqAkz8LGvBNYu/idwwoaKucYAWeoJYfEYES?=
 =?us-ascii?Q?8CydRy6/UnIL0HPwNYq5be3oCZlAOC7qmzlYZ6vguv4LMdI1nDkTOLZC+XtK?=
 =?us-ascii?Q?3V4yoUS1PinCeMxO+/j0CL6OxRyQhz1jZ/XAS3ctPKzcD2h4KiyD1oLUh9lh?=
 =?us-ascii?Q?EYDzrut9kZpGaOtW+a4PFhy0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0G6eNdHs2a9vVAQrSkSop9etz0HKOvWuBCiHl3wNBuJ9H0tISONGslrO2Yu/?=
 =?us-ascii?Q?adBgH0aRjg/EA7STH5899A4fJzr5IntM9/mbTVqDkPbVIGKncJZjg+36RoCq?=
 =?us-ascii?Q?th7koqSGVZFfjh4N+IB+K5zc9uwpiZCipvPf7kiGTrgzZjAXT6JmN7Yg+CkT?=
 =?us-ascii?Q?6STLjwyiYyFvPVEipcQ27ys7aU6TgpKw/ycCp2YBNB2s+omq4rjLM927iBDr?=
 =?us-ascii?Q?RCfbFpy2Ckvn4nSiwSUBi6F9qJheTkZ/tm/f3LBgjSgseYZh/CE3N5z3ibz2?=
 =?us-ascii?Q?dTpNmj/NY7QnDKva6npuCF0IckZghr2A9Qn49z8ptSBNMvRAKLVoj9q8xsII?=
 =?us-ascii?Q?syYIPeftX/dTIOdi40uW5npTdzCFjIklM6EK5zjvPn/yF8F/WeMYXGd9H9Q7?=
 =?us-ascii?Q?v3SYSJUZn5126tBDN4opSDRhi7DRkbDvXZQM/weBgQ8Kd7UViJ9Sn+P8+aW2?=
 =?us-ascii?Q?nv7WV5F+Jtwc6gvvxWL92FRJ9aqsfA6fvcwgA8uHOdI0PTZISxxK7yM08rQ0?=
 =?us-ascii?Q?c8G3eKYpEpqDoAzQr3K/szoTtGiaxYeykLg6nJB6FjGTjNVIB23siu+CmkRl?=
 =?us-ascii?Q?Ha+MvY9EYKtnn0QX6QE4YMaGPcZA/V1VmTCiEtiDihAifD8WVEb8+i8YmgWY?=
 =?us-ascii?Q?mCs8LuCUr3lp3tmVvhCWxqYOzN8i4yVWxt7Oh/hfkLQCBMoO3iG7Z7rKglwq?=
 =?us-ascii?Q?uCVFkxyY1S7+HOIENKxCWudUg7DtR6qpdh6rTHbc+UKDvF8i1ydkpVkGjYN0?=
 =?us-ascii?Q?mC89aS6sh+Ks4q5qgEJekb529z6CiXrtUJx1BXIODQJBgLc02EMgafXUPynz?=
 =?us-ascii?Q?JdYdPxlVeRdx0pFitdb4c9Xebygd0MghV1OC8QjQDzAa6SNjS7gpRwbbZz15?=
 =?us-ascii?Q?j+kpQjnRRsEOLJA77J95eM86wXk3jV600kCtDFBYhVVEF6aYiiF+kA1GXMof?=
 =?us-ascii?Q?+yzcqMumzFGhsaZXYCJFM02pLB9bGmDd+2H3BnBCgT7sYs7CTO6KxWeXBnxT?=
 =?us-ascii?Q?lSII73nglPSGAck5wQJTe/JNFMKFnNt2OIKh5DFAo4lLjtQpEwL3oGHQAvL9?=
 =?us-ascii?Q?RrrEigjYHyU0AtL7vtl7Tb1q0ZiZrZk5ZmXyfdrc6cpSUkU4aBvUab9ejiiO?=
 =?us-ascii?Q?d0m+gYL1pq+yxFgNGEyZA9NRCs2rNjgKpQbTPqdXhL/Y2Qrw9qrPx0nWYl9x?=
 =?us-ascii?Q?9gJJ2JPUpEVASSndpf20zOCQqt8qwLeXG26UI5tFTcvzhH57rTt5A6kOw8E+?=
 =?us-ascii?Q?fDW/ZBkgc1p2DnLBHbKUOqHMVTXxwp/E1v+54bR7THIhUqS06MDvCc6OVXR5?=
 =?us-ascii?Q?epJ1UGg/OMzwHesGKjqYi62ej7AThiBAqTLQjD09WG+KD350YaGzTXxwg+mR?=
 =?us-ascii?Q?npCByFsHwidBIvVMPqJ2mxJy2ShiSoqdLHvsZehRkR1yV+F5VfOsbqJBFznV?=
 =?us-ascii?Q?Y0DE6aMYt0yOOJJFeFR3FQxCBDyHJAfspHKEZkxi4f8ub/K8gLmAzSKDuMRo?=
 =?us-ascii?Q?V9izyjpnBKxhuXI9y5xIUaLDIPh5hot3MVJvYmtaKyzHzJQztSIDC0HObYGr?=
 =?us-ascii?Q?sJtFgKzVzFJvhthFCz0wRNZqsMLKhsbarbu9tL+5RQiIVBtid13m2Iojq021?=
 =?us-ascii?Q?WA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b442b675-4b60-4257-62df-08dcfddbc947
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 20:52:39.7591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPdH5l75581AAfQgTizrpkgAY5b+wx9hMu5GV6P2yOaPrSwzvURhRa/ISgZDigQNBKa7myLzjW9gjijk8t/MQ8dROhYWNsvf8LXwSVvLM30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7089
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

On Mon, Nov 04, 2024 at 08:35:23PM -0800, Matthew Brost wrote:
>In a couple of places after an exec queue is looked up the exec IOCTL
>returns on input errors without dropping the exec queue ref. Fix this
>ensuring the exec queue ref is dropped on input error.
>
>Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
>Cc: stable <stable@kernel.org>
>Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
