Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBAEFCB638
	for <intel-xe@archiver.kernel.org>; Fri,  6 Mar 2026 17:18:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E149C10E3D3;
	Fri,  6 Mar 2026 17:17:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FA6310E3D3;
 Fri,  6 Mar 2026 17:17:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1877076528526078067=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/lrc=3A_Fix_IS=5FERR_?=
 =?utf-8?q?check_on_wrong_pointer_in_xe=5Flrc=5Finit=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Mar 2026 17:17:59 -0000
Message-ID: <177281747910.328041.17586467241602966522@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260305184519.155060-1-shuicheng.lin@intel.com>
In-Reply-To: <20260305184519.155060-1-shuicheng.lin@intel.com>
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

--===============1877076528526078067==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lrc: Fix IS_ERR check on wrong pointer in xe_lrc_init()
URL   : https://patchwork.freedesktop.org/series/162701/
State : success

== Summary ==

CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_BAT -> xe-pw-162701v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-pvc-2 

Known issues
------------

  Here are the changes found in xe-pw-162701v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#7249])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162701v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#7249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249


Build changes
-------------

  * IGT: IGT_8782 -> IGT_8783
  * Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -> xe-pw-162701v1

  IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f
  xe-pw-162701v1: 162701v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162701v1/index.html

--===============1877076528526078067==
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
<tr><td><b>Series:</b></td><td>drm/xe/lrc: Fix IS_ERR check on wrong pointer in xe_lrc_init()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162701/">https://patchwork.freedesktop.org/series/162701/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162701v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162701v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f_BAT -&gt; xe-pw-162701v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162701v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162701v1/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7249">Intel XE#7249</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8782 -&gt; IGT_8783</li>
<li>Linux: xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f -&gt; xe-pw-162701v1</li>
</ul>
<p>IGT_8782: eac3b04d1f76b82ac3a183fb293c44e9185d8dba @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4674-a48305e6a2e6a1ed90df374101dd29542c105d8f: a48305e6a2e6a1ed90df374101dd29542c105d8f<br />
  xe-pw-162701v1: 162701v1</p>

</body>
</html>

--===============1877076528526078067==--
