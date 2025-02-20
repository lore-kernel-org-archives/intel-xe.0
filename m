Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF9EC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 09:52:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDB310E8F7;
	Thu, 20 Feb 2025 09:52:48 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6320510E8F7;
 Thu, 20 Feb 2025 09:52:47 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_and_refacto?=
 =?utf-8?q?r_workarounds_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 09:52:47 -0000
Message-ID: <174004516740.153718.4709413787566618204@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250220094645.358647-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250220094645.358647-1-aradhya.bhatia@intel.com>
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

Series: drm/xe: Add and refactor workarounds (rev4)
URL   : https://patchwork.freedesktop.org/series/143594/
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
commit 93ed480f4cf1233502118553c6f1814165d4e5da
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Thu Feb 20 15:16:45 2025 +0530

    drm/xe/oa: Refactor WAs to use XE_WA() macro
    
    Refactor Wa_18013179988, Wa_14015568240, Wa_1508761755, and
    Wa_1509372804, to use the proper workaround-check implementation for
    out-of-band workarounds, XE_WA(), and drop the use of the platform
    based WA selection.
    
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 1d579c3706d3698c87fddca8cf001e46e22efe0c drm-intel
7c1bfe00fd3c drm/xe: Add Wa_16021333562 and Wa_14016712196
93ed480f4cf1 drm/xe/oa: Refactor WAs to use XE_WA() macro


