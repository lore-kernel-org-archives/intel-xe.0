Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D38CFCD128A
	for <intel-xe@archiver.kernel.org>; Sun,  7 Apr 2024 18:56:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F72310FBE5;
	Sun,  7 Apr 2024 18:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dev-mail.net header.i=@dev-mail.net header.b="XhwE6a/E";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="CoKNMZUt";
	dkim-atps=neutral
X-Greylist: delayed 569 seconds by postgrey-1.36 at gabe;
 Sun, 07 Apr 2024 18:56:22 UTC
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4602B10FBE5
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Apr 2024 18:56:22 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 2491611400B6
 for <intel-xe@lists.freedesktop.org>; Sun,  7 Apr 2024 14:46:52 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Sun, 07 Apr 2024 14:46:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dev-mail.net; h=
 cc:content-transfer-encoding:content-type:content-type:date:date
 :from:from:in-reply-to:message-id:mime-version:reply-to:reply-to
 :subject:subject:to:to; s=fm1; t=1712515612; x=1712602012; bh=HS
 vIH+o/Fs0hTaH+ceHoXRQSzC6mnaee24KQarzQT68=; b=XhwE6a/EF/pwmSlqw7
 6ocWvizegbCELZ9/nMED4W8rwQjTA6oqLDz9TWuULh7QP1KmgtgqOCArqWsZJc2w
 ndCOYce/9n1XgvMpUXOnJGHp6t7rPzhHI1HHQaWBabKL4qFoxcHk3LWxD2BHAKej
 09NqdJp7Z5G7zI2OO8vtZirEVZprXvXGWA1z6Ug0z7dVp5eYMvJenu//zcLvUU7F
 sjQeR1SIF++yTiveV1c5D9e5btqT23Sb2MEvZr7jvgHCZu896cjwph809meaIrIr
 Ombx8525aqZDAabR2NPsAMdnE/06O3YVdJDXuI2zFvsjIGE23whUU7FVDKFp0Cjc
 GV4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:reply-to:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1712515612; x=1712602012; bh=HSvIH+o/Fs0hT
 aH+ceHoXRQSzC6mnaee24KQarzQT68=; b=CoKNMZUtv/MEAJ5T4kAVgo32+MHQK
 3Okltim/xAnBQGUPIO523ZYPk1Rg24+dN5SLmWrmYDc5TZll3GtSaZuRQYR8Uw+i
 y56EQsDBJgZyKPL9gcAJipJVSZfR8zUcva7AcUJZP2QxRJdh/tEsZr1cRQQ5mgzj
 CfsS7pkrA8PbVS17lft1jWJHIZJ6BDv0EVsCprYdLL0MHRSofM9dsLloXM4Ud9j3
 FNEOl7zrWbnck5NskPCdIcn8AeqyW9O5eQi9SHzaSMdCyyC6iQ5JHCqIlzhLXf6t
 MTKkMBLeG818RJnDclnzq4I9Uz6GvteeQWp6cEMkjDC+TeeTpPH1cD/mw==
X-ME-Sender: <xms:G-oSZrw5GNB7032PexR1MahKSSmTK6PV3cpUcGeFU94RAr9zKyZkkA>
 <xme:G-oSZjSZdec-MOn23ouw-1mcjo7G97eSYWkINr39IuXlw89FaM-aJ4DIl640WaIh3
 ewVI6uegaUaUQ_b>
X-ME-Received: <xmr:G-oSZlVLB4AkEOWSh4GKl4tuWKQeC2SBK8Pgnvm84pPYf8xp88sOQfh99LhKjt_hfbaO94Pp6Vh6Fvm0HQHChkFPkiMAX8RJ8kY2PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeggedguddvkecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepkfffgggfrhfhvffutgfgsehtke
 ertddtvdejnecuhfhrohhmpehpghhnugcuoehpghhnugesuggvvhdqmhgrihhlrdhnvght
 qeenucggtffrrghtthgvrhhnpefhudfhueehtdehkeevvdejudfffeeftddutdeugeeuue
 egffdtffdvueeghffgtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehpghhnugesuggvvhdqmhgrihhlrdhnvght
X-ME-Proxy: <xmx:G-oSZljdCH7XBfzESAtP8pwvxHjoLmeu6FNTVS0nBCTXG_y9s-MLHQ>
 <xmx:G-oSZtASBzpeQpIFWSIK1W9geJ0zg6L4u0bCWIhfetxgLbD0urn5zg>
 <xmx:G-oSZuJ-kEiAB9Se3s_KE2IPpTj_9LI9TQ9bPN2diSLGADoJWanK1A>
 <xmx:G-oSZsCjeh5PmU5pu2UTpGHE2YPaxnIp746tZjCQlHxRog9cLfRC8Q>
 <xmx:HOoSZg5PYfjFHafPYzKzLABnhv4VKY0dgPw7H_kOvHyiPmOpiinmxve3>
Feedback-ID: if6e94526:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <intel-xe@lists.freedesktop.org>; Sun, 7 Apr 2024 14:46:51 -0400 (EDT)
Message-ID: <e32c71e6-5370-4691-a9f9-82c07dab3c1c@dev-mail.net>
Date: Sun, 7 Apr 2024 14:46:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: pgnd <pgnd@dev-mail.net>
Content-Language: en-US, fr, de-DE, pl, es-ES
To: intel-xe@lists.freedesktop.org
Subject: kernel 6.8.4 + intel Xe driver boot errors: "xe 0000:09:00.0: [drm]
 *ERROR* Fault errors on pipe A: 0x00000800" ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Reply-To: pgnd@dev-mail.net
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



  i've bumped my system to kernel 6.8.4 & enabled the new Intel Xe drm driver with kernel opts,

	i915.force_probe=!56a5 xe.force_probe=56a5

the  system boots to DE completely, but boot logs are spammed with ERRORS,

			xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800

is this, in fact, drm/xe specific?  a known issue, workaround or fix?

initial details:

with

	inxi -GS
		System:
		  Host: pgnd.lan Kernel: 6.8.4-200.fc39.x86_64
		    arch: x86_64 bits: 64
		  Desktop: KDE Plasma v: 5.27.11 Distro: Fedora Linux 39 (Thirty Nine)
		Graphics:
		  Device-1: Intel DG2 [Arc A380] driver: xe v: kernel
		  Display: x11 server: X.Org v: 1.20.14 with: Xwayland v: 23.2.4 driver: X:
		    loaded: modesetting dri: iris gpu: xe resolution: 2560x1440~60Hz
		  API: EGL v: 1.5 drivers: iris,swrast platforms: gbm,x11,surfaceless,device
		  API: OpenGL v: 4.6 compat-v: 4.5 vendor: intel mesa v: 24.0.4
		    renderer: Mesa Intel Arc A380 Graphics (DG2)
		  API: Vulkan v: 1.3.275 drivers: N/A surfaces: xcb,xlib


log here; note that a coredump's created, but then deleted ...

	dmesg | grep -iE " xe |huc|guc|drm"
		[    5.330099] ACPI: bus type drm_connector registered
		[    5.500519] [drm] Initialized simpledrm 1.0.0 20200625 for simple-framebuffer.0 on minor 0
		[    5.500629] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledrmdrmfb frame buffer device
		[    7.083939] xe 0000:09:00.0: vgaarb: deactivate vga console
		[    7.099638] xe 0000:09:00.0: vgaarb: VGA decodes changed: olddecodes=io+mem,decodes=none:owns=none
		[    7.103563] xe 0000:09:00.0: [drm] Finished loading DMC firmware i915/dg2_dmc_ver2_08.bin (v2.8)
		[    7.103594] xe 0000:09:00.0: [drm] VISIBLE VRAM: 0x0000007c00000000, 0x0000000200000000
		[    7.103772] xe 0000:09:00.0: [drm] VRAM[0, 0]: Actual physical size 0x0000000180000000, usable size exclude stolen 0x000000017c800000, CPU accessible size 0x000000017c800000
		[    7.103775] xe 0000:09:00.0: [drm] VRAM[0, 0]: DPA range: [0x0000000000000000-180000000], io range: [0x0000007c00000000-7d7c800000]
		[    7.103778] xe 0000:09:00.0: [drm] Total VRAM: 0x0000007c00000000, 0x0000000180000000
		[    7.103780] xe 0000:09:00.0: [drm] Available VRAM: 0x0000007c00000000, 0x000000017c800000
		[    7.104620] xe 0000:09:00.0: [drm] HDCP support not yet implemented
		[    7.127850] xe 0000:09:00.0: [drm] Using GuC firmware from i915/dg2_guc_70.bin version 70.20.0
		[    7.140674] xe 0000:09:00.0: [drm] ccs0 fused off
		[    7.140677] xe 0000:09:00.0: [drm] ccs2 fused off
		[    7.140678] xe 0000:09:00.0: [drm] ccs3 fused off
		[    7.140985] xe REG[0x223a8-0x223af]: allow read access
		[    7.141010] xe REG[0x1c03a8-0x1c03af]: allow read access
		[    7.141036] xe REG[0x1d03a8-0x1d03af]: allow read access
		[    7.141060] xe REG[0x1c83a8-0x1c83af]: allow read access
		[    7.141085] xe REG[0x1d83a8-0x1d83af]: allow read access
		[    7.141109] xe REG[0x1c3a8-0x1c3af]: allow read access
		[    7.177225] [drm] Initialized xe 1.1.0 20201103 for 0000:09:00.0 on minor 0
		[    7.207026] fbcon: xedrmfb (fb0) is primary device
		[    7.231381] xe 0000:09:00.0: [drm] Reducing the compressed framebuffer size. This may lead to less power savings than a non-reduced-size. Try to increase stolen memory size if available in BIOS.
		[    7.283570] xe 0000:09:00.0: [drm] fb0: xedrmfb frame buffer device
		[   21.435806] systemd[1]: Starting modprobe@drm.service - Load Kernel Module drm...
		[   21.463065] systemd[1]: modprobe@drm.service: Deactivated successfully.
		[   21.463187] systemd[1]: Finished modprobe@drm.service - Load Kernel Module drm.
		[   45.576840] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=7, flags=0x0
		[   45.576993] xe 0000:09:00.0: [drm] Xe device coredump has been created
		[   45.576996] xe 0000:09:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
		[   45.743307] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=7, flags=0x0
		[   55.564673] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564689] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564700] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564711] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564722] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564733] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564744] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564754] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564765] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   55.564776] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[   56.912951] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=10, flags=0x0
		[   56.913047] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=11, flags=0x0
		[   59.126619] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=27, flags=0x0
		[   60.354381] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=29, flags=0x0
		[   60.354463] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=30, flags=0x0
		[   65.993515] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=29, flags=0x0
		[   65.993602] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=30, flags=0x0
		[   72.072205] xe 0000:09:00.0: [drm] Timedout job: seqno=829, guc_id=6, flags=0x0
		[  100.235909] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235927] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235938] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235949] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235964] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235976] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.235989] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.236001] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.236013] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  100.236025] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253495] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253508] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253520] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253531] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253543] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253554] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253565] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253577] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253588] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  105.253599] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278313] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278329] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278340] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278354] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278366] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278378] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278391] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278403] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278416] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  112.278429] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162535] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162554] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162565] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162576] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162591] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162603] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162616] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162628] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162640] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  153.162652] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181201] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181218] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181229] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181242] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181254] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181267] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181279] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181292] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181303] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  158.181316] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203045] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203063] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203074] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203085] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203100] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203113] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203125] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203137] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203149] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  163.203161] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825087] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825106] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825117] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825128] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825139] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825154] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825167] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825179] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825191] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  246.825203] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184499] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184515] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184526] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184539] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184552] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184564] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184576] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184588] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184600] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  318.184612] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407208] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407225] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407236] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407248] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407259] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407270] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407281] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407292] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407304] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  324.407315] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703197] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703215] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703226] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703238] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703248] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703259] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703270] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703280] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703291] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  358.703301] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706226] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706243] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706255] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706267] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706278] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706289] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706299] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706311] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706322] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  363.706332] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773178] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773192] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773203] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773214] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773225] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773236] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773247] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773258] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773268] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  368.773279] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  369.530480] xe 0000:09:00.0: [drm] Xe device coredump has been deleted.
		[  373.893326] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893341] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893353] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893366] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893379] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893391] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893403] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893416] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893428] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  373.893440] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034502] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034520] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034532] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034543] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034558] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034570] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034582] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034594] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034606] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  380.034618] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384686] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384704] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384716] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384727] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384742] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384754] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384766] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384778] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384791] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  395.384803] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387489] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387503] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387516] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387528] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387541] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387553] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387565] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387577] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387589] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  400.387601] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915886] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915904] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915916] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915927] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915941] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915953] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915966] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.915978] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.916126] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  410.916139] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956875] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956893] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956904] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956915] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956926] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956937] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956960] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956971] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956981] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  415.956992] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620882] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620895] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620905] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620916] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620926] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620936] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620947] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620957] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620968] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  423.620978] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911787] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911805] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911817] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911832] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911844] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911856] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911868] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911880] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911893] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  453.911905] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627835] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627856] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627870] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627882] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627893] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627904] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627915] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627926] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627937] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  465.627948] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681859] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681885] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681896] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681909] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681924] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681935] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681946] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681957] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681968] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  476.681980] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695171] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695189] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695201] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695212] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695223] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695234] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695245] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695256] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695267] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  481.695278] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045144] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045164] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045177] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045189] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045200] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045211] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045222] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045233] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045243] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  493.045254] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998304] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998324] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998336] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998348] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998360] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998370] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998381] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998392] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998403] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  498.998414] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763005] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763024] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763037] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763049] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763060] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763070] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763081] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763093] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763103] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.763114] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  511.858434] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  511.858602] xe 0000:09:00.0: [drm] Xe device coredump has been created
		[  511.858604] xe 0000:09:00.0: [drm] Check your /sys/class/drm/card0/device/devcoredump/data
		[  511.864443] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  511.896936] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  511.902807] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  511.920623] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  511.926468] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  511.944083] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  511.949934] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  512.107703] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.813499] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.819400] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  520.819773] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.850143] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.855771] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  520.856153] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.873478] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.879264] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  520.879650] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.896739] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  520.902543] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  520.902926] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  521.038590] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.744658] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.750758] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  525.751144] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.784956] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.790221] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  525.790604] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.808138] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.813895] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  525.814279] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.831432] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.837259] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  525.837631] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  525.980375] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  529.938124] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  529.944169] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  529.944549] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  529.979058] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  529.984726] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  530.002606] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  530.008446] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  530.008831] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  530.025936] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  530.031763] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=39, flags=0x0
		[  530.032145] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  530.126783] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126796] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126809] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126820] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126832] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126843] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126855] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126866] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126878] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.126889] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  530.182080] xe 0000:09:00.0: [drm] Timedout job: seqno=4294967169, guc_id=40, flags=0x0
		[  539.382895] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382915] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382926] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382936] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382951] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382963] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382974] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382985] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.382997] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  539.383008] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174072] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174089] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174100] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174115] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174126] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174139] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174151] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174163] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174176] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  547.174188] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948585] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948600] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948611] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948625] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948638] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948650] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948662] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948673] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948685] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  557.948697] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522660] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522678] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522689] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522703] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522715] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522727] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522740] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522752] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522764] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  582.522776] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327928] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327946] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327958] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327969] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327980] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.327991] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.328006] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.328019] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.328031] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  589.328043] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364736] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364749] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364760] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364772] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364784] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364795] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364807] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364818] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364829] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  594.364841] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536035] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536051] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536062] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536073] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536086] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536099] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536111] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536123] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536137] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  599.536148] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973480] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973495] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973507] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973521] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973533] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973546] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973558] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973570] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973582] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  621.973594] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974638] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974652] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974663] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974679] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974691] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974704] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974715] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974728] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974740] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  626.974752] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903889] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903905] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903916] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903929] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903941] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903953] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903966] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903977] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.903989] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  639.904001] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.866945] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.866964] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.866975] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.866986] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.866997] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.867013] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.867025] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.867038] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.867050] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  652.867062] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533258] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533272] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533284] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533296] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533307] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533319] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533330] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533342] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533353] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  658.533364] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784121] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784136] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784148] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784161] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784173] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784185] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784198] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784210] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784222] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  679.784234] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628722] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628740] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628752] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628763] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628779] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628791] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628804] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628816] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628828] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
		[  686.628840] xe 0000:09:00.0: [drm] *ERROR* Fault errors on pipe A: 0x00000800
