Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E0B4C4332F
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:24:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BB8510E183;
	Tue,  7 Nov 2023 23:24:56 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1638710E183
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699399494; x=1730935494;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oa1xap0XyNv3LZrjcjGK/54Btk8m+cMkIq0nVlo6iTE=;
 b=LP/sv3DzFAKOgiBaobiozPDr+CgNUtD5XgZmo0sQBZhTQq8llxwuXdTh
 ghhdKthGtd1rKpAJJFCroKi1onx6ajh99W43c343DhjfquNC90hhz3QSg
 NBIq0qfY0KWA2OuNESw6tWdjR1Qz9GnpyKGTJPURCTKOiZq4ssByvr02o
 sCDanXPgcaNZKYsUcdcdOBxXWSAhg8sCBUcWmlTRP0R1UKzruZPJGZrc2
 1e+LmXzn+a+mPjmgClBQ+eTagcjPZV1FjlzWBCURA+++wp7ocEeTBF5MX
 N0JNuJ6pcaNpdw/sI9xtlLEzwCFLeWGYNjtHyu+62Js4LiYT3PdY/ii/t w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="420751358"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="420751358"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:24:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="739310963"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="739310963"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:24:52 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:24:52 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:24:51 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:24:51 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:24:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LAuAe8CNs/BC9ahOhMhf8RN6HBZ3VXG8jNTDvxr513VGDmPCgGsS7CtaaS527rwsxrEEyntp5rBN2Ag4ftJaFrJz23Stcf2IyR7DYSp1yUj8QvoPzWap+oUNiUA32gsji2Oaioq8ne0yh1Fm3U9pvh9s+OhVcX7+YAqqlK8LxZ9H4QVrieFDbJMtusc6eZF0+L1PDF1/e5HNoGHtkdO7VnaJGPk38s43I9nQ8RANtcQ7Yycwx8jW9pHtzNeeOi4GSi9Wz7608w0szV7qCAepVAn/fQnApQW5OxRurr+MGGFBFSRzmreJYaf009lkxEVC9n6wbXiaZptb31sfcpmqUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w3GaHdgu3jk6QKSxyvx2mvtDt+6pVTSB5a1No600Ta4=;
 b=L3JEFWgw7C+duLDZRIt10tiPYWt4ATZ2tTKgKVr0/g11hgIeZDs3bmVwL+PJA/lBGAIp4B74P/Dtsa2SLdxwT57mHzOfyrQ4S/at2+Pj0IN+ClrVQwtiK+Cp9vatfjj5cUfT0uLLus7E+YSAdCx2dzMvZnLzVGYPGFA5QlDb6VtYMGwRQ+AZ8CGPne13kC3rWg4abgbZZ47ypZpMXyd/Uwq9QDHtSTrapxq9F9CammfRUQzf7thCu4MfaXjqs8FOuM+00EZBBCjhOYizZKPoNAVg/qGccLG5W2vAaS2OGxixCzG+L7nwODQOlW6uNIN3scFORyetl00WdsHERGxpoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by BL1PR11MB5464.namprd11.prod.outlook.com (2603:10b6:208:319::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Tue, 7 Nov
 2023 23:24:49 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Tue, 7 Nov 2023
 23:24:49 +0000
Message-ID: <ca614647-cdcd-4166-b8a4-d7affc66dece@intel.com>
Date: Tue, 7 Nov 2023 15:24:48 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
 <9cc88767-fae0-4405-b4ed-1e49bf81b654@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <9cc88767-fae0-4405-b4ed-1e49bf81b654@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR02CA0021.namprd02.prod.outlook.com
 (2603:10b6:a02:ee::34) To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|BL1PR11MB5464:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7043d8-6d06-496c-5561-08dbdfe8bc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2K7xs3/C4VkLDqYSyDyB50xG7i//wHsYGW7loNk3Ey/JUxqzQXYIf8RX0uQyuvFCDfsgPgYANvz3KTcAMuV/oJG+C5XLId2D8ZH+XbCewO7je8nBThF6l5CsYwHGsIw9lzEUGvUhWcI490sVOxCJw24WAsMXK9S77TTWTL6rDBk6XAdMFb2fOeorHHx32wB1zqvkP/hYdnOTVKl/y/KNMJlJ7ecjt1X9BfGs0lQfKq9Q/3PF7W2mh5VevNQvtrEa74enojPrHkJPF0tuge4TPiw/gxHc+cBnMRfYxkc+ZZMAoWImMW0/f/zf/YcnbMl1fCukmgKrA8YSmbPz3NT3pxyOsY1j/5ErjNf/fIEJ6He2YJU7wqME69rqg0TveRYw5HSNJeq5G7uhSR8zCMTxVeTRLhqX95KiYcTu2zvESzIBfTjgXH2rKc/ZxGt7nNnLHswOjnQ2qwxkMLSsvAoXNYOtSYBGGThzwK3HOqenR6mNieH2AxxAlCkUBsQGF5km95jaVKEcgB1BC5zDF3U+ofIsIidceVjVaP5KmqdS568c6CnwNwH2p7X6Uz2t3dfYjTF3rGAIRtaHpo0MoXNDXd18aW54B2ZWJhfyO7lfIBDWKwHknsbUS1MiNu0LoNTCxjgWXLxdmDZE35psMGUnBoqPTx2uhXq2vH8ey9MIsFu8/YsxC800Pc133qSwMREz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(366004)(346002)(396003)(376002)(136003)(230273577357003)(230173577357003)(230922051799003)(186009)(451199024)(1800799009)(64100799003)(53546011)(6506007)(83380400001)(38100700002)(31686004)(82960400001)(107886003)(2616005)(26005)(6512007)(41300700001)(86362001)(2906002)(8936002)(8676002)(4326008)(5660300002)(36756003)(31696002)(66946007)(66556008)(66476007)(316002)(6486002)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?endKczJWNTVoS3MrYXJnQTI0Z29KaU5jaEhIM29Lc2ltNk5WRDByWHRaN0Zs?=
 =?utf-8?B?MUhRd1pNOUNQVW8wRCtaWHdYMVZIVUluRDFOMmUraFl2aGh6QTlSRWRIckZD?=
 =?utf-8?B?Q0htc3pLY2FnM1JNTXA2MjBOeTc2SnRLd1VJYVpUN3RFRFJ3c0tXVmRaSy9p?=
 =?utf-8?B?cHc4SGtBemp1Vmo0Q0VxOUJhQnp4SjhUVHo3QXNKenFELzY5M2UweVFaS0JT?=
 =?utf-8?B?MUc5by9nYnFDeVVScHFBbzE3OWgza2hjWnFkSHlYamVmY1U3aVRvRjNFVmt5?=
 =?utf-8?B?RUlPUUw5TVJlNGhlS3VzazY1RHpsZjFVWEJ0YmREa0YzSjBRWXJXS05iUzZS?=
 =?utf-8?B?SGRVM3AzdVgyMkZLMEJJcVNudWEvZmFjM0ttRkZvYXBEelM0elVjSjR3Vlh2?=
 =?utf-8?B?Q3ZKdHBIUDFqSHQwWXRLU3VBM2YyVlhkL0JuZWxMOVVqSWNpTy9wczFWOXFn?=
 =?utf-8?B?R3N2cmt5RUNUeXNuOFRReWp6LzlHaVVnT3F3ME94ZDY4a3dVWFRQOC9kVDFN?=
 =?utf-8?B?V2JkMjFCQ2E3Y2NMYTg0Ly9yRGtnaldZaUpZYlBRUHhuVVF5b0ZUQUR2TGpy?=
 =?utf-8?B?N0NVQngvZHFPOUdCNnRpbjBkRm11SG4zNFQxeUpUZjE3TllvSFNCYjBhNWJH?=
 =?utf-8?B?Q3ZYVTc0NW5Ma2h6N2NxM1pRL0toeHNCQmw0Ykt5R0VvcVBieGEwOXlUc1lu?=
 =?utf-8?B?QTlKT3YzbVVqM3RWMGhQN2xOczBIekEvUXhRVmJUd1A4V05LcVNVMmlqMXJ0?=
 =?utf-8?B?Yzh5RER3NE0yelcyclVCL1hJZDRkVTFuVnZtWkhBZjUvTXZ1amZjRlJHMTAv?=
 =?utf-8?B?QVhOOGhpNkZmRGZ2TTlKUytsRDROSkZKVm9hUjd4WTJ4bjk1ek9zSVlrczAz?=
 =?utf-8?B?eGxBVHh4ZzFCODBrU1dIYUtKTjZCc3NPeS9jTGNNZ3k0L1lEdzBCVXk2dkJx?=
 =?utf-8?B?V1ZOZTY5NU5QZDZzS0p4S0FReWZqbDdnNjVIUEZBMTRoR0tXd1d3QVJWcUFJ?=
 =?utf-8?B?aUpJMUJOU2h2WjgrYklPYVNEdnorZ1lKV29SZmNmQlowdjExUTk1MVdyZWcv?=
 =?utf-8?B?TFNNOE5pZWR5bkgyakIvcXJpdkZjb3JWN2pra2VvRUNvUGM5eDRaNENhQVFq?=
 =?utf-8?B?eDdZZGNPSmwxZ3ZleVVjYU1LT2VQRUZuNUpjeTRzRm85QkF6ZTM4Qkh1WkEv?=
 =?utf-8?B?UGtpRHI5akJiOVA4RjZ3TW1NUDR5MGNyYXB2NzVjV2EzS3RIKzlGNW5Bb0Nn?=
 =?utf-8?B?cE90QzdmRGJmSHdNL1RCM2hLc2lia2VBdjIyV2Y4V3krTFFja1hDSVpwVWJW?=
 =?utf-8?B?Z3dhTTR3dVlmdGZzTExObDJpbXFOc21XSXpoUTV5eHp2MzZqSXVOTHNtT2Fy?=
 =?utf-8?B?cE0vUld3WXJvMzdCMVU2WEpsbDViYllyWXFMZUJIVlRaSFlBRzAyc1ZjT2dB?=
 =?utf-8?B?Rm1iMDgydGNzQ2NBa0NLNktyUzBrem85TWh0VkNxMnQ1akdZSnN5ejVZdytB?=
 =?utf-8?B?UEplNFRRZHVrZmJJRE9NTXdBSW1JWjJoUXZEU0N4cmVxTnllSHY5d0Erc2lV?=
 =?utf-8?B?UHN4VG1WNzI5aDFLOXZQOWtVTTYrSVV3ZzRzNXBadkFDS2VHbmVwRnRuNWQw?=
 =?utf-8?B?VUNYZTRBd0VtOFhTZ2pJaHkraC9rMEZDeWptWUFSQ1ZjWUdoNFkySUZSd3lK?=
 =?utf-8?B?cisza0dpTGlYM2tUREh1dXpRS2Y5M1ZBeXpwUkk1cGZyUkh2NThkS2hIdHVs?=
 =?utf-8?B?cWFtZllydUd5NHZYeFlrY3RhU2NvcXc5U0JHSG00N1owTE9Ub0plYjNKZUNK?=
 =?utf-8?B?RXZNMVlFR3dFcWlrc0RZelhXRWRFdXNCZHBTVzlNeTVrdllCWnQ0WDl4NHFE?=
 =?utf-8?B?MUNJam9qMm5FdXRRU1NCQlBwa2FhQURzS3cxa054S1lKY05tN0JPZWpkOEo4?=
 =?utf-8?B?L3Ruc1VOUGNWWE44VDArOFk2SFk5eWhNaWZDL3M1eWo0UTJES0wrVVBLS3Vt?=
 =?utf-8?B?Rkw5RHRIS1hsN05KZlVhdjQrcmRLaEFqQWJUaEdrcXBvSzZvWlMwQk93MS9Z?=
 =?utf-8?B?ekx4cy9vMGVNbU1iTndKbVU5eUxiT2ZJUk54UjBsUHUrbE9Qb3YzRm9idE9Z?=
 =?utf-8?B?WVRDNFJZdm11MUVVcGJvSXFpdFlsS1YrTDZaKzhvS1JEMnpnRmR5dVE1WmhG?=
 =?utf-8?B?aEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7043d8-6d06-496c-5561-08dbdfe8bc91
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:24:49.3626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aVjtpcXT/JYe0KDyVfhJI2L3z2VyVrVsYwILY4CISuy7jgTHNarGbmX1/1ddyewU9ueLlV/1Mf5Gx9C3gEV9ID6LI4crPt8a/ijZ7uUoTUM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5464
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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



On 11/7/2023 3:07 PM, John Harrison wrote:
> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>> Major GuC versions greater than 70 will have the submission version in
>> the herader irrespective of their minor version number.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 3032c4f148d4..91d4a2272ee7 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw 
>> *uc_fw, struct uc_css_header *css)
>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>       xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>>   -    if (uc_fw->minor_ver_found >= 6) {
>> +    if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
> I strongly recommend that we update to a newer version than 70.5.x for 
> all platforms and then just drop all this code before Xe goes live. 
> There is no need to be carrying this legacy hack in the shiny new 
> clean driver!

How do you guarantee that the user is running at least 70.6? They might 
have an old firmware package. We don't currently fail if the minor is 
too low, we just throw a warning, so the driver would still load but the 
compatibility would be left unset in that scenario. Or are you 
suggesting to just fail the load if GuC < 70.6 ?

Daniele

>
> John.
>
>>           /* v70.6.0 adds CSS header support */
>>           guc->submission_state.version.major =
>>               FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>

