Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBC7CA0EED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 18:09:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107E110EA8B;
	Thu, 28 Aug 2025 18:09:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iWLGC17h";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AFE710EA8B
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Aug 2025 18:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756404560; x=1787940560;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UrTgfTFvW6pE40msYK5zB9NbHq4M72AlprZk0oCDox4=;
 b=iWLGC17h9XXN4qrMX50nw/EE5Ib0PttU9fm4ot7CUFFVcglY/qNZsh4o
 Bxh6UXLqpqJHAXAplW72KSEoEl8L484LkKYB+Fd2xQSf349dFmCnqFnMw
 FvR1kcoagtWaoJSyJWnM/YSELzKUnaqNZFalLQenf6fgzTZushJ7pPnq3
 TgdHo8qEyz+/zVhEVcuSj+XwPjKrcPpEW4j1Oon//R76niwNQ49yc1R3h
 aVrJdKu8p3sMMlOlqPB4Tn+MJ+f7PdUlOFLeFWIpPsIfz/MvyMEe6F7Qa
 w7Rv93BGkUFOfXPJbzJgLgJ7+dEp0b2aAg72isSOkVZTW3yIkN8/VAIXE A==;
X-CSE-ConnectionGUID: 9kM458/pT1edYQNXPZgv5A==
X-CSE-MsgGUID: rjvbvuOKQRmHz1mFf+Qm/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="70126871"
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="70126871"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:09:19 -0700
X-CSE-ConnectionGUID: KPJ50pwTTg28eVUldqnJWw==
X-CSE-MsgGUID: DPebm2frRaizvaD9ULW9KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,220,1751266800"; d="scan'208";a="169481260"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Aug 2025 11:09:13 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:09:10 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 28 Aug 2025 11:09:10 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.52)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 28 Aug 2025 11:09:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YhxvMdjtj1+Zp7CFTroa0jkoFtxdtylkTYMo1lCvwrY/NEIoSY5OfJ4SXYKlxGiA3WY6Rouwu/1pElxJiV4JBn0yeaLFlbkXKFIS3Sb1QeBAqmME3gAi5zyEBRaQb8hFAXLV5CCgw3fq6PxkVPQAeHx9Qt8wyQ9aluWrfCC0D7xyWwkuwHFDY2dkENuc+N882BU+ZRYLfGTgSnJ6Z6Zzg7MoFNrxVCv+MXFMI2jJNVUybSmpi1NbXVZPyz0Xxjyp01nRFaskd5hY0yx77vWema/nM6dfO+Z/CmEUPH01X2Hm8tCstoIhJFISaU8vCVyDrITV2UbryPJzXMHjtWCDww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2MM+xIOhH2dBDUOQolf+MZiw0pW+cUNE45kt6ZZeIs=;
 b=G96pAqYD31Qh6gEaXiTSvKorDcvEVcUGBxkx/CGdSC4AEn8J4gBekujUR/yScZdVMtTuDpV3gGXb4T8mH09eK/ZiuLxEl+c4As+xi1c7uJExbuGxpmkQvNnekLlyR6aFRxCsW8zd6M6NE6Nrdas321NBaaofCW/EhgLzZ+Um2J07ijbUOUGCOD/5TP3uAVUDgFcDFcf/EzzP5h2gVo2Zfy0LIH8Aw/9L8lM7i96YUZ43MhHXYlRFjNveC9ITherXZ6dknExRoiVOLn/4X7zjDj+gSK3blLLRTFBAEpL3/rbsH/kFXNpoqoluVOWBSJpWAcHvbVJZCf02vwE9CUGcDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by DS0PR11MB8739.namprd11.prod.outlook.com (2603:10b6:8:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.19; Thu, 28 Aug
 2025 18:09:05 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9052.019; Thu, 28 Aug 2025
 18:09:05 +0000
Date: Thu, 28 Aug 2025 11:09:01 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Dugast, Francois" <francois.dugast@intel.com>
Subject: Re: [PATCH v2] drm/xe: Enable 2M pages in xe_migrate_vram
Message-ID: <aLCbPUdfdEiNMjXX@lstrano-desk.jf.intel.com>
References: <20250827195701.268467-1-matthew.brost@intel.com>
 <34e163922f1b3a7df54ce2778f66ccf546cdc337.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <34e163922f1b3a7df54ce2778f66ccf546cdc337.camel@intel.com>
X-ClientProxiedBy: BYAPR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:a03:60::27) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|DS0PR11MB8739:EE_
X-MS-Office365-Filtering-Correlation-Id: ea9a32bb-da80-4ee3-aa4a-08dde65df981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?p3P1Rl1P12snPJMnUnVbh4/dc5ADNB9LRS8U0oHNSqtb77sgQz/0JpK5pR?=
 =?iso-8859-1?Q?8T4zaAf+mPfXHqhiFF6WG88fwtJMsntpoYuvMmqKUHv0saW801HmdI+3YX?=
 =?iso-8859-1?Q?xljDUDH9X/o3b4gZ3eX8+V7dKixI2X2ZbziAytZ7x5P/65Yk6hb4c9CbLU?=
 =?iso-8859-1?Q?q7X3luCzc3DBpC5gQg9Cp155ZloYWkgHBw3uxlvbMER9IGJxQ6KxI9TYv8?=
 =?iso-8859-1?Q?HKH7mMrsEa+XgkqMSQduoQx8LXPXVhRGJUwghAI+ZnHCk9e5KbYaHOm+UF?=
 =?iso-8859-1?Q?vZ+DiOflYp9Jpd4MI7SbOSBoHfep74LD7FaB/aHQCARUKjD/WJ31kueL88?=
 =?iso-8859-1?Q?RqmI1BRWxPX7GEA35qSn5ah2jh0m+DL8CJuazMsDf2ZUdkJOUPqyhg28nB?=
 =?iso-8859-1?Q?tu/8nxDgjnbbYEHkyJYnPKYyIEkIehazw0Gee8I1hHnKJgNDfOjah530Da?=
 =?iso-8859-1?Q?2UWfe46LCYgps4R7kaIHI+TE59apXODxZUj5CtGNuoJk6ihWaP5Wd8mcjj?=
 =?iso-8859-1?Q?yvZFKfIQ7+0ngVK0c7/MPDolMPUlCdoSQaPsuZeXofesXWDbMjCh1bTOP8?=
 =?iso-8859-1?Q?OFDkrb4msnzmgQuGfa3XhvuCmurkr6ECdarJpqllt3FS5I+8gZp850xN1b?=
 =?iso-8859-1?Q?mdLzKg6mvT4zcgv/HP02oFXnPNYc3vvzkHAWOzo5Gc+p1yZREsqPT1XZin?=
 =?iso-8859-1?Q?Esf4L+A2K2s/7wIAxVHm1u/pCp4O91fdsFc8UIO1oNfIPZz2ItOVZQsGkQ?=
 =?iso-8859-1?Q?ZqxHSTpjGKi/FNTwTvkC6NHHnwVorClrDIpgW6hUkH92BbC4pxLE7UbY1B?=
 =?iso-8859-1?Q?kbVmp+NlcnW0z8fgPx3O8GF8Onv0m6dvi1kvzICSuKQovncrPtLZRVyduc?=
 =?iso-8859-1?Q?JorZpxtGRezuaikVRYGluzpaAHuOgn5A7qL69WDJSQ3aBs9y4vtn8+F0nz?=
 =?iso-8859-1?Q?GBKtVmOz+Sj0Ih0J5i7t5ngHzidkp16ckZ42vUDwXFZR578TSkiV9lD4LG?=
 =?iso-8859-1?Q?/j8pHpyAA0d5oVa5ASnAhuMWopcqkxeVoQf2GuofRWZ6cGOVRAe/DBhbno?=
 =?iso-8859-1?Q?iXePO1ud6IWFtwn28W6QEEsPumqMCACIn+v9KcQR8bT+6d2epJkMCHJ0Ou?=
 =?iso-8859-1?Q?hDsIoRVFD9l+hqkVZWuAXyJH7I8TKETNnVGJ9WpQlbSG1yLquHX9tWEhhw?=
 =?iso-8859-1?Q?poHbYJIygL7333QOdv0p1Lj49pnXyrn6CaqpUS0T04looX9nD6s7WLGGLk?=
 =?iso-8859-1?Q?skm2BP+/9W+KTMNxVFGu9tfBO2WnUt8DAgmbsAuBhiWIWDCo7SAe0YKQOe?=
 =?iso-8859-1?Q?MM09iWaZkg1mY/9hbIXFuTFQyqQxwU/rWkk3pJgJb2TsD08ipT62ny0ivL?=
 =?iso-8859-1?Q?pY14yspyU7WnxtmTvuKXskDOcTz9rKFz9ZAu0pC/6jocTNG7u3/ROBjjnl?=
 =?iso-8859-1?Q?H71zcNq1vobkmKfVcaQ05AcPCvbNdN2ScFa6QjQyUoYh+slGMbExi2w5pL?=
 =?iso-8859-1?Q?I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?qmXFtknbCUAnRSK2wpo6autzehqPiA8+2yuDAkE09Jw5Rd6Zt44yzkptIz?=
 =?iso-8859-1?Q?WerHBnPvhBFNjN7Xpfdag1hGVNXdGLoSaZykFNpIy8K6qC8yu7OVIZY6Xl?=
 =?iso-8859-1?Q?AH8Hlf1+FqYGikjO8c4vut4NAaM0jjIWCiuQ+ad2mFXki0DK2l8mJe5ZF2?=
 =?iso-8859-1?Q?VjuRUCEnzs+c8DHnp8Rk6xRgIPCyJvOizNnFXB0qrL3dvVFHigRrDwB3go?=
 =?iso-8859-1?Q?aU+QcOGvmpsuY9FqM3Uh3ULiccdGyW/0fau2/o/H6LkOnqf4Xuan7nYcZN?=
 =?iso-8859-1?Q?F6ofX2h4mMjLXj0r4BQLJ5NC9BMosGgl/1OOQ1zFB43xxPbovQ7LK6qqLe?=
 =?iso-8859-1?Q?J5vQQBavb7E9gPhaPCl2R1SGMyvWyEsGY3+fi5zG5eqN8ypO24pB/h5XkN?=
 =?iso-8859-1?Q?su89rt+C1rlb0dFIaCUQ37i+IkBIkCrS4kD+Z+1sgVIqZEnlT93wgDBJ8g?=
 =?iso-8859-1?Q?GxMgzFKi+XztKt080dIeqjKzDRNEp81ME3TR7lSSpmz0fa6oSa6J7kvEcO?=
 =?iso-8859-1?Q?KWrbrUArrfp0hKvhbxjX425PT+uoMizHOvZi64GFKFUN0SAm2JmwiZOffO?=
 =?iso-8859-1?Q?g3uHh/SG+sxyQBZtDfcMDBAheEuayFN+UQ9mbu6lyrjkUEFn/DLrLogYhi?=
 =?iso-8859-1?Q?ZBgvP/BwdW1/4eX/tMy+/UHG8+BNSO38Xf3PCmQTYVxpa8HmPPcZXyvoli?=
 =?iso-8859-1?Q?rp7EPVYJCyn4jbwca8PF7VDKyxYUUiFxkyK0oX89O1nfC9VDS9/s63NwYV?=
 =?iso-8859-1?Q?xESLRUa3+UE6fbBjgqKKRMimCDObVD3si8AzhT7oyaSfw2hIzsPJWAq5YI?=
 =?iso-8859-1?Q?b2f/R6DRYvg/0QJSv5MI8ZeXf4uFOtO/uA4Ejo7rwjoeOK72xK4/iWluBF?=
 =?iso-8859-1?Q?3Uz5v1gBz4BTb9Yo+9BkOD0izNSfU8Jkw/uYSFWbBYue9CGRcm18UunJiH?=
 =?iso-8859-1?Q?oO4EPQ2jqRR+xhPgHmyKRjnnCvxxcGamJr8w/XSwG9p9b7rzY1BRLG6ng2?=
 =?iso-8859-1?Q?0tk0/3hpsUboVRVP4+xU+w+Yx615/FG3qpgMWtxG9Zm4dsrUH7ZgVZFd6F?=
 =?iso-8859-1?Q?pMiBROAsEI8KQhO36iUoUDyaO3zzVqHvqUJ40nSBkCpJPpqUWgpKzh3K9X?=
 =?iso-8859-1?Q?i/8G3JufPqfACu+iQRxgs8NxrPscgeU9WE1gwUnSFYiYz8bPfEY+OEft+I?=
 =?iso-8859-1?Q?OpK9Qon5qzW0bghgkwjVRivU9rqxzG06/upRBRYSemtUYCP/1AX9JBfCgJ?=
 =?iso-8859-1?Q?3QNE4Ri3LlRCPmY0FQH60pQkRsbz/z10imuPG07+jTZv5DLZUgKJ5y0qf/?=
 =?iso-8859-1?Q?AE05H4EjZ0pRuJzG0vz41sNpfZjm0PYh4v3xJnzRqZcfKkTixQyqj4duns?=
 =?iso-8859-1?Q?o9y881cKgjDLsTZ2fMicg4Pgy4omqEw8zP0L8SKiE+excwqD3TsGTgyE6l?=
 =?iso-8859-1?Q?H0mJhsqhAR6SfqwvNhA0yl8KUsWyoB4Vz1uad9dgP4g2E/pq9EJxUA41s1?=
 =?iso-8859-1?Q?hFMPMUBLxPasVo2TjQu51NYSZyRayrKgEHe6PS4Vyj6RkjPuyMzBn1Hr3w?=
 =?iso-8859-1?Q?sWL6Ta2vNdUDTxRkgj6NRwYx9DvsKMiv7hD6xcztZ1f+yk5OeiLkppeZpW?=
 =?iso-8859-1?Q?q9+qbOhjbFuvWCwbdRt/n5stBOvdSVKq6pPDANhRCdkHcXsPBbustKGg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ea9a32bb-da80-4ee3-aa4a-08dde65df981
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 18:09:05.0878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6M6X+Z4E+d2gDlyISNWGbGz3cWazyMtTfMya29MAB6N98IfDpTOQI5RMRJK+XSvUi9aNzazjBjDd7CgFsM9jHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8739
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

On Thu, Aug 28, 2025 at 09:56:15AM -0600, Summers, Stuart wrote:
> On Wed, 2025-08-27 at 12:57 -0700, Matthew Brost wrote:
> > Using 2M pages in xe_migrate_vram has two benefits: we issue fewer
> > instructions per 2M copy (1 vs. 512), and the cache hit rate should
> > be
> > higher. This results in increased copy engine bandwidth, as shown by
> > benchmark IGTs.
> > 
> > Enable 2M pages by reserving PDEs in the migrate VM and using 2M
> > pages
> > in xe_migrate_vram if the DMA address order matches 2M.
> > 
> > While here, correct build_pt_update_batch_sram to handle PAGE_SIZE >
> > 4K.
> > 
> > v2:
> >  - Reuse build_pt_update_batch_sram (Stuart)
> >  - Fix build_pt_update_batch_sram for PAGE_SIZE > 4K
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_migrate.c | 70 ++++++++++++++++++++++++++++---
> > --
> >  1 file changed, 60 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c
> > b/drivers/gpu/drm/xe/xe_migrate.c
> > index 57e6d5a8ac39..8e0e27ce6de9 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -56,6 +56,13 @@ struct xe_migrate {
> >         u64 usm_batch_base_ofs;
> >         /** @cleared_mem_ofs: VM offset of @cleared_bo. */
> >         u64 cleared_mem_ofs;
> > +       /** @large_page_copy_ofs: VM offset of 2M pages used for
> > large copies */
> > +       u64 large_page_copy_ofs;
> > +       /**
> > +        * @large_page_copy_pdes: BO offset to writeout 2M pages
> > (PDEs) used for
> > +        * large copies
> > +        */
> > +       u64 large_page_copy_pdes;
> >         /**
> >          * @fence: dma-fence representing the last migration job
> > batch.
> >          * Protected by @job_mutex.
> > @@ -287,6 +294,12 @@ static int xe_migrate_prepare_vm(struct xe_tile
> > *tile, struct xe_migrate *m,
> >                           (i + 1) * 8, u64, entry);
> >         }
> >  
> > +       /* Reserve 2M PDEs */
> > +       level = 1;
> > +       m->large_page_copy_ofs = NUM_PT_SLOTS << xe_pt_shift(level);
> > +       m->large_page_copy_pdes = map_ofs + XE_PAGE_SIZE * level +
> > +               NUM_PT_SLOTS * 8;
> > +
> >         /* Set up a 1GiB NULL mapping at 255GiB offset. */
> >         level = 2;
> >         xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level + 255
> > * 8, u64,
> > @@ -1741,13 +1754,14 @@ static u32 pte_update_cmd_size(u64 size)
> >  static void build_pt_update_batch_sram(struct xe_migrate *m,
> >                                        struct xe_bb *bb, u32
> > pt_offset,
> >                                        struct drm_pagemap_addr
> > *sram_addr,
> > -                                      u32 size)
> > +                                      u32 size, int level)
> >  {
> >         u16 pat_index = tile_to_xe(m->tile)->pat.idx[XE_CACHE_WB];
> > +       u64 gpu_page_size = 0x1ull << xe_pt_shift(level);
> >         u32 ptes;
> >         int i = 0;
> >  
> > -       ptes = DIV_ROUND_UP(size, XE_PAGE_SIZE);
> > +       ptes = DIV_ROUND_UP(size, gpu_page_size);
> >         while (ptes) {
> >                 u32 chunk = min(MAX_PTE_PER_SDI, ptes);
> >  
> > @@ -1759,22 +1773,47 @@ static void build_pt_update_batch_sram(struct
> > xe_migrate *m,
> >                 ptes -= chunk;
> >  
> >                 while (chunk--) {
> > -                       u64 addr = sram_addr[i].addr & PAGE_MASK;
> > +                       u64 addr = sram_addr[i].addr &
> > ~(gpu_page_size - 1);
> >  
> >                         xe_tile_assert(m->tile, sram_addr[i].proto ==
> >                                        DRM_INTERCONNECT_SYSTEM);
> >                         xe_tile_assert(m->tile, addr);
> > +
> > +again:
> >                         addr = m->q->vm->pt_ops->pte_encode_addr(m-
> > >tile->xe,
> >                                                                 
> > addr, pat_index,
> > -                                                                0,
> > false, 0);
> > +                                                               
> > level, false, 0);
> >                         bb->cs[bb->len++] = lower_32_bits(addr);
> >                         bb->cs[bb->len++] = upper_32_bits(addr);
> >  
> > -                       i++;
> > +                       if (gpu_page_size < PAGE_SIZE) {
> 
> Shouldn't this be '<=' ?
> 

No, we special casing when gpu_page_size (4K) < PAGE_SIZE (16K, or 64K).
Actually <= would work, but it would trigger unnecessary additional
logic.

I just noticed I don't quite handle this corrcetly, I need to ensure
ptes are aligned to (PAGE_SIZE / gpu_page_size), and also need to adjust
the chunk variable on retry. I'll fix that in the next rev.

> > +                               addr += XE_PAGE_SIZE;
> > +                               if (sram_addr[i].addr + PAGE_SIZE !=
> > addr)
> > +                                       goto again;
> > +                               i++;
> > +                       } else {
> > +                               i += gpu_page_size / PAGE_SIZE;
> > +                       }
> >                 }
> >         }
> >  }
> >  
> > +static bool xe_migrate_vram_use_pde(struct drm_pagemap_addr
> > *sram_addr,
> > +                                   unsigned long size)
> > +{
> > +       u32 large_size = (0x1 << xe_pt_shift(1));
> > +       unsigned long i;
> > +
> > +       for (i = 0; i < DIV_ROUND_UP(size, PAGE_SIZE); ++i) {
> > +               if (PAGE_SIZE << sram_addr[i].order != large_size)
> > +                       return false;
> > +
> > +               i += large_size / PAGE_SIZE;
> 
> I guess I'd rather have a local var above doing the div_round_up and
> pull the "i += ..." into the for loop so we can drop the brackets. But
> also maybe what you have is just as or more readable..
> 

Yes, this loop is actually wrong too. '++i' in loop would break this on
copies over 2M, by break I mean we wouldn't use 2M pages.

> > +       }
> > +
> > +       return true;
> > +}
> > +
> >  enum xe_migrate_copy_dir {
> >         XE_MIGRATE_COPY_TO_VRAM,
> >         XE_MIGRATE_COPY_TO_SRAM,
> > @@ -1804,6 +1843,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >                 PAGE_SIZE : 4;
> >         int err;
> >         unsigned long i, j;
> > +       bool use_pde = xe_migrate_vram_use_pde(sram_addr, len +
> > sram_offset);
> >  
> >         if (drm_WARN_ON(&xe->drm, (len & XE_CACHELINE_MASK) ||
> >                         (sram_offset | vram_addr) &
> > XE_CACHELINE_MASK))
> > @@ -1828,7 +1868,7 @@ static struct dma_fence *xe_migrate_vram(struct
> > xe_migrate *m,
> >          * struct drm_pagemap_addr. Ensure this is the case even with
> > higher
> >          * orders.
> >          */
> > -       for (i = 0; i < npages;) {
> > +       for (i = 0; !use_pde && i < npages;) {
> 
> Ok so where are the pages filled in then?
> 

The upper layers calling this code (drm pagemap, xe svm) sparsely
populate drm pagemap addr based on order. If we match the order here and
use 2M pages, no need to fill in the missing addresses.

Matt

> Thanks,
> Stuart
> 
> >                 unsigned int order = sram_addr[i].order;
> >  
> >                 for (j = 1; j < NR_PAGES(order) && i + j < npages;
> > j++)
> > @@ -1838,16 +1878,26 @@ static struct dma_fence
> > *xe_migrate_vram(struct xe_migrate *m,
> >                 i += NR_PAGES(order);
> >         }
> >  
> > -       build_pt_update_batch_sram(m, bb, pt_slot * XE_PAGE_SIZE,
> > -                                  sram_addr, len + sram_offset);
> > +       if (use_pde)
> > +               build_pt_update_batch_sram(m, bb, m-
> > >large_page_copy_pdes,
> > +                                          sram_addr, len +
> > sram_offset, 1);
> > +       else
> > +               build_pt_update_batch_sram(m, bb, pt_slot *
> > XE_PAGE_SIZE,
> > +                                          sram_addr, len +
> > sram_offset, 0);
> >  
> >         if (dir == XE_MIGRATE_COPY_TO_VRAM) {
> > -               src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       src_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       src_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >                 dst_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> >  
> >         } else {
> >                 src_L0_ofs = xe_migrate_vram_ofs(xe, vram_addr,
> > false);
> > -               dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> > +               if (use_pde)
> > +                       dst_L0_ofs = m->large_page_copy_ofs +
> > sram_offset;
> > +               else
> > +                       dst_L0_ofs = xe_migrate_vm_addr(pt_slot, 0) +
> > sram_offset;
> >         }
> >  
> >         bb->cs[bb->len++] = MI_BATCH_BUFFER_END;
> 
