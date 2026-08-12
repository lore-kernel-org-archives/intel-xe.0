Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B38C5CFCF
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 14:20:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C04989A5C;
	Wed, 12 Aug 2026 14:20:47 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1EF10F026;
 Wed, 12 Aug 2026 14:20:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0725138898185297398=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_KUnit_test_for_VF_provision?=
 =?utf-8?q?ing_error_handling_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Aug 2026 14:20:45 -0000
Message-ID: <178654444582.43908.11998329765959888699@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260812124313.1377582-9-satyanarayana.k.v.p@intel.com>
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

--===============0725138898185297398==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: KUnit test for VF provisioning error handling (rev6)
URL   : https://patchwork.freedesktop.org/series/170198/
State : success

== Summary ==

CI Bug Log - changes from xe-5580-96ddbb14986632af742523e68f90d51c138c57f0_BAT -> xe-pw-170198v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  Additional (1): bat-nvls-1 
  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-170198v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-nvls-1:         NOTRUN -> [SKIP][1] ([Intel XE#8757])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-nvls-1:         NOTRUN -> [SKIP][2] ([Intel XE#8759])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@kms_dsc@dsc-basic.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-nvls-1:         NOTRUN -> [SKIP][3] ([Intel XE#8744]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_balancer@twice-virtual-userptr-invalidate:
    - bat-nvls-1:         NOTRUN -> [SKIP][4] ([Intel XE#8741]) +17 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - bat-nvls-1:         NOTRUN -> [SKIP][5] ([Intel XE#8377]) +13 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-nvls-1:         NOTRUN -> [SKIP][6] ([Intel XE#8746])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@vram:
    - bat-nvls-1:         NOTRUN -> [SKIP][7] ([Intel XE#8747])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-nvls-1:         NOTRUN -> [SKIP][8] ([Intel XE#8748])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-nvls-1:         NOTRUN -> [SKIP][9] ([Intel XE#8743])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-nvls-1:         NOTRUN -> [SKIP][10] ([Intel XE#8745])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#8377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377
  [Intel XE#8741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741
  [Intel XE#8743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743
  [Intel XE#8744]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744
  [Intel XE#8745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745
  [Intel XE#8746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746
  [Intel XE#8747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747
  [Intel XE#8748]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748
  [Intel XE#8757]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757
  [Intel XE#8759]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759


Build changes
-------------

  * Linux: xe-5580-96ddbb14986632af742523e68f90d51c138c57f0 -> xe-pw-170198v6

  IGT_9052: 9052
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0
  xe-pw-170198v6: 170198v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/index.html

--===============0725138898185297398==
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
<tr><td><b>Series:</b></td><td>KUnit test for VF provisioning error handling (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170198/">https://patchwork.freedesktop.org/series/170198/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5580-96ddbb14986632af742523e68f90d51c138c57f0_BAT -&gt; xe-pw-170198v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>Additional (1): bat-nvls-1 <br />
  Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170198v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8757">Intel XE#8757</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8759">Intel XE#8759</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8744">Intel XE#8744</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-invalidate:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_exec_balancer@twice-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8741">Intel XE#8741</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8377">Intel XE#8377</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8746">Intel XE#8746</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8747">Intel XE#8747</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8748">Intel XE#8748</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8743">Intel XE#8743</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170198v6/bat-nvls-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8745">Intel XE#8745</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5580-96ddbb14986632af742523e68f90d51c138c57f0 -&gt; xe-pw-170198v6</li>
</ul>
<p>IGT_9052: 9052<br />
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0<br />
  xe-pw-170198v6: 170198v6</p>

</body>
</html>

--===============0725138898185297398==--
