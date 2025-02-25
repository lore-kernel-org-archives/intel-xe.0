Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC56C021B2
	for <intel-xe@archiver.kernel.org>; Tue, 25 Feb 2025 20:44:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4693F10E7E2;
	Tue, 25 Feb 2025 20:44:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41610E7E2;
 Tue, 25 Feb 2025 20:44:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6000777109147648452=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Minor_improvements_to_GT_st?=
 =?utf-8?q?ats_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Feb 2025 20:44:29 -0000
Message-ID: <174051626995.2078672.6466820660495690786@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250225195902.1247100-1-francois.dugast@intel.com>
In-Reply-To: <20250225195902.1247100-1-francois.dugast@intel.com>
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

--===============6000777109147648452==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Minor improvements to GT stats (rev2)
URL   : https://patchwork.freedesktop.org/series/145405/
State : success

== Summary ==

CI Bug Log - changes from xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb_BAT -> xe-pw-145405v2_BAT
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

  Here are the changes found in xe-pw-145405v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145405v2/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb -> xe-pw-145405v2

  IGT_8247: 8247
  xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb: c7988865b658d56bcfaac76b7d72cc59435565eb
  xe-pw-145405v2: 145405v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145405v2/index.html

--===============6000777109147648452==
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
<tr><td><b>Series:</b></td><td>Minor improvements to GT stats (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145405/">https://patchwork.freedesktop.org/series/145405/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145405v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145405v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb_BAT -&gt; xe-pw-145405v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145405v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145405v2/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb -&gt; xe-pw-145405v2</li>
</ul>
<p>IGT_8247: 8247<br />
  xe-2711-c7988865b658d56bcfaac76b7d72cc59435565eb: c7988865b658d56bcfaac76b7d72cc59435565eb<br />
  xe-pw-145405v2: 145405v2</p>

</body>
</html>

--===============6000777109147648452==--
