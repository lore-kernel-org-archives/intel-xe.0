Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F24CCD1AB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 15:13:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED4510E7E8;
	Wed, 22 Oct 2025 15:13:37 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15F1110E7E7;
 Wed, 22 Oct 2025 15:13:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3752831765597208857=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm=3A_replace_drm=5Fprint?=
 =?utf-8?q?=2Eh_includes_from_headers_with_a_forward_declaration_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Oct 2025 15:13:37 -0000
Message-ID: <176114601707.42904.3583126129223174384@97596180aaec>
X-Patchwork-Hint: ignore
References: <cover.1761126446.git.jani.nikula@intel.com>
In-Reply-To: <cover.1761126446.git.jani.nikula@intel.com>
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

--===============3752831765597208857==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: replace drm_print.h includes from headers with a forward declaration (rev2)
URL   : https://patchwork.freedesktop.org/series/156268/
State : failure

== Summary ==

CI Bug Log - changes from xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700_BAT -> xe-pw-156268v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-156268v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-156268v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (11 -> 12)
------------------------------

  Additional (1): bat-bmg-3 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-156268v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * {igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p} (NEW):
    - bat-bmg-3:          NOTRUN -> [FAIL][1] +5 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
New tests
---------

  New tests have been introduced between xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700_BAT and xe-pw-156268v2_BAT:

### New IGT tests (4) ###

  * igt@xe_peer2peer@read@read-gpua-system-gpub-vram01-p2p:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:
    - Statuses : 1 pass(s)
    - Exec time: [0.24] s

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-vram01-p2p:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-156268v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_create@multigpu-create-massive-size:
    - bat-bmg-3:          NOTRUN -> [SKIP][2] ([Intel XE#2504])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@multigpu-basic-client:
    - bat-bmg-3:          NOTRUN -> [SKIP][3] ([Intel XE#4837]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837


Build changes
-------------

  * Linux: xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700 -> xe-pw-156268v2

  IGT_8594: 8594
  xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700: b3696aee36c443dbea93e1068b9c3c765bc8e700
  xe-pw-156268v2: 156268v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/index.html

--===============3752831765597208857==
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
<tr><td><b>Series:</b></td><td>drm: replace drm_print.h includes from headers with a forward declaration (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156268/">https://patchwork.freedesktop.org/series/156268/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700_BAT -&gt; xe-pw-156268v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-156268v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-156268v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (11 -&gt; 12)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-156268v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>{igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p} (NEW):<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700_BAT and xe-pw-156268v2_BAT:</p>
<h3>New IGT tests (4)</h3>
<ul>
<li>
<p>igt@xe_peer2peer@read@read-gpua-system-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-system-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.24] s</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-vram01-p2p:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156268v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client:</p>
<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156268v2/bat-bmg-3/igt@xe_eudebug@multigpu-basic-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700 -&gt; xe-pw-156268v2</li>
</ul>
<p>IGT_8594: 8594<br />
  xe-3964-b3696aee36c443dbea93e1068b9c3c765bc8e700: b3696aee36c443dbea93e1068b9c3c765bc8e700<br />
  xe-pw-156268v2: 156268v2</p>

</body>
</html>

--===============3752831765597208857==--
