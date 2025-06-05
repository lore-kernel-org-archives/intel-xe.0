Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CAC4C5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 00:15:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D0C10E0EB;
	Thu,  5 Jun 2025 00:15:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dUtmoHQX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0A510E0EB
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 00:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749082525; x=1780618525;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=30+p7y6EzxLPPtjTaAynNn5ZglNhn0rSTAtxMicD+3w=;
 b=dUtmoHQXrW9UIUIlo5P1mCM6YYkzIwElKpjqzHAe5fG7fzyKHJi+J00y
 amHUfEN4RPC9jKHlQGTF3N6en8KJXl4QWT56ueJvRsq+/mBLwSlsPhyNv
 gDH0JUwBQOIM43RHpXjeyIEjKI4PhO54yWt6nFwaFZ0A86ayXlj/yC91g
 7jdiCmRvz8RVW0B5PuzEY7xd5mcRnnJYxFGFGv3CwD9nb+U/bkJZoryb1
 cBxg5gNcgm+0lm83k6pIio4VSajhexMfot83sV5dR7dYrznOpIzqaP4UR
 B70Ea4/oYsomz8kNPB8iguQBXaPv0wV2PV9NxB1kXL0w6fH7Nfe7fPFZR g==;
X-CSE-ConnectionGUID: 99xA0y+STaWK2+6pP9WZ1Q==
X-CSE-MsgGUID: yEcuWqldS0aSeDO3witIyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="68623649"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="68623649"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 17:15:24 -0700
X-CSE-ConnectionGUID: a7KzJDvRQHKtBHpe89qhHw==
X-CSE-MsgGUID: 8zdj3EiiR2GREeUXwyEKpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145293780"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 17:15:24 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 17:15:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 17:15:23 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.85)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Wed, 4 Jun 2025 17:15:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H/TdJCfO/o8GE0IkvTyVPjdt4tKSsrmaFNzjWSQRWGevMBQlefJzJCNCv9v7RrBOXeozMRF3ftYmuq+rEltr9SCIwMYPYFM0ZtosQdTUtIu8jyuH2SIsOzjleg1b16tekDKar8orVLY+8a/rWpyfghz3xQYvZ5DvlaaWb522cO2OgAu+uumaBbu4CQOSg/YOjW1vEogLPqn5NOa+s+GGIUa/sO45xr+h+F2OeoxgAzqgMBHHHNKMbTCYqFEQy2TpuYhix5zfZbi5e/2Gq3gDZ7fwChuh2LSeWJdb4EM9LVwS5/keenyCYeXK9IclPsc3cGLux2O2ezJ0+9gyJgZoEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5xvIxoRx5eaT1Tb+57l3iANuI+qZSoczCDHAf7crJxA=;
 b=sVFQCJrIZVTbtILUgBzTR/QfLFE2rb6zx14p2K5GvOqRnEPQ/91ZvQudrRULHIo70GYMgiLBa+LL0C8NAHl9fnTxsmxr6Tij07fNAKQAf1xHm6GL8HBiVR1rpHi8TPk+2yjtczonmgITjWvj3wjgqddaitJRZdfjjJuLm6SPCVz/gb6pNDmIBc4KFrpntFyW4LS1FgVvFjQlyVg06fk+tGSuKX6GUW0ohx7h+HgxmPT4BS3otDrSsXLLzuR8ATq6TzrYZ63Ak51sqWM65KEdJ4ExzToCjGi17q1xzmBU2d8vyTnMhhKF+VqfzQepGKXHrgGmaSgi//npQkMIw8LScw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.19; Thu, 5 Jun
 2025 00:14:54 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Thu, 5 Jun 2025
 00:14:54 +0000
Date: Wed, 4 Jun 2025 17:14:40 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 4/5] drm/xe/oa: Assign hwe for OAM_SAG
Message-ID: <aEDhcKBvXUlVumAW@unerlige-desk.amr.corp.intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
 <20250603202133.2713863-5-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250603202133.2713863-5-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY5PR17CA0019.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::32) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b39e289-63c1-42b3-6fd1-08dda3c5ff23
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1RUSjI1VTZJSzExTE90OGVXYmFjNGpMVFVPR1VDUDF1M0MzUXFvM2d2Risw?=
 =?utf-8?B?a1Z2b2NxclduMytpQ0NQY1NWejVlY21KM2grQ2g1dFU4bmh1MTBNYlFOVVN3?=
 =?utf-8?B?cm9VUkNCZjVMWTV6cm01ZHltR1FVQnJVdGRLcmdzbG5jRUhkZnMzMGE2eks0?=
 =?utf-8?B?cER1aFlMeDhjWkNjNW5QMFhoaEpqMGJINEZ0RHFsdnZnZGZvL0ttcVVQdzV3?=
 =?utf-8?B?T3ZZZmh4cGU1R3pWQ2JTVXpLVVdjSWxsMFBRenlqaVlPWVdYN01UTkNYN0sr?=
 =?utf-8?B?aUtGL3pqYkdKTEtFNkxwVzZTMmIwMDF1b1RyR3krRXI5dW9HK1pHUVBiRjV2?=
 =?utf-8?B?NlNEZXpMeXpweVQ2RmhCUitnUlRmTzd1dU4wSEJIUmI5RWJWUGtvQjZkUnND?=
 =?utf-8?B?SGlLNm8rQ1JGMHJGYmlXK29EbUF5L2NRc3hJOHVJK2s3Uk1VbzRid2NsdGMr?=
 =?utf-8?B?bC9uYVlOb1lyVFl0RzlyQktxUk9aMHNkdnNVcVdwSVJCLzRDVnpncEZnYUlM?=
 =?utf-8?B?THI1T0xBMjI2OWN4cHVpdjZERGxDbUFMbHJINDRmajFoempFdmxUKzZ6RE42?=
 =?utf-8?B?K2p1SmU4a0hTZERocUxOdkRIeHFiek8xTWVuYU1lbGdwTUxnZWU3NGZweEhh?=
 =?utf-8?B?dVBnSXRqOXhqVnV1MWRGWXdJYWpQd2g2NU12czZHaHROZTZxY2tBNmRaanY5?=
 =?utf-8?B?TzZSVnNhUEZzcDA5bk5ZWmR0dlBvbTVRZ3VEVktWUWxyakhzSUNTL3p6YjNX?=
 =?utf-8?B?STVHeXhKYWREQ21QUUxlL0dudy9jVUJqYktVT0dIMkNiaHpKN3YyRlQ1WlYy?=
 =?utf-8?B?bGNQQXpJSVZ5aVpiZ1M4bE8rS21RU25IQjM0ZTlEdTgwMlB6QVY5Nk5EWW4w?=
 =?utf-8?B?STluUXRsSnQzRGl5RjkwZzVLSWRVT0ZpNEhkK1VLb294bWlxbFVITWpZTnk1?=
 =?utf-8?B?dEJ1N0N0Q05Rb0g1TENRK0Z4Q3A4MXZLNFRXZEJEbzhzZ2l2U3FycW1UYktm?=
 =?utf-8?B?VlNTL3MzVjJEVTV0dWNNbkxtUXM5clZVV3dOL2wyZFdxRit5ak0vYWU3ZjdN?=
 =?utf-8?B?Qmc5c1RWMUZIcytwZXc0blFMNDliQTJtbHZIRG1hWUpVbjFkRXhXNndoQWF6?=
 =?utf-8?B?S2I5dXdlMHcyMEdCSitOQ3VRZXBqcmpKa0xEVHJrQWRUbWIxTU1MWmZzU0VV?=
 =?utf-8?B?d2RNUURDVnR6RzR1MzJDajgyYmVmUkNnVERXR1o4VHM5Qm16NUtZRzdEMEhw?=
 =?utf-8?B?UnNKSThWNXJSeEFyTFVjc2grK3E0L0lsZjZrOTZFczNjTTlpTTAwUk5lbzl2?=
 =?utf-8?B?RjN4MitRWng0a0ZXcVRaTS90NUVPTFI0bEZQYlhOMHdVeE9ONlU4T0Q0ZXpY?=
 =?utf-8?B?eTdKaHVab1JTbzBtSGdIdFFucDQrcERkekI2TkFSak1VK0hPT0pPQXpKbmZw?=
 =?utf-8?B?UXNBTktvbFZVc1NNMXd3MU05bFVDRzBNbmM3QTJQVjI3em05NlRMZ3hCc0ZH?=
 =?utf-8?B?dGdQQlMwbWZJNnlEclRRSzAzQU1BNThkMGRMWk9hV2F5ZXdqeHJxM2x1SThu?=
 =?utf-8?B?MXVCcHppM3BSTUY3by9MejdkM2dXaWllc003cC9WSXk2Z0pnZlYva3AzanNm?=
 =?utf-8?B?ZGN2M3hnN2QzZXpxVG1HS2ZLZWxNWEI1dHpKZzcvb2RGM1ZuOFRkelJEUVBQ?=
 =?utf-8?B?V0hJdGJBZWtXUjdMRU5kUG94UzJ3eDdSZmoxQVBRd1FwN0orRUVGUHdoL2V3?=
 =?utf-8?B?MkRNV3p2azZwSWpCeG5iY0EyV01jbnRjMndtVHZtZDUybkNXbFREL2JUbEF2?=
 =?utf-8?B?T2htdjYwWHluRnUvNGRBangrWDJnK0RoTEI5NFZsd1g3K0F2d1lFWjhEOXIw?=
 =?utf-8?B?K3RRYndVQXpVNkFRdzI4SlpiK3BqakxmWlVpcUtycHRLZ3c4V1dkMXVkdmxM?=
 =?utf-8?Q?YS/4GFq/6vU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmR1WDE3MldHenJvT2lGOW9vYytxVFV2NW9MMkQrMXVjaWxRU0c3OGhZMTZL?=
 =?utf-8?B?RGpvZ0k5TXJKdlRIL2dodmpMN1pxVnlvNU9KWGllWi82elBZYXZtS09TTVU3?=
 =?utf-8?B?TVh1L0FKWkF1WHNzV1lVWkFPb2lOZ0NESVlhc1VwVzNyZWZmUU82Rmc1bG9i?=
 =?utf-8?B?NVh5VFB2WjZ1cTh6NjhoYktISHVXVHhneXJlUmdlQTVsMmJ0djBmYTgrTDB2?=
 =?utf-8?B?Uk1hZm5DT3laNm1EcjkxTmVBSkVacXJvT2VtYXlBYkFSc0RncUZiMjMvMWFM?=
 =?utf-8?B?VkpLZG9xUCt2c0ZnaDVUOHB4enVOSHJSSTVocTlUeGZXUlZhak1Ra2tMSjRw?=
 =?utf-8?B?VFZYeWx3ZDhZOHFPd3ZTQ3lMb2haTVc5MTF4MXBoQmNPOGV5RXhzSG1TZzd4?=
 =?utf-8?B?dTY0RmhhMDlyYWxuakZDUURHdEdYOXpIclNNN1JXeWZSQlBrdDU3dE5MNnlq?=
 =?utf-8?B?bzgrOVZKVFMvTE03SmVDYm9DS2tRRmFaUmxMN29RdEpmRnhXenJHTC8zK2lj?=
 =?utf-8?B?ZEw2OUhDbEx5aEJqMi95dVo0YTRyQ2RXc3N4M1VXdEV1V2ptNC8rTjJlSWdP?=
 =?utf-8?B?aWI4czJUTVBCSlZkZzMvSi92L3NSVGhIVHE5azhDSlFVaThTZU1OZ1VhN2J3?=
 =?utf-8?B?eGhERFlHK0dObE9JNVVSZFExNWJsam9CcS9ZMWplTDhIUHh4Y2QyOExvWjRP?=
 =?utf-8?B?SVU5TVpKaVVadGowd2ZGTWl1MnB1d0MrRWhVOVczTlFJSUd2Y01PWUU5MmdP?=
 =?utf-8?B?S1FrbVlNOEtVZTRvLzdTRXl2cjJSQUswQXhzMEJKeEduUFFRN3g1WmUwOWph?=
 =?utf-8?B?Zm1DMlhvRDV5U3lsNDUzemdINER2a1hKY0tLeDl4T2QybkE4anVxUWJabWNL?=
 =?utf-8?B?MjVlMzN0VXdKTjhlUm1YTTduS0VFQVJuK0F5UTljV2MvUEhkMk1NSDl3TXBE?=
 =?utf-8?B?U1FCTW1IcWdiYUhscFhzMUErWit3ajVpSldPSUdVc3dvb3ZudndmVEI2NHZR?=
 =?utf-8?B?OERQb3RORXhUL2tvdWNRZEdWY3dVQkFpdTdTRUVFN2loVmJranUweWNGaHJI?=
 =?utf-8?B?M0VESGJiQ0xESi80L1kwM1pEb0YrMjVONHp6UUNDTlVkbi80Q0lDNmYwUTNT?=
 =?utf-8?B?UEpuUmdnNktpd3lMczRmV3kzd0NLc0pTRHc2WUxOZVlZYXRsdDh5WjBycmNU?=
 =?utf-8?B?ZTVuY1pwYUI0eCttR21idHY0R0xpeUlqSkVPU1IyMGJpMGl3RUZZMFlta0tk?=
 =?utf-8?B?Q0VHdG9DTERQcGlraGJVRjQyb3FMTjRWWHE4SjI0b3dIUVlZa3I2NzRkSFp6?=
 =?utf-8?B?Y0Q4R25sMHR0OGVHNWl4Sk1yYWM0NW1pUkNUQ1R6TVVoRWlObkZuQmVkRmla?=
 =?utf-8?B?SEZQampGVWpYcWRzTHF4LzNGNTNMZ3ZBYnVnNlJWTVptVEl6aWY3bThrN2Vs?=
 =?utf-8?B?VVV5UE5NL09ScHhwRE5uS3lZb05SQTFPT1B3akJqemRnNGFmbndTaG1GYUpG?=
 =?utf-8?B?cHJNcUZ1MXBHUmpiemRCR0VzbUpTMTV5MWwxV2tMelRnN2prdndoNVpMNGNR?=
 =?utf-8?B?VzVJYVpNNDc2dFFqbko4NkJVZG9vT1lySnZLaDd2K0VZVHBVTTAySi9DNzAz?=
 =?utf-8?B?SW5Bd1Q5QlZKNDdwbitUeVBUaVZDOE9zRjBRSDdCYStrOW1kWitwNXlXd3o1?=
 =?utf-8?B?OS9jNUkyTXJuZlo4bWwrRzB3OTMyYjkyUTVHdlBFOGMya0NKTE5oTVBXaGdn?=
 =?utf-8?B?bHlLc3UzbUZ2dVErRDIyOWpZcXJBUXZuYTlxRVlic2JCdXRmYm5kK254NE9T?=
 =?utf-8?B?VzNjeWFMb0MrSFdQQWJIYXFvTmFBQWNYYkhJU3hxaXVGS20yZFlBNmVObVlF?=
 =?utf-8?B?SUIwbWxQaStSWGNJLy9BQlBrZHdlbS9KTUFuMzNqanhQUDAxbGlVUUdQWEpq?=
 =?utf-8?B?WElpR3U3dzNoTnlRS2VuVEhMYjJLR3F3YnozejU5SVNBUzRYSkVvRWlhWC9u?=
 =?utf-8?B?d01kOHFYUDZVaC85WDJBMUp6TmpqaDE2bjVucTF5VzBDYU1aalNpcWlQRGhW?=
 =?utf-8?B?ZFptMDRGc1gxbmprRkFZUHlGYUpiSTVqZzhLdnlRZGVta2c1NXpGdGYxVE0x?=
 =?utf-8?B?alI2dlI5eGVYdWw0ZkEzdmtSUGxBMVpMU09yT042bUFsMS9oRXZGSzhTQmZ4?=
 =?utf-8?Q?cRv+g23WscLOzvyIuO3So6Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b39e289-63c1-42b3-6fd1-08dda3c5ff23
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 00:14:54.2549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VleZQL/F9KB0bF1r/y10QjHda2hbTroY/NaTF3/oReYz5uiMvTvk56DUEKBNyyMidTOOzN5uRMF5VfLBHHPJQtw6alp2CVGF5UJpaH8bLXs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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

On Tue, Jun 03, 2025 at 01:21:32PM -0700, Ashutosh Dixit wrote:
>Because OAM_SAG doesn't have an attached hwe, assign another hwe belonging
>to the same gt (and different OAM unit) to OAM_SAG. A hwe is needed for
>batch submissions to program OA HW.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c       | 54 +++++++++++++++++++-------------
> drivers/gpu/drm/xe/xe_oa_types.h |  3 ++
> 2 files changed, 35 insertions(+), 22 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 4d6d9f0189a83..35157424010bb 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1923,37 +1923,45 @@ u16 xe_oa_unit_id(struct xe_hw_engine *hwe)
> 		hwe->oa_unit->oa_unit_id : U16_MAX;
> }
>
>+/* A hwe must be assigned to stream/oa_unit for batch submissions */
> static int xe_oa_assign_hwe(struct xe_oa *oa, struct xe_oa_open_param *param)
> {
>-	struct xe_gt *gt;
>-	int i, ret = 0;
>+	struct xe_hw_engine *hwe;
>+	enum xe_hw_engine_id id;
>+	int ret = 0;
>+
>+	/* If not provided, OA unit defaults to OA unit 0 as per uapi */
>+	if (!param->oa_unit)
>+		param->oa_unit = &xe_device_get_gt(oa->xe, 0)->oa.oa_unit[0];
>
>+	/* When we have an exec_q, get hwe from the exec_q */
> 	if (param->exec_q) {
>-		/* When we have an exec_q, get hwe from the exec_q */
> 		param->hwe = xe_gt_hw_engine(param->exec_q->gt, param->exec_q->class,
> 					     param->engine_instance, true);
>-	} else {
>-		struct xe_hw_engine *hwe;
>-		enum xe_hw_engine_id id;
>-
>-		/* Else just get the first hwe attached to the oa unit */
>-		for_each_gt(gt, oa->xe, i) {
>-			for_each_hw_engine(hwe, gt, id) {
>-				if (hwe->oa_unit == param->oa_unit) {
>-					param->hwe = hwe;
>-					goto out;
>-				}
>-			}
>-		}
>+		if (!param->hwe || param->hwe->oa_unit != param->oa_unit)
>+			goto err;
>+		goto out;
> 	}
>-out:
>-	if (!param->hwe || param->hwe->oa_unit != param->oa_unit) {
>-		drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
>-			param->exec_q ? param->exec_q->class : -1,
>-			param->engine_instance, param->oa_unit->oa_unit_id);
>-		ret = -EINVAL;
>+
>+	/* Else just get the first hwe attached to the oa unit */
>+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {
>+		if (hwe->oa_unit == param->oa_unit) {
>+			param->hwe = hwe;
>+			goto out;
>+		}
> 	}
>
>+	/* If we still didn't find a hwe, just get one from the same gt */
>+	for_each_hw_engine(hwe, param->oa_unit->gt, id) {

Not sure if for_each_hw_engine omits reserved engines. If we should not 
use reserved engines, we should check for that here using 
xe_hw_engine_is_reserved(). Also, maybe we should only try to submit the 
batch on engine classes supported by OA. Submitting the batch from other 
engines (like bcs) is not really tested.

Thanks,
Umesh

>+		param->hwe = hwe;
>+		goto out;
>+	}
>+err:
>+	drm_dbg(&oa->xe->drm, "Unable to find hwe (%d, %d) for OA unit ID %d\n",
>+		param->exec_q ? param->exec_q->class : -1,
>+		param->engine_instance, param->oa_unit->oa_unit_id);
>+	ret = -EINVAL;
>+out:
> 	return ret;
> }
>
>@@ -2578,6 +2586,8 @@ static void __xe_oa_init_oa_units(struct xe_gt *gt)
> 				DRM_XE_OA_UNIT_TYPE_OAM_SAG : DRM_XE_OA_UNIT_TYPE_OAM;
> 		}
>
>+		u->gt = gt;
>+
> 		xe_mmio_write32(&gt->mmio, u->regs.oa_ctrl, 0);
>
> 		/* Ensure MMIO trigger remains disabled till there is a stream */
>diff --git a/drivers/gpu/drm/xe/xe_oa_types.h b/drivers/gpu/drm/xe/xe_oa_types.h
>index a01c85931e2a5..2628f78c4e8dc 100644
>--- a/drivers/gpu/drm/xe/xe_oa_types.h
>+++ b/drivers/gpu/drm/xe/xe_oa_types.h
>@@ -95,6 +95,9 @@ struct xe_oa_unit {
> 	/** @oa_unit_id: identifier for the OA unit */
> 	u16 oa_unit_id;
>
>+	/** @gt: gt associated with the OA unit */
>+	struct xe_gt *gt;
>+
> 	/** @type: Type of OA unit - OAM, OAG etc. */
> 	enum drm_xe_oa_unit_type type;
>
>-- 
>2.48.1
>
