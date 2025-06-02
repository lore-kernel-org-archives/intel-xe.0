Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA51C5B549
	for <intel-xe@archiver.kernel.org>; Mon,  2 Jun 2025 23:53:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81BC410E0C6;
	Mon,  2 Jun 2025 23:53:26 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29AFE10E0C6;
 Mon,  2 Jun 2025 23:53:25 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/bmg=3A_Update_some?=
 =?utf-8?q?_WAs_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Jun 2025 23:53:25 -0000
Message-ID: <174890840515.42140.15695858769830007231@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250602234415.2015921-1-vinay.belgaumkar@intel.com>
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

Series: drm/xe/bmg: Update some WAs (rev3)
URL   : https://patchwork.freedesktop.org/series/149684/
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
commit 8d20aa90f7e62e2fe90f378fd3f5612464a0901d
Author: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Date:   Mon Jun 2 16:44:15 2025 -0700

    drm/xe/bmg: Update Wa_16023588340
    
    This allows for additional L2 caching modes.
    
    Fixes: 01570b446939 ("drm/xe/bmg: implement Wa_16023588340")
    Cc: Matthew Auld <matthew.auld@intel.com>
    Reviewed-by: Matthew Auld <matthew.auld@intel.com>
    Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
+ /mt/dim checkpatch 354657e88d7ab7195b5f0525bc14273fb020f2f2 drm-intel
b8e6ddfeb9a9 drm/xe/bmg: Update Wa_14022085890
eb705e72f5a0 drm/xe/guc: Ignore GuC CT errors when wedged
0107ca388c7f drm/xe/bmg: Update Wa_22019338487
8d20aa90f7e6 drm/xe/bmg: Update Wa_16023588340


