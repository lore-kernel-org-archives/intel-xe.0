Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD84BCAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 20:55:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D73D10E07F;
	Mon, 22 Sep 2025 20:55:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4333210E07F;
 Mon, 22 Sep 2025 20:55:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8309073572015233470=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiBVc2UgcG9sbF90aW1l?=
 =?utf-8?b?b3V0X3VzKCkgKHJldjUp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 20:55:15 -0000
Message-ID: <175857451526.355661.13858636116855016885@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
In-Reply-To: <20250922-xe-iopoll-v4-0-06438311a63f@intel.com>
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

--===============8309073572015233470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use poll_timeout_us() (rev5)
URL   : https://patchwork.freedesktop.org/series/153671/
State : success

== Summary ==

CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_BAT -> xe-pw-153671v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 

Known issues
------------

  Here are the changes found in xe-pw-153671v5_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#6201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6201


Build changes
-------------

  * IGT: IGT_8547 -> IGT_8548
  * Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -> xe-pw-153671v5

  IGT_8547: 8547
  IGT_8548: 8548
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1
  xe-pw-153671v5: 153671v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v5/index.html

--===============8309073572015233470==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use poll_timeout_us() (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153671/">https://patchwork.freedesktop.org/series/153671/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153671v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_BAT -&gt; xe-pw-153671v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153671v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8547 -&gt; IGT_8548</li>
<li>Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -&gt; xe-pw-153671v5</li>
</ul>
<p>IGT_8547: 8547<br />
  IGT_8548: 8548<br />
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1<br />
  xe-pw-153671v5: 153671v5</p>

</body>
</html>

--===============8309073572015233470==--
