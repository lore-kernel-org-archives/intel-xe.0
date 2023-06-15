Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E30AFEB64D9
	for <intel-xe@archiver.kernel.org>; Thu, 15 Jun 2023 14:23:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A75910E501;
	Thu, 15 Jun 2023 14:23:28 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10A4F89622
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Jun 2023 14:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686839007; x=1718375007;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ng4FnlOuaVOvzZQ56MSEJjZslXWTH3PYTJLjDSH1FyM=;
 b=Zsk1w6bRG1ITc57qbhbGuKOXuSsA+XvKI7DE8VOPyXXWnTN+7Y/frG4B
 nXQRIaKkBQxMePnTC18bCYbHjFWxXycRiGiLtdvph63laYTCWm8EOMst6
 5WlzP0HVaSrCosWRLXg3vHdvxkpa8F47AUxWEdy2AelLt2k7She8ALzbW
 sxh2ph+FkOi96ABBF+ZNl2SgggezFqvGa9isn1JgXSGsTfOvvkcVoLFOY
 XbdnKkiG+0yNH0Z+e5etsgvzSuyLRTt00WnN7knvDm9VzpLwhLw0SnT1D
 8HbK/0BV8xTX7xiv7zv2ID4wCMbnDvg6TqTVHh7vQgZOpnTu9qQUTbcoc w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362318621"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="362318621"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jun 2023 06:31:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="886657316"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; d="scan'208";a="886657316"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga005.jf.intel.com with ESMTP; 15 Jun 2023 06:31:09 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 06:31:09 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 15 Jun 2023 06:31:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 15 Jun 2023 06:31:08 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 15 Jun 2023 06:31:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AE/yM9asZOJcCrTQhD6QfLi2gVi8bG+nBll2kSHnbQ3gRRZFSbc38rJuKoAmoba1l6TIoUUTK1u31t8LVxKYNioqqkF2T8PlJzgHbeBzhq3cpCDjaY1WkZ0ttXOHFRbpJ8j55jlSuKbfMfYKAOKnB+V/eh52Mpp2D0HBaFYeUhfzdyyOqVn+puXxeVpeBdOH8nU2sQQVPH8d1F3rqz3bTMnX0UPOQcgulu7DdPKF7ozfkvp/2PiVCIqyKnJ6qq/J7Rb+lAw/ytXzNEyvnVsM9ZQU6NkSjXzCwoDyPB1TVTiuT6LLWgemTVwk4GscVJoi9yigoIGvp49d+pVkMpgbfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EHRVrG+Eixeczxnjjj9cEVSUaYvOmSAlsD/UsWHVxUM=;
 b=jFnxAELEW0eRCbBOXqye6EZMB2IBwW5KiR6eN7T3tg+v1ReCVakJiYi5ugVsJ2nw/INR+bCoSAYojav1MfjchQXekPRuIermn+LQDvgLzX6NM7c5e1hwQaVqBXE7jNBAX7+J0kgvJDpPSjVw3r9I2gnn6d3jwpkkMf6rC9fshZdhApojgr43/jm4pBZJRc+v04DNqNJGscsUW3QdmkfhTKtw2j00WU3vgi7qo80SQF0HZfvIvrws0J3u15YFv0/Iyw2U3DqRQAnzgw94mBD8wwWb9/OqZw/Va2BwlqPufa1ca1BUkvvGMXEXNjAb5dx0UBPei8TtiULpEtPoad19aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DM6PR11MB4673.namprd11.prod.outlook.com (2603:10b6:5:2a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Thu, 15 Jun
 2023 13:31:06 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::bb92:d504:7607:ed33%7]) with mapi id 15.20.6500.026; Thu, 15 Jun 2023
 13:31:06 +0000
Message-ID: <01a9400b-38b3-984e-a17a-b3038fddc722@intel.com>
Date: Thu, 15 Jun 2023 19:00:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Anshuman Gupta <anshuman.gupta@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230607110328.3739706-1-anshuman.gupta@intel.com>
 <20230607110328.3739706-5-anshuman.gupta@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20230607110328.3739706-5-anshuman.gupta@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0153.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DM6PR11MB4673:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a559c9b-4ade-426a-d54f-08db6da4c59f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cY1sdVYoqTgxyalIPpnFyzj6/y0cDcW1wNQHxHO0e5hDgnmkmQwmHQHXE2UXNfyyEyuhHVOfoI/EB1l5OktHvxr3nsNxvWYuOPIBLVSHgIgC2f49F+CnwVPm8yBIxxvCpJCZowrG9pUD/bETHgO2tBzHKadzFjOz20B1h06rqb3PPBFBOobk7UjSLiB95wI9522z8xJkGva4aBZ+WJ+UMbl8MqSdTMsuwiQNZ7lgiWDaQLAzQdJfuE0IZ0kytBVVckbk3k38fKD9jt+TVmWux39Ufo2iOUhJyW88wvhe8KKgAIpc3ZCHTBwuf5CQ3uc+QNdMGYkPc512Q52Jwbjy8CZPPIlV8JlJk6qxywqRSG5Nz83gsnEC9zrQF5/XObXAvI9jKr2xzErik/h0Wx0/UaO7Dc3SaXsipTnTkykg8Qlu5ELncNT/OB4YbD+ehTg8BLCI57ot5jYlzYBUtRR2tSDGUxUdTe29SeYdJ/bwSaj5AXV77rB+jScm4y5Olo7SXdIOVmdjUHxBXrj4ZLabKMAC8+/dIKa6mtA2FZa6+3B1xOdDudbIpUlTfkmFFCsJ9uJmlgjq+tabWhmVY1D+vFyMr30rD8oVxiOT+WPjJPiJLlBPauY+FB+Vwna+wyUbzooXPaZokBfy4NUZ/LZwWQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(346002)(376002)(39860400002)(136003)(451199021)(83380400001)(31686004)(36756003)(41300700001)(6666004)(316002)(6486002)(5660300002)(478600001)(8676002)(4326008)(8936002)(66556008)(66946007)(66476007)(107886003)(86362001)(31696002)(53546011)(186003)(38100700002)(6512007)(6506007)(26005)(82960400001)(2906002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDd1ekppK2NZN3BrbHRXM0VRbjI3VGU4NDA1c2wvbUdhUFNPakw4VlgxbDBR?=
 =?utf-8?B?UUMzdDhlSDdrb1RTQ1lMVmRXZktzNXZzMy9Uc3BGRVVXTWYvdk8vNE41clBj?=
 =?utf-8?B?UHI4TzVNWitBYlNUZkZDMjd1KzU0cGFWNENteTJnYVRYRXhMVjVtank3RnRs?=
 =?utf-8?B?b0FmQXFESEUvSDlNU0xnZXNTUFN1M09Za0Q0OG1rY0prLzBXMWpUT0xiUlpJ?=
 =?utf-8?B?cktiZ1p0WnhORjh2MFNLZ3BkTi9lcWdyQnBmMDYyNmgvT2hWTTFBbnlIUndU?=
 =?utf-8?B?eS9ONk9JRVpTU2d6Z3AyNmR3VmJ2TENMTGYwK3oyNjQ4MGVUSGhBR1oyWith?=
 =?utf-8?B?Q3N4b2pWU2JVV3dkOTR3eFEyUE12VEVOUUNiaVJMei9STHN6WEppbURtM21v?=
 =?utf-8?B?ZEsxTzVaYXhSRE9heFhXSHdHc3V1a2lwOWhKOHFpRWNveHNhM0xxVmMwZkI0?=
 =?utf-8?B?RERBeklaVnVHMDRocFl2NTdWVEgxRzhnWVhRVzI3V2R2N3FPQ1dORCtEVndV?=
 =?utf-8?B?ZFR0QmpHeHZURCsrWVUyS2MyV1BDRFdabmxya3RRa0tSMWdjQ0w5Kzl6RGFu?=
 =?utf-8?B?QWk4aHkvUEV3WU9WMlduRkp0SzB3emhsVVlMMWNnYWsvTHArVTVTcE0xbStY?=
 =?utf-8?B?amUzV1VvbktaczgreFd0d0piT283aC81cENxaDZ1dWNWeEJ5eVZRTUJwdWtF?=
 =?utf-8?B?WE40aDB0UU1vYkVqOG1zWENpcFlVS0tzV3A3ejEyWk9yNWszeDlwZUpSRmZJ?=
 =?utf-8?B?ZUEwZFNwVEF0eXdwRE5MZWNuU2FqU2ZUMWdpNHV1RUJFc0gvSkFlYnFXR0xY?=
 =?utf-8?B?c2Q1ZVoxR0FmaDZmcXZEbzlJNCswbVNoZEpKd2Z6TXRtRVZPSkljZXVmY2J4?=
 =?utf-8?B?MlQ2eFlPZWFLdjU4M21UbDQ2VEpNcDZmNlhkQzRoczQyY050dU91ZHhiV0Zy?=
 =?utf-8?B?dmN4VDJUa1M3SStFWnlpR01ySWx6d1Zuc0ZlQlUzbmVTbTczZFpXbzB2dFNR?=
 =?utf-8?B?QzhkQVJFdTJSZ3g3ZDlGY3BkMUJoQ0VRZGR5U1hYemN4L2UwT1ErcWNuMy9D?=
 =?utf-8?B?N29jWjZrdUlRU05NZFNheGNWUTErSzN4UGZaa0hlTkdaRTNtcUs4TnUwT2Mz?=
 =?utf-8?B?S3VvaDBEdGxWdE1tMzRacHNVMVNCeFgzWUorYUlGNm0vVlFma3VqRXpZQTdx?=
 =?utf-8?B?emI2UFg0MFVNUlJQQTFQWlNLbTBMbThqbUR5WU5RK3REZVBwRUZwajV3TTFG?=
 =?utf-8?B?cjZaUEduWnExYW92dkQ0S0V3bE50RFNtN09wcmFmajFGWVNFdzUrY2dmZHl4?=
 =?utf-8?B?SDlUa1BtbTVDL3NUSURsQ2ZtcWZPNEE0bGVWaTRxbEg2QW9QV05JeXdaUEVF?=
 =?utf-8?B?MTdNN0FFRTRpWXJMUHNMTEM1TVQvUU5qc2hQTXUyMGVoNDRoa2JxRDRzMk4z?=
 =?utf-8?B?U0RxZXJhRU4xbm85WnVlY0NNUm8wY250Rk1PRlo3VjlrOWRYMm1tSE1sMnQ3?=
 =?utf-8?B?UnVWS3NkTzYwQ3h4djNTQnZxdGhtdWZYKzZNTVBtYkE1aXVSREREVWQ4ZjhJ?=
 =?utf-8?B?YXpwUUxJdjFKKzNQV2RXcHl1V21jb1gweDNKNmRvcXpRMHoxamZtRXRGNFJz?=
 =?utf-8?B?OUlRZU1Mdk02VWpucDU5bzlVUnFWTGJxRkhtYkRVRHYwWVJUMXlaa1hCWlFO?=
 =?utf-8?B?OElSbVIxWEs1Tld5b2FoWXVlbXIxUDBUQ0xKOEJXMWlYQTNFc1JSVUh1MWsx?=
 =?utf-8?B?NGw2NVBYTU4xcWl5dUp6KzYycjN5RXNCeHFOZ2xiQ1k3RkNqYmFxTm85SkJU?=
 =?utf-8?B?ODJvcXI4TlZSdG5qbExsNlFQZXVaVndlUjIyZjN4dVc0SlpCTXJ5NlR2UkFC?=
 =?utf-8?B?Z2RhVGtQbG9BMElTU0ZvZ0VCVG5hNGNMRUsxZytuZ0NZRWpvQS8zMmdETXc3?=
 =?utf-8?B?LzM2Yk85akFiT000UHZpY0szVGJ5RjJKRjd1aUtvQWx3VkhOd25iamk2M1cy?=
 =?utf-8?B?eDIwZFlMYUFZUWplMHl4c0lvZ2pKRnhRYVQxVUtmbUkzTHNCclJ2bTJVV3hY?=
 =?utf-8?B?L1o0T3FkWUsrTURKOGgvL3B1MDAvK1BSaGEyT2cyQnVkbVVkSWxZcWlaRklI?=
 =?utf-8?B?SWM2bzhFVURCb0R3VnFPNzJmWHNBdk12R2JHUVczWEFXSGhDWUpxSXRMWmFK?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a559c9b-4ade-426a-d54f-08db6da4c59f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 13:31:06.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4I48zWDdzDjBaKTUPxm5K16jHO4E0I+u96FjDFee4PAN7RJJm7IJzIP0yroWh2tqk7fSzekuTlHxUULXZN4voA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4673
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/5] xe/drm/pm: Toggle d3cold_allowed
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
Cc: rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 07-06-2023 16:33, Anshuman Gupta wrote:
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
> ---
>   drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
>   drivers/gpu/drm/xe/xe_pm.c  | 29 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_pm.h  |  1 +
>   3 files changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 2ff2e4a0bf72..6cf66ce25039 100644
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
AFAIU this will be removed once vram save/restore logic is implemented?

Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
Regards,
Badal
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index ad282eaf8a6a..9872a800b0b3 100644
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
