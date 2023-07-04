Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2419EEB64D9
	for <intel-xe@archiver.kernel.org>; Tue,  4 Jul 2023 06:04:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3CFA10E078;
	Tue,  4 Jul 2023 06:04:01 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CD710E078
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Jul 2023 06:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688450639; x=1719986639;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/Zyc9yr2C+4j6eRhYHOD0EcUWLVtqrZ2fCsS0ropckg=;
 b=DHvkFDYje8lqzkPrH1pKjl+DsbRavW+LAT+jzk2DgvlgQc7Yi/CuZjme
 oL+crF57eDtHHSCq8JvM/RPZyNvkBWbMrgtp86JFcdICj0MSjqFP8xZSv
 eUCoTefRE+ezis2xEIrqUZUTHhKCrTHwYjcTVvJ533Jgc5UilzLUhE5ni
 Q7mqnnj9jPk3iMlDNS4UduK7WxMepMMeVkXNMXqn6veY9MGy0sGBq+6C+
 0hBlIYvHcL3mcMXcsVyAtFJTAScGtI1mSrhoJTecxCSg7pJOJskV+FYPA
 DHt/lTTeDNIjmv8MhfIzTIxasrfRu8uhqkJBDKeycGKihA3M8kBxVBEuo A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="342633074"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="342633074"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2023 23:03:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="712773818"
X-IronPort-AV: E=Sophos;i="6.01,179,1684825200"; d="scan'208";a="712773818"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga007.jf.intel.com with ESMTP; 03 Jul 2023 23:03:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 23:03:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 3 Jul 2023 23:03:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 3 Jul 2023 23:03:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 3 Jul 2023 23:03:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ql/j4sADEWFjQZ9eKz3IzKepoY0dwstoF8kOHMpAmd+O8MA/soIYiOeb2b97oWARagFU8JFUKS+MpoyNWBxToMhqIa2xHwImxW1WbQxcqBsvuKM82e4wnMo9sXtlIx2rtnKRYHJ0o23oUbqPGZyupLFZ62mrRCpMrcspDLNlH/TSRhINDyRqhVGnrR7KwfnJBgMWDhGQM4U7NuAhzcIhSKirq23ViDTRzrfp56EWiVG0py4QvvLIb3nmeakaVzEyD6ldDYKvSTHCjdxoe0ppNOHeYqLvmDTiYa/i0Qv7Y8RLNXzkrXQLR0BMZDecZ0q6ETT5hzylYlSteiocJq1thw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rp3OE2Edk4UcokLwgQcsnRUTqoY9bscEungWk+WlCic=;
 b=lZBzcmtlIEviq6Q94I3fSSECxQoA2AUa2+jvY9Nc0Exs9nnZ7o/VKQTqq+76jID2alNJgUcuAgk96NeOak7Mb92OTgjnEYBlyEb9Ruw8La+K87HacV0Aq/YO3sTdLSthYt4j5Tk+J3I3WBYgW3Qo5mKvvGTDzyJIiimgYVHBbhRrAAKP9YfU5BytbmnXvI7v/8HXAe2fXyLJCMbM8GzG7rOe+OEObwS1JKI2WhA38t8oCpElC+tkz4Nb25zYUPHZhG5r1WnaumSO0orJuhZ191nD0BJCZJYPGtYZcuDPbY9BmI/ZcePdLHxoGYa7GpImgasLqqvLyt7n4FHbZZ0MEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by IA0PR11MB7911.namprd11.prod.outlook.com (2603:10b6:208:40e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.19; Tue, 4 Jul
 2023 06:03:53 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6544.024; Tue, 4 Jul 2023
 06:03:53 +0000
Message-ID: <f75d088a-ec18-2cdf-1441-1417b0cb54f2@intel.com>
Date: Tue, 4 Jul 2023 11:33:42 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
 <20230627115642.2087251-5-anshuman.gupta@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230627115642.2087251-5-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0014.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::23) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|IA0PR11MB7911:EE_
X-MS-Office365-Filtering-Correlation-Id: 2727d61b-58df-48d0-4cad-08db7c5471b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XK/k2Kt09yD1Dkh+oRLqLMvgxNGNRFDbt1ghOd/0XVW6vy8lcPeKTvfyo12INnl6GC0TNGiAoqo4rIAObPSw9VdKdSQU/1XWFynOPLkj+pCqVN7sCIbs9bAZyp5oIhZGT+kXO1M7WhIvDKoKTzY9e1DVAGIjnnCgs6J1/NQYH6Kc3hMkL/0hFKr9UJ0q2hbt4yl0M+h/z9GXZLFoKl1EJQ+/3tDp2Vx2qQS6esSr/BQswMCJ+2ISODZAsHUOSYoYZKnJjXulgGSK6OpWaER47Ckqb7Zkexm9RQc6cW2pM8T0zX3n17pAFQwEI+eml0MLXjPY3Kcxz5CJ8KGa1JcznX06YcUmSqtLVmhzuG7i4monKn/Rx/DMLpDUvE19mvHaAbH//n3h++rMEPcYyx7mBhmB+m/CILZH80J512AY1Qty1cryk6zCcnGDOElj1HpTxCL4hRfoxH4epumCXl5XZSqHfLAwZ+o56Ca2lZjVHs86IaopMOPeHw5Xgbvk8jbi0Jz4K5wf258CIMkn2h5rJttWW1ppYJdPyx6EQ/3lZGLEH3oxlwbBDHCB1/xpGv3LU2/988Oys8B5ox0DX76lVPj/eFoQRxSEL38G5rjjPg4p97bdvyhvL/DtfvUISi0vXlu9sLO+U5YXaDGeI4sonQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(376002)(136003)(346002)(366004)(39860400002)(396003)(451199021)(31686004)(86362001)(107886003)(8676002)(8936002)(5660300002)(31696002)(26005)(53546011)(6506007)(44832011)(66476007)(478600001)(66556008)(66946007)(6486002)(41300700001)(4326008)(6666004)(316002)(186003)(6512007)(2616005)(2906002)(83380400001)(36756003)(82960400001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzBubEE3L1IxM3RuZFFPR3R6SzZSUmJuU2xlTkxXZVN3U3FuenV6Q0JqcGMv?=
 =?utf-8?B?bm5tSWFIVmV3V1ZKWU9JSTRld1FwcVNNb09jT1EwZTNWU3djNElHalNPLzF4?=
 =?utf-8?B?ZXpRSTdBeXlDVk1ENTFrNjhmSnZXLzl4ZW82cHVjSkVuOWtWSEN3NTY1SnFV?=
 =?utf-8?B?MzRQRm95ZWZadTVJU2JGT084KzkyYUdxdlBGYnhQQlc0WGYxdUxMTlp0b1JH?=
 =?utf-8?B?bm9ubllXMk85bXZWR1ZDc09nT0M2UWFLc0J4Vmhobzk4VHE0YnYxV0lUWFcx?=
 =?utf-8?B?UmEraHRmeTNXRkVMK2V1MlZPcDIyM0lHN3pRZTFzMmxkZEZUZW1oSHRlOVlW?=
 =?utf-8?B?RWZ3UFJtaVdVRlB1eDdDYms5UUxTZTFsczJDNkVoa2JrZVVmNVp4S1A1T2dm?=
 =?utf-8?B?Qkw4Zk5QdHJ6RlB0L3BlamM5cm1VTnBib09GVHY0NnBBTVUxWHlPYmRjbkhI?=
 =?utf-8?B?YUJ0cmxnSXlJTHFOK21tQThQMWxwS25IV3VOdjhTTjIwYnlxb2tza29WVm9v?=
 =?utf-8?B?SlRBYlJleWNjOHFEL3lndVRlNmdCK0RwSG5OdWY4dEw1dVVXTGpkTDZ2WnBR?=
 =?utf-8?B?VEJJWXFPMmJUeTFqd3V4MXdibGZlNHFIcGk1ejhOK0c0eHFuSE5GcEZDc29q?=
 =?utf-8?B?aTlKbEZTbm1ESHZaeVJMSW5ER2syWVZ5NnZ0NWF0UVprd0M0QUdKbmFnQXJZ?=
 =?utf-8?B?c0lYMnNOd1ZxNERBczd2OVB2MUh6VTZQOEd0YmFZTGowUVNnTHBxMXZMYjdB?=
 =?utf-8?B?YkZZV0E1TVU5eVpQdzlpdHZjZWZXQmEwcTBGemFQMDU0ckNXd2hqY210VmNK?=
 =?utf-8?B?bC80Y1RlNWRCNExlL29BZWM3VzVwUk9xSzN0aTN4L09KMkQwckZsc2RkV3p0?=
 =?utf-8?B?UkJabHhoSjA0ektBOWNld09pODlJdS9EeHhHeFhUODVEdjhhZ3YxTmJwQVpH?=
 =?utf-8?B?RFdHYXpiek9haWg1NWM2VW9zYUVCTENwTjhZN1hhdXhkdm94bSsrRXpHN0d3?=
 =?utf-8?B?OTVoaWdFWnVWTTNvSWVyY2NkUmg0L3dmbHFEemRvR0p2ZU9uaHpTK2hDRm5X?=
 =?utf-8?B?V09XOWRCT3VnbjhwMjZaOGNaWngzZUMzMlNOM3ZwRUpWeUlJbTlTSTlxVjE1?=
 =?utf-8?B?dmNuNkN6TEJNa1hieDRqM0xZRERscXRKMlBTSmZCNjFBRW9lL0dZMHRORG9r?=
 =?utf-8?B?b0ZORFd5Um9EbmErSnBwbUs4cGR4a2pVbmRUL0RnTXA0THJ1cXc3aEZXYTcr?=
 =?utf-8?B?SnY3VzNYMEtTR1BFTllibERVVWJ2b3FkZGZJQkZLL1l1akRuMUk5Vk5DQWEz?=
 =?utf-8?B?QTVmYVdjQTFxdzN0cTRLUHZQL1pPTlpUa3NvalRTNzdEeG9iWW5QM2d1dXI2?=
 =?utf-8?B?K21Kd3VjVGE0dWc3RUxzNWE0Zyt0Yy9TQ1VKU09yOC9DYUdJUGtEOUQ0ZDJY?=
 =?utf-8?B?S1pkU0diY3l3Vk9jQkRKUXp2M2J2NHYrd01jdFJBUnVQaVdCTS8zOFJ0MkxE?=
 =?utf-8?B?VTF0dWVkN0M2L2FJWTV2NnNoY3dmWEQxSVY4QkxrWnFOYVVBZlV2dFNyNkI3?=
 =?utf-8?B?dXJ2U0VmVHVRM1U4UmlQMy9Neklna2VaREhJbHIxaGk4QUE5blF2akFCSkgz?=
 =?utf-8?B?UnRZQlFLOHBHN2tuV2hwYmZTR0E1MElPWVdkSHNxNzRzL2NUUFlCVWUyeHJK?=
 =?utf-8?B?a3o3dG5WQzEyZDBMNkVRU2Q0MzdSL0ZKNHJiT0hrNWExS0MxK2ZnYUVLZXJ5?=
 =?utf-8?B?SDhwRndnNnZCS3c1OUMzT2tCWXJKZTVVVW1ET1lvc1NjK09haW1DRDdYVjla?=
 =?utf-8?B?NWlTNytTQ3E1RGZOZHlPaW5oUkp0WWVBTHBIRDI0aVdOU0pVNG5LS09hdVhi?=
 =?utf-8?B?cU1nS0p3ZzMzZ1lTZmVMa1lPdjVJVUlodENnSXN2T05kdFhFWFhyL1RTMjBI?=
 =?utf-8?B?TDl3d2llbDhEWE53ZGF3elB1dExGS2dsc252M1RyOFdSTkRJSlVoMjByY2pH?=
 =?utf-8?B?TGVURnZJM0c0czVBOFp1UFYvU2NQMkorT1M3S0YzMERXejE3UkoxVzRrd0pE?=
 =?utf-8?B?b1JCbC8zTWx2ZWl3MTIrZzAwckNwampCWjlVNU9MUEwzOGRYZDJKZjFNb21E?=
 =?utf-8?Q?mPz4dvQ//rrxnDf9viQbSQsBh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2727d61b-58df-48d0-4cad-08db7c5471b4
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2023 06:03:53.3126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +CX4Ci+KjGCJ4vEfyvFQOkAylJxxKMOnCPmra1Oe01AUOk+sM5Z2vV/W5XUMc2FAxgclHi+2O5dpgOl3FceBQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7911
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed
 using vram_usages
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
Cc: sujaritha.sundaresan@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Anshuman

On 6/27/2023 5:26 PM, Anshuman Gupta wrote:
> Adding support to control d3cold by using vram_usages metric from
> ttm resource manager.
> When root port  is capable of d3cold but xe has disallowed d3cold
> due to vrame_usages above vram_d3ccold_threshol. It is required to
> disable d3cold to avoid any resume failure because root port can
> still transition to d3cold when all of pcie endpoints and
> {upstream, virtual} switch ports will transition to d3hot.
> Also cleaning up the TODO code comment.
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pm.c  | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h  |  1 +
>   3 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 848de5dcdaa5..78e906607188 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -746,6 +746,24 @@ static int xe_pci_resume(struct device *dev)
>   	return 0;
>   }
>   
> +static void d3cold_toggle(struct pci_dev *pdev, bool enable)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +	struct pci_dev *root_pdev;
> +
> +	if (!xe->d3cold.capable)
> +		return;
> +
> +	root_pdev = pcie_find_root_port(pdev);
> +	if (!root_pdev)
> +		return;
> +
> +	if (enable)
> +		pci_d3cold_enable(root_pdev);
> +	else
> +		pci_d3cold_disable(root_pdev);
> +}
> +
>   static int xe_pci_runtime_suspend(struct device *dev)
>   {
>   	struct pci_dev *pdev = to_pci_dev(dev);
> @@ -763,6 +781,7 @@ static int xe_pci_runtime_suspend(struct device *dev)
>   		pci_ignore_hotplug(pdev);
>   		pci_set_power_state(pdev, PCI_D3cold);
>   	} else {
> +		d3cold_toggle(pdev, false);
>   		pci_set_power_state(pdev, PCI_D3hot);
>   	}
>   
> @@ -787,6 +806,8 @@ static int xe_pci_runtime_resume(struct device *dev)
>   			return err;
>   
>   		pci_set_master(pdev);
> +	} else {
> +		d3cold_toggle(pdev, true);
>   	}
>   
>   	return xe_pm_runtime_resume(xe);
> @@ -800,15 +821,15 @@ static int xe_pci_runtime_idle(struct device *dev)
>   	if (!xe->d3cold.capable) {
>   		xe->d3cold.allowed = false;
>   	} else {
> +		xe->d3cold.allowed = xe_pm_vram_d3cold_allowed(xe);
> +
>   		/*
>   		 * TODO: d3cold should be allowed (true) if
>   		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>   		 * but maybe include some other conditions. So, before
>   		 * we can re-enable the D3cold, we need to:
>   		 * 1. rewrite the VRAM save / restore to avoid buffer object locks
> -		 * 2. block D3cold if we have a big amount of device memory in use
> -		 *    in order to reduce the latency.
> -		 * 3. at resume, detect if we really lost power and avoid memory
> +		 * 2. at resume, detect if we really lost power and avoid memory
>   		 *    restoration if we were only up to d3cold
>   		 */
>   		xe->d3cold.allowed = false;
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 7028c9b6e94c..4db4e5a1b051 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -277,3 +277,32 @@ int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)
>   
>   	return 0;
>   }
> +
> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe)
> +{
> +	struct ttm_resource_manager *man;
> +	u32 total_vram_used_mb = 0;
> +	bool allowed;
> +	u64 vram_used;
> +	int i;
> +
> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
> +		man = ttm_manager_type(&xe->ttm, i);
> +		if (man) {
> +			vram_used = ttm_resource_manager_usage(man);
> +			total_vram_used_mb += DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
> +		}
> +	}
> +
> +	mutex_lock(&xe->d3cold.lock);
> +
> +	if (total_vram_used_mb <= xe->d3cold.vram_threshold)
> +		allowed = true;
Can't xe->d3cold.allowed be directly modified here? There's also a lock 
around the code

Thanks
Riana
> +	else
> +		allowed = false;
> +
> +	mutex_unlock(&xe->d3cold.lock);
> +
> +	return allowed;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
> index b50ec8bdce6f..08612cf3e67b 100644
> --- a/drivers/gpu/drm/xe/xe_pm.h
> +++ b/drivers/gpu/drm/xe/xe_pm.h
> @@ -24,5 +24,6 @@ int xe_pm_runtime_put(struct xe_device *xe);
>   bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>   int xe_pm_runtime_get_if_active(struct xe_device *xe);
>   int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
>   
>   #endif
