Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBDFD2D0FC
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 23:12:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D390D10E56E;
	Tue, 13 Jan 2026 23:12:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YvQxO+4K";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37D510E56E
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 23:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768345930; x=1799881930;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=iTsPryuT0LJRE/igx/sO6u7P5oKPi1aADgprNLMz4Ms=;
 b=YvQxO+4KMOwqMC9eLl7S9T4i7CiEIUmpJQ8zGlpnjyP2XWzq992kQ7an
 PRQpPB8hbkuMbSN6iCsv3wB5eqXS81Rm0nQjAw3dNRbQzfX7Aw1tr78vC
 1K1DNXKFJjD95K56F3IUhQfr3qBUmp20POmQbNeNDff32zh/cKY3ZlnTS
 VBBRjKN+O9ksapKdQ0OHHPRUzJqUGK6qErDDBBCv5v6EbySmgKYk5SbFf
 nUdbe05P75bqmS4msdP3rfTrrK8z7nP8x8nJXiuic+UFEcInYYCHWjRhg
 tz1OmzPhUna76BwTjaAF1dA/QvwrArCSNltzCjvtK4bFvJBtlHnJH1/Oc w==;
X-CSE-ConnectionGUID: ZW/MqWSySE+QpEhHwkaAhg==
X-CSE-MsgGUID: gYc6JeiVQz68bGVmKLGGYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69376758"
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="69376758"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:12:10 -0800
X-CSE-ConnectionGUID: c5QBaN6pTH+sNpYsrvWycg==
X-CSE-MsgGUID: sRisY71DSUyFjx5eXTeWPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,224,1763452800"; d="scan'208";a="204307614"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2026 15:12:09 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 15:12:08 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 13 Jan 2026 15:12:08 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.61) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 13 Jan 2026 15:12:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hCoYNvvx/v/zd3PLHTOl9aqur/gCqSslbm8cElRgcPYjL3bRJ6+eQAWAV9Nhd4QzhsTiHZR2jFVgtcNf3AT0f+kYax84sxOXwovREr2aFZDG8FO3Fqf6xlrflgzoDl9tCFQZUR/TcA9FeZee4IJCVG2AzGLyYbKz25hRhLXMwe5ROd8uoJ2IXpXbQV1K3RaawiTA+PLDrnLChzP7LFZQpHvxd3k0rXW/atGKYMBDJD0+dDi91n665I2pJ90+VxoK9Utpow2ywsvh/TPNpSxBXBiJ5Y7gSqsUb1OD787pM9kr2C2J0Fg+/OVFLr1gH4QkFSXtMVn+svgXhluRLf1f7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41ZYkbRqsRi85zpqKfExnshPUQmRxXUt83qy6Q+PbfQ=;
 b=Z3fDMkwe6NkCBCvzyAaNADRRmRTvYkzboWRh65zng4RMUstJZGx5Fo39QyvadZjyL2Oj9wr7DDVKtcWsbTBwey/yZ9iRvkzpv/Y0rB3/Xhc8WeD8TroLu3/P/9ivN07a6LC3f7LCtA57DG8d/Tz55OUpU/RFF7+e1EcSUpADJobunCeApiRHBBEAi5LWh2XDooLK+RNYVUxWq9xRymbDVMHrOeKYVshXfcq75BrwYj31A3tvEf5QoTEl8S9SsVeLAouOpOsyTJ8U7BgiiKwlMfOqPQ/LnazxGcr4GdS+Ni09PZtIf5F2CaaypHAgJ8dOIcJ8cmX/YtxH/gFekF2Tjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS7PR11MB6063.namprd11.prod.outlook.com (2603:10b6:8:76::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Tue, 13 Jan
 2026 23:12:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 23:12:06 +0000
Message-ID: <f81a2bbc-7528-468a-b150-dea8c487b553@intel.com>
Date: Wed, 14 Jan 2026 00:12:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] drm/xe: Make xe_ggtt_node_insert return a node
To: Maarten Lankhorst <dev@lankhorst.se>, <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20260113121807.1303124-1-dev@lankhorst.se>
 <20260113121807.1303124-5-dev@lankhorst.se>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260113121807.1303124-5-dev@lankhorst.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1P195CA0077.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:59::30) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS7PR11MB6063:EE_
X-MS-Office365-Filtering-Correlation-Id: 5733744f-3a45-470b-62e4-08de52f92b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MVFOaytDMnlwdzByc0JzZzVDY0VoOEdiV2dlM21PTXF1RG16dEdSRHJrOFU2?=
 =?utf-8?B?QytnR2RrYXZRZWwwN1lTcEhyMTIvZlFDMHRqanhZNkI0SlJ2b0F5LzJ1bkxD?=
 =?utf-8?B?Rng3NFp0eVNTaUhtTmgzUGxRaUFVdWVQa1MxTnNaQkcvMHN0a0gxNEI4S0th?=
 =?utf-8?B?SGtXMm81Yng5dEtFSWhxVi9rSkVyQ1piNm9sSzlYRk9RdkpXMjZqZiszSnc1?=
 =?utf-8?B?R01PaWJhT1pYdkxmRjRXL0FKM3p4WGFjVVF1cXBEL0x4NTFOVHJrV1Y0NFMz?=
 =?utf-8?B?TmF3Qk9pbzBaQnRKSENkek9VUjZMRlNsZXEwZHBNSStWZHIzdGtuZnlIcXRp?=
 =?utf-8?B?NWdJN05uZk05YjJyV1Y3OW0xQ2ZkMm55NnJ1TzI1dnNSMmIvSEtCeG5ML1Ba?=
 =?utf-8?B?eFhibENmY3NHdGFHVlFTZFpDQzRVRzRYckw3L2xIMjYzcFpjSVdPR0N4NDNX?=
 =?utf-8?B?dHB1M29tTE5ZZXVIemtqZlZoNCtRZjhXNktBU0FtQ0Zrc2xodThFMFk1cWR2?=
 =?utf-8?B?REZqZlBLUTVndVgyaUVWRFJVYk9oaHZXT29uVTFTdmRaTzF1bnBVbTVYVWxS?=
 =?utf-8?B?TnZSZXNTRTZGN2cwQlVFSThFMG5VaG1zWGRVNmQ4WCszWUZLYk43cWhVcnJZ?=
 =?utf-8?B?SktWTkVYYWF4eThKWXV1K1RUSG1XcG54QmFjdzEzYXBGZyttNnJhMHdZK2dD?=
 =?utf-8?B?ZXJEcW9mUlZob1h5cWhpTXM0cHlYSkJ6N2x6cUNTOTNuWkFNTFhYbzFlVHJV?=
 =?utf-8?B?SzdFeFdSbmFjMGV6ZzFKVnd3Wk5icXU2WGRqQjBMYml5SXcwc2duamVXY0gw?=
 =?utf-8?B?aGZlZ1hHNnQvUDhtak9DNFo1RVFGTzR3blZHM3BibUJ6cVNWUmhLU1k4MTZP?=
 =?utf-8?B?SDBTVERNRTQ4UGNqME1pL0RPVmFsYjFObUVmOVhnUFhSbWtJNzdWSXBFeHA4?=
 =?utf-8?B?dG56YmYrY2htN3JvN0lzclVvUWJsVHlqd0hQckdnQ1FMblF4RG9oamtnZUtt?=
 =?utf-8?B?c3pCT2k0bUh0bU1JeDZzSloxdTVTbllkYjdYaEtXZG4rYjFBQUdYMGtSVXdq?=
 =?utf-8?B?QnR0d0dYdWpLcGFCeldUN0dTa0RYZUFNd2R4RzdlcURxVG1NTjREczh3UW95?=
 =?utf-8?B?MDJtSHB2TitQZHIwMnFpU3hWWW8vcjdkQUxnd2JhZi9NQ0x5bnBaMnAwNXNl?=
 =?utf-8?B?QklWR21KZ1c1ZGcvUXNOZEdua1BWNnF6T0ZHN2JXcURvOUdWRGZYeGRIRGs1?=
 =?utf-8?B?dVNkc3QxdTFZd0JDSURjdkl4Z2p0bmZkaVMwQmM2amVsc3FVQkZZMmhOcHpy?=
 =?utf-8?B?amoyUEVVTHNUdVplN1lOVGNuZXVwd2hseGdDOVFtb09BTWxsNWFsT2JPR3Vy?=
 =?utf-8?B?cHhyclVzS3lrczdJdnFkb3VjVHh4RFJmTmxOYkdhSVRxenJxZ01LSVU3cU1B?=
 =?utf-8?B?aDc4RHFRejRoN3R2VVY5c2k2UUpPa1NRTFlHTzk2WjZUdDRwY3R1UnMvditS?=
 =?utf-8?B?Q3FPRUxhOVpNb1F5TGV3MlZVcUpLMXlIT0JOY3FtQ3QvbFpiMUFML3l3RThh?=
 =?utf-8?B?VTI2NjE5ZGk0YzBXRGlkMHcwTnN1TlBwbVNvUjg1cVF5Tk1xWUd2bHBrRy91?=
 =?utf-8?B?YjF1TURyRzVvZ2JtdSsrYU10TTgyay9xbVNHYllybTIzMkRnZ21lNm1yVEl5?=
 =?utf-8?B?dzhzZGVWWUpxcmcxZ2U2enN3Z3lxazlSeTdPTWFuV01rLzI1RTVQSGZGVUxM?=
 =?utf-8?B?eERVTERCVWU1SVBmdDRuWXNGQ1E1SGtjemdNRnFBdDVMd0dVVXkxRTltcVly?=
 =?utf-8?B?TnRxcDJwZnpxMkxoU1JCRmpEcDk0UkNwK0ZkYUxSNHcwVFVVeFpuM1l3WjFG?=
 =?utf-8?B?OGJCenJZMElkSGxlYnNubXkvUUFuM0ovaHhNYnRkZzlSSmZRWUlBN3Y1eEFG?=
 =?utf-8?Q?GmCbSAHqG9An9W++X16U7rdbFqNclQxb?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVpLRXVRaEZkVG44YWNHemViSVJVTDNKdUNaVXlEell1dGsxSlZNMUhhQXVT?=
 =?utf-8?B?elYvTFRyY1FmSnNGaThRWkgwcjZWRTlZc3FtZ1NGTWpFQVJ6bEJ5SEZ3S2FP?=
 =?utf-8?B?ZmplbjVvallWNU1Rd0VCMXdnTnJodjFPS25HeXVmWjkveGNnMjZhamtLRk1m?=
 =?utf-8?B?Uzk3SEN1cWFyc3dBM094V3E5a2hGVkpkVWcyRnV6RU53cXMxV2U1eVJEL1VZ?=
 =?utf-8?B?dHZrQ014Ny9GZkMyQi92dWtTZmU3aGFWSHV4emNiTUpGVlpmU1pDbHlhSDFB?=
 =?utf-8?B?UHZhT0RFeEpIenkrWU9hWHFZbUlrRXdaVjltcmxTM0pTMFJHQWdJU2ptbUoy?=
 =?utf-8?B?NkI1WFF3OGRjV1ZEQ01qQ3BiMkNGMm5zNlNkcmJycVArcnB2YTd2Y0wyWVBi?=
 =?utf-8?B?NU9MQlZ6ckZjbXBxeGM4Kzg2aEpJR3F4Yk01TGx1SWhORFFjUFZpSGZVR01D?=
 =?utf-8?B?R0VpVHcwSk5RcnpNUFNVb2RvU3ZzRHdVc2RFY29HcU04VFM2dkFlSXBudjVV?=
 =?utf-8?B?dU40TXJBSmk4aWJncWZMSHpNbnhBNkh6KytKZlNYR3EvdnBGbmdQVTdmUCtU?=
 =?utf-8?B?d3FSUjV5cHBSY0ZKVGcwdlBSdm9nak0rMEtlM1V2dStNS0FUQVdROHJycnRq?=
 =?utf-8?B?NFZRTUJUMGJjWW16MXY5V2lONFZjQVliblA5ZXYzbXNWZFhoRy9JNVJTYmx2?=
 =?utf-8?B?SHNXZE13M1ROTWFMQ0ZlQktOL0h6Q0ljRVFTeVJmUkR6T3VUWFVEVnQ3ODJM?=
 =?utf-8?B?NUpuRGd3K2pLeGJsWHNVRldHZVl6RDAvWkJyRU93MUFpaC9mdlloS21heHF6?=
 =?utf-8?B?L25oYWc2U3JscnlWRU9XNTBQRUN3TXJZRklYSkNLVXNEWjBqZFd2RWZ2QVRQ?=
 =?utf-8?B?UmZFck1tR1Mvc2lTL1JrT1NOODNDQkkvbVJhNW9FdGdDeGdyRmJOUmVRb0Nx?=
 =?utf-8?B?aE95Zzl2L2tZOG5ibWRNQldoQndkcmZzSmFIaHJTdURMbm9MeDVxZFdkVGFP?=
 =?utf-8?B?THhPNm1Dem4ybWdhbXRzblRmZVVGUkhGMnJGbWVBdEx6dEREZ2xkTTNwdDlZ?=
 =?utf-8?B?ei9iT3VTZEZsUUQ3bWJvR1VJRXRHMkZscG5kdGtOS2RORnFNUHlCNDNNeHV5?=
 =?utf-8?B?eC9FZEpRWjVjWU94V0xRUnZlNUp5emM2Q2FjdkFCYmJZRUoxUHBGN0M1Y3JR?=
 =?utf-8?B?ajNHOTZ1YnhKSTZGUFZtZ0pLOS84QzJQdXg5OEpNUVdnSVZQdVJmaFREdlBM?=
 =?utf-8?B?ZHY1N2RrTHBvdmNqb1N1QkJaWDkxSVFEbXFCRitibk85WEQ0cjlFVUxJbDU4?=
 =?utf-8?B?ekZnZzAydVFUR3RNdVgydC9qUFJ4SmNCbU02NVl6ZUNXUDZGOHJpK3NsS096?=
 =?utf-8?B?cW1lRTFBdm9tbmdOM1JTR0xBalJlR3Y4cjI2MG1zMGIrbmVqZXErQUVyNUc4?=
 =?utf-8?B?UnZkMkNsdTVqVlB1S29nb05xL0tjbkZZUEpZam13NU5YV1RHNmNlZEoxUlgx?=
 =?utf-8?B?aHI5Q1daZkRmQmROd2k5WHJXaStJMnVUcVJTT2g0aUpERXlVWnlVOVNmaFd5?=
 =?utf-8?B?YkJVT1hhK1ppV2xCT1BoRzYwUmhENHJsK3NScXprdjJ0c1QwaUlCSVREaGw1?=
 =?utf-8?B?dGtUSzFQRUQvOEpVZEJIYVQ3YVdXdnZrSmRIMFUxaXJCTWI2czdFeVhWSW05?=
 =?utf-8?B?VGFKQnBRc3Z3cko3bHA2Yk1wL1pIT0R5ZE5pWHlHL2c3TW9hSDlPeG1VaklQ?=
 =?utf-8?B?WmRXQTd6RUpuQWs3WmtBc0xIUFppT21TSHcxbUFEeWZlcTZ6UUtDL1Rkb0R5?=
 =?utf-8?B?clYvZ3k3ZUpMTlVuMnBjZXordlhyVTltNkk5bkNDRGxJK3dCdHRydjMyai81?=
 =?utf-8?B?QnRiZHJKS0VRQXN1RCswQklqLzV0RHl1cXpqZG9nUHdJczlYcEJqNmNHZzZH?=
 =?utf-8?B?dXJaVVlIcjkzWGppWEViUkU3VGJXZjg4aVFvRDVFWjF3Zi9QWVJFbUVPdmtZ?=
 =?utf-8?B?dy9XcksyLzI0OUNCNk1TYzdNeWJqUVpxUm1XMGFwZnJBYnlFR2Z6MlFVK0No?=
 =?utf-8?B?djloMkt5Zi91TE5PSjVHR25jeEhIV1hXeG5GVE9LMVk0ZzRGS0RETk5aRXMr?=
 =?utf-8?B?NlpjQzZhS0V4d0hsVVNWTTlWOGhiVnpYeWlmbnRXTytMeTBLOHNwcG0veW5k?=
 =?utf-8?B?SXFId1k4ZVNrYkNFY29Ca3B2NXdkSDFmZld5N0w3UEozeVNpcTNNaWZxZG9x?=
 =?utf-8?B?dWJGMUt4YmhvV0N2U2xWcTk2KzJVVkFrYkx3OTNWeWFVN3BCSVo0UXhaY3ZW?=
 =?utf-8?B?TmRaeWt2QjN1ZjBKb1huTG5qQ3Ntc1VsK3JNK2lkd2FSUllxamZKTXRLOUNy?=
 =?utf-8?Q?Zks23vIA7e8tBwBs=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5733744f-3a45-470b-62e4-08de52f92b66
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 23:12:06.3186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SxzpIqq58ATMhh5/Un5C1Ap1OAspgWpj0SbF/MH/sVlC3katiE6pmVSMFkszL4SLcVQpgdDntU0WH3auJkTbXXxilBzcXJV/gDSCsx/P0NQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6063
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



On 1/13/2026 1:18 PM, Maarten Lankhorst wrote:
> This extra step is easier to handle inside xe_ggtt.c and makes
> xe_ggtt_node_allocated a simple null check instead, as the intermediate
> state 'allocated but not inserted' is no longer used.
> 
> Privatize xe_ggtt_node_fini() as it's no longer used outside of
> xe_ggtt.c
> 
> Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c |  6 +-
>  drivers/gpu/drm/xe/xe_ggtt.c                | 76 +++++++++------------
>  drivers/gpu/drm/xe/xe_ggtt.h                |  5 +-
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c  | 24 +------
>  4 files changed, 38 insertions(+), 73 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> index acddbedcf17cb..7aeee6680d78c 100644
> --- a/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_guc_buf_kunit.c
> @@ -38,12 +38,8 @@ static struct xe_bo *replacement_xe_managed_bo_create_pin_map(struct xe_device *
>  	if (flags & XE_BO_FLAG_GGTT) {
>  		struct xe_ggtt *ggtt = tile->mem.ggtt;
>  
> -		bo->ggtt_node[tile->id] = xe_ggtt_node_init(ggtt);
> +		bo->ggtt_node[tile->id] = xe_ggtt_node_insert(ggtt, xe_bo_size(bo), SZ_4K);
>  		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bo->ggtt_node[tile->id]);
> -
> -		KUNIT_ASSERT_EQ(test, 0,
> -				xe_ggtt_node_insert(bo->ggtt_node[tile->id],
> -						    xe_bo_size(bo), SZ_4K));
>  	}
>  
>  	return bo;
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 85babe7ab43a0..7538ba13cbab7 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -459,6 +459,11 @@ static void xe_ggtt_initial_clear(struct xe_ggtt *ggtt)
>  	mutex_unlock(&ggtt->lock);
>  }
>  
> +static void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> +{
> +	kfree(node);
> +}
> +
>  static void ggtt_node_remove(struct xe_ggtt_node *node)
>  {
>  	struct xe_ggtt *ggtt = node->ggtt;
> @@ -614,68 +619,51 @@ static int xe_ggtt_node_insert_locked(struct xe_ggtt_node *node,
>  					  mm_flags);
>  }
>  
> +static struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> +{
> +	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
> +
> +	if (!node)
> +		return ERR_PTR(-ENOMEM);
> +
> +	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
> +	node->ggtt = ggtt;
> +
> +	return node;
> +}
> +
>  /**
>   * xe_ggtt_node_insert - Insert a &xe_ggtt_node into the GGTT
> - * @node: the &xe_ggtt_node to be inserted
> + * @ggtt: the @ggtt into which the node should be inserted.
>   * @size: size of the node
>   * @align: alignment constrain of the node
>   *
> - * It cannot be called without first having called xe_ggtt_init() once.
> - *
> - * Return: 0 on success or a negative error code on failure.
> + * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
>   */
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align)
> +struct xe_ggtt_node *xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align)

this should be now called:

	xe_ggtt_insert_node(ggtt, ...)

as it doesn't take a node param any more

>  {
> +	struct xe_ggtt_node *node;
>  	int ret;
>  
> -	if (!node || !node->ggtt)
> -		return -ENOENT;
> +	if (!ggtt)
> +		return ERR_PTR(-ENOENT);

can't we drop this?
we don't expect this function be called with NULL
or after we fail to allocate xe_ggtt

> +
> +	node = xe_ggtt_node_init(ggtt);
> +	if (IS_ERR(node))
> +		return node;
>  
>  	mutex_lock(&node->ggtt->lock);

we can now use:

  	mutex_lock(&ggtt->lock);

>  	ret = xe_ggtt_node_insert_locked(node, size, align,
>  					 DRM_MM_INSERT_HIGH);
>  	mutex_unlock(&node->ggtt->lock);
> -
> -	return ret;
> -}
> -
> -/**
> - * xe_ggtt_node_init - Initialize %xe_ggtt_node struct
> - * @ggtt: the &xe_ggtt where the new node will later be inserted/reserved.
> - *
> - * This function will allocate the struct %xe_ggtt_node and return its pointer.
> - * This struct will then be freed after the node removal upon xe_ggtt_node_remove()
> - * Having %xe_ggtt_node struct allocated doesn't mean that the node is already allocated
> - * in GGTT. Only xe_ggtt_node_insert() will ensure the node is inserted or reserved in GGTT.
> - *
> - * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
> - **/
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt)
> -{
> -	struct xe_ggtt_node *node = kzalloc(sizeof(*node), GFP_NOFS);
> -
> -	if (!node)
> -		return ERR_PTR(-ENOMEM);
> -
> -	INIT_WORK(&node->delayed_removal_work, ggtt_node_remove_work_func);
> -	node->ggtt = ggtt;
> +	if (ret) {
> +		xe_ggtt_node_fini(node);
> +		return ERR_PTR(ret);
> +	}
>  
>  	return node;
>  }
>  
> -/**
> - * xe_ggtt_node_fini - Forcebly finalize %xe_ggtt_node struct
> - * @node: the &xe_ggtt_node to be freed
> - *
> - * If anything went wrong with either xe_ggtt_node_insert() and this @node is
> - * not going to be reused, then this function needs to be called to free the
> - * %xe_ggtt_node struct
> - **/
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node)
> -{
> -	kfree(node);
> -}
> -
>  /**
>   * xe_ggtt_node_allocated - Check if node is allocated in GGTT
>   * @node: the &xe_ggtt_node to be inspected
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
> index 403eb5c0db49d..6d8679bcc38fb 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.h
> +++ b/drivers/gpu/drm/xe/xe_ggtt.h
> @@ -18,13 +18,12 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt);
>  int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 reserved, u32 size);
>  int xe_ggtt_init(struct xe_ggtt *ggtt);
>  
> -struct xe_ggtt_node *xe_ggtt_node_init(struct xe_ggtt *ggtt);
> -void xe_ggtt_node_fini(struct xe_ggtt_node *node);
>  void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_base);
>  u64 xe_ggtt_start(struct xe_ggtt *ggtt);
>  u64 xe_ggtt_size(struct xe_ggtt *ggtt);
>  
> -int xe_ggtt_node_insert(struct xe_ggtt_node *node, u32 size, u32 align);
> +struct xe_ggtt_node *
> +xe_ggtt_node_insert(struct xe_ggtt *ggtt, u32 size, u32 align);
>  struct xe_ggtt_node *
>  xe_ggtt_node_insert_transform(struct xe_ggtt *ggtt,
>  			      struct xe_bo *bo, u64 pte,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 9f2525f3cb379..a6414d164166e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -484,23 +484,9 @@ static int pf_distribute_config_ggtt(struct xe_tile *tile, unsigned int vfid, u6
>  	return err ?: err2;
>  }
>  
> -static void pf_release_ggtt(struct xe_tile *tile, struct xe_ggtt_node *node)
> -{
> -	if (xe_ggtt_node_allocated(node)) {
> -		/*
> -		 * explicit GGTT PTE assignment to the PF using xe_ggtt_assign()
> -		 * is redundant, as PTE will be implicitly re-assigned to PF by
> -		 * the xe_ggtt_clear() called by below xe_ggtt_remove_node().
> -		 */
> -		xe_ggtt_node_remove(node, false);
> -	} else {
> -		xe_ggtt_node_fini(node);
> -	}
> -}
> -
>  static void pf_release_vf_config_ggtt(struct xe_gt *gt, struct xe_gt_sriov_config *config)
>  {
> -	pf_release_ggtt(gt_to_tile(gt), config->ggtt_region);
> +	xe_ggtt_node_remove(config->ggtt_region, false);
>  	config->ggtt_region = NULL;
>  }
>  
> @@ -535,14 +521,10 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	if (!size)
>  		return 0;
>  
> -	node = xe_ggtt_node_init(ggtt);
> +	node = xe_ggtt_node_insert(ggtt, size, alignment);
>  	if (IS_ERR(node))
>  		return PTR_ERR(node);
>  
> -	err = xe_ggtt_node_insert(node, size, alignment);
> -	if (unlikely(err))
> -		goto err;
> -
>  	xe_ggtt_assign(node, vfid);
>  	xe_gt_sriov_dbg_verbose(gt, "VF%u assigned GGTT %llx-%llx\n",
>  				vfid, xe_ggtt_node_addr(node), xe_ggtt_node_addr(node) + size - 1);
> @@ -554,7 +536,7 @@ static int pf_provision_vf_ggtt(struct xe_gt *gt, unsigned int vfid, u64 size)
>  	config->ggtt_region = node;
>  	return 0;
>  err:
> -	pf_release_ggtt(tile, node);
> +	xe_ggtt_node_remove(node, false);
>  	return err;
>  }
>  

