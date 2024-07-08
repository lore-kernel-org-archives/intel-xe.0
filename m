Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1193C3271E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jul 2024 11:58:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C3EB10E251;
	Mon,  8 Jul 2024 11:58:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AC9110E251;
 Mon,  8 Jul 2024 11:58:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4021269741515167905=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/kunit=3A_Simplify_live_te?=
 =?utf-8?q?sts_code_layout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 08 Jul 2024 11:58:09 -0000
Message-ID: <172043988949.49295.6587896475962966211@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240708111210.1154-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240708111210.1154-1-michal.wajdeczko@intel.com>
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

--===============4021269741515167905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/kunit: Simplify live tests code layout
URL   : https://patchwork.freedesktop.org/series/135839/
State : success

== Summary ==

CI Bug Log - changes from xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf_BAT -> xe-pw-135839v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-atsm-2 

Known issues
------------

  Here are the changes found in xe-pw-135839v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][1] -> [DMESG-FAIL][2] ([Intel XE#324])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * IGT: IGT_7918 -> IGT_7919
  * Linux: xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf -> xe-pw-135839v1

  IGT_7918: aab1a4b6a9b7855fe6e38ea3b3987a1399ee5816 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf: 414cc5961337b50dd261349b4ed7aa0013044ccf
  xe-pw-135839v1: 135839v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/index.html

--===============4021269741515167905==
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
<tr><td><b>Series:</b></td><td>drm/xe/kunit: Simplify live tests code layout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135839/">https://patchwork.freedesktop.org/series/135839/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf_BAT -&gt; xe-pw-135839v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135839v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135839v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7918 -&gt; IGT_7919</li>
<li>Linux: xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf -&gt; xe-pw-135839v1</li>
</ul>
<p>IGT_7918: aab1a4b6a9b7855fe6e38ea3b3987a1399ee5816 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7919: 2c50c98273c55882bdc209fed77d0e40b24431f1 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1570-414cc5961337b50dd261349b4ed7aa0013044ccf: 414cc5961337b50dd261349b4ed7aa0013044ccf<br />
  xe-pw-135839v1: 135839v1</p>

</body>
</html>

--===============4021269741515167905==--
