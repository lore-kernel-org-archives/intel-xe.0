Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2645EEEAA67
	for <intel-xe@archiver.kernel.org>; Thu, 14 Sep 2023 19:02:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACD510E2B3;
	Thu, 14 Sep 2023 19:02:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727D810E0D7
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Sep 2023 19:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694718121; x=1726254121;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=WE0ed4OQ8w1ylgdAUEiUAZbXoVaQmrWdPKqJmsxhwV4=;
 b=JM5dRH4jQHmAISs2KB6DRjcXvHqZF7W9t10U+zmmQ9Ak9sMru9Ayx72H
 851kpj0HVW1xcY6AUxjwc9BWY8Ce2UTTWy7z62shJUlB/aT7/L6lQBi7C
 7FYk1uwEXlBwrKFqFvRb4AT3YKb8U5AdBZOpBEZ4sJzYwaFDWVar6Ts5N
 d3JEkn22J4EFXY+qyRKG3y4iUEeiuwqgHWEpaZ0H6LV0wDIMuLgkDBb0f
 OJyLyFMgA+j+am7logUd4LJRbW/Ye4/AcB8p+EhHzw/EwmMmsGH8+ZsJj
 6hgESapec2of0thoUkLYfbaymC2C8+DItTXV4eVYdnYce5y2xajZ/xmLr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="409987403"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="409987403"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 12:01:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="814843152"
X-IronPort-AV: E=Sophos;i="6.02,146,1688454000"; d="scan'208";a="814843152"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Sep 2023 12:01:16 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 14 Sep 2023 12:01:15 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 14 Sep 2023 12:01:15 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 14 Sep 2023 12:01:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lStWP3cGQAGjduev4OiN44kAJAXGbRys2eleTyweolQQjoXShlI/CErv9kTl+uiY6oN3oBYpe0/xP/CHPmjFMVoZyILjn04X0qo26c2vedEqxNG22glQt4FF7wRuea51QR0uFizGXTAqf13weAfeu7BXRolXbekksYLU+MIzQ4A8R7dS4l4XsrdD3MoAjLdsFl455mSaWreH/7qKIrM/MDSNA5v6MWtabj9lSNovZXrtYFvP+gNRYvjOQqIwXkThfy3ne7E1KdtOMtmPVsLjIXcED56aAfxmh7vGwG109DPaqxggJJfLPKBYh53QGZ28XkU5Jmp/+gq5PTuQI2Vw6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZoCRs6ozrCWsoVgCjT8jrTh5j93o51o2lmwBb3uPFu4=;
 b=TvQhSnEZ11pSW3ZaBElpD9uknb8GnzPmHVK4eTDEraXIkoxX6ElszCF6YbSNcV0bIGGSlVLbWgGzVQF+C/sJDotAGO2cySJ8EUuxVJExwrjNpR7Dj1fm0uLKVgCkIiGZLhEJG/09gjw4kZ8Il6yAv891YVTACwHyN7echHqL+uWoZ7GugQFf/VmLATnQkR5Lg4yNlZPqIgEflUp0yrRfz04i+FypfBxn43HnzK1u+WCWo7DgpaR79srodey3iIHo1LJbtwRAapuZvmB4spHtMLakfuMauhCuv1fpBORFx9nQgvGbvZGccyftwkuE3m7bIfdNXKJv2xYPEyMYbFp7TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by CY8PR11MB7362.namprd11.prod.outlook.com (2603:10b6:930:85::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Thu, 14 Sep
 2023 19:01:13 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::6bdd:6fe1:4045:c26f%6]) with mapi id 15.20.6792.019; Thu, 14 Sep 2023
 19:01:13 +0000
Message-ID: <8a9f3ba7-3b6f-c786-5233-9ab98c4a8f89@intel.com>
Date: Thu, 14 Sep 2023 12:01:10 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Content-Language: en-GB
To: <intel-xe@lists.freedesktop.org>
References: <20230913232837.2811049-1-daniele.ceraolospurio@intel.com>
 <20230913232837.2811049-4-daniele.ceraolospurio@intel.com>
 <87msxpw5q3.fsf@intel.com> <ZQMSfcP5O8bRpkwO@intel.com>
 <871qf0x29x.fsf@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <871qf0x29x.fsf@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0276.namprd03.prod.outlook.com
 (2603:10b6:303:b5::11) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|CY8PR11MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ed12c50-7f9e-4da5-44cb-08dbb554f736
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K/iOQTPaNmCBEyLDOzq4tPEeWwFo06fxd3rQ5VILC8F1inXtqkGN9DokZe9YCItR+H+c092lJ8VdGFkedD0B1kUg1JXWI7AwAvj8H6LEx5T9fM9zS3R3ZF+W/1vQhOJApohLKJlfHAv+whba2ENj3ydXTCW2aDTFB10P7GBtSpfUyfO6v/7hLjEQKTxoF41XLJVCGlj2fIVRAjB1rlfrBGrdcoS/RATTK9IyVJuit0sXrPp8B1iUIeA/z3nfSrocPkJ2wCkbPHz3v0kj4NqDa7qVMZX0rXs4c0jEBt33TDmo9CNhCBA5pGhQFN8Ydhr6gdCB0XV2WllT/EoYdAGAIhRCH4uwRpFPxQYBe26w6mSQ2m2p9rA4exhpWAy36SuH6j2DpKcDaAb2CHRET2LIoOqqch2XrpjHqwGesfjh4i8RiosOYNZigvjj/AyWt7RRgChZoLQ7Gzg9coCatgjAq/+P3dQFcbgD5fdbNlHU8G3KKBTUdCwFWUG1PeQP1MdqgwvlflHwGoplktXtumhV0vIOCvlMD62iVS5Bdbefy4HqQgqT2odf5QyFMSL7n5wYApawSxG7KrCAeZ64o3835ulkQPiKlAuwIpZlYLpAKk487RCUTkDJjbk2ZJKPmk331rBzXTnQbWi6/qq1elmHeg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199024)(1800799009)(186009)(2906002)(26005)(6916009)(316002)(66946007)(41300700001)(66556008)(66476007)(478600001)(8936002)(8676002)(5660300002)(31686004)(6512007)(6486002)(6506007)(2616005)(36756003)(66574015)(53546011)(86362001)(83380400001)(82960400001)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vzd6MndxZVVicEJuekJIQzFTVGxNM3AraTNJMEZYdXJ5QzRTZjdGZ2FUZFJY?=
 =?utf-8?B?NlJPelB2YnpQamJtOHN5U3pOSUpLRVBDK0h5YmlpK3JkY0ZNYTBwZERPMUJv?=
 =?utf-8?B?TXB0MWw4VHZEUmRTN0JqejRza1d0Mm9mdHk5S013VmI5bDd4c0hOLzRvaXc4?=
 =?utf-8?B?SXlMMUt0TEl4WDl2MnF5aEQ3UXFwWjFEdCsxS2diL2lKc0diMjdnQ3ovM1FO?=
 =?utf-8?B?ejFQM2R1K00waWtPUEZFdTAvenllR1hOWXlxbm9vRC95eURqT2pydURhVmJC?=
 =?utf-8?B?WlJ0R1lCUUp4aXFFaWlZaFNJNGVOU0VsN0ZzSHhXUU41V1cxSnVCYlVBQ2dZ?=
 =?utf-8?B?ZUNMWkdwZW41d29ZL3N3TXFHZkE2V2tncUZ6M282L0NidnBLamZhbk9mVWNX?=
 =?utf-8?B?dVR0MU9hUFFjOW4xY21Zdit2Sm9uaWlSK1RSZFJKWG90cWdmSHRkWk1uYWlv?=
 =?utf-8?B?ZnRMZjhQUERWNmpLaldkWFIzVE42TFRsazRZdzE1MFVPaGZFbUtYOWhMc05W?=
 =?utf-8?B?bWlYWTZQUm5HRzV4WjIwUTUrdkl4WXZZVWxWTDJYR1hUYXNZTG10K1k0ZDNW?=
 =?utf-8?B?Mnp6ZDdTb0RIdTE2Rmo2SFdGUGxiZkZ1dXJHODVldE5DSXQ3aTdDQ1BwYVlj?=
 =?utf-8?B?anByazNObWRHLzZDYktIalY4NXVENDF1TE1DMjJ5TlN1YTB1c3dRRmcxWDgz?=
 =?utf-8?B?eXJNU2V2ZUZTNXZjTStkZUtISUsvYmxWQWtsY2ZDR0tvOWtkaTZuTVNlbkkw?=
 =?utf-8?B?MkxuU1NqY0grQnloKzdyeEllN24vQjV1REdqMHVPcVJVeGxtc0svUzBteTZU?=
 =?utf-8?B?NnEyc0ZRZC9RSnpKTHNQTVRLZUdZa0Q5MGhwOHRMTWt1c2Q0S01BdXZyYUl2?=
 =?utf-8?B?c3VYN3JYWk4zWXdlUlVlSE1JZytnT1RuSkpEMklzdzRZZVlDRmNiOUlMYWp0?=
 =?utf-8?B?alh2djJnTS9mOGgxVUNpQ0dTZDFsemtNdUNCWDJUcHRjQWVveEx1YkhwZGNK?=
 =?utf-8?B?K1VaQThLWGdnSS94ZnRXUHAvYlBSbTI0WWtmbWtLMlhUMWJqRFJ1RGo0WEN3?=
 =?utf-8?B?dlhvdlBYaTdOWE40bVZIclJaSWpMYkZpem1jUGZjYkxOVFJIQmkzWGFvQi9q?=
 =?utf-8?B?UDF5d1lCbk5SRG1Jd1FWTXFVU3A0eUhkeUlVdk9KMlZMVnBVc3Z1TzQ5Rnc5?=
 =?utf-8?B?S2xZSGx4aGNYbFE4cU8zbUR5eC9QcDgrUU1Bb2crSmIxMlB0aTcwKzFrZjJ3?=
 =?utf-8?B?RzVWanJ1WHlUWGI2bk0yZ2xMcWF2WWI2STk1RWhFV1RlRzFBK0VkL3BaTGRW?=
 =?utf-8?B?VmtwTThFdEh2MkVwL0pOd1lTWGQxMXI3N2MzQi90WXJqQUh2VUdDazBoSjdp?=
 =?utf-8?B?S2ZhT2g3UzhRbk9EbXJnVUpaK09SYy9oUnNMQmptMG9QWk0rWTdJUzdHbGJu?=
 =?utf-8?B?Q2N5NjRzUmM5TjIyZFhOdEg4U0dDaFJyWTBXKzJyZFZpQW5HMFY4Z1paMGV3?=
 =?utf-8?B?cTI2VE9GeDFqbGVHSlVqU2dyNlNycUNmUVB5RkNVbTRFZ1JIZHh4dGM4cVRR?=
 =?utf-8?B?OFRXQk1nbndsZ1RkdXg4QWgzb0FQUmFlcTBBMlNtaVlWU3VqRmhjSWZwcDhR?=
 =?utf-8?B?bG1OMGluK2hlaGpQelY1bzZnV01YWlFKNzdtSDFhUnpnSWYzLzRCem9sbXNy?=
 =?utf-8?B?U0ZlT2lvVWdRVDR2NVEzUnZpRFpJSjJicE1QUUx4amswa1BoUGZEZzBldVp2?=
 =?utf-8?B?RUF4VE5kL0tUZFFvS3pQcVpzbzhhNndsQ1Z4VDNtN2ZHRFlsZ1RMSHdVQldz?=
 =?utf-8?B?VWpWRVBDaGVUc0czUSs4K0pZLytYVHpQamF6ck1xcy92OVBub2xXcjZiMkVJ?=
 =?utf-8?B?N1ppS2JDeDcrWStkRVU2ZkRPT3owck56UGIwYXE5Q3RQY3RIZnk4SG5UQ0E3?=
 =?utf-8?B?SFdudlN5UUtjajNpaXlZNXJ5N210Rjhwa1hZSmpjUlB2d25pNlFReWFHQU9F?=
 =?utf-8?B?V3NYQ3VEaWJjTHQ3NCtCUVN6QXhENmFoKzhRVExDVnozZDlENU01Zjk0MitW?=
 =?utf-8?B?YlRTbnJPWFhXWGJsckkxSjZSSDJHc29EMFVYdGt2cldralRZc2V0VVNpODVr?=
 =?utf-8?B?TjRMZFRHZ0pzNGRub3RZMk4xelVjek5uaXZvOUo4T2IrTmdvV1RBeGIvdG9w?=
 =?utf-8?B?Nmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed12c50-7f9e-4da5-44cb-08dbb554f736
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2023 19:01:13.3723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0vuEAovAqcxMm3bERuKeBed5OaUKss9OHpqe6NanIopLGi6bpWJNMHeqBZMkKry6Gr7jezZ/dOfHD79Ia4k2vvVsgatkTc/VH125raQP6zM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7362
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v3 3/3] drm/xe/uc: Add GuC/HuC firmware path
 overrides
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

On 9/14/2023 07:22, Jani Nikula wrote:
> On Thu, 14 Sep 2023, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
>> On Thu, Sep 14, 2023 at 10:53:40AM +0300, Jani Nikula wrote:
>>> [hijacking the thread a bit, sorry]
>>>
>>> On Wed, 13 Sep 2023, Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com> wrote:
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>>>> index de85494e2280..0660017c3e83 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -30,6 +30,16 @@ int xe_guc_log_level = 5;
>>>>   module_param_named(guc_log_level, xe_guc_log_level, int, 0600);
>>>>   MODULE_PARM_DESC(guc_log_level, "GuC firmware logging level (0=disable, 1..5=enable with verbosity min..max)");
>>>>   
>>>> +char *xe_guc_firmware_path = NULL;
>>>> +module_param_named_unsafe(guc_firmware_path, xe_guc_firmware_path, charp, 0400);
>>>> +MODULE_PARM_DESC(guc_firmware_path,
>>>> +		 "GuC firmware path to use instead of the default one");
>>>> +
>>>> +char *xe_huc_firmware_path = NULL;
>>>> +module_param_named_unsafe(huc_firmware_path, xe_huc_firmware_path, charp, 0400);
>>>> +MODULE_PARM_DESC(huc_firmware_path,
>>>> +		 "HuC firmware path to use instead of the default one - empty string disables");
>>>> +
>>>>   char *xe_param_force_probe = CONFIG_DRM_XE_FORCE_PROBE;
>>>>   module_param_named_unsafe(force_probe, xe_param_force_probe, charp, 0400);
>>>>   MODULE_PARM_DESC(force_probe,
>>> Not related to this patch specifically, but, uh, why does xe collect all
>>> module parameters in one file like this?
>>>
>>> IMO there's two reasonable ways of defining module paramers:
>>>
>>> 1) Module parameters defined for static variables in each .c file where
>>> needed, and avoid the need to access them in multiple .c files.
>>>
>>> 2) Module parameters defined in a single file, wrapped in a global
>>> struct. (This is what i915 does.)
>>>
>>> Putting all of the variables in a single file, and exposing them
>>> globally is not cool. You want to limit the number of module global
>>> variables in big drivers like this.
>>>
>>> (Of course, primarily module parameters should be avoided altogether.)
>> Well, I believe this is my fault. I explicitly asked folks to avoid doing
>> what i915 was doing. Well, when I asked that I was more focused on avoiding
>> the macros and doing in the same way that other drivers were doing.
>>
>> I really hated the explosion of parameters in our internal version of i915.
>> We need to do our best to avoid, or at least minimize the amount of params
>> and I believe the macros is like an incentive/invitation to bring more.
>>
>> Then while checking other big drivers around we see that there are many
>> drivers doing the same extern exports as xe.
>>
>> Would something like iwlwifi_mod_params from
>> drivers/net/wireless/intel/iwlwifi/iwl-modparams.h ease your concerns?
> I think that's exactly 2) above. i915 having macro wrappers for this is
> an implementation detail that's neither here nor there.
>
> BR,
> Jani.
Personally, I think 1) is the better technical approach - hidden static 
data with a publicly exported helper function if needed from more than 
one file. The 'data is not an interface' is a very valid point.

However, from a driver maintenance view, I think having them all 
collected in one file and living inside a parent structure is the safer 
option. It makes it much simpler to ensure consistency of 
implementation. Maybe make that parent structure static and wrap it with 
a helper function for retrieval to help reduce the global data issue.

Although neither of those options helps with the bigger problem that the 
module parameters themselves are fundamentally global no matter how you 
code them. As in, you can't have guc_firmware_path=igfx_guc_x_bin and 
guc_firmware_path=dgfx_guc_y.bin at the same time. So when you have the 
latest cutting edge discrete card plugged into a older (but still Xe 
supported) host system, you end up breaking the host in order to tweak 
the discrete.

John.

>> Thanks,
>> Rodrigo.
>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.h b/drivers/gpu/drm/xe/xe_module.h
>>>> index 2c1f9199f909..e1da1e9ca5cb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.h
>>>> +++ b/drivers/gpu/drm/xe/xe_module.h
>>>> @@ -10,4 +10,6 @@ extern bool force_execlist;
>>>>   extern bool enable_display;
>>>>   extern u32 xe_force_vram_bar_size;
>>>>   extern int xe_guc_log_level;
>>>> +extern char *xe_guc_firmware_path;
>>>> +extern char *xe_huc_firmware_path;
>>>>   extern char *xe_param_force_probe;
>>> Basically *every* extern in a big driver is a sign of a problem. Data is
>>> not an interface.
>>>
>>> Yes, also i915_modparams violates this, but it groups the stuff together
>>> under *one* extern struct with a "namespace", if you will.
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> -- 
>>> Jani Nikula, Intel

