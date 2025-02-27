Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933A7C197BF
	for <intel-xe@archiver.kernel.org>; Thu, 27 Feb 2025 21:48:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6293510EBA1;
	Thu, 27 Feb 2025 21:48:33 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9097310EBA1;
 Thu, 27 Feb 2025 21:48:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/audio=3A_Extend_?=
 =?utf-8?q?Wa=5F14020863754_to_Xe3=5FLPD_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 27 Feb 2025 21:48:31 -0000
Message-ID: <174069291158.2883404.15022556187219150796@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250227-xe3lpd-wa-14020863754-v2-0-92b35de1c563@intel.com>
In-Reply-To: <20250227-xe3lpd-wa-14020863754-v2-0-92b35de1c563@intel.com>
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

Series: drm/i915/audio: Extend Wa_14020863754 to Xe3_LPD (rev2)
URL   : https://patchwork.freedesktop.org/series/145491/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit d1d5a2fd23d253c3b42e34690703fc9080f0351a
Author: Gustavo Sousa <gustavo.sousa@intel.com>
Date:   Thu Feb 27 17:28:18 2025 -0300

    drm/i915/audio: Extend Wa_14020863754 to Xe3_LPD
    
    Workaround Wa_14020863754 also applies to Xe3_LPD. Update
    needs_wa_14020863754() accordingly.
    
    Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
+ /mt/dim checkpatch 6badede10d92c242241bd7bf59a5488b5eba5aa7 drm-intel
f3473353afbb drm/i915/display: Use IP version check for Wa_14020863754
d1d5a2fd23d2 drm/i915/audio: Extend Wa_14020863754 to Xe3_LPD


