Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD0BCE8D6B
	for <intel-xe@archiver.kernel.org>; Mon, 17 Nov 2025 19:45:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C61F10E1A7;
	Mon, 17 Nov 2025 19:45:43 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB10110E1A7;
 Mon, 17 Nov 2025 19:45:41 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6188227295644850038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fsriov=5Fpacket?=
 =?utf-8?q?=3A_Return_int_from_pf=5Fdescriptor=5Finit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 17 Nov 2025 19:45:41 -0000
Message-ID: <176340874195.3055.3989378740747252484@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251117190114.69953-2-jonathan.cavitt@intel.com>
In-Reply-To: <20251117190114.69953-2-jonathan.cavitt@intel.com>
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

--===============6188227295644850038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sriov_packet: Return int from pf_descriptor_init
URL   : https://patchwork.freedesktop.org/series/157677/
State : success

== Summary ==

CI Bug Log - changes from xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab_BAT -> xe-pw-157677v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157677v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [TIMEOUT][1] ([Intel XE#6506]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157677v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506


Build changes
-------------

  * Linux: xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab -> xe-pw-157677v1

  IGT_8628: 8628
  xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab
  xe-pw-157677v1: 157677v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157677v1/index.html

--===============6188227295644850038==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sriov_packet: Return int from pf_descriptor_init</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157677/">https://patchwork.freedesktop.org/series/157677/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157677v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157677v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab_BAT -&gt; xe-pw-157677v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157677v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@abstime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157677v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab -&gt; xe-pw-157677v1</li>
</ul>
<p>IGT_8628: 8628<br />
  xe-4118-4ebea764d0e6ddbcaed6a474aee387f9c45e2eab: 4ebea764d0e6ddbcaed6a474aee387f9c45e2eab<br />
  xe-pw-157677v1: 157677v1</p>

</body>
</html>

--===============6188227295644850038==--
