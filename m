Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 060B1C02182
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jan 2025 20:29:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BFC10E896;
	Thu, 23 Jan 2025 20:29:57 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18FF10E896;
 Thu, 23 Jan 2025 20:29:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Enable_GuC_log_dump_and_m?=
 =?utf-8?q?inor_fixes_in_devcoredump_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 20:29:56 -0000
Message-ID: <173766419672.3694609.15597599302399526804@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250123202307.95103-1-jose.souza@intel.com>
In-Reply-To: <20250123202307.95103-1-jose.souza@intel.com>
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

Series: Enable GuC log dump and minor fixes in devcoredump (rev2)
URL   : https://patchwork.freedesktop.org/series/143898/
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
commit ee46749c063eb3fe426924e2ab3c475d14ead995
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Thu Jan 23 12:22:04 2025 -0800

    drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump
    
    All other(hwsp, hwctx and vmas) binaries follow this format:
    [name].length: 0x1000
    [name].data: xxxxxxx
    [name].error: errno
    
    The error one is just in case by some reason it was not able to
    capture the binary.
    
    So this GuC binaries should follow the same patern.
    
    v2:
    - renamed GUC binary to LOG
    
    Cc: John Harrison <John.C.Harrison@Intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch b0181cc14ba055406c6014d1dce81765dfb69103 drm-intel
45c8a170ea86 drm/xe: Fix and re-enable xe_print_blob_ascii85()
ee46749c063e drm/xe: Make GUC binaries dump consistent with other binaries in devcoredump


