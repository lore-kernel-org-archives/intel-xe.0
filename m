Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AF9E77188
	for <intel-xe@archiver.kernel.org>; Wed,  8 Jan 2025 19:33:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE1710E433;
	Wed,  8 Jan 2025 19:33:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E783010E26B;
 Wed,  8 Jan 2025 19:33:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2741966044175409945=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_UAPI_support_for_low_la?=
 =?utf-8?q?tency_hint?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 Jan 2025 19:33:25 -0000
Message-ID: <173636480594.1386632.17783776223702101078@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250108150603.2995709-1-tejas.upadhyay@intel.com>
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

--===============2741966044175409945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add UAPI support for low latency hint
URL   : https://patchwork.freedesktop.org/series/143257/
State : success

== Summary ==

CI Bug Log - changes from xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48_BAT -> xe-pw-143257v1_BAT
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

  Here are the changes found in xe-pw-143257v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3958]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [DMESG-WARN][3] ([Intel XE#3958]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958


Build changes
-------------

  * Linux: xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 -> xe-pw-143257v1

  IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48: 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48
  xe-pw-143257v1: 143257v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/index.html

--===============2741966044175409945==
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
<tr><td><b>Series:</b></td><td>Add UAPI support for low latency hint</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143257/">https://patchwork.freedesktop.org/series/143257/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48_BAT -&gt; xe-pw-143257v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143257v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3958">Intel XE#3958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48 -&gt; xe-pw-143257v1</li>
</ul>
<p>IGT_8182: 8911eff2c6c06d2929c6072f3ba72d2d991985ea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2456-9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48: 9cbe590862ef629f35ce9f4c2dc5c0a6a4553f48<br />
  xe-pw-143257v1: 143257v1</p>

</body>
</html>

--===============2741966044175409945==--
