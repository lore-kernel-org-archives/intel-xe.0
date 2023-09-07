Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A4BFEC8734
	for <intel-xe@archiver.kernel.org>; Thu,  7 Sep 2023 14:54:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004FB10E7FF;
	Thu,  7 Sep 2023 14:54:33 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DFDD10E7FF;
 Thu,  7 Sep 2023 14:54:31 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7115FAADE0;
 Thu,  7 Sep 2023 14:54:31 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Date: Thu, 07 Sep 2023 14:54:31 -0000
Message-ID: <169409847146.17902.5618851605378066726@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230905141347.1027082-1-jani.nikula@intel.com>
In-Reply-To: <20230905141347.1027082-1-jani.nikula@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_dr?=
 =?utf-8?q?m/xe=3A_drop_unnecessary_i915_display_commits_=28rev3=29?=
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

Series: drm/xe: drop unnecessary i915 display commits (rev3)
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
commit ad47472ad04d9d2bd39ac31dffa9b09a382dd1fd
Author: Jani Nikula <jani.nikula@intel.com>
Date:   Tue Sep 5 17:13:47 2023 +0300

    Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"
    
    This reverts commit a75cb4b04d90a806cdadc6708ed055948467d91c.
+ /mt/dim checkpatch bae46e59a7f667734376ddb0d2451967dfb264f1 drm-intel
a3cd6bd67 Revert "FIXME: drm/i915: display/intel_display_types.h random whitespace changes"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'd323a84d0d791f2f3006f507efeb0f2cffdbf1c2', maybe rebased or not pulled?
#7: 
This reverts commit d323a84d0d791f2f3006f507efeb0f2cffdbf1c2.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:22: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 9 lines checked
71777e406 Revert "FIXME: drm/i915: include i915_utils.h from intel_display_types.h"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a32f371fb76efd55ce1642d8f8aecd8db10f9c5e', maybe rebased or not pulled?
#7: 
This reverts commit a32f371fb76efd55ce1642d8f8aecd8db10f9c5e.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:20: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 7 lines checked
dba79839a Revert "FIXME: drm/i915: revert the earlier mmio_offset change"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'ada332ee9c5d65590377719f3d5f6a8b10afdd53', maybe rebased or not pulled?
#7: 
This reverts commit ada332ee9c5d65590377719f3d5f6a8b10afdd53.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 11 lines checked
3f34fc44c Revert "FIXME: drm/i915/display: Prefer i915->uncore over plain uncore"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '8eed1768a20e799feb89da99ee3a21e9581605a3', maybe rebased or not pulled?
#7: 
This reverts commit 8eed1768a20e799feb89da99ee3a21e9581605a3.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:62: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 45 lines checked
ad47472ad Revert "FIXME: drm/i915/display: Set DISPLAY_MMIO_BASE to 0 for xe"
-:7: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id 'a75cb4b04d90a806cdadc6708ed055948467d91c', maybe rebased or not pulled?
#7: 
This reverts commit a75cb4b04d90a806cdadc6708ed055948467d91c.

-:10: WARNING:COMMIT_MESSAGE: Missing commit description - Add an appropriate one

-:24: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 2 warnings, 0 checks, 11 lines checked


