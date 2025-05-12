Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF68C3ABCB
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 21:31:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BE0310E072;
	Mon, 12 May 2025 21:31:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lm4t2qCS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038E210E072
 for <intel-xe@lists.freedesktop.org>; Mon, 12 May 2025 21:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747085515; x=1778621515;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UDeCXwgLtM4On9plZ2VJX3Jg9U8Kp+LNG7w7UsCxQ2Y=;
 b=lm4t2qCSfwWq/bu2bsj7HraCzRyXRqdu0eWW8RpOwqNQEqB4o/5y++a6
 75m3AIagCnWGfm0k6HqigJKg9KZatDVXonPuGprz7A0G73CCxWEyx8yJQ
 lLtyMltAFs09Kkez2nHgV0G/msJQbFHHKXRWWrCZQ1NssJ9cwH1lhAf52
 6lFkqp+nGp9HvS/WViMEiQsGp3Dd9z32WVEuNnxHZjty8Wi6N4vrLKff7
 7SwdGSP1NOXNuwHw0BXvcenTXTCmq6QhojNZSIUYnDMGjSgdkvHD7G53d
 oQfawiTU+OUtK+k4xo/n55vW1ybPzWmo6vfcZwY1OdaQM5ZH0mzuEVtoB Q==;
X-CSE-ConnectionGUID: wXg6SdJbSZGtWVjcsS4oDQ==
X-CSE-MsgGUID: p44JUqJhQoC+x55YtJkxZQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48832704"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="48832704"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:31:55 -0700
X-CSE-ConnectionGUID: GDbUXz66QWuQsxEgc+isDQ==
X-CSE-MsgGUID: QO4s8C6SRfi9dkbAJkUo1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; d="scan'208";a="142367621"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 May 2025 14:31:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 12 May 2025 14:31:52 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 12 May 2025 14:31:52 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 12 May 2025 14:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cE4ZWH2r8J5tiaabsngYSakXUNmLrvDaPWtHw4PDsZj4qd07kGPSudH1pBsKNDpZbrqstnXpzqmBp/9HgfzN3S6xcXgEZ71p0tXK6z0oJo8GUYtGeVtKvCz31UxnjP09Y00cr59ZvRjCXTxQfVAOksF2N11ffnUbarKUspb0wpfvMPBwQ62+vWWoho3OVWpZy2vylfM7Fv6RXTA8UU07ByVcVQl+bADbVx33hzdZ8eV1qvms6LNBtIVxMVdtqSy+T+/oMMrZZ4o7ghvBiaPxYc7CE1YIYaYqzgPgY/6AYzFKJj2cwIQH6QxMqKhhmEeF08anwwH7db9rDmacFcHf/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DVIe6qS5FwOhPk4RBIoEICosmeshP5fxAc0sLpBlCkI=;
 b=pxUu1IbQiGlsZ2zei9bFWX6fSQNLFNVtiCPVfqDX3CPV1wDI7ZAF2lzY8AwGGxzv+zj6AcNhv8wEJjpIeTL08j7nmUfvJQvD1qJqC5gCMtNwCMF4l4iJk3BEVpOQKb096g42cLhYASQAx5dmt1CZ7qR2wuT4z5roL+/dbSVj0bwr/ZI/8L3UDvG3Q6hfF2uszEirBtZOZ0rOjKl6fMVemg9KZ0LjHCI/QfGqrNVkQbcuh3OCXwnNYO21g9i+qe7Dw0U5HoxRV98n+uEfjw51bhgujD+vjudtz3gBWPeQXhI8t7yxzJWdyAiIDx9X5SoVTurVJXFlzHYjL6SeFXr+Ig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH3PPF3DE9570BE.namprd11.prod.outlook.com (2603:10b6:518:1::d18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Mon, 12 May
 2025 21:31:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8699.026; Mon, 12 May 2025
 21:31:18 +0000
Date: Mon, 12 May 2025 14:32:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v7 19/20] drm/xe/svm: Implement prefetch support for SVM
 ranges
Message-ID: <aCJo/dEGUd+Fjkll@lstrano-desk.jf.intel.com>
References: <20250512164740.466852-1-himal.prasad.ghimiray@intel.com>
 <20250512164740.466852-20-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250512164740.466852-20-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR04CA0342.namprd04.prod.outlook.com
 (2603:10b6:303:8a::17) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH3PPF3DE9570BE:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a80edf2-5e13-4768-97dc-08dd919c5513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+zclD/f8qDMoq1ukKvb0gh53COkGUrrBXiluIIPs2FWZ6lPVp7UFxNuNmk?=
 =?iso-8859-1?Q?v6APb7pFCQPK8/aFyI0xd3xukUaIPmXklxIPJ5pra66tuVhZpPbOPidRPO?=
 =?iso-8859-1?Q?M3KN7JFRjMDIpN+p67qfjf4itZIzJSEPXjJcmE5VzZ4mcBhpDb2E4hP2tb?=
 =?iso-8859-1?Q?m+kVrQh0abfClR8EvyeNAderJyBRxaw9xGVzarBAFwFtrA0VmGdEw3H91C?=
 =?iso-8859-1?Q?+VZm8YL58jd515xDx1KcQCWcBr+zeD+eWTcHdR5W/6qkrIL3n6dB0ZBcsh?=
 =?iso-8859-1?Q?C6pDxhawk52PAAnolh5Mx7yl4NR61r/GxsR61U7rFRnV9sGJaHmC2MlJUp?=
 =?iso-8859-1?Q?b9uJZ4NkMNwGuCdwapN7cakztu7o3LUIHhd+53Nz8DdTxc/g1zrcqaP9oj?=
 =?iso-8859-1?Q?Vr4dKu0IMotD0NEAJdoisAt80d5C97Qr6lU2+6P5EHeFtZ6WgtH9gPhpvF?=
 =?iso-8859-1?Q?+3wfT7hUx9SXk2rajIagmw4Q5AR4EwTD7/9qcv1cMGiG6ILNV6n7iexZ1v?=
 =?iso-8859-1?Q?Ct6Bop+PlULMojCCtydGKO5jcj3RVvw3owo7IQHbiW/iix+0gu3DrOib+D?=
 =?iso-8859-1?Q?l8T11E+ikQAV184qh9AwgksqWNSQHJ68Tyq79EPJWVOHCg0etBOFXbBa6a?=
 =?iso-8859-1?Q?ezjdZgGdA4cwLlFwUOWNAuFCXcRe5AR50B6ziPe3e/AWpUOGAMOVARlBG8?=
 =?iso-8859-1?Q?Gi1lvy9afBZ1qnhYj3lYSKyph9wQZ0zEIZ8hBMt+/SqJ94QvnV6MD6nb2E?=
 =?iso-8859-1?Q?ggKGGnPjNnBhPtRGlvg4ajUre7frimeyGIY67hGDZl3J7XukSQzBaddOkv?=
 =?iso-8859-1?Q?yw55R3c3fuEWaLxPnlGdZYs2yyfH7LHXI47zf8sHdjl3EdaB51AnG78tsi?=
 =?iso-8859-1?Q?sCnrVZZ9uDzMsxuQbXNhm0zfFmmylEC8NnsfASLBcdie/SsoKz91XPVj4D?=
 =?iso-8859-1?Q?598rAw/ywboOcv0f2l08mclqcTqqn3U7o5jXg/98ZaqbhlHG/38GmwwHeM?=
 =?iso-8859-1?Q?lSwUI5ylc0hAejSbrc7Jyso5lPtJOVndlDJyDXQkXnPy1Dwmk87+7NYXaG?=
 =?iso-8859-1?Q?VWAuaS3r/C3id5MSGChUi66L4nfyw35f5rAgLlt5+oO7JZ1KLKuXRMXxNi?=
 =?iso-8859-1?Q?A/ws47fIhXRY5tKQlKJlnfcOxV2wN/jWaR/bE5IsAx2PivXo5o8k0fCYkt?=
 =?iso-8859-1?Q?f/QHsybVLosbBmbdGj61zTv0JOuASkLfKUT8hBmu2TEmugfO2jCRLg9Kzh?=
 =?iso-8859-1?Q?ZSKGwhj4w5ied3s8WyUlJKFJI/SzefTzcwHi5yAcMhubC3S6iAKm/Q9aD6?=
 =?iso-8859-1?Q?9Dq+iitt+opM77ktFiwYSk19OoFxbijULMLOKOGZZHGjyhpk5ObbVyEAn+?=
 =?iso-8859-1?Q?BIJ4+ULWwssYLm3nSvYo90k57kBtr0u6xAEukseB7Tsu03YrBN66iOnVrh?=
 =?iso-8859-1?Q?piP/C0E3wKKQouSSQqQhjPyNHsypKax/tWup+eAiR9H4MO85qkumF7j+UC?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1Suu4NRU2y1tG8LWOW+VnK6P0lcScP81v8tEYEOuti6ycRsGrzX823rAVp?=
 =?iso-8859-1?Q?VPbSbCyfp6JXhefsDZv+xhYCu5jnTfPS/99CA5h/Vv2hMYJ74LEGgwHAHA?=
 =?iso-8859-1?Q?vd6cVdJJc/0PbDw/BGpLfbRaiegX9EOXKIBUAmRc7hI/1Np/MHGgksjtUc?=
 =?iso-8859-1?Q?cyMbMze+dIE12Q2jgZlqU3w2DHLKgjKBOrXRJOsSLqcLiG4tJeCJnJhRNu?=
 =?iso-8859-1?Q?gEXK0nO95oSOwHNZG/ilwECiPzbtYGS4IY8Bu1BcOzKzHAgYR0c15T4B2T?=
 =?iso-8859-1?Q?oRvynZuG8NSCgTN420T1YsmC8mnNjTlCvG7HnIXb2YAgYdz3msRZZKMZFS?=
 =?iso-8859-1?Q?vr1NsLBe5Qg49LrGouI95L3EczPYjoFTr77gkAOV5XPznu4BHNHi8GWr5k?=
 =?iso-8859-1?Q?PKn+y/Ch7ZD9uHpWnH3u+pTXovEXKf97CzfNZfLh2unZowV7VkoG4uQiLF?=
 =?iso-8859-1?Q?0e5+uPXF1jULuXanm7E2cNiiUwRYm75qslXKWPT6tImqqxx5mbJQAWOFWM?=
 =?iso-8859-1?Q?3VRE7Fmp0N8PRSgWQqCEI4LrSsBqX1i2zD7eyy2UrEHVjbgKgL2TYsQmGM?=
 =?iso-8859-1?Q?4G82oTi3sltWFG9at4OO7r8txYP/08msjoAEBck4xQXZINiVNXGsd/cXwL?=
 =?iso-8859-1?Q?n7sq2hNDdVBr+i1YZltbd9dokdhT2Jt4ZRMO6LCSAdo7pcBJb/N+LzMa0c?=
 =?iso-8859-1?Q?RZEOC7MiiKC0uwilCd/RIz6xjOYuvw2eNctmyePZXtr+IX13n7lhLCCMY2?=
 =?iso-8859-1?Q?v1RwI1of0cAaWwaYPw0Jb6JDRoBr7+R79lKfeqjuKJYMj8g21iQTNQVH3a?=
 =?iso-8859-1?Q?MZAX7w/j0OwLMntXWXKtTr1bxlOPtOC7OLZ7lvtFgAbUFv7u8yR3i66dAR?=
 =?iso-8859-1?Q?OXF+LEJOeDPhM3CScrMIFHHYgTNNL7IuPSvVJF+DEIUCIFwR0CpDujrXv4?=
 =?iso-8859-1?Q?UX2dMgzbm4Uc0CdWWao1cRE7ncd+UyyKZ7bPAjgnCfGGh9myzlDf3XVZ1Z?=
 =?iso-8859-1?Q?vmcVtGhjT/PFQNpRqSyWznzMPpN7QdkxIVws9Qq63mValgY9FtMHT29pY+?=
 =?iso-8859-1?Q?cLLjonTO2WByurGKDTRAcIuUFE+P6faBhCqNL0VgW/Jh/E/+YRwZUEV5ug?=
 =?iso-8859-1?Q?jKHnTtv8EncNEMB+LD3tJGWu5IHra4FaF1aTFjA3vqVphAHA/B4Y0zgOBb?=
 =?iso-8859-1?Q?lClL6xwhl2y8b68lkZmTjR48LvdZLRfemklnAfdSF1ad+XSsNJhcphHcYL?=
 =?iso-8859-1?Q?fTrgqrFpNK+xJ+FYko5PW8rMFIvxlevCwPUXSI9LIVCeVBuOKnpxWp8uCe?=
 =?iso-8859-1?Q?wCdaJSmBz3GeEKM7qQlErNHhiQWc3D0b6XyiTeOGMcKAlQ1KhnfnDoav+n?=
 =?iso-8859-1?Q?IXKnGfOef+mNhwU2SFALaHxEaTCetg8hUqDKdziOk7quTAH2Uxj2S/VorJ?=
 =?iso-8859-1?Q?3NrVLDcE2pmZ7GRy5ZukScmaZMHVdnzZBjTy2YCs94y1UFMLc7cQYlA4ie?=
 =?iso-8859-1?Q?Ea7kWueu8XNA6kYRUuIKJyQqWwLiDR3u49gyeAO3FmTjeK9FsSvXrHITgJ?=
 =?iso-8859-1?Q?lRtgdv6vWHv+3uyb1OBTYa3zhyhHCjZP3n6dzyhCEQNqfwgUsR86B+IZkX?=
 =?iso-8859-1?Q?w399A92wC2TZH3UofOgQ6ZtMTjDf1O9IufY0LAsfG2Jhq23x6uZRhR9Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a80edf2-5e13-4768-97dc-08dd919c5513
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2025 21:31:18.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h2vnTpt9JZRbzdZaJBv9Qq/cWQ296C2m7KKIbv2LcYrc1heVOVONLFZxLHQ+viVrVvx1RCiyWWrmPUfl1sNN+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF3DE9570BE
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

On Mon, May 12, 2025 at 10:17:39PM +0530, Himal Prasad Ghimiray wrote:
> This commit adds prefetch support for SVM ranges, utilizing the
> existing ioctl vm_bind functionality to achieve this.
> 
> v2: rebase
> 
> v3:
>    - use xa_for_each() instead of manual loop
>    - check range is valid and in preferred location before adding to
>      xarray
>    - Fix naming conventions
>    - Fix return condition as -ENODATA instead of -EAGAIN (Matthew Brost)
>    - Handle sparsely populated cpu vma range (Matthew Brost)
> 
> v4:
>    - fix end address to find next cpu vma in case of -ENOENT
> 
> v5:
>    - Move find next vma logic to drm gpusvm layer
>    - Avoid mixing declaration and logic
> 
> v6:
>   - Use new function names
>   - Move eviction logic to prefetch_ranges
> 
> v7:
>   - devmem_only assigned 0
>   - nit address
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/xe/xe_pt.c |  58 ++++++++---
>  drivers/gpu/drm/xe/xe_vm.c | 198 +++++++++++++++++++++++++++++++++++--
>  2 files changed, 235 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> index 4d248d06bfa5..c9c41fbe125c 100644
> --- a/drivers/gpu/drm/xe/xe_pt.c
> +++ b/drivers/gpu/drm/xe/xe_pt.c
> @@ -1458,6 +1458,7 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	struct xe_vm *vm = pt_update->vops->vm;
>  	struct xe_vma_ops *vops = pt_update->vops;
>  	struct xe_vma_op *op;
> +	unsigned long i;
>  	int err;
>  
>  	err = xe_pt_pre_commit(pt_update);
> @@ -1467,20 +1468,35 @@ static int xe_pt_svm_pre_commit(struct xe_migrate_pt_update *pt_update)
>  	xe_svm_notifier_lock(vm);
>  
>  	list_for_each_entry(op, &vops->list, link) {
> -		struct xe_svm_range *range = op->map_range.range;
> +		struct xe_svm_range *range = NULL;
>  
>  		if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE)
>  			continue;
>  
> -		xe_svm_range_debug(range, "PRE-COMMIT");
> +		if (op->base.op == DRM_GPUVA_OP_PREFETCH) {
> +			xe_assert(vm->xe,
> +				  xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.prefetch.va)));
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				xe_svm_range_debug(range, "PRE-COMMIT");
>  
> -		xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> -		xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +				if (!xe_svm_range_pages_valid(range)) {
> +					xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +					xe_svm_notifier_unlock(vm);
> +					return -ENODATA;
> +				}
> +			}
> +		} else {
> +			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
> +			xe_assert(vm->xe, op->subop == XE_VMA_SUBOP_MAP_RANGE);
> +			range = op->map_range.range;
>  
> -		if (!xe_svm_range_pages_valid(range)) {
> -			xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> -			xe_svm_notifier_unlock(vm);
> -			return -EAGAIN;
> +			xe_svm_range_debug(range, "PRE-COMMIT");
> +
> +			if (!xe_svm_range_pages_valid(range)) {
> +				xe_svm_range_debug(range, "PRE-COMMIT - RETRY");
> +				xe_svm_notifier_unlock(vm);
> +				return -EAGAIN;
> +			}
>  		}
>  	}
>  
> @@ -2065,11 +2081,20 @@ static int op_prepare(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (xe_vma_is_cpu_addr_mirror(vma))
> -			break;
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range;
> +			unsigned long i;
>  
> -		err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> -		pt_update_ops->wait_vm_kernel = true;
> +			xa_for_each(&op->prefetch_range.range, i, range) {
> +				err = bind_range_prepare(vm, tile, pt_update_ops,
> +							 vma, range);
> +				if (err)
> +					return err;
> +			}
> +		} else {
> +			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
> +			pt_update_ops->wait_vm_kernel = true;
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> @@ -2275,9 +2300,16 @@ static void op_commit(struct xe_vm *vm,
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
>  
> -		if (!xe_vma_is_cpu_addr_mirror(vma))
> +		if (xe_vma_is_cpu_addr_mirror(vma)) {
> +			struct xe_svm_range *range = NULL;
> +			unsigned long i;
> +
> +			xa_for_each(&op->prefetch_range.range, i, range)
> +				range_present_and_invalidated_tile(vm, range, tile->id);
> +		} else {
>  			bind_op_commit(vm, tile, pt_update_ops, vma, fence,
>  				       fence2, false);
> +		}
>  		break;
>  	}
>  	case DRM_GPUVA_OP_DRIVER:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index cb79a37d2132..5504faef4019 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -798,10 +798,33 @@ static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_binds)
>  }
>  ALLOW_ERROR_INJECTION(xe_vma_ops_alloc, ERRNO);
>  
> +static void xe_vma_svm_prefetch_op_fini(struct xe_vma_op *op)
> +{
> +	struct xe_vma *vma;
> +
> +	vma = gpuva_to_vma(op->base.prefetch.va);
> +
> +	if (op->base.op == DRM_GPUVA_OP_PREFETCH && xe_vma_is_cpu_addr_mirror(vma))
> +		xa_destroy(&op->prefetch_range.range);
> +}
> +
> +static void xe_vma_svm_prefetch_ops_fini(struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return;
> +
> +	list_for_each_entry(op, &vops->list, link)
> +		xe_vma_svm_prefetch_op_fini(op);
> +}
> +
>  static void xe_vma_ops_fini(struct xe_vma_ops *vops)
>  {
>  	int i;
>  
> +	xe_vma_svm_prefetch_ops_fini(vops);
> +
>  	for (i = 0; i < XE_MAX_TILES_PER_DEVICE; ++i)
>  		kfree(vops->pt_update_ops[i].ops);
>  }
> @@ -2248,13 +2271,25 @@ static bool __xe_vm_needs_clear_scratch_pages(struct xe_vm *vm, u32 bind_flags)
>  	return true;
>  }
>  
> +static void xe_svm_prefetch_gpuva_ops_fini(struct drm_gpuva_ops *ops)
> +{
> +	struct drm_gpuva_op *__op;
> +
> +	drm_gpuva_for_each_op(__op, ops) {
> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
> +
> +		xe_vma_svm_prefetch_op_fini(op);
> +	}
> +}
> +
>  /*
>   * Create operations list from IOCTL arguments, setup operations fields so parse
>   * and commit steps are decoupled from IOCTL arguments. This step can fail.
>   */
>  static struct drm_gpuva_ops *
> -vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
> -			 u64 bo_offset_or_userptr, u64 addr, u64 range,
> +vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> +			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> +			 u64 addr, u64 range,
>  			 u32 operation, u32 flags,
>  			 u32 prefetch_region, u16 pat_index)
>  {
> @@ -2262,6 +2297,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  	struct drm_gpuva_ops *ops;
>  	struct drm_gpuva_op *__op;
>  	struct drm_gpuvm_bo *vm_bo;
> +	u64 range_end = addr + range;
>  	int err;
>  
>  	lockdep_assert_held_write(&vm->lock);
> @@ -2323,14 +2359,77 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_bo *bo,
>  			op->map.invalidate_on_bind =
>  				__xe_vm_needs_clear_scratch_pages(vm, flags);
>  		} else if (__op->op == DRM_GPUVA_OP_PREFETCH) {
> -			op->prefetch.region = prefetch_region;
> -		}
> +			struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +			struct xe_svm_range *svm_range;
> +			struct drm_gpusvm_ctx ctx;

Nit: In both cases to future proof do this:

struct drm_gpusvm_ctx ctx = {};

Then no need to zero out fields.

With that fixed:
Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> +			struct xe_tile *tile;
> +			u8 id, tile_mask = 0;
> +			u32 i;
> +
> +			if (!xe_vma_is_cpu_addr_mirror(vma)) {
> +				op->prefetch.region = prefetch_region;
> +				break;
> +			}
> +
> +			ctx.read_only = xe_vma_read_only(vma);
> +			ctx.devmem_possible = IS_DGFX(vm->xe) &&
> +					      IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +
> +			for_each_tile(tile, vm->xe, id)
> +				tile_mask |= 0x1 << id;
> +
> +			xa_init_flags(&op->prefetch_range.range, XA_FLAGS_ALLOC);
> +			op->prefetch_range.region = prefetch_region;
> +			op->prefetch_range.ranges_count = 0;
> +alloc_next_range:
> +			svm_range = xe_svm_range_find_or_insert(vm, addr, vma, &ctx);
> +
> +			if (PTR_ERR(svm_range) == -ENOENT) {
> +				u64 ret = xe_svm_find_vma_start(vm, addr, range_end, vma);
> +
> +				addr = ret == ULONG_MAX ? 0 : ret;
> +				if (addr)
> +					goto alloc_next_range;
> +				else
> +					goto print_op_label;
> +			}
> +
> +			if (IS_ERR(svm_range)) {
> +				err = PTR_ERR(svm_range);
> +				goto unwind_prefetch_ops;
> +			}
> +
> +			if (xe_svm_range_validate(vm, svm_range, tile_mask, !!prefetch_region))
> +				goto check_next_range;
> +
> +			err = xa_alloc(&op->prefetch_range.range,
> +				       &i, svm_range, xa_limit_32b,
> +				       GFP_KERNEL);
>  
> +			if (err)
> +				goto unwind_prefetch_ops;
> +
> +			op->prefetch_range.ranges_count++;
> +			vops->flags |= XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH;
> +check_next_range:
> +			if (range_end > xe_svm_range_end(svm_range) &&
> +			    xe_svm_range_end(svm_range) < xe_vma_end(vma)) {
> +				addr = xe_svm_range_end(svm_range);
> +				goto alloc_next_range;
> +			}
> +		}
> +print_op_label:
>  		print_op(vm->xe, __op);
>  	}
>  
>  	return ops;
> +
> +unwind_prefetch_ops:
> +	xe_svm_prefetch_gpuva_ops_fini(ops);
> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
> +	return ERR_PTR(err);
>  }
> +
>  ALLOW_ERROR_INJECTION(vm_bind_ioctl_ops_create, ERRNO);
>  
>  static struct xe_vma *new_vma(struct xe_vm *vm, struct drm_gpuva_op_map *op,
> @@ -2645,8 +2744,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
>  					return err;
>  			}
>  
> -			if (!xe_vma_is_cpu_addr_mirror(vma))
> +			if (xe_vma_is_cpu_addr_mirror(vma))
> +				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask,
> +							      op->prefetch_range.ranges_count);
> +			else
>  				xe_vma_ops_incr_pt_update_ops(vops, op->tile_mask, 1);
> +
>  			break;
>  		default:
>  			drm_warn(&vm->xe->drm, "NOT POSSIBLE");
> @@ -2772,6 +2875,57 @@ static int check_ufence(struct xe_vma *vma)
>  	return 0;
>  }
>  
> +static int prefetch_ranges(struct xe_vm *vm, struct xe_vma_op *op)
> +{
> +	bool devmem_possible = IS_DGFX(vm->xe) && IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR);
> +	struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> +	int err = 0;
> +
> +	struct xe_svm_range *svm_range;
> +	struct drm_gpusvm_ctx ctx;
> +	struct xe_tile *tile;
> +	unsigned long i;
> +	u32 region;
> +
> +	if (!xe_vma_is_cpu_addr_mirror(vma))
> +		return 0;
> +
> +	region = op->prefetch_range.region;
> +
> +	ctx.read_only = xe_vma_read_only(vma);
> +	ctx.devmem_possible = devmem_possible;
> +	ctx.check_pages_threshold = devmem_possible ? SZ_64K : 0;
> +	ctx.devmem_only = 0;
> +	ctx.timeslice_ms = 0;
> +
> +	/* TODO: Threading the migration */
> +	xa_for_each(&op->prefetch_range.range, i, svm_range) {
> +		if (!region)
> +			xe_svm_range_migrate_to_smem(vm, svm_range);
> +
> +		if (xe_svm_range_needs_migrate_to_vram(svm_range, vma, region)) {
> +			tile = &vm->xe->tiles[region_to_mem_type[region] - XE_PL_VRAM0];
> +			err = xe_svm_alloc_vram(vm, tile, svm_range, &ctx);
> +			if (err) {
> +				drm_dbg(&vm->xe->drm, "VRAM allocation failed, retry from userspace, asid=%u, gpusvm=%p, errno=%pe\n",
> +					vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +				return -ENODATA;
> +			}
> +		}
> +
> +		err = xe_svm_range_get_pages(vm, svm_range, &ctx);
> +		if (err) {
> +			if (err == -EOPNOTSUPP || err == -EFAULT || err == -EPERM)
> +				err = -ENODATA;
> +			drm_dbg(&vm->xe->drm, "Get pages failed, asid=%u, gpusvm=%p, errno=%pe\n",
> +				vm->usm.asid, &vm->svm.gpusvm, ERR_PTR(err));
> +			return err;
> +		}
> +	}
> +
> +	return err;
> +}
> +
>  static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  			    struct xe_vma_op *op)
>  {
> @@ -2809,7 +2963,12 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	case DRM_GPUVA_OP_PREFETCH:
>  	{
>  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
> -		u32 region = op->prefetch.region;
> +		u32 region;
> +
> +		if (xe_vma_is_cpu_addr_mirror(vma))
> +			region = op->prefetch_range.region;
> +		else
> +			region = op->prefetch.region;
>  
>  		xe_assert(vm->xe, region <= ARRAY_SIZE(region_to_mem_type));
>  
> @@ -2828,6 +2987,25 @@ static int op_lock_and_prep(struct drm_exec *exec, struct xe_vm *vm,
>  	return err;
>  }
>  
> +static int vm_bind_ioctl_ops_prefetch_ranges(struct xe_vm *vm, struct xe_vma_ops *vops)
> +{
> +	struct xe_vma_op *op;
> +	int err;
> +
> +	if (!(vops->flags & XE_VMA_OPS_FLAG_HAS_SVM_PREFETCH))
> +		return 0;
> +
> +	list_for_each_entry(op, &vops->list, link) {
> +		if (op->base.op  == DRM_GPUVA_OP_PREFETCH) {
> +			err = prefetch_ranges(vm, op);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
>  					   struct xe_vm *vm,
>  					   struct xe_vma_ops *vops)
> @@ -3477,7 +3655,7 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  		u32 prefetch_region = bind_ops[i].prefetch_mem_region_instance;
>  		u16 pat_index = bind_ops[i].pat_index;
>  
> -		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i], obj_offset,
> +		ops[i] = vm_bind_ioctl_ops_create(vm, &vops, bos[i], obj_offset,
>  						  addr, range, op, flags,
>  						  prefetch_region, pat_index);
>  		if (IS_ERR(ops[i])) {
> @@ -3510,6 +3688,10 @@ int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>  	if (err)
>  		goto unwind_ops;
>  
> +	err = vm_bind_ioctl_ops_prefetch_ranges(vm, &vops);
> +	if (err)
> +		goto unwind_ops;
> +
>  	fence = vm_bind_ioctl_ops_execute(vm, &vops);
>  	if (IS_ERR(fence))
>  		err = PTR_ERR(fence);
> @@ -3579,7 +3761,7 @@ struct dma_fence *xe_vm_bind_kernel_bo(struct xe_vm *vm, struct xe_bo *bo,
>  
>  	xe_vma_ops_init(&vops, vm, q, NULL, 0);
>  
> -	ops = vm_bind_ioctl_ops_create(vm, bo, 0, addr, bo->size,
> +	ops = vm_bind_ioctl_ops_create(vm, &vops, bo, 0, addr, bo->size,
>  				       DRM_XE_VM_BIND_OP_MAP, 0, 0,
>  				       vm->xe->pat.idx[cache_lvl]);
>  	if (IS_ERR(ops)) {
> -- 
> 2.34.1
> 
