Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080A6D206AC
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 07:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE03310E123;
	Wed, 16 Oct 2024 07:52:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E694910E123;
 Wed, 16 Oct 2024 07:52:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/display=3A_plane?=
 =?utf-8?q?_property_for_async_supported_modifiers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 07:52:24 -0000
Message-ID: <172906514493.1272578.14797435148202917760@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016053626.2850384-1-arun.r.murthy@intel.com>
In-Reply-To: <20241016053626.2850384-1-arun.r.murthy@intel.com>
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

Series: drm/i915/display: plane property for async supported modifiers
URL   : https://patchwork.freedesktop.org/series/140037/
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
commit 1057af4d57f072100a90999e99fe633b70e3f62d
Author: Arun R Murthy <arun.r.murthy@intel.com>
Date:   Wed Oct 16 11:06:26 2024 +0530

    drm/i915/display: plane property for async supported modifiers
    
    Create a i915 private plane property for sharing the async supported
    modifiers to the user.
    UMD related discussion requesting the same
    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123
    
    Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
+ /mt/dim checkpatch 0bebd793802b4eae14c71400e833cda8f91b0557 drm-intel
1057af4d57f0 drm/i915/display: plane property for async supported modifiers
-:10: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#10: 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29618#note_2487123

total: 0 errors, 1 warnings, 0 checks, 122 lines checked


