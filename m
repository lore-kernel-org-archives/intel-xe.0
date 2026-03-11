Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE28C1125811
	for <intel-xe@archiver.kernel.org>; Wed, 11 Mar 2026 18:19:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BCAF10E023;
	Wed, 11 Mar 2026 18:19:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oB974Kh/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C40BF10E023;
 Wed, 11 Mar 2026 18:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773253192; x=1804789192;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=pqCD/Ggon+u0srUv8MgESB3++LEq2xGFLb3CaannOh8=;
 b=oB974Kh/4DjzNTpggt/INZ/o1+OXw+Fl5hTYTxGJhnx2VetqLPxJY9BY
 ltCNK2KZec8pNzsD1apL96E9E7uK+7fjk0xBUFrsOGvfqWGVoeYnziw+n
 R4Xt/1LXFdowGQjgnIbR3UMloMHlKtmlisYYcWpYnagLzjlN51jtRuZzC
 LM3WPIvBQpFv+bYRVDcRXKG+VuBHGyiajfi3wNKfwa6lounhaGxLU1n3+
 k9o9dPUtZUFGl4g0xMUM61vVbQoQcCahw4IQDYrbwG8StJZ5hhAVkJgQZ
 g/YUHihqI+u9DzUZPCN1yO/hpEA4T7jKJ/BxOZBcRhvdV774J5mRaJxkb w==;
X-CSE-ConnectionGUID: wcJMgmiKRCmjrjiyrQt+hA==
X-CSE-MsgGUID: /fLIJTrNSTq8rf1U8Lrmag==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="84961620"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="84961620"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:19:50 -0700
X-CSE-ConnectionGUID: rp6Gfd8zS3+kByNXoT4TcQ==
X-CSE-MsgGUID: 989SJnvYSLKvZLtWCQhtPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; d="scan'208";a="219808664"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2026 11:19:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:19:49 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 11 Mar 2026 11:19:49 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.31) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 11 Mar 2026 11:19:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpsxIq9o0dCdUdYYseKEMrpAmU+TH/YKPHqOtBu+gRIsR3aS27jnsSEiWmxGeHJt/WYDd2u0mP5dCqeqYsvpW7QlzE5mjbcIPXCVXyh+W5kp04CaYbBAJdvtPr+FFxSR/XHvhlCqIlE/mzL3zdT+iJJ1Fov5aUL+2CHMi5yDKs583JR4IKBjeaqKT/Inh10+awFpT9VIyhw4ug++FbTm8UCCy+i5RsVt3+P/KTCQPLgMkJqr+sKQb37pTcfNN7mtFlBGsEuNI+EmFIk+6Fa718bhI4vovnyP74oqNbMiyehfGbuBS8m0y483VC+kaHcreByNmOMk8Ldomz8PYEQxaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hMZ8DUvGu/QR4/+qIVw4iD7yrMFAmkxzKLNjQtK4sbE=;
 b=FKS4SJBBr5i6o/SntUDquACFj+Ph03v48PvYvWRUPvE20pl3iGrl/bzwPCKnAhBstEUg5F+Sc+6aXuhmVRw4X6bj1ZVlam8ntBZQXTugjOH65mc6hYzxSUsxcmroLxRgjoBl0K7/x6aVKH9dyhWw3LivWLZIRy/PhsiI/tc43Iga1uT3Oi4+eLIe5p+HVJYRFrICkOYGPDURKDrgdL5A2X7dRDlvJMRExyTpQBaCxVHEIeQpcUkUrGvp23PEeMHStayrCoPC8MUW+NVCJl1SoaH1t7FE0e94NwD7DW3RlOEMBJDSoYJZPLm7mdSpwy2gwtZjvVaOz1vxjPuYSZKZ5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SJ2PR11MB8321.namprd11.prod.outlook.com (2603:10b6:a03:546::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Wed, 11 Mar
 2026 18:19:45 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%3]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 18:19:45 +0000
Message-ID: <1249efb1-0ba3-43d6-b525-e6f3721ff1c5@intel.com>
Date: Wed, 11 Mar 2026 19:19:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v5 1/1] drm/xe/pf: Restrict device query responses in
 admin-only PF mode
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, "Dunajski
 Bartosz" <bartosz.dunajski@intel.com>, <dri-devel@lists.freedesktop.org>
References: <20260227120702.3651913-3-satyanarayana.k.v.p@intel.com>
 <20260227120702.3651913-4-satyanarayana.k.v.p@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260227120702.3651913-4-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0097.eurprd01.prod.exchangelabs.com
 (2603:10a6:803:15::38) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SJ2PR11MB8321:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f99bcd3-eeb4-41ab-00a9-08de7f9ac59c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|56012099003|18002099003|22082099003; 
X-Microsoft-Antispam-Message-Info: SvyGVCnEeUDJ28678/c3uXAKYmITeX2HUU4aEEa4891w52YTcKpyKCcKmLesPlsbXb6O3tOe2J3CjuL3symxlqmFaaJXAE1GOKCVv8Uoy/j0STnbr/2odCdmI3O9aTph+dN0pPqPQPoBBQXiFk5N7TG3bt2vf7zddhuILDr9Ppr1PkMXGOe2xDFLCjkAI3gQthkDeXJCIMjSZUB0NexvyRLNZuwRyUh/KITNwk9NyFiyqKZqzOFwygve17WfIO1v3LikhOEMudJ1Wo5Zisc38MvX0Aga77px+5863Lbj8rLzLfNzfjWE9nxx/xuQTtYTDbM6YY0DjL85lw1RQ/ytqJqmgIQzoAnphhDFmvF8jw/fddNpMloF71JvljIaFLzVNqlrOLPHLbbW7LzoAmrO3EcLScSmwehQZmj+xYVnYywvW7CJULLIoLFEVsNHrMOg7eRkJa1B0IKLb04tvJkZ2+92vIJd7Pdg8GttYZXimN3HjfiEyTZE2YEIXN4sVo3MnabGWwQ0KMTrXhpdekW85N6HbV3NfIOGOz6smJfEaTh/AI0d+Mtp/7B+AICZmRr31nwaMuSYAEA2/cOyeMZWgOLCLkIcjnLY6unATk+gYYrOV0yehOSfTBm/rxYksrvodWy81GFpIrsN2wKWibwBOaDPPP1hhTEmYEJvecN61Zsln4FKJ8x/zMeOfY95/a3VeW494h23xf6B/26f6/E+uahdSSmXkG3yOj4B4QlWRBw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(56012099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9ja2dJdWxUQmF2TWhFUEk5R1RmbThnUklmNVJlNEIvc1hwYnFyNVl1cFpx?=
 =?utf-8?B?VGZVWjJzM0d6VmJMZ1d2VVRBSWtsTU03aDBOUUZ4NGRYR0tLbHllSGg3alR6?=
 =?utf-8?B?a0hkRkRKa3ZhUHRFR0hqSFQwbjU0dzVqYXRIM2Y0VkFaZUNIdmdYSGgxYTBl?=
 =?utf-8?B?bnZ0VVFGZWlIRERkRXg0SmovV3FCUjJDWmFnS3R0N2tmTXE4V1Q1RUwxc0p4?=
 =?utf-8?B?NzE2dC9ITVJhSEFuaXptdnVRLzhxanR1RW0wenBPYlJTbWhMY2YybmkzellH?=
 =?utf-8?B?UHpEUldEcFdpdTZZSjlHU1I3TXNwemVWR0NSZWRJaXRHd1dvTy9qblB3djNM?=
 =?utf-8?B?WHpBK1V1VXV5ZUZzWVczdENBbWdNVHJFN3JKcFlEMXYyQ2R1ckJ6NEVEcGxv?=
 =?utf-8?B?QUF5UDBWbnByeEVjaGZIRHFXZEFkVU9SdThTTHhwMmlKTFloT0xsY1lnaDQ2?=
 =?utf-8?B?dW1tdG1JbWU5SjZ1eFhycFQwWWZENzRsaFNreGpycWVyYmVhOGRuWTkyaURW?=
 =?utf-8?B?QXZzRjdLcmpZaEZNLzd4SXFmRGgyeGFOeHJpYVgvdlNjeERUZnlId0pzVWI3?=
 =?utf-8?B?c2RNS00vcE1YRWFwY1BWZVZhTjRaOFRFdnpvZVhueG5nclVoZFBqZWpQVGlH?=
 =?utf-8?B?NTFBcFNEcWN6TkVpQ0lvek52Y1dRQ0paVkFTTzcrWVhRblFaVEM1NjMySStv?=
 =?utf-8?B?QkFTYWc5T2FPTXZQMi95M3ZMSlAwQTdIYS8wSFI2UG0xZmFPRWZRM3BKTEF4?=
 =?utf-8?B?QWhJbXpZU0tJYmZJenNVc1BZMG1aalZLU2dWY1JzQUd1TnJKZHE4QjRTOHB4?=
 =?utf-8?B?ZHBGamlDMzYrZDNBb0hCQU9lckxuVVVGTHU1RytVZ2dWRFErZGZwTU9YZzN3?=
 =?utf-8?B?c0FmaHBhMy9nbEZpeHdKcUR0b2NzaGRyL01vQWo2MFVad1IxMTBHRkJIVnh3?=
 =?utf-8?B?WlZhL0IyYk9kSG05Zkl2ZXhubXhIK3ZYcVBMUTlwS0EzRk9CZUoxaHluang2?=
 =?utf-8?B?eFFUbXdTcGZ0cS9zbVBhNXYvbGc3NXpWRG1HTkkvOTdlL2tQa054WFRuYnVT?=
 =?utf-8?B?WCtmWSt4ODA0ZHJ1c2NlbkhmZ1E5QTV0QzgrSFRudFRUOUlyQjdEYlpxUlNY?=
 =?utf-8?B?Tmd6N3hVZCtEWjZrUjYrQmRMNmx1Q0dCVUgveUhlRzFwM2ZaaXh1WHJ2Q2F0?=
 =?utf-8?B?dkROYW1ZTHhmWnVPaEljbXlrNEVwK3ZVMjFwNXJ4cWJYR0lmNTc5VnFrWG02?=
 =?utf-8?B?MEVWMTRkRVFNNno5N2ZTZ3g4c1NZWFUzUjZIdzVOQk1CQmk3Y2lScUlCTVJ1?=
 =?utf-8?B?TDFFcHdzNkNCOHBDVk81TG9sa2djTnRRcFBlekNpT0xDR0gxdC9XN0lxZTdM?=
 =?utf-8?B?TkVsdFNPSDNDcE9XelV2L0dFR1Y0b2NnRU16Z29XcUdvbUF1OWVodkZOMkRh?=
 =?utf-8?B?cmRGUmVUTVZUVEtKKzdybGcyTC91MHpNY0k3VTZYZDZ1ekhtME02TnNRanoy?=
 =?utf-8?B?d0lNQ2U2UWwzbTFUaWl5VGxLZzR0UTA2d2hLaDVUdWZRakoxMERUUkgyYlVp?=
 =?utf-8?B?NWoraDhEVUNSMzdWSFIzMG9EUFh3MEI0VWp3SG1mRUEzRk1BdVdoeHJ0N3NU?=
 =?utf-8?B?d1Ira20zS2Q5MTZoYnlMSGVtcjBhaXpDZE16VjU5NGliOGZ5V2YwZlpRS00r?=
 =?utf-8?B?T3ZCK1ZvQ1dyQWhIODR3R3Z6MWpHVXFvNHpMelVpdU1xbmJVRmdGNmJ0aW5T?=
 =?utf-8?B?NVVqSytlRHlobDdyU29ydFlaUCs1SEFrZld4S0I3ZUo3akpjdUhqY0gwWFZI?=
 =?utf-8?B?NGovY2NIMnh0aGNmWlQvdDZYS3NvTnloY2FRemlJdXFVZHVxNnhEdDhpVFh6?=
 =?utf-8?B?MWdOSWF4dlkzMzg5TThRTVNBcUZ6UkNSRURDM21DVWEzL0hXbGVNdmt1bjc0?=
 =?utf-8?B?cGx3K3EzZVBSUC84ak95cmQ4dWlJN2llSTU4RFIrQzVhbjdGdlhSTEhzanBS?=
 =?utf-8?B?bE1La1dXNDFnblcxdEZyb0gwbGJxNmhsV1dwRnJycGdqY0svMWZ6OHJWamwr?=
 =?utf-8?B?anpFbytIaHRXV1hYZnZEWjNKbVZXYk5zb1pYU3dQVVR5SnZSbXJOYUZlNXM4?=
 =?utf-8?B?ZUdKVG9FcUVNZ0g0QUZwQ3V0dmFiSlZRRllTaHk4WTFJWWQrQ0Q4YzJUQ0dj?=
 =?utf-8?B?YkdJTVdkVnVaSmJBVGMxejhJWmRlSm5nVkYxVWRQUWZXN2Z6UDlqdFhGZElV?=
 =?utf-8?B?Z056ak1DOWhYMXFOdXhUdVdZeFViTjlUUE9OMG83OFh2bmloS2xiQ3hLT1NN?=
 =?utf-8?B?Zm54d3Z0YkVDK0p5alFzcjNxNWtaRXU3Ny81SEdsU3lrOXlncHRiaFJGTVpP?=
 =?utf-8?Q?GnwrMZ5rpfvFksSw=3D?=
X-Exchange-RoutingPolicyChecked: ooHX6n0v+NIdT/8QNT/6MEWK3Wn5qgmXdgh88Gm8j1qs9NwOK4soGNFXigrYz0gIf9T7fiQKEDqrvi10sVqB4aEeuj5M5FGTyXTmWinR5Tl+0k3Fo0abufV38BwBbXQJzWDkdat0KTF05lct1/Goc9Y4f2ZozCIYZEHbRjHfjqn9AGshgWMwt7KkHV6xdv/R1KNuv1cwuklJ6sRP6ouAvboSUiQ+5A0kJOyT4T0oKhH7fTi+o6c6S0y1ZQVPvQgTPNrqgldIN1ZTH1R6hSgUIyUasf+t5urxAhoIzzttiSSRCCPgKsPhQVUSgmCwHPh3wtVT6FsKlbPAkMw9Hgz6/A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f99bcd3-eeb4-41ab-00a9-08de7f9ac59c
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 18:19:45.3182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 92cTgqLog2ykNRjdXbw2JGkyQ3hrgRSKGg+uNlwHp/HRQK/Raueptd9SehO0pfAH8VGjsjYyORfmA8SXe5c/jorTHLens4cuVdmGQp/uv6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8321
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



On 2/27/2026 1:07 PM, Satyanarayana K V P wrote:
> When a PF is configured in admin-only mode, it is intended for management
> only and must not expose workload-facing capabilities to userspace.
> 
> Limit the exposed ioctl set in admin-only PF mode to XE_DEVICE_QUERY, and
> suppress capability-bearing query payloads so userspace cannot discover
> execution-related device details in this mode.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Dunajski Bartosz <bartosz.dunajski@intel.com>
> Cc: dri-devel@lists.freedesktop.org
> 
> ---
> V4 -> V5:
> - Updated commit message (Matt B).
> - Introduced new driver_admin_only_pf structure (Michal Wajdeczko).
> - Updated all query configs (Michal Wajdeczko).
> - Renamed xe_device_is_admin_only() to xe_device_is_admin_only_pf()
> - Fixed other review comments (Michal Wajdeczko).
> 
> V3 -> V4:
> - Suppressed device capabilities in admin-only PF mode. (Wajdeczko)
> 
> V2 -> V3:
> - Introduced new helper function xe_debugfs_create_files() to create
> debugfs entries based on admin_only_pf mode or normal mode.
> 
> V1 -> V2:
> - Rebased to latest drm-tip.
> - Update update_minor_dev() to debugfs_minor_dev().
> ---
>  drivers/gpu/drm/xe/xe_device.c | 47 +++++++++++++++++++++++++++--
>  drivers/gpu/drm/xe/xe_query.c  | 55 ++++++++++++++++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov.h  | 11 +++++++
>  3 files changed, 94 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 3462645ca13c..76d534491e01 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -25,6 +25,7 @@
>  #include "regs/xe_regs.h"
>  #include "xe_bo.h"
>  #include "xe_bo_evict.h"
> +#include "xe_configfs.h"
>  #include "xe_debugfs.h"
>  #include "xe_defaults.h"
>  #include "xe_devcoredump.h"
> @@ -213,6 +214,10 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>  			  DRM_RENDER_ALLOW),
>  };
>  
> +static const struct drm_ioctl_desc xe_ioctls_admin_only_pf[] = {
> +	DRM_IOCTL_DEF_DRV(XE_DEVICE_QUERY, xe_query_ioctl, DRM_RENDER_ALLOW),
> +};
> +
>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  {
>  	struct drm_file *file_priv = file->private_data;
> @@ -415,6 +420,29 @@ static struct drm_driver driver = {
>  	.patchlevel = DRIVER_PATCHLEVEL,
>  };
>  
> +static struct drm_driver driver_admin_only_pf  = {
                                                ^^
double space

and nit: maybe

	static struct drm_driver admin_only_driver = {

> +	.driver_features =
> +	    DRIVER_GEM | DRIVER_GEM_GPUVA,
> +	.open = xe_file_open,
> +	.postclose = xe_file_close,
> +
> +	.gem_prime_import = xe_gem_prime_import,
> +
> +	.dumb_create = xe_bo_dumb_create,
> +	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
> +#ifdef CONFIG_PROC_FS
> +	.show_fdinfo = xe_drm_client_fdinfo,
> +#endif
> +	.ioctls = xe_ioctls_admin_only_pf,
> +	.num_ioctls = ARRAY_SIZE(xe_ioctls_admin_only_pf),
> +	.fops = &xe_driver_fops,
> +	.name = DRIVER_NAME,
> +	.desc = DRIVER_DESC,
> +	.major = DRIVER_MAJOR,
> +	.minor = DRIVER_MINOR,
> +	.patchlevel = DRIVER_PATCHLEVEL,
> +};
> +
>  static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
> @@ -439,16 +467,24 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent)
>  {
> +	struct drm_driver *active_drm_driver = &driver;

nit: maybe

	struct drm_driver *driver = &regular_driver;

>  	struct xe_device *xe;
>  	int err;
>  
> -	xe_display_driver_set_hooks(&driver);
> +	/*
> +	 * Since XE device is not initialized yet, read from configfs
> +	 * directly to decide whether we are in admin-only PF mode or not.
> +	 */
> +	if (xe_configfs_admin_only_pf(pdev))
> +		active_drm_driver = &driver_admin_only_pf;
> +
> +	xe_display_driver_set_hooks(active_drm_driver);
>  
> -	err = aperture_remove_conflicting_pci_devices(pdev, driver.name);
> +	err = aperture_remove_conflicting_pci_devices(pdev, active_drm_driver->name);
>  	if (err)
>  		return ERR_PTR(err);
>  
> -	xe = devm_drm_dev_alloc(&pdev->dev, &driver, struct xe_device, drm);
> +	xe = devm_drm_dev_alloc(&pdev->dev, active_drm_driver, struct xe_device, drm);
>  	if (IS_ERR(xe))
>  		return xe;
>  
> @@ -708,6 +744,11 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	xe_sriov_probe_early(xe);
>  
> +	if (xe_configfs_admin_only_pf(to_pci_dev(xe->drm.dev)) && !IS_SRIOV_PF(xe)) {
> +		drm_err(&xe->drm, "Admin-only PF mode is enabled in non PF mode\n");
> +		return -ENODEV;
> +	}
> +
>  	if (IS_SRIOV_VF(xe))
>  		vf_update_device_info(xe);
>  
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723f..f46e62797dd6 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -55,6 +55,9 @@ static size_t calc_hw_engine_info_size(struct xe_device *xe)
>  	u8 gt_id;
>  	int i = 0;
>  
> +	if (xe_device_is_admin_only_pf(xe))

shouldn't we move that check to xe_hw_engine_is_reserved() to also
cover all other use cases for free?

> +		return 0;
> +
>  	for_each_gt(gt, xe, gt_id)
>  		for_each_hw_engine(hwe, gt, id) {
>  			if (xe_hw_engine_is_reserved(hwe))
> @@ -126,7 +129,10 @@ query_engine_cycles(struct xe_device *xe,
>  	if (IS_SRIOV_VF(xe))
>  		return -EOPNOTSUPP;
>  
> -	if (query->size == 0) {
> +	if (xe_device_is_admin_only_pf(xe))
> +		size = 0;

btw, it looks that we don't use xe_hw_engine_is_reserved() to check
if query is allowed ...

> +
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -190,7 +196,7 @@ static int query_engines(struct xe_device *xe,
>  	u8 gt_id;
>  	int i = 0;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -231,6 +237,9 @@ static size_t calc_mem_regions_size(struct xe_device *xe)
>  	u32 num_managers = 1;
>  	int i;
>  
> +	if (xe_device_is_admin_only_pf(xe))
> +		return 0;
> +
>  	for (i = XE_PL_VRAM0; i <= XE_PL_VRAM1; ++i)
>  		if (ttm_manager_type(&xe->ttm, i))
>  			num_managers++;
> @@ -248,7 +257,7 @@ static int query_mem_regions(struct xe_device *xe,
>  	struct ttm_resource_manager *man;
>  	int ret, i;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -309,13 +318,13 @@ static int query_mem_regions(struct xe_device *xe,
>  static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)

shouldn't we allow some basic query to pass ? like REV_AND_DEVICE_ID

and maybe we can also consider adding DRM_XE_QUERY_CONFIG_ADMIN_ONLY_PF
which would allow us to return engines/vram/topo details but as not-for-use?

don't know if that wouldn't break any backward compatibility rules...

>  {
>  	const u32 num_params = DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY + 1;
> -	size_t size =
> +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
>  		sizeof(struct drm_xe_query_config) + num_params * sizeof(u64);
>  	struct drm_xe_query_config __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_config *config;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -358,15 +367,15 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
>  	struct xe_gt *gt;
> -	size_t size = sizeof(struct drm_xe_query_gt_list) +
> -		xe->info.gt_count * sizeof(struct drm_xe_gt);
> +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> +		sizeof(struct drm_xe_query_gt_list) + xe->info.gt_count * sizeof(struct drm_xe_gt);
>  	struct drm_xe_query_gt_list __user *query_ptr =
>  		u64_to_user_ptr(query->data);
>  	struct drm_xe_query_gt_list *gt_list;
>  	int iter = 0;
>  	u8 id;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -436,7 +445,10 @@ static int query_hwconfig(struct xe_device *xe,
>  	void __user *query_ptr = u64_to_user_ptr(query->data);
>  	void *hwconfig;
>  
> -	if (query->size == 0) {
> +	if (xe_device_is_admin_only_pf(xe))
> +		size = 0;

do we have to restrict hwconfig too?

> +
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -464,6 +476,9 @@ static size_t calc_topo_query_size(struct xe_device *xe)
>  	size_t query_size = 0;
>  	int id;
>  
> +	if (xe_device_is_admin_only_pf(xe))
> +		return 0;
> +
>  	for_each_gt(gt, xe, id) {
>  		query_size += 3 * sizeof(struct drm_xe_query_topology_mask) +
>  			sizeof_field(struct xe_gt, fuse_topo.g_dss_mask) +
> @@ -505,7 +520,7 @@ static int query_gt_topology(struct xe_device *xe,
>  	struct xe_gt *gt;
>  	int id;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -559,11 +574,12 @@ static int
>  query_uc_fw_version(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
>  	struct drm_xe_query_uc_fw_version __user *query_ptr = u64_to_user_ptr(query->data);
> -	size_t size = sizeof(struct drm_xe_query_uc_fw_version);
> +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> +		sizeof(struct drm_xe_query_uc_fw_version);
>  	struct drm_xe_query_uc_fw_version resp;
>  	struct xe_uc_fw_version *version = NULL;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -634,6 +650,9 @@ static size_t calc_oa_unit_query_size(struct xe_device *xe)
>  	struct xe_gt *gt;
>  	int i, id;
>  
> +	if (xe_device_is_admin_only_pf(xe))
> +		return 0;
> +
>  	for_each_gt(gt, xe, id) {
>  		for (i = 0; i < gt->oa.num_oa_units; i++) {
>  			size += sizeof(struct drm_xe_oa_unit);
> @@ -659,7 +678,7 @@ static int query_oa_units(struct xe_device *xe,
>  	struct xe_gt *gt;
>  	u8 *pdu;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -711,11 +730,12 @@ static int query_oa_units(struct xe_device *xe,
>  static int query_pxp_status(struct xe_device *xe, struct drm_xe_device_query *query)
>  {
>  	struct drm_xe_query_pxp_status __user *query_ptr = u64_to_user_ptr(query->data);
> -	size_t size = sizeof(struct drm_xe_query_pxp_status);
> +	size_t size = xe_device_is_admin_only_pf(xe) ? 0 :
> +		sizeof(struct drm_xe_query_pxp_status);
>  	struct drm_xe_query_pxp_status resp = { 0 };
>  	int ret;
>  
> -	if (query->size == 0) {
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> @@ -751,7 +771,10 @@ static int query_eu_stall(struct xe_device *xe,
>  	array_size = xe_eu_stall_get_sampling_rates(&num_rates, &rates);
>  	size = sizeof(struct drm_xe_query_eu_stall) + array_size;
>  
> -	if (query->size == 0) {
> +	if (xe_device_is_admin_only_pf(xe))
> +		size = 0;
> +
> +	if (query->size == 0 || !size) {
>  		query->size = size;
>  		return 0;
>  	} else if (XE_IOCTL_DBG(xe, query->size != size)) {
> diff --git a/drivers/gpu/drm/xe/xe_sriov.h b/drivers/gpu/drm/xe/xe_sriov.h
> index 72e55543c30e..ee84978350aa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.h
> +++ b/drivers/gpu/drm/xe/xe_sriov.h
> @@ -37,6 +37,17 @@ static inline bool xe_device_is_sriov_vf(const struct xe_device *xe)
>  	return xe_device_sriov_mode(xe) == XE_SRIOV_MODE_VF;
>  }
>  
> +/**
> + * xe_device_is_admin_only_pf() - Check whether device is admin only PF or not.
> + * @xe: the &xe_device to check
> + *
> + * Return: true if the device is admin only PF, false otherwise.
> + */
> +static inline bool xe_device_is_admin_only_pf(const struct xe_device *xe)
> +{
> +	return xe_device_is_sriov_pf(xe) && xe->sriov.pf.admin_only;
> +}

we already have PF specific xe_sriov_pf_admin_only(xe) helper

but since admin-only concept has now a bigger impact, maybe such helper
should be defined in xe_device.c as:

bool xe_device_is_admin_only(const struct xe_device *xe)
{
	return xe->drm.driver == &admin_only_driver;
}

> +
>  #define IS_SRIOV_PF(xe) xe_device_is_sriov_pf(xe)
>  #define IS_SRIOV_VF(xe) xe_device_is_sriov_vf(xe)
>  

