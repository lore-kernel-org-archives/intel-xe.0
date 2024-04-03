Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5277FCD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 14:25:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A86A112B6B;
	Wed,  3 Apr 2024 14:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rs+bSlAN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57FC5112B6B
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Apr 2024 14:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712154339; x=1743690339;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dJSE+TbFl35nZQ0xgvOgVinEPTS2auj4lu1vpGPxxek=;
 b=Rs+bSlANvkosKaCPzDt6ef5Xnck18YLijR8Uh6zBjWCNcRpzzVPsf6Ep
 IK443DYKAVxQQ0LDozjDhU4o/iyt/IAt5rxJuGHoY7SmhO6ZBYVL5oyAY
 HS9ZSvrrsvejVyKFER7D6kxWTpO6LMAACouoM6oBgtRzM3mEUmS6x9kZD
 QvbCnjCV/pfWE+hoct2JNuIbgijzWWk6q2OJlxBcIz9tKyL15RS4xen21
 omfjzuHwSIW6hsepR094ELNeW6DMv/lcXR3+rqqJKX0DuxID0pLvV4qQE
 lIXWantNb/xg5Q0A/zpn0IWIcA8JhlGsZ7qhtX21/ntYfqKYpEsxi+w60 Q==;
X-CSE-ConnectionGUID: Z9UqelfAQcas/DR0Ox2i0w==
X-CSE-MsgGUID: RE7dSy9FTcCNTKkUMQs2AQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11033"; a="11206825"
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="11206825"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2024 07:25:36 -0700
X-CSE-ConnectionGUID: lm2K96HDQuCQkiX96MLI5g==
X-CSE-MsgGUID: mZ+6Ki13TUCJCsUSHYHvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,177,1708416000"; d="scan'208";a="18374818"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Apr 2024 07:25:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 07:25:34 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Apr 2024 07:25:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 3 Apr 2024 07:25:34 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 3 Apr 2024 07:25:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dO4PIsYuI4ntsp8xtae/Tweumv1EOsjMah4Im4tOhUQ1h0QsPl5d9vqRgk8W3SFnPVDU2FDaosXCObC2VRryM5xDy0uUTM52O61u3l1o2u7hsnpL25VRgJnVSuEIj6mw09oZNLiwEp68E3rCnCRvwZj+3mrwNYVMFu1DrEslSEtdK5KeedESPqURhoyP0OZpw+UgpibqVYGKNQZMGmylShOGd5kiakIVolCgX5prrvIehAuLi8AkqRr75lAM+XqP3+L5IVgR3+pwOlD1/8GesJZqGEAGr+DEQwU/2ENARx6Jxgt6GyfjFfoV2MagaLEzARmKfoAgRY4lOyg3QYa0HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9U89gt/6YvX744+3NLAUObsoORvFwQKJFKZKB8kyDaA=;
 b=HbcfkkIjQlrCSWEM783Mep8iRAWGpv4CyuXzv1o+IvJtJVEeGP1jL3N5AHhtLOL8aJUOSozErarddUfRaR5/mjOXzsl08L5hMkTaVhec866Yq/+xEEp1WSYe8jgrKf0U6B82lvldlJi9Gq3BTYqbksoOsyGgifdIRn6gx979DJSFTc3MJOjkchq6JoyAgit1rNuUUhNhdyZ+hA4fa1y2iBOr28ls7h2BrH+Tc6P2eV7083K24t5VKJAaaa9Iv9pXxIPwSMFHvha6mBXm5rBO5hCfy/9AXR1xypNsR3MXnby9zvkYfFZKB7LgIwlBdu1As/FHS0vX6AFblKPnh8C8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by BL3PR11MB6530.namprd11.prod.outlook.com (2603:10b6:208:38d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 3 Apr
 2024 14:25:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::eb80:5333:fa3e:cb6c%4]) with mapi id 15.20.7452.019; Wed, 3 Apr 2024
 14:25:31 +0000
Message-ID: <1fa9c310-f30c-4a89-985d-a78336e8f63f@intel.com>
Date: Wed, 3 Apr 2024 19:54:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/hwmon: Update xe hwmon with couple of fixes
To: Lucas De Marchi <lucas.demarchi@intel.com>, "Poosa, Karthik"
 <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20240402180956.508398-1-karthik.poosa@intel.com>
 <palg6mncpsbmsi2qt6ycrblfi5bd5v7keoc7boz4snx2o252fj@wpg6hthzgccz>
 <a1895347-354d-43f5-8160-90d59ec7c597@intel.com>
 <3xsn5j3s74yggakrkrxq7ouwj6xm4xeenyb7gqgankhseglxwq@ohs3vm5m6in6>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <3xsn5j3s74yggakrkrxq7ouwj6xm4xeenyb7gqgankhseglxwq@ohs3vm5m6in6>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|BL3PR11MB6530:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Sx64MYSZQKzTTBW2dd9ASRRLONwQarG53WyTwUbg+Z9kkPcb+l15uxdMmkXyrHkpK319vkUUv1x81o+C9I/3X0c/zQ+NWtGtja+kn1S67ujQk2ntHwnI2inE4+5zZ+isETfjTYBQKi+FHPhNIaM0bsKToWiiuBrcauMkb4HPYbfLC7iCea/SJQS1SCpiBQOaXX/sr1ypbm/Sv4HQmFShUMAzrFDybaX1Ziq8+eg3zf0sVD/W6mH6xhEo9sHL1prfGLKXfkxgJBmc6yxHB/4eBwr0ZoQKlxdeVxCF/80EgAmX90RJh97fP2LniofQqKSQFXFhWNP1qBebiCEVAw5DQwDoXe5Ht83e0h7M87FBpUFFSYFWJg8rITJVcnJTBPkiTplHiiSM2xBCPhcUKzBBq3KR+XvyPA6HvHQSxe93n+1GtECvVwhS5icPVOMPK0eSB1+pLYLJBVIWav0m2sDg9If0pi4XaV0SyOCEHOYGwy/mYa9nHIu09kY9aHP06pI+r6Ye1n2woJE6g3TC3Kb+08VVNAFTUeT6lGjDugVpmJP52oe3FtMOF7Fv/LWkvBtcQBPAxDBb0IiN2YEd8WRGw8/9CN7eX5qNOcjydz3zjBukdnx5JZimA301iN4YhV83TWvLPJhQubas6sX4Ug5rLL/8tO6Fg1STdeGiCESjjhU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFd3MiszdFdNRlpCTGROaDZWZE1FbWc1dytNZGpRQStqNFlGaDdNaGsybHd6?=
 =?utf-8?B?M2VOdnJ6U0twOFBiQ2VHQVZxaFFxSU1iTEc0cnB2dm5kaXBEL3R2VHBxOUo0?=
 =?utf-8?B?L3M4eXJGY1AreVlkeWRXUWpCT3poQ3ozSVpET0htSEZxR0xDV2ZuSzY1TDJC?=
 =?utf-8?B?T05ydjMvZFNnaTEwZ1V3RGhZN2VvZTExdU41QlhlRTZDRjlTS0x4dkRuUDI4?=
 =?utf-8?B?TUIrK0gwb1EycTdWWEs3U2I2Vmo4V1o3eUJJbURNNm0rSjVGQkI5YzVQbnRK?=
 =?utf-8?B?b2VWN3pRM1ZtVW9EUmluWDdVeG52dXZNeGZRV21oS20vUHVaakJYU1NGbk5H?=
 =?utf-8?B?Znplek9YV2xXYi80dTA1Rkx5aWRjcnNaQXBmUlhtbkZGZUJmcDNNYkpGQVEx?=
 =?utf-8?B?aE52WnpaYjVJYVJ2a0NUWHJ2aGV2cXh6L2RFUlZYVUpxeUs1akhmK3dlWjZU?=
 =?utf-8?B?Zzc5M09tOWYwUm9ZamtqS2s3eVQ2UVFpQkZXRVJSQUNxd3NzSDhncDFJMUly?=
 =?utf-8?B?Z2tPL1NxQWdEaWxJY0llYWRLeGp2OHRLcG80TTRrRTNib0lpYkZNdTdEUTQz?=
 =?utf-8?B?UG5qMHVrdnI2S0NWSzBJaXhyeENGVnMreGxxS2pRQmRYaGZ3UVlQN2V4akVi?=
 =?utf-8?B?Y0luSmo0Nm9TOTJUenVhbHE2cWkyT2VjYmsrWVR6ZVhSTE10SWhRN2V4dVkr?=
 =?utf-8?B?SWpkelk0bnhlQkpmcnBGcEw2VktZTTZIcE5mMmllTlhkVGI1M2dqZnMwOWtO?=
 =?utf-8?B?RjJxOEE1aWM3NTl4U3NRTVNiajQ5eFN0RUpFTGRaa3FCM2tZaGpVZC8yWXdo?=
 =?utf-8?B?bjc4ekJvLzd5cXFvNTI3N2dUcG9vWUUrOUJUbHdBN2k0Tyt3QitFYS8rR0tW?=
 =?utf-8?B?NFJKR2crL3Q4LytUcDRIZjYwY2Fpb3FZZWYvMnc2NmVoY2V2V0ljT0ZKNUpO?=
 =?utf-8?B?S2NjZFgyVThPUjhzTzFIakRvMUhWTTU0dzhRdFFyWEozaU9lSHk1ckNKMGdZ?=
 =?utf-8?B?T1BPWmpUT2lTNnBKdmQ3eEhSdTBDS3U0RTlreExpVG9WZFRvVGVDTGNFUU9q?=
 =?utf-8?B?MlR3UXdJUS9XUEJWdXNLdWZBTEVkd1FnZzRPSTgwM3ppeUQrT0x2ZnB3VWpM?=
 =?utf-8?B?OThvUmVKUGxvZmVwZitSTTU4M2VzSmN3MUY3cUswNXBtMEFGVXdzakRKVGFI?=
 =?utf-8?B?TVh0c1d2SDZTVHVBT3ZvODNKMDQxc3RidzIvaU4wWE5rNEJRWTQ0c0xQOHhy?=
 =?utf-8?B?UG90TFlQT0JKdU13ajNRN3NzNDA3SW9XVTF0UmJsNjRPbllnZVp1d2J3OW9M?=
 =?utf-8?B?RVJITHpGWktiL0M0clJTeUtEUklOa3VEZ1dYaGkrZy82MUZ0V2ZoSVhsUUJP?=
 =?utf-8?B?aENreEs0OTJ6UVFnb05oVVlFZEw3eDJzTXJtc2t2Z1ZTWTJndGtUWDdqZksv?=
 =?utf-8?B?cmRIVlpGeDQyc1hNbG9tbEt0ZGxicUVKVUV5dEFJalJ6cXhKTFcvYUdGZEZF?=
 =?utf-8?B?S3hVRGxlY1VZNW9TR3BuQlJhOFRQMFhtaTRmWHdZK3hWMlNUR3o0Z0xqNTdp?=
 =?utf-8?B?ckY4QWtvYit1a1k4eld0MjNweVRSUGVFdXpXQUEyMkVGemg3MTUyeEwyWFpF?=
 =?utf-8?B?VWhOM3R1WE5XMFJ3UVFSN0dMM3NQNWVhclM0OGpyeVRybWRMa2hQMkVkbnVG?=
 =?utf-8?B?bU1pVzdzeU9ueWFTNXNvRTl1VU5ZY3hYVU9yaVNHenVVaTJmY3pxV1ZlMVhC?=
 =?utf-8?B?ZlRvVGJqTU1RVUVma2F6bWxBWHV4SzFENWE1bnNJeHJMcXUvMkw2OC9PQVFR?=
 =?utf-8?B?R3p3bmE0VjBRSDB1cTlHQllWcWJsaHRxTDhMQ1dQYmhoU294MHhsT0RCRks3?=
 =?utf-8?B?YkN6eHV1UjRzKzlWR203VDcrcGRxZ0xFTk1peU1GRXpYZ2NUMmlhaUxMTVl3?=
 =?utf-8?B?UzZOWFJNU0ZubElJWEJNMUhaWklDekR5NGFSd1l6Ylg1aTEyLzBZR21oaUtO?=
 =?utf-8?B?ckV3YkhPd0pwN3loWGlTSW5RdG1HZk5hWVRINnJYWkFEaVE0QTAwcVdzOUlt?=
 =?utf-8?B?dncyVk9zV01zRElyVkxNNDFzTHF4TjlzRC9Ea1ZUdDQzeU1NQTRTUkQvUVpy?=
 =?utf-8?Q?zqdLjntIpKC/QtL683lA4yVj8?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9730b647-3ae1-4f7d-2751-08dc53e9ea6f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2024 14:25:31.8729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LpOMXe8Rvl19pKhWMjDcdTRzIRUKBs3jTu9DKo4BlO0nRROYijIH+qTeq0wkJdr7DlEGS/Y7xU/acTUcO7QpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6530
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


Hi Karthik,

On 03-04-2024 18:43, Lucas De Marchi wrote:
> On Wed, Apr 03, 2024 at 06:22:24PM +0530, Poosa, Karthik wrote:
>>
>> On 03-04-2024 00:48, Lucas De Marchi wrote:
>>> On Tue, Apr 02, 2024 at 11:39:56PM +0530, Karthik Poosa wrote:
>>>> Address potential overflows in result of multiplication of two lower
>>>> precision (u32) operands before widening it to higher precision (u64).
>>>>
>>>> Initialize variables which were being used uninitialized.
>>>>
>>>> v2:
>>>> - Rebase.
>>>> - In xe_hwmon_process_reg, set argument 'value' to 0 on failure.
>>>>   With this change caller function need not initialize value to 0.
>>>>
>>>> v3:
>>>> - Update commit msg as per review comments (Rodrigo, Lucas).
>>>> - Update xe_hwmon_get_reg. Return bool from xe_hwmon_get_reg
>>>>   and output xe_reg. This is to have abstracted usage of xe_reg. 
>>>> (Lucas)
>>>>
>>>> Fixes: 4446fcf220ce ("drm/xe/hwmon: Expose power1_max_interval")
>>>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>>>> Reviewed-by: Anshuman Gupta <anshuman.gupta@intel.com>
>>>> ---
>>>> drivers/gpu/drm/xe/xe_hwmon.c | 60 ++++++++++++++++++++---------------
>>>> 1 file changed, 35 insertions(+), 25 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> index 7e8caac838e0..8c805ace592c 100644
>>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>>> @@ -79,46 +79,48 @@ struct xe_hwmon {
>>>>     struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>>> };
>>>>
>>>> -static u32 xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>>>> xe_hwmon_reg hwmon_reg, int channel)
>>>> +static bool xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum 
>>>> xe_hwmon_reg hwmon_reg,
>>>> +                 int channel, struct xe_reg *reg)
>>>
>>> patch 1 could add xe_reg_is_valid(), just like we have for i915. This
>>> will create the missing abstraction
>>>
>> Should this be added in xe_regs.h or xe_hwmon.c ?
> 
> drivers/gpu/drm/xe/regs/xe_reg_defs.h
Function will look like
bool xe_reg_is_valid(struct xe_reg reg)
{	
	if(!reg.raw)
		return false;
	else
	   	return true;
}

> 
>>> patch 2 could change this function, but rather than returning bool,
>>> return struct xe_reg (yes, by value). The caller will then do a
>>> if (!xe_reg_is_valid(reg)) return. This will unbreak the abstraction.
>>>
>> There would be a call to xe_reg_is_valid() after every xe_hwmon_get_reg.
>>
>> Can't this be as part of xe_hwmon_get_reg itself ?
> 
> I don't follow ... xe_hwmon_get_reg() returns the invalid reg, the
> caller checks it. It's similar to what you did by checking the bool
> return, but instead of having the return value + the pointer,
> we are just using the return value with the added abstraction for
> invalid registers.

Where ever needed, especially reg valid check needed in visible 
functions to decide whether to create sysfs entry or not, use.

%s/if(!xe_hwmon_get_reg(reg)/if(xe_reg_is_valid(xe_hwmon_get_reg(reg)))/


Regards,
Badal
> 
> Lucas De Marchi
