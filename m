Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F1AC7EE2E
	for <intel-xe@archiver.kernel.org>; Wed, 24 May 2023 17:49:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CBC310E040;
	Wed, 24 May 2023 17:49:56 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9412410E040
 for <intel-xe@lists.freedesktop.org>; Wed, 24 May 2023 17:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684950594; x=1716486594;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=atQCheoQDGZRCUvLFsV9nfP0m+mhyRPoeobObbXrLWc=;
 b=dhcAgBxhyNZmD9+lizF3KLMlvQC7Ni0+m/joMNoD19qqL2ki78tywNcv
 4dJHU8fAC5PTXC9l5DBHycC0kQMIXwSwjrMorhzrfOb7mzEUmJOdmHbci
 4GF79yRN87IEfXRECjQCg7unvOUcP+Txjiv1EdpqBzfCVgpzZU0nmV4rG
 o+A87SrAqAC9zz0CNs/p1EZMGFPbM0GAuD/jFPtmD19lovWfPgvIuFP7P
 dp33YwumVSU4AoPx0bQV0Nz0bs7CYW58v3xMlBafBlv6qcMhe4knVq9UO
 IUbRFVeWZPIF9wdgxfQJ8hb6EzRK/+/ndZtW+3gVbugPmK1qvZmJqGcSn w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="440002789"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="440002789"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 10:49:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="769552030"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="769552030"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmsmga008.fm.intel.com with ESMTP; 24 May 2023 10:49:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 10:49:47 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 24 May 2023 10:49:47 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 24 May 2023 10:49:47 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.176)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 24 May 2023 10:49:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XHI0HlNS+QHoffkHsXQLE76Sd3JKhW3CEMhsm80Hk+NSH2brHkKEeZXp15Lx/xUBo3/G54ZbbHiXdNq0MbPQIPLl6H6X/woKBMF9ev+YUL+UXXzELDlUXXneQKCF1qO7U5TiSu9FrlUEMz2eYq990/c/zTmcOeqSZWMjtf5C1Err8Wr5LfO+z3BKSMRhQ/qQL/EHXD6GRO6Bj3nlwK3EnGy3sdIpuVIb/F9SyveXzRrxUyMIu4+VAWWY4SEWCrRVW48InUiEIAiOCcbgv3lsOzf9dj/MzjYTHISCNnCGbbo6Cn1QJgEWe1x4hh68SynPeGZatXUqIJGqXZjx8g+sgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DsKDWegv3TPVZPfabM6GR/3r/wdZYk4j2x1NSWqrUtg=;
 b=jCMQTUIsubGetYU+lfMydi4BmidV1EIizE8YkWIu8XYg2X6wtMjZnbRZI69QMBLtXpVzAecamPUfvOcTpOGOxkbaLI13ZOggIRNeW/+HITRhDCbkjL7s9nmaYPGDy6XYDWos43YAlpfZCfQ7VcnT7VKU3aJuzSuKd3BH48W+F9DAlpgncqIvnsaWgH+HijHXUTNgO+Cvc3h3iIJRJe4KZjPcICK5MBbkZ2KTpRz3nNngYllD+hjIXToCFT4wabRaAquF+OXgK08pwQ2iReQGIUbk+IYKM159Hu1J2CJEaOKC0CTc6GjLfHq4umhWZ0TrG96hPbw1r+XjCy1iMXMeEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN9PR11MB5337.namprd11.prod.outlook.com (2603:10b6:408:136::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 17:49:45 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6411.028; Wed, 24 May 2023
 17:49:45 +0000
Date: Wed, 24 May 2023 10:49:41 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <cuaudqi76ujyo6reb6tfpotuxo5bwxp5u2afd4f4d7qfpjbnda@kqtqdcn2jsxq>
X-Patchwork-Hint: comment
References: <CAFCwf131PfA=QoLWykFqTbfH7Bmgn+aOYSdhdEhhbYZcMjf4qw@mail.gmail.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <CAFCwf131PfA=QoLWykFqTbfH7Bmgn+aOYSdhdEhhbYZcMjf4qw@mail.gmail.com>
X-ClientProxiedBy: BYAPR05CA0094.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN9PR11MB5337:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d47bebd-179b-456b-a50f-08db5c7f4247
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: e4WthHl+mwnKctA/QinLPQnA8UZg/ix+C9CmGOROGT1kawjY1lZfg9rHJaMOyLVOpHI76Md85dX7ImlolxVPz11huRFzW57iA4fdI2p/I5UG+85ZKeP8vjstB6xsD6Wszi9i3shjWzzKy6zM7Z4MrrL/VjdGaxHq8Pcx+X/fTIDTKxkylZgkjK2m0LFXCMzGp5Wf6sl8xOV+VHoaEHU2xFwMUNWJHc1MyTAadB2GBM9pdob0Aw57lTFJtUtp7BJOqnMLJCeo8MlY+1D36wYbv2UinJgzl6uXkTjovlx+6ZEqY1W2VPC/g4uy9mBXTolIBbeMavfLU6akmkegz308H5VcgRsWXXCPV9pVzhCK80V4QY3bwAaZzG0zjQkG/4owSJbpBiYZ7e4xGP7nmvYBCaA0Jie24fUKARmglIWNK7f+q8njJfKnPKufA26GON0rZNZpay8SMEvTWfcy/xl3OKwIs62ByzEr69hFTwCDJfinOw/Q7ToBf0w8oDs23oGJnyuqlDoNj1gIgY9auVbjFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(376002)(346002)(366004)(396003)(39860400002)(136003)(451199021)(38100700002)(6512007)(186003)(6506007)(9686003)(82960400001)(2906002)(83380400001)(41300700001)(6916009)(6486002)(316002)(6666004)(54906003)(966005)(33716001)(478600001)(66556008)(66946007)(66476007)(4326008)(86362001)(66899021)(8936002)(5660300002)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9CpVGUwz9rgkwRD5hSANJZJH8ZK8EKbEPuhnkaQsB3aEiFiNpm3p+ZyW8Wl3?=
 =?us-ascii?Q?fTuGSdpfCW4JH8j5nizJRO8tNiEITdy7rCEdWWu/VEdckzz1qYcGCP/zECl/?=
 =?us-ascii?Q?kcVSk8MKL49YR1owJ4ZBUDPlVVk0JJnJ0KDlY00qMZrGeZzMfOVpfHfsnGoV?=
 =?us-ascii?Q?uFwPM6o0wZS7y4iBD5oomZvPb3ok+Ysskvq+lxriZopC696Bf6gPfLYo6sJY?=
 =?us-ascii?Q?xJSsSfCexOIglU6FK9Ll3r/xswRQNGpswrkRJsd0IxgaHRf95ic3mUandPy/?=
 =?us-ascii?Q?q+G9+D9cAHpXou6l53vegdIxH7B5kFIDP0q+0Oei07+mawki9AG/S/iekA95?=
 =?us-ascii?Q?xZtZts6r5sjMKhu7T6VbKWeka54g/mcyjRfZgSAKg3qXMYO+7yecbuUSV8Q8?=
 =?us-ascii?Q?63vL2c3zx52znojvHtd7V278+Gub1Abjd1FtNKPQF2X83oWrPghnRDs3ddy2?=
 =?us-ascii?Q?LMIDUPg4WJuBjMZuZSSd0Cv94aO6e08iwyi1dGU7MABmRyxp3dUECMrY7n1g?=
 =?us-ascii?Q?p/RBIFqeqdk4XfLA0fPr6BB6Nqa9hWAFD6xWGhOseskwbsqrto/jbxePNg2I?=
 =?us-ascii?Q?pb/NXOYXQuLymTpoRJcmx0T+TnsZjiLvhGLFhGggOyJ/LsdmbJBRnDJdZTVP?=
 =?us-ascii?Q?vnp0qi27TxZUYN2CtTtlTU1HYPmwHB8Rrsi7Hyh9iScYO/j5xLV+a//lWBxQ?=
 =?us-ascii?Q?73geuq45IOI15/9AFlnNfVcuwBolAoM3aoDbcW07blgAmNB1mRKxkbpfFNdC?=
 =?us-ascii?Q?mRgKc3XW09V+B76aj2uYq+qoeZo1FYBD4U+mhd7c2OpvSoJFi9q2LsSr4BUA?=
 =?us-ascii?Q?421fz87ZvbmjTrXuGZpYhmt2xIQFA8AAKQWWNnJAJWUeawKxzqeXwbVkG6LT?=
 =?us-ascii?Q?I9FmwQnktbtUzcCG2LNC0ybgbCmvMiIGdyzjbroHJLcz2PciPBuK7bgphsNq?=
 =?us-ascii?Q?RwqUSqWQWmUcTjhwNEYkgse7WiTU0ywsfbhw/CA8C5oyPR7MWhcnBxoHxzhG?=
 =?us-ascii?Q?sLS8ZTI5WrlPUeixwfKConC4SIZ8B3js+f8GuFmqpLoe5ZvBPzawb8hBdItn?=
 =?us-ascii?Q?3aUuB0fJVO2Af77zlpxIQbWVIsCNCD9s+b6o7VzoT3lIc5o19yqe5OBLyEmh?=
 =?us-ascii?Q?cj/tgXCc0R25MHkhdduhH6PWO2SOgl+FqCAadDzOTJcHnqjqc4lrMtkkW4E8?=
 =?us-ascii?Q?sUWn8HUYS9y4VfnPfKJekg1QNcp2mSwBP2CCRsQNCBzhBfXQn4uKTO5VRkoY?=
 =?us-ascii?Q?40In6vdImukTT4I/h3aMgNu6j5N7Ag8cbdtmYlncgq8Iuz8jSyDlagic5wuD?=
 =?us-ascii?Q?3qGEHOACO7oDKpbg/rqctKsGWq6LiCd8NFtMHTMB4BjssLBT9dO/M+JwSvjm?=
 =?us-ascii?Q?rh2JTcWbVNbwqrV6rECdvknR3jRzGJF+8lYo/kh7uOWZTh4nQNwuWAzJ545b?=
 =?us-ascii?Q?1STp213kYtOkJpLFVoW4EHx/rOfG585+fyHRrQHn9+sLkPW4DH46RdcQU9nt?=
 =?us-ascii?Q?QNUB00BoLRW4kFuxQ/JM5EEtduEqg9qHWY+sBNgkLGsScsNtg+tyOOjvqCYe?=
 =?us-ascii?Q?pqq+pL+MJe+IU7gftenXSSkzj2OEqzukXLE76sh8oSImn3jWrrBNJIcV23bE?=
 =?us-ascii?Q?OoR7ojiIO+5WbkDuC0xdQLJh1iIDJlbpGOdGg1niUjKKDDWzhBRMx8lBiNQF?=
 =?us-ascii?Q?M973xQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d47bebd-179b-456b-a50f-08db5c7f4247
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 17:49:44.8966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v2t0j8IKDKMfokvKAxyHXjnyhO+ZkGc16D4A0sABhI0nt9TlE0ppp/hug+owEkIIqEbv6trO6aB3H+h5sA93FgqJbTEOlGzf5NxTkkQ635Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5337
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] Code review for Xe driver - First batch of comments
 (24/5)
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
Cc: intel-xe@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, May 24, 2023 at 05:53:36PM +0300, Oded Gabbay wrote:
>Hi,
>I finally got to start the code review of the Xe driver and I want to
>send the first batch of CR comments, but before I paste them here, I'd
>like to do some alignment.
>
>First, I'm reviewing the code in gitlab, and I tagged the HEAD of the
>branch I reviewed so when you go over the comments, please do it vs.
>that tag. The tag name is xe-rev1-2023-05-02.
>
>Secondly, I'm putting all the comments in a text file (cr.txt) I added
>to my review branch (xe-rev1) on gitlab. What I'll do is every
>Thursday, I'll copy the new comments I've added and start a new mail
>thread here and then we can discuss it here. I'm sending the first
>batch today as tomorrow is a holiday here.
>
>Third, when you are doing fixes according to the code review, please
>take the above tag as the base. Don't fix it in your latest branch
>(drm-xe-next). Before doing rev2 we will probably rebase the commits
>on some more updated upstream HEAD, but I don't want to see any new
>code (except for a select few commits that got my approval).
>Otherwise, I will lose my hands and feet.

not sure about the process here... there are things that already changed
in drm-xe-next, it got even a new base. The current process for fixing
things in an old commits is to merge a patch done by
`git commit --fixup` which is appropriately squashed on next cleanup
rebase

$ git range-diff $(git log -n1 --merges --format=%H xe-rev1-2023-05-02)..xe-rev1-2023-05-02 \
		 $(git log -n1 --merges --format=%H xe/drm-xe-next)..xe/drm-xe-next

this shows things that changed on the "xe commit range" due to the
rebase and additional cleanups that happened.


>
>That's it for alignment. Here is the first batch of comments, grouped
>by filename:
>
>General:
>- Multiple checkpatch issues for many files. Please make sure no
>warnings/errors appear.

some are really impossible to deal with. Yes, there are some that slip,
but they should be analyzed on a case by case.

>
>- Multiple BUG_ON (over 200), and I believe 99% of them have no
>justification to do it.
>  It's not justified to crash the host if you got a bad pointer from
>the calling function, or
>  if some other parameter is not between the valid values. Just do
>drm_* and return -EINVAL.
>
>- Same thing for WARN_ON. I would *strongly* request that you convert
>many of them to drm_* and
>  just return error because in the data center, WARN_ON is often
>defined to behave the same as BUG_ON.
>
>xe_macros.h:
>- XE_IOCTL_ERR is defined to call drm_info. This is not allowed as you
>enable a user to spam the
>  kernel log. Please change that macro to use drm_dbg.
>
>- Also, please remove the FILE+LINE print. The drm_dbg macro will
>print the function and that tends
>  to be enough. If you want to print FILE+LINE, use ftrace.
>
>xe_drv.h:
>- DRIVER_TIMESTAMP never used
>- DRIVER_DATE looks a bit old...

probably carryover from i915? Historically they were updated by
maintainers. Should probably be removed altogether.

>
>xe_module.c:
>- Do we still need to keep the enable_guc param ? Isn't the exec list
>path broken ?

in the last (of multiple) discussions about this, the outcome was to
remove the fallback to execlist when GuC is not found. However it was
decided not to remove it completely as it helps to layer the driver
appropriately for future backend

maybe time to revisit that and simply remove the enable_guc together
with the execlist code.


>xe_drm.h:
>- Use short format in license, no need to copy entire license text.
>
>- Engine ioctls - why is it called an engine ? You are not creating an
>engine, you are creating
>                  an LRC which is assigned to some engine class. Isn't
>a context a more
>                  appropriate name ? (I don't refer to the
>engine_class struct which is fine)

This comes from the vulkan world. You are creating an engine containing
an LRC object and you can schedule it on an *hw* engine. From the API
point of view for vulkan this all makes sense. From an Intel GPU pov,
particularly looking at the bspec, it's very confusing.

I raised this some time ago at
https://gitlab.freedesktop.org/drm/xe/kernel/-/merge_requests/206#note_1632304

(...)

>xe_mmio.h:
>- xe_mmio_wait32 reg & val arguments are not in the same order as
>intel_wait_for_register in i915.
>  We are setting ourselves up to fail when copying stuff from i915.
>(comment from Jani)

there were big refactors in this area already, not only related to the
order of the fields, but it covers that too

Lucas De Marchi

>
>xe_bo.h:
>- PPAT_CACHED_PDE is defined as 0. Is this correct or it should be BIT_ULL(0) ?
>  If it is 0, the code in gen8_pde_encode is confusing.
>
>xe_vm.c:
>- Line 3301: remove extra ;
>
>- xe_vm_lookup() - the locking pattern here looks wrong. Usually it should be:
>  1. lock
>  2. load/find object
>  3. if found -> get (increase refcnt of object)
>  4. unlock
>  When you do the get after the unlock, you are open to a race where
>that object was already
>  deleted by another thread and therefore, you are holding a garbage pointer
>
>- xe_vm_destroy_ioctl() - I think this is not protected against
>concurrency. Two threads that
>will call it to destroy the same vm object might result in a race.
>assuming we have thread A & B, both threads can reach up to the call to
>xe_vm_close_and_put (line 1935) having a valid vm pointer. Then, let's
>say Thread A
>executes that function, which will make that vm object invalid. Then
>Thread B will try
>to execute that function and that will cause a crash.
>
>- Line 1124: I can understand you are exiting D3 state, but WHY are
>you doing this here ?
>
>That's it for this week.
>Thanks,
>Oded
