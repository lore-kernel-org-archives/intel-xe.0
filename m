Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADCA6C54ED1
	for <intel-xe@archiver.kernel.org>; Tue, 27 May 2025 05:10:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C06910E0A0;
	Tue, 27 May 2025 05:10:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C07610E0ED;
 Tue, 27 May 2025 05:10:51 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Allow_to_trigge?=
 =?utf-8?q?r_GT_resets_using_debugfs_writes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 May 2025 05:10:51 -0000
Message-ID: <174832265110.22785.17996186242660437840@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250519200914.216-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250519200914.216-1-michal.wajdeczko@intel.com>
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

Series: drm/xe: Allow to trigger GT resets using debugfs writes
URL   : https://patchwork.freedesktop.org/series/149204/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
202708c00696422fd217223bb679a353a5936e23
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 58da29d9726397c18166da8c766df0e4fed43900
Author: Michal Wajdeczko <michal.wajdeczko@intel.com>
Date:   Mon May 19 22:09:14 2025 +0200

    drm/xe: Allow to trigger GT resets using debugfs writes
    
    Today we allow to trigger GT resest by reading dedicated debugfs
    files "force_reset" and "force_reset_sync" that we are exposing
    using drm_info_list[] and drm_debugfs_create_files().
    
    To avoid triggering potentially disruptive actions during otherwise
    "safe" read operations, expose those two attributes using debugfs
    function where we can specify file permissions and provide custom
    "write" handler to trigger the GT resets also from there.
    
    This step would allow us to drop triggering GT resets during read
    operations, which we leave just to give users more time to switch.
    
    Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
    Cc: Lucas De Marchi <lucas.demarchi@intel.com>
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch 3e019cc3eaffcb7022b9de66871eabdefd6e06ff drm-intel
58da29d97263 drm/xe: Allow to trigger GT resets using debugfs writes


