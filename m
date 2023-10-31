Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D9FC4332F
	for <intel-xe@archiver.kernel.org>; Tue, 31 Oct 2023 19:01:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E33F210E5B0;
	Tue, 31 Oct 2023 19:01:01 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89D10E5B0
 for <intel-xe@lists.freedesktop.org>; Tue, 31 Oct 2023 19:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698778859; x=1730314859;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=E36Mc8Q+lWKO+yEEki7eVpc9ghcGsUsa5es/69KoPeU=;
 b=EYy23hNUJbLLR2wMPAWD3Z1YOfRFzKCn4YX4J3nE1o0JetqYZ8KEr5nt
 upVqdLDKy+bIRUtVMsL1/iKIbePfFql2dDJwot2uR91ltiXmBlOEK6Y2g
 dZAbGICUIu0ox4OncfZHZO5UygDlCQXkKmxnq3dKQv/J+elbHfFK87aU7
 LD0AcFvlf/X4RHCfa31RH7l19i698hkVYIn3T1gB2sSaE/G5OV7XSN1aq
 4GMuDRJza5a1kkP39s7ZHKSL5/5N9MpHqO5h4yhHZXyl6wTVb6yIy3qGx
 fqu4luWbjuaAmPFHeV2Y+sg8KkusWdJ/Aoi3Hs/2vaNeQukn60ppt1CmY Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="1204402"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; 
   d="scan'208";a="1204402"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2023 12:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826530650"
X-IronPort-AV: E=Sophos;i="6.03,266,1694761200"; d="scan'208";a="826530650"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 31 Oct 2023 12:00:58 -0700
Received: from fmsmsx602.amr.corp.intel.com (10.18.126.82) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 12:00:57 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 12:00:57 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 12:00:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTmImBTltnwPd+GGuizycqrIC/4TXB6LQIJz38crM/9urnS0RZd6WoQfF8vyD5xMQkyHGcvIhyiOaf7qsE+GUTDI5j3MFTbNa8QaJnqTXoRU6rCYRUwdKpmfnrO97aQoSxIYjS3DClTISGnA+UuCTNo7Vrhkl28n54+45BJejyxdAwLA4XPxjClRdIvfT999uHSWcDsDaDNdfjBd/ZSAe49//qw4wCR3Ij44Mw0OlaG2KZ3UgxL7xpK7S64ba4uLlDPTIuCaY2AkeLJFi+YwO94wkX+c0ZsA4NXPzY3bFhT4QFPw2wQx9fb40wz3RGtVl3WPL5qddRxFUS16btYbLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w0YpyHZWWrVII2TIrlfOM2wp4dX77bk15jC9F89mOPo=;
 b=D1QQmElQnTpWQF+Z2dBZ0qjbC1XTUhNqiDB0CFVSIpOkWaliWnl2/ViUqDfPc/ZxeDrDP+ND37LFSL5T5GQ8dLY4KtTQFcwyzfYrtrvBpGsqhL9sEAXEByUFXtbXdXHZ4wHxVRXFBPDeZCdkzTfKqRPqOXoZtow2upZX8SkwoLOQI35y9TuykA3/LrjpzeaPn+fsugH84p9tiUE31dw2fFo81Ama2/Yloy95AToPKxgGRI0XBSLwSdVcCHdC+zlUZuh5EoJIQlN7mTS1jiResOJ+EHM3Fmy+6HSTeN7WDXuuPWWG1WFcdUyN6l7ayRGG3h6xwZ9ELAJFtDi/6HaXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by IA0PR11MB7305.namprd11.prod.outlook.com (2603:10b6:208:439::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Tue, 31 Oct
 2023 19:00:55 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::e664:6a97:c93:4e57%5]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 19:00:55 +0000
Message-ID: <448394e7-5f01-4db3-bdb9-b710544b688a@intel.com>
Date: Tue, 31 Oct 2023 12:00:54 -0700
User-Agent: Mozilla Thunderbird
To: Andrzej Hajda <andrzej.hajda@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
 <d76ff5ae-9501-4e42-9d7f-8e57129c1b97@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <d76ff5ae-9501-4e42-9d7f-8e57129c1b97@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0383.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::28) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|IA0PR11MB7305:EE_
X-MS-Office365-Filtering-Correlation-Id: 33660402-c516-48b9-dcc6-08dbda43b5d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rloKuZHMVoBtAgf2RHfWMGEgIqbskyK2vlPNCYyamd8uaecm03TxkEkD76OyRxnDuSt39eVfrmoTtkEMGm9IY2Iv8vnRp9OygRFSQuNFHR+HvXxu3WimacxEwY1qPMqRLXsOgkl8zsp5AW679XMPrv0k4DjN73Y0EPr4Lf/YmWNPnsEXACmYYHmFRt0l1Zg/RB7JliDNi8DOH7L3KiQ1fQ/dQ83w5s4i04b3Ux0kC6EHdxeCbf8jdsFiXvCf/LnsqNKNZyRrPyjHpfHR9u0Via3hwo4CZDxZDYbbf9HZWBjRG+LoItIqBB7PEeh3XXwOIxIfRjiqKmCjdL6ySqZO1UHymeYgImebPnphZEb6wQunXzYQHNSC3+2Sq7dbhFXX1XdAz9mxbubXOwPfamo5kuiyWxlP6NL/fCt3IrCbGg9iMWVjMMAU5cvj41413354z4OIXS99zjRvmTUUw3kv1XnLnHAE3CAjR9DMQHNQmDdyr/B33crpSHyKWLrkDD1QAhupN8cEm70dfwhdva3n9BwPoQCXO+QmzItKxSSScTLhBnajsJvoScGIPbeKBvzcCVGI1Bobv2NjzW6YtL8RV0VCph5Y/pJC4t7UfJvCC3cICEW7PL0vthgdb4wZfTBCTn/mpPz0lta5vPngAplQWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(396003)(366004)(346002)(39860400002)(376002)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(66946007)(2906002)(316002)(66556008)(66476007)(5660300002)(8676002)(6486002)(41300700001)(478600001)(8936002)(31686004)(53546011)(6512007)(2616005)(6506007)(26005)(83380400001)(36756003)(86362001)(82960400001)(31696002)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFd1c3N5NHAwS1kxcjRodk52RFFEODhFVUtVb291KzBGN04zK0RCT2JDbzZn?=
 =?utf-8?B?M05VTlg3OE0wWGY4dlV4NnNzbWk2YkV6RHRiQmVGaWliZSswUTAwdklFWERD?=
 =?utf-8?B?L3VZMCsyWUltRk04TjVUU21CYWVEeUdHcE54NkFxaDJPdW83ZStROXZYWFI4?=
 =?utf-8?B?U0tkM3NsZ3hOckNORXZ2T3o0VmdMV0UxbWM3UXYvdTBFR054U1RSV1djVEF6?=
 =?utf-8?B?a0NTQU5zTVQyM0xlOVZtKy95MGJQa3ZkVU5tTWNwTWxWK2wzS05VSzJKTE1q?=
 =?utf-8?B?dUdmQ0E5cStBUmxXL01zUTF1RkRJLzJMemNIdlkvOXIwLzRoWWZyb3Q3cmkw?=
 =?utf-8?B?RjRsdDVmN1REdEt5cmVRaHNRM2MvZGd4N2pHUFExYzQrU1JQaFdtSzRiTm9m?=
 =?utf-8?B?b2hwM25iZlFLQXc3SUxvY0dBOVAvcno4NlRhQ3pqMEhFQ0owWkR1SmxFNWll?=
 =?utf-8?B?T2NlejUzWWlCSFlPWE5Pa2hTRmlqOXlvL0RzMnJiQ0lrb3JFQjRiZDdZeUFI?=
 =?utf-8?B?ZXVIRGhJR3R5REQ2aUZ0b3hVclg3aFhzTE90ekh0RlJsbmU1WTZzSUhMU2xE?=
 =?utf-8?B?YjgwU2h5ZGk5bTJiU2hZcjhESFJYejc4WFpybTErWnZjQnJGd0RDek9BaCtF?=
 =?utf-8?B?VkZUNCtNVE52RFJrOHRTVC85dlVBbnphZVFuR1ZnazdBZisxY0hNbFphQy92?=
 =?utf-8?B?WjlGV0sySVA2eVhDN2hvQ1RMb1o5WWJhcmN5MEd6R3FuL0xxaGNKSk5vZUp6?=
 =?utf-8?B?TFNtQVNvcnlOTkg1SWhVdkZjcjRyTDRKdDdkYjBWQUhxaDBUcndYUUdPRWo2?=
 =?utf-8?B?blNHUUpXWENTMUtVQzBKeTdab0pzMzZVSGxsUXNRQnhNQW96VjArNTlveHUw?=
 =?utf-8?B?Z01XanB6STQ0NmtUcmhycVpiUGk1L3h0MG5ZWGRFSktYc2taQmg0SGsxVERn?=
 =?utf-8?B?WStTYUJPV3dpVytvZi9LeTdmQnk5SFhxTlBFZ1VMQjBFYWtZN2RaME1UMllE?=
 =?utf-8?B?ZTBkWDFCWGhsSDkrekVYSzVXRTFLd0pqT1B2MUExRXFTOVVQRTA3WGNDcWRp?=
 =?utf-8?B?eE16MlgrOE9XY0drRVFjaksyUWt6M3ZYaWZ3T3BXMGdDUExUbkV0WWFLTitz?=
 =?utf-8?B?KzNCVkNHTmw2OHhDeGhCcEVxb0cvTUJLT1BOYjB4UjNzKzVGbHNIcGFVaEdP?=
 =?utf-8?B?UCtqN3I1Q0pXNG5hRkZUTk1qaTBqaTNzZGw4czRXN0o3RnJWTm94aXFTWHcv?=
 =?utf-8?B?WmxsWWRySDEyMkE3QXFvTE1xVngraDJBQmZjZm9ISDVPSlN2NlVOSlN6MkE1?=
 =?utf-8?B?MkhhYzNwblU1MUZEeSsrSlk3VXNDRldOQTNsMm8rM0gxUll0ZGZ1S0JPcFVa?=
 =?utf-8?B?QXRSUXVtYmltdXVTU2dDSFpZVCtlOU02WlBWdTZtNjZFZUE0T1NGZGIzVEFH?=
 =?utf-8?B?VnJNQW1zV1pMSGdmUHptR2Z4Ni9HaFVuMTQxN2EvMTNwTm5KdCtEaTNaeERm?=
 =?utf-8?B?c2haWjZmdGtFOUp6cVVDRndDNG8xOEJERmRrMkZrbFN3TC9kQU8zL2lMRWRF?=
 =?utf-8?B?dDFOZDhOOHBEcXhpQjBFM05yZE5LakUxWEtuVEJxcHhWU1lLZkF6Wi9lWTQv?=
 =?utf-8?B?YU02NXVGdnVLcE53K0FmZHNIeWRqclBHOEZKQjh6UkN6bW1PeTJzQ2FLWWpv?=
 =?utf-8?B?a2N2ay9SMjZjeVRXeEliS0pzajRwV3VvM1M0VjRaQTZaTVRFOVBYbGJNamxh?=
 =?utf-8?B?Zi84NGpzd3N2UStVYmZJWjhQOW0wb3hLT1JIN2gzNGREcXdFRkxnM00yQzh0?=
 =?utf-8?B?dnVIaGlRemE5cUpSUVpjT0IvS3dCVXBWdkYyM3JRMVFLenhhWUFEdXlCWndW?=
 =?utf-8?B?aDRIOTBDWFhzMjB5b3YwTVR0cjdzWk83QXVGRi9TdGIxcERGaDZkYXJoRGtx?=
 =?utf-8?B?UHFJRU1CRTVRSml4UGpXVWpQbGJ0UUx5TlRIY2ZiY3d5TUR4Wk95R0d2RzZM?=
 =?utf-8?B?ak04Q1V1T250WEkwby9NTG1NVlRnZHg1RjZOTXdKZjlKL2xXRkxrSGN0MFg4?=
 =?utf-8?B?MW4zaFVsaVdkWFY4d2ZEMktQZmlibjhMNDF4THFDbCtxREJCbE93eTduU2Fk?=
 =?utf-8?B?UEVZNmpJWU1Td2xxRUg1VWRSVFY3NW5NOTVHTVFhSkYwZjVpQ1NBUWxWMmNZ?=
 =?utf-8?Q?WCotNp0fkql76C3uxgazDH0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33660402-c516-48b9-dcc6-08dbda43b5d1
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 19:00:55.3053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y+1OrrimhOYTlusboSPdegmO5/+vkJ4bQGiHmttd+LDtxJ9GV6GhcHL3rozGq/OOSwXDlzV2aK7FlrSogYWMxlSdstUnBJ4nO0G5IUmYj5o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7305
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 02/12] fixup! drm/xe/guc: Report submission
 version of GuC firmware
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



On 10/31/2023 7:09 AM, Andrzej Hajda wrote:
> On 28.10.2023 00:29, Daniele Ceraolo Spurio wrote:
>> Major GuC versions greater than 70 will have the submission version in
>> the herader irrespective of their minor version number.
>
> header I guess.
>
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: John Harrison <John.C.Harrison@Intel.com>
>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 3032c4f148d4..91d4a2272ee7 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw 
>> *uc_fw, struct uc_css_header *css)
>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>       xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>>   -    if (uc_fw->minor_ver_found >= 6) {
>> +    if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
>
> Shouldn't be major > 70 || (major == 70 && minor >=6) ?

In Xe we don't support any GuC version below 70 (there is an assert 
above to enforce that), so in the second part of the OR we're guaranteed 
that major == 70 without having to check for it.

> Anyway working with such representation of version looks quite painful :)

Unfortunately the FWs don't guarantee that their version can fit in a 
u32 for easier comparisons :/

Daniele

>
> Regards
> Andrzej
>
>
>>           /* v70.6.0 adds CSS header support */
>>           guc->submission_state.version.major =
>>               FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>

