Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA9EC79FAA
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 07:04:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3841410EF77;
	Wed,  9 Sep 2026 07:04:56 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AD010EF77;
 Wed,  9 Sep 2026 07:04:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6398502692678668680=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/xe=5Fmigrate=3A_Fix_?=
 =?utf-8?q?memory_corruption_with_unaligned_dst_in_MEM=5FCOPY_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jan Maslak" <jan.maslak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 07:04:54 -0000
Message-ID: <178893749479.139265.6422616391370329559@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260909061845.4048047-1-jan.maslak@intel.com>
In-Reply-To: <20260909061845.4048047-1-jan.maslak@intel.com>
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

--===============6398502692678668680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY (rev3)
URL   : https://patchwork.freedesktop.org/series/167675/
State : failure

== Summary ==

CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT -> xe-pw-167675v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-167675v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-167675v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 12)
------------------------------

  Missing    (2): bat-nvls-2 bat-lnl-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-167675v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit (NEW):
    - bat-adlp-7:         NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-2:          NOTRUN -> [SKIP][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-nvls-1:         NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-2:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-wcl-1:          NOTRUN -> [SKIP][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-ptl-1:          NOTRUN -> [SKIP][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html
    - bat-lnl-1:          NOTRUN -> [SKIP][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html

  
New tests
---------

  New tests have been introduced between xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT and xe-pw-167675v3_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:
    - Statuses : 4 pass(s) 7 skip(s)
    - Exec time: [0.04, 61.24] s

  



Build changes
-------------

  * IGT: IGT_9086 -> IGT_9087
  * Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -> xe-pw-167675v3

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9087: 9087
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada
  xe-pw-167675v3: 167675v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/index.html

--===============6398502692678668680==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_migrate: Fix memory corruption with unaligned dst in MEM_COPY (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167675/">https://patchwork.freedesktop.org/series/167675/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT -&gt; xe-pw-167675v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-167675v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-167675v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 12)</h2>
<p>Missing    (2): bat-nvls-2 bat-lnl-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-167675v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit (NEW):<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-adlp-7/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-wcl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-nvls-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-ptl-2/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-wcl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-ptl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167675v3/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada_BAT and xe-pw-167675v3_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_migrate@xe_migrate_access_memory_kunit:<ul>
<li>Statuses : 4 pass(s) 7 skip(s)</li>
<li>Exec time: [0.04, 61.24] s</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9086 -&gt; IGT_9087</li>
<li>Linux: xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada -&gt; xe-pw-167675v3</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9087: 9087<br />
  xe-5710-dd822035c9dcd89e47cbfa75da6f3119617fbada: dd822035c9dcd89e47cbfa75da6f3119617fbada<br />
  xe-pw-167675v3: 167675v3</p>

</body>
</html>

--===============6398502692678668680==--
