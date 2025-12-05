Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02C08D2F7CC
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 12:49:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B85C710E044;
	Fri,  5 Dec 2025 12:49:52 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCA9810E044;
 Fri,  5 Dec 2025 12:49:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4436228381406915205=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/=7Bi915=2C_xe=7D=3A_mig?=
 =?utf-8?q?rate_stolen_interface_to_parent_interface=2C_cleanups_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 12:49:51 -0000
Message-ID: <176493899189.61835.8565163299961294920@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1764930576.git.jani.nikula@intel.com>
In-Reply-To: <cover.1764930576.git.jani.nikula@intel.com>
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

--===============4436228381406915205==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}: migrate stolen interface to parent interface, cleanups (rev2)
URL   : https://patchwork.freedesktop.org/series/158508/
State : success

== Summary ==

CI Bug Log - changes from xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2_BAT -> xe-pw-158508v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2 -> xe-pw-158508v2

  IGT_8655: 8655
  xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2: 7954eb633a41ad5f2012477cdc245ec0cf07e7a2
  xe-pw-158508v2: 158508v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158508v2/index.html

--===============4436228381406915205==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}: migrate stolen interface to parent interface, cleanups (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158508/">https://patchwork.freedesktop.org/series/158508/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158508v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158508v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2_BAT -&gt; xe-pw-158508v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2 -&gt; xe-pw-158508v2</li>
</ul>
<p>IGT_8655: 8655<br />
  xe-4197-7954eb633a41ad5f2012477cdc245ec0cf07e7a2: 7954eb633a41ad5f2012477cdc245ec0cf07e7a2<br />
  xe-pw-158508v2: 158508v2</p>

</body>
</html>

--===============4436228381406915205==--
