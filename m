Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 333B7CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 05:07:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E755F10E40A;
	Thu, 12 Oct 2023 05:07:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BAF410E40A;
 Thu, 12 Oct 2023 05:07:12 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 04D58AA3D8;
 Thu, 12 Oct 2023 05:07:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5409651178811948571=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Thu, 12 Oct 2023 05:07:11 -0000
Message-ID: <169708723198.25008.4839469733300392525@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231012044038.586386-1-matthew.brost@intel.com>
In-Reply-To: <20231012044038.586386-1-matthew.brost@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_DRM_sched?=
 =?utf-8?q?uler_update?=
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

--===============5409651178811948571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: DRM scheduler update
URL   : https://patchwork.freedesktop.org/series/125025/
State : success

== Summary ==

CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -> xe-pw-125025v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125025v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-leak}:
    - bat-adlp-7:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html
    - bat-dg2-oem2:       [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-dg2-oem2/igt@xe_create@create-execqueues-leak.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/bat-dg2-oem2/igt@xe_create@create-execqueues-leak.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -> xe-pw-125025v1

  IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e
  xe-pw-125025v1: 125025v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/index.html

--===============5409651178811948571==
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
<tr><td><b>Series:</b></td><td>DRM scheduler update</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125025/">https://patchwork.freedesktop.org/series/125025/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e_BAT -&gt; xe-pw-125025v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125025v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/bat-adlp-7/igt@xe_create@create-execqueues-leak.html">ABORT</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e/bat-dg2-oem2/igt@xe_create@create-execqueues-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125025v1/bat-dg2-oem2/igt@xe_create@create-execqueues-leak.html">ABORT</a></p>
</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e -&gt; xe-pw-125025v1</li>
</ul>
<p>IGT_7532: bf24b157b1049afc086fe65a60b22bd6bb3e18b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-432-6c0d1e36f310682297a5b07336b0883afc77f66e: 6c0d1e36f310682297a5b07336b0883afc77f66e<br />
  xe-pw-125025v1: 125025v1</p>

</body>
</html>

--===============5409651178811948571==--
