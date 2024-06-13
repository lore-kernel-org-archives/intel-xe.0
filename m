Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADFB2C27C4F
	for <intel-xe@archiver.kernel.org>; Thu, 13 Jun 2024 15:48:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5975A10E0A0;
	Thu, 13 Jun 2024 15:48:51 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E50510E0A0;
 Thu, 13 Jun 2024 15:48:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1571343273090007142=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915/dsc=3A_don=27t_mess_up_?=
 =?utf-8?q?splitter_state_in_joiner_or_dsc_config?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Jun 2024 15:48:49 -0000
Message-ID: <171829372964.73458.9830060405196883113@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240613150424.262567-1-jani.nikula@intel.com>
In-Reply-To: <20240613150424.262567-1-jani.nikula@intel.com>
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

--===============1571343273090007142==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dsc: don't mess up splitter state in joiner or dsc config
URL   : https://patchwork.freedesktop.org/series/134826/
State : success

== Summary ==

CI Bug Log - changes from xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048_BAT -> xe-pw-134826v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-134826v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134826v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7885 -> IGT_7886
  * Linux: xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048 -> xe-pw-134826v1

  IGT_7885: 76189d25da1d0b245f288b75ebe44986f8a75b0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048: 9f3ced27c8deae54c79db1743e37d2935558e048
  xe-pw-134826v1: 134826v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134826v1/index.html

--===============1571343273090007142==
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
<tr><td><b>Series:</b></td><td>drm/i915/dsc: don&#x27;t mess up splitter state in joiner or dsc config</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134826/">https://patchwork.freedesktop.org/series/134826/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134826v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134826v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048_BAT -&gt; xe-pw-134826v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134826v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134826v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7885 -&gt; IGT_7886</li>
<li>Linux: xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048 -&gt; xe-pw-134826v1</li>
</ul>
<p>IGT_7885: 76189d25da1d0b245f288b75ebe44986f8a75b0f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7886: 53b62502a04bd57cbcb3ae85ffc2cdf09b2b22a9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1457-9f3ced27c8deae54c79db1743e37d2935558e048: 9f3ced27c8deae54c79db1743e37d2935558e048<br />
  xe-pw-134826v1: 134826v1</p>

</body>
</html>

--===============1571343273090007142==--
