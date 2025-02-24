Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49832C021BB
	for <intel-xe@archiver.kernel.org>; Mon, 24 Feb 2025 15:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 147F510E1D5;
	Mon, 24 Feb 2025 15:17:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88C610E1D5;
 Mon, 24 Feb 2025 15:17:53 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_Fix_VFs_resume_errors?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Feb 2025 15:17:53 -0000
Message-ID: <174041027375.1631247.13825870162699804974@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250224064745.1778-1-satyanarayana.k.v.p@intel.com>
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

Series: Fix VFs resume errors
URL   : https://patchwork.freedesktop.org/series/145295/
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
commit 0b638e46729165a84daeccbfdce8dc8a5b762d91
Author: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Date:   Mon Feb 24 12:17:45 2025 +0530

    drm/xe/vf: Retry sending MMIO request to GUC on timeout error
    
    Add support to allow retrying the sending of MMIO requests
    from the VF to the GUC in the event of an error. During the
    suspend/resume process, VFs begin resuming only after the PF has
    resumed. Although the PF resumes, the GUC reset and provisioning
    occur later in a separate worker process.
    
    When there are a large number of VFs, some may attempt to resume
    before the PF has completed its provisioning. Therefore, if a
    MMIO request from a VF fails during this period, we will retry
    sending the request up to GUC_RESET_VF_STATE_RETRY_MAX times,
    which is set to a maximum of 10 attempts.
    
    Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
    Cc: Michał Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Michał Winiarski <michal.winiarski@intel.com>
    Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
    Reviewed-by: Piotr Piorkowski <piotr.piorkowski@intel.com>
+ /mt/dim checkpatch be5a404c3344b7d794766f045b8f94aa93c42069 drm-intel
369f070de8e2 drm/xe/pf: Create a link between PF and VF devices
0b638e467291 drm/xe/vf: Retry sending MMIO request to GUC on timeout error


