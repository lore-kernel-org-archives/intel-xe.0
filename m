Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080DEC5AC7C
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 17:52:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA2010F27C;
	Thu,  6 Aug 2026 17:52:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQf4OXfq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA6810F27C
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 17:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786038761; x=1817574761;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=PVM43HNVrgOIKNk4IcZIN49j5TJ+J6FS4C1m4Hl8M0o=;
 b=CQf4OXfqtULeGyKqyfCehvwynCPtBpI1mmvotwXig9H9XUNGXe0XLfFT
 Byv9HX16gr8xtMzkjgXQHQNRp9K0Ig4SFAxX4/hR2ghSXhKMejoCNffcF
 o+XZyhxrgDi+PFZeQICCyEIBlfMaWZpjWE2qzHFxXrKChJ/Q6HsJOOgK+
 dQ69kZkiLTWcVnCl+DgBs+7Gg/QIPFa1O/eWM49Y5ayG6SbEv7rWfIDT7
 an2v+qRrMkhqbp6eMcwHfFBRcIeG3jsjqcbcQtGaxcBMZGF7QiGwQ6VGZ
 R5xnRBgLxYhs4mZdwJZgr2u9SbzEfKLjWuNTRzjOuBrLmJ16V/gZltIPS w==;
X-CSE-ConnectionGUID: xnvxMUTXT2GQTR92Cc2OMw==
X-CSE-MsgGUID: cEA6PqJNRZ+4s+imrD9rjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="104045659"
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="104045659"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 10:52:40 -0700
X-CSE-ConnectionGUID: hXK5mcBpQ+i9vzWIEfwbzA==
X-CSE-MsgGUID: S51Sq8j/SiOpycJ4d3Z1Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,208,1779174000"; d="scan'208";a="266395896"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 10:52:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:52:39 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 10:52:39 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.34) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 10:52:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iqNVMXc+AFPt6YKVk7HK0GxUsO2eG5KR7MzFhq3++WdvptOKT9ofAmg8zAWq3WAi69U/NvpoabIbSSezx/OCFyIuqdb7w8lSYp0LhYSQIGlqboEodEXSfUUg05vkBhpF+HZUMdJjhLow00vQpWVdVwfu0f0V7HAL3i6J+BN6ghhXVX3e5KkO+D204243So3HxaBJy9D5y04p1blqm+w+Mx9Nf1i3A2mkVKQ50FfktdD+BluBscjBtkuzqw09Syn0mik3JZCX6PCoBJx1mQox6psJI3WBX4oqh7t99omB1XO2o4MBU757rObCyf+2nU+dHrrD808SYm2q5UVZSJy/kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CY6FWPT9TdUeNtuMTOnzfoEbaRJBP2mv1RKZfbMtqRE=;
 b=vtwug2i7T0VH87F/M9gq2w4IvtQUcNg7Z9OXgOqUmMP5nmGAsKsJXCKAktXkLp93/aTolwzuMj2YALexY+lp7DXqdg8yZZr0B818ln5rTDrUejqcDmpIDqf7xYHe8ng586jBGMs/c5C0RLm+kELn8gKG/Ly7zZ53ThapApoNRmbPh+PSl5g3KCpisbAbmdmOhlK/T63mUYcqB/SwQ1xqPRMJ8OErOfKbYR7ESu8z1JpA953eqTJ4a5GNhN5NgCfHrBxIoguUBZk7Xng+AfNxMjRxLi+HkM5DyfrR4gn/1S6yHXyJqDZjfE2PY/7/fd9RScJSEplMiVWutB9Srp2yIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH8PR11MB6950.namprd11.prod.outlook.com (2603:10b6:510:226::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.21; Thu, 6 Aug
 2026 17:52:36 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0292.018; Thu, 6 Aug 2026
 17:52:36 +0000
Message-ID: <4592d2a2-f241-4ff2-b922-997a3ef81cdb@intel.com>
Date: Thu, 6 Aug 2026 19:52:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] drm/xe: Use xe_log SIGID API for probe-path error
 reporting
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, Dnyaneshwar Bhadane
 <dnyaneshwar.bhadane@intel.com>
References: <20260806110039.1245282-6-mallesh.koujalagi@intel.com>
 <20260806110039.1245282-8-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260806110039.1245282-8-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0014.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36c::17) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH8PR11MB6950:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f3236fc-e8ac-49e8-f0c7-08def3e37fe3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|366016|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 6WM3jfA2bsT8lE93BOPeh4gc49rawjEY0E4cWe8AL04KPSV8nREw3ne5/9OASt0Neneb3ivIFXc9Lwm/zdXuVRTUxsWRQxh6RswxeXxtSrl7pFdZ5tS13dPQXeR6uz0rYJYPyXjtzivmeWbEwAX61njPSMLRQGCKws8KrUSdyft/NqWP6ZbPsZd2uciJ7L+teFoiqw0z9EuiKNgVCe+/E46Nx7mhqFvq9Y1XhZmOD2ep+pMtccFnmS8fuu6Y1nhAoBjVtt5MVKZFj7bsMliXMSlcGGxCrnFPdcF4bkPTGvsxvZcXXxnHGque3+t2VQ1u5iCmVsjRhp5K/ix4p74H9MLZJOjW7uSDEE/GOXFmNdZ4vc7MnKrpm3hSXy9YIzvOGIF4naAoUfPQtjPM+N0mW8f7JfmR7yQjOLVFVjAeGLZPSnZ0UjLVKpVVyFRvrKK+43yWkEq4cq4r3Obv+6T1sE/Rexg3zTripjDyNtX6/iM6UEKSwT32tWyfk/4ETB9hUUTAegj4zRJh76CBpzB/OG2l0I3OmrhCE4MVvAb2Hcm1ZyHNAOOCQxMfG3eGMrnK7o5BzoMyuKdsJiK+EV5R0kUyC4GzUZ4S4Vr8mMxffOeD20lvVXnIlGLoPCMqJprITymgJpi+YhtAatO3yQEL5nTSsrrzFk4HIuz+LywKeaM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(5023799004)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z25RR1c5TWFYS0xMVFBNT005ZUFPZnJjMmVVSmIzZlVyZTVKdGYxdnVXbTlw?=
 =?utf-8?B?STdPR3hsQ052a3dicTlKZGg5VXlLN09oOFFDbDdiQk5UL24yVlhqWDJkNXVY?=
 =?utf-8?B?eHBiTGtBY1J4OXc0MnJLT20vYkxTZUl5SjZ5ZVowVzRSTFhPd0tyTUVYL1gw?=
 =?utf-8?B?L3lzUXRGbmI4QWc2NFB0UTFpWkd0MnY4TDJCR3IrWENhbmZYL0NDQXdDUUhx?=
 =?utf-8?B?VXZPV0FUb28xLzYyWDJ0ZDdOU3U5VWlOaEhlSjRCYy9aZkZKb2o3Z0VhbWpV?=
 =?utf-8?B?SHN5aXlxU1V2eEp0TGdnYnZyWGtsQ3pNN2d0WlFaQzdxbWJEYmFCK2IvL2g4?=
 =?utf-8?B?UTdpZnVGWWZOSnpRNFg2dFFvSzU5VUZ2ZU5lZHBubTFqOGt4WUdWSEQvT2VC?=
 =?utf-8?B?bXRyV2NqWk9nRitKYStkYkVoODFQTitGVldGUDJHalFDdExtUUQ2dkRJWVR5?=
 =?utf-8?B?MW11Nk5TWEJLZzlqVmh1VFlZU2xTZWcxajhlNlIyUE9aOWF3ZG1GWEpQWW1q?=
 =?utf-8?B?eFlCSjFwUHhSQStsWkZ6YmNMekR1c0ROa05BV3h6ZFdoMjVJV2d6VWxZM3Iw?=
 =?utf-8?B?VEk4L2x6d0VMbC8xcFQ4dS9WV2hBb0RzKytzRC9MYy95azBuT0NoTWRLL1Q1?=
 =?utf-8?B?aHduUEROY2tWbHlRcXE5ZHBpekdNOGFrNmFHRUJPK0I5V2c2TUE5Zjk2dEx4?=
 =?utf-8?B?MkorQnlSRmp5dEpkY0tQV3BLQlU0dnZlQWdXUXhTVnlRUC9iMng5RENZYU15?=
 =?utf-8?B?akE0TG1jSlhueFpTNlBmWGFOTFN3Wm04NGJlajYrUlpDTHFWVmcxUEVheDhX?=
 =?utf-8?B?VGpUUjV2WWd3K1lYQjFHQ1VuaDZSWENjSHNhMTZneEljWFl1dkdld1BXRlpE?=
 =?utf-8?B?K01WRW5SRTdoL0JzbURpeFIxbFNpR3RobzV6MWRUS3JCMENJVjNGNzFGbmNT?=
 =?utf-8?B?QTZDMWhzUXZvZTJGR3dDOVhrMHp4V2p3by82SzZHU21RTUNCNjJ6M3J2OFZW?=
 =?utf-8?B?TGhaQ2VZL2VTYmxWYnlSMUxmOCtpVmE0MHpmbVQ5Sms2MFhBS1JMdG9GUlZG?=
 =?utf-8?B?RFN3OHkwZTh2aE5HN0xIaWc0K1EvNWp3a2xDc2JYeVY2cWUwYzF4d1BsZXZw?=
 =?utf-8?B?dS80dGc0TzJsN2FhdzlDT2JrWk54S1lPZlVLL3BxSjE4TTZtUnREdDVYS1lt?=
 =?utf-8?B?Qms4NnJJZmhhUDNWMXZJMVlWbis1ZmMvYktIRmR4RU83ZTRXSGRneGt6MnFk?=
 =?utf-8?B?RDRiQUZMY3A3b2JYQ25FTTFPaDJncFBFZ0JrdW5kemZVYklnZWVZUnZISlll?=
 =?utf-8?B?RjBveTl5U2QvTkxuMDY0R0I4d0p2YjFFZXkvZTVocm9SYzEveGg3TU5kT2lK?=
 =?utf-8?B?Y1NKYllJOVc3RnltVW9hN1IrOGh0aW5yWlZrN2R5YVU1M1E2emxMN2pYK1FY?=
 =?utf-8?B?dERhblE2VEVEMWcxMUh1dDJSZTI3bTMwQkJidkdkVVpMODNwTVQwOUlidHU0?=
 =?utf-8?B?djYraEVpVUNKdkc2QUJmWlNtUFA4dG1BZ2pYak8vcVpZQjRQZXE4NEhyZkdJ?=
 =?utf-8?B?Z2p6aXFRZ0dxY3FsR3phbzc0Y2ZCcWRoNm40KzA1VzM4MWt6cEpCRnJhd3ZK?=
 =?utf-8?B?VlF2SXBteTlJQWVWeUR0VHBYbWtuS1lWL0VGM1dZSDkrd2NzWHpOVS9TVEdi?=
 =?utf-8?B?eGQvMXNubXhhWVB5TzcyM04vSU5yN2Jzd3dyNVBpT3huanJ2WG5aZGQzcU5U?=
 =?utf-8?B?QklIOU1rT21SUzdrbm5mK2FReE5xL2Y4VjU2UzNPblBpUG9uYS9sRXV0alVv?=
 =?utf-8?B?cldJOW9FamNMZjMwOUJYb0xJV1hqeDlGMTJrb2pCdUlBQWhiZnlid1JKSDRv?=
 =?utf-8?B?a1ZOTTRNL1BGaVNhdzNocCtIVlZraWp0VmJ3TGphUXNSallnaHI3cDk3RGkr?=
 =?utf-8?B?T1NqdE1VenNmbU1YQmVNaGxqM3pYYVhzRWRWY2JkYXgxTlVHeStFMzVuRC9J?=
 =?utf-8?B?Tk9scjVMbWtMdXdibU15QlZBMmJNNjQ0K0lrSDI5c01leFFoM281UXFSaUU5?=
 =?utf-8?B?VmlDRFR3VUFhZFR2bHB0RGtkSEh6MjdOK0tUd3RsTVRDa1RYQWNLdnJHaTJw?=
 =?utf-8?B?N3Z1cDk3WEN6Uk1jUURKNW9sY2ZaeWVSQ0JMZElKK1h5RDNTUkJjaHlNcFR6?=
 =?utf-8?B?Ukpwdm9ISGR5UXZqbmQrNFZrNFk0RXN4ZDROT3lkdmVZKzQzSFNjelBlZGs2?=
 =?utf-8?B?SXpWVEFuKzFOT3J3SXJjRjlSZXJjMWUzVDFYUFl4cFRSMWorNGlrVXhyVlZy?=
 =?utf-8?B?c21pUE9jSEJoVUxMUHI4cnpIN1d2TFNJOU1mS2lNQ1FhYktqQ2x6WDBUV3cx?=
 =?utf-8?Q?/N4edWFksv76pwHw=3D?=
X-Exchange-RoutingPolicyChecked: eK8QFSVsCfe/LbPA/n7zjuqdRrh9XAW/psYgWQMiohoIBv4WiCNqEZwsuZ/ntvugPmGkOmfnCGORE7PWcBHIWfMt9+KrbI/Gz98KyYu6dYPB4Kp30IGaaQOeelTqYy4TlB1rbUbm1HTXI8a8n1sVNSy8XJPJywusLZq2UZA0xyXFBqCGsnR8IggWUgUivLm23Kg6byic4/rbMDCe5hfZ6EpoBScjJmp073Sck7KIdgisPC1NKr9zDeeAsfQE2UuxMV58lIs0F/fxoXziHfzDuLDd48QhsuZx5WMCH/oq9k841b0JYIsveHcPWTHEyJ41MuH9X0FASO7KWK/CVZ6MJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f3236fc-e8ac-49e8-f0c7-08def3e37fe3
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 17:52:36.4636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G3sjROMzMXVyyWB1Giq/VXsP96EGPCbVTNBbMjUyKFhTbgfDObPMAoTyBHuTWgu8ecysMg00CTVaVLqJ0BlnfP4SnT2WvlrhVLksTUYE4l8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6950
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



On 8/6/2026 1:00 PM, Mallesh Koujalagi wrote:
> From: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> 
> Replace ad-hoc drm_err()/xe_err() calls in the probe path with
> structured SIGID logging helpers. This gives fleet tooling a stable,
> machine-parseable identifier (SIGID) for each recognised fault
> situation rather than relying on fragile string matching.
> 
> Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c |  6 ++++--
>  drivers/gpu/drm/xe/xe_hwmon.c  |  4 +++-
>  drivers/gpu/drm/xe/xe_irq.c    |  9 +++++----
>  drivers/gpu/drm/xe/xe_mmio.c   |  5 +++--
>  drivers/gpu/drm/xe/xe_pat.c    |  6 ++++--
>  drivers/gpu/drm/xe/xe_pci.c    | 14 +++++++++-----
>  drivers/gpu/drm/xe/xe_pcode.c  |  5 +++--
>  drivers/gpu/drm/xe/xe_vram.c   |  5 +++--
>  8 files changed, 34 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index d25d02b24898..52bafe708d74 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -48,6 +48,7 @@
>  #include "xe_i2c.h"
>  #include "xe_irq.h"
>  #include "xe_late_bind_fw.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_nvm.h"
> @@ -586,7 +587,8 @@ int xe_device_init_early(struct xe_device *xe)
>  		 * Cleanup done in xe_device_destroy via
>  		 * drmm_add_action_or_reset register above
>  		 */
> -		drm_err(&xe->drm, "Failed to allocate xe workqueues\n");
> +		xe_log_err_fatal(xe, PROBE, -ENOMEM, "Failed to allocate xe workqueues\n");

OOM errors will be already printed by the MM, we likely shouldn't have this drm_err here...

can't we just leave it as-is and add xe_log_err somewhere in xe_pci_probe()?
also, maybe we should wait with submitting more patches that use xe_log() until we actually get some agreement and merge that first?

> +
>  		return -ENOMEM;
>  	}
>  
> @@ -717,7 +719,7 @@ static int xe_set_dma_info(struct xe_device *xe)
>  	return 0;
>  
>  mask_err:
> -	drm_err(&xe->drm, "Can't set DMA mask/consistent mask (%d)\n", err);
> +	xe_log_err(xe, PROBE, err, "Can't set DMA mask/consistent mask\n");
>  	return err;
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index de3f2aeffc3f..e4c319598dd0 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -15,6 +15,7 @@
>  #include "regs/xe_pcode_regs.h"
>  #include "xe_device.h"
>  #include "xe_hwmon.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode.h"
>  #include "xe_pcode_api.h"
> @@ -1575,7 +1576,8 @@ int xe_hwmon_register(struct xe_device *xe)
>  								&hwmon_chip_info,
>  								hwmon_groups);
>  	if (IS_ERR(hwmon->hwmon_dev)) {
> -		drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", hwmon->hwmon_dev);
> +		xe_log_err(xe, PROBE, PTR_ERR(hwmon->hwmon_dev),
> +			   "Failed to register xe hwmon\n");

while this is during the probe, shouldn't we use HWMON as a component?
we allow chained SIGID reports from different layers, and this error
will eventually lead to final xe_log_err(PROBE) anyway

also, there are at least 2 other cases where hwmon initialization can fail
why only this one is so special that requires use of xe_log ?

and IMO it would be good to add each new SIGID usage (across
different files) in separate patches

>  		xe->hwmon = NULL;
>  		return PTR_ERR(hwmon->hwmon_dev);
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> index 9e49e2241da4..74d2b63cd505 100644
> --- a/drivers/gpu/drm/xe/xe_irq.c
> +++ b/drivers/gpu/drm/xe/xe_irq.c
> @@ -19,6 +19,7 @@
>  #include "xe_hw_engine.h"
>  #include "xe_hw_error.h"
>  #include "xe_i2c.h"
> +#include "xe_log.h"
>  #include "xe_memirq.h"
>  #include "xe_mert.h"
>  #include "xe_mmio.h"
> @@ -759,14 +760,14 @@ static int xe_irq_msi_request_irqs(struct xe_device *xe)
>  
>  	irq_handler = xe_irq_handler(xe);
>  	if (!irq_handler) {
> -		drm_err(&xe->drm, "No supported interrupt handler");
> +		xe_log_err(xe, PROBE, -EINVAL, "No supported interrupt handler\n");

this is already a dead code, as xe_irq_handler() never returns NULL
we can use xe_assert instead

>  		return -EINVAL;
>  	}
>  
>  	irq = pci_irq_vector(pdev, 0);
>  	err = request_irq(irq, irq_handler, IRQF_SHARED, DRIVER_NAME, xe);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to request MSI IRQ %d\n", err);
> +		xe_log_err(xe, PROBE, err, "Failed to request MSI IRQ\n");
>  		return err;
>  	}
>  
> @@ -822,7 +823,7 @@ int xe_irq_install(struct xe_device *xe)
>  
>  	err = pci_alloc_irq_vectors(pdev, nvec, nvec, irq_flags);
>  	if (err < 0) {
> -		drm_err(&xe->drm, "Failed to allocate IRQ vectors: %d\n", err);
> +		xe_log_err(xe, PROBE, err, "Failed to allocate IRQ vectors\n");
>  		return err;
>  	}
>  
> @@ -891,7 +892,7 @@ static int xe_irq_msix_init(struct xe_device *xe)
>  		return 0;  /* MSI */
>  
>  	if (nvec < 0) {
> -		drm_err(&xe->drm, "Failed getting MSI-X vectors count: %d\n", nvec);
> +		xe_log_err(xe, PROBE, nvec, "Failed getting MSI-X vectors count\n");

maybe we should have IRQ component with SIGID_SW and use it here?

>  		return nvec;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
> index 7fa18dfcb5a2..bcf36a381424 100644
> --- a/drivers/gpu/drm/xe/xe_mmio.c
> +++ b/drivers/gpu/drm/xe/xe_mmio.c
> @@ -15,6 +15,7 @@
>  #include "regs/xe_bars.h"
>  #include "xe_device.h"
>  #include "xe_gt_sriov_vf.h"
> +#include "xe_log.h"
>  #include "xe_printk.h"
>  #include "xe_sriov.h"
>  #include "xe_tile_printk.h"
> @@ -105,13 +106,13 @@ int xe_mmio_probe_early(struct xe_device *xe)
>  
>  	xe->mmio.regs = pcim_iomap(pdev, GTTMMADR_BAR, 0);
>  	if (!xe->mmio.regs) {
> -		xe_err(xe, "Failed to map GTTMMADR_BAR\n");
> +		xe_log_err(xe, PROBE, -EIO, "Failed to map GTTMMADR_BAR\n");

shouldn't we use REGS component (SIGID_IO_BUS) here?

and this is a FATAL error, no?

>  		return -EIO;
>  	}
>  
>  	xe->mmio.size = pci_resource_len(pdev, GTTMMADR_BAR);
>  	if (xe->mmio.size < SZ_16M) {
> -		xe_err(xe, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);
> +		xe_log_err(xe, PROBE, -EIO, "GTTMMADR_BAR is too small: %zu\n", xe->mmio.size);

ditto

>  		return -EIO;
>  	}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pat.c b/drivers/gpu/drm/xe/xe_pat.c
> index a5fe1beec652..aad15a4b0ac3 100644
> --- a/drivers/gpu/drm/xe/xe_pat.c
> +++ b/drivers/gpu/drm/xe/xe_pat.c
> @@ -16,6 +16,7 @@
>  #include "xe_force_wake.h"
>  #include "xe_gt.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_wa.h"
> @@ -686,8 +687,9 @@ void xe_pat_init_early(struct xe_device *xe)
>  		 * raise an error rather than trying to silently inherit the
>  		 * most recent platform's behavior.
>  		 */
> -		drm_err(&xe->drm, "Missing PAT table for platform with graphics version %d.%02d!\n",
> -			GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);
> +		xe_log_err(xe, PROBE, -ENODEV,
> +			   "Missing PAT table for platform with graphics version %d.%02d!\n",
> +			   GRAPHICS_VER(xe), GRAPHICS_VERx100(xe) % 100);

this here is pure SW gap and it is broken as right after
logging this error we might crash in the xe_assert() below
or later in xe_pat_init() as xe->pat.ops is NULL

maybe instead of blindly adding xe_log_err we can just
fix that first and return some error to abort the probe?

also maybe we should add PAT component (with SIGID_IO_BUS?) 

>  	}
>  
>  	xe_assert(xe, xe->pat.ops->dump);
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 36d62927b969..3c452f399e6d 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -25,6 +25,7 @@
>  #include "xe_gt_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_guc.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_module.h"
>  #include "xe_pci_error.h"
> @@ -718,8 +719,9 @@ static int handle_gmdid(struct xe_device *xe,
>  
>  	*graphics_ip = find_graphics_ip(ver);
>  	if (!*graphics_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown graphics version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, PROBE, -ENODEV,
> +			   "Hardware reports unknown graphics version %u.%02u\n",
> +			   ver / 100, ver % 100);

maybe use REGS component here (SIGID_IO_BUS)

also, isn't that actually broken?
with graphics_ip = NULL set here we will crash later in xe_info_init()
>  	}
>  
>  	ret = read_gmdid(xe, GMDID_MEDIA, &ver, media_revid);
> @@ -732,8 +734,9 @@ static int handle_gmdid(struct xe_device *xe,
>  
>  	*media_ip = find_media_ip(ver);
>  	if (!*media_ip) {
> -		drm_err(&xe->drm, "Hardware reports unknown media version %u.%02u\n",
> -			ver / 100, ver % 100);
> +		xe_log_err(xe, PROBE, -ENODEV,
> +			   "Hardware reports unknown media version %u.%02u\n",
> +			   ver / 100, ver % 100);
>  	}
>  
>  	return 0;
> @@ -1088,7 +1091,8 @@ static int xe_info_init(struct xe_device *xe,
>  		 * required for VRAM management).
>  		 */
>  		if (!tile->primary_gt) {
> -			drm_err(&xe->drm, "Cannot probe device with without a primary GT\n");
> +			xe_log_err_fatal(xe, PROBE, -ENODEV,
> +					 "Cannot probe device without a primary GT\n");
>  			return -ENODEV;
>  		}
>  
> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
> index ccc3bdeed6bb..c492737242d3 100644
> --- a/drivers/gpu/drm/xe/xe_pcode.c
> +++ b/drivers/gpu/drm/xe/xe_pcode.c
> @@ -14,6 +14,7 @@
>  #include "regs/xe_pmt.h"
>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_pcode_api.h"
>  #include "xe_pm.h"
> @@ -320,8 +321,8 @@ int xe_pcode_ready(struct xe_device *xe, bool locked)
>  		mutex_unlock(&tile->pcode.lock);
>  
>  	if (ret)
> -		drm_err(&xe->drm,
> -			"PCODE initialization timedout after: 3 min\n");
> +		xe_log_err(xe, PCODE, -ret,
> +			   "PCODE initialization timedout after: 3 min\n");

drop "PCODE" prefix
and move to separate patch

>  
>  	return ret;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
> index 23eb7edbdd57..dada430d7ed5 100644
> --- a/drivers/gpu/drm/xe/xe_vram.c
> +++ b/drivers/gpu/drm/xe/xe_vram.c
> @@ -17,6 +17,7 @@
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_mcr.h"
> +#include "xe_log.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
>  #include "xe_tile_sriov_vf.h"
> @@ -43,7 +44,7 @@ static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  
>  	if (!resource_is_valid(pdev, LMEM_BAR)) {
> -		drm_err(&xe->drm, "pci resource is not valid\n");
> +		xe_log_err(xe, PROBE, -ENXIO, "pci resource is not valid\n");

shouldn't we use REGS here ? (SIGID_IO_BUS)
or add VRAM component (also SIGID_IO_BUS?)

>  		return -ENXIO;
>  	}
>  
> @@ -237,7 +238,7 @@ static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
>  	vram->io_size = min_t(u64, usable_size, remain_io_size);
>  
>  	if (!vram->io_size) {
> -		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
> +		xe_log_err(xe, PROBE, -ENODEV, "Tile without any CPU visible VRAM. Aborting.\n");

we should first fix the vram_region_init() as now it is used
in two scenarios: to init each tile region, and to init device
level region info

and this error is meaningful for tile-based usage, where
we should use tile as a location

>  		return -ENODEV;
>  	}
>  

