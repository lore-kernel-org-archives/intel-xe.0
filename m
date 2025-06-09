Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7906EC5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 20:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2478010E21A;
	Mon,  9 Jun 2025 20:01:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FD310E21A;
 Mon,  9 Jun 2025 20:01:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2539395702664098042=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/flipq=3A_Rough_fli?=
 =?utf-8?q?p_queue_implementation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Jun 2025 20:01:18 -0000
Message-ID: <174949927807.61916.16925736358545896071@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20250609141046.6244-1-ville.syrjala@linux.intel.com>
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

--===============2539395702664098042==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/flipq: Rough flip queue implementation (rev6)
URL   : https://patchwork.freedesktop.org/series/149109/
State : failure

== Summary ==

CI Bug Log - changes from xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c_BAT -> xe-pw-149109v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149109v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149109v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149109v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-lnl-1:          [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-149109v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c -> xe-pw-149109v6

  IGT_8401: 8401
  xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c: 46f6f255a87a1680220c72a07e3ef9f12309527c
  xe-pw-149109v6: 149109v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/index.html

--===============2539395702664098042==
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
<tr><td><b>Series:</b></td><td>drm/i915/flipq: Rough flip queue implementation (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149109/">https://patchwork.freedesktop.org/series/149109/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c_BAT -&gt; xe-pw-149109v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149109v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149109v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149109v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149109v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149109v6/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c -&gt; xe-pw-149109v6</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3224-46f6f255a87a1680220c72a07e3ef9f12309527c: 46f6f255a87a1680220c72a07e3ef9f12309527c<br />
  xe-pw-149109v6: 149109v6</p>

</body>
</html>

--===============2539395702664098042==--
