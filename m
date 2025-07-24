Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBBCC83F1A
	for <intel-xe@archiver.kernel.org>; Thu, 24 Jul 2025 12:51:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8406110E271;
	Thu, 24 Jul 2025 12:51:21 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8B4C10E25E;
 Thu, 24 Jul 2025 12:51:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3153467570041444863=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_adl_auxcss_ci_run?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 24 Jul 2025 12:51:19 -0000
Message-ID: <175336147974.186619.14456603192766505721@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250724120405.72946-1-tvrtko.ursulin@igalia.com>
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

--===============3153467570041444863==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: adl auxcss ci run
URL   : https://patchwork.freedesktop.org/series/152058/
State : failure

== Summary ==

CI Bug Log - changes from xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0_BAT -> xe-pw-152058v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152058v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152058v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-adlp-vm bat-lnl-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152058v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-152058v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +3 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0 -> xe-pw-152058v1

  IGT_8475: 1ddc997191d8aa008b49b5a4c47cf295c9a3c4f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0: e95f7906632d9bacee7d6f47884f856632393fa0
  xe-pw-152058v1: 152058v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/index.html

--===============3153467570041444863==
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
<tr><td><b>Series:</b></td><td>adl auxcss ci run</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152058/">https://patchwork.freedesktop.org/series/152058/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0_BAT -&gt; xe-pw-152058v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152058v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-152058v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-adlp-vm bat-lnl-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-152058v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152058v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152058v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0 -&gt; xe-pw-152058v1</li>
</ul>
<p>IGT_8475: 1ddc997191d8aa008b49b5a4c47cf295c9a3c4f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3468-e95f7906632d9bacee7d6f47884f856632393fa0: e95f7906632d9bacee7d6f47884f856632393fa0<br />
  xe-pw-152058v1: 152058v1</p>

</body>
</html>

--===============3153467570041444863==--
