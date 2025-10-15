Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F790CCD193
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 08:11:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C929510E28F;
	Wed, 15 Oct 2025 08:11:50 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8648C10E71E;
 Wed, 15 Oct 2025 08:11:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7971052436802450490=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe3=3A_Add_WA=5F1402?=
 =?utf-8?q?4681466_for_Xe3=5FLPG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 08:11:49 -0000
Message-ID: <176051590953.15142.2060238295517080005@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015075253.1036423-1-nitin.r.gote@intel.com>
In-Reply-To: <20251015075253.1036423-1-nitin.r.gote@intel.com>
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

--===============7971052436802450490==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3: Add WA_14024681466 for Xe3_LPG
URL   : https://patchwork.freedesktop.org/series/155961/
State : success

== Summary ==

CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -> xe-pw-155961v1_BAT
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

  Here are the changes found in xe-pw-155961v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#4543]) +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155961v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8582 -> IGT_8585
  * Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -> xe-pw-155961v1

  IGT_8582: 8582
  IGT_8585: 8585
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb
  xe-pw-155961v1: 155961v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155961v1/index.html

--===============7971052436802450490==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3: Add WA_14024681466 for Xe3_LPG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155961/">https://patchwork.freedesktop.org/series/155961/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155961v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155961v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb_BAT -&gt; xe-pw-155961v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 10)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155961v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155961v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8582 -&gt; IGT_8585</li>
<li>Linux: xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb -&gt; xe-pw-155961v1</li>
</ul>
<p>IGT_8582: 8582<br />
  IGT_8585: 8585<br />
  xe-3921-c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb: c6c2a6f0013cf24b117a1dd397c9e0530ff2f4cb<br />
  xe-pw-155961v1: 155961v1</p>

</body>
</html>

--===============7971052436802450490==--
