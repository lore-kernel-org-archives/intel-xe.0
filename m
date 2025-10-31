Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34427CCF9FE
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 13:54:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B861C10E062;
	Fri, 31 Oct 2025 13:54:38 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A046410EBBC;
 Fri, 31 Oct 2025 13:54:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8236547104170086174=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Add_MTL?=
 =?utf-8?q?+_platforms_to_support_dpll_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 13:54:36 -0000
Message-ID: <176191887664.5608.16761211833121971626@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031103549.173208-1-mika.kahola@intel.com>
In-Reply-To: <20251031103549.173208-1-mika.kahola@intel.com>
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

--===============8236547104170086174==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add MTL+ platforms to support dpll framework (rev2)
URL   : https://patchwork.freedesktop.org/series/155278/
State : success

== Summary ==

CI Bug Log - changes from xe-4020-279e4027491d181818dd0a873b13fa42f69269cc_BAT -> xe-pw-155278v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155278v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-plain-flip@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][3] -> [ABORT][4] ([Intel XE#1727] / [Intel XE#4760])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][5] -> [ABORT][6] ([Intel XE#4760])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-bmg-1/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760


Build changes
-------------

  * Linux: xe-4020-279e4027491d181818dd0a873b13fa42f69269cc -> xe-pw-155278v2

  IGT_8604: 8604
  xe-4020-279e4027491d181818dd0a873b13fa42f69269cc: 279e4027491d181818dd0a873b13fa42f69269cc
  xe-pw-155278v2: 155278v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/index.html

--===============8236547104170086174==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add MTL+ platforms to support dpll framework (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155278/">https://patchwork.freedesktop.org/series/155278/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4020-279e4027491d181818dd0a873b13fa42f69269cc_BAT -&gt; xe-pw-155278v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155278v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-plain-flip@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-adlp-7/igt@kms_flip@basic-plain-flip@a-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4020-279e4027491d181818dd0a873b13fa42f69269cc/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155278v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4020-279e4027491d181818dd0a873b13fa42f69269cc -&gt; xe-pw-155278v2</li>
</ul>
<p>IGT_8604: 8604<br />
  xe-4020-279e4027491d181818dd0a873b13fa42f69269cc: 279e4027491d181818dd0a873b13fa42f69269cc<br />
  xe-pw-155278v2: 155278v2</p>

</body>
</html>

--===============8236547104170086174==--
