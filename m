Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CE21C52D71
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 19:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499C510E7F2;
	Thu,  8 Aug 2024 19:24:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DDYYIdZ8";
	dkim-atps=neutral
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com
 [209.85.208.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E42410E7F2
 for <intel-xe@lists.freedesktop.org>; Thu,  8 Aug 2024 19:24:54 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-5b8c2a61386so1718861a12.2
 for <intel-xe@lists.freedesktop.org>; Thu, 08 Aug 2024 12:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1723145093; x=1723749893; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BefN6BDnBRHzpDEQx8TByDS7w0MrtEcoR3Gz9t8Hnyw=;
 b=DDYYIdZ8J61a1JcHklebNk7/ttWzRa9zq/jTcgdWLHmNnJ3TK4j6OsRyxpMMpBQXn3
 AJ2B+s15bGv/+eokXltDmSxBCROJxJQ+IDby23EzFbaCQ5P2TwNol7GGDYJsKGl4ptuT
 XjA8gK3IuDlSpfF84nMHsIfSrBsuwuJ0aQdrFfvJY+hrVLG1mBLEewE0SxKkkMZ0vbeZ
 tc3t4liwr0+8b4ycIgv+03UDH6ZSQG/kSUQBWFQ11YkXCYojaz2brnfg1GgwQaX8m7sR
 hT9J6/OvuL8tehiyZ4WGIC0ueMCi0q52jtaP9Kxw35o9VFInnD4rXJIhabc2pbMKHp+A
 /FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723145093; x=1723749893;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BefN6BDnBRHzpDEQx8TByDS7w0MrtEcoR3Gz9t8Hnyw=;
 b=mkKiIX5nposFvRAXCHCfurSYhgBU+Gtt+45pRnW7u/n3bDh0iclUj3Vz8pNF0fgceO
 LBYnO27YqPqnMUXpuT7XUg6FFS5Rt/LgNGUSPiggwYMf4k7Xbs02WoD5DlFckAyQUHnH
 yip6Yh6RAy/Mr9dIlvTWsvRQcEAbCOCzXoxkf+XsxwjRdeZSiA/3nqLMLKdsDpWPKOk3
 wgw9bC0kABDA+iRQeMxyQW6FEgCPa+10hIPohifn/1snEbvRNmuind+EIy6bx7McYep9
 8navpEdjJ0vIhp1Wq/vMXwUd/Njp8uPoq6VqLfuc3XQY+lGZNen/oU9YcAfsqq3a1Eu5
 WshA==
X-Gm-Message-State: AOJu0YxOBWlYtDLSczFc63mfw+EUEDg90N8NOQEfkIjqpOW1k1FT4eCf
 48NxZ3jf/Kwtt6SB7PpQOhOOkKugCb/UysKapGqkTptxSXiQ12eI4CBYBHmcBec=
X-Google-Smtp-Source: AGHT+IGdwggxhquXhtSTOIQ+BhlQCsXkmEcTzUoPlgxeCHjUve2HcJGHJBzhTZ2wIuL+56XdO7v5xA==
X-Received: by 2002:a05:6402:2714:b0:5a3:283d:b05a with SMTP id
 4fb4d7f45d1cf-5bbb223117bmr2126729a12.17.1723145092563; 
 Thu, 08 Aug 2024 12:24:52 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5bbb2d35533sm887348a12.61.2024.08.08.12.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Aug 2024 12:24:52 -0700 (PDT)
Date: Thu, 8 Aug 2024 22:24:46 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe: Minor cleanup in LRC handling
Message-ID: <fe538b44-1859-4f50-920c-33a4b1a9a728@stanley.mountain>
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

Hello Niranjana Vishwanathapura,

Commit 85cfc412579c ("drm/xe: Minor cleanup in LRC handling") from
May 7, 2024 (linux-next), leads to the following Smatch static
checker warning:

	drivers/gpu/drm/xe/xe_lrc.c:1640 xe_lrc_snapshot_capture()
	error: we previously assumed 'lrc->bo' could be null (see line 1637)

drivers/gpu/drm/xe/xe_lrc.c
    1630 struct xe_lrc_snapshot *xe_lrc_snapshot_capture(struct xe_lrc *lrc)
    1631 {
    1632         struct xe_lrc_snapshot *snapshot = kmalloc(sizeof(*snapshot), GFP_NOWAIT);
    1633 
    1634         if (!snapshot)
    1635                 return NULL;
    1636 
    1637         if (lrc->bo && lrc->bo->vm)
                     ^^^^^^^
The check assumes that lrc->bo can be NULL

    1638                 xe_vm_get(lrc->bo->vm);
    1639 
--> 1640         snapshot->context_desc = xe_lrc_ggtt_addr(lrc);
                                                           ^^^
Dereferenced without checking inside the xe_lrc_ggtt_addr() function.

    1641         snapshot->indirect_context_desc = xe_lrc_indirect_ring_ggtt_addr(lrc);
    1642         snapshot->head = xe_lrc_ring_head(lrc);
    1643         snapshot->tail.internal = lrc->ring.tail;
    1644         snapshot->tail.memory = xe_lrc_ring_tail(lrc);
    1645         snapshot->start_seqno = xe_lrc_start_seqno(lrc);
    1646         snapshot->seqno = xe_lrc_seqno(lrc);
    1647         snapshot->lrc_bo = xe_bo_get(lrc->bo);
    1648         snapshot->lrc_offset = xe_lrc_pphwsp_offset(lrc);
    1649         snapshot->lrc_size = lrc->bo->size - snapshot->lrc_offset;
    1650         snapshot->lrc_snapshot = NULL;
    1651         snapshot->ctx_timestamp = xe_lrc_ctx_timestamp(lrc);
    1652         snapshot->ctx_job_timestamp = xe_lrc_ctx_job_timestamp(lrc);
    1653         return snapshot;
    1654 }

regards,
dan carpenter
