Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B23C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 13:27:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8001D10F5CB;
	Thu,  9 Jul 2026 13:27:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mMVeRXBW";
	dkim-atps=neutral
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B846D10E690
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Jul 2026 06:11:24 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2cc61541f8cso8326815ad.0
 for <intel-xe@lists.freedesktop.org>; Wed, 08 Jul 2026 23:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783577484; x=1784182284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=Hd6GoWd0nNSvkzn4bZsOD9QjS5q1cvBf4vz24CQIaxI=;
 b=mMVeRXBWtYpMPyMO0gpl7iURVGh2fKK10LVwDCYrMpoUo9X4r0o7IgS1SXh4/4Bdx3
 scKHykIzU1+WP5mW5J+blJKDqHhm/VD0WAnnB/y5v7bpW9/tHIRO/80IUfY3VjTWbbcg
 vLd+cEe8PMdvLDIx1UbNRLiUebDrbbYGbHzHlpv3jEVVVreg2EPelDEMkvcwiqBfsf1t
 SWLHtOJLprNNczBJtQwnPCeJ2f1JxW+XQDJFlWoMcGiVe6jwnGy6KXj7lf3Yx1yf8E8d
 K+BQbdtwBgAFwR4wx2QsC/VMTUSc/6L5EI1ItK6YKefdjrSX65HdHC1fK5JREYw7YTuC
 /smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783577484; x=1784182284;
 h=content-transfer-encoding:content-type:mime-version:references
 :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=Hd6GoWd0nNSvkzn4bZsOD9QjS5q1cvBf4vz24CQIaxI=;
 b=AUKmhh3eYHb1Nhx1/d5Q3YoPve7plVQRLLwEpSJCS2I35Af4gkX0727sIYmWCNsM/I
 xk12bbg3rCpKOQwq/1Q9YrHLp7G7hDWFuGxnZ84Z4R7lSPyBHMy4iaciGQWuXAu2krL2
 A4Y1b5vLGD6voSLutXPDbxk4PbSb8GYLZ2IJrM2ynfP3vGUMFqc2agbayg3liuf0WK9v
 Yd9dVusKIxHMNWd9RB0pdTajD4yh3FXwiwKcFFwYyq7WpLhWMrGtn5j+qyHGGd42Kxgx
 DufkzYBjKCGcLHm5d+cIiKxEnLdMJEzDGLrVTvR15/Vhp2N7NovEp3hJ4N1p7PT6nX4/
 e0Rg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqVmvDHUjRVR1yC2Dqt6ch11XMrbUYIWI7O3BgQEdqkGBRPGjSSa6ahGF3l5I3xhR8N7o+ePWuBnw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyghtL24FlTM0FUJNAFCgIXwCY581fKVdx4NaOu0B9OF0HvxZ4b
 wuBUTl5qdgClp2+drUo9r2dW9Rb4kMPov1L75Gx2SSqzNPq8Cx31xVrX
X-Gm-Gg: AfdE7clm6x7wrdigWSjkzM72FQNU5wr3OunJEYQvpvqbiq4xzcWdnbbfXzFcL9cctr/
 w0emqIMO73OBI7aWhulLeQTUI3C8gF7c7CwqLUvWxffHLi/U0otNF6lulrta3Ii0Cn+X9mj6/hH
 lKc2BUo4yat0CVTViBACUxUK6IOdRe1nTATLBp6YpbnbRXB1uAlP0qNngizGk9ambgl/Gsgwbn/
 Qx44s8sLIrksUKex799BrUYNIVZRlCnWpUpFYZn2rI4XRhH5Rq6WiF9eMK2JCzEA0ZZXb8ear0z
 Xa+B70Whry1NSKx5U7z2eRF7kFZtgpQZqggy2HddjqHu9gkdJJf8YEueesqr/t5RJgBuSWW+IOx
 BS8PonNh7CyZivjqXF2qSY6bY09u1ZmGmwloPtmdyXM0UB8h6yN93xKOlg9rPelT4aa0//aXnR9
 KLcIxxL5Y=
X-Received: by 2002:a17:902:ce0d:b0:2c9:d27b:af11 with SMTP id
 d9443c01a7336-2cdd8a84479mr14704525ad.11.1783577484149; 
 Wed, 08 Jul 2026 23:11:24 -0700 (PDT)
Received: from ubuntu.. ([138.199.21.246]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d602fdsm37778845ad.81.2026.07.08.23.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jul 2026 23:11:23 -0700 (PDT)
From: Jing Wu <realwujing@gmail.com>
To: matthew.brost@intel.com
Cc: thomas.hellstrom@linux.intel.com, christian.koenig@amd.com,
 ray.huang@amd.com, matthew.auld@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, tj@kernel.org, hannes@cmpxchg.org,
 mkoutny@suse.com, natalie.vock@gmx.de, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, linux-mm@kvack.org,
 Jing Wu <realwujing@gmail.com>
Subject: Re: [PATCH v7] cgroup/dmem: implement dmem.high soft limit with
 proactive reclaim
Date: Thu,  9 Jul 2026 14:11:13 +0800
Message-ID: <20260709061114.1623774-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <ak81RUK6vRZaMN2D@gsse-cloud1.jf.intel.com>
References: <ak81RUK6vRZaMN2D@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Jul 2026 13:27:25 +0000
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

On Wed, Jul 09, 2026 at 12:44:37AM -0700, Matthew Brost wrote:
> This looks quite similar to work Thomas is doing here [1].

Thank you for the pointer, Matt.  We were not aware of Thomas's series
before your mail.  After reviewing Thomas's v7 [1], the two series turn
out to address different — and complementary — problems:

  - Thomas's series hooks a reclaim callback into the dmem.max write
    path: when an administrator lowers dmem.max below current usage, the
    kernel calls the driver's reclaim callback to bring device memory
    usage down to the new limit.  This is analogous to what happens in
    memcg when memory.max is written below current usage.

  - Our series adds dmem.high as a soft limit enforced in the charge
    path: when a successful allocation pushes a cgroup's usage above
    dmem.high, TTM proactively evicts one BO from that cgroup before
    returning.  This mirrors memory.high semantics in memcg, where
    reclaim is triggered per-allocation to keep usage below the soft
    threshold.

Both mechanisms coexist independently in memcg and serve distinct
purposes: the max write path handles capacity reconfiguration by
operators, while the high-limit path provides automatic backpressure
for workloads approaching their quota.  Having both in the dmem cgroup
controller seems correct.

> Are either of you two aware of this seemly overlapping work?

We were not, until your mail.  Now that we are, we would like to
coordinate with Thomas on a few interaction points:

  1. API intersection: Thomas's v5+ replaces the bare u64 size argument
     in dmem_cgroup_register_region() with struct dmem_cgroup_init (which
     bundles the region size, reclaim ops, and driver private data).  If
     Thomas's series lands first, we will adapt our patches to the new
     registration interface.

  2. File-level conflicts: both series modify ttm_resource.c and
     ttm_bo.c.  The changes are semantically independent and should
     compose cleanly after a rebase, whichever lands second.

Thomas, would you be open to coordinating on merge ordering?  We are
happy to rebase our dmem.high series on top of yours once it lands, or
to split out any shared infrastructure as a common prerequisite if that
helps.

Thanks,
Jing Wu
