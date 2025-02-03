Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D186C02196
	for <intel-xe@archiver.kernel.org>; Mon,  3 Feb 2025 13:54:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27CA210E4E2;
	Mon,  3 Feb 2025 13:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FL2zaGPr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA31A10E4D8
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Feb 2025 13:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738590882; x=1770126882;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=Js6CHHRI9J5mqP2dW3HosoQWvSWK0F+smV/Vc8pb5R8=;
 b=FL2zaGPrNMikCiRTIwLTJm3H1Ns/9XfSRAbjIMGWa0dJY2AIV2k8aZi0
 5Sr1F9XqEJOX87KMUPLAbvo88oqeutVAHXI/TACa6h4dx76zjkF/Vvxpo
 CQMvSqJmzbCMRtWUd81erqCKjDMlMZEhaSpG7fbGD1JqoCxcVRcRsDK2B
 uG0Ll1KYbgaLVLTGAvAazFaFWJD0TEA2dql5k2uSQfgLHU6/vPQtPN6Od
 BW+vPqs3to3fI5vG+KMPYFC9zZWLN82b4tPSVeJOAnKtI21O3SJyTbxrl
 ifoQydH8V2FVNUUtY30VlRRloZdP5uqsRmSw+jFX6NeQEZgVAWB79lTHw g==;
X-CSE-ConnectionGUID: SomJjy6kSEOPg9d2lI3Vjw==
X-CSE-MsgGUID: +z+a1veHQhSG7yrfE4tSzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42740583"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="42740583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 05:54:42 -0800
X-CSE-ConnectionGUID: W0PjWke+S7i7i560++XTyQ==
X-CSE-MsgGUID: 0cLh3nO4QQ+CAtYQBBXvDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; d="scan'208";a="115293934"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 03 Feb 2025 05:54:41 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:40 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 3 Feb 2025 05:54:40 -0800
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 3 Feb 2025 05:54:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QCFT/rFoBAfIZmt+SZBVks7pgo7FnI3i3f/oog9eKy/EJ5DGDmkMV7HJZQmvgISXAa2Tz+kHhbmMMAjTsk9JCeXAe6017YgNDoS8wZmZDP78u/aaIdCwuFPoVvhy2Y+71EvlEe7gZsUVN+LgjQkMZbq0TBm6c6No4idCoKOLQTwNpkW1ahaar+3hZoUiBX0l+x0osFSckyzOWuIF3MjBFph97ZfH7YTldxnEVgAEUR7NTALX86RJYkNP755HMccpPKinoaph4WwDh7Zwr++W1EqjpBP+yncQ2UNDuNhDmOKiHZcFtTuDday/dFewS5OjGHMxEooVV0IDxSAtbIQweQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LXlej3TvoIrRLS9MRwzCfc5rJ3gcf8sMwRKzzWEq10Q=;
 b=rBE+I5vTuKR4Z8SMu246WAam3+18gGp9GRMImSe/y9HcttP34dHFtmqy80U4GDMXlb8HQX5HcKssPoLau3oNOQxT6+XA/a17yDqC2ddjDC4e1hMNacoR08qNGh18kEGPa5LfMo8aOc9QyO50Clj2gTT1sBCl/upWTZlHK8nPRhht+O7cCwYU85XS+etxb/ZNJFfDt9Gl72pXKsOf7WJ3fE0+xvBTq8zCNhLJlnbbqlS+XeOqloXcxpWzu31GGTxaBTck+SMbltlOD8HPpFRHDVO8tB+5ug8sffpfdAF8w4RsFb4IJ+iX9yjGHa1pCtqJSC9C5BwmXZKDA0YdshsnvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by DS0PR11MB6422.namprd11.prod.outlook.com (2603:10b6:8:c6::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Mon, 3 Feb
 2025 13:54:14 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%6]) with mapi id 15.20.8398.021; Mon, 3 Feb 2025
 13:54:14 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v2 1/2] drm/xe: Rename struct xe_mem_region to struct
 xe_vram_region
Date: Mon, 3 Feb 2025 14:53:58 +0100
Message-ID: <20250203135359.735832-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203135359.735832-1-piotr.piorkowski@intel.com>
References: <20250203135359.735832-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0502CA0032.eurprd05.prod.outlook.com
 (2603:10a6:803:1::45) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|DS0PR11MB6422:EE_
X-MS-Office365-Filtering-Correlation-Id: 01a6d0e9-6178-4009-0967-08dd445a3e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M011YkJ2T3dYU3UzNUFTRDBrWlRrR3ppbUVLM0dCTW9aWUNLYTloY1A2WEVj?=
 =?utf-8?B?aXh0MkdySG9jcDd1dm4zUVpqZVhaa0JLaWM4a0ZNZE9RMmlONG1SeWxpcHBN?=
 =?utf-8?B?YjNkWGhhUW9EbVloSzUvaG5pVUsxNkRxM25CdlV5eStaNlBqZ1ova1RZRnBV?=
 =?utf-8?B?NCs2NXZEODZIWXI5dXBxTVJkWEx0MlNTMmw3QUJiWldweFIyUXJ1WVl2UHor?=
 =?utf-8?B?ZEJOU3ZwWE1Cd3FYYlpsMlFFNllvM3dkTURnaGM0RzVHQUI0ZVhma3JvNkov?=
 =?utf-8?B?aThpbHhrcW1jWHphaWpvM2xQS056NDh1L216dTFTb0l4NjRDdmY1M256Qlpz?=
 =?utf-8?B?enkrLzZxUkprcVlvOWFkYlRKUzNmZnFMM0RZdFY0Ni96L2ZlNGVaRjZCNDVU?=
 =?utf-8?B?S0xmZ1RnWTd2Ung5YStIRGtWWXcrL0RFTSsyVUFoQnNQbVVxOHVlbkNGQmlv?=
 =?utf-8?B?MWxsZkF0cXJyRlVQcFgyQlMyRU9Ua1Q4RmhmUnNVQ0t5NHhhZmRPYzg4QVdq?=
 =?utf-8?B?U29QTzB6RHRvWmFoZ1VDd3IyMTdkQmF1TmNlTm9rRXZFWFRhT0xDZ2dVTXA3?=
 =?utf-8?B?M3lVTTRtTFduSkJCNDJldGpQM29palBHdHFJZFFjUDJMenFzWmkzS1VaSml3?=
 =?utf-8?B?MnRsaGE0MlA2d1VvTCtlOGdyL1BKcUdpaDN3NWF5V1lqbGVrdnhGREJWSFFU?=
 =?utf-8?B?d2tTdVVTK2pVVHAybFRISHFLMWdvc3NsL00zY2UzTXRlUUFRQzhNWGNqNkNQ?=
 =?utf-8?B?aExGUlgrN0NMRUJlWVFrb2RVM2xhR2c2ZWN5dklRV052Nm11QUVVbU9JVkty?=
 =?utf-8?B?N0R3VHYwb1FCSU40aFdUUEdjcWhTMXlodXBOcWVnSyt0MTVSR0hWZUlrbzUz?=
 =?utf-8?B?aEozZmk0Yi9BN2tFYVIxWEJGalJTb285SUpZZGx6TVcraXJ4aE9VRHEwcjhz?=
 =?utf-8?B?NTZKTmFzUXUrTFRPS0lFSi81djVXTnQ3S3Yxc0JNNmhmZFlLb0ptQ1p4YlBU?=
 =?utf-8?B?cUFCUGhWSytYQkZEQ2U4KytBRE1tQUg1L3pNMXhRTkRiMWNaUXBDYmQyK01E?=
 =?utf-8?B?VkdUWEMrdlNQMXBZUDJick40RGJ6T255dldsOC9SakFJV1VGZitnYklzYXZt?=
 =?utf-8?B?enNMYVg1b3pGU1dXRjVuTktUNjdEa2lBcUNPMFhFcW95b3puakU3eXVIaHB2?=
 =?utf-8?B?OFN6TXF4WWJibzF3MHdIWkJvcWhmdmphZXVHa1k1bVc5T2lsejFwS29paTlo?=
 =?utf-8?B?azFtdTY3d3dHUDRhekZJQlRDZHNQbzkxR25RWitoNVZ4WElQemtIdk1IUFRS?=
 =?utf-8?B?MWdlZTRRa2xmNmNya25oQjVqTDlpSnhaZFhaSGJoK2J4cXR4cVArSHk3ZEd1?=
 =?utf-8?B?SVlSSHZrRVpvUUd1eUpSS09OcCtqSW9mWDJlTkFkNnlnaEpNM3h2cUFVVDZH?=
 =?utf-8?B?YkNPMVhxOE9vUm0vT3BRS0MrRHIvV0EwaGJEZTJIb0ovR2w4N3RSYnZNTTl0?=
 =?utf-8?B?WmQyMDVWa0xtQW14M3loMk5OSjhxV25JRVlaU2RmbnV1SldaelArUWlCOGZs?=
 =?utf-8?B?YU4xV3R6NURHWFFGWDRBWGFHb1BDTitmaXhpays0SmlyUC9rbGZGcjEzUXpP?=
 =?utf-8?B?T2IwSWR4eW52RS9Wd2c1TnJiVzdEZWpiQ1dQa0F5V3VYclBYOEFOUHhjd2xI?=
 =?utf-8?B?SzBuNzAvQzVXZllMblZBVldkVUhwcDdTNTByOTZla3ZZd2Z6VmxTUEMzL3d6?=
 =?utf-8?B?SWYvU3pvcHdkQlFMcVhjLzFvaXIrVmR4bTdpK29uOFU4SnFuNnQ1ZHpCd0cx?=
 =?utf-8?B?QmM4anpDS0FxQlhyZWNDZWRPNjlRZGVpVzVlMW5UTUl3VndCdDh1REsxU2M4?=
 =?utf-8?Q?BKnWjWz97CPJ4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WG5Cc3dMUHlnNGNMeXVnbHo4VFVWSVhZTkNHWGhIOGNlTlNqQU52R1k4Tmp5?=
 =?utf-8?B?ZGYzVktZQUFtVFZ2L1RWenlOSno2STY4cDdjcGV3NGZraWUzZ3k2c3lrTU9U?=
 =?utf-8?B?V0ZXWTlSM1c0Q3hhU3hFODd1Ti93TWxWMEJtaUZxcnVjWlJFVWF4aWhkN00r?=
 =?utf-8?B?NUtxWGtRMElydkd6WGt2aUJNdnlmeS83anVqbGFZNlZleUlqbTdUd1ZnS05z?=
 =?utf-8?B?a1JZNU0vRnhJNnB6NWtaWGRPeWVqMUVnT0Y1RFRTbUpGYko3TDJZU2twNXZr?=
 =?utf-8?B?WjhwTDhPUEVLUUtrNm9ETjR6QVRyc205bzhrTHRGd0c5WDF6M2s1Z0RxUXV3?=
 =?utf-8?B?VWtFS21DMDV1NUdTNFJ2eksvcjFFMmZDL2NrUkp0a3hwQnA0WjRWT0lkaDhv?=
 =?utf-8?B?QUphUDVIS1kreXpNbHBEbERWNmhibUJTU2lzRzhncE90cSt5cE1VRVpuZzhX?=
 =?utf-8?B?WjJyOUxBRFZ6SlJwTWVtZVo3eVE4bjZGdDViOWpQTmU2WHBCdndSUGg4VHYx?=
 =?utf-8?B?cUYydzM1NEZUQ3NXcU1ZQ3pwK20weTV0cXdwM1RvVHNYSVZqMmVsd290QzJU?=
 =?utf-8?B?dXhTY3QrNkpPWkRBQ3kra1lwNUJXVThWei9oWWNCQlRObnBPM1VZMGs4S2NN?=
 =?utf-8?B?dStHVm4rTU5STGpsaDRWKzloenpyVFc2UDN6WGxsT1owVUc5emNOMmNEYWtv?=
 =?utf-8?B?cGNNc0xwT2p1R0N6OTduUFVvUnEyK25tNS9MdFY5RU5CWEduTElLQ3ZWZlhL?=
 =?utf-8?B?NEprRFI1enhLRVF4bkxwRnA1cHBjOFpNUysydGVkZkN3SWY3S1VvSS9qMHpR?=
 =?utf-8?B?VzFvcTc2cnRHVTc1bDI4SFlyNzdIcEIxYjdvYWtZL2xWWjluUnJNdDJzVHRP?=
 =?utf-8?B?VWNxV0VUVm9XQ3p2SWRWdHVFTGRjSGVNeVB1ZXRvMlNUYXRUSElLOEQxN3hv?=
 =?utf-8?B?dFIyanNvMGZ3UExreDN1UVBac3RZclVRK3JZay9wNDVwcno5Zms0dXczV3hU?=
 =?utf-8?B?cSt6U1VkNDEveTBUakNNRUduSlVocjh4Tm4yRzVuZzB2ZHArYk5wajBicjE2?=
 =?utf-8?B?bXE5OGNyczh4MXN1eGZyS0hhUUpZVGdiRENqOVRPT1hnaVNUVWpzUVA4UlBR?=
 =?utf-8?B?RzFqMndqVm94ZkxyMi91WGYrNlNxU1hDTzJkcXU0TGVWOEtJSTRmUllXdWRB?=
 =?utf-8?B?aWM1U2h6YlR6TzNZM1U2ckpmeS9CN1AvV3FPTW9NcDAxdFFwSHNINGNZSlpx?=
 =?utf-8?B?K0dya1kvT0tidjFpM3lOS3lkM240S241aXV2ZHUvczIvcFFFdjVEVE9PdmdI?=
 =?utf-8?B?eHpVUmM4QTM0UEZkSWpwcVkwdFhKSmNWRm5XKzRFY240Q2g0M2hMSWVrQUVm?=
 =?utf-8?B?R3dnc050T0NCMktmSmRYTGllNXV4OTU1d1p1WWMxb0Q3SkNSaWpxMWlINjFX?=
 =?utf-8?B?dFlWaW9obVJ2ejA1MUpnQUFXUlN2TXIwUTFJYlRqemlDcitoRFhLQVZ4Zm1j?=
 =?utf-8?B?eXNBMG02YXNseXNYRlpIZDZCZWRtbSs1aVhjUGxLUU8wVkVlNkNpYUZWN1pU?=
 =?utf-8?B?NkVCWU80cnovelE4ZHZZNWkzMzhDQUl0MGJ2NWRNV1BxdU5ITWpVZlBUcENs?=
 =?utf-8?B?UFlidEM1b2hidFhBWHcveGpxaGhVMERWSnAxTlpPekZlZjkzY3AwVDl5RFda?=
 =?utf-8?B?ZERRSGN2Q2U5Zlp0eHdSeDZtSjVOem5nTHJxTWhEK1hiVGxTMXg3VU1DNzR1?=
 =?utf-8?B?dXJqTlJycXIwOVhOVHB2VDNSeDBxbGN0REhXNjFkMVJxWjloL1V1T2xkbFRt?=
 =?utf-8?B?NFlNc09sVXJZSlBYRmtnamNGSzdib05CV2FoenhxVXBPMXoxMnpCUmVKb0U1?=
 =?utf-8?B?RUZDWUx3ZDNhejdncnZneGdEdGJjaU1laSt5OWk0cUFxNkNlNEkwYXlld3la?=
 =?utf-8?B?eHpCQ0xMbXZRMHhBbFpJSU92ZVFaVmRKS1RQOXYwT3o0Uy81VW1CZFBYMzBO?=
 =?utf-8?B?NmtvQlB3OWRqYnBNMFFNY0FyMUFUM1o0S3QxS1NPL3FsWGw5b2hXSERCRWk1?=
 =?utf-8?B?ZEk4eG1Yc01hbEJKdjlDSjYzbXNkRWRDeG56VmVod016WWFnUWFhYmFhQS95?=
 =?utf-8?B?eWdCVVFLNXhuNEVlZmRLUG12ekZMeFo2TnBSc293aGV3RXFxNU0xUTNjZEda?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01a6d0e9-6178-4009-0967-08dd445a3e6b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Feb 2025 13:54:14.2605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: av2ya+R0kqshCJTKywQ0SgebPI6tRFzxoB8VxdBp1lHmF6jwW+4fBYyI0JjxvL0Yopm1gmV1PTwQuhhlQshvFuO2ssBFkhN/T+MWFacuvMY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6422
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

The xe_mem_region structure has so far been used only in the context
of VRAM regions. Also, the description of its fields clearly indicates
that it was designed for VRAM regions. This struct is strictly related
only to VRAM.
So let's be clear on this point and rename it to xe_vram_region.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_bo.c                 | 12 ++++++------
 drivers/gpu/drm/xe/xe_device_types.h       |  8 ++++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c       |  2 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h |  4 ++--
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
index c32201123d44..095794200438 100644
--- a/drivers/gpu/drm/xe/xe_bo.c
+++ b/drivers/gpu/drm/xe/xe_bo.c
@@ -141,7 +141,7 @@ mem_type_to_migrate(struct xe_device *xe, u32 mem_type)
 	return tile->migrate;
 }
 
-static struct xe_mem_region *res_to_mem_region(struct ttm_resource *res)
+static struct xe_vram_region *res_to_mem_region(struct ttm_resource *res)
 {
 	struct xe_device *xe = ttm_to_xe_device(res->bo->bdev);
 	struct ttm_resource_manager *mgr;
@@ -177,7 +177,7 @@ static void add_vram(struct xe_device *xe, struct xe_bo *bo,
 		     struct ttm_place *places, u32 bo_flags, u32 mem_type, u32 *c)
 {
 	struct ttm_place place = { .mem_type = mem_type };
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	u64 io_size;
 
 	xe_assert(xe, *c < ARRAY_SIZE(bo->placements));
@@ -466,7 +466,7 @@ static int xe_ttm_io_mem_reserve(struct ttm_device *bdev,
 		return 0;
 	case XE_PL_VRAM0:
 	case XE_PL_VRAM1: {
-		struct xe_mem_region *vram = res_to_mem_region(mem);
+		struct xe_vram_region *vram = res_to_mem_region(mem);
 
 		if (!xe_ttm_resource_visible(mem))
 			return -EINVAL;
@@ -813,7 +813,7 @@ static int xe_bo_move(struct ttm_buffer_object *ttm_bo, bool evict,
 
 			/* Create a new VMAP once kernel BO back in VRAM */
 			if (!ret && resource_is_vram(new_mem)) {
-				struct xe_mem_region *vram = res_to_mem_region(new_mem);
+				struct xe_vram_region *vram = res_to_mem_region(new_mem);
 				void __iomem *new_addr = vram->mapping +
 					(new_mem->start << PAGE_SHIFT);
 
@@ -1023,7 +1023,7 @@ static unsigned long xe_ttm_io_mem_pfn(struct ttm_buffer_object *ttm_bo,
 {
 	struct xe_bo *bo = ttm_to_xe_bo(ttm_bo);
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 
 	if (ttm_bo->resource->mem_type == XE_PL_STOLEN)
 		return xe_ttm_stolen_io_offset(bo, page_offset << PAGE_SHIFT) >> PAGE_SHIFT;
@@ -1163,7 +1163,7 @@ static int xe_ttm_access_memory(struct ttm_buffer_object *ttm_bo,
 	struct xe_device *xe = ttm_to_xe_device(ttm_bo->bdev);
 	struct iosys_map vmap;
 	struct xe_res_cursor cursor;
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	int bytes_left = len;
 
 	xe_bo_assert_held(bo);
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 89f532b67bc4..c7c285c6a6c9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -69,11 +69,11 @@ struct xe_pat_ops;
 		 struct xe_tile * : (tile__)->xe)
 
 /**
- * struct xe_mem_region - memory region structure
+ * struct xe_vram_region - memory region structure
  * This is used to describe a memory region in xe
  * device, such as HBM memory or CXL extension memory.
  */
-struct xe_mem_region {
+struct xe_vram_region {
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -196,7 +196,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 
 		/** @mem.vram_mgr: VRAM TTM manager */
 		struct xe_ttm_vram_mgr *vram_mgr;
@@ -366,7 +366,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_mem_region vram;
+		struct xe_vram_region vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 	} mem;
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index f4a16e5fa770..a8c37fb4fec0 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_mem_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = &tile->mem.vram;
 
 	mgr->vram = vram;
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 2d75cf126289..4c52ced4ee44 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -9,7 +9,7 @@
 #include <drm/drm_buddy.h>
 #include <drm/ttm/ttm_device.h>
 
-struct xe_mem_region;
+struct xe_vram_region;
 
 /**
  * struct xe_ttm_vram_mgr - XE TTM VRAM manager
@@ -22,7 +22,7 @@ struct xe_ttm_vram_mgr {
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct drm_buddy mm;
 	/** @vram: ptr to details of associated VRAM region */
-	struct xe_mem_region *vram;
+	struct xe_vram_region *vram;
 	/** @visible_size: Proped size of the CPU visible portion */
 	u64 visible_size;
 	/** @visible_avail: CPU visible portion still unallocated */
-- 
2.34.1

