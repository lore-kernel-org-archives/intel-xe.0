Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF08D3000E
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 13:54:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156C710E36E;
	Fri, 18 Oct 2024 13:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bv5Z/YVz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B67E10E36E
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Oct 2024 13:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729259676; x=1760795676;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVw5L7QZVOECqq7dIjSZ7fFOGzFT2dnAVqIo5qPXarM=;
 b=bv5Z/YVz6qBpnmqFE94dbQPwf3U6cgNl4TBoFcXJUsQj7UsIB7MGTq/o
 jwAR5whohQIdbdj3TWJExqSukTfhxN+5TX0aztS4uweBGESg101I66e+B
 IagfMY1K7GqcNYbqrp1wBVzi9PRE+9Rgu+WedKMgY6ucx7GOiVmxCp6FD
 MnqbC1125apQ9RnMFLqJmtsPfK0IMmyzxxOK6MWhbSh3zIM+uK9GwOcoy
 H4rLHPezThh5e6OL48sqLqlwPyoh3zn5Joa9nkLwMGMCbyS35jUHrfSq/
 fSE3FMSPdV6o9tPV/xbdMIayDsVgehfinEC0VwfilRn+kjJPDZQzbXIGJ Q==;
X-CSE-ConnectionGUID: du/9++x0SKOSEdy2hWVDEg==
X-CSE-MsgGUID: 78JNs1KNSnOohQEQQCq/8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39920508"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39920508"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 06:54:35 -0700
X-CSE-ConnectionGUID: 2Nl1mL/kSD6vvDzxVdXC7A==
X-CSE-MsgGUID: 27NOY4FGShOkBidIparU5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,213,1725346800"; d="scan'208";a="78828616"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Oct 2024 06:54:35 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 06:54:35 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 18 Oct 2024 06:54:34 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 18 Oct 2024 06:54:34 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 18 Oct 2024 06:54:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcHoZiXNeZwFBGlrXjl+g3vuZVvKqg52HsPKxMO6tn4kIbEGlQuG7zXC04nzUu84NG78FiRlBhdKNKnR6JGPdoKAQxJpfapvZnRY0srOb36owEY2GlsTSLDT8CTxv256SXxZb55OyErHj4pQJOrTpXaEoQH8yJsyzpNG2/InKcOC0fo6coEjGNM8Rva4BCUJHIQb7yFHJkvNaFdGA0v8/zcsNLpcuJQ3DLKyF9k3IDWx+yRIG4QZDBholyjy3jO0o8YJWh1yVdw1qK8q4meqkIHTaMbd2N93+P6p5XscWCdfbM098sXynBQxs4tXTOukDO8VM0HUYhnTpK8AeQaogg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK5zlwutW3/wF25rLBfegWkApAuPTemOFWHC8CR6hQY=;
 b=RlXVe0OE2WPsO2PwrNTE5LnKFI7jd132xkDy3cR5uMEdROoRzzRHxYdF32VDKT95nzPiBW8S57snlpCE8/WOFDHcRaGhXjyfYhYbyltQfnUXxSayKfNSr8lFHzXRk/RX+2iFrWJBlpLGKUe/k2u5ZXQg4oM3Sveg59AOdTUbqhNy9avWGO6/68eEUZFZJYwgOote3qA5D41n1EAYIjJijdC7mbwUlN1mPlEwa8LXDcKR+e8ETQJlfv4X+azXSm9z7jEub9cUikFi1u8+aVd3mKezg5MMZxlvm6XD360JhbcdF/jtPNjd7YuYdy9t5dxYbA9fWMD5wARzHm/fuji5dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB6541.namprd11.prod.outlook.com (2603:10b6:8:d3::14) by
 SA1PR11MB6872.namprd11.prod.outlook.com (2603:10b6:806:2b2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.19; Fri, 18 Oct
 2024 13:54:32 +0000
Received: from DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347]) by DS0PR11MB6541.namprd11.prod.outlook.com
 ([fe80::e268:87f2:3bd1:1347%5]) with mapi id 15.20.8069.020; Fri, 18 Oct 2024
 13:54:32 +0000
Message-ID: <fa60de5d-a96d-4154-abf1-2b2767fb4fa1@intel.com>
Date: Fri, 18 Oct 2024 15:54:26 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/ufence: Warn if mmget_not_zero() fails
To: Francois Dugast <francois.dugast@intel.com>, Nirmoy Das
 <nirmoy.das@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241016082304.66009-1-nirmoy.das@intel.com>
 <20241016082304.66009-3-nirmoy.das@intel.com>
 <8f873b94-ac9a-430c-901b-30bc47a6ccd2@linux.intel.com>
 <ZxJobXkrqE5Ibns2@fdugast-desk>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@intel.com>
In-Reply-To: <ZxJobXkrqE5Ibns2@fdugast-desk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TLZP290CA0008.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:9::20) To DS0PR11MB6541.namprd11.prod.outlook.com
 (2603:10b6:8:d3::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6541:EE_|SA1PR11MB6872:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a3a569e-dfd9-4226-3d87-08dcef7c647e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z1RyMTZKYVRyZW1wOEJORXJIZGVPdGVVcW1QRlZ3d1ZhZnVzZVhZOUFIK0gz?=
 =?utf-8?B?T0krRHplZi9zUS8zbDVBR2tWUUVmSmRhbnRPbkM3V2QyNTJ4ZDlRY2V6S2RE?=
 =?utf-8?B?RlpuTjVrUzZnZTlpemRtNkRjc3ZkdUQzOEZLMWorQmNVa3MyR25IWllhUjJD?=
 =?utf-8?B?STFFQ2tNOEozeGg0KzA0MTJMUkFTR2VoUjkyNDIzbkk0bHZpM25WM0x3ZjNW?=
 =?utf-8?B?WDRQWnZ1YkwwalhYakNhK2hoTXFJc1lzOHcyYlhSODVTNTF5cHNleXJWdlB4?=
 =?utf-8?B?R0ZuZVUvVDhWUm9xUGlocnFlZk1qWS8xUUNxYkcxK0MraUczNWVlU1YxbXZv?=
 =?utf-8?B?bFkrbnUraFE3bWo3SWY2aEpnWldTdlZrWlg2OTc2Ykt3MDFuRm1YV0VEOFRB?=
 =?utf-8?B?MEdjMWFIVFlQYzdwNnZsZHhrbUwydHRFUzdjSjhOd2tXZGlRVDVjWkVPTVNE?=
 =?utf-8?B?SGo0Y29kL0poZlM4VmJmWEc5VFZ0d1VmMEpZMVpLbmNxb0I3VWd1eDRGWG9Z?=
 =?utf-8?B?S0p3dnhxSTBScnZpRTVCRmdjYzlhQ2d0MXZIQzdpQ0dIb2NtbmpONjA1clVk?=
 =?utf-8?B?L2plUmVnZGY5OG5Cd2l5WURhaGhBbnk3ZGVPb1g2SmxqYUlBVzdYV2FUUnNr?=
 =?utf-8?B?OHFZQ0VwK0lrNzA3NzFUTWNhemo3a3I1NGlJamlWZ0NOK2VWMUhYWmJBZFp3?=
 =?utf-8?B?YlhiNzZNWXp0dklWd2EyR3Rqc1dnRitxdlFSbUdneFRIQTZtVXFuTytkNnU4?=
 =?utf-8?B?QjB3LzdDRUNjbjRQU3d6RTJVQ0o3UEc3eTlxUDVxNFQwRDFSdWNyVzJ4Nk16?=
 =?utf-8?B?ZG1tTjFGRHpoQkx0OFEvQ3VXTG4ydklBV09NWUdzZ3lBUk51ZytQRG5QWEk4?=
 =?utf-8?B?NnJjUzlVOXBMaUQxTjlMSU4wUjBXRmwxbFZlYVhMUHcxYmtkc3BaWE9NRFpv?=
 =?utf-8?B?bTEzemlnSTNkNGJCenBkNFJtd1FQb0RJT1RUcFM5eTJoa0doVVN5bWErSDNI?=
 =?utf-8?B?eVlBcnRDaUcva2FLREdQRFBqTUpXU1V6S2FsR2lQOVJnc0Exd1lEZ3Y2WkZo?=
 =?utf-8?B?Y0RCS0ZVTDcvR29uenRXYnFqUU1jZ3lVMFRlQmFKZFFtOEw2RElXbnhBNmNr?=
 =?utf-8?B?OHhGaU5OTDNXWU1zQ0xCVWx4TWtiNDlnNXJEUlNMY3Ivc084cDNISnI3WHIv?=
 =?utf-8?B?T1hqNmRwS2FVSHp4U2pLeU03UTBlSGtNYmlJTE9VMkNGOEd0Tnc4OVJ1L1lL?=
 =?utf-8?B?eWRaYXV1QndMcjFVb0RxZDM5MGpvUmN0UGRZb3dpQm83SFFmMk5aZ3dFZjJJ?=
 =?utf-8?B?Q2IxWlUrUlloZUZTTmpwWEtZU2J5NDZtNDhWS3JhU1FPcExlOEhIZWQ5cmRj?=
 =?utf-8?B?ODRMNG5HSXRKODYrZUFVcWh2WHlFM3BVSGRSSHB1UklXNWZReVFrY0d4cFBr?=
 =?utf-8?B?aEdmZkJpWjNjajJRUDJ5TnhXdEhNT0J3SGI2TldTOE5laW1adkhVbHRkNWpT?=
 =?utf-8?B?T291YlJtMDh2QWhPdFZ2MDhnK3hzUWZsZjRQSHdMTFlNYzJiS3NpeE9WU2Y5?=
 =?utf-8?B?bWNhQXMzL2hOd3R4QW1wdytLS2pLZzB0MnlkMUtMbWNlSHkyNDhFZHVXSTdB?=
 =?utf-8?B?cWtQMjZEQk4xV2Q4dHh6RUFyOGt3dXMwa1I0c1dPbHoyOU9FSnRLVVpqbUkv?=
 =?utf-8?Q?qEZAFXAcpS4LX+LzzxJy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB6541.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZVNUU1NWMkZMRjM1MEpISXRTYnhOcEF3Zk9lN2U1bVR0RVU2TFZ5MnBxdWJL?=
 =?utf-8?B?QkFxdGNzTkg3c3h4aGsxTWRYbEpGeVVKVkVVbDVDNVhKVU1nSnZSZnZ6SENu?=
 =?utf-8?B?UW9IZ29oTFFld2dDWVo5S0diWll4SDNDR3Q1UzdCbmtzU0pMOGU3eFc5Y3NS?=
 =?utf-8?B?WlBjbXVMM3pKZnlsaTdzMm03ajU2YjdPSHlKbXg2R1FIQzlvRnRIM0pQSHVM?=
 =?utf-8?B?WVdxbFRvNzM0Wndib2JyTXdMemVYczRMWHh3ajNFOG9jdGF5RmxYVzVVYzFq?=
 =?utf-8?B?dWdUWEk2RGpmTVV3REcyU0dBdG1YUmJTVFp4OXltcDAvaENyY0RsR0tsZjZ4?=
 =?utf-8?B?RGtlRG1icnAxQ3V5K1RZS0ZJZk5USmFuT0pzSkxreDU4NE8vUU40UUJnRlpH?=
 =?utf-8?B?MEJHK1hFMTRTV1o4aTUxT1kyclZxbXUzdWhKNzRFLyt3SFF2aW91Y2ZHZk5I?=
 =?utf-8?B?U1g4VnEwYk1HVHZCTlJaN2VmUjJZRG55R2syQVlWTHVtNGtTSVFndS9iVGti?=
 =?utf-8?B?bzNDbDFBeVhMWStLc2N0em9ISER1ZTI5SjlaWm4zT1lWZlQ5UGwybXRPTVlO?=
 =?utf-8?B?MllBdWtLNE1KNWdxSkNFKzBrTGxycVBOTDVzcUJaYzdXYjJnUFByN1p1SHg4?=
 =?utf-8?B?VGZYMnZlMzh3UUpDRTdrYjdoSjVkalVTMXQ5OVFTY3UzcTlSdFdmaDhUNE5t?=
 =?utf-8?B?Vk9CVnBCRmZCZG03dkZKUjI0SExUdkt3TzhPb1E3RncvbDRCaUZYZU5SNG1S?=
 =?utf-8?B?dmg5YnZGTFU3ZkRId3QzN2FENnVoeUxiaU9UZ2hZdzNiZWFLVlV0TDdtdWoy?=
 =?utf-8?B?UDNocnMycE94WW9FWEEvaGYvdS9ZeU9LOGN4bVNoblprQS9KNmRRdkxzbTVo?=
 =?utf-8?B?dzJEUXVkUm9ob2Q5OTcrbzRmdndJc3VZV3ZBZFNJeXZMZFdRcGFvTDlJNm5R?=
 =?utf-8?B?UTRTRCtsOUJJZDhiR29hdTlicHNaaWVYU0NjcFlpREpNTFcrY1BXT2RXam1S?=
 =?utf-8?B?SlQ2cnhNT0kwYWx1bXBCbVVpTXpWUHB5Zjd4YVcyM3VaOWxJdWNWMTdYaGJz?=
 =?utf-8?B?eUtiU2JZVDNCSHJma0x3K1E4a1p3WGhkcERmZkdkVm43cmhscm4veW1iNlpU?=
 =?utf-8?B?Zi94ejNEcDdiZHBuVlpwTU85ZnBHNHNxOHlyNUEyWUdIVEZ5MkxnSytFdzA1?=
 =?utf-8?B?Y3RraGJpSjBJMGlTYzVKU256cHk4aUcvaVp6WUg3RVBDUXVwd2JpVk1sN2ZF?=
 =?utf-8?B?ZXJ3Zjl6NFZrWEJTQ0RMQ3BJN2Mzb2FqS1FWbDc3R0FaZDhvd29veXg4aE1a?=
 =?utf-8?B?ckJXcVVpS2l3RnQ0NEtQdmxZdGlRZUxYZzkwS1UvcXg3OVhjNWZSUk04TEpM?=
 =?utf-8?B?a3pTaHRzdkVtRFo3SW1Wb1c2NWczdG56UlJSUjlOSU1FRHpiYjJlZVBQU2M3?=
 =?utf-8?B?eTI4R0xjZUROeEJJb0wzcWlQQzJZRGVLRCt0Yy9FMVNTOWIvRk42c1hPOXY4?=
 =?utf-8?B?M0VYK21IbXRnaGYvMzRLVlJSVnQ2b0VhT0laMktla0VVV1hLL3p6aWtqYjE2?=
 =?utf-8?B?YXVLbUV0RjRieEdQR1IvV1UvWGNIeGltM2lDOGJVN0tZd1poQUdOcVI4S3Ir?=
 =?utf-8?B?aXhiNE44QjZFc3dTMTAwMUFSRndlYi9QcGVOdWxoajdJcU5CYWYzSkRhWkNF?=
 =?utf-8?B?SFJkYUQxUUNMTXo0SlRFQmJnbmZDR0MwSHRLWmdyTTRTTHY4UVYzSGpZTDlN?=
 =?utf-8?B?ZWU1QlhYQVovWWtxdjhXU3JkMVhUbnBYQXM0UjJNazZFemJIaUYvLys2WTRP?=
 =?utf-8?B?cHRLbUZnekx0M3VTT2hpOUNYdm93dHE5SUc3ZDduUmU0NURjZi9WdVRRd2sx?=
 =?utf-8?B?YnZpaktQNThOMWlXVFhyOThxM3hzQjBzTENwcUtOdHZsV1BWaFJ2Sk1OY2l5?=
 =?utf-8?B?cUxKVnpJaEgyWW91WmlNakVvczJSS3FmVDZQRUhzYmxrOVNRbitlY1hLWU5L?=
 =?utf-8?B?a3RpaVFGU004TzBUYmRXMHJNL0V2MTZjbDhJVU9wVUxkdCtDaVNkLys5bXRN?=
 =?utf-8?B?VHoxYmlleTZTL2tMVS9QdlVyUWNPT3JGUzJCK0JPV0Uwci9EOVJWNkM3UStS?=
 =?utf-8?Q?Zb18pbDQZ59K/whdnTEK1aDqs?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a3a569e-dfd9-4226-3d87-08dcef7c647e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6541.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2024 13:54:32.3183 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 54vZDp5oalcGbbSMAiUve27kbD2iKCqBnukQW3OGXlc804omt+/Ifb9hnTz5HvhML5vAKm7PetLTHLmBmIC0GA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6872
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


On 10/18/2024 3:53 PM, Francois Dugast wrote:
> On Fri, Oct 18, 2024 at 03:41:16PM +0200, Nirmoy Das wrote:
>> Hi Francois,
>>
>> On 10/16/2024 10:23 AM, Nirmoy Das wrote:
>>> This shouldn't happen but seen this while debugging ufence timeout
>>> issue time to time so log it to isolate this particular case.
>>>
>>> v2: s/XE_WARN_ON/drm_dbg(Maarten)
>>>
>>> Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/1630
>>> Cc: Francois Dugast <francois.dugast@intel.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Reviewed-by: Francois Dugast <francois.dugast@intel.com> #v1
>>
>> is your r-b valid for v2 as well ?
> Yes it is.
>
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>


Thanks!

>
>>
>> Regards,
>>
>> Nirmoy
>>
>>> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_sync.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.c
>>> index 2e72c06fd40d..a90480c6aecf 100644
>>> --- a/drivers/gpu/drm/xe/xe_sync.c
>>> +++ b/drivers/gpu/drm/xe/xe_sync.c
>>> @@ -83,6 +83,8 @@ static void user_fence_worker(struct work_struct *w)
>>>  			XE_WARN_ON("Copy to user failed");
>>>  		kthread_unuse_mm(ufence->mm);
>>>  		mmput(ufence->mm);
>>> +	} else {
>>> +		drm_dbg(&ufence->xe->drm, "mmget_not_zero() failed, ufence wasn't signaled\n");
>>>  	}
>>>  
>>>  	wake_up_all(&ufence->xe->ufence_wq);
