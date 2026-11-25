Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE2C606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 05:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BJamtKb2;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=OCC143KK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20C1110E7C6;
	Wed, 25 Nov 2026 05:19:51 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9FB110E7C6
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 05:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795583980; x=1827119980;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=T1ZqjWoCo+DPWND+ZCgr+cD+z9wH40lNYBa+ZDPj8vs=;
 b=BJamtKb2XwxPzC0UPK/yXdd99OpFFoda/lYbLKCIzFYNEL9XUsAgNNIF
 bqsn2ISl/fG2TPsIzT3J2Eepu99vq3EwlFH1PAoQyY/wSg5lqKAQm3Q+k
 kmVhKbLxVI8D0QkwiSrBLoSjf+OEO3B22KBKC9M3IQeNckCULQxlKAFeQ
 o+8quD/0CeMynEo0UQgQS6bFxfcCdJrLXE9w596YS98/cOhKGbK4lvZT/
 06Zq/tNTiVJzHr3YfjjIo3GXzdSPKjPkvlqVRGAgVgZzUKzIZeWtWD8rg
 MvuD3ZTaPIswjN9SqdhQfB4ap97XaUcW6YpxWlos6jZC0tlLYl/1lLc+0 A==;
X-CSE-ConnectionGUID: dYHJBYc7Qc+Mp2sFs2q44g==
X-CSE-MsgGUID: hqnpLvTfS8ecMuPWHflwhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4360388"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; 
   d="scan'208";a="4360388"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:19:39 -0800
X-CSE-ConnectionGUID: R9fMe8IUT1K1UQNSkKnscg==
X-CSE-MsgGUID: zb6r6w57QXCr7CdzKHcS2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208";a="11661038"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2026 21:19:39 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:19:38 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Tue, 24 Nov 2026 21:19:38 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.7) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Tue, 24 Nov 2026 21:19:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R4nE562o/BHpeesPXZ527DnmF4Ac6kXlV4JHpzsHtoYEnZo9MFMea4RiV+Thu7Y/w61L7ggEa9a0ZOJnY0RzZE/OT6r334f98sLcXFIzn0GmaO3h2o7s4plgLBGK2Su8JTt5biy2EYV7ezui1Kqv3JAjuUusnSuvzzxVq+7nhPOlpZhqvvdHTlPpu3pYktaTdTRXlV96+UA7uIV96AkCmtbT08g5XtASROHIRVa/mtCrwHouToV3ivV/Dz8+0eQL7lJyQZw7VXKSnVftNXMUwBvxmk0kK3271QW6bHKJ6IDF4w+1oyLyLdMBZAXj4+jGAR1T0qZwP3PM9kgiVYQhPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPAO8mCuta65pHsic8ylp7OJIn51TPtIzIGDl6hpoSc=;
 b=dHwBABiMWh3BDY1Z1Rp8nWwD6WjHdpvRl7oeQi3S687e62fEJnx6XoWDVbWUXEIs8v66N6TNhHtp7kabldWSFKd4DPkJEJtt5+BOUOkKueQn9tEYvTfaiuouhlg7PPESltDBSdybRYAyTYLRSggl0KmvOh6qfAVKR+HI/RG1ut2rxbOOuxDKj/j50Qr3vEdy2OyOo/XFbvAtzia32DrCrl2hBkqNkJhiAqjcmbYFBVEYYh6GUk6a24GVz+i0CUdxa4pTC7wnGybXREcRHpc4GuoIAT2v0ntDDOFpgAkn81i/N5OGO784g/XVGVskUt3CXaf1uLn6VoIH1UZ4w6d0ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPAO8mCuta65pHsic8ylp7OJIn51TPtIzIGDl6hpoSc=;
 b=OCC143KK6yL7rvOqpfFhpMRnlsQlAFjL54hbNS3tBsaYgCuQfhUdGrHM05gEvd/0xydQWblTM1+fbNVyPnGlp9Mpm3qTxiSt2W2NuhyHOlE68L549pJEaD7lS6KSdwcJhk4InBWcDBimyo4p/0y7odEQLfgeZAf/S7PgESs0I/o=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CY8PR11MB7876.namprd11.prod.outlook.com (2603:10b6:930:7d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.4; Wed, 25 Nov
 2026 05:19:35 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0662.001; Wed, 25 Nov 2026
 05:19:35 +0000
Message-ID: <1a0d36ce-a7aa-460d-ac8a-5a792c280193@intel.com>
Date: Wed, 25 Nov 2026 10:49:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Handle SPI out of flash error
To: Soham Purkait <soham.purkait@intel.com>, <intel-xe@lists.freedesktop.org>, 
 <riana.tauro@intel.com>, <anshuman.gupta@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <rodrigo.vivi@intel.com>
References: <20261123070221.1611306-2-soham.purkait@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261123070221.1611306-2-soham.purkait@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0170.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1af::7) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CY8PR11MB7876:EE_
X-MS-Office365-Filtering-Correlation-Id: 87332645-fb40-4934-fd57-08df4ab3b1f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|261009223027099003|11063799006|56012099006|261022113327099003|261102123227099003|10067099003|261022105027099003|261021121427099003|261028144727099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Fq5kxSB/sRbo1/4wuAXDbgFlcbVheVmNy4uembdY+UtzsWqSI4pG4KRTOUGFT/1/qXjeGh5QFosyiEeCvyv3+dBo0ws8rT6phgBJ4VhmUI/ZQyDAIeqceSjAHU9ptLIedoqQxxmuD0mj5xq3Yf+B7UT7S1d5diqnvGcTJp927KVreFCvssg/QfiLHhHPJ3i2hfP0+bn8tpLzYwWPSa+N9g5dVmLK9rnz3xF5CtDDvCTQXWyGqQmB0TX00VWb/DwVeqRhtV2thozouD+IogkUfaQG28WaJBtMpZo78Pv5FpoTPG/W9IhAC8ShjrJm2Ot9JwRA2hGeT74+JhD6jHn0CINKK9V8cAWZfwPsfga631gOUvpMhHWXZzshKle4+Wo4/7FTbMVG+nMXIwBXOPo7CI921xuIh7eojWPb8HYi2qw89VbMhCR18oDY0Mfc22lAnfDPlJ+RepZsDCyg5MvYP0zfmEbdmlD0cZNCQxeQz6k8JOD8NUhDxTPH9A2JDVLDlsHgCTWqOhUdkdKjlv7FZZG0Vf4jd91VjKMQU+D+IwlZCLLXzdnvWWlSRsavTOl0MZ4O5NVwLE3WUKyEn4xnV3rEmFOv+13noVk1Mz0F+iA8xTRGBDOc2u5eLK+siwzDDsnH7BnyvO7xwrDL/gB+IvjYQyjftyh/CSAtSlURVH8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(261009223027099003)(11063799006)(56012099006)(261022113327099003)(261102123227099003)(10067099003)(261022105027099003)(261021121427099003)(261028144727099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aExOSy95dFlsNDFrT3dRWVMvR1h3UUhDYVhCdHJnQ2tWVnZyT0oxR1RWYmQ5?=
 =?utf-8?B?VkFVbzJHdFp5NktlUVlXM2grVE4vVWZzWHhkYlJkemgvQjRMcEM4L3E1UmJw?=
 =?utf-8?B?cDJDc3g5N3dENzdSRUZVK0RjTXRYMnlLSmU1M1Z3S3VMUS83Qmp4WDdrV0hx?=
 =?utf-8?B?cTA3OEZnSWJ4dElTT0FhcGNSWmcrcEJ4ejNxbW9idzBEbjdpZnVVOUNBeXhB?=
 =?utf-8?B?ejBvQXQrK0g3NjQ3NGwvaUtBS0RlVmE4eEdzMVNFSW1mL2JXaDBtaVUwdnNa?=
 =?utf-8?B?NzNVSFl0S2poT1N1T29Id2Y2by9ZckFOdm9zYzVYMklaK01UM1laaWZjdUNS?=
 =?utf-8?B?eE9tMkwrcjlZbERvVlJTQXVPeHVKVFZpQTNKanlzaTQ1cFE2bFJTRGVnMjNh?=
 =?utf-8?B?UW5OWlBNZGtVblBWbVNsWXdrNFA4VUgxeDRPYjhDQm1CeTBmNHkyY3FvOG9C?=
 =?utf-8?B?NCtBajNVYWxBL085WVlGU3QveFJzbThOSTk2eGNCTDB4S2Y3NDJybEtrbHJn?=
 =?utf-8?B?NnZiS3ZCKzBqcGM2T2J4ZVJjTkw4dHlYTEpoWHJMT01vUTdQcnV1cmo3ZjFl?=
 =?utf-8?B?MWk3dlVJYnJZb1dDNWZCWGdFOVdIcEhyT3hZaG03Vk9BUnVRdzB2VnUwK1pp?=
 =?utf-8?B?dFc4SkNVV2xkWkIxWktTa2tnTEx0YjU5cTJnK0dlWXlqZHl4dDlPOWVJU2ZE?=
 =?utf-8?B?eVVuWWJTVDU4KzJjQjVnakNETm5mYXp6TTJzLytFdThSWUpHSjhXVFkyQUhW?=
 =?utf-8?B?Vnl3ZmxsK21RaUk3MmJwbWgxU25acERSeHpKbmRSbE5vYWtIR0VHaUx0dGJR?=
 =?utf-8?B?QTIyQk1tS1hQNldIZWtWaVJsZlBzWld6djNwbEpzM2xKQzlQOXNMMzRPQ1BG?=
 =?utf-8?B?U1M1Q2ZGZUZoMnh2dkNOU3NwTXpMWUdRclJXelZEcm5sczlQcURDZncvSThO?=
 =?utf-8?B?RU4rTExDVHU2V2VjSUNId1VHTDhRSW5ySDgxelAxOWtnUTlyUlpUeUQ2WUUw?=
 =?utf-8?B?NDVHVFJYZC9KdndlYXlkWFViRUl4a1l5dVlhRDFScWVlb3FZbWE1Z2xjTlhl?=
 =?utf-8?B?R3VNWmZOUys1S0g4dHRBTTM5MGUyVVlYMXIybnBLdjFidHpDUGFaR2xjUyt3?=
 =?utf-8?B?eUpKZEhQaVhoOEkvQ3BHUnFOYjc3QXJLR3V3RnlHZk5HUzd5ZDhhVWh2K1Iw?=
 =?utf-8?B?OUEwWWhvS3c3OTdjQ1J2S05xWDU1cUNoUncxS2N5NDV4V1BmVkZGcjQ0T3J0?=
 =?utf-8?B?aU11bHNOY1dGblo4TGpKenR1MDlqZjdSZnNYSDhBRjQ4am1MajlnMU9zTmxT?=
 =?utf-8?B?UnlsVVB6cEtMSElZcEJyL2Q0azRyd3lrUktnR25JdTg3dk9RTWEzUDYwd2dV?=
 =?utf-8?B?M0lPcEFhY1ppNFRERDRicXBITFpmR3A5ZEZoMTdGdFROWWlBL1lBNkI3TVFq?=
 =?utf-8?B?dEtXVTV1cVdqNkk2ZG5uakNXMDRuZTlKelRYMkVHTHZRVEhOaE54ODJtSFV1?=
 =?utf-8?B?b2Z2bk5iVmJYaGNtbW1BQWFUckxKVmVMQlVsT0JGa3Qzc2luaFNNMjQ2Tllj?=
 =?utf-8?B?d2pueGZTZGR5aUZuQjdZRnhCWXZZNG1tZ3Y2YlBlNURUTTltbzdua1VFQmlz?=
 =?utf-8?B?MVg0c3pCYTNLMlJSWmRYeklmTzFST3I1eVYxamsyZXlWQ0F3QlhTQTAxem54?=
 =?utf-8?B?cGRPSGFHOG93Vy9BcmdJdnBhMWF0VFNoUWFSYXhCb0h3bWJKWFp4OVIzUGpr?=
 =?utf-8?B?aTZ5TGo4NWtGOEM2SmFyeDBiSkdwaGhXQVRBajg2RmFWbmJuZDg4bEk3eWFP?=
 =?utf-8?B?K01ydmVEWk16ajVIdjdpb0laVmRJQWl2UXpmQVZUOXFlY3k1dnBobjlJZmJz?=
 =?utf-8?B?Q1NUZ0NtbGVySE51dnRISzFwenk1eDBEeWU2bndVZDJndTZJNlRYSnpSamJQ?=
 =?utf-8?B?bGJrb0E2RUl4aWFZUVc3OVhLb3IvcW83QTZBYVFPWGkwK2x3NmNGdVFmWkxY?=
 =?utf-8?B?bmd0akhLMUYwdGxzQmZsK1NWVVluZFNzYmJCWk5Qd2ZQeE1SNGxMeGxWUE5S?=
 =?utf-8?B?a3Z6NzNkYlpCaDR6NUE3UFM4RjFPWTRoV1EzdmZPZ09QMkVTTG1URzZSckox?=
 =?utf-8?B?eDZ2VGordVpEZVhHTWxobHVIRzdkaklndGJpMmVNZWdQazVRQ1ZtM3orbzNu?=
 =?utf-8?B?d0F4akRHWlBrMndtRW9YcVZFR0NBS1ExcU00WDVQV2M4dmgrTzEwNDQvcVNH?=
 =?utf-8?B?RGh5Y3hPYit1MGIzVFMyWHp5WHg3ZEpQNjdDam1YSFcrSHBvT3djVnorMXBE?=
 =?utf-8?B?eWJmcDNLSGlUS1pydjJleUk0cjVKa1RtTWt1YnF2MG9hWFBUWkJYZz09?=
X-Exchange-RoutingPolicyChecked: PIpE4IxaF2aJjHX22Kr0yQzwLlk5cFZXqTgRCPguEx4MKUGRlam9px67j9pLW4bnPzv0F5v52Nlo64MLzEbAGFaiRqoj4gwcfkH77w6rmOviQyXicpLUvKYhkCOYu9R6DOULt9zVYl05ZDPQvFXmrmGBcQLfiH89GuL/KpGaWsDRfn6NIIPRareOx+dw3ad2VSuibXfsXyLXJ5ANz8TrxnrjAftFQotHSj7vXaWikRp73yRTKtt1IB6aFtnKDzs570I9Os+JPveqPXqzOEdc3Yor3H//41WizfqvsoWIm8kTWYaxdCzMD+KapKg/rx0uJA4JiPNzh8260Rv2cFXCww==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87332645-fb40-4934-fd57-08df4ab3b1f8
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 05:19:35.6398 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ItdAXWfH0JTTx/HjpmVfFvQpWf8UVbDptfgccfMWKR4SoUgoY3WFyc6QGZkGAxM7GpgiyuQh1XAqocegQIDVPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7876
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


On 23-11-2026 12:32, Soham Purkait wrote:
> Wedge the device with an unknown recovery method if Page-Offline returns
> OUT_OF_RESOURCES, or if the offline list is full at probe.
>
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_ras.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
> index 0fb891d00b36..76441858391d 100644
> --- a/drivers/gpu/drm/xe/xe_ras.c
> +++ b/drivers/gpu/drm/xe/xe_ras.c
> @@ -80,6 +80,7 @@ enum xe_ras_response_status {
>   	XE_RAS_STATUS_TIMEOUT,
>   	XE_RAS_STATUS_HARDWARE_FAILURE,
>   	XE_RAS_STATUS_INSUFFICIENT_RESOURCES,
> +	XE_RAS_STATUS_OUT_OF_RESOURCES = 0x9,
>   	XE_RAS_STATUS_MAX
>   };
>   
> @@ -226,6 +227,7 @@ static int ras_status_to_errno(u32 status)
>   	case XE_RAS_STATUS_HARDWARE_FAILURE:
>   		return -EIO;
>   	case XE_RAS_STATUS_INSUFFICIENT_RESOURCES:
> +	case XE_RAS_STATUS_OUT_OF_RESOURCES:
>   		return -ENOSPC;
>   	default:
>   		return -EPROTO;
> @@ -299,6 +301,11 @@ static int send_page_offline_cmd(struct xe_device *xe, u64 page_address,
>   	if (ret) {
>   		xe_log_err(xe, SYSCTRL, ret, "page offline command failed with status %u\n",
>   			   response.status);
> +		if (response.status == XE_RAS_STATUS_OUT_OF_RESOURCES) {
> +			xe_log_err(xe, SYSCTRL, ret,
> +				   "No space left in SPI flash for bad pages, manual intervention required\n");
Why sig id SYSCTRL? Sysctrl has completed the mailbox command.
> +			xe_wedge_declare(xe, 0);
> +		}
>   		return ret;
>   	}
>   
> @@ -504,8 +511,17 @@ static void get_offline_list(struct xe_device *xe)
>   	struct xe_ras_offline_list_response response = {0};
>   	struct xe_ras_offline_list_request request = {0};
>   
> +	struct xe_ras_state *state = &xe->ras.state;
> +
>   	process_offline_pages(xe, XE_SYSCTRL_CMD_GET_OFFLINE_LIST, &request, sizeof(request),
>   			      &response, sizeof(response), &response.common, false);
> +
> +	if (state->max_pages && response.common.total_pages >= state->max_pages) {
> +		xe_log_err(xe, SYSCTRL, -ENOSPC,
> +			   "Offline list full (%u/%u), manual intervention required\n",
> +			   response.common.total_pages, state->max_pages);
Same as above?
> +		xe_wedge_declare(xe, 0);

This is in probe path, shouldn't we propagate error and fail probe 
rather than wedge?

Thanks,
Badal

> +	}
>   }
>   
>   static void ras_usp_aer_init(struct xe_device *xe)
