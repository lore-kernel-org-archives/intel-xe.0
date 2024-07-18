Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E250C3DA60
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 07:04:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B20C410E57C;
	Thu, 18 Jul 2024 07:04:27 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F0A10E57C;
 Thu, 18 Jul 2024 07:04:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0472126674735861758=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_fixup!_drm/xe/oa=3A_Add_OAR_supp?=
 =?utf-8?q?ort?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ohad Sharabi" <osharabi@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jul 2024 07:04:24 -0000
Message-ID: <172128626452.272204.15348879042215969226@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240718054848.2955818-1-osharabi@habana.ai>
In-Reply-To: <20240718054848.2955818-1-osharabi@habana.ai>
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

--===============0472126674735861758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fixup! drm/xe/oa: Add OAR support
URL   : https://patchwork.freedesktop.org/series/136220/
State : success

== Summary ==

CI Bug Log - changes from xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT -> xe-pw-136220v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136220v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - {bat-bmg-1}:        [DMESG-WARN][1] -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136220v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f -> xe-pw-136220v1

  IGT_7929: 7929
  xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f: c2610cb0857b1e68f684691f6d3e7fb110f7149f
  xe-pw-136220v1: 136220v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136220v1/index.html

--===============0472126674735861758==
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
<tr><td><b>Series:</b></td><td>fixup! drm/xe/oa: Add OAR support</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136220/">https://patchwork.freedesktop.org/series/136220/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136220v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136220v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f_BAT -&gt; xe-pw-136220v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136220v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_balancer@twice-virtual-userptr-rebind:<ul>
<li>{bat-bmg-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136220v1/bat-bmg-1/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f -&gt; xe-pw-136220v1</li>
</ul>
<p>IGT_7929: 7929<br />
  xe-1622-c2610cb0857b1e68f684691f6d3e7fb110f7149f: c2610cb0857b1e68f684691f6d3e7fb110f7149f<br />
  xe-pw-136220v1: 136220v1</p>

</body>
</html>

--===============0472126674735861758==--
