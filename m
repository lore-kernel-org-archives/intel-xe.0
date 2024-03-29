Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF66FCD1284
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 01:41:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8635810E998;
	Fri, 29 Mar 2024 01:41:50 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DB510E998;
 Fri, 29 Mar 2024 01:41:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1731799594809627167=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/hwmon=3A_Add_infra_to_sup?=
 =?utf-8?q?port_card_power_and_energy_attributes_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 01:41:49 -0000
Message-ID: <171167650925.1064396.4305522389865567527@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240328175435.3870957-1-karthik.poosa@intel.com>
In-Reply-To: <20240328175435.3870957-1-karthik.poosa@intel.com>
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

--===============1731799594809627167==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Add infra to support card power and energy attributes (rev5)
URL   : https://patchwork.freedesktop.org/series/131059/
State : success

== Summary ==

CI Bug Log - changes from xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f_BAT -> xe-pw-131059v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-131059v5_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_gt_freq@freq_basic_api:
    - {bat-lnl-1}:        [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html

  * igt@xe_pat@pat-index-xehpc:
    - {bat-lnl-1}:        NOTRUN -> [SKIP][3] +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  
Known issues
------------

  Here are the changes found in xe-pw-131059v5_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_mmap@cpu-caching:
    - {bat-lnl-1}:        [INCOMPLETE][4] -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).



Build changes
-------------

  * Linux: xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f -> xe-pw-131059v5

  IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f: 2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f
  xe-pw-131059v5: 131059v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/index.html

--===============1731799594809627167==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Add infra to support card power and energy attributes (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131059/">https://patchwork.freedesktop.org/series/131059/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f_BAT -&gt; xe-pw-131059v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-131059v5_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_gt_freq@freq_basic_api:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_gt_freq@freq_basic_api.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>{bat-lnl-1}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131059v5_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_mmap@cpu-caching:<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f/bat-lnl-1/igt@xe_mmap@cpu-caching.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131059v5/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f -&gt; xe-pw-131059v5</li>
</ul>
<p>IGT_7790: 5ec1ff6da3535cf80fd4e1844867d75c481ef86a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1012-2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f: 2d5dd7e81854b3cc0f82cd9706d78dc71fe24a5f<br />
  xe-pw-131059v5: 131059v5</p>

</body>
</html>

--===============1731799594809627167==--
