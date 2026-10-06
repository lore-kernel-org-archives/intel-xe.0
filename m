Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72071CA5FED
	for <intel-xe@archiver.kernel.org>; Tue,  6 Oct 2026 11:53:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308F310E023;
	Tue,  6 Oct 2026 11:53:58 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AA5C10E023;
 Tue,  6 Oct 2026 11:53:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7243663008782555512=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_gpu/buddy=3A_do_not_pass_ca?=
 =?utf-8?q?ller_list_to_=5F=5Falloc=5Fcontig=5Ftry=5Fharder=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 06 Oct 2026 11:53:57 -0000
Message-ID: <179128763716.243927.2475257866464708631@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006110706.1636971-2-matthew.auld@intel.com>
In-Reply-To: <20261006110706.1636971-2-matthew.auld@intel.com>
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

--===============7243663008782555512==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: do not pass caller list to __alloc_contig_try_harder()
URL   : https://patchwork.freedesktop.org/series/175611/
State : success

== Summary ==

CI Bug Log - changes from xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6_BAT -> xe-pw-175611v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-lnl-1 

Known issues
------------

  Here are the changes found in xe-pw-175611v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175611v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6 -> xe-pw-175611v1

  IGT_9130: 9130
  xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6: 4043ef7a9db48c52beb26b369cbbb29d623105c6
  xe-pw-175611v1: 175611v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175611v1/index.html

--===============7243663008782555512==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: do not pass caller list to __alloc_contig_try_harder()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175611/">https://patchwork.freedesktop.org/series/175611/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175611v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175611v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6_BAT -&gt; xe-pw-175611v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-lnl-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175611v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175611v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6 -&gt; xe-pw-175611v1</li>
</ul>
<p>IGT_9130: 9130<br />
  xe-5894-4043ef7a9db48c52beb26b369cbbb29d623105c6: 4043ef7a9db48c52beb26b369cbbb29d623105c6<br />
  xe-pw-175611v1: 175611v1</p>

</body>
</html>

--===============7243663008782555512==--
