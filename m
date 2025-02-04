Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F53C02194
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 12:42:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E050110E604;
	Tue,  4 Feb 2025 12:42:36 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B041910E604;
 Tue,  4 Feb 2025 12:42:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4286985231088838090=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Allow_d?=
 =?utf-8?q?isplay_PHYs_to_reset_power_state_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 12:42:35 -0000
Message-ID: <173867295568.863785.4234225169806287723@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204105358.284687-1-mika.kahola@intel.com>
In-Reply-To: <20250204105358.284687-1-mika.kahola@intel.com>
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

--===============4286985231088838090==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Allow display PHYs to reset power state (rev2)
URL   : https://patchwork.freedesktop.org/series/144103/
State : success

== Summary ==

CI Bug Log - changes from xe-2591-d3f7add53c15ed866828937f140ac252c19f2411_BAT -> xe-pw-144103v2_BAT
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

  Here are the changes found in xe-pw-144103v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-bmg-1:          [PASS][1] -> [DMESG-WARN][2] ([Intel XE#877])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@intel-bb-blit-x:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#3970] / [Intel XE#4078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html

  
#### Possible fixes ####

  * igt@xe_pat@pat-index-xelp@render:
    - bat-adlp-vf:        [DMESG-WARN][5] ([Intel XE#3970] / [Intel XE#4078]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html

  
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * IGT: IGT_8222 -> IGT_8223
  * Linux: xe-2591-d3f7add53c15ed866828937f140ac252c19f2411 -> xe-pw-144103v2

  IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2591-d3f7add53c15ed866828937f140ac252c19f2411: d3f7add53c15ed866828937f140ac252c19f2411
  xe-pw-144103v2: 144103v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/index.html

--===============4286985231088838090==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Allow display PHYs to reset power state (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144103/">https://patchwork.freedesktop.org/series/144103/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2591-d3f7add53c15ed866828937f140ac252c19f2411_BAT -&gt; xe-pw-144103v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144103v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-bmg-1/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-x:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-adlp-vf/igt@xe_intel_bb@intel-bb-blit-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xelp@render:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2591-d3f7add53c15ed866828937f140ac252c19f2411/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144103v2/bat-adlp-vf/igt@xe_pat@pat-index-xelp@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8222 -&gt; IGT_8223</li>
<li>Linux: xe-2591-d3f7add53c15ed866828937f140ac252c19f2411 -&gt; xe-pw-144103v2</li>
</ul>
<p>IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8223: ccfe042787b082c06402ff9af257f8338b8edd5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2591-d3f7add53c15ed866828937f140ac252c19f2411: d3f7add53c15ed866828937f140ac252c19f2411<br />
  xe-pw-144103v2: 144103v2</p>

</body>
</html>

--===============4286985231088838090==--
