Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D94AD65C77
	for <intel-xe@archiver.kernel.org>; Thu, 14 Nov 2024 11:17:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F3C10E7E8;
	Thu, 14 Nov 2024 11:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jkPK0rCp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 411BB10E7E8
 for <intel-xe@lists.freedesktop.org>; Thu, 14 Nov 2024 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731583073; x=1763119073;
 h=date:from:to:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TlfTNPJ5PhyvyjCRvPQjcniKLbePytuivBhIXSJHebQ=;
 b=jkPK0rCp/QviE6qRAwtQkxclBzhso8LuiApSKjsbIQHra0l9IYckDio6
 O1mNyZSwnki3JgUVySpH1pqO0pStMo0Mnsbn2MInYN2JxEj0pDzgMzJGi
 DSrRw4jgsDR12aCGQ3GgkqTGWjNOUzeSMgWx2X+YvUN+2/EP6Er5TfDKK
 0VMsHPQdpuz+dhHN8ysSze5oUEyTroIz0vHvyV0EFvAXbt2BWBOZ8nvsR
 0AwU/kUCU+PThF9x5H4MwgVb16h0o2SeSwKx+Xgx3k13uwihRWx0WQsjo
 fVTui93NIToTKRwSmn3/pN3wpU8ZwVf10rt3NzxdsbgwollFMmHTxIAxk A==;
X-CSE-ConnectionGUID: o0FuaIPbSROxTQxjGRiSlw==
X-CSE-MsgGUID: JPYxRwO5QVK/Pbt9GCh5TA==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="31409891"
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="31409891"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 03:17:40 -0800
X-CSE-ConnectionGUID: TlPBVPLQSNiP5r0GDjqIIQ==
X-CSE-MsgGUID: 3Lb5HzsiT2ayEASnX3pZUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,153,1728975600"; d="scan'208";a="118983826"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2024 03:17:40 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 14 Nov 2024 03:17:39 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 14 Nov 2024 03:17:39 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.46) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 14 Nov 2024 03:17:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i9MIdvIXsnMAt3IKYjE02Yqzqn3cOTmg1a4j9XBY5tCBeYR9JW8AKNOm8cb6No4sps5EPy8HahXjps3mhfgkbu431GzZTR/9RAz8Z8I+FvEhQpEzBpwSduzThH2ApzlD2fMMVKW5RFES46jFV5qCh7OeswLwp/m4WL/bZgdKQ4w3+ECi5rFTNE+qIUm9IFxGRLLPaq+Icg1PK2aY7FgJK1SZD+LfdPq7jKFKmEP3yleTJhiDe2JzZ5oIZ9MujXu6qyxvI/kypy1dhE4+/LhQD9X2fRTyoUuMpp+myf+Gr+AampHckTGpAqndyPtepE9eycwVK0qYSlYdweldavvcPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NHkBKdocHXI7Qa6jnLZJl+ViheDlK7QIVyshUawqAjM=;
 b=qMOePf7vqBokB4rQxz8t07jHeGsPJMWu0sUiLxLqjc3mxKuyS/L9iGC9PU/2YpQDuoRlrfGESbVHMvZUPhBy9/zHx+XO3qlj3pQOvkqwfmoTj6F4eK7aYuNwpvi8MjJDrfEv07n5o2S6WJzhijO0avd+lCErCYjht37zAszmrhxObMM1+/Mrx56zwv7ahDmKeQkPxa6Q+4y9UfcFMsZZ13iv5PmGsxwXGjQBAZ4iJ8djqkI08/m1Q/1ArQOvkPvF5xrNDF640G8LHt5uAM9foJXuirr1aN8Z3kLrry3TsgQbxDhG08CN4/KGkC6xziZKcvCDLdDViAW2gDIiPdqITA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7828.namprd11.prod.outlook.com (2603:10b6:930:78::8)
 by BL3PR11MB6338.namprd11.prod.outlook.com (2603:10b6:208:3b2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.29; Thu, 14 Nov
 2024 11:17:32 +0000
Received: from CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d]) by CY8PR11MB7828.namprd11.prod.outlook.com
 ([fe80::5461:fa8c:58b8:e10d%6]) with mapi id 15.20.8158.017; Thu, 14 Nov 2024
 11:17:32 +0000
Date: Thu, 14 Nov 2024 12:17:24 +0100
From: Francois Dugast <francois.dugast@intel.com>
To: <intel-xe@lists.freedesktop.org>
Subject: Re: =?utf-8?B?4pyXIENJLkZVTEw6IGZhaWx1cmUg?= =?utf-8?Q?fo?=
 =?utf-8?Q?r?= drm/xe: Allow fault injection in vm create and vm bind IOCTLs
Message-ID: <ZzXcRCDxl7E2sz9h@fdugast-desk>
References: <20241113162212.2154103-1-francois.dugast@intel.com>
 <173155980921.3944581.6182348055077101708@2413ebb6fbb6>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <173155980921.3944581.6182348055077101708@2413ebb6fbb6>
Organization: Intel Corporation
X-ClientProxiedBy: MI2P293CA0006.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:45::18) To CY8PR11MB7828.namprd11.prod.outlook.com
 (2603:10b6:930:78::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7828:EE_|BL3PR11MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: e9c9f790-744f-4a33-401a-08dd049deee6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TE9GMmJBemE4L2drYmNWOHJEaHBSNU9mcFFQT2NDVlR0ZUs4b2lEdytwY0lP?=
 =?utf-8?B?ODBmTkY1d3FWZ0Zua0dJU0lzQnd0ZUYrUER3NnFiRUs5NkNkcGJUcG0walJI?=
 =?utf-8?B?ZGRvcm5Id0JUS2hpNHczUWwrcDJRR25mdEt2K2RlU0RxempaWDBiYUxzQjBN?=
 =?utf-8?B?NytjOU5rYzRiTlNuZHNjVEJJMnJydk1OVzNTeTlCeitrTlNLOXJLdElQNFFm?=
 =?utf-8?B?VCtKbW5GMFpKUWVMbktyb0hxeE53M1U1MG9NbzJrZ3RCZWhpcERsckJlaXhz?=
 =?utf-8?B?SFdHdU9DN2duNmY1RGVrL1dHcjYxRVFybWFUWTd6UVlFb0F6S3FiSDN4SkNR?=
 =?utf-8?B?ODgzaXlKT3lMbERwYjNwQXFkaWJzUVZlTEJSb1JnTXRnU2FiMXpGZWlhZEcr?=
 =?utf-8?B?T01BSkU4Zk1RZ1d2a1M2a1RBekw4RkYxTHMxbUQ2bDI2OCtxenZmN1VvaGhE?=
 =?utf-8?B?YkRqMlFRbk10MlpJS0JkRkkxaGkyd09HR25OUzE0VFlNeWp0SW82RDVBM2dk?=
 =?utf-8?B?aE5ldi8ybnNrT2grZUU4bXZrcUdHc1V3ZnJPRUlzVTF5SGQzeVFpTGZvcVRn?=
 =?utf-8?B?dS9QQ1dia2lJSDc2SW92bnk3c3kzM2J2ZjRpbklVY1dvb1NFL0Q5MUVMMkZN?=
 =?utf-8?B?R3N5T2MzTGloM24yQ0tTTGxaS3lrZURySE1UOGt5L3I1ZVJFd1pLclprTzdj?=
 =?utf-8?B?dmRNdEU2aFQ2S1NmaEhDeTJaS29OTGJ1V1laSE9mQXBEVko4VzQwVWFXdjlx?=
 =?utf-8?B?TkhtWWE0dmg0QXZrWEhOK3o0d2U1a0RsclRxMFFsWDlhRmVnMEVjN0ptZDRR?=
 =?utf-8?B?eWZ0SnNYRi9XK3B3dWtMZHdJOHdPeU01ZkMwNVhWNUdWV2ZETkI1REEzYVFr?=
 =?utf-8?B?UHp0N2VnTXliRVRkajgxTlYyNFllc0E3ZmhYM3c0N3N3K09uY1owYXpFTlVs?=
 =?utf-8?B?UW92RFJ5bGdISExwb3hHL3hsbTgwT1F2Z0dVSE9jbnN5KzMrZWFDWWRtd081?=
 =?utf-8?B?U2pmRlB1Y1JWUjB6U3RHSnlCYUtmZUlnUW5NaFV2eDZQcmRTQ24yTDNOK0dY?=
 =?utf-8?B?dlFhdE95K3VFMWF5ai9HTFI1aWt6TGZIZFAxVWliVldWaGVWanV5MTVuQUgy?=
 =?utf-8?B?R2RMUGJncFhyQjlOd1JBRzFyVEEzV2RMTGszUHFOSlBZbzcrdUc4d0s3dmlP?=
 =?utf-8?B?NUliUmYwSGxsa1pDaWROcUdXVlZkek9VdjBhYXVuZHphMDNMWGV0YTNqdita?=
 =?utf-8?B?WWI3M3FLT216U1F6T3VYZGRtNGUrb0ExbE02UzVqSWtNbGtUY1c2MTFOdlVz?=
 =?utf-8?B?Wm9Gdlh1V0tpRHZ2dDVMNSt1V0hzZlRiSnpiY0lPS1NKbyt5VUY1aW9qNlBC?=
 =?utf-8?B?aW5sYlZ5UTdzbXhiaDhzNE9Ka282SXdBOGlwQ3dJUElTSFBwdkV6cENjUGVL?=
 =?utf-8?B?UkhJTVBaRHNqVzNJNHRreG5QWURINkxWRTZoUDRvT3kyT0M3cmUyZU9FR3BV?=
 =?utf-8?B?d0hsc05jeDJPajlzUWs5eUUzdjV4MlZEUFVRamo4MFhQdFhlejBuSy9pbzFE?=
 =?utf-8?B?dHRTaEhmSDBXZTd6ekx1d1d3NU9LOElmaU9FeHY3WGg5eHhDMnpLTHhrUHdJ?=
 =?utf-8?B?VGVzbEMySG9XcEZBYkFQTnNhWWxLMHVIYnJQNWZsWGQzdDlaRDNXNG1uSVBk?=
 =?utf-8?Q?jOPY9skT1f93J+0EjY26?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7828.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VWZCSk1pcnQ1b3UrYVg5SHU2MGgzd3YzREZHaXUyak9MZ244MGNWdFJRQ0hW?=
 =?utf-8?B?U2psU3h0SFZud3lsSm1rdHd1UHBDN09CckVpL2FOaHdqamxKTi90bC9Bb0Q3?=
 =?utf-8?B?VEFsUHpmeFRqUEJVU2lJNzA0dU5HR3ByUzBkaW41ME9sMm8wVWFMcVIwcDh0?=
 =?utf-8?B?VDloNkhJSWFsYjV2NEgxVVJuRTB4TmRVeWEyeDZGaWxMNjJ6TUhkZHR4LzNi?=
 =?utf-8?B?SkZuN01waEV3bjVIYm1JRXJVMWRQNU5XaGtHVVA3cnp1eVVSbnc2VFZJSjBW?=
 =?utf-8?B?cUM3NmlBSWhEbTEzL0UvaUdwbkx3a3E0UExIZjBWby9RU3IweEZ2eUM5K2hJ?=
 =?utf-8?B?TG9wRDZITmwxeEgwN0Rkemd2aFl2NGF5dHVTQVY5ZFBwemptdUpVVjNRZWFq?=
 =?utf-8?B?UXNDNStZSlRVSzYzU0x0eEdrRE5ZNmMzTUk4T1BJSDJjVlRBM25Pa01tZXdh?=
 =?utf-8?B?SUlaQUI4eUZSeVkxV05Wenowa3VFMzZYTDB6UHk5czljWjQzWVVHRnhOWWhv?=
 =?utf-8?B?OE93aUxOYWlqK0t3WHlvc05jMzdHRmxYRmdONjc0Q2ErQ1NDYjE3ZFdUaUla?=
 =?utf-8?B?RXBldlo2QytpYjBGemFIQ1JHbW4wSlJZVnVPUzMwaGljdFVLNllBbWNPNUpC?=
 =?utf-8?B?VGZUNDVSTzY0VUpkRUltWkhOSUZXQktCRU9kNEJnMHJSMkRjcUkzeWQrNlZk?=
 =?utf-8?B?ZXBmUjlualhBMWVXaFhhYkdZTnJSekRqWVZXczc1ZktQcE9BUHdFZldmOC9y?=
 =?utf-8?B?Um9hcHlWK1BQTVR4VFJndTdtczFFVWorYUxBSDRWNktBU2dRa1dsWG53aXNV?=
 =?utf-8?B?amNlMC9DV3BLdmczN1IvQ1hUdHRhWTlQSHNLNlpRTVRUaVVIRGVQSklRVzYr?=
 =?utf-8?B?TE1nbTNiOTRqaTJUam4zQXJTYnZKZUpTNGFoSjNxODdINnpZa1pObTBnb093?=
 =?utf-8?B?SmdhdVJwTmozSm1Gd0lzZEZOZTNaRmlaTEh5bVNrVitGNGxXazlpZlVydGxz?=
 =?utf-8?B?MmVSS0d1SVQ2RkYwN2dhTjNhQ2xyZ1JDeUJuM1gvcW84bVBJV1RxYlFYYTVL?=
 =?utf-8?B?QlkyemFtd0R2RTh4SWw5SkMvVXNJYmtpMk44eTNCbTgyYkFiY1dKNDIvcm9H?=
 =?utf-8?B?MUc1UmdBSzljd080cHQ2bFpiaUJQcE1nL3B0UEVvL0FMUEhkNlMycEExU3BY?=
 =?utf-8?B?bFhaNG1sN1gxRUxBZi80UkQ0RGNUV3pBLzNKQ3kybTF5MEhvRW5xMkFIZWdH?=
 =?utf-8?B?RlAyNlBHVFlIWFgzbEZjYVZUem9iTzFJL0krbW1ReHhLRlRFUGxDeitGMW5D?=
 =?utf-8?B?dndoZE03TDIrSlJmMVcvNFlWOEdULzJCV3c0K0hyaDNmSTFRdXVvZEZvN2Vq?=
 =?utf-8?B?NTFXcUJtYUliSnIwV281OTJjU255bUl4NjBCTUZCNG1RdVRpYmkwSlFHWWhY?=
 =?utf-8?B?RkJvYTBPQm9PT0M2aTJFRmhVY2lTdFdvVnB4SnFiMVhWS2lndVVWRlRBMExS?=
 =?utf-8?B?QnJrY0pUOXBjOWltMGZyQ2pZSFhkRGNHdnhSYjIyaCtMWFlXSHBBaC8yVEJs?=
 =?utf-8?B?cHdBVmdhcWxBcFk5SG91Wms0RDFXVVczVTU2eHBFRVVNK3RDemE0Zm56VE5Y?=
 =?utf-8?B?akpSMUc4REVQOVQ0Q1RKNThBSWpqTVQ4RllVcTdCVnI3MFdUOVdIQkpwYTNL?=
 =?utf-8?B?RFFqRTV4bnhuMFdlNHJVUTZFSzdpQlJNY3IyNDlnSk1PVkhTamkxbFZYUGNl?=
 =?utf-8?B?VUFDY2Y0YXBvREVYNDdRb1ZpUDM2VzA2TlJkZ2lyemJtcmNPSzZYd1hndzZU?=
 =?utf-8?B?YmJiT3k4UUxLNVhEL1E2bmlsYkdISGJTNWNiV0NEcHhhanc5c3JFa0FoSDRo?=
 =?utf-8?B?ZEV3MXRaNjZJK043OE11NDU5SnNCczNMS2QzMnB0REVSejNkYjNBcWltb3Iz?=
 =?utf-8?B?ZlJFUERUeEFMUGNaZEh1MlB6WEdjMUNwMy80VnRqQVp4Mm1tYS9OYm1tUnli?=
 =?utf-8?B?NGk1K1hyVWo5K3g3S1pjNkduSmtNSnlMVk1vWm5FY3FEWkxKakhnejNhWUgv?=
 =?utf-8?B?SXArUFZBK3ZNYmt6ZHdZWkd5RWkwQWtGMWYxQWg4ckg3anZJa3ZZYkQ0Q1FU?=
 =?utf-8?B?aEVsTnRST0JCbEdUNDZpMVRUaXdxV21mWVd6S0tnU3Q2ZWVWeXh4WXd2QXcy?=
 =?utf-8?B?eXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9c9f790-744f-4a33-401a-08dd049deee6
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7828.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2024 11:17:32.7355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f8+DoBhqhGyPYNR9jsRKR0aywexbzTKqDcehRSp/KPjc7yMoVsLm8ir9eOuJa6xFZY0bAH1YRky7RonZqSmz6orFScr1ezgidxsNT/3Vtcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6338
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

On Thu, Nov 14, 2024 at 04:50:09AM +0000, Patchwork wrote:
> Patch Details
> 
> Series:  drm/xe: Allow fault injection in vm create and vm bind IOCTLs
> URL:     [1]https://patchwork.freedesktop.org/series/141307/
> State:   failure
> Details: [2]https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/index.html
> 
> CI Bug Log - changes from xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full
> -> xe-pw-141307v1_full
> 
> Summary
> 
> FAILURE
> 
> Serious unknown changes coming with xe-pw-141307v1_full absolutely need to be
> verified manually.
> 
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-141307v1_full, please notify your bug team
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives in CI.
> 
> Participating hosts (4 -> 4)
> 
> No changes in participating hosts
> 
> Possible new issues
> 
> Here are the unknown changes that may have been introduced in
> xe-pw-141307v1_full:
> 
> IGT changes
> 
> Possible regressions
> 
>   • igt@core_setmaster@master-drop-set-shared-fd:
> 
>       □ shard-dg2-set2: [3]PASS -> [4]SKIP +2 other tests skip
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6:
> 
>       □ shard-dg2-set2: [5]PASS -> [6]DMESG-WARN
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
> 
>       □ shard-dg2-set2: NOTRUN -> [7]FAIL +1 other test fail
>   • {igt@xe_fault_injection@inject-fault-probe@function-vm_bind_ioctl_ops_create}
>     (NEW):
> 
>       □ shard-adlp: NOTRUN -> [8]FAIL +7 other tests fail
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_pm_init_early:
> 
>       □ shard-adlp: [9]PASS -> [10]FAIL +4 other tests fail
>       □ shard-bmg: [11]PASS -> [12]FAIL +5 other tests fail
>   • {igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_prepare}
>     (NEW):
> 
>       □ shard-bmg: NOTRUN -> [13]FAIL +8 other tests fail
>   • {igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_run}
>     (NEW):
> 
>       □ shard-lnl: NOTRUN -> [14]FAIL +7 other tests fail
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_wa_init:
> 
>       □ shard-lnl: [15]PASS -> [16]FAIL +6 other tests fail
>   • igt@xe_oa@invalid-oa-exponent:
> 
>       □ shard-lnl: NOTRUN -> [17]DMESG-WARN
> 

Failures in xe_fault_injection are expected and addressed in [1], other
failures seem unrelated to this change.

[1] https://patchwork.freedesktop.org/series/139777/#rev3

Francois

> Warnings
> 
>   • igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
> 
>       □ shard-dg2-set2: [18]SKIP ([19]Intel XE#455 / [20]Intel XE#787) -> [21]
>         SKIP +1 other test skip
>   • igt@kms_pm_dc@dc5-retention-flops:
> 
>       □ shard-dg2-set2: [22]SKIP ([23]Intel XE#3309) -> [24]SKIP
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init:
> 
>       □ shard-adlp: [25]DMESG-WARN ([26]Intel XE#3343) -> [27]FAIL +6 other
>         tests fail
>       □ shard-bmg: [28]DMESG-WARN ([29]Intel XE#3343) -> [30]FAIL +6 other
>         tests fail
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init:
> 
>       □ shard-lnl: [31]DMESG-WARN ([32]Intel XE#3343) -> [33]FAIL +6 other
>         tests fail
> 
> Suppressed
> 
> The following results come from untrusted machines, tests, or statuses.
> They do not affect the overall result.
> 
>   • {igt@xe_eudebug@exec-queue-placements}:
>       □ shard-adlp: NOTRUN -> [34]SKIP
>       □ shard-bmg: NOTRUN -> [35]SKIP
>       □ shard-dg2-set2: NOTRUN -> [36]SKIP
>       □ shard-lnl: NOTRUN -> [37]SKIP
> 
> New tests
> 
> New tests have been introduced between
> xe-2221-169c7cd31a373ed31054abb423981856eb5fb119_full and xe-pw-141307v1_full:
> 
> New IGT tests (15)
> 
>   • igt@xe_exec_queue_property@priority-set-property:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.01, 0.04] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.01, 0.05] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@bcs:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.00, 0.01] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@ccs:
> 
>       □ Statuses : 3 pass(s)
>       □ Exec time: [0.00, 0.01] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@rcs:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.00, 0.01] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vcs:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.00, 0.01] s
>   • igt@xe_exec_queue_property@timeslice_duration_us-property-min-max@vecs:
> 
>       □ Statuses : 4 pass(s)
>       □ Exec time: [0.00, 0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-vm_bind_ioctl_ops_create:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-vm_bind_ioctl_ops_execute:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_exec_queue_create_bind:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.80, 4.97] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_pt_create:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_prepare:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_run:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_vm_create_scratch:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01] s
>   • igt@xe_fault_injection@inject-fault-probe@function-xe_vma_ops_alloc:
> 
>       □ Statuses : 3 fail(s)
>       □ Exec time: [0.01, 0.27] s
> 
> Known issues
> 
> Here are the changes found in xe-pw-141307v1_full that come from known issues:
> 
> IGT changes
> 
> Issues hit
> 
>   • igt@core_getstats:
> 
>       □ shard-dg2-set2: [38]PASS -> [39]SKIP ([40]Intel XE#2423)
>   • igt@core_hotunplug@unbind-rebind:
> 
>       □ shard-dg2-set2: NOTRUN -> [41]SKIP ([42]Intel XE#1885)
>   • igt@fbdev@info:
> 
>       □ shard-dg2-set2: [43]PASS -> [44]SKIP ([45]Intel XE#2134) +1 other test
>         skip
>   • igt@kms_async_flips@async-flip-with-page-flip-events:
> 
>       □ shard-adlp: [46]PASS -> [47]DMESG-WARN ([48]Intel XE#3194) +3 other
>         tests dmesg-warn
>   • igt@kms_atomic_transition@modeset-transition-nonblocking:
> 
>       □ shard-lnl: [49]PASS -> [50]FAIL ([51]Intel XE#1701) +1 other test fail
>   • igt@kms_big_fb@4-tiled-64bpp-rotate-90:
> 
>       □ shard-bmg: NOTRUN -> [52]SKIP ([53]Intel XE#2327)
>   • igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       □ shard-lnl: NOTRUN -> [54]SKIP ([55]Intel XE#1407)
>   • igt@kms_big_fb@x-tiled-8bpp-rotate-180:
> 
>       □ shard-dg2-set2: [56]PASS -> [57]SKIP ([58]Intel XE#2136 / [59]Intel XE#
>         2351) +8 other tests skip
>       □ shard-lnl: [60]PASS -> [61]FAIL ([62]Intel XE#1874)
>   • igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
> 
>       □ shard-bmg: NOTRUN -> [63]SKIP ([64]Intel XE#1124) +4 other tests skip
>   • igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
> 
>       □ shard-lnl: NOTRUN -> [65]SKIP ([66]Intel XE#1124) +1 other test skip
>   • igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       □ shard-dg2-set2: NOTRUN -> [67]SKIP ([68]Intel XE#1124) +5 other tests
>         skip
>   • igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
> 
>       □ shard-adlp: NOTRUN -> [69]SKIP ([70]Intel XE#2191)
>   • igt@kms_bw@linear-tiling-3-displays-3840x2160p:
> 
>       □ shard-lnl: NOTRUN -> [71]SKIP ([72]Intel XE#367)
>   • igt@kms_bw@linear-tiling-4-displays-1920x1080p:
> 
>       □ shard-bmg: NOTRUN -> [73]SKIP ([74]Intel XE#367)
>   • igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [75]SKIP ([76]Intel XE#455 / [77]Intel XE#787
>         ) +40 other tests skip
>   • igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs:
> 
>       □ shard-adlp: NOTRUN -> [78]SKIP ([79]Intel XE#455 / [80]Intel XE#787) +5
>         other tests skip
>   • igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1:
> 
>       □ shard-adlp: NOTRUN -> [81]SKIP ([82]Intel XE#787) +8 other tests skip
>   • igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
> 
>       □ shard-dg2-set2: NOTRUN -> [83]SKIP ([84]Intel XE#2907) +2 other tests
>         skip
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
> 
>       □ shard-lnl: NOTRUN -> [85]SKIP ([86]Intel XE#2887) +2 other tests skip
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
> 
>       □ shard-bmg: NOTRUN -> [87]SKIP ([88]Intel XE#2887) +4 other tests skip
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
> 
>       □ shard-dg2-set2: NOTRUN -> [89]SKIP ([90]Intel XE#787) +197 other tests
>         skip
>   • igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
> 
>       □ shard-adlp: NOTRUN -> [91]SKIP ([92]Intel XE#2907)
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
> 
>       □ shard-dg2-set2: [93]PASS -> [94]INCOMPLETE ([95]Intel XE#1195 / [96]
>         Intel XE#1727)
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [97]INCOMPLETE ([98]Intel XE#1195)
>   • igt@kms_chamelium_color@ctm-green-to-red:
> 
>       □ shard-lnl: NOTRUN -> [99]SKIP ([100]Intel XE#306)
>   • igt@kms_chamelium_color@ctm-max:
> 
>       □ shard-adlp: NOTRUN -> [101]SKIP ([102]Intel XE#306)
>   • igt@kms_chamelium_edid@hdmi-edid-read:
> 
>       □ shard-dg2-set2: NOTRUN -> [103]SKIP ([104]Intel XE#373) +1 other test
>         skip
>   • igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k:
> 
>       □ shard-lnl: NOTRUN -> [105]SKIP ([106]Intel XE#373)
>   • igt@kms_chamelium_frames@vga-frame-dump:
> 
>       □ shard-adlp: NOTRUN -> [107]SKIP ([108]Intel XE#373)
>       □ shard-bmg: NOTRUN -> [109]SKIP ([110]Intel XE#2252) +2 other tests skip
>   • igt@kms_content_protection@srm@pipe-a-dp-4:
> 
>       □ shard-dg2-set2: NOTRUN -> [111]FAIL ([112]Intel XE#1178) +2 other tests
>         fail
>   • igt@kms_cursor_crc@cursor-onscreen-max-size:
> 
>       □ shard-bmg: NOTRUN -> [113]SKIP ([114]Intel XE#2320)
>   • igt@kms_cursor_crc@cursor-sliding-32x10:
> 
>       □ shard-lnl: NOTRUN -> [115]SKIP ([116]Intel XE#1424) +1 other test skip
>   • igt@kms_cursor_edge_walk@64x64-left-edge:
> 
>       □ shard-adlp: [117]PASS -> [118]DMESG-WARN ([119]Intel XE#3086)
>   • igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
> 
>       □ shard-lnl: NOTRUN -> [120]SKIP ([121]Intel XE#309) +1 other test skip
>   • igt@kms_display_modes@mst-extended-mode-negative:
> 
>       □ shard-lnl: NOTRUN -> [122]SKIP ([123]Intel XE#307)
>   • igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5:
> 
>       □ shard-dg2-set2: NOTRUN -> [124]FAIL ([125]Intel XE#3422) +3 other tests
>         fail
>   • igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5:
> 
>       □ shard-dg2-set2: NOTRUN -> [126]FAIL ([127]Intel XE#3403)
>   • igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       □ shard-lnl: NOTRUN -> [128]SKIP ([129]Intel XE#1421)
>   • igt@kms_flip@busy-flip:
> 
>       □ shard-dg2-set2: [130]PASS -> [131]SKIP ([132]Intel XE#2423 / [133]i915#
>         2575) +112 other tests skip
>   • igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
> 
>       □ shard-lnl: [134]PASS -> [135]FAIL ([136]Intel XE#886) +3 other tests
>         fail
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       □ shard-bmg: NOTRUN -> [137]FAIL ([138]Intel XE#2882)
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
> 
>       □ shard-dg2-set2: NOTRUN -> [139]FAIL ([140]Intel XE#301) +13 other tests
>         fail
>   • igt@kms_flip@flip-vs-expired-vblank@a-dp2:
> 
>       □ shard-bmg: [141]PASS -> [142]FAIL ([143]Intel XE#2882)
>   • igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
> 
>       □ shard-lnl: NOTRUN -> [144]SKIP ([145]Intel XE#1401 / [146]Intel XE#1745
>         )
>   • igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
> 
>       □ shard-lnl: NOTRUN -> [147]SKIP ([148]Intel XE#1401)
>   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode:
> 
>       □ shard-bmg: NOTRUN -> [149]SKIP ([150]Intel XE#2293) +1 other test skip
>   • igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
> 
>       □ shard-dg2-set2: NOTRUN -> [151]SKIP ([152]Intel XE#455) +9 other tests
>         skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
> 
>       □ shard-lnl: NOTRUN -> [153]SKIP ([154]Intel XE#1397 / [155]Intel XE#1745
>         )
>   • igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
> 
>       □ shard-lnl: NOTRUN -> [156]SKIP ([157]Intel XE#1397)
>   • igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
> 
>       □ shard-bmg: NOTRUN -> [158]SKIP ([159]Intel XE#2293 / [160]Intel XE#2380
>         ) +1 other test skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
> 
>       □ shard-adlp: [161]PASS -> [162]DMESG-FAIL ([163]Intel XE#3194) +3 other
>         tests dmesg-fail
>   • igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
> 
>       □ shard-adlp: [164]PASS -> [165]FAIL ([166]Intel XE#1874) +13 other tests
>         fail
>   • igt@kms_frontbuffer_tracking@basic:
> 
>       □ shard-dg2-set2: [167]PASS -> [168]SKIP ([169]Intel XE#2351)
>   • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc:
> 
>       □ shard-adlp: NOTRUN -> [170]SKIP ([171]Intel XE#651) +1 other test skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
> 
>       □ shard-bmg: NOTRUN -> [172]SKIP ([173]Intel XE#2311) +11 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
> 
>       □ shard-dg2-set2: NOTRUN -> [174]SKIP ([175]Intel XE#2136) +16 other
>         tests skip
>   • igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary:
> 
>       □ shard-dg2-set2: [176]PASS -> [177]SKIP ([178]Intel XE#2136) +23 other
>         tests skip
>   • igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       □ shard-bmg: NOTRUN -> [179]FAIL ([180]Intel XE#2333) +1 other test fail
>   • igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
> 
>       □ shard-lnl: NOTRUN -> [181]SKIP ([182]Intel XE#651) +1 other test skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff:
> 
>       □ shard-adlp: NOTRUN -> [183]SKIP ([184]Intel XE#656) +1 other test skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
> 
>       □ shard-dg2-set2: NOTRUN -> [185]SKIP ([186]Intel XE#651) +5 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       □ shard-bmg: NOTRUN -> [187]SKIP ([188]Intel XE#2313) +9 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt:
> 
>       □ shard-dg2-set2: NOTRUN -> [189]SKIP ([190]Intel XE#653) +5 other tests
>         skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
> 
>       □ shard-lnl: NOTRUN -> [191]SKIP ([192]Intel XE#656) +4 other tests skip
>   • igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
> 
>       □ shard-adlp: NOTRUN -> [193]SKIP ([194]Intel XE#653) +1 other test skip
>   • igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       □ shard-dg2-set2: NOTRUN -> [195]SKIP ([196]Intel XE#2136 / [197]Intel XE
>         #2351) +7 other tests skip
>   • igt@kms_joiner@basic-force-big-joiner:
> 
>       □ shard-adlp: NOTRUN -> [198]SKIP ([199]Intel XE#3012)
>   • igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
> 
>       □ shard-dg2-set2: NOTRUN -> [200]FAIL ([201]Intel XE#616) +2 other tests
>         fail
>   • igt@kms_plane_lowres@tiling-y:
> 
>       □ shard-dg2-set2: NOTRUN -> [202]SKIP ([203]Intel XE#2423 / [204]i915#
>         2575) +14 other tests skip
>   • igt@kms_plane_scaling@intel-max-src-size:
> 
>       □ shard-bmg: [205]PASS -> [206]SKIP ([207]Intel XE#2685 / [208]Intel XE#
>         3307)
>   • igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
> 
>       □ shard-lnl: NOTRUN -> [209]SKIP ([210]Intel XE#2763) +3 other tests skip
>   • igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d:
> 
>       □ shard-bmg: NOTRUN -> [211]SKIP ([212]Intel XE#2763) +9 other tests skip
>       □ shard-dg2-set2: NOTRUN -> [213]SKIP ([214]Intel XE#2763 / [215]Intel XE
>         #455) +3 other tests skip
>   • igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b:
> 
>       □ shard-dg2-set2: NOTRUN -> [216]SKIP ([217]Intel XE#2763) +11 other
>         tests skip
>   • igt@kms_pm_dc@dc3co-vpb-simulation:
> 
>       □ shard-bmg: NOTRUN -> [218]SKIP ([219]Intel XE#2391)
>   • igt@kms_pm_dc@dc5-psr:
> 
>       □ shard-lnl: [220]PASS -> [221]FAIL ([222]Intel XE#718)
>   • igt@kms_pm_rpm@cursor-dpms:
> 
>       □ shard-dg2-set2: [223]PASS -> [224]SKIP ([225]Intel XE#2446) +6 other
>         tests skip
>   • igt@kms_pm_rpm@modeset-non-lpsp:
> 
>       □ shard-lnl: NOTRUN -> [226]SKIP ([227]Intel XE#1439 / [228]Intel XE#3141
>         )
>   • igt@kms_pm_rpm@modeset-non-lpsp-stress:
> 
>       □ shard-adlp: NOTRUN -> [229]SKIP ([230]Intel XE#836)
>   • igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf:
> 
>       □ shard-adlp: NOTRUN -> [231]SKIP ([232]Intel XE#1489)
>   • igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
> 
>       □ shard-lnl: NOTRUN -> [233]SKIP ([234]Intel XE#2893) +1 other test skip
>   • igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
> 
>       □ shard-bmg: NOTRUN -> [235]SKIP ([236]Intel XE#1489) +2 other tests skip
>   • igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
> 
>       □ shard-dg2-set2: NOTRUN -> [237]SKIP ([238]Intel XE#1489)
>   • igt@kms_psr@pr-sprite-plane-onoff:
> 
>       □ shard-lnl: NOTRUN -> [239]SKIP ([240]Intel XE#1406)
>   • igt@kms_psr@psr-basic:
> 
>       □ shard-bmg: NOTRUN -> [241]SKIP ([242]Intel XE#2234 / [243]Intel XE#2850
>         ) +6 other tests skip
>   • igt@kms_psr@psr2-dpms:
> 
>       □ shard-dg2-set2: NOTRUN -> [244]SKIP ([245]Intel XE#2850 / [246]Intel XE
>         #929) +3 other tests skip
>   • igt@kms_rotation_crc@bad-tiling:
> 
>       □ shard-lnl: NOTRUN -> [247]SKIP ([248]Intel XE#3414)
>   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       □ shard-lnl: NOTRUN -> [249]SKIP ([250]Intel XE#362)
>   • igt@kms_writeback@writeback-pixel-formats:
> 
>       □ shard-lnl: NOTRUN -> [251]SKIP ([252]Intel XE#756)
>   • igt@xe_ccs@ctrl-surf-copy-new-ctx:
> 
>       □ shard-dg2-set2: [253]PASS -> [254]SKIP ([255]Intel XE#1130) +186 other
>         tests skip
>   • igt@xe_copy_basic@mem-copy-linear-0xfffe:
> 
>       □ shard-dg2-set2: NOTRUN -> [256]SKIP ([257]Intel XE#1123)
>   • igt@xe_eudebug@basic-client:
> 
>       □ shard-adlp: NOTRUN -> [258]SKIP ([259]Intel XE#2905)
>   • igt@xe_eudebug@discovery-race-vmbind:
> 
>       □ shard-bmg: NOTRUN -> [260]SKIP ([261]Intel XE#2905) +3 other tests skip
>   • igt@xe_eudebug@sysfs-toggle:
> 
>       □ shard-dg2-set2: NOTRUN -> [262]SKIP ([263]Intel XE#2905) +2 other tests
>         skip
>   • igt@xe_eudebug_online@resume-dss:
> 
>       □ shard-lnl: NOTRUN -> [264]SKIP ([265]Intel XE#2905) +1 other test skip
>   • igt@xe_evict@evict-beng-mixed-threads-large:
> 
>       □ shard-lnl: NOTRUN -> [266]SKIP ([267]Intel XE#688) +1 other test skip
>   • igt@xe_evict@evict-mixed-many-threads-large:
> 
>       □ shard-adlp: NOTRUN -> [268]SKIP ([269]Intel XE#261 / [270]Intel XE#688)
>         +1 other test skip
>   • igt@xe_evict@evict-mixed-many-threads-small:
> 
>       □ shard-dg2-set2: [271]PASS -> [272]TIMEOUT ([273]Intel XE#1473)
>   • igt@xe_evict@evict-threads-large:
> 
>       □ shard-bmg: [274]PASS -> [275]TIMEOUT ([276]Intel XE#1473 / [277]Intel
>         XE#2472)
>   • igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
> 
>       □ shard-adlp: NOTRUN -> [278]SKIP ([279]Intel XE#1392)
>   • igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
> 
>       □ shard-lnl: NOTRUN -> [280]SKIP ([281]Intel XE#1392)
>   • igt@xe_exec_basic@multigpu-once-null-defer-bind:
> 
>       □ shard-bmg: NOTRUN -> [282]SKIP ([283]Intel XE#2322) +2 other tests skip
>   • igt@xe_exec_fault_mode@once-basic-prefetch:
> 
>       □ shard-adlp: NOTRUN -> [284]SKIP ([285]Intel XE#288) +2 other tests skip
>   • igt@xe_exec_fault_mode@once-invalid-userptr-fault:
> 
>       □ shard-dg2-set2: NOTRUN -> [286]SKIP ([287]Intel XE#1130) +32 other
>         tests skip
>   • igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm:
> 
>       □ shard-dg2-set2: NOTRUN -> [288]SKIP ([289]Intel XE#288) +7 other tests
>         skip
>   • igt@xe_live_ktest@xe_bo:
> 
>       □ shard-dg2-set2: [290]PASS -> [291]TIMEOUT ([292]Intel XE#2961 / [293]
>         Intel XE#3191) +1 other test timeout
>   • igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       □ shard-lnl: NOTRUN -> [294]SKIP ([295]Intel XE#2229) +1 other test skip
>   • igt@xe_mmap@vram:
> 
>       □ shard-adlp: NOTRUN -> [296]SKIP ([297]Intel XE#1008)
>   • igt@xe_module_load@reload:
> 
>       □ shard-dg2-set2: [298]PASS -> [299]FAIL ([300]Intel XE#2136)
>   • igt@xe_oa@mi-rpc:
> 
>       □ shard-dg2-set2: NOTRUN -> [301]SKIP ([302]Intel XE#2541) +1 other test
>         skip
>   • igt@xe_oa@mmio-triggered-reports@rcs-0:
> 
>       □ shard-bmg: NOTRUN -> [303]FAIL ([304]Intel XE#2249)
>   • igt@xe_oa@syncs-syncobj-none:
> 
>       □ shard-adlp: NOTRUN -> [305]SKIP ([306]Intel XE#2541)
>   • igt@xe_pm@d3cold-multiple-execs:
> 
>       □ shard-lnl: NOTRUN -> [307]SKIP ([308]Intel XE#2284 / [309]Intel XE#366)
>   • igt@xe_pm@s2idle-vm-bind-prefetch:
> 
>       □ shard-adlp: [310]PASS -> [311]DMESG-WARN ([312]Intel XE#2953 / [313]
>         Intel XE#3086)
>   • igt@xe_pm@s4-d3cold-basic-exec:
> 
>       □ shard-dg2-set2: NOTRUN -> [314]SKIP ([315]Intel XE#2284 / [316]Intel XE
>         #366)
>   • igt@xe_pm@s4-exec-after:
> 
>       □ shard-adlp: [317]PASS -> [318]ABORT ([319]Intel XE#1358 / [320]Intel XE
>         #1607)
>   • igt@xe_pm_residency@toggle-gt-c6:
> 
>       □ shard-lnl: [321]PASS -> [322]FAIL ([323]Intel XE#958)
>   • igt@xe_query@multigpu-query-invalid-extension:
> 
>       □ shard-dg2-set2: NOTRUN -> [324]SKIP ([325]Intel XE#944)
> 
> Possible fixes
> 
>   • igt@core_hotunplug@hotreplug-lateclose:
> 
>       □ shard-dg2-set2: [326]SKIP ([327]Intel XE#1885) -> [328]PASS +1 other
>         test pass
>   • igt@core_hotunplug@hotunbind-rebind:
> 
>       □ shard-adlp: [329]DMESG-WARN ([330]Intel XE#3086) -> [331]PASS
>   • igt@fbdev@write:
> 
>       □ shard-dg2-set2: [332]SKIP ([333]Intel XE#2134) -> [334]PASS
>   • igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
> 
>       □ shard-lnl: [335]FAIL ([336]Intel XE#911) -> [337]PASS +3 other tests
>         pass
>   • igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
> 
>       □ shard-lnl: [338]FAIL ([339]Intel XE#1701) -> [340]PASS +1 other test
>         pass
>   • igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
> 
>       □ shard-dg2-set2: [341]FAIL ([342]Intel XE#1426) -> [343]PASS +1 other
>         test pass
>   • igt@kms_big_fb@linear-64bpp-rotate-180:
> 
>       □ shard-dg2-set2: [344]DMESG-WARN ([345]Intel XE#877) -> [346]PASS
>   • igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
> 
>       □ shard-adlp: [347]FAIL ([348]Intel XE#1231 / [349]Intel XE#1242) ->
>         [350]PASS +1 other test pass
>   • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       □ shard-adlp: [351]DMESG-FAIL ([352]Intel XE#3194) -> [353]PASS +2 other
>         tests pass
>   • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
> 
>       □ shard-adlp: [354]FAIL ([355]Intel XE#3052) -> [356]PASS
>   • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
> 
>       □ shard-adlp: [357]FAIL ([358]Intel XE#1874) -> [359]PASS +1 other test
>         pass
>   • igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
> 
>       □ shard-dg2-set2: [360]SKIP -> [361]PASS
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
> 
>       □ shard-dg2-set2: [362]INCOMPLETE ([363]Intel XE#1195 / [364]Intel XE#
>         1727) -> [365]PASS
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
> 
>       □ shard-dg2-set2: [366]INCOMPLETE ([367]Intel XE#1195 / [368]Intel XE#
>         3113 / [369]Intel XE#3124) -> [370]PASS
>   • igt@kms_cursor_crc@cursor-onscreen-256x256:
> 
>       □ shard-adlp: [371]TIMEOUT ([372]Intel XE#1033 / [373]Intel XE#1727) ->
>         [374]PASS +3 other tests pass
>   • igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
> 
>       □ shard-bmg: [375]DMESG-WARN ([376]Intel XE#877) -> [377]PASS
>   • igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
> 
>       □ shard-adlp: [378]FAIL ([379]Intel XE#1475) -> [380]PASS
>   • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
> 
>       □ shard-dg2-set2: [381]FAIL -> [382]PASS +4 other tests pass
>   • igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
> 
>       □ shard-dg2-set2: [383]FAIL ([384]Intel XE#301) -> [385]PASS +4 other
>         tests pass
>   • igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
> 
>       □ shard-bmg: [386]FAIL ([387]Intel XE#2882) -> [388]PASS +1 other test
>         pass
>   • igt@kms_flip@2x-flip-vs-suspend-interruptible:
> 
>       □ shard-bmg: [389]INCOMPLETE ([390]Intel XE#2597) -> [391]PASS
>   • igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3:
> 
>       □ shard-bmg: [392]DMESG-WARN -> [393]PASS
>   • igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3:
> 
>       □ shard-bmg: [394]INCOMPLETE ([395]Intel XE#2597 / [396]Intel XE#2635) ->
>         [397]PASS
>   • igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
> 
>       □ shard-bmg: [398]INCOMPLETE ([399]Intel XE#2635) -> [400]PASS
>   • igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3:
> 
>       □ shard-bmg: [401]INCOMPLETE -> [402]PASS +2 other tests pass
>   • igt@kms_flip@blocking-wf_vblank:
> 
>       □ shard-lnl: [403]FAIL ([404]Intel XE#886) -> [405]PASS +4 other tests
>         pass
>   • igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3:
> 
>       □ shard-bmg: [406]FAIL -> [407]PASS +1 other test pass
>   • igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear:
> 
>       □ shard-lnl: [408]FAIL ([409]Intel XE#1491) -> [410]PASS +1 other test
>         pass
>   • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       □ shard-dg2-set2: [411]SKIP ([412]Intel XE#2136 / [413]Intel XE#2351) ->
>         [414]PASS +12 other tests pass
>   • igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
> 
>       □ shard-adlp: [415]FAIL ([416]Intel XE#1861) -> [417]PASS +3 other tests
>         pass
>   • igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
> 
>       □ shard-dg2-set2: [418]SKIP ([419]Intel XE#2136) -> [420]PASS +35 other
>         tests pass
>   • igt@kms_hdr@invalid-hdr:
> 
>       □ shard-bmg: [421]SKIP ([422]Intel XE#1503) -> [423]PASS
>   • igt@kms_lease@invalid-create-leases:
> 
>       □ shard-dg2-set2: [424]SKIP ([425]Intel XE#2423 / [426]i915#2575) ->
>         [427]PASS +110 other tests pass
>   • igt@kms_plane_cursor@viewport:
> 
>       □ shard-dg2-set2: [428]FAIL ([429]Intel XE#616) -> [430]PASS +1 other
>         test pass
>   • igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
> 
>       □ shard-dg2-set2: [431]SKIP ([432]Intel XE#2446) -> [433]PASS +5 other
>         tests pass
>   • igt@kms_pm_rpm@universal-planes:
> 
>       □ shard-lnl: [434]DMESG-WARN ([435]Intel XE#2042) -> [436]PASS
>   • igt@kms_pm_rpm@universal-planes@plane-59:
> 
>       □ shard-lnl: [437]DMESG-WARN ([438]Intel XE#3184) -> [439]PASS
>   • igt@testdisplay:
> 
>       □ shard-dg2-set2: [440]SKIP ([441]Intel XE#2423) -> [442]PASS +2 other
>         tests pass
>   • igt@xe_drm_fdinfo@utilization-others-idle:
> 
>       □ shard-lnl: [443]FAIL ([444]Intel XE#2667) -> [445]PASS
>   • igt@xe_exec_balancer@once-parallel-rebind:
> 
>       □ shard-dg2-set2: [446]SKIP ([447]Intel XE#1130) -> [448]PASS +213 other
>         tests pass
>   • igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
> 
>       □ shard-dg2-set2: [449]SKIP ([450]Intel XE#2229) -> [451]PASS +1 other
>         test pass
>   • igt@xe_module_load@reload-no-display:
> 
>       □ shard-dg2-set2: [452]FAIL ([453]Intel XE#2136) -> [454]PASS
>   • igt@xe_pm@s4-basic:
> 
>       □ shard-lnl: [455]ABORT ([456]Intel XE#1358 / [457]Intel XE#1607) ->
>         [458]PASS
>   • igt@xe_pm@s4-vm-bind-prefetch:
> 
>       □ shard-adlp: [459]ABORT ([460]Intel XE#1607 / [461]Intel XE#1794) ->
>         [462]PASS
>   • igt@xe_pm_residency@toggle-gt-c6:
> 
>       □ shard-adlp: [463]FAIL ([464]Intel XE#958) -> [465]PASS
>   • igt@xe_spin_batch@spin-fixed-duration-with-preempter:
> 
>       □ shard-adlp: [466]FAIL ([467]Intel XE#1081) -> [468]PASS
>   • igt@xe_vm@mmap-style-bind-either-side-partial-hammer:
> 
>       □ shard-adlp: [469]DMESG-WARN ([470]Intel XE#1033 / [471]Intel XE#1727)
>         -> [472]PASS
> 
> Warnings
> 
>   • igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
> 
>       □ shard-dg2-set2: [473]SKIP ([474]Intel XE#2423 / [475]i915#2575) ->
>         [476]SKIP ([477]Intel XE#623)
>   • igt@kms_big_fb@4-tiled-8bpp-rotate-270:
> 
>       □ shard-dg2-set2: [478]SKIP ([479]Intel XE#2136) -> [480]SKIP ([481]Intel
>         XE#316) +1 other test skip
>   • igt@kms_big_fb@linear-64bpp-rotate-270:
> 
>       □ shard-dg2-set2: [482]SKIP ([483]Intel XE#2136 / [484]Intel XE#2351) ->
>         [485]SKIP ([486]Intel XE#316)
>   • igt@kms_big_fb@x-tiled-8bpp-rotate-270:
> 
>       □ shard-dg2-set2: [487]SKIP ([488]Intel XE#316) -> [489]SKIP ([490]Intel
>         XE#2136) +3 other tests skip
>   • igt@kms_big_fb@x-tiled-8bpp-rotate-90:
> 
>       □ shard-dg2-set2: [491]SKIP ([492]Intel XE#316) -> [493]SKIP ([494]Intel
>         XE#2136 / [495]Intel XE#2351) +3 other tests skip
>   • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
> 
>       □ shard-adlp: [496]FAIL ([497]Intel XE#1231 / [498]Intel XE#1242) ->
>         [499]FAIL ([500]Intel XE#1242)
>   • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
> 
>       □ shard-adlp: [501]FAIL ([502]Intel XE#1231 / [503]Intel XE#1242) ->
>         [504]DMESG-FAIL ([505]Intel XE#3194)
>   • igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
> 
>       □ shard-adlp: [506]DMESG-FAIL -> [507]FAIL ([508]Intel XE#1231 / [509]
>         Intel XE#1242)
>   • igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
> 
>       □ shard-dg2-set2: [510]SKIP ([511]Intel XE#607) -> [512]SKIP ([513]Intel
>         XE#2136 / [514]Intel XE#2351)
>   • igt@kms_big_fb@y-tiled-addfb-size-overflow:
> 
>       □ shard-dg2-set2: [515]SKIP ([516]Intel XE#610) -> [517]SKIP ([518]Intel
>         XE#2136)
>   • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
> 
>       □ shard-dg2-set2: [519]SKIP ([520]Intel XE#2136) -> [521]SKIP ([522]Intel
>         XE#1124) +9 other tests skip
>   • igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
> 
>       □ shard-dg2-set2: [523]SKIP ([524]Intel XE#2136 / [525]Intel XE#2351) ->
>         [526]SKIP ([527]Intel XE#1124) +7 other tests skip
>   • igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
> 
>       □ shard-adlp: [528]DMESG-FAIL ([529]Intel XE#3194) -> [530]FAIL ([531]
>         Intel XE#1231 / [532]Intel XE#1242)
>   • igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
> 
>       □ shard-dg2-set2: [533]SKIP ([534]Intel XE#1124) -> [535]SKIP ([536]Intel
>         XE#2136) +10 other tests skip
>   • igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
> 
>       □ shard-dg2-set2: [537]SKIP ([538]Intel XE#1124) -> [539]SKIP ([540]Intel
>         XE#2136 / [541]Intel XE#2351) +4 other tests skip
>   • igt@kms_big_fb@yf-tiled-addfb:
> 
>       □ shard-dg2-set2: [542]SKIP ([543]Intel XE#619) -> [544]SKIP ([545]Intel
>         XE#2136 / [546]Intel XE#2351)
>   • igt@kms_big_fb@yf-tiled-addfb-size-overflow:
> 
>       □ shard-dg2-set2: [547]SKIP ([548]Intel XE#2136) -> [549]SKIP ([550]Intel
>         XE#610)
>   • igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
> 
>       □ shard-dg2-set2: [551]SKIP ([552]Intel XE#2423 / [553]i915#2575) ->
>         [554]SKIP ([555]Intel XE#367) +5 other tests skip
>   • igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
> 
>       □ shard-dg2-set2: [556]SKIP ([557]Intel XE#2423 / [558]i915#2575) ->
>         [559]SKIP ([560]Intel XE#2191)
>   • igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
> 
>       □ shard-dg2-set2: [561]SKIP ([562]Intel XE#2191) -> [563]SKIP ([564]Intel
>         XE#2423 / [565]i915#2575)
>   • igt@kms_bw@linear-tiling-3-displays-2560x1440p:
> 
>       □ shard-dg2-set2: [566]SKIP ([567]Intel XE#367) -> [568]SKIP ([569]Intel
>         XE#2423 / [570]i915#2575) +4 other tests skip
>   • igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
> 
>       □ shard-dg2-set2: [571]SKIP ([572]Intel XE#2136 / [573]Intel XE#2351) ->
>         [574]SKIP ([575]Intel XE#455 / [576]Intel XE#787) +2 other tests skip
>   • igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
> 
>       □ shard-dg2-set2: [577]SKIP ([578]Intel XE#455 / [579]Intel XE#787) ->
>         [580]SKIP ([581]Intel XE#2136) +11 other tests skip
>   • igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
> 
>       □ shard-dg2-set2: [582]SKIP ([583]Intel XE#2136) -> [584]SKIP ([585]Intel
>         XE#2907) +1 other test skip
>   • igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
> 
>       □ shard-dg2-set2: [586]SKIP ([587]Intel XE#455 / [588]Intel XE#787) ->
>         [589]SKIP ([590]Intel XE#2136 / [591]Intel XE#2351) +3 other tests skip
>   • igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
> 
>       □ shard-dg2-set2: [592]SKIP ([593]Intel XE#2136) -> [594]SKIP ([595]Intel
>         XE#455 / [596]Intel XE#787) +13 other tests skip
>   • igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
> 
>       □ shard-dg2-set2: [597]SKIP -> [598]SKIP ([599]Intel XE#455 / [600]Intel
>         XE#787)
>   • igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
> 
>       □ shard-dg2-set2: [601]SKIP ([602]Intel XE#2907) -> [603]SKIP ([604]Intel
>         XE#2136) +1 other test skip
>   • igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
> 
>       □ shard-dg2-set2: [605]INCOMPLETE ([606]Intel XE#1195 / [607]Intel XE#
>         1727) -> [608]SKIP ([609]Intel XE#2136 / [610]Intel XE#2351)
>   • igt@kms_chamelium_frames@hdmi-aspect-ratio:
> 
>       □ shard-dg2-set2: [611]SKIP ([612]Intel XE#2423 / [613]i915#2575) ->
>         [614]SKIP ([615]Intel XE#373) +8 other tests skip
>   • igt@kms_chamelium_hpd@vga-hpd:
> 
>       □ shard-dg2-set2: [616]SKIP ([617]Intel XE#373) -> [618]SKIP ([619]Intel
>         XE#2423 / [620]i915#2575) +9 other tests skip
>   • igt@kms_content_protection@atomic-dpms:
> 
>       □ shard-dg2-set2: [621]SKIP ([622]Intel XE#2423 / [623]i915#2575) ->
>         [624]FAIL ([625]Intel XE#1178)
>   • igt@kms_content_protection@dp-mst-type-1:
> 
>       □ shard-dg2-set2: [626]SKIP ([627]Intel XE#2423 / [628]i915#2575) ->
>         [629]SKIP ([630]Intel XE#307)
>   • igt@kms_content_protection@lic-type-0:
> 
>       □ shard-dg2-set2: [631]FAIL ([632]Intel XE#1178) -> [633]SKIP ([634]Intel
>         XE#2423 / [635]i915#2575) +1 other test skip
>   • igt@kms_content_protection@lic-type-1:
> 
>       □ shard-dg2-set2: [636]SKIP ([637]Intel XE#2423 / [638]i915#2575) ->
>         [639]SKIP ([640]Intel XE#455) +9 other tests skip
>   • igt@kms_content_protection@uevent:
> 
>       □ shard-dg2-set2: [641]FAIL ([642]Intel XE#1188) -> [643]SKIP ([644]Intel
>         XE#2423 / [645]i915#2575)
>   • igt@kms_cursor_crc@cursor-offscreen-512x512:
> 
>       □ shard-dg2-set2: [646]SKIP ([647]Intel XE#308) -> [648]SKIP ([649]Intel
>         XE#2423 / [650]i915#2575) +2 other tests skip
>   • igt@kms_cursor_crc@cursor-random-512x170:
> 
>       □ shard-dg2-set2: [651]SKIP ([652]Intel XE#2423 / [653]i915#2575) ->
>         [654]SKIP ([655]Intel XE#308) +1 other test skip
>   • igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
> 
>       □ shard-dg2-set2: [656]SKIP ([657]Intel XE#2423 / [658]i915#2575) ->
>         [659]SKIP ([660]Intel XE#323) +1 other test skip
>   • igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
> 
>       □ shard-dg2-set2: [661]SKIP ([662]Intel XE#323) -> [663]SKIP ([664]Intel
>         XE#2423 / [665]i915#2575)
>   • igt@kms_dsc@dsc-with-bpc:
> 
>       □ shard-dg2-set2: [666]SKIP ([667]Intel XE#2136) -> [668]SKIP ([669]Intel
>         XE#455) +6 other tests skip
>   • igt@kms_dsc@dsc-with-bpc-formats:
> 
>       □ shard-dg2-set2: [670]SKIP ([671]Intel XE#2136 / [672]Intel XE#2351) ->
>         [673]SKIP ([674]Intel XE#455) +3 other tests skip
>   • igt@kms_fbcon_fbt@psr-suspend:
> 
>       □ shard-dg2-set2: [675]SKIP ([676]Intel XE#2136) -> [677]SKIP ([678]Intel
>         XE#776)
>   • igt@kms_feature_discovery@dp-mst:
> 
>       □ shard-dg2-set2: [679]SKIP ([680]Intel XE#1137) -> [681]SKIP ([682]Intel
>         XE#2423 / [683]i915#2575)
>   • igt@kms_feature_discovery@psr1:
> 
>       □ shard-dg2-set2: [684]SKIP ([685]Intel XE#2423 / [686]i915#2575) ->
>         [687]SKIP ([688]Intel XE#1135) +1 other test skip
>   • igt@kms_flip@flip-vs-expired-vblank-interruptible:
> 
>       □ shard-dg2-set2: [689]SKIP ([690]Intel XE#2423 / [691]i915#2575) ->
>         [692]FAIL ([693]Intel XE#301) +1 other test fail
>   • igt@kms_flip@flip-vs-suspend:
> 
>       □ shard-dg2-set2: [694]INCOMPLETE ([695]Intel XE#1195 / [696]Intel XE#
>         2049 / [697]Intel XE#2597) -> [698]SKIP ([699]Intel XE#2423 / [700]i915
>         #2575)
>   • igt@kms_flip@wf_vblank-ts-check:
> 
>       □ shard-lnl: [701]FAIL ([702]Intel XE#886) -> [703]FAIL ([704]Intel XE#
>         3403 / [705]Intel XE#886)
>   • igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
> 
>       □ shard-dg2-set2: [706]SKIP ([707]Intel XE#455) -> [708]SKIP ([709]Intel
>         XE#2136) +2 other tests skip
>   • igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
> 
>       □ shard-dg2-set2: [710]SKIP ([711]Intel XE#455) -> [712]SKIP ([713]Intel
>         XE#2136 / [714]Intel XE#2351) +1 other test skip
>   • igt@kms_force_connector_basic@prune-stale-modes:
> 
>       □ shard-dg2-set2: [715]SKIP ([716]i915#5274) -> [717]SKIP ([718]Intel XE#
>         2423 / [719]i915#2575)
>   • igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
> 
>       □ shard-dg2-set2: [720]SKIP ([721]Intel XE#651) -> [722]SKIP ([723]Intel
>         XE#2136) +18 other tests skip
>   • igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
> 
>       □ shard-dg2-set2: [724]SKIP ([725]Intel XE#2136 / [726]Intel XE#2351) ->
>         [727]SKIP ([728]Intel XE#651) +10 other tests skip
>   • igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
> 
>       □ shard-adlp: [729]TIMEOUT ([730]Intel XE#1033 / [731]Intel XE#1727) ->
>         [732]FAIL ([733]Intel XE#1861)
>   • igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
> 
>       □ shard-dg2-set2: [734]SKIP ([735]Intel XE#2136) -> [736]SKIP ([737]Intel
>         XE#651) +26 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
> 
>       □ shard-dg2-set2: [738]SKIP ([739]Intel XE#651) -> [740]SKIP ([741]Intel
>         XE#2136 / [742]Intel XE#2351) +14 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
> 
>       □ shard-dg2-set2: [743]SKIP ([744]Intel XE#2136 / [745]Intel XE#2351) ->
>         [746]SKIP ([747]Intel XE#658) +1 other test skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
> 
>       □ shard-dg2-set2: [748]SKIP ([749]Intel XE#653) -> [750]SKIP ([751]Intel
>         XE#2136) +32 other tests skip
>   • igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
> 
>       □ shard-dg2-set2: [752]SKIP ([753]Intel XE#2136 / [754]Intel XE#2351) ->
>         [755]SKIP ([756]Intel XE#653) +10 other tests skip
>   • igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
> 
>       □ shard-dg2-set2: [757]SKIP ([758]Intel XE#2136) -> [759]SKIP ([760]Intel
>         XE#653) +32 other tests skip
>   • igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
> 
>       □ shard-dg2-set2: [761]SKIP ([762]Intel XE#653) -> [763]SKIP ([764]Intel
>         XE#2136 / [765]Intel XE#2351) +5 other tests skip
>   • igt@kms_hdr@bpc-switch:
> 
>       □ shard-adlp: [766]TIMEOUT ([767]Intel XE#1033 / [768]Intel XE#1727) ->
>         [769]SKIP ([770]Intel XE#455)
>   • igt@kms_joiner@basic-ultra-joiner:
> 
>       □ shard-dg2-set2: [771]SKIP ([772]Intel XE#2136) -> [773]SKIP ([774]Intel
>         XE#2927)
>   • igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
> 
>       □ shard-dg2-set2: [775]SKIP ([776]Intel XE#356) -> [777]SKIP ([778]Intel
>         XE#2423 / [779]i915#2575)
>   • igt@kms_panel_fitting@atomic-fastset:
> 
>       □ shard-dg2-set2: [780]SKIP ([781]Intel XE#455) -> [782]SKIP ([783]Intel
>         XE#2423 / [784]i915#2575) +12 other tests skip
>   • igt@kms_plane@pixel-format:
> 
>       □ shard-adlp: [785]INCOMPLETE ([786]Intel XE#1035) -> [787]INCOMPLETE (
>         [788]Intel XE#1035 / [789]Intel XE#1195)
>   • igt@kms_plane_cursor@primary:
> 
>       □ shard-dg2-set2: [790]SKIP ([791]Intel XE#2423 / [792]i915#2575) ->
>         [793]FAIL ([794]Intel XE#616)
>   • igt@kms_plane_scaling@intel-max-src-size:
> 
>       □ shard-dg2-set2: [795]FAIL ([796]Intel XE#361) -> [797]SKIP ([798]Intel
>         XE#455)
>   • igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
> 
>       □ shard-dg2-set2: [799]SKIP ([800]Intel XE#2763 / [801]Intel XE#455) ->
>         [802]SKIP ([803]Intel XE#2423 / [804]i915#2575)
>   • igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
> 
>       □ shard-dg2-set2: [805]SKIP ([806]Intel XE#2423 / [807]i915#2575) ->
>         [808]SKIP ([809]Intel XE#2763 / [810]Intel XE#455) +3 other tests skip
>   • igt@kms_pm_backlight@brightness-with-dpms:
> 
>       □ shard-dg2-set2: [811]SKIP ([812]Intel XE#2136) -> [813]SKIP ([814]Intel
>         XE#2938)
>   • igt@kms_pm_backlight@fade:
> 
>       □ shard-dg2-set2: [815]SKIP ([816]Intel XE#870) -> [817]SKIP ([818]Intel
>         XE#2136)
>   • igt@kms_pm_backlight@fade-with-dpms:
> 
>       □ shard-dg2-set2: [819]SKIP ([820]Intel XE#2136) -> [821]SKIP ([822]Intel
>         XE#870)
>   • igt@kms_pm_dc@dc5-psr:
> 
>       □ shard-dg2-set2: [823]SKIP ([824]Intel XE#2136) -> [825]SKIP ([826]Intel
>         XE#1129)
>   • igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
> 
>       □ shard-dg2-set2: [827]SKIP ([828]Intel XE#1489) -> [829]SKIP ([830]Intel
>         XE#2136) +10 other tests skip
>   • igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
> 
>       □ shard-dg2-set2: [831]SKIP ([832]Intel XE#2136) -> [833]SKIP ([834]Intel
>         XE#1489) +10 other tests skip
>   • igt@kms_psr2_su@page_flip-nv12:
> 
>       □ shard-dg2-set2: [835]SKIP ([836]Intel XE#2136) -> [837]SKIP ([838]Intel
>         XE#1122)
>   • igt@kms_psr@fbc-psr-sprite-plane-onoff:
> 
>       □ shard-dg2-set2: [839]SKIP ([840]Intel XE#2850 / [841]Intel XE#929) ->
>         [842]SKIP ([843]Intel XE#2136 / [844]Intel XE#2351) +7 other tests skip
>   • igt@kms_psr@fbc-psr2-primary-render:
> 
>       □ shard-dg2-set2: [845]SKIP ([846]Intel XE#2850 / [847]Intel XE#929) ->
>         [848]SKIP ([849]Intel XE#2136) +11 other tests skip
>   • igt@kms_psr@psr-cursor-plane-move:
> 
>       □ shard-dg2-set2: [850]SKIP ([851]Intel XE#2351) -> [852]SKIP ([853]Intel
>         XE#2850 / [854]Intel XE#929)
>   • igt@kms_psr@psr-dpms:
> 
>       □ shard-dg2-set2: [855]SKIP ([856]Intel XE#2136 / [857]Intel XE#2351) ->
>         [858]SKIP ([859]Intel XE#2850 / [860]Intel XE#929) +6 other tests skip
>   • igt@kms_psr@psr-sprite-plane-onoff:
> 
>       □ shard-dg2-set2: [861]SKIP ([862]Intel XE#2850 / [863]Intel XE#929) ->
>         [864]SKIP ([865]Intel XE#2351)
>   • igt@kms_psr@psr2-basic:
> 
>       □ shard-dg2-set2: [866]SKIP ([867]Intel XE#2136) -> [868]SKIP ([869]Intel
>         XE#2850 / [870]Intel XE#929) +13 other tests skip
>   • igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
> 
>       □ shard-dg2-set2: [871]SKIP ([872]Intel XE#2136) -> [873]SKIP ([874]Intel
>         XE#2939)
>   • igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
> 
>       □ shard-dg2-set2: [875]SKIP ([876]Intel XE#3414) -> [877]SKIP ([878]Intel
>         XE#2423 / [879]i915#2575) +2 other tests skip
>   • igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
> 
>       □ shard-dg2-set2: [880]SKIP ([881]Intel XE#2423 / [882]i915#2575) ->
>         [883]SKIP ([884]Intel XE#1127)
>   • igt@kms_rotation_crc@sprite-rotation-270:
> 
>       □ shard-dg2-set2: [885]SKIP ([886]Intel XE#2423 / [887]i915#2575) ->
>         [888]SKIP ([889]Intel XE#3414) +2 other tests skip
>   • igt@kms_tiled_display@basic-test-pattern-with-chamelium:
> 
>       □ shard-bmg: [890]SKIP ([891]Intel XE#2509) -> [892]SKIP ([893]Intel XE#
>         2426)
>   • igt@kms_tv_load_detect@load-detect:
> 
>       □ shard-dg2-set2: [894]SKIP ([895]Intel XE#330) -> [896]SKIP ([897]Intel
>         XE#2423 / [898]i915#2575)
>   • igt@kms_writeback@writeback-pixel-formats:
> 
>       □ shard-dg2-set2: [899]SKIP ([900]Intel XE#2423 / [901]i915#2575) ->
>         [902]SKIP ([903]Intel XE#756) +2 other tests skip
>   • igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
> 
>       □ shard-dg2-set2: [904]SKIP ([905]Intel XE#2423 / [906]i915#2575) ->
>         [907]SKIP ([908]Intel XE#1091 / [909]Intel XE#2849)
>   • igt@xe_copy_basic@mem-copy-linear-0x369:
> 
>       □ shard-dg2-set2: [910]SKIP ([911]Intel XE#1130) -> [912]SKIP ([913]Intel
>         XE#1123)
>   • igt@xe_copy_basic@mem-set-linear-0xfd:
> 
>       □ shard-dg2-set2: [914]SKIP ([915]Intel XE#1126) -> [916]SKIP ([917]Intel
>         XE#1130)
>   • igt@xe_eudebug@basic-close:
> 
>       □ shard-dg2-set2: [918]SKIP ([919]Intel XE#2905) -> [920]SKIP ([921]Intel
>         XE#1130) +9 other tests skip
>   • igt@xe_eudebug@basic-vm-access-parameters:
> 
>       □ shard-dg2-set2: [922]SKIP ([923]Intel XE#1130) -> [924]SKIP ([925]Intel
>         XE#2905) +9 other tests skip
>   • igt@xe_evict@evict-large-multi-vm-cm:
> 
>       □ shard-dg2-set2: [926]FAIL ([927]Intel XE#1600) -> [928]SKIP ([929]Intel
>         XE#1130)
>   • igt@xe_evict@evict-mixed-many-threads-large:
> 
>       □ shard-dg2-set2: [930]FAIL ([931]Intel XE#1000) -> [932]SKIP ([933]Intel
>         XE#1130)
>   • igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
> 
>       □ shard-dg2-set2: [934]SKIP ([935]Intel XE#1130) -> [936]SKIP ([937]Intel
>         XE#288) +33 other tests skip
>   • igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
> 
>       □ shard-dg2-set2: [938]SKIP ([939]Intel XE#288) -> [940]SKIP ([941]Intel
>         XE#1130) +25 other tests skip
>   • igt@xe_fault_injection@inject-fault-probe:
> 
>       □ shard-dg2-set2: [942]DMESG-WARN ([943]Intel XE#3343) -> [944]SKIP (
>         [945]Intel XE#1130)
>   • igt@xe_huc_copy@huc_copy:
> 
>       □ shard-dg2-set2: [946]SKIP ([947]Intel XE#255) -> [948]SKIP ([949]Intel
>         XE#1130)
>   • igt@xe_mmap@small-bar:
> 
>       □ shard-dg2-set2: [950]SKIP ([951]Intel XE#512) -> [952]SKIP ([953]Intel
>         XE#1130)
>   • igt@xe_oa@non-privileged-map-oa-buffer:
> 
>       □ shard-dg2-set2: [954]SKIP ([955]Intel XE#2541) -> [956]SKIP ([957]Intel
>         XE#1130) +5 other tests skip
>   • igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
> 
>       □ shard-dg2-set2: [958]SKIP ([959]Intel XE#1130) -> [960]SKIP ([961]Intel
>         XE#2541) +11 other tests skip
>   • igt@xe_pat@display-vs-wb-transient:
> 
>       □ shard-dg2-set2: [962]SKIP ([963]Intel XE#1337) -> [964]SKIP ([965]Intel
>         XE#1130)
>   • igt@xe_pat@pat-index-xe2:
> 
>       □ shard-dg2-set2: [966]SKIP ([967]Intel XE#2839 / [968]Intel XE#977) ->
>         [969]SKIP ([970]Intel XE#1130)
>   • igt@xe_pm@d3cold-mmap-system:
> 
>       □ shard-dg2-set2: [971]SKIP ([972]Intel XE#1130) -> [973]SKIP ([974]Intel
>         XE#2284 / [975]Intel XE#366) +1 other test skip
>   • igt@xe_pm@d3cold-mmap-vram:
> 
>       □ shard-dg2-set2: [976]SKIP ([977]Intel XE#2284 / [978]Intel XE#366) ->
>         [979]SKIP ([980]Intel XE#1130) +2 other tests skip
>   • igt@xe_pm@d3cold-mocs:
> 
>       □ shard-dg2-set2: [981]SKIP ([982]Intel XE#2284) -> [983]SKIP ([984]Intel
>         XE#1130)
>   • igt@xe_query@multigpu-query-oa-units:
> 
>       □ shard-dg2-set2: [985]SKIP ([986]Intel XE#944) -> [987]SKIP ([988]Intel
>         XE#1130) +2 other tests skip
>   • igt@xe_query@multigpu-query-topology:
> 
>       □ shard-dg2-set2: [989]SKIP ([990]Intel XE#1130) -> [991]SKIP ([992]Intel
>         XE#944) +2 other tests skip
>   • igt@xe_sriov_flr@flr-each-isolation:
> 
>       □ shard-dg2-set2: [993]SKIP ([994]Intel XE#3342) -> [995]SKIP ([996]Intel
>         XE#1130)
>   • igt@xe_tlb@basic-tlb:
> 
>       □ shard-dg2-set2: [997]SKIP ([998]Intel XE#1130) -> [999]FAIL ([1000]
>         Intel XE#2922)
>   • igt@xe_wedged@basic-wedged:
> 
>       □ shard-dg2-set2: [1001]SKIP ([1002]Intel XE#1130) -> [1003]DMESG-WARN (
>         [1004]Intel XE#2919)
>   • igt@xe_wedged@wedged-at-any-timeout:
> 
>       □ shard-dg2-set2: [1005]ABORT ([1006]Intel XE#3421) -> [1007]SKIP ([1008]
>         Intel XE#1130)
> 
> {name}: This element is suppressed. This means it is ignored when computing
> the status of the difference (SUCCESS, WARNING, or FAILURE).
> 
> Build changes
> 
>   • IGT: IGT_8105 -> IGT_8107
>   • Linux: xe-2221-169c7cd31a373ed31054abb423981856eb5fb119 -> xe-pw-141307v1
> 
> IGT_8105: 8105
> IGT_8107: 0362b0deec80daaecdfa3dd0676dcabb6f14bd9c @ https://
> gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-2221-169c7cd31a373ed31054abb423981856eb5fb119:
> 169c7cd31a373ed31054abb423981856eb5fb119
> xe-pw-141307v1: 141307v1
> 
> 
> References:
> 
> [1] https://patchwork.freedesktop.org/series/141307/
> [2] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/index.html
> [3] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
> [4] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
> [5] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> [6] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-6.html
> [7] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
> [8] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe@function-vm_bind_ioctl_ops_create.html
> [9] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe@function-xe_pm_init_early.html
> [10] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe@function-xe_pm_init_early.html
> [11] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe@function-xe_pm_init_early.html
> [12] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe@function-xe_pm_init_early.html
> [13] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_prepare.html
> [14] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe@function-xe_pt_update_ops_run.html
> [15] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe@function-xe_wa_init.html
> [16] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe@function-xe_wa_init.html
> [17] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-8/igt@xe_oa@invalid-oa-exponent.html
> [18] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> [19] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [20] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [21] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
> [22] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_pm_dc@dc5-retention-flops.html
> [23] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
> [24] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_pm_dc@dc5-retention-flops.html
> [25] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html
> [26] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> [27] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html
> [28] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html
> [29] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> [30] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ads_init.html
> [31] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html
> [32] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> [33] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe@function-xe_guc_ct_init.html
> [34] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@xe_eudebug@exec-queue-placements.html
> [35] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-5/igt@xe_eudebug@exec-queue-placements.html
> [36] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@xe_eudebug@exec-queue-placements.html
> [37] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@xe_eudebug@exec-queue-placements.html
> [38] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@core_getstats.html
> [39] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@core_getstats.html
> [40] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [41] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html
> [42] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
> [43] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@fbdev@info.html
> [44] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@fbdev@info.html
> [45] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> [46] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html
> [47] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events.html
> [48] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
> [49] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> [50] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
> [51] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
> [52] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-2/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
> [53] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
> [54] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> [55] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
> [56] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> [57] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> [58] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [59] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [60] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> [61] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
> [62] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> [63] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
> [64] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [65] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
> [66] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [67] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> [68] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [69] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
> [70] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> [71] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html
> [72] https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> [73] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
> [74] https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> [75] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
> [76] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [77] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [78] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs.html
> [79] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [80] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [81] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-1.html
> [82] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [83] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
> [84] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> [85] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
> [86] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> [87] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
> [88] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
> [89] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
> [90] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [91] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
> [92] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> [93] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> [94] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
> [95] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [96] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [97] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-dp-4.html
> [98] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [99] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@kms_chamelium_color@ctm-green-to-red.html
> [100] https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> [101] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_chamelium_color@ctm-max.html
> [102] https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
> [103] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_chamelium_edid@hdmi-edid-read.html
> [104] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [105] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-non-4k.html
> [106] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [107] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-4/igt@kms_chamelium_frames@vga-frame-dump.html
> [108] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [109] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-6/igt@kms_chamelium_frames@vga-frame-dump.html
> [110] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
> [111] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html
> [112] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [113] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-6/igt@kms_cursor_crc@cursor-onscreen-max-size.html
> [114] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
> [115] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
> [116] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
> [117] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-left-edge.html
> [118] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-9/igt@kms_cursor_edge_walk@64x64-left-edge.html
> [119] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
> [120] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
> [121] https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
> [122] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@kms_display_modes@mst-extended-mode-negative.html
> [123] https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> [124] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp5.html
> [125] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3422
> [126] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@cd-hdmi-a6-dp5.html
> [127] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
> [128] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-4/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> [129] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
> [130] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_flip@busy-flip.html
> [131] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_flip@busy-flip.html
> [132] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [133] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [134] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> [135] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
> [136] https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> [137] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> [138] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> [139] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
> [140] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [141] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
> [142] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html
> [143] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> [144] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
> [145] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> [146] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> [147] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html
> [148] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
> [149] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling@pipe-a-valid-mode.html
> [150] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> [151] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html
> [152] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [153] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html
> [154] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
> [155] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
> [156] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html
> [157] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
> [158] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
> [159] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
> [160] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
> [161] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> [162] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
> [163] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
> [164] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> [165] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-9/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
> [166] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> [167] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_frontbuffer_tracking@basic.html
> [168] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
> [169] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [170] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-mmap-wc.html
> [171] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [172] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
> [173] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
> [174] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
> [175] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [176] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> [177] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-indfb-scaledprimary.html
> [178] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [179] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> [180] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
> [181] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html
> [182] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [183] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-onoff.html
> [184] https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> [185] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
> [186] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [187] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> [188] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
> [189] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-blt.html
> [190] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [191] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
> [192] https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
> [193] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html
> [194] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [195] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
> [196] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [197] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [198] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-9/igt@kms_joiner@basic-force-big-joiner.html
> [199] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
> [200] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
> [201] https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> [202] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_plane_lowres@tiling-y.html
> [203] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [204] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [205] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_plane_scaling@intel-max-src-size.html
> [206] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_plane_scaling@intel-max-src-size.html
> [207] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2685
> [208] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
> [209] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html
> [210] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [211] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-1/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> [212] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [213] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-d.html
> [214] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [215] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [216] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-b.html
> [217] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [218] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html
> [219] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
> [220] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@kms_pm_dc@dc5-psr.html
> [221] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
> [222] https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
> [223] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_pm_rpm@cursor-dpms.html
> [224] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_pm_rpm@cursor-dpms.html
> [225] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
> [226] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@kms_pm_rpm@modeset-non-lpsp.html
> [227] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
> [228] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
> [229] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
> [230] https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
> [231] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-sf.html
> [232] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [233] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
> [234] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
> [235] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
> [236] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [237] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
> [238] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [239] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-4/igt@kms_psr@pr-sprite-plane-onoff.html
> [240] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
> [241] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-2/igt@kms_psr@psr-basic.html
> [242] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
> [243] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [244] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_psr@psr2-dpms.html
> [245] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [246] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [247] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_rotation_crc@bad-tiling.html
> [248] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> [249] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> [250] https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
> [251] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_writeback@writeback-pixel-formats.html
> [252] https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> [253] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> [254] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
> [255] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [256] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
> [257] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> [258] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-6/igt@xe_eudebug@basic-client.html
> [259] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [260] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-1/igt@xe_eudebug@discovery-race-vmbind.html
> [261] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [262] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@xe_eudebug@sysfs-toggle.html
> [263] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [264] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@xe_eudebug_online@resume-dss.html
> [265] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [266] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@xe_evict@evict-beng-mixed-threads-large.html
> [267] https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> [268] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-large.html
> [269] https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
> [270] https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
> [271] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html
> [272] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html
> [273] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> [274] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@xe_evict@evict-threads-large.html
> [275] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-5/igt@xe_evict@evict-threads-large.html
> [276] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
> [277] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
> [278] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
> [279] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [280] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
> [281] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
> [282] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
> [283] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
> [284] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-6/igt@xe_exec_fault_mode@once-basic-prefetch.html
> [285] https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> [286] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
> [287] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [288] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race-imm.html
> [289] https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> [290] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
> [291] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@xe_live_ktest@xe_bo.html
> [292] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
> [293] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
> [294] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> [295] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> [296] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@xe_mmap@vram.html
> [297] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
> [298] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@xe_module_load@reload.html
> [299] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_module_load@reload.html
> [300] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [301] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@xe_oa@mi-rpc.html
> [302] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> [303] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@xe_oa@mmio-triggered-reports@rcs-0.html
> [304] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
> [305] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@xe_oa@syncs-syncobj-none.html
> [306] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> [307] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@xe_pm@d3cold-multiple-execs.html
> [308] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [309] https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> [310] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
> [311] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
> [312] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
> [313] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
> [314] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_pm@s4-d3cold-basic-exec.html
> [315] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [316] https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> [317] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@xe_pm@s4-exec-after.html
> [318] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html
> [319] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> [320] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> [321] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html
> [322] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
> [323] https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> [324] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html
> [325] https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> [326] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@core_hotunplug@hotreplug-lateclose.html
> [327] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
> [328] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@core_hotunplug@hotreplug-lateclose.html
> [329] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@core_hotunplug@hotunbind-rebind.html
> [330] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
> [331] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@core_hotunplug@hotunbind-rebind.html
> [332] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@fbdev@write.html
> [333] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
> [334] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@fbdev@write.html
> [335] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> [336] https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
> [337] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
> [338] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> [339] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
> [340] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
> [341] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> [342] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
> [343] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
> [344] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-180.html
> [345] https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> [346] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-180.html
> [347] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> [348] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> [349] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [350] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
> [351] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> [352] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
> [353] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> [354] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> [355] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
> [356] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
> [357] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> [358] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
> [359] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
> [360] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> [361] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
> [362] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> [363] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [364] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [365] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
> [366] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> [367] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [368] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
> [369] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
> [370] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
> [371] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> [372] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> [373] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [374] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-256x256.html
> [375] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> [376] https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
> [377] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
> [378] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> [379] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
> [380] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
> [381] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> [382] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
> [383] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> [384] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [385] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
> [386] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> [387] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
> [388] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
> [389] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> [390] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> [391] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
> [392] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html
> [393] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@bc-dp2-hdmi-a3.html
> [394] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
> [395] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> [396] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
> [397] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-dp2-hdmi-a3.html
> [398] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> [399] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
> [400] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
> [401] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html
> [402] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible@ad-dp2-hdmi-a3.html
> [403] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-1/igt@kms_flip@blocking-wf_vblank.html
> [404] https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> [405] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_flip@blocking-wf_vblank.html
> [406] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
> [407] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank@d-hdmi-a3.html
> [408] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-4/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html
> [409] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
> [410] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-2/igt@kms_flip_tiling@flip-change-tiling@pipe-c-edp-1-x-to-linear.html
> [411] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> [412] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [413] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [414] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
> [415] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> [416] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
> [417] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
> [418] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
> [419] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [420] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
> [421] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
> [422] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
> [423] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
> [424] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_lease@invalid-create-leases.html
> [425] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [426] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [427] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_lease@invalid-create-leases.html
> [428] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_plane_cursor@viewport.html
> [429] https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> [430] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html
> [431] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> [432] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
> [433] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
> [434] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
> [435] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
> [436] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes.html
> [437] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html
> [438] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
> [439] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-1/igt@kms_pm_rpm@universal-planes@plane-59.html
> [440] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@testdisplay.html
> [441] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [442] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@testdisplay.html
> [443] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@xe_drm_fdinfo@utilization-others-idle.html
> [444] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
> [445] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-idle.html
> [446] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_balancer@once-parallel-rebind.html
> [447] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [448] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@xe_exec_balancer@once-parallel-rebind.html
> [449] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> [450] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
> [451] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
> [452] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_module_load@reload-no-display.html
> [453] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [454] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_module_load@reload-no-display.html
> [455] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-2/igt@xe_pm@s4-basic.html
> [456] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
> [457] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> [458] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-5/igt@xe_pm@s4-basic.html
> [459] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html
> [460] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
> [461] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
> [462] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
> [463] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_pm_residency@toggle-gt-c6.html
> [464] https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
> [465] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
> [466] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-6/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> [467] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
> [468] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
> [469] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
> [470] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> [471] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [472] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@xe_vm@mmap-style-bind-either-side-partial-hammer.html
> [473] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> [474] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [475] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [476] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
> [477] https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
> [478] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> [479] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [480] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
> [481] https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> [482] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@linear-64bpp-rotate-270.html
> [483] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [484] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [485] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html
> [486] https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> [487] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> [488] https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> [489] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
> [490] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [491] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> [492] https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
> [493] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
> [494] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [495] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [496] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> [497] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> [498] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [499] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
> [500] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [501] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> [502] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> [503] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [504] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
> [505] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
> [506] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> [507] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
> [508] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> [509] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [510] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> [511] https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
> [512] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
> [513] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [514] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [515] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> [516] https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> [517] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
> [518] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [519] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> [520] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [521] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html
> [522] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [523] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> [524] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [525] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [526] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
> [527] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [528] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> [529] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
> [530] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
> [531] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
> [532] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
> [533] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> [534] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [535] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
> [536] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [537] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> [538] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
> [539] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
> [540] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [541] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [542] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
> [543] https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
> [544] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html
> [545] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [546] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [547] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> [548] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [549] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
> [550] https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
> [551] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> [552] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [553] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [554] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
> [555] https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> [556] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> [557] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [558] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [559] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
> [560] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> [561] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> [562] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
> [563] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
> [564] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [565] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [566] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> [567] https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
> [568] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html
> [569] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [570] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [571] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> [572] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [573] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [574] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
> [575] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [576] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [577] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> [578] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [579] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [580] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
> [581] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [582] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> [583] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [584] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
> [585] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> [586] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> [587] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [588] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [589] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
> [590] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [591] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [592] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
> [593] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [594] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
> [595] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [596] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [597] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> [598] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
> [599] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [600] https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
> [601] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> [602] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
> [603] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
> [604] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [605] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> [606] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [607] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [608] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
> [609] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [610] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [611] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> [612] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [613] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [614] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
> [615] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [616] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html
> [617] https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
> [618] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd.html
> [619] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [620] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [621] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_content_protection@atomic-dpms.html
> [622] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [623] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [624] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
> [625] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [626] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_content_protection@dp-mst-type-1.html
> [627] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [628] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [629] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
> [630] https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
> [631] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
> [632] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
> [633] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
> [634] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [635] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [636] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_content_protection@lic-type-1.html
> [637] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [638] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [639] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_content_protection@lic-type-1.html
> [640] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [641] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_content_protection@uevent.html
> [642] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
> [643] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_content_protection@uevent.html
> [644] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [645] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [646] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> [647] https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> [648] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
> [649] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [650] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [651] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html
> [652] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [653] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [654] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_cursor_crc@cursor-random-512x170.html
> [655] https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
> [656] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> [657] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [658] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [659] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
> [660] https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> [661] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> [662] https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
> [663] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
> [664] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [665] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [666] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_dsc@dsc-with-bpc.html
> [667] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [668] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_dsc@dsc-with-bpc.html
> [669] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [670] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
> [671] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [672] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [673] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_dsc@dsc-with-bpc-formats.html
> [674] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [675] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_fbcon_fbt@psr-suspend.html
> [676] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [677] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_fbcon_fbt@psr-suspend.html
> [678] https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
> [679] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_feature_discovery@dp-mst.html
> [680] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
> [681] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
> [682] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [683] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [684] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_feature_discovery@psr1.html
> [685] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [686] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [687] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html
> [688] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
> [689] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> [690] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [691] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [692] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
> [693] https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
> [694] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
> [695] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [696] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
> [697] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
> [698] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend.html
> [699] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [700] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [701] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html
> [702] https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> [703] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check.html
> [704] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3403
> [705] https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
> [706] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> [707] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [708] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
> [709] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [710] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> [711] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [712] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
> [713] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [714] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [715] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
> [716] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274
> [717] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
> [718] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [719] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [720] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> [721] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [722] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
> [723] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [724] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> [725] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [726] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [727] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
> [728] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [729] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> [730] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> [731] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [732] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
> [733] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
> [734] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> [735] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [736] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
> [737] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [738] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> [739] https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
> [740] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
> [741] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [742] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [743] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> [744] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [745] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [746] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
> [747] https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
> [748] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> [749] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [750] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
> [751] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [752] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> [753] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [754] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [755] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
> [756] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [757] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> [758] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [759] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html
> [760] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [761] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> [762] https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
> [763] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
> [764] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [765] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [766] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-8/igt@kms_hdr@bpc-switch.html
> [767] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
> [768] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
> [769] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-4/igt@kms_hdr@bpc-switch.html
> [770] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [771] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
> [772] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [773] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
> [774] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
> [775] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> [776] https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
> [777] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
> [778] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [779] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [780] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html
> [781] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [782] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_panel_fitting@atomic-fastset.html
> [783] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [784] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [785] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-adlp-3/igt@kms_plane@pixel-format.html
> [786] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> [787] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-adlp-1/igt@kms_plane@pixel-format.html
> [788] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
> [789] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
> [790] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_cursor@primary.html
> [791] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [792] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [793] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_plane_cursor@primary.html
> [794] https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
> [795] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size.html
> [796] https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
> [797] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_plane_scaling@intel-max-src-size.html
> [798] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [799] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> [800] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [801] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [802] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
> [803] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [804] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [805] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> [806] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [807] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [808] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
> [809] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
> [810] https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
> [811] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
> [812] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [813] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html
> [814] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
> [815] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_pm_backlight@fade.html
> [816] https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> [817] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_pm_backlight@fade.html
> [818] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [819] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html
> [820] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [821] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_pm_backlight@fade-with-dpms.html
> [822] https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
> [823] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
> [824] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [825] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
> [826] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
> [827] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> [828] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [829] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
> [830] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [831] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> [832] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [833] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html
> [834] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
> [835] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
> [836] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [837] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html
> [838] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
> [839] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> [840] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [841] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [842] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
> [843] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [844] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [845] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html
> [846] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [847] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [848] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html
> [849] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [850] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr-cursor-plane-move.html
> [851] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [852] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_psr@psr-cursor-plane-move.html
> [853] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [854] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [855] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr-dpms.html
> [856] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [857] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [858] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_psr@psr-dpms.html
> [859] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [860] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [861] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
> [862] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [863] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [864] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html
> [865] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
> [866] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr@psr2-basic.html
> [867] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [868] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_psr@psr2-basic.html
> [869] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
> [870] https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
> [871] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> [872] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
> [873] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
> [874] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
> [875] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> [876] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> [877] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
> [878] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [879] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [880] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> [881] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [882] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [883] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
> [884] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
> [885] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html
> [886] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [887] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [888] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html
> [889] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
> [890] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> [891] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
> [892] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
> [893] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
> [894] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html
> [895] https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
> [896] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html
> [897] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [898] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [899] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
> [900] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [901] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [902] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
> [903] https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
> [904] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> [905] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
> [906] https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
> [907] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
> [908] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
> [909] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
> [910] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html
> [911] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [912] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0x369.html
> [913] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
> [914] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfd.html
> [915] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
> [916] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfd.html
> [917] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [918] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_eudebug@basic-close.html
> [919] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [920] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_eudebug@basic-close.html
> [921] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [922] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_eudebug@basic-vm-access-parameters.html
> [923] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [924] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_eudebug@basic-vm-access-parameters.html
> [925] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
> [926] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
> [927] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
> [928] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html
> [929] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [930] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html
> [931] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
> [932] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html
> [933] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [934] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> [935] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [936] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
> [937] https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> [938] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> [939] https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
> [940] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
> [941] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [942] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe.html
> [943] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
> [944] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe.html
> [945] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [946] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_huc_copy@huc_copy.html
> [947] https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
> [948] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
> [949] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [950] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_mmap@small-bar.html
> [951] https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
> [952] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_mmap@small-bar.html
> [953] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [954] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html
> [955] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> [956] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
> [957] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [958] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> [959] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [960] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
> [961] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
> [962] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
> [963] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
> [964] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_pat@display-vs-wb-transient.html
> [965] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [966] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_pat@pat-index-xe2.html
> [967] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
> [968] https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
> [969] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html
> [970] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [971] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
> [972] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [973] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html
> [974] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [975] https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> [976] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html
> [977] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [978] https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
> [979] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
> [980] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [981] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
> [982] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
> [983] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_pm@d3cold-mocs.html
> [984] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [985] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-466/igt@xe_query@multigpu-query-oa-units.html
> [986] https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> [987] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_query@multigpu-query-oa-units.html
> [988] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [989] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
> [990] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [991] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-433/igt@xe_query@multigpu-query-topology.html
> [992] https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
> [993] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-463/igt@xe_sriov_flr@flr-each-isolation.html
> [994] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
> [995] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
> [996] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [997] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_tlb@basic-tlb.html
> [998] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [999] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_tlb@basic-tlb.html
> [1000] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2922
> [1001] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-434/igt@xe_wedged@basic-wedged.html
> [1002] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
> [1003] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-435/igt@xe_wedged@basic-wedged.html
> [1004] https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
> [1005] https://intel-gfx-ci.01.org/tree/intel-xe/xe-2221-169c7cd31a373ed31054abb423981856eb5fb119/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
> [1006] https://gitlab.freedesktop.org/drm/xe/kernel/issues/3421
> [1007] https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141307v1/shard-dg2-434/igt@xe_wedged@wedged-at-any-timeout.html
> [1008] https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
