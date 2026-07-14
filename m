Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E98BC43458
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jul 2026 01:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C848710EB9A;
	Tue, 14 Jul 2026 01:56:25 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB02410E5DE;
 Tue, 14 Jul 2026 01:56:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7993545747082335773=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe=3A_Track_exec_queue_priority_band_counts_for_user_VMs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jul 2026 01:56:24 -0000
Message-ID: <178399418482.186082.13328406367825187243@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260713234606.3367215-1-matthew.brost@intel.com>
In-Reply-To: <20260713234606.3367215-1-matthew.brost@intel.com>
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

--===============7993545747082335773==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Track exec queue priority band counts for user VMs
URL   : https://patchwork.freedesktop.org/series/170363/
State : success

== Summary ==

CI Bug Log - changes from xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc_BAT -> xe-pw-170363v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 

Known issues
------------

  Here are the changes found in xe-pw-170363v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-atsm-2:         [FAIL][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc/bat-atsm-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170363v1/bat-atsm-2/igt@xe_waitfence@engine.html

  


Build changes
-------------

  * Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -> xe-pw-170363v1

  IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc
  xe-pw-170363v1: 170363v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170363v1/index.html

--===============7993545747082335773==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Track exec queue priority band counts for user VMs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170363/">https://patchwork.freedesktop.org/series/170363/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170363v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170363v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc_BAT -&gt; xe-pw-170363v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-170363v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc/bat-atsm-2/igt@xe_waitfence@engine.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170363v1/bat-atsm-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc -&gt; xe-pw-170363v1</li>
</ul>
<p>IGT_9005: 5d0cdd6f2f5d3ad4992da1edf67f22622a8bb153 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5397-4df02bb6acd1307de4de001699112cbdaf5afdfc: 4df02bb6acd1307de4de001699112cbdaf5afdfc<br />
  xe-pw-170363v1: 170363v1</p>

</body>
</html>

--===============7993545747082335773==--
