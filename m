Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E46A2CD342F
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 17:11:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1ECF10E0C4;
	Fri,  8 May 2026 17:11:31 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C01B10F571;
 Fri,  8 May 2026 17:11:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5604998555472465830=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Convert_-EAGAIN_?=
 =?utf-8?q?from_dmem=5Fcgroup=5Ftry=5Fcharge_to_-ENOSPC?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 17:11:30 -0000
Message-ID: <177826029056.52561.6225074819190769472@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508160920.230339-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260508160920.230339-1-thomas.hellstrom@linux.intel.com>
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

--===============5604998555472465830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Convert -EAGAIN from dmem_cgroup_try_charge to -ENOSPC
URL   : https://patchwork.freedesktop.org/series/166227/
State : success

== Summary ==

CI Bug Log - changes from xe-5027-6485dd251568e459bca34ee51b0d764668308b5a_BAT -> xe-pw-166227v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-166227v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#7483]) -> [PASS][2] +12 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5027-6485dd251568e459bca34ee51b0d764668308b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166227v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483


Build changes
-------------

  * Linux: xe-5027-6485dd251568e459bca34ee51b0d764668308b5a -> xe-pw-166227v1

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5027-6485dd251568e459bca34ee51b0d764668308b5a: 6485dd251568e459bca34ee51b0d764668308b5a
  xe-pw-166227v1: 166227v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166227v1/index.html

--===============5604998555472465830==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Convert -EAGAIN from dmem_cgroup_try_charge to -ENOSPC</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166227/">https://patchwork.freedesktop.org/series/166227/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166227v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166227v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5027-6485dd251568e459bca34ee51b0d764668308b5a_BAT -&gt; xe-pw-166227v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166227v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5027-6485dd251568e459bca34ee51b0d764668308b5a/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166227v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> +12 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5027-6485dd251568e459bca34ee51b0d764668308b5a -&gt; xe-pw-166227v1</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5027-6485dd251568e459bca34ee51b0d764668308b5a: 6485dd251568e459bca34ee51b0d764668308b5a<br />
  xe-pw-166227v1: 166227v1</p>

</body>
</html>

--===============5604998555472465830==--
