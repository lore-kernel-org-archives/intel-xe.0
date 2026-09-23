Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD64C9830D
	for <intel-xe@archiver.kernel.org>; Wed, 23 Sep 2026 23:52:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E239410E631;
	Wed, 23 Sep 2026 23:52:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ea97A3sa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931BA10E631
 for <intel-xe@lists.freedesktop.org>; Wed, 23 Sep 2026 23:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790207545; x=1821743545;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=AugP1C/Jvi0uVlQhcdKQ8mHQAoWWoDFs6EADri7odAk=;
 b=ea97A3saSNuB+atdGI33AL9eG73QjbDmWWmco5SmWAXXrV5D2V8kpiJa
 tvOSbjBH+ewQ3eKwls7Mo5IqjWK3fIdn6o79w/lt6O33lP4RAggENVc6S
 SIS87do3Nr5y7zWnPWWHoHaWh9xJtIqNpgd8YXnm1iPC942pTAon+OX0n
 3uecxaQZcB3eN8CWWFGsl1ZvquI3qTxUwRCHCPL5oWViTaE5wfEzfIggI
 yyTh7kUrqO/+qLeyR6DM7lOtBKW+NSVfrUR7mJGKN/l74KTLw2FamKd2t
 67OcpQ5I/2+9DtI9533wzsmR1Txmp/YYnDxkN6cKNFY9B6r5iXakkatLn w==;
X-CSE-ConnectionGUID: 6eGolcqgQ76SJi6eTpDPPA==
X-CSE-MsgGUID: XjWvIqiETFC2LGs7wRTs2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="101614970"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="101614970"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 16:52:24 -0700
X-CSE-ConnectionGUID: Q/up5DXZR0+AcBcQtywdSQ==
X-CSE-MsgGUID: ixwjC8uVR5K6xB+14H45bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; d="scan'208";a="301782699"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2026 16:52:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 16:52:22 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Wed, 23 Sep 2026 16:52:22 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Wed, 23 Sep 2026 16:52:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AfajVZzsQMQLi8pQFXEI2xSAiArhavVrxupB8A/7+QY8XunNVwLnpcEoh2cTyBGyqQbcYyNQbDlV7qSav+XVxBRbj2vJI1CYLh0xitDzssgVuO2HMUz8/RqFn1MTileitSXCYEF6Sap4A0fEXfkA4iQ2FJ7Ek5Z179r+uXeQ7QUZXPlreDNb0aQWMm/uUKAZBnFUk3viVsm99YmQG6vnPPX1ZkRf8rhXuAo/Anfxuso90xMu/ya4M/SpLr5+UiJ9PrPe8trkZlvVOMiZrWv03XqYvBqMJWysKEVsZaGWKbF3D9hdIIqaf16075Q3WA0lkJXT4USApuK9K2UqOJv/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AUJTg+HMBIopU6/ybQCwhko8GQMHW/Fe4cX4T1uxE/M=;
 b=AmVZztiI6aSIMkmPOZRNiCugHFGbaZFdlOvG4zyg+bXSr1FdVFEliMiLEShiubgoOol6/y30/kRnx66Tb4uCt6xcbSElQtjZP05dpa6ijE8WymCGOo0eXn1jfmVq5siEAnsnCxpKpC6Iz+Fzb/cSA0lU6otNEkPOrhkYUE8662zPZGL/VhHLrCHgSGgWSUjSdOznuWefQ7JlQ7eoDSq8nYUY9bxTFmtPeZnbFe1xLTU4bPIbNPQx5IxQo56aeMEDaWrSahQApftVQvESHyZQ6+5MAlma1rrl1MZkl0MgKrt5csFCDmdrvFtsg75f6BRk6P64/jbpmhblTs323TF9CQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by SJ2PR11MB8423.namprd11.prod.outlook.com (2603:10b6:a03:53b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.16; Wed, 23 Sep
 2026 23:52:19 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 23:52:19 +0000
Date: Wed, 23 Sep 2026 16:52:16 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <michal.wajdeczko@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <dnyaneshwar.bhadane@intel.com>,
 <anoop.c.vijay@intel.com>
Subject: Re: [PATCH v8 06/10] drm/xe/sysctrl: simplify mailbox header handling
Message-ID: <arRmMHGlufnmTyBa@soc-5CG1426VCC.clients.intel.com>
References: <20260921133927.128281-12-mallesh.koujalagi@intel.com>
 <20260921133927.128281-18-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20260921133927.128281-18-mallesh.koujalagi@intel.com>
X-ClientProxiedBy: MW4PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:303:dc::8) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|SJ2PR11MB8423:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f55bb2b-f422-4c6d-9cd3-08df19cdb462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|18002099003|22082099003|56012099006|11063799006|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: tOGLKe07SZlYpTizhtYQF4HEnixpv36hrkWfMg3ZVa1FYY1FYfzWb3ueZoeBRZyDos6nKWsNTUILD/vYxRt6ooC+fVlbhHWk2CaB6mRQOYIMZ+J8Qpo5i2Bk8nlHYj6l0HtmF7k/LquoAqiUaebygGYJ6AgAXpr/eu+zuIFW/QtMGeRTjMO66ne7Rb+jWvtt5yCRDFKe3tJveIThE8cakUWB3Wh7gpLKVfUWZfjQkwFyRXEKmBTGDbRlhYTUOGsmF6tR5PsvVAAWUh5tvNK+82mSXAuB9kb8q58SqEN6UlHz6g/+zKxe7fKkXBdNt4V5GB87p7pwAqUHtJUHTu1KP6HQjy5S/4sQD2Y+F7wieqtLmvM9vOr/oypXbmRJphWAXKRTGe7SmFU9mUDNEXdfaPz4K7OuRlE/VhoDj6PXdgRjOAE5d1AyJEkCC5TKJMKbZG27sugRkqNnyGchSVdxxq5E0hjIU2OrS4MLBj/SchulDlCnk0cvaDwOCSbPYnccViVK5ul9PBjXW7xOwsy5OjcBmm/K+K6LEdqD2iivXCTnc5Xqm1JO19eqIDrBnf7boi8iUdFXs5AYnyMMFIUGpj2uZhn8HQ3GMpEHl4C4geoIZ1KF16yEFAibjy7Lxgg4IFWgvXwy2htqYC09VIi/7809F1Lnc5QCLa69sR4USpQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(18002099003)(22082099003)(56012099006)(11063799006)(10067099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RpQUwwdjJJcys0eXhZT1U5OW05aFl2TVd4cDJWZENWamVvU3BSR015Y28r?=
 =?utf-8?B?d3Axd3FiWHFua29XNzdhblJKWk9jOW5mUDAwQkNoS2ZIN2VCL1U3R3BKSlR2?=
 =?utf-8?B?RFFUcnlndzcxMkQ1Q2p5cWpOQzIyZFBwdHVjZFVEYVJidG84MTFaajhFZWtC?=
 =?utf-8?B?UExYSE5BWDdWaWc4WXppVlRlSmVMSkZFZlFvRGtJUGptaGk1TkRCMzNDeERv?=
 =?utf-8?B?dmJPY2RCYS9MQ2xSWklOMWtGcHU3RXJEU1R3dW5nRE4zK0lvUFlDOG5HdFN5?=
 =?utf-8?B?YVZJallLc3JhU3JlcWRPaEFEeDlUMDdLZWtCN29tT1JTN2dHVDl4bGpWcTZI?=
 =?utf-8?B?eUhXZVNyRTc4V3Q3blc3RzNhZGVvYjVBWHBGWURKYW5OeEpWZ1ZnMCt5NU0v?=
 =?utf-8?B?QzNUZEFEOVJPTXVIWlA1c1NvTm1hcnhRWVpaemY3MmdIVUJoY3VxdGFMNEM0?=
 =?utf-8?B?eGlZMENhY0lqVk1wVWoyQWdMVFNsemg4UUhFeGRSeEJKL241Y2Y4ZUsxV1FQ?=
 =?utf-8?B?b2tzaG5YN1JPMndlWk1DNEI0S2lsK050N25iR0Y4ejFHTml3dWw0czVqa25U?=
 =?utf-8?B?K2EycTc3QzhoUnVURnBKN2R2YU42Y1FWaXMrUUdsUVhPQkFzekZob2xTNlAy?=
 =?utf-8?B?QWlzUW44bTBFRXVHeUNVOUxFbXdSSnhlMWMrb1R5S2FrSitGVmYwZHIvVDdX?=
 =?utf-8?B?Rm5XVVM1cWorVExCblkrd0Q3STZ2MUU5QkQ4RlNTUGFuOXhiVHF4VENmTEl2?=
 =?utf-8?B?TjBlWXJCR2NWVExneDlRdUtRQ1ZTM0FreXd0N25MbG9KWVc2Rm0xWVlyc3Nw?=
 =?utf-8?B?YzhXU1V1MUdSTUV6cFZmNGxjUUoxemlRRGdMVHRHR1BwOVRmTEVCRnhmdjll?=
 =?utf-8?B?UXQ3Ynl5WHBrT3BmTjIxNkhPQi9mSTdPeWE1NldVZ2dIRVd6NC9oM2xQdWJB?=
 =?utf-8?B?MWs4MDNGcFVqOVhPaCtWRmtoNHZBK3lzdVNqeVIwUXZNUHk1c3pqN1RVK0Iv?=
 =?utf-8?B?OTZUYUhmbWJkZ1ZCRFZaSG1MVDJmczZEcG9ac1RSVGNzM1pGSjRzWjBvaUdS?=
 =?utf-8?B?Tm9lWTh2UmpMdjFuNWFNdENUOWZISGkzR0xRZmc1Vmh4c1RvY1pkTHZhN3JK?=
 =?utf-8?B?SE5XVjdmSlBpcHUvNFFZYmNsOEpsdWZIYWxuQ3lWN2QzcGs4RTJLZklrd1pH?=
 =?utf-8?B?d2JBaXRoOXQ1OTI5bGd6TnFHejNSYzlvWjVta2lUeXBhRmk1UFI2K2hkSDJG?=
 =?utf-8?B?cy9yeGNEUCtjaXhyVDMxbjNQUGx5dk9JazdnY2lobGZTMVBxaURkMXhtOWFx?=
 =?utf-8?B?SzhIc2VKcldLa0NkaFVhYlBIdW01MGxSR1A5SjBWZ2RHTlNpSVRzcFA5KzRk?=
 =?utf-8?B?RHd2QXZZR1BIRHRHL0wvTkR6WkxibGJsTjVPeXRZdnp2cnBkUTk3b0VFM25M?=
 =?utf-8?B?dVlXa0tPajJrejFRaEF6eXVzRG05cjdydlNuQ3BidlVDaDd5SlJjYXdTdm5n?=
 =?utf-8?B?bWZ3cjZLcjVYYXhJdzUyQXMzbmF6eHEyaXppbjFPb2VLeHFyZ2tManljcWZD?=
 =?utf-8?B?Si9ncGluRUtsTGMrRGNQTkM2WVlwdmhwUE9NalpEYmpsa0lLRGJXU1QrdnIy?=
 =?utf-8?B?M0puSEJ6YlcwNDV2M0FxenBBTkJPQ09LTzE3c3pwbFg2Ujg0RFBOTE9TOEth?=
 =?utf-8?B?b3JtUkJTWG5PZFVlbm1XZy9IVWRJSE9LTTEvTVQxbkhWR25nemR6cytMYmR5?=
 =?utf-8?B?WDJud2lGS1MyMnJhRy9GbmYxditoUHBWSGp3T3B6ZEkzbEF2Z3V3UnQ5dXI1?=
 =?utf-8?B?WUtwNm9xdGN2R3Q3UzVkcVpNSTNBeVpHZnBEeFRBVmx5bVZvQ1hZNWhMdTRq?=
 =?utf-8?B?UHJ2ME5OZU9yT0NycURXZG5FY1hENkFJdGNNMk0rdFRUdVpZSGpUbkV0MW12?=
 =?utf-8?B?RmZRUXVxZnVwczhxblNwL1lFZXNsMTFCM1YxTFlTeXkzMXJxRWpzd05iTVRa?=
 =?utf-8?B?S2N3N3hYa3Y3cGFPdjY2TGhFdUwxMnVDNGIxMDJzTHFwUDRQVmtITDdrVXNC?=
 =?utf-8?B?QzcrVnJXYVJ0NDlUQWY0Z1MvN2JwamM1TDVRbnNRbFF5S1JmOGFsZEFVL29B?=
 =?utf-8?B?R0QzblpyakdiUk1HRjJSaDJUYU5xamxBV3pGaVo5SmwxbmJIeUp3SUdnb0wy?=
 =?utf-8?B?RlJCVldQcHhsenptMWZONTRpYUp1TjQ2YzFkWTJPR0Zwb2ZVMGhQc2VGd0JS?=
 =?utf-8?B?MmZIRUZqOExhcFZTckZnVmx1dlMvTE80YXBqUXdyM3h1YmtGNlA1ODNYY2F0?=
 =?utf-8?B?Z0VoWFUwRnBJMUdNN1RRTVRJV3NLZW1SbVdCY0M4bWZKUXJlemZzWGJGNHRG?=
 =?utf-8?Q?DFatYnfmopYscvoHlksOtB5F6hGxd6J5I9ODh?=
X-Exchange-RoutingPolicyChecked: wx9C6GvTUkR3mL5/rioofqGIkkg4ytzdScKxyzHBwhvS0F3JbaQ3/34ywJUjYz5HWvQonZHd7EhHWCV8k3edmqO1OVFycVQCJ/OkVXcVho22AdPT/jylovijKTZcZmkc8MaV4YV8P/w9pYYHZCR0aih9eeZJlh9HiUrxRG4KfD7qiZ7ZbwUFGNF8lB3Zo3VdbCWk9BiexTGx33t2IficxiQ3OBKeot0wA+K3Xjc3JLi4E//ihmcXXNCDFw9JA2VuhJ6KSsVWg7BjvQqTxFvYjcwnfB941t3k+wlCybZbxI+kOr5dEW/EojZ3ZH30pVfVd3xo13Zx12XkPj00yxyv8A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f55bb2b-f422-4c6d-9cd3-08df19cdb462
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 23:52:19.7337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rq617J9PFOCdg10chCjQF9BlwTfp/tOWGMT+DX6zeu2icIRXShsQyYEjQlz4j7ywnhrRQV6Nx8Q6RMI463P+B6nYIb1FaHI0iW+PjZYfXVE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB8423
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

Hi Mallesh,

s/simplify/Fix/ in the subject. On big-endian the byte order would be 
swapped twice since the mmio helpers internally handle endianness as 
well.

Please include the Fixes tag too

Fixes: 1f95f618182b ("drm/xe/xe_sysctrl: Add System Controller mailbox 
communication support")

On Mon, Sep 21, 2026 at 07:09:33PM +0530, Mallesh Koujalagi wrote:
>Use u32 for the mailbox header data field and remove unnecessary
>cpu_to_le32()/le32_to_cpu() conversions when encoding and decoding
>header bitfields.
>
>Suggested-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>Tested-by: Anoop Vijay <anoop.c.vijay@intel.com>
>---
> drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 14 +++++++-------
> 1 file changed, 7 insertions(+), 7 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>index 50bbdab072de..750178a0974b 100644
>--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
>@@ -20,20 +20,20 @@
> #include "xe_sysctrl_mailbox_types.h"
>
> struct xe_sysctrl_mailbox_msg_hdr {
>-	__le32 data;
>+	u32 data;
> } __packed;

nit: __packed may be dropped. I guess it only protects any future 
additions to this struct.

Thanks,
Umesh

>
> #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_COMMAND(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, (hdr)->data)
>
> #define XE_SYSCTRL_HDR_RESULT(hdr) \
>-	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>+	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, (hdr)->data)
>
> static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
> 				  unsigned int timeout_ms)
>@@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
> 		return -ENOMEM;
>
> 	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
>-	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>-				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>+	hdr->data = FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
>+		    FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command);
>
> 	if (data_in && data_in_len)
> 		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
>-- 
>2.48.1
>
