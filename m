Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70FC8C4167B
	for <intel-xe@archiver.kernel.org>; Fri,  1 Dec 2023 04:12:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3525710E7AE;
	Fri,  1 Dec 2023 04:12:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id C605C10E7B0;
 Fri,  1 Dec 2023 04:11:27 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 298E2AADEB;
 Fri,  1 Dec 2023 04:11:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2777125597142770932=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Date: Fri, 01 Dec 2023 04:11:25 -0000
Message-ID: <170140388515.19688.8744055533954213546@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231130180135.628368-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231130180135.628368-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Add_workaround_16020292621_=28rev8=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2777125597142770932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 16020292621 (rev8)
URL   : https://patchwork.freedesktop.org/series/126644/
State : success

== Summary ==

CI Bug Log - changes from xe-542-84f2c2adec155170779f65ff63b4e80a51d22448_BAT -> xe-pw-126644v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-126644v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-542-84f2c2adec155170779f65ff63b4e80a51d22448/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#282] / [i915#2017])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-542-84f2c2adec155170779f65ff63b4e80a51d22448/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-542-84f2c2adec155170779f65ff63b4e80a51d22448 -> xe-pw-126644v8

  IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-542-84f2c2adec155170779f65ff63b4e80a51d22448: 84f2c2adec155170779f65ff63b4e80a51d22448
  xe-pw-126644v8: 126644v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/index.html

--===============2777125597142770932==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 16020292621 (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126644/">https://patchwork.freedesktop.org/series/126644/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-542-84f2c2adec155170779f65ff63b4e80a51d22448_BAT -&gt; xe-pw-126644v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126644v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-542-84f2c2adec155170779f65ff63b4e80a51d22448/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-542-84f2c2adec155170779f65ff63b4e80a51d22448/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126644v8/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-542-84f2c2adec155170779f65ff63b4e80a51d22448 -&gt; xe-pw-126644v8</li>
</ul>
<p>IGT_7613: 378017d8fa63defde11c0b4bc72025c64b70607d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-542-84f2c2adec155170779f65ff63b4e80a51d22448: 84f2c2adec155170779f65ff63b4e80a51d22448<br />
  xe-pw-126644v8: 126644v8</p>

</body>
</html>

--===============2777125597142770932==--
