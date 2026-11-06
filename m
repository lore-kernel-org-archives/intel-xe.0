Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CA2606A329
	for <intel-xe@archiver.kernel.org>; Fri,  6 Nov 2026 20:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dprobD6x
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 612A689864;
	Fri,  6 Nov 2026 20:16:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2A4112FE0
 for <intel-xe@lists.freedesktop.org>; Fri,  6 Nov 2026 20:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793996194; x=1825532194;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=D/k7ssxZA0zAvbxC8O4fdYMvmszPQMExvuwoeEsJPM8=;
 b=dprobD6xOLsDRwHpgT+iTDSTWj572QnmUa2DEzqBkN6TxByCaFT4Csjp
 /tx1gh6W/TpGf5cK9M7xnykxkCeVLtC4MvOXfQGedKNH4dW/hM4Zv7Qsb
 Zi1ihEQIdVPMbRBT/tDuu/IoZC8+vFu//MBC6C/itSGzSO8hzspXBDT+p
 b2bfTmI0DP5ARN7WBCH2AKaLuRvVcTMFkusnXEcYXu34fJCuH/waTVQbI
 NP+VipJ9VFaEn817VGa/jSGEFt7WfMuMTjksIdWbjc2H6GaK7vUT6kKVi
 pig6tZCqki17jOGpZTrraJFAbB3hknSaN5VlgkorRESWbDteJ2gbQXIHm Q==;
X-CSE-ConnectionGUID: ypalrGtlShWF0YJ6IvVSjQ==
X-CSE-MsgGUID: gCWU8drXRoyeNvmw7dW9SQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2696260"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2696260"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 12:16:34 -0800
X-CSE-ConnectionGUID: /eUXZ6ljQ0Gqe5JEJst/Vw==
X-CSE-MsgGUID: Y0oUBSq/Q/yWwYgMA3B+bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7682805"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Nov 2026 12:16:34 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 12:16:33 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 6 Nov 2026 12:16:33 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.68) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 6 Nov 2026 12:16:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXl72UIWTkq5Gn7gHeMs1ERdZj939Ye0tCCaVdp03wXtNV3zI5gRqRDTSSKJSk7xR2VP5mkdZm6RRBOf07wTOukd3SJd1hSg00lT1CzaHXcfzoIYSlLTQjS8vFQugIzKOPCa07WNBD6aN9UBcsPK8vtN5EgFY4Vt6r57GhP+vyy6jgznGcbz29/8d7Y94JLws5oPYVpfv67UgdctCoEnPCRHcU0as6a6j6lJqiEszMddWE9dc5Mpt3p+BupzKUz7CzXyhrVXoVtEiX2LDfygoKPUcdRYP+05DIXdirw7SpvH0IpCngSWEeg+UIVV5qRgQ1i3ocLiuQBPHjXggia+wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vj8nZsTLMi30DQvKfPaT7j5vKk8wB9/xBZ76A0Pb74o=;
 b=dS3HHSHH62nPOoaF2Qae2zBGOPpieDwryGR+UqP/zpjT5ZqGMrB+EypxSkf3PXq5UeG75u2mV8FbPiZwnfIdxZyyzNFVy9kFx7ZQWLR9izw9AM2k/Yuu/suwNvGAcjtzUspQkSXqOokcVSG0gNi1SpaNWNn7sWmqLB9J5Px0Jc0FX55FDsL8HKGPalAKBN7oLP8XRqTW1E0KGcxly8apZCJo5wOGKE0gJRwOIzWO9/IsFo4qAtww5AEBTjaZJtM7JSZKpaPVYWg65/t6UDZGr1oIn2dIKGLpNTyhYzsMZnMeE3+ed8hPIDKeZ2dPNycI/GTXavrgxcYJUUuaoYI7Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by LV8PR11MB8584.namprd11.prod.outlook.com (2603:10b6:408:1f0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.11; Fri, 6 Nov
 2026 20:16:32 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0592.009; Fri, 6 Nov 2026
 20:16:32 +0000
Date: Fri, 6 Nov 2026 12:16:24 -0800
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/xe3p: Bump offset for PPHWSP software scratch area
Message-ID: <au41mDWU61QArm5y@soc-5CG1426VCC.clients.intel.com>
References: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261106-xe3p-bump-pphwsp-scratch-v1-1-d1b3e64a4e0a@intel.com>
X-ClientProxiedBy: MW4PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:303:b8::12) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|LV8PR11MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: a9d98d83-54c8-4a70-6b9f-08df3c42d916
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|261009223027099003|261022113327099003|261021123027099003|261022105027099003|261022075727099003|261021121427099003|261102123227099003|261102124527099003|261026140227099003|261026121527099003|261028144727099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: Qu5Mfbk0G/+cUe5jJR7gTSKMQXkOIs+tWmQGbSCi/vfvDsvpJUNfz6qOPB7CfR0/JdR6Mzx25PrEVf5PpcZZaAsivXRbP2Kb7U9NfWfOCTwYca13JtPY5YGUp+Y0Jwb9IPGZF5L2otu2m0tQ7jcKm/b5HZ8CEm3fevngYsuPaA0BvGZH9Xfcx7U3e8MDExmMC40LMzlVzmm9zuJRfDxkYLmiVFyLM5tFM4Tm8d+RbMx92SCP7bV4JN8MxWdgE8uiHWGpdv/+GPnHGuAO71skeMVZmvdHLFLSv4xYuH0+IiQWxyQ4+t/P0TNKHYtgssLWWbLb8vP2OzHAxDAGT5Gtx16YLv+fyPuj32T/B4PO5TR/Mu3kF1QmEXIpPGK8FAWmngwL6+HZRvrFQT02mGouKD2AHUTq6d6H8ysLjN2xaokUizbLED0AYg0k+MzPvwWDkSqHr6jzVJXKCkSA7uoTrPTIcvrooc/OguZ7gMzu6jb4Bjh+omD1r8HFoWvg664sfdZ1gGQf8t0AVRNhizizdi+PbcORKVidZye/DiCkGOrPNC6Yh4vwIL9+iP2Jrhun6OmNO8Ndpc290m9FokUFIAFcvhpVDpJ2lkYcu5fgl4J1PBOq+O9sySGcp3Dhw7YknFVPy32PFK89JoaBiRhw1uBHqfsk2ro+xuBUdH4DudQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(261009223027099003)(261022113327099003)(261021123027099003)(261022105027099003)(261022075727099003)(261021121427099003)(261102123227099003)(261102124527099003)(261026140227099003)(261026121527099003)(261028144727099003)(10067099003)(18002099003)(22082099003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEJFRTBiTlZFQzhFZE9rUHVvSjVYdDdRQUtVTkRtKy84dER6S0hCQWxtZTh3?=
 =?utf-8?B?ekVxTGZMVjBsTVZtL0txcnVkTnB2ZVJZZ0xNbUdiS2ZzQ1F2S2VMUjhKa0tM?=
 =?utf-8?B?eU9kZXBEdkRNZEpVNmJidERwUnpwRXNqUU9qRFd1K2RkV3A0Vk5oVUVwU3lj?=
 =?utf-8?B?TlFhb0NEeFJoejhKL1pxcEJ6SFoyb0N4bC9oSVVxM09kWkdkZEhkc01QdGtZ?=
 =?utf-8?B?ZE1GK3l4MVBuL3h0cjJwOWlManR1cS9ZTkJIWlNhUFhVWFlNSk1UQVpVUGh2?=
 =?utf-8?B?dDdUU2FTa3ltd25ub0Z4dnlYbC96QW5SU3VqL3U5Rm85em5NYWJ1b3J3V2xq?=
 =?utf-8?B?NTdXREJWVkphanB5dEg1R1RVb0VJTmhLR2ltMVJkMktTaVJtY3lxM0hBTW9w?=
 =?utf-8?B?SXRDc1dkazNzTDhpeE9FN0xBM3RUMXFoNUxXT05uZnU2cUxlZnZ1SFQ3VFh5?=
 =?utf-8?B?cDIwZkdDZjc4MkxaakpzZkVrd1hZeGY4Z3lZc0JpT3lwQnlvRUlPcENiS21o?=
 =?utf-8?B?dXk4RzlvT0hiTWNaOFQ5ZmFOTXMvZ3dRVFUyaXloK2psTHl0WWpMOEo5dDRv?=
 =?utf-8?B?RVpqbHB2Vi9oRXdSK0dWb1psanJYMFdHRkNHQmFqaFJLOUJjZjRhQ0lVZENG?=
 =?utf-8?B?RURhL3YyLzJaWU0velJidHVqK2VEejVVRHhnTUZWMDZnR0pxQ0lueVJVNXBa?=
 =?utf-8?B?L0VoVk1UdXFQSEp6RjZEOFZoallQc0N4OERYUzZDcjBSZEc2WVVWUytSVjRB?=
 =?utf-8?B?NFNSRkdNR3dVMjBBUWNPLzRNVlNmRVMwVlNUQm8yWGxEa1N2Yjl6RnBSMmZ6?=
 =?utf-8?B?cHVDZmJpWVVnU2RxdDZSaGlyTUZBV2pXZzZYMktrME10YkgyeDdDTXdsRm0r?=
 =?utf-8?B?OHBnTnQyMWtIc1BBSUVpZEg2RE5jNGMvcnhBZHdJTXc1OWlkOUpoQWJlMUhl?=
 =?utf-8?B?T3RSZDM3UnphRll3NS9KK1QzdlRjSHJOTGpBcTRWbC9oaWhRaHUwYmpXL3lI?=
 =?utf-8?B?b3Z3UWVWMVB1WFkrQ2VZY2tuVlptZlowZWNIMVZiNlVNODAxelNFc0VVblk2?=
 =?utf-8?B?czJqUklSdy9PWFZkZmtMV1ZTRHI5SzFUZE5HbFZJV09mcit0dnBiTkN6ait4?=
 =?utf-8?B?REU3WGRDOFh4UytCb1VJMVNJdWZ2QjBpemdDZ3ZrZnk0NjZaaEhCck8wc1VC?=
 =?utf-8?B?RW1NVG1PNEd6aktEL2NWZEtWbEdBRzZKcnlZQlRCUlpSUlptdDJOL2pORGts?=
 =?utf-8?B?Nm1pMFZDSEtQWXF4QnJ5NEEyWHdML3NpSC9zUCtBdmRzZUo5TzBPcUJBblBx?=
 =?utf-8?B?T21nMXMxcUVYSXRnOW01elMwVkNzRmVxVE5RQXA3TUpKeUQwR3VGZGxRc04x?=
 =?utf-8?B?a2R6cDFYNDZMMExGa0ZLSE53bkdIcVRRc1Z5MTV2ek1lSHk3WWlZd0wvci8v?=
 =?utf-8?B?NVJZTVQ1c3FuMGJiKzZKOHB4b0dQaWZSbWt6R1ZZdTEvYmM0YlNJZ3BaWmww?=
 =?utf-8?B?TEVLOFhNNkxGQ2RIS3NmMzFxbW9mdVBjNm15QWZZcGRwL3pneGZwVEhYVk93?=
 =?utf-8?B?YjgxWHJ0Q0R0cm50dHpqQTByTElMMmkzL1Nwa1BqVk5MUzVSckNkcW52YTln?=
 =?utf-8?B?SkxLLytGcDVMTm5BOStyd0NBQ3RJTTFVYStYWVUvdFhVZkFYaEV3MFE5TVdC?=
 =?utf-8?B?UnZpU0NUdXNvLzBwSklyZUpXMm1wZmorS1ZBZ3V5OVBNNWZKREo3TzV5dmUy?=
 =?utf-8?B?bmlzcnlwTE0vcFpBQnZQR3BaU3BjNWRQMnNvQjU2V3p5WEw5dVJ0L005QjRQ?=
 =?utf-8?B?a0M0b3FvYmtzZEFsb2s0cTI2V2s1ZHEwajJuRS9UbjNWbGlZemJHWmdBdzk5?=
 =?utf-8?B?Y29BOFIzS0wrcytpb0tjN3pWYmVNOHd3RE9nclh4M2lLelFQd00xcGNVdGRn?=
 =?utf-8?B?Z3c5MmVBbEhNUXlwMHFyeXgycnlEUDZZa1VoWEdLMG92OVpCdVR1bnNkc3FR?=
 =?utf-8?B?MHZLZTdZQStnMXNYaVFDRmc1eGFkTWJhWnp4dEdLQW5JWFZuNTBxRlF3OFlJ?=
 =?utf-8?B?SWVyd2hGbDREUllOV211YkRwQWNRRmd0RVNkbFJDZzIzeWM0U2dtQ2I0dVBL?=
 =?utf-8?B?aXJyQjR6bUowRkVJd29mcTNvRVVJVUpGU2d0RGxBZkRPVWJSd0d5Z3BFY1pF?=
 =?utf-8?B?OXArSEVVZE5JMTVZUzZtQTVXMkMwbExKMktIaXdJdkc4d0dVN01NWlVmOXRI?=
 =?utf-8?B?WkxHOTNuUGIwdUxRdTlJNVJEOGtCMDYwRW1McVhNa3c0VDJrTzh6MFdMckpx?=
 =?utf-8?B?dFFPVU1MZ2xpUWN0ZzNseHdXRmh5RWFiRWtJQnpaQmNhalZrQkczajNDTzZu?=
 =?utf-8?Q?EQIU78qpBCn6XIBLDhQf+2DwrX8LRbL01CKVe?=
X-Exchange-RoutingPolicyChecked: QAGTyZfb650QNNAY94bpLkQJy7iF/tkgxqfxL9bxgbcm2+EdByuXikEnMywaNpmEFfUDXvRnU7qYQ45fychpPPWWt5NZFRSemRIOJBtEjAXPyNgHh2lDHUQq8jPH8eceq0wGK6wJYqlopLJqQIF7YPcfgsVEMcuiIm4D9mLlgx4Wq575HJy5C4B1MUokjE7H0kemNwLFmz6N0qpyWJY3Wstt54E32Ag6xQazlHqCDhKNvsCpar/7MCQCUjh4LiIGwVddyBO6j8ZklsfvOruvHrgNgk1wIYXfiSNgKpn1hmw0QzQBsTVfVjlsHvnMyt7xM5YN7qqecRLB8qMn5/I5pw==
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d98d83-54c8-4a70-6b9f-08df3c42d916
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 20:16:31.9563 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yt1hKO3ICjp2m4LkAZEODrIWILbyYgiWohu9CUhgzeRmYFzRYCbT1rF14e6yDSyCUy820gF5K3hUhOOpNo2Un2Nuw0LEY1LMQQn/e0t001k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8584
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, Nov 06, 2026 at 04:32:35PM -0300, Gustavo Sousa wrote:
>The Xe3p_LPG version 35.10 B0-step adds a new feature that allows
>64-bit token for semaphore wait/signal commands.  With that, the
>PPHWSP layout was modified to store extra information associated with
>the new feature on a region that was previously considered part of the
>scratch area of the PPHWSP.  Previously the sw scratch area started at
>dword #34, and now that base has been pushed to dword #36.
>
>It appears the value for LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR was meant
>to point at the beginning of the sw scratch space, but, because the
>hex 0x34 was used in the calculation instead of decimal 34, value is
>actually pointing a little further.  As such, we accidentally
>"future-proofed" our driver with respect to the layout changes
>discussed earlier.
>
>Now let's make this future-proofing intentional and use a buffer area
>a bit bigger to allow future hardware extensions not to impact the
>driver code for some time.  Use dword 128 as the base for the area
>that is going to be used by the driver as scratch space.

Note: At some point, SW PPHWSP scratch usage must be documented in 
BSpec: 77575 for better tracking since KMD is not the only entity using 
this space.

Regards,
Umesh
>
>Bspec: 60424
>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>---
> drivers/gpu/drm/xe/xe_lrc.h | 19 +++++++++++++++++--
> 1 file changed, 17 insertions(+), 2 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
>index f2e829e62168..77949593562c 100644
>--- a/drivers/gpu/drm/xe/xe_lrc.h
>+++ b/drivers/gpu/drm/xe/xe_lrc.h
>@@ -51,8 +51,23 @@ struct xe_lrc_snapshot {
> 	u32 ctx_job_timestamp;
> };
>
>-#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR (0x34 * 4)
>-#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR (0x40 * 4)
>+/*
>+ * The PPHWSP software scratch area starts at different locations
>+ * depending on the IP:
>+ *
>+ *  - Before graphics version 35.10 B0-step: dword #34.
>+ *  - Starting with graphics version 35.10 B0: dword #36.
>+ *
>+ * For our driver usage, we use a custom base that fits all supported
>+ * IPs and adds some extra buffer in case future hardware updates end
>+ * up reserving extra dwords and further pushing the base of the
>+ * scratch area.
>+ */
>+#define LRC_PPHWSP_SCRATCH_BASE			(128 * 4)
>+#define LRC_PPHWSP_SCRATCH_DW(idx)		(LRC_PPHWSP_SCRATCH_BASE + (idx) * 4)
>+
>+#define LRC_PPHWSP_FLUSH_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(0)
>+#define LRC_PPHWSP_PXP_INVAL_SCRATCH_ADDR	LRC_PPHWSP_SCRATCH_DW(12)
>
> #define LRC_WA_BB_SIZE SZ_4K
>
>
>---
>base-commit: e96f23b42352b7b9fea6bf92bceed052533fb98e
>change-id: 20261106-xe3p-bump-pphwsp-scratch-bce9931eae4d
>
>Best regards,
>--
>Gustavo Sousa <gustavo.sousa@intel.com>
>
