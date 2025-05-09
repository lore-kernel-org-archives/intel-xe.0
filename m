Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204C0C3ABC5
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 02:19:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D995310E250;
	Fri,  9 May 2025 02:19:45 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FB3E10E24F;
 Fri,  9 May 2025 02:19:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_Send_?=
 =?utf-8?q?DSI_DCS_commands_with_pipeline_flush_in_High_Speed?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: gareth.yu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 May 2025 02:19:45 -0000
Message-ID: <174675718552.61321.1511302686947069496@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250509021327.649003-1-gareth.yu@intel.com>
In-Reply-To: <20250509021327.649003-1-gareth.yu@intel.com>
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

Series: drm/i915/display: Send DSI DCS commands with pipeline flush in High Speed
URL   : https://patchwork.freedesktop.org/series/148781/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2c4b4dbb04288f1ac05cd13970b6242994a88ea0
Author: Gareth Yu <gareth.yu@intel.com>
Date:   Fri May 9 10:13:27 2025 +0800

    drm/i915/display: Send DSI DCS commands with pipeline flush in High Speed
    
    With all of the boundary conditions when streaming the commands B2B in our
    validation (part of the reason we added the flush),  the Flush effectively
    serializes the transmission of each command enqueued within the command
    dispatcher to one per V. Blank line which simplifies the behavior of the
    High Speed Arbitration.
    
    So, unless we absolutely have to burst these to the Sink, we should be using
    the Pipeline Flush bit to serialize the commands.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/14247
    
    Cc : Suraj Kandpal <suraj.kandpal@intel.com>
    Cc : Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Gareth Yu <gareth.yu@intel.com>
+ /mt/dim checkpatch 9dcef725fabeef32df86af6e5880acbfcb84e7a5 drm-intel
2c4b4dbb0428 drm/i915/display: Send DSI DCS commands with pipeline flush in High Speed
-:13: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#13: 
So, unless we absolutely have to burst these to the Sink, we should be using

total: 0 errors, 1 warnings, 0 checks, 21 lines checked


