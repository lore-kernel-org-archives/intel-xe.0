Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99731EB64D9
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jul 2023 13:06:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C3A310E07B;
	Thu,  6 Jul 2023 13:06:25 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAA210E07B
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jul 2023 13:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688648782; x=1720184782;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=URW+R8u63vdLzK9WvJNSMduClMHVMhfSte29QZtKfPE=;
 b=fM34rttVO46HsCUB/fT1HmFM8XezPBCMIsrdk7RmW5najhwu221eQl1N
 oFF9PrUaQl9EIFQ5P4n54LJfkk4BG5ORiJh/IYhlXwXD2Y6YG9oI46TD2
 TvBr3AbOV6aI3cgeR+6H4r3jGnKCgQyixtqrpFDtbgdqaf8a7vebTKxRP
 rV7ybB3YBOlnxEae8Dlshm9saC4+uX6xnco+ay9n+L6mIapV5CtOP0sNG
 nae8VrThsI1dtmzBXwp/YFUxSMq0Zif6TJL5wCYVaYo6nHw0sl3lK18ts
 zeIGa+VB0s1D5UayOl47CEPFMP6aWuwa6GA6/PhI0QJ+Bt0rjARKPHAGR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="363631479"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="363631479"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2023 06:06:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="1050089900"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; d="scan'208";a="1050089900"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga005.fm.intel.com with ESMTP; 06 Jul 2023 06:06:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 06:06:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 6 Jul 2023 06:06:20 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 6 Jul 2023 06:06:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 6 Jul 2023 06:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0i091W3c+NZ5J5jbN8l2l/ccYeVRjYTAUpgxzem/82d4zoXV5sKTp9l8m3fLAUmbKg4NdvgA4+CWnnODzpNeZJGGX63iX/buiZkPyNhHnopIoQcz11xD69sKDcf8bRkMCsVPx2QEmPAW8rX+TSu8VBTFbxuT+hW/3vzIz/9IE3xCPDJQHsPC6F6wiUCjkZ4GPKD7SS0RbmqghozznnDHQmPYsFBxUM3VPZD0uxzdZ9B0YP1grqdbSFjJHXEVnlsfZlU+1aIgjKu3h5tzSgfRRj5rArO6nfAq6dbR0vX2pah5qX0ME3rgljEiRLJfFKma2VVJRDuX4kZy1zosp1L+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtnpX+PKwXykJGng5GlIYEIIU0VN9qg4CJ3WcYSqYhg=;
 b=J3hIP92kcdNQTF99kKGU1+0+PfRq2H4p8oLRz9Qghs5l8xC23TxgWXer2TWvLAUcH4gPeCI2t/ICqV9EnlMvfdUeDRzbdUNviHC5/vBhS4g92/XLYAMZLNFCYd7V6zC3wRNvxAPXQ168n0CuCSrnRf7Ea8vdiaLJqlxFH59QbJv9ll+C4nF8895CDbQiQe36b6pqdDP1HNATHltHRoHPYLG0Z2ulC2AIfZFXpoVzPbJ5ZeCG7eT0eC9R9q/Btbetzwe3AwNdroEwZped2uzezM73s0YZkFl6IbYN0YdT3iQXvGK3kiKrkGwQlllFGl3xvMMrCI/6SIDdUhHsKatw9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5474.namprd11.prod.outlook.com (2603:10b6:610:d5::8)
 by LV3PR11MB8482.namprd11.prod.outlook.com (2603:10b6:408:1bb::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 13:06:15 +0000
Received: from CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff]) by CH0PR11MB5474.namprd11.prod.outlook.com
 ([fe80::6082:8da2:e39:aeff%4]) with mapi id 15.20.6565.016; Thu, 6 Jul 2023
 13:06:15 +0000
Message-ID: <bbabdb2e-ed05-22ba-bc31-dd8f9b218e18@intel.com>
Date: Thu, 6 Jul 2023 18:36:07 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
Content-Language: en-US
To: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230627122113.1472532-1-aravind.iddamsetty@intel.com>
 <20230627122113.1472532-3-aravind.iddamsetty@intel.com>
 <a1ec84ad-cd6f-e88e-fa25-2bdee7a2e7d9@intel.com>
From: "Iddamsetty, Aravind" <aravind.iddamsetty@intel.com>
In-Reply-To: <a1ec84ad-cd6f-e88e-fa25-2bdee7a2e7d9@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0104.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::6) To CH0PR11MB5474.namprd11.prod.outlook.com
 (2603:10b6:610:d5::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5474:EE_|LV3PR11MB8482:EE_
X-MS-Office365-Filtering-Correlation-Id: ba583b28-03ff-412d-722e-08db7e21c788
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FwkbZpNFNEvY7WgzjNMvTuo67XZbSGyt3p+ZE/+ssLTR8v2IXV1s5cABuNn4LqmvD4e6Bw4n2cu2y1P+I+MnXVbDI800iRtHLzbGxeYFDz1MjBTmx8Re4WjBy4i1y4iDhlILTEDLua94IPEZmEVmvQN+pTH2d653R4Hcl4JURPcrW7rE8c3+1LqKEuJoekYCMidfQ/FHZ9VZR3Mcv1d5Y96uv07LVmif+faYgslmohA86HQNLmEi7PDz/0Ijrc8qK7isB8lfzu4/69dIodP62hb3hVEbm6U7uMzzWDlU7qmdkm24vYQFOS4J0jrMk364YQXCbeuoRsaKljJELnaAhUEJeD+rZMn+Ys3uljVwEx/iZ9wtpZGz3e4bGslHZM/DCMn+bpRl3M/PcjsxbhorasYvXXkGvVYmKent8yjdUwGxBat2lsmiW5+QUm1mXa3zwqT5ojZEliKGpivZ+mAtY/4WKmZK5MhZiMCR/rJw9zKbCVLxsle3xqhfxt9zNBOiTOUtyuQ83aLtaxVP5GqJ3qK/Vwcyl7HNKUAJ09a7xbCyolbH9zWvGR88Bfav/ma9QCxpAbz4Yyz12BL2tC6aqXgccjy2hUVbLc3p281b3mWWhfAVziO/YPUIJzE5NmMnTuuHr6WI4Nz/SNwF0BOkww==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5474.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(346002)(136003)(376002)(451199021)(41300700001)(30864003)(478600001)(6666004)(38100700002)(6512007)(31696002)(86362001)(6486002)(82960400001)(83380400001)(36756003)(66476007)(316002)(66556008)(66946007)(2906002)(2616005)(6506007)(26005)(53546011)(5660300002)(186003)(8676002)(8936002)(31686004)(66899021)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUJPWjZJc2tFYm9tVXhGamU4WTZXanI3WEg2OXBZcU5QbVg0SEtlS1RMdlJY?=
 =?utf-8?B?N3N6RHNpdkF5c3hPdmk0MklnUkdFV0NjcWJQaktyeGhVamh2VHNKbWhwMndy?=
 =?utf-8?B?Qm1WTExnaGtoR1hoL0FIRVlON1V3SVhmelNrclRrMEtiL09NNEprMlRPSW9w?=
 =?utf-8?B?UTZVUVBmSkxqdFE3TFV1aWhCc3A0TkFaYVpuQVBNTDlXTGo0UEhvTm4rOVpK?=
 =?utf-8?B?MFhEVnNCN282Y3VQSmdpRlQwZFJUcFRLMmhqMTlBaXNNRXBaRURRTjIraVYw?=
 =?utf-8?B?NXlGcmlUTXFQZzVNSUpnMlNOcHBxQndyL3paRkI1MzVMcFM5SkZRTGZMc0Fr?=
 =?utf-8?B?bEN5eFpvT1ZhWXVCOXA4aUwva2ZRQjV3RElNMHNmRXhhQndaS3QvVVoxSGI5?=
 =?utf-8?B?KzhLNlM2SDJMZGdTWWc3VFJGS0l6NmNiR0FjdGpVNUpBVEw3TllJcC9WL0dr?=
 =?utf-8?B?dXVid2ZudC81eHo2TS9uNStmQVNwOGtzWVhmcjk2cTRNOWw1VXgvdjhuWUtQ?=
 =?utf-8?B?Z29FTDJyTjJ3T3dDRWE0SDRNZ2hmODNUNU5rNTA5bjZxc1BXaWYzcXFMaUVH?=
 =?utf-8?B?QktQNUJzZ05NSnV4Q2hHSXRTZkl6RW83alFNWmlHb2hndlJqd25KYVI3ZUEv?=
 =?utf-8?B?Tm80dzVEV2x0YWw2Q1pWV3hEeklhZkNaVjdSQm9aaENvWkVpM1p6S0FGNFFR?=
 =?utf-8?B?cXlvd0I4bmNob0prSHdraGZDYmhjRTE2Mmh1QVZUaGxQUXZyRWJ6dUFVVnJ3?=
 =?utf-8?B?Zjg4OWxicXAvZU8raEtaSjJMZFJ2eGVsSW9taEU3VVdFTHA3OU56NVF3QytY?=
 =?utf-8?B?UDl2K01VNWZETVBFZExoTmU5OWgwMnU1d2R6cCtuVm1EYXcvYTZqbFlYMjdR?=
 =?utf-8?B?QTA1QWJ5VHVYa3VKMHZ0L0lvaldsbGxaZnkxa3JLazdYZ0ZDSWhlanczZ2tM?=
 =?utf-8?B?QkZqZUR0VG52cnovVW1EcHcyV0xNVUYvMjdIaE9aQkYzYnVycm9oc0QyVmhR?=
 =?utf-8?B?QXIvYlZnWHFjT3Q4QmhhdHE0QXRlV2VHVFp2VHpSRHJodFZSSUEyRlJCUGZT?=
 =?utf-8?B?QnlCRmpKbVZqZVJIWUJRNzFkRTlvZnBpVy9rWllkSS9Da2M2dmFPRVFlTVZ6?=
 =?utf-8?B?SG1xUUE5N2o1bmVpM3BlOGd5ZkxLRVhXSDh2eDJwLy8rbitWMnRNQ2VGdG1I?=
 =?utf-8?B?dVU3QmRnU1ZZRTArSk9uQmU2NzB2YTZSdHN2WFdUL1VoNml2OEVYVkVNL1ZV?=
 =?utf-8?B?QnkxVGdkK1FBcE9OZGNteFArUXBvOFJEbVF3R3l0NDFnVHIvSVZ4bDJiZjda?=
 =?utf-8?B?cHMycUwvZmVNSmY4TDU5c2tkYnljTlI2WExSWXRCaC84OVkxOTVqdGQxejZl?=
 =?utf-8?B?anRDV2hSOURpUjVYSWMrZ3BCcGZYcjA2cnZXZ0FYalB5QTM0YnYyWlc2djAr?=
 =?utf-8?B?WGZPbzVVUkUyVVhGWVJ2L1VzdUphbHprejFXc3ZrUm9wcFpHcmI0MzhQQy8y?=
 =?utf-8?B?eW9pMTk5eitmRXhKeHBPV295VmhrL0RRSTJ0UlA4SnBGTmdsMkRqSi9pVzQy?=
 =?utf-8?B?MFFtSnZiNEZ0aURYM1dac0M1K3NvZzBIYkhrTHlxY0szUm1HSXJCWDBERnFB?=
 =?utf-8?B?MzlxZDlIRHZCeU9MNnhuS3MxL010Wm1QVC9NdDhVaTZ4Wis1N29MazNmN2VU?=
 =?utf-8?B?N3FXOENJcU9FNnVnb1lqSEV3SnJmSU5qQVllY1VIOG1lUG9lWURtOTFHYUcx?=
 =?utf-8?B?ZGRXZTAycWFPeTcySXpVbVp2aTk4dGZRVEtwN3YwTklmNjJXTjBRRzVPZ3l4?=
 =?utf-8?B?UXBKVG92SVgzdTdHV3hXa0MwTU5nbG95NjdocFNVeGdtOHhRMGRCbjc2YlZI?=
 =?utf-8?B?d1N0RTB5Tzh5bTVsb3pUdVBnb2lEQm9YMTJJc09LTG9xZE5kOGc0eVJiUEM3?=
 =?utf-8?B?YndabCsydkhtZTE0UGVMMFlVUmhPYTBoRFkrc3RYR1Y4YzhaMWcrY3BuT1px?=
 =?utf-8?B?NWlnaFRMamNiMlVvZnNwcVM3a2F4Smg1alA4aDdOZDR3VmVlUFgwS1c2Z0Q0?=
 =?utf-8?B?MmQ1R2lJdHByUEcyL0k0M0EvdHRFYkQ2Ulpsc1RNR2ZuQW5FU1J5dlJVSktu?=
 =?utf-8?B?MHhmZ0xKTklMYzIxWXFjSVM5NmpZbnE0dGEybjNhVGlSd2ZraXBmMU40bi9s?=
 =?utf-8?B?Q0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba583b28-03ff-412d-722e-08db7e21c788
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 13:06:15.3160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gxc7ssqNkhE63CAsXtlQBzI3/YYMBmSRzRGG23QeMfR2UAD/LEG27R2EDoq2w14pmxARYXoCZefUbBezwNXVlmjK0fQgNTsyH7NFlxK4mi8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8482
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/pmu: Enable PMU interface
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



On 06-07-2023 08:10, Belgaumkar, Vinay wrote:
> 
> On 6/27/2023 5:21 AM, aravind.iddamsetty at intel.com (Aravind
> Iddamsetty) wrote:
>> There are a set of engine group busyness counters provided by HW which
>> are
>> perfect fit to be exposed via PMU perf events.
>>
>> BSPEC: 46559, 46560, 46722, 46729
>>
>> events can be listed using:
>> perf list
>>    xe_0000_03_00.0/any-engine-group-busy-gt0/         [Kernel PMU event]
>>    xe_0000_03_00.0/copy-group-busy-gt0/               [Kernel PMU event]
>>    xe_0000_03_00.0/interrupts/                        [Kernel PMU event]
>>    xe_0000_03_00.0/media-group-busy-gt0/              [Kernel PMU event]
>>    xe_0000_03_00.0/render-group-busy-gt0/             [Kernel PMU event]
>>
>> and can be read using:
>>
>> perf stat -e "xe_0000_8c_00.0/render-group-busy-gt0/" -I 1000
>>             time             counts unit events
>>       1.001139062                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       2.003294678                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       3.005199582                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       4.007076497                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       5.008553068                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       6.010531563              43520 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       7.012468029              44800 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       8.013463515                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>       9.015300183                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>      10.017233010                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>      10.971934120                  0 ns 
>> xe_0000_8c_00.0/render-group-busy-gt0/
>>
>> The pmu base implementation is taken from i915.
>>
>> v2:
>> Store last known value when device is awake return that while the GT is
>> suspended and then update the driver copy when read during awake.
>>
>> Co-developed-by: Tvrtko Ursulin <tvrtko.ursulin at intel.com>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu at intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty at intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |   5 +
>>   drivers/gpu/drm/xe/xe_device.c       |   2 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_gt.c           |   2 +
>>   drivers/gpu/drm/xe/xe_irq.c          |  22 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 739 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  25 +
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  80 +++
>>   include/uapi/drm/xe_drm.h            |  16 +
>>   11 files changed, 902 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 081c57fd8632..e52ab795c566 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -217,6 +217,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>       i915-display/skl_universal_plane.o \
>>       i915-display/skl_watermark.o
>>   +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   ifeq ($(CONFIG_ACPI),y)
>>       xe-$(CONFIG_DRM_XE_DISPLAY) += \
>>           i915-display/intel_acpi.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 3f664011eaea..c7d9e4634745 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -285,6 +285,11 @@
>>   #define   INVALIDATION_BROADCAST_MODE_DIS    REG_BIT(12)
>>   #define   GLOBAL_INVALIDATION_MODE        REG_BIT(2)
>>   +#define XE_OAG_RC0_ANY_ENGINE_BUSY_FREE        XE_REG(0xdb80)
>> +#define XE_OAG_ANY_MEDIA_FF_BUSY_FREE        XE_REG(0xdba0)
>> +#define XE_OAG_BLT_BUSY_FREE            XE_REG(0xdbbc)
>> +#define XE_OAG_RENDER_BUSY_FREE            XE_REG(0xdbdc)
>> +
>>   #define SAMPLER_MODE                XE_REG_MCR(0xe18c,
>> XE_REG_OPTION_MASKED)
>>   #define   ENABLE_SMALLPL            REG_BIT(15)
>>   #define   SC_DISABLE_POWER_OPTIMIZATION_EBB    REG_BIT(9)
>> diff --git a/drivers/gpu/drm/xe/xe_device.c
>> b/drivers/gpu/drm/xe/xe_device.c
>> index c7985af85a53..b2c7bd4a97d9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -328,6 +328,8 @@ int xe_device_probe(struct xe_device *xe)
>>         xe_debugfs_register(xe);
>>   +    xe_pmu_register(&xe->pmu);
>> +
>>       err = drmm_add_action_or_reset(&xe->drm, xe_device_sanitize, xe);
>>       if (err)
>>           return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h
>> b/drivers/gpu/drm/xe/xe_device_types.h
>> index 0226d44a6af2..3ba99aae92b9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -15,6 +15,7 @@
>>   #include "xe_devcoredump_types.h"
>>   #include "xe_gt_types.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>   #include "xe_step_types.h"
>>     #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> @@ -332,6 +333,9 @@ struct xe_device {
>>       /** @d3cold_allowed: Indicates if d3cold is a valid device state */
>>       bool d3cold_allowed;
>>   +    /* @pmu: performance monitoring unit */
>> +    struct xe_pmu pmu;
>> +
>>       /* private: */
>>     #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> index 2458397ce8af..96e3720923d4 100644
>> --- a/drivers/gpu/drm/xe/xe_gt.c
>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>> @@ -593,6 +593,8 @@ int xe_gt_suspend(struct xe_gt *gt)
>>       if (err)
>>           goto err_msg;
>>   +    engine_group_busyness_store(gt);
>> +
>>       err = xe_uc_suspend(&gt->uc);
>>       if (err)
>>           goto err_force_wake;
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
>> index b4ed1e4a3388..cb943fb94ec7 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -27,6 +27,24 @@
>>   #define IIR(offset)                XE_REG(offset + 0x8)
>>   #define IER(offset)                XE_REG(offset + 0xc)
>>   +/*
>> + * Interrupt statistic for PMU. Increments the counter only if the
>> + * interrupt originated from the GPU so interrupts from a device which
>> + * shares the interrupt line are not accounted.
>> + */
>> +static inline void xe_pmu_irq_stats(struct xe_device *xe,
>> +                    irqreturn_t res)
>> +{
>> +    if (unlikely(res != IRQ_HANDLED))
>> +        return;
>> +
>> +    /*
>> +     * A clever compiler translates that into INC. A not so clever one
>> +     * should at least prevent store tearing.
>> +     */
>> +    WRITE_ONCE(xe->pmu.irq_count, xe->pmu.irq_count + 1);
>> +}
>> +
>>   static void assert_iir_is_zero(struct xe_gt *mmio, struct xe_reg reg)
>>   {
>>       u32 val = xe_mmio_read32(mmio, reg);
>> @@ -325,6 +343,8 @@ static irqreturn_t xelp_irq_handler(int irq, void
>> *arg)
>>         xe_display_irq_enable(xe, gu_misc_iir);
>>   +    xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>       return IRQ_HANDLED;
>>   }
>>   @@ -414,6 +434,8 @@ static irqreturn_t dg1_irq_handler(int irq, void
>> *arg)
>>       dg1_intr_enable(xe, false);
>>       xe_display_irq_enable(xe, gu_misc_iir);
>>   +    xe_pmu_irq_stats(xe, IRQ_HANDLED);
>> +
>>       return IRQ_HANDLED;
>>   }
>>   diff --git a/drivers/gpu/drm/xe/xe_module.c
>> b/drivers/gpu/drm/xe/xe_module.c
>> index 75e5be939f53..f6fe89748525 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -12,6 +12,7 @@
>>   #include "xe_hw_fence.h"
>>   #include "xe_module.h"
>>   #include "xe_pci.h"
>> +#include "xe_pmu.h"
>>   #include "xe_sched_job.h"
>>     bool enable_guc = true;
>> @@ -49,6 +50,10 @@ static const struct init_funcs init_funcs[] = {
>>           .init = xe_sched_job_module_init,
>>           .exit = xe_sched_job_module_exit,
>>       },
>> +    {
>> +        .init = xe_pmu_init,
>> +        .exit = xe_pmu_exit,
>> +    },
>>       {
>>           .init = xe_register_pci_driver,
>>           .exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..bef1895be9f7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,739 @@
>> +/*
>> + * SPDX-License-Identifier: MIT
>> + *
>> + * Copyright ? 2023 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +    return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +    return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static unsigned int
>> +__sample_idx(struct xe_pmu *pmu, unsigned int gt_id, int sample)
>> +{
>> +    unsigned int idx = gt_id * __XE_NUM_PMU_SAMPLERS + sample;
>> +
>> +    XE_BUG_ON(idx >= ARRAY_SIZE(pmu->sample));
>> +
>> +    return idx;
>> +}
>> +
>> +static u64 read_sample(struct xe_pmu *pmu, unsigned int gt_id, int
>> sample)
>> +{
>> +    return pmu->sample[__sample_idx(pmu, gt_id, sample)].cur;
>> +}
>> +
>> +static void
>> +store_sample(struct xe_pmu *pmu, unsigned int gt_id, int sample, u64
>> val)
>> +{
>> +    pmu->sample[__sample_idx(pmu, gt_id, sample)].cur = val;
>> +}
>> +
>> +static int engine_busyness_sample_type(u64 config)
>> +{
>> +    int type = 0;
>> +
>> +    switch (config) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +        type =  __XE_SAMPLE_RENDER_GROUP_BUSY;
>> +        break;
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +        type = __XE_SAMPLE_COPY_GROUP_BUSY;
>> +        break;
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        type = __XE_SAMPLE_MEDIA_GROUP_BUSY;
>> +        break;
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +        type = __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY;
>> +        break;
>> +    }
>> +
>> +    return type;
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +    drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +    drm_dev_put(&xe->drm);
>> +}
>> +
>> +static u64 __engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +    u64 val = 0;
>> +
>> +    switch (config) {
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +        val = xe_mmio_read32(gt, XE_OAG_RENDER_BUSY_FREE);
>> +        break;
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +        val = xe_mmio_read32(gt, XE_OAG_BLT_BUSY_FREE);
>> +        break;
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        val = xe_mmio_read32(gt, XE_OAG_ANY_MEDIA_FF_BUSY_FREE);
>> +        break;
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +        val = xe_mmio_read32(gt, XE_OAG_RC0_ANY_ENGINE_BUSY_FREE);
>> +        break;
>> +    default:
>> +        drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +    }
>> +
>> +    return xe_gt_clock_interval_to_ns(gt, val * 16);
>> +}
>> +
>> +static u64 engine_group_busyness_read(struct xe_gt *gt, u64 config)
>> +{
>> +    int sample_type = engine_busyness_sample_type(config);
>> +    struct xe_device *xe = gt->tile->xe;
>> +    const unsigned int gt_id = gt->info.id;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    bool device_awake;
>> +    unsigned long flags;
>> +    u64 val;
>> +
>> +    /*
>> +     * found no better way to check if device is awake or not. Before
>> +     * we suspend we set the submission_state.enabled to false.
>> +     */
>> +    device_awake = gt->uc.guc.submission_state.enabled ? true : false;
>> +    if (device_awake)
>> +        val = __engine_group_busyness_read(gt, config);
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    if (device_awake)
>> +        store_sample(pmu, gt_id, sample_type, val);
>> +    else
>> +        val = read_sample(pmu, gt_id, sample_type);
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +
>> +    return val;
>> +}
>> +
>> +void engine_group_busyness_store(struct xe_gt *gt)
>> +{
>> +    struct xe_pmu *pmu = &gt->tile->xe->pmu;
>> +    unsigned int gt_id = gt->info.id;
>> +    unsigned long flags;
>> +
>> +    spin_lock_irqsave(&pmu->lock, flags);
>> +
>> +    store_sample(pmu, gt_id, __XE_SAMPLE_RENDER_GROUP_BUSY,
>> +             __engine_group_busyness_read(gt,
>> XE_PMU_RENDER_GROUP_BUSY(0)));
>> +    store_sample(pmu, gt_id, __XE_SAMPLE_COPY_GROUP_BUSY,
>> +             __engine_group_busyness_read(gt,
>> XE_PMU_COPY_GROUP_BUSY(0)));
>> +    store_sample(pmu, gt_id, __XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +             __engine_group_busyness_read(gt,
>> XE_PMU_MEDIA_GROUP_BUSY(0)));
>> +    store_sample(pmu, gt_id, __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +             __engine_group_busyness_read(gt,
>> XE_PMU_ANY_ENGINE_GROUP_BUSY(0)));
>> +
>> +    spin_unlock_irqrestore(&pmu->lock, flags);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +    unsigned int max_gt_id = xe->info.gt_count > 1 ? 1 : 0;
>> +    unsigned int gt_id = config_gt_id(config);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +
>> +    if (gt_id > max_gt_id)
>> +        return -ENOENT;
>> +
>> +    switch (config_counter(config)) {
>> +    case XE_PMU_INTERRUPTS(0):
>> +        if (gt_id)
>> +            return -ENOENT;
>> +        break;
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +        if (GRAPHICS_VER(xe) < 12)
>> +            return -ENOENT;
>> +        break;
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        if (MEDIA_VER(xe) >= 13 && gt->info.type != XE_GT_TYPE_MEDIA)
>> +            return -ENOENT;
>> +        break;
>> +    default:
>> +        return -ENOENT;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    int ret;
>> +
>> +    if (pmu->closed)
>> +        return -ENODEV;
>> +
>> +    if (event->attr.type != event->pmu->type)
>> +        return -ENOENT;
>> +
>> +    /* unsupported modes and filters */
>> +    if (event->attr.sample_period) /* no sampling */
>> +        return -EINVAL;
>> +
>> +    if (has_branch_stack(event))
>> +        return -EOPNOTSUPP;
>> +
>> +    if (event->cpu < 0)
>> +        return -EINVAL;
>> +
>> +    /* only allow running on one cpu at a time */
>> +    if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +        return -EINVAL;
>> +
>> +    ret = config_status(xe, event->attr.config);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (!event->parent) {
>> +        drm_dev_get(&xe->drm);
>> +        event->destroy = xe_pmu_event_destroy;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    const unsigned int gt_id = config_gt_id(event->attr.config);
>> +    const u64 config = config_counter(event->attr.config);
>> +    struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 val = 0;
>> +
>> +    switch (config) {
>> +    case XE_PMU_INTERRUPTS(0):
>> +        val = READ_ONCE(pmu->irq_count);
>> +        break;
>> +    case XE_PMU_RENDER_GROUP_BUSY(0):
>> +    case XE_PMU_COPY_GROUP_BUSY(0):
>> +    case XE_PMU_ANY_ENGINE_GROUP_BUSY(0):
>> +    case XE_PMU_MEDIA_GROUP_BUSY(0):
>> +        val = engine_group_busyness_read(gt, config);
>> +    }
>> +
>> +    return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct hw_perf_event *hwc = &event->hw;
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +    u64 prev, new;
>> +
>> +    if (pmu->closed) {
>> +        event->hw.state = PERF_HES_STOPPED;
>> +        return;
>> +    }
>> +again:
>> +    prev = local64_read(&hwc->prev_count);
>> +    new = __xe_pmu_event_read(event);
>> +
>> +    if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +        goto again;
>> +
>> +    local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +    /*
>> +     * Store the current counter value so we can report the correct
>> delta
>> +     * for all listeners. Even when the event was already enabled and
>> has
>> +     * an existing non-zero value.
>> +     */
>> +    local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (pmu->closed)
>> +        return;
>> +
>> +    xe_pmu_enable(event);
>> +    event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +    if (flags & PERF_EF_UPDATE)
>> +        xe_pmu_event_read(event);
>> +
>> +    event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +    struct xe_device *xe =
>> +        container_of(event->pmu, typeof(*xe), pmu.base);
>> +    struct xe_pmu *pmu = &xe->pmu;
>> +
>> +    if (pmu->closed)
>> +        return -ENODEV;
>> +
>> +    if (flags & PERF_EF_START)
>> +        xe_pmu_event_start(event, flags);
>> +
>> +    return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +    xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +    return 0;
>> +}
>> +
>> +struct xe_str_attribute {
>> +    struct device_attribute attr;
>> +    const char *str;
>> +};
>> +
>> +static ssize_t xe_pmu_format_show(struct device *dev,
>> +                  struct device_attribute *attr, char *buf)
>> +{
>> +    struct xe_str_attribute *eattr;
>> +
>> +    eattr = container_of(attr, struct xe_str_attribute, attr);
>> +    return sprintf(buf, "%s\n", eattr->str);
>> +}
>> +
>> +#define XE_PMU_FORMAT_ATTR(_name, _config) \
>> +    (&((struct xe_str_attribute[]) { \
>> +        { .attr = __ATTR(_name, 0444, xe_pmu_format_show, NULL), \
>> +          .str = _config, } \
>> +    })[0].attr.attr)
>> +
>> +static struct attribute *xe_pmu_format_attrs[] = {
>> +    XE_PMU_FORMAT_ATTR(xe_eventid, "config:0-20"),
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_format_attr_group = {
>> +    .name = "format",
>> +    .attrs = xe_pmu_format_attrs,
>> +};
>> +
>> +struct xe_ext_attribute {
>> +    struct device_attribute attr;
>> +    unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +                 struct device_attribute *attr, char *buf)
>> +{
>> +    struct xe_ext_attribute *eattr;
>> +
>> +    eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +    return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +                struct device_attribute *attr, char *buf)
>> +{
>> +    return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +    &dev_attr_cpumask.attr,
>> +    NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +    .attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +    .counter = (__counter), \
>> +    .name = (__name), \
>> +    .unit = (__unit), \
>> +    .global = false, \
>> +}
>> +
>> +#define __global_event(__counter, __name, __unit) \
>> +{ \
>> +    .counter = (__counter), \
>> +    .name = (__name), \
>> +    .unit = (__unit), \
>> +    .global = true, \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = xe_pmu_event_show;
>> +    attr->val = config;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +         const char *str)
>> +{
>> +    sysfs_attr_init(&attr->attr.attr);
>> +    attr->attr.attr.name = name;
>> +    attr->attr.attr.mode = 0444;
>> +    attr->attr.show = perf_event_sysfs_show;
>> +    attr->event_str = str;
>> +
>> +    return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    static const struct {
>> +        unsigned int counter;
>> +        const char *name;
>> +        const char *unit;
>> +        bool global;
>> +    } events[] = {
>> +        __global_event(0, "interrupts", NULL),
>> +        __event(1, "render-group-busy", "ns"),
>> +        __event(2, "copy-group-busy", "ns"),
>> +        __event(3, "media-group-busy", "ns"),
>> +        __event(4, "any-engine-group-busy", "ns"),
>> +    };
>> +
>> +    unsigned int count = 0;
>> +    struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +    struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +    struct attribute **attr = NULL, **attr_iter;
>> +    struct xe_gt *gt;
>> +    unsigned int i, j;
>> +
>> +    /* Count how many counters we will be exposing. */
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +
>> +            if (!config_status(xe, config))
>> +                count++;
>> +        }
>> +    }
>> +
>> +    /* Allocate attribute objects and table. */
>> +    xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +    if (!xe_attr)
>> +        goto err_alloc;
>> +
>> +    pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +    if (!pmu_attr)
>> +        goto err_alloc;
>> +
>> +    /* Max one pointer of each attribute type plus a termination
>> entry. */
>> +    attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +    if (!attr)
>> +        goto err_alloc;
>> +
>> +    xe_iter = xe_attr;
>> +    pmu_iter = pmu_attr;
>> +    attr_iter = attr;
>> +
>> +    for_each_gt(gt, xe, j) {
>> +        for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +            u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +            char *str;
>> +
>> +            if (config_status(xe, config))
>> +                continue;
>> +
>> +            if (events[i].global)
>> +                str = kstrdup(events[i].name, GFP_KERNEL);
>> +            else
>> +                str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +                        events[i].name, j);
>> +            if (!str)
>> +                goto err;
>> +
>> +            *attr_iter++ = &xe_iter->attr.attr;
>> +            xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +            if (events[i].unit) {
>> +                if (events[i].global)
>> +                    str = kasprintf(GFP_KERNEL, "%s.unit",
>> +                            events[i].name);
>> +                else
>> +                    str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +                            events[i].name, j);
>> +                if (!str)
>> +                    goto err;
>> +
>> +                *attr_iter++ = &pmu_iter->attr.attr;
>> +                pmu_iter = add_pmu_attr(pmu_iter, str,
>> +                            events[i].unit);
>> +            }
>> +        }
>> +    }
>> +
>> +    pmu->xe_attr = xe_attr;
>> +    pmu->pmu_attr = pmu_attr;
>> +
>> +    return attr;
>> +
>> +err:
>> +    for (attr_iter = attr; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +    kfree(attr);
>> +    kfree(xe_attr);
>> +    kfree(pmu_attr);
>> +
>> +    return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +    struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +    for (; *attr_iter; attr_iter++)
>> +        kfree((*attr_iter)->name);
>> +
>> +    kfree(pmu->events_attr_group.attrs);
>> +    kfree(pmu->xe_attr);
>> +    kfree(pmu->pmu_attr);
>> +
>> +    pmu->events_attr_group.attrs = NULL;
>> +    pmu->xe_attr = NULL;
>> +    pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +
>> +    XE_BUG_ON(!pmu->base.event_init);
>> +
>> +    /* Select the first online CPU as a designated reader. */
>> +    if (cpumask_empty(&xe_pmu_cpumask))
>> +        cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +    return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +    struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu),
>> cpuhp.node);
>> +    unsigned int target = xe_pmu_target_cpu;
>> +
>> +    XE_BUG_ON(!pmu->base.event_init);
>> +
>> +    /*
>> +     * Unregistering an instance generates a CPU offline event which
>> we must
>> +     * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +     */
>> +    if (pmu->closed)
>> +        return 0;
>> +
>> +    if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +        target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +        /* Migrate events if there is a valid target */
>> +        if (target < nr_cpu_ids) {
>> +            cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +            xe_pmu_target_cpu = target;
>> +        }
>> +    }
>> +
>> +    if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +        perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +        pmu->cpuhp.cpu = target;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +int xe_pmu_init(void)
>> +{
>> +    int ret;
>> +
>> +    ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +                      "perf/x86/intel/xe:online",
>> +                      xe_pmu_cpu_online,
>> +                      xe_pmu_cpu_offline);
>> +    if (ret < 0)
>> +        pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +              ret);
>> +    else
>> +        cpuhp_slot = ret;
>> +
>> +    return 0;
>> +}
>> +
>> +void xe_pmu_exit(void)
>> +{
>> +    if (cpuhp_slot != CPUHP_INVALID)
>> +        cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    if (cpuhp_slot == CPUHP_INVALID)
>> +        return -EINVAL;
>> +
>> +    return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +    cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister(struct drm_device *device, void *arg)
>> +{
>> +    struct xe_pmu *pmu = arg;
>> +
>> +    if (!pmu->base.event_init)
>> +        return;
>> +
>> +    /*
>> +     * "Disconnect" the PMU callbacks - since all are atomic
>> synchronize_rcu
>> +     * ensures all currently executing ones will have exited before we
>> +     * proceed with unregistration.
>> +     */
>> +    pmu->closed = true;
>> +    synchronize_rcu();
>> +
>> +    xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +    perf_pmu_unregister(&pmu->base);
>> +    pmu->base.event_init = NULL;
>> +    kfree(pmu->base.attr_groups);
>> +    kfree(pmu->name);
>> +    free_event_attributes(pmu);
>> +}
>> +
>> +static void init_samples(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    struct xe_gt *gt;
>> +    unsigned int i;
>> +
>> +    for_each_gt(gt, xe, i)
>> +        engine_group_busyness_store(gt);
>> +}
>> +
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +    struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +    const struct attribute_group *attr_groups[] = {
>> +        &xe_pmu_format_attr_group,
>> +        &pmu->events_attr_group,
>> +        &xe_pmu_cpumask_attr_group,
>> +        NULL
>> +    };
>> +
>> +    int ret = -ENOMEM;
>> +
>> +    spin_lock_init(&pmu->lock);
>> +    pmu->cpuhp.cpu = -1;
>> +    init_samples(pmu);
>> +
>> +    pmu->name = kasprintf(GFP_KERNEL,
>> +                  "xe_%s",
>> +                  dev_name(xe->drm.dev));
>> +    if (pmu->name)
>> +        /* tools/perf reserves colons as special. */
>> +        strreplace((char *)pmu->name, ':', '_');
>> +
>> +    if (!pmu->name)
>> +        goto err;
>> +
>> +    pmu->events_attr_group.name = "events";
>> +    pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +    if (!pmu->events_attr_group.attrs)
>> +        goto err_name;
>> +
>> +    pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +                    GFP_KERNEL);
>> +    if (!pmu->base.attr_groups)
>> +        goto err_attr;
>> +
>> +    pmu->base.module    = THIS_MODULE;
>> +    pmu->base.task_ctx_nr    = perf_invalid_context;
>> +    pmu->base.event_init    = xe_pmu_event_init;
>> +    pmu->base.add        = xe_pmu_event_add;
>> +    pmu->base.del        = xe_pmu_event_del;
>> +    pmu->base.start        = xe_pmu_event_start;
>> +    pmu->base.stop        = xe_pmu_event_stop;
>> +    pmu->base.read        = xe_pmu_event_read;
>> +    pmu->base.event_idx    = xe_pmu_event_event_idx;
>> +
>> +    ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +    if (ret)
>> +        goto err_groups;
>> +
>> +    ret = xe_pmu_register_cpuhp_state(pmu);
>> +    if (ret)
>> +        goto err_unreg;
>> +
>> +    ret = drmm_add_action_or_reset(&xe->drm, xe_pmu_unregister, pmu);
>> +    XE_WARN_ON(ret);
>> +
>> +    return;
>> +
>> +err_unreg:
>> +    perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +    kfree(pmu->base.attr_groups);
>> +err_attr:
>> +    pmu->base.event_init = NULL;
>> +    free_event_attributes(pmu);
>> +err_name:
>> +    kfree(pmu->name);
>> +err:
>> +    drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d3f47f4ab343
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,25 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright ? 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_gt_types.h"
>> +#include "xe_pmu_types.h"
>> +
>> +#ifdef CONFIG_PERF_EVENTS
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void engine_group_busyness_store(struct xe_gt *gt);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void engine_group_busyness_store(struct xe_gt *gt) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h
>> b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..e87edd4d6a87
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,80 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright ? 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +    __XE_SAMPLE_RENDER_GROUP_BUSY,
>> +    __XE_SAMPLE_COPY_GROUP_BUSY,
>> +    __XE_SAMPLE_MEDIA_GROUP_BUSY,
>> +    __XE_SAMPLE_ANY_ENGINE_GROUP_BUSY,
>> +    __XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +struct xe_pmu_sample {
>> +    u64 cur;
>> +};
>> +
>> +#define XE_MAX_GT_PER_TILE 2
>> +
>> +struct xe_pmu {
>> +    /**
>> +     * @cpuhp: Struct used for CPU hotplug handling.
>> +     */
>> +    struct {
>> +        struct hlist_node node;
>> +        unsigned int cpu;
>> +    } cpuhp;
>> +    /**
>> +     * @base: PMU base.
>> +     */
>> +    struct pmu base;
> 
> Are we not adding this timer for xe (it exists in i915)?
> 
> /**
>          * @timer: Timer for internal i915 PMU sampling.
>          */
>         struct hrtimer timer;
In my current implementation i have limited to expose only OA engine
counters which doesn't need an internal sampling timer as we directly
read from OA HW registers.

Thanks,
Aravind.
> 
> Thanks,
> 
> Vinay.
> 
>> +    /**
>> +     * @closed: xe is unregistering.
>> +     */
>> +    bool closed;
>> +    /**
>> +     * @name: Name as registered with perf core.
>> +     */
>> +    const char *name;
>> +    /**
>> +     * @lock: Lock protecting enable mask and ref count handling.
>> +     */
>> +    spinlock_t lock;
>> +    /**
>> +     * @sample: Current and previous (raw) counters.
>> +     *
>> +     * These counters are updated when the device is awake.
>> +     *
>> +     */
>> +    struct xe_pmu_sample sample[XE_MAX_GT_PER_TILE *
>> __XE_NUM_PMU_SAMPLERS];
>> +    /**
>> +     * @irq_count: Number of interrupts
>> +     *
>> +     * Intentionally unsigned long to avoid atomics or heuristics on
>> 32bit.
>> +     * 4e9 interrupts are a lot and postprocessing can really deal
>> with an
>> +     * occasional wraparound easily. It's 32bit after all.
>> +     */
>> +    unsigned long irq_count;
>> +    /**
>> +     * @events_attr_group: Device events attribute group.
>> +     */
>> +    struct attribute_group events_attr_group;
>> +    /**
>> +     * @xe_attr: Memory block holding device attributes.
>> +     */
>> +    void *xe_attr;
>> +    /**
>> +     * @pmu_attr: Memory block holding device attributes.
>> +     */
>> +    void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 965cd9527ff1..ed097056f944 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -990,6 +990,22 @@ struct drm_xe_vm_madvise {
>>       __u64 reserved[2];
>>   };
>>   +/* PMU event config IDs */
>> +
>> +/*
>> + * Top 4 bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (60)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>> +#define XE_PMU_INTERRUPTS(gt)            ___XE_PMU_OTHER(gt, 0)
>> +#define XE_PMU_RENDER_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 1)
>> +#define XE_PMU_COPY_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 2)
>> +#define XE_PMU_MEDIA_GROUP_BUSY(gt)        ___XE_PMU_OTHER(gt, 3)
>> +#define XE_PMU_ANY_ENGINE_GROUP_BUSY(gt)    ___XE_PMU_OTHER(gt, 4)
>> +
>>   #if defined(__cplusplus)
>>   }
>>   #endif
