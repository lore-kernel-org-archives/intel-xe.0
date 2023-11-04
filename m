Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45566C4332F
	for <intel-xe@archiver.kernel.org>; Sat,  4 Nov 2023 09:55:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0099A10E203;
	Sat,  4 Nov 2023 09:55:48 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CDDA10E203;
 Sat,  4 Nov 2023 09:55:45 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 8B104AADE8;
 Sat,  4 Nov 2023 09:55:45 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Date: Sat, 04 Nov 2023 09:55:45 -0000
Message-ID: <169909174556.30096.15534961088690839299@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
In-Reply-To: <20231103210324.1115369-1-jonathan.cavitt@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2Echeckpatch=3A_success_for_dr?=
 =?utf-8?q?m/xe=3A_clear_the_serviced_bits_on_INTR=5FIDENTITY=5FREG_=28rev?=
 =?utf-8?q?3=29?=
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

Series: drm/xe: clear the serviced bits on INTR_IDENTITY_REG (rev3)
URL   : https://patchwork.freedesktop.org/series/125971/
State : success

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
63c2b6b160bca2df6efc7bc4cea6f442097d7854
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit aff03cb22aab0a2c6cc76c11b7bbecdf7655c075
Author: Jonathan Cavitt <jonathan.cavitt@intel.com>
Date:   Fri Nov 3 14:03:24 2023 -0700

    drm/xe: clear the serviced bits on INTR_IDENTITY_REG
    
    The spec for this register, like many other interrupt related ones,
    asks software to write back '1' to clear the serviced bits. Let's
    respect the spec.
    
    v2:
    - Update commit message
    - Add missing CC
    
    v3: Rebase
    
    Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
    CC: Daniele Spurio Ceraolo <daniele.ceraolospurio@intel.com>
    CC: Lucas De Marchi <lucas.demarchi@intel.com>
    CC: Rodrigo Vivi <rodrigo.vivi@intel.com>
    CC: Paulo Zanoni <paulo.r.zanoni@intel.com>
    Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
+ /mt/dim checkpatch bfa43da8e1f181fe2f8b84b39cb8a86e54f43731 drm-intel
aff03cb22 drm/xe: clear the serviced bits on INTR_IDENTITY_REG


