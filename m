Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FD1C83F37
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 18:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B216D10E6AF;
	Thu, 31 Aug 2023 18:34:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E449510E1A0
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 18:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693506882; x=1725042882;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=HwLpWFlPbOMwaFOKDDOKiPkAy6ICrXwW9u4FrW3MmmM=;
 b=XzJQ/IjEqMi+lbzIwSQC8jbyvkbAkNik+Qdxu96D/UGKZh0yXEZhhM7L
 s5NxnrS7uQmpfZ90tywuT66bm8LYjSFuWSpsZD3vMcLiz+9HRZ7QSZv8p
 7DxeTNapkM/tEHo4Gd1F20qryqxPB7zldAllZ7em9kCibWpRHjQzcmHFd
 /JKpwxRmG2EIJpHRDeP475su+Q21AZ9vTtpYSUdlzP2+0UfhE4mwaTinL
 qQ51pTtAH5inhfpCcn/vBg+fawcwbSqJfyUXzNUNIqEvVV+BTLORK/J8d
 bdNCCOtC2P4gjod7KWeWWn+RcC5UigFwAUmSRc3+08HtmUBJW4ThR3qYV w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="407025501"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="407025501"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 11:34:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="742819386"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="742819386"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 11:34:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:17 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 11:34:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 11:34:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VWS3OhKOhYXaNZ8cZsdWUPJEIC4wjx2g0MmpeJWE4K8NhgNzAueYZPDTRbylYe+c4SyebEEfd9tv7f/qLhe1M4mOacnlZX1p2BFVrCrRdCv9OqA2I/9ASxz8hjMSN8t0qLhiUpWDQDkn1BVPEHseONqpgQJnw/ECcdP2M79u1E5tTzaRtLV+J9DeRBLFoBiCYwoN77EKKMdxheFaJ0duO35HaiB7HyOvtWrutPLJlbJl+zjNTXrPGTBszlSrW1xC3hRgK059LxaaxQTgr3ulcd2Oc7KMVYnmG9xa0SvxzeLv9/xvllclxFWqX4fNQ+rUIBnCt9b/UaZKMrR2J8+kSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/mSPCQLeKaKbxOmaEHWE533clcsSuKtf4pQFK0o5tmo=;
 b=PfSIKumOmF+9m12pZMTNuE1Ta5UlsjxF+ORaECchaI32MK+yyFSGtp4wBtosueEnwl9h3bnXK/r1/X1dCjP803jG1oDSbnfvVbh8O7zJ3AP8pOWznQTVOuJ8u+Eos4cPod3sWl2TXBq72etR6LZCsLTF22U0uvQ7tmUDe8IxBIqd9Js5kpiygXkLh0ithJ/BZSYs6+LgxXWjYf2KmwIQ9MLWNnCQ3f3fsMAfecyZaZG5g/XPIhjHuR02eeiDoK6tOjlnrVPkt7QoKFE8EIAK0oyH49DFMjwUWiPcdF1leIaCAv08olCItUJIZhLquEKoVwYU7pshq8jd1to5FjYhfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB7513.namprd11.prod.outlook.com (2603:10b6:510:270::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.21; Thu, 31 Aug
 2023 18:34:15 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 18:34:15 +0000
Date: Thu, 31 Aug 2023 18:33:11 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDc55Re63e+U4DQ@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-2-thomas.hellstrom@linux.intel.com>
 <4e7045b07c2b09f011ed8f1bc0009296a850f7e0.camel@linux.intel.com>
 <ZPDHfKJo2o+I2Bg6@DUT025-TGLU.fm.intel.com>
 <d8b63ee2-99ad-b9e2-04f8-f8da56ca3a04@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d8b63ee2-99ad-b9e2-04f8-f8da56ca3a04@linux.intel.com>
X-ClientProxiedBy: BYAPR01CA0009.prod.exchangelabs.com (2603:10b6:a02:80::22)
 To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB7513:EE_
X-MS-Office365-Filtering-Correlation-Id: 65d01844-c837-4346-bbf5-08dbaa50e0d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: t8uCzKnlptHYpuAsGj6tZ/6HDJokSXuJ4R37HF9dJ8/S0c+VVk9NW3vxlIAV3rshBDNW+x2Ar06cHCQMHhEjGazPu5HTVgFOC9uSNFMOTVU64YrT2VY6Ayh4FwIMhtHZILbe/nekiEVDG9RkrC0kMxRtyxnSCg5ElwB+zIZ6UMvLmgnZyT4cuCJO+Rrpc6518W3knBb1NORuKHWTgxJf8rxpLhgo692A6hR65+syrUzKvFqgHTTASgc7Dt6dXScjQYSIPdM9ACLC0QXAsSDHNQPKzsr2CWrHRQ8rUy8xAUys4CJ5ItNpPr9b7XOAKx5DtB3vyKevnkWLd2VDmWp/MOrdecvgnggG+ZAZRwEiaR9oRR9pWkRykUSNy8S+uyHEOpGZqvXURnz5u2OYgzHjdw5SL2nEXFR2k3LK8QmMClZ2kr1BCVQ2xFtkzBwQ24sU4eys22wH3J995FkWy7q7f4OBPB/Tsa8hOCNy99/Ra+uyUrtt9HeZhu8lxqAnsg46efw+c8KeUZ35/cMlmVhWhrw1E+a18gzgFPIKul7CKF0Iqp8l9O86tFbb5qEVun653bGFxV9IhIhaJb4DPLgcpRs9DSm4obWPHoPz0w0klPvxEN+wFnxTAf0P47nmpbbDoYW91SaBw6rStmedbfbAYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(39860400002)(366004)(396003)(376002)(136003)(1800799009)(451199024)(186009)(66946007)(6506007)(6512007)(6486002)(6666004)(53546011)(478600001)(83380400001)(66574015)(30864003)(26005)(2906002)(6916009)(66556008)(66476007)(41300700001)(44832011)(4326008)(5660300002)(8676002)(316002)(8936002)(38100700002)(82960400001)(86362001)(66899024)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?40Vxsd0rvjjbm9Q0gHjbxgGHsiWYVshNWEcYnieOstiJDDTJlAz6zMXKrL?=
 =?iso-8859-1?Q?oLLArHv9maM0r2X19F4hUsQmwgM1LIaXoVxjUUUUx7WMLfllY4OAJ7LSWD?=
 =?iso-8859-1?Q?/pT005AxBLW1Z4Oyh9U8xDQSGK5oDtGPSrI9eGxG8mw6+IWiTcXhj/Ga9O?=
 =?iso-8859-1?Q?OjnvheBA8Igoqd2fWSU6Kyxk5ktFZnZPdYCS6Bnlq3juZuzIie6sEXGYF5?=
 =?iso-8859-1?Q?g/VaEtOHiIPnjatA4HnT7rp1PRqWleKiVlpq/sqPM4nIgiprgFp35t6nfN?=
 =?iso-8859-1?Q?W++aIS3g1EuleR8j8919D0yM/gwth7VTQmHX1Wq2e9Ld/NMjQ+tKtf9KOX?=
 =?iso-8859-1?Q?KF0hzYAZ3eYyLHpbNU4afHhUCdrw+bH6fWLZXRyNlTr0DmBErN/783sGR0?=
 =?iso-8859-1?Q?NFmg/UOBQXeO94vRN32Wwfpn5lJEmiYK5nAD8FGXaVPpzqXo92KwqlSvau?=
 =?iso-8859-1?Q?pR8xY5zAPPJQiZltbCUTGvm/3YxqVprSt4uA4HyKdqD0MH4oXbsCePmcY0?=
 =?iso-8859-1?Q?dbcUzPm/CFL5LN+bcDEBUgYap5XTFYKd+fn2rY1NlB15CxjZLq+nkJfn4Q?=
 =?iso-8859-1?Q?Ll4kRrzEp6HAra/TApwZH9OtQmqcv9DQrINJ59vU8W5roKTaNkiUmEyOms?=
 =?iso-8859-1?Q?cyufEB9OMPxcuKw57ZOe+DARsOJUp3Km9LCv0q0O0GAvct2N/8pFGqqNR6?=
 =?iso-8859-1?Q?+as7qtBh/qHWf0krxR08VQBiix/YrTERm7Ag3b21pQS7fYgQjVcXUNr+QS?=
 =?iso-8859-1?Q?ae7Q1RsDmjmI8g1YbrC/k6LrDedbDvfVk4gi6gtxn6MFUsux3ET0a6o2Va?=
 =?iso-8859-1?Q?YjCcrlBfR5X9+XU9243jsUy3X/90GttBb+yfw8y6EFcGgGu2Xub2F1qkgd?=
 =?iso-8859-1?Q?7UHtnhrGhnrPBbHldZh3izv86uK5rGfu9gb9RpULwe9OdOBEJXvacP1t/d?=
 =?iso-8859-1?Q?O71lmO8zqSqVxi8tJXs0gWBf2J6xqrOep7Kwwj/LdLdT3nkLN113BaCzK8?=
 =?iso-8859-1?Q?nuVGNoDsPCfotsiFSNfOlRVnQ+Hd28VXdrTBvMRkKEISKu0hPooVAtHBSu?=
 =?iso-8859-1?Q?54hK4OJj1++vpukNWR7dN5EWImf8pyjsc1F/+nuVt4CKGRVYrn0Z2rOANF?=
 =?iso-8859-1?Q?4WECHhSUI65KPbAH0tkSMi9sZydtbFsC0BynkrTK5tckmMftlJNVvixQsc?=
 =?iso-8859-1?Q?4tNH1wdw94UQ52HAHP9ZfAsJz5u8l2SycjHdmTxHb8a7f+TOGJy2Zvmj6b?=
 =?iso-8859-1?Q?+bCKwByp1OU9AoXdsJDVlAuGWiP0UDse8onFoAN8JKoZxoqh+YlaSB0PtT?=
 =?iso-8859-1?Q?gmUBQByuhRHHqcmpaIHOxJGl/DU8DOy7bhYSwNXZpEI1qHhYvRyEnmT57j?=
 =?iso-8859-1?Q?+kH9tRx0o11LofBx6+G4vrbn6KFS43n8tI9iNhT9o85d7v5IWRclpoU4zL?=
 =?iso-8859-1?Q?KETc/yvwesMw3FHkl2R9kKSlkOq5+6+I7ikP/7nwo3pp1/80HjO7Yma0qQ?=
 =?iso-8859-1?Q?Iss+4AQsLNweU05w7zuY714f7gG3bmJ1wpP0yZNFbnQaVqEZdAFlqG7/Cf?=
 =?iso-8859-1?Q?k+7s3dh64Ycu/a3oJuLISTRJQzL0kYo9lChCC8vmTLdp14SG+0elqZQ3mA?=
 =?iso-8859-1?Q?oUHVoIBlYacte3KLZxoIhhkGcCZE66KCIwWgHvMrGcvO33mN+kXbbV1A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 65d01844-c837-4346-bbf5-08dbaa50e0d8
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 18:34:15.1548 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qDK585ilvYPrEjbXoIjwldrjsp2jtt/0zhpQhpt23ImbSyiRQCwoPwPjJiFCE8YNKz4KIW1gsiiqlcGtm/lZ4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7513
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 1/6] drm/xe/bo: Simplify xe_bo_lock()
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Aug 31, 2023 at 07:48:01PM +0200, Thomas Hellström wrote:
> 
> On 8/31/23 19:01, Matthew Brost wrote:
> > On Thu, Aug 31, 2023 at 04:43:57PM +0200, Thomas Hellström wrote:
> > > On Thu, 2023-08-31 at 11:29 +0200, Thomas Hellström wrote:
> > > > xe_bo_lock() was, although it only grabbed a single lock,
> > > > unnecessarily
> > > > using ttm_eu_reserve_buffers(). Simplify and document the interface.
> > > > 
> > > > v2:
> > > > - Update also the xe_display subsysem.
> > > > 
> > > > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > ---
> > > >   drivers/gpu/drm/i915/display/intel_display.c |  5 +--
> > > >   drivers/gpu/drm/xe/tests/xe_bo.c             | 24 +++++------
> > > >   drivers/gpu/drm/xe/xe_bo.c                   | 42 ++++++++++++------
> > > > --
> > > >   drivers/gpu/drm/xe/xe_bo.h                   |  5 +--
> > > >   drivers/gpu/drm/xe/xe_bo_evict.c             | 19 ++++-----
> > > >   drivers/gpu/drm/xe/xe_gt_pagefault.c         | 41 +++++++-----------
> > > > -
> > > >   drivers/gpu/drm/xe/xe_vm.c                   | 22 +++++-----
> > > >   drivers/gpu/drm/xe/xe_vm_madvise.c           | 30 ++++++--------
> > > >   8 files changed, 85 insertions(+), 103 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > > > b/drivers/gpu/drm/i915/display/intel_display.c
> > > > index d6b481f33b45..9df8081f78d9 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > @@ -6938,11 +6938,10 @@ static int
> > > > i915_gem_object_read_from_page(struct xe_bo *bo,
> > > >          void *virtual;
> > > >          bool is_iomem;
> > > >          int ret;
> > > > -       struct ww_acquire_ctx ww;
> > > >          XE_WARN_ON(size != 8);
> > > > -       ret = xe_bo_lock(bo, &ww, 0, true);
> > > > +       ret = xe_bo_lock(bo, true);
> > > >          if (ret)
> > > >                  return ret;
> > > > @@ -6959,7 +6958,7 @@ static int
> > > > i915_gem_object_read_from_page(struct xe_bo *bo,
> > > >          ttm_bo_kunmap(&map);
> > > >   out_unlock:
> > > > -       xe_bo_unlock(bo, &ww);
> > > > +       xe_bo_unlock(bo);
> > > >          return ret;
> > > >   }
> > > >   #endif
> > > > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > index b32a9068d76c..31fd4f9b2d5b 100644
> > > > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > > > @@ -203,9 +203,9 @@ static int evict_test_run_gt(struct xe_device
> > > > *xe, struct xe_gt *gt, struct kuni
> > > >                          goto cleanup_bo;
> > > >                  }
> > > > -               xe_bo_lock(external, &ww, 0, false);
> > > > +               xe_bo_lock(external, false);
> > > >                  err = xe_bo_pin_external(external);
> > > > -               xe_bo_unlock(external, &ww);
> > > > +               xe_bo_unlock(external);
> > > >                  if (err) {
> > > >                          KUNIT_FAIL(test, "external bo pin err=%pe\n",
> > > >                                     ERR_PTR(err));
> > > > @@ -268,9 +268,9 @@ static int evict_test_run_gt(struct xe_device
> > > > *xe, struct xe_gt *gt, struct kuni
> > > >                                             ERR_PTR(err));
> > > >                                  goto cleanup_all;
> > > >                          }
> > > > -                       xe_bo_lock(external, &ww, 0, false);
> > > > +                       xe_bo_lock(external, false);
> > > >                          err = xe_bo_validate(external, NULL, false);
> > > > -                       xe_bo_unlock(external, &ww);
> > > > +                       xe_bo_unlock(external);
> > > >                          if (err) {
> > > >                                  KUNIT_FAIL(test, "external bo valid
> > > > err=%pe\n",
> > > >                                             ERR_PTR(err));
> > > > @@ -278,28 +278,28 @@ static int evict_test_run_gt(struct xe_device
> > > > *xe, struct xe_gt *gt, struct kuni
> > > >                          }
> > > >                  }
> > > > -               xe_bo_lock(external, &ww, 0, false);
> > > > +               xe_bo_lock(external, false);
> > > >                  xe_bo_unpin_external(external);
> > > > -               xe_bo_unlock(external, &ww);
> > > > +               xe_bo_unlock(external);
> > > >                  xe_bo_put(external);
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  __xe_bo_unset_bulk_move(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  xe_bo_put(bo);
> > > >                  continue;
> > > >   cleanup_all:
> > > > -               xe_bo_lock(external, &ww, 0, false);
> > > > +               xe_bo_lock(external, false);
> > > >                  xe_bo_unpin_external(external);
> > > > -               xe_bo_unlock(external, &ww);
> > > > +               xe_bo_unlock(external);
> > > >   cleanup_external:
> > > >                  xe_bo_put(external);
> > > >   cleanup_bo:
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  __xe_bo_unset_bulk_move(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  xe_bo_put(bo);
> > > >                  break;
> > > >          }
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > > index 6a8a41dafe88..9d70d12e79b1 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > > @@ -1079,13 +1079,11 @@ static void xe_gem_object_close(struct
> > > > drm_gem_object *obj,
> > > >          struct xe_bo *bo = gem_to_xe_bo(obj);
> > > >          if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> > > > -               struct ww_acquire_ctx ww;
> > > > -
> > > >                  XE_WARN_ON(!xe_bo_is_user(bo));
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >   }
> > > > @@ -1863,26 +1861,36 @@ int xe_gem_mmap_offset_ioctl(struct
> > > > drm_device *dev, void *data,
> > > >          return 0;
> > > >   }
> > > > -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > > > -              int num_resv, bool intr)
> > > > +/**
> > > > + * xe_bo_lock() - Lock the buffer object's dma_resv object
> > > > + * @bo: The struct xe_bo whose lock is to be taken
> > > > + * @intr: Whether to perform any wait interruptible
> > > > + *
> > > > + * Locks the buffer object's dma_resv object. If the buffer object
> > > > is
> > > > + * pointing to a shared dma_resv object, that shared lock is locked.
> > > > + *
> > > > + * Return: 0 on success, -EINTR if @intr is true and the wait for a
> > > > + * contended lock was interrupted.
> > Probably should add in kernel doc that it is ok for the call to not
> > check the return value if intr == false && number fence reservation
> > slots == 0. The existing code I think follows this pattern but it is not
> > documented.
> Sure, although see below about the fence slots.
> > > > + */
> > > > +int xe_bo_lock(struct xe_bo *bo, bool intr)
> > > >   {
> > > > -       struct ttm_validate_buffer tv_bo;
> > > > -       LIST_HEAD(objs);
> > > > -       LIST_HEAD(dups);
> > > > +       if (intr)
> > > > +               return dma_resv_lock_interruptible(bo->ttm.base.resv,
> > > > NULL);
> > > > -       XE_WARN_ON(!ww);
> > > > +       dma_resv_lock(bo->ttm.base.resv, NULL);
> > > > -       tv_bo.num_shared = num_resv;
> > > > -       tv_bo.bo = &bo->ttm;
> > > > -       list_add_tail(&tv_bo.head, &objs);
> > > > -
> > > > -       return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > > > +       return 0;
> > > >   }
> > > > -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> > > > +/**
> > > > + * xe_bo_unlock() - Unlock the buffer object's dma_resv object
> > > > + * @bo: The struct xe_bo whose lock is to be released.
> > > > + *
> > > > + * Unlock a buffer object lock that was locked by xe_bo_lock().
> > > > + */
> > > > +void xe_bo_unlock(struct xe_bo *bo)
> > > >   {
> > > >          dma_resv_unlock(bo->ttm.base.resv);
> > > > -       ww_acquire_fini(ww);
> > > >   }
> > > >   /**
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > > index 0823dda0f31b..a7b9e7084225 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > > @@ -149,10 +149,9 @@ static inline void xe_bo_assert_held(struct
> > > > xe_bo *bo)
> > > >                  dma_resv_assert_held((bo)->ttm.base.resv);
> > > >   }
> > > > -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > > > -              int num_resv, bool intr);
> > > > +int xe_bo_lock(struct xe_bo *bo, bool intr);
> > > > -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> > > > +void xe_bo_unlock(struct xe_bo *bo);
> > > >   static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
> > > >   {
> > > > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > index 0d5c3a208ab4..49c05ddea164 100644
> > > > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > > > @@ -27,7 +27,6 @@
> > > >   int xe_bo_evict_all(struct xe_device *xe)
> > > >   {
> > > >          struct ttm_device *bdev = &xe->ttm;
> > > > -       struct ww_acquire_ctx ww;
> > > >          struct xe_bo *bo;
> > > >          struct xe_tile *tile;
> > > >          struct list_head still_in_list;
> > > > @@ -62,9 +61,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> > > >                  list_move_tail(&bo->pinned_link, &still_in_list);
> > > >                  spin_unlock(&xe->pinned.lock);
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  ret = xe_bo_evict_pinned(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  xe_bo_put(bo);
> > > >                  if (ret) {
> > > >                          spin_lock(&xe->pinned.lock);
> > > > @@ -96,9 +95,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> > > >                  list_move_tail(&bo->pinned_link, &xe-
> > > > > pinned.evicted);
> > > >                  spin_unlock(&xe->pinned.lock);
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  ret = xe_bo_evict_pinned(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  xe_bo_put(bo);
> > > >                  if (ret)
> > > >                          return ret;
> > > > @@ -123,7 +122,6 @@ int xe_bo_evict_all(struct xe_device *xe)
> > > >    */
> > > >   int xe_bo_restore_kernel(struct xe_device *xe)
> > > >   {
> > > > -       struct ww_acquire_ctx ww;
> > > >          struct xe_bo *bo;
> > > >          int ret;
> > > > @@ -140,9 +138,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> > > >                  list_move_tail(&bo->pinned_link, &xe-
> > > > > pinned.kernel_bo_present);
> > > >                  spin_unlock(&xe->pinned.lock);
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  ret = xe_bo_restore_pinned(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  if (ret) {
> > > >                          xe_bo_put(bo);
> > > >                          return ret;
> > > > @@ -184,7 +182,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> > > >    */
> > > >   int xe_bo_restore_user(struct xe_device *xe)
> > > >   {
> > > > -       struct ww_acquire_ctx ww;
> > > >          struct xe_bo *bo;
> > > >          struct xe_tile *tile;
> > > >          struct list_head still_in_list;
> > > > @@ -206,9 +203,9 @@ int xe_bo_restore_user(struct xe_device *xe)
> > > >                  xe_bo_get(bo);
> > > >                  spin_unlock(&xe->pinned.lock);
> > > > -               xe_bo_lock(bo, &ww, 0, false);
> > > > +               xe_bo_lock(bo, false);
> > > >                  ret = xe_bo_restore_pinned(bo);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  xe_bo_put(bo);
> > > >                  if (ret) {
> > > >                          spin_lock(&xe->pinned.lock);
> > > > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > index b6f781b3d9d7..73fc9389a663 100644
> > > > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > > > @@ -171,20 +171,18 @@ static int handle_pagefault(struct xe_gt *gt,
> > > > struct pagefault *pf)
> > > >          /* Lock VM and BOs dma-resv */
> > > >          bo = xe_vma_bo(vma);
> > > > -       if (only_needs_bo_lock(bo)) {
> > > > -               /* This path ensures the BO's LRU is updated */
> > > > -               ret = xe_bo_lock(bo, &ww, xe->info.tile_count,
> > > > false);
> > > > -       } else {
> > > > +       if (!only_needs_bo_lock(bo)) {
> > > >                  tv_vm.num_shared = xe->info.tile_count;
> > > >                  tv_vm.bo = xe_vm_ttm_bo(vm);
> > > >                  list_add(&tv_vm.head, &objs);
> > > > -               if (bo) {
> > > > -                       tv_bo.bo = &bo->ttm;
> > > > -                       tv_bo.num_shared = xe->info.tile_count;
> > > > -                       list_add(&tv_bo.head, &objs);
> > > > -               }
> > > > -               ret = ttm_eu_reserve_buffers(&ww, &objs, false,
> > > > &dups);
> > > >          }
> > > > +       if (bo) {
> > > > +               tv_bo.bo = &bo->ttm;
> > > > +               tv_bo.num_shared = xe->info.tile_count;
> > > > +               list_add(&tv_bo.head, &objs);
> > > > +       }
> > > > +
> > > > +       ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > > >          if (ret)
> > > >                  goto unlock_vm;
> > > > @@ -227,10 +225,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > > > struct pagefault *pf)
> > > >          vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> > > >   unlock_dma_resv:
> > > > -       if (only_needs_bo_lock(bo))
> > > > -               xe_bo_unlock(bo, &ww);
> > > > -       else
> > > > -               ttm_eu_backoff_reservation(&ww, &objs);
> > > > +       ttm_eu_backoff_reservation(&ww, &objs);
> > > >   unlock_vm:
> > > >          if (!ret)
> > > >                  vm->usm.last_fault_vma = vma;
> > > > @@ -534,28 +529,22 @@ static int handle_acc(struct xe_gt *gt, struct
> > > > acc *acc)
> > > >          /* Lock VM and BOs dma-resv */
> > > >          bo = xe_vma_bo(vma);
> > > > -       if (only_needs_bo_lock(bo)) {
> > > > -               /* This path ensures the BO's LRU is updated */
> > > > -               ret = xe_bo_lock(bo, &ww, xe->info.tile_count,
> > > > false);
> > > > -       } else {
> > > > +       if (!only_needs_bo_lock(bo)) {
> > > >                  tv_vm.num_shared = xe->info.tile_count;
> > > >                  tv_vm.bo = xe_vm_ttm_bo(vm);
> > > >                  list_add(&tv_vm.head, &objs);
> > > > -               tv_bo.bo = &bo->ttm;
> > > > -               tv_bo.num_shared = xe->info.tile_count;
> > > > -               list_add(&tv_bo.head, &objs);
> > > > -               ret = ttm_eu_reserve_buffers(&ww, &objs, false,
> > > > &dups);
> > > >          }
> > > > +       tv_bo.bo = &bo->ttm;
> > > > +       tv_bo.num_shared = xe->info.tile_count;
> > > > +       list_add(&tv_bo.head, &objs);
> > > > +       ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> > > >          if (ret)
> > > >                  goto unlock_vm;
> > > >          /* Migrate to VRAM, move should invalidate the VMA first */
> > > >          ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
> > > > -       if (only_needs_bo_lock(bo))
> > > > -               xe_bo_unlock(bo, &ww);
> > > > -       else
> > > > -               ttm_eu_backoff_reservation(&ww, &objs);
> > > > +       ttm_eu_backoff_reservation(&ww, &objs);
> > > >   unlock_vm:
> > > >          up_read(&vm->lock);
> > > >          xe_vm_put(vm);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > > index 9cbf2f63d641..5679c47f47ca 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -267,10 +267,9 @@ static void arm_preempt_fences(struct xe_vm *vm,
> > > > struct list_head *list)
> > > >   static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> > > >   {
> > > >          struct xe_exec_queue *q;
> > > > -       struct ww_acquire_ctx ww;
> > > >          int err;
> > > > -       err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
> > > > +       err = xe_bo_lock(bo, true);
> > > Looks like the fence slot reservation got lost in the rebase here. Will
> > > fix in next revision.
> > > 
> > Yep, please add that back in.
> 
> To be clear, that was an open-coded fence reservation, and this is the only
> spot where it's needed. Otherwise if a fence reservation is indeed needed,
> the I think xe_bo_lock() is not the correct interface, and a drm_exec
> variant should be used instead.
> 

That works (don't have fence slot reservation arg xe_bo_lock in).

> Ideally, we'd require an (initially unused) drm_exec * parameter to
> xe_bo_validate, and track backwards so all callers indeed use a drm_exec
> variant for their locking.
>

Confused by this comment as I don't see how xe_bo_validate is relevant
here but don't disagree in general.

Matt

> /Thomas
> 
> 
> > 
> > Matt
> > 
> > > /Thomas
> > > 
> > > 
> > > >          if (err)
> > > >                  return err;
> > > > @@ -281,8 +280,8 @@ static int add_preempt_fences(struct xe_vm *vm,
> > > > struct xe_bo *bo)
> > > >                                             DMA_RESV_USAGE_BOOKKEEP);
> > > >                  }
> > > > -       xe_bo_unlock(bo, &ww);
> > > > -       return 0;
> > > > +       xe_bo_unlock(bo);
> > > > +       return err;
> > > >   }
> > > >   /**
> > > > @@ -1021,12 +1020,11 @@ bo_has_vm_references_locked(struct xe_bo *bo,
> > > > struct xe_vm *vm,
> > > >   static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> > > >                                   struct xe_vma *ignore)
> > > >   {
> > > > -       struct ww_acquire_ctx ww;
> > > >          bool ret;
> > > > -       xe_bo_lock(bo, &ww, 0, false);
> > > > +       xe_bo_lock(bo, false);
> > > >          ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> > > > -       xe_bo_unlock(bo, &ww);
> > > > +       xe_bo_unlock(bo);
> > > >          return ret;
> > > >   }
> > > > @@ -2267,7 +2265,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > > > struct xe_bo *bo,
> > > >                           u32 operation, u8 tile_mask, u32 region)
> > > >   {
> > > >          struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> > > > -       struct ww_acquire_ctx ww;
> > > >          struct drm_gpuva_ops *ops;
> > > >          struct drm_gpuva_op *__op;
> > > >          struct xe_vma_op *op;
> > > > @@ -2325,11 +2322,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > > > struct xe_bo *bo,
> > > >          case XE_VM_BIND_OP_UNMAP_ALL:
> > > >                  XE_WARN_ON(!bo);
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return ERR_PTR(err);
> > > >                  ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >                  if (IS_ERR(ops))
> > > >                          return ops;
> > > > @@ -2365,13 +2362,12 @@ static struct xe_vma *new_vma(struct xe_vm
> > > > *vm, struct drm_gpuva_op_map *op,
> > > >   {
> > > >          struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) :
> > > > NULL;
> > > >          struct xe_vma *vma;
> > > > -       struct ww_acquire_ctx ww;
> > > >          int err;
> > > >          lockdep_assert_held_write(&vm->lock);
> > > >          if (bo) {
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return ERR_PTR(err);
> > > >          }
> > > > @@ -2380,7 +2376,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm,
> > > > struct drm_gpuva_op_map *op,
> > > >                              op->va.range - 1, read_only, is_null,
> > > >                              tile_mask);
> > > >          if (bo)
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          if (xe_vma_is_userptr(vma)) {
> > > >                  err = xe_vma_userptr_pin_pages(vma);
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > index c9bc59be5094..05081fa0fbed 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > > > @@ -28,16 +28,15 @@ static int madvise_preferred_mem_class(struct
> > > > xe_device *xe, struct xe_vm *vm,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->props.preferred_mem_class = value;
> > > >                  xe_bo_placement_for_flags(xe, bo, bo->flags);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
> > > > @@ -53,16 +52,15 @@ static int madvise_preferred_gt(struct xe_device
> > > > *xe, struct xe_vm *vm,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->props.preferred_gt = value;
> > > >                  xe_bo_placement_for_flags(xe, bo, bo->flags);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
> > > > @@ -89,17 +87,16 @@ static int madvise_preferred_mem_class_gt(struct
> > > > xe_device *xe,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->props.preferred_mem_class = mem_class;
> > > >                  bo->props.preferred_gt = gt_id;
> > > >                  xe_bo_placement_for_flags(xe, bo, bo->flags);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
> > > > @@ -112,13 +109,12 @@ static int madvise_cpu_atomic(struct xe_device
> > > > *xe, struct xe_vm *vm,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > >                  if (XE_IOCTL_DBG(xe, !(bo->flags &
> > > > XE_BO_CREATE_SYSTEM_BIT)))
> > > >                          return -EINVAL;
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->props.cpu_atomic = !!value;
> > > > @@ -130,7 +126,7 @@ static int madvise_cpu_atomic(struct xe_device
> > > > *xe, struct xe_vm *vm,
> > > >                   */
> > > >                  if (bo->props.cpu_atomic)
> > > >                          ttm_bo_unmap_virtual(&bo->ttm);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
> > > > @@ -143,18 +139,17 @@ static int madvise_device_atomic(struct
> > > > xe_device *xe, struct xe_vm *vm,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > >                  if (XE_IOCTL_DBG(xe, !(bo->flags &
> > > > XE_BO_CREATE_VRAM0_BIT) &&
> > > >                                   !(bo->flags &
> > > > XE_BO_CREATE_VRAM1_BIT)))
> > > >                          return -EINVAL;
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->props.device_atomic = !!value;
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
> > > > @@ -174,16 +169,15 @@ static int madvise_priority(struct xe_device
> > > > *xe, struct xe_vm *vm,
> > > >          for (i = 0; i < num_vmas; ++i) {
> > > >                  struct xe_bo *bo;
> > > > -               struct ww_acquire_ctx ww;
> > > >                  bo = xe_vma_bo(vmas[i]);
> > > > -               err = xe_bo_lock(bo, &ww, 0, true);
> > > > +               err = xe_bo_lock(bo, true);
> > > >                  if (err)
> > > >                          return err;
> > > >                  bo->ttm.priority = value;
> > > >                  ttm_bo_move_to_lru_tail(&bo->ttm);
> > > > -               xe_bo_unlock(bo, &ww);
> > > > +               xe_bo_unlock(bo);
> > > >          }
> > > >          return 0;
