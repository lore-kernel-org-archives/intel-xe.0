Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCDDCCA470
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 11:41:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5E2A10E11C;
	Tue,  7 Oct 2025 11:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zh5zeuE9";
	dkim-atps=neutral
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
 [209.85.221.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0937410E11C
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 11:41:34 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3ecdf2b1751so4261811f8f.0
 for <intel-xe@lists.freedesktop.org>; Tue, 07 Oct 2025 04:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759837292; x=1760442092; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bVVqjeLxgD3i9O/wIhyqQFIwAYLCkkVJe0hgD0tYLLE=;
 b=zh5zeuE9wwaYbKeboXI74PMczlBE1OPDuF7qacId1ipoJnKTT+g9+DRlebGH6Kh2cu
 ZPhbOznY424cU0UTMgQOO8jhjfYxatyiM1YUfA3YKPGLkSfXJ6JGFkNa3Sb08ebXniIR
 WzXH8/5QuIxbJ9zClsp8IjXa0CKwUpAlKnNFdxe1MBfHgqgH3lbmMJ9auc6GCaY1zb59
 IskD3n4KBOuJJMNtTA3F9LIGjDjFU1aqnkDNHa5iWZwqVixZqBd38LYT6hyj3UyehE1N
 z3ElJbHJbhqfpTqsG5aYKVbs+aQ0NFBTXHIhWhafaRysLzzaT3+j1d9V4i/jBthLX9vS
 j1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759837292; x=1760442092;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bVVqjeLxgD3i9O/wIhyqQFIwAYLCkkVJe0hgD0tYLLE=;
 b=fEbcm8tH8tyVSKDIKZ9Mz8HqI82tiN5vdPHrJqOH2QzG5gbTqziAgwoHiGTlkueMs/
 8Uj6+FQ4I95VWYEc1tjT+NPmJPAfVNKm32TdfI4P6PaFXAAnBc3rLt1y4IgcdYhyk3yb
 npIQ2jKArkowfLubG9GiqZpFC8NSaPuxCWiQnWxGLbe/lt1xzoD3UGNYplpwiPk1sXRj
 zpwARz2AWN5VO2SWzeVxMxMOOwozdvBt3MqwJ8GdRtBA8nW12UpgIQZqNG2VrmxY+WNi
 0go4efqqwtv73KAMWyKj/xvPjNTXp1AXyZD3jY7kMbo2o9vFdyTDWEwkavLWo9ATsSCP
 mOpg==
X-Gm-Message-State: AOJu0YyD6cLVw5maMnpkXUbbL3qCXPHaIocTR5WSXsCMzVOKJwazJ+RH
 IkGGSt7mrJm99eDbPWSCwhQCVO5KG+rj3YPPAsfiRAZD8xtZQuQNvkkRTEkYW77PsVs=
X-Gm-Gg: ASbGnctMLZT9urV935PDumjvFSLFg4sFdfcNTMq+SFjTBCbIspbEH+SAZ+ki0E+v238
 qS59Biavmm66ZcqTtru84GO5o3Tqu3pEjbb0MsZjbeg3x8msXZn6eaK7uu7ObfBtCv05q3yk2mG
 LVaz4j5k/YrSWk4VvpYF070qLHxHPJ+YMnp0x9oQxr1p0AqoBQzVh+gkRDusRZo2mPokJ6MWP4G
 0qHY3hlQE3cWz7BTYuh/Tf9zX0fKkna0WeXFTPrs+XMxMm18NzrNnvpF4OX/IuiPqSkZ6M4xsYR
 rNnLcDWIUJzPW07zOzjNqN/H2DWwmLqvtU+wDC4do6xKsYTtQESso2M6ln/oui0+tuv6qwTxVmd
 zpncmXQX5ic5n1sArfPY+kRwUhWt8rSvjxUapGzdvprRXsqr6q0ld3hQ9
X-Google-Smtp-Source: AGHT+IHo8VdTXjwgD8/FNS6LOiLHWZslBDzZ7hsF6UeuCg9fTBT7ziQtU3T/lhLcM2+wkl6zCLMPDA==
X-Received: by 2002:a05:6000:43cc:20b0:425:7c32:d969 with SMTP id
 ffacd0b85a97d-4257c32d992mr4484683f8f.5.1759837292372; 
 Tue, 07 Oct 2025 04:41:32 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4256866060fsm19573612f8f.14.2025.10.07.04.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Oct 2025 04:41:31 -0700 (PDT)
Date: Tue, 7 Oct 2025 14:41:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: David Hildenbrand <david@redhat.com>
Cc: intel-xe@lists.freedesktop.org, linux-mm@kvack.org
Subject: Re: [bug report] bad error return in walk_hugetlb_range()
Message-ID: <aOT8aOJ88g_TxuEX@stanley.mountain>
References: <aOC9HP6nB0C45QnS@stanley.mountain>
 <4c3b148e-9019-40db-8ca8-2166ef011c75@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c3b148e-9019-40db-8ca8-2166ef011c75@redhat.com>
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

On Tue, Oct 07, 2025 at 12:13:40PM +0200, David Hildenbrand wrote:
> On 04.10.25 08:22, Dan Carpenter wrote:
> > This is really old code.  I think it's a bug in hugetlb.
> > 
> > 	drivers/gpu/drm/xe/xe_gt_pagefault.c:353 pf_queue_work_func()
> > 	warn: passing positive error code 's32min-(-12),(-10)-(-1),1' to 'ERR_PTR'
> > 

Thanks, David.  Yeah.  You're right.  My apologies.  I tracked down the
confusion and this warning is actually because Smatch thinks that
hmm_range_fault() propogates the positive returns from walk_page_range().
But actually walk_page_range() only returns positive with certain flags.

Someone explained this to me in Jun and I said I would silence the
warning but I forgot...  Ugh...  Sorry.  :(

https://lore.kernel.org/all/aECCaCP3BGGGUUa0@stanley.mountain/

I have done it now, below.

regards,
dan carpenter

From fb706e39230f6f2bc6d68a18837171ea4c1fecc6 Mon Sep 17 00:00:00 2001
From: Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 7 Oct 2025 14:37:51 +0300
Subject: [PATCH] db/kernel.delete_returns: hmm_range_fault() can't return 1

This is pretty tricky code to read.  It doesn't return 1.  This leads to
error pointer warnings.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 smatch_data/db/kernel.delete.return_states | 1 +
 1 file changed, 1 insertion(+)

diff --git a/smatch_data/db/kernel.delete.return_states b/smatch_data/db/kernel.delete.return_states
index a1b3553a9f03..cfdf252e472c 100644
--- a/smatch_data/db/kernel.delete.return_states
+++ b/smatch_data/db/kernel.delete.return_states
@@ -30,3 +30,4 @@ ubi_find_or_add_av 0
 xe_migrate_copy 0
 scmi_get_or_create_handler 0
 alloc_frame_masks 0
+hmm_range_fault 1
-- 
2.51.0

