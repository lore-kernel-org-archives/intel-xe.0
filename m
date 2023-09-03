Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0654C83F2D
	for <intel-xe@archiver.kernel.org>; Sun,  3 Sep 2023 13:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0770C10E03B;
	Sun,  3 Sep 2023 13:31:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E92710E03B
 for <intel-xe@lists.freedesktop.org>; Sun,  3 Sep 2023 13:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693747880; x=1725283880;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=fjnXDy6brpwaC+XX6fbGblf32pFHixl55bstD7eHyx4=;
 b=XIWuRuihae+eELYWlyXHcHlsQIM/D/s+zJFixgevCyrLDP6Izyhv1mL5
 kzoBtNBxAmeHpoON4PfBBF34IjtH2SgVpX817hGYi6lK3XAy0KjLVhSqu
 ixyIE3Ih/NBvJnUrAaUJMUxbSmu2nOTm71QNJ7zOVzP7IAManOb4++It8
 o4J8WV6nxj4kt0WkNO9ogl/t6w03NY0XdJgsqye4RTzHIOfLyI+V2QcLv
 qtVLHtuzaBOuYH2LsX+YFQkN17O9Oy/pg/72GTEKoQrbjblL9KYfe+gDc
 XXVIEZIhmhGW30w5XuZ/JZ++rX1+UyUmxkn8WCATjoNzwohYyK2FitVzb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="356765560"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; d="scan'208";a="356765560"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2023 06:31:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10822"; a="734045634"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; d="scan'208";a="734045634"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Sep 2023 06:31:18 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 06:31:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Sun, 3 Sep 2023 06:31:17 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Sun, 3 Sep 2023 06:31:17 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.174)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Sun, 3 Sep 2023 06:31:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=djrwLV5/9pE+QfKb6HGdkePa9sYqWxlfYv9S1wzCPamPDJ7XLeMo5tzpUoG1kNAom8Po7D/QrrBit8tLGY+bZkCE3Wc45LBXezbkDGgApVX2KnCnNzCSS31j4KnNFpE5+aCxeGvCbGgxwVjNng+QisUZ3KY0WwsKMeEsHLmFCD8ALSrfL7Lk/5FNW87PC7xInXap46aGC9qvo+LvCeXZOyip9AdBURF0rJn3hKagoNPRxh6tSlERbAxiQ7xLEyEsMQ0DdXkn+RUspnMZGfeNUhpTrAtj28QixUNObCxYHkQTGmoL8139ufl91kmGL51VE8+DjnS3Irmp6OD8L5zWcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4yhJkAQPfjRwK6hKQT19VI6RIFUTRTIhWnU8hLnkbE=;
 b=CfK5V0ouIXG1FSLlxpcL3u3f/4j3Wyl7B1P2OXzckG5UV0uxGB+HJj66jEH4wwm2blXUiz61NFJ4uDMON0o7Lea06s+0BP3WJlWOkOo/kYoLIb7Vb5uaENtkQYoeH3W1k++KyKJq6WtoCF7Q2oY1nv5quYxq0AgLNckpHvXi3cOlXYYA42KiB3nbv/tHGogVMKj+HSwQKXPA8tyTTSRHVS1EO9bxgfaaHDH5fnV7ZEJnxUsq4mgUeR2gkkjjIb5jBPiY3Azepe9RNNn2CBss7iAGJyBP/Yoab5ulRw7pCbPO1N3sbj+qzevnE0kqSLDCuOZS8t1+6J6wejoUFxKklw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 PH7PR11MB6007.namprd11.prod.outlook.com (2603:10b6:510:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.28; Sun, 3 Sep
 2023 13:31:05 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6745.030; Sun, 3 Sep 2023
 13:31:05 +0000
Message-ID: <42c5b687-7827-9ca3-abc5-66d094e726e6@intel.com>
Date: Sun, 3 Sep 2023 19:00:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20230901121545.361436-1-sujaritha.sundaresan@intel.com>
 <20230901121545.361436-2-sujaritha.sundaresan@intel.com>
 <ZPJK5iahuG41pvcF@intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <ZPJK5iahuG41pvcF@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To DM8PR11MB5653.namprd11.prod.outlook.com
 (2603:10b6:8:25::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5653:EE_|PH7PR11MB6007:EE_
X-MS-Office365-Filtering-Correlation-Id: 015c961d-053f-4f81-8fcf-08dbac8205df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CUq8PAqyGrEg/ki+oNb7oIzECM+Q7xlTleyQA+gSl8Ht+s8JVnDuISEHQ0GNjmeLC9PDZTU148r+Pa90quZdy40Ot5qZIAATg6yrfdn/BdohDjFyaLfg1pAFb3hDeA8MS9//g+JDHs6p0yvbeIFCODbiJaw5GLRa0EXz4sWH+2SbpiquvvRKmflOGpDtkC9xZSTqxa/QeDFVAi5cEf0pU1X6EXsNS/9n+X9vPP4n8ZShoNK5YGcTmWyCRWfr42BKUvC+t2SSEYsFSK25s89Qs7kXb+EPhf85oRKyQeK5C2Ar6Cewm7MSclQM8fxF+Sr6knmZxKwI8G9xgKOpdwzFkzbzzzaF4D132a+sMlZoTU6olN4K8NiscnDMoR6Lg/a4NUq9IfBHFNmbh8BGW1p6E0+36HCdawbwAhysLIQa1YLnHdLIz/rU12/NQE1u/H9qt7L8gXWNB7bI5VZ8n/m1xRCZNwuV2W8HyCBOhDvaA+TGoBKcsktt3Ker7wfoBnIU/i3gMGwVDHSRJxBWOL/RB8RhgYqost7F3hrXTNItlEBJKmSRy9VdSWuVL9iJv0hIgzURy1JtK7kHpM3l3864OIfb57Ku3+K32qBC5b8MmmHglL6xZySL624uZNq+als8fXhqXyBEADZzRp6L81AibQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5653.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(396003)(346002)(376002)(136003)(366004)(451199024)(186009)(1800799009)(31686004)(66476007)(66556008)(2906002)(36756003)(66946007)(37006003)(86362001)(31696002)(6636002)(316002)(5660300002)(8936002)(8676002)(6862004)(4326008)(41300700001)(6512007)(2616005)(38100700002)(83380400001)(26005)(478600001)(82960400001)(6506007)(6666004)(6486002)(53546011)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFgzWkl5cmhya0s5SmJyTEpVYTkwOE9QRnVpOXZ2VFRORWx3NllvWm55Qmx5?=
 =?utf-8?B?b0VWMWRlYU55QnZXWXkvVGl3NDVmaEdDS2xYQmhMVjZHNEJiQ3EzRy8zb2pJ?=
 =?utf-8?B?MkRyY2h0WGtjSGJCNmJqVENtR1dGVFB5dmRSWDRTNVA5Wjdsc3Vnb3VUQnFY?=
 =?utf-8?B?SXYyejBaNjlYTU1saHBBWE1sam43QlBaUnNCWC9Xb0pVVnJ4OE00U1BtWm8z?=
 =?utf-8?B?ZmVyY0hCZzNuNTJLcG5pYW5WanNjd2RYT0pJNWZzN1RhOTFTTW03VkhLM05O?=
 =?utf-8?B?dHV3dVZhYVVWNmlSblYxWFNBaDFJVlVKUWxFTlE4M1Zjb09MMVRlWnU2VDM1?=
 =?utf-8?B?cUc4Tm5IRytOaFFzS3h4ODh4RVB0bUczR3RLazQwdm5VYlArLzh1WmZZTGJa?=
 =?utf-8?B?a3pRcFAxL2c4bXdXSjZoZmowMUZtaFE0ell5eHYvZ2hxMG1PUFhaMGFFQ0FI?=
 =?utf-8?B?ZzhScU9VUXV1em0rTlF0M2ZNaThBclpvMlRFQUltVVJTMGwzbGcvV2lYNnJM?=
 =?utf-8?B?L2tBT21vTVJ3NnA3RytTbXRFZENjbWw4VmI0NlR4bFhWaDF4K0dPQXBCYlVW?=
 =?utf-8?B?K3JGSm54VGJ0VUxtVEE3SE51SFpBNk1iblJoVi9vVGZlYVVOZ2s5RkhjZEMv?=
 =?utf-8?B?UDQxdUs0RHJSaDR4b0c1K3JLcUp3YUtnUVNqMHB6Q3Bpb1JPM0JHWDBEaVMz?=
 =?utf-8?B?WjhhSnQyUC9RSWRic3BwdUpRaHBmSGNibUtWclU4ZzR0VWhMd2hCc3M3V0o2?=
 =?utf-8?B?MWo2dlRIdjF2T3pPdVhpcE5UcjNWdnJKRG5Qd1ZoUnRQeXl0Z3N4dUczTmto?=
 =?utf-8?B?T05HaGdtMmxjOFo2WnBBN3Yxc1VJRGJiMktrM2poMjhDazdhNnVWSnB3cVQ3?=
 =?utf-8?B?b2lKOTZOUXlMUUNhWnF4eVZTQkpEbUphSUhETjNoWU9ZOG1xVTlBaHZ0Rnk1?=
 =?utf-8?B?MXcwSFFiSVZ1bEhHRENuVm0zU21WK0t6RUZQYnRCUGxKQXlaRVJrME9NdG9h?=
 =?utf-8?B?anIvanBXZXF1VVZjcXU5a05TRDZBNjh5MDdLK2orYmR3dWxvaUFEMUpybXc1?=
 =?utf-8?B?MUZXaWwvc25aTURjWmIvbWtpSTRxSVpSZ1FXVXBBQU5QWEloaVRIZTBsMHli?=
 =?utf-8?B?enBHaFNmd29RSTFpK0lnSGdLQUU5djNJSzdDN1ZLLzFzQ0k1QytLcURyUlVD?=
 =?utf-8?B?QTRDeFRHSFBSemYyUStLendWQ2hNWWEwUVU1aG0yRkRGMVdsaFhyVWg4Q1Nl?=
 =?utf-8?B?Y1B4K01uRStnSkMwT1JRZUZHdFFxZXo2WVdUWkRLa1ZaNTFrVlA0NVVTV1ZQ?=
 =?utf-8?B?d2JpelFFSmJHV2JvV2ZWVTJETzgvVXhoL1ZPTmllZzZlelYzN1RVZmxxWmhC?=
 =?utf-8?B?bEV4YkJOVWphN2owaEZnZkhIMmdIU2laVnpjcXcwakR5TXVRcW1jOUg2YWhH?=
 =?utf-8?B?amU1YnFOSDlneHp6djB3bXQ0OUVzM3crQ05RYURLaUZ1T0wvZVBnT1FyRVNT?=
 =?utf-8?B?ZDlyekQzbTJxNTB1cFFSb1ZpNmZLQnJTSHN4UmhYMkU3RSt6dU1lT094SG5X?=
 =?utf-8?B?NW10WjAwUEZrdlJnVGphMHM2UjBZdTlESTl6dWpRdVd0eTBhV3pRRUk3eDRm?=
 =?utf-8?B?YWhKb05lT29KQnZrYnF0VmcwNWxiRlJpdGl0c21RbFl6dm95Wmh4c1RGQWhZ?=
 =?utf-8?B?WFpvSWVHek1jNDNPbGwzVFhqZjl4OUM4Y3ZnMkJCRkJOY01Fb3dmTElNSmMy?=
 =?utf-8?B?QVora2RScTNPdStBd0xvZnl4dll3QXhWeDIwaXJQVU05VE9UVS9sRElBQlY1?=
 =?utf-8?B?eFVtRDhicUNGcjZ3Q2d1ekFUU3JSSjF6WnJkZHlTeWs0aGpYTlFuUk5WRnJC?=
 =?utf-8?B?YW82a1Z0ZW9yZGxmSFpIendoK0JncUtQUWpUVlFOdFVLVlJNaUtNWEk3dk9B?=
 =?utf-8?B?eUNnc0FCNnZlK2RrWnAwUzlBRUo4d0cyejI5QkJWTlg5R1BFN0JhQUFRUGQx?=
 =?utf-8?B?cEFuazVnVVNxUWRSSEJKUCtnc1NoUGNGM0tuRjNaZk5GZlFxdG9HRFJpendN?=
 =?utf-8?B?ZlJYM3FHNzY0cVdFcWhxRXQrdnlHZkZJWkE1bmxQTzR2WE10UmpaVjhhbURa?=
 =?utf-8?B?WnVnZ2pZd29LaDdTeG16MStyTTlVaGJMY3VQR29DU1dDcDl1WUFjV3EvZC9a?=
 =?utf-8?Q?L+zxuzdw/4WM4SpWFHr+ws0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 015c961d-053f-4f81-8fcf-08dbac8205df
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2023 13:31:05.2944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QG+AZXxciOA7d3NI4Ss24tbrpmpBSkNYNnGffJyG2PLnQ6Us9bTgsJtN4zwdQyQ2ZnQLXdUBusHAlm+AhaxGLXIMIkIQkr7ewviVBTcFM04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6007
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/3] drm/xe: Add a couple of pcode helpers
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


On 9/2/2023 2:04 AM, Rodrigo Vivi wrote:
> On Fri, Sep 01, 2023 at 05:45:43PM +0530, Sujaritha Sundaresan wrote:
>> Some pcode commands take additional sub-commands and parameters. Add a
>> couple of helpers to help formatting these commands to improve code
>> readability.
>>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pcode.c | 28 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pcode.h |  3 +++
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index 7f1bf2297f51..e45169f47500 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -104,6 +104,34 @@ int xe_pcode_read(struct xe_gt *gt, u32 mbox, u32 *val, u32 *val1)
>>   	return err;
>>   }
>>   
> a doc would be required...
>
>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val)
> a better name would be nice....
>
>> +{
>> +	u32 mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>> +
>> +	err = xe_pcode_read(gt, mbox, val, NULL);
> but why not simply modifying the existent one to accept 2 params?
>
> int xe_pcode_read(struct xe_gt *gt, u32 mbox_param1, u32 mbox_param2,
>      		  u32 *val, u32 *val1)
>
> and the equivalent write...
>
> oh, and while doing that, could you please add the missing documentation
> to these 2 functions?
>
> Thanks,
> Rodrigo.

Sure that would work. Will add the docs as well.

Thanks,

Suja

>
>> +
>> +	return err;
>> +}
>> +
>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val)
>> +{
>> +	u32 mbox;
>> +	int err;
>> +
>> +	mbox = REG_FIELD_PREP(PCODE_MB_COMMAND, mbcmd)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM1, p1)
>> +		| REG_FIELD_PREP(PCODE_MB_PARAM2, p2);
>> +
>> +	err = xe_pcode_write(gt, mbox, val);
>> +
>> +	return err;
>> +}
>> +
>>   static int xe_pcode_try_request(struct xe_gt *gt, u32 mbox,
>>   				u32 request, u32 reply_mask, u32 reply,
>>   				u32 *status, bool atomic, int timeout_us)
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index 3b4aa8c1a3ba..8d4103afd7e0 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -19,6 +19,9 @@ int xe_pcode_write_timeout(struct xe_gt *gt, u32 mbox, u32 val,
>>   #define xe_pcode_write(gt, mbox, val) \
>>   	xe_pcode_write_timeout(gt, mbox, val, 1)
>>   
>> +int xe_pcode_read_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 *val);
>> +int xe_pcode_write_p(struct xe_gt *gt, u32 mbcmd, u32 p1, u32 p2, u32 val);
>> +
>>   int xe_pcode_request(struct xe_gt *gt, u32 mbox, u32 request,
>>   		     u32 reply_mask, u32 reply, int timeout_ms);
>>   
>> -- 
>> 2.25.1
>>
