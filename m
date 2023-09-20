Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9222CE79DE
	for <intel-xe@archiver.kernel.org>; Wed, 20 Sep 2023 14:48:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73E3B10E4FF;
	Wed, 20 Sep 2023 14:48:35 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A06910E4FF;
 Wed, 20 Sep 2023 14:48:34 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4F06DAADD5;
 Wed, 20 Sep 2023 14:48:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6560388071443403851=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Date: Wed, 20 Sep 2023 14:48:34 -0000
Message-ID: <169522131431.6466.7590369488668464200@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20230920140339.28322-1-ville.syrjala@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5B1/3=5D_drm/i915=3A_Use_vblank_worker_to_unpin_ol?=
 =?utf-8?q?d_legacy_cursor_fb_safely?=
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

--===============6560388071443403851==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/i915: Use vblank worker to unpin old legacy cursor fb safely
URL   : https://patchwork.freedesktop.org/series/123983/
State : failure

== Summary ==

CI Bug Log - changes from xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe_BAT -> xe-pw-123983v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123983v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123983v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123983v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-dg2-oem2:       [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
    - bat-adlp-7:         [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  


Build changes
-------------

  * Linux: xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe -> xe-pw-123983v1

  IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe: 5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe
  xe-pw-123983v1: 123983v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/index.html

--===============6560388071443403851==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/i915: Use vblank worker to unpin old legacy cursor fb safely</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123983/">https://patchwork.freedesktop.org/series/123983/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe_BAT -&gt; xe-pw-123983v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123983v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123983v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123983v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">INCOMPLETE</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123983v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">INCOMPLETE</a></p>
</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe -&gt; xe-pw-123983v1</li>
</ul>
<p>IGT_7493: 2517e42d612e0c1ca096acf8b5f6177f7ef4bce7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-385-5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe: 5cc044f8d21ebfda09db2bd1fe995dfbfd6e97fe<br />
  xe-pw-123983v1: 123983v1</p>

</body>
</html>

--===============6560388071443403851==--
