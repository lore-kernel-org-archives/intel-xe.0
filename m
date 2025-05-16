Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F347C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 14:46:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D943510EAEF;
	Fri, 16 May 2025 14:45:59 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62C4C10EAEF;
 Fri, 16 May 2025 14:45:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/guc=3A_Make_creati?=
 =?utf-8?q?on_of_SLPC_debugfs_files_conditional_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 14:45:59 -0000
Message-ID: <174740675939.88743.8139987819450255680@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516141902.5614-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250516141902.5614-1-aradhya.bhatia@intel.com>
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

Series: drm/xe/guc: Make creation of SLPC debugfs files conditional (rev2)
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
commit d53d89f37c733e759c24367cb687fde1d1d6a5d2
Author: Aradhya Bhatia <aradhya.bhatia@intel.com>
Date:   Fri May 16 14:19:02 2025 +0000

    drm/xe/guc: Make creation of SLPC debugfs files conditional
    
    Platforms that do not support SLPC are exempted from the GuC PC support.
    The GuC PC does not get initialized, and neither do its BOs get created.
    
    This causes a problem because the GuC PC debugfs file is still being
    created. Whenever the file is attempted to read, it causes a NULL
    pointer dereference on the supposed BO of the GuC PC.
    
    So, make the creation of SLPC debugfs files conditional to when SLPC
    features are supported.
    
    Fixes: aaab5404b16f ("drm/xe: Introduce GuC PC debugfs")
    Suggested-by: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
    Reviewed-by: Stuart Summers <stuart.summers@intel.com>
    Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
+ /mt/dim checkpatch d92ef94d0cf251e79cb570b101645c457ebf764c drm-intel
d53d89f37c73 drm/xe/guc: Make creation of SLPC debugfs files conditional


