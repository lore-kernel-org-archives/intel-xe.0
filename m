Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848FDD39406
	for <intel-xe@archiver.kernel.org>; Thu,  2 Apr 2026 10:08:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4559D10F1BE;
	Thu,  2 Apr 2026 10:08:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=lankhorst.se header.i=@lankhorst.se header.b="jvEtzUfF";
	dkim-atps=neutral
Received: from lankhorst.se (unknown [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04ECE10F1BE
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Apr 2026 10:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lankhorst.se;
 s=default; t=1775124517;
 bh=34Xn0bATg5w2CfUbDn3UesKgthHcYmXXmI8L8e8de40=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=jvEtzUfFJUX7h+4UgxTAzKKFMfJL+bBi5AgN7wxtWt84KSDq7SE3wtaspjBVPVIxl
 lfY3lS35F/RdhKCsCglUWScXfqTh/QYHS1PHlF8CaqxJRu7tUy9zYY7ryvQxp8EEw6
 1zmNGZiMaoNaE4Up8kdisOv1SU7QDxkhKeGHAZemESjzkeMdVMN0YHLnsudl2R3Mmg
 1/ksqMURsXllVaBpiklmnXG1ijBMunewVdhhKkEfWPVJHrXxQdr3UJogWtvxJ8wguZ
 bd6TTebZn4QaqXVBSEjjPIntVMCjajm12wLWAY1nEVZg5ntCXxJx3J9vM1Wu2OOjlt
 TxSqPj34YhHhA==
Message-ID: <d89e72f2-f2b9-423d-a128-696b9ff76000@lankhorst.se>
Date: Thu, 2 Apr 2026 12:08:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Drop redundant rtp entries for Wa_14019988906 &
 Wa_14019877138
To: "Lin, Shuicheng" <shuicheng.lin@intel.com>,
 "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>
References: <20260401-wa_merge_conflict-v1-1-b477ab53fedc@intel.com>
 <DM4PR11MB545600F30B6D92E5A04F8F1BEA50A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <DM4PR11MB545600F30B6D92E5A04F8F1BEA50A@DM4PR11MB5456.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hye,

Den 2026-04-02 kl. 00:39, skrev Lin, Shuicheng:
> On Wed, Apr 1, 2026 1:13 PM Matt Roper wrote:
>> There appears to have been a silent merge conflict between some commits
>> updating the workaround tables on Xe's -fixes and -next branches:
>>
>>  - Commit bc6387a2e0c1 ("drm/xe/xe2_hpg: Fix handling of
>> Wa_14019988906
>>    & Wa_14019877138") from the fixes branch moved the Xe2_HPG instance
>>    of two workarounds touching the PSS_CHICKEN register from the
>>    engine_was[] table to the lrc_was[] table; the equivalent
>>    implementation for all other platforms/IPs were already properly
>>    located on lrc_was[].  This commit on the fixes branch is a
>>    cherry-pick of commit e04c609eedf4 ("drm/xe/xe2_hpg: Fix handling of
>>    Wa_14019988906 & Wa_14019877138") that already existed on the next
>>    branch.
>>
>>  - Commit 55b19abb6c44 ("drm/xe: Consolidate workaround entries for
>>    Wa_14019877138") and commit c2142a1a8415 ("drm/xe: Consolidate
>>    workaround entries for Wa_14019988906") consolidated the individual
>>    entries per IP generation for each workaround into single, larger
>>    range-based entries.
>>
>> During merge conflict resolution the Xe2_HPG-specific entries (i.e., those with
>> rule "GRAPHICS_VERSION_RANGE(2001, 2002)") were accidentally
>> resurrected, even though the table already contains the consolidated entries
>> that match a superset of thse ranges.  These redundant entries don't cause
> 
> s/thse/these
> 
>> any build failures but do trigger a dmesg error during probe on BMG-G21
>> devices:
>>
>>   xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg
>> 7044 (clear: 00000400, set: 00000400, masked: yes, mcr: yes): ret=-22
>>   xe 0000:03:00.0: [drm] *ERROR* Tile0: GT0: discarding save-restore reg
>> 7044 (clear: 00000020, set: 00000020, masked: yes, mcr: yes): ret=-22
>>
>> Re-drop the Xe2_HPG-specific table entries to eliminate the error.
>>
>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/7433
>> Fixes: 17b95278ae6a ("Merge tag 'drm-xe-next-2026-03-02' of
>> https://gitlab.freedesktop.org/drm/xe/kernel into drm-next")
>> Cc: Dave Airlie <airlied@redhat.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> LGTM.
> Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>

Thanks,

Pushed to drm-xe-next to unblock CI.

Kind rgards,
~Maarten Lankhorst
