Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD20D59D77
	for <intel-xe@archiver.kernel.org>; Fri, 12 Dec 2025 16:38:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 089A410E08F;
	Fri, 12 Dec 2025 16:38:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKC5BaJs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C410E08F
 for <intel-xe@lists.freedesktop.org>; Fri, 12 Dec 2025 16:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765557507; x=1797093507;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=05lX/siuKKuv/Nyy5HK/kw4nNXmzjZtJAuB79Z4i4wg=;
 b=LKC5BaJsaNXZlvg+CJ9ovY4Py5RJhZWh9XhbtSEEEJ4iiWjD0Ta4PpRE
 3w4Qud99mm1kn/GMCc3aCeWcz6xYWfZcgE6pyHwGc3HWxiBsd8UIuRwx3
 tOVMCkxAkHOgLsqSCXTGtBDWgZATECbV1Qbo6ipR8NltPeNhyXuCShYMG
 awO18A1LVkKviKMYUNValJgYoitvCeOOouiH1dlYPOxDxrbtNTf2V1tnr
 l//8Nw8BazNLXXGcMK53ro/onveiNEKMUMF03jKRq0Z/nx0tUjf0Dqa2S
 ZiMVHYuICsBdZna6WT5NkKZvkc5n5TO1uGAnuP+3E73/RSqOHRCKfk9vJ A==;
X-CSE-ConnectionGUID: +7PnhaeRT5+IVl/3Ef4aOQ==
X-CSE-MsgGUID: rru1cvjQSP65WhxQ25dj5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="77878341"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="77878341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:38:26 -0800
X-CSE-ConnectionGUID: R2vIWkCMQSGYIEGxZP70Ew==
X-CSE-MsgGUID: aznK55stTROG3Ioi6lu/oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; d="scan'208";a="197617024"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 08:38:25 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:38:24 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Fri, 12 Dec 2025 08:38:24 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.37) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 12 Dec 2025 08:38:24 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JMIG7o8QMq6LQlIWXKPKmf3+e4h//oFREhe7rzCP5JchrpGvHhtJuSMUxB+7jJcJV+F4ccQ7B5jmZAoCEDFWmF713YBWa+6Y6tackXSncIgnZmM5V1l+r6hGz6Ge5Sf+HjEgsL2B6NqLXCPPRmXaIA1/F4X8tbPFQsnBi2tvhdiDA9KRTa2wRY9WtQa1fFWMz1ppHAGmCEJmHEtplv+mQDU5ypK+kASy2oYBdZrJ4ayOjGTBFDVWYA3doqjmCuqfkTOamZWbkCXNqHWxz0JMeiDZXai6Eo8Qrum/8CR4Zocm2oa/ayWN7HBOw7JFOVgIzHfY5qCvP2xyouaaK7ddcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NxpTyOx0L72N2pDDjG9sQpDZ46FpQW8ZsKgoqILG39k=;
 b=BIAqo43rsv4Ah4XoZlivJqLJ6bezVOd417Qwb+BGDSFXsSNRxrXAJ7AX0MkhaphjM8L/2INIcenhH7eP69qlURfUoa443T6PklSwN50/V2EAqbkA4cPP+LTq6Wr4N+Qv4505rcHTg/Nb4/hooXPrC9SbCy5wg1RrPOJAQQT/u6aEldnnMdMtSeYA+uC3tzvcIzC0lUoVxJqEbuWRct6MzOChiVJBr85f78Lqx1OawfVMAAfwXyW68oYI/WpDmJT2i107Bq6MSSBEykplFLBJmHXoiwP51I9DhajwpuYbRTaCKN39huIDw/MnPKMvlxedmbrv5WJtTc/l0BEgMnM+2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by CH0PR11MB8085.namprd11.prod.outlook.com (2603:10b6:610:183::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 16:38:22 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9412.005; Fri, 12 Dec 2025
 16:38:22 +0000
Date: Fri, 12 Dec 2025 08:38:18 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, <francois.dugast@intel.com>,
 <michal.mrozek@intel.com>
Subject: Re: [PATCH 5/6] drm/xe: Wait on in-syncs when swicthing to dma-fence
 mode
Message-ID: <aTxE+my7z8w8v3/S@lstrano-desk.jf.intel.com>
References: <20251211210032.1520113-1-matthew.brost@intel.com>
 <20251211210032.1520113-6-matthew.brost@intel.com>
 <97f524d334045e0819cee861e6e7d21598509424.camel@linux.intel.com>
 <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aTxDwLgkmycUKk+S@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0210.namprd03.prod.outlook.com
 (2603:10b6:303:b8::35) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|CH0PR11MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d8f6401-324a-48f0-1f94-08de399cdd10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YlhML2l6WlBXOWN0eTRqVWNOdWQ3YzJjREZRaHhJUUQ5WG5HNytRL2ljUmov?=
 =?utf-8?B?M2pEQzFsS2dTUjVocjd2THZ3a0ozR2p1UXNYdHNacDFMdXRqTFlYbEc0dkVk?=
 =?utf-8?B?dGZIZjNlclNuR3laRnhTdDdHSWNDVk9oc21wWHNiTTRpWTNFeTAwbnpRUWtK?=
 =?utf-8?B?aXFHblRyUXNRam1ncUlKNmoyUnVSQWxqVFZYMlUzQlU4Vm5KM2NQdkluaU5q?=
 =?utf-8?B?b1AvOTd5T01mckttM29SeFdZTnRPMDh4WHJJanNBQzJma3JMS0Evek15MmtN?=
 =?utf-8?B?STRwK05EWk5xUkRSVGgzVWJqYjBFa3l4WXQ2RnRkQ2RURDNFT0t1QytCU2NI?=
 =?utf-8?B?amVNdEh5WDZOTUhIZEtldEl1NWVRdkZxallHS3hJdGh6QUJyY0VlWWNQbkx1?=
 =?utf-8?B?TUZyWG1Fb0lZbkR6SFZBUEFObXdNUTFJNWVVUmwrOUQra3lvbnlUR054QjJn?=
 =?utf-8?B?dmlyR3dtQUgxOExIck5ETWd5c2ttRTZwT2paUTJ4VGtCaHVPS25tOXdjWjZF?=
 =?utf-8?B?aVRueWtiMm9oVEY0ZWd6WkRmM2U5MVM1ZkxqVkNpTXdRczBYRHpWREl3Y3h4?=
 =?utf-8?B?ejBMTFc3MlR2RlRsUUxrbDFtQ0hVT3BUejhyeVRHcFYzSVBuSllPSWxIdFJE?=
 =?utf-8?B?anBZcmw0MDRNQzFJR3ZGc3FWa0p2RGRibW9lTDd3Y25RcDZXeE00dmFHNll1?=
 =?utf-8?B?MG9KOCtJZ2pMMjhTQ2Q4Um5qbStXY0pPQjU2alBYYytyc2hUUDVCRXA4VUR6?=
 =?utf-8?B?UlA4bWl2b0xsTGpwci9xeXpZY0owYnUwOHM3bmZkK3NMbVF4UjBTNWFUcTVY?=
 =?utf-8?B?eUtZSkV4MUU0c1VxWDVxRFM0eWIxTWt4TXlqYzFGdjk4dGM4VE9DSDVuS2NV?=
 =?utf-8?B?YjJoZlR6MVJXRnBCTzQzbmY0NUJGNm9nTWM5SVBWSUszSlJoY2QvaTVYbGlr?=
 =?utf-8?B?TURmZmR1bXl2RlpxdDQ2UjRwSFZaMytZRnNNSktOZTI3MEJuUzN1T3pUaWlH?=
 =?utf-8?B?cldqREJJREpvR21jZE5ZUGFVL1F0eXdzcXRzL2VwcnZQZ2VSUGdDdUl2bjFm?=
 =?utf-8?B?NVZyeFhkcGVXUU9rWWEwRVptVEh2TzJvMldadThMci9ZTndLd01kWGVLRFlr?=
 =?utf-8?B?cW5DdGh2WWh5RGpyOHlXVWZRV1FwWjJjYXlMYkdjaTNCQ1o5akNOY1ZqVC9k?=
 =?utf-8?B?aVc3eWZiWHZjTmhPck8yK29ERjRqbnlKWEtSaEN6amJ3VXhWWHJBTnFWN2ZR?=
 =?utf-8?B?UitHWGxjRFhoWGxsVlpYVkpMNkpvNGlxaGIvdExHZDNzRVpEQVlyOXBDYWJp?=
 =?utf-8?B?VS9KUXArT1NXWTBKRkcvRGcyd3BtVzN1dG9pWjNqWVRsOWFHdXBOUkk5R1pO?=
 =?utf-8?B?anY1NE9RSFd0Z0RXOHJtOVhqZVI5RUNGem12ZW9uZSt5WnYySHZxZzV0NmFG?=
 =?utf-8?B?T0RYVndLakdoY3gvenU5Vzg3eFlEOElIVExZbkEzaFZPVFVJZUdxeGtkOVV6?=
 =?utf-8?B?STYxendvS2RXNlJzbDN3YXBEUDcxamFlM0tLUS9Rbmd5d3FHempUTk1wdkJU?=
 =?utf-8?B?V2Q1SHhHNU40UHZIWVU2NzRHRzBhWTAvVkgzZFdiUTlyeXMzdGVVY1k0cGcy?=
 =?utf-8?B?OG5rRmxnVWZRV0F4TExaUXBwdVRZUG5UYjl4UW50cVpWRE1NNGNKc0dRdEZx?=
 =?utf-8?B?aFlPeVRrRllkTWJjZTFxTUhKTnl5K3B1UGZUNWJ1ZklldHdvL3VEWXA4U3FU?=
 =?utf-8?B?VTVpYTlOOU5YUHUrWndURVBvbkIvdFhGTE5jbnVxckJlU1BJYkZidHlPTVZw?=
 =?utf-8?B?aHAyckZWQnp4ZTlLb2JDd0tDdHU1S2pkTXFnQlNwckZvRGtMMmloN2RieFQz?=
 =?utf-8?B?b3Mvc3MzWmpTbGEwQWJLcEcrV1JPYkg5NzRJQW1nWExhUUFKYkJFTXhKTlpr?=
 =?utf-8?Q?5ld30970Hou0Vra10wx7dqCte5g9jImO?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QkkwUGVoN1RyWHQwbWk0TDRYUWppeGJLTWJpMW9wQU5KVmpTYUF3UzFwazZu?=
 =?utf-8?B?N1F2My8xUjN0d1pLbTBrUHZ6MDUyMXVQbktVekMrenE2bjhFZ2RoOGlIdE5i?=
 =?utf-8?B?ZEVjQ3JwNm9TUWF6RVpGK0dpYjdkQnVQY3U0MmMybFV3Q1JDWU1LSkZXL3Zs?=
 =?utf-8?B?YkNSSmhWM2sxQktJVGhjR1dhdWR1SERjdmNLcXptdGhEOVN4R2lvKzl1TVlI?=
 =?utf-8?B?QlpwcXZZQm9rS3NycUJ4dHB5d3VnK2dQV0RSRU95Wkl2U3VkNmdLZGtycTUv?=
 =?utf-8?B?M2RrZDRENzJIMk81cHVIQmp1bElIRGRUVEFhc1N4TExLRHY0QzQ4aitGd2wz?=
 =?utf-8?B?RGQvdjYyNjM0ajNUcXFKOHVPMDR4cHlIcFFYQXJYWTRhZDRPOHA2TFhneFli?=
 =?utf-8?B?QkhJTE53enIvL3BrZTMyOEVvTHdBNXJaSjdUdmJSc1RpWEZRV0tOQy9oY09p?=
 =?utf-8?B?ckNzNlNOenlWNUFrc0NjM3p3by9JQlBFa3REK1lRUlJyR0M0ZTV1QVRTZkNV?=
 =?utf-8?B?Z2ZxckhTNTYrNFpCZFNsL0toaWVrbHVkWVFLVWxNdDZqU1c5TUhZajFKMFdE?=
 =?utf-8?B?UjVsRkdjOThtV1dsMDk5bzQvdUpOMXFXQlNpM2g2Sm5QQ0hkbFdITDl0bzlp?=
 =?utf-8?B?TnpFVzN3Nnl5aVZSUEY2a3BTNG11TWRaQVJtalA1cFlxNTc2OFhRMWJUNTRP?=
 =?utf-8?B?Z1ZzRm9zMFFxWGZaa1B3SElDMDZZNnNOT3NQNEMveUJCeERuZitLRFN3eStP?=
 =?utf-8?B?Tk5Cak9CZytaeFhFVldEQkxGMmd5MEQralI2MVUvRUlSbE52MUxXckpPNVZi?=
 =?utf-8?B?SkdGVlFZRVBUK2o4NGd4dVYycFZKY3c3RzJlNkJqcWMxdXpnTEJFWkg3b244?=
 =?utf-8?B?YkVjTG95V3dMNWhwSGtYTVNNRjMvN2RnSDAySFNSMlpkaitCMzNkRTRWUUhV?=
 =?utf-8?B?eXNPaG50dW1KZjVsWmlvRFJOb2s5NUZCa3A3T250NGVHVCs0enF5dmhZRXFs?=
 =?utf-8?B?cGFHcDFBd2lDZU51RDkwOVRrdWxNaWVPeklkbWJNMlZkbE5LSWZRc0FVR29s?=
 =?utf-8?B?dnJFZEVCWTM0RG50R09iZTMvdStlRCthRzFPNlRTS0FGTGY3UEVEaHcrUjN1?=
 =?utf-8?B?TjlObEdtWXdJVzA5TC9qaDlxU09JOXMwbzhIZUsvejV3aUFON1RhaWVJbm52?=
 =?utf-8?B?U0w0bkg5NUlZZkRhaTRVRE5ub25ibHFNNkxrTlVzVW5lNm93VGNVUEZyVEtu?=
 =?utf-8?B?V21pOEg1NjlpWklVTFUvamFNM1B2Mkk5YmhTVGNvZ1BxOHVWL2JhcDlLM2t4?=
 =?utf-8?B?SFRVVGxTZ1VOZGdkNXZ5R0xjZlhKWnBrc0xEb0JYb3Yyay9YdnNEQWtzN0xk?=
 =?utf-8?B?UmlNMUtwVFlsSCtheTkwYmRCa0x1UUwwN2RNanlOYm1VMVpWL0tzTTQxUitE?=
 =?utf-8?B?Y3kzVGxYZHBTN0htVU1UbXRIL0JlbzFsWndqKzFwS2RoTHY5UVJDTllCRjA1?=
 =?utf-8?B?YWF6SDdVQnpIL0VjUUZBSXNQTnZVMy8wVHNCTWdvNWp5M2x2WGNoRUUyaktG?=
 =?utf-8?B?UXl6Q0ZGelVVdVRWQnZPK0RxNmZpekhKU053TlE1YUlOamhnVmYyTzdTeFVS?=
 =?utf-8?B?M0tDNGttRG16ZEJvbWlhNlgyYlRINFRsNDRnQUFtRUJLVENVbGxidDVjZ29J?=
 =?utf-8?B?UUNCNnlYQmxsTjhZMVFndERkZDVvWGRHL0dXN29FK0FNSjkvdGgxdmhqM3ZH?=
 =?utf-8?B?QkMvM0c0OWhPVzQ3bHp5VUtOY25zWnZBTHdOdnhsUlV3Qkw0WUNYVFZJZm1O?=
 =?utf-8?B?M3hmd2JXYmNydG1Cdm1DdlV5MGwxSnFGRHUrQm9RSExLQ1lFUkdLRmNWdlZ0?=
 =?utf-8?B?cFJWemZMSlVIbld1VXNtMGtlZUFZNjNqZk4vS1BNT0cyTW5EWWdCNlk1SDR4?=
 =?utf-8?B?NkJrcmprbDJ2aU9ycWtKYjJaREZqWE5FeXhEV3ZjWTFjMWpSUFN5TlA1OGww?=
 =?utf-8?B?SURjR2VMYnZLcEp4MnlWZlBMc2JEZXZhOG5DM3IrYTdEOHZ2cms2am1BeHpl?=
 =?utf-8?B?RU0wbStsN0tDdjdLaTQ5NnZRbXdsQ0thMW1hNWQ5T1J3d3VFeDFGVGlGNitC?=
 =?utf-8?B?dlg2Z0FDZEdrUVdWRU1TQm81ZVV0MktpNjdiQTlzWUkrNlpCQVZXYnVNNmZo?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d8f6401-324a-48f0-1f94-08de399cdd10
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 16:38:22.1869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BkeQKE5Ppw4GSKuFURLHbaaphcHFQ4YGnnsbHB8fpgwHBDlrrXt4wrlczF/hveoU5EcCGnPbhgdTanQiDVFGNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8085
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

On Fri, Dec 12, 2025 at 08:33:04AM -0800, Matthew Brost wrote:
> On Fri, Dec 12, 2025 at 10:22:54AM +0100, Thomas Hellström wrote:
> > On Thu, 2025-12-11 at 13:00 -0800, Matthew Brost wrote:
> > > If a dma-fence submission has in-fences and pagefault queues are
> > > running
> > > work, there is little incentive to kick the pagefault queues off the
> > > hardware until the dma-fence submission is ready to run. Therefore,
> > > wait
> > > on the in-fences of the dma-fence submission before removing the
> > > pagefault queues from the hardware.
> > > 
> > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_exec.c            |  3 ++-
> > >  drivers/gpu/drm/xe/xe_hw_engine_group.c | 34 +++++++++++++++++++----
> > > --
> > >  drivers/gpu/drm/xe/xe_hw_engine_group.h |  4 ++-
> > >  drivers/gpu/drm/xe/xe_sync.c            | 14 ++++++++++
> > >  drivers/gpu/drm/xe/xe_sync.h            |  1 +
> > >  5 files changed, 46 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_exec.c
> > > b/drivers/gpu/drm/xe/xe_exec.c
> > > index 4d81210e41f5..5bc598ba6afa 100644
> > > --- a/drivers/gpu/drm/xe/xe_exec.c
> > > +++ b/drivers/gpu/drm/xe/xe_exec.c
> > > @@ -202,7 +202,8 @@ int xe_exec_ioctl(struct drm_device *dev, void
> > > *data, struct drm_file *file)
> > >  	mode = xe_hw_engine_group_find_exec_mode(q);
> > >  
> > >  	if (mode == EXEC_MODE_DMA_FENCE) {
> > > -		err = xe_hw_engine_group_get_mode(group, mode,
> > > &previous_mode);
> > > +		err = xe_hw_engine_group_get_mode(group, mode,
> > > &previous_mode,
> > > +						  syncs, num_syncs);
> > >  		if (err)
> > >  			goto err_syncs;
> > >  	}
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > index 4d9263a1a208..35966889c776 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > > @@ -11,6 +11,7 @@
> > >  #include "xe_gt.h"
> > >  #include "xe_gt_stats.h"
> > >  #include "xe_hw_engine_group.h"
> > > +#include "xe_sync.h"
> > >  #include "xe_vm.h"
> > >  
> > >  static void
> > > @@ -21,7 +22,8 @@ hw_engine_group_resume_lr_jobs_func(struct
> > > work_struct *w)
> > >  	int err;
> > >  	enum xe_hw_engine_group_execution_mode previous_mode;
> > >  
> > > -	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > &previous_mode);
> > > +	err = xe_hw_engine_group_get_mode(group, EXEC_MODE_LR,
> > > &previous_mode,
> > > +					  NULL, 0);
> > >  	if (err)
> > >  		return;
> > >  
> > > @@ -192,20 +194,32 @@ void
> > > xe_hw_engine_group_resume_faulting_lr_jobs(struct xe_hw_engine_group
> > > *group
> > >   *
> > >   * Return: 0 on success, negative error code on error.
> > >   */
> > > -static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > xe_hw_engine_group *group)
> > > +static int xe_hw_engine_group_suspend_faulting_lr_jobs(struct
> > > xe_hw_engine_group *group,
> > > +						       struct
> > > xe_sync_entry *syncs,
> > > +						       int
> > > num_syncs)
> > >  {
> > > -	int err;
> > > +	int err, i;
> > >  	struct xe_exec_queue *q;
> > >  	bool need_resume = false;
> > >  
> > >  	lockdep_assert_held_write(&group->mode_sem);
> > >  
> > >  	list_for_each_entry(q, &group->exec_queue_list,
> > > hw_engine_group_link) {
> > > +		bool idle_skip_suspend;
> > > +
> > >  		if (!xe_vm_in_fault_mode(q->vm))
> > >  			continue;
> > >  
> > >  		xe_gt_stats_incr(q->gt,
> > > XE_GT_STATS_ID_HW_ENGINE_GROUP_SUSPEND_LR_QUEUE_COUNT, 1);
> > > -		need_resume |= !xe_exec_queue_idle_skip_suspend(q);
> > > +
> > > +		idle_skip_suspend =
> > > xe_exec_queue_idle_skip_suspend(q);
> > > +
> > > +		if (!need_resume && !idle_skip_suspend && num_syncs)
> > > {
> > > +			for (i = 0; i < num_syncs; ++i)
> > > +				xe_sync_entry_wait(syncs + i);
> > 
> > Here we're in the write-locked mode, right? Ideally I think we should
> > just check for idle here and return a retry if not idle, and wait
> > outside of the locks. Perhaps also always wait if there are pf jobs
> 
> I think waiting outside the lock would be okay. Let me try that. I also
> forgot that xe_sync_entry_wait needs to be interruptible too.
> 
> > running on the engine group. Also we might want to include the other
> > implicit dependencies as well, like kernel fences.
> > 
> > Although perhaps this is good enough for now, and this would be easier
> > implemented with a scheduler?
> > 
> 
> I think we could reimplement the entire sharing algorithm via the
> scheduler.
> 
> It would be roughly:
> 
> - Switching to PF mode is a job that waits for all pending dma-fences.

Typo: s/that waits for all pending dma-fences/whose dependencies are all outstanding DMA fences

Matt

> 
> - dma-fence jobs wait on a job that flips to dma-fence mode. The
>   dependencies for the flip job are the input fences of the dma-fence job
>   triggering the flip, plus a possible outstanding flip-to-PF-mode job.
>   However, if the flip jobs are scheduled on the same scheduler instance,
>   we wouldn’t need explicit dependencies between the two types of flips.
> 
> This is a fairly large rework, and the likelihood of me personally
> having the bandwidth to implement this in the near future is low. Of
> course, if you want to take this on, I can provide guidance on the
> refactor.
> 
> So for now, let’s tweak things to something we can live with and perhaps
> write down plans for a long-term refactor.
> 
> Matt
> 
> > /Thomas
> > 
> > 
> > > +		}
> > > +
> > > +		need_resume |= !idle_skip_suspend;
> > >  		q->ops->suspend(q);
> > >  	}
> > >  
> > > @@ -258,7 +272,8 @@ static int
> > > xe_hw_engine_group_wait_for_dma_fence_jobs(struct xe_hw_engine_group
> > >  	return 0;
> > >  }
> > >  
> > > -static int switch_mode(struct xe_hw_engine_group *group)
> > > +static int switch_mode(struct xe_hw_engine_group *group,
> > > +		       struct xe_sync_entry *syncs, int num_syncs)
> > >  {
> > >  	int err = 0;
> > >  	enum xe_hw_engine_group_execution_mode new_mode;
> > > @@ -268,7 +283,9 @@ static int switch_mode(struct xe_hw_engine_group
> > > *group)
> > >  	switch (group->cur_mode) {
> > >  	case EXEC_MODE_LR:
> > >  		new_mode = EXEC_MODE_DMA_FENCE;
> > > -		err =
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(group);
> > > +		err =
> > > xe_hw_engine_group_suspend_faulting_lr_jobs(group,
> > > +								 
> > > syncs,
> > > +								 
> > > num_syncs);
> > >  		break;
> > >  	case EXEC_MODE_DMA_FENCE:
> > >  		new_mode = EXEC_MODE_LR;
> > > @@ -294,7 +311,8 @@ static int switch_mode(struct xe_hw_engine_group
> > > *group)
> > >   */
> > >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> > >  				enum
> > > xe_hw_engine_group_execution_mode new_mode,
> > > -				enum
> > > xe_hw_engine_group_execution_mode *previous_mode)
> > > +				enum
> > > xe_hw_engine_group_execution_mode *previous_mode,
> > > +				struct xe_sync_entry *syncs, int
> > > num_syncs)
> > >  __acquires(&group->mode_sem)
> > >  {
> > >  	int err = down_read_interruptible(&group->mode_sem);
> > > @@ -311,7 +329,7 @@ __acquires(&group->mode_sem)
> > >  			return err;
> > >  
> > >  		if (new_mode != group->cur_mode) {
> > > -			err = switch_mode(group);
> > > +			err = switch_mode(group, syncs, num_syncs);
> > >  			if (err) {
> > >  				up_write(&group->mode_sem);
> > >  				return err;
> > > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > index 797ee81acbf2..8b17ccd30b70 100644
> > > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.h
> > > @@ -11,6 +11,7 @@
> > >  struct drm_device;
> > >  struct xe_exec_queue;
> > >  struct xe_gt;
> > > +struct xe_sync_entry;
> > >  
> > >  int xe_hw_engine_setup_groups(struct xe_gt *gt);
> > >  
> > > @@ -19,7 +20,8 @@ void xe_hw_engine_group_del_exec_queue(struct
> > > xe_hw_engine_group *group, struct
> > >  
> > >  int xe_hw_engine_group_get_mode(struct xe_hw_engine_group *group,
> > >  				enum
> > > xe_hw_engine_group_execution_mode new_mode,
> > > -				enum
> > > xe_hw_engine_group_execution_mode *previous_mode);
> > > +				enum
> > > xe_hw_engine_group_execution_mode *previous_mode,
> > > +				struct xe_sync_entry *syncs, int
> > > num_syncs);
> > >  void xe_hw_engine_group_put(struct xe_hw_engine_group *group);
> > >  
> > >  enum xe_hw_engine_group_execution_mode
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.c
> > > b/drivers/gpu/drm/xe/xe_sync.c
> > > index 1fc4fa278b78..127e26129933 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.c
> > > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > > @@ -228,6 +228,20 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > *sync, struct xe_sched_job *job)
> > >  	return 0;
> > >  }
> > >  
> > > +/**
> > > + * xe_sync_entry_wait() - Wait on in-sync
> > > + * @sync: Sync object
> > > + *
> > > + * If the sync is in an in-sync, wait on the sync to signal.
> > > + */
> > > +void xe_sync_entry_wait(struct xe_sync_entry *sync)
> > > +{
> > > +	if (sync->flags & DRM_XE_SYNC_FLAG_SIGNAL)
> > > +		return;
> > > +
> > > +	dma_fence_wait(sync->fence, false);
> > > +}
> > > +
> > >  void xe_sync_entry_signal(struct xe_sync_entry *sync, struct
> > > dma_fence *fence)
> > >  {
> > >  	if (!(sync->flags & DRM_XE_SYNC_FLAG_SIGNAL))
> > > diff --git a/drivers/gpu/drm/xe/xe_sync.h
> > > b/drivers/gpu/drm/xe/xe_sync.h
> > > index 51f2d803e977..1c08f9ed9001 100644
> > > --- a/drivers/gpu/drm/xe/xe_sync.h
> > > +++ b/drivers/gpu/drm/xe/xe_sync.h
> > > @@ -29,6 +29,7 @@ int xe_sync_entry_add_deps(struct xe_sync_entry
> > > *sync,
> > >  			   struct xe_sched_job *job);
> > >  void xe_sync_entry_signal(struct xe_sync_entry *sync,
> > >  			  struct dma_fence *fence);
> > > +void xe_sync_entry_wait(struct xe_sync_entry *sync);
> > >  void xe_sync_entry_cleanup(struct xe_sync_entry *sync);
> > >  struct dma_fence *
> > >  xe_sync_in_fence_get(struct xe_sync_entry *sync, int num_sync,
> > 
