Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05C5ACCA470
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 00:44:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955B710E74B;
	Thu,  2 Oct 2025 00:44:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nhEAIZdt";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E704E10E74B
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 00:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759365895; x=1790901895;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Mv2Gdk05G1Mcu0d5RQOipyer21z1P3Nw5XS1Dm2XHCc=;
 b=nhEAIZdtfd3jATB7b5ubHbKITsY0+E3IoJZDS133mBqbHJ1BO5CQAeb7
 4gtVdduroQ1zRltQ15Fwe7Fle3KY4yrF0oVzHb/RhmTDmdba1DmmKImMf
 z/j44abkUp73ZrUxQCzpE7G0k6wUBnZKixHGHsnSY8NfI2Zqzz/Q18/ik
 8et69BiopEq5cUJrQ3+QdzNccysR8Xhr6FvB8cTTyNmUiU8B/1CtDMSLD
 ++4ju3hg/q7UMtOEp610VY7uJfKMQxWH5U0QTJvBMeGVAPF9PwHf2CsrQ
 9E1yNYCITr2LANXOUU977wEY5hP6gvD9SsM/LG6A2R1DPKj+xNiaO1gDz Q==;
X-CSE-ConnectionGUID: tn5INLaRTyiS0IzXRXe1Ng==
X-CSE-MsgGUID: 6/6svkKlT26JDZSZuzYhjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="73078297"
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="73078297"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 17:44:54 -0700
X-CSE-ConnectionGUID: sFDV3V0ERFGXbBY5NBPPqg==
X-CSE-MsgGUID: erM3zs5WQVuYaRNrHY5TNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,308,1751266800"; d="scan'208";a="202649072"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2025 17:44:55 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 17:44:54 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 1 Oct 2025 17:44:54 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 1 Oct 2025 17:44:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gw069iDgMpTkfvP/xm94jAwMoXv8abZoS4cKfVYGNLLjwwCEBAewMeSMNcYS3xrPoKZ8N5GqP26jor/hDtZPseUiWWY2fgEC95CaXeyGjXvsxghewwlJ3U8QE/O2QbuhF0ei2ZBbwTJYa23VRzNB01VsGjT9ReiERBkQmWd9c7J0czq9ZYUEDJa5b8LOxmbafO1JN7Fi0ke/qUFjDr7zavqHE2QOL6ZAUEUhjqDzqNrFi9VUpZosj6Fm2m+HNe6piFgPhaLl2vC3DHvv48GgIvsycbl0xp/4BZx8RhJnP1ceRxlH9llRskeywDbWl1tecSnTL/l0xoAFBBK6NbK1IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csLrtkHpK0qVYKpm97rzqRtMgurKzsFx9MKwWrDmKuc=;
 b=MHo1/HX833EbanEC0BUUBVZ/clGs0vAbKWa+MWxaIkwUr8L+iKgXyaFNaguLhHvSlILeWaLdXww1041ykRUHJCS7NQNSukyilAFrJSLXTznZ/tXPpe+ij/PC/HD1uHGCwfuQgfLW4qcbrxIiDwYAhQ7oci5W37zpOAzWxVB4OE334MATK+x8sr5Ykh3F8mvydXK39fz0YBPl8hU1EzIe1mt0IN0cnR4+pyq9R22UMFVSEeNeWdCTuaX6Q8edRM+QbXavUluBwHCGAVo5Hc6bYROVNCo2Dh6miROFNa+VWTQEThJmN32cOnA+cqF6wuDOy+UX6h+v1Iqxg9mnXEZNzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SJ0PR11MB5216.namprd11.prod.outlook.com (2603:10b6:a03:2db::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.16; Thu, 2 Oct
 2025 00:44:51 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::8602:e97d:97d7:af09%6]) with mapi id 15.20.9137.018; Thu, 2 Oct 2025
 00:44:51 +0000
Message-ID: <1d5a68ac-290a-487e-a02a-a9e61167d538@intel.com>
Date: Thu, 2 Oct 2025 02:44:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 29/36] drm/xe: Move queue init before LRC creation
To: Matthew Brost <matthew.brost@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250929025542.1486303-1-matthew.brost@intel.com>
 <20250929025542.1486303-30-matthew.brost@intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <20250929025542.1486303-30-matthew.brost@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIZP296CA0006.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:2a1::7) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SJ0PR11MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d093daa-c37c-47f6-579d-08de014ce538
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?KyszVWdNRDN6T01xNlFzNEM0K2VOMXBONWR5bFpadWtpVy9KWnBZbmszR24y?=
 =?utf-8?B?SDUzZ21sQUFYVW8zaHRWOVNSeTVlbkpPL2VZRXpVRytRNXBBaGIvSmE4ejg3?=
 =?utf-8?B?UThkamJUbW5ZanRjOGRMdUx5YXZpMVpoSTFUSU5TSEFmMzVyTStRWDNNTmV1?=
 =?utf-8?B?RXJDRnBZcllJRnc5Ykw2YXZZWUhsLytqWjJ6c0JPM056UG5KS0VDNGhycGJt?=
 =?utf-8?B?Ymg4L3JrZmtEV21MZ2FLUWV6cWtnZHlCclZBRjN2OUwwU2o5aFNjZFpYdzgz?=
 =?utf-8?B?MnBMVk02Wm1NR1h3REFKbUhMa21ackhLeFREU2VCZXlUa3NBclNybm1TZk1R?=
 =?utf-8?B?eVJrMUtuRjNzTGp5bWxNV0JmRmNCdlVSNVJWbjhJeHNCcVdjK3Z6V1NOajQ3?=
 =?utf-8?B?V2RNT1hDcTZ3bFdNdkpydVgxbnVGUVljMU45M2R2b1VNN0Z5ZFlkYis4K2lH?=
 =?utf-8?B?ZDZWQ0lObUQ3SVVUZjZNYnhVWGFTOStkZXVPYU1yV013K0oyelZ0bXExRWFB?=
 =?utf-8?B?VkhZUkN1RXVmUVAzdjBhaGFHSUhVbERrazY4bUpCdC9aOWI4eC9UNXlkQ2dn?=
 =?utf-8?B?TnJPYkVBOGVCWEVsWmVhbjRDVE9EcWt4VmY0a1JMSXVQV01lYXliN2xCSFZl?=
 =?utf-8?B?RDZ0c1gvSWpRYjA2SUNDQStNbVd6UFBjU215aTJ0ZS9WNnNzTTJUUUs3WU8x?=
 =?utf-8?B?TlNZSEdXOEJUdGRYd242a3dPZktrelhIVEY3S2Yrb3hOU2c1MC9zWU5RRVJr?=
 =?utf-8?B?ckovK2kxRXlJQmwvSWRrb09rL3F1NUtvMytsMTdzSEQ2alpja2RXRlRDTUNI?=
 =?utf-8?B?SkRuK0k0dVdFK2htUlcyOFFXVEtKdllNbzlNWXRPYUFXRGY5ajViOTM4UW94?=
 =?utf-8?B?Ny80MldXR2NjNW90NWpoSWJLUE1zbXZRNDJreENzMk5RSC9vZkdiQjd0OUNl?=
 =?utf-8?B?bnhwV0FEV1E3VngwL3REMTJFSXJGMnNoQmJYS2I0NC9zTVJkZTZyR0dxT3Fq?=
 =?utf-8?B?ZkdGVnNhUVZUckFyT3VrZjFpNGY3U1JNRXZCSU9XbEVCcWpEZ1Z3T3d0anpS?=
 =?utf-8?B?dDh4UzhySi9YQlBQR2gyZmxYUEJkMmFZVDZSYi91VWNpZVdjVXQzR240U1pt?=
 =?utf-8?B?cjg3SzEvSWM1bWk1SEZPUFlaV1Zib1ZqamtBMnBGeklYM2FlVW9YZVVUakRI?=
 =?utf-8?B?c3RESmlwUXFqTnVWRFgxRlhjVXRvQUxkVGRMOVNMSmtJeldibmZKNklDc1Yw?=
 =?utf-8?B?MjdMVG1VL3pZRHlsYSswc3R6UDlERDBvRGo1QjRVUktFWTBtM3NvckpSc25q?=
 =?utf-8?B?SWhaQ3JZVzl6VWhuZkE0c1FpNVpwdjBNV0ZiR2FRanArMHdkZlp6bFpPdjdW?=
 =?utf-8?B?ZHk3STgrVHFpdnd3RmJQY1FYb0o5V1AwZlB0MVBab0gvalRmbSt3Q2JtVWhK?=
 =?utf-8?B?SUFoZm83a2V0dEVWaXliTmxjL2wzYnVFVVlSVFlVMjhxQlZpcmxYZ3N3WEFS?=
 =?utf-8?B?UlozVHhwNncxNzV6RHdFWXVxZS9kR2dPVitXZWcvTlVKUnQrWUtuT29lVDgr?=
 =?utf-8?B?VDRSMTV3Skx6ZUY4NG4wQlZkVjhYVC9MdmhSMU9BemFOcFM5V3BWeTV6TDJ4?=
 =?utf-8?B?bjRLY0h4UDYrNTNGSHdSamhZdHB5MERudUhXS1hmcSs2QVZ5UzZTY3ZCWUhs?=
 =?utf-8?B?dThJVmh6MnNxRDVvdFAyTXFsVjlQWGFBaTNpdXZuaTJvallyR0JOWWMvR1Jh?=
 =?utf-8?B?bVhZN0lHY0xoZk9XWGFISkZxdzV3QzFRQVhNcDYrOUE1N25jZHkzZzJaTHBJ?=
 =?utf-8?B?VHg3dGYwemdTbGE3N1pQMnJLbllyNjQyUW1lbFEvWGluMWJLS2JKRFNiQlpM?=
 =?utf-8?B?ZUx0WGptOHJTZmYveU5rbEJlMVhuWFM4cTRUNDZkSSszMjkvWCtxVUVrY05v?=
 =?utf-8?Q?HNYQG5Bpeut3peBNJ8iTl0mpHrLdq2tn?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjF1UFZCOTNQazhVR2pndGlCSC9MYVNBMndzRUl4M0ZpYWVjRHNKVm5Lc3RJ?=
 =?utf-8?B?Z2hIcTd6UlNNQnRENnp3U0lRMkI4UzNkRGdXaHNJR01FYkE1eUNCUHRGTHFT?=
 =?utf-8?B?aitZeXJyM1lOQTlUSTZLNXg5YkoyTGdKWTcxWXg2Y3VyVE5xRW1NSWRhUmwx?=
 =?utf-8?B?YVBBNFNTamR0TnRvQlBjS0xFVXpqeUc4djBlUVFWSVk0NmhLN1oyK1A3d3Z6?=
 =?utf-8?B?K2Z2S0JxMWU5U1RBTVFEd3VmaDJTOTNsU3h6YldrOWVycHFrU1V1a2k3SSsr?=
 =?utf-8?B?SEkyM2Z5TzNmSXJIb3N0OWJNNTg4ZURLZVVwS0FsVU82TW0xcE5YMEZnbUpz?=
 =?utf-8?B?Nlk3R21PM1FCWnVBdkxEM25nZ3hnazFZOTVGOE5zcXZiT05HTGRRTzcyOENt?=
 =?utf-8?B?L1ppYXJYbFdLTGRsZXFlVE51YlZKbEdSSnNGcTJ0ODB2cnlNSmxpYlVPbnhT?=
 =?utf-8?B?SitncHVIZGJmcHl6cFlJeE1WWmlFL2ZtampPUENvbVVGeW1ldEkrejRtTnhF?=
 =?utf-8?B?U1dWNE5XUFVDVTliekorYVgvNllEb3UvZ3JYbkF4bjFEcW1VRVNBR2p1MFZ2?=
 =?utf-8?B?Q2MyZ1E0OVBSSStkZFdvN1FSeCtYb2dsRG1lTGhaZEk2VXZsYXM0bjhGc014?=
 =?utf-8?B?UTdVeGY3TnRmZEdNVWdtTnRVWlFSdDR4WGZEbWlMQkU0eWI5RnZQOHZiMXhj?=
 =?utf-8?B?ektkZEdBcnQ2NjlkYmM4dWFZOGozUmU3eE5aWU5lZXZWTXFFMWJ1akJ1YjdF?=
 =?utf-8?B?N3JrcE1NbklOU3lPWGJHWHNwMElTRjY3aHBtZnc1bWNFeWFIZGZrZ0JwOEc1?=
 =?utf-8?B?VjEwN3VscjQwSHlrNFV6aVFmYWVKWlYyRDFrbnNFQUx0alBsaUFmWlU1bjRu?=
 =?utf-8?B?UE9EUXdhbmhzcXBWYnVCQXNYNGQ5ckVlVTVxRkxmTVFESEhCNXdlY0VkZnNo?=
 =?utf-8?B?b1BmU2RZY3ZKRDhpRHE5YmxQVVNJa1J0U0lYTjNxUlZ4TGVYWlhOdzJOREpo?=
 =?utf-8?B?dklIOFRpRXllc3dCQVYvLzZJalI1Yk5OWmpzSjhNNGpjaE1QOUhnVUNkRnJl?=
 =?utf-8?B?bUo2VnFJamRYRXl0ODYrc2NMeG9rQWpqWC9CTlV6YkRpRXYxenIxWlhkWnND?=
 =?utf-8?B?bDlzUVdGejB5Mkg2cklCOStOdG5VUXd5VXJHR2dEaCtBd0tWL1d3NklrdkRQ?=
 =?utf-8?B?R1ZGVlBRajJtQmlrbVZhNUNteFJuNjRsaWIrbkF3Njk0QXU3RnRiVWgwWUE3?=
 =?utf-8?B?RHRwcDBuYUJyZWJ1YmJPMnJyY0RwMEhOUjF3eFFyVjZucVBKTk1BU1J5NGhB?=
 =?utf-8?B?RDhidkIzTXYyY3dGeEwzV1JyYmEzUWIraERkYzRGanlKWVM3Y3VwTXF0NEQw?=
 =?utf-8?B?VVJlc3R1UVBKSU5sUEFuTE5PTzFiU2pMQm9xOGFVcUFFVks2NzJBZFNEVzZt?=
 =?utf-8?B?VzljVUZzbXUyTnpHYlpFM0hzNThOQVpIYkcxcVdPakY3WkxLZ3FGQS9qSXZK?=
 =?utf-8?B?eEdvYWpibWUrK09PZ1lVUXJERm1iUkFWWkJGWXhiZlJLUGdrVXFjYXk3VFRM?=
 =?utf-8?B?NEpicGFDVnBFRGtYYmcybVZxRlV0bFh2WlJNbmh5cDN5NUZRRUxZY1lnRmd1?=
 =?utf-8?B?YkFiV1BnNWZtRmJpdDFLWHhrWWJnTFh5ZnMzbG9STWdyMmpNM08zRGZtV1Iv?=
 =?utf-8?B?YWk0N3FUbTR2WmlKYmFoakI3U3NpR01OUllYUU5jQk5BSHNUMnM3cG9Id1c0?=
 =?utf-8?B?OVJOT2tXOXFCV1UySEwrQklza0tVVld0UElKb2xBWlVhcDdDNFlFZUZJM05Y?=
 =?utf-8?B?R013YzRGWWl4c2ZNcUFBV2p5c2FTVDZhWkZyYjRsbG5LcGF6M1llTVlsSHN2?=
 =?utf-8?B?emFBc3lPaHhIbkEvcXduSTRsTk1EdVlhOHIrWmV2ckRkRi8rREtsL1Q2bGRp?=
 =?utf-8?B?cjB0TXcyYWxGR3NlZWdWWW0ybDc2SEsyWWI2bytrOGZ2alpPbDRSMlFqcVpX?=
 =?utf-8?B?K0I4Q0hvdllnZG9Ed0huU2ZjNGxKTFMyYnZuZ3hTNkc4VkJ0dmwxTkNUbHU0?=
 =?utf-8?B?Yi9BamdRWElJdG1qUi8velp1eFM2UDIvYnJmdHhySE5JUGpZUVUxWlpkM1FI?=
 =?utf-8?Q?ZBjCBYdJxVEv9R+SjGCXWcoq+?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d093daa-c37c-47f6-579d-08de014ce538
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 00:44:51.0338 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/WW2CGdfhWsV+w57qaaZxnacG0Cc5DUa6iy/k7TenvR3bWzxF73obU4/dqjaoUylHD9JgB42O2iUg25xoMiew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5216
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


On 9/29/2025 4:55 AM, Matthew Brost wrote:
> A queue must be in the submission backend's tracking state before the
> LRC is created to avoid a race condition where the LRC's GGTT addresses
> are not properly fixed up during VF post-migration recovery.
>
> Move the queue initialization—which adds the queue to the submission
> backend's tracking state—before LRC creation.
>
> v2:
>   - Wait on VF GGTT fixes before creating LRC (testing)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_exec_queue.c        | 43 +++++++++++++++++------
>   drivers/gpu/drm/xe/xe_execlist.c          |  2 +-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 39 +++++++++++++++++++-
>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 ++
>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  5 +++
>   drivers/gpu/drm/xe/xe_guc_submit.c        |  2 +-
>   drivers/gpu/drm/xe/xe_lrc.h               | 10 ++++++
>   7 files changed, 90 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 81f707d2c388..3db8e64d9d13 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>   #include "xe_dep_scheduler.h"
>   #include "xe_device.h"
>   #include "xe_gt.h"
> +#include "xe_gt_sriov_vf.h"
>   #include "xe_hw_engine_class_sysfs.h"
>   #include "xe_hw_engine_group.h"
>   #include "xe_hw_fence.h"
> @@ -179,17 +180,32 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q)
>   			flags |= XE_LRC_CREATE_RUNALONE;
>   	}
>   
> +	err = q->ops->init(q);
> +	if (err)
> +		return err;
> +
> +	/*
> +	 * This must occur after q->ops->init to avoid race conditions during VF
> +	 * post-migration recovery, as the fixups for the LRC GGTT addresses
> +	 * depend on the queue being present in the backend tracking structure.
> +	 *
> +	 * In addition to above, we must wait on inflight GGTT changes to
> +	 * avoid writing out stale values here.
> +	 */
> +	xe_gt_sriov_vf_wait_valid_ggtt(q->gt);

So to avoid locks, we rely on the VF knowing it got migrated from the 
first moment after vCPU starts.

On `qemu`, we do have it this way - when vCPU starts the 'MIGRATED' 
memirq is already filled.

But what about other VM managers? What about future support of platforms 
without memirq?

I don't think the availability of information that we've got migrated 
from the first vCPU cycle is guaranteed by any specification.


>   	for (i = 0; i < q->width; ++i) {
> -		q->lrc[i] = xe_lrc_create(q->hwe, q->vm, SZ_16K, q->msix_vec, flags);
> -		if (IS_ERR(q->lrc[i])) {
> -			err = PTR_ERR(q->lrc[i]);
> +		struct xe_lrc *lrc;
> +
> +		lrc = xe_lrc_create(q->hwe, q->vm, xe_lrc_ring_size(),
> +				    q->msix_vec, flags);

If migration happened at this place, it is still possible to create a 
context with wrong GGTT references in the one LRC which was already 
filled but not integrated into the queue yet.

I don't think we can avoid races without a lock.

> +		if (IS_ERR(lrc)) {
> +			err = PTR_ERR(lrc);
>   			goto err_lrc;
>   		}
> -	}
>   
> -	err = q->ops->init(q);
> -	if (err)
> -		goto err_lrc;
> +		/* Pairs with READ_ONCE to xe_exec_queue_contexts_hwsp_rebase */
> +		WRITE_ONCE(q->lrc[i], lrc);
> +	}
>   
>   	return 0;
>   
> @@ -1095,9 +1111,16 @@ int xe_exec_queue_contexts_hwsp_rebase(struct xe_exec_queue *q, void *scratch)
>   	int err = 0;
>   
>   	for (i = 0; i < q->width; ++i) {
> -		xe_lrc_update_memirq_regs_with_address(q->lrc[i], q->hwe, scratch);
> -		xe_lrc_update_hwctx_regs_with_address(q->lrc[i]);
> -		err = xe_lrc_setup_wa_bb_with_scratch(q->lrc[i], q->hwe, scratch);
> +		struct xe_lrc *lrc;
> +
> +		/* Pairs with WRITE_ONCE in __xe_exec_queue_init  */
> +		lrc = READ_ONCE(q->lrc[i]);
> +		if (!lrc)
> +			continue;
> +
> +		xe_lrc_update_memirq_regs_with_address(lrc, q->hwe, scratch);
> +		xe_lrc_update_hwctx_regs_with_address(lrc);
> +		err = xe_lrc_setup_wa_bb_with_scratch(lrc, q->hwe, scratch);
>   		if (err)
>   			break;
>   	}
> diff --git a/drivers/gpu/drm/xe/xe_execlist.c b/drivers/gpu/drm/xe/xe_execlist.c
> index f83d421ac9d3..769d05517f93 100644
> --- a/drivers/gpu/drm/xe/xe_execlist.c
> +++ b/drivers/gpu/drm/xe/xe_execlist.c
> @@ -339,7 +339,7 @@ static int execlist_exec_queue_init(struct xe_exec_queue *q)
>   	const struct drm_sched_init_args args = {
>   		.ops = &drm_sched_ops,
>   		.num_rqs = 1,
> -		.credit_limit = q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES,
> +		.credit_limit = xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES,
>   		.hang_limit = XE_SCHED_HANG_LIMIT,
>   		.timeout = XE_SCHED_JOB_TIMEOUT,
>   		.name = q->hwe->name,
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 0d94867dce8e..42f9fd43b436 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -482,6 +482,11 @@ static int vf_get_ggtt_info(struct xe_gt *gt, bool recovery)
>   				 shift, config->ggtt_base);
>   		xe_tile_sriov_vf_fixup_ggtt_nodes(gt_to_tile(gt), shift);
>   	}
> +
> +	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
> +	smp_wmb();	/* Ensure above write visible before wake */
> +	wake_up_all(&gt->sriov.vf.migration.wq);
> +
>   out:
>   	up_write(config->lock);
>   	return err;
> @@ -820,7 +825,8 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>   	    !gt->sriov.vf.migration.recovery_teardown) {
>   		gt->sriov.vf.migration.recovery_queued = true;
>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
> -		smp_wmb();	/* Ensure above write visable before wake */
> +		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
> +		smp_wmb();	/* Ensure above writes visable before wake */
typo in patch "Wakeup in GuC backend on VF post migration recovery"
>   
>   		wake_up_all(&gt->uc.guc.ct.wq);
>   
> @@ -1344,6 +1350,7 @@ int xe_gt_sriov_vf_init_early(struct xe_gt *gt)
>   		&tile->primary_gt->sriov.vf.self_config.__lock;
>   	spin_lock_init(&gt->sriov.vf.migration.lock);
>   	INIT_WORK(&gt->sriov.vf.migration.worker, migration_worker_func);
> +	init_waitqueue_head(&gt->sriov.vf.migration.wq);
>   
>   	return 0;
>   }
> @@ -1387,3 +1394,33 @@ bool xe_gt_sriov_vf_recovery_inprogress(struct xe_gt *gt)
>   	return (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
>   		READ_ONCE(gt->sriov.vf.migration.recovery_inprogress));
>   }
> +
> +static bool vf_valid_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
> +
> +	if (xe_memirq_sw_int_0_irq_pending(memirq, &gt->uc.guc) ||
> +	    READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
> +		return false;
> +
> +	return true;
> +}
> +
> +/**
> + * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
> + * @gt: the &xe_gt
> + */
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
> +{
> +	int ret;
> +
> +	if (!IS_SRIOV_VF(gt_to_xe(gt)))
> +		return;
> +
> +	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
> +					       vf_valid_ggtt(gt),
> +					       HZ * 5);
> +	XE_WARN_ON(!ret);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 71e1d566da81..20cc0c4c32e3 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -40,4 +40,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>   
> +void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
> +
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> index e135018cba1e..3c3e415199d1 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
> @@ -8,6 +8,7 @@
>   
>   #include <linux/rwsem.h>
>   #include <linux/types.h>
> +#include <linux/wait.h>
>   #include <linux/workqueue.h>
>   #include "xe_uc_fw_types.h"
>   
> @@ -61,6 +62,8 @@ struct xe_gt_sriov_vf_migration {
>   	struct work_struct worker;
>   	/** @lock: Protects recovery_queued, teardown */
>   	spinlock_t lock;
> +	/** @wq: wait queue for migration fixes */
> +	wait_queue_head_t wq;
>   	/** @scratch: Scratch memory for VF recovery */
>   	void *scratch;
>   	/** @recovery_teardown: VF post migration recovery is being torn down */
> @@ -69,6 +72,8 @@ struct xe_gt_sriov_vf_migration {
>   	bool recovery_queued;
>   	/** @recovery_inprogress: VF post migration recovery in progress */
>   	bool recovery_inprogress;
> +	/** @ggtt_need_fixes: VF GGTT needs fixes */
> +	bool ggtt_need_fixes;
>   };
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 497a736c23c3..7fe3fb07e35e 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -1943,7 +1943,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>   	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>   		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>   	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, xe_lrc_ring_size() / MAX_JOB_SIZE_BYTES, 64,
>   			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>   			    q->name, gt_to_xe(q->gt)->drm.dev);
>   	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index 188565465779..5fb6c74bdab5 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -74,6 +74,16 @@ static inline void xe_lrc_put(struct xe_lrc *lrc)
>   	kref_put(&lrc->refcount, xe_lrc_destroy);
>   }
>   
> +/**
> + * xe_lrc_ring_size() - Xe LRC ring size
> + *
> + * Return: Size of LRC size

Size of LRC ring buffer
-Tomasz

> + */
> +static inline size_t xe_lrc_ring_size(void)
> +{
> +	return SZ_16K;
> +}
> +
>   size_t xe_gt_lrc_size(struct xe_gt *gt, enum xe_engine_class class);
>   u32 xe_lrc_pphwsp_offset(struct xe_lrc *lrc);
>   u32 xe_lrc_regs_offset(struct xe_lrc *lrc);
