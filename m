Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0550EC4725D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jan 2024 12:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F8010E9E5;
	Fri, 19 Jan 2024 12:40:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A09810E9E5
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jan 2024 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705668033; x=1737204033;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=S8oX++GTbxKSmd1elV7FDcWBKdOuKIgTc1/EJr7o3Vw=;
 b=SN2OXLFCKxrVqB7ZP8ZdO0zJlkm9HSQXUhmBIL7TgWG5fpsoOn55bG3M
 9pE3+IctHB73a9We+fjQ7tfcvryNRn+dm6EeePWhlyImDCab68lOK5ooT
 EiZvvRYp82zNXfvFl23mpsT7+GP6cRUO8JhDSD5mnVfK8yvurJG/YOImS
 LJGrlbrfd+7ku0RvPGYdkSEwqZohOZRaHed6x1zx3q9IrkH/WUw9JRUpH
 4v8A2cEJdPM4DNfqQWX1ZlleisREdIpwk1R9EhW4SHcnrsiU98x+6wXOa
 9SHRTzmYUSUp86DwKuaDZ6IYkZShmGVrg6rTMnZlAThwBtnCtRo8C6a8P g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397901521"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; d="scan'208";a="397901521"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2024 04:40:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="567227"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Jan 2024 04:40:30 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 04:40:29 -0800
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 19 Jan 2024 04:40:28 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 19 Jan 2024 04:40:28 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 19 Jan 2024 04:40:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ioZHLyYvmQK23YB4PZf77CbXLnYaYkjFMYGI0b1lgFELMybg7GKuDOVj3dQNO5iufPIc5W/t863pNwA13Q2ir8TUpndgPktuiYvMIBxYfvbY7xfvaWG5bOd01N8gBPHCTd4EkP0RhzuMJCWTNe9gGj7uLdsA1zU6gRRC+HmbIRQIuZO7kYbo2DvOnU8032om6nvv0T09hR/TqU+kAeZS3oqPqYGQ7MMjbUAbsP+VqJ6RkuvCuEu/pLKfN01FseJxIifeV1STEYo9gtQrrWA65WEe5s1X2UVbnlb3Kx8KDnt7hgq0r1JivbRHbPC8wGmqK+RxrR9RcslI37KAqiKAxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7yBx0fqyJnRPWDXIhoi/dDcb+5CJU//NDOauZlx/vtM=;
 b=MBSj7hfN087q5bltZGcpUZgTl7OoN9b43yLBAnSaw/nniC0csrxcExi1uEHurYrygEhE3L+Hhy67h7pO2/CCS1CguEoG6dNDaJyzXsgexKNxb07vkmkdW7jpc0PIMvbNxnpCmOjrQ/O1DQPnfxtJfGXAu+55xvGfZKBWH3lAQ3xbuzisNxYoqK/gIJPmgpRJ2CIyRC4JeBFNm/cFZOF9vBgoOPDiDwgRJhB4SIZDFUHNCDgPRA2maBWW0TXvCLskkQfyu1iyR04vMT/4XJ2NqlfSFsbzch6B3V5Vzc6CeUB6Xx8bUxSedQLRI8GcyvC/yrQqR5awVjdgq1Xi+qm88g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA1PR11MB7812.namprd11.prod.outlook.com (2603:10b6:208:3f7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 12:40:26 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::8178:9420:e286:3136%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 12:40:26 +0000
Message-ID: <e790143b-baaf-4674-99ed-92b130986df0@intel.com>
Date: Fri, 19 Jan 2024 18:10:20 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
 support
Content-Language: en-US
To: Riana Tauro <riana.tauro@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Belgaumkar, Vinay"
 <vinay.belgaumkar@intel.com>
References: <20240119081852.1858212-1-badal.nilawar@intel.com>
 <CY5PR11MB621172B0F827E4FD706646DB95702@CY5PR11MB6211.namprd11.prod.outlook.com>
 <d4620fae-0316-4881-ac03-cb4d6f99b01b@intel.com>
 <CY5PR11MB6211834CA364535838F7EC8095702@CY5PR11MB6211.namprd11.prod.outlook.com>
 <ca722743-8006-4195-9172-730c5886a7e6@intel.com>
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <ca722743-8006-4195-9172-730c5886a7e6@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA1PR11MB7812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6068463f-401d-4996-ff9b-08dc18ebcfb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1vb76s8oHjE/YnkuYmUfIZH9eOMurT/qKr7V24HBtCMeMujvJkTOdve6fw3FoIx7/RwSN6ne4xBJNUKFlm4v8aL2QlmACQ8exZbVZu1tsQgrunxWPjo2gWky9SaWNfrt9trmVPKUcDnsNbaqWPV7A/n4hwz9qhNLhCnY3pddjmDS1iVVE8qVxpRiVmf+rWeJwLDeQPM6uzEbs3VOMdH6qTo3wyD73EFhstv3dc3+GGs4Z5qQX2S5sN+Gn3LJZF+RouvLDwdzK0QpJwKMpyDnIeg8vsyP3xjB2KwTFOnaj7HHQpgyGQM2hIOHqG8Zm1VpoFjoWy3KZCuh85dFLA9h8IR53GCgFPryxufOY1k45Ce3D2hh4LnopqUF6kqE2ScFs3ECT6bczykHEgo+zkPe7JwvL3urMnE3tQqI+QS8V5I2/9xijI4FyZjrXlkgw3mL1DZ2ervCuRXlw0XxU7nIAtTn5XlIrJfY8GhVhmuAXqwAKvaU6RsGalRnhmyT7aA3ThXdh3sO4t+zdS7NxYFvKAmIU7zQhE94qONOaxiIDofpxEX5fYDiRBVDjtui+s5Y0l0p7HWzcUF+bphmMGquzSzYeV5oJEyO1SXd1Wfb/IEbU7Rc1iE/ZZ2osscM7WE0q5gS9YBN/evheeuyXJepSA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(39860400002)(366004)(396003)(376002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(31686004)(26005)(53546011)(6666004)(83380400001)(107886003)(86362001)(31696002)(36756003)(6506007)(6512007)(82960400001)(2616005)(4326008)(6486002)(110136005)(2906002)(5660300002)(66556008)(38100700002)(54906003)(8676002)(66476007)(6636002)(316002)(8936002)(66946007)(41300700001)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFlrT0xva0wxbGcvV3lFVXFWUDBCMkhRRHoyRDI3NUdrbFFQYmEyNHFFV1hl?=
 =?utf-8?B?eVl1WmpvTHhxRU55RmhKRWlPWWlNblhNUEgrY25vVGdFd29pSGU5Nkxkdloy?=
 =?utf-8?B?M0l0Y21DZmRoODZaMEVpWDBTdklUeVRjSDliOFc1TVRtNkJkUUMyMW1HOWdQ?=
 =?utf-8?B?M0d5ZEtQcTd1b1lmOGJ3ZzlkUnhNcTZQUk5YT1QxN05XUUJ3QkJXOGxKM3Uz?=
 =?utf-8?B?VzBrK2QvWHFaZWlnc09KNEorQWNaVWc4TGx0NHBlZXd5ai9semhMMVVHZWVQ?=
 =?utf-8?B?V0hkY2JhbXBXSU1PL2d1SG5SVjFIcVVwZVhyRloyUWk2TWRuYisrWFVWZlFI?=
 =?utf-8?B?SWJaRDRtOWNXajAvVUx3eXc4WFZzODNsOGtPZWNZaEpmbUpISGQxc3ZVdHFu?=
 =?utf-8?B?aUpzUVRGdHFPUUN1NlpJbGFZRE1LMi9kdXlxbk0veXYwS3U4alBNVHhmWWZQ?=
 =?utf-8?B?N2R1djgyRWdNdVNyR0prcnJ2NVhQSnQrQ29RKzJ6bjAzREVWamgzRGQ5anFj?=
 =?utf-8?B?T1FqbTFZOTFzNlZhR3Y5QTcvZXBieHZrbFlJS2t4V1d6eEluMzgyYTNWYlRN?=
 =?utf-8?B?Y21GU2VJSlc0M09GaUU4KzE3dE1Dck9CRkZ5ay9yYlpEendwR21BTzE0STdG?=
 =?utf-8?B?MjZxRE12eUttV0lGR3pIcEQ1WjJKM1RmYWg5NjdaTkdIZTZjS1ptOFdXbTRD?=
 =?utf-8?B?YjI5bkxmNi9rS3VLMzhKWEJINWdjb0laMFVJbmhIUzhpa3dmMVlkbVpjcUgz?=
 =?utf-8?B?RTNLbnAwSmludUZONlNmWE1BSVI4THdLWWt1OEFpaUxMcFVsemw3NWFDbHdp?=
 =?utf-8?B?OFczWXg2L09lSWFGc2s5STBaVzExbDgxclBkUld5UlJqS09QTTVLUDNTcG51?=
 =?utf-8?B?MWVuUHhQMDAyUEFPTE5aa1kxY3ZYMitoV0w0TmVZdFY1UlhoT25ldEVZSXFz?=
 =?utf-8?B?UEc3VlRJc3FVbUl4ZFBTOTJFUU85VDh5c3oxQjBDVWxaY1ZWSktKK1FFT1BV?=
 =?utf-8?B?Nk50UnYwVmhMVS90K0l3WWFaNmI4VGhiR3BQOHlCSEUrRGp2VTdRNEZIa0Vw?=
 =?utf-8?B?YzNONmx5RXVTMTRvNDJkSjZiOHdvSmVZWjkweFJVS3QyL2YwaVdvenFPVzRo?=
 =?utf-8?B?WTlJZ1lwejNoNUlGc3MyTFNIMkNyVTFnV0lGdms3RjRJSVFtTW1PdkpIcTJO?=
 =?utf-8?B?elkrUXJEZkpaVXJrS01BSm5PRW9oOENDc2Z3ejdYb3VoTFA0aWJXZWJTSGFC?=
 =?utf-8?B?UFVsVjNBSFBlcytPMk1CeldEc2pXK0lOcVBBd2RoWGxsczJNOEdoMzVMazMv?=
 =?utf-8?B?dExyNC9BMHIvSzJlTkxqUEhwZ2plK1pEUHNTZFZsY1hpQlovT0dnVlo2VnBN?=
 =?utf-8?B?VzRvV1M5ZEdYZlpZZitGb3d2QVRydnIzSmxkSHBXMVZsRHJoVk8vWFJDamRv?=
 =?utf-8?B?SzdwVDQvSnpRb0hMOUg5R3BBTmpuU2dVdEYxRDBpWkhYUWcyWUdScDZOY05U?=
 =?utf-8?B?ay9zMVdReFFvck4rR25ZQUVaazFUVW94R0F0Nm5sVzgrT1EvSTBLWVQreGo1?=
 =?utf-8?B?RlVsOXlQUG45dnhDc0drKzBiY1JMWTFSeXEwT083ZHFTa2I2alVueFB0VlVU?=
 =?utf-8?B?WlY1bTYrdHA3dGc0cVhlVGFCM3Z5SG5KallXQVhTQXMvZndUUVFzLzh4WURw?=
 =?utf-8?B?c3RpcmtEZWVSV3NoN200K0xJa2xUdG5KSXNCRzcyUUZCc3k4THhwL1ZTdktW?=
 =?utf-8?B?RzVpRzg0dWF0UkhrRDh6b1RkUEcyTjhpV3JwNUwyN053RnEwZjdFSkNzYWdH?=
 =?utf-8?B?OEs0V1ZFYmVyMlBBbWdNZDZLOGpqM0sxSVNrVDlLOGkrSU82ZDZTUkNjaDBm?=
 =?utf-8?B?aXhIRnp3a043Y0R4M1BIUEdJN3FHQk1yN3JObXNqTkRCRk5rVFFvOStWQ0pH?=
 =?utf-8?B?dXlnMEp1RUhtVXV2MmxQQi9kOUJEcDdBM2E0eHRFeCsvOWxqSmxnanM1cVVq?=
 =?utf-8?B?OWR1d3dWTnFrRGxKTDM5M1RWRnlLVmh4L2NyWWJDQVY0L1RsUXdkY2Vucm1D?=
 =?utf-8?B?MmlaZEZDKzV1R0JlNHUxTTdnZVdMbUo4OFZBTWJKbVV4N0c5UFdUYU9YNXJ6?=
 =?utf-8?B?UUMrMHhxalVaZXVKcDhwK1lFWXBNenYwUlFTdVpIUktDRXB5d2VkWVJoQ25t?=
 =?utf-8?B?aFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6068463f-401d-4996-ff9b-08dc18ebcfb1
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 12:40:26.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tcxFGCNPEN3h6XzzCcF/BH0+1AdgJl7pl/LqrMiqCsT0NGS7v4Qco8mLc0HSsQKLDpjy5aXMudjyzJVRWakeZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7812
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
Cc: "Roper, Matthew D" <matthew.d.roper@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>



On 19-01-2024 15:27, Riana Tauro wrote:
> Hi Badal
> 
> On 1/19/2024 3:05 PM, Gupta, Anshuman wrote:
>>
>>
>>> -----Original Message-----
>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>> Sent: Friday, January 19, 2024 3:01 PM
>>> To: Gupta, Anshuman <anshuman.gupta@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Cc: Vivi, Rodrigo <rodrigo.vivi@intel.com>; Roper, Matthew D
>>> <matthew.d.roper@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>;
>>> Belgaumkar, Vinay <vinay.belgaumkar@intel.com>
>>> Subject: Re: [PATCH] drm/xe/debugfs: Expose debugfs entry to check 
>>> guc pc
>>> support
>>>
>>>
>>>
>>> On 19-01-2024 14:58, Gupta, Anshuman wrote:
>>>>
>>>>
>>>>> -----Original Message-----
>>>>> From: Nilawar, Badal <badal.nilawar@intel.com>
>>>>> Sent: Friday, January 19, 2024 1:49 PM
>>>>> To: intel-xe@lists.freedesktop.org
>>>>> Cc: Gupta, Anshuman <anshuman.gupta@intel.com>; Vivi, Rodrigo
>>>>> <rodrigo.vivi@intel.com>; Roper, Matthew D
>>>>> <matthew.d.roper@intel.com>; Dixit, Ashutosh
>>>>> <ashutosh.dixit@intel.com>; Belgaumkar, Vinay
>>>>> <vinay.belgaumkar@intel.com>
>>>>> Subject: [PATCH] drm/xe/debugfs: Expose debugfs entry to check guc pc
>>>>> support
>>>>>
>>>>> Expose debugfs entry to check if platform support GuC PC (SLPC) 
>>>>> feature.
>>>>>
>>>>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>>>>> ---
>>>>>    drivers/gpu/drm/xe/xe_debugfs.c | 8 ++++++++
>>>>>    1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
>>>>> b/drivers/gpu/drm/xe/xe_debugfs.c index c56fd7d59f05..2f474bf0e7c7
>>>>> 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>>>>> @@ -30,6 +30,13 @@ static struct xe_device *node_to_xe(struct
>>>>> drm_info_node *node)
>>>>>        return to_xe_device(node->minor->dev);  }
>>>>>
>>>>> +static int is_gucpc_supported(struct seq_file *m, void *data) {
>>>>> +    struct xe_device *xe = node_to_xe(m->private);
>>>>> +
>>>>> +    return (int)!xe->info.skip_guc_pc;
>>>>> +}
>>>>> +
>>>>>    static int info(struct seq_file *m, void *data)  {
>>>>>        struct xe_device *xe = node_to_xe(m->private); @@ -67,6 
>>>>> +74,7 @@
>>>>> static int info(struct seq_file *m, void *data)
>>>>>
>>>>>    static const struct drm_info_list debugfs_list[] = {
>>>>>        {"info", info, 0},
>>>>> +    {"is_gucpc_supported", is_gucpc_supported, 0},
>>>> Above debugfs is per device.
>>>> We need this debugfs for each gt.
>>> The field skip_guc_pc is device specific so kept debugfs device 
>>> specific.
>> That make sense but then it is better to have a print in existing info 
>> debugfs
>> as this is filed in xe->info ?
>>  From igt we can grep the skip_guc_pc either "Yes" or "No".
>> Thanks,
>> Anshuman.
>>
> But shouldn't this be under gt0/uc/? if its named as guc_pc_supported
> or instead should we have something similar to i915 gt0/uc/guc_slpc_info?
Intention of this patch is to check if platform support slpc or not. As 
suggested above adding skip_guc_pc in info is sufficient no need to add 
new debugfs entry.

In addition to above, similar to i915 gt0/uc/guc_slpc_info can be 
implemented for xe kmd as well.  guc_slpc_info gives the state of SLPC 
(RUNNING, ERROR, so on). AFAIK recent times we are not seeing SLPC 
issues so not sure how helpful adding this would be. Lets see what 
others think about this. If needed this can be taken care in separate 
patch.

Regards,
Badal
> 
> Thanks
> Riana
>>>
>>> Regards,
>>> Badal
>>>> Thanks,
>>>> Anshuman.
>>>>>    };
>>>>>
>>>>>    static int forcewake_open(struct inode *inode, struct file *file)
>>>>> -- 
>>>>> 2.25.1
>>>>
