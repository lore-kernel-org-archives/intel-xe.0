Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86B54CCFA0D
	for <intel-xe@archiver.kernel.org>; Wed,  5 Nov 2025 13:38:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B27C10E746;
	Wed,  5 Nov 2025 13:38:25 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7755910E746;
 Wed,  5 Nov 2025 13:38:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9188954246623982032=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_Plane_Color_Pipeline_suppor?=
 =?utf-8?q?t_for_Intel_platforms_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Uma Shankar" <uma.shankar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 05 Nov 2025 13:38:23 -0000
Message-ID: <176234990348.20785.3791953867852082713@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251105123413.2671075-1-uma.shankar@intel.com>
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
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

--===============9188954246623982032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Plane Color Pipeline support for Intel platforms (rev5)
URL   : https://patchwork.freedesktop.org/series/141788/
State : failure

== Summary ==

CI Bug Log - changes from xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0_BAT -> xe-pw-141788v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141788v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141788v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141788v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-ptl-2:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-ptl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-ptl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4] +1 other test abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - bat-lnl-1:          [PASS][5] -> [ABORT][6] +1 other test abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
    - bat-adlp-7:         [PASS][7] -> [ABORT][8] +1 other test abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3:
    - bat-bmg-1:          [PASS][9] -> [ABORT][10] +1 other test abort
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3.html

  
Known issues
------------

  Here are the changes found in xe-pw-141788v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@c-edp1:
    - bat-adlp-7:         [DMESG-WARN][11] ([Intel XE#4543]) -> [PASS][12] +1 other test pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * Linux: xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0 -> xe-pw-141788v5

  IGT_8607: 8607
  xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0: 14d34ac35158252e94860f96b92b6778f95df1e0
  xe-pw-141788v5: 141788v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/index.html

--===============9188954246623982032==
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
<tr><td><b>Series:</b></td><td>Plane Color Pipeline support for Intel platforms (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141788/">https://patchwork.freedesktop.org/series/141788/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0_BAT -&gt; xe-pw-141788v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141788v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141788v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141788v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-ptl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-ptl-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">ABORT</a> +1 other test abort</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">ABORT</a> +1 other test abort</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">ABORT</a> +1 other test abort</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-adlp-7/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-a-hdmi-a-3.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141788v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-plain-flip@c-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141788v5/bat-adlp-7/igt@kms_flip@basic-plain-flip@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0 -&gt; xe-pw-141788v5</li>
</ul>
<p>IGT_8607: 8607<br />
  xe-4047-14d34ac35158252e94860f96b92b6778f95df1e0: 14d34ac35158252e94860f96b92b6778f95df1e0<br />
  xe-pw-141788v5: 141788v5</p>

</body>
</html>

--===============9188954246623982032==--
