Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3459C47DD9
	for <intel-xe@archiver.kernel.org>; Fri, 22 Mar 2024 09:31:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72C5210F13A;
	Fri, 22 Mar 2024 09:31:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ivx5YDS4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F63010F13A
 for <intel-xe@lists.freedesktop.org>; Fri, 22 Mar 2024 09:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711099903; x=1742635903;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nxlqkVKZgJn0Wd6X9NFhaMZ7vxKxoDR2oTy78B/OWxg=;
 b=Ivx5YDS4r2IdLOFfkPhZ06arEjOgXqMni7VQBRH5LxmTTxT5Zp2+Maim
 VbH2REK+H4MQhXZpPyxVuZyEhtEPtr7Uh/9mgGIlWJP60Ju14Sgms21s0
 dB48IVYc2UTrwRAiWwnEcCzmy1SY5dY5V5/LvjfkK4pRjUeCCnYMOP0sj
 UYmnQa0yJMMb6sBSXksii2/cM9a2uLmvp7bZLd4WaTkVw12JeZANzY5fS
 uGqBujptyjoeCFB5jFv8bh0i+8Qn+dA7SBQPaMUcCT+PwFtRltOzZNxET
 ZMWZnxCUyOC2qU1VMRzw6WYQ3Rb6fMXk/2+PJsTj496oJbJUsH+zG0uBh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="6346629"
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208,217";a="6346629"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2024 02:30:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,145,1708416000"; d="scan'208,217";a="19404473"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Mar 2024 02:30:26 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 22 Mar 2024 02:30:25 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 22 Mar 2024 02:30:25 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 22 Mar 2024 02:30:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vk8EFZ4/5KeATatfT+qGGubr2g+tJ3GdHMvBVep9ajJPO5s4xunWSIcaqIUwCGj4E5sYMNPAfRLBhy8iimpvm7vbt0tQt50YVlyEfy8+vwk+jmaSm5Bl3QYzecGX4Tkyld5+KATjRNbk1D+NJ7iMUMD4jlNYKhcqRAd8331sxC0Cs1JJnWfeigYOO6aXlXrT5U93vL9PiTMp5C9dHz18i9sy81hdPWKJFQ6PCqWDw8+NJnlkEL8uvjOqtvORjOP+/ktCx385h4oOM2bl7toCT0V/bGWZC7Id8JfTgu8sANy4ITaGByrq4oIC8sCKGavkQEqzB46OwGu6TJCn5Y+c0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wf2LpYvHa/ROwleZtXlEoJd4D8We/taQTbDUYIc4Qhg=;
 b=HBmVcGxZ6Ybz5rLPGM+NFDq2nIyArvWEkibnDsJGGaBRRmVWUZ/IOh9ECNVlZy1fErBgNnVyKEDU6B9ZFbW8naPJrWa37NXJZsSKs620Pjn26wWd/m6q3X+t73pjEgv88YAe8akvO2LUGcjBvJIUSFdd1FuhLagyGSoVw/Mn6CTsXIeaMgtzST4hjWCRdr0R5n9VRkfF3aQUutQEMrwkqGnLlItPIff3qInHirt15hobfr/wHCwo1yFJeR78JVpGzQhUh9vMsN7UfoZ2o7b9V4a9NhlxhN3Kp3OycRZn4I65ZoQsZnO2K34ifXIkX3VFM8NYV1MZFB+WA2BfyBdTPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB7430.namprd11.prod.outlook.com (2603:10b6:510:274::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.24; Fri, 22 Mar
 2024 09:30:23 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7409.023; Fri, 22 Mar 2024
 09:30:23 +0000
Content-Type: multipart/alternative;
 boundary="------------8s4BWAvsD0szBqf3f7n8t0e1"
Message-ID: <2bb36b66-8931-4adc-9f94-5e37958a5f25@intel.com>
Date: Fri, 22 Mar 2024 15:00:17 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_migrate: Fix potential overflows expression
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20240320101835.3266429-1-himal.prasad.ghimiray@intel.com>
 <ZftN0eDAtRN1YnsG@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <ZftN0eDAtRN1YnsG@intel.com>
X-ClientProxiedBy: PN2P287CA0002.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:21b::10) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB7430:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a12f06-be36-4afc-2e5f-08dc4a52b31e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qa7VYwQ0k04m5Jxn+x1mw+ukq8JgK/8IhW9AxRwhP1fe9LrMlBun8mVBTOKwFR9Aicr9js9/9YwYnbEjOyBYjsrsdTotPpfy2THDJvJEdx4Vewr7QLUWKuJYgKXfPeYUDXIe3pZVFOj83+VPx27dqtQCWr8fI4iJARhi91ZX4pNlp5MvXASwg8FCZnMYBJoMcYOpvR9sGtFdB278pnwXUwFg/NHM28aqXsSimIAjUU/DGMSYDk80OYHP6lqDYJYwu/oObA/O1idUp6KwsBaixAaJtK+TmN16kB7PZi/iAKqhPjBYorBfhSJqXDJqq12oK+6lHE7soaVb+Qt9bdtmD5Ghv/JbTHoLTTjmaZJfrr90JWqGJvKam6Gs5Ys3HaUx5ZOxKKkwhFRngCoSjVatnNVCofdfxkOL5YcHfRe2vIl9uOd9BS/YGOBHKlRljLgiGCFARRpDrCc5LOv1TtFNwK8BLTX154s8/NASB0KirzMaGRKpO9gioFRglGiabJ45+qrd459HkQGUX/+1Xy1MQUApYUv5AsNLc9uk7Vegil45vVZYi9cLZvWLp5ufpvTDHxUVL95jZvhivQzfzKDRnjd38IzTCBRIQdQ7i8pnwelyc2kzp7f1AAKCcsL++zBzws+X9ao178aW63xrA5arLV19IMzDKyvNLJjkOqwDYPk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUZzckVkNStkSHVkU1pwTStTY2hRSzRlOGZrWjZOTVJhMFJHTDVzNGtqRnRM?=
 =?utf-8?B?enBvN1ZoYVZiTXR0a0Y1RTV1Ym1Rait4aFNQcDBhSzlmWnpYbXVwaVBSdzR6?=
 =?utf-8?B?TVFmbEdNQ2xOek93MXo4WmRaUFVoMWVVSHZmdVViNTNxVVNpY3B0d2dQRk9H?=
 =?utf-8?B?UUx6QlZ0U3VwZXlFVWVXc081azV2WUxOMDc2UllIdTJYUEVLY3pMUnJRMUpS?=
 =?utf-8?B?YmIvNEZqck5sdFYwbThCZktyZnkzYkUxYnBseHE0Mkk4alQ2T2IvQVlyMzBm?=
 =?utf-8?B?bjF3akdHczJGbzFtRmZNUDdjNlltTWM2R1ZubmhvQWYwYmVWeDd4WWkzcmNh?=
 =?utf-8?B?c0VxaTdzQ1k3dUJOSUNFNWxyN0lKWFlzaWYwOTlQSExQOTJYZGg4OFlRRFdL?=
 =?utf-8?B?UGlhVWUySkVxa0ZqeEI1RU5tWjRIdU1DMDU5bTZrbFN0dkVUd1Vvdm50WW5a?=
 =?utf-8?B?WVFpaUgvSytkbXFqUk5PTWp6S0gxallCQXRhNnVqWlpZWkdUL0pjY2hKdTFC?=
 =?utf-8?B?Ny9LcERlNXdGVDZlQzB5ZjF5UnplL1dPRldHWUtyOCtRYXVMd1dVTWxjRlVD?=
 =?utf-8?B?VG1MSTc2QXFxcTBXaUZmZ05VNmprNUpMcWNaNWpFS3JFNFRXYS8wVCs2M3dH?=
 =?utf-8?B?NWk3N1h2MlVsU09wbGk0b2Y5MlBueU9LNWlmeHBmVzdGd0pKTmdzc1dTL3FS?=
 =?utf-8?B?TnE0ZGFMRjhpdEdHNVV1L2pxTU9rSmhXUUd0MmhCSmdRcm9PWW9DVE81ZHNq?=
 =?utf-8?B?SnB5THovV3YzWWMwZXdxUkpJNDFtYm9ac0Y2OWdJREhubXdkd1dGVnU5U29m?=
 =?utf-8?B?Sit5NWFvNUdXdHZaZDJlVldnS1VsbmRBblZhc2lEOC9raUlDYllWTStrZkhz?=
 =?utf-8?B?S3RSdWp1NE5YTzg3L0N5R0JTODExSGFKVVFBYUVqbjZJQ2ZzWGVZdkVuZW14?=
 =?utf-8?B?SFZsL042eHlNQ3V2MFhoS3hTK3pweG9hSDNVbnpHNmd0bmtYMTgzS0M3MTdB?=
 =?utf-8?B?VkxFN3lIR21sc2VibVFkd0VpY3hRUm1SOGxoTTBCZVhEUWtyakRjaCt5aVNa?=
 =?utf-8?B?KzNZeFE0WFhmYzdGY0V1MDdiWmJkOVRJMU8ydWY1dGtNRHo4QmlVb0xuR1pm?=
 =?utf-8?B?SXAyc09UaHlOUUw4VG83VDBvSk1IRWh1VGZtNFAxd1huQVJTeEg4RUdYZFFz?=
 =?utf-8?B?M2VFUUs4andXTFo1Nm9SVTBBVmk5WHROMnkvT0tqVkVKd3FWMVJuNGg1Vkg4?=
 =?utf-8?B?T25oN3hCcHZkMkxhRllNQyttK091ZTdTcitySXNuQThBVmM4UTRRRS9PK1dD?=
 =?utf-8?B?bXZoWXdTL0dtRUFmVkl2QWtMbm04YW9wd2FiSlNYNG1hcS8rUHZLSVdHMTBk?=
 =?utf-8?B?MVByekJrOStyM1Fmd1FtYURrUUdnNGpIeFhnNUZ6Z0JqQXNPejhMQUYzbnlp?=
 =?utf-8?B?cG9iWHp4bjUvanlTa29GUElJOEptaGtHbDJlZHlNZWJ5MU95V3FQVXB6QkIz?=
 =?utf-8?B?SVNHejFiKzdzRHh2Yi8zemtsS01uVHVnb1FUWDlJRGJaSHRiclFySXh4R0Fr?=
 =?utf-8?B?NnhzbDY5c3R5M2lzcTlWQkZDZnptQ3dTWC85akVxbWJ6bGpzQjBpKzBFZGJp?=
 =?utf-8?B?VGpDVmVQRTVQVGtGU2hFNG51YzBzQ21lSkh1VS9pbTNneWRRY01Cb05xV01w?=
 =?utf-8?B?aGZEdkRLNGp0ZHllb3cydlpxT0hIbDlVaVRoWEl3TUJHWmdxMzdWVzB4cE9M?=
 =?utf-8?B?NGNYRjdEK2QxYzF6N3MzZmJUZUJWcEhleSsyeVpVMVdzc0RqWklhV2tHK2dm?=
 =?utf-8?B?cldiVzZVYzc1ZnlNT2xjNW9kNkNhdkJjTU9jaXluQ0Fhb3VOMEpkbUtxNVZS?=
 =?utf-8?B?SW9JVENGU3NBN1F3ZTdCWDRPd3cwL1dqTU9HRmRESWplaWh4NjhPSnRXSDZq?=
 =?utf-8?B?djl6L3R2OHBvaVZ3Ry9aREgxTTk2dEU1Nm01eXF5K2ROUDFSMDBuY1hLVGFB?=
 =?utf-8?B?NEc2aXUrRkRsSmJkY1VQelZLRUtZd3M0b2svZ1dndGJFbDV2aWhDbzBrU0hM?=
 =?utf-8?B?Z3JTVmRUZUF5RkZieitYWDl3WldYeTUvOTkrOVZVbGxLSDdKS1BOQmtiU1FR?=
 =?utf-8?B?ZnlrZVFyQ0NQMVVuR3NMMXdUQ3N3Tk15QUpGRFplZXhwUkdiY3hqVGpSU01T?=
 =?utf-8?B?UVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a12f06-be36-4afc-2e5f-08dc4a52b31e
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2024 09:30:23.3829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PXS8QQ3TsTJWMhEHEJlqVDUmKuuQmk5CaR+wItRqwN3TP2oLxds7eYVeepCTLkI02b8G79NwpNxI7uAdv1fNqWyEYgrDDNC7WgJyI3knapc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7430
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

--------------8s4BWAvsD0szBqf3f7n8t0e1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 21-03-2024 02:27, Rodrigo Vivi wrote:
> On Wed, Mar 20, 2024 at 03:48:35PM +0530, Himal Prasad Ghimiray wrote:
>> Cast to proper datatypes to avoid overflows.
> I'm afraid that the cast wont prevent the overflow, but mask it.
> probably safer to move the multiplication to some of the helpers
> in linux/math64.h ?!
Hi Rodrigo,
Thank you for your response. The modifications are inspired by the 
inline |u64 mul_u32_u32(u32 a, u32 b)|
function defined in |linux/math64.h|. Initially, I considered using the 
same approach.
However, I discovered an architecture-specific implementation for 
|mul_u32_u32|.
To prevent ambiguity, I opted for casting, which I observed is a 
standard practice throughout Linux code.
BR
Himal
>
>> Cc: Matthew Auld<matthew.auld@intel.com>
>> Cc: Matthew Brost<matthew.brost@intel.com>
>> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray<himal.prasad.ghimiray@intel.com>
>> ---
>> These errors were highlighted by Coverity. I'm uncertain whether they
>> require attention or if it would be more appropriate to label them as
>> false positives within the tool.
>>
>> I've submitted this patch in case addressing the issues is necessary.
>> However, if reviewers determine that these issues should be marked as
>> false positives or ignored within the tool, that option is also
>> available
>>
>>   drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>> index ee1bb938c493..2ba4fb9511f6 100644
>> --- a/drivers/gpu/drm/xe/xe_migrate.c
>> +++ b/drivers/gpu/drm/xe/xe_migrate.c
>> @@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   		if (vm->flags & XE_VM_FLAG_64K && level == 1)
>>   			flags = XE_PDE_64K;
>>   
>> -		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (level - 1) *
>> +		entry = vm->pt_ops->pde_encode_bo(bo, map_ofs + (u64)(level - 1) *
>>   						  XE_PAGE_SIZE, pat_index);
>>   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE * level, u64,
>>   			  entry | flags);
>> @@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   
>>   	/* Write PDE's that point to our BO. */
>>   	for (i = 0; i < num_entries - num_level; i++) {
>> -		entry = vm->pt_ops->pde_encode_bo(bo, i * XE_PAGE_SIZE,
>> +		entry = vm->pt_ops->pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
>>   						  pat_index);
>>   
>>   		xe_map_wr(xe, &bo->vmap, map_ofs + XE_PAGE_SIZE +
>> @@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
>>   #define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
>>   #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
>>   	drm_suballoc_manager_init(&m->vm_update_sa,
>> -				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>> +				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
>>   				  NUM_VMUSA_UNIT_PER_PAGE, 0);
>>   
>>   	m->pt_bo = bo;
>> @@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
>>   	struct xe_vm *vm = m->q->vm;
>>   	u16 pat_index;
>>   	u32 ptes;
>> -	u64 ofs = at_pt * XE_PAGE_SIZE;
>> +	u64 ofs = (u64)at_pt * XE_PAGE_SIZE;
>>   	u64 cur_ofs;
>>   
>>   	/* Indirect access needs compression enabled uncached PAT index */
>> -- 
>> 2.25.1
>>
--------------8s4BWAvsD0szBqf3f7n8t0e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 21-03-2024 02:27, Rodrigo Vivi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:ZftN0eDAtRN1YnsG@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On Wed, Mar 20, 2024 at 03:48:=
35PM +0530, Himal Prasad Ghimiray wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">Cast to proper datatypes to =
avoid overflows.
</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I'm afraid that the cast wont prevent the overflow, but mask it.
probably safer to move the multiplication to some of the helpers
in linux/math64.h ?!</pre>
    </blockquote>
    <font face=3D"monospace">Hi Rodrigo,<br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">Thank you for your response. =
The modifications are inspired by the inline </span><code style=3D"border: =
0px solid rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x=
: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --=
tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y=
: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strict=
ness: proximity; --tw-gradient-from-position: ; --tw-gradient-via-position:=
 ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-n=
umeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring=
-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-r=
ing-color: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --=
tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-=
colored: 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; =
--tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-s=
epia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness:=
 ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-r=
otate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-sat=
urate: ; --tw-backdrop-sepia: ; font-size: 0.875em; color: rgb(13, 13, 13);=
 font-weight: 600; font-style: normal; font-variant-ligatures: normal; font=
-variant-caps: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255); text-de=
coration-thickness: initial; text-decoration-style: initial; text-decoratio=
n-color: initial;">u64 mul_u32_u32(u32 a, u32 b)</code><span style=3D"color=
: rgb(13, 13, 13); font-size: 16px; font-style: normal; font-variant-ligatu=
res: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background=
-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decora=
tion-style: initial; text-decoration-color: initial; display: inline !impor=
tant; float: none;"> </span><br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">function defined in </span><c=
ode style=3D"border: 0px solid rgb(227, 227, 227); box-sizing: border-box; =
--tw-border-spacing-x: 0; --tw-border-spacing-y: 0; --tw-translate-x: 0; --=
tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-sca=
le-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --=
tw-scroll-snap-strictness: proximity; --tw-gradient-from-position: ; --tw-g=
radient-via-position: ; --tw-gradient-to-position: ; --tw-ordinal: ; --tw-s=
lashed-zero: ; --tw-numeric-figure: ; --tw-numeric-spacing: ; --tw-numeric-=
fraction: ; --tw-ring-inset: ; --tw-ring-offset-width: 0px; --tw-ring-offse=
t-color: #fff; --tw-ring-color: rgba(69,89,164,.5); --tw-ring-offset-shadow=
: 0 0 transparent; --tw-ring-shadow: 0 0 transparent; --tw-shadow: 0 0 tran=
sparent; --tw-shadow-colored: 0 0 transparent; --tw-blur: ; --tw-brightness=
: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue-rotate: ; --tw-invert: ; --=
tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: ; --tw-backdrop-blur: ; --tw=
-backdrop-brightness: ; --tw-backdrop-contrast: ; --tw-backdrop-grayscale: =
; --tw-backdrop-hue-rotate: ; --tw-backdrop-invert: ; --tw-backdrop-opacity=
: ; --tw-backdrop-saturate: ; --tw-backdrop-sepia: ; font-size: 0.875em; co=
lor: rgb(13, 13, 13); font-weight: 600; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(25=
5, 255, 255); text-decoration-thickness: initial; text-decoration-style: in=
itial; text-decoration-color: initial;">linux/math64.h</code><span style=3D=
"color: rgb(13, 13, 13); font-size: 16px; font-style: normal; font-variant-=
ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; back=
ground-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-=
decoration-style: initial; text-decoration-color: initial; display: inline =
!important; float: none;">. Initially, I considered using the same approach=
. </span><br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">However, I discovered an arch=
itecture-specific implementation for </span><code style=3D"border: 0px soli=
d rgb(227, 227, 227); box-sizing: border-box; --tw-border-spacing-x: 0; --t=
w-border-spacing-y: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotat=
e: 0; --tw-skew-x: 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --t=
w-pan-x: ; --tw-pan-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: pr=
oximity; --tw-gradient-from-position: ; --tw-gradient-via-position: ; --tw-=
gradient-to-position: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-f=
igure: ; --tw-numeric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: =
; --tw-ring-offset-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-colo=
r: rgba(69,89,164,.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-=
shadow: 0 0 transparent; --tw-shadow: 0 0 transparent; --tw-shadow-colored:=
 0 0 transparent; --tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-gra=
yscale: ; --tw-hue-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; =
--tw-drop-shadow: ; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-=
backdrop-contrast: ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ;=
 --tw-backdrop-invert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ;=
 --tw-backdrop-sepia: ; font-size: 0.875em; color: rgb(13, 13, 13); font-we=
ight: 600; font-style: normal; font-variant-ligatures: normal; font-variant=
-caps: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; w=
hite-space: pre-wrap; background-color: rgb(255, 255, 255); text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial;">mul_u32_u32</code><span style=3D"color: rgb(13, 13, 13); font-si=
ze: 16px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 255)=
; text-decoration-thickness: initial; text-decoration-style: initial; text-=
decoration-color: initial; display: inline !important; float: none;">. </sp=
an><br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">To prevent ambiguity, I opted=
 for casting, which I observed is a standard practice throughout Linux code=
.</span><br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">BR</span><br>
      <span style=3D"color: rgb(13, 13, 13); font-size: 16px; font-style: n=
ormal; font-variant-ligatures: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-s=
pace: pre-wrap; background-color: rgb(255, 255, 255); text-decoration-thick=
ness: initial; text-decoration-style: initial; text-decoration-color: initi=
al; display: inline !important; float: none;">Himal </span><span style=3D"c=
olor: rgb(13, 13, 13); font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; word-=
spacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgr=
ound-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial; display: inline !i=
mportant; float: none;">
</span></font>
    <blockquote type=3D"cite" cite=3D"mid:ZftN0eDAtRN1YnsG@intel.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">

</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">
Cc: Matthew Auld <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew.=
auld@intel.com">&lt;matthew.auld@intel.com&gt;</a>
Cc: Matthew Brost <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:matthew=
.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:rodrigo.=
vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Signed-off-by: Himal Prasad Ghimiray <a class=3D"moz-txt-link-rfc2396E" hre=
f=3D"mailto:himal.prasad.ghimiray@intel.com">&lt;himal.prasad.ghimiray@inte=
l.com&gt;</a>
---
These errors were highlighted by Coverity. I'm uncertain whether they
require attention or if it would be more appropriate to label them as
false positives within the tool.

I've submitted this patch in case addressing the issues is necessary.
However, if reviewers determine that these issues should be marked as
false positives or ignored within the tool, that option is also
available

 drivers/gpu/drm/xe/xe_migrate.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrat=
e.c
index ee1bb938c493..2ba4fb9511f6 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -227,7 +227,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, =
struct xe_migrate *m,
 		if (vm-&gt;flags &amp; XE_VM_FLAG_64K &amp;&amp; level =3D=3D 1)
 			flags =3D XE_PDE_64K;
=20
-		entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, map_ofs + (level - 1) *
+		entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, map_ofs + (u64)(level - 1)=
 *
 						  XE_PAGE_SIZE, pat_index);
 		xe_map_wr(xe, &amp;bo-&gt;vmap, map_ofs + XE_PAGE_SIZE * level, u64,
 			  entry | flags);
@@ -235,7 +235,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, =
struct xe_migrate *m,
=20
 	/* Write PDE's that point to our BO. */
 	for (i =3D 0; i &lt; num_entries - num_level; i++) {
-		entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, i * XE_PAGE_SIZE,
+		entry =3D vm-&gt;pt_ops-&gt;pde_encode_bo(bo, (u64)i * XE_PAGE_SIZE,
 						  pat_index);
=20
 		xe_map_wr(xe, &amp;bo-&gt;vmap, map_ofs + XE_PAGE_SIZE +
@@ -291,7 +291,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, =
struct xe_migrate *m,
 #define VM_SA_UPDATE_UNIT_SIZE		(XE_PAGE_SIZE / NUM_VMUSA_UNIT_PER_PAGE)
 #define NUM_VMUSA_WRITES_PER_UNIT	(VM_SA_UPDATE_UNIT_SIZE / sizeof(u64))
 	drm_suballoc_manager_init(&amp;m-&gt;vm_update_sa,
-				  (map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
+				  (size_t)(map_ofs / XE_PAGE_SIZE - NUM_KERNEL_PDE) *
 				  NUM_VMUSA_UNIT_PER_PAGE, 0);
=20
 	m-&gt;pt_bo =3D bo;
@@ -490,7 +490,7 @@ static void emit_pte(struct xe_migrate *m,
 	struct xe_vm *vm =3D m-&gt;q-&gt;vm;
 	u16 pat_index;
 	u32 ptes;
-	u64 ofs =3D at_pt * XE_PAGE_SIZE;
+	u64 ofs =3D (u64)at_pt * XE_PAGE_SIZE;
 	u64 cur_ofs;
=20
 	/* Indirect access needs compression enabled uncached PAT index */
--=20
2.25.1

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------8s4BWAvsD0szBqf3f7n8t0e1--
