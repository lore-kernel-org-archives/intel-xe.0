Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164C3C5518F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 14:57:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51910EACB;
	Tue,  4 Aug 2026 14:57:06 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9436D10EA87;
 Tue,  4 Aug 2026 14:57:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2250822689799474218=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/flipq=3A_Fix_curso?=
 =?utf-8?q?r_left_enabled_after_a_pipe_disable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 14:57:05 -0000
Message-ID: <178585542560.18451.4897114114582995428@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804063058.969207-1-mika.kahola@intel.com>
In-Reply-To: <20260804063058.969207-1-mika.kahola@intel.com>
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

--===============2250822689799474218==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/flipq: Fix cursor left enabled after a pipe disable (rev2)
URL   : https://patchwork.freedesktop.org/series/171550/
State : failure

== Summary ==

CI Bug Log - changes from xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef_BAT -> xe-pw-171550v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-171550v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-171550v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 14)
------------------------------

  Additional (2): bat-nvls-2 bat-nvls-1 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-171550v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-nvls-1:         NOTRUN -> [SKIP][1] +105 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/bat-nvls-1/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-nvls-2:         NOTRUN -> [SKIP][2] +105 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  


Build changes
-------------

  * IGT: IGT_9036 -> IGT_9037
  * Linux: xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef -> xe-pw-171550v2

  IGT_9036: 9036
  IGT_9037: 9037
  xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef: c2d24e2eda55d74743f0d99a98805bf0b596beef
  xe-pw-171550v2: 171550v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/index.html

--===============2250822689799474218==
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
<tr><td><b>Series:</b></td><td>drm/i915/flipq: Fix cursor left enabled after a pipe disable (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171550/">https://patchwork.freedesktop.org/series/171550/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef_BAT -&gt; xe-pw-171550v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-171550v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-171550v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 14)</h2>
<p>Additional (2): bat-nvls-2 bat-nvls-1 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-171550v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/bat-nvls-1/igt@kms_addfb_basic@bad-pitch-0.html">SKIP</a> +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171550v2/bat-nvls-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +105 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9036 -&gt; IGT_9037</li>
<li>Linux: xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef -&gt; xe-pw-171550v2</li>
</ul>
<p>IGT_9036: 9036<br />
  IGT_9037: 9037<br />
  xe-5539-c2d24e2eda55d74743f0d99a98805bf0b596beef: c2d24e2eda55d74743f0d99a98805bf0b596beef<br />
  xe-pw-171550v2: 171550v2</p>

</body>
</html>

--===============2250822689799474218==--
