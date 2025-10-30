Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22725CCF9FE
	for <intel-xe@archiver.kernel.org>; Thu, 30 Oct 2025 13:47:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBE810E980;
	Thu, 30 Oct 2025 13:47:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KxXI0NxP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3BA10E97C
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Oct 2025 13:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761832072; x=1793368072;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=VJ30On+GbmcK+0UXRiaZZ0+rmZpMFbnWx/GpgBWpKmQ=;
 b=KxXI0NxP6RwBithyvUXNhv6aatjuFjdbyz3iHwVnBV++lT9GpLlTHfbu
 etSNUhS4NBSLJjcdMz0B1pEhAy4Ba2V8K4Smj+FvruWukoMvZSnQeVqfA
 SG8mkZoB7nYyfBoyvJO+M4gX+m51AOK1ge7HeBOOF8gTX+dMHXDYXn5hV
 5yPuagF4zIXF2wzkTnLHd46c4p8FVsvb90DtrDepWe1sUMxKjVzDmzH2E
 T/aOWmMlHSgC4+dfW+1KuFGR97DlBWttDuh3ie1QCtOiloq3/A9vJ4i3d
 ocuZDuecNRchjT0YB9M3YUx5eDGjv4Xh1BX2cXd+2sw6Pf71NU41+kelg w==;
X-CSE-ConnectionGUID: gqPdCzsvQDuNahVSIfvtvw==
X-CSE-MsgGUID: nMvif2EnTLGarlCpe7Aaxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63672630"
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="63672630"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:47:51 -0700
X-CSE-ConnectionGUID: 6Q/2/Op8QSmv3Xa3FasxpQ==
X-CSE-MsgGUID: Fx8IqymdTMGZARsbqE6zrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,266,1754982000"; d="scan'208";a="191098475"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2025 06:47:52 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:47:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 30 Oct 2025 06:47:51 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.43) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 30 Oct 2025 06:47:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KVlKifG1wnn0/4xP4MUUesfUWku61tLq5M4OTn3hI8BBBwWqyQI32oQ5P+Nepd6IH4L4LIuwrqvM1JqkZEXeaB0ErF2lHvaWhvQQX6lmhrkIlJHLgtS7TsKmMGCKCfmjoL/V1YDWMJWjMVYHz/4lHGAa+3F2BySmEBPFqsQLZHS0xZMniAhtdJL+epr0LJH3pE5AORA5QQzdJrWO4u3WUE43pipugOmopt61Ya7K25LodsSTbehdkXv0zjfeuxukPxPqeQdiuNJGYn0dp/w2KdB4uAzLZ9/iLIlBPlTsYkIDRNSdKSDfxAIMuaGgxWsRyQpQa7tCiVob9dNWQPrWrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylgjJmhCat5EY5Kk+fV1e9Iu9UBpcIcCoOVXOXaOp0Y=;
 b=L28i/uVE24LLr0pE/+JwddN63GI51WnpxyIpS2uC+l5ddAtPKtlTXCnhSZE7EPpGJBVbyBBoFMlB+5PpFLjTuuhKbfkh+BVFiWm/vK3eQ3pNzxXlySWhuETUhKPZ4KWvS5/VNkvFGpsPjAkATx0w4Q6y8O8wA7xN4VPRElmUb4tfU4Jb/RJNtVM8gWt2QLfSPfh5KOSDA5kwfBQUimz+VV/CeFLBRThEu505dAtGIxcFpRcMe0w+4v9TSD+qlWU2ZtJkIQKc7mE+32AsqKiXf9bNt+25aLR9Zv96UTl/bPyqUmHZLfz21mlUvM25mnubqzvrrE4iMLvxFjfWh9Kuow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ5PPFC4905B1D0.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::855) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Thu, 30 Oct
 2025 13:47:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9275.011; Thu, 30 Oct 2025
 13:47:48 +0000
Date: Thu, 30 Oct 2025 08:47:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 12/17] drm/xe/pf: Allow bulk change all VFs priority
 using sysfs
Message-ID: <c7zygybfvvn3o7oyojmojhritp3axierzv222lbqtrygjnaw5u@lx65idzcij3e>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-13-michal.wajdeczko@intel.com>
 <vydnwitzonbyxgxdydh7cscvrz2eoep2m6tp6q4adr27xdqzsc@fv6uyjga2tzi>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <vydnwitzonbyxgxdydh7cscvrz2eoep2m6tp6q4adr27xdqzsc@fv6uyjga2tzi>
X-ClientProxiedBy: SJ0PR03CA0034.namprd03.prod.outlook.com
 (2603:10b6:a03:33e::9) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ5PPFC4905B1D0:EE_
X-MS-Office365-Filtering-Correlation-Id: a6100ec3-c885-4bc9-cf1a-08de17bae9a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWZnc1UzSStUVlVEdXFka2R2d3BUVVNXeVFxMEIveVphTCtkQXRlSk9JOFdx?=
 =?utf-8?B?TlBCQk9uUElSR0oxYkQyRU1oYm5rOFltRVNzd2QyR3ZQNnFZZ1lWSXhURnh0?=
 =?utf-8?B?WS9pbVdRaG9RRzNPQlRwY2NEVmYxcm5aN3E1TlU2Zmw1Qld5RkFBblRkNWNj?=
 =?utf-8?B?d2NlK05ZSHd3aGJCVTY4b3ltaXhnOGx6ZGR5UjMwSVdpR2tkUndneC96b3d1?=
 =?utf-8?B?dWtkVzFBRTdpa0NKM1ZSeXdxRTJ4RjNrUjFvRU9WK0xLNlJ5eU5lQWtnVmJx?=
 =?utf-8?B?Zi90M3lpUGFsSjloQWNwc1R1SjdnbFpNMXM1NlJwK1N4dG9PS0xwdXEyZ1JM?=
 =?utf-8?B?V1cramJJZ2ZjZUt4dzVFcmtmQ3lOaTVTZzlYQjhaNWRFM09uQzJFdnNNRTkx?=
 =?utf-8?B?OTRPNCsyTUNuaEt4N1NSamRXampJRVNUWERLMU90U25xcXU0aklsdjRQa2F1?=
 =?utf-8?B?enlaZ0tMdk1GcWhXSFc3bTdlMGZvKzZEWmc5amxLbUJpU05IWmg4bGV1ZXE4?=
 =?utf-8?B?LzlIQTV0REkrN2ZkWFR3aEs3ZC9hVVJINVIrdTFxZGlNSjQ1ODcySlNucCs1?=
 =?utf-8?B?c0sxK096NkhyZFpKR0NtQWR0cTJEeHhpdkNtTWlnSXBqa2t4K3NDSTBNZWFr?=
 =?utf-8?B?b1RFR0paTEg3QlBDeUkwMVZkdFZhNHVsaTN3bk51YTYzbmpiUXlvTzdhVGJ6?=
 =?utf-8?B?UTR2V2xLYzVQUGZmOTFvbCtNVXFsNjBDNEZuUjFTSDVLOGhtb3ZIZU5nOUx6?=
 =?utf-8?B?RFBPOGhCbWpXZndlWHpVVUE5QUlOTGZNQStyTkx2UnhNVDBHZzdDS0I5eEl4?=
 =?utf-8?B?WlhEeE9ZRlN4ckZjR0x6ek03bXRKMWIzY2VUcTJHUVhFY0FSKzR3eEI2T0Vr?=
 =?utf-8?B?SEFmSGFnWm1iYkp5aTlSaU1xaFMrNWg1ZkFzOXpzSnFIUUdGWllIY0hXampV?=
 =?utf-8?B?aVRlbGM1R1ZRZnBJU3ZsWVNNbWkvRW5penZaQ1dNQzFBbXYvbEFCNGZBQTN5?=
 =?utf-8?B?UFFWaEMrS0dKbnZGSEV5bkRmRmZZRWVWdkh1R0hheGRaWjlEbWV6WlRRMDJY?=
 =?utf-8?B?SVFLUkVOazNaNERES1JwR0xraVNPOUtKdzdCY3MwcWhoM0x6T2FxRVFiMHM0?=
 =?utf-8?B?UjZvRm1XMGFjWEZVOXlva1NjVjNBQ2hJZjRmQnZiVVl2d1ZoTnNZd2FoUzQ4?=
 =?utf-8?B?SUdDSlVwYjI0dGNsWFNrQzRxc0lQdWg2ME05WHRMTFhERUorK2Z2NkVIcnM1?=
 =?utf-8?B?eis0KzR5NW81emdqcU9vWFpmaXdTL3A5OHJiYUNXZmJOVEp2azk3b0RrcXFx?=
 =?utf-8?B?TGRSRHdJYS9YN2JpQklUNmdKNndWZEJPbVk3Q2FwT1BGREcxVk9oSzUyNnJj?=
 =?utf-8?B?d2VwRnhsNUl6bFN1ckpmRktNdDVmclpEdWJHb1NTZks4UUd0dTRPN0M2NTVE?=
 =?utf-8?B?bDFLM3NKZkdPQi9HQkZpR1dDYmNZbWVLVGkzTmc1ZGtjNWlqYmFuZnNraEQv?=
 =?utf-8?B?WFVNVlovWmpuOFA1MFUyNUpHZnN4YW5oNURNZmNGNUtpVU5Hay83SCsvNVl0?=
 =?utf-8?B?MEJXaDdDTmtVWlRrSnpVZHJsQ3FmZzZYZXkvNnhqSDR6eFdZYnFtS3hLdldh?=
 =?utf-8?B?RXdLN0lEOGFLc2dxcFhqb28wSllQcXUvN3dGeHJUMmFnUHlibmV3dithYVpB?=
 =?utf-8?B?TytSVnJiQmtub1pXa05NMTVtNkpseE44dUdyU2pkbTJDZGFsMndGOTBoQjVQ?=
 =?utf-8?B?ZWZIcVpqa0FVTWFXUU43ZGFjMG1XNlNqYzk5WFRmUjFxWm9tUGZwelpDN1hR?=
 =?utf-8?B?Um85OXJ6RnVpRU1NOG5Hby80Q05tR0NvdDFBNlFGd0tpNjlrQVpobWJTS21n?=
 =?utf-8?B?ZW9yVFVjTjllblBHWm8yS1VWSStRUEZWdlJ5a2hxQWZobXhja3hJV1h4MnJx?=
 =?utf-8?Q?hcXjjxqj7RkB0tY1duvSZNjhzfj/gNNc?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UGZxdE5iNGF4QjRoanJLV3FmNXo3N3Jick1aWnhhSno1VkgwWEQ1S1hOeWpE?=
 =?utf-8?B?ZnF3c0hOQlZ5cDRHdnBRSnNkWmZ2MHFnWkZLVGFzQ0M3MGovYkxlQ1JtL29C?=
 =?utf-8?B?OURNVkRjM3pCM2JoT0hwZytwNFJYeTlKTXNmMHVSZ05ack5ma1gxNnlWYTVL?=
 =?utf-8?B?c2IwWG1WWnVpdGRHMTNOTzR5ako0QVZMaTROZkI4Q3R4V3dUYVpwVURmNE41?=
 =?utf-8?B?bzF1WVhaR3JsUEYzQk1ZeGZhV1RMWmV4cFFoNXB1V2pzYWZ0S1NwcWlwNWF6?=
 =?utf-8?B?ekJ3TFZzSlNnK2g2Z0VnZEpWOTM5emFoaWhvRXZMTXBnd3l1amFxMVFIcVV5?=
 =?utf-8?B?emNzZi9LemhyMHpVSEZleUhMZDdmQ1VWemxjM3FrbjZ0bzVJL3g0MFc1K3Bq?=
 =?utf-8?B?NWxFWjhWTENYTVVmbXVybGQrVnh6MTJxYnlPSWFwbEtBN3VZdVorZEJJWDY0?=
 =?utf-8?B?WWZaeXhXVlRMMG12YXR1cGcxa2RoVjg4TlBxNFNGV0hPbzBaOWhyT0c0b0pP?=
 =?utf-8?B?Z0t2aWE4VVNmaXpET09LWHp4blUxa2FPdHdWUnlDTkw3MlA0dFlycVp0VUt4?=
 =?utf-8?B?MHFOSzQ1c0hndGw4N0cvSzUvNHVjK2JKWUcxU25NZjdCUGQxRitHQkQzTmhW?=
 =?utf-8?B?TlcyeXFHMVNXL1RnY1FYbXF4aTNHR0hnZWNCQldaMnpRSjFRZDh6QW5yK2pW?=
 =?utf-8?B?a1VUNXFRZFdkMnBqRmlTN0t0V2lvV1l5dzFDWWV6cmROUEdyc081V3Bvd01q?=
 =?utf-8?B?NVdDcHY0d3RYWUIyTk14ZEpibTU4WkNsb3cvamc4SFJQaGNLL3A5Zms0VC93?=
 =?utf-8?B?ckFOQTlINFZteE0rQldZZUxsWEJETWptWWVyS1RsOG5HSW1KRHZqaW8xZFBn?=
 =?utf-8?B?U1pZTWNIUFR1YzB2TW1sTXBEUEl4cFVLMUdYK3ZFVWlPUzFXeHFMR2VtLytX?=
 =?utf-8?B?RVpUUDMvZzFSTzJLVFVweDZOVlU4Y1F0YVo2SFhwYm9JOGE3Vnl2OFgwSS9T?=
 =?utf-8?B?R3pJK0NGRUNKcXJIY2VlL2psaEtidHJ6bVNaeDk2WlBzY3hZYXhEbUJveFcv?=
 =?utf-8?B?MFh3YmtqZFlVRVJCckd5RXBFZHNZblJqalRvcW5mdjdqaUp3SW4rSEVRVWM4?=
 =?utf-8?B?ZlQzUmtQcEM2cXlYNjE1ZXRVam9HQjhvbTFsb3RzRTZ4ckZpQjZjK2VGcEti?=
 =?utf-8?B?MUl0VkNyMG5qeXBMVHZKb3NvWnk1YndiQTYwdEUvcUhnWFZRa3BkS3YrRjcv?=
 =?utf-8?B?RlV4cWdNUDB0Rm1sZGJJL25hTkpEbHpXbnE1aFZNRk1WbnRqOGZTcGQ1Q1NI?=
 =?utf-8?B?NElyOFVDN2Y0RjhlNTdQWDNjMERWT004K3hXck1QcXdHYk9LbGtELzhRRllo?=
 =?utf-8?B?b1pnckJ3b1VzTkhGckxwR1V0bzlOdnFtZys3QTA5cnhnQUxsYU0rTmkrSTFT?=
 =?utf-8?B?UCt0SGJMYVFKaWVIYnRUbmxiR1NsaGNPTmtVREVWTmFWK3QvKzFuQ1pjQ21S?=
 =?utf-8?B?KzJhamdlUGE4WFRLb1FzOWhiQi9iS3BUVzJpQmZ3YU45NXVFSnpnSTJFQ1Zm?=
 =?utf-8?B?MVRVQWlLcDgvSTNqL0NORy9ISDVaNmV2V3YzTlFZT2xkYkRYYnpWU1lkaVdq?=
 =?utf-8?B?MFdhSnVuV1FwOU5WdFlNV3JtOUlaY2lQc1lmMU95VXB6bGhycEErYk9RVjhx?=
 =?utf-8?B?RmloZUhTZ1pTeEpXaHpZRWtJc0VPRWVWODdaRDluZlF0dHh1Tk5RQ015Zmth?=
 =?utf-8?B?Wk1yWVJOeGMxQldLdlFTQndQRXhoOGVNc0hWdzJQeU8xQko5OFBSL2RwR3JL?=
 =?utf-8?B?T2VlN01ZM2hHV0QzclJhVENrMVpNclFnb3JIU0JhYWhMM09HekNNNlJNT2Rz?=
 =?utf-8?B?Sm9wemtVdW5NdGYwb3JNQVVFdlhMZnFnZ1RBWkRMaE9FbFh6OGRzaU5pMmNk?=
 =?utf-8?B?VE5WUHVFaXFjWUhhTTJaRCs0UUhaR3NhL21mQW9QQXF2Tmd4YWFucmFQN2pa?=
 =?utf-8?B?Mit1anlkeFB0QXBxa3cvNkF3QWw2WWhDMjNuUkgvcHlqeEZzM01FempvSzBE?=
 =?utf-8?B?THYwRU11UjVDNS94VXE3TzBnM25tU1JsNkJmcy93eDRWT0k0OXdqK2NqU0RR?=
 =?utf-8?B?M0drc05xTXY3U0o3WE1pbU1nWEJJdTlUQUNJMjdDTWo0YjA4dk1DZWkzLy9w?=
 =?utf-8?B?d0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a6100ec3-c885-4bc9-cf1a-08de17bae9a2
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 13:47:48.5895 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tnvXQYVmP1UIbkW9y0+hLVfNCcEOjPNs3SKKzBxpoG12pqnTMegqRvSOihYcOFAS32bWszPXwh24pM/IAMsZgWlHFb/UXjTiGCaIe6tPiVU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC4905B1D0
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

On Thu, Oct 30, 2025 at 07:43:55AM -0500, Lucas De Marchi wrote:
>On Tue, Oct 28, 2025 at 06:58:26PM +0100, Michal Wajdeczko wrote:
>>It is expected to be a common practice to configure the same level
>>of scheduling priority across all VFs and PF (at least as starting
>>point). Due to current GuC FW limitations it is also the only way
>>to change VFs priority.
>>
>>Add write-only sysfs attribute that will apply required priority
>>level to all VFs and PF at once.
>>
>> /sys/bus/pci/drivers/xe/BDF/
>> ├── sriov_admin/
>>     ├── .bulk_profile
>>     │   └── sched_priority		[WO] low, normal
>>
>>Writing "low" to this write-only attribute will change PF and
>>VFs scheduling priority on all tiles/GTs to LOW (function will
>>be scheduled only if it has work submitted). Similarly, writing
>>"normal" will change functions priority to NORMAL (functions will
>>be scheduled irrespective of whether there is a work or not).
>
>the only place documenting what low and normal mean seems to be this
>commit message. We need it documented somewhere that is user visible.

oops, doc is in the last patch.


>
>>
>>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
