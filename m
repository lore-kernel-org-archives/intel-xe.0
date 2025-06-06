Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21897C5AD49
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 17:38:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C827610E32A;
	Fri,  6 Jun 2025 17:38:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ifb2juZd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB42710E32A
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Jun 2025 17:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749231501; x=1780767501;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=PcUuYXLQ5e4jt4ClYc19BhrS3/m8BRBv13ls9Wgt9lo=;
 b=ifb2juZd4eHDqWIpUo09vBLpgvbWNH5+XKJKqhbbgfD8d0slYGiA9hJR
 5r+BE7eD1aaVebdd0jYQOoRgbah1JF6xGXpo8clIQ+DZzgXCJzPXf2t49
 S5eAkI6BzehsYps9206sBzMP56ZJ1kIu9ufPygStERV8L+Hjb6PXOQSaw
 68vm20Lz5EdNevM52nAqK2qkkDePTLXgnRIm0PZh7bEN8rnMZU7gcnf9E
 PNkfha5nGHvDBjWpaAliWSfdg/4jVG7t131rHh1+eA50GLEHnA4VZfyE5
 9A1tUTaA+/NIWv6FYqkvF04t1gUeokmn7BFFfHOVfUSZ9989f5JMGpSfp w==;
X-CSE-ConnectionGUID: ha2vXfeVSmehKr+OP5oQlg==
X-CSE-MsgGUID: VeZQYNVnScerIlPIlVho4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="51381871"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="51381871"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:38:20 -0700
X-CSE-ConnectionGUID: eYYU9DO0T9m3ca9QeOmO4w==
X-CSE-MsgGUID: wn6WIYu4RZqEtBMBtnmarA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="183081155"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 10:38:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:38:19 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 6 Jun 2025 10:38:18 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 6 Jun 2025 10:38:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VNx5yrQ7rZaq85UYiGdLtj3/2s5IKB3UzwgY2MMgxJSgAm/mSvtHLPZ2BnJMx6ly1D9fSZ73OaTMI0Hzu29GoUH2IH2/m/umsnmyVm4Sjpk6zETbl87eIxU5nR2w3r+NlhD0dUfIPq+Ah6Iy8U7Co/F8nNUlIEkN3W0Vpx5yHlQYdNvamhD1lC4dn4p+PDlqdKre9smkewjsrT/jRHYLz+DiwBt8g4BEzFTADWly6N8kJpEeXrBT0nwZzf9rfu+OY+q2HDz5cJsqMpVdKhFhalLW+YXSUCmUDFcuWEP6gxGdaTj+Jo4fYyVsq4FkYf6pNpbc9aiy6uPOTnDJj9Gxxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2DSS2zQcuwd0bec8+JNZD/1xu+emEqiLE+YGIx4y8o=;
 b=a7rkRFpyXmiHcxhsMZoToItl4zYmsGIk6DWFNNPI4PhMCXriL7LuqxUROl814H+ybCnY2t7QjcUouua5O3pHvYgzeuZvJ75w+jSzM1pkY+QUZUjTBr3wbEhfAqpHBa+nFDmWt4XfKyqL2Rs0YOiv9oUZ/6JTSQin1rVWDsyafVzAgVQr7rnKCiyqRSZ0SG2Nv3yats6YeM6NHWyJLcGnyh+rxezyakQJC4eKj5PZ6YzZ9Z3wpTyKa9etX+Edi82wdLnXo/76XGmQBAEDXeQ0T8cj/qt+/pSx3sMgILBAi0iXum3jrJyerUSErtw/smyFBn05x5dKoi8HOflkCN1sZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CY8PR11MB7267.namprd11.prod.outlook.com (2603:10b6:930:9a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.32; Fri, 6 Jun
 2025 17:38:03 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8813.020; Fri, 6 Jun 2025
 17:38:03 +0000
Date: Fri, 6 Jun 2025 10:39:37 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Tomasz Lis <tomasz.lis@intel.com>, Matthew Auld
 <matthew.auld@intel.com>
Subject: Re: [PATCH v6 1/3] drm/xe/vf: Create contexts for CCS read write
Message-ID: <aEMn2aelzxc/RFJ+@lstrano-desk.jf.intel.com>
References: <20250606124558.30966-1-satyanarayana.k.v.p@intel.com>
 <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250606124558.30966-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: SJ0PR05CA0123.namprd05.prod.outlook.com
 (2603:10b6:a03:33d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CY8PR11MB7267:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c656c6e-d3b0-4e9c-ff44-08dda520e391
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ukw2cHlwa1d5OEV1WWNVRnp5ZUZNUlNveUp4akg0bFZOV2pwWkYxcVZBdFpM?=
 =?utf-8?B?TDBOai95WFlSVlNtWlRHMGovSXgxK3FncTUzdnppY3pZMmUzMlJEdUtGdGds?=
 =?utf-8?B?OVFmWWxwS1ZYR0VDSHp4YmkrbDNuVmRWTXFtQ0tJcWVjb2x6TEVmVWNOaVAw?=
 =?utf-8?B?VnVjNVZ0dUMzVmZjSWovVFNLNEhOckx5a1J6RG43QkkwTjlnK1ZkT0JqRlBQ?=
 =?utf-8?B?MnZzVUdxemtXK2dFdDdIUnJkTTg3MTIwNXRPQmhhc3dGK1BBSUF3TFF2VXNq?=
 =?utf-8?B?cFkyL2NiNkQ0TVhJamFnaUo2TDRjWDFYQS9pZTFiSHgrNURuejZLSTJrM2xU?=
 =?utf-8?B?cVJpRWlKLy9UOHl5N3VUd0xWRUtmeEZRT2k0c1czQ2UyTGRKSXpleGxWUGNM?=
 =?utf-8?B?ZXhyUStpQWd0aWFHdFRUc1FETXN5ekFoeTI1dk0rQ0RwSXppK3pwT2p0Z1M4?=
 =?utf-8?B?QUVuenQ0bjhrVVJ1alJWZXJIQmw1dkE2VFFsaklZdHk1am14djlBVUxaWFFu?=
 =?utf-8?B?NjY2c0g1a01rVjE4cFRHUy85bENuZXpVMkhkU2E2dEhQcjY4UUJ3UEdEZUF5?=
 =?utf-8?B?aGc2RTJ4Z1o3Mmx3VEE0MDJON1h5eCt6RkhyRjZvaUNUT0JlTHNYdDA5enp6?=
 =?utf-8?B?RlExbHpwK2ZxdStHVHF0akhKTERIRnZ1d3VBRjRTVWFTZE9ramFJRW9sM3U1?=
 =?utf-8?B?Q3NHSEphMDhFV2czUEhxblZ4enBJTzhkRnpia1BTNmQweUJtRjdIeG1WMXg4?=
 =?utf-8?B?Z1V6UU0yNS9CeTBINEdPSkxJbEtuZkd6UVpJS3VVeFJZdHkyZnB0SHY5aXA1?=
 =?utf-8?B?UFVLWklMYmFiUi9iUDBtYUJIdUczdUJadDh5cDNaR0E4OEJFMHlJei9EMGJy?=
 =?utf-8?B?d1JRd0pCRHdxY3puK2JwUHV1amFFZlpBYUdjbzRtR3dUcWxOekp1WmpxWDNC?=
 =?utf-8?B?RWN2cEsrSDlOc3ovM3diYXdZNTJoNW43N3dBQnJabGlGSy9rcGhLeFovcm9W?=
 =?utf-8?B?eXJvS0srV29UMHhGZjlwU3UyRStkREtOSmJZeFJEeG9WZlR5WTVIU2Zwdm9Q?=
 =?utf-8?B?YXF4MEdDOHIycGhZZjl0SzNGV3ZLMFZlZVFnTjV0Mk9Wcnc3RHVOYVdyZlpV?=
 =?utf-8?B?bkVrQkpGZ0hrdmxGdmNpd3lNZ3RFMC9jYXVvdGs3WTNQV3owNkJjaWZZSFJq?=
 =?utf-8?B?UUI4TldRWTNOZlNkU25qbGRhYURkWG16akRBOHh2SUpLMWlnK29wbzlnWk1P?=
 =?utf-8?B?L0ZqNGd3d0xrR0JHZ1dySEdkL0U3SUlnTWp3QmlnM3FsdHVQbTNhREhTR0hM?=
 =?utf-8?B?R3N6eW9jamJ5OVQvSWhNRVZkOXN3cmU5UFlybkNtUEhTd21ldkZ4NitJc2JW?=
 =?utf-8?B?dzcvSGtta1lVdC9oeDBHb1hmUkNsWWUwWkhRKzdDT0RRL0Y3UW9DUUlFUDBE?=
 =?utf-8?B?RUxRVzBIKzdvU0pCbEpVMzNnbjhJOEtMQjU2R0VvWXJuZWlXSXg5NFV6djZm?=
 =?utf-8?B?eVcyNVk4ek4yV3BXanBsWDE4bm9xUEgrTCtRT3ZRK3had1lWVFc3dGVlYmlR?=
 =?utf-8?B?WS9hL3ZOeHdiaHhhekxOajMzd0pNSVdyNHV0OU4vTEl0MG9GVHowNy9oeUFW?=
 =?utf-8?B?ZU1EU3ZtWUJrSUVFbi9lTUViZkM4dzFDWkVwalpESUUvc3VJYkpRbjFicVpF?=
 =?utf-8?B?NWNjNng1anJyRXdmVkluTCtnUExMZ2tvRGprdTRrUVNVS2FrWFlOMnpJamN2?=
 =?utf-8?B?S21zcjk0eVJHQjRpY3JRL1NDUVFBc0pHMWh6WTZDR0hpdm82MXNyOGI1WVBi?=
 =?utf-8?B?cDB2SWtGb1hsQXlqaWtyVHJ6bmtnL2c1SGNSbVk0ZWFWTWFYNTd3Q0JGUGpV?=
 =?utf-8?B?RXZVZzFreWlCektnQWcwVU9Zd01XbUs5ZFdsZThiTHVaNFc2WkJ1TUNyQnJm?=
 =?utf-8?Q?WE9ZPHhq3WI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1JhakE5cmFQM3EzbTdrSHVLK0Vpemd1S2diRkdXbDRZMDJqMVpCQk9YbmRF?=
 =?utf-8?B?c3NCMTBrVkw3SGhPenBYQ2xhTTZMV2lYZjd0dXk3T3dORWcvVVZTT2Y5UzJq?=
 =?utf-8?B?Z2dDbmhldWJOMUNWN0t0UVJBTGk5Qm9oeFV3eU9mZTNOSnV1Rm5YbU0vS2FK?=
 =?utf-8?B?d1NUNWI5MWVCdEhvTDBYazNKaUtJZ053OTh4TXFrTVo5Z3hubk95TzRTU1hq?=
 =?utf-8?B?dTE5ZUFlYmpZREFSeXN6UnhZT3BSbW5mNHBhd2pLTUhsNFBlazU2RFNGZU5L?=
 =?utf-8?B?eXpYbEhHYjBHN3NLaVk5aWJXWkQ4MkFvUGRVVFJZYno1Q0xNL2tFeER5dnBB?=
 =?utf-8?B?WW9ORWg3dXZCQTVvWFR3aVltMnZuRHNrVnFiZmJtbmdWMU5Sb0hmMzZob1A0?=
 =?utf-8?B?TnpyYlI4NjA2SUdZa1dzMW9LaE5nY2xKZVpJZWxkdHBIWTlpM1pIWnI3TGF4?=
 =?utf-8?B?NDgwS3pMZ3c1aitEaHAvWGpkUUNqcG1aTDVQSWlTMmtBSnl5LzUxR0tZeURj?=
 =?utf-8?B?eGVxc2tLQlhoQk9lclFHWU0zSTBPUGZEK0ZBcjJkSTQ5ZzBPaDZDREpNYkR2?=
 =?utf-8?B?LytDVFFWRHN0WS9FaDJmTzJvdkpCeUM2UTVTaFd3Z3NiSUFDRm9NSGtLdU1K?=
 =?utf-8?B?RDZpbXZ5WVJuQU50UHV6MnhpcmZoaTM0QzB5dEtLeWFTdzR3L204a3NnNjVL?=
 =?utf-8?B?cGwycWhacmtybUd0YnpoUkgwa0dhbmx5OXU3VjBsVkI5b0FNclI4a1lnYXFR?=
 =?utf-8?B?L0FCTmdteFg2OWVwK3lzMFpwcGpDQngvTTdPVWlab01SSTNQdzE3T0t3bDFh?=
 =?utf-8?B?SG1TRXhDaXFucUdCa3ArcFpkQXZpZTFsMUJ3bVRjcktTenpGaVZEcGFJZ0U1?=
 =?utf-8?B?cmRROHBWWnlZcUdVRUQwaVFSc1lHb3U3Vk4yaWdmeHB6Qko2MU9IeHZoR0px?=
 =?utf-8?B?OC90MWs4cCtBWlhTS2t4M3lmMnBYdmxMdnN2azRLVVpYKzZYWXkrSHBHaElF?=
 =?utf-8?B?SGZLMDVpU25pZGwrZjFRMHkzY1I0VDFxN2t6dzhKeWVwUjk3UnhNdUxFRVh0?=
 =?utf-8?B?U2N6MDM4RFFHWTA0WndicUYza1pUUnlEVlZ5MEE4bEF5d3UrNFcxK0JQRmZl?=
 =?utf-8?B?bGlJVU4wMkp5cWNMQ0FJMWE4WHFkNEI4ZFV2RWlBay9XNFdYaWJYQ3A4NFJU?=
 =?utf-8?B?RllMMG00ZGxuSkpPbDZOaDJnZnNtWUZCeGNWYU5xV0R3VVM2K1hremlsRFBO?=
 =?utf-8?B?VGtwRXd1TkJTK0d2VmhZOTdRdnhyZWE3VWgyTWMxL0diUXZnM3NkMGMvaGh4?=
 =?utf-8?B?akN4dElXQzUxYjVzUklTUkpGc09OQTBBb05sQ2FES2lxTm5lUmdFd1A1ZEpU?=
 =?utf-8?B?NmpPQmltTzVSNWJKdDVqRlhWU1VteWhMVlpzRVNVdlhSNVJDOW5kVlhPdzhv?=
 =?utf-8?B?WG0zQmZnZ2g4UFFncG1rd1A3bE9jdVFPNFQrdnMxM2RLOUNCanB2Mndxcm9q?=
 =?utf-8?B?ckRtV2xVd0R3VU5NaWJVRVd6dW1WRFVscU93S2k4dFZHZ1RvVElWWGhla1c5?=
 =?utf-8?B?NGc4QmFHMldwb1Mza1c4RjRwdTBxYXNpdXJ3NU9NU1hta3JZZ0o4TnM4d0ln?=
 =?utf-8?B?eS9oZEUxNWZuVVhEZjlzRFQvQVpKdGxLdmg3MTV0d0Q4aXdYV3hZdDZBTE53?=
 =?utf-8?B?d1QwZXFWMjF2M0lTU1dSWVhsakdqY0F2cHUrV2JDZXV2S0FCSWx4aGovMTUz?=
 =?utf-8?B?RkZuanpmNXhCUU50OEViTUpWTVcwa043bXhvb1VCcXFsTnBERjZGd09nMDkw?=
 =?utf-8?B?a0tPN1RYWU1OOFQyT3hpaFRNQ05QTzhTNXk2KzIyU1hUbzFDOVFJU0o1NHRs?=
 =?utf-8?B?MFpGR0JZenVCamFGZU54ZWJKTWxrV3NlQUhEQjcwZk5UN0VzSlRRYjR0aVJD?=
 =?utf-8?B?THU3a0RrZXJOdzIzM1FGZnNvb2pkeDlQZFBsUTRySW9hSVVISjJpTlpLNEp4?=
 =?utf-8?B?V3lxb3JGbnY4YUlVbEpFKy8rbllzR1pXK1RHcnhMZlU1WVZ6N252VGl4MDNa?=
 =?utf-8?B?YVEyRXJSU1ZMTWRSQjBjK0h3Y1VaRnVrOU0yNWdUV3NLd3VuWG9KOVJ3ZHY1?=
 =?utf-8?B?M2x5WTlwbE93V0FjTFRZbUp3cHVwMHI4T0NSaHErL1pQL1RNcFhyUmhDR3lK?=
 =?utf-8?B?S0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c656c6e-d3b0-4e9c-ff44-08dda520e391
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2025 17:38:03.4005 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sDgmNgy8kGCx3snM0wuroI/9OcV+JIHNb1sm6JbnKrcv172JtMkKg4BpDsshtedur+rcZAZLG3TpXG2auf9iMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7267
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

On Fri, Jun 06, 2025 at 06:15:56PM +0530, Satyanarayana K V P wrote:
> Create two LRCs to handle CCS meta data read / write from CCS pool in the
> VM. Read context is used to hold GPU instructions to be executed at save
> time and write context is used to hold GPU instructions to be executed at
> the restore time.
> 
> Allocate batch buffer pool using suballocator for both read and write
> contexts.
> 
> Migration framework is reused to create LRCAs for read and write.
> 

Missed a few nits...

Ack stands, with nits fixes.

> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> ---
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Tomasz Lis <tomasz.lis@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> 
> V5 -> V6:
> - Added id field in the xe_tile_vf_ccs structure for self identification.
> 
> V4 -> V5:
> - Modified read/write contexts to enums from #defines (Matthew Brost).
> - The CCS BB pool size is calculated based on the system memory size (Michal
>   Wajdeczko & Matthew Brost).
> 
> V3 -> V4:
> - Fixed issues reported by patchworks.
> 
> V2 -> V3:
> - Added new variable which denotes the initialization of contexts.
> 
> V1 -> V2:
> - Fixed review comments.
> ---
>  drivers/gpu/drm/xe/Makefile                |   1 +
>  drivers/gpu/drm/xe/xe_device.c             |   4 +
>  drivers/gpu/drm/xe/xe_device_types.h       |   4 +
>  drivers/gpu/drm/xe/xe_gt_debugfs.c         |  36 ++++
>  drivers/gpu/drm/xe/xe_sriov.c              |  19 +++
>  drivers/gpu/drm/xe/xe_sriov.h              |   1 +
>  drivers/gpu/drm/xe/xe_sriov_types.h        |   5 +
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 186 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.h       |  13 ++
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  46 +++++
>  10 files changed, 315 insertions(+)
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
>  create mode 100644 drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> 
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f5f5775acdc0..3b5241937742 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -140,6 +140,7 @@ xe-y += \
>  	xe_memirq.o \
>  	xe_sriov.o \
>  	xe_sriov_vf.o \
> +	xe_sriov_vf_ccs.o \
>  	xe_tile_sriov_vf.o
>  
>  xe-$(CONFIG_PCI_IOV) += \
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..bf96045770c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -925,6 +925,10 @@ int xe_device_probe(struct xe_device *xe)
>  
>  	xe_vsec_init(xe);
>  
> +	err = xe_sriov_late_init(xe);
> +	if (err)
> +		goto err_unregister_display;
> +
>  	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>  
>  err_unregister_display:
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index ac27389ccb8b..caf3bb1ef048 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -22,6 +22,7 @@
>  #include "xe_pmu_types.h"
>  #include "xe_pt_types.h"
>  #include "xe_sriov_types.h"
> +#include "xe_sriov_vf_ccs_types.h"
>  #include "xe_step_types.h"
>  #include "xe_survivability_mode_types.h"
>  #include "xe_ttm_vram_mgr_types.h"
> @@ -234,6 +235,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
>  			struct xe_ggtt_node *ggtt_balloon[2];
> +
> +			/** @sriov.vf.ccs: CCS read and write contexts for VF. */
> +			struct xe_tile_vf_ccs ccs[XE_SRIOV_VF_CCS_RW_MAX_CTXS];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..2c6d757db810 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -134,6 +134,30 @@ static int sa_info(struct xe_gt *gt, struct drm_printer *p)
>  	return 0;
>  }
>  
> +static int sa_info_vf_ccs(struct xe_gt *gt, struct drm_printer *p)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_sa_manager *bb_pool;
> +	int ctx_id;

s/int ctx_id/enum xe_sriov_vf_ccs_rw_ctxs ctx_id

> +
> +	if (!IS_VF_CCS_READY(gt_to_xe(gt)))
> +		return 0;
> +
> +	xe_pm_runtime_get(gt_to_xe(gt));
> +
> +	for_each_ccs_rw_ctx(ctx_id) {
> +		drm_printf(p, "ccs %s bb suballoc info\n", ctx_id ? "write" : "read");
> +		drm_printf(p, "-------------------------\n");
> +		bb_pool = tile->sriov.vf.ccs[ctx_id].mem.ccs_bb_pool;
> +		drm_suballoc_dump_debug_info(&bb_pool->base, p, bb_pool->gpu_addr);
> +		drm_puts(p, "\n");
> +	}
> +
> +	xe_pm_runtime_put(gt_to_xe(gt));
> +
> +	return 0;
> +}
> +
>  static int topology(struct xe_gt *gt, struct drm_printer *p)
>  {
>  	xe_pm_runtime_get(gt_to_xe(gt));
> @@ -303,6 +327,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
>  	{"hwconfig", .show = xe_gt_debugfs_simple_show, .data = hwconfig},
>  };
>  
> +/*
> + * only for GT debugfs files which are valid on VF. Not valid on PF.
> + */
> +static const struct drm_info_list vf_only_debugfs_list[] = {
> +	{"sa_info_vf_ccs", .show = xe_gt_debugfs_simple_show, .data = sa_info_vf_ccs},
> +};
> +
>  /* everything else should be added here */
>  static const struct drm_info_list pf_only_debugfs_list[] = {
>  	{"hw_engines", .show = xe_gt_debugfs_simple_show, .data = hw_engines},
> @@ -419,6 +450,11 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>  		drm_debugfs_create_files(pf_only_debugfs_list,
>  					 ARRAY_SIZE(pf_only_debugfs_list),
>  					 root, minor);
> +	else
> +		drm_debugfs_create_files(vf_only_debugfs_list,
> +					 ARRAY_SIZE(vf_only_debugfs_list),
> +					 root, minor);
> +
>  
>  	xe_uc_debugfs_register(&gt->uc, root);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index a0eab44c0e76..87911fb4eea7 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -15,6 +15,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_vf.h"
> +#include "xe_sriov_vf_ccs.h"
>  
>  /**
>   * xe_sriov_mode_to_string - Convert enum value to string.
> @@ -157,3 +158,21 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t size)
>  		strscpy(buf, "PF", size);
>  	return buf;
>  }
> +
> +/**
> + * xe_sriov_late_init() - SR-IOV late initialization functions.
> + * @xe: the &xe_device to initialize
> + *
> + * On VF this function will initialize code for CCS migration.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_late_init(struct xe_device *xe)
> +{
> +	int err = 0;
> +
> +	if (IS_VF_CCS_INIT_NEEDED(xe))
> +		err = xe_sriov_vf_ccs_init(xe);
> +
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 688fbabf08f1..0e0c1abf2d14 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -18,6 +18,7 @@ const char *xe_sriov_function_name(unsigned int n, char *buf, size_t len);
>  void xe_sriov_probe_early(struct xe_device *xe);
>  void xe_sriov_print_info(struct xe_device *xe, struct drm_printer *p);
>  int xe_sriov_init(struct xe_device *xe);
> +int xe_sriov_late_init(struct xe_device *xe);
>  
>  static inline enum xe_sriov_mode xe_device_sriov_mode(const struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_sriov_types.h b/drivers/gpu/drm/xe/xe_sriov_types.h
> index ca94382a721e..8abfdb2c5ead 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_types.h
> @@ -71,6 +71,11 @@ struct xe_device_vf {
>  		/** @migration.gt_flags: Per-GT request flags for VF migration recovery */
>  		unsigned long gt_flags;
>  	} migration;
> +
> +	struct {
> +		/** @initialized: Initilalization of vf ccs is completed or not */
> +		bool initialized;
> +	} ccs;
>  };
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> new file mode 100644
> index 000000000000..41fe1f59e0e9
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -0,0 +1,186 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#include "instructions/xe_mi_commands.h"
> +#include "instructions/xe_gpu_commands.h"
> +#include "xe_bo.h"
> +#include "xe_device.h"
> +#include "xe_migrate.h"
> +#include "xe_sa.h"
> +#include "xe_sriov_printk.h"
> +#include "xe_sriov_vf_ccs.h"
> +#include "xe_sriov_vf_ccs_types.h"
> +
> +/**
> + * DOC: VF save/restore of compression Meta Data
> + *
> + * VF KMD registers two special contexts/LRCAs.
> + *
> + * Save Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) save in regular System memory in VM.
> + *
> + * Restore Context/LRCA: contain necessary cmds+page table to trigger Meta data /
> + * compression control surface (Aka CCS) Restore from regular System memory in
> + * VM to corresponding CCS pool.
> + *
> + * Below diagram explain steps needed for VF save/Restore of compression Meta
> + * Data::
> + *
> + *    CCS Save    CCS Restore          VF KMD                          Guc       BCS
> + *     LRCA        LRCA
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |     Create Save LRCA            |                              |         |
> + *     [ ]<----------------------------- [ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |   Register LRCA with Guc     |         |
> + *      |           |                    [ ]--------------------------->[ ]        |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Create restore LRCA |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]-----------------------      |         |
> + *      |           |                    [ ]  Allocate main memory |     |         |
> + *      |           |                    [ ]  Allocate CCS memory  |     |         |
> + *      |           |                    [ ]<----------------------      |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      | Update Main memory & CCS pages  |                              |         |
> + *      |   PPGTT + BB cmds to save       |                              |         |
> + *     [ ]<------------------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           | Update Main memory  |                              |         |
> + *      |           | & CCS pages PPGTT + |                              |         |
> + *      |           | BB cms to restore   |                              |         |
> + *      |          [ ]<------------------[ ]                             |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Pause                         |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS Save |
> + *      |           |                     |                              | LRCA    |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                   VF Restore                       |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                    [ ]--------------               |         |
> + *      |           |                    [ ] Fix up GGTT  |              |         |
> + *      |           |                    [ ]<-------------               |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |Schedule |
> + *      |           |                     |                              |CCS      |
> + *      |           |                     |                              |Restore  |
> + *      |           |                     |                              |LRCA     |
> + *      |           |                     |                             [ ]------>[ ]
> + *      |           |                     |                              |         |
> + *      |           |                     |                              |         |
> + *
> + */
> +
> +static u64 get_ccs_bb_pool_size(struct xe_device *xe)
> +{
> +	u64 sys_mem_size, ccs_mem_size, ptes, bb_pool_size;
> +	struct sysinfo si;
> +
> +	si_meminfo(&si);
> +	sys_mem_size = si.totalram * si.mem_unit;
> +	ccs_mem_size = sys_mem_size / NUM_BYTES_PER_CCS_BYTE(xe);
> +	ptes = DIV_ROUND_UP(sys_mem_size + ccs_mem_size, XE_PAGE_SIZE);
> +
> +	/**
> +	 * We need below BB size to hold PTE mappings and some DWs for copy
> +	 * command. In reality, we need space for many copy commands. So, let
> +	 * us allocate double the calculated size which is enough to holds GPU
> +	 * instructions for the whole region.
> +	 */
> +	bb_pool_size = ptes * sizeof(u32);
> +
> +	return round_up(bb_pool_size * 2, SZ_1M);
> +}
> +
> +static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
> +{
> +	struct xe_device *xe = tile_to_xe(tile);
> +	struct xe_sa_manager *sa_manager;
> +	u64 bb_pool_size;
> +	int offset, err;
> +
> +	bb_pool_size = get_ccs_bb_pool_size(xe);
> +	xe_sriov_info(xe, "Allocating %s CCS BB pool size = %lldMB\n",
> +		      ctx->id ? "Restore" : "Save", bb_pool_size / SZ_1M);
> +
> +	sa_manager = xe_sa_bo_manager_init(tile, bb_pool_size, SZ_16);
> +
> +	if (IS_ERR(sa_manager)) {
> +		xe_sriov_err(xe, "Suballocator init failed with error: %pe\n",
> +			     sa_manager);
> +		err = PTR_ERR(sa_manager);
> +		return err;
> +	}
> +
> +	offset = 0;
> +	xe_map_memset(xe, &sa_manager->bo->vmap, offset, MI_NOOP,
> +		      bb_pool_size);
> +
> +	offset = bb_pool_size - sizeof(u32);
> +	xe_map_wr(xe, &sa_manager->bo->vmap, offset, u32, MI_BATCH_BUFFER_END);
> +
> +	ctx->mem.ccs_bb_pool = sa_manager;
> +
> +	return 0;
> +}
> +
> +/**
> + * xe_sriov_vf_ccs_init - Setup LRCA for save & restore.
> + * @xe: the &xe_device to start recovery on
> + *
> + * This function shall be called only by VF. It initializes
> + * LRCA and suballocator needed for CCS save & restore.
> + *
> + * Return: 0 on success. Negative error code on failure.
> + */
> +int xe_sriov_vf_ccs_init(struct xe_device *xe)
> +{
> +	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
> +	struct xe_tile *tile;
> +	int tile_id, ctx_id;

s/int ctx_id/enum xe_sriov_vf_ccs_rw_ctxs ctx_id

> +	int err = 0;
> +
> +	xe_assert(xe, (IS_SRIOV_VF(xe) || !IS_DGFX(xe) ||
> +		       xe_device_has_flat_ccs(xe)));
> +
> +	for_each_tile(tile, xe, tile_id) {
> +		for_each_ccs_rw_ctx(ctx_id) {
> +			ctx = &tile->sriov.vf.ccs[ctx_id];
> +			ctx->id = ctx_id;
> +
> +			migrate = xe_migrate_init(tile);
> +			if (IS_ERR(migrate)) {
> +				err = PTR_ERR(migrate);
> +				goto err_ret;
> +			}
> +			ctx->migrate = migrate;
> +
> +			err = alloc_bb_pool(tile, ctx);
> +			if (err)
> +				goto err_ret;
> +		}
> +	}
> +
> +	xe->sriov.vf.ccs.initialized = 1;
> +
> +	return 0;
> +
> +err_ret:
> +	return err;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> new file mode 100644
> index 000000000000..5df9ba028d14
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS_H_
> +#define _XE_SRIOV_VF_CCS_H_
> +
> +struct xe_device;
> +
> +int xe_sriov_vf_ccs_init(struct xe_device *xe);
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> new file mode 100644
> index 000000000000..f67f002c7a96
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2022-2023 Intel Corporation
> + */
> +
> +#ifndef _XE_SRIOV_VF_CCS__TYPES_H_
> +#define _XE_SRIOV_VF_CCS__TYPES_H_
> +
> +#define for_each_ccs_rw_ctx(id__) \
> +	for ((id__) = 0; (id__) < XE_SRIOV_VF_CCS_RW_MAX_CTXS; (id__)++)
> +
> +#define IS_VF_CCS_READY(xe) ({ \
> +		struct xe_device *___xe = (xe); \
> +		xe_assert(___xe, IS_SRIOV_VF(___xe)); \
> +		___xe->sriov.vf.ccs.initialized; \
> +		})
> +
> +#define IS_VF_CCS_INIT_NEEDED(xe) ({\
> +		struct xe_device *___xe = (xe); \
> +		IS_SRIOV_VF(___xe) && !IS_DGFX(___xe) && \
> +		xe_device_has_flat_ccs(___xe) && GRAPHICS_VER(___xe) >= 20; \
> +		})
> +
> +enum xe_sriov_vf_ccs_rw_ctxs {
> +	XE_SRIOV_VF_CCS_RW_MIN_CTXS = 0,
> +	XE_SRIOV_VF_CCS_READ_CTX = XE_SRIOV_VF_CCS_RW_MIN_CTXS,
> +	XE_SRIOV_VF_CCS_WRITE_CTX,
> +	XE_SRIOV_VF_CCS_RW_MAX_CTXS
> +};
> +
> +struct xe_migrate;
> +struct xe_sa_manager;
> +
> +struct xe_tile_vf_ccs {
> +	/** @id: Id to which context it belongs to */
> +	int id;

s/int id/enum xe_sriov_vf_ccs_rw_ctxs ctx_id

Matt

> +	/** @migrate: Migration helper for save/restore of CCS data */
> +	struct xe_migrate *migrate;
> +
> +	struct {
> +		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> +		struct xe_sa_manager *ccs_bb_pool;
> +	} mem;
> +};
> +
> +#endif
> -- 
> 2.43.0
> 
