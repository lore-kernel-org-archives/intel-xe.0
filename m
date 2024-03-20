Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23DC8C6FD1F
	for <intel-xe@archiver.kernel.org>; Wed, 20 Mar 2024 13:44:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF68210E47E;
	Wed, 20 Mar 2024 13:44:34 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C756A10E14E;
 Wed, 20 Mar 2024 13:44:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2755045328785870663=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Create_a_helper_functi?=
 =?utf-8?q?on_to_init_job=27s_user_fence?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 20 Mar 2024 13:44:24 -0000
Message-ID: <171094226481.921315.127804340759746759@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240320124556.10337-1-nirmoy.das@intel.com>
In-Reply-To: <20240320124556.10337-1-nirmoy.das@intel.com>
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

--===============2755045328785870663==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Create a helper function to init job's user fence
URL   : https://patchwork.freedesktop.org/series/131371/
State : success

== Summary ==

CI Bug Log - changes from xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa_BAT -> xe-pw-131371v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa -> xe-pw-131371v1

  IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa: b87a8b85562fc94e2314b61279ffa80b6c294cfa
  xe-pw-131371v1: 131371v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131371v1/index.html

--===============2755045328785870663==
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
<tr><td><b>Series:</b></td><td>drm/xe: Create a helper function to init job&#x27;s user fence</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131371/">https://patchwork.freedesktop.org/series/131371/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131371v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131371v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa_BAT -&gt; xe-pw-131371v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa -&gt; xe-pw-131371v1</li>
</ul>
<p>IGT_7770: fef0422fd296f7c65724315f2a455ffb6959fb0d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-964-b87a8b85562fc94e2314b61279ffa80b6c294cfa: b87a8b85562fc94e2314b61279ffa80b6c294cfa<br />
  xe-pw-131371v1: 131371v1</p>

</body>
</html>

--===============2755045328785870663==--
