Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F97EB64DC
	for <intel-xe@archiver.kernel.org>; Tue, 11 Jul 2023 16:20:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1943B10E3DC;
	Tue, 11 Jul 2023 16:20:41 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1811810E3DC;
 Tue, 11 Jul 2023 16:20:40 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04C7EA0078;
 Tue, 11 Jul 2023 16:20:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Date: Tue, 11 Jul 2023 16:20:40 -0000
Message-ID: <168909244001.18665.15721829414225321390@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230711161728.6-1-francois.dugast@intel.com>
In-Reply-To: <20230711161728.6-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Prevent_flooding_the_kernel_log_with_XE=5FIOCTL=5FERR_?=
 =?utf-8?b?KHJldjMp?=
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

Series: drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR (rev3)
URL   : https://patchwork.freedesktop.org/series/118372/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
c7d32770e3cd31d9fc134ce41f329b10aa33ee15
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a925f25f9ff4787b9ddfa78d485603dc37cc0f46
Author: Francois Dugast <francois.dugast@intel.com>
Date:   Tue Jul 11 16:17:28 2023 +0000

    drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR
    
    Lower log level of XE_IOCTL_ERR macro to debug in order to prevent
    flooding kernel log.
    
    v2: Rename XE_IOCTL_ERR to XE_IOCTL_DBG (Rodrigo Vivi)
    v3: Rebase
    v4: Fix style, remove unrelated change about __FILE__ and __LINE__
    
    Link: https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
    Signed-off-by: Francois Dugast <francois.dugast@intel.com>
+ /mt/dim checkpatch d39e49e2ad386bf59f585a05ab659563e0472314 drm-intel
a925f25f9 drm/xe: Prevent flooding the kernel log with XE_IOCTL_ERR


