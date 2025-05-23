Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11141C54ED0
	for <intel-xe@archiver.kernel.org>; Fri, 23 May 2025 17:17:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4A8A10E058;
	Fri, 23 May 2025 17:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ns5HfDZ8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E210E058
 for <intel-xe@lists.freedesktop.org>; Fri, 23 May 2025 17:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748020621; x=1779556621;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=E6Q6Hex56+iHog4KVfazjJfa6vt6rhtZOS48FM7Fs/k=;
 b=ns5HfDZ8frB+u/5t4cbx+fOJ0dFZ3oAIz1YwZUOdxlh89XkvhrT382Nq
 /Ugtyei9me7KUJDRHh7tEDGwW52COzUs9miz9luWXuzLm7tGMMwwQaMwd
 sWcjAURN4Y7pWuI04xmzpL++TAL30a/vWiF8BW/tAyB7WjVMDamtk0ffn
 3eBiomX5HItkeMKKJDGxzcpCQ/OV5Lj8xodAw3BJKZsTkvvREC+Sax/od
 CSFaEtcZAZ00AAdD2SNJS03vJJIWJuxh0PaZnOjUjcSaIXL0GgA6c5Cyt
 +Hz71HWANFMckkpNqYZbZQfByeePYlU9A8HqG8QqmBeRL9nfYY8hELBot w==;
X-CSE-ConnectionGUID: UqqBdijERVi4i01GLOLJIA==
X-CSE-MsgGUID: ngeM3wILQhSqArJzdTDiFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="37708935"
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="37708935"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:17:01 -0700
X-CSE-ConnectionGUID: DPhFXp9tRpa+oX6EnuJIOA==
X-CSE-MsgGUID: vaaC3iSTQAmDpJcB0cG0ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,309,1739865600"; d="scan'208";a="141107539"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 May 2025 10:17:01 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 23 May 2025 10:17:00 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 23 May 2025 10:17:00 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.64)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Fri, 23 May 2025 10:16:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QKUhVP83/pPFCf3S/8bS46H4WKiA5JQqTAHNXhPOkEdjOkWPz4Z6bV/Z2ud6uVOSUs1JuT744tlihBT+b1onLpUbSktcGTDbd5pXTrt9A07ASBvq3r6i1AGDOaF1YYKurlFfi9PnWlAUNj0AAqpKBxPHtFuMkgNt4gWDar53HzhJQpTSew4egLHbTn2VVj96nirpufw8iVWJF0Z4evRfJQzFbORo5ipVOPNTuBqtXy4+tcWlvdViMLvWCLY/Gexn9FjwSjMOSfFFGflE9pbwbEOK6UGyKlt8E2scK2hRPHWF5MDWVo1oOqHeoAVjFGa9KFkpAPXVjcZ6V7B5PsLdSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7j9kd6qn1Nib9DGgznLt4gvTr9S1r+Ofp3b2cK0ceH4=;
 b=OTfu7cYM0i4ocI2y59gvFqFqWwUD53XmCX7vk0mIi4QrDZfLeFi1Mexf9AscNeUI8Q5fFw3xluKXJLYgwuAZgwF7nQy4AYmPfzTEljQVma5FrHNVSBYsVaYDTZBKgbSPWFZsQ7uiTTC58c73fipiitUQ+NnL6yBlfS4nLWrJN1z+W37Bt5FCY+Ridt9x7XsWr7KRWkFS52lxkKABMw0fpH++pfve/V491OW9TMZoIgCz5ImRETWabLKNNr2l/RtbAtocX2nDIjgkxe9j7S9YJAtI2WbQ6h+XRQCbHk0Q0JHvopWy0oqjpftVDyJXyXt0yKDWccZuPL61++63oWceOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA1PR11MB7295.namprd11.prod.outlook.com (2603:10b6:208:428::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Fri, 23 May
 2025 17:16:50 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 17:16:50 +0000
Date: Fri, 23 May 2025 13:16:46 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v10 3/5] drm/xe/hwmon: Add support to manage PL2 though
 mailbox
Message-ID: <aDCtfnqRqs27adSg@intel.com>
References: <20250523150014.2101869-1-karthik.poosa@intel.com>
 <20250523150014.2101869-4-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250523150014.2101869-4-karthik.poosa@intel.com>
X-ClientProxiedBy: SJ0PR13CA0120.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA1PR11MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 874a0cba-4cc9-4f21-5d61-08dd9a1d9b28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xyJmi7dAQHELJoJtG7FVuXkOz/jfH196uqcFBW0uuODCHr/w+jFvJT2ny6MY?=
 =?us-ascii?Q?0EbGwTLqxnFigb9knGqdchxKMIVh6yd0vokF+TNMa9H0XkcubBKrCq0DhLhb?=
 =?us-ascii?Q?Lgoh3XHw9L20+YO2qfcEgLc14DROh4IhF5DlL3bc2tdtY9uFcOkT6P9AtYZu?=
 =?us-ascii?Q?GGTi0JGuNCHSJeW+3GeRxgwsDlyHBvocDhELJLi9l3JzFIKOQ8cSYGyp+Nrv?=
 =?us-ascii?Q?A5Kb6qeWSga1//ZbBNJZBiF4QsVfvio4Q0swaCtoTg3WCSSP3mMQC7Xs8Vvv?=
 =?us-ascii?Q?3gaLkI3LLItPvKnfZyvZxrTBDYdTcB3WD+Ofp9szjpdi+lg8TMyFbAo/rGE6?=
 =?us-ascii?Q?aOBolaFt584Or889sUxbnFT5W9dnmqfxoU6M7TDB/bfqeK0Yk1jrs2SpxpK2?=
 =?us-ascii?Q?yQjB8h4pbAQFZUt1EZRKr9SJk1YUrnXde/Yd53QncsXhB0a+A7bunvauPQFV?=
 =?us-ascii?Q?vQSm/41q0JT0MXJZlHf0LQH9s/j5DxP3pTXTPMZUVkilvj78CCd5FEKIYyAs?=
 =?us-ascii?Q?tqHEO+gnNh7VrGOMe0ENT4Td8BqD8tPFSGE6vOi8QtQJqpewt63OmviWgedR?=
 =?us-ascii?Q?L3psEotiM6tPgjdqFqVqoPeCKCa/IQwtB9rlJzJKefDG9Rd7LjdAq70gO+9T?=
 =?us-ascii?Q?2jJ6HDJuNlw41kQYYo+qbjpCetNkpQH/Mo7yL2cUqbgrHn+pZi0ysDffRmcI?=
 =?us-ascii?Q?/q2y79X/hqwEz8++qm1w1NyEEO5TXfftGVHjURe0AMFxbCMv9VvopV6f38ep?=
 =?us-ascii?Q?VMyStyz0sp9hzsUqsu7U5yPwBYiddWFtKsBfNBBIEppCH+7mefg/PvvNbItG?=
 =?us-ascii?Q?DT0swSMKFdHQ4AKSxbjQAG5Faoxi+ehMbMAHdL4IYzsxd/l3afkYbPRwSrlo?=
 =?us-ascii?Q?yfZkW2sL+KuBnOM8oP44VesBqqSzTYjhhPRROPKVCRIMFwmEd570DCeUmabN?=
 =?us-ascii?Q?89fFYbtjZz9Mk4oB0xr+QYQckt3wIM67U/HjnJ9l4E/qAZOWTM8IgBksaJRP?=
 =?us-ascii?Q?Z8QVNJelj9fxXXPdquUlh5eivO1bNNaNABTYsMKJ6DvOmaqdPoImJYfg8Dl2?=
 =?us-ascii?Q?EH8MsCwVHHI4jgWEw1d0jQsib8AjJBrqJNCgjvsrJjQNltvY29/zpuAvLfO9?=
 =?us-ascii?Q?wV3u0VUYoRZrBzcNQTb/wF3vJeeggwmyqRhOr+OoUYnI2f3wSDqi5zIZna9y?=
 =?us-ascii?Q?TL/1FdDcwU2aKMnoFNhTyUsZsUGru4O/7UvZRdNUtgB2dFUt8dMDfX5rv0i1?=
 =?us-ascii?Q?yxuyN+nIBH6md2A7vlLvyRDNQ/ynAmDmGShjTRLETuXRhM6jptWsGJACe5p/?=
 =?us-ascii?Q?UZTYLc8g2lQmFEOn4539eRSKq2KxZsTSI7ItW8PZlvnysycr10Bj0bXJ5gvu?=
 =?us-ascii?Q?5ZqnotoC5kNpB5hKiton0Ul/LMIhUwPY1wgWkU0v8fIKufjE/ciIam45Xv5O?=
 =?us-ascii?Q?g0NrbJmTmJQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mq7Y3sYFcfHWLZSfVa/+shZVuSq9Mra3/OUFeHnXWDyk7fgGUrSnBv7ZBRc7?=
 =?us-ascii?Q?8hTROUogoBw6BGW/JrpHVyWDSBJX8WH92p/R/72RwQxtTQu+lPPnpIPYSRx9?=
 =?us-ascii?Q?QSZrUT+s08lEqBhPXHhyLUuyKvBM3vlFtYtJKkdQUtUs0uPkk0ZSKk5lA+Mn?=
 =?us-ascii?Q?xRk2CdojWtns8Ebuh5On+ojyYtynQ0chModxrYT5QPxYaVPq0EUvlSvEuSHU?=
 =?us-ascii?Q?dhR3fl/qCiTKTFMvcp7sPLxw/n0ZMfXE9lF5xJHwkJriZHV3wwxJWXkfvZRb?=
 =?us-ascii?Q?/XIBxrh9+66QQ6apwamYpwrt+hMqWC5t75saICZnAbjni3SwHRqDU69xf9M4?=
 =?us-ascii?Q?t+KYgNCj8Kr2mJTKt1YPKfVezWKadB1R7XxnEqH4tELw0LfHRjwcoWBdoAZo?=
 =?us-ascii?Q?oN/kEi7nfn5VZQb/aFvCzRmerepxuktmtIJ8MiaqIwGG3vLHjfqFTTj6vPV2?=
 =?us-ascii?Q?osyjHgoyeKeuxBVfubLzCGkG91ZjZ5ANNPIBFOimelROSPlNZrbkA7PSoi4S?=
 =?us-ascii?Q?oxo7qEbNxt8LSlTsvUSnsOkyCLZBmsRp1wodRDx7KO8Qu3zRV31i1gp/jkDH?=
 =?us-ascii?Q?DzRKmVXTHdPV3BJmQ0o0+DdNpmM2y0LD4wPk9gXQlBONIRTVZyApKA1VgI02?=
 =?us-ascii?Q?iubUwlgMxZ6IFyD7LfqE/L3/iO548h2dvTxdfS2Psf/zuwvDijf+0jdvo2J3?=
 =?us-ascii?Q?pzWLPtXzomvfYxukGSmjKcZ18ueubSIJOYw8QyAXwvf02TGObVIN/0ylL9MJ?=
 =?us-ascii?Q?YXjO3D5oR9k6Acqwgk4qKQPNbzPPRipJ7R2A+YMipPhzkdpfs3by+fyW9zMP?=
 =?us-ascii?Q?4O15yu0iPZI8atqSOY2kDa9n7jAd81N+IIJSYuZprjbVGlnwS/rorkn7JfoG?=
 =?us-ascii?Q?lbMVommQPt5WLX0hnoL6IS0Js8vVOaEtkYqQq4dQz2T95B3MX5ZIDrZ5LkVx?=
 =?us-ascii?Q?N6ylZN85+aK1419fmN2HwES5SY2aFJSxPq0xH4TqRW/5pBInO3tqT9FPl90k?=
 =?us-ascii?Q?s2hwXAn/gGE5GQ8o7SxqOja7mIrwolaK33W/6Jk7mSaySPtResJtwFBbZXSI?=
 =?us-ascii?Q?8aIbMNrxQJ6MZymuFp2NYOmrLIEKlkkHt3arqKXF6EdCutHg9yzhSLXPLY66?=
 =?us-ascii?Q?wXUZsCMkEzAT8xySQESCEXNZSjHi0OAVy7ZiJgtcwcbRCer1OHU1tqrBDqUH?=
 =?us-ascii?Q?z6MJPfvQOVbjOKiQSCaswAopVT1LRek2nDYR/mLb/CBY9p3ThYvKoq2BT/NP?=
 =?us-ascii?Q?6yoBni/34HkHz8RCfuWcQkI6boE5og29XPbej4mVV+OjPmsUD9c9uxS5a3kr?=
 =?us-ascii?Q?3nbnf5LxZuuhcXYiNob67zl3LAjevyo0jmpDT28s7y/ISc4m0VLPsx/Nk5Uy?=
 =?us-ascii?Q?dDBBwoAHERHGlNXljNUN3v5S0j0KpkDUPaZeDLxjKdXDE+suU5cNx+Gk9RLD?=
 =?us-ascii?Q?hvQk1r5y9gk0ftb4a2E+lRWkLQkZXs+GNpK+C+BjJ6lXLU8k0lF/I5NTJU7s?=
 =?us-ascii?Q?Nc47eq0mEcQ1izw5p+VOzeV2nxz7OjZL+nWE0TvcCPnLxi+BEf7QxPR4Qpbz?=
 =?us-ascii?Q?Q0Ef7qPfW2FbZpwlhyc1ye5IW2m6LKIxSGws8boryW1wYSBYYTY/4q0dHAmE?=
 =?us-ascii?Q?8A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 874a0cba-4cc9-4f21-5d61-08dd9a1d9b28
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 17:16:50.6791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U1wr0nkgtNsZuBmfyoaBwshzul5MDLTvu8cB3MYzjtLoQom6lVjUX1eEQ5XwKk5JAydT45IFbOt+1mKskvBPpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7295
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

On Fri, May 23, 2025 at 08:30:12PM +0530, Karthik Poosa wrote:
> Add support to manage power limit PL2 (burst limit) through
> pcode mailbox commands.
> 
> v2:
>  - Update power1_cap definition in hwmon documentation. (Badal)
>  - Clamp PL2 power limit to BIOS default value.
> 
> v3:
>  - Activate the power label when either the PL1 or PL2 power
>    limit is enabled.
> 
> v4:
>  - Update description of pl2_on_boot variable to fix kernel-doc
>    error.
> 
> v5:
>  - Remove unnecessary drm_warn.

Please let's not merge this series and calm down here and stop trying
to rush things in.

If drm_warn is not necessary, please have it in separate commits explaining why.

Think about the use case. When the user are reading 0 because the read failed,
don't we want a splat?
Why it would only appear when debug is enabled?
In this case is zero a meaningful value?

Well, I'm not telling that one way or another is right here, but
I'm seeing that this series is trying hard to bypass CI and rush
things in. We need to calm down here please.

Think about the cases were the reads are failing. Is it really
only when it is enabled? Then shouldn't we check for the enabling
before attempt to read? no clean way to inform the user of errors?

>  - Rectify powerX_label permission to read-only on platforms
>    without mailbox power limits support.
>  - Expose powerX_cap entries only on platforms with mailbox
>    support.
> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>  .../ABI/testing/sysfs-driver-intel-xe-hwmon   | 30 ++++++
>  drivers/gpu/drm/xe/xe_hwmon.c                 | 97 +++++++++++++------
>  2 files changed, 96 insertions(+), 31 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> index 5a91dcccd3ac..dffd6443664a 100644
> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -148,3 +148,33 @@ Contact:	intel-xe@lists.freedesktop.org
>  Description:	RO. Fan 3 speed in RPM.
>  
>  		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power1_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Card burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the	limit.
> +		PL2 is greater than PL1 and its time window is lesser
> +		compared to PL1.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> +
> +What:		/sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/power2_cap
> +Date:		May 2025
> +KernelVersion:	6.15
> +Contact:	intel-xe@lists.freedesktop.org
> +Description:	RW. Package burst (PL2) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically milli seconds)
> +		exceeds this limit. A read value of 0 means that the PL2
> +		power limit is disabled, writing 0 disables the	limit.
> +		PL2 is greater than PL1 and its time window is lesser
> +		compared to PL1.
> +
> +		Only supported for particular Intel Xe graphics platforms.
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 7cfb233ac9a2..caf6a43ac92b 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -51,6 +51,14 @@ enum xe_fan_channel {
>  	FAN_MAX,
>  };
>  
> +/* Attribute index for powerX_xxx_interval sysfs entries */
> +enum sensor_attr_power {
> +	SENSOR_INDEX_PSYS_PL1,
> +	SENSOR_INDEX_PKG_PL1,
> +	SENSOR_INDEX_PSYS_PL2,
> +	SENSOR_INDEX_PKG_PL2,
> +};
> +
>  /*
>   * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
>   * not supported and below are SKU units to be used.
> @@ -72,8 +80,9 @@ enum xe_fan_channel {
>   * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
>   */
>  #define PL1_HWMON_ATTR	hwmon_power_max
> +#define PL2_HWMON_ATTR	hwmon_power_cap
>  
> -#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "PL2")
>  
>  /*
>   * Timeout for power limit write mailbox command.
> @@ -124,6 +133,9 @@ struct xe_hwmon {
>  	bool boot_power_limit_read;
>  	/** @pl1_on_boot: power limit PL1 on boot */
>  	u32 pl1_on_boot[CHANNEL_MAX];
> +	/** @pl2_on_boot: power limit PL2 on boot */
> +	u32 pl2_on_boot[CHANNEL_MAX];
> +
>  };
>  
>  static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
> @@ -151,8 +163,10 @@ static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 att
>  	/* return the value only if limit is enabled */
>  	if (attr == PL1_HWMON_ATTR)
>  		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
> +	else if (attr == PL2_HWMON_ATTR)
> +		*uval = (val1 & PWR_LIM_EN) ? val1 : 0;
>  	else if (attr == hwmon_power_label)
> -		*uval = (val0 & PWR_LIM_EN) ? 1 : 0;
> +		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
>  	else
>  		*uval = 0;
>  
> @@ -180,6 +194,8 @@ static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 at
>  
>  	if (attr == PL1_HWMON_ATTR)
>  		val0 = uval;
> +	else if (attr == PL2_HWMON_ATTR)
> +		val1 = uval;
>  	else
>  		return -EIO;
>  
> @@ -273,7 +289,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>   */
>  static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>  {
> -	u64 reg_val, min, max;
> +	u64 reg_val = 0, min, max;
>  	struct xe_device *xe = hwmon->xe;
>  	struct xe_reg rapl_limit, pkg_power_sku;
>  	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
> @@ -301,8 +317,8 @@ static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channe
>  	/* Check if PL limits are disabled. */
>  	if (!(reg_val & PWR_LIM_EN)) {
>  		*value = PL_DISABLE;
> -		drm_warn(&hwmon->xe->drm, "%s disabled for channel %d !, val 0x%016llx\n",
> -			 PWR_ATTR_TO_STR(attr), channel, reg_val);
> +		drm_dbg(&hwmon->xe->drm, "%s disabled for channel %d\n",  PWR_ATTR_TO_STR(attr),
> +			channel);
>  		goto unlock;
>  	}
>  
> @@ -327,7 +343,7 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	int ret = 0;
> -	u32 reg_val;
> +	u32 reg_val, max;
>  	struct xe_reg rapl_limit;
>  
>  	mutex_lock(&hwmon->hwmon_lock);
> @@ -355,20 +371,24 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channe
>  
>  	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>  	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> -	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>  
>  	/*
>  	 * Clamp power limit to card-firmware default as maximum, as an additional protection to
>  	 * pcode clamp.
>  	 */
>  	if (hwmon->xe->info.has_mbx_power_limits) {
> -		if (reg_val > REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel])) {
> -			reg_val = REG_FIELD_GET(PWR_LIM_VAL, hwmon->pl1_on_boot[channel]);
> +		max = (attr == PL1_HWMON_ATTR) ?
> +		       hwmon->pl1_on_boot[channel] : hwmon->pl2_on_boot[channel];
> +		max = REG_FIELD_PREP(PWR_LIM_VAL, max);
> +		if (reg_val > max) {
> +			reg_val = max;
>  			drm_dbg(&hwmon->xe->drm, "Clamping power limit to firmware default 0x%x\n",
>  				reg_val);
>  		}
>  	}
>  
> +	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
> +
>  	if (hwmon->xe->info.has_mbx_power_limits)
>  		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
>  	else
> @@ -452,8 +472,9 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  	u32 x, y, x_w = 2; /* 2 bits */
>  	u64 r, tau4, out;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>  	u32 power_attr = PL1_HWMON_ATTR;
> +
>  	int ret = 0;
>  
>  	xe_pm_runtime_get(hwmon->xe);
> @@ -506,9 +527,9 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  	u32 x, y, rxy, x_w = 2; /* 2 bits */
>  	u64 tau4, r, max_win;
>  	unsigned long val;
> -	int ret;
> -	int channel = to_sensor_dev_attr(attr)->index;
> +	int channel = (to_sensor_dev_attr(attr)->index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>  	u32 power_attr = PL1_HWMON_ATTR;
> +	int ret;
>  
>  	ret = kstrtoul(buf, 0, &val);
>  	if (ret)
> @@ -535,10 +556,8 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  	tau4 = (u64)((1 << x_w) | x) << y;
>  	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>  
> -	if (val > max_win) {
> -		drm_warn(&hwmon->xe->drm, "power_interval invalid val 0x%lx\n", val);
> +	if (val > max_win)
>  		return -EINVAL;
> -	}
>  
>  	/* val in hw units */
>  	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME) + 1;
> @@ -582,11 +601,11 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>  /* PSYS PL1 */
>  static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>  			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
> -
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PSYS_PL1);
> +/* PKG PL1 */
>  static SENSOR_DEVICE_ATTR(power2_max_interval, 0664,
>  			  xe_hwmon_power_max_interval_show,
> -			  xe_hwmon_power_max_interval_store, CHANNEL_PKG);
> +			  xe_hwmon_power_max_interval_store, SENSOR_INDEX_PKG_PL1);
>  
>  static struct attribute *hwmon_attributes[] = {
>  	&sensor_dev_attr_power1_max_interval.dev_attr.attr,
> @@ -600,7 +619,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>  	struct device *dev = kobj_to_dev(kobj);
>  	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>  	int ret = 0;
> -	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
> +	int channel = (index % 2) ? CHANNEL_PKG : CHANNEL_CARD;
>  	u32 power_attr = PL1_HWMON_ATTR;
>  	u32 uval;
>  
> @@ -609,7 +628,7 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>  	if (hwmon->xe->info.has_mbx_power_limits) {
>  		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
>  		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
> -	} else {
> +	} else if (power_attr != PL2_HWMON_ATTR) {
>  		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>  						       channel)) ? attr->mode : 0;
>  	}
> @@ -632,8 +651,9 @@ static const struct attribute_group *hwmon_groups[] = {
>  static const struct hwmon_channel_info * const hwmon_info[] = {
>  	HWMON_CHANNEL_INFO(temp, HWMON_T_LABEL, HWMON_T_INPUT | HWMON_T_LABEL,
>  			   HWMON_T_INPUT | HWMON_T_LABEL),
> -	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT,
> -			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL),
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CRIT |
> +			   HWMON_P_CAP,
> +			   HWMON_P_MAX | HWMON_P_RATED_MAX | HWMON_P_LABEL | HWMON_P_CAP),
>  	HWMON_CHANNEL_INFO(curr, HWMON_C_LABEL, HWMON_C_CRIT | HWMON_C_LABEL),
>  	HWMON_CHANNEL_INFO(in, HWMON_I_INPUT | HWMON_I_LABEL, HWMON_I_INPUT | HWMON_I_LABEL),
>  	HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, HWMON_E_INPUT | HWMON_E_LABEL),
> @@ -754,17 +774,22 @@ xe_hwmon_temp_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  static umode_t
>  xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval = 0;
> +	struct xe_reg rapl_limit;
> +	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>  
>  	switch (attr) {
>  	case hwmon_power_max:
> +	case hwmon_power_cap:
> +	case hwmon_power_label:
>  		if (hwmon->xe->info.has_mbx_power_limits) {
>  			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
> -			return (uval) ? 0664 : 0;
> -		} else {
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
> -				       channel)) ? 0664 : 0;
> +		} else if (attr != PL2_HWMON_ATTR) {
> +			rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
> +			if (xe_reg_is_valid(rapl_limit))
> +				uval = xe_mmio_read32(mmio, rapl_limit);
>  		}
> +		return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
>  	case hwmon_power_rated_max:
>  		if (hwmon->xe->info.has_mbx_power_limits)
>  			return 0;
> @@ -772,11 +797,9 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>  					       channel)) ? 0444 : 0;
>  	case hwmon_power_crit:
> -	case hwmon_power_label:
>  		if (channel == CHANNEL_CARD) {
>  			xe_hwmon_pcode_read_i1(hwmon, &uval);
> -			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
> -				0444 : 0644 : 0;
> +			return (uval & POWER_SETUP_I1_WATTS) ? 0644 : 0;
>  		}
>  		break;
>  	default:
> @@ -790,6 +813,7 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>  {
>  	switch (attr) {
>  	case hwmon_power_max:
> +	case hwmon_power_cap:
>  		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>  		return 0;
>  	case hwmon_power_rated_max:
> @@ -806,6 +830,7 @@ static int
>  xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>  {
>  	switch (attr) {
> +	case hwmon_power_cap:
>  	case hwmon_power_max:
>  		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>  	case hwmon_power_crit:
> @@ -1132,7 +1157,11 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  		if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>  						    &hwmon->pl1_on_boot[CHANNEL_CARD]) |
>  		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> -						    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
> +						    &hwmon->pl1_on_boot[CHANNEL_PKG]) |
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL2_HWMON_ATTR, CHANNEL_CARD,
> +						    &hwmon->pl2_on_boot[CHANNEL_CARD]) |
> +		    xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> +						    &hwmon->pl2_on_boot[CHANNEL_PKG])) {
>  			drm_warn(&hwmon->xe->drm,
>  				 "Failed to read power limits, check card firmware !\n");
>  		} else {
> @@ -1144,6 +1173,12 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>  			xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>  							 CHANNEL_PKG,
>  							 hwmon->pl1_on_boot[CHANNEL_PKG]);
> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +							 CHANNEL_CARD,
> +							 hwmon->pl2_on_boot[CHANNEL_CARD]);
> +			xe_hwmon_pcode_write_power_limit(hwmon, PL2_HWMON_ATTR,
> +							 CHANNEL_PKG,
> +							 hwmon->pl2_on_boot[CHANNEL_PKG]);
>  			hwmon->scl_shift_power = PWR_UNIT;
>  			hwmon->scl_shift_energy = ENERGY_UNIT;
>  			hwmon->scl_shift_time = TIME_UNIT;
> -- 
> 2.25.1
> 
