Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB8B6C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  1 Aug 2025 14:17:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A80E010E881;
	Fri,  1 Aug 2025 14:17:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F3710E114;
 Fri,  1 Aug 2025 14:17:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6959348449322078114=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Improve_CCS_save_restore_se?=
 =?utf-8?q?ries_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 01 Aug 2025 14:17:57 -0000
Message-ID: <175405787713.205079.3133601492321102303@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
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

--===============6959348449322078114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve CCS save restore series (rev2)
URL   : https://patchwork.freedesktop.org/series/152316/
State : success

== Summary ==

CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_BAT -> xe-pw-152316v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -> xe-pw-152316v2

  IGT_8482: 8482
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f
  xe-pw-152316v2: 152316v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152316v2/index.html

--===============6959348449322078114==
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
<tr><td><b>Series:</b></td><td>Improve CCS save restore series (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152316/">https://patchwork.freedesktop.org/series/152316/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152316v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152316v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f_BAT -&gt; xe-pw-152316v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f -&gt; xe-pw-152316v2</li>
</ul>
<p>IGT_8482: 8482<br />
  xe-3497-c4264c7406b75ed3fa043f034cb9d538d210d64f: c4264c7406b75ed3fa043f034cb9d538d210d64f<br />
  xe-pw-152316v2: 152316v2</p>

</body>
</html>

--===============6959348449322078114==--
