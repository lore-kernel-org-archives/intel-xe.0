Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88233C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  2 Nov 2023 13:17:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57CAF10E881;
	Thu,  2 Nov 2023 13:17:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3313710E881
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Nov 2023 13:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698931068; x=1730467068;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=rLwMO5ELIoRAEN4R77bn/nhdm9WKP+RVs61vI8uiDRk=;
 b=MstgdxHyOcPHXd3Bn0oJVi+8muJUm3WE9IaZpFgp2iDVsN7o7Mg6lbdo
 uImljWk72HRPPfHBwr9Mp7B8PqbJh4XZkbgHOI5A5mJrdTWPmeLyBjAWj
 cxQC7qFqolO0LvKFPSOdRDKc5NErJ7zThpYJK6+pWNRTJUWAfg6Hwcyzs
 gDz3jrdwxxG6Qjr+tjgk0xciWcScr4sjOUZQFHvIzYlQ+27YoRpXLfdGx
 Ukr8xD/D1s6gvc3JUlUa7ltNTucK5wj23IYMgWl3u8UHt7DSZeRlCUIlQ
 bK52vYOlVZacMVzetQv0u3qD5MCF8f2pwbRFFuz9PlSr7lLgeJhuvFxt1 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="10239843"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="10239843"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 06:17:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="761291698"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="761291698"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 02 Nov 2023 06:17:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 2 Nov 2023 06:17:44 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 2 Nov 2023 06:17:44 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 2 Nov 2023 06:17:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BPHH/2j08408qzOXwhYb1PM4/vpq4L8bTVBSQAMipA5akCpWvVE68T/uSBo45Y0ir2p/7pvnqy4SbCRrvwzZLKuNavbIGTAxOtFmrZMXeWdTJfwDcL7FoGJRpfKsVBahWZ+JVw7qIaIkqczGyLbBqrUIr/8L+Oy1UzhYO98e4KQCzoQq19EFlOqdKmnx1KZb6hjhrOYcbUC8xJiEHiLOqckMch1rOEmE9G7D+wO4HDGugyyHzG/fn3WuNarnoRZv1UlJk4g0kx/NYYb6tNU9yzNxeApNKOkuU19WpsxP85+zHk833Qa20DRtlxw5HNSbu8oHDA546sRwmr5u66386w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajLijn28byNLsyqp1eBONpn5W0z7jgndDvPaN2ngUZA=;
 b=XqeOLYHiIjHkwqkLU4tPZY77953X6YcK7qvmgtM4FQYvEzhTvxtQYFeZJ4/wCN0Gz0VAPgQOKnQ3qTeLmAMjzFbeCXM3yIZWsGYeKH0foE72AlSXqgf5XILmLwgz6dN9JyhzutABRTXhrvLXTp8/FIJ+kCDRLpnttvge43yOXlSEv8jz00+P5Ry4bZzeUSbXEFqfS6PrzPR9uAkEXKfzdno6bM8e6+ZLqGQppdFAdkz4VDsTVAULZok9CHccq1gNiqqmjpUSNHH1xdBbUnZ5+4lmpE37LS4HPY9bi40msFeCvtwKKTv1tkiuKWrnLUb96Jjvu1REW/2vtsabPNG+jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CY5PR11MB6344.namprd11.prod.outlook.com (2603:10b6:930:3b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 13:17:36 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::d89f:e7e6:dbb3:3ddf%6]) with mapi id 15.20.6954.019; Thu, 2 Nov 2023
 13:17:35 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20231102124855.1940491-1-lucas.demarchi@intel.com>
References: <20231102124855.1940491-1-lucas.demarchi@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Nov 2023 10:17:30 -0300
Message-ID: <169893105022.1757.16240778729594724519@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0232.namprd03.prod.outlook.com
 (2603:10b6:303:b9::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CY5PR11MB6344:EE_
X-MS-Office365-Filtering-Correlation-Id: 712e1343-4a22-4051-b978-08dbdba613e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bF77dmiQA2HU2DCBjl82XuNQ8VbNpBmkgZj0RkLtjNUKaHwj935NYOWBQ094MLXCdjcBOh2nYDzAKnxWqXchCkRyrEqfIfwsZOzP3zK93KmbefucTe5wsuEVOGWvuwkNMmjwKATbukU2Ke/GBn4WPcx8kql3tty4Z/+7l/FlZ5nmyIF+9qN9yeCECdN4UqKSD1kEfLhVBPpfYM40VAPb62TeGFZBF66tll6gntlZhWosx782Nb8Igt0JC7dQfnWEMHnOb3ZAgXngHEGRdMcdjkWxolF+CiCp46/Ege/Eo7fk0gEM52Oz83fuwCdydGEDLmryMMOSWuSvN/8Y6OyqArGTxh/FaNQfehQq4MPgzjYwhIKhZ4pWKCTcZ/x+JrWFxn7Pa0UYtbmYtCXBwzksndIX5i+faRj8Tviy4ufjKO8yY6d3RaC8eerGLfExiujWohQhh6TVrNC49ydsJlcwGFkmGwu2TNPEuDaXVrfAHXiTm5f6yAg2uGrgGwmj3YwzbnYK2WM0qLDoJnFWsRowBhviZuO+dnt07ck5TuUO/L1vwA1Tp2PsxBDus5MZMWta
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(6512007)(9686003)(82960400001)(107886003)(26005)(33716001)(6486002)(44832011)(5660300002)(4326008)(8676002)(8936002)(2906002)(86362001)(41300700001)(66946007)(54906003)(66476007)(66556008)(316002)(6666004)(6506007)(478600001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cityNXpZYnJ1Y1gra2Z4dkZBQm9LZEkxeXl1UThlZ0RJNVRwU2RnVHpmRGx0?=
 =?utf-8?B?MmNjRGdMbjBjQ0RTM2oyUmpnTmsyUlp4anVtWDlaV2t2bmhQUTBZc0RsckxH?=
 =?utf-8?B?djVncklxbmxnMXRPR0VlZGxaR3U1YWxlRWhMOU1XVmRiT2JPZm9BOU9iR1g0?=
 =?utf-8?B?eVAySk1rbkl6MW1ua212QUUyRlhJS044OGI1Ujg1MEVxaExUQlFFWk5ReHFN?=
 =?utf-8?B?ckZ5YUpFYTIwR3pWTlpuWFgrTExSSUkvQjFoT3QxVjNMRElCTEZHaGhXYWVs?=
 =?utf-8?B?aDN4eHoydGJZVEpGQVF1V0JlZDcvYk42b1lBNlNZcmFrclRLT0tXM2wwdk9S?=
 =?utf-8?B?TGhCRkdCVUppRzZ3T3BRZzR0eWZyNnN6KzhpazZCL3h0OTROWDVWelhjNnN5?=
 =?utf-8?B?aTRLbkM4UGRzYU5Oay9xb3F3QkVmTUZFUllvZFNFZDQyYWxoUnR2b0RjVmdt?=
 =?utf-8?B?TGhRQUkyRkxVT1ZHMXVjTllDeDlvVmZLMXp2eUhjOHA4ZlBJK2lUYjdpaDVu?=
 =?utf-8?B?SWpZVFdqUllkS2RyQjlkYUU0ZzFqOFVIa2lVYVl4T0lMdmo4UnhjMkpzWDBm?=
 =?utf-8?B?b1hkQTBHcUozSlA1UExCNkYvSVJ5QU16QklqUDhOeFV3cDExTDdWdHZWMXpw?=
 =?utf-8?B?VmZCeUx0VlhaeVhlYW5sYWQycEoreTNZdDJHWjNBaldvSEhDYkpSaFpnVzdj?=
 =?utf-8?B?T2J4ZmRsRXdndlBmMlNsUHBVSXZ2aDFKWjhDY2N2QVhvL1k1amgrWnl6b0sv?=
 =?utf-8?B?a3NvdFhFMWdaQ2VWWHBENEEwOFo1M0JZUFdiZmxJS0FUaDhWUkI2dGVidzZ6?=
 =?utf-8?B?OGYxeFE1ZlAvRExGcXJUUWhHSHUyU3R6bllBYzl3NERGVDJmMGdiVUVycFZW?=
 =?utf-8?B?QWpSMG5lWEZXYnVVdjZaTTRGVDRjOTh3SHVuMzE2bUJKc2ZJMjdzbUp2Slh2?=
 =?utf-8?B?NlBCY1FaU0hEK3pyUW1hVGVSUE1aSXhLdUR2U08reGhsUGgwc1ViQjJYZFI5?=
 =?utf-8?B?bnhSRmlnZWxpaW5QZkZmVHRFQXhldUJDTW9WMFEyNjZiWlY4dHlFUFBmb1Vr?=
 =?utf-8?B?VmM2bHNxTU1ZZEVLQlVQS05FakVMZHZoNlEwZ1RPdGpRdnh4Yzg4dzJpYmIy?=
 =?utf-8?B?SHMzYTZZaGFrdjFaV2RkRDAxOUU4N2owNGQ2dUJRbmdVMWdLNEVMdlVLeTlZ?=
 =?utf-8?B?MWplS2RRNTdsaTBpSnJiY1hGdTNicEduWm9KU3dVcHFGeFg1WXZoeHhpR1Nw?=
 =?utf-8?B?UXQ2Qk5JYmxzK1ZvR2lvdjYvZS96NXJ2U3oyUzBXZHFYVnpLNmpHR1NpOTlJ?=
 =?utf-8?B?K3pTM2kreWllQWg0SzNSV1ZyRys5aXZ2dHN0VXh2Y0pTbUtLR3d5QzJxZmFY?=
 =?utf-8?B?MUkzVGoxNlNadHJPQUtIcFcwdDMrSW5BU1hQYVdVMFFZVGZsTjJDaUtheEVC?=
 =?utf-8?B?UzU1TExSYk5TeWd0M0E4RFlrU0lmS1M4KzBpdkJLbU9tZ1VxcnNrQWRQbDUz?=
 =?utf-8?B?Z1d2cTlNeC8vUnA5RDFLRXIxQ05Ob1RDczZITHRoL1VudUw0Wi9SL2U4aUx4?=
 =?utf-8?B?UDcwdjdIRTFTQmpEM29Cak1wUE9mSFA2NXRGbmNlc3U0MngyMkNvSmIzUEZM?=
 =?utf-8?B?M0o5dFZodDJkc1ZWNXBxVzZnK2FkM0xnT3ZZc3N3WGNnOFhGVjBuVDZlYWx2?=
 =?utf-8?B?TjBlcVd5M1R2bFI5MVlOSTU2YWEvMmlON2VSVitGbEhiV3MwaW9rcEpWRUh6?=
 =?utf-8?B?S1lwdUVVcW1EUVZOdFptZy9PTjBGelNVdnNFQjR3d2NRUnlPS2lkOXd5eWpw?=
 =?utf-8?B?UGxQYTBOL0lydHZlTFhNbUZiaWVtK3FxQU4zSWFsa2c0Mk1PdHV1TFFKYjF6?=
 =?utf-8?B?MWdlV3k5emF4eFZPeEczQTlXeENsbnlJVS9hZDBqTklxRmJqbzJBM2JXWGpj?=
 =?utf-8?B?THNDdUJpN2FtVXlCbG9HTEhKeTFYanJoR0cvRVlZTzgrWk10YXdHRlZPVVRy?=
 =?utf-8?B?VmNmZzBJRjJlUFViMUFKTDFyOFgwNHVwTVFzK2NQS1NvQmtvdGVDWTlDM3Zr?=
 =?utf-8?B?YTJuWDhqd05kQXJSWi83TWdkeE8wbG9LcW0yYm5kYy9QR3RzdStoYXdHV3Rh?=
 =?utf-8?B?MWtiZXZOQlNMZWR5NFVVaGh5eWRUNG5XSUNQQnM3bDRGMUFneUsyaTR5OHJ6?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 712e1343-4a22-4051-b978-08dbdba613e3
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 13:17:35.2106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JO4feD4ukXFNTish5WWcN4duGAzjjfTgaRKCQXQ1sBff4Vqrg1VdV99H6o6aBQNklXvRcbNkhOhlE0UjpSu9ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6344
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2] drm/xe: Add Wa_14019821291
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Lucas De Marchi (2023-11-02 09:48:55-03:00)
>From: Matt Roper <matthew.d.roper@intel.com>
>
>This workaround is primarily implemented by the BIOS.  However if the
>BIOS applies the workaround it will reserve a small piece of our DSM
>(which should be at the top, right below the WOPCM); we just need to
>keep that region reserved so that nothing else attempts to re-use it.
>
>v2 (Gustavo):
>  - Check for NULL media_gt
>  - Mask bits [5:0] to avoid potential issues in future platforms
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/Makefile            |  2 +-
> drivers/gpu/drm/xe/regs/xe_gt_regs.h   |  2 ++
> drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 25 +++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_wa_oob.rules     |  1 +
> 4 files changed, 29 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index 776c31e73f29..a1a8847e2ba3 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -37,7 +37,7 @@ quiet_cmd_wa_oob =3D GEN     $(notdir $(generated_oob))
> $(generated_oob) &: $(obj)/xe_gen_wa_oob $(srctree)/$(src)/xe_wa_oob.rule=
s
>         $(call cmd,wa_oob)
>=20
>-$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $=
(obj)/xe_wa.o: $(generated_oob)
>+$(obj)/xe_guc.o $(obj)/xe_migrate.o $(obj)/xe_ring_ops.o $(obj)/xe_vm.o $=
(obj)/xe_wa.o $(obj)/xe_ttm_stolen_mgr.o: $(generated_oob)
>=20
> # Please keep these build lists sorted!
>=20
>diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/reg=
s/xe_gt_regs.h
>index 7a6407e38265..902c60543de0 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>@@ -158,6 +158,8 @@
> #define XEHP_SQCM                                XE_REG_MCR(0x8724)
> #define   EN_32B_ACCESS                                REG_BIT(30)
>=20
>+#define GSCPSMI_BASE                                XE_REG(0x880c)
>+
> #define        MIRROR_FUSE3                                XE_REG(0x9118)
> #define   XE2_NODE_ENABLE_MASK                        REG_GENMASK(31, 16)
> #define   L3BANK_PAIR_COUNT                        4
>diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/x=
e_ttm_stolen_mgr.c
>index 79fbd74a3944..0c533d36791d 100644
>--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>@@ -11,6 +11,8 @@
> #include <drm/ttm/ttm_placement.h>
> #include <drm/ttm/ttm_range_manager.h>
>=20
>+#include "generated/xe_wa_oob.h"
>+#include "regs/xe_gt_regs.h"
> #include "regs/xe_regs.h"
> #include "xe_bo.h"
> #include "xe_device.h"
>@@ -19,6 +21,7 @@
> #include "xe_res_cursor.h"
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_ttm_vram_mgr.h"
>+#include "xe_wa.h"
>=20
> struct xe_ttm_stolen_mgr {
>         struct xe_ttm_vram_mgr base;
>@@ -112,6 +115,7 @@ static u32 get_wopcm_size(struct xe_device *xe)
> static u32 detect_bar2_integrated(struct xe_device *xe, struct xe_ttm_sto=
len_mgr *mgr)
> {
>         struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
>+        struct xe_gt *media_gt =3D xe_device_get_root_tile(xe)->media_gt;
>         u32 stolen_size, wopcm_size;
>         u32 ggc, gms;
>=20
>@@ -154,6 +158,27 @@ static u32 detect_bar2_integrated(struct xe_device *x=
e, struct xe_ttm_stolen_mgr
>=20
>         stolen_size -=3D wopcm_size;
>=20
>+        if (media_gt && XE_WA(media_gt, 14019821291)) {
>+                u64 gscpsmi_base =3D xe_mmio_read64_2x32(media_gt, GSCPSM=
I_BASE)
>+                        & ~GENMASK_ULL(5, 0);
>+
>+                /*
>+                 * This workaround is primarily implemented by the BIOS. =
 We
>+                 * just need to figure out whether the BIOS has applied t=
he
>+                 * workaround (meaning the programmed address falls withi=
n
>+                 * the DSM) and, if so, reserve that part of the DSM to
>+                 * prevent accidental reuse.  The DSM location should be =
just
>+                 * below the WOPCM.
>+                 */
>+                if (gscpsmi_base >=3D mgr->io_base &&
>+                    gscpsmi_base < mgr->io_base + stolen_size) {
>+                        xe_gt_dbg(media_gt,
>+                                  "Reserving %llu bytes of DSM for Wa_140=
19821291\n",
>+                                  mgr->io_base + stolen_size - gscpsmi_ba=
se);
>+                        stolen_size =3D gscpsmi_base - mgr->io_base;
>+                }
>+        }
>+
>         if (drm_WARN_ON(&xe->drm, stolen_size + SZ_8M > pci_resource_len(=
pdev, 2)))
>                 return 0;
>=20
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index f3ff774dc4aa..752842d734be 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -19,3 +19,4 @@
>                 SUBPLATFORM(DG2, G12)
> 16017236439        PLATFORM(PVC)
> 22010954014        PLATFORM(DG2)
>+14019821291        MEDIA_VERSION_RANGE(1300, 2000)
>--=20
>2.40.1
>
