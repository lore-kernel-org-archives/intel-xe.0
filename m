Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A2CECE582
	for <intel-xe@archiver.kernel.org>; Tue, 10 Sep 2024 09:46:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61CA910E75C;
	Tue, 10 Sep 2024 09:46:14 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A7610E754;
 Tue, 10 Sep 2024 09:46:13 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_HDCP_intel=5Fdisplay_refa?=
 =?utf-8?q?ctors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Sep 2024 09:46:13 -0000
Message-ID: <172596157319.979952.10064444855059500914@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240910074712.544007-1-suraj.kandpal@intel.com>
In-Reply-To: <20240910074712.544007-1-suraj.kandpal@intel.com>
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

Series: HDCP intel_display refactors
URL   : https://patchwork.freedesktop.org/series/138453/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c62d7e164862503a3662a095da1c6c9014248cb2
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 08dfad7b8d6d4e40baadba2d0bafd7adee168f15
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Tue Sep 10 13:17:11 2024 +0530

    drm/i915/hdcp: Use intel_display in hdcp_gsc
    
    Use intel_display structure instead of drm_i915_private wherever
    possible in hdcp_gsc related files.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch bab1666fc2379a31ac48e7d61683d3edeaf29244 drm-intel
85914f5c4211 drm/i915/hdcp: Move to using intel_display in intel_hdcp
08dfad7b8d6d drm/i915/hdcp: Use intel_display in hdcp_gsc


