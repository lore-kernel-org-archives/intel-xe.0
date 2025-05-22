Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691A9C54E65
	for <intel-xe@archiver.kernel.org>; Thu, 22 May 2025 12:22:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0091310E154;
	Thu, 22 May 2025 12:22:18 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7162A10E145;
 Thu, 22 May 2025 12:22:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4191098451844853447=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/hwmon=3A_Add_mailbox?=
 =?utf-8?q?_power_limits=2C_PL2=2C_read_energy_from_PMT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 May 2025 12:22:17 -0000
Message-ID: <174791653745.13628.9146294102044080483@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250522111643.1946209-1-karthik.poosa@intel.com>
In-Reply-To: <20250522111643.1946209-1-karthik.poosa@intel.com>
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

--===============4191098451844853447==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT
URL   : https://patchwork.freedesktop.org/series/149387/
State : failure

== Summary ==

CI Bug Log - changes from xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d_BAT -> xe-pw-149387v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149387v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149387v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149387v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_evict@evict-beng-small:
    - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2] +10 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d/bat-atsm-2/igt@xe_evict@evict-beng-small.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149387v1/bat-atsm-2/igt@xe_evict@evict-beng-small.html

  


Build changes
-------------

  * Linux: xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d -> xe-pw-149387v1

  IGT_8373: 8373
  xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d: 444fd022f6c4f5245b1e8f797805ab3917235d3d
  xe-pw-149387v1: 149387v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149387v1/index.html

--===============4191098451844853447==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Add mailbox power limits, PL2, read energy from PMT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149387/">https://patchwork.freedesktop.org/series/149387/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149387v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149387v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d_BAT -&gt; xe-pw-149387v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149387v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149387v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149387v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_evict@evict-beng-small:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d/bat-atsm-2/igt@xe_evict@evict-beng-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149387v1/bat-atsm-2/igt@xe_evict@evict-beng-small.html">DMESG-WARN</a> +10 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d -&gt; xe-pw-149387v1</li>
</ul>
<p>IGT_8373: 8373<br />
  xe-3126-444fd022f6c4f5245b1e8f797805ab3917235d3d: 444fd022f6c4f5245b1e8f797805ab3917235d3d<br />
  xe-pw-149387v1: 149387v1</p>

</body>
</html>

--===============4191098451844853447==--
