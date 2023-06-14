Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 453BBEB64D8
	for <intel-xe@archiver.kernel.org>; Wed, 14 Jun 2023 05:16:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EDD10E0D2;
	Wed, 14 Jun 2023 05:16:43 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0DAD10E0D2
 for <intel-xe@lists.freedesktop.org>; Wed, 14 Jun 2023 05:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686719801; x=1718255801;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2YOgkzE6/9Q2RALPb+jf3Bwkonzqg26TR9BJaNHorfI=;
 b=jrb8scGXPkPa7Pc7KCYX4a24jITFgG4hAXfQqf2akTSCN3UQqiQnpnFp
 kYeZ4OKYu01GyQ6ftObBb59X3UdJzMrhMNJ0XzE85w1QTz0OuH78mzzFr
 oXhvJ6ItMO4ncIJd7LoVaAxjoLLaSDCqP7jNwT1jq25ugTQpmbX1LDElG
 DKA56c81+8PhYzRaZZuuglQE6ueNEYNc1GWMWgfVb5F0ymgbya2eoOwQU
 owtzDlqpg+PB0I5ZMziN898n6Rd3Infcf1pmm/CvnA+ms9DRccPlgrGi4
 aQGSAL6mUcl+g7a7T+22xb2PUR0ckNWZUuA/UXNLagof5+Bv6O86XvoBC g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="361004078"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; d="scan'208";a="361004078"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jun 2023 22:16:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="958682826"
X-IronPort-AV: E=Sophos;i="6.00,241,1681196400"; d="scan'208";a="958682826"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 13 Jun 2023 22:16:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 13 Jun 2023 22:16:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Tue, 13 Jun 2023 22:16:35 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Tue, 13 Jun 2023 22:16:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DsNe2XwRF3bIjh9ZiLbZUzCZJKutkkmITtsUz1eOIYklzwt9Oj03DHx0OMrx5fBYuEp2C/+B5P62+NEa+80AtbXTT7SDHVdBybrTWRi44urK+R3neCz0T0TfsxoeWvsYcUi9jvq9eqfzKSmaoLulAx6Ecfxze8eeNh+bLQOQIsxv6KtKDDEk4oEDKORHQVmgvofBy5529RnCeXgCBRHIyoFjTmNxFG7dOw0QmPqSZpROuyskSY3TU+MwdtnH9KqEnXeTAnZo+FYt6C2ap9rgKmBd8Gxz5Xmp8NhDU4fW+kI7IzHIdPahuNmVtIEesd53y5+2U/4PNNg6LGpa2oSiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q8f+CV/qesn1aO6fEnUMvoUcIqFOXUs8+Z/8SaUStqo=;
 b=auIlnGALwUn/imWyxSJYFDKvo7OA/CQYztw1fALYoIqe/0+SUVJkflZSn1WvetOkhV51eil/IGjoK+/9JeuLMb+7sEgL5IP71l2jUyLVrUI8NnxBg2xYujljypsIAXCDc3RenguAbQANaBPM+mfriSiXTPhBRruyhhOT/bnbrITBqiz1DwkweVhad62S9V367watE5JhwLibzlegfs+wff2Sls6saRA+5yoFnYPfBNtSXpYYMCC3tpQcrIUclFonLICaGvfVJuw4g55JrCW1cFq1XdCjXALZZv1roFFR4nVCBaUKJKSTMxmrVDN+Ch2SdiATOVssSf+2Cqlhjfrs0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB7519.namprd11.prod.outlook.com (2603:10b6:a03:4c0::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 05:16:33 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 05:16:33 +0000
Message-ID: <1ac21da0-3573-3f01-e56c-55dbd6f36970@intel.com>
Date: Wed, 14 Jun 2023 10:46:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Content-Language: en-US
To: Badal Nilawar <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20230606125057.838618-1-badal.nilawar@intel.com>
 <20230606125057.838618-3-badal.nilawar@intel.com>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20230606125057.838618-3-badal.nilawar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN0PR01CA0022.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4e::19) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a5963db-a8cb-49f2-f616-08db6c96848e
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LFHVb+r+/OCbq37XZ5qcJJG497wNl/DWxZp1AfNbKSHsyF4JlPFY7z4zU6yHxjv/RuCPPAdyCKSovOrq1b3bBa0jTxKedLQYyB9LVvK2djK7nwZFRSiPkFdtQo7ut+TDKptOX1owudw/SH/4/hwVJ+GaAFmbrV04C/Awl7VFwls/P77JTXJMaZnK7pBuOlFQT7VK52Xn3cClidtNfozZVpj3uTwymR5Wc3D3jUNVR6L8I3oqh8yObCueyscqPkX57ONZwxJ/08+ZSDWp7bJf+igjcT2+9or/0EQ1H9Jiq8JUyQKDCtIR5YgzNX6QL19ELO2spW6L7cYQYM7+fleUnW9dMr88nk14OVve3yloDnwLVcDbpPpte1QV+lUL5aU4DLMkmeFVpYvFzphAkM2h2O0HlfEmfUP+lQMIFeGlcfSGcRszunOXnPb/lxLzfFrrEvFerCc4iQ0emPYbWdWcK61N2sF+07mhflOT/UxIhuGRDpel2G/B81+rOPXwrPmhvEI22vRNFMLQevzh2CS+hC74xZ8t2C4wUNIRZUWdiC6i+W1wv8tidS7K1684oWtNRUXP4SWSWgi6jlLTkV5lzOnDlcU26ASP9Jo5KHVVGMBtDqB3+l+ei/TyMcyLCcKGhd+djQVrwcZVzKAKajCJjZKjm1tm+maXpPP/5QGUaKcnLa7VKO+QJLBTguLLcB2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(376002)(396003)(136003)(346002)(366004)(451199021)(31686004)(66946007)(4326008)(66556008)(36756003)(186003)(478600001)(2616005)(30864003)(2906002)(66476007)(8676002)(6666004)(316002)(41300700001)(31696002)(107886003)(86362001)(6486002)(6506007)(53546011)(8936002)(44832011)(83380400001)(82960400001)(26005)(5660300002)(38100700002)(6512007)(43740500002)(45980500001)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bzgvbWt3cUJVMGxzcXlxUVlHL2w3V1FxdnAxaDdFVDhzRldtalRFQnRDamV4?=
 =?utf-8?B?dGxqclNFYTVHcXdqZWMyVjJTNU01N0YrMEk3UnFZR3dneFBvRmp4aGQ3OWpa?=
 =?utf-8?B?RHorRmtwZFMwVUZkeG1VdEVRUXliZXdNYjE2bEdGVG5GN240Qmpjb3ZpQzNJ?=
 =?utf-8?B?TnlrZHBBOGY4UWhQaU55VTFCL0daWnRWU0N1UnBEYU90a3dLV2lFQTluTmJn?=
 =?utf-8?B?NisybG5kcHcyS3NsYVhCVlljZ3FwS1crL3FBcUd1SzVFWkxCbm0rOUNQYXlB?=
 =?utf-8?B?TGVHNjFpbFB5RDAyTWg5SmRWbEFRaVpFVHExT1pmVTFTZlpqVmlkQ0xvY25L?=
 =?utf-8?B?MEpLSkI0eFFldU42U2ZBK3Rpc0xUckViQnp0eWF0RmRQRWVIM3NZN1JTUnV4?=
 =?utf-8?B?clhLM2lJT0ZBcjZ2alBodEZHTWR3QXpETTRNNTBuVUpmbzNScmEvbzZZNG96?=
 =?utf-8?B?MUxjTTJmUlYxem8wRFlRMUZUU0l2a1RVOUFCeWNCcEdQV0ZQS2FGRyszZXhm?=
 =?utf-8?B?WENVTlVlbnFTdVMvL1E5bEwzUHgvRkE2WlBZZmdTK0lLOUlVWlA2Z255Rm9I?=
 =?utf-8?B?dGx2aW8yWU1CWHcyR2puckdrQVA1K1I5SXZBVFI0M1dkc0FmMjBHd3dXTkIz?=
 =?utf-8?B?V1g4eGI5VlZqdmFYY2Z1bFJaT01ER3JKSlptZmM5ZmxLYUpQSGJKZjZMMWlV?=
 =?utf-8?B?NU95NEliUCtIVi8wbS9wYmZ0OEw5NnByVDRNTU5IL3Z0ak9vYUR2UHhreG9E?=
 =?utf-8?B?RXk5Z1ovNVdrTE84a3hwMDBDVUtEcTk5VDM1Wkk2U3hJaDFrdENuTHBWNG1o?=
 =?utf-8?B?UVVuRFpaeGxIM2J5UlpUZGJVc1hoa1FEdnNEa2h6cUlMYXdFUGpwYkZpbHZQ?=
 =?utf-8?B?YmlRS3JzeGdZa0JVdjF4WTJzalJZUGVEOVM3bkFNZXZzVWZObWdzbW5VeURM?=
 =?utf-8?B?dkJKOGFmbURCd2pFT3FHN2dKb25NOXN3QXlycGRNM2JGYmpCR1ppSVpYeC9O?=
 =?utf-8?B?L2tNbTJlVUEveUxhcWZlbXkrWFRTVWJFaXJkRDBBek0veU1YRmYxclFjZEFR?=
 =?utf-8?B?eGFrUEFIMjFJTDE2WEh1NU4xV253Tm5yRGhmVHFoaGg2L3cyQjRlRnBxQjYw?=
 =?utf-8?B?UHp6SmdBQnFuQjlvSUxndnQ0UVlOM2FCL21GS3laVTlLcGJSdndKVklNYUpR?=
 =?utf-8?B?Vm1rTG5UMTk1T1BMdjhjblZBZGFnbHBiY2N3dWxZQUpxQ2RkZjE4UVk2c2M5?=
 =?utf-8?B?UkUzQ3dNUlRJZzhyUFZKalNLT0FlZzNhazc5RHNHc3htT0gvZEZFMmlyMGZK?=
 =?utf-8?B?aXM3TmgxRmlrYjFsZzJjbUhuUGFHeE9XVGlOK0JHYzFvc3ZtaHpWTTdhbDBh?=
 =?utf-8?B?NnNieWw0M0RkUkptVjdSZENwbUNUTEM2ejJKUjR6MkJ1L0tTRnNqNllqbFVX?=
 =?utf-8?B?OWttbFR6U3R5RFdnWGF3ZVovK2pZVUxxVzdqeFBuRjgzZ1FrdFZPbVRaR2k1?=
 =?utf-8?B?bzYzZXcrMFRtcE1UaEptYUcwbU1PUG1KaVYxemRqSjZYYVdCYzM3QVptdzNK?=
 =?utf-8?B?SW9aUWh3K09yTDJPY2YrN2Q2UlRCLzB6MkxMK3lsa1puc2tkd0plWXhoQlhx?=
 =?utf-8?B?RWIvcUcrRlNFZUtMb2JNQ05mWVFTNFdBT1MyZmxTdE1pVEowWFQrb2JsQ2Ew?=
 =?utf-8?B?SnlXV2NDRkNDVEQ5bnNMQ2UrM1hmbkozckd5Wk9oMmg0Rk41WFZvT2N0NXVl?=
 =?utf-8?B?bjM0RytqdlN1dDVuNzVEcDRiYXR2T2NsRTN5WnFCUVhOb1QvQkE1eSs3VXcz?=
 =?utf-8?B?SWk4M3VZQ0lCMC9sbkpTT3NTUk9zcjlqWDl6cXNBR0hicXJVaW9HdmV4N1ZL?=
 =?utf-8?B?SWQ5V2ZyUkMxTTJKTDRTWUxHTjZMOElDclE0UFpSWlo0cW5mQkJpeEdESWZF?=
 =?utf-8?B?bEphdVRzamFqOG9yNStqaktHY3JsYzMxelFmSUdmcXpFblhWMWFTbFYrWFBj?=
 =?utf-8?B?M2l4NVFDUVBzV1pjbi9jZVZNK2pQQ1JxSGZhQXl2VmN2bXl6OTd5T081eURu?=
 =?utf-8?B?ZlhXakdPZU1ZS0FQVUlEeGVBVjMrRTNLZkt0anh6cTJFaFBBbnhmTDVvUkY5?=
 =?utf-8?Q?ffOTYisdS8TwfzAYBbFt9rv3N?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a5963db-a8cb-49f2-f616-08db6c96848e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 05:16:33.0106 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R1QqdDbElhgw6xfaUyBWcqCu7M9gcwgPqpK3sQCS/+lTZMDonWRxjS0CgG0gah7D5FLVF1zEfbk50vczPUumsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7519
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH 2/6] drm/xe/hwmon: Expose power attributes
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
Cc: jani.nikula@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


Hi Badal

On 6/6/2023 6:20 PM, Badal Nilawar wrote:
> Expose power_max (pl1) and power_rated_max (tdp) attributes
> 
> Co-developed-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
> ---
>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  22 ++
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h          |   4 +
>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h      |  34 ++
>   drivers/gpu/drm/xe/xe_hwmon.c                 | 342 +++++++++++++++++-
>   drivers/gpu/drm/xe/xe_hwmon.h                 |   4 +
>   drivers/gpu/drm/xe/xe_uc.c                    |   6 +
>   6 files changed, 408 insertions(+), 4 deletions(-)
>   create mode 100644 Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>   create mode 100644 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> 
> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> new file mode 100644
> index 000000000000..54a7b668009e
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
> @@ -0,0 +1,22 @@
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_max
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RW. Card reactive sustained  (PL1/Tau) power limit in microwatts.
> +
> +		The power controller will throttle the operating frequency
> +		if the power averaged over a window (typically seconds)
> +		exceeds this limit. A read value of 0 means that the PL1
> +		power limit is disabled, writing 0 disables the
> +		limit. Writing values > 0 will enable the power limit.
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> +What:		/sys/devices/.../hwmon/hwmon<i>/power1_rated_max
> +Date:		June 2023
> +KernelVersion:	6.3
> +Contact:	intel-gfx@lists.freedesktop.org
> +Description:	RO. Card default power limit (default TDP setting).
> +
> +		Only supported for particular Intel xe graphics platforms.
> +
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 0f920175526e..9d888aae907e 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -382,4 +382,8 @@
>   #define XEHPC_BCS5_BCS6_INTR_MASK		XE_REG(0x190118)
>   #define XEHPC_BCS7_BCS8_INTR_MASK		XE_REG(0x19011c)
>   
> +#define PVC_GT0_PACKAGE_RAPL_LIMIT		XE_REG(0x281008)
> +#define PVC_GT0_PACKAGE_POWER_SKU_UNIT		XE_REG(0x281068)
> +#define PVC_GT0_PACKAGE_POWER_SKU		XE_REG(0x281080)
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> new file mode 100644
> index 000000000000..4ad473e69e27
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
> @@ -0,0 +1,34 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2023 Intel Corporation
> + */
> +
> +#ifndef _XE_MCHBAR_REGS_H__
> +#define _XE_MCHBAR_REGS_H_
> +
> +#include "regs/xe_reg_defs.h"
> +
> +/*
> + * MCHBAR mirror.
> + *
> + * This mirrors the MCHBAR MMIO space whose location is determined by
> + * device 0 function 0's pci config register 0x44 or 0x48 and matches it in
> + * every way.
> + */
> +
> +#define MCHBAR_MIRROR_BASE_SNB			0x140000
> +
> +#define PCU_CR_PACKAGE_POWER_SKU		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5930)
> +#define   PKG_PKG_TDP				GENMASK_ULL(14, 0)
> +
> +#define PCU_CR_PACKAGE_POWER_SKU_UNIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x5938)
> +#define   PKG_PWR_UNIT				REG_GENMASK(3, 0)
> +#define   PKG_MIN_PWR				GENMASK_ULL(30, 16)
> +#define   PKG_MAX_PWR				GENMASK_ULL(46, 32)
PKG_MIN_PWR & PKG_MAX_PWR are under PCU_CR_PACKAGE_POWER_SKU
Should be moved above
> +
> +#define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
> +#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
> +#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
> +
> +#endif
> +
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 65e5488dec82..8e248e806559 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -7,42 +7,358 @@
>   #include <linux/hwmon-sysfs.h>
>   #include <linux/types.h>
>   
> +#include "regs/xe_mchbar_regs.h"
>   #include "regs/xe_gt_regs.h"
>   #include "xe_device.h"
>   #include "xe_hwmon.h"
>   #include "xe_mmio.h"
>   #include "xe_gt.h"
> +#include "i915_drv.h"
> +
> +enum hwm_reg_name {
> +	pkg_rapl_limit,
> +	pkg_power_sku,
> +	pkg_power_sku_unit,
> +};
> +
> +enum hwm_reg_operation {
> +	reg_read,
> +	reg_write,
> +	reg_rmw,
> +};
> +
> +/*
> + * SF_* - scale factors for particular quantities according to hwmon spec.
> + * - voltage  - millivolts
> + * - power  - microwatts
> + */
> +#define SF_VOLTAGE	1000
> +#define SF_POWER	1000000
>   
>   struct hwm_drvdata {
>   	struct xe_hwmon *hwmon;
>   	struct device *hwmon_dev;
> +	struct xe_gt *gt;
>   	char name[12];
> +	bool reset_in_progress;
> +	wait_queue_head_t waitq;
>   };
>   
>   struct xe_hwmon {
>   	struct hwm_drvdata ddat;
>   	struct mutex hwmon_lock;	/* counter overflow logic and rmw */
> +	int scl_shift_power;
>   };
>   
> +struct xe_reg hwm_get_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name)
> +{
> +	switch (reg_name) {
> +	case pkg_rapl_limit:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_RAPL_LIMIT;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_RAPL_LIMIT;
> +		else
> +			return XE_REG(0);
returns XE_REG(0) at the end. Can be removed
> +		break;
> +	case pkg_power_sku:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_POWER_SKU;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_POWER_SKU;
> +		else
> +			return XE_REG(0);
> +		break;
> +	case pkg_power_sku_unit:
> +		if (IS_DG2(gt_to_xe(ddat->gt)))
> +			return PCU_CR_PACKAGE_POWER_SKU_UNIT;
> +		else if (IS_PONTEVECCHIO(gt_to_xe(ddat->gt)))
> +			return PVC_GT0_PACKAGE_POWER_SKU_UNIT;
> +		else
> +			return XE_REG(0);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return XE_REG(0);
> +}
> +
> +int process_hwmon_reg(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name,
> +		      enum hwm_reg_operation operation, u32 *value,
> +		      u32 clr, u32 set)
> +{
> +	struct xe_reg reg;
> +	int ret = 0;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	switch (operation) {
> +	case reg_read:
> +		*value = xe_mmio_read32(ddat->gt, reg);
> +		break;
> +	case reg_write:
> +		xe_mmio_write32(ddat->gt, reg, *value);
> +		break;
> +	case reg_rmw:
> +		*value = xe_mmio_rmw32(ddat->gt, reg, clr, set);
> +		break;
> +	default:
> +		ret = -EOPNOTSUPP;
> +	}
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return ret;
Return 0 instead of extra variable
> +}
> +
> +int process_hwmon_reg_read64(struct hwm_drvdata *ddat, enum hwm_reg_name reg_name, u64 *value)
> +{
> +	struct xe_reg reg;
> +
> +	reg = hwm_get_reg(ddat, reg_name);
> +
> +	if (!reg.raw)
> +		return -EOPNOTSUPP;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	*value = xe_mmio_read64(ddat->gt, reg);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +
> +	return 0;
> +}
> +
> +#define PL1_DISABLE 0
> +
> +/*
> + * HW allows arbitrary PL1 limits to be set but silently clamps these values to
> + * "typical but not guaranteed" min/max values in rg.pkg_power_sku. Follow the
> + * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
> + * clamped values when read. Write/read I1 also follows the same pattern.
> + */
Last line about I1 should be added in the next patch
> +static int hwm_power_max_read(struct hwm_drvdata *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
> +	u64 r, min, max;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &reg_val, 0, 0);
> +	/* Check if PL1 limit is disabled */
> +	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
> +		*value = PL1_DISABLE;
> +		xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +		return 0;
> +	}
> +
> +	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	process_hwmon_reg_read64(ddat, pkg_power_sku, &r);
> +	min = REG_FIELD_GET(PKG_MIN_PWR, r);
> +	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
> +	max = REG_FIELD_GET(PKG_MAX_PWR, r);
> +	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
> +
> +	if (min && max)
> +		*value = clamp_t(u64, *value, min, max);
> +
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +	return 0;
> +}
> +
> +static int hwm_power_max_write(struct hwm_drvdata *ddat, long value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	DEFINE_WAIT(wait);
> +	int ret = 0;
> +	u32 nval;
> +
> +	/* Block waiting for GuC reset to complete when needed */
> +	for (;;) {
> +		mutex_lock(&hwmon->hwmon_lock);
> +
> +		prepare_to_wait(&ddat->waitq, &wait, TASK_INTERRUPTIBLE);
> +
> +		if (!hwmon->ddat.reset_in_progress)
> +			break;
> +
> +		if (signal_pending(current)) {
> +			ret = -EINTR;
> +			break;
> +		}
> +
> +		mutex_unlock(&hwmon->hwmon_lock);
> +
> +		schedule();
> +	}
> +	finish_wait(&ddat->waitq, &wait);
> +	if (ret)
> +		goto unlock;
> +
> +	xe_device_mem_access_get(gt_to_xe(ddat->gt));
> +
> +	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
> +	if (value == PL1_DISABLE) {
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +		process_hwmon_reg(ddat, pkg_rapl_limit, reg_read, &nval,
> +				  PKG_PWR_LIM_1_EN, 0);
> +
> +		if (nval & PKG_PWR_LIM_1_EN)
> +			ret = -ENODEV;
> +		goto exit;
> +	}
> +
> +	/* Computation in 64-bits to avoid overflow. Round to nearest. */
> +	nval = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
> +	nval = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, nval);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &nval,
> +			  PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, nval);
> +exit:
> +	xe_device_mem_access_put(gt_to_xe(ddat->gt));
> +unlock:
> +	mutex_unlock(&hwmon->hwmon_lock);
> +
> +	return 0;
> +}
> +
> +static int hwm_power_rated_max_read(struct hwm_drvdata *ddat, long *value)
> +{
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 reg_val;
xe_device_mem_access_get needs to be added?

Thanks
Riana
> +
> +	process_hwmon_reg(ddat, pkg_power_sku, reg_read, &reg_val, 0, 0);
> +	reg_val = REG_FIELD_GET(PKG_PKG_TDP, reg_val);
> +	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
> +
> +	return 0;
> +}
> +
>   static const struct hwmon_channel_info *hwm_info[] = {
> +	HWMON_CHANNEL_INFO(power, HWMON_P_MAX | HWMON_P_RATED_MAX),
>   	NULL
>   };
>   
> +static umode_t
> +hwm_power_is_visible(struct hwm_drvdata *ddat, u32 attr, int chan)
> +{
> +	u32 reg_val;
> +
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return process_hwmon_reg(ddat, pkg_rapl_limit,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0664;
> +	case hwmon_power_rated_max:
> +		return process_hwmon_reg(ddat, pkg_power_sku,
> +					 reg_read, &reg_val, 0, 0) ? 0 : 0444;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static int
> +hwm_power_read(struct hwm_drvdata *ddat, u32 attr, int chan, long *val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_read(ddat, val);
> +	case hwmon_power_rated_max:
> +		return hwm_power_rated_max_read(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static int
> +hwm_power_write(struct hwm_drvdata *ddat, u32 attr, int chan, long val)
> +{
> +	switch (attr) {
> +	case hwmon_power_max:
> +		return hwm_power_max_write(ddat, val);
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	hwmon->ddat.reset_in_progress = true;
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, 0);
> +	*old = !!(r & PKG_PWR_LIM_1_EN);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old)
> +{
> +	struct xe_hwmon *hwmon = xe->hwmon;
> +	struct hwm_drvdata *ddat = &hwmon->ddat;
> +	u32 r;
> +
> +	if (!hwmon || process_hwmon_reg(ddat, pkg_rapl_limit,
> +					reg_read, &r, 0, 0))
> +		return;
> +
> +	mutex_lock(&hwmon->hwmon_lock);
> +
> +	process_hwmon_reg(ddat, pkg_rapl_limit, reg_rmw, &r,
> +			  PKG_PWR_LIM_1_EN, old ? PKG_PWR_LIM_1_EN : 0);
> +
> +	hwmon->ddat.reset_in_progress = false;
> +	wake_up_all(&hwmon->ddat.waitq);
> +
> +	mutex_unlock(&hwmon->hwmon_lock);
> +}
> +
>   static umode_t
>   hwm_is_visible(const void *drvdata, enum hwmon_sensor_types type,
>   	       u32 attr, int channel)
>   {
> +	struct hwm_drvdata *ddat = (struct hwm_drvdata *)drvdata;
> +	int ret;
> +
>   	switch (type) {
> +	case hwmon_power:
> +		ret = hwm_power_is_visible(ddat, attr, channel);
> +		break;
>   	default:
> -		return 0;
> +		ret = 0;
>   	}
> +
> +	return ret;
>   }
>   
>   static int
>   hwm_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	 int channel, long *val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_read(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -52,7 +368,11 @@ static int
>   hwm_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   	  int channel, long val)
>   {
> +	struct hwm_drvdata *ddat = dev_get_drvdata(dev);
> +
>   	switch (type) {
> +	case hwmon_power:
> +		return hwm_power_write(ddat, attr, channel, val);
>   	default:
>   		return -EOPNOTSUPP;
>   	}
> @@ -70,8 +390,19 @@ static const struct hwmon_chip_info hwm_chip_info = {
>   };
>   
>   static void
> -hwm_get_preregistration_info(struct xe_device *xe)
> +hwm_get_preregistration_info(struct hwm_drvdata *ddat)
>   {
> +	struct xe_hwmon *hwmon = ddat->hwmon;
> +	u32 val_sku_unit = 0;
> +	int ret;
> +
> +	ret = process_hwmon_reg(ddat, pkg_power_sku_unit, reg_read, &val_sku_unit, 0, 0);
> +	/*
> +	 * The contents of register pkg_power_sku_unit do not change,
> +	 * so read it once and store the shift values.
> +	 */
> +	if (!ret)
> +		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>   }
>   
>   void xe_hwmon_register(struct xe_device *xe)
> @@ -96,15 +427,18 @@ void xe_hwmon_register(struct xe_device *xe)
>   	ddat->hwmon = hwmon;
>   	snprintf(ddat->name, sizeof(ddat->name), "xe");
>   
> -	hwm_get_preregistration_info(xe);
> +	init_waitqueue_head(&ddat->waitq);
> +
> +	hwm_get_preregistration_info(ddat);
>   
>   	drm_dbg(&xe->drm, "Register HWMON interface\n");
>   
> -	/*  hwmon_dev points to device hwmon<i> */
> +	/* hwmon_dev points to device hwmon<i> */
>   	hwmon_dev = devm_hwmon_device_register_with_info(dev, ddat->name,
>   							 ddat,
>   							 &hwm_chip_info,
>   							 NULL);
> +
>   	if (IS_ERR(hwmon_dev)) {
>   		xe->hwmon = NULL;
>   		return;
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h b/drivers/gpu/drm/xe/xe_hwmon.h
> index a078eeb0a68b..a5dc693569c5 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.h
> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
> @@ -14,9 +14,13 @@ struct xe_device;
>   #if IS_REACHABLE(CONFIG_HWMON)
>   void xe_hwmon_register(struct xe_device *xe);
>   void xe_hwmon_unregister(struct xe_device *xe);
> +void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old);
> +void xe_hwmon_power_max_restore(struct xe_device *xe, bool old);
>   #else
>   static inline void xe_hwmon_register(struct xe_device *xe) { };
>   static inline void xe_hwmon_unregister(struct xe_device *xe) { };
> +static inline void xe_hwmon_power_max_disable(struct xe_device *xe, bool *old) { };
> +static inline void xe_hwmon_power_max_restore(struct xe_device *xe, bool old) { };
>   #endif
>   
>   #endif /* __XE_HWMON_H__ */
> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
> index 70eabf567156..9df5a3a85dc3 100644
> --- a/drivers/gpu/drm/xe/xe_uc.c
> +++ b/drivers/gpu/drm/xe/xe_uc.c
> @@ -13,6 +13,7 @@
>   #include "xe_huc.h"
>   #include "xe_uc_fw.h"
>   #include "xe_wopcm.h"
> +#include "xe_hwmon.h"
>   
>   static struct xe_gt *
>   uc_to_gt(struct xe_uc *uc)
> @@ -127,11 +128,15 @@ int xe_uc_init_hwconfig(struct xe_uc *uc)
>   int xe_uc_init_hw(struct xe_uc *uc)
>   {
>   	int ret;
> +	bool pl1en;
>   
>   	/* GuC submission not enabled, nothing to do */
>   	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>   		return 0;
>   
> +	/* Disable a potentially low PL1 power limit to allow freq to be raised */
> +	xe_hwmon_power_max_disable(uc_to_xe(uc), &pl1en);
> +
>   	ret = xe_uc_sanitize_reset(uc);
>   	if (ret)
>   		return ret;
> @@ -160,6 +165,7 @@ int xe_uc_init_hw(struct xe_uc *uc)
>   	if (ret)
>   		return ret;
>   
> +	xe_hwmon_power_max_restore(uc_to_xe(uc), pl1en);
>   	/* We don't fail the driver load if HuC fails to auth, but let's warn */
>   	ret = xe_huc_auth(&uc->huc);
>   	XE_WARN_ON(ret);
