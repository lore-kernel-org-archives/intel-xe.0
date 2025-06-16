Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE55C71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 06:04:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE42110E2A5;
	Mon, 16 Jun 2025 06:04:05 +0000 (UTC)
X-Greylist: delayed 607 seconds by postgrey-1.36 at gabe;
 Mon, 16 Jun 2025 06:04:03 UTC
Received: from psionic.psi5.com (psionic.psi5.com [185.187.169.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FCA10E13D;
 Mon, 16 Jun 2025 06:04:03 +0000 (UTC)
Received: from [192.168.43.209] (om126157192128.27.openmobile.ne.jp
 [126.157.192.128])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by psionic.psi5.com (Postfix) with ESMTPSA id 8A21C3F02F;
 Mon, 16 Jun 2025 07:53:40 +0200 (CEST)
Message-ID: <4cfbde5a-5bbe-462c-a52c-fe1c65aa3815@hogyros.de>
Date: Mon, 16 Jun 2025 14:53:35 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] drm/xe: enable driver usage on non-4KiB kernels
To: jeffbai@aosc.io, Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Francois Dugast
 <francois.dugast@intel.com>,
 =?UTF-8?Q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>,
 =?UTF-8?Q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>,
 Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>, Alan Previn
 <alan.previn.teres.alexis@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Mateusz Naklicki <mateusz.naklicki@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Kexy Biscuit <kexybiscuit@aosc.io>, Shang Yatsen <429839446@qq.com>,
 Wenbin Fang <fangwenbin@vip.qq.com>, Haien Liang <27873200@qq.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Shirong Liu <lsr1024@qq.com>,
 Haofeng Wu <s2600cw2@126.com>
References: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250613-upstream-xe-non-4k-v2-v2-0-934f82249f8a@aosc.io>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

Hi,

On 6/13/25 10:11, Mingcong Bai via B4 Relay wrote:

> This patch series attempts to enable the use of xe DRM driver on non-4KiB
> kernel page platforms. This involves fixing the ttm/bo interface, as well
> as parts of the userspace API to make use of kernel `PAGE_SIZE' for
> alignment instead of the assumed `SZ_4K', it also fixes incorrect usage of
> `PAGE_SIZE' in the GuC and ring buffer interface code to make sure all
> instructions/commands were aligned to 4KiB barriers (per the Programmer's
> Manual for the GPUs covered by this DRM driver).

Tested on POWER9 (TalosII) with B580, comparing commit b8f759deb9 with 
4k pages with the same plus these patches with 64k pages. I did not test 
4k pages with these patches, I suspect that is already well covered by CI.

The Piglit test suite reports the exact same number of pass/fail/crash 
for both configurations.

https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1310#note_2959331

Are there other tests that make sense? Piglit does not include video 
playback, for example. Since I have a dGPU, I can't run SR-IOV tests, 
though.

    Simon
