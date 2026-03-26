Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA15910A62C1
	for <intel-xe@archiver.kernel.org>; Thu, 26 Mar 2026 12:51:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB4F10E165;
	Thu, 26 Mar 2026 12:51:57 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98B3E10E165;
 Thu, 26 Mar 2026 12:51:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6204637005823998045=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Make_casf_updates_atomic_an?=
 =?utf-8?q?d_dsb_ready_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Mar 2026 12:51:55 -0000
Message-ID: <177452951558.401413.5655782477425970359@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326120029.3409676-1-nemesa.garg@intel.com>
In-Reply-To: <20260326120029.3409676-1-nemesa.garg@intel.com>
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

--===============6204637005823998045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make casf updates atomic and dsb ready (rev3)
URL   : https://patchwork.freedesktop.org/series/158668/
State : failure

== Summary ==

CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_BAT -> xe-pw-158668v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158668v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158668v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158668v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_waitfence@abstime:
    - bat-ptl-2:          [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-ptl-2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-ptl-2/igt@xe_waitfence@abstime.html

  
Known issues
------------

  Here are the changes found in xe-pw-158668v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#7483])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][5] -> [TIMEOUT][6] ([Intel XE#6506])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6519])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10] ([Intel XE#6520])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][11] ([Intel XE#7483]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * IGT: IGT_8833 -> IGT_8834
  * Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -> xe-pw-158668v3

  IGT_8833: 8833
  IGT_8834: 8834
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf
  xe-pw-158668v3: 158668v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html

--===============6204637005823998045==
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
<tr><td><b>Series:</b></td><td>Make casf updates atomic and dsb ready (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158668/">https://patchwork.freedesktop.org/series/158668/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf_BAT -&gt; xe-pw-158668v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158668v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158668v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158668v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-ptl-2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-ptl-2/igt@xe_waitfence@abstime.html">TIMEOUT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158668v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158668v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8833 -&gt; IGT_8834</li>
<li>Linux: xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf -&gt; xe-pw-158668v3</li>
</ul>
<p>IGT_8833: 8833<br />
  IGT_8834: 8834<br />
  xe-4793-2ccc868c40a9048ecf287b7bb002d73b5d25c7bf: 2ccc868c40a9048ecf287b7bb002d73b5d25c7bf<br />
  xe-pw-158668v3: 158668v3</p>

</body>
</html>

--===============6204637005823998045==--
