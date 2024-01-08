Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EB70C3DA6E
	for <intel-xe@archiver.kernel.org>; Mon,  8 Jan 2024 06:43:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2BB10E17D;
	Mon,  8 Jan 2024 06:43:39 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A942610E17D
 for <intel-xe@lists.freedesktop.org>; Mon,  8 Jan 2024 06:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704696217; x=1736232217;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=vuLvJUxTyBxtAB699AWsZXqUreWKn7LDV3FQj672x0Q=;
 b=T0UIbcV++rE5S6A/tDsir6jO50i2NMWM4FepDCf6OdQn5+GNRJpe1gQF
 leD+3ya5AJ+EiO2f1NdOnQBZ3PAEeCTSB3iQSHTJ/RKc5KCV86EqjJuYR
 NkiMTl0Ba2SiWLSlndNCv4U/4dw3GdQoDN1BEbPPLvqujaRiyi726njQu
 U1sciYsnNRUNHSTqRbfhu8d8wtqhqMSv7yFCHfXB11za7qof7SE8ksqox
 M5v/7FXbYJerr12/xb/wqYa7OiK6xrJTeYBeyBF14Eelqu5jxwXUUcMOC
 OxAGm4Gj2jYGW2egq8zTgW1zZBpzdlFN4+2s2/0WTHkbicLsDRp4imJ66 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="396687031"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="396687031"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2024 22:43:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="904710330"
X-IronPort-AV: E=Sophos;i="6.04,340,1695711600"; d="scan'208";a="904710330"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Jan 2024 22:43:36 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 7 Jan 2024 22:43:35 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 7 Jan 2024 22:43:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 7 Jan 2024 22:43:35 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ATeIkU4/hlI6FamyqX8TibLhUPFizpkpZ7mXNxZ7OMClh4WPOlA9TUnMl/S+f8cUdhoHkNlsf0TrsGWZNb7QuEVjPeIxYAzX8fppiQzNuYXRP+mTOizy3zJ6uSwEZ1qtEP2z5h/SHT0oQGYsp5r5ZmDcNOfnjqPSGMVa0ISYG6BYV5OpNmqU0yh5nT/xsYz9EHsJAP6ywi0NwWIcCaJADURjZidmdtDJXKEbpC7YtjQJcQLldaXVzjZtMwNvrF2zBfZfloULUFMiM48jwYZfFu+FTbQNoUqnVshoWKiSbsiUOffvYV+zqUxUJqz0hGAhOY0hBmYJDOQolgYT/sfegQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIud/LR8ywTy20Zn+bLpR+az/uzp7PLEk8PmVW2HC7c=;
 b=SKm30u/FhXxD4RAzECZCtbU62hlHRBe02RJLo5qo53NG6P85ZK2rLapHi7XBRXL6R/fHjUh2NTg6asrN+aTVF2KzzsMC/2nnt8pZDxgUl+T6O+YX/B1eXCRtnxH/Jg+0Acv58oSKdu/YgGCA1ON6AEjiZzjEdrpFs9VjksCmopizL8qVLS8/97zTpkoJerSTgjrPUE1yiUgCB/NaM0Bj6ORP4ZoG9APWdPVYniUBiEtWItNbw52AqKNc/ix4i7Pp5f7rEWT5ly0UWIlsJK68MQ9SvQ5Q74jjAlDF8AM/X2dgGPmXuXqki+0wl9pBfopK1VnMq4E+T9jIWhBDqftInw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN2PR11MB4568.namprd11.prod.outlook.com (2603:10b6:208:266::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.21; Mon, 8 Jan
 2024 06:43:33 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7159.020; Mon, 8 Jan 2024
 06:43:32 +0000
Message-ID: <583d82e9-ea11-448a-ab1c-4fda27eda143@intel.com>
Date: Mon, 8 Jan 2024 12:13:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v8] drm/xe: Add vram frequency sysfs attributes
To: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20240105124503.1821966-1-sujaritha.sundaresan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0232.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN2PR11MB4568:EE_
X-MS-Office365-Filtering-Correlation-Id: 76f2151b-36c3-4242-85a9-08dc101521bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pii/lP+Zzq97yxeSQBMEoBHfJZGrhyEXx8sTHLdAtyOisbO6rdlXd655Mc884gEJoRIxSNYlr2vlptg5/w3qt803r6STloFuq/Qxn+Xg2xt68zrfnHnfqQso/6/vI6TSNpZwGrwNhECh7ZFzmaOMJPJf9+z5hfjoD3WvAB4boNQVt+jhxUwpJJSUNPIbmyN7LNS1KIyoT2YBCr2iK4H2cAdLtpSgwsXWs6+M6pZNVVizzF+WMzV5GwVl83EaQApmML9+z2FPkD15AkJf59FmiyioH0VvvxpL6N1YcHjVzhgOnS90oyrE5kQ3T0ZIr4C6bI3ecNjLmRs4+BKUnCGn4Ul3WZFiIx9pS4MZ7AfXVi81TTk+KUH/V5kKJpPqmAqvVoZkhTCXmUWqG1C5pNJKToydbkXH1xdpCCr7U2Bvf+mjHRdoni2vG24vcc/4nfN5iXzjRwiBKd8doTCv3KjM23YBZEBPH8NqWFuMIQu8IUoxvxV1agviBDuHvEmKTf3o8FK2w4suMJSwqjLxIBr6LosI9v3E24wKCbMBLKRtcF6zN4lJWndJdi+ha1cXFbEIHPWhPqQQXAQrSvkrCiTEGD+hEvPDicvpp0TcAXXR67a6ss1FDDL03Z1YTTkl/OYQPs1Np3FtTJEjgEMuP4+YXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(346002)(39860400002)(376002)(136003)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(2906002)(38100700002)(5660300002)(82960400001)(86362001)(41300700001)(31696002)(31686004)(316002)(8676002)(36756003)(8936002)(6512007)(2616005)(6486002)(66556008)(66946007)(66476007)(26005)(478600001)(6506007)(6666004)(53546011)(44832011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUsvWHFFUXlnb3VWTXZZZDIxZmpzQVQyempHYndjWExqbktNZUtFRHg1cHJq?=
 =?utf-8?B?UkNlWnl3MWNYbE4rWW54MDliU21QWktQdnpBODJNT0s5Z29JZlV1NWk3c09O?=
 =?utf-8?B?cTV0TGFXWHdvWGJZTGRCcjhSYWtrU3UzUmI1QXFYNlhXbEJ6YjdaNHBJMUJt?=
 =?utf-8?B?eldEN3NNaTduM2ZYNWNlUVZzYVRXVTNnS1dSVkxtTVRSQks3ZXJlOXJhN2xM?=
 =?utf-8?B?MEFHc2pHUVpDREVqTTVMZUdrMTkxYjdtSk5UYzd3MWdyeW9BeEtkb2lhOEZR?=
 =?utf-8?B?RStUaXRmWmw2bFI1blhGWW1zWWc2ZytZcTlRUG1NNXhXRDJJcUxUck1mR1Mv?=
 =?utf-8?B?N1UramVKVDhIQnM4UVEwMW5BSWd6UGdvTTgyZW5JR0JCMGoyTkkwWEFMVUNu?=
 =?utf-8?B?aC9ZVmh6c2RYVGJhd0NtZ0p4RVlQM2VHNjR4L0Q5YThXVGlGN0N6em83N2k0?=
 =?utf-8?B?cGl4dFlzUXFSeU1IY2t6WjJidVZyRWRhMWNmZXhqaFU2eTZ4UXVsZ0FULzVx?=
 =?utf-8?B?eXNUZG0rYVA0V2lJRFh3WFhFUm5wRzZXbmsvTGRPSHRLUEZmQjNLV2RqSGMr?=
 =?utf-8?B?ekd1UGtBdDlQVVNKVnNBOThUeUx5QzZNU2VnNjIybi82dnVSV2JFL2NaMnEv?=
 =?utf-8?B?RDQwR1k2dWM3R3hsN1N4bkIwVm16clg1M0svNTliQ2U2d09YNFdxK0cwLytG?=
 =?utf-8?B?ZmUrb0o3dzJmM0MycE96ejFNdUo5Mm53d3o0YXphMWNLRm1rQjNVUUIrb0ht?=
 =?utf-8?B?S0tYbHlhMmdMbXJ3OE42V2xXNmJScnFZeHZuWHQ4Yk1rQjJnYkVUbW15TWI3?=
 =?utf-8?B?Vjh4eXorN2MyMnNoeGgvTmdwRFYrdldBL3VpRk03YXN5R2ZKa2o2L284QWlK?=
 =?utf-8?B?RVJOZFRsRmd3QVI3VnhFMWZLeklOYkZQQlBaUjVyV25RdHlTOEdmeGJZc0xy?=
 =?utf-8?B?SHg4MElFSjlmSGluNUZmV3JrNzlEakhPWEl3SElRMVQ3TGtad3ZFTlNSMmtp?=
 =?utf-8?B?eHA1Q0xLampSaEFYdVduY1J6dFBSajhac0pNUXkzd3FCRit5cDlmcEtWMkNq?=
 =?utf-8?B?WlNkMHM2U24xUTBDaFJ6M0pnczYvenVkZEQzVG83VUFPVFlVMWlWNDZlNGxV?=
 =?utf-8?B?ZE45cjMwdUZtN29hRGxyZEk0Q3VDa2FvMytEUXBZRVI2RitQTThrUml4am9l?=
 =?utf-8?B?a09wRDFLbjU2UjhaWHE2TFFGT1NaVkp0TEQrdjRqVWNVVFRsa09QZ05TejFs?=
 =?utf-8?B?THRnTDRZbTlBWVRxMi83Zm5aa0NFYjB2Y2twUWhYVEJlb1RtUksxdTNhaFF2?=
 =?utf-8?B?REVjclNOVFdKOWx1aWxZcm1NUWJYR3R1Qzk3enExelRvSkYvcGpSV25TUlZx?=
 =?utf-8?B?UC9XSGVZNVNHZ3JzSGJBanJpV20vVlJhNTI1QkJhOTRjK09lKzlVaWZOc2V6?=
 =?utf-8?B?R0h0ZTBRRFlVaHNWWWhBdy9LZ056YWp5YlhXUldWOG9UdGdaZTB5anBCNVFU?=
 =?utf-8?B?cENwVkRNN2FlWnlwY0puRkNacXdWSHd1OHI4TW82UnM1eEtOeXoxN2J2UDBs?=
 =?utf-8?B?YmRGOHAyR2hJbitQeTBtUmlnVUpaV0k4Njd0bFhtcnhLVDNlN2ZGRElGRGRp?=
 =?utf-8?B?eHZZWXdJVktvVzVXckRKSXVYVUtVZFdCT0tSZjlqN2tFMEg4V0tVQmowTS9x?=
 =?utf-8?B?NWk3Q2xOS0hPY0hiNTFnTHBHNjhjaXVYYUoxTUZXSTJsZUl1SERPa2d5eGlz?=
 =?utf-8?B?ZEtMeTVJVHVNcVF4dHY3aW04c2lBZW9pblpXMHBtRGc5YjNVSGNYaXNWY0Rz?=
 =?utf-8?B?ZzF5OE9TUzVDZmpRclhURm9MM2lwdFFYUnBUMWppcHc3M0plZVk3ZHVyQ3pl?=
 =?utf-8?B?bCt5NjcvSlk0eUhYSkRkbGorSkcyeEJtdUVnN3Z1dGZwaFBCUzZEV3ZTbEF6?=
 =?utf-8?B?a3ZFUEd5ZGdQdUUyZGtUb09qL2lSYWs3cENKZ2JoRGNTcUp5cERpYzRDTlBh?=
 =?utf-8?B?UUltM1FaakEzYlU5bFo2TVk2U2g4cEQxaWJMSlM2Y25HS3htVytoaDNNMVg1?=
 =?utf-8?B?bE1IUjhzVHdpazgreEgyU1B3cGkxUitLODlHQWlZRVlwU09PeVRjckQvTndO?=
 =?utf-8?Q?di/La3OzY1bzfdmlZnD9fzkxZ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 76f2151b-36c3-4242-85a9-08dc101521bd
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2024 06:43:32.7676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWhaOgURaMRgHw2+KSlN4ausIuTkHmCwdmnoi5dakf/8ZCpDYhNYO9Q/D6fN21z/SR7CS8rD9og/r7tGoDetLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4568
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

Hi Suja

On 1/5/2024 6:15 PM, Sujaritha Sundaresan wrote:
> Add vram frequency sysfs attributes under the below hierarchy;
> 
> /device/tile#/memory/freq0
> 			|-max_freq
> 			|-min_freq
> 
> v2: Drop "vram" from attribute names (Rodrigo)
> 
> v3: Add documentation for new sysfs (Riana)
>      Drop prefix from XEHP_PCODE_FREQUENCY_CONFIG (Riana)
> 
> v4: Create sysfs under tile#/freq0 after removal of
>      physical_memsize attrbute
> 
> v5: Revert back to creating sysfs under tile#/memory/freq0
>      Remove definition of GT_FREQUENCY_MULTIPLIER (Rodrigo)
> 
> v6: Rename attributes to max/min_freq (Anshuman)
>      Fix review comments (Rodrigo)
> 
> v7: Make documentation more verbose
>      Move sysfs to separate file (Anshuman)
> 
> v8: Fix platform specific conditions and add kernel docwq (Anshuman)
fix typo before merge
>      Fix typos and remove redundant headers (Riana)
> 
> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile        |   1 +
>   drivers/gpu/drm/xe/xe_pcode_api.h  |   7 ++
>   drivers/gpu/drm/xe/xe_tile_sysfs.c |   3 +
>   drivers/gpu/drm/xe/xe_vram_freq.c  | 129 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vram_freq.h  |  13 +++
>   5 files changed, 153 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.c
>   create mode 100644 drivers/gpu/drm/xe/xe_vram_freq.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index df8601d6a59f..17884e422cec 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -139,6 +139,7 @@ xe-y += xe_bb.o \
>   	xe_uc_debugfs.o \
>   	xe_uc_fw.o \
>   	xe_vm.o \
> +	xe_vram_freq.o \
>   	xe_wait_user_fence.o \
>   	xe_wa.o \
>   	xe_wopcm.o
> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
> index 5935cfe30204..f153ce96f69a 100644
> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
> @@ -42,6 +42,13 @@
>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>   
> +#define   PCODE_FREQUENCY_CONFIG		0x6e
> +/* Frequency Config Sub Commands (param1) */
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
> +#define     PCODE_MBOX_FC_SC_READ_FUSED_PN	0x1
> +/* Domain IDs (param2) */
> +#define     PCODE_MBOX_DOMAIN_HBM		0x2
> +
>   struct pcode_err_decode {
>   	int errno;
>   	const char *str;
> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> index 0f8d3e7fce46..ed60d12f5cf0 100644
> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
> @@ -9,6 +9,7 @@
>   
>   #include "xe_tile.h"
>   #include "xe_tile_sysfs.h"
> +#include "xe_vram_freq.h"
>   
>   static void xe_tile_sysfs_kobj_release(struct kobject *kobj)
>   {
> @@ -50,6 +51,8 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>   
>   	tile->sysfs = &kt->base;
>   
> +	xe_vram_freq_init(tile);
> +
>   	err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini, tile);
>   	if (err)
>   		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vram_freq.c
> new file mode 100644
> index 000000000000..ea8b4511767c
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -0,0 +1,129 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +#include <linux/sysfs.h>
> +#include <drm/drm_managed.h>
> +
> +#include "xe_gt_types.h"
> +#include "xe_pcode.h"
> +#include "xe_pcode_api.h"
> +#include "xe_tile.h"
> +#include "xe_tile_sysfs.h"
> +#include "xe_vram_freq.h"
> +
> +/**
> + * DOC: Xe VRAM freq
> + *
> + * Provides sysfs entries for vram frequency in tile
> + *
> + * device/tile#/memory/freq0/max_freq - This is maximum frequency. This value is read-only as it
> + *					is the fixed fuse point P0. It is not the system
> + *					configuration.
> + * device/tile#/memory/freq0/min_freq - This is minimum frequency. This value is read-only as it
> + *					is the fixed fuse point PN. It is not the system
> + *					configuration.
> + */
> +
> +static struct xe_tile *dev_to_tile(struct device *dev)
> +{
> +	return kobj_to_tile(dev->kobj.parent);
> +}
> +
> +static ssize_t max_freq_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_P0)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused P0 for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(max_freq);
> +
> +static ssize_t min_freq_show(struct device *dev, struct device_attribute *attr,
> +			     char *buf)
> +{
> +	struct xe_tile *tile = dev_to_tile(dev);
> +	struct xe_gt *gt = tile->primary_gt;
> +	u32 val, mbox;
> +	int err;
> +
> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, PCODE_MBOX_FC_SC_READ_FUSED_PN)
> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, PCODE_MBOX_DOMAIN_HBM);
> +
> +	err = xe_pcode_read(gt, mbox, &val, NULL);
> +	if (err)
> +		return err;
> +
> +	/* data_out - Fused Pn for domain ID in units of 50 MHz */
> +	val *= 50;
> +
> +	return sysfs_emit(buf, "%u\n", val);
> +}
> +static DEVICE_ATTR_RO(min_freq);
> +
> +static struct attribute *freq_attrs[] = {
> +	&dev_attr_max_freq.attr,
> +	&dev_attr_min_freq.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group freq_group_attrs = {
> +	.name = "freq0",
> +	.attrs = freq_attrs,
> +};
> +
> +static void vram_freq_fini(struct drm_device *drm, void *arg)
> +{
> +	struct kobject *kobj = arg;
> +
> +	sysfs_remove_group(kobj, &freq_group_attrs);
> +	kobject_put(kobj);
> +}
> +
> +/*
> + * xe_vram_freq_init - Initialize vram frequency component
> + * @tile: Xe Tile object
> + *
> + * It needs to be initialized after the main tile component is ready
> + */
> +
> +void xe_vram_freq_init(struct xe_tile *tile)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct kobject *kobj;
> +	int err;
> +
> +	if (xe->info.platform != XE_PVC)
> +		return;
> +
> +	kobj = kobject_create_and_add("memory", tile->sysfs);
> +	if (!kobj)
> +		drm_warn(&xe->drm, "failed to add memory directory, err: %d\n", -ENOMEM);
> +
> +	err = sysfs_create_group(kobj, &freq_group_attrs);
> +	if (err) {
> +		kobject_put(kobj);
> +		drm_warn(&xe->drm, "failed to register vram freq sysfs, err: %d\n", err);
> +		return;
> +	}
> +
> +	err = drmm_add_action_or_reset(&xe->drm, vram_freq_fini, kobj);
> +	if (err)
> +		drm_warn(&xe->drm, "%s: drmm_add_action_or_reset failed, err: %d\n",
> +			 __func__, err);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.h b/drivers/gpu/drm/xe/xe_vram_freq.h
> new file mode 100644
> index 000000000000..ae3ed6ce68f8
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
2024

Thanks
Riana
> +
> +#ifndef _XE_VRAM_FREQ_H_
> +#define _XE_VRAM_FREQ_H_
> +
> +struct xe_tile;
> +
> +void xe_vram_freq_init(struct xe_tile *tile);
> +
> +#endif /* _XE_VRAM_FREQ_H_ */
