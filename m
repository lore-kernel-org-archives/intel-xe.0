Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D4CC36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 23:33:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E37110E345;
	Fri,  4 Apr 2025 23:33:20 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7DE10E345;
 Fri,  4 Apr 2025 23:33:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8728744228007520186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Ensure_XE=5FBO=5F?=
 =?utf-8?q?FLAG=5FCPU=5FADDR=5FMIRROR_has_a_unique_value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 23:33:18 -0000
Message-ID: <174380959877.39857.16410988368006236990@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250404220053.1758356-2-matthew.d.roper@intel.com>
In-Reply-To: <20250404220053.1758356-2-matthew.d.roper@intel.com>
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

--===============8728744228007520186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value
URL   : https://patchwork.freedesktop.org/series/147286/
State : success

== Summary ==

CI Bug Log - changes from xe-2907-ebade66890117778809714085d5151b0050488a8_BAT -> xe-pw-147286v1_BAT
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

  Here are the changes found in xe-pw-147286v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_basic@twice-bindexecqueue-rebind:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2907-ebade66890117778809714085d5151b0050488a8/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147286v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2907-ebade66890117778809714085d5151b0050488a8 -> xe-pw-147286v1

  IGT_8309: fb77fb2d8d58a2539c9d67d00e1747351eec0bea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2907-ebade66890117778809714085d5151b0050488a8: ebade66890117778809714085d5151b0050488a8
  xe-pw-147286v1: 147286v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147286v1/index.html

--===============8728744228007520186==
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
<tr><td><b>Series:</b></td><td>drm/xe: Ensure XE_BO_FLAG_CPU_ADDR_MIRROR has a unique value</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147286/">https://patchwork.freedesktop.org/series/147286/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147286v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147286v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2907-ebade66890117778809714085d5151b0050488a8_BAT -&gt; xe-pw-147286v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147286v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_basic@twice-bindexecqueue-rebind:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2907-ebade66890117778809714085d5151b0050488a8/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147286v1/bat-adlp-vf/igt@xe_exec_basic@twice-bindexecqueue-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2907-ebade66890117778809714085d5151b0050488a8 -&gt; xe-pw-147286v1</li>
</ul>
<p>IGT_8309: fb77fb2d8d58a2539c9d67d00e1747351eec0bea @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2907-ebade66890117778809714085d5151b0050488a8: ebade66890117778809714085d5151b0050488a8<br />
  xe-pw-147286v1: 147286v1</p>

</body>
</html>

--===============8728744228007520186==--
