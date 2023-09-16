Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D36CD37B5
	for <intel-xe@archiver.kernel.org>; Sat, 16 Sep 2023 07:38:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1528B10E0CA;
	Sat, 16 Sep 2023 07:38:17 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8DE1D10E0CA;
 Sat, 16 Sep 2023 07:38:15 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7FCA0AADEB;
 Sat, 16 Sep 2023 07:38:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2307243013355093445=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Sat, 16 Sep 2023 07:38:15 -0000
Message-ID: <169484989548.10846.4197949011070011859@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230915172606.14436-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230915172606.14436-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A?=
 =?utf-8?q?_Reinstate_pipelined_fence_enable=5Fsignaling_=28rev4=29?=
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

--===============2307243013355093445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reinstate pipelined fence enable_signaling (rev4)
URL   : https://patchwork.freedesktop.org/series/123669/
State : success

== Summary ==

CI Bug Log - changes from xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d_BAT -> xe-pw-123669v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-123669v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms@a-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#558])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html

  * igt@kms_flip@basic-flip-vs-dpms@c-dp3:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#554]) +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@c-dp3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@c-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([Intel XE#480])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#554]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/554
  [Intel XE#558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/558


Build changes
-------------

  * IGT: IGT_7490 -> IGT_7491
  * Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -> xe-pw-123669v4

  IGT_7490: 7490
  IGT_7491: 7491
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d
  xe-pw-123669v4: 123669v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/index.html

--===============2307243013355093445==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reinstate pipelined fence enable_signaling (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123669/">https://patchwork.freedesktop.org/series/123669/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d_BAT -&gt; xe-pw-123669v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123669v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/558">Intel XE#558</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@c-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-dpms@c-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/554">Intel XE#554</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123669v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7490 -&gt; IGT_7491</li>
<li>Linux: xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d -&gt; xe-pw-123669v4</li>
</ul>
<p>IGT_7490: 7490<br />
  IGT_7491: 7491<br />
  xe-376-9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d: 9da40abcc0ccdf8fdfed4e21d76060bfcd35fe7d<br />
  xe-pw-123669v4: 123669v4</p>

</body>
</html>

--===============2307243013355093445==--
