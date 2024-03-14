Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAA52C54E60
	for <intel-xe@archiver.kernel.org>; Thu, 14 Mar 2024 15:01:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E99210FBAD;
	Thu, 14 Mar 2024 15:01:47 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEF0210FBAA;
 Thu, 14 Mar 2024 15:01:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3877531880598100887=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_starting_with_=5B01/11=5D?=
 =?utf-8?q?_drm/xe=3A_Introduce_xe=5Fpm=5Fruntime=5Fget=5Fnoresume_for_inner?=
 =?utf-8?q?_callers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Mar 2024 15:01:46 -0000
Message-ID: <171042850678.753906.1687221628797147894@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240314141021.161009-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240314141021.161009-1-rodrigo.vivi@intel.com>
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

--===============3877531880598100887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [01/11] drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers
URL   : https://patchwork.freedesktop.org/series/131140/
State : failure

== Summary ==

CI Bug Log - changes from xe-939-9bedef916cef04bba9e98430c1c1de637219a573_BAT -> xe-pw-131140v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-131140v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-131140v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131140v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-pvc-2:          [PASS][1] -> [INCOMPLETE][2] +1 other test incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:
    - bat-atsm-2:         [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html

  
Known issues
------------

  Here are the changes found in xe-pw-131140v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_hdmi_inject@inject-audio:
    - bat-dg2-oem2:       [SKIP][5] ([Intel XE#417]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html
    - bat-adlp-7:         [SKIP][7] ([Intel XE#417]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html

  
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417


Build changes
-------------

  * IGT: IGT_7761 -> IGT_7764
  * Linux: xe-939-9bedef916cef04bba9e98430c1c1de637219a573 -> xe-pw-131140v1

  IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7764: 7764
  xe-939-9bedef916cef04bba9e98430c1c1de637219a573: 9bedef916cef04bba9e98430c1c1de637219a573
  xe-pw-131140v1: 131140v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/index.html

--===============3877531880598100887==
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
<tr><td><b>Series:</b></td><td>series starting with [01/11] drm/xe: Introduce xe_pm_runtime_get_noresume for inner callers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131140/">https://patchwork.freedesktop.org/series/131140/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-939-9bedef916cef04bba9e98430c1c1de637219a573_BAT -&gt; xe-pw-131140v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-131140v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-131140v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131140v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-pvc-2/igt@xe_live_ktest@xe_dma_buf.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-atsm-2/igt@xe_live_ktest@xe_dma_buf@xe_dma_buf_kunit.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131140v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdmi_inject@inject-audio:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-dg2-oem2/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-939-9bedef916cef04bba9e98430c1c1de637219a573/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131140v1/bat-adlp-7/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7761 -&gt; IGT_7764</li>
<li>Linux: xe-939-9bedef916cef04bba9e98430c1c1de637219a573 -&gt; xe-pw-131140v1</li>
</ul>
<p>IGT_7761: 67af6998a7e0467a7a0718cbbfe05a9fd383206f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7764: 7764<br />
  xe-939-9bedef916cef04bba9e98430c1c1de637219a573: 9bedef916cef04bba9e98430c1c1de637219a573<br />
  xe-pw-131140v1: 131140v1</p>

</body>
</html>

--===============3877531880598100887==--
