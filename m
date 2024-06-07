Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA68C27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 18:25:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5BDA10ECEB;
	Fri,  7 Jun 2024 18:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ihSt6oFO";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B06610ECEA
 for <intel-xe@lists.freedesktop.org>; Fri,  7 Jun 2024 18:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717784705; x=1749320705;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=36U/mNAcYxCw0pH0/4JHVokoa0wEA5vU5+ep/glHuC0=;
 b=ihSt6oFO2NcNI9nnNbhbu4pky8Q5/YJZFZVIp4ZeU3ZsqF/O8ZEjQeZf
 zpO3GcvnWLJlfMZ/jL7dHD0FI38H7Ws/8mdDpmmkFsCqbfuIb96+H/gEL
 y0oJE3K3XEqbOU7UwCbyue7zNobSVrxJDoi+jeteVTyOYcwA3SklGvADo
 3WLsUWfuea56YggifetT90mfCHqLdG5kTq2nJz7dnwGtCAVLKC5Rjnv+T
 4M65OX5CZJ8Dc+0eZwHfF7wTtqTespjeF1jwrPH1a6N/wAbED9J1/DqIF
 YO8N+09YpimSw2eiSHmgJ8xeCFtCUk+Ix8b8g1mfXNxdQ6cbZ+AhKszzo Q==;
X-CSE-ConnectionGUID: 6+0fOQOaTI+NkUyVTuvXZg==
X-CSE-MsgGUID: cPxLRs2PRq6BIv5AVP+J3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18374352"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="18374352"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2024 11:25:04 -0700
X-CSE-ConnectionGUID: 1mC/euWMQAyAvQgf6usxvA==
X-CSE-MsgGUID: /gC5CTaCSjCg59cu9ams1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; d="scan'208";a="38346862"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jun 2024 11:25:04 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 7 Jun 2024 11:25:03 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 7 Jun 2024 11:25:03 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 7 Jun 2024 11:25:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c3Cf/sXA4DEKZ5Y9PlZFEvvBvi0mu521JTJJxkT2npCh5X/+00qC2lhSdcFKpJmSo6rEllsuY2rveYQAkCPKYwMlWx1KtrOSOZWNu2hZSu7hjwlHVwWFlgfI4f1hFmx+37eRQaqp2Hcx+J/RwqHTfOY4f7UymqnRsN2QIjMdko9voWcNq5EjzVqa/vJjvxs0ZtyXUoLQd+/g+h3mlf330yX2JvCaFUFXkeTUMmKocMrVLh32r8YeK9ZqeoQ+Sg2b6QzHjA5nvPBGQZisa2YezIruvpNMQf3O20QjJbhAPnRNpL+ccRJM3Rln26FUk/1G0rmxO/rwDurkZzFsgDXJXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gJx2ddNuvRZlY1jDkzX929ZCw+MgHMWx2DtqmCs+GA=;
 b=HF5M2L7mHlwyKBaw6B5MDjmC7x8Ep+QHWPtJd5eXHdB3jWe1dMSUyjX2uBfDwMJbCZGcF6yE0Pz+qRa7HdN5a5mBCcVOGCjhiZdPbvM1Y2dqcq/R+iSdpCWsmnGlN1a6PBL550DWF1s7/d2FcNRkgGS13i1Oidewck3rAsZeF5rscObbJ9aYTsq6d1BcXTb4Gm2GxLCGZK47f4ekTj4V2f+ywC42k2toNawpLC4mdQdbQ0GqhxivIXrAJdthDOiDvgfcQTBeIk13IBoH+VVvq4B/hUyzhlxorzLA6yLm6NI+cYGpdWRn2IUyblFfVw5WiEH3GmaGFpvrn5zVRYJ23g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7SPRMB0092.namprd11.prod.outlook.com (2603:10b6:510:2b1::6)
 by SA3PR11MB7555.namprd11.prod.outlook.com (2603:10b6:806:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Fri, 7 Jun
 2024 18:24:56 +0000
Received: from PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7]) by PH7SPRMB0092.namprd11.prod.outlook.com
 ([fe80::2ad4:4a5:b333:6ff7%3]) with mapi id 15.20.7633.021; Fri, 7 Jun 2024
 18:24:56 +0000
Date: Fri, 7 Jun 2024 18:23:58 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Bommu,
 Krishnaiah" <krishnaiah.bommu@intel.com>, "Thomas.Hellstrom@linux.intel.com"
 <Thomas.Hellstrom@linux.intel.com>, "Welty, Brian" <brian.welty@intel.com>
Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
 allocator
Message-ID: <ZmNQPoG1WwssW4uJ@DUT025-TGLU.fm.intel.com>
References: <20240409201742.3042626-1-oak.zeng@intel.com>
 <20240409201742.3042626-32-oak.zeng@intel.com>
 <ZhdREN0UWjNV0TXG@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB6991A1D7325C383EB37EE4E992FB2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZmNPEW4hD32E0E/1@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <ZmNPEW4hD32E0E/1@DUT025-TGLU.fm.intel.com>
X-ClientProxiedBy: BY3PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:217::31) To PH7SPRMB0092.namprd11.prod.outlook.com
 (2603:10b6:510:2b1::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7SPRMB0092:EE_|SA3PR11MB7555:EE_
X-MS-Office365-Filtering-Correlation-Id: 04289072-4c98-4641-6d72-08dc871f21da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|366007|376005;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WuSvIK5+JH4j5R6NajnC2kQy0LWxuH6Z6UAozok8vamlK+wX0UrC1gdwBBcs?=
 =?us-ascii?Q?F2HWEqVKG4VDlQ0Vh30YJjYjU8N7GHw0dxgfxWFvAQpPEhkpj6IXL07gZve/?=
 =?us-ascii?Q?Lr/CpWBmHgG9fLnZPloVRRbq7ORay7M1plpk3N4M0UvY0VoW9K3907vbr2Sr?=
 =?us-ascii?Q?JG7dUpoaX3nJJWGIAuH6f8b6QLIW1xqv3IXgJqyqO+YctQF++Zu7gM0zZYjC?=
 =?us-ascii?Q?BveVtoKYL35oXOu6Rz3MxlWcv+gHCF9lqMStoF+nwNGlj8gpoRnAWwChp+dx?=
 =?us-ascii?Q?NmMN9iGzGEm4Aqp60SpxxiNO1dETY7MIXHkgIqN4kcEgEGW/xqomRnntd0xb?=
 =?us-ascii?Q?eotm1J3ahEiT9WDku5f0plp6AZ5kXGNJVMq6rdfuzUwrQdmuO+Ney0MYnKWF?=
 =?us-ascii?Q?DRqkRwz+pMhqWtP5bQZ1Z4eKc4fx7c8VqXwGCk/40DqUkS0OZ7nv4mV84nrX?=
 =?us-ascii?Q?QtF/xex7jgpqCuPPRG55/2ZnRyVZLD2pFJuZIyyNvYok26IIMk5R7Z5d4Ezr?=
 =?us-ascii?Q?d2RoAyGlT8Hsw5/BdHRtuJb7NqsQYfltwViQVwSSolshn3FMRMQEsavP+B8B?=
 =?us-ascii?Q?RkLsLWNmJ3//eoyqzWZjExx/nKcvjGRoeAb2DGAAr+CVD5yrAc3PDPg4WJFs?=
 =?us-ascii?Q?cG49LR0PI+W2F7whzMgKdQL0xrYtgIfAecRDfQHpiz1W2N1mKF+aMrgHxOaA?=
 =?us-ascii?Q?D3J2ekRrm7H/0MXwN6OZK0/z/TED5r3LanUxFW1lBq4hRyBQTSsvUAPlLdYm?=
 =?us-ascii?Q?TSRZ7vbqF4fSef9gMQn9ZKngsbkaAQDriYI+acor75AikLJb3iAqtjB9ojr3?=
 =?us-ascii?Q?uwIF+sOiYe2x8ZpJHxzKZ5VluHdmlb7U4j3yNpAppy+msCIw4DdP34ntV8h0?=
 =?us-ascii?Q?NK/Ik5WF4wJrIBJ8R8ZIX821oxMi1qdX2oHi/HCtycahWBcXXdl0FY+NK5hZ?=
 =?us-ascii?Q?67CAYO5lJkpcR9nZH//0YgSsphH5lJGyLH1/HoOOrIXvj2YS/OajEEwvRvo6?=
 =?us-ascii?Q?NSp48T8PRMpTPn39PjyUsN5VsNlrC7wCg8tbN3IbMIF4JZFBqFTpb85m7VVo?=
 =?us-ascii?Q?aFv7mA9H+3Zcli6wlTMSQpNXJLVwaTPQtI4GoSy2Lxtsh6nFrT7vYXajGiDW?=
 =?us-ascii?Q?Z2N1P1JfAHfoUY2G3eDXtHGolONw/N2MyFuultsZmfkvJJE+okHs+1vPOr8K?=
 =?us-ascii?Q?D83D5Rmwbq+vsZXGnSk8pS5vN2mI3AVB2RdxcvCNsOb4TdnsySLiY2J1FHmk?=
 =?us-ascii?Q?cCRsb9DMidy4XfdOV/uq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7SPRMB0092.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Sxx4EjYNN3Q81puIKB2bKfPeUHSAtPH+ZLTSLJxeVxDx61fcG4IMHVZmQ9vc?=
 =?us-ascii?Q?o81pSEmGdnnjUwLhqy8fo8MD5O2twskzWoHEvL2Ol0/zPUEGo42RppRi9tuU?=
 =?us-ascii?Q?w2FW+IRrKA9h73Oc2wcaYg/+/SV1sgUpHTvRjCuIZmCMcoqzZkdJIGBhfXYB?=
 =?us-ascii?Q?VxDwvQWht2shqre3QqCuZGn6wod9/GLAqPMaLi/ydNCUGtGVJtmJUicTpSwx?=
 =?us-ascii?Q?8Yf8UTiL67EXgFly6KF11IOif4kMf+TKgign9iu3WadfMvvEn8aPHeehIvZ+?=
 =?us-ascii?Q?oJj7zbDTqrSZEeuPATeMARIDSDEYShtE/hP6ji7s7WhJFXfZiWRaYQbFyg7S?=
 =?us-ascii?Q?jL7FAgeTP69DwhUfuEuzi2zgkLFHiyg9nnnN/kEzrvgr+c9Mh4xkC9NVYjDq?=
 =?us-ascii?Q?M/KbZN4UIOr4Ozf2QYcWmbIsl0e7MkPneDp4gdoHsCDdjg7u7MH7CmBpbPgn?=
 =?us-ascii?Q?5wRz2gtYSADZ7CYM0lnUHJK7pvDvfkuBykH6M4X9BdaMHZ2U2jk0wKXlkF3y?=
 =?us-ascii?Q?e7cC5K5izbWsryi99pERZ4xnN3UnWQ4O7QxrodWf7tVQOD7xB/6zb5/7VVvm?=
 =?us-ascii?Q?i6kIKhFdjkzA7X36+4bai9blFNGr2jmLZucjUxKFt+iza9NkDRcXEoc+UCjT?=
 =?us-ascii?Q?/t6OG4BEXrgBAhYGaR4yVXKqsTlSxDdeb0aUQ1XC09ygyu72yhSRhMXP5X0c?=
 =?us-ascii?Q?ON2aovga6pPqktWoSUg9nl/CEIziEbkPHrrqVVk3cYPLGyf1XT6YAB5kh4du?=
 =?us-ascii?Q?1e4t4vLApxrmPf0M/JJEouPbhVfv0XinvmsMeRsZVe5m/QG7FYgLPmzvCc2V?=
 =?us-ascii?Q?/DeAqvgAWWkS9IPCqEkcMTULDgIgDrlgximfilTezrKdBhWJVnFVaHt9gkoM?=
 =?us-ascii?Q?EltLVmd8NE7Nu+IHz4jQYW652qPoqc866Cno9K7il/hdZ2fJJ1YbHnCKpK1D?=
 =?us-ascii?Q?bTI7mRS8fBS3Y8jAzzUQHF0bZVKgQRfpyqyYfLo9V2Yy2F6Ac7BtmVAcEc2D?=
 =?us-ascii?Q?slgFlHPFISe8EE1TNBuEtXJupdYQO/Y+uUHcMXhpBjL4PKSmzjb1hTZpum5l?=
 =?us-ascii?Q?o0eBR6eT2JsU4tmxkcElfwcMXDp9zqn2Iyiul9Ai9FHugJtEmQq/SwgzknZ4?=
 =?us-ascii?Q?b4vvcLabjXMgwFtg2PW84yfxXhZig23tawTzBTjV2PtLQgQzG8bvFzl27I1q?=
 =?us-ascii?Q?b8UQY5fxc6zAi6jajf9zUzBOHtC+yvZb7AndGA7l/8bidrl+bs8UWBemoQNX?=
 =?us-ascii?Q?IyJU5gs4H6j6NoLmRt/HMkmunAY/BgWevY0yDXZ/N1tzjuDyl+syX9zKIwv4?=
 =?us-ascii?Q?SFPDNcvKgMXhiT03bXOdBPJm7cqEKhSha3wmfDRRYF8UorC9ErcasNq3r5Vd?=
 =?us-ascii?Q?y/vSRZ9DbpetIwb0L8FoQj0K0sVau3/FDsrCIqCKo6uib1DeNYUNE0CYbmvf?=
 =?us-ascii?Q?3Q0EUAJWKHNf+oTRusWxF1e5+emb7jmIanDWIg/uEc3dtWF8aHmYxvzKW3yI?=
 =?us-ascii?Q?nq/iMJ7YXFGc7IH+vg4aFMBnjGkFmkwb4jz9p6vjPuCTQdkUekXnMxC/+p99?=
 =?us-ascii?Q?zMY46hs80cgAGh7U6fsljm1s8X8TXOvPzEQXw49aBKl7WAi4PIFGpSt8zswA?=
 =?us-ascii?Q?Iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 04289072-4c98-4641-6d72-08dc871f21da
X-MS-Exchange-CrossTenant-AuthSource: PH7SPRMB0092.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 18:24:56.2237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +YtY57+78jqAABQjoVe6ATbixwsPAu69UIM8vhjScIysQurKnKqQ9KW3m4r3dUaEY9bSXCb/iL0+XRXxmzInLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB7555
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

On Fri, Jun 07, 2024 at 06:18:57PM +0000, Matthew Brost wrote:
> On Fri, Jun 07, 2024 at 11:22:42AM -0600, Zeng, Oak wrote:
> > Hi Matt,
> > 
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 10:55 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Ghimiray, Himal Prasad
> > > <himal.prasad.ghimiray@intel.com>; Bommu, Krishnaiah
> > > <krishnaiah.bommu@intel.com>; Thomas.Hellstrom@linux.intel.com; Welty,
> > > Brian <brian.welty@intel.com>
> > > Subject: Re: [v2 31/31] drm/xe/svm: Migration from sram to vram for system
> > > allocator
> > > 
> > > On Tue, Apr 09, 2024 at 04:17:42PM -0400, Oak Zeng wrote:
> > > > If applicable, migrate a vma from sram to vram for system allocator.
> > > > Traditional userptr is not migrated. Only userptr created during
> > > > fault (aka userptr splitted from system allocator vma) can be
> > > > migrated.
> > > >
> > > > FIXME: The migration should be conditional on user memory attributes
> > > > setting. Add this logic when memory attributes are supported
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_gt_pagefault.c | 9 ++++++++-
> > > >  drivers/gpu/drm/xe/xe_vm.c           | 4 ----
> > > >  2 files changed, 8 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index 668984f0769e..c6ba00049964 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -20,6 +20,7 @@
> > > >  #include "xe_guc_ct.h"
> > > >  #include "xe_migrate.h"
> > > >  #include "xe_trace.h"
> > > > +#include "xe_svm.h"
> > > >  #include "xe_vm.h"
> > > >
> > > >  struct pagefault {
> > > > @@ -209,12 +210,18 @@ static int handle_pagefault(struct xe_gt *gt,
> > > struct pagefault *pf)
> > > >
> > > >  	if (xe_vma_is_userptr(vma) && write_locked) {
> > > >  		struct xe_userptr_vma *uvma = to_userptr_vma(vma);
> > > > +		struct xe_userptr *userptr = &uvma->userptr;
> > > >
> > > >  		spin_lock(&vm->userptr.invalidated_lock);
> > > > -		list_del_init(&uvma->userptr.invalidate_link);
> > > > +		list_del_init(&userptr->invalidate_link);
> > > >  		spin_unlock(&vm->userptr.invalidated_lock);
> > > >
> > > > +		mmap_read_lock(userptr->notifier.mm);
> > > > +		/**FIXME: Add migration policy here*/
> > > > +		if (xe_vma_is_fault_userptr(vma))
> > > > +			xe_svm_migrate_vma_to_vram(vm, vma, tile);
> > > 
> > > Agree we need a policy here...
> > > 
> > > See my comments about locking in [1] thinking if we migrate we likely
> > > want to hold the mmap lock until at least the bind being issued to
> > > prevent races with the CPU fault handler, at least initially.
> > 
> > As explained in [1], I will continue to use mmap read lock for now. And the read lock only covers migration and userptr-pin-pages but not the bind. The bind correctness is guaranteed by a retry mechanism and a userptr's notifier_lock.
> > 
> 
> See my reply, I think to avoid races VRAM migration and grabbing VRAM
> pages via hmm_range_fault either need the write lock or a some core
> refactoring needs to be done to avoid races.
> 
> One more possibly wrt to these races, maybe we simply don't care and
> racing access between the CPU and GPU of shared memory and this is akin
> to a user fault (i.e. the user must synchronize access or the behavior
> is undefined possibly resulting in a segfault). If I recall correctly,
> my tests showed when these races occured either a memory corruption
> happened or the user got a segfault. 
> 
> FWIW, Cuda seems to have synchronize calls in their SVM documentation
> (e.g. pass a malloc address to a shader, execute shader, call
> synchronize, then access malloc address in user program). I can dig up
> this documentation if you like.
>

Sorry one more comment again. I haven't looked at the level0 spec for
SVM, we should also look at that and perhap spec it out as CPU and GPU
access of SVM memory is mutually exclusive and concurent access is
undefined.

Also missed a comment below.
 
> Agree binds certainly do not need the mmap lock.
> 
> Matt
> 
> > > 
> > > [1] https://patchwork.freedesktop.org/patch/588542/?series=132229&rev=1
> > > 
> > > >  		ret = xe_vma_userptr_pin_pages(uvma);
> > > > +		mmap_read_unlock(userptr->notifier.mm);
> > > >  		if (ret)
> > > >  			goto unlock_vm;
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 498b36469d00..8a58fe144a02 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -71,16 +71,12 @@ int xe_vma_userptr_pin_pages(struct
> > > xe_userptr_vma *uvma)
> > > >  	struct xe_vma *vma = &uvma->vma;
> > > >  	struct xe_vm *vm = xe_vma_vm(vma);
> > > >  	struct xe_device *xe = vm->xe;
> > > > -	struct xe_userptr *userptr;
> > > >  	int ret;
> > > >
> > > >  	lockdep_assert_held(&vm->lock);
> > > >  	xe_assert(xe, xe_vma_is_userptr(vma));
> > > >
> > > > -	userptr = &uvma->userptr;
> > > > -	mmap_read_lock(userptr->notifier.mm);
> > > >  	ret = xe_userptr_populate_range(uvma);
> > > > -	mmap_read_unlock(userptr->notifier.mm);
> > > 
> > > Now you won't have the lock here other callers of this function...
> > > Probably need to have locked / unlocked version or arguments here.
> > 
> > This is addressed in v3.
> > 

Misses this. Also to be clear, in you design Xe shouldn't touch the MMAP
lock either, that lock should be owned by the DRM layer.

Matt

> > Oak
> > 
> > > 
> > > Matt
> > > 
> > > >
> > > >  	return ret;
> > > >  }
> > > > --
> > > > 2.26.3
> > > >
