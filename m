Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16F8C369D5
	for <intel-xe@archiver.kernel.org>; Thu, 24 Apr 2025 18:35:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E56610E052;
	Thu, 24 Apr 2025 18:35:13 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A7210E052;
 Thu, 24 Apr 2025 18:35:12 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Improve_wedged_?=
 =?utf-8?q?mode_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Apr 2025 18:35:12 -0000
Message-ID: <174551971268.7653.6796230385951710573@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250424143043.937-1-lukasz.laguna@intel.com>
In-Reply-To: <20250424143043.937-1-lukasz.laguna@intel.com>
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

Series: drm/xe: Improve wedged mode handling
URL   : https://patchwork.freedesktop.org/series/148214/
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
commit db56e97bd4fc274df8de4209331de1009b3f1d40
Author: Lukasz Laguna <lukasz.laguna@intel.com>
Date:   Thu Apr 24 16:30:43 2025 +0200

    drm/xe/pf: Allow wedged_mode=2 only in debug config
    
    The GuC reset policy is global, so changing it on PF can impact running
    VFs. To avoid unintended side effects, setting wedged_mode=2 on the PF
    is restricted to debug builds only.
    
    Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
+ /mt/dim checkpatch 6176f71822602f52bc4327965090275c5570ed0d drm-intel
075156c2b70e drm/xe: Don't update wedged mode in case of an error
b1308ffab65b drm/xe: Validate wedged_mode modparam input
1228fe0289d4 drm/xe/vf: Disallow setting wedged_mode=2
db56e97bd4fc drm/xe/pf: Allow wedged_mode=2 only in debug config


