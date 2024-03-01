Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB428C5478C
	for <intel-xe@archiver.kernel.org>; Fri,  1 Mar 2024 07:46:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E8010EA22;
	Fri,  1 Mar 2024 07:46:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fy4uVG+X";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A44110EA22
 for <intel-xe@lists.freedesktop.org>; Fri,  1 Mar 2024 07:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709279192; x=1740815192;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ngSKx9ClhSLWmO4LSlxE3oGx8b2liDzNTg6vCq5G3gA=;
 b=fy4uVG+XgXav/kfGurS9Gr+4phPlUY+2QC+2fob0GP+Jr9rfZSmEjunD
 YO952ksAbVbNEKoq4lPPXFz4PTe+qDftBL/ZleDzPqp9+mvgjhHCOA7Km
 Od6kLjk0v45K2cU1qR9bwFCVYQDucz9s0hxci3cByLFM35qBWwohEB0zR
 cXaqd4Qm9zyZbXVmRsO/xbfXjE28dB5Ki5PDxCQP7xz7zlhIkRwW+Ge7e
 yYkogrJzMdJ/fBni6dzzm8KevRxqJwbD3BZVf0ZCpAYHEocjwrQ7julKM
 LcEYHMLv+OwOxSRJkQ3+8B/bk5R9nVqOb0qDNuArQNIgXe6unoiizrvqx Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3690877"
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; 
   d="scan'208";a="3690877"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Feb 2024 23:46:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,195,1705392000"; d="scan'208";a="38962338"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Feb 2024 23:46:31 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 29 Feb 2024 23:46:29 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 29 Feb 2024 23:46:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 29 Feb 2024 23:46:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zr1gS+dEI1zhepHUMETuELoC949MpaDxmTpgtsbqT8W+5ATWZyFvcJfNMa6vpVSSkgBKWXHAGRjcFcqMFOqYVImorlXpuJ/3QA/xgFM9JTdKTkchiyZa+DN9tfA8OQqtB6Po5b4BXgJEpMI0hdd0R4U9ekBw+nDaYJB8fLkQTsRYjAQI6H7Bc6q6uZyvkuGQefNO6fUROsS1zyr6yFOrCCVRFu3y81VufhkcXQSTF1nT0KJXvjtZZspT7euNkX4nBNu/o7pJ2oWBUU4TV/QvyIMoR0pTsn5mpwMVOeL9kLjwJZ8+fhT+C+YTW2SjwFQ+0m/+pUhJETe2cECZgxOEsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9owZFTOEbzz7Y8bE9HI/8KIQmMBA6fGkvAS/NPSitLE=;
 b=U+hHRSe8xbiuPDtpYUKpQC/bbqxHdeXY2uBWY+MA8Iu9tCebfzf9vH4Lls6XUijYWUrgWmGYKrYoMg/4opW9dK4r+1nnyf72xr6x0Cmik6PVnxajFvgGh0q/jy3GLiqJr2XCC0r6bJ/ZaW8o/LU095P9lcw0JlpxnrAxlJf2XFtkVHJmuDfgAcx2DYqw6u2FW9bFiVOdOBVUGlhHBimKXfdZf8aIfVYZf00lUildGO6RLv/JKzOvmONuSgaTfzx0DmEOXiDUTQxVecQz5kujoOHIaXYr5O+rf1dDndM/bBsj4HiU+J8rt0gvVWjlMG/EMQS5Tg4+UZX/4raHvGI4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN2PR11MB4552.namprd11.prod.outlook.com (2603:10b6:208:263::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.26; Fri, 1 Mar
 2024 07:46:26 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7339.031; Fri, 1 Mar 2024
 07:46:26 +0000
Date: Fri, 1 Mar 2024 07:46:09 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 3/3] drm/xe: Get page on user fence creation
Message-ID: <ZeGHwQZ7tLj9oAv8@DUT025-TGLU.fm.intel.com>
References: <20240301035522.238307-1-matthew.brost@intel.com>
 <20240301035522.238307-4-matthew.brost@intel.com>
 <6235b4c6c6d537d928795cd2dde24c27ce77ecce.camel@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6235b4c6c6d537d928795cd2dde24c27ce77ecce.camel@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0055.namprd11.prod.outlook.com
 (2603:10b6:a03:80::32) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN2PR11MB4552:EE_
X-MS-Office365-Filtering-Correlation-Id: c9cd6add-6044-47b1-a2ef-08dc39c3b2fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: O057eEr3CTWOWog30Dy2SDw/G933wKYUtGHOY96xpouKWI/VcQhBBDMOG7xXdO56grhvr99gO1aGpz5+5bLGHsju0czHAMl9rgvBX0mnOCiKuUiZ8IWUUeUthelDesj0Kt8EI0r6H09FVXC+rnIq8JC4yJe3qp5+kyDpQUihVxipjiaOg2JYFsQuTwotCo+L6ArtHwLMei+085UDJ1llohfs26S8TcNWs0az6GFguzDfYtvUKxrZ2DXxlJUgu5UiaMq78R89WxB26+P1eIYhWRwK5xy7Fo5uVzIPdm5KyC9bBcuiyMI11pVRJIketuMQZh0XbpHSUlqP29TwnjCQax9qNgx9CW/ao0SnIqzWfE/U56lxx/W5++/15xL3rL56HzQg+ae5x5jFPr9R0/avHQ+IhO5Qr6LbCu2Z0Jn82bNj903D/HJhFlCR1upbJTiIH844EkDZOXD4d+dO0dOoyeDmIRFiREUTEVsJzmEkGEDCgqf1YpUPLcqUTXkldSRUUPWepZ2iTs8+Kos7krl5ltJE3N1JE8xukLOYBNCJn1dOhBjQbBea1bOcwsH5UoXol8o4kvvuy6tzavzRujFs5g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?jMJtVS8lmV9CP0RW4352i3PyFB55vsWXYwc6fvObuVLVxWbWuHCVNgrxzH?=
 =?iso-8859-1?Q?hiHDu8/q0EyLtuPFaG0i43t/I6r1Gc8dVA0IcPGusT3W7atGqXfLsPNAym?=
 =?iso-8859-1?Q?185S10EzCxI9+jSZwONEiZ+47zo0auKJYTlW0aJxTkwQSjbKfLlCPFu5Vs?=
 =?iso-8859-1?Q?RkTkKleWCil453LLjzyPDmtsh9mnToytnbTM77fXB8atvRID2U8pt4PBOe?=
 =?iso-8859-1?Q?AcIPqUFDswlTD0TyH8S4jM40XAOPtwPercgaCQifrilVF0iZfZcN1LxQ2K?=
 =?iso-8859-1?Q?0opjk5JXum+POXrcJsHb2R6NkzKtopu25voXfimB6hMlI2jiyV+GC89g2K?=
 =?iso-8859-1?Q?IkMdNGkPUgm9eS3BDTIqdr7FPWMrwUdGbG5hhZ7GRHLa2t52RP4AIY10Gr?=
 =?iso-8859-1?Q?xt9WEUMp5ByNbD4RrAWiEyXcpuFVFixomsinahGrGORY2jTKzLRPwdARum?=
 =?iso-8859-1?Q?I0WqIKd3GODeOn2iaq06uZZs6NpVMwffBgcmirp8xTP084V6MsZhXAz5A1?=
 =?iso-8859-1?Q?ltiHSJc9SWMhm3En1LIFvXHkA9cLP0X95SQiVx/9IpMolB1sNbKKtuePqu?=
 =?iso-8859-1?Q?9QqwAqOY0uc6f5ZAd9EhDpbXupg+qI3inOPqVLt2AoQEje508AJ6aBYV13?=
 =?iso-8859-1?Q?ame3IWaUm6SfAwdiQFzvhbx4sPVhIaiVrEGMFKXWxvh7XwLhmYOHwYKzvP?=
 =?iso-8859-1?Q?tHY4OO2bbkiQuotYKYid023e7QV8ncS6+zkt/EKhKgmvW+GV10J8iHHKKO?=
 =?iso-8859-1?Q?vFZ6J+vbRdUm4iX5i0kf6wzPPSle2G5kUKDu0X1vjwM3weXa+78jY6x89U?=
 =?iso-8859-1?Q?aN9pQ24OTmE93x0fibTdWo+mYJkFyn4dRPMIuwcz3F4Da82+Y85+AuAKzj?=
 =?iso-8859-1?Q?ka2z/WiKSCtNAW/lPJdT+dHb1y+ncirDYHwI0xalkz6ljMbmY1XLnJH/0k?=
 =?iso-8859-1?Q?bE2qHeyvPtt0HghES7HaofCmtVZ8wT1fC/Zi9AU2UOJDgaD0f9Qc/qGHV7?=
 =?iso-8859-1?Q?kC9/on8W6SyDCIJPZZ31b7DG3vk2/aM1QGFwIIiai9rQJZURLtnK/SQDXh?=
 =?iso-8859-1?Q?JTGaa7ABh7sPDp4ro9DgWroUhsWauYRl0f2kBR91hmzlzcZT0WKV74eTbi?=
 =?iso-8859-1?Q?fwNABR0AHzpQ85SdujaFOCHhO2f/RO/Jquo6ImpIYXE2jFDtzrtAjKp5Px?=
 =?iso-8859-1?Q?IFSy3kfmEXQIz1faY3uDnmsidRGiq49x81++u2WlyhdQgkBwQbkod35oW3?=
 =?iso-8859-1?Q?CK5u5nhN7Mm2bRUKNoJrTpDhcuLTy0Qy2XNPWpyK/K9UKZ+b7hM5KacnwT?=
 =?iso-8859-1?Q?D7xylFU5D/CCaX6ATXO/gak36DDxQYHWZ9pRT5rrEDwFYb7Vx8kHUf6EQ7?=
 =?iso-8859-1?Q?jvtkI1BjCnufF4W+NHu0KZnFnrNJpGD3xo5IX6Pj6i//a1qJzJBptLq6vC?=
 =?iso-8859-1?Q?QfK/bJxGv2uttMRNBkBB9jSUGtlh/gKpg1BnT69RqH+hkUIx8yol8rt8pQ?=
 =?iso-8859-1?Q?Kcepb2RgwEXJo/iZ0+JuyoUNYhcTKplmQeYOV8iiZik66cnEgXVWxUEBCm?=
 =?iso-8859-1?Q?WvX7kMS76SavJFm8FyULDBORpQhAzjcBv048h8rchLY399wd4IFkoIqDcZ?=
 =?iso-8859-1?Q?h7YiAw0adATpqJhL6ttA0osbDZ6zcr4z4HG8WWaInyEQxfEnfeYZwd8Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9cd6add-6044-47b1-a2ef-08dc39c3b2fc
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Mar 2024 07:46:26.5815 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDHXgJyQFOXIF4uOhC80JTlzvh97yNd0bC8IISWMOKRYYxaZmbG3nFeZ71oanqhp8jr8i9YXMe0NZ7fFQUMLJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4552
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

On Fri, Mar 01, 2024 at 07:36:01AM +0100, Thomas Hellström wrote:
> On Thu, 2024-02-29 at 19:55 -0800, Matthew Brost wrote:
> > Attempt to get page on user fence creation and kmap_local_page on
> > signaling. Should reduce latency and can ensure 64 bit atomicity
> > compared to copy_to_user.
> > 
> > v2:
> >  - Prefault page and drop ref (Thomas)
> >  - Use set_page_dirty_lock (Thomas)
> >  - try_cmpxchg64 loop (Thomas)
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_sync.c | 52 +++++++++++++++++++++++++++++++---
> > --
> >  1 file changed, 45 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > b/drivers/gpu/drm/xe/xe_sync.c
> > index c20e1f9ad267..bf7f22519cc5 100644
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
> > @@ -28,6 +29,7 @@ struct xe_user_fence {
> >  	u64 __user *addr;
> >  	u64 value;
> >  	int signalled;
> > +	bool use_page;
> >  };
> >  
> >  static void user_fence_destroy(struct kref *kref)
> > @@ -53,7 +55,9 @@ static struct xe_user_fence
> > *user_fence_create(struct xe_device *xe, u64 addr,
> >  					       u64 value)
> >  {
> >  	struct xe_user_fence *ufence;
> > +	struct page *page;
> >  	u64 __user *ptr = u64_to_user_ptr(addr);
> > +	int ret;
> >  
> >  	if (!access_ok(ptr, sizeof(ptr)))
> >  		return ERR_PTR(-EFAULT);
> > @@ -69,19 +73,53 @@ static struct xe_user_fence
> > *user_fence_create(struct xe_device *xe, u64 addr,
> >  	ufence->mm = current->mm;
> >  	mmgrab(ufence->mm);
> >  
> > +	/* Prefault page */
> > +	ret = get_user_pages_fast(addr, 1, FOLL_WRITE, &page);
> > +	if (ret == 1) {
> > +		ufence->use_page = true;
> > +		put_page(page);
> > +	}
> > +
> >  	return ufence;
> >  }
> >  
> >  static void user_fence_worker(struct work_struct *w)
> >  {
> >  	struct xe_user_fence *ufence = container_of(w, struct
> > xe_user_fence, worker);
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
> > +		kthread_use_mm(mm);
> > +		if (ufence->use_page) {
> > +			struct page *page;
> > +			int ret;
> > +
> > +			ret = get_user_pages_fast((unsigned
> > long)ufence->addr,
> > +						  1, FOLL_WRITE,
> > &page);
> > +			if (ret == 1) {
> > +				u64 *ptr;
> > +				u64 old = 0;
> > +				void *va;
> > +
> > +				va = kmap_local_page(page);
> > +				ptr = va + offset_in_page(ufence-
> > >addr);
> > +				while (!try_cmpxchg64(ptr, &old,
> > ufence->value))
> > +					continue;
> > +				kunmap_local(va);
> > +
> > +				set_page_dirty_lock(page);
> > +				put_page(page);
> > +			} else {
> > +				ufence->use_page = false;
> > +			}
> > +		}
> > +		if (!ufence->use_page) {
> 
> Hmm. Trying to figure out the semantics here. If ever used on 32-bit,
> and get_user_pages() fails, then I figure we can't guarantee atomicity.
> That would typically be if the user-fence is in buffer-object or device
> memory?
> 

I think so, based on [1] if the ufence is a mapped BO on TGL
get_user_pages_fast doesn't work and !use_page path is used. Hence I add
malloc ufence section in [1].

[1] https://patchwork.freedesktop.org/patch/580147/?series=130417&rev=1

> > +			if (copy_to_user(ufence->addr, &ufence-
> > >value,
> > +					 sizeof(ufence->value)))
> 
> We should probably use put_user() here. On 64-bit I think that always
> translates to an atomic write. And we should IMO precede with an mb()
> to avoid in-kernel reordering. That would typically need to pair with
> an mb() in the reader as well.
> 

Got on on the put_user(), seems to work.

A little unclear on mb() usage.

Would it be?
mb()
put_user()

And then in xe_wait_user_fence.c:do_compare?
mb()
copy_from_user

Matt

> 
> > +				drm_warn(&ufence->xe->drm, "Copy to
> > user failed\n");
> > +		}
> > +		kthread_unuse_mm(mm);
> > +		mmput(mm);
> >  	}
> >  
> >  	wake_up_all(&ufence->xe->ufence_wq);
> 
