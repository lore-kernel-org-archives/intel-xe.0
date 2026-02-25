Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 264A5FD45E2
	for <intel-xe@archiver.kernel.org>; Wed, 25 Feb 2026 19:39:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD93210E307;
	Wed, 25 Feb 2026 19:39:44 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE32010E307;
 Wed, 25 Feb 2026 19:39:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5543543682364371183=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/=7Bi915=2Cxe=7D=3A_refa?=
 =?utf-8?q?ctor_register_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Feb 2026 19:39:42 -0000
Message-ID: <177204838295.286940.2105681322762106083@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772042022.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772042022.git.jani.nikula@intel.com>
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

--===============5543543682364371183==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: refactor register helpers
URL   : https://patchwork.freedesktop.org/series/162163/
State : failure

== Summary ==

CI Bug Log - changes from xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86_BAT -> xe-pw-162163v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162163v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162163v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162163v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
Known issues
------------

  Here are the changes found in xe-pw-162163v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  


Build changes
-------------

  * Linux: xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86 -> xe-pw-162163v1

  IGT_8771: 8771
  xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86: 3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86
  xe-pw-162163v1: 162163v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/index.html

--===============5543543682364371183==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: refactor register helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162163/">https://patchwork.freedesktop.org/series/162163/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86_BAT -&gt; xe-pw-162163v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162163v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162163v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162163v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162163v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162163v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86 -&gt; xe-pw-162163v1</li>
</ul>
<p>IGT_8771: 8771<br />
  xe-4617-3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86: 3b1923ab37ecd72e1405c7b8d3b1d9e1f3e59f86<br />
  xe-pw-162163v1: 162163v1</p>

</body>
</html>

--===============5543543682364371183==--
