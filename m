Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3816CEA4FC2
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E438610E42B;
	Mon, 23 Feb 2026 14:04:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LyAR9bFN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE44110E42B
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771855439; x=1803391439;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=F17z2MHz/l8hToabBxyOEAZrx6ybqAzmWTaDeFooAIs=;
 b=LyAR9bFNolPzRTitCNGkvjxbl/rsxdIuP006d1Xb7OAc1n6SfrJ9QWZ3
 XcNJk/eh3S1eeuIRpDXVuXbcnGfRQVH3DFmNzUMY46PeF+2UBOdWQloys
 yrR/MO+GOWWOtlVNzPyg44/r8sfmlZoI98lXgDvfOnnU53ljOHqraiMdX
 Fa5qL+IYH0lJAUjQCAee1UsFmCLzMl8PcL2IhKPbWzAKHKcu/g3LFYKNF
 R6YxOr1p95CuxlpTRV91s1StqFxQUMb6gPM1mtLesQ7reenSko+S0C0L8
 4mmkNgkDKukrzF6DwnqMPZpAsFabsKE5VFO+QZrUDqjLuUaTq1G25lcet A==;
X-CSE-ConnectionGUID: gOaEZfplT8KKJJl5oZ+o3A==
X-CSE-MsgGUID: Gr2AlGwzR4+qfG+pScVRGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="98310545"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="98310545"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:59 -0800
X-CSE-ConnectionGUID: 6IgS8ObTQL6+x6kjS4XrXQ==
X-CSE-MsgGUID: +D24X08KSR++I6brSzPqwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="214800611"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:03:59 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:03:58 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:03:58 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.54) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:03:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J1A3kUpGZtcqB3kxzm8Lsmcl3mV7F5pVdTWNsvyT5Q/0GS7sVlNCzfgqT7CmdcxOLm51iAN0XzFd63GHxSH9E/EfFwZLkwTDfYdv+ePCrp4co4EQJ0SEcj3JrxQszEvuSX4Xy0xKLYRM3Zer4FFAEaB6L4U908b/FNFfLXbfPNRJRsAjwq2nR2A5LsI7XCLDo2nJL5wTbeCHoZFjPqzUlNJpX1e4W4iqRna8Jv4rSQusPuGdY2B/mZDGJfagOq3alZRi5aeVEPo1zQ+/sZ0o73Cv/2XM6ITxv8XSfdUkahv3hlKuq/wdth/Ce9j/hJJxvG+m2xOvmEmalJBPjTVOEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EID6ot4yW4VCnAnrwAOhoCv/bC+5ZG6oob4Z88VRWs4=;
 b=RNxw96KoS6Amjr1Kn8BmeQRKGe8oM1mrLbavq/p8Q89rwZf44fN5N9y4qPfXGnGfpY2YRdch55bSyFTeJ5zA42mBi10h1d7QcI1kEowpy3QiT7iXrfiV3p+9c8zxfUr78leTuC1CRQOXOBHm8sO9O+wF6iHczNmS22oDQ7qzubSk5iZTNaLdYmO+tHwWaeLq4k8Ocu1UJUlmVMYLbwbFnZKiGX0gesXOekxXMUz900HXYfCp/816uadG+QzI3vWa71G+ChwxYZs0JubcY0GuzP9BRp3giErKRCmG660It3pd6Xkkypy37sQRGTc5lzd7BU1bWas5uXS7MN6jM+7lPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by MN0PR11MB6058.namprd11.prod.outlook.com (2603:10b6:208:376::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:03:55 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:03:55 +0000
Date: Mon, 23 Feb 2026 19:33:49 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 06/23] drm/xe: Consolidate workaround entries for
 Wa_16028005424
Message-ID: <aZxeRfuW97DKuavK@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-6-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-6-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0214.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::10) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|MN0PR11MB6058:EE_
X-MS-Office365-Filtering-Correlation-Id: 7083ef9d-aceb-4a97-788e-08de72e461e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V1Y4VHZMMHp6MFZMZlphNVp3bHV3d1NjeS9sTzlPUlgvYVEwMHRtRDArVG5M?=
 =?utf-8?B?U0FLMjYxR2x6Y1ZZNlBEZTh2L1JKR2RRRjZHQ1V4Rm9sODJBVnd2cUNWT2Nj?=
 =?utf-8?B?ck4yZnpsTWp0Ny9iM0N6dnJ0MkFweko3TUR0dFRYbnpGUnJRSW55YmROblRo?=
 =?utf-8?B?WWJNWExGekxNaU81ajA0ZG5CYmZxQTFibWJwSlF6ZU0zM1NBdG8zdTRSZ3RC?=
 =?utf-8?B?OURPRk0yVWkxYi9SM3E4MWt0V0R0VHoyRkdKVnYyNWRmK2xsS2pnb1k1YjFH?=
 =?utf-8?B?L213RUVkUU5uVXgvT21SbGRoS0tqZ1dqVG9nR1IvclZNSjRJSFB1Mk1aa0ZL?=
 =?utf-8?B?djNyTVdIUEdOdytPU3U1NTQrTGVKck9QL2xrc2cxeDdsZHBPbE5nbXBmTkMv?=
 =?utf-8?B?SVY2RFA5a2JIdkVFUEVmSDlRZjd4WTNSd1hmeTVqbG1NZ28rdGlRTFVrRXVJ?=
 =?utf-8?B?VlFLMDNtOUtFYUNBWk9ZS294d0V1dW8zakRLL21pZkRTdGNwN0FNSGNWSFRR?=
 =?utf-8?B?L1gwYlJybnlLVXVKYzNwRks5My9IUUl3bmhKdkNQZEJxU1V5ZXdzZXpUWDFH?=
 =?utf-8?B?b0tFREVhRlhBa1NqT1JpMEdpRXhocGJ0MFRXb3d3QkdjWEY4Q3BpK1VyQ3U5?=
 =?utf-8?B?VXZHamlwd3oyaXdwZ0VvV01rRGFpYm1yZGc3bFVBMGxRQUpHYkVkTVRZNmJX?=
 =?utf-8?B?MVlTNC85T01RODVZUml2U1pkQ2QrNE9LUE02MWZZZDNsZWordnJxbUkrKzMv?=
 =?utf-8?B?UU0vcWZpK3lEcW5JTTN0dGVIaFE3bHFQSnB5QTI4NTVaWXpFT2tMZzNhalBs?=
 =?utf-8?B?QVh2S1BDeE9pMTYzbWRLYW9YbytuYlpKMzUzeU9PQi84RFpTbGlOVXRXdVlG?=
 =?utf-8?B?em8zbEVmekh2aStISTQ3cFAyUW5MNERrZGxORzQ2Y0lhZmYxVVlQbU9PWlVy?=
 =?utf-8?B?T0MrcEdKTXROcDZ0eGFMa1hGbU50Q2ZDdlIyNUFZRXYyY3A5M2EzY2NHVUpZ?=
 =?utf-8?B?WDltbDMrOEkralUvRFZ3Y0dCZzVtRlBTenBlOTlPN25nOTRCMHpvWnlnR1Ro?=
 =?utf-8?B?V29Wak5aN3hRRUNPWGRvQlBqWmtEalRmekpTclhsK21GWTVmODdHeUYyK01n?=
 =?utf-8?B?ZVZKM09qYU5PR09NeVordU8yRlFQamJ3L1B1VGlRcFV1ejYwTXFINDI0TjBt?=
 =?utf-8?B?U21rcGY0TzZkcHpkckRBOVlncEZHNUdLaVFHOGJYSGdZMXJBT3lwbG13L3l1?=
 =?utf-8?B?ZFlrdmh4bmJTNmxhN1BFNnNpMjNIcUFrQVpXSUQwS1crbFNnOEZKU0dSY0V3?=
 =?utf-8?B?YzF0NUlvMW5CNXd1SU1TczJ0ZFc0MTBCaHRiWW93ZDMwZjR2eTZONlJwM21H?=
 =?utf-8?B?cm5qL1ZCb2ZuZ3pGa0lvYU15WW9EaXJ5dnpUalpEby9pSitOeHdhYURGb2Jv?=
 =?utf-8?B?T3BiaFl1SGlJN1hJWXVUNGQ4UG1GODIxUEtOUGcwT0dwcHR2dVo5dCt2V2pU?=
 =?utf-8?B?UEF1TjdtM1VieFlkNlhmZ3RYc1hDblhlK3BqU3BXS2N0SUVESU9FU3VPL2li?=
 =?utf-8?B?cDNUOUwyRGdOeG41bythTUlYQXVlT1dvcTFOcWhMVG5FaHVWSkxVODR0Rkl6?=
 =?utf-8?B?N3ZXY2Mvb1BWMEQ3aHVhME5vZFhkSWtrYk5tZkJQVmcyRm5PeHlBTGtxZWE5?=
 =?utf-8?B?VUMza0R6TElIM2dxQVZQOC95TnRWMElibGlTWW1JZGh6LzZDVE96SFkyR091?=
 =?utf-8?B?bXlRR3dGQTlidzlMSWlsaHhrTnVqQUxxakV5K3I3bUdvUlFJNDI5d09SdmJ3?=
 =?utf-8?B?TU9ndE1jQUxVcCtueHlzYlVaNjArV1JHVkpmVTI4cW5VL2FCT251Rkc5UjVp?=
 =?utf-8?B?WkRTSjJPSWlZUUpzWkllc1o0eTEyTk5ZUEh2RjFGSVZFTFhvRUhUSitEQmtJ?=
 =?utf-8?B?OWdPcytGeWdUdW5NSE9sT1NxZ2plWXduZWpNSXd4TkFyWDNoZXdNS1RRRXIz?=
 =?utf-8?B?Q2Y0MHFFZkozOGN6MGl3ZTk4M2JxM1BqSkZ0Wll1UkcwcFUxSUhTdURmUSs1?=
 =?utf-8?B?Z0F4ZmhBMjFvckRqdDNHckNwaVpnVmh2SXBPSi8rTEdjUnEvd0pTOTNpYXkw?=
 =?utf-8?Q?/w40=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RnRoeGF0c2Zweis5ZnRWK1I5NzRsaTVsc1VscTZ5OEFLNkxVd3BZYXJaQ2Js?=
 =?utf-8?B?TE1vMlhFYjI4QmM0cDc4SlZ2ck9Jb3VFWHBac1k1czkzSnRPSFRBYTY0akNx?=
 =?utf-8?B?Vy80ZmNvLy8wOTFRcjhBMUxPUnVuaU85YXBuU3F4Vnk4UTRzaGFFL3JsdVhk?=
 =?utf-8?B?L2kzWDdEWVVBNXI0TkJMUDZEVlJRdHVXb1JBaVMybGIzZDliYktQWEdLUEoy?=
 =?utf-8?B?Zy8vOUJCQXRkci9PWmVIUWcxYWQ1ZTNLWmtmYzloTG9OckFuVFJ2US9WK1Fp?=
 =?utf-8?B?QXRrUUR6Y0g3WGdwNDdwSkswMmM3SVBlQ1BiRE85Ujl2NTdtZWtZNDc3MG5j?=
 =?utf-8?B?NUZ4NG1idkg4NEJEYjFpQkFhYW1BbnpjbG90NDc4TXBOR29OakR5ajNtU0FS?=
 =?utf-8?B?aFAxZEVXeDJQM3ZBdEpYREdzSCtCellFc21YS250b0pBcUVlNTZjWndzdXkr?=
 =?utf-8?B?YVhxTG5uMUhuMUEvdWxNZ3E0ajJ2d0pJeE94TTZhTzl3bU54RzVpdFFDRm5y?=
 =?utf-8?B?ckIwN05jKzB4R0h0VSsvRHA2OWZob1FkK1BQUDcxS2xYczVLNlA5bitjQmdU?=
 =?utf-8?B?REZ5ZFlwUHNwa3R4cGkyeTR6TkVua1RuUTJJSEdrd1lpcjkvRFNXblRsaTJu?=
 =?utf-8?B?bHNTeHBYUlE2L3VpR2Z0QlhWMHZ6WklWSVBSYWs1aFFxeUpNQUhaSUZPdGUw?=
 =?utf-8?B?UGJqNXJMUXhRdnlsVWlGL3E2QkFqMk9ndy9WQ09tOFo4dENNcVN4Y2dxdm9v?=
 =?utf-8?B?QnJsaWpIOFhFRW9mZ3VWM2RoZnlaTzY5aGVZbXJrUyt1cFdkWGJNYTRDa0sw?=
 =?utf-8?B?M0ExZWFYdWlXOVFEQ1BrSWpLNllxR1Byck1KNG5ZZjFsOE5OY1ViRExVcG93?=
 =?utf-8?B?dEFqSnJ1Q1BjR1hPTnZYZkpsWWtRVldLREJ3MkllQWt4SzY3LzNyTEJSNVB2?=
 =?utf-8?B?eVdKWUJUci90U2pmNVFwMnJ1dHY2eFVaSE1wS3VTREtpeUROM2J5dFNOZVNM?=
 =?utf-8?B?Yk9aT3BpcjdSRkRJSnlHMURBWG54c1d6ZEdyOEtwK05hTWhEaHVmRVpMd3hM?=
 =?utf-8?B?MWRhaDFaUlVqSmZYcjJoblVKdkpqZytkRkk3RGx2NjFFcXgxOGdCZDlQL1dp?=
 =?utf-8?B?aitDaDUwMDBRN3lsNEhORDBwdHlrZzNPMXNLcUE0dVk2aW9PVXFOaFlJSk5v?=
 =?utf-8?B?YjVIT0dZN1U2cGFHSTNwemRtYzdwY1pVUWcxbGVTUk9GUDc1cCtmQk0vY1gr?=
 =?utf-8?B?UjlZODJTVUp3OXo1WXIwRDFHU1JQUFMyMkRHdXc3M0w3YVpsQk9HemtCcWRx?=
 =?utf-8?B?d1dLY2VsZDBJTHlqL2lFbGlUaWY3cURYdHBTZVd6TFFKWkp0VDNtOWNFTXJQ?=
 =?utf-8?B?dExCODZqaWw4OGhOckNmc0ZoRytRMmRGR0UrdUZrbHNHbkNvZCtKOXptd0dU?=
 =?utf-8?B?bXIrVVF6Mk5pQ3Z4UFpTcFRuNlE3NmhCYkg0TkZSdCtLMlFST1pmTm4ySUdD?=
 =?utf-8?B?RE9xNHBDeTk0MmJxZ3NKUmd1OUJPR1Nqc0RhOTljUFpOTE9IV0JSR0hOREhL?=
 =?utf-8?B?SC9LY2VHcmpqcG01Yi9sdU9BRkwzT05XS2VUZGJ6cml0ZExLcGpyRkVJTjZF?=
 =?utf-8?B?M3BZb2t6ZGFkLzZvOXdYKzdCMjdUVG91WmVpS0R4dk1oMkVNdnV6MkpvSXh3?=
 =?utf-8?B?dGwySHVkVFNPaUhlM2lROEJ2ci8xVi9haUd1aDE2TzV3VFpXY20zUEIzdDlt?=
 =?utf-8?B?QWx2VHlDS3pqbEsxRjRsOUoya2ZQa2RKZ3RKMzZ4eGM5R05DNjRPMGtkakE1?=
 =?utf-8?B?U1ErWlJTVTliRnJpNUZhQmpNZCtCQmlrZmYyLzEzUS9WbmJrY3hHT1ZrbkhR?=
 =?utf-8?B?bWpjZnFxVW1DYk5IM2ZyUXJSQzFjSmxCY2FrRTFGcUJzdVZDMENGVzFhSGhS?=
 =?utf-8?B?ZFRXcERlZmMxaEtYQldualZtUDF0RThLaVlqd251T2J2ZXgwc25QRHgzazBZ?=
 =?utf-8?B?UzcyR1JQeUh1VnQ2ZWkveDFxUWFuN1BKTVpvSVd5SDkzSGRlT2J5aWFuYzAx?=
 =?utf-8?B?VHQ1R3FINE1CZnBPWUY4czNmSHozMEpuL2wxRHdJdGlxd0JkanFsTjlmSGsz?=
 =?utf-8?B?WktPM29SVXRBQjBjSXMzaUczSVAwTGpPcGo0NGVmZFZPSUpzbzNRL1liN2pE?=
 =?utf-8?B?Y2phbTRRYWJadUxURmhBMGFKdS91dUdzTHkyaWRLT1o2NG5vR3JORWc4UG5Z?=
 =?utf-8?B?b0VJbG0vRzNkYm1tbVNBQzUzUGZZODVmeEZKM2hyL2J5bGdUbjgzcmNqdTRJ?=
 =?utf-8?B?SXpqajQ2cS9MQzN6QjRyZFQ0eEVrK0tPZW1NRmt5YnZDd0loVDFBN21WKzBX?=
 =?utf-8?Q?G4ZNPK2Rvl+bKk5kohnsnwb9TbjQWMY/xVPpC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7083ef9d-aceb-4a97-788e-08de72e461e3
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:03:55.6818 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Nc2sHjfsT95zaLp+KYkpdueIyWQA0ze6qN1JLfImcokaGEK39AykraCCZZ5ErjAgCCdVikDm+qhBPGA+ffnEn11RwPgpaS7ErMWA7k9Xr2N39xiLq8OZ4J++IBk4t4v
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6058
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_16028005424 applies to all media IPs from 13.01 to 35.00 (inclusive)
> and all graphics IPs from 30.00 and 30.05 (inclusive).  Conslidate the
> multiple RTP entries into a single range-based entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 31 +++++--------------------------
>  1 file changed, 5 insertions(+), 26 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com> 

Regards,
Bala

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 33e7e33db83175953361ee13dd40af8954c6d838..4009323da8021cf5791a96e119b7b71b64eb4431 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -159,6 +159,11 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F08(0), CG3DDISHRS_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> +	{ XE_RTP_NAME("16028005424"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005), OR,
> +		       MEDIA_VERSION_RANGE(1301, 3500)),
> +	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> +	},
>  
>  	/* DG1 */
>  
> @@ -239,10 +244,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), IECPUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(MEDIA_VERSION(2000)),
> -	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -	},
>  
>  	/* Xe2_HPG */
>  
> @@ -256,23 +257,12 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  			     LSN_DIM_Z_WGT(1)))
>  	},
>  
> -	/* Xe2_HPM */
> -
> -	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(MEDIA_VERSION(1301)),
> -	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -	},
> -
>  	/* Xe3_LPG */
>  
>  	{ XE_RTP_NAME("14021871409"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION(3000), GRAPHICS_STEP(A0, B0)),
>  	  XE_RTP_ACTIONS(SET(UNSLCGCTL9454, LSCFE_CLKGATE_DIS))
>  	},
> -	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3005)),
> -	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -	},
>  
>  	/* Xe3_LPM */
>  
> @@ -294,17 +284,6 @@ static const struct xe_rtp_entry_sr gt_was[] = {
>  	  XE_RTP_ACTIONS(SET(VDBOX_CGCTL3F10(0), RAMDFTUNIT_CLKGATE_DIS)),
>  	  XE_RTP_ENTRY_FLAG(FOREACH_ENGINE),
>  	},
> -	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(MEDIA_VERSION_RANGE(3000, 3002)),
> -	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -	},
> -
> -	/* Xe3p_LPM */
> -
> -	{ XE_RTP_NAME("16028005424"),
> -	  XE_RTP_RULES(MEDIA_VERSION(3500)),
> -	  XE_RTP_ACTIONS(SET(GUC_INTR_CHICKEN, DISABLE_SIGNALING_ENGINES))
> -	},
>  
>  	/* Xe3P_LPG */
>  
> 
> -- 
> 2.53.0
> 
