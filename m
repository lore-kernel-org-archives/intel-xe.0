Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EE9C5478C
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 17:05:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C8F10E952;
	Tue, 27 Feb 2024 17:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nvyYV7Ne";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B82E10E959
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 17:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709053512; x=1740589512;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wXK2objN4WJE9qgooV9MxofCspRjwE6VAqHgY0qQQGM=;
 b=nvyYV7NeYmR1jzXjRMFtz5g7KnfKNXUdMjsZJSLVYKmgzWsDFNjdpILY
 fh7xxX/1Tgy8DBgQIXUAZVsaEpg8l0lUPnYeIm/Yyq5qJq2BVEjS2UPAP
 vY0mzMPCfMmf0WZjwSayBWG1RWwDaHpJn2BjxWsk7z8lePevLumVKGKDk
 mtW5u029595oze5ms3tFa1mmScpVX2YKX+l3EywRqRsTTA7qiagpGuycx
 yD3d85ETdXVto8TUWaRk1AgKydzgJJmjPpER4VjL1KnWe0F1l34sKNaF2
 0Q4Zp2YBLKEIRF6KfhtDjZvYye0f7wn7Hsh3i4jGFV90/B8Js3COCMPm8 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3568384"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; 
   d="scan'208";a="3568384"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 09:05:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="44621339"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 09:05:10 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:05:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:05:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 09:05:09 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 09:05:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PDay2S3KJm1OR2p+39OVyCoLxYEoEB/SNTgR3IV6pH0f8vlTyGHExQy40WamqB21sYzpthctCxBh2xHFptiuXrJxqK+yo0NRqiwft/FOjm+xEdWIFplxRtIr4l1jX/8c7Jp1X3Houwubm+P5qg3bSd0ctZukiYwCOvcwe8Dj0ENToXaGmO0b87pAxX4R2HKPZpWszjTd+jIt9Y+jdK7W1t5UNe09RceWMFKHbqqwk8MGlUECC6eftbbZOlljcmghOnpIi0lO/mBgitWz7PTuGLHwcgY56KMnadD2YeSHx9IO+x0uFBRvMfSyeovxDTUtJzZE91xDClLrfrxntq4rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wlFYqPJr+TnX6LJ4z93KgrQEEIl9BbJaK4oYea4a54=;
 b=RR/dP9rHFoNlz9ASnFOM2r2Gx79aDD/BSbMNWKBOuM/kXmCej5zJtdjrtTf4mwR8Cdpg+ML+HwJh1bSPV1KlMDACqcTHRtP6WuS4TPgGMrc5KFuERfjjvmF0WjnMwXkY5SRvVD+uW9Q5UgUMC/W04puQL5HPhj4aYueAnzE4d8jCFprxMXWLHsFJFZKTNz89D4kmX1XFCJG4DqyxctCZFQnDHzsGDxzdFObaXJzPVmInhKR3a/faJ49PFPXONuGgBQ2NOnrDzQeLVdKy0UrkVdx2qFDaGZcNwzHzuiiF3GKPuCUU1eNb21LYwoB3nA64M4oBfkv15UJ+tNxSslz9vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 17:05:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 17:05:07 +0000
Date: Tue, 27 Feb 2024 17:05:32 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Get page on user fence creation
Message-ID: <Zd4WXGFoUb2kdjEn@DUT025-TGLU.fm.intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
 <20240227024337.141585-4-matthew.brost@intel.com>
 <43e740230aa41475a6539e2b198e9885b34571e3.camel@linux.intel.com>
 <21393f027f1b019442800e17ca5ee1be19083e0f.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21393f027f1b019442800e17ca5ee1be19083e0f.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR04CA0033.namprd04.prod.outlook.com
 (2603:10b6:a03:40::46) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: 57cc2d04-11d9-4c95-c03f-08dc37b63f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gldiDNa0Bv3Yc3o3N/d7Yqtv0EheFtUrOp+9nU7y8Km/O6reFDjJspBob9rLz/RE87xrue7JnYZ0wRX6TOfbz+ooYjJ7dex5SnPxYKDme5Dn6f8Zls0N1jVE5pxz77iu+hMJtMzWQLe9+H+wlrzigX3ftJvfAB7UYaIJn40hgSq+l3n1BEgPWLvhPIzt3ggKIsbSVyFHORH60dlJi5C/TIst8tFvVTh9egXclNoMGLtfJPDmyZc2rVwr43NnzTpbGslSv9cPDi9ZhSDQ7mBpHEbfLG5YRnFQlT95i8VvNR8SIQvM5kvF85n+TUQeObmJEnDUNmTtfxDRQCdtBtj61RIb/COg7GmztPhH/jd8zeYEuzRBLJ/Bf1b7r3mSQdZmKrqKoz2+TdPFusxA9axdQWk3cGje0sqy0bImDy80ER28JZOCbxzZDg2lhdOaRMVS0YAxPPxsXGp8179tj8wgUHvLeclgH7qms7pbraqCqpzUxx1ompTBQ3rX9J4A7koW7zNXxJOMQKdTxehdM0uTq+aFqqoaLZTk5rM7iYro0LpohJodGDylY/5AwYzHnaMLBiktBk92ULYo7snNNxUpzP5oLLirgNq5TwBAMEs0Xh793PojyqfcO0vrFyB/xvCgsTh8rjpfZBucqLk23gzfvQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?CaRxRjLomOHVJHav0CdwRs0SDXSPiCmK5TBhTJhsEJhwrtFVAB0i9M66kJ?=
 =?iso-8859-1?Q?Yre4PExz+BDPhR3DxPU+2EDSFJJF4UXVWQhZGMhfHl1kuWWB1lhP3Ew4bY?=
 =?iso-8859-1?Q?/pZQghkgaE6ZPK+HTOEKgexQSmJASuq5tCCMrdH4tM+j4hja+2of9J5lPt?=
 =?iso-8859-1?Q?uNS2bYwfi3OregIxmTzq2/eEHN+yfOlTk4TBzOe2OvO/IB16zJ8PiaoQas?=
 =?iso-8859-1?Q?lGqidAbvvb5q28jWqkqXsSU8bAR/vdke3Jc/OrgAfg2MbiKaiO9V/wGwys?=
 =?iso-8859-1?Q?UrGIUJvhdVT0uUylK4cX0enWUqmH1ltF5BD8bnj1s2bQbwnLKzS6uz4Jse?=
 =?iso-8859-1?Q?R1l1s0xRHG78Bgv20bgYZdXjaIMlUeQPzND5ka1aMjYtOZZIJvzkEL9Dzf?=
 =?iso-8859-1?Q?UwoqMH/AgiLeoS4FvHpCJt14bJ7upHJv+ZKrEYUdPRvSUyY3+Db5wXV0iN?=
 =?iso-8859-1?Q?NRKtt7WRZW3Ke73vDaAO9c0ubxNDdVMt6rBEK3JwN4zyyWBJyDHSNGT5gR?=
 =?iso-8859-1?Q?y8Pig3a6KqdP7C8aNwpAMwk37Nqzf8Untf3S2fckxV5SUwG4upEvzgvePc?=
 =?iso-8859-1?Q?+bL2Rf88QHXl9R35IodjOhwt73uNsHpbPy6ZLwfKCi3Vf/wKEKWejdh8vZ?=
 =?iso-8859-1?Q?AtgZmcs7ooRY1WNFxrSHgkvSFLqHKFQhOtWgypK1zaI5H2QjEbmIhEOKqo?=
 =?iso-8859-1?Q?quTRaN8slgtgxosp7+qVWqqWx26hZldOJdy+q3WsRYmiZmdh8FIN1otTW5?=
 =?iso-8859-1?Q?x9o9aqZKM+yA59x5fF6pmFw7dKmOPDGJEATF6zLGQkarXlrGdQBdorxAWP?=
 =?iso-8859-1?Q?FRa5fJPKnMoZwjwb8KD62I9TNU43nKYX2hV3B/c/PNdKrazrA4Fix7mG+N?=
 =?iso-8859-1?Q?zhMQAAIRjE8wxnxotVXYgQZvdFFwPbezg3pWqUV4/Wv20klSoiUjBucCAJ?=
 =?iso-8859-1?Q?t38s1y1YgeRa48u/rDeU1QhB1sujfP5mmQ1E2wJKkwmrGMZtiGVo4b+Ahr?=
 =?iso-8859-1?Q?WlZJqzMwI6Iw3fRZOWgbpbSLcxv5ctpEQIvxp6/CiBmqtgym87WqdbURqm?=
 =?iso-8859-1?Q?pLgSc6eOvSibtyKo1tY8hn43lZLFf873SL3DbB99HV4oULwHjlOGksiR5c?=
 =?iso-8859-1?Q?BmC9v7HPpdrKcnACac02KUaHwI9bttzrH9rH12KQXfretzWLSQKaQIRB0n?=
 =?iso-8859-1?Q?SYjnmm4FBhQ6YyL1wxaaCBYg27Go1wg0RIQRiEtZQyZf9VzjrB51aQmQet?=
 =?iso-8859-1?Q?hg3MVxq3gYakxahpbBfkXgyygrnBpGlbjSh3KEk8fjxTJ0N1ACTmZa7GHb?=
 =?iso-8859-1?Q?t6yzypYbsYioaPMjnCil288QpSbmAKjA/rcqfBay/SNXb+NbbFL7DmP3Dq?=
 =?iso-8859-1?Q?PGL73xDdpJmwuQsXviiNRX+ivPh2qL1iDMw1RJqS6vOPOkNt4jPFaY4sDP?=
 =?iso-8859-1?Q?DLX9t/nJIKCdgNaEbwN3BYPj7Ffvb/MwYQWZydSjceB+eXJo/T4pk+h8aS?=
 =?iso-8859-1?Q?4IBxnbmP2QUIbTSlad0TsWlxGmuYVSozhQ7or+Li1rhI0KVw9VOdAr37Be?=
 =?iso-8859-1?Q?lUZ3/qk3WDtE0PCXqGsShspOsfQhU54xEl5y9ea6WZ8VdCa6rlaJ0LdgfA?=
 =?iso-8859-1?Q?Y+ot5rICyR/h0InwXO681p2qVpHs6qmv1HpIVDmA6IIJImqTB9RXh7fQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 57cc2d04-11d9-4c95-c03f-08dc37b63f85
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:05:07.0214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wTkFP37fibvc0Z9ghLK/eCLVda0FQhtGKhznmPUmVB4XPnXhRG6zlUAwv9q0o7roDUGjxO2XSMjNkCMaECxOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7731
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

On Tue, Feb 27, 2024 at 01:38:27PM +0100, Thomas Hellström wrote:
> On Tue, 2024-02-27 at 12:01 +0100, Thomas Hellström wrote:
> > On Mon, 2024-02-26 at 18:43 -0800, Matthew Brost wrote:
> > > Attempt to get page on user fence creation and kmap_local_page on
> > > signaling. Should reduce latency and can ensure 64 bit atomicity
> > > compared to copy_to_user.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_sync.c | 45 ++++++++++++++++++++++++++++----
> > > --
> > > --
> > >  1 file changed, 36 insertions(+), 9 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > b/drivers/gpu/drm/xe/xe_sync.c
> > > index 022e158d28d9..2f3e062c0101 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -6,6 +6,7 @@
> > >  #include "xe_sync.h"
> > >  
> > >  #include <linux/dma-fence-array.h>
> > > +#include <linux/highmem.h>
> > >  #include <linux/kthread.h>
> > >  #include <linux/sched/mm.h>
> > >  #include <linux/uaccess.h>
> > > @@ -25,6 +26,7 @@ struct user_fence {
> > >  	struct dma_fence_cb cb;
> > >  	struct work_struct worker;
> > >  	struct mm_struct *mm;
> > > +	struct page *page;
> > >  	u64 __user *addr;
> > >  	u64 value;
> > >  };
> > > @@ -34,7 +36,10 @@ static void user_fence_destroy(struct kref
> > > *kref)
> > >  	struct user_fence *ufence = container_of(kref, struct
> > > user_fence,
> > >  						 refcount);
> > >  
> > > -	mmdrop(ufence->mm);
> > > +	if (ufence->page)
> > > +		put_page(ufence->page);
> > > +	else if (ufence->mm)
> > > +		mmdrop(ufence->mm);
> > >  	kfree(ufence);
> > >  }
> > >  
> > > @@ -53,6 +58,7 @@ static struct user_fence
> > > *user_fence_create(struct
> > > xe_device *xe, u64 addr,
> > >  {
> > >  	struct user_fence *ufence;
> > >  	u64 __user *ptr = u64_to_user_ptr(addr);
> > > +	int ret;
> > >  
> > >  	if (!access_ok(ptr, sizeof(ptr)))
> > >  		return ERR_PTR(-EFAULT);
> > > @@ -66,7 +72,11 @@ static struct user_fence
> > > *user_fence_create(struct
> > > xe_device *xe, u64 addr,
> > >  	ufence->addr = ptr;
> > >  	ufence->value = value;
> > >  	ufence->mm = current->mm;
> > > -	mmgrab(ufence->mm);
> > > +	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &ufence-
> > > > page);
> > 
> > Hmm. This is mid-term pinning a page-cache page. We shouldn't really
> > do
> > that since it interferes with huge pages and numa migration.
> > 
> > What about just prefaulting and dropping the refcount and then we
> > do this again when signalling?
> > 
> > > +	if (ret != 1) {
> > > +		mmgrab(ufence->mm);
> > > +		ufence->page = NULL;
> > > +	}
> > >  
> > >  	return ufence;
> > >  }
> > > @@ -74,13 +84,30 @@ static struct user_fence
> > > *user_fence_create(struct xe_device *xe, u64 addr,
> > >  static void user_fence_worker(struct work_struct *w)
> > >  {
> > >  	struct user_fence *ufence = container_of(w, struct
> > > user_fence, worker);
> > > -
> > > -	if (mmget_not_zero(ufence->mm)) {
> > > -		kthread_use_mm(ufence->mm);
> > > -		if (copy_to_user(ufence->addr, &ufence->value,
> > > sizeof(ufence->value)))
> > > -			XE_WARN_ON("Copy to user failed");
> > > -		kthread_unuse_mm(ufence->mm);
> > > -		mmput(ufence->mm);
> > > +	struct mm_struct *mm = ufence->mm;
> > > +
> > > +	if (mmget_not_zero(mm)) {
> > > +		if (ufence->page) {
> > > +			u64 *ptr;
> > > +			void *va;
> > 
> > 
> > > +
> > > +			va = kmap_local_page(ufence->page);
> > > +			ptr = va + offset_in_page(ufence->addr);
> > > +			xchg(ptr, ufence->value);
> > 
> > Does this compile on 32-bit?
> 
> It doesn't. Would probably need a try_cmpxchg64() loop.
> 

Thanks, will fix.

Matt

> /Thomas
> 
