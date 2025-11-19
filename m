Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD606CF58E1
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 20:16:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E21A10E0ED;
	Wed, 19 Nov 2025 20:16:37 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A7610E0ED;
 Wed, 19 Nov 2025 20:16:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9060095763334520450=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Test_GuC_v70?=
 =?utf-8?q?=2E54=2E0_for_BMG=2C_PTL_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Julia Filipchuk" <julia.filipchuk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 20:16:35 -0000
Message-ID: <176358339592.11426.3323047626226166373@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118235218.1788466-2-julia.filipchuk@intel.com>
In-Reply-To: <20251118235218.1788466-2-julia.filipchuk@intel.com>
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

--===============9060095763334520450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Test GuC v70.54.0 for BMG, PTL (rev2)
URL   : https://patchwork.freedesktop.org/series/157751/
State : success

== Summary ==

CI Bug Log - changes from xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215_BAT -> xe-pw-157751v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157751v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-2:          NOTRUN -> [SKIP][3] ([Intel XE#2434] / [Intel XE#2548])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-bmg-2:          NOTRUN -> [ABORT][4] ([Intel XE#1727] / [Intel XE#4760])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6519])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#4543]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [ABORT][9] ([Intel XE#1727] / [Intel XE#4760]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [FAIL][11] ([Intel XE#6520]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215 -> xe-pw-157751v2

  IGT_8633: 8633
  xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215: 6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215
  xe-pw-157751v2: 157751v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/index.html

--===============9060095763334520450==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Test GuC v70.54.0 for BMG, PTL (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157751/">https://patchwork.freedesktop.org/series/157751/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215_BAT -&gt; xe-pw-157751v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157751v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_hdmi_inject@inject-audio.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157751v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215 -&gt; xe-pw-157751v2</li>
</ul>
<p>IGT_8633: 8633<br />
  xe-4129-6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215: 6a4ec3ff5da38865d6f6cbdeab79b2f4fddba215<br />
  xe-pw-157751v2: 157751v2</p>

</body>
</html>

--===============9060095763334520450==--
