Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D10E3E77188
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jan 2025 01:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CEFA10EA4C;
	Tue,  7 Jan 2025 01:07:08 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6075F89CAC;
 Tue,  7 Jan 2025 01:07:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5388323507242785110=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Remove_unused_=22?=
 =?utf-8?q?mmio=5Fext=22_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 07 Jan 2025 01:07:07 -0000
Message-ID: <173621202738.536913.5633681225635188036@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250106234312.2986065-2-matthew.d.roper@intel.com>
In-Reply-To: <20250106234312.2986065-2-matthew.d.roper@intel.com>
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

--===============5388323507242785110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Remove unused "mmio_ext" code
URL   : https://patchwork.freedesktop.org/series/143166/
State : success

== Summary ==

CI Bug Log - changes from xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421_BAT -> xe-pw-143166v1_BAT
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

  Here are the changes found in xe-pw-143166v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3:
    - bat-bmg-1:          [DMESG-WARN][1] ([Intel XE#877]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3.html

  
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877


Build changes
-------------

  * Linux: xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421 -> xe-pw-143166v1

  IGT_8176: 5e65135d3d7cf5298a58bcd6137c77205704bcf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421: a322fb77281fc52ebad7363980fc633a76bc6421
  xe-pw-143166v1: 143166v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/index.html

--===============5388323507242785110==
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
<tr><td><b>Series:</b></td><td>drm/xe: Remove unused &quot;mmio_ext&quot; code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143166/">https://patchwork.freedesktop.org/series/143166/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421_BAT -&gt; xe-pw-143166v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-143166v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143166v1/bat-bmg-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-hdmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421 -&gt; xe-pw-143166v1</li>
</ul>
<p>IGT_8176: 5e65135d3d7cf5298a58bcd6137c77205704bcf9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2444-a322fb77281fc52ebad7363980fc633a76bc6421: a322fb77281fc52ebad7363980fc633a76bc6421<br />
  xe-pw-143166v1: 143166v1</p>

</body>
</html>

--===============5388323507242785110==--
