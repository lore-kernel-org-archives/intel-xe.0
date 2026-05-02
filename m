Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E22FCD13DA
	for <intel-xe@archiver.kernel.org>; Sat,  2 May 2026 19:00:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C9810E2AA;
	Sat,  2 May 2026 19:00:55 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6500F10E0C7;
 Sat,  2 May 2026 19:00:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0599366564406803819=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hw=5Ferror=3A_Cleanu?=
 =?utf-8?q?p_array_map?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 02 May 2026 19:00:54 -0000
Message-ID: <177774845440.33192.17800241929234542544@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260502180143.1450266-1-raag.jadav@intel.com>
In-Reply-To: <20260502180143.1450266-1-raag.jadav@intel.com>
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

--===============0599366564406803819==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hw_error: Cleanup array map
URL   : https://patchwork.freedesktop.org/series/165871/
State : success

== Summary ==

CI Bug Log - changes from xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT -> xe-pw-165871v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT and xe-pw-165871v1_BAT:

### New IGT tests (20) ###

  * igt@xe_gpgpu_fill@basic:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_intel_bb@add-remove-objects:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@xe_intel_bb@bb-with-allocator:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.02] s

  * igt@xe_intel_bb@blit-reloc:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@blit-simple:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_intel_bb@create-in-region:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.04] s

  * igt@xe_intel_bb@create-in-region@region-system:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_intel_bb@delta-check:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_intel_bb@destroy-bb:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.03] s

  * igt@xe_intel_bb@intel-bb-blit-none:
    - Statuses : 12 pass(s)
    - Exec time: [0.11, 0.31] s

  * igt@xe_intel_bb@intel-bb-blit-x:
    - Statuses : 12 pass(s)
    - Exec time: [0.11, 0.31] s

  * igt@xe_intel_bb@intel-bb-blit-y:
    - Statuses : 12 pass(s)
    - Exec time: [0.11, 0.31] s

  * igt@xe_intel_bb@lot-of-buffers:
    - Statuses : 12 pass(s)
    - Exec time: [0.08, 0.23] s

  * igt@xe_intel_bb@offset-control:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_intel_bb@purge-bb:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_intel_bb@render:
    - Statuses : 12 pass(s)
    - Exec time: [0.02, 0.09] s

  * igt@xe_intel_bb@reset-bb:
    - Statuses : 12 pass(s)
    - Exec time: [0.00] s

  * igt@xe_intel_bb@simple-bb:
    - Statuses : 12 pass(s)
    - Exec time: [0.00, 0.01] s

  * igt@xe_intel_bb@simple-bb-ctx:
    - Statuses : 12 pass(s)
    - Exec time: [0.01, 0.02] s

  * igt@xe_query@query-invalid-extension:
    - Statuses : 12 pass(s)
    - Exec time: [0.0, 0.00] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad -> xe-pw-165871v1

  IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad: 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad
  xe-pw-165871v1: 165871v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/index.html

--===============0599366564406803819==
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
<tr><td><b>Series:</b></td><td>drm/xe/hw_error: Cleanup array map</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165871/">https://patchwork.freedesktop.org/series/165871/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165871v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT -&gt; xe-pw-165871v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad_BAT and xe-pw-165871v1_BAT:</p>
<h3>New IGT tests (20)</h3>
<ul>
<li>
<p>igt@xe_gpgpu_fill@basic:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@add-remove-objects:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@bb-with-allocator:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-simple:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region@region-system:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@delta-check:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@destroy-bb:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.03] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-none:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.11, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.11, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.11, 0.31] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@lot-of-buffers:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.08, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@offset-control:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@purge-bb:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@render:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.02, 0.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@reset-bb:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.00, 0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@simple-bb-ctx:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.01, 0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-extension:</p>
<ul>
<li>Statuses : 12 pass(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad -&gt; xe-pw-165871v1</li>
</ul>
<p>IGT_8881: aa5853ef5b379b1e4558218c21ef4caeae112184 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4965-03712864f7a8ffcdd43fe3adc4cfe687f77e93ad: 03712864f7a8ffcdd43fe3adc4cfe687f77e93ad<br />
  xe-pw-165871v1: 165871v1</p>

</body>
</html>

--===============0599366564406803819==--
