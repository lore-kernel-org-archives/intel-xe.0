Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCEAFC3A59D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Apr 2024 23:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60FEA10EB02;
	Fri,  5 Apr 2024 23:12:12 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1F110EB02;
 Fri,  5 Apr 2024 23:12:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3379206880721121862=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_double_mut?=
 =?utf-8?q?ex_initialization?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Apr 2024 23:12:09 -0000
Message-ID: <171235872981.1239329.17097832262710113266@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240405200711.2041428-1-lucas.demarchi@intel.com>
In-Reply-To: <20240405200711.2041428-1-lucas.demarchi@intel.com>
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

--===============3379206880721121862==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix double mutex initialization
URL   : https://patchwork.freedesktop.org/series/132101/
State : success

== Summary ==

CI Bug Log - changes from xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d_BAT -> xe-pw-132101v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-132101v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_live_ktest@xe_bo:
    - bat-dg2-oem2:       [FAIL][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132101v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html

  


Build changes
-------------

  * Linux: xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d -> xe-pw-132101v1

  IGT_7801: 7801
  xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d: 11155f150a41d028c6ac7a141924fd4c8798721d
  xe-pw-132101v1: 132101v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132101v1/index.html

--===============3379206880721121862==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix double mutex initialization</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132101/">https://patchwork.freedesktop.org/series/132101/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132101v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132101v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d_BAT -&gt; xe-pw-132101v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132101v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132101v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d -&gt; xe-pw-132101v1</li>
</ul>
<p>IGT_7801: 7801<br />
  xe-1049-11155f150a41d028c6ac7a141924fd4c8798721d: 11155f150a41d028c6ac7a141924fd4c8798721d<br />
  xe-pw-132101v1: 132101v1</p>

</body>
</html>

--===============3379206880721121862==--
