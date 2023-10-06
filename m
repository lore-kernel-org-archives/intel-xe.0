Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D80BDE92FF4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 07:35:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4DD10E23F;
	Fri,  6 Oct 2023 07:35:40 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F21D10E23F
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Oct 2023 07:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696577739; x=1728113739;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=GBiNiPYEoAXxOCTO6tj+r5LFf7g5+HBp1P+so1TZaGA=;
 b=YPu+BV3FVkXlevYM3UShmeIhsElscA81f2ReCioLbT8U0NpW7MMs82Ni
 qhafbqudu/iIyH7itGK3t8mXcFKZkjb/WTlh3Q6idYh+mAdLMDiHSCUBT
 ds3hsjkIrskB0Nup3o9Rh6vpb9qD5T5/8GklRUr9E4ejmPUcmB6RLturZ
 sHmuliUjShocCh2TxAvomab9O/T/KEeoM5JZQxqvQdZGn5uNgm0zr7Rct
 K1P/vTRC5UMmnXl+rAP69/TzXKAmeZPuHXhHYjvm8+S/rOChDZQ897Rm8
 88dx7kSlDRWkNd8LFuKGoeEJDQOkAr3Bn9+5ZLyyq0PNcDfIGRHxPxQ8t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="363055638"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="363055638"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2023 00:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10854"; a="895787897"
X-IronPort-AV: E=Sophos;i="6.03,203,1694761200"; d="scan'208";a="895787897"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 Oct 2023 00:34:07 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Fri, 6 Oct 2023 00:35:38 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Fri, 6 Oct 2023 00:35:38 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Fri, 6 Oct 2023 00:35:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rss7ESLFL8uZkRBPRS1eUNyWB5aeKntUeCWEjXF2mnKoyy7R4BHuAkI7P64EiuY6qTiEEWXk4RTkGhtmRoD1/I5DWD56Mtpu3gyl6reha3e5QuiZOG3uUHBv04q+JsXpKXN1gR1YhIq0Q5AOQQsNZJrEnVwGkHqAI/KSBBetO0Enfw+emkpPZAxNrcguFEWIaAjZu4A5RvhWxYjkP2MxKrq11yKnNckhEiJtwo1KLXCT0gteUYzZgtsn2JzBq6Vx1K+7RqqrXrnIaEBKD0FF3WhfaEIaKp+uTRT9mGdC8F3X0olkMe1G741wkYJrTL3tFOQZYruIARVcys5ff37U4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XlROuj3Sx0n1k53G6GPWXOymqnN5VX5ai/Nli8XxFOw=;
 b=Tjr08Wo272yHdhpWWRz4EufTGS+Lo3bIrogKT5oQy158LSepm6W953ljsDrWcXBQy8qvw/u/dtUVj76T6oELj0ufIWoPTT35OgkHLga49M4rCeUzVP1b7fcSYVO0oqm9U0TDAllQoTZj3WRuvSo8XbAKktf98Lp/YkKZ32PHjFS27IZGjIIhhiK2KFMeOzbfG5SQR1jPtkQ6q5OZPfhhmt6g2/LdHyn/yzVbJLlG5E7K3aZaa+x6Udg3TuzEhD6sK/hF35iAOWOsIKtuGl4DLpORsxD2N0BYktmtSY74Ca2H2g46RDHpKeus8K3mJI+TX04jJQ1k1AcDJF65YI+hSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MW6PR11MB8391.namprd11.prod.outlook.com (2603:10b6:303:243::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.37; Fri, 6 Oct
 2023 07:35:36 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::15c8:5319:c6bb:323c%7]) with mapi id 15.20.6838.030; Fri, 6 Oct 2023
 07:35:35 +0000
Date: Fri, 6 Oct 2023 13:05:24 +0530
From: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Message-ID: <ZR+4vN6XBsXx7UqL@bvivekan-mobl>
References: <20231003125217.3350838-1-lucas.demarchi@intel.com>
 <20231003125217.3350838-5-lucas.demarchi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20231003125217.3350838-5-lucas.demarchi@intel.com>
X-ClientProxiedBy: MA1P287CA0024.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::25) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MW6PR11MB8391:EE_
X-MS-Office365-Filtering-Correlation-Id: 08d087b0-ab4e-4444-04c7-08dbc63ed448
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SQ+4zUEssOWPfgwSbRG2mNQlceG2fii4KujoPR27SowzxTWbQ32ly6XUvrFztKh33U2ISrIJyC0i3vDGi0eduhdUHA2O8MhXFh3ZL3n6e0o5zpsKoVcl1ycvuEzh0G1fP0UKqisW2Ntui8upD8c/oMd48KvAaSEB8ctzZP43bC5LPK5C3oDFhsVppfur1sag5fxikgMN5qljE3ut1zKLukbjt7wWOxA3L/LZdGWxlmb7EwVFLmX27g+6rrL/IKeRlKr5y4erSleltg/Z4qM04ov14KAgot4yaW9DZPzyVnzqOYQ1s/hbiHqIrBrI3VUO2tZZsBGUzYqtpknot9GyJAZUpWLbsnTlEX645Ucum7SM4oQiSPDddw9yjLyUQ5HA9dXRokFOi+PcXfKl+QsEXMdQBixQu2NJRTV4xaBvmhwtyy3U4UbUVh9njJ9Cf3Vcow2MuIj9arOwK31xUcAYo3k9yQxgvVtP+MZWS8FuxYdVSTnCA5MeeVqidGT22x3kyIHoNVkiQP3b0VZmd6RopeTAdKnCPB05Tqr8gX89FhSi/bjoAnNgBC4/LZVDXYcBXZsF/S6U3cQbi3+Jixvt3v333I8H9u7wG/FfI6noVTg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(376002)(136003)(346002)(366004)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(2906002)(44832011)(8936002)(8676002)(5660300002)(4326008)(316002)(41300700001)(66556008)(66946007)(66476007)(33716001)(26005)(6666004)(6512007)(6506007)(53546011)(107886003)(9686003)(82960400001)(83380400001)(86362001)(38100700002)(6486002)(478600001)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmYwWnhmT21kQlBDVW53R2NweXRwY0dxSm5WZk9iMTNsN3E4c0V2eExWL3E0?=
 =?utf-8?B?cDhoMHE0eDBybS9wY004L1hocGNmYm12R1g1bkw0K05pRnQwSS9OY1IxRU9E?=
 =?utf-8?B?bjNzcjZQeis3T24veVZXN3M3U2hwNWY3ekNqUHhxckUxZFpsZnllb1dBU0Nj?=
 =?utf-8?B?aDRiU2ppODVNWGxZU1N1eDVwWnBMbmwxeXZsbE51WUZmN0RVUVllZWhwcW5u?=
 =?utf-8?B?WFFFdFBMdy9lSDVJd3c3ZzQzUjNSb0dOcmg2QklTZVhlK3IvdzBKeE0yb1Zk?=
 =?utf-8?B?Y0NWM3BSVFlaQmo5QXB0R2hpYUxrZnUrY2lLdW5naktBVWFtaG5PZHJsUGFC?=
 =?utf-8?B?V294Vjg3UUtDRnJSSkFkZ214Qy8xQi9MajhYZ2htUzEzbE5uTHRIU0lsOWxK?=
 =?utf-8?B?Z2lSeXNoWkZ5dXFTMytJYTl5cTUzZHA1VEhEQ0JJQWFmVytTbzNqcEFhR1VG?=
 =?utf-8?B?MHl1S3dsTmJmVWFMb3FCRFFYQ1N0UDhlQnl3eGJjNVpJbTlyUVM2TW1jVGJB?=
 =?utf-8?B?SWszSlNmR3FaVXdvWXlmNXJyQXdDTEloOWtMYlI2Tkk0K0dIbFA5TjFrMGJI?=
 =?utf-8?B?Ry9kVTVTcUZiWDZHSWZYcGsxNkJIbXM5SHIzbEVtbGFjM1BYT0gxM3RHT0hW?=
 =?utf-8?B?Z2pJWElvdnUwUUxleEhiendKdTg0dEFqL0FxWnZpOGtZdUlId2RaZHFOV1Vx?=
 =?utf-8?B?ek1XTldONDBRQkh4T0tVNU5TSVl0a2xPcU9sVXN5S0NoaTNPUzdpRGVERzJu?=
 =?utf-8?B?RWhpMS9KU0sxcGlRbzE2RkNnOTFUenl0VmdqejFBY05udG1oUkt1NmM3SXN5?=
 =?utf-8?B?dFRKbTVITlY4OXk1R1BIQVoxSEZ0MGVFUjRPUUpuc1NyLzVFOCtRbnJuUUpy?=
 =?utf-8?B?NFZDT1lrU3c5UVN5MzMrRkJlMDB6cUx6TTVpWEdTZm5hVk8wa3pVZmlKSzRk?=
 =?utf-8?B?VFdYcHAvK0h0TmkvWVc3RUxNNXN0WWU5NGZQL2xHVUFRRFFFYk5EOTZkbnk4?=
 =?utf-8?B?dXl5VkRHMFRzZ2JmSmR1MHpzSlc2WndvMTdmZ2Q1M04xV2tKSE0rR1pCWmxR?=
 =?utf-8?B?SzBidHRHVnNQVTRtOVhZZnpQRUwxS0ZuZTBBVnQySk5OeGlONVN2dFUwWXh5?=
 =?utf-8?B?Mkx0R3pFZnpUNmhmSXp3cTlESEJsSWJ2Um1zM0syZjRXZ2hndXpBNGlva0JP?=
 =?utf-8?B?NW1rVUR4NUJzbnRPWFFTZjNIeWNTeUFLVDc2bGdqT3VXYmQ2NWRBVEVoOXYy?=
 =?utf-8?B?MTVNYnovWElTZ3ZIbXlDMnBPay9MOTBwSlJEaWZyazkxQ3k3djhhVVZoRDcx?=
 =?utf-8?B?OXAxaUM1dFhOR1FRVVJMK0NMR3EyTFZHZWJPQ3M0VTN2b3BLTk9YcWV4MUt1?=
 =?utf-8?B?YXVHWHV2TUJUWmQyN2RsMjhQZW9hUWNRRlRXb0dCUGdJcVJManZYSTB2TFMx?=
 =?utf-8?B?YnhrN3pNVjgvMCtuSDVSeFpPY2d6YnF2UG1DRFpjbUlBWHFSeXdtNTJFZWhk?=
 =?utf-8?B?UzlrS2RhVnBzZzU2Z0RZODdaNWpOaGhHMW84c20yNkprU25JTGlicEQvRXk0?=
 =?utf-8?B?Q0N0dVZYdmxSRDNENHBWYjJpcWhZaWxRTUxYNjhPN1hhNXhVMy90SVBYYSs3?=
 =?utf-8?B?aWZXVDFaNmtGVGR4SlhoK0ExNHJ1TTZYYVFuNHl1ZVZLenhvay9HeTJxM28y?=
 =?utf-8?B?YzFkWlFJeTk2YTAzVU5ET215VVlCcCtSMk16NnA1MkZmUjh2V3lwdGlUNDIw?=
 =?utf-8?B?K0VrNWhLcjdMeUNUN2dsUTE0UlJqRUJGTzNVUFpoOEJVTGFES0RQVDM1RXdp?=
 =?utf-8?B?ZFVKYXlIRXZjRG9VSG9RbHNaYUxLNCtZekJkemJjdUswTE5vZDRKSDg3TkM0?=
 =?utf-8?B?dzF3YXhyM1NTVjl1cE5yTm5nTUFjc0lzd2h6VTlBaldmemdUZStZTFJsWm0v?=
 =?utf-8?B?anJGY01lUjdJclBhVVR3TVdvTDM5REU2aThIczlZTW5MTG1lclM4SEtrQ2t6?=
 =?utf-8?B?d0NueGNqYk56NzhKaytObGpYbjk5MHY3Z1BYdjNWb0R0eVk4N1o2RWI4cy9x?=
 =?utf-8?B?SGhoM0dwdFdlSDB0aDArVUNrVS9jSDdYZmZPeTEvVDZ5MG5GRDlMdnZ5eFNK?=
 =?utf-8?B?VlVjcEYxSmxSOGpIeGNRQ0FacG1YSkZFVG50ZThmNHE5amJiV0RFTVpjKzBl?=
 =?utf-8?Q?OsO9hXqUViLiAtuGPqOXjM4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 08d087b0-ab4e-4444-04c7-08dbc63ed448
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2023 07:35:35.6648 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BI3MpW+J9tWgcrHoDqyfOAuAPLCxSYLVU0v/uCji2YaBTWsqCc1HdBAmhUztSgRDhgL0cTFr3xppTcEQhwc0rLN8kUlzxziwf6hdGNc6LfL7UyTm0ndbaJSgjoXuqyqH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8391
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/7] drm/xe/xe2: Program PAT tables
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
Cc: Matt Roper <matthew.d.roper@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On 03.10.2023 05:52, Lucas De Marchi wrote:
> From: Matt Roper <matthew.d.roper@intel.com>
> 
> The PAT tables become significantly more complicated on Xe2 platforms.
> They now control L3, L4, and coherency settings, as well as additional
> characteristics such as compression.
> 
> Aside from the main PAT table, there's an additional register that
> also needs to be programmed with PAT settings for PCI Address
> Translation Services.
> 
> Bspec: 71582
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> ---
>  drivers/gpu/drm/xe/xe_pat.c | 92 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index 4668ca3932c5..296763594370 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -10,10 +10,18 @@
>  #include "xe_gt_mcr.h"
>  #include "xe_mmio.h"
>  
> +#define _PAT_ATS				0x47fc
>  #define _PAT_INDEX(index)			_PICK_EVEN_2RANGES(index, 8, \
>  								   0x4800, 0x4804, \
>  								   0x4848, 0x484c)
>  
> +#define XE2_NO_PROMOTE				REG_BIT(10)
> +#define XE2_COMP_EN				REG_BIT(9)
> +#define XE2_L3_CLOS				REG_GENMASK(7, 6)
> +#define XE2_L3_POLICY				REG_GENMASK(5, 4)
> +#define XE2_L4_POLICY				REG_GENMASK(3, 2)
> +#define XE2_COH_MODE				REG_GENMASK(1, 0)
> +
>  #define XELPG_L4_POLICY_MASK			REG_GENMASK(3, 2)
>  #define XELPG_PAT_3_UC				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 3)
>  #define XELPG_PAT_1_WT				REG_FIELD_PREP(XELPG_L4_POLICY_MASK, 1)
> @@ -67,6 +75,64 @@ static const u32 xelpg_pat_table[] = {
>  	[4] = XELPG_PAT_0_WB | XELPG_3_COH_2W,
>  };
>  
> +/*
> + * The Xe2 table is getting large/complicated so it's easier to review if
> + * provided in a form that exactly matches the bspec's formatting.  The meaning
> + * of the fields here are:
> + *   - no_promote:  0=promotable, 1=no promote
> + *   - comp_en:     0=disable, 1=enable
> + *   - l3clos:      L3 class of service (0-3)
> + *   - l3_policy:   0=WB, 1=XD ("WB - Transient Display"), 3=UC
> + *   - l4_policy:   0=WB, 1=WT, 3=UC
> + *   - coh_mode:    0=no snoop, 2=1-way coherent, 3=2-way coherent
> + *
> + * Reserved entries should be programmed with the maximum caching, minimum
> + * coherency (which matches an all-0's encoding), so we can just omit them
> + * in the table.
> + */
> +#define XE2_PAT(no_promote, comp_en, l3clos, l3_policy, l4_policy, coh_mode) \
> +	(no_promote ? XE2_NO_PROMOTE : 0) | \
> +	(comp_en ? XE2_COMP_EN : 0) | \
> +	REG_FIELD_PREP(XE2_L3_CLOS, l3clos) | \
> +	REG_FIELD_PREP(XE2_L3_POLICY, l3_policy) | \
> +	REG_FIELD_PREP(XE2_L4_POLICY, l4_policy) | \
> +	REG_FIELD_PREP(XE2_COH_MODE, coh_mode)
> +
> +static const u32 xe2_pat_table[] = {
> +	[ 0] = XE2_PAT( 0, 0, 0, 0, 3, 0 ),
> +	[ 1] = XE2_PAT( 0, 0, 0, 0, 3, 2 ),
> +	[ 2] = XE2_PAT( 0, 0, 0, 0, 3, 3 ),
> +	[ 3] = XE2_PAT( 0, 0, 0, 3, 3, 0 ),
> +	[ 4] = XE2_PAT( 0, 0, 0, 3, 0, 2 ),
> +	[ 5] = XE2_PAT( 0, 0, 0, 3, 3, 2 ),
> +	[ 6] = XE2_PAT( 1, 0, 0, 1, 3, 0 ),
> +	[ 7] = XE2_PAT( 0, 0, 0, 3, 0, 3 ),
> +	[ 8] = XE2_PAT( 0, 0, 0, 3, 0, 0 ),
> +	[ 9] = XE2_PAT( 0, 1, 0, 0, 3, 0 ),
> +	[10] = XE2_PAT( 0, 1, 0, 3, 0, 0 ),
> +	[11] = XE2_PAT( 1, 1, 0, 1, 3, 0 ),
> +	[12] = XE2_PAT( 0, 1, 0, 3, 3, 0 ),
> +	[13] = XE2_PAT( 0, 0, 0, 0, 0, 0 ),
> +	[14] = XE2_PAT( 0, 1, 0, 0, 0, 0 ),
> +	[15] = XE2_PAT( 1, 1, 0, 1, 1, 0 ),
> +	/* 16..19 are reserved; leave set to all 0's */
> +	[20] = XE2_PAT( 0, 0, 1, 0, 3, 0 ),
> +	[21] = XE2_PAT( 0, 1, 1, 0, 3, 0 ),
> +	[22] = XE2_PAT( 0, 0, 1, 0, 3, 2 ),
> +	[23] = XE2_PAT( 0, 0, 1, 0, 3, 3 ),
> +	[24] = XE2_PAT( 0, 0, 2, 0, 3, 0 ),
> +	[25] = XE2_PAT( 0, 1, 2, 0, 3, 0 ),
> +	[26] = XE2_PAT( 0, 0, 2, 0, 3, 2 ),
> +	[27] = XE2_PAT( 0, 0, 2, 0, 3, 3 ),
> +	[28] = XE2_PAT( 0, 0, 3, 0, 3, 0 ),
> +	[29] = XE2_PAT( 0, 1, 3, 0, 3, 0 ),
> +	[30] = XE2_PAT( 0, 0, 3, 0, 3, 2 ),
> +	[31] = XE2_PAT( 0, 0, 3, 0, 3, 3 ),
> +};
> +
> +/* Special PAT values programmed outside the main table */
> +#define XE2_PAT_ATS	XE2_PAT( 0, 0, 0, 0, 3, 3 )
> +
>  static void program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
>  {
>  	for (int i = 0; i < n_entries; i++) {
> @@ -102,9 +168,33 @@ static const struct xe_pat_ops xelpg_pat_ops = {
>  	.program_media = program_pat_mcr,
>  };
>  
> +static void xe2lpg_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> +{
> +	program_pat_mcr(gt, table, n_entries);
> +	xe_gt_mcr_multicast_write(gt, XE_REG_MCR(_PAT_ATS), XE2_PAT_ATS);
> +}
> +
> +static void xe2lpm_program_pat(struct xe_gt *gt, const u32 table[], int n_entries)
> +{
> +	program_pat(gt, table, n_entries);
> +	xe_mmio_write32(gt, XE_REG(_PAT_ATS), XE2_PAT_ATS);
> +}
> +
> +static const struct xe_pat_ops xe2_pat_ops = {
> +	.program_graphics = xe2lpg_program_pat,
> +	.program_media = xe2lpm_program_pat,
> +};
> +
>  void xe_pat_init_early(struct xe_device *xe)
>  {
> -	if (xe->info.platform == XE_METEORLAKE) {
> +	if (GRAPHICS_VER(xe) == 20) {
> +		xe->pat.ops = &xe2_pat_ops;
> +		xe->pat.table = xe2_pat_table;
> +		xe->pat.n_entries = ARRAY_SIZE(xe2_pat_table);
> +		xe->pat.idx[XE_CACHE_NONE] = 3;
> +		xe->pat.idx[XE_CACHE_WT] = 15;
> +		xe->pat.idx[XE_CACHE_WB] = 2;
> +	} else if (xe->info.platform == XE_METEORLAKE) {
>  		xe->pat.ops = &xelpg_pat_ops;
>  		xe->pat.table = xelpg_pat_table;
>  		xe->pat.n_entries = ARRAY_SIZE(xelpg_pat_table);
> -- 
> 2.40.1
> 
