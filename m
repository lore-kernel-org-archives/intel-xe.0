Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4D43C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 09:09:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A05F10E1DC;
	Mon,  8 Jan 2024 09:09:42 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A358710E1D1;
 Mon,  8 Jan 2024 09:09:41 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_clean_up_type_o?=
 =?utf-8?q?f_GUC=5FHXG=5FMSG=5F0=5FORIGIN?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Date: Mon, 08 Jan 2024 09:09:41 -0000
Message-ID: <170470498166.195263.10894091575636715846@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
In-Reply-To: <ec22d742-632b-426a-ac86-62641a38c907@moroto.mountain>
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

Series: drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
URL   : https://patchwork.freedesktop.org/series/128312/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 40d94fd2d0ea055e71d99b0ce0b69d6f88f3e1e1
Author: Dan Carpenter <dan.carpenter@linaro.org>
Date:   Mon Jan 8 12:05:57 2024 +0300

    drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN
    
    The GUC_HXG_MSG_0_ORIGIN definition should be unsigned.  Currently it is
    defined as INT_MIN.  This doesn't cause a problem currently but it's
    still worth cleaning up.
    
    Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
+ /mt/dim checkpatch cca0607b6f6a21bee68c092ed7ad9f3322e54523 drm-intel
40d94fd2d drm/xe: clean up type of GUC_HXG_MSG_0_ORIGIN


