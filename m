Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21A8606A320
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 08:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jz9PuPp5;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=aBxOrdRu
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FCA10E4F4;
	Sun, 22 Nov 2026 08:32:33 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D52F10E4F4
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 08:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795336341; x=1826872341;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=w4wlb9T2PThrofvHjdqx0nbNVrK3sv04DjV+GdzGWW4=;
 b=jz9PuPp5Wc64OFDXp0C97P/L/J6gwuLUGQGsUREOUKaDbTdhngfw3nWx
 XbDzxNJ1DPt8qwDa9wMRU5tJLMd8RklMJ2zINcwS3w/zYTnQ481uhXNzp
 i2QKc+vGckik2XZq9r49DXSYVzCtxCFOtiTup16A2WJ+t2PujuVQ+Vnb5
 kNXJ1RoGo8Y2Ut321Jf29Udd4lSg0+sQnZTf/Ct1aSVYy28zfegD9TDVG
 ts9q5hMbL06TLEW+IGnD437FLZxu7VdUCqtrMKnHS1pBGGpJMeJJOf+QT
 Sdu4f3lIuMf3FHvLXg7uaBEXXW1ygxBt0S8bXAHr2IcVeA1VSzjbXBD2M w==;
X-CSE-ConnectionGUID: 45ITfmUeSKqDTrq4gnfz7Q==
X-CSE-MsgGUID: nJYp3d4QTvWt/TriFKBcfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4155988"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208,217";a="4155988"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:32:21 -0800
X-CSE-ConnectionGUID: 3px9bcUES/Glk7QXtqrnbQ==
X-CSE-MsgGUID: TkVteoMhSOS+5scrTkBFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208,217";a="11312066"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2026 00:32:21 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:32:20 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sun, 22 Nov 2026 00:32:20 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.31) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sun, 22 Nov 2026 00:32:20 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J+RPzyBRKWzfU0ZjstLrlsDTzKfxgs321IyBh5jYNTGfJ3zHqm7H+aJnJfNNvAWoyECBTnW6BBpy0YWTzofkJG2XYh/gz9tCjb70no28peCgo377CCAmiUtpRsOi+g47+WXWbFbLpiYkMIJZkJBaf7W494aP2t54TwKCcrXEOno9SbDU3qYneNSgaUQ56oU46WQyGqXRH+k/HQXE3BH6c+XPbuROoXqiBEJSjixwbDoK0pRfRDHQpLJCHhW1i6SshugtoL8l1H3V4U2WSgqdHWRcNHdP06d8TDRD/kB97NqNYDEXeJxs9PQ8uLlkidzw5HKLakLpT+UQ90RMpOZFng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAVpD8DmgZ7YILidp9jwif7VeS9c5dKf6Uf0RERgXKU=;
 b=Y8yJaqO+peAcIwsvsagakoyVoLIFwkGNLTl8B/5lQmnLu6c37BbaniVtUxIobvjM3uyHgaWpOd7h96B5HKXKYq/TDkr8O7KyvPTNRun0agpilqFic+k+VbmaegpGY3WOFB9boOrB5gaFY1VBABON1vBfnnUDsvmc04nTvGdrkbuNK/p57qD9+OKmQyvUhm2F+VOjYB+DBjdlN00JKGS11AMgEWe1VCoOJpiE0QBOCKBwibaigwlDUcwn40DCXGpjJB3fQ4tdEiwHpts5u3qEZn37J44A6QYbwMJr8oD/T2mfCj0NzTDIlbiceGWUFmrqfz0QS7VI+PAgZ2NJimTZLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAVpD8DmgZ7YILidp9jwif7VeS9c5dKf6Uf0RERgXKU=;
 b=aBxOrdRuEuhAbchjGlRA0tyCWKuyQnGXGIsiutXDVZeajG3YSH5SApo18h6ptu9dy7Kj1MykdVOgaMxstOry0qPX7t/PrcJ9gB8NWj7QdqselHDuTSV9k7aNEimsswfE6mYXdi7Z9ustd7HiYXhe5f6/labfcz16xvTMbITXS5M=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN0PR11MB5709.namprd11.prod.outlook.com (2603:10b6:408:148::6)
 by CO1PR11MB4852.namprd11.prod.outlook.com (2603:10b6:303:9f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 08:32:18 +0000
Received: from BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c]) by BN0PR11MB5709.namprd11.prod.outlook.com
 ([fe80::ad31:3f30:20b8:26c%6]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 08:32:18 +0000
Content-Type: multipart/alternative;
 boundary="------------FZj1rL0apvo4HamDxGV4ySU4"
Message-ID: <a4938fa3-f92b-4eb0-9f88-f5d3899427d0@intel.com>
Date: Sun, 22 Nov 2026 14:02:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/3] drm/xe/vram: don't let firmware-confirmed
 permanent bad pages decay back in
To: Tejas Upadhyay <tejas.upadhyay@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <himal.prasad.ghimiray@intel.com>, <matthew.brost@intel.com>
References: <20261112124329.2960272-5-tejas.upadhyay@intel.com>
 <20261112124329.2960272-7-tejas.upadhyay@intel.com>
Content-Language: en-US
From: "Yadav, Arvind" <arvind.yadav@intel.com>
In-Reply-To: <20261112124329.2960272-7-tejas.upadhyay@intel.com>
X-ClientProxiedBy: MA5P287CA0212.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::9) To BN0PR11MB5709.namprd11.prod.outlook.com
 (2603:10b6:408:148::6)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR11MB5709:EE_|CO1PR11MB4852:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a7fce7-eda7-4a1a-2c25-08df48731e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009221227099003|261009223327099003|261009223027099003|261009221727099003|261009220027099003|8096899003|4143699003|10067099003|11063799006|56012099006|261102123227099003|261102130727099003|261028144727099003|261026140227099003|261026121527099003|261021123027099003|261021121427099003|261022105027099003|261022075727099003;
X-Microsoft-Antispam-Message-Info: 6ZI4OvHu6kSYzFuG4GK3i/6zOwBYAMUlus0ZKItnCWG4o5/BZujL6hp8KPVcBTHT3sNUt5CNfJhKB4KkRsZPUkCtkQxcqAVxdp0q6zYp9E1tCano/IuzLfLSnvrO2pIhjXSb0/hz0o9DDXmsPowwerJhuRHswkM9GLr21SMkraIR9C3j0+hmhEuAfwie8oMbYqfdnJmmn9uh+meUX8tvTj4RkUtmN30v5+ZkFLIAkUU2N5WF9nna82bkEJ/EZ/pFxpv4pr1V3nyfxwbsSffHcnE8ANmQ6pm+lzq7CfcF6hdnfBf0riLCuci8ULdD7kBT+TNrjNAgkpuJTshvBEGiM0bx4Vc8H1Db4icWPvsRQv2b6gtecYPIb/eCx7CbXezwmRULNoFLrIar3+O8NeU8aCFaUgR/+gMj014VUsd64wzGdoimoZ/g1mherHipmxxdXQvSHfxgfaFVeGn8RPZZ2ZZmgAwFmNft15phV/4aXea33WfESqyVIbnClrUcuoH7o+puOwoXSMPErDNVFs5LBEEKOZDhDS4r7m1N1nNSO7Fs0/KNcIPI2+Y5S7bWJjX2R9+t13Q8n6kSR5jckJceiOpE7LgpsjLIbemWAiTQs5trTG8A5maX3QGVF4jxHUly4yYR3Ik0IKa+WLRolsUWemRHFgXw0GQ/Ra0aXOfDMHI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5709.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009221227099003)(261009223327099003)(261009223027099003)(261009221727099003)(261009220027099003)(8096899003)(4143699003)(10067099003)(11063799006)(56012099006)(261102123227099003)(261102130727099003)(261028144727099003)(261026140227099003)(261026121527099003)(261021123027099003)(261021121427099003)(261022105027099003)(261022075727099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWVjTmI0VEdaUmVxU3dmM0JiMU9SaVlHanFlT3F3dnFmbnpFaE11eGc5YURN?=
 =?utf-8?B?aHp3OWQ2ckFSSWk0YUt0ZmxqM1V6NHZDeUl0TFdHTkIwSGRuNndiUlpISElu?=
 =?utf-8?B?MWFJWUkvdlJkK29sNE1KQWtDOStjaUhMUnFmYXlhN1F3QzBQTUloOS9OdGZi?=
 =?utf-8?B?MEpUUlVoZllyK1I0Wk5ib3ZuTVJ3YytJRlJvZ3hXeWRFeE1iRXhWWVBCaEEw?=
 =?utf-8?B?cFJiVFMzTWV3OTVnVm9uYnhPVkpxaW9UOEo5QlJEN2d5OUxiUFlpRXN4YWNY?=
 =?utf-8?B?MFhSeEwwN0xwZ3BKV3BLVlovSGFoM2ZXbktqVHI3SG5RRnZSSlpRaEdqejFV?=
 =?utf-8?B?SC9ZQkZFd1dmNUZWc1Q2dXZQTEVuQ0JIT0s5aEJiZ0RXQUpNaTZvUDRDM2pK?=
 =?utf-8?B?ZXBWQjVYV1g1NWl4b2hvNmdwTVVSTUQzVjhCL0lXMmlhK0VoN01Jck84KzEw?=
 =?utf-8?B?ZGJrdHl2TS8rQ2g0dGlQTlg4TTluZ0tnRk5lbUJkZjVjcFlDRGF1UWRVRjQ2?=
 =?utf-8?B?S0VQVU54V0E0emlYdkIxbTZxbGJyQ3YyZlpzYjJTS2VKYlFRNnpCUFo4bGhM?=
 =?utf-8?B?UlNsMUVjNkh0WXhhMTBhUG9kaGxNL1lCVHRjbC8wdUp6a1FjcmlUeTVPMFpV?=
 =?utf-8?B?SWtmeDNpYWZ2T3UxM0drcUt3cnVSK2tGWk91ZUM2RG1MSXN6aUY2cExMeHYr?=
 =?utf-8?B?aENOZG4xR3RmSlVjd1hmMzVlOGlHQ2lRNytadnl2dklxRWFidjFlRWlHaXM2?=
 =?utf-8?B?NldTcWhXY0d5RWFaMWN2RURGYVdYZm1DNmxIdlZiaVZ5Qy94elZnWjltQ1Jk?=
 =?utf-8?B?MmZURTVTZEVEQjV5cklzWU5TUE1aZTNpMTRkeWduUlNwTnNidVpFOCt4cGti?=
 =?utf-8?B?UUNKTzFSVGV6NkdKeUU0dkE1SnlwT3h0VSszdG9zZ2FLdXpSanJ0MXJaN3M4?=
 =?utf-8?B?NWpDVVJLRlVNQUFrQXN2M0RKZEg1QTFYblJ3QnluTzIzSXAwLytJL0U0WG9u?=
 =?utf-8?B?LzFSU3hlVEdyN1RwKytwRkZpZTBwSDdLbzdjR25XcWZFZjg4YVJlMERUdml6?=
 =?utf-8?B?dDROcXJLN0tWUG50VFlDcStuWUZCYmNKbkF3cnUwd3JJclBscVRSd3dZY2xT?=
 =?utf-8?B?UGpJNzJXVkUwSVN4QkszQWpTNnNJd0poYi84UmgzZ2tFcCtnUCtOVlBsTnR6?=
 =?utf-8?B?NVBUaUtOOW5ucUJzdUJ2TEpBNnZrZVJGaE04TWphUkVMdmxtZ2tUcGhGWFVv?=
 =?utf-8?B?TjlZaVc5Uy9aSmlkL1pocmtQMHB5NEc0cnQyS0pJSHg2ZGtrQnFSQTVrY3VE?=
 =?utf-8?B?ZmtsQytvQkFESGlsYTZxS1FEWUpVRGdkT1BPckdyL1Y2dzFaTHUrKzkwYlVw?=
 =?utf-8?B?K2V2NDdLV05Nano3R1EzeUMvOXFkYmJRNldPelBZTGZTakZ6TTB4Nll5U3BW?=
 =?utf-8?B?NGJTeGRlVTUvcjhnaHQya2ZkaXRlcUxqeVhjVFR4KzQ1UVBCWnVLR3VXZmNI?=
 =?utf-8?B?TDUvRmhTbFFVT3IvVVc4dEpBVEZPZHUvTmZ6dEs0M1Z0RkxDekxRbENlOFM1?=
 =?utf-8?B?RFA0ckRyelNDdEtWbkhmc1UvdmpCbHhOT2tVd20xZGNvYVRkdzY0UlpGZzZZ?=
 =?utf-8?B?WTl3SUNXMytmdnViajBGSlkxOWdnOEl0QVB3OGJ1T2NDM1YrakZvVGVybUIy?=
 =?utf-8?B?RGF4R1NCNndHRG92NS9kcllIRHRpZ0RQejMxNXNrK1VnRVNYc1dnOHlqdUpW?=
 =?utf-8?B?WXNJWmpMb0xBcHJ6RGtoYk1FdlltdjlaVjVDVURVTVR4b2doQWZmeHFENFBN?=
 =?utf-8?B?RnltdEJqM2h1QzVyVGFoY0lRQnVHbHkwRXNKRWkwcEhCejV1em9tSzlsdktw?=
 =?utf-8?B?NFdmblRQNHlTUzRYUXZ2a3FQM2lxU3RmQWQzSFhaWGhsV282TnpSb3prSm9Q?=
 =?utf-8?B?Tm82R2tEYnVodFhVOEhZRGRqTVpmMlRvS3QrVCt4d1BjTk51SUo3KytkZG8r?=
 =?utf-8?B?UVV2UjB3MFFzbEV2V3VGSE9sNkdMWTV0T1o4aXF5S3FZaFNITkVEelNaV2pR?=
 =?utf-8?B?S05KNWhUYUlPQy8xRVc1aGkyL3hhellMYWFSS0llUE5oUUNTOExTWG90WU5y?=
 =?utf-8?B?bllJNkF4WGNrc0NTazZyUVF1VGhDVmNiZ2tXV0lQU3ZLR0UvaGsvUXJ6S2ZV?=
 =?utf-8?B?T2dHbU9rSURXSW5vS2wydlBmRm1talpCOXd1UG81WGpVMDNGN1JwWHhOSWFp?=
 =?utf-8?B?d0lRT2RLUlViT2I2ZUM1OGt2L0NodDMwdEhRQnlKWnNvN0hBeXlxbGx5UEhG?=
 =?utf-8?B?NlVLaGVPRTEvNUpKbFh3WS9HRHJEVHplR1hXc09HbUZkTmEwNmtoUT09?=
X-Exchange-RoutingPolicyChecked: MHgLAVa0qSVBA+oiX9cZAnxAo8zQ4XEUO5edD7rNxcGKly0URRHQGxR5PsymKORnI9Im2Ahkh+Tn0d3Bv1uxa9m20/ZtlB6G2jNopfKueGiUbJTauUnIA3J9lOl8ir7vFNjelLjxxpOyVLAIuiyq3t1Q2enAn4DXZolNfeU9Zrc1QwRUmUeNLyPGkszbuystmirXQrgKKKTlqZswN74r8Fkpo/1Mo/ZTUqvDHKS+FkowEWTcqnfoVvVmzxhgAksWfDq61AX7372NTCYrX+/40CBpW6eRyy1v+BNmeLUYRjbNIr8/eRMxcKLnobK4rEESIp+SauZ75bZmwag+fTILTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a7fce7-eda7-4a1a-2c25-08df48731e47
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5709.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 08:32:17.9870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiBihKw8fdoGlqSPl0vls8giHrZ8e0X8GHzyMzh6I2VdLXT8aAfKS2lhiM5RAEY/RB9IFfp12v4c5tJuVmjvQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4852
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------FZj1rL0apvo4HamDxGV4ySU4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12-11-2026 18:13, Tejas Upadhyay wrote:
> get_offline_list() reloads pages from firmware's non-volatile permanent
> storage at probe time -- these are pages already confirmed bad across a
> prior boot, not a fresh first-time report. The reservation path always
> marked new entries XE_PAGE_OFFLINE_SOFT regardless of origin, making
> these permanently-bad pages eligible for the SOFT-offline decay timer
> and silently reinstating known-bad memory back into the allocator once
> the decay window elapsed.
>
> Thread a 'permanent' flag from handle_page_offline() (derived from the
> existing notify_fw distinction: get_offline_list() calls with
> notify_fw=false, live/queued HW reports call with notify_fw=true) down
> through xe_ttm_vram_handle_addr_fault() to the reservation path, so
> these entries are created directly as XE_PAGE_OFFLINE_HARD and are
> never eligible for decay.
>
> The two debug/test fault-injection call sites (xe_ttm_vram_inject_fault(),
> xe_debugfs.c's inject_mempage_offline_trigger()) pass permanent=false,
> preserving existing first-time-report test behavior.
>
> LGTM.
> Reviewed-by: Arvind Yadav <arvind.yadav@intel.com>
> Signed-off-by: Tejas Upadhyay<tejas.upadhyay@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
>   drivers/gpu/drm/xe/xe_ras.c          |  7 ++++++-
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 17 +++++++++++------
>   drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
>   4 files changed, 19 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index e59d4964d811..fb10a3ed7fc6 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -119,7 +119,7 @@ static ssize_t inject_mempage_offline_trigger(struct file *f,
>   		return xe_ttm_vram_inject_fault(xe) ?: size;
>   
>   	/* User provided PFN - convert to DPA and inject */
> -	return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT) ?: size;
> +		return xe_ttm_vram_handle_addr_fault(xe, pfn << PAGE_SHIFT, false) ?: size; } static const struct file_operations 
> inject_mempage_offline_fops = { diff --git 
> a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c index 
> 2c01c183d02b..b57ff3dba279 100644 --- a/drivers/gpu/drm/xe/xe_ras.c 
> +++ b/drivers/gpu/drm/xe/xe_ras.c @@ -332,7 +332,12 @@ static int 
> handle_page_offline(struct xe_device *xe, u64 page_address, bool noti 
> addr = ALIGN_DOWN(page_address, PAGE_SIZE); - ret = 
> xe_ttm_vram_handle_addr_fault(xe, addr); + /* + * Pages sourced from 
> firmware's permanent (non-volatile) list are + * already confirmed bad 
> from a prior boot (notify_fw == false); mark + * them HARD so they're 
> never eligible for decay-based reinstatement. + */ + ret = 
> xe_ttm_vram_handle_addr_fault(xe, addr, !notify_fw); /* * Handle 
> return code from address fault handling function: diff --git 
> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c 
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c index 
> ed0ca5f2b144..07360ab7b072 100644 --- 
> a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c +++ 
> b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c @@ -837,7 +837,8 @@ static 
> struct xe_bo *xe_ttm_vram_block_owner_get(struct xe_device *xe, } 
> static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 
> addr, - struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm) + 
> struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm, + bool 
> permanent) { struct xe_ttm_vram_offline_resource *nentry; struct xe_bo 
> *pbo_to_put = NULL; @@ -859,7 +860,11 @@ static int 
> xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr, 
> INIT_LIST_HEAD(&nentry->blocks);
>   		nentry->status = XE_PAGE_RESERVE_PENDING;
>   		nentry->addr = addr;
> -		nentry->mode = XE_PAGE_OFFLINE_SOFT;
> +		/*
> +		 * Pages reloaded from firmware's non-volatile permanent list are
> +		 * already confirmed bad by a prior boot; never let them decay back in.
> +		 */
> +		nentry->mode = permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_SOFT;
>   		nentry->last_seen = jiffies;
>   
>   		if (block) {
> @@ -900,7 +905,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr,
>   			}
>   			++vram_mgr->n_offlined_pages;
>   			list_add(&nentry->offlined_link, &vram_mgr->offlined_pages);
> -			if (vram_mgr->decay_interval_jiffies &&
> +			if (!permanent && vram_mgr->decay_interval_jiffies &&
>   			    !delayed_work_pending(&vram_mgr->decay_gc_work)) {
>   				schedule_delayed_work(&vram_mgr->decay_gc_work,
>   						      xe_ttm_vram_decay_gc_period(vram_mgr));
> @@ -986,7 +991,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_region(struct xe_device *xe, u
>    * pending if the blocks backing it could not be freed immediately; the
>    * reservation is then completed from xe_ttm_vram_mgr_del().
>    */
> -int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent)
>   {
>   	struct xe_ttm_vram_mgr *vram_mgr;
>   	struct xe_vram_region *vr;
> @@ -1023,7 +1028,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
>   	}
>   
>   	/* Reserve page at address */
> -	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm);
> +	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr->dpa_base, vram_mgr, mm, permanent);
>   }
>   EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
>   
> @@ -1074,7 +1079,7 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
>   		 * test-only path.
>   		 */
>   		if (found)
> -			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base);
> +			return xe_ttm_vram_handle_addr_fault(xe, addr + vr->dpa_base, false);
>   
>   		cond_resched();
>   		if (addr == 0)
> diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> index d77f067d197b..3c1f1f8b8061 100644
> --- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> +++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
> @@ -31,7 +31,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *man);
>   u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
>   void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
>   			  u64 *used, u64 *used_visible);
> -int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
> +int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool permanent);
>   int xe_ttm_vram_inject_fault(struct xe_device *xe);
>   
>   static inline struct xe_ttm_vram_mgr_resource *
--------------FZj1rL0apvo4HamDxGV4ySU4
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 12-11-2026 18:13, Tejas Upadhyay
      wrote:<br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:20261112124329.2960272-7-tejas.up=
adhyay@intel.com">
      <pre wrap=3D"" class=3D"moz-quote-pre">get_offline_list() reloads pag=
es from firmware's non-volatile permanent
storage at probe time -- these are pages already confirmed bad across a
prior boot, not a fresh first-time report. The reservation path always
marked new entries XE_PAGE_OFFLINE_SOFT regardless of origin, making
these permanently-bad pages eligible for the SOFT-offline decay timer
and silently reinstating known-bad memory back into the allocator once
the decay window elapsed.

Thread a 'permanent' flag from handle_page_offline() (derived from the
existing notify_fw distinction: get_offline_list() calls with
notify_fw=3Dfalse, live/queued HW reports call with notify_fw=3Dtrue) down
through xe_ttm_vram_handle_addr_fault() to the reservation path, so
these entries are created directly as XE_PAGE_OFFLINE_HARD and are
never eligible for decay.

The two debug/test fault-injection call sites (xe_ttm_vram_inject_fault(),
xe_debugfs.c's inject_mempage_offline_trigger()) pass permanent=3Dfalse,
preserving existing first-time-report test behavior.

LGTM.
<span class=3D"reviewed-by" style=3D"box-sizing: border-box;">Reviewed-by: =
Arvind Yadav <a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:arvind.yadav=
@intel.com">&lt;arvind.yadav@intel.com&gt;</a>
</span>
Signed-off-by: Tejas Upadhyay <a class=3D"moz-txt-link-rfc2396E" href=3D"ma=
ilto:tejas.upadhyay@intel.com">&lt;tejas.upadhyay@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_debugfs.c      |  2 +-
 drivers/gpu/drm/xe/xe_ras.c          |  7 ++++++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c | 17 +++++++++++------
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |  2 +-
 4 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugf=
s.c
index e59d4964d811..fb10a3ed7fc6 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -119,7 +119,7 @@ static ssize_t inject_mempage_offline_trigger(struct fi=
le *f,
 		return xe_ttm_vram_inject_fault(xe) ?: size;
=20
 	/* User provided PFN - convert to DPA and inject */
-	return xe_ttm_vram_handle_addr_fault(xe, pfn &lt;&lt; PAGE_SHIFT) ?: size=
;
+		return xe_ttm_vram_handle_addr_fault(xe, pfn &lt;<a class=3D"moz-txt-lin=
k-rfc2396E" href=3D"mailto:PAGE_SHIFT,false)?:size;}staticconststructfile_o=
perationsinject_mempage_offline_fops=3D{diff--gita/drivers/gpu/drm/xe/xe_ra=
s.cb/drivers/gpu/drm/xe/xe_ras.cindex2c01c183d02b..b57ff3dba279100644---a/d=
rivers/gpu/drm/xe/xe_ras.c+++b/drivers/gpu/drm/xe/xe_ras.c@@-332,7+332,12@@=
staticinthandle_page_offline(structxe_device*xe,u64page_address,boolnotiadd=
r=3DALIGN_DOWN(page_address,PAGE_SIZE);-ret=3Dxe_ttm_vram_handle_addr_fault=
(xe,addr);+/*+*Pagessourcedfromfirmware'spermanent(non-volatile)listare+*al=
readyconfirmedbadfromapriorboot(notify_fw=3D=3Dfalse);mark+*themHARDsothey'=
renevereligiblefordecay-basedreinstatement.+*/+ret=3Dxe_ttm_vram_handle_add=
r_fault(xe,addr,!notify_fw);/**Handlereturncodefromaddressfaulthandlingfunc=
tion:diff--gita/drivers/gpu/drm/xe/xe_ttm_vram_mgr.cb/drivers/gpu/drm/xe/xe=
_ttm_vram_mgr.cindexed0ca5f2b144..07360ab7b072100644---a/drivers/gpu/drm/xe=
/xe_ttm_vram_mgr.c+++b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c@@-837,7+837,8@@=
staticstructxe_bo*xe_ttm_vram_block_owner_get(structxe_device*xe,}staticint=
xe_ttm_vram_reserve_page_at_addr(structxe_device*xe,u64addr,-structxe_ttm_v=
ram_mgr*vram_mgr,structgpu_buddy*mm)+structxe_ttm_vram_mgr*vram_mgr,structg=
pu_buddy*mm,+boolpermanent){structxe_ttm_vram_offline_resource*nentry;struc=
txe_bo*pbo_to_put=3DNULL;@@-859,7+860,11@@staticintxe_ttm_vram_reserve_page=
_at_addr(structxe_device*xe,u64addr,INIT_LIST_HEAD(&amp;nentry-">&lt; PAGE_=
SHIFT, false) ?: size;
 }
=20
 static const struct file_operations inject_mempage_offline_fops =3D {
diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index 2c01c183d02b..b57ff3dba279 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -332,7 +332,12 @@ static int handle_page_offline(struct xe_device *xe, u=
64 page_address, bool noti
=20
 	addr =3D ALIGN_DOWN(page_address, PAGE_SIZE);
=20
-	ret =3D xe_ttm_vram_handle_addr_fault(xe, addr);
+	/*
+	 * Pages sourced from firmware's permanent (non-volatile) list are
+	 * already confirmed bad from a prior boot (notify_fw =3D=3D false); mark
+	 * them HARD so they're never eligible for decay-based reinstatement.
+	 */
+	ret =3D xe_ttm_vram_handle_addr_fault(xe, addr, !notify_fw);
=20
 	/*
 	 * Handle return code from address fault handling function:
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_t=
tm_vram_mgr.c
index ed0ca5f2b144..07360ab7b072 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -837,7 +837,8 @@ static struct xe_bo *xe_ttm_vram_block_owner_get(struct=
 xe_device *xe,
 }
=20
 static int xe_ttm_vram_reserve_page_at_addr(struct xe_device *xe, u64 addr=
,
-					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm)
+					    struct xe_ttm_vram_mgr *vram_mgr, struct gpu_buddy *mm,
+					    bool permanent)
 {
 	struct xe_ttm_vram_offline_resource *nentry;
 	struct xe_bo *pbo_to_put =3D NULL;
@@ -859,7 +860,11 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_=
device *xe, u64 addr,
 		INIT_LIST_HEAD(&amp;nentry-&gt;</a>blocks);
 		nentry-&gt;status =3D XE_PAGE_RESERVE_PENDING;
 		nentry-&gt;addr =3D addr;
-		nentry-&gt;mode =3D XE_PAGE_OFFLINE_SOFT;
+		/*
+		 * Pages reloaded from firmware's non-volatile permanent list are
+		 * already confirmed bad by a prior boot; never let them decay back in.
+		 */
+		nentry-&gt;mode =3D permanent ? XE_PAGE_OFFLINE_HARD : XE_PAGE_OFFLINE_S=
OFT;
 		nentry-&gt;last_seen =3D jiffies;
=20
 		if (block) {
@@ -900,7 +905,7 @@ static int xe_ttm_vram_reserve_page_at_addr(struct xe_d=
evice *xe, u64 addr,
 			}
 			++vram_mgr-&gt;n_offlined_pages;
 			list_add(&amp;nentry-&gt;offlined_link, &amp;vram_mgr-&gt;offlined_page=
s);
-			if (vram_mgr-&gt;decay_interval_jiffies &amp;&amp;
+			if (!permanent &amp;&amp; vram_mgr-&gt;decay_interval_jiffies &amp;&amp=
;
 			    !delayed_work_pending(&amp;vram_mgr-&gt;decay_gc_work)) {
 				schedule_delayed_work(&amp;vram_mgr-&gt;decay_gc_work,
 						      xe_ttm_vram_decay_gc_period(vram_mgr));
@@ -986,7 +991,7 @@ static struct xe_vram_region *xe_ttm_vram_addr_to_regio=
n(struct xe_device *xe, u
  * pending if the blocks backing it could not be freed immediately; the
  * reservation is then completed from xe_ttm_vram_mgr_del().
  */
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr)
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool per=
manent)
 {
 	struct xe_ttm_vram_mgr *vram_mgr;
 	struct xe_vram_region *vr;
@@ -1023,7 +1028,7 @@ int xe_ttm_vram_handle_addr_fault(struct xe_device *x=
e, u64 addr)
 	}
=20
 	/* Reserve page at address */
-	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr-&gt;dpa_base, vram_=
mgr, mm);
+	return xe_ttm_vram_reserve_page_at_addr(xe, addr - vr-&gt;dpa_base, vram_=
mgr, mm, permanent);
 }
 EXPORT_SYMBOL(xe_ttm_vram_handle_addr_fault);
=20
@@ -1074,7 +1079,7 @@ int xe_ttm_vram_inject_fault(struct xe_device *xe)
 		 * test-only path.
 		 */
 		if (found)
-			return xe_ttm_vram_handle_addr_fault(xe, addr + vr-&gt;dpa_base);
+			return xe_ttm_vram_handle_addr_fault(xe, addr + vr-&gt;dpa_base, false)=
;
=20
 		cond_resched();
 		if (addr =3D=3D 0)
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_t=
tm_vram_mgr.h
index d77f067d197b..3c1f1f8b8061 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -31,7 +31,7 @@ u64 xe_ttm_vram_get_avail(struct ttm_resource_manager *ma=
n);
 u64 xe_ttm_vram_get_cpu_visible_size(struct ttm_resource_manager *man);
 void xe_ttm_vram_get_used(struct ttm_resource_manager *man,
 			  u64 *used, u64 *used_visible);
-int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr);
+int xe_ttm_vram_handle_addr_fault(struct xe_device *xe, u64 addr, bool per=
manent);
 int xe_ttm_vram_inject_fault(struct xe_device *xe);
=20
 static inline struct xe_ttm_vram_mgr_resource *
</pre>
    </blockquote>
  </body>
</html>

--------------FZj1rL0apvo4HamDxGV4ySU4--
