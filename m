Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4037AC02183
	for <intel-xe@archiver.kernel.org>; Sat, 18 Jan 2025 01:02:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064E410E0DC;
	Sat, 18 Jan 2025 01:02:54 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157A810E0DC;
 Sat, 18 Jan 2025 01:02:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Upgrade_complai?=
 =?utf-8?q?nt_about_missing_slice_info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 18 Jan 2025 01:02:53 -0000
Message-ID: <173716217308.938768.3035317981964671088@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250118005403.2960807-1-John.C.Harrison@Intel.com>
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

Series: drm/xe: Upgrade complaint about missing slice info
URL   : https://patchwork.freedesktop.org/series/143700/
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
commit 49ca6ad5c60b17086c2de513245a56e922857ed3
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Fri Jan 17 16:54:03 2025 -0800

    drm/xe: Upgrade complaint about missing slice info
    
    The steering code needs to know slice/subslice counts and this
    information should be retrieved from the hwconfig table. However,
    earlier platforms don't have it, hence the KMD has a fallback path.
    Newer platforms really should have the entries and if they are missing
    that is a bug that needs to be fixed in the table.
    
    So update the complaint to be an error on newer platforms and remove
    it completely for older ones that we know are bad (but are not POR for
    the Xe driver anyway). Also, re-word the message a little to make it
    clearer what the issue is.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
+ /mt/dim checkpatch 4fc988de9f5e17d19edb5fc0a0fbc15a8fc837f4 drm-intel
49ca6ad5c60b drm/xe: Upgrade complaint about missing slice info


