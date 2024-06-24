Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B803C2BD05
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jun 2024 11:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD08B10E400;
	Mon, 24 Jun 2024 11:06:58 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665E110E267;
 Mon, 24 Jun 2024 11:06:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0441770942852281459=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/ttm=3A_Add_a_flag_to_allow_d?=
 =?utf-8?q?rivers_to_skip_clear-on-free?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 24 Jun 2024 11:06:57 -0000
Message-ID: <171922721741.153309.10356136814695338033@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240624100721.24331-1-nirmoy.das@intel.com>
In-Reply-To: <20240624100721.24331-1-nirmoy.das@intel.com>
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

--===============0441770942852281459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Add a flag to allow drivers to skip clear-on-free
URL   : https://patchwork.freedesktop.org/series/135291/
State : success

== Summary ==

CI Bug Log - changes from xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77_BAT -> xe-pw-135291v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135291v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - {bat-lnl-1}:        [FAIL][1] ([Intel XE#1069]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][3] ([Intel XE#324]) -> [DMESG-WARN][4] ([Intel XE#324])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324


Build changes
-------------

  * Linux: xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77 -> xe-pw-135291v1

  IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77: 0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77
  xe-pw-135291v1: 135291v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/index.html

--===============0441770942852281459==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Add a flag to allow drivers to skip clear-on-free</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135291/">https://patchwork.freedesktop.org/series/135291/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77_BAT -&gt; xe-pw-135291v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135291v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-userptr-invalidate:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135291v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77 -&gt; xe-pw-135291v1</li>
</ul>
<p>IGT_7896: 4e6d29ee4672a172227a58ba614ce6b50223f073 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1519-0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77: 0bbdc449f9fe936b5e453690d0ee74a9f7a8ff77<br />
  xe-pw-135291v1: 135291v1</p>

</body>
</html>

--===============0441770942852281459==--
