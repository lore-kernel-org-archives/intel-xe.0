Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BCFC531DC
	for <intel-xe@archiver.kernel.org>; Tue, 20 Aug 2024 13:27:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D8D10E7D2;
	Tue, 20 Aug 2024 13:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="h1VEO7pZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866D610E7D2
 for <intel-xe@lists.freedesktop.org>; Tue, 20 Aug 2024 13:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724160437; x=1755696437;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=wIqJN8AgdElPXUbr5+5x0HRLfrz0yOlq5CqZxWIeX1s=;
 b=h1VEO7pZQtkKe89D7ik9vD4nT7og6+2/6QnrFtkP5dVW6Sa6jB4z9bvn
 +e+hTjfhtV1a4ZjCMMbgB1UO5PceSKlSJ9Tu7fgkNw0WivQGkxZ+KOe9q
 FLafwXu0LnmJCxMXQLVR21EQ9i4X9JMbzmYSNBZmLlBQ2uHKii7MX/jEX
 BI2RSptyq8mNQ8zmTw7rqXB7Jcx14/0BqLYa+v4mz9g0Wb43hfaz0p++/
 VL+peIjSkhaYwy8nFiaYQamEhK0SYZb6HahbW32lQmNUvmssTUu65YXLT
 fffgVilbbYcGSl9OMl2mKdqEyEHStWe9ja3G7dsylM/95n6tI7nFG49NG g==;
X-CSE-ConnectionGUID: OoXk9AcPQoihisa52HiBsw==
X-CSE-MsgGUID: kdjgiEAHTC6QJTJucuHVpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="26329231"
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="26329231"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Aug 2024 06:27:17 -0700
X-CSE-ConnectionGUID: eOJJj3uuQrSKbYW1wYzbtQ==
X-CSE-MsgGUID: hUmi+EPdQGa1LrWhgDJaaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,162,1719903600"; d="scan'208";a="65417729"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Aug 2024 06:27:17 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 20 Aug 2024 06:27:16 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 20 Aug 2024 06:27:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.177)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 06:27:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TeLlijQ7IlvG0AobFuu/krnDcmTDsfSQsyqon89ZvnyM7aCM25HJS2ZQWjRFV0rhjSd1DC+su39pzSCZGsWBAPdHCQS92CMDo+ma5ur9IA9XIpd9obN4hfr5RKUUTJfrO9gcjDTmtHuVDL8e2x8D5qqa/QOhvoS92EE0ZNUXRmjlzaDgNTL4n57HaZj7xgfcvqq1+Ze6i7wOv02XH5j7WlvCXzH6sJwewL30OLgavO+b9G12Dw8cwo0KbX1jixvnDbh5wHrUfWoAOcD7rM/6GWSNh+FJBVlZcNLlf8FfamgQkLL/me3ZP1ZoWJOC04ylFkVgs5hqNYL1EuK1SzJ1uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C1nrNlUuT1H595xIIG39sT1F3ADbxH9y01+zSSn5Nes=;
 b=wf/JNl9zKhLhdHitIMQqbf1hSvaA1AYhXcMjP8flPQ9FKGFoPwP6mms5Fe8F25dMkALx3OArlTk+9iR865bHgRIUGa+6jEl2BpYXkx44PWzHE3jkJ0K7KUG7aLr8JPawA247obIckmFImtE/RHix/qQ/sPqU0ibbgfqRW9yq4ES8O4ixhCHWc5kEL8JHTlOEX08t+gg5cjFMszc3S6LvsQzvZGpMBMIWId68SVhT8dIVQ9ue+AzBlb5aQSC+u7V4OHWeLqpyfHkYdNxxP9fHbY0StCxINqvhPPYvMNy13Bd0QKXdnwNMabTjlQeVRuDgXW08qo/Az0+10Sp6MXzJhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV8PR11MB8698.namprd11.prod.outlook.com (2603:10b6:408:205::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Tue, 20 Aug
 2024 13:27:10 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7875.023; Tue, 20 Aug 2024
 13:27:10 +0000
Date: Tue, 20 Aug 2024 08:27:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 05/12] drm/xe/tests: Allow deferred function call during
 KUnit test
Message-ID: <7u3ppw4gtprap5wkuo4bsuf7r4qrottw2yfmr34n6sefkxxbx6@qpfrpshvzm6m>
References: <20240809165159.662-1-michal.wajdeczko@intel.com>
 <20240809165159.662-6-michal.wajdeczko@intel.com>
 <7x7kzxucmjabvmoxb2x33qcp7gzrvn7ga2gg5vtlrpipntq5rr@pdahgmswbk3w>
 <c79f9e25-6c72-42a1-82bf-7e5ff9911866@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c79f9e25-6c72-42a1-82bf-7e5ff9911866@intel.com>
X-ClientProxiedBy: MW4PR02CA0001.namprd02.prod.outlook.com
 (2603:10b6:303:16d::21) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV8PR11MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: d37afb81-b92a-4746-1b9f-08dcc11bcb99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?GSQhF6KHHV1/DNLJxLXNjQsRLhgDsZYqxfVehWSnlT7AEKozs92cDNHS0v?=
 =?iso-8859-1?Q?kpPsFLlaAFDMgSpSJbjgwmxLg9TqUd/YY1m2HTa09A43MyIa5OQwBC7ZVP?=
 =?iso-8859-1?Q?I7uapGqU5AodvGkh13b0k3I0vAxkFe9pXd3uJ+dBUfhL6IcYJ+CtSeDeDG?=
 =?iso-8859-1?Q?ddxLJjcXwsYjdGnuxo3YZ5qqGZjgXfySBlGSIrLCwXteXqrHnqZ5rliLRz?=
 =?iso-8859-1?Q?ZEz7BuK7VupNvYGEfn6T1aXC3VcYgkyMkSuX/RLn+3irqy+2MSm8gGFRx6?=
 =?iso-8859-1?Q?xIrUhxPRmzF449CXa9PFY88P6xPf/eFeLQ3fGJ+34Rm8Ain9psK/8DuSAi?=
 =?iso-8859-1?Q?646ZxniP81FxsVl13I9yDaK7XpvM4/3Aew0QMkOrUQYjEDmDpO72O+VPo0?=
 =?iso-8859-1?Q?bgper1+TD1Sa9hwiRrR5aQG+4Qv9+aDglm7/q1TuqsQVRVOG/zUqs2Hql1?=
 =?iso-8859-1?Q?gwHpspovHBOn8QjdABouBlQ2qDMBhtVNM1EdZ7dQMGHeFE1j0v9ceORFHh?=
 =?iso-8859-1?Q?NbAKwhPluap4tFlWX9bUtIMMNWaSK/+nYjyaXaR7QveWr8dygz4VTdf5+I?=
 =?iso-8859-1?Q?KrNAyFyaxl7U9wTcl+MDzM2sjDbpqcs2qBPR1h5I5ggdSPOQDjE9U2b0Bg?=
 =?iso-8859-1?Q?OZ1bJ11V+vqDPqaSHodRD/Lhf1jUWbgqkEhw3HJg4aZFcV60w+54kGdbxr?=
 =?iso-8859-1?Q?8YXADsRXsxLKy540wle6dCnKnnsNz7kp8NZQC+VxmDYXYYXDkrENuAfTZt?=
 =?iso-8859-1?Q?kjG8USjSGXa6gqDuGU+occVYnWI9U0tiuckpicokQM+PVgapqfTa8+/EHD?=
 =?iso-8859-1?Q?blRj9mHgRzpgTe2w1Tu92Xs4aPYLdrsz0CxlelQHxl24hOdwp6b8amZRT2?=
 =?iso-8859-1?Q?PWQlzxvVnMSMJ91S77xp93Xn3jZ5wSqjWMDy2PF1+/RmZMQuqv9JWy5SJ5?=
 =?iso-8859-1?Q?d2rDsS+ux536Bk0LC7ASkZeG+K5ordLoZ6fYr2LQz7LLp0kG6SKVsoaDG9?=
 =?iso-8859-1?Q?anltSiW3fKVg68cZK+QLz3o3VJl4KgU6mb6LH6r+mZR8I/woAs7aKKSdAF?=
 =?iso-8859-1?Q?ycp6jlta9g1jBMSEaLK/a1qZFNBt5kZ5BFvEM8JB/o4MplHtiXLarEYxZv?=
 =?iso-8859-1?Q?wJM16tbSTRBiLGsY4QhVd3gl6YRbTsnFqeNFDkl+4AdUfXig+f+FSr3zGH?=
 =?iso-8859-1?Q?zSX9AqE9dylFvOmddKJVecHu3SNxNoDSbFKCeeAUS0CeVXIQtDWvAkgYog?=
 =?iso-8859-1?Q?h4HnyWPcRQ2Y7tTQT/3tMGv9XpRVzSWn3jjJ+TpVLNU8mEyBwuXcrObjjf?=
 =?iso-8859-1?Q?AwCTTYBR2AVMgMNeRzqD4dBQrSHyHO9mGknRR+aTBVDQGwluHfP2mrDBiI?=
 =?iso-8859-1?Q?mL9p7FPhvjQ/BChtbN0CimgkVm37sP4w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?yMH8+NhmSt+C+QHQZF14Oq/cONbjRWPbf0kOD6NNtQmmC1Fq3QCrg7c4zw?=
 =?iso-8859-1?Q?ZpIbhDQ064OhV4uvXEaFdUgPDTRa45Y8wzL8g/BwHJuzhRzihdRl5QcTX4?=
 =?iso-8859-1?Q?ayp+QBjme1zuOCKq0syVxJmu+P7zXeh8J5bDcAw+S9LG/2+52sLw9zEGtr?=
 =?iso-8859-1?Q?XruBCfDwzzCwnj9SKO/ivjcP7oX8UNc0/EVs3qg1rck5Il1psplMKDZQfa?=
 =?iso-8859-1?Q?CCsRTTjWLg6OOi6SVOWb9bJr1xNCtj0S0TZqoRJxok/cRk47Xfm2MYevWA?=
 =?iso-8859-1?Q?/IBCP2V8XPWY5UgBY+wkDgfbtWX4GaVQ5L30uAuzGxWu8ewhFbfcn7e1nb?=
 =?iso-8859-1?Q?4/rtC8oVsI8avWpf+ZKR1h1utZnPw7PsMfP2A2rz770mVM6+y7+gfx9D6W?=
 =?iso-8859-1?Q?UyX8Sd2gOf7tdbveQxxiy33KMbRFXVUzwHQ8x2/rXNg1VarpkabneVBMJ8?=
 =?iso-8859-1?Q?MCBYkyHOIgxyxPqVITgDyPSZkpsWkrKNs382Rac6BMuMs1kVMCQJY06QZe?=
 =?iso-8859-1?Q?Gue5VYAXzDMz7tFEh7j8LrjfRinvBvPGmeZc+m8VixVqA+TjxmUh+0lISF?=
 =?iso-8859-1?Q?GR+4RzBdzNPoingYDNwDT1AevOEwSnDmiHzG+1ATbpd5xZ39dskiegqgmH?=
 =?iso-8859-1?Q?Us9d7HeKbV0y2jRPnRbv8/4TCopI8GfUgMjjrwwS0zyae1sKT857+wKp6v?=
 =?iso-8859-1?Q?Gxl06g/EjOkgwyLYV7xg0BNh0G8tZVEAybtxuLKpxNyBYHqElkxo8I3CmU?=
 =?iso-8859-1?Q?FGlH0HkfSU0ds8sOI9DNGMdlAnXZBF4T2KUvrQL5aAWlwiqrU/G6qKZu2L?=
 =?iso-8859-1?Q?M/IbW/HGHkBHgAtHraN7QR0UwjAShsBZ0xAbOsipWmAAG1bsHJbXZQYFjf?=
 =?iso-8859-1?Q?cMKbAQo29WDpEozk/AzxBfR7of2544PJXoyTijAeAlHwe/3YOU1WVXzyzX?=
 =?iso-8859-1?Q?CY7RJ61MrRvq2+WlQIP9WGYjdebPerzd1NjeHECpr5oDPXyfuGIR2xEF93?=
 =?iso-8859-1?Q?aOBJ1tgW/uUcN6s5jryzskaGIE+xtwKiCa2LfqKO/SQSVuNme5UflIYKjG?=
 =?iso-8859-1?Q?QfqZ6YR53hRZ3j1XQ9Z4Z196BhCaXBkK0UHqtfs7xR4kQpcKyLy0HcVcNo?=
 =?iso-8859-1?Q?wL9ieNfliFzdJV4N8MOfZpPTFC8GTX5EAKrzcVCU9cHP/SZz/RlQpdyHc/?=
 =?iso-8859-1?Q?9jl6xwk1MZVab9jElXkck9j1YK0GWnRPXXktiywfIyV6Gj8fUAwmiDiH/X?=
 =?iso-8859-1?Q?ZTnuF0WTpN+PrHiHNxWBLJfd29GpGZCRaTKRUxkaHsP6a6MIZHJl/WeNr4?=
 =?iso-8859-1?Q?HXjOqec2YbDMObN4DXqHoEM64XCv0qYN7FyvxpwACYAETHqjRFcBduzYNz?=
 =?iso-8859-1?Q?ZHJvoulawOe8617rwOcZkJtK1WVKwMyXboIKUJnsrDRL6mRo+LnZhjXXw1?=
 =?iso-8859-1?Q?r2XCQjFLp+zwO/13qqR5HgYPoJ2gQv3b1i9bkEcAeIJElyHVGXmtyTb5Qy?=
 =?iso-8859-1?Q?+Sg+MWCYCxPdee9wqvAvsTUzMvO686do7JWG7tGSxCt/oKGPCROS0y5+FM?=
 =?iso-8859-1?Q?j/mQ2ojhj9whmi4qtXCOubMhW4xpXCw7SyH0VsSdeVOLRgMnNhXF3kL2Dk?=
 =?iso-8859-1?Q?fFWRcz+xS76x1Ok/jXNWGb1vYDq856jxq7cwgLV3Thl9aTOzIl/frDCA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d37afb81-b92a-4746-1b9f-08dcc11bcb99
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 13:27:10.5420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +3bfsmmBTHMpHGjIeliHfJImo3wZgnZoBVbV3aik4ZQW4sqxlIE2JGpRUCbD/Ig0Ztp4oLfYCT08uazUk2ALI+9rQHYqItESX8AbvGwSH2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8698
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

On Tue, Aug 20, 2024 at 12:23:43PM GMT, Michal Wajdeczko wrote:
>
>
>On 19.08.2024 23:38, Lucas De Marchi wrote:
>> On Fri, Aug 09, 2024 at 06:51:52PM GMT, Michal Wajdeczko wrote:
>>> For some advanced test cases we might want to simulate external
>>> activity that will stimulate function under test. Add set of
>>> helper functions to implement such requirement. Usage example:
>>>
>>>  static void foo(struct xe_device *xe)
>>>  {
>>>      WRITE_ONCE(xe->foo, 1);
>>>  }
>>>
>>>  static void foo_test(struct kunit *test)
>>>  {
>>>      struct xe_device *xe = test->priv;
>>>
>>>      xe_kunit_helper_delayed_call(test, HZ / 2, foo, xe);
>>>
>>>      KUNIT_EXPECT_EQ(test, 0, READ_ONCE(xe->foo));
>>>      schedule_timeout_uninterruptible(HZ);
>>>      KUNIT_EXPECT_EQ(test, 1, READ_ONCE(xe->foo));
>>>  }
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.c | 148 ++++++++++++++++++++
>>> drivers/gpu/drm/xe/tests/xe_kunit_helpers.h |  38 +++++
>>> 2 files changed, 186 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> index bc5156966ce9..8fe1a0918b32 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.c
>>> @@ -127,3 +127,151 @@ int
>>> xe_kunit_helper_xe_device_live_test_init(struct kunit *test)
>>>     return 0;
>>> }
>>> EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_xe_device_live_test_init);
>>> +
>>> +struct xe_kunit_call {
>>> +    struct delayed_work work;
>>> +    struct kunit *test;
>>> +    struct {
>>> +        int (*int_gt)(struct xe_gt *gt);
>>> +        int (*int_gt_uint)(struct xe_gt *gt, unsigned int n);
>>> +        void (*void_gt)(struct xe_gt *gt);
>>> +        void (*void_gt_uint)(struct xe_gt *gt, unsigned int n);
>>> +        void (*void_xe)(struct xe_device *xe);
>>
>> I think the only reason why you're adding this in xe is because you are
>> using xe-specific types. This could rather be done generically by
>> always using int delayed_func(void *data). Then you can simply add it to
>> kunit and get it reviewed there.
>
>while some generic functionality could be always extracted and moved to
>the kunit, for easier use in Xe tests likely we will still need some
>wrappers with xe-specific types, so do we really always need to start
>with trying enhance generic kunit first and then wait for acceptance
>until we can use such extension in our test code?

the other option is that we keep creating a mini-subsystem inside xe and
if we don't push back, the generic part is never done as people move on
to other tasks.

>
>IMO this could be in parallel, so in kunit review we can point how this
>is already being used..

Yes, sometimes it's better to do the concrete thing and
use that to advocate for the generic feature, but we should balance on
how much we want to maintain in the mid/long term.

>
>anyway, will try to split that feature into 'generic' and 'xe'

if the generic part is acceptable to kunit maintainers, we can always
ask to merge that via drm-xe with their acks.

Lucas De Marchi

>
>>
>> Also thinking that the example you added in the commit message is likely
>> suggesting the wrong type of test, that a) sleep too much and b) tend to
>> be noisy
>
>only tests longer than 2s are considered SLOW ;)
>
>and HZ was just picked to have an example small
>
>and you will not see any noise if test PASSES
>
>>
>> Lucas De Marchi
>>
>>> +    } func;
>>> +    struct {
>>> +        struct xe_device *xe;
>>> +        struct xe_gt *gt;
>>> +        unsigned int n;
>>> +    } args;
>>> +};
>>> +
>>> +static void call_work_func(struct work_struct *work)
>>> +{
>>> +    struct xe_kunit_call *call = container_of(work, typeof(*call),
>>> work.work);
>>> +
>>> +    if (call->func.void_xe) {
>>> +        kunit_info(call->test, "calling %ps(xe)\n", call->func.void_xe);
>>> +        call->func.void_xe(call->args.xe);
>>> +        kunit_info(call->test, "%ps(xe) completed\n",
>>> call->func.void_xe);
>>> +    } else if (call->func.void_gt) {
>>> +        kunit_info(call->test, "%ps(gt)\n", call->func.void_gt);
>>> +        call->func.void_gt(call->args.gt);
>>> +        kunit_info(call->test, "%ps(gt) completed\n",
>>> call->func.void_gt);
>>> +    } else if (call->func.int_gt_uint) {
>>> +        int ret;
>>> +
>>> +        kunit_info(call->test, "calling %ps(gt,%u)\n",
>>> +               call->func.int_gt_uint, call->args.n);
>>> +        ret = call->func.int_gt_uint(call->args.gt, call->args.n);
>>> +        if (ret < 0) {
>>> +            kunit_info(call->test, "%ps(gt,%u) reported error %pe\n",
>>> +                   call->func.int_gt_uint, call->args.n, ERR_PTR(ret));
>>> +        } else {
>>> +            kunit_info(call->test, "%ps(gt,%u) returned %d\n",
>>> +                   call->func.int_gt_uint, call->args.n, ret);
>>> +        }
>>> +    }
>>> +}
>>> +
>>> +static struct xe_kunit_call *prepare_call(struct kunit *test)
>>> +{
>>> +    struct xe_kunit_call *call;
>>> +
>>> +    call = kunit_kzalloc(test, sizeof(*call), GFP_KERNEL);
>>> +    KUNIT_ASSERT_NOT_NULL(test, call);
>>> +
>>> +    INIT_DELAYED_WORK(&call->work, call_work_func);
>>> +    call->test = test;
>>> +
>>> +    return call;
>>> +}
>>> +
>>> +KUNIT_DEFINE_ACTION_WRAPPER(cancel_call, cancel_delayed_work_sync,
>>> struct delayed_work *);
>>> +
>>> +static void queue_call(struct kunit *test, struct xe_kunit_call
>>> *call, unsigned long delay)
>>> +{
>>> +    queue_delayed_work(system_wq, &call->work, delay);
>>> +    KUNIT_ASSERT_EQ(test, 0, kunit_add_action_or_reset(test,
>>> cancel_call, &call->work));
>>> +}
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_void_xe_device - Queue a function
>>> call during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_device function to call
>>> + * @xe: the &xe_device argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_device *xe),
>>> +                         struct xe_device *xe)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, xe);
>>> +
>>> +    call->func.void_xe = func;
>>> +    call->args.xe = xe;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_device);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_void_xe_gt - Queue a function call
>>> during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_gt function to call
>>> + * @gt: the &xe_gt function argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_gt *gt),
>>> +                         struct xe_gt *gt)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>>> +
>>> +    call->func.void_gt = func;
>>> +    call->args.gt = gt;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_void_xe_gt);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call_int_xe_gt_uint - Queue a function
>>> call during KUnit test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_gt function to call
>>> + * @gt: the &xe_gt function argument
>>> + * @n: the function argument
>>> + *
>>> + * This function uses KUNIT_ASSERT to detect any failures.
>>> + */
>>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         int (*func)(struct xe_gt *gt,
>>> +                                 unsigned int vfid),
>>> +                         struct xe_gt *gt,
>>> +                         unsigned int n)
>>> +{
>>> +    struct xe_kunit_call *call = prepare_call(test);
>>> +
>>> +    KUNIT_ASSERT_NOT_NULL(test, func);
>>> +    KUNIT_ASSERT_NOT_NULL(test, gt);
>>> +
>>> +    call->func.int_gt_uint = func;
>>> +    call->args.gt = gt;
>>> +    call->args.n = n;
>>> +
>>> +    return queue_call(test, call, delay);
>>> +}
>>> +EXPORT_SYMBOL_IF_KUNIT(xe_kunit_helper_delayed_call_int_xe_gt_uint);
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> index 83665f7b1254..ec5287947ee4 100644
>>> --- a/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> +++ b/drivers/gpu/drm/xe/tests/xe_kunit_helpers.h
>>> @@ -9,6 +9,7 @@
>>> struct device;
>>> struct kunit;
>>> struct xe_device;
>>> +struct xe_gt;
>>>
>>> struct xe_device *xe_kunit_helper_alloc_xe_device(struct kunit *test,
>>>                           struct device *dev);
>>> @@ -16,4 +17,41 @@ int xe_kunit_helper_xe_device_test_init(struct
>>> kunit *test);
>>>
>>> int xe_kunit_helper_xe_device_live_test_init(struct kunit *test);
>>>
>>> +void xe_kunit_helper_delayed_call_void_xe_device(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_device *xe),
>>> +                         struct xe_device *xe);
>>> +
>>> +void xe_kunit_helper_delayed_call_void_xe_gt(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         void (*func)(struct xe_gt *gt),
>>> +                         struct xe_gt *gt);
>>> +
>>> +void xe_kunit_helper_delayed_call_int_xe_gt_uint(struct kunit *test,
>>> +                         unsigned long delay,
>>> +                         int (*func)(struct xe_gt *gt,
>>> +                                 unsigned int vfid),
>>> +                         struct xe_gt *gt,
>>> +                         unsigned int n);
>>> +
>>> +/**
>>> + * xe_kunit_helper_delayed_call - Queue a function call during KUnit
>>> test
>>> + * @test: the &kunit test case
>>> + * @delay: number of jiffies to wait before queueing
>>> + * @func: the &xe_device or &xe_gt function to call
>>> + * @args: the &xe_device or &xe_gt and other function arguments
>>> + *
>>> + * This is a helper macro that compiles into dedicated function call
>>> based on
>>> + * the provided argument types.
>>> + */
>>> +#define xe_kunit_helper_delayed_call(test, delay, func, args...)    \
>>> +    _Generic(func,                            \
>>> +         void (*)(struct xe_device *) :                \
>>> +            xe_kunit_helper_delayed_call_void_xe_device,    \
>>> +         void (*)(struct xe_gt *) :                \
>>> +            xe_kunit_helper_delayed_call_void_xe_gt,    \
>>> +         int (*)(struct xe_gt *, unsigned int) :        \
>>> +            xe_kunit_helper_delayed_call_int_xe_gt_uint    \
>>> +    )(test, delay, func, args)
>>> +
>>> #endif
>>> -- 
>>> 2.43.0
>>>
