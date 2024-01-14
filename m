Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF339C47077
	for <intel-xe@archiver.kernel.org>; Sun, 14 Jan 2024 15:55:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F1410E19C;
	Sun, 14 Jan 2024 15:55:18 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A49D10E16F;
 Sun, 14 Jan 2024 15:55:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9134502933022167030=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/guc=3A_Remove_usage_of_th?=
 =?utf-8?q?e_deprecated_ida=5Fsimple=5Fxx=28=29_API?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Christophe JAILLET" <christophe.jaillet@wanadoo.fr>
Date: Sun, 14 Jan 2024 15:55:17 -0000
Message-ID: <170524771710.386536.17947346801386989884@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <d6a9ec9dc426fca372eaa1423a83632bd743c5d9.1705244938.git.christophe.jaillet@wanadoo.fr>
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

--===============9134502933022167030==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API
URL   : https://patchwork.freedesktop.org/series/128758/
State : failure

== Summary ==

CI Bug Log - changes from xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065_BAT -> xe-pw-128758v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128758v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128758v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128758v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] +2 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
Known issues
------------

  Here are the changes found in xe-pw-128758v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#400] / [Intel XE#616]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([Intel XE#1161]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  
  [Intel XE#1161]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616


Build changes
-------------

  * Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -> xe-pw-128758v1

  IGT_7673: 7673
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065
  xe-pw-128758v1: 128758v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/index.html

--===============9134502933022167030==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Remove usage of the deprecated ida_simple_xx() API</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128758/">https://patchwork.freedesktop.org/series/128758/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065_BAT -&gt; xe-pw-128758v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128758v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128758v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128758v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128758v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128758v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1161">Intel XE#1161</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065 -&gt; xe-pw-128758v1</li>
</ul>
<p>IGT_7673: 7673<br />
  xe-629-3a1d727c0061b96ddf8e653130f94ab331e2f065: 3a1d727c0061b96ddf8e653130f94ab331e2f065<br />
  xe-pw-128758v1: 128758v1</p>

</body>
</html>

--===============9134502933022167030==--
