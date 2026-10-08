Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87A3DCA6007
	for <intel-xe@archiver.kernel.org>; Thu,  8 Oct 2026 14:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F0CF10E896;
	Thu,  8 Oct 2026 14:00:49 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2441610E896;
 Thu,  8 Oct 2026 14:00:48 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1687435022211365573=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Adjust_the_bo_shr?=
 =?utf-8?q?inker_batch_size_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 08 Oct 2026 14:00:48 -0000
Message-ID: <179146804814.252138.10816571874329754445@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261008123024.38522-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261008123024.38522-1-thomas.hellstrom@linux.intel.com>
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

--===============1687435022211365573==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Adjust the bo shrinker batch size (rev3)
URL   : https://patchwork.freedesktop.org/series/166426/
State : success

== Summary ==

CI Bug Log - changes from xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c_BAT -> xe-pw-166426v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c_BAT and xe-pw-166426v3_BAT:

### New IGT tests (1) ###

  * igt@core_hotunplug@unbind-rebind:
    - Statuses : 1 abort(s) 13 pass(s)
    - Exec time: [0.0, 9.70] s

  

Known issues
------------

  Here are the changes found in xe-pw-166426v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind (NEW):
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -> xe-pw-166426v3

  IGT_9135: 9135
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c
  xe-pw-166426v3: 166426v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v3/index.html

--===============1687435022211365573==
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
<tr><td><b>Series:</b></td><td>drm/xe: Adjust the bo shrinker batch size (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166426/">https://patchwork.freedesktop.org/series/166426/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c_BAT -&gt; xe-pw-166426v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c_BAT and xe-pw-166426v3_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>Statuses : 1 abort(s) 13 pass(s)</li>
<li>Exec time: [0.0, 9.70] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166426v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind (NEW):<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c -&gt; xe-pw-166426v3</li>
</ul>
<p>IGT_9135: 9135<br />
  xe-5906-95bc52ddf34f72a3996b1f32e946304d3823be3c: 95bc52ddf34f72a3996b1f32e946304d3823be3c<br />
  xe-pw-166426v3: 166426v3</p>

</body>
</html>

--===============1687435022211365573==--
