Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DD8C28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 15:47:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 905B010EA54;
	Fri, 28 Mar 2025 15:47:55 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA0210EA53;
 Fri, 28 Mar 2025 15:47:54 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Don=27t_print_e?=
 =?utf-8?q?rror_about_hwconfig_when_using_execlists?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Stuart Summers" <stuart.summers@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 15:47:54 -0000
Message-ID: <174317687412.15890.1396177319897390265@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328154236.9216-1-stuart.summers@intel.com>
In-Reply-To: <20250328154236.9216-1-stuart.summers@intel.com>
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

Series: drm/xe: Don't print error about hwconfig when using execlists
URL   : https://patchwork.freedesktop.org/series/146961/
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
commit 4f0785d2ba46ed31fcc1de0d0817d44a59f6560c
Author: Stuart Summers <stuart.summers@intel.com>
Date:   Fri Mar 28 15:42:36 2025 +0000

    drm/xe: Don't print error about hwconfig when using execlists
    
    This error message is only applicable for platforms using
    GuC submission - to warn the user if the GuC they are using
    or the platform they are running doesn't have this information
    to provide to userspace about the platform. When forcing
    execlist submission, which is something only used for debug,
    the user is running at their own risk and should understand
    the limitations of running without GuC.
    
    v2 (John/Lucas): Don't print an info message with execlists
    
    Signed-off-by: Stuart Summers <stuart.summers@intel.com>
+ /mt/dim checkpatch 8a0f86f7106709c73acb1477af9ad5f267d7a340 drm-intel
4f0785d2ba46 drm/xe: Don't print error about hwconfig when using execlists


