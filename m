Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A69C982C9
	for <intel-xe@archiver.kernel.org>; Wed, 16 Sep 2026 22:00:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B6BC10E335;
	Wed, 16 Sep 2026 22:00:37 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5932610E28A;
 Wed, 16 Sep 2026 22:00:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4284449153637532843=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Crescent_Island_PMT_support?=
 =?utf-8?q?_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Sep 2026 22:00:35 -0000
Message-ID: <178959603535.175180.17875466157756149149@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
In-Reply-To: <20260916201139.2374531-22-michael.j.ruhl@intel.com>
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

--===============4284449153637532843==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev11)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -> xe-pw-160717v11_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v11_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v11_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v11_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_query@multigpu-query-cs-cycles:
    - bat-bmg-3:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  
Known issues
------------

  Here are the changes found in xe-pw-160717v11_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [PASS][3] -> [FAIL][4] ([Intel XE#9103])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-wcl-2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/bat-wcl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -> xe-pw-160717v11

  IGT_9099: 9099
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5
  xe-pw-160717v11: 160717v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/index.html

--===============4284449153637532843==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5_BAT -&gt; xe-pw-160717v11_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v11_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160717v11_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160717v11_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_query@multigpu-query-cs-cycles:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v11_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v11/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5 -&gt; xe-pw-160717v11</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5759-bb38af66c2f21340a7c081afbb7ace249357fbb5: bb38af66c2f21340a7c081afbb7ace249357fbb5<br />
  xe-pw-160717v11: 160717v11</p>

</body>
</html>

--===============4284449153637532843==--
