Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D670EC74A5B
	for <intel-xe@archiver.kernel.org>; Wed, 29 Mar 2023 18:20:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D11A10E177;
	Wed, 29 Mar 2023 18:20:14 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5466010E177
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Mar 2023 18:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680114012; x=1711650012;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=eNgLQeSSZSwCIEKfr8s1s2KEwubUqlp+NzGiBWA3a40=;
 b=AhdYhvnpLKETdK0GiIwMs/UNVMo8p3dadjA2muKh4yYIMeydnYoLmPG9
 iwov2hD5GH37kLT71ZIYBTKlDzTw/P2fR+tWYf7vyy2iXmeLQNwyrjxyy
 ZcPZJfGn4E6v8ZQabQaR2NG63FCoxEp0hBS2bFV6GDAGqaYTudyeMHd++
 FPDy58Zt+03ORZ7QS8fV0MqXi9ZiWXB/8XclAMSR4HsyqfqAHV86wvBxQ
 nWVF8SAMm3vxqbHhkAG0VrYBuxRcw06F3oTp5khLRrIoHcJlYO4kBmfKt
 AcYgooHB3rezUYpEjhQuYsKsZysIC5PbgfQf4q2an7uGQdCcGn71gzp89 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="405915491"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="405915491"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 11:20:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795347967"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; d="scan'208";a="795347967"
Received: from irvmail002.ir.intel.com ([10.43.11.120])
 by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 11:20:10 -0700
Received: from [10.249.128.53] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.128.53])
 by irvmail002.ir.intel.com (Postfix) with ESMTP id 2D14638185;
 Wed, 29 Mar 2023 19:20:10 +0100 (IST)
Message-ID: <9642e1ff-d547-5e54-9582-b7c337ac5397@intel.com>
Date: Wed, 29 Mar 2023 20:20:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Content-Language: en-US
To: intel-xe@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>
References: <20230329173334.4015124-1-matthew.d.roper@intel.com>
 <168011141727.23904.11617600768670422401@emeril.freedesktop.org>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <168011141727.23904.11617600768670422401@emeril.freedesktop.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] 
 =?utf-8?q?=E2=9C=97_CI=2EKUnit=3A_failure_for_Minor_b?=
 =?utf-8?q?atchbuffer_handling_fixes?=
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


On 29.03.2023 19:36, Patchwork wrote:
> == Series Details ==
> 
> Series: Minor batchbuffer handling fixes
> URL   : https://patchwork.freedesktop.org/series/115812/
> State : failure
> 
> == Summary ==
> 
> + trap cleanup EXIT
> + /kernel/tools/testing/kunit/kunit.py run --kunitconfig /kernel/drivers/gpu/drm/xe/.kunitconfig

below patch [1] worked for me to avoid such build errors on my system

[1]
https://lore.kernel.org/lkml/20230318041555.4192172-1-davidgow@google.com/raw

> ERROR:root:In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/um/drivers/chan_user.c:6:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/x86/um/os-Linux/registers.c:8:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/um/drivers/fd.c:7:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/um/os-Linux/execvp.c:24:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> make[4]: *** [../scripts/Makefile.build:252: arch/x86/um/os-Linux/registers.o] Error 1
> make[3]: *** [../scripts/Makefile.build:494: arch/x86/um/os-Linux] Error 2
> make[3]: *** Waiting for unfinished jobs....
> In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/um/os-Linux/file.c:8:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/execvp.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** [../scripts/Makefile.build:252: arch/um/drivers/fd.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[3]: *** [../scripts/Makefile.build:252: arch/um/drivers/chan_user.o] Error 1
> In file included from /usr/include/stdlib.h:1013,
>                  from ../arch/um/os-Linux/skas/process.c:7:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> make[3]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/file.o] Error 1
> make[4]: *** [../scripts/Makefile.build:252: arch/um/os-Linux/skas/process.o] Error 1
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [../scripts/Makefile.build:494: arch/um/os-Linux/skas] Error 2
> make[2]: *** [../scripts/Makefile.build:494: arch/um/os-Linux] Error 2
> make[2]: *** Waiting for unfinished jobs....
> make[2]: *** [../scripts/Makefile.build:494: arch/x86/um] Error 2
> make[2]: *** [../scripts/Makefile.build:494: arch/um/drivers] Error 2
> In file included from /usr/include/stdlib.h:1013,
>                  from arch/um/kernel/config.c:7:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h: In function ‘atof’:
> /usr/include/x86_64-linux-gnu/bits/stdlib-float.h:26:1: error: SSE register return with SSE disabled
>    26 | {
>       | ^
> make[3]: *** [../scripts/Makefile.build:252: arch/um/kernel/config.o] Error 1
> make[3]: *** Waiting for unfinished jobs....
> make[2]: *** [../scripts/Makefile.build:494: arch/um/kernel] Error 2
> make[1]: *** [/kernel/Makefile:2025: .] Error 2
> make: *** [Makefile:226: __sub-make] Error 2
> 
> [17:36:29] Configuring KUnit Kernel ...
> Generating .config ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> [17:36:33] Building KUnit Kernel ...
> Populating config with:
> $ make ARCH=um O=.kunit olddefconfig
> Building with:
> $ make ARCH=um O=.kunit --jobs=48
> + cleanup
> ++ stat -c %u:%g /kernel
> + chown -R 1003:1003 /kernel
> 
> 
