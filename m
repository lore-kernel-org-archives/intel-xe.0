Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A87EEF320
	for <intel-xe@archiver.kernel.org>; Thu,  5 Mar 2026 08:35:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F64D10EB90;
	Thu,  5 Mar 2026 08:35:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin.net header.i=@ursulin.net header.b="Jo4b4tkz";
	dkim-atps=neutral
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA8D10EB90
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Mar 2026 08:35:36 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-48375f1defeso58337695e9.0
 for <intel-xe@lists.freedesktop.org>; Thu, 05 Mar 2026 00:35:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin.net; s=google; t=1772699735; x=1773304535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AJ7kziCJmU6DUEFzVrbnl92aleDcq4bLewZp19FKNx8=;
 b=Jo4b4tkz68UIcJ30qezHMxoPkthgAWvT3VhEIgKbG+HId/WwbA2q1+FH/E0lgs+lY4
 6bJXNYe3f9c0KkIfRdrFpFI5d1QJp3xY5q7AMqzFjZ+5Tt+PnED06FWbT+SeRP/oASjo
 BJcU6gaK5PO3YTWCuBmlAEZNbNf9Z5P9euT4mRXg0BNqufzfnuccMH7jj0QHlrM3UDKJ
 80iUQrMmbHXCWleZLSfM/RAYR/FpPj662hH8wvIFl9/2AB2wcrmaWIEihKb9UhBqB85Q
 5rqMvbfHwoUqWzzOQ8NsoghI0NbRR4LzEXjbL4frDCgs48bf7m2MBR9ydZYWdN0aJ3q2
 kJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772699735; x=1773304535;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AJ7kziCJmU6DUEFzVrbnl92aleDcq4bLewZp19FKNx8=;
 b=PVSGWBgccPXeimW7JZbf4kt3xYjmlbIQMfac1lbur3g4WLxnXSNOVbSAQ5SJXtFvDB
 N5KzVkEFknbP0e8812nAjN36drmQBOwh1cA2GMyv4CnOfNQl9HQ8HMaFEcYNZu2XAJuU
 tr/cMWsJcb4QIYbGNVhwgCMdvUwpbtD78RL4yaSNrhhaMmvMzFfAlDLW7CiCVzPhcwY4
 QRuqxa6IfbsSXmDhMONyOGEhIdTV+fuvJpuLS/a78mOEoCqiTOVgg+cxymzWVJ4W3jot
 KCZb15ZYbPzvuYoWkFl4EUe9RR9m1aUaueQoYdwEp2LlNaDikumMf2BbFwJLW/y6id2z
 LbRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUR28CV/K6IcArc0rNk6GRWg/RnAiM01E/oU04Wq5vC/Iugf7wLg80rdeKOdxfEJnyRsyPOPVBFg==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwJVdKwubA90/8tVQT7OvQNC6umONNBy7Br+2vcmCxEOfmRwOYw
 ze77QEx4FLVq+jnBMhviKTlcdpX/pxdrdnq71bY7BvF+UJTNbPOOuB1iIgGryX+ZTXc=
X-Gm-Gg: ATEYQzzFJWtCdyY+3fvzyqFb6UNa/mUX0sWp+ZY781kLrleCfCw6JFQUQ3sVMR8RGSs
 ARchAV69X9eflvqv9+OaL1fS/dA199rOezBGtMsjmNi9SsshQ1dKTj157m8pxno9/+4jd23cCVs
 NwaS8aor8/t+Y6hcNOzzLxblO/qvRuUS0HyvUSVKYKergVJWeMoDKeWE9XvYgpyNpQ+daw8oFS8
 7C2lChmeAFLpsGbHv4kXkzVt9q5513+UeSm8ON8noSjTOyr8Q5MW/1UN7cvaQTx2bZj/LZltQqz
 6/qUFhDFAqBhqPuMJZLEdfkBoKatE+ECxxm6x3dvUrr4MOjmL9/Ad/BZZTi2mhqY6cn0P/xtZD/
 Aj4DIZPDasZFcqET8zU0sGiWd92HRM8nZl+/B2LPydwqLliFEC6vGE5YXXwB4u/J6HjDHjsYSq/
 p8EJ7jcE1Ni1gePiqG2PTAJoDhYXJs1IS3MIBptDci+/8N
X-Received: by 2002:a05:600c:a07:b0:47f:b737:5ce0 with SMTP id
 5b1f17b1804b1-4851988f31dmr81915425e9.23.1772699734857; 
 Thu, 05 Mar 2026 00:35:34 -0800 (PST)
Received: from [192.168.0.101] ([90.240.106.137])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4851fb27a20sm57635465e9.9.2026.03.05.00.35.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Mar 2026 00:35:34 -0800 (PST)
Message-ID: <bbe1f0bc-60df-4930-b9ea-ab98747ea807@ursulin.net>
Date: Thu, 5 Mar 2026 08:35:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: drm_sched run_job and scheduling latency
To: Chia-I Wu <olvaffe@gmail.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 intel-xe@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 open list <linux-kernel@vger.kernel.org>
References: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <CAPaKu7RbCtkz1BbX57+CebB2uepyCAi-3QzBy8BDGngCJ-Du0w@mail.gmail.com>
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


On 04/03/2026 22:51, Chia-I Wu wrote:
> Hi,
> 
> Our system compositor (surfaceflinger on android) submits gpu jobs
> from a SCHED_FIFO thread to an RT gpu queue. However, because
> workqueue threads are SCHED_NORMAL, the scheduling latency from submit
> to run_job can sometimes cause frame misses. We are seeing this on
> panthor and xe, but the issue should be common to all drm_sched users.
> 
> Using a WQ_HIGHPRI workqueue helps, but it is still not RT (and won't
> meet future android requirements). It seems either workqueue needs to
> gain RT support, or drm_sched needs to support kthread_worker.
> 
> I know drm_sched switched from kthread_worker to workqueue for better

 From a plain kthread actually. Anyway, I suggested trying the 
kthread_worker approach a few times in the past but never got round 
implementing it. Not dual paths but simply replacing the workqueues with 
kthread_workers.

What is your thinking regarding how would the priority be configured? In 
terms of the default and mechanism to select a higher priority 
scheduling class.

Regards,

Tvrtko

> scaling when xe was introduced. But if drm_sched can support either
> workqueue or kthread_worker during drm_sched_init, drivers can
> selectively use kthread_worker only for RT gpu queues. And because
> drivers require CAP_SYS_NICE for RT gpu queues, this should not cause
> scaling issues.
> 
> Thoughts? Or perhaps this becomes less of an issue if all drm_sched
> users have concrete plans for userspace submissions..

