Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B82E7717F
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 20:13:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ADF410E0BE;
	Fri, 13 Dec 2024 20:13:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mWkVYjf9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FAF10E0BE
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 20:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734120807; x=1765656807;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=qNecW3pl/DQfzrlamwQeA7fR/JqAfFCQQdhGHFieEqU=;
 b=mWkVYjf9JMSVk7afDgMYnDooLn8ISqoQ0LsQbu5tQJ02MI6FnK3uMUWM
 LmA/W2805H1+kIp3/UsZP9f6H+U/rPrAbDgRRaSwonA1Db78xNDxPrgQK
 L2AQiH1n/WuVknnqzcfSQQVW05y7uXkA1xCF1jzRgwD75autXPmaIZTye
 7TS/UkTSQMQE88HHz2SlLkPHP3sVtcY+hHmIUpFr4q0LemVIplYw78HDe
 uzhCcTDqqBtMXWjYbOVd9NWjizzd578o+Jtu3WBTLDuyw0H4l7r+xo55H
 4Tp1NcCpm8jZ+BHca+8/AlqjZUWjxQJ59F88kwEoTGdZuY98H9QRGJHah w==;
X-CSE-ConnectionGUID: kIT+vS5uTBOSdv8E8/zpkg==
X-CSE-MsgGUID: rS+XT5ahQCCxLKLl6jo3JA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34486217"
X-IronPort-AV: E=Sophos;i="6.12,232,1728975600"; d="scan'208";a="34486217"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 12:13:26 -0800
X-CSE-ConnectionGUID: Za+TjtfzRMibUaEJUCFZSw==
X-CSE-MsgGUID: eiG5+le1StiF1Wbn6D1igg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="100780735"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 12:13:26 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 12:13:25 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 12:13:25 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 12:13:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQDxGCGMkd8vw8gZGA6bBh6hdT1nG1QfPUrQJep2iy4JLuGDt7YVmMLoi0vev1BQ1h9p5M3Y6QBP/XceB66leCic8TzXG8kHM73wVelk+wujJ4SnUhEJaDolL5R6Wa1gfb+co25bU8gp8GNYWxMoJnGCTJEEbAyuJpMYQt9A3+AJK7zQh5pCIe6SHd4MGksA+INX0cUJc212huDrkFoZ9dP+GfJOa0mE2AgMv5IqP33RUny4PtfMruJyT5qY/emq7vmccGyRzuEKjbGYml/eWt/dQXSWFb2NrdbQO/Y2jbdQ4dHTxNcGaxesc4udi3xDpzZ2RXx+o04xgLTC/y2j0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVHg1b0hCowZeiGK1HGdnzZO2+jf+UWUdofVJOm9Pxk=;
 b=jI03jEfIFozf3mrhSDPf/PVnKsjK+bulG/WP5YYtR7xlBLLBtwi7T7VPgZrR6uE1Tw0Fc5/GbQit11XwoD8TStxcPZ2ED8r7OW9jEaqoCiK0O7bDblGnTCLcU0dCx2fkmyBiMatRx25PjxaZu99Wvl6c+XS0ZohGA4GbOeLhs+A5jplT7n6vCuFNFCsvPwxvTt+piSisJ9MAIn/WhHYzyPOq50s9eIjk8ubSU1txjhmUmlcEVOyIldXTxH7XNEKOfUkI8puRCV8Qgb3XwSflB0pPehvjqz9CRb1/QDDIvrnL713/wyQipNCsk53E8V60Dch0ekKZxI64v2m4z+REeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB8282.namprd11.prod.outlook.com (2603:10b6:806:269::11)
 by BL1PR11MB5288.namprd11.prod.outlook.com (2603:10b6:208:316::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.19; Fri, 13 Dec
 2024 20:13:22 +0000
Received: from SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72]) by SN7PR11MB8282.namprd11.prod.outlook.com
 ([fe80::f9d9:8daa:178b:3e72%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 20:13:22 +0000
Date: Fri, 13 Dec 2024 15:13:19 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 10/13] drm/xe/guc: Introduce the GuC Buffer Cache
Message-ID: <Z1yVX8wtuPn_6X9V@intel.com>
References: <20241212010141.389-1-michal.wajdeczko@intel.com>
 <20241212010141.389-11-michal.wajdeczko@intel.com>
 <Z1pY8LNHWTWFm+4f@lstrano-desk.jf.intel.com>
 <c6578aa3-1449-4469-8e4c-b7231e81529b@intel.com>
 <Z1x/Dd9WaaKTcABC@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z1x/Dd9WaaKTcABC@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0109.namprd03.prod.outlook.com
 (2603:10b6:303:b7::24) To SN7PR11MB8282.namprd11.prod.outlook.com
 (2603:10b6:806:269::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB8282:EE_|BL1PR11MB5288:EE_
X-MS-Office365-Filtering-Correlation-Id: f221b645-9dba-4e9c-f522-08dd1bb297d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Dq45+uiNXcQCz4lI93WPXduL3+2KOVHppgEQOEeK/MLwSdxKJC9jnzD3Gq?=
 =?iso-8859-1?Q?cA8WimX6mEoRggMnUniUszMZ5BeV7D+sbjBLMMyVA+urHZPTMURnsOHO8E?=
 =?iso-8859-1?Q?ys8oSKZHHJePFQ9r2m6e+c08dpqZnIHtKQWnYl8UHt0deHrsPaAR/VDln2?=
 =?iso-8859-1?Q?fBPq/v3RCJg9uGN0JRvrovPcsYXBxVBTiABFqWqrQllch19qsCo/RRpQF3?=
 =?iso-8859-1?Q?OaRbcg97ZoI15FJMru9iPno7XIc1Zf0bqDRfgReaS9XSXaY8zqf5gV45pI?=
 =?iso-8859-1?Q?mzL4MMt5dWPyIGWDtihVY0PMeMTiw+FZ+gShWEs9iepJwrI92tRuVMFbBX?=
 =?iso-8859-1?Q?+526rncX9DJ1HUggiPC04FpjiIylbHCJ6awWdhqn0wcpm3B2mFHpVEGJ+j?=
 =?iso-8859-1?Q?+VwoZRxhfwbaUZcRqtk/wMxhGlvybqw6njFmeLLDQMablIOf1LbOGWz48P?=
 =?iso-8859-1?Q?jexWr5PP4wsMAvXMREYbguqJ3wURC9fNSQ6JFRrN/3tGaGlsld/LM5zDJF?=
 =?iso-8859-1?Q?8USHyCV4cy7oo4WuOzs4xRUVSitqQ8HxTHXfT/im4/uqeTaGQKEdH2zsoU?=
 =?iso-8859-1?Q?yWHU3werKrRsJPzdvfagy4+iHh5qzMZUPRPJZ02FHf27P9f7cSpCYdWq3C?=
 =?iso-8859-1?Q?NQEwluea8K/9PW0S+1+bOIZsYlOFbsxjeH5X9B7KxtdenRXMlu7vehkOXH?=
 =?iso-8859-1?Q?PNhrsr+QBw3XY/0iq8u/QZIYBN45TWq4XUXuIvwDazuuSiTilLW4GcwOwt?=
 =?iso-8859-1?Q?7LZa2mXBM1OwkHXfIFCet9I3vsYIC678X+ts7ih8pg74+e2eZhc+8TN6xM?=
 =?iso-8859-1?Q?ge6Yy1zj8i1EUlKzvpA5KU2tS8zTkJ/UuLnbvRl7+clAdqyNUx9xdlqZIC?=
 =?iso-8859-1?Q?WhlkPsgDxR/z9mUp2uvxkah5f1Zl+NtRGVTB7Vr9Ykj6hEpSJsi5yI1iBv?=
 =?iso-8859-1?Q?NkWl+KEqL1LTWLMkawOktM1NSrvexMNWyPa6cvyfgbRA+WKrqAibjbFjoh?=
 =?iso-8859-1?Q?LpDukzw1jBjpO/QeOf8LPZpMSw/JZjxzXbmjVzWV/WBVMxTedt9u402pWq?=
 =?iso-8859-1?Q?R4S+RSXAZffmYcCVTiq5lJtM21rkE/vIZJgwuSYGh71Ht5/HMv+CoTZreG?=
 =?iso-8859-1?Q?ieKc4tWCdymVRvkLsxQT2MD8kN/oT8CVys81U+knhFoCchNAqeDj7QrTuq?=
 =?iso-8859-1?Q?vJ4BVt0tvzURkyPQL1c6YBrFETf6S4UQpgdHJEn+DdvzcsveZxhHjjyKNB?=
 =?iso-8859-1?Q?fBKlALKV8Q5LgMb4O2SD1z/GcsIqjdzZpVdETvIUSbE1CvH0P7XYfa9zAK?=
 =?iso-8859-1?Q?ZiCM34Edp4EzWij/jmaoTDZFQAAkFTVANG4IjiaF+otklrGTbebqSBtp/M?=
 =?iso-8859-1?Q?xtTs7GeRWV+k0sD2pnRBmY2wEgLruCgoM3SMgFVq3zJygtT2BID+s=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR11MB8282.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?3uOaFAkpUwdVG4h8sOAPxv6dD5vX7lPRw/ioBgiCEr8gXHVuc5b5Fgyhgx?=
 =?iso-8859-1?Q?chfLtfXwMQKkLJY6gdT3RAWe6hWQDft21bm8KgoE5a5sjK1unP8kqP4o2S?=
 =?iso-8859-1?Q?BmxaTPmv7A5ypyaj4zHbTE5zQWDimOA0t8grC4fn6ntESFNz8zD4o2Cukb?=
 =?iso-8859-1?Q?uaD06bl3wmJBYrQyDVhlXBqO3RZSrx8rOhpTLRO6fmPLc686Db9CSvYVSK?=
 =?iso-8859-1?Q?1v5uPX/C3fI7uDEbQLoVJIvKRFGYTyKl4MTHZ/YxtVGUg4xjvh0iuQ5h9b?=
 =?iso-8859-1?Q?KzfSX6OwWrcf5K2U5ch1qFGpPqEfSw5kg0+4/BF10ol7H2+it8CYoO2+zc?=
 =?iso-8859-1?Q?//IHJG1EI9pUIq1K3Vvs88sB/Vz53WxakJCEk+Yn7i4rN/K46XREL6Hiz3?=
 =?iso-8859-1?Q?2PdC4I+sIVI8kHoYPnaRrL37eY1pxlGUgNN+ob5hpadhknDJKhgMyAVzTx?=
 =?iso-8859-1?Q?xndTnEe/3XQx3jVfpDilTP71hpyI7Oi9rowAnIPtV434wPNw+5vlpBekFy?=
 =?iso-8859-1?Q?474y0+mmC0NbHHUY0qEk8cbEkSSxucGYqcQQE8qVmMxj9Yxuy88eTjmsMs?=
 =?iso-8859-1?Q?FGJYvlKgPhiCAsL+oIGPzVgKrMptqgDo7STND1i6RfhUK+/oJFjhs6xr/A?=
 =?iso-8859-1?Q?C/Z88bxpXoSgkn4y3X4SyNnizwzGaniJ/W9SVBdi3oLsZoD5xVElqdukoB?=
 =?iso-8859-1?Q?DpGfhASTwUTy/8Ufj9++/5Kf5N49AG7attNJFCjAfdcF6JKTRLjDvpoaza?=
 =?iso-8859-1?Q?Tm2obO4G386SlTXx01LPUwrAAPMisYirFtJb+RAnxSUHK+STsMJ1zhBp4o?=
 =?iso-8859-1?Q?56fj2uCTvh6Jen1jHdrvcaTwWhSaiUc/74j5hqy9MvdqRjK23eyzoJ0exx?=
 =?iso-8859-1?Q?vvTRqjLxJ38UoAyFZvVNdgr24cZzUj40RztFEETiT23MIk+th+hCtR15X8?=
 =?iso-8859-1?Q?rLuCQW1a8UuCA5UWaVAZbgw9TRihzkdlQ98URPlBKk0Fuhtxhr/p9y3B4x?=
 =?iso-8859-1?Q?e1J/0sKWgxRP9ByoUofx/KNoTd71ZkT/PlxvPUTX06MDbDu/5bLPXTsxFJ?=
 =?iso-8859-1?Q?1uMdPhKm8+5ybSfXUReRNueMCZorM3aicHXntSwPtzcIE7DdAZAY+9F81+?=
 =?iso-8859-1?Q?XNkTKdYWk8cOmwuXbn5HroJNoYNYPsIfXN+nyn4g1UM4qVW8+A8k9ukYwo?=
 =?iso-8859-1?Q?oUFZyVX/5KDZDslqrOvETy2Ir6k7lnTDZBlHw+aMtd8udsi2kJuFw8Ala7?=
 =?iso-8859-1?Q?CZlLkEJBKkxsudW47/5n6ankpr6P+vcQROZ0xaiAZxRKvZ/tUDrDisS9oI?=
 =?iso-8859-1?Q?x8eMmzhtk3paS+OItFRrsc1N0rercHkPOgctp2p50HaWY7t0dOoL5m+OWl?=
 =?iso-8859-1?Q?NSgkrOJ9CZAVMFoRR4zrg5WdJJQKZ26kiSjAJ7KU8xZKmuUzf/vTiuBwuy?=
 =?iso-8859-1?Q?rW97e/U+cDIKpSYbrquj2JP2xXzPUSS8hePknxGgYdTV6zvg7R4/alvy9v?=
 =?iso-8859-1?Q?wImDpf3xnAC7T0MSp3yqGaiYNXEvqjyW2F91XUGnxNgWZh1Uuz22ZdJV5O?=
 =?iso-8859-1?Q?lGv4RpBsxNKP09/sllqsDIf1RhuvyRcJPUvzAbDTaeKOy3BfMmeGcT5/tZ?=
 =?iso-8859-1?Q?m3HV+kCHpm3HxV81Qv4OOP/XSz6lJMkZz+SV2tKCT8etKGVJ22TXmtlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f221b645-9dba-4e9c-f522-08dd1bb297d0
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB8282.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 20:13:22.3919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbE5ouYA4hjV/evVwmmo0TMlpNYZ6LlBt3stxiKbuO2SqKGHbJMiwdGW9Bz4n8Zq03a7zo/bZhZIVs25NWUAhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5288
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

On Fri, Dec 13, 2024 at 10:38:05AM -0800, Matthew Brost wrote:
> On Thu, Dec 12, 2024 at 10:48:34PM +0100, Michal Wajdeczko wrote:
> > 
> > 
> > On 12.12.2024 04:30, Matthew Brost wrote:
> > > On Thu, Dec 12, 2024 at 02:01:38AM +0100, Michal Wajdeczko wrote:
> > 
> > ...
> > 
> > >> diff --git a/drivers/gpu/drm/xe/xe_guc_buf_types.h b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> > >> new file mode 100644
> > >> index 000000000000..9e123d71c064
> > >> --- /dev/null
> > >> +++ b/drivers/gpu/drm/xe/xe_guc_buf_types.h
> > >> @@ -0,0 +1,28 @@
> > >> +/* SPDX-License-Identifier: MIT */
> > >> +/*
> > >> + * Copyright © 2024 Intel Corporation
> > >> + */
> > >> +
> > >> +#ifndef _XE_GUC_BUF_TYPES_H_
> > >> +#define _XE_GUC_BUF_TYPES_H_
> > >> +
> > >> +struct drm_suballoc;
> > >> +struct xe_sa_manager;
> > >> +
> > >> +/**
> > >> + * struct xe_guc_buf_cache - GuC Data Buffer Cache.
> > >> + */
> > >> +struct xe_guc_buf_cache {
> > >> +	/* private: internal sub-allocation manager */
> > > 
> > > I think this generate kerenl doc complaints.
> > > 
> > 
> > or maybe not, see [1] which says:
> > 
> > "Inside a struct or union description, you can use the private: and
> > public: comment tags. Structure fields that are inside a private: area
> > are not listed in the generated output documentation."
> > 
> > and CI.hooks is also fine with it
> > 
> > [1] https://www.kernel.org/doc/html/latest/doc-guide/kernel-doc.html#members
> > 
> 
> Ah, ok. However AFIAK we don't use this style anywhere in Xe so maybe
> double check with the maintainers on there preference.

As long as it is in-line member doc comment we should be okay.

But do you intend to expand these 2 structs later? It is kind of strange
that they are exported in a _types.h with only 'private' members. In
the current way it doesn't look like we need this _types.h at all and
only static struct in .h or .c itself....

> 
> Matt 
> 
> > > i.e. Should be:
> > > 
> > > /* @sam: private - internal sub-allocation manager */
> > > 
> > >> +	struct xe_sa_manager *sam;
> > >> +};
> > >> +
> > >> +/**
> > >> + * struct xe_guc_buf - GuC Data Buffer Reference.
> > >> + */
> > >> +struct xe_guc_buf {
> > >> +	/* private: internal sub-allocation reference */
> > > 
> > > Same here.
> > > 
> > > Matt
> > > 
> > >> +	struct drm_suballoc *sa;
> > >> +};
> > >> +
> > >> +#endif
