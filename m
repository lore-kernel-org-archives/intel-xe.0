Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4514FCD1296
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 19:22:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A86112AC3;
	Wed, 10 Apr 2024 19:22:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iLn8UnvF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F42C10E3CC;
 Wed, 10 Apr 2024 19:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712776944; x=1744312944;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=vMVvhH+RpdnN3la+LZfWROO3mHFtIqABW/MFE3w1DmU=;
 b=iLn8UnvFSz497uc7GsXbIrHPUX8It6xHsmi2Qv3xwpkWw+XI1JM3CniN
 pLhssaiq3mkSzhmQ6uD17h6ifwDq0WPouw6LXaJe7sfF1DRSkcYWFDQo3
 r9v2QhXvyZRxWjn1pL0pYY/6gZ1BP1iVQvWq+m0PVlzxPh3U53CsjVfSQ
 5k6qYetd4z/mDYwSTE6CIBbrn9IX6FP8u8//RRBKVVv3fbU9vjbyq/iLG
 6xzpEFL8dC6SvoPLe+SroTFYGFr4aNGxFI0juf9sS2GIfvCkAmbR8S0WH
 BB+6DygUjkPu3Yfb7Zp2CcN1+7rh1w91Bk7c48lXrvcSwSzzuKrGSwmUa A==;
X-CSE-ConnectionGUID: T0H1zmf0Rr+yYUuAsRgyCw==
X-CSE-MsgGUID: IaS6CPnVQkGOTqbly9rt7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="19552577"
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="19552577"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 12:22:23 -0700
X-CSE-ConnectionGUID: UW+166xkTNmMx4RF7ZO9ag==
X-CSE-MsgGUID: XltayiIFR9SlbZs5pOwXaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,191,1708416000"; d="scan'208";a="21088384"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 12:22:23 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 12:22:22 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 12:22:22 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 12:22:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jr7/zXUS7L4aebUCR7q/4wOHQlrAyeS2TmdHRVcVzGGxtAqChtHZOaZ8yEh75kJsU8yrO4n9GRKD2RG8mgc/fm6KWJCPSlhBlPuK9BABtqDjAi6TTs7ilJOJjqD8oZeT0NqKgu0i/AZs4+hBe3uwtyLxNVeQvfslswEweeFgY/1o82ETarGxXDl6BYbU4Ea9rGPMIX+BEJTe0+lEY17pjyNn/11zXfitDcRr2fBuqTVcN0Z7l2FVL0T/BKsh6u8FjJ5TtKYDByg8r2+IU0KHioQ1iVBkjEANJ31UzZAodIsDCbiwmgYT2B2WwCIPprzamlUIwKOeI65qmo2xb4rGaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wAuH2CKeyiMwCd89wE8ePvyPuf73S9cOAi21XONd+7k=;
 b=hezShUZnR+1aznBZqidMUMS0D/dBYGqif+sm9onSMpWIwz4JOS2MLiDkw4LvLSfoUVhW9st8mNDCQ5i7JGcCqy9KKz63b3fSMXtM9jfF3Ma6YjktGixKAjkxSZMAlv6fkOT9i8YyawcxUvMpmKFOIwWudk2XNYYImrWuAgeeKpG62HJY9CeY5EcAgSnSOeQoNEKlKVuBYqEUactc355Lx0h2Vhr3zZKhD7EDaNYp66Spu/NW5zi2om6x+Kh8q1igwQl7j1tyguTi4mGsZItUyvGayKJUsCsYBOi8vOVJ4WQaon09GbdL6+Am5ejz3FItEnbHm4K94uTju3fYYnpU8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by BL1PR11MB5956.namprd11.prod.outlook.com (2603:10b6:208:387::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.25; Wed, 10 Apr
 2024 19:22:19 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 19:22:18 +0000
Message-ID: <31816663-8429-4792-a032-df5eff8a1e4e@intel.com>
Date: Wed, 10 Apr 2024 12:22:14 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
 domain aware
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "igt-dev@lists.freedesktop.org"
 <igt-dev@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
References: <20240402122223.643413-1-tejas.upadhyay@intel.com>
 <20240402194017.GJ6574@mdroper-desk1.amr.corp.intel.com>
 <kss23fgx24bvhlarkvrivrvvh32pxugpvgavdo3tc4u55jmidf@rnr7terjza6w>
 <SJ1PR11MB62041F26676765342848070D813D2@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <7eac7b89-8c32-4261-b288-0cf2002b4e93@intel.com>
 <SJ1PR11MB6204AA1AFB30BFEF7EBAA3D281032@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <76010aec-7937-4e5a-afd2-672b338df8df@intel.com>
 <ZhCKOUi3cn+n2p8j@DUT025-TGLU.fm.intel.com>
 <d03eddc7-f35f-422f-be9a-1d5af78ecd77@intel.com>
 <SJ1PR11MB620459806AE14F3301D0E39381002@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <SJ1PR11MB6204DA50D5580560728D53CC81002@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <SJ1PR11MB6204DA50D5580560728D53CC81002@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0052.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::27) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|BL1PR11MB5956:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nNcbiJzTfaew7m8/xSbguXFXYjEtQBQajozNIKQjDbktKELLcnkikni+OaJipEucIePz+XHzRJd6XpoERPaxf8bwwGTL9ZpDWP8KEklp0MvO6/hiqyBAv4ZamkBeGK2l/JBT60hOGeR9db4U///mFV2b82lyv8Nccj2/cCqZg44UQMZAIfbuHwJ8bFwk5KF2CHa36yE5ro9tc3M2kKsnA2MdDPie0AozOZAztGw3IqY+LxAE6VktmqCzJq0YWflObIxakIzTnP1Sqr4J2kZcpLsEVqRmFMKJVmcrwOIhipjpI6zqYgHTBkaPwtFWyhTFKInUVUxZAZtLEAHsCK27Q+SvTAGkDWDiGWRq15eCqXxaqAiF4jQIVe1lbGAPLVbKgq/j7gBb8tahRqszqPKqbE6llKWkeooOb/4RKSFUzCHFnleTDJnoPrr4DD+zonj8oeH2Kbl04hJjrE+mj8XqLezhc3LYAOh5MKa+5IT9mP+uLRzKvM8T1mxVfEbm506kdHbZbaIuuc3/ZOiZRP6UWtoZtcmz1IDa1L2THMmvSyVsQcJjBZTBl6Qc0LA0FNZXL22A+ghNjf+z1YjCMQAnI5Ul4WcHo9v/L1amn4+RbW4ky7g/orvaYLbdvEmvWlrB3LduQ+2FXcYC1nOT1yGL3WKl6Yqx1sXjPccyyK2x+Ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2J4SHVFV2pzYit1NUZZQTVmWlNPTUw2dnBhQXRiTWEvT1hVU01DbVpFdHdm?=
 =?utf-8?B?aHJ2d1lWNXdjQTVZaXJHallOOFhKOXo0WVFxVHhwRE9QUWpNbzhWcjJhNitN?=
 =?utf-8?B?OXBwZWdSYWczckxQdHgvRlQrSHZ3K1Rka0Mzb1FidFVnV1FZaVVsdmkweGxH?=
 =?utf-8?B?TkMzZE1oOHRzZUJXaWdFV3hMTnFqZTVKYzdqK1BIa1FObmxwSHE1RStzRkJx?=
 =?utf-8?B?WlE3K3RIOC9RWlpxQnZQUnI4cmU0WW1LbmFkSG9pMlN0S2Mwd05qdEN1ZXVO?=
 =?utf-8?B?YTgwc0tpYUhJVEYwMTNjckhMRUQ2L0lkaFpucjY3WCtpT3AveDh3WmxpMlBY?=
 =?utf-8?B?SXJLbGNvSlNEU3ZzQWVNN280RDhEb2VOd2tJMXEzcFUrZm13bFFqTWtmNE84?=
 =?utf-8?B?QVQ0L0JudURYTmtyY21QVGs0cTdINm1sRGk2ZVkrQjhiNU5xaW13eDdsb1Zj?=
 =?utf-8?B?a2p5ZGdvT2pLRWhIR0txTTdCQ3FBSzM3NGZKQnVVZXFCM1MydjBvR0NnZzdm?=
 =?utf-8?B?WHpxb2wvZ1FYK0Zxamppbmxwcjk4ZlVwUENxTDJBbUNJUGEyZHI1L2pJN3pZ?=
 =?utf-8?B?VHRjemZ2eml2ZExGRGZVMTdHcHN5VmMwSkdIZzVpRXlwTVU1Mi9nSnM4YmJC?=
 =?utf-8?B?ejlzcE8wY2haQzExTFhlRTQxL3dMTnY1ckNsdzBuRS9ZQm5VOFVDUnVHZ1Uv?=
 =?utf-8?B?SXlRN2duWmgyQzF2c2xISmg3Q1RKMmpmNkRFemV4b3M5RzhLaUJjRnJZV0hX?=
 =?utf-8?B?ZHBUTzZvU1hHZEQzUG5HUnJvQTN5elpmejRJbWp0Wm5OMjZiUitCM3I5WHJF?=
 =?utf-8?B?aDYyZmFKdzZuTThyVzRKVVZPZ1dWZHMyRGZFSHJQZm4ySDFJODNxS25ZS1k2?=
 =?utf-8?B?RTdmSC9yVEhSL1Jmdk9PTFBML3ROSTRYMEoxWFRhdUdpS1dBSitiR0lmV3pi?=
 =?utf-8?B?SHJXNVBhN1p5aDVLd1ZjZmRXZkpRWENqYm1ic2FYVFhZelhwVEQ5YisvRVps?=
 =?utf-8?B?MzFjbFgyTEkzTkh2QWt5ZE54Q1NuOVVPY2NsdUY3TmFnV0MxQmRFcU15S1Jm?=
 =?utf-8?B?NHhIdkxNL0JFNkVBSnZCMnkrTlJMK2FGc3RRWHV6dUlJVGdOcUdUK3JGWEp2?=
 =?utf-8?B?aVZBVVEzenV6K1kyeFlRclV3c0tiZUNXa3ZjOFBMdU1IdGVxSEthV085dVVB?=
 =?utf-8?B?elgrS2t6dXh5NDg1ME9nUmc2Zi9uc1lQT3dYcFFBbUtYWXdTQmVWK3BzSm1v?=
 =?utf-8?B?dGJNcHBGUStiMUNEOUdlY1hCOGV3aGM2cEIxWjlxdzB2bmY3UUpDK2N1aXRB?=
 =?utf-8?B?M3JVTjNTSUFWZVBiV1N6Nk0xY1R2WnpLa2RCT0paRlNxMHgzcmNuWUlJVlNz?=
 =?utf-8?B?UnNMTTFXQUE2RExDOHRSYzA2VWJLVUxwOEZLUTNrTlB3Um1VbnQyOEw4enQ3?=
 =?utf-8?B?VmVRUHB2eUsrZnBKaytCcmNzQmpkYkZtZjNRdUhoaE9RNFRuYXMrWWVxOWp1?=
 =?utf-8?B?NGVaa3hmUFJyT1AvU1lDOXVVWVJIOHNEWDQwcVRnTXFWZ3U3YVBHT2EzOUJw?=
 =?utf-8?B?MFJFTFRMdVVMR3hWeEFoYWxjNkV3cWFqSytZUVVIMU1DVUlCMDRPcDR2ZWda?=
 =?utf-8?B?VnJEdlNBRnllTVNyUHVZdGNvekNadlhocitoeDlzM0w1UDBHSEF4bnQxSGRk?=
 =?utf-8?B?Mzd1Rmp3c2RUcjM5Z2FRUVY4QWZVWVJkN01WdmF2bjkyczFZRldJSTc2WXYy?=
 =?utf-8?B?N25EUk9ub3YvNnNiWVE0QU1rRGN6cFkyNHQ2OFZXQ1dxcnZpVDgyeWpVV2JK?=
 =?utf-8?B?TnhRUXAxWS9sNU1YY2JpUXo3bXVHdmlpY2NzMlY0amNlWXFTZDh0dWpPR1lj?=
 =?utf-8?B?ZXFYWTVYclF1VFlKRmd3U1RSYnFKYkVpaTNsWUh0VE1vblo5d05vQVdKZXdv?=
 =?utf-8?B?TjBWbUFRaTBqcmxlOVUxc2dZYW9RSmZCYUVaaElIWGJBUTRKUUVCRWVxTlNV?=
 =?utf-8?B?QVdsN0xNcGxYTDdZWUxvMHRzSDlLTDF2ZWpIbC9KZWdDOFFQRjhJdjRXQ0ZN?=
 =?utf-8?B?a0dsUDk2c2tBVUd1SVVnZW44ay8yVXE0UGp4OXBpOG9uemJ1Z2kyRFA4TUVx?=
 =?utf-8?B?T0ltelhudTd0c2J3OUtlOTZ0dVdyTFhHdUFTbkJKYzQ5eEdCV2lSWm1vQmp4?=
 =?utf-8?B?T0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 87514e1c-297c-44e4-9c93-08dc599389b2
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 19:22:18.7100 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p+rPcuVeav4ag7i9Od7GhioUY+mIY4kSKnE4YMIzaiMxXEqk70Mf+mOSMNEh7sVPfYIV1ARDHWGTE0J1W5VaXKAuMQwCpgpD3rMLCGYwPw0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5956
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

On 4/8/2024 05:00, Upadhyay, Tejas wrote:
>> -----Original Message-----
>> From: Upadhyay, Tejas
>> Sent: Monday, April 8, 2024 10:54 AM
>> To: Harrison, John C <john.c.harrison@intel.com>; Brost, Matthew
>> <matthew.brost@intel.com>
>> Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Roper, Matthew D
>> <matthew.d.roper@intel.com>; igt-dev@lists.freedesktop.org; intel-
>> xe@lists.freedesktop.org
>> Subject: RE: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests reset
>> domain aware
>>
>>
>>
>>> -----Original Message-----
>>> From: Harrison, John C <john.c.harrison@intel.com>
>>> Sent: Saturday, April 6, 2024 5:13 AM
>>> To: Brost, Matthew <matthew.brost@intel.com>
>>> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; De Marchi, Lucas
>>> <lucas.demarchi@intel.com>; Roper, Matthew D
>>> <matthew.d.roper@intel.com>; igt-dev@lists.freedesktop.org; intel-
>>> xe@lists.freedesktop.org
>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang tests
>>> reset domain aware
>>>
>>> On 4/5/2024 16:33, Matthew Brost wrote:
>>>> On Fri, Apr 05, 2024 at 11:15:14AM -0700, John Harrison wrote:
>>>>> On 4/4/2024 21:47, Upadhyay, Tejas wrote:
>>>>>>> -----Original Message-----
>>>>>>> From: Harrison, John C<john.c.harrison@intel.com>
>>>>>>> Sent: Friday, April 5, 2024 4:53 AM
>>>>>>> To: Upadhyay, Tejas<tejas.upadhyay@intel.com>; De Marchi, Lucas
>>>>>>> <lucas.demarchi@intel.com>; Roper, Matthew D
>>>>>>> <matthew.d.roper@intel.com>
>>>>>>> Cc:igt-dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org;
>>>>>>> Brost, Matthew<matthew.brost@intel.com>
>>>>>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang
>>>>>>> tests reset domain aware
>>>>>>>
>>>>>>> On 4/2/2024 22:35, Upadhyay, Tejas wrote:
>>>>>>>>> -----Original Message-----
>>>>>>>>> From: De Marchi, Lucas<lucas.demarchi@intel.com>
>>>>>>>>> Sent: Wednesday, April 3, 2024 2:26 AM
>>>>>>>>> To: Roper, Matthew D<matthew.d.roper@intel.com>
>>>>>>>>> Cc: Upadhyay, Tejas<tejas.upadhyay@intel.com>; igt-
>>>>>>>>> dev@lists.freedesktop.org;intel-xe@lists.freedesktop.org;
>>>>>>>>> Brost, Matthew<matthew.brost@intel.com>
>>>>>>>>> Subject: Re: [PATCH V2 i-g-t] tests/xe_exec_threads: Make hang
>>>>>>>>> tests reset domain aware
>>>>>>>>>
>>>>>>>>> On Tue, Apr 02, 2024 at 12:40:17PM -0700, Matt Roper wrote:
>>>>>>>>>> On Tue, Apr 02, 2024 at 05:52:23PM +0530, Tejas Upadhyay wrote:
>>>>>>>>>>> RCS/CCS are dependent engines as they are sharing reset domain.
>>>>>>>>>>> Whenever there is reset from CCS, all the exec queues running
>>>>>>>>>>> on RCS are victimised mainly on Lunarlake.
>>>>>>>>>>>
>>>>>>>>>>> Lets skip parallel execution on CCS with RCS.
>>>>>>>>>> I haven't really looked at this specific test in detail, but
>>>>>>>>>> based on your explanation here, you're also going to run into
>>>>>>>>>> problems with multiple CCS engines since they all share the
>>>>>>>>>> same reset.  You won't see that on platforms like LNL that
>>>>>>>>>> only have a single CCS, but platforms
>>>>>>>>> but it is seen on LNL because of having both RCS and CCS.
>>>>>>>>>
>>>>>>>>>> like PVC, ATS-M, DG2, etc. can all have multiple CCS where a
>>>>>>>>>> reset on one kills anything running on the others.
>>>>>>>>>>
>>>>>>>>>>
>>>>>>>>>> Matt
>>>>>>>>>>
>>>>>>>>>>> It helps in fixing following errors:
>>>>>>>>>>> 1. Test assertion failure function test_legacy_mode, file,
>>>>>>>>>>> Failed
>>>>>>>>>>> assertion: data[i].data == 0xc0ffee
>>>>>>>>>>>
>>>>>>>>>>> 2.Test assertion failure function xe_exec, file
>>>>>>>>>>> ../lib/xe/xe_ioctl.c, Failed assertion: __xe_exec(fd, exec)
>>>>>>>>>>> == 0,
>>>>>>>>>>> error: -125 != 0
>>>>>>>>>>>
>>>>>>>>>>> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
>>>>>>>>>>> ---
>>>>>>>>>>>      tests/intel/xe_exec_threads.c | 26
>> +++++++++++++++++++++++++-
>>>>>>>>>>>      1 file changed, 25 insertions(+), 1 deletion(-)
>>>>>>>>>>>
>>>>>>>>>>> diff --git a/tests/intel/xe_exec_threads.c
>>>>>>>>>>> b/tests/intel/xe_exec_threads.c index 8083980f9..31af61dc9
>>>>>>>>>>> 100644
>>>>>>>>>>> --- a/tests/intel/xe_exec_threads.c
>>>>>>>>>>> +++ b/tests/intel/xe_exec_threads.c
>>>>>>>>>>> @@ -710,6 +710,17 @@ static void *thread(void *data)
>>>>>>>>>>>      	return NULL;
>>>>>>>>>>>      }
>>>>>>>>>>>
>>>>>>>>>>> +static bool is_engine_contexts_victimized(int fd, unsigned
>>>>>>>>>>> +int
>>>>>>>>>>> +flags) {
>>>>>>>>>>> +	if (!IS_LUNARLAKE(intel_get_drm_devid(fd)))
>>>>>>>>>>> +		return false;
>>>>>>>>> as above, I don't think we should add any platform check here.
>>>>>>>>> It's impossible to keep it up to date and it's also testing the
>>>>>>>>> wrong
>>> thing.
>>>>>>>>> AFAIU you don't want parallel submission on engines that share
>>>>>>>>> the same reset domain. So, this is actually what should be tested.
>>>>>>>> Platforms like  PVC, ATS-M, DG2, etc. have some kind of WA/noWA
>>>>>>>> which
>>>>>>> helps to run things parallelly on engines in same reset domain
>>>>>>> and apparently BMG/LNL does not have that kind of support so
>>>>>>> applicable for LNL/BMG with parallel submission on RCS/CCS only.
>>>>>>>> @Harrison, John C please reply if you have any other input here.
>>>>>>> I don't get what you mean by 'have some kind of WA/noWA'. All
>>>>>>> platforms with compute engines have shared reset domains. That is
>>>>>>> all
>>> there is to it. I.e.
>>>>>>> everything from TGL onwards. That includes RCS and all CCS engines.
>>>>>>> So RCS + CCS, CCS0 + CCS1, RCS + CC0 + CCS1, etc. Any platform
>>>>>>> with multiple engines that talk to EUs will reset all of those
>>>>>>> engines in
>>> parallel.
>>>>>>> There are w/a's which make the situation even worse. E.g. on
>>>>>>> DG2/MTL you are not allowed to context switch one of those
>>>>>>> engines
>>> while another is busy.
>>>>>>> Which means that if one hangs, they all hang - you cannot just
>>>>>>> wait for other workloads to complete and/or pre-empt them off the
>>>>>>> engine prior to doing the shared reset. But there is nothing that makes
>> it better.
>>>>>>> I assume we are talking about GuC triggered engine resets here?
>>>>>>> As opposed to driver triggered full GT resets?
>>>>>>>
>>>>>>> The GuC will attempt to idle all other connected engines first by
>>>>>>> pre-empting out any executing contexts. If those contexts are
>>>>>>> pre-emptible then they will survive - GuC will automatically
>>>>>>> restart them once the reset is complete. If they are not (or at
>>>>>>> least not pre-emptible within the pre-emption timeout
>>>>>>> limit) then they will be killed as collateral damage.
>>>>>>>
>>>>>>> What are the workloads being submitted by this test? Are the
>>>>>>> pre-emptible spinners? If so, then they should survive (assuming
>>>>>>> you don't have the DG2/MTL RCS/CCS w/a in effect). If they are
>>>>>>> non-preemptible spinners then they are toast.
>>>>>> Main question here was, if this fix should be applied to all
>>>>>> platforms who
>>> has RCS and CCS both or just LNL/BMG. Reason to ask is, only LNL/BMG
>>> are hitting this issue, with same tests PVC and other platforms are
>>> not hitting issue which we are addressing here.
>>>>> And the answer is that yes, shared reset domains are common to all
>>>>> platforms with compute engines. So if only LNL/BMG are failing then
>>>>> the problem is not understood. Which is not helped by this test
>>>>> code being extremely complex and having almost zero explanation in it at
>> all :(.
>>>> Let me explain what this test is doing...
>>>>
>>>> - It creates a thread per hardware engine instance
>>>> - Within each thread it creates many exec queues targeting 1 hardware
>>>>     instance
>>>> - It submits a bunch of batches which do dword write the exec queues
>>>> - If the HANG flag is set, 1 of the exec queue per thread will insert a
>>>>     non-preemptable spinner. It is expected the GuC will reset this exec
>>>>     queue only. Cross CCS / RCS resets will break this as one of the
>>>>     'good' exec queues from another thread could also be reset.
>>> If the 'good' workloads are pre-emptible then they should not be reset.
>>> The GuC will attempt to pre-empt all shared domain engines prior to
>>> triggering any resets. If they are being killed then something is
>>> broken and needs to be fixed.
>>>
>>>> - I think the HANG sections can fail on PVC too (VLK-57725)
>>>> - This is racey, as if the resets occur when all the 'bad' exec queues
>>>>     are running the test will still work with cross CCS / RCS resets
>>> Can this description be added to the test?
>>>
>>>> As the author of this test, I am fine with compute class just being
>>>> skipped if HANF flag set. It is not testing individual engine
>>>> instance resets (we had tests for that but might be temporally
>>>> removed) rather falls into the class of tests which trying to do a
>>>> bunch of things in parallel to stress the KMD.
>>> Note that some platforms don't have RCS or media engines. Which means
>>> only running on BCS engines. Is that sufficient coverage?
>> If you look at this patch, we skip compute only if rcs is present, otherwise not.
>> So far I don’t see failure when 2 compute instances happen to enter this race.
>>
> I can modify test to skip in case 2 ccs and no rcs with HANG tests. Even though issue not seen anywhere else if change needs to be generic.
My point is not to make random and unexplained changes to the test but 
to understand why the test is failing the way it is. So far, the 
explanation does not make sense.

See above about pre-emptible workloads should not be killed. LNL/BMG do 
not have the RCS/CCS workaround of DG2 that prevents pre-emptions and 
context switches while the other side is busy. So I am not seeing a 
reason why the test is failing. That needs to be explained before simply 
making it skip on those platforms.

John.

>   
>> Thanks,
>> Tejas
>>
>>> And if this is not meant to be a reset test, why does it test resets
>>> at all? If the concern is that we don't have a stress test involving
>>> resets and this is the only coverage then it seems like we should not be
>> crippling it.
>>> John.
>>>
>>>
>>>> Matt
>>>>
>>>>> As noted, PVC has multiple compute engines but no RCS engine. If
>>>>> any compute engine is reset then all are reset. So if the test is
>>>>> running correctly and passing on PVC then it cannot be failing on
>>>>> LNL/BMG purely due to shared domain resets.
>>>>>
>>>>> Is the reset not happening on PVC? Is the test not actually running
>>>>> multiple contexts in parallel on PVC? Or are the spinners
>>>>> pre-emptible and are therefore supposed to survive the reset of a
>>>>> shared domain engine by being swapped out first? In which case
>>>>> LNL/BMG are broken because the killed contexts are not supposed to
>>>>> be
>>> killed even though the engine is reset?
>>>>> John.
>>>>>
>>>>>> Thanks,
>>>>>> Tejas
>>>>>>> John.
>>>>>>>
>>>>>>>
>>>>>>>> Thanks,
>>>>>>>> Tejas
>>>>>>>>> Lucas De Marchi
>>>>>>>>>
>>>>>>>>>>> +
>>>>>>>>>>> +	if (flags & HANG)
>>>>>>>>>>> +		return true;
>>>>>>>>>>> +
>>>>>>>>>>> +	return false;
>>>>>>>>>>> +}
>>>>>>>>>>> +
>>>>>>>>>>>      /**
>>>>>>>>>>>       * SUBTEST: threads-%s
>>>>>>>>>>>       * Description: Run threads %arg[1] test with multi
>>>>>>>>>>> threads @@
>>>>>>>>>>> -955,9 +966,13 @@ static void threads(int fd, int flags)
>>>>>>>>>>>      	bool go = false;
>>>>>>>>>>>      	int n_threads = 0;
>>>>>>>>>>>      	int gt;
>>>>>>>>>>> +	bool has_rcs = false;
>>>>>>>>>>>
>>>>>>>>>>> -	xe_for_each_engine(fd, hwe)
>>>>>>>>>>> +	xe_for_each_engine(fd, hwe) {
>>>>>>>>>>> +		if (hwe->engine_class ==
>>> DRM_XE_ENGINE_CLASS_RENDER)
>>>>>>>>>>> +			has_rcs = true;
>>>>>>>>>>>      		++n_engines;
>>>>>>>>>>> +	}
>>>>>>>>>>>
>>>>>>>>>>>      	if (flags & BALANCER) {
>>>>>>>>>>>      		xe_for_each_gt(fd, gt)
>>>>>>>>>>> @@ -990,6 +1005,15 @@ static void threads(int fd, int flags)
>>>>>>>>>>>      	}
>>>>>>>>>>>
>>>>>>>>>>>      	xe_for_each_engine(fd, hwe) {
>>>>>>>>>>> +		/* RCS/CCS sharing reset domain hence dependent
>>> engines.
>>>>>>>>>>> +		 * When CCS is doing reset, all the contexts of RCS are
>>>>>>>>>>> +		 * victimized, so skip the compute engine avoiding
>>>>>>>>>>> +		 * parallel execution with RCS
>>>>>>>>>>> +		 */
>>>>>>>>>>> +		if (has_rcs && hwe->engine_class ==
>>>>>>>>> DRM_XE_ENGINE_CLASS_COMPUTE &&
>>>>>>>>>>> +		    is_engine_contexts_victimized(fd, flags))
>>>>>>>>>>> +			continue;
>>>>>>>>>>> +
>>>>>>>>>>>      		threads_data[i].mutex = &mutex;
>>>>>>>>>>>      		threads_data[i].cond = &cond;
>>>>>>>>>>>      #define ADDRESS_SHIFT	39
>>>>>>>>>>> --
>>>>>>>>>>> 2.25.1
>>>>>>>>>>>
>>>>>>>>>> --
>>>>>>>>>> Matt Roper
>>>>>>>>>> Graphics Software Engineer
>>>>>>>>>> Linux GPU Platform Enablement
>>>>>>>>>> Intel Corporation

