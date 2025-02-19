Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD63C021AA
	for <intel-xe@archiver.kernel.org>; Wed, 19 Feb 2025 16:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49BC10E4A6;
	Wed, 19 Feb 2025 16:23:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB23C10E159;
 Wed, 19 Feb 2025 16:23:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3778593344331075988=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/display=3A_Fix_fbdev?=
 =?utf-8?q?_GGTT_mapping_handling=2E_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Feb 2025 16:23:04 -0000
Message-ID: <173998218475.4028506.3793305284689510224@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219153441.625352-1-dev@lankhorst.se>
In-Reply-To: <20250219153441.625352-1-dev@lankhorst.se>
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

--===============3778593344331075988==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Fix fbdev GGTT mapping handling. (rev5)
URL   : https://patchwork.freedesktop.org/series/144602/
State : success

== Summary ==

CI Bug Log - changes from xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7_BAT -> xe-pw-144602v5_BAT
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

  Here are the changes found in xe-pw-144602v5_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2] ([Intel XE#3970]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [DMESG-WARN][3] ([Intel XE#877]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [DMESG-FAIL][5] ([Intel XE#3868]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7 -> xe-pw-144602v5

  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7: 2050e0325a3fa692d86d64e8d05d10b6959166d7
  xe-pw-144602v5: 144602v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/index.html

--===============3778593344331075988==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Fix fbdev GGTT mapping handling. (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144602/">https://patchwork.freedesktop.org/series/144602/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7_BAT -&gt; xe-pw-144602v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144602v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144602v5/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7 -&gt; xe-pw-144602v5</li>
</ul>
<p>IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2688-2050e0325a3fa692d86d64e8d05d10b6959166d7: 2050e0325a3fa692d86d64e8d05d10b6959166d7<br />
  xe-pw-144602v5: 144602v5</p>

</body>
</html>

--===============3778593344331075988==--
