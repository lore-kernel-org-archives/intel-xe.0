Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5278E77173
	for <intel-xe@archiver.kernel.org>; Mon,  9 Dec 2024 08:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9458710E668;
	Mon,  9 Dec 2024 08:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="feUclQZe";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 898B010E68F
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Dec 2024 08:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733733442; x=1765269442;
 h=message-id:date:mime-version:subject:to:references:cc:
 from:in-reply-to;
 bh=HTa6dB6j1jD1kjrqVHdxYAPmscIW4x73yQI96ttbvi8=;
 b=feUclQZe84uEtyWQVKhMhG4Ki9BtiuXaFIpXI5yZMrFOubBm4m39kLXJ
 vUKt4kx7tGPfrBhjkDdmaL6VRoaRyu9mVLXZgU/OPiHeAUbQkG2t26ZLA
 UuLUtrRwo4FtfeFNDiBqFAzSwat27NIyEshdq+003CHy5skfPJ1tWNaxO
 ylfvxLSUXuFOMmI8cYgJRMsSSixP59Puc5yVkIiNl6DENnoqlvBV44Jhc
 Otct+vxS+2YiM4y04N4kHwsWABjrCHoY1Jg3UYUn6PICkWlQcfq7xeFKO
 o4HTO8nBRcck9zMFci5udjHWG/+kIODlchdWTFeh05Sv/b/oLreqWjMc6 g==;
X-CSE-ConnectionGUID: 9ttN46XXTP+5UA6vJkfuDQ==
X-CSE-MsgGUID: sfo/YrCySXaBhbrTc85z3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33353239"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208,217";a="33353239"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:37:22 -0800
X-CSE-ConnectionGUID: AwcZ5lohTtO1n+kld1EhVQ==
X-CSE-MsgGUID: zgjlmwnQQ6m6A1D/enLNrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; d="scan'208,217";a="99824812"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.8])
 ([10.245.192.8])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 00:37:20 -0800
Content-Type: multipart/alternative;
 boundary="------------yEf6m75bzXpHnUthEieff0rj"
Message-ID: <a15c4839-d45b-4cf4-a92b-a76cb06959c0@linux.intel.com>
Date: Mon, 9 Dec 2024 09:37:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EBAT=3A_failure_for_drm/xe/tests?=
 =?UTF-8?Q?=3A_Wait_for_clear_fence_operation_to_complete?=
To: intel-xe@lists.freedesktop.org,
 Patchwork <patchwork@emeril.freedesktop.org>,
 Nirmoy Das <nirmoy.das@intel.com>
References: <20241205114702.1963303-1-nirmoy.das@intel.com>
 <173341069096.2994774.15445322185889938774@b555e5b46a47>
Content-Language: en-US
Cc: Matthew Auld <matthew.auld@intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <173341069096.2994774.15445322185889938774@b555e5b46a47>
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------yEf6m75bzXpHnUthEieff0rj
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 12/5/2024 3:58 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	drm/xe/tests: Wait for clear fence operation to complete
> *URL:* 	https://patchwork.freedesktop.org/series/142169/
> *State:* 	failure
> *Details:* 	https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/index.html
>
>
>   CI Bug Log - changes from xe-2323-6d42506688c08f85240449e80658ab760d899ae2_BAT -> xe-pw-142169v1_BAT
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-142169v1_BAT absolutely need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-142169v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
>
>
>     Participating hosts (8 -> 7)
>
> Additional (1): bat-lnl-1
> Missing (2): bat-pvc-2 bat-adlp-vm
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in xe-pw-142169v1_BAT:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@basic-flip-vs-dpms@a-edp1:
>       o bat-lnl-1: NOTRUN -> DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html> +1 other test dmesg-warn
>
Unrelated failures, Merged to drm-xe-next


>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-142169v1_BAT that come from known issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html> (Intel XE#1466 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466>)
>  *
>
>     igt@kms_dsc@dsc-basic:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html> (Intel XE#2244 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_force_connector_basic@force-connector-state:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html> (Intel XE#352 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/352>) +2 other tests skip
>  *
>
>     igt@kms_hdmi_inject@inject-audio:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html> (Intel XE#1470 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470> / Intel XE#2853 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853>)
>  *
>
>     igt@sriov_basic@enable-vfs-autoprobe-off:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html> (Intel XE#1091 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091> / Intel XE#2849 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849>) +1 other test skip
>  *
>
>     igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html> (Intel XE#688 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/688>) +17 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>) +2 other tests skip
>  *
>
>     igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
>
>       o bat-bmg-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html> (Intel XE#2229 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229>)
>  *
>
>     igt@xe_mmap@vram:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_mmap@vram.html> (Intel XE#1416 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416>)
>  *
>
>     igt@xe_pat@pat-index-xehpc:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html> (Intel XE#1420 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420> / Intel XE#2838 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838>)
>  *
>
>     igt@xe_pat@pat-index-xelp:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html> (Intel XE#977 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/977>)
>  *
>
>     igt@xe_pat@pat-index-xelpg:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html> (Intel XE#979 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/979>)
>  *
>
>     igt@xe_sriov_flr@flr-vf1-clear:
>
>       o bat-lnl-1: NOTRUN -> SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html> (Intel XE#3342 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:
>
>       o bat-bmg-1: DMESG-WARN <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html> (Intel XE#877 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/877>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html> +1 other test pass
>  *
>
>     igt@xe_live_ktest@xe_migrate:
>
>       o bat-bmg-1: SKIP <https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html> (Intel XE#1192 <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192>) -> PASS <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html> +2 other tests pass
>
>
>     Build changes
>
>   * Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2 -> xe-pw-142169v1
>
> IGT_8138: 8138
> xe-2323-6d42506688c08f85240449e80658ab760d899ae2: 6d42506688c08f85240449e80658ab760d899ae2
> xe-pw-142169v1: 142169v1
>
--------------yEf6m75bzXpHnUthEieff0rj
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/5/2024 3:58 PM, Patchwork wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:173341069096.2994774.15445322185889938774@b555e5b46a47">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Project List - Patchwork</title>
      <style id="css-table-select" type="text/css">td { padding: 2pt; }</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>drm/xe/tests: Wait for clear fence operation to complete</td>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a
                href="https://patchwork.freedesktop.org/series/142169/"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://patchwork.freedesktop.org/series/142169/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/index.html"
                moz-do-not-send="true" class="moz-txt-link-freetext">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/index.html</a></td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-2323-6d42506688c08f85240449e80658ab760d899ae2_BAT -&gt;
        xe-pw-142169v1_BAT</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-142169v1_BAT
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-142169v1_BAT, please notify your bug team
        (<a class="moz-txt-link-abbreviated" href="mailto:I915-ci-infra@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow them<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (8 -&gt; 7)</h2>
      <p>Additional (1): bat-lnl-1 <br>
        Missing (2): bat-pvc-2 bat-adlp-vm </p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-142169v1_BAT:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_flip@basic-flip-vs-dpms@a-edp1:
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_flip@basic-flip-vs-dpms@a-edp1.html"
                moz-do-not-send="true">DMESG-WARN</a> +1 other test
              dmesg-warn</li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>Unrelated failures, Merged to drm-xe-next</p>
    <p><br>
    </p>
    <blockquote type="cite"
      cite="mid:173341069096.2994774.15445322185889938774@b555e5b46a47">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-142169v1_BAT that come from
        known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466"
                moz-do-not-send="true">Intel XE#1466</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-basic:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_dsc@dsc-basic.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244"
                moz-do-not-send="true">Intel XE#2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_force_connector_basic@force-connector-state:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_force_connector_basic@force-connector-state.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352"
                moz-do-not-send="true">Intel XE#352</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdmi_inject@inject-audio:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@kms_hdmi_inject@inject-audio.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470"
                moz-do-not-send="true">Intel XE#1470</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853"
                moz-do-not-send="true">Intel XE#2853</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091"
                moz-do-not-send="true">Intel XE#1091</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849"
                moz-do-not-send="true">Intel XE#2849</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"
                moz-do-not-send="true">Intel XE#688</a>) +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
          <ul>
            <li>bat-bmg-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"
                moz-do-not-send="true">Intel XE#2229</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_mmap@vram:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_mmap@vram.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416"
                moz-do-not-send="true">Intel XE#1416</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xehpc:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420"
                moz-do-not-send="true">Intel XE#1420</a> / <a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838"
                moz-do-not-send="true">Intel XE#2838</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelp:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977"
                moz-do-not-send="true">Intel XE#977</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pat@pat-index-xelpg:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979"
                moz-do-not-send="true">Intel XE#979</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_sriov_flr@flr-vf1-clear:</p>
          <ul>
            <li>bat-lnl-1: NOTRUN -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-lnl-1/igt@xe_sriov_flr@flr-vf1-clear.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342"
                moz-do-not-send="true">Intel XE#3342</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3:</p>
          <ul>
            <li>bat-bmg-1: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">DMESG-WARN</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877"
                moz-do-not-send="true">Intel XE#877</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@kms_pipe_crc_basic@nonblocking-crc@pipe-c-hdmi-a-3.html"
                moz-do-not-send="true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_live_ktest@xe_migrate:</p>
          <ul>
            <li>bat-bmg-1: <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2323-6d42506688c08f85240449e80658ab760d899ae2/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">SKIP</a> (<a
href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192"
                moz-do-not-send="true">Intel XE#1192</a>) -&gt; <a
href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142169v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html"
                moz-do-not-send="true">PASS</a> +2 other tests pass</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-2323-6d42506688c08f85240449e80658ab760d899ae2
          -&gt; xe-pw-142169v1</li>
      </ul>
      <p>IGT_8138: 8138<br>
        xe-2323-6d42506688c08f85240449e80658ab760d899ae2:
        6d42506688c08f85240449e80658ab760d899ae2<br>
        xe-pw-142169v1: 142169v1</p>
    </blockquote>
  </body>
</html>

--------------yEf6m75bzXpHnUthEieff0rj--
