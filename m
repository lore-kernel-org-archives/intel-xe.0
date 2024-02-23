Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36D2C54798
	for <intel-xe@archiver.kernel.org>; Fri, 23 Feb 2024 14:50:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 710A810EC2E;
	Fri, 23 Feb 2024 14:50:10 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 345D410EC2E;
 Fri, 23 Feb 2024 14:50:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Remove_unused_?=
 =?utf-8?q?=27create=27_parameter_from_queue_property_logic_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 23 Feb 2024 14:50:09 -0000
Message-ID: <170869980921.247285.5619339613526166762@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240223143043.22779-1-nirmoy.das@intel.com>
In-Reply-To: <20240223143043.22779-1-nirmoy.das@intel.com>
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

Series: drm/xe: Remove unused 'create' parameter from queue property logic (rev2)
URL   : https://patchwork.freedesktop.org/series/130308/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
cd62896504543deb288c1d649eed56308dbcfb80
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 70194b0e3232ae7accd1b88c9dff2dee45ce9a5c
Author: Nirmoy Das <nirmoy.das@intel.com>
Date:   Fri Feb 23 15:30:43 2024 +0100

    drm/xe: Remove unused 'create' parameter from queue property logic
    
    The 'create' parameter in exec_queue_user_extensions was always true.
    This commit removes the dead parameter and all the relevant dead code.
    
    v2: rebase.
    
    Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch cb708dc5ff66b8076fac96420a9609f6b58a565a drm-intel
70194b0e3232 drm/xe: Remove unused 'create' parameter from queue property logic


