Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 634B0D5A6E2
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 04:50:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15E3D10E0B7;
	Tue, 26 Nov 2024 04:50:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98A0410E0B7;
 Tue, 26 Nov 2024 04:50:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7997405359036572720=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_devcoredump_l?=
 =?utf-8?q?ocking_and_reason_string_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: john.c.harrison@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 04:50:34 -0000
Message-ID: <173259663460.3179093.13328517205242411058@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126034411.2417033-1-John.C.Harrison@Intel.com>
In-Reply-To: <20241126034411.2417033-1-John.C.Harrison@Intel.com>
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

--===============7997405359036572720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add devcoredump locking and reason string (rev4)
URL   : https://patchwork.freedesktop.org/series/141628/
State : success

== Summary ==

CI Bug Log - changes from xe-2276-ae312905c5a9fc7ce599a74422f068725101c475_BAT -> xe-pw-141628v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-141628v4_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#3517]) -> [PASS][2] +2 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2276-ae312905c5a9fc7ce599a74422f068725101c475/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][3] ([Intel XE#455]) -> [PASS][4] +3 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2276-ae312905c5a9fc7ce599a74422f068725101c475/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
  [Intel XE#3517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * Linux: xe-2276-ae312905c5a9fc7ce599a74422f068725101c475 -> xe-pw-141628v4

  IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2276-ae312905c5a9fc7ce599a74422f068725101c475: ae312905c5a9fc7ce599a74422f068725101c475
  xe-pw-141628v4: 141628v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/index.html

--===============7997405359036572720==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add devcoredump locking and reason string (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141628/">https://patchwork.freedesktop.org/series/141628/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2276-ae312905c5a9fc7ce599a74422f068725101c475_BAT -&gt; xe-pw-141628v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141628v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2276-ae312905c5a9fc7ce599a74422f068725101c475/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3517">Intel XE#3517</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2276-ae312905c5a9fc7ce599a74422f068725101c475/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141628v4/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2276-ae312905c5a9fc7ce599a74422f068725101c475 -&gt; xe-pw-141628v4</li>
</ul>
<p>IGT_8125: fbfda23ba003aab3454436d95c233dcf5e3bee54 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2276-ae312905c5a9fc7ce599a74422f068725101c475: ae312905c5a9fc7ce599a74422f068725101c475<br />
  xe-pw-141628v4: 141628v4</p>

</body>
</html>

--===============7997405359036572720==--
