Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35D83C3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 04:28:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB9F410E3DD;
	Tue, 23 Jul 2024 04:28:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B95B10E3DD;
 Tue, 23 Jul 2024 04:28:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Store_process_name_and_pi?=
 =?utf-8?q?d_in_xe_file?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 04:28:48 -0000
Message-ID: <172170892830.358751.18300972671651070993@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723042428.1701998-1-matthew.brost@intel.com>
In-Reply-To: <20240723042428.1701998-1-matthew.brost@intel.com>
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

Series: Store process name and pid in xe file
URL   : https://patchwork.freedesktop.org/series/136368/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
5ce3e132caaa5b45e5e50201b574a097d130967c
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 59d8eac657fbe85a2412e1d9501cc1ec031f711e
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Mon Jul 22 21:24:28 2024 -0700

    drm/xe: Store process name and pid in xe file
    
    An xe file can outlive the associated process as the GPU cleanup is just
    triggered upon file close (process kill) and completes sometime later.
    If the file close triggers error conditions (GPU hangs) the process
    cannot be safely referenced to retrieve the name and pid for debug
    information. Store the process name and pid directly in the xe file to
    be safe.
    
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
+ /mt/dim checkpatch b27d70e1042bf6a31ba7e5acf58b61c9cd28f95b drm-intel
59d8eac657fb drm/xe: Store process name and pid in xe file


