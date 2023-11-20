Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B2BC197A0
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 20:09:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3665510E11E;
	Mon, 20 Nov 2023 20:09:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF5310E130
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 20:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700510988; x=1732046988;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=sJ3cwTrUAaDPWezTiTUamFW21C96NXMCgkVdLrHHn7w=;
 b=PsxrVr7UQrXj9DnNx2hBH+LJ/QgRUJQ9oZWBBwuQlWuJgrRLrNpxvAvt
 dGJwMSo6Rq9lcqP0amC84HnhZra8ocSKBycG/D26uRrI781aK39DKvK2u
 lkd/EGSAhUvPDPGCZRw1ZaVBrvtLcu3/q9B+TKaZml4OpDbWVQc+yHgra
 5fr17DaAOk9H6QIL0mR9pCVECI2iui632irBKx3+4h5TVy/ZxRNO47I+p
 wHXTEKhHEAMRP96ElcpRps2clcO+pw8RU5bWlhGI8noc8Gq4W+IthFfrs
 DUcOoBNcXmdrk4wnOfX2BsXL+3/qvRn8FDEuULVhAnUu4Vjjxq9mOPrv5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="477904015"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="477904015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 12:09:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="801302284"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="801302284"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 12:09:31 -0800
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:09:30 -0800
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 12:09:30 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 12:09:30 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 12:09:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Irq7ttP130njM/iKFw3NxZpwbgjAxtop/7e18+6v46OErzPAAyLdrPPsgKLGy/TG5k83w7lecKdBuY1OQ90A/tCKrAJ5lwCFaewCHkT2cjBM03/jxDpb/CLr0K3wU3oRRlpmJsz9HlkyAHjex3kKPd30sSvxAzBkFMQAzPQM2PkKHsswts+YxssaLNCXALwCreud/TaDYQOo/nqiqy7XB1MEiBFzLDO/i78g38oBxh2vsePplwnk5Po1YJ37lunN26Yjuk6MLQwNIlHis1WfvMMtMgJ/M7HhKV7aWxpHLsbBR3mY1rnQw2nJncLq7fH3oBLyxi0h3tuBy1OFDLpsBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLeMYBrlA7Mjzz2e02cyy9PmHDPm3bQ7ttp65ob1ys4=;
 b=dmz8XtyR5ra0aQ8EATJUg3O1bRWyhZ70MQXqx6iGUd27iCcbCY/K8N1YhgGxFprQWIY6AAkImndgM6/CXhpcpWte/AM08aofhd5KN6JkaEQ0VlLhOgZQTm6K9SOxoOHCEaGX0Xjt0UeJzDFft5++Po5FqzCptyk1weO7zUoZQMp07mjU+nS2+YSRjImMA2o+bLKNWnI2V01K61klwEfVN+HskEGku/1KiO7DkIn4E6MxaUjOtveeuCl9X6f9W0uvO/D+lsOr0nHZw3MDeL0EEp9OlWUC0YDq9l7QJVAHgg+M2Qs9qgmGHGHLxxyCkoYYLkX44AFXmbsJi7+vOWUXOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BN0PR11MB5693.namprd11.prod.outlook.com (2603:10b6:408:164::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.26; Mon, 20 Nov
 2023 20:09:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 20:09:28 +0000
Date: Mon, 20 Nov 2023 14:09:26 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
Message-ID: <fcj4ysjh3miaxnuqaoemjdw64m7xkzmnvhgefcyhhqr7wmvfao@4hbst6eluwrg>
References: <20231114130231.2299661-1-michal.winiarski@intel.com>
 <20231114130231.2299661-18-michal.winiarski@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231114130231.2299661-18-michal.winiarski@intel.com>
X-ClientProxiedBy: BYAPR08CA0067.namprd08.prod.outlook.com
 (2603:10b6:a03:117::44) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BN0PR11MB5693:EE_
X-MS-Office365-Filtering-Correlation-Id: 36adf7af-84fd-4448-ffa8-08dbea049982
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: naxgM83rlKR1Y7Q8L/BSxYiGbHpo6wPwBRFd5IV+f5D/r58Z7O7sqGc1z4WO2h3JRIi7HkhEgcxIy51KT4kdnFfuSAu8edwZZ4J8k5mEhiW+ZwAJf5GC+ZXpATxfeouQ6QoZ45dyN93zDVvO8Xg8Mu6O77txN6p0a2tIUizDgvy2XFxVMUn4oa1m7DHr3mlgMKhOGbDHaf8aPYDF7vR1gVUdQc0vBPKh7Nbzr4s4aqZwfipsjQxCM17V1OuZUF7URT/qSasVsLykChw1IAP0azSRWVaF78VHS2ky4S/u8uGqkC7AuHjLTOd2hyX4DpFCUMMP6NnrlNbxz1VFs1vm+oHobV13/S+UXajxCVTOSzbpLhcKXe9qZwuQCz1F6+acsIS9jK/EMklzE42QMqjQFDnT3Oq8h4Czh42dmW+BIrZ5nHXjmUhUJdQc3XyO1JMP4ZrZCvabxkgmoOU9X5OaJcCNEXAjWgRWLvscgVEmUsSH9ah+zpq4FOEbSecCcbiIUr0jPbH0+jk2E4yVj30WnNYKu6gK/LaR5ZLF7yYUZ2lWHZaVYnAbT+Aivifm48eu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(376002)(136003)(346002)(366004)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(26005)(5660300002)(2906002)(4326008)(6862004)(8676002)(8936002)(41300700001)(66476007)(316002)(66946007)(66556008)(6636002)(86362001)(107886003)(6486002)(6512007)(9686003)(6506007)(478600001)(33716001)(38100700002)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUVDZmZTS2JUdmFYNURBbTZpQ1NQSHVkN3Fnek9WRzljTG93RzVwWHFVRHNh?=
 =?utf-8?B?QU9RemRMYWExNGF4eTRpVGVQbnZ2RXQ1ekdiMFAra2x6THZFYlNNdXVQamd3?=
 =?utf-8?B?UmZxZTBPSC84dTdTWXZkeE5HMjhEeGtHZmJLR3IxM1RYbEthTHRjNjhlWEFL?=
 =?utf-8?B?aVpwV29uZGNtb2FNWDBRY2pjTjBjUXpIL1lMVU5LSGkxM2pMMklOcVFoV1BN?=
 =?utf-8?B?dzRyelNTQ05NbWFhekYveTVWd3BmekRjNjdFcDM5SzdkSnRtamFpZGlSVDRC?=
 =?utf-8?B?SHlTOE1WTUlVYm43UWhkZlJlbVRjTFVDaGcxaC9VNlZuWlozVG4vOTJVdkVv?=
 =?utf-8?B?MWhFdStLUk9SK3hxV1FrbWlQZGtZaENNenpsajJndWJMNThSbkJPWmtaOThw?=
 =?utf-8?B?em5aSHlDZ1RnaExUSkFTbWJpT2llSHdKOFhHMlk2RG1SMnRNRkFXaWVPZmJW?=
 =?utf-8?B?MWVFZ3ppZTFpM3JaK0ordWt6TnNmUm5hL0xkbEJPYjc4QmJ3MzZiNU1YU1di?=
 =?utf-8?B?K2wwV3ZSVzErbzkvb1YrMHg3TDg0bGZTL1ZaK3RIV1ZWdjlpT2YxZXgzczVS?=
 =?utf-8?B?TFY2eFdTYkJad0U2dE80eGhDQkl1VzQwcm40YXcvSXlzK3lnS2RBY1FjMjYv?=
 =?utf-8?B?endwejR1MjI5YzJseFBEbjFHZGJjK1czOUZTMGlGbVBhdlkvOFk2N3orZVFP?=
 =?utf-8?B?UVZtcEs4aVYyMGxqWW80WEpOY3FaWFFNWU52NGthakJ5SlVya2IzWS9lZ0VG?=
 =?utf-8?B?RG9nNzJMWWtEYmxUWmlud1h1SzJWZ2ljdkRhbUE4OHlCNUhGTUo2L1RMcW1V?=
 =?utf-8?B?TWMweWV4QmNxRDNyRzFDbjErczVGRGNYdlozaGlWOXVxL25oaGdodVpDWk9a?=
 =?utf-8?B?R2tCTFpmV0NhWDRmb2czazFoS0IyTWM1OVBsYXNRYzVlQytucm9TRUFDdHo2?=
 =?utf-8?B?ODZoNVVIUHgxc2Z0Y2g1MzQzRmJLRHpuRmthYWNTSUsrbnhXSHNrendKWGph?=
 =?utf-8?B?OS9VWGU5Y1M1K3J0UUNLUDR5Yjl6UWVZZUxQM1g4ZXFZRXplNFhjT3lCdm93?=
 =?utf-8?B?M281MzZmTUQrVy9GVWxMak5TR29FMVhmZnFIMktmM0dHdE5ENCs3QWc3ZjVV?=
 =?utf-8?B?eG5BMWUyOWVVWXFtYVdZWnBrR3BHUEJGNlNPZFRuaHAzUXB4WmVzdnFGREZT?=
 =?utf-8?B?MTF2emxyc0tRdGJPSDlHUFJVQkJndFlqbmpOMmlHbkVWZjEyY1JjQm5PY1JM?=
 =?utf-8?B?bXltejh5WVJPcWlqcnZLcnVlaDVVc3ZOb01Qd3hEUjZueUtncDVFOWRzcDFx?=
 =?utf-8?B?M0cxenpSZW50emhTOG03SFZoZDhva1RYWXljMHh1dk9oMlB6RFo2VHljV0Fj?=
 =?utf-8?B?RU5HUXVFUUY1bTNWK25SbGJvei9nZTRqNWEzZ2lMOXkyVFdaZ0txczhGcnpi?=
 =?utf-8?B?TFFiUVRSMng1Yko5dDExTnpLYVFsTGs5RFlrM3BhQ2xSS1FUMTB6S2FIaDhY?=
 =?utf-8?B?dlRxZnpXL25WUk44UFRteFhrRXJCWmNWUWwvbldOU0hhL2VXMWlBR25GcUkx?=
 =?utf-8?B?SGpuSjNFWW52ckJoS2RZU1B6MjI3OG1RNG8xQkFHMUxKRGFIZDBpbCtyQ0Vz?=
 =?utf-8?B?eERQUkYwOW54VmhML1l3dlYrSFdzSHIyY0IvbUhUUisvUHF2Mkt2K09EQVZ0?=
 =?utf-8?B?TW5IWUEzQWo2TTY2bzg2Ni9MZUx4c3BkWVpCamRaR2ZyeW1LdkNWcTVwdC9X?=
 =?utf-8?B?QTFLV1g1K1cwRnpOWFk5VCtjU1dJQisrakNVMDJtV2FGbUdxVi9zdmNqTFh1?=
 =?utf-8?B?MGpLQ1dWb3dCTTNIUmVaNXl2aTZGWkhoaTNtRXQwMHNrL3o2dit3MHhraFVv?=
 =?utf-8?B?VnQ2d043Z21QdTkzMGR1NndxdWhXbTFxMGljblNLb3U2WmhqcmEvQURBWTIx?=
 =?utf-8?B?bFRpQ0ppdlhNVkovSHRFZ0diNTlMZGl1dEc1cDZPQm5Kcit1YkRKMlVMVXhU?=
 =?utf-8?B?QU5nblpPTlFnRWxRVGJQRnN2RkthczZEKzJYS2xEeTJ6QU9QbXd3YWNYTTd5?=
 =?utf-8?B?SGkrak53aWltTmp0Y0pkSm93K3E3Skk2MGp4cW1kVFRnZUgwUUIzWkhnTHhU?=
 =?utf-8?B?SGNPRUY2Z01LK2VZcWhBM2RnMU1VRXZOcGpQOFVEdURMb29HSXVZR2MvS1JW?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 36adf7af-84fd-4448-ffa8-08dbea049982
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 20:09:28.0555 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCPtGTTmgH4ePIvkOsIgpGRhJAlgfIrL8jQR+cPIbH3TpSc4xy4evcsA+msyFo75LjWOVJx+Euxshblxo9iyXyVj7A+LLrlIyVixc2P0Ut0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR11MB5693
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 17/20] drm/xe/guc: Split GuC params used
 for "hwconfig" and "post-hwconfig"
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Tue, Nov 14, 2023 at 02:02:28PM +0100, Michał Winiarski wrote:
>Move params that are not used for initial "hwconfig" load to
>"post-hwconfig" phase.
>
>Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

... but I thought we'd remove the double guc load. Did we change
direction?

Lucas De Marchi

>---
> drivers/gpu/drm/xe/xe_guc.c | 22 ++++++++++++++++++++++
> 1 file changed, 22 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>index 84f0b5488783b..d1181ddf4bdae 100644
>--- a/drivers/gpu/drm/xe/xe_guc.c
>+++ b/drivers/gpu/drm/xe/xe_guc.c
>@@ -192,6 +192,26 @@ static void guc_init_params(struct xe_guc *guc)
> 	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
> 	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
>
>+	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
>+	params[GUC_CTL_FEATURE] = 0;
>+	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
>+	params[GUC_CTL_ADS] = guc_ctl_ads_flags(guc);
>+	params[GUC_CTL_WA] = 0;
>+	params[GUC_CTL_DEVID] = guc_ctl_devid(guc);
>+
>+	for (i = 0; i < GUC_CTL_MAX_DWORDS; i++)
>+		drm_dbg(&xe->drm, "GuC param[%2d] = 0x%08x\n", i, params[i]);
>+}
>+
>+static void guc_init_params_post_hwconfig(struct xe_guc *guc)
>+{
>+	struct xe_device *xe = guc_to_xe(guc);
>+	u32 *params = guc->params;
>+	int i;
>+
>+	BUILD_BUG_ON(sizeof(guc->params) != GUC_CTL_MAX_DWORDS * sizeof(u32));
>+	BUILD_BUG_ON(GUC_CTL_MAX_DWORDS + 2 != SOFT_SCRATCH_COUNT);
>+
> 	params[GUC_CTL_LOG_PARAMS] = guc_ctl_log_params_flags(guc);
> 	params[GUC_CTL_FEATURE] = guc_ctl_feature_flags(guc);
> 	params[GUC_CTL_DEBUG] = guc_ctl_debug_flags(guc);
>@@ -289,6 +309,8 @@ int xe_guc_init(struct xe_guc *guc)
>  */
> int xe_guc_init_post_hwconfig(struct xe_guc *guc)
> {
>+	guc_init_params_post_hwconfig(guc);
>+
> 	return xe_guc_ads_init_post_hwconfig(&guc->ads);
> }
>
>-- 
>2.42.1
>
