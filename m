Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DACF0C87FC9
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:48:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ED4910E6EE;
	Wed, 30 Jul 2025 21:48:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Puf7DSz2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586710E6EE
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753912089; x=1785448089;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=OQp4sGPh3GHWepWzdAcBAzqo3riC5uOIa2QJ1i8iMY4=;
 b=Puf7DSz2J7tHMN35a+25DOlgQ/jnzLSiU/Rb5HNoHN9wAtE/oFA2l4Jp
 Mv7oCA+cCveIOMO1gca0tJKudimuFoJflwoJnUwexLhLqyMJfej/d+d+t
 JUtYAYSSw+xmvb+yjLKK/vfiP7T/pgGgDomECFgeubRZJwC2c057eKLBw
 1U++rv7Jr+4wOAcJrVG/i/ahD/jb672HGGbcCZYezlbeH0e9a7lvueSCB
 c8qIqZnmod72Y+N5KrJgZkuVaut25zEsvQJ2/2Y9pkPUNEcZ5gsAB1KUY
 4H2tD77q6v7aQps2R1c4u3461nUSYw5e2qS83mtgUNXWiZsgabXfIMuDj A==;
X-CSE-ConnectionGUID: osY5A9g5QU6hbnZxvbtL+w==
X-CSE-MsgGUID: mKz1B7bwT8Cwu+bSc/YWhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="73685054"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="73685054"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:48:09 -0700
X-CSE-ConnectionGUID: 7uEfvBI8Q8aDYHAoHBTAEA==
X-CSE-MsgGUID: I7bsYRjDTRm9Z4p0P69jXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="167317166"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:48:09 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:48:08 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:48:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.58) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 30 Jul 2025 14:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMfAmJEglAgE5D9rc/A51YCSgGbV7UH8EfFou0aGDcOgJiOgQ/TZlmNgFxDdgSfuQg2REPmwbV+QRWniNJ+0aIB8CkUEpmbpUs9r1nsDwmbcFqFf2djoiG7KdP/Cbof+CywSmSWgXzWkUKFGRp+xpV3d91wl5DEK129+OixGEkMQBTPSTOHMRz1KAvchdRBTBxQWsRN4BaC4xjcBoRs1HbQ2WVwN5DTkdeUGiylbomDaVms+aDsmAU72E8a2BCY5u1uZpOG4CiqxNjUqS85bDU1c4fc2laFbSnYpDxuWmhlO4gpHZZ1AHrHElNtnLJJpNbBlCF+/sF3SbJFcjfWANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j6wpHTtdZ+lD5AnHL92s/rudypAuLfplMYafK/mulSc=;
 b=MyN50iSRRHaAyLoTRRV6U+OrCwvfF3V+vLkiNNAq0klECosmph4Tso9jutTg56larMvE8nWVn+8QVlmrNEXJIQv9xbz7Q8MNypOqQr6pLxyEpilB7g34SajS9EsB0qeK+rYQHBEfq7Wf4Hed/XnaS+1eZcJH4z2M1qzNb+H62G278Om+xHfOheHjWW39brXVuj6fGJBEznHU3V715AqSnjSWF2RlnAWYEfC7lkPakoOJ30NekjW9FJd54InXxW3aCx7ANTvtcn8xNH40IF/uw+1beQUkalkZCoC9qmc7I8Rer78kIeYnmidIFtLhMjUb2ipGxKdc43oHJK8WZb2ZRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SN7PR11MB6703.namprd11.prod.outlook.com (2603:10b6:806:268::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Wed, 30 Jul
 2025 21:48:06 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:48:05 +0000
Message-ID: <e2df3e6b-c377-4c91-b107-518ae7e0c3b6@intel.com>
Date: Wed, 30 Jul 2025 23:48:01 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-4-michal.wajdeczko@intel.com>
 <CH0PR11MB54447BED0BF0F6D4F435D43FE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <CH0PR11MB54447BED0BF0F6D4F435D43FE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0027.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::18) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SN7PR11MB6703:EE_
X-MS-Office365-Filtering-Correlation-Id: bec5469b-4303-41e4-3ce0-08ddcfb2c40d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VCsxS2RpMlBSaS9na0pFUnFMZkgwMFRVckFKcERMRXR2b0EwQjNlQWxLMXk1?=
 =?utf-8?B?MkFTWnBta3JDQ0RQR3ZmOHV5Mmh3MTBSK2ZpRFMrMFlXdnFwREk0RmVuK1lh?=
 =?utf-8?B?cGt3NkJaUU1EUEhnSnVGT3dTaUloN2NwbmFlYnpMYW1pWm9jT2FubWNINHBU?=
 =?utf-8?B?RDVaSVI2TXRUZy9UY2tBUWFmbFAyYi9qSWpWQWlzaDFGSHM4anR2ZmMzVHhJ?=
 =?utf-8?B?cEhNc3lKWGd5ZXViQ0xIcEl6QUJVVWg2Qzd1bGhmektCaVFRa0N0cW9CL2VQ?=
 =?utf-8?B?YWxwcG1lZDF0cEdlRFRoSzhvaEZPbmsrcE9MMU05dXR3V0lSOUpLRnFkYTFS?=
 =?utf-8?B?d29TNnlvdDY3RWxLSTRDZkRZWmVjVXlCWTFFSU5Ta2lHRURyQTUveUttTjc0?=
 =?utf-8?B?dElpODh5b1F2N0FleFdrMFBmYzZkZTRZVFhNeng2TGVnMzAzSG14aHdrQWtX?=
 =?utf-8?B?ZU1VLzF1NExBdXJkQ1BNdS9lcU44N2RCYWxGaHUwUkJWN3VDU1BXVjhVVERz?=
 =?utf-8?B?U1p0VEg1UjJmWllwN09zMUp5RDkzTzIvbGl1N2dLY3RvczE4OUVvbmE4MURK?=
 =?utf-8?B?TGt6OWowVDI3ancvaFgvZUUrYnV0OVdGaHZvNWtITmZiTDUvbGZJWHd1Vkp4?=
 =?utf-8?B?SDlqUzZaeTU4MTRVUFd1eVZyQVRFRkZyUERTSGpJZ21GejN5djIydmhpYyt2?=
 =?utf-8?B?a0lHQVJUOUJWRjJlTjBNSmpkVnhNbUtwR2FnNTdoTHpPbyt5blNodXF1SDJT?=
 =?utf-8?B?dXV3TWMxNUx2YW80WGxLbVQ5b1gzZUlxemdqc1hsb1pvTGN5Qk15c1ltd3Y4?=
 =?utf-8?B?dEpsMnE1OWJVclpRcVV5eTB3TCs0dEI0d2NFM1d5VldJaXR5ZldIYlFhbzBl?=
 =?utf-8?B?TUNzaC9Fb1pCZWNSL3BnbFoxVTJKTnp1WWtTTmY1c05iOE5PLzJJNlZCVnpj?=
 =?utf-8?B?S0sybFhQWFgrY2tNZXdCY3IwZWhWL3NLQW00L3QrZ2U2QVE5Qk5NN016aGZj?=
 =?utf-8?B?U1VYMEJxUzNRbXErSWlqOGE3Yy80ODFiek11YXJjUndESnNIa1JSczVRb0dz?=
 =?utf-8?B?aTlWOGV1a3pKcy9GWDdnQnYvNjdsamVPcjVvVnFpdXVnNG5aSkFhWEpDTXBJ?=
 =?utf-8?B?VFJSa2NsWWJ4SlhPUGcvczZPVU1YZDhFRXZMaVRKcWp0TDNXQVF6RXFrUW1O?=
 =?utf-8?B?cENIdU5kZHU5WDdtMW1GeTFSNUJQMXU1U1VFNXV4YmhpbmM3Wlc3dFNMREhK?=
 =?utf-8?B?L1ZIRW8xUSs3K2ZHZ0pGS2dCdWhXNXpSRGZkRlAyampjSUs1ZDRud2J2bzN6?=
 =?utf-8?B?QXVjOWxPckVGOW1CdFh6cDR1OFNJNVNMYWIvZjI0dldBOXJ1K3g4bGExbncy?=
 =?utf-8?B?dTRrN002Wk4xb2M3U2x0bnBaaTlrTXRLb0I1K3lzSTdJN0xzVDB1YzdJL29l?=
 =?utf-8?B?cmpVZ2pDYTFhc1Z1cS9nRlJ4MmNDUDhndEdFcHlJay9PRnRuY1RPZFgyU1Rn?=
 =?utf-8?B?cTNyeHJ2eDNHUHRFa3o3N2Ixd25hZnBXTEVKcWRRSjNDaDZ0TERpNTNvVk55?=
 =?utf-8?B?WTlNSU1CSXlOaEZtWXptTUxRMDBFMDN1ejU3ZlN4czNaT1NJM0JIcm1rdDNi?=
 =?utf-8?B?L3pKclpyUFNGT0VIeExqNTFWcnBEUmNJQ1RZYUhuT3JxUWJJdnlTa2Z6WGov?=
 =?utf-8?B?bnlES0JGT084eGwvUzRrb3ZpeDFUa0Q4R2twTDJXYW1lZVcvOXBFNDZaRzZV?=
 =?utf-8?B?bEVLUDNzTHdFQndwR0RXZ1pSaVhxQUNhaENqM2lnUnpHVnhNNnJLcXpGUlZ1?=
 =?utf-8?B?OXlkWFpadnRsbkZOUkxzTGh5Wm9CWW5RMldzbmZYa1B4bVF2N2ltL2VYUW44?=
 =?utf-8?B?V3RvWEViMEtOUmRGK3FTd3NLZTlRWTQwRmRRVnNmS1V5amQxUVo0WWFZcTJH?=
 =?utf-8?Q?mNC7LR6qtnU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YlhtT0l0VUhobXZ2ajdveHNMclhNL3JIcXNubWdpMGlubDhWSFM3cmJlbjIx?=
 =?utf-8?B?WEZseVJ3emdIR0wrS0R6ZTZNU0dUK0pYYi9wUjdJNmVDZms5L0FpcTVlMklQ?=
 =?utf-8?B?Q2hPMkxWbTc0dlZhcjhMUkJFb1k1c2o3dHVGeElNdHdIREQyRk94SXo5WWg0?=
 =?utf-8?B?ZGRSUnJJWTlMUDRsb3FLbC9QNTlDcFdQQkcxSHo4cHZBMStLT3FkL1E3b2VG?=
 =?utf-8?B?bTBNY3Jtbzg4a0I5YUxIUE1abWkwb3NobDEvNWFoeVd5UGxmOGVvSDk1VXBS?=
 =?utf-8?B?aDZVWE5DNnpkS2hONW4wOWNwTjdiQ0xxaldFbmVHT3ZaaloyVUZyL2EyRmla?=
 =?utf-8?B?TzdIaFozSEIvMmZ3dzBFSDlkbFgvMDZMRGVicnhTeVkzZUFRQ21xRll3UWYw?=
 =?utf-8?B?cjg5QS96Sko5RjYwQXc4MXlLbVV6cHBZV2o1VjJHeCsvY2NWYWpiTmVhVW9v?=
 =?utf-8?B?Q3V3NXJFTVQ2dENENXRLM1R4WVB4cVNOdkhqaitrOXVSLzR4V3g2dGYwazhx?=
 =?utf-8?B?cUJBZkJYTnBVb1hDU3VjYjJ1RjVzd3MyTzVuMU5kNktSVGFFWnB3enlmenBK?=
 =?utf-8?B?RG9YWkhoMUJObG9PeXNFdjRvMDJlbnhtbnNFUVRYNjh4WWdNcUppem5jeElu?=
 =?utf-8?B?aFVXa3NvQUJSQkd6QTJRSFhMNHpsQkhOUXJyVzVIaVZDTVFsTG0wUE90RzJB?=
 =?utf-8?B?cUpjcjRNNEQ0a040MEEwcC9oaFZIeGthZTNvR3ZtbWh0VWM4YlRHYXJnMWtT?=
 =?utf-8?B?NGI2aE9RYk5xakhYQ0xlUG00MklJNFpkbmhxRlZKby85YUg0NDVoM0RtUFk0?=
 =?utf-8?B?dTZJbThVdkNDRHVVKzJrcTJ3dE5vdkpoOHU2RVVIaURvUXR2MHBZQ09CQWZt?=
 =?utf-8?B?N0lwcTdEMDMvTmxvbWdHK0Y4VEo4QklpQWFCa1UxSCszWERFSWdsVjNZS09l?=
 =?utf-8?B?N1d6SU1qc1Y0cU44U25BWk54YlFJOHJsdG9xZUd0SGoyWVplR25GSENPdGQ3?=
 =?utf-8?B?aGwycmd5bGRGNURsLzFsaEJmQmUvZHZ6WnFHb2NCK1dWYk15WVE0RHIwRFdw?=
 =?utf-8?B?Tnc5d1hwNk9sZXdmQlRnS2xIWWtrbWJRTkpmaGZGeVBwc3NYcURxQmJCemFh?=
 =?utf-8?B?dFc1bVFiTkljRnUzS3pLdnFrWmtyOThvRkhodlVacnRMdnlma0JWcnRDa1JH?=
 =?utf-8?B?UTJIL0pXYVlSS2tZYk1nK2ZOYno2ZUVhcm9sY0FjZWpEYnpZQ0hwVS9OR2JQ?=
 =?utf-8?B?UndMMWhsS09tUjM4ajVrejEydnlvMTZoU3Z3QlA5ckROZWZWYURoc2hyUWxX?=
 =?utf-8?B?WWh6Y1U5dkI1WXpvcU9xWldLSmJWWTVjN082clBveE1sNU5qSWRTQ2daWUFZ?=
 =?utf-8?B?c0toR0x1RHFpV1RFVDgrN1BFTmQrR2cvR3A4ZTZUSWJGb1V3Nk9hd2d6b3pJ?=
 =?utf-8?B?M3dtZUNGYktQb2x6UEdhOC9sYzJtWk5PUVdqMGppa3J5S0JhK1Y2QUV3NjRS?=
 =?utf-8?B?bVVJTkhQZzJFOGhTb1BLaDgxVC9MczlwamY5ZXp4c0VxUDhvTGJKVTBuMmNG?=
 =?utf-8?B?UTlGOEtxSDFMRjVGNG15QlpSVnMxeS8wcFFoMkFnSCt4SjAvMXYxZytCT1VR?=
 =?utf-8?B?d0N3cjYrUHhCbWpFbGswTUk1bENuQnUybzE0LzJxT0QreWpiV296UFJ3a25y?=
 =?utf-8?B?WitlOEpIazRtSzlVOFBpcFNLL0U2S0VKV3RIUkw1TjBEY2xtMG1iTjUyMjhH?=
 =?utf-8?B?eGZYVDFDc2xiMWJyQmQ3QTRpekNCQ0lkRWk0Yzl1dkNNbGxHdm9VL2k0QXRK?=
 =?utf-8?B?WEVwbnhJUkNUZEZSOWJ0QWpRVlJPb3d4ZHBVaHRPWTZvbThZVS8zVHRYUXFp?=
 =?utf-8?B?MzVkRG42bEg0YmNzeDJ5blNxaGtiTG53enAvenNhM0ZmUzhlb25NdzR5MmI5?=
 =?utf-8?B?QkRZVHZTRTcwUG04Q29lelZpMEVHaG1yeERpY1huT0U1QUZpcWtleEIxV3pu?=
 =?utf-8?B?TUJLMUVoNTQ2OG5SellrWUZwWDlNMTk4RnB2QXMyOFdNKzBZNGtBVnBaRW0z?=
 =?utf-8?B?Y3d6VDJTM0x6TE91R1kvcTlTMVJLeXBKeTQzeWh1d3pnSyt0V3pQNzkvNlJN?=
 =?utf-8?B?NDJZOFJjaEFqcnZkQ29tdkxWOHdXemlhclByamdDTm83bFlWVE4ydmJ1N1Z2?=
 =?utf-8?B?VWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bec5469b-4303-41e4-3ce0-08ddcfb2c40d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 21:48:05.8679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cGQxS0WNCXFUTO69EEGq4deGZS+OzfHtWgL0UYGxMve7UCDUV9qjxKyU6R8MNrQ01YoSGCencwlcoEjhoHuPBhx06tILQY9enQyIqas1c9Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6703
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



On 7/30/2025 11:10 PM, Cavitt, Jonathan wrote:
> -----Original Message-----
> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Michal Wajdeczko
> Sent: Wednesday, July 30, 2025 10:49 AM
> To: intel-xe@lists.freedesktop.org
> Cc: Wajdeczko, Michal <Michal.Wajdeczko@intel.com>
> Subject: [PATCH 3/3] drm/xe/pf: Don't resume device from restart worker
>>
>> The PF's restart worker shouldn't attempt to resume the device on
>> its own, since its goal is to finish PF and VFs reprovisioning on
>> the recently reset GuC. Take extra RPM reference while scheduling
>> a work and release it from the worker or when we cancel a work.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_gt_sriov_pf.c | 23 +++++++++++++++++++----
>>  1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> index 8bc7d7f9f47a..0c9012fb625d 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf.c
>> @@ -53,7 +53,11 @@ static void pf_init_workers(struct xe_gt *gt)
>>  
>>  static void pf_fini_workers(struct xe_gt *gt)
>>  {
>> -	disable_work_sync(&gt->sriov.pf.workers.restart);
>> +	if (disable_work_sync(&gt->sriov.pf.workers.restart)) {
>> +		xe_gt_sriov_dbg_verbose(gt, "pending restart disabled!\n");
>> +		/* release a rpm reference taken on the worker behalf */
>> +		xe_pm_runtime_put(gt_to_xe(gt));
>> +	}
>>  }
>>  
>>  /**
>> @@ -205,8 +209,11 @@ static void pf_cancel_restart(struct xe_gt *gt)
>>  {
>>  	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>>  
>> -	if (cancel_work_sync(&gt->sriov.pf.workers.restart))
>> +	if (cancel_work_sync(&gt->sriov.pf.workers.restart)) {
>>  		xe_gt_sriov_dbg_verbose(gt, "pending restart canceled!\n");
>> +		/* release a rpm reference taken on the worker behalf */
>> +		xe_pm_runtime_put(gt_to_xe(gt));
>> +	}
>>  }
>>  
>>  /**
>> @@ -224,9 +231,12 @@ static void pf_restart(struct xe_gt *gt)
>>  {
>>  	struct xe_device *xe = gt_to_xe(gt);
>>  
>> -	xe_pm_runtime_get(xe);
>> +	xe_gt_assert(gt, !xe_pm_runtime_suspended(xe));
>> +
>>  	xe_gt_sriov_pf_config_restart(gt);
>>  	xe_gt_sriov_pf_control_restart(gt);
>> +
>> +	/* release a rpm reference taken on our behalf */
> 
> NIT:
> For consistency with the other two comments, maybe:
> s/our/the worker
> Or is the pm reference taken in this instance different from the pm reference
> taken in pf_cancel_restart and pf_fini_workers?

this is the worker context, hence 'our'

> 
> There're also some other minor grammar things ("s/a rpm/an rpm" and 
> "s/worker behalf/worker's behalf", for example) that can be applied more
> generally to the whole patch.
> 
> I'm not going to block on minor grammatical fixups, though, so:
> Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> -Jonathan Cavitt
> 
>>  	xe_pm_runtime_put(xe);
>>  
>>  	xe_gt_sriov_dbg(gt, "restart completed\n");
>> @@ -245,8 +255,13 @@ static void pf_queue_restart(struct xe_gt *gt)
>>  
>>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>>  
>> -	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart))
>> +	/* take a rpm reference on behalf of the worker */
>> +	xe_pm_runtime_get_noresume(xe);
>> +
>> +	if (!queue_work(xe->sriov.wq, &gt->sriov.pf.workers.restart)) {
>>  		xe_gt_sriov_dbg(gt, "restart already in queue!\n");
>> +		xe_pm_runtime_put(xe);
>> +	}
>>  }
>>  
>>  /**
>> -- 
>> 2.47.1
>>
>>

