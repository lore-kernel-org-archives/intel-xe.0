Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E5E7717D
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 08:04:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA6610EF2A;
	Fri, 13 Dec 2024 08:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PeVCPc8I";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867A710EF2A
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 08:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734077073; x=1765613073;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=USxFrhGsn7ua0bVWCQ2EFw9I450csMCOHJLyQrMUBX8=;
 b=PeVCPc8I1sH4Asfx2ElX57GNnm2jBJ4CqZeucU0oVEbxIDUtwyU8vq5u
 uJdrSHahQ/xt2oCCxu9xkqrSLZd2fJ9hMTULirQ6SHakdrg3RWTDs6dhC
 EZJjBO9PzXT40RJ+ttEwoqFd+8Hz9PGyHx6H+yfcVyWllvv+Nq1nFC6mN
 jgl9lPgVvOGhKKob5fom1BoD1fd80l4othXkq2hQ0GmXYcZ5Hoc1rLALE
 vny7DCjTzIfFTQXUGL18v2fBIjtN2A3v16ronQQaq0M29k5QHjzfSfJe1
 ztrUPgJ9BBCQGMA13fF+gVEJBb2tKHzS0g8xbgcWgvA+NogeeDGpa+RyK w==;
X-CSE-ConnectionGUID: f/kolU4MSMSA7j11TtiLAg==
X-CSE-MsgGUID: xzS91QVxQNiLI7+/EeqQnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11284"; a="34395436"
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="34395436"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 00:04:33 -0800
X-CSE-ConnectionGUID: YHTTWZnrQlSUGnDLajx7ZQ==
X-CSE-MsgGUID: vrj8W1KMTemxDKWkivghMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,230,1728975600"; d="scan'208";a="96543074"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 00:04:32 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 00:04:31 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 00:04:31 -0800
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.45) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 00:04:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6AxEUI3nebtJGuZvz1SQD7pGkDnP8samWh2JuqCtsJcOwKdZwsMGXcUQxYy0VnlujuuX1A81MO34LRKnfm9DuYvviljRcXaKnlNeupTEQBH6M1uJVBHlg9R5GUcD7j8zioFEHfhvIdQ/q13r47u6dlBTTV1x+IvWWYZp09ur4NZ1U4CNtMKJ0MjvxkdFzcmhdiwHn4CSHdfgV5qA7KRm/YPSvs2XxYy08jJpIW4rv6eHQnNu2TePZeagUEnFpX0GXJRIYmGZDvoB1GiJMb/eVy14SGqj+fe8okeKHjaAKC8Q6Ud+fItOQT1w1ieNqooiiDbBAo1YP/wCWwps+kstA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5pSoLi76dQ3+YR8VYIW6V/cg5kJJr6ez1BeDf6+lAoU=;
 b=ks+LpkrPgZUiNxtnXEdlQSnY8FTpx3ZuBDMzb3nzg+JjZDmxICi31SsEl5+jUQ2OL2TflP44v127h8la7e8l+rWZfipazWkMTERqaDCYiyPuDdX5N6cFLw82aPSL4/arFbhezgKe1IjPTltPgBGxzKDdi8Qd2mwssIQTOqvvq3t7msE6UEZ+0lGzx9fZR0Z72MnJcRfpl8Z/pRmdUCMYzlSgFgZp/agjt97U5zLbQAzpf0woikHWCPhS8lEeUxN19G54vjdmdHbNcnSA84FjfiHjrEEyudzIAvydYErkm1F+0nPZdmmkNxsVOaxYLVd1HE+ToSKKbDwuBw6+u3s6+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7955.namprd11.prod.outlook.com (2603:10b6:208:3dd::6)
 by SN7PR11MB6727.namprd11.prod.outlook.com (2603:10b6:806:265::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 08:04:30 +0000
Received: from IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d]) by IA0PR11MB7955.namprd11.prod.outlook.com
 ([fe80::7265:46ae:19a8:b31d%4]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 08:04:30 +0000
Message-ID: <ccd408ab-ede9-43d5-bde0-0e8e989b332c@intel.com>
Date: Fri, 13 Dec 2024 13:34:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RFC drm/xe: Add functions and sysfs for boot
 survivability
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <matthew.d.roper@intel.com>, <aravind.iddamsetty@intel.com>
References: <20241212054945.1091894-1-riana.tauro@intel.com>
 <20241212054945.1091894-2-riana.tauro@intel.com> <Z1tqV9UpBeG_fITD@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <Z1tqV9UpBeG_fITD@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::10) To IA0PR11MB7955.namprd11.prod.outlook.com
 (2603:10b6:208:3dd::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7955:EE_|SN7PR11MB6727:EE_
X-MS-Office365-Filtering-Correlation-Id: 64d8a4d3-b2b2-49d2-bf81-08dd1b4cc527
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0Y4U1VZOFFOcHlDa0Zxa0hXMkwvUVNYYWJGSVZscGttTzlTTElLWkxPTWI2?=
 =?utf-8?B?b01YVW9uQ3FyK2cwd1ZKaE1QMXFkaFZZQ0xGNWV4dW9ucEVMUzEzOUg4YWdD?=
 =?utf-8?B?Wml1TlUxY09xU2VETWZXV3hPZHhOcVNKZEhkOWNpSkpGUUJGSHVERXpaYk1Y?=
 =?utf-8?B?UVJIRVh2Q2dtRTFJTHQ4bEhXdmJheHpHNkpva05VcWpEOGg5RkVQT0hERmRi?=
 =?utf-8?B?WnFqY2pTQUk0ODFFSHRFaHg3b0Rtejk3STRPdm02L2U3MWRyVUNaZ2QweUhn?=
 =?utf-8?B?NEgwcW8zUHZ2YlJtRWJMN3d5Q1dRa3BaSEZMNHM1NFlrbTNKQjRYYVF2RFg5?=
 =?utf-8?B?c0d4VVRrendtajVWMytTR0dod1BzQy9KN3Q0ckhhU2c5QTJ1WEJRVUdTTVB6?=
 =?utf-8?B?QVJwUmxTbDhmYjVJZndTY0NIa1lQY2l2YW5sbEhaYmFaOTNCaHA3QUhTWWZx?=
 =?utf-8?B?T25mMzkyVjh0ejVYQ3BMZmppUCt2Z1F3cnI4ZGY3U0Z3T0V3TXZQYmd5dUxW?=
 =?utf-8?B?SHF0QXZLTmQwOGc1SEswRXJTY0o5N2pmeHlKeUtYWmU3TmUvNW9NRFVuMHNW?=
 =?utf-8?B?RzRLblJtSy8rNGllaVl1ZHVwVU1iYW1meGJEcEtNZ0Y2YkdySHA3dEJ2OVJG?=
 =?utf-8?B?eE15Zno3dXc5NHdTMHpWOTZlTGRlV0M1VGV5WURkTWU2YlllVHEzT0w0S1dX?=
 =?utf-8?B?bkhmSTRmU2VBZXZxeU5HTjVIczFNcE5FRTl0bXY4cWNuUGJpUmF3TE9VUHhK?=
 =?utf-8?B?SWFETlNkNGZ3MUFtemRkWVlHbFJJTlNyWFAxOGk1aFJEQ1p5L2xVWENUYnMw?=
 =?utf-8?B?QktRU2dzbXU0ckx0VWQyelN5eVdCa0h0Tkt4MFh2TmhTRjRiQWVIbTd6SDN1?=
 =?utf-8?B?SnFBTkMrYW1zQngyVUVycTFvYllaeG9FQWdJR0xiZzZmNlVIWUpIdndUYzR4?=
 =?utf-8?B?M2JJVlIwZWk4bHVyanBKWCtDc01PQnJQUHQ0bWszRUl5VlFJMUdlMHFzUk0r?=
 =?utf-8?B?SVNLSEdyN25yNzI1SThFcGVibnp6S29kckhGMlVDWnV5RnZHSHNsN0xCZlFG?=
 =?utf-8?B?WjRGb1ZYVnNscUs4YzJqalVNdEREdGJWaGVieGhRY0NobFNFdThlT1ZWZ0Vh?=
 =?utf-8?B?bFpteGwrRzBGUVBXN2FJSmdVOWdxRUY0NVo0NkJra01sRzhZZmlWZGVuK0xl?=
 =?utf-8?B?RDYwNWRVZ05Kd21zeXpjckErbjRTejQzNzdJdjZKMXUxb3NwS2NsNUxoTDZt?=
 =?utf-8?B?anRPc2VHem9GUklrVTlYNXg0U2laV1NUMUVXWGxKcXZ0MFpIOWJJbHE4ZWlp?=
 =?utf-8?B?U25IR1NRZk1zV2NBbkFlaThzZGtGZlFJSFQ5dDg3ZkpBLzdmV2hLanJ5cWV1?=
 =?utf-8?B?YXFHQUUzbm5EM09GbUFwQUlRaEtDNFI1alBEczdzZ0ZEK2pYQTY4Y3dQVVND?=
 =?utf-8?B?K2hSd0RkTTVFSE5VOEdweThQWkpqMlVvU1JZODRmSmoxVWZKMldOdzEyQ1Bt?=
 =?utf-8?B?YU1nK0xyWjRScDJpSTZNL0U1bzdyYlhYS1ZSc01IRzhXekRjUnZNcVlOdzVN?=
 =?utf-8?B?bzRUcUZyUUdSU0VnS3JKc0c0T3VrREFaVzl3N1FQWm02ZGd2RTRMTVhmc1pY?=
 =?utf-8?B?M3FkLzFzbWVHb2dxNEx3b25JV2pJN1MyVmhULzhUV05veWdWazNSQTB4cjZo?=
 =?utf-8?B?MzB5NHhLcU41d1pIYWE0RlBLWk00b2V3bWNGdFdtQXdZT1lvNjE4SnJvNWpi?=
 =?utf-8?B?Tlg4VloyUmRFb1B6R05UenduNmlyM3NmTEFuZ1YzTnlHTFV1R2l4ZUpJd0RH?=
 =?utf-8?Q?NfgMJT1vMxsj2WiH2N2nnqAwVsh5JPVgjbn6Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7955.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWFJZm9hS0NpQ2NJY250eDZMVFRNQjcvZDBaeHZBQ0NGQ053K1V4NVE4YTdE?=
 =?utf-8?B?OWsyY1Rjejl3ckt4bmtXekJjU1RYeTdZVlRHM3ZrdHdQaDhXNFVhUlJZSEow?=
 =?utf-8?B?dElveVg2czA2cEQxbkFFZmVNb1VlNGJ4REY2S3lvcWtreVVQYS9reklaYVMx?=
 =?utf-8?B?VmN0Q1MvTXFDOUU2b1VSMFNmaFcxay90Y0tSQS9Mbk92VW5zQlN6ZFFsc2t6?=
 =?utf-8?B?SjlmWCtTUHNxQ1RCZzA5eHFXaWYzbThianRqcTFhVmM1OUlrS0wwMGh6Y0w3?=
 =?utf-8?B?VUlUdW5TWWttdnRweER5U3BqMFRJVnQxaWlOMTRHUEM5M1BhQmFYWmowd0pW?=
 =?utf-8?B?OFJBb2ZidnVGV2NxUEtwVTJOZVIyNllYRWZQWWNxZy9RenRCZWdmSVpIaDNQ?=
 =?utf-8?B?QzJtMGxjYjU3Y3ZiWTA0Rk1YZTh2dUpKSk9rSE5ZUi9scDB3QWd5WG0wbDRO?=
 =?utf-8?B?dWkrZUY4bkRCdFl4SWYzUDdSSUJXNlpRRGJQSWhYWWUyQ1Uyb1NFMUR6d0tU?=
 =?utf-8?B?TVdkQlFvcGFoUlBlWk94YTRmNTNoV3A5eVM1bmZXMmNLZ3pqYWJUR0ZJS09Y?=
 =?utf-8?B?NlBHdVZtVXRXM0oxMDRnRTM5clkvTzhQYmhIeXRaVkYwdXlzc2JyU2oyazVY?=
 =?utf-8?B?Z0NHL29mWXJnZHVmVmhXbDd5N09GSEh1bnJhYTlWL051TXBWQXJIS0FHcUJT?=
 =?utf-8?B?ODY0c052R0M1Q3JvYjQzc2RjaU9DMFh1UTZQNVJLOFpZTlgzNzhtcXdTa2dq?=
 =?utf-8?B?NUNUanh5dGJhcGh4NzdiWlpwcm5sSk5aL0ttTmRYRFlrR3JwRTZEOTk3ZTEv?=
 =?utf-8?B?VDFFS1dyL2pjNnk4QTRyb1RFVU5WY0ozeFJJUEhqVFo3NXZFRE9HcW0zVElN?=
 =?utf-8?B?eDJmWkpOOVRmbDdVNmJlYVNEVktYYmw5M3FoRGlWeGRhYld6TTNSd3BhYU1I?=
 =?utf-8?B?OEhMTUFGV0I1cXI1VXJuUmlMMkZjTFpXMUs3bWcyOGZtNjcrd2J6d3J3eHZn?=
 =?utf-8?B?M0lWWjRCYkxVMlp0d09ZbVdHcmdKNGFoZk1wZnp5MG04RlRScXp4MVBMbVhv?=
 =?utf-8?B?M3ZtT3J3VXdHTDkwYXlEakNKS21INlEwSm5wT014VFI3ejE4aFQvdzUwNkNL?=
 =?utf-8?B?cHVWWS92bmpnZGgwVnRJZjRGODJYa1IrQmVqVU0yTXd2dlBzYnVvV0VWVEpQ?=
 =?utf-8?B?MnBQd05FSGI2RWxsSVlnTEFpc2hVLzlDNGtEL25INmx3ZVUxK1hLbFFZVXh5?=
 =?utf-8?B?RCtLdVp1enVSbTRuL3RyelNWM0ZmZUMrZVVpSWJ0UkdmOFRpSEk2M2hFNGw3?=
 =?utf-8?B?ZE5remYwVnVCOENYNFdoV2V2RXYxejdncWxONkRkZ2NmREcvWGNaVnVFb3dS?=
 =?utf-8?B?aHc0VmprZU8vM2tuRXNZcXRXVEpvZ3BCSGtTZDh2aWUyeHYzTDdUY0xzVHQr?=
 =?utf-8?B?TVRGNDlPRmdhYmN3blFjUTVkbTU4WVlBZkx5Y3ZCNTBBVGxCa1NHV1ZMTHBj?=
 =?utf-8?B?djk5ZWgvdzNsUzljTGYxeXdWV1JaT1dNRlFFZmJ5WGZVNGFOYlFYY1AyZk05?=
 =?utf-8?B?U0R5Y28ySXVUSDd6M2VuR0F2Tm91RkMvNkJhUmw2T21oM1diV3NJTXhoSi9J?=
 =?utf-8?B?NENzNmNkNGk0RHVmclJFdUFZZ3NTdVhTNUc3eDRGK0JCSFJpTlZSR1VsWG8z?=
 =?utf-8?B?TWdEWHRqQndqWDB0ZTBLdmw3SUlXMjFaUE8waHBVRUxqV3lqeXlnQ1NKUk9G?=
 =?utf-8?B?NWUweVFaTkNsNXNoNHFXZUFVQVNnbnRGb2RKSjBNakRKNjB2ZHVEejArcTNG?=
 =?utf-8?B?aVRod2NWQldKZlZZeDYzVlBFM3hkNE1wTVAvaGY0dUhQbDVWVzBPTDI5NWRB?=
 =?utf-8?B?YjQzRlE3clh0RFJVelRlWHhEeG52UjRuYXFyREpQUHhGMllBSHpMa2JSeGNY?=
 =?utf-8?B?MTlFVnNDck11bDBrVm1FWlJISUh3cXhub3F2VmRCZFFPb1ZwLzZTMmtPSXBq?=
 =?utf-8?B?d1BRSDZ2cnhvdjhKb1FpRlA5dUlLTlg0dC9IUE94OXRzZklFVkl6QjYrVnh0?=
 =?utf-8?B?bkF2VmdRTUhqTWlKaW5leFJVQzY3VmN0cE9neTdVQ01icGJVZTJDZ1NMc3dK?=
 =?utf-8?Q?QL9Jq1LeCJl/cYtaZy/lfzYwL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d8a4d3-b2b2-49d2-bf81-08dd1b4cc527
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7955.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 08:04:29.9325 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I+AtchIQjboyfs3KyIEx71/Rhtzy6ncyAQ9gweDOKhf68nA+0fUqIDBlyIY0cZfsv2Stq0ILHGK6p3WMiRFtvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6727
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

Hi Rodrigo

Thank you for the review comments.

On 12/13/2024 4:27 AM, Rodrigo Vivi wrote:
> On Thu, Dec 12, 2024 at 11:19:44AM +0530, Riana Tauro wrote:
>> Boot Survivability is a software based workflow for recovering a system
>> in a failed boot state. Here system recoverability is concerned with
>> recovering the firmware responsible for boot.
>>
>> This is implemented by loading the driver with bare minimum (no drm card)
>> to allow the firmware to be flashed through mei/gsc and collect telemetry.
>> The driver's probe flow is modified such that it enters survivability mode
>> when pcode initialization is incomplete and boot status denotes a failure.
>> In this mode, drm card is not exposed and PCI sysfs is used to indicate
>> survivability mode and provide additional information required for debug
>>
>> This patch adds initialization functions and exposes admin
>> readable sysfs entries
>>
>> The new sysfs will have the below layout
>>
>> 	/sys/bus/.../bdf
>> 		     ├── survivability_info
>>                   ├── survivability_mode
> 
> Let's make only one file and get all the info inside the survivability_mode
> one.
Then any application using this will have to parse value?

Oh you meant, the presence of the file will indicate the mode and 
contents will give the required information. Okay will modify this
> 
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                   |   1 +
>>   drivers/gpu/drm/xe/xe_device_types.h          |   4 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h             |  14 ++
>>   drivers/gpu/drm/xe/xe_survivability_mode.c    | 225 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_survivability_mode.h    |  17 ++
>>   .../gpu/drm/xe/xe_survivability_mode_types.h  |  35 +++
>>   6 files changed, 296 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_survivability_mode_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7730e0596299..dc60512a5c47 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -95,6 +95,7 @@ xe-y += xe_bb.o \
>>   	xe_sa.o \
>>   	xe_sched_job.o \
>>   	xe_step.o \
>> +	xe_survivability_mode.o \
>>   	xe_sync.o \
>>   	xe_tile.o \
>>   	xe_tile_sysfs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 1373a222f5a5..79bd0bd94e9c 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -21,6 +21,7 @@
>>   #include "xe_pt_types.h"
>>   #include "xe_sriov_types.h"
>>   #include "xe_step_types.h"
>> +#include "xe_survivability_mode_types.h"
>>   
>>   #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
>>   #define TEST_VM_OPS_ERROR
>> @@ -341,6 +342,9 @@ struct xe_device {
>>   		u8 skip_pcode:1;
>>   	} info;
>>   
>> +	/** @survivability: survivability information for device */
>> +	struct xe_survivability survivability;
>> +
>>   	/** @irq: device interrupt state */
>>   	struct {
>>   		/** @irq.lock: lock for processing irq's on this device */
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index f153ce96f69a..4e373b8199ca 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -49,6 +49,20 @@
>>   /* Domain IDs (param2) */
>>   #define     PCODE_MBOX_DOMAIN_HBM		0x2
>>   
>> +#define PCODE_SCRATCH_ADDR(x)		XE_REG(0x138320 + ((x) * 4))
>> +/* PCODE_SCRATCH0 */
>> +#define   AUXINFO_REG_OFFSET		REG_GENMASK(17, 15)
>> +#define   OVERFLOW_REG_OFFSET		REG_GENMASK(14, 12)
>> +#define   HISTORY_TRACKING		REG_BIT(11)
>> +#define   OVERFLOW_SUPPORT		REG_BIT(10)
>> +#define   AUXINFO_SUPPORT		REG_BIT(9)
>> +#define   BOOT_STATUS			REG_GENMASK(3, 1)
>> +#define      CRITICAL_FAILURE		4
>> +#define      NON_CRITICAL_FAILURE	7
>> +
>> +/* Auxillary info bits */
>> +#define   AUXINFO_HISTORY_OFFSET	REG_GENMASK(31, 29)
>> +
>>   struct pcode_err_decode {
>>   	int errno;
>>   	const char *str;
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> new file mode 100644
>> index 000000000000..7e36989efd68
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>> @@ -0,0 +1,225 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#include <drm/drm_managed.h>
> 
> this include moves together the linux group below,
> on top of it...
> 
>> +
>> +#include "xe_survivability_mode_types.h"
>> +#include "xe_survivability_mode.h"
>> +
>> +#include <linux/kobject.h>
>> +#include <linux/pci.h>
>> +#include <linux/sysfs.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_gt.h"
>> +#include "xe_mmio.h"
>> +#include "xe_pcode_api.h"
>> +
>> +#define MAX_SCRATCH_MMIO 8
>> +
>> +/**
>> + * DOC: Xe Boot Survivability
>> + *
>> + * Boot Survivability is a software based workflow for recovering a system in a failed boot state
>> + * Here system recoverability is concerned with recovering the firmware responsible for boot.
>> + *
>> + * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
>> + * to be flashed through mei and collect telemetry. The driver's probe flow is modified
>> + * such that it enters survivability mode when pcode initialization is incomplete and boot status
>> + * denotes a failure. In this mode, drm card is not exposed and PCI sysfs is used to indicate the
>> + * survivability mode and provide additional information required for debug
>> + *
>> + * Xe KMD exposes below admin-only readable sysfs in survivability mode
>> + *
>> + * device/survivability_mode: Indicates driver is in survivability mode
> 
> We need to make in a way that the presence of the file itself is the indication
> of the survivability_mode.  No file, no survivability_mode. No survivability_mode, no file.
> 
> Which I believe your code is already doing this below...
> 
>> + * device/survivability_info: Provides additional information on why the driver entered
>> + *			      survivability mode.
>> + *
>> + *			      Capability Information - Provides boot status
>> + *			      Postcode Information   - Provides information about the failure
>> + *			      Overflow Information   - Provides history of previous failures
>> + *			      Auxillary Information  - Certain failures may have information in
>> + *						       addition to postcode information
> 
> then this move into the single file...
> 
>> + *
>> + * TODO: Notify mei about survivability mode
>> + */
>> +
>> +static void set_survivability_info(struct xe_device *xe, struct xe_survivability_info *info,
>> +				   int id, char *name)
>> +{
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +
>> +	strscpy(info[id].name, name, sizeof(info[id].name));
>> +	info[id].reg = PCODE_SCRATCH_ADDR(id).raw;
>> +	info[id].value = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(id));
>> +
>> +	drm_info(&xe->drm, "%s: 0x%x - 0x%x\n", info[id].name,
>> +		 info[id].reg, info[id].value);
>> +}
>> +
>> +static int fill_survivability_info(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	u32 capability_info;
>> +	int id = 0;
>> +
>> +	drm_info(&xe->drm, "Survivability Mode Information\n");
> 
> no need for the drm_info here
Added a prefix here to indicate the below information is related to 
Survivability

Otherwise it will only display as below in case of Critical failure.
Critical failure currently doesn't enter into the survivability mode
and will not have sysfs.


[ 4708.689214] xe <bdf>: [drm] Capability Info: <value>
[ 4708.689221] xe <bdf>: [drm] Postcode Info: <value>
[ 4708.689226] xe <bdf>: [drm] Overflow Info: <value>
[ 4708.689230] xe <bdf>: [drm] Auxiliary Info 0: <value>

Will remove if not required or add the function name.

Thanks,
Riana Tauro
> 
>> +	set_survivability_info(xe, info, id, "Capability Info");
>> +	capability_info = info[id].value;
>> +
>> +	if (capability_info & HISTORY_TRACKING) {
>> +		id++;
>> +		set_survivability_info(xe, info, id, "Postcode Info");
>> +
>> +		if (capability_info & OVERFLOW_SUPPORT) {
>> +			id = REG_FIELD_GET(OVERFLOW_REG_OFFSET, capability_info);
>> +			/* ID should be within MAX_SCRATCH_MMIO */
>> +			if (id >= MAX_SCRATCH_MMIO)
>> +				return -EINVAL;
>> +			set_survivability_info(xe, info, id, "Overflow Info");
>> +		}
>> +	}
>> +
>> +	if (capability_info & AUXINFO_SUPPORT) {
>> +		u32 aux_info;
>> +		int index = 0;
>> +		char name[NAME_MAX];
>> +
>> +		id = REG_FIELD_GET(AUXINFO_REG_OFFSET, capability_info);
>> +		if (id >= MAX_SCRATCH_MMIO)
>> +			return -EINVAL;
>> +
>> +		snprintf(name, NAME_MAX, "Auxiliary Info %d", index);
>> +		set_survivability_info(xe, info, id, name);
>> +		aux_info = info[id].value;
>> +
>> +		while ((id = REG_FIELD_GET(AUXINFO_HISTORY_OFFSET, aux_info)) &&
>> +		       (id < MAX_SCRATCH_MMIO)) {
>> +			index++;
>> +			snprintf(name, NAME_MAX, "Prev Auxiliary Info %d", index);
>> +			set_survivability_info(xe, info, id, name);
>> +			aux_info = info[id].value;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static ssize_t survivability_info_show(struct device *dev,
>> +				       struct device_attribute *attr, char *buff)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info = survivability->info;
>> +	int index = 0, count = 0;
>> +
>> +	for (index = 0; index < MAX_SCRATCH_MMIO; index++) {
>> +		if (info[index].reg)
>> +			count += sysfs_emit_at(buff, count, "%s: 0x%x - 0x%x\n", info[index].name,
>> +					       info[index].reg, info[index].value);
>> +	}
>> +
>> +	return count;
>> +}
>> +
>> +static DEVICE_ATTR_ADMIN_RO(survivability_info);
>> +
>> +static ssize_t survivability_mode_show(struct device *dev,
>> +				       struct device_attribute *attr, char *buff)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct xe_device *xe = pdev_to_xe_device(pdev);
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +
>> +	return sysfs_emit(buff, "%d\n", survivability->mode);
>> +}
>> +
>> +static DEVICE_ATTR_ADMIN_RO(survivability_mode);
>> +
>> +static const struct attribute *survivability_attrs[] = {
>> +	&dev_attr_survivability_mode.attr,
>> +	&dev_attr_survivability_info.attr,
>> +	NULL,
>> +};
>> +
>> +/**
>> + * xe_survivability_mode_required- checks if survivability mode is required
>> + * @xe: xe device instance
>> + *
>> + * This function reads the boot status of the capability register and
>> + * checks if it is required to enter boot survivability mode.
>> + *
>> + * Return: true if survivability mode required, false otherwise
>> + */
>> +bool xe_survivability_mode_required(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>> +	u32 data;
>> +
>> +	data = xe_mmio_read32(mmio, PCODE_SCRATCH_ADDR(0));
>> +	survivability->boot_status = REG_FIELD_GET(BOOT_STATUS, data);
>> +
>> +	return (survivability->boot_status == NON_CRITICAL_FAILURE ||
>> +		survivability->boot_status == CRITICAL_FAILURE);
>> +}
>> +
>> +/**
>> + * xe_survivability_mode_remove - remove survivability mode
>> + * @xe: xe device instance
>> + *
>> + * clean up sysfs entries of survivability mode
>> + */
>> +void xe_survivability_mode_remove(struct xe_device *xe)
>> +{
>> +	sysfs_remove_files(&xe->drm.dev->kobj, survivability_attrs);
>> +}
>> +
>> +/**
>> + * xe_survivability_mode_init - Initialize the survivability mode
>> + * @xe: xe device instance
>> + *
>> + * Initializes the sysfs and required actions to enter survivability mode
>> + */
>> +void xe_survivability_mode_init(struct xe_device *xe)
>> +{
>> +	struct xe_survivability *survivability = &xe->survivability;
>> +	struct xe_survivability_info *info;
>> +	struct device *dev = xe->drm.dev;
>> +	int ret = 0;
>> +
>> +	survivability->size = MAX_SCRATCH_MMIO;
>> +
>> +	info = drmm_kcalloc(&xe->drm, survivability->size, sizeof(*info), GFP_KERNEL);
>> +	if (!info) {
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, -ENOMEM);
>> +		return;
>> +	}
>> +
>> +	survivability->info = info;
>> +
>> +	ret = fill_survivability_info(xe);
>> +	if (ret)
>> +		drm_warn(&xe->drm, "%s failed, err: %d\n", __func__, ret);
>> +
>> +	/* Only log debug information and exit if it is a critical failure */
>> +	if (survivability->boot_status == CRITICAL_FAILURE)
>> +		return;
>> +
>> +	/* set survivability mode */
>> +	survivability->mode = true;
>> +
>> +	drm_info(&xe->drm, "In Survivability Mode\n");
> 
> this one is good!
> 
>> +
>> +	ret = sysfs_create_files(&dev->kobj, survivability_attrs);
>> +	if (ret) {
>> +		drm_warn(&xe->drm, "Failed to create survivability sysfs files\n");
>> +		return;
>> +	}
>> +
>> +	/* TODO: Pass Survivability Mode notification to required child drivers */
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.h b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> new file mode 100644
>> index 000000000000..0d5c325322a2
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.h
>> @@ -0,0 +1,17 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SURVIVABILITY_MODE_H_
>> +#define _XE_SURVIVABILITY_MODE_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_device;
>> +
>> +void xe_survivability_mode_init(struct xe_device *xe);
>> +void xe_survivability_mode_remove(struct xe_device *xe);
>> +bool xe_survivability_mode_required(struct xe_device *xe);
>> +
>> +#endif /* _XE_SURVIVABILITY_MODE_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode_types.h b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> new file mode 100644
>> index 000000000000..f9dbb6d80692
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode_types.h
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2024 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_SURVIVABILITY_MODE_TYPES_H_
>> +#define _XE_SURVIVABILITY_MODE_TYPES_H_
>> +
>> +#include <linux/limits.h>
>> +#include <linux/types.h>
>> +
>> +struct xe_survivability_info {
>> +	char name[NAME_MAX];
>> +	u32 reg;
>> +	u32 value;
>> +};
>> +
>> +/**
>> + * struct xe_survivability: Contains survivability mode information
>> + */
>> +struct xe_survivability {
>> +	/** @info: struct that holds survivability info from scratch registers */
>> +	struct xe_survivability_info *info;
>> +
>> +	/** @size: number of scratch registers */
>> +	u32 size;
>> +
>> +	/** @boot_status: indicates critical/non critical boot failure */
>> +	u8 boot_status;
>> +
>> +	/** mode: boolean to indicate survivability mode */
>> +	bool mode;
>> +};
>> +
>> +#endif /* _XE_SURVIVABILITY_MODE_TYPES_H_ */
>> -- 
>> 2.47.1
>>

