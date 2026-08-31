Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E1A2C61DF0
	for <intel-xe@archiver.kernel.org>; Mon, 31 Aug 2026 04:33:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A04A10E258;
	Mon, 31 Aug 2026 04:33:32 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E898210E258;
 Mon, 31 Aug 2026 04:33:30 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Introduce_xe=5Fwedge?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 31 Aug 2026 04:33:30 -0000
Message-ID: <178815081094.98696.8772257064504525845@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260831042633.1760474-1-raag.jadav@intel.com>
In-Reply-To: <20260831042633.1760474-1-raag.jadav@intel.com>
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

Series: Introduce xe_wedge
URL   : https://patchwork.freedesktop.org/series/173011/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
061140b9bc586ae7f40abc1249c97e1cc72d1b9d
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 683591ab8823bc0e7a4c95dd97c6e374a7f68ba6
Author: Raag Jadav <raag.jadav@intel.com>
Date:   Mon Aug 31 09:55:53 2026 +0530

    drm/xe/wedge: Update naming to match with xe_wedge
    
    Now that we have a dedicated xe_wedge component, update all its function
    names accordingly.
    
    No functional impact.
    
    Suggested-by: Lukasz Laguna <lukasz.laguna@intel.com>
    Signed-off-by: Raag Jadav <raag.jadav@intel.com>
+ /mt/dim checkpatch 046bcac5ed22b09812cec3b0aef678195f1eae71 drm-intel
1a57c3072ca4 drm/xe/gt: Use GT ordered workqueue for wedging
d4157fd48b5a drm/xe: Make xe_device_declare_wedged() IRQ safe
68ec5450048c drm/xe: Introduce xe_wedge
-:286: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#286: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 487 lines checked
53dfde2eedec drm/xe/debugfs: Consolidate wedged_mode debt into xe_wedge
-:312: WARNING:FILE_PATH_CHANGES: added, moved or deleted file(s), does MAINTAINERS need updating?
#312: 
new file mode 100644

total: 0 errors, 1 warnings, 0 checks, 314 lines checked
683591ab8823 drm/xe/wedge: Update naming to match with xe_wedge


