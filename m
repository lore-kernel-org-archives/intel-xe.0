Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E24CDD1D2
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 19:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3110ED0C;
	Fri, 27 Sep 2024 19:45:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nTtnSsIi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E97C10E0D6
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Sep 2024 19:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727466334; x=1759002334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mWPRKE6o3QpaAiYAq20WZtXK3xdljwti6XQuliMCbaA=;
 b=nTtnSsIiOlu1vzVFBcQJH3FOLD9l7dCqJkEbbqsVPRRep1/OUbwYqBMS
 S0/20H/PUhlOiEZKTAZ6WzZveXukGvu69C7x0R3znzvl8pbTkUvuuPGlX
 D11Q6NjsqeLA81rQaB21JoCCgm0IeOt1QvKxkKyUeUnXSp89xeAiSQ91d
 5EqfVmAC7YHX/tdP4Ith9A8hQOiRNvAye/V8u0H7SMpwskn/PX7cqPjfd
 KYC1xJy/bBd673hA+rRblPxXN5FCSggPpuk1fqEecCp0UAdG47pHKOon2
 eIVpqRBMT0LapPTIpeUlM89vo0e1yi+r0oZ1f+mn8eEsXDjC+UfO08P75 g==;
X-CSE-ConnectionGUID: hHPMux6vRU6GldpmATVQBQ==
X-CSE-MsgGUID: oGKMEsNmSQSCjwcRRchccw==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="26754315"
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="26754315"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2024 12:45:30 -0700
X-CSE-ConnectionGUID: X+18l9PQQbyWSu5N3S2Lgw==
X-CSE-MsgGUID: YuPXc94dSK+kOsjkbXE1qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,159,1725346800"; d="scan'208";a="72209691"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Sep 2024 12:45:27 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 27 Sep 2024 12:45:25 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 27 Sep 2024 12:45:25 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 27 Sep 2024 12:45:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmJG8EE10FRd3RtvofyFXbNrE9kfbKN6M1Vdw2zCRTtC1/1JyWbYo6si5i3nJTtRLPNmByd4ZQc59ryz2HsVoj3/BoaKwsUsY6lkSl6UG31942RQDJnSgC/Adj515hI1fowLJOnrtk9E+M/HZNUMQr1wGJeVYgfnPmebybe0SGKqSymnaNzzKO+Rn7w2RLWQEjXD7iIvHb9xt1lbq062mpyMI/IHFK0bPldlzJYlMY12I5n4W+5mWH1u/e4ZiXbTUV71NhSpAftTLpG1mIXyz5jAqXiE9brqUEAK5swcycmTbj1Kw9LtSx6W1eNZ1bpVMvzrhmgpYaMQ8Y3GZiZ2tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2sl3HcyjiJDis9GQv9nXnW7RuMnYaO4hCIF0tVkVW0=;
 b=AdPQMbqGz3DgsyTQGs7t557sgGfRjlMoHpR+7MWKjWvCRJNhxLH+6KvAEotschJ24pVlMzF8/RC49RwppLHDUiswK1Mh+RUx4pg6qGj7WURxA0DxKnUi+gJs8WWZCFsfIx3G6gu6vU5UKNilo8h3i++t7cMJ+VTF4f+lyL47T+VqL7qj1wtcDG6MSPytv4xdDy+YES7iz4mc2/Jlvo9/nFPdUUfWHpFOgbS1p6/vxekI/P0Q1x0GDyHxjg9d5AofYrX6GGcqMUFLnilSc5/51Hvv3lGhuVVQgUGCPC80K45cF1xRLSUXBib9Iy54Dzs9hCyjN2FoEU02DqcHxwNVlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by DS0PR11MB7768.namprd11.prod.outlook.com (2603:10b6:8:138::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.23; Fri, 27 Sep
 2024 19:45:22 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%7]) with mapi id 15.20.8005.021; Fri, 27 Sep 2024
 19:45:22 +0000
Message-ID: <7ccb4617-9a7f-40f6-bbdd-bcbff3141aaa@intel.com>
Date: Fri, 27 Sep 2024 12:45:20 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/pmu: Enable PMU interface
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Bommu Krishnaiah
 <krishnaiah.bommu@intel.com>, Riana Tauro <riana.tauro@intel.com>
References: <20240927002344.2565250-1-vinay.belgaumkar@intel.com>
 <20240927002344.2565250-2-vinay.belgaumkar@intel.com>
 <Zvb43kW5pt4628HK@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <Zvb43kW5pt4628HK@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::26) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|DS0PR11MB7768:EE_
X-MS-Office365-Filtering-Correlation-Id: bca7aca4-2fe4-48f5-e268-08dcdf2cec83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXk5djhmNzMyOXJUQzN3QVB2V2laUDU3ak44azA2WE1pb0VRTmtpL0U5Vkdo?=
 =?utf-8?B?Yjk2NG80S2s5VzEwaXE5anAvVzlWSk1uK3Q1SUxaai9hbkdZYlpvNGJWVm5I?=
 =?utf-8?B?dEdSNVB2U3NFTlcyOHhDMWdxNXdsb3dDRmdkQkJlYXIwQnl1RTFjSUdmNHpk?=
 =?utf-8?B?U1o5NzUrTHB0SFJuYzdIWmRQeFU2WEFTWFVweHFXRlNscTZaK2pmOUhoMUdB?=
 =?utf-8?B?eTBCZkZMUk5mZUhPWDQvLys5Z00rSWNSVytEQ0VQRHR0TllScmpWbEVBNVBB?=
 =?utf-8?B?T3NCYksxS3NiL2VsMTY2R3FNcmtCdEF1QWJJbDk1ZHdPQWhPZVphWTc4Rzhr?=
 =?utf-8?B?VDBkWVc0b0tMVnZ3dGpsK0RveUR2RFZhc210VU83aEdkTk5FMDFxWjEyUW4x?=
 =?utf-8?B?dmZic3l6OEN5TVBwblREQjk5aTBENk5mcE1MTmY1ZWFkM0l6cVEzK2lINjZv?=
 =?utf-8?B?elhFK1JVaEh0d004d1Y4N3ZSVy9LS3hlQmVNTk1CS2JRVERjTEdxQ0MvOXBG?=
 =?utf-8?B?a21XMnNYQkQzME9YYlZwWGFTTGxTTFpXQytNc2hDV0EwMTZFSGlYSzl0NW1o?=
 =?utf-8?B?NHlUeFV3bVdoNWZVelArN2dBL0F5emtsQlFBYVduclU5Q1h3a3grUVNMV3Ru?=
 =?utf-8?B?Tk9zN3JPZDhHZkd3RzRBQkFJc3d1dTU5TENFQ3RSaStYRnl0M3ZiV05CVGpW?=
 =?utf-8?B?QkZKQ1RWMHRCeENxNFZNYUsyUDAzN2NveWdJVlRTd3FYTTBPTVJEL25FdkFW?=
 =?utf-8?B?cTJlTVppcWZ6TldkNFlsUkR4aTFtaytVQkJqWHRlRVdydWduMFNkZDVCVjNv?=
 =?utf-8?B?aUNKaytkK1Nid3hGNllZOTBwR3JuMUtGUEpLZm1wVFJFZGVzSkpYUmlYSkNm?=
 =?utf-8?B?cDczYm5kU003NkFWRVJXY0ZWZ01qQXdlL1g0blhOY1Zyb0J2NnV5RkZHSFcw?=
 =?utf-8?B?ditWZGdaNElBZklvc2x5cnNQNHZyZDFyalhuNC9paGtPTndTZGV4VVZrbThZ?=
 =?utf-8?B?ak5WYWxETzQ3NXhCL1R6bTdla0pxdkpibUowVjI5UEg0UlUrVGVmSDlxTFZ6?=
 =?utf-8?B?KzJiZmtMWnJCbGpqanpVdy9OTFNtTkk2NDVXODdvU0Q1SjZXRGdoa3kyNy9o?=
 =?utf-8?B?NTBidDhsN0RPYTcwcVJUNGlQVnltTTNob3lBc1l5QkxnVzZYOWUzTzNXNitF?=
 =?utf-8?B?WWlIcjJmNDZkY0RTUHJzR09aQ1pCeEJvNkRLejlNblF0c2ZONTRzang1UXNF?=
 =?utf-8?B?VlNJRnJmbTdDN081emgvYkJXcUhQdmkzU0ozeHVOV0o0T2tSbE5Db1UvSVZU?=
 =?utf-8?B?dFF3N2FYdzZkZFZ1R2RmcVVpNXZyVmNDcFJ5dTJnaDdIaFJkU0NSeWJmdnd0?=
 =?utf-8?B?MUtqMnF6Qm9EdU55R2Y2Vk82dzB3QmsxRlJ0a3R2QlF0UFJxTi8wS2FBbG1y?=
 =?utf-8?B?elRiZVVVWDllZ0VkVjdGWVU2Mk82SnJyaUtsT0RuOWFGOW8xWmJQZjY1YUl1?=
 =?utf-8?B?TzFsV3JaclhkcmNFRFlzQS91MjVIM0M3cjl1cERad3JxSnkyRnNnSTk3WG5Y?=
 =?utf-8?B?cCt0a0hzNkg0cmthU1JpWlJsNEprSUNiMFF0OGFZZHVKWm51c1F3SlpOUzQ2?=
 =?utf-8?B?MjJFc2FwTWJQMTBibUFxaXBtVi9IMmc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S1NrYXZXM2dqYXk1M3ZleHMxUVhBQVdLWG0vZFBYUytVTW05dFh3NmhXdkQr?=
 =?utf-8?B?VVFJeXlJUFZlZUxqN3o5OEFVNXBvalhyTWRVS3JYai9QREFldk9nYmRydVcv?=
 =?utf-8?B?S0tPMGU2eWFFWVNJUEkyaVdqNUdhK0Fza2lXK2M3VjBnK2VNZDlVRUptM2Y2?=
 =?utf-8?B?S0lPdytzNHYyY1UxVVNhZ3BaMFV4Qm1IRFlvaURGTUVwcC96SWRjK1N5Q2xX?=
 =?utf-8?B?dFRFTDdVOVdsQ3BkdE5oYi85QnYyUk9saENVd25VS2tpaDBScXN6Ynl2ZldK?=
 =?utf-8?B?bHM0YUZpa252dENvdlJrZEt3cmxQVnJjVHR6RUI2RUxlT1RvYXMrWHB4ZnpW?=
 =?utf-8?B?TjlleFZTekdKTjJIeDllemhHOUtCYmhCamZnOEJZaitKN2RJQmgrMXZ4bDNT?=
 =?utf-8?B?ZWpBc0gwcjFWYThIV0V6K0xrYzY2Vm9qYmpSbzNCbkRMYzBYcmxsQms2MVAx?=
 =?utf-8?B?bllzTHBVMXd1V1VyQWpNR2NCTTlGMURMSDJJMnhaYi9QVHk4ZHF3OE1SaU1m?=
 =?utf-8?B?Z2w3SGtGNFZFYnltZUZoN3BsZUNPU3FjUmtsenNvcXJzTXFLR3pzdmhqRmxa?=
 =?utf-8?B?cGNFYmdXVUxPQnVjdzNCUm80bTd6Z2tCR01udlJHaHZhczc5K3lyalEvWjdF?=
 =?utf-8?B?QVdoNVdYRnVTRmZpQjFZUEQwM29HMlFSY3pDekh0TjFaMTBBSkszOWRwU3ky?=
 =?utf-8?B?cTcxU284Qnp0OFpiRG0reWlBS1hkVVVyU1ZGNFY4T2hNc0NOcWU4Z0grVzI4?=
 =?utf-8?B?UVlicmNvV0hvUGRmZE02dVFJd0NLMnMySXFuckVJblZ5WVZxTVloSWlqZm5y?=
 =?utf-8?B?VXpiT09QR25WNmlOdk9JSlFYOW96cjIrVm1yU0RwZWRWYlBnMHdseURRQWZW?=
 =?utf-8?B?VFdKUGdGRk1ZT1FrQnk1Y0ltaUhIMTIvWFF5RnU1U3VyVVliTVh3R2JQY0FH?=
 =?utf-8?B?OXNKcXIvcFJaN2Zpb0tlTlcyTWNEdm1DcGxEem5PNjhRRUlsYXBLS1dXUDls?=
 =?utf-8?B?L3ZmZVQ4V24rOHJvRmNBK0Nma041b1RRelRMTmViUHdRRFRZUW5IY3ZiL2Z1?=
 =?utf-8?B?U2k3Y0VmQmVsUmRjMlM2c1lQOUk2Um9GKzBjYlNvUjFIU1VTWG1vYlZBTDFN?=
 =?utf-8?B?d1VLaVJlWlhib2RqSHJmVmV5SXdDRDRRdHFNUndDN3E4TEdNT1lna0ZhYkFt?=
 =?utf-8?B?K25Gb0luYXZReUNkaUgxZ2NoUVRQNDJ6ZHNOTUU0NTUwL2hGdnRoMHZnOXR0?=
 =?utf-8?B?TkRrOWlNdG5ZNVN5elJvYzBza1lKOEJManpFYVNFSkkzcnhrZkNQVTRIcHRX?=
 =?utf-8?B?OTRQOUdVL1BoamVTbS9BN2pRMVhIMkdIOEN5a1hnVHVQMDlsc2tIQ2JQaVFw?=
 =?utf-8?B?QVhCQkgvY2MxOXYxL09TTlQ0TEwzR2RhL0U4Qm42Z3FESjV5TGhWdWQ3VFJP?=
 =?utf-8?B?d1Z0RzE0RFIrVUNIUDBPTGpVeFptbGJPcmR6Z041VExtQ2loTlphOTZ0MkFP?=
 =?utf-8?B?OCtFK0plZFYxckgvNi9hWnREaWZ5V0s2ZU9hTEFhbkRXVVhJUnRNbUhWZHhO?=
 =?utf-8?B?SzJBekViMjRiUEN1T0hBRTkrNFA5OGZVOWRidXF5eUMvSWNUNEtVZFdpb0V0?=
 =?utf-8?B?azYvcmlPZk9ZWDVzTEFwY3ByNEphWkhuS2xrN043NlN4UmdsL0E4SkJSQUdm?=
 =?utf-8?B?bWVJMGFjcFpwK3pYZ0oxc040WWJQYUpKYy80Q3Qvd08xZmN0YnJTWlRlS2gz?=
 =?utf-8?B?eFVOdk1meWg5WmtqV1BhRlNmbUtBVmlYTk1ycU9LR0p3TEgrRlhEa2lNdjMy?=
 =?utf-8?B?eHVjUUNXOXB3RWlram0vZkx1WkxNYytnYXVTemRWSTBBdHh0V0txUDNWajVP?=
 =?utf-8?B?emc5K1Yxc09Qb2VCek5ReFluVXY5VklKR3RydnFsbDdjem9MMHlURHlOQWdS?=
 =?utf-8?B?V01lRitWdXdCbW1ieUh2WXJneU1pbEE5bEZwM1JDS0ZhZHdzL2Vqb25yc2l2?=
 =?utf-8?B?VUVhNE9WekZ5U1JJT29ZTjJpZ1EwZkhTWUlHYmdROGtjTWczb2JCZUxzVVBa?=
 =?utf-8?B?MEZsMFFIc1NoYUxLeDZhTzJKc0N6VlFPWDNwQ2dGLzU2U05DdnVtbXAzRVpn?=
 =?utf-8?B?SkFXRnBES2hvQTY4VmJvYWFJWWt5QlQzdWErNEswV0wxdEljMHRaVXpvdzRK?=
 =?utf-8?B?b3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bca7aca4-2fe4-48f5-e268-08dcdf2cec83
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 19:45:22.1681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oWMR2Dsp+w+q+uV2oSI4zBrMcpxpqLCHEQEytIimaVA10XazCcKkgcKxlNC0AstcU55db3nj2R+RVO4nOc8zwYU7wv4yZBcJqT7nL9IAv5w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7768
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


On 9/27/2024 11:26 AM, Rodrigo Vivi wrote:
> On Thu, Sep 26, 2024 at 05:23:42PM -0700, Vinay Belgaumkar wrote:
>> From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>>
>> Basic PMU enabling patch. Setup the basic framework
>> for adding events/timers. This patch was previously
>> reviewed here -
>> https://patchwork.freedesktop.org/series/119504/
>>
>> The pmu base implementation is still from the
>> i915 driver.
>>
>> v2: Review comments(Rodrigo) and do not init pmu for VFs
>> as they don't have access to freq and c6 residency anyways.
> sorry for the slow review and for not going through it all
> in a single pass.
>
>> v3: Fix kunit issue, move xe_pmu entry in Makefile (Jani)
>>
>> Co-developed-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Bommu Krishnaiah <krishnaiah.bommu@intel.com>
>> Signed-off-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile          |   2 +
>>   drivers/gpu/drm/xe/xe_device.c       |   6 +
>>   drivers/gpu/drm/xe/xe_device_types.h |   4 +
>>   drivers/gpu/drm/xe/xe_module.c       |   5 +
>>   drivers/gpu/drm/xe/xe_pmu.c          | 570 +++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_pmu.h          |  26 ++
>>   drivers/gpu/drm/xe/xe_pmu_types.h    |  63 +++
>>   include/uapi/drm/xe_drm.h            |   8 +
>>   8 files changed, 684 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_pmu_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index ae245fbd91ee..3a3eabc0e0a3 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -293,6 +293,8 @@ ifeq ($(CONFIG_DEBUG_FS),y)
>>   		i915-display/intel_pipe_crc.o
>>   endif
>>   
>> +xe-$(CONFIG_PERF_EVENTS) += xe_pmu.o
>> +
>>   obj-$(CONFIG_DRM_XE) += xe.o
>>   obj-$(CONFIG_DRM_XE_KUNIT_TEST) += tests/
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cb5a9fd820cf..027a796d7431 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -762,6 +762,9 @@ int xe_device_probe(struct xe_device *xe)
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_sanitize_freq(gt);
>>   
>> +	if (!IS_SRIOV_VF(xe))
>> +		xe_pmu_register(&xe->pmu);
>> +
>>   	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>>   
>>   err_fini_display:
>> @@ -806,6 +809,9 @@ void xe_device_remove(struct xe_device *xe)
>>   
>>   	xe_heci_gsc_fini(xe);
>>   
>> +	if (!IS_SRIOV_VF(xe))
>> +		xe_pmu_unregister(&xe->pmu);
>> +
>>   	for_each_gt(gt, xe, id)
>>   		xe_gt_remove(gt);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 5ad96d283a71..51485d2eadcf 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -18,6 +18,7 @@
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa.h"
>>   #include "xe_platform_types.h"
>> +#include "xe_pmu.h"
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> @@ -513,6 +514,9 @@ struct xe_device {
>>   		int mode;
>>   	} wedged;
>>   
>> +	/** @pmu: performance monitoring unit */
>> +	struct xe_pmu pmu;
>> +
>>   #ifdef TEST_VM_OPS_ERROR
>>   	/**
>>   	 * @vm_inject_error_position: inject errors at different places in VM
>> diff --git a/drivers/gpu/drm/xe/xe_module.c b/drivers/gpu/drm/xe/xe_module.c
>> index 77ce9f9ca7a5..1bf2bf8447c0 100644
>> --- a/drivers/gpu/drm/xe/xe_module.c
>> +++ b/drivers/gpu/drm/xe/xe_module.c
>> @@ -14,6 +14,7 @@
>>   #include "xe_hw_fence.h"
>>   #include "xe_pci.h"
>>   #include "xe_pm.h"
>> +#include "xe_pmu.h"
>>   #include "xe_observation.h"
>>   #include "xe_sched_job.h"
>>   
>> @@ -96,6 +97,10 @@ static const struct init_funcs init_funcs[] = {
>>   		.init = xe_sched_job_module_init,
>>   		.exit = xe_sched_job_module_exit,
>>   	},
>> +	{
>> +		.init = xe_pmu_init,
>> +		.exit = xe_pmu_exit,
>> +	},
>>   	{
>>   		.init = xe_register_pci_driver,
>>   		.exit = xe_unregister_pci_driver,
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.c b/drivers/gpu/drm/xe/xe_pmu.c
>> new file mode 100644
>> index 000000000000..bdaea9ca1065
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.c
>> @@ -0,0 +1,570 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_managed.h>
>> +#include <drm/xe_drm.h>
>> +
>> +#include "regs/xe_gt_regs.h"
>> +#include "xe_device.h"
>> +#include "xe_force_wake.h"
>> +#include "xe_gt_clock.h"
>> +#include "xe_mmio.h"
>> +#include "xe_macros.h"
>> +#include "xe_pm.h"
>> +
>> +static cpumask_t xe_pmu_cpumask;
>> +static unsigned int xe_pmu_target_cpu = -1;
> Please no global variables. Think the case where we have
> more then 1 device in the same cpu.
>
>> +
>> +/**
>> + * DOC: Xe PMU (Performance Monitoring Unit)
>> + *
>> + * Expose events/counters like C6 residency and GT frequency to user land.
>> + * Perf tool can be used to list and record these counters from the command
>> + * line.
>> + *
>> + * Example commands to list/record supported perf events-
>> + *
>> + * >> perf list
> perhas '$' instead of '>>' ?
>
>> + * >> ls /sys/bus/event_source/devices/xe_0000_00_02.0/events/
> perhaps ls -ld /sys/bus/event_source/devices/xe_*
>
> to first know which devices are available?
>
>> + *
>> + * To record events-
>> + * >> perf stat -e <event_name> -I <interval>
> Could you please document here on how to ensure that those small incremental
> values should be read?
> How can I use this perf command and ensure that we get exactly the
> same value as our other sysfs entries?
> I'd like to do the math back to cross-check at least, but also
> this information should be useful to ensure that users of this
> are really well informed on the flow.

Sure, something like this should help?

root@DUT147LNL:/home/gta# ./perf stat -e xe_0000_00_02.0/rc6-residency-gt0/

  Performance counter stats for 'system wide':

         1840175545 ms   xe_0000_00_02.0/rc6-residency-gt0/

        1.840228260 seconds time elapsed

This shows CPU elapsed time of 1.8s and GPU time in the similar order. 
Issue that needs fixing is looks like we are displaying ns and calling 
it ms!

Thanks,

Vinay.

>
>> + *
>> + */
>> +
>> +static unsigned int config_gt_id(const u64 config)
>> +{
>> +	return config >> __XE_PMU_GT_SHIFT;
>> +}
>> +
>> +static u64 config_counter(const u64 config)
>> +{
>> +	return config & ~(~0ULL << __XE_PMU_GT_SHIFT);
>> +}
>> +
>> +static void xe_pmu_event_destroy(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +
>> +	drm_WARN_ON(&xe->drm, event->parent);
>> +
>> +	drm_dev_put(&xe->drm);
>> +}
>> +
>> +static int
>> +config_status(struct xe_device *xe, u64 config)
>> +{
>> +	unsigned int gt_id = config_gt_id(config);
>> +
>> +	if (gt_id >= XE_PMU_MAX_GT)
> why do we have new GT defines instead of using the regular GT
> numbering and entries?
>
>> +		return -ENOENT;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		return -ENOENT;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_event_init(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	int ret;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	/* unsupported modes and filters */
>> +	if (event->attr.sample_period) /* no sampling */
>> +		return -EINVAL;
>> +
>> +	if (has_branch_stack(event))
>> +		return -EOPNOTSUPP;
>> +
>> +	if (event->cpu < 0)
>> +		return -EINVAL;
>> +
>> +	/* only allow running on one cpu at a time */
>> +	if (!cpumask_test_cpu(event->cpu, &xe_pmu_cpumask))
>> +		return -EINVAL;
>> +
>> +	ret = config_status(xe, event->attr.config);
>> +	if (ret)
>> +		return ret;
>> +
>> +	if (!event->parent) {
>> +		drm_dev_get(&xe->drm);
>> +		event->destroy = xe_pmu_event_destroy;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static u64 __xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	const unsigned int gt_id = config_gt_id(event->attr.config);
>> +	const u64 config = event->attr.config;
>> +	struct xe_gt *gt = xe_device_get_gt(xe, gt_id);
>> +	u64 val = 0;
>> +
>> +	switch (config_counter(config)) {
>> +	default:
>> +		drm_warn(&gt->tile->xe->drm, "unknown pmu event\n");
>> +	}
>> +
>> +	return val;
>> +}
>> +
>> +static void xe_pmu_event_read(struct perf_event *event)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct hw_perf_event *hwc = &event->hw;
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +	u64 prev, new;
>> +
>> +	if (pmu->closed) {
>> +		event->hw.state = PERF_HES_STOPPED;
>> +		return;
>> +	}
>> +again:
>> +	prev = local64_read(&hwc->prev_count);
>> +	new = __xe_pmu_event_read(event);
>> +
>> +	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
>> +		goto again;
>> +
>> +	local64_add(new - prev, &event->count);
>> +}
>> +
>> +static void xe_pmu_enable(struct perf_event *event)
>> +{
>> +	/*
>> +	 * Store the current counter value so we can report the correct delta
>> +	 * for all listeners. Even when the event was already enabled and has
>> +	 * an existing non-zero value.
>> +	 */
>> +	local64_set(&event->hw.prev_count, __xe_pmu_event_read(event));
>> +}
>> +
>> +static void xe_pmu_event_start(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return;
>> +
>> +	xe_pmu_enable(event);
>> +	event->hw.state = 0;
>> +}
>> +
>> +static void xe_pmu_event_stop(struct perf_event *event, int flags)
>> +{
>> +	if (flags & PERF_EF_UPDATE)
>> +		xe_pmu_event_read(event);
>> +
>> +	event->hw.state = PERF_HES_STOPPED;
>> +}
>> +
>> +static int xe_pmu_event_add(struct perf_event *event, int flags)
>> +{
>> +	struct xe_device *xe =
>> +		container_of(event->pmu, typeof(*xe), pmu.base);
>> +	struct xe_pmu *pmu = &xe->pmu;
>> +
>> +	if (pmu->closed)
>> +		return -ENODEV;
>> +
>> +	if (flags & PERF_EF_START)
>> +		xe_pmu_event_start(event, flags);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_pmu_event_del(struct perf_event *event, int flags)
>> +{
>> +	xe_pmu_event_stop(event, PERF_EF_UPDATE);
>> +}
>> +
>> +static int xe_pmu_event_event_idx(struct perf_event *event)
>> +{
>> +	return 0;
>> +}
>> +
>> +struct xe_ext_attribute {
>> +	struct device_attribute attr;
>> +	unsigned long val;
>> +};
>> +
>> +static ssize_t xe_pmu_event_show(struct device *dev,
>> +				 struct device_attribute *attr, char *buf)
>> +{
>> +	struct xe_ext_attribute *eattr;
>> +
>> +	eattr = container_of(attr, struct xe_ext_attribute, attr);
>> +	return sprintf(buf, "config=0x%lx\n", eattr->val);
>> +}
>> +
>> +static ssize_t cpumask_show(struct device *dev,
>> +			    struct device_attribute *attr, char *buf)
>> +{
>> +	return cpumap_print_to_pagebuf(true, buf, &xe_pmu_cpumask);
>> +}
>> +
>> +static DEVICE_ATTR_RO(cpumask);
>> +
>> +static struct attribute *xe_cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group xe_pmu_cpumask_attr_group = {
>> +	.attrs = xe_cpumask_attrs,
>> +};
>> +
>> +#define __event(__counter, __name, __unit) \
>> +{ \
>> +	.counter = (__counter), \
>> +	.name = (__name), \
>> +	.unit = (__unit), \
>> +}
>> +
>> +static struct xe_ext_attribute *
>> +add_xe_attr(struct xe_ext_attribute *attr, const char *name, u64 config)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = xe_pmu_event_show;
>> +	attr->val = config;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct perf_pmu_events_attr *
>> +add_pmu_attr(struct perf_pmu_events_attr *attr, const char *name,
>> +	     const char *str)
>> +{
>> +	sysfs_attr_init(&attr->attr.attr);
>> +	attr->attr.attr.name = name;
>> +	attr->attr.attr.mode = 0444;
>> +	attr->attr.show = perf_event_sysfs_show;
>> +	attr->event_str = str;
>> +
>> +	return ++attr;
>> +}
>> +
>> +static struct attribute **
>> +create_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	static const struct {
>> +		unsigned int counter;
>> +		const char *name;
>> +		const char *unit;
>> +	} events[] = {
>> +	};
>> +
>> +	struct perf_pmu_events_attr *pmu_attr = NULL, *pmu_iter;
>> +	struct xe_ext_attribute *xe_attr = NULL, *xe_iter;
>> +	struct attribute **attr = NULL, **attr_iter;
>> +	unsigned int count = 0;
>> +	unsigned int i, j;
>> +	struct xe_gt *gt;
>> +
>> +	/* Count how many counters we will be exposing. */
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +
>> +			if (!config_status(xe, config))
>> +				count++;
>> +		}
>> +	}
>> +
>> +	/* Allocate attribute objects and table. */
>> +	xe_attr = kcalloc(count, sizeof(*xe_attr), GFP_KERNEL);
>> +	if (!xe_attr)
>> +		goto err_alloc;
>> +
>> +	pmu_attr = kcalloc(count, sizeof(*pmu_attr), GFP_KERNEL);
>> +	if (!pmu_attr)
>> +		goto err_alloc;
>> +
>> +	/* Max one pointer of each attribute type plus a termination entry. */
>> +	attr = kcalloc(count * 2 + 1, sizeof(*attr), GFP_KERNEL);
>> +	if (!attr)
>> +		goto err_alloc;
>> +
>> +	xe_iter = xe_attr;
>> +	pmu_iter = pmu_attr;
>> +	attr_iter = attr;
>> +
>> +	for_each_gt(gt, xe, j) {
>> +		for (i = 0; i < ARRAY_SIZE(events); i++) {
>> +			u64 config = ___XE_PMU_OTHER(j, events[i].counter);
>> +			char *str;
>> +
>> +			if (config_status(xe, config))
>> +				continue;
>> +
>> +			str = kasprintf(GFP_KERNEL, "%s-gt%u",
>> +					events[i].name, j);
>> +			if (!str)
>> +				goto err;
>> +
>> +			*attr_iter++ = &xe_iter->attr.attr;
>> +			xe_iter = add_xe_attr(xe_iter, str, config);
>> +
>> +			if (events[i].unit) {
>> +				str = kasprintf(GFP_KERNEL, "%s-gt%u.unit",
>> +						events[i].name, j);
>> +				if (!str)
>> +					goto err;
>> +
>> +				*attr_iter++ = &pmu_iter->attr.attr;
>> +				pmu_iter = add_pmu_attr(pmu_iter, str,
>> +							events[i].unit);
>> +			}
>> +		}
>> +	}
>> +
>> +	pmu->xe_attr = xe_attr;
>> +	pmu->pmu_attr = pmu_attr;
>> +
>> +	return attr;
>> +
>> +err:
>> +	for (attr_iter = attr; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +err_alloc:
>> +	kfree(attr);
>> +	kfree(xe_attr);
>> +	kfree(pmu_attr);
>> +
>> +	return NULL;
>> +}
>> +
>> +static void free_event_attributes(struct xe_pmu *pmu)
>> +{
>> +	struct attribute **attr_iter = pmu->events_attr_group.attrs;
>> +
>> +	for (; *attr_iter; attr_iter++)
>> +		kfree((*attr_iter)->name);
>> +
>> +	kfree(pmu->events_attr_group.attrs);
>> +	kfree(pmu->xe_attr);
>> +	kfree(pmu->pmu_attr);
>> +
>> +	pmu->events_attr_group.attrs = NULL;
>> +	pmu->xe_attr = NULL;
>> +	pmu->pmu_attr = NULL;
>> +}
>> +
>> +static int xe_pmu_cpu_online(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +
>> +	XE_WARN_ON(!pmu->base.event_init);
>> +
>> +	/* Select the first online CPU as a designated reader. */
>> +	if (cpumask_empty(&xe_pmu_cpumask))
>> +		cpumask_set_cpu(cpu, &xe_pmu_cpumask);
>> +
>> +	return 0;
>> +}
>> +
>> +static int xe_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
>> +{
>> +	struct xe_pmu *pmu = hlist_entry_safe(node, typeof(*pmu), cpuhp.node);
>> +	unsigned int target = xe_pmu_target_cpu;
>> +
>> +	/*
>> +	 * Unregistering an instance generates a CPU offline event which we must
>> +	 * ignore to avoid incorrectly modifying the shared xe_pmu_cpumask.
>> +	 */
>> +	if (pmu->closed)
>> +		return 0;
>> +
>> +	if (cpumask_test_and_clear_cpu(cpu, &xe_pmu_cpumask)) {
>> +		target = cpumask_any_but(topology_sibling_cpumask(cpu), cpu);
>> +
>> +		/* Migrate events if there is a valid target */
>> +		if (target < nr_cpu_ids) {
>> +			cpumask_set_cpu(target, &xe_pmu_cpumask);
>> +			xe_pmu_target_cpu = target;
>> +		}
>> +	}
>> +
>> +	if (target < nr_cpu_ids && target != pmu->cpuhp.cpu) {
>> +		perf_pmu_migrate_context(&pmu->base, cpu, target);
>> +		pmu->cpuhp.cpu = target;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
>> +
>> +/**
>> + * xe_pmu_init() - Setup CPU hotplug state/callbacks for Xe PMU
>> + *
>> + * Returns: 0 if successful, else error code
>> + */
>> +int xe_pmu_init(void)
>> +{
>> +	int ret;
>> +
>> +	ret = cpuhp_setup_state_multi(CPUHP_AP_ONLINE_DYN,
>> +				      "perf/x86/intel/xe:online",
>> +				      xe_pmu_cpu_online,
>> +				      xe_pmu_cpu_offline);
>> +	if (ret < 0)
>> +		pr_notice("Failed to setup cpuhp state for xe PMU! (%d)\n",
>> +			  ret);
>> +	else
>> +		cpuhp_slot = ret;
>> +
>> +	return 0;
>> +}
>> +
>> +/**
>> + * xe_pmu_exit() - Remove CPU hotplug state/callbacks for Xe PMU
>> + */
>> +void xe_pmu_exit(void)
>> +{
>> +	if (cpuhp_slot != CPUHP_INVALID)
>> +		cpuhp_remove_multi_state(cpuhp_slot);
>> +}
>> +
>> +static int xe_pmu_register_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	if (cpuhp_slot == CPUHP_INVALID)
>> +		return -EINVAL;
>> +
>> +	return cpuhp_state_add_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +static void xe_pmu_unregister_cpuhp_state(struct xe_pmu *pmu)
>> +{
>> +	cpuhp_state_remove_instance(cpuhp_slot, &pmu->cpuhp.node);
>> +}
>> +
>> +/**
>> + * xe_pmu_unregister() - Remove/cleanup PMU registration
>> + */
>> +void xe_pmu_unregister(void *arg)
>> +{
>> +	struct xe_pmu *pmu = arg;
>> +
>> +	if (!pmu->base.event_init)
>> +		return;
>> +
>> +	/*
>> +	 * "Disconnect" the PMU callbacks - since all are atomic synchronize_rcu
>> +	 * ensures all currently executing ones will have exited before we
>> +	 * proceed with unregistration.
>> +	 */
>> +	pmu->closed = true;
>> +	synchronize_rcu();
>> +
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +
>> +	perf_pmu_unregister(&pmu->base);
>> +	pmu->base.event_init = NULL;
>> +	kfree(pmu->base.attr_groups);
>> +	kfree(pmu->name);
>> +	free_event_attributes(pmu);
>> +}
>> +
>> +/**
>> + * xe_pmu_register() - Define basic PMU properties for Xe and add event callbacks.
>> + *
>> + */
>> +void xe_pmu_register(struct xe_pmu *pmu)
>> +{
>> +	struct xe_device *xe = container_of(pmu, typeof(*xe), pmu);
>> +	const struct attribute_group *attr_groups[] = {
>> +		&pmu->events_attr_group,
>> +		&xe_pmu_cpumask_attr_group,
>> +		NULL
>> +	};
>> +
>> +	int ret = -ENOMEM;
>> +
>> +	spin_lock_init(&pmu->lock);
>> +	pmu->cpuhp.cpu = -1;
>> +
>> +	pmu->name = kasprintf(GFP_KERNEL,
>> +			      "xe_%s",
>> +			      dev_name(xe->drm.dev));
>> +	if (pmu->name)
>> +		/* tools/perf reserves colons as special. */
>> +		strreplace((char *)pmu->name, ':', '_');
>> +
>> +	if (!pmu->name)
>> +		goto err;
>> +
>> +	pmu->events_attr_group.name = "events";
>> +	pmu->events_attr_group.attrs = create_event_attributes(pmu);
>> +	if (!pmu->events_attr_group.attrs)
>> +		goto err_name;
>> +
>> +	pmu->base.attr_groups = kmemdup(attr_groups, sizeof(attr_groups),
>> +					GFP_KERNEL);
>> +	if (!pmu->base.attr_groups)
>> +		goto err_attr;
>> +
>> +	pmu->base.module	= THIS_MODULE;
>> +	pmu->base.task_ctx_nr	= perf_invalid_context;
>> +	pmu->base.event_init	= xe_pmu_event_init;
>> +	pmu->base.add		= xe_pmu_event_add;
>> +	pmu->base.del		= xe_pmu_event_del;
>> +	pmu->base.start		= xe_pmu_event_start;
>> +	pmu->base.stop		= xe_pmu_event_stop;
>> +	pmu->base.read		= xe_pmu_event_read;
>> +	pmu->base.event_idx	= xe_pmu_event_event_idx;
>> +
>> +	ret = perf_pmu_register(&pmu->base, pmu->name, -1);
>> +	if (ret)
>> +		goto err_groups;
>> +
>> +	ret = xe_pmu_register_cpuhp_state(pmu);
>> +	if (ret)
>> +		goto err_unreg;
>> +
>> +	ret = devm_add_action_or_reset(xe->drm.dev, xe_pmu_unregister, pmu);
>> +	if (ret)
>> +		goto err_cpuhp;
>> +
>> +	return;
>> +
>> +err_cpuhp:
>> +	xe_pmu_unregister_cpuhp_state(pmu);
>> +err_unreg:
>> +	perf_pmu_unregister(&pmu->base);
>> +err_groups:
>> +	kfree(pmu->base.attr_groups);
>> +err_attr:
>> +	pmu->base.event_init = NULL;
>> +	free_event_attributes(pmu);
>> +err_name:
>> +	kfree(pmu->name);
>> +err:
>> +	drm_notice(&xe->drm, "Failed to register PMU!\n");
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_pmu.h b/drivers/gpu/drm/xe/xe_pmu.h
>> new file mode 100644
>> index 000000000000..d07e5dfdfec0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_H_
>> +#define _XE_PMU_H_
>> +
>> +#include "xe_pmu_types.h"
>> +
>> +struct xe_gt;
>> +
>> +#if IS_ENABLED(CONFIG_PERF_EVENTS)
>> +int xe_pmu_init(void);
>> +void xe_pmu_exit(void);
>> +void xe_pmu_register(struct xe_pmu *pmu);
>> +void xe_pmu_unregister(void *arg);
>> +#else
>> +static inline int xe_pmu_init(void) { return 0; }
>> +static inline void xe_pmu_exit(void) {}
>> +static inline void xe_pmu_register(struct xe_pmu *pmu) {}
>> +static inline void xe_pmu_unregister(void *arg) {}
>> +#endif
>> +
>> +#endif
>> +
>> diff --git a/drivers/gpu/drm/xe/xe_pmu_types.h b/drivers/gpu/drm/xe/xe_pmu_types.h
>> new file mode 100644
>> index 000000000000..ca0e7cbe2081
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_pmu_types.h
>> @@ -0,0 +1,63 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_PMU_TYPES_H_
>> +#define _XE_PMU_TYPES_H_
>> +
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <uapi/drm/xe_drm.h>
>> +
>> +enum {
>> +	__XE_NUM_PMU_SAMPLERS
>> +};
>> +
>> +#define XE_PMU_MAX_GT 2
>> +
>> +struct xe_pmu {
>> +	/**
>> +	 * @cpuhp: Struct used for CPU hotplug handling.
>> +	 */
>> +	struct {
>> +		struct hlist_node node;
>> +		unsigned int cpu;
>> +	} cpuhp;
>> +	/**
>> +	 * @base: PMU base.
>> +	 */
>> +	struct pmu base;
>> +	/**
>> +	 * @closed: xe is unregistering.
>> +	 */
>> +	bool closed;
>> +	/**
>> +	 * @name: Name as registered with perf core.
>> +	 */
>> +	const char *name;
>> +	/**
>> +	 * @lock: Lock protecting enable mask and ref count handling.
>> +	 */
>> +	spinlock_t lock;
>> +	/**
>> +	 * @sample: Current and previous (raw) counters.
>> +	 *
>> +	 * These counters are updated when the device is awake.
>> +	 */
>> +	u64 sample[XE_PMU_MAX_GT][__XE_NUM_PMU_SAMPLERS];
>> +	/**
>> +	 * @events_attr_group: Device events attribute group.
>> +	 */
>> +	struct attribute_group events_attr_group;
>> +	/**
>> +	 * @xe_attr: Memory block holding device attributes.
>> +	 */
>> +	void *xe_attr;
>> +	/**
>> +	 * @pmu_attr: Memory block holding device attributes.
>> +	 */
>> +	void *pmu_attr;
>> +};
>> +
>> +#endif
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b6fbe4988f2e..2c5f258eee3a 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1389,6 +1389,14 @@ struct drm_xe_wait_user_fence {
>>   	__u64 reserved[2];
>>   };
>>   
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +	(((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>>   /**
>>    * enum drm_xe_observation_type - Observation stream types
>>    */
>> -- 
>> 2.38.1
>>
