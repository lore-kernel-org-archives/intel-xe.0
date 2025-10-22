Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E7D4CCD1BB
	for <intel-xe@archiver.kernel.org>; Wed, 22 Oct 2025 17:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F2F810E816;
	Wed, 22 Oct 2025 17:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bP+SQbHD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C707F10E816
 for <intel-xe@lists.freedesktop.org>; Wed, 22 Oct 2025 17:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761153408; x=1792689408;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8UawapnPXiFSaZYoG2PacqDLcOAoC5bewt2ZUlj9r6c=;
 b=bP+SQbHDveD850RsMSomnzigquntbUIyzW/2BUMk2tG3O2biMYhNRCJS
 uydZ8XitX6LMQ4H+6ihVmVmTHQQr90Sp/Z2i5xb3qVDPPpZisdBbMPE1K
 zceeJ0uE0UJbTBD2bHRHFkXjH4Ie4+DwHIP8919ZyKU8f0pXWp9PuZzHL
 pjrM0A0+k4DsBxA/EQI39seoP2fv4vqJxoq9DpS2ESXBuh6S7PBKoexSJ
 okC4BA+XvZ7prw2lhESZkIIsj8dvpFC4Z7zqdt3AE7bm1eO+wll/VE/cK
 ySh4T661eAVFvZSKcqlIM6tZtNpd3aFXYBOAfS68KwTUonZ1/IXX0SUme A==;
X-CSE-ConnectionGUID: 09T5y5McQNe99TZeq1DYKQ==
X-CSE-MsgGUID: d9NJCuxQQxmBf4bGkKLLNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63350162"
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="63350162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:16:40 -0700
X-CSE-ConnectionGUID: +GHR7i4nTGWHX5lJf2FlnQ==
X-CSE-MsgGUID: 09Z311WeTdWbMxz4XKzRcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,247,1754982000"; d="scan'208";a="184322557"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2025 10:16:41 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:16:40 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 22 Oct 2025 10:16:40 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 22 Oct 2025 10:16:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0z5tQEjE9mik6j/FgdUZsegdXkmIwYIDTHJFJ+mZKZPusZEcC3cT+FI369lPn27Mvmk4iAQH+qUZoFOOqtwg3snNQeohmLkPzODO3PhkTR4vUypkdjRKHx5N6gLmr9Np6HRA7Pdmxe9MWdbxsp8Aa3LeKcE7dsphseDxlYaDP07xC83SXqWaO1SuPXCmarjGKuED4OTi+kMxwsOM10aTZHihtt7GjLhz44KjVWli51NDsbUHAdASQdq/74ZtVa4JiVT739/wZQWLVuF1Rzkxct+fSfRpqhPQYBUTRT9FVCczaCjh/2f2NUcqch+P88et87+JVMPbIBHCj/zrhmdXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l84lGHpv6nWTFdfOS9ZbJFbXR7my/+7M4lfOD5NGXLA=;
 b=vmsvecfU0V7EfdxCGVJEgTLMRyPJ+5lZHvGFqAO/kGlROvaDO2Wz0QLabrK5UA/c61a2NCAmn8kZ5E2wB2/cr2HT6lqo1to6YnGFX06rp9vS2SNLxsTUVMn9BcYSrh/Ia9AuywaN/XpOHGr2vLiLRXEKHSHZwPmvioVixRbOM4RLoWHvpOa73g3F8ApGEZiZiUWPu4+RbLRSxnNZdHo32ubNej/WPFN3cYdQIucB55DUaGykaFsJG1B5gBvUs7CCol4wGDvF3xMM/SDyAp676o1MKwaJgfnmE9t3JZLcRfUsWP+nDrDMD0DsVvIrsmW5akajA98EfVM4WIQ2h02aNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CYYPR11MB8332.namprd11.prod.outlook.com (2603:10b6:930:be::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 17:16:37 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%3]) with mapi id 15.20.9228.015; Wed, 22 Oct 2025
 17:16:37 +0000
Date: Wed, 22 Oct 2025 10:16:34 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: <lucas.demarchi@intel.com>, <rodrigo.vivi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <riana.tauro@intel.com>,
 <daniele.ceraolospurio@intel.com>, <michal.wajdeczko@intel.com>,
 <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 1/4] drm/xe/vf: Update pause/unpause() helpers with VF
 naming
Message-ID: <aPkRctAio8O4l0uM@lstrano-desk.jf.intel.com>
References: <20251022094246.3584785-1-raag.jadav@intel.com>
 <20251022094246.3584785-2-raag.jadav@intel.com>
 <aPj3AgztiXKC+iRY@lstrano-desk.jf.intel.com>
 <aPkN69Ulm-b5UJNa@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aPkN69Ulm-b5UJNa@black.igk.intel.com>
X-ClientProxiedBy: MW4PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:303:8f::13) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CYYPR11MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b65962a-966c-4a26-10c7-08de118ec22c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cU5nNTdGWHcvMTNRYUtzcExHOTJzNWQzUDc2cTdOY3lPbnJLYWYzQjRVWWJX?=
 =?utf-8?B?TzgwWkNRaTVKSHpIY1dWUVJYNmhZTWhMaHVRc1RoVWFmUlV1VDRvenlZRzNy?=
 =?utf-8?B?QU1WTi9YYTRhMTlHY2dzTW15cWV5NDZlM0p3U0FBcXRPZWdleWQ0aVVObzZn?=
 =?utf-8?B?eEdYWFdVbzY1cit2emJXNVBMYkhKVTN2Lzl4Q1BTTjhIMGR2ejhZbWVtL3Nj?=
 =?utf-8?B?VklLWm5iUkZpZ2QxMGRwL1U5QUtGQmFwRCtlOWFtQTh4RXkyRWNPdExYN0pT?=
 =?utf-8?B?S2EwVDlRanV1ZVF2TVhwakd5WlBtTk5LUGI0OVpicjJnY29pb0RzdWxLSXpR?=
 =?utf-8?B?YUlOQlgwU2JXVGJueUE4aWkwMkRxTVliaVAvRUZmZ0kzN1U1bjdrOVEyOFlR?=
 =?utf-8?B?YmVPR042OXYySUdudy9RY3gyclB2bmhFako3S0lPY2ttdDZKNW40UFMva1FB?=
 =?utf-8?B?U3dWRjREeVhYbmdJK0xpcGdSUkxXSlRLZUdnRkpzNS9uSFFteEVGUzd4VXJl?=
 =?utf-8?B?RFR3REk3Ym02MTh5cTV5ZWNvbTZkVjVIdktSd21Odit1TGZZR1RyeklRclJQ?=
 =?utf-8?B?ZG9oRkZTYUF1NE1XZGUzeGF3dFNYOGFMVnB6djU2M2VUYnY4TC9mR0xXYXVo?=
 =?utf-8?B?bTJEdm9heDJmWkJVR1ZSMVFFcDBhejhlUGdqSVlqZFovdUd5bWhwOG9NazU0?=
 =?utf-8?B?TzJMQ1FVV3J3VG95Vzd1R1N3MzN5S24yREovVHAxcDdtK1ljY3R1a0djSmo0?=
 =?utf-8?B?WUJTMnV3SXplV3AyTjlFMkorMUNiTkhsemExWGs0SUV2WkJ0TnBYQWdUWFpn?=
 =?utf-8?B?VzZVdk9uSklGT2pweW5jZzI1UGJpTFJGdWdLRUpYbEJlQjlGTitNU1ZHVlVV?=
 =?utf-8?B?ci84MkhSbm9BbjhrTEhHdU1mOS9vUzR4T242VmFrS3N2Y2h1aUM1Zm03MkhM?=
 =?utf-8?B?amtSNlBvMEdDbmFPR0FQVjB5S1Erd1ZBOG5PN2J2VkhnaUxvWDJDbTREYVph?=
 =?utf-8?B?R0VOOXFQWFBPUWQyRVB3alc4WnAxRUZlODRSS2tjMElKeDQvZldnN2tKd0JM?=
 =?utf-8?B?Tkd2OVIyVU1QemJCSlZ4TDBGQWY4dGc3OTlQWGVpZnk3eFREelNKRTYrZkNO?=
 =?utf-8?B?aWZqRThTc2xWZ1luOVBBTURtUUVncWdFdlBzVHV1LzlaaElYMlNWWG5qVFFk?=
 =?utf-8?B?M3F2M1lPU2JIM3FOc3JoZHBSWkdMaUlxeU41elhYSDFqS3h4ZkMwQnFIVDkv?=
 =?utf-8?B?a0E0Vklzb0pCVjN0aHE5NEFaN1FDbnRTUWhNWGlHeGdMQzl2Q3ZuQnVCN3gz?=
 =?utf-8?B?NHJsSGt4QlY4cHVOeXd5aXhtUDQ5ZzNCUmlZUkhUZEJQZFlYYlF2cDFTOVM0?=
 =?utf-8?B?MDZBRWtHYlMwUUpUMlV0TkYrV0xJSmhNTVdoTDYzMW1lVVc4YklHcG5rTUxX?=
 =?utf-8?B?cXBHc3BMQVFwMjcyeHpYUjRMbzkvckgzTlprcThLM2FRc2Q0K0tJZnBaQitL?=
 =?utf-8?B?VHFxRkJqMHdRV3lVU1RMWW1ETGpTY2g1cDljd2pxSzEyZnpWTUlKbFlpTkx0?=
 =?utf-8?B?d08wVW8xaWZaZ09UZDkzV0xxay9ITjN3bVRhcTViNjNqQjNWUmtSMnIyQ1Ro?=
 =?utf-8?B?M0ZZU2lRdG5rbjVZWjk1NkRjZVJVYTI3OWlkeENMOUVtMXkxT0VaRGg0ZkJp?=
 =?utf-8?B?VzdKK0NGTER0Nm81dmdTNzh1cnlKbUdOK2VBbTBvU3p3dnFHSC91eHNHWjZN?=
 =?utf-8?B?bEpVSVpRVzE0MlpqR2VJdklDVVhvN0tmbVFUWmhyMGREdG5sV1dhNXEzaC9k?=
 =?utf-8?B?QXpWaVNOYzFuOTlCQ1gyRFVNT2svcktSUXZhS05OaXFJM3NncXhqOUtydHdr?=
 =?utf-8?B?aVp3L3c0MTgvQy9ZNmRJVjNSZExDazJDNmlEdXRMMzdiSXptZTdOODh4UVRv?=
 =?utf-8?Q?8JIeM2VDSnklHHPC7PC4qsyRQsHv68fP?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZWEwTForNjdnZ0s3Qnc4NUNuUkt3MmM4Zyt1QS9lMDd2YzM0cW0xRjY4MVJH?=
 =?utf-8?B?endaQjBxUnNOSnJJdVFLRmRId0FjejJVL3JFbEJXSENocW14aXZIV0p6eWUv?=
 =?utf-8?B?S2hUQm5zbGJkbGZtakdCWWJBMTEzdzZqbVhwNEx1SHdHUXdheEdlcE9Udzla?=
 =?utf-8?B?Q0hORzJmMmt6SmxLekFyclRaR3RXTEtqZFgwSEZKR3dPaTNSRDc3dUt5RlFN?=
 =?utf-8?B?RGxoTVRkVTlucWtwRkVveEJpbVVMazlRY1B0YVJrcE9QZzllcUp0czcxNVkx?=
 =?utf-8?B?TE1PUjhBT2RxWHVJeEZvc09ONDc4RW9abDlOUTA5eXBiTTdLRGFDd1BQMDUv?=
 =?utf-8?B?S2pISzYyZWxwUEkxL1NFOVYvN25Pd1VJTTdwQlZwTFdIZ2dBZ0VDK3lBWHUw?=
 =?utf-8?B?VXFiOGluWGxtYTh0U0kzUUFwZGFNK0ZVUW9PeEZ1QnhsbWhSVW9ybC9oQ2wx?=
 =?utf-8?B?N2JSdGFPK2JrRm5tNWxVMW9OZmpYKzRUMGh3MldKRTBvcUd5TS9haHZudjhK?=
 =?utf-8?B?aEpYZzJPRHYrWk4zVWhnZU5iUlJRNlNoUG42Z0FtKzBhaVFPWVNrUlhtb1V5?=
 =?utf-8?B?SUtqbWhmSXlIZ0JvNnB2REFUWFAwc3RTMnJNQTB2eWlrUU9FMTNneWxVcktS?=
 =?utf-8?B?WmNFSHRrM2dJS0t4ZEVlV0F1SUttaEJSS0MxNnUyM1dNV0ZBa1B1NVlWMG0z?=
 =?utf-8?B?SExRN040STlpRUk3MXlXREM1S0ZzZi9Rc0RYdGp6cE04eHo0V3JFM3V0NzVN?=
 =?utf-8?B?cExBL3FMVEJWVXFJMUIvYXdXZzBLdTlvbVdwSnRIOTViUE9xRmo4RWJmYUNZ?=
 =?utf-8?B?UEhJZ1EreElLS25BYVgvdUJjSFhwaGRVa1RMdVpHdU92VUJ4aW1veEk5RDJX?=
 =?utf-8?B?dXZFbXFRRmtaZk5xSENBT25UdVdwdDVqYU9aWVNkMmJvdUxQekt2cEJseElx?=
 =?utf-8?B?L3UxanVnYlVYeFIzaGVFUGc5NkpyOEIrSlloYnRYM0xWZDNmWUNoQUNBRnJj?=
 =?utf-8?B?TnVFNk1xV2NBQzduaUFoZldnM01nRGtoYklhZVg3ekN1OFpnRllyOTdGazdw?=
 =?utf-8?B?bXJyYVJDMTdjTW9tNDFmZGtsZWdGcnZHVlNXUEZSYWVpUXRxbFdQT2lXSEtB?=
 =?utf-8?B?d1VRdmFSamJYZDZYaFRabzVuSFVEQ0dqcVpVQ1lqcExtbHRXNjIvVGlMVXZV?=
 =?utf-8?B?TkFNaW85clNEditqSjVHZktlZkNWTXRhcmJwY1daTlJJS2ZNeCtOUDdkUmVG?=
 =?utf-8?B?d2N2anhXeUdnZnBBWkVjVStvdm5kdUp1bjdSY21BZ2NES2swa1FvcnB2eEJI?=
 =?utf-8?B?cXMzcXFCZVA3RVlLODVYL1lHRlYvZlJ3dWhhM2hMWEIyV3FXVlpidjZYK09t?=
 =?utf-8?B?bTR4Z3BNTGpuV05velUwYXhhb1htNy9jblJ1Q2tYTi85eS92em0wbnFBTGRG?=
 =?utf-8?B?WXBTYkVQNWw0aGd3VHBkRm5qUVBsTEQ2akUvMTBiTkRXdlRZdWUvaGJIZEFa?=
 =?utf-8?B?YzF0TnYrVHJsZkxSOTlDTUdSdnpiTFQxczd1UE1oMktqR0FFakJaeXN2dkpt?=
 =?utf-8?B?MkhhNVN0Vy96eHRiMWx2U09mbFdiNDVKWG8wR2JHOFJtTGpCdElDcVdHdW14?=
 =?utf-8?B?YUdGei9ieWc5bFJNT1M2SUFkWHZkQWl4MnFvTWdtMWNiaTFBV1BRek5rYTF1?=
 =?utf-8?B?UVdlRElzUmhNNE5HZG5SR0x0RGk2SnhMVlFzTTZBY2dWZkVqMVJZbm4xbi9V?=
 =?utf-8?B?RXlCYkhKSkdMMVZ5Qkl6TkVHQUlxTisxTGdpSjRCOWloRklpOHFOMUJRUVBw?=
 =?utf-8?B?ZzFyU2JmTVc5aXQvazAvNzY0dUZMZHZQNDRsZzJXM0drY01nak5wZDJHTEpo?=
 =?utf-8?B?d3E3VC9wRGsvMlBlazJ5alJLVDY3aEczVTFQNGoxdnRzSlhIbzlrMmxBMFNZ?=
 =?utf-8?B?OVk5dGJwTGlRQ3VUTDFZTCtwOXBnN2RReXg4V0RuY1VRTjB5bWE1dTRGY1kx?=
 =?utf-8?B?RGM0MVFNVVZYeUo3ZmsvOUpLS09YOS9VZTFzdGFXMm5OVlZobUxQOC9NOGU2?=
 =?utf-8?B?TXYyQmN2RkhmYXF4RkhWRjk4ME9WU2lQQXFDK2ZJZHNrd1NvU0ZhcFIwZFQy?=
 =?utf-8?B?bEJKWStCazczVWZPNDBTSjJ0SW5SOEowM2hsdzZsdGo3WDRZKy9qYitWeFFW?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b65962a-966c-4a26-10c7-08de118ec22c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 17:16:37.5410 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRHsvYObQ8Bgkx080Ab3Sno45k9Cg9oF+jXJLf4qry16fquww0FjFexVBkEzpQn3BI+UXN8NAmj/BZ9TzPjR7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8332
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

On Wed, Oct 22, 2025 at 07:01:31PM +0200, Raag Jadav wrote:
> On Wed, Oct 22, 2025 at 08:23:46AM -0700, Matthew Brost wrote:
> > On Wed, Oct 22, 2025 at 03:12:43PM +0530, Raag Jadav wrote:
> > > Now that pause/unpause() helpers have been updated for VF migration
> > > usecase, update their naming to match the functionality.
> 
> ...
> 
> > >  /**
> > > - * xe_guc_submit_pause - Stop further runs of submission tasks on given GuC.
> > > + * xe_guc_submit_vf_pause - Stop further runs of submission tasks for VF.
> > >   * @guc: the &xe_guc struct instance whose scheduler is to be disabled
> > >   */
> > > -void xe_guc_submit_pause(struct xe_guc *guc)
> > > +void xe_guc_submit_vf_pause(struct xe_guc *guc)
> > >  {
> > >  	struct xe_exec_queue *q;
> > >  	unsigned long index;
> > 
> > Can we now have xe_gt_assert in the renamed functions that IS_SRIOV_VF
> > is true?
> 
> I thought vf_recovery() already does it for us?
> 

Yes, but the general idea behind asserts — or lockdep, for that matter —
is to place them throughout the call stack. They serve as
self-documenting mechanisms for usage, help prevent misuse, and are
compiled out in production builds, making them harmless to include
everywhere.

In this case, the assert documents that xe_guc_submit_vf_* should only
be called by a VF. If someone tries to misuse it from a different call
site (not vf_recovery), the function will raise a complaint if it isn't
a VF.

Matt

> > Feel free add those in next rev and retain:
> > 
> > Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> 
> Thank you.
> 
> Raag
