Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F49C48BC4
	for <intel-xe@archiver.kernel.org>; Thu, 15 Feb 2024 00:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8394410E0CE;
	Thu, 15 Feb 2024 00:57:57 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B25E10E0CE;
 Thu, 15 Feb 2024 00:57:56 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/xe=3A_get_rid_of_MAX?=
 =?utf-8?q?=5FBINDS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Paulo Zanoni" <paulo.r.zanoni@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Feb 2024 00:57:56 -0000
Message-ID: <170795867663.1238604.6942000628185572912@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
In-Reply-To: <20240215005353.1295420-1-paulo.r.zanoni@intel.com>
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

Series: drm/xe: get rid of MAX_BINDS
URL   : https://patchwork.freedesktop.org/series/129923/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
35591fb8b4d5305b37ce31483f85ac0956eaa536
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 3a65739cb7aace33c8f13da7f2f6ea18ff9492c5
Author: Paulo Zanoni <paulo.r.zanoni@intel.com>
Date:   Wed Feb 14 16:53:53 2024 -0800

    drm/xe: get rid of MAX_BINDS
    
    Mesa has been issuing a single bind operation per ioctl since xe.ko
    changed to GPUVA due xe.ko bug #746. If I change Mesa to try again to
    issue every single bind operation it can in the same ioctl, it hits
    the MAX_BINDS assertion when running Vulkan conformance tests.
    
    Test dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
    issues 960 bind operations in a single ioctl, it's the most I could
    find in the conformance suite.
    
    I don't see a reason to keep the MAX_BINDS restriction: it doesn't
    seem to be preventing any specific issue. If the number is too big for
    the memory allocations, then those will fail. Nothing related to
    num_binds seems to be using the stack. Let's just get rid of it.
    
    Testcase: dEQP-VK.sparse_resources.transfer_queue.3d.rgba32i.1024_128_8
    References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/746
    Cc: Matthew Brost <matthew.brost@intel.com>
    Signed-off-by: Paulo Zanoni <paulo.r.zanoni@intel.com>
+ /mt/dim checkpatch e6a76a4d223eb7b8bcec5d0ae6b1da474823b24a drm-intel
3a65739cb drm/xe: get rid of MAX_BINDS
-:21: WARNING:COMMIT_LOG_USE_LINK: Unknown link reference 'References:', use 'Link:' or 'Closes:' instead
#21: 
References: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/746

total: 0 errors, 1 warnings, 0 checks, 17 lines checked


