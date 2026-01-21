Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72DAFC44502
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 09:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7F810E71A;
	Wed, 21 Jan 2026 09:06:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC49910E728;
 Wed, 21 Jan 2026 09:06:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_REGRESSION_on_linux-next_?=
 =?utf-8?q?=28next-20260115=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 09:06:57 -0000
Message-ID: <176898641776.176277.5586053108709815128@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
In-Reply-To: <555f1c56-0f74-41bf-8bd2-6217e0aab0c6@intel.com>
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

Series: REGRESSION on linux-next (next-20260115)
URL   : https://patchwork.freedesktop.org/series/160408/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4923fb2593a8440ea44668ec065f613e5cfc08a3
Author: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date:   Wed Jan 21 10:01:54 2026 +0100

    REGRESSION on linux-next (next-20260115)
    
    On 2026-01-21 13:59:38 [+0530], Borah, Chaitanya Kumar wrote:
    >
    > Looks like it.
    >   9:          1          0  IO-APIC   9-fasteoi   acpi, INT0002
    
    Does the following help?
    
    My guess would be that the int0002_vgpio.c results in a warning without
    requesting the interrupt while the interrupt.h change should fix it and
    the warning should be gone.
    
    > ==
    > Chaitanya
    
    Sebastian
+ /mt/dim checkpatch b7c3274a57563fc1652889043a6e8d08473e5f31 drm-intel
4923fb2593a8 REGRESSION on linux-next (next-20260115)
-:49: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 18 lines checked


