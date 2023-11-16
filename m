Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB4C197A0
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 18:14:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E6310E2AF;
	Thu, 16 Nov 2023 18:14:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91BA310E2AF
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 18:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700158494; x=1731694494;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=G+LfcqZ11gYG7jv4ULHwTznjGV66XXH3uGEo726da5A=;
 b=KlHpHjv7vyx4BgfSpuXTIUe0p3UzaRojQD5iu1MVMGWIbAH/xykzJdDD
 CiEGjuINR4IylceWs0yi9lKGNbMpbs7Rwrmpf/difL/GBGRdEb0aVVoiK
 Qe5pAZSFnx43o+i+ew1/BFpkosxBwHCLajT9GKcHjCCYj/mKAiCyQoTwp
 97EqHg7hPVoxeSgpJP/VWmJ/hd//a74DiF/UommOnM3yM4Af6RMuzS0Rl
 f4gFwNbesXu5sAseeCyVa5VYRLEy+UAOoylVtgtFh2WaXvhtpmgSRnl/h
 nQdvKPZfecc9EUri+ZpOAGvh09piMvRzCufeeKHtaB4JCNrsKQDBDQyK9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422241060"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="422241060"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 10:13:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="888994433"
X-IronPort-AV: E=Sophos;i="6.04,204,1695711600"; d="scan'208";a="888994433"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 10:13:04 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 10:13:03 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 10:13:03 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 10:13:03 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jorAJql5SMOgdBJ16paGgXjQ5C0NM5nErCJj8gFlkdcMQ4wDwRJkPmPjZWPXwxV66e3/oaMYR+SozC4C+WY6R6heyF/cO1qL4jj7c3IA4BWFzZOoqsjTe2mEcwIism2uzPEowcPBRKgGt/1MWCfmUhkQv+1h64+mR3/yfWqHACl16liYQbYrXROKS8cPVzTPZ8uiaJoLe7s/Wv393QS95hCEP+wVkCb672FYBleQiasCqL3HSjIUww1ARTYUQaZC7ufyu7MIkzbmjGxxYobM9Nxz+JWdxIKKlW3etV2lrwbI0XMJj1BV/Y/kHm1fvFRLHtugANzXajjgbgt7pe93aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1C4xU+ebFT0OjNBPflSZK95ggfGkfAP/slq0LLd98os=;
 b=Dx6HDZWT/XNepaoraSl3reffKwfhJfa6TWHwTAx7E6+pIxj09vUzpYRm6zMS6hA4vjMqp0YLMY74KrRD2JSG3pzRYAuZpeCPKuASxVP0rSjbEsjMBgHvPYmyMmqMF/ghM3vKnhg2U3BEg00nyprWLqFgd3Hsx5qqrOIPfL11g0h7ym/ZPbSPcnp8+zLsiZ6BIF8ZwaN9cjw0zsO0amb7pIiUADGeQXuVBola6LRR8G/H6PLAPcNnw97CgBiW2wkj3TeJ4PW1FKUifYEid/leCnSXpEJebpAXaeecYMl8LLksw7Da7l958sMunau9cjVpHzXN639zJZCQyG+CJy/0/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MW6PR11MB8411.namprd11.prod.outlook.com (2603:10b6:303:23c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 18:13:02 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::45c4:a2b8:6411:275e%4]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 18:13:02 +0000
Date: Thu, 16 Nov 2023 12:12:59 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
Message-ID: <tplz3q57fxnlcuf3hley6yrlaiytvokenpqmlio6jislelc2oo@h3bg43xtvtmm>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
 <20231116153901.31941-3-gustavo.sousa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231116153901.31941-3-gustavo.sousa@intel.com>
X-ClientProxiedBy: MW4PR03CA0044.namprd03.prod.outlook.com
 (2603:10b6:303:8e::19) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MW6PR11MB8411:EE_
X-MS-Office365-Filtering-Correlation-Id: 977b940f-ad51-4447-b95c-08dbe6cfabcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vvR1b0HKApwNlCOC3Joz8TUgjlAy8TG8N2lCYDMQuVaJkgqrMh0qRoEm8GcxT3+fDaTAdnfpgfuwwkq4PduTxQqq5+jnLWbqgGUquaMI9bgndO0p6wOYC9t6lxY7QbKC1Crsb7Tk4RyzA1TQA/DT4Ey4U4yoz0qqwS2M1WlzWs2PDCGa6rJTqDfmZFHIQGnaeJ5MDH+aPJjeQJ6O70u7p9O99mB3+OwabWlOC9V6eyAklpGaxmlQOLIpsnnTlrC1/KsJpK6vGzNif5W4nffZoax/bWLIJnSFPHZU4s2E3qjAqAo0tNXwfY4jGwqTJPC5wYzPm9KVTkSkXVOKD5MBZ63enkeJm5CXZPJA1l7lBOzNLWa63dGHH7adXxyZ4RYkyE/VrPRin1cNiV5Sow+G/F2I1Eg1BP4cRQmyWzCZvsEaxzhgfvpNtB33sVcXz7KfHuStDW7XSydiBgLxZd+9PczP62qfMhD6RSqArOOkKvCw5nxFKk6ei3NyudWHg8b6IGWueuxe6OoDJzf541urPed7CMGPpeeBR42R37B+YJNV3kZDQYXBHZWoXZiGqDmG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(39860400002)(396003)(366004)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(316002)(86362001)(5660300002)(6512007)(6486002)(9686003)(6636002)(66946007)(66476007)(66556008)(4326008)(6862004)(8676002)(8936002)(41300700001)(2906002)(38100700002)(33716001)(83380400001)(26005)(107886003)(82960400001)(6666004)(478600001)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytaJ6KOz3TYlzDgBS7fQhSNz4YtkGQBbEiKlHyxAk+qEtAKIXD4jeC4vxMEK?=
 =?us-ascii?Q?9mmZVqGTne778YOl5E3yowrZPWoA8RLSv+tp8fpGKBILoSmN3X5wSXq4DDMC?=
 =?us-ascii?Q?0gE6xDKiGivS7UNE3eyner6IHFiGRpXpptEIv7YfCCPxaeEHR8J1bVg9wVM4?=
 =?us-ascii?Q?DfYSHH+oPlxkMbowJq/NeZS9O9xecaZlbYeGZTl6OngfWjWHJRnYet3hGfYz?=
 =?us-ascii?Q?YVXhVjl5KLzaRoxThKWDRPN4y7LzB22DXLz4hrXOWc3dwXqYy0Uf7cI17RaW?=
 =?us-ascii?Q?xnjrLkMt7W180gsXu/jthPBuDDX7A2UBExNr9uRxGeyRe5RwgyEsnFp7azkQ?=
 =?us-ascii?Q?IiMh3WArEzax9uLZFuERBYTUc6LC66ULtNeCROGdF5Rpu9rPXEE7QSdDYL2g?=
 =?us-ascii?Q?SKOAnt8PTyK9Ui2Z4X0MIGRoG9eohSuePwohcm8DBhDwgQZ16WQjJEa2miJl?=
 =?us-ascii?Q?PfbUaCOfixSlNpMwq9Z+4PAikI2gYZO4tPpAdSRMy+EpsVx+GO79ebsZwcPg?=
 =?us-ascii?Q?xxg3AhQhxe06PYd1AvsyVfxqbVc3G7wjh051uC1PtU0qOTvOMxaDodzoXMR/?=
 =?us-ascii?Q?CmncR+kBb+GB6R2QIMYmumZt4LpcuzqcjUkuPxG67mP64tcvCf9AFwBgOkrN?=
 =?us-ascii?Q?/3PUQouuNHLazcKIYpPO05KwkSEHF1QBGz/zSFu7muLvq8uKNs+zu/g1v+xe?=
 =?us-ascii?Q?5kzjaKXS+ksvSfwiu+XD3n6aWegyS39bab98ABE7ykHjzPbE3e/dAaiqEc/5?=
 =?us-ascii?Q?VGhnWbz3jp+f5/JrkFXYH1sGNQYM+tl9H33euNk3M/H2rNmB0zNPISSHwbWs?=
 =?us-ascii?Q?EiLDEKXQ1rUQv0jTuOmPStptVYtQkLrBHsIWzbU6cFb5d13nkYIRzVjqBlj+?=
 =?us-ascii?Q?/Toro/RqpUn1243kJsW6flTQlJDtHAk16BCm1oIB0QqfNAAvRh6hkjX0FXFB?=
 =?us-ascii?Q?DY3XL3IJYnFRAtIBd6UD8Djn7btYhKkPG8CLFI8Fvq55x4oy5dYuGmFnnmT0?=
 =?us-ascii?Q?ZMxX3XWims23L+3FZmX4udsW19e/nN0cghWNL9ULeIvcSq2NFVCEUkBe6jaZ?=
 =?us-ascii?Q?mIgfcw3mDg1asskjnpwj7AV3Buvir2Wcc5rPn/7NJTbnF4z7+oFTIG2e8BzZ?=
 =?us-ascii?Q?8i+oII0CVSOt4hZ3PlOx6aMcGZcUJxIHWjnAJRcNV0tZ+BNOyPeCkaAALS/1?=
 =?us-ascii?Q?IAVuevCdlSeFD8sC1g6nItIF4wdtPiap175wNSk/VULKX+a1UUNY6KRCbn+b?=
 =?us-ascii?Q?65pvl74xTknrCPKXO7iqRHds7FuDBmMZ5zBlXL4oLdLBYnV9663fgPcY9R8h?=
 =?us-ascii?Q?xp+t2V5/AlL79zUdedpGKm18a4P47JYIx5RJyCcYM8gAtbS9LP393Lsexe/D?=
 =?us-ascii?Q?TN46ZkVACwkMSYue/VrsNqQTOnw+/eEOxB4yjN2xLl0jSwK15M8SlmH7yHqD?=
 =?us-ascii?Q?HLN3Ex57DQdjsYZMIpThNhHHL8O+LG1XFjotQ8Xx/OcxwnizShhBEEPz1aBB?=
 =?us-ascii?Q?yveQl6GW+nmiq/Bt5OcuypvDoHQRFBVmDaFCVlvBYL/0LVVQIMcXRyiL22wa?=
 =?us-ascii?Q?XNDyPoWWQPUco9L8h9UGBsBItHtqpbnIO5DsGg9ndYhhyYJuoTkyqV7PbYRF?=
 =?us-ascii?Q?wg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 977b940f-ad51-4447-b95c-08dbe6cfabcb
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 18:13:01.9946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0VcCWujxTAG3CXe/A0dBhTLKTzitbrYO0iUNmajQ+AWHCMic8Rm/5LKxGBhxyKcC1aJS9/CZF6berrHYccVMfsbpoFmVLJKlEkl/+0Vz3yg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8411
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 1/2] drm/xe/mmio: Move xe_mmio_wait32() to
 xe_mmio.c
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
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Nov 16, 2023 at 12:39:01PM -0300, Gustavo Sousa wrote:
>This function is big enough, let's move it to a shared compilation unit.
>
>While at it, document it.

14.7k may seem a small gain, but IMO there's no benefit to inline this
function.

	$ ./scripts/bloat-o-meter build64/drivers/gpu/drm/xe/xe.ko{.old,}
	add/remove: 2/0 grow/shrink: 0/58 up/down: 554/-15645 (-15091)
	Function                                     old     new   delta
	xe_mmio_wait32                                 -     538    +538
	__pfx_xe_mmio_wait32                           -      16     +16
	_intel_hdcp_enable                          1390    1327     -63
	xe_guc_reset                                1339    1258     -81
	__xe_guc_upload                             2122    1984    -138
	xe_uc_fw_upload                             2815    2662    -153
	intel_mpllb_enable                          1986    1813    -173
	intel_dp_aux_xfer                           3028    2852    -176
	xe_huc_auth                                 1294    1116    -178
	_intel_hdcp_disable                         1850    1672    -178
	intel_ddi_set_idle_link_train                666     482    -184
	icl_pll_power_enable                         724     537    -187
	icl_pll_enable                               724     537    -187
	chv_dpio_cmn_power_well_enable               884     697    -187
	skl_ddi_pll_enable                          1197    1009    -188
	intel_write_sha_text                         423     234    -189
	i8xx_fbc_deactivate                          575     385    -190
	xe2lpd_pica_power_well_enable                517     323    -194
	intel_mpllb_disable                          924     729    -195
	intel_cx0_bus_reset                          556     360    -196
	xe2lpd_pica_power_well_disable               514     317    -197
	intel_cx0_wait_for_ack                       901     702    -199
	mcr_lock                                     414     213    -201
	gt_reset_worker                             1475    1271    -204
	intel_disable_transcoder                    1690    1485    -205
	wait_for_act_sent                            365     159    -206
	vlv_wait_port_ready                          785     576    -209
	gen11_dsi_enable                            1607    1398    -209
	assert_chv_phy_status                       1255    1045    -210
	intel_psr_work                              1105     894    -211
	_intel_hdcp2_disable                        2323    2112    -211
	hsw_wait_for_power_well_enable               764     552    -212
	gen11_dsi_post_disable                      4765    4551    -214
	intel_psr_wait_exit_locked                   596     380    -216
	chv_enable_pll                              2212    1996    -216
	gen9_wait_for_power_well_fuses               382     164    -218
	skl_set_cdclk                               3455    3235    -220
	intel_snps_phy_wait_for_calibration          405     183    -222
	intel_dp_mst_hdcp_stream_encryption          932     700    -232
	intel_vrr_disable                            926     690    -236
	pcode_mailbox_rw                            1376    1138    -238
	vlv_enable_pll                              1784    1543    -241
	intel_dp_mst_hdcp2_stream_encryption        1169     927    -242
	_intel_hdcp2_enable                         7533    7281    -252
	intel_mtl_pll_disable                       2785    2531    -254
	wait_panel_status                           2347    2090    -257
	gmbus_wait_idle                              929     672    -257
	__intel_cx0_read                            1236     965    -271
	xe_force_wake_get                            999     707    -292
	xe_force_wake_put                            981     676    -305
	intel_pmdemand_check_prev_transaction        520     132    -388
	icl_pll_disable                             1340     944    -396
	xe_guc_mmio_send_recv                       4920    4522    -398
	intel_cx0_powerdown_change_sequence.constprop    1281     877    -404
	__intel_cx0_write                           1564    1104    -460
	intel_psr_wait_for_idle_locked              1304     836    -468
	xe_driver_flr_fini                          1431     885    -546
	_bxt_set_cdclk.isra                         4301    3668    -633
	intel_hdcp_auth                            10233    9523    -710
	intel_mtl_pll_enable                        9114    7766   -1348
	Total: Before=2181322, After=2166231, chg -0.69%

What could make sense if we are worried about the extra function call
would be to inline the first part and let the wait logic in a function
in this compilation unit... because if we are going to spin/sleep, then
the extra call is negligible. However looking at the timeouts being
passed, I think we can just leave it here.

Maybe  add the "add/remove" and "Total" lines to the commit message?


>
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_mmio.c | 53 ++++++++++++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_mmio.h | 39 ++------------------------
> 2 files changed, 55 insertions(+), 37 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>index d8f9fabf715e..12df698f6764 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.c
>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>@@ -488,3 +488,56 @@ u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg)
> 	return (u64)udw << 32 | ldw;
> }
>
>+/**
>+ * xe_mmio_wait32() - Wait for a register to match the desired masked value
>+ * @gt: MMIO target GT
>+ * @reg: register to read value from
>+ * @mask: mask to be applied to the value read from the register
>+ * @val: desired value after applying the mask
>+ * @timeout_us: time out after this period of time

@timeout_us: time out after this period of time. Wait logic tries to be
smart, applying a exponential backoff until @timeout_us is reached.

besides the nits above, this looks good.

Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi


>+ * @out_val: if not NULL, points where to store the last unmasked value
>+ * @atomic: needs to be true if calling from an atomic context
>+ *
>+ * This function polls for the desired masked value and returns zero on success
>+ * or -ETIMEDOUT if timed out.
>+ *
>+ * Note that @timeout_us represents the minimum amount of time to wait before
>+ * giving up. The actual time taken by this function can be a little more than
>+ * @timeout_us for different reasons, specially in non-atomic contexts. Thus,
>+ * it is possible that this function succeeds even after @timeout_us has passed.
>+ */
>+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+		   u32 *out_val, bool atomic)
>+{
>+	ktime_t cur = ktime_get_raw();
>+	const ktime_t end = ktime_add_us(cur, timeout_us);
>+	int ret = -ETIMEDOUT;
>+	s64 wait = 10;
>+	u32 read;
>+
>+	for (;;) {
>+		read = xe_mmio_read32(gt, reg);
>+		if ((read & mask) == val) {
>+			ret = 0;
>+			break;
>+		}
>+
>+		cur = ktime_get_raw();
>+		if (!ktime_before(cur, end))
>+			break;
>+
>+		if (ktime_after(ktime_add_us(cur, wait), end))
>+			wait = ktime_us_delta(end, cur);
>+
>+		if (atomic)
>+			udelay(wait);
>+		else
>+			usleep_range(wait, wait << 1);
>+		wait <<= 1;
>+	}
>+
>+	if (out_val)
>+		*out_val = read;
>+
>+	return ret;
>+}
>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>index ae09f777d711..51905aff600c 100644
>--- a/drivers/gpu/drm/xe/xe_mmio.h
>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>@@ -87,43 +87,6 @@ static inline int xe_mmio_write32_and_verify(struct xe_gt *gt,
> 	return (reg_val & mask) != eval ? -EINVAL : 0;
> }
>
>-static inline int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask,
>-				 u32 val, u32 timeout_us, u32 *out_val,
>-				 bool atomic)
>-{
>-	ktime_t cur = ktime_get_raw();
>-	const ktime_t end = ktime_add_us(cur, timeout_us);
>-	int ret = -ETIMEDOUT;
>-	s64 wait = 10;
>-	u32 read;
>-
>-	for (;;) {
>-		read = xe_mmio_read32(gt, reg);
>-		if ((read & mask) == val) {
>-			ret = 0;
>-			break;
>-		}
>-
>-		cur = ktime_get_raw();
>-		if (!ktime_before(cur, end))
>-			break;
>-
>-		if (ktime_after(ktime_add_us(cur, wait), end))
>-			wait = ktime_us_delta(end, cur);
>-
>-		if (atomic)
>-			udelay(wait);
>-		else
>-			usleep_range(wait, wait << 1);
>-		wait <<= 1;
>-	}
>-
>-	if (out_val)
>-		*out_val = read;
>-
>-	return ret;
>-}
>-
> int xe_mmio_ioctl(struct drm_device *dev, void *data,
> 		  struct drm_file *file);
>
>@@ -140,5 +103,7 @@ static inline bool xe_mmio_in_range(const struct xe_gt *gt,
> int xe_mmio_probe_vram(struct xe_device *xe);
> int xe_mmio_tile_vram_size(struct xe_tile *tile, u64 *vram_size, u64 *tile_size, u64 *tile_base);
> u64 xe_mmio_read64_2x32(struct xe_gt *gt, struct xe_reg reg);
>+int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg reg, u32 mask, u32 val, u32 timeout_us,
>+		   u32 *out_val, bool atomic);
>
> #endif
>-- 
>2.42.0
>
