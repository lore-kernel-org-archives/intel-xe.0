Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626BAC19F4F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 19:43:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E92F7112E9A;
	Tue, 30 Apr 2024 19:43:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 893FB112E95;
 Tue, 30 Apr 2024 19:43:49 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe/mocs=3A_Add_debugf?=
 =?utf-8?q?s_node_to_dump_mocs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 19:43:49 -0000
Message-ID: <171450622951.1793102.12104336766341107197@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240430170427.1808136-1-janga.rahul.kumar@intel.com>
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

Series: drm/xe/mocs: Add debugfs node to dump mocs (rev4)
URL   : https://patchwork.freedesktop.org/series/131425/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
0daf0be5bb95eb0a0e42275e00a0e42d8d8fd543
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 61d7d4306fdafc9b2ef685fab22c7293713d6e49
Author: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
Date:   Tue Apr 30 22:34:27 2024 +0530

    drm/xe/mocs: Add debugfs node to dump mocs
    
    This is useful to check mocs configuration. Tests/Tools can use
    this debugfs entry to get mocs info.
    
    v2: Address review comments. Change debugfs output style similar
    to pat debugfs. (Lucas De Marchi)
    
    v3: rebase.
    
    v4: Address review comments. Use function pointer inside ops
    struct. Update Test-with links. Remove usage of flags wherever
    not required. (Lucas De Marchi)
    
    Test-with: https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-janga.rahul.kumar@intel.com
               https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-3-janga.rahul.kumar@intel.com/
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
+ /mt/dim checkpatch 3ac3efef3a1fc9d494b0a63c78bd0039a0b3d009 drm-intel
0b1e4349fe13 drm/xe: Relocate regs_are_mcr function
61d7d4306fda drm/xe/mocs: Add debugfs node to dump mocs
-:18: WARNING:COMMIT_LOG_LONG_LINE: Prefer a maximum 75 chars per line (possible unwrapped commit description?)
#18: 
Test-with: https://patchwork.freedesktop.org/patch/msgid/20240424200856.1194881-2-janga.rahul.kumar@intel.com

total: 0 errors, 1 warnings, 0 checks, 417 lines checked


