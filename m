Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291A1C54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 18:42:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0ED811236E;
	Thu,  7 Mar 2024 18:42:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kiBvQZDS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AD011236E
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 18:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709836967; x=1741372967;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=NjGpJj/el9+lPUs7CKqCLVC/WmISSEwePEatKGIPSa8=;
 b=kiBvQZDSxrzzxyjaP5oBWafN0PaU5+QlRU70YM3sl5QUlmqREy93q+3+
 e0TPTaHZapA73ClO2nU9oSs4jHB1pQ9mgCvFLJES9AUphRfX3sXfPxZ3V
 6p+ART5iFmPtWNntvDG4PdRbWwZUh1CvfCkHn1cnmazCvLCL2oJD9/Q/1
 FJcMDqMxuPok3lh2NHLja5wAbJMqIY29U2KEP9qjUuFdTM46q5PzrtoHb
 FwU9xup6BfbZ79fd3mCnbjVwnGbH5Ubc8KBqF2InhNvjj60xq4pjB83fO
 85RJEb1WKtWxrkhy3Q1wZ0TZ+gcE3HLq8YbhwotF0cdrBOBdO6GkjObdL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4372664"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4372664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 10:42:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10133283"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 10:42:46 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:42:45 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 10:42:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 10:42:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CwwxagIQJb1vEVz3DQU6i4i4XnHqBgJyOJxkDlRJcxElX6bodKplZzn5vparAnOOo6F1j0KZvmMEsBTg957Tbs6/3HxFLScVvUY1BaFofhdIPdDQ6sJqIXi5x60uut+bh9UwquDGXGYOmv8yudR05sQeu6CYPoAU2UP0Zu2C3aR7W5xhj5BfJnNdeBuaYep1mZGVU91vHrLVB4cakWUh3bkf1Gp2DTG0bEtzRBsOO0BP1E/TXNSdI2yFxPhVxukcirzB3b+Qnp4hOHz+TVftRGWEroPvRkIpgg4ysoIXOXCt5w/KgG0BfTrP7hL6U2a+em82+w5m/jwW5DYWrEyb8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vuog/RUd4RVktnED6gH9HCax3TBUGQVUqTnUBBMpY+Q=;
 b=juvq2Nqq+45V14PdKs7JQfwwPR0r/L0827WMoPkyPWLzIhbLFf2t+sULFDkqIeMt7ttftPPXBk0RBgB3AJAd2b2/bMCaSNoN8CNYtUhmoSbtoGLT+rHOdz/qqT6vrdCM/kj9p0kI98rvGeuXfg3BmWRMQMJFtBPPSNo3blYcQ76p4zKwqJsnU1J5vdeB9O1uy8UngfX1rQXV2qItLGyERZBmzou45BVGTL2IqS3oo61O2GkKuJx4BZAth1Tnhyb7TN1c7GbmSFACgyTjD7ytunY2OPZEEh+fFVTBz0cVxPYlTG6u41/beEHlO2V2IN8iIijKsJDEexgDm6TwOEPm3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6059.namprd11.prod.outlook.com (2603:10b6:208:377::9)
 by MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Thu, 7 Mar
 2024 18:42:43 +0000
Received: from MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d]) by MN0PR11MB6059.namprd11.prod.outlook.com
 ([fe80::a7f1:384c:5d93:1d1d%4]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 18:42:43 +0000
Date: Thu, 7 Mar 2024 13:42:37 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Do not grab forcewakes when issuing GGTT
 TLB invalidation via GuC"
Message-ID: <ZeoKncU_r_iyKtAG@intel.com>
References: <20240307001105.161856-1-rodrigo.vivi@intel.com>
 <uovrap7ztb6mhbqfbw73yaslpqkhmt74kiyudzy646oukoii2e@ojksg6dxqp5b>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <uovrap7ztb6mhbqfbw73yaslpqkhmt74kiyudzy646oukoii2e@ojksg6dxqp5b>
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To MN0PR11MB6059.namprd11.prod.outlook.com
 (2603:10b6:208:377::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6059:EE_|MN6PR11MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: fd7a462a-9dc5-4d93-2758-08dc3ed65f97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JgPdB72KPuNEWT1CcP8jT3IvPTfa9Q4RgKcgzAK+7LwM7BJSTcVYluPKOHbSvD+t3uVNwHs3VKpQgIxdxqWafEIhXQoni1ay7gfAvBljQd8nUqBFfqkU8yJIkyp1Rl2cawCe6wFbs8SBscS+9ZGVKX+IQciEi98Fr5HHkEl2N/l/6XaBz9Lu3+NspXcAiBAH+uQf8hf1ytQoUimtsMJHvWiTcKFk8GjFs5h+ZRGDPkE8zIwJ2NOIjm5dN4OEmuDcTUdwnzh/oz6zAsUnRCYytbQmM84pC7e9Vnlv3e5dprwh5LcEqvADvMTpKPlvnTn/0aI1RCSQZVn0TCuI1r3YwYDtBxjUUvDGz9aige/f7Wa6jc0rqqsXDKUz58mc3fTuBEvtltCZEdOHpnASJJBgfLnyuY7jaowndD1pWpjuEOA5hs+4D37G17nnYWDOb9CBMM6QclIawT5TE1HdRaJ4XW6s40T9fzyy26qt8ZUjh5K9ryuQXF5DJiyEU9bpydR+4/I9Yu3k+aEIF6mru700wOkFgj0Ic+Kw2mztgpegf/A+ibu+ruwq9+YM1OLf2GwcRJ1srLpYl4ACZGQ++ltJ391jBSS9H0Ak/Se6OLy94UM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6059.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gGws018V6vQmG13GH/gHiFQkYqZw2x8OpNyraVMeCtu1Setq2TacONQPNxma?=
 =?us-ascii?Q?jpUeZcq6nnHSe6TUJOxrIyyIJNVFuppuMoUY1CDWkmv4BDvinMiMdQoBvxn9?=
 =?us-ascii?Q?Hu1x5hoNrEObE6Fmu7C625+1s1sfaypUtDzQITCq9SB0FeVp12Fdf+ovNLFi?=
 =?us-ascii?Q?URia4AXjOOg8nJJsh7dQ0+qhvkrG7AbiJUuqKBq27XKJYyLLiTs9csIQsMo6?=
 =?us-ascii?Q?JkgOXNvOcP6cjF0p0CuWcyf1zl3oS1r/gUSqPZzxkhPTikTmUGd8XczkKl7R?=
 =?us-ascii?Q?a36hVHgAltvkgWLKPXxbHip3GISZfyVWBPdVidlvdQag0i/97XEoMqDeyl9n?=
 =?us-ascii?Q?twQ6gUvIxrbmMwvQYvshE5cehKOGdRWVGw1HJvxI6+P8yub1SWjfdN2H+NJ5?=
 =?us-ascii?Q?cxtkBR4fNXZWdpFH7ZNVbtv/+Zz71xaoKLL8UjSugjYQ1JyydUjvORb7grn1?=
 =?us-ascii?Q?fmQJc3MrBUbxQPQE4ZoFR4EP8MNkyU0BZv2DsL6icGIgFz/2zJYZEva3yNRc?=
 =?us-ascii?Q?UMvdCBfCQ7gvf+rM1mxeHlr5wj3EKgjul2/zXEkhKCxAumcz2ZG4a7JhTEhN?=
 =?us-ascii?Q?q4q0LJu4zxYZ1VQ4Ly5UQzxducCfbonQV073zgHPGgLH3TUKjtNDloEFoHDY?=
 =?us-ascii?Q?z4iyAFxKZTVaXdkZzi75cwdAPib4l8ivlIWqMwdOZKoZNJvMyInZjdpWKS8F?=
 =?us-ascii?Q?PH7QFovW9plmUdKxHIemuwWPkRmvuXdE7kH9RvcdzcsG5QN3J26CQKzRiDwX?=
 =?us-ascii?Q?ea6V7KaLUoXPHofDPOxgGRjVnubnhJyQ+SNbMrT3VxPp4oYgx0EVyKrDYtW5?=
 =?us-ascii?Q?u6GsEioiM4koD+ActAXApLMn7OR+PB8mxx/I1MM1rKrvtlViTmNZb/95V55H?=
 =?us-ascii?Q?ibt5sPQhGbCtuIre6jVqrxujusOCeA2a+OC6kNvMBTAI4dVwauMMZzlZlVZg?=
 =?us-ascii?Q?heorlHsBlhFwmMFVn7WxP7MSDCDy/BjMBlSQqftxjcMxHLGK/ZN5g79Dap+O?=
 =?us-ascii?Q?DakvNKmbDYkD6twdFbXxbGbPThb6BHWpXtKLB5Qyl8ZgW8QFlrAuuNvu8vrv?=
 =?us-ascii?Q?5zug1QOVgYxHidZy9PS69T+NxFaQSTsg2B0lGlJT/Au3A+iyZzo+wXH3eFQ/?=
 =?us-ascii?Q?jVHEUObmUupXE8UK9sTqOtwXvwX61jN4EKPbsu3LYqv81l8dWlVIJ4MLFoEA?=
 =?us-ascii?Q?qUybgdbaZXpHxF4RFoXKsaCU98Vr8O7SyCLoarnsG/pU106DJNp/hf8qVxB6?=
 =?us-ascii?Q?PZ9b1lOUoR154jas8G6VJBtFOFdkS3Otk0GxOAT9gHaZUJVBc20PGjNkYwVG?=
 =?us-ascii?Q?EENER5q8aKfiJW18kDuaHG/OOZSzyk7tHCk1sRHDvhcyfd5MHGxGKSc6fc9p?=
 =?us-ascii?Q?WQTnycI0Rkgw4jvA7uUSmLKOIx1sVc83SDNYXH4N0ADkMgdsYB+FsMtqBI0b?=
 =?us-ascii?Q?TtrRznu2vp+yLs/GcRV+4ZAxGfVKZjlHuo9+d0jUykeTjKv/mgJZzKumxWay?=
 =?us-ascii?Q?bYSgNh7YONGfSy+sLKXK5dLrSvlB/l2TGHnlw1026tqY4qKhGn4sVJWtCKa2?=
 =?us-ascii?Q?kP1tnIvPNSOO+nlBYuy02kT8KXPF5sR0S/IkWcLg/pGXpLe84spFGxDYa0VI?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fd7a462a-9dc5-4d93-2758-08dc3ed65f97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6059.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:42:42.9613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LsMBNG4vcXNUjj31pN0olapckDKYV4SylLfpY6okEsmOTHEWhJPxZ342hs+ibli36fn89huHEAEirp/hIQcNhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8146
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

On Thu, Mar 07, 2024 at 12:09:42PM -0600, Lucas De Marchi wrote:
> On Wed, Mar 06, 2024 at 07:11:05PM -0500, Rodrigo Vivi wrote:
> > This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.
> >=20
> > On DG2 after this patch:
> >=20
> > [  439.105953] general protection fault, probably for non-canonical add=
ress 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
> > [  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x000=
0000000000007]
> > [  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE   =
   6.8.0-rc7+ #5
> > [  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIO=
S F5 12/17/2021
> > [  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
> > [  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85=
 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03=
 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
> > [  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
> > [  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> > [  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888=
18231a478
> > [  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbf=
ff7563e5c
> > [  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888=
185330028
> > [  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000=
000000000
> > [  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) kn=
lGS:0000000000000000
> > [  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000=
000750ef0
> > [  439.226534] PKRU: 55555554
> > [  439.229256] Call Trace:
> > [  439.231713]  <TASK>
> > [  439.233832]  ? die_addr+0x3c/0xa0
> > [  439.237165]  ? exc_general_protection+0x158/0x240
> > [  439.241882]  ? asm_exc_general_protection+0x22/0x30
> > [  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
> > [  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
> > [  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
> > [  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
> > [  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
> > [  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
> > [  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
> > [  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
> > [  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
> > [  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
> > [  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
> > [  439.304127]  ? __pfx_lock_acquired+0x10/0x10
> > [  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
> > [  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
> > [  439.318093]  ? __pm_runtime_resume+0x7f/0x110
> > [  439.322458]  xe_guc_init+0x8d/0x890 [xe]
> > [  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
> > [  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
> > [  439.335161]  xe_device_probe+0x747/0x1060 [xe]
> > [  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
> > [  439.344599]  ? __drmm_add_action+0x19d/0x280
> > [  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
> > [  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
> > [  439.358154]  ? __pfx_lock_acquired+0x10/0x10
> > [  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
> > [  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
> > [  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
> > [  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
> > [  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
> > [  439.386196]  local_pci_probe+0xd6/0x190
> > [  439.390042]  pci_device_probe+0x223/0x740
> > [  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
> > [  439.398605]  ? kernfs_create_link+0x167/0x230
> > [  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
> > [  439.407252]  really_probe+0x3df/0xb80
> > [  439.410926]  __driver_probe_device+0x18c/0x450
> > [  439.415382]  driver_probe_device+0x4a/0x120
> > [  439.419572]  __driver_attach+0x1e1/0x4a0
> > [  439.423505]  ? __pfx___driver_attach+0x10/0x10
> > [  439.427963]  bus_for_each_dev+0xf2/0x160
> > [  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
> > [  439.436436]  bus_add_driver+0x29d/0x570
> > [  439.440283]  driver_register+0x130/0x450
> > [  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
> > [  439.448507]  xe_init+0x81/0x140 [xe]
> > [  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
> > [  439.456478]  do_one_initcall+0xcf/0x420
> > [  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
> > [  439.464783]  ? kasan_unpoison+0x40/0x70
> > [  439.468631]  do_init_module+0x238/0x730
> > [  439.472478]  load_module+0x5ff7/0x6c30
> > [  439.476242]  ? __pfx_load_module+0x10/0x10
> > [  439.480356]  ? ima_post_read_file+0x163/0x190
> > [  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
> > [  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
> > [  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
> > [  439.499220]  ? init_module_from_file+0xc0/0x100
> > [  439.503758]  init_module_from_file+0xc0/0x100
> > [  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
> > [  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
> > [  439.517382]  idempotent_init_module+0x241/0x660
> > [  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
> > [  439.526986]  ? security_capable+0x6d/0xb0
> > [  439.531003]  __x64_sys_finit_module+0xba/0x130
> > [  439.535459]  do_syscall_64+0x97/0x190
> > [  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
> > [  439.544282]  ? do_syscall_64+0xa7/0x190
> > [  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
> > [  439.552493]  ? do_syscall_64+0xa7/0x190
> > [  439.556341]  ? do_syscall_64+0xa7/0x190
> > [  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
> > [  439.564556]  ? do_syscall_64+0xa7/0x190
> > [  439.568401]  ? do_syscall_64+0xa7/0x190
> > [  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
> > [  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
> > [  439.582460] RIP: 0033:0x7f6c0f73160d
> > [  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa=
 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05=
 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
> > [  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000139
> > [  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f6=
c0f73160d
> > [  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 0000000=
000000003
> > [  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 0000565=
382a37760
> > [  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 0000565=
382a362a0
> > [  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 0000565=
382a362a0
> > [  439.648066]  </TASK>
> > [  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_du=
mmy snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_f=
ib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf=
_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_=
ipv6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc=
 vfat fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common snd=
_sof_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency s=
nd_sof_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_t=
emp_thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_in=
tel_match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hda=
_mlink snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 sn=
d_hda_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btrt=
l snd_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm =
intel_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
> > [  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_unc=
ore wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore m=
ei idma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keyma=
p loop zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmul=
 crc32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r816=
9 sha512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_ta=
bles fuse
> > [  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(OE=
)]
> > [  439.786092] ---[ end trace 0000000000000000 ]---
> > [  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
> > [  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85=
 b3 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03=
 <80> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
> > [  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
> > [  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000=
000000000
> > [  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888=
18231a478
> > [  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbf=
ff7563e5c
> > [  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888=
185330028
> > [  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000=
000000000
> > [  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) kn=
lGS:0000000000000000
> > [  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000=
000750ef0
> > [  439.876966] PKRU: 55555554
> >=20
> > Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT =
TLB invalidation via GuC")
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > ---
> > drivers/gpu/drm/xe/xe_ggtt.c                | 7 +++++++
> > drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 --
> > 2 files changed, 7 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.=
c
> > index 5e739513ab0a..717d0e76277a 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -257,9 +257,16 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *g=
t)
> > 	if (!gt)
> > 		return;
> >=20
> > +	/*
> > +	 * Invalidation can happen when there's no in-flight work keeping the
> > +	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
> > +	 * and GuC are accessible.
>=20
>=20
> aside from the null pointer deref, what exactly
> from this comment above that would not be true to make the patch
> correct?

That's a very good question. maybe -ENOTENOUGHCOFFEE from my side...
my bisect took me to this patch that touches the RIP function:
[  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
and I had to use this revert to be able to proceed with my work yesterday.

But then, Matt pointed me to https://patchwork.freedesktop.org/patch/581522=
/?series=3D130786&rev=3D1
and applying that here also make things work...
although that doesn't touch the xe_ggtt_invalidate but only ggtt_invalidate=
_gt_tlb

So, I'm still puzzled on the backlog above, but anyway,
what we need is not this revert, but get this
drm/xe: Fix NULL check in xe_ggtt_init()
pushed asap

>=20
> Lucas De Marchi
>=20
> > +	 */
> > +	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > 	err =3D xe_gt_tlb_invalidation_ggtt(gt);
> > 	if (err)
> > 		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=3D%d", err);
> > +	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > }
> >=20
> > void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
> > diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/=
drm/xe/xe_gt_tlb_invalidation.c
> > index a3c4ffba679d..f29ee1ccfa71 100644
> > --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> > @@ -247,7 +247,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >=20
> > 		xe_gt_tlb_invalidation_wait(gt, seqno);
> > 	} else if (xe_device_uc_enabled(xe)) {
> > -		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> > 		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
> > 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> > 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
> > @@ -257,7 +256,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> > 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> > 					GUC_TLB_INV_CR_INVALIDATE);
> > 		}
> > -		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> > 	}
> >=20
> > 	return 0;
> > --=20
> > 2.43.2
> >=20
