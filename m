Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A69606A336
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 14:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qq5dQu/a
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8875310EE76;
	Thu,  5 Nov 2026 14:16:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D990B10EE76
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793888213; x=1825424213;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Hu527+zekOhl97T9rm8CcBEOtA21Brvh/oKQ762S/ws=;
 b=Qq5dQu/aM7ua6UWLO+9H5+gJf4rA3G7tpUUtbLVQdiLOPZZRg8RCYjCZ
 yrOMw1eMHzpTxOCCKfqpZ8YhS6jwC0ItnYdw9S6wmRW4hR7tgB92G+2nU
 TsxOhl8jFjnsUUw2I8gIfOqgoOevpQXF71l9m8fBQXE7R6EY1/SH0hzmo
 6l+lmNzBiTSCd5TNxM4rpRemXU7qEg7m14tN77XtJIsfsJNxgve/FRsT0
 G32+UCkx36EaL1Yois5PhxvnlbHzXPoleadCWUZQ4yDPtLJluyl7o5glr
 2GWSXyAPbno4unxmx02WM9WRG5IZNbhtJJ9d5jQo75HybSsdgXXqQNqVV g==;
X-CSE-ConnectionGUID: Ny5XJehCSUWlPpEMguxBeA==
X-CSE-MsgGUID: iDK0osUbSru4CYZoyjl/WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2554733"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2554733"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:16:52 -0800
X-CSE-ConnectionGUID: VaG3wLuiT6u+mf3+qHZ/qg==
X-CSE-MsgGUID: OZ+19oV5R++dxVEs94BomA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="6912792"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 06:16:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:16:52 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 06:16:52 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.68) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 06:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lZUI3WIOIUwxm1R2kzuo87cbFntQjj+PdsRIlk2PRR3rXHizJ3rxG9ctbW51QQUuDpsO6gk6VxeL1CgdneYwhdMooO5a4lNT2xcwTJABPL3C9DUl4sUWbVMpfwnDgX1dOlkvWLJXDYCa/Ifgap1JZlJWCax6kz36sxUOYy5l8qqgYaVfibvd1WCGKgaEj79KQ5czAJoYTdXGEuFTaaamSfwfgrTQdUiwSvilRLNPKdVJLRSwt2jo7UvauQ/EjiNgWYNksGdOizssQDU0u3BuCmAcjZbqwNbITqEGK2pKutQ1lMCEekXAQ9SoHb1LcxxmUloSPZA0MrNw1r0SMdGwdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OJvel7VtmZLN4p+gGXI/jHN7hwrUqs/MDNsL5MqBT/g=;
 b=mS3W/+0TGp0TBrY/ZrfZ1ivt/y4dHYr24FKQAk6TdyzizmXIR61kUAjq+/EEYiVxp7KXe8FvvTtd23OrhQhQBZq1N+LsF+qVy6zanBrqZVydJDFDSHWNxGxuZFhReXHeTkDuOa7YCruNEthKZ4QjXdfR/wA2l2QamyqljNeV7ugp5CoMvId4o9ukRGwiiH8jHpckcmozwq7k3cEfIWCvxHeaCvF/HCboCOz9yWCWh4aRTwfiLHzMinnLWWyABy5jK1FFJhA36CS8c6iymLqYaRXvosEEDPyFBbqW+0r/dWdTj1dIfuy4oRet3a7AmP7NkeN6jHCD6w13VfmiPVrRkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL1PR11MB5366.namprd11.prod.outlook.com (2603:10b6:208:31c::17)
 by SJ1PR11MB6108.namprd11.prod.outlook.com (2603:10b6:a03:489::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.10; Thu, 5 Nov
 2026 14:16:49 +0000
Received: from BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848]) by BL1PR11MB5366.namprd11.prod.outlook.com
 ([fe80::942f:90a0:fade:3848%6]) with mapi id 15.21.0592.007; Thu, 5 Nov 2026
 14:16:49 +0000
Message-ID: <2c1770ee-0383-4d78-838e-32d18e8e53f4@intel.com>
Date: Thu, 5 Nov 2026 19:46:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/xe/guc: Demote uncorrectable local error log on CRI
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
CC: "Tauro, Riana" <riana.tauro@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>
References: <20261013033430.1885990-2-varun.gupta@intel.com>
 <cec2dc54-14e0-48b7-b0e9-54c410226f82@intel.com>
 <20261016223700.GD1329272@mdroper-desk1> <auyOfNAZ9Hb19Ana@intel.com>
Content-Language: en-US
From: "Gupta, Varun" <varun.gupta@intel.com>
In-Reply-To: <auyOfNAZ9Hb19Ana@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0037.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:175::17) To BL1PR11MB5366.namprd11.prod.outlook.com
 (2603:10b6:208:31c::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR11MB5366:EE_|SJ1PR11MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: a18ac71a-7601-451d-2098-08df3b476e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|376014|1800799024|18002099003|22082099003|6133799003|10067099003|4143699003|56012099006|11063799006|261026121527099003|261026140227099003|261028144727099003|261022113327099003|261021121427099003|261021123027099003|261102123227099003|261022105027099003|261022075727099003|261009223027099003;
X-Microsoft-Antispam-Message-Info: DUjdsnqiJ1cYRs7rVYyRkeC1LS3MSOemWPbv818bIFTyzKCX5gY/3nILMZZVycIK47hys2bKTeHK1fiUG/PPv2OHK1f9phgyoWA3xqRAZLF2ORizZut1x4JNGdip51nSNsqpyIABcYOaIh4MtTf6IXaxCBfBAq0fnMsxgEhKBUxYcwOhnKVa34pXE1r3UNaYN5kJAzgNTB91E7Yi7YPhZsmPU7c3FfpT9CpxdLm5eNmt3Fnnx0rZlerSKzVAzqkqNVS0ypKWu9CvkX4ZLHnn03BXs7UQk6PS3f3Za0zo12WWgW6hsaPpnmgHJmM11fJzQ6+yVjXPl2Z3ljsxQ5tPC6jtjl+vy9hWmsGmFjZ9akDUupYilULuJYkYUWvJdETB9kvJABAQ2Qmmr1fXLkr/ZBwE7GvX3QBweyHv6HmzAbcPcd5YuX0SKbqLtL3is5a4LG5trfd+fHEXTHjW3RXIkdSTCROoVKC7lwgJ3xbMCiS2JboDphD4gVtmgTSTlv+AmV/P8IheSsU2VWpc96gC75AzKAOhFfrNUKK0Io1rCMt4EXKTXqwUjag6F8hFOUMlG6+goyxoCBYhGhwFIXvsMsUG7NtqI4HtJtq0UOAWQKjZL2LfTnveGDTbuqHR/y8GLBYXF3D/1fd4XS0YYqlCz6/ScJwHJ9IEO0AASWLn4dA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR11MB5366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(18002099003)(22082099003)(6133799003)(10067099003)(4143699003)(56012099006)(11063799006)(261026121527099003)(261026140227099003)(261028144727099003)(261022113327099003)(261021121427099003)(261021123027099003)(261102123227099003)(261022105027099003)(261022075727099003)(261009223027099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y2ZpWld0Q3M1dDY2ZFhiSUNwQ2owVFlhWWdlY0tHYXJSa01Ud01RVy9yYVo2?=
 =?utf-8?B?ak1sV1JUQVlEWGdPeUFBemUvT1FxSHpRWlR1R1lmV1dkc1NqeC9OODB5STdz?=
 =?utf-8?B?UDBMQlNIcWRqd0gyL0hxZU8wakdCM0Nmcm02TUtCZUUxcS82dGl2M01nWnd3?=
 =?utf-8?B?Vko0bHB0ZGU4UFQxUTYrT2JLYlpwczM2VXFPdnhEbDZ0Y3pqZXFLcG9YbmNW?=
 =?utf-8?B?d1ZTTkFuMVlUZTJZWGxsMmxqZCt6Q3orK2xjNUc1bWwzazlKZ1FHRUY2VzVG?=
 =?utf-8?B?cjUwZU1iZVNaREx3MmdVSHhvWFJ0V2FXSjNTN0sreUlEWG1FQWYzZmxSWUVz?=
 =?utf-8?B?eWx4Y0RMYkFxMGNTdzFCR21udWppV1NUaDdwaVUxUGF2VVpxcVJmSGNOMElN?=
 =?utf-8?B?SzVqdERqVE5ucnZNOFhIYlNZd2ZvL2VzQnFKcTJWM3EwMWNrQTFsNXR1NWEx?=
 =?utf-8?B?aTUwNE5YWC9HUDYyMlJrMVdTMXYyQitWdDhMaUFKelBGRzh4SUpSU2pDMUNN?=
 =?utf-8?B?cUdOSE9CRklDVFJnZ1dxbzNaR0dSalBnK1VEN0VEd3MrRkIvQTBYaGFRcnRQ?=
 =?utf-8?B?WmErZlg5bUUyK1VFUjlFYlVoMS9iZ01PTjEvUnF1OXlNank3OE82T3l6QWpl?=
 =?utf-8?B?TEp1NUc2SFI0TnBBbldKR2Y3Mkg2cllGSFhSOFc2bWFnK29kKzFpSStxTTlN?=
 =?utf-8?B?UkpXVEIrK2ltM0tRWG9QV1hTTFM0Wm44M3pCbGJFL3lKQm5CdlBYV1hPTk5G?=
 =?utf-8?B?SnpPWVU1QWh5enQxUnFGS0hBSjh2aVFEMUZIVThmS3BZS2Z6ME8velVEbDJT?=
 =?utf-8?B?TEZ6bk93SFYwVkhGWTI0ZVRPemhLbVVHRjhwYmtENjJYWUdWWVpTZEVxQ3RQ?=
 =?utf-8?B?d29Gck9tdnQweUVwYXBSb25VK1BBbDdvMExsc2E0OU9mNXZNUnNhSzNudXJ4?=
 =?utf-8?B?ZmxSS0xMM3JSU0dGdlQzZDBGbzY2bDNqSWdoMlBYZ3dRc3BiTk10OC9mQXI4?=
 =?utf-8?B?S1drK3A2WDU2LzBCS2dHZ09QUlpjRUpzQjBGejFGU1ZzQ0NsaThVQ1A2WmxD?=
 =?utf-8?B?KzJKMTRla1VYS2lLRkhwWWlhUm5YU1MwcU0yRzFEQVVMR01MOHdPM3c5bzk0?=
 =?utf-8?B?SmZMc09rZDZBK3hLbU5yVXRsWXM5L2F3OWttQnM4Z3BseVdKQ01wTVpTNTlo?=
 =?utf-8?B?LzNieXFxYVNlczlZWUZzcW5rNkZqaS9zV0NqUU1yZERUTkF2aFlWS2R5WktV?=
 =?utf-8?B?ZXgrZFl6TWZkWGQyZTlJbWovZ3B4MGdEUTRiZEZIZXBEVGtmYW02U1l6Sm5R?=
 =?utf-8?B?SWFURGFuS2M3K3F0RWFwNDF2Yng5TDk3SGoyU2tZbTYvYlYwUjZTSndBTmlU?=
 =?utf-8?B?eGE1NHZQVDNhdHpvTXkvSnBBVnBoUVh1UjhCbTRwaGxSQnhjZHlnL0FRcHll?=
 =?utf-8?B?aEplZE5ZZjZ2Y2g4RG83cEY3RWY5SDVRMktheDlSbXppYjQ4TklWRlNrZWlW?=
 =?utf-8?B?Rk1WUkJ4VHJFZm4vRkJWWGtucnp0L2UvODFzdXJzV0hiRUhFVm1yUGFwQTdh?=
 =?utf-8?B?NDIxWlBkZ1NNRGx5aWJRZUoyZ3Y5NndZV0VNbmlNV3U2OXdxUkFKVjFkTXF1?=
 =?utf-8?B?dndqMklnaW12RHZWeHIwQzBBOG1PUlEybUdGYmJuZUFSdmFHVkhnOWtEQW1L?=
 =?utf-8?B?RFY2bkZGWVJ6Z1cwVmVsdjlrNDBRa1Flb3Qyb3owNTRtc2d6N0t2UG5ZU0k4?=
 =?utf-8?B?OEtOT3Zoa1pBVXpxd0lyV0d0WlBqQnRvRVcrYWNJYTVKQ3JuSjVlVjdrbjNa?=
 =?utf-8?B?bitDWjNoNllaSlFEcm9UWlZEUk82c3lFS3VqOTNqUXlMMkp5dXo4ZlpsRnN1?=
 =?utf-8?B?blFBTk5tUjZOUXU0VVBvUFdRU0RjSWhwNFNHMHJNM054aXRXd3poT2crbDR2?=
 =?utf-8?B?UXFvVWhuL1JFS3QzR0RQM3Y0Mm4vSk5SdlR2MjFZTlpWaVBsbTJac3I0VDVq?=
 =?utf-8?B?Y3Buc0k1WkhLMVltY1NQNnRwcUdUNDl1WVJpc2I1WG5jazM5Q0JEVDhZaE1y?=
 =?utf-8?B?ZHRDTTBnZTNBdm9GTU8vNk1Zb0N3VFJhUkpqTGNtN3o2Vy9WclY5OFphcmNF?=
 =?utf-8?B?dUc3OFFhL1FOem1iV2VOaW5GUXpET3AraHp3UFpVekNyTmRJeWttWUUwREhp?=
 =?utf-8?B?NHcwNWNBeTBEQzdHRnpoNk9qemx6cnB1ekdrQnA3aHU4SVBhQUoweERXdE1D?=
 =?utf-8?B?Qjh3S1AvejVrVXdYQWdUY3JDaUpvZWRqY0RsU3hwQnhIY2N2SzBJYkorblNh?=
 =?utf-8?B?VmdSeUZ0N3Z4YnR5U2ZSM3pieHlYVlZrNlYzK2V6Ky9iMlJkQlc4QT09?=
X-Exchange-RoutingPolicyChecked: nEYEY7g+RoOBSLhDJciJ7v8+D1OCFRO8MyensMUXd6PbCb8dxrBX1okx8dihrAltdFYO772Vfdwqp5q5Yq/CJthwtnI/XaRAHaRkKhoyk6l7SLyTzrINppQZGJWUjKsoixCXTwbjJoEiNQr0wQb6lFRUlJpvpnBmT9FVCG2SsYt7qgT1y1I2MPdD+jm8IOyKUCAgsqxIb3XRuSvSsVV2s3zES5aWlLGbdk1r3dAT68Eywb9TDAJ0I5WvbjUQebtDBhk38IYqbZlQP0/BV9xckAXkmvybMn7QI3xjuXYaPRcXdXzF/q6QKwQXF6QjskeqpEnNVg0izk5Ma9m1OOj6cQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a18ac71a-7601-451d-2098-08df3b476e5a
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 14:16:49.0956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y4DwtIx2KXQd/kN6wWbWoE18gADOWGG0MdoqJh7O9vlXVSOmzaqfzeo8vZxQOqqYAYmDv1/SFlCiRbOETAZ33A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6108
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
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 05-Nov-26 7:41 PM, Rodrigo Vivi wrote:
> On Fri, Oct 16, 2026 at 03:37:00PM -0700, Matt Roper wrote:
>> On Tue, Oct 13, 2026 at 10:22:57AM +0530, Tauro, Riana wrote:
>>> On 13-10-2026 09:04, Varun Gupta wrote:
>>>> The UNCORRECTABLE_LOCAL_ERROR notification sent by the GuC indicates a
>>>> local, queue-level context termination rather than a global device or
>>>> driver failure. On CRI, due to a hardware limitation, the platform cannot
>>>> distinguish GT translation faults from true RAS conditions, meaning
>>>> standard workloads routinely trigger this error.
>>>>
>>>> Printing this at ERROR level is too noisy and causes false-positive
>>>> dmesg-warn failures in CI. Demote the log level to INFO for CRI.
>>>>
>>>> v3:
>>>>     - Limit the demotion to CRI and add comment explaining the HW limitation
>>>>       (Rodrigo)
>>>> v2:
>>>>     - Also ratelimit the GUC_ID_UNKNOWN to match the CAT error handler.
>>>>       (Himal)
>>>>
>>>> Fixes: 4e57574fa3a3 ("drm/xe/guc: Handle GuC local uncorrectable error notifications")
>>>> Signed-off-by: Varun Gupta <varun.gupta@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_guc_submit.c | 18 ++++++++++++++----
>>>>    1 file changed, 14 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> index 7ce73489c35f..dc5b6b98ffc2 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
>>>> @@ -3585,7 +3585,7 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>    	guc_id = msg[0];
>>>>    	if (guc_id == GUC_ID_UNKNOWN) {
>>>> -		xe_gt_err(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>>> +		xe_gt_err_ratelimited(gt, "GuC: Uncorrectable local error with unknown GuC id\n");
>>>>    		return 0;
>>>>    	}
>>>> @@ -3593,9 +3593,19 @@ int xe_guc_uncorrectable_error_handler(struct xe_guc *guc, u32 *msg, u32 len)
>>>>    	if (unlikely(!q))
>>>>    		return -EPROTO;
>>>> -	xe_gt_err(gt,
>>>> -		  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>>> -		  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>>> +	/*
>>>> +	 * On CRI, the hardware cannot distinguish GT translation faults
>>>> +	 * from true RAS conditions. Demote to info to avoid false-positive
>>>> +	 * hardware error logs.
>>>> +	 */
>>>> +	if (gt_to_xe(gt)->info.platform == XE_CRESCENTISLAND)
>>>> +		xe_gt_info(gt,
>>>> +			   "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>>> +			   guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>> Shouldn't you be using ci ignore dmesg in test rather than demote an error
>>> log?
>> I don't think CI is really the main concern here.  Giving unprivileged
>> userspace clients a way to trigger new dmesg messages above DEBUG level
>> on demand is generally considered a security concern and must be
>> avoided.  So even the 'info' demotion here probably isn't far enough; I
>> think this needs to go all the way down xe_gt_dbg() to make sure this is
>> safe.  Otherwise we're hiding the CI failures but not fixing the real
>> problem.
> right, let's not hide this in IGT. My only ask was to have this CRI specific
> with a comment explaining why.
> But I don't have strong feelings about the _info vs _dbg... But likely
> _dbg is better based on what Matt told.
>
> Varun, are you sending another revision changing to _dbg? if no, why?
>
> Thanks,
> Rodrigo.
Thanks for confirming here Rodrigo, I was waiting for some ack that we 
are moving forward with this or not.
Will spin a v4 with _dbg as Matt told.

Thanks,
Varun
>> The fact that there isn't currently a way for our driver to distinguish
>> user-triggered software errors from real hardware errors is a serious
>> problem.
>>
>>
>> Matt
>>
>>> Thanks
>>> Riana
>>>
>>>> +	else
>>>> +		xe_gt_err(gt,
>>>> +			  "GuC: Uncorrectable local error! guc_id=%d class=%s, logical_mask=0x%x",
>>>> +			  guc_id, xe_hw_engine_class_to_str(q->class), q->logical_mask);
>>>>    	trace_xe_guc_uncorrectable_error(q);
>> -- 
>> Matt Roper
>> Graphics Software Engineer
>> Linux GPU Platform Enablement
>> Intel Corporation
