Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14E28C83F35
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 17:03:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD5A10E6A5;
	Thu, 31 Aug 2023 17:03:15 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CB610E6A5
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 17:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693501393; x=1725037393;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=olazTLpBaYbdRYnn/4ALIYC5A/CkOPsgQx00Wkc5krs=;
 b=UVHkKd/cE7anyY96YjzmzWfPesO0CFIsurcpQOPFUJfgnZl235fiD2SK
 Gw3zvRL6AkXehnd7CztXL9yARUmsR/jfZd/EIoonWaT1iu9eMfSkGw9vJ
 dBLUCA0Jnx9FBDUIZIyANui/g6OEefd11V988yr7v0Og2kolPEr2zYDtC
 q97iI9tMX8/mT6kl1J39+uuX6gFjYMeucaXUbVdXrcM6Frs9wUri0tTdr
 Dkzg3e3cN5FPx3iMAmUx1L3hW/eRfshets04Gul2jWdgbW+qGMldj343y
 Rnbb4f4F38W7ppJCnn4OD9xOKczP5gNQOilryH68DJXQZWMR9epMAeyUR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="355503790"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="355503790"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 10:02:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="863175017"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="863175017"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 10:02:55 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 10:02:53 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 10:02:53 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 10:02:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YWHyB3M3SwZ3vkU7x5Zn2vxMjNGhN19yqWUNJOzEgvxAghePnr7n1CEOHDOya9LgydapCkno5RaM72gt2T03trxE+njJ9e19oob9pmLzHnWkU7dlDxoxp7QeNVgJlKJrnf1s4kJLD/+7+KuCZ9ZvOZR2DWj8dHRoNeK11TNc0PWmFTEHDLqmDSjQdPMfSV9GMpbELyW0a64wdnDWCA9gGD6PzjGS4S3oXFPn4ZGSEBDTHiJRWdK6/yYmR0xCUI679b+dkA0ChRDo9sy5mCtQIWPP2AcGrNTbIOwJ/2TO65JjrpG9I0bnuXLNiamdNHtLwYjMhYcu0j65BLsQ/QKyng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TDk/RJ0wEQgAROZdy+1r0VgxAg+Fsgi4u9ktfsBy0Q=;
 b=dojXzEIYKB+vIBuqlaMO+hDb8cnhJAayjJXGvloiZGIqwX8HIYQrKY9rmq4G0ykjdA1ELtc1lYSR6wKSe5YMcyKEQWpM4uNM8t4gXewMlb1aawMLXdilmTrdsT3kxQe1P6MDot40w5EtYru3ex1rAy+3+8xQ2tuAc3oQzF5KrlQF+FRSlcs7c0P6nRX5IUk2wBYn7UNCijK6fmAZjS/4Bp8D8cISs+s1xNramVCE8WlYHVib268GLUEoEyrAU0uCqRoV6P5upiRHe0tC0NHACEOTPSoz112TWOKOBL5Uv+7pXMLui5vnI5o+U/0cn3BgR7et2vp3m3lBpoXGhp+A+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB8501.namprd11.prod.outlook.com (2603:10b6:510:308::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Thu, 31 Aug
 2023 17:02:51 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::99cc:830:3ea5:d42b%3]) with mapi id 15.20.6745.022; Thu, 31 Aug 2023
 17:02:50 +0000
Date: Thu, 31 Aug 2023 17:01:48 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ZPDHfKJo2o+I2Bg6@DUT025-TGLU.fm.intel.com>
References: <20230831092937.2197-1-thomas.hellstrom@linux.intel.com>
 <20230831092937.2197-2-thomas.hellstrom@linux.intel.com>
 <4e7045b07c2b09f011ed8f1bc0009296a850f7e0.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4e7045b07c2b09f011ed8f1bc0009296a850f7e0.camel@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0256.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::21) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB8501:EE_
X-MS-Office365-Filtering-Correlation-Id: 1db4bf5b-a880-4bf0-081b-08dbaa441bd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S4xOVZ06xsCP/zXO/KmfERTJ4Du4vTDtyTFI8QdnqIh8vUKhB3Tofb642REs7QdF3BZVf3u/zH2ayM1fO0N1FsDds6uohg8V5QHOGtpkFpoJPU7laFdM8v4fYhroM+uDyjnCwKpP5xMzdBJ+y7T3+bqacRGerntbxXe27MohaUO99EYH99QO/OE3A7tGSMvDK49b7ndRvVbr3PQEcWxDNWplDTRcLSgZr0BPjPMp06wgrxLsqRCRENzM5RHiUs7+l8nRhzAoJK84atsMMkWsa+8opd0Mu+ajiuevSB3KDdhPBbFRe4OFb8MLM6U5eSUUgSrALc+ZZcOyH9vx+hkjS8ZK3QudTqszLlxc5oXy0mfiIK6TXAW8UumydRWZfx8UNdSeJ5MMMoFiYKVtTEwznWDZWbfDLzgk17BDzAHrF8Fgg71s/J8bLtUMmOAbqllyrWQjkQE+D1h0jRVxDF0SZo9zqF/Vk+iRcpsaf/RjSqdR8YDeCIggHPS4smwO7tfr22quoEcJIxC2V5+kSfXO3Vb7IcQbpidIzbY8FON2D/KWLfkRzJBeNMpCzkOl4W09aKPkg/r7WSzVnpFWAdqfmETXffK3ZIDGWlM0rLtiPemEiKYuB5xS+0XNXatYNBSQ5WJZDctDEiz6LZwp8ZQgMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(396003)(346002)(366004)(39860400002)(186009)(1800799009)(451199024)(8936002)(66946007)(478600001)(66476007)(6506007)(66556008)(6486002)(6916009)(316002)(38100700002)(82960400001)(41300700001)(6512007)(26005)(5660300002)(8676002)(2906002)(30864003)(86362001)(83380400001)(66574015)(44832011)(4326008)(67856001)(309714004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?ufLPBLyLALnCIBgvJ+F2JdtgBgx8iy6moUThYyQAOyRfyaWrd4iRrcVhhb?=
 =?iso-8859-1?Q?e4LVC9L87EsFOI69G/OpXnw6LeMeJ7rsd3Pa47uEYHt27QUvGes4KL3dBu?=
 =?iso-8859-1?Q?4ouiccqe+xwqnNhP4b0syLa8paqYtB/plP5zwmk3P79fOvE4eZx48Sots+?=
 =?iso-8859-1?Q?rIK5EWtPLtCaoOkkDm7mrb7rU+XEBzG7E+i69fOYDSwNOT4bfstJKs7THW?=
 =?iso-8859-1?Q?JQ8jZT0aSczDy7ZY0J91vXybT3bvTLAE+c4d38wcwRXpI1xtZXCUlZiUQK?=
 =?iso-8859-1?Q?ofvZipHdB3c9j0MUZGoG9wzMRR87VE/tXtNzo95DFH0b4p7qlx9+oHfr6z?=
 =?iso-8859-1?Q?IBIlt+87XdEbDoCV4Q9GDDFNg8cJ8/gOQG1E+ueWLtAgz5HRNYj6pqXcvF?=
 =?iso-8859-1?Q?TVBUna73HPxAp7zro3R1KQFeeCI1dPEHpA3qAPiGbb11cXbcET65tx+byn?=
 =?iso-8859-1?Q?ECMb0u/5ukaBS5DaLjtSkVJLO2TRv9fVtuO98OLuSIBJRV+yrlsPbkm8na?=
 =?iso-8859-1?Q?mFyC14qohlbApkAwzI3HdW+HkFSq/gz8ePtc3UAHwqeyYzuIfXV9DKk+qO?=
 =?iso-8859-1?Q?ntTGQYidba/z37Dnwmi+JShZuxqqX5uIDisEkSH1apbdLtImzFD9MKEu7i?=
 =?iso-8859-1?Q?1cRic2+PtW4CFOoS3cCBoURTK7KVJM1VnzFoCT2Zbf1olDIfkR77gwl4Hd?=
 =?iso-8859-1?Q?tLFTJl2J6yfrL6lwcgtvjpfr7OaJI+Uv9Tzm5SyuMw58u/8hnTRx+ugOop?=
 =?iso-8859-1?Q?Q5h1Ke+KEdl33lu1M+J5YoflY/1btzdUfkRnVZq9pUvNnlv3ORlBG91Ff2?=
 =?iso-8859-1?Q?NeQEPrAG27yoLNrBcyM4RXmzNmL83+/qYG7qwdQgPblFX41x/2qyHcj0lS?=
 =?iso-8859-1?Q?LfXScutZiiWSKaggUeEzsMBsNX7wUF9Kj9jM9LhKo9/CI7gPTvA22I/qP4?=
 =?iso-8859-1?Q?AlG21rI3E90WOfNk5x6y11I1Ic2m7jYIWw8WS8WHhlQR439xhnEYpBtfnc?=
 =?iso-8859-1?Q?GMcUEXBOot+rMsBIuNHjZ9xTl3AVRbsYBOrZ/XoAgOE4At0bI0KvIsMB6F?=
 =?iso-8859-1?Q?Dje8dwD7S5HU4FfPM+ieJeGKS8/AKwdJLie9vcJYWsJ92JjKZMEcRBvrv3?=
 =?iso-8859-1?Q?STT4bN5YoUA4fJDB8+DDcLJuD3WCx4w+L7gCAJyygPJvQ6m8HL/P7WcvDh?=
 =?iso-8859-1?Q?YfApSWOamMzrm2QQmWRy96XXviZvf2Clg2GdsFx8lmHocLMNlH9MpAaFUv?=
 =?iso-8859-1?Q?rLo5+DLt1+f6ePNLYvfhmI5n+bhqeSoiykRTXoWcLDRrYe5feFFCV609xm?=
 =?iso-8859-1?Q?bdmVUir6RMlfm81NNBxKv4g3+KO5Kto/zCXF1B3oiQDS/ikTjhBjF/bnb3?=
 =?iso-8859-1?Q?QtoubdaWyU5qmb7dsXoZhFzIVCSMmM0nfvdQY1nxbqS9JRMMGPfAoFZJhk?=
 =?iso-8859-1?Q?gaEouKJx3pUJGmPo/e4Eq2pgOE7oA57qYUFXZP7yCUbnFhZ5vBad2KPS9G?=
 =?iso-8859-1?Q?/a4jsdkWKV9lMvu5MOp5TPfL/G6RMFmAGuvlFJOONVDHVH56k4KC9+Y8oN?=
 =?iso-8859-1?Q?D0J5IBwMAHEtC/L8IIRUEHSaxeBbKukzqmGR/BinvqtNRo+a0tOuLoU9Qw?=
 =?iso-8859-1?Q?v1NF/nVyi9B0rImmV+uaCr4EMyKp30vmaeP0Ecq0lr4urI53EkWPpk4Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db4bf5b-a880-4bf0-081b-08dbaa441bd4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 17:02:50.6666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: atFvhV3HiFkoKaYCiW8F0ShwZGUwI0QNz6vpOKpMJRjftmM1T/sfbqUl4Kc41oyaj+Pi/DCRxhsjDYJ+o91uig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8501
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

On Thu, Aug 31, 2023 at 04:43:57PM +0200, Thomas Hellström wrote:
> On Thu, 2023-08-31 at 11:29 +0200, Thomas Hellström wrote:
> > xe_bo_lock() was, although it only grabbed a single lock,
> > unnecessarily
> > using ttm_eu_reserve_buffers(). Simplify and document the interface.
> > 
> > v2:
> > - Update also the xe_display subsysem.
> > 
> > Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display.c |  5 +--
> >  drivers/gpu/drm/xe/tests/xe_bo.c             | 24 +++++------
> >  drivers/gpu/drm/xe/xe_bo.c                   | 42 ++++++++++++------
> > --
> >  drivers/gpu/drm/xe/xe_bo.h                   |  5 +--
> >  drivers/gpu/drm/xe/xe_bo_evict.c             | 19 ++++-----
> >  drivers/gpu/drm/xe/xe_gt_pagefault.c         | 41 +++++++-----------
> > -
> >  drivers/gpu/drm/xe/xe_vm.c                   | 22 +++++-----
> >  drivers/gpu/drm/xe/xe_vm_madvise.c           | 30 ++++++--------
> >  8 files changed, 85 insertions(+), 103 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/display/intel_display.c
> > b/drivers/gpu/drm/i915/display/intel_display.c
> > index d6b481f33b45..9df8081f78d9 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > @@ -6938,11 +6938,10 @@ static int
> > i915_gem_object_read_from_page(struct xe_bo *bo,
> >         void *virtual;
> >         bool is_iomem;
> >         int ret;
> > -       struct ww_acquire_ctx ww;
> >  
> >         XE_WARN_ON(size != 8);
> >  
> > -       ret = xe_bo_lock(bo, &ww, 0, true);
> > +       ret = xe_bo_lock(bo, true);
> >         if (ret)
> >                 return ret;
> >  
> > @@ -6959,7 +6958,7 @@ static int
> > i915_gem_object_read_from_page(struct xe_bo *bo,
> >  
> >         ttm_bo_kunmap(&map);
> >  out_unlock:
> > -       xe_bo_unlock(bo, &ww);
> > +       xe_bo_unlock(bo);
> >         return ret;
> >  }
> >  #endif
> > diff --git a/drivers/gpu/drm/xe/tests/xe_bo.c
> > b/drivers/gpu/drm/xe/tests/xe_bo.c
> > index b32a9068d76c..31fd4f9b2d5b 100644
> > --- a/drivers/gpu/drm/xe/tests/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/tests/xe_bo.c
> > @@ -203,9 +203,9 @@ static int evict_test_run_gt(struct xe_device
> > *xe, struct xe_gt *gt, struct kuni
> >                         goto cleanup_bo;
> >                 }
> >  
> > -               xe_bo_lock(external, &ww, 0, false);
> > +               xe_bo_lock(external, false);
> >                 err = xe_bo_pin_external(external);
> > -               xe_bo_unlock(external, &ww);
> > +               xe_bo_unlock(external);
> >                 if (err) {
> >                         KUNIT_FAIL(test, "external bo pin err=%pe\n",
> >                                    ERR_PTR(err));
> > @@ -268,9 +268,9 @@ static int evict_test_run_gt(struct xe_device
> > *xe, struct xe_gt *gt, struct kuni
> >                                            ERR_PTR(err));
> >                                 goto cleanup_all;
> >                         }
> > -                       xe_bo_lock(external, &ww, 0, false);
> > +                       xe_bo_lock(external, false);
> >                         err = xe_bo_validate(external, NULL, false);
> > -                       xe_bo_unlock(external, &ww);
> > +                       xe_bo_unlock(external);
> >                         if (err) {
> >                                 KUNIT_FAIL(test, "external bo valid
> > err=%pe\n",
> >                                            ERR_PTR(err));
> > @@ -278,28 +278,28 @@ static int evict_test_run_gt(struct xe_device
> > *xe, struct xe_gt *gt, struct kuni
> >                         }
> >                 }
> >  
> > -               xe_bo_lock(external, &ww, 0, false);
> > +               xe_bo_lock(external, false);
> >                 xe_bo_unpin_external(external);
> > -               xe_bo_unlock(external, &ww);
> > +               xe_bo_unlock(external);
> >  
> >                 xe_bo_put(external);
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 __xe_bo_unset_bulk_move(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 xe_bo_put(bo);
> >                 continue;
> >  
> >  cleanup_all:
> > -               xe_bo_lock(external, &ww, 0, false);
> > +               xe_bo_lock(external, false);
> >                 xe_bo_unpin_external(external);
> > -               xe_bo_unlock(external, &ww);
> > +               xe_bo_unlock(external);
> >  cleanup_external:
> >                 xe_bo_put(external);
> >  cleanup_bo:
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 __xe_bo_unset_bulk_move(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 xe_bo_put(bo);
> >                 break;
> >         }
> > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > index 6a8a41dafe88..9d70d12e79b1 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.c
> > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > @@ -1079,13 +1079,11 @@ static void xe_gem_object_close(struct
> > drm_gem_object *obj,
> >         struct xe_bo *bo = gem_to_xe_bo(obj);
> >  
> >         if (bo->vm && !xe_vm_in_fault_mode(bo->vm)) {
> > -               struct ww_acquire_ctx ww;
> > -
> >                 XE_WARN_ON(!xe_bo_is_user(bo));
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 ttm_bo_set_bulk_move(&bo->ttm, NULL);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  }
> >  
> > @@ -1863,26 +1861,36 @@ int xe_gem_mmap_offset_ioctl(struct
> > drm_device *dev, void *data,
> >         return 0;
> >  }
> >  
> > -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > -              int num_resv, bool intr)
> > +/**
> > + * xe_bo_lock() - Lock the buffer object's dma_resv object
> > + * @bo: The struct xe_bo whose lock is to be taken
> > + * @intr: Whether to perform any wait interruptible
> > + *
> > + * Locks the buffer object's dma_resv object. If the buffer object
> > is
> > + * pointing to a shared dma_resv object, that shared lock is locked.
> > + *
> > + * Return: 0 on success, -EINTR if @intr is true and the wait for a
> > + * contended lock was interrupted.

Probably should add in kernel doc that it is ok for the call to not
check the return value if intr == false && number fence reservation
slots == 0. The existing code I think follows this pattern but it is not
documented.

> > + */
> > +int xe_bo_lock(struct xe_bo *bo, bool intr)
> >  {
> > -       struct ttm_validate_buffer tv_bo;
> > -       LIST_HEAD(objs);
> > -       LIST_HEAD(dups);
> > +       if (intr)
> > +               return dma_resv_lock_interruptible(bo->ttm.base.resv,
> > NULL);
> >  
> > -       XE_WARN_ON(!ww);
> > +       dma_resv_lock(bo->ttm.base.resv, NULL);
> >  
> > -       tv_bo.num_shared = num_resv;
> > -       tv_bo.bo = &bo->ttm;
> > -       list_add_tail(&tv_bo.head, &objs);
> > -
> > -       return ttm_eu_reserve_buffers(ww, &objs, intr, &dups);
> > +       return 0;
> >  }
> >  
> > -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww)
> > +/**
> > + * xe_bo_unlock() - Unlock the buffer object's dma_resv object
> > + * @bo: The struct xe_bo whose lock is to be released.
> > + *
> > + * Unlock a buffer object lock that was locked by xe_bo_lock().
> > + */
> > +void xe_bo_unlock(struct xe_bo *bo)
> >  {
> >         dma_resv_unlock(bo->ttm.base.resv);
> > -       ww_acquire_fini(ww);
> >  }
> >  
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > index 0823dda0f31b..a7b9e7084225 100644
> > --- a/drivers/gpu/drm/xe/xe_bo.h
> > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > @@ -149,10 +149,9 @@ static inline void xe_bo_assert_held(struct
> > xe_bo *bo)
> >                 dma_resv_assert_held((bo)->ttm.base.resv);
> >  }
> >  
> > -int xe_bo_lock(struct xe_bo *bo, struct ww_acquire_ctx *ww,
> > -              int num_resv, bool intr);
> > +int xe_bo_lock(struct xe_bo *bo, bool intr);
> >  
> > -void xe_bo_unlock(struct xe_bo *bo, struct ww_acquire_ctx *ww);
> > +void xe_bo_unlock(struct xe_bo *bo);
> >  
> >  static inline void xe_bo_unlock_vm_held(struct xe_bo *bo)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_bo_evict.c
> > b/drivers/gpu/drm/xe/xe_bo_evict.c
> > index 0d5c3a208ab4..49c05ddea164 100644
> > --- a/drivers/gpu/drm/xe/xe_bo_evict.c
> > +++ b/drivers/gpu/drm/xe/xe_bo_evict.c
> > @@ -27,7 +27,6 @@
> >  int xe_bo_evict_all(struct xe_device *xe)
> >  {
> >         struct ttm_device *bdev = &xe->ttm;
> > -       struct ww_acquire_ctx ww;
> >         struct xe_bo *bo;
> >         struct xe_tile *tile;
> >         struct list_head still_in_list;
> > @@ -62,9 +61,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> >                 list_move_tail(&bo->pinned_link, &still_in_list);
> >                 spin_unlock(&xe->pinned.lock);
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 ret = xe_bo_evict_pinned(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 xe_bo_put(bo);
> >                 if (ret) {
> >                         spin_lock(&xe->pinned.lock);
> > @@ -96,9 +95,9 @@ int xe_bo_evict_all(struct xe_device *xe)
> >                 list_move_tail(&bo->pinned_link, &xe-
> > >pinned.evicted);
> >                 spin_unlock(&xe->pinned.lock);
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 ret = xe_bo_evict_pinned(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 xe_bo_put(bo);
> >                 if (ret)
> >                         return ret;
> > @@ -123,7 +122,6 @@ int xe_bo_evict_all(struct xe_device *xe)
> >   */
> >  int xe_bo_restore_kernel(struct xe_device *xe)
> >  {
> > -       struct ww_acquire_ctx ww;
> >         struct xe_bo *bo;
> >         int ret;
> >  
> > @@ -140,9 +138,9 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> >                 list_move_tail(&bo->pinned_link, &xe-
> > >pinned.kernel_bo_present);
> >                 spin_unlock(&xe->pinned.lock);
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 ret = xe_bo_restore_pinned(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 if (ret) {
> >                         xe_bo_put(bo);
> >                         return ret;
> > @@ -184,7 +182,6 @@ int xe_bo_restore_kernel(struct xe_device *xe)
> >   */
> >  int xe_bo_restore_user(struct xe_device *xe)
> >  {
> > -       struct ww_acquire_ctx ww;
> >         struct xe_bo *bo;
> >         struct xe_tile *tile;
> >         struct list_head still_in_list;
> > @@ -206,9 +203,9 @@ int xe_bo_restore_user(struct xe_device *xe)
> >                 xe_bo_get(bo);
> >                 spin_unlock(&xe->pinned.lock);
> >  
> > -               xe_bo_lock(bo, &ww, 0, false);
> > +               xe_bo_lock(bo, false);
> >                 ret = xe_bo_restore_pinned(bo);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 xe_bo_put(bo);
> >                 if (ret) {
> >                         spin_lock(&xe->pinned.lock);
> > diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > index b6f781b3d9d7..73fc9389a663 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
> > @@ -171,20 +171,18 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >  
> >         /* Lock VM and BOs dma-resv */
> >         bo = xe_vma_bo(vma);
> > -       if (only_needs_bo_lock(bo)) {
> > -               /* This path ensures the BO's LRU is updated */
> > -               ret = xe_bo_lock(bo, &ww, xe->info.tile_count,
> > false);
> > -       } else {
> > +       if (!only_needs_bo_lock(bo)) {
> >                 tv_vm.num_shared = xe->info.tile_count;
> >                 tv_vm.bo = xe_vm_ttm_bo(vm);
> >                 list_add(&tv_vm.head, &objs);
> > -               if (bo) {
> > -                       tv_bo.bo = &bo->ttm;
> > -                       tv_bo.num_shared = xe->info.tile_count;
> > -                       list_add(&tv_bo.head, &objs);
> > -               }
> > -               ret = ttm_eu_reserve_buffers(&ww, &objs, false,
> > &dups);
> >         }
> > +       if (bo) {
> > +               tv_bo.bo = &bo->ttm;
> > +               tv_bo.num_shared = xe->info.tile_count;
> > +               list_add(&tv_bo.head, &objs);
> > +       }
> > +
> > +       ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> >         if (ret)
> >                 goto unlock_vm;
> >  
> > @@ -227,10 +225,7 @@ static int handle_pagefault(struct xe_gt *gt,
> > struct pagefault *pf)
> >         vma->usm.tile_invalidated &= ~BIT(gt_to_tile(gt)->id);
> >  
> >  unlock_dma_resv:
> > -       if (only_needs_bo_lock(bo))
> > -               xe_bo_unlock(bo, &ww);
> > -       else
> > -               ttm_eu_backoff_reservation(&ww, &objs);
> > +       ttm_eu_backoff_reservation(&ww, &objs);
> >  unlock_vm:
> >         if (!ret)
> >                 vm->usm.last_fault_vma = vma;
> > @@ -534,28 +529,22 @@ static int handle_acc(struct xe_gt *gt, struct
> > acc *acc)
> >  
> >         /* Lock VM and BOs dma-resv */
> >         bo = xe_vma_bo(vma);
> > -       if (only_needs_bo_lock(bo)) {
> > -               /* This path ensures the BO's LRU is updated */
> > -               ret = xe_bo_lock(bo, &ww, xe->info.tile_count,
> > false);
> > -       } else {
> > +       if (!only_needs_bo_lock(bo)) {
> >                 tv_vm.num_shared = xe->info.tile_count;
> >                 tv_vm.bo = xe_vm_ttm_bo(vm);
> >                 list_add(&tv_vm.head, &objs);
> > -               tv_bo.bo = &bo->ttm;
> > -               tv_bo.num_shared = xe->info.tile_count;
> > -               list_add(&tv_bo.head, &objs);
> > -               ret = ttm_eu_reserve_buffers(&ww, &objs, false,
> > &dups);
> >         }
> > +       tv_bo.bo = &bo->ttm;
> > +       tv_bo.num_shared = xe->info.tile_count;
> > +       list_add(&tv_bo.head, &objs);
> > +       ret = ttm_eu_reserve_buffers(&ww, &objs, false, &dups);
> >         if (ret)
> >                 goto unlock_vm;
> >  
> >         /* Migrate to VRAM, move should invalidate the VMA first */
> >         ret = xe_bo_migrate(bo, XE_PL_VRAM0 + tile->id);
> >  
> > -       if (only_needs_bo_lock(bo))
> > -               xe_bo_unlock(bo, &ww);
> > -       else
> > -               ttm_eu_backoff_reservation(&ww, &objs);
> > +       ttm_eu_backoff_reservation(&ww, &objs);
> >  unlock_vm:
> >         up_read(&vm->lock);
> >         xe_vm_put(vm);
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index 9cbf2f63d641..5679c47f47ca 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -267,10 +267,9 @@ static void arm_preempt_fences(struct xe_vm *vm,
> > struct list_head *list)
> >  static int add_preempt_fences(struct xe_vm *vm, struct xe_bo *bo)
> >  {
> >         struct xe_exec_queue *q;
> > -       struct ww_acquire_ctx ww;
> >         int err;
> >  
> > -       err = xe_bo_lock(bo, &ww, vm->preempt.num_exec_queues, true);
> > +       err = xe_bo_lock(bo, true);
> 
> Looks like the fence slot reservation got lost in the rebase here. Will
> fix in next revision.
> 

Yep, please add that back in.

Matt

> /Thomas
> 
> 
> >         if (err)
> >                 return err;
> >  
> > @@ -281,8 +280,8 @@ static int add_preempt_fences(struct xe_vm *vm,
> > struct xe_bo *bo)
> >                                            DMA_RESV_USAGE_BOOKKEEP);
> >                 }
> >  
> > -       xe_bo_unlock(bo, &ww);
> > -       return 0;
> > +       xe_bo_unlock(bo);
> > +       return err;
> >  }
> >  
> >  /**
> > @@ -1021,12 +1020,11 @@ bo_has_vm_references_locked(struct xe_bo *bo,
> > struct xe_vm *vm,
> >  static bool bo_has_vm_references(struct xe_bo *bo, struct xe_vm *vm,
> >                                  struct xe_vma *ignore)
> >  {
> > -       struct ww_acquire_ctx ww;
> >         bool ret;
> >  
> > -       xe_bo_lock(bo, &ww, 0, false);
> > +       xe_bo_lock(bo, false);
> >         ret = !!bo_has_vm_references_locked(bo, vm, ignore);
> > -       xe_bo_unlock(bo, &ww);
> > +       xe_bo_unlock(bo);
> >  
> >         return ret;
> >  }
> > @@ -2267,7 +2265,6 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > struct xe_bo *bo,
> >                          u32 operation, u8 tile_mask, u32 region)
> >  {
> >         struct drm_gem_object *obj = bo ? &bo->ttm.base : NULL;
> > -       struct ww_acquire_ctx ww;
> >         struct drm_gpuva_ops *ops;
> >         struct drm_gpuva_op *__op;
> >         struct xe_vma_op *op;
> > @@ -2325,11 +2322,11 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm,
> > struct xe_bo *bo,
> >         case XE_VM_BIND_OP_UNMAP_ALL:
> >                 XE_WARN_ON(!bo);
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return ERR_PTR(err);
> >                 ops = drm_gpuva_gem_unmap_ops_create(&vm->mgr, obj);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >                 if (IS_ERR(ops))
> >                         return ops;
> >  
> > @@ -2365,13 +2362,12 @@ static struct xe_vma *new_vma(struct xe_vm
> > *vm, struct drm_gpuva_op_map *op,
> >  {
> >         struct xe_bo *bo = op->gem.obj ? gem_to_xe_bo(op->gem.obj) :
> > NULL;
> >         struct xe_vma *vma;
> > -       struct ww_acquire_ctx ww;
> >         int err;
> >  
> >         lockdep_assert_held_write(&vm->lock);
> >  
> >         if (bo) {
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return ERR_PTR(err);
> >         }
> > @@ -2380,7 +2376,7 @@ static struct xe_vma *new_vma(struct xe_vm *vm,
> > struct drm_gpuva_op_map *op,
> >                             op->va.range - 1, read_only, is_null,
> >                             tile_mask);
> >         if (bo)
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >  
> >         if (xe_vma_is_userptr(vma)) {
> >                 err = xe_vma_userptr_pin_pages(vma);
> > diff --git a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > index c9bc59be5094..05081fa0fbed 100644
> > --- a/drivers/gpu/drm/xe/xe_vm_madvise.c
> > +++ b/drivers/gpu/drm/xe/xe_vm_madvise.c
> > @@ -28,16 +28,15 @@ static int madvise_preferred_mem_class(struct
> > xe_device *xe, struct xe_vm *vm,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->props.preferred_mem_class = value;
> >                 xe_bo_placement_for_flags(xe, bo, bo->flags);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> > @@ -53,16 +52,15 @@ static int madvise_preferred_gt(struct xe_device
> > *xe, struct xe_vm *vm,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->props.preferred_gt = value;
> >                 xe_bo_placement_for_flags(xe, bo, bo->flags);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> > @@ -89,17 +87,16 @@ static int madvise_preferred_mem_class_gt(struct
> > xe_device *xe,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->props.preferred_mem_class = mem_class;
> >                 bo->props.preferred_gt = gt_id;
> >                 xe_bo_placement_for_flags(xe, bo, bo->flags);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> > @@ -112,13 +109,12 @@ static int madvise_cpu_atomic(struct xe_device
> > *xe, struct xe_vm *vm,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >                 if (XE_IOCTL_DBG(xe, !(bo->flags &
> > XE_BO_CREATE_SYSTEM_BIT)))
> >                         return -EINVAL;
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->props.cpu_atomic = !!value;
> > @@ -130,7 +126,7 @@ static int madvise_cpu_atomic(struct xe_device
> > *xe, struct xe_vm *vm,
> >                  */
> >                 if (bo->props.cpu_atomic)
> >                         ttm_bo_unmap_virtual(&bo->ttm);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> > @@ -143,18 +139,17 @@ static int madvise_device_atomic(struct
> > xe_device *xe, struct xe_vm *vm,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >                 if (XE_IOCTL_DBG(xe, !(bo->flags &
> > XE_BO_CREATE_VRAM0_BIT) &&
> >                                  !(bo->flags &
> > XE_BO_CREATE_VRAM1_BIT)))
> >                         return -EINVAL;
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->props.device_atomic = !!value;
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> > @@ -174,16 +169,15 @@ static int madvise_priority(struct xe_device
> > *xe, struct xe_vm *vm,
> >  
> >         for (i = 0; i < num_vmas; ++i) {
> >                 struct xe_bo *bo;
> > -               struct ww_acquire_ctx ww;
> >  
> >                 bo = xe_vma_bo(vmas[i]);
> >  
> > -               err = xe_bo_lock(bo, &ww, 0, true);
> > +               err = xe_bo_lock(bo, true);
> >                 if (err)
> >                         return err;
> >                 bo->ttm.priority = value;
> >                 ttm_bo_move_to_lru_tail(&bo->ttm);
> > -               xe_bo_unlock(bo, &ww);
> > +               xe_bo_unlock(bo);
> >         }
> >  
> >         return 0;
> 
