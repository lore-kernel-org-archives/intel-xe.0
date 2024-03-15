Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E80C54E58
	for <intel-xe@archiver.kernel.org>; Fri, 15 Mar 2024 18:37:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0044D10F5EC;
	Fri, 15 Mar 2024 18:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBN2zspA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BC8110F5EC
 for <intel-xe@lists.freedesktop.org>; Fri, 15 Mar 2024 18:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710527866; x=1742063866;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=1IZR6qSacOb9WvCWOqafaF2+yfcc3qT98C4FK49oNz0=;
 b=FBN2zspACyC34EczMl7YvApOsLmBsKVb0Ul030UiFpKo1ji7qL5Qya4P
 7AajkjVIucGgI8wE8Z82KvNt+rrhkmdcSmYyYWfuIMwYHy1pSQ8Bk6OD/
 cjAlFeFov604B0joZqdMFW4kSUs+Rb4Iqui8SbYCK33o2fg/UbN1TOhie
 3IF4njfmTD2XBFaIADR9FtW687//QkgvfyDBSnBr8xPAawnQLdUaw+CZk
 FGvvHoq5P5ZMBiIbm0KaefgO5l/Z5E0Fx9PAAjv39vdKn7TSgml/xw30t
 jkXd0BuSF2AHxFW8prK3IV5qDEOwKrugyhOBXe2PBd8dlX9twZFLLfOl5 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="22932528"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="22932528"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2024 11:37:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; d="scan'208";a="43807131"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Mar 2024 11:37:45 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 15 Mar 2024 11:37:45 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 15 Mar 2024 11:37:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 15 Mar 2024 11:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+lr2KXB2cEAgXWde1eN/3grA5p3iovVQPo+y6XrResiGc61G+9awzmNjgVqFaoRJsF5Mq6XQR+yjdVCys6ukpvdLJ4t/KnWDKfXTQjMQ8yYdqAjXdph2u60sR67aHIiz+TZocIhrkTKR7jaN+XYxorGS41Osf7jkcmGN629JUc4CUfQH6KyeR+gozP9DJJlnU8e6goCL5Fl4E02vMaTHBPLQIQAhbQZ9+4JgXQvi206Nz2Sd8K9sYqonbR8dNk1w3A1HgjFipbPFE3wP+yMtP7q7QP7GtwnsAzMkDkUUwOb/yTwffibnlDiJAKA7UoD9Ms1rbzdSccOxLec2lJJgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HSL/+UXUOJ+YjEQvM+c+Fy1eTTuwqbMRv/mtYW2LJFc=;
 b=Z/OuvjVgSfOzUF93xtCYY+W96hlgeC1t6T7DAlwHbneXG7CSfG3al3HtNI+LX2W1S8al2aCMpnd9YoWi96xe699QnVIFhQdOWVy3dVqZ4427AGGuFtpZqnhKDeugtxvpIvEPFcbEKKEtJUSyWSKCM6v0ybQzb2k9o0TchUXDi6I6mGWHKJNLrToHENa7O6izLwnFls5t9Ra+npCyYmBplwTEBq0QaLmF/SP5D/gKFX2eE+pkgboYyb0/GXb1V2PHmQXTa/d41JIwoA6J9u4YQEzlljWb7Z86xNm+7LIGukmjA7G9VhGHZ68yCaeweLj/HEhiaz4ToX7L/USRGRbhrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CO1PR11MB4803.namprd11.prod.outlook.com (2603:10b6:303:95::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.16; Fri, 15 Mar
 2024 18:37:37 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::71ea:e0ea:808d:793b%4]) with mapi id 15.20.7386.017; Fri, 15 Mar 2024
 18:37:37 +0000
Message-ID: <d817e344-71f2-4d7b-9607-7c63483b0228@intel.com>
Date: Fri, 15 Mar 2024 11:37:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Don't support older GuC 70.x releases
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
References: <20240304162616.824884-1-daniele.ceraolospurio@intel.com>
 <dw54uqzedkjsbhoiadem4lzjhuwpud7m7njenel7tfbc5fuxwm@latczhpxzijn>
 <ff14df57-690b-46bc-986e-90b428cd694c@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ff14df57-690b-46bc-986e-90b428cd694c@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY3PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::30) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CO1PR11MB4803:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d9007e-4dc8-4059-30b7-08dc451efcd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l8IhpIGEZDavmkxxqgfj7rWID6fW2/EzYBapx0qR1l/twIbeObjjTNmMwfyRqNZjQzi7CLSnfbuOjfprzwyrlbZwGx2nnMhJjryAAmn70Px4NmL1Pt/l50jPEEKyUSEXH62hCbrKZdXjIJxwH96kkQbfr6Z/vrhPR/VShukC1yD6kk8GXuEUkmuVeGFRtFWEi3MA4NwiDsd/l6G88OjV2uapFDEQQwDD9uYWJvQ5ctU+PmWa5hkRgQwAsSiY/+DE7xNCUwopxUdv6sJ1b7JZiolxFjDopAb8O6sdc9O/D6rnDvF7QaxOHMO7Bz03/Qk2TvPugfMXqhaF52RUYnfFSDiiQ9gGU1Ec5bW9rsJbzIGLdgnq9X6mvOVmp+E4sZ9IbqrCCizEU4jUFMyxvtRCvO13lQDjUsK3qCMH66frLcs9dyFUJGwQ2AItxBDzrKhvXM9z6lIchMiH7HVmrznRzAdMwCsQLSF0k/xeH4X3zFBlJwYhQ+MKZuJ48kIENWpiNjnDoax17FDRFC/+qvDUjDnJeEDLFRaPu4mWHQtwWHo2gtmAlgk6iTy+EHyZT+8/4+ah2SOygQPnUg6T4aYvA3ongqH0Hd99jUvRlUSeRqx2wGBd2dc+IyxCD2//1alvTLs4pcbOEuTaIPfAkLRnm8rJJh4eKkkbevDny1qe07g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L3JxbFdkUFBFUElzUFZuM29lMHJKMFBNcnB2bmY1eGxxeDdMcDI4ZzlWdStG?=
 =?utf-8?B?Z00xaEtBL0dqWVprQ2JUd2xBa2pkNWFwV3dVQWFHcDNpVlByRGplK3ZSVUh0?=
 =?utf-8?B?VGw5eHlUYkhqVWg5TUdEZmE1a2pINWFwdFVqQ3RWcW5SSlRVVjk2N1RHVTE3?=
 =?utf-8?B?NWxHaXdEVUFUZHpKQ1A3eUxEWWVqKysxMERxRjlNZ3hlSDVWWlhYaS8vMktM?=
 =?utf-8?B?Z2FjczZvdi9RcDhlUms0WW1vZnRYbFUvWjZsMHh2VUVNNDBxcEx4OExMd0Vi?=
 =?utf-8?B?SXNtbjR1RGF1SGtjR2dUWmU5VmNhcE9Kb3NVbGFlU1luVWdVUjducWs5eWFY?=
 =?utf-8?B?WVRzVmtMTUswVm42OFFyOEZBZG52SmtoNS9BazlkV2NabTE0V3dIRzhXWC94?=
 =?utf-8?B?V3NyMzFKWGxDbS9uQkFCeVNDU29oWlAvbUlLbFI2cWprK0FRUFNVaEpJbU1x?=
 =?utf-8?B?ekRobDI0bGJiQmJGNzhmelZ0cnJBb0gyeTd3ME5IMVY3cXU4QUFVUXFSWTVU?=
 =?utf-8?B?UWRqN1lONkw5MERKOUNHbmpvSzNsdHJxVWwxZjFvTXVOYzExTDEwYUVrc21a?=
 =?utf-8?B?QkliU2cxZTZ1UXBDa1MvR3Y5bnJmaXZKS2lSUis3WlVkaG9PSDk2YndkQnhY?=
 =?utf-8?B?S0Z6UzJVNjA1eWZ2a2tBRGlFeDk3ZUpyVDZndlFWRlJiSk1VM0V1K0JRZEo1?=
 =?utf-8?B?TndRR21Bc0UzRWlLZ3k0TFNOTXBXTXNlcTJ5cmpza3A3K0x3VDRteklXcndI?=
 =?utf-8?B?dHlPa29aRzVtZEttaWlHWmVoa0l6OS9ybVl3NW05bUdvb2ZPQ092Z0VWeHlH?=
 =?utf-8?B?Y1c3V1JhbEJDZFRsc2ZwUUlCWE1nb1lsRCtuaGJaM2FrZHhoSmVyam9MRXkw?=
 =?utf-8?B?YWhCZVpJZ0pFNkJPZFo2WmtOR1JNci9tamhyeHd2cE1ZaWY2TWFLV0V6dVMy?=
 =?utf-8?B?REY0ZnBCYzM3Ym1YdU5Mb0labWNiSFJPK1BBaDVBMnhHYXovRWUxUHlXWE4w?=
 =?utf-8?B?WHZ0K2pKb296NXZrc012ZUE1eEJ5cVhiSjZ2MkVXNUNTQ3Npa1A2OUhDaVZp?=
 =?utf-8?B?WHdZTHBXcmduSytpek16SnZkRXdtckM1WHhCczAvOEIxdU1mMGF0dzhwZ0gr?=
 =?utf-8?B?bUFDYTQ4UFdqcHlJaTlDZEpBK09uWGQvQUE5eElOODh6Y0t1NlVNQk8vQk5V?=
 =?utf-8?B?b3dHcEhGMmxVWkJDaUZ2S0RUV0lON3M2RjdpcFRDN2I4bFBiZlVpTitpWnIy?=
 =?utf-8?B?dnluT0RMMlQyKytMRzhJMHRUbE9VQ1oxNytDYlM0TW5wSzR4bTZRVklkek5N?=
 =?utf-8?B?NWF1dmZpOUtHekdQaWFKaDZrQnE1Ni95cU9YWSt6Q2VSSHVDRzNJR2xsK0VI?=
 =?utf-8?B?WHVuSThoa0lkb3JoUndSMHFuNjNNTXpILy83REJvSXY0U2FNS1dVbVpIYmNl?=
 =?utf-8?B?V3hiWEZqRnZ0cGJHeXVtN2laNjZtUFdnVHJOcVlWVjU0OGs2eXYwU1JCVU5r?=
 =?utf-8?B?RTU0RDRxT0dnTUJqb0lKeXpubFdYNEcvMys0QitHSGdSVi9vYmZyenVRdHg3?=
 =?utf-8?B?RWdCazRnS2lZbGxFVUE2c0N2aGs5bjZrOXZwTVprQUE2b0ozWHgwUDljdTBj?=
 =?utf-8?B?dDdkRFlnbTBFWUN3ZmRTVjJ3bFdkcXR1RTYrTHRndnF0VEJhdDRMWEJ3UXJk?=
 =?utf-8?B?Mk8wcHNkZGxtb1VxN0UxendxK3RvcVB0VEtxMWVYZ05MTVY3NitiZnd4emto?=
 =?utf-8?B?RjBxbno0MktMeUNCOFFzRlBlUXdsRm9VL0czQWs2RU40cE5BNTZPMTJJR0N1?=
 =?utf-8?B?enVZQ1hwTUJjNXZkMjMvUHNZS1MxSUszYzhWZUNxb0hFWXRKeUc4dDJZcGRr?=
 =?utf-8?B?SCs3NTI5UnB4RmVpcDdzVGMyQWJsSFZwZ241RkFMbUZla2pudmg5dElqRjla?=
 =?utf-8?B?YUdLclA2OXVCRTJKSW5UUkczKzQ2cDdnV25lK3V4N1ZxcGMvYlpHNjVFZUpP?=
 =?utf-8?B?VHNYZUFzMURoYzdPM2N4Smd2STNLc2lDNndwOUN0ODNSWFRXQkRmWVhIa1BQ?=
 =?utf-8?B?LzFKa2Fvd1RvNnk3MDQrQ08vQmtPODdrTnJ4cEg3b2VsandhTzBGVWltMllJ?=
 =?utf-8?B?SEVtd05FanhWaEgvdHFsUHh0d1RXWWV2NEQrWlNpWG9IU2VMVUZBaXZiU2NK?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d9007e-4dc8-4059-30b7-08dc451efcd3
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2024 18:37:37.4799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BT5LgUqCh11rihBdmvjpNghgU2cFk1w71pPLVSskmvKGlXdDJc+z16HGbvIy80A65eqMdmDuo5kvshs4p0msebjrUiO8dtWTQXMornKybw4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4803
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

On 3/6/2024 03:06, Daniele Ceraolo Spurio wrote:
> On 3/4/2024 8:38 AM, Lucas De Marchi wrote:
>> On Mon, Mar 04, 2024 at 08:26:16AM -0800, Daniele Ceraolo Spurio wrote:
>>> Supporting older GuC versions comes with baggage, both on the coding
>>> side (due to interfaces only being available from a certain version
>>> onwards) and on the testing side (due to having to make sure the driver
>>> works as expected with older GuCs).
>>> Since all of our Xe platform are still under force probe, we haven't
>>> committed to support any specific GuC version and we therefore don't
>>> need to support the older once, which means that we can force a bottom
>>> limit to what GuC we accept. This allows us to remove any conditional
>>> statements based on older GuC versions and also to approach newer
>>> additions knowing that we'll never attempt to load something older
>>> than our minimum requirement.
>>>
>>> As an initial value, the minimum expected version is set to 70.19,
>>> which is the version currently in the firmware table, but the
>>> expectation is that this will be bumbed every time we update the
>>> table, until we remove the force probe.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Matt Roper <matthew.d.roper@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/xe_guc.c   | 14 ++------------
>>> drivers/gpu/drm/xe/xe_uc_fw.c | 36 ++++++++++++++---------------------
>>> 2 files changed, 16 insertions(+), 34 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index 0d2a2dd13f11..ba2ca6895917 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -133,15 +133,10 @@ static u32 guc_ctl_ads_flags(struct xe_guc *guc)
>>>     return flags;
>>> }
>>>
>>> -#define GUC_VER(maj, min, pat)    (((maj) << 16) | ((min) << 8) | 
>>> (pat))
>>> -
>>> static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>> {
>>>     struct xe_device *xe = guc_to_xe(guc);
>>>     struct xe_gt *gt = guc_to_gt(guc);
>>> -    struct xe_uc_fw *uc_fw = &guc->fw;
>>> -    struct xe_uc_fw_version *version = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>> -
>>>     u32 flags = 0;
>>>
>>>     if (XE_WA(gt, 22012773006))
>>> @@ -171,13 +166,8 @@ static u32 guc_ctl_wa_flags(struct xe_guc *guc)
>>>     if (XE_WA(gt, 1509372804))
>>>         flags |= GUC_WA_RENDER_RST_RC6_EXIT;
>>>
>>> -    if (XE_WA(gt, 14018913170)) {
>>> -        if (GUC_VER(version->major, version->minor, version->patch) 
>>> >= GUC_VER(70, 7, 0))
>>> -            flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>> -        else
>>> -            drm_dbg(&xe->drm, "Skip WA 14018913170: GUC version 
>>> expected >= 70.7.0, found %u.%u.%u\n",
>>> -                version->major, version->minor, version->patch);
>>> -    }
>>> +    if (XE_WA(gt, 14018913170))
>>> +        flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
>>>
>>>     return flags;
>>> }
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 7751d6ba6ce0..fa06b57d2af5 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -297,36 +297,28 @@ static void uc_fw_fini(struct drm_device *drm, 
>>> void *arg)
>>>     xe_uc_fw_change_status(uc_fw, XE_UC_FIRMWARE_SELECTED);
>>> }
>>>
>>> -static void guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>> uc_css_header *css)
>>> +static int guc_read_css_info(struct xe_uc_fw *uc_fw, struct 
>>> uc_css_header *css)
>>> {
>>>     struct xe_gt *gt = uc_fw_to_gt(uc_fw);
>>>     struct xe_uc_fw_version *release = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_RELEASE];
>>>     struct xe_uc_fw_version *compatibility = 
>>> &uc_fw->versions.found[XE_UC_FW_VER_COMPATIBILITY];
>>>
>>>     xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>> -    xe_gt_assert(gt, release->major >= 70);
>>> -
>>> -    if (release->major > 70 || release->minor >= 6) {
>>> -        /* v70.6.0 adds CSS header support */
>>> -        compatibility->major = FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>> -                         css->submission_version);
>>> -        compatibility->minor = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
>>> -                         css->submission_version);
>>> -        compatibility->patch = FIELD_GET(CSS_SW_VERSION_UC_PATCH,
>>> -                         css->submission_version);
>>> -    } else if (release->minor >= 3) {
>>> -        /* v70.3.0 introduced v1.1.0 */
>>> -        compatibility->major = 1;
>>> -        compatibility->minor = 1;
>>> -        compatibility->patch = 0;
>>> -    } else {
>>> -        /* v70.0.0 introduced v1.0.0 */
>>> -        compatibility->major = 1;
>>> -        compatibility->minor = 0;
>>> -        compatibility->patch = 0;
>>> +
>>> +    /* We don't support GuC releases older than 70.19 */
>>> +    if (release->major < 70 || (release->major == 70 && 
>>> release->minor < 19)) {
>>
>> there's slight chance of this getting out of sync with the firmware 
>> versions we
>> define. What about adding a define with minimum version just above
>> XE_GUC_FIRMWARE_DEFS ?
>
> I thought about that, but I was worried that'd make it easier to 
> accidentally update it after the force_probe has been removed, while 
> updating it here would have to be more deliberate. I guess I could put 
> a big warning comment above the define for safety.
>
> John, as the one who most often does the GuC updates, any preference 
> here?
I'm not seeing a need to tie the two together. Indeed. it is absolutely 
forbidden to tie the two together post force-probe. So what exactly has 
a 'chance of getting out of sync'?

For sure, you could have a define of the minimum supported version 
rather than having it hard coded with magic numbers. But I would keep 
that define local to this file. Nothing else but this one test should 
ever need to know. Or rather, anywhere else that does need to know needs 
to be coded accordingly. I.e. if the check is above the minimum version 
then it needs to be present but if the check is below the minimum 
version then it should not be coded at all but just assumed.

John.

>
>>
>> Anyway,
>>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>
>> for this patch or to carry over to a v2.
>>
>
> Thanks!
> Daniele
>
>> thanks
>> Lucas De Marchi
>

