Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670C1EE14BC
	for <intel-xe@archiver.kernel.org>; Wed,  6 Sep 2023 17:29:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1FA10E06D;
	Wed,  6 Sep 2023 17:29:38 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6D67510E06D;
 Wed,  6 Sep 2023 17:29:35 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6A0F1AADE3;
 Wed,  6 Sep 2023 17:29:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Wed, 06 Sep 2023 17:29:35 -0000
Message-ID: <169402137543.17387.2831211564122382981@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905141347.1027082-1-jani.nikula@intel.com>
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_drop_unnecessary_i915_display_commits_=28rev2=29?=
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

Series: drm/xe: drop unnecessary i915 display commits (rev2)
URL   : https://patchwork.freedesktop.org/series/123280/
State : warning

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
commit a3859f2dc994e9a7a9703b7122da56e1e763fc53
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 5 17:13:47 2023 +0300

    Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"
    
    This reverts commit a75cb4b04d90a806cdadc6708ed055948467d91c.
+ /mt/dim checkpatch 62fe9fa9afd1a2065c9e762e9da1216ac04b042f drm-intel
ce4b098be Revert "FIXME: drm/i915: display/intel_display_types.h random whitespace changes"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd323a84d0d791f2f3006f507efeb0f2cffdbf1c2', maybe rebased or not pulled?
#7: 
This reverts commit d323a84d0d791f2f3006f507efeb0f2cffdbf1c2.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:22: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 9 lines checked
ca60f0949 Revert "FIXME: drm/i915: include i915_utils.h from intel_display_types.h"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a32f371fb76efd55ce1642d8f8aecd8db10f9c5e', maybe rebased or not pulled?
#7: 
This reverts commit a32f371fb76efd55ce1642d8f8aecd8db10f9c5e.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 7 lines checked
94d08a563 Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ada332ee9c5d65590377719f3d5f6a8b10afdd53', maybe rebased or not pulled?
#7: 
This reverts commit ada332ee9c5d65590377719f3d5f6a8b10afdd53.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 11 lines checked
6085732eb Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain uncore"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8eed1768a20e799feb89da99ee3a21e9581605a3', maybe rebased or not pulled?
#7: 
This reverts commit 8eed1768a20e799feb89da99ee3a21e9581605a3.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:62: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 45 lines checked
a3859f2dc Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a75cb4b04d90a806cdadc6708ed055948467d91c', maybe rebased or not pulled?
#7: 
This reverts commit a75cb4b04d90a806cdadc6708ed055948467d91c.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 11 lines checked


