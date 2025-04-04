Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD43FC36010
	for <intel-xe@archiver.kernel.org>; Fri,  4 Apr 2025 05:04:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B02410E009;
	Fri,  4 Apr 2025 05:04:30 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DE0C10E009;
 Fri,  4 Apr 2025 05:04:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8266293643805533076=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_VF=3A_Don=27t_update_GuC_re?=
 =?utf-8?q?set_policy_when_changing_wedged_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 04 Apr 2025 05:04:29 -0000
Message-ID: <174374306950.37340.11890053908493720752@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250403094141.25941-1-lukasz.laguna@intel.com>
In-Reply-To: <20250403094141.25941-1-lukasz.laguna@intel.com>
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

--===============8266293643805533076==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Don't update GuC reset policy when changing wedged mode
URL   : https://patchwork.freedesktop.org/series/147195/
State : success

== Summary ==

CI Bug Log - changes from xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded_BAT -> xe-pw-147195v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-147195v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4508]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147195v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#4508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508


Build changes
-------------

  * IGT: IGT_8302 -> IGT_8303
  * Linux: xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded -> xe-pw-147195v1

  IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded
  xe-pw-147195v1: 147195v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147195v1/index.html

--===============8266293643805533076==
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
<tr><td><b>Series:</b></td><td>VF: Don&#x27;t update GuC reset policy when changing wedged mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147195/">https://patchwork.freedesktop.org/series/147195/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147195v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147195v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded_BAT -&gt; xe-pw-147195v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147195v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_migrate:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147195v1/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4508">Intel XE#4508</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8302 -&gt; IGT_8303</li>
<li>Linux: xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded -&gt; xe-pw-147195v1</li>
</ul>
<p>IGT_8302: e2f972e6e21cd7bae732a649889325d2175bd1a5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8303: 4030608e18806243e34ecd3b0b64494fc7d2f9fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2900-135e2838ed7d44d880e7e19971b1234e6ae04ded: 135e2838ed7d44d880e7e19971b1234e6ae04ded<br />
  xe-pw-147195v1: 147195v1</p>

</body>
</html>

--===============8266293643805533076==--
