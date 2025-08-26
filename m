Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15525CA0FF2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Aug 2025 18:50:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E8510E6B4;
	Tue, 26 Aug 2025 18:50:03 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CE110E6B4;
 Tue, 26 Aug 2025 18:50:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6031987029936712151=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Add_error?=
 =?utf-8?q?_injection_support_to_lock_and_prep?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Aug 2025 18:50:02 -0000
Message-ID: <175623420208.271946.3588005819621310825@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250826175051.92563-4-jonathan.cavitt@intel.com>
In-Reply-To: <20250826175051.92563-4-jonathan.cavitt@intel.com>
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

--===============6031987029936712151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Add error injection support to lock and prep
URL   : https://patchwork.freedesktop.org/series/153526/
State : success

== Summary ==

CI Bug Log - changes from xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907_BAT -> xe-pw-153526v1_BAT
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

  Here are the changes found in xe-pw-153526v1_BAT that come from known issues:

### IGT changes ###

  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907 -> xe-pw-153526v1

  IGT_8511: 8511
  xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907: 4b94f8fef771cb0b1d0131675e2d794ef6464907
  xe-pw-153526v1: 153526v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153526v1/index.html

--===============6031987029936712151==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Add error injection support to lock and prep</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153526/">https://patchwork.freedesktop.org/series/153526/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153526v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153526v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907_BAT -&gt; xe-pw-153526v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153526v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907 -&gt; xe-pw-153526v1</li>
</ul>
<p>IGT_8511: 8511<br />
  xe-3621-4b94f8fef771cb0b1d0131675e2d794ef6464907: 4b94f8fef771cb0b1d0131675e2d794ef6464907<br />
  xe-pw-153526v1: 153526v1</p>

</body>
</html>

--===============6031987029936712151==--
