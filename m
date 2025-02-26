Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20FD0C18E7C
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 14:46:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC70B10E6B4;
	Wed, 26 Feb 2025 14:46:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE76A10E6B4;
 Wed, 26 Feb 2025 14:46:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/mst=3A_update_ma?=
 =?utf-8?q?x_stream_count_to_match_number_of_pipes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Feb 2025 14:46:14 -0000
Message-ID: <174058117490.2360239.9019217544872074912@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250226135626.1956012-1-jani.nikula@intel.com>
In-Reply-To: <20250226135626.1956012-1-jani.nikula@intel.com>
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

Series: drm/i915/mst: update max stream count to match number of pipes
URL   : https://patchwork.freedesktop.org/series/145489/
State : warning

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
commit 99a4b811f5fbd626d869a90555b251888b46d8dc
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Wed Feb 26 15:56:26 2025 +0200

    drm/i915/mst: update max stream count to match number of pipes
    
    We create the stream encoders and attach connectors for each pipe we
    have. As the number of pipes has increased, we've failed to update the
    topology manager maximum number of payloads to match that. Bump up the
    max stream count to match number of pipes, enabling the fourth stream on
    platforms that support four pipes.
    
    Cc: stable@vger.kernel.org
    Cc: Imre Deak <imre.deak@intel.com>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch 4a2f1c823287a84dc0bd46c5a93545dfe49967f2 drm-intel
99a4b811f5fb drm/i915/mst: update max stream count to match number of pipes
-:31: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


