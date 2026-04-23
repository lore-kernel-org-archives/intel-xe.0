Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDA8F94CBE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Apr 2026 07:07:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64C3610EF7A;
	Thu, 23 Apr 2026 07:07:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o85ntXy6";
	dkim-atps=neutral
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A908C10EF7A
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 07:07:57 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-79db5e18ac6so76333517b3.1
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Apr 2026 00:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776928077; x=1777532877; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IrQdM6QTG5EwwwU/jz1icvgNcezQbhYbCkQmJuaCPpU=;
 b=o85ntXy6YYTW2dt51goLSZh+JrDWez8CN9OIWQlSL6zFWRD3kbikn+FGBNcd+Ag4Dj
 MT/1UWfo446g9pXBFvBvoqoKOtzZ/nbIQemQWZ0g190yoNLy1C2in/6ONuqF7dRZmEYg
 +6lJul/A6HQ/5OAshAXBlrmVMVwZbbP/cjNsRePmMBvCvpFAy7PQuUAJww5SOZ+noRzT
 tedxTxxnZgmmEA9NBGn8+l5pdN90LYl1GpT2wR08eNmFcB/Z6EMGz8+mhMjqH1SFfVUe
 AzyZA6TN+/8cgyaJ5WJ08ft4cgQGNeVtM2KeGlNLoYnOplNQKKgCiE12QT9QyKmPTIzJ
 b8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776928077; x=1777532877;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=IrQdM6QTG5EwwwU/jz1icvgNcezQbhYbCkQmJuaCPpU=;
 b=oo7ZhaIC88buuPjzJHMrIwnn5K+vpgnmm3l/uo1t7ksBHAyVhYyrBGgtLwpfnTKV9A
 K9Oikpd2U7DZWL6FvchioQqEbVot6r90UcC1UFbQ1krDXETXmF8D7GhCg1FqxlVtOjsD
 yEYXm0WFyu6IQUSUEVp5y7jvkm7E966nsjZuPsoms31KYjBnKI+RrAv1jmajrjsApm4W
 kSExukt7CmPFSIo9WDMEibnffeiHeh0D8mmEpU4KTA6g1BFo+NQUi6Cs9UMDvXdCqKRW
 ZZkah5gXRbXoUe7CHG37OGxnzCHfXhHeGP1CuafcQVE1giEM4gmezNqJUchlz6QOeG4Y
 d1vQ==
X-Gm-Message-State: AOJu0YxMfz7kN+LwQnSCjwMvQPZxdqMt5UF54wkmcVaroNBcZyGOLGlG
 vUyBAzHYJqi/5cd3xskMJyx9JyaFOxPtPGJlmqZg0T666Y/i/nV3et+k
X-Gm-Gg: AeBDiesSGezbG7ENALrTG8IS5ZVX5BeZ1lm3/Eb6bZNYwl74M7PhlnYLDM6+S8aS9LV
 5I7BmfO0+nPIl1fieRVoxMNTDXKXbc3/YtynVNbcL5ZTbPGwpOWKA3T2oiDGQ/vYFJ/v1zfmtlg
 rCNs5gj/i1wTzp1nlg0gI1kFgPMljOqMRQi8ZnrmmA3fll9p76gwhk6UJofU/dFWi53kUlY6Dry
 uL8p4TIY6k43x9F8Y+j9HWNDtGJzprkr39zc9t5B/RZQyLfpf+fDyU9eGfN9yyQhd8NgEte74am
 ivRAdF9m0cgYUqW98CVbdmOmscMqRbJ6pBnI/alMvBqI53mKShWC6oJBMc+REwCc2LdfkESrAWg
 yA9hGKiNyfFLbxSyD8vO7dKZLSJITGSoreZggcL2cl6CgZtMzytD/h3u2tTar/XJ9D7xeOTvqai
 sX4sS5eyvT4LU3a9f4mdeBy2qXiUqB
X-Received: by 2002:a05:690e:150a:b0:654:6147:68a9 with SMTP id
 956f58d0204a3-654614785c2mr2368553d50.6.1776928076726; 
 Thu, 23 Apr 2026 00:07:56 -0700 (PDT)
Received: from localhost ([172.216.252.33]) by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-65314b26598sm9027907d50.2.2026.04.23.00.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Apr 2026 00:07:56 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:07:50 +0300
From: Dan Carpenter <error27@gmail.com>
To: Matt Roper <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Subject: [bug report] drm/xe/reg_sr: Allow register_save_restore_check
 debugfs to verify LRC values
Message-ID: <aenFRrHqX-d1_hUs@stanley.mountain>
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

Hello Matt Roper,

Commit 764af38af22a ("drm/xe/reg_sr: Allow
register_save_restore_check debugfs to verify LRC values") from Feb
18, 2026 (linux-next), leads to the following Smatch static checker
warning:

	drivers/gpu/drm/xe/xe_reg_sr.c:272 xe_reg_sr_lrc_check()
	error: uninitialized symbol 'val'.

drivers/gpu/drm/xe/xe_reg_sr.c
    257 void xe_reg_sr_lrc_check(struct xe_reg_sr *sr,
    258                          struct xe_gt *gt,
    259                          struct xe_hw_engine *hwe,
    260                          struct drm_printer *p)
    261 {
    262         struct xe_reg_sr_entry *entry;
    263         unsigned long offset;
    264 
    265         xa_for_each(&sr->xa, offset, entry) {
    266                 u32 val;
    267                 int ret = xe_lrc_lookup_default_reg_value(gt, hwe->class, offset, &val);
    268                 u32 mask = entry->clr_bits | entry->set_bits;
    269 
    270                 if (ret == -ENOENT)

Smatch wants -EINVAL to be handled as well...

    271                         drm_printf(p, "%#8lx :: not found in LRC for %s\n", offset, hwe->name);
--> 272                 else if ((val & mask) != entry->set_bits)

Otherwise it says that val isn't initialized.

    273                         drm_printf(p, "%#8lx & %#10x :: expected %#10x got %#10x\n",
    274                                    offset, mask, entry->set_bits, val & mask);
    275         }
    276 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
