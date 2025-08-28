Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8ACDCA0FED
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 00:59:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC7B10E030;
	Thu, 28 Aug 2025 00:59:14 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9A4810E002;
 Thu, 28 Aug 2025 00:59:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7236853051175903468=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Update_GuC_lo?=
 =?utf-8?q?g_buffer_type_value?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 00:59:13 -0000
Message-ID: <175634275368.275917.3654434556536379531@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250827215217.1030775-1-zhanjun.dong@intel.com>
In-Reply-To: <20250827215217.1030775-1-zhanjun.dong@intel.com>
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

--===============7236853051175903468==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Update GuC log buffer type value
URL   : https://patchwork.freedesktop.org/series/153591/
State : success

== Summary ==

CI Bug Log - changes from xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578_BAT -> xe-pw-153591v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153591v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [DMESG-WARN][1] ([Intel XE#4543]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153591v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * IGT: IGT_8511 -> IGT_8512
  * Linux: xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578 -> xe-pw-153591v1

  IGT_8511: 8511
  IGT_8512: 8512
  xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578: 3a2760f3080e5188b19cdb4640cec5eb0926d578
  xe-pw-153591v1: 153591v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153591v1/index.html

--===============7236853051175903468==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Update GuC log buffer type value</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153591/">https://patchwork.freedesktop.org/series/153591/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153591v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153591v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578_BAT -&gt; xe-pw-153591v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153591v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153591v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8511 -&gt; IGT_8512</li>
<li>Linux: xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578 -&gt; xe-pw-153591v1</li>
</ul>
<p>IGT_8511: 8511<br />
  IGT_8512: 8512<br />
  xe-3623-3a2760f3080e5188b19cdb4640cec5eb0926d578: 3a2760f3080e5188b19cdb4640cec5eb0926d578<br />
  xe-pw-153591v1: 153591v1</p>

</body>
</html>

--===============7236853051175903468==--
