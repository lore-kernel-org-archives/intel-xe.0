Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 779BBC98318
	for <intel-xe@archiver.kernel.org>; Fri, 25 Sep 2026 00:33:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10C9F10F83E;
	Fri, 25 Sep 2026 00:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LY57tpxD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B26D110E9E8
 for <intel-xe@lists.freedesktop.org>; Fri, 25 Sep 2026 00:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790296399; x=1821832399;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=eLaEooiaiCrIuHjsrkPZPHwlrwJxrTQ1UzKx63syyWU=;
 b=LY57tpxDloVEvg9u8bTFtzT4jH7LrDZg946Czk7rg8VzSnGMWlwOlz8R
 I/XUGPxtXZuvA8scTUGkRqeWsCNDTk5eFHExyaNu8lujT9NZqv1mfOD8A
 gp1cSLMH8DHzRDPc1TKta4iQH75RCrJf87hA3S3RFN/tiv7DPRROqrst2
 tfp/7rK9VOwyGg7XbJdX31uzzNho7ElrOs1BFmycO7MKf9VC4RACvGKCs
 I0IUX1J/8g1t5C6cfOMravyK7Zy9q/xxPQdKi8Xd6YLZQqrD3bFpP0JcO
 AaVfYFeVU239NmILQZP5/Oz/ZDAfCXkz/UrQpe/8RA/HPfepByr73jRgz Q==;
X-CSE-ConnectionGUID: AoxtZizcS3ewIqlSCI0AeA==
X-CSE-MsgGUID: kr0F1ylyTjG7MkmkjsjvvQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="90144919"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="90144919"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 17:33:19 -0700
X-CSE-ConnectionGUID: UUHscVOgQC+KAchLK5qAGQ==
X-CSE-MsgGUID: h2sAR3y5R1OpQUU3QroO4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; d="scan'208";a="274370749"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2026 17:33:19 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:33:18 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Thu, 24 Sep 2026 17:33:18 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.39)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Thu, 24 Sep 2026 17:33:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sXxS4l8p48ZowjNdnKQ757G/kkntLeivKfph/w0HCUNiIivE/99MDryDj6aDnf1+zJ7H9x8DvP7Y+4WZRbQRY78ZtlrCS+PIfEjnZjc9PDHaOuf9YyGErSSQbDQTpHuVlz9IjQAJBmdKj3eSVx4KiV7uOS8vM+yb066FlJDck5lO6MHtVgVHc8ELfvhN+NHUq523vpo8lX9HwoyjpCZHVNAm1fTi8oRlFmzLanV5yO2wGyRyFbEwD+heftzchR4mKqhIcA5wysExTc/sqG2MBuKSi/kB4c7pPNrYacfgqtH3T5KX5y+BLhq1R1lOSzl0ueu452MixUniCs8O1xg88A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gwzw70PqHkZD6x02rCF3BxN0JGcczrTzmzTi25tMpM=;
 b=YKx7gd25XrQ62AQvrkuFQHitE/tdOxtU8SBdEvG5cqJzQW61p4MlhAr8axt0LkqxFSCU+qDtFPT4UVtNRMmX7UDtF7HoNIxxXt4M7Z5wNpe0ZEYHmZAgb3IbXtjWoxycHydCImvtAsPU1za4nScxXqMauazRLL7a1DKQ82Lr4/nDq66DYF3gGzqQckP9bC2n2pV8xY7yArKOCttRIXR63tr/hN14ZvP1ATZkE38r+rDBZ5PmGGJ9suPgjCAGjojqnMrcaOoyl5r4qMz3411gQ0qS+7dTVzEcOPVk+7C3YnZImowPXijFrZTZ6bfg+NgSyRPIAUgIjbyLIV8czkJGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5232.namprd11.prod.outlook.com (2603:10b6:5:38b::14)
 by CYXPR11MB8690.namprd11.prod.outlook.com (2603:10b6:930:e5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 00:33:16 +0000
Received: from DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429]) by DM4PR11MB5232.namprd11.prod.outlook.com
 ([fe80::2ddf:5a8a:8a8f:c429%4]) with mapi id 15.21.0451.014; Fri, 25 Sep 2026
 00:33:16 +0000
Message-ID: <6b7effb2-5e3c-4b4c-8270-836c81fd84ed@intel.com>
Date: Thu, 24 Sep 2026 17:33:13 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe: Set mask bits for CCS_MODE register"
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
References: <20260924-ccs_mode_drop_mask-v1-1-5b2b35708b83@intel.com>
Content-Language: en-US
From: Daniel Charles <daniel.charles@intel.com>
In-Reply-To: <20260924-ccs_mode_drop_mask-v1-1-5b2b35708b83@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To DM4PR11MB5232.namprd11.prod.outlook.com
 (2603:10b6:5:38b::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5232:EE_|CYXPR11MB8690:EE_
X-MS-Office365-Filtering-Correlation-Id: 274ab85b-c632-4a0c-7ccc-08df1a9c971f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|10067099003|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: /LfpDI0zPVtHDuTcq3efAUnVEuo8umrk0VbuTW1P0QoFbVOLhyevsd198LfPW8MeAYIlDO6KyL42HshI5sdVegbPi5CMaI4WTHMQFyJtxXFwmbyb6331v4l3rfYuVBtmDFUBX2jG4k6TlsfsdZVeaTj1q7WkcGzekEz2UAf6B9hHPX2zgkHI6ecX8hzLHiJVD02CyJaPM1zYJL8HQSRK03UqlXcJpAm3a5tJEDiQC/p267n2z8mJzVdYjc3XBVOquQkPzNtsokT5B2Dww3mm6rGMpzvYdtXQPLeOFCmviJRLHBcrHESbRg6X1yQQcSO8MDhwPjUQmlfkNcWRl+89KIX3VeQoQ3lFCSSlqUng8pKJnNw1rSkpBREnDGrF4IQHY9vKc/eq9oADPTeukxXloPANnxZeFOEOVgKkdihV4o4jIVZOyUbBauNFC+RhM6KtERPbU9BCqPLVAqRvJDE3k5PSQGPUdhGKAeVWlkQND8MQOVOXOHGSyQcbjZuudkj1zPz2dMLTDCwj/dDHng7nB1BKFzflfyf91cwcVNVf4Zxe8fW2TshQU7QzjCz7YbTe8lx+f8lL9dcoM+Q1H735sq4HcBIbOuG+uGssigPwRDcgZoHZKMOUeD2gJLaw+cRhTYni6PLQsn9NsLvWKWqDTrWk/RlNmO4QW7N3tLyMzZ4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5232.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(22082099003)(18002099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHo1VTNEV283UVArV3o5NXNqWVZubGxkNHpCNUY2a1I2WlFBVUxZR203NS9P?=
 =?utf-8?B?RzV5MGNiZDF5QldEK3hPOHRmdjM5ai9mZTFDSmZrb1ZzVlRaVXUraGVta1NW?=
 =?utf-8?B?QTA0ZlJlRWZyWkJrMHR2MXo0Q1JzYWtiNWU4aEdFOUtnN0NjSEkxRElJRVdr?=
 =?utf-8?B?Tm9hV3JQckUzV243WitBamwrVTY1QUZIKzFRdWc1OTltU3BZQXR3eDBLV01K?=
 =?utf-8?B?dC9NMXYvMWx5ZTRMbFprOU82VVdJV0tyRXlleGpkcVdLYjM5TnIyRmZxOEhF?=
 =?utf-8?B?TlpWUlBBY044VVhrK0NZcjFCVlB5L1UzUnVTSVlkbDRSSEMra1JLcjBXejJy?=
 =?utf-8?B?NFI3MlFZNTNUNER2VWlDOGhwZGJiT2JxL2N3b1NFMTVzYkhLMHNJcDlTeVlB?=
 =?utf-8?B?ajlLM2hDTUluaXlQdTFTU21JcFhQZGhCZ29PSnJoWjBOUktucWQzZ0N1Rm44?=
 =?utf-8?B?WktqbGFwWkdseTJoMDhNVFNoRGdlaGlYM0xCdE15NVQ0MjNsREhXR3ZmdnQv?=
 =?utf-8?B?TDc3aWdseFpnQjBuYXhVbzN0dDl0RzlDUDVEOXhhRWt1VnJmQm95Z3hKR2py?=
 =?utf-8?B?enJiZWlPajQzWHpYSlVtR0UrWm12bWQ3em82dStSclFzci9lVk5pSDg0bUw5?=
 =?utf-8?B?Z21MWCt4bUM3ZXBHeVFPVExKYnp6OXVVamxyT2dRRDAybE5qY0xuQk9vRTY5?=
 =?utf-8?B?YVZSamtFYnRpdlNxSXBocWZkU1o1c3FKVkdkTG9tUWJIVFBGQWdxWmtrYVRn?=
 =?utf-8?B?YndTZm5idGVKWGdsTWd4VjJlNjIrNVJqYnBlUG9HL0JQbllLd29kOG1uSy9Y?=
 =?utf-8?B?WWQvVWY3RU9PSXNFaktjWEp4akRVdEgrZ1d4dGxBaTNMMmdudkE2MHNwVStX?=
 =?utf-8?B?VitNekdNbVZnS1VKZGZJZGh0NWtWam9LcHJmcUdHK1dWdTh3TGh4eTFZcWNL?=
 =?utf-8?B?a1BrTHBmR3ZQYlE1dERyaHVpNG13TDNiOXFNQTFWV1dRN3FpRDhRN2hWVnVY?=
 =?utf-8?B?U2dLZXpmWW5TT2JpLzhzWHlvNG94ekRBYi9CS05SbnIzdlU3YmpjNUJEMHZl?=
 =?utf-8?B?VWl2ZWpKZ2ZYcGR6STNtWlVRUVFhMzNPS01xRXA4dGRtUFE4TnlCMmpSeENk?=
 =?utf-8?B?c3FqMnBBSDJOR25IR0dQYTdJdzlHUi9XS1gyQW9oQ0doYU9vQVN2dWN0aDFo?=
 =?utf-8?B?M3l6bXJ3VGJiSzQvVUNNZ3dkMm9SaTA0T1VYZWhsRFQ2eENIM2dUVDR2UXBj?=
 =?utf-8?B?ZnNLRXI5RGFiZUZYY25jTzl5RmFpcVIwRldMcmQ1eHZVYTdQa25aQ1gxemU5?=
 =?utf-8?B?L29EcFpqTEZaakhOdUpzelZ2KzVwbmFnd2ZXcXVzWVJBSCsxeCs2dS9mZUwy?=
 =?utf-8?B?QlZMYjM0aTM3MTRGU0ExZE9teFczMC9DSWhyQTdvV254MDFydGJKL0dTeEo0?=
 =?utf-8?B?Mk1iK2hBRVhjczRIejBRSGVYeHhrYVJjcXMrSXVuZ3N4Y3lZUTlKVzhrODVN?=
 =?utf-8?B?d2IrWCt0cExKT284VzNuYTR1cDU3WHFYUVRhV3ljNlp5OU9TRWlnTmJvK0cy?=
 =?utf-8?B?dE1BNzFieVRiN0V4ZTkzTHB4ZVRhNk5NYlA0RTFGb2VMTTB4c1BtUVR2Z3Zk?=
 =?utf-8?B?Y0wrR3owcGFJNHU4Q3loUXZtcUJybUIrRG9iY0l0aVdabDA2VGhlMTlZYTlp?=
 =?utf-8?B?MTZkejdPRnF2NGVpb0hSM0syWWcyLzhRWlFoVDE3YThXN1VXQ1NlMHNKaTY4?=
 =?utf-8?B?S2RoZXpnWU9WQjBDOUR2RkcyZDh4UEFoZGRtOWt3b1luUXZSLzFYNjVGWXBr?=
 =?utf-8?B?QXo3MFZrb3AvWmN6YXh5TWRDeXZvRGs2eEMzUC9BRTRzQUxXUjdmaXRBek5y?=
 =?utf-8?B?TFNsUlhKWE11SDBFamlZR2pPdTkrS2sydENuQ203VXRTcUNXeXJJVHdMY1Vj?=
 =?utf-8?B?MDZlaEIyTThqK3ZYZkk4cTcvaVpBdEVOWDFYY2JrSnZ5ZEtabFJyeEVYdkNl?=
 =?utf-8?B?OCttdXhmRnhzdzE1bENKcnhJQ3hjMUo0RWk5d3AxUXBZMEVIMHhxQ1k2aXZL?=
 =?utf-8?B?cXBQbVh0U0NkdVRodUN3SkxEVjRtekhTNjlhSGxLWEVBREh3b05pb2g1NU5K?=
 =?utf-8?B?R2tsdVlLa213MTdTSHlkSnFySHhrZVZUZmZkenVvcE12ZkJacUdEbDlKdDVp?=
 =?utf-8?B?VjE3Zk11ZXRGeWpDU0pNTjcyaElWbHpwbVBTQnBIcnUyY3ZjODNuUkhMQ1Iw?=
 =?utf-8?B?L3BGQXJtcUo5QTh2OUlubW5SMnRWelF4Nmc1Mll3T3NSN1pkRDBGaGR1Rzhw?=
 =?utf-8?B?QWlGdWVVbko1OTFXbnArRmM5dmc0MVhMeEFVeUdsOW0rTFdob2dIQT09?=
X-Exchange-RoutingPolicyChecked: wdCJxJ1mA7AIjNU1uqz7jZ0Hn8OHSXnQXy8rs4F7IMU+QE1x6fdG6/bXA7ONa2NKHAf3CXn98erEApvp6/pF2MthlAIP/HRBeXydv2p6vhqQbpVvxRABAqB/fu6zMrVI8RsG0f7srwcLSil3bSo9dXARTWMdKMarrcu0l/CqTXYvyVEmi9G69II2J8ceObVe8ZI1GAvmnbsfe1rBp4IYbQR2Kzf8JWs4LT/ZYjRLEKpVakHECVBN/I2g1F0HbjjAjwMT0yu3GuuzSESjL3VZimYQR2eOUJ77acXZ7ozseweSeeKpSscbeoDrATtlZCdlBT1xzPZLrdK/SNBUe8T45g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 274ab85b-c632-4a0c-7ccc-08df1a9c971f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5232.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 00:33:16.3889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zc4TTltRzQPJu0Aaud1/2oqzBrvXEnA2HZOvHbXAWRR/YFDbgxOgg9abADZjmIT2/TTt5wLFQjjyKV90t0sZ6kBbIxg01bSWfr6PKpb/1bg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8690
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


On 9/24/2026 2:08 PM, Matt Roper wrote:
> This reverts commit 23ea2c7572d4735ef66beb1e4feb8ae510b78247.
>
> A recent bspec update dropped the details about CCS_MODE being a masked
> register (i.e., bits [15:0] are only updated by register writes when the
> corresponding bit in [31:16] mask is also set by the write) on Xe2 and
> later.  Apparently the documented mask bits were never actually
> implemented in hardware, so all register writes will update all bits of
> [15:0], just as the register behaved on Xe1 platforms.
>
> Setting the non-existent mask bits in Xe didn't have any negative impact
> since none of our existing code was trying to use the mask to limit
> which bits were updated.  However this could have caused problems in the
> future if we ever rework this code in a way that tried to rely on the
> masking behavior.  Update the register definition and drop the use of
> the mask to align with the new bspec definition and avoid potential
> mistakes in the future.
>
> Bspec: 55887
> Cc: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 2 +-
>   drivers/gpu/drm/xe/xe_gt_ccs_mode.c  | 6 ------
>   2 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 2e059cb36c82..926b14e32c40 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -636,7 +636,7 @@
>    *   [4-6]     RSVD
>    *   [7]       Disabled
>    */
> -#define CCS_MODE				XE_REG(0x14804, XE_REG_OPTION_MASKED)
> +#define CCS_MODE				XE_REG(0x14804)
>   #define   CCS_MODE_CSLICE_0_3_MASK		REG_GENMASK(11, 0) /* 3 bits per cslice */
>   #define   CCS_MODE_CSLICE_MASK			0x7 /* CCS0-3 + rsvd */
>   #define   CCS_MODE_CSLICE_WIDTH			ilog2(CCS_MODE_CSLICE_MASK + 1)
> diff --git a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> index baee1f4a6b01..224a15675203 100644
> --- a/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> +++ b/drivers/gpu/drm/xe/xe_gt_ccs_mode.c
> @@ -70,12 +70,6 @@ static void __xe_gt_apply_ccs_mode(struct xe_gt *gt, u32 num_engines)
>   		}
>   	}
>   
> -	/*
> -	 * Mask bits need to be set for the register. Though only Xe2+
> -	 * platforms require setting of mask bits, it won't harm for older
> -	 * platforms as these bits are unused there.
> -	 */
> -	mode |= CCS_MODE_CSLICE_0_3_MASK << 16;
>   	xe_mmio_write32(&gt->mmio, CCS_MODE, mode);
>   
>   	xe_gt_dbg(gt, "CCS_MODE=%x config:%08x, num_engines:%d, num_slices:%d\n",

LGTM after checking against the bspec article.

Reviewed-by: Daniel Charles <daniel.charles@intel.com>


>
> ---
> base-commit: 2ac16c180109b3f1ed00e7a2c4459eaacfc80371
> change-id: 20260924-ccs_mode_drop_mask-142dc655e631
>
> Best regards,
