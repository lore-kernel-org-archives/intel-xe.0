Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46497C9830E
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 08:07:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1BDE10E5A6;
	Fri, 25 Sep 2026 08:07:17 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213B210E5A6;
 Fri, 25 Sep 2026 08:07:16 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Do_not_emit_Wa?=
 =?utf-8?q?=5F16010904313_twice_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Sep 2026 08:07:16 -0000
Message-ID: <179032363613.206383.4324018545834641353@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260925080016.64802-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20260925080016.64802-1-tvrtko.ursulin@igalia.com>
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

Series: drm/xe: Do not emit Wa_16010904313 twice (rev2)
URL   : https://patchwork.freedesktop.org/series/174937/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6bef5ce5c74dc76b4ee69ab2832c0d1fd63c91c7
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 2f5dea4a7f31bcf3e071a965ce1873b308d2561b
Author: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date:   Fri Sep 25 09:00:16 2026 +0100

    drm/xe: Do not emit Wa_16010904313 twice
    
    During development of
    e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
    one of the interim patch versions contained an incorrect rebase on top of
    some upstream changes, which caused Wa_16010904313 to be emitted both from
    the indirect context and from the workaround batch buffer.
    
    As this workaround needs to be emitted from the indirect context for rcs
    and ccs, but from the workaround batch buffer for bcs, vcs and vecs, we
    need to pass the location as an input parameter to setup_timestamp_wa() so
    it can decide whether to emit itself or not.
    
    Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
    Fixes: e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 999838292166407bbe911a41dee23112c49e9d44 drm-intel
2f5dea4a7f31 drm/xe: Do not emit Wa_16010904313 twice
-:7: ERROR:GIT_COMMIT_ID: Please use git commit description style 'commit <12+ chars of sha1> ("<title line>")' - ie: 'commit e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")'
#7: 
e8372edec948 ("drm/xe/xelp: Implement Wa_16010904313")

total: 1 errors, 0 warnings, 0 checks, 106 lines checked


