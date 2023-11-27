Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8015C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 20:45:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA8D410E148;
	Mon, 27 Nov 2023 20:45:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE4D910E148
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 20:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701117908; x=1732653908;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=0uOAEb+JILclH1LZZfdfzqubT9U+bS3XNPV2oXUJ+xc=;
 b=GweGD2Uix6aA8HUN+cMIWel27phm4duMIAqYMW/fnhn7UnZCdEwBFFes
 Yt/SQh2UTYboKg4lgpubaWKzZDCduqEckEkK3dOEP3mY7D1AgVyCnAqkP
 M9LpWIRVOEr0m1AF/z4UsjLhjl9IPKYO972SmzoWZBwBj63oNkD4eAzmJ
 iNWCCNUdGut2E8dYXD40pwEDqTTs7Lw2SrqotrwViZtRs3SqoEwhXnza5
 CSuffb2hCtlapPeIzno+xZs8GOeqAnF5gItlRMSau0CaseMGK4ucwtV/5
 C+JG7UCGxCrE1gyT8iDCDihM81bpDpqm++tpJ5/T60JlxCrf9LL4/jckJ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="395604601"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="395604601"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:45:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="768281237"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="768281237"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 12:45:07 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:45:07 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 12:45:06 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 12:45:06 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 12:45:06 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jRfjaNB4exToEo62Nymkjj0r0exY+6DN/OSOqvF5LxwDUWrweu60/Xxoqkk/yVsmo68BCkgEXtspcivRFsx63Fa2rt0MIY+TkBa3RvtAnwXsH3v32apBNUZ6pmfo+pq+jJWy47pkUtxfb9uLQ3/6/0Y/I7E74Z0EJFiIrVzc5oqpa2J+mSsbKxnG6G96EWrEMhM5pdDJeZOLTFf1lHOP5xAIXGJUDjhpYmYBw7BhXCmNiPLXv2lbZrXfvDXc7SjrZ2bafzlxZFKHmfCS4UAjp+YDhCDFISgT6RRF+y2k7DGpAHZs4PBjvrg/SQCs2xvRmTVWvWuZHAmEo/yqk7Et/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmOJLKikQgTk2UFhSmliF/pEeh/qLqT2L4K4J6c+1hU=;
 b=k2vi3hhWani0tizmIFv/yUFh24KNIUcYOqqnoJ7ykvYQxXxiq1HeW3yLhZ4LmnZV71Dy92rRkOh7sWh6IzDDO22ySu9Ljrzl6A+P6EGKMxMZB0KVknQA3dC/3/6x1jKSTm82NnhTkPfHzyORR6rCEVAaAgz9dUFLustnGy2RvZhX9zM54e9UNy0zqUcIlZV6+alOdylrIg8BTLsI5cuy/NCM3+86EqnHp+rWALkx98gNuIlOaXnz4xZPAzAHxZv5587NUx8ssMyhoynnoMxlj6Xye5whDZ4q3IOL0Djz35mB17t7HqHVV4MatqM1AtiMJDks9Xc3g9wzrzHCo2pAKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by SJ0PR11MB6694.namprd11.prod.outlook.com (2603:10b6:a03:44d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.27; Mon, 27 Nov
 2023 20:45:04 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::3964:7725:b677:28c6%7]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 20:45:04 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170111756376.56286.12271139830516445230@gjsousa-mobl2>
References: <20231127190332.4099519-2-matthew.d.roper@intel.com>
 <170111756376.56286.12271139830516445230@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Mon, 27 Nov 2023 17:45:00 -0300
Message-ID: <170111790033.56286.5224946588476203069@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR05CA0082.namprd05.prod.outlook.com
 (2603:10b6:a03:332::27) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|SJ0PR11MB6694:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d8de95-657d-4cdb-caae-08dbef89bbc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CK3Uhn+CuOHVR0tY07BakVH4QWlZv8wtDzuCj5wV6H6AbCZWtp+j0riU4k62ullkZr5PumUC34TsFTz0jbAFwL+bNTpnYiMRRvEMMZTnarEzRZEbctq0UsxUEsuHowEkCTCz9iF2NcdpkEvDL2QRbB4vIkjSjSh7tKyFk4ABw0JCVmGAfKDfkiT4QJTSWEGzOCK+wA3JYQ4UPT6UgOGpNZU1XCTVvIwYabIDgeA6YloOCCCPlPXhS3+93KLUCExWrlsyDFcKXJEFWiJOsWFqyOjCQr4cJGc3bSMajcVoSNxiNnFnrCKv4zPukXTizeymd1kvdI5g9VUna5Dfnxg+OoRR5MTnzQKXhkgkWs7ObXm4bJRpFKp5zGty7gcxDXsHt3KVL7/DERUzCtr7d+z+6MLetikDEcy9naTbsGX8stqtBtM2J8WTrDCQ7JfKKtGvU4oS4hr3+/HtDm/34iMF7PXCuMbc4QEeO/L+WYRDDVdJ2StOJHViTZ69laCLD0Wx5SkkIc8Ptnkc8V0mHMbAlxzolpRrwQJIt5AiB26xsjW5vpXgywM2ZlCQfVU/0OMT
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(366004)(346002)(396003)(136003)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(6666004)(8676002)(4326008)(8936002)(6512007)(9686003)(6506007)(66556008)(66946007)(66476007)(316002)(6486002)(478600001)(33716001)(38100700002)(41300700001)(4001150100001)(86362001)(107886003)(26005)(44832011)(2906002)(83380400001)(82960400001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjQxN244NkJKOXFqYTZsWWEvWEVmOTJ5bS95SjN1cVdHcGZHN1Q0Wmd0NGdU?=
 =?utf-8?B?blZIY2s2MGh1M1hHQUJXY0pjMkkyaXh1SXh3Vld3VHFGTEVvYzdsOUVzbWhy?=
 =?utf-8?B?eVpibWFPbFdEV2pCb0xhWUZWVGU5NzNpbzdqTU8vTWJIS3dQK25ia3pRNmJB?=
 =?utf-8?B?MUhGYkpoakhudGQ3STViNVBwQzRlanRCOHVNTCsxZEZnRVZ0RmEzMUl3U0VS?=
 =?utf-8?B?clNZNlhla3ZhbHZUUGthV3hpb0dYMCtDZkRLRlFSL3ZKU0FJUVEwYWJyQit2?=
 =?utf-8?B?ZWczSGZkOHpWSXFBbGhCVDdTL1UxbGtDSXBJRFp5eitjK2x1U1VaTU81WFZs?=
 =?utf-8?B?Vis4cURYcm1ubHhDVDBYTnNSM3p6R2hlSEJlWmJBS0xiczFOQVR6ZmxwMHVF?=
 =?utf-8?B?N1RyeVdVTXVmQXY5bUlVdm0xV1E2eEN4REU5NXpLamZPaEJXQU82VEpINE83?=
 =?utf-8?B?cmxXMXFheUx1VkU3NkRHUkF6eW5pQ1VZTW94aitrUkkxeHU5K3NVSTRxZzlK?=
 =?utf-8?B?cklrOWZrc045eDhlbGM4dHAyYy9nT2QyUmt5RnFFcHkrcFU5OGxEYnBPR2M2?=
 =?utf-8?B?N1cxazJtZ0RNQk9yTUlnNTRLMXp1K3ZGdGhEeW9yZ0VJRW1QRnVDK041VFZR?=
 =?utf-8?B?bEVzRFJoS2V2cTJXYzZ3WDQ0RzdiRkN6eG5xc0R0RUtrN1VtWG9NRmJla0V5?=
 =?utf-8?B?UXRZQ2plQkNmQldUYTRFOFpYYVEyUC94RW90WUl6RlVYYnBrNitlUEhwK3Vo?=
 =?utf-8?B?TWtIWW5acEtaTDQ5OWloUE9DNzN0NGExWlMyaUVtMnZycm5VVGJGOE9kLzFT?=
 =?utf-8?B?eVBpMExZaW9FekxJSWlaekNRdWJVUktMY2ZlZ2NmSkdMUWh6cTdXT2ZuZkZr?=
 =?utf-8?B?L0RWYldyY1lIamY5YVZnZnNaUjNYN1BobWVnbjQyemV2S2t0T0ZKVG9XZjIr?=
 =?utf-8?B?elR4Q2IwV2NtQkVLYUlBTGhaS2ZrbEVHejF2YjhzQ2t5NTJIVkRXZjkybUF3?=
 =?utf-8?B?M2NjcnVTMi9uN2JnVk5iNFZSak4rQ2o1cThWeUYvZjA3RzRhOGFmSTNxc1NK?=
 =?utf-8?B?Rm9xdTBrOWRpaDlrdXlxMU9pV1lQMVE2cUhlY1BTVVFLR3BQc25mak82eEsw?=
 =?utf-8?B?ZXIyci9RbXhDcjUydnBKSnVOYlQ5UGtpa0hUUnliblVGUHdzVkdPZEE3Tm1j?=
 =?utf-8?B?czc3Ull4dTczU1lwemRXMTRrTXpFRjNRN29jSXRKSFB5VzZaZjB1dmtZSUxX?=
 =?utf-8?B?djBGeS9IVGZXeDRKckZOdWFqQTZaVXRMNEhQOW1rNVBHVUJyL3VnM29wSUp2?=
 =?utf-8?B?QWhPaERid0haaElCWURySDJUNHJJQlBtTXdmVGx3SFhXQk5NeGNOaDZJcjVU?=
 =?utf-8?B?Y2YyTy9kWUJLZWxZdGNFZWxpR2dYU2xVbVpTZUtFYk5OdTkyWEZ4VVJ6Qnd4?=
 =?utf-8?B?NU9FQWJiSjFma0cyWk14Zm8yVWhtYlpIcXcvWGN2alFSQzBnYldvOHovZkxX?=
 =?utf-8?B?Q082WkZKS0sxaGJNUmZWZXZYU0JRMTRuTjlZTktGbDdhMmZZVUwzR0xGWnl4?=
 =?utf-8?B?YWxKQXBvTVAwQ3ZuaG9qTEZUeitQL00wSy9rWVR5eHpiZ25sWFVXMGZEdEdH?=
 =?utf-8?B?bVlYa2lvVlpMN1h0amlvdStLemRIUmRSVldmYU4xVzBTNGo3dUdRUllMVGNk?=
 =?utf-8?B?bTVIK0tQQlFCRjcvRWNEeXFRMkpNOVdMOEt6WUtrTWo0N1NRTmR1MVIyMEdR?=
 =?utf-8?B?ZWRGUGhOc01KbmFVNkltVzUvRjJjZ2lzMlQ3L1NJUmxKOGhnK2dPbU5pUEVJ?=
 =?utf-8?B?eXVKVXdma1ZMcG1UMUZFekFTcGNoT3E2MFErbDdpbGpyK2Z2d1Yyeld0SDRs?=
 =?utf-8?B?WlpPUnZlTStqTWZNdlUxSThETGlhYitEOGtVUGljOWNOYTdySDJMeFZzSFFF?=
 =?utf-8?B?MnJiNUdkdE1YWjZxWnhTWjZ0TTVJWlVNanZzcktCeVZ6Y1pqbEo5bVV3dmdS?=
 =?utf-8?B?K2gva3p1VjNpTk9UenVoTG1xdlBucGVMYllyQ0kvL0t3Wmx6NHhIellZa0tE?=
 =?utf-8?B?TzgwcGtFZndvNUt5VjdTdk5YZXh2dUxLK295a0J0UmdxL0JHbXBxNmdjSEJJ?=
 =?utf-8?B?ZDdYWDRuS3UySzhKN0ZEYkxMeGJGOU9LcVVyZlhqblpyNHFhWHA0Tjd3MlV0?=
 =?utf-8?B?Nnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d8de95-657d-4cdb-caae-08dbef89bbc5
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 20:45:04.4625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6T30VgXlPS5hqEPLYb43P3H7kLkIT7dAmFpepZ1sPP8pkjihQ9Whj102uMWJsU2bXwYH1Xxw9NFbL5lszVrMWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6694
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/dg2: Drop Wa_22014600077
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
Cc: matthew.d.roper@intel.com
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-11-27 17:39:23-03:00)
>Quoting Matt Roper (2023-11-27 16:03:33-03:00)
>>The workaround database has been updated to drop this workaround for all
>>DG2 variants.
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_wa.c | 21 ---------------------
>> 1 file changed, 21 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>index 81ae0232146e..e0853ab30c00 100644
>>--- a/drivers/gpu/drm/xe/xe_wa.c
>>+++ b/drivers/gpu/drm/xe/xe_wa.c
>>@@ -522,27 +522,6 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>>           XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7,
>>                              DG2_DISABLE_ROUND_ENABLE_ALLOW_FOR_SSLA))
>>         },
>>-        { XE_RTP_NAME("22014600077"),
>>-          XE_RTP_RULES(SUBPLATFORM(DG2, G11), GRAPHICS_STEP(B0, FOREVER)=
,
>>-                       ENGINE_CLASS(RENDER)),
>>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
>
>ENABLE_EU_COUNT_FOR_TDL_FLUSH gets unused after this change. With the remo=
val of

Hm, after reviewing the i915 version of this patch... Looks like we are mis=
sing
some workarounds from Xe_LPG?

--
Gustavo Sousa

>its definition,
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>
>
>>-                             /*
>>-                              * Wa_14012342262 write-only reg, so skip
>>-                              * verification
>>-                              */
>>-                             .read_mask =3D 0))
>>-        },
>>-        { XE_RTP_NAME("22014600077"),
>>-          XE_RTP_RULES(SUBPLATFORM(DG2, G10), ENGINE_CLASS(RENDER)),
>>-          XE_RTP_ACTIONS(SET(CACHE_MODE_SS,
>>-                             ENABLE_EU_COUNT_FOR_TDL_FLUSH,
>>-                             /*
>>-                              * Wa_14012342262 write-only reg, so skip
>>-                              * verification
>>-                              */
>>-                             .read_mask =3D 0))
>>-        },
>>         { XE_RTP_NAME("14015150844"),
>>           XE_RTP_RULES(PLATFORM(DG2), FUNC(xe_rtp_match_first_render_or_=
compute)),
>>           XE_RTP_ACTIONS(SET(XEHP_HDC_CHICKEN0, DIS_ATOMIC_CHAINING_TYPE=
D_WRITES,
>>--=20
>>2.41.0
>>
