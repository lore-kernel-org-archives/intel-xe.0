Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E80C4707B
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA07010E666;
	Fri,  5 Jan 2024 17:11:05 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A9D310E5E2
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jan 2024 12:21:05 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-55711962c3fso1357058a12.3
 for <intel-xe@lists.freedesktop.org>; Fri, 05 Jan 2024 04:21:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704457263; x=1705062063; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ULXh385a3mnPJgk/tkor1+4zIqDEEtXOPj7SDn2bufc=;
 b=HUYZ0K0Zw3Zz7RzJJuHkM8eRhm5Uou0DjlXDwp/aYMckDX5kZQG322XuvmSD1Az2wf
 u3O9znJxhJJvus8wksfYaiKItnjXYIw7zmYAtv6d/Dw2pozQl7AeTXL8zDXhtg9G6qL+
 M1svshR9UBZFm/+vWZ0yLJjdYjbnnS+xkRpCJcV4nfHjfa+SJMkSrdPmMrR28vlh5kCc
 eBCyemqkb4hiAcMjL6vB8uV6UBMxWKowmOB6KaSpN3WN3k+tFtfGHcdxwCOa/kJTfc/D
 0sOWVNx7TM+l1JZs5rDrJh/2LioFCE2im0n4HLNO9wjX8ytI+jOFPl40rnH6kunJ7ARY
 MJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704457263; x=1705062063;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ULXh385a3mnPJgk/tkor1+4zIqDEEtXOPj7SDn2bufc=;
 b=pM+yEg5y7zftN0g2ig1+aTuVa7b1+lA7BdjfJsq6LdTT0KemmUcyCALmqDAhF52ZfP
 +Ry031JjXJBeHw+lPGwl3Bv+CR4K7lPGNFMQQkJxGxoJZOz4ffKGATGco8TR50GxzFA4
 I7WWeI++pwjCOxnveVHbNizc3MmQdUWOlbxl3bzyp3h6c+Z2GmGtpqbZ6Hdniz1aBM4/
 8uBpKHg3SjhVGpykoJcyZZ2l3oMbCF1DGkgVbLy555AW+kgo9dOtbsOLBoQ8gJgmVvi2
 abrBwrA239soMNdJjhHRHDyFA8pFCYYr0HLWPc9qxCXKyIp8fzg7b/s2aVO6GTiItpJj
 8m1Q==
X-Gm-Message-State: AOJu0Yzb17dSTR5R7GHmxpjbY/L8JGoJSXCTsE2jQMfuDKhRtcfeO/rN
 3GFv2NtPUpUqtw6GalfrpY84EAbvi8yhCg==
X-Google-Smtp-Source: AGHT+IGAtpg35p5hHMy+mIWCDSBai/c1rYYlLjRlqD1rCG2ha+IQ+Pvn7+dYR5q1mSFe0bIZIw4eLQ==
X-Received: by 2002:a50:8a85:0:b0:556:f865:44f3 with SMTP id
 j5-20020a508a85000000b00556f86544f3mr1130019edj.51.1704457263702; 
 Fri, 05 Jan 2024 04:21:03 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 z11-20020aa7d40b000000b00556cd818dd2sm911026edq.70.2024.01.05.04.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 04:21:03 -0800 (PST)
Date: Fri, 5 Jan 2024 15:21:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: maarten.lankhorst@linux.intel.com
Subject: [bug report] drm/xe/display: Implement display support
Message-ID: <7c18b7d3-6e8b-4ce6-b20a-b0a25afece49@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Fri, 05 Jan 2024 17:11:05 +0000
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

Hello Maarten Lankhorst,

The patch 44e694958b95: "drm/xe/display: Implement display support"
from Aug 17, 2023 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/xe/xe_bo.c:1414 __xe_bo_create_locked()
	error: we previously assumed 'tile' could be null (see line 1408)

drivers/gpu/drm/xe/xe_bo.c
    1404                 xe_vm_get(vm);
    1405         bo->vm = vm;
    1406 
    1407         if (bo->flags & XE_BO_CREATE_GGTT_BIT) {
    1408                 if (!tile && flags & XE_BO_CREATE_STOLEN_BIT)
    1409                         tile = xe_device_get_root_tile(xe);

Let's assume tile is NULL and XE_BO_CREATE_STOLEN_BIT is not set.

    1410 
    1411                 xe_assert(xe, tile);
    1412 
    1413                 if (flags & XE_BO_FIXED_PLACEMENT_BIT) {
--> 1414                         err = xe_ggtt_insert_bo_at(tile->mem.ggtt, bo,
                                                            ^^^^^^^^^^^^^^

    1415                                                    start + bo->size, U64_MAX);
    1416                 } else {
    1417                         err = xe_ggtt_insert_bo(tile->mem.ggtt, bo);
                                                         ^^^^^^^^^^^^^^
Then we will crash.

    1418                 }
    1419                 if (err)
    1420                         goto err_unlock_put_bo;
    1421         }
    1422 
    1423         return bo;
    1424 

regards,
dan carpenter
