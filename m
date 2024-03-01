Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699C3C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 22:44:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2033F10ED67;
	Fri,  1 Mar 2024 22:44:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jnbC17t6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CF610ED67
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 22:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709333075; x=1740869075;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=tS7OcSE8IxFv4MxzXJWKTbk83AP6JF7XFQ8PTZMTOYM=;
 b=jnbC17t6sGRkiNT/c3A6uIRy0Q4o0ELaP+3WHFaL/5S3y7gza9JnT4yv
 K/p/0qzOi+XG83N8voKWwxxYceFWBP5cPaTBTmLVNosPCIU5Rb9e62A58
 dSBAZ77V0Yfhmk+sAcWeUA27fCO9RIB4UTMU3Pqq3IG3X3yXajZZbS/rl
 rLf8W4OCiZ7FWqa4WyvSxIAYv8F5Ju+jRGwjzWBSo68SyQ6/8pzErW2FB
 TPzZnM+JNZ0h3y3G3XYH8qbKasuoxjEUJqJmSSZQX96ezRxbnroyShR5A
 LOg0kAhK/sXSXULkkC9nNNcE2UZf0rxMry32oaAjIuRSUPu8y7mBhK3ua w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="3756490"
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="3756490"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Mar 2024 14:44:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,197,1705392000"; 
   d="scan'208";a="8764605"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 Mar 2024 14:44:34 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 14:44:33 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 1 Mar 2024 14:44:32 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 1 Mar 2024 14:44:32 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 1 Mar 2024 14:44:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RRZA0C9GpFRDQS3nvaTkwFTaxaGAiyjtncxrJq2mWrV1wgBA+/0KycVhRRNtCwvKxqpgQxvvE3kY0PG4lNGoMfWo4hEt4KR5pIP6z6mIC8GfWrxE32w1HUU3Y+JSujo5CdCzytRWjMZYPga6szYaaTS45GpJE/5NhwVoRZuu0tRMDY2LED4GAPQfmvYa057BAYhj5vfOCmRxeRf8nBO96mrwLqKcvvu5L3OwOto8S9ux7Z1ukFnBthXcSmFp3prOw8Mji0y0/e7sL1F/tfniTDvB10m4p1z7+lKlakxYgDaEcKqeyzv3oYOelcYnyW3uR7dZ8MVeUI3bcwTOJ1I0bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyc6vmfJXvEnmKLNUJujHMCZo+LFvKBtwN1fMXteHgM=;
 b=Gnww9aBczX/wyWW9C5MS012AN6sMZ3Qx6fLW8FjamVE9u2LFxrxi2JJpeZe3HPd2aI/04MHpoeEhvu8NHK1vYyxmiY2ZpE+G37ScHhDbcuXDksdqwQ0bwHepQVe8U43/uubbvNcyKnU9xDqJz/I0xSu+4ANnJEqsoet7eoX0GgQaVWtYvSz48XmuffbahmtgOJ4x2d/WVnhop/VaJlkdq1SyVsDDDObQ5Pw97z7zDZCQSx9FDpIPi0PXBInBw5EgkBfeF57+eShJm8+wrsqKw1GuMLoSFzP9kXaKH69gzXeJdz8v5PJCLkTzi0A/sFKBqB2cfxpUbs9Dp/JVVhblqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB7471.namprd11.prod.outlook.com (2603:10b6:510:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.18; Fri, 1 Mar
 2024 22:44:29 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 22:44:29 +0000
Date: Fri, 1 Mar 2024 22:43:42 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Get page on user fence creation
Message-ID: <ZeJaHpr9+i23Ocp0@DUT025-TGLU>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-4-matthew.brost@intel.com>
 <6235b4c6c6d537d928795cd2dde24c27ce77ecce.camel@linux.intel.com>
 <ZeGHwQZ7tLj9oAv8@DUT025-TGLU.fm.intel.com>
 <e278d2f506078a50d072f132cd51835391f3b3a9.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e278d2f506078a50d072f132cd51835391f3b3a9.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR02CA0064.namprd02.prod.outlook.com
 (2603:10b6:a03:54::41) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB7471:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cc0b68d-8a18-4f44-b8e7-08dc3a4127c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xG5dC6mZLmqjvVc5nzPeAi1NxNyL1dJEhwmgyTY2uLXy1HzkJmXh+KreLsh6f0/7gqgKBtx4wkM9x1c4G4M1wpQlIMZvqGKy8uxRZDkiIRjijeuNmYJ6t4lPeQplT1oXxbgafrWm2+o4IOLJRatKovw8Lwr4IIojG78K9zfHHZskpAPQSa9ozwrZA/IqChFTD3nATup5pl/0JFSAGfNxVSVkemubz+eqK8p31o8Iqt/D/+NSVhMwrEWO80CjkF7NGwfne+2z/5HGgec75fU2CL1poXMUtsr3Mw0osdFSbf2AqvDXPa7dJ7Lna5jbtZN/pkwA79C4K4gRyA00XRKh86qqpPKYwLK9lmcJ6/35xOw/DlsGG2dpdVpJ8W4zLapEha+nqLz4OxiwpObwwhDSMyEHxP1ZIjrSLX/LBiyAo4h2RP6D2+7G1SG1XXOlptNRq/8SUQeHOIL5Ws9xtGYq1OLvr5HRjU3ps8cvIhW+qzosQs3s1brloMvd7uXvfAJpwoR0Ei33PlLjyFXlhSEUf1i4hW9ie86N20GtllHEnwFdK615areKqiu1XVUJ2mCaNcQT0lu5XAzguElBqRJsBA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?DmwqMPSMqTIo8EjyiYFlRAuA4DL7FN9y+OOGjVkEfIvfWcOPTZXnUJAqxe?=
 =?iso-8859-1?Q?AJtsWobLBb8dxcxZxUwesdbdra1D3WtG2g+Ktz9mIsgtBXI99rW9cI1I7c?=
 =?iso-8859-1?Q?ji9O/0fFumabN3x/JktIbN6UYMm3L5IlXvLLdxIHJS6TBkVHwoWuju7nz5?=
 =?iso-8859-1?Q?YZKQl9FVF8ZcK29JrSiQXpwA1mNSEUKz8rrqFndp1g1r07HHXQL+osRDSK?=
 =?iso-8859-1?Q?W8Ver+OaHAVpC8QcbdzmIHALFI2ZNxGfoPC0/NKcrldeuMfBqYNHMGaQJo?=
 =?iso-8859-1?Q?Za8wQBe2pHbzcwQLdZOwh9K/F8m7N7nmirNUXxRElKhFfEHVVR8dQiCbFy?=
 =?iso-8859-1?Q?AW59SfhmZuIinuxW2BD03/B5kOCmQ6YsgHJCql+WJKzd05TJiUFkdUlahs?=
 =?iso-8859-1?Q?2GHvQk7gl/DES59j5rqyFyrWbzlRFXzxH9KCKFIfwJXeMp8eEiWehEwfaS?=
 =?iso-8859-1?Q?aJHjzhnV/EuTrPXG3Wrrwlh/YgN31Cxug5ADcw+Q+5TlPP7WGa0pXq2mEv?=
 =?iso-8859-1?Q?vn8S1jjbLeFOiZa0P3HurilxEuVQAojNQnARd6OOYXpXGqhkfM+3ry1M9j?=
 =?iso-8859-1?Q?wovp/E6WWE9NLNjQI4xDlJgFp9Y2XSBD2P04nD/jFZh9JOmC4Z5WjkwR/v?=
 =?iso-8859-1?Q?KszABfECHt6TuzVqsZXsmSjxQMHtf2XACG614QCupu+ZfiyMRNoyxTM5U3?=
 =?iso-8859-1?Q?CWEGOGESF63h0vEg/FU6pYYyJeAJx/9gcd96sg4++t2EYbflGFCCksKb7m?=
 =?iso-8859-1?Q?LbjFXrJOJ7wVX5HzGyhaa4S3y3wZisSyRzQyz0ZqzUYo7SGp7cnJ793GOp?=
 =?iso-8859-1?Q?7xRs0WHhrDr0VKxwijWg88ahjQf0CIz3QKqHxOdqcTBHz2DgaeHAsn7jhM?=
 =?iso-8859-1?Q?CeaIxrWigpT7lWCpXKHi/5IZebxBbyFEWQfk/cheE23hqpdXxtRoj2qG2u?=
 =?iso-8859-1?Q?ZSejysKJFeKx4btd5zzlaURiU7ruPd+WGOFKByrOjHZNp4F55bscynMOSI?=
 =?iso-8859-1?Q?YdQXQw5ryiEKUtesXNKTK6vWvtF5MaO2po2cLbO0fGt44yqJ5Qd6Xqawh6?=
 =?iso-8859-1?Q?HL4aRU3sUTd+YtMAKtgpvgE4C0D7BxCcJVuiNjdKPYyp+SstWm33pKrOvj?=
 =?iso-8859-1?Q?6R51MBE8OM87O3f5MK7XzTIUkOhtseuFE2JVZxcaVDoUL6p1IHPwKObPVJ?=
 =?iso-8859-1?Q?fJHbDAp8Z1SsCaHZ8GLl4hndJiwTjsO/EFbAY+XliBVZI21CNR/oixXVcV?=
 =?iso-8859-1?Q?7LSFcec6fa2WBZaJyHwqtbbDfyW1H2+QtoHRfmngcf/fN1+RxvbvgPiF7p?=
 =?iso-8859-1?Q?FK8yj5HoZtopgOjEjLlOVqUSdYWU6sbYAzh3e4tQZO0VagopmRS7+kVue5?=
 =?iso-8859-1?Q?CPsNk8P4+K7eSN4rV8+G0EyVXK4Dwl7pfbFLnd6K5WHN1xk6k3hqrXtelJ?=
 =?iso-8859-1?Q?sHKf1YQfyvK76OmRKRZAKjxZwLVuPg+Ao2sspmGMPaVeKW5/KXr5b7pcG3?=
 =?iso-8859-1?Q?uoEckAq8leztqXqFPBOD+eXul4ZwucurjOOkzgDqheR37uHFV0WrfAtf9L?=
 =?iso-8859-1?Q?n2ZXM/QPKmWdZ/csEgAtxZUXoxONBm+lAyzX/XdNw8Y2UyTlJBXraYbbsC?=
 =?iso-8859-1?Q?O87FVMkwmWFusNCe+FuaxTcJ/4C7SBqHwOcqPzUh4JX3EO+WaJSMs8Ig?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cc0b68d-8a18-4f44-b8e7-08dc3a4127c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 22:44:29.5460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmP1GTiof4mOWRfI5uQWniX7FCIBmR29FgXOGHQSRiOc1vIsZw5X5FUjy1tWsBMue/hrMzVxUm8EUYz6qejYvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7471
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

On Fri, Mar 01, 2024 at 09:56:57AM +0100, Thomas Hellström wrote:
> On Fri, 2024-03-01 at 07:46 +0000, Matthew Brost wrote:
> > On Fri, Mar 01, 2024 at 07:36:01AM +0100, Thomas Hellström wrote:
> > > On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> > > > Attempt to get page on user fence creation and kmap_local_page on
> > > > signaling. Should reduce latency and can ensure 64 bit atomicity
> > > > compared to copy_to_user.
> > > > 
> > > > v2:
> > > >  - Prefault page and drop ref (Thomas)
> > > >  - Use set_page_dirty_lock (Thomas)
> > > >  - try_cmpxchg64 loop (Thomas)
> > > > 
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_sync.c | 52
> > > > +++++++++++++++++++++++++++++++---
> > > > --
> > > >  1 file changed, 45 insertions(+), 7 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > > b/drivers/gpu/drm/xe/xe_sync.c
> > > > index c20e1f9ad267..bf7f22519cc5 100644
> > > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > > @@ -6,6 +6,7 @@
> > > >  #include "xe_sync.h"
> > > >  
> > > >  #include <linux/dma-fence-array.h>
> > > > +#include <linux/highmem.h>
> > > >  #include <linux/kthread.h>
> > > >  #include <linux/sched/mm.h>
> > > >  #include <linux/uaccess.h>
> > > > @@ -28,6 +29,7 @@ struct xe_user_fence {
> > > >  	u64 __user *addr;
> > > >  	u64 value;
> > > >  	int signalled;
> > > > +	bool use_page;
> > > >  };
> > > >  
> > > >  static void user_fence_destroy(struct kref *kref)
> > > > @@ -53,7 +55,9 @@ static struct xe_user_fence
> > > > *user_fence_create(struct xe_device *xe, u64 addr,
> > > >  					       u64 value)
> > > >  {
> > > >  	struct xe_user_fence *ufence;
> > > > +	struct page *page;
> > > >  	u64 __user *ptr = u64_to_user_ptr(addr);
> > > > +	int ret;
> > > >  
> > > >  	if (!access_ok(ptr, sizeof(ptr)))
> > > >  		return ERR_PTR(-EFAULT);
> > > > @@ -69,19 +73,53 @@ static struct xe_user_fence
> > > > *user_fence_create(struct xe_device *xe, u64 addr,
> > > >  	ufence->mm = current->mm;
> > > >  	mmgrab(ufence->mm);
> > > >  
> > > > +	/* Prefault page */
> > > > +	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &page);
> > > > +	if (ret == 1) {
> > > > +		ufence->use_page = true;
> > > > +		put_page(page);
> > > > +	}
> > > > +
> > > >  	return ufence;
> > > >  }
> > > >  
> > > >  static void user_fence_worker(struct work_struct *w)
> > > >  {
> > > >  	struct xe_user_fence *ufence = container_of(w, struct
> > > > xe_user_fence, worker);
> > > > -
> > > > -	if (mmget_not_zero(ufence->mm)) {
> > > > -		kthread_use_mm(ufence->mm);
> > > > -		if (copy_to_user(ufence->addr, &ufence->value,
> > > > sizeof(ufence->value)))
> > > > -			XE_WARN_ON("Copy to user failed");
> > > > -		kthread_unuse_mm(ufence->mm);
> > > > -		mmput(ufence->mm);
> > > > +	struct mm_struct *mm = ufence->mm;
> > > > +
> > > > +	if (mmget_not_zero(mm)) {
> > > > +		kthread_use_mm(mm);
> > > > +		if (ufence->use_page) {
> > > > +			struct page *page;
> > > > +			int ret;
> > > > +
> > > > +			ret = get_user_pages_fast((unsigned
> > > > long)ufence->addr,
> > > > +						  1, FOLL_WRITE,
> > > > &page);
> > > > +			if (ret == 1) {
> > > > +				atomic64_t *ptr;
> > > > +				u64 old = 0;
> > > > +				void *va;
> > > > +
> > > > +				va = kmap_local_page(page);
> > > > +				ptr = va +
> > > > offset_in_page(ufence-
> > > > > addr);
> > > > +				while (!try_cmpxchg64(ptr, &old,
> > > > ufence->value))
> > > > +					continue;
> 
> I'm still a little worried about the availability of this, like when
> the build-bot tests on all available architectures, and Linus has
> already pulled the stuff. It's definitely there on i386, and it seems
> to be used generically in sched/clock.c. Might be worth-wile to CC dri-
> devel/lkml and have the build bots pick it up...
> 

I think it should be fine as it seems to be defined in generic include file [1].

Will do on the CC list.

Matt

[1] https://elixir.bootlin.com/linux/latest/source/include/linux/atomic/atomic-instrumented.h#L4869

> 
> > > > +				kunmap_local(va);
> > > > +
> > > > +				set_page_dirty_lock(page);
> > > > +				put_page(page);
> > > > +			} else {
> > > > +				ufence->use_page = false;
> > > > +			}
> > > > +		}
> > > > +		if (!ufence->use_page) {
> > > 
> > > Hmm. Trying to figure out the semantics here. If ever used on 32-
> > > bit,
> > > and get_user_pages() fails, then I figure we can't guarantee
> > > atomicity.
> > > That would typically be if the user-fence is in buffer-object or
> > > device
> > > memory?
> > > 
> > 
> > I think so, based on [1] if the ufence is a mapped BO on TGL
> > get_user_pages_fast doesn't work and !use_page path is used. Hence I
> > add
> > malloc ufence section in [1].
> > 
> > [1]
> > https://patchwork.freedesktop.org/patch/580147/?series=130417&rev=1
> > 
> > > > +			if (copy_to_user(ufence->addr, &ufence-
> > > > > value,
> > > > +					 sizeof(ufence->value)))
> > > 
> > > We should probably use put_user() here. On 64-bit I think that
> > > always
> > > translates to an atomic write. And we should IMO precede with an
> > > mb()
> > > to avoid in-kernel reordering. That would typically need to pair
> > > with
> > > an mb() in the reader as well.
> > > 
> > 
> > Got on on the put_user(), seems to work.
> > 
> > A little unclear on mb() usage.
> > 
> > Would it be?
> > mb()
> > put_user()
> 
> Yes, this is correct. Actually we'd want smp_store_release() semantics
> here, but this is stricter.
> 
> 
> > 
> > And then in xe_wait_user_fence.c:do_compare?
> > mb()
> > copy_from_user
> 
> Here we'd want smp_read_acquire() but we'd have to do with the below.
> get_user()
> mb();
> 
> And user-space should use a similar mb() as well if they need to be
> sure things are indeed done after the signalling.
> 
> /Thomas
> 
> > 
> > Matt
> > 
> > > 
> > > > +				drm_warn(&ufence->xe->drm, "Copy
> > > > to
> > > > user failed\n");
> > > > +		}
> > > > +		kthread_unuse_mm(mm);
> > > > +		mmput(mm);
> > > >  	}
> > > >  
> > > >  	wake_up_all(&ufence->xe->ufence_wq);
> > > 
> 
