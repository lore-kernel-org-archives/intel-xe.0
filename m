Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B134FEE4993
	for <intel-xe@archiver.kernel.org>; Tue, 22 Aug 2023 15:45:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6185B10E3A1;
	Tue, 22 Aug 2023 15:45:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4540F10E3A1
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Aug 2023 15:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1692719103; x=1724255103;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=UZlowxwRunU0YIrC6aiL3qINZ3A6OHUgL7vfjPrRdr0=;
 b=V2j/+62OgPfSVeA0Qc3fuQACoqgcDrGr21Y77VQSoOTdLHN57lv158c6
 vte66aG1flDh92YDHuB4vg1PV0bQHKtdqqAijnktc0ENsdwb0j6JrQHzd
 g+H3NPq83y8AR1f0wKBt+GFV5ONId2QaS5jC86zgUaBC6YBlWfiRdZZry
 li7A/uaQccuyYyb2Jni2qHkTD/d0NRK9/a3A5ruTDRtsTwbnQtv8KByl7
 +U03Zwj3FID6Vvbx7FU8DZvCyvaaCsIRAH32lJ7KxThFYAwzWZl/Wk/Mk
 GL3HovA3HnbZXiUun9fNV90mWHYK/YSdodbpY8M2Gf5lzsRPcznRtnLOx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="437846074"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="437846074"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Aug 2023 08:45:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10809"; a="850670979"
X-IronPort-AV: E=Sophos;i="6.01,193,1684825200"; d="scan'208";a="850670979"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga002.fm.intel.com with ESMTP; 22 Aug 2023 08:45:01 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 22 Aug 2023 08:45:01 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 22 Aug 2023 08:45:01 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 22 Aug 2023 08:45:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYzrL9pGf5qvlpZlv45qs9u6ESQgYS159pznTnxwjLJRVzPfUaVPm11PTyaE6OpvfU+8YmnlpDy0iz8AHRipwNzW1isux6hAbtGicDiQAvVBKSX6U/8uMdOK7lq+V4wI1oyc6SiXvwDcIXSa3nJb/EHMQjTqhWJY1TqI1QGyrmPzU9a+1SRqPFYEsLHMW/EmcUPHKjcaUZPX1n6m+h7VkJl7503im1gjB54dkw7hjoIVlnOoh0L0Bn9fTJmg7k72kXS0MFzHvMxcgDtzwH2Zgp97HgVOTkCpAJQRZfmhewkQAb01jn2HAEsDP5zRCd2X+ItNL1xKaNSrOZdpszfWeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9a5PR2a7QN9sw8SB4FY12gBhZBb+uc/ejOnlpzzrrV8=;
 b=S/FGweGZAMlYBwAaDdA+A+Our6qC2Q8yIstbxgla7/KMcgWkgQsw3UWjzGZJK2xBShvptuAmxvS/p1BsznWL7FrQ2OcAL+5V9j1PPD405j8barFwJxZgvHs7nouQ9TEbvM5pnbGQYnLmdYU51N5jgkBiVDgj356ZiAvEumcCHanj3RafIosJmTFXi3p6RPLVt7TAOJHZrwQu5hW31sDysRmVpByDz4xYIYa+KnsoPKWAIiylJrgxZKodcwH2Btn85pJVBIStpdUqI2OEohxCCfgKV1PTz/rJIVSi1XKbMM/8118t62dYV41Rcg3ixQ9YTv5WtE4iozysfBqadN2GkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 IA1PR11MB7319.namprd11.prod.outlook.com (2603:10b6:208:425::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.20; Tue, 22 Aug 2023 15:44:58 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::55d8:709a:ac58:ae0e%3]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 15:44:57 +0000
Date: Tue, 22 Aug 2023 08:44:23 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Message-ID: <ZOTX15kyZYHTG+iN@orsosgc001>
References: <20230808013159.38811-1-ashutosh.dixit@intel.com>
 <20230808013159.38811-4-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230808013159.38811-4-ashutosh.dixit@intel.com>
X-ClientProxiedBy: SJ0P220CA0010.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::14) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|IA1PR11MB7319:EE_
X-MS-Office365-Filtering-Correlation-Id: b0dfda86-dafc-4e62-7b87-08dba326bcf0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MRvtD/BBIkOjrcmTCJZHAno0aVHLK5qVaOgzWnyHcC6M+cLOzoEs5rEli/tTvLpL+H5aUybWFdSWAwp8aURt9zh9fIrddpn+056hh5MO1UhfKO+ZdE7p5zS4IISfVZVuumg8WkWTilX4bGneV8h+PNzbmlxFvoPBfiYjRZtpjqrVAqrN+iknzMohjwRlA9BAn8f8jMezbNsH3NI0SHGLJ7QeNQP0dgK1eZuKtbJyqFYHaIzSad+xwUZ9G4MdaBFG780l38hNZIlEFht6QadtItcvgBVAnBHv0ZVOAnH8a+IYM2MWVRugIJhIkeOJlm5/awV+CrfGdntXZbaQhYEnpIpjJNfBwXd8C6tX713sWYezcjX553hGQ7yN4l7CWFOedoIyd6DaAV9PLmgIAiJTTTDMU51NyXtvdaCxNdriWgLbMQtnphkQBVoslAlxpM5mwYiJwdZXjIrfXESGHN4QcWk6/UCZ6DwpoBoLSGQd9ASg7rFXnx44KXfir3A8JbHrXekr8uMQaAbLr4Vo2M47H831qCMeHi8DtDIAbv3P8juCFZqBABSrxEKr8Fe6yJlYa9z+dRnlmnCTP3A2P1Y0E2KqsaWcpaVtLYhtbruyvQU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(346002)(39860400002)(376002)(136003)(396003)(451199024)(1800799009)(186009)(2906002)(30864003)(38100700002)(6506007)(6486002)(83380400001)(5660300002)(26005)(86362001)(8676002)(8936002)(4326008)(6862004)(316002)(9686003)(66946007)(6512007)(66556008)(66476007)(82960400001)(6636002)(478600001)(6666004)(41300700001)(33716001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGlGSUo5WDdnRmhIbUVSNU9tRTZxZk1XMXJiZWsxcXR3cEI0eTZJdEhVazZY?=
 =?utf-8?B?OUpLcGpsbHBNZEFlekZ3N2E0SnZOYS9HdTkvcWNtZXB5Z1BFbXpxQjVkWlYw?=
 =?utf-8?B?RlZzU2tJMW1EdkphcU4wV0N2UHlDQng1b01ha3hnNlZ0eWFsbEFFdnZrekJ4?=
 =?utf-8?B?NWc2VlVocnk3cmM4RUdrYlA5OVVCelJpamk3M2EwZEl2VVpGNVVlNHZVdURt?=
 =?utf-8?B?QWNFQ1lwdllPMEhEUmNuUmZPTitkOG9JQnRvd1ZsRGNaSEFSVWF5akY5YXBt?=
 =?utf-8?B?VDlSUjlQZU9LMXhFanhDQkl2cEFsdWpXS3JvbU9qaFlQaXoyeWc5MWVjcmNW?=
 =?utf-8?B?VXN2TnFyOTNqMC9ERUNRTWlIVTJWekVLa2dIVjlFbDM3TXB6eFdUaXhNUk42?=
 =?utf-8?B?Mm04V1VaZkI0eVFKVytpR1JUVjgrS3V6YmdLVFRhb0FDNHN4SlBMaDU2YklD?=
 =?utf-8?B?RmczelE4RHZsMzFNa1REcTFsLzM0Mkg3R2I1dmxzTDFTTjlLbDV0NWFOeHRs?=
 =?utf-8?B?ZUdNTitESjUrY1ZseDhZUURnY2R6KzIzWkxzeWF3WHVmMGE1YlVpWnlBcVZV?=
 =?utf-8?B?MnQ0NFIzWC9kekRySGhjY1Y4N2tHUjBBdk5yZjFPd3FweUFWSlFQNHBQZU5j?=
 =?utf-8?B?MlYrbmJTeWllKzdUOTlnWXdCaUhlUi9JL3d4bWcwMFBjbDVWN1JHb1JsWE83?=
 =?utf-8?B?TVBmRUZmemtUN3BGaG9HaVlXMWZCK1VSMDNqeUJzTDNhNi9MSTFpZnNrVmY4?=
 =?utf-8?B?N1JCTXNnckFrbW5YZlpCSk1HY3lwSFZ0UFd1VXg0OTRobFAwTXJvcG9QQU8w?=
 =?utf-8?B?TzFCL2JBdnNpaG9sbHFmNTQ2YzBOVEhhZ2FLR3V1VjlrTHJnalg3ZmlKV3c4?=
 =?utf-8?B?b0dmUVQwSmo3TGdpdnBJQlAxTStJNlNTWjBQNUR1VHdpR3g4b28vL3JUc1lz?=
 =?utf-8?B?ZDN6WDJFdVdxakNkUVRIaWVLUjlESmNXWmxsSC9FSlJmNzNxbFZGTTgyMnVX?=
 =?utf-8?B?cEwzSndlRHd1Qkc5SEw3RFZEOVZtU0xmYVV4MjEvWjlPaVRRVGVlc3hLY2R3?=
 =?utf-8?B?d2VjU2Q2T3oyRXdFRjE4SnhQS0xGWjJNV2VFV3pPMFRFaUpDcytra3VuR2xo?=
 =?utf-8?B?M2sxeE9WM2NSeDlFa012OVMrdEZDVzFobHBtdlhlbXd5azRINTNRMDVwd3Z5?=
 =?utf-8?B?L2xLVkVRcmZGSm1SbEwxVmlsZGkzMUJjcXBVNXZpMjhWZmg5cnYvcU8vUkJu?=
 =?utf-8?B?UTdncFNsVXR0Y2E1ODN6bzBJajk0cnkrTy9HVm1TNzRxcm1sYmVXM0t3OXBR?=
 =?utf-8?B?Y2o5akluVEw4SW9LU21KOXVvUi9JdENLa3EyNHBCN0lhV0owSm0rckdkSTVM?=
 =?utf-8?B?Z2U5WnBuTlVDMDR1SitwRG1ES1FNQVR1TDdyV2V4bm1RS3NETmd2OCt6ZUxB?=
 =?utf-8?B?Sk95YXVmWW81Sy9pb3FMRU16RDkrbmpvWlJwUHJ1cGl5K0xFSG1hQTNrbklj?=
 =?utf-8?B?aFhiSndUTEpnSDl5Ujh2Y0NHTVAwTEpqN2NVOU9rNzJlUjN0VXJaOCtNcHpL?=
 =?utf-8?B?U21JM1oyU2FaRnNZbWpia2pXREdGSmtpZldLTk92M1lGbmNDbUN4M21NdkNy?=
 =?utf-8?B?ZCthbHNZejN3L1dOWm1yYzVhSmRYbTNFeDBmcXZMMlBOS0pVUFdYN0VMK1Fv?=
 =?utf-8?B?SGVPYWxUVitkNjNVSDN1RnhRbjNBTHlidnhtOHg2bWx3WE5wcWZtamJnU1Nw?=
 =?utf-8?B?cjNzMGltNmMxOTRUYUJEZE14WUFXZks3UUF5eXdmRURVSWdhSkVzTkIwQTRy?=
 =?utf-8?B?OS85bmc5SVJZajJXVHRUUGZmTG4zdGtSTXczOE5VaGRwZUFlbHJBUit1Rmcw?=
 =?utf-8?B?MlR5R1BXM1V4ekUzMG40ZUVxbGM0Ynh0RTFOdE40OStuS0dqUk0wVlB1clI5?=
 =?utf-8?B?M1JvZ1FIZ2ZKNG5SZm9uc1VSSTRSZDk1UmRCellGZmlleDZPSG5tc1FNTlhM?=
 =?utf-8?B?WmxJdEZPY2ZRa3hTZmJaNDFmRDR5OXY4dU1tWkdpbmdodzBGbzRBbkhBZHVJ?=
 =?utf-8?B?bThPcUlvYmY0NUF2cmpEM216VDA3VGxUY0FEcFc5RStXZEN5NE9kZTVLbHh2?=
 =?utf-8?B?OCtxekV5RGh0SExhMlZTUzluaEFBUzhqZFVkQnN6bVovUkRqVlpFb1R5QVNp?=
 =?utf-8?Q?YxGCUFAGXgfdKdOjXxVHiAM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b0dfda86-dafc-4e62-7b87-08dba326bcf0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 15:44:57.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: so4FEq3h1faNzemBR4mQYzqYtHNu6kRHUljgFEzVGS93Ff0eK+Ic2FmmvtanIcewaiZoJWNTdbn9LZr9Y53EUdGAWe9EW1TjVgzz9SvHICQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7319
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 03/10] drm/xe/oa: Add registers and GPU
 commands used by OA
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

On Mon, Aug 07, 2023 at 06:31:52PM -0700, Ashutosh Dixit wrote:
>Add registers and GPU commands used by OA in subsequent patches. The xe oa
>code programs OA units which generate performance data. The code also
>submits command buffers to change hardware engine context images and
>implement waits.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h  |   5 +
> drivers/gpu/drm/xe/regs/xe_gpu_commands.h |  27 ++++
> drivers/gpu/drm/xe/regs/xe_oa_regs.h      | 173 ++++++++++++++++++++++
> 3 files changed, 205 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/regs/xe_oa_regs.h
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 79873bf64e8dd..044a4920f1568 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -84,6 +84,9 @@
>
> #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>
>+#define MI_PREDICATE_RESULT_2(base)		XE_REG((base) + 0x3bc)
>+#define MI_PREDICATE_RESULT_1(base)		XE_REG((base) + 0x41c)
>+

We can drop these changes until we decide to implement the noa wait.

Umesh

> #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
> #define   RING_FORCE_TO_NONPRIV_DENY		REG_BIT(30)
> #define   RING_FORCE_TO_NONPRIV_ACCESS_MASK	REG_GENMASK(29, 28)
>@@ -108,6 +111,8 @@
> #define RING_EXECLIST_CONTROL(base)		XE_REG((base) + 0x550)
> #define	  EL_CTRL_LOAD				REG_BIT(0)
>
>+#define GEN8_RING_CS_GPR(base, n)		XE_REG((base) + 0x600 + (n) * 8)
>+
> #define VDBOX_CGCTL3F10(base)			XE_REG((base) + 0x3f10)
> #define   IECPUNIT_CLKGATE_DIS			REG_BIT(22)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>index 12120dd37aa2a..672100d375312 100644
>--- a/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>+++ b/drivers/gpu/drm/xe/regs/xe_gpu_commands.h
>@@ -14,8 +14,10 @@
>
> #define MI_INSTR(opcode, flags) \
> 	(__INSTR(INSTR_MI_CLIENT) | (opcode) << 23 | (flags))
>+#define MI_OPCODE(x)		(((x) >> 23) & 0x3f)
>
> #define MI_NOOP			MI_INSTR(0, 0)
>+#define MI_SET_PREDICATE	MI_INSTR(0x01, 0)
> #define MI_USER_INTERRUPT	MI_INSTR(0x02, 0)
>
> #define MI_ARB_ON_OFF		MI_INSTR(0x08, 0)
>@@ -23,12 +25,32 @@
> #define   MI_ARB_DISABLE		(0<<0)
>
> #define MI_BATCH_BUFFER_END	MI_INSTR(0x0a, 0)
>+
>+#define	MI_MATH(x)		MI_INSTR(0x1a, (x) - 1)
>+#define MI_MATH_INSTR(opcode, op1, op2) ((opcode) << 20 | (op1) << 10 | (op2))
>+#define	  MI_MATH_LOAD(op1, op2)	MI_MATH_INSTR(0x080, op1, op2)
>+#define   MI_MATH_ADD			MI_MATH_INSTR(0x100, 0x0, 0x0)
>+#define   MI_MATH_SUB			MI_MATH_INSTR(0x101, 0x0, 0x0)
>+#define   MI_MATH_STORE(op1, op2)	MI_MATH_INSTR(0x180, op1, op2)
>+#define   MI_MATH_STOREINV(op1, op2)	MI_MATH_INSTR(0x580, op1, op2)
>+#define   MI_MATH_REG(x) (x)
>+#define   MI_MATH_REG_SRCA		0x20
>+#define   MI_MATH_REG_SRCB		0x21
>+#define   MI_MATH_REG_ACCU		0x31
>+#define   MI_MATH_REG_CF		0x33
>+
> #define MI_STORE_DATA_IMM	MI_INSTR(0x20, 0)
>+#define MI_STORE_DWORD_IMM_GEN4	MI_INSTR(0x20, 2)
>
> #define MI_LOAD_REGISTER_IMM(x)	MI_INSTR(0x22, 2*(x)-1)
> #define   MI_LRI_LRM_CS_MMIO		REG_BIT(19)
> #define   MI_LRI_MMIO_REMAP_EN		REG_BIT(17)
> #define   MI_LRI_FORCE_POSTED		(1<<12)
>+#define   IS_MI_LRI_CMD(x)		(MI_OPCODE(x) == MI_OPCODE(MI_INSTR(0x22, 0)))
>+#define   MI_LRI_LEN(x)			(((x) & 0xff) + 1)
>+
>+#define MI_STORE_REGISTER_MEM	MI_INSTR(0x24, 1)
>+#define   MI_SRM_LRM_GLOBAL_GTT		REG_BIT(22)
>
> #define MI_FLUSH_DW		MI_INSTR(0x26, 1)
> #define   MI_FLUSH_DW_STORE_INDEX	(1<<21)
>@@ -37,7 +59,12 @@
> #define   MI_FLUSH_DW_OP_STOREDW	(1<<14)
> #define   MI_FLUSH_DW_USE_GTT		(1<<2)
>
>+#define MI_LOAD_REGISTER_MEM	MI_INSTR(0x29, 1)
>+
>+#define MI_LOAD_REGISTER_REG	MI_INSTR(0x2A, 1)
>+
> #define MI_BATCH_BUFFER_START		MI_INSTR(0x31, 1)
>+#define   MI_BATCH_PREDICATE         REG_BIT(15) /* HSW+ on RCS only*/
>
> #define XY_CTRL_SURF_COPY_BLT		((2 << 29) | (0x48 << 22) | 3)
> #define   SRC_ACCESS_TYPE_SHIFT		21
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>new file mode 100644
>index 0000000000000..0b378cb7a6ddb
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -0,0 +1,173 @@
>+/* SPDX-License-Identifier: MIT */
>+/*
>+ * Copyright © 2023 Intel Corporation
>+ */
>+
>+#ifndef __XE_OA_REGS__
>+#define __XE_OA_REGS__
>+
>+#define REG_EQUAL(reg, xe_reg) ((reg) == (xe_reg.addr))
>+#define REG_EQUAL_MCR(reg, xe_reg) ((reg) == (xe_reg.__reg.addr))
>+
>+#define HALF_SLICE_CHICKEN2 XE_REG_MCR(0xe180)
>+#define   GEN8_ST_PO_DISABLE	REG_BIT(13)
>+
>+#define GEN7_ROW_CHICKEN2		XE_REG(0xe4f4)
>+#define GEN8_ROW_CHICKEN		XE_REG_MCR(0xe4f0)
>+#define   STALL_DOP_GATING_DISABLE	REG_BIT(5)
>+#define   GEN12_DISABLE_DOP_GATING	REG_BIT(0)
>+
>+#define RPM_CONFIG1			XE_REG(0xd04)
>+#define   GEN10_GT_NOA_ENABLE		REG_BIT(9)
>+
>+#define WAIT_FOR_RC6_EXIT XE_REG(0x20cc)
>+#define   HSW_WAIT_FOR_RC6_EXIT_ENABLE	REG_BIT(0)
>+
>+#define EU_PERF_CNTL0 XE_REG(0xe458)
>+#define EU_PERF_CNTL4 XE_REG(0xe45c)
>+#define EU_PERF_CNTL1 XE_REG(0xe558)
>+#define EU_PERF_CNTL5 XE_REG(0xe55c)
>+#define EU_PERF_CNTL2 XE_REG(0xe658)
>+#define EU_PERF_CNTL6 XE_REG(0xe65c)
>+#define EU_PERF_CNTL3 XE_REG(0xe758)
>+
>+#define OABUFFER_SIZE_MASK	REG_GENMASK(5, 3)
>+#define OABUFFER_SIZE_128K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 0)
>+#define OABUFFER_SIZE_256K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 1)
>+#define OABUFFER_SIZE_512K	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 2)
>+#define OABUFFER_SIZE_1M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 3)
>+#define OABUFFER_SIZE_2M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 4)
>+#define OABUFFER_SIZE_4M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 5)
>+#define OABUFFER_SIZE_8M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 6)
>+#define OABUFFER_SIZE_16M	REG_FIELD_PREP(OABUFFER_SIZE_MASK, 7)
>+
>+#define GEN12_OA_TLB_INV_CR XE_REG(0xceec)
>+
>+/* Gen12 OAR unit */
>+#define GEN12_OAR_OACONTROL XE_REG(0x2960)
>+#define  GEN12_OAR_OACONTROL_COUNTER_FORMAT_SHIFT 1
>+#define  GEN12_OAR_OACONTROL_COUNTER_ENABLE	REG_BIT(0)
>+
>+#define GEN8_OACTXCONTROL XE_REG(0x2360)
>+#define  GEN8_OA_COUNTER_RESUME			REG_BIT(0)
>+
>+#define GEN12_OACTXCONTROL(base) XE_REG((base) + 0x360)
>+#define GEN12_OAR_OASTATUS XE_REG(0x2968)
>+
>+/* Gen12 OAG unit */
>+#define GEN12_OAG_OAHEADPTR XE_REG(0xdb00)
>+#define  GEN12_OAG_OAHEADPTR_MASK 0xffffffc0
>+#define GEN12_OAG_OATAILPTR XE_REG(0xdb04)
>+#define  GEN12_OAG_OATAILPTR_MASK 0xffffffc0
>+
>+#define GEN12_OAG_OABUFFER XE_REG(0xdb08)
>+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_MASK  (0x7)
>+#define  GEN12_OAG_OABUFFER_BUFFER_SIZE_SHIFT (3)
>+#define  GEN12_OAG_OABUFFER_MEMORY_SELECT     REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>+
>+#define GEN12_OAG_OAGLBCTXCTRL XE_REG(0x2b28)
>+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_PERIOD_SHIFT 2
>+#define  GEN12_OAG_OAGLBCTXCTRL_TIMER_ENABLE	REG_BIT(1)
>+#define  GEN12_OAG_OAGLBCTXCTRL_COUNTER_RESUME	REG_BIT(0)
>+
>+#define GEN12_OAG_OACONTROL XE_REG(0xdaf4)
>+#define  GEN12_OAG_OACONTROL_OA_COUNTER_FORMAT_SHIFT 2
>+#define  GEN12_OAG_OACONTROL_OA_COUNTER_ENABLE	REG_BIT(0)
>+
>+#define GEN12_OAG_OA_DEBUG XE_REG(0xdaf8)
>+#define  GEN12_OAG_OA_DEBUG_INCLUDE_CLK_RATIO		REG_BIT(6)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_CLK_RATIO_REPORTS	REG_BIT(5)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_GO_1_0_REPORTS	REG_BIT(2)
>+#define  GEN12_OAG_OA_DEBUG_DISABLE_CTX_SWITCH_REPORTS	REG_BIT(1)
>+
>+#define GEN12_OAG_OASTATUS XE_REG(0xdafc)
>+#define  GEN12_OAG_OASTATUS_COUNTER_OVERFLOW	REG_BIT(2)
>+#define  GEN12_OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
>+#define  GEN12_OAG_OASTATUS_REPORT_LOST		REG_BIT(0)
>+
>+#define GDT_CHICKEN_BITS    XE_REG(0x9840)
>+#define   GT_NOA_ENABLE	    0x00000080
>+
>+#define GEN12_SQCNT1				XE_REG(0x8718)
>+#define   GEN12_SQCNT1_PMON_ENABLE		REG_BIT(30)
>+#define   GEN12_SQCNT1_OABPC			REG_BIT(29)
>+
>+/* Gen12 OAM unit */
>+#define GEN12_OAM_HEAD_POINTER_OFFSET   (0x1a0)
>+#define  GEN12_OAM_HEAD_POINTER_MASK    0xffffffc0
>+
>+#define GEN12_OAM_TAIL_POINTER_OFFSET   (0x1a4)
>+#define  GEN12_OAM_TAIL_POINTER_MASK    0xffffffc0
>+
>+#define GEN12_OAM_BUFFER_OFFSET         (0x1a8)
>+#define  GEN12_OAM_BUFFER_SIZE_MASK     (0x7)
>+#define  GEN12_OAM_BUFFER_SIZE_SHIFT    (3)
>+#define  GEN12_OAM_BUFFER_MEMORY_SELECT REG_BIT(0) /* 0: PPGTT, 1: GGTT */
>+
>+#define GEN12_OAM_CONTEXT_CONTROL_OFFSET              (0x1bc)
>+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_PERIOD_SHIFT 2
>+#define  GEN12_OAM_CONTEXT_CONTROL_TIMER_ENABLE       REG_BIT(1)
>+#define  GEN12_OAM_CONTEXT_CONTROL_COUNTER_RESUME     REG_BIT(0)
>+
>+#define GEN12_OAM_CONTROL_OFFSET                (0x194)
>+#define  GEN12_OAM_CONTROL_COUNTER_FORMAT_SHIFT 1
>+#define  GEN12_OAM_CONTROL_COUNTER_ENABLE       REG_BIT(0)
>+
>+#define GEN12_OAM_DEBUG_OFFSET                      (0x198)
>+#define  GEN12_OAM_DEBUG_BUFFER_SIZE_SELECT         REG_BIT(12)
>+#define  GEN12_OAM_DEBUG_INCLUDE_CLK_RATIO          REG_BIT(6)
>+#define  GEN12_OAM_DEBUG_DISABLE_CLK_RATIO_REPORTS  REG_BIT(5)
>+#define  GEN12_OAM_DEBUG_DISABLE_GO_1_0_REPORTS     REG_BIT(2)
>+#define  GEN12_OAM_DEBUG_DISABLE_CTX_SWITCH_REPORTS REG_BIT(1)
>+
>+#define GEN12_OAM_STATUS_OFFSET            (0x19c)
>+#define  GEN12_OAM_STATUS_COUNTER_OVERFLOW REG_BIT(2)
>+#define  GEN12_OAM_STATUS_BUFFER_OVERFLOW  REG_BIT(1)
>+#define  GEN12_OAM_STATUS_REPORT_LOST      REG_BIT(0)
>+
>+#define GEN12_OAM_MMIO_TRG_OFFSET	(0x1d0)
>+
>+#define GEN12_OAM_MMIO_TRG(base) \
>+	XE_REG((base) + GEN12_OAM_MMIO_TRG_OFFSET)
>+
>+#define GEN12_OAM_HEAD_POINTER(base) \
>+	XE_REG((base) + GEN12_OAM_HEAD_POINTER_OFFSET)
>+#define GEN12_OAM_TAIL_POINTER(base) \
>+	XE_REG((base) + GEN12_OAM_TAIL_POINTER_OFFSET)
>+#define GEN12_OAM_BUFFER(base) \
>+	XE_REG((base) + GEN12_OAM_BUFFER_OFFSET)
>+#define GEN12_OAM_CONTEXT_CONTROL(base) \
>+	XE_REG((base) + GEN12_OAM_CONTEXT_CONTROL_OFFSET)
>+#define GEN12_OAM_CONTROL(base) \
>+	XE_REG((base) + GEN12_OAM_CONTROL_OFFSET)
>+#define GEN12_OAM_DEBUG(base) \
>+	XE_REG((base) + GEN12_OAM_DEBUG_OFFSET)
>+#define GEN12_OAM_STATUS(base) \
>+	XE_REG((base) + GEN12_OAM_STATUS_OFFSET)
>+
>+#define GEN12_OAM_CEC0_0_OFFSET		(0x40)
>+#define GEN12_OAM_CEC7_1_OFFSET		(0x7c)
>+#define GEN12_OAM_CEC0_0(base) \
>+	XE_REG((base) + GEN12_OAM_CEC0_0_OFFSET)
>+#define GEN12_OAM_CEC7_1(base) \
>+	XE_REG((base) + GEN12_OAM_CEC7_1_OFFSET)
>+
>+#define GEN12_OAM_STARTTRIG1_OFFSET	(0x00)
>+#define GEN12_OAM_STARTTRIG8_OFFSET	(0x1c)
>+#define GEN12_OAM_STARTTRIG1(base) \
>+	XE_REG((base) + GEN12_OAM_STARTTRIG1_OFFSET)
>+#define GEN12_OAM_STARTTRIG8(base) \
>+	XE_REG((base) + GEN12_OAM_STARTTRIG8_OFFSET)
>+
>+#define GEN12_OAM_REPORTTRIG1_OFFSET	(0x20)
>+#define GEN12_OAM_REPORTTRIG8_OFFSET	(0x3c)
>+#define GEN12_OAM_REPORTTRIG1(base) \
>+	XE_REG((base) + GEN12_OAM_REPORTTRIG1_OFFSET)
>+#define GEN12_OAM_REPORTTRIG8(base) \
>+	XE_REG((base) + GEN12_OAM_REPORTTRIG8_OFFSET)
>+
>+#define GEN12_OAM_PERF_COUNTER_B0_OFFSET	(0x84)
>+#define GEN12_OAM_PERF_COUNTER_B(base, idx) \
>+	XE_REG((base) + GEN12_OAM_PERF_COUNTER_B0_OFFSET + 4 * (idx))
>+
>+#endif /* __XE_OA_REGS__ */
>-- 
>2.41.0
>
