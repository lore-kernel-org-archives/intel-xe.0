Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC05DD1118C
	for <intel-xe@archiver.kernel.org>; Sun,  3 Nov 2024 20:21:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85C5A10E170;
	Sun,  3 Nov 2024 20:21:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07EAA10E299;
 Sun,  3 Nov 2024 20:21:37 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_PF=3A_Expose_access_to_th?=
 =?utf-8?q?e_VF_GGTT_PTEs_over_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 03 Nov 2024 20:21:37 -0000
Message-ID: <173066529702.1389734.14911879261968408924@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241103201633.1859-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241103201633.1859-1-michal.wajdeczko@intel.com>
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

Series: PF: Expose access to the VF GGTT PTEs over debugfs
URL   : https://patchwork.freedesktop.org/series/140848/
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
commit 44ba0a046ec1cb9e7fe196b08111ec5deef45ce2
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Sun Nov 3 21:16:33 2024 +0100

    drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs
    
    For feature enabling and testing purposes, allow to capture and
    replace VF's GGTT PTEs data using debugfs blob file.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
+ /mt/dim checkpatch 2a0d989e396396f20ee5cfc4fad5b9dbbb2307d5 drm-intel
46e81d710477 drm/xe: Add read/write debugfs helpers for GGTT node
44ba0a046ec1 drm/xe/pf: Expose access to the VF GGTT PTEs over debugfs


