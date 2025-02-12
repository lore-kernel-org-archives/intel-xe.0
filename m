Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FEB3C021A4
	for <intel-xe@archiver.kernel.org>; Wed, 12 Feb 2025 09:39:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBF410E829;
	Wed, 12 Feb 2025 09:39:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A42A10E829;
 Wed, 12 Feb 2025 09:39:35 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Add_fault_injec?=
 =?utf-8?q?tion_for_xe=5Fsync=5Fentry=5Fparse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: priyanka.dandamudi@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Feb 2025 09:39:35 -0000
Message-ID: <173935317536.1247041.3304155711250547502@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
In-Reply-To: <20250212093212.3069356-1-priyanka.dandamudi@intel.com>
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

Series: drm/xe: Add fault injection for xe_sync_entry_parse
URL   : https://patchwork.freedesktop.org/series/144709/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
22f9cda3436b4fe965b5c5f31d2f2c1bcb483189
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ffa48225b8c579f815e24a9dc0631486b8c73a42
Author: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
Date:   Wed Feb 12 09:32:12 2025 +0000

    drm/xe: Add fault injection for xe_sync_entry_parse
    
    Add fault injection for xe_sync_entry_parse to allow it to fail while
    executing xe_vm_bind_ioctl().
    This need to be added as it cannot be reached by injecting error through
    IOCTL arguments.
    
    Signed-off-by: Priyanka Dandamudi <priyanka.dandamudi@intel.com>
+ /mt/dim checkpatch 212e6e1842223b745408ec6ae15be3009bb8635e drm-intel
ffa48225b8c5 drm/xe: Add fault injection for xe_sync_entry_parse


