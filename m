Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77F1AC3DA4A
	for <intel-xe@archiver.kernel.org>; Thu,  8 Aug 2024 11:11:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45A2210E6D8;
	Thu,  8 Aug 2024 11:11:41 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC9810E6D8;
 Thu,  8 Aug 2024 11:11:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Add_AS=5FSDP_to_fastset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Aug 2024 11:11:40 -0000
Message-ID: <172311550024.549353.17523378130290897246@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240808094849.1299028-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20240808094849.1299028-1-mitulkumar.ajitkumar.golani@intel.com>
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

Series: Add AS_SDP to fastset
URL   : https://patchwork.freedesktop.org/series/137034/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
be41dd201d01bbf73d9e4ab77e74ab47923582e5
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 9e2bb0cf424c5639d55e5f40c417aa5b8d7fbf2f
Author: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Date:   Thu Aug 8 15:18:49 2024 +0530

    Add AS_SDP to fastset
    
    Add full modeset being triggered during VRR enable/disable, specially
    when panel has Adaptive sync SDP suypport.
    
    Signed-off-by: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
+ /mt/dim checkpatch b6a72e1d0a6ee0aad5bb0da07b050228c815a5f9 drm-intel
9e2bb0cf424c Add AS_SDP to fastset
-:20: ERROR:SPACING: space required before the open parenthesis '('
#20: FILE: drivers/gpu/drm/i915/display/intel_display.c:5436:
+	if(!fastset)

total: 1 errors, 0 warnings, 0 checks, 9 lines checked


