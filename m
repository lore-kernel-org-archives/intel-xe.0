Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5947C3DA4A
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 13:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E4D10E7D3;
	Tue, 20 Aug 2024 13:27:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VQ21Zkbp";
	dkim-atps=neutral
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96BE010E7D3
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 13:27:29 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-a7a9e25008aso686062166b.0
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 06:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724160448; x=1724765248; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xkCQava2rvR/cK3tyz2qBcX3Ik6uJY5FdELUjFIBFrU=;
 b=VQ21Zkbp4C0xPJaNZOf2od0xphKrIuYJUCgRw2QXKdpzTvD/cyPjzuAhbiCVVGQd8b
 BY2aDvjivY5N421BFgKyQdAIeTQ+2Jx6o1azoi0rM9tLUs6CikktH9JdKHqDc0f8cigo
 uTSbY9S2GVSd/jYt6Kiq1U2gJXg2LgRak63mWmbdPakM7NroaX5xmXSOPb0N7LDQz4Ny
 XjNqI77CFf21ttNAhbUgyxPjnmK5dBWy3k7bh0bXJQlP++NjkElvpKdnBsirJV3+/tPE
 eroSWXYpSplVuyFb2tRSrZb7DUn+Ds1goTeC/2pGKNjrv6kUyyqKHxHDvx900O8D9ayE
 r2og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724160448; x=1724765248;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xkCQava2rvR/cK3tyz2qBcX3Ik6uJY5FdELUjFIBFrU=;
 b=o0bSD6ws65jMsZH/Bp8uphbrQCKLoZ5lE9LlzW0vYadwA/pvVU96B/sVwNv/mR+WRi
 1x71CSqLzqsIAT+f2vWIw1AT+ZNyqKYW8hGhdwYglYCP6zS5FgcmEoqczqNh/Et0eGpS
 mb9VGbh0Wyw6J+7X5TBJCXvx9ZGBVHSwKKDp7kHpWrCFi2/baH32qDEOtQdjOBGT8O3g
 X4u6/BnkPeFKh8nAtENqHZp9LJqV7Mw3dKDMFLVmCfFJScz0OVsPx+7HhSNxU4Q15pBI
 4wgguL60cBpVp9dAitwLRcPtlT2kvXERhRMsuQM2bGUtELP5NWcxXSKyTEIJFIhg+KLg
 wTJQ==
X-Gm-Message-State: AOJu0YxRGSd7KKCcavyU+UZD/KnKIKYFCIO1ehzQelrhnESf9gdd97tJ
 epHxMQoRiUgsLxjX0Xv/WFbz7etUeyNiYc5j1P+B2Cl0+jCBiCSJYPGGnPdkTj/p9KHTdxk6NNk
 G
X-Google-Smtp-Source: AGHT+IFvAnvl0n9Qq7bF3XAND+pAVJS6NPk333JhpYL8VpPzxR30WecWL4Nz+IdGah3YMCutKLUbBw==
X-Received: by 2002:a17:907:f1dd:b0:a80:7c30:a82a with SMTP id
 a640c23a62f3a-a8392a4ba22mr1023040266b.69.1724160447711; 
 Tue, 20 Aug 2024 06:27:27 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8383934508sm765679466b.101.2024.08.20.06.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Aug 2024 06:27:27 -0700 (PDT)
Date: Tue, 20 Aug 2024 16:27:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Francois Dugast <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] 'drm/xe/hw_engine_group: Register hw engine group's
 exec queues
Message-ID: <30223f25-dfdb-402a-b8eb-4962edf8b546@stanley.mountain>
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

Hello Francois Dugast,

Commit 7970cb36966c ("'drm/xe/hw_engine_group: Register hw engine
group's exec queues") from Aug 9, 2024 (linux-next), leads to the
following Smatch static checker warning:

drivers/gpu/drm/xe/xe_device.c:171 xe_file_close() error: we previously assumed 'q->vm' could be null (see line 169)
drivers/gpu/drm/xe/xe_exec_queue.c:649 xe_exec_queue_create_ioctl() error: we previously assumed 'q->vm' could be null (see line 630)
drivers/gpu/drm/xe/xe_exec_queue.c:829 xe_exec_queue_destroy_ioctl() error: we previously assumed 'q->vm' could be null (see line 826)

drivers/gpu/drm/xe/xe_device.c
    152 static void xe_file_close(struct drm_device *dev, struct drm_file *file)
    153 {
    154         struct xe_device *xe = to_xe_device(dev);
    155         struct xe_file *xef = file->driver_priv;
    156         struct xe_vm *vm;
    157         struct xe_exec_queue *q;
    158         unsigned long idx;
    159 
    160         xe_pm_runtime_get(xe);
    161 
    162         /*
    163          * No need for exec_queue.lock here as there is no contention for it
    164          * when FD is closing as IOCTLs presumably can't be modifying the
    165          * xarray. Taking exec_queue.lock here causes undue dependency on
    166          * vm->lock taken during xe_exec_queue_kill().
    167          */
    168         xa_for_each(&xef->exec_queue.xa, idx, q) {
    169                 if (q->vm && q->hwe->hw_engine_group)
                            ^^^^^
The commit adds a NULL check but if q->vm is NULL

    170                         xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
--> 171                 xe_exec_queue_kill(q);
                                           ^
Then this function call will lead to a crash.  The other warnings are basically
the same.

    172                 xe_exec_queue_put(q);
    173         }
    174         mutex_lock(&xef->vm.lock);
    175         xa_for_each(&xef->vm.xa, idx, vm)
    176                 xe_vm_close_and_put(vm);
    177         mutex_unlock(&xef->vm.lock);
    178 
    179         xe_file_put(xef);
    180 
    181         xe_pm_runtime_put(xe);
    182 }

regards,
dan carpenter
