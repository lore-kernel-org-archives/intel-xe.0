Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2F1BC3DA49
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 13:19:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E0FF10E5C3;
	Tue, 23 Jul 2024 13:19:50 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DBB210E5C6;
 Tue, 23 Jul 2024 13:19:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0738080273935610425=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/mmio=3A_Use_single_logic_?=
 =?utf-8?q?for_waiting_functions?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 13:19:47 -0000
Message-ID: <172174078704.359893.5990255035613003247@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723120120.5443-2-gustavo.sousa@intel.com>
In-Reply-To: <20240723120120.5443-2-gustavo.sousa@intel.com>
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

--===============0738080273935610425==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio: Use single logic for waiting functions
URL   : https://patchwork.freedesktop.org/series/136384/
State : success

== Summary ==

CI Bug Log - changes from xe-1651-049eae5224ed92f3cb723a492593b255654e0649_BAT -> xe-pw-136384v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-136384v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#886]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#324])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886


Build changes
-------------

  * Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -> xe-pw-136384v1

  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649
  xe-pw-136384v1: 136384v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/index.html

--===============0738080273935610425==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio: Use single logic for waiting functions</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136384/">https://patchwork.freedesktop.org/series/136384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1651-049eae5224ed92f3cb723a492593b255654e0649_BAT -&gt; xe-pw-136384v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136384v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136384v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -&gt; xe-pw-136384v1</li>
</ul>
<p>IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649<br />
  xe-pw-136384v1: 136384v1</p>

</body>
</html>

--===============0738080273935610425==--
