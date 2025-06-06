Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71E12C5B543
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 02:39:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CBB110E98E;
	Fri,  6 Jun 2025 02:39:15 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6327110E98E;
 Fri,  6 Jun 2025 02:39:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6399699273242719832=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_GSM_size_should_b?=
 =?utf-8?q?e_constant_on_most_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 02:39:13 -0000
Message-ID: <174917755339.53928.3009958737430091134@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605225352.2333981-2-matthew.d.roper@intel.com>
In-Reply-To: <20250605225352.2333981-2-matthew.d.roper@intel.com>
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

--===============6399699273242719832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: GSM size should be constant on most platforms
URL   : https://patchwork.freedesktop.org/series/149907/
State : success

== Summary ==

CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -> xe-pw-149907v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8398 -> IGT_8399
  * Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -> xe-pw-149907v1

  IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8399: 4cb969fb8e5a8a6319e1585ad71e73c786643794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7
  xe-pw-149907v1: 149907v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/index.html

--===============6399699273242719832==
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
<tr><td><b>Series:</b></td><td>drm/xe: GSM size should be constant on most platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149907/">https://patchwork.freedesktop.org/series/149907/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149907v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7_BAT -&gt; xe-pw-149907v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8398 -&gt; IGT_8399</li>
<li>Linux: xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7 -&gt; xe-pw-149907v1</li>
</ul>
<p>IGT_8398: 82be96b2ac16dd680618f1fd3d3ed073b88da3ee @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8399: 4cb969fb8e5a8a6319e1585ad71e73c786643794 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3203-308a53b9affc92eca9eaa6117dd62c79d5419ce7: 308a53b9affc92eca9eaa6117dd62c79d5419ce7<br />
  xe-pw-149907v1: 149907v1</p>

</body>
</html>

--===============6399699273242719832==--
