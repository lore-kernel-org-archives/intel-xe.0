Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD36C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 08:46:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AF7D10E03F;
	Thu,  6 Jun 2024 08:46:39 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E61A10E03F;
 Thu,  6 Jun 2024 08:46:38 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Cleanup_force_w?=
 =?utf-8?q?ake_registers_bit_definitions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Jun 2024 08:46:38 -0000
Message-ID: <171766359812.3990.14247479421202885183@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240606085720.1327152-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240606085720.1327152-1-himal.prasad.ghimiray@intel.com>
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

Series: drm/xe: Cleanup force wake registers bit definitions
URL   : https://patchwork.freedesktop.org/series/134543/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
51ce9f6cd981d42d7467409d7dbc559a450abc1e
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit ebb98c65125c8b3c050dd8d84d32afe6af8b4367
Author: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Date:   Thu Jun 6 14:27:20 2024 +0530

    drm/xe: Cleanup force wake registers bit definitions
    
    - Remove unused bit definitions.
    - Driver uses BIT(0) for waking/sleeping the domain and since the
    registers are masked respective mask bit BIT(16) needs to be set. Use
    defines for these bits and use them in domain initialization.
    
    v3
    - Use defines within domain_init
    
    Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Cc: Badal Nilawar <badal.nilawar@intel.com>
    Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
    Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
    Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch ec3e566521b91eb773769fa1df899a28063a10e9 drm-intel
ebb98c65125c drm/xe: Cleanup force wake registers bit definitions


