Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C89AC52D6F
	for <intel-xe@archiver.kernel.org>; Wed,  7 Aug 2024 06:37:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19BAF10E03B;
	Wed,  7 Aug 2024 06:37:49 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311010E0BF;
 Wed,  7 Aug 2024 06:37:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_usb=3A_typec=3A_ucsi=3A_F?=
 =?utf-8?q?ix_a_potential_deadlock_in_ucsi=5Fsend=5Fcommand=5Fcommon=28=29_?=
 =?utf-8?q?=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Aug 2024 06:37:47 -0000
Message-ID: <172301266746.545083.7486103903044705772@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240807062729.3159701-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20240807062729.3159701-1-chaitanya.kumar.borah@intel.com>
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

Series: usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common() (rev2)
URL   : https://patchwork.freedesktop.org/series/136889/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
66551fd1be58212fb46d0bc97f2e5ae43c69b733
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9b8e8cba83bf99b8d9ee0546493a1fddd82e5631
Author: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date:   Wed Aug 7 11:57:29 2024 +0530

    usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common()
    
    The function returns with the ppm_lock held if there's an
    error or the PPM reports BUSY condition.
    
    This is a core-for-ci patch for [1]
    
    [1] https://lore.kernel.org/linux-usb/20240806112029.2984319-1-heikki.krogerus@linux.intel.com/
    
    Reported-by: Luciano Coelho <luciano.coelho@intel.com>
    Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")
    References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11849
    Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
+ /mt/dim checkpatch 194dde5bb5831ec3973cab0a895f1bc94e8ec0b7 drm-intel
9b8e8cba83bf usb: typec: ucsi: Fix a potential deadlock in ucsi_send_command_common()
-:12: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#12: 
[1] https://lore.kernel.org/linux-usb/20240806112029.2984319-1-heikki.krogerus@linux.intel.com/

-:14: WARNING:BAD_REPORTED_BY_LINK: Reported-by: should be immediately followed by Closes: with a URL to the report
#14: 
Reported-by: Luciano Coelho <luciano.coelho@intel.com>
Fixes: 5e9c1662a89b ("usb: typec: ucsi: rework command execution functions")

-:16: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#16: 
References: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/11849

total: 0 errors, 3 warnings, 0 checks, 17 lines checked


