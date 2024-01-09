Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A935C46CD2
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jan 2024 13:46:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7A010E079;
	Tue,  9 Jan 2024 13:46:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96FC110E079;
 Tue,  9 Jan 2024 13:46:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2743023704128325047=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Silence_a_number_of_sp?=
 =?utf-8?q?arse_warnings?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 09 Jan 2024 13:46:19 -0000
Message-ID: <170480797961.215663.5602074048111071300@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240109112405.108136-1-thomas.hellstrom@linux.intel.com>
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

--===============2743023704128325047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Silence a number of sparse warnings
URL   : https://patchwork.freedesktop.org/series/128368/
State : success

== Summary ==

CI Bug Log - changes from xe-607-eacbcdb537a2774959d012206aba22848fdade26_BAT -> xe-pw-128368v1_BAT
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

  Here are the changes found in xe-pw-128368v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +2 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@xe_create@create-execqueues-noleak:
    - bat-atsm-2:         [PASS][5] -> [FAIL][6] ([Intel XE#1099])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [FAIL][7] ([Intel XE#480]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][9] ([Intel XE#1033]) -> [DMESG-WARN][10] ([Intel XE#1033])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480


Build changes
-------------

  * Linux: xe-607-eacbcdb537a2774959d012206aba22848fdade26 -> xe-pw-128368v1

  IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26
  xe-pw-128368v1: 128368v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/index.html

--===============2743023704128325047==
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
<tr><td><b>Series:</b></td><td>drm/xe: Silence a number of sparse warnings</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128368/">https://patchwork.freedesktop.org/series/128368/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-607-eacbcdb537a2774959d012206aba22848fdade26_BAT -&gt; xe-pw-128368v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128368v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-execqueues-noleak:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-atsm-2/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1099">Intel XE#1099</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-607-eacbcdb537a2774959d012206aba22848fdade26/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128368v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-607-eacbcdb537a2774959d012206aba22848fdade26 -&gt; xe-pw-128368v1</li>
</ul>
<p>IGT_7663: b5eca7b97430309e320874594feaeaa8e770e25e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-607-eacbcdb537a2774959d012206aba22848fdade26: eacbcdb537a2774959d012206aba22848fdade26<br />
  xe-pw-128368v1: 128368v1</p>

</body>
</html>

--===============2743023704128325047==--
