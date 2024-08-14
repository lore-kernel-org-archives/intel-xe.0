Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A434C52D7B
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 02:24:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4A710E3FB;
	Wed, 14 Aug 2024 02:24:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="d/Uotrwe";
	dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3716C10E3FA;
 Wed, 14 Aug 2024 02:24:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 173A2CE13A5;
 Wed, 14 Aug 2024 02:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 728B1C32782;
 Wed, 14 Aug 2024 02:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1723602291;
 bh=XNe50K+rCudFjQYRv5L/yVRqiEKXGVEUTSUUuxQwDbk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=d/UotrweKieWQJMVqNd65dlj1ziTa+YKfYSjfpJ5Ff+GjhK9fax7aj8z3Q/w8dAm9
 tB7a3lLTI0tZ7kvhqYLAG2QgSso/PO3eIJ0zP0pZhH2siTj+8V7t0CGAdDrt5EFBQ2
 zJXoJ+rpG3glti1ufvD37kChpjAFWImUuo71uuT4=
Date: Tue, 13 Aug 2024 19:24:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Jani Nikula <jani.nikula@intel.com>
Cc: linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 akinobu.mita@gmail.com, lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 thomas.hellstrom@linux.intel.com, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH 1/3] fault-inject: improve build for
 CONFIG_FAULT_INJECTION=n
Message-Id: <20240813192450.9aff86552e06a48924b7bbc1@linux-foundation.org>
In-Reply-To: <20240813121237.2382534-1-jani.nikula@intel.com>
References: <20240813121237.2382534-1-jani.nikula@intel.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 13 Aug 2024 15:12:35 +0300 Jani Nikula <jani.nikula@intel.com> wrote:

> The fault-inject.h users across the kernel need to add a lot of #ifdef
> CONFIG_FAULT_INJECTION to cater for shortcomings in the header. Make
> fault-inject.h self-contained for CONFIG_FAULT_INJECTION=n, and add
> stubs for DECLARE_FAULT_ATTR(), setup_fault_attr(), should_fail_ex(),
> and should_fail() to allow removal of conditional compilation.
> 
> --- a/include/linux/fault-inject.h
> +++ b/include/linux/fault-inject.h
>  
> -#include <linux/types.h>
> -#include <linux/debugfs.h>

Removing a nested include exposes all those sites which were
erroneously depending upon that nested include.  Here's what I have
found so far, there will be more.

--- a/mm/failslab.c~fault-inject-improve-build-for-config_fault_injection=n-fix
+++ a/mm/failslab.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/fault-inject.h>
 #include <linux/error-injection.h>
+#include <linux/debugfs.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
 #include "slab.h"
--- a/lib/fault-inject.c~fault-inject-improve-build-for-config_fault_injection=n-fix
+++ a/lib/fault-inject.c
@@ -2,6 +2,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/random.h>
+#include <linux/debugfs.h>
 #include <linux/sched.h>
 #include <linux/stat.h>
 #include <linux/types.h>
--- a/kernel/futex/core.c~fault-inject-improve-build-for-config_fault_injection=n-fix
+++ a/kernel/futex/core.c
@@ -34,6 +34,7 @@
 #include <linux/compat.h>
 #include <linux/jhash.h>
 #include <linux/pagemap.h>
+#include <linux/debugfs.h>
 #include <linux/plist.h>
 #include <linux/memblock.h>
 #include <linux/fault-inject.h>
_

