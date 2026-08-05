Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 554DAC55822
	for <intel-xe@archiver.kernel.org>; Wed,  5 Aug 2026 09:32:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 150FB10EDB0;
	Wed,  5 Aug 2026 09:32:23 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EACD910E1FA;
 Wed,  5 Aug 2026 09:32:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2434254175146420557=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/ras=3A_Fix_invalid_h?=
 =?utf-8?q?ealth_error_code_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Aug 2026 09:32:21 -0000
Message-ID: <178592234195.21322.6307559294565260749@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804051214.1202957-1-raag.jadav@intel.com>
In-Reply-To: <20260804051214.1202957-1-raag.jadav@intel.com>
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

--===============2434254175146420557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/ras: Fix invalid health error code (rev2)
URL   : https://patchwork.freedesktop.org/series/171545/
State : failure

== Summary ==

CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_BAT -> xe-pw-171545v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171545v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171545v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (14 -> 1)
------------------------------

  ERROR: It appears as if the changes made in xe-pw-171545v2_BAT prevented too many machines from booting.

  Missing    (13): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-lnl-1 bat-ptl-vm bat-ptl-2 bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-nvls-1 bat-adlp-7 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171545v2_BAT:

### IGT changes ###

#### Warnings ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         [SKIP][1] ([Intel XE#8740]) -> [SKIP][2] +30 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171545v2/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  [Intel XE#8740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740


Build changes
-------------

  * Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -> xe-pw-171545v2

  IGT_9038: 9038
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23
  xe-pw-171545v2: 171545v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171545v2/index.html

--===============2434254175146420557==
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
<tr><td><b>Series:</b></td><td>drm/xe/ras: Fix invalid health error code (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171545/">https://patchwork.freedesktop.org/series/171545/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171545v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171545v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23_BAT -&gt; xe-pw-171545v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171545v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171545v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (14 -&gt; 1)</h2>
<p>ERROR: It appears as if the changes made in xe-pw-171545v2_BAT prevented too many machines from booting.</p>
<p>Missing    (13): bat-bmg-1 bat-lnl-2 bat-ptl-1 bat-lnl-1 bat-ptl-vm bat-ptl-2 bat-bmg-vm bat-atsm-2 bat-bmg-3 bat-wcl-1 bat-wcl-2 bat-nvls-1 bat-adlp-7 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171545v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8740">Intel XE#8740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171545v2/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23 -&gt; xe-pw-171545v2</li>
</ul>
<p>IGT_9038: 9038<br />
  xe-5543-c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23: c2cb32e2a8efaf9fa8d472f7bf3d5fe77ea7ec23<br />
  xe-pw-171545v2: 171545v2</p>

</body>
</html>

--===============2434254175146420557==--
