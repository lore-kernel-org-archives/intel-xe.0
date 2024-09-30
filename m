Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34994CDD1D6
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 20:08:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F205310E59A;
	Mon, 30 Sep 2024 20:08:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091A210E599;
 Mon, 30 Sep 2024 20:08:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_i915=3A_Fix_HBLANK_Expans?=
 =?utf-8?q?ion_Quirk_Causing_Modeset_Failure_on_Dell_WD19TB_Dock_at_3440x144?=
 =?utf-8?q?0=40100Hz?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Benjamin Hoefs" <bendhoefs@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 20:08:57 -0000
Message-ID: <172772693703.1138856.13378802484840177539@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926002533.10153-2-bendhoefs@gmail.com>
In-Reply-To: <20240926002533.10153-2-bendhoefs@gmail.com>
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

Series: i915: Fix HBLANK Expansion Quirk Causing Modeset Failure on Dell WD19TB Dock at 3440x1440@100Hz
URL   : https://patchwork.freedesktop.org/series/139320/
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
commit 0183e57c4a01abfa678bd1b6a9c0cd8cf22386cb
Author: Benjamin Hoefs <bendhoefs@gmail.com>
Date:   Wed Sep 25 19:25:34 2024 -0500

    i915: Fix HBLANK Expansion Quirk Causing Modeset Failure on Dell WD19TB Dock at 3440x1440@100Hz
    
    Hello,
    
    I am using a Dell WD19TB dock with a 3440x1440 monitor. Using it at
    100Hz used to work but recently I tried it again and discovered it no longer
    did, specifically the modeset seems to silently fail with no error message in
    userspace utilities like kscreen-doctor and xrandr and no output in dmesg.
    I found the problematic commit using git bisect to be
    55eaef164174480df6827edeac15620f3cbcd52b "Handle the Synaptics HBlank
    expansion quirk".
    
    I found the issue to be the hblank_expasion_quirk_needs_dsc function which uses
    the following comparison in the current kernel tree:
    
    if (mode_hblank_period_ns(adjusted_mode) > hblank_limit)
            return false;
    
    with hblank_limit being earlier set as
    
    int hblank_limit = is_uhbr_sink ? 500 : 300;
    
    However, my monitor's HBLANK period in the 3440x1440@100Hz mode is
    exactly 300 ns as verified by this printk immediately before the
    problematic comparison.
    
    printk(KERN_INFO "Hello, kernel world! %i\n",
            mode_hblank_period_ns(adjusted_mode));
    [   38.429839] Hello, kernel world! 300
    
    With the attached change the modeset works as expected at 100Hz. Would it be
    acceptable to modify the comparison from > to >= here?
    
    I'll do my best to provide any additional details you may need although
    that printk and '=' sign is the only kernel code I've written, so my best may
    not be great :).
    
    Signed-off-by: Benjamin D. Hoefs <bendhoefs@gmail.com>
+ /mt/dim checkpatch 4e4d7873ac763aa0bd9207ea9ec2b89bb52a6fe1 drm-intel
0183e57c4a01 i915: Fix HBLANK Expansion Quirk Causing Modeset Failure on Dell WD19TB Dock at 3440x1440@100Hz
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
100Hz used to work but recently I tried it again and discovered it no longer

-:14: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit 55eaef164174 ("drm/i915/dp_mst: Handle the Synaptics HBlank expansion quirk")'
#14: 
55eaef164174480df6827edeac15620f3cbcd52b "Handle the Synaptics HBlank

-:56: WARNING:FROM_SIGN_OFF_MISMATCH: From:/Signed-off-by: email name mismatch: 'From: Benjamin Hoefs <bendhoefs@gmail.com>' != 'Signed-off-by: Benjamin D. Hoefs <bendhoefs@gmail.com>'

total: 1 errors, 2 warnings, 0 checks, 8 lines checked


