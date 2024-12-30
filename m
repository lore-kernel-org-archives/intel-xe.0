Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C215AE7718F
	for <intel-xe@archiver.kernel.org>; Mon, 30 Dec 2024 20:23:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E2D410E39D;
	Mon, 30 Dec 2024 20:23:35 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D8010E054;
 Mon, 30 Dec 2024 20:23:34 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Re=3A_6=2E12=2E7_stable_n?=
 =?utf-8?q?ew_error=3A_event_xe=5Fbo=5Fmove_has_unsafe_dereference_of_argume?=
 =?utf-8?q?nt_4?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Dec 2024 20:23:34 -0000
Message-ID: <173559021461.1065899.12791715532396965379@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
In-Reply-To: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
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

Series: Re: 6.12.7 stable new error: event xe_bo_move has unsafe dereference of argument 4
URL   : https://patchwork.freedesktop.org/series/143018/
State : warning

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
commit ef42d7fb47e8c7c12f8d97f1c57e2c72fc79e952
Author: Steven Rostedt <rostedt@goodmis.org>
Date:   Mon Dec 30 14:50:02 2024 -0500

    6.12.7 stable new error: event xe_bo_move has unsafe dereference of argument 4
    
    On Mon, 30 Dec 2024 14:13:29 -0500
    Steven Rostedt <rostedt@goodmis.org> wrote:
    
    > I guess the "fix" would be to have the check code ignore pointer to
    > arrays, assuming they are "ok".
    
    Can you try this patch?
    
    -- Steve
+ /mt/dim checkpatch 08bd590935a5258ffd79355c59adffd72fb2c642 drm-intel
ef42d7fb47e8 6.12.7 stable new error: event xe_bo_move has unsafe dereference of argument 4
-:39: ERROR:MISSING_SIGN_OFF: Missing Signed-off-by: line(s)

total: 1 errors, 0 warnings, 0 checks, 18 lines checked


