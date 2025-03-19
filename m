Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A6ADC35FFA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Mar 2025 17:19:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E13E110E55D;
	Wed, 19 Mar 2025 17:19:35 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B2D310E55C;
 Wed, 19 Mar 2025 17:19:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7626239638886079235=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Apply_Wa=5F160231?=
 =?utf-8?q?05232_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Mar 2025 17:19:35 -0000
Message-ID: <174240477517.54989.4320880763555507025@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250317184203.2213175-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250317184203.2213175-1-vinay.belgaumkar@intel.com>
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

--===============7626239638886079235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply Wa_16023105232 (rev8)
URL   : https://patchwork.freedesktop.org/series/145449/
State : success

== Summary ==

CI Bug Log - changes from xe-2825-a958e31a81b3267201c85b6f171419586afa792c_BAT -> xe-pw-145449v8_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-145449v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145449v8/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8275 -> IGT_8276
  * Linux: xe-2825-a958e31a81b3267201c85b6f171419586afa792c -> xe-pw-145449v8

  IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8276: 8276
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c
  xe-pw-145449v8: 145449v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145449v8/index.html

--===============7626239638886079235==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply Wa_16023105232 (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145449/">https://patchwork.freedesktop.org/series/145449/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145449v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145449v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2825-a958e31a81b3267201c85b6f171419586afa792c_BAT -&gt; xe-pw-145449v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145449v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2825-a958e31a81b3267201c85b6f171419586afa792c/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145449v8/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8275 -&gt; IGT_8276</li>
<li>Linux: xe-2825-a958e31a81b3267201c85b6f171419586afa792c -&gt; xe-pw-145449v8</li>
</ul>
<p>IGT_8275: a851348546d61620c263d3292148f67620efa7d0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8276: 8276<br />
  xe-2825-a958e31a81b3267201c85b6f171419586afa792c: a958e31a81b3267201c85b6f171419586afa792c<br />
  xe-pw-145449v8: 145449v8</p>

</body>
</html>

--===============7626239638886079235==--
