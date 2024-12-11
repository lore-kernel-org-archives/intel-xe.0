Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509BAE7717D
	for <intel-xe@archiver.kernel.org>; Wed, 11 Dec 2024 06:14:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15EEF10E05F;
	Wed, 11 Dec 2024 06:14:44 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A7D10E05F;
 Wed, 11 Dec 2024 06:14:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7345921695968951744=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_adding_wait_helper_for?=
 =?utf-8?q?_gt_async_reset_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maciej Patelczyk" <maciej.patelczyk@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 11 Dec 2024 06:14:42 -0000
Message-ID: <173389768280.1103366.15351256890121041510@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
In-Reply-To: <20241210143748.1417098-1-maciej.patelczyk@intel.com>
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

--===============7345921695968951744==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: adding wait helper for gt async reset (rev2)
URL   : https://patchwork.freedesktop.org/series/142300/
State : success

== Summary ==

CI Bug Log - changes from xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f_BAT -> xe-pw-142300v2_BAT
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

  New tests have been introduced between xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f_BAT and xe-pw-142300v2_BAT:

### New IGT tests (3) ###

  * igt@xe_pat@pat-index-xehpc@blt:
    - Statuses : 1 pass(s)
    - Exec time: [4.47] s

  * igt@xe_pat@pat-index-xehpc@dw:
    - Statuses : 1 pass(s)
    - Exec time: [3.49] s

  * igt@xe_pat@pat-index-xehpc@render:
    - Statuses : 1 skip(s)
    - Exec time: [0.00] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f -> xe-pw-142300v2

  IGT_8146: 4134194b806f286bf0bf47ce02416ca3701b7b34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f: afdbad14a16d9f44489fe37a05e93b24581bdc4f
  xe-pw-142300v2: 142300v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v2/index.html

--===============7345921695968951744==
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
<tr><td><b>Series:</b></td><td>drm/xe: adding wait helper for gt async reset (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142300/">https://patchwork.freedesktop.org/series/142300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142300v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f_BAT -&gt; xe-pw-142300v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f_BAT and xe-pw-142300v2_BAT:</p>
<h3>New IGT tests (3)</h3>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc@blt:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.47] s</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc@dw:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [3.49] s</li>
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
<li>Linux: xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f -&gt; xe-pw-142300v2</li>
</ul>
<p>IGT_8146: 4134194b806f286bf0bf47ce02416ca3701b7b34 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2345-afdbad14a16d9f44489fe37a05e93b24581bdc4f: afdbad14a16d9f44489fe37a05e93b24581bdc4f<br />
  xe-pw-142300v2: 142300v2</p>

</body>
</html>

--===============7345921695968951744==--
