Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3673AC83F0A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 12:31:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B3D10E66C;
	Thu, 29 Aug 2024 12:31:20 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 978A710E66C;
 Thu, 29 Aug 2024 12:31:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Fix_B?=
 =?utf-8?q?MG_CCS_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 12:31:18 -0000
Message-ID: <172493467861.831506.16116105048050673257@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829122928.423456-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240829122928.423456-1-juhapekka.heikkila@gmail.com>
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

Series: drm/i915/display: Fix BMG CCS modifiers
URL   : https://patchwork.freedesktop.org/series/137959/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
9fe5037901cabbcdf27a6fe0dfb047ca1474d363
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 341616328bc256f56d587bd5eee087338c20d84c
Author: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date:   Thu Aug 29 15:29:28 2024 +0300

    drm/i915/display: Fix BMG CCS modifiers
    
    Let I915_FORMAT_MOD_4_TILED_BMG_CCS show up as supported modifier
    
    Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
+ /mt/dim checkpatch 6080b6db64f29d15f5fa1b27d1a9f3ffc2800348 drm-intel
341616328bc2 drm/i915/display: Fix BMG CCS modifiers


