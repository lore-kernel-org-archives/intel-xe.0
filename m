Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21339EED60D
	for <intel-xe@archiver.kernel.org>; Thu, 12 Sep 2024 14:47:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E187D10EBB9;
	Thu, 12 Sep 2024 14:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IMc90SZH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3466310EBB9
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Sep 2024 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726152422; x=1757688422;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=gA9ko9SEsCjr43ZQcmO0jvWGUXrzh+B668+Dw3YAOvI=;
 b=IMc90SZHM/+8Ls5okFrRTtVJ7ap1Dr6teKXTbeDUD+s+LuV+BuzaHYGu
 VS3lHn1tNmnJTTRYotV62rI8h5bI7V29s/N5q+65Gvod66iK232Gt2gXU
 OF4XD0l6obqPS+hIIGQnu6Vvb7QAAwoCpxD3ZGfig80jeZOMWfv+jAYHm
 tLCimyEnTtj7cALsev61pDn3yS1GLfSOMYmJnQ9VvmZivEHl5RCW7JViH
 UxwxrQR1920MW96OyMasPDslkSl/woS58HcbUfELa8uxaBmYQRW+JCX6E
 WLuAHi9M1Q+uDF6DGii/0nQfdLTAxAyVdRi9zCdERQxZFySdw+WNBwUeU g==;
X-CSE-ConnectionGUID: M7ZXGnKQTguiAD+4HnBCYA==
X-CSE-MsgGUID: cP08DiLPQM6uZN/3NLXljw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="24833638"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24833638"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:46:42 -0700
X-CSE-ConnectionGUID: hsy3F5nuTF6yKpT+9jH8SQ==
X-CSE-MsgGUID: xEIsyuzKQ2CcgEUCMTujZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="98553080"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 07:46:43 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:41 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:41 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 07:46:41 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 07:46:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZZyN2YP1hxHbyKWGKH8B92+kx4H7y+YY8oKwGGRAIgubupfb2Euippb99+i5JdhR8MA9nN8fpYTmQ094s9ToZb17dKE7Fkcgnm8zdQAk50ky8xk88R3ZzPWOepAF+Tl863KlvVl4jcOCt2Cs3WG7LaQ0SrhEwwOGHhWPa8sOvIQYluLhykAAJ6Q+UsjivVaGTzxYz2JAeXfnkyb9nnBoKllXO5TTeWZnIR0nTm/HNdzv4Wot4cvR1aKr4DmBKxw9Mnc4bFFfotMc7fm3mXbbHeuWLtP8rxIXePYbVpCWEIFiNssVziYUejsUlyKVWItIayPNQg1u97ugOwfg0ERZPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqiH7E3Q7yYQIetD7qz15sWPy8sPUPkJhNy9U2pWirw=;
 b=uYHofzPMhTzvlqbEYOgbrC7Rzm9ICMmsLupVIbY3thGQ1oW4gkIrMQU80mg5xlR3N3hNgWB6nW8ONGjK3gwjrH6yDL1uN/sjKPzNlv8UznVlSBvz7TswIBYWgReJhKeiDkVowkSi69RGCR8I7xo9cIKsWsgxXfX8puFzBxW2RhFjTxtqZEfyhHnJZ4yXEGvWx5NLlNA/cPvMnvscCMNJD3PCnyBK5foyXXk7kVoHyUYP4YwA27rUFhH8iZpcHYesffPGKQ15FhUU47b4lnb5+yH9f3CVqpcdNcWgNXTM1poDilVtUHixaGIIjPESOGcDeKdhOBPmaffbNa9wDveKPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB8260.namprd11.prod.outlook.com (2603:10b6:510:1c3::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Thu, 12 Sep
 2024 14:46:31 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 14:46:31 +0000
Date: Thu, 12 Sep 2024 09:46:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
CC: "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com>, "Dnyaneshwar
 Bhadane" <dnyaneshwar.bhadane@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pciid: Add new PCI id for ARL
Message-ID: <mavshqjpsgmdmcyp6pl7xqm4mw5u23vm7lx3yajplfhvjfpzng@v52ynafehpuc>
References: <20240911092657.2348978-1-dnyaneshwar.bhadane@intel.com>
 <570df84e-44b3-42ec-8ad5-313865ed585a@intel.com>
 <874j6li5z1.fsf@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <874j6li5z1.fsf@intel.com>
X-ClientProxiedBy: SJ0PR13CA0180.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::35) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB8260:EE_
X-MS-Office365-Filtering-Correlation-Id: cce88d13-60ce-4b6d-c4c1-08dcd339b0c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UBNzvEg1B1UuH7cDD9cPgDdvGYrbWQ8TaNzQaV4dFgvpg32faq3jTvdidAKg?=
 =?us-ascii?Q?a/xGwcAQ/5LJka3AbyuGbem4ZTzzKmIwd+zSNAEX5nKdygQJp2BeNlPqYz+5?=
 =?us-ascii?Q?PB6GZOSMHNnwNEfDvmMj/2rs/vU3RDfr+TFw4TxepzGON43jyH8cxpFnpWqi?=
 =?us-ascii?Q?KKNJiSWySUjyWBngDT7XnnnmJiPYpG+3WxwY6e9yXiaMtz/fEPUFtoimsthc?=
 =?us-ascii?Q?eyCGMLNcDdEgoOAAW+NfCRGokheKoVje2CZKTnVVK724dKnmO0GYugrnrjB0?=
 =?us-ascii?Q?JJNyhnxunkQCTDe573YrR/grjznPjqqYG7UBLKNCy41DU0W+XHqEFaaJEFCB?=
 =?us-ascii?Q?hnqPNQC4sqMx/TNE210pkNs+kwo8BsXKF36xZUVIgmajXUIGoIirbw9kw53b?=
 =?us-ascii?Q?0V0Z5ckud2Lqwu3uarVXOYDCdv3m8prq58hRtlQAf6TRskTuG9E3ilO0RlVs?=
 =?us-ascii?Q?vyVLUwWEWJrYNUYbfLw3VHIQ5lrZazPT908uqBYDYgBuR8k8rxt3o9ONpswl?=
 =?us-ascii?Q?wDvbhkEbSAZCVqIrDSR2o06Ehvhl/jOOXyKr1IOArkBKaokOeLZF3yE79y5u?=
 =?us-ascii?Q?2K4iE/qurPluxR/v8hws0nhtz75FxUbIESqA2U6tmF59CASRgJoXo8iX4iXs?=
 =?us-ascii?Q?nEPVrg5leepqXqbkD52mwWCiAnrzj08wSksV6rom01jtuE9lzFs/06tdcPdq?=
 =?us-ascii?Q?nGcn1SEB+91RPQxXIVBHQ1BQwzE8GjO5zyYK3CCQa/JWW7sa2+ERX1D7vqu6?=
 =?us-ascii?Q?xbx/oQeebje2lM/ZNCIyoY4yxxFadb7DgXlPLFTOsN44WMazzslMrSIXhpZx?=
 =?us-ascii?Q?uKDO6EpQy5n8OKbKkfNK0HZL7AJD+wLoEfqevoB4NkdixynF7rF7Cbu72oTi?=
 =?us-ascii?Q?xGqlcFmbV9XX7kK/3FMG6Hd1DvsCS4eyozXrH5Iae2Z+a+BKblysx7hq5Uj0?=
 =?us-ascii?Q?PXG+wK2sfFp3XDAFwlS1D9apWYZ2zVoxTSkLdRCP7Wy3c5V+gkWW3CuiWBq6?=
 =?us-ascii?Q?J3I9Sk4ruh5fJedYt9/xAXSF/lpOyYYy5N+YR2eVums8MJUlklys0mhYTyWi?=
 =?us-ascii?Q?25OCBhHwlqpQhqJfbC8yv6qq24x/Q2Fu7IBZEi97cxSyv2vNJdtc6AK7d6XE?=
 =?us-ascii?Q?sATH3ZXd0fi+i+Ps6vsc+sbObY/kx3FpBP1f1nCVNTG2ivLZprk5bZMTrE6G?=
 =?us-ascii?Q?s4Kea6zVbg3m4f3gX2xXxJu6IFSQZimVo18l/ZtGZ1d+qjijIRco7Usw5nqF?=
 =?us-ascii?Q?K277/FkzaCyLDwt6AKNsUKfolrNDZI69hB4ZuD9+3lMIC6rvGow1jovpkodM?=
 =?us-ascii?Q?b355sFMD0i7q2YQwPN15xz9GP3IGRuZoIMl+u2nOHGGdWw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8tBj3arUAiADPva+9BHUzO7l0X07zGzCLn3SjYbJOpfAnCCWRpIS78sRlS6b?=
 =?us-ascii?Q?42/CsiVwu19Rp8+qJLHaVwXgsR/6fAjKgRtmPd/NQk7ZZq/qZQeFaOR0lE/Q?=
 =?us-ascii?Q?p2hc5jDeQOHf5V8L4yYAb53NiuTWbwbQStWuQRPxrZhZU6IUqKO1mXADJO2/?=
 =?us-ascii?Q?CEG9xZeQ0AHQkZRPvbldsnevB3tfSatw8tzRRx+OxEdoL6+zsHB6o9K4z/ZK?=
 =?us-ascii?Q?tVhxbHuOpA0IcdiyGQVJMfo9xrPCazz3P7ox3QTJk67kYN8ACz912UnMu56O?=
 =?us-ascii?Q?OY/1832VFT9xvVcQFKh+MVU6E8hzaxW1lGPA0Tcypo9rJGBoy7BUCeCFHQrF?=
 =?us-ascii?Q?wri4Df1HTccfll/kBdw8G5i/Q3+0n0RkV1lzbMwxBhf1QPBqo2FhjpsbfSpL?=
 =?us-ascii?Q?2VpVQRhHK1ahq/HEAnp1laZ7iWHT/WH4hvHtXqWaurZHdIKGursy6bTRkaqF?=
 =?us-ascii?Q?S4Uf0vLB6CD9R0kYBxcJhm5B0bOCHigwYj7Gu10kTZHfRtfnECkpSId6HIME?=
 =?us-ascii?Q?IcpTq2kYKjh7JWa+KY94Q5iwI7U7p9jmcUklKqFvjJ9Re6JSOEX7eBCnywFS?=
 =?us-ascii?Q?IzDVsoMkdiVeO7erwZLu2sWP5ECezK0lveKaLrnIXZRzWmJeOYAEJXTpBuAx?=
 =?us-ascii?Q?4Lo77k1IQYRIKPu84HuQ+VtHMFC5BHeYwE7RoL6v5DI9ouEOH3DoEF/u3qV5?=
 =?us-ascii?Q?wivSmg4AczyVt0ldQMWEozMVplNopyNQmLNmPD/qpT7BkaHOQq6wC6lHLda8?=
 =?us-ascii?Q?nMifK2OZzYcUCZ2jkc6BaG7fEpch18g7CoKqimmzilbb7LMVnwxobA9CluO3?=
 =?us-ascii?Q?Uj3VBjpGQH7YjqlqtXzjBvSOYq7LEMq0f1DrgaMY9LPxZXxXB4QTCWAnkFfh?=
 =?us-ascii?Q?BltGo41jGEG1Znhn1DKeE/wHW0awY+iVFRJE7eE5FyAj903CUM0vCzUgJd9p?=
 =?us-ascii?Q?Bg+8XvEW8jtnDA96jKGQ3A9po5+wSP6ajSTx7PBUrdjspX3kHml9cNuGaz6A?=
 =?us-ascii?Q?c2UmvQooNK7tW4+cO1DMlO66XL/tjO/AYwdOfOx4rjGli9MWaLm+zLUs80Ek?=
 =?us-ascii?Q?zTC2paIjwmM02belNuthUAcY5PN2ciBeOJoM5wJFHgG0yOrBMzxlehScbEeV?=
 =?us-ascii?Q?dr6ySbd6aGXB9ZunLD7nopBahYulVLvOE+90VdB+rLD8sVRyWsACszq+bLCV?=
 =?us-ascii?Q?+4BeZ7SH3JBAWttoNK4T5ZYbDOKMAhMqZPCovtObyxMQarPkJD1GzmLlxc1K?=
 =?us-ascii?Q?XsRAmqfn6d2c7zC15PvsRNv+NSQNJn1Oxgg97hwCfQEPYR1EoGgHZbryIiqo?=
 =?us-ascii?Q?B2PRQU93F2HisHZxW0K1qhVQ86OFN+dgzI8dhkDMiZ+v/Rog6j2Ib+S+LK4f?=
 =?us-ascii?Q?xQ4u5kjIzoqCKb//+OnXP+ikzxidveqXkiZQrcFTbP6IucVIOGTKB8Nqw3Kp?=
 =?us-ascii?Q?pDl4gGrC7l9yzJhW6ei3dNzgJNhecu5eZSJYfW8r/+g6ffhI+HE2iRCfsQ45?=
 =?us-ascii?Q?875SazJovqsghaDN1W7LdpxYqLqxIjmShGLb5hShCKwtcMNWcRH5Vk3J4vlD?=
 =?us-ascii?Q?tHU8K19yJwCzzaEN4s+6d9EVq78lVrjiqmk/R6Z1QTpsH+E1+X5w8yXfQBbw?=
 =?us-ascii?Q?dQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cce88d13-60ce-4b6d-c4c1-08dcd339b0c6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 14:46:31.3649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y9JNwIh+Flh9p93ZCYU6L6Jep2rFkABgEHGAfLK3mXFF6dXZQ77mZ4n8LcR3vWugHnw0qexOXqSAAzRwMDbF7cfmA+RTjoVNQ/VgpyEQwNY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB8260
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

On Thu, Sep 12, 2024 at 12:20:02PM GMT, Jani Nikula wrote:
>On Wed, 11 Sep 2024, "Pottumuttu, Sai Teja" <sai.teja.pottumuttu@intel.com> wrote:
>> On 11-09-2024 14:56, Dnyaneshwar Bhadane wrote:
>>> Add new PCI id for ARL platform.
>>>
>>> Signed-off-by: Dnyaneshwar Bhadane<dnyaneshwar.bhadane@intel.com>
>>> ---
>>>   include/drm/intel/xe_pciids.h | 3 ++-
>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/include/drm/intel/xe_pciids.h b/include/drm/intel/xe_pciids.h
>>> index 79001afa7d27d..5758924a5b4ca 100644
>>> --- a/include/drm/intel/xe_pciids.h
>>> +++ b/include/drm/intel/xe_pciids.h
>>> @@ -181,7 +181,8 @@
>>>   	MACRO__(0x7D41, ## __VA_ARGS__),	\
>>>   	MACRO__(0x7D51, ## __VA_ARGS__),        \
>>>   	MACRO__(0x7D67, ## __VA_ARGS__),	\
>>> -	MACRO__(0x7DD1, ## __VA_ARGS__)
>>> +	MACRO__(0x7DD1, ## __VA_ARGS__),	\
>>> +	MACRO__(0xB650, ## __VA_ARGS__)
>> This should be 0xB640
>
>Lucas, Rodrigo, are we getting buy-in for having the PCI ID macros
>shared between i915 and xe yet...? ;)


I acked that series already.

Lucas De Marchi
