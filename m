Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F528C0218B
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 05:25:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A4E210E333;
	Thu, 23 Jan 2025 05:25:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E03410E333;
 Thu, 23 Jan 2025 05:25:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_devcoredump_and_guc_l?=
 =?utf-8?q?og_dump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 05:25:48 -0000
Message-ID: <173760994824.3399070.3304323615775654299@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123051112.1938193-1-lucas.demarchi@intel.com>
In-Reply-To: <20250123051112.1938193-1-lucas.demarchi@intel.com>
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

Series: Fix devcoredump and guc log dump
URL   : https://patchwork.freedesktop.org/series/143872/
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
commit b93ddc93f6c8f3c403f6b701ea71c16fa533aa47
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Wed Jan 22 21:11:12 2025 -0800

    drm/xe: Fix and re-enable xe_print_blob_ascii85()
    
    Commit 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa
    debug tool") partially reverted some changes to workaround breakage
    caused to mesa tools. However, in doing so it also broke fetching the
    GuC log via debugfs since xe_print_blob_ascii85() simply bails out.
    
    The fix is to avoid the extra newlines: the devcoredump interface is
    line-oriented and adding random newlines in the middle breaks it. If a
    tool is able to parse it by looking at the data and checking for chars
    that are out of the ascii85 space, it can still do so. A format change
    that breaks the line-oriented output on devcoredump however needs better
    coordination with existing tools.
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Julia Filipchuk <julia.filipchuk@intel.com>
    Cc: José Roberto de Souza <jose.souza@intel.com>
    Cc: stable@vger.kernel.org
    Fixes: 70fb86a85dc9 ("drm/xe: Revert some changes that break a mesa debug tool")
    Fixes: ec1455ce7e35 ("drm/xe/devcoredump: Add ASCII85 dump helper function")
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
+ /mt/dim checkpatch cb1c4020e51585b89363590a56869836e1466b75 drm-intel
e891a09a798f drm/xe/devcoredump: Move exec queue snapshot to Contexts section
b93ddc93f6c8 drm/xe: Fix and re-enable xe_print_blob_ascii85()


