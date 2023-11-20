Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39C8AC5AE5B
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 21:22:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7673F10E154;
	Mon, 20 Nov 2023 21:22:38 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C85A210E154
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700515355; x=1732051355;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Fa1yf1GWrFokHGLO1ac/kVVN1VjY5Ws5+N87TxhJ+uk=;
 b=Tjf64DPqv5HmAwjg+k2VyrK6KWrVnrVP986ojJAKn6LLpsxIz/vz5SO+
 ZDne/x5wnUVOccvNVdYLD6R2CQP9z2O5jBG1t5s8BRoz9bBM5ii4YFHVI
 GjLjXo58egLSR909ilWxsgBFO2UzKP/xQJV5M6858goZPi7nTfPDze05e
 qBEYK1vkDMEuU31oJ2w6i1J/Th0Wju1XT+g+AAWN1+eJUPoYEiflw619C
 GRs5/7ykqy7YXFoPctsWCKSaztPGMvobKvKsn+8/TUk9x8qJR4cIMFtgE
 XZukcNOWuxPGlOn8nC1N84kwaUWKsTneMiWffDVInCNvv8k9G51cTGwhx g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="388860851"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="388860851"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 13:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="759892492"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="759892492"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 13:22:31 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 13:22:30 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 13:22:30 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 13:22:30 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 13:22:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W5PvIByQBc58MWeD1Dz2nbf9J78l6KBLT8bBq3WobeeOjhNv2ujHLjbqR+Jol6ff25i3US14YEaAY9YquhMHHs6+VA49hZ+8ihEIBWAdjZcG6S2Us8vzbkIKwlViDw64MVDjUYhktsfIT4HAowk2xdMa/Nbz//mkP8W03iW4LH1ZgRrrWBCvzrze4+mw1TAdx0IPJIw37bxfwixU9r7qOrTh5cn4lEfvHmMIjOY8pOfLQ5aMvhBSGYOIr7cNl2q6BITcgiKuDlemqBxmFaVlu5br414Qi5vNfdQjLzpRXPAtrKAKDsFS7h6+ya/8BQWtWeNc+6biHR2nG+B/Mji66w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mtJKg7v0pz/63okVnDu0dTCGwmqM3Zy+2jM8iaD7i5o=;
 b=blFEIrqaaDFAJQR+DPSn5V2b/lkGKJrmN0AWnSfzXRzCzdBHhAczF6wdI89XpNtmtvq10S/CskT7zrtc7GoAqfIOCDlUbjJh474HMrKaCWzGbVxzVaD27W/cy0syz4KyXVODpJZKCAUDokpKuct8DAVxI5eQjTaYjWI0PBSc44oy3YDJoBcy+kpSNmocMaa3QmQ2Rjes2lVzbwnpYZ5F+qNG9XB8HtqHLMnj3OvXF/6gvUspQVKSb47J8rbvl2DITC07EnQbHX0Rxmw2QcAKW9i5AXGO2P5v2jVUPzN6wAFrPhbQTs+E8IoZfCNnF5r/tZnKe5LMdAgR/9OwgIcyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Mon, 20 Nov
 2023 21:22:28 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::73d0:f907:41e4:4a34%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 21:22:28 +0000
Message-ID: <88dd732d-dbcf-4690-830e-a3962832e5a2@intel.com>
Date: Mon, 20 Nov 2023 13:22:27 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20231117225155.2614535-1-daniele.ceraolospurio@intel.com>
 <20231117225155.2614535-10-daniele.ceraolospurio@intel.com>
 <SN7PR11MB67506D45A1F7B2E6736344B2E3B4A@SN7PR11MB6750.namprd11.prod.outlook.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <SN7PR11MB67506D45A1F7B2E6736344B2E3B4A@SN7PR11MB6750.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0182.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::7) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4802:EE_
X-MS-Office365-Filtering-Correlation-Id: 5569f3d2-199f-4293-8d6c-08dbea0ecc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9/nZQWGEJoDC9amR6FYubCSZDgTxgtHiZvCSu8K1XkIBvf3/HNGTBICBoU59+B8xUnffMNa+hS8/1Uw1fgEAdsIj5WPyt4gqEQxN8saF3wtVkv1WTglvhCx5fuDvlCOLgke6WloDvBbLTarIpwBLnJ2rkhA8BjroH2RJgQX4pPy1EfXu5xPGuSTBxmtmhMWZBY7+RjD4gU9BrN+qjaTCwODfv5/FMx6ezfmr0xBtWoW0GZbG4T+X15dMilFtTnClJj68YcqXXdIIgpamppOpSH9jKBYElHBc/lmKqTZF4BZyPH9lSTOrUD+Rm9GxavBIgUCPnMCcaBpFVFivoo9DU06SX1/mihR/DhXI07LSEpBy3cHwRtkxUvO/Ddo8MAv1PoZboS1BJJ2qzodG4d0NfH7Xl6ACTkxb1yDcWnrc7ulOYH6CHpgVsvgSwGZbD5j1kZPt2xwWfuTrhL4iqaO+syJJ45R5l4MD29nFgx9oRu1S/iKsSZqpP0r/uMIcA2IqR/w6AVMhrvgIfcrNWBqv7zi55yCMWwi9/FQTroa3RmVTaxtYUtg7OezsMl2h3UzHjPQeY6BB1qL6mKs4D/p8cbN+35nfPGkkpUxTz37N9R1tzPYKva7ubbiBRP7JxsNUfXGYnt7hlZ8FacpzizXEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(376002)(366004)(396003)(39860400002)(230922051799003)(1800799012)(64100799003)(186009)(451199024)(6512007)(26005)(31686004)(110136005)(2616005)(66946007)(83380400001)(478600001)(8936002)(8676002)(6506007)(316002)(53546011)(66476007)(66556008)(6486002)(38100700002)(41300700001)(2906002)(82960400001)(5660300002)(86362001)(31696002)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Rm00M2RHbFRLeWRLRTQzaEdkcVNJOGhVNm94bW1POWdqOUdkcElEd2xqV1Jr?=
 =?utf-8?B?UEF4SytsZmJYQSt4aWpidHBoeFVkM2MrTnkzRUhVdE5ERGtac28wamZ1cERr?=
 =?utf-8?B?VjlLRlF2Mk5CbEh2NDQ3YjRIQU9GaForaDB5RUdTOW5DZ2tSdCt3cWpjT0JO?=
 =?utf-8?B?SnpGY0lrTmhtV1NFS2YwUFZRYkl3RlNMWHhwOXpRU0VpUGdGa2FrLzJWQjVP?=
 =?utf-8?B?MnI5ZkVFb1FFalJ0M1FRdW1CeS9iZXloSTdNQVRzblV0ZXBrU2s3RFUvSU9v?=
 =?utf-8?B?YXJoaWx6bFpzazFhL0hlZnhTOHZBL1hpdWV3VnpoQm4xaG9JSlJxRU0yWm95?=
 =?utf-8?B?UDlzbFAzZS9rOXZPMm9jWnpIdG9NS2FWY3hxMkZCSURWNFcwYlRlSzVTU0Z6?=
 =?utf-8?B?VkI0MzVXNWdJdE1SdFpNakhnM3MvdEFEU1k3WUtZZ0h2VC9ubnNJM0gwVFVy?=
 =?utf-8?B?TitpUFdpYTlBeHo5Kys5cUtXUFFNUUIwbVZzV2xzNGZxbjJsQWY3Y1Y5QWM5?=
 =?utf-8?B?T2d2TVk4UlpROEdIOGhpYm9nWm02VThiVDFKcnB4QUdDOFMybVRiam1nSndC?=
 =?utf-8?B?OE54Vit4VE9IekkzVlFSV3R6YWljZ2FsbUs4WDBlRTFMTmw3Ukw4cUlKczRp?=
 =?utf-8?B?Ujl3VXdpR3JGL1hQUnNoVXAxdFBBQkZjMW1RTTg2alBZV0MzeG8wV2NoUndm?=
 =?utf-8?B?d1Z0UjJmd1B0OVBiMEp2UlJ2MGVrN21BZjJMSUFmRG9jcUZLMHVjS2xINnBU?=
 =?utf-8?B?WkN0ZFplZEZTN0UxaGt2YXo3Njlrd0xsNGNPOXFlaEF2bU9yS1hzQ2QyUTdx?=
 =?utf-8?B?QWdJRmtGYUxqUW12N3pqK1dsQ1FjL0xXZGlYOUhtMWdvb0VzaVk5TS9ocmZL?=
 =?utf-8?B?R2xRUGdEay95VFp4MFRIRnVtQzFoZWJwZ09Va1pJSFliWUNMOFRjQ0xLNGR5?=
 =?utf-8?B?SWZPa09TRUlqOHdCTUJmZTkyeGtERk42Vi9seVdYU1FqS1I5a09rVmtKVGJN?=
 =?utf-8?B?QUhIR3VaSDlGbHFkQXBmVGUybnl0SlZNbWFKc29ScC9FVFdHNkFkNmluUVoy?=
 =?utf-8?B?dE1nbFJOM2hibytFaXdBbm9lSmJOSFpEUHVBTis2VGVoYkxPS3A3bHNsR2pv?=
 =?utf-8?B?MStXS3NSTUdqNmZWSGJmanVVVllnSjFvR1gzR20yMlhWRmsxQmpKRzg3Tmsr?=
 =?utf-8?B?UUM5Wk4va3B0aGZPMFhFNTZMd0VCaVJKWXNPUWZiZUN0bnZ6THdRSCtHc25o?=
 =?utf-8?B?OXRBRVNtMWpXcUtYbjhNOXZlc0VRWndndmN3dEFQbnd3MkJYMURjZFB3WTVs?=
 =?utf-8?B?ZjhBdW9kUjI3Rk1BZk4zbklnbnNla0duUW9xcFIvQlhwbVBJOC9vT1B2Ym9a?=
 =?utf-8?B?cGNTdDRQZW43UUVTSkZIMXIzUjQyYWZLVVp4QWZKdjFHQWRoV3ZmWDdGZGk0?=
 =?utf-8?B?cE1hYUZwdnYyZVdTY2FhQVpWZ1hmLzhmSCtVZzF1Q1hCTjRtYWttQlRub0pD?=
 =?utf-8?B?OGxDN3JYNWw5djZVdEIxaitnaEdCS1BnNDNrZWNRVFNldFZ5cHhtYTJXS0Q4?=
 =?utf-8?B?cGlZaU42RUpxRVRBQjByR3d2cDg1MnBvM2NsMzJEUGRhRHhNY2lhUFhBZVlu?=
 =?utf-8?B?UWpNNFBxN1k2Nk10QzFSL1NPeWh2MldhSHYyZ2QwK3d6MmNraGcvWG9qTHRF?=
 =?utf-8?B?cnl4cXFhbS9NSFlrdFVndU1QT2Rqcng2L3NlRFY0dkFyaENUYmJlRmVISXB5?=
 =?utf-8?B?MmNHeDIwczI1RFBpSmVkdHRzNGdrMkJBSUdrdDlLWkJGQjBSRjMwWG5COVR2?=
 =?utf-8?B?ckpqZkpBbDh6aG9Uam1PNjNHL0xiVzhBYk9obFFyQ2UwQ3RnWS9TQnozYk44?=
 =?utf-8?B?bmRJQkw1Z0dUeGdTSEg0QWJ5c3JPYll5U1EzaVdZckUzYzBvSzRoTnZvUi91?=
 =?utf-8?B?QWtYNC9NTVlRZDBHYnVzSWFuTHlmTkRNVFdzTmsxOHFHWHNWa0hwN1NyOUFT?=
 =?utf-8?B?NnQ3MVFQZHJjM0xSWkFhM0NCSHhqZGRvby81TjBTY3QvT2l1dFpZVTNWZ2xz?=
 =?utf-8?B?VmZtZzMySW10dUUwbEdkcXFTTTc1Umc2UjVCMmliL1czeFdyNjBMajVxQzly?=
 =?utf-8?B?VWYyUzUvbG9zUERISDUwMHFyT0pnUWxWNlJzczY3UEEyYS9ZRmkwVTJSaG5j?=
 =?utf-8?B?dnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5569f3d2-199f-4293-8d6c-08dbea0ecc78
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 21:22:28.5255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: siQqP1TPn4KGeLSC70Dsy3dJytAvC8kFykad1AhATL68JhFJwq8oUBnj9baUF7vMH3KZJMRxawrFEx7xLIyLRbMw5soPmdi6gQYCwer6T9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
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



On 11/20/2023 3:49 AM, Kandpal, Suraj wrote:
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Daniele
>> Ceraolo Spurio
>> Sent: Saturday, November 18, 2023 4:22 AM
>> To: intel-xe@lists.freedesktop.org
>> Subject: [Intel-xe] [CI 09/10] drm/xe/gsc: Define GSCCS for MTL
>>
>> Add the GSCCS to the media_xelpmp engine list. Note that since the GSCCS is
>> only used with the GSC FW, we can consider it disabled if we don't have the
>> FW available.
>>
>> v2: mark GSCCS as allowed on the media IP in kunit tests
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
>> Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
>> ---
>>   drivers/gpu/drm/xe/tests/xe_pci_test.c |  9 +++------
>>   drivers/gpu/drm/xe/xe_hw_engine.c      | 20 ++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pci.c            |  2 +-
>>   3 files changed, 24 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> index 9c6f6c2c6c6e..98ecab51154e 100644
>> --- a/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> +++ b/drivers/gpu/drm/xe/tests/xe_pci_test.c
>> @@ -33,13 +33,10 @@ static void check_media_ip(const struct
>> xe_media_desc *media)
>>   	struct kunit *test = xe_cur_kunit();
>>   	u64 mask = media->hw_engine_mask;
>>
>> -	/*
>> -	 * VCS and VECS engines are allowed on the media IP
>> -	 *
>> -	 * TODO:  Add GSCCS once support is added to the driver.
>> -	 */
>> +	/* VCS, VECS and GSCCS engines are allowed on the media IP */
>>   	mask &= ~(XE_HW_ENGINE_VCS_MASK |
>> -		  XE_HW_ENGINE_VECS_MASK);
>> +		  XE_HW_ENGINE_VECS_MASK |
>> +		  XE_HW_ENGINE_GSCCS_MASK);
>>
>>   	/* Any remaining engines are an error */
>>   	KUNIT_ASSERT_EQ(test, mask, 0);
>> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c
>> b/drivers/gpu/drm/xe/xe_hw_engine.c
>> index e831e63c5e48..c52c26c395a7 100644
>> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
>> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
>> @@ -26,6 +26,7 @@
>>   #include "xe_rtp.h"
>>   #include "xe_sched_job.h"
>>   #include "xe_tuning.h"
>> +#include "xe_uc_fw.h"
>>   #include "xe_wa.h"
>>
>>   #define MAX_MMIO_BASES 3
>> @@ -610,6 +611,24 @@ static void read_compute_fuses(struct xe_gt *gt)
>>   		read_compute_fuses_from_dss(gt);
>>   }
>>
>> +static void check_gsc_availability(struct xe_gt *gt) {
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +
>> +	if (!(gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)))
>> +		return;
>> +
>> +	/*
>> +	 * The GSCCS is only used to communicate with the GSC FW, so if we
>> don't
>> +	 * have the FW there is nothing we need the engine for and can
>> therefore
>> +	 * skip its initialization.
>> +	 */
>> +	if (!xe_uc_fw_is_available(&gt->uc.gsc.fw)) {
>> +		gt->info.engine_mask &= ~BIT(XE_HW_ENGINE_GSCCS0);
>> +		drm_info(&xe->drm, "gsccs disabled due to lack of FW\n");
>> +	}
>> +}
>> +
>>   int xe_hw_engines_init_early(struct xe_gt *gt)  {
>>   	int i;
>> @@ -617,6 +636,7 @@ int xe_hw_engines_init_early(struct xe_gt *gt)
>>   	read_media_fuses(gt);
>>   	read_copy_fuses(gt);
>>   	read_compute_fuses(gt);
>> +	check_gsc_availability(gt);
>>
>>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT <
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MIN);
>>   	BUILD_BUG_ON(XE_HW_ENGINE_PREEMPT_TIMEOUT >
>> XE_HW_ENGINE_PREEMPT_TIMEOUT_MAX);
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c index
>> 682ba188e456..406b4cd4c88a 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -197,7 +197,7 @@ static const struct xe_media_desc media_xelpmp = {
>>   	.name = "Xe_LPM+",
>>   	.hw_engine_mask =
>>   		BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS2) |
>> -		BIT(XE_HW_ENGINE_VECS0),	/* TODO: add GSC0 */
>> +		BIT(XE_HW_ENGINE_VECS0) | BIT(XE_HW_ENGINE_GSCCS0)
>>   };
>>
> Do we have a function which checks if GSC CS is running or not for clients like HDCP to use

For that you need to check that SW proxy is initialized. That function 
will come with the SW proxy support.

Daniele

>
> Regards,
> Suraj Kandpal
>>   static const struct xe_media_desc media_xe2 = {
>> --
>> 2.41.0

