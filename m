Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A7C4332F
	for <intel-xe@archiver.kernel.org>; Thu,  9 Nov 2023 19:59:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448E210E8FD;
	Thu,  9 Nov 2023 19:59:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 392F110E02B
 for <intel-xe@lists.freedesktop.org>; Thu,  9 Nov 2023 19:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699559979; x=1731095979;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=nJB4ezP76bQnQIIt0zYL7azwqAVhQ+qfhdk8jCl3+NU=;
 b=aNEEbVFme24mJXEqoeW58AFhGoFRYB9VEFZVhw9Z6shcFl1CIJ/X18ba
 ECMtj00kzexTvDSI6yeMRhD+tIkWZkdeB+8UcO+MwH368WImeWKem1B0u
 2bs34yA+pgFTOPi180P2oxouSHzucHEsGotJDTUt7T3te/Ij7fNWwL7iN
 c9L6l0hUb1hLhUHQs+4aiybQhuxj8MUqczUmyzkUzkuunn+/4N/7SfEyE
 TrA/7hpFztyC339dCquFtlYCz9B2+W2OichcStdb52bPKML6ISYxIGU1W
 tTk/zoE5J13DhCIFh+PJw6MVHF9fca3m+a0TEgjyf0r+9EQN+dJC4+Hrj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="393973308"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="393973308"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 11:59:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="880711884"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; d="scan'208";a="880711884"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 Nov 2023 11:59:38 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 9 Nov 2023 11:59:38 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 9 Nov 2023 11:59:37 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 9 Nov 2023 11:59:37 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BN12i3icjYyd1nB+JsSPZM28j2xc8sOyxBsRsXyixAy3RZcesilHg+edYJM0+Lo3xmOioaVUrt3UFvWZKxlGNPdMsq9IfwOCeDycouThbi0veA3PNXZSmAr5B4RG7gibXraq1EpSZBgWVHmUbvaN2JLXFs/OXHztboohuR1VoUsdrWYd9HhZ0jWssXsO3uLzHPY7VyU5Xx/J5KdM7cuR6QlSaX4zHIl7/qQkRLOyvToHy8e9YW1aBka4jb2oRdo6tutjLb57UhITv/TpN7tX35O4QUSG+L0jAGXpEeJxr+0UHwHNlapH93e3o1WS7bXW6JIcW/az5PB8fqbFkMFstg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mgMlfZzP6TFjSKiJ4CglH1lCrtPaVqIrZjQdrzk11rk=;
 b=VeXFrtIxlU4aFEW7HdMyes8PQ3ViS4hN6YDum6WBnTnVHyyySfUgJ8OyspY82pm4zRKcTyWfq5A6QO8tddygz9tUB3ZyYMHOM8PRiMlOGIbPQYWo4zPzV9/zceY/1/1r/o4ByHpCrPncMaOWCTQjIL7ZxCVQmoL8ulo3CD3NPc2nX6Xk9yQZj9NdItgXDBU3zzNI9jsdrl9gWmMZQGLaEYFX/gsOrmfcgL/mTFmxXAy+QqLF1admLkYE8UQmJdoAufmiSaaG7j3kNP3n0VdwnNkRzvQBqAZf0mBbeJUZEyzaIsAA1jbPaKpzNeQuDZseblbELNpB+NxWtL3peq5RmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by CO1PR11MB4994.namprd11.prod.outlook.com (2603:10b6:303:91::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Thu, 9 Nov
 2023 19:59:35 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::588d:b37f:130c:9e86%6]) with mapi id 15.20.6954.028; Thu, 9 Nov 2023
 19:59:35 +0000
Message-ID: <3eb44147-71fe-47c1-af98-e57ef61a6b25@intel.com>
Date: Thu, 9 Nov 2023 11:59:34 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: John Harrison <john.c.harrison@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
 <9cc88767-fae0-4405-b4ed-1e49bf81b654@intel.com>
 <ca614647-cdcd-4166-b8a4-d7affc66dece@intel.com>
 <7ce3ebde-6261-4cc5-91f8-13e4691acc62@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <7ce3ebde-6261-4cc5-91f8-13e4691acc62@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0003.prod.exchangelabs.com (2603:10b6:a02:80::16)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|CO1PR11MB4994:EE_
X-MS-Office365-Filtering-Correlation-Id: c5024268-c281-4dc9-aea6-08dbe15e65e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2+p3rkZ671/zFx1LgrsNGGbaO2nwRt/Dhty2BvMYF9WErU0axc678FrtKL6Cdt9uyeovHftQmfK+azfhSpxNJB/zTXI03kBERDm8AuM3r5kgONtyXRMKYOjzHLgmqhBX+WzpHxxpq8RSM8y55dVWQvhyBUQ9WcDCGynseLCpbiWDams9V02WFFgb0ZmJpfsNSTnG2M7O3X4zuijsXM7gtAG+45ZSQ27xE0KguSxzJvzfYntM647XRNZJDKVtO+bRAVPKKbM6VosrymEkifgUpHJaoWHAY9qrAdLfXQcPfZ35RPPpRyKCK0Eb838cAmhmXtzzFRyAJ97iKPb/z0wfQrBUt4KYj36kPrZ69BZWA4yOejBCuyuUqzLb5TUjdXvhDdc6zOik8DnCm6R6aoDrTzBiNyLy4eY/MkHX+gRLIsQnOMsj2etbHFrlAiaICMnw/x2GkIoiLCB0LbXWFBs9RO/qtwnTqGlTUSA6kb6rrwuiEfnxSAT7t1fSQQR22HfMciQFllOsTCHwbxlU+JIJSTR+CPZTHoI0qYKDn4oFlcF+Oaf4GIbeRMhEDeuF5L9+FXvJZOr+JZhRn1r6VEC/H7RUGy0q1CX0OX2aMabrHDG0i9y2hI7HplSfwS0lIlt6bE6H7wUHFsTsYuU7gTH8rkQEesgbmoO+NmXRysH0WBqwo8S7LZ2xcsR4gIeEGbbT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(376002)(346002)(366004)(396003)(39860400002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(451199024)(64100799003)(186009)(66946007)(31686004)(478600001)(2616005)(4326008)(8936002)(26005)(82960400001)(38100700002)(86362001)(66476007)(83380400001)(6512007)(36756003)(6506007)(2906002)(8676002)(6486002)(53546011)(107886003)(5660300002)(66556008)(31696002)(316002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXAyK2JGamlkaVBoNTZtQ3ZpVlJqY0FTUjdUZWpDNFF3djNxYUZHWnZnNXk1?=
 =?utf-8?B?M0VyNmoxWXZZS2ZDYlRBM0RtNzlER3l1QzlMWVlET3lGM1htVExSZnp6dDc5?=
 =?utf-8?B?dUdhbHNqTlRHRmFLK3g1bzBhZGUyendtTEx1d1ZaZEQvYVVxMlhPTDBpdVZw?=
 =?utf-8?B?dC9PU2VQdzFmMFBJV1lTK1NlLzZuN25jclQ1NEU0T0x1V3V2ZDJIYUcrbVI2?=
 =?utf-8?B?cG9yVml1SnhEM3ZoK2FwOEwyL1FQVEw5cUtBTnEzR3ZJYXFyUEhWZmdhSzJi?=
 =?utf-8?B?WmNWN09GZmhuQlJQVkFwQVlUWFJHbmc0elQ2WVNSZWtBVlQxczV3K0F1eGdM?=
 =?utf-8?B?akpYc251V3B1dGhoZm5MQVVxR1BVMWJuTS8rbkpXNDNBZm1aUG9YSnFwY2xu?=
 =?utf-8?B?WW1GUjN6S1JPQU9Zck12UkYwUkpHQVdGQ0VFOFhZMEJsRERJdGN4M0Z3SllD?=
 =?utf-8?B?U0VyUGk0eExEa3FDbGZ3MENaWWNxak1SZFhSRjJkakN4STNuajExWnFpWktY?=
 =?utf-8?B?Q3E1MC9NL0pIYkhRa1ZRUU1ScEY1WGErdFF0RStmS3FnWjdyMHROV0I4Rkc4?=
 =?utf-8?B?bUpkSXM4VXRSVEsxcG9PdEdoMWpsTDZoOXNUazhFTUYrazFkVGRjQ05pV2p0?=
 =?utf-8?B?VUgwRVRYUzJraWF5RHdVN2lrZ0ZhREtvVGdmeDBlK2huQ29MaThKWmJ6eVFV?=
 =?utf-8?B?SVFDQVJ2cnRRVXBxYnFYbUtxdDh5L3pXQmVzNkpXMGFyaDZFV0kySTVvZzBV?=
 =?utf-8?B?MmV0TlRGb0VSM0FpQ2l4YWZOWG5OMHJtU0Z1bGJ0U1Qydk84QkVkTitoVjlx?=
 =?utf-8?B?ZnVtOGc3Q3NLUEpWdDV3NHJiOG90NzZQN3B3N00yYkhOK0dTelFuT1JaV2p6?=
 =?utf-8?B?U01CNHppUGJNODF3TDBIdWk3SEVkRXJxSS9scjVyUUdxWjM3WTFuUUhFUlBx?=
 =?utf-8?B?N2grWUtFVVQ2emQreXNjNUEzOTFpLzRUS003dTAvUFZSVmR4c2xsMEhUOVZD?=
 =?utf-8?B?WEw1eFg4MUx0MkFNVlN2VmRJRXErUHQxWndwSjlVaDdjMEdSNWIrZHZrMTJi?=
 =?utf-8?B?Nkx1bU1lVWJDUnJVb1JXVlZZVmdnUTJsUmw3aFNiYjdVNjl5UU1tUVFsTnAz?=
 =?utf-8?B?eVFMSUtoZml3a0VtQzE2Rm9aalVRcWVGM0ZkZkFRdFhTTEo4ZU5tMzJNbFI0?=
 =?utf-8?B?RnhFTUhHdlBjNEt4Q3k3QmNyME1SdmxUZmptMnkzZHY5VXRsSGZGWjRiTkEz?=
 =?utf-8?B?N3JEQjhSRGUzWEI2eUtDVndPYzVPQU13Vk4vZ242cmpCeHV5VFpkUEFNRjJC?=
 =?utf-8?B?YU1lQzBOaFdqbVhYT1pjVUozSFNhMDByeWdPZSttOUxoYWw1a0lkSTBUS2Fm?=
 =?utf-8?B?RU0wWExvS1NOMjVIc3hRQWR2ci91SWdYSVVtcnUvTEVHMnk4VU5oNXRhUWdE?=
 =?utf-8?B?RFBHMXk2VDVFN2kvQ0hQaXNiNVdSTHp4enpCWi9MNTFZcFVUQnV0c243dzBU?=
 =?utf-8?B?dDZKNkMxUGJnaDY2UlJ4L2IwODBaQlpkMC8rZkRzTmIyd0tMY0w3RDArbE4z?=
 =?utf-8?B?YXI3a1QzVzhXOU1zbVpBWUtYcjJab0lzek5USTBqYld4NHlVM1lJMSt0SGEr?=
 =?utf-8?B?czErODBkL28wNndnYzBMWVdWNElYSDF6TTRhNE9jeVRDK0FwaHlyQVgwMnRE?=
 =?utf-8?B?MHVHSDBlWHFVajQwWlNCYmJORzJhVWxaTWQ2RmNxYXdkWDhsNVZkdEd6RHFy?=
 =?utf-8?B?eTNxbmlrOHh0R2FaTnc3UURjeElxakdVeHVVRU11QnoxeEg2c3pSSTZ5UXN3?=
 =?utf-8?B?T0EvTVFYTUhYclFJVGkwK21TenJIbjhPUDBkUHk1Rnp2Tm5YcFFUWWdnelJM?=
 =?utf-8?B?T3hhdkNWRzR2RWdPb0NBYjBzN3V0Z28vRVZMM2MveGkzdFNjaVJyVzVkcjJD?=
 =?utf-8?B?QmQyUjBqOFpGcUFEcVlDSlZXUlJYbk5JbHFWeGJNa3M2bXRJajh0Slo2dTlZ?=
 =?utf-8?B?Si9nYjdIdXQvcXVNZVR1dEdFYzRHdUNmTDBBNWVCRFdGb0xwNDJMVHBUd2d5?=
 =?utf-8?B?d3F4SW9xSUxHNFNKSlhCWjR5STRrWkVtNk1qdWJOcUZSa2dpd1NiTFpHa3JQ?=
 =?utf-8?B?YjdTcVFRNXNOb2dKZDBMbmhaMWU3eTc0TnE3bzR6TzRSdHN4VGpaVnIyQlZo?=
 =?utf-8?Q?oXf1RhoqyvO0O3SXIHU2ck4=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c5024268-c281-4dc9-aea6-08dbe15e65e4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2023 19:59:35.7313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: euB7ocDi1OUADHSbAme6EjPHRabxpDN7tYEtAr6Ql608SrSkJRgB4x1zzZCXxsQal3oPM0du6sI6ypkqk/UzJDOOEHTi/2+Dlf/phkZKSAQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4994
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



On 11/7/2023 3:38 PM, John Harrison wrote:
> On 11/7/2023 15:24, Daniele Ceraolo Spurio wrote:
>> On 11/7/2023 3:07 PM, John Harrison wrote:
>>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>>> Major GuC versions greater than 70 will have the submission version in
>>>> the herader irrespective of their minor version number.
>>>>
>>>> Signed-off-by: Daniele Ceraolo Spurio 
>>>> <daniele.ceraolospurio@intel.com>
>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>>> ---
>>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> index 3032c4f148d4..91d4a2272ee7 100644
>>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>>> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw 
>>>> *uc_fw, struct uc_css_header *css)
>>>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>>       xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>>>>   -    if (uc_fw->minor_ver_found >= 6) {
>>>> +    if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
>>> I strongly recommend that we update to a newer version than 70.5.x 
>>> for all platforms and then just drop all this code before Xe goes 
>>> live. There is no need to be carrying this legacy hack in the shiny 
>>> new clean driver!
>>
>> How do you guarantee that the user is running at least 70.6? They 
>> might have an old firmware package. We don't currently fail if the 
>> minor is too low, we just throw a warning, so the driver would still 
>> load but the compatibility would be left unset in that scenario. Or 
>> are you suggesting to just fail the load if GuC < 70.6 ?
> The only publicly supported platforms for Xe right now are LNL and 
> later, aren't they? There is no GuC prior to 70.6 for LNL or later. 
> And anything else is unofficial and for internal testing only.
>
> But yeah, maybe go with >=70.6 or fail (it currently says >=70.0.0 or 
> fail?) to be totally safe.

I went to implement this, but I've realized that the newest GuC FW we 
have pushed for DG1 is 70.5.1, so forcing 70.6 would break DG1 support. 
I think the best option here would be to just pull DG1 support from Xe 
since we're not validating it, instead of pushing a newer GuC for a 
platform that's not fully supported.
TODO list has been updated, but in the meantime I'll stick with this 
patch for the GSC series.

Daniele

>
> John.
>
>>
>> Daniele
>>
>>>
>>> John.
>>>
>>>>           /* v70.6.0 adds CSS header support */
>>>>           guc->submission_state.version.major =
>>>>               FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>>
>>
>

