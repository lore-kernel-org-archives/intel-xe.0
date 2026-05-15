Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A7CD4851
	for <intel-xe@archiver.kernel.org>; Fri, 15 May 2026 07:56:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02E9A10E425;
	Fri, 15 May 2026 07:56:09 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCB510E03B;
 Fri, 15 May 2026 07:56:08 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/psr=3A_Refactor_?=
 =?utf-8?q?and_extend_SCL_handling_for_VRRTG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 15 May 2026 07:56:08 -0000
Message-ID: <177883176856.74432.2338670931335183510@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260515073616.2794146-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20260515073616.2794146-1-ankit.k.nautiyal@intel.com>
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

Series: drm/i915/psr: Refactor and extend SCL handling for VRRTG
URL   : https://patchwork.freedesktop.org/series/166628/
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
commit 6ba16d6d9a20013d2eb34b3f821c10a3ac7321ff
Author: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Date:   Fri May 15 13:06:16 2026 +0530

    drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG
    
    For Legacy timing generator, if there are no panel replay/sel_update or other
    SRD constraints, the Set context latency (SCL) window should be at least 1.
    
    However, for VRR timing generator the SCL window can be 0. It has other
    guardband constraints, but that are checked during guardband computation.
    
    Allow SCL to be 0 for platforms that have VRR TG always on.
    
    Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
+ /mt/dim checkpatch b9819223b7e92173091b674c2212252b99ea6c4b drm-intel
15ec86ffb0ba drm/i915/psr: Simplify the conditions for SCL computation
6ba16d6d9a20 drm/i915/psr: Allow SCL=0 on platforms with always-on VRR TG
-:6: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#6: 
For Legacy timing generator, if there are no panel replay/sel_update or other

total: 0 errors, 1 warnings, 0 checks, 9 lines checked


