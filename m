Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93003C54798
	for <intel-xe@archiver.kernel.org>; Tue, 27 Feb 2024 17:08:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 511B110E952;
	Tue, 27 Feb 2024 17:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHKkWcnj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF4A10E952
 for <intel-xe@lists.freedesktop.org>; Tue, 27 Feb 2024 17:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709053686; x=1740589686;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=V6BNt7G/0X5BnNVh3H7FoKb+4s0xBCXGwFLI1CzKdnQ=;
 b=NHKkWcnjez1nUOM6+pGioYTy1/rs8jk8nTnYsS0UD9/Cu8JekNespGYN
 MEAOkjFJ20Vgp/PJjKj+K3cdOBq0IacBO3D9A2Hpuh3yDdzxnqx17jWiR
 UdS0uktLCwTv7clln2vBw4UyKTjvOpYCmOnCxDDMWEFdDWmZ+XzAebMlA
 8P8spRbNV5LsAbrxV4ZZCWwqOLO8YE5bnMg4gl3CjnI3YW8kPg+5cFK+l
 XQEPtkhlKrUfBx5hkE8ih7OMlK5xv8JCRQLH2C7rV/m9Mo1EfaEU9S5+h
 5S2Y2fvwdEDuzyssVF5Ig5J9NvQM0x70y41oPivj5ghEZbtQUvLeufcSZ g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="14117925"
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="14117925"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2024 09:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,188,1705392000"; d="scan'208";a="11705620"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Feb 2024 09:07:50 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 27 Feb 2024 09:07:42 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 27 Feb 2024 09:07:42 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 27 Feb 2024 09:07:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=du2ct/dCIqlj8iOUlE9+aOqZfPQqnIxLLZ5LOM4LN39Z+hGWPgYbT2OWYC7KjrBa/Tj/0uateN19LPpae7KphN7CT/rxeOjhb/IeBOQhXcO6A+MyU+MfzO1C8Cdv7p6KL/l2rZkoV3gnZ3XHG4eLKb+stbIFOrnCt7T2UObb9gWyYs7m6twWuwgRHRmH3Ke3cq705GZEAYQxXpwwu+7bCjHT5VsfDaY/TuE0F62/h9Zc0SWqnbrfhDgJNpmrt38mcvSvKt1mpi2vjN2QSLdNKycENlP4BV/HR+JE+BK2vsyGrOiyc/JA3yboUWWSsA5mrfxOK5LAIEBIqCO+4w8dRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzFh5cU+9kjVDbf6+BItyOGCtfK1n6jhqqKPzEdYXxQ=;
 b=fBajRst2QeVFA9WxR3LxeGBnMYmrNpqaEGtwVqBop7CaWCLNZRkeI03r98sR8+GXTIEaYlhrjrIvrIUd+IWGj6FqMITSbRUEKz/18YQr3/pBtBC5ksVbwdKthqguyX4KHR5G01k1ekbNpMlg7qa6vez7N677ZERsqdcusouqyMcNlfZED0B4lXWhqOZ0sLrEo+1LsuGJTHwLWRlXgT6UIPLaYQunsE6kXmHaB2ivVustUVHJTKRqP6yLXndcblCreWKJvXVWsVce22Wz8qroriG4oa/3b4Gg3Y8hmWIYgvQrkBeKGEZj8Iep6dIJxBooFS6s4gQtPIS6mTkcUzuEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7731.namprd11.prod.outlook.com (2603:10b6:930:75::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Tue, 27 Feb
 2024 17:07:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.022; Tue, 27 Feb 2024
 17:07:34 +0000
Date: Tue, 27 Feb 2024 17:08:00 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 3/3] drm/xe: Get page on user fence creation
Message-ID: <Zd4W8GV9jwJvJEiQ@DUT025-TGLU.fm.intel.com>
References: <20240227024337.141585-1-matthew.brost@intel.com>
 <20240227024337.141585-4-matthew.brost@intel.com>
 <43e740230aa41475a6539e2b198e9885b34571e3.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <43e740230aa41475a6539e2b198e9885b34571e3.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR06CA0015.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::28) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7731:EE_
X-MS-Office365-Filtering-Correlation-Id: d5679b3c-e32b-4098-de93-08dc37b6975e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldMMWnsvcpXgLi9lEammfBpaEf1boeH1qGTudmkDpeFqp0IUOMJW4pbBmgdj7uVJDwKMzXQwOl1XlA16PnIJKHMfKFPi6OkwGKVuC/AxeBEQL55I7RpJGrVtiNbU21jJwpJoFbGn1qrU/Mqn2FyQddPR0fPUXqj78Z3etV599xvU5VOhOJ/Bk2WP2QihXPkSRkZeoyTCWpShRlH5su/Nv52R+QuqRv9z94HXRMS9dPxJSYZ5Jrk9a1lMdUZABMt0TQ4TCBawweM+7F2QhuKv79uTlbSJJuk3Q9o/H67ztUFG+zwMnbhP380v0/98dBOpwnDRIzliXQPxCbD4X3ZeQ/DjFniNeaCAHeAdk4jNwPIQUJBzzdGC4MaaqQ2zCLIi8Nvl/WGPqidq1qKYEqMAEV7Y9yC4J0Ql+2ESmHN1RSTf5Q9qOKaJ0Qtymnsr4IXsACVOqSmiz2mU1A648iKOLm00X3ed2GHee0wdgpUtdSa3kCKH0bjJJPTuN9niasoPg1HHcf7by3AWvIREeWhLp6mBewGrM/6lYwkOLz7QFUxZS0FYbJRdKirvuUS7byUr+bLD3vVeuq17ulySDs/8MxKrq2t/F6bluCL0p/bRZH5NSRmLD7c4kI7rUD+14slagkChNQg62gxcYw4tOjV93Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?8J5sXPVnT56Oz+St0GVocd98ef8fmygFu+ZULc5TgoUM327+Ji3W3rckjp?=
 =?iso-8859-1?Q?EjFcJjVSyBetKH+641n4ZOHpbggHMX+KiAgKzT+GPfxmOJWFeNRXuLaanu?=
 =?iso-8859-1?Q?dX6L/s5tNu37NCCiW5X1KMrGor2pQY2YdM4BBzNkIxn3p/LRJAB/65jYRr?=
 =?iso-8859-1?Q?p520kyufs4DCpb/hD8TTOuu54vFdpXP2IJZ/3m9uMEnEQ12hA7JWfWpOHo?=
 =?iso-8859-1?Q?xHTYdbDNCgxwPkWeHuUl2lBrmVY31atV5ECPrA/r6gRrLkIm67+9vmzQ8F?=
 =?iso-8859-1?Q?PM8VNRTJcEdoZGmbJ0L81knJ++h2s+K1s/gEqdGmidnhFKPwh4IT2+HK6p?=
 =?iso-8859-1?Q?R4/C39h5RHffw4zQX6Ycvx2Fw6D1CKAwNRVWLGJq3IFHUOfZoPqrIMuzm9?=
 =?iso-8859-1?Q?8+gIZWnd9Q7gjwZQjxzlrXNf6LqUIhmjVp7rVjKEKDQVAsDur4nEgh9Bwi?=
 =?iso-8859-1?Q?cqBtJlCH2cMDdkGWJroHEwB+9ld5FEfjXCLTKOsomfOW6yCXF65PtyXTwG?=
 =?iso-8859-1?Q?3iWI6/3X7nJnIXLH4qV/N3ojaLtmrjCPXs/YqGclNhgb/7ICMXdnsYMsTx?=
 =?iso-8859-1?Q?Lq6IJiwm1719xRWKPBaIoivER71coiVuboTp2+pavEQqHXURbw6N96ClMb?=
 =?iso-8859-1?Q?0jdxaPOozHjiKiu9mMa+KmPzQ9o9CvqlMu31CW4Q6r9G8I+q87i/AsoMbZ?=
 =?iso-8859-1?Q?V/M7Ysrlr77aCU+J4VZgpUzYU6kkiPrfhlEYBSDLWUapIMgbkvsg2/igYA?=
 =?iso-8859-1?Q?zJVd1g/BbYfzppzxjgwtTQbX8+DoDLzG3BodgdNf/CzOEj94LvOmlde8S9?=
 =?iso-8859-1?Q?FNCKuSkQt9SvyCEFKuUyOAWfrcVhDsIXTN+eEPmz1UYtSXPCrsNm6tH47x?=
 =?iso-8859-1?Q?tS1CYy7o7htY679CWNb5TnFrtVVFi4mnyUMK3pIeyFPe6GTyeLkrtgGHJW?=
 =?iso-8859-1?Q?wJ9hMcbntXcN6a1y15uucFCOUNZ4BFHaTndM7X4D9lkIa+7Kp0DTGNbiid?=
 =?iso-8859-1?Q?rc0+5XXa/yRXvgBtyQ+OrbkLtru931qgQyYBHT8i7KISE21HgmgaFZr78I?=
 =?iso-8859-1?Q?jcao3gyrPub0nO9erf3emfmteNV55/safj9HdxglRpqzqISah7VqpLQgEj?=
 =?iso-8859-1?Q?yxRYHr5rh8VKL5kJWqcXI89ahAD/syocCyEDSxfQdA3jt7lFuKsTPQYyE4?=
 =?iso-8859-1?Q?QLPVrNqPql+MUpK/u+A8K8vnOrH84f8JGIwg9vqWA7pbFwAwiG6xqwm65C?=
 =?iso-8859-1?Q?u+1EeMYhyPHgWPSXgVdJ0Ck3bCc5DiuOn87hGJzshPWn6APLZ0NQpQk78K?=
 =?iso-8859-1?Q?Nffvafuysx0SxnqtVSsz9GI74zTglwgdax3toCmkr3OYJzrLjKfeW2U53q?=
 =?iso-8859-1?Q?Ak1J5DqHOuoasM2J9AwR92L0Ux/VGHEEVhakhJuQERL8TAmp6dH7K8Rs+c?=
 =?iso-8859-1?Q?dHl0Lm0tkvkxbdPS6hbyPRMbqKuqmYmM3f/D4yb3BIpyOeXlKwPsW5CeRX?=
 =?iso-8859-1?Q?GrfQRzIldsYuCBos9SRXSOknRH8HLkfNnBsLu075zmMsQLypjpn2OFwzxN?=
 =?iso-8859-1?Q?+IHR4uq4Oly9sPnoHY8MJMCNRCTLANEQ2OkY4n9IyB4D00lzkisnFDyjtV?=
 =?iso-8859-1?Q?wxtMCdICUALBh6/LOkKTHvBKwEC1ah8ZAAVX8AvkCbiMEjxn00OW2s1w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5679b3c-e32b-4098-de93-08dc37b6975e
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2024 17:07:34.4209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c7tBWNYaa7cSiwmBAiT30CvH2vuuVCouOoVxyF1I1QXUPew6diljRWOvvp2oFax+w+vQpzcyQwdKWmxT5zSuPQ==
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

On Tue, Feb 27, 2024 at 12:01:27PM +0100, Thomas Hellström wrote:
> On Mon, 2024-02-26 at 18:43 -0800, Matthew Brost wrote:
> > Attempt to get page on user fence creation and kmap_local_page on
> > signaling. Should reduce latency and can ensure 64 bit atomicity
> > compared to copy_to_user.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 45 ++++++++++++++++++++++++++++------
> > --
> >  1 file changed, 36 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index 022e158d28d9..2f3e062c0101 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -6,6 +6,7 @@
> >  #include "xe_sync.h"
> >  
> >  #include <linux/dma-fence-array.h>
> > +#include <linux/highmem.h>
> >  #include <linux/kthread.h>
> >  #include <linux/sched/mm.h>
> >  #include <linux/uaccess.h>
> > @@ -25,6 +26,7 @@ struct user_fence {
> >  	struct dma_fence_cb cb;
> >  	struct work_struct worker;
> >  	struct mm_struct *mm;
> > +	struct page *page;
> >  	u64 __user *addr;
> >  	u64 value;
> >  };
> > @@ -34,7 +36,10 @@ static void user_fence_destroy(struct kref *kref)
> >  	struct user_fence *ufence = container_of(kref, struct
> > user_fence,
> >  						 refcount);
> >  
> > -	mmdrop(ufence->mm);
> > +	if (ufence->page)
> > +		put_page(ufence->page);
> > +	else if (ufence->mm)
> > +		mmdrop(ufence->mm);
> >  	kfree(ufence);
> >  }
> >  
> > @@ -53,6 +58,7 @@ static struct user_fence *user_fence_create(struct
> > xe_device *xe, u64 addr,
> >  {
> >  	struct user_fence *ufence;
> >  	u64 __user *ptr = u64_to_user_ptr(addr);
> > +	int ret;
> >  
> >  	if (!access_ok(ptr, sizeof(ptr)))
> >  		return ERR_PTR(-EFAULT);
> > @@ -66,7 +72,11 @@ static struct user_fence *user_fence_create(struct
> > xe_device *xe, u64 addr,
> >  	ufence->addr = ptr;
> >  	ufence->value = value;
> >  	ufence->mm = current->mm;
> > -	mmgrab(ufence->mm);
> > +	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &ufence-
> > >page);
> 
> Hmm. This is mid-term pinning a page-cache page. We shouldn't really do
> that since it interferes with huge pages and numa migration.
> 
> What about just prefaulting and dropping the refcount and then we
> do this again when signalling?
> 

That should work.

> > +	if (ret != 1) {
> > +		mmgrab(ufence->mm);
> > +		ufence->page = NULL;
> > +	}
> >  
> >  	return ufence;
> >  }
> > @@ -74,13 +84,30 @@ static struct user_fence
> > *user_fence_create(struct xe_device *xe, u64 addr,
> >  static void user_fence_worker(struct work_struct *w)
> >  {
> >  	struct user_fence *ufence = container_of(w, struct
> > user_fence, worker);
> > -
> > -	if (mmget_not_zero(ufence->mm)) {
> > -		kthread_use_mm(ufence->mm);
> > -		if (copy_to_user(ufence->addr, &ufence->value,
> > sizeof(ufence->value)))
> > -			XE_WARN_ON("Copy to user failed");
> > -		kthread_unuse_mm(ufence->mm);
> > -		mmput(ufence->mm);
> > +	struct mm_struct *mm = ufence->mm;
> > +
> > +	if (mmget_not_zero(mm)) {
> > +		if (ufence->page) {
> > +			u64 *ptr;
> > +			void *va;
> 
> 
> > +
> > +			va = kmap_local_page(ufence->page);
> > +			ptr = va + offset_in_page(ufence->addr);
> > +			xchg(ptr, ufence->value);
> 
> Does this compile on 32-bit?
> 
> > +			kunmap_local(va);
> > +
> > +			set_page_dirty(ufence->page);
> 
> I think set_page_dirty_locked() should be used here.
>

Got it.
 
> > +			put_page(ufence->page);
> > +			ufence->page = NULL;
> > +			ufence->mm = NULL;
> > +		} else {
> > +			kthread_use_mm(mm);
> 
> So we could do the whole thing here instead, including a
> get_user_pages_fast(). Typically that would be a lock-free fast lookup
> unless the page got migrated between creation and signalling.
> 
> 

Will rework.

Thanks for the quick review.

Matt

> > +			if (copy_to_user(ufence->addr, &ufence-
> > >value,
> > +					 sizeof(ufence->value)))
> > +				drm_warn(&ufence->xe->drm, "Copy to
> > user failed\n");
> > +			kthread_unuse_mm(mm);
> > +		}
> > +		mmput(mm);
> >  	}
> >  
> >  	wake_up_all(&ufence->xe->ufence_wq);
> 
