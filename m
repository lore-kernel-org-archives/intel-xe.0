Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD92C36005
	for <intel-xe@archiver.kernel.org>; Tue, 25 Mar 2025 21:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17E210E2A7;
	Tue, 25 Mar 2025 21:43:33 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7166210E2A7;
 Tue, 25 Mar 2025 21:43:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Re-word_mes?=
 =?utf-8?q?sage_about_ADS_size_changes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Mar 2025 21:43:32 -0000
Message-ID: <174293901246.2974.5535928395541360839@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250325203211.3907890-1-John.C.Harrison@Intel.com>
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

Series: drm/xe/guc: Re-word message about ADS size changes
URL   : https://patchwork.freedesktop.org/series/146763/
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
commit a9398cdb54281782e3e8a7f737bf26d6951210ab
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Tue Mar 25 13:32:11 2025 -0700

    drm/xe/guc: Re-word message about ADS size changes
    
    The error capture list in the ADS is initially allocated using a
    placeholder size. When the actual size is determinied later on, there
    is a debug print about the new size. However, the wording is such that
    some people see it as an unexpected thing and therefore a potential
    problem. So re-word it to be a little less concerning.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch afc2e1fea0a406eedbaf632e96cdb6832a45ebb7 drm-intel
a9398cdb5428 drm/xe/guc: Re-word message about ADS size changes


