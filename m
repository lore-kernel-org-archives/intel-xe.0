Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0D5C47DDF
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jan 2024 13:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E2C1130A6;
	Tue, 30 Jan 2024 13:29:22 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05B831130A6;
 Tue, 30 Jan 2024 13:29:21 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_drm/xe=3A_Use_function_to?=
 =?utf-8?q?_emit_PIPE=5FCONTROL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Tue, 30 Jan 2024 13:29:21 -0000
Message-ID: <170662136102.824492.14295849070052392872@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240130132249.8615-1-jose.souza@intel.com>
In-Reply-To: <20240130132249.8615-1-jose.souza@intel.com>
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

Series: drm/xe: Use function to emit PIPE_CONTROL (rev2)
URL   : https://patchwork.freedesktop.org/series/129281/
State : success

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
commit d8f494ef4616237c137e56c6ef4d5e47cffba993
Author: José Roberto de Souza <jose.souza@intel.com>
Date:   Tue Jan 30 05:22:49 2024 -0800

    drm/xe: Use function to emit PIPE_CONTROL
    
    This reduces code duplication in xe_ring_ops.
    
    v2:
    - fix flags of emit_pipe_imm_ggtt()
    - reduce to only one function
    
    v3:
    - fix emit_pipe_imm_ggtt() stall_only check
    
    Cc: Matt Roper <matthew.d.roper@intel.com>
    Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
    Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
+ /mt/dim checkpatch c655e0fd28045dbaa581d04bf7cc266eec1c3457 drm-intel
d8f494ef4 drm/xe: Use function to emit PIPE_CONTROL


