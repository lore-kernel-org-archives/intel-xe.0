Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A18FC6FD1D
	for <intel-xe@archiver.kernel.org>; Tue, 14 Mar 2023 10:03:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3136810E15A;
	Tue, 14 Mar 2023 10:03:31 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD4F010E15A
 for <intel-xe@lists.freedesktop.org>; Tue, 14 Mar 2023 10:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678788209; x=1710324209;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=CHhNfgnPj+gy9Cxl5nn5DHouDQ/HFnw5tL8MRGos20U=;
 b=B+xRKq0fxmlWIg9lgM3nj7fRvfz7WrwX1fXIgHbTwozmBLKptxvPMaGH
 ObHZfw8zWrZAAp/k5L2Seoy6+o9Gql4jK4NsionODatzODzZQqPE+c09u
 6oEfPjLlwqAxOsnmt+FZgk7fAypDMHLq0j5hjy2yfwrRfxQIeagYQT4e1
 hCHurFqjmJo4V/ifZ9YF6Rjas7rrolx0JH3H3CmRlfgEHgGS3+uIsbQVC
 TDVcG1YfxQb5pfKR4Xq28kqMMSmFo8WAzRIqOMrVd/Y2TjnILtR5r3jnA
 6zlhS4CWs7usFaruKu+qKxXJsMXTYFrj4T29X8E2mDSyyAeabpcFF8NOk A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423652591"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="423652591"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 03:03:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="924858035"
X-IronPort-AV: E=Sophos;i="5.98,259,1673942400"; d="scan'208";a="924858035"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga006.fm.intel.com with ESMTP; 14 Mar 2023 03:03:29 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 14 Mar 2023 03:03:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 14 Mar 2023 03:03:28 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 14 Mar 2023 03:03:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=giA1VCd7aO799eUTHKjg0jN+XDmGGnI9Lp4Oeh6HQwKhqypKn3Y2mWj78KnX5jqGkm272WnML6j0dDbInU7vKy10JriPufWikB7DTnpYHta5D85vjl8ZRlj/yjHA2ZjIF+3RU+w0qgYvVZe53c/9H174A11kb0ayhFgc7MlUDSS3vRy6b4CsXVkLlNrBJa64jxuBVrjC1r2od1TG7UYBIzWZ7Tqb2jcNdGY50MJ0fc34O/Mu552zCw3+v6quRKt+7lg/jz/nzFQ8QF9EPc3IAjHgV4lt5jJ2UkKaZ2Kru+KaTzJ9gZoWBpRFOnKFnvcJn19iN3iLI4o4R6o6v116Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRM92uumalUL51IXmDjlJ1ftLId4Aka5I4UETvbRgq4=;
 b=EQrfSdfwcer7MYShuZgamB1Wf+2X078qYMeo4sOKBRj3LmfCjLrMDKNB9UGaO7SmUHZS3dlrSSCwbmHqx7dJ/5QeQm1AC9qBgaaKffztSKXiP3beinau5nouTAd9ayU42/KMPTFZaOt6QwxYOcrq5bEU0SRvFTcz9/LEj2cufuSTK2oP2MdxpSIBLTFAAmy/9enM7MU7jgWF5VDWTYPtdepr0TQk6BSwdapWok6sI0ZcLsjL6m5mgqHijs55hNnNdoCGgDCGQLDiIe/266WnEJGrb4RK6byg+BxN8S47iH9VWNT3ON33RQbHvaUKQhtJSvFSFfbIC+fDliXE1gTRUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Tue, 14 Mar
 2023 10:03:27 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::722f:d9ac:d42b:54b4]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::722f:d9ac:d42b:54b4%9]) with mapi id 15.20.6178.026; Tue, 14 Mar 2023
 10:03:27 +0000
Message-ID: <a0805828-ab7b-ffb4-c75c-1d967a33414c@intel.com>
Date: Tue, 14 Mar 2023 15:33:17 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.6.1
To: <intel-xe@lists.freedesktop.org>, <matthew.auld@intel.com>
References: <20230309131856.1480173-1-riana.tauro@intel.com>
 <87edpxna0l.wl-ashutosh.dixit@intel.com>
 <5f56e536-191c-7076-9257-dcb366518dff@intel.com>
 <0c2ad013-0e14-97ad-0d79-7c0663b3afcb@intel.com>
 <5d3e881d-9296-0e85-d388-5f21ff9304d8@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <5d3e881d-9296-0e85-d388-5f21ff9304d8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|PH8PR11MB7965:EE_
X-MS-Office365-Filtering-Correlation-Id: fa8aef45-5c0b-4c65-a03a-08db24735ac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KSgvk0S9L1644D5uNT9FAHrGnB0NroT0NnJmLGTe0VSHqTnpu5S11KQvhqM48iGUQUPMTwkhEDPCToLsMjDCRHVYQ4fytttXi4xnbYnEXB7imfTBWV35tKowYpX3Te4Diu9SKNuh9kZZeNrZWly6cDOwsnMEh98wYrHrGLuP7+SxMUJIp44VWrk3sImcs5vkr81bFcUl/Dtm+ShRWtaoW8hl25hwBs1mpMRQ3rgm0/+PgC4lJKi+8GDjVpgOvg9cO/LQ18PGZs5LEkUjPOpQUdT7Q6EwDiifhXwGk4bMHvuXQslWLZgjvDiz3QjdpPb+GP0CxRUGCB+sPm8I8PT1qRLvC/+ttBDtC8cNaRBNMOa3EoIM+xa+2DA+H5RUL+haQ7wdNMtB1/KJ+cnxYoGVux7H7dz29HW3+SCsRO8QrbeeSzhBd5rtkJ99OkN1cMQvYMi3jC5WgzBiS5Oa1wQkoMIeNZfxK5EYXz9Tagf4QMlC/70cIBuP8OyToiv9CZtBft8HHFuQMz4PKfMXuR3LGrggoV0OehGQL9irI36XzokLt6VU0Mjbr2GIHjKY8Xr/DV9wHZPYAPrjJ3VRLecqjCpcehvz1XtnbxaCcSYyp+Mc0MxoHDyJzY/CVm/SX7hKimW3CVzVAoDL//rmPf5qqTSy5SPYnrD4lWQlm7GVfeKHrV9C45AvmIpAVAyv1ntF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199018)(36756003)(31696002)(86362001)(4326008)(5660300002)(186003)(41300700001)(53546011)(26005)(6506007)(6512007)(2616005)(8936002)(6636002)(316002)(478600001)(8676002)(107886003)(66476007)(6486002)(6666004)(66946007)(966005)(38100700002)(82960400001)(66556008)(44832011)(2906002)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDYycmNBcGZRUkxYUFhRYjcvWlIvOURERnFZaENlRm9FZ084dlpubFZyWlMw?=
 =?utf-8?B?QWlWTThsSnlza1N4cXJ0blEwUWdjNWJ3RmlZRHlCQ3ZTbHdYb29LblM4ME9T?=
 =?utf-8?B?cjZLZFEvQko5UXp0M1JLWXhwKzBSWkVpbFM0eE5BNEhydWwwZlV4cUFmZGZi?=
 =?utf-8?B?WlFjZWRldklmOWFzZC9NejJQMmpsa0ZmN0xBMFo1MlFhYjhzbmkvVXRYMlUx?=
 =?utf-8?B?S0pyMFlDRFpEQmFJQTQ4SHVoTDZWemgzbVdnaWk5N1lLRWVzUDc5aDZQbHVQ?=
 =?utf-8?B?OXhzUGNHTVJxOFdBcFpRU1dmQSs1RCtuQ3pjUTBLcU1GTEhROExRSU9obTdv?=
 =?utf-8?B?OHF0T0xDRTlJNkxJS1NEamJCTjd6UFFSSmQveG5ubEFSSXZTTTc1bFFmV2Ru?=
 =?utf-8?B?WUZkeFN6OW00WVhFVVdhcjhPV3lVSkJvVXZwek5WWWxQaXpwMUZYM1lUNmF1?=
 =?utf-8?B?NHNvNVMwRjRHR3M4cVM5Nk85K0ZsSHZiclBnU2E1QkxRSHRzeEdjbHg4VE1F?=
 =?utf-8?B?aHB4Z0Y4Q2N1enV4dUVwWEZkbnB3Z2gwQldZRWV1eXRHaVU1ajBJbkYySXhG?=
 =?utf-8?B?RDV0ZnVoYlBzVHFHOTFCMC9IUHNBbmV2L3lySVV1YnphSWk0bDR2ZDVNekZy?=
 =?utf-8?B?OWY2VG1EZzJNa09xR0I5dTlBTUI3Rmd3UFFyOTFCYitzVnFnL0I0b2duVjVO?=
 =?utf-8?B?NitNWE9OSTV2RnhvdzFRYkxqQ09vaTJtNlFBV25LK2xGZ2dxU0NJcWg0NTBz?=
 =?utf-8?B?NHJyMUtBQUVjYnpPMkxNTk83ZlljVUd5SHByR1lQcGk3RHF0K3BtUEZkSzFp?=
 =?utf-8?B?bDF6ZElJRVNMU3poOUxUWWlLMzZTbW1TYUJBUitWZ2RqT3d1Nit4enJVRHVD?=
 =?utf-8?B?c3k0QWIrOGtrUVh5VG5GQnJDOUVPV29xUyt2Y01GVXF1UzVxMEdvV3V6aW85?=
 =?utf-8?B?eVNNaUpQZUxFb3o5b3duZHQ5aXJZam1XUVBNM00vaThaZzE3c3lGYUk5Vnhq?=
 =?utf-8?B?UmJlbU9mckpUVjNMY1NyM3BCVktqcjNQZWt5KzY3dmxQbjdPVW9Nc2Y3bmxa?=
 =?utf-8?B?d1pRYmFjQ0NXMEFHNi9odUthbkt2bGxFb1dZalJNQ281REJHYy9NSnpXbjBx?=
 =?utf-8?B?aW1SZ0JHaG4rUWZ1ZlhjYVZ2ek8wVkh3NTJwanBMTVZsbUtucFUyOURLWUNL?=
 =?utf-8?B?R1hqQkpZWEswMEJuSDhhdFRQZUVoTkVIM24xS3VKZnBReFFhN3oxd2l1TXcz?=
 =?utf-8?B?MnBKNUlXdlJEMmtRVHBKMTFqUE5vb1BobUVwdm5qRHFVcEVycjJnSmo0cU1k?=
 =?utf-8?B?cEhZUGd2RjRzWFZGUE9UaUdVdGlmYnhWWWNDVjEyUFVwR2xDOXZ4UTUvdm9D?=
 =?utf-8?B?VnlqbTl4bEZlbDZMQjIyald2YTJpU21TRDBOZVNKelRKeVV1cFVIeDBmTWFI?=
 =?utf-8?B?ZXZNNkhQYzlGNFN5bVNSYkpqVWpsTWlkeVFaZmJnZGVUNVJMOERCWFdJdExG?=
 =?utf-8?B?YzJ4RHl2R0x5bzNRZk9RdUZzVWlJc0hLT09yQ1ZNVlJ3MDJ0NWNnb3RuTjZZ?=
 =?utf-8?B?VFgwL0c1Q0xpUXdBanc0V2txY3R1MmhGdldpRFFWT2ZRTVhlVk5zUjJ2ZkQy?=
 =?utf-8?B?aFp5MUNtZFo5MXFoTW9VQ1VuMWYxYjZDQTNwTmVnQ1paM1hUNExJRXdqbFp2?=
 =?utf-8?B?ejBiMWFSZG5kMWJGdWNCd1lJUjUyd3RUU0RIK0xhSUJqdUNkakFsdkxqY2dn?=
 =?utf-8?B?ZHJ4ZGhKT01yNVlvU3ljWDJwamV5MVNzakhKQkx4cHNjeUZyZUlBMFMzTnVE?=
 =?utf-8?B?MU0waHREU3pZWHhvTEZ5SThmQmRRNnJqcy9FbW1LWjZpaGtXVVpnYldOZkxJ?=
 =?utf-8?B?cC9zR2VwVkZXbmdYSHp6SGM3Qy94NnkzQ0NzSVcyWU1qSUNmZlRHbmdDRjZr?=
 =?utf-8?B?aHB4eEl6UndTSkQyL05vUGFqZUhBUTU3VUdUWnpXdjUwWklaZ29Hb050ZmtL?=
 =?utf-8?B?elZ5YVBVTXhBTldoZXluNFEvTElvWVFXTDZHL2svNnJWTm1MZWt4c0lrZVBI?=
 =?utf-8?B?b3dDZHpVSFc4Qk1lbllYaGJhYm9QditaQVdCUGlpYXI2YW5aMWxtMnd2LytG?=
 =?utf-8?Q?7zbaLSU1MF6q1yMIda7L0PCTy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa8aef45-5c0b-4c65-a03a-08db24735ac3
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 10:03:26.9727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EaCJIbm4oByLqAuPDl3o2laKVnibC6d81H9A1Vf6C1+M5irG7HlVNO39Db3gjjvtvbF1Fmnj1kFH3NvjPB3rCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7965
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



On 3/14/2023 2:22 PM, Matthew Auld wrote:
> On 14/03/2023 08:27, Matthew Auld wrote:
>> On 14/03/2023 04:48, Riana Tauro wrote:
>>> Cc:Matthew Auld <matthew.auld@intel.com>
>>>
>>> On 3/9/2023 10:21 PM, Dixit, Ashutosh wrote:
>>>> On Thu, 09 Mar 2023 05:18:56 -0800, Riana Tauro wrote:
>>>>>
>>>>> The overflow caused xe_bo_restore_kernel to return an error
>>>>> Fix overflow in vram manager alloc function.
>>>>>
>>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
>>>>> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> index 643365b18bc7..159ca7105df1 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
>>>>> @@ -118,7 +118,7 @@ static int xe_ttm_vram_mgr_new(struct 
>>>>> ttm_resource_manager *man,
>>>>>
>>>>>         cur_size = size;
>>>>>
>>>>> -        if (fpfn + size != place->lpfn << PAGE_SHIFT) {
>>>>> +        if (fpfn + size != (u64)place->lpfn << PAGE_SHIFT) {
>>>>
>>>> Looks ok but not sure if it should just be lpfn computed above? 
>>
>> Yes, that looks correct. place->lpfn should for now only be set when 
>> we want to place something at a specific offset. AFAICT this is 
>> heavily used for pinned kernel objects (as well as setting 
>> ALLOC_CONTIG), and incorrectly applying the roundup_power_of_two() 
>> might break stuff when restoring those objects (the roundup might 
>> smash into other pinned kernel objects).
>>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
> Pushed to drm-xe-next.
> >>
>> fwiw the plan is to replace all of this with the i915 version, which 
>> also fixes this:
>> https://patchwork.freedesktop.org/patch/525697/?series=114521&rev=3
>>
Thank you for the review

Thanks
Riana
>>>> Copying Matt.
>>>>
>>>>>             /*
>>>>>              * Except for actual range allocation, modify the size and
>>>>>              * min_block_size conforming to continuous flag enablement
>>>>> -- 
>>>>> 2.39.1
>>>>>
