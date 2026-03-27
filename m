Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088AA10ED659
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 11:07:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE9CF10ECEA;
	Fri, 27 Mar 2026 11:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Y0qdUcZu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57CD810ECEA
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Mar 2026 11:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1774609650; x=1806145650;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=/p0zJMVXdXcCwjbXhwBj1SRkmvjTUbNZFCNPXJn/qio=;
 b=Y0qdUcZucsqidCMiBObSp9Q1HaHTHX173/y99mqzmhKDF7S7GbquQ6T2
 SYUHRAOnBl4BnSvjJUKIjVRaiKkSjuNXYNsi1OGiEE72cd7hsDRvYWN5v
 v7n5vXh/8VhYuSK+SEAz+bH0zJ/wh0vF3VIJTeqvAHDQaGj2wlsxjrHtv
 EQO5HQPOKWRzchbJECzkctfi47nKwn6CMeTYSgTjjayKjvNF4uqiaW8Vl
 HwwGDhHWbAS+kmjDZO3Fq1c+lgAEZNB/6y++fwkoVDmJ8oMuwt45AmmPJ
 S901p+oQVpQdmdRPHZHm7SgumL0CuLrGLeHg5GHOFpZMIAW6wURGvvJfR A==;
X-CSE-ConnectionGUID: ekHD+fyzT4edDfxPNxGCqw==
X-CSE-MsgGUID: oMbIEeY2SCyAbd25jDPrkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="74711484"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="74711484"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:07:30 -0700
X-CSE-ConnectionGUID: ussqktF9RDyvf5Y/9JDeJQ==
X-CSE-MsgGUID: CcLQJxdzSFGvWEkBx30H/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; d="scan'208";a="222411895"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2026 04:07:29 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:07:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 04:07:28 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.47) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 04:07:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEPolT+XF2HDXRKG+korhfJWq0JqLsrQ/GhL+r/9gdlwKaPzDeLnnaJCV5wR/BefX0CY1s71ME/rLyjIIQ9ISGiA1Xxd7kPS/vsNnT+eal4Lszt9RPnMX4TGIJFCcdrBiUhD60YNgnWdovu+OgiePlbdIvTneT650s3fHU6Q93MlhzfMtJA9BIPgABkp0Mt1Sz0UQhzUWp6P3cvH9BOiWURhrQ/AghOn4bxiMal8UlDKijsTjb2pUaj7Naqp7kCUhPgpTMWi5UAaanWejcNV5qrBrDeuELn15iQMR5wcQ5OziiwbRhqpsMCMNEgJaXTD7UzK6nWY+vb9D8youY86QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/OWJq8J48eHOAaofZ3CV4A9IPwOO6urDeXb+MFFtKo0=;
 b=Lfw8GNooegwRRwR+l7j85SNkknHv9/Yg0L+aBAesu0z3Hq/y3g9qfjr0KIKky3A3w134AKuLBXGZCQr/u7POW2TthFKkM0ce0Wb3IH1e8L99aSm9GJg0D2xTWEnGbBW06xsbGHKjvjxI0VKGtVa8l3eRkOaHP0L4wPVo67HjOMfFc83py2Fo4O190rTorCLyTIrn1rlap4dfAwbATox0tyL+3SYDXMuiAxOh8/emXqOlJub3rbt7bVGY2tbhSXKvbKNlcLDCNjwMeuEUkbR1LOO8wqRUcuScpvYbKqPxDaOKYEw+QAy4NoIrll275zQQ/Ql2fyS8OiFmmsuBGpNvPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA2PR11MB4876.namprd11.prod.outlook.com (2603:10b6:806:119::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Fri, 27 Mar
 2026 11:07:26 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9769.006; Fri, 27 Mar 2026
 11:07:25 +0000
Message-ID: <cf383a64-ae77-4129-a22a-88353946103b@intel.com>
Date: Fri, 27 Mar 2026 12:07:20 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/vf: Use drm mm instead of drm sa for CCS
 read/write
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>, =?UTF-8?Q?Thomas_Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Maarten Lankhorst <dev@lankhorst.se>
References: <20260320121231.638189-1-satyanarayana.k.v.p@intel.com>
 <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260320121231.638189-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0009.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::22) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA2PR11MB4876:EE_
X-MS-Office365-Filtering-Correlation-Id: 572f6a02-6e0a-4e85-2a4b-08de8bf1071d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|18002099003|56012099003|22082099003; 
X-Microsoft-Antispam-Message-Info: tQx9MQZwrpCoc8ihKqokoswA/nKwP616I2O/Y8kAW9hreuM+lDfOkng9mv0F7QwgG28VziwtWvhEvRhji/AFaGDY84xHf5wHsvfFZAE7RIU2tUTM/pE2moFQ6MlH2Y/+L8IpEaC3NEokAaVFBPEfvY5hVFaE57Xd6LfFfg8xS0iaYkKtaI4OZB5DXpShU/LzaCLRS6vQ36wICCAqME89F0QAYjKvHJXGQEKa9QFthkC8H79D6OdzMXg3wltdT4Jfx0H3hJ0QA/w/6559u3tgcQlgLlPFQj2tQWq4p63b/C8g7IfINS8JCcRyR/bDRUSq5ZstPP1tHNcWIK48EaI9JacFYmKQWf+PkRZ2KIJKQQBPA/rSAMx5+VRxvCMDj2rrRCKQluV7xAFx7bTB/awBsZKnZpnTsXCVB2Jo25P3yr3O7Q1HWYx7LXdVV61oZMwCzlxPu/WhDUzu/TUL3q3CltUbxBQXouVrqX/aMgephWMzHRHSeBDHMqhVvSIUU29UUmkWR5dPbcCDqP4T9aDdmyDcMRpgH08qfT6CDeuF/usJGCiheIqV2uDI/7zx4ML0tFuiKO6WkOJoH9VGbtVIDHPFywl/ENeTm9sy9o5vX9U1HIo9Ce+q7VbXH97X1MMXJZlBEaersIsRronicUYz1b4Sfi+5wAj2RlTmYZYjyZJ0Q6LTIwTAjfC+37WtWSKv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(18002099003)(56012099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cGJpUHIyK2xKdDJ3TVBuNDZHLzdENlJwc3ZQQmdxeUFTQlExakRNLzNxbnht?=
 =?utf-8?B?LzR0NzhOUDlFTUludklDNGxWd3doenlabGFDVGxVSVJ2a3M2QUF5SGtTdHdM?=
 =?utf-8?B?V2FmbGJHbkkybklqTGxyWTRBT05oZVVKUWlSYmhLUEhoU1pETlZFZ0QvZ0sw?=
 =?utf-8?B?RnlFWUF1Tk5yNDBtNk43bVl2UnBzRFhRUXpROGVvd0ZPQkNvaEhWRThJOU55?=
 =?utf-8?B?bVN6YXRxNWhTbmZ6YkVHN21xOHNhTzhwdmkvenRjSllrU1VjVHVxTE5QdkZo?=
 =?utf-8?B?Q2NsZmRnbGgrUTg3V0lBUHpieVhMZWljM0tFRytvelN1NDVmTXA5TVVtQ01h?=
 =?utf-8?B?Z09tNG5adGtuUGtDVFFOemhoNnhEMVhCSDZHQmhHemQwV1ZkQXQ4NTZGM3pM?=
 =?utf-8?B?VDhLTXNiTFdPUEhtUko1SUlTaHlFOExmR1k4cFFqR3Z3WTcvaGlGQzVyc2lS?=
 =?utf-8?B?bC9VTkRZMW52V01DNHJIb0VMY3gweXlKTnpMTythZHBzZzdlcWd0QkU0RGpx?=
 =?utf-8?B?YmM0cTVVaENnYVVKR05IR2RKZmlwMlBNbjhZTWlKWlozQU1EWno4WmEvZ3k2?=
 =?utf-8?B?TEphK1BpMjBIRDZHdFZjTVZxdUxGVmpxRGt1VjdPeVJzZUJiZFJ5Yll4ZWRU?=
 =?utf-8?B?Y2F3bUJCVDRqeHo0TlNHYUF5eTFiWE50cWpqOHJYbndqV0ZhNU52K0Vrdkxl?=
 =?utf-8?B?MmQ3THhaeU5pM1ovZklsRmF4cktidCszbWgwaWk3OFFpOXRxdmVLdVBHMkx1?=
 =?utf-8?B?UW1XanhKdzJERzdRTGxwV3h4WTNkZlJ0R2gxbFhPWDMyUGVqQml5S0U0V05S?=
 =?utf-8?B?UXV2L1g1eitEWjYzUUxiWkVBaEx6RWdkY2VEdFEydCtobW11YXFsL2FnVUFk?=
 =?utf-8?B?L2ZiZzlPYnlEZ0MwOU03SUU4TTV6M0xPQll1bHgyanBKemJxcGd2a1V4L1Jm?=
 =?utf-8?B?UHBRbGpuM0U2NEsvT3lWSGJxbTJHVjhRcmlMRVZCM3k1UGNsUjkvU0N3c3I4?=
 =?utf-8?B?YlJWM1MydXVxK2NpSmRVb3pWS1VTSUR1a01qbXBVT01SOGdDYytiRXZLME1t?=
 =?utf-8?B?MHZlcGVmUUhWWU9jU0pFQWtuMmZ6OHZaQkZvclRQMzQ2eE9ldmdsQWQwZnM3?=
 =?utf-8?B?YWxZclRLNGFGYmZLQ3hnL1dITHE3K1g4V2tnU2FiSWhheHhjcWVka2VQL0k2?=
 =?utf-8?B?b1VNMEREeXdpM3JjeTNLaHNmOUpodmtZS09HM094cEdkR1dQYm5JNHM1Z3BZ?=
 =?utf-8?B?SFowN1JMMnUyMDcyL2lTM1RlWDdoWTlmVUJaWm5hOUFSUmRhMG94QWFYVlFv?=
 =?utf-8?B?bmV3MU05QnU2ZlFXRDlBVzZaZjRac3lCb1cvY21BNGNhNXVSTi9VY1F4dXVD?=
 =?utf-8?B?cG9YRDhqQ3dSRnVHZU5tRHBFSXRFTmorRURudUVSOEVOckxvRmE3SVp5bzlE?=
 =?utf-8?B?SWp1aEttdlgvZmhNbEozU2hRdklmS3JOTEI4VTJSYmY3QVNXUEVZQ090NWJT?=
 =?utf-8?B?WUJVWnc4TkZLS09jWDVIN2F3elQzRXZwdWYzeFFsU3I3ZzE2c2Y2NG1NbVJP?=
 =?utf-8?B?U3k3c1VGMVUzZk5DQmZudWo2K2JDdTNEY2dOSWVqams4K0pPdm5IMHE3Yldp?=
 =?utf-8?B?bGZEUERXbU15SCtRcnFnUXg5OEdkM2ZJSTRKR2Z1TWtZdFYrSmw4cjFBN2dE?=
 =?utf-8?B?VFFVNEQ2QVY5VlRBK05jYm9IcGw4d3BQa0Z0ay9xWmZiVTBuQ2pzVFdsRVBO?=
 =?utf-8?B?Rm1peC9BMWRhRnY0TCtFM2NYYlowOFBLcWdVNDg0YU03S1RqS2FibjNaU210?=
 =?utf-8?B?MFd0b3BtMGE1eldXU2Z3eTFYNkc1ZWRVUE4wTFdvQStpRDB4Rkx5WXRzcHlH?=
 =?utf-8?B?SGFpL0pwdGhMYXMzZTFZak4wbVFFVGZlTDVLWGlOTDNxQnFtU2FNUEhNa2lT?=
 =?utf-8?B?WTB6eTBETGJzWmZlZzNKWnZHd2VDMTVVcjAwRzhkOVh1UXYrTmIyTE9LZmdX?=
 =?utf-8?B?S083VU1kbXV4NzVrTVRKbzNzczJnR3RCUWoxQUZ3WVdKLy9tbndPbWswSzBy?=
 =?utf-8?B?R2Fld0dRKzE2Z0tHNW9RdkFVdjJ2VTl4ZVNSeXVScjZPWkhEVmRSa3JTbTIy?=
 =?utf-8?B?aHltMjFMazhWZlFUQTdURmVTL0Q4emVob3FncjNqYlloU3VWZmxwQmlEYmFl?=
 =?utf-8?B?UkVFQXNtTUpleUxVQ0pnWEx4QU9DMHJlbUlhSWYxUHpkemZXUVllT2liaHVG?=
 =?utf-8?B?TnV4Tm9UdTQvZGpHRWVvaVUxRU1JZ28rcEFMV01obTR1dG9iOWpheHJjR1pk?=
 =?utf-8?B?QTNWQTA0T0hNcGJkcVJlNkliaDljUUlpbVN3R2hOQXFiemZDUllQOVc0cURH?=
 =?utf-8?Q?MgwFn9ey9HfjlkbI=3D?=
X-Exchange-RoutingPolicyChecked: L6ZWx/aXrCCqCHA2nDsK8N6fw5wRvQ9YELx2UlVA7v+hFCDQd/IvocWqEAip0Ro5SbM+a9M/ySfB4aad8T2U8FyhqenYu1t/JCSK4f3COFVMBHyTgCzoc85qIXGYxW/76GiiMsrLXenEut2w9J6YlYJPLXfk0wRDlAMhcIS1qDRVF7njGhb46Gjt0g0UWoazbjElH4Bd0g6SLuvy6JvJhNSIP+kbnDf//3F+3VFSreJJmSoIE6/MSOp65b1fhBLDC/dLugs2M8W3RhY9wi9AMyBdliNdGLBkCWlAXfbOlKGDCoTPP1pU4SzVYGv/smEqPb9I8pF91RJX1kuYvO7Klg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 572f6a02-6e0a-4e85-2a4b-08de8bf1071d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 11:07:25.6714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tMQgNHBe1bQegFdjLHUFBoAyJwLtMhxvZ57l7TW0bQb+H/sOU4R2OytRspAxEZKPo1y/k4Ow9HM5vlN3F28ZmUImp5pNZvvOGY0CEUn+neM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4876
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



On 3/20/2026 1:12 PM, Satyanarayana K V P wrote:
> The suballocator algorithm tracks a hole cursor at the last allocation
> and tries to allocate after it. This is optimized for fence-ordered
> progress, where older allocations are expected to become reusable first.
> 
> In fence-enabled mode, that ordering assumption holds. In fence-disabled
> mode, allocations may be freed in arbitrary order, so limiting allocation
> to the current hole window can miss valid free space and fail allocations
> despite sufficient total space.
> 
> Use DRM memory manager instead of sub-allocator to get rid of this issue
> as CCS read/write operations do not use fences.
> 
> Fixes: 864690cf4dd62 ("drm/xe/vf: Attach and detach CCS copy commands with BO")
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Maarten Lankhorst <dev@lankhorst.se>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> Used drm mm instead of drm sa based on comments from
> https://lore.kernel.org/all/bbf0d48d-a95a-46e1-ac8f-e8a0daa81365@amd.com/
> ---
>  drivers/gpu/drm/xe/xe_bo_types.h           |  3 +-
>  drivers/gpu/drm/xe/xe_migrate.c            | 56 ++++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 39 ++++++++-------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +-
>  4 files changed, 53 insertions(+), 47 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_bo_types.h b/drivers/gpu/drm/xe/xe_bo_types.h
> index d4fe3c8dca5b..4c4f15c5648e 100644
> --- a/drivers/gpu/drm/xe/xe_bo_types.h
> +++ b/drivers/gpu/drm/xe/xe_bo_types.h
> @@ -18,6 +18,7 @@
>  #include "xe_ggtt_types.h"
>  
>  struct xe_device;
> +struct xe_drm_mm_bb;
>  struct xe_vm;
>  
>  #define XE_BO_MAX_PLACEMENTS	3
> @@ -88,7 +89,7 @@ struct xe_bo {
>  	bool ccs_cleared;
>  
>  	/** @bb_ccs: BB instructions of CCS read/write. Valid only for VF */
> -	struct xe_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
> +	struct xe_drm_mm_bb *bb_ccs[XE_SRIOV_VF_CCS_CTX_COUNT];
>  
>  	/**
>  	 * @cpu_caching: CPU caching mode. Currently only used for userspace
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index fc918b4fba54..2fefd306cb2e 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -22,6 +22,7 @@
>  #include "xe_assert.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> +#include "xe_drm_mm.h"
>  #include "xe_exec_queue.h"
>  #include "xe_ggtt.h"
>  #include "xe_gt.h"
> @@ -1166,11 +1167,12 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> +	struct xe_drm_mm_manager *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
> +	struct xe_drm_mm_bb *bb = NULL;
>  	u64 size = xe_bo_size(src_bo);
> -	struct xe_bb *bb = NULL;
>  	u64 src_L0, src_L0_ofs;
> +	struct xe_bb xe_bb_tmp;
>  	u32 src_L0_pt;
>  	int err;
>  
> @@ -1208,18 +1210,18 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size -= src_L0;
>  	}
>  
> -	bb = xe_bb_alloc(gt);
> +	bb = xe_drm_mm_bb_alloc();
>  	if (IS_ERR(bb))
>  		return PTR_ERR(bb);
>  
>  	bb_pool = ctx->mem.ccs_bb_pool;
> -	scoped_guard(mutex, xe_sa_bo_swap_guard(bb_pool)) {
> -		xe_sa_bo_swap_shadow(bb_pool);
> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>  
> -		err = xe_bb_init(bb, bb_pool, batch_size);
> +		err = xe_drm_mm_bb_insert(bb, bb_pool, batch_size);
>  		if (err) {
>  			xe_gt_err(gt, "BB allocation failed.\n");
> -			xe_bb_free(bb, NULL);
> +			kfree(bb);
>  			return err;
>  		}
>  
> @@ -1227,6 +1229,7 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  		size = xe_bo_size(src_bo);
>  		batch_size = 0;
>  
> +		xe_bb_tmp = (struct xe_bb){ .cs = bb->cs, .len = 0 };
>  		/*
>  		 * Emit PTE and copy commands here.
>  		 * The CCS copy command can only support limited size. If the size to be
> @@ -1255,24 +1258,27 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			xe_assert(xe, IS_ALIGNED(ccs_it.start, PAGE_SIZE));
>  			batch_size += EMIT_COPY_CCS_DW;
>  
> -			emit_pte(m, bb, src_L0_pt, false, true, &src_it, src_L0, src);
> +			emit_pte(m, &xe_bb_tmp, src_L0_pt, false, true, &src_it, src_L0, src);
>  
> -			emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
> +			emit_pte(m, &xe_bb_tmp, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> -			flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
> +			flush_flags = xe_migrate_ccs_copy(m, &xe_bb_tmp, src_L0_ofs, src_is_pltt,
>  							  src_L0_ofs, dst_is_pltt,
>  							  src_L0, ccs_ofs, true);
> -			bb->len = emit_flush_invalidate(bb->cs, bb->len, flush_flags);
> +			xe_bb_tmp.len = emit_flush_invalidate(xe_bb_tmp.cs, xe_bb_tmp.len,
> +							      flush_flags);
>  
>  			size -= src_L0;
>  		}
>  
> -		xe_assert(xe, (batch_size_allocated == bb->len));
> +		xe_assert(xe, (batch_size_allocated == xe_bb_tmp.len));
> +		bb->len = xe_bb_tmp.len;
>  		src_bo->bb_ccs[read_write] = bb;
>  
>  		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> -		xe_sa_bo_sync_shadow(bb->bo);
> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
>  	}
>  
>  	return 0;
> @@ -1297,10 +1303,10 @@ int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  				  enum xe_sriov_vf_ccs_rw_ctxs read_write)
>  {
> -	struct xe_bb *bb = src_bo->bb_ccs[read_write];
> +	struct xe_drm_mm_bb *bb = src_bo->bb_ccs[read_write];
>  	struct xe_device *xe = xe_bo_device(src_bo);
> +	struct xe_drm_mm_manager *bb_pool;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> -	struct xe_sa_manager *bb_pool;
>  	u32 *cs;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -1308,17 +1314,17 @@ void xe_migrate_ccs_rw_copy_clear(struct xe_bo *src_bo,
>  	ctx = &xe->sriov.vf.ccs.contexts[read_write];
>  	bb_pool = ctx->mem.ccs_bb_pool;
>  
> -	guard(mutex) (xe_sa_bo_swap_guard(bb_pool));
> -	xe_sa_bo_swap_shadow(bb_pool);
> -
> -	cs = xe_sa_bo_cpu_addr(bb->bo);
> -	memset(cs, MI_NOOP, bb->len * sizeof(u32));
> -	xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
> +	scoped_guard(mutex, xe_drm_mm_bo_swap_guard(bb_pool)) {
> +		xe_drm_mm_bo_swap_shadow(bb_pool);
>  
> -	xe_sa_bo_sync_shadow(bb->bo);
> +		cs = bb_pool->cpu_addr + bb->node.start;
> +		memset(cs, MI_NOOP, bb->len * sizeof(u32));
> +		xe_sriov_vf_ccs_rw_update_bb_addr(ctx);
>  
> -	xe_bb_free(bb, NULL);
> -	src_bo->bb_ccs[read_write] = NULL;
> +		xe_drm_mm_sync_shadow(bb_pool, &bb->node);
> +		xe_drm_mm_bb_free(bb);
> +		src_bo->bb_ccs[read_write] = NULL;
> +	}
>  }
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index db023fb66a27..6fb4641c6f0f 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,7 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_drm_mm.h"
>  #include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_gt_sriov_vf.h"
> @@ -16,7 +17,6 @@
>  #include "xe_lrc.h"
>  #include "xe_migrate.h"
>  #include "xe_pm.h"
> -#include "xe_sa.h"
>  #include "xe_sriov_printk.h"
>  #include "xe_sriov_vf.h"
>  #include "xe_sriov_vf_ccs.h"
> @@ -141,8 +141,8 @@ static u64 get_ccs_bb_pool_size(struct xe_device *xe)
>  
>  static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> +	struct xe_drm_mm_manager *drm_mm_manager;
>  	struct xe_device *xe = tile_to_xe(tile);
> -	struct xe_sa_manager *sa_manager;
>  	u64 bb_pool_size;
>  	int offset, err;
>  
> @@ -150,34 +150,33 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_sriov_vf_ccs_ctx *ctx)
>  	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
>  		      ctx->ctx_id ? "Restore" : "Save", bb_pool_size / SZ_1M);
>  
> -	sa_manager = __xe_sa_bo_manager_init(tile, bb_pool_size, SZ_4K, SZ_16,
> -					     XE_SA_BO_MANAGER_FLAG_SHADOW);
> -
> -	if (IS_ERR(sa_manager)) {
> -		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> -			     sa_manager);
> -		err = PTR_ERR(sa_manager);
> +	drm_mm_manager = xe_drm_mm_manager_init(tile, bb_pool_size, SZ_4K,
> +						XE_DRM_MM_BO_MANAGER_FLAG_SHADOW);
> +	if (IS_ERR(drm_mm_manager)) {
> +		xe_sriov_err(xe, "XE_DRM_MM init failed with error: %pe\n",
> +			     drm_mm_manager);
> +		err = PTR_ERR(drm_mm_manager);
>  		return err;
>  	}
>  
>  	offset = 0;
> -	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +	xe_map_memset(xe, &drm_mm_manager->bo->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
> -	xe_map_memset(xe, &sa_manager->shadow->vmap, offset, MI_NOOP,
> +	xe_map_memset(xe, &drm_mm_manager->shadow->vmap, offset, MI_NOOP,
>  		      bb_pool_size);
>  
>  	offset = bb_pool_size - sizeof(u32);
> -	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> -	xe_map_wr(xe, &sa_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &drm_mm_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +	xe_map_wr(xe, &drm_mm_manager->shadow->vmap, offset, u32, MI_BATCH_BUFFER_END);

this seems to break the new XE MM component isolation, as you are directly
touching the XE MM internals without XE MM being aware of this...

are we sure that XE MM will not overwrite this last dword from the pool BO?
maybe it should be exposed to the XE MM user as this 'trail guard' location?

>  
> -	ctx->mem.ccs_bb_pool = sa_manager;
> +	ctx->mem.ccs_bb_pool = drm_mm_manager;
>  
>  	return 0;
>  }
>  
>  static void ccs_rw_update_ring(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	u32 dw[10], i = 0;
>  
> @@ -388,7 +387,7 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  #define XE_SRIOV_VF_CCS_RW_BB_ADDR_OFFSET	(2 * sizeof(u32))
>  void xe_sriov_vf_ccs_rw_update_bb_addr(struct xe_sriov_vf_ccs_ctx *ctx)
>  {
> -	u64 addr = xe_sa_manager_gpu_addr(ctx->mem.ccs_bb_pool);
> +	u64 addr = xe_drm_mm_manager_gpu_addr(ctx->mem.ccs_bb_pool);
>  	struct xe_lrc *lrc = xe_exec_queue_lrc(ctx->mig_q);
>  	struct xe_device *xe = gt_to_xe(ctx->mig_q->gt);
>  
> @@ -412,8 +411,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	struct xe_sriov_vf_ccs_ctx *ctx;
> +	struct xe_drm_mm_bb *bb;
>  	struct xe_tile *tile;
> -	struct xe_bb *bb;
>  	int err = 0;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
> @@ -445,7 +444,7 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_bb *bb;
> +	struct xe_drm_mm_bb *bb;
>  
>  	xe_assert(xe, IS_VF_CCS_READY(xe));
>  
> @@ -471,8 +470,8 @@ int xe_sriov_vf_ccs_detach_bo(struct xe_bo *bo)
>   */
>  void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  {
> -	struct xe_sa_manager *bb_pool;
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> +	struct xe_drm_mm_manager *bb_pool;
>  
>  	if (!IS_VF_CCS_READY(xe))
>  		return;
> @@ -485,7 +484,7 @@ void xe_sriov_vf_ccs_print(struct xe_device *xe, struct drm_printer *p)
>  
>  		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
>  		drm_printf(p, "-------------------------\n");
> -		drm_suballoc_dump_debug_info(&bb_pool->base, p, xe_sa_manager_gpu_addr(bb_pool));
> +		drm_mm_print(&bb_pool->base, p);
>  		drm_puts(p, "\n");
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index 22c499943d2a..f2af074578c9 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -33,7 +33,7 @@ struct xe_sriov_vf_ccs_ctx {
>  	/** @mem: memory data */
>  	struct {
>  		/** @mem.ccs_bb_pool: Pool from which batch buffers are allocated. */
> -		struct xe_sa_manager *ccs_bb_pool;
> +		struct xe_drm_mm_manager *ccs_bb_pool;
>  	} mem;
>  };
>  

