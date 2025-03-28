Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0336AC28B20
	for <intel-xe@archiver.kernel.org>; Fri, 28 Mar 2025 20:42:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBF4910EAC0;
	Fri, 28 Mar 2025 20:42:16 +0000 (UTC)
Received: from e6b6f09ec485 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DFE10EAC0;
 Fri, 28 Mar 2025 20:42:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4611283099545547752=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Enable_GuC_opt-in_features_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Mar 2025 20:42:15 -0000
Message-ID: <174319453514.17146.4061228807767501486@e6b6f09ec485>
X-Patchwork-Hint: ignore
References: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250328172837.2607990-1-daniele.ceraolospurio@intel.com>
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

--===============4611283099545547752==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Enable GuC opt-in features (rev3)
URL   : https://patchwork.freedesktop.org/series/145532/
State : success

== Summary ==

CI Bug Log - changes from xe-2872-7109b62b75330236cc892cd2a7b5826631286e35_BAT -> xe-pw-145532v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-145532v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        NOTRUN -> [ABORT][1] ([Intel XE#3970]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
#### Possible fixes ####

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [ABORT][2] ([Intel XE#3970]) -> [PASS][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2872-7109b62b75330236cc892cd2a7b5826631286e35/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970


Build changes
-------------

  * Linux: xe-2872-7109b62b75330236cc892cd2a7b5826631286e35 -> xe-pw-145532v3

  IGT_8292: 8292
  xe-2872-7109b62b75330236cc892cd2a7b5826631286e35: 7109b62b75330236cc892cd2a7b5826631286e35
  xe-pw-145532v3: 145532v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/index.html

--===============4611283099545547752==
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
<tr><td><b>Series:</b></td><td>Enable GuC opt-in features (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145532/">https://patchwork.freedesktop.org/series/145532/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2872-7109b62b75330236cc892cd2a7b5826631286e35_BAT -&gt; xe-pw-145532v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145532v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_vm@shared-pte-page:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2872-7109b62b75330236cc892cd2a7b5826631286e35/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145532v3/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2872-7109b62b75330236cc892cd2a7b5826631286e35 -&gt; xe-pw-145532v3</li>
</ul>
<p>IGT_8292: 8292<br />
  xe-2872-7109b62b75330236cc892cd2a7b5826631286e35: 7109b62b75330236cc892cd2a7b5826631286e35<br />
  xe-pw-145532v3: 145532v3</p>

</body>
</html>

--===============4611283099545547752==--
