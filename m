Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15163CA0EFA
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 09:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF5810E622;
	Tue, 26 Aug 2025 09:37:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD1AF10E622;
 Tue, 26 Aug 2025 09:37:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8101928667386964557=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/backlight=3A_Disab?=
 =?utf-8?q?le_backlight_when_using_luminance_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 09:37:55 -0000
Message-ID: <175620107589.270220.7998044671529766069@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826080005.501534-1-suraj.kandpal@intel.com>
In-Reply-To: <20250826080005.501534-1-suraj.kandpal@intel.com>
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

--===============8101928667386964557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/backlight: Disable backlight when using luminance control
URL   : https://patchwork.freedesktop.org/series/153502/
State : success

== Summary ==

CI Bug Log - changes from xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46_BAT -> xe-pw-153502v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153502v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153502v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46 -> xe-pw-153502v1

  IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46: 8660eb3be99b607b54bf3fa47fd66e9fbd59af46
  xe-pw-153502v1: 153502v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153502v1/index.html

--===============8101928667386964557==
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
<tr><td><b>Series:</b></td><td>drm/i915/backlight: Disable backlight when using luminance control</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153502/">https://patchwork.freedesktop.org/series/153502/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153502v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153502v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46_BAT -&gt; xe-pw-153502v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153502v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153502v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46 -&gt; xe-pw-153502v1</li>
</ul>
<p>IGT_8509: 9709b23ae933687339ed89c526df2677102e9153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3617-8660eb3be99b607b54bf3fa47fd66e9fbd59af46: 8660eb3be99b607b54bf3fa47fd66e9fbd59af46<br />
  xe-pw-153502v1: 153502v1</p>

</body>
</html>

--===============8101928667386964557==--
