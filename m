Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8DF8C71153
	for <intel-xe@archiver.kernel.org>; Mon, 11 Sep 2023 20:00:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F17710E1C8;
	Mon, 11 Sep 2023 20:00:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id DD39310E1C8;
 Mon, 11 Sep 2023 20:00:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id D8ECAAA01E;
 Mon, 11 Sep 2023 20:00:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Mon, 11 Sep 2023 20:00:49 -0000
Message-ID: <169446244988.31366.9715472731231978868@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906212333.61119-1-gustavo.sousa@intel.com>
In-Reply-To: <20230906212333.61119-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Pr?=
 =?utf-8?q?operly_return_-EPROBE=5FDEFER_if_xe=5Fdisplay=5Fdriver=5Fprobe?=
 =?utf-8?b?X2RlZmVyKCkgKHJldjMp?=
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

Series: Properly return -EPROBE_DEFER if xe_display_driver_probe_defer() (rev3)
URL   : https://patchwork.freedesktop.org/series/123357/
State : success

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
commit c9aec3afce0eaf81f58adc207832e12c6bd4d030
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Sep 6 18:23:33 2023 -0300

    fixup! drm/xe/display: Implement display support
    
    The function xe_display_driver_probe_defer() was supposed to return
    -EPROBE_DEFER when not yet ready to continue the probing, but the
    current implementation is actually returning 1 instead of the proper
    value, which would probably keep the probe operation to be attempted
    again.
    
    Fix that by making xe_display_driver_probe_defer() return a boolean just
    like intel_display_driver_probe_defer() and return -EPROBE_DEFER on the
    caller if necessary.
    
    v2:
      - Make xe_display_driver_probe_defer() return a boolean and return
        -EPROBE_DEFER on the caller. (Lucas)
    
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 8b1dfde2899992006000b358a282173604338f88 drm-intel
c9aec3afc fixup! drm/xe/display: Implement display support


