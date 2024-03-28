Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A65BCCD11DF
	for <intel-xe@archiver.kernel.org>; Thu, 28 Mar 2024 19:40:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5209710E098;
	Thu, 28 Mar 2024 19:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Rr30Tzvc";
	dkim-atps=neutral
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 623A510E098
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 19:40:20 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-1e0d8403257so12059195ad.1
 for <intel-xe@lists.freedesktop.org>; Thu, 28 Mar 2024 12:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711654820; x=1712259620; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
 :reply-to; bh=4PSvcRRql6YkVkNUIHWJPLc8q7kBEQ6bjJgV+Sn2YcA=;
 b=Rr30TzvclQ4kN3czRfUO5iOrXEZf1qhqAF1Tv/xeFfbWsFaB5O++7EQa1EK1wZbJqt
 jdnkMxtLIibnA2bYVAHfcgUM0fg63ZgmYXH8sxf3u36Nn5tC2kHYzZwIIIfB1EwjLKdq
 p9XFhehTo78Gu/1BFm0E1bfIb3IET1+aVleyUGve0gTOBWg9NmrX6I4Ad+Oz9OL8uwuD
 6A4GnFipms08ZM8k+Q5DoKDA2VGzkMkWunvXhcUGVRjdLpqmpKUQ7rh4sB1nVVLLIwZI
 O8JwTzi5iu+4Xod/cV6wouwpeK2EGZ6nVhmHQyzNdR+irCh22T3P/Yi8QvIfH5uUgnGv
 taMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711654820; x=1712259620;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PSvcRRql6YkVkNUIHWJPLc8q7kBEQ6bjJgV+Sn2YcA=;
 b=JDbxivBIg4EXN1rT01tAQj8fMII0ArEG9yUmNYNN89FX+QOoqnMh+fXOWcDwA1iO6v
 RAfjM5Vu/ybPtudesHoGTxfKfLuNFy3suAOpagD38yYfdb53n+yXba2whXxxid1ya63w
 TDAP8NTr1WlzgIhFu7bDtq+y85BSVUo+eUDA4B6EtqC1n+wsv6fhZ6GfIqg+vhbX1HZ6
 LigjVONrW5+7v14JDqpV5uyb56h8zYqR89VlwpJ32s4fUhzvd/KJMaGeDN+Aw5FutRnL
 jBhNEUJ1Hz/jN1+arhX6/gLJSvjLuT/5ImsKD1j1JtkvbmyqRLwqqk816XXcEGxRiDWo
 JFxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWoVrqJzY2Zzw3Ebg7MXpVDJSj57JntMVFt4OTIh5egxu3XHTOXQni7/WDs89J0XNGYOIRSN2MIg0Sr21OHP88CTZeAnXU+gxZLuI+GbNI=
X-Gm-Message-State: AOJu0YzTibFM19df2tvHC2ZbaClyjVQiMXdNOyWWpdoVEz6c2vIKwHnQ
 Xk7fHSuFFVpFENOMCJmxKtuLqx45MDd3ZDqluYQj5JI37Mf4mHOL
X-Google-Smtp-Source: AGHT+IH6SLkqVKrhAdJ/Zhk/mhBRTWHoyCBweSI3ZWItr2QyU6S32JbOCwhx8hH9OzbGUEhHJNosTA==
X-Received: by 2002:a17:902:da8f:b0:1e0:b29f:4699 with SMTP id
 j15-20020a170902da8f00b001e0b29f4699mr550811plx.14.1711654819717; 
 Thu, 28 Mar 2024 12:40:19 -0700 (PDT)
Received: from localhost (dhcp-141-239-158-86.hawaiiantel.net.
 [141.239.158.86]) by smtp.gmail.com with ESMTPSA id
 x1-20020a170902a38100b001e0d9daa927sm2026808pla.49.2024.03.28.12.40.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 12:40:19 -0700 (PDT)
Date: Thu, 28 Mar 2024 09:40:18 -1000
From: Tejun Heo <tj@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>
Cc: htejun@gmail.com, Lucas De Marchi <lucas.demarchi@intel.com>,
 intel-xe@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com
Subject: Re: [PATCH 0/3] Rework work queue usage
Message-ID: <ZgXHonaCuJgnCJgR@slm.duckdns.org>
References: <20240328182147.4169656-1-matthew.brost@intel.com>
 <rfc2tu5zx5qd4sbgpd7rcqproacelziemigx5wrs7xyjmr2fb4@w6wsqxkcpvnr>
 <ZgXBcpRv_FTIoq91@slm.duckdns.org>
 <ZgXFYWuukcLjMtmf@DUT025-TGLU.fm.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgXFYWuukcLjMtmf@DUT025-TGLU.fm.intel.com>
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

Hello,

On Thu, Mar 28, 2024 at 07:30:41PM +0000, Matthew Brost wrote:
> The test creates 100s of exec queues that all can be preempted in
> parallel. In the current code this results in each exec queue kicking a
> worker which is scheduled on the system_unbound_wq, these workers wait
> and sleep (using a waitqueue) on signaling from another worker. The
> other worker, which is also scheduled system_unbound_wq, is processing a
> queue which interacts with the GPU. I'm thinking the worker which
> interacts with hardware gets straved by the waiter resulting in a
> deadlock.
> 
> This patch changes the waiters to uses a device private ordered work
> queue so at most we have 1 waiter a time. Regardless of the new work
> queue behavior this a better design.
> 
> It is beyond my knowledge if the old behavior, albiet poorly designed,
> should still work with the work queue changes in 6.9.

Ah, okay, I think you're hitting the max_active limit which regulates the
maximum number of work items which can be in flight at any given time. Is
the test machine a NUMA setup by any chance?

We went through a couple changes in terms of how max_active is enforced on
NUMA machines. Originally, we applied it per-node, ie. if you have
max_active of 16, each node would be able to have 16 work items in flight at
any given time. While introducing the affinity stuff, the enforcement became
per-CPU - ie. each CPU would get 16 work items, which didn't turn out well
for some workloads. v6.9 changes it so that it's always applied to the whole
system for unbound workqueues whether NUMA or not.

system_unbound_wq is created with max_active set at WQ_MAX_ACTIVE which
happens to be 512. If you stuff more concurrent work items into it which
have inter-dependency - ie. completion of one work item depends on another,
it can deadlock, which isn't too unlikely given a lot of basic kernle infra
depends on system_unbound_wq.

> > > I think we need some of this information in the commit message in patch
> > > 1. Because patch 1 simply says it's moving to a device private wq to
> > > avoid hogging the system one, but the issue is much more serious.
> > > 
> > > Also, is the "Fixes:"  really correct? It seems more like a regression
> > > from the wq changes and there could be other drivers showing similar
> > > issues now. But it could alos be my lack of understanding of the real
> > > issue.
> > 
> > I don't have enough context to tell whether this is a workqueue problem but
> > if so we should definitely fix workqueue.
> 
> It is beyond my knowledge if the old behavior, albeit poorly designed,
> should still work with the work queue changes in 6.9.

So, yeah, in this case, it makes sense to separate it out to a separate
workqueue.

Thanks.

-- 
tejun
