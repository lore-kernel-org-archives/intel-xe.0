Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8D96CED628
	for <intel-xe@archiver.kernel.org>; Wed,  9 Oct 2024 23:09:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791B010E835;
	Wed,  9 Oct 2024 23:09:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDA0110E833;
 Wed,  9 Oct 2024 23:09:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8112880456568558622=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Enlarge_the_invalidati?=
 =?utf-8?q?on_timeout_from_150_to_500_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Oct 2024 23:09:03 -0000
Message-ID: <172851534383.1212728.18027655013976796735@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241009213057.958453-1-shuicheng.lin@intel.com>
In-Reply-To: <20241009213057.958453-1-shuicheng.lin@intel.com>
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

--===============8112880456568558622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Enlarge the invalidation timeout from 150 to 500 (rev2)
URL   : https://patchwork.freedesktop.org/series/139805/
State : success

== Summary ==

CI Bug Log - changes from xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852_BAT -> xe-pw-139805v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-139805v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2687])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687


Build changes
-------------

  * IGT: IGT_8061 -> IGT_8062
  * Linux: xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852 -> xe-pw-139805v2

  IGT_8061: 8061
  IGT_8062: 8062
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852
  xe-pw-139805v2: 139805v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v2/index.html

--===============8112880456568558622==
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
<tr><td><b>Series:</b></td><td>drm/xe: Enlarge the invalidation timeout from 150 to 500 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139805/">https://patchwork.freedesktop.org/series/139805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852_BAT -&gt; xe-pw-139805v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139805v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139805v2/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8061 -&gt; IGT_8062</li>
<li>Linux: xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852 -&gt; xe-pw-139805v2</li>
</ul>
<p>IGT_8061: 8061<br />
  IGT_8062: 8062<br />
  xe-2042-e1aba2bf4f79f2f8ae7ce538124d445fc91df852: e1aba2bf4f79f2f8ae7ce538124d445fc91df852<br />
  xe-pw-139805v2: 139805v2</p>

</body>
</html>

--===============8112880456568558622==--
