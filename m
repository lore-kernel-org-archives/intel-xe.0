Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04263CE7A86
	for <intel-xe@archiver.kernel.org>; Fri, 22 Sep 2023 21:06:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8DD10E716;
	Fri, 22 Sep 2023 21:06:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56B010E716
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Sep 2023 21:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695416767; x=1726952767;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QXMMSBPBGwcC6p/37YozkQwC6TXr+GT/Hs9KmtoEJcc=;
 b=Y7ZsvkFTE7Uyl8jQOzXdzIIqGbFnJ6CZ5H7TMZDNctcdJ5zTzj8IJXSR
 noFvPQ5L9o+kwqUgNS2gYVjUNfUXhcHzOWOhzXX5FEosAhEhSBRSCJyZp
 scv4t8bA1MS0vEJ48bh1I19ydORC/YsGMQmkKURu87xlYNcZL09kPuKT2
 GRiITbUXuWfNDjatyDE7kZCkaW9HnbWyTILi0yWI6YrMvr7mE7nVyqY2Q
 bcrHcFlikdNpqYpt1+So3AdoIodMvvcp1LGFrpOqv1fAMacGJ6sWZmKjZ
 NbgX6xIf1AcaNyNQXZZWibgG6VgxsRuaT2AjXnG+BDcxnBDslOtCk1NSY w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="383694260"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="383694260"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 14:05:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="994686091"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="994686091"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Sep 2023 14:05:13 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 14:05:12 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 22 Sep 2023 14:05:12 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 22 Sep 2023 14:05:12 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 22 Sep 2023 14:05:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jglU/efVdWV8pIgCO9jBSEqjyBkQnkRA/LpETd4PF11EzxjLP16Xri2/4pBCJ8YoMrE9qM9hqyAFNgfLn6HeiQ+7YEo14lGT7zcEPrcJ0TXG+VmYFMQmtB4VbcxxmKIxjbjsZ7mM1S+pNwy4rzMb2JByOCzq46gmq+kvB7eEXRy/DKg7DMHwQtOjptzBXpsgQOrh1AVscunjLmRaq6sGdd6bV0m9NfQGB6mPG/aXn8Lv2cXb4i2pcoOJiLU26Uhjl0AIfR1Y0jfBocNYj/YIZrYtV+JSV/G/ujRJHehHYcropNTdR3LycnLS5IxpMbzlcZ4OvmJiqtuoE2VCmHb1mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20er011i6JbkwrvhazQWWXEolHqRlNhQ3XL9Kz6ut2M=;
 b=Y1mwhhfnUc5TxvyfgAytRm3v1/UxQuDCfpVVKw93Hmp3loUxqhBDYQb34Ux+fppXxRhqofxSD7WkJq/iWQUu5acLUABwobfiyrq7if125zLYL+J7vLtIlN5jExqdlYmcqtFGhLZ7kQnmpHbujqf7iRtXwWh6i6mP8bkCJuGfiRFGEHuk8HoXwvyDS+LhXOh4v9rsxYBPDE2MIbhS0lk7uBzUiVJLjL3XCzUch+bzKrjwPx5iVnD5ASzct3ShaYrUV3V0Gptpl6B52HP/DQbYkyrE7BbrZ9qAPOPB2lqUjaa5xwU5avH6cQJpYuFk2FSbAzkVrRJufyNpuj3pbLmDcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Fri, 22 Sep
 2023 21:05:10 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::6d0b:5bc6:8723:593%7]) with mapi id 15.20.6813.017; Fri, 22 Sep 2023
 21:05:09 +0000
Date: Fri, 22 Sep 2023 17:05:06 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <ZQ4Bgj2ltddIq8eq@intel.com>
References: <20230921210800.170275-1-rodrigo.vivi@intel.com>
 <ZQ1N3V244SX9l71G@intel.com> <ZQ2EWcV+y46hKkDu@intel.com>
 <ZQ2OcWIPhJZiPzx3@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZQ2OcWIPhJZiPzx3@intel.com>
X-ClientProxiedBy: BY5PR17CA0056.namprd17.prod.outlook.com
 (2603:10b6:a03:167::33) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: aff9911c-bb15-4a0f-8b7b-08dbbbaf9ae7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z0HaoXWt+viaBDdHKL5EFa6F9MTfAeN/NVaA6GSzK9sNzwYtjOtKOwHlVHqG6OKB0vVaHt3cOzl+/K8iRWCCMqJmqrCwdDo3zDxwP//XOCDVnEe7OESxydLdQLNUMWImkLH7iv/6CvMQn2klBDUt4T5T39ut37EaRwN9uDsgXwJ45VrLnkVIib9FDt7ecvEI2+fNDKGWMzuNsLP6aeO3cXlPUO74Q4J2FEuwseJ+elduU2Zr59Z+KCMUTMf6Zc+d7YfvpKzKV4lCsHxxXGnEMl4ZB0j4w1vFnb21cWWtRXiBT7CUUvhE3TnVf1rz4CB53oSb/Nagv3iOnyD/zAefGYgCzBfU/c75a5ifFJmhZXhCIu/j2fac4o/PqwYCgKic/yo6Uq1+upW8hY5hhyc9YnFemgNoKriX6Vo5sV0k1GKeng37CnEeSSippIJF6/NfqK/nWjLBL4Rbsg1Veydzlv0tJMgMPd6WHAIWKzEn8nA9D7H8uLV4yn26QZjBxj410+dRnjgVEMkwgA7jL6+yaX15thrNzQmb/hRbS8sRj1+LOUR5myHIciNSB/+7y5otKNMlnmwKVbgJZAuByfbGysvxf/LbL01gj4dru2zRXCE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(136003)(376002)(396003)(366004)(451199024)(186009)(1800799009)(6486002)(6512007)(6666004)(6506007)(83380400001)(26005)(478600001)(44832011)(6916009)(2906002)(2616005)(41300700001)(66946007)(66556008)(316002)(66476007)(4326008)(5660300002)(8676002)(8936002)(82960400001)(66574015)(36756003)(86362001)(38100700002)(21314003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?VAZq1jFW+LqtTGfwwODyKFhohe7D1yqpiS0euXXNWY6l4WFB43CB3v4te4?=
 =?iso-8859-1?Q?LtRyd/NzoRe+kLQLRRzgCZPuxAKoA10SQySabttzHQSK5mvk9G+xFfOry0?=
 =?iso-8859-1?Q?PydXg8rChjVv6FWVO77Ab6WqUrZGOHtDgwmaLGL3qGXudTRE1EzfHJrUz7?=
 =?iso-8859-1?Q?SQA6F4TTB5MjkZZc4kGCJWIWfW+zxCkCb9CUI7T23XrLB5UFAxXJKHpSN5?=
 =?iso-8859-1?Q?iCjcGObr6Z1lMiV068P969k9He87rR2snIiH+YDswjsuShxCYTbRNrbCsS?=
 =?iso-8859-1?Q?LyoraXwV2xCUZhd8kHtA5AuKR38c1FyKUGbdDvuoklwt/o0rfxbRkCqhV0?=
 =?iso-8859-1?Q?W2datGcpJGlw2f0OnanHTjA/qZW3eVjrL/BTmVPPlga2/PU5TPfi8N2sMu?=
 =?iso-8859-1?Q?3Q6CYF4Epzt/IXAO0M7sb3g76CZPQqnrtgWrrribMsOKRFeTn0Dnp9/gbH?=
 =?iso-8859-1?Q?TWXSVbpk5zOi15ThFJe79d2tbpp2ztyB6rfOtAdeH7iUvLZ/DHoVdbISEz?=
 =?iso-8859-1?Q?IIIFU+ojjXAXmEX55af+CJ16DD186gc4qMIlSswqZgJcsPVjg+xFgx+cUc?=
 =?iso-8859-1?Q?d9vQwOtAn4JmPYtiR/tEhzO46hXDPmBATtvgYM4osHbKHhFYyAWZjNUKEH?=
 =?iso-8859-1?Q?aHbb+iDGfsa+LAbb4ASf0JjhET42KGut8zVk3ZNjVbMYJZE5VPR1MIUcbD?=
 =?iso-8859-1?Q?FYYdNPRzcgLH7hFLqMvkZZednHycb7j3M6kWcFxbBO5rbdC35/8BSZkZ04?=
 =?iso-8859-1?Q?uQSHTEwE2TbR6Xha9EAl12U+lLSD4kaKKfdF33fxhhUaZcVaVdwVh4fMHP?=
 =?iso-8859-1?Q?2UtX+jEzUyzqPlS9WdvFyZG8oG1n8XaQQE6tTztphVYwANjHpKtfoYWkhZ?=
 =?iso-8859-1?Q?Gd15+XQxZiP51JIuRcZIac+1w/FZB9EpF5PW7a+6NeLnAy64acClID4SVI?=
 =?iso-8859-1?Q?ghkCk5uvm/eLjcTPPtLQdY4wULd1jc27zkqXEZLAQEluFVY4rHcplHNpWO?=
 =?iso-8859-1?Q?yPCEBOELZrFIcnLuOuE3sQQ1d4N+DU7BF2AXz8GYBxi7FEjOZDFNXGddGf?=
 =?iso-8859-1?Q?GBKGtC5yRfOwTsLuz6VMQ4mMtuWBky1IG4QKccIVGCI7XN/c7Gdf/RA2R5?=
 =?iso-8859-1?Q?OnqhL65LSY3CTE8Z4tvyErMNZWc2A/dSeCTbdpvjqe0/PoHUYw4xE/UHE0?=
 =?iso-8859-1?Q?rww9Rmm5OsxmYHV45+wBPB+ITLiqL9X8m+IjpGyBi5x+4OH2rQXJ8pV9Ce?=
 =?iso-8859-1?Q?do4nYLgzJovUlPiUZKEpbCOSGXhPCYMJxiADL/Sj+xffYf/SBCs75jWHrK?=
 =?iso-8859-1?Q?UYR6Ty9pRDuJnjjTfD00nq8Jq/qxBREIO8+1Fo6k3n1UaeND3We7DK/EVK?=
 =?iso-8859-1?Q?5I+2yik+kWHIgEiISZwy4Os9pNsa4nvRNYFw/cfhLJCPxRgENqpFlUjxFl?=
 =?iso-8859-1?Q?ojhhVYmbJ5NQI5F7ORTALwGrM9KpHER2A4q4swqK1QyLOCuD0qQ9Ool86N?=
 =?iso-8859-1?Q?srFT+CANitGQLMn8VIYgOr4+Kj27nv/kEnWjh2sdLQQYSiot1PXiIqX1eu?=
 =?iso-8859-1?Q?uguqlDwAoxFPY0uhU/TPJsiEDZtivgwnIa+wlxCx+RcqOXgw5OHXixyCqI?=
 =?iso-8859-1?Q?Ilj/GwV+jhJ2gka/i3MGQwJ2/v3Gw2ZOD+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: aff9911c-bb15-4a0f-8b7b-08dbbbaf9ae7
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 21:05:09.9318 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rUE2o4qWMxERjHdAdXJYF0ZWd+1MREYMwHqgIqmTJbI2fDPzgdO+EIxZqD1UYWXMLVUFNekZQCffZdNAqUDiww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 1/3] drm/xe: proper setting of irq enabled flag
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
Cc: Ohad Sharabi <osharabi@habana.ai>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Fri, Sep 22, 2023 at 03:54:09PM +0300, Ville Syrjälä wrote:
> On Fri, Sep 22, 2023 at 08:11:05AM -0400, Rodrigo Vivi wrote:
> > On Fri, Sep 22, 2023 at 11:18:37AM +0300, Ville Syrjälä wrote:
> > > On Thu, Sep 21, 2023 at 05:07:58PM -0400, Rodrigo Vivi wrote:
> > > > From: Dani Liberman <dliberman@habana.ai>
> > > >
> > > > IRQ enabled flag should be set only after request irq succeeds.
> > > >
> > > > Reviewed-by: Ohad Sharabi <osharabi@habana.ai>
> > > > Signed-off-by: Dani Liberman <dliberman@habana.ai>
> > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_irq.c | 8 +++-----
> > > >  1 file changed, 3 insertions(+), 5 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> > > > index ccb934f8fa34..f98aa1f06c8f 100644
> > > > --- a/drivers/gpu/drm/xe/xe_irq.c
> > > > +++ b/drivers/gpu/drm/xe/xe_irq.c
> > > > @@ -590,16 +590,14 @@ int xe_irq_install(struct xe_device *xe)
> > > >  		return -EINVAL;
> > > >  	}
> > > >
> > > > -	xe->irq.enabled = true;
> > > > -
> > > >  	xe_irq_reset(xe);
> > > >
> > > >  	err = request_irq(irq, irq_handler,
> > > >  			  IRQF_SHARED, DRIVER_NAME, xe);
> > > > -	if (err < 0) {
> > > > -		xe->irq.enabled = false;
> > > > +	if (err < 0)
> > > >  		return err;
> > > > -	}
> > > > +
> > > > +	xe->irq.enabled = true;
> > >
> > > Why does this even exist?
> > 
> > I had tried to kill this, but then I noticed it was needed
> > for i915-display.
> > 
> > @drivers/gpu/drm/xe/display/ext/i915_irq.c:
> > 
> > bool intel_irqs_enabled(struct xe_device *xe)
> > {
> >  	/*
> >          * XXX: i915 has a racy handling of the irq.enabled, since it doesn't
> >          * lock its transitions. Because of that, the irq.enabled sometimes
> >          * is not read with the irq.lock in place.
> >          * However, the most critical cases like vblank and page flips are
> >          * properly using the locks.
> >          * We cannot take the lock in here or run any kind of assert because
> >          * of i915 inconsistency.
> >          * But at this point the xe irq is better protected against races,
> >          * although the full solution would be protecting the i915 side.
> >          */
> 
> None of that really makes sense to me. It's a single boolean so locking
> is pointless.
> 
> Hmm, I guess we are using it for runtime pm to make sure we don't
> try to access the device when it's asleep. But that should only
> really happen if we would be using a shared legacy interrupt.

hmmm.. should we change those cases to use pm_runtime_suspended kind
of check then?

> 
> And the other user is the power well pipe IER/IMR initialization stuff,
> where I suppose we are trying to not unmask/enable the per-pipe
> interrupts if interrupts in general are supposed to be off. Though
> the higher level interrupts should still be masked off anyway
> so not sure that is actually required except to maintain 100% state
> in all irq registers.

hmm... good point. should we then ensure we are only checking that
for legacy?

> 
> Everything else just looks like asserts to make sure we haven't
> screwed the init/resume/etc. order too badly.

yeap, I honestly couldn't make sense on why in many of them, but
it looks the case.

But with all of this in mind, the comment here indeed is not good.

But anyway, it is not related to this series. While we don't change
or remove the need for that check, this series looks correct to me,
so I just went ahead and pushed it.

Any modification on the irq.enabled should be a follow-up.

> 
> > 	return xe->irq.enabled;
> > }
> > 
> > 
> > >
> > > >
> > > >  	xe_irq_postinstall(xe);
> > > >
> > > > --
> > > > 2.41.0
> > >
> > > --
> > > Ville Syrjälä
> > > Intel
> 
> -- 
> Ville Syrjälä
> Intel
