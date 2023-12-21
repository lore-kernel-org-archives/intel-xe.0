Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22795C35274
	for <intel-xe@archiver.kernel.org>; Thu, 21 Dec 2023 05:17:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE43A10E65D;
	Thu, 21 Dec 2023 05:17:26 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3936010E659
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Dec 2023 05:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703135846; x=1734671846;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KaiRFpwcLtsJysGftqLgYgwZ9SQf7AwcuBCPrhGn3l0=;
 b=guua1OkZpul4m8k0MsHFsruZ+H5rvSHehrxf5bIzCt4vcL62VuwgGiId
 C4R6lFOXnTxTYUukP94eZTYPuXFoU0ys79oU+5dDZX/9Pdvib3mahYtOT
 2iraPYClYmUuJMMiYi2ws8m3iK3odnB00fQOSFGrkINvueMMPpJdNDRq/
 nA2vX1tyG0gzbl1/eEsGuBpnwjyIRIfeX9NeYDv2XkJWpmXle4hWJmEpC
 XwjNY5ACuWQYYnToZaYLclPxoIu1nJOKbbM0LRmjO2XR379qAx/Omv0YT
 TcH3yrcvQFilSSJP1puSVC0PMhwjKKnywH2lD6EE7ZBL9zLzkDMwgLdeK g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2758161"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; 
   d="scan'208";a="2758161"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 21:17:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="846995890"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="846995890"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Dec 2023 21:17:23 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:17:23 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 20 Dec 2023 21:17:22 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 20 Dec 2023 21:17:22 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 20 Dec 2023 21:17:21 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AiRqsvJ8Hwu8KTn0tHOWLUAoUURRpKWoTzHkT7JJLACJ70diWq9CyZh2cnVhn1vgpOV587zpJ+FAOJtFkA70C2mBL2fLbUqgcqOHVbsdAWM//OGs/hX4vPxRP+wkc/ZsPGyOKBL8ww6tzxImzJYYZwLR4Q0k+mnvHgKo5aFaVoOBNdIXduBNySZ3a07SxfvqzwXawoTK6q6JZD3LZJscLOIS/WQgMZrT7TUDloqFxJ3g/rmx/cDShPW/TwzmHX5qBQzp+Bcy325TRUM+sWaMdQnV2xoecFUzx52Klu9v9pWVdIIVvwqBiJM8o/fGQFcbW5IwUpT8ytx0f+RV7iTwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vzx0XfHLhytZlL+kZ6vnQCuldE24QNMHPH4hGmmPrAc=;
 b=PIIxb4++kRR0QLgzltpFoa021JnHoBNntHkktknyf5cT4o1LTJSttuLsbZDJzljNGL1ODp+Gj1EIJ61+/boXB2CzzHtjAgvpfvOa2+LINf+U+HIPWlgiGbNlA9YW2WQXsqc6LoH6Hx3aW0RekkDTIHBbOpuhnBqPT33wpELrVvC5AaGJOzCHAtiJ7xFe9ijKmG+Q5Ndwf21SDt8JmbZ07ISepx/Ht5KAYDCHAZXNLBEUlaBvBKXZ1g6KnKS2j/NpA6mPaMmc/tWOnBV01fxRgwtrblshf11WcknUinCKpiJ2TbF+HZ2ics1SHld/Rmk2OdDJ+3pV97kD/JqTEKYk8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 BN9PR11MB5305.namprd11.prod.outlook.com (2603:10b6:408:136::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.20; Thu, 21 Dec
 2023 05:17:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::66b5:7551:319c:73d6%7]) with mapi id 15.20.7113.016; Thu, 21 Dec 2023
 05:17:19 +0000
Message-ID: <6567488a-6014-4dc6-82c9-9de9f598744c@intel.com>
Date: Thu, 21 Dec 2023 10:47:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/8] RFC drm/xe/guc: Expose engine busyness only for
 supported GuC version
Content-Language: en-US
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20231207125802.3730165-1-riana.tauro@intel.com>
 <20231207125802.3730165-4-riana.tauro@intel.com>
 <ZYOML1pbxg8akc1D@unerlige-ril>
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZYOML1pbxg8akc1D@unerlige-ril>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0101.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|BN9PR11MB5305:EE_
X-MS-Office365-Filtering-Correlation-Id: 110246e6-605d-4aa9-d101-08dc01e41a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eLIi5mmaWg77rYbMNMf5UMAmifo5+r3oQ2V8EZavHpJ1Rhwxuac2Me55piMfXqkpXDyF47ztiquRKlTWyzeQw7JOOtvfHPuVKpC9Z6im6ya0s1rzwPQAXeyNklPDeNp2YbmamBbjRADxCjMlayk5h0xCW7XQmvfCp/5mkcO24Xtgod+ileKpQ3F6Wkw7lhvH0u0m5Fyh+nsy5GMeFBsOb3WQvhfDJM5mhBuuvCJxGcbPKVQqXViHInkyyygovRVtyErRo0l96hEb2/wOsxP4+8zKpKz77XJwg1P9arE7SlVvT0IMmxdEDRJBluk7SKLyaOeD/9gg3PWdw/TrM6mbKyKADRarWA/4qYZfz27gut9eWEP+qCPCZUcdOCCYoCdUCsRMkSmkHLdA2cc7x3wDN5ym1Y3Y7x9lnMC6sjjhiMoYGY9iVNqtFMHqNQuBcOjqlCd4GI+6VYVuhoBNQxMjFvELVMl4krPqvyeUxLuknsZdy3X4HF/UbNKQA1xgLBJvyFKTdjlTL2El1x1nBo/lI+Vl8m9/ZQAVwa1RUWFEXuDb59jg/HDzWJr8dnnFfdUnWmpDHtgvFOan7DWfDo6ie5dreSNEThNrTZXIDiMyOLgiccyln7AqO/7ZUk4ahUuUwsdBLcksvTyacbo2qLeWEg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(376002)(136003)(396003)(346002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2616005)(26005)(41300700001)(44832011)(2906002)(38100700002)(31696002)(86362001)(82960400001)(36756003)(5660300002)(83380400001)(37006003)(316002)(6666004)(478600001)(6636002)(66476007)(66946007)(66556008)(8936002)(8676002)(6486002)(31686004)(6862004)(4326008)(6512007)(53546011)(6506007)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmx5TGNrRlpjWm44R3JPa0YzVXlWZlJjUG5yckcwbWErelgvNE1QS3IvMTNo?=
 =?utf-8?B?VTd1dG9UcUk1SFJ3UndCdkQ5allmZldEQ0NNRmJhcVh3QWtGQVBiVEExaFg3?=
 =?utf-8?B?RlFraFArcjF4b0V4V1kzOXl3S1N6U2c0RklMeVRSSzZrTWhoUDg3M1B0bjdy?=
 =?utf-8?B?NitjTUZZcG5UdklCWWxEV0oyQ2FBbDBGZHVIZ2VEdXhacVkzN3V6OU9TdGZt?=
 =?utf-8?B?dCtITTlldXZMK2Z0QzdJN1VoV3d2TDdlQmxrQ1lIekRTY2JDdkdtYSs4Rjd3?=
 =?utf-8?B?UlVFSkNjSExuRDVlMjl0KzdoY0FCT3BZL2hTdDB2cUZPbWg2ek5DMUh2MUVP?=
 =?utf-8?B?Wncyd2Z3VFZETzJhTFRzZmV6TjZHakpKSUFSK3ZQQ1k1UWVVdjc3bGhWNlpW?=
 =?utf-8?B?VG4xb1JQZ0tWRHlTdi9VSTQvUDhMaks5MHkrN1JreFJ0bkdERHZ0VXAvMkF2?=
 =?utf-8?B?SW5kNmhBcnNWbEtqMkljN2cvYi96Qng3QU92Um1QTUpFZGQ1Wm96Um5VSG9P?=
 =?utf-8?B?UFNXdE8zVzhHeG1BVCtaaVJ1ZDhRSjlzUU9RcVp5NnZoWXA2MFJ3bU5uWFlE?=
 =?utf-8?B?eVF2MTlwWHR6RzlGRnB3L3ozcTdkQXFJcllOVldaV0pEME1KekFEWjdnSk5X?=
 =?utf-8?B?WVY2YXYrQUplNjgvdTNlc1pacENBVVl6UEk1R0Y2YW1YR1VtemdVSWNsQkJV?=
 =?utf-8?B?UW01bVZ0Ym45NEk1VUdLQXhxK3Z4OWdtaTIxZ3ZjR0I1QVN3Y0lpNkxNc1o5?=
 =?utf-8?B?UjdFUzE2aTRnRE92K256QkJtUXB0eTVGOWVObzVUcHBUQlFsdmhlbDF3THp0?=
 =?utf-8?B?Mml5bTBhY28vOXVTTlg2U1EyQ1NxNG5KK2lzWTdQQU5mbzdPaDVZSTNpQWxs?=
 =?utf-8?B?bmFCYnovU3h6ckttRU00bjJRdVZSREZyYmc0MkhXVHd1QnFkK1dtcDF1aHR4?=
 =?utf-8?B?UUk5SzI1SDhKcDlnUldXaDBMeGhoUVFwU1VTQld4dmRmNjZZTW5zVWtSNDg5?=
 =?utf-8?B?eUxoVEZuQkJIVVJocXZBbG9xMklLRVIzVGl1eFBlaEk0L053eTZ1TXdyMExX?=
 =?utf-8?B?NHo2d296K3hLeG41ZjNBRFVoTmRBVmtHcjRCa0pna3VBbTY1dnpVSm5ENDZF?=
 =?utf-8?B?dTdoeVZ1eUJ5K0FCcVl3L2pURGpSUm9veGVodW52aklIdUtNUjBTdnNadW1x?=
 =?utf-8?B?QjA2NlBHVXBnZkhydGRRaUpaZUFJSXFGS3plSXpvcFJFcDBHMkJZQUJYQ2VM?=
 =?utf-8?B?S2N6TEdzZEZjRm82c2JlVUJHemEwQ2tvQXA2NHJ6WGs0NmZJSit6VkVoZFhG?=
 =?utf-8?B?WFVpcWQ3Z0JqeXhBUnk2bHZCUXJmZkJDRDEwTXdPR3FzbXlRY2tuL1YzVnRL?=
 =?utf-8?B?eHk4VnNNK0RJN0JXNmdxa1pCWk9kOC80UGNzOVl4MG5UWXJwN0dTaEtGTC9a?=
 =?utf-8?B?cHpjL0liaTdJa04zRHNUdFYyOXNZLzBnWGJXdWdlQytOcjQ2Qk5mYnFrait5?=
 =?utf-8?B?cDBYUTUwTE1EY1Z2ZktVYXgwK2k0ZjBUYWdIYllZMmd0NlRWN0FaTzZNcGRy?=
 =?utf-8?B?T1VLb0lUNkgzNmp0UnMvdVpya0YrQkRJMVlMa01VM2lXSm5CK0VNQ2duSHkw?=
 =?utf-8?B?VEhsb0txLzA4c2xTdlhCckFWUUM1Qk51Tjk0cHdZZDgvT2VEMTVsWW5WWkNK?=
 =?utf-8?B?enlRalFXZGhYclNKWEhCcUpCYlBDanVZbEJFeDNscmIybnZ3Vml1d0FuUk9S?=
 =?utf-8?B?SHZEaFRVUytQbnlCUEpzM2IxbDRKWDE5aVR1UzBHRWh0MjFLYTQwbnBmRWZK?=
 =?utf-8?B?SGJDd1BVTGd5VlVGV0FlMm13b1lzSDZHNWJRYmpwRTZiZ01oSDhvdkFLbm5N?=
 =?utf-8?B?NjZIbmhRVksvODBpSldvaEpTR1VtZlBuSkVYZEoxdUxlZ2gwSkljcmJnN3h4?=
 =?utf-8?B?UmY4dG5BRjBNY05pVEs5Y29lQ1MwS1Rjc3cyYzJKM1h2cld4eVREOWhWcWQ4?=
 =?utf-8?B?SUU1NlMvdWNoRU9ZWEFzamJod3JBeGorL1B6eURKdHNicHJQdWZ0SUpHSy93?=
 =?utf-8?B?TUFDeGJPR2tScWl2N2Q2b25tdzV4QVNMZ0MydVQyOE1jWWY4dk9CTEpoTzNi?=
 =?utf-8?Q?pjWO1dObdiHHS3mppLIHTzEgD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 110246e6-605d-4aa9-d101-08dc01e41a6c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2023 05:17:19.0605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9Sub8cimUR6/QvA+hymfOd98O1HWHr0Zrcrd8B98MgwVwpfQn7e8EZ0yhZpk2va7jTtr6VauaYVFfTq2BYVslQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5305
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Hi Umesh

Thank you for the review
On 12/21/2023 6:22 AM, Umesh Nerlige Ramappa wrote:
> On Thu, Dec 07, 2023 at 06:27:57PM +0530, Riana Tauro wrote:
>> Guc version numbers are 8 bits only so convert to 32 bit 8.8.8
>> to allow version comparisions. use compatibility version
>> for the same.
>>
>> Engine busyness is supported only on GuC versions >= 70.11.1.
>> Allow enabling/reading engine busyness only on supported
>> GuC versions. Warn once if not supported.
>>
>> v2: rebase
>>    fix guc comparison error (Matthew Brost)
>>    add a macro for guc version comparison
>>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_guc_engine_busyness.c | 29 +++++++++++++++++++++
>> 1 file changed, 29 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c 
>> b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> index 287429e31e6c..431d1ca59d2f 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_engine_busyness.c
>> @@ -23,6 +23,23 @@
>>  * engine busyness ticks (ticks_engine) : clock ticks for which engine 
>> was active
>>  */
>>
>> +/* GuC version number components are only 8-bit, so converting to a 
>> 32bit 8.8.8 */
>> +#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | (pat))
>> +
>> +static bool guc_engine_busyness_supported(struct xe_guc *guc)
>> +{
>> +    struct xe_uc_fw *uc_fw = &guc->fw;
>> +    struct xe_uc_fw_version *version = 
>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>> +
>> +    if (GUC_VER(version->major, version->minor, version->patch) >= 
>> GUC_VER(1, 3, 1))
>> +        return true;
>> +
>> +    drm_WARN_ON_ONCE(&guc_to_xe(guc)->drm,
>> +             "Engine busyness not supported in this GuC version\n");
>> +
>> +    return false;
>> +}
>> +
>> static void guc_engine_busyness_usage_map(struct xe_guc *guc,
>>                       struct xe_hw_engine *hwe,
>>                       struct iosys_map *engine_map)
>> @@ -80,6 +97,10 @@ static void guc_engine_busyness_enable_stats(struct 
>> xe_guc *guc)
>>     struct xe_device *xe = guc_to_xe(guc);
>>     int ret;
>>
>> +    /* Engine busyness supported only on GuC >= 70.11.1 */
>> +    if (!guc_engine_busyness_supported(guc))
>> +        return;
>> +
>>     ret = xe_guc_ct_send(&guc->ct, action, ARRAY_SIZE(action), 0, 0);
>>     if (ret)
>>         drm_err(&xe->drm, "Failed to enable usage stats %pe", 
>> ERR_PTR(ret));
>> @@ -104,6 +125,10 @@ u64 xe_guc_engine_busyness_ticks(struct xe_guc 
>> *guc, struct xe_hw_engine *hwe)
>> {
>>     u64 ticks_engine;
>>
>> +    /* Engine busyness supported only on GuC >= 70.11.1 */
>> +    if (!guc_engine_busyness_supported(guc))
>> +        return 0;
>> +
>>     guc_engine_busyness_get_usage(guc, hwe, &ticks_engine);
>>
>>     return ticks_engine;
>> @@ -127,6 +152,10 @@ int xe_guc_engine_busyness_init(struct xe_guc *guc)
>>     u32 size;
>>     int err;
>>
>> +    /* Engine busyness supported only on GuC >= 70.11.1 */
> 
> I think the comment can reside in the helper function and you can delete 
> is here and other places where this is called.
Sure. Will remove the comments.

Thanks
Riana
> 
> With that, this is
> Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> 
> 
>> +    if (!guc_engine_busyness_supported(guc))
>> +        return 0;
>> +
>>     /* Initialization already done */
>>     if (guc->busy.bo)
>>         return 0;
>> -- 
>> 2.40.0
>>
