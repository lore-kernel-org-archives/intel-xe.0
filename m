Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFD3CD6A221
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 20:23:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52FC10E0A4;
	Thu, 14 Nov 2024 20:23:25 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E9E210E35E;
 Thu, 14 Nov 2024 20:23:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4097971950145844638=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_VF=3A_Fix_early_read_of_GDMID?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 Nov 2024 20:23:24 -0000
Message-ID: <173161580464.4193766.13888080768563030082@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241114175955.2299-1-michal.wajdeczko@intel.com>
In-Reply-To: <20241114175955.2299-1-michal.wajdeczko@intel.com>
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

--===============4097971950145844638==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Fix early read of GDMID
URL   : https://patchwork.freedesktop.org/series/141367/
State : success

== Summary ==

CI Bug Log - changes from xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d_BAT -> xe-pw-141367v1_BAT
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

  Here are the changes found in xe-pw-141367v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@psr-cursor-plane-move@edp-1:
    - bat-lnl-1:          [PASS][1] -> [FAIL][2] ([Intel XE#2808]) +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html

  
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808


Build changes
-------------

  * Linux: xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d -> xe-pw-141367v1

  IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d: 4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d
  xe-pw-141367v1: 141367v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/index.html

--===============4097971950145844638==
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
<tr><td><b>Series:</b></td><td>VF: Fix early read of GDMID</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141367/">https://patchwork.freedesktop.org/series/141367/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d_BAT -&gt; xe-pw-141367v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141367v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_psr@psr-cursor-plane-move@edp-1:<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141367v1/bat-lnl-1/igt@kms_psr@psr-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d -&gt; xe-pw-141367v1</li>
</ul>
<p>IGT_8111: 67422a7b55b0278cf0d1bfdc0899ee637ed7d588 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2232-4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d: 4018ba30ba2cc7bcbaed85dd5e77a506dd911b6d<br />
  xe-pw-141367v1: 141367v1</p>

</body>
</html>

--===============4097971950145844638==--
