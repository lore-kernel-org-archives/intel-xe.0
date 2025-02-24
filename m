Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03DDBC021A4
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 13:40:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1F8510E2F3;
	Mon, 24 Feb 2025 13:40:06 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C394510E2F3;
 Mon, 24 Feb 2025 13:40:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/hdcp=3A_switch_t?=
 =?utf-8?q?o_guard_and_scoped_guard_for_mutexes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 13:40:05 -0000
Message-ID: <174040440579.1611352.9770378591404080273@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224101428.204519-1-jani.nikula@intel.com>
In-Reply-To: <20250224101428.204519-1-jani.nikula@intel.com>
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

Series: drm/i915/hdcp: switch to guard and scoped guard for mutexes
URL   : https://patchwork.freedesktop.org/series/145301/
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
commit c8b81c39a8f9eb495770db04ce7f4b5267ca9b32
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Mon Feb 24 12:14:28 2025 +0200

    drm/i915/hdcp: switch to guard and scoped guard for mutexes
    
    scoped_guard() and guard() provide automatic unlocking for locks, with
    cleaner function return paths for both happy and rainy day
    scenarios. Switch HDCP over as a first experiment for i915 display.
    
    Leave intel_hdcp_disable() be for now, as two nested scoped guards are a
    bit much, but also can't use just guard() due to the work cancel.
    
    Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
    Signed-off-by: Jani Nikula <jani.nikula@intel.com>
+ /mt/dim checkpatch be5a404c3344b7d794766f045b8f94aa93c42069 drm-intel
c8b81c39a8f9 drm/i915/hdcp: switch to guard and scoped guard for mutexes


