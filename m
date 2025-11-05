Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F26CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 15:45:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DCC310E77A;
	Wed,  5 Nov 2025 15:45:02 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D245710E77A;
 Wed,  5 Nov 2025 15:45:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5262571324615224746=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Reviewed_patches_from=3A_?=
 =?utf-8?q?=5BPATCH_v3_00/29=5D_drm/i915/display=3A_Add_initial_support_for_?=
 =?utf-8?q?Xe3p=5FLPD?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 15:45:00 -0000
Message-ID: <176235750085.20673.9502961397198277363@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105140651.71713-19-gustavo.sousa@intel.com>
In-Reply-To: <20251105140651.71713-19-gustavo.sousa@intel.com>
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

--===============5262571324615224746==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Reviewed patches from: [PATCH v3 00/29] drm/i915/display: Add initial support for Xe3p_LPD
URL   : https://patchwork.freedesktop.org/series/157072/
State : success

== Summary ==

CI Bug Log - changes from xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc_BAT -> xe-pw-157072v1_BAT
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

  Here are the changes found in xe-pw-157072v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@b-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][5] -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc -> xe-pw-157072v1

  IGT_8607: 8607
  xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc: 8043455e28fb7b8089e55e4390547a4c3d7bd4dc
  xe-pw-157072v1: 157072v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/index.html

--===============5262571324615224746==
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
<tr><td><b>Series:</b></td><td>Reviewed patches from: [PATCH v3 00/29] drm/i915/display: Add initial support for Xe3p_LPD</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157072/">https://patchwork.freedesktop.org/series/157072/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc_BAT -&gt; xe-pw-157072v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157072v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@b-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@b-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157072v1/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc -&gt; xe-pw-157072v1</li>
</ul>
<p>IGT_8607: 8607<br />
  xe-4048-8043455e28fb7b8089e55e4390547a4c3d7bd4dc: 8043455e28fb7b8089e55e4390547a4c3d7bd4dc<br />
  xe-pw-157072v1: 157072v1</p>

</body>
</html>

--===============5262571324615224746==--
