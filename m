Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70681C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 22:07:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356BE10E8C5;
	Thu, 26 Oct 2023 22:07:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id D063910E8C5;
 Thu, 26 Oct 2023 22:07:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CED11AADD5;
 Thu, 26 Oct 2023 22:07:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Carlos Santa" <carlos.santa@intel.com>
Date: Thu, 26 Oct 2023 22:07:28 -0000
Message-ID: <169835804884.20469.13300525782349542305@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231026220127.3406918-1-carlos.santa@intel.com>
In-Reply-To: <20231026220127.3406918-1-carlos.santa@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_stringify_the_argument_to_avoid_potential_vulnerability?=
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

Series: drm/xe: stringify the argument to avoid potential vulnerability
URL   : https://patchwork.freedesktop.org/series/125660/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit a18855f9ea17bfb54a6f7c04f318af703b484445
Author: Carlos Santa <carlos.santa@intel.com>
Date:   Thu Oct 26 15:01:27 2023 -0700

    drm/xe: stringify the argument to avoid potential vulnerability
    
    This error gets printed inside a sandbox with warnings turned on.
    
    /mnt/host/source/src/third_party/kernel/v5.15/drivers/
    gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: error: format string is
    not a string literal (potentially insecure) [-Werror,-Wformat-security]
            return sysfs_emit(buff, gtidle->name);
                                    ^~~~~~~~~~~~
    /mnt/host/source/src/third_party/kernel/v5.15/drivers/
    gpu/drm/xe/xe_gt_idle_sysfs.c:87:26: note: treat the string
    as an argument to avoid this
            return sysfs_emit(buff, gtidle->name);
                                    ^
                                    "%s",
    1 error generated.
    
    CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Carlos Santa <carlos.santa@intel.com>
+ /mt/dim checkpatch 21919db9eeaabfaf401c2470a6a95450ac92fafd drm-intel
a18855f9e drm/xe: stringify the argument to avoid potential vulnerability


