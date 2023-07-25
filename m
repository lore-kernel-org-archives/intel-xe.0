Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A994BC001DE
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jul 2023 15:33:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D02B10E3DB;
	Tue, 25 Jul 2023 15:33:49 +0000 (UTC)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C49410E3E3
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jul 2023 15:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690299227; x=1721835227;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=bwErWehxMhbdRWuTj80zVRJJSyXu+UTSDAudDrSEDJc=;
 b=ASUajQufMalZ/R5UDkzba1rUGbYMlXshPilndXhOhKwawdxXTXyLdLo0
 a6B+D7ZaBU3ktiZ3HeCkrto1aexfOCAzPXb5f68RVen7BRyGf7HZZs3zY
 cFSw4JLosfTwLdMxpk8/MeV9R1EAVS2hMhpj4bQKB4pO9JAIP+SLGq/nS
 odaGTk+mDMF0qYmeTwhvIzh1t5IKo4diYZwwiH/aASCSYMVZKKvy5/oHE
 6Z4lS3sGedfzni0Ua1auM/5fFqbQJG0WLN10fmyvQ8AtSWZfaGchhLuE7
 +pWtEj3QHliQUOK7CB2bwdl5et0la0wVYtMB2CcuV2kZT/5STD5b3LaW2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347371120"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="347371120"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2023 08:33:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="720094816"
X-IronPort-AV: E=Sophos;i="6.01,230,1684825200"; d="scan'208";a="720094816"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga007.jf.intel.com with ESMTP; 25 Jul 2023 08:33:44 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 25 Jul 2023 08:33:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 25 Jul 2023 08:33:43 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.42) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 25 Jul 2023 08:33:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SdlaFBHdwmLNoUcwbhhZIWPGhlMZ92ietabAaa16kCbayz9F6kisgccGLjsKGOQdfkCVySDryJp5KB4QSwe7wmSKI9YRvc4Rz4WQRBBYTOPdUzJf8lFsWQklszC47Al6F/5tHRo8kfcTKzE3jn1dsmo+GDeZJPpiGTYtksvDbSN0u87mAo2NA9S+S49o/S2fFBpVDXlAfAdgmJItGG1+ORie10t7DTjvec71ZfRnyGX7IGhIoLu5J1YX18pRvcA1ove9+s9UgWRfErqJamEzo6H5IV3qxgQcvcqqjfAZcuTpOJJo2RYib7vW9btyyBErwKMRp6u4Aiu9cNSNfKwM7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNNyyg06Z6WhEs10wB4w5JxUzB8WO4onxGI5wNr2m84=;
 b=COCLy2w2eG9p8ogqFbkZ5dqdBY1wKXM3GNE9WI6LXsZPnJpxpn6VHtbXKJ9bVdsfeoQfquM4q3YuxV3NqN7nWbMEV09yz2Di4l/qm2O3UnKcuPQFmyx5qFG17GSR01QUuRL2CLm0/iRqfRMQLu7OWUKe3h/meXcPfm5k2h1gBig2FVr+Z/F1daK9K0Xh2SEUQSvbs6YbAEXN3PIOTYR2+mqAtYX4PHmaebYorBEo3c4H5NuX5bCVZjjwV6/ufcfRFFK76pR8Ct5rAjR9A920fdOOAynkI0jExVM7f04SwTruktVxO8Y0imOgQOlAFF8IdIJI9hav1fiFsVg4ZuQO3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH8PR11MB6904.namprd11.prod.outlook.com (2603:10b6:510:227::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Tue, 25 Jul
 2023 15:33:41 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::e273:56c0:2fca:f739%7]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 15:33:41 +0000
Message-ID: <5834d240-53cc-9348-3861-e010e70e2f12@intel.com>
Date: Tue, 25 Jul 2023 21:03:28 +0530
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20230725150951.3757483-1-himal.prasad.ghimiray@intel.com>
 <20230725150951.3757483-4-himal.prasad.ghimiray@intel.com>
 <d3dccac2-ba9f-82aa-c3fd-fbd04d4c463d@intel.com>
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <d3dccac2-ba9f-82aa-c3fd-fbd04d4c463d@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0043.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:98::19) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH8PR11MB6904:EE_
X-MS-Office365-Filtering-Correlation-Id: c750ff32-ca1c-41fb-38cc-08db8d248640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SfxNBrKvGMEGqpVlNuqsQ81qZYIqR/yb9zqy1ifzFNgxLlbLWtM+xOJexEjveDbuxci15Pj+4jQJr1fIFpb1nnmwvyuJMlSucmtsf61DvyCSft7VjbtB49bJQF1wzkKeKZ4JrI0Lg2Jaa3XHToB1hxM2c83Y+O8YCo/vSYGAQgdHt5sGQL2MpIl5gr+yl3MaZeM6XV0TwRfOcWCHJ83l/BXh/qu3UJTVU6XYCrBSRUzgZsL3PBndbSjmnEOfM4kpYniE96nKt7gwWg6/EkTsvoYtHbZOBndPcotyKrs+9iZTzhDnA0Et/MCWFxhIw+4M8QNMVg1f6CqGpynOSh99yba6MIRpEG3bRStliCP0gvFwkeRRVP3gmXjsR5Q/vQKmjBDK5lDyyuWt08Wx+M47pUr1iK3DJN4VbL0dmog1fNe2E8vnUbERiPDk+puJfK+htGkRJuJwAOpsuYeMVs4h66r8YaUmUd2cFJTqC89kgD20YzeBuw3KBwGbQsS1KJgJT8xGSGawVwrwe55UnZadf5bw5gmGxIB7mPSoHOWyoomnTK1voKSWuVfmzuOH9cK5BplUbOifbCo4wA7EDLF+9jiTAxd0HwtF8kATNsqTVfXvCdrJ+I+6Rm5ZbQoSj/6Ea4Nl5/P0jZ72MdfIpUTH1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(396003)(39860400002)(366004)(346002)(136003)(376002)(451199021)(6512007)(31686004)(186003)(53546011)(2616005)(26005)(6506007)(107886003)(4326008)(66476007)(316002)(6486002)(36756003)(38100700002)(41300700001)(5660300002)(8936002)(66946007)(66556008)(2906002)(8676002)(83380400001)(82960400001)(31696002)(478600001)(54906003)(86362001)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ljQ2ZWak91R0E1aXg3S3BseFNQZzQrMDVWUzJjODhhVFpjR3lIbzZjV0Er?=
 =?utf-8?B?bmJOYjZVUHA4RkVKNnMvT0x4V0JmK0FNbS9tMGVacUZ4Z0xUa0Jmazg4VGgx?=
 =?utf-8?B?cDFiYkczekJzMThQZ0FZbW9IOEJKMkRyamZNaGM5cG9MaUovcGsrNFJSbkNT?=
 =?utf-8?B?clFETVMybGw4YWVXaEZsNHZmWXNTbmFhM3ZldUVhb0UyZ0YvUlovWWNleEky?=
 =?utf-8?B?Yzk1U3owSEMrN1FJRW9LTUdUYS91NkRYWlJVVDNEUXFTYmx3SGFtbXlYVTVT?=
 =?utf-8?B?UTBwMndvMUI3dkljRUNYSndoSms2RDc5dCsvelpIU1VZRUFlV2pFU25qVURh?=
 =?utf-8?B?QVJsVVoyOUxVY0FBRFl5aERjdFdrUzFKdndKZW1ya3NFeFlwYUR4allJOWVx?=
 =?utf-8?B?ajdBNTk4THFEdlBhYjhidzUxQ1dGVWdqa0VxdGcwYmIvczhac1lEeDBWUkxG?=
 =?utf-8?B?K0Z5THF2a1UrY1NXU2dZY2ZwRlkxaEV3NW5kdGFQOEZaRUFsVzZXWk0xaFl0?=
 =?utf-8?B?b3AxS0o5b0U2dmNXc1dkNXI4N3pBdnN2OEVVNU8wb2NYWlRKeG82cHlidi95?=
 =?utf-8?B?WDBvQUJXbzVwMENyNFZGeDVDK3dsdDBSVGpyQ2p4M1dOSFNHZVFFUEFXUEQ0?=
 =?utf-8?B?VXFNT1dtTENkb3JTMHRSQ2dLZUFQaXFIRFkxN0dpRnphZ0hEb3d2VFBTUVU5?=
 =?utf-8?B?TTYvNXozWjRMdnJ1VzhFd1hlcnJTdE81emJ5dmlpMjJPeTdBR1F5NXpRODI1?=
 =?utf-8?B?cWJaMnFONnFuVDJLTkxxa1RyZUpSRDBaZkV6VEs1TXFoUVlzMkZueFQybCtP?=
 =?utf-8?B?Z3hIeXpVdmZZZnVlNC9oaDFZTENpcVdYa2hma1JtL0l5eDQxVTNEQjZyZitC?=
 =?utf-8?B?MCsxRkF6RzhhNUh4RnZlL3ZQdVRETjNndEJSVTVWbkVxc0tTb2ZTOVRwY2Jl?=
 =?utf-8?B?NkFYdGFUMXh3ZG14S05iTnJKeVBaV2hJd25ybW9aM25NdU9aa2JNdlE2ZGZK?=
 =?utf-8?B?Z1dqVG5wY3hhNTdOOW8zZUxCR0Zyc2xTeDh0cm1GMlFWRTlSSVhLR09FUVFU?=
 =?utf-8?B?Sk8zMU9YbzB3cDB1WWFUS3RKazlYa2ZQaUtpZ1J1MHpQM2ZuUWt2bjZQNEFm?=
 =?utf-8?B?L2hqTE5USVhzU3hTY0M5ZCt4QzZSNFc3ZU1hS0Z1bWlBWnh4eDZxeXBHejVy?=
 =?utf-8?B?cTFIYWYxNlF4VnAzazVHQWd5ZTR5Z1FNYWtlalFWQllZaENDVWJpbVRTaU1E?=
 =?utf-8?B?RWhoN24wbTlHN3EvRldrdkx0VjAxVzNxZFdEMmRlWk9XTWFsbThOK05MK1NH?=
 =?utf-8?B?NUJ2Q1I3U3lQNDFMVDRMQ3UvbFg0cnRIWi9mWm9tUWQyWWl3b3hlTFFRNWxC?=
 =?utf-8?B?dDRuTTJGV1YrdW00TDdLRXF0UEpxWHl2VWllUXJkYk1ram9EVEswcytlMmln?=
 =?utf-8?B?Y2RtckVxaWU5VkJEd0RZUXc2YWhheWNZWlhsQjdHZWJ0WmZwc29VbWJkbUxL?=
 =?utf-8?B?QUNrR0xYU0lsZWFETGZsZVFFNlBqQ1NrVEk4eWFaVm5SWVlWdVhWSEFsOWh5?=
 =?utf-8?B?QjRabVZwM1NHL1lIUkJTMTNHdVFrWndLUkJETkxxaXJrTkw0aVg5MDRLaStI?=
 =?utf-8?B?bTRHYmlLcVhUVnVhdjlHRUlQYktWY0NQWStiTDd0MFk1czkrRmd3OVdvSmgw?=
 =?utf-8?B?cWkzenJuOUxvV0lxSmh1TTM1NWNleEt2c0tPRTNYQWc4TTE0ZzBvSXAwQm5r?=
 =?utf-8?B?aG5OU0ZSQXBJR0MxWmNVTEZNZVJ2UWhrdE8zenNMUElaNVkyNG9rc1NPR3J5?=
 =?utf-8?B?L3JJa1I3WVVvYmdBWWZkKzc3enpmMTgvOWUrbThzSTVpa29uS1dQN1gvamp3?=
 =?utf-8?B?dU1SY1IvK2hpaWtyV1h1bGZ6QThKN0M0MGxGakNXa3pORm0wNVp0TEtTVDBY?=
 =?utf-8?B?eDVua3FBU0twS2hHbmF5cld2bTFDNHZxdzBkdk9OdXZTM0NmTzVTbkhycnlu?=
 =?utf-8?B?am1WQUtMcFFQVDN6cmpiYnJpblpTQ0JWWUtIUWNNZ28vL05aRUFtbDVJS3FL?=
 =?utf-8?B?ZlQ4SzAxbDlxUlJMVUxNZlZsclJVS2RNd0ovZGZvekFoMGo3TFJoTHozV0lv?=
 =?utf-8?B?VW42SlhERGgyOElia1ZQUWsxb3FGLzRlVnBsR0luV3NZZGVZb0NHTzQ1VUg2?=
 =?utf-8?Q?JVCljp9AfR5vbgNprlkSQfI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c750ff32-ca1c-41fb-38cc-08db8d248640
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2023 15:33:41.6995 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gkkCYuPMJgokciELGfKfboECvbHUF/4yOUCQxJ2/3CRW6+9gUD1s8+FVz1k1Mmcii1p5DDBmJ4nG1EsGLr8uJ0mvo3uoWy390RqG5ArhC+s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6904
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v7 3/3] fault-inject: Include linux/types.h
 by default.
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 "Reviewed-by : Rodrigo Vivi" <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>


On 25-07-2023 21:00, Nilawar, Badal wrote:
> Hi Himal,
>
> On 25-07-2023 20:39, Himal Prasad Ghimiray wrote:
>> Functions should_fail_alloc_page, should_failslab, and __should_failslab
>> are declared irrespective of CONFIG_FAULT_INJECTION. These functions use
>> bool and gfp_t types, which are treated as unknown when 
>> CONFIG_FAULT_INJECTION
>> is disabled because the inclusion of linux/types.h is missing.
>>
> Add fixes tag.
> Fixes: 6ff1cb355e62 ("[PATCH] fault-injection capabilities 
> infrastructure")

Sure will add it


>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: or Reviewed-by: ?

Thanks Badal, addressing in next patch.

>
> Regards,
> Badal Nilawar
>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   include/linux/fault-inject.h | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/fault-inject.h b/include/linux/fault-inject.h
>> index 481abf530b3c..f83ab2b6cd08 100644
>> --- a/include/linux/fault-inject.h
>> +++ b/include/linux/fault-inject.h
>> @@ -2,9 +2,10 @@
>>   #ifndef _LINUX_FAULT_INJECT_H
>>   #define _LINUX_FAULT_INJECT_H
>>   +#include <linux/types.h>
>> +
>>   #ifdef CONFIG_FAULT_INJECTION
>>   -#include <linux/types.h>
>>   #include <linux/debugfs.h>
>>   #include <linux/configfs.h>
>>   #include <linux/ratelimit.h>
