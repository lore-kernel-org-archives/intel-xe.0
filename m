Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C50C71136
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 23:33:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 512C110E058;
	Thu, 12 Jun 2025 23:32:58 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4750210E058;
 Thu, 12 Jun 2025 23:32:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_Tweak_default_G?=
 =?utf-8?q?uC_log_level?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 23:32:57 -0000
Message-ID: <174977117728.74151.17270623604941261206@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
In-Reply-To: <20250612-guc-log-level-v1-0-51f124a3be6d@intel.com>
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

Series: drm/xe: Tweak default GuC log level
URL   : https://patchwork.freedesktop.org/series/150183/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 22ed2c32e10f8d7bf6d11b179a94e1f69893b385
Author: Lucas De Marchi <lucas.demarchi@intel.com>
Date:   Thu Jun 12 11:05:33 2025 -0700

    drm/xe: Annotate default for guc_log_level param
    
    Reword the parameter description so it's clear what's the default and
    what are the verbose levels.
    
    Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
    Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch 1eb0e9ebd86a603c0d83e641c5e543606d175bc6 drm-intel
61cecb3bfb10 drm/xe/guc: Default log level to non-verbose
-:14: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#14: 
                          Test \ Log Level                        3      0      1      2

total: 0 errors, 1 warnings, 0 checks, 8 lines checked
22ed2c32e10f drm/xe: Annotate default for guc_log_level param


