Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDDEC5B543
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 19:24:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE7E10E7CB;
	Wed,  4 Jun 2025 19:24:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8067E10E7CB;
 Wed,  4 Jun 2025 19:24:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Make_debugf?=
 =?utf-8?q?s_guc=5Flog=5Fdmesg_attribute_write-only_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 19:24:51 -0000
Message-ID: <174906509152.49379.3890339450585404699@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603175302.593-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250603175302.593-1-michal.wajdeczko@intel.com>
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

Series: drm/xe/guc: Make debugfs guc_log_dmesg attribute write-only (rev2)
URL   : https://patchwork.freedesktop.org/series/149791/
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
commit d215b0560ae41e568bf80ab87419f0bd932aa5a7
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Tue Jun 3 19:53:02 2025 +0200

    drm/xe/guc: Make debugfs guc_log_dmesg attribute write-only
    
    Ocassionally we want to dump a GuC log into the dmesg, but current
    implementation is based on the drm debugfs API and was triggering
    dump on the read operation.  Expose guc_log_dmesg attribute as
    write-only using pure debugfs API to make dump requests explicit.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 573b98ac3ff9ff95c3316789e97980277e4ffe2b drm-intel
d215b0560ae4 drm/xe/guc: Make debugfs guc_log_dmesg attribute write-only


