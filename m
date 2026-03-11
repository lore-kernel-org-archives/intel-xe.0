Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEBE106ACD0
	for <intel-xe@archiver.kernel.org>; Thu, 12 Mar 2026 16:46:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10D0110EA6E;
	Thu, 12 Mar 2026 16:46:44 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F66410E0AC
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 16:38:26 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2aea8c13d94so235015ad.3
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Mar 2026 09:38:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773247106; x=1773851906;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P08WFOTXPeZbjNHq2MDEWVEHtsVyIG/JuJeitfuWRP0=;
 b=lhGbkNod2rggGuCHay6JtZrabFtXm/llFWQcermLmjG1/xNlNI4jB/Zp/nsbogA5lN
 oxLXH/R+02INoV7KL7joYxF5SgXCFut3Ufy07BZXCzyY0Ll5TjEBbPbExKvqGyoMYG+o
 wpdvOR0jLUtbPYRBHAxr5/wzJ5xFfSqrdXYboTIqwJMYl+m0pPnUf9UUtySPFkKNbcQX
 y6JcIEKxtz2+o+25paYLlNsphhxL0Q9zNQ5HsvP2pe35FtjAhFgCHrSz3tp8JzAhUcJ8
 y8shJCXRD1FHR5Z3pTefmmxSkoMIpHjghCeFdEokcRiFU/+D+tuBctPL8lMFXDZJ9RuD
 NhFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2c5DXsfZiJb7AnCpPFC9KCLmhnUey+vpgtHo8RV1NDItF25xAgGEKpAlSrh0826ZHApZhcmWAAw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywzYaj2WKywHrgp95KgO4enMKrvdwN2c0Xo4qY1+veIHC1XOBj
 vzkv0RAgkFfsczyZ9opk82vVsDvn9CjywO5a09laEADVJnnjpNmJiBd9
X-Gm-Gg: ATEYQzyaM/l9ZAAmPAs1a/K4nbFqEsAF2aXDyZiKHbVY3Zmnez8DU2psb2Uaf/2ZkB2
 TCX1eKxnXwRyMYr+pQoL+MuyA1eH2qW1PuZ3ZsedxZEsGET5VbZ+G0S6z/fC7/QW3d3BFc6po+1
 T/d421huraUE5kSCit+ShBemDIQKIG58iQ2f3stXgw3aq+kPwxFX+FACh0x2HveVi8BrMOSzHO/
 nB8wrcwIzgGd7NsscxC8Y5oWeF7uNcIcBp3fyCrYBlaJHWczYQVIWh/x0qJAJnbifA3TvV+YB98
 tNDYmUXfxF0bwNj7We7quDX1+G/85bhuOWULin5WCmpFcKxsy7wwuwJxJqGyJPcsbhDtOzl9pvs
 RjHjF5fsA150ArfSUjdCwOJofZrAECJDDn6Fguv0aDfUw8hQUORycmxks4Uc9RswnoSAzgo80Fm
 zAG8ri7Zs8Ye7vIIXczgnCpi02ZWXOMOWfqyuYvW5TdStef+jScnZGDPTjFHU91ccVrRVW0D+VY
 mlRzPCdHM3DapZD8vWKDUKx75neFnIC
X-Received: by 2002:a17:902:e88d:b0:2ae:5745:f0ef with SMTP id
 d9443c01a7336-2aeae7a37fdmr23488625ad.2.1773247105821; 
 Wed, 11 Mar 2026 09:38:25 -0700 (PDT)
Received: from [172.30.1.49] ([119.206.52.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2aeae246abcsm28390525ad.26.2026.03.11.09.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Mar 2026 09:38:25 -0700 (PDT)
Message-ID: <02e5b102-d8e2-4fbf-8818-55863e425c96@kzalloc.com>
Date: Thu, 12 Mar 2026 01:38:19 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v18 20/42] dept: apply timeout consideration to dma fence
 wait
To: Byungchul Park <byungchul@sk.com>, Nathan Chancellor <nathan@kernel.org>
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
 gregkh@linuxfoundation.org, kernel-team@lge.com, linux-mm@kvack.org,
 minchan@kernel.org, harry.yoo@oracle.com, gwan-gyeong.mun@intel.com,
 max.byungchul.park@gmail.com, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 boqun.feng@gmail.com, Waiman Long <longman@redhat.com>,
 yunseong.kim@ericsson.com, yeoreum.yun@arm.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Matthew Brost <matthew.brost@intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Stuart Summers <stuart.summers@intel.com>, Nirmoy Das
 <nirmoy.das@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20251205071855.72743-1-byungchul@sk.com>
 <20251205071855.72743-21-byungchul@sk.com>
Content-Language: en-US
From: Yunseong Kim <ysk@kzalloc.com>
Organization: kzalloc
In-Reply-To: <20251205071855.72743-21-byungchul@sk.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 12 Mar 2026 16:46:35 +0000
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

Hi all,

I have been investigating repeated Clang build failures of the form:

  "cannot jump from this indirect goto statement to one of its possible targets"
  "note: jump enters a statement expression"

triggered by the interaction between drm_exec's indirect goto
(goto *__drm_exec_retry_ptr) and diagnostic macros such as _THIS_IP_,
LOCKDEP, and DEPT.

Link: https://lore.kernel.org/all/?q=b%3A%22error%3A+cannot+jump+from+this+indirect+goto+statement+to+one+of+its+possible+targets%22

Notably, failures on DEPT are currently observed on arm64 builds.
On arm64, _THIS_IP_ uses the common implementation based on a GNU C
statement expression with an address-taken label, relying on compiler
optimization rather than an architecture-specific definition. This makes
arm64 particularly sensitive to Clang's treatment of address-taken labels
and indirect goto targets.

This is also not limited to a single driver. I have observed the same
failure pattern in multiple DRM drivers when DEPT instrumentation is in
the call path (e.g. dma_fence_wait() -> sdt_might_sleep_start_timeout()
-> _THIS_IP_), including msm and others.

$ clang --version
clang version 23.0.0git (https://github.com/llvm/llvm-project.git
1ff1e5f10a5c765b4cf1344c4964604dcd09fef3)

drivers/gpu/drm/msm/msm_gem_vma.c:919:3: error: cannot jump from this
indirect goto statement to one of its possible targets
  919 |                 drm_exec_retry_on_contention(&exec);
      |                 ^
./include/drm/drm_exec.h:123:4: note: expanded from macro
'drm_exec_retry_on_contention'
  123 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: possible target of
indirect goto statement
  909 |                 dma_fence_wait(vm->last_fence, false);
      |                 ^
./include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
  677 |         sdt_might_sleep_start_timeout(NULL,
MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:46:31: note: expanded from macro
'sdt_might_sleep_start_timeout'
   46 |                 unsigned long __this_ip__ = _THIS_IP_;
         \
      |                                             ^
./include/linux/instruction_pointer.h:10:41: note: expanded from macro
'_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
      |                                         ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: jump enters a statement
expression
./include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
  677 |         sdt_might_sleep_start_timeout(NULL,
MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:46:31: note: expanded from macro
'sdt_might_sleep_start_timeout'
   46 |                 unsigned long __this_ip__ = _THIS_IP_;
         \
      |                                             ^
./include/linux/instruction_pointer.h:10:20: note: expanded from macro
'_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
      |                    ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: jump enters a statement
expression
./include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
  673 | #define dma_fence_wait(f, intr)
         \
      |
         ^
drivers/gpu/drm/msm/msm_gem_vma.c:933:5: error: cannot jump from this
indirect goto statement to one of its possible targets
  933 |                                 drm_exec_retry_on_contention(&exec);
      |                                 ^
./include/drm/drm_exec.h:123:4: note: expanded from macro
'drm_exec_retry_on_contention'
  123 |                         goto *__drm_exec_retry_ptr;             \
      |                         ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: possible target of
indirect goto statement
  909 |                 dma_fence_wait(vm->last_fence, false);
      |                 ^
./include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
  677 |         sdt_might_sleep_start_timeout(NULL,
MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:46:31: note: expanded from macro
'sdt_might_sleep_start_timeout'
   46 |                 unsigned long __this_ip__ = _THIS_IP_;
         \
      |                                             ^
./include/linux/instruction_pointer.h:10:41: note: expanded from macro
'_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
      |                                         ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: jump enters a statement
expression
./include/linux/dma-fence.h:677:2: note: expanded from macro 'dma_fence_wait'
  677 |         sdt_might_sleep_start_timeout(NULL,
MAX_SCHEDULE_TIMEOUT);      \
      |         ^
./include/linux/dept_sdt.h:46:31: note: expanded from macro
'sdt_might_sleep_start_timeout'
   46 |                 unsigned long __this_ip__ = _THIS_IP_;
         \
      |                                             ^
./include/linux/instruction_pointer.h:10:20: note: expanded from macro
'_THIS_IP_'
   10 | #define _THIS_IP_  ({ __label__ __here; __here: (unsigned
long)&&__here; })
      |                    ^
drivers/gpu/drm/msm/msm_gem_vma.c:909:3: note: jump enters a statement
expression
./include/linux/dma-fence.h:673:38: note: expanded from macro 'dma_fence_wait'
  673 | #define dma_fence_wait(f, intr)
         \
      |
         ^

I was able to find the pattern of the kernel source code that uses this pattern:

  $ git grep -n 'goto \*' | grep ';' | grep -v "\*/" | \
    grep -Ev "(\*[[:space:]]+goto|_goto.*\*\);)"
  drivers/gpu/drm/xe/xe_validation.h:149:			goto *__drm_exec_retry_ptr;			\
  drivers/misc/lkdtm/cfi.c:129:			goto *labels[1];
  drivers/misc/lkdtm/cfi.c:131:			goto *labels[2];
  drivers/misc/lkdtm/cfi.c:133:			goto *labels[3];
  drivers/misc/lkdtm/cfi.c:135:			goto *labels[4];
  include/drm/drm_exec.h:123:			goto *__drm_exec_retry_ptr;		\
  kernel/bpf/core.c:1776:	goto *jumptable[insn->code];
  scripts/gcc-plugins/gcc-common.h:368:	return as_a<ggoto *>(stmt);
  scripts/gcc-plugins/gcc-common.h:373:	return as_a<const ggoto *>(stmt);
  tools/testing/selftests/bpf/progs/bpf_gotox.c:219:	goto *jt[ctx->x & 0xff];
  tools/testing/selftests/bpf/progs/bpf_gotox.c:261:		goto *jt1[a];
  tools/testing/selftests/bpf/progs/bpf_gotox.c:263:		goto *jt2[b];
  tools/testing/selftests/bpf/progs/bpf_gotox.c:284:		goto *jt[a];
  tools/testing/selftests/bpf/progs/bpf_gotox.c:287:		goto *jt[a + b];

I understand that Clang's behavior here is intentional and conservative:
any address-taken label in the same function is treated as a potential
indirect goto target, and jumping into a statement expression is diagnosed
to avoid semantic issues. This aligns with:

  - [Clang] Diagnose jumps into statement expressions (D154696)
    https://reviews.llvm.org/D154696

At the same time, the kernel is not using _THIS_IP_ for control flow.
The label address is used purely for diagnostics (lockdep/DEPT attribution).
However, as discussed in:

  - LLVM Issue #138272: Add builtin/intrinsic to get current instruction pointer
    https://github.com/llvm/llvm-project/issues/138272

using blockaddress (&&label) purely to obtain an instruction pointer is
problematic in LLVM's model, since blockaddress has defined behavior only
when used with indirectbr or for null comparisons.

Similar issues have also been observed in other contexts where indirect
goto interacts with address-taken labels, e.g.:

  - LLVM Issue #28019: Wrong 'cannot jump from this indirect goto statement'
    https://github.com/llvm/llvm-project/issues/28019

Given this, I think there is three possible directions:

1) Continue per-callsite structural workarounds
   Keep separating indirect goto usage from any code that expands _THIS_IP_
   (e.g. moving PROVE_LOCKING / DEPT paths into helper functions). This avoids
   the diagnostic but requires ongoing refactoring and does not scale well as
   similar patterns reappear across drivers.

2) Introduce a compiler-supported alternative to _THIS_IP_
   As discussed in LLVM Issue #138272, a dedicated builtin or intrinsic to
   obtain a best-effort instruction pointer for diagnostics would allow the
   kernel to avoid address-taken labels entirely and eliminate this class of
   conflicts.

3) DRM/drm_exec-scoped refactoring as a pragmatic middle ground
   Since drm_exec is the common convergence point where indirect goto and
   DEPT/LOCKDEP instrumentation can meet in the same function across multiple
   DRM drivers, we could refactor the drm_exec usage patterns (or provide a
   recommended wrapper pattern) to structurally separate the retry/indirect-goto
   region from instrumentation that expands _THIS_IP_. This would avoid
   kernel-wide churn while addressing the recurring failures in DRM drivers.

I am not proposing to weaken Clang's diagnostics. Rather, I would like
feedback on whether option (3) is considered an acceptable short- to
medium-term approach, and whether option (2) is the preferred long-term
direction from the compiler side.

Any guidance from the LOCKDEP and kernel LLVM maintainers on the preferred
path forward would be greatly appreciated.

On 12/5/25 4:18 PM, Byungchul Park wrote:
> Now that CONFIG_DEPT_AGGRESSIVE_TIMEOUT_WAIT was introduced, apply the
> consideration to dma fence wait.
> 
> Signed-off-by: Byungchul Park <byungchul@sk.com>
> ---
>  drivers/dma-buf/dma-fence.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index b313bb59dc9c..f2cc7068af65 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -799,7 +799,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	cb.task = current;
>  	list_add(&cb.base.node, &fence->cb_list);
>  
> -	sdt_might_sleep_start(NULL);
> +	sdt_might_sleep_start_timeout(NULL, timeout);
>  	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
>  		if (intr)
>  			__set_current_state(TASK_INTERRUPTIBLE);
> @@ -903,7 +903,7 @@ dma_fence_wait_any_timeout(struct dma_fence **fences, uint32_t count,
>  		}
>  	}
>  
> -	sdt_might_sleep_start(NULL);
> +	sdt_might_sleep_start_timeout(NULL, timeout);
>  	while (ret > 0) {
>  		if (intr)
>  			set_current_state(TASK_INTERRUPTIBLE);


Best regards,
Yuseong

