Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07432606A321
	for <intel-xe@archiver.kernel.org>; Fri, 27 Nov 2026 06:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NLJE9Puh;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=P9OScASf
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEB001120B3;
	Fri, 27 Nov 2026 06:07:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 015FC1120AA;
 Fri, 27 Nov 2026 06:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795759629; x=1827295629;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=orYldtykJLS1C2zmdkebqcxloPxUMAOMrM5u6ZexcVE=;
 b=NLJE9Puh4n2Rg564Fl1f2JIl9vZJ4HwTKibub7fyuN71vaPeTZRsdgdx
 NvzuvpqiWhhh5umjvteiauobC6CY01fV1gs2DyPghLA7Awk5VgNCGfTtD
 GQ+O3YHz7ccX08SCjn3RUe2uSUszdnoucE2UjIZeVX7incECQolEZ4dxp
 sOeRmLAXlJEviy9an+Yu+IMwbIoh7P4qBXiRjHk8B46mVRcNCIupz5U+I
 wqp3MIpuz+rBzwpCfpr+N5juEoPBR6uO0DM/essIJGxToDzRotmggst3O
 PRd0BUU3ahG/JH4QrPsfQkjalbxQDGz1u/wRXMdTUB38u60IhipNZqeZG Q==;
X-CSE-ConnectionGUID: BEGeK97hQMaxNQ3HlkdMKw==
X-CSE-MsgGUID: TfAHFgAoRiu09vCQM8w3yQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11978"; a="4509354"
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; 
   d="scan'208";a="4509354"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:07:09 -0800
X-CSE-ConnectionGUID: cDBQV8AST0ydkmA3MeGXnQ==
X-CSE-MsgGUID: +6T+kPJnRe+533Ib+5gvag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,236,1787036400"; d="scan'208";a="12466382"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2026 22:07:08 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:07:08 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Thu, 26 Nov 2026 22:07:08 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.45) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Thu, 26 Nov 2026 22:07:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GAhG20mKq3XFJfetb0iNB+5x5iSTb4n1j8Ru+R5RHYTDWpHrbypMIwPP5Xn8O1krefxmxLlTgbM/qNBKS0PSbp/PFgGhowCb5eS34a9hpjCd9/6s4si3nxkuIcWhH2YboDEUyC7Ej+g7LmQZ5k+80lumMfTNVudbDjVPrm1hE6PedDYSXIrEQe2JWtww47JrtLroToME/1bx9Cqymv7EHCMPbQ+6qN7H4VuXM/Zia+zoZnf6UeMDX1iQhT92EPdQHEQ+iqFpIdr7BUkE+aZlE8K7TZAYWBgZzPY8Eq1znRg361BHvaTYsD0OV0y1Gu80UCeZksm/qhQ+BnbxN4CM0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KRdmcL6BGYCuYnHWI9TIZg1P/18IikFRbiRSkr2iJdo=;
 b=gj0Y7TfxRrWTTgdONPkqUYeD1mYu3LXajvzdCzwCLo65HE38Ke4k+ZWn2Nt4Y7H/jCHn++5b2HTkPmL86QwgtL31OzYbsMdaGOWuPxSHAmt7k9aIy+b7RJATX6jyBz5pINzUqvR2lcOaHX32WmCIlWE5rXgvygCxpVKiJttskIj8mYoY/3Ze1aO9csNJ0e9XasUA3hkdsoMA5N+SOPNpLujeOgz432RVAmDuqyJf6ImfVbadbUeHHDCKfdt9LVNRka4BQijWFacWvSAnXphZe9gb0/mI4YtH4NLGsWf8sn7Q2y1181adLOLGm3DVeBxWi2ot2GBP8NqgaM/KNU0/vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KRdmcL6BGYCuYnHWI9TIZg1P/18IikFRbiRSkr2iJdo=;
 b=P9OScASfGz0WJPZOeSfP/OJebKE41aoR523TdJPks8jlpT0MDU5dtwBsx9+XCRMLOaqZ1MVrViPUpFzfnmyoUtnD2wRPb8IiJ9R4Po6aeSnx3F3mZ6Q9XQH1keWMSHBVJIcUNVX1x2UN/nnSE8WfMOCI77O4PlaTNa1ObXvG0Bs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21) by IA0PR11MB7212.namprd11.prod.outlook.com
 (2603:10b6:208:43e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 06:07:06 +0000
Received: from LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460]) by LV2PR11MB148960.namprd11.prod.outlook.com
 ([fe80::9761:b20d:6f27:5460%5]) with mapi id 15.21.0662.004; Fri, 27 Nov 2026
 06:07:05 +0000
Message-ID: <75e1eff1-0710-4712-83f4-07db32c2cf94@intel.com>
Date: Fri, 27 Nov 2026 11:36:59 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/13] drm/i915: Add more vertical timing diagrams
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 <intel-gfx@lists.freedesktop.org>
CC: <intel-xe@lists.freedesktop.org>
References: <20261023165803.31016-1-ville.syrjala@linux.intel.com>
 <20261023165803.31016-14-ville.syrjala@linux.intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20261023165803.31016-14-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0129.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d2::14) To LV2PR11MB148960.namprd11.prod.outlook.com
 (2603:10b6:408:40f::21)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR11MB148960:EE_|IA0PR11MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ef38bd6-512d-4565-abe5-08df4c4ca996
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|261022105027099003|261102123227099003|10067099003|56012099006|261026140227099003|11063799006|261026121527099003|261028144727099003|261021121427099003|261021123027099003|261009223027099003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: OQJfW5yL8tYQhRwpMVwSx2beatMSs+VYrN1Am4Ss5JlxnDOiJ9cH7VtDHihtRlw166uYIvYKXGc7HKahmKQVvCzBy+sO9mmv0+6zSLW8Gn+zqO7HyFy0CHUsY1IYpW+rIEgSYJfm5lgEEv72Z2fKtAkfRd5RO7skF+sm9B2WHfuxSAA9a1ckzkmbJwlqZIj5ZwRFRxgL1nn0DC/mT/Prjq2qPSMT3V3w1vFMrVKj/FYfTIByjCdROpgwdPfGhv+UQZfXAg3e2CRXNl/z478AHEUYflp+a4heKavTQktDmXTEkULd9AcLv1eLe3He4l1YU2XBIRAMs+e/UDhYX6PY+/Eb7gqOoFGLXxMbxmbZsE6a0cVJwfSC/TOsPHbHS0c4aF1d52qrLOURDUOL1gjNXdhrGBgnVzb6X4hBHvDaVoHtrFA8P8JJ2x0pEyNe3yyJXKxJXhx7LhBK8cE+ZrHzgxjdFsYVpKe7nHSFV8zTaPa8y3Nz1x09TIyqQrMDmvbc2ZNCIBaK3pAVHluq9J3zbFbKKfgyVoi6Y/ftXIONHbtNv2jtuWBHTbU+yBGGLgcxzxAS+nbZE/LqKtYCKv7ovvaBqWZo53y2aMjjD05vvxFBpLb1hdAZnBmzFb0NgPjtDArEcQH6uBHwzOC6CJveyYxmXSYeDSKlG5PkZqcC6iM=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR11MB148960.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(261022105027099003)(261102123227099003)(10067099003)(56012099006)(261026140227099003)(11063799006)(261026121527099003)(261028144727099003)(261021121427099003)(261021123027099003)(261009223027099003)(22082099003)(18002099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU02ckhhZ29DdDVsNnNTbWx5cWk5WVc4Y1lySjkwek1ZRm9HZnB2eEJQeTl1?=
 =?utf-8?B?ZUVxcjdwNHlNTE1uRlNhWm5KNUlqeGl6WmZzOGFWUm13UUlYUFlHdmJHbTNE?=
 =?utf-8?B?U2lja1FtOFoza1hVcUF2M0kxZkFla05ibytUbWtUem0zRGNidUxBSUdIVGZS?=
 =?utf-8?B?K2JpNjJWOTJaa3pVTEdKQ24wcUZXSEVQKzdJZXRhMTFzNHRRK282UzVjTUlL?=
 =?utf-8?B?U0RRSU1MaEt5VXVBaEhEUEo5elM0a0lUM3MyeTFVN1BWWGhuM2Frd0l6VWlW?=
 =?utf-8?B?SnJ5UDVnT2FvL3pwdGlSbElvUVU0YWRWcDZqVExIK1dMQXBDNXNtUlJPZnFr?=
 =?utf-8?B?UWExazlIcXU1U3Q4UENkWTRmb0JzOHNHU2Vjc0JsRDlRbG4yRkZqWlB6WlM5?=
 =?utf-8?B?U3E4U210RUtITGFhVytlNWlNMnFydkNCTDhQMkVlWXhpNXV4ZjduVWx6QWIw?=
 =?utf-8?B?emFPdDZHOW1rVGloM1E1YXE2SWR4WnIxZ2tjSllPeURnM1RsTjU5R2Ivc3pX?=
 =?utf-8?B?Mm9uUkRHQ3kxZGFtdDZWdFFSM0UxdmV6VnB0S1A0YXQvUmIxWDJyc3UwV2JM?=
 =?utf-8?B?eDNpelh2YklqUjJDb2IvdytIdDc1ajRmSHR2K2hWZWNab0dkbjczK1Z1dHFI?=
 =?utf-8?B?VTNKcCs5VWd5d0lQRExtQmRkQ0hMRFJpZXlNRkxpU3p5VDJBSklKYlk1SFRV?=
 =?utf-8?B?ajNBUXBVV1hVc2hVM1V0V0tTWUlvaEtMR1NMd3pVdmZUdjVkaXZyQm1kSDRl?=
 =?utf-8?B?V1lvaFlMRWRUL0RFYmFpa0MrTElvUVRBVmJQSE02bTNTQmRrcjlPaXovZnJG?=
 =?utf-8?B?cE9sS3gwMmdhbm10Z0Q3RGZMWm1QejlNRFNVTGZMeTZCOGRyRmowV3ZaOFd3?=
 =?utf-8?B?TGM1aVBzdUdRN2NjNEhpUytwU0UzNWNjMkpZeXlkK1diVFpRSmcxUVVOQldp?=
 =?utf-8?B?QUJpYkxieTBEUi9rR1NVc1FsVElnZzNwaEVEK0RNejBvTXNCSkh2RkJrZDV0?=
 =?utf-8?B?WGFRSXl2bkJRdzdMVlVqZzM4dmp5TDJDR0d6dUQ4LzVnMnlMUjBtSUhNMFhC?=
 =?utf-8?B?c1hSci8rUjhGWHVQUCtXQmFvM1ZSNEZCeG8wcTk3bSt0aklRc3A5bXpGbkYw?=
 =?utf-8?B?bmNOY2k0eU5HaEhDS0F6RU5kcXdxcG1FQWd5MENBdUJtQzY4ZlpnallOa0E0?=
 =?utf-8?B?akFBTWc2a25MVC9uVEJlQkdzTWlFWkN0UlUvMGJBYWJsbGd2aTlsV3lzM1Yx?=
 =?utf-8?B?NEV4RVlTeDczTlVFS2JQSHBFRWc1Tm5aR0JtWElUQUxrMjVRNktHd05jYVA3?=
 =?utf-8?B?aFZpMHQxNE54SHNIYllqU2toZ1JlVHhNeHRhUXdYK25sMmZYT0tvd0VmcGNz?=
 =?utf-8?B?dDBOak1QMXk2dDJxZDIxTXppT0V3d25CMFJKTHRqYjlvWDhYdyt1VHd1MXJp?=
 =?utf-8?B?UVZIWFhjNXdTQ25Vc0d0dXUxQlNWeVJOdUVuczdyYU1OK0JtZmZiNjZPYk1S?=
 =?utf-8?B?MUpHZEpqZTQyQ0xRNzVlYnlFWHZSQmJsZ2VXcGVwVTFlSnBzandDNnplR3Z2?=
 =?utf-8?B?V080aGxhMWxqc1dxZHpFQ3gycXd3cTRpVUd6blAyYjdYZTczNGNXcTJraUhy?=
 =?utf-8?B?RFYyYytvT3dWd0ZsV3UyQjQ2dTRaUElmNmZuR2JEYWs0b3pTcXZuRjJ5L0V3?=
 =?utf-8?B?ZmRhdWtDQmMxaElSMlpHRHhPNGl6cGJKbTRwVklvNTUvUDRMQldLUVNkZjVU?=
 =?utf-8?B?NEFqWGplaFVZeVV6dFlmVlVlM2ozbFl1dDdYVDllcGRrZXluaHN3MERiREJI?=
 =?utf-8?B?YkxyMVJ5RlZkNVVLdjFtN2JCVDg0MkluZEU3RzJ4OGRnVWZYcFpUemdFYTJk?=
 =?utf-8?B?UFVyUTNoWlJhWSt0eXcrOTFwMnltT09PWUFIdmVQRWlwcHlWWlZnNW1TVlRp?=
 =?utf-8?B?VnJna3UwNXJzTEhsT2Rhc0dvZEdjRUhwNmk0SllSK0xhZkZjQmd0Y2ZNdUFQ?=
 =?utf-8?B?aXdWak5kblh3M3lYZktCZUVjbkxPOElYdi9lOGYvQ3hJYUlpOVV1V1AvZkVi?=
 =?utf-8?B?MHh1aGdxenJ1Ykh6UHBXMk5xYjBjdms4MWNMQkdmQzE2VWlpaFF1UnNMQ1cz?=
 =?utf-8?B?L3lxbFVma2ZZTzlQcWxZakdvOWkyb3JTYUhIUmdoeUNYajh3S09pcC9NaWVN?=
 =?utf-8?B?VHVhNURMWWNoaHlwVC9od0QzMEFVaGgrVUVrZGR6d05wblZOdkdYc0FpdjBo?=
 =?utf-8?B?d1dSWDg5VzAxMVhRcnJWS1YxeVpuMnF1R2VCbExCRno2YWRIMks3VEZUdUJU?=
 =?utf-8?B?U0t2cTBmUXpyS0F3UGZYUzdTekc5RFU2eTh1ZW9LTjFFUTI3d1grWWxlakdT?=
 =?utf-8?Q?sgE5Pt6fKD/ncTRw=3D?=
X-Exchange-RoutingPolicyChecked: hE0IV6GIu9KlNkVnf6pqLacVUa8PPotBOP/s7Yx7OL5IDeS1crH1Zpxbk79tOEWYzbuCJKz3amXewWJXJGr2Rzzv1fmN2HKoLQiQqzlE+Zg/xQojdz/+s33iI7jdAHCnFhbjBz3rqVCa4FF3uOYMPH5hd73FOO7ZGrhf+Eh4K72raLpEpkB3bxcxfgAzrPuVLvj29vN7gG1UqdDTn+P2T6LgxXKebB3YeGDIoDDw/5ZxWGLVPbnK7qg9l3U5DnNaZ5O51kcsQxnOAvVMcONrNokyslaUAW8/PiLoPvDOPLMGWTN/v7Zw7CzHPKxAtZ1itigdL0o4P+2gjnynzKhU9g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ef38bd6-512d-4565-abe5-08df4c4ca996
X-MS-Exchange-CrossTenant-AuthSource: LV2PR11MB148960.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 06:07:05.9070 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bZZGVvDmvjoldgY7CTavO06IILSyd1Xskyh11qteylqM1QMgiTRM87sp3/rP6DQVAq3Gogn/D7aXS4V38he+IcXaECtalIZD1VpoeHgLHBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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
	SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/23/2026 10:28 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Document what's going in the vertical blank interval on all
> platforms. We already have one diagram, but that also includes
> details on the frame counter vs. pixel counter differences and
> whatnot, and so would probably get even messier if we added
> more to it. So create a new set of simpler diagrams. We basically
> have four different timing generator behaviors, add a diagram
> for each.
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_vblank.c | 50 +++++++++++++++++++++
>   1 file changed, 50 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_vblank.c b/drivers/gpu/drm/i915/display/intel_vblank.c
> index 084f6aaea61d..d93a78cea9cc 100644
> --- a/drivers/gpu/drm/i915/display/intel_vblank.c
> +++ b/drivers/gpu/drm/i915/display/intel_vblank.c
> @@ -68,6 +68,56 @@
>    *   of horizontal active on the first line of vertical active
>    */
>   
> +/*
> + * Overview of vertical timings:
> + *
> + * Legacy timing generator (pre-TGL):
> + * ... vactive |    vblank   | vactive ...
> + *             | "guardband" |
> + *             | FSD |
> + *             ^     ^
> + *             |     frame start (vblank interrupt on gen2/3)
> + *             vblank
> + *
> + * Legacy timing generator (TGL+):
> + * ... vactive |         vblank         | vactive ...
> + *             | window 2 | "guardband" |
> + *             |   SCL    | FSD |
> + *             ^          ^     ^
> + *             |          |     frame start
> + *             |          delayed vblank
> + *             undelayed vblank
> + *
> + * VRR timing generator (ICL):
> + * ... vactive |               vblank               | vactive ...
> + *             | window 1 | VRR stretch | guardband |
> + *                                      | FSD |
> + *                                      ^     ^
> + *                                      |     frame start
> + *                                      vblank
> + *
> + * VRR timing generator (TGL-LNL):
> + * ... vactive |                    vblank                     | vactive ...
> + *             | window 1 | VRR stretch | window 2 | guardband |
> + *                                      |   SCL    | FSD |
> + *             |    DSB safe window     |
> + *             ^                                   ^     ^
> + *             |                                   |     frame start
> + *             undelayed vblank                    delayed vblank
> + *
> + * VRR timing generator (PTL+):
> + * ... vactive |                    vblank                     | vactive ...
> + *             | window 1 | VRR stretch | window 2 | guardband |
> + *    |  SCL   |                        |   SCL    | FSD |
> + *    |         DSB safe window         |
> + *             ^                                   ^     ^
> + *             |                                   |     frame start
> + *             undelayed vblank                    delayed vblank
> + *
> + * SCL = set context latency
> + * FSD = frame start delay
> + */

Perhaps good to mention: on ICL/TGL guardband was called pipeline_full?

Can we also document the wait_for_vblank and DSB chicken bits behaviour, 
something like:

  * VRR timing generator (PTL+):
  * ... vactive |                    vblank                     | 
vactive ...
  *             | window 1 | VRR stretch | window 2 | guardband |
  *    |  SCL   |                        |   SCL    | FSD |
  *    |         DSB safe window         |
  *    |        ^                                   ^     ^
  *    |        |                                   |     frame start
  *    |        undelayed vblank                    delayed vblank
  *    ^
  *    |
  *   wait_for_vblank ends here (DSB chicken bits redirect it to the 
safe window)


But even without above suggestions, the diagrams LGTM.

I had a very primitive diagram in my scratchpad. This is better.


Reviewed-by: Ankit Nautiyal ankit.k.nautiyal@intel.com


> +
>   /*
>    * Called from drm generic code, passed a 'crtc', which we use as a pipe index.
>    */
