Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35ED660A2616
	for <intel-xe@archiver.kernel.org>; Fri, 20 Nov 2026 07:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=agGtPvue;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=CxzpgVVw
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB0310E1D2;
	Fri, 20 Nov 2026 07:24:09 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 780D110E169
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Nov 2026 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795159439; x=1826695439;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zsxxX0beza9/+/Z4lAoLs5U2vrcObuppTRwfTRrLD3I=;
 b=agGtPvues0oCI+tyCdxmx9ihMVsRJ4QCI8gYjq9HbGRzU8WEC99tQdpk
 o9+6HciATAv4OR9RXFNfzFEH2PyQ0N2cwy1MLosALre1CHFAGa0rzL0PU
 xftsHGGnHRd5/jIda5hzNSw8OtYjNkBGU/wBfiitDk+uEnclsSSJ8bNKR
 ly6RosKSD4nEC+UhLjuodjSfPGuZ9qhtQXSxS3wA5tN9DMXWL/BN5oQwg
 7EAMOO7npIQqOCbQln7e/Zvz7GTTsWJPnppXvnvl/TLiIGY3zhGc0+tyS
 KeB6KM97lsddAFRb87bSI4S9voVsmFKF3B00B5tJKIZT8EhP5A/MOTJg7 Q==;
X-CSE-ConnectionGUID: 4/cvUtiCRACoGvjSELrj0g==
X-CSE-MsgGUID: NiU/vCPrTWu6FsMGTkr1Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3916664"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="3916664"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:23:59 -0800
X-CSE-ConnectionGUID: NZJpuleXSmqk00LtuZCFIw==
X-CSE-MsgGUID: bnCp9VtfQU+/8RuqwPg0Kw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; d="scan'208";a="11205848"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 23:23:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:23:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 23:23:57 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.48) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 23:23:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWvD7LByo72Ygt/v+R4LYKt0gUFhVExVJ+n5J6i7PlPKRuFly7Lz9CYRcded6wkxeiXKCeTk6bspst4cIb/7i3lfhGerjQH8ZfUXkXF9cEqej26qom9pIzRJ7oPqK0UKjWJ9GaIfaVgx4Yt1F7y8BHJkCbD8gGOMH+w5zJ7GzvZ6tbkGfajFD4AyJt4VPJykN0VtyW0qLQ/AC+14DV1z+YetrcprLvzJnpgUZnVptRmheprT//6Ruf64u11sb/Wdn1yaMzeTw802kKe1YZM+iISf42nYjM1yMtRkn6zwqCFo6BBqFU0fmR+0ssPMBDsDip12IhU+E1pVC+xRIgs+XQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zqfYgRjVclx67Z7Ln2/jbzVrHkwQ8fJA2Dr1bho8BnY=;
 b=Ltif2HBe4vP5FBjItVwToEFZImCfXSZ+nO1CJpaW/e4xUSvIDxJ4874bswfNgS61u71S9ChIY/J2U70r0cwYHSeWJ29BBFftANvQAjTOQBZc+JHavfQE6n5fut+E0DE8cg2YH2x7pI7BCMtlN0t4vM/QcOGiI2QZ+bsAwMMv+qsZpZc+fHQSVp/CL27GssAJVoqDS4DAVLjY5YorG0Qy5Xqjg7KFqlcIQoGubEFZW/yNyp+YubvtV1cBA8Um8OujFNKzXBQsxN5Dl163n3Z9RE92GF8alYuaqYmIRPfy0McKtRipQWMzHfL9sHMbuOzxhXLZlpP3iM1krok0WmpfNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zqfYgRjVclx67Z7Ln2/jbzVrHkwQ8fJA2Dr1bho8BnY=;
 b=CxzpgVVwENzrqEV843/a/Wc9VW3jyWTphBuucywagJJdzOshMcCUi0YlMJJ2BmMqAPqevn7GeVrFgrDqQ2ojo75gMhlz1DODhcaaG0tOOIQ9cnIOUqZaTB8P7x070hzsfuwPbnFDgRwIvn67GDRQyQ/8vJDBBpqgB4/y8AsXCSQ=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9205.namprd11.prod.outlook.com (2603:10b6:208:573::7)
 by MN7PR11MB170846.namprd11.prod.outlook.com (2603:10b6:208:5f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.12; Fri, 20 Nov
 2026 07:23:55 +0000
Received: from IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe]) by IA3PR11MB9205.namprd11.prod.outlook.com
 ([fe80::7a6a:5bf7:f1d9:dbe%5]) with mapi id 15.21.0615.013; Fri, 20 Nov 2026
 07:23:55 +0000
Message-ID: <e6ecfa7e-3949-4907-8676-3d39f9663df6@intel.com>
Date: Fri, 20 Nov 2026 12:53:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/8] drm/xe/oa: Use the drm device address_space for
 the OA stream fd
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <harish.chegondi@intel.com>
CC: <matthew.brost@intel.com>
References: <20261119002737.3899877-10-umesh.nerlige.ramappa@intel.com>
 <20261119002737.3899877-12-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: Shekhar Chauhan <shekhar.chauhan@intel.com>
In-Reply-To: <20261119002737.3899877-12-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0258.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::6) To IA3PR11MB9205.namprd11.prod.outlook.com
 (2603:10b6:208:573::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9205:EE_|MN7PR11MB170846:EE_
X-MS-Office365-Filtering-Correlation-Id: c636aee1-9d5d-4ccc-09ef-08df46d73be2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|6133799003|22082099003|18002099003|261022113327099003|5023799004|4143699003|11063799006|261022075727099003|56012099006|10067099003|261026121527099003|261021123027099003|261021121427099003|261009223027099003|261102123227099003;
X-Microsoft-Antispam-Message-Info: jql1XbJMK1sH/ajeNyVlTT/8ATwzXsku1iP8JuGs0Z/Xs/oitJeakn0kUsQ6LqLDi664VVCJAojTbn+fvqDEk4rk0UGjjLddabrSu2GaJctMPOWKS307Q7uotLyXGq1++ODw5vljOU2/5Vmz2lO5ZH4F6OVtekt0C3I5RRJPz27PwmXNExnzmwCu31Ac9x2eYj8VgAsHRRPwrP2LYsM3rh7R4OSOtSTfMktwm5SqiQY8ZmAthmWcmUMxFL3HV+OHthKCtuNR5zc+vcGNKTocLtF8mI2Ze0b9HJZOpRZxYj/jQ4XgGkABRuIoQFTllgSWHOT65PLB976imkkjLvWnhCAriiN6Jl0qg0x/UVocxTy4+kpHHvZrBYLdEdtbqr1iNSkbjOh/d0WjEBGFJv8raPmZaMOSb32z1EcffNkVm+dAQdUb9z16OaQMJUCqjhvCk/997sAtVTm3O2bgwpjiWssVFIZ0mjIJ1Wz5Kljwz/FqIIsmJNVyrH2dKjEvJDTmuSn1JX2tFp0VB3pTG9tdk0kqPlgR8ehLwLDLtikIGOlv5rpzQApKvXl/4ZxKYQLwV/ZBtVnDYKyO+LSsBJL5cYZfIkiRvUdh05/IxQHWd5PrmO1ePtsxl8g0N/NtizzcGGqD3wIQWtbz7MHp9GaRIyDdn6xiMOEw2SgfHnovIMk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9205.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(6133799003)(22082099003)(18002099003)(261022113327099003)(5023799004)(4143699003)(11063799006)(261022075727099003)(56012099006)(10067099003)(261026121527099003)(261021123027099003)(261021121427099003)(261009223027099003)(261102123227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UXg5NFhpYWl2ZFlQbUl1bHRONExXa0VjOXlHM0Z2Q0NUZ3g5ZE41SmkyTU0r?=
 =?utf-8?B?ZEMxS2pwOGVmRGkrWXV0NVFoWXdUdUdDWDdWNm1rQ0hRNkt5OHRuV0NWaEZX?=
 =?utf-8?B?V2RkUys3Z3kxRUpEbVlGclF2Z2dGN285UXFCa3VQTmNoellocXhvMFdPR0VJ?=
 =?utf-8?B?ZGdiWjE0UTI5eXFZRGhmZXF0QS9oSkkvVytIaU1GYTFlSmJ6RVAwOXowakxI?=
 =?utf-8?B?VTg0a0E2ckh5Q0ZBMnZkUTBKRWhTMHJkcFNnZzNGODdjbS9TZE4wbThCeTcw?=
 =?utf-8?B?N2NVeTUvZEduV3ArUGExM2dlbFB3cGtDemFDdU9UQXViQnlQYjk3ODBiMkp1?=
 =?utf-8?B?SG9DQk5HdHcvNi9EQ2htb1R2eDBBbHNIeW5JUEQwOVdHN0JBRk5HTkgrSmwx?=
 =?utf-8?B?aGNPQlRhNXNxMWV3VExXSFlHRlVNajdFRzRDdmlRQS9UVjczcUxQc0Q5MTZR?=
 =?utf-8?B?OFZQWjZZM0FHUFdCZExZaEljTUxsUGhMZHBndUJzY21HakxCelBLQU54VDFQ?=
 =?utf-8?B?bndQai9xZUNsWHpqWWp1a25nLzZ6SGRYOVJVc0p1VlBLdW5LbGwxRWRWYURY?=
 =?utf-8?B?d0JiNXpoNm1rbnRNMzVrb3Bqdy8zVHFTeElSTkRGTmprS3dLUTFlTDVTSm9w?=
 =?utf-8?B?QXNqTDNYeThhK3FZNTBMdkpZZVZyNkdXUitnb294RnhySjgxTU5EMjhFa0dK?=
 =?utf-8?B?YWRKOFJmazJERlI5cVF0dWdmSzdBd0hyZCtQRThKZ1BFZmhOSDJORldSdlk5?=
 =?utf-8?B?YVoyYmNxMUZGSVY5T0VvMGNuQ3JmQWlseE0zK00wVWZqUVQ4dXduWTYyL0Yw?=
 =?utf-8?B?YWdlYWhPTGdCOEFrc1UrSUY3aHZLS3pQby9SN0h3MHV1Sk9aV01XU1d1b2Rv?=
 =?utf-8?B?cXZaTHJnclZCOVgxQW1pZWhmOUQ1ZGlHb0gzSUFJV1Vod2s5U05Ba1NqQ2dG?=
 =?utf-8?B?M3QyV0VxYlBXbUdnSVNIOEdlOCsxUW1ad2NFU3hNOTdHMHVnU1djdEN6MGRl?=
 =?utf-8?B?eW84TjI0S1BuQVFUb0x5R05sVWNlVG4wYys5WWFFd2V2MUhFSUJKSkVTN2Ro?=
 =?utf-8?B?c2JLeTR6d3NiU25Hd3Q5bXNUcHNEWjZSMGY0cXFJc3BIUGFpcmd6Y3B2ZGdu?=
 =?utf-8?B?UU5YUjhoazlTRU5mLzVBeHFBQ3FqTWVxdTBBeENwZGJiMVdmS0pDVEVMakxN?=
 =?utf-8?B?dW45RHdueG15SDVvNjhFRFVQc0tyU3U5UUs5Q0xTVlJSRW9RbEFuZ3o3UE5D?=
 =?utf-8?B?N2dHb3cvUWVGVUduZXhLUkE5MTZPT09hdG8yMERqQnZQQTdhd2I1YlFKb2NZ?=
 =?utf-8?B?dXo5T1MzMm54T09nUnpIN3h1ZktnMHpyaEhXekJHWkdzQ1YzSU95eHREVWtS?=
 =?utf-8?B?bVJDMHBoRkkxcU1NS3BWcEFvRVBPZmtaTTAwRkZuU056MWdvbTF0Und4NStq?=
 =?utf-8?B?UDhsOGxBajRJMHlucjFNWklQYUZpUHJNdGFZaEpmY0dMTWU5NHFQYk5IZjZj?=
 =?utf-8?B?N3IwK3ZWVUpNemhLUDdqcVpIbS9uNXBmWTZmYSt2SmRnRU9zUy92U3dJSy9O?=
 =?utf-8?B?ZHhJVDlOT09HNDh5UlJjV0w3VEc4dWh5ZXpqVHRuM1lDM3RQN09BQVcyMTh0?=
 =?utf-8?B?R0lOdXp3WlZhN0dlZUNpejJKSUZiQXk0LzVKOUMzQ1dETThQWnNGMDNtVm9s?=
 =?utf-8?B?S0hWaXZaalBPN3RFSnVWVnlQbmVGUTBXMXdRT051K1d6TThJRVNXTGpPNjRN?=
 =?utf-8?B?WXZtRWxBdTc1MHhUWHNYZ3ZxM3ZIeTdoaGorNWU2amYvdUtId3RHOW5hbjdo?=
 =?utf-8?B?eThVcjIwSEh3a3ZKeVV4S0R3UlhseTRQczZsa2wvU0pXbllmV05DbnRYbVVj?=
 =?utf-8?B?VmZ6cWJIYllpSEphcjNRUSt4UlZMd0RQU2ppbzd4QTZkN092blBmc0cvdUMy?=
 =?utf-8?B?L3NyNGpRQ3dGWElheitSVEFxbTJ1ZXM5R3ZPb0I4WFh5NkdadnMzMzFWZ1Uw?=
 =?utf-8?B?cWVqNHlCeEJVTVpoYkJWVXRacXBoMndmVnhaZ1NmTUt5MmVHTnhsKzc4bjVY?=
 =?utf-8?B?N3lZTzBSODlNZG5BM1BraUNsTUJmNVJualpENDRZUlRhdEF0N0VXZ29lbEda?=
 =?utf-8?B?eDRUbFJVWGE0ZzhZM1VPbGxoTE1zMjZ4VFBhVW5DNDBWS0tGZDJha0lpV3hw?=
 =?utf-8?B?RjBBRlNYMFJ3T0taRW1sRlR2VjdHck9hSWJoTzgyYmVIamVuWDQxMDFkak9L?=
 =?utf-8?B?NU00cWRMR3pxWjh6N2locnhMcE42RTdrcXpZV3dnY2JTd0JXTkRkOGpTcWRH?=
 =?utf-8?B?RUlOQ2ZlYzlVeEZUQzc2OUJBc3h2OXBSSU1SenptMEpMbWk4Mk5wUT09?=
X-Exchange-RoutingPolicyChecked: De8VMRw0C7CxquRDyQkM2kiAyG5N484n7bu95yZ0Q6UB17TydRc43amqhJQG5Z++iGVzABqokLC5eK8AlZQmZV44LwLnbFI9TgOkp5kzh/upU46Eu3dHrPxZ2pfjmv7B5FfCY/i+As2c1rXjz9GOy4ZMl8NuX5XnMJsAfhqyr+GcYU5Xt2vwLhd2uaGtI+SI9DIgm6lFICY9wzej8eOTafvZhPe13KCJpjB/gCY2oWRVzk7TctF/sqqdR8fupUeRdPkSCONTUSg11mKgErLgICwqtg9bnx4JDsFcq+TxohyxV2eh6Rk8nd+hxT/KuBow/SH/LbrYGWMEDMaYnIblLw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c636aee1-9d5d-4ccc-09ef-08df46d73be2
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9205.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 07:23:55.0159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KEt2pOuG2UR1yFaQUnQTSpC11QpR3497yy2MLncCD78VvcalxtfJg+7s9adY9u5oGgcmuS5wGwFMjXXPiAVY45JihAphXVE0a+IjlAOSiu8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN7PR11MB170846
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


On 11/19/2026 5:57, Umesh Nerlige Ramappa wrote:
> anon_inode_getfd() hands back a file whose f_mapping points at the
> address_space of the kernel-wide singleton anon_inode_inode, shared by
> every other anon_inode_getfd()/anon_inode_getfile() user in the system.
> Any code that needs to invalidate userspace mappings of the OA buffer
> via that mapping (e.g. unmap_mapping_range()) would end up operating on
> an address_space it doesn't own, with the potential to affect unrelated
> mappings.
>
> Keep the anon inode singleton and only point the file's f_mapping at the
> drm device's address_space (drm.anon_inode->i_mapping), same as drm_file
> does for drm fds. f_mapping must be set before the fd is visible to
> userspace, so reserve the fd with get_unused_fd_flags(), create the file
> with anon_inode_getfile() and install it with fd_install() after setting
> f_mapping.
>
> To keep the OA buffer mmaps of different streams apart from each other
> and from GEM mmaps in that shared address_space, reserve a GEM fake
> offset for the OA buffer with drm_gem_create_mmap_offset(), and move
> the vma to that offset in xe_oa_mmap() by setting vm_pgoff, the same
> way drm_gem_prime_mmap() does. f_op->mmap runs before the vma is linked
> into the address_space, so the vma is tracked at the OA buffer's own
> range, and drm_vma_node_unmap() on the OA buffer only zaps mappings of
> that buffer. The TTM fault handler already subtracts the fake offset
> from vm_pgoff, so faults resolve to the right pages unchanged.
>
> drm_dev_unplug() now also zaps OA buffer mmaps along with all other
> mmaps of the drm device.
>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Apart from changes for this series, EU_STALL still uses 
anon_inode_getfd().  I suppose Harish or someone will address that?

But, with that aside, the current changes LGTM, and with that,

Reviewed-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

> ---
>   drivers/gpu/drm/xe/xe_oa.c | 41 +++++++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index fdd2d11ce4e7..d574b0ecf39b 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -917,6 +917,7 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>   		XE_BO_FLAG_VRAM_IF_DGFX(xe_device_get_root_tile(stream->oa->xe)) :
>   		XE_BO_FLAG_SYSTEM;
>   	struct xe_bo *bo;
> +	int ret;
>   
>   	bo = xe_bo_create_pin_map_novm(stream->oa->xe, stream->gt->tile,
>   				       size, ttm_bo_type_kernel,
> @@ -924,6 +925,17 @@ static int xe_oa_alloc_oa_buffer(struct xe_oa_stream *stream, size_t size)
>   	if (IS_ERR(bo))
>   		return PTR_ERR(bo);
>   
> +	/*
> +	 * Reserve a range for the OA buffer in the drm device's address_space, so that its
> +	 * userspace mmaps don't overlap with those of GEM BOs or other OA buffers and can be
> +	 * unmapped on their own. Not granted to any drm_file, so not mmap'able via drm fds.
> +	 */
> +	ret = drm_gem_create_mmap_offset(&bo->ttm.base);
> +	if (ret) {
> +		xe_bo_unpin_map_no_vm(bo);
> +		return ret;
> +	}
> +
>   	/*
>   	 * ttm_bo_type_kernel BOs are not zeroed on allocation, so the buffer can
>   	 * hold stale data from previously freed pages. Since the OA buffer is
> @@ -1731,6 +1743,15 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Userspace always maps the OA buffer at offset 0, the mapping is moved to the OA
> +	 * buffer's own range in the drm device's address_space below
> +	 */
> +	if (vma->vm_pgoff) {
> +		drm_dbg(&stream->oa->xe->drm, "Wrong mmap offset, must be 0\n");
> +		return -EINVAL;
> +	}
> +
>   	/* Can mmap the entire OA buffer or nothing (no partial OA buffer mmaps) */
>   	if (vma->vm_end - vma->vm_start != xe_bo_size(bo)) {
>   		drm_dbg(&stream->oa->xe->drm, "Wrong mmap size, must be OA buffer size\n");
> @@ -1748,6 +1769,8 @@ static int xe_oa_mmap(struct file *file, struct vm_area_struct *vma)
>   	vm_flags_mod(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP | VM_DONTCOPY,
>   		     VM_MAYWRITE | VM_MAYEXEC);
>   
> +	vma->vm_pgoff = drm_vma_node_start(&bo->ttm.base.vma_node);
> +
>   	return drm_gem_mmap_obj(&bo->ttm.base, xe_bo_size(bo), vma);
>   }
>   
> @@ -1878,6 +1901,7 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>   {
>   	struct xe_oa_stream *stream;
>   	struct drm_syncobj *ufence_syncobj;
> +	struct file *file;
>   	int stream_fd;
>   	int ret;
>   
> @@ -1919,12 +1943,27 @@ static int xe_oa_stream_open_ioctl_locked(struct xe_oa *oa,
>   			goto err_destroy;
>   	}
>   
> -	stream_fd = anon_inode_getfd("[xe_oa]", &xe_oa_fops, stream, 0);
> +	stream_fd = get_unused_fd_flags(0);
>   	if (stream_fd < 0) {
>   		ret = stream_fd;
>   		goto err_disable;
>   	}
>   
> +	file = anon_inode_getfile("[xe_oa]", &xe_oa_fops, stream, 0);
> +	if (IS_ERR(file)) {
> +		ret = PTR_ERR(file);
> +		put_unused_fd(stream_fd);
> +		goto err_disable;
> +	}
> +
> +	/*
> +	 * Don't use the address_space of the anon inode singleton, which is shared with
> +	 * unrelated anon files. Use the drm device's address_space instead, same as drm fds.
> +	 * OA buffer mmaps live at the OA buffer's own fake offset range there.
> +	 */
> +	file->f_mapping = oa->xe->drm.anon_inode->i_mapping;
> +	fd_install(stream_fd, file);
> +
>   	if (stream->sample)
>   		xe_reg_whitelist_oa_regs(stream->gt);
>   

-- 
Shekhar Chauhan
Linux Graphics Software Engineer
Linux Platform Enabling
Intel Corporation

