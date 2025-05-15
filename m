Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C7A5C3ABC9
	for <intel-xe@archiver.kernel.org>; Thu, 15 May 2025 09:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2E5B10E236;
	Thu, 15 May 2025 09:55:47 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD89F10E236;
 Thu, 15 May 2025 09:55:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Make_creati?=
 =?utf-8?q?on_of_SLPC_debugfs_files_conditional?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 May 2025 09:55:45 -0000
Message-ID: <174730294587.84157.2194915973638624014@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250515094913.2437-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/guc: Make creation of SLPC debugfs files conditional
URL   : https://patchwork.freedesktop.org/series/149064/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 1cf74d4d831a00e8bff233c1aa8eab4d7297bb2a
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Thu May 15 09:49:12 2025 +0000

    drm/xe/guc: Make creation of SLPC debugfs files conditional
    
    Platforms that do not support SLPC are exempted from the GuC PC support.
    The GuC PC does not get initialized, and neither do its BOs get created.
    
    This causes a problem because the GuC PC debugfs file is still being
    created. Whenever the file is attempted to read, it causes a NULL
    pointer dereference on the supposed BO of the GuC PC.
    
    So, make the creation of SLPC debugfs files conditional to when SLPC
    features are supported.
    
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch 3d6670fab64cb00b5e6ed80d2517147db533faf1 drm-intel
1cf74d4d831a drm/xe/guc: Make creation of SLPC debugfs files conditional


