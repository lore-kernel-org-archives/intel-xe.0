Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84F2606A326
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 06:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=XMG41ier
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC8A10E27F;
	Thu,  5 Nov 2026 06:59:53 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4C3F1120B8
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 06:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793861987; x=1825397987;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=XvNrWY8Ij+zOaVSLMZjdEHa338ls0Ht+RaxjR5AQh98=;
 b=XMG41ieryKKSgDXTznYAeCkDdSQ5wS/Jlqpp99E9ayy1wL5u2gJ9hUMW
 EaLgV9TNGF8ba0Ag2gIxIEu+kF4rdkwBrJtjWrVZuqylQ8UY45xY826sf
 jsINoZbPxpditXvdkLzdr8OBjvZSqoYCe+QD/bA9n8LpGuYr0zBovY2nc
 r1ILa8eH6EblIeeXBy+E3RLHl48jYyFcANPxPb5lcjw8qUxv08H4qRmnv
 WQOb9OUVYl8u86tLn/DQ+vrjEXuTq3U+hOXUIYmMSCYtnCxBRiN0NZyAX
 +eDkwvBLHXJn1+E+iefez0ymUVRS8lFXF88KzIRLMrY2VU5SzSiHajncC Q==;
X-CSE-ConnectionGUID: NnVn1omBQOK2vhWUTjvq5A==
X-CSE-MsgGUID: aUtUknj8RgiVR/qehrlcFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2512276"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2512276"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 22:59:46 -0800
X-CSE-ConnectionGUID: fBeh+FF9Q/aNkCioC1K1hQ==
X-CSE-MsgGUID: gDM+FYbDRre6tYMYYWjydg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7040932"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2026 22:59:47 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 22:59:46 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 4 Nov 2026 22:59:46 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.44) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 4 Nov 2026 22:59:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwyKR8ntCY+yp4qAlG9YmZoxXl5Ghmzb9SEhEGp4rVsQfEsUrTzemgel/O6PhRayL7q9bjLRZeTMS1NlaaeRbE1ouoR7kB8svtJ/eTg0NvcaM0HsGEUQnlw5cAcXZ94GO3i1sOJpFWxRo1XXeGsE9CgYwz/UvcNw2JCKeg6rT1vqZk92BCVFbex4cmXPnZhE1FSwW/b6fU0A1vV4xeAf+FhWgf6WTMYT7wAcDf9Sg5ts3TYJYFxQ/Kd58TNNm2/1I496rqGAveg2C8gE4oy138P5DMpxl6sCAjFCEQhrcHZuOOLX/hZhHf64zPdor1j6u08P6qJ5msrc2mHy7kDEXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aTyyEcnDubhZ+ti82M9Ob02faKyW0TXtLE8pZXMRaU8=;
 b=wHWGUC7Jg4ZefDgUTccGnublUHcK5YdJB0673AUA7mXVl4a7Qalt4TX/2Usz55DcS++cWy9JENJw7YSnXeXm1Ur8snLFQpKOd/ql6MXJkHHsa87ZGozptoUL4uzJADa7+Lwuu7UAKbCo+JP8a8Bcj7PMuRwUQTdstEdWpTQtGbhrsWwLTKF0qjbY0obvxcKwO6u9MMcQaWz+5+S4DuLPU9duoidbKeqlKCisUsHxjS7i8peqZmS2cKxuCLK9ddjtfNq3J1va5PoqTRnrWnG8w216XnfM3/jsXQuXhX98NZ1Tgv/iW2+oSIPpH+8IR6dAl4vG2lMe1oZFNMja+a0itQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN2PR11MB4615.namprd11.prod.outlook.com (2603:10b6:208:263::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 06:59:43 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 06:59:43 +0000
Date: Thu, 5 Nov 2026 12:29:36 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Matt Atwood <matthew.s.atwood@intel.com>
Subject: Re: [PATCH v2 05/10] drm/xe: Bail from adjust_idledly() if no
 applicable workaround
Message-ID: <auwpWFXD73rv3PTn@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-5-919fa1c27070@intel.com>
 <auiH9H2NZGsRZCht@bvivekan-mobl1> <8733tiq9nb.fsf@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <8733tiq9nb.fsf@intel.com>
X-ClientProxiedBy: MA5P287CA0323.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:222::13) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN2PR11MB4615:EE_
X-MS-Office365-Filtering-Correlation-Id: 79c5637a-1069-4591-3c36-08df3b0a5e76
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|261102123227099003|260925021911599003|260925022911599003|260925021311599003|11063799006|4143699003|261026121527099003|261009223027099003|261021121427099003|261028144727099003|56012099006|261021123027099003|261022105027099003|261026140227099003|22082099003|18002099003|10067099003;
X-Microsoft-Antispam-Message-Info: 32S0gcosWaTAMD/xpH/IZ9q8wu1aCRyeTy8n69ygQ+GdWMOBxCSnts6iKxHHExbWCP8NOAXG1tC6PwMq0F6HSbNBHuwFQsM6ane9UsP+HE2h/wl2KcmN4TP0DYbAdqwoXfkhGy2YsZDBquObpJV24Wg8pq0vPZysoEeFmoJehrtYE/vowcg2Edfcr4ziBa+ZHSuEZ+3c7MDl2lI24f9UIYOL6dYjy/lc42ZlA2Ytp6RbE3BF8VA6GZvWJHIMTK5HzM2TZlJG/mn1oQWmQ1vR5qPRZd9kYesIT5BjdhA51T+EIQnTW5g9lPjsgzQBFGkvFM7IqGQafhzwb/dutI9OjVkb9L55AdFzb07OFzL8jBhYT1ZmQcT35cvggbeclYT93LJPXrceFBtZEClmx7a4Rh3v5+PGAmQy1ATZsvz/fSp67KvO2MH2B83IC55jLpn4BuYcdORT+73FYCuumwnN4Na2jLj39dWJPQAVd03Vza5MshQPL66VEQKG+PeRwTYF/txm2L/lcODIx8deZI9Jccdsm8IUhc4xjR9xwe+sNbKpirCFrFdq9J68hO/CtWJZfivt+KXyLwmO8MMDg4CkVJesl4aJibOWdvzR7VRPwduUqhBiCRiBdng0XR7+dRKjib0WATWucHNFdjGNQp3LZfSYxMTNVib3PNtM2sce824=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(261102123227099003)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(4143699003)(261026121527099003)(261009223027099003)(261021121427099003)(261028144727099003)(56012099006)(261021123027099003)(261022105027099003)(261026140227099003)(22082099003)(18002099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blJnVjNYdnQzZ1c3cUxLQ3pCb2dQZTIwQVd6OEhYSHQrcTNHamk2N1V2aXZy?=
 =?utf-8?B?bEduQWoxc1QzSm00K1NXTU0wbms0TUZUdFBlQ1BtZnFzVjZhb2xnUXpvR01p?=
 =?utf-8?B?Vmw1YS9VNUl1N2dYOThaSHhHU1ZuQzFiZllzbWZuZEZNS1dZdHREdlNocU5W?=
 =?utf-8?B?clNCMHFYNm1uTFJnamllOVRSZktMTmFaVWpMMHY0S2w0OG9oV3o0bGsycDc4?=
 =?utf-8?B?ei9VYUhORjFDbTE4MHUybnByTFQvUnFNVklGL2sveWRJN0NqNENXeXExc0FF?=
 =?utf-8?B?OTlqcGljOXBwYTBQOTBzYXdodm1WeXRuaUlkZlovWjBWN0FmVFZpL1lTVmxy?=
 =?utf-8?B?dlgzVEp5U2Nmd2RQOGJWUWJWYTdReTRUTGpnQmZVSityZ3R3T2dEWFBpQUFx?=
 =?utf-8?B?bGwvTTVXRGRCWDlKcWhyaVM0QmV4ZFNCeUFyYkdXeWJxa1NXT2JNclV6M1g3?=
 =?utf-8?B?TzUzQ3NhSXJ6OXlHY2NyclpWd1o2aVRDMzkrTWFoNHNpbTMrVDhWdzl5MFgv?=
 =?utf-8?B?K0sxWDBLWEpYRFdjWTVrWitnWkxXd1dnV0M1UitMY0YrQVUwbWFudzZaV2NC?=
 =?utf-8?B?bEU4ZXJ0bFJqV0x3U0JXNWl6K1U0cUVsMldvcGlUWlArNllBdks2Nk13NGE4?=
 =?utf-8?B?T1hoVzlONjJqbmFTWUtueWRRWktaMEZDVnJCY3JDSzNQUHYvVGU3UXBqbU1X?=
 =?utf-8?B?VE1lc1BXMEVRTXgwclZhbnBPaE5SdU5VRnI0UDNjNFovQ0tHVWgzQU1xM2Ez?=
 =?utf-8?B?LzIzZlJFWVZmL3Z6YSt6QXI3bEovQzJDcS8xVEJHazRlUlhuK1prQlRlbzhv?=
 =?utf-8?B?czhjcWx3aStldUNiZGxzZWszeEdpNkl3RkdnbjU5TTBLZXpzM3RpNzY2L2hC?=
 =?utf-8?B?SFVxMk1oV3c0RFl3WGpMT2FHRWNBSUJKOEN5b2lidFp5VDZMNmYzU3hZMG8w?=
 =?utf-8?B?TzFUckZDU3lVQmJ5YkZURURsNWgrLzRBT05nakQraHl5VXdZdlJnWWhaNXly?=
 =?utf-8?B?RU1BNHR1Tlp0ZmZRTHpuN0hYTEQ5b21xNmRpWG82QTQ4Y1ZSa29PdTk2T0g4?=
 =?utf-8?B?elBIYU9mVkQ3ZnA0eVhKSWgyVVIxYVpVeW8xbk1HM2JublVWSzBNWWVMUHlF?=
 =?utf-8?B?T2lSem43aU5QdXJoRmxXZ1NmVGJaL0NDNkVFQVpUMFdoWFVkbDNoWjV4UmVW?=
 =?utf-8?B?Nm5veWJzL1RYcUJWOXNXdmFOaWJ6TlB3TFgwaE9oWXNUaEE5RTV3M25RVi9l?=
 =?utf-8?B?TWpPcXpOUzB1NDEvWFZXUTVKdStKVUpwQUoybk9WbENmY1phM0hVMm12aitv?=
 =?utf-8?B?Ukg2b3l4QnAyTkJiNDlNeGNIZVREckN6RDhGT0w3Y2pHbDNNRmNyTWN3anpi?=
 =?utf-8?B?RTFNdEFneWE2MlNkZ3h5TjhsclhlWXNHMVlPY2dKSkFNNThYU1pRL0FXS1lV?=
 =?utf-8?B?ZDJteWxnd0ZuM2Qway9MZFZkMDdhQVFVeDEvZ2s0ejJtaS9CeHBKYTBMU1cv?=
 =?utf-8?B?c0duWWRlSndmdlpzU3BjbE1hS3R2K3pMNnRIVWM4Qkh1Vy9DbytMZ2lBV2NZ?=
 =?utf-8?B?M3RPUmFhV3VoVXBST1dSMFlXUkdnc0tlVjZaaHdYMW14NElmMzdGV2FEWExV?=
 =?utf-8?B?QzZFSkVaYldQVi80bG96K2tyOTFZbVJLbjZqRHZFZVBXbVQvM3NETVZ4WW1L?=
 =?utf-8?B?RmlNdm5aWHJyZVNBV3U2WmZ1Mnd1MjJwQWdUYzhEVlhrU3RVeDJzdDM1ejhD?=
 =?utf-8?B?NjR0ZXY4ZTBMamdoQVRKbGdiWmJCUER2K0ErTE9nTWliSWpjQVVvNnZMbVVH?=
 =?utf-8?B?dWZoNVNMelZMNjdaRU5QbTg0T2FyVmllcnd6MS8wME4rR2NMRGxnRThPRmgv?=
 =?utf-8?B?WWxsU2xNTm5vT2tBOHBpM2ZOd0t4RVlnUXFnL3NTZE1PaFEyVkZJcDdXWG1J?=
 =?utf-8?B?bEE3VWpEVy9sUzhmYUJBNHAvZE5aRXFhU1RiditjYml4Y3FSMmFVQzJNdm4r?=
 =?utf-8?B?OXJ2OXkzQmZZZGgxdGxLWUdUL0phTWNtOTBuNWpNWURFNi9BYWtQcUNEYW5w?=
 =?utf-8?B?dTBwQUJENkpZU1FZYnM4NUQ2a29URmo3S0NqM2NUaUN0cXRVdzZlWWRHUUxO?=
 =?utf-8?B?UTVGWFJJTGwyZVNvKzNNbUNJek5PcGxYRStUeWlOZEdrakI3Z0R0WEU0aFdZ?=
 =?utf-8?B?d2MvWVA2eDg0WUdhOSsyN1BqT0czNm5zaTV2dzR3b2s0M1F5QWpzQWZXbFRz?=
 =?utf-8?B?MGZVcTZjdktVVzdOOFI5VjR0REhGSkJZaVNDNFd6cEVETUNyQS96WHRESlc4?=
 =?utf-8?B?WlBtYk1qeld3Z1J1WWYzcWRaV2ZLZTlnbitQbzh5d2IyYXhuZGg1eWY0UnF0?=
 =?utf-8?Q?+FQkO74fQ9pfni6SSjFDMg5JCztdPFwws/4HE?=
X-Exchange-RoutingPolicyChecked: efpFCIzksqFs4txO+VHjHRTLYS4f8HNEC5hHODJOsmlsgH7voQVMXVNEDj7NYd5QRQ/5IXzt8VRLR3K4OXU0bjAhzY00FC9wMWE2cDOplmQYxfgsJpEIzcNJqORnds/r5Iajbapah1FyMS/6f8TTvGKHZHQgiUc/ZS1FyS4pK0f6wyw+7QIaK5vb8lhihhKCC8hGi4fdMqhfwV9t++9XylR0upp9EAKw3GzZcLNQgvaBgzWH+qWlgd4Khxdw7UmTnEvOM6oAIlKtGdABrNWFVq8vMaZQ9uPUZ6i4lyFnYUicTE7chR/kMUDgASCWftwQSquEW15/eHe+4ImzA87bYw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 79c5637a-1069-4591-3c36-08df3b0a5e76
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 06:59:43.1656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uyQFmVNps/b1P144RudyWkDRATfRILiL/xqRGjM2z6oph2Pz5rrJHIPHyTTCioWzR8uNWNbIrPbBGrMQWc/TFtg6QyNkFgiWikTVM8EvIorbc1bKqgiN7sFupte8+6qD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4615
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

On 03.11.2026 11:20, Gustavo Sousa wrote:
> "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
> writes:
> 
> > On 30.10.2026 19:57, Gustavo Sousa wrote:
> >> Re-organize adjust_idledly() so that we return and avoid touching the
> >> hardware if no applicable workaround was found.
> >> 
> >> Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> >> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_hw_engine.c | 32 +++++++++++++++++++-------------
> >>  1 file changed, 19 insertions(+), 13 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> index 01a7baf061eb..32d33c70e7f4 100644
> >> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> >> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> >> @@ -605,7 +605,7 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  	u64 idledly_ps, idledly_hw_ps;
> >>  	u64 min_idledly_ps = 0;
> >>  	u64 max_idledly_ps = -1;
> >> -	bool inhibit_switch = false;
> >> +	bool clear_inhibit_switch = false;
> >>  	bool wa_applied = false;
> >>  
> >>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
> >> @@ -616,12 +616,6 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  		if (!idledly_units_ps)
> >>  			return;
> >>  
> >> -		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >> -		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >> -		idledly_ps = idledly * idledly_units_ps;
> >> -		idledly_hw_ps = idledly_ps;
> >> -
> >>  		if (XE_GT_WA(gt, 14025941587))
> >>  			min_idledly_ps = max(min_idledly_ps, 5000000);
> >>  
> >> @@ -633,13 +627,24 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  					       max_idledly_ps,
> >>  					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> >>  
> >> -			/* Clear the inhibit switch without disturbing a valid delay. */
> >> -			if (inhibit_switch) {
> >> -				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> -				wa_applied = true;
> >> -			}
> >> +			clear_inhibit_switch = true;
> >>  		}
> >>  
> >> +		/* No applicable workaround found. */
> >> +		if (min_idledly_ps == 0 && max_idledly_ps == -1 && !clear_inhibit_switch)
> >> +			return;
> >
> > We can skip the check for "max_idledly_ps == -1".
> 
> You say that because of the "!clear_inhibit_switch" check?
> 
> If so, I would prefer that we keep the check so that we do not tie the
> maximum idle delay with the clear_inhibit_switch flag.  It is true that
> today the only workaround that defines a maximum idle delay also sets
> clear_inhibit_switch, but I think we should make the logic treat those
> two things orthogonally, like it is already being done below.
> 
> >
> > Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> 
> Thanks! :-)
> 
> Let me know if I can go ahead with you r-b on the patch as-is; or if you
> prefer to further discuss this.

You can apply as-is.

Regards,
Bala

> 
> --
> Gustavo Sousa
> 
> >
> > Regards,
> > Bala
> >
> >> +
> >> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> >> +
> >> +		if (clear_inhibit_switch && idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED) {
> >> +			idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> >> +			wa_applied = true;
> >> +		}
> >> +
> >> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> >> +		idledly_ps = idledly * idledly_units_ps;
> >> +		idledly_hw_ps = idledly_ps;
> >> +
> >>  		/*
> >>  		 * min_idledly_ps is applied before max_idledly_ps, which takes
> >>  		 * priority if the two ever conflict (not expected in practice).
> >> @@ -671,7 +676,8 @@ static void adjust_idledly(struct xe_hw_engine *hwe)
> >>  
> >>  			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> >>  				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
> >> -				  !!inhibit_switch, gt->info.timestamp_base);
> >> +				  !!(idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED),
> >> +				  gt->info.timestamp_base);
> >>  			xe_mmio_write32(&gt->mmio,
> >>  					RING_IDLEDLY(hwe->mmio_base),
> >>  					idledly_reg_val);
> >> 
> >> -- 
> >> 2.56.0
> >> 
