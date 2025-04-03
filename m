Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7953EC3601B
	for <intel-xe@archiver.kernel.org>; Thu,  3 Apr 2025 09:06:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3945510E946;
	Thu,  3 Apr 2025 09:06:26 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DF010E13C;
 Thu,  3 Apr 2025 09:06:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8281833245718460033=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_the_missed_va?=
 =?utf-8?q?lue_paramter_of_LE=5FCOS_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 03 Apr 2025 09:06:25 -0000
Message-ID: <174367118510.31708.8107528520289670621@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250401205703.4179906-1-shuicheng.lin@intel.com>
In-Reply-To: <20250401205703.4179906-1-shuicheng.lin@intel.com>
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

--===============8281833245718460033==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add the missed value paramter of LE_COS (rev4)
URL   : https://patchwork.freedesktop.org/series/147087/
State : success

== Summary ==

CI Bug Log - changes from xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded_BAT -> xe-pw-147087v4_BAT
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

  * Linux: xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded -> xe-pw-147087v4

  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded
  xe-pw-147087v4: 147087v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147087v4/index.html

--===============8281833245718460033==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add the missed value paramter of LE_COS (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147087/">https://patchwork.freedesktop.org/series/147087/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147087v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147087v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded_BAT -&gt; xe-pw-147087v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded -&gt; xe-pw-147087v4</li>
</ul>
<p>IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded<br />
  xe-pw-147087v4: 147087v4</p>

</body>
</html>

--===============8281833245718460033==--
