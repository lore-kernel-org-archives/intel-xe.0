Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9413606A32D
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 06:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7836710E58F;
	Mon,  2 Nov 2026 06:06:19 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 357D310EB52;
 Mon,  2 Nov 2026 06:06:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6728314424212675642=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_gpu/buddy=3A_Fix_quadratic_?=
 =?utf-8?q?cost_of_range-biased_allocation_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Nov 2026 06:06:18 -0000
Message-ID: <179359957821.100280.14198889922704457287@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20261102051633.2035348-3-sanjay.kumar.yadav@intel.com>
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

--===============6728314424212675642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: Fix quadratic cost of range-biased allocation (rev5)
URL   : https://patchwork.freedesktop.org/series/175945/
State : failure

== Summary ==

CI Bug Log - changes from xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28_BAT -> xe-pw-175945v5_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175945v5_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175945v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175945v5_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - bat-lnl-1:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-lnl-1/igt@runner@aborted.html
    - bat-bmg-2:          NOTRUN -> [FAIL][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-2/igt@runner@aborted.html
    - bat-adlp-7:         NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-adlp-7/igt@runner@aborted.html
    - bat-lnl-2:          NOTRUN -> [FAIL][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-lnl-2/igt@runner@aborted.html
    - bat-atsm-2:         NOTRUN -> [FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-atsm-2/igt@runner@aborted.html
    - bat-wcl-2:          NOTRUN -> [FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-wcl-2/igt@runner@aborted.html
    - bat-bmg-1:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-1/igt@runner@aborted.html
    - bat-nvls-1:         NOTRUN -> [FAIL][8]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-nvls-1/igt@runner@aborted.html
    - bat-nvls-2:         NOTRUN -> [FAIL][9]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-nvls-2/igt@runner@aborted.html
    - bat-bmg-3:          NOTRUN -> [FAIL][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-3/igt@runner@aborted.html
    - bat-wcl-1:          NOTRUN -> [FAIL][11]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-wcl-1/igt@runner@aborted.html

  
Known issues
------------

  Here are the changes found in xe-pw-175945v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@runner@aborted:
    - bat-ptl-1:          NOTRUN -> [FAIL][12] ([Intel XE#9694])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-ptl-1/igt@runner@aborted.html
    - bat-ptl-2:          NOTRUN -> [FAIL][13] ([Intel XE#9694])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-ptl-2/igt@runner@aborted.html

  
  [Intel XE#9694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694


Build changes
-------------

  * Linux: xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28 -> xe-pw-175945v5

  IGT_9173: 9173
  xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28: e381c39629d83fbe9de2c94a98a2bbb0b875cf28
  xe-pw-175945v5: 175945v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/index.html

--===============6728314424212675642==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: Fix quadratic cost of range-biased allocation (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175945/">https://patchwork.freedesktop.org/series/175945/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28_BAT -&gt; xe-pw-175945v5_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175945v5_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-175945v5_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-175945v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-lnl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-lnl-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-bmg-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-adlp-7/igt@runner@aborted.html">FAIL</a></li>
<li>bat-lnl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-lnl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-atsm-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-wcl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-wcl-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-bmg-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-nvls-1:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-nvls-1/igt@runner@aborted.html">FAIL</a></li>
<li>bat-nvls-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-nvls-2/igt@runner@aborted.html">FAIL</a></li>
<li>bat-bmg-3:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-bmg-3/igt@runner@aborted.html">FAIL</a></li>
<li>bat-wcl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-wcl-1/igt@runner@aborted.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175945v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@runner@aborted:<ul>
<li>bat-ptl-1:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-ptl-1/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694">Intel XE#9694</a>)</li>
<li>bat-ptl-2:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v5/bat-ptl-2/igt@runner@aborted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9694">Intel XE#9694</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28 -&gt; xe-pw-175945v5</li>
</ul>
<p>IGT_9173: 9173<br />
  xe-6038-e381c39629d83fbe9de2c94a98a2bbb0b875cf28: e381c39629d83fbe9de2c94a98a2bbb0b875cf28<br />
  xe-pw-175945v5: 175945v5</p>

</body>
</html>

--===============6728314424212675642==--
