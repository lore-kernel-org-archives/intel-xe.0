Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E108C54E41
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 00:11:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBF01135F5;
	Thu,  7 Mar 2024 00:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ljy7wzqD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F308F1135F5
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 00:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709770277; x=1741306277;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=LOXmjaembGDaAQOz2PDZH6xChJGoteLuCBsR4KBRv9U=;
 b=ljy7wzqDTHZQhFLhwtZWXQuUgWGKlDNc2hQYmDNPEQ9Sv0nn9kaC6OwE
 ISVbjDPye5av/kZ/+UBGcpBFcQz5OUDxpm19bGeTcBrH+LT/fA5ZUybwn
 2YPOUxjZD9kb820eKaZes+Bmg7IMH8A4cZR8DW5GDlRk9rnChzdJ+MWx0
 iIHLrPduU7n2z3p5OgtSi4CytTkshKfULyVsq/+EJIicCSrmsUUIOYIsi
 b4fnHZS3wmqImiwOiKKqp5VTkN99SaREyCM6xgvm0xbYBPvwHpepP9lK0
 LySxf1iIaGz2Nggl1H/WjT5eDfBk46iIfsCsei40as321zi/0QJSPAT4N g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="8240167"
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="8240167"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2024 16:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,209,1705392000"; 
   d="scan'208";a="9812536"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Mar 2024 16:11:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 16:11:14 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 16:11:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 6 Mar 2024 16:11:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJgR9LqjcJwu4/oh3/FM8e1EVf+Q7a/pibaG0/QwjlWNAUJvP7oh+yaX90TYzgi9LR8TQbXerUK6eSwfKceZWCA5qNH6rOjwedmpwr+Vffn8iBPIhWuMGHbNcSB8oDVMhdwo8h3cl/D6pigSkFOkn4i9REVl3nHUscs3gAifzlGQSzL0RYV+PdQs4eJptIYa+6Vm2H/XeX52MEz7YZkI+QlwF3mDXSjKdLeHz/B4Q2u/286s3OIUmouhWVHE0CyH/rrrncTnCLN8GMPPhOsMtXSX2IS4H5ynAFycBjBrLxSljYwojwMtkliOt+3R1btuPyTMMoFxo/Q/dpymkban4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RqBQFc+sxt5sKcjo6lc4TD16jyOfZaFMOsyM7+A2OOA=;
 b=NQggMs9elfJNxHofM4A7kyNfeJnjatoU+jvEUW/F6dZgyMXwUUR7GEmvDkgvQSuggGU7UX3T21oyrT3WcA5AhirnSos10BZbFPi6jh5/qdHIcTTOvhfyylFKwMctfnvxKTGelM4X68wki+OYBDB19gd8osBHTTxepiJhk0n/1YbHyiHI64RD5zHG5hgLHVwu0bHibwpoS6X9Cok5vMpCyj9bjsSvj/5BJerXfPa3/uAnGpc4lgYDwt3591bzxHWdBB3kU5CUvqTkAj55l6OZCq/UufqJAuFDBPIXpiFbrwbs696IBWe6yJ4RO97VqFsdIj9dcBqBOR2PJoKaUjNfPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by SJ0PR11MB5792.namprd11.prod.outlook.com (2603:10b6:a03:425::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 00:11:09 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 00:11:09 +0000
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: [PATCH] Revert "drm/xe: Do not grab forcewakes when issuing GGTT TLB
 invalidation via GuC"
Date: Wed, 6 Mar 2024 19:11:05 -0500
Message-ID: <20240307001105.161856-1-rodrigo.vivi@intel.com>
X-Mailer: git-send-email 2.43.2
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0069.namprd17.prod.outlook.com
 (2603:10b6:a03:167::46) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|SJ0PR11MB5792:EE_
X-MS-Office365-Filtering-Correlation-Id: 672258d5-b08f-4c9c-4dc8-08dc3e3b170d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: prBIl213d9U6xTZ0GyBlH+tIp9r62GiybH61UGjSNUx+AT02DC3t5NKn9/fYF7LK65P9BYkvAyKGDsGi3vTJR0qxtn5uVFQfts3GIE8mw3LiSRAsa027DFOeYPelv7v/KPl6c6+HtO4zWCNA9Ic7NfQJCUN+BqzUSOt7g/DslEC4Cc0uqwQHSp0U8Z8fm44MplH4bO1RN6ff5v6Q9jOnqZpgCUgBw3CTDEBbVpbrvNbgEn6kuf+ISfKelz/aKLGyxsvQ1aZheKTlKs0VLwdoQNpq0K5aIr8cBPEKIY/Hd6RQGiqtxZ/YnurnJbZ+5KQiRfbY437F1Dmb6if0YjDQ/naJLRhI6LQAfndbqyyTGZiJDaUHS2RKHp/qZSZebEcNh6L56nAZol1jr8d23i73wKCb983sRXCKnvYrobeyYBobfxfEY2SrrjdFA1mEuZDjv0lIu5INvQmzJIhOO2Y5561a9A6UCVSF3eoQMUx8F0VT9SD/9+PWjWyZT8ZKLptj0zo14YUv1EoXKBLmIIaFLgqWyD4DkBP1zvSMG2e5ZiYxmd6IsUg2BGEOzah+qa0qoRXV8QgWBfH6/0UxQMBwoFXejKwIgsiczIgwd3HLRhR2foOPY3G4/JjYlTnX9CNMkqFIurAZTJGE1MvB+XP7oD/dZ6fL+P9SZFv5FbWRaEw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mr53yTMj2n7iP/uVwr8ZrnCx1RMn3fp1QYWQvefmI+gnW+fGR6iCodYREKyE?=
 =?us-ascii?Q?alj7feBpDLS4cZ7jz460/ilPDsgavpo8NNQI2V92C9TKz3zrwyV6InjhOfwj?=
 =?us-ascii?Q?0MV3rp4EVDOLgkd6VAVf9IgR8NO+lb9v+iZB73ePKl0797555C6nG1OoZvPV?=
 =?us-ascii?Q?HDV+P9LLyQyLnhLw/MEtWTwi8Weuqa9Zh6tY+6N1ABy1Ov9BQpQK/lQClFqG?=
 =?us-ascii?Q?zjr2FklU+BcWIeEXKpf73taq0SXvULOwa7y2YQJGmM9f8haVhdnmnLDtLv+h?=
 =?us-ascii?Q?i2FlxxiWxKLRjs9JPBznT824+hCN3MIrKqu3rmhmySAY8BbHrUmb4DnRJ9aw?=
 =?us-ascii?Q?O8q8dY5ZGiEE65O9pKU+L7z8+iX9lwTQgT3aV8VGB3TJyTrLllODr+zPTXyx?=
 =?us-ascii?Q?HwWMUUzFhtIQ6B8FpKCKpyrgtlt4zwUBpUWOXQj/wAbbGF3kwGe1ZXe/uwAL?=
 =?us-ascii?Q?EJvlv/UEy5u7cGys4eW4dhaJ4sWfV90n11ail5yAFcmI4ZoJZjgIs3YOXhHl?=
 =?us-ascii?Q?tQrYavcXj19p97p+ZJeimqZBI/sSbI8x9tbx6qGX8otUI2CZUKSdRf6srU0+?=
 =?us-ascii?Q?Mx5kH04Go3kcTKsiIt979x2FV0+dDfJtE26tPa/uk8EBKeBMMmJFtQ0c9iRF?=
 =?us-ascii?Q?7hZvkUjILC+WxNaYnr7q0hnX9Rt76X84njQ3D2+5EQTGicGc538WMg3DbekD?=
 =?us-ascii?Q?WpCp6PCk+X8BmyjljJhgEXxKxh1BjB5xFMj1esuMQ4jKhViVYW64hd6fSsCj?=
 =?us-ascii?Q?MMoacaj/fjnY98KhlGrwBhY7lgJPYafgYlo7I9FlpF4CMPXp6JQJHVaCgkl+?=
 =?us-ascii?Q?5/YFLB1oU0hY28OCL7Lh1uRoW4rc5E2uZbMZylMCPJhWgD+bCwx+oxRhVHJO?=
 =?us-ascii?Q?y2e6p0EIIuE8oBzhQSPYPcE+/Ez01LCDl/S2gd0PgMn3dcURe9jL3PUNnxTy?=
 =?us-ascii?Q?sQFpa7RL+mVKvhY+Lrlko4K2MrbnuVnhbQZp0xcSR1YcsGxt/d0ajMKnCiDz?=
 =?us-ascii?Q?hD7Q3h9R0fdHkbwX20Um61ANOE9EV6LyhmylRaXSwvOYCr+Z1nN8HhFZp37S?=
 =?us-ascii?Q?xFJu8vcc5XVKwy3RSJIuLBcoErNasalBZh7iUjW3dyuAo1gfkNyveH/TKhZs?=
 =?us-ascii?Q?nF6Wudk+xtxAsJWWstPXQk4AOLCjEjmzPic7epRbsYbrRNO2uC0/onmDtciw?=
 =?us-ascii?Q?NQLfuw8tnJu4724Wz7zja0BiuJSusY1oqHwK7s3vM9VGRcmDLL87AcWxXVg5?=
 =?us-ascii?Q?QnKM08sj3+gvGeP2+3ByucV3GXm7eRQcjat0BTPcmvdsl9vPDNjRFl2t0PWp?=
 =?us-ascii?Q?TYbLvCxxvgtthcUU1Sz8I/ZhwSYs0x6psMexJasoQ6Y8VGP3I+s9qOqICEdh?=
 =?us-ascii?Q?TK3c9u5UsYa9GM9M9MEBVwpFr8/4OSn9celdTIgL/qeaoTykXwVqGC46c/8U?=
 =?us-ascii?Q?k4YHLmDgEPwMcishmaNQ2FAM7LulqpJI3Db10eJWGv3hV/S/j2GEn7b/NfSQ?=
 =?us-ascii?Q?/q/e0SKBI5yWKA83R7ZhBR0QYbYNNsWC6LbxXd4R7mhCHLmg0uUzRNwvtqU0?=
 =?us-ascii?Q?g5jP4RE+viOfVqP4ImoFaqE7Th+6cM/6DB19u0m7?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 672258d5-b08f-4c9c-4dc8-08dc3e3b170d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 00:11:09.3327 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U4oEOmMXybJzttN9ZskIlBtVFWnlUzWJRbFyS+I3oocXiELIwC1Nv+a+ikFrfOaDHUuPPtGEPExS4gJecTXnrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5792
X-OriginatorOrg: intel.com
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

This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.

On DG2 after this patch:

[  439.105953] general protection fault, probably for non-canonical address=
 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
[  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000=
000000007]
[  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE      6=
.8.0-rc7+ #5
[  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F5=
 12/17/2021
[  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
[  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b3 =
00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03 <80=
> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
[  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
[  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff8881823=
1a478
[  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbfff75=
63e5c
[  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff8881853=
30028
[  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 00000000000=
00000
[  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) knlGS:=
0000000000000000
[  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 00000000007=
50ef0
[  439.226534] PKRU: 55555554
[  439.229256] Call Trace:
[  439.231713]  <TASK>
[  439.233832]  ? die_addr+0x3c/0xa0
[  439.237165]  ? exc_general_protection+0x158/0x240
[  439.241882]  ? asm_exc_general_protection+0x22/0x30
[  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
[  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
[  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
[  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
[  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
[  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
[  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
[  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
[  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
[  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
[  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
[  439.304127]  ? __pfx_lock_acquired+0x10/0x10
[  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
[  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
[  439.318093]  ? __pm_runtime_resume+0x7f/0x110
[  439.322458]  xe_guc_init+0x8d/0x890 [xe]
[  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
[  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
[  439.335161]  xe_device_probe+0x747/0x1060 [xe]
[  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
[  439.344599]  ? __drmm_add_action+0x19d/0x280
[  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
[  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
[  439.358154]  ? __pfx_lock_acquired+0x10/0x10
[  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
[  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
[  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
[  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
[  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
[  439.386196]  local_pci_probe+0xd6/0x190
[  439.390042]  pci_device_probe+0x223/0x740
[  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
[  439.398605]  ? kernfs_create_link+0x167/0x230
[  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
[  439.407252]  really_probe+0x3df/0xb80
[  439.410926]  __driver_probe_device+0x18c/0x450
[  439.415382]  driver_probe_device+0x4a/0x120
[  439.419572]  __driver_attach+0x1e1/0x4a0
[  439.423505]  ? __pfx___driver_attach+0x10/0x10
[  439.427963]  bus_for_each_dev+0xf2/0x160
[  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
[  439.436436]  bus_add_driver+0x29d/0x570
[  439.440283]  driver_register+0x130/0x450
[  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
[  439.448507]  xe_init+0x81/0x140 [xe]
[  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
[  439.456478]  do_one_initcall+0xcf/0x420
[  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
[  439.464783]  ? kasan_unpoison+0x40/0x70
[  439.468631]  do_init_module+0x238/0x730
[  439.472478]  load_module+0x5ff7/0x6c30
[  439.476242]  ? __pfx_load_module+0x10/0x10
[  439.480356]  ? ima_post_read_file+0x163/0x190
[  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
[  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
[  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
[  439.499220]  ? init_module_from_file+0xc0/0x100
[  439.503758]  init_module_from_file+0xc0/0x100
[  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
[  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
[  439.517382]  idempotent_init_module+0x241/0x660
[  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
[  439.526986]  ? security_capable+0x6d/0xb0
[  439.531003]  __x64_sys_finit_module+0xba/0x130
[  439.535459]  do_syscall_64+0x97/0x190
[  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
[  439.544282]  ? do_syscall_64+0xa7/0x190
[  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
[  439.552493]  ? do_syscall_64+0xa7/0x190
[  439.556341]  ? do_syscall_64+0xa7/0x190
[  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
[  439.564556]  ? do_syscall_64+0xa7/0x190
[  439.568401]  ? do_syscall_64+0xa7/0x190
[  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
[  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
[  439.582460] RIP: 0033:0x7f6c0f73160d
[  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 =
89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48=
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
[  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000139
[  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f6c0f7=
3160d
[  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 00000000000=
00003
[  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 0000565382a=
37760
[  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 0000565382a=
362a0
[  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 0000565382a=
362a0
[  439.648066]  </TASK>
[  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_dummy =
snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_i=
net nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_rej=
ect_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6=
 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc vfa=
t fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common snd_sof=
_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency snd_s=
of_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_temp_=
thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_intel_=
match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hda_mli=
nk snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 snd_hd=
a_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btrtl sn=
d_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm inte=
l_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
[  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_uncore =
wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore mei i=
dma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keymap lo=
op zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmul crc=
32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r8169 sh=
a512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_tables=
 fuse
[  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(OE)]
[  439.786092] ---[ end trace 0000000000000000 ]---
[  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
[  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b3 =
00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03 <80=
> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
[  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
[  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff8881823=
1a478
[  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbfff75=
63e5c
[  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff8881853=
30028
[  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 00000000000=
00000
[  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) knlGS:=
0000000000000000
[  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 00000000007=
50ef0
[  439.876966] PKRU: 55555554

Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB =
invalidation via GuC")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c                | 7 +++++++
 drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 --
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 5e739513ab0a..717d0e76277a 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -257,9 +257,16 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
 	if (!gt)
 		return;
=20
+	/*
+	 * Invalidation can happen when there's no in-flight work keeping the
+	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
+	 * and GuC are accessible.
+	 */
+	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 	err =3D xe_gt_tlb_invalidation_ggtt(gt);
 	if (err)
 		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=3D%d", err);
+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 }
=20
 void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/=
xe/xe_gt_tlb_invalidation.c
index a3c4ffba679d..f29ee1ccfa71 100644
--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
@@ -247,7 +247,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
=20
 		xe_gt_tlb_invalidation_wait(gt, seqno);
 	} else if (xe_device_uc_enabled(xe)) {
-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
 		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
@@ -257,7 +256,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
 					GUC_TLB_INV_CR_INVALIDATE);
 		}
-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
 	}
=20
 	return 0;
--=20
2.43.2

