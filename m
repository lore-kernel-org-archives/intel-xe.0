Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9965E9E31E
	for <intel-xe@archiver.kernel.org>; Wed, 11 Feb 2026 14:52:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65EE810E62D;
	Wed, 11 Feb 2026 14:52:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4047710E5FC;
 Wed, 11 Feb 2026 14:52:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4662421785274760403=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/i915/display=3A_Clarify_target_pipe_bpp_variable_name_in_?=
 =?utf-8?q?compute=5Fsink=5Fpipe=5Fbpp=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Feb 2026 14:52:52 -0000
Message-ID: <177082157224.246446.9728762206522099053@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260211115811.508496-1-imre.deak@intel.com>
In-Reply-To: <20260211115811.508496-1-imre.deak@intel.com>
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

--===============4662421785274760403==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/i915/display: Clarify target pipe bpp variable name in compute_sink_pipe_bpp()
URL   : https://patchwork.freedesktop.org/series/161496/
State : success

== Summary ==

CI Bug Log - changes from xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_BAT -> xe-pw-161496v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 10)
------------------------------

  Additional (1): bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-161496v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:
    - bat-bmg-3:          NOTRUN -> [SKIP][1] ([Intel XE#6566]) +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-ptl-1:          [FAIL][2] -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/bat-ptl-1/igt@xe_waitfence@reltime.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/bat-ptl-1/igt@xe_waitfence@reltime.html

  
  [Intel XE#6566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566


Build changes
-------------

  * IGT: IGT_8749 -> IGT_8750
  * Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 -> xe-pw-161496v1

  IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8750: 8750
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37
  xe-pw-161496v1: 161496v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/index.html

--===============4662421785274760403==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/i915/display: Clarify target pipe bpp variable name in compute_sink_pipe_bpp()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161496/">https://patchwork.freedesktop.org/series/161496/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37_BAT -&gt; xe-pw-161496v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161496v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p:<ul>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/bat-bmg-3/igt@xe_peer2peer@read@read-gpua-vram01-gpub-vram01-p2p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6566">Intel XE#6566</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37/bat-ptl-1/igt@xe_waitfence@reltime.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161496v1/bat-ptl-1/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8749 -&gt; IGT_8750</li>
<li>Linux: xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37 -&gt; xe-pw-161496v1</li>
</ul>
<p>IGT_8749: 195f101f25a7984686f36f340aa88d44a1716ec6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8750: 8750<br />
  xe-4544-2938ce73d01357a5816ed7dbd041154b58635a37: 2938ce73d01357a5816ed7dbd041154b58635a37<br />
  xe-pw-161496v1: 161496v1</p>

</body>
</html>

--===============4662421785274760403==--
