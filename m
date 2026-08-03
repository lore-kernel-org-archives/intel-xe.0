Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A66DC55175
	for <intel-xe@archiver.kernel.org>; Mon,  3 Aug 2026 08:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE3910E54B;
	Mon,  3 Aug 2026 08:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e6ZssaNt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5361A10E54B
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Aug 2026 08:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785747036; x=1817283036;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Wqx817rap2aNbIt9VGM0CYDhYENY31iUdxN3D4fTFFw=;
 b=e6ZssaNtfRf2wr/90Fa907F+VnZiFdAmDtV4QYaiM1uqat75xwteiL7V
 PBRCsPBghM8TjY9gztFFoH6zOuCmsbOxcuTLr8tLn6rDHg7rgauA6g1Ro
 tT08hHcM/emyGhsL6pGXnt2InnR0Dl9wJTxz/aGGKCdOUm1gF6oicNEMO
 HaqRd2RxFnfh/DkOhrRT6mcolnZjxXLGuA9ELMIvED5qI/hLrqidkr+dL
 GU2LIAm7VbXe8njN8Jki7aQcIJ9xtz5IfuvoBPJoXf9zgJOEHfC2gv0XO
 2U0+dduMBUM47DeGL4xPCNrTQHFA+dxjHdBCsL0kMAa+KeSLNSGAgbCXF w==;
X-CSE-ConnectionGUID: 3UtM/PzKT8CbJHjd/QBc/A==
X-CSE-MsgGUID: jGZZiSzoTjygXtdfompqVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11863"; a="86481089"
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="86481089"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:50:36 -0700
X-CSE-ConnectionGUID: 38J/Vap0S26X8fS2VX9cAg==
X-CSE-MsgGUID: NBfDDzHuSAaQ+NihFWjuXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,202,1779174000"; d="scan'208";a="291093258"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Aug 2026 01:50:36 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:50:35 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 3 Aug 2026 01:50:35 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.13) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 3 Aug 2026 01:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ErhiWF+13Og3Vc5VyHCi11swKzcXrGH/wV50MRdqL3x61b5xp4mfKmvDZuiOFXtKn8it4wE7Ptij9dgfEpEHDLtUMlmPf5goq/j/D1yP0WkJhP7/yPbzpTTMOMSgxE2xw44DLpwot685VDMFSceA0RXPjLEvRv//Us0zgOJ0NEFlX197fNwC/6ixtSLezgRoVD2PQLjlQb94UGV3CNDZviBSJnDbisDlZEqrZdkXQSAhF9aYXgoxpTMm5jS8u/zoAiH+HGS5GFsPWggQ55MAZCE1q+n63HfEOZQQTz8IcxEpglSR+4+PKC/nMp14SOSxUNza9ORMnwwKbQ/79qY6ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LuOH2Zf8w/M+uNimKYrUIjjxY1avJIv+ckeA6qtaiew=;
 b=dRVeJAUiuyvoN3oV9qFSzSldDdn36JKKQsW9gPB+1tBmGeDB749xVjPZx47Quu6weTEfnL3tLBW8xsNVwNGY/ouj8qrK1eNNFJoQ4W3PVu/IT+XEQRQqCKstMuo+90l+ALyEg/nfANT9WMQxTcstHY93VGnOX6LRl8W1p8YHcJZw2MVmMGHzcrZC7yqmnljWFK6Hivlg96JugvDD0AT97q/yAz/tlm/3PNNgFUlOTnDsFixQZpX7HE5itAsGxRt7heVsfoAAt9i/368uIffO/CIrMAyP41MReqVneWx2JYdG2EYrFipwn6k32vv5TbCeiWChtdKAJ+LcY1839ht5WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by DS0PR11MB6542.namprd11.prod.outlook.com (2603:10b6:8:d2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Mon, 3 Aug
 2026 08:50:32 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0270.016; Mon, 3 Aug 2026
 08:50:32 +0000
Message-ID: <2ad7ed46-ef9d-4b71-9e14-fba1b31a64e3@intel.com>
Date: Mon, 3 Aug 2026 14:20:25 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/23] drm/xe/log: Add SIGID log helpers for location
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-7-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0003.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::12) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|DS0PR11MB6542:EE_
X-MS-Office365-Filtering-Correlation-Id: 55b3ea2b-8c8e-41ac-f019-08def13c46f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: N1FFDG3yLhNScRAVAni3AwacH8USG2FeV/R0O+/etdFEwt/ZJBkxYWcp8/OBebt7Og7hFa5khi2ti007hZHilMQVaVFiuFgsMjNnPbDEnZDhIyVKFYglgF9/PDHzpLJMxK20YeFfdB1icTFrdGjUyFT1JET4F25T73SovO1UYc/xGiK229dMaOsCf+eV8qcMLYOgOuox6G81KSiXODLMTT7dSRg5elPA9aM07Ck+Nv08qstkOwdzFeuSGGEvGv9DlCre4fj0R8ua0dGvEyB1eX4JyYl0XY9tLMGQhvlNzyTgVvUPkIl9oPfjvazVjvxP2ZD5EJy7COF5vbyEZtcLXJ5jH2o0Up0KEzuLvA5MtdAE5Vi9wZnNp3OYNhrBkNGYJs81JXtpGfCm5ac9gG5K8ODqoLT63U5KJQOcZSPmchH6IhJgjfXmUAk8cacRhlQRMp79cmHIGPP++bE93oBhDPEDkCdboKOMh2ReUeEjAIGJVsNEhRVVuz+ZMpXjt4uNgy7GLQ6sSyx7gxOcZbCztGT9SIqe1rp9DLpjU29p3SXra4VEchycvnD8kR7IEzvJhIAeqALYb/YJCPK7stXhfwxfaFXttyKc/nO4RdG/RmgXfrbWIlj4fzw1clrnvng//1slLJwJUKInLXNgEijGhimQcRLecFG5v4l/pK5XpLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFo4ZWpNaFk0U2llVSsvYTQxUjBmL3I4Nm9GVlZ3SW9hQmFwQXlyaU5JWTI1?=
 =?utf-8?B?cmdPNDFaT0RzNTVJQXhzWXVjS2txc2lBUHdSWStTdE5TRHQ5R1VWYlROcW1G?=
 =?utf-8?B?dTQrR1dGQmJpZEE5ZVVabFdmL0owZmZ3YzdzcDZlZWd0Z29Xay9SSm5Ucmpr?=
 =?utf-8?B?YlVTL3RuV0ZaTlBJUzhWZ05nNVJXRFRXNGYreUgycnRrOVVwdzMwUlRnS3Ry?=
 =?utf-8?B?K00rdjBYZS9YNjBEOStwc3Y4bnovclhsRjZYRDlZZ2cveWtZOFF1eXFjdlFp?=
 =?utf-8?B?bFI3YmpLNkhXeWU2QzRPRjJnV3FaQ3YwNDh2SnhFVFpmMkZaT0VPMXV0Uzk5?=
 =?utf-8?B?aWhZWDBGZnBwalVXY0JGakYxSHcrMlp2T01aVjUrS0tLS3c3OE1NeWRqZlly?=
 =?utf-8?B?UENYNGtETzJFamN2Z0RaZ1BPay9EblU5THZ2emdQWTJQL2wzOWt3ak1TaEZz?=
 =?utf-8?B?MDYyMXN5cGd4cE4xS0RKS2pQdnZkN3g1aUtlQkl4L2o4NlVHeTdvbW5JL29r?=
 =?utf-8?B?eW5ZSTZjYklZY1ZhaDk2SWowYXpRU1FiOGRXN1VraDlCUjljdlZRRmphQWlV?=
 =?utf-8?B?Vktxdkh6L2Z6M1dudTZ1aHpUUHYzU09HdmR2cEp3Zm9YVVJjY2NWVXI1R3ZN?=
 =?utf-8?B?Y1RDRU01VkZYU2VMMGVuZWwxb085QjNMUTU0VDM4UytrL2xwTUYvS2w1NjZC?=
 =?utf-8?B?QWpIL285bGlOQnBqUG9IUllINVBiMkViV1hXUnF3Nmp4WnduSHRkSGFCTWpX?=
 =?utf-8?B?ampUZnVkVzFrYVdFNko4Uyt4Q2hmL0prMEp3T0VKNVhJN2tKVUlCb2VVbkZI?=
 =?utf-8?B?dW5PazBoWkU3bVRNWDRGanFHUDh3bXFaNUZ3M0FDVnFIZEdSVlFKMU1EenFQ?=
 =?utf-8?B?b3dRUTYvVk56SHc0SjduTFNhRndxUDFoSk5UV1NXdmY4Smhab25yQ1ZhVEZU?=
 =?utf-8?B?TVVVNnI4Qm1LRFlCak1KVEtyQ05KbUtvSzYzV1A2MXNpWDFzOHBUL2p6Q1dG?=
 =?utf-8?B?Z2htRFg1NkhGa3p5eDI4UWMvOEhBUkxpd2czUTFRRWREY1Zadkhaa2RvWVhE?=
 =?utf-8?B?RlRha1lISTQzTDZhaE5QQnpLYVFNV0M5UGVWRi9yWi9xMmM2Tk9GY3c0bkRv?=
 =?utf-8?B?ZGhxbWF5YklTWkQwbEhiM0tnMUwyU0FYV056VVAzRUszTW1kbzNrUWlqdHgv?=
 =?utf-8?B?ZUc5N3VDR2QxdVF5NDhaYVZ2S3FhcTRlOEhuTElLNWtFMDNGM0xuc1FIY0Yv?=
 =?utf-8?B?QkJralpjUSsxRjZIMWcwRllWUEVKWTVXZEw3TDlwdmdrK2NOWHVSS3VPRU1E?=
 =?utf-8?B?eHV3Sk0wK1IrQ2MxL1ByTzJBSkNZZ0VESUppQVhLN3ovV3VubHE4eVppM0Ji?=
 =?utf-8?B?dUdXWVAwUFZqeTg0dXpBRm9GQ0ljYytPUGJJMnVWbUJZR21oUW5XZnhlTklm?=
 =?utf-8?B?S0UyWjJBRUEwZGpLSThQQ0oxcXM0VFhBMERyU0xhdGxlTU1SU1ZQTWtVSjBt?=
 =?utf-8?B?bUxBN2hUbTdpM1M0VEhHQVdibWlNaFd4bmtnckVzNExhdms2SDlsYUhyNnhk?=
 =?utf-8?B?ejVUYlQ3YXFEMVZvL2NhTWQwa0xJWkliMjdJMGJPQTR2SHNPSFpzTkU0SlNM?=
 =?utf-8?B?b1l3UzNjWHA2THdhWGR3ZjBoU0djQk0vcWtDQkIrZGJaY3FmRFlRSE9weUpR?=
 =?utf-8?B?SmZJOXFRQ1ZzZmUzZnF5cHNPbEFDbkZYWHFwMEFEUWtYSVZUbm5YelhsQkhU?=
 =?utf-8?B?alNLZ1FNQm1NSjFqMExwdUJpSDlobzV4NkFZUXdSYmI1ajdTRVpycFpLWmFm?=
 =?utf-8?B?cGFCbXB6RVBHcTRFRTVQSG5NRVBlTlAvMkhCTkQ1THFFdFRlYi9RSFJDV2dM?=
 =?utf-8?B?cDZscHhZVGJLbmpMOFFxTFZ0MzhxZlhWckFnQkNWZWNEWUo2VU5UbUUyT0pk?=
 =?utf-8?B?cEtQNWEvSjA1NVpxcXFQRHc1dUs1UG5OVHFINzNGNS9TU0NwWllHcytKNzNF?=
 =?utf-8?B?dkcxRk5wSDFoUzlvRDdvaXBBOVJUdngwNloreWJsbkxuMnFwOEZEZ0ViK0ND?=
 =?utf-8?B?RnV2YjVtdFFrOHVIdTNqY3JEVGhvZzVuS1huendkSG1zaUZLT2VodXNhL01S?=
 =?utf-8?B?aGkvVDJUcFc5Z2UweXJiY3A2dzBlN05Eb0dkc1o4bi9RMWVNSzNsZ09yQ3hs?=
 =?utf-8?B?b3BmV21GYTBuaHRSN3JQMnpKUGRyQmxkZHV0WGFNZkhHNG9POFdOemVsT1Qr?=
 =?utf-8?B?L3oxZ0dlYnFqM2VaRDhmMmlpb2R1VVpOc050Vm5OV3pQNDR1Ni84dkdzMDc0?=
 =?utf-8?B?NzJzbzBMQjJmVkRoU2NUWkgvOEVGcE92Z1hLa2pzb291NGVtaTQ3YXMwRWhX?=
 =?utf-8?Q?3WvI4bMLLW00Rp6M=3D?=
X-Exchange-RoutingPolicyChecked: DClaLFkdF5T3rzh1xrReXSzMItbGLM4OFQT3dxtxoDOJYHpEF9JjvfpFaL6U+cuT0H9w1t7IcYvLOPxyiK3DTW+rBqaGhtjg2jeRAzIGWgwmTa2zjqOepIV0Co98Oa1tICK4LxciQv+slro20O4/ft8T40aFkUNlRcrnVlBnWicsvDxLHpOejpcM514bdZ+sbDQxxQfqwVDG8PbzEGEH6b1uCUfXuJkwi2q2U9u5yxQ1ShVfh/whFvDUynY/m4nt4XaQP4X55LFyYARldcBE1S2cxhvNiouMdrnuLWUC1smJXF5VG8j0ZptkHG+Jozz9RruxT9c6GOimPtvlH6PQ6g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 55b3ea2b-8c8e-41ac-f019-08def13c46f5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2026 08:50:32.5612 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gZweYZx453arVDI/f00ZAED7CJovElA4YU7002xMUL1ine6WIO4O+Ta9GW9XrOq6f+BRi5Xmcaker3McciQJ0J4Y63JN/pq6p7MNrpINlVc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6542
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


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> We can determine the location of the SIGID error source based on the
> type of the xe pointer being currently available. Add helper macros
> that will accept any of xe_device, xe_tile or xe_gt pointers instead
> of plain pci_dev to generate valid XE_LOG_LOCATION identifier and then
> call low-level xe_log_emit(pdev) function.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_log.h | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> index 73daf37d6463..510cedae6e14 100644
> --- a/drivers/gpu/drm/xe/xe_log.h
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -8,7 +8,9 @@
>   
>   #include <linux/cper.h>
>   
> +#include "abi/xe_log_abi.h"
>   #include "abi/xe_sigid_abi.h"
> +#include "xe_any.h"
>   
>   struct pci_dev;
>   
> @@ -33,4 +35,38 @@ void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
>   	xe_log_emit((pdev), CPER_SEV_INFORMATIONAL, (sig), (comp), (loc), \
>   		    (data), (len), fmt, ##args)
>   
> +#define xe_log_location_type(any)							\
> +	_Generic((any),									\
> +		 struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,				\
> +		 const struct xe_gt * : XE_LOG_LOCATION_TYPE_GT,			\
> +		 struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,				\
> +		 const struct xe_tile * : XE_LOG_LOCATION_TYPE_TILE,			\
> +		 struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,			\
> +		 const struct xe_device * : XE_LOG_LOCATION_TYPE_DEVICE,		\
> +		 struct pci_dev * : XE_LOG_LOCATION_TYPE_DEVICE,			\
> +		 struct device * : XE_LOG_LOCATION_TYPE_DEVICE)
> +
> +#define xe_log_location(any) \
> +	PREP_XE_LOG_LOCATION(xe_log_location_type(any), xe_any_id(any))
> +
> +/**
> + * xe_log_from() - Emit a structured SIGID log entry using @any pointer as location.
> + * @any: the &xe_device or &xe_tile or &xe_gt pointer this report relates to
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @args: arguments for the @fmt format string
> + *
> + * The location used to emit SIGID entry will be based on the @any pointer type.
> + * See xe_log_emit() for more details.
> + */
> +#define xe_log_from(any, cper_sev, sigid, component, data, len, fmt, args...) do {	\
> +	typeof(any) ___any = (any);							\
> +	xe_log_emit(xe_any_to_pdev(___any), (cper_sev), (sigid), (component),		\
> +		    xe_log_location(___any), (data), (len), fmt, ##args);		\
> +} while (0)
> +
>   #endif
