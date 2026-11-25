Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE6606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 00:56:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA76010E8CC;
	Wed, 25 Nov 2026 00:56:48 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E7CE10E8CC;
 Wed, 25 Nov 2026 00:56:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_tty=3A_vblank_waiting_out?=
 =?utf-8?q?_on_crtc_0_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Nov 2026 00:56:47 -0000
Message-ID: <179556820751.81525.1844605762905154210@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
In-Reply-To: <20261115122441.3141883-1-michal.grzelak@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: tty: vblank waiting out on crtc 0 (rev7)
URL   : https://patchwork.freedesktop.org/series/178607/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 356fde9a87479ab3dec39d974e68cd36ab8ba722
Author: Michał Grzelak <michal.grzelak@linux.intel.com>
Date:   Sun Nov 15 13:24:41 2026 +0100

    Revert "serial: 8250: Switch to nbcon console, take 2"
    
    This reverts commit d3539347022ad4eeb9dbd29c50bfca17b9d8a146.
    
    This revert consists of 6 additional reverts; all of them in order of
    applying:
    - Revert "serial: 8250: export and rename wait_for_xmitr()" [2c5942fd0300cb966339dd0366890be626b405e8]
    - Revert "printk: fix kernel-doc name for nbcon_write_context_is_braille" [19ed235c1adcaf40f05997dfe8b96eb209effd35]
    - Revert "braille: nbcon: Allow to use a serial console with NBCON API as Braille console" [c83e3d2912432107148cc5e288ddd153a84c0f43]
    - Revert "serial: 8250: Change console_msr_work to IRQ_WORK_LAZY" [37aba16e7943634eb3e5e2e7e850ebb38500d935]
    - Reapply "serial: 8250: drop lockdep annotation from serial8250_clear_IER()" [bbbb07f9fad6518090b7171dd8f5f737d8ddb63b]
    - Revert "serial: 8250: Switch to nbcon console, take 2" [d3539347022ad4eeb9dbd29c50bfca17b9d8a146]
    - Revert "serial: 8250_mid: wait for LSR tx empty before setting termios" [1c305d5f1daabd317a60b6a2e2ac6b1aff7e05df]
    
    removed 2 conflicting #include's on top.
    
    Signed-off-by: Michał Grzelak <michal.grzelak@linux.intel.com>
+ /mt/dim checkpatch 59b46a8902d6416190f72ddc25ba74881639af3a drm-intel
356fde9a8747 Revert "serial: 8250: Switch to nbcon console, take 2"
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
- Revert "serial: 8250: export and rename wait_for_xmitr()" [2c5942fd0300cb966339dd0366890be626b405e8]

total: 0 errors, 1 warnings, 0 checks, 737 lines checked


