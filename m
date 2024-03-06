Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD94DC5475B
	for <intel-xe@archiver.kernel.org>; Wed,  6 Mar 2024 13:11:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B5BF113186;
	Wed,  6 Mar 2024 13:11:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E38113186;
 Wed,  6 Mar 2024 13:11:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6814021442854001069=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_better_high_level_ab?=
 =?utf-8?q?straction_for_display?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 06 Mar 2024 13:11:16 -0000
Message-ID: <170973067648.561237.12235572552633546552@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1709727127.git.jani.nikula@intel.com>
In-Reply-To: <cover.1709727127.git.jani.nikula@intel.com>
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

--===============6814021442854001069==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: better high level abstraction for display
URL   : https://patchwork.freedesktop.org/series/130804/
State : success

== Summary ==

CI Bug Log - changes from xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4_BAT -> xe-pw-130804v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7747 -> IGT_7749
  * Linux: xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4 -> xe-pw-130804v1

  IGT_7747: 7747
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4: 6e50187af603728329f9d3c3a53ad162d7eda9a4
  xe-pw-130804v1: 130804v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v1/index.html

--===============6814021442854001069==
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
<tr><td><b>Series:</b></td><td>drm/i915: better high level abstraction for display</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130804/">https://patchwork.freedesktop.org/series/130804/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130804v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4_BAT -&gt; xe-pw-130804v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7747 -&gt; IGT_7749</li>
<li>Linux: xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4 -&gt; xe-pw-130804v1</li>
</ul>
<p>IGT_7747: 7747<br />
  IGT_7749: 2fd91b8c3cf9aa2b0bb78537a6b5e2bc3de50e0e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-906-6e50187af603728329f9d3c3a53ad162d7eda9a4: 6e50187af603728329f9d3c3a53ad162d7eda9a4<br />
  xe-pw-130804v1: 130804v1</p>

</body>
</html>

--===============6814021442854001069==--
