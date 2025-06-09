Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DAFC61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 17:13:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB6510E3C6;
	Mon,  9 Jun 2025 17:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nce4mDd+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DECD10E035
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 17:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749489233; x=1781025233;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=GQcX4hJQ7jD/JN64UOojmrO2vCaFK9bYRWU6a4UJRfU=;
 b=nce4mDd+DGtZIuYPWMSA5AT+4OZXfsdmf2aibzk4DGAY4TjGaBiwcqXd
 2KAneIdHtFTNwB1wgRFrepL9XN9InAtStvvNvEENyCBd42Mx8ISFVqy74
 wlCW1369KA+3fijx0ZyW9V2mJCbmDJOsl9gFnvvVg4yY/+oVU1KJOCeGJ
 1ne0tR/KOOKXIf9N3B1Wjq8luoT2q7jjGH/rf5sEj5JgwDetrIi6f7Vj0
 G9a0CMpr6BQfxudAfeXXkOxr2XSK+nAJ1VfUyTF7YQs+viDOBeVuee6Oj
 5jkNymz/VmXvLsISjurruMfr+kPYuRGT05Sj+RS6Hl0ZVS8L1Y5ykMo6W g==;
X-CSE-ConnectionGUID: ai5QMKowQGSzLN4jlgOaAQ==
X-CSE-MsgGUID: 0WccVyDfRFej2WUSwnokvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51719409"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="51719409"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:13:53 -0700
X-CSE-ConnectionGUID: 0wh7ZzSoQRC1B7+VvQVLJQ==
X-CSE-MsgGUID: cvhL3/bxTYiGA0cwgXlroA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146456194"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 10:13:52 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:13:52 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 10:13:52 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (40.107.212.43)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 10:13:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b3n+qdsUKoRfuJRE5m4NSIoY5pNKCRwa7Bw9SNYeAe3Oj9QJDiwKSJIBkz+3ZiKsO/9YBh+1l14j06NG/XQCsfLtRkhD6ML8ptEQEKbmooAMyGzxFT7vf1E+a7Yb1YD2SqGyKbHDynKR0l+9GxMPN8WCbYIZe8CCIhfnjzwqr9poQXAl0XI7A9wYVVuxq2jtgLMvgK+KrDStdnwbeayNXDjrq1D4OS8Ie6QJa5RTdyHvi7xBkAs/xkQks1NXRoq7ORRUek6ImTr6tRqDxSryxKiZ6nz1Lazxuq7ruyUbjJDBgX5Mo8/BMvY+4vEFnaLBN9LZn1FAzdpMAsdwjVXD5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z15XK1Jp6F837Z6UfyehYUCHhFz1viQNrfMEPbTUVtw=;
 b=ba6dzIe1RREp7esbBOOlLkerOaUlimti7OWgTae9CSQ/C+RLFFDeJKX36+WPWc27ZpnqdjR5EFDmczEUA3bi9TnjxsUXvOPIVw/DDS9rltIvlia142EGHavLkoanU5ThD2N2ik1xg9fzKMzsN14Rbjshc/HziLTZsmPvv1eXqdQa1J/PQ/JiWizEAa7Z5EB6AlZOCFZgvyYkYLHyONqCla8iksBuo3B8LR2Paichf6RgjLTI841jBh4UKmOmqgaz++WLCSo7wk4VP+M1DyJJ5a1fDrxWHFGMlc6w0+kn8Xo+8EefZSSBoKLjlhbV8vIjBjkDPrUGV92v91LlQ60oKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB7510.namprd11.prod.outlook.com (2603:10b6:806:349::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.22; Mon, 9 Jun
 2025 17:13:44 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 17:13:44 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250606195104.1771715-5-dnyaneshwar.bhadane@intel.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-5-dnyaneshwar.bhadane@intel.com>
Subject: Re: [PATCH v2 4/9] drm/i915/xe3lpd: Update bandwidth parameters for
 display version 30.02
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Matt Atwood <matthew.s.atwood@intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>, Matt Roper <matthew.d.roper@intel.com>
To: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Mon, 9 Jun 2025 14:13:37 -0300
Message-ID: <174948921780.2052.12545268320202523972@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0236.namprd03.prod.outlook.com
 (2603:10b6:303:b9::31) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB7510:EE_
X-MS-Office365-Filtering-Correlation-Id: 0eb37da9-a14f-424e-46c8-08dda778fd1f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VW9EaVk1NjMwdXd5UFU2Y3Z2TjBGdDdCTlZIOGR6SVl1b2pVYmhmYjRMWEFM?=
 =?utf-8?B?cE9OMkxHVERBM1daUmY5Y1UxUGJuMU9aelV3bkZFbHBxL3BFaXhldkJOSnB2?=
 =?utf-8?B?V3JPT1FZK3NnVEprSEdjUW93QnZ1YlI4VTZXbXdUOTRJL1Q4aFc3SG5vL2tp?=
 =?utf-8?B?b3N1SThGcFVFMmJWa2czOFpmeU1RQVR0ZDdDTVVlemJremdmaGpSRDgwNGR3?=
 =?utf-8?B?ZFBYNUJudnczUWRsckJmOFJwa2VIVWU2T1VnTDc5OEdOd1AwNExReDIyNEJE?=
 =?utf-8?B?U0xib3hobU5GcnNuNXRScHRDN3B5WnZnUldKSXFiYllnU3FkdU9lbnRLUWJx?=
 =?utf-8?B?QnRjRllTeXJYK3I3L0orSEwrMTkxUmFzYVJYbjMvNHdOOVVuVEI2TysyRUll?=
 =?utf-8?B?Ym45RjJQTXM4VmpzODkySE1pVWZ3cnczWUxCYlo4Kzh5ZWpUVnE0My9WVlFt?=
 =?utf-8?B?L2lZK2lnYXVtRGt6OEE3UVhSNnBKa0cvQnJXZHROR012UFV3bnpybTcvc2lX?=
 =?utf-8?B?VnNSalhPVFk1ZzRKZHQ3RU1GYWJYM21LdmxTNW9vYXlMRkR0aDEreE9MQjhL?=
 =?utf-8?B?OVlnbEVXaXFCdzNaTmFSUmtpRGVuUElnZUFSMzMvL2cyM25qYWMzK0FZMGtn?=
 =?utf-8?B?dXZzQXdSVnN4R2VuNkY3SCtEQmRUNFNnUzVrVk02ZFdLbzRuRU5yUzBVMjB0?=
 =?utf-8?B?akRJT1dma1paV1lWbWpMSjZ4N0g2ZVdTR3A5dVM5b3FHbUo4d2pjMVhRRXNa?=
 =?utf-8?B?ajZmYS9ranRWUzh3aWZqb2FzU0VjNWlhcVVmRksxUGRISWxVK2FVeUtJL0Qy?=
 =?utf-8?B?S3lmd1FvT2VST05MT1ZEYzBaYytwSmR1bGdHcmJVMmtvVlBwdldNcWNvT1pQ?=
 =?utf-8?B?cW4zcDBUdlc5RDFxWXdneHdxbEhUKzU5WVlsbTZEcy9CU1A0Smc4L3ZTRGpk?=
 =?utf-8?B?RFhlSkI4RmNsQ1BiS0dNOThFc1BrMG1FWE9EOVVaMW84MDdKb2JqazRvdDln?=
 =?utf-8?B?bkRMSDVqdm1wUjVMZ2lnU0IvVXRxS1VHb1FMKy9tS3gwOERkTFBQU3I0U0RY?=
 =?utf-8?B?OEJHa3c5c3Q2b0Q1aFE2dHlBSW1LRWltV1d0R3ovVlZGODcxaDBFbmJwcVg0?=
 =?utf-8?B?S0d0UWFTUUJob0UwRGwvUkQvUXZMNWFYT2g1TkM0czI2Rm5zMzJKRm9UcDNn?=
 =?utf-8?B?QUViVnIxYnl5MGpTekVtOWN4bGRyc3oxa1gxdXV3UUgwUnU4M2JoSWZpdzZH?=
 =?utf-8?B?Q1FQZml0NDNKSGRtU2VlbzlNbVYyR0FDcUVzc1NUUmhYNmtxOGdrUTZaNERK?=
 =?utf-8?B?NnVqbU5DenVsYkNsR1diNDhwTGV1M0hqMWdZNWhHZmxzTUc3M1hNc1FYbE95?=
 =?utf-8?B?MVRTMjQvREgzV1JSY3VEODFQRXZrbmZqWXRyT1crUmpZWVpMb1Z2MTF1U0V2?=
 =?utf-8?B?SlZnYytIcWdXbktwU0I1K2JnRHJleDJxUi9XcmpHb1ZpUzZFVVQxZUJZZkVH?=
 =?utf-8?B?OHFTbXBOSXRBSWxPZ3JYdHVhU2tFMGxLMTZFNVU1cS9wRjVrWFpNL2V0UkpT?=
 =?utf-8?B?bHNMRnphdzVsbTVsMnpkTE1uR2RMREdBYThuSk51RkN6VElhYkk3UzhRdXU2?=
 =?utf-8?B?YmtCZEFleTV2cjhjdldqTmpzL0JqVE90QUpqTVJzTDhJaHZLTTFGNjBjbU9Z?=
 =?utf-8?B?RkFKMmh6NXdQWS8yY25QSlZGNXh6cjkvdm83SElHd0Q0VVVQcWo3SDVDNTNj?=
 =?utf-8?B?bUZ1bndacmh5cDdTWWFVNVp6aFB5WDA3QTBEUjZYaGhIV05UelkxKys5K2Ft?=
 =?utf-8?B?aTBzem95eHprdXk1R2NlUTlWTDUzd09CUG1ZT3h2WHV5d2dSTXoyWDl3bjV4?=
 =?utf-8?B?bStIQ3lZalpWR3F0K3E4MUJ5Z3BQQjdZL2xjS1RUbmo5VU5ZaDdsckJZTThY?=
 =?utf-8?Q?Zlcp/xd7gx8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXhrWWVDRDBxOTNodm1aVlpBM2hhTmtWd3E5WW1nS1AyM3QxRGQzd0hzQm9D?=
 =?utf-8?B?K3VTcFZLajNFUEI2YWJuWGZsQkJrVWpWZXBmbUVtTFA3Rm85amJrNWlVTWEy?=
 =?utf-8?B?UFRJamVRTHdod3FoS3c3c1RFS2REdnVuVXFQMGJ6clIxY1FZditLYTFQblRM?=
 =?utf-8?B?cG1uV0NzeXRtenFTS3BFTkNRU0hSeFFrMmRIdEpSbzVodk53VzI1bGg0Q3pE?=
 =?utf-8?B?REt1Ymh2YUNJM2FtbW1wckFYcThIRStwc3p5WWN3cHB0U29wdnBlNTJwbmM1?=
 =?utf-8?B?enFzRUovdldLbk5EQ0UzM0ZYVkYwNXEwYStBQUhZMHFVdm1UZy9ieU9JcjhE?=
 =?utf-8?B?cmF4Mmx1UVBlWFJ4NGZVM0Y0U3BkMTBrOWZDUlRIUVZUbVFDbXRwejZCN1dY?=
 =?utf-8?B?aHQwWnR1clhicnk0Vjl5aldiUmlCa3BqWUxrZ0xnLy9pT1J5REVzSzFqYzN6?=
 =?utf-8?B?enFKb1lqS0g0QlMrdkl6YlNBZVdSSCtyUXhBcFBsaVlYcGFVZ2haZDIvZktW?=
 =?utf-8?B?Y1lBOVZZNXNPczRyUjlULzZiVUE1YlkzRXVpSEF6d3JyWDhOYTZEWFhkZ05H?=
 =?utf-8?B?S09oaFFNU3JnaDBJaUg3bjVNNmRNU0x6VlZRUGRuMXdwNDVCclpBWERTSjdn?=
 =?utf-8?B?djFSNFhJczlmOEZ3dWlOZHdQSnU2S00yem5BMGhrZVlTOFM4Y1VPRmpXUTFp?=
 =?utf-8?B?eWtxcm4xVkVMTGFhbG5RTHRreStWTERhcVZneUJQZWJxbS94OG9FenVKY1B1?=
 =?utf-8?B?dHlWNzN0RU5lTU5tR280M3d2dVJlQll6S3JWMys1K0NTc25OcUcvWVp1R0RY?=
 =?utf-8?B?M0EwVGtMRDMzUFBUVXU0TkRJbyt4bmx5cWd4MGE4U0ZBNXphbnNpWmdQS2FY?=
 =?utf-8?B?WDVqVGlXbmlVclhwamxMMklUZ0wwUnExOUZsL3dtWTVxc3JuNk94d0ZraHlH?=
 =?utf-8?B?NWM3WG9RVHFzakRPMFVlWkhMcWNndFU4VzN3VjVjNVliZGxkazZZZ29CV25U?=
 =?utf-8?B?MktGeWZEQ3lyQ054bDVCdEFQUGhSZjdwMjRFN3h0Vnc0NUlYbzBsa3Z5VFVk?=
 =?utf-8?B?YmxDUHZlRTV0TE5sS3ZlNUlUWkNPYWdEUy92U2UrZlpqTDhGUWR6amJXRks2?=
 =?utf-8?B?TXdrekdXcHYzK1VseitYUjRHNlNoTG1IVFRNSzhGeENwc0VPYUx6K2YzZGxF?=
 =?utf-8?B?SjVzNjZUOXRndEtkOEc0RnVGL3FaYWQ5R1Z6QXRZVTg5M3ZJdmFIVFpuVEpj?=
 =?utf-8?B?QTZvZkh1OVlnMjgrTVRFZGd3RWt4Z1BpV3c2Z3NLcmNBVVN1dnJ6OXQ4ak1t?=
 =?utf-8?B?ZExuR1ZKTmE4cmRZZk5yUnBOdjJ4dlBsZ2F0bG1aNHpSUHkzMHhEUlI1SEl5?=
 =?utf-8?B?TXgwV281WTBlenN4N3hoS0ZnUXk0WnpJUFJvRzd2Y1ROM0lFRnZXWExScnhC?=
 =?utf-8?B?M1k3SEFNMyt0Y3hXcTFSWm9LTzBvZDJicXhXSGxIaTdpU29qeFVKbGlxMzZy?=
 =?utf-8?B?RGhrTlUwdGswM1dJamxmVkxmVFBwSU1LVW8vaytVR3RWVzhaL2Z4bUhQUXVW?=
 =?utf-8?B?aExORFQwU0hzZm1WREdhVmNMUk1Pc2lkamhDRTM2ZVp2USs1ZDRyb3VZNTFW?=
 =?utf-8?B?NVFoVjg2d0tUd3dTOXBrMWUzN0pOUysyUzVjQ210SWY3Y3J6YXM0dFY4MHBl?=
 =?utf-8?B?WmJocnFaMUZ0M0ZCY01Oak9haytjQWJCbm9WN01IdVFORzdIc1V6OEZRc1Bz?=
 =?utf-8?B?bzkzdU1WZTVPWkJtdXRFQnNXZlk1b0l1aTBHOWVscDRzQmdhZzBCSFZFRjRs?=
 =?utf-8?B?TmJFTlQvclI5UUZFSGFCNGtKaWVJQkV2M0p0bUlEYVhNSW52bVBLZHJyR3dM?=
 =?utf-8?B?YTFwME14WlluV1MzaWEzVkdSb3E2VGUzVmppZ05MQXA1Sk5rQnNiRlFRUG9I?=
 =?utf-8?B?bWh6cWRkaUg4UXZMTHlhMTFiV3YzRVpjTkc2ZTVLVllaVnlvcWpleHFTbjRW?=
 =?utf-8?B?eE51dUZ1L29XSHFmdW5RR0RkbFZLMWdndkJRWDROcVR5MVVhYmxIa2czNzg3?=
 =?utf-8?B?QjZaemZqZlFsaWZ3NW9RdnRyRExBVm1lOXBud0NYRXVibm9tUjh1amw1cHBl?=
 =?utf-8?B?MXZkUEgxRTY1aGhiQ0tyeEtVaUJLQ2FIVkhOV1lud3dhT2JzRktraXgzaWlF?=
 =?utf-8?B?amc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eb37da9-a14f-424e-46c8-08dda778fd1f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 17:13:44.5027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ooOi2lldIv/KvdJtSIai3n4USRo1XfO7U5Qa7RjPwjgq70rlkQjgMV9NhNQj28qsXib94oUOrfIES32zP1kSjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7510
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

When sending a new version of a series, I think it would be good to have
all patches of the sames series tagged with the same version number
(i.e. [PATCH v<n>]), even if not all of them have updates.

By marking only some patches with the version, tools get confused. For
example, I'm unable to easily apply the full series to my local tree
with b4 shazam, as it tells me the series is incomplete.

More importantly, I'm not exactly sure how Patchwork (which I believe is
what ends up triggering CI) behaves in these situations.

--
Gustavo Sousa

Quoting Dnyaneshwar Bhadane (2025-06-06 16:50:59-03:00)
>From: Matt Atwood <matthew.s.atwood@intel.com>
>
>Bandwidth parameters for WCL have been updated with respect to
>previous display releases. Encode them into xe3lpd_3002_sa_info and use
>that new struct.
>
>-v2: Resolve conflict on applying patche.
>
>Bspec: 68859
>Signed-off-by: Matt Atwood <matthew.s.atwood@intel.com>
>Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
>---
> drivers/gpu/drm/i915/display/intel_bw.c | 11 ++++++++++-
> 1 file changed, 10 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/i915/display/intel_bw.c b/drivers/gpu/drm/i91=
5/display/intel_bw.c
>index 97aef729f7d4..6175081d41a8 100644
>--- a/drivers/gpu/drm/i915/display/intel_bw.c
>+++ b/drivers/gpu/drm/i915/display/intel_bw.c
>@@ -418,6 +418,13 @@ static const struct intel_sa_info xe3lpd_sa_info =3D =
{
>         .derating =3D 10,
> };
>=20
>+static const struct intel_sa_info xe3lpd_3002_sa_info =3D {
>+        .deburst =3D 32,
>+        .deprogbwlimit =3D 22, /* GB/s */
>+        .displayrtids =3D 256,
>+        .derating =3D 10,
>+};
>+
> static int icl_get_bw_info(struct intel_display *display,
>                            const struct dram_info *dram_info,
>                            const struct intel_sa_info *sa)
>@@ -769,7 +776,9 @@ void intel_bw_init_hw(struct intel_display *display)
>         if (!HAS_DISPLAY(display))
>                 return;
>=20
>-        if (DISPLAY_VER(display) >=3D 30)
>+        if (DISPLAY_VERx100(display) >=3D 3002)
>+                tgl_get_bw_info(display, dram_info, &xe3lpd_3002_sa_info)=
;
>+        else if (DISPLAY_VER(display) >=3D 30)
>                 tgl_get_bw_info(display, dram_info, &xe3lpd_sa_info);
>         else if (DISPLAY_VERx100(display) >=3D 1401 && display->platform.=
dgfx &&
>                  dram_info->type =3D=3D INTEL_DRAM_GDDR_ECC)
>--=20
>2.34.1
>
