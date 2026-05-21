Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E24BCD4F3D
	for <intel-xe@archiver.kernel.org>; Thu, 21 May 2026 20:12:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C29F410E630;
	Thu, 21 May 2026 20:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f8AA055w";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC7810E630
 for <intel-xe@lists.freedesktop.org>; Thu, 21 May 2026 20:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1779394371; x=1810930371;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:content-transfer-encoding:mime-version;
 bh=+vsB2oRLIRaO/nz3ljilWcWt2lwsC2B+61qF3OnmNCU=;
 b=f8AA055wZmdHgVDAkFc/OV/tVvCGbsE2JLOUEgBalUsIkGXOhXrxKGYx
 3ZCDE27j+G93wh0tx7iKdE0DH3JBj/E0RwJoie9OXJskNveI6Gsd6D8AC
 08hruqiv3lXAb56U8bqNGM/B33EE0fJ7aYz4osqfue8OmGHORyrLzGS2D
 3FpZ+xVAjaTVUOTVyHeW6LFMjmxy/2hfRBrccFOgNBgiRrgzX+r05nB85
 OzynNdSnmzfCKgoc5UbimatIrd2bOhy77paKJN0HXZxlpft9BDM5EHxIn
 q0V4K5JvssnLWp3kNPyrxcrSWmU1yW7G9uASgxt64nSkAQ2xPvOXKZdMj A==;
X-CSE-ConnectionGUID: wvqbYAQoQlGVAATFTfbnkQ==
X-CSE-MsgGUID: wM8MWPCVQvWSyyhHK8bSCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80304868"
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="80304868"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:12:51 -0700
X-CSE-ConnectionGUID: QAYEh9QOTSemOZKSgT302g==
X-CSE-MsgGUID: OPdsJnf9T9GBkRcrivz5EA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,161,1774335600"; d="scan'208";a="244915598"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 May 2026 13:12:52 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:12:51 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 13:12:51 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.37) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 13:12:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeFDUTWWyRCd2znCIEErLF7lvVuwOIFSEhH8Ny/sl6IN2fcADbdMw2gnLkCcOoureStL7gr1hKuvJ5SYiqeGb9cTn6bVLwjGwKcZDUaNjNahhT+EIyL35dAksOrDgQi5YXdV4GuesJzqy/B+Y8FSr5cDgJotpph+/XT1TLJhHcXcRGLtKTzBy7gRRlUfEVzGzh/1g5E/AB9hzuhR75gncC51aSUQrMT85ERG1L/W35oILQgYDjJR3DRxe9m8LXUTt0Lif9Gm8CsM1FJ0IiAwekEpSgLAZ19qH/PUigMRoWf7zCHaAGsEw4neQEtPjTdYbIBLMtiwubEU3ca5tcJ8jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kh0GPGln6lFWJ1bDl1YufPPDzF+32KOxm15kOZZSOSc=;
 b=cm6XQ4T8n0lspiH/NbJQRjY8tbpkciUa22hJQo+48YW1t044ngNrsMjmgmr/jX2vjLB8S/U34/PaLx4/n7RtdRT2ph4hI0C6r0gCFU+tTPil2FQbjjItx8Qd1yu+q/RP+aFGwi9huZxZFw/4IflVuGnoTkQvbyBOLWFagOiRyRRP4Wqh3xh+0nTuKbbotb1J4ZmJ4rtQszMX/ipTsgHaY1aILDEUHR8YlVfmhbl/1INt6x05XWhqpK6+mp4XWRUqdPLnAQD7LvE0JUpzva2xAeJo8eZ5MJfuNhZv+TSeq04ckMA5XCdGNz6oAobkA8F4440ul9F7tcTkqgX5jOX/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by DS0PR11MB8116.namprd11.prod.outlook.com (2603:10b6:8:12b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Thu, 21 May
 2026 20:12:43 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::a0e5:e99c:ee7b:620a%5]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 20:12:43 +0000
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: Violet Monti <violet.monti@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Violet Monti <violet.monti@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe/rtp: Ensure gt_was doesn't evaluate rules
 with engine types
In-Reply-To: <20260519193216.546048-8-violet.monti@intel.com>
References: <20260519193216.546048-6-violet.monti@intel.com>
 <20260519193216.546048-8-violet.monti@intel.com>
Date: Thu, 21 May 2026 17:12:39 -0300
Message-ID: <87bje8sers.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR13CA0118.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::33) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|DS0PR11MB8116:EE_
X-MS-Office365-Filtering-Correlation-Id: cec5a669-d8e2-4073-5d39-08deb77550f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|6133799003|56012099003|18002099003|11063799006|3023799007|4143699003|22082099003;
X-Microsoft-Antispam-Message-Info: ktle7tDQ3q/zmolH3T3EzGLm2XWai/kTOJLxnCaPn14ifutU1Y3ASdVvKkavjSSly34XmKxPeOdddnPQ84ly++SW9tBf+cPZXTLwxplmh/oLconhYIRfLKmGcexKam+Lphc7WHC80hb4ysdXnF5IU5PVfOXRAWvfWdFWsDrrCsGq0P3+jeXN3VWpGs04MNPX3c65SBRiOhtnzxTqoRW5WIpy9eSyNHAP0A4GOHf0g5FtG7SFtJthiRHRQpZ7JfbsFe9Y/2EHoqH5mCD9ubwrR4M58hW9PXWO9ouDsmm78HS7ZjfsTlfo0iONSstJ91SkVWlPVSx77VIgrMQ8AoHt5hPkGwFCEdnmoW8XG0lfnutO7ckPETMDgfgYhNbkGTZHw00TlrjS8X2IV0PQBmH2QFI8HnH7ixcXBbFoqGUQNLGqEJFp7ullpO3wyx4MOgSn6MDuhntxvGZMVP+AYqgfqaeBmS/mG+2KC+LAW0cbSnwE6jFYFkx5u741DRzIhxJ+AeCHwUeHf6T4ItRqkMjpbRoodl4AE6PKm02RVOHQVjuJzAHHs/s4JVn5pWkE95c/aU4QivDt8VDO0lBkQQOhtGTr1DEHLG4eLhRaGT9STl06VS9mN24bpkKf8pCf1T5a4rOUVsxW2MBbaxM9A1s3eXcj7nvsRUGFtqcguwkRKcN66gZ3AwD7vAKW3zySkFD7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(6133799003)(56012099003)(18002099003)(11063799006)(3023799007)(4143699003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y05FeFRsTGI0aFUvUDhmeVp4TENHOUptTVRBelRPZjQwY2NUZHNIUE1JamRN?=
 =?utf-8?B?dGxBTGRIeHUvQ1E1N21pbW9kU2NFWjg5dmZZZHgzNnpaUFJvS3Qzc1NhZWpk?=
 =?utf-8?B?bHFUa1lieDM0bkNRYXJtTHZBbHJIVDhtZHNWcGhyOGc5S2JqOTZwL01nZDFy?=
 =?utf-8?B?eFJFcEJUcGxDOEJibVEvN054MGhBWURQd0MzNlVJRWZFbGJ6ekc1NWlBUFlI?=
 =?utf-8?B?TGRtWDNpTVZxSVhrYk9uejlaZUppRFg2RnFmVGQrdVphSzJ1YU1OamJpRnNR?=
 =?utf-8?B?bHNZd2lVbFhiVHg4WHFQR3I1b1J3b09CTW1Oem1NTCtlS3BWVlRiYy9vaW5C?=
 =?utf-8?B?OG1zT29DckY1YlhpWEV6dmtTV1VVaTVtZ2dvaVYyMnRVMUVwMi9JYlpUMGxp?=
 =?utf-8?B?WEVZcUIrNkl2TFZPUGZSdU11WFl5dFVwOW5BWjBpOThlRDZodHc2dXNwd2F2?=
 =?utf-8?B?cTVJTk41VTEzUVZKY2pSTStHdVo0UzV0TU1QdVJVNzhBRVJWbGdseEp0WTZD?=
 =?utf-8?B?TkVqUWdhVkpZSEozV1NXOG9TNTR5cWxIbWx1QWVuU1k0Tk9jTlk4MitRSStj?=
 =?utf-8?B?MTRuMnhiQkUvYlp2K0xFNzNkTXJFSUg3b2RBR3laV04yNjVRVTNXaG84VFVi?=
 =?utf-8?B?Rlg4RDRtUnhJSVNwekRjZ3h6aUVWMGlENTJSaitLeVg4cEtndnZDNEs2ZWRI?=
 =?utf-8?B?cDMzT1VWaWV0Zk9XeG9EZm5XUEErdk9KbkM5czI0bHZzWi9uMWNuOTNzTzB3?=
 =?utf-8?B?VUEwTjdhaTJyc1JJb1lBRXMvTERtUE5Iamg2TU9TY2Q4Rk1qVjRMbmx1YTNV?=
 =?utf-8?B?bzZTeWxBS0h5RzZKdGY0VEd6MUNtOTlPRS9FVFo4Q1h0Y2VnL1BnZElmMW56?=
 =?utf-8?B?dUc3eHAwMmRTZ2xFUjhlbTZhRWRFaHkxS2hHN1hhM0hRL0VHQTROR3pGbkMx?=
 =?utf-8?B?dGt0aXBIK2ZZNWM5V1hFTGQzaXZ6Tm1LUHluVGdYVVptQWVpSE1adW43RzFq?=
 =?utf-8?B?aWxndmNaRDRCK3RCeS9QTjg1eFpyMkQvU2c0T0o2ZXYvUCs5bGFzT0IzUk1G?=
 =?utf-8?B?a2s1ZzNOcjdzNVdnY2RzOER2VjAwWTRTTEdveU5GZCtRVVVQcENndHc4Qm9v?=
 =?utf-8?B?TGlReEtySlFXWi9nUU5SMWorNHJpQ2pablNCLzZBUUpFZFgwd3JrR1N0Tm1W?=
 =?utf-8?B?YUg5Rlpqb25NdlgvQjIxWTFYaHRoQ0wxVExpV2tLWmlMUDZyZ0tUeE1USjdt?=
 =?utf-8?B?dkRCMEVzZmY4WHkzRXFrRjVZQm5RL1VqNTVyTEVNVEovaGl2TzVacVNNbXEy?=
 =?utf-8?B?ZldSZ3dxVThZQnp2OStRMWZlNlpqSzBoZ2lWbHBvcXRWVzk5N05wV1Rrd0h6?=
 =?utf-8?B?Q1JBdEdFKys2Vm91UDZjVWtUMzZxaTJ3SHdyaVR1Rkk0Z1Y5SHFBaldqUS8w?=
 =?utf-8?B?MzI0T3BlYjE1N3AzdHhRbnA1UWtCVEtoZGNOVUxlZFJlYUo1cThUcWl3eCtu?=
 =?utf-8?B?d1grOXBJMzJiTk9Za2x0UmJHUFh0cC8vQUFEbWJHaXN0YXlWa0pzT05sVjJM?=
 =?utf-8?B?ZUVXNlNiRitXT0NuVW1YZEppTHprN1FUNXpVZ0lhSHY3azlnOU82WXoyanll?=
 =?utf-8?B?d0RhZ1RyY2xlcHVKRFYvTlo2VUp1RzEyTndyOEpYNDlmTjVBbkh1NE4zQm9p?=
 =?utf-8?B?aUtjc1hUOU5EZDJxSlhjdCtBbzNZUW9nZ0J4K3FYY01pWjZyQ1BUSk4yQjNO?=
 =?utf-8?B?RWwrT29za2tRMW5IYkpIa0NMaFl2cHRUeDdQNXBmZEd6OTQyak4ydzRMSnVh?=
 =?utf-8?B?OFExZ0hQU3hCMzY5RWQ1eXpXUUMyMFRTdGF4ajMrdXJ4dDRQNFVROHQzaVJt?=
 =?utf-8?B?RnY4cndHVnBlOGJ2VFIrRStkZzJOWkxXaGM1NS8rNjRMUDVWMkxoVFpoZ0p4?=
 =?utf-8?B?ek1mdFZDWmJxZzVyY3RmMXQ1NDlFdzVnS3FUTzdURldEYnhSbmhYUzF0ZlJo?=
 =?utf-8?B?SGY4Y3Nld3I5Uzg5ZHR3YkJndk1PYU5KNE9jVVhCY3hZNkNjdENXTHpRaXYz?=
 =?utf-8?B?NUpuUkp3dnBTQmR6SWo5ckI4WWduUnNKN2phNlVaQzVVUWJMV2RHeVQ1SGZJ?=
 =?utf-8?B?N0ZVWnp2THNXNzY0OVJoakgrcnMyd1JrWVNabkJuQitnYnJueW5aTHE2aWNr?=
 =?utf-8?B?ZDVjMzFMR0JLWEJqenlVU2Z5bllSeTdQUWtYM1E5T3h5ZFl5bUFzZ3VIdjRs?=
 =?utf-8?B?MWdWNnJvZStISzRhaDZVRkxuQ3N3ZUhGNmpSRjlPYVo2Tjd0S0ppS3RMNzE3?=
 =?utf-8?B?MDVRSGVoNzJSV0ZpZVBsRlRrbnI0cURkK2xvUkVxQmw1RjBFWnROdz09?=
X-Exchange-RoutingPolicyChecked: ELgTxRZT4wpll3nrLYyYqW7xYsqPs5SvOLYfw28e15oZrEqfhJ8VNNFE7MckwoTjifzo1RcIQNmA/xb+5F0SUI2M2C+3CqCYqsCYv2Lqujo7NNLUgt70Ok3JgoKLClBkZcBcQkpREatnQaUgHloXE2IV7aMOZvUBnEZ5JKG7dqnLkv/ZaJaEt24BY/Ju4QKWaQOMSukzRJ7lHswbsX93BopMQYRih1OOwdmh9/2jSGHk7+DHUqJDzSxtYqvp53jtly3zvgvs6D6wzCGbH1f4J28PZEh83hh1CfKUl1M/NYxTHQybejQlXtU6SOSWj7pPRW2/7VjO7nP+VIphydISvw==
X-MS-Exchange-CrossTenant-Network-Message-Id: cec5a669-d8e2-4073-5d39-08deb77550f4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 20:12:43.3281 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A/kKgaSvy10f6hgHVh9uaFOImHF3oFcUKzGQAgpRVNjoCiG8eCjcZ+r5VlhHqzsXU3lwY3naKNE52Dh4/pyTXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8116
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

Violet Monti <violet.monti@intel.com> writes:

> It is currently possible for a RTP rule, and subsequently a workaround,
> to expect contexts that may not be present when the workaround is
> applied. For example, the workarounds in the engine_was[] in drm/xe/xe_wa=
.c
> expect an engine entity to be active. Conversely, the gt_was[] is not
> depending on an engine entity to implement its workarounds. This kunit
> test addition checks the gt_was[] workaround list for any workarounds
> with XEP_RTP_ENGINE_CLASS() rules. If a workaround does have one of
> these rules, the workaround is then checked for the "FOREACH_ENGINE" flag=
,
> which ensures the workaround is implemented properly.
>
> The result of this test is an expectation failure if a workaround has an
> improper XE_RTP_ENGINE_CLASS() rule setup, and aims to prevent future
> issues of gt_was workarounds being applied without proper contexts.
>
> v2:
>     - Moved contents of xe_rtp_tables_test.h to .c and removed file
>     - Renamed macro RTP_KUNIT_ARRAY_PARAM to RTP_TABLE_PARAM
>     - Removed unnecessary functions and iterative components from
>       generated _gen_params functions and implemented usage of table
>       name and WA number as entry name
>     - Condensed xe_rtp_table_gt_test() to use KUNIT_EXPECT_TRUE with no
>       message statement
>     - Removed xe_rtp_table_test_init() and xe_rtp_table_test_exit() as
>       fake device initialization is not necessary
>
> Signed-off-by: Violet Monti <violet.monti@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/Makefile             |  1 +
>  drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c | 55 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_wa.c                    |  3 +-
>  drivers/gpu/drm/xe/xe_wa.h                    |  5 ++
>  4 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
>
> diff --git a/drivers/gpu/drm/xe/tests/Makefile b/drivers/gpu/drm/xe/tests=
/Makefile
> index 0e3408f4952c..f7aa47f11a36 100644
> --- a/drivers/gpu/drm/xe/tests/Makefile
> +++ b/drivers/gpu/drm/xe/tests/Makefile
> @@ -9,5 +9,6 @@ obj-$(CONFIG_DRM_XE_KUNIT_TEST) +=3D xe_test.o
>  xe_test-y =3D xe_test_mod.o \
>  	xe_args_test.o \
>  	xe_pci_test.o \
> +	xe_rtp_tables_test.o \
>  	xe_rtp_test.o \
>  	xe_wa_test.o
> diff --git a/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c b/drivers/gpu/=
drm/xe/tests/xe_rtp_tables_test.c
> new file mode 100644
> index 000000000000..01d2bc6e8aad
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/tests/xe_rtp_tables_test.c
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright =C2=A9 2026 Intel Corporation
> + */
> +
> +#include <drm/drm_kunit_helpers.h>
> +
> +#include "xe_kunit_helpers.h"
> +#include "xe_pci_test.h"
> +#include "xe_rtp.h"
> +#include "xe_wa.h"
> +
> +/**

So, the macro is used only internally and simple enough that I
personally think we don't need the comment.  But, if you think that will
be useful, I'm fine with it too (but it does not need to be a
kernel-doc).=20

> + * RTP_TABLE_PARAM() - Define test parameter generator from a RTP table.
> + * @table: array of test parameters which includes a n_entries value

The input is the RTP table, no? And then the function will generate the
test parameters from the table.

> + *
> + * Define function @table_gen_params which uses @table to generate param=
eters.

If this were to be processed by the kernel documentation generator, it
would not find @table_gen_params.  Not sure about what would be the
alternative here.  Maybe just spell out the CPP syntax here? I.e. Define
function table##_gen_params().

> + */
> +#define RTP_TABLE_PARAM(table)						\
> +	static const void *table##_gen_params(struct kunit *test,				\
> +					     const void *prev, char *desc)			\
> +	{											\
> +		typeof((table.entries)[0]) *__next =3D prev ?					\
> +			((typeof(__next))prev) + 1 : (table.entries);				\
> +		if (__next - table.entries < table.n_entries) {					\
> +			scnprintf(desc, KUNIT_PARAM_DESC_SIZE, #table "/%s", __next->name);	\
> +			return __next;								\
> +		}										\
> +		return NULL;									\
> +	}
> +
> +static void xe_rtp_table_gt_test(struct kunit *test)
> +{
> +	const struct xe_rtp_entry_sr *entry =3D test->param_value;
> +
> +	for (int i =3D 0; i < entry->n_rules; i++)
> +		KUNIT_EXPECT_TRUE(test,
> +				  (entry->rules[i].match_type !=3D XE_RTP_MATCH_ENGINE_CLASS &&
> +				   entry->rules[i].match_type !=3D XE_RTP_MATCH_NOT_ENGINE_CLASS) ||
> +				  entry->flags & XE_RTP_ENTRY_FLAG_FOREACH_ENGINE);
> +}
> +
> +RTP_TABLE_PARAM(gt_was);
> +
> +static struct kunit_case xe_rtp_table_tests[] =3D {
> +	KUNIT_CASE_PARAM(xe_rtp_table_gt_test, gt_was_gen_params),
> +	{}
> +};
> +
> +static struct kunit_suite xe_rtp_tables_test_suite =3D {
> +	.name =3D "xe_rtp_tables_test",
> +	.test_cases =3D xe_rtp_table_tests,
> +};
> +
> +kunit_test_suite(xe_rtp_tables_test_suite);
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index b9d9fe0801aa..1a1e04215f21 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -130,7 +130,7 @@
>  __diag_push();
>  __diag_ignore_all("-Woverride-init", "Allow field overrides in table");
> =20
> -static const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR(
> +VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was =3D XE_RTP_TABLE_SR=
(
>  	/* Workarounds applying over a range of IPs */
> =20
>  	{ XE_RTP_NAME("14011060649"),
> @@ -307,6 +307,7 @@ static const struct xe_rtp_table_sr gt_was =3D XE_RTP=
_TABLE_SR(
>  	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
>  	},
>  );
> +EXPORT_SYMBOL_IF_KUNIT(gt_was);
> =20
>  static const struct xe_rtp_table_sr engine_was =3D XE_RTP_TABLE_SR(
>  	/* Workarounds applying over a range of IPs */
> diff --git a/drivers/gpu/drm/xe/xe_wa.h b/drivers/gpu/drm/xe/xe_wa.h
> index a5f7d33c1b32..17dff615e507 100644
> --- a/drivers/gpu/drm/xe/xe_wa.h
> +++ b/drivers/gpu/drm/xe/xe_wa.h
> @@ -6,6 +6,7 @@
>  #ifndef _XE_WA_H_
>  #define _XE_WA_H_
> =20
> +#include <kunit/visibility.h>
>  #include "xe_assert.h"
> =20
>  struct drm_printer;
> @@ -24,6 +25,10 @@ void xe_wa_apply_tile_workarounds(struct xe_tile *tile=
);
>  void xe_wa_device_dump(struct xe_device *xe, struct drm_printer *p);
>  int xe_wa_gt_dump(struct xe_gt *gt, struct drm_printer *p);
> =20
> +#if IS_ENABLED(CONFIG_DRM_XE_KUNIT_TEST)
> +extern VISIBLE_IF_KUNIT const struct xe_rtp_table_sr gt_was;

The VISIBLE_IF_KUNIT here is unnecessary and doesn't make much sense:
that macro is about adding or not the "static" keyword in the
declaration and should only be part of the variable definition in the .c
file.


--
Gustavo Sousa

> +#endif
> +
>  /**
>   * XE_GT_WA - Out-of-band GT workarounds, to be queried and called as ne=
eded.
>   * @gt__: gt instance
> --=20
> 2.43.0
