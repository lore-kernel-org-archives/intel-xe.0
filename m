Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25358C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 20:36:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD3A10E5FB;
	Tue, 25 Mar 2025 20:36:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 793F410E5FB;
 Tue, 25 Mar 2025 20:36:42 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Reformat_de?=
 =?utf-8?q?ad_CT_reason_string_to_be_devcoredump_compatible?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 20:36:42 -0000
Message-ID: <174293500249.1925.8750121375201563054@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250325203111.3907426-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Reformat dead CT reason string to be devcoredump compatible
URL   : https://patchwork.freedesktop.org/series/146762/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
99e5a866b5e13f134e606a3e29d9508d97826fb3
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit be523a113112d25e639770c5ea4fe76e067d8006
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Mar 25 13:31:11 2025 -0700

    drm/xe/guc: Reformat dead CT reason string to be devcoredump compatible
    
    The dump on a dead CT tries to emulate the devcoredump formatting (it
    would use devcoredump code directly but that requires more re-work to
    happen - work in progress). So update the print of the dead CT reason
    code to match the format of the 'reason' string that was added to the
    actual devcoredump a little while ago.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch b70bbb26ec306486f2ece84a9876d7eefa21da26 drm-intel
be523a113112 drm/xe/guc: Reformat dead CT reason string to be devcoredump compatible


