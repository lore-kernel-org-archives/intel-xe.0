Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8465DCD1297
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 13:40:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DFB010E3BB;
	Mon, 10 Nov 2025 13:40:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sotapeli.fi header.i=@sotapeli.fi header.b="fzofux7y";
	dkim-atps=neutral
X-Greylist: delayed 443 seconds by postgrey-1.36 at gabe;
 Sat, 08 Nov 2025 22:26:42 UTC
Received: from se.sotapeli.fi (se.sotapeli.fi [206.168.212.219])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A38A210E00D
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 22:26:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 55DF7181AA1D
 for <intel-xe@lists.freedesktop.org>; Sat,  8 Nov 2025 23:19:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sotapeli.fi; s=dkim;
 t=1762640356; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:autocrypt;
 bh=K/sVOhF462NZ5I3SNRvHtWL3tMU25udI2BnaX63OXjE=;
 b=fzofux7ysmJttQAFCC4ktWpC6Efb2vSFoHFDhX8yQGS8CtFp777QoRMMwzQZlndU2TVwM1
 xc/meOtOq8BUIcOi6rrKhjiaHY063R6q7xjcqhDijwD90EdHjg9W4ZvixX3ctmiTyaf/KB
 g943sZp53eULyWOSLUwDohcSzCM28BPQFuai5EhrnrEl9euT7DCPW/75ai4YFIh6oVpT3l
 roPGJOuiIzsvjV2Gd1zuPfYDWY1pyS6pSYkwAkLTLrnjUy2ctv2LLanLyRWMZjpWTiV50c
 DZRJSgWfuhTqvsI2ghAeWTxQGeWSj5HnBuWzpP7Pw4R13szYyc+1LhFp8sTyLw==
Message-ID: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
Date: Sun, 9 Nov 2025 00:19:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: intel-xe@lists.freedesktop.org
Content-Language: en-US
From: Jani Partanen <jiipee@sotapeli.fi>
Subject: Possible bug?
Autocrypt: addr=jiipee@sotapeli.fi; keydata=
 xsFNBGT+fKABEADD4vjnZhAQu2eexHX8BoH4X6bWSNRZT0TbOkzuRBlln8T5BixMcItkF+x4
 wBNQrotQGVetb5CIC9MpnDve5NaevpzBPjkTYLK7MLnAt9ar808YCvmPiwY3Wl1zKKIF4cA1
 iSpvx/ywVbrzLHAR2r0VhNpK+62QjVwB9nZtJDmOmmMHx/jB4TepL0GYTiXL0Fb43ZSp1KIS
 dj3d8e7hBoPzo/Y8vyEP99H02srd0HJGna0b1zwwofWri5y6Xlf5urR4np7Eg5x+MTcO9Lvk
 xQGEhHngLsp3EtzYF8sg/uTeyl+fDOlF2X4IA0uNgXGcCTEJK6WwEEuaUHFnenVAr6kO0Ekz
 sGEMmwNUPRW9b6LMhuvvVdcSIMHslPXgH8IrTuI/mvs2LirqLP8q1nbj3ElSHRnCb1IlrWmk
 6zAvAQkL5VcF9zZ188YS9fyR9k3wZw74Og3aMdgfdNvWFbphxD8crROUkR1geLFrtTqfi/I+
 fLUp7CSmU4tJcuvMUB8CKQKCvi1nX29fKoj5blX3+rQ76kPR4mM8VFoTMg9ea0u+PDverbG3
 /a2IQmnuoWLbeQju3+n8wuQOnDcPqDd6pWp3VHnO6kWuS0R9DYGilo/s1EZJY30uukRdS8WX
 gvr+glNWuXySOMrNRv1J3aSupfF8foSKagSEv3u5FkJytBNQPQARAQABzSJKYW5pIFBhcnRh
 bmVuIDxqaWlwZWVAc290YXBlbGkuZmk+wsGNBBMBCAA3FiEEZBllEaGa181p3ndbYtKyRR32
 Z1MFAmT+fKEFCQWjmoACGwMECwkIBwUVCAkKCwUWAgMBAAAKCRBi0rJFHfZnU24jEACwwdJ1
 FglMM5wZRK3KVSGaHhhdUWO57h9dWy0LXJ23jF0ZUBOkGF/GhkpCB4q2/uI/7TIxJrYTaykz
 6NI4wln4970/BW6vGEbPUmAKVrn6UdtR1JEGHN1qq8QIX4epCA4OaBqPdTIH3ALDen4xQKRh
 RDTO4JvImhKXyLUJLD4936B0UOMq+VK/rZ/D8Bw42MvYrY93nFWhc6H2ucOfIJfji1bJBje+
 F8Jls0Y9DjmkJ+d0oO//Y6Pc9/OdexeUDyvSPnuYZOgFEhHRlRAGc89MKiufDaoNkCudXpOD
 FZnfRfD3KZYdu/Ahzda6X79Q2VCgbNqa+oI3IDcCYDZjOdfkY1ooVnS/Rb+zkECP46Pe7BKA
 XMN1cwnpyCq7oX3dQLdy/vp+kx0Weto2B+8KWQv/Dak12J4knlj9/z6kvMgBlO3lsNCpjK37
 FV71qkSWrSjmw0PDHPd3C1k2TbkM3CP3vuWEdBEwRV087voaTvh4kqXpGxZF+TznzU8m9Jfc
 uFD3LrVn2xw5mqmXwOj483KL8VZOcpIUcVCyLs/9Ki1Wmd/KVOnQyk0yH2ekMuhvbsqWXp59
 Y0lGjjEw6k975v1/prTvLKYPDHaDk5JbAD7ZrmGu9ExJy7QOtrioFRqK36NmHSu83ZvWf3LN
 MJBC+NU6EP+DU3T35qy+0FyeHqoUzs7BTQRk/nyhARAA9rmpAGPiLM6YwSZ4Tt3WA35TtrDo
 QlUqkxbs1EoBOA+KC/uyj3P1XgZ+9JwLDcI6Qfk7mQJvCAdAM6nxQvVCCVkSm11FwPOl88zJ
 HpfwCZ8L86q3eRpNdFMyRBBe2fWIAwoxRF9W6F7Ajnft1831z07HVzEWVnfv+/DFfV9w5cJW
 Lq1API3JM6S0l3st6fo5RgqbV3uRvbo8FygDjQ3Fw7dGRn1Z3RoaeDVb4B3vcc7bPdFugOBd
 XA0GRqJprynCn3yclUf0/QXG2IyYO96LFBMaiY4yU0lBsVFqjNeq97l59c/Vrzv7AlpYw4vH
 +RYumgk2Nmg4rGxl95ei90WpjGuSfW504PDCe0W5I37EpmakBB45EbhgtoGk4qI5pEdNVC9U
 XPKAggwLj4iWRNVcxqMe381DaMhREI4V8q48zulEVT/KWI0v6WKCcZx3mkgtFUYciGlMU2gj
 99dpBQcu5I8pfDJoke6+Q/c6QJyD2gDu/DW6haT8iBDx1eTRmisCcnwnVlAsuDM2XKxTssNk
 ur/y++2YQSB0BzhJccUuW/jQOmZHYQ4CAS7sFi5FjHhKYTeatlotkwOlj+hsXg23U47vZqVQ
 jgyl82kge+iFk2jid9cwWX5qVqrl7f4iCQ5zNHQlTJ6kL74ZbhNOvmP5BGESBPxVsWgGVbr9
 G2YRigsAEQEAAcLBfAQYAQgAJhYhBGQZZRGhmtfNad53W2LSskUd9mdTBQJk/nyiBQkFo5qA
 AhsMAAoJEGLSskUd9mdT0ZwQAL1Uvdk9Q1f83mG+W1C3EQTQ6Sj3aDbzXCPsqhJWLP81Amkk
 G2Yr3cGORZGWl+5eLkeqIPAnJm005Q6L4+0sWsOHg2l/hC809+tzXM9QQzSxlUMhUCq/33UD
 xLbK6/iSERgOCBbE+bxeHiuUKgRECYEhlru7OvKetgaY2ejvIqJ45nlGQ51fU6FO7q6zrVED
 gJ6dANxl+0Dqgg84ELn0cjO7fLwnFM2OyEal0e5ESCLEE3Ruqy/whsft7f0hjcb6C1SHqYZS
 MCUPHQ0tZxLg74XfkwxxHkn2+JKM7y25GFcpqnZbxQXlx6eJqm/T4R4RBpt9Qj8WPlQsxPix
 kmQSP1fagxZxxu/J91cnmSiCnSbRCqnZ/6UuU1pMLkuYW8RBdnzo+BpGwtnTcSDIUfR37ydQ
 //cjOeSE4XNvyOXFn0ePOZTxuXUYbPya5nnv/6uRgeURtt7St/ljx/5ieqzSYnXuMDdeyHpu
 A5SEgX7tlnGaWHcH1go9Z/ElSwnyQsRKUMEitxo/q7R8InF8Rf3xLarK27WUGxX4i2uU0ilK
 TavzdWRG0zG2TEKvmX5Ks118pVC/F/WWBQ8Z1ygW4Qek/zgTKfr3d3nR52s91PV8qUyatmZ8
 Li0pNGD1d+9nlNIj2m1iIpBSQ5Bj+XBW+MQRMWKUlpAK4quC32wV95k2ZOrX
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Approved-At: Mon, 10 Nov 2025 13:40:14 +0000
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

Hello, I just got Intel Arc B570. It seems to work fine but every boot I 
get this in dmesg:

[  342.865944] ------------[ cut here ]------------
[  342.865950] UBSAN: array-index-out-of-bounds in 
drivers/mtd/devices/mtd_intel_dg.c:750:15
[  342.865954] index 0 is out of range for type '<unknown> [*]'
[  342.865957] CPU: 6 UID: 0 PID: 6184 Comm: (udev-worker) Not tainted 
6.17.7-300.fc43.x86_64 #1 PREEMPT(lazy)
[  342.865961] Hardware name: ASUS System Product Name/ROG CROSSHAIR 
VIII HERO (WI-FI), BIOS 5302 10/03/2025
[  342.865963] Call Trace:
[  342.865967]  <TASK>
[  342.865972]  dump_stack_lvl+0x5d/0x80
[  342.865979]  ubsan_epilogue+0x5/0x2b
[  342.865984]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[  342.865991]  intel_dg_mtd_probe+0x21b/0x240 [mtd_intel_dg]
[  342.865998]  ? __pfx_intel_dg_mtd_probe+0x10/0x10 [mtd_intel_dg]
[  342.866002]  auxiliary_bus_probe+0x49/0x80
[  342.866006]  ? srso_return_thunk+0x5/0x5f
[  342.866012]  really_probe+0xde/0x340
[  342.866015]  ? pm_runtime_barrier+0x55/0x90
[  342.866019]  __driver_probe_device+0x78/0x140
[  342.866022]  driver_probe_device+0x1f/0xa0
[  342.866025]  ? __pfx___driver_attach+0x10/0x10
[  342.866027]  __driver_attach+0xcb/0x1e0
[  342.866030]  bus_for_each_dev+0x85/0xd0
[  342.866036]  bus_add_driver+0x12f/0x210
[  342.866040]  ? __pfx_intel_dg_mtd_driver_init+0x10/0x10 [mtd_intel_dg]
[  342.866044]  driver_register+0x75/0xe0
[  342.866047]  __auxiliary_driver_register+0x6e/0xd0
[  342.866050]  do_one_initcall+0x5b/0x300
[  342.866058]  do_init_module+0x84/0x280
[  342.866063]  init_module_from_file+0x8a/0xe0
[  342.866071]  idempotent_init_module+0x114/0x310
[  342.866078]  __x64_sys_finit_module+0x6d/0xd0
[  342.866081]  ? syscall_trace_enter+0x108/0x1d0
[  342.866086]  do_syscall_64+0x7e/0x250
[  342.866090]  ? srso_return_thunk+0x5/0x5f
[  342.866092]  ? switch_fpu_return+0x4e/0xd0
[  342.866097]  ? srso_return_thunk+0x5/0x5f
[  342.866099]  ? arch_exit_to_user_mode_prepare.isra.0+0x6a/0x80
[  342.866102]  ? srso_return_thunk+0x5/0x5f
[  342.866105]  ? do_syscall_64+0xb6/0x250
[  342.866108]  ? srso_return_thunk+0x5/0x5f
[  342.866111]  ? terminate_walk+0xef/0x100
[  342.866115]  ? srso_return_thunk+0x5/0x5f
[  342.866118]  ? path_openat+0x116/0x2a0
[  342.866122]  ? srso_return_thunk+0x5/0x5f
[  342.866125]  ? do_filp_open+0xd8/0x180
[  342.866131]  ? __pfx_page_put_link+0x10/0x10
[  342.866137]  ? srso_return_thunk+0x5/0x5f
[  342.866141]  ? srso_return_thunk+0x5/0x5f
[  342.866144]  ? do_sys_openat2+0xa2/0xe0
[  342.866149]  ? srso_return_thunk+0x5/0x5f
[  342.866152]  ? syscall_exit_work+0x143/0x1b0
[  342.866155]  ? srso_return_thunk+0x5/0x5f
[  342.866157]  ? do_syscall_64+0xb6/0x250
[  342.866161]  ? srso_return_thunk+0x5/0x5f
[  342.866163]  ? srso_return_thunk+0x5/0x5f
[  342.866166]  ? irqentry_exit_to_user_mode+0x2c/0x1c0
[  342.866169]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  342.866172] RIP: 0033:0x7fc5052ff34d
[  342.866187] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 6a 0f 00 f7 d8 64 89 01 48
[  342.866189] RSP: 002b:00007ffc546026d8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[  342.866193] RAX: ffffffffffffffda RBX: 0000557240396680 RCX: 
00007fc5052ff34d
[  342.866194] RDX: 0000000000000004 RSI: 00007fc5059d85e1 RDI: 
0000000000000021
[  342.866196] RBP: 00007ffc54602770 R08: 0000000000000000 R09: 
00005572401f3fd0
[  342.866197] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007fc5059d85e1
[  342.866199] R13: 0000000000020000 R14: 0000557240210540 R15: 
0000000000000000
[  342.866205]  </TASK>
[  342.866207] ---[ end trace ]---
[  342.866225] ------------[ cut here ]------------
[  342.866226] UBSAN: array-index-out-of-bounds in 
drivers/mtd/devices/mtd_intel_dg.c:751:15
[  342.866229] index 0 is out of range for type '<unknown> [*]'
[  342.866232] CPU: 6 UID: 0 PID: 6184 Comm: (udev-worker) Not tainted 
6.17.7-300.fc43.x86_64 #1 PREEMPT(lazy)
[  342.866234] Hardware name: ASUS System Product Name/ROG CROSSHAIR 
VIII HERO (WI-FI), BIOS 5302 10/03/2025
[  342.866236] Call Trace:
[  342.866237]  <TASK>
[  342.866239]  dump_stack_lvl+0x5d/0x80
[  342.866242]  ubsan_epilogue+0x5/0x2b
[  342.866245]  __ubsan_handle_out_of_bounds.cold+0x54/0x59
[  342.866249]  intel_dg_mtd_probe+0x1fa/0x240 [mtd_intel_dg]
[  342.866254]  ? __pfx_intel_dg_mtd_probe+0x10/0x10 [mtd_intel_dg]
[  342.866258]  auxiliary_bus_probe+0x49/0x80
[  342.866261]  ? srso_return_thunk+0x5/0x5f
[  342.866264]  really_probe+0xde/0x340
[  342.866266]  ? pm_runtime_barrier+0x55/0x90
[  342.866269]  __driver_probe_device+0x78/0x140
[  342.866272]  driver_probe_device+0x1f/0xa0
[  342.866275]  ? __pfx___driver_attach+0x10/0x10
[  342.866277]  __driver_attach+0xcb/0x1e0
[  342.866280]  bus_for_each_dev+0x85/0xd0
[  342.866284]  bus_add_driver+0x12f/0x210
[  342.866289]  ? __pfx_intel_dg_mtd_driver_init+0x10/0x10 [mtd_intel_dg]
[  342.866292]  driver_register+0x75/0xe0
[  342.866295]  __auxiliary_driver_register+0x6e/0xd0
[  342.866298]  do_one_initcall+0x5b/0x300
[  342.866304]  do_init_module+0x84/0x280
[  342.866307]  init_module_from_file+0x8a/0xe0
[  342.866316]  idempotent_init_module+0x114/0x310
[  342.866322]  __x64_sys_finit_module+0x6d/0xd0
[  342.866325]  ? syscall_trace_enter+0x108/0x1d0
[  342.866329]  do_syscall_64+0x7e/0x250
[  342.866331]  ? srso_return_thunk+0x5/0x5f
[  342.866334]  ? switch_fpu_return+0x4e/0xd0
[  342.866337]  ? srso_return_thunk+0x5/0x5f
[  342.866340]  ? arch_exit_to_user_mode_prepare.isra.0+0x6a/0x80
[  342.866342]  ? srso_return_thunk+0x5/0x5f
[  342.866345]  ? do_syscall_64+0xb6/0x250
[  342.866348]  ? srso_return_thunk+0x5/0x5f
[  342.866350]  ? terminate_walk+0xef/0x100
[  342.866353]  ? srso_return_thunk+0x5/0x5f
[  342.866356]  ? path_openat+0x116/0x2a0
[  342.866360]  ? srso_return_thunk+0x5/0x5f
[  342.866363]  ? do_filp_open+0xd8/0x180
[  342.866369]  ? __pfx_page_put_link+0x10/0x10
[  342.866374]  ? srso_return_thunk+0x5/0x5f
[  342.866378]  ? srso_return_thunk+0x5/0x5f
[  342.866381]  ? do_sys_openat2+0xa2/0xe0
[  342.866385]  ? srso_return_thunk+0x5/0x5f
[  342.866388]  ? syscall_exit_work+0x143/0x1b0
[  342.866391]  ? srso_return_thunk+0x5/0x5f
[  342.866394]  ? do_syscall_64+0xb6/0x250
[  342.866397]  ? srso_return_thunk+0x5/0x5f
[  342.866399]  ? srso_return_thunk+0x5/0x5f
[  342.866402]  ? irqentry_exit_to_user_mode+0x2c/0x1c0
[  342.866405]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[  342.866407] RIP: 0033:0x7fc5052ff34d
[  342.866411] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 
05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 6a 0f 00 f7 d8 64 89 01 48
[  342.866413] RSP: 002b:00007ffc546026d8 EFLAGS: 00000246 ORIG_RAX: 
0000000000000139
[  342.866415] RAX: ffffffffffffffda RBX: 0000557240396680 RCX: 
00007fc5052ff34d
[  342.866416] RDX: 0000000000000004 RSI: 00007fc5059d85e1 RDI: 
0000000000000021
[  342.866418] RBP: 00007ffc54602770 R08: 0000000000000000 R09: 
00005572401f3fd0
[  342.866419] R10: 0000000000000000 R11: 0000000000000246 R12: 
00007fc5059d85e1
[  342.866420] R13: 0000000000020000 R14: 0000557240210540 R15: 
0000000000000000
[  342.866427]  </TASK>
[  342.866451] ---[ end trace ]---


I also double checked that it's not some config error in my end by 
starting up Fedora 43 live enviroment what cave me this same error.

As far as I know its related to mtd and here is what I can see:

mtdinfo -a
Count of MTD devices:           4
Present MTD devices:            mtd0, mtd1, mtd2, mtd3
Sysfs interface supported:      yes

mtd0
Name:                           xe.nvm.3584.DESCRIPTOR
Type:                           dataflash
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          1 (4096 bytes, 4.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:0
Bad blocks are allowed:         false
Device is writable:             false

mtd1
Name:                           xe.nvm.3584.GSC
Type:                           dataflash
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          1357 (5558272 bytes, 5.3 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:2
Bad blocks are allowed:         false
Device is writable:             false

mtd2
Name:                           xe.nvm.3584.OptionROM
Type:                           dataflash
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          512 (2097152 bytes, 2.0 MiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:4
Bad blocks are allowed:         false
Device is writable:             false

mtd3
Name:                           xe.nvm.3584.DAM
Type:                           dataflash
Eraseblock size:                4096 bytes, 4.0 KiB
Amount of eraseblocks:          16 (65536 bytes, 64.0 KiB)
Minimum input/output unit size: 1 byte
Sub-page size:                  1 byte
Character device major/minor:   90:6
Bad blocks are allowed:         false
Device is writable:             false

