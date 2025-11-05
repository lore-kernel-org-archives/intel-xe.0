Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6CECCFA04
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 03:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479E410E079;
	Wed,  5 Nov 2025 03:59:42 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97BD710E079;
 Wed,  5 Nov 2025 03:59:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/gt=5Fthrottle=3A_A?=
 =?utf-8?q?void_TOCTOU_when_monitoring_reasons_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 03:59:40 -0000
Message-ID: <176231518061.18967.13548128174697860043@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
In-Reply-To: <20251104-gt-throttle-cri-v5-1-4948b060bbfd@intel.com>
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

Series: drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons (rev2)
URL   : https://patchwork.freedesktop.org/series/156855/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
f867e605613af1770f90c4b0afd4a8f06424d1f0
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 48a5e802e5aa8933811c9c6f3172c94303d5dea3
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Tue Nov 4 14:20:51 2025 -0800

    drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
    
    It's currently not possible to safely monitor if there's throttling
    happening and what are the reasons. The approach of reading the status
    and then reading the reasons is not reliable as by the time sysadmin
    reads the reason, the throttling could not be happening anymore.
    
    Previous tentative to fix that[1] was breaking the ABI and potentially
    sysadmin's scripts. This takes a different approach of adding and
    documenting the additional attribute. It's still valuable, though
    redundant, to provide the simpler 0/1 interface.
    
    In order to avoid userspace knowledge on the bitmask meaning and to be
    able to maintain the kernel side in sync with possible changes in
    future, just walk the attribute group and check what are the masks that
    match the value read.
    
    [1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/
    
    Cc: Raag Jadav <raag.jadav@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch 957ab9ac657700dee50f42438ed79652dad939a0 drm-intel
48a5e802e5aa drm/xe/gt_throttle: Avoid TOCTOU when monitoring reasons
-:21: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#21: 
[1] https://lore.kernel.org/intel-xe/20241025092238.167042-1-raag.jadav@intel.com/

total: 0 errors, 1 warnings, 0 checks, 96 lines checked


