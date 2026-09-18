Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C744C88E72
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 00:02:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2804D10E51E;
	Fri, 18 Sep 2026 00:02:50 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0285910E51E;
 Fri, 18 Sep 2026 00:02:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6724156639162691788=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_mnemonic_erro?=
 =?utf-8?q?r_reason_to_page_fault_diagnostics_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Sep 2026 00:02:49 -0000
Message-ID: <178968976900.177999.15019042184857628606@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917203850.321385-1-matthew.brost@intel.com>
In-Reply-To: <20260917203850.321385-1-matthew.brost@intel.com>
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

--===============6724156639162691788==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add mnemonic error reason to page fault diagnostics (rev3)
URL   : https://patchwork.freedesktop.org/series/174450/
State : success

== Summary ==

CI Bug Log - changes from xe-5771-3b9b6ac28583437aa238be799a31245509220dad_BAT -> xe-pw-174450v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-174450v3_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@engine:
    - bat-wcl-2:          [FAIL][1] ([Intel XE#9103]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5771-3b9b6ac28583437aa238be799a31245509220dad/bat-wcl-2/igt@xe_waitfence@engine.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174450v3/bat-wcl-2/igt@xe_waitfence@engine.html

  
  [Intel XE#9103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103


Build changes
-------------

  * Linux: xe-5771-3b9b6ac28583437aa238be799a31245509220dad -> xe-pw-174450v3

  IGT_9099: 9099
  xe-5771-3b9b6ac28583437aa238be799a31245509220dad: 3b9b6ac28583437aa238be799a31245509220dad
  xe-pw-174450v3: 174450v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174450v3/index.html

--===============6724156639162691788==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add mnemonic error reason to page fault diagnostics (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/174450/">https://patchwork.freedesktop.org/series/174450/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174450v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174450v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5771-3b9b6ac28583437aa238be799a31245509220dad_BAT -&gt; xe-pw-174450v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-174450v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@engine:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5771-3b9b6ac28583437aa238be799a31245509220dad/bat-wcl-2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9103">Intel XE#9103</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-174450v3/bat-wcl-2/igt@xe_waitfence@engine.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5771-3b9b6ac28583437aa238be799a31245509220dad -&gt; xe-pw-174450v3</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5771-3b9b6ac28583437aa238be799a31245509220dad: 3b9b6ac28583437aa238be799a31245509220dad<br />
  xe-pw-174450v3: 174450v3</p>

</body>
</html>

--===============6724156639162691788==--
