Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D17AAD2A532
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 20:55:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 733B210E9CA;
	Thu,  4 Dec 2025 20:55:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="agzvQ75G";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CBA010E223
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 20:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764881726; x=1796417726;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=MtCSJ9iMRXzBBWsqXiTtgEjE31DcNQI4e4UgvjxAHNM=;
 b=agzvQ75G8P996KxF610K07wXzG2RxU0gRpYJG8pRRqVQrer7PbvS/fir
 WrzGSOzclfsAtZerjN2vXfJcvt7jT+VMTCgfx2IDbkFgMMrEWLJ1S9NCB
 zZpJ4B3LZ/hVSC+cZDtKNQK6xmdQP1ekGGiEjUFBy5zmHr31/h8RAv1mx
 /8CkKPDZTMeRb3Z6eiIo8S7vbTJECXBf8yHYjuBhCr9oaK+d01ljf6wW+
 bcR/Q2S+N1svoRQaZ38j48KRc0oWU+JMHVL/Go+xZxU3eujvYOJqeKjT/
 sYMHqFDX1F4W95ZDlCI322SZItC+yo36Fx66T0UYMgVqSC6bf+TjscDci A==;
X-CSE-ConnectionGUID: DHmDzDm0TE6psA5EDqlDHA==
X-CSE-MsgGUID: itRByFfMSx+MGFPqRyt2fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="69511263"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; d="scan'208";a="69511263"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:55:25 -0800
X-CSE-ConnectionGUID: HjMxlWysQi272Nyw8zuC0A==
X-CSE-MsgGUID: u+lpWU0TTE27teBiEpIqRQ==
X-ExtLoop1: 1
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2025 12:55:25 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:55:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 12:55:24 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 12:55:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FWfDQandNqHZVHRJYihqSh+Z1MuIG6OJ5KnOhnC+MMoksxc+rBboyloVoK9PQLKKqSLcq+outtmOqruGiCpkB9dYDmu0Mjq5PgxZ3YzDSFh7l/dsiWU/vTbN60JliDfpphE+DYRRKqzzYXSqRb/u8nlShgfVMYEbwJ1Cnder5+KuEFK9qse6u4LXz5XwDttJXQrQhppJKJzBO4g/mjYUjLBTgmYb3OcNBO1cUU3BmUJS3yWqT3CNSSChYFKZke0/KRlW3I9wwZb7cMKfQZx7TqNLNZTeFQG8IwIEDJKJlnEEcERdd9m334WPLAAy0b+Hprovj9F4/FmLVz3GVmaA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+MSNCMpPlua0cmeAtyqp3aSmcM4cWGjQhHNMjBh0aAA=;
 b=VumO7OTzKLaGTRDYaZrZPVRyQTtbouGI2VByQTddL+WS8PuTIn3zo31z7xFA47jyspqEVXgdNUIKmCgpNVPS8VYso/YNv8LTstu2uZVOQXxI8Uy76wMFCnicOcSF8zte82uZYb3mRnMEBD4H+y+B/7ZsMaArEfa26UUqnjrzAGZtJCT2HzI5Cckhi/bYzz0yRCAQkzt/f7RYuwJI2MyL2Z4JjoAPzBJmm/0UMumZP1sAjR2EhI4wwMlqt1SjQ/VXB2GrJmBbe/hErLf1DIYk8tsFO/2ou7zDuuelNvW1TJIoO7UF15WYzAqGUUR8PRpQau70CVrHNTBSywHnrRI73A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB8181.namprd11.prod.outlook.com (2603:10b6:8:159::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 20:55:22 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%6]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 20:55:22 +0000
Message-ID: <c9ceb550-114d-43d6-a2b7-6db71378227a@intel.com>
Date: Thu, 4 Dec 2025 12:55:20 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/6] drm/xe/guc: Add GuC log event buffer output in LFD
 format
To: Zhanjun Dong <zhanjun.dong@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20251127170759.2620994-1-zhanjun.dong@intel.com>
 <20251127170759.2620994-5-zhanjun.dong@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20251127170759.2620994-5-zhanjun.dong@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0148.namprd04.prod.outlook.com
 (2603:10b6:303:84::33) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: 416190ff-77bc-46f0-1153-08de33777115
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUoxeFNzREFVM0xDWkNTV0RPaFA2b2RMME11UzJiUjB1bm9yOWxkYUFyNXd4?=
 =?utf-8?B?T3BmODRlMldFRlRVYjhMMWpUVUhsUU4rZWpwU1dpSDBDamdTeWRTOTY3c0k1?=
 =?utf-8?B?czlZS1JvQW5BMlhiSkxMNktoWEZLdFhyZEZuc1FRL0ZZTSt6NlNuNnVmRmtp?=
 =?utf-8?B?YjRnd2FVaGVUQlU5RUltTkhFOEhRVVdmWHNhdHhiVXhKUWduZFhwWHpCVWlk?=
 =?utf-8?B?dFNtTXkvQzhrQWlONHltcmQ5RjNKdzBkQ3hPYnJTYzVCM25YbEdGcmgzYnZE?=
 =?utf-8?B?cG9VNVpVV2Q1TVVaYi9RRk1YNElXQXBCQ0hNRVk0U0JiaFlWNnFZQ1E2MEFv?=
 =?utf-8?B?RGJPY0FoNS9JMUoyeUVzR1ZBVlV2VlBXVFBQVEswaEh0elBSVFVPS2VOY3JJ?=
 =?utf-8?B?SVB0cnphNGdwS3MxSlNUdE5SMnZKYWxheUNhZUFpNExkbHFqZ1NzTXJRakp1?=
 =?utf-8?B?L2xUMTFnTVlQQktMK3F0WVBCRE1pR3hrTFFUbzMwZlpmYU9MRjBjSithZTZn?=
 =?utf-8?B?dWpxMnN3d3lpMlBxOEovRUVBa2lWOERQVllOeVBzeHFGSTJWY2VQcThheU5M?=
 =?utf-8?B?Y2duZ01CemxxTGxON0tuT0Z3K0UyTmFYdE1DVmZma0lUYk9hWC8xNitOeEEr?=
 =?utf-8?B?UnpUTW5Cb1hwQXNTWFdXbGF5Wkp5VFgyNXo2d3FWSGlKRk44a1dpbTVqQVdS?=
 =?utf-8?B?V2FrOVV3RUdqVHllTEZ6bnFJSUozbmh3dXQxM3ZZN3VRaVUrNkZJa01qZ2d6?=
 =?utf-8?B?azNUQUJ1MHFQOGJKbnEzM3Q1eTExSkUvZU51c3pZUS9qOTRtbzFBQm9pSFN1?=
 =?utf-8?B?V1cwNlpFdWhEWHkrWXVHTGIxTU0rQU9naW16T0QrN1dSUFhxLzkzbnI1LzFQ?=
 =?utf-8?B?UnNUUHBsRUxEZjNhTkluVUx6ZWcrQytKbVBEVHR3V0xuZ0tNSnFPZHpieVEx?=
 =?utf-8?B?YnRXcmFxclNuWWJSb0E5dmxIVThBdU4ySzl3L0ZGK2RqMXQ4VElEOHpiTVJK?=
 =?utf-8?B?VFdvbG55NFlTbXN3R3BDN3orN0hIR05Ld09SaHlmM2szTVl6bXJ1bkh2K3ZS?=
 =?utf-8?B?R3RuUWRLOVcveTlwUE1RRVF0bzlhTkhuK3NCZ2NvLzdOK05TL0gyblZLNFo0?=
 =?utf-8?B?dmpvQlpSbWp3TjBVUE5VdUhyVzVOU0hudjJ0WG9RbHIxYjVXd2dyaXZKVlEy?=
 =?utf-8?B?MWRaN0lRTVhsd05tYTlsQ1phMGgxZTd0MjZna0R2UHpOOU5CcmRCbXZIaEo0?=
 =?utf-8?B?L2xseDRvZ0RHc29pSllFdnNJVTdYNzVnRTZ1aExXRG9FSFFUYVdJZitkaDh0?=
 =?utf-8?B?NnZ5TXBzckF6VDFJemFsMnZUUUhsaVpFTGJUNnJkdEJIaXdCT1JBYVNUQ1lF?=
 =?utf-8?B?RDhzTVJxR2llYmc0Yld5cy9iTC8zUjFXWHJ5dktrSlh2T2ZjN0Q3a05NbWl1?=
 =?utf-8?B?V2FlL2NUSmdnSTJSZGxtOXFGZlFYdUpWUTIwNUk3U1VvaENnb1JZdzE5RXFo?=
 =?utf-8?B?TGo4ek9ZbVJjdnAzTlFTNUF6TjVlNDRjZFNkamRjRlNMNTFyRk9JSjNwOFR6?=
 =?utf-8?B?c0dKVkY4TGxTeThoUldGZDFHTkE3OFZ6cEQ0WFF2UHJzT0ZCUzZhOUxkcjBC?=
 =?utf-8?B?ME9VWFhUT2xXWFRzTzZZMTgyM3NUZlF4WlZLNUdnUnhQWG13amdKeW4wamZh?=
 =?utf-8?B?STJDR1lNWlNaa25FQlVuSFlLMWlPOG5GWDEyeVpwRkFPRzVCZitTcHB1TmZa?=
 =?utf-8?B?OGRBUU5qdGp2ZXo2c2U3Z2NqS0JPOHpJZU1uQkdRRjRUQStsTDRpNHpnYVFG?=
 =?utf-8?B?RVFLNFBzYUUyN1A4dG10ZXdUVkIrbm1RL2RXcjBucjcyVFNLSkhiZ01SRzVI?=
 =?utf-8?B?dUY0amF1T2lCaFJRZGtCMVNUYmNWZ01zZDhzSWxyOXI4V0MraUJxZGtUWGJn?=
 =?utf-8?Q?gXQouyM9pfuf6njJJUVhJw+/pYFUTyLR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VFRlVVVKYmN1K0plT2ovbGhRMjdadUNvU0pvbC9sSEp3Nk42cUR5Qi9kVVI1?=
 =?utf-8?B?Mld1ZVdEeVJVbndBRWFrMER4ZmNMT2NSQW9ySzlkU2xVYkdYdXpzS1V3Z09Q?=
 =?utf-8?B?eDhKcWRyRmNITVMxcGt1Nm1IRHAyNmhscnNHb2Mzcjl0S1V3RDRNMEhjalR3?=
 =?utf-8?B?YkFqMm1za2IrRTBEemt4TTJaVzNiaEUxaEliYXI4ZEgxK1lVNFV4MWY1V1ds?=
 =?utf-8?B?SGZrcHlodDdtaG5JdXZnaWJkTGFUTElnWkFBQ29TZDN5NGIxUnkzdWtmRWtW?=
 =?utf-8?B?ZjZ2VDdEM254QVZPeHFMZGVRWEJWMWw0OW1LYk1yYjROWUg4NGFWQU9OZHl0?=
 =?utf-8?B?bVBqK2hHaHJBT3RPY2IyMlJSS0Z4MXVBOGROQlY0aStkY1RYOWltWkl3UWRV?=
 =?utf-8?B?MVVnR1FvOXRvTlBjaWZtcjlBUFM5OEpNRDZaYndqUytjLzE3S1VBdDd3eDZ6?=
 =?utf-8?B?Zyt5MG1tVFBBUkVmVnl4bEQrOVl6T3ZvNXdFZFUrU2VmRVBXdWVtcENadWFH?=
 =?utf-8?B?dENIWStjTzFROVpHOE5PSDVzSmJFNkNFZlJHMGJVS1ZZNzR5OExxSkpuN2Fv?=
 =?utf-8?B?a1M4bWlwVE5ucFdZNEFFVloxb3BMa0UvWEJuSTl4VDQydGQxalNyT00yKzNa?=
 =?utf-8?B?cURnRTBBQk91ZnBvZE5STEZIZWxneHh1S25iNm93bFFmL3JXY3VkVEZKM2Y5?=
 =?utf-8?B?MVdqY2krQkRWSjJ4WjJ1Q3lFL0FvWXk0TDh6WjNqeUtvS05MQUJHbHM3QjRw?=
 =?utf-8?B?OExINmhLaUV2UVVRM294QW00Y1lSUm5OdjZ5U1NQWklmRlZ3TDdKazI1UGRN?=
 =?utf-8?B?TVBleGd2eDQ2SDdtY3d1VmswOWh1Z1FPZzlkQ0QwMzJhWk05N1ZNczk0RG8z?=
 =?utf-8?B?T3BaTFRxL2ZYT0YyS0kxNUFwTDd3WEZEbjBBajhWeEhiRGtuM29EcHU0ZWJE?=
 =?utf-8?B?ZkIrQndnOVJxaVdEalBCRnNpRlFsYjVpeTBoMFR3clIrb3gzN0E2M3Y0RTNl?=
 =?utf-8?B?ZDN3anNDd1FOQzVRSFBDK3VaSHR5clJUQWJ3RmxvT3hIZEpDSlhoTlVWQmph?=
 =?utf-8?B?cFJVYUloTEIvTGlZcmtheDlOTk5aMGxvc0VqNVF3Z3o3Ujk0UHNEQWFRQnA1?=
 =?utf-8?B?SUtxUnVURkRONmJxWFBvSW1vbUZlT3ZyMXVWVmc1RzcrMWllajIrdFdVV0NC?=
 =?utf-8?B?SHhOdHh4N0hyUTBNWE1XY0RabUFGQ2FJQk03czFEZGp2eHh5M2drRHp2UjlB?=
 =?utf-8?B?YXFhbC9jQy9zUTFLdFFlNzJRSWdqdTB6K2RmMVF4Mk1ZcnJQenNQdnVFV1pX?=
 =?utf-8?B?T3MwLzN6NDI3SlpJbUFVN2hhTkF1V1djQytURUQzME95eUZ6ckJ5eXYvYlI0?=
 =?utf-8?B?UzJlREtWK1Rhb1BYYjZYRDVOWHVQbHlnZUpUTzk4bERwb0xkR3pYcVRFUzNB?=
 =?utf-8?B?WEw3SE9uSjVPTWsxM0NrdGphcWcxblBrNVVuTCtJU2FxUWthbU1jbW1KQTJZ?=
 =?utf-8?B?S04zMzl2Uk83a0tIdllGTm5DanA0K2laQTh2WFpQTWVVZW9Qd2Y5My9XRnNJ?=
 =?utf-8?B?KzM2YjdDUUJLazdySkJPZDk4MmdOQWNBYmRiUUQ4MXl4Z3lxVTV4MFdNV2JN?=
 =?utf-8?B?ZWNNeno4ZlVtYW5uRXJDeGVtdTBPaURRaUFjMU9Jczk3cmxSNzhTTDJPcUR3?=
 =?utf-8?B?TU1KOVZyNFdyb2NiT0FqTzFLMzZ5SjZZdG1vVEw5TDNpY1p5YVk2SFdKQ1hM?=
 =?utf-8?B?enFLREEreWtMbUJVY2JtVWZFVVZHR1JoRXc0WXQyMVNXWkNrVEZOU2RnaHhO?=
 =?utf-8?B?TGY2QlAyaEdTYVdOQmdIcEFYT3hibDJLNnNuNFBwaVdPQVZDNldSUUhwdUVi?=
 =?utf-8?B?VjF5NVJZREJUU1c1L1YyMWsxbkgvWDZUQ3pmNEtLamJNVjlzZGg1c1VNYVpK?=
 =?utf-8?B?Q1RnQStvNEJXN3l3Y3JTbmNzSWhEOFhPenhidlRPL2NVVVl0enZpaTNKV2Zi?=
 =?utf-8?B?VVFqaE9BdWN5VkxjN3VuMXU2TE01Qy9nM1hMckZuUDBlQXJKU1JBSk52OXRB?=
 =?utf-8?B?Z0pKQjIrWVBjZjVGUFByYlVBSkRhUjllU1J4Yi91NVBZTURlcUVhbnVTa1dF?=
 =?utf-8?B?T1ZnNnNhTXJpZ1gvT2dON20vQ0R5bThsTHpNdUF6bmJYcERlZnA1amtNa3Ay?=
 =?utf-8?B?aGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 416190ff-77bc-46f0-1153-08de33777115
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:55:22.5371 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r8PJe3rLZDWozlOBXMLqSSWQU+LlL32H+UloJVvKs4AT9GkpbJoaeb2b2IzsA7++0AfjDoG9sBKqx3me81idH+rSf8GQLWegCiikIkyxZwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8181
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

On 11/27/2025 9:07 AM, Zhanjun Dong wrote:
> +static void
> +xe_guc_log_print_chunks(struct drm_printer *p, struct xe_guc_log_snapshot *snapshot,
> +			u32 from, u32 to)
> +{
> +	int chunk_from = from % GUC_LOG_CHUNK_SIZE;
> +	int chunk_id = from / GUC_LOG_CHUNK_SIZE;
> +	int to_chunk_id = to / GUC_LOG_CHUNK_SIZE;
> +	int chunk_to = to % GUC_LOG_CHUNK_SIZE;
> +	int pos = from;
> +
> +	do {
> +		size_t size = (to_chunk_id == chunk_id ? chunk_to : GUC_LOG_CHUNK_SIZE) -
> +			      chunk_from;
This check now uses '==' and expected '>=' based on previous discussion. With
the order of ternary reversed this looks to be correct since to_chunk_id is
never larger than chunk_id.

LGTM
Reviewed-by: Julia Filipchuk <julia.filipchuk@intel.com>
