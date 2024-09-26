Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E5FCCFA10
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 02:59:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E472310E124;
	Thu, 26 Sep 2024 02:59:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED0C610E124;
 Thu, 26 Sep 2024 02:59:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_fix_conn?=
 =?utf-8?q?ector_refcounting?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 02:59:37 -0000
Message-ID: <172731957796.1103855.12837444714221682715@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240924153022.2255299-1-jani.nikula@intel.com>
In-Reply-To: <20240924153022.2255299-1-jani.nikula@intel.com>
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

Series: drm/i915/hdcp: fix connector refcounting
URL   : https://patchwork.freedesktop.org/series/139056/
State : success

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
commit 2493d8d85c5f50e6771e295f35a9c4134000a490
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 24 18:30:22 2024 +0300

    drm/i915/hdcp: fix connector refcounting
    
    We acquire a connector reference before scheduling an HDCP prop work,
    and expect the work function to release the reference.
    
    However, if the work was already queued, it won't be queued multiple
    times, and the reference is not dropped.
    
    Release the reference immediately if the work was already queued.
    
    Fixes: a6597faa2d59 ("drm/i915: Protect workers against disappearing connectors")
    Cc: Sean Paul <seanpaul@chromium.org>
    Cc: Suraj Kandpal <suraj.kandpal@intel.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Cc: <stable@vger.kernel.org> # v5.10+
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
    Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 88d592f72f7bc508d6a027b1f96aa2e53f803e1b drm-intel
2493d8d85c5f drm/i915/hdcp: fix connector refcounting


