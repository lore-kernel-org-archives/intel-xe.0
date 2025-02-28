Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C846CC19776
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 13:19:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97BFA10ECA2;
	Fri, 28 Feb 2025 13:19:39 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DCDB10EC9E;
 Fri, 28 Feb 2025 13:19:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0821640412545389619=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/pxp_=26_drm/xe/pxp?=
 =?utf-8?q?=3A_Figure_out_pxp_instance_from_the_gem_object_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 13:19:39 -0000
Message-ID: <174074877904.3235488.2423598863400267333@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228114527.3091620-1-jani.nikula@intel.com>
In-Reply-To: <20250228114527.3091620-1-jani.nikula@intel.com>
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

--===============0821640412545389619==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/pxp & drm/xe/pxp: Figure out pxp instance from the gem object (rev2)
URL   : https://patchwork.freedesktop.org/series/144321/
State : success

== Summary ==

CI Bug Log - changes from xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831_BAT -> xe-pw-144321v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831 -> xe-pw-144321v2

  IGT_8252: e266af0feec344315b07d8af186226e467d02ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831: 1e777b08d64779d75f6ee2059177dbc0d650d831
  xe-pw-144321v2: 144321v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144321v2/index.html

--===============0821640412545389619==
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
<tr><td><b>Series:</b></td><td>drm/i915/pxp &amp; drm/xe/pxp: Figure out pxp instance from the gem object (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144321/">https://patchwork.freedesktop.org/series/144321/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144321v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144321v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831_BAT -&gt; xe-pw-144321v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831 -&gt; xe-pw-144321v2</li>
</ul>
<p>IGT_8252: e266af0feec344315b07d8af186226e467d02ecf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2732-1e777b08d64779d75f6ee2059177dbc0d650d831: 1e777b08d64779d75f6ee2059177dbc0d650d831<br />
  xe-pw-144321v2: 144321v2</p>

</body>
</html>

--===============0821640412545389619==--
