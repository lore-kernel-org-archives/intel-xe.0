Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5F9C0218F
	for <intel-xe@archiver.kernel.org>; Tue,  4 Feb 2025 07:56:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44DBD10E2B2;
	Tue,  4 Feb 2025 07:56:10 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93A610E2B2;
 Tue,  4 Feb 2025 07:56:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8654446968595380310=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_DRM_device_wedged?=
 =?utf-8?q?_event_=28rev10=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Feb 2025 07:56:08 -0000
Message-ID: <173865576881.748045.9849674346623443675@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250204070528.1919158-1-raag.jadav@intel.com>
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
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

--===============8654446968595380310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce DRM device wedged event (rev10)
URL   : https://patchwork.freedesktop.org/series/138070/
State : success

== Summary ==

CI Bug Log - changes from xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db_BAT -> xe-pw-138070v10_BAT
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

  Here are the changes found in xe-pw-138070v10_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-vf:        [PASS][1] -> [SKIP][2] ([Intel XE#1192]) +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@shared-pte-page:
    - bat-adlp-vf:        [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_vm@shared-pte-page.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_vm@shared-pte-page.html

  
#### Warnings ####

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-vf:        [SKIP][5] ([Intel XE#2229] / [Intel XE#455]) -> [SKIP][6] ([Intel XE#1192])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html

  
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#4078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455


Build changes
-------------

  * IGT: IGT_8221 -> IGT_8222
  * Linux: xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db -> xe-pw-138070v10

  IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db: e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db
  xe-pw-138070v10: 138070v10

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/index.html

--===============8654446968595380310==
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
<tr><td><b>Series:</b></td><td>Introduce DRM device wedged event (rev10)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138070/">https://patchwork.freedesktop.org/series/138070/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db_BAT -&gt; xe-pw-138070v10_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138070v10_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@shared-pte-page:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_vm@shared-pte-page.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4078">Intel XE#4078</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_live_ktest@xe_bo:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138070v10/bat-adlp-vf/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8221 -&gt; IGT_8222</li>
<li>Linux: xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db -&gt; xe-pw-138070v10</li>
</ul>
<p>IGT_8221: ad1f57286d15d083b08c94f3d93600db85f9945b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8222: 1cb35b0ba29858e1fe0f61c0c70164fe858bb271 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2590-e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db: e300f8946bc0ce873e4c4bc1a2cd05e7b617b1db<br />
  xe-pw-138070v10: 138070v10</p>

</body>
</html>

--===============8654446968595380310==--
