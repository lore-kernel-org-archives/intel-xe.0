Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B80A4D12686
	for <intel-xe@archiver.kernel.org>; Tue,  5 Nov 2024 11:08:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81D2F10E56D;
	Tue,  5 Nov 2024 11:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IoRYiHtp";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD7A10E56D
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Nov 2024 11:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1730804929; x=1762340929;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Nu8qPyPoWdJXPt/l53FPKogkgLX31blgvpjHckPF8cM=;
 b=IoRYiHtpkJNsVYX5dZ/R+OWjJP2M3mTQw+t3HzL+BFpC96j2D+XTVFow
 JvY6giSbRIcLrezMW4NylTAOHHrpXY6+rasjbuC+9/tT2Ropko+7KOcK7
 56WtzIAqw9A6/G6xwmPrefhoUCQCmmkRUPiOX/itC/T+m2oO5/IaLysoN
 vB75qf6dMKQD8skDZv+Y+WltfO5raaRZqLSUJIbVXt5ZusokapDg8jI1w
 0R8nNcvnUg/BtOGRKWfvdk7elrrLGSM1LualdEfAxOrkoY6lioi5KIQLD
 dgPXUBAK+5LxXEOs/xbdz1vNJKI0ThUYtCEj5JfPnyOX2pW3S609uwTO8 w==;
X-CSE-ConnectionGUID: 5ovRY32sQIafhind8c6WqQ==
X-CSE-MsgGUID: NgZcrBDaTIa6z1kRF93FvQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="30655383"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; d="scan'208";a="30655383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2024 03:08:49 -0800
X-CSE-ConnectionGUID: QoIfS9YGRcSMiNW8J72zEg==
X-CSE-MsgGUID: +IusSc8WQ+K2DwrE+ugfZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="88748261"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Nov 2024 03:08:48 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 5 Nov 2024 03:08:47 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 5 Nov 2024 03:08:47 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.171)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 5 Nov 2024 03:08:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CfZxTmw2wFFr6WcgXjMSjhklCrM02Ug/DcZtgU+u7IKx8qXXciNHRhFB4bDvN0Rxc0jaEQYUXFbG/9FjqadT+n2dFysDjt1jNdMS50pMdIGx0dObQJsYJUPbs3r8hpPPbsPwzuSuR1xD/km0kv2u1sGHIT/RQaZ6ZsDJcNJ06h34bo9OUJc6jwziiRu7UU6IXdmD9pTAWofUm7vkMH1lppwy+QlAkCg9C+Kd5cd3ru//uE54qAXQ1mW6335SDs9ia/QtRDQaXCGt8z3mSzh/8ejsE2pqP+aNGUpEYaJ5Lhqpq5pKFyKIeMpZDXXrA/89eNJHa14Ytq5SEr9JiXpusw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlUYOr4ulghoUSdRNzgImgP1UgEl0uQ0dncipFLQ88U=;
 b=sTyYao5m+Zca+BsXp0QD9T3tkbOX8RHNcjgPF0dKY7Dzsqvr7cXzKnXMF9ApIv9nCCiQVcAfke94iVTngc1TyW2vIG6f4diSYRSESvDdnrgShSP9WUnXTnPbHH0vEGit+be69QHss5Y2BErv5ku+eYB2sR/QiVPITbjgU7D2M1rFDZEVlSPHfOA9uMKSMDKCLoPG2NdR/2wI/Mq3CXCpFchjvM8SNP0QQJlgaEXHStDctX8cI59RYD2b/Xq5A2GnM116kyjQF/VdPuyxM9xC891bjUFlMI794gLudO9SQaDBga9zmkcar0mZIk2c2HipcJOc0bIM/DB4oTZ5s2DVCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by DM4PR11MB5310.namprd11.prod.outlook.com (2603:10b6:5:391::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.19; Tue, 5 Nov
 2024 11:08:44 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%4]) with mapi id 15.20.8114.028; Tue, 5 Nov 2024
 11:08:44 +0000
Message-ID: <7e7c834e-bd88-43c6-8be2-aec8958da04f@intel.com>
Date: Tue, 5 Nov 2024 12:08:40 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/xe/pf: Allow to view and replace VF LMEM and
 CCS state over debugfs
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <michal.winiarski@intel.com>,
 <michal.wajdeczko@intel.com>
References: <20241031151725.28315-1-lukasz.laguna@intel.com>
 <20241031151725.28315-5-lukasz.laguna@intel.com>
 <ZyOqkrGAzX1q5v1C@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
In-Reply-To: <ZyOqkrGAzX1q5v1C@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MI1P293CA0009.ITAP293.PROD.OUTLOOK.COM (2603:10a6:290:2::6)
 To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|DM4PR11MB5310:EE_
X-MS-Office365-Filtering-Correlation-Id: 13b16435-a038-44e1-6ce6-08dcfd8a3664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkZqWUxWTERPbS96RkVQaTl6ZEFtMlRpQ2tta29vRk1pbjZaNXN6N2xSd0RC?=
 =?utf-8?B?eFFiNTVnV3BWK2k1NWFoMm5NVFBLYUlZN1J2QVhwYjAvTmVZUmhzUUMrMGYz?=
 =?utf-8?B?eVBndXdINkJtVDNhUDdhRnVKaGlabWlyUi9ubWdDTllnMjR2c1ZEb25zN2ZR?=
 =?utf-8?B?eXNiUEI5UUVRNDRaNEY2OGlzb0xvSm5jVEd5TGt2eVVVOEhRd0ZMOXZKRHRw?=
 =?utf-8?B?V2VGanI4cG5nMFRTY1lLMEo4Z0dmeXZJNkRKZUppb0pJMy9mMGZsS2pvRTBh?=
 =?utf-8?B?MzFzeEt0RFRvRzl4a21TOWVhNDRXQkxzWDZBWUxUT0JSZDhXQmR5cDVqVW8x?=
 =?utf-8?B?SlVjUStzWkd4TUQ0Vnh1MStyZlZxL3lES284aFJKWHpEbTVWVlpNK3A3MzZp?=
 =?utf-8?B?QkJITVhYSEh4amVrRWhEdnBFUU1zWEdMSUpIVk5WZ01VcnM4RXhZVUJpUWFa?=
 =?utf-8?B?NGxSQzREUERydE95dmRGNE5ndGZlbDNVVE5PRkZHc1VVOW51SXdFaHUrd2ZY?=
 =?utf-8?B?VFk5WUthUEpXd041UGJRTVRSa3ovb1FjQWNQMnc1NVRHZkZ4anQwdXJmZmZV?=
 =?utf-8?B?cy9KZmh2RzdEVEl1WU9kUjBCTHRCcVhaQThBTGcwbnBUbmhzd1pBRmE1M0Jw?=
 =?utf-8?B?OEU4U0JBU3I3RXZ5ZmFwRmcrT2JIdEVRMVdVcW54cXQ2djVEWmxpUW1TbVFF?=
 =?utf-8?B?N0M0dU1UdE0rYytUcExBczdUbTlUMDFDNHlGWldoSFIrRnY0ZnlrL0VCMGFV?=
 =?utf-8?B?eHZhQlBONUVvN0N0ZjNQVmVrRk00L1owNlBqdHpSNlVKdjJORlFCYVoyMElY?=
 =?utf-8?B?UUswZ1laRFd0eEI0Q0RnZXQwaXIwUVZMMlZhZFF4ZFlxcXlVYmRHckpvT3RD?=
 =?utf-8?B?UDlWSW81NEFNNXFMNHJhRkVBV1hhSERuV3czS3ZnUTlYd3RjRkVkeFRQSFFi?=
 =?utf-8?B?Vi9kWjZJWUhBQmVuMStqaGEyb0pHM25WRHVKdEZRd2xqQVE3WjZwTTRpL2pp?=
 =?utf-8?B?RWxoSXpMVzdRUDJzeVpiTFhZeDBqei9iRXBYQWZsQlBLVkZiZURsT3pGaHRw?=
 =?utf-8?B?VzluWXo5di9uK3dCSEgzWFR2cFF2ZDM3WnE5Zm13am5LMEN3VGxVWFIybUtF?=
 =?utf-8?B?OU5oQ080SUFYc0NsZGRzMEJCZ0Q4d2NSMk1ERlhaamU2UEZqQ0pXbEVWRzFK?=
 =?utf-8?B?SDlsemhIWHh1cjVjV2szbDBmcXBqS1N1bVRmVkt5aFF5RkZCTzFmSTdXdytr?=
 =?utf-8?B?bUV6UVUyM2l5MXlOLzBWTVk4Mk94bG0yeWFxZEdFdDZKWVRGcDhQMkxTeDNt?=
 =?utf-8?B?Y1VlQnZDMWtQQmRWcTZOVi91Wm1jbklBS21CV1djYUlVQ2MrUmRBWVhicGVu?=
 =?utf-8?B?TVo0ZjN3OTh4N0IwR05adnRxeTdqSEJZbkdLWkhWR1RYYWxNVlVlWWg3YmRy?=
 =?utf-8?B?bTlSVnJ1aHVwQ2w2ZkNuTEJaZkh4ZkdnVkxLWVpQdVJuLzJDTEwrN2VIMFNU?=
 =?utf-8?B?ZjhPNnZJeFRkbXRnYURlZ05KQVkramVBOVQ1VnZNWlVNMHNZVEVWdmR3Mk16?=
 =?utf-8?B?UXRDeEJJamlNK1ZYRkE1WjVkNlQ5L24zbUUzcEdjSm9IZERHMU5qbndiQUM5?=
 =?utf-8?B?emw2Vk5RcVlxQ1YxNjhKVGxwWG4rUTJYVDNiYnZDQ0ZhOGN2dXEyQkVxMjJz?=
 =?utf-8?Q?eQyegGIK9bv+A2TiuUUO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V1IwWGZjeWp5UVphQU8zY3FGMEVOSFdCUG1TelBvK2wzWTJSQ0ZWWEN1S2kr?=
 =?utf-8?B?MkV1dSs4VGsyUkFrQ1JldksranZXZXdNejJqdUF4QW42YVpKSXlsWnVCYU1M?=
 =?utf-8?B?ak40a0VGV3FEMEhZc1NLU1hkaFhIdUFoV2hYR3hJWXZORzlwQk10UFloc0Mr?=
 =?utf-8?B?ODYvYjIzWlFMNXhFWmdYUjkwT3RhMC9aN1NiMklZdzI5TXRRTXZxbGkvWkty?=
 =?utf-8?B?NnRxdzRDc2wyeGhVdWZ4cHVBU1kybXBudFQ3aFV5L1V5K2RaMmZsR2wvOWxX?=
 =?utf-8?B?VTFvZ201d1ZDMUlGOXlQWjFKOExPcnBvS0NRT0V4bHBrM2tJek9UbDV5OGFI?=
 =?utf-8?B?NlU2aVRaU1NaRVpjQ2lZbmpqY01RQkcwZElUY2VleXpBcFErM1RTaUdmckx3?=
 =?utf-8?B?S0FjVGJXMTNRNFVnMDJBUmtHSGI5dSs3dVdTNTUwVmQrQllkNW5xeDFiTlQz?=
 =?utf-8?B?QldETHhjRGMxUCtVb1FiZng4OW9nVmZwelQwbkl3TjdrdFJ4N0ZYajU4bkl5?=
 =?utf-8?B?WjBrM0xQTjhiLzFyMEZYTnRhdFp4MDdpUkcvalB5SytlSzlJZ0w5MkdXaEZh?=
 =?utf-8?B?aE90dzlKMUVGNkR1cDl5a0VLMVcyblVCcnNzQzEyRUZycXdJckU3WkpOblR2?=
 =?utf-8?B?UmJUdmVYMGd1OC93dkl3WW83cFd0dklkcU9BcGZvWnJTdmJIV1FseGwxYlR1?=
 =?utf-8?B?bzJPNWd0TTIwZjhWRkxscGwvMmtVdzkyWEVlTi9DMzdaY0ZMbytFbGUwN1lH?=
 =?utf-8?B?b2E3cDBvaktSRWt1K1VKRFpaYmhOUkdkeHBPQ2EveWJpZHBkQUFPTnA3aGk4?=
 =?utf-8?B?WWxZcEw1dlVVc2UweFI0TEQvSCtpRFZ5amV5Sklma2FVNXBwWkNPVktoYlhL?=
 =?utf-8?B?bEtSSjVSRWp4c1ZCemFqQzdiL3pEclFseHZveHV5dG0yMWxTeXBMVGdnU0VB?=
 =?utf-8?B?Y2l0Mi9ubjlCMmlVeitZQjR6TnNueTB4dXQ4aW1CSUt6QzhCL3NQamVENlFj?=
 =?utf-8?B?aGRueGNDQ3JhMy90TE0zcXV1ekNvcjRnS2Z3MlloWWdINUUvQjA0L2dhbTdl?=
 =?utf-8?B?aWFEc1BxSTBkV1FLOXZEMDZlT0QybW5DMkhlQ05XaExMMUF3SFVZNFh5ajc2?=
 =?utf-8?B?QzlTOFc4Nk9JM2NMVXVUOTIzWTAvQmRCRDBpaTBBaUdPVGdSNGJKWWFjajk1?=
 =?utf-8?B?TnhiRUlDaWE3MDc1MnAzRFBWR20xbnUxb01ueXgxU1lZa3BhWG5Ob0VaV2pn?=
 =?utf-8?B?OE5tUVJFbjZadjJEendTK3F1S0ZVT2UrUTVJTnptR2RNZXVFeEpsK041S2pT?=
 =?utf-8?B?TlBmLzBTWjhmQVMvYnFQajlibzVzSnMxVzUybXF6UWpyNGlzT1BxWEJpMThR?=
 =?utf-8?B?QTNvVFlKZU9XZGNTUlUxQWh5cmU1WWYvQVVRYUM5N0Q3MEI4bnV0NzJXRnFB?=
 =?utf-8?B?VlloTUVXblIrNzUwa0ZwNkQ3NXVreWJiMS9rYjJQaXNWMW5ya21TWllFMWFK?=
 =?utf-8?B?bVo1M2lidEl6YWwxam85SzBQdHpSUUFxbzgzSk5yQ1pVd1B1bnlNQ1I4aFFG?=
 =?utf-8?B?OTlVL0t3bVFBVUFON0J6L2d4amMzUm5Ia0ZjMGNJUVdFeDBwdmJObFVOZWZL?=
 =?utf-8?B?TjF0NmdNcDhpWGxQY0d5bnRwMmFzaTBDYnhFUko2T3JGRlJ3d2xTcDlpZ3JB?=
 =?utf-8?B?dWFLcFFTWUpmOUxEQ291TkFWMzNkR09HSEtqZDhPS3JHaitHYmV2czd2Sk11?=
 =?utf-8?B?ZElCaGppbThsL1Y3ZC93OGFrUzNCRkt0QXFDV0Roc1NBZ2lKalVHSEJuYXB1?=
 =?utf-8?B?VkxpRVlkSVEwaFZUNXhNaXRhVXlYS3BjbmxFL1JHSnFlbk5SQTR4ZCs3SEMy?=
 =?utf-8?B?bTVIRHVFdlVUNmpCNlB1bzJZdmNOeHRNNnhlL2xQelBxc0JxdXV5bFdJS2ht?=
 =?utf-8?B?QXhJUW1TQ3Rxajl1RDI0cUZ6MDlpVlhkKy8vZWlUeStTbCtBYzdYanNEdHor?=
 =?utf-8?B?NU92NnJSOXRocmhrTTY5azAzYjgwK0pqZVNQcDhUQ3c4MEw5dU56YUZTei9U?=
 =?utf-8?B?ODhQbldiMDhjUkdYUWFJMDY5M3BVQ3V6VGNNNlZickJJS2VjV2Jwa3R3Z3BJ?=
 =?utf-8?Q?hNzDZCciBhk3v6lLmEWYZCsHy?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 13b16435-a038-44e1-6ce6-08dcfd8a3664
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2024 11:08:44.1634 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x94BMTWl2XY2H6rX+lnAulVki7KcR9qy2iP5Je/H+OBmZtsGFlEgVLALpno5mDOUQ7l2BwG0prTMxL8egmT4vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5310
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


On 10/31/2024 17:04, Matthew Brost wrote:
> On Thu, Oct 31, 2024 at 04:17:25PM +0100, Lukasz Laguna wrote:
>> For feature enabling and testing purposes, allow to save VF LMEM and CCS
>> state and to replace it using debugfs blob file, but only under strict
>> debug config.
>>
> This patch resembles a function I'm adding to support BO access to and
> from a void * for EU debug and general kernel use. Here is a link to the
> series [1]. It utilizes the GPU for non-visible VRAM access and large
> transfers, or it uses the CPU when possible. It doesn't have CCS
> support, but to be honest, I don’t fully understand CCS, so it may be an
> omission on my part. Either way, I think we need to synchronize and
> develop a common approach for BO access in TTM/Xe, ensuring it meets all
> requirements (EU debug, general Xe use, SRIOV, CCS, etc.).
>
> Please note that the version of my series on the list is not 100%
> functional, but I can share an updated version that should be fully
> tested for non-CCS access.
>
> Matt
>
> [1] https://patchwork.freedesktop.org/series/140200/

The whole point of this patch is to use 
xe_gt_sriov_pf_migration_save_lmem() and 
xe_gt_sriov_pf_migration_restore_lmem() functions, because they will be 
used in future VM save/restore operations. These functions handle the 
transfer of VRAM and CCS data to and from SMEM using blitter engine (to 
increase the performance). As a result, we are only accessing SMEM objects.

>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  78 +++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 205 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h |   9 +
>>   3 files changed, 292 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> index 05df4ab3514b..001fc6b585ee 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
>> @@ -422,6 +422,76 @@ static const struct file_operations guc_state_ops = {
>>   	.llseek		= default_llseek,
>>   };
>>   
>> +/*
>> + *      /sys/kernel/debug/dri/0/
>> + *      ├── gt0
>> + *      │   ├── vf1
>> + *      │   │   ├── lmem_state
>> + */
>> +static ssize_t lmem_state_read(struct file *file, char __user *buf,
>> +			       size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	unsigned int vfid = extract_vfid(parent);
>> +
>> +	return xe_gt_sriov_pf_migration_read_lmem_state(gt, vfid, buf, count, pos);
>> +}
>> +
>> +static ssize_t lmem_state_write(struct file *file, const char __user *buf,
>> +				size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	unsigned int vfid = extract_vfid(parent);
>> +
>> +	return xe_gt_sriov_pf_migration_write_lmem_state(gt, vfid, buf, count, pos);
>> +}
>> +
>> +static const struct file_operations lmem_state_ops = {
>> +	.owner		= THIS_MODULE,
>> +	.read		= lmem_state_read,
>> +	.write		= lmem_state_write,
>> +	.llseek		= default_llseek,
>> +};
>> +
>> +/*
>> + *      /sys/kernel/debug/dri/0/
>> + *      ├── gt0
>> + *      │   ├── vf1
>> + *      │   │   ├── ccs_state
>> + */
>> +static ssize_t ccs_state_read(struct file *file, char __user *buf,
>> +			      size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	unsigned int vfid = extract_vfid(parent);
>> +
>> +	return xe_gt_sriov_pf_migration_read_ccs_state(gt, vfid, buf, count, pos);
>> +}
>> +
>> +static ssize_t ccs_state_write(struct file *file, const char __user *buf,
>> +			       size_t count, loff_t *pos)
>> +{
>> +	struct dentry *dent = file_dentry(file);
>> +	struct dentry *parent = dent->d_parent;
>> +	struct xe_gt *gt = extract_gt(parent);
>> +	unsigned int vfid = extract_vfid(parent);
>> +
>> +	return xe_gt_sriov_pf_migration_write_ccs_state(gt, vfid, buf, count, pos);
>> +}
>> +
>> +static const struct file_operations ccs_state_ops = {
>> +	.owner		= THIS_MODULE,
>> +	.read		= ccs_state_read,
>> +	.write		= ccs_state_write,
>> +	.llseek		= default_llseek,
>> +};
>> +
>>   /*
>>    *      /sys/kernel/debug/dri/0/
>>    *      ├── gt0
>> @@ -554,6 +624,14 @@ void xe_gt_sriov_pf_debugfs_register(struct xe_gt *gt, struct dentry *root)
>>   			debugfs_create_file("config_blob",
>>   					    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ? 0600 : 0400,
>>   					    vfdentry, NULL, &config_blob_ops);
>> +			if (IS_DGFX(xe)) {
>> +				debugfs_create_file("lmem_state",
>> +						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
>> +						    0600 : 0400, vfdentry, NULL, &lmem_state_ops);
>> +				debugfs_create_file("ccs_state",
>> +						    IS_ENABLED(CONFIG_DRM_XE_DEBUG_SRIOV) ?
>> +						    0600 : 0400, vfdentry, NULL, &ccs_state_ops);
>> +			}
>>   		}
>>   	}
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> index eca01c96a348..8ff6b7eebb33 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
>> @@ -6,7 +6,9 @@
>>   #include <drm/drm_managed.h>
>>   
>>   #include "abi/guc_actions_sriov_abi.h"
>> +#include "instructions/xe_gpu_commands.h"
>>   #include "xe_bo.h"
>> +#include "xe_gt_sriov_pf_config.h"
>>   #include "xe_gt_sriov_pf_helpers.h"
>>   #include "xe_gt_sriov_pf_migration.h"
>>   #include "xe_gt_sriov_printk.h"
>> @@ -381,6 +383,209 @@ ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int
>>   
>>   	return ret;
>>   }
>> +
>> +static ssize_t pf_read_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
>> +				  char __user *buf, size_t count, loff_t *pos)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	size_t lmem_size, chunk_size;
>> +	struct xe_bo *smem_bo;
>> +	struct dma_fence *fence;
>> +	loff_t smem_bo_pos = 0;
>> +	ssize_t ret;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, vfid != PFID);
>> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
>> +
>> +	if (!pf_migration_supported(gt))
>> +		return -ENOPKG;
>> +
>> +	lmem_size = xe_gt_sriov_pf_config_get_lmem(gt, vfid);
>> +	if (!lmem_size)
>> +		return -ENODATA;
>> +
>> +	chunk_size = min(count, (ccs ? xe_device_ccs_bytes(xe, lmem_size) : lmem_size) - *pos);
>> +	if (!chunk_size)
>> +		return 0;
>> +
>> +	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(chunk_size), ttm_bo_type_kernel,
>> +				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
>> +				      XE_BO_FLAG_PINNED);
>> +	if (IS_ERR(smem_bo))
>> +		return PTR_ERR(smem_bo);
>> +
>> +	if (ccs)
>> +		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, NULL, 0, smem_bo, 0,
>> +							   *pos * NUM_BYTES_PER_CCS_BYTE(xe),
>> +							   chunk_size * NUM_BYTES_PER_CCS_BYTE(xe));
>> +	else
>> +		fence = xe_gt_sriov_pf_migration_save_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
>> +							   chunk_size);
>> +
>> +	ret = dma_fence_wait_timeout(fence, false, 5 * HZ);
>> +	dma_fence_put(fence);
>> +	if (!ret) {
>> +		ret = -ETIME;
>> +		goto err_smem_bo_put;
>> +	}
>> +
>> +	ret = simple_read_from_buffer(buf, chunk_size, &smem_bo_pos, smem_bo->vmap.vaddr,
>> +				      chunk_size);
>> +	if (ret > 0) {
>> +		if (ret != chunk_size)
>> +			xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
>> +				ret, chunk_size);
>> +		*pos +=	ret;
>> +	}
>> +
>> +err_smem_bo_put:
>> +	xe_bo_unpin_map_no_vm(smem_bo);
>> +
>> +	return ret;
>> +}
>> +
>> +static ssize_t pf_write_lmem_state(struct xe_gt *gt, unsigned int vfid, bool ccs,
>> +				   const char __user *buf, size_t count, loff_t *pos)
>> +{
>> +	struct xe_device *xe = gt_to_xe(gt);
>> +	struct xe_bo *smem_bo;
>> +	loff_t smem_bo_pos = 0;
>> +	struct dma_fence *fence;
>> +	ssize_t ret, err;
>> +
>> +	xe_gt_assert(gt, IS_SRIOV_PF(gt_to_xe(gt)));
>> +	xe_gt_assert(gt, vfid != PFID);
>> +	xe_gt_assert(gt, vfid <= xe_sriov_pf_get_totalvfs(gt_to_xe(gt)));
>> +
>> +	if (!pf_migration_supported(gt))
>> +		return -ENOPKG;
>> +
>> +	if (!xe_gt_sriov_pf_config_get_lmem(gt, vfid))
>> +		return -ENOPKG;
>> +
>> +	smem_bo = xe_bo_create_pin_map(xe, NULL, NULL, PAGE_ALIGN(count), ttm_bo_type_kernel,
>> +				      XE_BO_FLAG_SYSTEM | XE_BO_FLAG_NEEDS_CPU_ACCESS |
>> +				      XE_BO_FLAG_PINNED);
>> +	if (IS_ERR(smem_bo))
>> +		return PTR_ERR(smem_bo);
>> +
>> +	ret = simple_write_to_buffer(smem_bo->vmap.vaddr, count, &smem_bo_pos, buf, count);
>> +	if (ret < 0)
>> +		goto err_smem_bo_put;
>> +	if (ret != count)
>> +		xe_gt_sriov_dbg(gt, "Failed to copy the entire chunk (copied bytes: %ld, expected: %lu)\n",
>> +				ret, count);
>> +
>> +	if (ccs)
>> +		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, NULL, 0, smem_bo, 0,
>> +							      *pos * NUM_BYTES_PER_CCS_BYTE(xe),
>> +							      ret * NUM_BYTES_PER_CCS_BYTE(xe));
>> +	else
>> +		fence = xe_gt_sriov_pf_migration_restore_lmem(gt, vfid, smem_bo, 0, NULL, 0, *pos,
>> +							      ret);
>> +
>> +	err = dma_fence_wait_timeout(fence, false, 5 * HZ);
>> +	dma_fence_put(fence);
>> +	if (!err) {
>> +		ret = -ETIME;
>> +		goto err_smem_bo_put;
>> +	}
>> +
>> +	*pos +=	ret;
>> +
>> +err_smem_bo_put:
>> +	xe_bo_unpin_map_no_vm(smem_bo);
>> +
>> +	return ret;
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_read_lmem_state() - Read a VF LMEM state.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @buf: the user space buffer to read to
>> + * @count: the maximum number of bytes to read
>> + * @pos: the current position in the buffer
>> + *
>> + * This function is for PF only.
>> + *
>> + * This function reads up to @count bytes from assigned to VF LMEM buffer
>> + * object at offset @pos into the user space address starting at @buf.
>> + *
>> + * Return: the number of bytes read or a negative error code on failure.
>> + */
>> +ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
>> +						 char __user *buf, size_t count, loff_t *pos)
>> +{
>> +	return pf_read_lmem_state(gt, vfid, false, buf, count, pos);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_write_lmem_state() - Write a VF LMEM state.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @buf: the user space buffer with VF LMEM state
>> + * @count: the maximum number of bytes to write (in bytes)
>> + * @pos: the current position in the buffer
>> + *
>> + * This function is for PF only.
>> + *
>> + * This function reads @count bytes of the VF LMEM state stored at offset @pos
>> + * of the user space buffer @buf and writes it into a assigned to VF LMEM buffer
>> + * object.
>> + *
>> + * Return: the number of bytes used or a negative error code on failure.
>> + */
>> +ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
>> +						  const char __user *buf, size_t count,
>> +						  loff_t *pos)
>> +{
>> +	return pf_write_lmem_state(gt, vfid, false, buf, count, pos);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_read_ccs_state() - Read a VF CCS state.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @buf: the user space buffer to read to
>> + * @count: the maximum number of bytes to read
>> + * @pos: the current position in the buffer
>> + *
>> + * This function is for PF only.
>> + *
>> + * This function reads up to @count bytes of the VF CCS data at offset @pos
>> + * into the user space address starting at @buf.
>> + *
>> + * Return: the number of bytes read or a negative error code on failure.
>> + */
>> +ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
>> +						char __user *buf, size_t count, loff_t *pos)
>> +{
>> +	return pf_read_lmem_state(gt, vfid, true, buf, count, pos);
>> +}
>> +
>> +/**
>> + * xe_gt_sriov_pf_migration_write_ccs_state() - Write a VF CCS state.
>> + * @gt: the &xe_gt
>> + * @vfid: the VF identifier
>> + * @buf: the user space buffer with VF CCS state
>> + * @count: the maximum number of bytes to write (in bytes)
>> + * @pos: the current position in the buffer
>> + *
>> + * This function is for PF only.
>> + *
>> + * This function reads @count bytes of the VF CCS state from the user space
>> + * address @buf at offset @pos and writes it into a device memory where VF CCS
>> + * is stored.
>> + *
>> + * Return: the number of bytes used or a negative error code on failure.
>> + */
>> +ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
>> +						 const char __user *buf, size_t count, loff_t *pos)
>> +{
>> +	return pf_write_lmem_state(gt, vfid, true, buf, count, pos);
>> +}
>>   #endif /* CONFIG_DEBUG_FS */
>>   
>>   static struct dma_fence *pf_save_restore_lmem(struct xe_gt *gt, unsigned int vfid,
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> index a4301574d92c..da1b067baf56 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.h
>> @@ -28,6 +28,15 @@ ssize_t xe_gt_sriov_pf_migration_read_guc_state(struct xe_gt *gt, unsigned int v
>>   						char __user *buf, size_t count, loff_t *pos);
>>   ssize_t xe_gt_sriov_pf_migration_write_guc_state(struct xe_gt *gt, unsigned int vfid,
>>   						 const char __user *buf, size_t count);
>> +ssize_t xe_gt_sriov_pf_migration_read_lmem_state(struct xe_gt *gt, unsigned int vfid,
>> +						 char __user *buf, size_t count, loff_t *pos);
>> +ssize_t xe_gt_sriov_pf_migration_write_lmem_state(struct xe_gt *gt, unsigned int vfid,
>> +						  const char __user *buf, size_t count,
>> +						  loff_t *pos);
>> +ssize_t xe_gt_sriov_pf_migration_read_ccs_state(struct xe_gt *gt, unsigned int vfid,
>> +						char __user *buf, size_t count, loff_t *pos);
>> +ssize_t xe_gt_sriov_pf_migration_write_ccs_state(struct xe_gt *gt, unsigned int vfid,
>> +						 const char __user *buf, size_t count, loff_t *pos);
>>   #endif
>>   
>>   #endif
>> -- 
>> 2.40.0
>>
