Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA4CC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 22:07:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C90310E205;
	Wed, 22 Jan 2025 22:07:30 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA41510E205;
 Wed, 22 Jan 2025 22:07:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_SRIOV_RPM_resume_lock?=
 =?utf-8?q?dep_issues?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 22:07:29 -0000
Message-ID: <173758364975.3226643.15999864986679007577@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250122214955.632-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250122214955.632-1-michal.wajdeczko@intel.com>
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

Series: Fix SRIOV RPM resume lockdep issues
URL   : https://patchwork.freedesktop.org/series/143865/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
30ab6715fc09baee6cc14cb3c89ad8858688d474
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 12ba38b4ba80a8bd15f001ba534c7bde6baadc49
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jan 22 22:49:55 2025 +0100

    drm/xe: Don't treat SR-IOV platforms as reclaim unsafe
    
    We believe that we stopped allocating memory during resume or
    restart steps thus we can say that SRIOV is now reclaim safe.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch d577d9e67e5ac149fcd4442327210b831cddb308 drm-intel
61eae207cdd0 drm/xe/pf: Use GuC Buffer Cache during policy provisioning
7ce2aa3e6995 drm/xe/pf: Add reclaim annotation to the PF master mutex
12ba38b4ba80 drm/xe: Don't treat SR-IOV platforms as reclaim unsafe


