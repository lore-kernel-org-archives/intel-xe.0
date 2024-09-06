Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AC8CE7AFB
	for <intel-xe@archiver.kernel.org>; Fri,  6 Sep 2024 09:46:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6F8610E9DE;
	Fri,  6 Sep 2024 09:46:37 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36F910E9DE;
 Fri,  6 Sep 2024 09:46:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5871519814074196961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/i915/display=3A_Workaround_f?=
 =?utf-8?q?or_odd_panning_for_planar_yuv_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Sep 2024 09:46:35 -0000
Message-ID: <172561599599.953800.5112438875362022491@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240906070133.3843174-1-nemesa.garg@intel.com>
In-Reply-To: <20240906070133.3843174-1-nemesa.garg@intel.com>
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

--===============5871519814074196961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Workaround for odd panning for planar yuv (rev2)
URL   : https://patchwork.freedesktop.org/series/136422/
State : failure

== Summary ==

CI Bug Log - changes from xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605_BAT -> xe-pw-136422v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136422v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136422v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-atsm-2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136422v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] +3 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v2/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html

  


Build changes
-------------

  * Linux: xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605 -> xe-pw-136422v2

  IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605: e0cc4f231c70e2eaafe1ef83c5303fea926ea605
  xe-pw-136422v2: 136422v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v2/index.html

--===============5871519814074196961==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Workaround for odd panning for planar yuv (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136422/">https://patchwork.freedesktop.org/series/136422/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605_BAT -&gt; xe-pw-136422v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136422v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136422v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136422v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136422v2/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-c-edp-1.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605 -&gt; xe-pw-136422v2</li>
</ul>
<p>IGT_8007: 8f9900c288f4cf1244d66baa71bc6d9355747cbd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1902-e0cc4f231c70e2eaafe1ef83c5303fea926ea605: e0cc4f231c70e2eaafe1ef83c5303fea926ea605<br />
  xe-pw-136422v2: 136422v2</p>

</body>
</html>

--===============5871519814074196961==--
