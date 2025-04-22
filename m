Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C467C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 10:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E516F10E1AD;
	Tue, 22 Apr 2025 10:23:27 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD4E10E1AD;
 Tue, 22 Apr 2025 10:23:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1634364765016216205=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/i915/display=3A_Ensure_?=
 =?utf-8?q?enough_lines_between_delayed_VBlank_and_VBlank_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 22 Apr 2025 10:23:26 -0000
Message-ID: <174531740696.25109.14765476385695747773@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250422091746.529878-1-jouni.hogander@intel.com>
In-Reply-To: <20250422091746.529878-1-jouni.hogander@intel.com>
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

--===============1634364765016216205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Ensure enough lines between delayed VBlank and VBlank (rev2)
URL   : https://patchwork.freedesktop.org/series/147935/
State : failure

== Summary ==

CI Bug Log - changes from xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe_BAT -> xe-pw-147935v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-147935v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-147935v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-147935v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_hdmi_inject@inject-audio:
    - bat-adlp-7:         [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-dg2-oem2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-dg2-oem2/igt@xe_module_load@load.html
    - bat-lnl-1:          [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-lnl-1/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-lnl-1/igt@xe_module_load@load.html
    - bat-bmg-1:          [PASS][9] -> [ABORT][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-bmg-1/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-bmg-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * Linux: xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe -> xe-pw-147935v2

  IGT_8329: 8329
  xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe: dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe
  xe-pw-147935v2: 147935v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/index.html

--===============1634364765016216205==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Ensure enough lines between delayed VBlank and VBlank (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147935/">https://patchwork.freedesktop.org/series/147935/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe_BAT -&gt; xe-pw-147935v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-147935v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-147935v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-147935v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-dg2-oem2/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-lnl-1/igt@xe_module_load@load.html">ABORT</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147935v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe -&gt; xe-pw-147935v2</li>
</ul>
<p>IGT_8329: 8329<br />
  xe-2977-dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe: dc80d6a10c1c9cf05c93d7db5beb4d8bc464cbbe<br />
  xe-pw-147935v2: 147935v2</p>

</body>
</html>

--===============1634364765016216205==--
