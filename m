Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B82CCD98CC
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 11:34:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF02C10EE9A;
	Thu, 11 Jun 2026 11:34:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B8A910EE98;
 Thu, 11 Jun 2026 11:34:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2311372384326559923=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_wa=5F14025941?=
 =?utf-8?q?587_to_xe2=2C_xe3_and_xe3p_platforms_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 11:34:00 -0000
Message-ID: <178117764049.68362.8104411816465435409@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611103042.1044942-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260611103042.1044942-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============2311372384326559923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev4)
URL   : https://patchwork.freedesktop.org/series/167706/
State : success

== Summary ==

CI Bug Log - changes from xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5_BAT -> xe-pw-167706v4_BAT
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

  Here are the changes found in xe-pw-167706v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_dma_buf:
    - bat-bmg-vm:         [PASS][1] -> [ABORT][2] ([Intel XE#8007] / [Intel XE#8023]) +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v4/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html

  
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023


Build changes
-------------

  * Linux: xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5 -> xe-pw-167706v4

  IGT_8958: 8958
  xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5: 4fdfaadba04dc0f2f2490dbc91922caa290463a5
  xe-pw-167706v4: 167706v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v4/index.html

--===============2311372384326559923==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167706/">https://patchwork.freedesktop.org/series/167706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5_BAT -&gt; xe-pw-167706v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167706v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@xe_dma_buf:<ul>
<li>bat-bmg-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v4/bat-bmg-vm/igt@xe_live_ktest@xe_dma_buf.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8023">Intel XE#8023</a>) +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5 -&gt; xe-pw-167706v4</li>
</ul>
<p>IGT_8958: 8958<br />
  xe-5239-4fdfaadba04dc0f2f2490dbc91922caa290463a5: 4fdfaadba04dc0f2f2490dbc91922caa290463a5<br />
  xe-pw-167706v4: 167706v4</p>

</body>
</html>

--===============2311372384326559923==--
