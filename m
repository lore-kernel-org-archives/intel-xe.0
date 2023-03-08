Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA3F5C6FA99
	for <intel-xe@archiver.kernel.org>; Wed,  8 Mar 2023 01:19:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9609D10E14C;
	Wed,  8 Mar 2023 01:19:18 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03C8810E14C
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Mar 2023 01:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678238356; x=1709774356;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QkWnjdUz0g6eXWhHaiOVEQeNnQ/i5efECxqpFH8wznE=;
 b=EmsKsl+lxaPiGvbxsfzdA1hGwz2jfxl/sq+Yn7f2UDW8A5ksjKIBO1KX
 awSv6Cz80GoB1q9UDaAkdzrmYZRHCzZx5QH+9nHXizrV+UUN0kG1sAzOz
 m5Md6+hvNq4jsKpb3c4NWaHZHU0xxcrdWf2P0O+JN3/b/IzOezojFY0nZ
 RD0hnBLqANqR3NJKx+12ibUrSDCaYQVycA9skMD6Z9uJDPGglJneaPLmk
 tWDHrLRv6ZYSh1CGshMTlRVF24UOWsXMNonRzzEm1yrYluesY47mApOfO
 +Tsc1e3kNEuGzVhuHKYMRbJL1Y8na1mTF4RD/HEms1t0ydYNqMXLdf32u A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337540387"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="337540387"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 17:19:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="745721183"
X-IronPort-AV: E=Sophos;i="5.98,242,1673942400"; d="scan'208";a="745721183"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP; 07 Mar 2023 17:19:14 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 17:19:14 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 7 Mar 2023 17:19:14 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 7 Mar 2023 17:19:14 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 7 Mar 2023 17:19:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M825l9NlFzbmB4KcyaESF3FT3l75faGmy3Ux/VM3o5abGYPUq6lMGQIWF7osWCIzw2IwQ3RUN7f82EIrfaFRMeAbxlPS/hOJNxL6DSylPI1WjOHC4mDKbD/qnVte1AnWc2uvBg6L2Obj2re7o7ggKyQpPTfhRQnRIli50FqjxJqdhoEill+150SnkjIeF+LWVI/00HtSzRw0BdbriGX0H+4J20FnTzInLQwdag7F2laDu6U6cG/WZAczjCK+IACxJPe8/KrLSX+0YpduRpuFgYXDgpoybZcvIRGcfSN8XrHJhzbiHK32prnRjQmdbw5tho8Zgd1gkarEtXm7C1gCvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E/MIwLj0tOIxpeRnF0T32BbN98gKRkFO0Ld/bDTBdSw=;
 b=RetPTZNl9ZTi++j+qWquTuarTvGEuVGD44CFxnjjX0hEeimmFCFR7fC7nEpieGcUabjscWau1rJW22kC/IrPU/JQNW0xE6gv/Ih6NwOVnP+cRrZu5vlCadaMAsUsVZZjklu6kSQe+kEsTxx1VftOB2h3wdayo30nJVtQIUMc80sstbF06E3vwmfF42amlg8KW66gG8P4/HQz8H5K/pas6f5o8Uw9l8CKctsYvqTd+HmTn1p33DzCnNva+R4eNfRyiSvP+EirHMkvN6InhaVS6lDz71SyX6UQgZpTRDsmBaL1vWNu+nIzsnocyYSCbXq6R54ypew4pFd432iBnfUdHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB8180.namprd11.prod.outlook.com (2603:10b6:8:18d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.23; Wed, 8 Mar
 2023 01:19:12 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7bcc:b9b8:78df:1bd8%9]) with mapi id 15.20.6156.029; Wed, 8 Mar 2023
 01:19:12 +0000
Date: Tue, 7 Mar 2023 17:19:09 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <20230308011909.7hl2ob27tbr6q6vb@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230308005509.2975663-1-matthew.d.roper@intel.com>
 <20230308005509.2975663-2-matthew.d.roper@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230308005509.2975663-2-matthew.d.roper@intel.com>
X-ClientProxiedBy: BYAPR08CA0046.namprd08.prod.outlook.com
 (2603:10b6:a03:117::23) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 866e974a-a80b-4748-201e-08db1f731fc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cJ7gZkmTkY8lJGL6gcHumcHXAriQq89LWN5EE3GjTlMd0bri4tLn0qQe9EAgbeaitXnIn5Q0agU9iM2LYnHmcNcoTZu6z1nV802aJIFbCCXMuMksjhM9ZWScI7XkS4pl3Hd20rjZD+rak1VkQZcNG/OVZcQCVEILjeBQ/hLBL8rAqIwKWEq49vqRuPCGuj69eaST2HnLXUWhfn8CgxjBJjsaX0Y6klzjmynOThDU9dXp/fy1ERporsHD61nmRWYpGH5BtGjAWpiX7s0XXCUguaAa2z66KUURaW8iezid6cqDC1l8Ppiy1/lD9czmVCqaz3JuWL9s/n383eC2xahxMcepK0WZJk0qWIPf319vGWIiRv1VuVHot7ko9zvF+yUENTISDuLa9wdNu2fjcAVVSLnt0w3p4NlTY4ScgO9k8Ml9+1viEsFmuSg012seJuFGYuJDi3oAHgZqrySMk5NAQPiq83Y/R4zxr82nkNep7qWb0Zj5mSGWRC02nVZOqxkKpaSF94yjMIDE6+NFRv7ALz3yYv7KJ9NUXOxmVkeeWlg7Q5pdGVLmzt7kRiWT4LIyu20z8ZIiTHkup9BQcZCG8R7hsKm+3WbXoexmzc3KAueLRY3BwIAn1a9Sjy7gVn5idybyJORtPPOWSoDu8SbWKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199018)(66574015)(83380400001)(6636002)(316002)(36756003)(82960400001)(38100700002)(66946007)(6512007)(4326008)(2906002)(8676002)(6666004)(186003)(66476007)(6506007)(9686003)(26005)(478600001)(6486002)(41300700001)(1076003)(45080400002)(66556008)(86362001)(8936002)(6862004)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NnFu2lykV+mrYbl1ykEEwYHxNOniRRoJaMpaM+Iwp5zOVFCRDhXMKUXbOi?=
 =?iso-8859-1?Q?3/u1UttnP1gtzfh8Wst21k5tDMBILXMiyJ+MtJ3RlyuBwADD4tRoiCxCDv?=
 =?iso-8859-1?Q?vW8UiQ9Eo8sCjJCPbKtlg4y8wMeQJyT/2tNycMUQQgk38OZyPRWR0Urggt?=
 =?iso-8859-1?Q?rnUWtae19C1i+TF3LdZvfXShCXK2hieMLsSJw7snnq8K77tR4TZX11DeWH?=
 =?iso-8859-1?Q?5ZYtH0ryQ0NvBkCfhs9WsEs2se1rnyjSbfFU4cCIk1RMwXzH9D6a9N2sVY?=
 =?iso-8859-1?Q?zD2qO4wXEma86JATC5vfWUphclaCm7DPA16bK+sUxixfobXp0H9W8vBVDI?=
 =?iso-8859-1?Q?tgPAJzB/xhDoNdiXl5miCNQTSHjT6d0/mJOqV8eH0fXRyKchRU8bUrTtTN?=
 =?iso-8859-1?Q?LF/zk32Kk7kVO57TTsGeJYHPP1xrdOS2s8rmoL4VHVfBl1lAQr36X7N6Ey?=
 =?iso-8859-1?Q?8xnnG5X6Gls7kzBiR8qYf+fpmAzq8PenUtLXAzdN9z4C9uZ+bW2CpPIViu?=
 =?iso-8859-1?Q?IdG1yG6yzjTi4Pk9C6SNou+J7sPTYw5e4Dx4ApqQ2dTBV6vKopswNbCpiN?=
 =?iso-8859-1?Q?goi9wn1DJm1QNKSQ1L72FZoe7lMXkwpefBeQs4VXDzMkuuKgo7C1n6f0NI?=
 =?iso-8859-1?Q?amIAMALzailmn48pua4LSOXFJPQ9yShE3scQNcooukzjsQT0TjM2ELud2F?=
 =?iso-8859-1?Q?gv8IXFY29fS8AFmb46mSDaQ4hW06jIZkR7nQjEMohygEYHJ+o400Rs6oDm?=
 =?iso-8859-1?Q?cnWU2bIlI3OB6crPAdEbm6WPlAUMaKW9lHhO1JpbfpkJ87bzjG/EwppAe1?=
 =?iso-8859-1?Q?Rg2bVtmIazAHZwpKYDSbeWiKSEKJVmNPAaJLKTRv7uFQ/5WHIAEDMXkFMn?=
 =?iso-8859-1?Q?slcHXbbhmem0JUG4OessSlKnWW3kNQLoClyllEgWSmGcIMB+HELlEq4HqD?=
 =?iso-8859-1?Q?U2fRKCisFxdt8I0l/7O0FgvTz7Lt35V1sVOpgOMAI6yMk1roYPihcIC8ON?=
 =?iso-8859-1?Q?l4nQRYt1fjRdfsJt3UNfdUt/y8pQXFIeWSGwxzplk8RfhWcLg3lYekyWuL?=
 =?iso-8859-1?Q?boQ+q1Kj4KjPp8K9jrbwBRFsJSWk1Gg+roZv99eCVPJaUZk6PUCGgX/8/S?=
 =?iso-8859-1?Q?u6buUYXdFEPVsSrDzNcdm40QjXSn+hCjxz2zfKDJAQWzo6rvzo6Qb2lt5A?=
 =?iso-8859-1?Q?k1JYU1+kFfD8p3Jl9qWfAfop+V9vwslDXnLDoVR4Nj2SoTSWF8HsNM05dd?=
 =?iso-8859-1?Q?vBwqpAG311mT+tTUbrLOwnhesbj+9zMWtbnAmcM3oERYFXCCAcsKFzoHyD?=
 =?iso-8859-1?Q?v5g7z/sX6tjkDJMoR3aTpCoT+/KUaphJFosryKqYL/nJXfWJN0vLikm4vR?=
 =?iso-8859-1?Q?wUpDanIimAfi52K9jo3LWlaTHVAxgK3Sf49Hk+DOncjMNoUnmTxYTF7exo?=
 =?iso-8859-1?Q?pGbdwEHqOAiq55vzqkpAtLJSiCYkWTyQHtLl+517V4TcrSKIZaaXYexM2x?=
 =?iso-8859-1?Q?jwJBzgSg2XzRgbajB/ZM7CW7E7BzSWn3YA34z+cKkYnjSAYBhD7wcTgA6m?=
 =?iso-8859-1?Q?XNKCO3qtSGfCeNRMrV04+Zvl73HwdO5Lq+vYqIJbww/H2oMApei2dNLtB5?=
 =?iso-8859-1?Q?B6Nds0USw9s2CtnBPrqhT70TygmL/dhv3SZj4tg2ryWgOmF9vCkzWu9A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 866e974a-a80b-4748-201e-08db1f731fc0
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2023 01:19:11.9160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yq+Y1M1gqdT3gVcZGT0AXBC6vdUHbn7iCgklFBF8NkwJ6ohQgySLVTMuJPyBhksOMto6IcbZ39MyHj3xiLf7RyF/JQ5XIpsLO301LZhYLP4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8180
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

On Tue, Mar 07, 2023 at 04:55:09PM -0800, Matt Roper wrote:
>As part of commit 6f2c0e92587b ("drm/xe/mocs: LNCF MOCS settings only
>need to be restored on pre-Xe_HP"), the regset allocation was slimmed
>down to not unnecessarily include extra LNCFMOCS space in the regset
>area for the platforms and engines that don't need to save/restore those
>registers.  Unfortunately this change is causing a driver load
>regression on Xe_LP platforms:

s/Xe_LP/some Xe_LP/. I have been loading xe in a TGL without such issue.
Report was on DG1


>
>  ------------[ cut here ]------------
>  WARNING: CPU: 4 PID: 1677 at drivers/gpu/drm/xe/xe_hw_fence.c:91 xe_hw_fence_irq_finish+0x35/0x120 [xe]
>  Modules linked in: xe(+) drm_ttm_helper drm_suballoc_helper gpu_sched
>  drm_buddy video drm_display_helper drm_kms_helper syscopyarea
>  sysfillrect sysimgblt ttm fuse x86_pkg_temp_thermal coretemp
>  kvm_intel mei_pxp mei_hdcp kvm irqbypass wmi_bmof mei_me mei
>  crct10dif_pcl mul crc32_pclmul e1000e ghash_clmulni_intel ptp
>  i2c_i801 i2c_smbus pps_core intel_lpss_pci wmi [last unloaded: ttm]
>  CPU: 4 PID: 1677 Comm: modprobe Not tainted 6.1.0-CI_DRM_12746-g6ce36b596fa7+ #474
>  Hardware name: Intel Corporation CoffeeLake Client Platform/CoffeeLake S UDIMM RVP, BIOS CNLSFWR1.D00.X212.B00.190824175
>
>  RIP: 0010:xe_hw_fence_irq_finish+0x35/0x120 [xe]
>  Code: 54 4c 8d 67 60 55 53 48 83 ec 10 48 8b 47 60 49 39 c4 75 13 48 83 c4 10 5b 5d 41 5c 41 5d 41 5e 41 5f c3 cc cc cc
> f9 37 e1 48 89 ef 88 44 24 07 e8 78 ea 77 e1 48 8b 55
>  RSP: 0018:ffffc90001967bc8 EFLAGS: 00010206
>  RAX: ffff88811058f698 RBX: 00000000ffffffc2 RCX: ffff88810c8289a8
>  RDX: 0000000000000000 RSI: ffffffff822868c2 RDI: ffff888115524a98
>  RBP: ffff888115524a98 R08: 000000000000011f R09: 00000000ffffffff
>  R10: 0000000000000000 R11: 000000006243100e R12: ffff888115524af8
>  R13: ffff888115524b10 R14: ffff888115523c38 R15: ffffffffa04ecfbe
>  FS:  00007f6ca9483740(0000) GS:ffff88844dc00000(0000) knlGS:0000000000000000
>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>  CR2: 0000557fefd93020 CR3: 00000001157ea004 CR4: 00000000003706e0
>  DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>  DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>  Call Trace:
>   <TASK>
>   xe_gt_init+0x343/0x390 [xe]
>   xe_device_probe+0x233/0x2a0 [xe]
>   xe_pci_probe+0x351/0x480 [xe]
>
>The reason for this failure hasn't been identified yet (the smaller
>regset allocation is still more than large enough to hold all of the
>registers; it isn't an overflow problem) so let's revert the problematic
>optimization to restore proper behavior while we investigate further.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Reported-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc_ads.c | 5 +----
> 1 file changed, 1 insertion(+), 4 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>index fd9911ffeae4..304a9501b447 100644
>--- a/drivers/gpu/drm/xe/xe_guc_ads.c
>+++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>@@ -224,10 +224,7 @@ static size_t calculate_regset_size(struct xe_gt *gt)
> 		xa_for_each(&hwe->reg_sr.xa, sr_idx, sr_entry)
> 			count++;
>
>-	count += ADS_REGSET_EXTRA_MAX * XE_NUM_HW_ENGINES;
>-
>-	if (needs_wa_1607983814(gt_to_xe(gt)))
>-		count += LNCFCMOCS_REG_COUNT;
>+	count += (ADS_REGSET_EXTRA_MAX + LNCFCMOCS_REG_COUNT) * XE_NUM_HW_ENGINES;
>
> 	return count * sizeof(struct guc_mmio_reg);
> }
>-- 
>2.39.2
>
