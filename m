Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F191C43458
	for <intel-xe@archiver.kernel.org>; Tue,  7 Jul 2026 22:14:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0157010EF17;
	Tue,  7 Jul 2026 22:14:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCXCkqDn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4067610EF17
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Jul 2026 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1783462457; x=1814998457;
 h=message-id:date:subject:from:to:cc:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=Ilw+nSVEbKAjpTfPueU3isPDPKAoh85fMIS7HFvM/+g=;
 b=YCXCkqDne6uyZwvLXg9HYhby1RAGoPNujaEsjp9s7818iZ3/F8bYNu7K
 aDM32mf238i36Vqt0LPuqhd8HLTgjV+Mmhp8CXr2Do/bdtlCqKfLyLCOM
 jDAtEXl38MwE6WmPFPH2AIbO7b8A8012H/DdERb5Ivi4YXVbC2rmAubyA
 emvlo5YJYwLL3Ysq57HFBl22UDwvf9NpaZmCUVI1xHSYNrUvscZ5S94cw
 4OyqFIftFZiW4D/lCbWtrKEJx7qvHAeg8Uz9XnooeIEic8JKRu1Wx2RO2
 PQY7PzQ5e4SmythSdZcu2IT4C96cZh9zoTw3Q0M+m62GxsFWEMcp34B8F g==;
X-CSE-ConnectionGUID: wV/S/pJvRCyLQz24IcOl1A==
X-CSE-MsgGUID: lt4MDBGaTba0yFulr5T9hQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="84145589"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="84145589"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:14:17 -0700
X-CSE-ConnectionGUID: 76w0ieF1SzaB7D1rdWMhtQ==
X-CSE-MsgGUID: Iyj2QQUtTTeABoLG2VMjZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; d="scan'208";a="250129735"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2026 15:14:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:14:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Tue, 7 Jul 2026 15:14:16 -0700
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.53)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 7 Jul 2026 15:14:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYR7TNQW3me6XhGV1eGvhTl3Z/g7hRBqdCP9MEY2idjLhb1AdiBxYM5G9IA4vh6qIPhanrIVw3P82YRP8Sr1wwkLFj9KalRFCeYOYvy+VeSdG3wn1sT2vPVE0s0cH86t/Fs/xDsulu6alN7Sd3QUmEZqlKzAeUin1cNKnSjVCXRdSE+Qzei8qPSCzpLYwJPe0MnhhplAapQ4jTJBqkZHq0GX2LeCt+KLouiSclnEoAxh/GKGeeGEbmMXH9stxBdWP0BQXeyIuuuKKqCakA54C9mNOYyCHS7RP6MkLU92tYFsQuIlZInFjVLC7X7byrRx4z9u9M0j9C5fqF6lKGUuzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PSRjORfwXdamFlKJg+ZpVJh0pvM+BliFbi2uonTMdXM=;
 b=xLoQkXYbcymSfWc6BZjT/Ty1xrUDe7CduwNZ4Tr1hR4JPAPYNzSNtL793Acs231X2zPj+zMpviklD/2kGKwd1nLZmMvxwu8yMrESdJYso34ItBwm/Pp20Wq7C7FiFpLl07Rx2WIXluivQ3oUlN1DriwkCCE0LDrjEFdSTJpHp9UzzlPIBhSb3bUCLiuNW1PRrpBXOQDz9Fgl41lFqkUZavWKQLOeZGVF5ociHjmEjaDsXGoZa0bwEuLja1Fonk/4KrJX72zCdPX81o/wdB9yPL+8ojaadMAqP/b99BE+O6J8wpQgeitQD1C83+9MMzh+MQNO7EbrwVGK2xLM6shjhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.12; Tue, 7 Jul
 2026 22:14:14 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::3a69:3aa4:9748:6811%6]) with mapi id 15.21.0181.009; Tue, 7 Jul 2026
 22:14:13 +0000
Message-ID: <8a89ce3e-b5a1-43f2-b407-d7cb3cd11e1b@intel.com>
Date: Wed, 8 Jul 2026 00:14:09 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/13] drm/xe/tests: Add migration packet test
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260630132633.32804-1-michal.wajdeczko@intel.com>
 <20260630132633.32804-13-michal.wajdeczko@intel.com>
 <ake6DS7ZfTjXUwox@nostramo> <d6b9a35e-8202-4a78-8d46-ecb90b220b6b@intel.com>
Content-Language: en-US
In-Reply-To: <d6b9a35e-8202-4a78-8d46-ecb90b220b6b@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DU6P191CA0002.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:10:540::19) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 35c39be3-86ff-4759-6610-08dedc75136e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|22082099003|18002099003|4143699003|6133799003;
X-Microsoft-Antispam-Message-Info: 9vXqyheXXd0PuKJFgrBSJXjvbWIXrJvUFIxCcbZP+g42XoHzY4HTut/dXqwYEz9KAyWetyOdYl+Bqa0Qac1wHE0Zx7friekftvuaZDEecFRlKHh2bZRnoKg3IKUJkTJL3Br1pJ0epJ0+YZwTymagAOHsPggk/xUDqGMIb5FfIeN0jH2jPeClCFjWnfyRiAgiY33QMPSRPnH1QzPIDygCkZbNChNFfCMU5jDqAv4//pXXu/Rsy5fbHsLQ58WOffO915MeJM3OW/iM/zqIeB0mueo/Xvt7IJrpSaxkkUgJ2knNE0eFk/s1025kCrL7JXUzd4NMKeY9E4ii1lTEgF5KBHvR5cjxp1NLcFTtDHCC01GGfoQ7uy99DeMGf9KlD8Uep+uyv7Uxzxtubcov8QNxTf8tJN5NggCjAKmuIiYd/rGeN+ZTHU/moSSMuLxo81ZhzPIOJsnJVdrpSsbuqEKPnheUypxW0EOf2ZB70W32qz8BTpyq3eDuyQtXsKhK65X9w/THsv4PmpGRNIJuRQaKONdvbL5IscJo5a5hzawpMO5hYHsx92LVta1agInnNDwrrmHHea+ZoBMRIr477J9lUY7OrBcRDDjZmMYCLiLgDTA4UYnPOMOdOzEaCQEPMsIKhq7AFRAEyVtzo4n+OlN/3458R1mF796rktIvboFjebY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(22082099003)(18002099003)(4143699003)(6133799003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QmNhejZVVUcyTmRMZnFIcFFDNEpYd1RQeEhpZHhMcVFrcjIvUmVLaEpDT2JX?=
 =?utf-8?B?ZWNodzNuY1dqTlY4amQ4bXNEY0svUVBmZ3d5ZHRwMnQrR3ZOMWRKeUY5dHdM?=
 =?utf-8?B?ODAxZ2FpNXJqRzBrTFdBZWdrS3FnRC8xVVlkMFM3M2FwRm9RTkpLNTM0YTJm?=
 =?utf-8?B?ZEdwc3hYc1dtSUZuZlBvdDZ6ZWtGejFHSlI2eCsxakthc1F4N2VnY2RMTXNl?=
 =?utf-8?B?Zys1WXJ1ZDduZWZrVTZRZEsrd1ljYUVhM3V2SjhaV1RBVFNzbTdIL0E4RkFP?=
 =?utf-8?B?Wi9zelB1eGRHdzMwdTJRVFMrNjhBRjBiM3c5a0VCNjBUcGE3UHJTcHltWjdO?=
 =?utf-8?B?cGFDeFF4dUtkV3ZiTUp1SWFkMDloYzNwWStDbUlLRVFJWkJENVBGdklyY1cw?=
 =?utf-8?B?bjRRK09qOVNlYzFmOHV0VW9SOE51cllqbDdLTkVBTWpaYUtyMy95VVdTK2RO?=
 =?utf-8?B?ZnQyZTgyTUg1OXNRYUhyNm9EQjJlclJKdFYzbWVlTXdIbG8xeG5lNllmeEJV?=
 =?utf-8?B?bDd3bjUxVWtTeG8zR3ZyY3FqQ2VDcTI3VmpCR29SbkxRWWNFbTI4M2tqTzRz?=
 =?utf-8?B?UWNpcW40YXFkM1NyUDZSZ2pkVkc3Umk3Z3JZVlh0Y1pHckdWbUN2QXRFam5F?=
 =?utf-8?B?VjVOVnhmT1JVbjNCckZhZVFIVzJNVmJ4ZlBYY1g2d1VLWFU4OE81YTZYNmRu?=
 =?utf-8?B?YVJjeC9oK2w4REZyazF3WXRtL1hReUdvSHZndDFFMEtDRDRPT1d1NEFETGwz?=
 =?utf-8?B?a3UxcDhjcmd5UmdsRzJDWlhyR2IxbENtd3dRZHRnaWtHSjBJME9NMWdneU5U?=
 =?utf-8?B?U1pOM0lEUUlJTm1BRHpRL2d6V1JqVzlBcEM3a2NKRjFmMHdPakQxUFZVMTRY?=
 =?utf-8?B?Si9haGEwcFlpbGRRdlNodURDRFUyQ3VXWE01TFpPMkpXOXZMekZUb3lrR1Rs?=
 =?utf-8?B?Q2lGM3hhdHVtSHo0WUdEdUh5amZmYUxtemVNa0JCWDFvMUFVY0dhc0JrMVRT?=
 =?utf-8?B?TTEvVUJRcmo4eUpNWDZPTE5WcGowak42Z1NManpFbGdOejBwZy9kMlV4eXor?=
 =?utf-8?B?MnhEd1RLVW1Ta3dzTkdFbmxJOU9vOHZMOEVHWDV1NWlJSXl0bTdvc2Z1Nnha?=
 =?utf-8?B?VGJDNm1RRGhVb09rWStHMVdFY2h5WnlsMnlEVU5SQ0VTRkN6RzhSbm9NQVpC?=
 =?utf-8?B?VllBR20zVVBvMS9kcjVlSVpRdlozQUV2Vjhuejl3RjBieUhXY1Rvdjhrckls?=
 =?utf-8?B?SVRTd1l5Zmx3N0M0N2JLQUl3WmR2NlgzWVNIaEI1QWtxWjNIVjVKTHJFQnMv?=
 =?utf-8?B?WHRMTTRqUm5VQ01ldVE1Zzk0OFJ4bWFIcWNXS1ljandldFpvK0FGWTl2a3FX?=
 =?utf-8?B?cHU0bk1qcjd3L0VSbVAySEdCTFBjUjdWc3VXMmtjdVVBVVZ1amoxSXc5NXNk?=
 =?utf-8?B?YkQ5bFYwQjZhSmJTYnhwNzFFOWNkWkJkeC9KNWZidENxbVVuTWRzb24vcXcy?=
 =?utf-8?B?SENWMlN4a0ZUREV5Um1YL0dEVVZncVdxcGM4UFZNMUZ6YTRuKyszbk5LeW9p?=
 =?utf-8?B?QlVTM1hYUUNlKzRXaWw0bDd4M01HYnFFWmE5MU9kWFk5YjZIL1hnZDVmMk5N?=
 =?utf-8?B?Z3BKNWVlMjNCWmx4VWxaMzRvK2JqcENjWnFFZ2NCOFl5aVZPaFJpMjRXR0tR?=
 =?utf-8?B?bWFyM2VuUHlMQ0UzeFc0b2RNeUlabWNBWGJaNmNqaDBaV3hUN3MyOC9tclhz?=
 =?utf-8?B?S3ppbDJiWUgzckJUVlF2aHpGbWRjZDIvL2c5UzFqYW1DK0p2MTdiNXN0bEJF?=
 =?utf-8?B?VTBhZERsVEsxZ0pDNExIMmdkZ2s2cnorUUJNWnN0end3SDE1bS9UMUU3alNr?=
 =?utf-8?B?YUZkTVkxcWdxUmVxaXpveGJYazBjT2FJVkY4Z0EzZUI3MzNRMTNzV0owc0pv?=
 =?utf-8?B?TGk1NGpVd1NJTW5kcmRTQ0o4OTRZbDkwZzljamlwZkFEbVJBWWV6QVRPZkRk?=
 =?utf-8?B?QzZwZ2toRTFaNEE4d3FtTDBHNDBJNWI1M0hvSG9FTlRuRWE5Ylc3Q0dmRytZ?=
 =?utf-8?B?NmxMYXZMTGRxUGp0NTZJd3MzMmJNaThldEN4WlNDL0tFVVZLL1pFNUJiM1Ev?=
 =?utf-8?B?MXUwRDM2R2NGVDVoQjNhTzUwSHZCMVhObkVGLzVXeXJsRFlTRk85SlBIcitL?=
 =?utf-8?B?RDQwaXBFOHNuU0FaRmlLWFV5R2plSllRQVNub3BPMi83WkFlTytJbHRGQUhr?=
 =?utf-8?B?NmIrbjFPNExBTjQzc2pMbzRCcUdLcE9nc1ZSWjdEc3AxR0lTTy9JZE5RYnJ5?=
 =?utf-8?B?eEErcm82K29mcDhvcGk4cDNLSFBwMlFQaFptOXlPUHBvVUJDWXd4QU1VU3dy?=
 =?utf-8?Q?60X4ZA15TFaO9K5E=3D?=
X-Exchange-RoutingPolicyChecked: Lgqu5wTH+x8/IxRWXwHi9bEA0AQCJeQ429SKEcqj1QDJSAqF/ZkiRSqgcBhTHRqmZ9+2SNGOXLTSwHadhcfRtyB5KbiBVDhPDNLJmauMuwgxnqr5FQURhgzEnpM5MLIYBMJlL83Jhdlu7nsnOGkNvKkyIPHka1ueotVHvxKM46DFFYhfgWCur6bSJoa+QDOlHIqjIBaSzg6T4oBZGGpy8ohHakAlQGQPGNUYqnMW+4yj5Ss21ccjTGrWrGPGnFkcW4YTgKOfnFv2IEVX22lUCMA7SbSErVpcUsWwQ7gf0QrhbmkAcEs74ffZJGt8kh4O1d/PU3xcaDnlw9/zkq/6Iw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 35c39be3-86ff-4759-6610-08dedc75136e
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 22:14:13.4102 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c6ATl3dtvcXA4Q7Hnfg/QjcAi6gXDyI2HiU/O4dPu17835jhAYXGlasNKo5eJlWw5UtC71RlBQkJ0qnzzRB51kSFvHOoKHaPylB9PcJZCZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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



On 7/6/2026 6:42 PM, Michal Wajdeczko wrote:
> 
> 
> On 7/3/2026 3:44 PM, Michał Winiarski wrote:
>> On Tue, Jun 30, 2026 at 03:26:31PM +0200, Michal Wajdeczko wrote:
>>> One of our migration data packet (descriptor) is based on the KLV
>>> encoding. Add a simple descriptor initialization test, as we plan
>>> to use new KLV helper functions there.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> ---
>>>  .../gpu/drm/xe/tests/xe_sriov_packet_kunit.c  | 83 +++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_sriov_packet.c          |  4 +
>>>  2 files changed, 87 insertions(+)
>>>  create mode 100644 drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>>>
>>> diff --git a/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>>> new file mode 100644
>>> index 000000000000..9af066875671
>>> --- /dev/null
>>> +++ b/drivers/gpu/drm/xe/tests/xe_sriov_packet_kunit.c
>>> @@ -0,0 +1,83 @@
>>> +// SPDX-License-Identifier: GPL-2.0 AND MIT
>>> +/*
>>> + * Copyright © 2026 Intel Corporation
>>> + */
>>> +
>>> +#include <kunit/test.h>
>>> +#include <kunit/test-bug.h>
>>> +
>>> +#include "xe_device.h"
>>> +#include "xe_guc_klv_helpers.h"
>>> +#include "xe_kunit_helpers.h"
>>> +#include "xe_pci_test.h"
>>> +
>>> +#define TEST_VF		VFID(1)
>>> +
>>> +static int sriov_packet_test_init(struct kunit *test)
>>> +{
>>> +	struct xe_pci_fake_data fake = {
>>> +		.sriov_mode = XE_SRIOV_MODE_PF,
>>> +		.platform = XE_PANTHERLAKE, /* we need MEMIRQ */
>>> +		.subplatform = XE_SUBPLATFORM_NONE,
>>> +		.graphics_verx100 = 3000,
>>> +		.media_verx100 = 3000,
>>> +	};
>>> +	struct xe_device *xe;
>>> +
>>> +	test->priv = &fake;
>>> +	xe_kunit_helper_xe_device_test_init(test);
>>> +	xe = test->priv;
>>> +
>>> +	/* pretend we can support at least VF1 */
>>> +	xe->sriov.pf.device_total_vfs = 1;
>>> +	xe->sriov.pf.driver_max_vfs = 1;
>>> +
>>> +	KUNIT_ASSERT_EQ(test, 0, xe_sriov_init(xe));
>>> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_migration_supported(xe));
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void test_descriptor_init(struct kunit *test)
>>> +{
>>> +	struct xe_device *xe = test->priv;
>>> +	struct xe_sriov_packet **desc;
>>> +
>>> +	guard(mutex)(pf_migration_mutex(xe, TEST_VF));
>>
>> Sashiko complains that we'll never release the lock if we're mixing
>> scope-managed locks with KUNIT_ASSERT.
>> We might want to convert this to test-managed resource.
> 
> hmm, while this could be done here this way, it might be not so trivial
> in cases where we would also mix some original code that uses guard(mutex)
> before calling other function which we replaced with the stub and trigger
> the KUNIT_ASSERT from there.
> 
> maybe special steps should be taken only when locking a global mutex,
> which is not the case here? but it's not a rocket science, so yeah,
> let's do it
> 

hmm, on the first ASSERT we will get this WARN anyway:


====================================
WARNING: kunit_try_catch/18 still has locks held!
7.2.0-rc2-g1fa71d6adb71-dirty #1279 Tainted: G                 N
------------------------------------
1 lock held by kunit_try_catch/18:
 #0: 00000000644e21d8 (&migration->lock){+.+.}-{3:3}, at: test_descriptor_init+0x1a6/0xdd4


and doing mutex unlock in a cleanup action may result in:


=====================================
WARNING: bad unlock balance detected!
7.2.0-rc2-g1fa71d6adb71-dirty #1279 Tainted: G                 N
-------------------------------------
kunit_try_catch/21 is trying to release lock (&migration->lock) at:
[<00000000609192c5>] kunit_remove_resource+0x145/0x250
but there are no more locks to release!


so the best option seems to be avoid ASSERT and just return

>>
>> LGTM otherwise:
>> Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>
> 
> thanks!
> 
>>
>> Thanks,
>> -Michał
>>
>>> +
>>> +	KUNIT_ASSERT_EQ(test, 0, pf_descriptor_init(xe, TEST_VF));
>>> +	desc = pf_pick_descriptor(xe, TEST_VF);
>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, *desc);
>>> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.version, 0);
>>> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.version, XE_SRIOV_PACKET_SUPPORTED_VERSION);
>>> +	KUNIT_EXPECT_EQ(test, (*desc)->hdr.type, XE_SRIOV_PACKET_TYPE_DESCRIPTOR);
>>> +	KUNIT_EXPECT_NE(test, (*desc)->hdr.size, 0);
>>> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, (*desc)->vaddr);
>>> +	KUNIT_EXPECT_EQ(test, 0, xe_sriov_packet_process_descriptor(xe, TEST_VF, *desc));
>>> +
>>> +	switch ((*desc)->hdr.version) {
>>> +	case 1:
>>> +		/* v1 is KLV based */
>>> +		KUNIT_EXPECT_TRUE(test, IS_ALIGNED((*desc)->hdr.size, sizeof(u32)));
>>> +		/* v1 has at least DEVID and REVID KLVs */
>>> +		KUNIT_EXPECT_LE(test, 2,
>>> +				xe_guc_klv_count((*desc)->vaddr,
>>> +						 (*desc)->hdr.size / sizeof(u32)));
>>> +		break;
>>> +	default:
>>> +		kunit_skip(test, "missing test code for version %u\n", (*desc)->hdr.version);
>>> +	}
>>> +}
>>> +
>>> +static struct kunit_case sriov_packet_test_cases[] = {
>>> +	KUNIT_CASE(test_descriptor_init),
>>> +	{}
>>> +};
>>> +
>>> +static struct kunit_suite sriov_packet_suite = {
>>> +	.name = "sriov_packet",
>>> +	.test_cases = sriov_packet_test_cases,
>>> +	.init = sriov_packet_test_init,
>>> +};
>>> +
>>> +kunit_test_suite(sriov_packet_suite);
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_packet.c b/drivers/gpu/drm/xe/xe_sriov_packet.c
>>> index e581e8e6c1d1..558a3697d639 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_packet.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_packet.c
>>> @@ -516,3 +516,7 @@ int xe_sriov_packet_save_init(struct xe_device *xe, unsigned int vfid)
>>>  
>>>  	return 0;
>>>  }
>>> +
>>> +#if IS_BUILTIN(CONFIG_DRM_XE_KUNIT_TEST)
>>> +#include "tests/xe_sriov_packet_kunit.c"
>>> +#endif
>>> -- 
>>> 2.47.1
>>>
> 

