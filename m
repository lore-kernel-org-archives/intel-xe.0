Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CE3E7716A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Dec 2024 08:55:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2B310E45A;
	Tue, 17 Dec 2024 08:55:25 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBCA310E45A;
 Tue, 17 Dec 2024 08:55:24 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_Fix_Repe?=
 =?utf-8?q?ater_authentication_during_topology_change?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Dec 2024 08:55:24 -0000
Message-ID: <173442572475.3702663.9924376257574607957@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241217083723.2883317-1-suraj.kandpal@intel.com>
In-Reply-To: <20241217083723.2883317-1-suraj.kandpal@intel.com>
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

Series: drm/i915/hdcp: Fix Repeater authentication during topology change
URL   : https://patchwork.freedesktop.org/series/142699/
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
commit f77d77df996c46d140208e69e6a9f93db880f0fa
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Dec 17 14:07:23 2024 +0530

    drm/i915/hdcp: Fix Repeater authentication during topology change
    
    When topology changes before beginning a new HDCP authentication by
    sending AKE_init message we need to first authenticate only the
    repeater if that fails only then makes sense to enable a new HDCP
    authentication. Even though it made sense to not enable HDCP directly
    from check_link and schedule it repeater authentication needs to be
    done immidieatly
    
    Fixes: 47ef55a8b784 ("drm/i915/hdcp: Don't enable HDCP2.2 directly from check_link")
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch e7c9466eaad2e3e60e6dbd2725a648b58c717fb0 drm-intel
f77d77df996c drm/i915/hdcp: Fix Repeater authentication during topology change


