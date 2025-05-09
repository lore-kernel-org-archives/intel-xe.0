Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB2CC3ABBC
	for <intel-xe@archiver.kernel.org>; Fri,  9 May 2025 16:15:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B29310EAAC;
	Fri,  9 May 2025 16:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gT4cZDzC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FAD910EAAC
 for <intel-xe@lists.freedesktop.org>; Fri,  9 May 2025 16:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746807350; x=1778343350;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=OX9dkIgZGtnP6XFih3Ix5ksmVRMY5IgfsMSHKtOWzVQ=;
 b=gT4cZDzCE6BcP86hTMvPLFo6w9Zoel47Iai6C8/Ffjf32UTfnK49c2Fc
 7DLKGEMTqkq02eIuw2CXxpIRkyyegWhFdM0zGZE38oG0vD9pgtSotWSCF
 fz/w2Tp+SbOw7Dbq1xsO0+B9Ohf4SLBEHYLtcW1rOfqEmjkZ8AJqAeBwO
 ZffMH+bVupJNJULdPn0I3I1hxSRWM/znMPSVL1PLvAYezlOkHzcOVwbJ0
 KWLpElYFbDRHL4BQtAPAL/kSl+efOXfwPgfsioGefMexKF7S6MI5KfLad
 YgF6O7Y7LY7Yj2c3XIv3pRJ72D+lF34jT/Utj48ykx0yCGxfqndkZMn+W A==;
X-CSE-ConnectionGUID: DdrmAEBdQHmjzKuEh1Iz8Q==
X-CSE-MsgGUID: 7Tfz6M3OR/2oJhaj2+jMfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="74025631"
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="74025631"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:15:50 -0700
X-CSE-ConnectionGUID: CaTe73k2SimdqbYgNSFxtQ==
X-CSE-MsgGUID: 3hD1YC2mTNCryZhHRFcZJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,275,1739865600"; d="scan'208";a="137590674"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2025 09:15:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 9 May 2025 09:15:49 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Fri, 9 May 2025 09:15:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 9 May 2025 09:15:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAzmLbqJkZ4zqMCpfFzA/MLaXkMdmAZ4EQiu9zIA9duax3Iy/VvFbNl9+ymv84Y0RqJoSvzUMJEFG38X59VEuaCMh1IEwNwhrGXfB9PqVY7vgA9+7+yaFCH94eVhYyfFMW5GlFfWu38eagmi8rLVBmiTWjJ/yGdqEwqxv6OTbyiCLGTaCNWpUBEkVhwwgt3IYKQQ+BIPfNtXoL4ILThfymR2UcG2iVrFu4IL68MoJv9gS8vEZLICYJATycXLcgNR0Yzo6v4JaPn4ii8XdpFhMXZ2p2L0/4LSnt4JGescs+NRPQ2SzO2ideMy9w3kodMvNLer2oVsNzRySYAbauUyMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cuBSUTYVtj5/xkuqAHU7KY8RAeGgu8P6DbEb3IGay3o=;
 b=IbmSJSsXnQUT9UGjZHWYZ5LStv5zyngq4j0zwKEMfZ8sm0EMRX8lfpaY5QAsPHBC+qNh4GvBKMZRD/wn4og4U58hhnRGNIrgjZLNXvgO94fNHFy4Vu7FY+0jmc/mucOB9/mV//L8G//ILE4gnZNhb/68Cwf692xeQ4M7ZtNp0IsCWkE2qLsTuCEOtD3hrL8aA3CbAi1ZiC50Kp8ZcPk4dJnM7aqjFdgfyz0ZPcbh7ZKT+1Uu+38NOfDO1H8C9zmmyi+n9etrfsyPc4wwBCLRUDwirPNZjREenclFd2ePzIQK+zSaetS6Z34jnU3bByzW167oWwBGgsirZjU3NKH+wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by DM4PR11MB6407.namprd11.prod.outlook.com (2603:10b6:8:b4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Fri, 9 May
 2025 16:15:46 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8722.024; Fri, 9 May 2025
 16:15:46 +0000
Date: Fri, 9 May 2025 09:15:44 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v4 3/4] drm/xe: Check 64-bit CTX timestamp for TDR when
 available
Message-ID: <aB4qMH3EKCKWy9gj@unerlige-desk.amr.corp.intel.com>
References: <20250507013039.2043897-6-umesh.nerlige.ramappa@intel.com>
 <20250507013039.2043897-9-umesh.nerlige.ramappa@intel.com>
 <njcubtyaqbejliohfpklue6b3zxbxat2ly6bz4imivaxoh37vu@wi3pickrjp36>
 <aBvPBb5lzKRLlmyF@lstrano-desk.jf.intel.com>
 <aBvqFxhkzyPfu5d2@unerlige-desk.amr.corp.intel.com>
 <aBxKxazQfqy8eK1w@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <aBxKxazQfqy8eK1w@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR04CA0306.namprd04.prod.outlook.com
 (2603:10b6:303:82::11) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|DM4PR11MB6407:EE_
X-MS-Office365-Filtering-Correlation-Id: d2478207-d3f1-422d-e01b-08dd8f14c119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0hFdXlVby91cVRGdElJVzBhN0I4WGlZSlpjSldEbFU4R3BaL0tqWElGN1g1?=
 =?utf-8?B?aXlNSUpzNWd0bHB3VUVYaXhQTXVIb0MzaXdEamxJdXNSYXdCQ0J4eTUxSGZL?=
 =?utf-8?B?R0Ixc1I4MWd2cFZQcUl6Q0RpOHYxaGxZY1ZmYjlZT292aUxyOWJLNWtLUXVH?=
 =?utf-8?B?RGFlRE4vNnlZd21NbXZMVFFRWFYvQ1kxWEdvckJKS2xCQTIraTVpWEtsRDNY?=
 =?utf-8?B?aTBNK3N4anpsKzVvTHM2MEpMR3h1b3E2bTNpSVdmY2ZsZEpuWUE4eGtDSGtY?=
 =?utf-8?B?OFdDelJCWHJnMGRWL1FyUGlqV0hUTkVSa2pHZ04zN0NweFJIL3NqQ0ZSVFFY?=
 =?utf-8?B?cGNnMmFlUkJ6aCt1SEZzRGlMYmZoMHVGUy9tR2czdmUxMmR1dG1qcHFnNytJ?=
 =?utf-8?B?aHpVbVRHMmFZWG9LeWJ0dExadUc4aEdEa1hYRyt6THpja0cvbkNGL04xRGVY?=
 =?utf-8?B?R2U4TXFWdkFCK0kxOFc0NDRqWFVqRll0TlRYN2U0MUVxcTgwQlhwL0E0S3ZG?=
 =?utf-8?B?RkhoSzg2STN1QUpDZzNLYTY0YVZEMDVpWHZqWUZZQzZXM2ZLazEzNnpvWStQ?=
 =?utf-8?B?TW4rTHZWZHh0NDFXeENwNHAxaWJjQWU1ZHhBTG9WSXhXWGdrV3F5NUtadTZm?=
 =?utf-8?B?SkZxZHFIcVU0Q3hHZ1loWDFyK05WY3BwRTJSZkMzc1lNRmNqNkFzYlhSWnc0?=
 =?utf-8?B?NFJsNjFkSndsMGpkcVlMdGNySDRTZmdTVXhkNDlNSkQ0MjRvei9SYnVPa3Np?=
 =?utf-8?B?Z1hDOGc3OTdIZHg3U3U4UlFqMXdJOHp3YzVRMzhXanRyNTdMbUFpVzY0UWlO?=
 =?utf-8?B?Z1FjWERCdEg3SzBvcnRwc3pkS0NBSStxNk1QaStncDJ2SHBvNDVCUGlaaEY2?=
 =?utf-8?B?MXUvN09wSUtDcWllT2lTRVRGYXh4Q0owRU1IRzh0Q0xpVXhhcmI4TXFQQ3dq?=
 =?utf-8?B?VEJaYm1HUDJETElqTitQelUzOEJlTHZKQUxuUmlsZ0RwV29YN2tsQTFOUGNM?=
 =?utf-8?B?YlYzdWNCTEJ3dDJPa2tkUThhZEV5UzlZMEVDVTFWNDljYitNbVN2QXRhNFhx?=
 =?utf-8?B?d2ZHMHlFemR3SXRzc2NTZnVMMnQzNDJ1c0htQ3lJOHhXZVZoRVVqeVJLTmJu?=
 =?utf-8?B?YUhDWm9LUW14YWozQmFuaWpGSm9ZQzhRWGQydzBKcGJlOVFTTFRqdEdhZWZK?=
 =?utf-8?B?WTFZc3lwWDRHVmpxYkVpMXBRUFQ3ZDY2c29CbUdiOVJ1cU85Yk5ES08vd2V4?=
 =?utf-8?B?M0RFNk15ZjJjQXdHZEV1UnhrbU9lMUJCVVZkeGFHdG9nZUpPSC84cEFZK1lm?=
 =?utf-8?B?N1VYWUJGUTZpOVJGWGxhTmlYdzdJOThwaHZlRzI4RHY1TzgwMmNOUFQ3ZnRt?=
 =?utf-8?B?c1cwanZ1aUZxRHozSktzYTBNUjU3TEY1YWN3cThXL09ZNG8yOUJBWVh3UDFw?=
 =?utf-8?B?RnJSUUhYWGxndlF6L3hYNE83Wm5wVDNmYUcrNUZuamhJY0I1VGNveGVDYnJp?=
 =?utf-8?B?eEo4RWdCam53aFg0N05pYng1Wmp1UjhpOENCMlpsTk9QZHJMTzEvQmcxRkpC?=
 =?utf-8?B?Wk5CZlZSYVZueWYvYVZVK0F6eUFPVG8xQXdUb0pNZzFENSs4d0FyNjNHZERh?=
 =?utf-8?B?MURYSVRacE4yZ0hqYTMzQmNqa0RPRDhXbENJcW1XVzlGS0IvWVcrU2NCbDBl?=
 =?utf-8?B?VGd5T3hHYy9nYjFCMEpNWXVXUnAvV1lwVTYybGdaRzkrQm0zbkVkajEzcXRw?=
 =?utf-8?B?c1U5cWNKQ2F6ZUFxMG9qMWhDTG9SMk5Vei92dkNXMG9oNTBVVkVGVFJ5WmRE?=
 =?utf-8?B?MndUVElxSDNQZFFud2VKNUFjeXFkWHhZZEJMODlnU3BZN1dTOWhDN1NzQ0Fl?=
 =?utf-8?B?YldxeFdGQkh5M2lkYXgwazMzR1RHY1Q5eDd1MmlSSVFOWGNlTkt4S0hLeDEz?=
 =?utf-8?Q?oYq43NlapsI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dFFiVlJyTEUwZDhEM0lLMmp5VDBhWG4rSnljMzZNdGRic0tDU3ZTMGRjeFZn?=
 =?utf-8?B?V2hJZGJXWkxXM3lHbmFpV0h0NTE1cFlNa2hvei90VTIrczRxYUpRejcxSmpv?=
 =?utf-8?B?MmhUSVVLanBsVER6ankvanBZQmsweDNsVXBvTmdsaVFYdzhUd2plRld0aThq?=
 =?utf-8?B?aStUYTBOMjF0RlV6SlBRWFhZZ2tnelBIOXV4WlA2N1BpZ2xHUitmODFwQVdY?=
 =?utf-8?B?Mnd5c3FvNE4zSk5PdHVlVFQ0UzdnY212dU1tclY3ZXhiRzc4anZmVDQ2SWVH?=
 =?utf-8?B?bmZOR0Z3WldiU204djFtN2hDcXI2VjJNKzlZaDRVOEF0ZG1Rb1d0eEd4UHJF?=
 =?utf-8?B?aVZBc2pGaEc5cFgzUzl0WGxZaFFOcGIrUXYzOS83eit2RDNwWm5VWUFHZ01k?=
 =?utf-8?B?ZFNrRFJwSFRiTGlLRzlJcXhndlpWLzJyaFJVV0N2aHpBK2s4eHR1T2VwQXM1?=
 =?utf-8?B?L1pwRDBHMnJEUjBLRUYyNVBPWUlBUjhZMnNWdTFDdWJrcGFhSkNlcTRoV2Fk?=
 =?utf-8?B?YnV5eWtmRGJxNjBzWlhZZW4wY1RHZnhoRk9MQlFQdnpMaytEV3VnVEZEZmQr?=
 =?utf-8?B?aEpCSkxrSE9FMzllQ1V0Z0ZxVXVoVmV3VUo2RFFjZitySzdjdUtaYkF4K0lo?=
 =?utf-8?B?NnIrQU5Nbys2TndsWkl0UDB6M0FrUEUybWdmOWRjQ1hKemhpbFFBUDg3a1g3?=
 =?utf-8?B?d0xTM1Zld3UwMmlDNHFKZG1mblpROUgwQU1sTjRsa0d2SHd3YUlCeWgxcGZs?=
 =?utf-8?B?VW5seDVudEUzM3ZLQnZwSGllanJMWEowa1U3T3Q3ejlSdU9kemtXYXNNMzZm?=
 =?utf-8?B?TnNEaXIveGV1Znl4VGtJK2dFMDBXOWZDR1cvNGY2RUQrbUJsUW5SNHQ3ckxj?=
 =?utf-8?B?V2k0cG8wT2hmMjB3L1dKZFQ4WUxQNzJoa2lKcDdDbmEwNktXZGJjUVZYRTUv?=
 =?utf-8?B?VzRnN1AxYTlHT2ZWNVA2S1l0c1lIcWZBZ0drNlhsYWdUTDIySU5QNnAybEVK?=
 =?utf-8?B?OGs4THJ2aHBhdHBaRkU1QTJTT2xWMFI5NnY5WVpYN0ZTMDNmeVR0L2U2aVo3?=
 =?utf-8?B?NUhud3ljYUUrN0M1NjMwc3NuREd2eUtIRVl1ZCtmUlV6OTROTlQrZ3hubVlP?=
 =?utf-8?B?M25wRE8vbTY3VUQ4UDd1SVdWMnpJcGJXTHhwYkhmLytpRjZSNXE2QnplSWl6?=
 =?utf-8?B?Z0hPQS9BcENFc3VvUzlQdUJnN2V1SDRlZWhnSXQzMG5mSkIrWVU3SGpFMVA0?=
 =?utf-8?B?VDUxbnFsaWs1NHlxcE5IZWZRSzZDR3RDcDlBUkUxUi84VVpaekRGOWFUM1V4?=
 =?utf-8?B?NU9IMU1GWEpKWGxyYUNKazNySmtJOU1aMmlqVlZ1ckI3MExDTFQ3dmRaZ09j?=
 =?utf-8?B?MzYxS1hzMUZiTFo3c2JZTmlzTXh3Q09LZjVNNUlhU0F0L1dFSWI2eHRzNnlM?=
 =?utf-8?B?czFEU05jZkx1Q3E2NURLdzVpMHIzejZkazJjRFhFRUVKWHEvdExMUGpRbVdK?=
 =?utf-8?B?Z1RMTWVpb21qUXZQUkxDWlpsR2QvRVhHMDFxaUljU1NCMFdQVC9adVdHREp6?=
 =?utf-8?B?WU15b252WHgrbVRBZGlGUE1pU01iVEVWNk1mZmZpZ0NGTzFDR01MeFkweTkv?=
 =?utf-8?B?eDd4RGtnOTNMdlkzUm41c3ErT0JkdFpPYTFHSW1UNXVEYkRJM3o5cEEvZ005?=
 =?utf-8?B?N0cwU3ZaMktIQnJjMkJtdEdtUGZ4djN5ZXZ6T3psS2tnU1VOeXoySHVmU0dk?=
 =?utf-8?B?ZnRlZHNDWEVXa3hXRER2S0JSQ25uVlBZUUpBQzlwV3pxbWJtUjlib3pnQXpF?=
 =?utf-8?B?bnhoYlNvQ1UxSWVuWFIzdkRreXB3ZlJxcnZzSkY0SU5nSkttY1phcklpT3c4?=
 =?utf-8?B?R1Bac3FwZDFiTEVObFdncDF0QjJyVW03Y0llcUtSb2o5TkVvdzcweXNZcktv?=
 =?utf-8?B?dHpUOUlFTlFFNzUvZzVXU09CU3A5djF0aFpOWWJTaHFkTzRhcU9SbUFxR0Ri?=
 =?utf-8?B?UFBOTW0vcWVqK0JJaXRCak16L25QYndFY1Z1WDhRNXI3bVZsN3F5dEJXeW5h?=
 =?utf-8?B?aXQrZWlVN2JmOFZxNjBjZmJlcHNFUFFhejRzNFJyUzlKMXY1WlZ0emFFdnRU?=
 =?utf-8?B?eTY2VFp5Y0pSWjBXMXdqTTl6RG9JdGIrWGZ3bUFxaUpjUU5obzJaTHdjaUk4?=
 =?utf-8?Q?fF0W9Hgjj5xHwlcWxzZYSiY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2478207-d3f1-422d-e01b-08dd8f14c119
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 16:15:46.0831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jgcBsTICgGd6QZxxkTrfNTrcguUlq+02LrRQMj6v18zTsTplHlwqolc9kpj1sFcaXdivUywKlz025vQNgV8/rakMD3cR1pRr/qmr70WoplQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6407
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

On Wed, May 07, 2025 at 11:10:13PM -0700, Matthew Brost wrote:
>On Wed, May 07, 2025 at 04:17:43PM -0700, Umesh Nerlige Ramappa wrote:
>> On Wed, May 07, 2025 at 02:22:13PM -0700, Matthew Brost wrote:
>> > On Wed, May 07, 2025 at 04:14:22PM -0500, Lucas De Marchi wrote:
>> > > On Tue, May 06, 2025 at 06:30:42PM -0700, Umesh Nerlige Ramappa wrote:
>> > > > Where available, add support for 64-bit CTX timestamp when calculating
>> > > > job run time.
>> > > >
>> > > > v2: (Matt)
>> > > > - Use xe->info.has_64bit_timestamp instead of version check
>> > > > - Allow timeout > 100sec on platforms with 64-bit timestampt
>> > > >
>> > > > Suggested-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> > > > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
>> > > > ---
>> > > > drivers/gpu/drm/xe/regs/xe_engine_regs.h |  1 +
>> > > > drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  1 +
>> > > > drivers/gpu/drm/xe/xe_device_types.h     |  2 +
>> > > > drivers/gpu/drm/xe/xe_guc_submit.c       | 18 ++++---
>> > > > drivers/gpu/drm/xe/xe_lrc.c              | 64 +++++++++++++++++++++---
>> > > > drivers/gpu/drm/xe/xe_lrc.h              | 10 ++--
>> > > > drivers/gpu/drm/xe/xe_pci.c              |  2 +
>> > > > drivers/gpu/drm/xe/xe_pci_types.h        |  1 +
>> > > > drivers/gpu/drm/xe/xe_ring_ops.c         |  8 +++
>> > > > 9 files changed, 90 insertions(+), 17 deletions(-)
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > > > index da713634d6a0..52f4c96c01dc 100644
>> > > > --- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > > > +++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>> > > > @@ -154,6 +154,7 @@
>> > > > #define   STOP_RING				REG_BIT(8)
>> > > >
>> > > > #define RING_CTX_TIMESTAMP(base)		XE_REG((base) + 0x3a8)
>> > > > +#define RING_CTX_TIMESTAMP_UDW(base)		XE_REG((base) + 0x3ac)
>> > > > #define CSBE_DEBUG_STATUS(base)			XE_REG((base) + 0x3fc)
>> > > >
>> > > > #define RING_FORCE_TO_NONPRIV(base, i)		XE_REG(((base) + 0x4d0) + (i) * 4)
>> > > > diff --git a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > > > index 57944f90bbf6..8619244b7c7b 100644
>> > > > --- a/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > > > +++ b/drivers/gpu/drm/xe/regs/xe_lrc_layout.h
>> > > > @@ -12,6 +12,7 @@
>> > > > #define CTX_RING_START			(0x08 + 1)
>> > > > #define CTX_RING_CTL			(0x0a + 1)
>> > > > #define CTX_TIMESTAMP			(0x22 + 1)
>> > > > +#define CTX_TIMESTAMP_UDW		(0x24 + 1)
>> > > > #define CTX_INDIRECT_RING_STATE		(0x26 + 1)
>> > > > #define CTX_PDP0_UDW			(0x30 + 1)
>> > > > #define CTX_PDP0_LDW			(0x32 + 1)
>> > > > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > index 495bc00ebed4..9446a739948c 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > > > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > > > @@ -334,6 +334,8 @@ struct xe_device {
>> > > > 		u8 has_sriov:1;
>> > > > 		/** @info.has_usm: Device has unified shared memory support */
>> > > > 		u8 has_usm:1;
>> > > > +		/** @info.has_64bit_timestamp: Device supports 64-bit timestamps */
>> > > > +		u8 has_64bit_timestamp:1;
>> > > > 		/** @info.is_dgfx: is discrete device */
>> > > > 		u8 is_dgfx:1;
>> > > > 		/** @info.needs_scratch: needs scratch page for oob prefetch to work */
>> > > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > index 813c3c0bb250..bef32f2b0081 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>> > > > @@ -936,10 +936,12 @@ static void xe_guc_exec_queue_lr_cleanup(struct work_struct *w)
>> > > >
>> > > > static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > > > {
>> > > > -	struct xe_gt *gt = guc_to_gt(exec_queue_to_guc(q));
>> > > > -	u32 ctx_timestamp, ctx_job_timestamp;
>> > > > -	u32 timeout_ms = q->sched_props.job_timeout_ms;
>> > > > -	u32 diff;
>> > > > +	struct xe_guc *guc = exec_queue_to_guc(q);
>> > > > +	struct xe_device *xe = guc_to_xe(guc);
>> > > > +	struct xe_gt *gt = guc_to_gt(guc);
>> > > > +	u64 ctx_timestamp, ctx_job_timestamp;
>> > > > +	u64 timeout_ms = q->sched_props.job_timeout_ms;
>> > > > +	u64 diff, max = U32_MAX;
>> > > > 	u64 running_time_ms;
>> > > >
>> > > > 	if (!xe_sched_job_started(job)) {
>> > > > @@ -952,15 +954,17 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > > >
>> > > > 	ctx_timestamp = xe_lrc_ctx_timestamp(q->lrc[0]);
>> > > > 	ctx_job_timestamp = xe_lrc_ctx_job_timestamp(q->lrc[0]);
>> > > > +	if (xe->info.has_64bit_timestamp)
>> > > > +		max = U64_MAX;
>> > > >
>> > > > 	/*
>> > > > 	 * Counter wraps at ~223s at the usual 19.2MHz, be paranoid catch
>> > > > 	 * possible overflows with a high timeout.
>> > >
>> > > this would not be true anymore with a 64b counter. Anyway, why would we
>> > > need to be soooo paranoid to increase this and consider a diff >=
>> > > 223sec? For the timeout check we can leave with the counter wrapping at
>> > > 32b afaics and not change anything here.
>> > >
>> >
>> > Why? If the counter is 64 bits I don't see why you'd wouldn't use all the bits.
>> >
>> > > > 	 */
>> > > > -	xe_gt_assert(gt, timeout_ms < 100 * MSEC_PER_SEC);
>> > > > +	xe_gt_assert(gt, xe->info.has_64bit_timestamp || timeout_ms < 100 * MSEC_PER_SEC);
>> > >
>> > > the assert is on the value of q->sched_props.job_timeout_ms.
>> > > Why are you removing it? Or even why is the assert in this function
>> > > rather than on init?
>> > >
>> >
>> > Admittedly a bit of an odd choice to have an assert here rather than on
>> > init. Also in practice the highest value I think timeout can be is 10s
>> > without a special build of the kernel to allow crazy high values.
>> >
>> > >
>> > > >
>> > > > 	if (ctx_timestamp < ctx_job_timestamp)
>> > > > -		diff = ctx_timestamp + U32_MAX - ctx_job_timestamp;
>> > > > +		diff = ctx_timestamp + max - ctx_job_timestamp;
>> > > > 	else
>> > > > 		diff = ctx_timestamp - ctx_job_timestamp;
>> > > >
>> > > > @@ -971,7 +975,7 @@ static bool check_timeout(struct xe_exec_queue *q, struct xe_sched_job *job)
>> > > > 		ADJUST_FIVE_PERCENT(xe_gt_clock_interval_to_ms(gt, diff));
>> > > >
>> > > > 	xe_gt_dbg(gt,
>> > > > -		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%u, diff=0x%08x",
>> > > > +		  "Check job timeout: seqno=%u, lrc_seqno=%u, guc_id=%d, running_time_ms=%llu, timeout_ms=%llu, diff=0x%llx",
>> > > > 		  xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
>> > > > 		  q->guc->id, running_time_ms, timeout_ms, diff);
>> > > >
>> > > > diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
>> > > > index 9d9be9383207..b5f5547c7c4f 100644
>> > > > --- a/drivers/gpu/drm/xe/xe_lrc.c
>> > > > +++ b/drivers/gpu/drm/xe/xe_lrc.c
>> > > > @@ -653,6 +653,7 @@ u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc)
>> > > > #define LRC_SEQNO_PPHWSP_OFFSET 512
>> > > > #define LRC_START_SEQNO_PPHWSP_OFFSET (LRC_SEQNO_PPHWSP_OFFSET + 8)
>> > > > #define LRC_CTX_JOB_TIMESTAMP_OFFSET (LRC_START_SEQNO_PPHWSP_OFFSET + 8)
>> > > > +#define LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET (LRC_CTX_JOB_TIMESTAMP_OFFSET + 4)
>> > > > #define LRC_PARALLEL_PPHWSP_OFFSET 2048
>> > > >
>> > > > u32 xe_lrc_regs_offset(struct xe_lrc *lrc)
>> > > > @@ -691,6 +692,12 @@ static u32 __xe_lrc_ctx_job_timestamp_offset(struct xe_lrc *lrc)
>> > > > 	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_OFFSET;
>> > > > }
>> > > >
>> > > > +static u32 __xe_lrc_ctx_job_timestamp_udw_offset(struct xe_lrc *lrc)
>> > > > +{
>> > > > +	/* This is stored in the driver-defined portion of PPHWSP */
>> > > > +	return xe_lrc_pphwsp_offset(lrc) + LRC_CTX_JOB_TIMESTAMP_UDW_OFFSET;
>> > > > +}
>> > > > +
>> > > > static inline u32 __xe_lrc_parallel_offset(struct xe_lrc *lrc)
>> > > > {
>> > > > 	/* The parallel is stored in the driver-defined portion of PPHWSP */
>> > > > @@ -702,6 +709,11 @@ static u32 __xe_lrc_ctx_timestamp_offset(struct xe_lrc *lrc)
>> > > > 	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP * sizeof(u32);
>> > > > }
>> > > >
>> > > > +static u32 __xe_lrc_ctx_timestamp_udw_offset(struct xe_lrc *lrc)
>> > > > +{
>> > > > +	return __xe_lrc_regs_offset(lrc) + CTX_TIMESTAMP_UDW * sizeof(u32);
>> > > > +}
>> > > > +
>> > > > static inline u32 __xe_lrc_indirect_ring_offset(struct xe_lrc *lrc)
>> > > > {
>> > > > 	/* Indirect ring state page is at the very end of LRC */
>> > > > @@ -728,7 +740,9 @@ DECL_MAP_ADDR_HELPERS(seqno)
>> > > > DECL_MAP_ADDR_HELPERS(regs)
>> > > > DECL_MAP_ADDR_HELPERS(start_seqno)
>> > > > DECL_MAP_ADDR_HELPERS(ctx_job_timestamp)
>> > > > +DECL_MAP_ADDR_HELPERS(ctx_job_timestamp_udw)
>> > > > DECL_MAP_ADDR_HELPERS(ctx_timestamp)
>> > > > +DECL_MAP_ADDR_HELPERS(ctx_timestamp_udw)
>> > > > DECL_MAP_ADDR_HELPERS(parallel)
>> > > > DECL_MAP_ADDR_HELPERS(indirect_ring)
>> > > >
>> > > > @@ -745,19 +759,38 @@ u32 xe_lrc_ctx_timestamp_ggtt_addr(struct xe_lrc *lrc)
>> > > > 	return __xe_lrc_ctx_timestamp_ggtt_addr(lrc);
>> > > > }
>> > > >
>> > > > +/**
>> > > > + * xe_lrc_ctx_timestamp_udw_ggtt_addr() - Get ctx timestamp udw GGTT address
>> > > > + * @lrc: Pointer to the lrc.
>> > > > + *
>> > > > + * Returns: ctx timestamp udw GGTT address
>> > > > + */
>> > > > +u32 xe_lrc_ctx_timestamp_udw_ggtt_addr(struct xe_lrc *lrc)
>> > > > +{
>> > > > +	return __xe_lrc_ctx_timestamp_udw_ggtt_addr(lrc);
>> > > > +}
>> > > > +
>> > > > /**
>> > > >  * xe_lrc_ctx_timestamp() - Read ctx timestamp value
>> > > >  * @lrc: Pointer to the lrc.
>> > > >  *
>> > > >  * Returns: ctx timestamp value
>> > > >  */
>> > > > -u32 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>> > > > +u64 xe_lrc_ctx_timestamp(struct xe_lrc *lrc)
>> > > > {
>> > > > 	struct xe_device *xe = lrc_to_xe(lrc);
>> > > > 	struct iosys_map map;
>> > > > +	u32 ldw, udw = 0;
>> > > >
>> > > > 	map = __xe_lrc_ctx_timestamp_map(lrc);
>> > > > -	return xe_map_read32(xe, &map);
>> > > > +	ldw = xe_map_read32(xe, &map);
>> > > > +
>> > > > +	if (xe->info.has_64bit_timestamp) {
>> > > > +		map = __xe_lrc_ctx_timestamp_udw_map(lrc);
>> > > > +		udw = xe_map_read32(xe, &map);
>> > > > +	}
>> > > > +
>> > > > +	return (u64)udw << 32 | ldw;
>> > >
>> > > I understand doing this for the next patch, but for this timeout I think
>> > > we could just discard the upper part and let the 32b wrap.
>> > >
>> >
>> > Again why? Seems odd to not use all 64 bits if available.
>>
>> I would use all the 64 bits. The only problem with 32 bits is it appears to
>> be small, maybe if you run a job for something like 500s, then the wrap may
>> have happened twice and we won't know.
>>
>> Is the LR (long running mode) not subject to drm job timeouts? If yes, and
>
>No - LR are not subject to drm job timeouts.
>
>> if there is no practical need for 64 bits for regular mode, I can revert
>> those parts.
>>
>
>IMO we should still use all this bits available to us, but agree there
>is no practical use as long timeouts violate the dma fencing rules. Do
>whatever you / Lucas seems best. Series LGTM.
>

I posted a new revision with just the 32 bit timestamp for TDR to get a 
head start on CI. Will wait for Lucas to confirm which one to use 
eventually.

Thanks,
Umesh
>Matt
>
>> Please advise.
>>
>> Thanks,
>> Umesh
>> >
>> > Matt
>> >
>> > > Lucas De Marchi
