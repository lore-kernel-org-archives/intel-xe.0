Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F3F7CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 18:08:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69D610EB79;
	Thu, 11 Sep 2025 18:08:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E2910EB79;
 Thu, 11 Sep 2025 18:08:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1997785646005749027=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgcG9sbF90aW1l?=
 =?utf-8?b?b3V0X3VzKCkgKHJldjQp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 18:08:27 -0000
Message-ID: <175761410715.327749.658595335337368231@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
In-Reply-To: <20250911-xe-iopoll-v3-0-6a95f1cc3b0b@intel.com>
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

--===============1997785646005749027==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use poll_timeout_us() (rev4)
URL   : https://patchwork.freedesktop.org/series/153671/
State : success

== Summary ==

CI Bug Log - changes from xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8_BAT -> xe-pw-153671v4_BAT
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

  Here are the changes found in xe-pw-153671v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][1] ([Intel XE#5783]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8 -> xe-pw-153671v4

  IGT_8535: 8535
  xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8: 6383690b59fb31f52a5932aab3a9963265e86fc8
  xe-pw-153671v4: 153671v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html

--===============1997785646005749027==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use poll_timeout_us() (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153671/">https://patchwork.freedesktop.org/series/153671/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8_BAT -&gt; xe-pw-153671v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153671v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@bind-execqueues-independent:<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v4/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8 -&gt; xe-pw-153671v4</li>
</ul>
<p>IGT_8535: 8535<br />
  xe-3727-6383690b59fb31f52a5932aab3a9963265e86fc8: 6383690b59fb31f52a5932aab3a9963265e86fc8<br />
  xe-pw-153671v4: 153671v4</p>

</body>
</html>

--===============1997785646005749027==--
