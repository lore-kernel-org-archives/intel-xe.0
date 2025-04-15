Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D3A4C369AB
	for <intel-xe@archiver.kernel.org>; Tue, 15 Apr 2025 17:09:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01ACD10E372;
	Tue, 15 Apr 2025 17:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kwYebFh7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0D10E372
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Apr 2025 17:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744736958; x=1776272958;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OsFsBm6tmvfw965OwhssbbnxoeHZdmMkPrlRuMQBYzI=;
 b=kwYebFh70p/yPXC+riGkV858pKc73F/ygHX86tbZXkXBEdKmCSVBmIq8
 QHf26IxmlLyvyATAMo8QdO6grpAKbwlNqZgDhZcRTB7hFz5dVAtGCmYJ4
 XUJUw3dgtMoh51wfQUPyvccgDbnbwcTJ2H9EPMcunwyBkuQhlc+uGAIcl
 18hxUv9A6aLop4RowYBbGeoQN6HomggtzTOfUwCf4KpZjShNp750Y4POd
 etWfNSLaT/ox2Jqcrd8WIHQHo4rfAD/ts86ZJkwy8JEtT19EsBoDhaHzt
 lJY4HWmT+oClpOGfbyjoaHl1QNo3hq9vHD35TemSmxwRFvKtPbCwDh6ep Q==;
X-CSE-ConnectionGUID: RflRY/BDT3+nfz2OH7MvJg==
X-CSE-MsgGUID: RY/yXetFRVWM6pG1sj5w2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11404"; a="63660135"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="63660135"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:09:18 -0700
X-CSE-ConnectionGUID: Dtbik8nKQ5ODGuNrh1CNyg==
X-CSE-MsgGUID: m5RK2d/DSyOtMwtizXf6nA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="134283430"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 10:09:17 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 15 Apr 2025 10:09:17 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 15 Apr 2025 10:09:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 15 Apr 2025 10:09:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i3k1qJzXvu3MKH9MTvby5gVweo3Tp32v+tthkxuMKW8S3CX0hBd8FdY3LvZUTQLRhsQ1Kl+45tjerwJKT487fXI48hYc8xfetskK0wnPA0DLG56sJHYnCFuz28zxytZCVqwfSk17AGHcblZVpfF9tubussPPicdWpEFxJGDJ3VHHmPUeCPkfPpN/fBqyTyTqFPQTpPnyyjCRNHv/Nceduy3AexsbldI3PF35uNugiKlSoBc0sIv58SCscE59uBDE7nM6c+365XcKkHFaRo/C6r77U/VsEmeSfoLCifnsCZVR1f0+b8uqC6lImAg1CYycQQtPxi/T5pWf3BscH1oP+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9mzy3RMdZqeaEitQqLHRQsTep7Blx2uomapaiokJNQ=;
 b=Z5ppN3b+1boiR5BdIB5v+xUalDtb2ZrmZadekj+cDfHWNPB71KoaLQVOJ9HK/nAfC6QxdDH6z1UpvCe+uQaEeRhoXn/V7M3qGPvB1iFh5JtSRcYOW63r3noUVJD0b6+F1m7G3++K1CewEk0/3Q0ZLZX2EZmYbjk3/SSLpidLzCyL7YK3V9MGDi5jiD/3WNF5ladNUYBZ6uVe58SdRCZATC3ThHnBIKzvhmncUeJLc62Iob0gJryzg6M6gTfu1HibZm5vH0MmJiijlTsCUeNSJzKNRoNE2/9DgzIKFz5bkmkgy0NvlArBu+AknwCl7xozr+9+PJgVSGsE1UND/LPSEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB5287.namprd11.prod.outlook.com (2603:10b6:208:31b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Tue, 15 Apr
 2025 17:09:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8632.036; Tue, 15 Apr 2025
 17:09:13 +0000
Date: Tue, 15 Apr 2025 10:10:31 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 3/4] drm/print: Add drm_printer_is_full
Message-ID: <Z/6TB/QNRrCAtbIc@lstrano-desk.jf.intel.com>
References: <20250410040622.238389-1-matthew.brost@intel.com>
 <20250410040622.238389-4-matthew.brost@intel.com>
 <87h62wuson.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87h62wuson.fsf@intel.com>
X-ClientProxiedBy: MW2PR16CA0049.namprd16.prod.outlook.com
 (2603:10b6:907:1::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB5287:EE_
X-MS-Office365-Filtering-Correlation-Id: 54400ba6-4ecc-46c1-817c-08dd7c403eb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lsGCuE35P7rDaRXTxnt/uxiMN88Zx5iGXLtIRQo5HcrRncY5GYknKgAtlgzd?=
 =?us-ascii?Q?pqLY9c8BvppE48sj6WYscu05Kxlpg3XJDhMp1P0qbm/+wafK+gYTQpbT3fgS?=
 =?us-ascii?Q?i8Xo9QiGOIJe/4GM97rJYoDrH0ERWqMotNmnClhsesqaly1tRXkVe8KVuTLM?=
 =?us-ascii?Q?h9xGvip7Qfeni13cDrB8X5cv4TRClCX0BRbnqLg/0KdQBRKSZWwQ2OLdBZXG?=
 =?us-ascii?Q?OLZBQPPaf4uhfNP0NqRBI4n0Au72KKk2BujtTX9wN52e/sqcVMfNWUTOKdlr?=
 =?us-ascii?Q?xClM/+rYVyX6/zfsz97oHSVVGMapKRfoIuON/ITQUC88emKhta5M3W880u5D?=
 =?us-ascii?Q?Pe+pn1bEnAiQVoh9UYxRnvtC7lqh7pHBD1yEeM/Dmy7KqVHcIKIoV2XiujuE?=
 =?us-ascii?Q?DjGcGU4TMPqd3Yo6Qr2GSeTBcEArBPlQ9uJgVkBESdSVAR0Kr5JBzMagMeQL?=
 =?us-ascii?Q?7uvEsiuSQLoW/v1EV+rAjGIaz7PI6x1Vwbiso1fD3FkEk63OBrzD5U5F44C+?=
 =?us-ascii?Q?sZOs1gEPV3NGCw0WObG8rD7mmh1Yq0HCFv+miGs1NJMppzxNHVaM41JxbKxI?=
 =?us-ascii?Q?7njx5vS3WDWcURuBIVV74KUCIZpp0Rw6qycjvyis+5BcEcv9CWtBuCpEFCRm?=
 =?us-ascii?Q?laVjxkRXgK3/Znsjsm35vW0MeYu0nbokg/W2YJ0kokYAOMmrLAfSMe1uKwwq?=
 =?us-ascii?Q?A1ElsMPUBnMt+vtf9xnSGioVsj8X8WjQhb3NKM5YZm6UagCKh3B32Jo0p/Au?=
 =?us-ascii?Q?7oC7N0zzieUXkhjRFl/mFnxMEmmP2fJ/NpywL3yFGz24wiosQW3qpD2ToB55?=
 =?us-ascii?Q?Eo59qJT+ae4/mi2yIfGlNaw63dPmCuwh/9lGCRKHebJud/ZXDpwTh+lw3xBR?=
 =?us-ascii?Q?oMQS8bitnKqA26df8jADufWz7yNblhd2XyiU7KFFcQWNvGM7ZGrKNRUcg4wc?=
 =?us-ascii?Q?jojssdRNW1UZJMXWfMuz9/B3YwuN4Uj3zfWAGLaSBBjrLi3zZoM/oAhNhRJh?=
 =?us-ascii?Q?4PesLsriTqS2LVNrMwFIjmxpLEeMDG785qfo6Y6GQSPwaLD/O/gbCH7kgge9?=
 =?us-ascii?Q?b7BHOCkgV6all40xUbjI+7Gk8J0BQ35ytBz7UVEoliaUmbcKhdWVBlRdDBoz?=
 =?us-ascii?Q?M2HAleYqI9lmvsenlI1leC52kqJx/+2v4zWAKcXRdHt2DYirMsRd/02vvIWP?=
 =?us-ascii?Q?gyvekQUzr+lmn5UkLPF3sobSPBBKxcVHi3KRylG1qJpLUnmAnE8g4+AJmanZ?=
 =?us-ascii?Q?uwCHp7YLHkvpC2L7U2SHICqvlFBR8uZXqkVH7Yhlxj/Rge/Tsg3eGpX2UXNj?=
 =?us-ascii?Q?6S+3WBBaEujiGOIXvPZIFXY6v/7TvB6aU+kSbCVHuDbJDk/AND5m1Je7Nu8B?=
 =?us-ascii?Q?qoENoNNn+ifO6DvR01Mh/Q2yWBDb+L41SzeRidNz+YZAXBYAEXXKds7yqzNT?=
 =?us-ascii?Q?/p7YdUtuO60=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XoH+ymcoqiLlTMPnsT/87t4cha12bXaPRsenV8ujx7zRC5vf7wUDwy9LsjK4?=
 =?us-ascii?Q?6a5pOxlzOKVVy9RT2zNoeBal9/bHhZ6qhDeZxKFCVNrei2CqURj1HHswsjz4?=
 =?us-ascii?Q?4guVgZPkrsRtE7NcChVRnZZ9cJIwwCQPJZmsLYcAdt+xwlWUNB2r9kRWXxdy?=
 =?us-ascii?Q?/oCg8MY3YUR7xS5cdE6Ib0mV1OtTJ0kS+EFWoOFUkNt4oiUnu2nKSQt8MJ7y?=
 =?us-ascii?Q?oo6LISMXGdoDWBkM3fn8BcaT6xTsa3gDBC2Y26ek03kOaFdj/HuZ44EppbJH?=
 =?us-ascii?Q?vq7lyvky3NesAsa3nsQf9iph0yTq05OzjX/5keH6ylYv3bRnk1ynkFy9/46d?=
 =?us-ascii?Q?7JaU6zwsEAPROS1RuNwi3TFO9S4k9LTrtEGzNHmAZCmS/e3vIqBG57/XrHZ8?=
 =?us-ascii?Q?1WavJUvx6ylM3pTLIwzad1K+v6Chq1oEp1cQbwvj7+j2wsO7zcCgK7iRRaXU?=
 =?us-ascii?Q?dRlJtfqgDBRziemuZwW1u5MBkaRmyfc8WUVdcjZV135N1U5hPlcwI0KlYML2?=
 =?us-ascii?Q?qFbuTMheod8hV2Ilm/wCqgJYLHblsfrNaf3r0hB4jYYuuKOyFDNpeQVBW1AK?=
 =?us-ascii?Q?TJvdzLyjA2nSmHRVypQHpDK4uMAmUaAd1eBOTaQg9inZ/f9s9ksvOd3amjue?=
 =?us-ascii?Q?vUqgWctUF6Lsy1KNazTK5UwqvcsH6YsS2TYfuXXvny4rQD1JMc6fFN7TgkxP?=
 =?us-ascii?Q?3xubDCUjd156dvf9GA4cGtzUuGedbMqbyQktIJJvp8mQa38kidHRfCLLt5Xk?=
 =?us-ascii?Q?NC/5Kv0m4t3ruB2e8dzMq4yTeduReJcuAl9xE/9sXcRlAuABgBCsVRvGo57l?=
 =?us-ascii?Q?9+wafJyY5O4CHXQiG7SswqMsMCpCCvZjfC3cD6Vv0ivKEiWNCa6h/++WIH+a?=
 =?us-ascii?Q?y7eS1sgQaxjeq+u+VAmO0a9gvREg+s6w/IMr0hoqfdizMwzqg1zMQroNzyvL?=
 =?us-ascii?Q?zpXBxNb6ieqjmJ+mnadu8dYI8hAHm1E8zohdemJRKq/VaY7iTU8PQpvfHuQ9?=
 =?us-ascii?Q?P7uQP8GWLUkNexqawzUEtJko9D4jbLbQQEryQ/uG5PSEpbE9/Vy45NgXc32O?=
 =?us-ascii?Q?uJxsJF9v6YbjWFt/F4jmQpAxbI8BQOoqp91ozx2Rml2KgvI2JK7hOPTSq/nA?=
 =?us-ascii?Q?/Dm0083JctxQVzsYtng7msYliuJyGA/lQuLVgCNrrerb+6kTCfORXrJtNnNK?=
 =?us-ascii?Q?rQmkrl0h0tV6Vt7Ga3lHgB5IxqoYsPpZ+bEKZxHjcO3jhpkcf9PDUau3rBo4?=
 =?us-ascii?Q?+8+i8yjYzWLAodkCl5fJi6+0fao1IDcvaJr0/yKERnM4gGCLSwhwoUTC0tg3?=
 =?us-ascii?Q?Vs737sUMoITsIyxnGGQixTFvPm4mAnlqZv2sJGUJgCGv/DTVD0cmQhXNq5NI?=
 =?us-ascii?Q?4LaM7evEOB8gjjAOvB79ZIoWIUA/LTYm8Tm6SLqAG6LS2eVLiaZZDXIgBNYk?=
 =?us-ascii?Q?DCb9J2qJvoidMu9UEmvZkqVTObYcnag+PoNSa2yQn+alAexBmeERvchzIznj?=
 =?us-ascii?Q?q91oY5xrV6amin7CndlNFvabRuSueXTDP+Z2WSXthQJRtggcp3l0pZdrdZH9?=
 =?us-ascii?Q?anjaVryxtKYv2gz9tlYs4JfYtTMsKfy0Ow7tezMXGF/jmVhDIe5+t/ESNUQW?=
 =?us-ascii?Q?PA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 54400ba6-4ecc-46c1-817c-08dd7c403eb8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2025 17:09:13.1170 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqly+BvOf/x+i7xcVNmIbdGZLZEjdQh85rtvhH0Vl7eLlgVvOs9UD6fwZ1zAFbhy04g2pHDLiuoUW75mntGjvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5287
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

On Thu, Apr 10, 2025 at 03:06:32PM +0300, Jani Nikula wrote:
> On Wed, 09 Apr 2025, Matthew Brost <matthew.brost@intel.com> wrote:
> > Add drm_printer_is_full which indicates if a drm printer's output is
> > full. Useful to short circuit coredump printing once printer's output is
> > full.
> 
> The function is presented as a generic drm_printer thing, but it's
> really only valid for a coredump printer, and will return random results
> for other printers. Which can't even be "full" in any meaningful sense,
> making the documentation for the function seem completely weird.
> 

So maybe:

s/drm_printer_is_full/drm_coredump_printer_is_full?

Matt

> BR,
> Jani.
> 
> >
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  include/drm/drm_print.h | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> > index f31eba1c7cab..db7517ee1b19 100644
> > --- a/include/drm/drm_print.h
> > +++ b/include/drm/drm_print.h
> > @@ -242,6 +242,23 @@ struct drm_print_iterator {
> >  	ssize_t offset;
> >  };
> >  
> > +/**
> > + * drm_printer_is_full() - DRM printer output is full
> > + * @p: DRM printer
> > + *
> > + * DRM printer output is full, useful to short circuit coredump printing once
> > + * printer is full.
> > + *
> > + * RETURNS:
> > + * True if DRM printer output buffer is full, False otherwise
> > + */
> > +static inline bool drm_printer_is_full(struct drm_printer *p)
> > +{
> > +	struct drm_print_iterator *iterator = p->arg;
> > +
> > +	return !iterator->remain;
> > +}
> > +
> >  /**
> >   * drm_coredump_printer - construct a &drm_printer that can output to a buffer
> >   * from the read function for devcoredump
> 
> -- 
> Jani Nikula, Intel
