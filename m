Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C47B10F3DC9
	for <intel-xe@archiver.kernel.org>; Sat, 28 Mar 2026 02:23:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6C7E10E074;
	Sat, 28 Mar 2026 02:23:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964CA10E074;
 Sat, 28 Mar 2026 02:23:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2157574249650823887=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_USE_drm_mm_instead_of_drm_?=
 =?utf-8?q?SA_for_CCS_read/write_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 28 Mar 2026 02:23:04 -0000
Message-ID: <177466458458.409269.2592791143397744171@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260327101146.3826819-5-satyanarayana.k.v.p@intel.com>
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

--===============2157574249650823887==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: USE drm mm instead of drm SA for CCS read/write (rev2)
URL   : https://patchwork.freedesktop.org/series/163588/
State : success

== Summary ==

CI Bug Log - changes from xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL -> xe-pw-163588v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL and xe-pw-163588v2_FULL:

### New IGT tests (5) ###

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.00] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:
    - Statuses : 1 pass(s)
    - Exec time: [0.01] s

  * igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4804-a748e8ef327c92c865410957509417b30f026304 -> xe-pw-163588v2

  IGT_8834: 8834
  xe-4804-a748e8ef327c92c865410957509417b30f026304: a748e8ef327c92c865410957509417b30f026304
  xe-pw-163588v2: 163588v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v2/index.html

--===============2157574249650823887==
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
<tr><td><b>Series:</b></td><td>USE drm mm instead of drm SA for CCS read/write (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163588/">https://patchwork.freedesktop.org/series/163588/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL -&gt; xe-pw-163588v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4804-a748e8ef327c92c865410957509417b30f026304_FULL and xe-pw-163588v2_FULL:</p>
<h3>New IGT tests (5)</h3>
<ul>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.00] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_decode-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_video_enhance-instance-0-tile-1-system-memory:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@oa-add-config-fail-xe_oa_alloc_regs:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
</ul>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4804-a748e8ef327c92c865410957509417b30f026304 -&gt; xe-pw-163588v2</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4804-a748e8ef327c92c865410957509417b30f026304: a748e8ef327c92c865410957509417b30f026304<br />
  xe-pw-163588v2: 163588v2</p>

</body>
</html>

--===============2157574249650823887==--
