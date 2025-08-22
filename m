Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7243CA0EED
	for <intel-xe@archiver.kernel.org>; Fri, 22 Aug 2025 12:39:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71FBD10EAE5;
	Fri, 22 Aug 2025 12:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="CIE4qFat";
	dkim-atps=neutral
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
 [209.85.221.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BC3110EAE5
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 12:39:22 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3c6abcfd142so82500f8f.2
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Aug 2025 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1755866360; x=1756471160;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wuL0r/pqCrqC6D7rb55owgQC8xO2Vuw5gtTCizrDzXE=;
 b=CIE4qFat4rxib2mWtdZo0ESo6aa1uq5ghIO4HtDCDwHk746ln6TWlxfvoDIQjxFjfF
 DK3pSmusrSBFLN57ZpxNp7ru8wPgwNq2K4SvugtBpEs72KSAedKfhEM20vSBoqyvMGWN
 jprePjD0EizEuAF2TnpLUPx1f+VdBQqEiF5e4ySD1v6drGqaeTgRmPsX99JP9/ag9ZwE
 nRfzH0SF01HwiYYL9lQ8Lu82RO2SlJjTa1VI9fNHtalTC8jv9WPazL61RcDQqVs1w+Pw
 sK4SC0FQf6vRLvpJey5GyWQDcI5RVYM3bR/3Lx9sTp7FpquUbo8qkNXYUm2+mpeVoRqz
 iW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755866360; x=1756471160;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wuL0r/pqCrqC6D7rb55owgQC8xO2Vuw5gtTCizrDzXE=;
 b=EC3I7LiQXcYz1wSh5wUEEbe3pof0ek/wYS9ZLzieGeRwKOWZjFQYgLjXS7AIpVSfwA
 40T/mTUXEOShM5sH5IdXvErDqIHigRKyWdjTOpa3+LxCe8L8/NBNuaiNyIV7Wu8NwoQL
 x1x1stn3xVmXOaarf83VYc1Hgmg+veBH+8d7j0KXCoy6W07w1+QYTxwz/EjpxUi3sLlX
 1d05AsG74VegZUj0Cxe8/w2Y6PHmYPMP4OrHsnCt4VELmdbinHwixeEngppRVpNNM5qA
 b3YNzwx9X1TR/CKbY9R98bPkVi9CSQYBYd9rqA9JSXydi18fH4JED9utUbAOYDdXp2n3
 EqVg==
X-Gm-Message-State: AOJu0Yw2RQDIwoMZTDX8p3cn76eaT2WgUP8SsqDGXv0XcSpm1Ega4h26
 nxcp0mzX1zj0rWBcWDBOcnIFgtA2zugvz0GwTS/W/e8+bHySGP/FkGdko3EMD1oTS0t+yhwpbR9
 z7k85
X-Gm-Gg: ASbGncuaHhC7qVUNbQu0g6eFQitkRSkgiYSp8kUBcyoM8TUGcqYGybSHTgvHEvOXag8
 3FglHdDiv0MT3JvUf1iafMWD7WCBkidWE2h8XhSeFqJhJgySaikUPM1te5PcenG2Iy0ZEGJ5gzl
 a7tet0qSx0uACS8BQFfqOYGUiPbgkGVmU/UkbELlQNuxap4KojlAdLhBMSOvyp2U0LLYQpgH604
 hL62A039HpQMbMKNFJlMuEp78lC1QYbS5yev+nRTd1+f0eFpVtWMnO5hk310S0/IV63z1zhrjAI
 FU8nO2zvnqT/JpiwLyzqLDEz7S/BzGRrb3GVWJ4evOBEPjHRTlKF3EGr7r+Dvcv71ouEM4Us/V5
 wNQkzRjDTOtWVov76zENNuVIDPglmTMrWGgI=
X-Google-Smtp-Source: AGHT+IGiWn8xdg6LzsS1a9HBkgFEargsUZbAVfxcuU9fzwLJth93piKjLJRSskVnej7a2fOAxYZ4JQ==
X-Received: by 2002:adf:edc2:0:b0:3c6:c737:d385 with SMTP id
 ffacd0b85a97d-3c6c737dc22mr250616f8f.31.1755866360041; 
 Fri, 22 Aug 2025 05:39:20 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c598e067b1sm3785996f8f.59.2025.08.22.05.39.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Aug 2025 05:39:19 -0700 (PDT)
Message-ID: <d8a07019-895f-44db-ace7-1fd9324de573@ursulin.net>
Date: Fri, 22 Aug 2025 13:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Use DRM scheduler for delayed GT TLB invalidations
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
References: <20250724191216.4076566-1-matthew.brost@intel.com>
 <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
 <aJpDw9ruWXJjXg1X@lstrano-desk.jf.intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <aJpDw9ruWXJjXg1X@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 11/08/2025 20:25, Matthew Brost wrote:
> On Mon, Aug 11, 2025 at 09:31:08AM +0100, Tvrtko Ursulin wrote:
>>
>> On 24/07/2025 20:12, Matthew Brost wrote:
>>> MIME-Version: 1.0
>>> Content-Type: text/plain; charset=UTF-8
>>> Content-Transfer-Encoding: 8bit
>>>
>>>         Use the DRM scheduler for delayed GT TLB invalidations, which properly
>>> fixes the issue raised in [1]. GT TLB fences have their own dma-fence
>>> context, so even if the invalidations are ordered, the dma-resv/DRM
>>> scheduler cannot squash the fences. This results in O(M*N*N) complexity
>>> in the garbage collector, where M is the number of ranges in the garbage
>>> collector and N is the number of pending GT TLB invalidations. After
>>> this change, the resulting complexity in O(M*C) where C is the number of
>>> TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
>>> an invalidation in flight.
>>
>> Does this series improve the performance of the TLB invalidations in
>> general?
>>
>> I am asking because we are currently investigating a problem with Google
>> Chrome which apparently suffers a lot from latencies caused by TLB
>> invalidations piling up after a lot of tab switching causes a lot of vm bind
>> ioctl activity.
> 
> It doesn't improve performance of the actual invalidation rather the
> time to create a VM unbind job as it avoids O(M*N*N) complexity
> explosion. I originally saw this in a case of many SVM unbinds (i.e. a
> free / unmap is called on a large piece of memory) but many VM unbinds
> in short period of time could also cause this complexity explosion too.

You are saying it is just CPU utilisation and it does not show up as 
submission latency, or it can?

The soft lockup splat from 
https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1 is 
due drm_sched_job_add_resv_dependencies() literally taking 26 second 
beacuase of a huge number of fences in the resv or something else?

> By making all invalidations from the same (queue, GT) share a dma_fence
> context, dma-resv and drm_sched can coalesce them into a single
> dependenct per (queue, GT). That keeps the dependency count bounded and
> eliminated the SVM panics I was seeing under heavy unbind stress.
> 
>>
>> Also, is it related to
>> https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 ?
>>
> 
> Maybe. In this case, a flood of TLB invalidations overwhelmed the GuC,
> leaving it no time to do anything else (e.g., schedule contexts). It’s a
> multi-process test, so the driver-side complexity explosion likely
> doesn’t apply as this explosion is seen within a single VM. What we need
> is to hold TLB invalidations in the driver and coalesce them to issue
> fewer operations. I have patches for this, but I haven’t cleaned them up
> for posting yet—we’re in the middle of other TLB-invalidation refactors.

If you would be able to send something out, or share a branch, even if 
not completely clean that would be cool. Because I should soon have a 
reproducer for the Chrome tab switching issue and could report back on 
the real world effects of both.

Regards,

Tvrtko

>>> Admittedly, it's quite a lot of code, but the series includes extensive
>>> kernel documentation and clear code comments. It introduces a generic
>>> dependency scheduler that can be reused in the future and is logically
>>> much cleaner than the previous open-coded solution for delaying GT TLB
>>> invalidations until a bind job completes.
>>>
>>> v2:
>>>    - Various cleanup covered in detail in change logs
>>>    - Use a per-GT ordered workqueue as DRM scheduler workqueue
>>>    - Remove unused ftrace points
>>> v3:
>>>    - Address Stuarts feedback
>>>    - Fix kernel doc, minor cleanups
>>> v4:
>>>    - Rebase
>>>
>>> Matt
>>>
>>> [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
>>>
>>> Matthew Brost (7):
>>>     drm/xe: Explicitly mark migration queues with flag
>>>     drm/xe: Add generic dependecy jobs / scheduler
>>>     drm/xe: Create ordered workqueue for GT TLB invalidation jobs
>>>     drm/xe: Add dependency scheduler for GT TLB invalidations to bind
>>>       queues
>>>     drm/xe: Add GT TLB invalidation jobs
>>>     drm/xe: Use GT TLB invalidation jobs in PT layer
>>>     drm/xe: Remove unused GT TLB invalidation trace points
>>>
>>>    drivers/gpu/drm/xe/Makefile                 |   2 +
>>>    drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
>>>    drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
>>>    drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
>>>    drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
>>>    drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
>>>    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
>>>    drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
>>>    drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
>>>    drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
>>>    drivers/gpu/drm/xe/xe_migrate.h             |  13 +
>>>    drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
>>>    drivers/gpu/drm/xe/xe_trace.h               |  16 --
>>>    14 files changed, 700 insertions(+), 125 deletions(-)
>>>    create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
>>>    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
>>>    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
>>>    create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
>>>
>>

