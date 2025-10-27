Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA1B2CCF9EB
	for <intel-xe@archiver.kernel.org>; Mon, 27 Oct 2025 16:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F405E10E536;
	Mon, 27 Oct 2025 16:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LP+k/shQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2494310E52C
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Oct 2025 16:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761584272; x=1793120272;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=cMYeg727+IHt7q4ZVj5XanpqhpiHdKY1T38d7T0KBVI=;
 b=LP+k/shQPwQadLTysJjFHZoQbeBLYWwJSCexMvkrUhwD1QEPNTOvJ/UE
 dFM1t8IAqQ8fvEriM3vqQrZCU35EEkLCtM9HhQQtCNyStuLzge2G8wECY
 e2SM0p75+7qv/T6ASlH38GWePFJCVU6RBc/4w8EQo1mXApUe1rFRtNmVE
 kqIiZFR+rTdOPDD/0KPpHb0N9WgVJCaTEEPUHj1O9jG44SRVuxpLlXkmy
 NbHs6YfPiOjyux0py7nbRUOtVQHw84n6GL7v8y6Y5I6aJVObICzVvI1+U
 NeUXSZUxKZCr2zfmhd0u/BdB7Uj4KgkDD1FJMLkkrjP96fI4+wfayPZpE g==;
X-CSE-ConnectionGUID: stdwwCqhSoOk6NVTKI+g8w==
X-CSE-MsgGUID: CG9cXhAoQXy9n2QGf+PkeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63598191"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63598191"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:57:51 -0700
X-CSE-ConnectionGUID: 4ocAMzA1R3CgdWecBgkr3g==
X-CSE-MsgGUID: kaMAeNMITzmKvYf00A2rug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,259,1754982000"; d="scan'208";a="215750109"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2025 09:57:51 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:57:50 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 27 Oct 2025 09:57:50 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.30) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 27 Oct 2025 09:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAmDJb7qcrN3+izm5JSHHA0nqP1+JD3655oifOTN+FMW+8mdieQc/kk/k4xHOoSIijwH3finSlCtiB0G7p/8buPiQIAO+sn+rtBylswG5QQsALoHzhzCFM0XyEGkUSFv0PqE6j2AwUtRfigwIi98k5aDkd8YXrWmEK6dKBFVfO+eUBSsZ886SN5B1PU9GPJOOWbuu7o19joakZ0vxoU3PnvOWC3coyQMrOOcOguoVQkXDZXZ3LexCN517yxTUMPz74/P4Qcibs8h3ElwM6NPeU6mG5lpi+IfwJCeScBOwufvIUlWm7RXWMj/yspYYfzo+tHm1F5QUxoyPbag9I093g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6JdLydO6ayFGzoYap5urDUrAXXl6hbqGyj/s59MAxW0=;
 b=KyM6Xh+RrXfzeCiQ3zfm8quZiqgNtCCWPIw39gRwKQoxz7zE/XacmwrbmsfUcWxZIBnWBcfHG+g/OQ7oX+ZdZMJvzleDN3H7BWPkbYszRcQ41Hw4A17MZ+OU4FzahyJgtH6eHWLuqQUs0Hsso0yIqIIas+ucfTdR+ghTNJeyMU3h3WXipcUlN0i1mI/eO+Uyqb9jUbQ8rsaDWs0c5WKeFVoYLi+uznM69GCuH5HmmoHigqcL1NfI5TcCnuumo/BOCpAdKEeSxuV/nVUM0MwtLdPWmzOQDpe3KHWeye1aO5cLqoXxp8VeRY4vPlR1BfJ5DNLt38fOUvScqx44kuP0MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH7PR11MB5913.namprd11.prod.outlook.com (2603:10b6:510:137::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Mon, 27 Oct
 2025 16:57:47 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9253.017; Mon, 27 Oct 2025
 16:57:47 +0000
Message-ID: <6ece1654-03fe-43f6-9ffd-24ea97e5b5f3@intel.com>
Date: Mon, 27 Oct 2025 17:57:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Access VF's register using dedicated MMIO view
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, Matt Roper <matthew.d.roper@intel.com>
References: <20251024205826.4652-1-michal.wajdeczko@intel.com>
 <ktefz5degktsl5cvc5crezzfegghcnorw6otkz36czgusu6wmr@mfixbcawwik5>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <ktefz5degktsl5cvc5crezzfegghcnorw6otkz36czgusu6wmr@mfixbcawwik5>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0255.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8b::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH7PR11MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 03c7ceb1-bd6e-4d1f-d0fb-08de1579f49b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3huUlhWUE04bVpmalFrUkxqVVlnNnlYcjZtaEhnSFZ3a0piZFZLV08xZXRq?=
 =?utf-8?B?TU5wb0dxaUpVZTZTYVphWWtVUDlUVTh2ODdSczRNSWhmZGxOUHF6UE5KWWVv?=
 =?utf-8?B?SVdhaUY5ZTFlOW5wZWJRUUZtUExtOUxwU2Uyc3pOVGM5WFZJYWlYanM5c2N2?=
 =?utf-8?B?UjZJU3B6TzFzVXFiRHNwQ05mVzMvQlRWM1hGbFVMeDdRdUNLcHZOQXZlUHZK?=
 =?utf-8?B?bmZCcHh1U3ZBYlRBWVJETzJ6NE0xc0NOVDRkNVpUajhzNys0ZzZZQVdkYzU0?=
 =?utf-8?B?cmRJWUV4ZTZoUE50T0NGcUFrbE1jejh2VWl0TjlaZUxqWmxhakZpQnhDL09m?=
 =?utf-8?B?bUhSUEdRemF5VXZLQkd4OHRjK05wY1lDdDdvSEZKOVFUSk5FWjg0cjUrekh5?=
 =?utf-8?B?MjFqTE5GRnk2Vi9icGNncGFTZmxhMzAxaGJhSzhkYVdVM0M2OFpTWWdXdU1H?=
 =?utf-8?B?Rk9MTzhJLzdvRC9vMnM1aXJ6TWtybXFQL1pwamJrMXRrenFQWmpuY2Y1N01x?=
 =?utf-8?B?b2FzRzcrTk5lUVFvd1NzZjYxYjJ1NU5wQ0Q1cjNvVUxxd24rR1VDYkM1NmZZ?=
 =?utf-8?B?V09YRTVoV3QrUTRxYkp4SFhRM0xrNEk3YWI2VFZOSVpIampubi8yUGYzWmYy?=
 =?utf-8?B?MytrT0JRZ0E0R0hMdnE3OFhpdTZXNGhocU9WTUpVbUhjc3Bld1ZhWU1pSjhJ?=
 =?utf-8?B?c2F4RUkwbk5WZm1mdGNaRVBRR2k2R29jWnNobEJQWFcreEVLUi9PVkR1YVNx?=
 =?utf-8?B?aFgrWUViVkRBNUNGWkhYR1ByMks3RkEyNUdpWkV0TzhjcXZLTUw1VmFsWW5Y?=
 =?utf-8?B?cUtENGE3UmRSV0RYRHpVQW5qRXdsZitSWGIzKzFzQkRIb21ndE9BMFFSaTdM?=
 =?utf-8?B?OUpkZytrOEV5SEkvOGJRSEVnZ0JzYTF5VzVvalpmaTFrbGRwZk1zaEEzSUpn?=
 =?utf-8?B?NWN6VGFybTUvSVFHUG13a0REV2RRRzl6Q1BFWTNZd2hidVJ3ZUR2UmsvR0E0?=
 =?utf-8?B?azBEQ2NsbXVZYmNTdE8yYlVkY0lqNmtNOGdCM05ldkh2dTlDeW1IOGpVQ25J?=
 =?utf-8?B?Z2hFSGRnNFh1VlZaWDVIMEdiQkVDeWpMWC9MclgrTmdzMW93c3c1ZWpPUWJH?=
 =?utf-8?B?QXZHVGxDTjBXVVRGTnplN2piQ0x6OWRDbmJrakJoZHJ6a21mZTBmVFg5cFpl?=
 =?utf-8?B?UCtYYWFOc05pTzJQYVBob3l2eWhxVVVKOXQyZGR1QzRaL0xDaStCRHJCQXIx?=
 =?utf-8?B?QTY4QzdsZzBLVjBBQUF3ZG1MMkY5eUtyK2RMQk9YVDhJSGhoa1hSL2FWWDBY?=
 =?utf-8?B?cWs0SHRlbTVLdHlUTXBUZEE4eWZIS2E3U2xDMnR0U1JHMHZXaVhEOVVRdWJj?=
 =?utf-8?B?b0F6YzA4RHYwTTlhTy9Obk1jaFYxY3lnSjY0NzVEZkF2c1RWQ3VmdTdhb3Zn?=
 =?utf-8?B?OThOYVYrTHlKTnlaTklleDluM1AvcEs3dFJ6VzM4STNFelA0eTFUODFhN2xT?=
 =?utf-8?B?SnRlRnQ2L0JiQTJzQm41OXdFSjQwaDU1cXM1RFZobnk1cUdYYWQ1UXVlMm9B?=
 =?utf-8?B?WjFpY1VzdVZpVjhWQ0NwYmVhTEk5ZVRlckd1ZHV0cXFDSktUVWJtSm9rNVR6?=
 =?utf-8?B?T0pDSTY1VzQzYWpQSXgxek5BKzRaN29acTFHd3hGdWd3K3hBYUE3alFpMkN3?=
 =?utf-8?B?NDJic24wcVQyQjhxb3RlVngzNFdNVjhTVFU2QnBBbW11ZGRUb2w5VC9PQjZW?=
 =?utf-8?B?ZEhVWmZKNCtLL0Q0ZHg2aU4vT1UvK3hjSnZybmpzeFhpeGt0S1JUeDlTaTI2?=
 =?utf-8?B?bVl0Q3dEVjBFZUhjaFN1V2NoUmF4QVRyNWlrWnRYQ2d1d3pPYWVsNkZsZUtJ?=
 =?utf-8?B?ZTVmak9rU2VsOUVvRkZkUGMwRnczdmlDRWRPaFdhZWovcjRKQnJNVUJwVmxN?=
 =?utf-8?Q?mr0yEO5pxW3551xls8T0MytYzc+ATewj?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WkJtQldva0E0Yk1zRVdkUjRhV0ZScXJoOFBIeVZvNEViRzFIVXJWMEx1MnNi?=
 =?utf-8?B?YnpWMWZDMTRnZHBXTmFqTVREL05mcFFCK28vNFlUUWl0MEczTmpHc2pWTjNW?=
 =?utf-8?B?VFhmM0ljUkhOWkNSTVNBVHA2R3NHZ1hFR2Ywelg3ME9WTjJjb0N1UE5zTGdN?=
 =?utf-8?B?VGx2QkhRWHprdU56bW1DNzNxa1oyODYxbzFCS0NHZU41Z1ZsSTZWdjNGSzRm?=
 =?utf-8?B?MUlzR3FTNjIvRVhXTUNWZ3FNWms3a2Q2cjcyMEczWDZSTklpQUNyTlV4Tkhk?=
 =?utf-8?B?YVUxK295dWp2WmFncE9lc2VHbUhCOS9PZytsaFQrTXZlSVVuSndpYWJXN2Zk?=
 =?utf-8?B?WWJveVRFaHIwd2d1TVFTL1piQWpESytqS0NHMkVIaVhTVlJzMUExMVRxQmZ2?=
 =?utf-8?B?RkM1SWs0OWdPcjFlOUdFMDg1UktTTElma1hUSlRkUFNKWUl5VW1uZmszZkRQ?=
 =?utf-8?B?STJqMnF2SysyN0cvNXBuOVlXbGJHQmFQb29yKy9zZDBHcXQzVHgxQmI3VzVL?=
 =?utf-8?B?QmJ6dHFMcnkwMlQ2SW5YeUZNb0dmWjlKSmg0YlJVMGxKZVozVDRWMHJSS3p3?=
 =?utf-8?B?d210bVVGL1VFZ1E4cmJUcEZtN3A1M1J2eUN2S2IwZXZNalJCd05CVWYvbUU4?=
 =?utf-8?B?eTdQaTZwc01tK0tRRDlDYnQ4cGNVZEZVYXZST1dZclZMdnRBK1NqSUFyYnls?=
 =?utf-8?B?QlloM0VBU09qSUlCcTArZG5OanNGWUtVS2pHMzZyTXIyQ1NIQVlsMDRkM2Q1?=
 =?utf-8?B?My9vZ0hoVVNoSkozU2R1dXdtdFRqMVlKekc0WWdCaFJsTXpENk1YcG9vMjZX?=
 =?utf-8?B?YkJudjNZR1c4ODh2ZENJL1kybjRTb25DZHRhaVZqZGlIRTZDRUo1clRkR3Bq?=
 =?utf-8?B?Zi9GNXBKZEZxaFdYNHg1VUVxMG84cGlnYU01UmxWZkVOZmQwMjlSTWkwYkw4?=
 =?utf-8?B?QXl1a1BPWGhORkhKbWVad1U2NjFmam41NUhURTJrWXRqQnZDQ25VSkZUUXVI?=
 =?utf-8?B?ZmlwWlZHNVFoOXZXU0NoazAvQXk4WG5FQVVLQVN1c29TSDFIc1JQdXUrRUhZ?=
 =?utf-8?B?YTBBTmpuOVFSK3JWZENYdnBJSnNvT1hIMmlQOW5hK0pPajZIOVJ4ZTFkWnEz?=
 =?utf-8?B?MEZYNHZ0dldUL1lLUks1MWlFMnZBOU9EalAxQjU5azJUMmd6V2RHOEZWTjJN?=
 =?utf-8?B?aUFTYTZlNkFFZTRDUjliZFdMQlg5V0x2czVLem9RZitwdjJlbS9VOGJIbHdK?=
 =?utf-8?B?aTFZLzZGV3hudGxaTEJJU0NHVmdpclVHbFluY1JXNUE4UXg1S2diemQzd2RL?=
 =?utf-8?B?VmRObEF0M0t2S2VFNnJ5eDcwMW9PUWNzU3B4cE5wbkdRVUZOYk4yZTFoazRN?=
 =?utf-8?B?L2d5MVRXY09Wc1hKK09nbmdKb2dWUDJWWER1cDdvb0EvdHNqeDJMN2xNeFd3?=
 =?utf-8?B?d2xZdmNLTXU3ZWRIa0FiY0V5dDlOV21DNWUwTHBzekRydXJZaktrZW5vYVBh?=
 =?utf-8?B?Z0hBaVdldnF3YUZTcFFibng3YkRUd084V3p5TVBpdUUwQUNSenZmT3U5czNB?=
 =?utf-8?B?bUZTSVowWDEzdVA2WVNXYmdJZG1kT3docW50ZmxOSkpkcFMyd2R0QmY3M3dJ?=
 =?utf-8?B?Qkc0QWNNVmpEUnQzUXRTNlA3TlZXVHdXOUEzOSt6L08xQnRNT3dkaUk3T2ZR?=
 =?utf-8?B?VUhhYmNVNU5rTzNwVG8xVmdWd2FQTlFmQ0dWYVR2RVQxMTVBaDF0RWs1RTBU?=
 =?utf-8?B?SGNJUm9mU1NOVk92bFRaYWpaVTBmbEwzYVZJUGtMdmN3dzhBekFwYWJNRkxK?=
 =?utf-8?B?bmg2OXJsSUc4UnVZV2xwb01FWEdyRk9OL1pIcW9QdXNzbHpmTW9JUGYvYWlh?=
 =?utf-8?B?T2F4ZEVCRVdJYklNU3k2UXdBZFFYOGFFcjk4enB4eVRINEwzUCt5WDdZRHoy?=
 =?utf-8?B?bGFBMmh5cHg1YUJZK3dDdWtZLzVjdFFMWm5IL3B5a0R2OENzdjQwbnUyUkYy?=
 =?utf-8?B?Mk5mYmlYazkzU1RPb0c2Y2xKaml5ODNGd0xZTUcrNmZqYkhGWnk1SnBqbE9G?=
 =?utf-8?B?QjVqU3dYZWpTK3VSeEJPUnlQa1BSUDBNbWxSVG1yaFRDblNOZlpDZkRJbnJD?=
 =?utf-8?B?QzRBYm9DdkJKV1l3bXFlZDczeU03MWFLQ1haeTV1Q2YxMXNtYVZrMHFwNUdM?=
 =?utf-8?B?aUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 03c7ceb1-bd6e-4d1f-d0fb-08de1579f49b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 16:57:47.4834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGapoziOWIe1CbuT4BFakDSkFlvfdOu6AHWQZFbWMxQfLwRbsqNcZOTPbUG5yI3IKt58ZYDrGIRGkE98ppn9+Fq7QCaZL/5HZxIjvTsmri4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5913
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



On 10/27/2025 5:42 PM, Lucas De Marchi wrote:
> On Fri, Oct 24, 2025 at 10:58:25PM +0200, Michal Wajdeczko wrote:
>> Instead of creating ad-hoc new register definitions with altered
>> register addresses to mimic the VF's access to these registers,
>> prepare new MMIO instance per required VF, with shifted internal
>> location of the register map.  This will allow to use unmodified
>> register definitions in all calls to xe_mmio() functions.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>> Cc: Michał Winiarski <michal.winiarski@intel.com>
>> ---
>> drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 36 +++++++----------------------
>> drivers/gpu/drm/xe/xe_mmio.c        | 29 +++++++++++++++++++++++
>> drivers/gpu/drm/xe/xe_mmio.h        |  4 ++++
>> 3 files changed, 41 insertions(+), 28 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index c4dda87b47cc..0714c758b9c1 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -158,39 +158,19 @@ void xe_gt_sriov_pf_init_hw(struct xe_gt *gt)
>>     xe_gt_sriov_pf_service_update(gt);
>> }
>>
>> -static u32 pf_get_vf_regs_stride(struct xe_device *xe)
>> -{
>> -    return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>> -}
>> -
>> -static struct xe_reg xe_reg_vf_to_pf(struct xe_reg vf_reg, unsigned int vfid, u32 stride)
>> -{
>> -    struct xe_reg pf_reg = vf_reg;
>> -
>> -    pf_reg.vf = 0;
>> -    pf_reg.addr += stride * vfid;
>> -
>> -    return pf_reg;
>> -}
>> -
>> static void pf_clear_vf_scratch_regs(struct xe_gt *gt, unsigned int vfid)
>> {
>> -    u32 stride = pf_get_vf_regs_stride(gt_to_xe(gt));
>> -    struct xe_reg scratch;
>> -    int n, count;
>> +    struct xe_mmio mmio;
>> +    int n;
>> +
>> +    xe_mmio_init_vf_view(&mmio, &gt->mmio, vfid);
> 
> 
> Wouldn't it make more sense to keep the VF-specific bits in this file
> rather than propagate that knowledge outside? Something like this:
> 
>     xe_mmio_init_view(&mmio, &gt->mmio,
>               vf_regs_stride(xe) * vfid);
> 
> and then xe_mmio_init_view() receives an offset rather than the vfid.

but the location of the mirrored VF registers in the full MMIO space is
still part of the a MMIO layout - so IMO it fits in xe_mmio.c even better
then it was previously here, in the PF code

Michal

> 
> Lucas De Marchi
> 
>>
>>     if (xe_gt_is_media_type(gt)) {
>> -        count = MED_VF_SW_FLAG_COUNT;
>> -        for (n = 0; n < count; n++) {
>> -            scratch = xe_reg_vf_to_pf(MED_VF_SW_FLAG(n), vfid, stride);
>> -            xe_mmio_write32(&gt->mmio, scratch, 0);
>> -        }
>> +        for (n = 0; n < MED_VF_SW_FLAG_COUNT; n++)
>> +            xe_mmio_write32(&mmio, MED_VF_SW_FLAG(n), 0);
>>     } else {
>> -        count = VF_SW_FLAG_COUNT;
>> -        for (n = 0; n < count; n++) {
>> -            scratch = xe_reg_vf_to_pf(VF_SW_FLAG(n), vfid, stride);
>> -            xe_mmio_write32(&gt->mmio, scratch, 0);
>> -        }
>> +        for (n = 0; n < VF_SW_FLAG_COUNT; n++)
>> +            xe_mmio_write32(&mmio, VF_SW_FLAG(n), 0);
>>     }
>> }
>>
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index ef6f3ea573a2..350dca1f0925 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -379,3 +379,32 @@ int xe_mmio_wait32_not(struct xe_mmio *mmio, struct xe_reg reg, u32 mask, u32 va
>> {
>>     return __xe_mmio_wait32(mmio, reg, mask, val, timeout_us, out_val, atomic, false);
>> }
>> +
>> +#ifdef CONFIG_PCI_IOV
>> +static size_t vf_regs_stride(struct xe_device *xe)
>> +{
>> +    return GRAPHICS_VERx100(xe) > 1200 ? 0x400 : 0x1000;
>> +}
>> +
>> +/**
>> + * xe_mmio_init_vf_view() - Initialize an MMIO instance for accesses like the VF
>> + * @mmio: the target &xe_mmio to initialize as VF's view
>> + * @base: the source &xe_mmio to initialize from
>> + * @vfid: the VF identifier
>> + */
>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid)
>> +{
>> +    struct xe_tile *tile = base->tile;
>> +    struct xe_device *xe = tile->xe;
>> +    size_t offset = vf_regs_stride(xe) * vfid;
>> +
>> +    xe_assert(xe, IS_SRIOV_PF(xe));
>> +    xe_assert(xe, vfid);
>> +    xe_assert(xe, !base->sriov_vf_gt);
>> +    xe_assert(xe, base->regs_size > offset);
>> +
>> +    *mmio = *base;
>> +    mmio->regs += offset;
>> +    mmio->regs_size -= offset;
>> +}
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>> index c151ba569003..15362789ab99 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.h
>> +++ b/drivers/gpu/drm/xe/xe_mmio.h
>> @@ -42,4 +42,8 @@ static inline struct xe_mmio *xe_root_tile_mmio(struct xe_device *xe)
>>     return &xe->tiles[0].mmio;
>> }
>>
>> +#ifdef CONFIG_PCI_IOV
>> +void xe_mmio_init_vf_view(struct xe_mmio *mmio, const struct xe_mmio *base, unsigned int vfid);
>> +#endif
>> +
>> #endif
>> -- 
>> 2.47.1
>>

