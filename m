Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1484E7718A
	for <intel-xe@archiver.kernel.org>; Fri, 20 Dec 2024 06:08:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0FE710E4C5;
	Fri, 20 Dec 2024 06:08:52 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41E4310E4E7;
 Fri, 20 Dec 2024 06:08:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Revert_=22drm/i915/hdcp?=
 =?utf-8?q?=3A_Don=27t_enable_HDCP1=2E4_directly_from_check=5Flink=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 20 Dec 2024 06:08:51 -0000
Message-ID: <173467493126.689801.10694859319525747569@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241220050153.3053540-1-suraj.kandpal@intel.com>
In-Reply-To: <20241220050153.3053540-1-suraj.kandpal@intel.com>
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

Series: Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"
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
commit 954b068f1bf5ccbcfed29fe2701a26fed0e370f6
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Fri Dec 20 10:31:53 2024 +0530

    Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"
    
    This reverts commit 483f7d94a0453564ad9295288c0242136c5f36a0.
    This needs to be reverted since HDCP even after updating the connector
    state HDCP property we don't reenable HDCP until the next commit
    in which the CP Property is set causing compliance to fail.
    
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch c724b91a26713d5fcedb3ffdbee2058537e7a196 drm-intel
954b068f1bf5 Revert "drm/i915/hdcp: Don't enable HDCP1.4 directly from check_link"


