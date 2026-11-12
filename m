Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD5A606A883
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 10:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ksZc3u39
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB67D10FF67;
	Thu, 12 Nov 2026 10:02:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5C810FF67
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794477727; x=1826013727;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PQKXcvgMW8vxJGAiYzz3No6GVdu5vfnk7nKlesI9+xg=;
 b=ksZc3u39LXOp1RVMbqqGPwP/rQDD0xRV4LfiV/QxsQNGlceRVa+AECTx
 ahmgYeK2sXcJLYYgQXZdxwAhG3Z0s6SP3VILhkHCqywmkCMHkcEKhFWGw
 MPf7vmnaBJ7mFAyBTAL5i/QtkO0sNQnpME5G5ixG2bifwkVFZ4Q9pGrfB
 1g3mDmsEud8rG7T06rlJXu1x75CplsI06BrTVNO5MGwaRBbswhj1KPmLH
 8IGq6aw3pDFL8KKvmI1M3Q26LBpaA53glby/BrctPaHN/Ao8Rz2XvfUBv
 SsJh5ke2pYEw8mrLiUGKYxM9YnS2FStX5NaZOSvjSXLiGm24F74YSEky9 g==;
X-CSE-ConnectionGUID: 9F85WeDaTEqh6tTXM39/rA==
X-CSE-MsgGUID: ujEt96StQQSfUFChLluR0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3128368"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3128368"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 02:02:07 -0800
X-CSE-ConnectionGUID: SP9xLHq3QoqQxxksKmFROw==
X-CSE-MsgGUID: zjN3JKEATq+8vNJ85JKeiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8619043"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 02:02:06 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 02:02:05 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 02:02:05 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 02:02:05 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=whVtnBFcioJfNOeaStrISXs4HzaY3CS1Wju60sXksw8+4tKs4niy0PDHhDpHeqMhjEl6hfFxeukl61rNZDK0hUVhaGxEnZpvZGOXyX9PQAFj32IffLCWnCRs3ArqMdT4euonhqBbAHkoZxh8fj5gY17/ngTtd51Hs4GA+NPMd/SkEVtab+ab6yXIt14xAC6ekSvSGHxsNBdNC4MhlBoxMEoBVMSf5zmldXmd4AZxC1x5ExjqDMCp1gFSO94AapVHqyTWBBrA4XmT3ZLYnDyJrGcl2bXVqf9ccrmvcIyv1TvCjKpdXS3Y9naKCl9izvQzephVlzopByd5gNYAgXk73w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z3uXlukqjgrJ1rn1Duv2F45tL9buQWrIYKbJTLgyNkU=;
 b=t0W21e7d1l87a8bFPjkTM3afi6R9ZyvakV4UPWf8xxu3WAT4n5hICiwbfZBQfPS7aky3J3Y9OGfLUOCev/ybjBmFxaZIEei63Wrq/1iRLDBZynNtXvGR+/pRFLR8nqe291pVBOWKiouoraz+7J3mUO9Fi9oohtyRBtwwXQrVY1zpszrh5bmXfJSr3vJ0p8ufCSRznEXVoKxaRCqVhSvA1/j3A4Px8XR/gH2ZId8tTXQi0l52JbL2R4TIWMlnmz2v4LBG7SvAf+LESkpx4veYsAeZI988rhLAtRrYxJljYqaV7a43XsQ2tdYeY+GphVhlD8lt9Bq/gsBDLRFQvBHPhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7862.namprd11.prod.outlook.com (2603:10b6:208:3dc::8)
 by DS0PR11MB7560.namprd11.prod.outlook.com (2603:10b6:8:14b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Thu, 12 Nov
 2026 10:02:02 +0000
Received: from IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f]) by IA0PR11MB7862.namprd11.prod.outlook.com
 ([fe80::3b4e:43a6:6e22:22f%5]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 10:02:02 +0000
Message-ID: <aa38cf1e-b2ae-47dc-a97d-a44eacaa0baf@intel.com>
Date: Thu, 12 Nov 2026 15:31:53 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/xe/xe_ras: Add support for PCIe error component
 handling
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <badal.nilawar@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261112095744.3520095-2-riana.tauro@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20261112095744.3520095-2-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0264.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::15) To IA0PR11MB7862.namprd11.prod.outlook.com
 (2603:10b6:208:3dc::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7862:EE_|DS0PR11MB7560:EE_
X-MS-Office365-Filtering-Correlation-Id: 011cd745-daf2-4ff9-2e08-08df40a3ff5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|261026140227099003|261022113327099003|11063799006|10067099003|56012099006|261022105027099003|261021121427099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: bj68jQ9qARGmQ8btZGE4jvyxV7KUPl/R5Ne8mvrY3tkSINsNXtMz61VLp/AH906jwE6d/MxJwcQFxBtjyVqws9g1c01FgETFn6hwKCYQ8UsRC6LPy1EYeEg+PBwygFCLAiAPQUA2NmxYZ78/e33WLP21b1hGd5TPcSEa9Z+StMlbpxp+KCuP6ZKiwEdnUJbtSI+/DZIt0g6PRq+RQYDYTmHUTvO2QDgDAHdIf/xuYV2qnIOYPKke6zdtp5kdI7wiiAVDclXtnx3dSAQDXvZX/VFI9IFvv0PQPfhPt7D/DwguIjv9o7OcrEWELKycTII47t6f4QuPM3V/HHZxV8KiouLl1gTVzH7RFIVyeRdFy2A6vyvLlKJz2UhPyqTO/674WqNqRxP1H4RHb+l9Gvvlq0VdgONghzBSAC1eC4xcbCjsmIrfWwHXeMiSiq2UsFta3b0KCaP7O9sTW9au7x0bFg0zKjTCX80G/FpwB96nl26/SlJhycMlMkkLmYbEX6WWaesTG9+gY7gnRAo9Sm6KLlgupM5b4iEwZRlT9/8FV6LQuB8JjLvRdc0Pob/jWaBnjvTG+sWPD8LfrM8UXZDwcVuMLl+TPtlHguQWiUPj8a2Vy8dW/bQ7WxRZ7+HgZHBv6F2nwCMWnQ8Gi17xVqO3DsG1FPSQNuwtWr6VJwcYZ9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7862.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(261026140227099003)(261022113327099003)(11063799006)(10067099003)(56012099006)(261022105027099003)(261021121427099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RUZrMnFleXZHc0kxbGUwdG1MWmNXS2plNlFncHdxc3BLNC9mRUlaVGNoblBW?=
 =?utf-8?B?MmkxTGNFRWVWTWp1bnhKcDZqSExOcmZLRld2cFRrYVZQbVZ3T0lQYjUwbWt0?=
 =?utf-8?B?ZmZwWDIvdDNvcmJDUVhydkNRTUNEUjZRc2RqRVJwTTIrZmR6SWcyWkRqRTJF?=
 =?utf-8?B?UkZHbTZvb214ZnV1VVFwMkcwbWhVdGdWMGRBOHpIci9NeUgwbzMzbzk2VTNr?=
 =?utf-8?B?b3BGeFowZmhYWXZsRHNjSzBRcjRlMUJPU1lDZkpEOU1idGsyeG8xd0JsMUYv?=
 =?utf-8?B?VDd1SlhybGpYNjVKbkRFb2kxb0U1SkVrRzhEY0JXdGJ6K1dzd2ExVzZwcFIr?=
 =?utf-8?B?MDJEcEVZa0dOa1RpVG5HU2l5SzU4QlJKc1F5MFJVKzU3WG1MNmVhTnRVTGVs?=
 =?utf-8?B?a2tmNjdHWHgrWmRmb1hhd3BINHpBVEY4ZjFWdHMzb3I3eHl4R2tneTFpSmhP?=
 =?utf-8?B?U1kwZkVEUUJsWEZXWnJUNXMvRGRpOC9xNUR2UmJrRFRhNXNIUjJKbWpScUZr?=
 =?utf-8?B?Y09MWEE3UVZ6L0tZM1UxdUpnU3AzOTUxbnFZMWVwVHNGVURaVW9vMDRhUkZz?=
 =?utf-8?B?czc5emJVMTBVcDN5Smp0Y3V5dUtUN2M4MjhOZUxrN2xQbmJuZS9uVVVYZWtH?=
 =?utf-8?B?bDhQVnRYelU5TzFkZHJNMWJDcFpiSGNDdVVVM0wybE0wWkx4NDJIc0NxUDNM?=
 =?utf-8?B?Q0IxaGlZR0EyQWtIYzdNWWJrSm9DaTdRQmtTT0g5MVlHV3I1bzNXRy9UbnBG?=
 =?utf-8?B?TzA5Q3BBMXJDSlZrL0lEd0JOd0FpUEt3cXRvUmlXalJScVl1WFlPMWhRbkVy?=
 =?utf-8?B?VjcxbVJpZ3J6bTUxcFppWldyMjRlc2JRMm1DMmtIREdFTlBQT0pVTHUzWUhi?=
 =?utf-8?B?VWpXWThNNnFYL3dKN3pmWHJ3WXlTMDFieFhobURnQWY0L1VTSm9wNjdIRzFI?=
 =?utf-8?B?OHpJeTlwOWtuTDcyVlRqZG5tQ2NaUE5jTUgvZnVWZG80aGV6SGgyMDFpVkwr?=
 =?utf-8?B?K1lTWlE0TFMrMzVGcGc4TG9PZU9LNm1Ed3BXWmtuT0xtQVhwYmh0QS9nTXdh?=
 =?utf-8?B?UFc1WCtDR2p0Z2kyUEN5S1MrQ1hQdkZIVFR2QjlmbXlxZFhYTWdoT1Q3ZGpK?=
 =?utf-8?B?MUY5L2J0a2QzUUpnU3lYMnRpYnhWVy9xamZVOFhYcVhjWnVhWXFTcFFVTFln?=
 =?utf-8?B?aVByU21TeSs3WnB6bzd3aXpQUDNHTzdiTVczbWNPTjBCTktxdDZ2TTZYRi85?=
 =?utf-8?B?SXEyVnhuT015YUMwYk9GNVd1clZ5dzFtWGxIckJHRnZOdHdOZ2FNUFdaN3A3?=
 =?utf-8?B?T2hvcHV4bFBvckRMRTd2RHBZVkVJVitUQUE0Uzd6UktXRE1hQXNuNGUzWERJ?=
 =?utf-8?B?bHV1aWppVnRrOWxtZEw2cThpL3o0elQxQ3J3UVZBVmdjUXVGL3MwSXpsK1NL?=
 =?utf-8?B?aGpFTE5rRXNURk1nemJtUUY3WjZyMjQ3enM3TnhNKzFxVEZiK0NTTDBhTlY5?=
 =?utf-8?B?WnhjdWl4VUdYQkZaYk01anVnTlpiZnlVT05JYkRKV2tWN3ZhRUZrWjkxQzNG?=
 =?utf-8?B?UWN6b044ak5ZSW4vSjc5YXEwQW1QTWhzTklpdWptMENJYXUyZ3F2RUovTmRT?=
 =?utf-8?B?TVRRT01ydWZCYVhzZHNVT2NUNVRiT1A5YzNaSnI0RHNzWVdkcDNYbnNzR3I5?=
 =?utf-8?B?K3BwRVVlUlpQQUV1SVdtWjU3KzRhOEdhUjFKQzgvNFAwVkdUdkM3VGpKWlk0?=
 =?utf-8?B?T3BBWWp3UCt4SzJOcXRjU0U4RkpUMDNVV3VRVHlWOVdlMmVYRVFENmF2UVF1?=
 =?utf-8?B?NVkwSzBJWVVsWXVjdzdMcjVHOWk2bXhrTTd6QldxWGpHWWhqTGZpUTFBYjZH?=
 =?utf-8?B?alYxdDBjNlpyY0hvU3NOUGNMdUIzZDBWL0pOYmU3RHg2YVNXWERwM1k1djJv?=
 =?utf-8?B?WTE3U050L2RjSnUrdlY1elZYeFNNQmFyQS8xVkk5Vmc0djcyek9uWTJoYjlu?=
 =?utf-8?B?WEpHMUJKMWRUVXI0WWw0ejd6VjdlMUJ0UnhOblU2Y1gxTjdMREVSQVMzMTZU?=
 =?utf-8?B?T0lxbDA0NUdsdThZcmMwdkpPaVN3RzFFNVNyUkUrZ0JScEZMb3NwRXBaWG5W?=
 =?utf-8?B?U3FhVmFRaER1enJjT0tHejFaZGYvOVBrVWMxVnFpZE5DakZPODhiaFlqZng0?=
 =?utf-8?B?cXY3TzR1MEhXaE4wMGhnS3dndWZObHd0KzNWTGNNWDFKaDk2Y1FnSjFYNVFm?=
 =?utf-8?B?NGpKa0RNVGF3cXp3czQ0djNkZSt4ckp3VERaQVdRQVdTTGVvdnJKUFlBa2dj?=
 =?utf-8?B?N0drYjUyVG9uTjFqQ1FkT0NzWkV2bXJwUUtwdDA2bTB2WmVtRlYzc1JIWXN5?=
 =?utf-8?Q?hpl1HVxm7lWjqAqU=3D?=
X-Exchange-RoutingPolicyChecked: aEMISPyqs7DDssr8CuJiIR54a1Ek0a5fHn7goBNbmWkwrnWNHEm5L9Miwn9JJTP5vYuBnaxhqiWcNXfDLnAsJzqqJxUQvVjy+XgGkZJSVZgRqgz6axrlnk2VskDKq7hpRT9X9uXqTifugcVtmdKKUGwHBZh6dFBxE4M9/Ef+5fQrof5ka7TFI14Gug4Mgu7VZDf1iQDTCiZkryfzQcBmHAurSI1Xlfg4kc/joaAqolehxEHj791pYFWr3AiqRSj5Lo1OAM+kWlRu+mOVFZNcR2p7xThpClp/O9V17Uc5IwVpeoxbyc/7oJ2kZou+aHNQK0xm9tS5pzxeYlC1YXIA5A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 011cd745-daf2-4ff9-2e08-08df40a3ff5c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7862.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 10:02:02.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7DAc87G+pIz0kkoOd6fQgexQBLxCkoHO9Wy66iVBMNWvhDWOGysArGerQDykLnjr7B/WjVqHvjDCtaHOf3jFz6hYsIAc76b4IpBZCsqnpQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7560
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


On 12-11-2026 03:27 pm, Riana Tauro wrote:
> Add support for handling PCIe subsystem errors. PCIe subsystem power
> management errors require a Seconday bus reset(SBR) for recovery. Treat all
> others as recovered and take no further action.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
LGTM,
Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v2: add mapping to cper severity (Badal, Rodrigo)
>      add abbreviations
>      fix punctuations (Raag)
>
> v3: drop fabric patch
>
> v4: add global_error_status in log (Raag, Mallesh)
> ---
>   drivers/gpu/drm/xe/xe_ras.c       | 16 ++++++++++++++++
>   drivers/gpu/drm/xe/xe_ras_types.h |  2 ++
>   2 files changed, 18 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 2c01c183d02b..da57ff60c11d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -698,6 +698,19 @@ static u8 handle_device_memory_errors(struct xe_device *xe, struct xe_ras_error_
>   	return XE_RAS_RECOVERY_ACTION_RECOVERED;
>   }
>   
> +static u8 handle_pcie_errors(struct xe_device *xe, struct xe_ras_error_array *arr)
> +{
> +	struct xe_ras_ieh_error *info = (void *)arr->details;
> +
> +	xe_log_comp(xe, ras_sev_to_cper_sev(arr->counter.common.severity), PCIE, &arr->counter,
> +		    sizeof(arr->counter), "error detected: 0x%08x\n", info->global_error_status);
> +
> +	if (info->global_error_status & XE_RAS_PCIE_IEH_GPMA)
> +		return XE_RAS_RECOVERY_ACTION_RESET;
> +
> +	return XE_RAS_RECOVERY_ACTION_RECOVERED;
> +}
> +
>   void xe_ras_counter_threshold_crossed(struct xe_device *xe,
>   				      struct xe_sysctrl_event_response *response)
>   {
> @@ -889,6 +902,9 @@ enum xe_ras_recovery_action xe_ras_process_errors(struct xe_device *xe)
>   			case XE_RAS_COMP_DEVICE_MEMORY:
>   				action = handle_device_memory_errors(xe, arr);
>   				break;
> +			case XE_RAS_COMP_PCIE:
> +				action = handle_pcie_errors(xe, arr);
> +				break;
>   			default:
>   				/* For any other component, reset */
>   				action = XE_RAS_RECOVERY_ACTION_RESET;
> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
> index a86f9d2b8c92..36435a3f52e7 100644
> --- a/drivers/gpu/drm/xe/xe_ras_types.h
> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
> @@ -14,6 +14,8 @@
>   #define XE_RAS_NUM_PAGES			25
>   /* Error bits in IEH global error status register */
>   #define XE_RAS_SOC_IEH_PUNIT			BIT(1)
> +#define XE_RAS_PCIE_IEH_GPMA			BIT(5)
> +
>   /* Device memory error categories */
>   #define XE_RAS_MEMORY_DB_ECC			BIT(1)
>   #define XE_RAS_MEMORY_POISON			BIT(2)
