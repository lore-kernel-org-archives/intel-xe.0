Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76ECA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 19:07:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4194D10E88F;
	Wed, 27 Aug 2025 19:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aAc0vttu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78C9B10E7B0
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 19:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756321646; x=1787857646;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=gkIcmsHynF2MUEjtsAeBHUvnl0do6RwVVw1QQHkBq7Q=;
 b=aAc0vttu09jjVfbeNj8W1R8+ahF4CE5gbSzymBcLNHV3cNnuPkutsWFp
 uxi9NrrxKwavIyiughBHRkf/H7oiy/B4WXOY75zXAYQ4nfnEccOEOGvNW
 Nnqbr8KiyKxxmuWHqBiH08CNAyXTR1EEqhNgrPXNRYxWzEet/IvhrmV7F
 23hTq6O1ODq7c7ZB0VSox0QumR6+GhCWXPZN59cJtDHoSxXt1OwpARQOI
 FshTdsuWGd/CCQq3O6l3iWPxLBOYFpl+Jm9Kg3puR8n/19Kz4Qtp03Zii
 TtCrrPpOYFMdsEWsmxsexIExDED3rZSpgz92QNe2AC++OFZipwXN2Wxe7 Q==;
X-CSE-ConnectionGUID: NLV8QOD1R1WST8DHsLzlHQ==
X-CSE-MsgGUID: OoEMpqZxQ0eH94dCM86iAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="62403611"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="62403611"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:07:25 -0700
X-CSE-ConnectionGUID: Dl2rDtGZRUKRFwaAWiJj5g==
X-CSE-MsgGUID: Cvmu3vIeQOG38kzwK6Z6vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="170302396"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 12:07:25 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:07:24 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 12:07:24 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.41)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 12:07:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mNLTYfC2biPN6Ye7ZINNADYlX8wfvjI4YDeaZzKrmNBQ/xwtrnRnHHI2m32oJZHVTov9cNN+QyyG+0/DXtFmRgh2aqajPAUafK6gDuaEq6WX8HWRsy3rrVVgtq8xHPPjKSkd01kMpTgucMP5cf79m8v+/nu51REH15WwMtDRezcf8HSMHVS6xRuA4xT8scqJgQkW85A8duxARKixWWw3o9cpq34JyVKj1o8pK93U8vzp1iDpeNqPLI9DAStZFud1I1aI42acFsiVyXbfE7AzHTWuZihQcNW2b1eByUMS93FZd4hrUmNlcCkKZg6hbiqh0guqzqy1piIcA1BPdP0K8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QlgiQ49POnvq7+xRQx4Pv710YOchUS67v42Ekzgqz+8=;
 b=Ksl2Y+kC8u3zSxXUjWO43nt3XVcPjrJlvXsegVIytyNsOShZnzGcmc5I4HV+E7p36WQtguYKYPscC6MFwS1fR0PymfHh6VKrPT+r3CBtM2WGHvPJGV82uL6mzTNyHD764yP1iJb6Ntlda7cnesq8AP8qXAptwNjkvqbaAVrz4ev14eZSLlrUeZfIwu4butHw2SXrBIC7bM0OIvn3tALQnSKHBkvUvHPOQGDSArA8Bn8eY6kweRm1s698UhJoH47ImlUDhCtOWUdpZ0SAFtlXtLOT/uYC3ge0WDy+K7AL1YaI4EJ/MwIDQs51ZsKIxixVnOfaEGKXw6BNnkeLQtztaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SJ2PR11MB7518.namprd11.prod.outlook.com (2603:10b6:a03:4c5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 19:07:17 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 19:07:17 +0000
Date: Wed, 27 Aug 2025 12:07:14 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Lis, Tomasz" <tomasz.lis@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm/xe: Save off position in ring in which a job
 was programmed
Message-ID: <aK9XYqMi8P7qa//B@lstrano-desk.jf.intel.com>
References: <20250818172243.2649863-1-matthew.brost@intel.com>
 <20250818172243.2649863-2-matthew.brost@intel.com>
 <624ddf38-3ef6-4ae8-ac87-3a3ee98e2cb9@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <624ddf38-3ef6-4ae8-ac87-3a3ee98e2cb9@intel.com>
X-ClientProxiedBy: BYAPR07CA0065.namprd07.prod.outlook.com
 (2603:10b6:a03:60::42) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SJ2PR11MB7518:EE_
X-MS-Office365-Filtering-Correlation-Id: 04ee3b46-76cc-4c73-042d-08dde59cf0c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?AKeYWgCP5xi6HwRiFem6zZPAZcrApL/RXvJsKGFBvSEW3b8+z5Zy+hwYcr?=
 =?iso-8859-1?Q?V/OzvImKP2Cgr0qmNFiX8ne0ssynCQyRMJ3gskzIxsuAyyb9F8iry8al5s?=
 =?iso-8859-1?Q?wL2bCS7dVtcnAK+4zF0WzIFqyfEryMmDHtcwGDiXK6mD30lCAbEKTwVD+v?=
 =?iso-8859-1?Q?3zN/cHmca0NgXHVpmdhhS884qYZqRqsDNC2iHVNuA2TikoZwPqKbvJvN4x?=
 =?iso-8859-1?Q?gZNgLUV5gxlQl/cXLjjh7T1AcSjPsHOC0XC3vOXYN9d1OxpPkJNKAi8v2j?=
 =?iso-8859-1?Q?0Se45RiX5If74U7zG+TBBqBeLz36zzQxr5AVTrOS0NmXPt//oFHbcmTvC2?=
 =?iso-8859-1?Q?VB6zn8ob/HS4Tkf9zUln7wNOh1Hod4kWLe9n+cCJj1t7BU/+x0m6XxlzAW?=
 =?iso-8859-1?Q?R7PncR7qGkM8IDfTuyBAT9iu0vC5qDDyMmBILPtBzgKlSHu1o9qX6NoxhX?=
 =?iso-8859-1?Q?1+SouOcT42cBKsSuGTYhfbeqAarVK58LPHqQ7A1Yuktk1Eeygsr236Kxlq?=
 =?iso-8859-1?Q?/eBzY/wVt3QAdcP56iPOiXjnYmXdcJU//oyzoPD6S0ALNa3qZ2aVZUoPLT?=
 =?iso-8859-1?Q?OvNe5M1DN4b9sgK/xmdgzCSaPVLfqea9EEoVIt8EWdSe/n02vagEn+C1xr?=
 =?iso-8859-1?Q?lGEkxEEjQtNvBeZXEgQBf37vVw0cYxMplDJxq0tmVuYlr9rfnsY8Td9VZ8?=
 =?iso-8859-1?Q?WyOhuP2LxfZeUqGIvgC7OO6X9kv7XjCdzirjurrGgWF+NBRP9Jly7LO5ku?=
 =?iso-8859-1?Q?RE2ycGYRPBoSSY5N5gIgkoi9WRGnVtexzOMCW6C/1GlC2M1vCKjFM/Yp3E?=
 =?iso-8859-1?Q?VIYhXf/1gkjznltSO2bqiSiy/1HQgrKq5ZKb5enHhjzOlJH0SLLao1sN8J?=
 =?iso-8859-1?Q?/3nIVSrtZk3423GtUnaJPUyDEyOkXfqEF9uZrEMKd0fCseI+16T9JBc4Wi?=
 =?iso-8859-1?Q?/lKKPBdFMWIiu4NYyYoH7XY3Tsc7la/z77T1TQ/hjV72MggBS/rlVwcXLW?=
 =?iso-8859-1?Q?7w+seewzauCpGqny+5+l0xekNxgvmFV7Lm+g+cpZLtXSxBS7dOE5ck1uwy?=
 =?iso-8859-1?Q?e+xbF7yAIJ7XrZS8d3ItIf5vM9kveV+SJQ7Zu2FIiYq79yVsqNUoH6IF7k?=
 =?iso-8859-1?Q?oiowkgjt/ObUpfka4oKr2E+eAIxllJsybFxccKzvYfCXmg8iZy+jPnYbPa?=
 =?iso-8859-1?Q?YPenegWPnJvTvIGnEybQSw7vFqi7RBtIPGpGoZIMB+Hrv8bxeMqa7MXLqi?=
 =?iso-8859-1?Q?sNdxxRrijoIZMghuXbew0ynvzJIwTzOU3LMmfznkivgoW8gZC4JnbHq3UG?=
 =?iso-8859-1?Q?jy+i+w9QhyI3mEMKCAk3JZHXOxLSR0nq38SAZW4YI9UvEUlJTKYnFJA1xT?=
 =?iso-8859-1?Q?yNvDySIwIAW6MML0Pmq8POQ9gmggJwTmaxTPflg9RhmRsMedVGnEjAuMP1?=
 =?iso-8859-1?Q?ARCsIfFTI8ZWqqR0zDC5Y1UfiC4xNTt3CWQFh6G8FHGyZtjMWgSuB4y+Si?=
 =?iso-8859-1?Q?w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?30RzVAfdqb2LgTbvErDw+DUTDHVWkCWG8YoDSdz1Zz6VK6B9tp6Edrlqcx?=
 =?iso-8859-1?Q?nAFrEqnOlj+sBzgkweRsNzx3S0H/VBtlKvzOxK+1cE+r/hKFezKyCfJqot?=
 =?iso-8859-1?Q?adQHO/ln+Y3bvutoVGYfEKIUdx9f6/wh+bhRaWF0iU4X2wm9X/OK4UNceG?=
 =?iso-8859-1?Q?KtcjVdWOXKlskuNJ7mAmrTwxrLffSo2+vLuMm0ltz5EVyzSKcHgROJGPnG?=
 =?iso-8859-1?Q?kDTrqBLysBkXFnrQB7NrXrHe5eSQE1sVD/98EkjIIT6W22E8tC2bxUdkm6?=
 =?iso-8859-1?Q?u+jHSTaOrNPMX4U/aa5uLuPoZnTdMXU/xi+wXXC0//SGndDkDO+Xvqj8ig?=
 =?iso-8859-1?Q?679DivnzGb+AVPbuL63e4i2jere6Ha6gHaXofv1qhO7FV1T28H0xnT9SJn?=
 =?iso-8859-1?Q?bqn/ceEdveKLvSdKT70mz/jdNsCp44e18kvi9x1UOnNIzn6uurpOmirgh6?=
 =?iso-8859-1?Q?Dswgf44c99tglOT3zR+CtpwR2JrEFtAmTn9gTcV9N121tEh4RDl3uFeVND?=
 =?iso-8859-1?Q?gwt7jgcXuRRfNUqSpDcclcZXRy9/VQFLcvTfOw3dNAXfYnwPveA3tgJHnR?=
 =?iso-8859-1?Q?02I97SNRsewyaidqG/YKEw0+24ondtS8HlToU2eJzF39/6yUPP5sSGPKRf?=
 =?iso-8859-1?Q?Yn9mtDTro0gu4Y6rqFQmTXgSCTWvG6WTJJg9L65BPH+5YLWU003mXCPui4?=
 =?iso-8859-1?Q?smY5Zl95A27Yoi/NUI9oRJU72Ar7SXJLKCYmHCrr6r2OzH12KAOwMOdh8k?=
 =?iso-8859-1?Q?D64jMoFkIgeG8D2kNJghNIU2EaAZ/yGYbFiHi2JpnCgca73uDcFPT9MhiS?=
 =?iso-8859-1?Q?gakBn7ZmD3GnZ6du8/QFDyUgWaj1oEx4OmqHap//WcBiiD5x/efv+0ddvc?=
 =?iso-8859-1?Q?NUlYjeGLSK6rixcJMSs/RUaqsV9EVQZjt4un1vuOGlMObxR2H/WmWWbylP?=
 =?iso-8859-1?Q?8/zaY97cpICF72DzamjTBL5ByUmeeLlXVFBIk/0GmbWRgNdvX2knorTY//?=
 =?iso-8859-1?Q?baeHKkOVkxVnroIyYsxvprkVGmNkhrxxy+r6pMIvNOujbUBKO9hwQibTmS?=
 =?iso-8859-1?Q?JL98rc6ps0/WSvpmK3nCMbNcEZD6PKWApO7cCJs8JvnssEBFwxdLcXwyKM?=
 =?iso-8859-1?Q?+ZsfEaMp6OernF354OzKi6nPv9da8yFJMIXFHwPCXQOP+yH9zjuQB8ZlpH?=
 =?iso-8859-1?Q?5f74gIy7FwsQRtxSjcBGW6XqNjFI6v4uT+suXtIflWaJ0pibNW4U/5r0z8?=
 =?iso-8859-1?Q?RVLbVJT1+WAptaTq8zsBgP/fnVdNiiApcQDNJ2678eZmkd0bJnLktnEKnJ?=
 =?iso-8859-1?Q?2boDoT0LXnqvYFks4SjQMgsY5iCmrZ45ExImtD62axtpsz5Iejp6YvNL4Y?=
 =?iso-8859-1?Q?DLfz48fgcHK6mQh9FV66ngic32S3NNrmxOW+d5W/vxmtvR04NMMCxP1x45?=
 =?iso-8859-1?Q?NEXk0I8dIx0jdlqi3I+7t3YCCTkm5WWj/gBBlC818uI/cKjCye/Lwxgw5i?=
 =?iso-8859-1?Q?cdcsMC067u2CtzgL6ghtSdgerbeIEUOj1qvphjuUCVVa8YxcHVr/M0WeDv?=
 =?iso-8859-1?Q?QCcsdn/5/mX20ksQYfMskIMw9cgvyRxsdcvp4VbDq4oihSpMYBNY2mUXsg?=
 =?iso-8859-1?Q?TNaYFI0HlRpHgh4wtL8gNmMlEGIT8CBGYFDyHwhY01bsX2ZGjBWtObxA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04ee3b46-76cc-4c73-042d-08dde59cf0c4
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:07:17.5591 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s8JtKt2rlaXQznSRhoS5ej2oH0x3Ww1yH26ID+2dm6JVsSguyvWeiKNlZSRZfOizYvegtyUE02wNDh1NhO9bZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7518
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

On Wed, Aug 27, 2025 at 03:30:07PM +0200, Lis, Tomasz wrote:
> 
> On 8/18/2025 7:22 PM, Matthew Brost wrote:
> > VF resume
> 
> VF restore / VF post-migration recovery
> 
> The second option is more precise. VF resume sometimes needs to update
> 
> GGTT addresses as well, but I don't think the update of jobs is required
> 
> in such case - no jobs are emitted to a ring during VF PM resume.
> 
> (though during VF resume we will probably re-use the fixups implementation
> 
> from VF restore, so the same job fixups will be called, they will just
> 
> do nothing due to no jobs emitted)
> 
> No remarks to the actual code below, it is good and it is required.
> 

Got it, mixing up terms in multiple places. Will fix.

Matt

> -Tomasz
> 
> >   needs to modify the ring with updated GGTT addresses for
> > pending jobs. Save off position in ring in which a job was programmed to
> > facilitate.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_ring_ops.c        | 23 +++++++++++++++++++----
> >   drivers/gpu/drm/xe/xe_sched_job_types.h |  5 +++++
> >   2 files changed, 24 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index 5f15360d14bf..4dad28f0614d 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -245,12 +245,14 @@ static int emit_copy_timestamp(struct xe_lrc *lrc, u32 *dw, int i)
> >   /* for engines that don't require any special HW handling (no EUs, no aux inval, etc) */
> >   static void __emit_job_gen12_simple(struct xe_sched_job *job, struct xe_lrc *lrc,
> > -				    u64 batch_addr, u32 seqno)
> > +				    u64 batch_addr, u32 *head, u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> >   	struct xe_gt *gt = job->q->gt;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	if (job->ring_ops_flush_tlb) {
> > @@ -296,7 +298,7 @@ static bool has_aux_ccs(struct xe_device *xe)
> >   }
> >   static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> > -				   u64 batch_addr, u32 seqno)
> > +				   u64 batch_addr, u32 *head, u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -304,6 +306,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   	struct xe_device *xe = gt_to_xe(gt);
> >   	bool decode = job->q->class == XE_ENGINE_CLASS_VIDEO_DECODE;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	dw[i++] = preparser_disable(true);
> > @@ -346,7 +350,8 @@ static void __emit_job_gen12_video(struct xe_sched_job *job, struct xe_lrc *lrc,
> >   static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   					    struct xe_lrc *lrc,
> > -					    u64 batch_addr, u32 seqno)
> > +					    u64 batch_addr, u32 *head,
> > +					    u32 seqno)
> >   {
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> >   	u32 ppgtt_flag = get_ppgtt_flag(job);
> > @@ -355,6 +360,8 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   	bool lacks_render = !(gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK);
> >   	u32 mask_flags = 0;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	dw[i++] = preparser_disable(true);
> > @@ -396,11 +403,14 @@ static void __emit_job_gen12_render_compute(struct xe_sched_job *job,
> >   }
> >   static void emit_migration_job_gen12(struct xe_sched_job *job,
> > -				     struct xe_lrc *lrc, u32 seqno)
> > +				     struct xe_lrc *lrc, u32 *head,
> > +				     u32 seqno)
> >   {
> >   	u32 saddr = xe_lrc_start_seqno_ggtt_addr(lrc);
> >   	u32 dw[MAX_JOB_SIZE_DW], i = 0;
> > +	*head = lrc->ring.tail;
> > +
> >   	i = emit_copy_timestamp(lrc, dw, i);
> >   	i = emit_store_imm_ggtt(saddr, seqno, dw, i);
> > @@ -434,6 +444,7 @@ static void emit_job_gen12_gsc(struct xe_sched_job *job)
> >   	__emit_job_gen12_simple(job, job->q->lrc[0],
> >   				job->ptrs[0].batch_addr,
> > +				&job->ptrs[0].head,
> >   				xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -443,6 +454,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> >   	if (xe_sched_job_is_migration(job->q)) {
> >   		emit_migration_job_gen12(job, job->q->lrc[0],
> > +					 &job->ptrs[0].head,
> >   					 xe_sched_job_lrc_seqno(job));
> >   		return;
> >   	}
> > @@ -450,6 +462,7 @@ static void emit_job_gen12_copy(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_simple(job, job->q->lrc[i],
> >   					job->ptrs[i].batch_addr,
> > +					&job->ptrs[i].head,
> >   					xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -461,6 +474,7 @@ static void emit_job_gen12_video(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_video(job, job->q->lrc[i],
> >   				       job->ptrs[i].batch_addr,
> > +				       &job->ptrs[i].head,
> >   				       xe_sched_job_lrc_seqno(job));
> >   }
> > @@ -471,6 +485,7 @@ static void emit_job_gen12_render_compute(struct xe_sched_job *job)
> >   	for (i = 0; i < job->q->width; ++i)
> >   		__emit_job_gen12_render_compute(job, job->q->lrc[i],
> >   						job->ptrs[i].batch_addr,
> > +						&job->ptrs[i].head,
> >   						xe_sched_job_lrc_seqno(job));
> >   }
> > diff --git a/drivers/gpu/drm/xe/xe_sched_job_types.h b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > index dbf260dded8d..7ce58765a34a 100644
> > --- a/drivers/gpu/drm/xe/xe_sched_job_types.h
> > +++ b/drivers/gpu/drm/xe/xe_sched_job_types.h
> > @@ -24,6 +24,11 @@ struct xe_job_ptrs {
> >   	struct dma_fence_chain *chain_fence;
> >   	/** @batch_addr: Batch buffer address. */
> >   	u64 batch_addr;
> > +	/**
> > +	 * @head: The tail pointer of the LRC (so head pointer of job) when the
> > +	 * job was submitted
> > +	 */
> > +	u32 head;
> >   };
> >   /**
