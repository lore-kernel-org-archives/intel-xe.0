Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48272E77197
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 20:58:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1858910E095;
	Tue,  7 Jan 2025 20:58:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3E210E095;
 Tue,  7 Jan 2025 20:58:00 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_series_starting_with_=5Bv?=
 =?utf-8?q?3=2C1/1=5D_drm/xe/guc=3A_Fix_GuC_log/ct_output_via_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 20:58:00 -0000
Message-ID: <173628348046.1046322.1887083888934222466@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250107202252.2642853-1-julia.filipchuk@intel.com>
In-Reply-To: <20250107202252.2642853-1-julia.filipchuk@intel.com>
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

Series: series starting with [v3,1/1] drm/xe/guc: Fix GuC log/ct output via debugfs
URL   : https://patchwork.freedesktop.org/series/143203/
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
commit fcb2a296a2af5aa8166d2f6003653de81ec500b7
Author: Julia Filipchuk <julia.filipchuk@intel.com>
Date:   Tue Jan 7 12:22:52 2025 -0800

    drm/xe/guc: Fix GuC log/ct output via debugfs
    
    Change to disable asci85 GuC logging only when output to devcoredump
    (was temporarily disabled for all code paths).
    
    v2: Ignore only for devcoredump case (not dmesg output).
    v3: Rebase to resolve parent tag mismatch.
    
    Signed-off-by: Julia Filipchuk <julia.filipchuk@intel.com>
+ /mt/dim checkpatch dbd476153d41352ad6022088be16301051b9bce7 drm-intel
fcb2a296a2af drm/xe/guc: Fix GuC log/ct output via debugfs


