Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01BA3C27C53
	for <intel-xe@archiver.kernel.org>; Wed, 19 Jun 2024 15:18:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C298110ECFD;
	Wed, 19 Jun 2024 15:18:28 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 873FD10ED00;
 Wed, 19 Jun 2024 15:18:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1983412650436767061=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/2=5D_d?=
 =?utf-8?q?rm/xe/bmg=3A_implement_Wa=5F16023588340?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Jun 2024 15:18:27 -0000
Message-ID: <171881030754.124989.2107091900480118908@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619143127.110045-3-matthew.auld@intel.com>
In-Reply-To: <20240619143127.110045-3-matthew.auld@intel.com>
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

--===============1983412650436767061==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/bmg: implement Wa_16023588340
URL   : https://patchwork.freedesktop.org/series/135061/
State : success

== Summary ==

CI Bug Log - changes from xe-1497-207282b212f760b65686198827bbb9b429a1ab90_BAT -> xe-pw-135061v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-135061v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_intel_bb@blit-simple:
    - bat-atsm-2:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#2110])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1497-207282b212f760b65686198827bbb9b429a1ab90/bat-atsm-2/igt@xe_intel_bb@blit-simple.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/bat-atsm-2/igt@xe_intel_bb@blit-simple.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         [PASS][3] -> [SKIP][4] ([Intel XE#2109]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1497-207282b212f760b65686198827bbb9b429a1ab90/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  
  [Intel XE#2109]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109
  [Intel XE#2110]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2110


Build changes
-------------

  * Linux: xe-1497-207282b212f760b65686198827bbb9b429a1ab90 -> xe-pw-135061v1

  IGT_7892: 7892
  xe-1497-207282b212f760b65686198827bbb9b429a1ab90: 207282b212f760b65686198827bbb9b429a1ab90
  xe-pw-135061v1: 135061v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/index.html

--===============1983412650436767061==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/bmg: implement Wa_16023588340</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135061/">https://patchwork.freedesktop.org/series/135061/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1497-207282b212f760b65686198827bbb9b429a1ab90_BAT -&gt; xe-pw-135061v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-135061v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_intel_bb@blit-simple:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1497-207282b212f760b65686198827bbb9b429a1ab90/bat-atsm-2/igt@xe_intel_bb@blit-simple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/bat-atsm-2/igt@xe_intel_bb@blit-simple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2110">Intel XE#2110</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1497-207282b212f760b65686198827bbb9b429a1ab90/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135061v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2109">Intel XE#2109</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1497-207282b212f760b65686198827bbb9b429a1ab90 -&gt; xe-pw-135061v1</li>
</ul>
<p>IGT_7892: 7892<br />
  xe-1497-207282b212f760b65686198827bbb9b429a1ab90: 207282b212f760b65686198827bbb9b429a1ab90<br />
  xe-pw-135061v1: 135061v1</p>

</body>
</html>

--===============1983412650436767061==--
