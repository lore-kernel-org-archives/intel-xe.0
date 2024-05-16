Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46C6C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 08:31:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7748C10E29E;
	Thu, 16 May 2024 08:31:09 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBD310E29E;
 Thu, 16 May 2024 08:31:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1461458457325017424=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_DO_NOT_MERGE=3A_drm/xe/display?=
 =?utf-8?q?=3A_Disable_PSR_by_default?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 08:31:08 -0000
Message-ID: <171584826850.2120342.12851340152591846944@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516074636.1514540-1-jouni.hogander@intel.com>
In-Reply-To: <20240516074636.1514540-1-jouni.hogander@intel.com>
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

--===============1461458457325017424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DO NOT MERGE: drm/xe/display: Disable PSR by default
URL   : https://patchwork.freedesktop.org/series/133679/
State : success

== Summary ==

CI Bug Log - changes from xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3_BAT -> xe-pw-133679v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133679v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - {bat-lnl-1}:        [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-133679v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +5 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][5] ([Intel XE#1861]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_7857 -> IGT_7858
  * Linux: xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 -> xe-pw-133679v1

  IGT_7857: 02dbc3f8f4f3e02dd09a5af505900ff933b9adf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3: 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3
  xe-pw-133679v1: 133679v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/index.html

--===============1461458457325017424==
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
<tr><td><b>Series:</b></td><td>DO NOT MERGE: drm/xe/display: Disable PSR by default</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133679/">https://patchwork.freedesktop.org/series/133679/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3_BAT -&gt; xe-pw-133679v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133679v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_psr@psr-primary-page-flip@edp-1:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-lnl-1/igt@kms_psr@psr-primary-page-flip@edp-1.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133679v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133679v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7857 -&gt; IGT_7858</li>
<li>Linux: xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3 -&gt; xe-pw-133679v1</li>
</ul>
<p>IGT_7857: 02dbc3f8f4f3e02dd09a5af505900ff933b9adf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1298-220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3: 220fb645d6cd4ce4155b5ccfdf52b35d6a7942c3<br />
  xe-pw-133679v1: 133679v1</p>

</body>
</html>

--===============1461458457325017424==--
