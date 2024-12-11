Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0732EE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 07:36:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC21E10E3E8;
	Wed, 11 Dec 2024 07:36:32 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66D7C10E3E8;
 Wed, 11 Dec 2024 07:36:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8728361322936007343=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_VF=3A_Avoid_reading_inacces?=
 =?utf-8?q?sible_registers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 07:36:31 -0000
Message-ID: <173390259139.1104584.8908011647417262906@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20241211064211.781820-1-marcin.bernatowicz@linux.intel.com>
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

--===============8728361322936007343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Avoid reading inaccessible registers (rev2)
URL   : https://patchwork.freedesktop.org/series/142196/
State : success

== Summary ==

CI Bug Log - changes from xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_BAT -> xe-pw-142196v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

New tests
---------

  New tests have been introduced between xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_BAT and xe-pw-142196v2_BAT:

### New IGT tests (3) ###

  * igt@xe_pat@pat-index-xehpc@blt:
    - Statuses : 1 pass(s)
    - Exec time: [4.06] s

  * igt@xe_pat@pat-index-xehpc@dw:
    - Statuses : 1 pass(s)
    - Exec time: [3.76] s

  * igt@xe_pat@pat-index-xehpc@render:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080 -> xe-pw-142196v2

  IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080: 7bbcd7df9387f0d9004f997df33f7a9472d9c080
  xe-pw-142196v2: 142196v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/index.html

--===============8728361322936007343==
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
<tr><td><b>Series:</b></td><td>VF: Avoid reading inaccessible registers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142196/">https://patchwork.freedesktop.org/series/142196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142196v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_BAT -&gt; xe-pw-142196v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080_BAT and xe-pw-142196v2_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc@blt:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.06] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@dw:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.76] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@render:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080 -&gt; xe-pw-142196v2</li>
</ul>
<p>IGT_8147: df65b61f81a5cc919c10ff9c5ed516b45364135c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2349-7bbcd7df9387f0d9004f997df33f7a9472d9c080: 7bbcd7df9387f0d9004f997df33f7a9472d9c080<br />
  xe-pw-142196v2: 142196v2</p>

</body>
</html>

--===============8728361322936007343==--
