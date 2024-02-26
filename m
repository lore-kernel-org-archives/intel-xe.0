Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32851C5478C
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 16:24:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FF810E472;
	Mon, 26 Feb 2024 16:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PwQGJYQi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58CE610E533
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Feb 2024 16:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708964669; x=1740500669;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Fuuk612OVcvw+2e4V8YZd4YpmN3yCxUoW+zy2ApWLsE=;
 b=PwQGJYQiwg3PApQD1bWClGZnb/1dY1Ju+35gCByCnq620AyJ5EMKH8Ur
 0hao83EVFxKRk4gWknan9kNDT/dkpm2jG0pWV85chUobl9j8pe/uHsNj8
 wmj0shN1aonAotlJdq5lA5Zd9NIvLm8V+7woVv3BVXstR5utKh6YbKksK
 ZsPPfDLnBhSZiX3zafQ89iLNztXM8jWj3DCbm6TzUxBuWCjBeIF/MDEVD
 K8BQXkje6OH5rw4dm8qCtSakd4Az74ypWVAmIrM4SdsccqX6tbeWntEY9
 qrboaHXXcoPWMaREB3b6Y41Qn238H6cmmATd6uFdXGP6g5q4eHkpGW28o A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3409930"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3409930"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2024 08:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="7254886"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Feb 2024 08:17:17 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 08:17:16 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 26 Feb 2024 08:17:15 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 26 Feb 2024 08:17:15 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 26 Feb 2024 08:17:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ETJB5OH/A+8UulRDG2i1oyMJQXu7Ibxmbo19lsZw97cNfyjTxwR03i2cP+VGLdvk/P9AakM1vxp/1YEcagg2/Nq/FDuxa9jH3avpcYgLOWtoJGRYe4cTgFT+k+0PWAr9yIX/DzxHwetk1vdnFmTC6gGzY5T5ms5gg+TOPpJ8Ywhv+pK4zzGfQgxhFOLE5HOX5YaPX450yTgBJFPKQO+2oFNDgP6VxSFQIK4bMK7RpC3wJ4FXLvo5woP8psXK2MYuiD9u7+aYKHXt6JwhWso7Lolrindh46M5qU6/5zAuJyEkV/AsgKkGFbCBw749m4IQPpKSTUSHEfCsl7/bnKdy2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y3h1pqsDcAm6eUyowISAdsIu4A8Vzf0PwWwrgfWyHtQ=;
 b=DkZbKtVmiNXmaLloId1sOtFTWY1UbnL/mRoCTvFFvjKtoLaf9PPBBEhDXQ+awlWPMJaRVgqiNYqDPDPmj4qhg9srDkHc2p8DIiHz4Yf37JZy2Jf9CiayWFcT1iglPhBPsTehzOU135SSx54NgwhqQUsi+7QoOdTg5faCkEa0zMbUkDj2vUxlN5wFptdQDdmOUY4/pIAUWUKDoHdfCoV/3zpS6AtmB5C4ixxGwlOL2TTLWwI7UFNf9BPjdcxT49dUaCO74ffeSkIvXwR8cHUB5vZMlu0AQBYxyTwDwLyaAotBphwgRnouvk8xukWIwwnlCXtCmdzsBGgOX6v/SLG3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB5440.namprd11.prod.outlook.com (2603:10b6:5:39c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Mon, 26 Feb
 2024 16:17:13 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7352:aa4b:e13e:cb01%7]) with mapi id 15.20.7339.024; Mon, 26 Feb 2024
 16:17:13 +0000
Date: Mon, 26 Feb 2024 10:17:11 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: Masahiro Yamada <masahiroy@kernel.org>, Dafna Hirschfeld
 <dhirschfeld@habana.ai>, <intel-xe@lists.freedesktop.org>,
 <ogabbay@kernel.org>, <obitton@habana.ai>
Subject: Re: [PATCH v2] drm/xe: Do not include current dir for
 generated/xe_wa_oob.h
Message-ID: <lfw7i6ch2u6tmsu5m6iqpyvuoeqrwkwfyqzb4p4k5bguptj5dj@u5nlw7fm4jjn>
References: <20240221083622.1584492-1-dhirschfeld@habana.ai>
 <87sf1fmn9l.fsf@intel.com>
 <CAK7LNASkdW6d77bfoSV36mUmZtYuUvwyMn653N1tZg3q7gM60A@mail.gmail.com>
 <875xybmdt8.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xybmdt8.fsf@intel.com>
X-ClientProxiedBy: BYAPR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::29) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB5440:EE_
X-MS-Office365-Filtering-Correlation-Id: fc2b343a-516a-4b67-f965-08dc36e6646b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uxRM3cAsZQkLZ5a0c9C52gsEXV/mh82gpo3/AVpxTseTytZ/hHP1e3p/Pf05uhwH/Sc5NIoEIZMxYDCOQGsx+48pe3ls/AOxKhhYCqU6VaLAKu7IgjzUR3LPhXbFWAp2yR45YnTsQkjRX5zr5CxOn3WTdoJ31+FbMVORwP5vqK/RhfigybhNBybf/pacheyLfNY23rrvLMomKfJ1xoSr8jhXT8XWccXSVnUNWa2iF9HZSTrXGw5KDEZSiHTgYwPDEKYHfRA03RUOVEC+GL8Eaca8R6YP3TUbwyukdPUeyPBQtbyikj9Jjs1y2NqT9HEQvUL9+lj+LslHb76Mj1t7OIMlYW14YxWT7rR0+PeeYOu3Rdm00kGHtFJQpWsDD6U4TYVbhdVos9i/5+ch2T0d1ZMU48LWIZPZ+01IgQestta2bIkavvi6W56NuVA8wlDdxDPELfFyFj26PmI9UEX3hbZGCORRnMQLvX8F50Do19mlrdFHXYSdVrDFZU5gurXRBscOEKxjLwFmGijkejzTkb9q8Ywk0ToDGNWtAo4tpX4K9QS3hBGVmso4wO9QFkY/SYSPhZ47CN/kFctTFLT4E7XOk+s5nQnbKyKBidYOVeLniy5impnxb3yz3sfzpl0h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkNtRmtmNTBsaE94RXkvR3F2blFSZTZvOEZxdWtxNnhtdWhwb1RVenBNYnV5?=
 =?utf-8?B?TUhuYmgwM21ZQzgyT0xicHhQNG5qb2JhcGV3TkNiblNxaW5zN0kvL0lDazJB?=
 =?utf-8?B?WWx2bzEzZXhwMFJVUU4vV2RNZWhKbHF6Mng2bGNjWnRBZUlYOGhUQmd6QWN6?=
 =?utf-8?B?VE5FenRubGxKUkJ2S3lGTHc0NVdvMHVFaTJRZ09haFk5a09BTjRCOFlpangz?=
 =?utf-8?B?RHlzaUx3Vnc3QWlhajh5cDkzOWdUdjd1TkVRZUdFQ1R0eDQzYUtmTlVsa1pY?=
 =?utf-8?B?WFhycmN6TlR0SHJiNWlJbHZSZ1pibmNEUHZvK3dnT0RKd1JvdDJ6Y0dwbDYv?=
 =?utf-8?B?TTQ4MlZqSCtHK0FOSmVzeWxHODY5eUM2VEkvWTVHQzZ1ejRXdFJvVWJGWFVa?=
 =?utf-8?B?UjJiZHVVeEdWa0ZObHVxeGJja1BRZHIxeThKeVdjZnBnNnhZWHUvTDV4RStR?=
 =?utf-8?B?dTRqcGFTdSt6cFMzcXV2enlVSTFSUlcvdU5TRlNBNE9oeWdlT01ZT0hMeHNF?=
 =?utf-8?B?dkJ1TkxiN3Q0MGxnVGZSNkR4dWdZbUpoYkJQekFBMXFLQXRZTTJtRDFYTTk2?=
 =?utf-8?B?MkVocDROSWVtV1pXamlBd1RZS2RiWVp0TDlTb2UrcEdiRFhlTkxJR1gwU2hr?=
 =?utf-8?B?cUZ1SEg2WTdnQ3hzVkR3R1JyL2ZFUzNDQnBiZnRFajJ2U0ZxV2orYTg3am9N?=
 =?utf-8?B?NTI4SXYvcE5QNkJhSm1jYnNIQzk4L0xrRTQ1N3VBTmZMalN6QkNrNEFCZGVK?=
 =?utf-8?B?cE1IbzhhZERTSVJpVWVkcEFlUWlVS0J6S0ZpZ2xEZ2o4dUxCQ2wxMnQvT3BU?=
 =?utf-8?B?dUhHc2pyKzlyZUhmbXZ3K1JmamZJUVRvVlgwZ1lZb202UGdHb2FEdGtLYjlT?=
 =?utf-8?B?QlFZNTZuN29ZY2s5Rmp3Ti80ZHlZUHVzS2lCRStXMkVacytuM1MrWW1oS05V?=
 =?utf-8?B?NWJjMVBjODh2ZnozQmFlWUdGeHpXekRrTDYvdG5xdnZrYTlTWC94S0tSeFRG?=
 =?utf-8?B?UHJMWGxrbzdrV3dJVmY2WjY2R2U1YUVjRmFJdFduaWJuakFwZG9aajdEeWw2?=
 =?utf-8?B?U2haendWWlBLWXNzWEdUVUhVeWxGWXdmN2hhbmp2cjhXWWlIeEZQRiswaE5C?=
 =?utf-8?B?NFRobEFXTmhhcWkrWlExWFZUT3k2ZFJCNDAvVnNreEdCZXRNQ0dlcjRWV09L?=
 =?utf-8?B?WllObldabVA4TXRidHpZUVZCeW1OcHJXM1RJZ1JjbGh6cnVFZWVxNnEzdjRX?=
 =?utf-8?B?eXRGRW1JZzJ0ZU8vVSt4S0RSdG91QkVEeWtkZ0dJdGFYMVF0c1IxTmVwMVF4?=
 =?utf-8?B?bzFUYjNFZGV2K0RoNnZ2Y2hlQXhzZTdiN3pFQ05qNXRJQnhvVndqNXNkMERF?=
 =?utf-8?B?MmMrcmM2TTdyYU5SSUpOak9mOHpMblU2TUlyVXBFTUJtc0c0bXYyazFPeVc0?=
 =?utf-8?B?Uk9MaU85VWNqS05VWnIrY245N0syTWxmaER3VDBLU29iL2xhZE9NTTRRQ3B4?=
 =?utf-8?B?cnEraEZLRWYyRUFCdytOY09ESE1LRVBGNDNUWTNWM1docTFFUUhCY1lLdS82?=
 =?utf-8?B?ZWRIaUtuQVArK0NIVVRQTm4rUW5jZWY4SmxPeVc4TTgzVkp3REU1UFp6Zk9q?=
 =?utf-8?B?eWNydDN2azhBL3EreEl2YUMxTS90ZWtEZnptUkhTSzdOazVON05pTmtvalFm?=
 =?utf-8?B?VFFydVIwcGpWNWI2YzNJZ3c3MlJCVFJSRWtRNjZ1TlVuQVJnVEVBb2ZkN0dl?=
 =?utf-8?B?QmNpRGdIUTdwZWxudVpSZmMwRWpHeGxmbHJFQ29oUnVPaWI4TXpSNDRZK21k?=
 =?utf-8?B?bkJ4VTdBZzB2Y2NUY2hHeGxTdU1aWWtlUGRtTTBOemY3eXRKYTZta01wVzYy?=
 =?utf-8?B?TVFGUFd0bmhZRmJpQzhEZUVDM0l4SGxMVk1QK2JBZFFnbFlDei9LbzliZ2sz?=
 =?utf-8?B?TG1YaVVURklMaWxvTnNlQ0xlK0VyOWRPOGwrOUNJbmt1dWxPTVRkcEUvT1hX?=
 =?utf-8?B?eUxZS3E4dGMyRFc5VWU2ZUJSeVowV2FhaWhwVlNJTEYyZjJaWTg2ZTlJV0g1?=
 =?utf-8?B?T0MzWDBWMDlLTU1uVEpJUFl4ZS9PQ1pQMWR3aFpGVXl0NHNha0VqZ3BwZFlM?=
 =?utf-8?B?MjhsdC9OWmhBL3lLOER4dlp4ZHpiUTFZb2dNTDlxeitXRTVHMGpmdE1DRkNj?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2b343a-516a-4b67-f965-08dc36e6646b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2024 16:17:13.7599 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fe/MsxUkLeNmaK62+Vw7440vo9RNhC9mng9MjcdAkR8AWyXW2eWhUjIy33snEklS546bINw8x/ZrxCM6Y8bn1PkTxxtZAe4NvwoxbPPf57k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5440
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

On Mon, Feb 26, 2024 at 05:43:15PM +0200, Jani Nikula wrote:
>On Mon, 26 Feb 2024, Masahiro Yamada <masahiroy@kernel.org> wrote:
>> On Mon, Feb 26, 2024 at 9:19 PM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>>>
>>> On Wed, 21 Feb 2024, Dafna Hirschfeld <dhirschfeld@habana.ai> wrote:
>>> > The generated file 'generated/xe_wa_oob.h' is included using:
>>> > "generated/xe_wa_oob.h"
>>> > which first look inside the source code. But the file resides
>>> > in the build directory and should therefore be included using:
>>> > <generated/xe_wa_oob.h>
>>>
>>> Is this documented anywhere?
>>>
>>> Is "generated" as a name special?
>>
>>
>> No.
>>
>>
>> It works because drivers/gpu/drm/xe/Makefile
>> has this line:
>>
>>   subdir-ccflags-y += -I$(obj) -I$(srctree)/$(src)
>>
>>
>>
>>
>> generated/xe_wa_oob.h is relative to the
>> include path -I$(obj).
>>
>>
>> Hence, #include <generated/xe_wa_oob.h> can
>> include $(obj)/generated/xe_wa_oob.h
>
>Thanks!
>
>I guess the only real difference here would be if there was a
>$(src)/generated/xe_wa_oob.h, which would be found first if double
>quotes "" were used.

which you will have if you mix an out-of-dir build with one that is not
without properly cleaning it.

I **think** that was the original problem that triggered this patch
submission, but Dafna can confirm if that was really the case.

Lucas De Marchi

>
>It's just that using angle brackets <> for something that isn't under
>the top level include hierarchy feels wrong to me.
>
>BR,
>Jani.
>
>>
>>>
>>> Cc: Masahiro.
>>>
>>>
>>> BR,
>>> Jani.
>>>
>>>
>>> >
>>> > Signed-off-by: Dafna Hirschfeld <dhirschfeld@habana.ai>
>>> > Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> >
>>> > ---
>>> > v2 changes: add newline, change patch title
>>> >
>>> >  drivers/gpu/drm/xe/xe_gsc.c            | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_guc.c            | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_migrate.c        | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_ring_ops.c       | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_vm.c             | 3 ++-
>>> >  drivers/gpu/drm/xe/xe_wa.c             | 3 ++-
>>> >  7 files changed, 14 insertions(+), 7 deletions(-)
>>> >
>>> > diff --git a/drivers/gpu/drm/xe/xe_gsc.c b/drivers/gpu/drm/xe/xe_gsc.c
>>> > index 0b90fd9ef63a..a61994292c43 100644
>>> > --- a/drivers/gpu/drm/xe/xe_gsc.c
>>> > +++ b/drivers/gpu/drm/xe/xe_gsc.c
>>> > @@ -7,8 +7,9 @@
>>> >
>>> >  #include <drm/drm_managed.h>
>>> >
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "abi/gsc_mkhi_commands_abi.h"
>>> > -#include "generated/xe_wa_oob.h"
>>> >  #include "xe_bb.h"
>>> >  #include "xe_bo.h"
>>> >  #include "xe_device.h"
>>> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> > index 868208a39829..fa217f5a386e 100644
>>> > --- a/drivers/gpu/drm/xe/xe_guc.c
>>> > +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> > @@ -7,9 +7,10 @@
>>> >
>>> >  #include <drm/drm_managed.h>
>>> >
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "abi/guc_actions_abi.h"
>>> >  #include "abi/guc_errors_abi.h"
>>> > -#include "generated/xe_wa_oob.h"
>>> >  #include "regs/xe_gt_regs.h"
>>> >  #include "regs/xe_guc_regs.h"
>>> >  #include "xe_bo.h"
>>> > diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
>>> > index 3d2438dc86ee..a66fdf2d2991 100644
>>> > --- a/drivers/gpu/drm/xe/xe_migrate.c
>>> > +++ b/drivers/gpu/drm/xe/xe_migrate.c
>>> > @@ -12,7 +12,8 @@
>>> >  #include <drm/ttm/ttm_tt.h>
>>> >  #include <drm/xe_drm.h>
>>> >
>>> > -#include "generated/xe_wa_oob.h"
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "instructions/xe_mi_commands.h"
>>> >  #include "regs/xe_gpu_commands.h"
>>> >  #include "tests/xe_test.h"
>>> > diff --git a/drivers/gpu/drm/xe/xe_ring_ops.c b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> > index d5e9621428ef..c4edffcd4a32 100644
>>> > --- a/drivers/gpu/drm/xe/xe_ring_ops.c
>>> > +++ b/drivers/gpu/drm/xe/xe_ring_ops.c
>>> > @@ -5,7 +5,8 @@
>>> >
>>> >  #include "xe_ring_ops.h"
>>> >
>>> > -#include "generated/xe_wa_oob.h"
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "instructions/xe_mi_commands.h"
>>> >  #include "regs/xe_engine_regs.h"
>>> >  #include "regs/xe_gpu_commands.h"
>>> > diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> > index 662f1e9bfc65..3107d2a12426 100644
>>> > --- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> > +++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
>>> > @@ -11,7 +11,8 @@
>>> >  #include <drm/ttm/ttm_placement.h>
>>> >  #include <drm/ttm/ttm_range_manager.h>
>>> >
>>> > -#include "generated/xe_wa_oob.h"
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "regs/xe_gt_regs.h"
>>> >  #include "regs/xe_regs.h"
>>> >  #include "xe_bo.h"
>>> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>>> > index 836a6e849cda..efe9a0d300c0 100644
>>> > --- a/drivers/gpu/drm/xe/xe_vm.c
>>> > +++ b/drivers/gpu/drm/xe/xe_vm.c
>>> > @@ -18,6 +18,8 @@
>>> >  #include <linux/mm.h>
>>> >  #include <linux/swap.h>
>>> >
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "xe_assert.h"
>>> >  #include "xe_bo.h"
>>> >  #include "xe_device.h"
>>> > @@ -34,7 +36,6 @@
>>> >  #include "xe_res_cursor.h"
>>> >  #include "xe_sync.h"
>>> >  #include "xe_trace.h"
>>> > -#include "generated/xe_wa_oob.h"
>>> >  #include "xe_wa.h"
>>> >
>>> >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
>>> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>>> > index 3299130ba10a..a0264eedd443 100644
>>> > --- a/drivers/gpu/drm/xe/xe_wa.c
>>> > +++ b/drivers/gpu/drm/xe/xe_wa.c
>>> > @@ -9,7 +9,8 @@
>>> >  #include <kunit/visibility.h>
>>> >  #include <linux/compiler_types.h>
>>> >
>>> > -#include "generated/xe_wa_oob.h"
>>> > +#include <generated/xe_wa_oob.h>
>>> > +
>>> >  #include "regs/xe_engine_regs.h"
>>> >  #include "regs/xe_gt_regs.h"
>>> >  #include "regs/xe_regs.h"
>>>
>>> --
>>> Jani Nikula, Intel
>
>-- 
>Jani Nikula, Intel
