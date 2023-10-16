Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDB5CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 17:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 698F9890EB;
	Mon, 16 Oct 2023 17:03:13 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACC7890EB
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 17:03:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 733BBCE1808;
 Mon, 16 Oct 2023 17:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 275C0C433C8;
 Mon, 16 Oct 2023 17:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1697475788;
 bh=c0eHrb6crqy42yUx6a/Ikws4QNYgC0BkPqi+pVK4sNY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJPGXs243U/HoNMe26JuSdmLRAwbpbisODmV/3gSVGw7DDmLCHF1OBvlJ7X3FPaST
 IjuyCZkwWPhDWfjSnCMLr94StBx3+fjC3G3Gh6CdPva0376k4iFfXb6K9jQCgXT+dX
 6swpygw3FJQhdNKjGFUYYJ9Alg6GlsM8M3BHdObg=
Date: Mon, 16 Oct 2023 19:03:05 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: fei.yang@intel.com
Message-ID: <2023101650-monogamy-bobbing-33f9@gregkh>
References: <20231016154025.3358622-1-fei.yang@intel.com>
 <20231016154025.3358622-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016154025.3358622-2-fei.yang@intel.com>
Subject: Re: [Intel-xe] [PATCH 1/1] x86/alternatives: Disable KASAN in
 apply_alternatives()
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
Cc: Peter Zijlstra <peterz@infradead.org>, lucas.demarchi@intel.com,
 stable@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 intel-xe@lists.freedesktop.org,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Oct 16, 2023 at 08:40:24AM -0700, fei.yang@intel.com wrote:
> From: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
> 
> Fei has reported that KASAN triggers during apply_alternatives() on
> a 5-level paging machine:
> 
> 	BUG: KASAN: out-of-bounds in rcu_is_watching()
> 	Read of size 4 at addr ff110003ee6419a0 by task swapper/0/0
> 	...
> 	__asan_load4()
> 	rcu_is_watching()
> 	trace_hardirqs_on()
> 	text_poke_early()
> 	apply_alternatives()
> 	...
> 
> On machines with 5-level paging, cpu_feature_enabled(X86_FEATURE_LA57)
> gets patched. It includes KASAN code, where KASAN_SHADOW_START depends on
> __VIRTUAL_MASK_SHIFT, which is defined with cpu_feature_enabled().
> 
> KASAN gets confused when apply_alternatives() patches the
> KASAN_SHADOW_START users. A test patch that makes KASAN_SHADOW_START
> static, by replacing __VIRTUAL_MASK_SHIFT with 56, works around the issue.
> 
> Fix it for real by disabling KASAN while the kernel is patching alternatives.
> 
> [ mingo: updated the changelog ]
> 
> Fixes: 6657fca06e3f ("x86/mm: Allow to boot without LA57 if CONFIG_X86_5LEVEL=y")
> Reported-by: Fei Yang <fei.yang@intel.com>
> Signed-off-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> Signed-off-by: Ingo Molnar <mingo@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20231012100424.1456-1-kirill.shutemov@linux.intel.com
> (cherry picked from commit d35652a5fc9944784f6f50a5c979518ff8dacf61)
> ---
>  arch/x86/kernel/alternative.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)

What stable tree(s) is this for?

thanks,

greg k-h
