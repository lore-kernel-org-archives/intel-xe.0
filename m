Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15775CCD184
	for <intel-xe@archiver.kernel.org>; Thu,  9 Oct 2025 14:46:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86C110EA7A;
	Thu,  9 Oct 2025 14:46:24 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769DC10EA7A;
 Thu,  9 Oct 2025 14:46:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2389918902212302586=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Handle_mixed_mapp?=
 =?utf-8?q?ings_and_existing_VRAM_on_atomic_faults?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Oct 2025 14:46:23 -0000
Message-ID: <176002118347.22984.9592925293921838143@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009130629.3531962-1-matthew.brost@intel.com>
In-Reply-To: <20251009130629.3531962-1-matthew.brost@intel.com>
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

--===============2389918902212302586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Handle mixed mappings and existing VRAM on atomic faults
URL   : https://patchwork.freedesktop.org/series/155684/
State : success

== Summary ==

CI Bug Log - changes from xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb_BAT -> xe-pw-155684v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 10)
------------------------------

  Additional (1): bat-ptl-1 

Known issues
------------

  Here are the changes found in xe-pw-155684v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5766
  [Intel XE#5769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5769
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5773]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5773
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5778]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5778
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#5781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5781


Build changes
-------------

  * Linux: xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb -> xe-pw-155684v1

  IGT_8581: 8581
  xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb: 0406d0518ff3a69ea611bfaf02a2f76d715156cb
  xe-pw-155684v1: 155684v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155684v1/index.html

--===============2389918902212302586==
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
<tr><td><b>Series:</b></td><td>drm/xe: Handle mixed mappings and existing VRAM on atomic faults</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155684/">https://patchwork.freedesktop.org/series/155684/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155684v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155684v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb_BAT -&gt; xe-pw-155684v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 10)</h2>
<p>Additional (1): bat-ptl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155684v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb -&gt; xe-pw-155684v1</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3889-0406d0518ff3a69ea611bfaf02a2f76d715156cb: 0406d0518ff3a69ea611bfaf02a2f76d715156cb<br />
  xe-pw-155684v1: 155684v1</p>

</body>
</html>

--===============2389918902212302586==--
