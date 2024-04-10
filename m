Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAEA7CD1297
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 04:29:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DCC5113108;
	Wed, 10 Apr 2024 04:29:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GhBE2geW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F79113108
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 04:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712723341; x=1744259341;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=RuVHAXx3QdZcAFaZvGQd5csWr8UYbmXcKtueB9dirks=;
 b=GhBE2geWTr7RyC4Q2Qy+YEGg+TqF7oDRUBWrrCCM+7Mvj372vTkn55J9
 pXw1o3zKGiAj2oRBGFQRKDGNc+8iEaKTpeQ+oEoO2nWmrd3agquZZhofi
 pjINROe+etd6EOrCqURaGMlTLLRVaYhB/1OGJu2vqreIfQNnKQ5Vvk2ZW
 njh0J3a3iVGFtVLc2uOkgoeMZi4y911srAainJIeQCL5IEVCL9LObbpIc
 hPmeDJMsyyNU/gSJq/eUigPn8RZ2kBtYYPTeA/Kx2jAxtELXp3PCXnN9N
 BlRpdxAC/C4OSJlutAG1sOQ/mI6f612JDUUwqexyU8ZPqcXKhbhIDakng Q==;
X-CSE-ConnectionGUID: U9rxZbcRTaehty88H21FVA==
X-CSE-MsgGUID: GHlNb2PvQ2ylVWzWiIiddg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8638861"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="8638861"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 21:28:59 -0700
X-CSE-ConnectionGUID: ilperxe5TeS7GWH2SNzHWw==
X-CSE-MsgGUID: KELT0kIUQuadehEOLWvVvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208,217";a="20313025"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Apr 2024 21:28:59 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Apr 2024 21:28:58 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Apr 2024 21:28:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 9 Apr 2024 21:28:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RVp0MGOADamfqum4QWxry20rjqE4lonxSM1psX4LZlN5EsFITpR8ueGWpMuI4vcCQTxFF+waZjd+67hAVgj3IYdfLHGoSw7C6wIDMDuw48HNHtUOc/I5bUBFX9hY17DVOr4fSjiVz69/FGzGaHl5q4OTKzmy1SZ/k2HFrn9hsCTU5FJqsz8DQKgB+zPKjZfk3/TVqX/gKBjB4n3K5dIn9n/BYsIxCp7/GqGukCiXsKcNwVRe3inXesD0poYL90Q9nWBNylkBnmgotpFn8eLl+W5bhyKCDtMdzwnk50Qtes1XvBjKNpNmoh5LKgZclnNQFDhhsfqfWZPWkvjH/Qn9Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=55kdXGcp/JfC9TP1CdRa/q2PQGlOuM7G0KjW/Qkjqzg=;
 b=DEo/f0MJnRn2Yyn4sv9QKmZ3HxdCvlO6VyK3HzAekH7RfLB9eWGmaCeF1bw3VXYTME12QyldwgOLUwE9dLHI64XhqG6GtppfaMv+fBY5R6vkmWYS5kjdoEn4AOjp8Xhuy88n8urTXpBnz8vUgoN0JUl72NYkDgDR5d+k27KxcWskpb3hsF3asMBzgR5Y7juNbspCbg0kD7SW7aljN11MwOSA7HpYOKtTpFmyz9GIJmRqZ12H2tydEjCozlFO6aDKDVjlpDF70o5hvykMA7gHbveFy5z2I/ml+iZwKpfgALEUoKst4VH2lIT/kSR6smKCBcPzXw9r+2+sozXroZS77A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by CH0PR11MB5297.namprd11.prod.outlook.com (2603:10b6:610:bc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 04:28:51 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::8664:8749:8357:f11a%7]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 04:28:51 +0000
Content-Type: multipart/alternative;
 boundary="------------d0OEUTzQkd1Pb4AQiVQzNvAR"
Message-ID: <c420106e-d516-4317-9ab6-462d9d72bd61@intel.com>
Date: Wed, 10 Apr 2024 09:58:45 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Check result of drmm_mutex_init()
To: <intel-xe@lists.freedesktop.org>
References: <20240409153132.1111-1-michal.wajdeczko@intel.com>
 <yzab3rps47j7t5o7cbi22yek7xzfmne2c6fa7bhgmsnedtpt5u@b2aje4vank6e>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <yzab3rps47j7t5o7cbi22yek7xzfmne2c6fa7bhgmsnedtpt5u@b2aje4vank6e>
X-ClientProxiedBy: PN3PR01CA0161.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:c8::17) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|CH0PR11MB5297:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hmab2Yb2IupClXVdNWVSFDc/sbjLXEFviMNS9EdSmgG7uWBBbzNK5/MXkaKsk2ciHDUWzo30h7hmZli6DediJ5f9VHxUtcbIsnO2TIOE0QHYD6ikBXpw2Jq+SHcUH/eHE1i70HFCnjcXAe+sbL5ItgxgYlZrb58PO4ZyWkDmpA4ByTTKs7uiydySM4pWOAllODUJ4s20BVoq7oHQgM7rqRlqVMWRpQS7YA5VPZiq0sHQFqfZluJfuXHz9AcTzwVaiDLegmaqgr+j5RUsigIov2JcvDfEJgUXmaxQ8+nTE112Ijxj1gpEVK8lkIqtJaR2nol3TR5wC1SFJbADqovk4gl6/ps9YxcazYd4B/QZ5Fh1zRxWY3nK0LHrQZMRb6HCvCqZ+zqEC4QGHMqKcNlLFkESLahMwDnlw7asPZgNurTkZpUMp8BCtZyWvJS2noLbtthcw0rJC5VkseT6kHz0j+YTpGLh1TQu3nBVvh3ris2xS/b+YmEynOJnmqb3tj5+GcyGeQ8mjF90rr+1gkJzbpxyD3M0rQj/Y+ubiajM082V2FecrVGFtbEeA8UIXUdWmgTmEZwGGLc3RJtI/PHsSm+kgZarhTbKWW/nCiseGDI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlZzY2I1LzNNY2NHRWFRWmovclNrT0Rpdyt5N0lBaDdadEJwNjAySVVUMVJs?=
 =?utf-8?B?NUtja1Nzc0xmWkFxeU13L1kzQlY2eWtuSlRZWVUvMUs5ei9yQkIrVGc3eEdB?=
 =?utf-8?B?Q2w3VUQ3MVNLYzg0MkVhTmExU1o0ZWxZa2hTSXd1K1U0d2Z5UUl2MGdzTW9N?=
 =?utf-8?B?QWpDYnZGSVA0M0VzREJsdDJ2SVNya2FraERkZ2ticnpjT2hnOWhPUk5mSUZN?=
 =?utf-8?B?aWNYMWdZemtoY3FLMWxHZTJGVmVmcmFxeXNmdFF6Q1NBVUN5cW9Kd0NZV1R1?=
 =?utf-8?B?VmNsbENJWk8rVGdBRlJrR0x1OUFGSHJVKzBHVWFZTngyRkhlVGg3cXZrUnVZ?=
 =?utf-8?B?K0tseU5XVnJvcE0zOTBvUGZDTDN4YnhQT0FrK3F3YVdsWUxSTjR4SDhDVHMw?=
 =?utf-8?B?MTFXallucHQ2bmlBQzFnaFZFQnE4YW5HaURKQU05Ni9yZ2JHaWdKSVZCSVM3?=
 =?utf-8?B?SndJV0NsS2VVQ2d3ZU9QUUlFdHMxampTeDV6K3dYTnk3TmFjeVl0K0FNVnNz?=
 =?utf-8?B?V3BNbm9nWjB5SWpmV0EvZE9yYlpMWm0yTElNUmYyQmtvamorRllRNmkxM1pH?=
 =?utf-8?B?ZlgreklIMGNENk5nWHpVQjUwb0ZHc0pNSXp3Q2FIRXVsdlQyWTBSWXdNdHdP?=
 =?utf-8?B?anZXeHhXNS9RV3B6Y051UzVXblhlNkl3dkx3RWpab2syRkQwTEtWb3pndUV5?=
 =?utf-8?B?UEtRaXVBeGYrTU8zWEJmQ3dyUVhOblp1VjNaZVRXSXBzM25FaFUwOThFaVds?=
 =?utf-8?B?TEVmNWNSeFBUT3dqTm1nQTN1dWtpOUxZckFUa2JUYXhlTWYzMlRHRHlwQVN2?=
 =?utf-8?B?cFlrcTBCeVFFdCs1UkRDVXRRbnFsQmZUbzhEV092b1RqZkh0YnhFQUhLWVEv?=
 =?utf-8?B?Zk4vTXhNK09qK0lDbXVWVCtwSUFQSVJkTHQ2a01DOFhKMTNXeFBFZWZKWXdJ?=
 =?utf-8?B?MjVmOTRwNkw4Z1I3eWR2NUlJdkRQSFVFdkJRNGFSVzBQNDJPZ0F0TVhIeHFD?=
 =?utf-8?B?cXhac0d3TmlOeVhmeWhWbXJDV2pwY2RkTDVkNVRXSFJQeG5GZnppOVRTTlR2?=
 =?utf-8?B?Q3pUVERJRVIvNjlmMDV3MkgxZ3FaNEpxZkJZaG1yelA1NFh3T2VQb3FGb3BJ?=
 =?utf-8?B?V0hZSmZBZ3ZjS2NWelR5K3N1WXJreXFLVDkrUUcxMFdRQi95VFBUcHZUZ253?=
 =?utf-8?B?OGoxYkNXNUhtSWlBcUdGQ1gyd2V4cU12dURrY1pubTUzUVJ5YTdPY1BGRHNr?=
 =?utf-8?B?UUQ5dEJyQmNFMHN2eXd2L1ZhSjlrRUFEQXhQV2x4eFRvM3NPdVVLK0dNYitu?=
 =?utf-8?B?OVdTWm9VR01XRWhmZndWd2ZQbm5kQnhibzFpOEliZDFTRHdQNjlqZDZNUENU?=
 =?utf-8?B?UUhoblpGcVRNUFQvb2ZmYXFhZTROSXlVSGRCTlJFelIwTUZMT3BlNHRTYkNI?=
 =?utf-8?B?LzhlNTh2MEU2Y3JKZ3ZRZGNwQXhpWlRVQmNSbysvcjFDc1JtTHVMNndrbmxa?=
 =?utf-8?B?bjNubjFHTHh1TmZjeWVxZEFMNjJXOWVEQVdabHN2Z2lkK2x1d0RxaXJlNmgz?=
 =?utf-8?B?T1V6YkRGdGc4SXp5U2JUa0lsMFh5c2lMZXl6SGVkY0pvN29nSU1rVXI1cU5t?=
 =?utf-8?B?dFFteVhnUzVvTDByMVJObGNqVWlCV2ttZGtaNWZ4Tlh0Ynh2TURjU0pSZkxt?=
 =?utf-8?B?azVhWlNxRXh4T2JIK1FDWnRVOHFCTXMwU1hXcFpOeGd0RHkxaTlSZm1rNXVv?=
 =?utf-8?B?STF1STFBZVUwSVRZYk9DVElFampZd1JqTDNwR0lKMVJvRjFKamlSbGV5ZVBS?=
 =?utf-8?B?VXgwWWRaMHY5ZmdaMytXTDByTFF3NHVFTFVlWGtQd1N5S2t6dm41NEJLd0l5?=
 =?utf-8?B?VjJ1ZEoyOXpwdVFSQ0FIRFREUU9zN2dFbk0zeXFaQWpmR0FuVDFrU0Irc1JI?=
 =?utf-8?B?SUgzQkIvRDlUVVRzd0Z2Y2FITHY0RThvWkNGeGt5TU9WblRPd0lMdFgzd1I0?=
 =?utf-8?B?Z1RTOEJjc1p0QVZTSktPQjIvZXlZYkhhSGlKWmFxdlhkVVp3SCtOenY1cEQ1?=
 =?utf-8?B?VWJ0MndKSzl4Q3JROUIzYTI4eEF1dnI2MmZQRWxxWXBwem9rc0NBWnYzeHZD?=
 =?utf-8?B?MnRIUlMwOTNVdGtQcGhHVmhYeHlyRHRxSVdZT0tBU25pZHIwYkN4VHRPaCtr?=
 =?utf-8?Q?iKyjZIuCjgJ7Ql3dDX48xHI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 16c0e246-1db5-4b2d-1837-08dc5916b8fd
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 04:28:51.0521 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 10QfS051yspUUabITxADzHkbK8/6aJgxD7Eth+H5/8tr4UUL3dNDpHwF9YI5OUEMXMQjNwpE03LJ13X3B/Eybo1oIxDUJJSKmreJHKtFw2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5297
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

--------------d0OEUTzQkd1Pb4AQiVQzNvAR
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 09-04-2024 23:31, Lucas De Marchi wrote:
> On Tue, Apr 09, 2024 at 05:31:32PM +0200, Michal Wajdeczko wrote:
>> Although it's unlikely that drmm_mutex_init() will fail during
>> driver initialization, however we shouldn't ignore this case.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>
> there was already a patch pending for this, but got stuck because it was
> trying to do something similar for all the display mutexes, that
> shouldn't be there in the first place. Not sure if we take that one with
> conflict resolved or this.



If the patch mentioned is 
https://patchwork.freedesktop.org/series/131300/, it does not resolve 
the mutex mentioned above.

>
>> ---
>> drivers/gpu/drm/xe/xe_device.c | 4 +++-
>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>> b/drivers/gpu/drm/xe/xe_device.c
>> index 9083f5e02dd9..ba3643906d9e 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -273,7 +273,9 @@ struct xe_device *xe_device_create(struct pci_dev 
>> *pdev,
>>
>>     init_waitqueue_head(&xe->ufence_wq);
>>
>> -    drmm_mutex_init(&xe->drm, &xe->usm.lock);
>> +    err = drmm_mutex_init(&xe->drm, &xe->usm.lock);
>> +    if (err)
>> +        goto err;
>
> blank line missing
>
> Lucas De Marchi
>
>>     xa_init_flags(&xe->usm.asid_to_vm, XA_FLAGS_ALLOC);
>>
>>     if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
>> -- 
>> 2.43.0
>>
--------------d0OEUTzQkd1Pb4AQiVQzNvAR
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 09-04-2024 23:31, Lucas De Marchi
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:yzab3rps47j7t5o7cbi22yek7xzfmne2c=
6fa7bhgmsnedtpt5u@b2aje4vank6e">On
      Tue, Apr 09, 2024 at 05:31:32PM +0200, Michal Wajdeczko wrote:
      <br>
      <blockquote type=3D"cite">Although it's unlikely that
        drmm_mutex_init() will fail during
        <br>
        driver initialization, however we shouldn't ignore this case.
        <br>
        <br>
        Signed-off-by: Michal Wajdeczko
        <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:michal.wajdeczko@=
intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
        <br>
      </blockquote>
      <br>
      there was already a patch pending for this, but got stuck because
      it was
      <br>
      trying to do something similar for all the display mutexes, that
      <br>
      shouldn't be there in the first place. Not sure if we take that
      one with
      <br>
      conflict resolved or this.
      <br>
    </blockquote>
    <p><br>
    </p>
    <p><br class=3D"Apple-interchange-newline">
      <span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-sa=
ns-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, C=
antarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, Ar=
ial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe=
 UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-style=
: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-ind=
ent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, 2=
55); text-decoration-thickness: initial; text-decoration-style: initial; te=
xt-decoration-color: initial; display: inline !important; float: none;">If =
the patch mentioned is </span><a target=3D"_new" href=3D"https://patchwork.=
freedesktop.org/series/131300/" style=3D"border: 0px solid rgb(227, 227, 22=
7); box-sizing: border-box; --tw-border-spacing-x: 0; --tw-border-spacing-y=
: 0; --tw-translate-x: 0; --tw-translate-y: 0; --tw-rotate: 0; --tw-skew-x:=
 0; --tw-skew-y: 0; --tw-scale-x: 1; --tw-scale-y: 1; --tw-pan-x: ; --tw-pa=
n-y: ; --tw-pinch-zoom: ; --tw-scroll-snap-strictness: proximity; --tw-grad=
ient-from-position: ; --tw-gradient-via-position: ; --tw-gradient-to-positi=
on: ; --tw-ordinal: ; --tw-slashed-zero: ; --tw-numeric-figure: ; --tw-nume=
ric-spacing: ; --tw-numeric-fraction: ; --tw-ring-inset: ; --tw-ring-offset=
-width: 0px; --tw-ring-offset-color: #fff; --tw-ring-color: rgba(69,89,164,=
.5); --tw-ring-offset-shadow: 0 0 transparent; --tw-ring-shadow: 0 0 transp=
arent; --tw-shadow: 0 0 transparent; --tw-shadow-colored: 0 0 transparent; =
--tw-blur: ; --tw-brightness: ; --tw-contrast: ; --tw-grayscale: ; --tw-hue=
-rotate: ; --tw-invert: ; --tw-saturate: ; --tw-sepia: ; --tw-drop-shadow: =
; --tw-backdrop-blur: ; --tw-backdrop-brightness: ; --tw-backdrop-contrast:=
 ; --tw-backdrop-grayscale: ; --tw-backdrop-hue-rotate: ; --tw-backdrop-inv=
ert: ; --tw-backdrop-opacity: ; --tw-backdrop-saturate: ; --tw-backdrop-sep=
ia: ; --tw-contain-size: ; --tw-contain-layout: ; --tw-contain-paint: ; --t=
w-contain-style: ; color: var(--link); text-decoration: none; font-weight: =
400; font-family: S=C3=B6hne, ui-sans-serif, system-ui, -apple-system, &quo=
t;Segoe UI&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-se=
rif, &quot;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quo=
t;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji=
&quot;; font-size: 16px; font-style: normal; font-variant-ligatures: normal=
; font-variant-caps: normal; letter-spacing: normal; orphans: 2; text-align=
: start; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0=
px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-color=
: rgb(255, 255, 255);" class=3D"moz-txt-link-freetext">https://patchwork.fr=
eedesktop.org/series/131300/</a><span style=3D"color: rgb(13, 13, 13); font=
-family: S=C3=B6hne, ui-sans-serif, system-ui, -apple-system, &quot;Segoe U=
I&quot;, Roboto, Ubuntu, Cantarell, &quot;Noto Sans&quot;, sans-serif, &quo=
t;Helvetica Neue&quot;, Arial, &quot;Apple Color Emoji&quot;, &quot;Segoe U=
I Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; f=
ont-size: 16px; font-style: normal; font-variant-ligatures: normal; font-va=
riant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; t=
ext-align: start; text-indent: 0px; text-transform: none; widows: 2; word-s=
pacing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgro=
und-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-dec=
oration-style: initial; text-decoration-color: initial; display: inline !im=
portant; float: none;">, it does not resolve the mutex mentioned above.</sp=
an></p>
    <p><span style=3D"color: rgb(13, 13, 13); font-family: S=C3=B6hne, ui-s=
ans-serif, system-ui, -apple-system, &quot;Segoe UI&quot;, Roboto, Ubuntu, =
Cantarell, &quot;Noto Sans&quot;, sans-serif, &quot;Helvetica Neue&quot;, A=
rial, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Sego=
e UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-size: 16px; font-styl=
e: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; orphans: 2; text-align: start; text-in=
dent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; white-space: pre-wrap; background-color: rgb(255, 255, =
255); text-decoration-thickness: initial; text-decoration-style: initial; t=
ext-decoration-color: initial; display: inline !important; float: none;">
</span></p>
    <blockquote type=3D"cite" cite=3D"mid:yzab3rps47j7t5o7cbi22yek7xzfmne2c=
6fa7bhgmsnedtpt5u@b2aje4vank6e">
      <br>
      <blockquote type=3D"cite">---
        <br>
        drivers/gpu/drm/xe/xe_device.c | 4 +++-
        <br>
        1 file changed, 3 insertions(+), 1 deletion(-)
        <br>
        <br>
        diff --git a/drivers/gpu/drm/xe/xe_device.c
        b/drivers/gpu/drm/xe/xe_device.c
        <br>
        index 9083f5e02dd9..ba3643906d9e 100644
        <br>
        --- a/drivers/gpu/drm/xe/xe_device.c
        <br>
        +++ b/drivers/gpu/drm/xe/xe_device.c
        <br>
        @@ -273,7 +273,9 @@ struct xe_device *xe_device_create(struct
        pci_dev *pdev,
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;init_waitqueue_head(&amp;xe-&gt;ufence_wq);
        <br>
        <br>
        -&nbsp;&nbsp;&nbsp; drmm_mutex_init(&amp;xe-&gt;drm, &amp;xe-&gt;us=
m.lock);
        <br>
        +&nbsp;&nbsp;&nbsp; err =3D drmm_mutex_init(&amp;xe-&gt;drm,
        &amp;xe-&gt;usm.lock);
        <br>
        +&nbsp;&nbsp;&nbsp; if (err)
        <br>
        +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; goto err;
        <br>
      </blockquote>
      <br>
      blank line missing
      <br>
      <br>
      Lucas De Marchi
      <br>
      <br>
      <blockquote type=3D"cite">&nbsp;&nbsp;&nbsp;&nbsp;xa_init_flags(&amp;=
xe-&gt;usm.asid_to_vm,
        XA_FLAGS_ALLOC);
        <br>
        <br>
        &nbsp;&nbsp;&nbsp;&nbsp;if (IS_ENABLED(CONFIG_DRM_XE_DEBUG)) {
        <br>
        --&nbsp;<br>
        2.43.0
        <br>
        <br>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------d0OEUTzQkd1Pb4AQiVQzNvAR--
