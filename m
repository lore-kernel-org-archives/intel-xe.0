Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44525C61D97
	for <intel-xe@archiver.kernel.org>; Tue, 21 Nov 2023 22:48:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D0B810E2CF;
	Tue, 21 Nov 2023 22:48:31 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 47A8910E2CF;
 Tue, 21 Nov 2023 22:48:29 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 438B1A0003;
 Tue, 21 Nov 2023 22:48:29 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Andi Shyti" <andi.shyti@linux.intel.com>
Date: Tue, 21 Nov 2023 22:48:29 -0000
Message-ID: <170060690927.30157.559220755225889240@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120111923.232396-1-andi.shyti@linux.intel.com>
In-Reply-To: <20231120111923.232396-1-andi.shyti@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_Remove_unnecessary_=22ret=22_variable?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

== Series Details ==

Series: drm/xe: Remove unnecessary "ret" variable
URL   : https://patchwork.freedesktop.org/series/126645/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 7441bf08fd30b11eaa6809b56ef7a1e2f888feb2
Author: Andi Shyti <andi.shyti@linux.intel.com>
Date:   Mon Nov 20 12:19:23 2023 +0100

    drm/xe: Remove unnecessary "ret" variable
    
    Just a trivial removal of "ret" that doesn't have a good reason
    to exist.
    
    Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
    Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
+ /mt/dim checkpatch 89e2bb1e155242dd9aa46bc90e563e71c5f498b0 drm-intel
7441bf08f drm/xe: Remove unnecessary "ret" variable


