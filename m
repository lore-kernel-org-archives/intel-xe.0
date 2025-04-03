Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37CB7C3600C
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 15:38:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3E9A10E257;
	Thu,  3 Apr 2025 15:38:31 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D3BC10E247;
 Thu,  3 Apr 2025 15:38:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1846185989916567201=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_fault_injection_f?=
 =?utf-8?q?or_guc_CTB_=26_mmio_send/recv=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 15:38:31 -0000
Message-ID: <174369471163.33532.10702121672563918544@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250403120641.7258-1-satyanarayana.k.v.p@intel.com>
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

--===============1846185989916567201==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce fault injection for guc CTB & mmio send/recv.
URL   : https://patchwork.freedesktop.org/series/147210/
State : success

== Summary ==

CI Bug Log - changes from xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7_BAT -> xe-pw-147210v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-147210v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147210v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * IGT: IGT_8302 -> IGT_8304
  * Linux: xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7 -> xe-pw-147210v1

  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8304: 8304
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7
  xe-pw-147210v1: 147210v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147210v1/index.html

--===============1846185989916567201==
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
<tr><td><b>Series:</b></td><td>Introduce fault injection for guc CTB &amp; mmio send/recv.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147210/">https://patchwork.freedesktop.org/series/147210/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147210v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147210v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7_BAT -&gt; xe-pw-147210v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147210v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147210v1/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8302 -&gt; IGT_8304</li>
<li>Linux: xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7 -&gt; xe-pw-147210v1</li>
</ul>
<p>IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8304: 8304<br />
  xe-2901-71dac8dae6cc024b633bd6e584f4195c44c0dbc7: 71dac8dae6cc024b633bd6e584f4195c44c0dbc7<br />
  xe-pw-147210v1: 147210v1</p>

</body>
</html>

--===============1846185989916567201==--
