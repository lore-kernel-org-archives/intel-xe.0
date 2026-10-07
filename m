Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53039CA6009
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 22:32:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BE910E6B1;
	Wed,  7 Oct 2026 22:32:31 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7440110E6B1;
 Wed,  7 Oct 2026 22:32:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2806929203813641340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Convert_IO=5FBUS_?=
 =?utf-8?q?errors_to_structured_xe=5Flog_API_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 22:32:29 -0000
Message-ID: <179141234946.250324.9408657866219135055@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20261007211417.2093611-1-dnyaneshwar.bhadane@intel.com>
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

--===============2806929203813641340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Convert IO_BUS errors to structured xe_log API (rev5)
URL   : https://patchwork.freedesktop.org/series/172475/
State : success

== Summary ==

CI Bug Log - changes from xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211_BAT -> xe-pw-172475v5_BAT
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

  Here are the changes found in xe-pw-172475v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-bmg-2:          [ABORT][1] ([Intel XE#9463]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html
    - bat-nvls-1:         [DMESG-WARN][3] ([Intel XE#8762] / [Intel XE#9069]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html

  
  [Intel XE#8762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762
  [Intel XE#9069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463


Build changes
-------------

  * Linux: xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211 -> xe-pw-172475v5

  IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211: e2193f15b4b009baae0b7cb7fc337a6fe80dd211
  xe-pw-172475v5: 172475v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/index.html

--===============2806929203813641340==
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
<tr><td><b>Series:</b></td><td>drm/xe: Convert IO_BUS errors to structured xe_log API (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172475/">https://patchwork.freedesktop.org/series/172475/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211_BAT -&gt; xe-pw-172475v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172475v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/bat-bmg-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
<li>bat-nvls-1:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8762">Intel XE#8762</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9069">Intel XE#9069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172475v5/bat-nvls-1/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211 -&gt; xe-pw-172475v5</li>
</ul>
<p>IGT_9134: 23f88758399c4e526aab1db26f35208faea9816a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5904-e2193f15b4b009baae0b7cb7fc337a6fe80dd211: e2193f15b4b009baae0b7cb7fc337a6fe80dd211<br />
  xe-pw-172475v5: 172475v5</p>

</body>
</html>

--===============2806929203813641340==--
