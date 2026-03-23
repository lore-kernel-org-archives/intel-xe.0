Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B1DF483E9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Mar 2026 19:44:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C979610E3D2;
	Mon, 23 Mar 2026 19:44:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G1Uiqbcq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3281F10E3D2
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Mar 2026 19:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774295049; x=1805831049;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=/zv0BZTu+J28upDKeEYTMqbXHhMEJangC5px5IXnYq4=;
 b=G1UiqbcqNBuz1pA3vocGcpH7CT8R1O/ChREi/ar+v4FyEGQAd07opAe5
 JnMxJmJEhiDDBgVG418HBpwL1x8bc96JQ4dv9EEGcts0GGI47fWkl+yu9
 KHzO3Z9b3naX/djSZ8DaMRaZmBRutBI/yzlcjhYKER7p7IFewLfqcL0fr
 QBnyJjGrarURNCJciB3vuPeEDuG5Swyj4jE24Q5rJj0tNmn1F6OL+U9ns
 zK2Su5mr4bJ74+GHc4Z83uHbyv8vhSIBSZ/4EIgMm0unXof+YZgayKSOU
 DOEfRy1agesZktHMSCKKjZ3ncFKA+hZev4QfaK/kDoaqLw/8M6vW3gZDx A==;
X-CSE-ConnectionGUID: tAASgxu/RLyFFGNptxUZbA==
X-CSE-MsgGUID: HIseWnpFS1OqiaBfJEomHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="62859595"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; d="scan'208,217";a="62859595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:44:08 -0700
X-CSE-ConnectionGUID: AcusGct/SiujuZ1S42mQzQ==
X-CSE-MsgGUID: QgWDrT7URhSH0R1aFaxxDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
 d="scan'208,217";a="223191173"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2026 12:44:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:44:07 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 23 Mar 2026 12:44:07 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.65) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 23 Mar 2026 12:44:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zn5Cyf7JfRDJ5MDVDcBjauKoF/BuicIWMKaf83qFv9gq4hnMedX0L4ac01EO8bgi+WO80n92xoUKL0iSKu3Ckp4bNCROKHv4QDUFjgnfvkml+NYpCnM1Sc1Qedfa+lrCbVkdpNJAqhfpk50JrSmRUKzKgq242XVpm62BE7oIk8qXbaWPvf7boZZdAYLxQCWspwm+CMNTBKFArpm7ExwJipxIfHOGi4OopvHsxD8yFjI0qRSB6G1l5XjsSVWyc3awpRt7FVaUxpsJNkDc5wL8dgViRMopb9xczLwbI9X+Pky6LbnmhQekYFoCjCHYA9fJa41hxJJT0AF04lPztXvEew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yAJidd84RmtbtnbD0/xA9o5hhXY+Xg5+QFxK22wvOLI=;
 b=ntexcGg5wg9lOguc9bH6nUe1eFiN/T4agCLEo14AW+xQizNxZAlPOEHyetIQkz+2IT3gLp565OSesG+UhOe17R4Pdmt9Tw6nIq+eGzd5+nTl6vVflsFrRxRFuhPsHHJWHSXSn0+CRkzLYl5xUO0J//UEDFb/MpSpEfr2KnEt0HuwOcof5DbVYpLbT5lxStriYnAJ7SPsb003GjDeU9exvND3b4VOzse3VwOvAP0yCmhvmUmSF9ecorsauH6KYlI2k9C28uG060scZ6ut1B4K9LH1zaiFxq31QBRClVaWp7niAFyH7P/nCCb5EC+FYUZ7GD75SQq5JeCTJ9Kuj/3Byw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5624.namprd11.prod.outlook.com (2603:10b6:8:35::16) by
 CY5PR11MB6162.namprd11.prod.outlook.com (2603:10b6:930:29::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.19; Mon, 23 Mar 2026 19:44:00 +0000
Received: from DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::91c6:c5ce:2424:d1ce]) by DM8PR11MB5624.namprd11.prod.outlook.com
 ([fe80::91c6:c5ce:2424:d1ce%4]) with mapi id 15.20.9745.019; Mon, 23 Mar 2026
 19:44:00 +0000
Content-Type: multipart/alternative;
 boundary="------------BYIW1Un8MOuoUJ8VOMgz6V3l"
Message-ID: <b7e5a81d-6d68-41c6-95f2-69bd75270005@intel.com>
Date: Tue, 24 Mar 2026 01:13:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
To: Matthew Brost <matthew.brost@intel.com>, "Bhadane, Dnyaneshwar"
 <dnyaneshwar.bhadane@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250424092941.2819640-1-ravi.kumar.vodapalli@intel.com>
 <IA1PR11MB6266DE91973CDC2237B392E7E297A@IA1PR11MB6266.namprd11.prod.outlook.com>
 <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Vodapalli, Ravi Kumar" <ravi.kumar.vodapalli@intel.com>
In-Reply-To: <aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MAXPR01CA0102.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:5d::20) To DM8PR11MB5624.namprd11.prod.outlook.com
 (2603:10b6:8:35::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5624:EE_|CY5PR11MB6162:EE_
X-MS-Office365-Filtering-Correlation-Id: 3cc6de64-8db1-4046-a48f-08de891487f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|18002099003|22082099003|7053199007|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info: qRklPFxcwAUvZSjY4Wh4IdbymZQ+LaWu9zur5FAJWiKD+8/aWItHf7b7WiMeshH78s4pMU9tjqEoEbhu3MvMZ8Lk1UQZ95y6YhnDdvNZtRcfd77ekYrMCBI4QkKDA7lBXf+fv4c94cJr6Ar/oTdHczHJw3LiILgiBSM6LocyPgnlHOFseTH9bCSz0zStOXZ4BQ1sySRpimmbJDuNhQ/1lNQlx0imKFBweesFMLWXxVdEc4m0HLpmnnKI4ROZY0dVeewcBEq1FSBGHy1okjS7GNvBAFwDx7m3PHZjSAFG8rw3qi/4BHORGnlAodS+6W+ui92BbGncpcgqPANxcRE2P2fBO843wtS45CjBm0dj1/9vha1ZxcmVZvmtOXfDIsFluL9b7RU0R2F/ITFJ2EpjXjnCcyL2sdKAkXgNQ/WHM2P1TVPphPVMTYYiRHf558nxwhHnEQTXgexPMm4/Ev/OKMrP3mW/2Mh6rM7NkSGsBrjwwvJSL1/1TEBdJHLd6nbVFC9nX1vX0htHj6rUb0Yszc4rbr1rATFcGSnW4S0dj9X5OC7fb+HtktJooqbMKsJkK04ASBEK4M7GiQCZfqZDX/FbRiSH3+ByiT3dQQU4pI55BwJGzxmxydd1ah1Ic8NFAHIwuByxatdSCE09xRvN55sp0K/VEfZArqPpGrhz+hUZ+dqqdqkD6aKgPda8GXMVGMMNp6JxPm0UqvvllUEo/FSfSq8n081+uRTIjsY8pfM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5624.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(22082099003)(7053199007)(56012099003)(8096899003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cW5teWx1YmxaZFJNTllhMnRpcG5vV2pUQ1BCUlhOZEFDUm5JY1lHcHFvMGxD?=
 =?utf-8?B?WHluYU10RmV2anNjK2JEZGt4Qk1TMnNPSjQ5QnUveUtqS1R3aUowMXVMZEtV?=
 =?utf-8?B?YzlmVkV3RVNTa0Z3MVVMb0c5b1pXb2hPaGdaQ0ZEQVpmU3ZBajBBVmU4TFRH?=
 =?utf-8?B?ejdUQTdtYmwvRkRxQ1NXenA4RENFUkdxaFh4M3cxVGZ1dm9pOGlnbnVPc3Vq?=
 =?utf-8?B?cXJqYm5lbnh0eHlHVkdjS1UzMWRDY3NFL2N6ZVFIMEIxdUtZOGM4YXk1K3hr?=
 =?utf-8?B?VllFaERtUnNxdHJKcVVyanVlMTRQWnBnaVk2TTlrdFVFNHM0VFVEWnNWZUhj?=
 =?utf-8?B?VUZlV3BNMUdRWFlZQUZTN25HaUc4Q3BGNkRFZ0VnVE14b1R6VkZVM3BGOUxw?=
 =?utf-8?B?N1Rubm1hM2NqN0dJWEQ2eWdZQXk2Wk1DR0V5TExkUFFjaFlCTUVmN1BNVGVS?=
 =?utf-8?B?Y2x1K2lBcmJEUXh1akNCQ2RDZXVIbGRDS1BCVVFVUnZuZHgwTHh2V2VsM0FJ?=
 =?utf-8?B?MVBhdDNxcDNYMTRxbmRpWkdTdXAybWkzSXZMcjBQTnlGWU80Q3M4dy9wMDJC?=
 =?utf-8?B?N0VPeGhHZ0lvbWthbEIyOE1BMWhLMTZ4RitiQ2F2VkFXWnFnU3pHbmdxYjdu?=
 =?utf-8?B?d0d6eUhaS2JycTdHU0JOSHM5M2tKS1Y2K0pKVUxWcndOYmFIczFLTkRVenZk?=
 =?utf-8?B?R0k0R0FQZmlnMWg4a1RQSWdyN0kyRksrMHcwbGVZM2FXT1FLalNHMmMzSGps?=
 =?utf-8?B?RHRQTm5wU3diN0hxWlBMc0g5bktZTFBEMzFvTjhkUDRNS1JGc0g2VUpCcCsx?=
 =?utf-8?B?ajN5Ty9vTWticmVaM3VVZzU1T0FpWHZjaElOcGFOQXlKbk1HYmhaakVmalAw?=
 =?utf-8?B?eGlwdkQwcW03UXZjVHRNaWxlWnIybktsVHpUU2tYUzNtNmNkRVd5S2x6SWhw?=
 =?utf-8?B?RG9NTkxUM1UrdGtMcGozTm83MW5WQzlnRUtMS1BSMk53alkxNWJVaWl5MzFs?=
 =?utf-8?B?WWJ0a0V6V3JPZ2lMejdnMklyY0M1MnFMbzRKbHZLU2lseVEzRjdMZi9HOGd0?=
 =?utf-8?B?aDN0TmliZUo3YWhiS1ZhekdRNWdVby9HSHkwaHRCeU1ueFlJMWE3NFhjaVBZ?=
 =?utf-8?B?U3lMTXpPZDdqUGx3OHV3SEFORlpDdUNnTE8rMGtwZ0FxeFA3UDRrZUUzeVNO?=
 =?utf-8?B?cFB1eEU4bzB2MkIwb09abzFqU3BZL0ZvQVlpOEE5UHU1eGtPcEZQQnRWVmRG?=
 =?utf-8?B?REc5d3AyS003VHl6T2Z0dkJIanNkT2QraTRuWXVYbVRoMWpmMTg1M1ErSjlz?=
 =?utf-8?B?bG45WlBYK1NYUHNtSEROZmNxWWk4bGIyV3Rwcmp4WUd5cUJ5NjA3eGdFdzR5?=
 =?utf-8?B?eStyYnR4WG1xQkNud0p6aDY0b0gwWm5TQ2Jka0FlZmxuRnQvOS9JZy92OFZi?=
 =?utf-8?B?aG8zWEFYaVlucHBtcERuNVVVejdHNVZlWEdPK0RQV0VBVVB4RGwrbVc1d3VD?=
 =?utf-8?B?QzB5V0RNSmZwczJvZVRLRTdnRnZqUVpsZ3EwMGlRRW5iT0xQbDBhSWdQMXox?=
 =?utf-8?B?RWZNb1ZwMFJmTGRHSDlEdUtvZnVQMXduQWMrNGVHSDJQVU9FV3dlTFFPVzFa?=
 =?utf-8?B?aUsxclhvdE1aS2orTWZ6MDFzbjVTbWNvOExMVzRyUkxVQW1WeEJJaWJ2WTYv?=
 =?utf-8?B?YzJ1WTYyWWk1REtYY3FhTmVkeVdqT1Z4VEZkbGpIUHdHcDZoM0drLzNLakxo?=
 =?utf-8?B?SmFjNDU5Smp6YXh3OGlWSFRIUDRvOFo0dDJHQnlSUDhQUTE2ZlNYOGFlQWtz?=
 =?utf-8?B?K0VLZDVYMCtXYno5TVJOSE54WUpaZEFlZllHQWJqZlR6QVZmYWZhSG05bnph?=
 =?utf-8?B?OUxhTU5YbWlmdCs2cnd0NmNxQzljaDJoSnlPRllBWUgxcUdUa3dUcWRnNWJU?=
 =?utf-8?B?MFBadWlyYlVlRXVFSVg4d3NIQmszcUN0QmQ0ZHZ1UzhVeVl3cnUvQkhRcWtz?=
 =?utf-8?B?YldrUHpFdkhhSFJLMjZVemFhcFlMRUFYZ3pIT1pLeWFLbVI3QnhLZmRMZmtX?=
 =?utf-8?B?N3JJRUcwUmxlM2FrUDQyenZTWVpnVjlqdWhLZ0dBZ2dKdWVUSVovZ0t1NVJC?=
 =?utf-8?B?M1hOL3NQa3J4ZHJ1MkZtcktBYm1rYzlCeUdubjVkTHNNaHhleHkxYTdyVzRi?=
 =?utf-8?B?bzNVcDMyUXB4L21jQUg0Z1REZTJhTW81WDczbGlZYVFlU2Jqb0ZnOGNVOWJ4?=
 =?utf-8?B?aXRGeUlmc2wrcEx2NjR0QUtHM3N3NEtia0drL3REVnpYTkhKUVdWaXF3cXBm?=
 =?utf-8?B?SjZsRTFlakF0OGJiSkJYZUtBTzlaeHBlMzJUeEFLVjgyTWFyVGJVZEFZb0pZ?=
 =?utf-8?Q?dRSeGZuruoAhbqlo=3D?=
X-Exchange-RoutingPolicyChecked: ltO9wP0S0M4JVuA3Uao0ZxVOevctNBpA+2G0UuyYbnClGgivlFqw0CQVIjIjMirebrpMPo6IJlLZwQlnFDGNKco6/B7StTL6hohtl8o3tPbjKkneAGUNbaIvxznqySL3HSDyJgUOUEmwqcEKZf7hXa7oUch2R5pj+JagUYgQfUbSONcaPwfuQMAUguV64XYPxNPSn23AMVW5OzCsJq7glgFLJAypwMWBQ4oxbc8DL2ldNl/FqF8O7UOiFN0VP23X8jrTsCN27X4XxYitBgaI2u2sulT2dV0bnEFgZwEN84/3zdD1Efs1qUl2ThHMCD+A0bkt6qHhQXA38psAmVdCiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cc6de64-8db1-4046-a48f-08de891487f9
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5624.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 19:44:00.7985 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HjmJ8jy0g0xcaAX4ZRPKwy0ur3VClSUtOzjZ8Z0FSH4loS62ro3m26K/HES4mxvrvD+nHINyWJwMTP5aljV6+HDzTdCYXZvtw+dBeg6Vgsg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6162
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

--------------BYIW1Un8MOuoUJ8VOMgz6V3l
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 2/20/2026 1:03 AM, Matthew Brost wrote:
> On Mon, May 12, 2025 at 06:42:03AM +0000, Bhadane, Dnyaneshwar wrote:
>>
>>> -----Original Message-----
>>> From: Vodapalli, Ravi Kumar<ravi.kumar.vodapalli@intel.com>
>>> Sent: Thursday, April 24, 2025 3:00 PM
>>> To:intel-xe@lists.freedesktop.org
>>> Cc: Vivekanandan, Balasubramani<balasubramani.vivekanandan@intel.com>;
>>> Roper, Matthew D<matthew.d.roper@intel.com>; De Marchi, Lucas
>>> <lucas.demarchi@intel.com>; Sousa, Gustavo<gustavo.sousa@intel.com>;
>>> Taylor, Clinton A<clinton.a.taylor@intel.com>; Atwood, Matthew S
>>> <matthew.s.atwood@intel.com>; Bhadane, Dnyaneshwar
>>> <dnyaneshwar.bhadane@intel.com>; Kalvala, Haridhar
>>> <haridhar.kalvala@intel.com>; Chauhan, Shekhar
>>> <shekhar.chauhan@intel.com>
>>> Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions
>>>
>>> In existing code for PIPE CONTROL post sync operation instructions
>>> POST_SYNC prefix is not present in the name, add it so that it will represent it
>>> is a post sync operation type.
>> Is there a specific reason for this renaming? Is it truly necessary?
>> Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive.
>> If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_TIMESTAMP.
>> This refers to all the post-sync operation types defined and used in the code within the Xe/i915 context.
>>
>> Renaming can clutter the Git history with unnecessary changes, making it harder to track the evolution of the code and understand the reasons behind certain modification.
> I don't think we should consider git history too much in when making
> choices about renaming. If this is a better name, more inline with bspec
> I'd say let's use a better name. If we need to rename more operations
> with post-sync prefixes, let's also do that.

> I have checked bspec only these are the changes with POST_SYNC prefix.

Ravi Kumar


> Matt
>
>> Regards,
>> Dnyaneshwar
>>> Signed-off-by: Ravi Kumar Vodapalli<ravi.kumar.vodapalli@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
>>>   drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
>>>   2 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> index 8cfcd3360896..75efdacc4979 100644
>>> --- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> +++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
>>> @@ -54,7 +54,7 @@
>>>   #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1<<19)
>>>   #define	  PIPE_CONTROL_TLB_INVALIDATE
>>> 	BIT(18)
>>>   #define   PIPE_CONTROL_PSD_SYNC				(1<<17)
>>> -#define   PIPE_CONTROL_QW_WRITE				(1<<14)
>>> +#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1<<14)
>>>   #define   PIPE_CONTROL_DEPTH_STALL			(1<<13)
>>>   #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1<<12)
>>>   #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1<<11)
>>> diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> index a7582b097ae6..da50213b78c5 100644
>>> --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> @@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
>>> invalidate_tlb, u32 *dw,
>>>   		PIPE_CONTROL_VF_CACHE_INVALIDATE |
>>>   		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
>>>   		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
>>> -		PIPE_CONTROL_QW_WRITE |
>>> +		PIPE_CONTROL_POST_SYNC_QW_WRITE |
>>>   		PIPE_CONTROL_STORE_DATA_INDEX;
>>>
>>>   	if (invalidate_tlb)
>>> @@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
>>> bool stall_only, u32 *dw,
>>>   			      int i)
>>>   {
>>>   	u32 flags = PIPE_CONTROL_CS_STALL |
>>> PIPE_CONTROL_GLOBAL_GTT_IVB |
>>> -		    PIPE_CONTROL_QW_WRITE;
>>> +		    PIPE_CONTROL_POST_SYNC_QW_WRITE;
>>>
>>>   	if (!stall_only)
>>>   		flags |= PIPE_CONTROL_FLUSH_ENABLE;
>>> --
>>> 2.25.1
--------------BYIW1Un8MOuoUJ8VOMgz6V3l
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 2/20/2026 1:03 AM, Matthew Brost
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">On Mon, May 12, 2025 at 06:42:03AM +0000, Bhadane, Dnyaneshwar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">

</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">-----Original Message-----
From: Vodapalli, Ravi Kumar <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kumar.vodapalli@intel.com">&lt;ravi.kumar.vodapalli@intel.com&gt;</a>
Sent: Thursday, April 24, 2025 3:00 PM
To: <a class="moz-txt-link-abbreviated" href="mailto:intel-xe@lists.freedesktop.org">intel-xe@lists.freedesktop.org</a>
Cc: Vivekanandan, Balasubramani <a class="moz-txt-link-rfc2396E" href="mailto:balasubramani.vivekanandan@intel.com">&lt;balasubramani.vivekanandan@intel.com&gt;</a>;
Roper, Matthew D <a class="moz-txt-link-rfc2396E" href="mailto:matthew.d.roper@intel.com">&lt;matthew.d.roper@intel.com&gt;</a>; De Marchi, Lucas
<a class="moz-txt-link-rfc2396E" href="mailto:lucas.demarchi@intel.com">&lt;lucas.demarchi@intel.com&gt;</a>; Sousa, Gustavo <a class="moz-txt-link-rfc2396E" href="mailto:gustavo.sousa@intel.com">&lt;gustavo.sousa@intel.com&gt;</a>;
Taylor, Clinton A <a class="moz-txt-link-rfc2396E" href="mailto:clinton.a.taylor@intel.com">&lt;clinton.a.taylor@intel.com&gt;</a>; Atwood, Matthew S
<a class="moz-txt-link-rfc2396E" href="mailto:matthew.s.atwood@intel.com">&lt;matthew.s.atwood@intel.com&gt;</a>; Bhadane, Dnyaneshwar
<a class="moz-txt-link-rfc2396E" href="mailto:dnyaneshwar.bhadane@intel.com">&lt;dnyaneshwar.bhadane@intel.com&gt;</a>; Kalvala, Haridhar
<a class="moz-txt-link-rfc2396E" href="mailto:haridhar.kalvala@intel.com">&lt;haridhar.kalvala@intel.com&gt;</a>; Chauhan, Shekhar
<a class="moz-txt-link-rfc2396E" href="mailto:shekhar.chauhan@intel.com">&lt;shekhar.chauhan@intel.com&gt;</a>
Subject: [PATCH] drm/xe: Add POST_SYNC prefix to post sync instructions

In existing code for PIPE CONTROL post sync operation instructions
POST_SYNC prefix is not present in the name, add it so that it will represent it
is a post sync operation type.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Is there a specific reason for this renaming? Is it truly necessary?
Regardless, the terms PIPE_CONTROL_POST_SYNC_TYPE_QW_WRITE and PIPE_CONTROL_POST_SYNC_OP_TYPE_QW_WRITE would be more descriptive. 
If renaming is indeed required, it should be applied to PIPE_CONTROL_WRITE_TIMESTAMP. 
This refers to all the post-sync operation types defined and used in the code within the Xe/i915 context.

Renaming can clutter the Git history with unnecessary changes, making it harder to track the evolution of the code and understand the reasons behind certain modification.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I don't think we should consider git history too much in when making
choices about renaming. If this is a better name, more inline with bspec
I'd say let's use a better name. If we need to rename more operations
with post-sync prefixes, let's also do that.
</pre>
    </blockquote>
    <br>
    <blockquote type="cite" cite="mid:aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre"><span style="white-space: normal">I have checked bspec only these are the changes with POST_SYNC prefix.&nbsp;</span></pre>
    </blockquote>
    <p>Ravi Kumar</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:aZdliOGe1fXUtF78@lstrano-desk.jf.intel.com">
      <pre wrap="" class="moz-quote-pre">
Matt 

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
Regards,
Dnyaneshwar
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">
Signed-off-by: Ravi Kumar Vodapalli <a class="moz-txt-link-rfc2396E" href="mailto:ravi.kumar.vodapalli@intel.com">&lt;ravi.kumar.vodapalli@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/instructions/xe_gpu_commands.h | 2 +-
 drivers/gpu/drm/xe/xe_ring_ops.c                  | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
index 8cfcd3360896..75efdacc4979 100644
--- a/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
+++ b/drivers/gpu/drm/xe/instructions/xe_gpu_commands.h
@@ -54,7 +54,7 @@
 #define   PIPE_CONTROL_GLOBAL_SNAPSHOT_RESET		(1&lt;&lt;19)
 #define	  PIPE_CONTROL_TLB_INVALIDATE
	BIT(18)
 #define   PIPE_CONTROL_PSD_SYNC				(1&lt;&lt;17)
-#define   PIPE_CONTROL_QW_WRITE				(1&lt;&lt;14)
+#define   PIPE_CONTROL_POST_SYNC_QW_WRITE		(1&lt;&lt;14)
 #define   PIPE_CONTROL_DEPTH_STALL			(1&lt;&lt;13)
 #define   PIPE_CONTROL_RENDER_TARGET_CACHE_FLUSH	(1&lt;&lt;12)
 #define   PIPE_CONTROL_INSTRUCTION_CACHE_INVALIDATE	(1&lt;&lt;11)
diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c
b/drivers/gpu/drm/xe/xe_ring_ops.c
index a7582b097ae6..da50213b78c5 100644
--- a/drivers/gpu/drm/xe/xe_ring_ops.c
+++ b/drivers/gpu/drm/xe/xe_ring_ops.c
@@ -145,7 +145,7 @@ static int emit_pipe_invalidate(u32 mask_flags, bool
invalidate_tlb, u32 *dw,
 		PIPE_CONTROL_VF_CACHE_INVALIDATE |
 		PIPE_CONTROL_CONST_CACHE_INVALIDATE |
 		PIPE_CONTROL_STATE_CACHE_INVALIDATE |
-		PIPE_CONTROL_QW_WRITE |
+		PIPE_CONTROL_POST_SYNC_QW_WRITE |
 		PIPE_CONTROL_STORE_DATA_INDEX;

 	if (invalidate_tlb)
@@ -216,7 +216,7 @@ static int emit_pipe_imm_ggtt(u32 addr, u32 value,
bool stall_only, u32 *dw,
 			      int i)
 {
 	u32 flags = PIPE_CONTROL_CS_STALL |
PIPE_CONTROL_GLOBAL_GTT_IVB |
-		    PIPE_CONTROL_QW_WRITE;
+		    PIPE_CONTROL_POST_SYNC_QW_WRITE;

 	if (!stall_only)
 		flags |= PIPE_CONTROL_FLUSH_ENABLE;
--
2.25.1
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BYIW1Un8MOuoUJ8VOMgz6V3l--
