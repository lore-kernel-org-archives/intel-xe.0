Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DE3BC77B7F
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 11:43:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 081C510E361;
	Mon, 23 Jun 2025 11:43:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FLRIUVr1";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F233910E365
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 11:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750679027; x=1782215027;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=jUA1uR19l/7jFGXlRBXZHP4C0vIr9j7miKLV/cmCDig=;
 b=FLRIUVr1rHlajPNsPBdx42Tz/S+Ww1FW9pIAcls+wrAzUnYnbfhThsTY
 R+pLBP9J3zw5X66P36TCCW/HKOCK0OdaCQCU1zWQMddP1zWLdKmQCM/5s
 dfFj2kn2wyheD2EbWkGr7Wz2mqpMjl273MVmbvmqZ8GLl0WCta0y1jEXt
 hCyDP1QAJDp7Ig9xH9aLckqhiYKZp83KMNvBAUnPll5eXwjYh5HpZzw5k
 yTfvZt2xE9F4ZKXLMv2TU0ZyIKaRKHjfql+sKTQ7hOBpe2uPg7Mic4QUO
 OjVDK2uC/9y05tU7I5ZeQiUTrOoWJ1lwqdUj3ICzHjMOpWpOaxbPBUVJh Q==;
X-CSE-ConnectionGUID: D+0pC3L2Tlu9Jpr/G/hdSQ==
X-CSE-MsgGUID: LbdhOjIpRtePXIEyKLzaYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11473"; a="52969387"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="52969387"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:43:46 -0700
X-CSE-ConnectionGUID: K6nQZ336QyGaWCo9vTme8g==
X-CSE-MsgGUID: vyPrMNWDSkWRgZloWO6umw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="182445091"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2025 04:43:46 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:43:45 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 23 Jun 2025 04:43:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 23 Jun 2025 04:43:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LM0iuxr82Gtg4nzxSFuqoWPfdWG7plyGBAwI8j78Ms2ZAPG1Zve8nmXwJORft4XtqXWhiNg/7XFXw7UigrwT7/nqMVIiP4J8cdgfvLRkj7BH1P/Sn9B0pqARZFYldsgA0zwEZQ7Tl4ihzLXF4QaAzG84jR48BWJdmS9mnbIgqCcLYu8U8abZIqxymUggHM+bIPtmmz/Y2OxKDeEoZLTqhdHrdO2xy9btTKYRqLsUFiiaZMRQwQbZnoAQ5SALoa78yaLfVKNNGo/XBai79PqWf4OcrizMlmTZ5Ypo80m3hHvowN3EFkvGUTEZ/mDvKL0XFbP+59u2S+as5NnpzikeHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XwzXLEH8kdQH/bPVxZTAJ1GmJ6Mq7SV7vPD4qc2FVlQ=;
 b=P2PcLFiLiJP4slps66bUbtwWq0U6clQhfPRdo1TtKHhKLZuRp1LbhFcg0KFvzUfLlnLO/6iWO8DQR4Zt83iJxo8TG8YAFo436sQwUWxXznjqGy10w7tfhbVW4Aa1vr/0JKfEzlIeFTpedSQhBmEqM+pVUAEZA1Rk4HcxNG8H2xU2cV4khqV7P19We6YVNkMRCPm4e0wNqyW3duU+6JGh6u2lhouAvZkmSjkqyXY4OCFAdQFextxDWdAIzJsUaaVi8I3wg/2FV5X0M1YuyTUPhMcD3oprlQgVjMf+06qfmAIDMCOntatcRm5EjYu2vAgEj8y5jZi2JA3K0+wjxzwoow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY5PR11MB6391.namprd11.prod.outlook.com (2603:10b6:930:38::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 11:43:41 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 11:43:41 +0000
Date: Mon, 23 Jun 2025 04:45:20 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v4 11/20] drm/xe: Allow CPU address mirror VMA unbind
 with gpu bindings for madvise
Message-ID: <aFk+UElf9NnnucoX@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-12-himal.prasad.ghimiray@intel.com>
 <aFjrgNVdY6rOPezk@lstrano-desk.jf.intel.com>
 <068adc36-b013-4fdf-8633-74a8887b3de7@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <068adc36-b013-4fdf-8633-74a8887b3de7@intel.com>
X-ClientProxiedBy: MW4PR04CA0220.namprd04.prod.outlook.com
 (2603:10b6:303:87::15) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY5PR11MB6391:EE_
X-MS-Office365-Filtering-Correlation-Id: faa4d40e-a036-43be-bcad-08ddb24b337d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yfXzdmvF+RDjI0fSOeyLKlwo7bweQ+h/K+TPSVt+28p3BBWIr3hwTF2c+XHM?=
 =?us-ascii?Q?GxfvrOU7fw/uP1Y3x4cnvDqiEHmIbkkpoF8DNKrYo8fJtlfgGWTi86qjK6Ao?=
 =?us-ascii?Q?uxvDMbCBblHgaF275h/vFtQfoIu3hwl4gA3zSsa5CqFaRUlh/JTfNcvUhhF6?=
 =?us-ascii?Q?Lm0MpYgbHI+sxPTh+rh9M5LmxZddkwD1WGJvSe5RYhMFcFwfCNpn/QOZMPJj?=
 =?us-ascii?Q?4/g3Mxn8FPIyMv8imorqeQsrVUMYr+WS+NbyqRna6dyP9WOn/ykK51LefIpG?=
 =?us-ascii?Q?NzQ/P8eJPZuHK4ptu29zO9f17h27uyxmrzV/oNjsk3CHby6huXfrtSGGa5lz?=
 =?us-ascii?Q?vGF/rKdvZXlK56I8lHRpFnZmQpnKAeNQLoAc6Og6gzitoLB99z06jRZMCNqD?=
 =?us-ascii?Q?ge0onjU/pvqQvZpjWl9GH6rKBg/R6gTDSKIGnqm8E5lAERrBe4oOtdZD1pfh?=
 =?us-ascii?Q?A+B38qAn7MILUCFrPFAiIBdsSLOjLFSLlkGher8UOJgfTmCvPWb0dIeevc+b?=
 =?us-ascii?Q?6koYNV1ssFLT59TwTGQpSe+zlb73lOPn6zEP1kDtTHFhXOBb/ClZPRybuW8N?=
 =?us-ascii?Q?OWPDzZfEJcGADFG0hR9o1M7fOqTcQe+Bye0D/+8pUHH53nQsFKeDba5A3H5N?=
 =?us-ascii?Q?gGUYcBTrIJRO/FkThXlNimYfR/ZPvKELO55gs+SJ7JeSkwpO3HIhrbaD5JZB?=
 =?us-ascii?Q?GMmqmP/ETp4IjFTm4hcqa2ewxl9CYirGtZsude0gocMLvLKSLFmWV4gGtsQN?=
 =?us-ascii?Q?/IqmMeG24MLoDGwqYsSl3JocB2A3NNEM14nLJqnH3DBKBeuCRLpCBD29/4ht?=
 =?us-ascii?Q?fPxHDN9R53svw2WDxJQ1UuuG0Pby6ILm8ik6BF28Etka2UheKYY+nJsu5vIn?=
 =?us-ascii?Q?qtcrKDdDa0DqhJXotyZH3mKOkr+T6MI1U21npoiuTiw3OIuF0GayX6Atmb30?=
 =?us-ascii?Q?POcRf6g3uiSpVI0VkF2bRIg4wrP1Uuu+Jq+kbMM3LIewnZVSmuh97uTDMuSR?=
 =?us-ascii?Q?lTRZ2RZMUnz7o+6L7obpYwd7A6oSqfbYHAHDe9TH4AdXCr3R4DmwGkLkOcCu?=
 =?us-ascii?Q?h44VhewHuJ//IRwrKvOD4fZs+ze2tri3Pj5GRdzfMjHos1QqfCsrBLx+ug8c?=
 =?us-ascii?Q?WzuEklF5e+toZA6ZHpohFKkyCLD3h/dgvzkEARKOpnYj024LuOfe+rqrF5BB?=
 =?us-ascii?Q?LQt7/q4A5zUVFSjRVy5YifA2DaEGCMRRjTTRUcOYeHL5/4UBWju7tpQrD575?=
 =?us-ascii?Q?pzAfVA8+KJJh6unsQYDy5IkdGS53g2X/tWFQ8wNLtq4O01Vsq16EjOXX614W?=
 =?us-ascii?Q?ypj0gyx/y6j6QJ9GAKcJ+ATMoh4sDdY8FKB31Xz5/+QnLjinw8w/fh95M1uV?=
 =?us-ascii?Q?GXhOzC5ixJw4K4OtHTn0QR4l9gl98+yy3Za7FCs+TwB9ujnISubiwzauRMMc?=
 =?us-ascii?Q?VJpdxOjEKas=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s8sEfPqkB0TqKPLyilzbTwlgu08SwLUdASpxiiT2reSMjJjaLnhjeGKsu85M?=
 =?us-ascii?Q?UIrsze8QgAPrx0Cb0c81zy46G9du5JwK4Md1HbjWZrg3qY6K1uzOWCpL7WKg?=
 =?us-ascii?Q?KfZSQ72s4cfl4vB7NKQlHmMb/vzr45SGzoXSLBTkGFfz8B6G5BiY/uCcd9XL?=
 =?us-ascii?Q?UMnew7TdRuct0/CFlIkXAEiSUOOXhk7Zeclb/Q8nHE/jK4Q6sBkZgivhYLhT?=
 =?us-ascii?Q?A4IngEV71bMxcnolOdUz9DuwHJAV3vBHYjlShmrMvgblKpKtIm1iNqJIL2EJ?=
 =?us-ascii?Q?uzSqdke6zOI9zFIDN03zFrdnyUdba4ap/yx+GECL70x1eBGewpZKGtVyWGYf?=
 =?us-ascii?Q?KQ4WX5UxptiybvWmM5ajBRbJyMSO5ujPLg1UMGNVtmbTUp6BHTS9Orrm1rPE?=
 =?us-ascii?Q?LjFWCSCuf4FcB8J9ct4D9nGCTHqrNPZLqWISrvt6P87mFJmLGTd+YJKu+5yM?=
 =?us-ascii?Q?ajy3mSctwlA1x1dncxMcKC0OSNCaB0eK/KtP2heFDJEMfh89/XUoCAXF2I7w?=
 =?us-ascii?Q?oKghAlyA9XXRyJzRzj1NW8fBWFIDJZlLrX0x4sbHcRVBuz0O0j+EKAjMn+xm?=
 =?us-ascii?Q?WlwxXoclFvjH8jA/7rC3ylnI/s6eLDEsBA0N35lzX377jbbZXqAmsDGM5mdp?=
 =?us-ascii?Q?bUEXiOQeq7y7tIIGL4dlDBZY122P8YbuhZQ19AuzrIrXxO/sAVxbav9dKcgv?=
 =?us-ascii?Q?4BCXR6geCVEU9m6+Dt/oKa5z8kFdqN6grHcNztJN6dJMVMUwuMnlYGAywzP9?=
 =?us-ascii?Q?8TbhDkVAPIXcYO41QTsOcEx2ekswOPrOmNnBgSOJxrPkqdRgQB+zNRjvT3jF?=
 =?us-ascii?Q?BlZsLqVUkw6DdrJquoyh0KTR06E60cjeeph+9E0I45NpzyV9A+gyuA4BB/EG?=
 =?us-ascii?Q?2FJixw6jLmG6TTgvCiFbNm3nGV6f+iLXmx+/Bq+kR3X40UTvLS0647Dv+rX8?=
 =?us-ascii?Q?vLmR3qw4MKGtIwbbd+cRH/n15OxGZn+hbj+ESiPiH1U9Wyo1ntR3XLgE1p2A?=
 =?us-ascii?Q?oEvLd/uVw7pEro2rnUjPCe48hgaT3yI0n0MIG2vLmgEXvpjYrOVHsJYbWfTm?=
 =?us-ascii?Q?96DGbpnlVk+af0541Z8PibBX8AcYidLNRGSv8CZzeFEPACRymH/GoOZ7B3MT?=
 =?us-ascii?Q?pj8htFgV3iP1EOabVMj7D6YJIDLFA/0Qc16PNlrmTRpFSYlGvNP6NGsC2yKw?=
 =?us-ascii?Q?4D2IufZyMmjhXkWP8Zxc6BOLag1rweQTMVRNjK4kAt+9oyNZ/iJ2CeznNO3u?=
 =?us-ascii?Q?5FhJ4OrEoqL/nfDZ3dOCkL3MP5+R0Dxy8i21H5WIFlLr61TfI2HJH8MkwrZW?=
 =?us-ascii?Q?IkwdA6pwFoHGX5q+5DeJDLAt817vDL3ZFZrZ7NVo+1PKndTrxF8svYkE02AM?=
 =?us-ascii?Q?NZgcU+dJTpz94d2UUGaNOTd0dEjhZ+ZRTNnEGvhq2DpXAfKdBYXcaZzWfAlz?=
 =?us-ascii?Q?dvQXEf8NaLylFo0ohYRpCtphcDMBu1NTM6qcWu8uzib0xgbUHFF3XxevTm/z?=
 =?us-ascii?Q?1Ra0tWFKAAzZFrYvP18Yi9MZy+hxULBhPUkQzlQXFfedZngrijrjEP2WOLAK?=
 =?us-ascii?Q?Vb8T4nnDQPc7kYaar9kA7qerzSMwDaNeB+6Df+kX2VsFeHgPo7hbo9IrJd8i?=
 =?us-ascii?Q?Jw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faa4d40e-a036-43be-bcad-08ddb24b337d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 11:43:41.4146 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d4DxMfDcjW1qoUJbaooZSLFzSYk/F4ji90Q951/hPVIPiXqyy6cVvTpNi6qfhb+GDuqejWb2TiEl4Czdf1emSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6391
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

On Mon, Jun 23, 2025 at 11:48:18AM +0530, Ghimiray, Himal Prasad wrote:
> 
> 
> On 23-06-2025 11:22, Matthew Brost wrote:
> > On Fri, Jun 13, 2025 at 06:25:49PM +0530, Himal Prasad Ghimiray wrote:
> > > In the case of the MADVISE ioctl, if the start or end addresses fall
> > > within a VMA and existing SVM ranges are present, remove the existing
> > > SVM mappings. Then, continue with ops_parse to create new VMAs by REMAP
> > > unmapping of old one.
> > > 
> > > v2 (Matthew Brost)
> > > - Use vops flag to call unmapping of ranges in vm_bind_ioctl_ops_parse
> > > - Rename the function
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_svm.c | 27 +++++++++++++++++++++++++++
> > >   drivers/gpu/drm/xe/xe_svm.h |  8 ++++++++
> > >   drivers/gpu/drm/xe/xe_vm.c  |  8 ++++++--
> > >   3 files changed, 41 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
> > > index 19420635f1fa..df6992ee2e2d 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.c
> > > +++ b/drivers/gpu/drm/xe/xe_svm.c
> > > @@ -935,6 +935,33 @@ bool xe_svm_has_mapping(struct xe_vm *vm, u64 start, u64 end)
> > >   	return drm_gpusvm_has_mapping(&vm->svm.gpusvm, start, end);
> > >   }
> > > +/**
> > > + * xe_svm_unmap_address_range - UNMAP SVM mappings and ranges
> > > + * @start: start addr
> > > + * @end: end addr
> > > + *
> > > + * This function UNMAPS svm ranges if start or end address are inside them.
> > > + */
> > > +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +	struct drm_gpusvm_notifier *notifier, *next;
> > > +
> > > +	lockdep_assert_held_write(&vm->lock);
> > > +
> > > +	drm_gpusvm_for_each_notifier_safe(notifier, next, &vm->svm.gpusvm, start, end) {
> > > +		struct drm_gpusvm_range *range, *__next;
> > > +
> > > +		drm_gpusvm_for_each_range_safe(range, __next, notifier, start, end) {
> > > +			if (start > drm_gpusvm_range_start(range) ||
> > > +			    end < drm_gpusvm_range_end(range)) {
> > > +				if (IS_DGFX(vm->xe) && xe_svm_range_in_vram(to_xe_range(range)))
> > > +					drm_gpusvm_range_evict(&vm->svm.gpusvm, range);
> > 
> > I think you could use xe_svm_range_migrate_to_smem here but also I don't
> > eviction is strickly required here either. This akin to a partial unmap
> > and we don't evict there. Any reason that I'm missing here?
> 
> If previous ranges had devmem pages allocated, and eviction did not occur,
> subsequent VRAM allocations for smaller ranges were failing.
> 
> Scenario:
> 
> A 2 MiB range existed with VRAM allocation.
> A madvise call triggered a split, invoking xe_svm_unmap_address_range.
> Without eviction, the 64 KiB sub-ranges failed to allocate VRAM during
> subsequent page faults.
> As a result, bindings were being forced from system memory (SMEM) instead of
> VRAM.

Right. But would allocate xe_svm_alloc_vram but not fail (on
!migrate.cpages in drm_gpusvm_migrate_to_devmem) and the subsequent
get_pages not find the old VRAM pages still in place? I guess I'm
looking now and our error handling in the fault handler / prefetch
doesn't handle this scenario correctly but I think it could. Let me try
to tweak these paths today and get back to you - if we can fix that then
I believe this could avoided. For now, yea I think this is correct.

Matt

>  >
> > Matt
> > 
> > > +				__xe_svm_garbage_collector(vm, to_xe_range(range));
> > > +			}
> > > +		}
> > > +	}
> > > +}
> > > +
> > >   /**
> > >    * xe_svm_bo_evict() - SVM evict BO to system memory
> > >    * @bo: BO to evict
> > > diff --git a/drivers/gpu/drm/xe/xe_svm.h b/drivers/gpu/drm/xe/xe_svm.h
> > > index af8f285b6caa..4e5d42323679 100644
> > > --- a/drivers/gpu/drm/xe/xe_svm.h
> > > +++ b/drivers/gpu/drm/xe/xe_svm.h
> > > @@ -92,6 +92,9 @@ bool xe_svm_range_validate(struct xe_vm *vm,
> > >   u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 addr, u64 end,  struct xe_vma *vma);
> > >   u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end);
> > > +
> > > +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end);
> > > +
> > >   /**
> > >    * xe_svm_range_has_dma_mapping() - SVM range has DMA mapping
> > >    * @range: SVM range
> > > @@ -312,6 +315,11 @@ u8 xe_svm_ranges_zap_ptes_in_range(struct xe_vm *vm, u64 start, u64 end)
> > >   	return 0;
> > >   }
> > > +static inline
> > > +void xe_svm_unmap_address_range(struct xe_vm *vm, u64 start, u64 end)
> > > +{
> > > +}
> > > +
> > >   #define xe_svm_assert_in_notifier(...) do {} while (0)
> > >   #define xe_svm_range_has_dma_mapping(...) false
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index e059d9810d26..0872df8d0b15 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -2663,8 +2663,12 @@ static int vm_bind_ioctl_ops_parse(struct xe_vm *vm, struct drm_gpuva_ops *ops,
> > >   				end = op->base.remap.next->va.addr;
> > >   			if (xe_vma_is_cpu_addr_mirror(old) &&
> > > -			    xe_svm_has_mapping(vm, start, end))
> > > -				return -EBUSY;
> > > +			    xe_svm_has_mapping(vm, start, end)) {
> > > +				if (vops->flags & XE_VMA_OPS_FLAG_MADVISE)
> > > +					xe_svm_unmap_address_range(vm, start, end);
> > > +				else
> > > +					return -EBUSY;
> > > +			}
> > >   			op->remap.start = xe_vma_start(old);
> > >   			op->remap.range = xe_vma_size(old);
> > > -- 
> > > 2.34.1
> > > 
> 
