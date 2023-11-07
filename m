Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90613C4167B
	for <intel-xe@archiver.kernel.org>; Tue,  7 Nov 2023 23:39:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD8F10E182;
	Tue,  7 Nov 2023 23:39:37 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFA0710E182
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Nov 2023 23:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699400374; x=1730936374;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=k0ReTcKwNDFpDQlgwI1lHIjOrv0VFb24U8vXXmxqoQY=;
 b=lbcPPdQuAPDpNzqtX8fiePeXTYzrSLm8YLfBKCR0BDKufnwKcqtV6z0x
 EDAKBitAIuEjajyjTpbOdAxWhu/Rbbo5cKRlEOhKVrVqf8albnzySg/uU
 uAWt7H8BWQ4BccWpSlpmJzoT8ya7wmrzATNSwXRqKbE28wL/DxFCsqXg+
 hn69Gq9gQiERpmq714T+I3D0EeZSXbu3TKkmyh/8PHTsonGzOwp7PVNXg
 XHBgulhhxDt3YhWzrtINdg1aSQxP/cn1rBCFjOXjVsReRdibfoVANM6xD
 TgHfDLeS1YkFM20iEPDlue914ZRR1RruQ1gBjzIfyF7yG1X4ru7SBft/C Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="374688538"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="374688538"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2023 15:39:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="880007216"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; d="scan'208";a="880007216"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Nov 2023 15:39:33 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:39:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 7 Nov 2023 15:39:32 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 7 Nov 2023 15:39:32 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 7 Nov 2023 15:38:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2KwPUbRFoPXVkPu84H6Esp75hKCI+NNJHa1oHm78qm4mqARqYrdl/6kM4S1ZKyOwT3cWQdBNfI6ViUGml2FjHnokeq/T6/hYyf5NztgCdG/tDQiVsSfpbkt4oZCxLnm7y/OOgLyXvXKn5Sb3BbR+7zRWtlTVxLF0ErtlNn6wFJqXvHIcW3/cFvOzvVsio4/xY9l2eWMEpY8WCEp34BkxeqsNLDUBH1azBZZe2qEq4aXEmfCO0q77QzKsraAr0KmjM0J8RCrqJfS6HjdedYxMCYhp1Gx7n3kr2X0brWdk8xLmboHGLUWGTvhcLm56UV8ONYlFyr0GSqgCxRLmt0cDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qr6sd/YLNbIjg1InPI8pYeKMQu+KOvmFre00zCyBPhM=;
 b=ja2AUPKgwpJFzJFkA0scripMk1NlF44AeL6Utg3HvIzQpz2UnpnTxeCGkCsqnvKuD9bWPbpKIn5CmZfisclpGfR3awnlVYyuoWa7s4p3mvHKkblml/EMLR0mMqjE0LI1Ug4xXv5rJIi2ncjOt7H2i5NrRNPYkk8q23CMXVGHW8PhflQijRMgc3MoQnABxoUTf/MVAh6O2DCtWvwa99Ri+c898DNOjVNKYlzSMg4h7D5VGTtWJPtVOKkVrtDiUAlozRfv0IqnZx8dcqZr5pms+sL16BwuNRSrCBztQl3nFbkQsNlgmiP8RfkPYATKxTWYPlT4EqHOsF5HDhtsirOvLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BY5PR11MB3911.namprd11.prod.outlook.com (2603:10b6:a03:18d::29)
 by SN7PR11MB6922.namprd11.prod.outlook.com (2603:10b6:806:2a9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.25; Tue, 7 Nov
 2023 23:38:53 +0000
Received: from BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54]) by BY5PR11MB3911.namprd11.prod.outlook.com
 ([fe80::de08:93ac:5940:ec54%4]) with mapi id 15.20.6954.029; Tue, 7 Nov 2023
 23:38:53 +0000
Message-ID: <7ce3ebde-6261-4cc5-91f8-13e4691acc62@intel.com>
Date: Tue, 7 Nov 2023 15:38:51 -0800
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20231027222928.1981633-1-daniele.ceraolospurio@intel.com>
 <20231027222928.1981633-3-daniele.ceraolospurio@intel.com>
 <9cc88767-fae0-4405-b4ed-1e49bf81b654@intel.com>
 <ca614647-cdcd-4166-b8a4-d7affc66dece@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ca614647-cdcd-4166-b8a4-d7affc66dece@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0175.namprd03.prod.outlook.com
 (2603:10b6:303:8d::30) To BY5PR11MB3911.namprd11.prod.outlook.com
 (2603:10b6:a03:18d::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR11MB3911:EE_|SN7PR11MB6922:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a749b92-3d8f-4b1c-f227-08dbdfeab381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uj4MIu33nXqZ90UVCb6L9KSdDI2YhKgrVZiiqc3UMJsm4oe15WL4lH3wR0WKblzkRwZH4e0b5EDB+mhPs91wbbwPb9nW0DaFu9p+IWN0oQxMAywilKsiKoIzf0kOO37gcS69NpOPic39+J7eUl97d+qSUwZ5KQ8t5RXgMPVstv18Eo7tzjXM79fLWDWzFZg9ra/vyJjk8tLjB/hrGDTnM2US4ZHBqqdIoSo1nCmxOntJVTJPUQG+kagGKl3HRVZegSSxoHCiaffpThIuqACyiV2DRKR13TJB8KDqaKjSs8mMxMa/aHdiDoVkBOaUyg4pDobD0W+RE94SpHIePhjXMKCzghe8pZTzO4nD23vlGAuUXSk3Y0OM+xrpnVi24Hx6K1n/MFgEFCoSPYKebYpR1FFeVfjKQKDfKkBZBauotPkdntk73CVgwBYXy0fHDJzg71LJrTCD8BL/8P7qOrUQ4CQCKTy2NFdT3Y3vFlShb4YXKGUGRuelOXr98p6DANaw8fz+ya70iWL8+TUUKsh6i07/tgaw+cEAzvRlqv2u0KakA9KYUlsC8wOrHAIaPyjXw53VBmJS3iBXFuiFl/SIaXRg9enhmDBsznttWDQuSqklCFv2uHfjfXpmcMLIsD0Z8qJeqWoC83uNFaT+fXkjdojlsdQL4m5QMN7cH2DxwuKtewhZ1KqV0lvz1fCTEckP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB3911.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(396003)(39860400002)(366004)(376002)(230173577357003)(230922051799003)(230273577357003)(1800799009)(64100799003)(186009)(451199024)(31686004)(26005)(107886003)(2906002)(38100700002)(36756003)(31696002)(86362001)(82960400001)(5660300002)(83380400001)(8676002)(8936002)(2616005)(53546011)(6512007)(6506007)(478600001)(6486002)(66946007)(66556008)(41300700001)(66476007)(4326008)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?czluSDNrUm96MmYxZWx3Q0c4UW5DY0w2enF4OE1BNUoxdHc4Z1NGVlZLSUFr?=
 =?utf-8?B?MTIxY1hXT0lHektTQmVvTDRib2dMdFU3OEdhaVN4OHFlV0dFdTlIeVp0d21X?=
 =?utf-8?B?RFRIVzJha2R2bCtYL3I5Sm9wanNkNDB0TXByS0tDUUJGVDlhQk0vMHlSMEta?=
 =?utf-8?B?R3NQSWMwbzVML01IZ1N3Q2tva1JHc3diWEpWc1BwUkhDQlFDT0VrRzBJNFND?=
 =?utf-8?B?b2VUcGFmWEhYa2V3L2Y5SU82T3FrU1l0eG5yYVF0VFhUVnlucm00dVgxT3N4?=
 =?utf-8?B?enV1NnJtMTJFaTdIUXpqUTFBTGRQY3FCUGc2UzFSODFHdjMxUi9HdE5GNlh6?=
 =?utf-8?B?a2dHcVNMK1FMa3Jad1dlM3dTeSt5ZUJySDBYanVqQXdyd1M2MjZkZG1vaVJC?=
 =?utf-8?B?NFpicENiRHpvQy9reXdVUFE0M09kRFlKbXduUkFoMTArVFM4a25ROVNHTjZD?=
 =?utf-8?B?eGZnWUVrUmJJenZybi9jWEFRdE9pWS9ORTAweERLN3FXOEtuYkpyYVBubkM1?=
 =?utf-8?B?MG9jMVVzWkhaMTdlRXpXMEdxN3c2Ri9UVjlzRVo0ekVIcEFKd2RQUVN4dTZU?=
 =?utf-8?B?RlA1YnM5Y2hxKzFZZHREcnptWS9MYUwzck95VWVEKy94YUZZbEt3S2J6em51?=
 =?utf-8?B?TnlINW0zQm9XblVRcFJoRzVNMnplUTZLcHp4WmUycU53VlNRYUg4TU1hdS9a?=
 =?utf-8?B?R2RBMG4zTHZ4eGV3ZFUvbnFOT1M4WEFtdmpiV0MwcWY1YWFYcjRxbGI4UHFq?=
 =?utf-8?B?WXdPbE4wd3FIRFFCYjJiZXM1WUc2SnlQeGxibk4wWm1RV3pYT1NKaDNqUDFv?=
 =?utf-8?B?TzR2V011VUFXYWJUWldmdXNaVVNrUlFVRTlwVGl4b1NmbmFFRTNML0daVnVP?=
 =?utf-8?B?ZzRiNWQyMmkyMGlwYUtxdGcwaGNaTXRsVEtpTE1oSzNiNkJhRU5DWmw3eWZT?=
 =?utf-8?B?VnNQOFVKSnBYZjVtNlp1bXg4aW5PYnJyVGxuQWd0Y0dkVzkwWk4rVC9YK3NI?=
 =?utf-8?B?Mi9semZhclVRMVIrTU9yOWxmNUFlb0JKUXE2aVI0MzF0NFNmQXpCTmZoUkR1?=
 =?utf-8?B?NGFTM2U1b0N5aVgvWEgwZVdtdzZWQ0RCcnQxdUZjb3FBd1d3TzJMQVRNcHdv?=
 =?utf-8?B?K203N3ZzY2o5cHN1YVFZbHRsTktIQitPcnhHeXVDVHZMekNZWTNIUmJzdVJR?=
 =?utf-8?B?MEZjU2RtQkhWOVYrRWdWK3VvSm9iOTRpZFQrKzdsL2dTTGc3NCtWdjB2N25O?=
 =?utf-8?B?NU5IYndNY0Q0YVdQUGlwRlYxa0NpV0NkVXN4M1d6RDNpTi9kbXVoT1RGTG1m?=
 =?utf-8?B?U0NDc0ZodW9xOVJ1clBEampXOEdJT2RyeXl2Zzgza3pmc0xtclJQVnJpSm1T?=
 =?utf-8?B?aEtrZEJUN28rU1VVV1pmWWxWdmpuT3VhM0oweFZIcE1MRXFmN1FZNHNyN0lu?=
 =?utf-8?B?dkMvWVdlMTJhQmFMZ3o2cSt1VmpRYTdhT2h5cHVsRmhyNFlTM3lGSTkvVEZN?=
 =?utf-8?B?cDl6Y0tWQnBYVXB6SEFyUzhoTm56Y2xXUUJyQndXL3F3b1dLWC9EK0dWUmhD?=
 =?utf-8?B?YXFzb1N4SmxzSGFZZEJ1dkJQNEd6a21oNDM3YitjTjNSempHdW15L2xYMm5X?=
 =?utf-8?B?RDZEam1HV0ljZ0VsL0FjaXpQVDErWlRzbkRDR2pSN2JZdmV2S2pJdmhrYVVU?=
 =?utf-8?B?c05kMGVtcGg3VjJuVFhoa3hEYnRZOWZvcFNSYTIzQTdmcEVMR29kdjJRcGx3?=
 =?utf-8?B?NENhRkFtbmdKQjJUVkYyM1d3cjNlaFM2d250dGRsZ1piYjJodlJtYzRFUzZl?=
 =?utf-8?B?NHR0T1NBdS8wbHJRaURwVk5OczQ3QjRLYkxza3Bjbi9kNUF0Qm9JcGF5VnA4?=
 =?utf-8?B?MmJhWERzWXdQZ2lTcjBNWllGY09RWEZaYWNneHZnNUNjNzhxVzZ6eEtXQWVp?=
 =?utf-8?B?bEpPUnZ1VjRKNXBhTEpBVHVLR2xPY3M2bS9pakdPeVFrR1N3WlpWaURXbE9E?=
 =?utf-8?B?aFlsOTliWXo1NjFhZXhEeWY1ak84MmRNazdnR1I3T0V3c0ZGOExDdU1neHh3?=
 =?utf-8?B?L3ROY0l6S1Yzb082UHpuVzdYTDRTVlRjTklRY1ZOWTRlbVAwVjBwSU5lRFdN?=
 =?utf-8?B?aXhxTkZIRUROTjBvOEVKY0FWMWNTU1ppKzhFR1RBeW1yNk9MRnpuMlYrOFlS?=
 =?utf-8?B?Tnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a749b92-3d8f-4b1c-f227-08dbdfeab381
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3911.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2023 23:38:53.1038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tc1k9P9AOoZPVQuYi6H+gF8CsG5Mfy0t69FPpaow9Inj8Y+YuY0OVPOcGIZ/yK87HjDfE5XU4c26tbBOAXoNLP5CEvXCdn6lopLzkDKgqg0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6922
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

On 11/7/2023 15:24, Daniele Ceraolo Spurio wrote:
> On 11/7/2023 3:07 PM, John Harrison wrote:
>> On 10/27/2023 15:29, Daniele Ceraolo Spurio wrote:
>>> Major GuC versions greater than 70 will have the submission version in
>>> the herader irrespective of their minor version number.
>>>
>>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: John Harrison <John.C.Harrison@Intel.com>
>>> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>>> ---
>>>   drivers/gpu/drm/xe/xe_uc_fw.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> index 3032c4f148d4..91d4a2272ee7 100644
>>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>>> @@ -278,7 +278,7 @@ static void guc_read_css_info(struct xe_uc_fw 
>>> *uc_fw, struct uc_css_header *css)
>>>       xe_gt_assert(gt, uc_fw->type == XE_UC_FW_TYPE_GUC);
>>>       xe_gt_assert(gt, uc_fw->major_ver_found >= 70);
>>>   -    if (uc_fw->minor_ver_found >= 6) {
>>> +    if (uc_fw->major_ver_found > 70 || uc_fw->minor_ver_found >= 6) {
>> I strongly recommend that we update to a newer version than 70.5.x 
>> for all platforms and then just drop all this code before Xe goes 
>> live. There is no need to be carrying this legacy hack in the shiny 
>> new clean driver!
>
> How do you guarantee that the user is running at least 70.6? They 
> might have an old firmware package. We don't currently fail if the 
> minor is too low, we just throw a warning, so the driver would still 
> load but the compatibility would be left unset in that scenario. Or 
> are you suggesting to just fail the load if GuC < 70.6 ?
The only publicly supported platforms for Xe right now are LNL and 
later, aren't they? There is no GuC prior to 70.6 for LNL or later. And 
anything else is unofficial and for internal testing only.

But yeah, maybe go with >=70.6 or fail (it currently says >=70.0.0 or 
fail?) to be totally safe.

John.

>
> Daniele
>
>>
>> John.
>>
>>>           /* v70.6.0 adds CSS header support */
>>>           guc->submission_state.version.major =
>>>               FIELD_GET(CSS_SW_VERSION_UC_MAJOR,
>>
>

