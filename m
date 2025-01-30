Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFFEC0218D
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 01:35:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6328E10E036;
	Thu, 30 Jan 2025 01:35:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nlJB4oZk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F87F10E036
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 01:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738200944; x=1769736944;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HDBCdRiHNJGmgOZWxFtI/sKAJaQ0ZuiFVZXMt7oBMGc=;
 b=nlJB4oZkJxlokXdzsjTxPVT5ivqrSWSgU+Ne1rremmI/AR6wG1YPdcqS
 nQwyVSo3tywGOorC470g0JfVTP1fjqmO2iMCG/69Qx+S7k/FOKg5ZR2K7
 RPqvFpBgklI77jEND4BIRUD3b+3LZvkaDRFbXbvwTk9EUbx3lJu+eiT5B
 e5rAmIjdNwJBzgSsFTdiaEZxCc61/834jxSdLsd49RGab1LuIdrQzFU9r
 tZ0EeVbLOYtSN9eCgbltcm4wdCUc03fKFVoWP89twVUJCIwkyDuTvw1jW
 0+J+GUrn93KcvN8QPFXvoqWUPCqva8dtaCUC59W4yFIQcE/8cG+KZYyOX A==;
X-CSE-ConnectionGUID: SE7hIYzAT2Syw1ided3kaQ==
X-CSE-MsgGUID: AWdmlSUxQiO++IfjVE0cDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11330"; a="39005460"
X-IronPort-AV: E=Sophos;i="6.13,244,1732608000"; d="scan'208";a="39005460"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2025 17:35:43 -0800
X-CSE-ConnectionGUID: HBeIITovQNmHK1aZ4JT0TQ==
X-CSE-MsgGUID: uu+ZOx2/QeSgHFfakpi+fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="140077280"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Jan 2025 17:35:43 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Wed, 29 Jan 2025 17:35:42 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Wed, 29 Jan 2025 17:35:42 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.175)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 29 Jan 2025 17:35:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=defNziupPQRPGFWNUOUBA83n8gUpfOhV5+2tjlHVMXc+S3QMMoGECMyBqVpU/NM6rBoBMroiF45eYDKO9wsi56BwVwHlOHCqHqU80mYiXGFmabGD61fhxgDtcznc7hTJuw74mcF9LDynSb/ePFi4XH/XvDhhI2cGlXBvb+FSHIyGK5r5rSnIZgBRnzBwE22O2WuYhoOZ76Z69YUQebQBTSlXNAWDqNtkM7o/p+4yKPIJYAvE6uloXuvwCKuNYa+5aVi/BmizJ6l4llD4gMoB4T5zGT4kp3ERoaZklyB3J6Ths1iXKG0VlO5RQcRBnbLQ6gyhA9+Qfd92qMdv8TwJmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UazGegamQ/kXaA0eqnFcDLAa7TeY3zTGaqTj7j37Qzk=;
 b=t2U/5u1hIWEqI0JvD3tFmp833Y15asbbSEIXZWVnCxUt0+/bzSx+p6p4P+hCdSvyEUnZZZLLQ2cwprdA4GeVa9lEZQ1ogHlTjm6Kspv7oml5H0Rct7CnEy0yaBVEu6iO7Wlwp/6qs+NbRpa6XmttXEYMkeMpUMtZAJJvpTqnYM4Pl57EnHBjWbwDgTfNR7gZCT5c4qmcEZ/CceBRCZRHLDsYfVdUJRs4hJI9QIWV0q5Y1kSypb7fogxH0Sml9LKhjE5G61AwzlIVe8q+nDro6RFUmm7YfqczjrXu1Dmb7DbM56CjuXop/6qXU58v000HvX13DvtgtOYQ6oHPSUf8Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by DM3PR11MB8758.namprd11.prod.outlook.com (2603:10b6:0:47::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Thu, 30 Jan
 2025 01:35:39 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8377.021; Thu, 30 Jan 2025
 01:35:39 +0000
Date: Wed, 29 Jan 2025 17:36:35 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "Thomas.Hellstrom@linux.intel.com" <Thomas.Hellstrom@linux.intel.com>
Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
Message-ID: <Z5rXo41N+OmJaN9Q@lstrano-desk.jf.intel.com>
References: <20250128222145.3849874-1-oak.zeng@intel.com>
 <20250128222145.3849874-2-oak.zeng@intel.com>
 <Z5ll8YZidnxz9Pp6@lstrano-desk.jf.intel.com>
 <MN2PR11MB47285CC53C87B37B279D7C4092EE2@MN2PR11MB4728.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <MN2PR11MB47285CC53C87B37B279D7C4092EE2@MN2PR11MB4728.namprd11.prod.outlook.com>
X-ClientProxiedBy: MW4PR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:303:b7::20) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|DM3PR11MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b17d1d6-7273-408f-0df8-08dd40ce66db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LnGv1GO5e0Wite39pak2SZEBuW+T+oNyuEFwoKaFLBmh3E44LQevdrBadAjL?=
 =?us-ascii?Q?9QgI0lGynCY9LCeMpdCmzeBF7UMRDSvL7sbLGnl2ND/Z1y8EJeJVuNFMaRk5?=
 =?us-ascii?Q?7M1gSOQlg3M4gmiodQMCKIgl2jC4Lp/Rb8v07nL2xWiJ/bsvPAf3G+H4EqbG?=
 =?us-ascii?Q?zzXgSW6y3Ga99f6xn9nZKSTuHn1ssEQJlWYUIr9Gg2uQX/8o84yWdpiKnQiZ?=
 =?us-ascii?Q?1/MDWlq9pvwKPctDTtpLlR632xNfYRSeXeZ55H4h5d0d8NKEVHM6UqhUa5jZ?=
 =?us-ascii?Q?cKDKvJvYM5tHG7WGIl/i1tSzUHMh2DrFc5xqLxyqD18HPxfBtUe1K0Wq0EHA?=
 =?us-ascii?Q?POrIZ5hKgbCDmHn41//jRCWUayePtj5xORV8RPJGES+Y047Qwy4RS1rqk03v?=
 =?us-ascii?Q?zXN/sNYmAE1dyRV6SLgg3Sw75wtPIb2n2TttGuQ92sENsAUSbEBIt2WtwHkl?=
 =?us-ascii?Q?WXs6PYu6RZ4YTSX9Mc/jcTLWIsq007rLxBC9NPHZa5HNdXNCPOpygYZEZ2gu?=
 =?us-ascii?Q?oUPONa07Cw0/z0vt+lXtcFPUP0Ixsxvd+wta1WBw4I+2bXvh1m5nXXm0bl+P?=
 =?us-ascii?Q?k+epoqKaMamc+VhMlMkKxLxGYYuWTX7nhAvXPT5MBD1BxWD0FSuUtKg5Jcao?=
 =?us-ascii?Q?JXbpQ5o9pTirYKOxDZmZvRryLtQi09VjWhFvSHOnUMiLgL4KHdkHENAi55mK?=
 =?us-ascii?Q?tfIjpSqB1kHxD9l2AHt5dzg1nNBzw6gv1F08q2nel8WPvuiNzpwh7k0ZiD7a?=
 =?us-ascii?Q?DoDCUMu7l+jk7YkS1n0GuUzyGfcI0W8OLKjqGuwcKS04GvlKqTIPxvbnA+wc?=
 =?us-ascii?Q?b5puRxXHJf7drIfb0Vnmm5eLpOr/eInqEnM2F8zn6f4YPTVfRNUZ+T2YhE2F?=
 =?us-ascii?Q?ewRkPxWHJ8NcImzcdOGvMWtXnCdExL/0k9ZNSQBNMqIm/GXNw9xC3frEEERf?=
 =?us-ascii?Q?fPAPC3g31X2enM0kF66P/RiEFdMT9MDznYVLpwQHc9bDFop4j4VJ70TH88is?=
 =?us-ascii?Q?QzXMf6Tz/CJePFyL8tYvvaUQiN3987owsoyjWty8Ip55ajGC8T3CtZdir3it?=
 =?us-ascii?Q?a+akISrFtOqgoWvKgNs7JU8fqe0E6SVE60WLvOZrJ8WBwRMU5dT2tJOi8zA8?=
 =?us-ascii?Q?s6RD+dPYqLfNPIsy6HCprhgrFTsiY9e0mZfoMxkIcGwegdnJfflH+XQl11aS?=
 =?us-ascii?Q?lgSl+/8qL4vN4dwErFrGj0TLI0c4sooSmnayTyJB2KYvw9SoWMx+yJmVDAir?=
 =?us-ascii?Q?pzARsG5m5wb+HHVBByM84JIDsvDYHAtV6vylTtpPZ4uoXb6tvFM6fQcLLtNx?=
 =?us-ascii?Q?MnvBwJ3r8xBbsWRtHzF+C5HuhZQVxKGkM91NWz+0tb0ruH3PR2orHWsyNOGR?=
 =?us-ascii?Q?Y6uZG1BNxg10Jgn/+3ILqbfxjE2A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMXNzCcI5OFxbByxAOTV+lN1GZpYSf6v9ZXjBjcC+halpZAN+Tj/YkqhJ4EN?=
 =?us-ascii?Q?UIj7ku9OdpXkBU/HNSSBKbIOBaP/2MeFTD9XxzycZxX2bAvdmr0ppUCpHVTd?=
 =?us-ascii?Q?rdu+Lw6XsVr5mKihJ9BOxfQTsMuula4H4E0Cq6ALbb5BBD+PgN4F/u3Z/kG0?=
 =?us-ascii?Q?p3ZgSJf0vroKOqUcbBsrigjKg+CG27bk1L1PwDUYX55uCRRzItCh89K8Ol48?=
 =?us-ascii?Q?Rgo4oA9zsxbIvUkhJeqDPWY+wz+Kuz/o2ePYFUJ4AR9emj4DPB69JtXYVPOd?=
 =?us-ascii?Q?NjVMXbQtQvxNgGaYi9wD1+uXEhrP/C6fahlyGeVkF1vQL3BXzlFyfOWPIl0a?=
 =?us-ascii?Q?vtMpwmZ1/irnqyB5iZaw9x4uIqC1swbuD7scdRQ5p8vWXoTo5aK+b9FMstmd?=
 =?us-ascii?Q?c4G857C4Hwm0HrvLO6k/EnRlHAHarZPKfqDXrABgijXOnX6PZSFLBEKauZlD?=
 =?us-ascii?Q?KI6FThXsZPdPkf5DQlY/bmNMM0wU0Bjg8zJkV/ux9D0lHjYGygN7RIC/J0Be?=
 =?us-ascii?Q?odAyO+2qqwfawEtFKTU9MgmY9QFUQ1rN1/VIWuFZLK9v7DAZGo+VWx1i1K6o?=
 =?us-ascii?Q?OdzzNKpWf/+QX5AKKDrfVOEMDlUPFuwsByFIcj0435M4dLj7KEdjo1PSNiTF?=
 =?us-ascii?Q?gKY/HugrIKRMTnBzo+Xj8T8VKmt8GSi3TSZvddylH+TnBy/LKbGQfAHo8L4h?=
 =?us-ascii?Q?h6Dzc1YaG753A1cuuaXWVRGaTYoUy8sSS8S7XkFsZwJ6ONBvxcyn5A4WiYmn?=
 =?us-ascii?Q?J0lsQHLSGMqhoCkHBVOEO8Td7ZbQ2UH2QFAaMO3RnBzk7dYNSxYj7l9SEWkP?=
 =?us-ascii?Q?Xz4qutngv9z9gAWzQDWPvmwr6QHh1cJd232KHW8rTqslhCaDTTBOHkZ38QTU?=
 =?us-ascii?Q?Ch6NYNtOIgDKCpqlH004Kq8rbJLFi+qp4V56WhoCyMqCUNMWf/WLH4K1LkF0?=
 =?us-ascii?Q?MF9zda5Ql0ridsYz6zPcECUQ6uID+w1KIeWq/HoFPX1bQ5yLfNn3ae9Ek4qW?=
 =?us-ascii?Q?2gcVAJWVW0d5LC+SQVGNOcA4kW7zz8NnrmXdeAGnin5CS8anEIki2lSqv/Nt?=
 =?us-ascii?Q?U9mVt/dvWn+QKdpWfXCc7IjM1LfFHgJpJxkIeHnLVYof4hC3tDbdB6pJRBMz?=
 =?us-ascii?Q?Sz/4CFjeQbQztXSKBHN2a7yxPCKxrF68AxhviSz1OwCeOeETXN07ihuU9pxc?=
 =?us-ascii?Q?kkn1f8oX275yTxmj981tlSWqiPm4HOvXidnNPoZw8tSon4Ud9TS1pAgxU16g?=
 =?us-ascii?Q?/qW9m1SrMtO5qfLBaczoGqmbS9EyMPoTDORzv0+kq1VlVPL6z3bvp88hzJ/k?=
 =?us-ascii?Q?21gwhYTAxZrHqJa9uHZxUCUBg1tL42unA/Sr5kHtD+mpMn9JKQDRPzFkzPk/?=
 =?us-ascii?Q?vazJ1kp7y7WiJ8pkfVxOt6G03MweWew8heXhucVVL8a2msnaUWRudxRU2GUD?=
 =?us-ascii?Q?u19LKuR8zN6aeChmjDBKC9rAmH4yExksw1WxZ4btrLMLn8zru1ujW/lEuavW?=
 =?us-ascii?Q?lPkXpdBlhyzu6N6c62t791+tnHEC1aET78K9ThkRiAYyCrft+6thjw+z+rSq?=
 =?us-ascii?Q?awJimfKaXc4KVHKMHYK0MV5FWkh14Qdx+8L3hMqk9tDsozvbf/VAaWYeDRCd?=
 =?us-ascii?Q?VQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b17d1d6-7273-408f-0df8-08dd40ce66db
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 01:35:39.2164 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kn90jm6SKZaDu11hS0QRM5Liti/S+XPtFA01uVknwjs2XehRke+jg/+OODIu2YX1/Riqrw123pMwgi3VhNeiPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8758
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

On Wed, Jan 29, 2025 at 02:01:38PM -0700, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: January 28, 2025 6:19 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org; joonas.lahtinen@linux.intel.com;
> > Thomas.Hellstrom@linux.intel.com
> > Subject: Re: [PATCH 2/3] drm/xe: Clear scratch page before vm_bind
> > 
> > On Tue, Jan 28, 2025 at 05:21:44PM -0500, Oak Zeng wrote:
> > > When a vm runs under fault mode, if scratch page is enabled, we
> > need
> > > to clear the scratch page mapping before vm_bind for the vm_bind
> > > address range. Under fault mode, we depend on recoverable page
> > fault
> > > to establish mapping in page table. If scratch page is not cleared,
> > > GPU access of address won't cause page fault because it always hits
> > > the existing scratch page mapping.
> > >
> > > When vm_bind with IMMEDIATE flag, there is no need of clearing as
> > > immediate bind can overwrite the scratch page mapping.
> > >
> > > So far only is xe2 and xe3 products are allowed to enable scratch
> > page
> > > under fault mode. On other platform we don't allow scratch page
> > under
> > > fault mode, so no need of such clearing.
> > >
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c | 32
> > ++++++++++++++++++++++++++++++++
> > >  1 file changed, 32 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c
> > b/drivers/gpu/drm/xe/xe_vm.c
> > > index 690330352d4c..196d347c6ac0 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -38,6 +38,7 @@
> > >  #include "xe_trace_bo.h"
> > >  #include "xe_wa.h"
> > >  #include "xe_hmm.h"
> > > +#include "i915_drv.h"
> > >
> > >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > >  {
> > > @@ -2917,6 +2918,34 @@ static int
> > xe_vm_bind_ioctl_validate_bo(struct xe_device *xe, struct xe_bo
> > *bo,
> > >  	return 0;
> > >  }
> > >
> > > +static bool __xe_vm_needs_clear_scratch_pages(struct xe_device
> > *xe,
> > > +					      struct xe_vm *vm, u32
> > bind_flags)
> > > +{
> > > +	if (!xe_vm_in_fault_mode(vm))
> > > +		return false;
> > > +
> > > +	if (!xe_vm_has_scratch(vm))
> > > +		return false;
> > > +
> > > +	if (bind_flags & DRM_XE_VM_BIND_FLAG_IMMEDIATE)
> > > +		return false;
> > > +
> > > +	if (!(IS_LUNARLAKE(xe) || IS_BATTLEMAGE(xe) ||
> > IS_PANTHERLAKE(xe)))
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > > +
> > > +static void __xe_vm_clear_scratch_pages(struct xe_device *xe,
> > struct xe_vm *vm,
> > > +					u64 start, u64 end)
> > > +{
> > > +	struct xe_tile *tile;
> > > +	u8 id;
> > > +
> > > +	for_each_tile(tile, xe, id)
> > > +		xe_pt_zap_range(tile, vm, start, end);
> > > +}
> > > +
> > >  int xe_vm_bind_ioctl(struct drm_device *dev, void *data, struct
> > drm_file *file)
> > >  {
> > >  	struct xe_device *xe = to_xe_device(dev);
> > > @@ -3062,6 +3091,9 @@ int xe_vm_bind_ioctl(struct drm_device
> > *dev, void *data, struct drm_file *file)
> > >  		u32 prefetch_region =
> > bind_ops[i].prefetch_mem_region_instance;
> > >  		u16 pat_index = bind_ops[i].pat_index;
> > >
> > > +		if (__xe_vm_needs_clear_scratch_pages(xe, vm,
> > flags))
> > > +			__xe_vm_clear_scratch_pages(xe, vm, addr,
> > addr + range);
> > 
> > A few things...
> > 
> > - I believe this is only needed for bind user operations or internal MAP
> >   GPU VMA operations.
> 
> Did you mean this is only needed for user bind, but not for internal map?
>

Needed for user bind and also for internal MAP. With updating the bind
pipeline you will only care MAP ops.
 
> > - I believe a TLB invalidation will be required.
> 
> My understanding is, NULL pte won't be cached in TLB, so TLB invalidation is not needed. 
> 

I would think NULL ptes are cached but not certain either way.

> > - I don't think calling zap PTEs range works here, given how the scratch
> >   tables are set up (i.e., new PTEs need to be created pointing to an
> >   invalid state).
> 
> You are right. 
> 
> I didn't realize that using xe_pt_walk_shared to walk and zap PTEs has a limitation:
> For the virtual address range we want to zap, all the page tables has to be already
> exist. This interface doesn't create new page tables. Even though xe_pt_walk_shared
> takes a range parameter (addr, end), range parameter can't be arbitrary.
> 
> Today only [xe_vma_start, xe_vma_end) is used to specify the xe_pt_walk_shared
> Walking range. Arbitrary range won't work as you pointed out. To me this is a small
> Interface design issue. If you agree, I can re-parameterize xe_pt_walk_shared to take
> VMA vs addr/end. This way people won't make the same mistake in the future.
> 

Ah, no. SVM will use ranges so I think (addr, end) are the right
parameters for internal PT functions.

> Anyway, I will follow the direction you give below to rework this series.
> 

+1

Matt

> Oak
> 
> > - This series appears to be untested based on the points above.
> > 
> > Therefore, instead of this series, I believe you will need to fully
> > update the bind pipeline to process MAP GPU VMA operations here.
> > 
> > So roughly...
> > 
> > - Maybe include a bit in xe_vma_op_map that specifies "invalidate on
> >   bind," set in vm_bind_ioctl_ops_create, since this will need to be
> >   wired throughout the bind pipeline.
> > - Don't validate backing memory in this case.
> > - Ensure that xe_vma_ops_incr_pt_update_ops is called in this case
> > for
> >   MAP operations, forcing entry into the xe_pt.c backend.
> > - Update xe_pt_stage_bind_walk with a variable that indicates
> > clearing
> >   the PTE. Instead of calling pte_encode_vma in
> > xe_pt_stage_bind_entry,
> >   set this variable for PT bind operations derived from MAP operations
> >   that meet the "invalidate on bind" condition.
> > - Ensure needs_invalidation is set in struct
> > xe_vm_pgtable_update_ops if
> >   a MAP operation is included that meets the "invalidate on bind"
> >   condition.
> > - Set the VMA tile_invalidated in addition to tile_present for MAP
> >   operations that meet the "invalidate on bind" condition.
> > 
> > I might be missing some implementation details mentioned above,
> > but this
> > should provide you with some direction.
> > 
> > Lastly, and perhaps most importantly, please test this using an IGT
> > and
> > include the results in the next post.
> > 
> > Matt
> > 
> > > +
> > >  		ops[i] = vm_bind_ioctl_ops_create(vm, bos[i],
> > obj_offset,
> > >  						  addr, range, op, flags,
> > >  						  prefetch_region,
> > pat_index);
> > > --
> > > 2.26.3
> > >
