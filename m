Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC1FC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 12 Dec 2023 21:52:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B123A10E0C9;
	Tue, 12 Dec 2023 21:52:29 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2DFDD10E695;
 Tue, 12 Dec 2023 21:52:28 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 29B6FAADD6;
 Tue, 12 Dec 2023 21:52:28 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_num=5Fbat?=
 =?utf-8?q?ch=5Fbuffer_/_num=5Fbinds_=3D=3D_0_in_IOCTLs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Tue, 12 Dec 2023 21:52:28 -0000
Message-ID: <170241794816.31293.7857577095375006127@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231212190537.529882-1-matthew.brost@intel.com>
In-Reply-To: <20231212190537.529882-1-matthew.brost@intel.com>
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

Series: drm/xe: Allow num_batch_buffer / num_binds == 0 in IOCTLs
URL   : https://patchwork.freedesktop.org/series/127709/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
6030b24c1386b00de8187b5fb987e283a57b372a
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ad863abab8c7207ae1aeb50ed2ddda56772c82b3
Author: Matthew Brost <matthew.brost@intel.com>
Date:   Tue Dec 12 11:05:37 2023 -0800

    drm/xe: Allow num_batch_buffer / num_binds == 0 in IOCTLs
    
    The idea being out-syncs can signal indicating all previous operations
    on the bind queue are complete. An example use case of this would be
    support for implementing vkQueueWaitIdle easily.
    
    All in-syncs are waited on before signaling out-syncs. This is
    implemented by forming a composite software fence of in-syncs and
    installing this fence in the out-syncs and exec queue last fence slot.
    
    The last fence must be added as a dependency for jobs on user exec
    queues as it is possible for the last fence to be a composite software
    fence (unordered, ioctl with zero bb or binds) rather than hardware
    fence (ordered, previous job on queue).
    
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Signed-off-by: Matthew Brost <matthew.brost@intel.com>
    Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
+ /mt/dim checkpatch 0b1815ab4b04bda8d9ee494052ac24f7d307132c drm-intel
ad863abab drm/xe: Allow num_batch_buffer / num_binds == 0 in IOCTLs


