Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC58AE6817A
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 12:36:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7821C10E4D1;
	Tue, 17 Feb 2026 12:36:10 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48D0910E23B;
 Tue, 17 Feb 2026 12:36:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3122826072815335272=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_series_starting_with_=5Bv4?=
 =?utf-8?q?=2C1/2=5D_drm/buddy=3A_Improve_offset-aligned_allocation_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Feb 2026 12:36:09 -0000
Message-ID: <177133176927.258851.12101241731649868920@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
In-Reply-To: <20260217113900.10675-1-Arunpravin.PaneerSelvam@amd.com>
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

--===============3122826072815335272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v4,1/2] drm/buddy: Improve offset-aligned allocation handling
URL   : https://patchwork.freedesktop.org/series/161705/
State : failure

== Summary ==

CI Bug Log - changes from xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366_BAT -> xe-pw-161705v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161705v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161705v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161705v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-wcl-1:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
#### Warnings ####

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - bat-wcl-2:          [SKIP][3] ([Intel XE#7238]) -> [SKIP][4] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
    - bat-wcl-1:          [SKIP][5] ([Intel XE#7238]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  
Known issues
------------

  Here are the changes found in xe-pw-161705v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6519])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#7238]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238


Build changes
-------------

  * IGT: IGT_8754 -> IGT_8755
  * Linux: xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366 -> xe-pw-161705v1

  IGT_8754: 8754
  IGT_8755: 8755
  xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366: 32b409741f18c54cd98f942836d1f7bd9bc15366
  xe-pw-161705v1: 161705v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/index.html

--===============3122826072815335272==
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
<tr><td><b>Series:</b></td><td>series starting with [v4,1/2] drm/buddy: Improve offset-aligned allocation handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161705/">https://patchwork.freedesktop.org/series/161705/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366_BAT -&gt; xe-pw-161705v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161705v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161705v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161705v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7238">Intel XE#7238</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-wcl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161705v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161705v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8754 -&gt; IGT_8755</li>
<li>Linux: xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366 -&gt; xe-pw-161705v1</li>
</ul>
<p>IGT_8754: 8754<br />
  IGT_8755: 8755<br />
  xe-4565-32b409741f18c54cd98f942836d1f7bd9bc15366: 32b409741f18c54cd98f942836d1f7bd9bc15366<br />
  xe-pw-161705v1: 161705v1</p>

</body>
</html>

--===============3122826072815335272==--
