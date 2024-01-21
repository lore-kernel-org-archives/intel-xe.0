Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38339C47422
	for <intel-xe@archiver.kernel.org>; Sun, 21 Jan 2024 09:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D03C910E0F7;
	Sun, 21 Jan 2024 09:42:43 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57F7A10E025;
 Sun, 21 Jan 2024 09:42:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8412973766833695950=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe/irq=3A_allocate_all_possi?=
 =?utf-8?q?ble_msix_interrupts_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Sun, 21 Jan 2024 09:42:42 -0000
Message-ID: <170583016235.629196.8541042322535244776@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240121090214.2072923-1-dliberman@habana.ai>
In-Reply-To: <20240121090214.2072923-1-dliberman@habana.ai>
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

--===============8412973766833695950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/irq: allocate all possible msix interrupts (rev2)
URL   : https://patchwork.freedesktop.org/series/128832/
State : failure

== Summary ==

CI Bug Log - changes from xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a_BAT -> xe-pw-128832v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-128832v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-128832v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-128832v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_compute_mode@twice-userptr:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html

  


Build changes
-------------

  * Linux: xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a -> xe-pw-128832v2

  IGT_7683: 7683
  xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a: b239ffd479309ebbf0bd530ef632c8ef3ee78d7a
  xe-pw-128832v2: 128832v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v2/index.html

--===============8412973766833695950==
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
<tr><td><b>Series:</b></td><td>drm/xe/irq: allocate all possible msix interrupts (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128832/">https://patchwork.freedesktop.org/series/128832/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a_BAT -&gt; xe-pw-128832v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-128832v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-128832v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-128832v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v2/bat-adlp-7/igt@xe_exec_compute_mode@twice-userptr.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a -&gt; xe-pw-128832v2</li>
</ul>
<p>IGT_7683: 7683<br />
  xe-656-b239ffd479309ebbf0bd530ef632c8ef3ee78d7a: b239ffd479309ebbf0bd530ef632c8ef3ee78d7a<br />
  xe-pw-128832v2: 128832v2</p>

</body>
</html>

--===============8412973766833695950==--
