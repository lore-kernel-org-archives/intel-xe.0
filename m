Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEBF0CD6E5D
	for <intel-xe@archiver.kernel.org>; Fri,  5 Jun 2026 11:14:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACAB911A78B;
	Fri,  5 Jun 2026 11:14:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CYxd8xCq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 592C011A78B
 for <intel-xe@lists.freedesktop.org>; Fri,  5 Jun 2026 11:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1780658080; x=1812194080;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=TYxondS1BHruRnunlldnJKpB35Na2SnJyqFLzzzbcAw=;
 b=CYxd8xCqQbcCQ4HAteOjV4qospz1pnHJWYKr/VThGHFxMnDda2PdLbul
 0QmC4NUIr4Go9/fDJrqBHI9KlmYQKUhwRFr5YU1sMDWGlzXpWEr41wgDD
 gkWUpZIO+u196QYYRps/yDmvu5K4eJE2mWS6GlAb3GmBQq5yFJAM8rP6N
 jDVE45e1EW21lHAajzqoTBPL3tZ+/SMDuCWeoxrKZIILbeatOwMibAlSd
 j/dfcUtCeap8o6gD9Q1SRgIaIt/thvJYqKtD1BHyLfvGxp7HwDgoIjGiv
 dkrDFOLBrx91BNVkGCXlROBtxtfUvRtH8i6AMY4HpUxaAbDY5j6TPoxhu g==;
X-CSE-ConnectionGUID: fCn/WGn9RsCOBbMWv6wIZA==
X-CSE-MsgGUID: wdIwaehYTICoqZSDvj8cQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="81675807"
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="81675807"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:14:39 -0700
X-CSE-ConnectionGUID: 8ynfKBxBSdedSsFlk+uXRQ==
X-CSE-MsgGUID: R1P0v9HlSJGO48rjwrcxKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,188,1774335600"; d="scan'208";a="243980275"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2026 04:14:40 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:14:39 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 5 Jun 2026 04:14:39 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.12) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 5 Jun 2026 04:14:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pk1WTYW0sAadlrc6FC7hsP//lkNUCmSyFYjDr8lQ+ukuflBX5fIbqlv1/Op9ayo2Y14GA/hBubIGlJkOOub1Ffjbp/jOhf565J+ZdOvPkAfkQtUtfyRZo2i5Jxhn8JK1K0UbdLkPDGf2m3t5uhMZA2iupzp40pzknDhYAZOG6BTnCck97Nn00mx1zg/arIHE1rFhF/i+Yj/rkSoUHwYbV5b9/lFNGfKxfcLCyQlhAZdTPiSl0obGoKbEcjo5cxM/6wMOeXR74V4l/7gveEvuDAzRRKbjS4yAcYmoIugwVLgR4A+OBci3P/hTk7oG5eew+ODaKBcZpIe+L59h1XZ+5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gPtlOVjED9l7Yw9dRscx0vESjWjOinLra8BpxQb4SsI=;
 b=BwfE0k9sSzq88fOgTss7LnDcdd+PZrvtX/XApeH88DFCTsBJLNOotT+tlSt8dtxmqCeQnSUPsDAyZ/uqGmG/GPOPuiEqQqsN/sDbSPtnX+1nF3G79WqQZa93O/52t53q7aIftGlBt6JaWv3P8IYadzdxCtIX/wA0Vai7JJpQ/zGPpGPlTFlIMPeyVPDvTj7Ie78ElF1j3CfDRb4E4yYCGHhsZDkGGLsEoXPBsuKhWPGQYpyi5pMS/MuNBmJJ/Nvlxkrl79877bB/YMEAZtJpxiIekPqCp6hZlpKThfJh4XdJPY1vwjNIV+2RO3c7In454+90kxiOPTx/snTcecnAEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB6981.namprd11.prod.outlook.com (2603:10b6:303:229::20)
 by DS4PPF6915D992B.namprd11.prod.outlook.com (2603:10b6:f:fc02::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.8; Fri, 5 Jun 2026
 11:14:34 +0000
Received: from MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a]) by MW4PR11MB6981.namprd11.prod.outlook.com
 ([fe80::d22f:753a:b894:9d1a%6]) with mapi id 15.21.0092.007; Fri, 5 Jun 2026
 11:14:34 +0000
Date: Fri, 5 Jun 2026 16:44:26 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: <tilak.tirumalesh.tangudu@intel.com>, <matthew.d.roper@intel.com>,
 <vinay.belgaumkar@intel.com>, <tejas.upadhyay@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms
Message-ID: <aiKvksJNKwDH7dBW@bvivekan-mob1>
References: <20260603184752.3377539-1-tilak.tirumalesh.tangudu@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260603184752.3377539-1-tilak.tirumalesh.tangudu@intel.com>
X-ClientProxiedBy: MA5PR01CA0064.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b7::11) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB6981:EE_|DS4PPF6915D992B:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f4ae279-2793-49cf-ac2d-08dec2f39ed5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|3023799007|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: a7qdo8ElkzeuSUANXRhW9pvZADrl945X3PdkYLpS85mEEYxEXIzyOs2bA3nDF2/nQuUGoMeFRnlnFCLY0pjtWyzf/4f5mZvWytItCLCllwYv7J7kzTJkzy1atktrrLAdIO1qDyuSJAOn2VjUSM2xjtsSO5W9QWX9+Wz7ceuCDPuUo2I4IB1ABhxo+Fa4xI5dkh2erpfxvJZELcHhUd7bGeqbI26ie2L9KLcbjt5HqxU5D+PaYmBtXYGqSm4mw/HjRif4MDMv1ridPsYCGRAqlAhv0Cuub32wTVGqfd/kExdP6XY0PHdz/CLzXSqSurMzEjLAbp8owEmBvq+VBSb8/p2LQWDMTzCQbIlS3sAasq8YVwbRe++bIBHoCPrhuzdFwXDnQLQaIzqrMdxjly+iQcS6YMeUXZVLuUAR/iI1qfxs5YvQ1delE6SnEeW2JXlBSJTrIVkliIUWYX0090yMqiNA2ojc3nsvP2clFAXg4obyFBvCuslkoY5ICTaHBClg4HNaY3q++iFebWHa9mJar9OrKaO4CWp1hN9lFwURZi4egE3xr7C4mJEayhhEp+2eMKPzbuDRNcRn3OT84rYhu1CBr6kvJDR4pGjjo1DiNL6qIH6kmXctlgJVyiuc0WUYnVdEQslNmGjDYoWf7Iyvi4xHqKUOs9DpfU9/s+GFEalinlrfTCpEcuT4Z4tXARiBtijvL54FnwBBSzOqwl4lVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB6981.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(3023799007)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHFOQ3BPbHY3SkRSYkIvb2hleXBxNTlFMnhtTm5NZFA2dkRBdk5WaHd1VzVu?=
 =?utf-8?B?UHN5MUo1ZEZzZjU4RG0xU3ZwUWtGQ1dEZmxLRlRBekhiY2IyRFgzLzF3eVpi?=
 =?utf-8?B?bEJ6aFppV29BSTZiL0tWTnBadDZlNXU0c2VITUZBckFJdXI5V3RUNVIwSE54?=
 =?utf-8?B?MW8yVUF2S0ROWHEyMlp3M29UQ2Q1eC9ydkUvQ1NNdGhOWmxFMVlVcVgrNmln?=
 =?utf-8?B?N01hWVlRTFI5UmZHZFJEaHlNYVNjazFGbDhnUHhZa2tOeEp3a01QSW5sUTAv?=
 =?utf-8?B?Q0IyRkVoNDAxNUdyaHp4NTBYNloxODJjcG5Bd1BGaFRjblVGZzBqZWt2WFBO?=
 =?utf-8?B?bUY2dmhIZzhyQVdNR0xobmlkUGNjUVNJNTk1V0hDN0RoaFpGaUNocWkxdnhP?=
 =?utf-8?B?OUFhc3ovRS9ab0RjYlNFcThiV2t5OUJadDJHaEZxM3dZWVV4SEZVTnZkTlNm?=
 =?utf-8?B?OXEvU0J2czhlK2V1Vm1HNk9wdGFNRDVGNEY5VFBVdzlNdSs2NDdLYmdOYU1p?=
 =?utf-8?B?UWU2VFoxeFg1Y3N1SjdiQWdndmZHZ0N1bVVsd3JyN3R3SzZpdlh6bGwvV1lG?=
 =?utf-8?B?akRhTGFVQlJaMWdpTWJnRndlNTg5SG9PS0ZBZjBZdG5Jc0Nta01xRHptOXZm?=
 =?utf-8?B?QVJwT3FRY1I2YXlhSXdEUUxOVkJwUkhVQm1xQitOTTJtSFZIWnBWd3dDRHhp?=
 =?utf-8?B?T0tPZzYwd2xDTWZVbXNqUE9vakpRWjRsV2NoTmZXcVhNOFN3TzlCNjBuTE1S?=
 =?utf-8?B?NnpTdVdBL2hmZndUelJJcnlQcmw3MC85UjF0UXNmaUxBemlYdVl3TDl1YzZN?=
 =?utf-8?B?MzhVcTZVUnE2ZXFPazZlWGJkeVpaOEx5c2ZOeUtCTUwrSTVYRW96RzFqS1d3?=
 =?utf-8?B?anNxY3owc3NsdGVpSGxjWmNNOXM1VlMyaUhxZW5KNEhQemF6bWU2TmFrWHFp?=
 =?utf-8?B?ZXB0MTlDaHVvRElWbEZVa2ZXaDgxenI2M1ZDbWRRN1JaUXJFcjNFWHRwREcr?=
 =?utf-8?B?RHlic2c0NXR5TDR6OFpoVkErWkg2SHFUTVBLeG9KV0JZV2pnRWNGRy9STnR3?=
 =?utf-8?B?ZEI0eXg0b3l5V0dKN0pkZ0Y1MGovbW1ybzBzeTI2Mm9Fb0ZTVTlnU0ZOdkdl?=
 =?utf-8?B?MnNTUnk5czFNK0lubUVTbnJXMzFQVkNOOGR6N2NTSHFTVTg5aGlUbDl6MCtZ?=
 =?utf-8?B?SGxWU1dYVEFtOVlEckh0QUNaYlh5a1NCeU1YSHBRWjRKN2tYQVltRWVsTUlp?=
 =?utf-8?B?M2Q1eTEyYTI1Zm51elFvRThZNWRpMmVGN0VQVXpJais0Y3pjQ0ZOVU56QjFo?=
 =?utf-8?B?QjV1dG5JUnNYUnI5NTJuQXBTS1BqZ211b1Rma3hFSnZGNDF0bWRBNDYzTGdW?=
 =?utf-8?B?LzhPZGZnY1Nzc1NLSnUvN3RNVk5Ib0pUTVpPZCt0QVBDR29DNVplUXRWQlJj?=
 =?utf-8?B?QWE1UkRQcThRRHVaMlJWVGx1VGQxMzZHbGNmRXVJaDFHMkdiU0M0ejhRUHBV?=
 =?utf-8?B?NXZKbHFWV2lxWkloT0c0NmN1ODEwNG5CNXJlRjQySmZvOHdoc1JZRkwxbm5G?=
 =?utf-8?B?VjM1Tk5GWGZCYk81US95Wk55Y3pOYUR0dzNVLzk0aDZqQTROOU5MU3RwZzh1?=
 =?utf-8?B?V3c3aFNoeFFoU3YvbitVTGJybmtMUHk3YlZXU0loY2ZzNCs4VFpXQmFEVWFn?=
 =?utf-8?B?NUIyOG1vR3RKQzRMN1ZZaklCbEtvWHlpdjU3ZDFUTElkM2lLOC9XZ3V1cEUx?=
 =?utf-8?B?bUNycHVOV09MTitXV1E2RVRPVVpTMmZxZWJwQ2FpV1NzWkJDdFBUeGxDK2kw?=
 =?utf-8?B?SW5MNFlyM0ErZDdTV09NVGloSGJDUkdidGpENVRFSGpnTnh2WExkTDBSUW1I?=
 =?utf-8?B?Q0ZGYm82cyswYjRRRGFyV01BQ3ExSjBhQUN4amxZV2NoZU1vYzFvR3UwVXNt?=
 =?utf-8?B?ekVzcjJwR1hKWGJLRHFuUVFNODNTODE0bFk1Q0Zld3dORFRQWEwrV0V5eUdN?=
 =?utf-8?B?cVN6Q3FDNmpSTXM4T3pYNlZiaDhUYVBPS0RjcVY3ckc3UGZxM3piYkxPeXI2?=
 =?utf-8?B?ZmU4Y2RQSUFLaWdsTDFPd3lWeWNWOWVJWXQxTkxxUXFTSXZvL0lvU3Exc1R2?=
 =?utf-8?B?bUJ3WXhvTDZrbE1OUzJEbGYweTNQeDdhMG1vMytDbWwzYTNYWUVyODZyUGVX?=
 =?utf-8?B?MisvRHUvREFRTURkSEVPb3gyUTRhZlpWTm0ycUkrem1GbUZoTnYzc2xNUkta?=
 =?utf-8?B?OVA4a3RxVUE1Y2Y0T3VGYW1ZS1p5R29EYitUUGRCd0xERllrcHVPY2E4SmN6?=
 =?utf-8?B?SStGSnE4SlVRSHgxVG1xM21PUkpQOTU5R21udFJCR3I2amhxejJ0SWpHMW0v?=
 =?utf-8?Q?1O66HmqIsnU68gWA4Osy/C9nFaNo8++yNzJD1?=
X-Exchange-RoutingPolicyChecked: kkAi0nLoySoKG47MhBsqubZn/CvIB3yUj6YgzfdQCgO7mzYT7246jv5lr79L/zjBJZTLMTO+4GhY94B7qDYx8ZO2TSiWENp+9spQcjahM1VVlCbjoPIBbNnYuC2NB+HPpn8hyZyMr0rMjAvvBXfYfPd/4Crgk7yTWnURH4sXOzYbi+7MEEhC7KZaqbS+16aVEYjb1M8nJC88DeYxGCa/VTw3YUuL5L3lZX2YVHu2QCsE3K7A0J/wpbysCdbToO7/UGz8YS71RQavfe33jHZHOh861jYdnbHof/Ie+Td5HEpGXd3xJkjTrtd3bgjqfPistT4zvvLsfI02SHbNcnyXDQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f4ae279-2793-49cf-ac2d-08dec2f39ed5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2026 11:14:34.5496 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWDc75TM2464pZ2MnoGao5fAqW0bUlSGg5yviGD5T/rdFAz5xX1NuWV/kknsyr5KiUVFT/NiUJQRU/nfbbLi5bUDwLtMUQRBNTs0EDYMn9y37tRuWTyUBDr7zFKh4T9R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF6915D992B
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

On 04.06.2026 00:17, tilak.tirumalesh.tangudu@intel.com wrote:
> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> 
> Avoid IDLEDLY timer programming lessthan 5 micro secs.
> Apply wa_14025941587 to Graphics Versions 20.01 to 35.11
> and Media Versions 13.01 to 35.03
> 
> v2: Use xe_rtp_match_not_sriov_vf, move to local variable
>     Remove warn and other knits            - Matt R
> 
> v3: Add verbose comment - Tejas
> 
> v4: Restore IDLE_DLY register on engine reset.
>     Add it to GUC save-restore list. -Vivek
> 
> v5: Extend WA to Media Versions 13.01 to 35.03 - Vinay
> v6: Avoid clearing inhibit switch - Bala
>     Refactor code accordingly by adding idle_reg_val.
> 
> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_guc_ads.c    |  2 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c  | 49 ++++++++++++++++++++++++------
>  drivers/gpu/drm/xe/xe_wa_oob.rules |  2 ++
>  3 files changed, 42 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index c98454545a85..2080e0e650eb 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -768,7 +768,7 @@ static unsigned int guc_mmio_regset_write(struct xe_guc_ads *ads,
>  		}
>  	}
>  
> -	if (XE_GT_WA(hwe->gt, 16023105232))
> +	if (XE_GT_WA(hwe->gt, 16023105232) || XE_GT_WA(hwe->gt, 14025941587))
>  		guc_mmio_regset_write_one(ads, regset_map,
>  					  RING_IDLEDLY(hwe->mmio_base),
>  					  count++);
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index 98265293f2dc..03e977f4eb24 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -578,25 +578,54 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	u32 idledly, maxcnt;
> +	u32 idledly, idledly_reg_val, maxcnt;
>  	u32 idledly_units_ps = 8 * gt->info.timestamp_base;
>  	u32 maxcnt_units_ns = 640;
> -	bool inhibit_switch = 0;
> +	bool inhibit_switch = false;
> +	bool wa_applied = false;
>  
> -	if (!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) {
> -		idledly = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
> +	if ((!IS_SRIOV_VF(gt_to_xe(hwe->gt)) && XE_GT_WA(gt, 16023105232)) ||
> +	    XE_GT_WA(gt, 14025941587)) {
> +		u32 mincnt_idledly_ns = 5000;
> +
> +		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
>  
> -		inhibit_switch = idledly & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly = REG_FIELD_GET(IDLE_DELAY, idledly);
> +		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
>  		idledly = DIV_ROUND_CLOSEST(idledly * idledly_units_ps, 1000);
>  		maxcnt = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt);
>  		maxcnt *= maxcnt_units_ns;
>  
> -		if (xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> -			idledly = DIV_ROUND_CLOSEST(((maxcnt - 1) * 1000),
> -						    idledly_units_ps);
> -			xe_mmio_write32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base), idledly);
> +		/* Wa_14025941587: applied prior to Wa_16023105232,
> +		 * as the latter has higher priority, although conflict
> +		 * is not expected.
> +		 */
> +		if (XE_GT_WA(gt, 14025941587) &&
> +		    idledly < mincnt_idledly_ns) {
> +			idledly = mincnt_idledly_ns;
> +			wa_applied = true;
> +		}
> +
> +		if (XE_GT_WA(gt, 16023105232) &&
> +		    xe_gt_WARN_ON(gt, idledly >= maxcnt || inhibit_switch)) {
> +			idledly = (maxcnt - 1);
We would enter this condition even when inhibit_switch = 1, so we should
have another condition before updating idledly.


> +			wa_applied = true;
> +			/* inhibit_switch override to keep
> +			 * semantics of Wa_16023105232
> +			 */

----------------------------------------------------------------------------------------
> +			if (inhibit_switch)
> +				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
> +		}
> +
> +		if (wa_applied) {
> +			idledly_reg_val &= ~IDLE_DELAY;
> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY,
> +						 DIV_ROUND_CLOSEST(idledly * 1000,
> +								   idledly_units_ps));
----------------------------------------------------------------------------------------

The above changes would work, but it could be simplified as below. I
leave it to your preference.

			inhibit_switch = 0;
		}

		if (wa_applied)
			idledly_reg_val = REG_FIELD_PREP(IDLE_DELAY,
							 DIV_ROUND_CLOSEST(idledly * 1000,
							 idledly_units_ps)) | inhibit_switch;


With that.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala

> +			xe_mmio_write32(&gt->mmio,
> +					RING_IDLEDLY(hwe->mmio_base),
> +					idledly_reg_val);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> index f8a185103b80..5d5041168fa8 100644
> --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> @@ -65,3 +65,5 @@
>  
>  14025883347	MEDIA_VERSION_RANGE(1301, 3503)
>  		GRAPHICS_VERSION_RANGE(2004, 3005)
> +14025941587    GRAPHICS_VERSION_RANGE(2001, 3511), FUNC(xe_rtp_match_not_sriov_vf)
> +	       MEDIA_VERSION_RANGE(1301, 3503), FUNC(xe_rtp_match_not_sriov_vf)
> -- 
> 2.46.0
> 
