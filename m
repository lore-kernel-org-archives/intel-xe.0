Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E2C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 15:07:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5978910E22E;
	Mon,  5 Aug 2024 15:07:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C404710E22C;
 Mon,  5 Aug 2024 15:07:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_usb=3A_typec=3A_ucsi=3A_F?=
 =?utf-8?q?ix_a_potential_deadlock_in_ucsi=5Fsend=5Fcommand=5Fcommon=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 15:07:53 -0000
Message-ID: <172287047380.540582.10051744873279232094@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240805150230.258618-1-luciano.coelho@intel.com>
In-Reply-To: <20240805150230.258618-1-luciano.coelho@intel.com>
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

Series: usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common()
URL   : https://patchwork.freedesktop.org/series/136889/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9e645341d3008ce246879af606f45d0e5d21d698
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 21e827e7396b3f66261001ae39a109c3cd1d9c0f
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Mon Aug 5 18:02:30 2024 +0300

    usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common()
    
    The function returns with the ppm_lock held if there's an
    error or the PPM reports BUSY condition.
    
    Reported-by: Luciano Coelho <luciano.coelho@intel.com>
    Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")
    Cc: stable@vger.kernel.org
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
    Signed-off-by: Luca Coelho <luciano.coelho@intel.com>
+ /mt/dim checkpatch d15caf398bccf6c9d34363f65251b7192f833dc9 drm-intel
21e827e7396b usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common()
-:10: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#10: 
Reported-by: Luciano Coelho <luciano.coelho@intel.com>
Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


