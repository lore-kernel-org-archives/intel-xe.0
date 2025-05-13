Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52DEFC3ABC3
	for <intel-xe@archiver.kernel.org>; Tue, 13 May 2025 11:00:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31BF10E375;
	Tue, 13 May 2025 11:00:18 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5073E10E1F0;
 Tue, 13 May 2025 11:00:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0515928141002169274=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Reduce_DPT_table_?=
 =?utf-8?q?alignment_as_in_i915_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 13 May 2025 11:00:18 -0000
Message-ID: <174713401827.74733.1546147576257873798@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
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

--===============0515928141002169274==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reduce DPT table alignment as in i915 (rev2)
URL   : https://patchwork.freedesktop.org/series/148868/
State : success

== Summary ==

CI Bug Log - changes from xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f_BAT -> xe-pw-148868v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-148868v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f -> xe-pw-148868v2

  IGT_8362: 8362
  xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f: f28b1630b0e26e108cf5e2d9379bfed92dc4113f
  xe-pw-148868v2: 148868v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/index.html

--===============0515928141002169274==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reduce DPT table alignment as in i915 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148868/">https://patchwork.freedesktop.org/series/148868/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f_BAT -&gt; xe-pw-148868v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148868v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f -&gt; xe-pw-148868v2</li>
</ul>
<p>IGT_8362: 8362<br />
  xe-3076-f28b1630b0e26e108cf5e2d9379bfed92dc4113f: f28b1630b0e26e108cf5e2d9379bfed92dc4113f<br />
  xe-pw-148868v2: 148868v2</p>

</body>
</html>

--===============0515928141002169274==--
