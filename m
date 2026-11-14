Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08396606A327
	for <intel-xe@archiver.kernel.org>; Sat, 14 Nov 2026 08:25:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD4210E16F;
	Sat, 14 Nov 2026 08:25:03 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D62F10E16F;
 Sat, 14 Nov 2026 08:25:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7036208035950397888=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_series_starting_with_=5BCI?=
 =?utf-8?q?=2C1/2=5D_drm/xe/wopcm=3A_Use_the_size_from_HW_when_excluding_the?=
 =?utf-8?q?_wopcm_range_from_GGTT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Nov 2026 08:25:02 -0000
Message-ID: <179464470230.23895.4918656624639744897@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
In-Reply-To: <20261113191739.1447747-3-daniele.ceraolospurio@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7036208035950397888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT
URL   : https://patchwork.freedesktop.org/series/178529/
State : success

== Summary ==

CI Bug Log - changes from xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e_FULL -> xe-pw-178529v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-178529v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#367])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2652]) +3 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][4] ([Intel XE#3304] / [Intel XE#7374])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][5] ([Intel XE#3304])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][6] ([Intel XE#6707] / [Intel XE#7439])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-10/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#3321]) +3 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][9] -> [SKIP][10] ([Intel XE#1503])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#9780]) +3 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html

  * igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13] ([Intel XE#8652])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-8/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-2/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][14] -> [ABORT][15] ([Intel XE#9362])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-8/igt@xe_pm@s4-basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-5/igt@xe_pm@s4-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][16] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][18] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][20] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][21] +1 other test pass
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:
    - shard-ptl:          [DMESG-WARN][22] ([Intel XE#8652]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][24] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][25] ([Intel XE#301])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][26] ([Intel XE#9365]) -> [DMESG-WARN][27] ([Intel XE#9762])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-1/igt@xe_survivability@runtime-survivability.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780


Build changes
-------------

  * Linux: xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e -> xe-pw-178529v1

  IGT_9192: 9192
  xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e: ddc259b91140f0c62cb589c3f9101498db73133e
  xe-pw-178529v1: 178529v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/index.html

--===============7036208035950397888==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/2] drm/xe/wopcm: Use the size from HW when excluding the wopcm range from GGTT</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178529/">https://patchwork.freedesktop.org/series/178529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e_FULL -&gt; xe-pw-178529v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178529v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-3/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-10/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-10/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-c-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-8/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-2/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-5/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-ptl-1/igt@xe_exec_reset@gt-stress-reset-mixed-engine-usage.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178529v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e -&gt; xe-pw-178529v1</li>
</ul>
<p>IGT_9192: 9192<br />
  xe-6138-ddc259b91140f0c62cb589c3f9101498db73133e: ddc259b91140f0c62cb589c3f9101498db73133e<br />
  xe-pw-178529v1: 178529v1</p>

</body>
</html>

--===============7036208035950397888==--
