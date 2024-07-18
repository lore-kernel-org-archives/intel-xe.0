Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57517C3DA61
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jul 2024 22:32:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25F2B10E214;
	Thu, 18 Jul 2024 22:32:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ak6K0nlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA78210E214
 for <intel-xe@lists.freedesktop.org>; Thu, 18 Jul 2024 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721341976; x=1752877976;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=8SIQ4PdZNYQf1p5ByU9tVu8jfMsmt5Q6vKN4ZmnyzJw=;
 b=ak6K0nlWCEpn8/+vLAY0YT05XmlSMWbbzYEVHbjh6Iq6FbWp9wcVw9zD
 x1vU3PRwVutB0X/D/PGP+5ORaKf67tPD4SDHMXjFdmouvNhFCKJjBB8bm
 8Q34VM0AzOqtH2hFT3ZSjdbKVhXKe2ogNGYzJ5KSh7lPKk6xElCJRF8wr
 hsPE23aM/B7D/ygJea2GrVGaenZTel8V8hvDekalh04oV5zAER9Yvm4Lf
 BD4KiV0oK2Lddk0vfWheBY9+LAU7h5t2rNcRs7iArZsVCwg9F3QZy1Lb0
 bP8/0CQH6BjfLEKLO8iUuyYaU3+xlrbF6lkbYPlWuVnTriyB/AXCoKKcf g==;
X-CSE-ConnectionGUID: my48gTkATMi37v6ffq/c4A==
X-CSE-MsgGUID: fwETGsu1Spy62kk0Yyb9ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="36376769"
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; d="scan'208";a="36376769"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 15:32:56 -0700
X-CSE-ConnectionGUID: sh07zjj/SrKv1QQi2KapqQ==
X-CSE-MsgGUID: c1dIHNEcRQOXkVBLL6UWng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,219,1716274800"; d="scan'208";a="50635572"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 15:32:55 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 15:32:54 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 15:32:54 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 15:32:54 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 15:32:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tR2+RHLDi9r77g49klWX4ttYrX/YXuaKdEM/FC43uQfGfUfARpBTeAfgGGk5L4/6oNh457T6WyLspJ7A0QDUQ2BZ2SoU1VdjU1i+3dvmidwTeD8IDGw/E0KGgbVNLPK0Eq/fRdPD8xn1lhtx72dp0SYoCpKnIr5ngEbpBJveX3LNjoaDpga7Cq6YPg3GsbLNdOlJQ+PGsw7O21xQwX61zYwKbeNf19cFZJYQXlyLTHn5nNhJo/eF6Uck9qPoljmAs+2hYkdUjd6jPey0ySQoLwaWnWtBIiHrElK+ImcEjyWytH4ct6S3yczdgM0yxUOfhfTTv/5E+GPfFQmsl4h1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDFUjUXPR4RudVBuHGLxQQ4SM6wNjN/uY7Q3ppb0DYY=;
 b=lwrwB3eWlwNMzvcs2mehLtBAnB8ZQV8SgnTSFsm9kzlUDwon2s+07RteYAMuKLVEzTNdZbqoMY0n07uGUkx03DY7iCB+jZhzXAOxngJ6nmUvm2yWdB44mKyfV+Dhz8FUjeyg2MhQr3ClHonOO0kESocYIjcO3IJFlE+hRo0/bEHAgvmW9h48eGxn9sU4gXLYuhwUcDSWMiswVKHkF/O8+FhnatJ4x/lBDdm6n5aTKKWPdSRjXHTmxHeoG4DgmWrfmHLB3uSB7IZRGUu2zhCM3wIeLO6ZkrU042H3GeGHER2Bj//6ewHto4eTvC8rXaKcNyi1Y4TKxKCw7q8uc5BAMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SA0PR11MB4717.namprd11.prod.outlook.com (2603:10b6:806:9f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Thu, 18 Jul
 2024 22:32:52 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.017; Thu, 18 Jul 2024
 22:32:52 +0000
Date: Thu, 18 Jul 2024 17:32:47 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Dixit, Ashutosh"
 <ashutosh.dixit@intel.com>, "Yang, Fei" <fei.yang@intel.com>, "Roper, Matthew
 D" <matthew.d.roper@intel.com>, Mateusz Jablonski
 <mateusz.jablonski@intel.com>, Wenbin Lu <wenbin.lu@intel.com>, Effie Yu
 <effie.yu@intel.com>
Subject: Re: [PATCH v2] drm/xe/uapi: Expose SIMD16 EU mask in topology query
Message-ID: <zin6leryq7xgs5vmlfmubo43g5iirhuohvxemxc4liukjufp4w@mjquccbaogwr>
References: <20240710220446.2169797-1-lucas.demarchi@intel.com>
 <ZpAaK5OjjziS3S88@intel.com>
 <iuknmfhu2anc6f7sqfalijhaws6mmx5djfu3vhv5j4frhnxin7@2jqs23zqm5kn>
 <oidc3dwrlj4rlm4yczudf4uqy442a77o35bvr2zai7fnxnfhl7@7jjaergakoxn>
 <ddb6a30acade05a9e1a95c934d4201d68a89a990.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <ddb6a30acade05a9e1a95c934d4201d68a89a990.camel@intel.com>
X-ClientProxiedBy: MW2PR16CA0031.namprd16.prod.outlook.com (2603:10b6:907::44)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SA0PR11MB4717:EE_
X-MS-Office365-Filtering-Correlation-Id: 70f556b4-9e6f-4f15-31c9-08dca7798f72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|27256017;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rPyVBRWrseKPfzgyRDc4NX00p+Dm6swl4hAB10Lmd0K+I9Q0MlqCwtDDer7a?=
 =?us-ascii?Q?Uyp99ahpkDF9D80bdEu+te4YWqSHq5M7JS5fbkXSYtCO5uyWJv09HkdDKSFr?=
 =?us-ascii?Q?jmwK/5NdtRluB57xiNoL6UzhZMWrenBCbWtOYyERbTajTGc7TQ7HtgaDLMOG?=
 =?us-ascii?Q?tHqTfGOnbWu5F1LsM4Y0Yma5+sDy95gZaYif06SUz8crvUKeYyrBZJzpCoLJ?=
 =?us-ascii?Q?jgoZIJY7KYu1A+TEDaZqiEeQrcNoYC+i/MG6Jt2tHpsdoNayHCiVSZUhaWQ+?=
 =?us-ascii?Q?n5CRc2n1ga5HdBvdN2PoRPhR5NWmfhRrgKuXPOTb2/ThPkC8hO0xAHqnBZwu?=
 =?us-ascii?Q?1VvVjxmLYSVa5hEEKqZXqLb4qrvxs/QTDAiVEQLGgtYQm8PPEZuxXrHcDNRk?=
 =?us-ascii?Q?KAnwNB7P3+QssN9jTD/zrl+tDrRyofKH0ZrERW52G/HFaQiF1tcJE5upvf0L?=
 =?us-ascii?Q?/5g93I8MXvU0bsLXPslnLKIhPnWem2JjpPYQSBdRr1zJPhXasFLu9ogL2WnF?=
 =?us-ascii?Q?oZMRa1wMgKuvX7louKStxJfeEfw/QuUxPzPKDaxonEaKu/BadINAVVViknHf?=
 =?us-ascii?Q?I42t+mSFARiWBoHY6bHp3mlZ3E5VhK5Lrd/2GGIneDJpt+G8v59KBpvES82Q?=
 =?us-ascii?Q?UJjrNaNqx++sb/DaALBoel+n8qGLijdAbYSp0S5dA5ZEiMDxGTTmgLU1/Qs2?=
 =?us-ascii?Q?cZbfs5il4vYoym6q4l3AMM3JKArZum+KMY9SPJahnq5HDvtDI0spUCXA69X7?=
 =?us-ascii?Q?xbLBNzz0Nif5Z2Ay8PzKafhtfMnjNAdHToCU74aIM+5ZF2K6Mv4M2hJsTLA8?=
 =?us-ascii?Q?13LR5ryX12geh/mqSAKVqCQ23ebtjiyvA82gAZCsdB7CUzEEmDfiF0RSaKiu?=
 =?us-ascii?Q?NikyrSfDsJBaqOY7xNi9f2ty10YLnbO6Ot3tCyCxPJl8xRlHiyTl3Csz9bcS?=
 =?us-ascii?Q?ZoEmiiW2AVTS5SXEIeXbPeZG45e0WQ7i/Y4koN0EdoC+9jm4lkuoPKLLhPOg?=
 =?us-ascii?Q?i4yd25kYSotw1FX89xCE3VFNwEhQ+Ev0UnmaPVElKgsseLL0njlBUrBhwBbi?=
 =?us-ascii?Q?GYVEJ7UTucixjjJusKHCDPC7xItOLkzFHpGX5VmKWQ63Q61ggCsyO0r009Rg?=
 =?us-ascii?Q?pQ2OnfHzHkuqW8xTodkjd+zl5Q6mgo8W2aRhc0qXChZXiAuak61rJT2zg0cZ?=
 =?us-ascii?Q?F4nL0SI2yruKg7CK1xwViIOV0bnyyWRRgi+JebzAwHFskGTdfI5+bhuBjSvF?=
 =?us-ascii?Q?u3m/kCyiY5QJ14uHyBgvEcI2y3fSihr/tuVTFwgUR+cMdzQUcW5enaoAXcoo?=
 =?us-ascii?Q?8p//ze2HyhjFSe4XERybxYtmNYJkYtlNSTiGCKFtq2zD+lvSdysZfsIV9vEv?=
 =?us-ascii?Q?H/77Eo00/egmbt1U71qSzBym/2uvC0YEtTqW7hKHzbjB61VI0g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(27256017); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6RMXOTvuw5wcCo/hLOweqXf3XNROMLMO/GBNNJ9Y41JM66rnU0A0z64Z6vN+?=
 =?us-ascii?Q?qdlT9kjts8YdcoOP2f/9NE7qZYEScjxs8zD6nZiCz8+/levObks/Gnum+4P9?=
 =?us-ascii?Q?Eq5zFguYG5pqrTJ4NXbY/nLB+6ufjFrku+LXSM9k5EcOUI84ypOyp21oFyb4?=
 =?us-ascii?Q?HQQG3iEvKcKLT9ivJzomkJEVVpPvsRIAAhfb5QDgYwU2H11yNKsiZ1ge/ROd?=
 =?us-ascii?Q?ckMUlg9jubq7kXmCMyzCzQyPxxkap7GfZ4uZUyOrQ7xkGx0HIMg2S1DE7fZ7?=
 =?us-ascii?Q?2f9Bv1JhXLlgnMnOkF5hRAiWUAYH3ISsDsiN+d3LTKzqjC98uV0s7KeLUMfD?=
 =?us-ascii?Q?KW+/P+BKdEhrQ++mdf9+RYgUezWDIa68rOk+vsZaRClmtkkRbjiBh3UNPMvY?=
 =?us-ascii?Q?Iwuii0dGQFa8xVrFj3sh+/fUdiS7YnWUULa9wWnRQ1TtYE/x+zfmTCuXihL9?=
 =?us-ascii?Q?DLu+q5GPR0KfALJua4IcPDxvZF7PANzw5PwdQgukO5T5ubN4NCBypEjv9Iod?=
 =?us-ascii?Q?EySh0L5LkFz40skJncaECebQ2N2Fi3LxeNwjnRZHjOu0QsbvF9w13In7s5hf?=
 =?us-ascii?Q?vGLUFWjQVHNX9YUYIobaNOC4uIcViXyFFjwm16zQPRo3oPSqdQIcR5+tql3t?=
 =?us-ascii?Q?w6Zx02N4EDVw8tHiNsP6eO9eTIq0FrPDLm1Rhpqd3AidK2f0MXe/GHV6FV5g?=
 =?us-ascii?Q?2J0IzxaCDlvxyizb7NwwSlgmhCUyEqIJsrQTf1m+kJnOGIsKy7XS8p1LldTI?=
 =?us-ascii?Q?WCdVn0pi8Wwju+iQzap85ABrMqVfy12OPDWRzY5XGigPlReL+5eWEoGgtm0t?=
 =?us-ascii?Q?+lpQqiV+/5DdWHKRztVpuWMs1iSLWHNOG1YlJqy3984FA5FlwJvsCsC4WQ1e?=
 =?us-ascii?Q?p1esBAX1Um2wSNDm2fYpIgSGLwRdYUGRpBttkIg97kLJWOH7LwmuaX/GYpok?=
 =?us-ascii?Q?TzT+Y75TG4OBkGPqEgdT/gtTGkOtBTlXB7/Tx7zLjj6bwdj9wXZXTxmdZcXP?=
 =?us-ascii?Q?J+hStiFZm5p16xTrmi227XrhAFbt0uyUrV0owl1rmZJxDQFwKsSVp0fhxSuA?=
 =?us-ascii?Q?3rc8f2UWT54Hcr401rmtAOqSayj12kCBV/EsPsurCItbS6rsGDkekdY5bEMb?=
 =?us-ascii?Q?rAek31xwpAd5cmdU2+w2z41AbnPR9g9lqeOg0bDXv4yuWR8/i0r0vKmGRLNq?=
 =?us-ascii?Q?J3ju5rypUKhIM6KPtqLjz7HTWmP8lLU3reBaf74yRk9GPUm96afZjnX47G+v?=
 =?us-ascii?Q?TKAX56e4wHthXynDrXX1rZEU/7G8y1gBvJizJ2aOwskx+BuYRJdvmIE9baWq?=
 =?us-ascii?Q?0BkFivEOmmEPSWgYOMX6me2cHaS2WXec9bCcpKnIRZ8+YpZghHffxk14cFsv?=
 =?us-ascii?Q?s/r7t4+R3VQn8WZGJ0wAszDkaRNmTymHdGn0DZIBv882MTdSQVsrR/sz7PVT?=
 =?us-ascii?Q?wNrLfhske3aFLyH02fpWxHSrUaBVyekdQBhJa9JCLDyM4j7CvOft6S4ZwTc6?=
 =?us-ascii?Q?uJyACe0rpGAQHk4FzMdMC/+O2sFmP2qluLz5wKs9pUeD8mihnnXh1rEn+zye?=
 =?us-ascii?Q?YGZZck/7D5YEZ9BZ59Kes/jNHqTnAa9m+m6xIkUN3HqCepJ+u2kYq9qF0xuH?=
 =?us-ascii?Q?cw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70f556b4-9e6f-4f15-31c9-08dca7798f72
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2024 22:32:52.1403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FJD1UDTqI84bpkhnrmoCkMow9u8mKcNEsuL67vyDOlP3BC04mliAWVlwep5U/ffFT/Iqx+fQPcEzwcIPRW9PWu07byV0tBrqUW2CyMJvCSE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR11MB4717
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

On Tue, Jul 16, 2024 at 06:39:26PM GMT, Jose Souza wrote:
>> humn... if we decide to set both for backward compatibility, why not
>> rather go with v1 of the patch?  v1 of the patch documents that the EU
>> reported in EU_PER_DSS is of type X. Having both masks here doesn't
>> answer that question and requires that we always convert back to the
>> simd8 number (and eventually to the simd16 number) for newer platforms.
>>
>> so suppose 5 years from now we have simd123 (using arbitrary/absurd name
>> on purpose to avoid people jumping to conclusions):  would we keep
>> exposing the simd8, simd16, simdX, fooY numbers for the sake of
>> backward compatibility with previous HW?  On the other hand, the
>> alternative means: if userspace X really supports platform Y, it has to
>> know about that type of EU if it's using that mask for anything.
>>
>> So my preference would be, in order:
>>
>> 1) v2
>> 2) v1
>> 3) v2-with-forever-bc-between-platforms
>>
>> Both (2) and (3) have the silent misbehavior in userspace if userspace
>> didn't adapt to new UAPI.
>
>option 1) v2 is better in my opinion.


great. I fixed a typo in the kernel-doc, added a few more
Acked-by's received offline and pushed to drm-xe-next.

[1/1] drm/xe/uapi: Expose SIMD16 EU mask in topology query
       commit: 7108b4a589cd6d3a2c1276fd610b3500f46de66a

Thanks everyone,

Lucas De Marchi
