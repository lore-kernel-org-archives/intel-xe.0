Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6407C742A7
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 16:15:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8821610E62E;
	Wed,  8 Mar 2023 16:15:29 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA7D10E62E
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 16:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678292127; x=1709828127;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nmr0dkrH/201wwdTE6DubpeOh/XCUkJMxbXqyuAJtl0=;
 b=J8isceZPgLozTIbuBSCBNcA/tHdmzOjfivY/1dgY32t9oQANUAuQnzG8
 goQKeqQxmqDmHhMKvUKbWF4yS4hdKPU0nxQJIpY4j6W+3+wOb9dcnE2aI
 YN3kOmNdEd+HWbS+6O2glLRo3qsQ9YXxjqi3Im1ofZBuUqhtOfs630CJG
 DJqBAZES2z0U/F89kPKI9gjvGjFhXNU5mQ4/wj3WB+6YhWMpLmY0v8IRA
 nXajlmndXnOYW8JAmnpoy+AMC9SqVHUYNH1uMrue0X0wesTkzZH6C2XD+
 SZ6BNL6W6g6YaTa44bIMPqzoU8lbef6iAplW2HeDjlrmrWcUi79tYY4v4 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="401021966"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="401021966"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 08:15:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745961717"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="745961717"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP; 08 Mar 2023 08:15:26 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 8 Mar 2023 08:15:25 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 8 Mar 2023 08:15:25 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 8 Mar 2023 08:15:25 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPB6Fj8yYT5L8TFoUWn+CJc4GFSXUPYqEY8Kxe5BvlOjm9qGkgcEfDj8stKWrNreUwMxyeXPBtqXq9YvTYq6q0aGGdJ/7PWlAyUTAm4J6GbtblsgoCyJPNva0RiiCeWeDFoGrWEXcC1twB4IDlEJKgODSiXPno7LXLJ5c/l31lpbOJyjIPm9ren8+edxiDEatIBFLlIbBLZozN1HrmUXNStBJORil8S3WcYAFcVY3MOSogVdLtZ4CO9lltaJlZ0uwwNnv2jVKokc9+2DamYo66+CFDgv6oePEWhbDq0Dp68uoACe/J1XliKM1XTywFxoi/mzVgACJ3UVRYkfjnf2eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McF81ubX8jTIQys8vRYlq+ReWQrvLBCaO+yQEV7My+8=;
 b=QsYMcyZf5It8cIgMaJB0iOR9Y1QOCoaL5c/YJG482ytnLNyaRdwVYPH9BNK3tBpbvYUTXzrL/RgQajHIJSfgVpDpFNHwuJHPMaLusDEIQAROwnJw1EmWbcW+1T2dCsBw0VARE8Wv6TdZSu35Iq0cAULkwiJjGtl92+0vZj9tMTNV5x3Zk0jd7DPFqL7cb98N9KoQ77L7bCjoekm85OSv2F2fZ7GyfIa9yw6gpTmMfppIjdX2TQo4maVpgOQHEqoda8g8hEHfLwDtz3DQYpdne/QEoC5vfSfAqTezGpgvBhVnkHwtYNFrq8y73Xd99husSsPGulo3FuGIG6rwp4lDKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS7PR11MB7859.namprd11.prod.outlook.com (2603:10b6:8:da::22) by
 BL1PR11MB5350.namprd11.prod.outlook.com (2603:10b6:208:31c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.17; Wed, 8 Mar
 2023 16:15:22 +0000
Received: from DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0]) by DS7PR11MB7859.namprd11.prod.outlook.com
 ([fe80::1c61:b69d:4ca:10d0%5]) with mapi id 15.20.6178.017; Wed, 8 Mar 2023
 16:15:22 +0000
Date: Wed, 8 Mar 2023 08:15:19 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Message-ID: <20230308161519.GT1543793@mdroper-desk1.amr.corp.intel.com>
References: <20230308005509.2975663-1-matthew.d.roper@intel.com>
 <20230308005509.2975663-2-matthew.d.roper@intel.com>
 <20230308011909.7hl2ob27tbr6q6vb@ldmartin-desk2.lan>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308011909.7hl2ob27tbr6q6vb@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR03CA0045.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::20) To DS7PR11MB7859.namprd11.prod.outlook.com
 (2603:10b6:8:da::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7859:EE_|BL1PR11MB5350:EE_
X-MS-Office365-Filtering-Correlation-Id: 25cc2219-f412-4e7f-b9ad-08db1ff0518b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5jNssTvJXbHeT1JFpZH9xwQVvFi3ks0g5f85dQYwu1UxYFAWyHasMn3PTsY9l+TK+mDq6Y38a3oaTNsf7dFEQgr3PdovKAopzvWktMEN852QLmNlyuQaVZge4AWNEYdsXegN/858RS+uFM6UzNxRv1g1FBtPlLej5bIVDUISzSnpjq7Kniz3auOsFxL0CrLjQbb6XR1zoQZDBxs7rYGvJaXTyQ9tZp1PpwNeCfCq+utLQwB/JmlJUknTWLjfJLeGcKzbRiWhog29EmQqL9HDOEwPK+QGzhfUTDjSe4Ex2+sWcWlMz3Ft9AcmTOYXOUARwTfl9GXjYfS6t9ldb94g/TI+qmojxnDY0/AzDw0gtgNW4lm3YbMOUn7sgGtZv755aU414Eb8t/Ki6KIZ6hOPh+ZMtIs3HnmGn3YcS1egmEcV2lmQ0khyo9btRi9RxfoK23cL233GldPen1qmvxPSknRwNs5TUwZCNFuyf132WF8u1V/BihYUU4TZsmIm0UA8ifRCJ3AAaiEqxUsurqTeFHb09uiuci2ZgRlkAGSN6RwdgDpKkQTA1aa6i3LxxU1YWEA08kLqEm3ENagOtHVN9VCldAeGHhZOw1A7P6+dAg4uOc77CcVb0MSUcORNe8Li4j9hwJDyfxaLFVgYPGpy3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB7859.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(39860400002)(396003)(136003)(346002)(376002)(366004)(451199018)(26005)(1076003)(6506007)(6512007)(6636002)(5660300002)(478600001)(38100700002)(45080400002)(6666004)(86362001)(6862004)(8936002)(2906002)(6486002)(66556008)(66946007)(8676002)(66574015)(4326008)(66476007)(33656002)(186003)(316002)(82960400001)(41300700001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?+Q/QR+uNYe6oyRR4SDTFK20C1KxS+TbxTHYDyTg1+CC1zu/6tXiy9J0qcK?=
 =?iso-8859-1?Q?nEVzE/g7HJHQrEo14tU5BGJ1hytU3IbCSEBdUdZ70UNlpsFxnc4VL9kyEB?=
 =?iso-8859-1?Q?wdvh2NO1xHAW4W8i+EJQoo5qZduKyQ17pcEL7BWEYOqrYs1CJOgKr/YNA7?=
 =?iso-8859-1?Q?q8ukvkcdqMDDevWwQgHHRtjny+S32jRAQZW5eC6oL/v0M4Xm96AWsD6+fx?=
 =?iso-8859-1?Q?88e+YLpXkCyyD5hwpnvOkcPf/JfvBh2XFBptnEbQpjvzT5ZXErHdKKMadT?=
 =?iso-8859-1?Q?eUE+2C7R0niV3I+7sJFoV4wc684Bv/M7RoI0f8h088IbQTNxI8ezJcisRw?=
 =?iso-8859-1?Q?oSEsU8qnReWi1pjDEsORPeeMP2q3Gc4aqSmn62JcSwLUi3PDyQ4EP3MOj2?=
 =?iso-8859-1?Q?d1sElunIbpcrsSzgGAxZxeySx6YMH9OfKUWYuva7bXdIdDXrrn+Q199jFa?=
 =?iso-8859-1?Q?zxvo0m2wyJUsQuUWEE4YoXe1SnLqjknLG6tURDQV4qgMn+S0ZPNbKtKI46?=
 =?iso-8859-1?Q?xFCYy+bKn8O+fG/WQ35CqvJhjmb4eDBnvVEqw7/duK3H80NgczFTHCHiQs?=
 =?iso-8859-1?Q?5zI96EYlPFGSq7CUEMtKZrzQaNj/92FLxPLR0tUJ3l4FE02tUpeIfdbNia?=
 =?iso-8859-1?Q?owQctWMxE3a/kHeteuA8zCh2U+ML6J0q9Cs11L35vExVye3osV7RloQnrG?=
 =?iso-8859-1?Q?dcwrGEI7eBo+pkUNktY8HLGhGu20I+t7/cMzyHR8yyV6q2MU6WX1yrr+kp?=
 =?iso-8859-1?Q?Mapyji3Z5jj6L414DCTrw/AP1ml/P+u3ipNU3o9NKdRmB5g6KIcrcQhdmU?=
 =?iso-8859-1?Q?iynRoS6HteLtlPxPCUb8h+xjWBmjlkpMJVb7+e4M/HhbRLMKpJc5s4gaZs?=
 =?iso-8859-1?Q?ohuTNbZk4kr4Id7LMpcqARqgYFaMGqMoKgy5fNDq2fV637kKFT03cRoEd/?=
 =?iso-8859-1?Q?LnkWlmB1xUPFo3mfA0rqDMvsYPLLdB4cOBsJoA5SIlYvW6w5siie70OxJ0?=
 =?iso-8859-1?Q?ncCPAYkovnVax8I1nDI7Xk7Zz2khszaHlXNiy1vy9/GjbGB5EnUQEnJJtZ?=
 =?iso-8859-1?Q?2p8KgsB/PQAjyfPd5xZYCf9D/ZlVmjqV+zoXbczhnSVrOu+gK2L9zRASXA?=
 =?iso-8859-1?Q?odtBFMhM4r7Rvr9rgfSzz+7ShxJ8Xbri+mp4ZnM95NNS03MiPjY6csPl53?=
 =?iso-8859-1?Q?y4ToRFRMGuZ78l83QImAGcns3oHAqEFwOayM/UVrIPqAMB3sA8IQyTun81?=
 =?iso-8859-1?Q?4LXDoR8E70MCoVkZllzV5ooagC1Zb0hKXsxK+EtkwLiRHnwkHdPT9nd8iN?=
 =?iso-8859-1?Q?MBnlw2XYDdGQ5sJUtglUxG4Xv0z5hU6DGt0YhOnifKGBw6FELJ7B6uK7jG?=
 =?iso-8859-1?Q?kuBgE03oq4TzdOk6LozUArU2aKkgZjHr4a/GhzoVkc0A3hNT9zYiEaM69v?=
 =?iso-8859-1?Q?2yxjghIIHcRG6PWumaoLv8TZPTYF+ZbRXzU8Bz3ym/57ZBySXG5h+pgxC8?=
 =?iso-8859-1?Q?LMxsF7SqJ68nSTe1kdcLR3lFYqmTzlZk/+47jP5EsZTNH1dByCif5sjN9h?=
 =?iso-8859-1?Q?9NdWWyms+4kM1SgG4FSCq3zpmBsiZBjMyJKaQIVNQ3xQ0KM5R+ruX6ddbm?=
 =?iso-8859-1?Q?5/Ln0kyVhLyWKtK8cuP+r4ANJyn6qHauzBF4jSlNg9RAMeQSgSRDwNeA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 25cc2219-f412-4e7f-b9ad-08db1ff0518b
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7859.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 16:15:22.5499 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X5hpJbfsgNtI58tnRKAbVvxcJvOrk7IPlt1hNcSZ67cR8pDa5yHUxX8sMQTUztQEewjKaAjo5uXLWcNEHJyTn8TAEs1r+1mdMzYMJiUDZx8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5350
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Allocate regset space for
 Wa_1607983814 unconditionally
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

On Tue, Mar 07, 2023 at 05:19:09PM -0800, Lucas De Marchi wrote:
> On Tue, Mar 07, 2023 at 04:55:09PM -0800, Matt Roper wrote:
> > As part of commit 6f2c0e92587b ("drm/xe/mocs: LNCF MOCS settings only
> > need to be restored on pre-Xe_HP"), the regset allocation was slimmed
> > down to not unnecessarily include extra LNCFMOCS space in the regset
> > area for the platforms and engines that don't need to save/restore those
> > registers.  Unfortunately this change is causing a driver load
> > regression on Xe_LP platforms:
> 
> s/Xe_LP/some Xe_LP/. I have been loading xe in a TGL without such issue.
> Report was on DG1

It happens on TGL as well, although far less often.  Loading/unloading
in a loop will eventually trigger it for me on TGL, whereas it
reproduced nearly every time on DG1.  I haven't actually tried on RKL or
ADL yet, but given that both DG1 and TGL show the problem, I assume they
probably will as well.


Matt

> 
> 
> > 
> >  ------------[ cut here ]------------
> >  WARNING: CPU: 4 PID: 1677 at drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x35/0x120 [xe]
> >  Modules linked in: xe(+) drm_ttm_helper drm_suballoc_helper gpu_sched
> >  drm_buddy video drm_display_helper drm_kms_helper syscopyarea
> >  sysfillrect sysimgblt ttm fuse x86_pkg_temp_thermal coretemp
> >  kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei
> >  crct10dif_pcl mul crc32_pclmul e1000e ghash_clmulni_intel ptp
> >  i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
> >  CPU: 4 PID: 1677 Comm: modprobe Not tainted 6.1.0-CI_DRM_12746-g6ce36b596fa7+ #474
> >  Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.D00.X212.B00.190824175
> > 
> >  RIP: 0010:xe_hw_fence_irq_finish+0x35/0x120 [xe]
> >  Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 c4 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc
> > f9 37 e1 48 89 ef 88 44 24 07 e8 78 ea 77 e1 48 8b 55
> >  RSP: 0018:ffffc90001967bc8 EFLAGS: 00010206
> >  RAX: ffff88811058f698 RBX: 00000000ffffffc2 RCX: ffff88810c8289a8
> >  RDX: 0000000000000000 RSI: ffffffff822868c2 RDI: ffff888115524a98
> >  RBP: ffff888115524a98 R08: 000000000000011f R09: 00000000ffffffff
> >  R10: 0000000000000000 R11: 000000006243100e R12: ffff888115524af8
> >  R13: ffff888115524b10 R14: ffff888115523c38 R15: ffffffffa04ecfbe
> >  FS:  00007f6ca9483740(0000) GS:ffff88844dc00000(0000) knlGS:0000000000000000
> >  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >  CR2: 0000557fefd93020 CR3: 00000001157ea004 CR4: 00000000003706e0
> >  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> >  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> >  Call Trace:
> >   <TASK>
> >   xe_gt_init+0x343/0x390 [xe]
> >   xe_device_probe+0x233/0x2a0 [xe]
> >   xe_pci_probe+0x351/0x480 [xe]
> > 
> > The reason for this failure hasn't been identified yet (the smaller
> > regset allocation is still more than large enough to hold all of the
> > registers; it isn't an overflow problem) so let's revert the problematic
> > optimization to restore proper behavior while we investigate further.
> > 
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> 
> 
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
> 
> Lucas De Marchi
> 
> > ---
> > drivers/gpu/drm/xe/xe_guc_ads.c | 5 +----
> > 1 file changed, 1 insertion(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> > index fd9911ffeae4..304a9501b447 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -224,10 +224,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> > 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> > 			count++;
> > 
> > -	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
> > -
> > -	if (needs_wa_1607983814(gt_to_xe(gt)))
> > -		count += LNCFCMOCS_REG_COUNT;
> > +	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
> > 
> > 	return count * sizeof(struct guc_mmio_reg);
> > }
> > -- 
> > 2.39.2
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
