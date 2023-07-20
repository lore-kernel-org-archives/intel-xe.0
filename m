Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E061BC00528
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jul 2023 15:42:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F54410E15E;
	Thu, 20 Jul 2023 15:42:53 +0000 (UTC)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F20A10E15E
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jul 2023 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1689867770; x=1721403770;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XEgWRsLBfxRVheXU9vCLAxKN3Vt9+LG5pifQqiJMMEw=;
 b=MztTxC/cGMySN7W4C6Bxhhia1L/1r6wT5NAFtNaLyQSr91MnJFMtKh8o
 fLErQOIuvgOQl8E4pVrY5YrQ8OQvCdp7GtJDDnJHvwX+kh5SzoswFhD2Z
 AequkSTTZv3afWZ1pV/DOZDrYbgbj3rIvLD/Di/VnyMTqemFpLbJL/TMy
 WSlAJPCbr5U6Wwg462ytYn0cH6DtQg7quXhHyHyyfQAEyyuqsX0nLwChi
 UPqoOhuaHHeF8twYfXzZ8XRimzRzMX3grGMSSLhdvrec8wI3Yv/n7OQRK
 MBl6xW9PwW0HNUPHXPIAInFCdIjbUJrLARbkmVCZtKs6PtoXCFRybWrAa Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="397660588"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="397660588"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2023 08:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10777"; a="759605785"
X-IronPort-AV: E=Sophos;i="6.01,219,1684825200"; d="scan'208";a="759605785"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga001.jf.intel.com with ESMTP; 20 Jul 2023 08:42:50 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:42:49 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 20 Jul 2023 08:42:49 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 20 Jul 2023 08:42:49 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 20 Jul 2023 08:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eKeWcP1VovIDqP+mYnTrv2LfFkidbEbRlA6WdI4JThqbxVR9XDLYRzB53jsG7JTiBvTMPFHgKLm9DeMyvZAtgB7StuaCsoK9pX9fvqRb+fGspRWENgrFDPmMq9wIqyxeXo7zpbpWtnS2jrNEsN4vxL0XdxZ4L985Ou8j2bPclDh2EgBNFia7cJy07e3xriD0PIr+vR3OJbafU9Y2Zb7cFOJQqTZLz7QlmqIfM1eDC2OBMJ0p0bhOTZllD5YZcB7ZWzsMAqXGJh1gjwP6xb2xSelZuyBSEEL8w6fcM0ajHvnVxFA5Jg0Sct5TVylGuk91AQ59O2QNQrUdDZ/f6ia9MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zYclIJqGwR0iLiNB4r9pO/eNoeiNSgqx29wqJdly1d8=;
 b=K8fccDnLfAq2Q2zvuobuManOCSaf6mtg7fH5BQxsEEn8IpuEtpHtCt/VcMESQYC9tozVqh5oJEfDhpYDeYCtZvf7eYDXzwBJZC6mpnmnTYD1yjhcjy299X1V5eZXydYvXFKyo5mF8nHWlN7MkeBm914G5gN5CXJ1kJQJAxMgvxMonI7ju0He9Jv/0jLEfAb9wMt6nT0TaFYZdq+xQjq/1O/xWhwExl9seBR8ekttqzqNbtAJEwsDvxH+XCHZ0LCIQhyZo/OKwmFlfy6F0JMAdr69EGBHnCl9VJBaUvrkzLCGoxB3kw7DUrUvr69+2Te9gKaqhRcUiNzn3CAHX4OpBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by BY1PR11MB8126.namprd11.prod.outlook.com (2603:10b6:a03:52e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 15:42:47 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::7f94:b6c4:1ce2:294%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 15:42:47 +0000
Date: Thu, 20 Jul 2023 11:42:42 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Matthew Auld <matthew.auld@intel.com>
Message-ID: <ZLlV8lFWhwdl9hA7@intel.com>
References: <20230719192726.172056-1-rodrigo.vivi@intel.com>
 <2ed513ec-3a3f-1795-2761-ad1d39bb6a09@intel.com>
 <ZLkiAmNuvjdUi+09@intel.com>
 <adbd55cd-b75b-6b65-7c10-500bb1992850@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <adbd55cd-b75b-6b65-7c10-500bb1992850@intel.com>
X-ClientProxiedBy: SJ0PR05CA0125.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::10) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|BY1PR11MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: 78f33ae6-9076-4d8e-2982-08db8937f73a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1bgV/wL0swqJiW8VdppJ239oj/bmCGUx2yXJV2SNp/KuOCPGUbwp/4sK62/OPOErfEUky6rgPVONu2uD7lkSysRAao72xfvYj5O9tgLbZy52OkW2IH4rczty6eaFlquYgx54WlCBAofM7BCUuLKcqe/MNv/yiOj3J31vyuAJLT1TUo6v1enG3FkoeVQ/kDtgjjp7X+mIIyCNUCwelqdq59a8rQiaPGRa/WGA6OKxJ97oSdRcSoxGDqui3PfpeJmhRqsPEswY8kybkdn5a7b4cChq5UGDYgroXWDu5roNIDgZpaupqSDIHCiyUlJ6dskYvjmUPd8nLK90jeQwEo/aMAstFAViT1s0e/rmDzgjX8gIOdT8RQw3c8zlIcsy1QF8U9uAMQ+NYUNS/5gRi1tF7aMEiQVh6sd1ZRcJSg+YcOhs46pms2KxsOjno3faLT3DBWpTxw4FXY+jM+/ihT9T/rXqGgXX0mpW9X0MS9Qz3miirXccYursla/Ovy+OWA4PQqbXBw/KoPbHhaXIIgJh9ZoWm4e9eVdQ39hYXRFoBTnrScr2YzzZo07Qb6cIfEl
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(136003)(366004)(346002)(376002)(451199021)(83380400001)(2616005)(2906002)(38100700002)(82960400001)(26005)(66556008)(66946007)(66476007)(4326008)(6636002)(316002)(186003)(5660300002)(44832011)(53546011)(6506007)(6486002)(6512007)(6666004)(41300700001)(37006003)(478600001)(86362001)(8936002)(36756003)(6862004)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xvPplsgGwMkjk/nIH9lfL3Ym2bp/XGeAyuc+oQOhqKGORdb/9IaVHVr31bLE?=
 =?us-ascii?Q?6XCmTOza4rsRJHTk6GI+U/UUmTd2YNOtZfmk9uwYD44FxP2ID2PUZrnLJgsS?=
 =?us-ascii?Q?t7Qm5vwJr3i5w9+uP4TVitTfc5Mr6kxaWT+G38hvgtDxuiZDGLt/OOtEfTac?=
 =?us-ascii?Q?2/V7Zc2Df2IErNRu0+SDRn0z76r+uJ1pBTnW3/I7VJjd2TQDGrpRWRpmsdio?=
 =?us-ascii?Q?JITD+QpCOgvRnbol/DHk07lbXx3iDb/PmH8SpLijyefXbIQ/OXaM0rT3TgUh?=
 =?us-ascii?Q?hsT368D+U6DPt3XAheSzAV3uiWjBAST5P/Ff1Ro4yDhH2bPWWJm4BHt0uQ8P?=
 =?us-ascii?Q?N0LJV7pwKQSvKl7cZapoYXmkBGCdPeiOUAeyH3r1vnU19ir9wHtr7Xqgt7d5?=
 =?us-ascii?Q?coWLPRjkGQwvdKeCfv38QEpwfbtDzLBSktXECe1mVfo2cG2lnjzBgNJdYeAL?=
 =?us-ascii?Q?kkogM2ebN9ekDuMB4ZmZ8kuDElh+IC1S51eaWMyh6d0oIO8Yx28KFJGU+Bd1?=
 =?us-ascii?Q?h89ISBCnco9F485N+eDq9IBmqwWBJX+VqHO9TPGEPJBdqId7rGh/yIRtk+q7?=
 =?us-ascii?Q?t2dnBdHIRB5qDZhotR0/m588bF7c6TELD5IqvHHXJaB3O6K6w8fJPXvAYs5J?=
 =?us-ascii?Q?3SxC22sWnN37K0JT8w18La80I9ETOfGCu6X9Pwsydd3bWp87MsB6btHh1wuR?=
 =?us-ascii?Q?4JolwGjh9chUWfq49+5FrvDa65ZFN9RT+C83g8vlaIPGWfRtEr8C7+x8IYjH?=
 =?us-ascii?Q?cyJNw7SgaFcGgsT9kdSFA/T8K61sI5vy4Ee4iX+TRLX0Cbw4Z7fdjtO+7bDO?=
 =?us-ascii?Q?YRokQ8asvkk1NsSuwGSEY82942XJMe2sXcaCJ4QMSEXDtVSY4iEblNwnECyz?=
 =?us-ascii?Q?JLoUSTh7iMLI7Ma6/L1ojkQ/VU8bYgpJxT8x2cbmWmgDZ1bCAglmoPtKWCfG?=
 =?us-ascii?Q?cza67ZC2Ci0BZ5zUSYTO6nLD5usAI+8aNLZ/O75QhDE9Txbt+PF3KBncDRF5?=
 =?us-ascii?Q?tnVswu1FMYLZPrSpMnfjJXCONQAPNUFGsDIh/yMvlVAF38BWuA0j/3JgQwyK?=
 =?us-ascii?Q?nEgGClOKAi3FmzAzKodtODqSlHCNqBO2nqJ0wWOTB/HZBWlqnRNiht2jFprQ?=
 =?us-ascii?Q?dVWnNUl4Xmh0U2FgGajSMPrNPiiz0zcb7H2dPgwLC1BTabuALNdSqmFp2Fqh?=
 =?us-ascii?Q?dXFyYIzTxMq601Vt87VwBx7uUcDX00gBdXwf8xn+FAMFi9EcJLbpuN6HV+Bc?=
 =?us-ascii?Q?Mpw6HJuIp0hkhmZa7eY+3SkwfD7pB/8bnIWGjy1vyJxV7LA3Aavbp59p5cEe?=
 =?us-ascii?Q?o57uw200nvtJUAoINV5Q+vkh95RnKRwwFQn8248qUjy6OyqRt7ClqpwBNHz4?=
 =?us-ascii?Q?DRSFap73Gu4KAFDv+x1Xf6pjcVzl5mzRsYys//dlVArXWvuv3Om1TbkTkDPP?=
 =?us-ascii?Q?2UqUPL290iyC2deqVVCMq9aAeOFiSJz0W/wPmC+Z8eeK9I3UmEt8gstPGuHR?=
 =?us-ascii?Q?qstdrpIeA7/ey/Fkndfb+/HqEHMeMWwzMXZoGcflFvNVY5qtd/fO5+xA9YUh?=
 =?us-ascii?Q?PQeUhtIYJsqWrTjonJ3/kBGDX7fFD0/n/zwq7VTL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 78f33ae6-9076-4d8e-2982-08db8937f73a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 15:42:47.1347 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Aogo1DfhiAqpnobyIfUaRVPxHVo931nBvr+WLK0YEXK5leA5NPU2933ankJ7w1vxcplAKfPjNhPzXLThn8yZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8126
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix an invalid locking wait context
 bug
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

On Thu, Jul 20, 2023 at 01:38:18PM +0100, Matthew Auld wrote:
> On 20/07/2023 13:01, Rodrigo Vivi wrote:
> > On Thu, Jul 20, 2023 at 10:11:00AM +0100, Matthew Auld wrote:
> > > On 19/07/2023 20:27, Rodrigo Vivi wrote:
> > > > xe_irq_{suspend,resume} were incorrectly using the xe->irq.lock.
> > > > 
> > > > The lock was created to protect the gt irq handlers, and not
> > > > the irq.enabled. Since suspend/resume and other places touching
> > > > irq.enabled are already serialized they don't need protection.
> > > > (see other irq.enabled accesses).
> > > > 
> > > > Then with this spin lock around xe_irq_reset, we will end up
> > > > calling the intel_display_power_is_enabled() function, and
> > > > that needs a mutex lock. Hence causing the undesired
> > > > "[ BUG: Invalid wait context ]"
> > > > 
> > > > Cc: Matthew Auld <matthew.auld@intel.com>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/xe/xe_irq.c | 5 -----
> > > >    1 file changed, 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > > index eae190cb0969..df01af780a57 100644
> > > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > > @@ -574,10 +574,8 @@ void xe_irq_shutdown(struct xe_device *xe)
> > > >    void xe_irq_suspend(struct xe_device *xe)
> > > >    {
> > > > -	spin_lock_irq(&xe->irq.lock);
> > > >    	xe->irq.enabled = false;
> > > >    	xe_irq_reset(xe);
> > > > -	spin_unlock_irq(&xe->irq.lock);
> > > 
> > > Do we not need something like:
> > > 
> > > spin_lock_irq(&xe->irq.lock);
> > > xe->irq.enabled = false; /* no new irqs */
> > > spin_unlock_irq(&xe->irq.lock);
> > > 
> > > synchronize_irq(...); /* flush irqs */
> > > xe_irq_reset(); /* turn off irqs */
> > > ....
> > > 
> > > And then at the start of the irq handler:
> > > 
> > > spin_lock_irq(&xe->irq.lock);
> > > if (!xe->irq.enabled) {
> > >      spin_unlock_irq(&xe->irq.lock);
> > >      return ....;
> > > }
> > > 
> > > Or did something happen prior to xe_irq_suspend() to ensure proper
> > > serialisation with irq and the above steps are not really needed?
> > 
> > the suspend and resume calls should be serialized by itself, no?!
> 
> Is it not possible for IRQs to still be firing or potentially be in-progress
> here as we are preparing to suspend?

yes, it is. We are letting the rpm to run with irq enabled otherwise
we will face the same invalid wait bug that this patch is trying to solve.

But I don't believe the right way is to use the lock to protect the irq.enabled.

Taking a look around I believe that what we are missing is the
synchronize_irq() call right after the reset. So we ensure that all the
racy handlers were properly processed before we allow the suspend.

So I believe we need something like i915 that would be:

xe_irq_suspend()
{
	xe_irq_reset(xe);
	xe->irq.enable = false;
	synchronize_irq(pdev->irq);
}

xe_irq_resume()
{
	xe->irq.enabled = true;
	xe_irq_reset(xe);
	xe_irq_postinstall(xe);

	for_each_gt(gt, xe, id)
			xe_irq_enable_hwe(gt);
}

> 
> > 
> > no other place touching or inspecting irq.enable uses this lock
> > anyway, since it was created to serialize the gt_handler.
> > 
> > > 
> > > >    }
> > > >    void xe_irq_resume(struct xe_device *xe)
> > > > @@ -585,13 +583,10 @@ void xe_irq_resume(struct xe_device *xe)
> > > >    	struct xe_gt *gt;
> > > >    	int id;
> > > > -	spin_lock_irq(&xe->irq.lock);
> > > >    	xe->irq.enabled = true;
> > > >    	xe_irq_reset(xe);
> > > >    	xe_irq_postinstall(xe);
> > > >    	for_each_gt(gt, xe, id)
> > > >    		xe_irq_enable_hwe(gt);
> > > > -
> > > > -	spin_unlock_irq(&xe->irq.lock);
> > > >    }
