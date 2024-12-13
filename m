Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6FA8E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 13:52:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134310F00E;
	Fri, 13 Dec 2024 13:52:47 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D540210F00E;
 Fri, 13 Dec 2024 13:52:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8236738139403373101=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_128b/132b_un?=
 =?utf-8?q?compressed_SST?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Dec 2024 13:52:45 -0000
Message-ID: <173409796586.2157499.1769549655943199874@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <cover.1734085515.git.jani.nikula@intel.com>
In-Reply-To: <cover.1734085515.git.jani.nikula@intel.com>
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

--===============8236738139403373101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: 128b/132b uncompressed SST
URL   : https://patchwork.freedesktop.org/series/142548/
State : success

== Summary ==

CI Bug Log - changes from xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_BAT -> xe-pw-142548v1_BAT
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

  Here are the changes found in xe-pw-142548v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][1] ([Intel XE#455]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#3517]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8154 -> IGT_8155
  * Linux: xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5 -> xe-pw-142548v1

  IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8155: f33cf6456706ad5d454a87a773104b4fca7d81e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5: 8f7b64e137723da601f3c07d0cda22566cf994d5
  xe-pw-142548v1: 142548v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/index.html

--===============8236738139403373101==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: 128b/132b uncompressed SST</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142548/">https://patchwork.freedesktop.org/series/142548/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5_BAT -&gt; xe-pw-142548v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142548v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142548v1/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8154 -&gt; IGT_8155</li>
<li>Linux: xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5 -&gt; xe-pw-142548v1</li>
</ul>
<p>IGT_8154: 8603734a61b57f766ee60f24e63d18f88232a3c6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8155: f33cf6456706ad5d454a87a773104b4fca7d81e3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2369-8f7b64e137723da601f3c07d0cda22566cf994d5: 8f7b64e137723da601f3c07d0cda22566cf994d5<br />
  xe-pw-142548v1: 142548v1</p>

</body>
</html>

--===============8236738139403373101==--
