Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FFFAC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 12 Apr 2024 15:38:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C532310F6FA;
	Fri, 12 Apr 2024 15:38:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lb8GVhA8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB86110F702
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Apr 2024 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712936297; x=1744472297;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=E9F6I5tyEvW9fxtdUrnZBtrBqueHfo+Zj0Ed2dgy5Zc=;
 b=Lb8GVhA85wNYCfoydQDulTqGVwWqjrC1RLJKvxMFmtBUyCaQGCepgEFP
 hIhBWq+t2fjNKztPybedw3VhPT9c6g4MVqhlMLi9A/Q0emM2afhSWD+Ob
 l1jLjiq95htEiu2Lpmw+hSFtKgdU3THwZgbrBiARfrlhgP7gXItV2rV41
 4IWzzhGXvqstKL+0peDe0Yvb32MjUpUpChNBRGHzmCLGnk9l649khtiKs
 AYMsaShAQw4O4BVqSyS4LlRG7hyPwZOR0faeX9dUzrTWas+axRbezdBA2
 aRZe4Wy+5AjgrfMkTljXVvuIUIc6EfcNKW04LBp774qkIVcmpxugi9nqo Q==;
X-CSE-ConnectionGUID: 27mLmSKvRKCneEoQg6X9jA==
X-CSE-MsgGUID: L09J0YcmRqSFLE6Dsv1yQg==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="19817663"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="19817663"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2024 08:38:17 -0700
X-CSE-ConnectionGUID: qbZPCJYAS4uWKSZF3ArylQ==
X-CSE-MsgGUID: q4m7pgqIRSSuEXkzSVuGnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; d="scan'208";a="21688206"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Apr 2024 08:38:18 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 12 Apr 2024 08:38:16 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Fri, 12 Apr 2024 08:38:16 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Fri, 12 Apr 2024 08:38:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSfu/bhkcQpvdmyan7nx87gn2J695WZlEgC2H8Y7SYNgKXjw0y4jZFA4GNSQbVkrEd/oQgrCVQd2MWx0RRfUCORyT57pz+4zFTBohOWwWvKwYMQfVclLcl97A5au/p4V2HnKws8xsgs0JBJht/ez7N6tUTP1EOA34AqPtJfJhehRpPrP2lpast/lwWvCaE8wiGEU9vQCXSgQZscxiT2yBNzkCs+VUgOeZR49NQXSJHcglCksCTob+M0Z7aj1rO5+v8QVfxAZjLFv/0mYqo2EDKsma4tNMVrif6Km0IklMuN8ktmK5mDOMlrJH+1DO5MSkHTT74P7YKwAornCv/J0Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPTMYd47IyHLbXcagUE+VDwBhIaIrGlc3kpmlxOZKAk=;
 b=E7lz95QiNvAfna8SBEaeoZz+Gjdz2Bm73FYSketaGmQkzE+q2Mm9/P2ovBCIodhI+djRhFhba1t1ofphJO0LlCMRmG4gypPFp18R6EkkTJ2n30aV5A95sqwaXK4QHoUhUcrN4IjKhUOU9oRxtkDsUC2gqdwLPO2BKWaRVVefIhzt+fl5JPRBOR+DhkkCC/KRg43Bg42BkCbIIzOuZ/bzZKtJbTevUCMXDCAgs3CmeC1hckjK2W8wP6vrr/A68Jkr2crWtIFwwY55ulRVFFUB0GRhlqwkLgtuy8OLlrNydrce3c109ZMYdxKuUI2HgQwlhoaxqbDS0gWNhzGYGOKF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by PH7PR11MB8572.namprd11.prod.outlook.com (2603:10b6:510:30a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Fri, 12 Apr
 2024 15:38:14 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::ff2a:1235:d1ba:4f93%3]) with mapi id 15.20.7472.025; Fri, 12 Apr 2024
 15:38:14 +0000
Message-ID: <7414208c-06e9-4136-9f25-53b717224c03@intel.com>
Date: Fri, 12 Apr 2024 21:08:08 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] drm/xe: Incase of action add failure, free_gsc_pkt
 only once
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
References: <20240412080245.1044902-1-himal.prasad.ghimiray@intel.com>
 <20240412080245.1044902-4-himal.prasad.ghimiray@intel.com>
 <4sgzyhtdho2d4ubjmbi3iuyu4qwdchycpr5vttayjlxxeu6crs@c6u4w7d5v6ha>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <4sgzyhtdho2d4ubjmbi3iuyu4qwdchycpr5vttayjlxxeu6crs@c6u4w7d5v6ha>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0046.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|PH7PR11MB8572:EE_
X-MS-Office365-Filtering-Correlation-Id: c3c1a77d-15a9-49da-cde1-08dc5b069130
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9rlO0e1DO8wqYce/Rl9PmF7DeE0JHOtfF6F6V6MkIioku4kvNv0Yieq6SaV2vDOIecv0FPox5nzhuWdLtGxpkOY729YfbR0qlNycm+8wYl3mWcW3kD6s8CBzMJVaTwnB49wT9QzNQnhsnObEUlRbx7hrTHg65zCcu4A+yyTP8dkA2TtkThLnaW/43BjqApMPGXio/UU5tUNO+LoXGsbXOZe2BkbhkAmcwYMCGugbuByZGSC7k0idLq2OcZq4ae0S3yxynxvRszqE4twpiAfmHlK0KCI5tWqhNALnIz686iXnKYbMM0kbfYHIW+JTRxexjJ0HjqoAEmlytBQZMaxZjVgQzMrca1ww0hsn81+tOPl93MK9gBUN8VjiGHaIm4OjXiUKSANdbaReP44/UhA3iz1cEZDlm+uwarnECCXbIp6Vk6DzJLX5+bPi1RvOKNg8X9jDRceVY6U/pWRfA4eEfz6mAWL478Uno4q0R3Kj0ZZjVNNrJn95RpNhDs1X140PL6wvzTwxnWQHFfZQuzTO0fn3+cekq8GueFayn0MqNISVN2KMr5wIghz+pclXoMDiSyMPeNO/YaRgFRtjcGr9JsgLNyZl2VA7mDkX+Vyfu7mUCjDzDWTDNqiSngDVVsTG7jObS+9F5A3pPpRwZxf+xJIT1UAqhXNL6EfPxM+uk0s=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SEdPZFp4NVRVNmltdXpvZ1V2aHpKaG9hYk1qRHJFVEszYVVFazFta2o4ZnZF?=
 =?utf-8?B?WlU0NkhBdVo3UndpREo3N2dsejcxSjFqb0FZQ2U0T2lIbE1hTEx0cm44SWlq?=
 =?utf-8?B?OEhDamhsamJGODVyWFFaR01KOGU5cWQvRWxxcDVqR0JmMnpEMXE5ZEQ4QXNM?=
 =?utf-8?B?eHZCMDd3YVo5MUduekpwdytma0lCQXZFREg2QzZaTDJ5MUVKZDMvNEp3eC9i?=
 =?utf-8?B?OVp1TUpnem5iQVlqamI1VEprcU5FWTRDNDJ4ZjE5UlcyZlFoS0gxODhRaHl1?=
 =?utf-8?B?bVBQeGcyU0xDNFBOYUowNGlQa3VYajVYU0hUa2w4NWcwdVBjTGpqMlRPckIw?=
 =?utf-8?B?b1V6SXMzSUVrc3dxR0pKOUQ5RFZqb3NLdFdMM3Z1a3BxeW0rTm9ubVE3dmgw?=
 =?utf-8?B?ZndZZXkrcWJGUThDRVl0czBISzVzaU5oV2gvamVLczNyYzF1aGg1REFSNFN2?=
 =?utf-8?B?b04vOGZlczMrcHZjZ3R6R1ZPWmhEQW1DcHNXQTNBV28rRGZWTUpYTENDL0Zu?=
 =?utf-8?B?cEVvU3lxcTJKc1RLN2tCNjBZZ0U4Vm9Gb1ZSM0x3b2RNMnNOUGhUSmNEdHJa?=
 =?utf-8?B?cHNXR08vVjV4N3ZncmY0RWtPWnN2Ni9xQUZCWmczYXBQekhacndMZ0M5UnBX?=
 =?utf-8?B?K251aS93bXozQ2VtZ1psaysvRWFwbjhKTEhWVS8xek9XU2k2SDRhZnM4Tmdn?=
 =?utf-8?B?alBUK1diUjlLSkp2N2o3NUNmTG1idjZkMzNYSWtkY0FXWW5RKzhZZ08reVBv?=
 =?utf-8?B?eVRhWCtnU3hva0ZLb1FHSFZZWTFoUW5oYXhNRlVRVkNSa0RZZGZ4V1dXaVFk?=
 =?utf-8?B?TkZ4c2tlQUE1bFpOOVEydnpSMEJiNlhkMTdvUERkYmNpQzhzWXRDSHczMlpU?=
 =?utf-8?B?R2Z3NlZKbmVWVk8xK2JQVmdvK2dsUkxoNTFHcHN4SmoyelJHclZ4WTZHT3ZV?=
 =?utf-8?B?cTdUT054cHVwVis3bE9kQWk5MFBlUUxzOUhob09uUTlHRUxzcXhmSFJIcjR4?=
 =?utf-8?B?SVBobUxLTnZnUVhabmo2b1B4MWc1ckN1SXpsTVNxZlNiNlNTcTRWQmwwYUty?=
 =?utf-8?B?cmZtbEplVjVNeVFERkN0d0lmOXZZM1hYRzB1VnczczVGakY3aTVFTkFsL2tW?=
 =?utf-8?B?R29pL1h6RDh4TGZoSWtPSXpXc041VGFHU2xIaC9JTW9HOXlWdElSdXJRTEhB?=
 =?utf-8?B?a2FSZk1QRzFSdTVaUlBtQWxFUDljbkdxUmgrTnhTTDU1OXNsN3RwQUgyT1hE?=
 =?utf-8?B?Y3A3Qlh1Y1JWQ1RmWWNUMUhqKzNHNlFrZEI1N09MNS9rSVgwWnNSM1luTnc1?=
 =?utf-8?B?SXlvYlNTM2NaK080REFJd1A2eGhFQitGK25RTU5uaVE1UFppQXgzcUdDb09X?=
 =?utf-8?B?WTdkR2s4MFozY2RmOENUS3JTajUyT0FBWiszNTBBTFBqSUhieUpXdHIyMFIv?=
 =?utf-8?B?QTlIdWVjbUUzaGQxNG12STA5djh4YlQ3V0NXRFdFMzFsMWVGd256c0JmZzd3?=
 =?utf-8?B?SFlJbGNCdjlVR3UxeGVOdzdoUTRxbnJKMXhsYVFrSjduY2JaT042RFplYVQx?=
 =?utf-8?B?aUVLYjJvbW13ZzdDamZDNzc2VnNDbm1vZThjeDVwbUhzTXVjQk8xbnhSb0tv?=
 =?utf-8?B?TUZxWmwxT3JPM2JpdGo4Wkh5Q1VaWFRSMzNZcDRybXhtSVY4Y0xFWjFaTEVT?=
 =?utf-8?B?bXVsLzkzQjRGZSsyU29Cb3lhelBPU1N6cEFsMFRsUUZIcHlvK09Sd1lNRVpD?=
 =?utf-8?B?dkJqc3M5Y3hzS20zczRsbUNFcytWanZGM200QjF3WElVQ1R5REU5UmhIVW9K?=
 =?utf-8?B?K0I2NE5xYnU2SndQem5NeDJjbEVWSW5TcHZmclY4UlU3SlFldDFzQndqWmFD?=
 =?utf-8?B?RlpjWGt5Y25MQzVnSEYyMkxSOG9qTCtpTGE1WlBCL3liVGJJOWs0bU8xTkRa?=
 =?utf-8?B?SkloK2JHK0h6UmNzYTM3NHpnNHJSR2VIbVNrd1RWY1NQR1dJR3ZoSHNCWVVt?=
 =?utf-8?B?d01kNnY3Vkc3NTYyMGFtSlZGNFdQWXZZQnpaM0R6KzNVMnBuZi9jalk1Q2NX?=
 =?utf-8?B?b2RWdWloRmZnM1FmbVZ6SGphbkdJTnV5alZjMVRZQTdrdkNYL0RCWjNSSmY0?=
 =?utf-8?B?MFFnYzRRU1dOQ2YveHZuQzBnR0V0QlgrTmRCbDJwcTJJSEcvSVFXdlJIYmNs?=
 =?utf-8?B?SWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c3c1a77d-15a9-49da-cde1-08dc5b069130
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2024 15:38:14.6556 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2Zpw/omKXgZ14AdlqVrQQi46awasScVLJeubomaK0BcYQC8FOVRscfsF2jhVHblot+nRwUm4U9JkND6yeowOioBqaX2G1NTHdPSRkJo1o0M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8572
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


On 12-04-2024 18:44, Lucas De Marchi wrote:
> Same comment for commit title as in previous patch. Otherwise lgtm.
>
>     Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Thanks for the review. Will fix commit in next version.
>
> Lucas De Marchi
>
> On Fri, Apr 12, 2024 at 01:32:41PM +0530, Himal Prasad Ghimiray wrote:
>> The drmm_add_action_or_reset function automatically invokes the
>> action (free_gsc_pkt) in the event of a failure; therefore, there's no
>> necessity to call it within the return check.
>>
>> Fixes: d8b1571312b7 ("drm/xe/huc: HuC authentication via GSC")
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_huc.c | 9 +--------
>> 1 file changed, 1 insertion(+), 8 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_huc.c b/drivers/gpu/drm/xe/xe_huc.c
>> index 78318d73e4cf..39a484a57585 100644
>> --- a/drivers/gpu/drm/xe/xe_huc.c
>> +++ b/drivers/gpu/drm/xe/xe_huc.c
>> @@ -53,7 +53,6 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>>     struct xe_gt *gt = huc_to_gt(huc);
>>     struct xe_device *xe = gt_to_xe(gt);
>>     struct xe_bo *bo;
>> -    int err;
>>
>>     /* we use a single object for both input and output */
>>     bo = xe_bo_create_pin_map(xe, gt_to_tile(gt), NULL,
>> @@ -66,13 +65,7 @@ static int huc_alloc_gsc_pkt(struct xe_huc *huc)
>>
>>     huc->gsc_pkt = bo;
>>
>> -    err = drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>> -    if (err) {
>> -        free_gsc_pkt(&xe->drm, huc);
>> -        return err;
>> -    }
>> -
>> -    return 0;
>> +    return drmm_add_action_or_reset(&xe->drm, free_gsc_pkt, huc);
>> }
>>
>> int xe_huc_init(struct xe_huc *huc)
>> -- 
>> 2.25.1
>>
