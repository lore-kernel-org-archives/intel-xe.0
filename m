Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BC5EC875A
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 20:07:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D92310E09F;
	Thu,  7 Sep 2023 20:07:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9757610E09F;
 Thu,  7 Sep 2023 20:07:04 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 92379AADE4;
 Thu,  7 Sep 2023 20:07:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Date: Thu, 07 Sep 2023 20:07:04 -0000
Message-ID: <169411722459.17901.6554887630266702792@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230906200049.49674-1-gustavo.sousa@intel.com>
In-Reply-To: <20230906200049.49674-1-gustavo.sousa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Re?=
 =?utf-8?q?turn_-EPROBE=5FDEFER_from_xe=5Fdisplay=5Fdriver=5Fprobe=5Fdefer?=
 =?utf-8?b?KCkgKHJldjIp?=
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

Series: Return -EPROBE_DEFER from xe_display_driver_probe_defer() (rev2)
URL   : https://patchwork.freedesktop.org/series/123356/
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
commit 59716c5ecabc91f3958fe7de15ff6b623d4a8b57
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Wed Sep 6 17:00:49 2023 -0300

    fixup! drm/xe/display: Implement display support
    
    The function xe_display_driver_probe_defer() is supposed to return
    -EPROBE_DEFER when not yet ready to continue the probing, but the
    current implementation is actually returning 1 instead of the proper
    value, which would probably keep the probe operation to be attempted
    again. Fix that by returning the expected value in case we need to defer
    the probe.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch bae46e59a7f667734376ddb0d2451967dfb264f1 drm-intel
59716c5ec fixup! drm/xe/display: Implement display support


