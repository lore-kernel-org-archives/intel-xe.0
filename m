Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88CAC3DA5D
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jul 2024 11:39:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89B8410E13B;
	Thu, 25 Jul 2024 11:39:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9497410E123;
 Thu, 25 Jul 2024 11:39:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2612616195652290372=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Add_MSIX_functionality_to_XE_=28?=
 =?utf-8?q?rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jul 2024 11:39:51 -0000
Message-ID: <172190759160.381312.2294417375703712527@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240725102213.2182896-1-ilia.levi@intel.com>
In-Reply-To: <20240725102213.2182896-1-ilia.levi@intel.com>
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

--===============2612616195652290372==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add MSIX functionality to XE (rev6)
URL   : https://patchwork.freedesktop.org/series/135422/
State : failure

== Summary ==

CI Bug Log - changes from xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2_BAT -> xe-pw-135422v6_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-135422v6_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-135422v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-135422v6_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-135422v6_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][5] ([Intel XE#324]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - {bat-bmg-1}:        [DMESG-WARN][7] ([Intel XE#877]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_7936 -> IGT_7937
  * Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -> xe-pw-135422v6

  IGT_7936: 7936
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2
  xe-pw-135422v6: 135422v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/index.html

--===============2612616195652290372==
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
<tr><td><b>Series:</b></td><td>Add MSIX functionality to XE (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135422/">https://patchwork.freedesktop.org/series/135422/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2_BAT -&gt; xe-pw-135422v6_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-135422v6_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-135422v6_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-135422v6_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135422v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135422v6/bat-bmg-1/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7936 -&gt; IGT_7937</li>
<li>Linux: xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2 -&gt; xe-pw-135422v6</li>
</ul>
<p>IGT_7936: 7936<br />
  IGT_7937: eba69333dfe8c295d053997367e395d7bde2b4b4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1664-724a2a53988a57709d7f9dcd5c58dd5737d45cb2: 724a2a53988a57709d7f9dcd5c58dd5737d45cb2<br />
  xe-pw-135422v6: 135422v6</p>

</body>
</html>

--===============2612616195652290372==--
