Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C44DE65D29
	for <intel-xe@archiver.kernel.org>; Fri, 22 Nov 2024 06:15:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C908B10E213;
	Fri, 22 Nov 2024 06:15:42 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D03B10E213;
 Fri, 22 Nov 2024 06:15:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8702472519697874818=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3lpg=3A_Add_Wa=5F1?=
 =?utf-8?q?6024792527_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Apoorva Singh" <apoorva.singh@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 22 Nov 2024 06:15:42 -0000
Message-ID: <173225614220.1590355.18103708088889688785@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241107082158.1436637-1-apoorva.singh@intel.com>
In-Reply-To: <20241107082158.1436637-1-apoorva.singh@intel.com>
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

--===============8702472519697874818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3lpg: Add Wa_16024792527 (rev7)
URL   : https://patchwork.freedesktop.org/series/140666/
State : success

== Summary ==

CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_BAT -> xe-pw-140666v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-140666v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#1861])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [PASS][3] -> [SKIP][4] ([Intel XE#455]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  * igt@kms_psr@psr-primary-page-flip@edp-1:
    - bat-adlp-7:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#3517]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][7] ([Intel XE#3429]) -> [PASS][8] +31 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#3429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -> xe-pw-140666v7

  IGT_8121: 8121
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199
  xe-pw-140666v7: 140666v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html

--===============8702472519697874818==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3lpg: Add Wa_16024792527 (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140666/">https://patchwork.freedesktop.org/series/140666/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199_BAT -&gt; xe-pw-140666v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140666v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip@edp-1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_psr@psr-primary-page-flip@edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_addfb_basic@bad-pitch-0:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3429">Intel XE#3429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140666v7/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199 -&gt; xe-pw-140666v7</li>
</ul>
<p>IGT_8121: 8121<br />
  xe-2259-bb17c42521f57b592e9ad49daca1f9f9045d3199: bb17c42521f57b592e9ad49daca1f9f9045d3199<br />
  xe-pw-140666v7: 140666v7</p>

</body>
</html>

--===============8702472519697874818==--
