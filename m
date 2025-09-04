Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB67CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 16:22:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F46610EAA2;
	Thu,  4 Sep 2025 16:22:50 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DCCD10EA94;
 Thu,  4 Sep 2025 16:22:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2605555255807002579=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Driver-managed_exhaustive_e?=
 =?utf-8?q?viction_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 04 Sep 2025 16:22:49 -0000
Message-ID: <175700296910.304667.12856677942431285385@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250904144908.14303-1-thomas.hellstrom@linux.intel.com>
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

--===============2605555255807002579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Driver-managed exhaustive eviction (rev5)
URL   : https://patchwork.freedesktop.org/series/152882/
State : success

== Summary ==

CI Bug Log - changes from xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97_BAT -> xe-pw-152882v5_BAT
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

  Here are the changes found in xe-pw-152882v5_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8522 -> IGT_8524
  * Linux: xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97 -> xe-pw-152882v5

  IGT_8522: 8522
  IGT_8524: 8524
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97
  xe-pw-152882v5: 152882v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v5/index.html

--===============2605555255807002579==
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
<tr><td><b>Series:</b></td><td>Driver-managed exhaustive eviction (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152882/">https://patchwork.freedesktop.org/series/152882/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152882v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97_BAT -&gt; xe-pw-152882v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152882v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8522 -&gt; IGT_8524</li>
<li>Linux: xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97 -&gt; xe-pw-152882v5</li>
</ul>
<p>IGT_8522: 8522<br />
  IGT_8524: 8524<br />
  xe-3677-3345c879b0492f1283042ae6bdecb0e65ec4ff97: 3345c879b0492f1283042ae6bdecb0e65ec4ff97<br />
  xe-pw-152882v5: 152882v5</p>

</body>
</html>

--===============2605555255807002579==--
