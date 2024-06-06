Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D65C25B75
	for <intel-xe@archiver.kernel.org>; Thu,  6 Jun 2024 05:20:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D08F310E165;
	Thu,  6 Jun 2024 05:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hL7Ec2be";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEF810E165
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Jun 2024 05:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717651207; x=1749187207;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=rK2nqbli/MtEA/RQCxMwuq22KHobuHrupqSJkIALHvo=;
 b=hL7Ec2bewMQs5LtMWBeQzgcjzU2KtW20mtKXLDg62i7S1eUTuZPvxm8z
 GFvcBMapXcmKT9WO93ELSNlmtAze8C6ulsG8JV/UKonFJdVvgLivJePcX
 VeoDrrioiQByJdayHpOkhqKfbJyKNULHVJkqoQh6dFq7/LI1Ikrk/eiDx
 qq+5TcVKoCMIKCjyBeFXlIlmupd6h7lVfhqEiGAcyy1JRKt1Vgdn7BPbr
 mfhoKSKDX6LMhrd1tnPqAbSM04uhpQ78Q0BHsxhN+UT04SyCWOm2mdoD8
 mvu61p8kIvUWBQM0RubF6Oj6kKIY632SHpzDebj0yTCU0iRqlZW9QT4h+ g==;
X-CSE-ConnectionGUID: 6mv3dchQQw2rvk5LMyuyQw==
X-CSE-MsgGUID: F6oZwQqeTuO7m/M785Y7uQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="25702551"
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="25702551"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2024 22:20:07 -0700
X-CSE-ConnectionGUID: XLRS6NlDQESOXMOP8ivLfQ==
X-CSE-MsgGUID: AmmoD8zSQoysLdlTz3dw7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,218,1712646000"; d="scan'208";a="68997237"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Jun 2024 22:20:06 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 22:20:05 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 5 Jun 2024 22:20:05 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 5 Jun 2024 22:20:05 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 5 Jun 2024 22:20:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hn+Scj3y916dCs9u8PwMevgQjnnQlppY5yq0Moc+16UFaZRgGE+93A2rX1yFAnae23zTHH5kBnOmyJK9YnQITovpccRPjMPOFKR2n7/ApVCNww2nSygQXvXmgqNI/8FOM+6Ot/iUE9QUtwH2fvdmDbkcv5QnWPp4Y+tMj9w73KxQX1+pl64iclTRzw/vqpJwonLoHrs9bYoEe06E42unYHso3ITiZGFCNWXAmmmGvLbXJMVwtxu2lmYhs3+joOuHfL3SKg7pKHAORdIrPVwVFXHxAKveF0KKyx+zVxOzBvsUYHLUsRBsFLjLcEwp/zqUwE530KGfXwiHoAeVA2KMgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B5/mUqCHUH9JsR6QsPk6SXdsKvuS98ssLMS0K6qJBjc=;
 b=bz/6Qd6cOd8b/RoZk94wZ1ArnUQGth/ENYaxA/Fto+L2w3GetstZ0rjDBpWzId7mkMyXzCJbEZCXg4eGQfHiCdQ3AnhruRjXMfRAXUmHrm49Q4u1M5xApuhQmvuemBxvIKx8F+9J7Ch68suEsSKfVfY28xQtkX+7hwWHBbGZqidH+4Atrh/5QGbLIS0rAtyp8GjPAqt8GYsoQM/ZHtwMaFKTr64PHFWfeeslCm3uNu5MN4dyT6lORYe4XkG13+6+CAfRRVJHiJKDaAAHMD0/jOHn1BY2Jg457a4WU5y/v8TzeMFXVSkGkHgaRru1FzoVQWu9/fUIfOrXn+nlY8xl3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8675.namprd11.prod.outlook.com (2603:10b6:408:219::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Thu, 6 Jun
 2024 05:19:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7633.021; Thu, 6 Jun 2024
 05:19:58 +0000
Date: Thu, 6 Jun 2024 00:19:55 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, <intel-xe@lists.freedesktop.org>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe: Fix xe_force_wake_assert_held for enum
 XE_FORCEWAKE_ALL
Message-ID: <dhmwedkubtmtanlmm6r43yp3m4xst7mgx644b7dr2fqhrdldaw@njum7xpmedj7>
References: <20240530142533.875437-1-himal.prasad.ghimiray@intel.com>
 <40338a61-40df-4d29-9960-e0f96e9c9e8a@intel.com>
 <00281173-2316-4c6a-b69a-02b6902e08ec@intel.com>
 <b75a1731-8286-4a0f-8eed-015364c32052@intel.com>
 <20240603210336.GA2906448@mdroper-desk1.amr.corp.intel.com>
 <8cc78563-5b65-40b7-b5d4-49fed52c6b88@intel.com>
 <20240605210915.GD2906448@mdroper-desk1.amr.corp.intel.com>
 <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <722e0474-dd1c-4925-8e44-f385d3fd0e48@intel.com>
X-ClientProxiedBy: MW4PR04CA0292.namprd04.prod.outlook.com
 (2603:10b6:303:89::27) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8675:EE_
X-MS-Office365-Filtering-Correlation-Id: d0626639-710b-485a-a472-08dc85e84eb1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?R0721PwB/lF+6YousIsUEoIrvLfVHv88r8da/+rqBINbDNfsCkqIdaYzlc?=
 =?iso-8859-1?Q?N/iTB8EKJP2gCn6soaYVEXcbNm6rPcOLhOgh0cj7ozNvy4P/dzMifLsoEw?=
 =?iso-8859-1?Q?f9SwrfUM/zd7U7wHne7dOsrg06HkzU7OVBUIyGzMDHV0k/WKE96rADlExs?=
 =?iso-8859-1?Q?meCX7lYPpaKceaicKdQoyq8Qd1WKO1O9DX/kqIfds5YwU3daKvHRZXjaRE?=
 =?iso-8859-1?Q?X9rE8QAO8PTije7+4MvJUocWfmAl1WgKemjvWXG6ClgqhHRhtZ1yxbAPmF?=
 =?iso-8859-1?Q?QPJlUOFKNtrnrFA97JhK8dqTYRcsbVudd9a6LcWu8z3aju4XLU3pLBQYlU?=
 =?iso-8859-1?Q?mO1G6F16Ht5L8Fu0Cn3AJsg7U/MUEsAI40BUMUB21dQgQwRIqeoiFt+tMM?=
 =?iso-8859-1?Q?supFSC06hWF3GyGiF76hq7IaMYa3f5tTy0nUA7sUtFCK0nRshaH7+RcshY?=
 =?iso-8859-1?Q?3y+Pq0llaLJpTtq317f1ZscMf0HmKGEYLxLlWI64WyYgsmheRvdNyUcTD4?=
 =?iso-8859-1?Q?V+renrqyVDSSW9Ajz3K6+D7L6pjSGgIVzaEEHyW7UQR3/kb/vz3uRCmnkL?=
 =?iso-8859-1?Q?T0N3uAxw7fQAy38Q2tLURpvrjCZJDWv5AUDC+PLLDDvLJAcTu6ixQSixWB?=
 =?iso-8859-1?Q?RTGMR/ouU+9wUr91rYcPPhXjP1iPn6fzSJwHScZWPiX/sEAaEVBKuuWpby?=
 =?iso-8859-1?Q?KSGUetle4p7AsEOTmOqBo0Yl5Q7OTxjfwcRfm3n/22vRRhfiHzD08GJiQw?=
 =?iso-8859-1?Q?5LYVimTkbIbtHCkhu6fyoV+0oBK9lvGk/JlvQdBkCXtPJUKukjgcFn0bA/?=
 =?iso-8859-1?Q?oreMjU61nfJfBbgNSIT7EBXe1HUZYTxR/yVpMka58qw7uiofO5ys3xnvf/?=
 =?iso-8859-1?Q?qk/lJ9+Kqqb0tvC0VIS7d5iJ407n/71nWYN/cjX3NCl8tkJ41oQX2Ptk9o?=
 =?iso-8859-1?Q?KtGm1J9d5KPlti+z5dvB6nlfaXks5yDVw/vYeXbkpi1wkUdJj8RDl9qfPj?=
 =?iso-8859-1?Q?4zC+++rU3Jat/VzY5H7VnDLQJy83PCX4ndoGBbGyOfB0snRlg3atMer83j?=
 =?iso-8859-1?Q?APsq3LdeXYaJojNSiwsjnJ/3NAx049RsxmBcoO8qKUSdpbWK0khSyGVACY?=
 =?iso-8859-1?Q?V5N5wIjBrlmttLdMXYhFFwaLjWz8kuBvnaXlAIq6M8PglWNSsbk+aPk14l?=
 =?iso-8859-1?Q?up1xy8A0HosPoX9RK4wqIXB2VdbKAdY/Sjhd6WX64/87glY9IkO5/bYKRO?=
 =?iso-8859-1?Q?3PZOEeMQAQh7eitOwAcRcfjkND/AXVG0AK0VLJbsvxQpl+VbgAqux63I+K?=
 =?iso-8859-1?Q?aFAv?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?6+Lxh1NALvizwYs5hVmCn31TIZX4mwnXKSKoSPAS8VfPKLNkpQV5VBG9ZX?=
 =?iso-8859-1?Q?l7oiIkqk41d53kBeCKLRRhONRONkMnQ04H+N2DKQhYE8qMc3cRVsPoTya9?=
 =?iso-8859-1?Q?boQQtZRPg7rRJSY1SA2zCL98RkxbQY+iKeR1sQIB4BtN0XwuVnamfCKaPK?=
 =?iso-8859-1?Q?/pMymYznV7KHpEPAJSyH2wi9bpynUJSYK+u1Y8OZ9MlLFOu9qhLffiHUD5?=
 =?iso-8859-1?Q?hhNsUwbCA+XHoYeEROvKAmhxf6kytAAsAFPT000QzNB3lf7QzcoHzGV+0T?=
 =?iso-8859-1?Q?QSD3MQfasBizJbSiwf1/AKAMme/mx9yeTT652/C6fQEvKEmCmeGNJzUXiV?=
 =?iso-8859-1?Q?xx0C5nIS48QKcanzjB75DJVeT7UTN9puJxm5J6+LhmspEJdPQYXmnn8df0?=
 =?iso-8859-1?Q?mNXJ+6Fo4/688kuuAu9Jp2nLBsTdvZyzOAww23zYVJf6U3YDsfgyFgxCSl?=
 =?iso-8859-1?Q?TUTFaFsxXbFI4/NPUtIOFkQZOXtnnJVSckiWfgcqx4X6LIz0Le/bUjbe0w?=
 =?iso-8859-1?Q?cTTr0SARVILZnbEuKvSLwmglrsPH0FFZ8xvdxt4sUCPgJL04uVRbYeeBxP?=
 =?iso-8859-1?Q?ZNfq7+hQZ+qce1Xy53L+9i+FxYq5Sd36Lr7yMXHPWdaQOYclluBmj48qqt?=
 =?iso-8859-1?Q?k77hLwWx576T/8xqrUnSmLQfNkMHvDDJPIAOD/JGvdsEayHgkkVSkkv3zo?=
 =?iso-8859-1?Q?COuTtXdA9PycnqPspZhc9BOR/KnVqEHlgDswGAottKzZPHgQ6lD8+SH61W?=
 =?iso-8859-1?Q?OHMCdIKHfN2DjWgzZTHUAm8I7fQ3DBo/7jsVo8dBUTrjHdGneerLXqzLcW?=
 =?iso-8859-1?Q?yrUYmExLUr7w+hECvbQASeywQlhgjgo0uwKMXPyIerGBUUaqA0xUgiPV5V?=
 =?iso-8859-1?Q?UbE5Okk3PA1b2goW71NnaAG1V5ums3Gt1OyuQoW1SjXtrvNYTo5r+4saER?=
 =?iso-8859-1?Q?HBN7poaJy0HsIGiwl38QqODxflRhu5QIqrII8jS/Iau9Y7nkm8MitL2Ry4?=
 =?iso-8859-1?Q?t8xRusLKnMt3oggn33XpQlnRowxpq7RMUGT8iqZ6ar+m4Gu4m9Cl/k+moK?=
 =?iso-8859-1?Q?wjKYCdnEXtg/B2xa5B75AjRFb0b9alAxL8bPRNWd7/yiYwiQuD1XXBb7Zw?=
 =?iso-8859-1?Q?eWNJeLi078zTPvvGdIHQNFyYJy+VEzj8Lw32M/4CBFgbRgPrrWChfobLHC?=
 =?iso-8859-1?Q?9tc84/lnd6pMBUtzHAkgtU1N8SRwHy05R/rN6ZGcRsmlggU7Vn9lGgi4yb?=
 =?iso-8859-1?Q?jnt+ZdL/24hZ9lXM6MsOVBg8jfMFqtGZpbihobN15aaCJl9cyDY+OadDxT?=
 =?iso-8859-1?Q?hXt1fvdc+6Nz51rla4V2v2Q5U232yeqqqrqnn12I4ZpGwrmCZ4+br8QeWY?=
 =?iso-8859-1?Q?IPfqqCxrLxGIbCx4ik/QWd+JqYsrdwkt2lSydJ+NjgN+rIEIkER+T8k8j8?=
 =?iso-8859-1?Q?Zj5nf9G1JpRoGVqMvGWqtxA86ZT44LCHMSBY7RNHT0jYf2AUkuqDZ7XLpZ?=
 =?iso-8859-1?Q?5zwl7s99BFMqZpjRQiKLzx4O82ohcZ1ERlJ2aGm0YmwYeRACqw0Yb07HSq?=
 =?iso-8859-1?Q?Oc7PMSytZyzUu3I3vC0ttwBvR6zmhDG2M0obsCUO2XSuACmODLci7Xpgxi?=
 =?iso-8859-1?Q?zMA7+JymeoxTY6gHFyWj0ou4ndk7pQdqhje/QABVvfFPuARXElj0fxDw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0626639-710b-485a-a472-08dc85e84eb1
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 05:19:58.1361 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uz1lTDpnjmlW1P4DzEoGv3kQIdYpKOvg7cZHFrMJSY3eCIfmqJZJ+JtcFfJYXSa5YkAcqmzEp/TkmLW3CLDdFQ/Z1a3SD2AbePf4tdrUKSY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8675
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

On Thu, Jun 06, 2024 at 10:04:33AM GMT, Ghimiray, Himal Prasad wrote:
>
>
>On 06-06-2024 02:39, Matt Roper wrote:
>>On Tue, Jun 04, 2024 at 04:22:00PM +0530, Nilawar, Badal wrote:
>>>
>>>
>>>On 04-06-2024 02:33, Matt Roper wrote:
>>>>On Thu, May 30, 2024 at 10:09:30PM +0530, Ghimiray, Himal Prasad wrote:
>>>>>
>>>>>On 30-05-2024 20:14, Nilawar, Badal wrote:
>>>>>>
>>>>>>
>>>>>>On 30-05-2024 19:51, Nilawar, Badal wrote:
>>>>>>>
>>>>>>>
>>>>>>>On 30-05-2024 19:55, Himal Prasad Ghimiray wrote:
>>>>>>>>Make sure that the assertion condition covers the wakefulness of all
>>>>>>>>domains for XE_FORCEWAKE_ALL.
>>>>>>>>
>>>>>>>>Fixes: c73acc1eeba5 ("drm/xe: Use Xe assert macros instead of
>>>>>>>>XE_WARN_ON macro")
>>>>>>>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>>>>>>>Cc: Badal Nilawar <badal.nilawar@intel.com>
>>>>>>>>Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>>>>>>>>---
>>>>>>>>    drivers/gpu/drm/xe/xe_force_wake.h | 2 +-
>>>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>>>
>>>>>>>>diff --git a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>index 83cb157da7cc..9008928b187f 100644
>>>>>>>>--- a/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>+++ b/drivers/gpu/drm/xe/xe_force_wake.h
>>>>>>>>@@ -32,7 +32,7 @@ static inline void
>>>>>>>>    xe_force_wake_assert_held(struct xe_force_wake *fw,
>>>>>>>>                  enum xe_force_wake_domains domain)
>>>>>>>>    {
>>>>>>>>-    xe_gt_assert(fw->gt, fw->awake_domains & domain);
>>>>>>>>+    xe_gt_assert(fw->gt, (fw->awake_domains & domain) == domain);
>>>>>>>This will always assert for when domain FORCEWAKE_ALL (0xFF).
>>>>>>>Not all the platforms support all the domains.
>>>>>>>e.g. MTL GT0 support GT and RENDER domain. So for forcewake all use
>>>>>>>case only bits for GT and RENDER will be set.
>>>>>>I think to handle this correctly in struct xe_force_wake you can add new
>>>>>>enum xe_force_wake_domains supported_domains to hold bitmap of supported
>>>>>>forcewake domains. Use this bit map to check appropriate domains are
>>>>>>set.
>>>>>
>>>>>Hi Badal,
>>>>>
>>>>>Thanks for taking time to review this. Agreed the check should be based on
>>>>>supported domains.  Will look into this.
>>>>
>>>>I guess the real question here is why we'd ever be passing
>>>>XE_FORCEWAKE_ALL to xe_force_wake_assert_held().  That assertion is used
>>>>to sanity check that we're actually holding a necessary power domain
>>>>before performing some operation that relies on it.  Nothing in the
>>>>hardware should ever actually _need_ every single forcewake to be held
>>>>at once; we just tend to grab XE_FORCEWAKE_ALL in some places of the
>>>>code because it's simpler to just blindly grab everything at once (even
>>>>the ones we don't truly need) than it is to figure out the specific set
>>>>of domains that will get used.
>>>
>>>In the save/restore code path, both at the top level and in subsequent
>>>levels, xe_forcewake_get() is called with XE_FORCEWAKE_ALL, as I believe it
>>>accesses registers from different domains. In my opinion at subsequent
>>>levels we should
>>>%s/xe_forcewake_get/xe_force_wake_assert_held(XE_FORCEWAKE_ALL).
>>
>>We just grab FORCEWAKE_ALL because we're lazy and don't want to add the
>>code complexity to figure out the exact subset of power domains
>>that are actually needed (which may vary by platform).  We usually do
>>FORCEWAKE_ALL in places like device initialization or suspend/resume
>>that aren't in a hot path and are only going to take a couple
>>miliseconds total.  If multiple levels of the call stack grab forcewake
>>redundantly, that's fine; forcewake is reference counted, so the calls
>>lower in the callstack just increment the reference count and return
>>immediately, as we'd expect (assuming every get has a paired put).
>
>
>Agreed, the subsequent calls to xe_forcewake_get() and 
>xe_forcewake_put() merely increment and decrement the reference count. 
>However, if we are confident that the caller is already managing 
>xe_forcewake_get()/put() properly and the function operates 
>synchronously, would it be reasonable to acquire spinlocks solely for 
>the purpose of incrementing and decrementing the reference count?
>
>
>>
>>xe_force_wake_assert_held() is intended for places where we know we need
>>a specific forcewake domain and need to make sure the function never
>>accidentally gets called from somewhere that the domain wasn't already
>>held.  I don't think calling it with FORCEWAKE_ALL make sense since that
>>implies you don't actually know which domains were necessary; if you do
>>that it will just impair our ability to do more focused forcewake
>>acquisition in the future.
>
>I believe this is the gap: After xe_force_wake_get of FORCEWAKE_ALL, 
>the assumption is xe_force_wake_assert_held can handle the enum 
>FORCEWAKE_ALL to confirm whether all domains are awake or not. 
>However, this is broken: the function is written in a way that it 
>can't handle more than one domain at a time.
>
>For example, the caller of xe_gt_idle_disable_c6 uses force_wake_get 
>with all domains and simply relies on 
>xe_force_wake_assert_held(gt_to_fw(gt), XE_FORCEWAKE_ALL); within 

totally agree with Matt here. that call doesn't make sense and is the
one to be fixed.

>xe_gt_idle_disable_c6 to proceed with register write, without actually 
>caring for actual domain it needs.
>
>If we see no real use of xe_force_wake_assert_held with 
>XE_FORCEWAKE_ALL, I will proceed with dropping patches [2/3] and [3/3] 
>from https://lore.kernel.org/intel-xe/ZmDhQJLrleUjetIX@intel.com/T/#t 
>and will add a BUILD_BUG_ON if the user calls 
>xe_force_wake_assert_held with more than one domain.
>
>And from BSPEC, it looks like xe_force_wake_assert_held inside 
>xe_gt_idle_disable_c6 should use XE_FORCEWAKE_GT.

yep, that is the fix we need.

Lucas De Marchi

>
>
>BR
>Himal
>
>
>>
>>
>>Matt
>>
>>>
>>>Regards,
>>>Badal
>>>>
>>>>
>>>>Matt
>>>>
>>>>>
>>>>>BR
>>>>>
>>>>>Himal
>>>>>
>>>>>
>>>>>>
>>>>>>Regards,
>>>>>>Badal
>>>>>>>
>>>>>>>Regards,
>>>>>>>Badal
>>>>>>>>    }
>>>>>>>>    #endif
>>>>
>>
