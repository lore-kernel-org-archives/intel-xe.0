Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3705C3DA59
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 16:25:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5218D10E069;
	Mon, 22 Jul 2024 16:25:55 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F47610E199;
 Mon, 22 Jul 2024 16:25:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4919044674749342722=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/dp=3A_Make_read-only_ar?=
 =?utf-8?q?ray_bw=5Fgbps_static_const?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 16:25:53 -0000
Message-ID: <172166555325.327756.3070204368470149481@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722153937.574819-1-colin.i.king@gmail.com>
In-Reply-To: <20240722153937.574819-1-colin.i.king@gmail.com>
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

--===============4919044674749342722==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Make read-only array bw_gbps static const
URL   : https://patchwork.freedesktop.org/series/136344/
State : success

== Summary ==

CI Bug Log - changes from xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f_BAT -> xe-pw-136344v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136344v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-lnl-1:          [FAIL][1] ([Intel XE#886]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#324]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - bat-adlp-7:         [SKIP][5] ([Intel XE#455]) -> [SKIP][6] ([Intel XE#2229] / [Intel XE#455])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f -> xe-pw-136344v1

  IGT_7933: 7933
  xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f: 15e3fe299f335c801371e6b7c5c8e6d469af843f
  xe-pw-136344v1: 136344v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/index.html

--===============4919044674749342722==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Make read-only array bw_gbps static const</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136344/">https://patchwork.freedesktop.org/series/136344/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f_BAT -&gt; xe-pw-136344v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136344v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136344v1/bat-adlp-7/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f -&gt; xe-pw-136344v1</li>
</ul>
<p>IGT_7933: 7933<br />
  xe-1642-15e3fe299f335c801371e6b7c5c8e6d469af843f: 15e3fe299f335c801371e6b7c5c8e6d469af843f<br />
  xe-pw-136344v1: 136344v1</p>

</body>
</html>

--===============4919044674749342722==--
