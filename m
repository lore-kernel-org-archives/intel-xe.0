Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A5AEEA84E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 20:47:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC53D10E2AA;
	Thu, 12 Feb 2026 20:47:38 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAD3610E2AA;
 Thu, 12 Feb 2026 20:47:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_Low_hanging_pagefault_ref?=
 =?utf-8?q?actors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Feb 2026 20:47:37 -0000
Message-ID: <177092925780.250939.5780545762304859911@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260212204227.2764054-1-matthew.brost@intel.com>
In-Reply-To: <20260212204227.2764054-1-matthew.brost@intel.com>
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

Series: Low hanging pagefault refactors
URL   : https://patchwork.freedesktop.org/series/161560/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
1f57ba1afceae32108bd24770069f764d940a0e4
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 040db6942156f4fc9ee2e0e410758ce224904380
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Thu Feb 12 12:42:27 2026 -0800

    drm/xe: Avoid touching consumer fields in GuC pagefault ack
    
    The GuC pagefault acknowledgement code is designed to extract the fields
    needed for the acknowledgement from the producer-stored message so that
    the consumer fields can be overloaded to return additional information.
    The ASID is stored in the producer message; extract it from there to
    future‑proof this logic.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch 8a3c5ed4673e2028f1fbfc55bdf121e0647f1ca2 drm-intel
7637a7181d99 drm/xe: Pack fault type and level into a u8
040db6942156 drm/xe: Avoid touching consumer fields in GuC pagefault ack
-:9: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#9: 
The GuC pagefault acknowledgement code is designed to extract the fields
                  ^^^^^^^^^^^^^^^

-:10: WARNING:TYPO_SPELLING: 'acknowledgement' may be misspelled - perhaps 'acknowledgment'?
#10: 
needed for the acknowledgement from the producer-stored message so that
               ^^^^^^^^^^^^^^^

total: 0 errors, 2 warnings, 0 checks, 15 lines checked


