Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791DAE7717F
	for <intel-xe@archiver.kernel.org>; Sat, 14 Dec 2024 00:16:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 441D910E111;
	Sat, 14 Dec 2024 00:16:29 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D551210E266;
 Sat, 14 Dec 2024 00:16:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/i915/display=3A_Do_no?=
 =?utf-8?q?t_report_timeout_on_suspend?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Dec 2024 00:16:27 -0000
Message-ID: <173413538786.2318731.3637155743082441633@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241213231234.81647-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241213231234.81647-1-jonathan.cavitt@intel.com>
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

Series: drm/i915/display: Do not report timeout on suspend
URL   : https://patchwork.freedesktop.org/series/142588/
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
commit f8a2ffd5ac30239285703b636a6eef59c0ded7cd
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Dec 13 23:12:34 2024 +0000

    drm/i915/display: Do not report timeout on suspend
    
    In intel_dp_aux_wait_done, we call intel_de_wait_custom.  This call has
    a 10ms timeout before reporting ETIMEDOUT.  However, if the display pm
    runtime is suspended, then it would be expected for this call to time
    out.  This may be the case, for example, during an engine reset.
    
    Do not report ETIMEDOUT here when the pm runtime is suspended.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch ed42e55b9d8bcc9c4a8c179071e6166a5e423913 drm-intel
f8a2ffd5ac30 drm/i915/display: Do not report timeout on suspend


