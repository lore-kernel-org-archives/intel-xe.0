Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D13FC4167B
	for <intel-xe@archiver.kernel.org>; Mon, 11 Dec 2023 11:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCD710E09B;
	Mon, 11 Dec 2023 11:42:00 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7073C10E09B
 for <intel-xe@lists.freedesktop.org>; Mon, 11 Dec 2023 11:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702294918; x=1733830918;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=z0oyMJUwzO4JKssV7VpGq4qSLw1MLcCme7IPIJL6Sm0=;
 b=RFAw4qOgGyIr5LOacQ1Fe05C+t6IMs9EpSZrjZCLBXfJTMHy2ZXg+hlv
 /thpD6LJyE7EycXmtMNVkC9RWlZOiRrpZDXjkd/WhSn0ecGM58z9yfsjy
 oXiPR9QVLvqA4Uf9ihOFgVdvqQXZ4ijYPN3iF7OgONzKwLJ9U128ag7cx
 /RdUPpaQIPbm+0K6cKnv4l434uq5zbzxtc6v73ABbELSafKl5Ik/YvP/O
 eHbgp/6JqO002QPRQdqEBJqfXdWdi73tSMB7CPCg9uCxYP6QbgHtlvydf
 VkcSMwdCpBbxtMR8NlewuHWcp4eZJtDr4fQ3LiNLQBWCzaVBtw2dHHRfe w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1474530"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1474530"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 03:41:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="843479951"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="843479951"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 11 Dec 2023 03:41:55 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 11 Dec 2023 03:41:55 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 11 Dec 2023 03:41:55 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 11 Dec 2023 03:41:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RzOpscpzEh6hjGIG4EzsDR7wSWG3hgMEDXpO3Vk8YLHkIE2sGIURi0JhwRCHpTaHAActOr/PNvstG0XySlgidCDMT3vdh7zxSv5domlH1CNouEmfYSdkWgfJwXXqPU6KQbIM8RlYeGsct+8jvGW63AVkbj1n7ZrhWD9RtCQ2BXYYkxETZWrSV6P6kzanot+k3q6xcLSX3aRZDVVKHmFoRMp+6/T6jwFz9MQZhe7R16UQBMOlQ/7TofAF/02llpSWokMHzqjxtAhNxNxBYgaHm/julMKSkIaYeq7nRnh8CAvbK8omzvXwyq7CKFWl9hubIgSSwYj096PlWcMNCVLtGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+IrvAaUPGXF8Y4QA7pcWG+PM/HaV1j6aptR5GXU8JSk=;
 b=SzpF1uVKtiYE9MgtKygiPaJey1sSSU/5f6S5Iu/wlS9HTNkLjxq5sHY/y20BlzfuG/xZEd0n6sXTsuTqTgFrd33dcQsK0DgWKaGmIS9608q2xGjLMsaNpBx1nJDesabWjuTV9MpCTHGQ/YrzkjupP+U5W4b1PNXih4HjdB6/qGxF/bFN1DcK/XbWgIUTWLXb0kVs58ROuJDZ7wOU45GNPbSv1CXjf27GqqHeTa+qOns1Zul5eWiZGFuDcA3hUBVC7g8exZnP21tgJM6EQXqEcsjwWpcPOVVN6w1iklXvx7wgy3S6Z4XY+lJQSohAYkAY4AdO76ht0gtxDAYGPXzW2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA2PR11MB4858.namprd11.prod.outlook.com (2603:10b6:806:f9::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7068.32; Mon, 11 Dec 2023 11:41:52 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.031; Mon, 11 Dec 2023
 11:41:51 +0000
Message-ID: <e6dd8a8a-98c7-4dda-8e9b-47f87ac01887@intel.com>
Date: Mon, 11 Dec 2023 17:11:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, "Upadhyay, Tejas"
 <tejas.upadhyay@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20231207151739.1241374-1-sujaritha.sundaresan@intel.com>
 <20231207151739.1241374-2-sujaritha.sundaresan@intel.com>
 <SJ1PR11MB6204399019B23285D88A04B1818AA@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <692a9b93-dfba-43b9-a838-9e4cd20fa093@intel.com>
 <cb403e6c-cca5-4495-b1d1-57b38fffdaab@intel.com>
 <16f7e629-98da-456c-9506-27448c8246fe@intel.com>
 <DS7PR11MB61976F9270AF44005B1DD97E818FA@DS7PR11MB6197.namprd11.prod.outlook.com>
 <4f61addc-ce03-4ff9-a82e-bd6294893e3a@intel.com>
 <34645f28-31dd-4d1d-9839-c2b149813d1b@intel.com>
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <34645f28-31dd-4d1d-9839-c2b149813d1b@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0097.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9b::16) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|SA2PR11MB4858:EE_
X-MS-Office365-Filtering-Correlation-Id: c00dd349-a7a8-4f4d-21e9-08dbfa3e2ac6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: STG7TOCYXlfj7h5ztIfsaJDoYU8caqeHp20eC15qaLOD4V/1+DDQnQIb5M0Y1nvUHpTqXqOWrpywW7mnjx+FF8TY5QfsCsU0ete82C/MnX/PsMAoca3jX5UqtbMqvisCftCVAjDOsj+ydiJTAaSnUI6KnO1Ashy7O4vUqBDBk3r+DwXu7Tyd5Lz9eP8Vlj/o+qY4D5N+3ayuSZH99XG4Pe0b5Hw0L5nzO4dPD26vFjvtX0DNGWdbQuMSXuUzcRMBA4vrfBkpAf3XVclNHUFclghpBUqbu7wNlV6uu3gm/VpYjnchsDpegR97zWa8elHrm1jT7tPUKdzvtBXdHB3bo5FRWZOLIDWod4XcWxBeoYWzKpJDtYZcSj1/+V9c7uz/9jFuay4F1Hjas9yTidPNspKzv2k6dey+ggFvWc9dZEAUypYN3hI1vzjvhMN6hGWgLTPuArN375rAh87+zRIGkzbi8E8hDIN9ddVWGhlUmfmnfsro3Wr3oKMiJe/bOP3XEosnj/XEI5p2Jbq6HoRpjtpSz3INwAWfvIVHNZzM6OaKn8F436Dz4ctX4dVPveo1IOcMLkXjE15takz1G1Mm0GSbp6ewuMucZyM3jWpOM2bcHWZxyB4kTVgf9dGFoAz5eBYWNCWhmguGuxrNUZNEVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(376002)(396003)(136003)(366004)(230922051799003)(186009)(1800799012)(64100799003)(451199024)(2906002)(41300700001)(38100700002)(31696002)(110136005)(36756003)(86362001)(82960400001)(2616005)(6512007)(26005)(6666004)(478600001)(53546011)(6486002)(6506007)(83380400001)(5660300002)(316002)(66556008)(66476007)(66946007)(8676002)(8936002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0E0b09JWjJtZm9pMk9tbUEwRWhZRi9HeVEwMmxPNGRGTlYvWkZyWVBBOUVh?=
 =?utf-8?B?MU5QME9mUFcyYXNzdXRCWVJaWE5IY2YvVnpobXJLS1FURklGbGJQT1lSaEFL?=
 =?utf-8?B?c3lzL2FPa0puZUFHNkQ3VXlLU1ozNTNXemlBTDF1cEJKSEgwNGpZeDAyMEd0?=
 =?utf-8?B?bkw4QTBoanNRVDF0VGtya3FSSjJsOVk4djUveVVOWnIrditTOEoxcEdQQk9r?=
 =?utf-8?B?dGE0VnFlamM3RVhiQVhWeTlPQzZXcEl4NTlhclcxSWxoOU0zUGhEUS9xQmRu?=
 =?utf-8?B?QWRrOXU4SkZuK0FOMDk4V0NlWE90V3VGVFY0M096bDNmbHNFU0hiQURNcDdY?=
 =?utf-8?B?enRyYzZ0MjlNVVlkL1U3N0Q2bXhHVTZtblFwSWVEbmRxb1lnaXQvNlFpYUU1?=
 =?utf-8?B?dEh4U2ROMXJRcjVnK2s3djlPNGV0Z1JUYTlTSnV6Z1hTVG54Q0RuUExBeFNO?=
 =?utf-8?B?UzgrMSswenl3a2dTaUZaRnZFNE5oWVRmaUY5QXdKZ0dRSU1DeFZmSVdzV05X?=
 =?utf-8?B?U0RnejJsNUVCSmNFa3A5MG5uM2x2Z20yaS8zbGtqb0pnbTRTS2pNQkFyTmt5?=
 =?utf-8?B?SnV4RmsrZ2FFRWFNa1EwNWVVc0ZhWjgvdVAxTzJGMTRsUjBab1V2MTVwdGVG?=
 =?utf-8?B?V1pWYytwUXd3bmRMbEJYaXV0SU5xLytVMmZ5NDBDTGRneHg3RkcwZmhweW9i?=
 =?utf-8?B?RkRHcEkwVjQ2V3ZYNWNzN2R3VjlRbUY2UEt4Wmc2TVNyYVB2TnRVTysvWFBh?=
 =?utf-8?B?ZjJqOFZucFB0cXRiczdFTURMcXVEVnBQNU9jVHpFTStpdmlhQURXUFp2TjJD?=
 =?utf-8?B?T05mMm9QNU5LSWkycDdJdU9NcXBlc24weUt4ek5EYk9PSzVBNXRaOGdWL2V2?=
 =?utf-8?B?UGhtQWU0SXI2dnFNZy9VR1BsZ3hiMko5aE9WZklBNDRkeUh3RUE0WTZCMW16?=
 =?utf-8?B?SHBQRDVLQklFTXpRQ3NkSk9kb2JhYUFSSkdZaWtGbGxqdVh1T2ZyWXlxWnJp?=
 =?utf-8?B?OFNTdG9uWUwyeHZLWHhidk8yYjNZVlp2K0lTR2Z4cHdrUjZ4S1QyeXQvOVo1?=
 =?utf-8?B?U2dteFo0Q1V1U0RIVDA3NDFGTkRlZmVONXRHYk9GdGE2Nk1OZkxhZlNGU3NO?=
 =?utf-8?B?STkzRzNxc0xxNzY3TFh2Umxva3FabWgzMUVTd0Z6K1pxZjA3aDBreUN3TUtP?=
 =?utf-8?B?c2RzQjN0L1dHS2Rhb1A2OGl2VEdGS0R6ekdqT1I0SFhUNldVZ3Izb1FSbCtz?=
 =?utf-8?B?b2t3N3RTZDFSMDUwbUJLVnUwdGgybko4bGFzdDZyMnhLSXd5TlNrV0YyVGtP?=
 =?utf-8?B?bmh6SXZqd2ZNUkkyMjgyY293QTRBbkh3U2V2TzkvN3BjMWk4UkNiTmg1NTFr?=
 =?utf-8?B?UjUzRHJ0OUV0aEpnc0lmRExOaDdVU1FqZ0l0TjF3MEgxUCs0RjcwZ2VlbHBr?=
 =?utf-8?B?WXhQcWtEUG5FcE5NOG9MY216RjRMQ1VDTnBxWVlPVkZPNVFpb2JGSUg0U1kv?=
 =?utf-8?B?WFFXd2IveW11Y3drMVpYZVE3YjBBdTJrQkV4WWF2YituNUMxalNKcDQvWHFS?=
 =?utf-8?B?bFB1dGpxemNTdWVUeEZvRjJRQ283azAvR1ZqMGY1bmo4Z1hBVDRsdGE2bFN3?=
 =?utf-8?B?MGxZUXZYTHJZUng1YjB3U24wSUpNSzhyYklQRHVuYXRhYytMN0dlOVBsNHg3?=
 =?utf-8?B?czJlUmphemVHWFRaSzMxaTB2WEtvSEJyWGtwUlRMa1JnMlQ3M2NRRFAzU1oy?=
 =?utf-8?B?K25WdlBsNG1teG81UXlkVnlWL3I1S3JMQ1pybVVnK3VxMWgxdlN4MlBxT2Vn?=
 =?utf-8?B?eGJUREdBVDJ1WnNBU203YmU2bFRxWi9NM2szUDhSVGtEbmxUbU4yVlBDejRW?=
 =?utf-8?B?RGhiSUlJcUZQaXhSVlVPdXFWVWIyd3Y2L3dKM2pRdFFUcjI1dlpPMXZUOVBY?=
 =?utf-8?B?b3FIZ01VYkprbXZTbXVsWHd1RUZxRGdwM3ZvMnY3elE3MzRPSENYWi9oVVdH?=
 =?utf-8?B?bnE1LzFhTnJ1VEFLNFRNY2lMem9Ed01NUWYxV0dodTVOWVNTazQyNTVaa1Fq?=
 =?utf-8?B?UmhEWHJtWmZGckJvNVRNM0pSb1NNbitDcHFZZDVkSUQzajFMdE15bUJYbDkw?=
 =?utf-8?B?c2QzVytTMWtyZVBpaC9KbElGZk42K0w2V0NvYnFrQjY5Y3Z1ZzdNU0VJT0o1?=
 =?utf-8?B?THc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c00dd349-a7a8-4f4d-21e9-08dbfa3e2ac6
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2023 11:41:51.8739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zdgtDxqqPNyRmkctU57cA7xfrHABZcHu1IO9brRckBJVMd8/wbkxfe324jnvAaAUgjoOZRT/Oq5ux8qvYQpCfOs+yDjTfu06hwxzMA5lvNQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4858
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


On 12/11/2023 4:43 PM, Riana Tauro wrote:
>
>
> On 12/11/2023 4:37 PM, Riana Tauro wrote:
>> Hi Suja
>>
>> On 12/11/2023 4:31 PM, Upadhyay, Tejas wrote:
>>>
>>>
>>>> -----Original Message-----
>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>> Sent: Monday, December 11, 2023 3:45 PM
>>>> To: Tauro, Riana <riana.tauro@intel.com>; Upadhyay, Tejas
>>>> <tejas.upadhyay@intel.com>; intel-xe@lists.freedesktop.org
>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>
>>>> Subject: Re: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>>
>>>>
>>>> On 12/11/2023 3:23 PM, Riana Tauro wrote:
>>>>> Hi Suja
>>>>>
>>>>> On 12/8/2023 1:58 PM, Sundaresan, Sujaritha wrote:
>>>>>>
>>>>>> On 12/8/2023 10:33 AM, Upadhyay, Tejas wrote:
>>>>>>>
>>>>>>>> -----Original Message-----
>>>>>>>> From: Sundaresan, Sujaritha <sujaritha.sundaresan@intel.com>
>>>>>>>> Sent: Thursday, December 7, 2023 8:48 PM
>>>>>>>> To: intel-xe@lists.freedesktop.org
>>>>>>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; Tauro, Riana
>>>>>>>> <riana.tauro@intel.com>; Gupta, Anshuman
>>>>>>>> <anshuman.gupta@intel.com>; Sundaresan, Sujaritha
>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>> Subject: [v3 1/2] drm/xe: Add a new memory directory under tile
>>>>>>>>
>>>>>>>> Add a new memory directory under /device/tile<n> and move
>>>>>>>> physical_vram_size attribute to the new directory.
>>>>>>>>
>>>>>>>> New hierarchy:
>>>>>>>>
>>>>>>>> /device/tile<n>/memory/physical_vram_size_bytes
>>>>>>>>
>>>>>>>> v2: Fix heading typo (Riana)
>>>>>>>>       Fix cleanup error on unload/reload cycle
>>>>>>>>
>>>>>>>> v3: Fix reload error with kobject_put in place
>>>>>>>>       of kobject_del (Tejas)
>>>>>>>>
>>>>>>>> Signed-off-by: Sujaritha Sundaresan
>>>>>>>> <sujaritha.sundaresan@intel.com>
>>>>>>>> ---
>>>>>>>>    drivers/gpu/drm/xe/xe_tile_sysfs.c | 19 ++++++++++++++-----
>>>>>>>>    1 file changed, 14 insertions(+), 5 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> index 16376607c68f..64be1f3a38a9 100644
>>>>>>>> --- a/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> +++ b/drivers/gpu/drm/xe/xe_tile_sysfs.c
>>>>>>>> @@ -24,7 +24,8 @@ static ssize_t
>>>>>>>>    physical_vram_size_bytes_show(struct device *kdev, struct
>>>>>>>> device_attribute *attr,
>>>>>>>>                      char *buf)
>>>>>>>>    {
>>>>>>>> -    struct xe_tile *tile = kobj_to_tile(&kdev->kobj);
>>>>>>>> +    struct kobject *kobj = &kdev->kobj;
>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>>>>>>> As Christmas is approaching, you might want to adjust this in
>>>>>>> Christmas tree order.
>>>>>>>
>>>>>>>>        return sysfs_emit(buf, "%llu\n",
>>>>>>>> tile->mem.vram.actual_physical_size);
>>>>>>>>    }
>>>>>>>> @@ -36,8 +37,10 @@ static const struct attribute
>>>>>>>> *physical_memsize_attr =
>>>>>>>>
>>>>>>>>    static void tile_sysfs_fini(struct drm_device *drm, void 
>>>>>>>> *arg)  {
>>>>>>>> -    struct xe_tile *tile = arg;
>>>>>>>> +    struct kobject *kobj = arg;
>>>>>>>> +    struct xe_tile *tile = kobj_to_tile(kobj->parent);
>> Also, check if kobj is not null before conversion. As we are 
>> continuing with init even if kobj creation fails
>>>>>>> Ditto
>>>>>>>
>>>>>>>> +    kobject_put(kobj);
>>>>>>>>        kobject_put(tile->sysfs);
>>>>>>>>    }
>>>>>>>>
>>>>>>>> @@ -46,6 +49,7 @@ void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>        struct xe_device *xe = tile_to_xe(tile);
>>>>>>>>        struct device *dev = xe->drm.dev;
>>>>>>>>        struct kobj_tile *kt;
>>>>>>>> +    struct kobject *kobj;
>>>>>>>>        int err;
>>>>>>>>
>>>>>>>>        kt = kzalloc(sizeof(*kt), GFP_KERNEL); @@ -64,12 +68,17 @@
>>>>>>>> void xe_tile_sysfs_init(struct xe_tile *tile)
>>>>>>>>
>>>>>>>>        tile->sysfs = &kt->base;
>>>>>>>>
>>>>>>>> -    if (IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>>> -        sysfs_create_file(tile->sysfs, physical_memsize_attr))
>>>>>>>> +    kobj = kobject_create_and_add("memory", tile->sysfs);
>>>>>>>> +    if (!kobj) {
>>>>>>>> +        drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -
>>>>>>>> ENOMEM);
>>>>>>>> +    }
>>>>>
>>>>> There will be an empty memory directory in case of igfx. Should the
>>>>> memory directory be created only if there are attributes available?
>>>
>>> Yes I think it should be taking care of all conditions which 
>>> physical_memsize_attr sysfs file was created with.
>
> Yeah it needs to be as Tejas suggested.
> Should be under the same if

After discussions, I will have the memory directory created if DGFX and 
not DG1.

Will move the documentation for physical_memsize_attr to this patch.

But maybe changes in the cleanup need to be tested before committing to 
anything.

Not creating anything in IGFX may need more cleanup.

Thanks,

Suja

>
>>>
>>> Thanks,
>>> Tejas
>>>>>
>>>>> Thanks
>>>>> Riana
>>>>
>>>> I can have it added only if IS_DGFX if that works.
>>
>> Move the documentation of the physical_vram_size_bytes to this patch
>>
>> Thanks
>> Riana
>>>>
>>>> Thanks,
>>>>
>>>> Suja
>>>>
>>>>>>> { } is not required here.
>>>>>>>
>>>>>>> Tejas
>>>>>>
>>>>>> Will fix all of the above.
>>>>>>
>>>>>> Thanks,
>>>>>>
>>>>>> Suja
>>>>>>
>>>>>>>> +
>>>>>>>> +    if (kobj && IS_DGFX(xe) && xe->info.platform != XE_DG1 &&
>>>>>>>> +        sysfs_create_file(kobj, physical_memsize_attr))
>>>>>>>>            drm_warn(&xe->drm,
>>>>>>>>                 "Sysfs creation to read addr_range per tile
>>>>>>>> failed\n");
>>>>>>>>
>>>>>>>> -    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>>>> tile);
>>>>>>>> +    err = drmm_add_action_or_reset(&xe->drm, tile_sysfs_fini,
>>>>>>>> +kobj);
>>>>>>>>        if (err) {
>>>>>>>>            drm_warn(&xe->drm, "%s: drmm_add_action_or_reset 
>>>>>>>> failed,
>>>>>>>> err: %d\n",
>>>>>>>>                 __func__, err);
>>>>>>>> -- 
>>>>>>>> 2.25.1
