Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02948D1039A
	for <intel-xe@archiver.kernel.org>; Wed, 26 Nov 2025 09:55:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B466B10E59A;
	Wed, 26 Nov 2025 09:55:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A903A10E599;
 Wed, 26 Nov 2025 09:55:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7382163198689913221=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Check_n?=
 =?utf-8?q?umber_of_scalers_for_casf_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 26 Nov 2025 09:55:33 -0000
Message-ID: <176415093368.29053.9903586204540747555@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251124084629.3322714-1-nemesa.garg@intel.com>
In-Reply-To: <20251124084629.3322714-1-nemesa.garg@intel.com>
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

--===============7382163198689913221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Check number of scalers for casf (rev2)
URL   : https://patchwork.freedesktop.org/series/157956/
State : success

== Summary ==

CI Bug Log - changes from xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae_BAT -> xe-pw-157956v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 10)
------------------------------

  Missing    (2): bat-ptl-vm bat-bmg-3 

Known issues
------------

  Here are the changes found in xe-pw-157956v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [FAIL][3] ([Intel XE#6519]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519


Build changes
-------------

  * Linux: xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae -> xe-pw-157956v2

  IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae: 8052b0ba2e97387477c22ba816fabca9a4728aae
  xe-pw-157956v2: 157956v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/index.html

--===============7382163198689913221==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Check number of scalers for casf (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157956/">https://patchwork.freedesktop.org/series/157956/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae_BAT -&gt; xe-pw-157956v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 10)</h2>
<p>Missing    (2): bat-ptl-vm bat-bmg-3 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157956v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157956v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae -&gt; xe-pw-157956v2</li>
</ul>
<p>IGT_8638: 72d5c74eb3cf46af2f46daba8109d84c3dd19363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4149-8052b0ba2e97387477c22ba816fabca9a4728aae: 8052b0ba2e97387477c22ba816fabca9a4728aae<br />
  xe-pw-157956v2: 157956v2</p>

</body>
</html>

--===============7382163198689913221==--
