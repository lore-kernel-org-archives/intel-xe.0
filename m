Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16AC1C71136
	for <intel-xe@archiver.kernel.org>; Wed, 11 Jun 2025 21:11:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB9D010E75F;
	Wed, 11 Jun 2025 21:11:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE02210E742;
 Wed, 11 Jun 2025 21:11:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Clean_up_of_GuC_init_data?=
 =?utf-8?q?_macros?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Jun 2025 21:11:21 -0000
Message-ID: <174967628177.69215.8256155014318729855@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
In-Reply-To: <20250611210553.3756700-1-John.C.Harrison@Intel.com>
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

Series: Clean up of GuC init data macros
URL   : https://patchwork.freedesktop.org/series/150120/
State : success

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
commit e7ff200985856f852d5dd95d193dc6b972c7f5b1
Author: John Harrison <John.C.Harrison@Intel.com>
Date:   Wed Jun 11 14:05:53 2025 -0700

    drm/xe/guc: Add support for NPK as a GuC log target
    
    The GuC has an option to write log data via NPK. This is basically a
    magic IO address that GuC writes arbitrary data to and which can be
    logged by a suitable hardware logger. This can allow retrieval of the
    GuC log in hardware debug environments even when the system as a whole
    dies horribly.
    
    Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
+ /mt/dim checkpatch ade8293fe6cd8e5016e6258f8b3bc1b7269fb785 drm-intel
6d4a214af958 drm/xe/guc: Clean up of GuC 'CTL' defines
e7ff20098585 drm/xe/guc: Add support for NPK as a GuC log target


