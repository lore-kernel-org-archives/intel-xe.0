Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CADCC83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 22:01:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FDD510E8FD;
	Thu,  3 Jul 2025 22:01:19 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FA0610E8FD;
 Thu,  3 Jul 2025 22:01:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0840446062198780629=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Crashlog_Type1_Version2_sup?=
 =?utf-8?q?port_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Jul 2025 22:01:17 -0000
Message-ID: <175158007744.132864.18229282371964694592@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250703211150.135320-1-michael.j.ruhl@intel.com>
In-Reply-To: <20250703211150.135320-1-michael.j.ruhl@intel.com>
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

--===============0840446062198780629==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crashlog Type1 Version2 support (rev6)
URL   : https://patchwork.freedesktop.org/series/149120/
State : success

== Summary ==

CI Bug Log - changes from xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac_BAT -> xe-pw-149120v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-149120v6_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac -> xe-pw-149120v6

  IGT_8438: 8438
  xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac: 05fd9cf9ba87dcf4428adbca5237845f2c04d8ac
  xe-pw-149120v6: 149120v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/index.html

--===============0840446062198780629==
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
<tr><td><b>Series:</b></td><td>Crashlog Type1 Version2 support (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149120/">https://patchwork.freedesktop.org/series/149120/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac_BAT -&gt; xe-pw-149120v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149120v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149120v6/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac -&gt; xe-pw-149120v6</li>
</ul>
<p>IGT_8438: 8438<br />
  xe-3344-05fd9cf9ba87dcf4428adbca5237845f2c04d8ac: 05fd9cf9ba87dcf4428adbca5237845f2c04d8ac<br />
  xe-pw-149120v6: 149120v6</p>

</body>
</html>

--===============0840446062198780629==--
