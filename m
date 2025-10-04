Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975EECAC5BB
	for <intel-xe@archiver.kernel.org>; Sat,  4 Oct 2025 06:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC15E10E00F;
	Sat,  4 Oct 2025 06:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QMUm7quV";
	dkim-atps=neutral
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F11710E00F
 for <intel-xe@lists.freedesktop.org>; Sat,  4 Oct 2025 06:22:26 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-46e52279279so19700325e9.3
 for <intel-xe@lists.freedesktop.org>; Fri, 03 Oct 2025 23:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759558945; x=1760163745; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PM2NbKA/cfosFxeqBhbnMTf2R2GJQ2b66czLzCqglMw=;
 b=QMUm7quVvJhIJuaJ/sdB/PQiS5mPhVotWAED9PYtBfkVvLdzHvcZE5RSbryNfwOZTl
 XyDKmDyE/ztosLBCofzRaOsGjPBLm1sTdwSp8CZUfargg05Tgd1aQ0qePAUBVczcF5YJ
 nisWDS/3V589nJiB78H7jtse7SJKq3epVxItR7tke6WdBbWXad/Xdew0YFpyFhMnr6gp
 YGNkme7tYK2QRg1GyuPGr+O4oeVw+7MrdzcnCBx3/4C2UauVZIBR9jE+O16DxGHLkifT
 HfERkEqhYCoCZ9GPm8ejD6SdNTEvBG/ph60S0ST4GRCVab3ZxRlOsLCrNK8kYLxDQC55
 k0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759558945; x=1760163745;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PM2NbKA/cfosFxeqBhbnMTf2R2GJQ2b66czLzCqglMw=;
 b=AkW2dDmaqz37v9qGIDEAWVBXdwFZUWjFGNiSomaQmUCi6kj3tvFsL7t/PElhQMsoRa
 aAuRAzQiDS6WMU1/VQJuXHfBGTBXnDxmJS801Db3HIlO40m4lPb/K3VQtU4o50qCSw1w
 moxQDNWim9HetPO/K/G+BbNsBEr3VOTuE0Ia1DH4DZod4+SSdm+1vHlDQCKXlVx5MldF
 O4kGm688DpUCJKAQ8D7n3lVrLLT1B3r+gGFas6FZECsRNcta/h/zV8E0mL1YMAyhqDlv
 mFdz8CU/iAFaoliK3SXHj+3igIiYHrHuhFrwOPP9Tm29/59H0dVl7ThRnrTm+QQsGffW
 FfMg==
X-Gm-Message-State: AOJu0Yzt0bqd9rxIU777TZJXkMiSF2gkobc1uO1eKayI4HTY4F3NhvAP
 TfJWZamw4NTzGIVsWlllo4OnLLjxvRYK7dNGcZkxoj3s+W5lb3EykL5pOZ3nRlkthMWTm9z/Ivq
 jhSSh
X-Gm-Gg: ASbGncvpJzn7Re0cvspeMQxpkmxb7q7lJ2Le6Vn/gDr3Qztafi6IAGbYhQNAAuimWBb
 2b3J/O4KDnBrA55+zqBT5jxRa5qF6UtaEhuNulXzaZrfzBYJUawBWgAARtH9pLwzDgdqubUVJLb
 3KIO+CtM6QuNnPeFiUEbWB/8YaJfID1JfC3urx2olhhpMt7aQaPp8lXnUI+P2foDavwUH5V0yTZ
 goFNzCLAd5A+tBBNRMN8E97sHX3f+ZOnQop3enmstLVMiPS7TGnm5Rcm79szPuFqqjwypQErdV6
 DiWPO9ZIxd4qPdfMqPekuV9nGslOm6QFtCKgZ7ZN0K/G7VSAlDh7dwUrBv8pqkOLnfTjc010oBO
 igI/tIiz9+eA8ujM53qKEa+PXXPe1DkThnsGXLSHK+oFMEmv4SIWgtJGY
X-Google-Smtp-Source: AGHT+IEQfj0KJQxWkakrb/1LhW9gmFVdAtkh37t5QfIA2xVA53gSkrzYmjqt61zneGVS2d8xe1janw==
X-Received: by 2002:a05:600c:4689:b0:46e:440f:144b with SMTP id
 5b1f17b1804b1-46e7110a1e8mr33013255e9.14.1759558944839; 
 Fri, 03 Oct 2025 23:22:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-46e5c3eca22sm97118785e9.4.2025.10.03.23.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 23:22:24 -0700 (PDT)
Date: Sat, 4 Oct 2025 09:22:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: intel-xe@lists.freedesktop.org, linux-mm@kvack.org
Subject: [bug report] bad error return in walk_hugetlb_range()
Message-ID: <aOC9HP6nB0C45QnS@stanley.mountain>
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

This is really old code.  I think it's a bug in hugetlb.

	drivers/gpu/drm/xe/xe_gt_pagefault.c:353 pf_queue_work_func()
	warn: passing positive error code 's32min-(-12),(-10)-(-1),1' to 'ERR_PTR'

mm/pagewalk.c
   319  static int walk_hugetlb_range(unsigned long addr, unsigned long end,
   320                                struct mm_walk *walk)
   321  {
   322          struct vm_area_struct *vma = walk->vma;
   323          struct hstate *h = hstate_vma(vma);
   324          unsigned long next;
   325          unsigned long hmask = huge_page_mask(h);
   326          unsigned long sz = huge_page_size(h);
   327          pte_t *pte;
   328          const struct mm_walk_ops *ops = walk->ops;
   329          int err = 0;
   330  
   331          hugetlb_vma_lock_read(vma);
   332          do {
   333                  next = hugetlb_entry_end(h, addr, end);
   334                  pte = hugetlb_walk(vma, addr & hmask, sz);
   335                  if (pte)
   336                          err = ops->hugetlb_entry(pte, hmask, addr, next, walk);

The ->hugetlb_entry() is implemented by two functions which return
true/false instead of error codes.  Smatch thinks this 1 value gets
propagated back to pf_queue_work_func() and results an an Oops.

The two problem functions are hwpoison_hugetlb_range() and
pagemap_hugetlb_range() which returns PM_END_OF_BUFFER from
add_to_pagemap().

   337                  else if (ops->pte_hole)
   338                          err = ops->pte_hole(addr, next, -1, walk);
   339                  if (err)
   340                          break;
   341          } while (addr = next, addr != end);
   342          hugetlb_vma_unlock_read(vma);
   343  
   344          return err;
   345  }

regards,
dan carpenter
