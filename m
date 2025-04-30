Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6DCC369DC
	for <intel-xe@archiver.kernel.org>; Wed, 30 Apr 2025 06:08:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5A8710E028;
	Wed, 30 Apr 2025 06:08:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="LSZj5mUs";
	dkim-atps=neutral
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587DA10E28B
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Apr 2025 06:08:01 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 46e09a7af769-72c0b4a038fso4542170a34.0
 for <intel-xe@lists.freedesktop.org>; Tue, 29 Apr 2025 23:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1745993280; x=1746598080;
 darn=lists.freedesktop.org; 
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=xTDOOCJA/zMwj3eZag1BznfEtGsyRX88K8qUr0aWX+k=;
 b=LSZj5mUsIir9RxpMSqHf/eJ2VZl6igXbv6QwETl2/p114uGe7ahD6b1Jtr3dmGUX5M
 282tEtBr5IQKUdgTIr07gDDDtHqhPFcXf61nNJjSKtdob94VtAImHt4RgQNAUFBas4mu
 oSalBqH1LuaUknZQfMKyPtQj2N2ljmr+JxFTjZd9735ZAfUV4TtlPV4JlDQ+kFUbMrJ3
 4OusXQbU/Niu9hOkq/v2s7G1il/Ww5te3Dnibns+kpVPigXCYZcMuCGcvPzAzX4Z01sI
 5ZgrSkyND8RxAHYSaHguzXwO+OGw1wraTNqkDL2uGx2A2QQfSOcUgzugKs4QM/VgTN2h
 69Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745993280; x=1746598080;
 h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xTDOOCJA/zMwj3eZag1BznfEtGsyRX88K8qUr0aWX+k=;
 b=ulduCCEoc5rBuVHcLuQm8h2ZU7Eh+BLVmQmPkVgBF45eH8SY6J+9ZGLiTAgOVSKBP4
 S5ZNth2y6hyI4Ui237r/xdVzU5XpGzMOIDoBI35Km/mQl2jF+hNc+aAJZzWL60M0ILvI
 W7iX48abnFvpSCQQdcDECiJNnPKlGvsvyKXIieQ5fGSQ177w9p5i3rMeFfPkAoe8Br3g
 jtp5QTvmMHVGwVfv9NtSPOYU5YFhpSiJD1qfd6+TB/c3qctBsFVZ2olU7aYQ3/9LcI65
 6JQ/OzE/wdBhQZObv+FTCd3tzSUdRrDxcqLCFW5QkaQBGaFH0ZaxVOEFMyb13MqzDO2e
 H9XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+82FJC2Uk2GCzL5oweoJYKgND/HIBsYfM1FTEmjHxOfuLrULBE7iHz6Tvr1PFTEkwQd/AJaI2xQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yykn5odoGLW1mldT75PgcvpcNvnCi4v1k83qWf8mtrnfeXlkvdu
 aq1M1ML79XpgxGu+DM6hlToRkgJCA2tukae+q4Rt6/YchCHIFSkpQryj6hXZZg==
X-Gm-Gg: ASbGncv3B4Rl9nw1DMLgaIjD9NqXRxvq7vHuphwVB5dgIpbXaBM4AqO0YW/JRNTEVrW
 mAbqgwe52RsoNgcM/Us8Ch2XID4hy23kvsY7FnCsjxOMkFgrwZSryZpIS+PFKG/ii04oCg8jBIX
 MJnthEKEy5qnH9M5O3zisYyD64P5Q1SIfpt6mXhc3oUspwo75yZRobnpYmH8yhPB7AWdhgvAK93
 WIFS+0FwFwysyrTn74vNVaCKZTu/cE9Kp+EOIrh6VFVvuHsXhkdRIWPC/rT0APhhB1zXJqhNZxw
 fmSdpj2s49nc9TrOxk/nsgY/IixvPHguZrljzQyr1O28Twiqyc85scTRy7ikHHb4mGoktG3yd86
 4cEgmI5ANTlOT0oVHjA6Zstor
X-Google-Smtp-Source: AGHT+IGVOIMxt69+Zsy7YoJTdQ0SrYLAyMoARsxJuRR0fLkQr69u2GheXlJtlosBxbwh91y4ADFl3w==
X-Received: by 2002:a05:6870:890a:b0:2bc:6675:2043 with SMTP id
 586e51a60fabf-2da69da3f5bmr1032024fac.14.1745993280460; 
 Tue, 29 Apr 2025 23:08:00 -0700 (PDT)
Received: from darker.attlocal.net
 (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2da6e0523edsm263375fac.4.2025.04.29.23.07.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Apr 2025 23:07:58 -0700 (PDT)
Date: Tue, 29 Apr 2025 23:07:45 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
To: Peter Zijlstra <peterz@infradead.org>
cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>, 
 "luto@kernel.org" <luto@kernel.org>, 
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, 
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, 
 "Kurmi, Suresh Kumar" <suresh.kumar.kurmi@intel.com>, 
 "Saarinen, Jani" <jani.saarinen@intel.com>, 
 "De Marchi, Lucas" <lucas.demarchi@intel.com>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 Ingo Molnar <mingo@kernel.org>
Subject: Re: [REGRESSION] x86/efi: Make efi_enter/leave_mm() use the
 use_/unuse_temporary_mm() machinery (linux-next)
In-Reply-To: <20250429182904.GL4198@noisy.programming.kicks-ass.net>
Message-ID: <64dae856-e51a-9fc4-2eb4-c41c1a42c9d7@google.com>
References: <SJ1PR11MB6129E62E3B372932C6B7477FB9BD2@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <SJ1PR11MB61293655E9386DC0FBD263F4B9852@SJ1PR11MB6129.namprd11.prod.outlook.com>
 <87selrwdct.fsf@intel.com>
 <20250429182904.GL4198@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Tue, 29 Apr 2025, Peter Zijlstra wrote:
> On Tue, Apr 29, 2025 at 12:01:22PM +0300, Jani Nikula wrote:
> > On Thu, 24 Apr 2025, "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com> wrote:
> > > +Andy, Ingo
> > >
> > > Friendly reminder.
> > > Issue is still seen on latest linux-next runs.
> > >
> > > https://intel-gfx-ci.01.org/tree/linux-next/next-20250424/bat-rpls-4/boot0.txt
> > >
> > > Regards
> > >
> > > Chaitanya
> > 
> > Andy, Ingo -
> > 
> > Commit e7021e2fe0b4 ("x86/efi: Make efi_enter/leave_mm() use the
> > use_/unuse_temporary_mm() machinery") on linux-next regresses as
> > reported by Chaitanya
> > 
> > Please look into it.
> 
> Does your kernel include the below?
> 
> ---
> commit aef1d0209ddf127a8069aca5fa3a062be4136b76
> Author: Peter Zijlstra <peterz@infradead.org>
> Date:   Fri Apr 18 11:50:34 2025 +0200
> 
>     x86/mm: Fix {,un}use_temporary_mm() IRQ state
>     
>     As the function switch_mm_irqs_off() implies, it ought to be called with
>     IRQs *off*. Commit 58f8ffa91766 ("x86/mm: Allow temporary MMs when IRQs
>     are on") caused this to not be the case for EFI.
>     
>     Ensure IRQs are off where it matters.
>     
>     Fixes: 58f8ffa91766 ("x86/mm: Allow temporary MMs when IRQs are on")
>     Reported-by: Borislav Petkov (AMD) <bp@alien8.de>
>     Tested-by: Borislav Petkov (AMD) <bp@alien8.de>
>     Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>     Signed-off-by: Ingo Molnar <mingo@kernel.org>
>     Cc: H. Peter Anvin <hpa@zytor.com>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Cc: Andy Lutomirski <luto@kernel.org>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Cc: Rik van Riel <riel@surriel.com>
>     Link: https://lore.kernel.org/r/20250418095034.GR38216@noisy.programming.kicks-ass.net
> 
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 79c124f6f3f2..39761c7765bd 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -986,6 +986,7 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
>  	struct mm_struct *prev_mm;
>  
>  	lockdep_assert_preemption_disabled();
> +	guard(irqsave)();
>  
>  	/*
>  	 * Make sure not to be in TLB lazy mode, as otherwise we'll end up
> @@ -1018,6 +1019,7 @@ struct mm_struct *use_temporary_mm(struct mm_struct *temp_mm)
>  void unuse_temporary_mm(struct mm_struct *prev_mm)
>  {
>  	lockdep_assert_preemption_disabled();
> +	guard(irqsave)();
>  
>  	/* Clear the cpumask, to indicate no TLB flushing is needed anywhere */
>  	cpumask_clear_cpu(smp_processor_id(), mm_cpumask(this_cpu_read(cpu_tlbstate.loaded_mm)));

Hi Peter, I haven't checked on most recent -nexts, but earlier found that
patch to be not quite enough, at least if you have CONFIG_DEBUG_VM=y:
because switch_mm_irqs_off() contains a

		VM_WARN_ON_ONCE(prev != &init_mm && !cpumask_test_cpu(cpu,
				mm_cpumask(prev)));

which doesn't like what (un)use_temporary_mm() is now doing. I couldn't
be sure who was right or wrong, and just proceeded by commenting out
the warning - ONCE shouldn't be much trouble, except xfstests uses
some nefarious mechanism to resurrect ONCE repeatedly.

Hugh
