Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 017E0C54798
	for <intel-xe@archiver.kernel.org>; Thu,  7 Mar 2024 18:09:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BE010E2A3;
	Thu,  7 Mar 2024 18:09:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MrlVsNKx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8097710E2A3
 for <intel-xe@lists.freedesktop.org>; Thu,  7 Mar 2024 18:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709834995; x=1741370995;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=I5d2eAWmyCOCqgpBdW3K9UejiKKB3N2u4W5tfWNMIOY=;
 b=MrlVsNKxtZp4NpcFNt5KIoRdD3lMuP0L/vFCM9VdOy3TH5lnoXlS7hMW
 MF5ZrShGmsVd7YnvnSzTAK6AcaEwXdAd9tcjyvlg+z9wU1AoeII7Fdb/k
 w25KKAco6HDFnwCLEiYJHtJJBbQHYijpcC/vomh6X+wcraReyZjYAX8wr
 tZ5gIR6d61RFXx1kFtptWixwzTYHSWw1BHVaSzDrtoxpjQvkU45VB+dSX
 PAH04hfjX5dnT4rDX6Ikkx4hlvlGjjOURieLc+d5grJuqlcXysxZ50EYy
 i8+VSdLYa1kou6CC/udZRNAJeyQ4FAO189F9vTdwj6pGbgvwDyevnSACc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4376378"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4376378"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 10:09:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10604040"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Mar 2024 10:09:54 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:09:53 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 7 Mar 2024 10:09:53 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 7 Mar 2024 10:09:53 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 7 Mar 2024 10:09:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4461So8B1TLFde5p/X6P/lmmN6+baoYC/ImSllPjBOcVVgVSvdcIobjV9v6MbPfkj3PkvJri8ppGxEXDi/FO+8DtLDMjGrJHOPYUmONKuRm2kc6e/t5iAb/KhjAIFbTeauWn6qdaf4YmYrGu73R3zGrNEfruJ9AvKJ610L3A5kNB0JNDREEBZWboOq31ps5jPeUdIQh3s3fl9OV8adW3WfsFvHooQ66k7nE5RdEqOzbzksvo9fuXER9/DKm1cG3YeyymrIXLOra5MhF0oCwHjxLmwbX8HYPrzCoIyycYkmS1Um9wBEkRfTNgLHflwBcBeVWDc18vbsfM0KkzQEWDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80y6J4ICA4EFmU0pMeD8N41yTXzlA4XQkOAerqmC1EU=;
 b=ZSaanINwe1WvJvkFc9ZxYPi+Bn7WPjbQFQoIk/x5N5Urqm3bvZVeRdCmVTqCI4VPDROz0ix4gWM8RrpIIxAuxuMDO1NXjD+ZmLZLnbzK444Q0mKb/KqDsRy3S17RVz1dDgBPupmqM8lQS3sKoJ5HPtNuaLmeANojkxkfqzV5GSalA181DLo95t/1u7ROvYIf8SWM9CaU29l0pPu4yTIZXopFjjEpEhPfIevpGIr4WytQ7yW0wBUht5Zky17BZVQFWQLewXJNBq52D5VTy0I+IvJetKux61qU5xyBe3vDvaHwClhqMa/D5j7yV5aOlAnPOzjoc7frM+dx/hxMY/Xhqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8286.namprd11.prod.outlook.com (2603:10b6:510:1c6::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.6; Thu, 7 Mar
 2024 18:09:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7386.006; Thu, 7 Mar 2024
 18:09:49 +0000
Date: Thu, 7 Mar 2024 12:09:42 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] Revert "drm/xe: Do not grab forcewakes when issuing GGTT
 TLB invalidation via GuC"
Message-ID: <uovrap7ztb6mhbqfbw73yaslpqkhmt74kiyudzy646oukoii2e@ojksg6dxqp5b>
References: <20240307001105.161856-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240307001105.161856-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BY3PR10CA0029.namprd10.prod.outlook.com
 (2603:10b6:a03:255::34) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8286:EE_
X-MS-Office365-Filtering-Correlation-Id: e00cc913-674e-407a-151f-08dc3ed1c757
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CpAAwddkU+hyqvJflm+u8R+LCI20N6yIofbstYcoMN7E/TcaDYURAnBvFTaxbxF4R7nxIrpmMzUJZOiChDVE293/3KepMjWosmRdX899Y7qr8moSmP6Q0s9FhARPi5plUn/zvi2MahcVK+sFAa3jXHhH7Hz6nIuh+rVQbARjQRqdJQpb9PkHkMRieRUiMwWt3U0QO5bLpqBP7PgZzABqn66Ahl3moe9PMAC8gUXAn9ZvOa71Fu6+1+W4ID+4/sruomWhZ9IkFafw2yQmBUFJAXhei2jeNYgiiC77PO4RR0aCetdxfjrC9W5CEC8IdApEKH+2sP7UlWtuN3Jy/lhIrM294nVj45UZdGJhZriYqcKWZy4peIq3znb2WaGR1ejvR18AP3t5OC9wDiPMHn4yOniv3hUatfdOwoeLH+f5iB/ZjxpI8zOsadCBt+8NbgOOdm0VUYtlkf3JUb53ozlSEOQezxkqM/QTjQG/Sw5DwQqXXNHBEt6kp2W8et/7NhNstH+N/q2eKCzVx59KtYtbDzgbRWirmCcQIxNhOUqicyPkJ3jZ+3bzMOodW5stJKur4vqyAAuhfKhzrDIDsBN9eLEa4XclokQ4e3G63tfMHSmOsE74UmJVUVl+lOuvcP+IlGN0+usacHcPajaYhvmJGdWzo5xN8yyBE07lJDHT9z4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?y9D4BCtNCi7tSPii8asKVTGg/yVywrWk1GcLxR2JP8UhhlyZAlglH5bv0VBJ?=
 =?us-ascii?Q?ZZEHUs4TE+6ndL9qVOiI4LQajXVqCi2CiRhVGom/bROf3LHGAv2y/4dPnJHi?=
 =?us-ascii?Q?NGMiKmPSCO90ToC5Otw7dW6cVtzepSfjcnJRf8sJZBwPFwicq3nwZqsGLBXI?=
 =?us-ascii?Q?z4jhccHH/l33zvcfk+mOX2oAZgMEk6z+60oR3mWfXbaZe4wcOXVjB6ZzBD8o?=
 =?us-ascii?Q?VSoT47QeDtii3SP0MdtLZ9TJmIpE9VjxclljtT+dM3Hz9w3ioP5tcD2+jub/?=
 =?us-ascii?Q?kd7EvtV2B5cAWuhwCAvNKGClkXIA0urXf5AnKpXbHCBsietOBEQ2NuvLaFxy?=
 =?us-ascii?Q?TgIIBjv8tCf+fbBi6DuYp4z9PjAhmPbY0wTEzbOLAPWE7DgxdXt+J/8epz+q?=
 =?us-ascii?Q?D77oWjP6xQB1T1VR8yH1KJ4eJ/3aqtSvZmVMwVJ31L/7K9Cft0upvRn6YUD4?=
 =?us-ascii?Q?HBDI2Hg9T2r+ouLDAaxtokiLqX+PzbORxot0fjzA+up2I2QhhJhRnHAUFCKG?=
 =?us-ascii?Q?LHkRS0n++sKzFhyMarA5DzUabjoz1PtBWWnO20AA4QFbNQvzLLaLJTHaMxkD?=
 =?us-ascii?Q?G2l7rb7sZfoVplGSYX7NRPBqx7qHwjiGg/BzTETYL8yGxFtQoj7MVbClF70V?=
 =?us-ascii?Q?40LsIZH2NLQ2uJKRIO4vPgpI4mhMv6jxtFqesCMPxIKLkWYtGYXbUoDp3dOG?=
 =?us-ascii?Q?rVYqoMDJaaLqr357Cv5tnNsE74Sq9rK6/Lm1btwKw4kL9sIdWyemxviYElZk?=
 =?us-ascii?Q?xMtFPLZUN66vi3JuOKj066cxbu26NKM++1uCE94qZaf7HTnXdDCA4OCmMJXH?=
 =?us-ascii?Q?IGnwhrWlFyMn8jpi4wU/olVTj8ImA9aSR95y+zmrtQTQlCeeI47bS/pd+M4A?=
 =?us-ascii?Q?t0x547lV4lbUfVILp4GqDJjvC9b8wZfppLxLZdOVPoB2P0SqlXFbPpXwyYsM?=
 =?us-ascii?Q?BSl9nH7536hkZD0Oc0YMhN1TqePpzHRcdinGeT1uGLtagXBryQnsEpP1WQKA?=
 =?us-ascii?Q?1uT7cCg8K5QJeoNhPwg/1dTHxEuigOKjplqrv3tjHbymIstRhZ8Da0ZJr7Kr?=
 =?us-ascii?Q?cAKdGOUkLAJwE4HZMT6ewxeWP5hKKTbHDndXsSxlY4wqxnLaYkKaxPZs93hm?=
 =?us-ascii?Q?7VA4pMMhSA0C7C0bbSW8uwM0izAR2rEGhaGx2h/7WSSvHK4zhw6hSEvm2nP3?=
 =?us-ascii?Q?fjPB5RvXo7IMeycFOU2OwHV2EwZk/s4wngSRbsFVEDGNODxNNxXbwmaRcTcz?=
 =?us-ascii?Q?QqlhzIs34WzXQ4z+IqjfQGpfMjDL6A2acM8yWtgVxPHd3ubG7V409oHR2JqW?=
 =?us-ascii?Q?1qAf0EeQGhdPk6nZXfbmNpiryBHb2xFc42u86LrfYTEYxhWMe972U4kn8JXR?=
 =?us-ascii?Q?WF8R7we+VIzpHYTOeYbvfbofRYxxkY9JPosS5ip7rwampX4IINNLZCfb8vAZ?=
 =?us-ascii?Q?P3ajw1/Z3ZRhfYjMAdcB0ASj3yPKrWjQLFtkoLMNZDkgCyN8U6Eq70JVw4kL?=
 =?us-ascii?Q?h7jjW5G+SwFm6GtBG0IjEMLyxjqE+S9mf6E04vVlb+IX1Qco10V4e8NQFE3X?=
 =?us-ascii?Q?bCyEDtpLPvDGqUJxzF5z5nNg3zzWyqk/D/tvBflSDDb6pBxpKGikHj5X84tq?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e00cc913-674e-407a-151f-08dc3ed1c757
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 18:09:49.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bChQJa2Rie6wGxgFVnPvhGojsg25QQWjebPQwxrzMS7U1sxgHVlUMCv0QOdEIsZVCT1gaRl6xx0zpT+LEJHyPbyYA5y32SJhsXoU5znOXAs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8286
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

On Wed, Mar 06, 2024 at 07:11:05PM -0500, Rodrigo Vivi wrote:
>This reverts commit 27ee413bbc0b04146f4ee1c7444422bf18dafd47.
>
>On DG2 after this patch:
>
>[  439.105953] general protection fault, probably for non-canonical addres=
s 0xdffffc0000000000: 0000 [#1] PREEMPT SMP KASAN NOPTI
>[  439.117349] KASAN: null-ptr-deref in range [0x0000000000000000-0x000000=
0000000007]
>[  439.124924] CPU: 8 PID: 7160 Comm: insmod Tainted: G     U     OE      =
6.8.0-rc7+ #5
>[  439.132669] Hardware name: iBUYPOWER INTEL/B660 DS3H AC DDR4-Y1, BIOS F=
5 12/17/2021
>[  439.140332] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>[  439.145860] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b3=
 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03 <8=
0> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>[  439.164609] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>[  439.169843] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000=
000000
>[  439.176980] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888182=
31a478
>[  439.184121] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbfff7=
563e5c
>[  439.191259] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888185=
330028
>[  439.198401] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000000=
000000
>[  439.205543] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) knlGS=
:0000000000000000
>[  439.213634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[  439.219393] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000000=
750ef0
>[  439.226534] PKRU: 55555554
>[  439.229256] Call Trace:
>[  439.231713]  <TASK>
>[  439.233832]  ? die_addr+0x3c/0xa0
>[  439.237165]  ? exc_general_protection+0x158/0x240
>[  439.241882]  ? asm_exc_general_protection+0x22/0x30
>[  439.246774]  ? xe_ggtt_invalidate+0x150/0x260 [xe]
>[  439.251679]  ? xe_ggtt_invalidate+0xa0/0x260 [xe]
>[  439.256490]  __xe_ggtt_insert_bo_at+0x24b/0x720 [xe]
>[  439.261556]  ? __pfx____xe_bo_create_locked+0x10/0x10 [xe]
>[  439.267144]  ? __pfx___xe_ggtt_insert_bo_at+0x10/0x10 [xe]
>[  439.272737]  __xe_bo_create_locked+0x4af/0x1080 [xe]
>[  439.277806]  xe_bo_create_pin_map_at+0x40/0x400 [xe]
>[  439.282873]  ? xe_uc_fw_check_version_requirements+0x496/0x900 [xe]
>[  439.289255]  xe_managed_bo_create_from_data+0x38/0x130 [xe]
>[  439.294934]  xe_uc_fw_init+0xe71/0x3270 [xe]
>[  439.299317]  ? __pfx_xe_uc_fw_init+0x10/0x10 [xe]
>[  439.304127]  ? __pfx_lock_acquired+0x10/0x10
>[  439.308406]  ? __pfx___drm_printfn_info+0x10/0x10
>[  439.313118]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>[  439.318093]  ? __pm_runtime_resume+0x7f/0x110
>[  439.322458]  xe_guc_init+0x8d/0x890 [xe]
>[  439.326497]  xe_uc_init+0x65/0x1a0 [xe]
>[  439.330440]  xe_gt_init_hwconfig+0xdc/0x180 [xe]
>[  439.335161]  xe_device_probe+0x747/0x1060 [xe]
>[  439.339712]  ? __pfx___drmm_mutex_release+0x10/0x10
>[  439.344599]  ? __drmm_add_action+0x19d/0x280
>[  439.348883]  ? __pfx___drmm_mutex_release+0x10/0x10
>[  439.353769]  xe_pci_probe+0x168b/0x2f30 [xe]
>[  439.358154]  ? __pfx_lock_acquired+0x10/0x10
>[  439.362433]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>[  439.367158]  ? _raw_spin_unlock_irqrestore+0x62/0x80
>[  439.372131]  ? lockdep_hardirqs_on+0xc7/0x140
>[  439.376498]  ? _raw_spin_unlock_irqrestore+0x4b/0x80
>[  439.381473]  ? __pfx_xe_pci_probe+0x10/0x10 [xe]
>[  439.386196]  local_pci_probe+0xd6/0x190
>[  439.390042]  pci_device_probe+0x223/0x740
>[  439.394064]  ? __pfx_pci_device_probe+0x10/0x10
>[  439.398605]  ? kernfs_create_link+0x167/0x230
>[  439.402970]  ? do_raw_spin_unlock+0x54/0x1f0
>[  439.407252]  really_probe+0x3df/0xb80
>[  439.410926]  __driver_probe_device+0x18c/0x450
>[  439.415382]  driver_probe_device+0x4a/0x120
>[  439.419572]  __driver_attach+0x1e1/0x4a0
>[  439.423505]  ? __pfx___driver_attach+0x10/0x10
>[  439.427963]  bus_for_each_dev+0xf2/0x160
>[  439.431897]  ? __pfx_bus_for_each_dev+0x10/0x10
>[  439.436436]  bus_add_driver+0x29d/0x570
>[  439.440283]  driver_register+0x130/0x450
>[  439.444218]  ? __pfx_xe_init+0x10/0x10 [xe]
>[  439.448507]  xe_init+0x81/0x140 [xe]
>[  439.452188]  ? __pfx_xe_init+0x10/0x10 [xe]
>[  439.456478]  do_one_initcall+0xcf/0x420
>[  439.460326]  ? __pfx_do_one_initcall+0x10/0x10
>[  439.464783]  ? kasan_unpoison+0x40/0x70
>[  439.468631]  do_init_module+0x238/0x730
>[  439.472478]  load_module+0x5ff7/0x6c30
>[  439.476242]  ? __pfx_load_module+0x10/0x10
>[  439.480356]  ? ima_post_read_file+0x163/0x190
>[  439.484722]  ? __pfx_ima_post_read_file+0x10/0x10
>[  439.489435]  ? security_kernel_post_read_file+0x6d/0xb0
>[  439.494673]  ? __pfx_kernel_read_file+0x10/0x10
>[  439.499220]  ? init_module_from_file+0xc0/0x100
>[  439.503758]  init_module_from_file+0xc0/0x100
>[  439.508125]  ? __pfx_init_module_from_file+0x10/0x10
>[  439.513103]  ? do_raw_spin_unlock+0x54/0x1f0
>[  439.517382]  idempotent_init_module+0x241/0x660
>[  439.521924]  ? __pfx_idempotent_init_module+0x10/0x10
>[  439.526986]  ? security_capable+0x6d/0xb0
>[  439.531003]  __x64_sys_finit_module+0xba/0x130
>[  439.535459]  do_syscall_64+0x97/0x190
>[  439.539135]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>[  439.544282]  ? do_syscall_64+0xa7/0x190
>[  439.548125]  ? lockdep_hardirqs_on+0xc7/0x140
>[  439.552493]  ? do_syscall_64+0xa7/0x190
>[  439.556341]  ? do_syscall_64+0xa7/0x190
>[  439.560188]  ? lockdep_hardirqs_on+0xc7/0x140
>[  439.564556]  ? do_syscall_64+0xa7/0x190
>[  439.568401]  ? do_syscall_64+0xa7/0x190
>[  439.572249]  ? lockdep_hardirqs_on_prepare+0x17b/0x420
>[  439.577395]  entry_SYSCALL_64_after_hwframe+0x6e/0x76
>[  439.582460] RIP: 0033:0x7f6c0f73160d
>[  439.586047] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48=
 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <4=
8> 3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 47 0c 00 f7 d8 64 89 01 48
>[  439.604792] RSP: 002b:00007ffd0ecad3b8 EFLAGS: 00000246 ORIG_RAX: 00000=
00000000139
>[  439.612368] RAX: ffffffffffffffda RBX: 0000565382a36740 RCX: 00007f6c0f=
73160d
>[  439.619506] RDX: 0000000000000000 RSI: 0000565382a362a0 RDI: 0000000000=
000003
>[  439.626644] RBP: 00007ffd0ecad470 R08: 0000000000000000 R09: 0000565382=
a37760
>[  439.633782] R10: 0000000000000003 R11: 0000000000000246 R12: 0000565382=
a362a0
>[  439.640925] R13: 0000000000000000 R14: 0000565382a38790 R15: 0000565382=
a362a0
>[  439.648066]  </TASK>
>[  439.650263] Modules linked in: xe(OE+) snd_hda_codec_hdmi snd_seq_dummy=
 snd_hrtimer rfcomm nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_=
inet nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_re=
ject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv=
6 nf_defrag_ipv4 ip_set nf_tables nfnetlink qrtr bnep sunrpc binfmt_misc vf=
at fat intel_rapl_msr snd_sof_pci_intel_tgl iwlmvm intel_rapl_common snd_so=
f_intel_hda_common snd_soc_hdac_hda snd_sof_pci intel_uncore_frequency snd_=
sof_xtensa_dsp intel_uncore_frequency_common snd_sof_intel_hda x86_pkg_temp=
_thermal snd_sof intel_powerclamp mac80211 snd_sof_utils snd_soc_acpi_intel=
_match snd_soc_acpi snd_soc_core coretemp snd_compress snd_sof_intel_hda_ml=
ink snd_hda_ext_core kvm_intel snd_hda_intel snd_intel_dspcfg libarc4 snd_h=
da_codec kvm snd_hwdep snd_hda_core btusb iwlwifi irqbypass snd_seq btrtl s=
nd_seq_device iTCO_wdt btintel rapl pmt_telemetry intel_pmc_bxt snd_pcm int=
el_cstate btbcm ee1004 iTCO_vendor_support btmtk mei_hdcp
>[  439.650319]  mei_pxp pmt_class cfg80211 i2c_i801 snd_timer intel_uncore=
 wmi_bmof gigabyte_wmi bluetooth pcspkr snd i2c_smbus mei_me soundcore mei =
idma64 rfkill intel_vsec intel_hid joydev acpi_tad acpi_pad sparse_keymap l=
oop zram drm_gpuvm hid_logitech_hidpp i915 crct10dif_pclmul crc32_pclmul cr=
c32c_intel polyval_clmulni polyval_generic ghash_clmulni_intel nvme r8169 s=
ha512_ssse3 nvme_core pinctrl_alderlake hid_logitech_dj ip6_tables ip_table=
s fuse
>[  439.739896] Unloaded tainted modules: xe(OE):2 [last unloaded: xe(OE)]
>[  439.786092] ---[ end trace 0000000000000000 ]---
>[  439.790733] RIP: 0010:xe_ggtt_invalidate+0x150/0x260 [xe]
>[  439.796254] Code: 48 8d 7d 18 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 b3=
 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 5d 18 48 89 da 48 c1 ea 03 <8=
0> 3c 02 00 0f 85 87 00 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b
>[  439.815026] RSP: 0018:ffffc9000201eee8 EFLAGS: 00010246
>[  439.820262] RAX: dffffc0000000000 RBX: 0000000000000000 RCX: 0000000000=
000000
>[  439.827407] RDX: 0000000000000000 RSI: ffffffffb6ae4040 RDI: ffff888182=
31a478
>[  439.834549] RBP: ffff88818231a460 R08: 0000000000000001 R09: fffffbfff7=
563e5c
>[  439.841691] R10: fffff52000403d92 R11: 0000000000000001 R12: ffff888185=
330028
>[  439.848835] R13: ffffffffffffffff R14: 0000000000001000 R15: 0000000000=
000000
>[  439.855978] FS:  00007f6c0fd92740(0000) GS:ffff888f76400000(0000) knlGS=
:0000000000000000
>[  439.864072] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>[  439.869824] CR2: 00007ffedd41de70 CR3: 00000001063ec000 CR4: 0000000000=
750ef0
>[  439.876966] PKRU: 55555554
>
>Fixes: 27ee413bbc0b ("drm/xe: Do not grab forcewakes when issuing GGTT TLB=
 invalidation via GuC")
>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>Cc: Matthew Brost <matthew.brost@intel.com>
>Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>---
> drivers/gpu/drm/xe/xe_ggtt.c                | 7 +++++++
> drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 2 --
> 2 files changed, 7 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
>index 5e739513ab0a..717d0e76277a 100644
>--- a/drivers/gpu/drm/xe/xe_ggtt.c
>+++ b/drivers/gpu/drm/xe/xe_ggtt.c
>@@ -257,9 +257,16 @@ static void ggtt_invalidate_gt_tlb(struct xe_gt *gt)
> 	if (!gt)
> 		return;
>
>+	/*
>+	 * Invalidation can happen when there's no in-flight work keeping the
>+	 * GT awake.  We need to explicitly grab forcewake to ensure the GT
>+	 * and GuC are accessible.


aside from the null pointer deref, what exactly
from this comment above that would not be true to make the patch
correct?

Lucas De Marchi

>+	 */
>+	xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 	err =3D xe_gt_tlb_invalidation_ggtt(gt);
> 	if (err)
> 		drm_warn(&xe->drm, "xe_gt_tlb_invalidation_ggtt error=3D%d", err);
>+	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> }
>
> void xe_ggtt_invalidate(struct xe_ggtt *ggtt)
>diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm=
/xe/xe_gt_tlb_invalidation.c
>index a3c4ffba679d..f29ee1ccfa71 100644
>--- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>+++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
>@@ -247,7 +247,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
>
> 		xe_gt_tlb_invalidation_wait(gt, seqno);
> 	} else if (xe_device_uc_enabled(xe)) {
>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> 		if (xe->info.platform =3D=3D XE_PVC || GRAPHICS_VER(xe) >=3D 20) {
> 			xe_mmio_write32(gt, PVC_GUC_TLB_INV_DESC1,
> 					PVC_GUC_TLB_INV_DESC1_INVALIDATE);
>@@ -257,7 +256,6 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> 			xe_mmio_write32(gt, GUC_TLB_INV_CR,
> 					GUC_TLB_INV_CR_INVALIDATE);
> 		}
>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> 	}
>
> 	return 0;
>--=20
>2.43.2
>
