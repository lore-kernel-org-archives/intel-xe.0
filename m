Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ABDCCA0FF0
	for <intel-xe@archiver.kernel.org>; Fri, 29 Aug 2025 18:09:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C57B810EC21;
	Fri, 29 Aug 2025 18:09:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2215110EC21;
 Fri, 29 Aug 2025 18:09:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3065318694535139251=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Add_SLPC_powe?=
 =?utf-8?q?r_profile_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Aug 2025 18:09:24 -0000
Message-ID: <175649096413.285817.9219599196085054103@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20250829164308.1346909-1-vinay.belgaumkar@intel.com>
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

--===============3065318694535139251==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Add SLPC power profile interface
URL   : https://patchwork.freedesktop.org/series/153723/
State : success

== Summary ==

CI Bug Log - changes from xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6_BAT -> xe-pw-153723v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153723v1_BAT:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@core_debugfs@read-all-entries}:
    - bat-atsm-2:         [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-atsm-2/igt@core_debugfs@read-all-entries.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-atsm-2/igt@core_debugfs@read-all-entries.html

  
Known issues
------------

  Here are the changes found in xe-pw-153723v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-dpms:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] ([Intel XE#4543]) +3 other tests dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-adlp-7:         [DMESG-WARN][5] ([Intel XE#4543]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543


Build changes
-------------

  * IGT: IGT_8516 -> IGT_8517
  * Linux: xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6 -> xe-pw-153723v1

  IGT_8516: 8516
  IGT_8517: 8517
  xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6: 9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6
  xe-pw-153723v1: 153723v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/index.html

--===============3065318694535139251==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Add SLPC power profile interface</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/153723/">https://patchwork.freedesktop.org/series/153723/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6_BAT -&gt; xe-pw-153723v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-153723v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@core_debugfs@read-all-entries}:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-atsm-2/igt@core_debugfs@read-all-entries.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-atsm-2/igt@core_debugfs@read-all-entries.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153723v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-dpms:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-modeset:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8516 -&gt; IGT_8517</li>
<li>Linux: xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6 -&gt; xe-pw-153723v1</li>
</ul>
<p>IGT_8516: 8516<br />
  IGT_8517: 8517<br />
  xe-3639-9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6: 9c9bbfa81276408b7702ec6ea6332bd8a86cc0b6<br />
  xe-pw-153723v1: 153723v1</p>

</body>
</html>

--===============3065318694535139251==--
