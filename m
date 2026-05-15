Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E812CD343F
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 04:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD89D10E04E;
	Fri, 15 May 2026 04:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="VE7W5snF";
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AADF10E04E
 for <intel-xe@lists.freedesktop.org>; Fri, 15 May 2026 04:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778817957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aZ+iLTZST8FxP/oRfZ0ADx0fv2jSubDq1lGkoIHgCgI=;
 b=VE7W5snFyPLT4f7UoaxgVWqrFP3PrQxbgOs+ABAtSHhb4AxZXfNfPs/GKciWYBECurZL8g
 GkafgMRsQibcYq0EoYb6M9YVbXeLlR67OImp8/ah+secnQqAi1nlcUQqv0p9A6m7enPKFl
 wMsmjss/AKEgl82F5Yql0L0Kdp3DOdU=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-576-7nWd3afGN9m463cVm_x56A-1; Fri, 15 May 2026 00:05:56 -0400
X-MC-Unique: 7nWd3afGN9m463cVm_x56A-1
X-Mimecast-MFC-AGG-ID: 7nWd3afGN9m463cVm_x56A_1778817954
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5a8fe381c69so1398578e87.1
 for <intel-xe@lists.freedesktop.org>; Thu, 14 May 2026 21:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778817954; x=1779422754;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aZ+iLTZST8FxP/oRfZ0ADx0fv2jSubDq1lGkoIHgCgI=;
 b=gXC7nAqGuOFKP4cL/B4yqxGlwrkJTrD+7m1vyzTiY76fWNFKNRm1L6igCZZjHYxL7Z
 T/evfSyhR3p3Z9hs+zJLBYDF4RIS0vvqECmbu3fRUP0BLSiy82WyGZzTTxTBwwdw+d5o
 oGTcqJ2grG9DEDmgkzl15y1JC36SQbKDKS3ZUHhyZmy3EvyNc9nHrKDo0eNXrOGJucGP
 IFK3RHYkK7vIFEyq+e01Yv4uGnoiKJTMTrvk9Rnwe3xxtLSndfoa5pKMD+kcIOPJW8vM
 fJ6P2UUmblUqm4L/7diP79NVKwgImCPWQSwij4j72SKxXk+yxRucWGZD/Xp73USUboUH
 RIrg==
X-Forwarded-Encrypted: i=1;
 AFNElJ/cg4ZpAXmbJKQcShWeN2Detp2TlA639FancGlptc7jzFO37v2DBsOxbsV0i49Hxsdth131US2mOQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0pMO3rvhKPCe1v4YRK3efaJJ/hbyf/d61B/INq8ao6D52P7vO
 xmS89GpOyAQtziEZ0IjKF3hOOAzNlL/eUUIDidUAb8aJblh8bM2E86tbfINowOQfRdwtVNpeyn3
 fStEZw4d6q/Yp2NgCrHZbEoCnya0HKxiMV2F5lqslT3/5k778ZPE4q6uzzTHXaVPXlso=
X-Gm-Gg: Acq92OFAXQSyUWJJMnaR2G26uGgQ33gnItELy+bPTU/xhFOq6o4rRaggpmPG/r37CK8
 3LOVv3QwzcxvC7aEXNxwehs6aVL8bc2ttoDU+8FS36tR37/y0cTQzkThH9D9Pp5ucZPNKUVZfLs
 +IXjRASQVRG3Wb76WmTF2vxvmm+GyCG75mFKq6zyQr8h3AnC3DOxXJIYSS6zY0wcNoyeHrWEjjI
 YXXSBYVQiY0dYq5rB6gZHk/eSG8CbXlr4TvcLa8Nr73Of6s+63DAhsHveQGDCgAG3BULCZrmoIR
 OoQ/u1OooYEmxRl4YmYarRVJFGzk+xrTEXNT79FZWuV2bM5gAH5RPJaru4jNE1KLX/lhZGzOnEr
 RlfcBD92eXX3Z1LkdyqQOSYkbCjZbKKp+Fz1oRbrro7yDRjQ=
X-Received: by 2002:a05:6512:2397:b0:5a8:9909:50b1 with SMTP id
 2adb3069b0e04-5aa0e610e9amr452527e87.10.1778817954382; 
 Thu, 14 May 2026 21:05:54 -0700 (PDT)
X-Received: by 2002:a05:6512:2397:b0:5a8:9909:50b1 with SMTP id
 2adb3069b0e04-5aa0e610e9amr452515e87.10.1778817953842; 
 Thu, 14 May 2026 21:05:53 -0700 (PDT)
Received: from [192.168.1.86] (85-23-51-1.bb.dnainternet.fi. [85.23.51.1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a90f11a7c2sm932482e87.32.2026.05.14.21.05.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 May 2026 21:05:53 -0700 (PDT)
Message-ID: <2fe8d022-a414-4b23-af4f-9cecf1aac3d1@redhat.com>
Date: Fri, 15 May 2026 07:05:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 0/5] Migrate on fault for device pages
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>
References: <20260505184421.2324798-1-mpenttil@redhat.com>
 <agaN29W7hAklrCxz@parvat>
From: =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>
In-Reply-To: <agaN29W7hAklrCxz@parvat>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: g2gQ_W3_UI0-fctOAkJlqsc2S2mnlFVZn2VYb2a-r4A_1778817954
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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

Hi,

> FYI: While testing with hmm_tests I ran into
>
> [  107.866004] ============================================
> [  107.866284] WARNING: possible recursive locking detected
> [  107.866577] 7.1.0-rc3-00311-g4277273ca0e1 #12 Not tainted
> [  107.866877] --------------------------------------------
> [  107.867217] hmm-tests/1098 is trying to acquire lock:
> [  107.867491] ffff888113571b38 (&mm->mmap_lock){++++}-{4:4}, at: dmirror_range_fault+0x147/0x610 [test_hmm] <- line 368 of lib/test_hmm.c
> [  107.868076] 
> [  107.868076] but task is already holding lock:
> [  107.868383] ffff888113571b38 (&mm->mmap_lock){++++}-{4:4}, at: dmirror_fault_and_migrate_to_device.constprop.0+0x3aa/0x6a0 [test_hmm] <- line 1267 of lib/test_hmm.c
> [  107.869076] 
> [  107.869076] other info that might help us debug this:
> [  107.869415]  Possible unsafe locking scenario:
> [  107.869415] 
> [  107.869729]        CPU0
> [  107.869866]        ----
> [  107.870054]   lock(&mm->mmap_lock);
> [  107.870247]   lock(&mm->mmap_lock);
> [  107.870436] 
> [  107.870436]  *** DEADLOCK ***
> [  107.870436] 
> [  107.870743]  May be due to missing lock nesting notation
> [  107.870743] 
> [  107.871158] 1 lock held by hmm-tests/1098:
> [  107.871377]  #0: ffff888113571b38 (&mm->mmap_lock){++++}-{4:4}, at: dmirror_fault_and_migrate_to_device.constprop.0+0x3aa/0x6a0 [test_hmm]
> [  107.872081] 
> [  107.872081] stack backtrace:
> [  107.872348] CPU: 1 UID: 0 PID: 1098 Comm: hmm-tests Not tainted 7.1.0-rc3-00311-g4277273ca0e1 #12 PREEMPT(full) 
> [  107.872350] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS edk2-20260213-6.fc44 02/13/2026
> [  107.872354] Call Trace:
> [  107.872357]  <TASK>
> [  107.872358]  dump_stack_lvl+0x5d/0x80
> [  107.872385]  print_deadlock_bug.cold+0xc0/0xe2
> [  107.872393]  __lock_acquire+0x10cf/0x1b90
> [  107.872400]  lock_acquire+0x189/0x2f0
> [  107.872401]  ? dmirror_range_fault+0x147/0x610 [test_hmm]
> [  107.872404]  down_read+0x9b/0x4b0
> [  107.872420]  ? dmirror_range_fault+0x147/0x610 [test_hmm]
> [  107.872421]  ? lock_acquire+0x189/0x2f0
> [  107.872422]  ? __pfx_down_read+0x10/0x10
> [  107.872424]  ? __lock_acquire+0x3c2/0x1b90
> [  107.872425]  dmirror_range_fault+0x147/0x610 [test_hmm]
> [  107.872427]  ? __pfx_down_read+0x10/0x10
> [  107.872429]  ? __pfx_dmirror_range_fault+0x10/0x10 [test_hmm]
> [  107.872430]  ? __lock_acquire+0x3c2/0x1b90
> [  107.872434]  dmirror_fault_and_migrate_to_device.constprop.0+0x3bf/0x6a0 [test_hmm]
> [  107.872436]  ? __pfx_dmirror_fault_and_migrate_to_device.constprop.0+0x10/0x10 [test_hmm]
> [  107.872439]  ? find_held_lock+0x2b/0x80
> [  107.872444]  ? dmirror_device_remove_chunks+0x5b8/0xa00 [test_hmm]
> [  107.872445]  ? __is_insn_slot_addr+0xee/0x1f0
> [  107.872458]  ? lock_acquire+0x189/0x2f0
> [  107.872460]  ? avc_has_extended_perms+0x234/0x1350
> [  107.872476]  ? __might_fault+0x89/0x150
> [  107.872484]  ? lock_release+0xe1/0x320
> [  107.872486]  dmirror_fops_unlocked_ioctl+0x9ba/0xdb0 [test_hmm]
> [  107.872488]  ? ioctl_has_perm.constprop.0.isra.0+0x2fe/0x6c0
> [  107.872494]  ? __pfx_dmirror_fops_unlocked_ioctl+0x10/0x10 [test_hmm]
> [  107.872498]  ? count_memcg_events_mm.constprop.0+0x22/0x1a0
> [  107.872499]  ? __pfx_ioctl_has_perm.constprop.0.isra.0+0x10/0x10
> [  107.872501]  ? count_memcg_events_mm.constprop.0+0xaa/0x1a0
> [  107.872503]  ? lock_release+0xe1/0x320
> [  107.872504]  ? find_held_lock+0x2b/0x80
> [  107.872506]  ? exc_page_fault+0x7e/0xf0
> [  107.872510]  __x64_sys_ioctl+0x13c/0x1d0
> [  107.872521]  ? lockdep_hardirqs_on_prepare+0xd9/0x190
> [  107.872523]  do_syscall_64+0xf3/0x6a0
> [  107.872526]  ? exc_page_fault+0xde/0xf0
> [  107.872528]  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> [  107.872529] RIP: 0033:0x7f7381c543ad
> [  107.872531] Code: 04 25 28 00 00 00 48 89 45 c8 31 c0 48 8d 45 10 c7 45 b0 10 00 00 00 48 89 45 b8 48 8d 45 d0 48 89 45 c0 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1a 48 8b 45 c8 64 48 2b 04 25 28 00 00 00
> [  107.872532] RSP: 002b:00007ffc3160a9b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> [  107.872539] RAX: ffffffffffffffda RBX: 00007f7381b44000 RCX: 00007f7381c543ad
> [  107.872540] RDX: 00007ffc3160aa30 RSI: 00000000c0284803 RDI: 0000000000000022
> [  107.872541] RBP: 00007ffc3160aa00 R08: 00000000ffffffff R09: 0000000000000000
> [  107.872541] R10: 0000000000000022 R11: 0000000000000246 R12: 00007ffc3160aa24
> [  107.872542] R13: 000000000041f380 R14: 0000000000000200 R15: 00007f7381200000
> [  107.872544]  </TASK>
>
>
> Thanks,
> Balbir
>
Thanks, I could reproduce. Had lockdep dropped off so went unnoticed. It is nesting mmap_read_lock in the test suite, I will change that in next version.

--Mika


