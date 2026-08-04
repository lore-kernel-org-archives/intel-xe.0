Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18892C55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 12:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB32210EA12;
	Tue,  4 Aug 2026 12:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ovdz9wKd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DF3D10E17D;
 Tue,  4 Aug 2026 12:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785847732; x=1817383732;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=GxIKsJg/wELLFRortOucIV+fK4gK3FStgXimksgSv2E=;
 b=Ovdz9wKdr1/+vtpIfcgbE0B+MDKoMFWcmqvzO0GAJ1moWBeQcy5iKm+r
 iJK9UgVhbH2SyGu3NKhcVuF78TNu9MBE8I+goY7dR5sQsIHDc1Z/KEog1
 7VIQXOEqeLJqe/T2WwAy6RodXc06V6nhnPMa/2VKXPv+NtZlPwk3YB+ms
 4YJvNeQQ+Xe+fuAGUktqj0nm/aKIQtJ8GvU033NETBJqxpPn14+1TZJoW
 NfLWjJFVxI+f0AzhEDwi0KMY1jhAj75e0tCh4udXCxLV8tM9sG6qBezFW
 9MYslIi7Yz7W3+Kiwiebso0iKzjE7tkQqf4G7gueEdVnvohpYBk3OfuGj Q==;
X-CSE-ConnectionGUID: cDbXesgASBu+RykG7xreKA==
X-CSE-MsgGUID: ElkUIrHMQ6eHjTDmI791KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="97555373"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="97555373"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 05:48:52 -0700
X-CSE-ConnectionGUID: IYQMGZPSQFqWcQH6xBeIfw==
X-CSE-MsgGUID: 7QVQ8pYaT/qdq5VgCLn/zw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="265333681"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 05:48:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 05:48:50 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 05:48:50 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.33) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 05:48:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aKozlVo1Qe6Mk25hNOn2/Fb7EQCcLbWwLs7ipRXgY2EXj8GIB01/qJbielGBObdphiFjb4dbzOgZU4vnBy64TFLn4KkFONJqw24ZaqJ6Le6H4A6asvSNbIrkzuNou834RxJ8/NP7v+7Z9Mse69iPXyG73PyHGS6ZNAr8OPwD3JxEN+idyHwNEMCGoaSVlvv0JiTm0M1PIHGtp9LL9CLDCF6FNeJZcbRE8Hu/6RWfq0ByjJYJu794dtNjFw0GQExp0s3H4JeCJG0RfLzJbFreWAH/U7ljHFVAbtTHvWC0V7zCTnd37fu13F75ki/wM9Uja2m1TIQhXTVF3J5Poy/UQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7wvOS/FP4yfEM8PMORKBJ8cJ14+ps8wMoGsN76/mblM=;
 b=TSXY9xhzhHTvkowrRF0zCVJZ6+YrT3gxjgNRwSXW6B0lxTlWTp8Qn2J5qrq8bz3erICAYet/4x3c8yLKich2KCCyMKvKuarGEW4qUyy+v+CsnaGLdOn1wrJwDeEtxcZhWLVsM9jLdcR9tSBm01Kgp3gRZk44I+CnjCueCCsoBhcl8dyHu3Xx2exxr89D6XIaAsaCigEt98VTPNdZ68XqQ5t3PvaLMkqGMBlXl/m0e4EfqH/hnF3vDLcM/5vKqQiS7+qFfjc4AgUNjUjNuq2m9xWhjaobq4d2O0wqEuNGzGYbjhnhJVAENzSY3W77HmJvsleiY/MmEnPXbq4MfuY1FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SA3PR11MB7554.namprd11.prod.outlook.com (2603:10b6:806:315::9)
 by IA1PR11MB7944.namprd11.prod.outlook.com (2603:10b6:208:3d8::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Tue, 4 Aug
 2026 12:48:47 +0000
Received: from SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b]) by SA3PR11MB7554.namprd11.prod.outlook.com
 ([fe80::3ec0:2280:db82:d67b%5]) with mapi id 15.21.0292.013; Tue, 4 Aug 2026
 12:48:47 +0000
Message-ID: <55472e8b-2b7d-49af-855d-4b3fffd05e32@intel.com>
Date: Tue, 4 Aug 2026 18:18:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] drm/i915/hdmi: Use correct type for output_format
 parameter
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "alexander.kaplan@sms-medipool.de" <alexander.kaplan@sms-medipool.de>
References: <20260730105226.2731341-1-ankit.k.nautiyal@intel.com>
 <20260730105226.2731341-2-ankit.k.nautiyal@intel.com>
 <DS4PPFE901A304F3721E80E96C9750C2F1AE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <DS4PPFE901A304F3721E80E96C9750C2F1AE3D52@DS4PPFE901A304F.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0028.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::16) To SA3PR11MB7554.namprd11.prod.outlook.com
 (2603:10b6:806:315::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA3PR11MB7554:EE_|IA1PR11MB7944:EE_
X-MS-Office365-Filtering-Correlation-Id: adddceae-fb59-4c6f-4de9-08def226b979
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|11063799006|4143699003|56012099006|10067099003|18002099003|3023799007|22082099003;
X-Microsoft-Antispam-Message-Info: /0At4cdCUgJWb8oJ6/ko2aqLDYPU7LiFjA+RyVHU10iHUWSCsO6Gt1NUhbSIdREqNVxhWEcbe75bsVu4jkT+V5ny8D5f5V7ndBx9apIm/3Uc+rVdXdojEqllEJVuDQsKXI+195jbWFWpPCoRDDZEIIaO+e4n/Va3uErIlqEJYHQwNP6Szi5iRfzPvWxav0FT4bRPgyhXLunTltWH0UIW8I+ztRQ6qFKBcQfVwzkDrhALVW/n/pDnHfxAskENrfV5esaQ4wpCoM04i2TZkhbVtimo731wBbO4a5/ZgoGPs4YT9qbA69gP0B8wI0ZnzYyBZA5f/5Hz8krM5T/+2aFd/wRB65s49gYKwGdH1hDZdWRlmknC7kC0dfcp4ipQr/OR7nND1v6jqmbvpRn3LXTBRORkLmu6IvauLIvQWgI0yyc7Cm95F5dManHs6kg7TTpjjXaFPYB+LT1HqrUK6tljFhA0IJxwLxjxGJKo3snI1AgxABCc/+GT+O1gnVh4ZIDbHUmZ18TnvbYo0ioGTh74nHtxs+7zB7kdxkC1NM6mzqlCSNgMMHevGc6uyYVxIfeD/03vAOYX+Ot0u88fD4UIzOKUK95VqJLsl0ImQRGo1XqIT3u5qtuwAB9AnPMpoXKy8N9RKgbKGgn2Xkwzkzic833c5XDUBQpvpMWd3/4iKyE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB7554.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(3023799007)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1hwWjRDY2FoVndLeHBDZjZqVm56MWh1cmVsaDZ1MGVOc1JibllFMVFxU1d3?=
 =?utf-8?B?ZEhyUjdpUXZFMkxDdG1FaW1jclBkZDhmOCt0Z0cxL0dURlN4Qk11b3gzVlMx?=
 =?utf-8?B?WDczNG40Z1FZMXdmWk5QTTBxeHhUY2FNM0NKcnk5SzQ1WEVSSnVKZWtFS01V?=
 =?utf-8?B?TWNhaTFkYk5IbWJMajArdjFYcWJlZ1BRenVhNHFPUTF0SVNlaUtwTVZTNmRz?=
 =?utf-8?B?THNWY3I1T1NSYXZxeTFvRUU3d0pNQlZjeUNTNFE0UkVPU1k4Q05HMDcrSjl0?=
 =?utf-8?B?bnl3RWtOMUF1RUFVblBka2U1RzBRL3dtc2VDdWJYZTFvVVNneWcvQ3NmVFcx?=
 =?utf-8?B?WDloY3A3eklZS3dMUVQ1bDJ5N3N3NUFvSnpEcWdrc3k4bU1vM0M0K01HN2dy?=
 =?utf-8?B?d1lZVVR0ODd2N3Zqc1JPUVVyTHBzMDI1Nnd1YXNRK1NXZDRZMXRVM1p0ZStt?=
 =?utf-8?B?cjViL21lYk4yTFkxM2JXbWhUeWIxQWhzMXltQ0dWZ0FUVVM4M1BVQ2ttcGk0?=
 =?utf-8?B?OXlpU0tOdjFuRi9qWWNGK3IzQVR5cnh5THo4MXp5ZlJvRUw2cVRGK0l3d1pK?=
 =?utf-8?B?dE9IVlozL1FkdXl1UTVlWFF3WVNWYXdTSnhOUnY5am0rL2x4N2lENmV4YWdR?=
 =?utf-8?B?M1BhUzZBMkluZ1dEMU9FakNtSktSNUNYWHlNb2NHQUtFbUFReWd3cGZIWUY1?=
 =?utf-8?B?bjBFWHowaTZhUkprVEZmMlNCazQyT0NWYnNSSGJwTEQ3YkZxZWNwblFBSGRZ?=
 =?utf-8?B?WkRyaEJyQUJwRXA5WGlhK1piMUw2MXRVbGRGQ3RmbnFpM3A0WlBiSXlIRDR6?=
 =?utf-8?B?ZmF3K0lqZU4vRGtycTUrRW9OZDFvbVcyMzRQT29heTJzQVB2QVNXR0lDQkxv?=
 =?utf-8?B?Y2loZXh1UGxiUWhJUmNFeC9CaHVXbEY4THdwbHVZYXQvKzZBakUrZUNtMmR0?=
 =?utf-8?B?LzBtaUtsdWI3UEdsaXY4SXdUOWd4YkJ3VHg5eHJOTGwxcVo4bWcyYVdKQWRP?=
 =?utf-8?B?VmZLQUF5SjJuSy9hbGNqNUpDVU01VW1zSUg0NlBCNEV0aXhkMER6ZUcrampl?=
 =?utf-8?B?N24wSVA5emprcWVZVnRWVFZVbmh5SDVaSklaTnQvcmNxMGpFOHlDQVRDcWth?=
 =?utf-8?B?QWJvWXEreU1ENlJLS0NaYWtWQXpnLzVyNkFYVG1NdVNJRGlsdHphOTVtbnMz?=
 =?utf-8?B?dmV3RW56OWhPc3FNQW1VMHQxSVFQTnZxU3BhUWlDL1NnRkluajdnNSs5R1Z0?=
 =?utf-8?B?ZTl1UjBSVC9VSlFjTnRjcG9UTzVkNzVQSG1jMWNGbnlJaUh5Z2RtMzNFNHRm?=
 =?utf-8?B?QXVnZVJqY1l2NzJTRGlDZVp4eTg3M0lsS09LaytlRU43dmxPL3h3cGxldFdn?=
 =?utf-8?B?a040ZG82UGliOTVpWnNzaUUwVS9yYVBPckxGekhZS3RqUEtpVlNXYmZ2TEg1?=
 =?utf-8?B?OWkvdnFnbGk2clZsdDFwRGNhQUY3N2xpK2hIQTdGREFTSHI0djlwa0NyV0lQ?=
 =?utf-8?B?cDBpR0dPZUNlWThJTTNFdEFLeXdWOHhGWmMwRDRvbVZTeElOWFVaWnJVSzV5?=
 =?utf-8?B?RnBzRUU5SnpuNzBPcE9IQTg4UjlxN0dIQ001RWgwSWhVN3dzd0tJUE96WkQ5?=
 =?utf-8?B?WmxRSTBUK3k1MFc1YURBbHJIRjZoLytEWVRNVXlnejg3d25GcmJKN3Q1MXFX?=
 =?utf-8?B?ajVncjFhdlhxU0ZhUnBya25zcVllYm5jYlNkNXRBM096MmlqOEtZNXNmNHlR?=
 =?utf-8?B?alkxNFhhdkhEQmpRMmRBdVJvWlVpSHZxTGtiQ2o3aUl4NnU3VEZyblFkcGhE?=
 =?utf-8?B?Z1dKd2RYa0JkUExiYmNtMHFRM2YvT3lSQ01Da0xFMHVxdDNnYzdidjkrZlJu?=
 =?utf-8?B?V2NFSS9wTk9sbnBTbE5vc2p5MEFPVHRZZjF2Rll1MFg3eFlEZ0JFR3VTZnlj?=
 =?utf-8?B?aG1Bb0lzMnppQWhLY0U0ekxxSldWTlNZQnNqVWNwVVlqaEVwVGFCT1BhZDVN?=
 =?utf-8?B?amVhQWZaTVEvaGZEUVhZaG9IU3pLWDV4ZDVOUFl1eENmSlpxSTg2ZEo1a0V6?=
 =?utf-8?B?NS8yRXNyYkJZQVN6blpWcmxLbXRWQWs1U2JmK21jZVc5dW9uOWVaWUp6elVV?=
 =?utf-8?B?QzBUOTlKZC81V21wSkExR3RqMHJEWVdGZGcrcDZHVlRzZEZMQkhrdjhhNEVp?=
 =?utf-8?B?MmxzYVFDNk50cnNkV2xhNExiRU5vRlpzVC96aWJDYThTcEtwRW12VEtlL2tW?=
 =?utf-8?B?bzBGbm5VSlJRL3o1Sko1bjBSUE11RzZPNUxoMFIvMWx1VUcwdW9JK2RyNjlJ?=
 =?utf-8?B?bURrdTd2ZTQ2VHJhS1JST1FKazZDRjlRZWp6TXhuM3U1NVVDZTgrWVlTMGFH?=
 =?utf-8?Q?8MVADDdadLlY8pNs=3D?=
X-Exchange-RoutingPolicyChecked: CxqTO3qR8DNZRRcY7EjtmvWaYZldrVFLSXT+MwSk/2QJ/UkZK6UoMcOwwhz7Rdao4R5fGnvoznozrRodFLh9Hl5G6KWPqweK0pz3ZUzBEJoNLHwNhKVRcAOXr2/x5KXsmSt/l6aB05gHSkHvGKk3At/SSjs4GK3SL6q0heYJ/gemXU7ctm5qSL6WAKhLr3YTgN6qQj6IwdVpCepGjKKWhxlNLSGKkVtGVdxwE6/KsBKEHiOa5/4CQM4w/pvzjVx41xcYtF1JF4sUQmUm5hz0SillAQ2xGfFit/6/pOIG32lTvRrtceap+PHKWnEs+t/1XUXIdTuNdDFG3UszN5rzGg==
X-MS-Exchange-CrossTenant-Network-Message-Id: adddceae-fb59-4c6f-4de9-08def226b979
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB7554.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 12:48:47.0927 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y7NUrOdOpw7FNpEe5HPUSTMI+Uhzx1yo6s2obL26sVX2UQuSqL6Ir5LUl6NwAKHJsdb24eO/jz5jiMGS7PoxhuZEzJTmOoy79odtVpVtozU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7944
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


On 8/3/2026 10:02 AM, Kandpal, Suraj wrote:
>> Subject: [PATCH 01/14] drm/i915/hdmi: Use correct type for output_format
>> parameter
>>
>> Correct the data-type of the argument output_format to enum, for the function
>> intel_hdmi_dsc_get_bpp().
>>
> This should have a fixes tag

Hi Suraj,

Thanks for the review, and the comments.

I was also considering the fixes tag initially, but then this looks more 
of a cleanup than fixes.

Since the change only updates the argument type from int to enum, there 
is no functional change. The generated  ABI also remains same.

So IMHO, this doesn't need to be backported to stable kernels, so a 
fixes tag doesn't seem to be required.


Regards,

Ankit


Regards,

Ankit

>
> Otherwise LGTM,
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
>
>> Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
>> ---
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 4 ++--
>> drivers/gpu/drm/i915/display/intel_hdmi.h | 4 ++--
>>   2 files changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> index 8a019d3574df..9af0f3aba0fc 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -3338,8 +3338,8 @@ intel_hdmi_dsc_get_num_slices(const struct
>> intel_crtc_state *crtc_state,
>>    */
>>   int
>>   intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int slice_width, int num_slices,
>> -		       int output_format, bool hdmi_all_bpp,
>> -		       int hdmi_max_chunk_bytes)
>> +		       enum intel_output_format output_format,
>> +		       bool hdmi_all_bpp, int hdmi_max_chunk_bytes)
>>   {
>>   	int max_dsc_bpp, min_dsc_bpp;
>>   	int target_bytes;
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> index 0fa3661568e8..fb950fdd0e7a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.h
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.h
>> @@ -54,8 +54,8 @@ bool intel_hdmi_bpc_possible(const struct
>> intel_crtc_state *crtc_state,
>>   			     int bpc, bool has_hdmi_sink);
>>   int intel_hdmi_tmds_clock(int clock, int bpc, enum intel_output_format
>> sink_format);  int intel_hdmi_dsc_get_bpp(int src_fractional_bpp, int
>> slice_width,
>> -			   int num_slices, int output_format, bool
>> hdmi_all_bpp,
>> -			   int hdmi_max_chunk_bytes);
>> +			   int num_slices, enum intel_output_format
>> output_format,
>> +			   bool hdmi_all_bpp, int hdmi_max_chunk_bytes);
>>   int intel_hdmi_dsc_get_num_slices(const struct intel_crtc_state *crtc_state,
>>   				  int src_max_slices, int src_max_slice_width,
>>   				  int hdmi_max_slices, int hdmi_throughput);
>> --
>> 2.50.1
