Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4716BC77B7C
	for <intel-xe@archiver.kernel.org>; Thu, 11 May 2023 18:06:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA110E0C5;
	Thu, 11 May 2023 18:06:19 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B664110E0C5
 for <intel-xe@lists.freedesktop.org>; Thu, 11 May 2023 18:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683828377; x=1715364377;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:to:date:message-id:mime-version;
 bh=NRDBPHoHqqD9ZTwh9LErxiWaOTBbFKDdhlDRhEzekQY=;
 b=je4wpx7pb7Vpu6JDBuM73mNCXggSzILGHQrtSbojUW3fJBc1cj7f7jFh
 qbxz8buU2YiCkaFU2RB+UTM+OX8MxxPVJrVpVFXRZSy0/T3R+sPA/hfvd
 O5l/byvGtzzOi6Qh8tB8tDpyOvbkTw8RHtNMJuYeBdYyYPj8347wuh006
 4V92EpdzRy5FS5f31hc2LT7vVAOyae5acqkqsIWw8JNS8dx77hfhx++jR
 3cREs0vJDrRuF2OmXQaKtwjboPfVWXoqrMnDyCIFCpQ6KxzSrNSSnZnhc
 4TAfVeiW5Bs3rKz+DWM1aJOompaxQXWqMxs8uIhDk9NqXUPtvGDX1o4ee Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="352820408"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="352820408"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 11:06:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="946285487"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; d="scan'208";a="946285487"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga006.fm.intel.com with ESMTP; 11 May 2023 11:06:07 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 11 May 2023 11:06:07 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 11 May 2023 11:06:07 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 11 May 2023 11:06:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CXdgSeuZxdnLHCc5fjm8Ob0akkVYY7kMRwZBBJAyuBKnKGnWQWZ2FEpRXnUMtBJIf2wGPwa2ZkfJsjjKVGU0HnWv9a2XjjPeBYQIu5cde/FplAULyap+Ewp/HwKGYihf03nEcCrruB1sDRkfcFtKWaCiOw6aYE4dURgvdylZsk9k+mpsN32AjYne+nEXGf8sD9w10X6GMgb2xreOZjGhxDew6cMneiRG+eDDg41HJKMVRTqwxT7KN31j7m+JJqKkPFH2om6NzyM+uK3ebfeCtzfgKbEUVn6/d/HNe3RAHTEeZEyU3naGSKmD48JcWa4nwQRbf9h78mtOWlVWLshj4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdqN61Ls/IMfu9HD7sSjUDB4oFtj4M2Shu/KvAOB4Zw=;
 b=bQTi+y2iU8iMz2fxirHYXREFg3eggNGzbxJFA4ZjZ4kgXaI7Ty52E38juM/3jTS+pPMloKt6Vehrt0PND+C6pAc/ofsfc63g7tYAw54SI6KBkf+bORcavaTzlNxIl98iUgXCmjOCaHqY3GqeoQ59l+OvEr3thzxLG2Asw54b/Ofb2ZbI1yOKZfVY9DbsY1GtN+/2E4+foGnChuE+Ee4lTpfW41raXA/P1czt1HGvduPx+LfLezKEPRlNYEZaVa+rWH4uK5+Z26HzKv81kqegpll5F3nYsUg+mrUV15QAavoPbWk6D2JGzmdRCjmlJF49wypiBCaPtdvBxp1XzryW/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by DS0PR11MB8133.namprd11.prod.outlook.com (2603:10b6:8:15b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Thu, 11 May
 2023 18:06:05 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::28c6:f268:89bd:e45a%7]) with mapi id 15.20.6363.033; Thu, 11 May 2023
 18:06:05 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87h6sklyz7.fsf@intel.com>
References: <20230509222053.1541049-1-gustavo.sousa@intel.com>
 <87pm78midb.fsf@intel.com>
 <168374872604.358529.7514478797295259747@gjsousa-mobl2>
 <87h6sklyz7.fsf@intel.com>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 11 May 2023 15:05:59 -0300
Message-ID: <168382835969.3768.2424166557769789503@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: BYAPR11CA0043.namprd11.prod.outlook.com
 (2603:10b6:a03:80::20) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|DS0PR11MB8133:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e864d69-f14a-4108-b168-08db524a639a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: euWgrwgkyxjwUD97XTRB8ojrKRY9CGh316s8z5d1yljk52C6NavXcvn4QH/UbXDNGUBT53eBEgQ9d7qIsF5ymdaSywf8IsvzM+RosMMXGgnaEe/vHrO3zI602VS1Ctg+2U6dHnhvs4vct+O7x6p4HgmC6TOJKGAahUiwNOdDdyGwQfBenzYJ07kyBSiJ26UdyRkUcGGJWhMXR//qF30Sq10i7DhX3rjymmnrbZb7Djh+R4xI5vv35X1oxk4+f08W1EqjUFtMlhYgsBp6+dhzxDIq1hZc0YGBun1lUu7jDqQlxEiUmFDITgcvbuTUJi83DFILfqBXTlD14180S63cU7TzgyUAWEpyOvOqTAA5cBOm8a4uCHeQKOZrsHj3kBJgc7mfjfVVuMexsV6u4VWZOEPm4/69h0KV0rz/akq02f7sbZXXVMAyknclsENjEcJhh4gerR6e0FHB05BR/vpYd2wDL6mBksw6pspe2tbom/LuR4rZKNtvEXOoPdiFYjQadatUNqbsLz8r2STf8vvE484Lh+REwn7rtTmOgjHT2xEIEScqY0Wc9nk2WyAuA4oP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(39860400002)(346002)(136003)(396003)(366004)(376002)(451199021)(66476007)(86362001)(6486002)(478600001)(66556008)(316002)(66946007)(186003)(5660300002)(6512007)(2906002)(33716001)(41300700001)(44832011)(8936002)(82960400001)(38100700002)(8676002)(6506007)(9686003)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Risyc3dZb25xVHpSR09uNHZCK3hPZ0V6dkcvNlFaVVdBWC9tY1RsL25iOWlH?=
 =?utf-8?B?VnMzbFdHcnZZVmhmdmZ5eEkvLzlUSWRzUVptWWhDYkdJOU5ONmsveXZ2QytU?=
 =?utf-8?B?Z2d6SE5KeDN0Z0Z2ZlBheVA4ZkNBZ0UwbDhhOWFSanpWa05IdDJCU0RXeUpX?=
 =?utf-8?B?QUhRS25QbjNLOXMzWGh4ZnhTZGlzSnVXSUlvOFpLbTlXTTd6NkpOV1QzVWF3?=
 =?utf-8?B?c3ZaK0RHYlk1dERPcldZYm1iRTZycExJRHBGMW9qUWxyVHk2UElwalh4emtk?=
 =?utf-8?B?NU8yTGtKVFl6WFNvaWE1cGVhTjJUMnpJZllUOGFSYUloZjBibHVTUnNXWGJy?=
 =?utf-8?B?ZnkwRDQxVmlsYmZ2VDVod0hnclMxb2UybE5ZWTlneHpsTVFuc3NGRndCYU5W?=
 =?utf-8?B?Yi8wNjdobERoZUlyTEEvV045ekM3dWVPWG9PYWlDYTVxUjg2VHZaMlB3N0V2?=
 =?utf-8?B?MHhSS2E3Q3Z6MTg0WC9jWTFWbDhJUU04MUVLd08vZEwxTGtjQlBJMDhraUpk?=
 =?utf-8?B?dEIyUTNtT3VhaGxlL2tDNUxISXVETXA1V25jWXNqQS9ZL2xHNTJ5R2hCMTg3?=
 =?utf-8?B?N2dPWE51cmUvanRTbW5KSEVWMGJQYlZTVU5acnpGM2hqalAzbERRbnV4STJ1?=
 =?utf-8?B?RDZkU3BTN3ZPT3dVZVlyRytLbnRLKzIrTzRMNjh0N2ZMWmo3YndNT0hSazJn?=
 =?utf-8?B?MVhHL3Bab25Ea1dOV2R0WXRoU3VyWXFEc3JRMU56OTJqcjR3WnByUEZrRE9v?=
 =?utf-8?B?bnhUWEVEMDJXZlFuNDhoblFqcktRbCt5YUlpYlltWmFCamRaRkI0KzhyYUpy?=
 =?utf-8?B?d0k4L0tVdndwRjlJTDBWbHdjY2J3NXNHV3dWVE1kcHljSUtxM0ZEVTJpYUov?=
 =?utf-8?B?U1RiblpPZmFrZXBhdWhRSnBUOE5LWXR3djh0ZE9wQTl5ZTl1SUZqaUlZQmxQ?=
 =?utf-8?B?TXdNMjVlc2dFRE5wV0VKREJZMkNqRnluYXN4RWczcFFmRVpmSU5wMnluZmZI?=
 =?utf-8?B?bW5GRk9wb1FJLzNCYjJ6VzVBRVh6LzhRNmJRMlZuUmxNdUhMQks3S0JDdjFm?=
 =?utf-8?B?U3dFdXlDS1RhYThsT1VnSHhIbjhOUzVwMUNwWmYxREd2NkFSTW5ISndKaDNr?=
 =?utf-8?B?SnUxSG9yQnJ5eW14M09pNUVoUG1MUWVZbitKa2s0WGcwV0RSWnJNMnI2c3py?=
 =?utf-8?B?bkhjcXI5OTRoTlg5elN2aFh1L2lFQXJES0YyQ3VyU1owODR6WlRxYXJObVdZ?=
 =?utf-8?B?RDB1RGZpaVpNRFp2OWNRcy9ObERBSnhtSzRad29yQjIxN29sMy9PdUxyNUhT?=
 =?utf-8?B?dG9UeEg1UjNUWFNYZS9WbXZZeFRtTFZlNlRGMGl6M2VrQ29NSnhsT3J0eW1X?=
 =?utf-8?B?WTZyT01qaUZBeEd5NjRsZEwvUVYwVmV1dDlLVmxCcENsVGlzMkNwSlhIaEw4?=
 =?utf-8?B?Qm1KRTRFNzA1YXpWaEV0VzZZenhXWEpSK2pjK2VpYlEzQTlQQndsNEpNR0dB?=
 =?utf-8?B?a2JoN0VFMHpmcStTSDdhVkJFQ21hYzlRN1Y3c1FGT25mWVVQV3I0UGNCVUho?=
 =?utf-8?B?NCs2cEI3Z2VaY1NTNGN3OHkvN3JTN25RZ2hhWCtEekxuNjBpYkh0ckZPczhU?=
 =?utf-8?B?RnRYalhuOXQ1dEhnZjU0QlltZ1BNaW1Ja2hzOUtaazRaMHp4dVFQOFIvaGRv?=
 =?utf-8?B?VUFjWms2U09Pdzh1KzNzbm9pYkduZUVzM1d6SkdOYVpLQTkwQnhNcUFKcDlU?=
 =?utf-8?B?bnozZGx0V0FxSzlUZ2R1Mmo0TFJLMFRlRW9VSW45elZiR3ZEUmVUYmhxZDVG?=
 =?utf-8?B?MkJSMkFTYVZPYTMwUFVNaGU2Zk5DMjdLMjZzRW44akdHY2hGTEIxc1VQRzVs?=
 =?utf-8?B?cE1BeDkza0dtbW9oeDFCa1hCL3k4UU4zS2x1TjMra0s5UU1laFpwTmgvOWFH?=
 =?utf-8?B?b3lQS2xxZ1ZxZjhPQ0tkdUk5Vi9RZzhXRHY4NVRVeG1zd1lMbHdVcXdORVpT?=
 =?utf-8?B?NzU5VFVUUmcwbVR5YVJkbS93WGEzMzNrZzRTNXFmN01oUThPOXhtLzVpR2pl?=
 =?utf-8?B?VXg5RmN0ZWxwVWRNdWJvbUdxRzk0cHRHRkVqUDJQTE1TNVEyamJFYmp3TVA0?=
 =?utf-8?B?bnpPYjhNbWVJcnNOU3Q0anVZQThRL0dVdTN4VDdlNVJXOHlNVlJqNW4xamhy?=
 =?utf-8?B?akE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e864d69-f14a-4108-b168-08db524a639a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2023 18:06:05.6939 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PpFwSA2uHLLromGVUrv2/LWZ0HVrUXVnbkjtQulBLzCI7v7GNqaBOZjyxL8DamJ+/xdTtd+DZuHlq5fucqQRvA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8133
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Call exit functions when
 xe_register_pci_driver() fails
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

Quoting Jani Nikula (2023-05-10 17:21:00)
>On Wed, 10 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>> Quoting Jani Nikula (2023-05-10 10:22:08)
>>>On Tue, 09 May 2023, Gustavo Sousa <gustavo.sousa@intel.com> wrote:
>>>> Make sure all necessary exit functions are also called when
>>>> xe_register_pci_driver() fails.
>>>>
>>>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>>> ---
>>>>  drivers/gpu/drm/xe/xe_module.c | 16 ++++++++++------
>>>>  1 file changed, 10 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_mo=
dule.c
>>>> index 6860586ce7f8..9698875852d3 100644
>>>> --- a/drivers/gpu/drm/xe/xe_module.c
>>>> +++ b/drivers/gpu/drm/xe/xe_module.c
>>>> @@ -53,14 +53,18 @@ static int __init xe_init(void)
>>>> =20
>>>>          for (i =3D 0; i < ARRAY_SIZE(init_funcs); i++) {
>>>>                  err =3D init_funcs[i].init();
>>>> -                if (err) {
>>>> -                        while (i--)
>>>> -                                init_funcs[i].exit();
>>>> -                        return err;
>>>> -                }
>>>> +                if (err)
>>>> +                        break;
>>>>          }
>>>> =20
>>>> -        return xe_register_pci_driver();
>>>> +        if (!err)
>>>> +                err =3D xe_register_pci_driver();
>>>
>>>Why aren't xe_register_pci_driver() and xe_unregister_pci_driver()
>>>init/exit functions in the array? It would avoid the special casing
>>>here, and allow some init functions to be called after register.
>>
>> Hm... I would imagine that the intention would to make it explicit that
>> xe_register_pci_driver() must be the latest one called and, if that was =
the
>> case (which is probably false based on your comment), maybe adding a com=
ment on
>> the array entry would also suffice.
>
>In i915, i915_pci_register_driver() is *not* the last one!
>
>> So should we just add them to the array?
>>
>> One issue would to be related to the function names, which would be
>> incompatible with using MAKE_INIT_EXIT_FUNCS(). Since those functions ar=
e only
>> used in this file, I guess it would be okay to rename them to
>> xe_pci_module_init() and xe_pci_module_exit() for consistency sake. Thou=
ghts?
>
>Personally, I don't like MAKE_INIT_EXIT_FUNCS(). It does force a certain
>naming pattern, but it also throws off code cross-referencing tools. I
>can't just go on top of MAKE_INIT_EXIT_FUNCS(hw_fence) and have my
>editor find the definition, and neither can I find all the call sites of
>xe_hw_fence_module_init(). git grep doesn't fare any better. For me,
>that's a productivity hit that's perpetually worse than having
>init_funcs[] fully spelled out.

Yep. I agree to your points. Let me work on a v2...

Thanks for the feedback!

--
Gustavo Sousa
