Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B35D73EA8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 23:23:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9DC310E19D;
	Thu, 29 Jan 2026 23:22:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KMQob4tx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C8DD10E19D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 23:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769728979; x=1801264979;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ICt+OjaaK6uByh/EgjMOCEPf3nqZFgTT+2eem5KRxPE=;
 b=KMQob4txpUZ96pdXpdewhRYilabgWb5AmVMitDWn0sWWEB4NqWbDqGri
 UhrDx8vmPC8GtCYvjswZeClisCkQTW7+4HRFehCJuQZMASrsHsjXuyc6I
 wL5W5AHqHHBF+Ntj+fZVX8GIJgWVaBET8GRb8+nHOFph/TN0p/K5SRcaR
 +Z4U8aigVFW+udsw8XShb6BBJIBbWa2AdcPilD9dxMMEExIpsCNtpJ9mK
 yTXgPj2m/YFpUaoIbnMOMxW7/NA3yyiFs01ghBrx9JdEzqroWQ3Dp8eCq
 8B49tZEpO2uI8KmlVAcLlfPTCxQM0qG6npRp3KOXScSn7EDOq2QJiEfgZ A==;
X-CSE-ConnectionGUID: HPriwt7cRU2xtK+ozMBWDg==
X-CSE-MsgGUID: Eu+wVMoATkyfod0X20ZpDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="82410842"
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="82410842"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:22:59 -0800
X-CSE-ConnectionGUID: bATawwoCR7eLiuVgrZ2J1Q==
X-CSE-MsgGUID: OZgGeAxOQkGavDMavePdyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,261,1763452800"; d="scan'208";a="213236361"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 15:22:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:22:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 15:22:58 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.63) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 15:22:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MXUmzaF6GnNj4LvrAtwrnVtItFaM7BA4ZjWAZIGuJzOUe7/NAelylxLFFTnzCXRcelp0uxlTw5xzZNl31Bb8bW30TorqF4mivep6oHYThYH9RYQ1O7A2pq5VpxRenZ2juRHFBCPyR9A3acuIr8Y1DgUgKfkSOhtX2IPlapJAvFhExYn5P0gpbXs+CAd63JzXA9LVmSCDbn+ARr37BarHmVM/rBbsUbGdatmshakhClULw/pR/o2A8Ee6Zk9SdWPM2omLBKjm2+K5b1JDdgCRgtN1hNir1liFzRNZAE3IbVFqE/vajq/GU/j/SnkEullaAmDwpbuFgibAD5tyHp9rFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tF3FXskn9clotJRL0hw4u6ZxCN1dfNp/e1r7p9tBUlM=;
 b=kppdqWDBhA8yFsj44pMNUNK2pA+UI8+yIeyLzuCjTX9VdJxWRMyGeKFn5sSYswrcNwo+s4Sx2I0MVQwa2B9fJY3SUTg/+w5Ju6Xhhep6CdnqOh5IpafHS4in/AmhfBv/PVyGv+awEX5kwbCy4CNt50jYYoJ/D1xdKL5zyPzSabvL2wuyHsoQpIVXmfhbjgsLmljtEg/BXcHDSXB5PL2XmpqygckLCfzjEX/HCFxQawNoK2viqcMA6AVPcbk1KtICA5FGB2WEVnW2Nz3It+GOkze80BuMFEdddDug6E15/KMFLQPi2PQpg6H+9CSPAMWRDx5Gd8WyasoxrS2fWoHWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by MW6PR11MB8311.namprd11.prod.outlook.com (2603:10b6:303:241::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Thu, 29 Jan
 2026 23:22:54 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 23:22:54 +0000
Message-ID: <a25fa9e4-7838-4dfb-8678-ebc0bba85178@intel.com>
Date: Fri, 30 Jan 2026 00:22:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Fix kerneldoc for xe_migrate_exec_queue
To: Shuicheng Lin <shuicheng.lin@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20260129225606.412902-5-shuicheng.lin@intel.com>
 <20260129225606.412902-6-shuicheng.lin@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260129225606.412902-6-shuicheng.lin@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0014.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::25) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|MW6PR11MB8311:EE_
X-MS-Office365-Filtering-Correlation-Id: e4daf961-7d7b-477b-83c8-08de5f8d53ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2ZkL1c4aTNJbnFrSURjdUFvWUNXR0gzWHQ2YkM3YUZmUzlYQXJNYjI1dFh1?=
 =?utf-8?B?V1BhZEROZEJPbzRJSkFVQW1IYkIrK2srSSt4cXZGaTFzVUNkUnpXRkFudDV6?=
 =?utf-8?B?YWVxS2hVZVQ4czBKWnNnVll5dmNWaHVJRXZOQ3JFWTZoaDlIelVQUmRQMDl0?=
 =?utf-8?B?bDZtYldvNTVmMVM0K2dCa0NIVEU5aytMWEJVWmRTdHFTQjZuek9YNUlCc1Qr?=
 =?utf-8?B?MGZMOWlyOHl4RmZIZHBTNFpsT3pmMjJ5RUhHbjJFSmpVKzNxdzJrTWRCcDB3?=
 =?utf-8?B?Vy9yOFJPSjF6cGFHdGp1WlcwdHlyNFBSa1RFcEpGSy9INkl3d0kzZld4OTFE?=
 =?utf-8?B?SFc5Tnc3TkVlUWYwd3orTnZPTkdnVGNuVnRpWkdQT29DbjhwN0g2TUZEUGR0?=
 =?utf-8?B?dnY2RElzSmNBeW04Y2EzTkRqOG9yVmF2V3BZMDRGcExIMkhLV1NMN09ma3lL?=
 =?utf-8?B?TjFXSkhsYjhOUHdiYnhtUXdLSlArOEsyeEVGTHdFQjJjMHdTckZTMmVNZGUx?=
 =?utf-8?B?ZzE0MTVCRGlrcU1lNFcwbXFMZ2NGb2VUUmRldzkwa1VJVU1zY3I0UUpsNnJH?=
 =?utf-8?B?OHRlcjFrZkovSmpwcGh4aGFCVlBpTUFCSm5TU1kvUmtsbGhqblhqSmxnNkF5?=
 =?utf-8?B?ejF6NldLWUc2ci9qQktKQ3hSRk90OUF6ZDYvQmxDU3VUY2ZaelduUHN6a1pC?=
 =?utf-8?B?cjdZdzV3SnJMcTNzczhzWWI1eUNPNCtQUSs3bkNMQzNWNG55WEJhdXg5ZGJp?=
 =?utf-8?B?ZnhzakxJWWVhSG1vb2JVVk00RFBxK280R2VjOHZsdlhzUTBHamRteHhsQ2Vz?=
 =?utf-8?B?Sm1ob2JhNy9hZ0lQdlorVzFGN1Q5cnFHbVhoU1JJYk14VWx0MlRXa1dPZHQ4?=
 =?utf-8?B?L3lKd1FyZnZjVDZsSXByMHBZdGZObmdJZmZCYUFyRVozOG1ZdUYzRkV5Y2c4?=
 =?utf-8?B?MzNyZ0pSVVFpV25HQ2hnVlRzVTlTOTRJUUVJeDVCd1prRDdDbTE1WlgvYURi?=
 =?utf-8?B?bUtFT3hOWHllSVBWOHk0eGdzbHBQOG1wRHVjUHp1OTV2R3Y4WWtGd0o3d0pM?=
 =?utf-8?B?aUNEYjdwSnkzS0xTVURQZGJwODduODBmOUhaMUV3bWNpRkVET2RyNEsrQlh4?=
 =?utf-8?B?MklwaDRKSDFuOHNZbFA1QVI5blVtcWJydjFJTU1GNWdScFlqb0o3eUkzaThY?=
 =?utf-8?B?Z1FJRGI2YVdBZGF1R1IzZ0MrYitzRldpa0xybThyc1ppT1AvYmtXWkRKVjdN?=
 =?utf-8?B?SGdtZ3c4VXFyQnVTdXdpV0tJTm1pN2pDVmgwakZlSWN4Wk1zMkJhQlBVc29C?=
 =?utf-8?B?WWtxODdqazZBVW9SZmJId3dDY2dqVVZrWlRIaC9EbVFTenNuTkM2WnJFU3p5?=
 =?utf-8?B?Z3dJYmE2OC9WeXpmZ0NOSW4wdmlka3owUWoxOU4rRXd3MzVoaXlCLzRLRWIx?=
 =?utf-8?B?Y2F0UkR5NlYzdmM3VUFJVERzdk9YT2VCT2s2RTh5cCtmc2RFMnNFc24wdDN3?=
 =?utf-8?B?R3MwdlBlN3NFNzV4VStpZUMzVGJveWZRK1FNWlYxbE55eFlzb1lyMHFkM0l5?=
 =?utf-8?B?YjZwbEtWRmY5YmVwOU1TalRGUFNkWUdJS3VPR0dyM3JQUVZkMkVKRUtrT0hr?=
 =?utf-8?B?S2xrbGtTN1gvVjN0UjdoVkhwWTZET1pjQkpvNGttcVpNcEQyVGxBbEFGUCtz?=
 =?utf-8?B?QThWQnpHaUM5RlFpZjNOVmZxU09TS29CZFZlZTk2ZzZZbzRGa1JRU2hZZkly?=
 =?utf-8?B?NG5UcEVIQ3NCalhKd2w3OElyQW5UWnFick1hRTczUlZDeUd1M3plSmtPd0lB?=
 =?utf-8?B?c0ZzZGREZjVMOGRQd0ZaZDd0dmlNZ2RzTUpaakNQeUlvSzBtTnc1TGZ2dUxG?=
 =?utf-8?B?Sld2SUVOeTZRSDdjN1JCR3pFcTJhNXdHTGZQT1NQRzhDcko4MFF5K0lHQU1h?=
 =?utf-8?B?cStubFcvcHEyck42b3J1dzJIaTFYeEErNWtMaXphcTdDdHVuYXpjREw0YU1w?=
 =?utf-8?B?RHIzRTJ4dzFSN0M5ZVQ3MGxycFpjN2RSTHdDcVIrcTJLZUpXWEI3TU15SXNk?=
 =?utf-8?B?M05FYlZ1UW5LTUExLzROQzJLWGlnQ0JQczA1QjZyalFqdlBBZEorSXpkNGVR?=
 =?utf-8?Q?KzQU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2pmQThIeEdQY3JLRmUxdWxBTmZOMTR4TEpQOURaQnhiVEw1RWs5N3JLRVhB?=
 =?utf-8?B?Nm1GZHRKWkEraTV0cTNGOUI3aTNBbC9BZWN0YWpiaFl3OXhpTzlHZzJTYzUy?=
 =?utf-8?B?d0VjK3lXNktza0tGSUxaMmdmTk1QZjJsamlGMlpLeVJEOVEzbklMbDJ1Y1VD?=
 =?utf-8?B?NGNGLzRZU1p3cTNkTTQvQ0lDNjY4dW1wRHNRdU5vSlJPVnNzZlBwM3VNbTh2?=
 =?utf-8?B?dmh5ckZhUjZFL1c4RjIyTFlraHdlRFZ2cWlDMGpjT05ndTlkVHdaS1ZYVFNT?=
 =?utf-8?B?TWpFNGNBbzJZRkswQTUvaHJRMXFsOE4xMEdRWXh6dmp4TG5ZMGhLYlNIcy9Q?=
 =?utf-8?B?S2FRSlBHM0p6Ymk0UGIxWGVJRm4zK08xSjNydis5ZjJZTUxpVHVDSkVkZDcv?=
 =?utf-8?B?SCt0V0tLODdrWmtlcml0enpDVWRhTHdoOVU3N2xIKzZveDNNalNuWVRkcm1D?=
 =?utf-8?B?S2dFUHNJYTF3Y3RyVGhrLzVxZXZORFZFNkJSTGhxRU13OU9tYWlCZENpUjBJ?=
 =?utf-8?B?Q1BJbVB3MGNqblcwU2U0TGd6UnQwbzdFVWwxRzR1MmlNR1JnOTQ0MjkrWXdT?=
 =?utf-8?B?WmtMc0krRndubmR6Q1NOYnJlb1pmSFNDY0RxU0xxa3RONjZ6QnlYSmh6UTA3?=
 =?utf-8?B?UWhBMTQxTGVoV3RKWDRIYWpQRTNFT1ViaEYrVzhtK2dUQnAxSWM3UDluSkZh?=
 =?utf-8?B?R3l2K1F6SzROZ0ZkZk5JUmtaZjlCRkZpVWM0MERJUlV3WnRja3VQR2NWVHNq?=
 =?utf-8?B?L0ZPRnREZ2ZwZ0VIQ2RUUUtJS2VSL3JlRVhYWFRJa0dCS3ZDTnlqbTVob0sx?=
 =?utf-8?B?alMvTmgrQ0s2WVFRR3BaTVlycFVjeWZmR1lPYThWN2MwczZXdktTQk5Fc3Vz?=
 =?utf-8?B?QkxoR2dHblUvNU5lamtmL3B6QVNGWmErZzBmQ2pjWFRkbXUxRDEvd3hEclJM?=
 =?utf-8?B?MnhCNGlPNFZIenBxUGFtUGdZQTRBZ0laSDN2aTI2NVhML0VjMEJyanF1TTdq?=
 =?utf-8?B?Ryt4Z3BQb0tuMlU3a2Y0QWMzYk4zZ01xOFQ1ZVF3WGthd3E5V3duRFl1YXdx?=
 =?utf-8?B?NGpteEEvQ2gvanpNZ3pqbGsvclVaU3V4dUFyMDNKMEdLWkRPOHZyNHB1alRG?=
 =?utf-8?B?WlNTNUxMVytvTVlNcS9iVThpd2M5eTRkRXVpcGhlNmpaMjg2NlB5L0Q1WFJV?=
 =?utf-8?B?cFNicHRkaE80dWllRXd5MmFxTnJrSlZ6YWhaNTIwRmdBdjYxQUsvejVJRjJm?=
 =?utf-8?B?aXBaZkZzdVdzZVVPQU95Tm1vNTN3bVpJWllVWXJMaE5kaytXbUsxZ2NJWXRG?=
 =?utf-8?B?b1ZpeHptVjhsTmJ6SUR4UGFOVjczakhLbWFCY0E3amx0bmRWd2ZvaS9lSHM0?=
 =?utf-8?B?M2RZWlFaMXcvR2xKYTJhc3d0a09od1h5ZVFFWTZ3aVFzL0k2cDRsN2hKalFJ?=
 =?utf-8?B?MUo3VEErVEwrUHRNZ2loajdrYVFEVENwdUFWdHcxaTJVcUtXWXRuTTArdUFQ?=
 =?utf-8?B?eGNqWnN4NEEvZHkxSEpvV3dBTFBYMjNTNWNMaEdGOGNrTnpMNzJMUG1oS0d2?=
 =?utf-8?B?anlSVXRRQk9iQjdMa1VaOHc2TDh5eXpkTzFLaG9aVEhMN1djSzY1Vmg3UlYr?=
 =?utf-8?B?WXVURElsdXcrdmZ0QmNTTFJ1S29ieEpURzVZL0dqL0p4UWxFcEsyZHRqY2Q4?=
 =?utf-8?B?N2VmaG5Dd05nOWhmMDRwVjNYUmlpU1N2ZG9ISlBsa2E3bDZ3czJDd0lSZjg1?=
 =?utf-8?B?eENUa3RORnVXOGNUcmx5MFByUGRja1FSdXN0MUZYaEFydG15cTZpd21hVHd0?=
 =?utf-8?B?ZlVQODFMd1FUcFZjanR0M1ZEN2tMd1Z4d294dkJKdkxTL0VPSGRHaitsYW5u?=
 =?utf-8?B?a040enRyNFlUNkdHK1ArVTBaWFJoeHRqRE1Ic0h6OXZlVlFIQkNOenhxM2Nv?=
 =?utf-8?B?ZEw2NGx3a0lEM01EMlpVN0wrN2Z0K1FEdWpKUnpmZGVTYjdSRVhuZUllUklI?=
 =?utf-8?B?YlpnYlZGRVRORzJkcVM2VHVZVFR4UnFPRHBxNWZqditYMWZvNEU4Z0hVYnUx?=
 =?utf-8?B?SWJQcjRxb2xybGhKT0IyRU1ZRytaYkt0YlY0emttVkMwTE9TRUFnVC9LRlph?=
 =?utf-8?B?UHJaM3VKLzNsZ0ZwclJ0Wm1KNmFWOVA3T2pzck5UQlEvVml2OWNlVXZZTzFv?=
 =?utf-8?B?WG90SkN1Y3BqcEd1QmlsWG1DSFZyeXRMTDNTY3lxWkI3TW9IMk45TXl4RXVK?=
 =?utf-8?B?ZkNWaDA0QTR3aXZiVFNTZkp2NXhpVHYvdEdnbjkyTWtUbENBdVJ3aUtaMzBU?=
 =?utf-8?B?L2lUTmphNGxHYzBPajduVHJzOHBGT1VyVEJrbncrNUxMU1FJYlZuME1uekRT?=
 =?utf-8?Q?vqLPjcdg+64zrtuc=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e4daf961-7d7b-477b-83c8-08de5f8d53ec
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 23:22:54.0153 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: n2gyzAbN2865uW2P7RA0KhEv7brwEA3jwbJEFglUZCtE+vTzaj4MdjSyy7h+xPbguyxQzHm3I8vgdgLyivsKVBF5rL8vEz50x2fhzXiRTuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8311
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



On 1/29/2026 11:56 PM, Shuicheng Lin wrote:
> Correct the function name in the kerneldoc.
> It is for below warning:
> "Warning: drivers/gpu/drm/xe/xe_migrate.c:1262 expecting prototype for
> xe_get_migrate_exec_queue(). Prototype was for xe_migrate_exec_queue() instead"
> 
> Fixes: 916ee4704a865 ("drm/xe/vf: Register CCS read/write contexts with Guc")
> Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_migrate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 6e202428aac2..078a9bc2821d 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -1254,7 +1254,7 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  }
>  
>  /**
> - * xe_get_migrate_exec_queue() - Get the execution queue from migrate context.
> + * xe_migrate_exec_queue() - Get the execution queue from migrate context.
>   * @migrate: Migrate context.
>   *
>   * Return: Pointer to execution queue on success, error on failure

