Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1088DCA0EC0
	for <intel-xe@archiver.kernel.org>; Mon, 11 Aug 2025 08:31:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC97A10E396;
	Mon, 11 Aug 2025 08:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="IYmABeC5";
	dkim-atps=neutral
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0083C10E396
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 08:31:11 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-459ebb6bbdfso25618685e9.0
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Aug 2025 01:31:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1754901070; x=1755505870;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/qhj6VYgT7H+jqBCdnSt7pwyU3P2IpV6h0XAGx27x40=;
 b=IYmABeC5fecRbuF5Sl4Y6S2R674gHnZ5tSv41CHpphpRLDGzeUBQunLmwOvTvzk4gf
 fvLxGMPLz1CahBDOhdk2X/6+vgjh8hs0DUSq618//8DfVgUMD03FII6Vf1pwKc2NY8SB
 IzPJfgujf977padQcDb/EyFcdU1Wg0SrsYq7TEihFB/a4YSMHdB0AiIhcyXWZAsovmgP
 wSoQC/YnBRbhmqrnoQuB3BS1xwcWl1DTnfOBXCq6Se+hVXU/5A3AihWx8Qfjt8EW28Sq
 uelsILVRzVQWRQtsNmsGEou7q7kmqKK8C9Jf8laMa57X0uoegePnyTXBpnCOajcNBdRX
 fjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754901070; x=1755505870;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/qhj6VYgT7H+jqBCdnSt7pwyU3P2IpV6h0XAGx27x40=;
 b=QRIA3t769Bj4/XrkGZRxcBN3DG7pDzEDVEO1pqIrjggsHwpNrgSCyhj6rUZxgFVrr+
 3l6yExKtFZalLnzOH62e0elvKMYz19dgr4MD5PpW9KiGHTuc3ETiO2AJuCqDabb0RZtj
 utM8szwi6sAtmLwVNS72p2+P+nf/Jd0trz4k/MK9PNBFhrLUtpgA402NeFJkTIVcixuu
 fdAvWrxASrqJj/VCKlPTO/gzn4DnG0hHghfXeOFViJuWjngWBkBWAF+cDMN9WMQWkiLL
 GvMUiPArHbuoFmayhq6i9Lx08Yonz7qPotj3y3AG4ca4BCXJGxOdWwMBlubLeKzHcb7S
 CW5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWMnxDDxM5uyf3S+bE7ydDd0/7KJ44rkBoug5dpJFMkx0zc2DeGI3yAVzFd8y0Q1dLzlJtSXpxjBg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwEtVq3ZvnlnR682rPDsDwruH769R2UCzqt0PLNd0le4EyaJ0kW
 iwN/0Prn5i83RTxwvkl5fHz8n9h2H/ABJd3J7t+5NKcNs+ZnrcoXP5fj1jJRXZwQQkuCmlJzY5u
 OBLVJ
X-Gm-Gg: ASbGncvpLg+3dpNcM28G409yKYux21w4HvQU5hw2hO46TzhIln4iIuJd4bl7jQNqDeM
 6fRMhJTPzg4/vRRFDEZDu5+EgHIJ3Xr1jDzgMZCUtQwoKHC2z5WGIaZSF9huW2PseX+FcdbxUPu
 uD0Nzy8DTnsW3/D7Rh8KPuH9lJUGbZc4fuIilc/Ls6HqcGsSpSeXbJDnyYMA6ogF9oOwVJ9RuOI
 JbJ+B9MgRG8hQdk75C4tV+3oysLaDZlU1oD85OvUstGNHBduWURgXsULK+LHfo/fXj7e9Q4QBVu
 a0nbp3aTLQ9bbZwxYBllEPyUnMEZ2WkWyw7gy3A3RmcCZcL9u2ZSh+aMV9RMNe2Kq7rLYx3qyrl
 nbikDm0hF2YDPFOba97LlsK3FXJk1B2EtDcY=
X-Google-Smtp-Source: AGHT+IFn23PaWk3PQnrIPkf6ZCopOeH/Zus2huh2KXr0Dv+cdMktIF1IwrcEhxzOFeH+N0kvucBgZg==
X-Received: by 2002:a05:600c:4589:b0:456:fc1:c26d with SMTP id
 5b1f17b1804b1-459f4f3f430mr107334605e9.2.1754901070107; 
 Mon, 11 Aug 2025 01:31:10 -0700 (PDT)
Received: from [192.168.0.101] ([84.66.36.92])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-459e5c84b8csm135992585e9.4.2025.08.11.01.31.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 01:31:09 -0700 (PDT)
Message-ID: <5339ecf6-05f7-4714-8032-c0508259f4a5@ursulin.net>
Date: Mon, 11 Aug 2025 09:31:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] Use DRM scheduler for delayed GT TLB invalidations
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org
References: <20250724191216.4076566-1-matthew.brost@intel.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <20250724191216.4076566-1-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 24/07/2025 20:12, Matthew Brost wrote:
> MIME-Version: 1.0
> Content-Type: text/plain; charset=UTF-8
> Content-Transfer-Encoding: 8bit
> 
>        Use the DRM scheduler for delayed GT TLB invalidations, which properly
> fixes the issue raised in [1]. GT TLB fences have their own dma-fence
> context, so even if the invalidations are ordered, the dma-resv/DRM
> scheduler cannot squash the fences. This results in O(M*N*N) complexity
> in the garbage collector, where M is the number of ranges in the garbage
> collector and N is the number of pending GT TLB invalidations. After
> this change, the resulting complexity in O(M*C) where C is the number of
> TLB invalidation contexts (i.e., number of exec queue, GTs tuples) with
> an invalidation in flight.

Does this series improve the performance of the TLB invalidations in 
general?

I am asking because we are currently investigating a problem with Google 
Chrome which apparently suffers a lot from latencies caused by TLB 
invalidations piling up after a lot of tab switching causes a lot of vm 
bind ioctl activity.

Also, is it related to 
https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2162 ?

Regards,

Tvrtko

> Admittedly, it's quite a lot of code, but the series includes extensive
> kernel documentation and clear code comments. It introduces a generic
> dependency scheduler that can be reused in the future and is logically
> much cleaner than the previous open-coded solution for delaying GT TLB
> invalidations until a bind job completes.
> 
> v2:
>   - Various cleanup covered in detail in change logs
>   - Use a per-GT ordered workqueue as DRM scheduler workqueue
>   - Remove unused ftrace points
> v3:
>   - Address Stuarts feedback
>   - Fix kernel doc, minor cleanups
> v4:
>   - Rebase
> 
> Matt
> 
> [1] https://patchwork.freedesktop.org/patch/658370/?series=150188&rev=1
> 
> Matthew Brost (7):
>    drm/xe: Explicitly mark migration queues with flag
>    drm/xe: Add generic dependecy jobs / scheduler
>    drm/xe: Create ordered workqueue for GT TLB invalidation jobs
>    drm/xe: Add dependency scheduler for GT TLB invalidations to bind
>      queues
>    drm/xe: Add GT TLB invalidation jobs
>    drm/xe: Use GT TLB invalidation jobs in PT layer
>    drm/xe: Remove unused GT TLB invalidation trace points
> 
>   drivers/gpu/drm/xe/Makefile                 |   2 +
>   drivers/gpu/drm/xe/xe_dep_job_types.h       |  29 +++
>   drivers/gpu/drm/xe/xe_dep_scheduler.c       | 143 ++++++++++
>   drivers/gpu/drm/xe/xe_dep_scheduler.h       |  21 ++
>   drivers/gpu/drm/xe/xe_exec_queue.c          |  48 ++++
>   drivers/gpu/drm/xe/xe_exec_queue_types.h    |  15 ++
>   drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c    | 274 ++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h    |  34 +++
>   drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c |   8 +
>   drivers/gpu/drm/xe/xe_gt_types.h            |   2 +
>   drivers/gpu/drm/xe/xe_migrate.c             |  42 ++-
>   drivers/gpu/drm/xe/xe_migrate.h             |  13 +
>   drivers/gpu/drm/xe/xe_pt.c                  | 178 +++++--------
>   drivers/gpu/drm/xe/xe_trace.h               |  16 --
>   14 files changed, 700 insertions(+), 125 deletions(-)
>   create mode 100644 drivers/gpu/drm/xe/xe_dep_job_types.h
>   create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.c
>   create mode 100644 drivers/gpu/drm/xe/xe_dep_scheduler.h
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.c
>   create mode 100644 drivers/gpu/drm/xe/xe_gt_tlb_inval_job.h
> 

