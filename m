Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 018D7E77188
	for <intel-xe@archiver.kernel.org>; Fri,  3 Jan 2025 09:49:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C338510E852;
	Fri,  3 Jan 2025 09:49:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1397E10E052;
 Fri,  3 Jan 2025 09:49:18 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/i915/hdcp?=
 =?utf-8?q?=3A_Don=27t_enable_HDCP1=2E4_directly_from_check=5Flink=22_=28rev?=
 =?utf-8?q?2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 03 Jan 2025 09:49:18 -0000
Message-ID: <173589775807.2535057.12575472599949216838@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250103084517.239998-1-suraj.kandpal@intel.com>
In-Reply-To: <20250103084517.239998-1-suraj.kandpal@intel.com>
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

Series: Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link" (rev2)
URL   : https://patchwork.freedesktop.org/series/142872/
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
commit 10b40e9a03ef16caff49c2cd208b333dfd48e048
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Jan 3 14:15:17 2025 +0530

    Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"
    
    This reverts commit 483f7d94a0453564ad9295288c0242136c5f36a0.
    This needs to be reverted since HDCP even after updating the connector
    state HDCP property we don't reenable HDCP until the next commit
    in which the CP Property is set causing compliance to fail.
    
    --v2
    -Fix build issue [Dnyaneshwar]
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 048d83e7f9dae81c058d31c371634c1c317b3013 drm-intel
10b40e9a03ef Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"


