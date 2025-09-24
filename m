Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26CCDCAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 24 Sep 2025 03:47:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC19910E096;
	Wed, 24 Sep 2025 03:47:37 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09AB410E096;
 Wed, 24 Sep 2025 03:47:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5532107684236785498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cdclk=3A_Decouple_?=
 =?utf-8?q?CDCLK_from_state-=3Emodeset?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Sep 2025 03:47:37 -0000
Message-ID: <175868565703.360601.10579879882630053028@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250923171943.7319-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250923171943.7319-1-ville.syrjala@linux.intel.com>
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

--===============5532107684236785498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cdclk: Decouple CDCLK from state->modeset
URL   : https://patchwork.freedesktop.org/series/154922/
State : success

== Summary ==

CI Bug Log - changes from xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a_BAT -> xe-pw-154922v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-154922v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][3] ([Intel XE#5507]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
    - bat-bmg-1:          [FAIL][5] ([Intel XE#5507]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507


Build changes
-------------

  * Linux: xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a -> xe-pw-154922v1

  IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a: 684be60267d323ab44ef75a0531d9a2af49ff51a
  xe-pw-154922v1: 154922v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/index.html

--===============5532107684236785498==
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
<tr><td><b>Series:</b></td><td>drm/i915/cdclk: Decouple CDCLK from state-&gt;modeset</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154922/">https://patchwork.freedesktop.org/series/154922/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a_BAT -&gt; xe-pw-154922v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154922v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154922v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a -&gt; xe-pw-154922v1</li>
</ul>
<p>IGT_8550: 4f8c7886ad02e116804ec08714f17bce1755c6e4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3818-684be60267d323ab44ef75a0531d9a2af49ff51a: 684be60267d323ab44ef75a0531d9a2af49ff51a<br />
  xe-pw-154922v1: 154922v1</p>

</body>
</html>

--===============5532107684236785498==--
