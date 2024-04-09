Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BD6C67861
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 11:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C429E112CC9;
	Tue,  9 Apr 2024 11:37:37 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16149112537;
 Tue,  9 Apr 2024 11:37:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6891596745870122309=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe=3A_Assert_pat=2Eops_function_pointers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 11:37:35 -0000
Message-ID: <171266265508.1300821.14495176133800567671@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409105106.1067-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240409105106.1067-1-michal.wajdeczko@intel.com>
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

--===============6891596745870122309==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Assert pat.ops function pointers
URL   : https://patchwork.freedesktop.org/series/132205/
State : success

== Summary ==

CI Bug Log - changes from xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d_BAT -> xe-pw-132205v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132205v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:
    - {bat-lnl-1}:        [DMESG-WARN][1] ([Intel XE#1557]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html

  * igt@xe_evict@evict-threads-small:
    - bat-dg2-oem2:       [TIMEOUT][3] ([Intel XE#1259] / [Intel XE#1473]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1557


Build changes
-------------

  * Linux: xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d -> xe-pw-132205v1

  IGT_7802: 7802
  xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d: eea58bf00b72f3fd0abdf5fb144f988c23056b8d
  xe-pw-132205v1: 132205v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/index.html

--===============6891596745870122309==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Assert pat.ops function pointers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132205/">https://patchwork.freedesktop.org/series/132205/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d_BAT -&gt; xe-pw-132205v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132205v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1557">Intel XE#1557</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc-frame-sequence@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132205v1/bat-dg2-oem2/igt@xe_evict@evict-threads-small.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d -&gt; xe-pw-132205v1</li>
</ul>
<p>IGT_7802: 7802<br />
  xe-1059-eea58bf00b72f3fd0abdf5fb144f988c23056b8d: eea58bf00b72f3fd0abdf5fb144f988c23056b8d<br />
  xe-pw-132205v1: 132205v1</p>

</body>
</html>

--===============6891596745870122309==--
