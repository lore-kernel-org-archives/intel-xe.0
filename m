Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE70C43602
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 19:32:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83CCB10EA0F;
	Mon, 29 Jun 2026 19:32:02 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6783210EA0F;
 Mon, 29 Jun 2026 19:32:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0800113515602464111=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/1=5D_drm/xe/guc=3A_Handle_GuC_local_uncorrectable_error_noti?=
 =?utf-8?q?fications_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 19:32:00 -0000
Message-ID: <178276152040.130398.7293939239862907884@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625225106.1703176-1-zhanjun.dong@intel.com>
In-Reply-To: <20260625225106.1703176-1-zhanjun.dong@intel.com>
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

--===============0800113515602464111==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/1] drm/xe/guc: Handle GuC local uncorrectable error notifications (rev2)
URL   : https://patchwork.freedesktop.org/series/169226/
State : failure

== Summary ==

CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL -> xe-pw-169226v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169226v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169226v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169226v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          NOTRUN -> [ABORT][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - shard-bmg:          NOTRUN -> [WARN][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_pm_rpm@dpms-non-lpsp.html

  * {igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720} (NEW):
    - shard-bmg:          NOTRUN -> [FAIL][4] +114 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:
    - shard-bmg:          [SKIP][7] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset.html

  
New tests
---------

  New tests have been introduced between xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL and xe-pw-169226v2_FULL:

### New IGT tests (116) ###

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs16384:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs16385:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs1:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs16384:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown0:
    - Statuses : 1 fail(s)
    - Exec time: [15.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown1:
    - Statuses : 1 fail(s)
    - Exec time: [0.23] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10226:
    - Statuses : 1 fail(s)
    - Exec time: [2.31] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10596:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10738:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11565:
    - Statuses : 1 fail(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11568:
    - Statuses : 1 fail(s)
    - Exec time: [0.19] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11636:
    - Statuses : 1 fail(s)
    - Exec time: [0.29] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11641:
    - Statuses : 1 fail(s)
    - Exec time: [0.22] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11824:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11887:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12:
    - Statuses : 1 fail(s)
    - Exec time: [0.48] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12080:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12333:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12335:
    - Statuses : 1 fail(s)
    - Exec time: [0.15] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12336:
    - Statuses : 1 fail(s)
    - Exec time: [3.34] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12344:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12346:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12403:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12592:
    - Statuses : 1 fail(s)
    - Exec time: [0.39] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12659:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13110:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13368:
    - Statuses : 1 fail(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13880:
    - Statuses : 1 fail(s)
    - Exec time: [0.37] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13926:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14896:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14897:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14947:
    - Statuses : 1 fail(s)
    - Exec time: [0.93] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14985:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14986:
    - Statuses : 1 fail(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16709:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720:
    - Statuses : 1 fail(s)
    - Exec time: [0.53] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16986:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown18733:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown19968:
    - Statuses : 1 fail(s)
    - Exec time: [1.59] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20057:
    - Statuses : 1 fail(s)
    - Exec time: [2.53] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20736:
    - Statuses : 1 fail(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20752:
    - Statuses : 1 fail(s)
    - Exec time: [7.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20753:
    - Statuses : 1 fail(s)
    - Exec time: [2.02] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20754:
    - Statuses : 1 fail(s)
    - Exec time: [0.42] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20755:
    - Statuses : 1 fail(s)
    - Exec time: [4.14] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20756:
    - Statuses : 1 fail(s)
    - Exec time: [5.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20757:
    - Statuses : 1 fail(s)
    - Exec time: [3.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20759:
    - Statuses : 1 fail(s)
    - Exec time: [0.58] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20760:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20761:
    - Statuses : 1 fail(s)
    - Exec time: [2.32] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21313:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21317:
    - Statuses : 1 fail(s)
    - Exec time: [0.35] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21331:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23856:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23861:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23862:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23865:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown24885:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25442:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25445:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25449:
    - Statuses : 1 fail(s)
    - Exec time: [0.23] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25456:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25708:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown2574:
    - Statuses : 1 fail(s)
    - Exec time: [0.32] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25955:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25960:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25971:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25973:
    - Statuses : 1 fail(s)
    - Exec time: [2.42] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26168:
    - Statuses : 1 fail(s)
    - Exec time: [2.52] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26214:
    - Statuses : 1 fail(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26988:
    - Statuses : 1 fail(s)
    - Exec time: [0.69] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown27502:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown27745:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28018:
    - Statuses : 1 fail(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28257:
    - Statuses : 1 fail(s)
    - Exec time: [0.48] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28279:
    - Statuses : 1 fail(s)
    - Exec time: [0.23] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28531:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28733:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28786:
    - Statuses : 1 fail(s)
    - Exec time: [2.53] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown292:
    - Statuses : 1 fail(s)
    - Exec time: [2.62] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29281:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29289:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29298:
    - Statuses : 1 fail(s)
    - Exec time: [0.12] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29299:
    - Statuses : 1 fail(s)
    - Exec time: [2.51] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29440:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29541:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29555:
    - Statuses : 1 fail(s)
    - Exec time: [2.48] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29793:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29795:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30062:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30309:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30765:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30784:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown48:
    - Statuses : 1 fail(s)
    - Exec time: [1.60] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown49:
    - Statuses : 1 fail(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown5:
    - Statuses : 1 fail(s)
    - Exec time: [0.18] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown51:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown513:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62479:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62752:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62753:
    - Statuses : 1 fail(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63146:
    - Statuses : 1 fail(s)
    - Exec time: [0.11] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63149:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63160:
    - Statuses : 1 fail(s)
    - Exec time: [0.10] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63191:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63232:
    - Statuses : 1 fail(s)
    - Exec time: [0.52] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63277:
    - Statuses : 1 fail(s)
    - Exec time: [2.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63317:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63318:
    - Statuses : 1 fail(s)
    - Exec time: [0.09] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown64421:
    - Statuses : 1 fail(s)
    - Exec time: [3.21] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown64951:
    - Statuses : 1 fail(s)
    - Exec time: [0.17] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown65535:
    - Statuses : 1 fail(s)
    - Exec time: [3.77] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown69:
    - Statuses : 1 fail(s)
    - Exec time: [0.16] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8224:
    - Statuses : 1 fail(s)
    - Exec time: [0.31] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.13] s

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown99:
    - Statuses : 1 fail(s)
    - Exec time: [2.80] s

  

Known issues
------------

  Here are the changes found in xe-pw-169226v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#8517])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@read:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2134])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@read.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [TIMEOUT][13] ([Intel XE#8446] / [Intel XE#8479]) +2 other tests timeout
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7059] / [Intel XE#7085])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][15] -> [TIMEOUT][16] ([Intel XE#8446] / [Intel XE#8479]) +1 other test timeout
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1124]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][19] ([Intel XE#8445] / [Intel XE#8479])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7679])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][21] ([Intel XE#8479] / [Intel XE#8506])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][23] -> [INCOMPLETE][24] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +7 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325] / [Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7642])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2320])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][31] -> [INCOMPLETE][32] ([Intel XE#7935] / [Intel XE#8151] / [Intel XE#8479])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-basic-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8265]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_dsc@dsc-basic-bigjoiner.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#6126] / [Intel XE#776])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2374] / [Intel XE#6128])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][36] -> [INCOMPLETE][37] ([Intel XE#8155] / [Intel XE#8479])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][38] -> [FAIL][39] ([Intel XE#8512]) +4 other tests fail
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [CRASH][40] ([Intel XE#8461])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7179])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4141]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2311]) +20 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7061])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [PASS][46] -> [TIMEOUT][47] ([Intel XE#8479])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [PASS][48] -> [TIMEOUT][49] ([Intel XE#8466] / [Intel XE#8479]) +1 other test timeout
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7061] / [Intel XE#7356])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8441] / [Intel XE#8480]) +80 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2313]) +21 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7061])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][55] ([Intel XE#1035] / [Intel XE#8479])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7283])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#8459] / [Intel XE#8479]) +3 other tests incomplete
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8395])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#8396])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7794])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2499])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#1489]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2330] / [Intel XE#5813])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6503])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2509] / [Intel XE#7437])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@testdisplay:
    - shard-bmg:          [PASS][69] -> [ABORT][70] ([Intel XE#8300])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@testdisplay.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#6599])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7636]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#6321] / [Intel XE#8355])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#8370]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][76] ([Intel XE#8437] / [Intel XE#8479]) +4 other tests incomplete
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][77] -> [INCOMPLETE][78] ([Intel XE#8499])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * {igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240} (NEW):
    - shard-bmg:          NOTRUN -> [INCOMPLETE][79] ([Intel XE#8499])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240.html

  * igt@xe_exec_basic@many-execqueues-null-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8480]) +260 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@xe_exec_basic@many-execqueues-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][81] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8374]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#8364]) +6 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system:
    - shard-bmg:          [PASS][85] -> [INCOMPLETE][86] ([Intel XE#8479]) +1 other test incomplete
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][87] ([Intel XE#1727]) +1 other test dmesg-fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          [PASS][88] -> [SKIP][89] ([Intel XE#8440] / [Intel XE#8480]) +33 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:
    - shard-bmg:          [PASS][90] -> [INCOMPLETE][91] ([Intel XE#8159] / [Intel XE#8479]) +6 other tests incomplete
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][92] ([Intel XE#8159] / [Intel XE#8479])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:
    - shard-bmg:          [PASS][93] -> [FAIL][94] ([Intel XE#8479]) +10 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap:
    - shard-bmg:          NOTRUN -> [FAIL][95] ([Intel XE#8479]) +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-malloc-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#8440] / [Intel XE#8480]) +60 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-nomemset.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][97] -> [TIMEOUT][98] ([Intel XE#8470] / [Intel XE#8479])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8378]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [PASS][100] -> [INCOMPLETE][101] ([Intel XE#8479] / [Intel XE#8486]) +1 other test incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][102] ([Intel XE#8479] / [Intel XE#8486])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:
    - shard-bmg:          NOTRUN -> [CRASH][103] ([Intel XE#8448])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [PASS][104] -> [ABORT][105] ([Intel XE#8007]) +1 other test abort
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#6964])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#7793])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#4733] / [Intel XE#7417])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-topology:
    - shard-bmg:          NOTRUN -> [SKIP][109] ([Intel XE#944])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-bmg:          [SKIP][110] ([Intel XE#2134]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@write.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@fbdev@write.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-bmg:          [INCOMPLETE][112] ([Intel XE#6819] / [Intel XE#7912] / [Intel XE#8174]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:
    - shard-bmg:          [INCOMPLETE][114] ([Intel XE#6819] / [Intel XE#8174]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [TIMEOUT][116] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][117] +1 other test pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][118] ([Intel XE#8479] / [Intel XE#8506]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [TIMEOUT][120] ([Intel XE#8451] / [Intel XE#8479]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [TIMEOUT][122] ([Intel XE#8479]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [INCOMPLETE][124] ([Intel XE#8155] / [Intel XE#8479]) -> [PASS][125]
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][126] ([Intel XE#301]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:
    - shard-bmg:          [INCOMPLETE][128] ([Intel XE#8479] / [Intel XE#8504]) -> [PASS][129]
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][130] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][132] ([Intel XE#1503]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:
    - shard-bmg:          [TIMEOUT][134] ([Intel XE#8510]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-bmg:          [CRASH][136] ([Intel XE#8458]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:
    - shard-bmg:          [INCOMPLETE][138] ([Intel XE#8459]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - shard-bmg:          [INCOMPLETE][140] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][141] +2 other tests pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][142] ([Intel XE#8440]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@xe_configfs@ctx-restore-post-bb:
    - shard-bmg:          [ABORT][144] ([Intel XE#8007]) -> [PASS][145] +1 other test pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_configfs@ctx-restore-post-bb.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - shard-bmg:          [INCOMPLETE][146] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate:
    - shard-bmg:          [SKIP][148] ([Intel XE#8440] / [Intel XE#8480]) -> [PASS][149] +102 other tests pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:
    - shard-bmg:          [CRASH][150] ([Intel XE#8450]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - shard-bmg:          [FAIL][152] ([Intel XE#8479]) -> [PASS][153] +10 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:
    - shard-bmg:          [FAIL][154] -> [PASS][155]
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:
    - shard-bmg:          [INCOMPLETE][156] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:
    - shard-lnl:          [TIMEOUT][158] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [TIMEOUT][160] ([Intel XE#8356] / [Intel XE#8447]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - shard-bmg:          [TIMEOUT][162] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][165] +4 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [CRASH][166] ([Intel XE#8448]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:
    - shard-bmg:          [INCOMPLETE][168] ([Intel XE#8479] / [Intel XE#8486]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html

  * igt@xe_pmu@gt-frequency:
    - shard-bmg:          [WARN][170] -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_pmu@gt-frequency.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_pmu@gt-frequency.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#8477] / [Intel XE#8479]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [ABORT][174] -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
    - shard-bmg:          [TIMEOUT][176] ([Intel XE#8479] / [Intel XE#8500]) -> [CRASH][177] ([Intel XE#8457])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          [TIMEOUT][178] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][179] ([Intel XE#5643] / [Intel XE#8479])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][180] ([Intel XE#8440] / [Intel XE#8480]) -> [TIMEOUT][181] ([Intel XE#8446] / [Intel XE#8479]) +1 other test timeout
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [INCOMPLETE][182] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][183] ([Intel XE#8479])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][184] ([Intel XE#5643]) -> [INCOMPLETE][185] ([Intel XE#5643] / [Intel XE#8479])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][186] ([Intel XE#5643] / [Intel XE#8479]) -> [INCOMPLETE][187] ([Intel XE#5643])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-bmg:          [SKIP][188] ([Intel XE#1124]) -> [SKIP][189] ([Intel XE#8440] / [Intel XE#8480])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][190] ([Intel XE#8446]) -> [SKIP][191] ([Intel XE#1124])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][192] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][193] ([Intel XE#1124]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [INCOMPLETE][194] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][195] ([Intel XE#1124])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][196] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][197] ([Intel XE#8446]) +2 other tests timeout
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][198] ([Intel XE#8446]) -> [INCOMPLETE][199] ([Intel XE#5643] / [Intel XE#8479])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [CRASH][200] ([Intel XE#8449]) -> [SKIP][201] ([Intel XE#7679])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][202] ([Intel XE#8440] / [Intel XE#8480]) -> [INCOMPLETE][203] ([Intel XE#8479] / [Intel XE#8506])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][204] ([Intel XE#367]) -> [INCOMPLETE][205] ([Intel XE#8479] / [Intel XE#8506]) +1 other test incomplete
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [INCOMPLETE][206] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][207] ([Intel XE#367]) +2 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][208] ([Intel XE#8479] / [Intel XE#8506]) -> [SKIP][209] ([Intel XE#8440] / [Intel XE#8480])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][210] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][211] ([Intel XE#2887]) +2 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][212] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][213] ([Intel XE#2652])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][214] ([Intel XE#3432]) -> [INCOMPLETE][215] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [INCOMPLETE][216] ([Intel XE#8150] / [Intel XE#8479]) -> [SKIP][217] ([Intel XE#2887])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][218] ([Intel XE#2887]) -> [SKIP][219] ([Intel XE#8440] / [Intel XE#8480])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][220] ([Intel XE#2887]) -> [INCOMPLETE][221] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-bmg:          [SKIP][222] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][223] ([Intel XE#2252]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-bmg:          [SKIP][224] ([Intel XE#2252]) -> [SKIP][225] ([Intel XE#8440] / [Intel XE#8480])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][226] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][227] ([Intel XE#2320])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][228] ([Intel XE#2286] / [Intel XE#6035]) -> [INCOMPLETE][229] ([Intel XE#8151] / [Intel XE#8479])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][230] ([Intel XE#8151] / [Intel XE#8479]) -> [SKIP][231] ([Intel XE#8440] / [Intel XE#8480])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][232] ([Intel XE#8151] / [Intel XE#8479]) -> [TIMEOUT][233] ([Intel XE#8451] / [Intel XE#8479])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][234] ([Intel XE#4354] / [Intel XE#5882]) -> [SKIP][235] ([Intel XE#8440] / [Intel XE#8480])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][236] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][237] ([Intel XE#4354] / [Intel XE#7386])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][238] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][239] ([Intel XE#4422] / [Intel XE#7442])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][240] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][241] ([Intel XE#4156] / [Intel XE#7425])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [CRASH][242] ([Intel XE#8461]) -> [SKIP][243] ([Intel XE#8440] / [Intel XE#8480])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          [CRASH][244] -> [TIMEOUT][245] ([Intel XE#8467] / [Intel XE#8479])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][246] ([Intel XE#8504]) -> [TIMEOUT][247] ([Intel XE#8467] / [Intel XE#8479])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][248] ([Intel XE#2311]) -> [INCOMPLETE][249] ([Intel XE#8368] / [Intel XE#8479])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][250] ([Intel XE#2311]) -> [SKIP][251] ([Intel XE#8440] / [Intel XE#8480]) +3 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][252] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][253] ([Intel XE#4141])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][254] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][255] ([Intel XE#2311])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][256] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][257] ([Intel XE#2352] / [Intel XE#7399])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][258] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][259] ([Intel XE#2311]) +8 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][260] ([Intel XE#8440] / [Intel XE#8480]) -> [INCOMPLETE][261] ([Intel XE#8368] / [Intel XE#8479])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [INCOMPLETE][262] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][263] ([Intel XE#8440] / [Intel XE#8480])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [TIMEOUT][264] ([Intel XE#8466] / [Intel XE#8479]) -> [INCOMPLETE][265] ([Intel XE#8368] / [Intel XE#8479]) +1 other test incomplete
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-bmg:          [SKIP][266] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][267] ([Intel XE#2313]) +9 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [CRASH][268] ([Intel XE#8505]) -> [SKIP][269] ([Intel XE#2313])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][270] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][271] ([Intel XE#2313]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-bmg:          [SKIP][272] ([Intel XE#2313]) -> [SKIP][273] ([Intel XE#8440] / [Intel XE#8480]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][274] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][275] ([Intel XE#8440] / [Intel XE#8480])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:
    - shard-bmg:          [SKIP][276] ([Intel XE#7283]) -> [INCOMPLETE][277] ([Intel XE#1035] / [Intel XE#8479])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][278] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][279] ([Intel XE#8440] / [Intel XE#8480])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-bmg:          [SKIP][280] ([Intel XE#8440] / [Intel XE#8480]) -> [CRASH][281] ([Intel XE#8460])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][282] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][283] ([Intel XE#7283])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][284] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][285] ([Intel XE#2763] / [Intel XE#6886])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          [SKIP][286] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][287] ([Intel XE#8395])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][288] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][289] ([Intel XE#1489])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][290] ([Intel XE#1489]) -> [SKIP][291] ([Intel XE#8440] / [Intel XE#8480])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          [SKIP][292] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][293] ([Intel XE#2234] / [Intel XE#2850])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][294] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][295] ([Intel XE#7795])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          [SKIP][296] ([Intel XE#7636]) -> [SKIP][297] ([Intel XE#8440] / [Intel XE#8480])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-bind-extended:
    - shard-bmg:          [SKIP][298] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][299] ([Intel XE#7636])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-extended.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-extended.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [CRASH][300] ([Intel XE#8438] / [Intel XE#8482]) -> [SKIP][301] ([Intel XE#2322] / [Intel XE#7372])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [CRASH][302] ([Intel XE#8482]) -> [INCOMPLETE][303] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          [SKIP][304] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][305] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          [SKIP][306] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][307] ([Intel XE#8440] / [Intel XE#8480])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][308] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) -> [SKIP][309] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][310] ([Intel XE#8374]) -> [INCOMPLETE][311] ([Intel XE#8479]) +2 other tests incomplete
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          [SKIP][312] ([Intel XE#8374]) -> [SKIP][313] ([Intel XE#8440] / [Intel XE#8480])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-bmg:          [SKIP][314] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][315] ([Intel XE#8374]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          [SKIP][316] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][317] ([Intel XE#8364]) +2 other tests skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:
    - shard-bmg:          [SKIP][318] ([Intel XE#8364]) -> [SKIP][319] ([Intel XE#8440] / [Intel XE#8480]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-bmg:          [SKIP][320] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][321] ([Intel XE#8369])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_reset@multi-queue-gt-reset.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:
    - shard-bmg:          [SKIP][322] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][323] ([Intel XE#8479])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          [SKIP][324] ([Intel XE#8378]) -> [SKIP][325] ([Intel XE#8440] / [Intel XE#8480])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][326] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][327] ([Intel XE#8007])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [ABORT][328] ([Intel XE#8007]) -> [INCOMPLETE][329] ([Intel XE#8479] / [Intel XE#8486])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          [SKIP][330] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][331] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_media_fill@media-fill.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_multigpu_svm@mgpu-latency-basic:
    - shard-bmg:          [SKIP][332] ([Intel XE#6964]) -> [SKIP][333] ([Intel XE#6964] / [Intel XE#8440])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-basic.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][334] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][335] ([Intel XE#7793])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][336] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][337] ([Intel XE#944])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7912
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
  [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
  [Intel XE#8445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445
  [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
  [Intel XE#8449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449
  [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
  [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
  [Intel XE#8457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8457
  [Intel XE#8458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458
  [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
  [Intel XE#8460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470
  [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499
  [Intel XE#8500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8500
  [Intel XE#8504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504
  [Intel XE#8505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505
  [Intel XE#8506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506
  [Intel XE#8510]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8510
  [Intel XE#8512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8512
  [Intel XE#8517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -> xe-pw-169226v2

  IGT_8987: 8987
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34
  xe-pw-169226v2: 169226v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/index.html

--===============0800113515602464111==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>series starting with [v3,1/1] drm/xe/guc: Handle GuC local uncorrectable error notifications (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169226/">https://patchwork.freedesktop.org/series/169226/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL -&gt; xe-pw-169226v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169226v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-169226v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-169226v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@core_hotunplug@hotunbind-rebind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720.html">FAIL</a> +114 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@vcs0.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-malloc-mlock-nomemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_FULL and xe-pw-169226v2_FULL:</p>
<h3>New IGT tests (116)</h3>
<ul>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs16384:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@bcs16385:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@ccs16384:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown0:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [15.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown1:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10226:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10596:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown10738:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11565:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11568:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.19] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11636:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.29] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11641:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11824:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown11887:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12080:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12333:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12335:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12336:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.34] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12344:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12346:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12403:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12592:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.39] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown12659:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13110:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13368:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13880:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.37] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown13926:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14896:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14897:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14947:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.93] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14985:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown14986:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16709:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16720:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown16986:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown18733:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown19968:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.59] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20057:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20736:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20752:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [7.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20753:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20754:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20755:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [4.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20756:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [5.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20757:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20759:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.58] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20760:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown20761:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21313:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21317:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.35] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown21331:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23856:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23861:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23862:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown23865:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown24885:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25442:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25445:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25449:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25456:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25708:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown2574:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.32] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25955:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25960:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25971:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown25973:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.42] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26168:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26214:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown26988:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.69] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown27502:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown27745:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28018:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28257:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28279:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28531:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28733:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown28786:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.53] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown292:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.62] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29281:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29289:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29298:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29299:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.51] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29440:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29541:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29555:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.48] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29793:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown29795:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30062:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30309:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30765:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown30784:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown48:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.60] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown49:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown5:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.18] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown51:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown513:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62479:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62752:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown62753:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63146:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63149:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63160:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.10] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63191:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63232:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.52] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63277:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63317:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown63318:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown64421:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.21] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown64951:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown65535:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.77] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown69:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8224:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240:</p>
<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown99:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.80] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169226v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8517">Intel XE#8517</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@y-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_dsc@dsc-basic-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8512">Intel XE#8512</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +80 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_psr@fbc-psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaling-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaling-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race@unknown8240.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@xe_exec_basic@many-execqueues-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +260 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-madvise.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-multi-vma.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-remap-dontunmap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-malloc-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_system_allocator@process-many-malloc-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +60 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470">Intel XE#8470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pm_init_early.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@fbdev@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@fbdev@write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7912">Intel XE#7912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_legacy@long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504">Intel XE#8504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-upscaling.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8510">Intel XE#8510</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-rotation@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8458">Intel XE#8458</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_configfs@ctx-restore-post-bb.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-10/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_fault_mode@twice-userptr-invalidate.html">PASS</a> +102 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450">Intel XE#8450</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-comp-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356">Intel XE#8356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_sriov_init.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@xe_pmu@gt-frequency.html">WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-4/igt@xe_pmu@gt-frequency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477">Intel XE#8477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8500">Intel XE#8500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8457">Intel XE#8457</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449">Intel XE#8449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Intel XE#8451</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">CRASH</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE#8467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504">Intel XE#8504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-valid-mode.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE#8467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505">Intel XE#8505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460">Intel XE#8460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-extended:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-extended.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-9/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-7/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-5/igt@xe_multigpu_svm@mgpu-latency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/shard-bmg-8/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169226v2/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -&gt; xe-pw-169226v2</li>
</ul>
<p>IGT_8987: 8987<br />
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34<br />
  xe-pw-169226v2: 169226v2</p>

</body>
</html>

--===============0800113515602464111==--
