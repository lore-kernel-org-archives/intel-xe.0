Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDE3E95A8E
	for <intel-xe@archiver.kernel.org>; Mon,  9 Oct 2023 09:15:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 650EA10E24D;
	Mon,  9 Oct 2023 09:15:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF74710E251
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Oct 2023 09:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696842956; x=1728378956;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=3LnajtNCOESjZTxvlvmQeGq6X3BBbdAo9uBiksauyaI=;
 b=O7GEv67Dni0nJYpk9n+b2nJrhhu9P7x5XPyjv9ZAZLaM521wjOMed6VE
 0EqVVH4ROB6MMZaatx+v1dSakgdJIIOe3VuCPD8RXTxHOeUeGY6kDjstW
 0wrnKl76aRPKaZZN8mUevfwJ5E0TmKdXg4Fyh3bQEMxJe1lH2ySvVZIu+
 /Kn8hJocbAzEFwDtEzCv9qwtzn7dWVJKXF5byyvjFgmTwQeRKknZ9hdEn
 pB/XncCYNkLK5NuCAK4ZiRmw8fbmdzVWWG5RwnAo+iB5xvqpKvEfwi/Di
 9528reMO7xHc2+yDIzQ/pBEznFvZcjXPkHfPMjwOW7D7xTMJordcwjg9G Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="450600997"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="450600997"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2023 02:15:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10857"; a="818794742"
X-IronPort-AV: E=Sophos;i="6.03,210,1694761200"; d="scan'208";a="818794742"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Oct 2023 02:15:55 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 9 Oct 2023 02:15:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 9 Oct 2023 02:15:55 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 9 Oct 2023 02:15:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lAUA93zQEserzQ79pJw3ZUbfYe88PTuR6cIG9BjdM9B+ZEKgBRgAhoXtENqLhh8ltY9JRlFJXY0oqgHQU8GLbw+x+++O4ZX5Djw3XNvOndzbatrwWK6CW8CnsDfraoHrVX9gGbJh/pa/e6/+aQ6OYdtQik0Hlyn+wTtXkxJNfKRnJvDXUl3rfbYfOlpA5uSPr7XMoaBKy4CWhnljTDAflELwV/lxp8utrSdCppDTwY/SCpA4Hbpza4wO1JoQ0hodR+k/nyqM85l7qNeOmMwBPLDkwHn13XnY45XwNTB4a8rTPI1K6P8hs7Ite315i/mnjfU40bSfFwUTzHS7JvVw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+EqIYJI7lNOzJnX9eb8CSPhcqo1zYrHZBAO9uH5MuQ=;
 b=fWS7tTwmdRnqh/SHhpf08anuNz9hzO/gtYUkspgXSWMhO1OPVOhLRbctOehZo1SH7tjI31DC+zfXHgZMLaZn33Jn9gNvkashqTwb/OxLozy7HxC9iui6waOgOI3onK3XS/ORqunNEESdXAH3GMq5IZIUgV1yjTyNv6zo2/x9b5kUnlj732mNJQkimz//uh2IoUXCPyqY9/8HdZ8iPi/v4bhuR0UZJbBpEpFfrt4DdQl94sWL4hoNxL8WmMkworj8YGz6c7NzHGCibriQBtyvIQ/ebDKJwYYIOKnICxQ3w9f+PChpZKDGeIDCm7L5PXyHDIGgq6D3sGWqqYkKedqwJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Mon, 9 Oct
 2023 09:15:47 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::163d:1c68:1eeb:3514%6]) with mapi id 15.20.6838.033; Mon, 9 Oct 2023
 09:15:47 +0000
Message-ID: <121377d5-348b-4906-9a25-752ac694a009@intel.com>
Date: Mon, 9 Oct 2023 14:45:38 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20230927114627.136925-1-himal.prasad.ghimiray@intel.com>
 <20230927114627.136925-8-himal.prasad.ghimiray@intel.com>
 <a78dcbb2-d803-afa6-df4d-812147fa5261@linux.intel.com>
 <f0235d58-c1c3-4143-b5e4-0f0dbea12d4e@intel.com>
 <e4ce9225-8257-d759-e827-47b37c97cda5@linux.intel.com>
 <MW4PR11MB70564BE992C6FFF1C1DB9B2FB3CEA@MW4PR11MB7056.namprd11.prod.outlook.com>
 <f8fca5ae-9be7-20ae-9057-7595b2b2dcea@linux.intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <f8fca5ae-9be7-20ae-9057-7595b2b2dcea@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0026.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:25::31) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|SN7PR11MB6677:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e9473d-76ae-45f1-8ef6-08dbc8a852c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Paa4qGMxk+rDBesld7cXyaTtkCfzBoJSJU0UPlhKObmJdnVCbhm2aSDmuIVLcEFgvCmWbMieRIbWvbMttrYNOqbf/GHt4+3TDFAE0kle6R5em6OchlL6raIrDWusaaYoCUx3XHpNBHTTlYybBb1NoVnl7kdwwYFQcFy/FkUVk08pSfUmeP62stRLuhYu96F1ZaadA9OpU38XiHQTzqi4QSn295evbJreLhQs0ZGzndvr8tY2549ekYY7kpsKhuQPpcya8Yz/cGQOC5ZbvlDox6pDD/rJTjhXsCXebEGrHGUZmuLal5D49Nus0HX/T+LY7depZ5fp+lpJk4DwFl4AQmo/wXyEeqfUtje5EreVa5naDqKjwTQrlnBk3O0ZnVviv/qWC43+tabNzJXpDrEFj30YbtrYL+7ONFWPKce8K8GCpsT0F4Ks1yoXrTn8xGlD9Ar+tWJS+VHbP85/UFco9TKrKwKsJDOEwLhuONgHe/agFfEhGBdH3mPWMtvGlH6qc3vsbe0MHVO2UB//pCf0u0gburwEwganXTO53jHAzJHJSl7jR3syI5bZG+R4hNExahFi9eGqpuf79WMMF3mxVMi9eUtehAXXYRTNpSSnvU40J/pqzVY5TG2PQOJZh3/5nD9SN91t5HrpMqAPRZ9WHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(136003)(366004)(396003)(39860400002)(376002)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(31696002)(38100700002)(82960400001)(86362001)(36756003)(31686004)(2906002)(6512007)(478600001)(6486002)(30864003)(41300700001)(8936002)(5660300002)(8676002)(6666004)(53546011)(6506007)(83380400001)(2616005)(66556008)(66476007)(316002)(110136005)(66946007)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czBDb2lxNUJNRnoyc0pRdmhVSXpTV3dFa0sydzA4ZlIxREI3em5GK0QyL1hw?=
 =?utf-8?B?QlZyTnZrS0ErMXZMTmg3QWJudVVVeS9pSU1BcWExbkEyUFNSbHVENHFQZUxs?=
 =?utf-8?B?ZmkwV2YzOXBIRGFrdVlubjU4VTR4T3N2UEkxaEFjV0F5NkkxS2Q2RGdYWlpj?=
 =?utf-8?B?Q2Eza2tQa2lsN2QyMjNDVmZVQU1lMFJFZG1GalQ5SlpGUC92OW9nUnVodWZH?=
 =?utf-8?B?SjUya01yK0tuYUU1Mnkra1krdnkweFJXc0crYXNlUnU3WE1lRGk1eHoybjM5?=
 =?utf-8?B?TWZqbWYydW5iSCtYV2ttRkhNc0ZOVXUrR3VnOXgrMW5NQ3VWemI0cGFmWnFI?=
 =?utf-8?B?V1A0ZnphSURCREQvTytSNjJJTDd6M0xZZEFHVFBLMEF5S0ZEdEpVRUxCWFFu?=
 =?utf-8?B?Rms3TjJSalN4anNaUUFtaXpvTnY1Snp5djdsSytFRDFyQkQ1YWQrYm5KcHBx?=
 =?utf-8?B?QnlRN2lTaXhwQ00zdEwvS05Vd2JkVHZqVTN3ZVk0MW85Mzhuc0R3RTc0ait2?=
 =?utf-8?B?Zk5FYWtBcTFoR3JIYXRWQU9WVUxrNVhZVTczbWQvMXlUcDNxWDVjZHZ2UU9m?=
 =?utf-8?B?Q3pId0Zabm9pSzVqT0dSbzN1UmQwUlBrSm5PRWMvdUNmSWpoeXloUjFIdWRT?=
 =?utf-8?B?ZTZiMXdTdGgyaklUOVc3eDhFYXlSZ0ZwQ1lTRzlIbXA1UlVJbDJyVnpVWlNE?=
 =?utf-8?B?bUJXK3IxT0ZMcGRueDdSTk4zaEJtamUrRGxYVnBjUzJyQ210b2JIcGNOTkJP?=
 =?utf-8?B?SnhOeS8raXk3OWcwWVEveVE4azBzK0pBSTBxSGxNdjd5ODk4allHa094ZzYv?=
 =?utf-8?B?NWpvcXRZMkxIeTJVS2gxZzZKbWNkV0NUcHBlYm5PWVo5QUxYeERWQ3Z1STBk?=
 =?utf-8?B?ZUVqOElMVkdHdWVWdjQ1RXV6RzdWcml1QkRuQjE4L0w4N01KaFdSdnYzVFJB?=
 =?utf-8?B?ekRRbmxIU2pSS2RzNjNSNHRxRFNSTkpsQTdrTmZuUVV6ak9DVU1Cdll3YXNW?=
 =?utf-8?B?bkdJK2NtSktvbVFMSTQyb09NcTdudzhoOW55QlBVRnFKVTk2UVB1VXlxa2V3?=
 =?utf-8?B?bk5HekhwR0cySTBwMCt0MWsyVFZ3R3VZVzBTN0FuK3d4ZTJVRWdiaGNQb1Br?=
 =?utf-8?B?L05VUnB2a0xWUXJueDZXRjNWQW9uZEw2MGhpQi9UMU8vdjZnSS9ycG5aVXdI?=
 =?utf-8?B?K05JeUNPWWpsNURjNVhMY1dHTVYxUzVlSTR0WWZ1UjFPY2F0bTI5ZVIxY1Rq?=
 =?utf-8?B?NFZRUFpkdHRUc21HbzFmNkVtakxzOGY1SVdUZFBKNlVKMkl1dWQxMUJJZlVt?=
 =?utf-8?B?WWFpSUt4RDRodyszQ1NFQlZISEFZQnRuSGM1eGRjeElyUGNJN0hiTE9zSjV4?=
 =?utf-8?B?VlJveFo0cVBGZlVRd2JUdHV5ZGljTjhiTXI2R3JLYkhqejFiRHBHMWhqcGFP?=
 =?utf-8?B?UmRrU1ZoMWY4SXk1Wm01ZG9SQysvZGtyemVaYkc0Nm5IUkNPS29VQ3pQeE43?=
 =?utf-8?B?cDZyNUQ0YXdZakJuNERvOHFwNlE2cEZ2b0pQY09HaTBXcjh0NHRtYWd1RTZP?=
 =?utf-8?B?Z3dQaDhhNHNReDNZOUdiaEpxRXVScTIveDhxY3pieXl1a296cmpwaU44L00w?=
 =?utf-8?B?SVl2WmhsNkN2ZjYrbEpZRnhETDNuU1FubFZ5V05ueEVEbnJxVFl4ZGV0RDdm?=
 =?utf-8?B?d2FBbE5pclJ5bFdOMWpqRzU1cjNPQ1dxTmxqTERDYUMzQTRrdlhpcXpxc21o?=
 =?utf-8?B?eWpGYkdIYU1RUzBBQTVsSlFhUElVbEU3TWk1dHRUT3pkQkNjYVV0azYwRDE0?=
 =?utf-8?B?RXVCeTJTWUdiSUsybS9ZTi9qQTVSNjdJQnBSQi9LNkxWRUJyUmx2VkQvSUtk?=
 =?utf-8?B?YytpdGhpMThET3FqVmoxT01mVzV5c0cxM2k5U3ZpalVUVXdoQXlONEJOdlBZ?=
 =?utf-8?B?ZzgwOWIyY2FMQnhLVGVsVWNTaXAxa2ZMRkNVcVRrWitFaTlMc0xHYXJ0bDJU?=
 =?utf-8?B?dkV6RlpYOUZVV2dBaDRXRm5yYWxRU28yTXdTeXQ2Znk0d01KaG9salJwZitj?=
 =?utf-8?B?MGNlSkM4SlFYZHB6eTdvemp6Nm1Bd3IxWUlPMzB0eU9tck82bVJFSWs0TUlj?=
 =?utf-8?B?OTFvUFhSdE9zMExLUy92TWpzOUxEc1BKT2UrTmRycXdkT1pVTDN2UHhWYW5p?=
 =?utf-8?Q?F0XBfxyE0yYjpjNdJJ6sJrY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e9473d-76ae-45f1-8ef6-08dbc8a852c5
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2023 09:15:47.4973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BlipvnpTnPNWPgggwwjgNWN2/Ypb0i16tyf2B2gTv15HJFrV0y0DR9AsaBM4lrFbE/jp0PwDud+j1qgKX+pVFm653ngIPIe7V1sPyAtrofk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6677
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error
 handling for PVC.
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


On 09-10-2023 14:30, Aravind Iddamsetty wrote:
> On 09/10/23 09:41, Ghimiray, Himal Prasad wrote:
>>> -----Original Message-----
>>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>> Sent: 08 October 2023 15:03
>>> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; intel-
>>> xe@lists.freedesktop.org
>>> Subject: Re: [Intel-xe] [PATCH 07/11] drm/xe: Support SOC FATAL error
>>> handling for PVC.
>>>
>>>
>>> On 04/10/23 12:20, Ghimiray, Himal Prasad wrote:
>>>> On 04-10-2023 12:08, Aravind Iddamsetty wrote:
>>>>> On 27/09/23 17:16, Himal Prasad Ghimiray wrote:
>>>>> Hi Himal,
>>>>>
>>>>> I'm yet to review the full patch but sharing a few initial comments.
>>>> Hi Aravind,
>>>>
>>>> Thanks for the review comments.
>>>>
>>>>>> Report the SOC fatal hardware error and update the counters which
>>>>>> will increment incase of error.
>>>>>>
>>>>>> Signed-off-by: Himal Prasad
>>>>>> Ghimiray<himal.prasad.ghimiray@intel.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/xe/regs/xe_tile_error_regs.h |  28 +++
>>>>>>    drivers/gpu/drm/xe/xe_hw_error.c             | 170
>>>>>> +++++++++++++++++++
>>>>>>    drivers/gpu/drm/xe/xe_hw_error.h             |  58 ++++++-
>>>>>>    3 files changed, 254 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>>>> b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>>>> index fa16eaf9436b..04701c62f0d9 100644
>>>>>> --- a/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>>>> +++ b/drivers/gpu/drm/xe/regs/xe_tile_error_regs.h
>>>>>> @@ -20,4 +20,32 @@
>>>>>>    #define GSC_HEC_ERR_STAT_REG(base, x)
>>>>>> XE_REG(_PICK_EVEN((x), \
>>>>>>                                    (base) + _GSC_HEC_CORR_ERR_STATUS,
>>>>>> \
>>>>>>                                    (base) +
>>>>>> _GSC_HEC_UNCOR_ERR_STATUS))
>>>>>> +#define SOC_PVC_BASE                   0x00282000 #define
>>>>>> +SOC_PVC_SLAVE_BASE             0x00283000
>>>>>> +
>>>>>> +#define _SOC_LERRCORSTS               0x000294 #define
>>>>>> +_SOC_LERRUNCSTS               0x000280 #define
>>>>>> +SOC_LOCAL_ERR_STAT_SLAVE_REG(base, x)        XE_REG((x) >
>>>>>> +HARDWARE_ERROR_CORRECTABLE ? \
>>>>>> +                                (base) + _SOC_LERRUNCSTS : \
>>>>>> +                                (base) + _SOC_LERRCORSTS)
>>>>>> +
>>>>>> +#define SOC_LOCAL_ERR_STAT_MASTER_REG(base, x)        XE_REG((x)
>>>>>> +HARDWARE_ERROR_CORRECTABLE ? \
>>>>>> +                                (base) + _SOC_LERRUNCSTS : \
>>>>>> +                                (base) + _SOC_LERRCORSTS) #define
>>>>>> +_SOC_GSYSEVTCTL                0x000264
>>>>>> +
>>>>>> +#define SOC_GSYSEVTCTL_REG(base, slave_base, x)
>>>>>> +XE_REG(_PICK_EVEN((x), \
>>>>>> +                                (base) + _SOC_GSYSEVTCTL, \
>>>>>> +                                slave_base + _SOC_GSYSEVTCTL))
>>>>>> +#define _SOC_GCOERRSTS                0x000200 #define
>>>>>> +_SOC_GNFERRSTS                0x000210 #define _SOC_GFAERRSTS
>>>>>> +0x000220 #define SOC_GLOBAL_ERR_STAT_SLAVE_REG(base, x)
>>>>>> +XE_REG(_PICK_EVEN((x), \
>>>>>> +                                (base) + _SOC_GCOERRSTS, \
>>>>>> +                                (base) + _SOC_GNFERRSTS))
>>>>>> +
>>>>>> +#define SOC_GLOBAL_ERR_STAT_MASTER_REG(base, x)
>>>>>> +XE_REG(_PICK_EVEN((x), \
>>>>>> +                                (base) + _SOC_GCOERRSTS, \
>>>>>> +                                (base) + _SOC_GNFERRSTS))
>>>>>> +
>>>>>>    #endif
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>>>>>> b/drivers/gpu/drm/xe/xe_hw_error.c
>>>>>> index 76ae12df013c..fa05bad5e684 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.c
>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>>>>>> @@ -207,6 +207,75 @@ static const struct err_msg_cntr_pair
>>>>>> gsc_correctable_err_reg[] = {
>>>>>>        [2 ... 31] = {"Undefined",
>>>>>> XE_GSC_HW_ERR_UNKNOWN_CORR},
>>>>>>    };
>>>>>>    +static const struct err_msg_cntr_pair
>>>>>> soc_mstr_glbl_err_reg_fatal[] = {
>>>>>> +    [0]         = {"MASTER LOCAL Reported",
>>>>>> +XE_SOC_HW_ERR_MSTR_LCL_FATAL},
>>>>>> +    [1]         = {"SLAVE GLOBAL Reported",
>>>>>> +XE_SOC_HW_ERR_SLAVE_GLBL_FATAL},
>>>>>> +    [2]         = {"HBM SS0: Channel0",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL0_FATAL},
>>>>>> +    [3]         = {"HBM SS0: Channel1",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL1_FATAL},
>>>>>> +    [4]         = {"HBM SS0: Channel2",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL2_FATAL},
>>>>>> +    [5]         = {"HBM SS0: Channel3",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL3_FATAL},
>>>>>> +    [6]         = {"HBM SS0: Channel4",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL4_FATAL},
>>>>>> +    [7]         = {"HBM SS0: Channel5",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL5_FATAL},
>>>>>> +    [8]         = {"HBM SS0: Channel6",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL6_FATAL},
>>>>>> +    [9]         = {"HBM SS0: Channel7",
>>>>>> +XE_SOC_HW_ERR_HBM0_CHNL7_FATAL},
>>>>>> +    [10]        = {"HBM SS1: Channel0",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL0_FATAL},
>>>>>> +    [11]        = {"HBM SS1: Channel1",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL1_FATAL},
>>>>>> +    [12]        = {"HBM SS1: Channel2",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL2_FATAL},
>>>>>> +    [13]        = {"HBM SS1: Channel3",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL3_FATAL},
>>>>>> +    [14]        = {"HBM SS1: Channel4",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL4_FATAL},
>>>>>> +    [15]        = {"HBM SS1: Channel5",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL5_FATAL},
>>>>>> +    [16]        = {"HBM SS1: Channel6",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL6_FATAL},
>>>>>> +    [17]        = {"HBM SS1: Channel7",
>>>>>> +XE_SOC_HW_ERR_HBM1_CHNL7_FATAL},
>>>>>> +    [18]        = {"PUNIT",
>>>>>> +XE_SOC_HW_ERR_PUNIT_FATAL},
>>>>>> +    [19 ... 31] = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL}, };
>>>>>> +
>>>>>> +static const struct err_msg_cntr_pair
>>>>>> +soc_slave_glbl_err_reg_fatal[] = {
>>>>>> +    [0]         = {"SLAVE LOCAL Reported",
>>>>>> +XE_SOC_HW_ERR_SLAVE_LCL_FATAL},
>>>>>> +    [1]         = {"HBM SS2: Channel0",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL0_FATAL},
>>>>>> +    [2]         = {"HBM SS2: Channel1",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL1_FATAL},
>>>>>> +    [3]         = {"HBM SS2: Channel2",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL2_FATAL},
>>>>>> +    [4]         = {"HBM SS2: Channel3",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL3_FATAL},
>>>>>> +    [5]         = {"HBM SS2: Channel4",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL4_FATAL},
>>>>>> +    [6]         = {"HBM SS2: Channel5",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL5_FATAL},
>>>>>> +    [7]         = {"HBM SS2: Channel6",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL6_FATAL},
>>>>>> +    [8]         = {"HBM SS2: Channel7",
>>>>>> +XE_SOC_HW_ERR_HBM2_CHNL7_FATAL},
>>>>>> +    [9]         = {"HBM SS3: Channel0",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL0_FATAL},
>>>>>> +    [10]        = {"HBM SS3: Channel1",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL1_FATAL},
>>>>>> +    [11]        = {"HBM SS3: Channel2",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL2_FATAL},
>>>>>> +    [12]        = {"HBM SS3: Channel3",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL3_FATAL},
>>>>>> +    [13]        = {"HBM SS3: Channel4",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL4_FATAL},
>>>>>> +    [14]        = {"HBM SS3: Channel5",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL5_FATAL},
>>>>>> +    [15]        = {"HBM SS3: Channel6",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL6_FATAL},
>>>>>> +    [16]        = {"HBM SS3: Channel7",
>>>>>> +XE_SOC_HW_ERR_HBM3_CHNL7_FATAL},
>>>>>> +    [18]        = {"ANR MDFI",
>>>>>> +XE_SOC_HW_ERR_ANR_MDFI_FATAL},
>>>>>> +    [17]        = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL},
>>>>>> +    [19 ... 31] = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL}, };
>>>>>> +
>>>>>> +static const struct err_msg_cntr_pair soc_slave_lcl_err_reg_fatal[]
>>>>>> += {
>>>>>> +    [0]         = {"Local IEH Internal: Malformed PCIe AER",
>>>>>> +XE_SOC_HW_ERR_PCIE_AER_FATAL},
>>>>>> +    [1]         = {"Local IEH Internal: Malformed PCIe ERR",
>>>>>> +XE_SOC_HW_ERR_PCIE_ERR_FATAL},
>>>>>> +    [2]         = {"Local IEH Internal: UR CONDITIONS IN IEH",
>>>>>> +XE_SOC_HW_ERR_UR_COND_FATAL},
>>>>>> +    [3]         = {"Local IEH Internal: FROM SERR SOURCES",
>>>>>> +XE_SOC_HW_ERR_SERR_SRCS_FATAL},
>>>>>> +    [4 ... 31]  = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL}, };
>>>>>> +
>>>>>> +static const struct err_msg_cntr_pair soc_mstr_lcl_err_reg_fatal[]
>>>>>> += {
>>>>>> +    [0 ... 3]   = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL},
>>>>>> +    [4]         = {"Base Die MDFI T2T",
>>>>>> +XE_SOC_HW_ERR_MDFI_T2T_FATAL},
>>>>>> +    [5]         = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL},
>>>>>> +    [6]         = {"Base Die MDFI T2C",
>>>>>> +XE_SOC_HW_ERR_MDFI_T2C_FATAL},
>>>>>> +    [7]         = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL},
>>>>>> +    [8]         = {"Invalid CSC PSF Command Parity",
>>>>>> +XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL},
>>>>>> +    [9]         = {"Invalid CSC PSF Unexpected Completion",
>>>>>> +XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL},
>>>>>> +    [10]        = {"Invalid CSC PSF Unsupported Request",
>>>>>> +XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL},
>>>>>> +    [11]        = {"Invalid PCIe PSF Command Parity",
>>>>>> +XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL},
>>>>>> +    [12]        = {"PCIe PSF Unexpected Completion",
>>>>>> +XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL},
>>>>>> +    [13]        = {"PCIe PSF Unsupported Request",
>>>>>> +XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL},
>>>>>> +    [14 ... 31] = {"Undefined",
>>>>>> +XE_SOC_HW_ERR_UNKNOWN_FATAL}, };
>>>>>> +
>>>>> we shall think of future extensibility, like we do in
>>>>> xe_assign_hw_err_regs depending on platform for other registers.
>>>> Yes that is in my mind. I was planing to move this struct under
>>> xe_assign_hw_err_regs once new platform support is added for SOC error
>>> handling.
>>>> But to make things aligned can be taken care rightnow as well. Will address
>>> in next patch.
>>>>>>    static void xe_assign_hw_err_regs(struct xe_device *xe)
>>>>>>    {
>>>>>>        const struct err_msg_cntr_pair **dev_err_stat =
>>>>>> xe->hw_err_regs.dev_err_stat; @@ -451,6 +520,104 @@
>>>>>> xe_gsc_hw_error_handler(struct xe_tile *tile, const enum
>>>>>> hardware_error hw_err)
>>>>>>        xe_mmio_write32(mmio, GSC_HEC_ERR_STAT_REG(base, hw_err),
>>>>>> errsrc);
>>>>>>    }
>>>>>>    +static void
>>>>>> +xe_soc_log_err_update_cntr(struct xe_tile *tile,
>>>>>> +               u32 errbit, const struct err_msg_cntr_pair
>>>>>> +*reg_info) {
>>>>>> +    const char *errmsg;
>>>>>> +    u32 indx;
>>>>>> +
>>>>>> +    errmsg = reg_info[errbit].errmsg;
>>>>>> +    indx = reg_info[errbit].cntr_indx;
>>>>>> +
>>>>>> +    drm_err_ratelimited(&tile_to_xe(tile)->drm, HW_ERR
>>>>>> +                "Tile%d %s SOC FATAL error, bit[%d] is set\n",
>>>>>> +                tile->id, errmsg, errbit);
>>>>>> +    tile->errors.count[indx]++;
>>>>>> +}
>>>>>> +
>>>>>> +static void
>>>>>> +xe_soc_hw_error_handler(struct xe_tile *tile, const enum
>>>>>> +hardware_error hw_err) {
>>>>>> +    unsigned long mst_glb_errstat, slv_glb_errstat, lcl_errstat;
>>>>>> +    u32 errbit, base, slave_base;
>>>>>> +    int i;
>>>>>> +    struct xe_gt *gt = tile->primary_gt;
>>>>>> +
>>>>>> +    lockdep_assert_held(&tile_to_xe(tile)->irq.lock);
>>>>>> +
>>>>>> +    if ((tile_to_xe(tile)->info.platform != XE_PVC) && hw_err !=
>>>>>> +HARDWARE_ERROR_FATAL)
>>>>>> +        return;
>>>>>> +
>>>>>> +    base = SOC_PVC_BASE;
>>>>>> +    slave_base = SOC_PVC_SLAVE_BASE;
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Mask error type in GSYSEVTCTL so that no new errors of the
>>>>>> +type
>>>>>> +     * will be reported. Read the master global IEH error register
>>>>>> +if
>>>>>> +     * BIT 1 is set then process the slave IEH first. If BIT 0 in
>>>>>> +     * global error register is set then process the corresponding
>>>>>> +     * Local error registers
>>>>>> +     */
>>>>>> +    for (i = 0; i < PVC_NUM_IEH; i++)
>>>>>> +        xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base,
>>>>>> +i), ~REG_BIT(hw_err));
>>>>>> +
>>>>>> +    mst_glb_errstat = xe_mmio_read32(gt,
>>>>>> +SOC_GLOBAL_ERR_STAT_MASTER_REG(base, hw_err));
>>>>>> +    drm_info(&tile_to_xe(tile)->drm, HW_ERR
>>>>>> +         "Tile%d
>>> SOC_GLOBAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>>>>>> +         tile->id, mst_glb_errstat);
>>>>>> +
>>>>>> +    if (mst_glb_errstat & REG_BIT(SOC_SLAVE_IEH)) {
>>>>>> +        slv_glb_errstat = xe_mmio_read32(gt,
>>>>>> +                         SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base,
>>>>>> +hw_err));
>>>>>> +         drm_info(&tile_to_xe(tile)->drm, HW_ERR
>>>>>> +              "Tile%d
>>>>>> +SOC_GLOBAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>>>>>> +              tile->id, slv_glb_errstat);
>>>>>> +
>>>>>> +        if (slv_glb_errstat & REG_BIT(SOC_IEH1_LOCAL_ERR_STATUS)) {
>>>>>> +            lcl_errstat = xe_mmio_read32(gt,
>>>>>> +SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base,
>>>>>> +                                              hw_err));
>>>>>> +             drm_info(&tile_to_xe(tile)->drm, HW_ERR
>>>>>> +                  "Tile%d
>>>>>> +SOC_LOCAL_ERR_STAT_SLAVE_REG_FATAL:0x%08lx\n",
>>>>>> +                  tile->id, lcl_errstat);
>>>>>> +
>>>>>> +            for_each_set_bit(errbit, &lcl_errstat, 32)
>>>>>> +                xe_soc_log_err_update_cntr(tile, errbit,
>>>>>> +                               soc_slave_lcl_err_reg_fatal);
>>>>>> +
>>>>>> +            xe_mmio_write32(gt,
>>>>>> +SOC_LOCAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>>>>> +                    lcl_errstat);
>>>>>> +        }
>>>>>> +
>>>>>> +        for_each_set_bit(errbit, &slv_glb_errstat, 32)
>>>>>> +            xe_soc_log_err_update_cntr(tile, errbit,
>>>>>> +soc_slave_glbl_err_reg_fatal);
>>>>>> +
>>>>>> +        xe_mmio_write32(gt,
>>>>>> +SOC_GLOBAL_ERR_STAT_SLAVE_REG(slave_base, hw_err),
>>>>>> +                slv_glb_errstat);
>>>>>> +    }
>>>>>> +
>>>>>> +    if (mst_glb_errstat & REG_BIT(SOC_IEH0_LOCAL_ERR_STATUS)) {
>>>>>> +        lcl_errstat = xe_mmio_read32(gt,
>>>>>> +SOC_LOCAL_ERR_STAT_MASTER_REG(base, hw_err));
>>>>>> +        drm_info(&tile_to_xe(tile)->drm, HW_ERR
>>>>>> +"SOC_LOCAL_ERR_STAT_MASTER_REG_FATAL:0x%08lx\n",
>>>>>> +             lcl_errstat);
>>>>>> +
>>>>>> +        for_each_set_bit(errbit, &lcl_errstat, 32)
>>>>>> +            xe_soc_log_err_update_cntr(tile, errbit,
>>>>>> +soc_mstr_lcl_err_reg_fatal);
>>>>>> +
>>>>>> +        xe_mmio_write32(gt, SOC_LOCAL_ERR_STAT_MASTER_REG(base,
>>>>>> +hw_err), lcl_errstat);
>>>>>> +    }
>>>>>> +
>>>>>> +    for_each_set_bit(errbit, &mst_glb_errstat, 32)
>>>>>> +        xe_soc_log_err_update_cntr(tile, errbit,
>>>>>> +soc_mstr_glbl_err_reg_fatal);
>>>>>> +
>>>>>> +    xe_mmio_write32(gt, SOC_GLOBAL_ERR_STAT_MASTER_REG(base,
>>>>>> +hw_err),
>>>>>> +            mst_glb_errstat);
>>>>>> +
>>>>>> +    for (i = 0; i < PVC_NUM_IEH; i++)
>>>>>> +        xe_mmio_write32(gt, SOC_GSYSEVTCTL_REG(base, slave_base,
>>>>>> +i),
>>>>>> +                (HARDWARE_ERROR_MAX << 1) + 1); }
>>>>>> +
>>>>>>    static void
>>>>>>    xe_hw_error_source_handler(struct xe_tile *tile, const enum
>>>>>> hardware_error hw_err)
>>>>>>    {
>>>>>> @@ -498,6 +665,9 @@ xe_hw_error_source_handler(struct xe_tile
>>> *tile,
>>>>>> const enum hardware_error hw_er
>>>>>>              if (errbit == 8)
>>>>>>                xe_gsc_hw_error_handler(tile, hw_err);
>>>>>> +
>>>>>> +        if (errbit == 16)
>>>>>> +            xe_soc_hw_error_handler(tile, hw_err);
>>>>>>        }
>>>>>>          xe_mmio_write32(mmio, DEV_ERR_STAT_REG(hw_err), errsrc);
>>>>>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>>>>>> b/drivers/gpu/drm/xe/xe_hw_error.h
>>>>>> index ee7705b3343b..05838e082abd 100644
>>>>>> --- a/drivers/gpu/drm/xe/xe_hw_error.h
>>>>>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>>>>>> @@ -65,6 +65,56 @@ enum xe_tile_hw_errors {
>>>>>>        XE_GSC_HW_ERR_SELF_MBIST_UNCOR,
>>>>>>        XE_GSC_HW_ERR_AON_RF_PARITY_UNCOR,
>>>>>>        XE_GSC_HW_ERR_UNKNOWN_UNCOR,
>>>>>> +    XE_SOC_HW_ERR_MSTR_LCL_FATAL,
>>>>>> +    XE_SOC_HW_ERR_SLAVE_GLBL_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL0_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL1_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL2_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL3_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL4_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL5_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL6_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM0_CHNL7_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL0_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL1_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL2_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL3_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL4_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL5_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL6_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM1_CHNL7_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PUNIT_FATAL,
>>>>>> +    XE_SOC_HW_ERR_UNKNOWN_FATAL,
>>>>>> +    XE_SOC_HW_ERR_SLAVE_LCL_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL0_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL1_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL2_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL3_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL4_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL5_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL6_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM2_CHNL7_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL0_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL1_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL2_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL3_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL4_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL5_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL6_FATAL,
>>>>>> +    XE_SOC_HW_ERR_HBM3_CHNL7_FATAL,
>>>>>> +    XE_SOC_HW_ERR_ANR_MDFI_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PCIE_AER_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PCIE_ERR_FATAL,
>>>>>> +    XE_SOC_HW_ERR_UR_COND_FATAL,
>>>>>> +    XE_SOC_HW_ERR_SERR_SRCS_FATAL,
>>>>>> +    XE_SOC_HW_ERR_MDFI_T2T_FATAL,
>>>>>> +    XE_SOC_HW_ERR_MDFI_T2C_FATAL,
>>>>>> +    XE_SOC_HW_ERR_CSC_PSF_CMD_FATAL,
>>>>>> +    XE_SOC_HW_ERR_CSC_PSF_CMP_FATAL,
>>>>>> +    XE_SOC_HW_ERR_CSC_PSF_REQ_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PCIE_PSF_CMD_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PCIE_PSF_CMP_FATAL,
>>>>>> +    XE_SOC_HW_ERR_PCIE_PSF_REQ_FATAL,
>>>>> even though soc errors fall under a tile it is better if we shall
>>>>> have a separate enum for soc errors for 2 reasons, the other errors
>>>>> in xe_tile_hw_errors are from top level registers while SOC are from
>>>>> second level and also because these errors are most likely different on
>>> different platforms.
>>>>> so, we shall extend struct tile_hw_errors to have separate entry for soc.
>>>> Makes sense. WIll address in next patch.
>>>>> Also, I'm thinking if we shall use xarray types for all members in
>>>>> error counters under tile and gt with the enum list being big and which will
>>> increase with each new platform.
>>>> My initial thought was also to use xarray for soc error counters. But even if
>>> we use xarray we need to have separate identifiers to identify which indexes
>>> in xarray are actually valid hardware error and which are spurious interrupt.
>>> Hence found no use of using xarray, if we still need to maintain all valid
>>> indexes.
>>>
>>> xarray is supposedly be more memory efficient with large arrays, IIUC the
>>> allocation for an index position will only be done when the index is used for
>>> the first time.
>> Hmm. With current approach, for soc counters we might end up allocating int array of
>> [32] [ 2] [3] [2] = 384 elements (considering we have only 1 slave ieh and all bits signify some error) and I am not sure whether
>> On further platform we will have more slaves IEH or not.
>>
>> With xarray the allocation will be dynamic and above array can be avoided. If recommendation is not to allocate this big arrays,  xarray will be better option.
>> If array size is of no concern, we can avoid overhead of xarray referencing and dereferencing while storing and reading the counter values from respective index.
>   I do not think that should be an issue in our present usecase which is not time critical and we have used this i915 as well with no known latency issues.

Ok. In that case will update the counters using xarray instead of array 
in next patch.  Shall we use xarray for only socs counters or all other 
error types too ?

IMO other categories have very less counters hence using xarray doesn't 
seem logical.

>
> Thanks,
>
> Aravind,
>
>> BR
>> Himal
>>
>>> Thanks,
>>> Aravind.
>>>> BR
>>>>
>>>> Himal Ghimiray
>>>>
>>>>> Thanks,
>>>>> Aravind.
>>>>>
>>>>>>        XE_TILE_HW_ERROR_MAX,
>>>>>>    };
>>>>>>    @@ -109,8 +159,12 @@ enum xe_gt_hw_errors {
>>>>>>        XE_GT_HW_ERROR_MAX,
>>>>>>    };
>>>>>>    -#define ERR_STAT_GT_COR_VCTR_LEN (4) -#define
>>>>>> ERR_STAT_GT_FATAL_VCTR_LEN (8)
>>>>>> +#define ERR_STAT_GT_COR_VCTR_LEN    (4) #define
>>>>>> +ERR_STAT_GT_FATAL_VCTR_LEN    (8) #define PVC_NUM_IEH
>>>>>> +(1) #define SOC_SLAVE_IEH                   (1) #define
>>>>>> +SOC_IEH0_LOCAL_ERR_STATUS       (0) #define
>>>>>> +SOC_IEH1_LOCAL_ERR_STATUS       (0)
>>>>>>      struct err_msg_cntr_pair {
>>>>>>        const char *errmsg;
