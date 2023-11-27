Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C942BC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 03:05:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95C7D10E163;
	Mon, 27 Nov 2023 03:05:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D266D10E163
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 03:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701054333; x=1732590333;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6IQdeUqXIY9Mv8xDJC/CsbgmtkZ+AdM8PsmRCTHq2hM=;
 b=I2FBoLMcMGYsgUkBQxNgtUAAYzdX4Md29SCTSyypn+MCSYSAxXQ+9Gvn
 Vi5AjYMDZNHHiESqGHEzQ/xJRSyAyu3KTXOmOFwmPYCLCCTHMRx+ERI++
 B9FlE2Ci+218X4ShopHzxdp+fs9g8n4haaptbb3ccA9Z14lR4Mi7MPdjA
 w6VMiEvAZeFgAZ82bpceHgBkyYOsP7u/euKkwGq7Xjt8OY43qpa0OLlT0
 zJYeGETTalLi1UCpIR3iDb+mXt2FmR0SsCeol8jfMl9FE6QDX5LOGhqa+
 6lAqwjmCOasJ1NNfj2R7LxEP+mabHMLwNXAImoFWAzdhIx8LQuu5J2Anf w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="396533042"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="396533042"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2023 19:05:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="1099626881"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; d="scan'208";a="1099626881"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Nov 2023 19:05:33 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 26 Nov 2023 19:05:32 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 26 Nov 2023 19:05:32 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 26 Nov 2023 19:05:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RsKfrM+pik68cjrT4Hd/JvpmyLcNniUBDrwt2QF2JawevOH6RmBEQBrcVdem6JwkfTo9okfUGmSSbcMPUFdD+K2WMQqzxiN9Crnm/i6FWPEkUr0OlkmxHrwVVkl/O34BMhYLT2+ErATf0MdIczoXXlvcsHJnDMWDD9JPr8KQpeDXu7DlGovx2FfnxWbWB7g2NUZYO5OftX28CFiKo5nBiNgEDnM6h/lH8FcPKsTHQczD9yxlxGYTmKWDPZFmhnTtqZ8aa+MiyTNIWPUQ6zorg7JfJkHprnty8s+zbggEX9FIluCTrbw5vJi7NnY7qCBWylgq3A7eO8dzUP4Clyk4WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yxkMHeXjZdJvUv8XQ3c58FbWpYJJTOaMymhIbKrp0c4=;
 b=mqLsL+BepZZYQZrpolgpvG0RoVr7XnOCT8FgTgbYPTmVehJrBXDVp97Q6WeL7L19bj+tlLNdiT9XEop1H5h76uP4nrgqFC16IWVkjYjqMozblCXWT5PoYHuRlw0Rq0w3rj1gTOy5p7MHWwGckUEHt50AbXGEObyBAKd60SSNg5lnPRDbREEn+u44mhdfm/m8ysLXFmn5UIZOuIEW3QPadDFdRtHwcUZuArkjSE+Hj9ui39F6LXnm1Xp7RRofWSpi+mw7Z1z/rsRcWNbwqHxksyzUirNLI/sARbF3In4JhbLJWNFjRSkfJvLYhDatmYJue7WsR+CtgxRGoa+3HmeQbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DS0PR11MB7804.namprd11.prod.outlook.com (2603:10b6:8:f3::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 03:05:31 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8844:2d91:a510:af3c%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 03:05:30 +0000
Message-ID: <61419c56-0a36-47b5-9fb7-175b24cfa8bb@intel.com>
Date: Mon, 27 Nov 2023 08:35:29 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231121100906.3587649-1-himal.prasad.ghimiray@intel.com>
 <20231121100906.3587649-2-himal.prasad.ghimiray@intel.com>
 <0a468d2ac94069233f474bf6c965d8deeacc70e5.camel@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <0a468d2ac94069233f474bf6c965d8deeacc70e5.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DS0PR11MB7804:EE_
X-MS-Office365-Filtering-Correlation-Id: dc2013db-c07f-485c-a577-08dbeef5b6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: knLf8ycPvYE1SClxMoLiBuAj6WZaeQvJR9d3iWaUHfMiDGVx19Dk9rL1jMJSkuPccC95Rt8KUuQY14Dlm/hNRTq744JoX83GZ5u+KCyMoK99RhnRH8RjrtamhxPh0Jkju1UzEehs0oR7QJq/w97IqirXFK0Yfp7j5Z8LebXzf0CFDB7NTEa8Qtcgphga/k9x0Q/5Wpa938X/jk4vKkPr6PwStp7HEtvfPuXpBiOrF5HQqpgZiVuG2ZwQT2IQyr+rXHBOX9mZR2C76fvFUL/3/fXADarDnQfv1viU8+rmYBQGH+NSoO8CIX8eUynd+RZ8XLYkrJ444vEbcmTp/PUw+0nhd38b+uifxXk20Pbw5OqX/Ru+E7ETjJf7fFBZrWnrePRTFuQiUCuJzHjlqVJS7caiBoSz+oaaabrgo2IKPZxNfwWJv5wDQhPnUBomhYRB0vKzOU+Wc5/Khukhsr3nEv11upH+RKDgTU8JicLk2qTTCdsOU24bXpEMtb+Kq+oRyBd+MHEyIlZLbEjSaHj5WtGg/P6VTsJn6EUBc3/L8b/Tr4TT8DRu75BD6dhogo+2ED+n6ObR08GBN2xeXAGxaIr3QKJDvYQMWPGCGxJT9+4niAK342FSq7wgT5TcAmF4cuJ5uRGIzrYcCk3/DtBL4w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(376002)(346002)(396003)(230922051799003)(1800799012)(451199024)(186009)(64100799003)(83380400001)(38100700002)(31686004)(66574015)(82960400001)(8936002)(8676002)(6512007)(6506007)(53546011)(316002)(66946007)(66556008)(66476007)(86362001)(31696002)(5660300002)(6486002)(478600001)(4001150100001)(2906002)(41300700001)(36756003)(26005)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MXJIZjZsOU5SSnNhVmc4NTBpL0ZJTm14UDRVaWZSYUNOL2M1ZXI1TlNyZHFV?=
 =?utf-8?B?YWU0RTM1dGk3dHVsbjAybjV6MnBCWDVESlBoaUZSWjFRdWlxaVk2UDBNWkw2?=
 =?utf-8?B?RzdZQjJqNFlkd3ltYXUrYTZTdjk2cmc4TEgwUFVhbUxvQmdpTDBPeVV5YzNr?=
 =?utf-8?B?cStCdEhab2hhdGVVM29mSW91RWkvQk50NjVUMEhVUmhiMUlxcm1lbzJtSmE2?=
 =?utf-8?B?M3JiTVc0aDBDZXBEMHoybmRQS3pLMHVkdENIRENXUisyRWpDMXJTKzc2aW94?=
 =?utf-8?B?cW9Ec1dtazlXZitucWUrMkNaN0lwSExJNXNOVE9RVGRKcFUrT21GVExyRnVv?=
 =?utf-8?B?b0ZsYXZlMUU3ZWt5cmlreFV4ZlpIUlc4bUowbm1JcTlqQlFSdDVZS0w0M0Jn?=
 =?utf-8?B?M0ZhUkZUWkJteE50ZFM2ZUNqSVJFekZaSElBRE9nOEcyOUdaUk5pSVdRVFRC?=
 =?utf-8?B?ZUtRV3ZxY1FDRExIRTdCS1d0U0dVQUFDWFJtR01sc1d2TS9FU3FxTjJVaGF5?=
 =?utf-8?B?bEVRR3NoNkJYMkIvQU9vMU9Zb1FUVWUvanBlVjh1UWdOTW1aNjZQSTk4VkR3?=
 =?utf-8?B?STBDdk4rbXR6MVRhSzhvK0Z3OU5WUkhzTXRuY0IyRG9pbEIxMHF4ZSt0V0Ft?=
 =?utf-8?B?RFQ1VWZGYlhicU9VMEQxbDE3MnRCTjNoc1lqSC9qL3pzVkZheGVuS1FZeEht?=
 =?utf-8?B?UDhGamxIMXFYRVNqM3BSU0ZLNTJFTWNsRnZwZjBOUlBYdENIdkpRblFsTFBH?=
 =?utf-8?B?VmRCMG5GTmNKYnQ1TVQ3TjIraXdxMzh0czFkNjVWSXMvSW95NnBLelYyVFB2?=
 =?utf-8?B?UXBFT1hXaTJOT1pIRmErb0Mybk40ZkpGVDNETGNrNDYvYjB2aTdyQktyaURs?=
 =?utf-8?B?WTZlcFlMSDAwMmhucStkK05EKzBjRlQwR2dnczRtZDE1SHFMNkdLZm9kNVp1?=
 =?utf-8?B?N2JkTEFud1ZCc1EyMWZjdHBWMmo1TFR6bFh0OWxiUE9ETDdtTnVyUnEwR1Uy?=
 =?utf-8?B?WVZtUWUrOEVtSGUyQ2t3S2FXZk9EdjJ5clA4N0JGbkNDRW5NOEFMS1ppSW4y?=
 =?utf-8?B?cHFIbUxyUkcrWnRXN1JHeksyNE9yTTFpakFBNHhMcUV6RVlXSnJXVFNUU2Ji?=
 =?utf-8?B?Nzh6SExEaUErWEVxQm9PWVVwSDVqSFlUeHVTUmIyWEhuVUJ5Qi9FOXNSVVdH?=
 =?utf-8?B?NVJ4ZXN0cGxBSjhlek1oMzVDaUpIYWE1N0M2UklhWlVXeHFqMElEWUR6aE9D?=
 =?utf-8?B?Q0ZsdG5seEhTYmFPZnBpYTRmeGk3Qk9Ea2NJaTlmUElvV2E0MmZVQmxIUngw?=
 =?utf-8?B?ZlBob1BsYXlmRTJSa3JTVTUyRUE1TFJ0NUl2TWViOW1HTm1jTFNYQXQ3OW0r?=
 =?utf-8?B?c21jbG1OOCtvTDlyWU9uRkQ0eDN6WnFiZmhkWlI1SE9aRlNlSU1DUk1vSlht?=
 =?utf-8?B?MVVabG9wWk1SaDQ2L01KNk1kY1hYNmNWV0tPeHFpVXJJOWhXMElxakt5Uk94?=
 =?utf-8?B?cnRmd0ZreUZyeUtuaitFUmNiOHcwWlkwc3FTOU1QWkpPTWpwVzN2RTJxblUy?=
 =?utf-8?B?R3NxNm90c3VLZ0VxY1VIeTd3S2NGek80dUs1UDRSemFGd3BmVFNFQUIzTEty?=
 =?utf-8?B?aWFEaitZczQ4VGJvTUZBU2s3azVZdTdZTUxuTjJ3YXhmdTROUWR1UmlkdzN6?=
 =?utf-8?B?dy8zLzkyR24zSVJGbnlBQlE0Z200Yk1aOTFTODNRbXhtOWRQYnJDb2JBVmFz?=
 =?utf-8?B?ZWtrTkk2RnA1SUJZTDBLWUhWK0VGUWkxWnowclVjT3FXWHR4ZHMvbUdxZkJF?=
 =?utf-8?B?eEgrUVU5S1VJblhTS3dkM3NFWnZxbGFaRTgxSkVPR210U1Z4aGpZSmJuS3E5?=
 =?utf-8?B?TU1hY3Z2UkxjK21iYW5VSnpKSHQ1V2lPaGlmZnFCZ1hoZU81eldPQ2tUUkZH?=
 =?utf-8?B?TGZwN3RtMDBwOEQ5eWgrUXpWSmRKdXduMXUrNkVFdU56QVp0WDVKaW54MVRY?=
 =?utf-8?B?OXBUU1FOVDB2SXBwUXNVOThVVDEyMWEvdHFZYWRQS1R1TmVOY3N3aWdCVDlU?=
 =?utf-8?B?U1hnSjA1Y2Y0VEhkYmovUXorU1RsU042OWFKSXZRS3hHZEhoOU5USWpxMFkv?=
 =?utf-8?B?VkE2WVRLK3ZVTk56S3hrR2FtUEc1VjV4T2YyZnJYZXhTSHNXWWxPcEJJWmJU?=
 =?utf-8?B?YVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dc2013db-c07f-485c-a577-08dbeef5b6e4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 03:05:30.8783 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGqWYfsdTxlFIbfIrOu5z6W9M3bft7Jc+rttF5/mE67qKCVNb/p7D6gsBF4Jmk62GetzPHhADDgR99oihGSibCEqLc8XcdPP1Pp3j2HadmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7804
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC v2 1/6] drm/xe/xe2: Support flat ccs.
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

Hi Thomas,

On 24-11-2023 16:32, Thomas Hellström wrote:
> Hi,
>
> On Tue, 2023-11-21 at 15:39 +0530, Himal Prasad Ghimiray wrote:
>> Enable flat ccs for XE2_GFX_FEATURES.
>>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pci.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Typically you add the implementation first and then enable it, so this
> patch should go last. (Rule is the driver should not misbehave if
> bisecting lands in the middle of a patch series).
>
> /Thomas
Thanks for the comment. Will move this patch as final patch in next 
version.
>
>
>
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c
>> b/drivers/gpu/drm/xe/xe_pci.c
>> index 682ba188e456..d9754f3d45f7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -157,7 +157,7 @@ static const struct xe_graphics_desc
>> graphics_xelpg = {
>>   #define XE2_GFX_FEATURES \
>>          .dma_mask_size = 46, \
>>          .has_asid = 1, \
>> -       .has_flat_ccs = 0 /* FIXME: implementation missing */, \
>> +       .has_flat_ccs = 1, \
>>          .has_range_tlb_invalidation = 1, \
>>          .supports_usm = 0 /* FIXME: implementation missing */, \
>>          .va_bits = 48, \
