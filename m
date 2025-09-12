Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C79DCA101F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Sep 2025 08:47:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F41A10EBC9;
	Fri, 12 Sep 2025 08:47:52 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EFF10EBC9;
 Fri, 12 Sep 2025 08:47:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3150030764115326924=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Fix_spelling_?=
 =?utf-8?q?mistake_=22sheduling=22_-=3E_=22scheduling=22?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Colin Ian King" <colin.i.king@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 12 Sep 2025 08:47:51 -0000
Message-ID: <175766687116.328926.4578117521295163698@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250912074330.1275279-1-colin.i.king@gmail.com>
In-Reply-To: <20250912074330.1275279-1-colin.i.king@gmail.com>
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

--===============3150030764115326924==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Fix spelling mistake "sheduling" -> "scheduling"
URL   : https://patchwork.freedesktop.org/series/154440/
State : success

== Summary ==

CI Bug Log - changes from xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c_BAT -> xe-pw-154440v1_BAT
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

  Here are the changes found in xe-pw-154440v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] ([Intel XE#5507]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-vm}:       [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c -> xe-pw-154440v1

  IGT_8536: 8536
  xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c: 6d209e86cb298782b5afa278b7b0fc73cb433b4c
  xe-pw-154440v1: 154440v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/index.html

--===============3150030764115326924==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Fix spelling mistake &quot;sheduling&quot; -&gt; &quot;scheduling&quot;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154440/">https://patchwork.freedesktop.org/series/154440/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c_BAT -&gt; xe-pw-154440v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154440v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-vm}:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154440v1/bat-ptl-vm/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c -&gt; xe-pw-154440v1</li>
</ul>
<p>IGT_8536: 8536<br />
  xe-3732-6d209e86cb298782b5afa278b7b0fc73cb433b4c: 6d209e86cb298782b5afa278b7b0fc73cb433b4c<br />
  xe-pw-154440v1: 154440v1</p>

</body>
</html>

--===============3150030764115326924==--
