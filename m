Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C67C4332F
	for <intel-xe@archiver.kernel.org>; Thu, 14 Dec 2023 20:27:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC50D10E237;
	Thu, 14 Dec 2023 20:27:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD48010E237;
 Thu, 14 Dec 2023 20:27:47 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 996C7AADF2;
 Thu, 14 Dec 2023 20:27:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1335500069881500500=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Trivial_register_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Date: Thu, 14 Dec 2023 20:27:47 -0000
Message-ID: <170258566759.19958.18231072789493334996@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231214184659.2249559-10-matthew.d.roper@intel.com>
In-Reply-To: <20231214184659.2249559-10-matthew.d.roper@intel.com>
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

--===============1335500069881500500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Trivial register cleanups
URL   : https://patchwork.freedesktop.org/series/127829/
State : success

== Summary ==

CI Bug Log - changes from xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c_BAT -> xe-pw-127829v1_BAT
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

  Here are the changes found in xe-pw-127829v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#906]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html

  
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906


Build changes
-------------

  * Linux: xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c -> xe-pw-127829v1

  IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c: e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c
  xe-pw-127829v1: 127829v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/index.html

--===============1335500069881500500==
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
<tr><td><b>Series:</b></td><td>Trivial register cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127829/">https://patchwork.freedesktop.org/series/127829/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c_BAT -&gt; xe-pw-127829v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127829v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127829v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-a-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c -&gt; xe-pw-127829v1</li>
</ul>
<p>IGT_7643: ced22f8bf4263ff395dc852c86b682e62a7a1c1b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-578-e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c: e9f8fa579c5f7a0b1a08ffeeaa03fe7ef4981b3c<br />
  xe-pw-127829v1: 127829v1</p>

</body>
</html>

--===============1335500069881500500==--
