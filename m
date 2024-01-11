Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C19C47073
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jan 2024 01:48:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C9410E078;
	Thu, 11 Jan 2024 01:48:02 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A173E10E078;
 Thu, 11 Jan 2024 01:48:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2583638536798546493=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/guc=3A_Use_HXG_definitions_on_HXG_messages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Thu, 11 Jan 2024 01:48:00 -0000
Message-ID: <170493768065.270358.7537568495258072960@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240110195951.453-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240110195951.453-1-michal.wajdeczko@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2583638536798546493==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc: Use HXG definitions on HXG messages
URL   : https://patchwork.freedesktop.org/series/128448/
State : success

== Summary ==

CI Bug Log - changes from xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6_BAT -> xe-pw-128448v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-128448v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][1] ([Intel XE#1033]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128448v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033


Build changes
-------------

  * Linux: xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6 -> xe-pw-128448v1

  IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6: f68ed4a84712556c70fa649ef0db05d3c2d091e6
  xe-pw-128448v1: 128448v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128448v1/index.html

--===============2583638536798546493==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc: Use HXG definitions on HXG messages</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128448/">https://patchwork.freedesktop.org/series/128448/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128448v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128448v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6_BAT -&gt; xe-pw-128448v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128448v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128448v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6 -&gt; xe-pw-128448v1</li>
</ul>
<p>IGT_7668: 3f2879fef93c0c546a2f1c0aa48a9cc2a594b9d2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-615-f68ed4a84712556c70fa649ef0db05d3c2d091e6: f68ed4a84712556c70fa649ef0db05d3c2d091e6<br />
  xe-pw-128448v1: 128448v1</p>

</body>
</html>

--===============2583638536798546493==--
