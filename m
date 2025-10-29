Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DD2CCD1BF
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 00:45:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782610E6C9;
	Wed, 29 Oct 2025 00:45:57 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89ABD10E6C9;
 Wed, 29 Oct 2025 00:45:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6015478280952220386=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CI=3A_test_PCI_rebar_change?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 29 Oct 2025 00:45:55 -0000
Message-ID: <176169875555.64512.5336420909032534092@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251028211613.3228940-2-lucas.demarchi@intel.com>
In-Reply-To: <20251028211613.3228940-2-lucas.demarchi@intel.com>
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

--===============6015478280952220386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CI: test PCI rebar changes
URL   : https://patchwork.freedesktop.org/series/156691/
State : success

== Summary ==

CI Bug Log - changes from xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044_BAT -> xe-pw-156691v1_BAT
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

  Here are the changes found in xe-pw-156691v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156691v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044 -> xe-pw-156691v1

  IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044: 820bcb3f052e15c3f9b42aa28344d0a9991ac044
  xe-pw-156691v1: 156691v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156691v1/index.html

--===============6015478280952220386==
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
<tr><td><b>Series:</b></td><td>CI: test PCI rebar changes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156691/">https://patchwork.freedesktop.org/series/156691/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156691v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156691v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044_BAT -&gt; xe-pw-156691v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156691v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156691v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044 -&gt; xe-pw-156691v1</li>
</ul>
<p>IGT_8599: b22b9ca357de868f3848269e5eb7c4cc53b3f2d1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3998-820bcb3f052e15c3f9b42aa28344d0a9991ac044: 820bcb3f052e15c3f9b42aa28344d0a9991ac044<br />
  xe-pw-156691v1: 156691v1</p>

</body>
</html>

--===============6015478280952220386==--
