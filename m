Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C850C0218D
	for <intel-xe@archiver.kernel.org>; Wed, 29 Jan 2025 21:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1947210E1A1;
	Wed, 29 Jan 2025 21:11:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C1BB10E1A1;
 Wed, 29 Jan 2025 21:11:39 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_PF=3A_Mitigate_unexpected?=
 =?utf-8?q?_GuC_VF_config_checks?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Jan 2025 21:11:39 -0000
Message-ID: <173818509956.2599720.5133346202418448087@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250129195947.764-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250129195947.764-1-michal.wajdeczko@intel.com>
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

Series: PF: Mitigate unexpected GuC VF config checks
URL   : https://patchwork.freedesktop.org/series/144120/
State : warning

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
commit 48df448f65dc05c9fff244f05682a4a8be5f2f0b
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Wed Jan 29 20:59:47 2025 +0100

    drm/xe/pf: Reset GuC VF config when unprovisioning critical resource
    
    GuC firmware counts received VF configuration KLVs and may start
    validation of the complete VF config even if some resources where
    unprovisioned in the meantime, leading to unexpected errors like:
    
     $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
     $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota
     $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
     $ echo 0 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/doorbells_quota
     $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota
     tee: '/sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/ggtt_quota': Input/output error
    
    To mitigate this problem trigger explicit VF config reset after
    unprovisioning any of the critical resources (GGTT, context or
    doorbell IDs) that GuC is monitoring.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch c2a5da40b8b1c5af77dcdabed8516069949fea3b drm-intel
921df509a0ce drm/xe/pf: Don't send BEGIN_ID if VF has no context/doorbells
-:19: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#19: 
 [] xe 0000:00:02.0: [drm] GT0: { key 0x0001 : 64b value 0x176a000 } # ggtt_start

total: 0 errors, 1 warnings, 0 checks, 16 lines checked
48df448f65dc drm/xe/pf: Reset GuC VF config when unprovisioning critical resource
-:11: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#11: 
 $ echo 1 | sudo tee /sys/kernel/debug/dri/0000:00:02.0/gt0/vf1/contexts_quota

total: 0 errors, 1 warnings, 0 checks, 67 lines checked


