Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68258C02198
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 11:07:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3556B10E034;
	Tue, 18 Feb 2025 11:07:49 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A4C810E034;
 Tue, 18 Feb 2025 11:07:48 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Fix_exporting_x?=
 =?utf-8?q?e_buffers_multiple_times?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jacek Lawrynowicz" <jacek.lawrynowicz@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 11:07:48 -0000
Message-ID: <173987686836.3539975.2008102628031080295@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
In-Reply-To: <20250218100353.2137964-1-jacek.lawrynowicz@linux.intel.com>
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

Series: drm/xe: Fix exporting xe buffers multiple times
URL   : https://patchwork.freedesktop.org/series/145001/
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
commit e47b370781646f06961f9fff260b15b0548d6a6d
Author: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
Date:   Tue Feb 18 11:03:53 2025 +0100

    drm/xe: Fix exporting xe buffers multiple times
    
    The `struct ttm_resource->placement` contains TTM_PL_FLAG_* flags, but
    it was incorrectly tested for XE_PL_* flags.
    This caused xe_dma_buf_pin() to always fail when invoked for
    the second time. Fix this by checking the `mem_type` field instead.
    
    Fixes: 7764222d54b7 ("drm/xe: Disallow pinning dma-bufs in VRAM")
    Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
    Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Matthew Brost <matthew.brost@intel.com>
    Cc: Matthew Auld <matthew.auld@intel.com>
    Cc: Nirmoy Das <nirmoy.das@intel.com>
    Cc: Jani Nikula <jani.nikula@intel.com>
    Cc: intel-xe@lists.freedesktop.org
    Cc: <stable@vger.kernel.org> # v6.8+
    Signed-off-by: Tomasz Rusinowicz <tomasz.rusinowicz@intel.com>
    Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
+ /mt/dim checkpatch 4587c05996666a92af63f86ba410bae1dc940794 drm-intel
e47b37078164 drm/xe: Fix exporting xe buffers multiple times


