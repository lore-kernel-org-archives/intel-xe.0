Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF258D172CC
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 06:35:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B00510E26F;
	Mon,  2 Feb 2026 06:35:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D13DC10E26F;
 Mon,  2 Feb 2026 06:35:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6249807369430689642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_prefetch_page?=
 =?utf-8?q?fault_support_for_Xe3p_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 06:35:09 -0000
Message-ID: <177001410982.214441.8452389789485592536@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202052515.840084-1-varun.gupta@intel.com>
In-Reply-To: <20260202052515.840084-1-varun.gupta@intel.com>
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

--===============6249807369430689642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add prefetch pagefault support for Xe3p (rev3)
URL   : https://patchwork.freedesktop.org/series/159936/
State : success

== Summary ==

CI Bug Log - changes from xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c_BAT -> xe-pw-159936v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c -> xe-pw-159936v3

  IGT_8729: 8729
  xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c: cd1fd615b2ba56ea3fb033262d4fbd0503055d3c
  xe-pw-159936v3: 159936v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159936v3/index.html

--===============6249807369430689642==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add prefetch pagefault support for Xe3p (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159936/">https://patchwork.freedesktop.org/series/159936/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159936v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159936v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c_BAT -&gt; xe-pw-159936v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c -&gt; xe-pw-159936v3</li>
</ul>
<p>IGT_8729: 8729<br />
  xe-4481-cd1fd615b2ba56ea3fb033262d4fbd0503055d3c: cd1fd615b2ba56ea3fb033262d4fbd0503055d3c<br />
  xe-pw-159936v3: 159936v3</p>

</body>
</html>

--===============6249807369430689642==--
