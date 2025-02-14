Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B94C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 19:11:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F32610E079;
	Fri, 14 Feb 2025 19:11:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B01B10ED38;
 Fri, 14 Feb 2025 19:11:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5B1?=
 =?utf-8?q?/3=5D_drm/xe/display=3A_Move_display_runtime_suspend_to_a_later_p?=
 =?utf-8?q?oint?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 19:11:34 -0000
Message-ID: <173956029443.2134078.5818051062135004513@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214175600.504481-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250214175600.504481-1-rodrigo.vivi@intel.com>
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

Series: series starting with [1/3] drm/xe/display: Move display runtime suspend to a later point
URL   : https://patchwork.freedesktop.org/series/144900/
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
commit 804be7396517cf41cb3d475983a45ee0f29f7794
Author: Rodrigo Vivi <rodrigo.vivi@intel.com>
Date:   Fri Feb 14 12:56:00 2025 -0500

    drm/xe/display: Add missing display power handling on non-d3cold rpm
    
    On the regular igfx runtime pm sequence where d3cold is not
    possible, the proper calls to power display are required.
    
    Align with i915.
    
    v2: Rebase only.
    
    Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 drm-intel
74e39800c420 drm/xe/display: Move display runtime suspend to a later point
6bef7d8896e4 drm/{i915, xe}/display: Move dsm registration under intel_driver
804be7396517 drm/xe/display: Add missing display power handling on non-d3cold rpm


