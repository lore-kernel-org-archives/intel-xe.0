Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55EFC52D70
	for <intel-xe@archiver.kernel.org>; Tue,  6 Aug 2024 18:53:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA74410E079;
	Tue,  6 Aug 2024 18:53:43 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A4C510E028;
 Tue,  6 Aug 2024 18:53:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0274976780697725145=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pf=3A_Fix_VF_config_valid?=
 =?utf-8?q?ation_on_multi-GT_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Aug 2024 18:53:43 -0000
Message-ID: <172297042323.544132.7607324943322590875@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240806180516.618-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240806180516.618-1-michal.wajdeczko@intel.com>
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

--===============0274976780697725145==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Fix VF config validation on multi-GT platforms
URL   : https://patchwork.freedesktop.org/series/136944/
State : success

== Summary ==

CI Bug Log - changes from xe-1722-83eea64f81edb86ed3aa368039520810c154fd94_BAT -> xe-pw-136944v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136944v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#324]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1722-83eea64f81edb86ed3aa368039520810c154fd94 -> xe-pw-136944v1

  IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1722-83eea64f81edb86ed3aa368039520810c154fd94: 83eea64f81edb86ed3aa368039520810c154fd94
  xe-pw-136944v1: 136944v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/index.html

--===============0274976780697725145==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Fix VF config validation on multi-GT platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136944/">https://patchwork.freedesktop.org/series/136944/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1722-83eea64f81edb86ed3aa368039520810c154fd94_BAT -&gt; xe-pw-136944v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136944v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1722-83eea64f81edb86ed3aa368039520810c154fd94/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136944v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1722-83eea64f81edb86ed3aa368039520810c154fd94 -&gt; xe-pw-136944v1</li>
</ul>
<p>IGT_7958: 5e93c0e266d7ebd74ea12b3b03cb50253a2ab760 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1722-83eea64f81edb86ed3aa368039520810c154fd94: 83eea64f81edb86ed3aa368039520810c154fd94<br />
  xe-pw-136944v1: 136944v1</p>

</body>
</html>

--===============0274976780697725145==--
