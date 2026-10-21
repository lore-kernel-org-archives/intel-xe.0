Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307A6606A319
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 10:50:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F064810E07A;
	Wed, 21 Oct 2026 10:50:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDB710F9A6;
 Wed, 21 Oct 2026 10:50:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1337311620820163426=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe=3A_Isolate_wedged_de?=
 =?utf-8?q?vices_from_hardware_access_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 10:50:30 -0000
Message-ID: <179257983017.51939.11232632895611673852@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021100322.1014449-1-arvind.yadav@intel.com>
In-Reply-To: <20261021100322.1014449-1-arvind.yadav@intel.com>
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

--===============1337311620820163426==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Isolate wedged devices from hardware access (rev3)
URL   : https://patchwork.freedesktop.org/series/172860/
State : failure

== Summary ==

CI Bug Log - changes from xe-5986-f3bbda7128124e54c4881b56958249a18d79a110_BAT -> xe-pw-172860v3_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172860v3_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172860v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172860v3_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-2:          [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-2:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-bmg-1:          [PASS][7] -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-1:         [PASS][9] -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-2:          [PASS][11] -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-2:         [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][15] -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-1:          [PASS][17] -> [DMESG-WARN][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-ptl-1:          [PASS][19] -> [DMESG-WARN][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html
    - bat-wcl-2:          [PASS][21] -> [DMESG-WARN][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html
    - bat-lnl-1:          [PASS][23] -> [DMESG-WARN][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  


Build changes
-------------

  * Linux: xe-5986-f3bbda7128124e54c4881b56958249a18d79a110 -> xe-pw-172860v3

  IGT_9156: 9156
  xe-5986-f3bbda7128124e54c4881b56958249a18d79a110: f3bbda7128124e54c4881b56958249a18d79a110
  xe-pw-172860v3: 172860v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/index.html

--===============1337311620820163426==
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
<tr><td><b>Series:</b></td><td>drm/xe: Isolate wedged devices from hardware access (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172860/">https://patchwork.freedesktop.org/series/172860/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5986-f3bbda7128124e54c4881b56958249a18d79a110_BAT -&gt; xe-pw-172860v3_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172860v3_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172860v3_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172860v3_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-ptl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-bmg-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-lnl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-nvls-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-nvls-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-wcl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-ptl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-wcl-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5986-f3bbda7128124e54c4881b56958249a18d79a110/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172860v3/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5986-f3bbda7128124e54c4881b56958249a18d79a110 -&gt; xe-pw-172860v3</li>
</ul>
<p>IGT_9156: 9156<br />
  xe-5986-f3bbda7128124e54c4881b56958249a18d79a110: f3bbda7128124e54c4881b56958249a18d79a110<br />
  xe-pw-172860v3: 172860v3</p>

</body>
</html>

--===============1337311620820163426==--
