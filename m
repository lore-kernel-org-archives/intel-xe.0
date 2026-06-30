Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1911C43602
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jun 2026 12:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E6D510E1E1;
	Tue, 30 Jun 2026 12:56:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16BAF10E1EE;
 Tue, 30 Jun 2026 12:56:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6849222634430093140=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_split_MM_and_?=
 =?utf-8?q?device_state_across_gpusvm/range/pages_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Jun 2026 12:56:17 -0000
Message-ID: <178282417708.133156.14600288853465568616@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260630102127.392396-1-honghuan@amd.com>
In-Reply-To: <20260630102127.392396-1-honghuan@amd.com>
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

--===============6849222634430093140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: split MM and device state across gpusvm/range/pages (rev7)
URL   : https://patchwork.freedesktop.org/series/169384/
State : success

== Summary ==

CI Bug Log - changes from xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f_BAT -> xe-pw-169384v7_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-169384v7_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_query@multigpu-query-cs-cycles:
    - bat-bmg-3:          [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169384v7/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html

  


Build changes
-------------

  * Linux: xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f -> xe-pw-169384v7

  IGT_8988: 8988
  xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f
  xe-pw-169384v7: 169384v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169384v7/index.html

--===============6849222634430093140==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: split MM and device state across gpusvm/range/pages (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169384/">https://patchwork.freedesktop.org/series/169384/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169384v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169384v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f_BAT -&gt; xe-pw-169384v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169384v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_query@multigpu-query-cs-cycles:<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169384v7/bat-bmg-3/igt@xe_query@multigpu-query-cs-cycles.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f -&gt; xe-pw-169384v7</li>
</ul>
<p>IGT_8988: 8988<br />
  xe-5309-a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f: a2d82f27ac35c691c1c65b40c72b13d8b2a7f91f<br />
  xe-pw-169384v7: 169384v7</p>

</body>
</html>

--===============6849222634430093140==--
