Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC9C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 13:40:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2800510E77C;
	Mon, 25 Mar 2024 13:40:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kxwUox71";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794C10E77C
 for <intel-xe@lists.freedesktop.org>; Mon, 25 Mar 2024 13:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711374029; x=1742910029;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=IhtgJ18RcRpSqtLj85XrWHcPysM6Zbcv1x7Utt/h7iY=;
 b=kxwUox71sjSSLI7gFjnOtR9nuRAsWmS7k/2R/olVfxvs0BnG+/9JDeQW
 7QgKN+P2bUu5REg7F+1G/bMCdLFZipE/6KFzFf64JTyA/Og6yJDnIuhR1
 bbmGH8+6G+KCMZm8Q1/6fGK447e2H0/4p7SBNVyMF5XiF4cdjlQKagkgH
 s9lOBGLWajQfi2xAiC7dUvNRg57/UEKRAOAAM+T9dZOS/1r+zulS3nCAl
 kw5PoaSuUD4bW5UqwKraVgCwgRps7JNo6+1rfcdveeIwz/7MHEwHr0aKY
 CQcp6+zHOfMdXKlo54eIk0Mck2MsUcYtlWBR8c91NnMYVq7ML4zBRp8ZD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="10146785"
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="10146785"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2024 06:40:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,153,1708416000"; d="scan'208";a="20087732"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 25 Mar 2024 06:40:28 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 06:40:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 25 Mar 2024 06:40:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 25 Mar 2024 06:40:27 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 25 Mar 2024 06:39:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mYQwT2e2gKTP9Yjff4CUimKpWYqgbamRYp3QQ1/mVbOhVFWa6pI4TaRRMyIGhX4stlvcG/lr85U0fARQMY1FSMYBSRLdLSt0imeqTKwaziCWtHSt0O6JEsn3u0e1h/qlmBE8pSB4iuC6LdqMiWJ6Nu043O7QRwPdwt1Phbr/s++IE40RLWyi7JQiqzo7Ny/dpaJwueE0dkxIXc6MqX/Oe8clN493od+R/jMgjZYSPaw4RUUJXRzmLANdz0500xlXK/J4LLvSUCxdJnFeg0ItrqzpDBUMrmzHrBKdiwkQxnmpLi8A0KlXSNwFQfg3X6GkWfFFmhQ3gJmDWsGcCiQWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P4tBTz6nbSohEft2/itgVLwQQ3/yG/5rxypaOD/DjRQ=;
 b=INnGkVCpRY4KulkhOSoguCBFzLrJbZdBEN6PJn63MJAs3kSfm7ICo5Yax0PqG0/Apxm5mlp0RJnN6NCpMXNnMqzDmsPj1JVwH2jW0nIvY00GKy32/DjB4V0YPjAnPFm5zO1sjZmjvhZBhy930n8nRDLwZTK3QRd7y6DHEQM40pFDV2V01XW0r9SJyyFCvdQqmZ+IPRKG3z0oc3CyyfLIezZNrQ+6GvmAcj2CZL1GAyuEPJE2Qqz2zn0uTQkfxHVtdmDYohTyHTELCJFGItWnWmvJP5CCu7bn1pqqvds41nwq0uR//H85rg1lJAEf71fTyWtIzkkeSFk9Cas+IphpCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 PH0PR11MB5903.namprd11.prod.outlook.com (2603:10b6:510:144::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.31; Mon, 25 Mar
 2024 13:39:47 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::79b7:da48:ff3b:4c78%4]) with mapi id 15.20.7409.028; Mon, 25 Mar 2024
 13:39:47 +0000
Message-ID: <9e022654-96a8-4b3a-80d3-fd3ba3a22697@intel.com>
Date: Mon, 25 Mar 2024 19:09:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix static analysis tool reported errors
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
 <0e0355fc-c10e-4e65-b193-6b5858c9da87@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <0e0355fc-c10e-4e65-b193-6b5858c9da87@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR04CA0187.apcprd04.prod.outlook.com
 (2603:1096:4:14::25) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|PH0PR11MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: cde17f99-f076-4a80-f3b4-08dc4cd1099c
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F7KvEUKWRPMIsY0RvsLSa6PQMzBez8sWEBp/RDW3DIUQWEDi6xZHP0n/ttxIRNCJuq0X5ZtndEMblL2EC4w/zaZsvK9qgtSZFGE7S6k0qEe3Lj/Ss76DacP1HIhmk4bRQcBRxYqCvfY/DWopfcpY+JA3Hf12BJS0icf5WlMTomwJ9D/wFy8Bvz6mejfqYpOi1wV0xsKUb1qFopnmUKlCN+/kmUo/hjioj+nP1pIwBZqhp1JHeEbEPPx9nN423tGr17HjKMl+2j28fhtTlap9iabZ0b5dMj0gONgu1q6+PdZdzmSaBm0dmM9+Ti3qlpqgPDOSjiFBkot6iFLC+JdEs80Ug5yxXh5LsmoR47L/fu1vRMR8clOgcxJE4oZ0MtGd9WjKq+8rl3h/81jjZdDIqlMuH8XufBw5Z2tX9+dX/D6KWhIW0do9mvfbvo/sYjp+bT/nZ2J7UJVdvbqMtDIrgPA1Ngylrmmjh5tHDPw1EBuPM3EurD6gFZ92aEJXIKbEajqFI6iwNs1xj+FHDDAe4wVDGW2pIPi65mTH7Pd/YbkwApr8CVVkheQqIfZpea1OCl/9OdM01jSbBmHzbduocPhBUP5sgYuA4zFIaCWXAXI6kVvH/hPL9gLWC7r5WEIRIvZW56bsWMT1s0XpJrqa3LKBncMclZ1y3piBfXag9I8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDhJRktVVHlTQ1g5MFNVS1VOZ3U0S1Q4VkUybWg0VFpna1ZMMXB1b28zWFRP?=
 =?utf-8?B?VmE2V2s2bnZQTDYxTmdwMzZrcGRmTlRFenVLSWRmSERNSXU2eE1JMUtBQS9H?=
 =?utf-8?B?RnhSU0NHNkFFSFVkazY4L3Z6WmZDdmo0SmtBaWtnckZwS3kxVDRkYW9ZcFJi?=
 =?utf-8?B?T1gvbFNvSXdwSC91VFB4QlZJYVRCQ1ZUeE5sdytmUWRQeFluOFQzVWtXVWRx?=
 =?utf-8?B?TGg3RjBvbkVJd2IxcDBoR3Q0QnQ4eUZ5c0FMK2JORFZDdEJqTGlSNzYvMS85?=
 =?utf-8?B?OU4wazFNZFZvcVNhOG9xYy9UMlp1UVcxNWlrZkhRNUYxWVRzdXNUNUtaMldN?=
 =?utf-8?B?cHhMWDBjZnBsQ3dHK1RBdnNYYVZ1L0VVNkw5U0tKd0NyaHJEVU5zNnZVRERv?=
 =?utf-8?B?clQ3NlpJZnRQWGg0a1VYajdVclk3eityc2VzV1pzbnBwME9CRklzSzA3Uk1P?=
 =?utf-8?B?WDlSWG5TVHZFTTFSeXUzVjFlUUd4MXM5WUNLcmM3OEdWemdxQWV6UndUZW4r?=
 =?utf-8?B?ZGRjdWtjMC9EK1NQajNkdERtMk9nTFRIU0FSSW15dGRGeXF2UXpRelFabWRE?=
 =?utf-8?B?czRMYkEyRGZ5L2toVjM2Vml1UGJGc1BpMHNsdFptU1JWT21qS1NYZW1QamF2?=
 =?utf-8?B?TC9YdXNMdTBoc1h5TXhtRk5DTHB6dDlZakJzL3dnREZ3TWpKMWpGSVFVZjRr?=
 =?utf-8?B?VDhHUy9MWUxRdDJHKzBiODQ0a1A1bXBaNXRxTkcxbEg4N2RaRTE4cVFTN2lQ?=
 =?utf-8?B?YXBKRENUTFpqb25JdzcwYTVnYmNJckE5alFCbi9tZUYxcGZuQ1V1QlFoRlll?=
 =?utf-8?B?RVNVZUlwZG1zajFad1BEZEw1V0hGNW9BakVpdTM1OWFYR0NNVU4zRjBBZUU0?=
 =?utf-8?B?T1l2Nms0THljUlpCeDA5WWoxMDJqcW80YjR0am14MlFrU202RmJIcDBINUZT?=
 =?utf-8?B?WnNZR096NjRIeEFBaFRmNEE2NGNMM1JiTEcvbGRpeXBWUlBmWWE5Ni9WWDRP?=
 =?utf-8?B?NlhDQ1Byd2NjcHFDWmxOUTYrKzZhTW1Lay82ZnljWmc3ZUdEM2lXKzVhZVV3?=
 =?utf-8?B?MTUyaXlHaVZaaTBsem4xMklQM2tLaTV0cFNubTBML01OMjdic25FREdEai9D?=
 =?utf-8?B?MzlTRzkxYzF0SzJUT1AzUnRwSkZJL2tYQzJLTEsyNmlaODJnbDZIQ2h5K1BC?=
 =?utf-8?B?cWZZMG9SOXdRdHpseHJpazFBa3M2RUZ4MXhscy9TZ0VabENxeVlwcXNqMVMv?=
 =?utf-8?B?a2gyWHdyZFZhZTBUbk95U3puQkQ1dzYzL2NpZzJoTEpPTGhQSE9wTmU5cXRk?=
 =?utf-8?B?UFZJK3FpRVR6cU1OcW51Z0MwdVFZZ29Ba1NQWFV5dTdZS09MNmc5TytpdC9x?=
 =?utf-8?B?bVpzRHBjaG9TSkFTWmQrMHJtYXFsbXBLMDdLaDZuTFE4eTZyUTlxVVBlVHFy?=
 =?utf-8?B?RmRqcFlyT3kzOG92TmtzRDhmWlFDcDJubjdBbWtneUkydXU4M2Jzd0w1K01D?=
 =?utf-8?B?Q1JoTXhSZjUzdUVORzQ3eXY3Y1NuL1FFOHZkSk01UHdpSDI5MnBqZG1wVEto?=
 =?utf-8?B?cmpLdlFrM2tGb2VKNG1scDdBQkE5Z0FKSWg2ODk5ejc4T0Z4eFY3eU5rMWNU?=
 =?utf-8?B?MUl5eFN3emkwZjJ2REpscEIzOWlaUTExQXhVbUtZc01mNHQ5bFFWUklkVVBW?=
 =?utf-8?B?U3J0QXhveXBTWmg5VE90UGdzREprWC96R09PWHg3SjNFbHVkZmoxcS8va0FT?=
 =?utf-8?B?MG1kU1EyRGZBeUZCb2cxaUZKditMakJJRHQvbE9kdFRqcTVnb084OTNWTG8r?=
 =?utf-8?B?RlhQbmlEVUptbXgzRUJQWVRWNWRQVW8zVVN6ZmVxb2g1ZUMzNmxJMVJUUFlC?=
 =?utf-8?B?akNKaE8wQUJRYndkeXlaWEtVbkk5WWc3RjFVMlZxdmRrYWpIdDdtRS9URHlI?=
 =?utf-8?B?Q1VWZUJCbmFjckVSa1VuWVAxZ3NlbGEyMjdvRDZNWm54eEN1cmdQUzI3N0sx?=
 =?utf-8?B?WWlDemkvcHdWWjFDWXBTUzVsV3JwNmZDTGM3MjhuWUFiN1NBYVFXR1FEQlBI?=
 =?utf-8?B?aDFLamRmR2JFU1N0SEZwRUp3TjFZVGZKVDRSeUVGMXcxbURaZEVTVWV6bkNr?=
 =?utf-8?Q?ZUtqkUpTtXoyfFHMHpWeKBvzi?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cde17f99-f076-4a80-f3b4-08dc4cd1099c
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2024 13:39:47.5947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H9pc8edJ8TW5qfpC7zrI8pAjAFOeorgeXAq3CxwdGWr+HhHayptPfxIy44THok2odaF1c8IZggvExR8qCOZOJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5903
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

This check is not needed, already xe_device_get_gt internally checks gt 
for NULL.

On 25-03-2024 18:59, Nilawar, Badal wrote:
>
>
> On 25-03-2024 13:35, Karthik Poosa wrote:
>> Add a NULL pointer check.
>>
>> v2: Release resources before returning error. (Riana)
>>
>> v3: Update commit message. (Badal)
>>
>> v4: Change drm_err to XE_WARN_ON. (Anshuman)
>>
>> v5: Fix XE_WARN_ON check. (Riana)
>>
>> Fixes: 09d88e3beb64 ("drm/xe/pm: Init pcode and restore vram on power 
>> lost")
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_pm.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
>> index cc650a92c2fc..f6837bd6f9a3 100644
>> --- a/drivers/gpu/drm/xe/xe_pm.c
>> +++ b/drivers/gpu/drm/xe/xe_pm.c
>> @@ -383,6 +383,11 @@ int xe_pm_runtime_resume(struct xe_device *xe)
>>        * really lost power. Detecting primary Gt power is sufficient.
>>        */
>>       gt = xe_device_get_gt(xe, 0);
>> +    if (XE_WARN_ON(!gt)) {
> Is this check really needed? xe_pm_ops will get installed when driver 
> probe is successful and driver probe successful means root tile 
> primary_gt exists.
>
> Regards,
> Badal
>> +        err = -ENXIO;
>> +        goto out;
>> +    }
>> +
>>       xe->d3cold.power_lost = xe_guc_in_reset(&gt->uc.guc);
>>         if (xe->d3cold.allowed && xe->d3cold.power_lost) {
