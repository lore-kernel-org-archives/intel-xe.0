Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B860CD6E6B
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 22:57:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 450BE11245D;
	Wed,  3 Jun 2026 22:57:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lELpvuJK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 896DA11245D
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Jun 2026 22:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780527466; x=1812063466;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=kM7Ey1gg1L+Ffo5EUhZ3JDws7ID1rRZLE+ieW4jDI0I=;
 b=lELpvuJK23n6ni6b19DspngU0cL1YJESFxq2KApN5r4I/CPusvi8bh0Q
 Hd5iZVUC4h6il6+6CoUY1V6OcPW1IaIBu7k7KWKWKoZDfMxg/oXdfReLS
 Tv98JS+0Ka5pyYxeSdfaudKY9w/YhpIJkM156LdADr8GBx8GFVayRUqhC
 lezCCCTnZSbjFP33DAzpltjEx4fSzXCiMVh5VY6TRQ8ylWgecp+uL9cB9
 +EZWKvYtR4e05DcYkM9OYZ1ckhqWV2wtNhjERUXuZZ495v+4hd0JcL4sl
 r1A8wriQ63ok0rr41KOZ65RPCCslXGq6ElY1k+91kcIeOFVWGPrOHe9Ed Q==;
X-CSE-ConnectionGUID: yftLqgKSQmuvBXVXKchfDw==
X-CSE-MsgGUID: mo3nffq4RCeYgIfKjdWY0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11806"; a="68888643"
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="68888643"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 15:57:45 -0700
X-CSE-ConnectionGUID: J2vem15xTkWwhsb7LOUtFw==
X-CSE-MsgGUID: AaHWu1zkQsqZa0JuOJHSYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,186,1774335600"; d="scan'208";a="249295478"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2026 15:57:45 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 15:57:44 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 3 Jun 2026 15:57:44 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.24) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 3 Jun 2026 15:57:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B1bWlvF+aKdZ37N1fYLKkumfwTYf4ZBI4XGqcoHWDBMFPhLCuEKuyM9BjdbXgTwp6zJZMckAkCUhmKBaeOP+EfNGtRBP5F/FjRJ/Ns6MfWDOApPIuNNTFXagSGbavuTSf1oz3+F843eIgcfJqd5HkywWoIb6uB6wobwJFKgtl3pjISx9stJOJhoPAjWxT4iMgF8o6dE6IIcC6NCRiXJMDjl0ZIlnEmDWSfH3XFoyZIujtm2iiZ5CiltFVrEvQf/V7Vv/sirHIGDkLiDn+sP6OYoslksTS3BxJv7cKrugHLnZRq6btmaBrK0l1I/q7QVm9Fh3NfiP6xeLxiu0Tu+pTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z9c5/XP+ycbfXLvRYz2P5qb5AJaZTJ78TQB9EoPa7sw=;
 b=vezLdJRzOMdChdBztzTLses6QfP8fb5pByEFSRGntQrFWaBRDegG/a6gijsVl+CmFtLEts9HMPpXzZGYEjcIscOAuxECXlaiiqZ/e8r50Qgq9lsVtVbF9dJORKhlJVkuWUSdg2AZx/PwYnO8XJN0pL/pkJ4VY6/9zxU+uyGaubfCp+rYnxMBMmbEfYhJ36nCaDXC79Mg7gt7pEtK7/0riNz9TCu/76v5WGtgrUxbXJfOoM9W2mWVIgkNatjkx516r5zuiuyQDw3QHZdOUVOBy1vdwDNGtDxc1s1yTGOk6zUz4X+vGnbazS39B2N4jMGE7aznXCT13R1rqZ6O7Yb9Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA2PR11MB4793.namprd11.prod.outlook.com (2603:10b6:806:fa::8)
 by SN7PR11MB6750.namprd11.prod.outlook.com (2603:10b6:806:266::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Wed, 3 Jun 2026
 22:57:41 +0000
Received: from SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256]) by SA2PR11MB4793.namprd11.prod.outlook.com
 ([fe80::6037:898c:f5e:e256%6]) with mapi id 15.21.0092.006; Wed, 3 Jun 2026
 22:57:41 +0000
Message-ID: <ead78afa-5f93-4abc-864e-82acd47b01d3@intel.com>
Date: Wed, 3 Jun 2026 15:57:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/multi_queue: skip submit when primary queue is
 suspended
To: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260601234642.817231-2-niranjana.vishwanathapura@intel.com>
 <61f82f17-1f19-4604-883d-9e6fb39489db@intel.com>
 <aiCfZd85gn23AH5A@nvishwa1-desk>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <aiCfZd85gn23AH5A@nvishwa1-desk>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY1P220CA0008.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::16) To SA2PR11MB4793.namprd11.prod.outlook.com
 (2603:10b6:806:fa::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PR11MB4793:EE_|SN7PR11MB6750:EE_
X-MS-Office365-Filtering-Correlation-Id: a751091d-bd19-4936-d2e0-08dec1c3844f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|18002099003|11063799006|4143699003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: mZf2AOHL7Xwyx/4kjhxa5IFL+A2UWbxU+iX3Wy9ZsyF7+9CnFJLZcIDexLLv77US4qQx4HGmX+V13SIcOeaQ07eFIzZeYk6G78UZ1E4cgwXQplFUhnFLQN3N1AwuqjCi5IOtsZhi1+06hin7lTDUbzzyoAZ1DwU4tggiUkwDBwAa6CiD/GJ840T9TQek/N9t1lXpVuepTcMwaxsSl/+uxFlqS2KnZ36ABN6n2OtW8eyaI22qU3A7cdCp+65xfViNhE9xnbrqUDLRtq9giYXva8BB5FrKH334S3PlKaJ08aaYmKYSPnhwmUTnU81r3xI/PPANvCqXzwIG/jlIsV/3I5g41m96TwI4QHwEsxDi98JA6GqbsYfaFEy8ygxZuAAblfzo8aWq644l5sAdGcUT63L+jv2frDgZVcGenXau2GnXGK6pKCV8L6xXM45szVEKSXZELasCVOzpYYwnEYM870BAdTuKr6/DWX07ebjasHuWWpkNmS0xaek1L61XdSUCnwPOHKzpq14gUgTsq2Mb3GITlGt0QGZZwQ3F6tY3xZBAm8GG+OiXEZdAJpBdccusf2vBKWbNE2/JYG4ZJv+O0egsYCw5EwRssoOG3qA9/7mBdP3gLuAjP+KzEgN8R1yoBXWG6n1X7CJ8m05/80F53A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA2PR11MB4793.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(18002099003)(11063799006)(4143699003)(22082099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVI4MVpxNndTd2FHVk4vQ1RpWThIcmlEdG9xenFQU2ZMamNTT1lMTnIvcnBQ?=
 =?utf-8?B?Z1ZYMVNMbWZ5OXNqRXMwcmdFTVFmMlQvRGxsZk5rdHJ3RWdlWHlvM09JQjR3?=
 =?utf-8?B?OGhIZDNFK2dBbVpUYjZLUFc0RW96OUIwaVduNmJoSHpvTXBDOFN5OFlhd3V6?=
 =?utf-8?B?by9uZkgvYXNRYTRCZzQxMmpIZWlaRkF2cmxpT3dpeWZzVkZLa1Z6Vk4zaThl?=
 =?utf-8?B?TUNWQlJ3T0xDemhPSVlhTmNJY2dWVy8wM0hZS21pYTZaalA5YTZ1VGpjWnYv?=
 =?utf-8?B?OWs5dE13WW9wRnZCV2dYa0FZWVlaNVFaTWx2YVoreFdreGVwNENTeTNobGda?=
 =?utf-8?B?U2VXWXFXTjVhYXdnTFBQbmNudjc5c082cmwybE8wMHNHQTF0YTJSaUJYOG1r?=
 =?utf-8?B?Z3pMeHVrakp5QThQd24wWGtwdVFxY0YycEZpa0E3N1MzcFlXL1MyQlZZODkr?=
 =?utf-8?B?ZWUvZStLUG8zZ1FwSHZ0cmdRN1AzT1B2M1duYkFMYlFQbUwya29iOUZjcFBO?=
 =?utf-8?B?eHV5LzNVSGtmUms3TGU5L0lpMzVrdUNoUlFBeWUzSHJsYlN2RmVGOENHd003?=
 =?utf-8?B?dUprQmkyb2JKcG9ybld4V2IxMFZxVHBlUEY1Z0xlbzBMdGpMWFEzeDhsYlpX?=
 =?utf-8?B?eXFtalVCMWZNT2RDdzRCSHRhc2dHamQxT0taRTdPejZiaTRIc2VWdVFwWUZ2?=
 =?utf-8?B?UW9qT292NzFVcUZWOUhtbjRoNnpDUldOUnlWY2hEY0dCWmlkZlUxNEp0aTFp?=
 =?utf-8?B?RkQzWWs3d0Nvdk1SdENkRW9yMk5sbzV6cjBTQ0VOUWx1STFYYURxK0UyNzI5?=
 =?utf-8?B?NStRU0ZFTWo2ZDZnSG02UlVUdkNnQ00wZzlJOXpTOFRuN0pHbkdUVkdEZGN0?=
 =?utf-8?B?T285dHRDc01Ja2YvZ1Fic0U3N21mTmRPKzdUYUdtU29NS2ROTkFQRE4vdmFR?=
 =?utf-8?B?YnNwRGdlK3djL0RydkVyVGdBYWIrUEtuT0c2WlZKZXhDbzdFbDFPbEk0RzJi?=
 =?utf-8?B?K3lpVXhEWHpkTkhZdFlBUWZMMHR4T2xhNkNtdlJHWkRxQmJCVGRKME1lRkY2?=
 =?utf-8?B?Yzl2OEJWQWhEdlVmajRKeS9DRGFVbHN1OU9LWUJMekp2ajRYMVVBL1ZqRzJj?=
 =?utf-8?B?OXpCTmZNMGNSeVZlaFdmZDFtY2FlMFZrWW92U09UZWJEaEsrOFI0OFZEV1pl?=
 =?utf-8?B?YlZ6M1I5S0VWb1dIdWJLUmJmSkRIZksxZ08vd3R2NnUxY1BralFRNWpjMURi?=
 =?utf-8?B?biszTmY4Z3YxMkNydzZwTjhMc3BqbEJ6ZjZuMDg0UTFqdkhoc2FvVEpBOEVF?=
 =?utf-8?B?c1pTRU5wNUR4eEhFQ2dTVm1xblZsTnRMUVpoZ0JaWC9SMVYrb0p0cGNNQWtP?=
 =?utf-8?B?UmR0UVM3WmxKQ0U0YnRFVFhkdFJuS2hSY0dMUW1wSjVUNFhaN1FPQzRKNVd4?=
 =?utf-8?B?YUY4YWRLbFdMUVhYKzJjWFJ4OUxTZU54OXJsaEYyOUlreElWODlyQlIvR2lL?=
 =?utf-8?B?bUVIRURrQzBJRWdoTzFrQm94eU5IQ3cyYkZubE1mSzFFYkxwbHpvTnBPZUpU?=
 =?utf-8?B?WS83QWhqZTRHb0dybUhJN0d0dmEwNUpEamhpMyt3aHFJYlJpT1FYWmdtU1dz?=
 =?utf-8?B?bVE4cXR3eTlLRGR1TGRlVFJLTVVTMkJ3QStsUGZ6UTdTbFdDSEVkSmVMRFhY?=
 =?utf-8?B?MXB2RkpGMnUrTnY2blg0QzFIeC9SVDAvN2RVMGdiVUtnNWRCc1EzRFU0SFhx?=
 =?utf-8?B?VHRiL3pOaWdtUE1GbFlEaUZ3SWd0OU12QmQ0bHhQbkVMeWk5UTN6YzlGL1RC?=
 =?utf-8?B?MUlNMTM4cS84QkJ2OUdSWm51MzBjRDFIcVBwNnI0ZHZ1VHRyRzhBQWNMenJi?=
 =?utf-8?B?aCtpazJXZzJkTnExbEVGK2FZUkNvcXc0Q0UrM25SOW9HWno2OElSYmN5eEw0?=
 =?utf-8?B?NFBWTXMyK3dLeXJxdG5TeTQ5dkY4cXVFVVdoTU90Rmh3OHh6VVRiTXltVTl5?=
 =?utf-8?B?OVF1SjZESUlLeGJpOWovWXpsN3U5MHZ5MFo3L01wOWxKYmJMZGZWMWRTK1Nx?=
 =?utf-8?B?Z0dlSzRaUFpPdXp4YkZ2RDhlV3ZPU2ZRMUNMMTIzeHlYTHVsTFZYZWNKNUph?=
 =?utf-8?B?MFE5YkoxNkx4ekJJdllRUUtsM3pDVzkwd3piL0pOUTI1djVlMUVyeXlhc3da?=
 =?utf-8?B?NmY2S3RLQTh1SHc2TXhHTmExOERTdkE5UHhSTkJTdmtTbFpyYlI5YnhMa1VB?=
 =?utf-8?B?WkZ4dE9ucUVsbFdVWExsZmpzWVJaMHZDSVdwNDlZck8ybThpbHRzUExUcG5q?=
 =?utf-8?B?S3l4dGh5KzlMV3dmSGFTZVJVamF3Q1dDRjNLUUJxMkpTSGU3cTQyN1hVcWVG?=
 =?utf-8?Q?/3wVwE2QhxzBcyts=3D?=
X-Exchange-RoutingPolicyChecked: IHpVEd/E7dJvjx0TJILgjBfuukYXeFCUAt8HWcyxcyizntX+PHZlZd/XJpMQ3ecgkVawmObO2Ebfl5xHSljs4mm32zivrvD3pnRy5rPO6VXz81unz7BUTHuJp48s0W4rDW36Nk9pLk9QbAdQ5X7gw4Cg1ugui9Ia+5NIVszt5JkNvPIBTTcwhAMzilEq/idOoWUCLvBcv86t/nCkIvAUz05WTmifNiTXX5SMw1Lg9TOxcqOUQuAboLrp89q5B9FXew4KOl7ceuThNiOs2IpcBrlG2IvYPNdG3COHV1TSj5W5HLsiJfx/3XO15/BcqwPnQ3KbKno7MAh0JAIZkvGxcQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a751091d-bd19-4936-d2e0-08dec1c3844f
X-MS-Exchange-CrossTenant-AuthSource: SA2PR11MB4793.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2026 22:57:41.7135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sxhlmPkkufGdkayk1LrDIHgVq+EY33XXpWsrDH473hPwUd7eUARXInoCDQGqwPKgpc5I7PdOVYbThsHsLW/hFeWyH059zM2FVDZxdVdqN94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6750
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



On 6/3/2026 2:40 PM, Niranjana Vishwanathapura wrote:
> On Wed, Jun 03, 2026 at 02:00:51PM -0700, Daniele Ceraolo Spurio wrote:
>>
>>
>> On 6/1/2026 4:46 PM, Niranjana Vishwanathapura wrote:
>>> Return early in submit path when the multi-queue primary exec
>>> queue is suspended to avoid submitting while suspended.
>>>
>>> v2: Remove idle_skip_suspend fix as that feature is being
>>> reverted here https://patchwork.freedesktop.org/series/167262/
>>>
>>> Fixes: bc5775c59258 ("drm/xe/multi_queue: Add GuC interface for 
>>> multi queue support")
>>> Cc: stable@vger.kernel.org # v7.0+
>>> Assisted-by: GitHub-Copilot:claude-sonnet-4.6
>>> Signed-off-by: Niranjana Vishwanathapura 
>>> <niranjana.vishwanathapura@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_guc_submit.c | 5 ++++-
>>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c 
>>> b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> index ab501513d806..30595ecc7f92 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>> @@ -1167,9 +1167,12 @@ static void submit_exec_queue(struct 
>>> xe_exec_queue *q, struct xe_sched_job *job)
>>>      /*
>>>       * All queues in a multi-queue group will use the primary queue
>>> -     * of the group to interface with GuC.
>>> +     * of the group to interface with GuC. If primay is suspended,
>>> +     * just return. Jobs will get scheduled once primary is resumed.
>>>       */
>>>      q = xe_exec_queue_multi_queue_primary(q);
>>> +    if (exec_queue_suspended(q))
>>> +        return;
>>
>> I'm not an expert with the suspend/resume flow so this might be a 
>> dumb question, but in __guc_exec_queue_process_msg_resume the jobs 
>> are only re-scheduled if !exec_queue_enabled(q), so is it possible 
>> that this job will just be lost if exec_queue_enabled() is true in 
>> that check? It seems weird for a queue to be suspended and enabled at 
>> the same time, but if that check is there I assume it is a possible 
>> scenario.
>>
>
> That is a good question as to whether or not exec_queue_enabled() and
> exec_queue_suspended() are both be true at the same time.
> But here, all we are doing is to ensure we apply the same check that
> was applied few lines above in this function after we switch to the
> primary queue.
> ie., we have the below check few lines above.
>
>         if (exec_queue_suspended(q) && !xe_exec_queue_is_parallel(q))
>                 return;
>
> We were not apply this check after we switch to primary queue. I am
> trying to ensure that we apply that check for primary also. The
> is_parallel() part is not required as multi-queue and parallel queues
> are mutually exclusive.
>
> Niranjana

I had a quick chat with Niranjana about this and basically the key here 
is that the primary and secondary queues are all suspended/resumed 
together. So this issue can only happen if the primary queue has just 
been suspended & disabled, while the loop hasn't yet reached the 
secondary queue to suspend it. In this case the scheduling enabled 
should be submitted when the primary resumes.
I still think it's weird that suspended and enabled can be true at the 
same time, but that's unrelated to this patch.

Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Daniele

>
>> Daniele
>>
>>>      if (!exec_queue_enabled(q) && !exec_queue_suspended(q)) {
>>>          action[len++] = XE_GUC_ACTION_SCHED_CONTEXT_MODE_SET;
>>

