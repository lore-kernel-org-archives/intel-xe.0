Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC82606A323
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 23:03:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F312A10E6E4;
	Thu, 12 Nov 2026 23:03:07 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446F110E6C7;
 Thu, 12 Nov 2026 23:03:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0694509611483064344=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Add_sysfs_to_disa?=
 =?utf-8?q?ble_RPe_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 23:03:06 -0000
Message-ID: <179452458627.17681.2764983192284988152@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112222159.3862116-2-vinay.belgaumkar@intel.com>
In-Reply-To: <20261112222159.3862116-2-vinay.belgaumkar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0694509611483064344==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add sysfs to disable RPe (rev2)
URL   : https://patchwork.freedesktop.org/series/178352/
State : failure

== Summary ==

CI Bug Log - changes from xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca_BAT -> xe-pw-178352v2_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-178352v2_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-178352v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-178352v2_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_gt_freq@freq_basic_api:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html
    - bat-atsm-2:         [PASS][3] -> [FAIL][4] +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-wcl-2:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-wcl-2/igt@xe_gt_freq@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-wcl-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-nvls-1:         [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-nvls-1/igt@xe_gt_freq@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-nvls-1/igt@xe_gt_freq@freq_basic_api.html
    - bat-lnl-2:          [PASS][9] -> [FAIL][10] +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-nvls-2:         [PASS][11] -> [FAIL][12] +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-nvls-2/igt@xe_gt_freq@freq_basic_api.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-nvls-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-ptl-2:          [PASS][13] -> [FAIL][14] +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-ptl-2/igt@xe_gt_freq@freq_basic_api.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-ptl-2/igt@xe_gt_freq@freq_basic_api.html
    - bat-wcl-1:          [PASS][15] -> [FAIL][16] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-wcl-1/igt@xe_gt_freq@freq_basic_api.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-wcl-1/igt@xe_gt_freq@freq_basic_api.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - bat-ptl-1:          [PASS][17] -> [FAIL][18] +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-ptl-1/igt@xe_gt_freq@freq_fixed_idle.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-ptl-1/igt@xe_gt_freq@freq_fixed_idle.html
    - bat-lnl-1:          [PASS][19] -> [FAIL][20] +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html

  


Build changes
-------------

  * Linux: xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca -> xe-pw-178352v2

  IGT_9189: 9189
  xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca: 4b7f549c713601ea1dabb0b949ab3b3d883e49ca
  xe-pw-178352v2: 178352v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/index.html

--===============0694509611483064344==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add sysfs to disable RPe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178352/">https://patchwork.freedesktop.org/series/178352/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca_BAT -&gt; xe-pw-178352v2_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-178352v2_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-178352v2_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-178352v2_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-adlp-7/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +2 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-atsm-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-wcl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-wcl-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-nvls-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-nvls-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-lnl-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-nvls-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-nvls-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-ptl-2/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-ptl-2/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-wcl-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-wcl-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-ptl-1/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-ptl-1/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> +1 other test fail</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178352v2/bat-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca -&gt; xe-pw-178352v2</li>
</ul>
<p>IGT_9189: 9189<br />
  xe-6130-4b7f549c713601ea1dabb0b949ab3b3d883e49ca: 4b7f549c713601ea1dabb0b949ab3b3d883e49ca<br />
  xe-pw-178352v2: 178352v2</p>

</body>
</html>

--===============0694509611483064344==--
