Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076DEC54E67
	for <intel-xe@archiver.kernel.org>; Wed, 27 Mar 2024 12:31:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A725D10FCF3;
	Wed, 27 Mar 2024 12:31:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95CC10FCF7;
 Wed, 27 Mar 2024 12:31:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5771938027801291405=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Introduce_GuC_context_ID_Manager?=
 =?utf-8?q?_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 27 Mar 2024 12:31:16 -0000
Message-ID: <171154267689.1055708.8880983133888540943@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240313221112.1089-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240313221112.1089-1-michal.wajdeczko@intel.com>
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

--===============5771938027801291405==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce GuC context ID Manager (rev3)
URL   : https://patchwork.freedesktop.org/series/128445/
State : success

== Summary ==

CI Bug Log - changes from xe-999-5988ee0343405246eed9e2c1524984e9259e86ca_BAT -> xe-pw-128445v3_BAT
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

  Here are the changes found in xe-pw-128445v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-cm-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][1] ([Intel XE#1027] / [Intel XE#804])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-mixed-threads-small:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][2] ([Intel XE#804])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html

  
#### Warnings ####

  * igt@xe_evict@evict-beng-small:
    - bat-dg2-oem2:       [INCOMPLETE][3] ([Intel XE#804]) -> [DMESG-WARN][4] ([Intel XE#1088] / [Intel XE#1373])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-999-5988ee0343405246eed9e2c1524984e9259e86ca/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][5] ([Intel XE#1044]) -> [INCOMPLETE][6] ([Intel XE#1044] / [Intel XE#1376])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-999-5988ee0343405246eed9e2c1524984e9259e86ca/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1027]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#804]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/804


Build changes
-------------

  * Linux: xe-999-5988ee0343405246eed9e2c1524984e9259e86ca -> xe-pw-128445v3

  IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-999-5988ee0343405246eed9e2c1524984e9259e86ca: 5988ee0343405246eed9e2c1524984e9259e86ca
  xe-pw-128445v3: 128445v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/index.html

--===============5771938027801291405==
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
<tr><td><b>Series:</b></td><td>Introduce GuC context ID Manager (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128445/">https://patchwork.freedesktop.org/series/128445/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-999-5988ee0343405246eed9e2c1524984e9259e86ca_BAT -&gt; xe-pw-128445v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128445v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-cm-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1027">Intel XE#1027</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-mixed-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-999-5988ee0343405246eed9e2c1524984e9259e86ca/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/804">Intel XE#804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-dg2-oem2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1373">Intel XE#1373</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-999-5988ee0343405246eed9e2c1524984e9259e86ca/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128445v3/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-999-5988ee0343405246eed9e2c1524984e9259e86ca -&gt; xe-pw-128445v3</li>
</ul>
<p>IGT_7786: 1e4a3cd0a4bb3419fb70ed3e01259485b056dcfd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-999-5988ee0343405246eed9e2c1524984e9259e86ca: 5988ee0343405246eed9e2c1524984e9259e86ca<br />
  xe-pw-128445v3: 128445v3</p>

</body>
</html>

--===============5771938027801291405==--
