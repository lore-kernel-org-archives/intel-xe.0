Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E86C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 16:34:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84B7510E15E;
	Wed,  4 Jun 2025 16:34:40 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32B110E15E;
 Wed,  4 Jun 2025 16:34:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9047643576145000366=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/bmg=3A_Update_PCI_Id?=
 =?utf-8?q?=27s_and_Workarounds_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Jun 2025 16:34:38 -0000
Message-ID: <174905487898.49004.15350118252104661465@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250604145236.1143122-1-dnyaneshwar.bhadane@intel.com>
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

--===============9047643576145000366==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bmg: Update PCI Id's and Workarounds (rev3)
URL   : https://patchwork.freedesktop.org/series/149641/
State : failure

== Summary ==

CI Bug Log - changes from xe-3191-6517275da428d10d60b2762385ca7daa3a382754_BAT -> xe-pw-149641v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149641v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149641v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149641v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-2:          [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3191-6517275da428d10d60b2762385ca7daa3a382754/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3191-6517275da428d10d60b2762385ca7daa3a382754/bat-lnl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/bat-lnl-1/igt@xe_module_load@load.html

  


Build changes
-------------

  * IGT: IGT_8393 -> IGT_8395
  * Linux: xe-3191-6517275da428d10d60b2762385ca7daa3a382754 -> xe-pw-149641v3

  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8395: 73e85a0142d086bc2af1a3c6a9dac3e069bde38f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3191-6517275da428d10d60b2762385ca7daa3a382754: 6517275da428d10d60b2762385ca7daa3a382754
  xe-pw-149641v3: 149641v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/index.html

--===============9047643576145000366==
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
<tr><td><b>Series:</b></td><td>drm/xe/bmg: Update PCI Id&#x27;s and Workarounds (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149641/">https://patchwork.freedesktop.org/series/149641/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3191-6517275da428d10d60b2762385ca7daa3a382754_BAT -&gt; xe-pw-149641v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149641v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149641v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149641v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3191-6517275da428d10d60b2762385ca7daa3a382754/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3191-6517275da428d10d60b2762385ca7daa3a382754/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149641v3/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8393 -&gt; IGT_8395</li>
<li>Linux: xe-3191-6517275da428d10d60b2762385ca7daa3a382754 -&gt; xe-pw-149641v3</li>
</ul>
<p>IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8395: 73e85a0142d086bc2af1a3c6a9dac3e069bde38f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3191-6517275da428d10d60b2762385ca7daa3a382754: 6517275da428d10d60b2762385ca7daa3a382754<br />
  xe-pw-149641v3: 149641v3</p>

</body>
</html>

--===============9047643576145000366==--
