Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07E1606A31C
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fBSq0Mxn;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=TKz2kREE
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF25D10E2C4;
	Fri, 27 Nov 2026 05:55:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 745EA10E9A5;
 Fri, 27 Nov 2026 05:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795758918; x=1827294918;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=4C63wOl/+unR9R+5XrpnAZcrTBMMTAezBLRfP3FDF9s=;
 b=fBSq0MxnRCKqQSCmMjiHJcbRM7QXZjv+cgzxMzXn+Xm87qzL4wvag51/
 RxK51n78RFLmawNm/oRjU0qCA1zW8WWebxQbzb7QdkfArvNT2AO33uj4s
 y6Pcip0Ve3vUqNQ0RAWDVPRTg22IXxRJ0S1EA9j1ZSfcjwkCIMIYycTbm
 ieJZ1mPu4DZ1cK6d6/Iq/740dSUw0QfjwUFBS6Qt1wDCKB8MsfZpopro8
 Lyxtj39PTzMiwj/V/LWOfIafuJHIAN22pfXqfGuCwhdJlPWuF0MIYBPvt
 9wrCAFUMDATVl/gIlE4nHpCpJKNWexI+IvJG+hblX6EV9Yaxvq5h2Txq2 A==;
X-CSE-ConnectionGUID: vliESQOdS4uxf/hRBi/Qqg==
X-CSE-MsgGUID: zbNnSGLGROqApn0XL8kKcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4672347"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4672347"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:55:17 -0800
X-CSE-ConnectionGUID: Bb6tYADzRGevLzg3QaPcPw==
X-CSE-MsgGUID: iQbQtdznSlSkyBWngZocJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12355743"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 21:55:17 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:55:16 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 21:55:16 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.12) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 21:55:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aXMGgpdzxc2iiKSwsPbzdSABnpjdpgKGvoG8VMoNbwCxcHdYAfUN2P0nD++MKWKQd0P111TCJoSA923ZAzZ40fHndMBL0Wa5LY3MM4u9vN5r54k7IBqqrrZH3mheZtL0xGM/YpxkybExplIhENRvXAammpgxRVSw3y99U5pjitHPvpycFyK8ldqL0LGdUDZjDQ+r7dXg14BrcEFW2qb8YtiQo3oQeXP2nmpS6JUgcoCAWKcqROGTmxI6q0THdPYuxMQRdC6QGXqZHeHMmEaiNVyinRdkvVCLOENIL7GPemCeD7/+YlvA6w/cPMZCEPIGZ1z0DKGP/OCl6dM1C+eHoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tpFRvu9t5tqg7NSIAj32MSWCiAXgSlNp1GMVSg4VSXM=;
 b=uqgtfdvyGHKAgoC7IaClrSxRnBCL+VTEFj45LoEH1bABZtxrUL7+QuUme1rHcqMyNV2ABI6JfD+kh9TH6HoOacPGJFC7oJ4IKqmbE1ctiM1+19/1sJ2OEFoBoUzr6EAX0vZDZl6NvtsYU6GmiYKrDkhphDhRjArgxZP52GJbBqCiTzW55jTxk0J8utGhnoArqZ/l03Db/7pyEgalfhp1AN5bfHMYThe+b0QSc8WM58uSNycqAL3U2mEziQj5yA8kQphXZDLyHrK6CIL+sUod+OJS4sOnQbM4Nc0QrGFMxCZPCXn2+3AGI5hv+vwe+oR7kzLLSNSZO7RIF2mVdI2hLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tpFRvu9t5tqg7NSIAj32MSWCiAXgSlNp1GMVSg4VSXM=;
 b=TKz2kREE1+Sf0NOofpW/yH06/fpMhGCFnq2R65aBJ6IUafcXJtMU4zNTEGsFfci8yajE3XrZizmIeOfcVN+k2z1Js6tcRGbD9DoQ5zk2ayuhlQ3OXmQiy5gGlpuJzSMINClkZlbaIBZMI7E5G1j77V0jJLVnC3veAjMD7KlY/ZI=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA3PR11MB9397.namprd11.prod.outlook.com
 (2603:10b6:208:573::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 05:55:09 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 05:55:09 +0000
Message-ID: <b28435c7-9886-45bc-9051-cad011267c1c@intel.com>
Date: Fri, 27 Nov 2026 11:25:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/13] drm/i915/vrr:
 s/intel_vrr_vblank_start()/vrr_vblank_start()/
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-4-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0054.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b8::17) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA3PR11MB9397:EE_
X-MS-Office365-Filtering-Correlation-Id: f1cdef9b-508f-4d9a-4c89-08df4c4afe84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|10067099003|11063799006|56012099006|4143699003|261009223027099003|261021121427099003|261102123227099003|261021123027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: F6g3DlQm6f2Pw3E4q2NY8fXYG1GIdQZqBF+TzYOmle/zsv64uu1P8RuDHCcY8FCioKcSXjlGES7z1GLCf9P3CX3Ltrlws8y1KtNaNtQgMfKxamt5Bu0nDFpqK7zZ3pZHjaTfCbU87omjEZzS3t7GePGysAR1aqCCsX7jgAM2BRblcvbvD8KZHCLV9G8IymPpc2j2NzAMpnNFVN6NrIk5BQCauyo2ioAMQ+Yv6eqrelhg/mYWgSpV0/PF3fhiz7a5H24gw3EWdDqbA5uuLv2895/JTdgyHa5Y/xhZRk9wN7+DN0ZTyr6n6+IEzj2BBckwbe8jvyMN9XRbnVlQv2UhLshtjnQhKNBNlRQtxcIxmDOc2ZcLrkBAsL+BBjWDUXQwcoM2f7KdHnIOyjkNeEY88BqXJy1GX9HthH8e3A/qnue0Oc2uT0TvRscNImEQS2eCwbDD7OPyYtmG0Tan4S0W6WTnbI2hf3ptI5DXAFpP+MWJ3xvXVUF2HyjO8qG9RzkEEY/Te0tuXbhkLqup6rGxNHEH+AwwW30+kEIX6kiJu11nyFeSWmTUYKfe6Ybj4g9Hz3Umbci7zFqAR7Ub1O0Ybm+DBCD6zO5sqfO2M8g2F8QbmlXL5YOJJVPPFNVXse1d9jj2OKuvkAMrGvsDFL734IyAGAjRulL5YP+vhGHc5aI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(10067099003)(11063799006)(56012099006)(4143699003)(261009223027099003)(261021121427099003)(261102123227099003)(261021123027099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Nzc4c0wvV1M0MkZWdEkwbDNEMlNPVG9RRmh1MXkxdW91ckJtWmk5V0xwYXF4?=
 =?utf-8?B?SXZHU3owRWxGOWZPUFhjR01LeEdEejlUUmU5T3FZeWU1TksxWjFLSU1tckFD?=
 =?utf-8?B?R2JZdlFuQ3lOTEFOckV4aXZvbWdRc290Z3lmNlNGZW5EbEF0Y0pvYTN2SS9X?=
 =?utf-8?B?dDNhVDVMVWZyNXY4R0xmUWo3dmNlSVozdHV6aVJ3RGhmeFpUOTRaOE8vTkxh?=
 =?utf-8?B?eFFyUHNZcHB3QWYrc3p6bU04OTdseFFBMk9Fay9MQ3A5ZVRZcUlIWDJueEVr?=
 =?utf-8?B?ZVhONnU0ZE13NzluMmFEUllkaXRmQVNidlg4QlBSUFJvM2pjNmg0eVhZZmFh?=
 =?utf-8?B?b05BNFpmWmZrMEZhRlpsUjBzNDFPVENndmgzdEl4VmlZRy9XQm9naVJhSTEv?=
 =?utf-8?B?K25ONFN5b1hyVnViVGxGOUJQNnBpbTA3b1E1OUF0a3pheURxYitjMkJiNVE2?=
 =?utf-8?B?MlJjclRFYUpVNnFiU2JCQ3ZPZFRGNEYxQlpEWFg0TjRObUVmYmxBdTR0UXJy?=
 =?utf-8?B?NGo1eTJEZFJwalF2azRDN3ZselhkeDBCU0ZjdVd3cGEyTGlsL29mcEgvMkZT?=
 =?utf-8?B?Nk1CRGt0T1VydjNpTUtWSzBJUGZ0NXhpZzUwbEVwckZKQS9vbzFqQm1od3RU?=
 =?utf-8?B?UlBmWnV0dDVxNzdjSmI3NTdxV2tuR3VweXBNNnBxZU5aa0JLcE9mbVhWSEdl?=
 =?utf-8?B?ejIrK0k3VzMvS05RajJ0cnI2NzNQYWhRSmhsdERYUWRMUExReXF1ODhaWFA5?=
 =?utf-8?B?VGxQWkdsVExDUnhlZitEaDdJR0NMQzBQeUNpRklqcEJ5ZjJBazFkVFJjdDVK?=
 =?utf-8?B?aHFEeFBsd3NyYllnWlBKYzFtOHFGcjl5ekVOOWlaY2R1Wmx3ZFd0N2k0WWJK?=
 =?utf-8?B?SFY1UlJvV3VRUUUxajBBNC9tTG8zamVQaFJ6ZFFQRG5RWWpaU0FadHpTcjE3?=
 =?utf-8?B?L016dFBVQWJDbHZ0eXVsVXFVa3h1c2J2VVNJL1hKcSs4NkRpb0cxcENCMTdK?=
 =?utf-8?B?VzdwbnUyWStNOEQyU0MxcDFHbWFtem80TmlscTUyU0dIbzc4a0E2bHM1SWFR?=
 =?utf-8?B?cDZ5aHhqWjU4VkZkVWFXYjl2YXRpNVBYeDc5WXI1SVRRRDY0MzNRNER5OFg0?=
 =?utf-8?B?TkxnVXlkU1dXRWQ3Mk5DUlNpNndwcmVTTHlRai82RE5mdDZ5NldGRXJjR2M2?=
 =?utf-8?B?UUllb2VZcldlY3VvdHVLR3h5RGR2YlE4TlgyZFBORm5BY2Z2ZW9hekVOQ1Av?=
 =?utf-8?B?T1RhM3NPQy9TckxRWDA5QS9jRjBZVVZZVVhvMUpRVHVhV2grOS9kVTgxSW55?=
 =?utf-8?B?OHRQVVI2RjF6OUxJT2kvTk5EM1JrUmJaYnkxSmVuRVQ4akFaN29MVEtuVzIy?=
 =?utf-8?B?SU9iZ3dkWlgwR294QkdjbzFVSjlIcEJLdG5IU0IwY3YrSWJxVjJBRlplTUd6?=
 =?utf-8?B?TzJFdkRaTUkrdEYzWGl1Q2NPbE03aEhqbkJxbytJL1MyZldtS0VORWRlalk5?=
 =?utf-8?B?OHRPdXJzTmJZTy8za041aDFoQkNXNFpPQmk5SktEWjhwUGhFcUNYOFN0MVJq?=
 =?utf-8?B?Nk94QTloQm1ZaDU2RXBUYW5ZZlpISXU3Q2lSSU5YSDNFaktHV1dlcU9vdk9E?=
 =?utf-8?B?RTA4YkR5Q0ZDdUxKNzhnY0Uzd0NodGlIOHA5RThvYlBab2xHaWdIcnZFSzhh?=
 =?utf-8?B?VXJNdjFaWURvS3kvaFBUV0U2SEtkeW1nRHloVUFTaGEva2lqTHRPcjhCVDlB?=
 =?utf-8?B?c015ZVlMVGVSVXA3S04rdXJRUFN6T0NTeUxzZjBPTXBvR1c3Y1QyZ0ZMYlZp?=
 =?utf-8?B?bDBtMlFqUTJvZ25XdTZCa0FkYllBYVJiMjFuOGRtZktZRXdvU0x4SmdNU0Mv?=
 =?utf-8?B?STZwSGorKzMyelNFZllmdE9mRDlqV1BtbUdLWEpuQURiZ01mOVp5a1dlcHhl?=
 =?utf-8?B?OElhdnp0QTRndm1SYks4RmpRdisyTnU0c29oZ0VabFRVd2NYdG1WRGdnb1Q2?=
 =?utf-8?B?TENEbTVkdzUwYmhGUDl0a1JiZjZ2bmhRWitQZGJKSGFUQ1A0TFF3R3c0cHVn?=
 =?utf-8?B?OXhYNXBRM1hxdWZuRjhNdm9ZMmh0UlozS0ZJSlZrYTZPeEl6REVnUTJ3VStn?=
 =?utf-8?B?WnpqRzJFeWRKWDNTYlBkSFZQLzRqVlZhaWJ6YTBSSHJ6dTFwNXFBSGJkNEFB?=
 =?utf-8?B?WHlJZXpOQzk3b0tpWmxHRnNQWlVxeGlzd29uSzNhQ3FMSWJXSlUyZjMxaWVs?=
 =?utf-8?B?elhaM1RZNm9kOU9VL0tGRDJtekJCMEZ5aU5RaTcyMzlna3J1c3VBSlU1N3JT?=
 =?utf-8?B?QzVCNTE4SG1mTWZvY04zTjgvWjh1YU1OTXZycTFpbnhRTkFSVG5OWm0wNEhi?=
 =?utf-8?Q?qtEBvuU5ajea33nM=3D?=
X-Exchange-RoutingPolicyChecked: A7ZSGLI5g3PWmJ/M+KzW3fLER5IQNgIfLTUIYcGU9Rk9E/am2Dsjg8WRz3DDRnkPTfjWaBdHf/Chp+uM9a+zq+IDVSGkfXqBgCMwuAooti42VwlpcRdfv3lp48hnQjqwXDxOCbg3Npuinj60ddc6/qpOZ2ASX6LyFI6ppxamgdpCHzOE5PNYzdIHBMqlfYMvFgxD/j4c6E12HFifkNg+9afkaBamr5xN6blh41TaeThNKPH7Squ3tLbikkQYxBEshst9XC9H6J9SEdijKzMxGy7CO8ErnbSL5d9HQvJXeAqpThYE9/n1CzcwqP7FgeWz8iDDx9hLO1LGTTG7ehOLJA==
X-MS-Exchange-CrossTenant-Network-Message-Id: f1cdef9b-508f-4d9a-4c89-08df4c4afe84
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 05:55:09.3820 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q5MKVPN7LVZvSkmcREXk3A5Jr0T8T4FWNMKdu83NqI3+D/dwvV6N8ZC66EvENsrMyQA5l8AFHAzFeZLfHxpRUOaxx0orQlHhgkEd5U9jrUQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9397
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
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:27 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Rename intel_vrr_vblank_start() to vrr_vblank_start() to
> highlight that it's an internal helper and that no one
> should be thinking about exposing it outside intel_vrr.c
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
LGTM.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>


> ---
>   drivers/gpu/drm/i915/display/intel_vrr.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vrr.c b/drivers/gpu/drm/i915/display/intel_vrr.c
> index 8dfebcbaf8b5..b62148f29503 100644
> --- a/drivers/gpu/drm/i915/display/intel_vrr.c
> +++ b/drivers/gpu/drm/i915/display/intel_vrr.c
> @@ -311,8 +311,8 @@ static int intel_vrr_hw_value(const struct intel_crtc_state *crtc_state,
>   		return value - crtc_state->set_context_latency;
>   }
>   
> -static int intel_vrr_vblank_start(const struct intel_crtc_state *crtc_state,
> -				  int vtotal)
> +static int vrr_vblank_start(const struct intel_crtc_state *crtc_state,
> +			    int vtotal)
>   {
>   	return vtotal - crtc_state->vrr.guardband;
>   }
> @@ -1231,7 +1231,7 @@ int intel_vrr_dcb_vmin_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   	if (REG_FIELD_GET(VRR_DCB_ADJ_FLIPLINE_CNT_MASK, tmp) == 0)
>   		return -EINVAL;
>   
> -	return intel_vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
> +	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_FLIPLINE(tmp) + 1);
>   }
>   
>   int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_state)
> @@ -1245,7 +1245,7 @@ int intel_vrr_dcb_vmax_vblank_start_next(const struct intel_crtc_state *crtc_sta
>   	if (REG_FIELD_GET(VRR_DCB_ADJ_VMAX_CNT_MASK, tmp) == 0)
>   		return -EINVAL;
>   
> -	return intel_vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
> +	return vrr_vblank_start(crtc_state, VRR_DCB_ADJ_VMAX(tmp) + 1);
>   }
>   
>   int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_state)
> @@ -1256,7 +1256,7 @@ int intel_vrr_dcb_vmin_vblank_start_final(const struct intel_crtc_state *crtc_st
>   
>   	tmp = intel_de_read(display, TRANS_VRR_DCB_FLIPLINE_LIVE(cpu_transcoder));
>   
> -	return intel_vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
> +	return vrr_vblank_start(crtc_state, VRR_DCB_FLIPLINE(tmp) + 1);
>   }
>   
>   int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_state)
> @@ -1267,7 +1267,7 @@ int intel_vrr_dcb_vmax_vblank_start_final(const struct intel_crtc_state *crtc_st
>   
>   	tmp = intel_de_read(display, TRANS_VRR_DCB_VMAX_LIVE(cpu_transcoder));
>   
> -	return intel_vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
> +	return vrr_vblank_start(crtc_state, VRR_DCB_VMAX(tmp) + 1);
>   }
>   
>   static
