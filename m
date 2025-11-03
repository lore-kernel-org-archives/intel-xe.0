Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD94CCF9F8
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 14:36:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91D2910E40C;
	Mon,  3 Nov 2025 14:36:01 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B49910E40B;
 Mon,  3 Nov 2025 14:36:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5584665434782796949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Fix_extra_b?=
 =?utf-8?q?racket_and_wrong_variable_in_PIPEDMC_error_logs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alok Tiwari" <alok.a.tiwari@oracle.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Nov 2025 14:36:01 -0000
Message-ID: <176218056110.11629.12941916481121957822@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251103132337.762156-1-alok.a.tiwari@oracle.com>
In-Reply-To: <20251103132337.762156-1-alok.a.tiwari@oracle.com>
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

--===============5584665434782796949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Fix extra bracket and wrong variable in PIPEDMC error logs
URL   : https://patchwork.freedesktop.org/series/156923/
State : success

== Summary ==

CI Bug Log - changes from xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e_BAT -> xe-pw-156923v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156923v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156923v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e -> xe-pw-156923v1

  IGT_8605: 8605
  xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e: bf28109fb23cbeefd5c8148ec847f2c172f4720e
  xe-pw-156923v1: 156923v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156923v1/index.html

--===============5584665434782796949==
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
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Fix extra bracket and wrong variable in PIPEDMC error logs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156923/">https://patchwork.freedesktop.org/series/156923/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156923v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156923v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e_BAT -&gt; xe-pw-156923v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156923v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156923v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e -&gt; xe-pw-156923v1</li>
</ul>
<p>IGT_8605: 8605<br />
  xe-4032-bf28109fb23cbeefd5c8148ec847f2c172f4720e: bf28109fb23cbeefd5c8148ec847f2c172f4720e<br />
  xe-pw-156923v1: 156923v1</p>

</body>
</html>

--===============5584665434782796949==--
