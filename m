Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1225CDB46E
	for <intel-xe@archiver.kernel.org>; Thu, 12 Oct 2023 07:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FBA10E42F;
	Thu, 12 Oct 2023 07:39:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A7DF10E42F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Oct 2023 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697096374; x=1728632374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=w1NCTmgTKa0rSIm3QoeJpD8G65HgNZgP5iftTZBbJLo=;
 b=QgbbJNoe/hfiD6Iwlpt4X+PuUxQmjpceAgrBJPHXO14ZlyqXy6YKza2c
 R/BN78qCifO9wGHTWMDpjug2YM9XT++nxP+uW0UjDw5ATb84a06kxS8Tg
 gEXVa2ZjblwD6iAWhoMTLquwSe8toLVpxqc6ZXinpbmPJdnGGd2M28++S
 C7eE4KrwdgxYga7EhW3zxU/0rcujxYLupLlAbv1ivdVmaMfVBXU3oWyjz
 aMgeQ+fzQLH4RQr8+mn1qmgqDWUUF8CRnRjQ4gSrjOGDdeM7IPogsmqBZ
 bxpKmkFJTjNgjzHM4e5+5WLhJDojrAUFJUzm/nEd1hKyCZKHGrDujEa61 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="365130263"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="365130263"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2023 00:39:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="844892463"
X-IronPort-AV: E=Sophos;i="6.03,218,1694761200"; d="scan'208";a="844892463"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Oct 2023 00:39:33 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 00:39:33 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 00:39:32 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Thu, 12 Oct 2023 00:39:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Thu, 12 Oct 2023 00:39:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0I8q1bdXMSUUOhy3L21xhNZdCfxaKs6fxP8dEMXZe0HyWebmmMokQfM9r/gYZE83UMuKMm9bDTxhZIDb8f0yYbeeyUUWJA2Kzu8vNm5j5F+qtfAls/ygVfP1/U4ie9gVGzq31xH9I3DlOXCu7L2ltvXpgsd1xoEsdsxNJp+S5TsI2e0cwZTJ9xY8R96iJ4gt7+sq3q9YNw1dx4nKnUpLfePPjPUZfp9/DTGQiRcSkPZ/uBHoYU3jo7TIFqLuamTynuMOtBynJj4q/jfQ/5IAE71NYZZNUOFq640rZyWbTWkDKRXinbZkDWqmydZNrJnzaK/FNpWjY1t3UdpP2iDUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0dGMzDHL7BzDPaKYKXOvX5hWsCDA3MZO2/8ERAzsjYs=;
 b=D11GkQO8yNk/8+PqsmCHwpTw9ODHG8AaAgsoY0tVAU3z2Ne9xETUvjJFKkNBA/7ZDXIzdGHBiwWDQRMPgKTUSR/LRIT/M36sXVYzpZQi9UnAFrhytSZZM4Eelcaghs5hyj5xgBtLjzetpOrajcfPzUDCmt2VnLL5UItgsUqEUSzBGn/Xa31Qk7cHmdvNIyEUFnyRloPvYPlgJ/Pt8xSxyHZc7I1gNa+wM5uSzVQpWy0LA37Qaih59RAI6+fr9SDm+Q1VHenn5EEVYY7+9cIPyrAEDjqIyWhpTvm03DGR3Z9wuGkQnGhVSxvhvdVLDcvKKjs+KRtWbivAT3e0BD7vaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY5PR11MB6533.namprd11.prod.outlook.com (2603:10b6:930:43::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.45; Thu, 12 Oct 2023 07:39:30 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::c2e3:634a:6cd3:7f46%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 07:39:30 +0000
Message-ID: <a2383545-f600-46c9-abd6-56785151f80e@intel.com>
Date: Thu, 12 Oct 2023 13:09:18 +0530
User-Agent: Mozilla Thunderbird
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, "Ceraolo Spurio, Daniele"
 <daniele.ceraolospurio@intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>
References: <20230823050955.1226024-1-riana.tauro@intel.com>
 <20230823050955.1226024-3-riana.tauro@intel.com>
 <833fb5fd-2c95-08cf-5643-968dee6e5ca3@intel.com> <ZPDoLmBsGBONHKyx@intel.com>
 <ZQyNUexm787Qvoy1@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <ZQyNUexm787Qvoy1@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0137.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:6::22) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY5PR11MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 17cbc4fa-3888-46ea-0007-08dbcaf65e17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHKJD0fQmCxoeFO6IuhD60L7zjTa53m32peKWLQM/qpg9ZT9JWYeuKAa6ljA0IwMa9EePqcnSh9lLYpqXsXjNHFk3wJVkEUW5I33lZUW5mKwZDkS6a9G08tmf8T4zeJiy3qok9zvVnQlEE0jjaZ5RjIwgjsc1oUg5oy9P2OtVBfb12SNguag3x3bnr4ov3PWNX/YNVrtvSxFc8PLZiyOVR18ED1721hbcEnrtQwbvV3zNcDi87SXORPn0FxTSzPyaKabqlGWpGwy05o1eSiQfLLJ8S8Yoyzcg0yRWn7IT6N5aExRfuk22g6QljfrAo7r0W85Udu5fuSc5xNA2Na+crvLbgJwqNPjd4JSEXgAhNU/UBgVak4i4HT/lgyt+tSY5OqtGJ3Qh4jmVYaJ7/mZ2twbpFXEK/M4MDVvYbpzxEcWb6HO0Bezb1H2fiYDRImGETyDQ6zUlbknBeEkX4+pMQbvSiSGnWJf0Lp8xCtIBugz5vNxQNm4mK0TsOZ6Y2FEaKfAhUvIAf1ClsDgiRqs+XsVbEUWNrdofw1UlcnDsYsdyBtQgpGXGW3Xegff21hziUesSomYgvn6YZYX3GGrnHWGj7lg5HL/obeD2qUkhHohdRXXgJE26T1vJR+I9IAXkI0MGqhXvk/8QBmJdHcZhUFiauKlT8MxxUvlzyvnLVo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(346002)(136003)(366004)(39860400002)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(44832011)(6512007)(8676002)(8936002)(6486002)(5660300002)(478600001)(38100700002)(41300700001)(6666004)(53546011)(6506007)(26005)(2616005)(4326008)(6636002)(316002)(66946007)(66556008)(66476007)(110136005)(31686004)(83380400001)(82960400001)(2906002)(36756003)(31696002)(86362001)(32563001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dloxYXp4WFE1TnYya0dRMENZcmVGTFZoejFkUEhFd2V3bHJWeXBlYy9BSWJT?=
 =?utf-8?B?bzlDRXROdXJFS25xTWpaa25KanE4cEk0Ujh0ZmlHa3l1TkpueHVDSVRlMC9w?=
 =?utf-8?B?eGNaRWo1N2dNdkRDOFlRY3JrNm4wVThqRFlqcWRVUnMrZVM1Z1VSWXdiMkZz?=
 =?utf-8?B?di8rMlpJamIrNkFrMlBiYUlEYjFpU09Ld3FsQnVTYzA4dGY2ZmxTZ3RUR3Ra?=
 =?utf-8?B?Wnh6b3QrUnhic08wanlPMmtRRjc3TTVSSW1vMzZhQTVWNWprVzc5bzd0cFla?=
 =?utf-8?B?MnZCWG9Ob0hhTTBEVjBqZjQvcnlTNDg3NnF4RWpGNG1FeitJK3JwSWtVRGNw?=
 =?utf-8?B?VTRGTDc1YXkyM2ZLT3U4WG91c0tWZkxKWExRdTQ2Mmo3K2JWZHo1cExZdk15?=
 =?utf-8?B?cEZPbHB5Ukt2QmVOVm1TT3RZQ2JjNXA4Yjk0eW9SNU13K25FaEQ5RFlleE4w?=
 =?utf-8?B?NS9zUWZrbVJ5dkpQcXVnZGJTRVROL29nS3BkVWRJb1RGak5mVzJHdlBtQVBV?=
 =?utf-8?B?UC9JbTNXTms1N09TYnVET1lUd1hpZ0JoQXlKMURCY3RvU1A5WTJ0NjVNSDFR?=
 =?utf-8?B?RUZGMGI2MVUydHQ4MExjeUZFNDRuckVnSWdLNXc5WGlTTHhySW0zcUtScmNa?=
 =?utf-8?B?MjZZVjVvSmtzMGpwM0tseTY2L284QTh0SjVrV3MyQ2NrZWRUd1d1NW15bWxF?=
 =?utf-8?B?Sk9uelVMaHdaRVhGRytSbGVYN1NjNEFRR0cyVjFJOGtsQVgwYlJ3R0hUYXFZ?=
 =?utf-8?B?QktsM3VXdlNIdHZCaWRtVXpKRldFYjRZSHVkU0VteXlBT25FQXhScHBOeVBi?=
 =?utf-8?B?RGRJNjVpR3RVbmo1T0tsL1VvdVM1dER1NU1GWHl2R2hrVE02R1F2THlZOG1H?=
 =?utf-8?B?T0ZCNlRUU1dDRzFhNGtCK3FSWTVqN2RRWjV1SHpLNHBDNlkyRzlXcEc0MlRJ?=
 =?utf-8?B?cWpJWXJ5M3B0T1JWeG1rTG9iZ2FQY0VCUzZpc1NCcXNFTVA3VlJCRFVmZFc3?=
 =?utf-8?B?dFdEV2h1RzByU2ZnQXc5d3pjRU9ZaFJVZkxoeGxOOGJDVU9HMWkvbDIxRDZz?=
 =?utf-8?B?OThwUHVvU2FhaTFjQzlTbHRVL1MzMndDN2tZSDdibmxueHhsR3BvV0NOSTlK?=
 =?utf-8?B?bTYvWXdLUk04cnVvdmJ6ZmtMSnBuNDVSTXY2OVhNRVJHN3NqRTJBcDZhdGFx?=
 =?utf-8?B?RFEzM2hYMi93Mjh0ZXFoR0h1S3hOSEV4eFN5MjBxVHp0R1BhT29KeEtzYmhX?=
 =?utf-8?B?Vk5lTENzSXAyYXNybmtpV3VSbmdnTEtPZVMvSFRReEtLQ1IzbkJvS0FtV2Ri?=
 =?utf-8?B?NEpkL3NEcjhhazNyVDd5YmFCYlRQSEl1UXA4SVhRNENzVllSM0VtWmYzaUh4?=
 =?utf-8?B?cXdFaDRkbG9aZ1BvSkVWeTlXVE1UNzZQTnk0MkF3QUorU1RXNzRiUUREQnE0?=
 =?utf-8?B?TkpjOHlkdURUclhLTGlOM2IzWko1a0NWRDVGUU5aWlVzamlOMk9GeG01MlpS?=
 =?utf-8?B?bUtCd3J0UlV3a2I1ZjgvbFRnOXBJOXNTaisyMTJIZ1BrUWthZklaUEtCenlQ?=
 =?utf-8?B?eEl1YXFNRmZlZDZ0VElOM1FXZlFZd1FuMTZZUGFLY25zZlFaV1pYSzJadEd0?=
 =?utf-8?B?bnZBYWNoRjhxc2lnZjNrOU1IbVpuVU55MXpUUkUvYngzb1VZQ2RFQ1B6c3R3?=
 =?utf-8?B?NmxpamlHY3liOWVLOVV1enBjcEhCSWEyM2VIdTMwZFVLNWlWV00zY1BKTk9m?=
 =?utf-8?B?WDEvRjZQL0NwRmxPcCtBRXVCUUFBUmNTVno3dnF3NFZQM2hlcldDU3o5cGg1?=
 =?utf-8?B?Q0JQM3VGVmRLNzVEVk15c0hKOGY3M1R6akJYSlJWZzlGakN0VUpUZkxQY29k?=
 =?utf-8?B?bDFqNkt6UTdtb2ZIdHl3aEJtL0tlZXorbUZkY0FkQTJwOWpqWlJ1NlVMQzJo?=
 =?utf-8?B?WUpJTm5CbkxOUTN4UW56VlhwVTd3YWhsdDNGbjBxR1E4RVByQWh3bGc0dTJx?=
 =?utf-8?B?Y2NpcU9lYlc3ZVorbnl1dXNMNkpWN2tKK3phMzdCbCtXSzVkd0ZlMlFGdHIy?=
 =?utf-8?B?UTdjNGdualo5ZkQ5NEhqNWptWit4VHRSbWY5SUw1WWEvN1pNRHZvZFdlK0pY?=
 =?utf-8?Q?aFqbEOOznSdE6IyUAn95v3Ctv?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 17cbc4fa-3888-46ea-0007-08dbcaf65e17
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 07:39:29.5960 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qVK4Fj118B1ptYSQDfpbQpRVnxIl92yDOl7zY4SKiHdLkRV/OzcNrp0BF/uUXlmcU2ZaAHC3BKQSw4EUY7IjFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6533
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] RFC drm/xe: Disable GuC CT communication
 for D3Hot Transition
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

Hi Rodrigo

Thanks for the review.

On 9/22/2023 12:07 AM, Rodrigo Vivi wrote:
> On Thu, Aug 31, 2023 at 03:21:18PM -0400, Rodrigo Vivi wrote:
>> On Thu, Aug 31, 2023 at 12:02:31PM -0700, Ceraolo Spurio, Daniele wrote:
>>>
>>>
>>> On 8/22/2023 10:09 PM, Riana Tauro wrote:
>>>> During Runtime suspend, GuC is reset for both D0->D3hot/D3Cold
>>>> transistions. It is not necessary for GuC to reset for D0 -> D3hot,
>>>> only enable/disable ctb communication.
>>>>
>>>> Add a function that enables/disables CT communication when d3cold
>>>> is not allowed.
>>>>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>
>>> xe_gt_suspend and xe_gt_resume do more things than just resetting the GuC
>>> (e.g. marking submission as disabled). Shouldn't we need at least some of
>>> that in the runtime suspend/resume scenario as well?
>>
>> I was asking myself the same thing...
> 
> I take it back. on the current flow, if we have a chance of receiving a command
> submission we shouldn't allow the runtime suspend. so it should be totally safe
> to leave it there.
> 
> Given the latency data Riana shared with me offline we can see around 60ms of
> latency saved here.
> 
> I was also wondering about the overall package power savings difference here.
> Did you checked that?

Measured power using the hwmon library

Before patch and after patch (34 ~ 35W) on DG2
Don't see much difference

> 
> Only thing we need to change is that now we have the pmu in the suspend/resume
> path and we probably want that on runtime variants as well.
Will add this in next rev

Thanks
Riana Tauro


> 
> Anyway, let's move forward with this.
> 
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> 
>>
>>>
>>> Also, which paths and how much we're actually looking to optimize? Are we
>>> interested in optimizing the full suspend as well?
>>> To elaborate, we're not actually killing the GuC in the suspend flow, we're
>>> just resetting its SW state (i.e. putting it back as if it had just been
>>> loaded); the actual reset happens in the resume path in xe_uc_init_hw. If
>>> the GuC and the LMEM have survived the suspend/resume flow, we could
>>
>> On S3/S2idle/S4, GuC and LMEM will lose power.
>>
>>> theoretically just restart the SW side of things (re-register the CTBs and
>>> start SLPC) in the resume path instead of resetting and reloading the FW;
>>> this would be a lesser benefit to the runtime path compared to what you're
>>> proposing, but it could benefit the full resume path as well and it'd have
>>> the added benefit of keeping the 2 paths the same. I'm not sure though if
>>> the LMEM management could end up breaking this approach by moving the memory
>>> around during suspend.
>>
>> this memory movement is indeed the hardest part with all the locking...
>>
>>>
>>>
>>> A couple of minor comments inline
>>>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_gt.c | 56 ++++++++++++++++++++++++++++++++++++++
>>>>    drivers/gpu/drm/xe/xe_gt.h |  2 ++
>>>>    drivers/gpu/drm/xe/xe_pm.c | 10 +++++--
>>>>    drivers/gpu/drm/xe/xe_uc.c | 18 ++++++++++++
>>>>    drivers/gpu/drm/xe/xe_uc.h |  2 ++
>>>>    5 files changed, 85 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>>>> index 13320af4ddd3..0d52621ce64d 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.c
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.c
>>>> @@ -676,6 +676,62 @@ int xe_gt_resume(struct xe_gt *gt)
>>>>    	return err;
>>>>    }
>>>> +int xe_gt_runtime_suspend(struct xe_gt *gt)
>>>> +{
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	int err;
>>>> +
>>>> +	if (xe->d3cold.allowed)
>>>> +		return xe_gt_suspend(gt);
>>>> +
>>>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	err = xe_uc_disable_communication(&gt->uc);
>>>> +	if (err)
>>>> +		goto err_force_wake;
>>>
>>> uc_stop() might already cover what's needed (or could be expanded to do so),
>>> although unfortunately uc_start seems to not be matching and therefore not
>>> usable as-is for the resume side.
>>>
>>>> +
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +	xe_gt_info(gt, "suspended\n");
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_force_wake:
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +	xe_gt_err(gt, "suspend failed (%pe)\n", ERR_PTR(err));
>>>> +
>>>> +	return err;
>>>> +}
>>>> +
>>>> +int xe_gt_runtime_resume(struct xe_gt *gt)
>>>> +{
>>>> +	struct xe_device *xe = gt_to_xe(gt);
>>>> +	int err;
>>>> +
>>>> +	if (xe->d3cold.allowed)
>>>> +		return xe_gt_resume(gt);
>>>> +
>>>> +	err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>> +	if (err)
>>>> +		return err;
>>>> +
>>>> +	err = xe_uc_resume(&gt->uc);
>>>> +	if (err)
>>>> +		goto err_force_wake;
>>>> +
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +	xe_gt_info(gt, "resumed\n");
>>>> +
>>>> +	return 0;
>>>> +
>>>> +err_force_wake:
>>>> +	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>>> +	xe_gt_err(gt, "resume failed (%pe)\n", ERR_PTR(err));
>>>> +
>>>> +	return err;
>>>> +}
>>>> +
>>>>    struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
>>>>    				     enum xe_engine_class class,
>>>>    				     u16 instance, bool logical)
>>>> diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>>>> index caded203a8a0..e6574e51004f 100644
>>>> --- a/drivers/gpu/drm/xe/xe_gt.h
>>>> +++ b/drivers/gpu/drm/xe/xe_gt.h
>>>> @@ -37,6 +37,8 @@ int xe_gt_record_default_lrcs(struct xe_gt *gt);
>>>>    void xe_gt_suspend_prepare(struct xe_gt *gt);
>>>>    int xe_gt_suspend(struct xe_gt *gt);
>>>>    int xe_gt_resume(struct xe_gt *gt);
>>>> +int xe_gt_runtime_suspend(struct xe_gt *gt);
>>>> +int xe_gt_runtime_resume(struct xe_gt *gt);
>>>>    void xe_gt_reset_async(struct xe_gt *gt);
>>>>    void xe_gt_sanitize(struct xe_gt *gt);
>>>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>>>> index 0f06d8304e17..6bc01bb45fc2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_pm.c
>>>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>>>> @@ -245,7 +245,7 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
>>>>    	}
>>>>    	for_each_gt(gt, xe, id) {
>>>> -		err = xe_gt_suspend(gt);
>>>> +		err = xe_gt_runtime_suspend(gt);
>>>>    		if (err)
>>>>    			goto out;
>>>>    	}
>>>> @@ -294,14 +294,18 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>>>    	xe_irq_resume(xe);
>>>> -	for_each_gt(gt, xe, id)
>>>> -		xe_gt_resume(gt);
>>>> +	for_each_gt(gt, xe, id) {
>>>> +		err = xe_gt_runtime_resume(gt);
>>>> +		if (err)
>>>> +			goto out;
>>>> +	}
>>>>    	if (xe->d3cold.allowed && xe->d3cold.power_lost) {
>>>>    		err = xe_bo_restore_user(xe);
>>>>    		if (err)
>>>>    			goto out;
>>>>    	}
>>>> +
>>>>    out:
>>>>    	lock_map_release(&xe_device_mem_access_lockdep_map);
>>>>    	xe_pm_write_callback_task(xe, NULL);
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.c b/drivers/gpu/drm/xe/xe_uc.c
>>>> index addd6f2681b9..b5b53c8c3edb 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.c
>>>> @@ -216,6 +216,15 @@ static void uc_reset_wait(struct xe_uc *uc)
>>>>    		goto again;
>>>>    }
>>>> +int xe_uc_disable_communication(struct xe_uc *uc)
>>>> +{
>>>> +	/* GuC submission not enabled, nothing to do */
>>>> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>>> +		return 0;
>>>> +
>>>> +	return xe_guc_disable_communication(&uc->guc);
>>>> +}
>>>> +
>>>>    int xe_uc_suspend(struct xe_uc *uc)
>>>>    {
>>>>    	int ret;
>>>> @@ -232,3 +241,12 @@ int xe_uc_suspend(struct xe_uc *uc)
>>>>    	return xe_guc_suspend(&uc->guc);
>>>>    }
>>>> +
>>>> +int xe_uc_resume(struct xe_uc *uc)
>>>
>>> This should be called runtime_resume.
>>>
>>> Daniele
>>>
>>>> +{
>>>> +	/* GuC submission not enabled, nothing to do */
>>>> +	if (!xe_device_guc_submission_enabled(uc_to_xe(uc)))
>>>> +		return 0;
>>>> +
>>>> +	return xe_guc_enable_communication(&uc->guc);
>>>> +}
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc.h b/drivers/gpu/drm/xe/xe_uc.h
>>>> index 42219b361df5..29bd692d8800 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc.h
>>>> +++ b/drivers/gpu/drm/xe/xe_uc.h
>>>> @@ -12,8 +12,10 @@ int xe_uc_init(struct xe_uc *uc);
>>>>    int xe_uc_init_hwconfig(struct xe_uc *uc);
>>>>    int xe_uc_init_post_hwconfig(struct xe_uc *uc);
>>>>    int xe_uc_init_hw(struct xe_uc *uc);
>>>> +int xe_uc_disable_communication(struct xe_uc *uc);
>>>>    void xe_uc_gucrc_disable(struct xe_uc *uc);
>>>>    int xe_uc_reset_prepare(struct xe_uc *uc);
>>>> +int xe_uc_resume(struct xe_uc *uc);
>>>>    void xe_uc_stop_prepare(struct xe_uc *uc);
>>>>    int xe_uc_stop(struct xe_uc *uc);
>>>>    int xe_uc_start(struct xe_uc *uc);
>>>
