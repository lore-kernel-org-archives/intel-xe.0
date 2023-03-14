Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0935C74A44
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 04:48:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B9510E6DA;
	Tue, 14 Mar 2023 04:48:40 +0000 (UTC)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B74710E6DA
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 04:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678769318; x=1710305318;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=sF1rqDj4BtDvVo2aU8zDPQtUXPj2gBldvxq24A1b1d0=;
 b=dVgTEDroScDPkWzQextQT7S+aPnzczeqvO3jhOPC3jmwHIdYdZqcsC6I
 BUbAssBYhts0BmWrSofRQkyiTe26TbNmXRFpvBCTLjzVpoh7CBRy3hBAt
 6Ranchgqq1KT2pvDSPvPFCIT0KuDtIJyzBLLogqiJnC0Y9+KCGrd/F26X
 1IX9cDD/AH5OTFmv0vpT0Yug8KP/Ch+9Ntv2/4I2MVyoDRCbcfXzq9th5
 LIi98Gb1XH9xWqz/yePbyV1osFryDRShOFXb+GeuSJcdCRHkNAZWY6UDz
 RKJjoTArrVhh++1wzMN0+Sf0U3Sw8foCyapJASuPRbL/qVGpBp/5m58Cz g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="317715695"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="317715695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Mar 2023 21:48:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="743160849"
X-IronPort-AV: E=Sophos;i="5.98,258,1673942400"; d="scan'208";a="743160849"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2023 21:48:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 13 Mar 2023 21:48:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 13 Mar 2023 21:48:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 13 Mar 2023 21:48:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lozbq8aHVU3G0spxJQGyqhTgZFuS0wgjpnyzcBlqXD8jd7cHZVHfYdMnd63Y1Kjkf1s/71lIcn6wDBvnD3cPlFBOzmSLwWKr3Wd0WnR0ioYtP1EsHY+AgiHKeBl03T/h/yHhOPOqe7dftYym4i26agecdqHJOJ2Mmj1sx2upUcCUA1ttx5DS64cz+F8T1a3/IBOCSvPE286/vFMXDeKqk8YHG881BUHma3fdXy8T8SjJRtJ6SOi1wPcne3sfu6kyv7f1mEKIHClE1yJwHhMqg+4/MN+UQgrcm9tmGVzYm3WbaTafJtZJk3xiT5amPjmSp9tmcnSbWqK/tQULZ+nvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2O5oTKGwRZdxETs0M0iGz37c4vlhmO/2RMsV4GRAU94=;
 b=GmzyIdkGgEFTa95mjO2rOgvNRr2ltejrcDlqiTtYIgH5kKLVfFeTWI0t5+dDvDaupm1FmROoFMC7JyWOuIcciGnYJt6migPubkQ3Ybg6coQ72kk0UWd0nrf0HNh6/Y1ZbLDeLiWHjgurtHybRa9fsL1+Yi302HJo6Yqj0iFpyn8nC+sZWmL0EvoBLaQotKAInU6aFUn4T0CiPC3UoZFqMY+8w9DhaitJJqH3yLHGOJVBLzfihr6sDcQt4g3aoeGgSbF77qelrZKtzC9hBQoiJCOtyBuVBreySHRhr+Dpkw3ENgq77bfSV76MH2qztCmv+stnLygfj0BbMx8GaGl1Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by MW3PR11MB4586.namprd11.prod.outlook.com (2603:10b6:303:5e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 04:48:28 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::722f:d9ac:d42b:54b4]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::722f:d9ac:d42b:54b4%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 04:48:28 +0000
Message-ID: <5f56e536-191c-7076-9257-dcb366518dff@intel.com>
Date: Tue, 14 Mar 2023 10:18:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
To: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <20230309131856.1480173-1-riana.tauro@intel.com>
 <87edpxna0l.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <87edpxna0l.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0234.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:eb::6) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|MW3PR11MB4586:EE_
X-MS-Office365-Filtering-Correlation-Id: 15c789aa-61cb-4509-a813-08db24475a24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fLnqCEtNby7yh+P1SSqhZHPloJe/P/uCU2IqbwdnskQQPzyZ+uWKJ8P4Cck3/99B0H8B4mjN7ipQfQxU7/th+Vi6KZXkljD+A1PTDiqBxnulW3uc2GqyTJ2UVMvZD1UmvXuIq6EgrbYzfalStwfHP2vwLovl2d5kTOH8IYTr3JdZ2sQ4jDTsamUTEuMNkQUZ/MjFmhXApZCvi5blwSRoOCJXriGKXqHJQU3tgBJJ8LdKAyaTzfnEKPA3ZmP3CIu3q1j+QZ/iOWkA/06x28jk37NeJ5Ts+FpjfiB/7U53EveLAbBvJ7+poi5K50cskjkryHRf9y7NXf31Rm8new5qZCQdyVugXBOtDGvU+LXAugFuu7k0SRMxWzExP4n1YcpkENG4WPgIQ/Be55q1/MFEUPLjj98KnQoEzBZwjZCinvGvTsWQhYGC+1PZ/S6jQo4DwLpKCuEL3JoE8ow6qJMWrCFbsPvtIUyKyt39n6nmduaP93VTerSn5bDhSGnjzCtxGHE7XDM5WAVv1YQ70ga2PGjleJlFNWLH1jNLqqhjMeI/tZjMMW/L0afRLMQzsAuCh9amSjb6eFl/ZsO7Pf3PGLiKs0gmFPn+v2jQReGLDa3aj/DrhQKpEwOPnvAzTrCaWJ0rXK2v2GF+AzoszepAuxANEvpKPQI/b6ESuSE7wBobngyVeu306cLoAvPedAaQ13RpoXrJfweiKqfOV4uKowxsCTojoqaPQZ4+YnsX6e8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199018)(31686004)(82960400001)(4326008)(6636002)(54906003)(41300700001)(478600001)(8936002)(66556008)(8676002)(66476007)(66946007)(86362001)(36756003)(31696002)(38100700002)(6506007)(6512007)(186003)(53546011)(6666004)(107886003)(26005)(6486002)(44832011)(2906002)(5660300002)(316002)(83380400001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NlJieFd6RzZkWDViclN4Q1lnR1VSRUhTMDZ4MzJPOTlhY09GZzY0SWhDRFFr?=
 =?utf-8?B?b0JKVE1SV2NuZzlHMEI5UHNkWU5MRmdSdXhDaFk1ckVmMFliR1dlVWlPclVI?=
 =?utf-8?B?T2VRbWJOeVBLZXcrUEM5U0lXYUd1ZjlrbXpqZzA1aVZJbzhjd3ZQSWF5Ynla?=
 =?utf-8?B?VVhYeWRwcEhaUXRZWkozTnJQUHFobGdrZGFUZFB1RVJLUjRCQllQaDg0dDdL?=
 =?utf-8?B?cmVucWY2ejdiTkczSUdkYzVXU1pXRzBiVmZJZTcvKzkxazRxTFBGbUlQcFpG?=
 =?utf-8?B?cENxUVBEUmlNbkVIMDFmZ1paUGNSV2xvakl2d2NRNnUxRFJhVmJPc2VsTHZq?=
 =?utf-8?B?bDZNM1luNC9rWHdPZmMwYmNaSXBrNFNvaHduQ1JjM3lJZHhsTVpyYlVLQW9r?=
 =?utf-8?B?Z295b0JjQ3lNUG5SRitWa05nYXRaR0t6SVFzdnFCRlMySDN2UGpROFhDcSta?=
 =?utf-8?B?d0l0UHROc0kyZ1RwVXc5WnhOYXduaDFJRWhVRXJMUUREUW1YcHAxOVdvOFlR?=
 =?utf-8?B?dEh0SnFva01jN0lYS0FDY2Q4T2JJSE5TMW9zNFVSanVrVmpPaWtBUXJsNWNq?=
 =?utf-8?B?VzFUSmROOXRyUGFMSEFFVGJuYm1QekdRZDZJK2E2YmxqeU5oSXNUaUNsekgy?=
 =?utf-8?B?bytPbEFjKzhaQWtkSVBpamFHTmlEbzNDOXkzaXlWcUlLV28yK2R2MW1VSGly?=
 =?utf-8?B?N1BFOU9aMXdzSlg2RDQzcFIvQUo1bStvWUpVTCthc3BraHhVWWNUWUdKcEFC?=
 =?utf-8?B?SnRPMmQvNU93WDJFbU1RSzZVUXVxWG1QNCtSMG05L25BdHRxQ0xrbi8vL1pq?=
 =?utf-8?B?MHhGQlIvUDRwVkNxNUs2c2hNYTZ0aGQxNzNScTJNNEtqUXhQRDc4Zjh3OVFL?=
 =?utf-8?B?S3ZObWFPZFdyKzdnOXkvMEp5WndzNTBRdXNYWGJiOGN4L3NJL3pYK3FtSXhU?=
 =?utf-8?B?WFNIWm1sRXI1QVdOZmRQWHprc094SjJ3OVJUZzk5VG5oRWN0ZjgvbWd1dFNn?=
 =?utf-8?B?aUgvTDVQd0xialBDenZJRjFQTkJTMjRWUHNyS2NlQk1HTGsxSmdXR2o0WVB1?=
 =?utf-8?B?Uzh4bE02RFY5eEM3Q2dzOTZpbWZrZUhqUHZXcUxmRmVsZFZLYm1SR3NTdnQx?=
 =?utf-8?B?M2xkNG9xN2pRV3IvUHU3NlZMQS9uQW5iMElsckhKM3NBaVJmeHJYOWZDRjM3?=
 =?utf-8?B?Mk5La3IvYkloN0E0c2c0ZUZMNVlpcFY4V2VhbEFwb0NoQWZCdDZZVDl1Q1pl?=
 =?utf-8?B?ZnZzYisyTSt6ZkNEdG5HMU9XUUcyWkF5dm5pb0NFOWxHM28rRG0yV1FzcEJK?=
 =?utf-8?B?QVVWMCtwSmpaMFU1cW9PaVA5djdGekFQY2hucjBsMzZnc1IvQ2Z3QjVnbDVW?=
 =?utf-8?B?SnI4KzJtZ2QrZ2dMaXNDV09TV3Y2aC9HdlRLeEwwWVR1YXMvWXdLaTFXdFlp?=
 =?utf-8?B?bnUyQVIrbGlaRURnT0hyWWxIbkpoSWJmQ2JoNEJCYUN1WmhTYWFvcnZKZEUr?=
 =?utf-8?B?ZDJSOTUrMnYwcXBNaHdoZnNqWFE0NTNLME5BMXMvKzRhZ3VQczNFdStzdWJP?=
 =?utf-8?B?SElSUzdjT1hLcTh6eGplMmdHY1lFZUpwdHdvZXMzeXQ4b04rd0YrVC9JTGlN?=
 =?utf-8?B?R1lFYXZya1lHYklTL0g2OWxKeXUvOWVPWE0wOGxMRFd6a3VTK2RmQlRDaU96?=
 =?utf-8?B?ZFpVYVU3M1E4NGRjUlFYT3hUNEhVQ2FxQjZkRU9xczBKaGsxNVVpYmhSZkQv?=
 =?utf-8?B?WGtSMlZWQWwyWFpvNFpHQ3cxSzQwZUtMTXk4WW9RWEZhK2ZWYlFDT0gxc3VK?=
 =?utf-8?B?MGR6ZG1KTGZTbHJISHBNbHdxNDNuNE5Xb1MrcVNIWEQvTmp0dUdOZm5FdjVF?=
 =?utf-8?B?US9WL3Jaa2VWVDFoNytUU1BiRjRCcWtpQ3YwYk1TTUtyV2xoeVB1YjloZ3la?=
 =?utf-8?B?UEg0Z1BkMVRWVkh4SmJTZDlpQTd5Y3h1WUFZRHh4WHAyMHNHSjcwNU1BUXlh?=
 =?utf-8?B?NTc1UFdpUGFrTkVPRUlhcWVhWGRoSzNRV0ZvU2lLVnNpTmx2cE1NeERQaXA5?=
 =?utf-8?B?RzdSenpxVzF2eWNDR3BwRHJ6U1lQWWtFVk9zdVE2eFY1eTMyNkszc3ZOb0xB?=
 =?utf-8?Q?S38IAbVljTZL8IWkaIuDKX3/Y?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15c789aa-61cb-4509-a813-08db24475a24
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 04:48:28.1235 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HoIyisaDsvY94a79CVWFDnmK0Om3CEW/+SLC9pZjrw9eV2YmqEsisQCZ/BOc6503kN7RdpittAO/Rccxqlz7IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4586
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Fix overflow in vram manager
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
Cc: anshuman.gupta@intel.com, rodrigo.vivi@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Cc:Matthew Auld <matthew.auld@intel.com>

On 3/9/2023 10:21 PM, Dixit, Ashutosh wrote:
> On Thu, 09 Mar 2023 05:18:56 -0800, Riana Tauro wrote:
>>
>> The overflow caused xe_bo_restore_kernel to return an error
>> Fix overflow in vram manager alloc function.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> index 643365b18bc7..159ca7105df1 100644
>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>> @@ -118,7 +118,7 @@ static int xe_ttm_vram_mgr_new(struct ttm_resource_manager *man,
>>
>> 		cur_size = size;
>>
>> -		if (fpfn + size != place->lpfn << PAGE_SHIFT) {
>> +		if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
> 
> Looks ok but not sure if it should just be lpfn computed above? Copying Matt.
> 
>> 			/*
>> 			 * Except for actual range allocation, modify the size and
>> 			 * min_block_size conforming to continuous flag enablement
>> --
>> 2.39.1
>>
