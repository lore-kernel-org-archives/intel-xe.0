Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7CFCA0EEB
	for <intel-xe@archiver.kernel.org>; Thu, 21 Aug 2025 13:58:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C47E10E9A4;
	Thu, 21 Aug 2025 13:58:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F3C410E9A4;
 Thu, 21 Aug 2025 13:58:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1152212817692854937=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_replace_basename?=
 =?utf-8?q?=28=29_with_portable_strrchr=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Carlos Llamas" <cmllamas@google.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Aug 2025 13:58:24 -0000
Message-ID: <175578470411.257269.10944463952899573193@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250820201612.2549797-1-cmllamas@google.com>
In-Reply-To: <20250820201612.2549797-1-cmllamas@google.com>
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

--===============1152212817692854937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: replace basename() with portable strrchr()
URL   : https://patchwork.freedesktop.org/series/153291/
State : success

== Summary ==

CI Bug Log - changes from xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408_BAT -> xe-pw-153291v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153291v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +3 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-2}:        [FAIL][3] ([Intel XE#5783]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8501 -> IGT_8503
  * Linux: xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408 -> xe-pw-153291v1

  IGT_8501: 87027eb34ac38b8217351eeaa021aeae847b6b61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8503: 8503
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408
  xe-pw-153291v1: 153291v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/index.html

--===============1152212817692854937==
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
<tr><td><b>Series:</b></td><td>drm/xe: replace basename() with portable strrchr()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153291/">https://patchwork.freedesktop.org/series/153291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408_BAT -&gt; xe-pw-153291v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153291v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153291v1/bat-ptl-2/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8501 -&gt; IGT_8503</li>
<li>Linux: xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408 -&gt; xe-pw-153291v1</li>
</ul>
<p>IGT_8501: 87027eb34ac38b8217351eeaa021aeae847b6b61 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8503: 8503<br />
  xe-3591-16e133c7e6922a9f224b272a48ac172cf06e3408: 16e133c7e6922a9f224b272a48ac172cf06e3408<br />
  xe-pw-153291v1: 153291v1</p>

</body>
</html>

--===============1152212817692854937==--
