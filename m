Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06C7DC0032E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Oct 2023 18:53:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCB5A10E6CF;
	Wed, 25 Oct 2023 18:53:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id A0EB210E6CF;
 Wed, 25 Oct 2023 18:53:16 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 933BFAADED;
 Wed, 25 Oct 2023 18:53:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 25 Oct 2023 18:53:16 -0000
Message-ID: <169825999660.20488.823189402251947357@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231025172836.770398-1-jani.nikula@intel.com>
In-Reply-To: <20231025172836.770398-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_se?=
 =?utf-8?q?ries_starting_with_=5B1/2=5D_Revert_=22drm/i915=3A_Abstract_dis?=
 =?utf-8?q?play_info_away_during_probe=22?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: series starting with [1/2] Revert "drm/i915: Abstract display info away during probe"
URL   : https://patchwork.freedesktop.org/series/125590/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 4491ee63043a93f732a0b0ff23c080e06aa35e9c
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Wed Oct 25 20:28:36 2023 +0300

    drm/i915: Abstract display info away during probe
    
    The goal is to have this function ready for Xe to use
    directly. So, let's use the available macro.
    
    Cc: Jani Nikula <jani.nikula@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Jani Nikula <jani.nikula@intel.com>
    Link: https://patchwork.freedesktop.org/patch/msgid/20230929205023.1202735-1-rodrigo.vivi@intel.com
    (cherry picked from commit 4c7690614c8bbd6cd29b949f9084ddb294ffe284)
+ /mt/dim checkpatch bd3d7e8aa312ce25c5797388f753151f024bec02 drm-intel
4eaa64668 Revert "drm/i915: Abstract display info away during probe"
-:6: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '7be6e33f2f47b7c2f7dbd8ecca25c204a2df5d07', maybe rebased or not pulled?
#6: 
This reverts commit 7be6e33f2f47b7c2f7dbd8ecca25c204a2df5d07.

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
4491ee630 drm/i915: Abstract display info away during probe


