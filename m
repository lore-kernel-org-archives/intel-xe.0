Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FAA0E65D14
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 02:01:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D182910E0F6;
	Fri, 22 Nov 2024 02:01:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gHL3w4Ai";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F75610E0F6
 for <Intel-Xe@lists.freedesktop.org>; Fri, 22 Nov 2024 02:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732240912; x=1763776912;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2DKHmNCU9jzqz8yVCGpUSbszWBk0BYEiauTdlrqcgLM=;
 b=gHL3w4AiOx5Mtba8mmzqOnQkeTccHt6r62+oXeTaAvbw3/MJy1J11xFn
 AsB4bkkims5S78itAr7Xu1eJ++72/j38Pcm1RBAvqBVjkQNO0d7rsXlTP
 jowH9YIFjNfV8qg2rOW+vHI8VSKfMpmcwyQmtLXykN0yLKv/DdiZTUY9k
 xNd0YZPTyiFfNhjZzDwRo1AjTrbce54xNagvPfHMv44LTuW9kjkUsmjC+
 nbJ9vwiU5ZXvneB3ZTTyfq12ZNiGQUR5geMRChBzLQfi7TKhwDP7qJfjc
 CJfUbQnIWnNqrqkeknQ96PUMJu7VNVZkpmkwmLaxRHExqh/EFUDih+BNN w==;
X-CSE-ConnectionGUID: aAraBidWRqucDZsit9oLpQ==
X-CSE-MsgGUID: cSs0mkx6TMC2ZOc7PwZ2NQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35243576"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="35243576"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 18:01:51 -0800
X-CSE-ConnectionGUID: 7Qv0WeKuQ5St/DF6ldjpuA==
X-CSE-MsgGUID: CLrW4sk9R4iIgXg7ermN4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; d="scan'208";a="121305842"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Nov 2024 18:01:52 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 21 Nov 2024 18:01:49 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 21 Nov 2024 18:01:49 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 21 Nov 2024 18:01:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I2j74Z1vGUKFqStlDT/Buijxc86/HHs2aIhIykdFUEIgn3HuozI5C4ZWacguYjlRfRGDCNNSKLTZ5Tl43xZT9+5hhwCYHhskhU+2oT5DrAAYHErBH8aKdu6PKqKfx7iDPMAHkQ3TifBF8c1MnfKQUGIvZDuUV8G+FGUp6tv+L5oIPI8K/pgc9In9zHvvCFOXn4Pfoi6fN6frxxtohuc5OVbYRY29g07ab1zsAw7FOiis+AqHWr6c/UyKclU0Kg0IM6m++psUMYEI/bkAX5THffhYGDIsPSgQKrPcBuVsH4Tjmvu2zZ8NdiuRx3t8EIuXJ61KJkLumyw0MRijtSyflg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3DoBI74ij6PSUWfhMAKR7tAe0hO6QYIbdLKbqSAfvBU=;
 b=hTv1GpUorMVnS9aPS5H85UQXzpsAyT1OV/35JD0+m9dPMkVG03q/mubCDVchgdD1aLnEUCxfiLpgcjCnVIUsUnVy4ycs5Q/IzLp5AzjJv6M40OqNsj6PZUGuU5zWSoS043G5p1wjaMGr6JU40MsBzb/RHknYn61mF97/EbPGv4bgZn3m9ocAsfRSWh4G/V36cWAx987OpKVOBVVZXPOrSG7va67CnmLZ2BmZ5CuZGEKhpEAt72Gd4SYoCrQsv+8OMUyiC2lhf3vfeXLsyxCrGDjQZ76cAA7dqZWGoItlwU1qIO1bfzt6NcTO4CVlOvPBMdpIEXUHiTm/XKkGxdPNRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SN7PR11MB7706.namprd11.prod.outlook.com (2603:10b6:806:32c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 02:01:20 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 02:01:20 +0000
Date: Thu, 21 Nov 2024 18:01:56 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/2] drm/xe: Add mutex locking to devcoredump
Message-ID: <Zz/mFHF4wYhFm16a@lstrano-desk.jf.intel.com>
References: <20241121225542.1336796-1-John.C.Harrison@Intel.com>
 <20241121225542.1336796-3-John.C.Harrison@Intel.com>
 <Zz/F29WgIzFmAH3V@lstrano-desk.jf.intel.com>
 <132d8232-e8a2-4c68-b426-ef5363e90eb1@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <132d8232-e8a2-4c68-b426-ef5363e90eb1@intel.com>
X-ClientProxiedBy: MW4P220CA0024.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::29) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SN7PR11MB7706:EE_
X-MS-Office365-Filtering-Correlation-Id: 406ffbd2-f7c6-402f-e384-08dd0a998eed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?i9JpcwjqYkXxP5AMJe2zKUVyuenHEEI+SsjrCo/U2J6lUF5e7W85hm/6n7xf?=
 =?us-ascii?Q?M+HfWh/apvA879kI4korhgzWayscJtYYnEYWAY8W7qrw10ElGPw8fWuzTf/l?=
 =?us-ascii?Q?HCZclnGtQEN2Ca1yIzE0X7xd3zQimf9Iun7ZdGvviW+uVzgXnrfJwSFamL0K?=
 =?us-ascii?Q?qPo68XUFEnU4lzsYmkaoyoMBYn2/n7JahWTMING2LQarRrEoURo0jCvwcPuR?=
 =?us-ascii?Q?8OtTBOR9yau7XVG0s0C5kMNI4e7buvNjAGxrDJwMWYFaTZ6fiEWgrP+664Ji?=
 =?us-ascii?Q?DXzYPC/Wa2T8x9m4B0i6UJIOMDfZG2HRzNf8byIJa4m6+szTue8ebkQNzBVE?=
 =?us-ascii?Q?//9Ic1V+82Lg3YUDJObu1rphNGzoF3kqvyASxhuIYbiPWdh2J6YvGAGRVnT4?=
 =?us-ascii?Q?FxUeZRIYZO4IeGfMYFxXFSRNP/YXtQUbkcmRb5W/hiRCBy1DG3J+7q4PqZ/p?=
 =?us-ascii?Q?x+p/x3svsvmDvybQJpi4vdfV8BqxD/IuYynjpygkxmLi/2s0YzebhVOeiJoB?=
 =?us-ascii?Q?X3EBBDGQq/aHF/D5i3cVPUbdRkqNJ/zjn7gTOASmJTXYxTNUo+m3a6RbL/ZV?=
 =?us-ascii?Q?EU+IeO4qsKMTjte7Sio+KhRTPnGD/Rmu9hsGH80RrU3jf0BSd0JORjt2fSLg?=
 =?us-ascii?Q?O8gQD4TYJh6ZKhBLq1ryuxhrK+bc+IJm4s1wev533mZmuP/7Px+3ThZNg7fQ?=
 =?us-ascii?Q?TzUJF3w2xVLtVb7qGMwZsEyPZlJxyZ2/rJBiuoBKENtgJpu5ScUKEYb4SEPo?=
 =?us-ascii?Q?w/mg7bpmAKQAjmiy6Azw2SeASNBj+p8Dc2qLCvMccHA216gTc7fEIjV2QWIh?=
 =?us-ascii?Q?aBL63e4wRxXuUN0F3zuBHtpjMRTz/Oe4uxzG37ll81gT6FugDJKZzU1rEK+o?=
 =?us-ascii?Q?vXhyPE9oHQz/A2toA+Rzit4awVf6herlOH7Yu5hpj9Xzlp07RBdRBuVB+lkz?=
 =?us-ascii?Q?ZzoOkTbLL1BaG18pqc2clPrEY3aE8jvYqrtWbWG2dxrN7futJiVRwxjl+xSk?=
 =?us-ascii?Q?lnZqIQkYYLK3VzP2Zvh7wH/8BBWpAq7rlk7MoIjMX8teLJdLey5qFywFb0Mv?=
 =?us-ascii?Q?8FBYDKuDaKQLNQ3LF6EPOyDcK//dbmthKSgJ14X01Q33AEuGMfZb7S9hfpiu?=
 =?us-ascii?Q?U8cFOkFkSb5DND8buCOimHoX26xEv9nWZI7QvJwJQblEQK2OqSjiAkCGxp3p?=
 =?us-ascii?Q?b6Lq47uaPMrnp5e7fzK7ry95qJ6DgV0Nua3eCXW2+HD9S6Kvucjbniv8RV7x?=
 =?us-ascii?Q?ClJgGU3mD8igIIrWNJJpxrG0vlO+XbAAxWLnnZs5LaGFizUNSg7C4+9vZUxV?=
 =?us-ascii?Q?nTYTRdkISEvDPtMkdypFnTjN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TEjaiaXjgHpfJCiHTbuH4LWpwxTaU7BplcB574C4IIcqKK77xAz1wgN6eXKa?=
 =?us-ascii?Q?IhTKMOFA0m0BKHHGPCYiQctJz2jiuksyKuBX7zlQlj27osYVB+jJ8+m84bp6?=
 =?us-ascii?Q?U2RIBJ6ZkhEvSasSZJ7H32sWuM45Cpz9kAY+3ECWTnpz2/zhF1OSjnYqWaL/?=
 =?us-ascii?Q?1k2OBhNN/Z0bUCZynuj9C9E1angBvlWfVCLaN2fa3bZ9b8Dv/aN102qQluDy?=
 =?us-ascii?Q?k9wMe+kDxJek+8Ui6iGWmzw6xaVfRT7Jga8TRXvniveFdzgXANzg6+OSBoQz?=
 =?us-ascii?Q?PJ9mU3FFgxPonauDTV3ZS0NeHIXFdoJwdUA40zFxbkVCCFwATYjY9KF6S4kX?=
 =?us-ascii?Q?0vYHNoGpSZD0gVurovFUduAFcrwuccaYWKYBHqiyKhky8abSZ53d70+r9an+?=
 =?us-ascii?Q?U6srsB1KO4uIYzXqyBnCxSmq0JLMiW+s9pCshJqHLb+Qxf++MT6ojl+mmv7b?=
 =?us-ascii?Q?AUpGu9stamCYyqUgzjXc3YTwX4IK8LaOVUglSQteMUOF2RL8OAcX5ODP5SSF?=
 =?us-ascii?Q?R+lBtZt2r0bRJJNEDOY5PrYgbzkv0vdZr/8UQhfX1mRr0twD3uDcP9cKRGD6?=
 =?us-ascii?Q?OY2UQP3gZBfGLbPfKEJlQnY9zfwJ5eHC9B/axa2CoO5mNm3MsOpCn4Yhroqw?=
 =?us-ascii?Q?hAeCAAbzZLZWbX9DAvTyNYRbQ1IlS3ZqeDzNK3xkQEJvXSKGvWRoRhVLdvof?=
 =?us-ascii?Q?cl9/QjgiipB0j6EaumhSAMnAn7yoGbQuhK8FVt8FX2tt3akl3Ki94SkUsCAB?=
 =?us-ascii?Q?8QLG6aOLpg9WBCEeDzWoZtjAkjRsk5Xkzb9h2/4ZD8hQKIap8FZre6AKOZxK?=
 =?us-ascii?Q?P7qsj6U15woMfpU+hvJLjYBDWXFR2sExNRH5gMOuZ9QeZRCc3syhj+W/F9mJ?=
 =?us-ascii?Q?nXO5B1xfpzZpZWMnRMjsOdFQ0zqcptCTxpqIkdbojZOJ4WyB/mSrkDD8ZYHM?=
 =?us-ascii?Q?pyDDhddcXmcKTE/lgGEC/6X6WtEhyYyNNs+5WiMLAcuIj/bl1JVKqEElosyy?=
 =?us-ascii?Q?kiBAwjlbY4fuxUM2O5A9mC8Q45Hzmw2ff067IWjLJ4Ulgl8K0W4tHkFtZHg4?=
 =?us-ascii?Q?Z9qDT1ZgfMYCFP868sqMHzpT8KUBGcwZxJ1FgNFpOG+Wjlzie3e2r/ytqpgC?=
 =?us-ascii?Q?ilYUuxsXsJihU7L2PczQEcCDfqM07pVJF3B7w8/jI05lGlxiogIhDmYgLYUd?=
 =?us-ascii?Q?yIfFWzZNgiGJzFbKoVvTEZABKcCLTpS31FBwYauhLIMKjWMF3mH8eYzxBQcM?=
 =?us-ascii?Q?oGBYnDv6GMmc4ydPkQZ5SXVuxofWibjAYyF6I7VJNuiBhauehYm4qNkYXviY?=
 =?us-ascii?Q?mSPffErwTBe2JjAyYWsjXtLpKe5DYz573APBPE2e4b8rPQ0URe+YmdQmGVKm?=
 =?us-ascii?Q?mTmrjerTQii/OC2ID10vVg88jFPEpiessNiIkV0IODHsMblEoPgiXhJO7dfA?=
 =?us-ascii?Q?k1W7QgVFC7bqh3fuDZFYYImwWRLI56kAh+aWqo8bTPgdlK1PhsZ3lXi3Aw0h?=
 =?us-ascii?Q?LCdnANMAFWtZBj6mXRhtWIfHEKyUg2tZNg9gJVU9xTEyodU7Ul9N5NIePmaY?=
 =?us-ascii?Q?QxQseR3NiIu+nZg3kcLPUdzfIbao8pOBVVlk63QjY+0W7lHoJXaBb35cngo1?=
 =?us-ascii?Q?LQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 406ffbd2-f7c6-402f-e384-08dd0a998eed
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 02:01:20.2653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XT8LCv/0eFG/zK+g+n1STEyKA9CzKK/uJ15LpWQrGPjMWNoEkSCcOQDdL9Uexeb9J1SB7XopMOMDXSg6mPFz+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7706
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

On Thu, Nov 21, 2024 at 05:25:10PM -0800, John Harrison wrote:
> On 11/21/2024 15:44, Matthew Brost wrote:
> > On Thu, Nov 21, 2024 at 02:55:42PM -0800, John.C.Harrison@Intel.com wrote:
> > > From: John Harrison <John.C.Harrison@Intel.com>
> > > 
> > > There are now multiple places that can trigger a coredump. Some of
> > > which can happen in parallel. There is already a check against
> > > capturing multiple dumps sequentially, but without locking it doesn't
> > > guarantee to work against concurrent dumps. And if two dumps do happen
> > > in parallel, they can end up doing Bad Things such as one call stack
> > > freeing the data the other call stack is still processing. Which leads
> > > to a crashed kernel.
> > > 
> > > Further, it is possible for the DRM timeout to expire and trigger a
> > > free of the capture while a user is still reading that capture out
> > > through sysfs. Again leading to dodgy pointer problems.
> > > 
> > > So, add a mutext lock around the capture, read and free functions to
> > > prevent inteference.
> > > 
> > > v2: Swap tiny scope spin_lock for larger scope mutex and fix
> > > kernel-doc comment (review feedback from Matthe Brost)
> > > 
> > > Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> > > ---
> > >   drivers/gpu/drm/xe/xe_devcoredump.c       | 26 +++++++++++++++++++++--
> > >   drivers/gpu/drm/xe/xe_devcoredump_types.h |  4 +++-
> > >   2 files changed, 27 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > index dd48745a8a46..0621754ddfd2 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> > > @@ -202,21 +202,29 @@ static ssize_t xe_devcoredump_read(char *buffer, loff_t offset,
> > >   	if (!coredump)
> > >   		return -ENODEV;
> > > +	mutex_lock(&coredump->lock);
> > > +
> > I'll just explain my reclaim comment in the prior rev here.
> > 
> > 'coredump->lock' is the path of reclaim as it can be called from the TDR
> > which signals dma-fences. This is why most of the devcoredump core uses
> > GFP_ATOMIC to capture smaller state which could lost quickly. We also
> So the reason string allocation in patch #1 should also use GFP_ATOMIC
> rather than GFP_KERNEL?
> 

Yes.

> > have worker, ss->work, which opportunisticly captures larger VM state /w
> > GFP_KERNEL. The worker is not in the path reclaim. Thus you cannot flush
> > the worker under 'coredump->lock' without getting potentail deadlocks.
> > With proper annotations lockdep complain.
> Okay, that makes sense now. Was forgetting the captures are from the TDR /
> dma-fence paths which are reclaim requirements. Doh!
> 
> > 
> > e.g.
> > 
> > We should do this on driver load:
> > 
> > fs_reclaim_acquire();
> > might_lock();
> > fs_reclaim_recalim();
> I assume this should be fs_reclaim_release()?
> 

Yes, typo. Got a little distracted typing this.

> I see three separate instances of a local primelockdep() helper function to
> do this, two which do a might_lock() and one which does an actual
> lock/unlock (plus another which does a lock_map_acquire/release, but I
> assume that is very different). Plus another instance of the construct that
> is just inline with the rest of the init function. The helper versions all
> have a check against CONFIG_LOCKDEP but the unrolled version does not. Seems
> like we should have a generically accessible helper function for this? Maybe

A helper might be a good idea.

> even as a wrapper around drmm_mutex_init itself? Although the xe_ggtt.c and
> xe_migrate.c copies are not using the drmm version of mutex init. Should
> they be?
> 

Yes, all mutexes in Xe likely should use drmm_mutex_init. A prime
reclaim version isn't bad idea either given all drivers in DRM use
dma-fences and likely have mutexes that should be primed with reclaim.

IIRC priming with reclaim was a bit of a hack actually, using
dma_fence_begin_signaling/end is really what we likely want to do but
that annotation had some odd weakness which would give false lockdep
positives. Thomas may have fixed this recently though. If you post a
common drmm function, I think the correct annotation could be sorted out
on dri-devel.

Matt


> John.
> 
> > 
> > Our upper layers should also but may have gaps. Reguardless, priming
> > lockdep is a good practice and self-documenting.
> > 
> > >   	ss = &coredump->snapshot;
> > >   	/* Ensure delayed work is captured before continuing */
> > >   	flush_work(&ss->work);
> > So this is where the mutex should be locked.
> > 
> > > -	if (!ss->read.buffer)
> > > +	if (!ss->read.buffer) {
> > > +		mutex_unlock(&coredump->lock);
> > >   		return -ENODEV;
> > > +	}
> > > -	if (offset >= ss->read.size)
> > > +	if (offset >= ss->read.size) {
> > > +		mutex_unlock(&coredump->lock);
> > >   		return 0;
> > > +	}
> > >   	byte_copied = count < ss->read.size - offset ? count :
> > >   		ss->read.size - offset;
> > >   	memcpy(buffer, ss->read.buffer + offset, byte_copied);
> > > +	mutex_unlock(&coredump->lock);
> > > +
> > >   	return byte_copied;
> > >   }
> > > @@ -228,6 +236,8 @@ static void xe_devcoredump_free(void *data)
> > >   	if (!data || !coredump_to_xe(coredump))
> > >   		return;
> > > +	mutex_lock(&coredump->lock);
> > > +
> > >   	cancel_work_sync(&coredump->snapshot.work);
> > Likewise, lock the mutex here.
> > 
> > Matt
> > 
> > >   	xe_devcoredump_snapshot_free(&coredump->snapshot);
> > > @@ -238,6 +248,8 @@ static void xe_devcoredump_free(void *data)
> > >   	coredump->captured = false;
> > >   	drm_info(&coredump_to_xe(coredump)->drm,
> > >   		 "Xe device coredump has been deleted.\n");
> > > +
> > > +	mutex_unlock(&coredump->lock);
> > >   }
> > >   static void devcoredump_snapshot(struct xe_devcoredump *coredump,
> > > @@ -312,8 +324,11 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
> > >   	struct xe_devcoredump *coredump = &xe->devcoredump;
> > >   	va_list varg;
> > > +	mutex_lock(&coredump->lock);
> > > +
> > >   	if (coredump->captured) {
> > >   		drm_dbg(&xe->drm, "Multiple hangs are occurring, but only the first snapshot was taken\n");
> > > +		mutex_unlock(&coredump->lock);
> > >   		return;
> > >   	}
> > > @@ -332,6 +347,7 @@ void xe_devcoredump(struct xe_exec_queue *q, struct xe_sched_job *job, const cha
> > >   	dev_coredumpm_timeout(xe->drm.dev, THIS_MODULE, coredump, 0, GFP_KERNEL,
> > >   			      xe_devcoredump_read, xe_devcoredump_free,
> > >   			      XE_COREDUMP_TIMEOUT_JIFFIES);
> > > +	mutex_unlock(&coredump->lock);
> > >   }
> > >   static void xe_driver_devcoredump_fini(void *arg)
> > > @@ -343,6 +359,12 @@ static void xe_driver_devcoredump_fini(void *arg)
> > >   int xe_devcoredump_init(struct xe_device *xe)
> > >   {
> > > +	int err;
> > > +
> > > +	err = drmm_mutex_init(&xe->drm, &xe->devcoredump.lock);
> > > +	if (err)
> > > +		return err;
> > > +
> > >   	return devm_add_action_or_reset(xe->drm.dev, xe_driver_devcoredump_fini, &xe->drm);
> > >   }
> > > diff --git a/drivers/gpu/drm/xe/xe_devcoredump_types.h b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > index e6234e887102..1a1d16a96b2d 100644
> > > --- a/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_devcoredump_types.h
> > > @@ -80,7 +80,9 @@ struct xe_devcoredump_snapshot {
> > >    * for reading the information.
> > >    */
> > >   struct xe_devcoredump {
> > > -	/** @captured: The snapshot of the first hang has already been taken. */
> > > +	/** @lock: protects access to entire structure */
> > > +	struct mutex lock;
> > > +	/** @captured: The snapshot of the first hang has already been taken */
> > >   	bool captured;
> > >   	/** @snapshot: Snapshot is captured at time of the first crash */
> > >   	struct xe_devcoredump_snapshot snapshot;
> > > -- 
> > > 2.47.0
> > > 
> 
