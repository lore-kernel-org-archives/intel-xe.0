Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB343606A31C
	for <intel-xe@archiver.kernel.org>; Wed, 11 Nov 2026 07:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dz05GjUI
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C0C210F66F;
	Wed, 11 Nov 2026 07:17:41 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7649110E999
 for <intel-xe@lists.freedesktop.org>; Wed, 11 Nov 2026 07:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794381456; x=1825917456;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ZLJB0vARxgEWdxsrhkcC+9EEW8ZLIwVtOSKuNmbWA0U=;
 b=dz05GjUIj2x1jUaJ1BxckLPduoIenI0ndUp9Zo5Xsuw3gBfNPYYDrkDO
 EK+Fpbukzopg7xDYjCehSZkCkuBAqrZs2BkmI2ABCPDOtawmO+4hdDecU
 IktLZ3uqVOuOUDQhIpcghpLM2wTb6hiOwGuhK/3PsljO+kfRto/Tk3cIN
 hc2rDzBP4ROIzSNOpqcjHSQbkOCrTypaSuZ5Z8ZJQnkCKeW1+Bxalr1Vu
 wpT+Y3WQ0t0SO4Y131A91vDi40H6t5FK4AnSPYTXIZ5S7i/+sBGIYILVY
 30bAOKzNr68dGg4ueqlqk+IoKVCsulylYOjAFxKfdr/AK+F06rijJas2G A==;
X-CSE-ConnectionGUID: 232YPcmmRYe4rygsAtJgwA==
X-CSE-MsgGUID: oQU39eEDRT2H+DicqVcXdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3040909"
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; 
   d="scan'208";a="3040909"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:17:36 -0800
X-CSE-ConnectionGUID: yssHPtpmSKaDyMlgwlXz4A==
X-CSE-MsgGUID: U8yMzZtERcOzdrEGkPsThg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,207,1787036400"; d="scan'208";a="10085748"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa012.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 23:17:35 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 23:17:34 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 23:17:34 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.52) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 23:17:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAMRgdNyjSPtAMUrNiu4KRypFsI7V4lxty/iQ4xhXrdsWGZwrc8GPF6UdiZlbU0B3Xf5Lxp6Umnr6BVZy8MDDcvXeAuXKMzZsRuBA4+GrekMrqgMHhwKNycRGx5OfOmNNb7IcSPUNyeRJe/Mwtb7JyZfQIMneawCRkLuVQPTXjRMZlHS+KvHi3wHaCYPdnv7IAfDnHU13mM4WvxAu2OR9TD9QKYxvce77ZFuEawxXF5+5Tb8ezSSB02hJ36fbLifbjohuPVBOmzzwuwSioaOmgTK7KTQZdpIaos37RyAXrgBUL8qsK9nntdPjGi6XIl52z/5JZvI0ecxROEBQgmO5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lGlE9GOlmL0bKi2txoSSVDpcl+UNJkgLKhPEul+tfA4=;
 b=NCe5F+pGkpKMBY18mhZ2V1NhMZ+NIj/LG2LI2SeYgVjEzfdWZAbRoOUCS5YPqritprCPa3sYJ7Vw+SWiVa6i3HSOpO5VraK7RcTtFbeZ86kat578REi8O4nvint99VkpavDDxT7ibG/1QDEC3nW+Wxc+iTmL9oVFxWfsexUatVvQE9TDipNCAOh8vO4O0ziDKNmuminPz9QlF+l0xIqAwPgohxNqXlxCWOSjbMC3v2Y+te5YPV6ihSYFVNJZBMYzu9kJQI2GtMw8hzDTbJixL+V3nr6WKt/K0f5UC5QZ0SoUlJGK5RtVdtfHDyGmUsQfQkklkTgrZOxmDVr4Z2AT3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CYXPR11MB8689.namprd11.prod.outlook.com (2603:10b6:930:d8::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.9; Wed, 11 Nov 2026 07:17:22 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.007; Wed, 11 Nov 2026
 07:17:21 +0000
Message-ID: <1dcc65ae-dda9-4351-9296-7ecef88e7258@intel.com>
Date: Wed, 11 Nov 2026 12:47:15 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] drm/xe/survivability: Guard runtime survivability
 enable against unbind
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <mallesh.koujalagi@intel.com>, <badal.nilawar@intel.com>
References: <20261106071944.2693854-10-riana.tauro@intel.com>
 <20261106071944.2693854-13-riana.tauro@intel.com>
 <avMTTzrY0kPJRChS@black.igk.intel.com>
 <02e5f319-4d40-4ec2-9d50-a15b4102b21c@intel.com>
 <avP_gtHbb-taK6DK@black.igk.intel.com>
 <524ae4f5-d484-4af4-a7ac-68bdaef970c5@intel.com>
 <avQUnHig9Ign-njH@black.igk.intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <avQUnHig9Ign-njH@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0213.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CYXPR11MB8689:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c316a95-d4d6-4fef-192c-08df3fc3d3af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|376014|366016|1800799024|10067099003|11063799006|4143699003|56012099006|261022105027099003|261022075727099003|261026121527099003|261026140227099003|261028144727099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Tfd62HzrDn3PMU3/1ueV96XM+LMTX/00RpmSknucRhlefRng4WHoGhQqaDh3wC6egUy+ybkqRfXA1GpvLi0UleXrlVOAbOLoQ22QW+gUE82GXPSkzuslDBqj6Ioz9com17Ew1bTX8+dOFMHO0+/C9rVNYY5zem8JnBNycM67GXDD3yd7icTjERPtubwoV5QC6DXLxb8LFTtpLzltfExYYvgBKig89Zh3gp1Lq7z9BOxSQ4oL+bvXpnlurcpJkdeBAb4F513UVCIm8rZmGTknnhX8MRspJU4nug1vQqbo1phKmV430q+ykja/li740ae+sB92mKvFkkIdlrk9p7HEEBMLYdhw268UPSRaJ4EgCB9yvGVv9U+EvrmLzfI42aaJNsTSCUJPT9mcHhGlY96l4Wm/eRD8LOVqZ0/GmVqcIihmw9JrEOSvRw0MdTQ2NUGy1hSaHddVbs3zVXBG0BWBEnz5MrxEE7aMRx76OU6LW7gxXoJuUrsY8AHa/yLcRhGneSe2X6Z18v2qTVllM82W/ObgxagE1F53kwiLO+F1WF5O8bImhaknxC0DBSRidMHwXuZb9KZJS8AD3HhNjaLR7x0dL5aA1xRFtYVaBqgtI4OF3O5PJz3Leg5ipmP42CPCccvUjP6ox9mr3gZkfYydes8y2IxrS1SRSMzbQs6tQ9k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(10067099003)(11063799006)(4143699003)(56012099006)(261022105027099003)(261022075727099003)(261026121527099003)(261026140227099003)(261028144727099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SStHZXMwUWlRYVp5d2ZKbU1HMVJNTWk4eld0ZUpFTU11WTVmNkp4c3Mvb2ZB?=
 =?utf-8?B?TDFhS0Y2NHhacmxndHZ1bHBTREY4OTV2cnZ6U09IZjBZUngxWFpsYzl4M1Fi?=
 =?utf-8?B?WUV5bDl3NkFqbkxHcDZTVlNZSTcxZFBGUDVOWDJ2b0JsRFROZzJ5UmdkR3JY?=
 =?utf-8?B?VjlmWW9VM3BrWjJ6aVNHb25zN1poNDN1eU1ublZGVDB3MG9QeHR3VWYySjBU?=
 =?utf-8?B?TTZ0aW54MzJvT2JDNHlqT3ByT1o3Vy9WYU1yNVU3VmVScVcyUVcvVDg4bStT?=
 =?utf-8?B?TWthVXFmcWpLbS9FdndGb1NJRENPNWFxdmsraHlNT29wUlBmY3lwWkxjRHJW?=
 =?utf-8?B?Y1I5bnoyOVhpc0RadFhIREh3VyszOEYzSEpqQ0hMaWtvVGh0TDBjZjdvaVYv?=
 =?utf-8?B?SFVRdzRRdlhobkp0b29GaTNNUTJxWWp2S095MGx4QTd0S3AySmc5QWpHaU5O?=
 =?utf-8?B?UHlmaXYrS1ZwZ0FUZjI5SGp1aFVZMjVReTVhYURUQnpLUFFkYUFqRThNNHJI?=
 =?utf-8?B?aEFPaUIzMXorV0p6NWJlc1k4QXNZdm10M1RyNkkyb1ZHdHdSSFFwTVBHY28z?=
 =?utf-8?B?T21JNFBFamRObFZjaVI4OEFORmlydHdoYlo1YUNrTy9WS2lRTmpQR0hRU1Zv?=
 =?utf-8?B?Vm1IMlN2R3RLcWRqTFUrYUwyZStZUWVRYzNBYXcyd0JubVNuTHk0NWFjMnYy?=
 =?utf-8?B?Q2V2S0VrR2R0RzVqWmNuZGJIK0Uyd1JTbWZpVzcxeHllYkxWbUhQL05GdVVq?=
 =?utf-8?B?NXhjK0hHZ2hBdFVyOXZRQXdKZGNLT3FVNTJsL01SZkVGM2pETSs2QUhybGpH?=
 =?utf-8?B?TFA0VVJRQWRUdUJzMWFzMW1wSElTd1hwNFlFZTh5Z1pNY2FyZmNpRlB3OTEz?=
 =?utf-8?B?RXIvbVFMMGR5VFpwT0ExVjJpdTN1aWJXamQzanlJMHN2R1BNMDliNWFYYmxs?=
 =?utf-8?B?ajB1Q1ROaytYZ2ZyWHc4RCs0a2tSeUhvVk56Z25mY1ViSllrOWRaQ2czbmEv?=
 =?utf-8?B?YXBuU1lpd2dDQ0t4MmJYbUZidmc0MkRxKzZycWo4aUFWOG1UY21ObkhYemEx?=
 =?utf-8?B?eXJWZUR2SHoxenVxL1JSQncwbzZHbzdrNzByNk9DTUFzRnYvQ0g2RzJscGJT?=
 =?utf-8?B?RGhmZW9sblF4VlVaUDYza2diQkNkZENiZ0RHT2VtRW1WbjJKOFpiREVQVTR2?=
 =?utf-8?B?NHVDeEg5ci9IY1dGVFNDTjh2amxUODdRb1BTOEUyK1dnd0w3RllqRnQ4RWN6?=
 =?utf-8?B?VWc5TUUwTWxVTVN0RE40ek1iWFZOZXMwSVN0aWV4dURLbkZrVDdhWlJwNlFk?=
 =?utf-8?B?bHBCVWIxanRSMDVtckxXcVlzbm80OTI0ODVtYUwyMDhhZ3JxNEs4Tkp5UWlR?=
 =?utf-8?B?c2JXSS9GTWJEL1U5OGFla1lSc3h3UnJaejB0dlpNZEpiU29IcUJPUmpyc0ZY?=
 =?utf-8?B?Vkc1Sm5xbjlwU1Q1dnRVeHo4blFmWkNocTBzdHdvZTY5R1UwWGRObENDbmVy?=
 =?utf-8?B?djNzSm4yak14TnNtWm15L2dObXphQ3ozd0V3aXF1cHR1T0l2Y1V5YWNMUzlH?=
 =?utf-8?B?QXlNaE5JdWRKYlprVVlpMnJXOG5IZGRBY3dLWlFCSzZjRVh1MmlRQWxpN0ww?=
 =?utf-8?B?ZjNjNTVObkNaaENPc1JPZlN3TEhwZGxpVDArak81cG5GUlc2anlyTkd2TDhj?=
 =?utf-8?B?WW9WN2lUVTVkMnBoZERLUmlGSFZrOEVZTE1UYzJ2VXpZck9UZFVZSVZNSHJU?=
 =?utf-8?B?NlZIV0xmcDV3aksrQ3BvOW9aUkxSVWt6QWwwQkFWWEFTSkVTRUFZS1JiOG1w?=
 =?utf-8?B?SVBnM3dKMXlpdnFPc0ZZSVZlYldzUUVkMERuWVJENVBiWGFCSUJpRkRmaE9U?=
 =?utf-8?B?WUlLWGJCVFhEY2lCMENSQ1dLeWorcUFRY1M2Q25LdUNoTjlDYU40NDlxM3Nv?=
 =?utf-8?B?ZnA5SXNURTEzdWlGVnBNbVhoMkdacjJaOE81TDF0OTgyWm9PZytTNHNmOGtp?=
 =?utf-8?B?d25HaGV1ZC83R1YvNk83bmhVc1NyNnR4MEtDVm1SZUNDY0pvelJYTi9JMnRm?=
 =?utf-8?B?YjFLbi9ON0ZCNVA4MUdCa2E3R21mKzRtb2xUUW9laGN6dlJSWVEwd3pMNnBY?=
 =?utf-8?B?QUhVcFFvWlFoemdlWlBWRDZndThzQnJTMUxDNVZ6ZFRGRkVtMlI3eEw0czYv?=
 =?utf-8?B?Ni9WMDlGZlZVbGhXd2JuRFk3b0NJSDJHSVJaRWpKNDFLL09MRkZzaUZaNHo2?=
 =?utf-8?B?d0JlK2xZbnNCQ2F1NWJiRVFmUmsrTW10bDl3aU1ERUF6YjhsZEgxbHVrRlZr?=
 =?utf-8?B?TUdVVjZmdFpPbDhSNUd3T3Nabmtrd0p3VEttcFFGSy85U2IyOWh3dz09?=
X-Exchange-RoutingPolicyChecked: njNXkd+/hpob7G7zAXQLqyjldIkMaRcHWPNN5oQRsW2bMT9+rQrIwKjD3WzYv7i2/jjIQHdgM5Y4yEddwA2U+zItxaV3xgrnkK2rnUiBsDc1wrV3PcZNhhTLgllOsi1ZwJHDXTLoxqNCLLnjkmeKZTf8OrsvyMGFRHrk9o+jQCpeQ32J5S/WQqDNoCEUhOhh1R69+GdQXCIvbkxNBtC8qoTZRmtRxzrhMCt3LZO/pCYBvyqUtwu8hZWIk63afqcLMg4Mjavcymnks1m+4CYFqi/fXybYpy3Kiu5nxri5ryRDcRkXIRHLaxqcxpwta4lJG/lUbHAVnhKHaZ3xZ4r9Dw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c316a95-d4d6-4fef-192c-08df3fc3d3af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2026 07:17:21.6774 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YCEifOrCYAhUSsS+JinW5OI1kHYCKSDRXgP+1xbKRsaEuFHqMvhnCV1yEoare2mI6AR43LKv/piRxpfX5s6gQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8689
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11-11-2026 12:39, Raag Jadav wrote:
> On Wed, Nov 11, 2026 at 11:20:02AM +0530, Tauro, Riana wrote:
>> On 11-11-2026 11:09, Raag Jadav wrote:
>>> On Wed, Nov 11, 2026 at 10:13:44AM +0530, Tauro, Riana wrote:
>>>> On 10-11-2026 18:21, Raag Jadav wrote:
>>>>> On Fri, Nov 06, 2026 at 12:49:48PM +0530, Riana Tauro wrote:
>>>>>> Runtime surivability mode creates sysfs and declares the device as
>>>>>> wedged in a worker thread. This can race with unbind.
>>>>>>
>>>>>> During unbind, devres actions such as disabling the worker run as part of
>>>>>> teardown. A runtime survivability enable that is still in flight or gets
>>>>>> scheduled in that window can create the survivability sysfs entries while
>>>>>> the device is being removed. This is incorrect, as runtime survivability mode
>>>>>> must not be entered once during devres teardown.
>>>>>>
>>>>>> Use the DRM device enter/exit protection so that the enable path
>>>>>> synchronizes with device unplug and returns early if the device is
>>>>>> already being unbound.
>>>>> I'm a bit lost here. Doesn't disable_work_sync() already guarantee this?
>>>> If the worker is already queued and there is a unbind in progress. The
>>>> disable work sync from devm
>>>> action waits for the worker to complete. This causes the device to enter
>>>> survivability mode during unbind
>>>> which is not intended.
>>> Wouldn't the survivability stuff still land on devres and get cleaned
>>> up anyway?
>> devres_release_all running as part of unbind copies all the devres nodes
>> into a todo list and then
>> releases them. If during release, we add a new devres that will not be
>> cleared during unbind
>> which can cause stale sysfs.
> Hm, I thought all the devm actions are protected by devres_lock but
> you're right.
>
> A more robust fix would be to disable all the workers in ->remove()
> callback itself and avoid such races to begin with, but I'll leave it
> upto you.

yeah tried that in previous series. But there are a lot of corner cases 
to be handled.
Will keep this for now as we really don't need survivability mode in 
unbind case.

I do see some other workers using the same checks to fix race with unbind.
We have to refactor the probe path for this and other workers.

Thanks
Riana

>
> Raag
