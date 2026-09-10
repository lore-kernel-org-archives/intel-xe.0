Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B45FC79F9F
	for <intel-xe@archiver.kernel.org>; Thu, 10 Sep 2026 18:45:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC55610E2C8;
	Thu, 10 Sep 2026 18:45:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A14DE10E2C8;
 Thu, 10 Sep 2026 18:45:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0640260203223264464=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Add_Syste?=
 =?utf-8?q?m_Controller_debugfs_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Sep 2026 18:45:26 -0000
Message-ID: <178906592665.147924.5396533185629596092@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
In-Reply-To: <20260910175619.3176089-5-anoop.c.vijay@intel.com>
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

--===============0640260203223264464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add System Controller debugfs (rev5)
URL   : https://patchwork.freedesktop.org/series/161655/
State : success

== Summary ==

CI Bug Log - changes from xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_BAT -> xe-pw-161655v5_BAT
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

  Here are the changes found in xe-pw-161655v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-wcl-2:          [FAIL][1] ([Intel XE#9115]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/bat-wcl-2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v5/bat-wcl-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#9115]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115


Build changes
-------------

  * Linux: xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6 -> xe-pw-161655v5

  IGT_9090: 9090
  xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6: de0b423cd4c2178272a2057ee6c7b05fbd4015a6
  xe-pw-161655v5: 161655v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v5/index.html

--===============0640260203223264464==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add System Controller debugfs (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161655/">https://patchwork.freedesktop.org/series/161655/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6_BAT -&gt; xe-pw-161655v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161655v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6/bat-wcl-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9115">Intel XE#9115</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161655v5/bat-wcl-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6 -&gt; xe-pw-161655v5</li>
</ul>
<p>IGT_9090: 9090<br />
  xe-5723-de0b423cd4c2178272a2057ee6c7b05fbd4015a6: de0b423cd4c2178272a2057ee6c7b05fbd4015a6<br />
  xe-pw-161655v5: 161655v5</p>

</body>
</html>

--===============0640260203223264464==--
