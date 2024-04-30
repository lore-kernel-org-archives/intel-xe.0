Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E7CBC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 30 Apr 2024 19:28:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 281BA10E23A;
	Tue, 30 Apr 2024 19:28:02 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD9E10E0D4;
 Tue, 30 Apr 2024 19:28:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3299693306786425935=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Refactor_default_device_atomic_s?=
 =?utf-8?q?ettings_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Apr 2024 19:28:01 -0000
Message-ID: <171450528165.1793102.6696993022746913196@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240430162529.21588-1-nirmoy.das@intel.com>
In-Reply-To: <20240430162529.21588-1-nirmoy.das@intel.com>
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

--===============3299693306786425935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor default device atomic settings (rev6)
URL   : https://patchwork.freedesktop.org/series/132930/
State : success

== Summary ==

CI Bug Log - changes from xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb_BAT -> xe-pw-132930v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb -> xe-pw-132930v6

  IGT_7826: ce6ce0f60dd1a6c0df93a01ad71a31964158a2cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb: 8aebdf15c4291ea17c810781d54a16f7d12c19fb
  xe-pw-132930v6: 132930v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v6/index.html

--===============3299693306786425935==
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
<tr><td><b>Series:</b></td><td>Refactor default device atomic settings (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132930/">https://patchwork.freedesktop.org/series/132930/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132930v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb_BAT -&gt; xe-pw-132930v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb -&gt; xe-pw-132930v6</li>
</ul>
<p>IGT_7826: ce6ce0f60dd1a6c0df93a01ad71a31964158a2cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1212-8aebdf15c4291ea17c810781d54a16f7d12c19fb: 8aebdf15c4291ea17c810781d54a16f7d12c19fb<br />
  xe-pw-132930v6: 132930v6</p>

</body>
</html>

--===============3299693306786425935==--
