Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D01DC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 07:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0053610E4FF;
	Tue,  4 Mar 2025 07:00:56 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75F2210E4FF;
 Tue,  4 Mar 2025 07:00:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/pcode=3A_stop_logg?=
 =?utf-8?q?ing_mailbox_status_as_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 07:00:54 -0000
Message-ID: <174107165447.476700.649295135025011675@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304061727.452100-1-raag.jadav@intel.com>
In-Reply-To: <20250304061727.452100-1-raag.jadav@intel.com>
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

Series: drm/xe/pcode: stop logging mailbox status as error
URL   : https://patchwork.freedesktop.org/series/145746/
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
commit 2b68736fb6fb96729891782dbdc467901398e6fd
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Tue Mar 4 11:47:27 2025 +0530

    drm/xe/pcode: stop logging mailbox status as error
    
    Since we're expecting many platform specific mailbox commands that
    might not be widely supported, stop logging them as errors. With this
    we can avoid unnecessary platform checks and use the return value of
    mailbox without enraging CI.
    
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 1cf56e26a93292ca26fbf891368b75a67e8700dc drm-intel
2b68736fb6fb drm/xe/pcode: stop logging mailbox status as error


