Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334FAC88E72
	for <intel-xe@archiver.kernel.org>; Thu, 17 Sep 2026 17:54:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDFB510E00A;
	Thu, 17 Sep 2026 17:54:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 693C210E00A;
 Thu, 17 Sep 2026 17:54:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5005663983482814567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_fix_GuC_TLB_inval?=
 =?utf-8?q?idation_ack_stalls_on_ARL_=28Wa=5F22016122933=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Tales_A=2E_Mendon=C3=A7a?= <talesam@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Sep 2026 17:54:39 -0000
Message-ID: <178966767942.178464.4125098185319360877@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260917163553.1742580-1-talesam@gmail.com>
In-Reply-To: <20260917163553.1742580-1-talesam@gmail.com>
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

--===============5005663983482814567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev3)
URL   : https://patchwork.freedesktop.org/series/172110/
State : success

== Summary ==

CI Bug Log - changes from xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840_BAT -> xe-pw-172110v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-172110v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * Linux: xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840 -> xe-pw-172110v3

  IGT_9099: 9099
  xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840: d4289677143a2d09ce25eb883b0bf16fd7135840
  xe-pw-172110v3: 172110v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v3/index.html

--===============5005663983482814567==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix GuC TLB invalidation ack stalls on ARL (Wa_22016122933) (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172110/">https://patchwork.freedesktop.org/series/172110/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840_BAT -&gt; xe-pw-172110v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172110v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172110v3/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840 -&gt; xe-pw-172110v3</li>
</ul>
<p>IGT_9099: 9099<br />
  xe-5765-d4289677143a2d09ce25eb883b0bf16fd7135840: d4289677143a2d09ce25eb883b0bf16fd7135840<br />
  xe-pw-172110v3: 172110v3</p>

</body>
</html>

--===============5005663983482814567==--
