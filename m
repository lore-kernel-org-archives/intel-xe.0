Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64904EB64DD
	for <intel-xe@archiver.kernel.org>; Wed,  5 Jul 2023 11:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CD610E125;
	Wed,  5 Jul 2023 11:10:21 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1572610E125
 for <intel-xe@lists.freedesktop.org>; Wed,  5 Jul 2023 11:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688555420; x=1720091420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xeW1vAsrAYeYgyD4yhDvym/EfASC0rYh49SrSi4EkI8=;
 b=fsL3oDI8bk/VHaLbDw/WLM0l5RLp0HIj2jVirD4TGCPhDLfpyM0/odnf
 kYg3GDCOXv4RsTdAL4GqMxu+lIGCDaPtkobDCTDs7Nz4JbFo2i+8oSgvV
 yi/jZsWHOqhvhzeo6KY5bPp1aUwkPXmA6/MumLb7RGr6la7eYKLuAuCf1
 B8UpWO4WU2ZhVMOi63VmR+FM+6YyAsC7OVOGhO+qSDvnJoACWYWfZO0c0
 3cIoTg0tb4/qke+ShrCwBd6F8YSM4FG5pxuDVvJEhyyYbxSZCXosPE4H9
 D4DSjax7UJ/fa2u2cPvWSDrvEfdqh2E3bUqYN/snPEGylSEPKJIT/Gt5v g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362181346"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="362181346"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 04:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965788577"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="965788577"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2023 04:10:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 5 Jul 2023 04:10:18 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 5 Jul 2023 04:10:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 5 Jul 2023 04:10:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncn9wMyZMq0p/pktyPYYkrhT58DgoEsSIPay7Zo7+IF/Bkkcpw3W3nO67b56cL7vFQhn2RwXhaPk0xehOUD4ZNMPM/kV1LdREbztK7AMOo2KA907Ezeuej13DL5y/g9/yXmM5KgJgRmk0mAqyHvSlgkPJXHG7eF/VL1n5QZV61I1vK6OVb1yonBa8hgtTh7TG1X3Gjyv/2dulxxfNamvP/U8noPoy3xK9lWexcX2IiqF+6vAUpa6mPsW/QzHQPxlThdP6CDWUxKwz2KEtQ/0DGyTwwry6aByCHcIAIQRNMvnauVjpxSDqIOSZ5VWIaRAk8dmOEpDH06ugfnna8aoPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCTGkfn3xMG3sROAF/dYNSCZzw2IDepA2N8OrKEFPjw=;
 b=WRDTfXiIc1PKf1WV/ZleSQqQ9F7FKtxI6jTXm0TTskrLU+pdTVKGJFwmE3uBI6/jM2ZgN4tkGG1Rt/uaT6dv8LLjehZ7sxUK8nW1QpB3tdFusioE8thvubSTg19d/35fhV70QVixxH2Q/BUO+fGHKaI6z04MdlOVub8/gRS8EufeW/Mzj2wAU5fMx9yCvt6dX5XrNi3aK6CALp0eqBkud+8gjtOKg+8KhkpRPgKU17/h2vS4fTZlhjLvEjnwRT7MbbL2u9KYVzqNILEih34hEIXqDvM2sxNvP2rrZNerMn3r9hNhVHnrwhlqWC5caSQfkO1cM/S5yDaK8lyaRWLtTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com (2603:10b6:a03:2d1::10)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.24; Wed, 5 Jul
 2023 11:10:17 +0000
Received: from SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5]) by SJ0PR11MB4845.namprd11.prod.outlook.com
 ([fe80::3fa8:dede:a9ab:fc5%7]) with mapi id 15.20.6544.024; Wed, 5 Jul 2023
 11:10:16 +0000
Message-ID: <8a57de9d-f285-b946-ec2e-d1865de71157@intel.com>
Date: Wed, 5 Jul 2023 16:40:06 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.12.0
To: "Gupta, Anshuman" <anshuman.gupta@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230627115642.2087251-1-anshuman.gupta@intel.com>
 <20230627115642.2087251-5-anshuman.gupta@intel.com>
 <f75d088a-ec18-2cdf-1441-1417b0cb54f2@intel.com>
 <CY5PR11MB6211E3BECBDA9956398A9C7F952FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <CY5PR11MB6211E3BECBDA9956398A9C7F952FA@CY5PR11MB6211.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN0PR01CA0015.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:4f::20) To SJ0PR11MB4845.namprd11.prod.outlook.com
 (2603:10b6:a03:2d1::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB4845:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 0069dfdf-0577-46c9-1150-08db7d48690f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7EdrY3eJXJuXIZUS22oZdhpxew7YV7pyBs7cF3tSgQ7dOAOBtcfKQPhupqyDK4l32MtI+HWLKfIDxIlnQW6nN9CdCwX1W4bE6K12ivglrm7x7QgrsEmdd7izdtmXu955o/oM+wFgZoqaWRe3VyXAivSRGREb3MDnnUgmInNIo/xKdV/rB83TwXr3PcB+knnB1W7l0M5jGYLkIwrysYOpVgXQX/wBT//h3xDGANUBjo0UdGMqPGU2tFWeEyscycwKrvklLkwjxO+KpcJBhxoycxpYMVTZVt3r7qtwqLNXCE9b4BFH1FFk45bmWrMU6NY+paO0f7uEuxVhlJJXgQRv/S4AlodOyl2vPnthbvqKCMjz4m+I+w1AIrGuQ5Q5hFKuxKMbZuoaO/r4h9I/s79qu7Yhak/DDOLThRmDUxUpCMU4msIZovra3DSEGjnniHVf97bzihq8ACcKobOIdIZRsk3IrM8n50aY0ZOAincPLdqXTo9bXGGnrIrAwbbcnaar0BhYTn+pAxVsZYnJUhnD/hKKwMnRN2X5LQ5WD7bAUsjkVP4UQE0yJggeXyNkMDi1sTJm37Z2oJrrHsSu6Y5vF2m+v0hAYJE2CsK2LtDFoWpzRdmoUoBwF4HFykNO5iev+quPwQ5ro1Sl0sU8GFW9Gg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR11MB4845.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199021)(31696002)(41300700001)(86362001)(6486002)(38100700002)(6666004)(107886003)(83380400001)(82960400001)(53546011)(6506007)(2616005)(26005)(6512007)(110136005)(54906003)(478600001)(316002)(36756003)(66476007)(4326008)(66556008)(66946007)(8676002)(8936002)(186003)(31686004)(44832011)(2906002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VW04eVFuNUxhaGRqOVpJRWN4MHFQbDl6TkRSSnYxK1VuOE0rQmVuUVFiN3hj?=
 =?utf-8?B?S0xodCtGSlF6ZEh3WVNjQUtwYXNpSTloTDlHMXZpM05RdlkwS3ZLNnZjRVlL?=
 =?utf-8?B?anFZSktNWXNXR3UvZWoyVEpxUWJqZERqd0VDdXlaNUFOWDlSN3BRQWhiVkRp?=
 =?utf-8?B?c3BMT0hnMXNVbHRzZURxL21jQ2JQR3FUUWNaSTMrdEFJVkJNbm9IcE5CZUw2?=
 =?utf-8?B?czBGb056UnpDdmtLb1Y2NENKKzNQVUVoREpFdHhJSThES2ZmcGhLQWJGSTNL?=
 =?utf-8?B?cndGM2VLMCtid2o4TncwWlJYNU8rWlQzTWltTW5FWU40b1Z1TEVRb3JtbE9N?=
 =?utf-8?B?VGZpaC9NdmszMVNGWWtubENqRDEwc0tHcVplMmtKSVVhTURzdEVldWRrQ2ZN?=
 =?utf-8?B?alRjOVZpN1Urc0FCQzRjNXdxMndNL2FSMXVvYnJZaGdZdTFGM3V5SjFYclVI?=
 =?utf-8?B?UmoxZDF1TDZ6S3dZU3dGbGtqbUFaTzRmdlRieTVERFVhbkVCNTFTbTlqT0FF?=
 =?utf-8?B?LzlyL2h2L21kViticXpxaVVjYndxVFpPSU9iNXozUStILzA2NnN2ZFdxUi94?=
 =?utf-8?B?eXdvbmlwYUkzaTlzcGpNT1ZmQzkyTTlpWUdNYlMxWWpnemNmT1FtTGhnS01y?=
 =?utf-8?B?OUF6M2o1S3NKajdSUExQTytmM25pSkwwNzhuQjRSZnV1clJLdnczZ0pHdnM4?=
 =?utf-8?B?b0RQMm1Gb1RuREI0NWV2SFZxWnZnRUZJb1FBNWk0YlVybDZpTkZBeXh4MjRx?=
 =?utf-8?B?YUZJMUN0UlcySStySk8rVHpGdk1CbnRwZFBVSlZjWTF3L1JPaG1tQmUvR011?=
 =?utf-8?B?QXhpMGYvU1FOdjV3cnpkN2M3TjNyUEZaOTRrYisrMjh4bUVwWHl0TFhvejlh?=
 =?utf-8?B?Rnp1TExoUlNHUmM0bUNudU9MQ25ueXgreUd3cnZiMG5URmNjQnNFRXFtd3k2?=
 =?utf-8?B?RktPRzZWbmpnZmp2RXo2WnBIZnlEYkhpbDZwRXNpVVk0QUxRMk05aHJSYTFG?=
 =?utf-8?B?a2drYkIyTEhhek9tMlJiL2Q4bmUrc2w3TlNLZXVYbytqWk5Qb1J0T2haY0VN?=
 =?utf-8?B?WmFGcCtBSFFjL3ZqUDFHaXlLRDlnYmJTRVpxMmxPQ01XSjR2a29wOTB0UXh3?=
 =?utf-8?B?NjlZMkVDa2VFVXFaaW12eFl6cDNMM2IvMTBNckloN1ViOURXSlZKMSs1KzRR?=
 =?utf-8?B?S1pRN3JQa21oMU9zZHZxUEJRK0ZFRkUxZzI4cVdDU0srSk1wZGhYUGFJR24x?=
 =?utf-8?B?OGwxOG1wc1liZ245eWF6UC96OUh1NzV3TENOZ1FrdkQ5azhlZk45MFlhMDFK?=
 =?utf-8?B?eCtpbjdFV1hJTDMrUUxaaXQxdlN6UTRBM3ppSitTV0RyUHpJTkcxWlhmQ05Z?=
 =?utf-8?B?OTNmM3ZzVXlmOS9sQkhkUWZkZE80RW54d0QrUmxqTG1QdmxzdGJRRlhGU05i?=
 =?utf-8?B?aThoYTdVS3VQdG00ait6S0pSQjZMSmhYQnEySXdoTGJpaU5xaDlxQ0VIQlVS?=
 =?utf-8?B?SlFOSloxUUtqRlVSREJEZUdJNDB0T3J1VVpjQzk0VkFjSjU2WkFjSVQwWVpG?=
 =?utf-8?B?YXBHNWhDeDVYNTVrR2pVb0hKQ0E3UThqMFdsM2Rhc1J5WGdPbVN2TXVjZlU0?=
 =?utf-8?B?d1Vaby9ic3BkUzBQeHlhV0JtVkQrbEF3L3lZWXc2M09iajRZVzRmcGhlNUdE?=
 =?utf-8?B?QlFXL3F0ZFhkNWlJeWtvaU1CSHd5Njcxc04wNzhHcEJEK2h2dkVvQWQ5SmEw?=
 =?utf-8?B?U2VydTJXZlhRKy9XUDZ0OTRwa2w1ZTNoMWhJZ2FDK25iZURjYk8xd1ZHTDNr?=
 =?utf-8?B?dkVhOTllZnptV1lCYmt4MHpiN25HbUxJUnJESTJiZTBYUUJ1QXNqMkRSTWln?=
 =?utf-8?B?UDhHNDZNQk1oU29PcjBNcFN2M1FoZ01xYWNSekFEakFVQkp0b1NxRVpiaGdU?=
 =?utf-8?B?SFM4alAvTFc4YVU5aUh1em8yTTdEVkRTTTRVSGg2UXhwNVBoa2xRT0RQNFBM?=
 =?utf-8?B?aVlTR3hLVjltdHRNR201b3dEQzdwM1cwdG9WbVo0VlhZSmNyVXVqL0JLL0Jp?=
 =?utf-8?B?QU1Kc0pNcno3VWZlVVdKTUdBSlVHTXhqVXJ5Z0l0T0h5c3hrMzEwV3paaGVP?=
 =?utf-8?Q?qtWeZGU03HkFyiB87UkIhAMDT?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0069dfdf-0577-46c9-1150-08db7d48690f
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4845.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jul 2023 11:10:16.0492 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PLGrJ1nY70jAJJ4CsIrp6/XYiOtcqzSEvlc+PupLF8g5ccp5VvhoJHPKQtSTEru1AvZxXM5rfr95BP4OLZKlOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed
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
Cc: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 7/5/2023 12:32 PM, Gupta, Anshuman wrote:
> 
> 
>> -----Original Message-----
>> From: Tauro, Riana <riana.tauro@intel.com>
>> Sent: Tuesday, July 4, 2023 11:34 AM
>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>> xe@lists.freedesktop.org
>> Cc: Nilawar, Badal <badal.nilawar@intel.com>; Vivi, Rodrigo
>> <rodrigo.vivi@intel.com>; Sundaresan, Sujaritha
>> <sujaritha.sundaresan@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Subject: Re: [PATCH v3 4/5] xe/drm/pm: Toggle d3cold_allowed using
>> vram_usages
>>
>> Hi Anshuman
>>
>> On 6/27/2023 5:26 PM, Anshuman Gupta wrote:
>>> Adding support to control d3cold by using vram_usages metric from ttm
>>> resource manager.
>>> When root port  is capable of d3cold but xe has disallowed d3cold due
>>> to vrame_usages above vram_d3ccold_threshol. It is required to disable
>>> d3cold to avoid any resume failure because root port can still
>>> transition to d3cold when all of pcie endpoints and {upstream,
>>> virtual} switch ports will transition to d3hot.
>>> Also cleaning up the TODO code comment.
>>>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Signed-off-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>> Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_pci.c | 27 ++++++++++++++++++++++++---
>>>    drivers/gpu/drm/xe/xe_pm.c  | 29 +++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/xe/xe_pm.h  |  1 +
>>>    3 files changed, 54 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>>> index 848de5dcdaa5..78e906607188 100644
>>> --- a/drivers/gpu/drm/xe/xe_pci.c
>>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>>> @@ -746,6 +746,24 @@ static int xe_pci_resume(struct device *dev)
>>>    	return 0;
>>>    }
>>>
>>> +static void d3cold_toggle(struct pci_dev *pdev, bool enable) {
>>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>>> +	struct pci_dev *root_pdev;
>>> +
>>> +	if (!xe->d3cold.capable)
>>> +		return;
>>> +
>>> +	root_pdev = pcie_find_root_port(pdev);
>>> +	if (!root_pdev)
>>> +		return;
>>> +
>>> +	if (enable)
>>> +		pci_d3cold_enable(root_pdev);
>>> +	else
>>> +		pci_d3cold_disable(root_pdev);
>>> +}
>>> +
>>>    static int xe_pci_runtime_suspend(struct device *dev)
>>>    {
>>>    	struct pci_dev *pdev = to_pci_dev(dev); @@ -763,6 +781,7 @@
>> static
>>> int xe_pci_runtime_suspend(struct device *dev)
>>>    		pci_ignore_hotplug(pdev);
>>>    		pci_set_power_state(pdev, PCI_D3cold);
>>>    	} else {
>>> +		d3cold_toggle(pdev, false);
>>>    		pci_set_power_state(pdev, PCI_D3hot);
>>>    	}
>>>
>>> @@ -787,6 +806,8 @@ static int xe_pci_runtime_resume(struct device
>> *dev)
>>>    			return err;
>>>
>>>    		pci_set_master(pdev);
>>> +	} else {
>>> +		d3cold_toggle(pdev, true);
>>>    	}
>>>
>>>    	return xe_pm_runtime_resume(xe);
>>> @@ -800,15 +821,15 @@ static int xe_pci_runtime_idle(struct device *dev)
>>>    	if (!xe->d3cold.capable) {
>>>    		xe->d3cold.allowed = false;
>>>    	} else {
>>> +		xe->d3cold.allowed = xe_pm_vram_d3cold_allowed(xe);
>>> +
>>>    		/*
>>>    		 * TODO: d3cold should be allowed (true) if
>>>    		 * (IS_DGFX(xe) && !xe_device_mem_access_ongoing(xe))
>>>    		 * but maybe include some other conditions. So, before
>>>    		 * we can re-enable the D3cold, we need to:
>>>    		 * 1. rewrite the VRAM save / restore to avoid buffer object
>> locks
>>> -		 * 2. block D3cold if we have a big amount of device memory
>> in use
>>> -		 *    in order to reduce the latency.
>>> -		 * 3. at resume, detect if we really lost power and avoid
>> memory
>>> +		 * 2. at resume, detect if we really lost power and avoid
>> memory
>>>    		 *    restoration if we were only up to d3cold
>>>    		 */
>>>    		xe->d3cold.allowed = false;
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>> index 7028c9b6e94c..4db4e5a1b051 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>> @@ -277,3 +277,32 @@ int xe_pm_set_vram_threshold(struct xe_device
>>> *xe, u32 threshold)
>>>
>>>    	return 0;
>>>    }
>>> +
>>> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe) {
>>> +	struct ttm_resource_manager *man;
>>> +	u32 total_vram_used_mb = 0;
>>> +	bool allowed;
>>> +	u64 vram_used;
>>> +	int i;
>>> +
>>> +	/* TODO: Extend the logic to beyond XE_PL_VRAM1 */
>>> +	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i) {
>>> +		man = ttm_manager_type(&xe->ttm, i);
>>> +		if (man) {
>>> +			vram_used = ttm_resource_manager_usage(man);
>>> +			total_vram_used_mb +=
>> DIV_ROUND_UP_ULL(vram_used, 1024 * 1024);
>>> +		}
>>> +	}
>>> +
>>> +	mutex_lock(&xe->d3cold.lock);
>>> +
>>> +	if (total_vram_used_mb <= xe->d3cold.vram_threshold)
>>> +		allowed = true;
>> Can't xe->d3cold.allowed be directly modified here? There's also a lock
>> around the code
> patch have lock to protect the vram_threshold condition, it is not to proect the d3cold.allowed. I can assign d3cold.allowed here but that would require to change the function name to
> xe_pm_vram_toggle_d3cold_allow().
Not required to change.

LGTM
Reviewed-by: Riana Tauro <riana.tauro@intel.com>
> Br,
> Anshuman Gupta
>>
>> Thanks
>> Riana
>>> +	else
>>> +		allowed = false;
>>> +
>>> +	mutex_unlock(&xe->d3cold.lock);
>>> +
>>> +	return allowed;
>>> +}
>>> diff --git a/drivers/gpu/drm/xe/xe_pm.h b/drivers/gpu/drm/xe/xe_pm.h
>>> index b50ec8bdce6f..08612cf3e67b 100644
>>> --- a/drivers/gpu/drm/xe/xe_pm.h
>>> +++ b/drivers/gpu/drm/xe/xe_pm.h
>>> @@ -24,5 +24,6 @@ int xe_pm_runtime_put(struct xe_device *xe);
>>>    bool xe_pm_runtime_resume_if_suspended(struct xe_device *xe);
>>>    int xe_pm_runtime_get_if_active(struct xe_device *xe);
>>>    int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold);
>>> +bool xe_pm_vram_d3cold_allowed(struct xe_device *xe);
>>>
>>>    #endif
