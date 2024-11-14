Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B9ED68B31
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 15:26:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21A6010E7F9;
	Thu, 14 Nov 2024 15:26:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HxxAAryz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0729710E7F9
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 15:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731597994; x=1763133994;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=F9ceTV/Zwz6s7APHBa7nX9w9n7/tQbt+1+w2VA/zNuE=;
 b=HxxAAryzLaYfzEcnpgU04y9vzzUickvnD9lmwtTtRadcWbaMI7q9NFOU
 iBM3CB3JE2EVwcB6g0igP/QuCwBLr/EB4i2CXMaRYsSvxwCqKILPqCMZw
 MFyVYb71wlZPwutr0Yiylh9LuuxrMAjjinjPe5d+JtP2NminS8T4cIeVg
 SkEB400oTYXSPNc4G8swWA1yD9pW2lV4LRSMDanJ/49qd3MyoNsb4EkzQ
 VZMySPr0N+psFX0QUF8IJOZZR0fU/Gfp8ncBpmevnZuvlt/NZyDkj8Ua8
 p8nRWz9b7t1FcY7ROVeQYj+4OjONGfZbauiZ2Wuz3wg6fYxIXtaTYhjxO w==;
X-CSE-ConnectionGUID: 7wpRQ+PSSeSwGoAlMBvQoA==
X-CSE-MsgGUID: za7v6hAGSm6a69sFEOBt/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31448659"
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="31448659"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 07:26:34 -0800
X-CSE-ConnectionGUID: Ls1LoJOZT3KhiEgJhd+O8Q==
X-CSE-MsgGUID: ThCoAwOeRviuYqAQU+D3+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,154,1728975600"; d="scan'208";a="125755036"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 07:26:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 07:26:33 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 07:26:33 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 07:26:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=be7Bz9dqsr0xkvIu87GzGE6JIfJaXsXsRmWa00UbNK91E//X4HhQfUDisCpEwHSnDDjEGca96VkpjntCOtU9uON/v7R2MreZuoMfOatyhzLouTFFdyMzFJLFyBE6WS6vbfWpWOc97CWGkhG9dbx78IGwQzrfCxcN/B5PZgvZoAqnFB3t3IQt82Oo2qqbahiArADbah9F1ZXMGqZS/Vs3XMYL6cDROrL/V1JBKZeAETd75lwaOk0GdECVjvzzDH6Lms8M6sOjuEc8jpCicY1W7S+S1Do9I/n/MhoEHFJS2dj7/u/rFM298DZbBBAmmPELgX6uVy30aE6H8O5USbrwWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F9ceTV/Zwz6s7APHBa7nX9w9n7/tQbt+1+w2VA/zNuE=;
 b=fa+nUIEV+Aii1HbjcBGBPuKxT4C0bcIYiOElk/Y+1W9pf2woAq645U63iADRHDiTOatG+hspACOTxInzXO6ETCUo73MZ0aflPe6O+NLmv2iX7/dTQccevE1cj+/q0796IMhfU1CPG5R/nDrdINgaZiMEHQw5MLDhl456z39lX8qmU+n0MSwfegI/3EsMHrTCH2poNhsl1aK6P5JPx3NXFyXwooDKUkNWC942WhMyzHpsj6jeQn3xHbIrjlbvhkKJVOmSwfklFuvPZfbECFUMJ5mTTDIlcdov272pO0JZ+08hl8Vn5Axb+6qSmtZaeJVYXYlzzOtoRhwTbfJebsX2KA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH0PR11MB7421.namprd11.prod.outlook.com (2603:10b6:510:281::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Thu, 14 Nov
 2024 15:26:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.8158.013; Thu, 14 Nov 2024
 15:26:28 +0000
Date: Thu, 14 Nov 2024 09:26:24 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>, "Rodrigo
 Vivi" <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/pmu: Enable PMU interface
Message-ID: <4zdx4suc2xs75bz7sjbvtikmvms52txhwoydnlui5z2jfz7x3s@6auh6l4le55z>
References: <20241113174242.24787-1-vinay.belgaumkar@intel.com>
 <20241113174242.24787-2-vinay.belgaumkar@intel.com>
 <lnvrm7guru3ujx7kt4irhvjb3wc3vcfzzhko3h5zkvgdig6znm@xb56nnaemwi5>
 <85bjyixwlr.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <85bjyixwlr.wl-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW2PR16CA0014.namprd16.prod.outlook.com (2603:10b6:907::27)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH0PR11MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 17112804-4ff4-42df-cf50-08dd04c0b54e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2m/JJ1l/1ypb/PmxdDZOJCVtxQXN1/9hpXzu3/i6LWdpJknuCYvirIi8+ZBr?=
 =?us-ascii?Q?9Fx4InqVIOBaS3T8pVIT5CTkbAJ/p5nc4BvPeQz3lD1M0U8WJg74UzbsKLhN?=
 =?us-ascii?Q?4uxEp1BYnrX3WxWjgCGH+XrE9po+brIfddIsTU9kTNNFltOi/jQJiIkUkjqC?=
 =?us-ascii?Q?ZBIAS1pd9YHznTL2+gFtO4rX22ueuP81hpAFOatPeRuIa4aXSozL97GnKJxq?=
 =?us-ascii?Q?kidEpzRxiVCpRwntqStdTq4YVIL3+i6H9xnuoM8ll3oHukDlUt7jfv2eo0ks?=
 =?us-ascii?Q?omOySEPow909a3FZ1SMD1Oc85FUQqJz7sIO+NSqOU6yDvYMvNbhrlW4Rxx7d?=
 =?us-ascii?Q?H8wlaRAP34qaGJSeocICMbOPODyTvAvhhCU/PzdxTYm/SfmFySuEncgYRioJ?=
 =?us-ascii?Q?t6IrlXfsS0qu8ci6LNS7M9wQ70fLNxH7LQrWEhYXroy6+reb/WO2rrK/BbgH?=
 =?us-ascii?Q?/B882Ktdh4EfX0aB9XvmEx2uPQ9AWTLV0Ms71FdCsZjVC6N8LGu+7i++KXHK?=
 =?us-ascii?Q?JVpTAYKwZJSl2LE0hYzTe9OOsjJmcfqD+cleQLhcvnR7S9oTQvQV9J0qt5EB?=
 =?us-ascii?Q?r7ii5/CO04XfF/tX6ki3rB/9SXiJMvsjkgrpD/z0z/4jeS3VCAPYARSU+TAI?=
 =?us-ascii?Q?HblKAxFeokhU2qNZI/IpDgUKLFyCXRcSMZ2GDnNe7gNJRUR6QzZQPpXanU8j?=
 =?us-ascii?Q?kUrBmGDqUs/NYWZTxMDbrsOdso4EcJkOE+Qgi9CSSHDrHb75XiZHNBmG2RZ7?=
 =?us-ascii?Q?Q1UsYERUvAkB2hC0OsjTcZFrC2mohibJ9Wvsy/giPNBpVomAwUd/fTabhron?=
 =?us-ascii?Q?NMD4wwhth/58yt/J7fYXPVXXrYAbfCIS13nD65lBcRMPczKByAcIlh0bOdcx?=
 =?us-ascii?Q?C5Uv7Z4NlY8R2D3ICRkV0tXDVGaFhVhnPN/rAtGTwLyS8U9aoyO6jx+1oTl8?=
 =?us-ascii?Q?4y+w3w/1xACkDimH1L6pGTmvAJql4UMVrRFcFpc3jV6Y2lKYCtH3dB1vyz3+?=
 =?us-ascii?Q?oOcwKnPQWVucCizjt4/E3f5fKlBFgfcoLwXMnAXrqbx5GZJOsDo33QxbUkJ4?=
 =?us-ascii?Q?WHq5imij0ECaDjBbY9ziOEHcTveZX/0RgQyUu9hx0pgPe3jQRPppwd2ACTk8?=
 =?us-ascii?Q?EB5p755F9yZtP2r1mV1GD5EXsSy5MJt7s4dR4jJuekmbU+9H3q1UcJVGwMXK?=
 =?us-ascii?Q?rZiGHd3ADqBMRQ4evAhCMaNwy3k38w4zbhp53APwAc6Qpuueu1bEBCMe3P1J?=
 =?us-ascii?Q?vn+3xlVIXdHPT793q66NYUvXDHphmdl/mwi+OnFvBW19/KyouUs/Ze2UydlI?=
 =?us-ascii?Q?uVI20Swrwm0HTVGsRV34VA9z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EI7nGEFoQaRx9biQ4ofONJ1POOxqkMBjf6RtoRNWxhPPiMb3tz3AQ0WE5f6J?=
 =?us-ascii?Q?LaUywciXW4ICl4vhUs6XqxrpYT60j8BNM15mxz7yU4DcRBngIBnU41Gm2ziG?=
 =?us-ascii?Q?VNXHFetpS3Y1ptxJk7ZtzH3RMAuG2Mj1TmAfBntQbMQ/SitY6eQUXSTPi978?=
 =?us-ascii?Q?M58VXelzWoPrU2k35wO8Fl/jpcOOQgNrr+0zO/qdloCO2lgxKZC3t0WGRgOT?=
 =?us-ascii?Q?w2NpWOFa+SosWgefLnmS7Z0S5v6tnbv41BPazSeIlgx/cuV2eM7qHLM8Ewe+?=
 =?us-ascii?Q?/DFe7wbABqN95u+uNrQav+z+WoeiVBJ5tQCczvgKfqE+ICqfj3VYlRlG5ikj?=
 =?us-ascii?Q?pwLCnpFf9VStcsIC4bxiTEkicu7zW1F9TCI0nSMy944TF5RVLjggPWW9gkhG?=
 =?us-ascii?Q?cvvR2Ke87K8cWvEErkwkK0R6PCvw/Q4bHGWCXhrZEyD9tejnJIqufk0Eaz4I?=
 =?us-ascii?Q?aHCOicM33l4TR7pvZCuLQR8Ly+ht3XFm1pFok3YzOEq1mJNvq/f51GIcdJXV?=
 =?us-ascii?Q?JgcLFpZhhmdpuGp1JcW93Sk+bZTSx5E7AhzZOH8mQt3XmLS4nN7pt3xufdA8?=
 =?us-ascii?Q?JC2LRI3EpUBwc5eTQYhJNH1W81bd0tzA6XcizX4Bm2ATj8KfnN+5pubJd1YZ?=
 =?us-ascii?Q?QTziMGxOFURFaQdwFw85oLH46T1FPVqotCLWNgADGOBVBU9OX96MVEvHidyv?=
 =?us-ascii?Q?HukpdSOLQPMA8a3hDoZlKsU6ymReJqohrVqoxf1O3qVEcZQ4xupeT3fb5fLP?=
 =?us-ascii?Q?QrHLFhJD1oeDgMePv05g4o5QHKDSFHyqx0WVkIme5MlB5LfJhFPfbu5pIUl0?=
 =?us-ascii?Q?UEbvEHzUzATj25K5bjxM0bm2R/U9rCmNd2VBihqCnmWrwjZSqIudPnXO5+J/?=
 =?us-ascii?Q?nhPBHrt6YPEd5dCtZzcSQpZjKiXlRO1NbS38RP1OUl2l9mQ2Kc50QgU4ihRM?=
 =?us-ascii?Q?n63JEsRMGxXcGbsSmNEGIBl4ifYpzEH8LqhCFkc8iFe5sx88IEH2rpSF5s+v?=
 =?us-ascii?Q?PY1D5kG1WwbI4lIGen943f0QxjYRfx0aeta0cw+UjJjiVIer2Nx9vtOEWsK+?=
 =?us-ascii?Q?xfJ+MvASf1SaWeknpnSnm0V9YdvluX4AGgRzIlQdBVEiBVN5HAjc+r+dYZVM?=
 =?us-ascii?Q?nS+WLjbf1eGLSf2ErZWxmmLKgceg8FqyDlvg+0ABJyzd9mY8n93S1FTjceL2?=
 =?us-ascii?Q?qZNN53ssIeHVNWcjdofK4alpb8G00Ab882Xwk6n3A6Np6JJ1A+F06Re+i/BO?=
 =?us-ascii?Q?q5Xj6Rv3Fs7M3XlXlvJUxdjWPYcAQyd2YUUJsL8boFgAV3i7mk1OVUhVzYMv?=
 =?us-ascii?Q?V330n68Ge0tgKOuSwwgmd1DjIhY5OgQRuu8uWe5kFNX/XLkwPd13UXZ4Dphm?=
 =?us-ascii?Q?T00gRSjSSVXN5J4oKWWmnijiZQH59WA2C0JGHlvqh7sB+7gEOJhjnHGM4z3a?=
 =?us-ascii?Q?isZ+YEdTCljuUBQg3Tqo+AuasTYWhCIxZ/YpR8gWvKAlMi27ZDTw9Uff1tP2?=
 =?us-ascii?Q?X96VCu4GHmrxyv8sJIoBfbIIzEpzTLoOSk0OOgIRlo+DHCQ3W0eTaCzgNG5q?=
 =?us-ascii?Q?jNz59YCFUS3LCWTaR1yn6wHfPXpMcykluY0RsMgbGoq5ZBXSi+fTmKORR1uL?=
 =?us-ascii?Q?Fw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17112804-4ff4-42df-cf50-08dd04c0b54e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 15:26:28.1485 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ra38NfDfHxqBzZJgXXu/UtS5VWd2PiyWw3rk3HAsKIvn1E2OTKTby4WGa4tJeiuboRWCIdzR/qzcRXwmSc4vfYIGgiJup7PUWgfxA+zOKUo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7421
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

On Wed, Nov 13, 2024 at 08:33:52PM -0800, Ashutosh Dixit wrote:
>On Wed, 13 Nov 2024 19:16:55 -0800, Lucas De Marchi wrote:
>>
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index bccca63c8a48..0cb8d650135a 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -18,6 +18,7 @@
>> > #include "xe_memirq_types.h"
>> > #include "xe_oa.h"
>> > #include "xe_platform_types.h"
>> > +#include "xe_pmu.h"
>>
>> you will need a xe_pmu_types.h where you only define the types.
>> See the other lines that serve as good citizens, don't look at xe_oa.h
>
>What's wrong with xe_oa.h :) There's an xe_oa_types.h!

you might as well use that header ;). I just sent a trivial series
fixing a few pre-existent issues I noticed while reviewing this:

https://lore.kernel.org/intel-xe/20241114152148.572447-1-lucas.demarchi@intel.com/

Lucas De Marchi
