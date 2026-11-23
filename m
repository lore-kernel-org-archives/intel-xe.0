Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CDF606A31A
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 05:10:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D0A10E2E6;
	Mon, 23 Nov 2026 05:10:58 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A431A10E2E6;
 Mon, 23 Nov 2026 05:10:57 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: =?utf-8?q?=E2=9C=97_CI=2Echeckpatch=3A_warning_for_drm/i915/pps=3A_Don=27t_s?=
 =?utf-8?q?teal_VDD_from_another_eDP_port_sharing_the_PPS?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 05:10:57 -0000
Message-ID: <179541065766.67453.2491850745422630899@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261123050422.3130438-1-suraj.kandpal@intel.com>
In-Reply-To: <20261123050422.3130438-1-suraj.kandpal@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

== Series Details ==

Series: drm/i915/pps: Don't steal VDD from another eDP port sharing the PPS
URL   : https://patchwork.freedesktop.org/series/179336/
State : warning

== Summary ==

+ KERNEL=/kernel
+ git clone https://gitlab.freedesktop.org/drm/maintainer-tools mt
Cloning into 'mt'...
warning: redirecting to https://gitlab.freedesktop.org/drm/maintainer-tools.git/
+ git -C mt rev-list -n1 origin/master
3009867cd31863246e4afc138520a7a8bd37bb11
+ cd /kernel
+ git config --global --add safe.directory /kernel
+ git log -n1
commit 42c651fd3adc41c1b4229f64e14b8010fb4a4821
Author: Suraj Kandpal <suraj.kandpal@intel.com>
Date:   Mon Nov 23 10:34:23 2026 +0530

    drm/i915/pps: Don't steal VDD from another eDP port sharing the PPS
    
    Some VBTs declare an unpopulated eDP port next to the real panel and
    assign both the same PPS. The ghost port adopts the VDD bit the real
    port turned on, and when its DPCD read fails it clears EDP_FORCE_VDD
    underneath the real port. The real port's VDD reference is then never
    released, leaking an AUX power domain reference and a runtime PM
    wakelock:
    
      drm_WARN_ON(intel_dp->pps.vdd_wakeref)
      i915 raw-wakerefs=1 wakelocks=1 on cleanup
    
    Don't adopt or turn off VDD owned by another eDP port on the same PPS.
    
    Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/work_items/17232
    Cc: stable@vger.kernel.org # v6.15+
    Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>
+ /mt/dim checkpatch 946126b7cb486de8f218046205d89e86a2178497 drm-intel
42c651fd3adc drm/i915/pps: Don't steal VDD from another eDP port sharing the PPS
-:82: WARNING:MISSING_FIXES_TAG: The commit message has 'stable@', perhaps it also needs a 'Fixes:' tag?

total: 0 errors, 1 warnings, 0 checks, 53 lines checked


