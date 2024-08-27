Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1325AC5472D
	for <intel-xe@archiver.kernel.org>; Tue, 27 Aug 2024 01:37:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C75EA10E011;
	Tue, 27 Aug 2024 01:37:12 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E503A10E011;
 Tue, 27 Aug 2024 01:37:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6504858247446275060=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Replace_xe=5Fdevice=5F?=
 =?utf-8?q?wmb_by_wmb?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Aug 2024 01:37:10 -0000
Message-ID: <172472263093.786103.11667885457894652876@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
In-Reply-To: <20240826234100.1850471-1-ashutosh.dixit@intel.com>
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

--===============6504858247446275060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Replace xe_device_wmb by wmb
URL   : https://patchwork.freedesktop.org/series/137818/
State : success

== Summary ==

CI Bug Log - changes from xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0_BAT -> xe-pw-137818v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-137818v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_mmap@cpu-caching:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0/bat-bmg-1/igt@xe_mmap@cpu-caching.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/bat-bmg-1/igt@xe_mmap@cpu-caching.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#324]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0 -> xe-pw-137818v1

  IGT_7992: 14c915ac38d4f697f504f3c754195c5e284c49e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0: 94d6fa93a57b0c160fec84046f65a218d7e18bc0
  xe-pw-137818v1: 137818v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/index.html

--===============6504858247446275060==
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
<tr><td><b>Series:</b></td><td>drm/xe: Replace xe_device_wmb by wmb</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137818/">https://patchwork.freedesktop.org/series/137818/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0_BAT -&gt; xe-pw-137818v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137818v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_mmap@cpu-caching:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0/bat-bmg-1/igt@xe_mmap@cpu-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/bat-bmg-1/igt@xe_mmap@cpu-caching.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137818v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0 -&gt; xe-pw-137818v1</li>
</ul>
<p>IGT_7992: 14c915ac38d4f697f504f3c754195c5e284c49e7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1831-94d6fa93a57b0c160fec84046f65a218d7e18bc0: 94d6fa93a57b0c160fec84046f65a218d7e18bc0<br />
  xe-pw-137818v1: 137818v1</p>

</body>
</html>

--===============6504858247446275060==--
