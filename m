Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36CD8EF3719
	for <intel-xe@archiver.kernel.org>; Mon,  9 Mar 2026 08:44:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10C010E4AE;
	Mon,  9 Mar 2026 08:44:50 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC39810E4A8;
 Mon,  9 Mar 2026 08:44:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5190928377139723538=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_Wa=5F14026578?=
 =?utf-8?q?760_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 09 Mar 2026 08:44:49 -0000
Message-ID: <177304588968.332521.2614409299943255457@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260309063923.4031933-1-varun.gupta@intel.com>
In-Reply-To: <20260309063923.4031933-1-varun.gupta@intel.com>
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

--===============5190928377139723538==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add Wa_14026578760 (rev3)
URL   : https://patchwork.freedesktop.org/series/162396/
State : success

== Summary ==

CI Bug Log - changes from xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84_BAT -> xe-pw-162396v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-162396v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_module_load@load:
    - bat-wcl-1:          [PASS][3] -> [DMESG-WARN][4] ([Intel XE#7487])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-wcl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-wcl-1/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][5] ([Intel XE#7483]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
  [Intel XE#7487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7487


Build changes
-------------

  * Linux: xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84 -> xe-pw-162396v3

  IGT_8784: c7d12b3499ef1698373f246748e68c05ada0579e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84: 6884fe03ff2bc5a2f501ba4710f950dd4933ac84
  xe-pw-162396v3: 162396v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/index.html

--===============5190928377139723538==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add Wa_14026578760 (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162396/">https://patchwork.freedesktop.org/series/162396/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84_BAT -&gt; xe-pw-162396v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162396v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-wcl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-wcl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7487">Intel XE#7487</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162396v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84 -&gt; xe-pw-162396v3</li>
</ul>
<p>IGT_8784: c7d12b3499ef1698373f246748e68c05ada0579e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4678-6884fe03ff2bc5a2f501ba4710f950dd4933ac84: 6884fe03ff2bc5a2f501ba4710f950dd4933ac84<br />
  xe-pw-162396v3: 162396v3</p>

</body>
</html>

--===============5190928377139723538==--
