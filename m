Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22530CA0FF0
	for <intel-xe@archiver.kernel.org>; Mon,  1 Sep 2025 07:48:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D362D10E39D;
	Mon,  1 Sep 2025 07:48:28 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127BE10E06B;
 Mon,  1 Sep 2025 07:48:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1413588928713993445=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_devm_rele?=
 =?utf-8?q?ase_action_to_safely_tear_down_CT_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 01 Sep 2025 07:48:28 -0000
Message-ID: <175671290807.288126.11237012621496871869@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250901072541.31461-1-satyanarayana.k.v.p@intel.com>
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

--===============1413588928713993445==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add devm release action to safely tear down CT (rev4)
URL   : https://patchwork.freedesktop.org/series/152870/
State : success

== Summary ==

CI Bug Log - changes from xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667_BAT -> xe-pw-152870v4_BAT
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

  * Linux: xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667 -> xe-pw-152870v4

  IGT_8519: 8519
  xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667: 9319ef352fbc3067e632b13572e19d3b6e6b4667
  xe-pw-152870v4: 152870v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/index.html

--===============1413588928713993445==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add devm release action to safely tear down CT (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152870/">https://patchwork.freedesktop.org/series/152870/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152870v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667_BAT -&gt; xe-pw-152870v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667 -&gt; xe-pw-152870v4</li>
</ul>
<p>IGT_8519: 8519<br />
  xe-3646-9319ef352fbc3067e632b13572e19d3b6e6b4667: 9319ef352fbc3067e632b13572e19d3b6e6b4667<br />
  xe-pw-152870v4: 152870v4</p>

</body>
</html>

--===============1413588928713993445==--
