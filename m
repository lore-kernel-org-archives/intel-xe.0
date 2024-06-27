Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80177C3064D
	for <intel-xe@archiver.kernel.org>; Thu, 27 Jun 2024 06:12:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2985A10E170;
	Thu, 27 Jun 2024 06:12:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TSYRUSuA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79A3B10E170
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Jun 2024 06:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719468719; x=1751004719;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=En0RioQ9F2EbZu+E3blrXs63ott7IoaCa5xZF62uAmE=;
 b=TSYRUSuADVRPKE6wOft0hL/vGTtEHHKfDPpwjDeFTTeke/3AUNc6rPxi
 WhE9R8V6Igq9u8trli6xed1Xncu6jEztNYFVNqafo8recsEeDLQyDpuIG
 kvB70qWkJTdfizDkfYTcALpHSw/VOPOEPmOgYvl3FUcz3FPMu4jWgXbcL
 QYjBImDPyAxMFeEPGQtJbuRGPwFXdDkR78j91QFVWCDfxREFV2h/f5PLa
 oZWeQW/gxQIfaLmwsEL3sWTAvICgk3Vqu0QugovlSbZnI+QcAo/XCYi3Z
 ISWx+Tda9pDxSEtEz8a3sHSw9DiNRpnlZ1VBWZuvZFod8IsBf7mTatyD+ A==;
X-CSE-ConnectionGUID: PpwNzRbQQFe9psHelfW+nw==
X-CSE-MsgGUID: tw5HgIkRSti2VaugpXovjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="16533959"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="16533959"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2024 23:11:58 -0700
X-CSE-ConnectionGUID: VgcteOxxTH27mHmTPOblrw==
X-CSE-MsgGUID: eJ4QmdmCRRmR9XMe+wO/Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; d="scan'208";a="75455065"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jun 2024 23:11:58 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:11:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 26 Jun 2024 23:11:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 26 Jun 2024 23:11:57 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 26 Jun 2024 23:11:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IO5c3LToptpyWvXEOe2m+sRIko/tCExry6qtOSaa/hNbyCOeiwYOohrnrm45b8iE2ef977vOdxrHVvc6Pi7ORyXd6QaeO54haSSfVCn9kVAtFQm9EuFO6n/1qh7hcEFH9EeDuo4JGof/AI5G4oAmphF4PjA99nPmA81ZYuQZs93kU1oGSWnoYDswPAXglHYq+e/kE5Q0Bfj3Dx0KJ2mAewQZdutyP5oIYle+sSlYzEeYGUJa3ybO2ey8saiSN2/p9MUL6RYymVUEtCnMgq33CQuG069zOsN/cQAG0PZwQeHw/rOSGNCV9m7OWKotjBbmiMCxkIxJMjojGgcwFPR58w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1FKlv2rAp5qx5zyUXFqR3TaYJ/Zvx5LCz4671EvD7yU=;
 b=mfG3Nz33seaaXqiVWqbC38pcG8IlCjM7rBmT+l4D0xYaqaL+3HWfuFEJr/otHDOWX9FWqnbgH91WJW24+Oe6SM01j7QMbGAJUgwmZlPZYo1u6QTkQi/icSjxpfixzLDumXj9Sg30d5zKd1zLp4gUtJ3YVLmme98ABBLQhCuP3lhU0Kn7o8PkGzwG1LTazpDTXCw095Sgw7OD3Skd5jMXXD0IgYPm4TBVvy5O/G83fx4IyhPtFiiL0Fg6pG6bQ8VS05d2Ct4wQhy7fUzyMbvT69iBnRt7+YKPjcEIHsANW5efPlufHCBOb1DqL7muSHGxXXAF2kwdqA0YhhaSPjMBiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by PH0PR11MB4822.namprd11.prod.outlook.com (2603:10b6:510:39::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 06:11:53 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:11:53 +0000
Date: Thu, 27 Jun 2024 06:11:12 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v5 4/7] drm/xe: Convert multiple bind ops into single job
Message-ID: <Zn0CgIXcMGmPFo6g@DUT025-TGLU.fm.intel.com>
References: <20240626003920.4060633-1-matthew.brost@intel.com>
 <20240626003920.4060633-5-matthew.brost@intel.com>
 <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6dc343ad-bd46-4402-bd0a-00ed2b366e7c@intel.com>
X-ClientProxiedBy: BYAPR02CA0015.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::28) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|PH0PR11MB4822:EE_
X-MS-Office365-Filtering-Correlation-Id: d5e3e801-d83f-415c-e0b6-08dc96700a62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?RHYIDxWUZkPbjGC1JPbxImKRpyftFbXIbIizvTtjrzBllH3ksgpULc2CJH?=
 =?iso-8859-1?Q?w9xyFNd0QE37I2ag1hPsyjRo+FKZBhyrMtS9vhWQPcYa0febGA6KvI/3EO?=
 =?iso-8859-1?Q?jPqG7kqVA028Dgt0FJh5ujz2x4A/BpL/TGzap069MmsjxvodrPK36SOP9t?=
 =?iso-8859-1?Q?H+v9TnmhOKRuIn+MINsz2IMm8upe3E8cwGR30qsffxUYm7rg2KUtBLGO8p?=
 =?iso-8859-1?Q?Yp9yeiEQWuJZBXXBs5Rxda8HimD1V9iRWBdd9eort9nnbn9mdAtBqaRQdQ?=
 =?iso-8859-1?Q?b4sGmCSuN6ryP9DH2R7t6wKkYlIX8llc6W8eA6CzGMw7IAPV2ThwOgGeWt?=
 =?iso-8859-1?Q?Mut48f8xgvWeg865RZl5WN2VnUrB1FgzoYaT0Bsk/VMoOoCcQB3tGJ6OqF?=
 =?iso-8859-1?Q?93qkCM0tT3hB0qhaBhIBrLHf7+cw4kSrLX+vHSqsxNYoZ3gwYFG/eqF/sO?=
 =?iso-8859-1?Q?O9Qx0jucMcl5JIiU2tSUUEU0D6e3fLD3DQLwOI4v0EFKtzvUo/JRU626TM?=
 =?iso-8859-1?Q?m0/LAOdWeJ4Vv+AEuJVho7pLfJMM7AcEyLOsg2YP5nJs2a+6V4Ew9m2e21?=
 =?iso-8859-1?Q?lUIOiD14vxtVftQPOMX9/7THZCcNLoX2MXNXP6sLF1pE2DSbsaXKse5qnb?=
 =?iso-8859-1?Q?d+ZkLaL5vqwj1cXEJZRmYoWfMTJrrwnkJNtjKDJKm3DVJVh9EZxZxOgZYg?=
 =?iso-8859-1?Q?zlhHdKQxW+U5UjAOanN2/aaPxghZg6F0UNIIvMvqqdCxUKI4ikCfdO+8eg?=
 =?iso-8859-1?Q?NxRlUAmmXiicrmNn51TznZM7vePiZrSm4Pr5kuvdgXGdMOyiCDA8SDg0Yd?=
 =?iso-8859-1?Q?AMBhfkpH1Mx5WA6hzYKsfrrVc0AGZ0otFdeDfrJjXuwHAUNTAqAcez87yu?=
 =?iso-8859-1?Q?VUZB63j1eFUe0CiPK4qDLBREUtGOWqAmo4nKNiZjJoTbo5l1sDfuPYx7eM?=
 =?iso-8859-1?Q?tuXj0JTMN4+0k/TUQDfkXkgz9aIFOEyZ0TMFVl3QO8U9jJvK/HdlQkfmKA?=
 =?iso-8859-1?Q?qaD6Qx8lj4/3kvENCx5Q402hQAIy3ruSoL0Ku0C1Zo+CvC2LzZ7H4KGNTk?=
 =?iso-8859-1?Q?CKHk8XHzuKqB71ERjS/2Xmf/3Ua/4aJUgK96v258Tx7JCRfV7Jteu462Cs?=
 =?iso-8859-1?Q?QG6iqA0MUEKTbdllhxCCpN7kVjuX8NvDaMvAv5pNinHuEcF4XJLKnmv4WA?=
 =?iso-8859-1?Q?KW8XHN9rnQO6ekZy9wmzYelQ1tg2QcM8bmYJtssekMBb+oA0WyTCtCX2me?=
 =?iso-8859-1?Q?zyrGPQbRSbNMHrbt+8nTqsA1URuMfbJhiTRhNeKvQscM36F6Br/b3Q3gkC?=
 =?iso-8859-1?Q?R8sB?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8TE4eK4rhU565TTe7sPUs34m7exe27G+vKPgfZKPGZshhNBm7asWQgU+op?=
 =?iso-8859-1?Q?fM3BymxzFY+oHDkRwmZf8dH6PhKkmT+pLfv++k91RzcKJNUvwBGDB9rk8p?=
 =?iso-8859-1?Q?DqFTdyLNz20ymPhCjxR5g/7LarZXOQTzpXaVgu5LFX0S1pujCswIpCRzUa?=
 =?iso-8859-1?Q?9pf5pcgF3ANXlxXvF2RjZUSWJLLzffk0usJvGfjtU21INkBAyNSrcJo6JT?=
 =?iso-8859-1?Q?hy2jCsjIyuhktYrvKd8kalf6bZdKKgqbPaV9Pj6jzWbBsu+HPwZT4bvvkq?=
 =?iso-8859-1?Q?3+x/ylIy+vzi0mnSh33pDnZ55cvMGkRAi5gpQt4EBsVj3UT/1lGvXi4B71?=
 =?iso-8859-1?Q?OPsZtY9JQxOvF443ieTwKiND9T7wt2h32UOTkt8DuBEjXvoKOekoVcA9wV?=
 =?iso-8859-1?Q?T7HIuyKKWwL6FHj1rACM3nytAZY3PSx+XCsTHTto+1D6L4CX5PMXdaPZQg?=
 =?iso-8859-1?Q?YLFW2dwKZnSkb1Ox7F3ew/C6Pc4AAwLUGiqWL2YwfPh/SgLtx50K6eHemJ?=
 =?iso-8859-1?Q?H77xw+0an9Kvue4vMxWyoxDHKC6SIr1jJXyTfSmQ+RDNYW6oFfSKd43cIe?=
 =?iso-8859-1?Q?BAH6Sj4ADHaNvEjsWl74b1mkcmdrchTM85H/VnnIauZrfYTPYiO0FQpQrK?=
 =?iso-8859-1?Q?NYGjlmWCq8K66BWsa93wde5Pa7jEpRFpX9F76qpojQuotDxf0RDDS45eMu?=
 =?iso-8859-1?Q?qxPAp6+oYT/pU3IzWUZj547aioKzdr5kxKk1OabvvtPaVh71zhPluqwg87?=
 =?iso-8859-1?Q?OEVt4UA44MzWRjqzNwFAf1W7VLo2SZ9fU0yj57dAEJet68t+C+dJZFHLCZ?=
 =?iso-8859-1?Q?PMiQfq+mhVBMEP05221oRg/2Zsw6/U880IEwVW0YSFnUe6o1PxKHypn5Uv?=
 =?iso-8859-1?Q?1yKdLqAF7eyzJ5eVz5LDoBwfCxeuaP2W9zfy0fStTA8YPJNaG0Jk1AVJwC?=
 =?iso-8859-1?Q?F9KDiT55rKQrOqrtb02v/skVmaz430eko7pR75rMLHw7bA5ZBRJykWuOpc?=
 =?iso-8859-1?Q?9l6/vI9CxjhNfSkDVK0wL/2N6/dOH05fbLebBgsATUUawVSMIG2D4JbNkA?=
 =?iso-8859-1?Q?qjwu376UaaXTglGg4pzv8TRqwJqyhr4RFdXqpJQelZ5crU/zYExr+Q5Pje?=
 =?iso-8859-1?Q?IPg8Lln7S6Z83D8PuQ0gNjFGixmNGO3KMaRli/Gas7eAyBjOoyMkkt4Wv0?=
 =?iso-8859-1?Q?qoWoF/bajG7nZCMbALVc9elMt6BJvOa+BPAH9q373omgD+SDGgfHmBH/8G?=
 =?iso-8859-1?Q?FJb4ND1RMlWby+KCPlq0zvVcyBWZ/J8nZLint6KwU+aq7NA6T/lZhBv1GM?=
 =?iso-8859-1?Q?ZuP2kNYBUsSvDHCof2bdZoCeC0K8qFJ704j2T/eZLWXoOnoMuvdWm1OyU9?=
 =?iso-8859-1?Q?+zI9YO5XYaVgqIGl/CzBj1mnKB0RVcSAwVpIp64QRhevByHDK82xya/Oz2?=
 =?iso-8859-1?Q?fMHISZleBBF6aT25k1sHxRoynvAy1aPANUWRDQXYseT69stkOncf8opdc8?=
 =?iso-8859-1?Q?NFkSIn1cRykd/gDfs95bFe/ygF9zz78fAtx8c46AzPw3Tb4/xsxEzP+S2F?=
 =?iso-8859-1?Q?upD7BjIYFLFWze1DL2n/JkiAi0z9SsaTjOUy3O1UX3wCTax9SK9Fw40N74?=
 =?iso-8859-1?Q?eMD6Hj9aTKzhm1xKLIZ6hP+lC6RBAtkNHpU4tYDuEEx/5M1S7fArlxmw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5e3e801-d83f-415c-e0b6-08dc96700a62
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 06:11:53.6054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bvO0MavqseI8uQNXgja/9Iy2J6hOMNN5+t56gol+F9pC7DhtCxb//PPejecA69jgRTuoG5FJAm73rwxmdLGjqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4822
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

On Wed, Jun 26, 2024 at 03:03:41PM +0100, Matthew Auld wrote:
> On 26/06/2024 01:39, Matthew Brost wrote:
> > This aligns with the uAPI of an array of binds or single bind that
> > results in multiple GPUVA ops to be considered a single atomic
> > operations.
> > 
> > The implemenation is roughly:
> > - xe_vma_ops is a list of xe_vma_op (GPUVA op)
> > - each xe_vma_op resolves to 0-3 PT ops
> > - xe_vma_ops creates a single job
> > - if at any point during binding a failure occurs, xe_vma_ops contains
> >    the information necessary unwind the PT and VMA (GPUVA) state
> > 
> > v2:
> >   - add missing dma-resv slot reservation (CI, testing)
> > v4:
> >   - Fix TLB invalidation (Paulo)
> >   - Add missing xe_sched_job_last_fence_add/test_dep check (Inspection)
> > v5:
> >   - Invert i, j usage (Matthew Auld)
> >   - Add helper to test and add job dep (Matthew Auld)
> >   - Return on anything but -ETIME for cpu bind (Matthew Auld)
> >   - Return -ENOBUFS if suballoc of BB fails due to size (Matthew Auld)
> >   - s/do/Do (Matthew Auld)
> >   - Add missing comma (Matthew Auld)
> >   - Do not assign return value to xe_range_fence_insert (Matthew Auld)
> > 
> > Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_bo_types.h |    2 +
> >   drivers/gpu/drm/xe/xe_migrate.c  |  306 ++++-----
> >   drivers/gpu/drm/xe/xe_migrate.h  |   32 +-
> >   drivers/gpu/drm/xe/xe_pt.c       | 1102 +++++++++++++++++++-----------
> >   drivers/gpu/drm/xe/xe_pt.h       |   14 +-
> >   drivers/gpu/drm/xe/xe_pt_types.h |   36 +
> >   drivers/gpu/drm/xe/xe_vm.c       |  519 +++-----------
> >   drivers/gpu/drm/xe/xe_vm.h       |    2 +
> >   drivers/gpu/drm/xe/xe_vm_types.h |   45 +-
> >   9 files changed, 1036 insertions(+), 1022 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> > index 86422e113d39..02d68873558a 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_types.h
> > +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> > @@ -58,6 +58,8 @@ struct xe_bo {
> >   #endif
> >   	/** @freed: List node for delayed put. */
> >   	struct llist_node freed;
> > +	/** @update_index: Update index if PT BO */
> > +	int update_index;
> >   	/** @created: Whether the bo has passed initial creation */
> >   	bool created;
> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> > index af62783d34ac..160bfcd510ae 100644
> > --- a/drivers/gpu/drm/xe/xe_migrate.c
> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
> > @@ -1125,6 +1125,7 @@ struct dma_fence *xe_migrate_clear(struct xe_migrate *m,
> >   }
> >   static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> > +			  const struct xe_vm_pgtable_update_op *pt_op,
> >   			  const struct xe_vm_pgtable_update *update,
> >   			  struct xe_migrate_pt_update *pt_update)
> >   {
> > @@ -1159,8 +1160,12 @@ static void write_pgtable(struct xe_tile *tile, struct xe_bb *bb, u64 ppgtt_ofs,
> >   		bb->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(chunk);
> >   		bb->cs[bb->len++] = lower_32_bits(addr);
> >   		bb->cs[bb->len++] = upper_32_bits(addr);
> > -		ops->populate(pt_update, tile, NULL, bb->cs + bb->len, ofs, chunk,
> > -			      update);
> > +		if (pt_op->bind)
> > +			ops->populate(pt_update, tile, NULL, bb->cs + bb->len,
> > +				      ofs, chunk, update);
> > +		else
> > +			ops->clear(pt_update, tile, NULL, bb->cs + bb->len,
> > +				   ofs, chunk, update);
> >   		bb->len += chunk * 2;
> >   		ofs += chunk;
> > @@ -1185,114 +1190,58 @@ struct migrate_test_params {
> >   static struct dma_fence *
> >   xe_migrate_update_pgtables_cpu(struct xe_migrate *m,
> > -			       struct xe_vm *vm, struct xe_bo *bo,
> > -			       const struct  xe_vm_pgtable_update *updates,
> > -			       u32 num_updates, bool wait_vm,
> >   			       struct xe_migrate_pt_update *pt_update)
> >   {
> >   	XE_TEST_DECLARE(struct migrate_test_params *test =
> >   			to_migrate_test_params
> >   			(xe_cur_kunit_priv(XE_TEST_LIVE_MIGRATE));)
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> > -	struct dma_fence *fence;
> > +	struct xe_vm *vm = pt_update->vops->vm;
> > +	struct xe_vm_pgtable_update_ops *pt_update_ops =
> > +		&pt_update->vops->pt_update_ops[pt_update->tile_id];
> >   	int err;
> > -	u32 i;
> > +	u32 i, j;
> >   	if (XE_TEST_ONLY(test && test->force_gpu))
> >   		return ERR_PTR(-ETIME);
> > -	if (bo && !dma_resv_test_signaled(bo->ttm.base.resv,
> > -					  DMA_RESV_USAGE_KERNEL))
> > -		return ERR_PTR(-ETIME);
> > -
> > -	if (wait_vm && !dma_resv_test_signaled(xe_vm_resv(vm),
> > -					       DMA_RESV_USAGE_BOOKKEEP))
> > -		return ERR_PTR(-ETIME);
> > -
> >   	if (ops->pre_commit) {
> >   		pt_update->job = NULL;
> >   		err = ops->pre_commit(pt_update);
> >   		if (err)
> >   			return ERR_PTR(err);
> >   	}
> > -	for (i = 0; i < num_updates; i++) {
> > -		const struct xe_vm_pgtable_update *update = &updates[i];
> > -
> > -		ops->populate(pt_update, m->tile, &update->pt_bo->vmap, NULL,
> > -			      update->ofs, update->qwords, update);
> > -	}
> > -
> > -	if (vm) {
> > -		trace_xe_vm_cpu_bind(vm);
> > -		xe_device_wmb(vm->xe);
> > -	}
> > -
> > -	fence = dma_fence_get_stub();
> > -
> > -	return fence;
> > -}
> > -
> > -static bool no_in_syncs(struct xe_vm *vm, struct xe_exec_queue *q,
> > -			struct xe_sync_entry *syncs, u32 num_syncs)
> > -{
> > -	struct dma_fence *fence;
> > -	int i;
> > -	for (i = 0; i < num_syncs; i++) {
> > -		fence = syncs[i].fence;
> > -
> > -		if (fence && !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> > -				       &fence->flags))
> > -			return false;
> > -	}
> > -	if (q) {
> > -		fence = xe_exec_queue_last_fence_get(q, vm);
> > -		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> > -			dma_fence_put(fence);
> > -			return false;
> > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +		const struct xe_vm_pgtable_update_op *pt_op =
> > +			&pt_update_ops->ops[i];
> > +
> > +		for (j = 0; j < pt_op->num_entries; j++) {
> > +			const struct xe_vm_pgtable_update *update =
> > +				&pt_op->entries[j];
> > +
> > +			if (pt_op->bind)
> > +				ops->populate(pt_update, m->tile,
> > +					      &update->pt_bo->vmap, NULL,
> > +					      update->ofs, update->qwords,
> > +					      update);
> > +			else
> > +				ops->clear(pt_update, m->tile,
> > +					   &update->pt_bo->vmap, NULL,
> > +					   update->ofs, update->qwords, update);
> >   		}
> > -		dma_fence_put(fence);
> >   	}
> > -	return true;
> > +	trace_xe_vm_cpu_bind(vm);
> > +	xe_device_wmb(vm->xe);
> > +
> > +	return dma_fence_get_stub();
> >   }
> > -/**
> > - * xe_migrate_update_pgtables() - Pipelined page-table update
> > - * @m: The migrate context.
> > - * @vm: The vm we'll be updating.
> > - * @bo: The bo whose dma-resv we will await before updating, or NULL if userptr.
> > - * @q: The exec queue to be used for the update or NULL if the default
> > - * migration engine is to be used.
> > - * @updates: An array of update descriptors.
> > - * @num_updates: Number of descriptors in @updates.
> > - * @syncs: Array of xe_sync_entry to await before updating. Note that waits
> > - * will block the engine timeline.
> > - * @num_syncs: Number of entries in @syncs.
> > - * @pt_update: Pointer to a struct xe_migrate_pt_update, which contains
> > - * pointers to callback functions and, if subclassed, private arguments to
> > - * those.
> > - *
> > - * Perform a pipelined page-table update. The update descriptors are typically
> > - * built under the same lock critical section as a call to this function. If
> > - * using the default engine for the updates, they will be performed in the
> > - * order they grab the job_mutex. If different engines are used, external
> > - * synchronization is needed for overlapping updates to maintain page-table
> > - * consistency. Note that the meaing of "overlapping" is that the updates
> > - * touch the same page-table, which might be a higher-level page-directory.
> > - * If no pipelining is needed, then updates may be performed by the cpu.
> > - *
> > - * Return: A dma_fence that, when signaled, indicates the update completion.
> > - */
> > -struct dma_fence *
> > -xe_migrate_update_pgtables(struct xe_migrate *m,
> > -			   struct xe_vm *vm,
> > -			   struct xe_bo *bo,
> > -			   struct xe_exec_queue *q,
> > -			   const struct xe_vm_pgtable_update *updates,
> > -			   u32 num_updates,
> > -			   struct xe_sync_entry *syncs, u32 num_syncs,
> > -			   struct xe_migrate_pt_update *pt_update)
> > +static struct dma_fence *
> > +__xe_migrate_update_pgtables(struct xe_migrate *m,
> > +			     struct xe_migrate_pt_update *pt_update,
> > +			     struct xe_vm_pgtable_update_ops *pt_update_ops)
> >   {
> >   	const struct xe_migrate_pt_update_ops *ops = pt_update->ops;
> >   	struct xe_tile *tile = m->tile;
> > @@ -1301,59 +1250,53 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   	struct xe_sched_job *job;
> >   	struct dma_fence *fence;
> >   	struct drm_suballoc *sa_bo = NULL;
> > -	struct xe_vma *vma = pt_update->vma;
> >   	struct xe_bb *bb;
> > -	u32 i, batch_size, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 i, j, batch_size = 0, ppgtt_ofs, update_idx, page_ofs = 0;
> > +	u32 num_updates = 0, current_update = 0;
> >   	u64 addr;
> >   	int err = 0;
> > -	bool usm = !q && xe->info.has_usm;
> > -	bool first_munmap_rebind = vma &&
> > -		vma->gpuva.flags & XE_VMA_FIRST_REBIND;
> > -	struct xe_exec_queue *q_override = !q ? m->q : q;
> > -	u16 pat_index = xe->pat.idx[XE_CACHE_WB];
> > +	bool is_migrate = pt_update_ops->q == m->q;
> > +	bool usm = is_migrate && xe->info.has_usm;
> > +
> > +	for (i = 0; i < pt_update_ops->num_ops; ++i) {
> > +		struct xe_vm_pgtable_update_op *pt_op = &pt_update_ops->ops[i];
> > +		struct xe_vm_pgtable_update *updates = pt_op->entries;
> > -	/* Use the CPU if no in syncs and engine is idle */
> > -	if (no_in_syncs(vm, q, syncs, num_syncs) && xe_exec_queue_is_idle(q_override)) {
> > -		fence =  xe_migrate_update_pgtables_cpu(m, vm, bo, updates,
> > -							num_updates,
> > -							first_munmap_rebind,
> > -							pt_update);
> > -		if (!IS_ERR(fence) || fence == ERR_PTR(-EAGAIN))
> > -			return fence;
> > +		num_updates += pt_op->num_entries;
> > +		for (j = 0; j < pt_op->num_entries; ++j) {
> > +			u32 num_cmds = DIV_ROUND_UP(updates[j].qwords, 0x1ff);
> 
> Why 0x1ff here? Should it not be MAX_PTE_PER_SDI? There is a failure in CI
> here: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133034v5/shard-lnl-8/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
> 
> Wondering if this is the cause? i.e we think we can fit more stores per
> MI_STORE_DATA_IMM, since write_pgtable() below is using MAX_PTE_PER_SDI and
> not 0x1ff?
> 

This indeed was the source of the CI failure, could easily create this
on TGL too. Thanks for catching this.

Matt

> > +
> > +			/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > +			batch_size += 4 * num_cmds + updates[j].qwords * 2;
> > +		}
> >   	}
> >   	/* fixed + PTE entries */
> >   	if (IS_DGFX(xe))
> > -		batch_size = 2;
> > +		batch_size += 2;
> >   	else
> > -		batch_size = 6 + num_updates * 2;
> > -
> > -	for (i = 0; i < num_updates; i++) {
> > -		u32 num_cmds = DIV_ROUND_UP(updates[i].qwords, MAX_PTE_PER_SDI);
> > +		batch_size += 6 + num_updates * 2;
> > -		/* align noop + MI_STORE_DATA_IMM cmd prefix */
> > -		batch_size += 4 * num_cmds + updates[i].qwords * 2;
> > -	}
> > -
> > -	/*
> > -	 * XXX: Create temp bo to copy from, if batch_size becomes too big?
> > -	 *
> > -	 * Worst case: Sum(2 * (each lower level page size) + (top level page size))
> > -	 * Should be reasonably bound..
> > -	 */
> > -	xe_tile_assert(tile, batch_size < SZ_128K);
> > +	bb = xe_bb_new(gt, batch_size, usm);
> 
> So do we now validate that batch_size fits within the total pool size
> somewhere, to avoid triggering the warning in drm_suballoc_new? Did your igt
> not trigger the warning? Also the below check is not too late?
> 
> > +	if (IS_ERR(bb)) {
> > +		/*
> > +		 * BB to large, return -ENOBUFS indicating user should split
> > +		 * array of binds into smaller chunks.
> > +		 */
> > +		if (PTR_ERR(bb) == -EINVAL)
> > +			return ERR_PTR(-ENOBUFS);
> > -	bb = xe_bb_new(gt, batch_size, !q && xe->info.has_usm);
> > -	if (IS_ERR(bb))
> >   		return ERR_CAST(bb);
> > +	}
> >   	/* For sysmem PTE's, need to map them in our hole.. */
> >   	if (!IS_DGFX(xe)) {
> >   		ppgtt_ofs = NUM_KERNEL_PDE - 1;
> > -		if (q) {
> > -			xe_tile_assert(tile, num_updates <= NUM_VMUSA_WRITES_PER_UNIT);
> > +		if (!is_migrate) {
> > +			u32 num_units = DIV_ROUND_UP(num_updates,
> > +						     NUM_VMUSA_WRITES_PER_UNIT);
> > -			sa_bo = drm_suballoc_new(&m->vm_update_sa, 1,
> > +			sa_bo = drm_suballoc_new(&m->vm_update_sa, num_units,
> >   						 GFP_KERNEL, true, 0);
> 
> And maybe here also?
> 
> >   			if (IS_ERR(sa_bo)) {
> >   				err = PTR_ERR(sa_bo);
> > @@ -1373,14 +1316,26 @@ xe_migrate_update_pgtables(struct xe_migrate *m,
> >   		bb->cs[bb->len++] = ppgtt_ofs * XE_PAGE_SIZE + page_ofs;
> >   		bb->cs[bb->len++] = 0; /* upper_32_bits */
> 
> Off camera this is doing:
> 
> b->cs[bb->len++] = MI_STORE_DATA_IMM | MI_SDI_NUM_QW(num_updates);
> 
> What are certain that num_updates still can be done with single command
> here?  Do we not need to break it up like we do with write_pgtable? If it's
> not an issue I think would be good to add an assert to ensure it fits?
> 
> <snip>
