Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD4FC4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 08:30:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9770410E548;
	Wed,  8 Nov 2023 08:30:06 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DB0810E4E3;
 Wed,  8 Nov 2023 08:30:05 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 2A0CFA3ECB;
 Wed,  8 Nov 2023 08:30:05 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Wed, 08 Nov 2023 08:30:05 -0000
Message-ID: <169943220516.24275.883814927967460799@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231108081156.981587-1-dliberman@habana.ai>
In-Reply-To: <20231108081156.981587-1-dliberman@habana.ai>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_use_variable_instead_of_multiple_function_calls_=28rev4?=
 =?utf-8?q?=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: use variable instead of multiple function calls (rev4)
URL   : https://patchwork.freedesktop.org/series/125775/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 6693af7f7332e06748da8b2f7257fd8d28a7f700
Author: Dani Liberman <dliberman@habana.ai>
Date:   Wed Nov 8 10:11:56 2023 +0200

    drm/xe: use variable instead of multiple function calls
    
    Using function calls with negative logic was a bit confusing,
    positive logic is more readable.
    
    v2:
     - Update commit message
    v3:
     - Rebase
    
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
    Signed-off-by: Dani Liberman <dliberman@habana.ai>
    Reviewed-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
+ /mt/dim checkpatch 2319a9c72748dfb1a65cfbd89d0dab6254c7cbe2 drm-intel
6693af7f7 drm/xe: use variable instead of multiple function calls


