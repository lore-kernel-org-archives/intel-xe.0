Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E78E74AD2
	for <intel-xe@archiver.kernel.org>; Tue,  3 Dec 2024 20:53:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 805E310E248;
	Tue,  3 Dec 2024 20:53:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA7D910E25F;
 Tue,  3 Dec 2024 20:53:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_usb=3A_typec=3A_ucsi=3A_F?=
 =?utf-8?q?ix_connector_status_writing_past_buffer_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Dec 2024 20:53:28 -0000
Message-ID: <173325920888.2143460.2904903492590898982@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241203200010.2821132-1-lucas.demarchi@intel.com>
In-Reply-To: <20241203200010.2821132-1-lucas.demarchi@intel.com>
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
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: usb: typec: ucsi: Fix connector status writing past buffer size
URL   : https://patchwork.freedesktop.org/series/142075/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 5663a9918166e75ed3e773111f34ccdbcfe5828b
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Dec 3 12:00:10 2024 -0800

    usb: typec: ucsi: Fix connector status writing past buffer size
    
    Similar to commit 65c4c9447bfc ("usb: typec: ucsi: Fix a missing bits to
    bytes conversion in ucsi_init()"), there was a missing conversion from
    bits to bytes. Here the outcome is worse though: since the value is
    lower than UCSI_MAX_DATA_LENGTH, instead of bailing out with an error,
    it writes past the buffer size.
    
    The error is then seen in other places like below:
    
            Oops: general protection fault, probably for non-canonical address 0x891e812cd0ed968: 0000 [#1] PREEMPT SMP NOPTI
            CPU: 3 UID: 110 PID: 906 Comm: prometheus-node Not tainted 6.13.0-rc1-xe #1
            Hardware name: Intel Corporation Lunar Lake Client Platform/LNL-M LP5 RVP1, BIOS LNLMFWI1.R00.3222.D84.2410171025 10/17/2024
            RIP: 0010:power_supply_get_property+0x3e/0xe0
            Code: 85 c0 7e 4f 4c 8b 07 89 f3 49 89 d4 49 8b 48 20 48 85 c9 74 72 49 8b 70 18 31 d2 31 c0 eb 0b 83 c2 01 48 63 c2 48 39 c8 73 5d <3b> 1c 86 75 f0 49 8b 40 28 4c 89 e2 89 de ff d0 0f 1f 00 5b 41 5c
            RSP: 0018:ffffc900017dfa50 EFLAGS: 00010246
            RAX: 0000000000000000 RBX: 0000000000000011 RCX: c963b02c06092008
            RDX: 0000000000000000 RSI: 0891e812cd0ed968 RDI: ffff888121dd6800
            RBP: ffffc900017dfa68 R08: ffff88810a4024b8 R09: 0000000000000000
            R10: 0000000000000000 R11: 0000000000000000 R12: ffffc900017dfa78
            R13: ffff888121dd6800 R14: ffff888138ad2c00 R15: ffff88810c57c528
            FS:  00007713a2ffd6c0(0000) GS:ffff88846f380000(0000) knlGS:0000000000000000
            CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
            CR2: 000000c0004b1000 CR3: 0000000121ce8003 CR4: 0000000000f72ef0
            DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
            DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
            PKRU: 55555554
            Call Trace:
             <TASK>
             ? show_regs+0x6c/0x80
             ? die_addr+0x37/0xa0
             ? exc_general_protection+0x1c1/0x440
             ? asm_exc_general_protection+0x27/0x30
             ? power_supply_get_property+0x3e/0xe0
             power_supply_hwmon_read+0x50/0xe0
             hwmon_attr_show+0x46/0x170
             dev_attr_show+0x1a/0x70
             sysfs_kf_seq_show+0xaa/0x120
             kernfs_seq_show+0x41/0x60
    
    Just use the buffer size as argument to fix it.
    
    Fixes: 226ff2e681d0 ("usb: typec: ucsi: Convert connector specific commands to bitmaps")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch fac293c5c775a53ccd44f64fae2d09fa66747ea1 drm-intel
5663a9918166 usb: typec: ucsi: Fix connector status writing past buffer size
-:15: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#15: 
	Oops: general protection fault, probably for non-canonical address 0x891e812cd0ed968: 0000 [#1] PREEMPT SMP NOPTI

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


