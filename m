Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D656606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nVAmw9fq;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=h0xZSJ+l
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570CB11204F;
	Thu, 12 Nov 2026 11:52:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864DF11204F
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484329; x=1826020329;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=YmPNUHVdya6CMH4hnQMgZnlHD6xh+cmQoyhpd9M8KOs=;
 b=nVAmw9fqhLl7N4AHzAfUOkRd4pcLYsFy/2F8bDVnPrtmL96s2lX98M1L
 Vq4k1fwvl4BS3ReeLNQTxmhNPoK+wc4GwqbmFhOd8Rr3nD/uV9Xr1HDiz
 bLziZjmiVT6VTifOYV0foXSXptr07GCahcDrA0DKSuyTicffmfVPLZ88b
 Z8Pf93K2JHZ3nWfVbdi4VO3aT/QAiWtYTKZrJuj40/SkTnvm0bKAgLUIQ
 oJwmCrLYwRuxTKHlEledlZsWbG3WGU4j/BGQU0qtqfjzp/F7jBL70rMfy
 7I/iJBhWxBJ10VcD3TVpdsC+l4wodc2ljfjWxS/yHdAtcz8Ca5LM00vp9 w==;
X-CSE-ConnectionGUID: uOp6SSX4S6qfjPOkVzimgw==
X-CSE-MsgGUID: /dcgiKi8T2OOD5iXN6Xr/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3132785"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3132785"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:09 -0800
X-CSE-ConnectionGUID: 9kMolFmWSieR4kJXVbANUw==
X-CSE-MsgGUID: v8rOFV0vTsmPfFefOUNibA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10407502"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:09 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:08 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:08 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:08 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzRrMmm3vZ4EzMDfrykz1OyyY49jc6LS7dMI9u9ahcn6UauvitcRuukvjlybkd1cF2rVpGPvZeehSYaLzOQqueHhAbZSELYqnwqXNRCOviPU4PsITqB7tevpcYPT20fgwqJRAhhSZjRyJgV9NAnOzjSkCCWEWEd39ob7PL9qwRf5ZDFUosvjRK44YG6qb/WPYDqcuvA0cDOCjnxwMq+FeqHQoiKdwpiT241gxM9wRUZjXzSqpY1caZfpFVeSop9+REIIXP35qm79SphXI+j2ysj0jQEFgoRgyUWuaaHO/Ji5t/yiMpmRSxwYy6x3S3dba2rxCp4HZMCcA0YaGatDaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jp2siaBGiCK6xqJNfpF2psCaU1tiz6V/6WL0dniI/DY=;
 b=NRjxO4Ug4Awz8syL0IKdmtxTRAsRUMD9Bx2Fcl0BcUyR7/eADD57BrAlUWwe0TSP15GjT1iiVUVYpzjD7oztJmHNhbd/lZbPBagWXP7DfjTI9n50zrgKPATqWADRi7kt4DCqVfcRLZ9cpeQ1uyOJ9ur6BxrHbvX+pPCDOB6c0NoiFENYemRPeRT0K36SlCQKpvTG65M3UZhUUnxya8dQV306KFUddbbx8FCQWap4OPAiqQzEOwzZtzo0xy7rvu05j6OFBYMf3pyeJzLs2UH0viSqt3jD2Y9KRralh7aXDa2a2KJXLO5l2P75oYja0ZPHw1xREdAFAiOUm3YxxMjhqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jp2siaBGiCK6xqJNfpF2psCaU1tiz6V/6WL0dniI/DY=;
 b=h0xZSJ+l0Q5rlbMEdovnEZRpymGHAKqS6cFBqm/VDtymA0gV8Aq5eUbjSAmz2oC/FACwx+4ktYYGvt/CelmrOmjTCFKlIqxZKVBTDyeAevoutvcqy+xFB+4OWdOt+QE3xZkjpbuG5d9jiRXb8l1eWiPT5eZegVTO6EBQ7gFyAe4=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:06 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:06 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v8 0/5] Separate GGTT pools for submissions and VFs
 provisioning
Date: Thu, 12 Nov 2026 12:51:42 +0100
Message-Id: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VIXP296CA0036.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::18) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: e22f5887-86f9-43f0-2428-08df40b35ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|261009223027099003|18002099003|3023799007|261022075727099003|261022105027099003|261021121427099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Ov5aT8/gSTIhXkEWBMpj3sIaNlfHblgtSyCksTgApMy6/BMstCmEvgeYzbJJNpF0yKIreB3DRIcebjpAi5Abh7qxKKjvEzDc+xyLeIkGbjkuYHM2fZNQGMYcnRqLPszeP5ARX8wAnE0kEvXdEfBPqr//MkZr/2BIU35A+9cbSa64RWqP/3iLMo55/uU1HKUav49kiQ42EHcKtF/LiMY1Tg9V7cYdkkMMjpk0O5QoK5XDOAX+hTJZ7mPafUJ10JO4RlAs6gBuQMGfSB60qaemuuuM+AN0q/z9Z5e1zzfu3NrNeYgS5JpjbbMliM8DPNbaKWCFMh5Qp+S9mkeyblOw57ykqcTQqC55K/x6ruAt3nq32XRfKYkNgk5XqQv0lbctEKmGv7SBMSYUbMU7kony10OHRvvz8P1CIMWlbknbwmwUsCZcRWIMkM4BFToQtbbYGYO+nJjJzRIBiFjyU0vluHUrqURhkLUqiSnCSgroBC268DVVNdd+ANc5+iPqHpzfJ8CzC1QWlsQZ4H010NA7XkLWC1Bx+EilJTfmWWCjPLDxD6sMfToMapEsZz+HO6IcIW+hu6/1b5DxBl1v2ilf5l7Bor1tMmu09lQ33zQKXY+FPBNQrcZBEIFGFmJcNBC+f1KHkyEYv/4knqQwgQUQeXuT/30zi3yX8esK/JKb9wk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(261009223027099003)(18002099003)(3023799007)(261022075727099003)(261022105027099003)(261021121427099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3hHSmkrQlZqYUVKS25JTXlUTkNralJWQmp4YjZXNEZ2TGtyVGx4YlJmUFNG?=
 =?utf-8?B?N2NXZlA2akNHQkxKT291NzU2VkQyT0dLTHpZQ1lTRUZkU3lWUUdyT2ZLc3cw?=
 =?utf-8?B?UzZtNmxyNTErYmRwWUl6WEp6TVczMGU2dVdoTXBQcDlmTEhHaVErcEF6TUFS?=
 =?utf-8?B?TkthaXdkY0ZpS0F5QjZ1N3VjalBnUGZ5aDA3UDM3aFovK1BhSVl1ZlR0ZE9G?=
 =?utf-8?B?V3FaRGxJWHN3QiswOXBwNmpMY1BpbW9HVFB6K2ZjVDhBa1VLN2p1dStTaXY0?=
 =?utf-8?B?eWlGbzkyT3pEMnhJU0l6ZlUrWFZmTHJEbTljWWh3R01ZbUZKVC9kN0Z1Q0Rl?=
 =?utf-8?B?S0RrbU5uRlQ4MXo0cU9USDBtTldiZWxXUjh4R1Y1elVwT0YzZUpBR2FLSHRq?=
 =?utf-8?B?NTNpem1tYmxaSkpvbVVEdjFEZVdDSXBoZXFuejZwVm1GVCtJbytUOVBwTjEw?=
 =?utf-8?B?WGtEbDIyV01ZcVNVQ3JyNExxYmxrRUNmWFBkRGFLQVloZ2JPV043YTZXVzlS?=
 =?utf-8?B?RGZucEpHTjNoSFRHVkRYMzl5cjJieVdaVWFPczNRRklVbE9jUzRrM2Myd0tD?=
 =?utf-8?B?SnVCRW80ZE9rVytDaEcyT0pTTlFNRGIvVFllamVlbGRFWHV3cjBMckZDRnRH?=
 =?utf-8?B?cXRicEZKTFRvc0FaN0ltSXJGUWRrYVFSb2JSUVZRMG51UFBNOUJaWDlyQUtN?=
 =?utf-8?B?eXFDRlFNQWNPdEVQRzNQa2xFMTRFQ0xSVjRoOWljb2RIYXgwQkZ4aGpVdWNQ?=
 =?utf-8?B?S1ZoZFI4MW9EV0d3OFkwWDVVUFd3R09XaEp6ZS9XR3BuSWpnS0xndXJEcmp4?=
 =?utf-8?B?d2o3Wkhtemx2NWpuR21JRHhZT2lpZURzOUp1U2N6anB5TGZYZkkvbTBoV2tP?=
 =?utf-8?B?eFltYkNsTG9TL0U1N2FjVUFreTRsbk9FNGtYZXJKek1wSGM0bXRwMHJHcklZ?=
 =?utf-8?B?WmVIczRsQkxhVEZONkErQlJSNEJwNjhwWDNLRXlSMlFoWGg1NFJza3ZSUjN2?=
 =?utf-8?B?ZzkyRlZyOVNFcDVmV1VFc0tRbm1MVmk2OEgzRlZzVXJQNE1XTUo3YUcrWG5S?=
 =?utf-8?B?T2UxV2ljV0ZzYmc0SFVhUW5jOUloaUV5dE8zSlIzNzdlcnNnaUVGUEtUcTNq?=
 =?utf-8?B?RFlJTkNRdU1UUEdKNitzelZCY21WSVNHZG5RZTI4TEdiMnRYMzZCNW1iUTNx?=
 =?utf-8?B?dTVIWGc3VFpGTEZTM2pzdUpTVVRNMDk0allLZC9XZ1ozQnhGcEtOanlyaFFu?=
 =?utf-8?B?d3ZwV2ZZbTB1KzdBL240cTNrVE00c1N3SGN5cG9UVjRqYkN2MzBtTVhIWUM0?=
 =?utf-8?B?MDNyZThsSHhMbXk1MFR6eFlXR3lSdHd6R2VET1ZlcjJBNGxCWE5DK3cwbDho?=
 =?utf-8?B?Umc5QzhrMUlJNnlTZ2tmcmd3WFdEV0k5bjRhRGFKWkV1ZEh0RjNnbzlWR216?=
 =?utf-8?B?Q3JuVUEwOWE3SnV5NXBYOVd4VDBBaklHT05IeEFjaitMazJhaXk0TERpWTRo?=
 =?utf-8?B?Z2FaK3o3THJ5K00zVC93N0RBT3RBUGcxWXhiYnRyakVmVHh5NjRlVnN6NmNr?=
 =?utf-8?B?Zml6L08zQW1Ed1VHRElSeHNBZVFIZ3R1dmIwSzJ5VTZwWFpERWhIRHEvWHIv?=
 =?utf-8?B?Rkc3NkZVNWpuSW5SbHZBV2ZndzRFZG9SWTVaem1kcVJ0REc0SUNGQUtzOFg3?=
 =?utf-8?B?ZDhhVUxyUHRyTjA1d2IyRUxoSXJUWmVIMnRiWklyNlBGZURuSG0zNkVZTXNQ?=
 =?utf-8?B?TkxMaTcxaEU4d2V3RjBMYXRId2ZhNzFkR2dGcUxvdWRnUjhEUkhxTnFsMmd1?=
 =?utf-8?B?VkNBTlUyOU5NVGdXczVQN0RLSzRYcnFzRS9vRWc2WVpRTXJEbGozOXJtY1ZC?=
 =?utf-8?B?cm1lSkRDNkxuZW5LOC9XNUtROW4vMHZXWk1JWVNIdVg4Wnp5K3ZJWVNCcVlY?=
 =?utf-8?B?VDIrMFRCSVJDaXRtcjBYakVKRUNkR1JhUTlpZVVaQ2xKUG1VUHlOU2pGVTRW?=
 =?utf-8?B?bklwZ0NWTEdld0JtcGlrOTIxeUJJUHFhSnFPQVdWN1IyYVBqWVljanlWOGZa?=
 =?utf-8?B?M3VuTHFFdDNiQUtpak1lZUJSTFRKQWhZbnZ4VVJLRkJnR3FMYmRQYlVvaENN?=
 =?utf-8?B?bEVrZjRpakd6a0VlaTZZOHdDOXhpL2x2VGZsZFFwK0d1VENLMUxkWklUSHN0?=
 =?utf-8?B?R3BHdi9UOXErZFdTMnM2L3M5MHhIL2tYS2YyS3loQUN1ZUl1bndkRm95MDFl?=
 =?utf-8?B?ZjN5UEp6bklEaUE1UDFLa2QvLzBTYnFRc2x0SE5wN1MvK0dUclJyR294OGE1?=
 =?utf-8?B?ak1qSkVRT1lSRnZjRW9NWTF0YVlpaG5jZUp3YVdzclVHODA0SnVWNWpEZGVZ?=
 =?utf-8?Q?vhNeHS/dv1p9V9Tg=3D?=
X-Exchange-RoutingPolicyChecked: H99z6wUzjiz3cN/C91gS3XIogVLg8OxxeECV+pCxFxflBp5F0U1tkAedaYzZtw7pMBfe1iKLhfLJbA/Pap6Etc9R3EXe1pDTlbt4KQHxYTj/FlUrm5twVga4zQA4U8pS9XUsiZ3wmbZVADyStMY9TDLhNPa4OpAuC8Q7bXF0ahxoieJfb4Srcf5KlaeQfN2je4uZkC7zIBFvwX3ldLpfGPjHL2bmUKWJVkd2pxxR8BmEH6x3vJSK4N7xx9NBdZRd/BigFYij/hzFgp6cY+KqzzmWzv6ymBkl9n5g9Z0+GmRRgWjyG0dTq/yck3ikEVjr/8PFkUe3Q5jR8VS/ZxjGvA==
X-MS-Exchange-CrossTenant-Network-Message-Id: e22f5887-86f9-43f0-2428-08df40b35ffc
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:06.4742 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eMpXV7O/qM/bPwbC2SOlvLqkjW8RQLEB5kTwx8il8qCoFTPjFVyzUTc9Od+vDEM+/6k7XkYB0Wg2aqpEaI4pX71uyiQUDhBHhSSkfaugq04=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

GGTT space is used both for driver-owned allocations and for provisioning
GGTT regions to VFs. These allocations currently share a single pool,
which does not allow their usable ranges or allocation policies to be
managed independently.

Introduce separate logical usable and shareable GGTT pools. The pools may
overlap, while each allocation remains constrained to its corresponding
range. When a shareable pool is present, usable allocations proceed from
the bottom and shareable allocations from the top.

v1 -> v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v2 -> v3:
 - Init ggtt.lock with mutex_init() in each test.
 - Introduce the hw_size struct field instead of the ggtt_accessible_size
   function.
v3 -> v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v4 -> v5:
 - Add a preparatory patch introducing ggtt->full_size to separate the full
   assigned GGTT range from the regular usable range.
 - Rework the GGTT split patch to use full_size/shareable_size terminology,
   compute the shareable start on demand, and keep regular allocations within
   the usable pool.
 - Move the range initializer rename and full_size parameter into the GGTT
   split patch.
 - Rename the native range discovery helper to ggtt_probe().
 - Treat out-of-range VF GGTT configuration as invalid instead of clamping it.
 - Move GGTT range logging into the common initialization path.
 - Add GGTT KUnit coverage for usable/shareable pool initialization,
   allocation direction, overlapping pools, unavailable shareable pool, and
   oversized requests.
 - Rename the GGTT KUnit test file to use the _kunit.c suffix, add shared
   setup/cleanup helpers, and split PCI IOV tests into a separate suite.
 - Drop redundant non-PCI_IOV stubs and misleading provisioning debug output.
v5 -> v6:
 - Release allocated GGTT nodes in the KUnit tests through deferred
   actions, so that an aborted test does not leak them into
   drm_mm_takedown() (Sashiko).
 - Rebase on current drm-tip
v6 -> v7:
 - Add a preparatory patch asserting the lower bound of GGTT PTE
   addresses (Tomasz).
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it
   returns an offset within the GGTT range, not a GGTT address (Tomasz).
 - Explain why the usable and shareable pool sizes are checked
   separately (Tomasz).
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation (Tomasz).
 - Fix the !CONFIG_PCI_IOV KUnit build (Sashiko).
v7 -> v8:
 - Use the root tile's GGTT allocated by the fake device in the KUnit
   tests instead of a locally allocated one (Lukasz).
 - Reuse ggtt_node_remove(), ggtt_init_native() and ggtt_init_shared()
   in the KUnit tests instead of open-coding them.

Piotr Piórkowski (5):
  drm/xe/ggtt: Assert lower bound of GGTT PTE address
  drm/xe/ggtt: Introduce full GGTT range size
  drm/xe/ggtt: Split GGTT into usable and shareable pools
  drm/xe/ggtt: Initialize GGTT pools by SR-IOV mode
  drm/xe/ggtt: Add KUnit tests for usable and shareable pools

 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c | 335 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_ggtt.c             | 295 ++++++++++++++++----
 drivers/gpu/drm/xe/xe_ggtt.h             |   4 +
 3 files changed, 581 insertions(+), 53 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/tests/xe_ggtt_kunit.c

-- 
2.34.1

