Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3C7EB64DD
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jun 2023 11:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C6110E44E;
	Fri, 30 Jun 2023 11:07:56 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16EBE10E44E
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jun 2023 11:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688123275; x=1719659275;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=K2qw81YorzQ5Qhl0tNdnupjiJrMxfR4wMUcHZwGBMYs=;
 b=Ybein1WdPaRjLZU5/2Lz39o8oPRClj5978aGIOyrC/OaydA3F+lyit6Z
 yod//gZieiQFYzNR6OjGbo4lwvCQK2pmrIRtmgUC/+g3tDp1BhgAGtk/o
 TmbmFJQnRgca2XcB/s1vJgUoxiBb2dWF5UFvsYsWlsKB0kaaJ9gNzxS3j
 FZlax+M5R26j+SUlLhbFqBkXg5K/hBPlaqr4BWEDDscMnkprjOtCfWsYB
 WAQ45s4ZN/SI1EWTAXh1GNCxo+kZ/GgFXV1WjtffEKuGcWZMmPdPqZidh
 ntS976y+CLqsgAAaGaxULCqIE1jM91ETcc88VsNH8DwOJZu5vEdw5A806 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="342709030"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="342709030"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:07:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="841837097"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="841837097"
Received: from jahoneyx-mobl2.amr.corp.intel.com (HELO [10.252.10.24])
 ([10.252.10.24])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 04:07:46 -0700
Message-ID: <c722bfa2-ffbb-394a-36e7-896d0447d5af@intel.com>
Date: Fri, 30 Jun 2023 12:07:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
References: <20230626105037.43780-15-matthew.auld@intel.com>
 <87edlt5v2d.wl-ashutosh.dixit@intel.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <87edlt5v2d.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Intel-xe] [PATCH v12 00/13] xe_device_mem_access fixes and
 related bits
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 30/06/2023 07:21, Dixit, Ashutosh wrote:
> On Mon, 26 Jun 2023 03:50:38 -0700, Matthew Auld wrote:
>>
>> Main goal is to fix the races in xe_device_mem_access_get(). With that fixed we
>> can clean up some hacks and also start rolling it out to more places that need
>> it, including now asserting it around every mmio access. We also add lockdep
>> annotations for xe_device_mem_access_get() and fix the remaining lockdep
>> fallout.
>>
>> v11 -> v12:
>>    - freq_rpe_show also needs the device to be awake
>>    - Improvements to the lockdep annotation patch
> 
> Just FYI, fwiw this is from my local branch, but even with this series I am
> seeing this on DG2. Probe is fine but as soon as my IGT (perf) runs the
> trace below spews out. The unit test runs fine on RPLP. If there's a
> temporary workaround for this I'd like to know. Thanks.
> 
> -Ashutosh
> 
> [  486.110571] xe: loading out-of-tree module taints kernel.
> [  486.131776] xe 0000:03:00.0: vgaarb: deactivate vga console
> [  486.133136] GT topology dss mask (geometry): 00000000,0000ff00
> [  486.133139] GT topology dss mask (compute):  00000000,0000ff00
> [  486.133141] GT topology EU mask per DSS:     0000ffff
> [  486.133636] xe 0000:03:00.0: [drm] VISIBLE VRAM: 0x0000004000000000, 0x0000000200000000
> [  486.133686] xe 0000:03:00.0: [drm] VRAM[0, 0]: 0x0000004000000000, 0x000000017c800000
> [  486.133688] xe 0000:03:00.0: [drm] Total VRAM: 0x0000004000000000, 0x0000000180000000
> [  486.133690] xe 0000:03:00.0: [drm] Available VRAM: 0x0000004000000000, 0x000000017c800000
> [  486.195204] xe 0000:03:00.0: [drm] Using GuC firmware (70.5) from i915/dg2_guc_70.bin
> [  486.198192] xe 0000:03:00.0: [drm] HuC disabled
> [  486.241959] xe 0000:03:00.0: [drm] ccs0 fused off
> [  486.241964] xe 0000:03:00.0: [drm] ccs2 fused off
> [  486.241965] xe 0000:03:00.0: [drm] ccs3 fused off
> [  486.242509] xe REG[0x223a8-0x223af]: allow read access
> [  486.242606] xe REG[0x1c03a8-0x1c03af]: allow read access
> [  486.242708] xe REG[0x1d03a8-0x1d03af]: allow read access
> [  486.242826] xe REG[0x1c83a8-0x1c83af]: allow read access
> [  486.242945] xe REG[0x1d83a8-0x1d83af]: allow read access
> [  486.243033] xe REG[0x1c3a8-0x1c3af]: allow read access
> [  486.306291] [drm] Initialized xe 1.1.0 20201103 for 0000:03:00.0 on minor 0
> [  486.309344] insmod (3290) used greatest stack depth: 10936 bytes left
> [  487.559809] xe 0000:03:00.0: [drm] GT0: suspended

Device hits runtime suspend after probing the device. Looks normal so far...

> [  500.096224] [IGT] perf: executing
> [  502.830435] pcieport 0000:01:00.0: not ready 1023ms after resume; giving up
> [  502.832901] pcieport 0000:01:00.0: Unable to change power state from D3cold to D0, device inaccessible
> [  502.835939] pcieport 0000:02:01.0: Unable to change power state from D3cold to D0, device inaccessible
> [  502.836769] pcieport 0000:02:04.0: Unable to change power state from D3cold to D0, device inaccessible
> [  505.070434] xe 0000:03:00.0: not ready 1023ms after resume; giving up
> [  505.071074] xe 0000:03:00.0: Unable to change power state from D3cold to D0, device inaccessible

And here we are tying to resume the device. This is still deep in PCI 
stuff, and it's already looking bad since the device is unable to exit 
from D3cold. Also we shouldn't even be in D3cold here (it implies PCI 
device is powered off), but only D3hot. For reference on my DG2 it only 
goes from D0 -> D3hot on runtime suspend and D3hot -> D0 on runtime 
resume. D3cold is explicitly disabled for now with rpm as per 
xe->d3cold_allowed. But even so, it's unclear why it can't restore power 
and get back to D0 (device is maybe unresponsive/dead?). Although even 
if it did get as far as the driver part of the resume it would still be 
all kinds of broken since VRAM has been nuked.

I would assume there is something broken/faulty with that system. You 
could maybe try disabling rpm, and avoiding forced suspend/resume on 
that system:

--- a/drivers/gpu/drm/xe/xe_pm.c
+++ b/drivers/gpu/drm/xe/xe_pm.c
@@ -124,7 +124,6 @@ void xe_pm_runtime_init(struct xe_device *xe)
         pm_runtime_use_autosuspend(dev);
         pm_runtime_set_autosuspend_delay(dev, 1000);
         pm_runtime_set_active(dev);
-       pm_runtime_allow(dev);
         pm_runtime_mark_last_busy(dev);
         pm_runtime_put_autosuspend(dev);
  }

> [  505.087125] snd_hda_intel 0000:04:00.0: not ready 1023ms after resume; giving up
> [  505.087154] snd_hda_intel 0000:04:00.0: Unable to change power state from D3cold to D0, device inaccessible
> [  505.183156] xe 0000:03:00.0: Unable to change power state from D3cold to D0, device inaccessible
> [  505.242684] xe 0000:03:00.0: [drm] Force wake domain (0) failed to ack sleep, ret=-110
> [  505.296974] snd_hda_intel 0000:04:00.0: CORB reset timeout#2, CORBRP = 65535
> [  505.302246] xe 0000:03:00.0: [drm] Force wake domain (1) failed to ack sleep, ret=-110
> [  505.362158] xe 0000:03:00.0: [drm] Force wake domain (3) failed to ack sleep, ret=-110
> [  505.423158] xe 0000:03:00.0: [drm] Force wake domain (5) failed to ack sleep, ret=-110
> [  505.484157] xe 0000:03:00.0: [drm] Force wake domain (11) failed to ack sleep, ret=-110
> [  505.543101] xe 0000:03:00.0: [drm] Force wake domain (12) failed to ack sleep, ret=-110
> [  505.543139] ------------[ cut here ]------------
> [  505.543141] WARNING: CPU: 1 PID: 3328 at drivers/gpu/drm/xe/xe_oa.c:1913 xe_oa_timestamp_frequency+0xca/0xd0 [xe]
> [  505.543173] Modules linked in: xe(O) gpu_sched drm_buddy drm_suballoc_helper drm_ttm_helper ttm nfnetlink br_netfilter overlay mei_pxp x86_pkg_temp_thermal mei_hdcp coretemp kvm_intel snd_hda_codec_h
> dmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep snd_hda_core wmi_bmof mei_gsc mei_me snd_pcm mei fuse ip_tables x_tables crct10dif_pc
> lmul crc32_pclmul ghash_clmulni_intel e1000e i2c_i801 i2c_smbus ptp pps_core wmi [last unloaded: prime_numbers]
> [  505.543220] CPU: 1 PID: 3328 Comm: perf Tainted: G           O       6.3.0+ #2
> [  505.543222] Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.R00.X220.B00.2103302221 03/30/2021
> [  505.543224] RIP: 0010:xe_oa_timestamp_frequency+0xca/0xd0 [xe]
> [  505.543252] Code: 5c 8b 40 10 f7 d1 41 5d 83 e1 03 d3 e0 c3 cc cc cc cc 41 8b 84 24 4c 02 00 00 05 00 0d 00 00 25 ff ff 3f 00 eb ab 0f 0b eb 80 <0f> 0b eb bb 66 90 90 90 90 90 90 90 90 90 90 90 90 90
>   90 90 90 90
> [  505.543255] RSP: 0018:ffffc90005617d58 EFLAGS: 00010282
> [  505.543257] RAX: 00000000ffffff92 RBX: ffff88810f798000 RCX: ffffc90005617c4c
> [  505.543259] RDX: 0000000000000000 RSI: ffffffff8268031a RDI: ffffffff826a5b09
> [  505.543261] RBP: ffff88813fd88050 R08: 0000000000000000 R09: 00000000fffeffff
> [  505.543262] R10: 0000000000000000 R11: ffff88846de6fac0 R12: 00000000ffffffff
> [  505.543264] R13: ffff88810f79a268 R14: 0000000000000000 R15: ffff88810f798000
> [  505.543265] FS:  00007fe0dc224c00(0000) GS:ffff88845da80000(0000) knlGS:0000000000000000
> [  505.543267] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  505.543269] CR2: 000055c202d18fb0 CR3: 00000001302d8006 CR4: 00000000003706e0
> [  505.543271] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> [  505.543272] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> [  505.543274] Call Trace:
> [  505.543276]  <TASK>
> [  505.543279]  query_gts+0xd9/0x1f0 [xe]
> [  505.543309]  ? __pfx_xe_query_ioctl+0x10/0x10 [xe]
> [  505.543337]  drm_ioctl_kernel+0xb4/0x150
> [  505.543343]  drm_ioctl+0x214/0x440
> [  505.543347]  ? __pfx_xe_query_ioctl+0x10/0x10 [xe]
> [  505.543376]  ? __rseq_handle_notify_resume+0x48e/0x5c0
> [  505.543382]  ? xfd_validate_state+0x1d/0x80
> [  505.543387]  __x64_sys_ioctl+0x89/0xb0
> [  505.543391]  do_syscall_64+0x3c/0x90
> [  505.543396]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
> [  505.543399] RIP: 0033:0x7fe0de11aaff
