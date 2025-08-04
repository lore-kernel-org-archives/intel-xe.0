Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1501DC87FCF
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 15:34:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBC9910E5A8;
	Mon,  4 Aug 2025 15:34:34 +0000 (UTC)
Received: from lankhorst.se (lankhorst.se [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573E10E59C;
 Mon,  4 Aug 2025 15:34:33 +0000 (UTC)
Message-ID: <a275a34d-9f90-493f-94d9-9ea793b57147@lankhorst.se>
Date: Mon, 4 Aug 2025 17:34:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/display: Use drm_crtc_vblank_count in
 intel_crtc_get_vblank_counter()
To: Jani Nikula <jani.nikula@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250724122616.1111673-1-dev@lankhorst.se>
 <b4ee66fec61e424ae94024ba297b49e7586639d9@intel.com>
Content-Language: en-US
From: Maarten Lankhorst <dev@lankhorst.se>
In-Reply-To: <b4ee66fec61e424ae94024ba297b49e7586639d9@intel.com>
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

Hey,

Den 2025-08-04 kl. 16:46, skrev Jani Nikula:
> On Thu, 24 Jul 2025, Maarten Lankhorst <dev@lankhorst.se> wrote:
>> drm_crtc_accurate_vblank_count takes a spinlock, which we should avoid
>> in tracepoints and debug functions.
>>
>> This also prevents taking the spinlock 2x during the critical
>> section of pipe updates.
> 
> Don't we have vblank->max_vblank_count != 0 in most cases, and don't we
> want accuracy in the rest of the cases?
> 
> The commit message should explain why it's okay to make this change.

The whole point of tracepoints and debugging infra is that the functions should
observe, not alter. Even for the vblank_count == 0 we should not be taking the
locking that we do.

If you look at drm_update_vblank_count, that's way more than the simple
atomic64_read(&vblank->count) from drm_vblank_count.

It takes the vblank_time_lock, loops potentially DRM_TIMESTAMP_MAXRETRIES
times, prints a few of drm_dbg() messages (which also has issues), and then
returns after updating. Being approximately correct is a win here.

Best regards,
~Maarten
