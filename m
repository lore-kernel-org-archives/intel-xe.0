Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2618BE69E8E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 20:11:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E542110E837;
	Mon,  2 Dec 2024 20:11:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B75C10E837;
 Mon,  2 Dec 2024 20:11:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe/xe=5Fsync=3A_Add_d?=
 =?utf-8?q?ebug_printing_to_check=5Fufence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 20:11:01 -0000
Message-ID: <173317026143.1752143.940701357414427148@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202194631.106940-1-jonathan.cavitt@intel.com>
In-Reply-To: <20241202194631.106940-1-jonathan.cavitt@intel.com>
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

Series: drm/xe/xe_sync: Add debug printing to check_ufence
URL   : https://patchwork.freedesktop.org/series/142002/
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
commit 0880260cbf3582570bfd4ab821a2ef29436d8a4d
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Mon Dec 2 19:46:31 2024 +0000

    drm/xe/xe_sync: Add debug printing to check_ufence
    
    The xe_sync helper function check_ufence can occasionally report EBUSY
    if the ufence has not been signalled yet.  EBUSY is a non-fatal error
    value for the function, so it is not desireable to warn in cases where
    EBUSY is reported because it is up to the user to decide if EBUSY is a
    fatal error in their use cases.  However, we can and should report EBUSY
    to the debug logs for diagnostic purposes.
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
+ /mt/dim checkpatch 83cfa47b496201ff05d4a369f6fe3f75665a2acf drm-intel
0880260cbf35 drm/xe/xe_sync: Add debug printing to check_ufence


