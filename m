Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D5FCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 18:52:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB7810EC30;
	Fri, 29 Aug 2025 18:52:06 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A2A10EC30;
 Fri, 29 Aug 2025 18:52:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0320686872916132600=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_improve_dma-resv_?=
 =?utf-8?q?handling_for_backup_object?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 18:52:05 -0000
Message-ID: <175649352546.285848.16116325149645871108@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829164715.720735-2-matthew.auld@intel.com>
In-Reply-To: <20250829164715.720735-2-matthew.auld@intel.com>
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

--===============0320686872916132600==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: improve dma-resv handling for backup object
URL   : https://patchwork.freedesktop.org/series/153724/
State : success

== Summary ==

CI Bug Log - changes from xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef_BAT -> xe-pw-153724v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153724v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [PASS][3] -> [FAIL][4] ([Intel XE#5507]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef -> xe-pw-153724v1

  IGT_8517: 8517
  xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef: f6aa4672016576ffe9de4380dff4788977a7dbef
  xe-pw-153724v1: 153724v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/index.html

--===============0320686872916132600==
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
<tr><td><b>Series:</b></td><td>drm/xe: improve dma-resv handling for backup object</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153724/">https://patchwork.freedesktop.org/series/153724/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef_BAT -&gt; xe-pw-153724v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153724v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2@render:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153724v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef -&gt; xe-pw-153724v1</li>
</ul>
<p>IGT_8517: 8517<br />
  xe-3640-f6aa4672016576ffe9de4380dff4788977a7dbef: f6aa4672016576ffe9de4380dff4788977a7dbef<br />
  xe-pw-153724v1: 153724v1</p>

</body>
</html>

--===============0320686872916132600==--
