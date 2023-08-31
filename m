Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FDDC83F3C
	for <intel-xe@archiver.kernel.org>; Thu, 31 Aug 2023 19:08:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC9810E6BC;
	Thu, 31 Aug 2023 19:08:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8510E6B9
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Aug 2023 19:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693508890; x=1725044890;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MoK8lvGRkX9wNd24xvQHy3DUd5BytvCAsOA24dJoZpc=;
 b=J67UzLnLA9+UDWoKRydnf/xccDzn+GcN/UW2vZBXMVoM3Ab4kEdXa8o9
 09hqu6q0JdeBDBQF48PRkjtCyuxLzRBR7fdJ5lgoBJJXA9oiJx0v6Va7s
 4tcA//2UW7hhWZ4hAOTZhF2tLA5ON24BRybl8HaFVzXn6lCfv1CQSUuge
 I/bDvImub5bARFlCPv5l0nCvA9TfC9+gkYQTTRN/g+Xj42t4sGhbdG4JA
 BMeo+NUfz2b1+hXc0t+NkSwVIUL4rMHussIg8PO8SR1AzntpGBoLyvH1m
 OEbjFPna9IXMdApwa3aHoIhCFnmIQiLRCxWg0bi+XxahT/41jscbH7qvJ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="374947630"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="374947630"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2023 12:08:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10819"; a="829825613"
X-IronPort-AV: E=Sophos;i="6.02,217,1688454000"; d="scan'208";a="829825613"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Aug 2023 12:08:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:08:08 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 31 Aug 2023 12:08:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 31 Aug 2023 12:08:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 31 Aug 2023 12:08:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O/ahyXC0LFBJWXSTSrojxO8fj57TcTXhkaaEGWLBOK2oJfjOBGPz89vdVP4iTSXWCyx/E7XoNrkG/Jj2IihVmzxdNMZSBO9/ab/dAAH7tafH1vgZeATuCMBxzSEY3QHIBYqC9PpeAeeCq2NQZymq9JvXYehLjR0pQEEb+DxewH87zbaZCEMrd3db5JDg1yT7ck2nvUVezbwIkHXm9ycrxSn67ShpamToq/CfX0hP0e0DysfLMcVX1b2eWGeYnlVCNVjk3CIEiR9oI+nyhJ9uoBAbD5FjI9L949XBr3R0DwJluJXj7E6YXZX15bLWb5tpEl2DRmh16D5aioDVdcVefw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hc2yKO9sY+KFPSOFl/1OSfqd/v46xKFgwYPkzOB3HvI=;
 b=R7rM+TOTBxjDMIzElQABwv35+gATNcB1gyorSYRFzAq3QGo9d8DgG+UlvqY04JB/vtEj+dQK8nzL5dGf3PnHvjJwTS2vh+sMNf0lIflsIF3cJlaPiPW25XWOdIC1yPw5JUUs0ev5rDDuKEM0E/51jT3ULfdwSKyH+hVR2futjh4ORA4dv8kU72kD9xluqmU2dMrVci85Uv2wgIDmsA/QfQ532Xna5HN/VO2fQ2FIhKnLsfHuj8rI6hZ36llFuXsnaXQnqEeWZ14F2C+qtkV/9kx58mVV26P/7vVDBf2zmLGZb2ZsIlTqMY0b8NgXn5YM2DoRNSYqbEK0YV49YHYlfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by SJ1PR11MB6132.namprd11.prod.outlook.com (2603:10b6:a03:45d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Thu, 31 Aug
 2023 19:08:05 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::4b20:e34:71f:139f%4]) with mapi id 15.20.6699.035; Thu, 31 Aug 2023
 19:08:05 +0000
Message-ID: <537ddacf-fe7a-1c69-1cce-4586222314de@intel.com>
Date: Thu, 31 Aug 2023 12:08:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-2-riana.tauro@intel.com>
From: "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>
In-Reply-To: <20230823050955.1226024-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BYAPR07CA0021.namprd07.prod.outlook.com
 (2603:10b6:a02:bc::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|SJ1PR11MB6132:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cdeafd2-dcac-4a5e-dfdd-08dbaa559b46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HKefPLlOrGmyFVBGMi+TgXeE/MbqIkDlaGy6kDBlgGAyavEnZl2ApsmF+7G/FC8n994R7Xc1aoeDA9ZZKLJ6JcEfyO/A/aZvNbd7J6g7LCMhTA5pGbUx8DQMMDwIV+lKnWBtYQsYZr1VSRZSGF8KGVBFj+0W3A9TrbJU0fiCDxBotBhu9vf7MqXd9cbUZ3Jh2Sn8rf2H/r31IFA00H5hQVUe1jANP40pSh6jDmzslRHYATQEtY11poSQYalRGqdqjbciihM4aVCAw21dk2pd9qYfDUKiAYaa535Qcz/0zPGrR2Vfh1MuUkduh58oM6qKt4ICWTOfoay9+XxCHmLM7rx1x3Jn1loTIggIgKtwCN28/dtMp8u8ClV4Vp1SmU95yiasrahAteD0+MbK6opPNf2S5GKKFJrUO1UIoLtWqm4efIpwfuhLcSQ8J2+kK6VA6CrzfcSSKqqeEcY08wbVmhDsohaiaUxrTpJ33qTX86OUxTh26CPU+LmROjUqTTrmyEmLcqcXXGcik1mkhOqWJdz+yLiiAEP7kfftHYaN+T05qTYuUns4pMFY2CrLwiUY+MrVcXA7vL1yQBi3zhg7K5+0mHyFbdtaLJMqF38ecuy/5UYsa93vscxndhre5+AkbcXqomzGWQvU+6+j8xYuMA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(366004)(396003)(346002)(39860400002)(376002)(186009)(451199024)(1800799009)(316002)(2616005)(6486002)(82960400001)(6512007)(86362001)(53546011)(38100700002)(31696002)(478600001)(6506007)(83380400001)(26005)(36756003)(66556008)(8676002)(5660300002)(66946007)(41300700001)(8936002)(66476007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VTVrQVUzTWowRlc5dG5mOXBOdEIyOWhXZDlibzEyazViaCszUCt2ZkkzY2RX?=
 =?utf-8?B?Y3dTdzg2OEliVHZRZ0VMdy8wTVFMWnRiNlRmTFNJL2RlUDFRdU91NWRFN2Zv?=
 =?utf-8?B?TkV5em52QlE5NnpRK2hPUkhkVUFVMVZxOTl2VlUvTjlZdTdyOUp2cngwMzFK?=
 =?utf-8?B?WkJPa2NMUUVCUEVuWU45K3JoMVRhK3pkaFBIM3FMc2U5OG5uMGx1T243d3k1?=
 =?utf-8?B?dHlLNytRU3psMDZxZU5DbTd2T1IyZmJIdVY5NVUxRGlFSXI2OVR1Skx4UFhY?=
 =?utf-8?B?VnViZ3RpZ3diOHp6KzNyeldLS1Z4WWZSdG9UVi9RVnMzaWI3dU9mUEV1ZlNK?=
 =?utf-8?B?V2RHOUVyYjN5bjFQSnhKbGU5cUN4Wmlod3FsbE5wNDExa1QwT3EzM21GODIx?=
 =?utf-8?B?SCs2UzNDODBLL20rYWtwY085NEkwMFd6a3VBTk9lZHVXZkJ4anJrckJDdFRt?=
 =?utf-8?B?VE1JTUNBRDFCczNrUTloc3VJT2x4aDM4ekNGa2hpK3JFK0JIQmZvYTh3WEZ4?=
 =?utf-8?B?QitNTFRuUHpIYnhYc1pFTVZ6elBzYnZLOTBHUmJlRkZHZVFqcERMWGVIYmpL?=
 =?utf-8?B?bEM5UnBKMnNtV2FlLzhFZ1d6QzZ2U2R1UEdnc0ZNdEZUWGMvc1h5bk1YdkdU?=
 =?utf-8?B?ZXJNM3hHMG5Za1VQcFRVYTVONmdCN2UvWFhqTU1xUk9mRDlvQTJuT3JVMXVl?=
 =?utf-8?B?a3pQQjhTSlpzYm9MNDE3NHZoQkZtWVlsV0pIS0JXTFo5NUc2TTJINmRRdjlt?=
 =?utf-8?B?NURFWjdOcGZpUkxDajBNczhaenUxUEtvV3VVZkRZYnFUQnlEcjg1M2tKbVJn?=
 =?utf-8?B?RTQvVzM3WURSTVdVbEZlaWdTV3Q4ZGRtK0JBRStBb25lWXh0bXhRTmxKWG9Q?=
 =?utf-8?B?TFNsNzZHeWhnaHRtSGU4ZUlRSDNnN01CeTdNdUJuak5qZGFCUWlLNUNzR2Fi?=
 =?utf-8?B?NER5aHNTQVdMNHFmY0ZPNWtneitDUEdSZjE3L0kvK2k1N1dNTFEreHVPUXUr?=
 =?utf-8?B?MHlJaHBHSkZHdWJMMEtYOFI4T0YzN1Q4Y0dHd3FweEJ4TjM5N3l6QWJnMzlv?=
 =?utf-8?B?dmtWVGNuVDZXWjY3NEc0T1JsWSt2am5JR1k4VkRvVXVRcnB4U0FQaTFkRGpj?=
 =?utf-8?B?UHY3TStjUlNkSjRaVkNMTE1rdnVkTE9DMCsyM1dycU1pU3E5UWJoUWFlbjNS?=
 =?utf-8?B?R05CQm0zL2pFVWZMdmlKRXZTRnZnbHRlSnF2ZTNHaDJQM1R4K2J4UVRtbVdK?=
 =?utf-8?B?SHJRT3pHdWlMa3puOW9sSDJzaURaVU9aSU9aN0ZJeXc2OWZTb1dPVnY3djNP?=
 =?utf-8?B?MDEwaDJxMUFOempKNTZKRStyZTZyR0ZjdjNyYnFCendKKy9BZWlOYmI1UFVP?=
 =?utf-8?B?N1p4ZE5aOFVRSVN4VDBFVjRQUXUvU2lOL00zemY3eWtWMVYrMFkxczY3ZExm?=
 =?utf-8?B?Z3VpWnBQMUxiWjJYclUwdzVma0NpWVZCVGNrODdMWWc0NFlDeUZsd0J0ekpL?=
 =?utf-8?B?cVlueitGWWZQLzhBWUhUNGtQR3NrZnd5cElaNHFJZmhiSEZwTW0vOVU3UzZ2?=
 =?utf-8?B?VHdZbjVnOCtPNkJGMlh1SWdkdkZWT0pFQjBLdjdUd1FSVm5EYkVTQTZIMUQ2?=
 =?utf-8?B?TVY4RFYzMVpTK0Y4dE1aNWwzbi9GMWJvL3R3VVRaeFk1VWpieDBDOTBvNUlz?=
 =?utf-8?B?aVQvVXY1MHlIWVhWRkpuVkh1QmhUckRXUk1HbU5MRVB5QVRNNWdjWWdVL2pY?=
 =?utf-8?B?T2JoUG5LWmlKcUZIeXlZQ09jWDlFK2hQUDRONEkvNWM1WHZrZUFPOFRydjJ1?=
 =?utf-8?B?QzVOMHNRbUhYK3dRVnhnRzhQclNZNDZsd1g3dTdaV0YzV2JIc045WFJiRlFP?=
 =?utf-8?B?RWxlZitLR0ozd0QrUVRYVFB1VXY5c3BBMHRkZmhsN041UUVBY0lDaUtoQ0NX?=
 =?utf-8?B?QysyeDZQajdhVVJYbTJWQW9ML08wd29hUCswKzYwRHVqcElCbzc5dHR3TWlQ?=
 =?utf-8?B?M0VRbXUzdUJrUkNCM0ZGZmFQbWJEMXhDY0RlNWFqd3RNa2ZtMnE0K013ZEFu?=
 =?utf-8?B?NlVhNEp3RStJd3JmT2d2QkNwQ2JnRjY5S0huVTNkZGNvekE3Rzd0TzB6bCth?=
 =?utf-8?B?VXRZS3Q4MkxjdG44b0wyS09hc1pXOTBDUHVBTi9BWStwbXdvckFTK1h1VFRU?=
 =?utf-8?Q?GYPTJhfnX5ANDykndAyDyZ8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdeafd2-dcac-4a5e-dfdd-08dbaa559b46
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 19:08:05.8346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Y1t0N05nYAuVXa+pbJ3oEkULNd3DSs+DIo3O7lwkag1TjRX5NTeyB9lGjntAqn8fyENjXjo/LdbG/fFSVwVWq1eSfTN9mGVirgd9or7lfo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6132
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] RFC drm/xe: Disable ctb communication
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



On 8/22/2023 10:09 PM, Riana Tauro wrote:
> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
> only enable/disable ctb communication.
>
> Modify the existing ct disable function to send a request
> to disable ct communication if firmware is running.
> Add a function to disable guc communication.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c    | 15 +++++++++++++++
>   drivers/gpu/drm/xe/xe_guc.h    |  1 +
>   drivers/gpu/drm/xe/xe_guc_ct.c | 11 ++++++++++-
>   drivers/gpu/drm/xe/xe_guc_ct.h |  2 +-
>   4 files changed, 27 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 2493c5859948..3e4c00bee6bf 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -557,6 +557,21 @@ int xe_guc_enable_communication(struct xe_guc *guc)
>   	return 0;
>   }
>   
> +int xe_guc_disable_communication(struct xe_guc *guc)
> +{
> +	int err;
> +	struct xe_guc_ct *ct = &guc->ct;
> +
> +	err = xe_guc_ct_disable(ct);
> +	if (err)
> +		return err;
> +
> +	/* Check for messages received during/after the CT disable */
> +	guc_handle_mmio_msg(guc);
> +
> +	return 0;
> +}
> +
>   int xe_guc_suspend(struct xe_guc *guc)
>   {
>   	int ret;
> diff --git a/drivers/gpu/drm/xe/xe_guc.h b/drivers/gpu/drm/xe/xe_guc.h
> index 3addd8fc674a..18cf5d02eea7 100644
> --- a/drivers/gpu/drm/xe/xe_guc.h
> +++ b/drivers/gpu/drm/xe/xe_guc.h
> @@ -18,6 +18,7 @@ int xe_guc_post_load_init(struct xe_guc *guc);
>   int xe_guc_reset(struct xe_guc *guc);
>   int xe_guc_upload(struct xe_guc *guc);
>   int xe_guc_min_load_for_hwconfig(struct xe_guc *guc);
> +int xe_guc_disable_communication(struct xe_guc *guc);
>   int xe_guc_enable_communication(struct xe_guc *guc);
>   int xe_guc_suspend(struct xe_guc *guc);
>   void xe_guc_notify(struct xe_guc *guc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 59136b6a7c6f..64c2029b2752 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -21,6 +21,7 @@
>   #include "xe_map.h"
>   #include "xe_pm.h"
>   #include "xe_trace.h"
> +#include "xe_uc_fw.h"
>   
>   /* Used when a CT send wants to block and / or receive data */
>   struct g2h_fence {
> @@ -319,15 +320,23 @@ int xe_guc_ct_enable(struct xe_guc_ct *ct)
>   	return err;
>   }
>   
> -void xe_guc_ct_disable(struct xe_guc_ct *ct)
> +int xe_guc_ct_disable(struct xe_guc_ct *ct)
>   {
> +	struct xe_guc *guc = ct_to_guc(ct);
> +	int ret = 0;
> +
>   	mutex_lock(&ct->lock); /* Serialise dequeue_one_g2h() */
>   	spin_lock_irq(&ct->fast_lock); /* Serialise CT fast-path */
>   	ct->enabled = false; /* Finally disable CT communication */
>   	spin_unlock_irq(&ct->fast_lock);
>   	mutex_unlock(&ct->lock);
>   
> +	if (xe_uc_fw_is_running(&guc->fw))
> +		ret = guc_ct_control_toggle(ct, false);

Note that if we're not killing the GuC there isn't really a need to 
unregister and re-register the CTBs, we could just set ct->enabled = 
false on suspend and flip it back to ct->enabled = true on resume.

Daniele

> +
>   	xa_destroy(&ct->fence_lookup);
> +
> +	return ret;
>   }
>   
>   static bool h2g_has_room(struct xe_guc_ct *ct, u32 cmd_len)
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
> index f15f8a4857e0..1ad150c19ae3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
> @@ -12,7 +12,7 @@ struct drm_printer;
>   
>   int xe_guc_ct_init(struct xe_guc_ct *ct);
>   int xe_guc_ct_enable(struct xe_guc_ct *ct);
> -void xe_guc_ct_disable(struct xe_guc_ct *ct);
> +int xe_guc_ct_disable(struct xe_guc_ct *ct);
>   void xe_guc_ct_fast_path(struct xe_guc_ct *ct);
>   
>   struct xe_guc_ct_snapshot *

