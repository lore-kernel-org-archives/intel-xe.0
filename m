Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9225C2BD09
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 02:42:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C89310E2B1;
	Tue, 25 Jun 2024 02:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l18JYLna";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707ED10E0F0
 for <intel-xe@lists.freedesktop.org>; Tue, 25 Jun 2024 02:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719283360; x=1750819360;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bHfz4ip2PcvsO5m4KPkwQ/39G9dZl0ciugfJFCANZd4=;
 b=l18JYLnai+WOINl28GJIpQ1wWC10RT8fxDvlGv4sh0WAa6MU1CKJROf/
 2UzPnmauDoX9HVOjOi/EoykNELMS7Ji9AKkGZ/LppFwTLXqAeQf/RYMR2
 d9wFNqhR7R62wstFPl41IYLfeCAj+jURr9XSkeVpzi6ml7K4tpe2TBtMt
 cBDmDPmImZ8/xPkrX7CUHUjteK6qHOecIDs8WqoRtw+DXxUkxf0YrXjjN
 jE9XlDo2BwgzlC6WoVDJfBntswWGmMD5rR/24hnQNgbEOR+rrRE+Tb46J
 K85R4EgJig5MK8/qpSsQ3CbPiGyN0mBhtsUwEV8nTrsCgLnWli2NfDjjw Q==;
X-CSE-ConnectionGUID: 8yqd7citT4ectuvmN78GCw==
X-CSE-MsgGUID: qTu0GhVARJae+nJhtZN9OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="16424186"
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="16424186"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jun 2024 19:42:37 -0700
X-CSE-ConnectionGUID: c0XpM2CKQ5SqMZ1zZ2SsNw==
X-CSE-MsgGUID: C9n2S8tsQT+Qj/sFZcU3ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,263,1712646000"; d="scan'208";a="43566371"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Jun 2024 19:42:34 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 24 Jun 2024 19:42:28 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 24 Jun 2024 19:42:28 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 24 Jun 2024 19:42:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0a0qY3Y+Mi58kEjF6+5aGb9EM3JTb7h/zAM2bXfWbgHE8AluRL+4KNRtHxg7TjeGWrAgeusbfrUpS81C1TimoumcCmbUo6AblNMShE/P5texzLlCvpSRwQojPH5ODOmdIqIRSYY9elSmIP/i6KP2sUP0yCQVnHLoDx3U8FsX5h3ITf0suZHJnSEN8qI8IZkcLrTf2aR2QnXTu49QUISL8qb+LInrsodvGqoTVTwnzLSn7ZtENa6QxeALvMUKoJnEtyoVwtLsntdJPiwpkuXhOmr72CUn7eKJr2g3bOOilWQ8VmDEDSY+FmUq7mldvYLRZzcMZYyorvre6VoWYH/dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hzjga6saT92bJFr1r+9vUXvlYGr3fM5jka8LyODgc/4=;
 b=OPQV+xn+ZfBj/VCNi7gzvfaRU1Szwu2rPalSUBGrPu4A9Fk0OfWe+/hZU8/XdHhJMkay+G0oEi5elBGQi6RpT7b06fJqrTT87UAfaJdBrHQFm5CZ1zYtZNo+/dZRe9GE+3pNhYTF7ijJIltP0TnOTGNOs8r42osG5s6DOwlGKON/LmrnJao+/53e3RzyoBgiLhv8yfNqBh0YdySUteqkxWlB3AAvRQGptSnwG4rnIdvb3tUe4iI4M6JVT6RFEY5uzJX8wJvwnvV3w2QRjbZmX/elOMUu5oV9D89XUkyGxenluzNWHdAneFhljM5Z2SM+gLV43ykoUm39TQHrFT08vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SA1PR11MB6965.namprd11.prod.outlook.com (2603:10b6:806:2bf::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.29; Tue, 25 Jun
 2024 02:42:21 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%5]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 02:42:21 +0000
Date: Mon, 24 Jun 2024 19:42:19 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Get XE_FORCEWAKE_ALL to read RING_TIMESTAMP
Message-ID: <Znoui9fADtL/0OWj@orsosgc001>
References: <20240621192325.227230-1-umesh.nerlige.ramappa@intel.com>
 <yolllanxh5neppqhi5whzwsdxetbqfkzurfsbaf5x63s72tppn@e7c6xhqf46eb>
 <ZnoSnxbRiQm+rGWk@orsosgc001>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <ZnoSnxbRiQm+rGWk@orsosgc001>
X-ClientProxiedBy: SJ0PR13CA0142.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::27) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SA1PR11MB6965:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7a72f8-1e0f-4d9d-27ad-08dc94c06fbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|376011|1800799021|366013;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aGFmbUFlK1V4U2Jmd0FXSmhDNHBGS1ordGZqTDdmYmtNTjFJNWxadGtFRms2?=
 =?utf-8?B?UDJJRWpLMy9RYzdocWZXcTZiMEhaTUhGWmxUbFpTNmRXZXQyK2gyWXQ1bnJQ?=
 =?utf-8?B?aU9TSFpLcjhEMDRXZzlpUXRGSVhLeVRhRVNRaFhmTmRSMW9GNzIzeUtaMXla?=
 =?utf-8?B?bGRGK243dEFYRXpkdmk1UzJaR0wvTTJMT1BqMHduYW5WOHhJTDBWMmJZK3RB?=
 =?utf-8?B?MW5ES0JRWlBsSEVuaEFlSUlPS1piM3lHTnlCR2pqWDk2V3NqUHBRYU96VU1z?=
 =?utf-8?B?ei94ektOWGJINytHNHVIc0tZdENsaU8ybWNkNjBhUWRtMFdiUDdaS1JrY2lC?=
 =?utf-8?B?OVdqUVBUMzl2bUp2WHQvZ240aDNoRzFDZWN5aVdnbDNJWmliZkI1TklHdmFs?=
 =?utf-8?B?bjQ1bThibzBCSXJSMHJGSGNqbkZrUFpBZTVISW1pN0t2Nk5iRjNnYVRiUUFF?=
 =?utf-8?B?Y0xSSFdURHZhRk5MV1E1OERCQUJabmVsaW5vQjIwVGs4MW5vejFMcDQ3S1VU?=
 =?utf-8?B?aVZXVFhxODI4eXlydURYZkM5OTJ0YmR6b05vVXUvakMvU3hHN3diT25qdnM5?=
 =?utf-8?B?cWF2UXBSTEt3RWpjbnJ5NFdBSTZjNFBUUkVGU3dqQ2cxaklZOEkyMzVkaGc1?=
 =?utf-8?B?UlFxNEJ3SkhJZFVuL0c5a0dONnJVS1A2bGEzUVVCdzhBYTFzdmhJczNJNnJm?=
 =?utf-8?B?OGNOaGQzSFpERmNzWGZ0VHVDUkNKeExWcmVJYzdKQncycG9HemdBeUsyRDdU?=
 =?utf-8?B?Y3JzcmlpMkkvOUNjQjVqMWpaTllQZ3RCdEFtV2E0dFN3dGxKR3B2dFlHSDcz?=
 =?utf-8?B?ZWg1a2h6cEpQSnAvY2NsWTRGQk5IeFJ6bTZhOHRoSVZPUG5UcE41SzBWQ0dz?=
 =?utf-8?B?NUdwbFhwVEpacTJHekE0a09FbDFGYkNndjl3YXBFYmxJWFpkRkNpVmdxYzNl?=
 =?utf-8?B?NmNCTDhWVDZxZExzdGxEamlRUmRMUTBLZEpSakFEK1J3VE5JMmhSZUZoM0cv?=
 =?utf-8?B?VVhpS1d0bjhJaVQrMityb09ILzBYUi9NQ2hZeTlHRHo3NmR5T1NrUlo4ZFhH?=
 =?utf-8?B?bW1qeW14RWRzVUNraFkvUnBhVkpKc3Z0SW9iMXM5Z29DaGMxcjBINGwwaXRG?=
 =?utf-8?B?QlJNcHVseC9IaHY4dnAzaTVOUjlXc1VPNDFzYzllRlF1aTdPTS9ueHIxTEk5?=
 =?utf-8?B?T0xjVTZ6REhKekV2SWdtSnd4S2I3SWdKMFpPditrN2pvN1pXM0p0RjhMWExB?=
 =?utf-8?B?Y2dEN0NzNVBBcXlJMlhDcG9vTi8yWjZCV0RTbUs5a293QWZoOEQ3OFU5U045?=
 =?utf-8?B?MW85aG5oc1hSSzkrT3U4d3VpTjZka1BkSHc1d21RRTdiMmtLMkt6Q1NwWjBP?=
 =?utf-8?B?K09EQVRsUHJiTW4vandmeUl3b3YrMmZGWVRUU1ErR2FXSkNzZVdzOTIwaHBW?=
 =?utf-8?B?Q2JDTy8vOHlnK2cwR0UvbHl1c2crQkV1eDh2aTU2WUduSHNXUk50WnJacS9a?=
 =?utf-8?B?bjh2RG9adXRvWGtjMzhoTFRGZ05SZE5pTW9hYUtsYXNrUEVOcGdYeWFHWklO?=
 =?utf-8?B?VEpkTitNcWpKTlhlSTYyUHNxOU51aDByNkM0UG1IZzZRK1lwdmx1V2NaUGJG?=
 =?utf-8?B?RUhPQjVMZXprWW9nR1ZvYk1NQm1YeEVxbW5yR0tVcTJYQllPaWhCZlNSaHBG?=
 =?utf-8?Q?Z83u+af8a6g8ikF+NalT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(376011)(1800799021)(366013); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b1hxZnJZUDhwV2JuQ3lpK1BtRU5HV2orc1psTjhSVTZYMVhncm1mdngxc2JO?=
 =?utf-8?B?bzJqTmdZMnZaZkhaM2tubDhxcDMvcXowUy9iaUh6VVd4VUpMYmlaTWU4Ly85?=
 =?utf-8?B?eEliMzZSVnhyUldLTkpuZC8yelNKV0l2ZDBSRG9NZGNHVUNtbVIycCtQYXIy?=
 =?utf-8?B?Q3grcFRLa1h4SDlXQzlvWU1WdWV6bzJsOS9FWVFMZzZwSlhqcTBxditFSi8v?=
 =?utf-8?B?VnlxQ0IyZUVoenM3ODd0TSs3UE0vVlFsc2FVM3ZYdWV2ZXRZRW96SWN5UWJU?=
 =?utf-8?B?aXV4MDhaaitHRGljSk1kOTI3VXhiYkdLL1ZzRlpiYXlXdzlOM3BGOTk3YWVa?=
 =?utf-8?B?TlYzQWN3M2RkdUlNYkY0aTAwUGVQNkdBOGt1T0tHQTRLSzZTZnVzYk9VUDR5?=
 =?utf-8?B?c1lVeUM5L1ZGK0UxMU4zditmdVpEMUpycHV4QWZtdjNCRTlSQ2w0cnZ6UUJa?=
 =?utf-8?B?MkFyTzF2aWppMldDRHhWSjVZcUNiY3B4d0tJcjk5aWxOdE5FZ1FSc1VLajJw?=
 =?utf-8?B?NW10eTNyNTA0bVMxekwvZzJKUGtKSFJIRHNzVHJaQWNpMUk4cEIxTlVidW41?=
 =?utf-8?B?b1NMOWZEU2hXdEtWbGJXK2tJdVNBK0ExenMwSjdFL29CK2ViQWovTDNEOUU5?=
 =?utf-8?B?bmNxYnFkR0RpTHFKaUhMU1AzYWJsQVpXRXBNZG9IcU80eE02ZVVHK3VBdUQz?=
 =?utf-8?B?dHJZUkV1Vk1rb1hRWWNndkc1cmdiMnYvWkI5M1kramFDUk5jT3NHZnZ2SnB0?=
 =?utf-8?B?aHRsU2VNUXNIMXg2MEg1YzBKRldvTUxHSlZaQ3J4eDZZSk1KcUl0MEJLUTNQ?=
 =?utf-8?B?TllKMlE2djlNOWJDRlhJS05EcGIvZVQ4N1duT011dGdCMFNmSlczcnpFVFpY?=
 =?utf-8?B?ZmliV3FDZGYrSmozaGhBVXFwNFo0QWNsTFBpek1JNGVxNEN2NGRkSEVGV0xC?=
 =?utf-8?B?RmxTNi9IVjdsYmZ0TTluaVBGaE5UNGxUZzFDaEZvVGpSNjhYYUhGVEtBcHRa?=
 =?utf-8?B?N1lRdm8xalJvRnIvOVZ1bnB5b0Rwbmh3b2hwZ3ZoNWMycmp0akxpZ3BkNjF4?=
 =?utf-8?B?SXZvbWs1M3ZxeStWd1o0M21FQlNQN1ltUExaMDZOK2E3T050MHNVSlowWjJ0?=
 =?utf-8?B?MzZuUDJrN1dBTEhZSW1obHl2Q0dCOFhCeTdxMjF1Qk9WMUZBT0FpR1cxS2tT?=
 =?utf-8?B?QjlncW84QjhKVVBqWVhpdjdtZUp2SjJsRTN4dGUrMVl0UmlhOU1QS3o3Vkt3?=
 =?utf-8?B?YmFoRXhlNTJwSDB0Z1NQa0VDUmVRUHh6MUhJcTczNy9HZjRSc0p5b0crWDJ0?=
 =?utf-8?B?VnBtMGFOM2NzOGEzU3dUSWErSmNCNHlJZ3VuNmxEUUJLeDhTVFVHYVJySFZv?=
 =?utf-8?B?QTF1eEVwZ0cvNy9sZDZJQWZET1VrRk8rMTFRamk5bFJhWkh2SFdDNEFxMndT?=
 =?utf-8?B?RTFoT1VOMU1SRVJkYmY2YklqK2kxTFFlUm5jclU1S2V5U1IwS1l5Uk9pck01?=
 =?utf-8?B?Q2tqYnlWby9KWGQwQU9DeVBrVERPYTluNG1KenQwTW9RSHEzVUhudUlCWEpm?=
 =?utf-8?B?Ukt6L0RHSmJCeTRqVHgrNklxT01CblJURW1VVUJJeGxSTWJxdU1IbUdRRGN3?=
 =?utf-8?B?cHgvWTNJY1FwazI5TkhCa3laeE45R2xzdlU4elY2NlFBekVYSWs4bDRNaFNk?=
 =?utf-8?B?d3o1aUJvWXdyVTB5eDliU3RIU1JpSFgzbXd0VkRTN05iWDVDVmRkdXZxOGE1?=
 =?utf-8?B?SEZoQ3BnQXpaS0RsR3lFdHFITGVLc1lwSUJRSXY0Y24yS1lEcTUwQkpMZWp2?=
 =?utf-8?B?dERIaTlqdWtVVzBpeHEweFVub0pDQ3FaWUR1NHhUc01yVGZ5cXpuaSt3a2NY?=
 =?utf-8?B?STVMVmM5bTlUYURzN2MweHFmR2dCQjVaeVJlQkJ5dlJ4dXM2dHEwdXNBTFBS?=
 =?utf-8?B?WDlOTTZWZEszMjBGMjNwb1E4TTM1MzNVelE5dlc3YUU0NVB4dWdjWDVmd1pq?=
 =?utf-8?B?Y2pocFpzMWVSREhOMG5maVBML2pyemRzdXA1NzlXeXZsd1VnRFdNT3ExUk1O?=
 =?utf-8?B?SUJ1a2p5OEJqeHgra2p5bVM5VEpZV0FURjlyRWR3Rk5iUmk2WnNiQU9MQmFY?=
 =?utf-8?B?eU1ZOHZaMzg5QndyS2xzbytRYWtaTTEzVkJQcE5RdW1QVjVpK2ZmZlBaZWJM?=
 =?utf-8?Q?6qOo7pR2LMxyaRUx7M1NCcg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7a72f8-1e0f-4d9d-27ad-08dc94c06fbf
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 02:42:21.0244 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: meXUlqssoUr0WJ1cldfeK1xZ7fgB69ff+2QOve+5eCdSwGuHYTfrgSSpJuPTchtB+GZffFxhptdZU4yIP5k1G2TVMLRrlQcXa5FLH1IpN/k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6965
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
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Jun 24, 2024 at 05:43:11PM -0700, Umesh Nerlige Ramappa wrote:
>On Mon, Jun 24, 2024 at 09:44:03AM -0500, Lucas De Marchi wrote:
>>On Sat, Jun 22, 2024 at 03:23:25AM GMT, Umesh Nerlige Ramappa wrote:
>>>Per client engine utilization uses RING_TIMESTAMP to return
>>>drm-total-cycles to the user. We read only the rcs RING_TIMESTAMP in
>>>platforms that have render. While this works for rcs and
>>>ccs, it is observed that this value is 0 when running work on bcs, vcs
>>>and vecs. Ideally we should read the engine specific RING_TIMESTAMP, but
>>
>>what do you mean by engine specific RING_TIMESTAMP? We are already
>>reading the engine specific copy of the same timestamp.
>
>We read RING_TIMESTAMP from the first available engine which in my 
>case was rcs (DG2).
>
>>AFAIR just getting the gt fw was working for reading this register 
>>from vcs, vecs, bcs.
>
>Well, issue could be DG2 specific, haven't tried other platforms. 
>Which platforms did you run it on? I will try to use the same.
>
>>Can you demonstrate the failure with a bug open or a series of
>>intel_reg invocations showing otherwise?
>
>This was found while running tests in this series, so I don't see any 
>open bugs.
>
>https://patchwork.freedesktop.org/series/135204/
>
>xe_drm_fdinfo --r drm-busy-idle --debug

Overlooked this earlier, looks like CI ran it already, so you can see 
the bug here (bcs total cycles are 0).

https://intel-gfx-ci.01.org/tree/intel-xe/IGTPW_11297/shard-dg2-432/igt@xe_drm_fdinfo@drm-busy-idle.html

Regards,
Umesh

>
>>
>>I think the simplest way to show it doesn't work is to call
>>`intel_reg write` to get a GT forcewake, then `intel_reg read` to read
>>this register.
>
>Don't know how to use this on Xe, I get a sigsegv.
>
>sudo ./intel_reg write 0x2358 0x00c0ffee
>Received signal SIGSEGV.
>Stack trace:
> #0 [fatal_sig_handler+0x175]
> #1 [__sigaction+0x50]
> #2 [intel_reg_write+0x589]
> #3 [main+0x339]
> #4 [__libc_init_first+0x90]
> #5 [__libc_start_main+0x80]
> #6 [_start+0x25]
>Segmentation fault (core dumped)
>
>Regards,
>Umesh
>
>>
>>Lucas De Marchi
>>
>>>to keep the logic simple, just get XE_FORCEWAKE_ALL instead of XE_GT_FW.
>>>
>>>This should work fine on multi-gt platforms as well since the
>>>gt_timestamp is in sync on all GTs.
>>>
>>>Fixes: 188ced1e0ff8 ("drm/xe/client: Print runtime to fdinfo")
>>>Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>>>---
>>>drivers/gpu/drm/xe/xe_drm_client.c | 4 ++--
>>>1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>>diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
>>>index 4a19b771e3a0..74f2244679f3 100644
>>>--- a/drivers/gpu/drm/xe/xe_drm_client.c
>>>+++ b/drivers/gpu/drm/xe/xe_drm_client.c
>>>@@ -264,9 +264,9 @@ static void show_run_ticks(struct drm_printer *p, struct drm_file *file)
>>>		if (!hwe)
>>>			continue;
>>>
>>>-		xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
>>>+		xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>		gpu_timestamp = xe_hw_engine_read_timestamp(hwe);
>>>-		xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
>>>+		xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>>>		break;
>>>	}
>>>
>>>-- 
>>>2.34.1
>>>
