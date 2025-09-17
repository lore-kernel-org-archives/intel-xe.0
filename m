Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65CD6CAC59A
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 23:38:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEF0E10E5A5;
	Wed, 17 Sep 2025 23:38:29 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A10110E0A6;
 Wed, 17 Sep 2025 23:38:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0324815337598785712=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Simplif?=
 =?utf-8?q?y_Link/PHY_CTS_flow_and_process?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Khaled Almahallawy" <khaled.almahallawy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Sep 2025 23:38:29 -0000
Message-ID: <175815230961.342834.9934713416736907397@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250917225937.1796620-1-khaled.almahallawy@intel.com>
In-Reply-To: <20250917225937.1796620-1-khaled.almahallawy@intel.com>
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

--===============0324815337598785712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Simplify Link/PHY CTS flow and process
URL   : https://patchwork.freedesktop.org/series/154672/
State : success

== Summary ==

CI Bug Log - changes from xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd_BAT -> xe-pw-154672v1_BAT
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

  Here are the changes found in xe-pw-154672v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154672v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd -> xe-pw-154672v1

  IGT_8543: 8543
  xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd: 877cacfae04717ab0cbb9c9eac7b4179000280cd
  xe-pw-154672v1: 154672v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154672v1/index.html

--===============0324815337598785712==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Simplify Link/PHY CTS flow and process</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154672/">https://patchwork.freedesktop.org/series/154672/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154672v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154672v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd_BAT -&gt; xe-pw-154672v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154672v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154672v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd -&gt; xe-pw-154672v1</li>
</ul>
<p>IGT_8543: 8543<br />
  xe-3786-877cacfae04717ab0cbb9c9eac7b4179000280cd: 877cacfae04717ab0cbb9c9eac7b4179000280cd<br />
  xe-pw-154672v1: 154672v1</p>

</body>
</html>

--===============0324815337598785712==--
