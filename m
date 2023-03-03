Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B944C678D4
	for <intel-xe@archiver.kernel.org>; Fri,  3 Mar 2023 09:09:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 613B110E5F1;
	Fri,  3 Mar 2023 09:09:53 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 112CF10E5F1
 for <intel-xe@lists.freedesktop.org>; Fri,  3 Mar 2023 09:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677834591; x=1709370591;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Y/RKBsiLQ6aleQUv2/rAXo0GV23BQlv+7OhsaV7PUAw=;
 b=Y/+XKRreX+EEDhAxb2rryetv66lV/WB5AQ45naq0fN688FXkVJwPY5OW
 w9d4KKNIh23eZKoeMP4CcEts0ZTIZKyMOzao1VKozYGaNDyfpbEa9zswo
 8nSwjPje5bwZ/Tdr0ChM6o0rdi+zmNZYtPH4PUTYyDje7bhAm8Y5ETgRk
 rjWHRQF0WepbBGfGJagqZ9I+gIhI2/CoNX9qmzesgGPsXDmo2GUxrV02R
 v4OHP/CvIUnUBn30Y8ZTPONqdS5OP8wqhmZL74rc8uKmna1ChnEXpv0lI
 gEKVxEPQzVUutMHxTUaso6M/RBG+LXflMpBmSyPwTab8QjWm9ezcGA5Ii Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="314657590"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="314657590"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="652738122"
X-IronPort-AV: E=Sophos;i="5.98,230,1673942400"; d="scan'208";a="652738122"
Received: from ktonsber-mobl1.ger.corp.intel.com (HELO [10.249.254.109])
 ([10.249.254.109])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Mar 2023 01:09:48 -0800
Message-ID: <81f6b123-6f21-e3f0-7efb-b57339a1cb7f@linux.intel.com>
Date: Fri, 3 Mar 2023 10:09:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
References: <20230223185740.3356127-1-matthew.d.roper@intel.com>
 <20230223185740.3356127-7-matthew.d.roper@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20230223185740.3356127-7-matthew.d.roper@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [Intel-xe] [PATCH v2 6/7] drm/xe/mocs: LNCF MOCS settings only
 need to be restored on pre-Xe_HP
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi!

After this commit I see the following on DG1, and attempting to run 
anything after that won't work.

Thomas


    10.306993] ------------[ cut here ]------------
[   10.307040] WARNING: CPU: 2 PID: 447 at 
drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x36/0x120 [xe]
[   10.307327] Modules linked in: xe(+) drm_ttm_helper ttm i2c_algo_bit 
drm_suballoc_helper kunit drm_buddy gpu_sched drm_display_helper 
drm_kms_helper drm crct10dif_pclmul crc32_pclmul crc32c_intel nvme 
e1000e nvme_core drm_panel_orientation_quirks ghash_clmulni_intel video 
wmi pinctrl_tigerlake usb_storage ip6_tables ip_tables fuse
[   10.307656] CPU: 2 PID: 447 Comm: systemd-udevd Tainted: G 
U             6.1.0+ #120
[   10.307719] Hardware name: ASUS System Product Name/PRIME B560M-A AC, 
BIOS 0403 01/26/2021
[   10.307779] RIP: 0010:xe_hw_fence_irq_finish+0x36/0x120 [xe]
[   10.307980] Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 
c4 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 48 89 
fd <0f> 0b e8 33 84 13 e2 48 89 ef 88 44 24 07 e8 c7 44 5e e2 48 8b 55
[   10.308103] RSP: 0018:ffffb917c12d7b90 EFLAGS: 00010216
[   10.308149] RAX: ffff8b189b6d85d8 RBX: 00000000ffffffc2 RCX: 
ffffb917c12d7aec
[   10.308201] RDX: 0000000000000000 RSI: ffffffffa356dc2b RDI: 
ffff8b189ee84c60
[   10.308253] RBP: ffff8b189ee84c60 R08: 0000000000000001 R09: 
ffff8b189ee82278
[   10.308304] R10: 0000000000000000 R11: 00000000d3ea3544 R12: 
ffff8b189ee84cc0
[   10.308356] R13: ffff8b189ee84cd8 R14: ffff8b189ee83e00 R15: 
ffffffffc08dda87
[   10.308407] FS:  00007f8a847cb0c0(0000) GS:ffff8b1af3280000(0000) 
knlGS:0000000000000000
[   10.308466] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.308511] CR2: 00007f69c6ba5298 CR3: 0000000114d8e003 CR4: 
0000000000770ee0
[   10.308564] PKRU: 55555554
[   10.308614] Call Trace:
[   10.308640]  <TASK>
[   10.308679]  xe_gt_init+0x336/0x380 [xe]
[   10.308886]  xe_device_probe+0x234/0x2a0 [xe]
[   10.309084]  xe_pci_probe+0x418/0x540 [xe]
[   10.309294]  local_pci_probe+0x3e/0x80
[   10.309342]  pci_device_probe+0xb3/0x210
[   10.309392]  really_probe+0xdb/0x380
[   10.309427]  ? pm_runtime_barrier+0x50/0x90
[   10.309473]  __driver_probe_device+0x78/0x170
[   10.309519]  driver_probe_device+0x1f/0x90
[   10.309564]  __driver_attach+0xd5/0x1d0
[   10.309632]  ? __device_attach_driver+0x110/0x110
[   10.309675]  bus_for_each_dev+0x62/0x90
[   10.309719]  bus_add_driver+0x1b1/0x200
[   10.309767]  driver_register+0x89/0xe0
[   10.309804]  ? xe_hw_fence_module_init+0x35/0x35 [xe]
[   10.310034]  do_one_initcall+0x5a/0x300
[   10.310080]  ? rcu_read_lock_sched_held+0x3f/0x80
[   10.310122]  ? trace_kmalloc+0x33/0xe0
[   10.310160]  ? kmalloc_trace+0x46/0x60
[   10.310203]  do_init_module+0x4a/0x200
[   10.310247]  __do_sys_finit_module+0x93/0xf0
[   10.310331]  do_syscall_64+0x37/0x90
[   10.310369]  entry_SYSCALL_64_after_hwframe+0x63/0xcd
[   10.310417] RIP: 0033:0x7f8a8522892d
[   10.310452] Code: 5d c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d d3 e4 0c 00 f7 d8 64 89 01 48
[   10.310576] RSP: 002b:00007ffdafa93138 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[   10.310671] RAX: ffffffffffffffda RBX: 0000562a45dc7f50 RCX: 
00007f8a8522892d
[   10.310725] RDX: 0000000000000000 RSI: 0000562a45dc6100 RDI: 
0000000000000016
[   10.310777] RBP: 0000562a45dc6100 R08: 0000000000000000 R09: 
00007ffdafa93260
[   10.310827] R10: 0000000000000016 R11: 0000000000000246 R12: 
0000000000020000
[   10.310878] R13: 0000562a45dbf440 R14: 0000000000000000 R15: 
0000562a45dbfbb0
[   10.310967]  </TASK>
[   10.310989] irq event stamp: 141793
[   10.311018] hardirqs last  enabled at (141801): [<ffffffffa217660e>] 
__up_console_sem+0x5e/0x70
[   10.311086] hardirqs last disabled at (141808): [<ffffffffa21765f3>] 
__up_console_sem+0x43/0x70
[   10.311149] softirqs last  enabled at (141740): [<ffffffffa20f026d>] 
__irq_exit_rcu+0xed/0x160
[   10.311215] softirqs last disabled at (141735): [<ffffffffa20f026d>] 
__irq_exit_rcu+0xed/0x160
[   10.311279] ---[ end trace 0000000000000000 ]---
[   10.312424] xe: probe of 0000:08:00.0 failed with error -62
[   10.321694] xe 0000:08:00.0: [drm] *ERROR* GuC PC Shutdown failed
[   10.321789] ------------[ cut here ]------------
[   10.321825] WARNING: CPU: 2 PID: 447 at 
drivers/gpu/drm/xe/xe_guc_pc.c:879 pc_fini+0xd0/0xf0 [xe]

On 2/23/23 19:57, Matt Roper wrote:
> Reprogramming the LNCF MOCS registers on render domain reset is not
> intended to be regular driver programming, but rather the implementation
> of a specific workaround (Wa_1607983814).  This workaround no longer
> applies on Xe_HP any beyond, so we can expect that these registers, like
> the rest of the LNCF/LBCF registers, will maintain their values through
> all engine resets.  We should only add these registers to the GuC's
> save/restore list on platforms that need the workaround.
>
> Furthermore, xe_mocs_init_engine() appears to be another attempt to
> satisfy this same workaround.  This is unnecessary on the Xe driver
> since even on platforms where the workaround is necessary, all
> single-engine resets are initiated by the GuC and thus the GuC will take
> care of saving/restoring these registers.  The only host-initiated
> resets we have in Xe are full GT resets which will already
> (re)initialize these registers as part of the regular xe_mocs_init()
> flow.
>
> v2:
>   - Add needs_wa_1607983814() so that calculate_regset_size() doesn't
>     overallocate regset space when the workaround isn't needed.  (Lucas)
>   - On platforms affected by Wa_1607983814, only add the LNCF MOCS
>     registers to the render engine's GuC save/restore list; resets of
>     other engines don't need to save/restore these.
>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_execlist.c   |  2 +-
>   drivers/gpu/drm/xe/xe_guc_ads.c    | 20 ++++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_submit.c |  1 -
>   drivers/gpu/drm/xe/xe_mocs.c       | 13 -------------
>   drivers/gpu/drm/xe/xe_mocs.h       |  1 -
>   5 files changed, 17 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index d555d77cbf49..fd0ebfe7cae3 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -462,7 +462,7 @@ static void execlist_engine_suspend_wait(struct xe_engine *e)
>   
>   static void execlist_engine_resume(struct xe_engine *e)
>   {
> -	xe_mocs_init_engine(e);
> +	/* NIY */
>   }
>   
>   static const struct xe_engine_ops execlist_engine_ops = {
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 0c08cecaca40..0a458c083db7 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -206,6 +206,11 @@ static void guc_ads_fini(struct drm_device *drm, void *arg)
>   	xe_bo_unpin_map_no_vm(ads->bo);
>   }
>   
> +static bool needs_wa_1607983814(struct xe_device *xe)
> +{
> +	return GRAPHICS_VERx100(xe) < 1250;
> +}
> +
>   static size_t calculate_regset_size(struct xe_gt *gt)
>   {
>   	struct xe_reg_sr_entry *sr_entry;
> @@ -218,7 +223,10 @@ static size_t calculate_regset_size(struct xe_gt *gt)
>   		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
>   			count++;
>   
> -	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
> +	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> +
> +	if (needs_wa_1607983814(gt_to_xe(gt)))
> +		count += LNCFCMOCS_REG_COUNT;
>   
>   	return count * sizeof(struct guc_mmio_reg);
>   }
> @@ -430,6 +438,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   					  struct iosys_map *regset_map,
>   					  struct xe_hw_engine *hwe)
>   {
> +	struct xe_device *xe = ads_to_xe(ads);
>   	struct xe_hw_engine *hwe_rcs_reset_domain =
>   		xe_gt_any_hw_engine_by_reset_domain(hwe->gt, XE_ENGINE_CLASS_RENDER);
>   	struct xe_reg_sr_entry *entry;
> @@ -464,9 +473,12 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>   					  e->reg, e->flags, count++);
>   	}
>   
> -	for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> -		guc_mmio_regset_write_one(ads, regset_map,
> -					  GEN9_LNCFCMOCS(i).reg, 0, count++);
> +	/* Wa_1607983814 */
> +	if (needs_wa_1607983814(xe) && hwe->class == XE_ENGINE_CLASS_RENDER) {
> +		for (i = 0; i < LNCFCMOCS_REG_COUNT; i++) {
> +			guc_mmio_regset_write_one(ads, regset_map,
> +						  GEN9_LNCFCMOCS(i).reg, 0, count++);
> +		}
>   	}
>   
>   	XE_BUG_ON(ads->regset_size < (count * sizeof(struct guc_mmio_reg)));
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index a54f7f82d04d..3766b77a0d90 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1267,7 +1267,6 @@ static void guc_engine_resume(struct xe_engine *e)
>   
>   	XE_BUG_ON(e->guc->suspend_pending);
>   
> -	xe_mocs_init_engine(e);
>   	guc_engine_add_msg(e, msg, RESUME);
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_mocs.c b/drivers/gpu/drm/xe/xe_mocs.c
> index 1ede2d46e778..c019352ba7a8 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/xe_mocs.c
> @@ -517,19 +517,6 @@ static void init_l3cc_table(struct xe_gt *gt,
>   	}
>   }
>   
> -void xe_mocs_init_engine(const struct xe_engine *engine)
> -{
> -	struct xe_mocs_info table;
> -	unsigned int flags;
> -
> -	flags = get_mocs_settings(engine->gt->xe, &table);
> -	if (!flags)
> -		return;
> -
> -	if (flags & HAS_RENDER_L3CC && engine->class == XE_ENGINE_CLASS_RENDER)
> -		init_l3cc_table(engine->gt, &table);
> -}
> -
>   void xe_mocs_init(struct xe_gt *gt)
>   {
>   	struct xe_mocs_info table;
> diff --git a/drivers/gpu/drm/xe/xe_mocs.h b/drivers/gpu/drm/xe/xe_mocs.h
> index aba1abe216ab..63500a1d6660 100644
> --- a/drivers/gpu/drm/xe/xe_mocs.h
> +++ b/drivers/gpu/drm/xe/xe_mocs.h
> @@ -11,7 +11,6 @@
>   struct xe_engine;
>   struct xe_gt;
>   
> -void xe_mocs_init_engine(const struct xe_engine *engine);
>   void xe_mocs_init(struct xe_gt *gt);
>   
>   /**
