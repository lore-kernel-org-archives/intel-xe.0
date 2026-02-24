Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 992B2F3C98F
	for <intel-xe@archiver.kernel.org>; Tue, 24 Feb 2026 14:57:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58A3C10E326;
	Tue, 24 Feb 2026 14:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="evjTHOYr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0300510E326
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Feb 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771945030; x=1803481030;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Id3HpBuC2amhKSGdq5+vwl34u47I2AxoAhmBUNO+MlU=;
 b=evjTHOYrVrVx77xF7BHf/iWbjlIfB7ddRTggLhIZ/tWYUn9IPc/vhBeR
 ozAd6qNA6+RDppq5DztVnczuv5brC7CoNWF89rTKipSijANzwbEcaKXMR
 58jHdnTXYaA8F9NFbfzyQCt4wI1P04r6VT54O7cBNGR7NTxZTwCx7jHU4
 jrBysXWo8TQaWs7nhYffVX8xqrzvljzfxPpFin9BY2VxaR0L2yYU88Hmm
 YnM10zuVyWMt4xVFSLTnfgNaxK87aB/9h/XipmwKi73Sj88QTGrCChbtI
 XGDVPF2lokGIIGP19g7RE4QQq0DfB+Cek4Eby+XFKj+rhcXRTPaeyHzWl A==;
X-CSE-ConnectionGUID: JMDrTFRWT/ivuIWDqGm5ug==
X-CSE-MsgGUID: i4ftLSefQ3uyAvL6AkG9uQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="83671115"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="83671115"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:57:10 -0800
X-CSE-ConnectionGUID: grinlzaLQsSI/8dmhYN3AQ==
X-CSE-MsgGUID: 1027amm8Scu21rLl8aPRLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; d="scan'208";a="243870410"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2026 06:57:09 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 06:57:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 24 Feb 2026 06:57:09 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.2) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 24 Feb 2026 06:57:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=shlTVlyh7yBWjcbVhf/JD1niKUAnjOlpeuyodk00OY2gcj7xyi159cKWmNEK/Jlt2VfLbP1hCjUFLMIeD/Rp1++aKyyDpoIisGZ2nJrD3V5FzFDknVbrl67DIP/hmuUi5HqssRP76+odhtwT9Wxa5VAMs8kVqPFSW4pLw2MOTkUvAuE2vMLHwanvQx5nfo9c0/UzUqVB1nLB8me+rpz5yKJDeR+vxVVT/+5tnpdJzAcqdVRmRFs/XbOxl5YlxG9tI6vpSAYMv9sekuYPLxW8myxz/vt3x9xzuic2ojSXqB029QcQrcXs0v7bm4HGz+Zn5MvAXqcAUSeSiv7sx/IGlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cyAh120d0ilduS6QKpeDkAQvZKwVlUsX5wqOs+an+7A=;
 b=lv2jF5UUh2yFlrUVT3566xxxtm5zhFH/EQ/8oNuGLB/SS0tch97VN5a8dTjk20sK3imwBEgtttuD9+pQkqghhM0SVx/lM2eDp7f+w2o0Jv9H3QWwRPNjMcW0KE0dkOZ711vF//YlTTVGyvo71uA3tqsEsSP1uAfLYzragYS8GUyZcHnmV7uXUUUCbKJ75UpDdxZvY7f3b2jUEiU7sMcivXla/ere6InzV5YjqDfx6As9D41Lf71X4dThOxvTYnRKKYsicUxLl88D1o/b4/OPukaOx4fu47rdC0GlM/VJS6CtDSO7ghhRaSm84pa41eqtcdUbi7Mnah9YBwsEKADv4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:57:07 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:57:06 +0000
Message-ID: <c46707ff-ba40-450c-8b37-42cfb491ece0@intel.com>
Date: Tue, 24 Feb 2026 20:26:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] drm/xe/madvise: Implement purgeable buffer object
 support
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <pallavi.mishra@intel.com>
References: <20260211152644.1661165-1-arvind.yadav@intel.com>
 <20260211152644.1661165-4-arvind.yadav@intel.com>
 <932bd347295960286b9a30db776ac3e2e24cdd2d.camel@linux.intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <932bd347295960286b9a30db776ac3e2e24cdd2d.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0135.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1d5::12) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 0457cb18-02d8-4cd1-e549-08de73b4fa7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RzhsdSt6OWVJOVdXdm1TOWVFT0NmVllyUzVzS1ZIWmdkbnV0WTZCRVdoMXg3?=
 =?utf-8?B?YjNKdEdQK1UxRHdnTDE4MmRtdkFuWWZxR1lWeTJJeFNpYnZwb2QvOGtDUXhL?=
 =?utf-8?B?TDRuRmN2TkYrUXZmNEhnUHVLcUdIc1Ruc3NoWE9rL3pZOUxTZ1ZlVDN0TGh1?=
 =?utf-8?B?bDBTYkFCSVZKeEZYcDVyRFRyRldQak5ienU4MDYxblVVSm9HQ3pRNHl5MWZH?=
 =?utf-8?B?cmNVZ0ExcjgrYmR3b3ByWW9KeENrbHVJUGtmWHRhZFd2RHFlTzlGSFR5cEJm?=
 =?utf-8?B?dlI5WW5CMVFVcEdlTTNLdlRmWjQ1aEZBZTlnSEZqblQ1aVhLUU1FcGZMeHVO?=
 =?utf-8?B?OTNtZmxEaGNjeVd2UklEeU5sdGROSjhEQW1HTnlWOEJBMVJGUzdtM0FLc05P?=
 =?utf-8?B?U3N6bHNZRGk0d2F4NXIxUFA5ZHNvTDEzK0d6RWtWWjdHUE9Wa2tkeFVuTGJn?=
 =?utf-8?B?eWZ3WVRqTTlGcVpuNSs5VTk0ZTFlcXZTWkVZU1lhcHBCYzNBVGtOQTJBK1VU?=
 =?utf-8?B?SEkxU21sTlhoVXhkUUlaNkt3UnFlOFBNVEZVOTN5N01nRzQ2L29lbjFGcWJS?=
 =?utf-8?B?TVF5bGJ3L21EUS9jZDl3eFoxU0FuN1RnWnk4MWpBb2N2ZzBqR2FCT0R6dHZu?=
 =?utf-8?B?ZnpRR1p4Z1ExQnlGZ0JDa2xmZ25yQWV2Wk1rUWNwZzhtZVNRNGdySFNZdWNV?=
 =?utf-8?B?eEI4OXN2ZE5WazJ1bG8xUy9lNHl4NDMrWWpSa2ptSElMTUxnN0orZjVkZ0ta?=
 =?utf-8?B?eUVPd3BoTU5RL0VqTzRoYlFkdWliUkRlSFNWWTlGVDYwVkJ6eVhnRXljcTdC?=
 =?utf-8?B?TFdSVnlybGdLaWIwclpldnBDTVY3dWF3RTdENEN4ZDlpRHNubE9SOWdvMk1u?=
 =?utf-8?B?ZTMvbDJQREliZVdEZXFhcWMydnVzdjVPZm5yMmJaK01sbnpVelh0QUpGWS9Q?=
 =?utf-8?B?d0Jnd3ZjNzFkUkRGeGJjd2ZLa2dEb1I5U1N6TVFzOG90TU9zYTVxYXFIQlAw?=
 =?utf-8?B?MmkxWTQ5djRxY3BoYkpxU1drcWUzc0w1ajR5NVRkOUJEam1qbENTQkMzOUQr?=
 =?utf-8?B?YnVIaFpObVNyM3FjYjcwZ1VKSGtBYXF6MzdJUkxFUThSTXAwaVdmaGF0WUk0?=
 =?utf-8?B?S1J3aytVaVlxMmtBWmQzR202M2MxaTNoeW9VTUpoVFNLWlE4OUVyc0FkbXh3?=
 =?utf-8?B?ZllVQ2lpM0pXZ1p1UzJPNjhxQmxrVU1TV1J3T2pDR1ZpUTZieTFZeENOVEtY?=
 =?utf-8?B?UENYQkUxUkNjVXF5WW1oalZjbm5UNU9MS1c5czR1NE9kYWFBR0JubUNlYzVH?=
 =?utf-8?B?cEY0bUM4UVVnQVNMRWV1Z0V3cXdEZ3ZJeU12L25ybEhYNG9MbTJ3K2xaTklN?=
 =?utf-8?B?VUFob0ZSNWUvLzRocmFaSUxMbzlYdm9jR1FSM2JNS0J6b3Y2TGJIZTJpZmhG?=
 =?utf-8?B?anFiU28xVlVCWEFVOWYrcEU2UG5FVGRPMGxDOHkzMXQ4amJxUkNJVUQ1L0g1?=
 =?utf-8?B?RkRjY2hKTXNWL0xJWGpEQklVRmF1NUJvUGpXMFVlMW82dlBlQU94UEVpQkk0?=
 =?utf-8?B?VWRBL3lOeTJ6S1UrZHByUXFEMC94Q2JVMkpuRkxLNkt1dWIzWmkwd2F3Q0NT?=
 =?utf-8?B?RHdNa3QwS1JyU280VzczYU55TkNpSGZXb0hEY1RUV0YrTVR5aWI3SFViNWdR?=
 =?utf-8?B?TGttUlhhQlRNRWdHZHJsZVhyUzY0UjJTWFY1bHl3U09SVGl2dXpXRjNvb3NS?=
 =?utf-8?B?bTArbHZzMHJ5M2dVeVBOQ0J1ZTJhSlFwRjdRTHdZdy9tTVp1Q0tBL0paUEFl?=
 =?utf-8?B?STJxelRYZndDZXZjL0UzSW1lOUpwSGkwZHJ0UkZwZlp2T1NGYmNPMzROcUlE?=
 =?utf-8?B?VGMrS2RSRVpZd2VHTFp1MmVUY3NrVFFvL2pOUjBUQkM5aFNqbmpHc2IzRDhH?=
 =?utf-8?B?Zm9sQ0p6Vno0dG82bFlhQ241cEFEOGVpQjAyMUw4elA2S21PR0hBRysySVZ5?=
 =?utf-8?B?cmdBTFIyckU3RWVueVlIcE41bmc3aDZiby9oZC8zalFuUjllMXpORHc4TlVG?=
 =?utf-8?B?cm5TRnhyelhiTEh0a20rcU9vNklkYW5GRHhEVmY2TmZabkY2V044MDJ3RERB?=
 =?utf-8?Q?bPqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TitvaVd1b0dDVGhnM0lQSUcxZ0o3SWJFK09vaXBpS2hMd3A1bmxqWlFqeEZ3?=
 =?utf-8?B?SFUzYTU2U2pHQWErMnB6UFNPUHNCRTNFNm52WGdxR29GZ1hsclpkbXBjYkcr?=
 =?utf-8?B?UEcyZ0VlamZ3c082MjZOb2h6NU9scFZwaDM4UXhnMjF3Tm9SYjR2VUdva0t3?=
 =?utf-8?B?b1gvbVlldzl4d0ZOQ1hqZi94K2Y3aUJKTnNzeGZWM0VoaHYwREhqZHZqQk1X?=
 =?utf-8?B?RTEwcUUrbkFaeUhZR2RHWVhWRS9iWm5ZaUM5Mlg2K2w0eVd0VVNRVldJWDBo?=
 =?utf-8?B?aXJ3UFFXVzRLQ2tLcmdubmg1dENCdHhkOE5vUUN3NDNpRm5UUlF2bnhwY2F5?=
 =?utf-8?B?THhsbVVTTURUazJJTEN1RVJZK25ibnJHY1VGWlhERUNaWjVGcVNQWUV6SDI3?=
 =?utf-8?B?cHdXYWdxdmw0M200cjZScFd5SkhmT2pPaDJaNGxYY0UzdHdRRjd6dVFrU2ND?=
 =?utf-8?B?cjM0V3lOd256UzVGTTVHVUF5TE9WSEdLR1U5VFlJQ1hZWjJKMjNmZ3Y1dXJZ?=
 =?utf-8?B?OWpaektwTjlGUHpZMjdIRk9Yb3lZY3FqS3JqRlcya2xBM2ljSnp4eCtLTGt0?=
 =?utf-8?B?TDFXc3FLT0JGbFcxVFRQTW5OWUpoTC9LK2FNdEIyT29DVkIzajFFNm1Vam9K?=
 =?utf-8?B?R0VRK0VGZGZvUk0yamh5YnMzeHJXU1NreEc4Zzc3ajlyZExmYUxPMGZtbThV?=
 =?utf-8?B?Y2V0YVpMYkZTdExWWVNMVW8wNktmVU9ZODBtZmw1T082dmxXbEp0VExDV3NQ?=
 =?utf-8?B?ZEcrdys5WjRxSjAwZkZnQmZ1QnNIcDB2clBjRDA0N3JsRXlnd1RpRElZQXBR?=
 =?utf-8?B?UndHQmNYSDErOFZrN0ZUcWhTOStwMXd0cG5IeGhxOVBvSGhKM0E0WnZhb3lp?=
 =?utf-8?B?T0hwN2hPbUdwWDBLU3lwWVBsblRyUmJDWnFKbXF0THNhUUx0SlhWZ2ZBTVhU?=
 =?utf-8?B?WS90am9NSitIbnRYKzE5T2M5Z0hXVWZSMmlNUWFzdm9xOVNia0piWXoxc2JX?=
 =?utf-8?B?SmxqelM4QUlEVVNrV1R3eEorajBhT3lRM05qZUcrODU1dGQxZEZXby8yN1hG?=
 =?utf-8?B?Q0Zad0JzM2JFZFpPNU1JZjNycW5XRHRCc01rSUFabXNhMFdxdnFBbDV3dHRk?=
 =?utf-8?B?b0o3clg2VUpSWTQwZHpzUGZ3eFJPQWZIS2gzODh0KzNsWUVqakFSa3hZK1lC?=
 =?utf-8?B?VnhYekkyZktTWm53TmFmZmw4cklORXdZZHpyeXlWUnNHakFtL2pQRlpTeEpm?=
 =?utf-8?B?bEFTazhuR2MwclZ4ZlNLblZCQmxvcHRQK29OdE5ydTJwTDZnWFd5cEw3b29a?=
 =?utf-8?B?V1NRak9DZ1Q2Nm1hU3FDRGg5K2tWOEI4UGlFM3FVTVNNMm5PemJ2SG56VWhE?=
 =?utf-8?B?YzFPclFDL1Jpc1hKc1RTYnBiRDBFMFZCUm80aTVzNkFGb3RiU1hVcVNWdHc2?=
 =?utf-8?B?UjZhRUNCNHJadzhFSURpd1pIZ1BKYVBML0l4aXljWWJORWFNeHNrcE90bHJ3?=
 =?utf-8?B?QXlUTFpwQ1M1dnFkTzJva1BuK0w4UHo5dzZXVnc3dEQ5cFRNSnVkTTBqcmpK?=
 =?utf-8?B?WjI5UXlPNlg0cHJZVHBKUlJmSVJDV2RRekhIS0xEbjRESHQ2eDhMMkd5QWhW?=
 =?utf-8?B?T0xFQkFIcjNXN2hqNGxqZ28xT1N6YzNUaWxxQ0lRL0lpMUhmTXhTbHFLT2w1?=
 =?utf-8?B?VFhvUXl5NlQ3QXJKQjZMSFNQcFlpVm9hVGM2VUVna1JpamgwVXJWQkFIOHRZ?=
 =?utf-8?B?a04vaXRBS3Rodk1oYldKR1U0dVRJWjljTmhHSUN0R0VNOEI0ODluNG96ZU80?=
 =?utf-8?B?RVdjM1pJUFp1ay9JemJWTVlqVjhCMmh2YmlHS1VQSFpHZWhFcEh5SlN6d2Q0?=
 =?utf-8?B?aXhaaWN6ZFR6Y01INy9OcWlUSUI4NjRTVUhWUnMvayt6cmFDak44QURVQXZx?=
 =?utf-8?B?WFNDRjE0YTBCVW5xRjVEK09samxxblNBcE5HZ0JPUndDbVlrYXV2M1oybU5a?=
 =?utf-8?B?YkI3VmZHY1hMdUcrSFlWOTRWYTBKREl6Q1pQZTVuZUJuK3ZCUEZmOHU2TU1m?=
 =?utf-8?B?K3NPS3lZY003SDd1MXJIZkNkMTlMUDlGSy9uNFpFN3grOWtBdzdJNW5YeElt?=
 =?utf-8?B?THpOR1lBWEswNTliKzMyb1cxUjZwUWtlUDRRS3pWQmRlK3Z2eUUxeWxQUGFi?=
 =?utf-8?B?eXVLamZHUFpWNkM2OGRLVk1IczNCVHNTODdJZWx0SEU1c3BFa3U3YnJIR0dM?=
 =?utf-8?B?S0VUY0Nxc1dOeTl5KzNsT0lhMENZODhRQnYrL2tRQWFoNWJZMzFGd1p4M0lr?=
 =?utf-8?B?ZFRDSlRQb1NvbFJCRitRNm5FaFVudVltaW5VcUR6KzU2RHdyQ20vdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0457cb18-02d8-4cd1-e549-08de73b4fa7e
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:57:06.8785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WQJGgtKkLif0HhJmD/YlizXKCuzYodf1xC2ift3gV44iR59uzM0hbxRXTGgwr9nBsimJDQUuqhSE0svwg8+Ndw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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


On 24-02-2026 17:51, Thomas Hellström wrote:
> On Wed, 2026-02-11 at 20:56 +0530, Arvind Yadav wrote:
>> This allows userspace applications to provide memory usage hints to
>> the kernel for better memory management under pressure:
>>
>> Add the core implementation for purgeable buffer objects, enabling
>> memory
>> reclamation of user-designated DONTNEED buffers during eviction.
>>
>> This patch implements the purge operation and state machine
>> transitions:
>>
>> Purgeable States (from xe_madv_purgeable_state):
>>   - WILLNEED (0): BO should be retained, actively used
>>   - DONTNEED (1): BO eligible for purging, not currently needed
>>   - PURGED (2): BO backing store reclaimed, permanently invalid
>>
>> Design Rationale:
>>    - Async TLB invalidation via trigger_rebind (no blocking
>> xe_vm_invalidate_vma)
>>    - i915 compatibility: retained field, "once purged always purged"
>> semantics
>>    - Shared BO protection prevents multi-process memory corruption
>>    - Scratch PTE reuse avoids new infrastructure, safe for fault mode
>>
>> Note: The madvise_purgeable() function is implemented but not hooked
>> into
>> the IOCTL handler (madvise_funcs[] entry is NULL) to maintain
>> bisectability.
>> The feature will be enabled in the final patch when all supporting
>> infrastructure (shrinker, per-VMA tracking) is complete.
>>
>> v2:
>>    - Use xe_bo_trigger_rebind() for async TLB invalidation (Thomas
>> Hellström)
>>    - Add NULL rebind with scratch PTEs for fault mode (Thomas
>> Hellström)
>>    - Implement i915-compatible retained field logic (Thomas Hellström)
>>    - Skip BO validation for purged BOs in page fault handler (crash
>> fix)
>>    - Add scratch VM check in page fault path (non-scratch VMs fail
>> fault)
>>    - Force clear_pt for non-scratch VMs to avoid phys addr 0 mapping
>> (review fix)
>>    - Add !is_purged check to resource cursor setup to prevent stale
>> access
>>
>> v3:
>>    - Rebase as xe_gt_pagefault.c is gone upstream and replaced
>>      with xe_pagefault.c (Matthew Brost)
>>    - Xe specific warn on (Matthew Brost)
>>    - Call helpers for madv_purgeable access(Matthew Brost)
>>    - Remove bo NULL check(Matthew Brost)
>>    - Use xe_bo_assert_held instead of dma assert(Matthew Brost)
>>    - Move the xe_bo_is_purged check under the dma-resv lock( by Matt)
>>    - Drop is_purged from xe_pt_stage_bind_entry and just set is_null
>> to true
>>      for purged BO rename s/is_null/is_null_or_purged (by Matt)
>>    - UAPI rule should not be changed.(Matthew Brost)
>>    - Make 'retained' a userptr (Matthew Brost)
>>
>> v4:
>>    - @madv_purgeable atomic_t → u32 change across all relevant patches
>> (Matt)
>>
>> v5:
>>    - Introduce xe_bo_set_purgeable_state() helper (void return) to
>> centralize
>>      madv_purgeable updates with xe_bo_assert_held() and state
>> transition
>>      validation using explicit enum checks (no transition out of
>> PURGED) (Matt)
>>    - Make xe_ttm_bo_purge() return int and propagate failures from
>>      xe_bo_move(); handle xe_bo_trigger_rebind() failures (e.g.
>> no_wait_gpu
>>      paths) rather than silently ignoring (Matt)
>>    - Replace drm_WARN_ON with xe_assert for better Xe-specific
>> assertions (Matt)
>>    - Hook purgeable handling into
>> madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE]
>>      instead of special-case path in xe_vm_madvise_ioctl() (Matt)
>>    - Track purgeable retained return via xe_madvise_details and
>> perform
>>      copy_to_user() from xe_madvise_details_fini() after locks are
>> dropped (Matt)
>>    - Set madvise_funcs[DRM_XE_VMA_ATTR_PURGEABLE_STATE] to NULL with
>>      __maybe_unused on madvise_purgeable() to maintain bisectability
>> until
>>      shrinker integration is complete in final patch (Matt)
>>    - Use put_user() instead of copy_to_user() for single u32 retained
>> value (Thomas)
>>    - Return -EFAULT from ioctl if put_user() fails (Thomas)
>>    - Validate userspace initialized retained to 0 before ioctl,
>> ensuring safe
>>      default (0 = "assume purged") if put_user() fails (Thomas)
>>    - Refactor error handling: separate fallible put_user from
>> infallible cleanup
>>    - xe_madvise_purgeable_retained_to_user(): separate helper for
>> fallible put_user
>>    - Call put_user() after releasing all locks to avoid circular
>> dependencies
>>    - Use xe_bo_move_notify() instead of xe_bo_trigger_rebind() in
>> xe_ttm_bo_purge()
>>      for proper abstraction - handles vunmap, dma-buf notifications,
>> and VRAM
>>      userfault cleanup (Thomas)
>>    - Fix LRU crash while running shrink test
>>    - Skip xe_bo_validate() for purged BOs in xe_gpuvm_validate()
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Arvind Yadav <arvind.yadav@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c         | 106 ++++++++++++++++++++---
>>   drivers/gpu/drm/xe/xe_bo.h         |   2 +
>>   drivers/gpu/drm/xe/xe_pagefault.c  |  12 +++
>>   drivers/gpu/drm/xe/xe_pt.c         |  40 +++++++--
>>   drivers/gpu/drm/xe/xe_vm.c         |  20 ++++-
>>   drivers/gpu/drm/xe/xe_vm_madvise.c | 133
>> +++++++++++++++++++++++++++++
>>   6 files changed, 292 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index 8bf16d60b9a5..87cde4b2fe59 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -835,6 +835,83 @@ static int xe_bo_move_notify(struct xe_bo *bo,
>>   	return 0;
>>   }
>>   
>> +/**
>> + * xe_bo_set_purgeable_state() - Set BO purgeable state with
>> validation
>> + * @bo: Buffer object
>> + * @new_state: New purgeable state
>> + *
>> + * Sets the purgeable state with lockdep assertions and validates
>> state
>> + * transitions. Once a BO is PURGED, it cannot transition to any
>> other state.
>> + * Invalid transitions are caught with xe_assert().
>> + */
>> +void xe_bo_set_purgeable_state(struct xe_bo *bo,
>> +			       enum xe_madv_purgeable_state
>> new_state)
>> +{
>> +	struct xe_device *xe = xe_bo_device(bo);
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	/* Validate state is one of the known values */
>> +	xe_assert(xe, new_state == XE_MADV_PURGEABLE_WILLNEED ||
>> +		      new_state == XE_MADV_PURGEABLE_DONTNEED ||
>> +		      new_state == XE_MADV_PURGEABLE_PURGED);
>> +
>> +	/* Once purged, always purged - cannot transition out */
>> +	xe_assert(xe, !(bo->madv_purgeable ==
>> XE_MADV_PURGEABLE_PURGED &&
>> +			new_state != XE_MADV_PURGEABLE_PURGED));
>> +
>> +	bo->madv_purgeable = new_state;
>> +}
>> +
>> +/**
>> + * xe_ttm_bo_purge() - Purge buffer object backing store
>> + * @ttm_bo: The TTM buffer object to purge
>> + * @ctx: TTM operation context
>> + *
>> + * This function purges the backing store of a BO marked as DONTNEED
>> and
>> + * triggers rebind to invalidate stale GPU mappings. For fault-mode
>> VMs,
>> + * this zaps the PTEs. The next GPU access will trigger a page fault
>> and
>> + * perform NULL rebind (scratch pages or clear PTEs based on VM
>> config).
>> + *
>> + * Return: 0 on success, negative error code on failure
>> + */
>> +static int xe_ttm_bo_purge(struct ttm_buffer_object *ttm_bo, struct
>> ttm_operation_ctx *ctx)
>> +{
>> +	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
>> +	struct ttm_placement place = {};
>> +	int ret;
>> +
>> +	xe_bo_assert_held(bo);
>> +
>> +	if (!ttm_bo->ttm)
>> +		return 0;
>> +
>> +	if (!xe_bo_madv_is_dontneed(bo))
>> +		return 0;
>> +
>> +	ret = ttm_bo_validate(ttm_bo, &place, ctx);
>> +	if (ret)
>> +		return ret;
>> +
>> +	/*
>> +	 * Use the standard pre-move hook so we share the same
>> cleanup/invalidate
>> +	 * path as migrations: drop any CPU vmap and schedule the
>> necessary GPU
>> +	 * unbind/rebind work.
>> +	 *
>> +	 * This may fail in no-wait contexts (fault/shrinker) or if
>> the BO is
>> +	 * pinned. Keep state unchanged on failure so we don't end
>> up "PURGED"
>> +	 * with stale mappings.
>> +	 */
>> +	ret = xe_bo_move_notify(bo, ctx);
>> +	if (ret)
>> +		return ret;
> move_notify() must be called *before* pages are actually freed, that is
> before ttm_bo_validate().


Noted,  I will move this before tttm_bo_validate().

thanks,
Arvind

>
> Other than that LGTM.
>
