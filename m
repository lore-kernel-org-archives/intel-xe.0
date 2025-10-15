Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBECFCCD18E
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 01:13:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA35C10E6C8;
	Wed, 15 Oct 2025 01:13:33 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79B6210E6C7;
 Wed, 15 Oct 2025 01:13:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8880235314336027994=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Minor_fixes_to?=
 =?utf-8?q?_post-migration_recovery_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 01:13:32 -0000
Message-ID: <176049081248.12561.16113012747515508776@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015002755.720992-1-tomasz.lis@intel.com>
In-Reply-To: <20251015002755.720992-1-tomasz.lis@intel.com>
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

--===============8880235314336027994==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Minor fixes to post-migration recovery (rev2)
URL   : https://patchwork.freedesktop.org/series/155865/
State : success

== Summary ==

CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -> xe-pw-155865v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 10)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155865v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - {bat-ptl-1}:        [ABORT][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - {bat-ptl-2}:        [ABORT][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5775]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5775
  [Intel XE#5776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5776
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780


Build changes
-------------

  * IGT: IGT_8582 -> IGT_8584
  * Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -> xe-pw-155865v2

  IGT_8582: 8582
  IGT_8584: 8584
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
  xe-pw-155865v2: 155865v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/index.html

--===============8880235314336027994==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Minor fixes to post-migration recovery (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155865/">https://patchwork.freedesktop.org/series/155865/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -&gt; xe-pw-155865v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155865v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/bat-ptl-1/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>{bat-ptl-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155865v2/bat-ptl-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGT_8584</li>
<li>Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -&gt; xe-pw-155865v2</li>
</ul>
<p>IGT_8582: 8582<br />
  IGT_8584: 8584<br />
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb<br />
  xe-pw-155865v2: 155865v2</p>

</body>
</html>

--===============8880235314336027994==--
