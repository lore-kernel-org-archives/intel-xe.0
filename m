Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0421C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 30 May 2024 20:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0127D11A435;
	Thu, 30 May 2024 20:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="So7dXK1Q";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1038312B8CB
 for <intel-xe@lists.freedesktop.org>; Thu, 30 May 2024 20:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717101977; x=1748637977;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=iwKyJB3h1oj3XjM/ZWCgawkynuN4XI92UOqkPeaRzCA=;
 b=So7dXK1Qytf/KvFDYl0HUu3Ou0VJRKXNzjkAKsJ1WV3X7IFyD3iOkQ9o
 D0i1d+fTb2ujdQBwUKUhsbS5A4Fs0z0wxomRFlH0RQYx2reluouttkkLy
 zl62//jDzzEgTeCs7ensOHXIi7LkBzJc0uNREGHQZlLvvA9f7AQOhmi5c
 T6Lh9mOhX9pRQGZwSS8bi3XnKtbOu1mHv87h12B9FLbf4QFljQX1ELJQk
 yeBHj/Wu3tjPfvyPTMQFIVq6v1ommY5pThS9snwA8SvHrPVis5gHa6ICO
 eMQK7cIUm8fUVk7h8SaUOFjZpFfkobK9GnUyVgA0QX7TmiWUj/pi0SMqL Q==;
X-CSE-ConnectionGUID: l2qPMDhnTqG97GcjXOSZzw==
X-CSE-MsgGUID: ddvVYImwT4OFigCe6mBwOg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="17463504"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="17463504"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 13:46:16 -0700
X-CSE-ConnectionGUID: 8ZMPsCAWQi2Z7hTydcWlQQ==
X-CSE-MsgGUID: mhrWq6CXRTmeO7g1dP8DxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; d="scan'208";a="40387426"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 May 2024 13:46:16 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 13:46:15 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 30 May 2024 13:46:15 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 30 May 2024 13:46:15 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 30 May 2024 13:46:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NARQZLtr9FIPh3bqhGIu0U+0cyTktdGww2sjNXI8uAnoby963AC/2LtNg7LIypoAS+APrQXiK3eUfYh93lQL22ZMMeHgIYjeNjKm7rB0iVWqP2kinYD1LFEeEEDbABlBhILYOeAxqeSLGp9WeSWkWx/Ma9jncN4jM9w0tA++DrwILrtMAPXMo75XWfGkhdDmF+taK8d46wfEzRYxn3jFS9TK1SUoaFS57lUaEBKEudOxrBZD15VxzTnv9ziLyEOdl371guykKY5uPNBBPIrCrDmRmhveBwWedbxlpcKMTIFASbvc2CFRwkXkHP4OvNycuh7aIp+9HN5GuQLpfnYxGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owBILrOzMHJDGRSeHm3bFcBr7Q2s7sk4KgE1WPqVd+E=;
 b=DA+PpN79dvQezQyHH8uDe424Mf6TLbMkUiJ5fAztxefDtQRdzvCAfQ3SrSDwPD6SSX6z/tyWXxubqavgFtJPqp4s4cBwN4eh25mTBFqK817H1yXQ0sPkurSurg1Emh+bhGgiBW6mjcJmW5H8lr9uiKoSYgF25L8OMz5P8hu19o2rsnvkgzb4Gf6AgrOD+7IYMEetnqp4KSUdukGwrqJQbD/LOLcndtEvboac/1AkYkxATA0S2JCnT/+s2M+FCk+PeiL6d+sBRTxunZ7jMnceJT9c21AnbOs1tRNthPwCHgxQgEYlBkISquYfhAbdD0huON6PWiTJFZIlLoMl+XrAfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 20:46:13 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%2]) with mapi id 15.20.7633.018; Thu, 30 May 2024
 20:46:13 +0000
Date: Thu, 30 May 2024 20:45:47 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH v2] drm/xe: flush gtt before signalling user fence on all
 engines
Message-ID: <Zljle1kB6gR51RX4@DUT025-TGLU.fm.intel.com>
References: <20240522-xu_flush_vcs_before_ufence-v2-1-9ac3e9af0323@intel.com>
 <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e28c1e17fd9a6b7153432ff204ada2102706fb28.camel@linux.intel.com>
X-ClientProxiedBy: BY3PR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:254::20) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: eee411f1-de9a-457f-ee2a-08dc80e98b0a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4lbIAYLWvi8M97mi01V7VJheOy7Uxtq1uDnVfxNV36qV9ujrXuNThXtIFv?=
 =?iso-8859-1?Q?0Xit3AL4vJJSw9jGQFG66gd1gDm4yDj+M+LrJg351iio3MJuFB5Tru+rto?=
 =?iso-8859-1?Q?C2J9bvWV2OfGBj/KH1966Jr+2l6yuZ+cbf6fYzTUGGrJRgvqqOyzJs/Ppc?=
 =?iso-8859-1?Q?rerrzpC6P+4gnDrPACc5N0SGPJphhux5FIkd+LUYKXDch7kcWDCqvEII6/?=
 =?iso-8859-1?Q?QDmCAWr9QZZugHZqKTcxNt78v3cdeD6vPepWEa0mS6s3+ZFeIsFU2GdGD7?=
 =?iso-8859-1?Q?OR3JRhDW/OMPmjWRjK0tfgXg5rDoDYoNZEsCBgUjV5MUE17xBhT24dUrJe?=
 =?iso-8859-1?Q?+kWzeMKwIR8uadGfcL87fjoyalsKcyD8ZzlXEs/8fEO6rwAH+pRXURpB2F?=
 =?iso-8859-1?Q?p9P0vuFpmglOZIvJ0Hstld7bBlrPyifVre26czejd8Kn7PQ/9pwPX0/H2/?=
 =?iso-8859-1?Q?O05Y0MbYFSepf+Kl2gbsmfT7gNmZDfs+7TABPCKiJEJ6yIUidZkGoAWg5e?=
 =?iso-8859-1?Q?c31FPBomZkAexofka01TQO4EnfR5BjUoJ+PG4La3ERHqxVEEZlao6cCnJc?=
 =?iso-8859-1?Q?p0BCxprRFajp5U0faX9tYZsOtGTrJqcFJU7WTtLTCyP+M1OU37TCl0uu11?=
 =?iso-8859-1?Q?nkGKOFvwSiaUcKndBmr3CXmAJJevs06daph6kzgpDhxft8T/d4xxj5q/5g?=
 =?iso-8859-1?Q?U7INuEB0xE1r87gWFSpA5V3BtpCSFl7HatV0mAh2YfV0TIHP4Q17kMcSo6?=
 =?iso-8859-1?Q?hT/Wl+6x3YXKpg6XYivNqlJPzzuhOqf0v1z+G761js6uJ9JDFlkCES9j/3?=
 =?iso-8859-1?Q?EWGlMLDbqTqvNRoHhHsFjiPRmrC7OHbriU7yXzVKhbF7A1me3FnrBoeohq?=
 =?iso-8859-1?Q?oykn+gAcgpMRTbROVZiV+2Xmp+4WOfMuQus8TTfcXOG4VnHQv4rPqftG+/?=
 =?iso-8859-1?Q?x/rRGXaCOTW5QrL28DEI12UL4Lyo6EqsvCJ3Bo8BG+iTW+ROqzaGvEkflo?=
 =?iso-8859-1?Q?5vWHfEjRploFGYVZVQbbka3wFXAlbJzBtnkUDeLKUf3+1dFCUiUn7PUzC1?=
 =?iso-8859-1?Q?wdW0N/PsAq1Iy51A9S1yO3A3YQlqHJFMmenmL3Bg/xeAiM9iimsxwdJ0QY?=
 =?iso-8859-1?Q?5CtKD5SPxF8EbawJsihbbXmW1HfxLU4VWVBpOCncqzXoLNKM45akpljyEd?=
 =?iso-8859-1?Q?iJkjjy9wS2DlfWwjXuOuBd/97wWiNXWoloSHjBXi9LtKimFN35hlOdgMYH?=
 =?iso-8859-1?Q?3cb26sjpQIK/76+jNFH8s0Ymgcot+ezZHgSYMj2bk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jmYGDG8huJlLcGHgY6qdd0k/orjmoRGAGEc4iE/qPXxfGCvPL59ngkbW/Q?=
 =?iso-8859-1?Q?0Ka9O/Y8NsjwrdRqkGTqbZJuEiCv+hK8em8LYf+GgZL++St4qNaE7CkChf?=
 =?iso-8859-1?Q?rWocEYF9cwRJ/crBqVHN4DFe0hVoHs7K9KLhA41wpZWTpC7bejfvoNOZtn?=
 =?iso-8859-1?Q?QF5c25NZDkcRprBakx0ilAhRHBkYpfPLCj8Z+11G71whM9sIxrbEkDK6s3?=
 =?iso-8859-1?Q?p/VAXnYe3lv0Ag7SmpRTYGiF/zG22SwQsey9DShtrDWddPxFpKpQnVi8X7?=
 =?iso-8859-1?Q?pCFX1CrUhOCg0nXBK9n6W/vgIiMdla27M8cuFedAOUjaCUDsiRZVQWALX2?=
 =?iso-8859-1?Q?I3AZWfHmHWWZ0H8dFB5k/pB6Mq13Gbv/HibGpFN5FG8Via//wZrCcM8mkB?=
 =?iso-8859-1?Q?WS/9qsd69ZxxqDTHEgA9BtyB5xnRMn9sipXQZRPUFcQEdqY+3GWlVqwN2j?=
 =?iso-8859-1?Q?IbMHk1QYDrrcrRjOZtBMjlq4gRvB/EPoxllbLg3C2iInvwSGmOgBKlbFuM?=
 =?iso-8859-1?Q?CHcq7v/onrrzw6Vnc3ikM1SAICe+lxqmO9wVhHFHh5Or+GLLnScjfy3CwV?=
 =?iso-8859-1?Q?IIM/CJnLQROxu0OMwK0X1wn5f5ZeptokwV0vHKsPhT0VjBLhX5Ru9Rx2B3?=
 =?iso-8859-1?Q?xK51rd0mTRtSsb6NGW44clTj0ffsuHGd14U2G96/P+/50kGgx+lQIAf6E1?=
 =?iso-8859-1?Q?4PpczY03YAjYeRjtbx5OZfPDOBXf4ETntcIpyY91EWgaEJVYw+FPxM4ui3?=
 =?iso-8859-1?Q?EyTi77yUTdKWKe252x2KVc3QAG5X5U2RVjgPMxsEWMz4oszYCBa5nN56mK?=
 =?iso-8859-1?Q?aQ5tn9m0V+DVTgS1wYrnc+a/3KftitQAkrVHmum3GhDsUr25iCpBVWtwU3?=
 =?iso-8859-1?Q?CZnYbS2kDmjC08QiH83bNb86B7CsA7lx8R/UTPwpmnW0zOz8WBL2dzmFc2?=
 =?iso-8859-1?Q?ta6ewR65oZMwU084+EwuJUBgQNhcOuhKkUu6Q2wV9eOzNV/OokV2Djspqq?=
 =?iso-8859-1?Q?KpSyfw9H9RTWzhNZJFye7xWrGXi/1mDAm1md6LTrA5Q1hC15UX4xJ9Q67b?=
 =?iso-8859-1?Q?qH7K+xKITIMx+xodER0YBUg7t+IKu2GqlhxD2Vpfblzgtk0ivxgZ0ByUVE?=
 =?iso-8859-1?Q?X55ERIsY32bfcKAXcRfKC2SYSHH5NO0eLfPnj+wuElJ4wr8fE7HH2Ksj4u?=
 =?iso-8859-1?Q?uiLmpckDePbQAzQ1Xl0/wQR6fKOV8jcTQSwfPZMf77hryBOUqCeV/d8oSR?=
 =?iso-8859-1?Q?5Gx7UueVmM1LAED+8OTwnrDtkd2S+OTj+p8cBaG22F3omIIkCIUhnlM2WC?=
 =?iso-8859-1?Q?odcMW+t18MF9wl4qVuRrXNtb+HcI42s70Xv92JGgrWEEXOAlYwnRhsSqfH?=
 =?iso-8859-1?Q?qxy+h5PVuZ1Vq8vrS78jUqolORkMLDEGBbA4maqubYYEKaizqY95WItuDy?=
 =?iso-8859-1?Q?pTOUaRoIEwAwZ39SGcIr5NAorObOs9W4R9++hw71zGmu9q4QrS4ohEY9Hx?=
 =?iso-8859-1?Q?eC4ZMe6tC04UVNWZovgid2JvhR0nu2xUhaH4ryegjepnwLfvAAf+K8Pt0l?=
 =?iso-8859-1?Q?fWaDULF9LaSffRZxse4OJD7x7wgBbx55xgXs37V2oojIL4m5qHiD5wjPsF?=
 =?iso-8859-1?Q?xIKThybqteqo+Js06N3uNEe8G/sJx440asZZsQBT/Y2B4JmnxDwxxryA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: eee411f1-de9a-457f-ee2a-08dc80e98b0a
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 20:46:12.9482 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uUlzc6lZaOCNlmMLY0zA69CGg+FSGc4BWgJKhHowNzRh5ZP+2jSdkw/KmBCRm/tYfLdSKl6KjU2J0eHHC6PiwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
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

On Thu, May 30, 2024 at 01:17:32PM +0200, Thomas Hellström wrote:
> Hi, All.
> 
> I was looking at this patch for drm-xe-fixes but it doesn't look
> correct to me.
> 
> First, AFAICT, the "emit flush imm ggtt" means that we're flushing
> outstanding / posted writes, and then write a DW to a ggtt address, so
> we're not really "flushing gtt"
> 

So, is this a bad name? I think I agree. It could have been a holdover
from the i915 names. Maybe we should do a cleanup in xe_ring_ops soon?

Or are you saying that the existing emit_flush_imm_ggtt is not
sufficient to ensure all writes from batches are visible? If this were
true, I would think we'd have all sorts of problems popping up.

> Second, I don't think we have anything left that explicitly flushes the
> posted write of the user-fence value?
> 

I think this might be true. So there could be a case where we get an IRQ
and the user fence value is not yet visible? 

Not an expert ring programming but are instructions to store a dword
which make these immediately visible? If so, I think that is what should
be used.

I think this might be true. So, there could be a case where we get an
IRQ and the user fence value is not yet visible?

I'm not an expert in ring programming, but are instructions to store a
dword which make these immediately visible? If so, I think that is what
should be used.

We should also probably check how downstream i915 did this too.

> and finally the seqno fence now gets flushed before the user-fence.
> Perhaps that's not a bad thing, though.
>

I don't think this is an issue, I can't think of a case where this
reordering would create a problem.

Matt
 
> /Thomas
> 
> 
> On Wed, 2024-05-22 at 09:27 +0200, Andrzej Hajda wrote:
> > Tests show that user fence signalling requires kind of write barrier,
> > otherwise not all writes performed by the workload will be available
> > to userspace. It is already done for render and compute, we need it
> > also for the rest: video, gsc, copy.
> > 
> > v2: added gsc and copy engines, added fixes and r-b tags
> > 
> > Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1488
> > Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel
> > GPUs")
> > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> > Changes in v2:
> > - Added fixes and r-b tags
> > - Link to v1:
> > https://lore.kernel.org/r/20240521-xu_flush_vcs_before_ufence-v1-1-ded38b56c8c9@intel.com
> > ---
> > Matthew,
> > 
> > I have extended patch to copy and gsc engines. I have kept your r-b,
> > since the change is similar, I hope it is OK.
> > ---
> >  drivers/gpu/drm/xe/xe_ring_ops.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
> > b/drivers/gpu/drm/xe/xe_ring_ops.c
> > index a3ca718456f6..a46a1257a24f 100644
> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
> > @@ -234,13 +234,13 @@ static void __emit_job_gen12_simple(struct
> > xe_sched_job *job, struct xe_lrc *lrc
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> > false, dw, i);
> > +
> >  	if (job->user_fence.used)
> >  		i = emit_store_imm_ppgtt_posted(job-
> > >user_fence.addr,
> >  						job-
> > >user_fence.value,
> >  						dw, i);
> >  
> > -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> > false, dw, i);
> > -
> >  	i = emit_user_interrupt(dw, i);
> >  
> >  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > @@ -293,13 +293,13 @@ static void __emit_job_gen12_video(struct
> > xe_sched_job *job, struct xe_lrc *lrc,
> >  
> >  	i = emit_bb_start(batch_addr, ppgtt_flag, dw, i);
> >  
> > +	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> > false, dw, i);
> > +
> >  	if (job->user_fence.used)
> >  		i = emit_store_imm_ppgtt_posted(job-
> > >user_fence.addr,
> >  						job-
> > >user_fence.value,
> >  						dw, i);
> >  
> > -	i = emit_flush_imm_ggtt(xe_lrc_seqno_ggtt_addr(lrc), seqno,
> > false, dw, i);
> > -
> >  	i = emit_user_interrupt(dw, i);
> >  
> >  	xe_gt_assert(gt, i <= MAX_JOB_SIZE_DW);
> > 
> > ---
> > base-commit: 188ced1e0ff892f0948f20480e2e0122380ae46d
> > change-id: 20240521-xu_flush_vcs_before_ufence-a7b45d94cf33
> > 
> > Best regards,
> 
