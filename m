Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4430C4828F
	for <intel-xe@archiver.kernel.org>; Fri,  2 Feb 2024 22:39:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6423B10EC49;
	Fri,  2 Feb 2024 22:39:10 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3195310EC49;
 Fri,  2 Feb 2024 22:39:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/xe=5Fgt=5Fidle=3A_?=
 =?utf-8?q?Drop_redundant_newline_in_name?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Feb 2024 22:39:09 -0000
Message-ID: <170691354920.953329.5066217144459329826@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202223525.3221158-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240202223525.3221158-1-ashutosh.dixit@intel.com>
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

Series: drm/xe/xe_gt_idle: Drop redundant newline in name
URL   : https://patchwork.freedesktop.org/series/129495/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit f7d0f44be36321a817aab239034b9bec3b1ce0fb
Author: Ashutosh Dixit <ashutosh.dixit@intel.com>
Date:   Fri Feb 2 14:35:25 2024 -0800

    drm/xe/xe_gt_idle: Drop redundant newline in name
    
    Newline in name is redunant and produces an unnecessary empty line during
    'cat name'.
    
    Fixes: 27a1a1e2e47d ("drm/xe: stringify the argument to avoid potential vulnerability")
    Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
+ /mt/dim checkpatch 40994da55437acf620a48af39b0d8545e1595c42 drm-intel
f7d0f44be drm/xe/xe_gt_idle: Drop redundant newline in name
-:9: WARNING:UNKNOWN_COMMIT_ID: Unknown commit id '27a1a1e2e47d', maybe rebased or not pulled?
#9: 
Fixes: 27a1a1e2e47d ("drm/xe: stringify the argument to avoid potential vulnerability")

-:21: WARNING:SYSFS_EMIT: return sysfs_emit(...) formats should include a terminating newline
#21: FILE: drivers/gpu/drm/xe/xe_gt_idle.c:90:
+	return sysfs_emit(buff, "%s", gtidle->name);

total: 0 errors, 2 warnings, 0 checks, 8 lines checked


