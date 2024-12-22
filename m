Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBF0E77197
	for <intel-xe@archiver.kernel.org>; Thu,  2 Jan 2025 18:11:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5980310E0B0;
	Thu,  2 Jan 2025 18:11:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=angband.pl header.i=@angband.pl header.b="q2P/pQ0A";
	dkim-atps=neutral
X-Greylist: delayed 2581 seconds by postgrey-1.36 at gabe;
 Sun, 22 Dec 2024 12:48:24 UTC
Received: from vega.angband.pl (vega.angband.pl
 [IPv6:2001:bc8:1d90:444:dc00:ff:fe0d:3245])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8573210E1B0
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Dec 2024 12:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=angband.pl; 
 s=vega;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Subject:To:From:Date:Sender:Reply-To:Cc:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1MOmXSqJFcp0JBjj7YITqZSTRH+wf/hsWK1AzZyO9ZI=; b=q2P/pQ0ADQFATsY77B/9eHsPLF
 9BpEX+sbte0qGKiWu0XroqdAfzwgbz97TuDo/TQB0qeVRGV+BgUgJnYwm6nOG56Xv9F69sGjTJe7n
 Q4P37kDyJ+yGAUQo4KpVOwCTb/fXqiQ5OyoXp0h9LZvdOTHFNAu64fhFWkpjdoWFNF10=;
Received: from kilobyte by vega.angband.pl with local (Exim 4.96)
 (envelope-from <kilobyte@angband.pl>) id 1tPKi0-000744-1X
 for intel-xe@lists.freedesktop.org; Sun, 22 Dec 2024 13:05:20 +0100
Date: Sun, 22 Dec 2024 13:05:20 +0100
From: Adam Borowski <kilobyte@angband.pl>
To: intel-xe@lists.freedesktop.org
Subject: WARN: event xe_bo_move has unsafe dereference of argument 4
Message-ID: <20241222120520.GA26952@angband.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on vega.angband.pl); SAEximRunCond expanded to false
X-Mailman-Approved-At: Thu, 02 Jan 2025 18:11:42 +0000
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

Hi!
Got this warn:

[   15.500525] [ T1043] WARNING: CPU: 50 PID: 1043 at kernel/trace/trace_events.c:577 trace_event_raw_init+0xd9/0x450
[   15.510768] [ T1043] Modules linked in: fjes(+) xe(+) cec drm_gpuvm drm_ttm_helper ttm drm_exec drm_suballoc_helper drm_buddy jc42 gpu_sched drm_display_helper sha256_ssse3 drm_kms_helper ee1004
[   15.527938] [ T1043] CPU: 50 UID: 0 PID: 1043 Comm: (udev-worker) Not tainted 6.13.0-rc3-00228-g783d0c4ebb49 #1
[   15.537913] [ T1043] Hardware name: To Be Filled By O.E.M. To Be Filled By O.E.M./X399 Taichi, BIOS P4.01 05/02/2023
[   15.548322] [ T1043] RIP: 0010:trace_event_raw_init+0xd9/0x450
[   15.554055] [ T1043] Code: a3 cf 0f 83 4a 03 00 00 e8 e4 e0 ff ff 84 c0 74 10 8b 0c 24 48 c7 c0 fe ff ff ff 48 d3 c0 49 21 c5 4d 85 ed 0f 84 53 ff ff ff <0f> 0b ba 01 00 00 00 41 f6 c5 01 0f 85 4f 1a d5 ff 66 0f 1f 44 00
[   15.573470] [ T1043] RSP: 0018:ffffa6f818abfbe0 EFLAGS: 00010206
[   15.579379] [ T1043] RAX: ffffffffffffffdf RBX: ffffffffc0c088b2 RCX: 0000000000000005
[   15.587190] [ T1043] RDX: 0000000000000002 RSI: 0000000000000001 RDI: ffffffffc0c088a7
[   15.595000] [ T1043] RBP: ffffffffc0c087c0 R08: 00000000000000de R09: 00000000000000de
[   15.602811] [ T1043] R10: 0000000000000000 R11: ffffffffc0c088b2 R12: ffffffffc0c098e0
[   15.610620] [ T1043] R13: 0000000000000018 R14: 0000000000000000 R15: 0000000000000039
[   15.618431] [ T1043] FS:  00007f1ce6fd88c0(0000) GS:ffff911a7ea80000(0000) knlGS:0000000000000000
[   15.627193] [ T1043] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   15.633621] [ T1043] CR2: 00007f1ce61ff25c CR3: 000000209a1e7000 CR4: 00000000003506f0
[   15.641433] [ T1043] Call Trace:
[   15.644566] [ T1043]  <TASK>
[   15.647355] [ T1043]  ? trace_event_raw_init+0xd9/0x450
[   15.652484] [ T1043]  ? __warn.cold+0x93/0xf3
[   15.656749] [ T1043]  ? trace_event_raw_init+0xd9/0x450
[   15.661877] [ T1043]  ? report_bug+0xe2/0x170
[   15.666141] [ T1043]  ? handle_bug+0x4f/0x90
[   15.670316] [ T1043]  ? exc_invalid_op+0x13/0x60
[   15.674836] [ T1043]  ? asm_exc_invalid_op+0x16/0x20
[   15.679706] [ T1043]  ? trace_event_raw_init+0xd9/0x450
[   15.684833] [ T1043]  event_init+0x28/0x60
[   15.688838] [ T1043]  trace_module_notify+0x186/0x230
[   15.693794] [ T1043]  notifier_call_chain+0x54/0xc0
[   15.698576] [ T1043]  blocking_notifier_call_chain_robust+0x53/0x90
[   15.704743] [ T1043]  load_module+0x1f21/0x2240
[   15.709182] [ T1043]  ? init_module_from_file+0x75/0xa0
[   15.714310] [ T1043]  init_module_from_file+0x75/0xa0
[   15.719267] [ T1043]  idempotent_init_module+0xee/0x2c0
[   15.724395] [ T1043]  __x64_sys_finit_module+0x61/0xc0
[   15.729438] [ T1043]  do_syscall_64+0x47/0x130
[   15.733786] [ T1043]  entry_SYSCALL_64_after_hwframe+0x4b/0x53
[   15.739522] [ T1043] RIP: 0033:0x7f1ce718d5b9
[   15.743782] [ T1043] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 37 88 0d 00 f7 d8 64 89 01 48
[   15.763196] [ T1043] RSP: 002b:00007ffc5ac119b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
[   15.771441] [ T1043] RAX: ffffffffffffffda RBX: 000055ae066edd80 RCX: 00007f1ce718d5b9
[   15.779251] [ T1043] RDX: 0000000000000000 RSI: 00007f1ce6fd0541 RDI: 000000000000001b
[   15.787061] [ T1043] RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
[   15.794871] [ T1043] R10: 00007f1ce7266ac0 R11: 0000000000000246 R12: 00007f1ce6fd0541
[   15.802681] [ T1043] R13: 0000000000020000 R14: 000055ae066ed440 R15: 0000000000000000
[   15.810493] [ T1043]  </TASK>
[   15.813369] [ T1043] ---[ end trace 0000000000000000 ]---
[   15.818670] [ T1043] event xe_bo_move has unsafe dereference of argument 4
[   15.825448] [ T1043] print_fmt: "move_lacks_source:%s, migrate object %p [size %zu] from %s to %s device_id:%s", REC->move_lacks_source ? "yes" : "no", REC->bo, REC->size, xe_mem_type_to_name[REC->old_placement], xe_mem_type_to_name[REC->new_placement], __get_str(device_id)

I see recent fixes to dereference checks in the event machinery from Dec 16
thus you probably already noticed this and have a fix on the way -- but
reporting just in case.


Meow!
-- 
⢀⣴⠾⠻⢶⣦⠀
⣾⠁⢠⠒⠀⣿⡁ The moon landing was staged, but the director insisted they
⢿⡄⠘⠷⠚⠋⠀ shoot on location -- so they did.
⠈⠳⣄⠀⠀⠀⠀
