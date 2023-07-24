Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB52C00528
	for <intel-xe@archiver.kernel.org>; Mon, 24 Jul 2023 14:12:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52FD110E328;
	Mon, 24 Jul 2023 14:12:16 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED4F10E324
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Jul 2023 14:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690207934; x=1721743934;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=tMsC680yxj544nhsTDJqwlPUmgBMknbFF1Z50KzJQ5k=;
 b=k2EFpxE3btXb2FF7X7NR1jpC8kXf96cmfqQp0KU8QW7QFR2nQLO2WSyb
 nY+PfH2XIlu6A+S3OzuozdMSCAF++mznWBxicfgnDSVu46rjNwuRzFU+E
 Rri2jn0seI3dOB1R+bFRWEFULT2CjeSOING2z4MOCIqaFSP79nbQXuHsm
 AZvi2TEOqGQu/9aw3tyNuz+O9oqeqytFGVP9TBoOt9y4cbjkCq5Uan2cQ
 G4VjxncLoBb3DnAngxbF4bqfmonxNzQODP4Vw7rPLjYjZHQFV6GGLs2vx
 HQAEi1u/HRJUib3b6ossD7MBVovSjBMWI0T0EFTgZv6yrdY9mrtSgQ1CF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="347053934"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="347053934"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jul 2023 07:12:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10781"; a="719691957"
X-IronPort-AV: E=Sophos;i="6.01,228,1684825200"; d="scan'208";a="719691957"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orsmga007.jf.intel.com with ESMTP; 24 Jul 2023 07:12:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 07:12:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Mon, 24 Jul 2023 07:12:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Mon, 24 Jul 2023 07:12:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Mon, 24 Jul 2023 07:12:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fO0koSjEpi72dX8pwpXI9l6SWAqYQsL7etyqAX4SbK5ip/R1Xra1TOd7uj8UWWPTrE5zJ6Nhqb1QEc10YsZNGyGgALKb4tFsK5TzuU1QEFAIel9o1SYAyKSgGGdcJEanB7MMs2yQpHH2dZh2rv5oRh4FcWOdY+TZ8LOYLMCLpA3ZCQTObcKnjXT3qa9zJubv5WzJDcePUfnarAc+PoQgFivcsevpCIZ9k7Kh11/Av+VyYBycY7tJnyChosFgBlvQsxnnRwP+KR6uS/JI15WaOtfWQPirldhszQMcfBsE4ke7YdnxQVF0My94/KxYdfopit8tNclYyMpaew6920ZtHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1aFsNjKL0/VQYxP/kEbHKyMbGOCHBun6xNhFc6DfYU=;
 b=exf6RH16r39lSQ+D56bv3wXRjvDM4CreRPGBFV7ThWC13u5+oPkxOHnbtHfy/PrvJqXHKW5dx0r1u/lnCGXA6hCeGdNoYuio14bmvdwZdQ3RdCXhg3IqisKkXKRyVz0VLN708HPiv2n5U3OaV1qClHXd3CmVWKJCiHQGdzT5lxYKf9TY7x+CqR1CoMmB240VKEa74ISiyKT2qY//RbkO5t302QDPKR+ecz+FbumN0K66qsbQkHPJfUR61mn7evOgUfZlzEEU5BlDKvCmsQT5ClAvpmQ9l/QVqqbXSq65vWU0MsXOevr20cENxCJxlsiU05owNbhozScAd5H0x06IrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 PH7PR11MB6404.namprd11.prod.outlook.com (2603:10b6:510:1f8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Mon, 24 Jul
 2023 14:12:06 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::b9a3:5861:febd:8ecd%6]) with mapi id 15.20.6609.032; Mon, 24 Jul 2023
 14:12:06 +0000
Message-ID: <9c13175e-e06d-b760-8178-2dee68c39ddc@intel.com>
Date: Mon, 24 Jul 2023 19:41:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
References: <20230712125640.1471850-1-ravi.kumar.vodapalli@intel.com>
 <ZK6+NZUQnfZCLQj0@DUT025-TGLU.fm.intel.com>
 <mr6slrxoedm46acyb73yzx5yoyuhjbeuixh3albo5jofuuawma@uformzo3j2r5>
 <e19e20f1-637c-4660-ee24-bfa714e89d17@intel.com>
 <kdwwfs57uc4i2fwttajp4mybarsdpiq6hvy257ga2dp47r7h3w@vmazxnk62wau>
 <77460a29-28fe-b4cb-0b20-508736309e3f@intel.com>
 <svog2amaxebhhqiqerynvqb7awjrkj2wtdj4uabmrd6u52wkjn@o6yixkupe74e>
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <svog2amaxebhhqiqerynvqb7awjrkj2wtdj4uabmrd6u52wkjn@o6yixkupe74e>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0139.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::9) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|PH7PR11MB6404:EE_
X-MS-Office365-Filtering-Correlation-Id: ce7d594d-c4c7-40f7-fd0b-08db8c4ff5b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4/XJo/UhkyQPGD3d6zmENs626iMCXxMOw8fuqEcgBpLqcX7iQJICVJezkLjlayKT3+ARv3eFV99RrTouJEgPxOllCyszlvjgsPE7aTSSwokkGA8jGO5mnJpONRqxcs8/+Zgf/z4BMvE5f/ox5FOWXZyHYnce79UjPtZSmBGsSF7ZmGRsYIQkHV2G8qVoi2y7T0tY6z7kQgyUx6xXM23SU6TQCRg5nrzxaopakfGlO1icdVsndt+1rcsGOROUuUy4ggCT1t+4e/Ksb1sz4/I/Rgyfbtr/mBV9Zo7hivl3PJyDCDLN+drrRMJKS5gye6x8Nmz5qUS9Iptm10Dy8O8c8DyYqoGE7a7TvhUN+fU6jrqzjG9lA4uFh+A6yqXCOGuQucychka/4oaOw/0cZ/uDClHp/fKLDtQ69adNtS4TCaRbYKyNQGA980gYu5WDBh5eErR/2HuLhiz4yeE3rOdLsw2/iHnKiqASZIsCRJoNv57yM+rOyskqsRIwhdWZxW4N4ajk2pw8opOskz8oFQxClB4dUBeTKIFDMRq2+x0gsC1zcmaGAZPj6moBfq5YLq2GTJJ52vQ2lFFCiE4Cemds/gwZfYkgsSJA6E9VS0B7K3a55VcSl42Bxo5svs1v3nE/hEHWSYGdmVeKVTqof6vVmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(31686004)(31696002)(86362001)(82960400001)(38100700002)(83380400001)(36756003)(2906002)(8936002)(8676002)(478600001)(2616005)(5660300002)(6666004)(6486002)(6512007)(26005)(6506007)(186003)(53546011)(6862004)(37006003)(316002)(4326008)(6636002)(41300700001)(66476007)(66556008)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2FQMGo3UGcwSWl0NE15RDBJL2JMZGpTeE5NVkVUSUJ1Z24yTklmVTc1bzhP?=
 =?utf-8?B?Q2xSOFVhSUdhNVhEWG5SaHRJbnlFQUVRWDhqOW1LQ1ZwZnF3QW9seWZTZE1p?=
 =?utf-8?B?cU9hcVNrRjFSeE9KZ0FidEo2aGFjWTJJcUg3a0ZhdXdUQ3E3aFFFWkZmekZm?=
 =?utf-8?B?RitLc0xJYmZRYTlIcjRrN1Nla2pDMVJ5WTU5emlENGhIMURpQ0tpRXNCOEo3?=
 =?utf-8?B?NmFvb2J6amZJeHB5dStnQlFvWUZIVEllSkFzRGplWmltZUtqVjZQdlNyeUZU?=
 =?utf-8?B?cjllTXpRL1h6ZDV6R3l1dkZoUkczRzJXcDdjWlN6M01TZ1FsNm11VnB6eS9D?=
 =?utf-8?B?c2hPcjh3NDVXVUt1VldHN3FDaEF2TitNV1BIY3BLYVlMMnZkU2ZhRCsveWJU?=
 =?utf-8?B?akZoWUVnekY5WWtJTUVxZWlRS2xqNzFwRmRHN2tFVEhxT1FGejZHd3NBMEVi?=
 =?utf-8?B?SlFBemZnWmJwcVVqNHNhQi84bnZ1VnczRi9XbllJMm9QdjAxSm5nZkRJN2Zm?=
 =?utf-8?B?bmJGcDA3YVViYWwvbklBYW0zdm1XdkVmTXE0QXB2VCtNbEtpQm9ZdWZzQUFt?=
 =?utf-8?B?c2tqQmpZcmZZSjZVZVJDazdDVHh4Uk16N2lmVGJIKzZCUjVTRjBZRU9WRm94?=
 =?utf-8?B?dDdTMlNyVGhvRWpDZWVvQXo3dXpINDZzdUpueWEwc09jd2RDSG5jazQxRGVI?=
 =?utf-8?B?K21rOW9MT3pCNTNQcVFlcnBlVUpIbGlWZ2IwK1hvNmZ3Wm5leEp0NEJaRmk5?=
 =?utf-8?B?Q3BzNmNKenMyOTdabDUwbVVJbVVremFXRDNqYTZkeVNjd1Zudm9DT1R1RnNJ?=
 =?utf-8?B?WXQwUWdZMkx6eUFmWU03QVQ3cTlrR0ZVbjZsM0JIWEVVaFlYd0JaakFVczN0?=
 =?utf-8?B?WGFHV2JHYjF3TTZQdVMwbmQ3Qmh0Y0UyNmw3WnZQQ0lPMEJGQWx1T3VxLzVB?=
 =?utf-8?B?c1JxRk4wTGRyTERHelpSN0N1RTBZRHgyUHVEUkt1MmFXMjlFQ2Z2bVpaamZT?=
 =?utf-8?B?M2lGZ1d3d2RyZ0owTmFQR0RFVElXTGRLMkxsdGJTczYyTzFwbFF2b1llZUFQ?=
 =?utf-8?B?STBHRXZRN1BYM0p1Q0ljTFF2U1J4cFdjRGYwdnBuczBBeDA5Nkt4L1ZLaE5L?=
 =?utf-8?B?SCtZVE5wSTdxNy9nMkRBazRBNkdYcnlWODVNYm1ZbDhyT1lTbG5GKzZaRGxv?=
 =?utf-8?B?NmhlKzhUY3FTbVh0NlQxWCtYMTIxQzl1SllSUzdrZmdURVZOZ3RTUk5CUWhF?=
 =?utf-8?B?b2dVV3JGZUowdzlQVnhZWjFidk5pS2JXbXFqSXMzbGZpRWh2UHhNamM2Ukkx?=
 =?utf-8?B?SVlaUklNalZ3TmRMdk8zRWRMbWZ6Z1dWblh1RWZQdTZPZ0w5WVVwTW5SV3Er?=
 =?utf-8?B?NFcxNzNIZzUxbDViK09jSXJJR1BHU2wyY290SVY2eUVkdnVId015bkJCWVJ1?=
 =?utf-8?B?bU44czJyTEI3U2JvR29GQitScVJlSnRaRkREYnBITnRscXBScElTR3NwSDFZ?=
 =?utf-8?B?V2dEb1h1UWJpUHdiOUdEQThQWE1Yem55cXNVS2NKRzlJTVJTZGdJMEpSbG1y?=
 =?utf-8?B?Ly8vSDJIdk9tTFA3RnBPSTlreC83bDFTYzlocnJRY3EyNDhFYUxvVEc0cVgx?=
 =?utf-8?B?SGtuaExmeTlkSXdIYkdGbzRFNUY4NjdaaUhkL0gyazl4WWVCVnN4OXFZOHBV?=
 =?utf-8?B?WFZlUENieGZ6QjNDcUYzb2dLZnpqVkVjK2VzSk1nMWhRTGlVUVJnVzBVVlFV?=
 =?utf-8?B?TGRyWVMvRWI3aVFSc21SVmtkK05kdEhOaFZIeEw3ZlpTR1BadkhpYWJHbXpY?=
 =?utf-8?B?L3grNEhHZzdEelUvL0lpWUJTZjhGL0V6QzJCa3V1NGpnOTBQdWhQbTRlemtN?=
 =?utf-8?B?Ti9wZURmVTlSTTJCU1dLS2tQUERUUVVZcEpRdllQWFh1ZU4wRDBKN3cySm82?=
 =?utf-8?B?ejBaZ04zSStpd1E5V3pRTFdTY0E5TUFyNHU2elJMbmVMUU8wdUsrZVJVZUYx?=
 =?utf-8?B?VnlJUUJCVDU5TE9aYnJBVFFlT3l6NDBKaHp3akFiLzZtYm90bmdGakFva2Ur?=
 =?utf-8?B?L3BEYUV6bGE0UEdWVGl0czVVNjJtR1RaVnlhS1NPT3RyRnA5NnNacFBRNlRu?=
 =?utf-8?B?bHRYNWpYamFpTlY0MVZMTGU5VHVwejRNVXRYWkw1alVQNUNIaGVtZVVBUXV0?=
 =?utf-8?Q?6/LHW9h5ptlGFF/Gb7FJVo8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ce7d594d-c4c7-40f7-fd0b-08db8c4ff5b2
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2023 14:12:05.9596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8s/Rw0aQw4G/L11jbjoqZiYRWiJLJfMKHzRgr3ju2Kvd2WB8xiahFpNRC7PaF7TKJ8yHewxXKOOHiR547XZ7JgyAOwW6i698nVCWeUmmPHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6404
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/ppgtt: Add support for correct PAT
 encoding in Page Table Entry (PTE) format
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/21/2023 11:42 PM, Lucas De Marchi wrote:
> On Fri, Jul 21, 2023 at 10:21:31PM +0530, Vodapalli, Ravi Kumar wrote:
>>
>>
>> On 7/21/2023 9:43 PM, Lucas De Marchi wrote:
>>> On Thu, Jul 20, 2023 at 07:48:33PM +0530, Vodapalli, Ravi Kumar wrote:
>>>>
>>>>
>>>> On 7/17/2023 6:53 PM, Lucas De Marchi wrote:
>>>>> On Wed, Jul 12, 2023 at 02:52:37PM +0000, Matthew Brost wrote:
>>>>>> On Wed, Jul 12, 2023 at 06:26:40PM +0530, Ravi Kumar Vodapalli 
>>>>>> wrote:
>>>>>>> Different platforms has different PAT encoding in PTE format, add
>>>>>>> correct PAT encoding for pre-Xe2 platforms (XELP, XEHPC, XELPG).
>>>>>>>
>>>>>>> Bspec: 45101, 71582
>>>>>>> Signed-off-by: Ravi Kumar Vodapalli 
>>>>>>> <ravi.kumar.vodapalli@intel.com>
>>>>>>> ---
>>>>>>>  drivers/gpu/drm/xe/xe_pt.c       | 110 
>>>>>>> +++++++++++++++++++++++++++----
>>>>>>>  drivers/gpu/drm/xe/xe_pte.h      |  31 +++++++++
>>>>>>>  drivers/gpu/drm/xe/xe_vm_types.h |   1 +
>>>>>>>  3 files changed, 129 insertions(+), 13 deletions(-)
>>>>>>>  create mode 100644 drivers/gpu/drm/xe/xe_pte.h
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pt.c 
>>>>>>> b/drivers/gpu/drm/xe/xe_pt.c
>>>>>>> index 00855681c0d5..e7f8bd4dd518 100644
>>>>>>> --- a/drivers/gpu/drm/xe/xe_pt.c
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pt.c
>>>>>>> @@ -16,6 +16,7 @@
>>>>>>>  #include "xe_trace.h"
>>>>>>>  #include "xe_ttm_stolen_mgr.h"
>>>>>>>  #include "xe_vm.h"
>>>>>>> +#include "xe_pte.h"
>>>>>>>
>>>>>>>  struct xe_pt_dir {
>>>>>>>      struct xe_pt pt;
>>>>>>> @@ -111,19 +112,7 @@ static u64 __pte_encode(u64 pte, enum 
>>>>>>> xe_cache_level cache,
>>>>>>>      if (unlikely(vma && xe_vma_is_null(vma)))
>>>>>>>          pte |= XE_PTE_NULL;
>>>>>>>
>>>>>>> -    /* FIXME: I don't think the PPAT handling is correct for 
>>>>>>> MTL */
>>>>>>> -
>>>>>>> -    switch (cache) {
>>>>>>> -    case XE_CACHE_NONE:
>>>>>>> -        pte |= PPAT_UNCACHED;
>>>>>>> -        break;
>>>>>>> -    case XE_CACHE_WT:
>>>>>>> -        pte |= PPAT_DISPLAY_ELLC;
>>>>>>> -        break;
>>>>>>> -    default:
>>>>>>> -        pte |= PPAT_CACHED;
>>>>>>> -        break;
>>>>>>> -    }
>>>>>>> +    pte = xe_vma_vm(vma)->pte_encode(pte, cache);
>>>>>>>
>>>>>>>      if (pt_level == 1)
>>>>>>>          pte |= XE_PDE_PS_2M;
>>>>>>> @@ -187,6 +176,94 @@ static u64 __xe_pt_empty_pte(struct xe_tile 
>>>>>>> *tile, struct xe_vm *vm,
>>>>>>>      }
>>>>>>>  }
>>>>>>>
>>>>>>> +static u64 xelp_pte_encode_pat(u8 pat_index)
>>>>>>> +{
>>>>>>> +    u64 pte_pat = 0;
>>>>>>> +
>>>>>>> +    if (pat_index & BIT(0))
>>>>>>> +        pte_pat |= BIT(3);
>>>>>>> +
>>>>>>> +    if (pat_index & BIT(1))
>>>>>>> +        pte_pat |= BIT(4);
>>>>>>> +
>>>>>>> +    if (pat_index & BIT(2))
>>>>>>> +        pte_pat |= BIT(7);
>>>>>>> +
>>>>>>> +    return pte_pat;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static u64 __xelp_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>> +{
>>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>>> +
>>>>>>> +    switch (cache) {
>>>>>>> +    case XE_CACHE_NONE:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_UNCACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WT:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WT_CACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WB:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELP_PAT_WB_CACHE);
>>>>>>> +        break;
>>>>>>> +    default:
>>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return pte;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static u64 __xehpc_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>> +{
>>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>>> +
>>>>>>> +    /* Initially assumed as CLOS0.
>>>>>>> +     * To Do: CLOS1/CLOS2 has to be set depending on requirement
>>>>>>> +     */
>>>>>>> +    switch (cache) {
>>>>>>> +    case XE_CACHE_NONE:
>>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_UNCACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WT:
>>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WT_CACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WB:
>>>>>>> +        pte |= xelp_pte_encode_pat(XEHPC_PAT_CLOS0_WB_CACHE);
>>>>>>> +        break;
>>>>>>> +    default:
>>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return pte;
>>>>>>> +}
>>>>>>> +
>>>>>>> +static u64 __xelpg_pte_encode(u64 pte, enum xe_cache_level cache)
>>>>>>> +{
>>>>>>> +    pte &= ~XELP_PAT_MASK;
>>>>>>> +
>>>>>>> +    /* Initially assumed as Non cohorent mode, correct values
>>>>>>> +     * has to be set depending on requirement.
>>>>>>> +     */
>>>>>>> +    switch (cache) {
>>>>>>> +    case XE_CACHE_NONE:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_UNCACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WT:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WT_CACHE);
>>>>>>> +        break;
>>>>>>> +    case XE_CACHE_WB:
>>>>>>> +        pte |= xelp_pte_encode_pat(XELPG_PAT_WB_CACHE);
>>>>>>> +        break;
>>>>>>> +    default:
>>>>>>> +        /* pte |= PPAT_CACHED; */
>>>>>>> +        break;
>>>>>>> +    }
>>>>>>> +
>>>>>>> +    return pte;
>>>>>>> +}
>>>>>>> +
>>>>>>>  /**
>>>>>>>   * xe_pt_create() - Create a page-table.
>>>>>>>   * @vm: The vm to create for.
>>>>>>> @@ -216,6 +293,13 @@ struct xe_pt *xe_pt_create(struct xe_vm 
>>>>>>> *vm, struct xe_tile *tile,
>>>>>>>      if (!pt)
>>>>>>>          return ERR_PTR(-ENOMEM);
>>>>>>>
>>>>>>> +    if (GRAPHICS_VERx100(vm->xe) >= 1270)
>>>>>>> +        vm->pte_encode = __xelpg_pte_encode;
>>>>>>> +    else if (GRAPHICS_VERx100(vm->xe) >= 1260)
>>>>>>> +        vm->pte_encode = __xehpc_pte_encode;
>>>>>>> +    else
>>>>>>> +        vm->pte_encode = __xelp_pte_encode;
>>>>>>> +
>>>>>>>      bo = xe_bo_create_pin_map(vm->xe, tile, vm, SZ_4K,
>>>>>>>                    ttm_bo_type_kernel,
>>>>>>>                    XE_BO_CREATE_VRAM_IF_DGFX(tile) |
>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_pte.h 
>>>>>>> b/drivers/gpu/drm/xe/xe_pte.h
>>>>>>> new file mode 100644
>>>>>>> index 000000000000..8b3b5b471a99
>>>>>>> --- /dev/null
>>>>>>> +++ b/drivers/gpu/drm/xe/xe_pte.h
>>>>>>
>>>>>> s/xe_pte.h/xe_pte_pat.h
>>>>>>
>>>>>> Just my option prefer this.
>>>>>
>>>>> dunno, but since we have different pte formats for ggtt and ppgtt, 
>>>>> IMO
>>>>> it would add to the confusion.
>>>>>
>>>>> Maybe this belongs in xe_pat.h since it's xe_pat.c that programs the
>>>>> tables giving the meaning spelled out in the macros here for each 
>>>>> index.
>>>>> The rest of the code then need to set the bits in the PTE to 
>>>>> reference
>>>>> those indexes, according to the PTE format.
>>>>>
>>>>>>
>>>>>>> @@ -0,0 +1,31 @@
>>>>>>> +/* SPDX-License-Identifier: MIT */
>>>>>>> +/*
>>>>>>> + * Copyright © 2021 Intel Corporation
>>>>>>> + */
>>>>>>> +
>>>>>>> +#ifndef _XE_PTE_H_
>>>>>>> +#define _XE_PTE_H_
>>>>>>> +
>>>>>>> +#define XELP_PAT_MASK                  BIT_ULL(7) | BIT_ULL(4) 
>>>>>>> | BIT_ULL(3)
>>>>>>> +#define XELP_PAT_WB_CACHE              0
>>>>>>> +#define XELP_PAT_WC_CACHE              1
>>>>>>> +#define XELP_PAT_WT_CACHE              2
>>>>>>> +#define XELP_PAT_UNCACHE               3
>>>>>
>>>>> example... this duplicates what we have in xe_pat.c (comment added 
>>>>> here
>>>>> for clarity)
>>>>>
>>>>> static const u32 tgl_pat_table[] = {
>>>>>         [0] = TGL_PAT_WB,
>>>>>         [1] = TGL_PAT_WC,
>>>>>         [2] = TGL_PAT_WT,
>>>>>         [3] = TGL_PAT_UC,
>>>>>     // .... those are programmed, but not expected to be used
>>>>>         [4] = TGL_PAT_WB,
>>>>>         [5] = TGL_PAT_WB,
>>>>>         [6] = TGL_PAT_WB,
>>>>>         [7] = TGL_PAT_WB,
>>>>> };
>>>>>
>>>>
>>>> TGL_PAT_WB maps to PAT table register bit mapping, we cannot 
>>>> directly use tgl_pat_table to get PAT index rather we
>>>> need to implement code to retrieve the index like below instead we 
>>>> can use macro directly.
>>>>
>>>> xelp_pte_encode_pat(u8 cache_type) //example pass TGL_PAT_WB
>>>> {
>>>>     u8 index;
>>>>     for (i=0, i < 32, i++)
>>>>         if (tgl_pat_table[i] == cache_type)
>>>
>>> no, we don't want the caller to pass the platform-specific value.
>>> It should pass a platfrom-agnostic value and xe_pat_get_index()
>>> translates that to the platform-specific index. There are just 2 
>>> entries
>>> really used by the kernel: uc and wb. Then the xe_pat.c returns what is
>>> the entry to be used in those cases.
>>>
>>> Lucas De Marchi
>>>
>>
>> I have discussed Regarding encoding the index into pat pte with 
>> Matt,Roper
>> He said instead of writing common function for both ppgtt and ggtt, 
>> the best approach would be as below so that in future adding more 
>> support will be easier
>>
>> static u64 xelp_pte_encode_pat(u8 pat_index)
>> {
>>     u64 pte_pat = 0;
>>
>>     if (pat_index & BIT(0))
>>         pte_pat |= BIT(3);
>>
>>     if (pat_index & BIT(1))
>>         pte_pat |= BIT(4);
>>
>>     if (pat_index & BIT(2))
>>         pte_pat |= BIT(7);
>>
>>     return pte_pat;
>> }
>
> that is fine. My point is that selecting the *index* and the encoding
> are 2 different things. Here it's only doing a index -> pte, which is
> fine: there will be one for ppgtt and another for ggtt. However gettting
> the platform-specific index is shared. Check again the snippet I shared
> previously:
>
>     // this is valid for both ppgtt and ggtt
>     pat = xe_pat_get_index(xe, cache);
>

     For a cache type, index differs from platform to platform, we will 
need to add more if conditions for adding a new platform like below sudo 
code, we need to re think on it

     xe_pat_get_index(xe, cache)
{
     if (GRAPHICS_VERx100(xe) >= 1270)
     {
                 switch (cache) {
                 case XE_CACHE_NONE:
                         return 3;
                 case XE_CACHE_WT:
                         return 2;
                 case XE_CACHE_WB:
                         return 0;
                 }
       }
       else if (GRAPHICS_VERx100(xe) >= 1260)
      {
                 switch (cache) {
                 case XE_CACHE_NONE:
                         return 0;
                 case XE_CACHE_WT:
                         return 2;
                 case XE_CACHE_WB:
                         return 3;
                 }
         }
         else if (new platform)
         {
         }
     }


>     // this changes between ggtt / ppgtt
>     pte |= vm->pte_encode_pat(xe, pat);
>
>
> pte_encode_pat() is the hook set during init to xelp_pte_encode_pat(),
> for this platform.  The index  however is obtained in the call above.
>
> Lucas De Marchi

