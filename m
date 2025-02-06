Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1751C02198
	for <intel-xe@archiver.kernel.org>; Thu,  6 Feb 2025 08:15:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF2CB10E7F2;
	Thu,  6 Feb 2025 08:15:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rqf0alQy";
	dkim-atps=neutral
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26F910E7F2
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Feb 2025 08:15:56 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-435f8f29f8aso3706105e9.2
 for <intel-xe@lists.freedesktop.org>; Thu, 06 Feb 2025 00:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738829755; x=1739434555; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nxbj2IcFFKAU54DBBuw1L2zGhKHBZToZLrRcIRcgN/o=;
 b=rqf0alQy7fjT6de1bePqmWWwfVGqYLgJyoY6QFraCU0UaF6XUoWJJ6cx/1Scn2cG0h
 4u9g7fKxaZ1ePVOZND7rlWQJKOXJvAkxKG5aJoFf0EHafBwefXoj5m/gv9R2a4/nDg20
 0150JSOYh8hpXnNRv580qmZfBcw5NUdINJ7qtgzjQ45cHfAdScwfx69lxgtgFbjYayBv
 2LAL6AHHVfrCiS7cqT+xRDi1LMrd7Bw7HIIPYFM3mdDRVRCzdoADyo+1ncp56gtEgiGy
 VpHmJxla+RHwnlPsDXqjNxE3QBqCnBYJjOzQH3BpY9J65B5Md38MPslwSO61Wn7qMXGf
 LyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738829755; x=1739434555;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nxbj2IcFFKAU54DBBuw1L2zGhKHBZToZLrRcIRcgN/o=;
 b=N1y2DQblcxmJDv4gJwjbetbVDLfef2+atZAoHU8F+zcpxmfOsdWPZKeXeeFeuoBGiq
 mg1/C6hYmnBEusYchOmtevKxCc/oReq0zdLJyrZ6YrR7qdBn+prJGsZ2zwRFoe7vk96Y
 7oMNRWdgznBBt3g8k+asHFqVsFSHw1+yVCztXOy84Uw/kSUQzJILfpOdaiGYIN4FlHR/
 5+4s7ncOw1CZUl2H90dehXOe3y/H1ZokxyN9eSdodEp6nDBKHjhN2/g43yUpOw0M2N/F
 uS23sSuHIBfExeh8+EkyXKxAD2ve/NzAhk51KkoDTjpkRxZgeJq7ZqANK+U1QW0h6RdO
 FmnA==
X-Gm-Message-State: AOJu0YwnAifNOtn+JL57ViE5GeUlZT/BJOcSnXvkDDwfXNF1lpuN4aOd
 rbEdDjKRraKYqN5r2ajeywDjrGlxp1FN2dbkuF8eGurT772ffbWSuaXDkbp7+4s+k4ngk7Meoue
 B
X-Gm-Gg: ASbGnctfY30V4IeUBChwO6uv9cMeDHcBf9TGzCAHJFWoknAc6C/mpIc40x17uduuVj4
 8axu5OpIQhT1HSnY/d9ACau+1QYofU5ChwRZkhGEGgmQNRRvySSm0dL6QfZ1mCFbIByUN/wd1vy
 uWt904baCTEAH1vrDoWObYVw1UCvFSkms5PY1XgTZhryolAeX0nz2MMbItVdshOhnLBbPT/CpjN
 VTsYR1iHEJqM/YjjNcAL2ayK+PlC/8okfVQ54HzBb0PfJrWPHIRkr46cuxpliURMlhluwTflmXS
 ElqW03oK4AybBomqlKni
X-Google-Smtp-Source: AGHT+IFR8c3i9inMPhqhljZ6KDGQqPP2KCy/51q1O8dpAnWvGrS+DF50wmc29NvIozK1nn8GSgAoPw==
X-Received: by 2002:a05:600c:1f85:b0:436:1aa6:b8ee with SMTP id
 5b1f17b1804b1-4390d42d8e4mr46209495e9.2.1738829755394; 
 Thu, 06 Feb 2025 00:15:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4390d94d40csm46775175e9.9.2025.02.06.00.15.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2025 00:15:54 -0800 (PST)
Date: Thu, 6 Feb 2025 11:15:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/pxp: Add PXP queue tracking and session start
Message-ID: <34aaced9-4a9d-4e8c-900a-b8f73452e35c@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello Daniele Ceraolo Spurio,

Commit f8caa80154c4 ("drm/xe/pxp: Add PXP queue tracking and session
start") from Jan 29, 2025 (linux-next), leads to the following Smatch
static checker warning:

	drivers/gpu/drm/xe/xe_vm.c:286 xe_vm_remove_compute_exec_queue()
	warn: sleeping in atomic context

drivers/gpu/drm/xe/xe_vm.c
    281 void xe_vm_remove_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queue *q)
    282 {
    283         if (!xe_vm_in_preempt_fence_mode(vm))
    284                 return;
    285 
--> 286         down_write(&vm->lock);
    287         if (!list_empty(&q->lr.link)) {
    288                 list_del_init(&q->lr.link);
    289                 --vm->preempt.num_exec_queues;
    290         }
    291         if (q->lr.pfence) {
    292                 dma_fence_enable_sw_signaling(q->lr.pfence);
    293                 dma_fence_put(q->lr.pfence);
    294                 q->lr.pfence = NULL;
    295         }
    296         up_write(&vm->lock);
    297 }

pxp_invalidate_queues() <- disables preempt
-> xe_exec_queue_kill()
   -> xe_vm_remove_compute_exec_queue()

drivers/gpu/drm/xe/xe_pxp.c
   699  static void pxp_invalidate_queues(struct xe_pxp *pxp)
   700  {
   701          struct xe_exec_queue *tmp, *q;
   702  
   703          spin_lock_irq(&pxp->queues.lock);
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

   704  
   705          /*
   706           * Removing a queue from the PXP list requires a put of the RPM ref that
   707           * the queue holds to keep the PXP session alive, which can't be done
   708           * under spinlock. Since it is safe to kill a queue multiple times, we
   709           * can leave the invalid queue in the list for now and postpone the
   710           * removal and associated RPM put to when the queue is destroyed.
   711           */
   712          list_for_each_entry(tmp, &pxp->queues.list, pxp.link) {
   713                  q = xe_exec_queue_get_unless_zero(tmp);
   714  
   715                  if (!q)
   716                          continue;
   717  
   718                  xe_exec_queue_kill(q);

We can't call xe_exec_queue_kill() while holding a spin_lock.

   719                  xe_exec_queue_put(q);
   720          }
   721  
   722          spin_unlock_irq(&pxp->queues.lock);
   723  }

regards,
dan carpenter
