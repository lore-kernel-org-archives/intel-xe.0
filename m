Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743AFC3DA6E
	for <intel-xe@archiver.kernel.org>; Wed, 20 Dec 2023 04:59:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128F410E558;
	Wed, 20 Dec 2023 04:59:46 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A237D10E561
 for <intel-xe@lists.freedesktop.org>; Wed, 20 Dec 2023 04:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703048384; x=1734584384;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=KJRGb2TBjnuummefyWYJIAIZv41j/CJh0+INRJiqrzQ=;
 b=ZSaVrM/8iZfE+b2w54kt/ibJjR/7krS3K4ss1KU+ur2VI8F2NpggOITe
 PEFdXwwZudjyxQaL7sHWpCKQvf/6tithoaR+IGfihRUqcKohYzbWav4Sm
 WMr5W0QoaPNkyPt+CTl+hjEYsnZMBfs+nuuOj7moQR27qKXL0ANP0ycAY
 hQTnVlLxfFShSR1+PJwbjah3LQ/Wtsvxi9TVFtup//iliHySJYiUFQljt
 1z9NymnN3N4kYWAMP/5lIH8bw6goI5UfnbckmvydJbpBqu8Wg0ApJyu/N
 F6yLQpJVcgXf5Ct7fjp2/qo5U4QMbnEqFvmyZN8FwfmKWz1REVgJf68um Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="17320936"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="17320936"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Dec 2023 20:59:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="1107607527"
X-IronPort-AV: E=Sophos;i="6.04,290,1695711600"; d="scan'208";a="1107607527"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Dec 2023 20:59:44 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 19 Dec 2023 20:59:43 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 19 Dec 2023 20:59:43 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 19 Dec 2023 20:59:43 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fE87ZkGStVSDVp/8fEsKAlgKL1tv0FGFbtgsGISC5YMTulUAPiIwUD08dwAG5HIEBG4rbNcWZq3wpRuMGEHXMTicVnHExTv4J+SZH+Kj+Z5eTmYdxZ87YgF+GdWAsyCDqfAPa0Wh29Gd163iqMMJbwjeZXbB3kdlcvtzanyArPkcy0elYMYARLvSTSL8ZxUlCNpzHbR57S4WSOq86hG92kJIUywVqfCFykMIVl2TlXxAiW5aWAHzjcdNFFExGMcvot6Evk9AQKC6bUzpF5rYrlh0VkU9Sj2Au436Jw/f7oC9MODzGdXyTVVW73I55a9YIs9NlcjcXcoHczgJ+XWMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzHLMKKuT8atNS+2EGff5lBpRmFtRhA/ZYIfSFSmCUo=;
 b=F3Cr9QkA5JtxJrDna8Zk8tbxmhMeX3cH4REGHdCGF9cqDcJHUdPbx70xqS+TktpSCdIGN36sP1S+uzPjyUfEW8c4EbvWsewFiuaVZT4UDWRIrko8hWzxtLoZe/QsQmg9c221VV15S6UbjqJ9jodiRk/KKZtDqxcpLNXm7kFrLgffvO39TiaYZL2tjlklgfNQybZDovwH5PMQFe3Ll2PBq2zDP+uXPrSKMcl8HJyf1uSw8AdaHeic0gnGKzUWSIh1+SY1JEJtLGFwP/8I4NVkyuAqoL324BAZxqmJLgjzdoZk9Jv/E0YdB2cPvJ15qc6s4ZiN33sd37kwmNMf01HsOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM6PR11MB2987.namprd11.prod.outlook.com (2603:10b6:5:65::14) by
 PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7091.38; Wed, 20 Dec 2023 04:59:41 +0000
Received: from DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9]) by DM6PR11MB2987.namprd11.prod.outlook.com
 ([fe80::e73e:dcc0:c5bb:49b9%7]) with mapi id 15.20.7113.016; Wed, 20 Dec 2023
 04:59:40 +0000
Date: Tue, 19 Dec 2023 20:59:29 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH 13/17] drm/xe/oa: Add OAC support
Message-ID: <ZYJ0qJnsvS1lNxch@unerlige-ril>
References: <20231208064329.2387604-1-ashutosh.dixit@intel.com>
 <20231208064329.2387604-14-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231208064329.2387604-14-ashutosh.dixit@intel.com>
X-ClientProxiedBy: MW4PR04CA0075.namprd04.prod.outlook.com
 (2603:10b6:303:6b::20) To DM6PR11MB2987.namprd11.prod.outlook.com
 (2603:10b6:5:65::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB2987:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: d88d9c92-dc8c-45d5-9e79-08dc0118783d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rFyf9Ks2UoNJN3t6lcE/bEKew0tHCFeurD4r+O+UlSAyu2dfPeOKH1iW21TWz3NA1kGq7OgV67SFqNc7Ra7BZ8MSkIPz/BauCG0emh+A/PuL/hg6lUyApVL0hANeJsA4V0JXbz3/TqtDQT2gGZqi4Vivv2eEgprWOfuRi/u4eGTDgyd5aFNu26wpGggXLIu60qS0GsA0DjXrqINhFXSQbv2Zx0UFgmhmop+0yXCQmKFiKWtNWKUOGSJKuLhBa0cWvtZyR3EWd7ATYukroAr9bxxA6Vvitrvvqvy5fXecSNUuo8b1lmCfqPuyO7q23DHka66Uh0Mub3hyORADTtQaLWs0TS8h18/hkak6511J+77zDsnIcAjPPTuydmXOjKuu3aSBwSKJQ8kWmYv44QG9KfZzYfpGioD9bIO8/BUV/G8AhB43hcpSm/Nxo6LAIN+f44EGzAtPkBTrsaMBQcPgfUgYHoA6u288DrEWkf+NTie4Ed+H1LkzANHw+5/+I/XYVaN+qSBfcO+NB8g5zE4LYJKjbeevPwsP1MitIhw5a2/FADWy93SwGD1QG7mz3xxQ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR11MB2987.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(346002)(396003)(376002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(6666004)(8936002)(478600001)(6506007)(9686003)(6512007)(6862004)(6636002)(316002)(66476007)(66556008)(66946007)(2906002)(4326008)(8676002)(26005)(86362001)(6486002)(38100700002)(5660300002)(33716001)(41300700001)(83380400001)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTl3dEIzVlovMUk1SnBjQXFpeHRIRGZ3T2RMbGcyakkyZkNiMUU0c0FtQVhQ?=
 =?utf-8?B?NHBmbVdPZzNUWDh0SjJ0bEc0R3lmQVFSa1RpalcxSVkrZEVzUHhYRHFxU21p?=
 =?utf-8?B?RFdyb0wyOXhlRmJMcEY1OXQ1Z2xyQ3lkSkhnRk14YTdlamt2NjBqWS8vdnNx?=
 =?utf-8?B?Y2p1NjJaYU4rdGMrY2F0OFJqa3hmRXIzZitWckJSMVRBa21MeFA3TTZPVlFD?=
 =?utf-8?B?SWpRR2RodjVtWGtDQjFuWmxreEtibHdST09na3ZWTnBYQVBYc0JPUFVkam9q?=
 =?utf-8?B?K1pUL2tielJtNjErSHRIZFdGamM0M0tsa1JnUjNkRUJrenVlU2VWUHVFMXRn?=
 =?utf-8?B?QjlCdE9VbmxoSjdPc2thdnR1V2EvMUNiK1pia2htVW55Rm1EVnZzd3F4dXFa?=
 =?utf-8?B?azNBcEZFT29IOE55UHYyU2J2dGhVb1RNK3Y1ekZRaGJjdkduMlRmaGxjMjA5?=
 =?utf-8?B?eHFmb3ZQeW9VaTVxN3NDRGxyTDczb0lJeCt4bDAwWVhyQUZ0R2dzb1lRSjVH?=
 =?utf-8?B?bGd3ZStxa0lNUW91Rmt1cGZBa3hZL3h0c2ZUeDl6WnpQRUxKSDNhV0RUOWgv?=
 =?utf-8?B?YVZZU1NzRkwvUUlVWG5zQm83VUF0bnptYUhlQ1d3YzJadUFidFRBYTJ2WlhR?=
 =?utf-8?B?elRWWitJSXFlTnhHWkdMdUJCdTEzbjFSY0xObXV6eW9SY1I4ZDhKSlJEQVNG?=
 =?utf-8?B?VlJrdXphd3lKekJmd1FPRUpUTzR3cVRSOGRxZjltNlVkbmllcUxvWnA2dE05?=
 =?utf-8?B?MFNTemZyK1FTODlLWFh4WkRCOXpoNURScVZ2WE05eUxlejYxUjBRelNBeG55?=
 =?utf-8?B?QWJWNjRxVVh3aHZEOEp0OWlpb0FDV2hJaGN1b0RrQjdvUE9ueXJJN0xoQ2l3?=
 =?utf-8?B?RFNnSVhiZlIzVTRGU1UvTFljVnVMNm03NkhZeGdhZVZtSFg3eHFVazF0UDJq?=
 =?utf-8?B?Z3EyVk9ncDhJbUg2VGxzVWYyMHFvVGxUOE0rei96Z2tYT3BuV0pESUJCZFVp?=
 =?utf-8?B?L0Q3YzBoT2F6NTRFS3Z6WWcrNllXU0NpZ1dydjdpU2lDVG51ZE4wYjBRQXdK?=
 =?utf-8?B?dzRZSDhpeDJOT09naTNlMGJ2NW9ZdHpBV1l3VXZESnlqN214S0lXcGdGVDFJ?=
 =?utf-8?B?enBGOUNtNlhMVXF4eTNLcTFBWi9KcGZBYnFBd0hsRTNNSXpWRWNVanQ3cDJH?=
 =?utf-8?B?MVVPRGN3VXozZGtaUmJKdU1mRG9wS0p5aWNoVHJlSTJiRG1wa2ZFL0FveFoy?=
 =?utf-8?B?UDgyNTVoUW1nMjBZZTRnaUhCbndSdm1rWkhvb0FDUlMxaHVNLzByNGFvU0cv?=
 =?utf-8?B?SGl1YnB3VmJuREpvWWpjczMzMUg3czBCK3pSOTZUbEZySHlrUlJaRnVnSFFD?=
 =?utf-8?B?M2h2MForaFIwNGFCcDdNUjV5N3Yxa0dURXJIZ29sdk9zVTB4S0Yzc3NJQXY4?=
 =?utf-8?B?NFQzWEpSK1cxWUllZ1dEVlE2VmxDNE4xRDFnSmNhendBQmtpaXc4MnhxT3Vp?=
 =?utf-8?B?K1BFZGZaQktOa29MeWpPSVVzWTlvZFBkOTBaWmMraVo4YXRIeUlxelZFbktx?=
 =?utf-8?B?cWRyQzR0Q09Mck1CMU1ONnE3NUxUOVZIUUt5UWhrdVBHbU1LM21CajNlVDRq?=
 =?utf-8?B?Qjd4aDFiS0ExVHN2UDB1OGdqb2ZKRWtkUTlpOFF2VjkrcnRYSGZmanJ1YXVr?=
 =?utf-8?B?dlFEM1VoVzFFdEdMbHk0Vlk2UFN5cU50M21Ubk5QRDhQM2wwQ1BYZ1BvL0Rh?=
 =?utf-8?B?M3dUcDZnRThReFFSOER3bk1nR0R2WjBIdVVZQzc1ZDFXZ0JTR0lNUWhYMU9H?=
 =?utf-8?B?aEZXWWpwYTNrQkVXLzc3TXEzdFRqaHRNV0ZINzNMK1FpVmhYakFyZlhIMGJH?=
 =?utf-8?B?L0h1WDJjaExPdzUwM1BjZjlNVkVpYlc1NE50alR0aE9jK0Y3V05YMFF0eDFt?=
 =?utf-8?B?TXhDSjRIL3dLRlRVUkQydTVGcm9uS0NqK3ZtY0JTdTcwMUxGeHp1eFJuQzJG?=
 =?utf-8?B?eDhnOUk2dVBJQml1RDN0N2VqQW1DY2czeVhGem5uSU93eDdHa1dZR3IwMllC?=
 =?utf-8?B?MjNVRzF1bXhMZ1hMd3M5T0V3TXk3MlBweGZXUDk4OFV6NW95TnAreU41elNl?=
 =?utf-8?B?K2c5aEtqNmFkdVFoRlBTcmtwYXdpYndlU0tocjl3YjU4SUVhSHdlNm1DMkdv?=
 =?utf-8?Q?58+CRbOIgt3yoBCrRMKRz/I=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d88d9c92-dc8c-45d5-9e79-08dc0118783d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB2987.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2023 04:59:39.4439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q0Q5lcUC8D4hJwEd8US6Xso3EUi4eVapqt2RhK7ysBsPgsPQF3W0xMwMA/ya2EGrnNQUlOurJYkrcXsud/juBnrvrnxuuH4x4KuPL90Vdi4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Dec 07, 2023 at 10:43:25PM -0800, Ashutosh Dixit wrote:
>Similar to OAR, allow userspace to execute MI_REPORT_PERF_COUNT on compute
>engines of a specified exec queue.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
> drivers/gpu/drm/xe/regs/xe_oa_regs.h     |  3 +
> drivers/gpu/drm/xe/xe_oa.c               | 81 +++++++++++++++++++++++-
> 3 files changed, 82 insertions(+), 3 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 76c0938df05f3..045f9773f01f4 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -73,6 +73,7 @@
>
> #define RING_CONTEXT_CONTROL(base)		XE_REG((base) + 0x244, XE_REG_OPTION_MASKED)
> #define	  CTX_CTRL_OAC_CONTEXT_ENABLE		REG_BIT(8)
>+#define	  CTX_CTRL_RUN_ALONE			REG_BIT(7)
> #define	  CTX_CTRL_INHIBIT_SYN_CTX_SWITCH	REG_BIT(3)
> #define	  CTX_CTRL_ENGINE_CTX_RESTORE_INHIBIT	REG_BIT(0)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_oa_regs.h b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>index 7e2e875ccf80a..b66cd95b795e7 100644
>--- a/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_oa_regs.h
>@@ -74,6 +74,9 @@
> #define  OAG_OASTATUS_BUFFER_OVERFLOW	REG_BIT(1)
> #define  OAG_OASTATUS_REPORT_LOST	REG_BIT(0)
>
>+/* OAC unit */
>+#define OAC_OACONTROL			XE_REG(0x15114)
>+
> /* OAM unit */
> #define OAM_HEAD_POINTER_OFFSET			(0x1a0)
> #define OAM_TAIL_POINTER_OFFSET			(0x1a4)
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 9d653d7722d1a..42f32d4359f2c 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -449,6 +449,19 @@ u32 __format_to_oactrl(const struct xe_oa_format *format, int counter_sel_mask)
> 		REG_FIELD_PREP(OA_OACONTROL_COUNTER_SIZE_MASK, format->counter_size);
> }
>
>+static u32 __oa_ccs_select(struct xe_oa_stream *stream)
>+{
>+	u32 val;
>+
>+	if (stream->hwe->class != XE_ENGINE_CLASS_COMPUTE)
>+		return 0;
>+
>+	val = REG_FIELD_PREP(OAG_OACONTROL_OA_CCS_SELECT_MASK, stream->hwe->instance);
>+	xe_assert(stream->oa->xe,
>+		  REG_FIELD_GET(OAG_OACONTROL_OA_CCS_SELECT_MASK, val) == stream->hwe->instance);

Why is there a need to do REG_FIELD_GET? I thought the REG_FIELD_PREP is 
just a bitwise operation. Are you expecting coherency issues?

>+}
>+
> static void xe_oa_enable(struct xe_oa_stream *stream)
> {
> 	const struct xe_oa_format *format = stream->oa_buffer.format;
>@@ -463,7 +476,7 @@ static void xe_oa_enable(struct xe_oa_stream *stream)
>
> 	regs = __oa_regs(stream);
> 	val = __format_to_oactrl(format, regs->oa_ctrl_counter_select_mask) |
>-		OAG_OACONTROL_OA_COUNTER_ENABLE;
>+		__oa_ccs_select(stream) | OAG_OACONTROL_OA_COUNTER_ENABLE;
>
> 	xe_mmio_write32(stream->gt, regs->oa_ctrl, val);
> }
>@@ -762,6 +775,64 @@ static int xe_oa_configure_oar_context(struct xe_oa_stream *stream, bool enable)
> 	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));
> }
>
>+static int xe_oa_configure_oac_context(struct xe_oa_stream *stream, bool enable)
>+{
>+	const struct xe_oa_format *format = stream->oa_buffer.format;
>+	struct xe_lrc *lrc = &stream->exec_q->lrc[0];
>+	u32 regs_offset = xe_lrc_regs_offset(lrc) / sizeof(u32);
>+	u32 oacontrol = __format_to_oactrl(format, OAR_OACONTROL_COUNTER_SEL_MASK) |
>+		(enable ? OAR_OACONTROL_COUNTER_ENABLE : 0);
>+	struct flex regs_context[] = {
>+		{
>+			OACTXCONTROL(stream->hwe->mmio_base),
>+			stream->oa->ctx_oactxctrl_offset[stream->hwe->class] + 1,
>+			enable ? OA_COUNTER_RESUME : 0,
>+		},
>+		{
>+			RING_CONTEXT_CONTROL(stream->hwe->mmio_base),
>+			regs_offset + CTX_CONTEXT_CONTROL,
>+			_MASKED_FIELD(CTX_CTRL_OAC_CONTEXT_ENABLE,
>+				      enable ? CTX_CTRL_OAC_CONTEXT_ENABLE : 0) |
>+			_MASKED_FIELD(CTX_CTRL_RUN_ALONE,
>+				      enable ? CTX_CTRL_RUN_ALONE : 0),
>+		},
>+	};
>+	/* Offsets in regs_lri are not used since this configuration is applied using LRI */
>+	struct flex regs_lri[] = {
>+		{
>+			OAC_OACONTROL,
>+			OAR_OAC_OACONTROL_OFFSET + 1,
>+			oacontrol,
>+		},
>+	};
>+	int err;
>+
>+	/* Set ccs select to enable programming of OAC_OACONTROL */
>+	xe_mmio_write32(stream->gt, __oa_regs(stream)->oa_ctrl, __oa_ccs_select(stream));
>+
>+	/* Modify stream hwe context image with regs_context */
>+	err = xe_oa_modify_context(stream, &stream->exec_q->lrc[0],
>+				   regs_context, ARRAY_SIZE(regs_context));
>+	if (err)
>+		return err;
>+
>+	/* Apply regs_lri using LRI */
>+	return xe_oa_modify_self(stream, regs_lri, ARRAY_SIZE(regs_lri));

I think in i915, for execlist scheduling, there was a kernel context 
that was scheduled and when it ran, it would indicate that all other 
contexts are done executing - kinda GPU idle. The modify self was (IMO) 
only needed to update the kernel context in this scenario.

GuC does not have a concept of kernel context (at least not in i915, not 
sure if things changed in XE). If so, all the modify self can be dropped 
(both from OAR and OAC).

Otherwise, this is good too, so

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

The other query I have (unrelated to this patch) is if we need the 
PWR_CLK_STATE state configured in all contexts. It's a bit hazy if that 
was only needed for older gens or if it is applicable to newer 
platforms. (gen12_configure_all_contexts() in i915).

Thanks,
Umesh


>+}
>+
>+static int xe_oa_configure_oa_context(struct xe_oa_stream *stream, bool enable)
>+{
>+	switch (stream->hwe->class) {
>+	case XE_ENGINE_CLASS_RENDER:
>+		return xe_oa_configure_oar_context(stream, enable);
>+	case XE_ENGINE_CLASS_COMPUTE:
>+		return xe_oa_configure_oac_context(stream, enable);
>+	default:
>+		/* Video engines do not support MI_REPORT_PERF_COUNT */
>+		return 0;
>+	}
>+}
>+
> #define HAS_OA_BPC_REPORTING(xe) (GRAPHICS_VERx100(xe) >= 1255)
>
> static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>@@ -781,7 +852,7 @@ static void xe_oa_disable_metric_set(struct xe_oa_stream *stream)
>
> 	/* disable the context save/restore or OAR counters */
> 	if (stream->exec_q)
>-		xe_oa_configure_oar_context(stream, false);
>+		xe_oa_configure_oa_context(stream, false);
>
> 	/* Make sure we disable noa to save power. */
> 	xe_mmio_rmw32(stream->gt, RPM_CONFIG1, GT_NOA_ENABLE, 0);
>@@ -978,8 +1049,9 @@ static int xe_oa_enable_metric_set(struct xe_oa_stream *stream)
>
> 	xe_mmio_rmw32(stream->gt, XELPMP_SQCNT1, 0, sqcnt1);
>
>+	/* Configure OAR/OAC */
> 	if (stream->exec_q) {
>-		ret = xe_oa_configure_oar_context(stream, true);
>+		ret = xe_oa_configure_oa_context(stream, true);
> 		if (ret)
> 			return ret;
> 	}
>@@ -1636,6 +1708,9 @@ int xe_oa_stream_open_ioctl(struct drm_device *dev, void *data, struct drm_file
> 		param.exec_q = xe_exec_queue_lookup(xef, param.exec_queue_id);
> 		if (XE_IOCTL_DBG(oa->xe, !param.exec_q))
> 			return -ENOENT;
>+
>+		if (param.exec_q->width > 1)
>+			drm_dbg(&oa->xe->drm, "exec_q->width > 1, programming only exec_q->lrc[0]\n");
> 	}
>
> 	/*
>-- 
>2.41.0
>
