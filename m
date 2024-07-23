Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12BA2C3DA63
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 16:51:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B570D10E187;
	Tue, 23 Jul 2024 16:51:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE77210E187;
 Tue, 23 Jul 2024 16:51:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1611408306051150807=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/xe=3A_Kill_exec_queues_synch?=
 =?utf-8?q?ronously?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 16:51:23 -0000
Message-ID: <172175348376.360288.12506697350725909727@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240723151454.1730498-1-matthew.brost@intel.com>
In-Reply-To: <20240723151454.1730498-1-matthew.brost@intel.com>
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

--===============1611408306051150807==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Kill exec queues synchronously
URL   : https://patchwork.freedesktop.org/series/136391/
State : failure

== Summary ==

CI Bug Log - changes from xe-1651-049eae5224ed92f3cb723a492593b255654e0649_BAT -> xe-pw-136391v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136391v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136391v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 6)
------------------------------

  Missing    (1): bat-pvc-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136391v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-136391v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#2055])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055


Build changes
-------------

  * IGT: IGT_7935 -> IGT_7936
  * Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -> xe-pw-136391v1

  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7936: 7936
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649
  xe-pw-136391v1: 136391v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/index.html

--===============1611408306051150807==
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
<tr><td><b>Series:</b></td><td>drm/xe: Kill exec queues synchronously</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136391/">https://patchwork.freedesktop.org/series/136391/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1651-049eae5224ed92f3cb723a492593b255654e0649_BAT -&gt; xe-pw-136391v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136391v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136391v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 6)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136391v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-b-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136391v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@nonblocking-crc:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1651-049eae5224ed92f3cb723a492593b255654e0649/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136391v1/bat-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7935 -&gt; IGT_7936</li>
<li>Linux: xe-1651-049eae5224ed92f3cb723a492593b255654e0649 -&gt; xe-pw-136391v1</li>
</ul>
<p>IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7936: 7936<br />
  xe-1651-049eae5224ed92f3cb723a492593b255654e0649: 049eae5224ed92f3cb723a492593b255654e0649<br />
  xe-pw-136391v1: 136391v1</p>

</body>
</html>

--===============1611408306051150807==--
