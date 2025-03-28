Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9867C3600B
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 00:28:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A89710E01F;
	Fri, 28 Mar 2025 00:28:43 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEE810E01F;
 Fri, 28 Mar 2025 00:28:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5232782445380694949=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_LFD_forma?=
 =?utf-8?q?t_output_for_guc_log_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dong, Zhanjun" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 00:28:42 -0000
Message-ID: <174312172245.13007.509228357296153128@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250327234028.249314-1-zhanjun.dong@intel.com>
In-Reply-To: <20250327234028.249314-1-zhanjun.dong@intel.com>
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

--===============5232782445380694949==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add LFD format output for guc log (rev2)
URL   : https://patchwork.freedesktop.org/series/146541/
State : success

== Summary ==

CI Bug Log - changes from xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347_BAT -> xe-pw-146541v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-146541v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1] ([Intel XE#3970])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [ABORT][2] ([Intel XE#3970]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347 -> xe-pw-146541v2

  IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347: 07da08a11ef28446f1a8f42f6a9b2b38971e9347
  xe-pw-146541v2: 146541v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/index.html

--===============5232782445380694949==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add LFD format output for guc log (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146541/">https://patchwork.freedesktop.org/series/146541/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347_BAT -&gt; xe-pw-146541v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-146541v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_vm@munmap-style-unbind-userptr-inval-front:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/bat-adlp-vf/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146541v2/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347 -&gt; xe-pw-146541v2</li>
</ul>
<p>IGT_8291: a1809bc9d786d9b37a22e3e5e4810c6a0c84480b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2864-07da08a11ef28446f1a8f42f6a9b2b38971e9347: 07da08a11ef28446f1a8f42f6a9b2b38971e9347<br />
  xe-pw-146541v2: 146541v2</p>

</body>
</html>

--===============5232782445380694949==--
