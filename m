Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F43C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  2 May 2024 01:16:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565B210E42F;
	Thu,  2 May 2024 01:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZVPAmjjN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6512D10E42F
 for <Intel-Xe@lists.freedesktop.org>; Thu,  2 May 2024 01:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714612610; x=1746148610;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yEAmeBoJv5nVnMwpDFcODn0OAPmYvd0OLT4tqPfTe6M=;
 b=ZVPAmjjNIKIy7ZPHm04clOZ902yOJVdicC2hOA3TMRvrEMF8PhUyOK7Q
 17s05b8xcAkKVlrT6UhytDX0693tOCu1ViTy4ETR4+JwmrDtBRcBxy3+f
 pemLyi2g2CoPnLZ5SIWu8x4PMxNYMiNHZ9TF6W1GhQ7+nwcDFhm8CnH0k
 R6HExBy4zIxQ6RCwoBbWkiJuliPHa0HYjXhEGgtbcmxc0ofOTARSs2IJu
 MhsNz8QjHiTCigeUmVW2P1zBsjmM5PGIml8vGKdjkFeGdxcuTNAxA7LCO
 uvkrivpegvaXMzbfma/gBMPkIIjDYt46wvq0WPWMXUim7VnhWmsqS9uU/ g==;
X-CSE-ConnectionGUID: kLRthm71R9O9Y9a42ggYag==
X-CSE-MsgGUID: Gww1a9eCQCizBP893jYAIA==
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="27849058"
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="27849058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 May 2024 18:16:49 -0700
X-CSE-ConnectionGUID: msJlZGUhRw+pwhHp80L9Fg==
X-CSE-MsgGUID: gKmxauYcSnW37CtCqWTFRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,246,1708416000"; d="scan'208";a="31769519"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 01 May 2024 18:16:48 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 1 May 2024 18:16:48 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 1 May 2024 18:16:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 1 May 2024 18:16:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KPViO9UBcYZHl7GLi0d5P2mVHAh/D0iJTR4R8zIsVsAZK6m04fmh+WuR8hHBiefmUx9Wq222vPPuwVxgND7zeY76qv+Ll+eFKFyo9E0ypIFQ6ZLpdor/6AutKrQWVDl+TWLYdAXHutBB9URZcQ1+TDznUFwLMavaMQrF/avy/Aw5RlGyixm52bbbSBPPjkNhzo+J6KDlrkK+xgcNaU4v4+WRwk01Ch2lM+/YLbou0EbKD+ntyEpulkmU9MhqkaxlpEavbvou3SKVnDvTDNjtiqkJuoi9lauoZyGZR1bXycizXJMfVbVHor1BF9oWM/kKKQKSnCWZ3v8RrgzZTIYUEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5Mbv2JrplglmAyO1QTlhddR4mNLqfBrPsHmul6qGqI=;
 b=hjncAtxEDrBbTXziPVpWNW2xIV/MRHhug4GPtM6HHC/NcPkzV5pZqKcvgNTAAa4cU2KGDpYB8ZWR9xtPsZHS/VjIkXQbUFKWFFxrylX015mjx1TlJqxbmrhTtW+UDZzAHim1XXTk6msW4tHa0+wTkum+NscwwUJUvvXbb6E4Km1Lu7oc2IB15qBd5gO9petVS7Wodp6umBv4Sh2NOPPih8+TSCJFTofyfXEFlQTKEqZY/sY1AQ+brmqYd3OYBlBs5VifxBKNpQPC2D23M/d2ree5iPIYm0DT0o13nTNXosMDjfbCn/SZ3hyDPTQxgmrjlMUKxC88TzLc3Kj20Pfo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by PH0PR11MB7448.namprd11.prod.outlook.com (2603:10b6:510:26c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.20; Thu, 2 May
 2024 01:16:43 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.7544.023; Thu, 2 May 2024
 01:16:43 +0000
Message-ID: <f44301a1-ccd7-44a2-85ae-bd089c889bdc@intel.com>
Date: Wed, 1 May 2024 18:16:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Improve robustness of GuC log dumping to dmesg
To: Matthew Brost <matthew.brost@intel.com>
CC: <Intel-Xe@lists.freedesktop.org>
References: <20240430233436.2838165-1-John.C.Harrison@Intel.com>
 <ZjGCYRp7J0/b1MiW@DUT025-TGLU.fm.intel.com>
 <5c8854a4-24f6-4106-9ccf-8764e1041580@intel.com>
 <ZjGoQ/B7abA9v93/@DUT025-TGLU.fm.intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <ZjGoQ/B7abA9v93/@DUT025-TGLU.fm.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:a03:333::15) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|PH0PR11MB7448:EE_
X-MS-Office365-Filtering-Correlation-Id: 1417d807-a4c0-44bc-4f65-08dc6a458722
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|376005|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Lzc0OEQ5dlNMTXU0UXdEamtDb2UwREhRc2Y4YUlPTUE2enlDckYvQW1IM0Nh?=
 =?utf-8?B?Tkp4dlh4OWZybUxaS2ZVWU90YlVOQzhUYlA2N0x5amxtN2tNcGZxdmtBVWo5?=
 =?utf-8?B?dWNqSWlEei9ic2RPbHBMSm9USkhrckNoTlJNcitFK01OUElkNDlMWkZlTjc0?=
 =?utf-8?B?VFpNTnBSWjI4Ny80S0IxQ1pKdjNrczIrb25hek5tY0VueWV1b0txamNNUFVh?=
 =?utf-8?B?Vnc4QVQ5dUsrTnBZdEZ0dnJIUEVRS21aUTE2MVdPZXJ1Rm05OGNkOXlRSnJN?=
 =?utf-8?B?Q0ROcUwrb1V3MmFVMzZFeU9IRTlqTTAyd2gvWDh3RURCOEFqWVB0Mm9ETEVQ?=
 =?utf-8?B?S0RRZnBpMUlZTkkrc0FzT2p6VzZ4bkVjbnlKWUI0bDRuQWZMVEJMeFR0OXlQ?=
 =?utf-8?B?NDdnSnB4KzMzb08vNGI5SXdJY2Rob083TVc2NUNIeGRVL042eHV0ZXFnNG1S?=
 =?utf-8?B?c1c0TWpFNjVqT1lmT0pEc1lyR21ZWnNWYStOWEcyYjZuNitvKzJISk55WjRZ?=
 =?utf-8?B?cWJUSEFvUjN3M09FcVdhaGhENjNRaUdkZHV5TU9CN0U2NlNPZDB6NkF4Uk1y?=
 =?utf-8?B?ZlBYbkhpSzdXVTBLL1VoSVhYdGY0cGc5RGpubEY4OWoxcXJSQVZpdVkwTDZY?=
 =?utf-8?B?OUt0VVRXSlFqSVIzN2hoU0ZER1VjYjV3NElhSndlalpOaVdreUZISmlHS2cz?=
 =?utf-8?B?b0tPaEhaYmFhUkMwb0NwOE1uaXdEMXdBcEtsY2RjZ0ZOdEFhcmVzTFBDV05s?=
 =?utf-8?B?NnNwQmNnY0xHTXB0Z3lKaCtMdFpVRHBLNXV5elJ2eDNIZEN1WFlpS3NTcVhs?=
 =?utf-8?B?V0pRVEhzRDVkUjAyb2tKeHFNME11VGtxVzR4cmFEamhtd29OeU02cFMyMExQ?=
 =?utf-8?B?eEthTDNpVGVKWjdmV0VwZjhrVVNYUXBpTU4xL2FHZG5XeUIrUGlkUVR6WnRZ?=
 =?utf-8?B?QWNRdDJUbFpOb1hoeG8wRjBoUlhwdW5wcnB5S3lvRmw3aHB3MHpYYVdoRzY4?=
 =?utf-8?B?eVRYUFdKU3Awc0ZCSURkdHpmRU1Pd0ZOcHFYN0NVaXphemlZMXRvdXBIc3VR?=
 =?utf-8?B?YURObU94aTRuMFFuZUQ3YUpsSUx3b1U3ZjJxRWpzUFVQK2xmMFUzZ3MvSnlk?=
 =?utf-8?B?N1ozYWhEemZYZWhHVDBzb3c5NmZNcjc1SlBQNFg1aXUxbi9PYTUwdXk4a25j?=
 =?utf-8?B?QUkrM1Q5TWhhN0gxaWoxTEY2N214eGRSeGg1WVZGa09tRWRQWGh1Q0thRVFY?=
 =?utf-8?B?UU9jVytxcWZLdFdOcHdyVGpYbEE1M1BJekJpeU4rL3o3QkFIK1A5RXg3ODd5?=
 =?utf-8?B?MTlnT1I4THAvN3lPeXM3SG1mZXpsNjBsQlNzRitPTTh5SXJqMGxVdzNzRFZQ?=
 =?utf-8?B?UVo0VWRWSlVsK1RSWkpENXc5cWhjN1IyU2hsaGRMYjlrRUdSSzEzUlBEUUhs?=
 =?utf-8?B?eElYZGdFZGdzczRmZ1ZzcEJNOEw4U3J3Mk1MOWw4OW1tTElXNktaUlNabzRL?=
 =?utf-8?B?L0paSjNUdkw0Q2V3THJFRW9xOVp4aG9yODljR3krYUNBWi9aU0xJTUI0V0o3?=
 =?utf-8?B?T2x2Umt6VmQ3clV3VlJjLzZhQWhuSTFFSDVXT3h5bW1HU01vdDJRMy9lckdZ?=
 =?utf-8?B?eUd1RmFvV3R0azFUU1J2SldGYm9Hcy8yalZNaVVMdUUrNzJwRnhLTEZjOEIw?=
 =?utf-8?B?ZUdycFlYNkdUR3BiLzFPMS9PcGtXc3paSXQ2a2I0UUpWdzRVdVJUUmNnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?STgwa242STZMVEFwajZUMW45MTd6ZzFIb2QveTc4ajhDL1Q1UG9yeXE3bWNF?=
 =?utf-8?B?WE40SUMwaWJId1hzellIN3Yvb2lZeTVFc01TTTNMME1ubEtXL0hwc2JMeHVZ?=
 =?utf-8?B?R2pJbFVNeFd4Z3VXcnRvNDZrNG9kRE96UXpNc1QwTGtXNk5vY1E4Qk5PcWhs?=
 =?utf-8?B?alhwTDM1cUJzZUhtNXpJaURibnkwYWJ1UzlQRGNWS2NWK1o2Y1ozSWMxVW5H?=
 =?utf-8?B?Yk1tTlBmMExobEdyYURNUDFKRFdTd0FVclhzdUUzNXl2TUlET2ZvSnJXeEE1?=
 =?utf-8?B?a1ZzZXN4UzltMnVha3hIUVptbzZKa3dTMndVelhFSlJteHRyVkRrR25POTlz?=
 =?utf-8?B?THEvbVppWU1NL1hOZUpodmhualJDMCtMaUtYQVAxQ2NoMHduOC91R3pmemFi?=
 =?utf-8?B?bGRMRUlWNW0yYU5hRktiV3J4V3ZqTU9UenFkNGl4ZWhPN2lJTEFvcGYwZGFp?=
 =?utf-8?B?REdIcE1PdmhwSGd6dXFMdEZxT1M3UmVYWWswL3U4TXVxVkVkMDZUOTFhc1hl?=
 =?utf-8?B?WWpmQ3F1WXVPS3I2Z2xBOUV6UWxjSTdzakNuZGJnelROTmp0SVhlYXljVlBO?=
 =?utf-8?B?RFg5V0ZHY0VlOVJsQ1YxajNZMkYwTTlSTnROVmtUSkJNNnhiWHA1RFZBRGNP?=
 =?utf-8?B?Qmd3TWJtM3hHa0luaXJ0MUZPV01XNWFTcHMyQ1FheC9kbTZHOEtDaVMxUDVZ?=
 =?utf-8?B?WmdmSGtOd1RVUlhIVzIzSHVkZkMxYlpvOVdpYzdSN0JvbFBmUU5SNVBkREMv?=
 =?utf-8?B?Q2JnRVZ3V1RWTmxBSlNFT3Jhc29XbVMxajBqYVlFbTJ3TXlpc01DMGtWZkJ3?=
 =?utf-8?B?RWZrRHZwaUFlWGxkZm9xWDd5ejIyOFl6UmFTaEF6dHdNZy9tTUUvN3lTcXBk?=
 =?utf-8?B?bHlLZ0dZTE9IZnV5Qis5SkQ4cXA2ZVErTmdnMHFtbmtyckpkcVpuUG1nYVlt?=
 =?utf-8?B?Q3drZUQ2RHN3NHhSOFNrWVNZR21WSTIrOElZdW9FUnFGZ0wxbGpNYXZkYjlU?=
 =?utf-8?B?Q0dNc3J0Vm1zcmJjdFcxYWpzdm9jZFc0OHBCN04veEhHaHpLWWlpZDF1bXpV?=
 =?utf-8?B?djZOSzI5VXUxbWd1ZGRGZ2oxeWV4dEF0L0IzM29FM283Q3JFT2xkS2tUSURv?=
 =?utf-8?B?Zy9kcFU0NHlQTEt5L3cxdHdTYm53N2JReTFMRDRPejV6RndDaWwxSklvZkNi?=
 =?utf-8?B?a2JUdW1TMkVWNVNQaVR3NzRTRzFDS0ZENEdPSUdZWlpXaUptdnc1cW5HQ0VU?=
 =?utf-8?B?UzZhZjl1VzU5SHBtNVRhVUhGcjRLUmI2MXZGMXBOM3IxQ2tMeDM4ckthajFW?=
 =?utf-8?B?d0lDTEZ2UEtFaGZyRWl2bzVnQjBCNENhTm5UR3RUSWFDRFg3cnROa3VCRVRa?=
 =?utf-8?B?eHUzYlFQMjQ4cXFHRlVFWEs3RDVEK0FRNENKODFnZGNhTTNDSy9CWks1V0xZ?=
 =?utf-8?B?TlQvUVBLdld5NzZPMzJtQzRUQWYxTFdYTWpiUm5hR1FnbzVzWlVubk5DbDRL?=
 =?utf-8?B?d2RkWFZzV3MrZGlzZ2RhbjRjcHFrUmVQd1ZIeW9HWW5YUWlxMGJZcU5ibnl3?=
 =?utf-8?B?eTQwVmYyZ3c4VnczcEZQWlJzRHFSMDNnb1o5c3NZSGlhZFZUVEtIRXQrcGUr?=
 =?utf-8?B?ak5saXFPUFJvdGQ1YTFYUFh1bUVXUzdRYk9XY2VLeHVkODAyamFic0VwUDhX?=
 =?utf-8?B?NHVuaVh0c1ZkWTFZRVNqTTVaUFNoMDFVWHRnY1h2MDZNUXB1WVVyWEliWXpZ?=
 =?utf-8?B?TzhBbis2b0xZRzRROFRsUFZRdEh4eFdKWjR6NDBIOE95bmp3ZVVYZ2E5TWEw?=
 =?utf-8?B?eEZDeHdmMXdwN3hKTjBueTEyTytjWG84TlpieU5VaWJrcFg0YjMwam9sUGtm?=
 =?utf-8?B?VlU3ZlV0ckJjMlhUOE5COWlrSmFBM2U0WXFNUzJEc2FtUklDaXRCVFZMSm4r?=
 =?utf-8?B?Rjg2R2dvV2VLMUw1bVZKY0QzLzlYNXRwNUd4QTNUdnMvRkVMcXViMFdLM2VG?=
 =?utf-8?B?aXhpVGVSQmhzTi9ObmhEd2wyTXgyZlNxNk1tOTFsakF0TWlxZHlkUFl0RTN4?=
 =?utf-8?B?Y2dmWFFJOVpXaW1NbDJrZjRnTk8zdE1WL0NSTTNGT3ZnZVQydzRvY3V4TkU0?=
 =?utf-8?B?bC8zTU1IZ2VOSDRwV2dnQlA5RW4vRFRSWG9Mc2RoK0hMVi9KWTdXdk91akZ0?=
 =?utf-8?B?c2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1417d807-a4c0-44bc-4f65-08dc6a458722
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 May 2024 01:16:43.3600 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TT4EoUZxTNxTqALPYeu9g2UkC3DQIyn6rBWVL8Qq0Hu6J6SZQ4pM3u42hhtQxHV/kdxHLHa2mD2hdKRdnUQQNWs/wJAc9zhNVtFPUe2cdrI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7448
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

On 4/30/2024 19:26, Matthew Brost wrote:
> On Tue, Apr 30, 2024 at 04:56:49PM -0700, John Harrison wrote:
>> On 4/30/2024 16:44, Matthew Brost wrote:
>>> On Tue, Apr 30, 2024 at 04:34:36PM -0700, John.C.Harrison@Intel.com wrote:
>>>> From: John Harrison <John.C.Harrison@Intel.com>
>>>>
>>>> There is a debug mechanism for dumping the GuC log as an ASCII hex
>>>> stream via dmesg. This is extremely useful for situations where it is
>>>> not possibe to query the log from debugfs (self tests, bugs that cause
>>>> the driver to fail to load, system hangs, etc.). However, dumping via
>>>> dmesg is not the most reliable. The dmesg buffer is limited in size,
>>>> can be rate limited and a simple hex stream is hard to parse by tools.
>>>>
>>>> So add extra information to the dump to make it more robust and
>>>> parsable. This includes adding start and end tags to delimit the dump,
>>>> using longer lines to reduce the per line overhead, adding a rolling
>>>> count to check for missing lines and interleaved concurrent dumps and
>>>> adding other important information such as the GuC version number and
>>>> timestamp offset.
>>>>
>>>> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/regs/xe_guc_regs.h |  1 +
>>>>    drivers/gpu/drm/xe/xe_guc_log.c       | 78 ++++++++++++++++++++++-----
>>>>    2 files changed, 66 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/regs/xe_guc_regs.h b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> index 11682e675e0f..45fb3707fabe 100644
>>>> --- a/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> +++ b/drivers/gpu/drm/xe/regs/xe_guc_regs.h
>>>> @@ -82,6 +82,7 @@
>>>>    #define   HUC_LOADING_AGENT_GUC			REG_BIT(1)
>>>>    #define   GUC_WOPCM_OFFSET_VALID		REG_BIT(0)
>>>>    #define GUC_MAX_IDLE_COUNT			XE_REG(0xc3e4)
>>>> +#define GUC_PMTIMESTAMP				XE_REG(0xc3e8)
>>>>    #define GUC_SEND_INTERRUPT			XE_REG(0xc4c8)
>>>>    #define   GUC_SEND_TRIGGER			REG_BIT(0)
>>>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> index a37ee3419428..ea269efd9c21 100644
>>>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>>>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>>>> @@ -7,10 +7,19 @@
>>>>    #include <drm/drm_managed.h>
>>>> +#include "regs/xe_guc_regs.h"
>>>>    #include "xe_bo.h"
>>>>    #include "xe_gt.h"
>>>>    #include "xe_map.h"
>>>> +#include "xe_mmio.h"
>>>>    #include "xe_module.h"
>>>> +#include "xe_pm.h"
>>>> +
>>>> +static struct xe_guc *
>>>> +log_to_guc(struct xe_guc_log *log)
>>>> +{
>>>> +	return container_of(log, struct xe_guc, log);
>>>> +}
>>>>    static struct xe_gt *
>>>>    log_to_gt(struct xe_guc_log *log)
>>>> @@ -49,32 +58,75 @@ static size_t guc_log_size(void)
>>>>    		CAPTURE_BUFFER_SIZE;
>>>>    }
>>>> +#define BYTES_PER_WORD		sizeof(u32)
>>>> +#define WORDS_PER_DUMP		8
>>>> +#define DUMPS_PER_LINE		4
>>>> +#define LINES_PER_READ		4
>>>> +#define WORDS_PER_READ		(WORDS_PER_DUMP * DUMPS_PER_LINE * LINES_PER_READ)
>>>> +
>>>>    void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>>>>    {
>>>> +	static int g_count;
>>>> +	struct xe_uc_fw_version *ver = &log_to_guc(log)->fw.versions.found[XE_UC_FW_VER_RELEASE];
>>>>    	struct xe_device *xe = log_to_xe(log);
>>>>    	size_t size;
>>>> -	int i, j;
>>>> +	char line_buff[DUMPS_PER_LINE * WORDS_PER_DUMP * 9 + 1];
>>>> +	int l_count = g_count++;
>>>> +	int line = 0;
>>>> +	int i, j, k;
>>>> +	u64 ktime;
>>>> +	u32 stamp;
>>>>    	xe_assert(xe, log->bo);
>>>>    	size = log->bo->size;
>>>> -#define DW_PER_READ		128
>>>> -	xe_assert(xe, !(size % (DW_PER_READ * sizeof(u32))));
>>>> -	for (i = 0; i < size / sizeof(u32); i += DW_PER_READ) {
>>>> -		u32 read[DW_PER_READ];
>>>> +	drm_printf(p, "[Capture/%d.%d] Dumping GuC log for %ps...\n",
>>>> +		   l_count, line++, __builtin_return_address(0));
>>>> +
>>>> +	drm_printf(p, "[Capture/%d.%d] GuC version %u.%u.%u\n",
>>>> +		   l_count, line++, ver->major, ver->minor, ver->patch);
>>>> +
>>>> +	ktime = ktime_get_boottime_ns();
>>>> +	drm_printf(p, "[Capture/%d.%d] Kernel timestamp: 0x%08llX [%llu]\n",
>>>> +		   l_count, line++, ktime, ktime);
>>>> -		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * sizeof(u32),
>>>> -				   DW_PER_READ * sizeof(u32));
>>>> -#define DW_PER_PRINT		4
>>>> -		for (j = 0; j < DW_PER_READ / DW_PER_PRINT; ++j) {
>>>> -			u32 *print = read + j * DW_PER_PRINT;
>>>> +	xe_pm_runtime_get(xe);
>>>> +	stamp = xe_mmio_read32(log_to_gt(log), GUC_PMTIMESTAMP);
>>>> +	xe_pm_runtime_put(xe);
>>> Just a quick drive by comment, fine grained PM control like this frowned
>>> upon in Xe or maybe even not allowed. Rodrigo / Matt Auld would would be
>>> the experts here.
>>>
>>> Presumbly all the callers should already have a PM ref.
>> It wasn't clear that this would be the case.
>>
>> And the whole pm_runtime interface is exceedingly confusing. _get calls
>> get_noresume then does a task ownership test and calls resume,
>> _resume_and_get does exactly the same but in a different order, plus there
>> is _get_if_active and _get_if_in_use. Plus _get_ioctl which is for calling
>> *before* making an IOCTL (where an IOCTL is a call from the user into the
>> kernel!). And none of these have any documentation beyond a single sentence
>> that is simply re-writing the function name with with prepositions added.
>>
>> So I am unsurprised if this is not the correct way to do it but I have no
>> idea what would be the correct method.
>>
> There is a little documentation, from a xe_pm.c:
>
>   60  * Also, Xe PM provides get and put functions that Xe driver will use to
>   61  * indicate activity. In order to avoid locking complications with the memory
>   62  * management, whenever possible, these get and put functions needs to be called
>   63  * from the higher/outer levels.
>   64  * The main cases that need to be protected from the outer levels are: IOCTL,
>   65  * sysfs, debugfs, dma-buf sharing, GPU execution.
>
> Also the functions appear to have kernel doc too. Agree it could use a
> little improvement.
I did actually say that. But I also said that such is not exactly what 
you might call useful. E.g.:

  * xe_pm_runtime_get - Get a runtime_pm reference and resume synchronously
vs
  * xe_pm_runtime_resume_and_get - Resume, then get a runtime_pm ref if 
awake.

"Get and resume" or "resume then get" - presumably there is some super 
important distinction otherwise why are there two functions? But they 
sound pretty identical to me. Even reading the code itself tells me 
nothing more about why one should use one version over the other or when.

However, from what you are saying, it sounds like I can just remove all 
mention of pm get/put/assert calls and just rely on the higher levels 
doing the acquire and the lower levels doing the assert.

John.


>
> I don't think the work on PM is completely done either, but the general
> rule is PM refs are taken at outer most functions per the doc above.
>
> So if this function could be called during driver load, a GT reset,
> debugfs, or a self test those are the places where PM ref would be
> taken. With this, most parts of driver should never have to take a PM
> ref a fined grained level like this. Again Rodrigo is the expert here
> if you want more details. Or he can correct me if I'm wrong about
> something :)
>
>>>> +	drm_printf(p, "[Capture/%d.%d] GuC timestamp: 0x%08X [%u]\n",
>>>> +		   l_count, line++, stamp, stamp);
>>>> -			drm_printf(p, "0x%08x 0x%08x 0x%08x 0x%08x\n",
>>>> -				   *(print + 0), *(print + 1),
>>>> -				   *(print + 2), *(print + 3));
>>>> +	drm_printf(p, "[Capture/%d.%d] CS timestamp frequency: %u Hz\n",
>>>> +		   l_count, line++, log_to_gt(log)->info.reference_clock);
>>>> +
>>>> +	xe_assert(xe, !(size % (WORDS_PER_READ * BYTES_PER_WORD)));
>>>> +	for (i = 0; i < size / BYTES_PER_WORD; i += WORDS_PER_READ) {
>>>> +		u32 read[WORDS_PER_READ];
>>>> +
>>>> +		xe_map_memcpy_from(xe, read, &log->bo->vmap, i * BYTES_PER_WORD,
>>>> +				   WORDS_PER_READ * BYTES_PER_WORD);
>>>> +
>>> Also I think the above pukes without a PM ref too.
>> If that is the case, should there not have been an assert about having a PM
>> reference at the start of the function?
>>
> Any MMIO or memory access has that assert. Adding it in every function
> that touches MMIO or memory is a bit redunant.
>
>> Although I don't see why a PM reference would be required to read from
>> system memory on an integrated part? Maybe for a discrete part. But I would
> It might not be... but in Xe we enforce that all MMIO and memory access
> (at least memory access through xe_map.h) has a PM ref. That design
> makes sense to me rather than special casing sram vs. vram. This also
> aligns with coarser grainer PM control.
>
>> assume that having a vmap in existence would mean the memory is locked and
>> accessible. Either that, or a vmap is only allowed to be used by accessor
>> functions which themselves do whatever is required to make the access work.
>>
> We pin memory that has a vmap so it is not moving. A vmap ultimately just
> resolves to pointer too. On PM suspend / resume we restore to same
> physical location too so I don't think we ever unmap / remap it either.
> I could be mistaken about this, haven't look at that in a while.
>
> Matt
>
>> John.
>>
>>> Matt
>>>
>>>> +		for (j = 0; j < WORDS_PER_READ; ) {
>>>> +			u32 done = 0;
>>>> +
>>>> +			for (k = 0; k < DUMPS_PER_LINE; k++) {
>>>> +				line_buff[done++] = ' ';
>>>> +				done += hex_dump_to_buffer(read + j,
>>>> +							   sizeof(*read) * (WORDS_PER_READ - j),
>>>> +							   WORDS_PER_DUMP * BYTES_PER_WORD,
>>>> +							   BYTES_PER_WORD,
>>>> +							   line_buff + done,
>>>> +							   sizeof(line_buff) - done,
>>>> +							   false);
>>>> +				j += WORDS_PER_DUMP;
>>>> +			}
>>>> +
>>>> +			drm_printf(p, "[Capture/%d.%d]%s\n", l_count, line++, line_buff);
>>>>    		}
>>>>    	}
>>>> +
>>>> +	drm_printf(p, "[Capture/%d.%d] Done.\n", l_count, line++);
>>>>    }
>>>>    int xe_guc_log_init(struct xe_guc_log *log)
>>>> -- 
>>>> 2.43.2
>>>>

