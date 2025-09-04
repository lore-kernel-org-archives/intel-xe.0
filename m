Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 945A2CA1012
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 11:30:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5713910EA02;
	Thu,  4 Sep 2025 11:30:30 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D0A10EA02;
 Thu,  4 Sep 2025 11:30:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0814677053274285488=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Allow_to_filter-out_some_co?=
 =?utf-8?q?nfigfs_attrs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 11:30:29 -0000
Message-ID: <175698542974.303281.15067008421163586817@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
In-Reply-To: <20250902131744.5076-1-michal.wajdeczko@intel.com>
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

--===============0814677053274285488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Allow to filter-out some configfs attrs (rev2)
URL   : https://patchwork.freedesktop.org/series/153882/
State : success

== Summary ==

CI Bug Log - changes from xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7_BAT -> xe-pw-153882v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-153882v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-1:          [PASS][1] -> [FAIL][2] ([Intel XE#5507]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#4543]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][5] ([Intel XE#5783]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7 -> xe-pw-153882v2

  IGT_8522: 8522
  xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7: 76dbb37ec196e36c129b63b102b4884c90506bd7
  xe-pw-153882v2: 153882v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/index.html

--===============0814677053274285488==
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
<tr><td><b>Series:</b></td><td>Allow to filter-out some configfs attrs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153882/">https://patchwork.freedesktop.org/series/153882/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7_BAT -&gt; xe-pw-153882v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153882v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-bmg-1/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5507">Intel XE#5507</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153882v2/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7 -&gt; xe-pw-153882v2</li>
</ul>
<p>IGT_8522: 8522<br />
  xe-3676-76dbb37ec196e36c129b63b102b4884c90506bd7: 76dbb37ec196e36c129b63b102b4884c90506bd7<br />
  xe-pw-153882v2: 153882v2</p>

</body>
</html>

--===============0814677053274285488==--
