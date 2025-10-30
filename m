Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD438CCF9F0
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 17:03:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6354A10E2AD;
	Thu, 30 Oct 2025 17:03:53 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433F610E2A8;
 Thu, 30 Oct 2025 17:03:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7845083657365117055=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Fix_user-after-free_during_?=
 =?utf-8?q?driver_unbind_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Oct 2025 17:03:52 -0000
Message-ID: <176184383226.1110.4845314771222603525@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20251030151122.3021436-4-balasubramani.vivekanandan@intel.com>
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

--===============7845083657365117055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix user-after-free during driver unbind (rev2)
URL   : https://patchwork.freedesktop.org/series/155814/
State : success

== Summary ==

CI Bug Log - changes from xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1_BAT -> xe-pw-155814v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155814v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155814v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1 -> xe-pw-155814v2

  IGT_8602: dd1fe429664020db97237b4e77d594dd763a7eae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1: f889a75ccdc6db3b8ca189cc96d47d6138f617d1
  xe-pw-155814v2: 155814v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155814v2/index.html

--===============7845083657365117055==
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
<tr><td><b>Series:</b></td><td>Fix user-after-free during driver unbind (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155814/">https://patchwork.freedesktop.org/series/155814/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155814v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155814v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1_BAT -&gt; xe-pw-155814v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155814v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155814v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1 -&gt; xe-pw-155814v2</li>
</ul>
<p>IGT_8602: dd1fe429664020db97237b4e77d594dd763a7eae @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4011-f889a75ccdc6db3b8ca189cc96d47d6138f617d1: f889a75ccdc6db3b8ca189cc96d47d6138f617d1<br />
  xe-pw-155814v2: 155814v2</p>

</body>
</html>

--===============7845083657365117055==--
