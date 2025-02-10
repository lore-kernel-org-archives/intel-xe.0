Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B93A2C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 06:09:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B2010E181;
	Mon, 10 Feb 2025 06:09:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0687C10E173;
 Mon, 10 Feb 2025 06:09:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9098400243881195719=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Carve_out_wopcm_p?=
 =?utf-8?q?ortion_from_the_stolen_memory?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Feb 2025 06:09:45 -0000
Message-ID: <173916778502.131652.17787946203298907693@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250207164334.1393054-1-nirmoy.das@intel.com>
In-Reply-To: <20250207164334.1393054-1-nirmoy.das@intel.com>
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

--===============9098400243881195719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Carve out wopcm portion from the stolen memory
URL   : https://patchwork.freedesktop.org/series/144520/
State : success

== Summary ==

CI Bug Log - changes from xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf_BAT -> xe-pw-144520v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-144520v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_exec_balancer@twice-parallel-userptr-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3970]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8226 -> IGT_8227
  * Linux: xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf -> xe-pw-144520v1

  IGT_8226: 8226
  IGT_8227: 8227
  xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf: a41e6e9737b361dd14863a08bbf72045e4ccfadf
  xe-pw-144520v1: 144520v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/index.html

--===============9098400243881195719==
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
<tr><td><b>Series:</b></td><td>drm/xe: Carve out wopcm portion from the stolen memory</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144520/">https://patchwork.freedesktop.org/series/144520/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf_BAT -&gt; xe-pw-144520v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144520v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-parallel-userptr-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144520v1/bat-adlp-vf/igt@xe_exec_balancer@twice-parallel-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8226 -&gt; IGT_8227</li>
<li>Linux: xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf -&gt; xe-pw-144520v1</li>
</ul>
<p>IGT_8226: 8226<br />
  IGT_8227: 8227<br />
  xe-2616-a41e6e9737b361dd14863a08bbf72045e4ccfadf: a41e6e9737b361dd14863a08bbf72045e4ccfadf<br />
  xe-pw-144520v1: 144520v1</p>

</body>
</html>

--===============9098400243881195719==--
