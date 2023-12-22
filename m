Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC818C41535
	for <intel-xe@archiver.kernel.org>; Fri, 22 Dec 2023 20:03:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B6E10E84B;
	Fri, 22 Dec 2023 20:03:13 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE83C10E849
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Dec 2023 20:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703275391; x=1734811391;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=1EFBPCDuKUko7f6vmZ0W8F8D7iB/eXzRR2q/nPPwoNM=;
 b=OSG53Pfnt3TXRNbYI2EKHlkghqNho7ig2gkm8pKbDCoBi0Liu9BLq+S8
 mA0LiDgEX0l5PJtBrROKUdFeX6BsPKKirMBDj61cyRjrBM5EC7bNFXO50
 ur993qXoDRtIVRkuY8frZioZswktXxkfGRY+ZFBQGCvuV8R2tyx2+X+p5
 QryhDd2gV8ZNpNBz7UTc2w3fu3V2RtLjpnEv/WcfkWYYLAKM3GjCf0R4g
 HxHJB9TBNzK6JG1Ze5yT/IyXUNheOo8W80dSwM9DIwkbVvpjkuag7LdPn
 VaKsQUmyua72yD1BR1MJWpwMZTOstZCq4AKS1oLLsabpGZgQNih9eG+aL g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="395893942"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
 d="scan'208,217";a="395893942"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Dec 2023 12:03:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="920729635"
X-IronPort-AV: E=Sophos;i="6.04,297,1695711600"; 
 d="scan'208,217";a="920729635"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Dec 2023 12:03:10 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 12:03:09 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Dec 2023 12:03:09 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Dec 2023 12:03:09 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Dec 2023 12:03:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SNaLxToNAtk7Keof7bYBQwggG/cWTfurfk8UEiOfGTMuRr+cTm0gmRD3HhbEJjYfVf+YsjGt+7Grh0kAXzFp9YEXxOlXRvTgOh2M7GVXg251XOwvPF8bffVnntbXGtR0wnvaaeZ0lCf4vsdSvTLtqxMFemio1SGoNyQsQ+XrAZtdMOfKZ8tELCaiIcuQrcwbZpU4Q4hOzmv7LdIqYxTVMD+BcdPQPVGr8/zJeU4jHG2GtxHLIxxNsMtEpK/OiVFVgv9DCj5BU9pQs0Ovv0bIt4qkTsA5GrtGhHE6+oLjnOaI0A4+YZVnn5Wl1tpP007EszwEYunogVcDFmYLWCHXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YR0qoxuwHyIcc5f5KiS4KR+yicUXIE1BwbgdtVCrrkM=;
 b=Vk7BUQY6wNk/GA/ytVJgJ61p9LR2N+j6MeiPQ/uX2eifjS4V+Gjszajs+SY4nP4cckK5b/qJ3ooIIYyBikpyCXH+fHGtkJA+fPad5/6UfRr7Yb1kY9tqAOOPeBxz5jmwHOw+uWPeBQd5jbC71AyJaebuPmKyVNVtTcTgojttgYSK7q0aotE8ewdC8/K2dwN0mhYOKwZtZn+Uh0uAviDVTWanS9jO7pe4FrUw4utAuRw93LUo7cw5eUYvWDZGIbwd/wSJAyH9MVfxk5NQMLAU0Qd5l3NnxdeaP9+xNJtXjoyzhCFaJA5YQAHgx0GJ5KgTU6cFSfUimVzeJtpu8y/t3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB4274.namprd11.prod.outlook.com (2603:10b6:a03:1c1::23)
 by DM3PR11MB8684.namprd11.prod.outlook.com (2603:10b6:0:4a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 20:03:07 +0000
Received: from BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13]) by BY5PR11MB4274.namprd11.prod.outlook.com
 ([fe80::16a8:c3ae:ef16:3d13%7]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 20:03:06 +0000
Content-Type: multipart/alternative;
 boundary="------------RmHfmYMiEnXfQ8ZBfzMzykdF"
Message-ID: <112dd04d-5b84-4998-8800-522d9b6ca996@intel.com>
Date: Fri, 22 Dec 2023 12:03:04 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] drm/xe/guc: Add PMU counter for total active ticks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231222074602.817518-1-riana.tauro@intel.com>
 <20231222074602.817518-6-riana.tauro@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20231222074602.817518-6-riana.tauro@intel.com>
X-ClientProxiedBy: SJ0PR05CA0143.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::28) To BY5PR11MB4274.namprd11.prod.outlook.com
 (2603:10b6:a03:1c1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB4274:EE_|DM3PR11MB8684:EE_
X-MS-Office365-Filtering-Correlation-Id: b5753fbf-e2fb-424a-a581-08dc0329036b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: N5qFapNPkWHXCLtvCNjXgr3xN+NfvMM6VoSsDFBoW4gYQGhYoEq6mnVepefW6GQlhXbkHOjDMhMrjfKIHCIRP/EN9GX9oJx839rthiwKGzgAvwD4mPmgJh3zMpMX5LThdFsxTOOP0ikKyrHPfnqIKNT0v8TtITiYe7hB6DpsYc/knyvpk1INJkUKmvuXz4P9gx6jVgzu6v+tgNh7j+fJ9VF/p2M17AlEWd1G0xrRQJmjpwRMWJYWbVPj0LHkinG8yBhg1b//RrZjXXGIqjzhkVQalSCLiF8LdyjH0ndZVVddq5unAzvBuBu67oWyN6O0WbHPIeD0K85CQzWd7fFLBt+Yte+4OVKsbrFjlj8cWI4iKO/QAiwhoJYWDcg0d5o/YjS+u6kiMsKgDHhJHSweQ4fugCMGYQC9Gm/RQiYXOyCA5Z2OVDBEdXjMhmlS9e6F4bvmBfXteejUqPnoAQ0istfN0qofb31VQOGz6gFEeRdspKskkQVX+FKltY4t3Q6KHXufUeDpZ/XviOYXmzWjt96gAcG4AQW2wGv6HyfTWvwekYriQWEMAiETVqPV+TGQw4JPq5IzbPsBQbRT+td1+olMn6XFqzH3pvXWX17do1DCsX12jMgAm9wih1u5SOWaTxDPG90hgAvtUAaG3e181Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4274.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(316002)(30864003)(2906002)(2616005)(26005)(8936002)(6486002)(38100700002)(478600001)(83380400001)(66556008)(66476007)(66946007)(6512007)(53546011)(5660300002)(33964004)(6506007)(4326008)(8676002)(31686004)(82960400001)(41300700001)(36756003)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2o2cmxoR2hIWDZxY3BWOVN4Q1VYN0k1ZERiTGYwRnJJY1pEbTduaVhRUmVo?=
 =?utf-8?B?dFk0ZWcwc3AvRFZMUmF0V1hqNTlGZkdQTEhNUUs4ems2ZVVweTlsWG9zRzdW?=
 =?utf-8?B?eGFWanRSTEUvbWVtNTJxMnF3cFVLWFVzaXJVSGcrWFozYXNHU3RGc080Y2Fa?=
 =?utf-8?B?VnpRczhIcEZ0NUFvL3FURWM3YkppNWs2M3hwYnF6REQwREtaWmtBdDJ0Mkd3?=
 =?utf-8?B?N1REVFFaU2Q2Y2htMllCaml1QVFETVllWElVNGc5UVdkb20vLzM0NmlYQmlN?=
 =?utf-8?B?Q2E2R01kMHR2aGFzZnFLRmZDdVFod3VOdzBaVlpjdSt2Q2F6YktjZ1dNWkJu?=
 =?utf-8?B?MlRYZnliWjlaZ0Q4ZjRoWjdTa3Y2Z0NDcEtjUjNCN2Z0TFIrRDVCTGlOYzB6?=
 =?utf-8?B?cDUzOEJBbCtLemdnaGhyek5XR0dJTjVXUDY4OE8veVpLS3lMdzNyYzhrcTl1?=
 =?utf-8?B?V0lvNHBselBScGVzSVZwZlU4SEFvRmgzWTBVN3pzdVV3TFFXSVZMempRM0xx?=
 =?utf-8?B?bFpHUWRNM3pVcmdrSURNTGtrVGxJaHdBV2xzQk93QUhnYTZtWUh4QXlIdnBZ?=
 =?utf-8?B?STVUdjRINGFUYVR3ZG9RWXFBK2pXcDIyOW93U0QwVkJWQlg4bW5hODFJRERY?=
 =?utf-8?B?WWdONnM4OHNsN0pJdkROZy9PN0MxSm5FU0ZjQUxqSnhYcE95MlZYc2ZxN3FC?=
 =?utf-8?B?eGs3aXQrUm5FWEZ6M0RhMXhVcXg4QzVCUllJVERxa24rQVlaUEJYTXd2S01o?=
 =?utf-8?B?SmhYTGE4UkQ4T0ZTdTFUbktUMWxzbnlIQnJnbCtYem9pVkRPT1gwTFo5akQy?=
 =?utf-8?B?dWh5bFY0MmpEMEhmcFlnWXJkSFVIR1UxaVVCK1FrSk50MWFpM3BEUTRzd1Z5?=
 =?utf-8?B?NzBDWS9Sajg2QTVFT1htRmY0RDV0NC9iRXY4T0dJMC80ejQvQ2NOV1JqbktX?=
 =?utf-8?B?K1I1c3lKM1ljNUJ6a2k5ckdyVVBadVJ0TFBwWncxRHhSbmYvb2ZPbnRXc0dw?=
 =?utf-8?B?SnNmZGhYZXZqV2RGYUhzR29LcVRjZ3BOWUJEK2ZCWUdaaFFmbU5aOFVjVWov?=
 =?utf-8?B?SmtBZ2h1djBMUWxmQU9ISXQ2NStPWmZXU2FEQzlzdzN6TGN5a0NIQUtORE9h?=
 =?utf-8?B?QXR3Yi9kSlZDRXVXajg4THZucEgxSSt3WDlRODBacXFZQ3RESkRpMU5vWCtB?=
 =?utf-8?B?bGJWTUxNUkludzZyM2V0b0RHOUx6NXNpanZSdWUva0NvYjh2b3FHWGliQzR2?=
 =?utf-8?B?WWZFVGtlV3hjOGEzYzhZa1Bsc29Sb1l2eGUxR3VVVC9rekR4UlkxKy9XbnNM?=
 =?utf-8?B?S0JCNC9tTmdDNStBS1BTaEl1RFdPS3hUeDF2c3hib1FYZ2I2bTZCU0JaM1ZG?=
 =?utf-8?B?aFRMT0NkUEdhMFBKeFl2Wjl3bU5BUXcrZjFob2sveldIUmRHSmphSkZEVUM1?=
 =?utf-8?B?V3FmZ2c5VkZrNzZiUEY3SVVqWFc0eDg4TXhnL2h0V1UxWStXTXNqSDBDc29C?=
 =?utf-8?B?d1kzZ21TcXl0RXVpZ0c1YkQ3Tkh4d0pTYXJPYjFrbjBFWThDYllmTzRvSEZ5?=
 =?utf-8?B?SDdIdElxdjIzNU5ucU83WHp3S0UyVjdwbjBwQ2hEUkVnRSt1dFNNRUdzVzRB?=
 =?utf-8?B?aGdmdmp6czNWeXFWRldMaUorVllaYWpTYlkzYXpRTE1JUVhWUDBLanJDWkdi?=
 =?utf-8?B?Z0xITm51bDNNZ1hHSHllc0pxbXA2OTFrUFpHVTVWZWFFbG5jeFBYMzJqSS8v?=
 =?utf-8?B?bktCbDVlWjJtUjVac3Y3QXNna1V2RVgxVkpubjRQMFlIbi9pU3BuN1RkRzNX?=
 =?utf-8?B?bTZYdVB2czJvdUViWVF4SXpCbks2eGpFN1Jzcm4vbEVwSHJ0WEdDblVMbS9r?=
 =?utf-8?B?d3RoY2VaSW1tTGdwK3lvQjdCZHI3VEY2TDYxZ3lqNit4RjRrYXRyNzRwZ1VJ?=
 =?utf-8?B?aFplVktnWVB1TG9vSmZMMXVRc0RDRTA1RkxMTk0rbW45Tk1BTFFSUXpjNHBY?=
 =?utf-8?B?R3hmNElTWHlHSmFJVFRVQi9RbWJ5eWpoVU90MVViSUJoVURKb1lBdVFEYkps?=
 =?utf-8?B?K0R5ZFdhSEVmTDRnc3dkVGYvTjl3R043OXAwbnE2dm5oUG5KR3ViUncycmFh?=
 =?utf-8?B?WUNvQmtsekJWcXhOSi9iRWkxa3orQU53bEV3WHo1azh5alRmeGdYd3YrT1pY?=
 =?utf-8?B?ZUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b5753fbf-e2fb-424a-a581-08dc0329036b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4274.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 20:03:06.8447 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRBt2s1RSFzXXJOA5ehI+O7yv1QP7EBPDXAguhtIDknnadwPY1wq2sscBqu6mA2ttyuzr1P4SZJxnRdjZLAM6idAoNdSmMWP41wEadrNriY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8684
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

--------------RmHfmYMiEnXfQ8ZBfzMzykdF
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 12/21/2023 11:45 PM, Riana Tauro wrote:
> GuC provides engine busyness ticks as a 64 bit counter which count
> as clock ticks. These counters are maintained in a
> shared memory buffer and internally updated on a continuous basis.
>
> GuC also provides a periodically total active ticks that GT has been
> active for (GuC loaded and running).
> This counter is exposed to the user such that busyness can
> be calculated as a percentage using
>
> busyness % = (engine active ticks/total active ticks) * 100.
>
> This patch provides a pmu counter for total active ticks.
>
> This is listed by perf tool as
>
> sudo ./perf list
> 	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]
>
> and can be read using
>
> sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
>          time 	    counts  unit 	events
>      1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
>      2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
>      3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/
>
> v2: change commit message and comment for
>      total active ticks (Umesh, Tvrtko)
>
> Co-developed-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa<umesh.nerlige.ramappa@intel.com>
> Signed-off-by: Riana Tauro<riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
>   drivers/gpu/drm/xe/xe_gt.h                  |  2 +-
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 72 ++++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
>   drivers/gpu/drm/xe/xe_pmu.c                 | 74 +++++++++++++++++++--
>   include/uapi/drm/xe_drm.h                   | 23 ++++++-
>   6 files changed, 162 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
> index 58daadc00363..5825471a3422 100644
> --- a/drivers/gpu/drm/xe/xe_gt.c
> +++ b/drivers/gpu/drm/xe/xe_gt.c
> @@ -789,3 +789,14 @@ u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
>   {
>   	return xe_guc_engine_busyness_ticks(&gt->uc.guc, hwe);
>   }
> +
> +/**
> + * xe_gt_total_active_ticks - Return total active ticks
> + * @gt: GT structure
> + *
> + * Returns total active ticks that the GT was active for.
> + */
> +u64 xe_gt_total_active_ticks(struct xe_gt *gt)
> +{
> +	return xe_guc_engine_busyness_active_ticks(&gt->uc.guc);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
> index 4303ec48c404..9bac85cdf609 100644
> --- a/drivers/gpu/drm/xe/xe_gt.h
> +++ b/drivers/gpu/drm/xe/xe_gt.h
> @@ -43,7 +43,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
>   void xe_gt_sanitize(struct xe_gt *gt);
>   
>   u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
> -
> +u64 xe_gt_total_active_ticks(struct xe_gt *gt);
>   /**
>    * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
>    * first that matches the same reset domain as @class
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> index af7b6e768751..24e72555647a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
> @@ -20,53 +20,83 @@
>    * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
>    * a caveat that is not real time, best effort only).
>    *
> + * In addition to the engine busyness ticks, there is also a total time count which
> + * is a free running GT timestamp counter.
> + *
> + * Note that counters should be used as ratios of each other for calculating a
> + * percentage.
> + *
>    * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
> + * total active ticks (ticks_gt)	: total clock ticks
> + *
> + * engine busyness % = (ticks_engine / ticks_gt) * 100
>    */
>   
>   static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>   					  struct xe_hw_engine *hwe,
> -					  struct iosys_map *engine_map)
> +					  struct iosys_map *engine_map,
> +					  struct iosys_map *global_map)
>   {
>   	struct iosys_map *map;
>   	size_t offset;
>   	u32 instance;
>   	u8 guc_class;
>   
> -	guc_class = xe_engine_class_to_guc_class(hwe->class);
> -	instance = hwe->logical_instance;
> +	if (hwe) {
> +		guc_class = xe_engine_class_to_guc_class(hwe->class);
> +		instance = hwe->logical_instance;
> +	}
>   
>   	map = &guc->busy.bo->vmap;
>   
> -	offset = offsetof(struct guc_engine_observation_data,
> -			  engine_data[guc_class][instance]);
> +	if (hwe) {
> +		offset = offsetof(struct guc_engine_observation_data,
> +				  engine_data[guc_class][instance]);
> +		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
> +	}
>   
> -	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
> +	*global_map = IOSYS_MAP_INIT_OFFSET(map, 0);
>   }
>   
>   static void guc_engine_busyness_get_usage(struct xe_guc *guc,
>   					  struct xe_hw_engine *hwe,
> -					  u64 *ticks_engine)
> +					  u64 *ticks_engine,
> +					  u64 *ticks_gt)
>   {
> -	struct iosys_map engine_map;
> -	u64 engine_ticks = 0;
> +	struct iosys_map engine_map, global_map;
> +	u64 engine_ticks = 0, gt_ticks = 0;
>   	int i = 0;
>   
> -	guc_engine_busyness_usage_map(guc, hwe, &engine_map);
> +	guc_engine_busyness_usage_map(guc, hwe, &engine_map, &global_map);
>   
>   #define read_engine_usage(map_, field_) \
>   	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
>   
> +#define read_global_field(map_, field_) \
> +	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
> +
>   	do {
> -		engine_ticks = read_engine_usage(&engine_map, total_execution_ticks);
> +		if (hwe)
> +			engine_ticks = read_engine_usage(&engine_map, total_execution_ticks);
> +
> +		gt_ticks = read_global_field(&global_map, gt_timestamp);
>   
> -		if (read_engine_usage(&engine_map, total_execution_ticks) == engine_ticks)
> +		if (hwe && read_engine_usage(&engine_map, total_execution_ticks) != engine_ticks)
> +			continue;
> +
> +		if (read_global_field(&global_map, gt_timestamp) == gt_ticks)
>   			break;
> +
>   	} while (++i < 6);
>   
>   #undef read_engine_usage
> +#undef read_global_field
>   
>   	if (ticks_engine)
>   		*ticks_engine = engine_ticks;
> +
> +	if (ticks_gt)
> +		*ticks_gt = gt_ticks;
>   }
>   
>   static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
> @@ -92,6 +122,22 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
>   	xe_bo_unpin_map_no_vm(guc->busy.bo);
>   }
>   
> +/*
> + * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
> + * @guc: The GuC object
> + *
> + * Returns total active ticks that the GT has been running for
> + * (GuC loaded and running).
> + */
> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)

nit: Could we have the word gt somewhere in this function so its clear 
what we are asking for? like xe_guc_engine_busyness_active_gt_ticks?

Other than that,

Reviewed-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

> +{
> +	u64 ticks_gt;
> +
> +	guc_engine_busyness_get_usage(guc, NULL, NULL, &ticks_gt);
> +
> +	return ticks_gt;
> +}
> +
>   /*
>    * xe_guc_engine_busyness_ticks - Gets current accumulated
>    *				  engine busyness ticks
> @@ -104,7 +150,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
>   {
>   	u64 ticks_engine;
>   
> -	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
> +	guc_engine_busyness_get_usage(guc, hwe, &ticks_engine, NULL);
>   
>   	return ticks_engine;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> index d70f06209896..57325910ebc4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
> @@ -12,6 +12,7 @@ struct xe_hw_engine;
>   struct xe_guc;
>   
>   int xe_guc_engine_busyness_init(struct xe_guc *guc);
> +u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
>   u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
>   
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
> index 371ca6d7e215..c2be157a6f5d 100644
> --- a/drivers/gpu/drm/xe/xe_pmu.c
> +++ b/drivers/gpu/drm/xe/xe_pmu.c
> @@ -51,6 +51,20 @@ static bool is_engine_event(struct perf_event *event)
>   	return config_counter(event->attr.config) < __DRM_XE_PMU_OTHER(0, 0);
>   }
>   
> +static int
> +config_status(struct xe_device *xe, u64 config)
> +{
> +	unsigned int gt_id = config_gt_id(config);
> +
> +	if (gt_id >= XE_PMU_MAX_GT)
> +		return -ENOENT;
> +
> +	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
> +		return 0;
> +
> +	return -ENOENT;
> +}
> +
>   static int engine_event_status(struct xe_hw_engine *hwe,
>   			       enum drm_xe_pmu_engine_sample sample)
>   {
> @@ -113,11 +127,13 @@ static int xe_pmu_event_init(struct perf_event *event)
>   	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>   		return -EINVAL;
>   
> -	if (is_engine_event(event)) {
> +	if (is_engine_event(event))
>   		ret = engine_event_init(event);
> -		if (ret)
> -			return ret;
> -	}
> +	else
> +		ret = config_status(xe, event->attr.config);
> +
> +	if (ret)
> +		return ret;
>   
>   	if (!event->parent) {
>   		drm_dev_get(&xe->drm);
> @@ -131,7 +147,8 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   {
>   	struct xe_device *xe =
>   		container_of(event->pmu, typeof(*xe), pmu.base);
> -	const unsigned int gt_id = config_gt_id(event->attr.config);
> +	u64 config = event->attr.config;
> +	const unsigned int gt_id = config_gt_id(config);
>   	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>   	u64 val;
>   
> @@ -147,6 +164,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
>   			val = xe_gt_engine_busy_ticks(gt, hwe);
>   		else
>   			drm_warn(&xe->drm, "unknown pmu engine event\n");
> +	} else {
> +		if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
> +			val = xe_gt_total_active_ticks(gt);
> +		else
> +			drm_warn(&xe->drm, "unknown pmu event\n");
>   	}
>   
>   	return val;
> @@ -256,6 +278,12 @@ static const struct attribute_group xe_pmu_cpumask_attr_group = {
>   	.attrs = xe_cpumask_attrs,
>   };
>   
> +#define __event(__counter, __name) \
> +{ \
> +	.counter = (__counter), \
> +	.name = (__name), \
> +}
> +
>   #define __engine_event(__sample, __name) \
>   { \
>   	.sample = (__sample), \
> @@ -293,6 +321,23 @@ create_event_attributes(struct xe_pmu *pmu)
>   		__engine_event(DRM_XE_PMU_SAMPLE_BUSY_TICKS, "busy-ticks"),
>   	};
>   
> +	static const struct {
> +		unsigned int counter;
> +		const char *name;
> +	} events[] = {
> +		__event(0, "total-active-ticks"),
> +	};
> +
> +	/* Count how many counters we will be exposing. */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
> +
> +			if (!config_status(xe, config))
> +				count++;
> +		}
> +	}
> +
>   	for_each_gt(gt, xe, j) {
>   		for_each_hw_engine(hwe, gt, id) {
>   			for (i = 0; i < ARRAY_SIZE(engine_events); i++) {
> @@ -315,6 +360,25 @@ create_event_attributes(struct xe_pmu *pmu)
>   	xe_iter = xe_attr;
>   	attr_iter = attr;
>   
> +	/* Initialize supported non-engine counters */
> +	for_each_gt(gt, xe, j) {
> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
> +			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
> +			char *str;
> +
> +			if (config_status(xe, config))
> +				continue;
> +
> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
> +					events[i].name, j);
> +			if (!str)
> +				goto err;
> +
> +			*attr_iter++ = &xe_iter->attr.attr;
> +			xe_iter = add_xe_attr(xe_iter, str, config);
> +		}
> +	}
> +
>   	/* Initialize supported engine counters */
>   	for_each_gt(gt, xe, j) {
>   		for_each_hw_engine(hwe, gt, id) {
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index f8456cda5cda..3134930b0160 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -1341,12 +1341,29 @@ struct drm_xe_wait_user_fence {
>   };
>   
>   /**
> - * DOC: XE PMU event config IDs
> + * DOC: XE PMU Event Config ID's
>    *
> - * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
> + * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed here
>    * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
>    * particular event.
>    *
> + * For example to open the DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
> + *
> + * .. code-block:: C
> + *
> + *     struct perf_event_attr attr;
> + *     long long count;
> + *     int cpu = 0;
> + *     int fd;
> + *
> + *     memset(&attr, 0, sizeof(struct perf_event_attr));
> + *     attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_03_00.0/type
> + *     attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
> + *     attr.use_clockid = 1;
> + *     attr.clockid = CLOCK_MONOTONIC;
> + *     attr.config = DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0);
> + *
> + *     fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>    */
>   
>   /**
> @@ -1381,6 +1398,8 @@ enum drm_xe_pmu_engine_sample {
>   	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
>   						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
>   
> +#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	__DRM_XE_PMU_OTHER(gt, 0)
> +
>   #if defined(__cplusplus)
>   }
>   #endif
--------------RmHfmYMiEnXfQ8ZBfzMzykdF
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/21/2023 11:45 PM, Riana Tauro
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231222074602.817518-6-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">GuC provides engine busyness ticks as a 64 bit counter which count
as clock ticks. These counters are maintained in a
shared memory buffer and internally updated on a continuous basis.

GuC also provides a periodically total active ticks that GT has been
active for (GuC loaded and running).
This counter is exposed to the user such that busyness can
be calculated as a percentage using

busyness % = (engine active ticks/total active ticks) * 100.

This patch provides a pmu counter for total active ticks.

This is listed by perf tool as

sudo ./perf list
	  xe_0000_03_00.0/total-active-ticks-gt0/            [Kernel PMU event]

and can be read using

sudo ./perf stat -e xe_0000_03_00.0/total-active-ticks-gt0/ -I 1000
        time 	    counts  unit 	events
    1.001332764    58942964    xe_0000_03_00.0/total-active-ticks-gt0/
    2.011421147	   21191869    xe_0000_03_00.0/total-active-ticks-gt0/
    3.013223865	   19269012    xe_0000_03_00.0/total-active-ticks-gt0/

v2: change commit message and comment for
    total active ticks (Umesh, Tvrtko)

Co-developed-by: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
Signed-off-by: Umesh Nerlige Ramappa <a class="moz-txt-link-rfc2396E" href="mailto:umesh.nerlige.ramappa@intel.com">&lt;umesh.nerlige.ramappa@intel.com&gt;</a>
Signed-off-by: Riana Tauro <a class="moz-txt-link-rfc2396E" href="mailto:riana.tauro@intel.com">&lt;riana.tauro@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_gt.c                  | 11 +++
 drivers/gpu/drm/xe/xe_gt.h                  |  2 +-
 drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 72 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_guc_engine_busyness.h |  1 +
 drivers/gpu/drm/xe/xe_pmu.c                 | 74 +++++++++++++++++++--
 include/uapi/drm/xe_drm.h                   | 23 ++++++-
 6 files changed, 162 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 58daadc00363..5825471a3422 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -789,3 +789,14 @@ u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe)
 {
 	return xe_guc_engine_busyness_ticks(&amp;gt-&gt;uc.guc, hwe);
 }
+
+/**
+ * xe_gt_total_active_ticks - Return total active ticks
+ * @gt: GT structure
+ *
+ * Returns total active ticks that the GT was active for.
+ */
+u64 xe_gt_total_active_ticks(struct xe_gt *gt)
+{
+	return xe_guc_engine_busyness_active_ticks(&amp;gt-&gt;uc.guc);
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index 4303ec48c404..9bac85cdf609 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -43,7 +43,7 @@ void xe_gt_reset_async(struct xe_gt *gt);
 void xe_gt_sanitize(struct xe_gt *gt);
 
 u64 xe_gt_engine_busy_ticks(struct xe_gt *gt, struct xe_hw_engine *hwe);
-
+u64 xe_gt_total_active_ticks(struct xe_gt *gt);
 /**
  * xe_gt_any_hw_engine_by_reset_domain - scan the list of engines and return the
  * first that matches the same reset domain as @class
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
index af7b6e768751..24e72555647a 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
@@ -20,53 +20,83 @@
  * timer internal to GuC. The update rate is guaranteed to be at least 2Hz (but with
  * a caveat that is not real time, best effort only).
  *
+ * In addition to the engine busyness ticks, there is also a total time count which
+ * is a free running GT timestamp counter.
+ *
+ * Note that counters should be used as ratios of each other for calculating a
+ * percentage.
+ *
  * engine busyness ticks (ticks_engine) : clock ticks for which engine was active
+ * total active ticks (ticks_gt)	: total clock ticks
+ *
+ * engine busyness % = (ticks_engine / ticks_gt) * 100
  */
 
 static void guc_engine_busyness_usage_map(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
-					  struct iosys_map *engine_map)
+					  struct iosys_map *engine_map,
+					  struct iosys_map *global_map)
 {
 	struct iosys_map *map;
 	size_t offset;
 	u32 instance;
 	u8 guc_class;
 
-	guc_class = xe_engine_class_to_guc_class(hwe-&gt;class);
-	instance = hwe-&gt;logical_instance;
+	if (hwe) {
+		guc_class = xe_engine_class_to_guc_class(hwe-&gt;class);
+		instance = hwe-&gt;logical_instance;
+	}
 
 	map = &amp;guc-&gt;busy.bo-&gt;vmap;
 
-	offset = offsetof(struct guc_engine_observation_data,
-			  engine_data[guc_class][instance]);
+	if (hwe) {
+		offset = offsetof(struct guc_engine_observation_data,
+				  engine_data[guc_class][instance]);
+		*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+	}
 
-	*engine_map = IOSYS_MAP_INIT_OFFSET(map, offset);
+	*global_map = IOSYS_MAP_INIT_OFFSET(map, 0);
 }
 
 static void guc_engine_busyness_get_usage(struct xe_guc *guc,
 					  struct xe_hw_engine *hwe,
-					  u64 *ticks_engine)
+					  u64 *ticks_engine,
+					  u64 *ticks_gt)
 {
-	struct iosys_map engine_map;
-	u64 engine_ticks = 0;
+	struct iosys_map engine_map, global_map;
+	u64 engine_ticks = 0, gt_ticks = 0;
 	int i = 0;
 
-	guc_engine_busyness_usage_map(guc, hwe, &amp;engine_map);
+	guc_engine_busyness_usage_map(guc, hwe, &amp;engine_map, &amp;global_map);
 
 #define read_engine_usage(map_, field_) \
 	iosys_map_rd_field(map_, 0, struct guc_engine_data, field_)
 
+#define read_global_field(map_, field_) \
+	iosys_map_rd_field(map_, 0, struct guc_engine_observation_data, field_)
+
 	do {
-		engine_ticks = read_engine_usage(&amp;engine_map, total_execution_ticks);
+		if (hwe)
+			engine_ticks = read_engine_usage(&amp;engine_map, total_execution_ticks);
+
+		gt_ticks = read_global_field(&amp;global_map, gt_timestamp);
 
-		if (read_engine_usage(&amp;engine_map, total_execution_ticks) == engine_ticks)
+		if (hwe &amp;&amp; read_engine_usage(&amp;engine_map, total_execution_ticks) != engine_ticks)
+			continue;
+
+		if (read_global_field(&amp;global_map, gt_timestamp) == gt_ticks)
 			break;
+
 	} while (++i &lt; 6);
 
 #undef read_engine_usage
+#undef read_global_field
 
 	if (ticks_engine)
 		*ticks_engine = engine_ticks;
+
+	if (ticks_gt)
+		*ticks_gt = gt_ticks;
 }
 
 static void guc_engine_busyness_enable_stats(struct xe_guc *guc)
@@ -92,6 +122,22 @@ static void guc_engine_busyness_fini(struct drm_device *drm, void *arg)
 	xe_bo_unpin_map_no_vm(guc-&gt;busy.bo);
 }
 
+/*
+ * xe_guc_engine_busyness_active_ticks - Gets the total active ticks
+ * @guc: The GuC object
+ *
+ * Returns total active ticks that the GT has been running for
+ * (GuC loaded and running).
+ */
+u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc)</pre>
    </blockquote>
    <p>nit: Could we have the word gt somewhere in this function so its
      clear what we are asking for? like <span style="white-space: pre-wrap">xe_guc_engine_busyness_active_gt_ticks? </span></p>
    <p><span style="white-space: pre-wrap">Other than that,</span></p>
    <p><span style="white-space: pre-wrap">Reviewed-by: Vinay Belgaumkar <a class="moz-txt-link-rfc2396E" href="mailto:vinay.belgaumkar@intel.com">&lt;vinay.belgaumkar@intel.com&gt;</a>
</span></p>
    <blockquote type="cite" cite="mid:20231222074602.817518-6-riana.tauro@intel.com">
      <pre class="moz-quote-pre" wrap="">
+{
+	u64 ticks_gt;
+
+	guc_engine_busyness_get_usage(guc, NULL, NULL, &amp;ticks_gt);
+
+	return ticks_gt;
+}
+
 /*
  * xe_guc_engine_busyness_ticks - Gets current accumulated
  *				  engine busyness ticks
@@ -104,7 +150,7 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe)
 {
 	u64 ticks_engine;
 
-	guc_engine_busyness_get_usage(guc, hwe, &amp;ticks_engine);
+	guc_engine_busyness_get_usage(guc, hwe, &amp;ticks_engine, NULL);
 
 	return ticks_engine;
 }
diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
index d70f06209896..57325910ebc4 100644
--- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
+++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.h
@@ -12,6 +12,7 @@ struct xe_hw_engine;
 struct xe_guc;
 
 int xe_guc_engine_busyness_init(struct xe_guc *guc);
+u64 xe_guc_engine_busyness_active_ticks(struct xe_guc *guc);
 u64 xe_guc_engine_busyness_ticks(struct xe_guc *guc, struct xe_hw_engine *hwe);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
index 371ca6d7e215..c2be157a6f5d 100644
--- a/drivers/gpu/drm/xe/xe_pmu.c
+++ b/drivers/gpu/drm/xe/xe_pmu.c
@@ -51,6 +51,20 @@ static bool is_engine_event(struct perf_event *event)
 	return config_counter(event-&gt;attr.config) &lt; __DRM_XE_PMU_OTHER(0, 0);
 }
 
+static int
+config_status(struct xe_device *xe, u64 config)
+{
+	unsigned int gt_id = config_gt_id(config);
+
+	if (gt_id &gt;= XE_PMU_MAX_GT)
+		return -ENOENT;
+
+	if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
+		return 0;
+
+	return -ENOENT;
+}
+
 static int engine_event_status(struct xe_hw_engine *hwe,
 			       enum drm_xe_pmu_engine_sample sample)
 {
@@ -113,11 +127,13 @@ static int xe_pmu_event_init(struct perf_event *event)
 	if (!cpumask_test_cpu(event-&gt;cpu, &amp;xe_pmu_cpumask))
 		return -EINVAL;
 
-	if (is_engine_event(event)) {
+	if (is_engine_event(event))
 		ret = engine_event_init(event);
-		if (ret)
-			return ret;
-	}
+	else
+		ret = config_status(xe, event-&gt;attr.config);
+
+	if (ret)
+		return ret;
 
 	if (!event-&gt;parent) {
 		drm_dev_get(&amp;xe-&gt;drm);
@@ -131,7 +147,8 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 {
 	struct xe_device *xe =
 		container_of(event-&gt;pmu, typeof(*xe), pmu.base);
-	const unsigned int gt_id = config_gt_id(event-&gt;attr.config);
+	u64 config = event-&gt;attr.config;
+	const unsigned int gt_id = config_gt_id(config);
 	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
 	u64 val;
 
@@ -147,6 +164,11 @@ static u64 __xe_pmu_event_read(struct perf_event *event)
 			val = xe_gt_engine_busy_ticks(gt, hwe);
 		else
 			drm_warn(&amp;xe-&gt;drm, &quot;unknown pmu engine event\n&quot;);
+	} else {
+		if (config_counter(config) == DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0))
+			val = xe_gt_total_active_ticks(gt);
+		else
+			drm_warn(&amp;xe-&gt;drm, &quot;unknown pmu event\n&quot;);
 	}
 
 	return val;
@@ -256,6 +278,12 @@ static const struct attribute_group xe_pmu_cpumask_attr_group = {
 	.attrs = xe_cpumask_attrs,
 };
 
+#define __event(__counter, __name) \
+{ \
+	.counter = (__counter), \
+	.name = (__name), \
+}
+
 #define __engine_event(__sample, __name) \
 { \
 	.sample = (__sample), \
@@ -293,6 +321,23 @@ create_event_attributes(struct xe_pmu *pmu)
 		__engine_event(DRM_XE_PMU_SAMPLE_BUSY_TICKS, &quot;busy-ticks&quot;),
 	};
 
+	static const struct {
+		unsigned int counter;
+		const char *name;
+	} events[] = {
+		__event(0, &quot;total-active-ticks&quot;),
+	};
+
+	/* Count how many counters we will be exposing. */
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i &lt; ARRAY_SIZE(events); i++) {
+			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
+
+			if (!config_status(xe, config))
+				count++;
+		}
+	}
+
 	for_each_gt(gt, xe, j) {
 		for_each_hw_engine(hwe, gt, id) {
 			for (i = 0; i &lt; ARRAY_SIZE(engine_events); i++) {
@@ -315,6 +360,25 @@ create_event_attributes(struct xe_pmu *pmu)
 	xe_iter = xe_attr;
 	attr_iter = attr;
 
+	/* Initialize supported non-engine counters */
+	for_each_gt(gt, xe, j) {
+		for (i = 0; i &lt; ARRAY_SIZE(events); i++) {
+			u64 config = __DRM_XE_PMU_OTHER(j, events[i].counter);
+			char *str;
+
+			if (config_status(xe, config))
+				continue;
+
+			str = kasprintf(GFP_KERNEL, &quot;%s-gt%u&quot;,
+					events[i].name, j);
+			if (!str)
+				goto err;
+
+			*attr_iter++ = &amp;xe_iter-&gt;attr.attr;
+			xe_iter = add_xe_attr(xe_iter, str, config);
+		}
+	}
+
 	/* Initialize supported engine counters */
 	for_each_gt(gt, xe, j) {
 		for_each_hw_engine(hwe, gt, id) {
diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
index f8456cda5cda..3134930b0160 100644
--- a/include/uapi/drm/xe_drm.h
+++ b/include/uapi/drm/xe_drm.h
@@ -1341,12 +1341,29 @@ struct drm_xe_wait_user_fence {
 };
 
 /**
- * DOC: XE PMU event config IDs
+ * DOC: XE PMU Event Config ID's
  *
- * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed in xe_drm.h
+ * Check 'man perf_event_open' to use the ID's DRM_XE_PMU_XXXX listed here
  * in 'struct perf_event_attr' as part of perf_event_open syscall to read a
  * particular event.
  *
+ * For example to open the DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0):
+ *
+ * .. code-block:: C
+ *
+ *     struct perf_event_attr attr;
+ *     long long count;
+ *     int cpu = 0;
+ *     int fd;
+ *
+ *     memset(&amp;attr, 0, sizeof(struct perf_event_attr));
+ *     attr.type = type; // eg: /sys/bus/event_source/devices/xe_0000_03_00.0/type
+ *     attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
+ *     attr.use_clockid = 1;
+ *     attr.clockid = CLOCK_MONOTONIC;
+ *     attr.config = DRM_XE_PMU_TOTAL_ACTIVE_TICKS(0);
+ *
+ *     fd = syscall(__NR_perf_event_open, &amp;attr, -1, cpu, -1, 0);
  */
 
 /**
@@ -1381,6 +1398,8 @@ enum drm_xe_pmu_engine_sample {
 	__DRM_XE_PMU_GT_EVENT(gt, __DRM_XE_PMU_ENGINE(class, instance, \
 						      DRM_XE_PMU_SAMPLE_BUSY_TICKS))
 
+#define DRM_XE_PMU_TOTAL_ACTIVE_TICKS(gt)	__DRM_XE_PMU_OTHER(gt, 0)
+
 #if defined(__cplusplus)
 }
 #endif
</pre>
    </blockquote>
  </body>
</html>

--------------RmHfmYMiEnXfQ8ZBfzMzykdF--
