Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80131C3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 30 Jul 2024 14:02:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D7A710E073;
	Tue, 30 Jul 2024 14:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gQc9ogFr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9E10E073
 for <intel-xe@lists.freedesktop.org>; Tue, 30 Jul 2024 14:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722348176; x=1753884176;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=G6bM3OsVmjvnmEyeHG2G0KYpNqF8q9xa/J1kj0Zjh18=;
 b=gQc9ogFryCVKzCmfcUlIX6cTRYXycGXu7QTx3h/dZHEU/6oTR9Dx3UH2
 KPyrLqpgKk0PHz7MQRRWdv5SW93XnfYZEegt14JQg/+NrIIOplbSQwUQ2
 Svr/TvhHEEqlDNeQvVw3xVh61QrRAaD+PE4K2+e+RkYgyAlPv6ntzn2d3
 wHx6Ppfv9I7npcquJHonUgyV6jDASRyUU2iUlYP8P+jG07YZBy5/7smVJ
 C/7wKXa98yuewsTMZ/jbyNfjRD5GYpqbyAgm2sgSEXFUNWHz4snLjYRiv
 rqtjCu6Rb7hOGadlzgAIwDbmMNg8Y7a3sY+/+V8AXTDkWUFFNzO2hvLqU A==;
X-CSE-ConnectionGUID: QF9LAqn6SSmOpygcpDsdaQ==
X-CSE-MsgGUID: +yk2X1WcRueyPQNAbeLXUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="23926884"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="23926884"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2024 07:02:56 -0700
X-CSE-ConnectionGUID: 2KPUUqCCQe+cyhbeTA07Ew==
X-CSE-MsgGUID: fh2lXGAWSnmYBblZnvfuBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; d="scan'208";a="77584352"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jul 2024 07:02:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 07:02:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 30 Jul 2024 07:02:55 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 30 Jul 2024 07:02:55 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 30 Jul 2024 07:02:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UctasMJPXFSdjzKKTONnNIheomxKtMVumw3q0HoWTjUHePzHanYnUg/LvDzbMkCXnSisJzi8GM0kzb1mYlNe790rQxjVdZeazOnl8/v5Cf/s7OpnXQ4wI5Db8Bc4D0qQwP9IUcT5Xu0/qvLtIxMt3zzcgwrF/bNbHCmReYCNKnCgaHZgIkdcdBqcBgZM2Hl8r8hl9keIowinQ25ycYVA/6xB58Ejmjl1vYZDOTu5M4vF8HcrN3SghggMieQef0kg9oLS1Y387W2cVs6D5mx1hxX1T52yWBCCvzDzEYbX5dmiuHXcLIaEmaQzLRdBBWRGZxpOGJQSAnr4AbL8zxZl7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiiumFrP3n9dwBDj4+2Xr5NUIq23tlODScev3YfwDHE=;
 b=L9Bbb9663iaPbnK7HUazEdbv1i1d+wcnmjhfIgy/3+Iw1Nbz+MtI8pgQEsVu848vI6TwAGnCDZcpHDJLTv4jBt46mKqpVfQVgVh7jkI7dgHTFOoaviuyZy97JhB13xQv9Ugn97t3h+tHXvSiYQOlfPFPuhtPaVYgZ+BqXPo/cIhMbZ80lS6CwflXKh0EoClKgwa19bBQHpKWoTDwFSKf42AUP68NbAXSipVrd7jhaTeKxpyowumP2kiiDJqUivrxQIe6lo0WIFtEZMdDugXZHOXnBIGDUwtRosP1/HgjWEs4B9eIClGzP80nPv2J373Is6Xdasxo4sAvpKbZzD1+uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB7890.namprd11.prod.outlook.com (2603:10b6:208:3ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Tue, 30 Jul
 2024 14:02:51 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::a255:8030:603f:7245%5]) with mapi id 15.20.7828.016; Tue, 30 Jul 2024
 14:02:51 +0000
Message-ID: <bdea1614-6bd0-4629-83ca-61c8299a8eeb@intel.com>
Date: Tue, 30 Jul 2024 19:32:40 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/xe_gt_idle: add debugfs entry for powergating
 info
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <matthew.d.roper@intel.com>, <michal.wajdeczko@intel.com>
References: <20240729102942.937680-1-riana.tauro@intel.com>
 <8373f7f9-fcce-4779-942f-360fb1e2f3f8@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <8373f7f9-fcce-4779-942f-360fb1e2f3f8@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0092.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ae::16) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB7890:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ed1ce1-a3d1-4480-ddec-08dcb0a04cd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RTlIdTVvVGdQd1QrOTNUU2hMczZGM3lCemhaUllxYXFHRCsyTUI1VzBQYm1r?=
 =?utf-8?B?RmN5LzBxd1BpTFArY05IbDUwU1NneEFWZ3FJNUlkRDF2MEtpQnlwM3F0Ykwy?=
 =?utf-8?B?eWwzWmpFM2YxRTFwZHQ2aXdtYzI3SXVwbktFckoycm5mdS9QK2xPcGtPSWMr?=
 =?utf-8?B?Unc0V1lNU1Y1MkNhblQ2SzV5Zk1zbThueDJaWGNsZ1hqeXBXZ1h2UGowWGZo?=
 =?utf-8?B?dkU1RmhUVUFSMm9yNWhsK3gyNC9PaVAzUXdiV0xRMGxoZzBnelRuZXh4ZTRv?=
 =?utf-8?B?RmFWYU1ha2VpbWtvM09pS3ZpMzlwazh1QmFHcHk4NDNqVlE3RWFnWlE1UjFM?=
 =?utf-8?B?dVN4NHJUUStTUExGOGt2ck50eW1uQUxRSW1CemZ4RnZ5K1l4M1RubHBVL2xS?=
 =?utf-8?B?aTdqL2VxSVdTY1lhTWYwdnlSV0FoeVBZeFRuN0ZVcE9IamdyazFqUUlRb3hV?=
 =?utf-8?B?UjlROFlSSnpMR0UxcWNscVJ6dW8xQmNWSjdqV3BLMXBqNjU1V1ZBeUV3dHFY?=
 =?utf-8?B?a0tYTm1xT0xLVElrN2ZtTkM3dW5CSjBnYnlZVFhkZlZMbzVqK0dnVXFkeEJy?=
 =?utf-8?B?amlpT0kvQ1dDZnV2Y1BROFVQMTc2aUQxMDBta0d6KzZrQjgxVVB4TXAxNm9a?=
 =?utf-8?B?U2RIM0pNc3orZjdtdEFjSC9OdFVzR1YzbmU0Z2xBeFBNMkNCN0hlQjZUQ2NQ?=
 =?utf-8?B?KzFvdk9tbHBVTWljTCtXcWpkMEhOenU5VTJNNWF6eEkzSEUyYTdLbTFLeGRw?=
 =?utf-8?B?OE5vWVBKeDJKTVEzZHZsSmVRWGNuK2JPQy91Yk9xLzhkUTQ3b21nTzRnT2tH?=
 =?utf-8?B?bWMyZWdGTFlHMVVFOVBmT2wySENVRzQ4SHYwckFXSGpmNlM3VTUxaForMUVO?=
 =?utf-8?B?NXF1Q0h3WUNtSTFEQlVaMVdIL1BrSGJBYWFMVHYzRUZBVk1CRzMvQmhLeFBI?=
 =?utf-8?B?SEdHdWZINzhYQzdSem44VCtxK081cEFnWWtMZHE1YURRcm9NZzNtaWZpVnN2?=
 =?utf-8?B?ejF6US9ENExrN01ySUtLUzdiRG1CWStycTZFU1pGZlp6YXNiUUVZNkhZdElZ?=
 =?utf-8?B?bUV4REFzaFA3TXBVZmJ5ZXRHNU5GRDJ5ZGx2T3VpRENGMzB1NnArQjRYTzhM?=
 =?utf-8?B?K0o1WGZwSlVDSWdBKzV0aTV5NVl2TktvQnNJd2VlVm1uU2Q3My9YbG1wQTA0?=
 =?utf-8?B?SjBnQ2E3T2VpaThMUGdteGZhOEVlSlJ4NWFTTVVmM1JJNCtuWlo1cjM0SlFj?=
 =?utf-8?B?bmNlb1RoVDR6bVlwTUdGSUFFNGlXN0FsdHRIWGZ0WHk5bGJyblNZKzdvWm1L?=
 =?utf-8?B?WEFSekFoWFNsaURzNVNMRWVIT0RjNCtnQWNjSWVKNVNQN3ZRNllmZUhsUlRl?=
 =?utf-8?B?cXcrdjVYQWx2b0VzRWc1Q2RDK1JxUXNKLzRIUnVPNG5xamdDVFQxYjloMGNL?=
 =?utf-8?B?TlFJR0RHZkN2VWZUd0RjajRvR1ZUdFpZMlMwVHVOSENmMVluMlRjQkd5RXc1?=
 =?utf-8?B?NFZNZmwzamNPQkpQTDRkc1AwSlBBRzNOWVQ1U1JFRHB2VHB3anBkcmh4UE9q?=
 =?utf-8?B?b3A2OGpHKzg5ZXFGSWVPRnlVbzU0ZW5jUUlERElpMXUxRloxbmhUTTVGL2th?=
 =?utf-8?B?WUorWTdxV0dQNUZLOHAvYVorV2FwVGNPOXQ5OWxBc24yN3AvMVF0ZFJ5S1pM?=
 =?utf-8?B?NFBzTCtWNmJOcDgwQm9sNUlwY3drcWFGSkZUOFN0UXlYaWVSSHpRTW9WZEVu?=
 =?utf-8?B?eVVpMndLZnk4SUN5OG9RQUFkYmR5ZUVXOTlVbTh0ajREam0wWGlHcmpJaDZ4?=
 =?utf-8?B?amZPdkJJM2hsbnp4ckFYZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1o3ZmEydWNYZEFQWmJGa2piNzI2UFp0dWdXbHdncitkekRxTHdFYTFkNnNh?=
 =?utf-8?B?TVNsbzZUVmNpS3N0eS9RRm1sM3krQ2JmLys0VVJNK3ViWnNuNmZjbGt3NUds?=
 =?utf-8?B?ZzNON3pINlJLNlNBbmM5WGtKbVZTQzdvOVlLV05ta215c2ptMUhiYzRCSG5m?=
 =?utf-8?B?VlFBOHZiejU4OHlOUjFjNUYyQ2QrMHNOQzZQMU45QjZ6dW1iZ0tibGdYMm1P?=
 =?utf-8?B?a1pxeThjOVZqYk02SmdhQ2FhY2t4QVNSazYxS0doMld0WURobTlxaXpxdmp0?=
 =?utf-8?B?MmdXdVVPUVNTWE54R0VUckh3R2haVElidjhKeklRN1VES0NJaDl5U25LVHN1?=
 =?utf-8?B?VHJ4eHFoQWFEWXZ6elI0TCtxRDhZcHNkVVcwSU1jSy85b3YxNExNc2pKZFJa?=
 =?utf-8?B?TUwxZER6VS96UlAxdHZua0lpUERLQVAvb21uSTNMNTdpZ3VVUTE4YTEwRGtj?=
 =?utf-8?B?T2VwZDNrdUZYUHMyWWNwVTJVMXZ3RlJzdlRBczFRamJrdktGaFljd3RXKzln?=
 =?utf-8?B?R3I5MldoTzd3ZmM2NndjRGdUbS9pOFJPWTgvQ2hyMFpkek16VmJVamdUSVBU?=
 =?utf-8?B?U1JQR3dweVZZQm94V0VjNlo0WExzOGNYcHoveU1paExnbEQ0Lzl5SGFvNU8z?=
 =?utf-8?B?dm9wUWIzUHhPWW1kbXljWUVIUUl3VzM0cFFBT1pSS25nbHd3c01KUEJLN2Np?=
 =?utf-8?B?U3I3WUdxOGg5Vkt6Vmhhay9oSDMvWklkVngvUy9OWUR2d001MHkvczFlY3Vi?=
 =?utf-8?B?NHJwMXQyVVYwd1lGYVFidVRtYjg1bDJqcTVEZlRpTHV4NU1yLzJlYXNJTDBT?=
 =?utf-8?B?M3JRMGE4MEY4aDNRRjdidk5MNWJUUGEvbXorOUNmS04rK2lhZTZrVWUzZW5Q?=
 =?utf-8?B?QnVjNkZMZm1mTWVubUM0bGJBUWJmVFFkTEVBazl3elJISlhMV0YyVHZmVjZR?=
 =?utf-8?B?RDF3bEdwNFdLSVBnSVpUZ2VPWThlODNTbHRQMlZaTHVrTHJBc3VEa2dodHBx?=
 =?utf-8?B?MFNSYWdsUTVSZDRsbnVPemdtWHlqK01JcUNaUHpVazdpeTNzS0ZCbzJGQTZP?=
 =?utf-8?B?Qjc1WDk0L1ROUCttcDkzVWN0aHdEdGx5UnZvUVViMkpYTVgycTJLUk1pa1JQ?=
 =?utf-8?B?SHBzU3FsbVJKQTZ1NE9PQlYxTjNORk9nVktwZURMZDNhdllXQVREMjBvYnFG?=
 =?utf-8?B?NmtSVlJhTXdZSXEyUnlheFZBZHBsV2RsRS9WS0NhaE5sSEJyL1UrcXVpbHQ1?=
 =?utf-8?B?T2xaa2hUcmdCbm9adUpWa0c5QkRSaW80VmxYZEpGbWdXMEl4eExFMUs1bkdO?=
 =?utf-8?B?d3AzTGphMXpKR1pQbm1wQmVKWmJ5VzBldXlkWThZcHZpbStyTzYvTzl5UFkw?=
 =?utf-8?B?RWU1Sm4rWHJRWC9WVWlpMmlpY1QzTVJ2aVNzSjJtYzRWYWJHc3k5eU9yRWl5?=
 =?utf-8?B?WkdJQzN2NTVLQnp2WDQrZnZMWTFicnk4SVhyL3MvMnRmTjVGcnNmZ2FmdFha?=
 =?utf-8?B?L3d1VWsvaEorUWZtVDQybUxORXBHc2ZKK2pIOTRFZlBEcXIyeWtkS3d6Zm1r?=
 =?utf-8?B?VlRmY3ZQSkhwZVYwMUNNQTVQaG8rcExEMjJJbVRNeU1wdGk3VGErWHJORUZq?=
 =?utf-8?B?V1NCRG9Sd1V2clZ4aTlVMlRhOHE3NHFYblRnS1FoTEFMVzJIbFk5MG1HTWEv?=
 =?utf-8?B?b0NaQjlLSm5yVlJ0T2ZQK1FDNXl2R3ZES3JJd3hWdDNadG9hWlR2UjR4dzdh?=
 =?utf-8?B?L1IrVG5RQmdiVXR6M3Rya0VuYnduYXVCVitNYVBvK2FDQklhKzl3RmNablpF?=
 =?utf-8?B?SWx4VzMzbFRUK3o2VVBxRmlZN0NwVXdONFdoSmNYYXYzQnBCdG9YVHRiWnNN?=
 =?utf-8?B?Y2VJVWM3Wndiem1XSEVlVG9XOWdZTjk1WGthVUxOb0hYMi8yWWFJUVRWRVYy?=
 =?utf-8?B?TEhRZ3M1ZTRoM3Q1SCtDUm5HZGNDdHVEZEhGZXZublFnMkYzZksybm16eVFz?=
 =?utf-8?B?N1JhQ2lEdDlSQ1VsRzBkRVJrYXFZK2RiL28yTHcwcXNXb3JSTndQTVZyZFVj?=
 =?utf-8?B?S01sVEUzTWJZNHlTbjJVQ21EUnc1RXdjVmxRZXdlVmlNYjI5R2xlRllrYisr?=
 =?utf-8?Q?xtV/dxQiKHQLTbX4kCYuruVZg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ed1ce1-a3d1-4480-ddec-08dcb0a04cd7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 14:02:51.3754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ew/bgR6addG/g1mbJ/39p81C0aCzXNPKJYP+sIXSluCwHNG3woxHANBINCJjW7r8hSsVPuXf2YE4QKysQ8Dgpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7890
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

Hi Badal

Thanks for the review comments

On 7/30/2024 4:38 PM, Nilawar, Badal wrote:
> Hi Riana,
> 
> On 29-07-2024 15:59, Riana Tauro wrote:
>> Coarse Powergating is a power saving technique where Render and Media
>> can be power-gated independently irrespective of the rest of the GT.
>>
>> For debug purposes, it is useful to expose the powergating information.
>>
>> v2: move to debugfs
>>      add details to commit message
>>      add per-slice status for media
>>      define reg bits in descending order (Matt Roper)
>>
>> v3: fix return statement
>>      fix kernel-doc
>>      use loop for media slices
>>      use helper function for status (Michal)
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_gt_regs.h |  8 +++
>>   drivers/gpu/drm/xe/xe_gt_debugfs.c   | 13 +++++
>>   drivers/gpu/drm/xe/xe_gt_idle.c      | 83 ++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_gt_idle.h      |  2 +
>>   4 files changed, 106 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h 
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index 8a94a94d2267..fe774d0894fa 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -336,6 +336,14 @@
>>   #define   CTC_SOURCE_DIVIDE_LOGIC        REG_BIT(0)
>>   #define FORCEWAKE_RENDER            XE_REG(0xa278)
>> +
>> +#define POWERGATE_DOMAIN_STATUS            XE_REG(0xa2a0)
>> +#define   MEDIA_SLICE3_AWAKE_STATUS        REG_BIT(4)
>> +#define   MEDIA_SLICE2_AWAKE_STATUS        REG_BIT(3)
>> +#define   MEDIA_SLICE1_AWAKE_STATUS        REG_BIT(2)
>> +#define   RENDER_AWAKE_STATUS            REG_BIT(1)
>> +#define   MEDIA_SLICE0_AWAKE_STATUS        REG_BIT(0)
>> +
>>   #define FORCEWAKE_MEDIA_VDBOX(n)        XE_REG(0xa540 + (n) * 4)
>>   #define FORCEWAKE_MEDIA_VEBOX(n)        XE_REG(0xa560 + (n) * 4)
>>   #define FORCEWAKE_GSC                XE_REG(0xa618)
>> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c 
>> b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> index 5e7fd937917a..c623295235d9 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
>> @@ -15,6 +15,7 @@
>>   #include "xe_ggtt.h"
>>   #include "xe_gt.h"
>>   #include "xe_gt_mcr.h"
>> +#include "xe_gt_idle.h"
> Header inclusion is out of order.
>>   #include "xe_gt_sriov_pf_debugfs.h"
>>   #include "xe_gt_sriov_vf_debugfs.h"
>>   #include "xe_gt_topology.h"
>> @@ -107,6 +108,17 @@ static int hw_engines(struct xe_gt *gt, struct 
>> drm_printer *p)
>>       return 0;
>>   }
>> +static int powergate_info(struct xe_gt *gt, struct drm_printer *p)
>> +{
>> +    int ret;
>> +
>> +    xe_pm_runtime_get(gt_to_xe(gt));
>> +    ret = xe_gt_idle_print(gt, p);
>> +    xe_pm_runtime_put(gt_to_xe(gt));
>> +
>> +    return ret;
>> +}
>> +
>>   static int force_reset(struct xe_gt *gt, struct drm_printer *p)
>>   {
>>       xe_pm_runtime_get(gt_to_xe(gt));
>> @@ -277,6 +289,7 @@ static const struct drm_info_list debugfs_list[] = {
>>       {"topology", .show = xe_gt_debugfs_simple_show, .data = topology},
>>       {"steering", .show = xe_gt_debugfs_simple_show, .data = steering},
>>       {"ggtt", .show = xe_gt_debugfs_simple_show, .data = ggtt},
>> +    {"powergate_info", .show = xe_gt_debugfs_simple_show, .data = 
>> powergate_info},
>>       {"register-save-restore", .show = xe_gt_debugfs_simple_show, 
>> .data = register_save_restore},
>>       {"workarounds", .show = xe_gt_debugfs_simple_show, .data = 
>> workarounds},
>>       {"pat", .show = xe_gt_debugfs_simple_show, .data = pat},
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c 
>> b/drivers/gpu/drm/xe/xe_gt_idle.c
>> index 67aba4140510..70fe76735621 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
>> @@ -53,6 +53,11 @@ pc_to_xe(struct xe_guc_pc *pc)
>>       return gt_to_xe(gt);
>>   }
>> +static inline const char *str_up_down(bool v)
>> +{
>> +    return v ? "up" : "down";
>> +}
>> +
>>   static const char *gt_idle_state_to_string(enum xe_gt_idle_state state)
>>   {
>>       switch (state) {
>> @@ -145,6 +150,84 @@ void xe_gt_idle_disable_pg(struct xe_gt *gt)
>>       XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>>   }
>> +/**
>> + * xe_gt_idle_print - Xe gt idle print
>> + * @gt: GT object
>> + * @p: drm_printer.
>> + *
>> + * This function prints the powergating information
>> + *
>> + * Return: 0 on success, negative error code otherwise
>> + */
>> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p)
> Prefix xe_gt_idle points towards RC6, better to incorporate _pg_ 
> sufix/prefix in function name.  
Kept the name general if anything else needs to be added.
will add pg prefix
> +{
>> +    struct xe_device *xe = gt_to_xe(gt);
>> +    u32 pg_enabled, pg_status;
>> +    u32 vcs_mask, vecs_mask;
>> +    int err, n;
>> +    /*
>> +     * Media Slices
>> +     *
>> +     * Slice 0: VCS0, VCS1, VECS0
>> +     * Slice 1: VCS2, VCS3, VECS1
>> +     * Slice 2: VCS4, VCS5, VECS2
>> +     * Slice 3: VCS6, VCS7, VECS3
>> +     */
>> +    static const struct {
>> +        u64 engines;
>> +        u32 status_bit;
>> +    } media_slices[] = {
>> +        {(BIT(XE_HW_ENGINE_VCS0) | BIT(XE_HW_ENGINE_VCS1) |
>> +          BIT(XE_HW_ENGINE_VECS0)), MEDIA_SLICE0_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS2) | BIT(XE_HW_ENGINE_VCS3) |
>> +           BIT(XE_HW_ENGINE_VECS1)), MEDIA_SLICE1_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS4) | BIT(XE_HW_ENGINE_VCS5) |
>> +           BIT(XE_HW_ENGINE_VECS2)), MEDIA_SLICE2_AWAKE_STATUS},
>> +
>> +        {(BIT(XE_HW_ENGINE_VCS6) | BIT(XE_HW_ENGINE_VCS7) |
>> +           BIT(XE_HW_ENGINE_VECS3)), MEDIA_SLICE3_AWAKE_STATUS},
>> +    };
>> +
>> +    if (xe->info.platform == XE_PVC) {
>> +        drm_printf(p, "Power Gating Enabled: no\n");
>> +        return 0;
>> +    }
>> +
>> +    err = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> When device is in RC6 is there any significance in waking it up and 
> checking pg status. I think we should check PG status only when device 
> not in RC6, may be we should add RC6 check at the top.

This is required only for debug purposes, is the coupling wih rc6 
necessary? We cannot save the previous status as there is no park/unpark.

Any suggestions on what should be the output when in Rc6?
Should it dump Rc6 status instead of powergating
>> +    if (err)
> Decrease the refcount / xe_force_wake_put
If there is an err there is no need of forcewake put

Thanks,
Riana
> 
> Regards,
> Badal
>> +        return err;
>> +
>> +    pg_enabled = xe_mmio_read32(gt, POWERGATE_ENABLE);
>> +    pg_status = xe_mmio_read32(gt, POWERGATE_DOMAIN_STATUS);
>> +
>> +    XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FW_GT));
>> +
>> +    if (gt->info.engine_mask & XE_HW_ENGINE_RCS_MASK) {
>> +        drm_printf(p, "Render Power Gating Enabled: %s\n",
>> +               str_yes_no(pg_enabled & RENDER_POWERGATE_ENABLE));
>> +
>> +        drm_printf(p, "Render Power Gate Status: %s\n",
>> +               str_up_down(pg_status & RENDER_AWAKE_STATUS));
>> +    }
>> +
>> +    vcs_mask = xe_hw_engine_mask_per_class(gt, 
>> XE_ENGINE_CLASS_VIDEO_DECODE);
>> +    vecs_mask = xe_hw_engine_mask_per_class(gt, 
>> XE_ENGINE_CLASS_VIDEO_ENHANCE);
>> +
>> +    /* Print media CPG status only if media is present */
>> +    if (vcs_mask || vecs_mask) {
>> +        drm_printf(p, "Media Power Gating Enabled: %s\n",
>> +               str_yes_no(pg_enabled & MEDIA_POWERGATE_ENABLE));
>> +
>> +        for (n = 0; n < ARRAY_SIZE(media_slices); n++)
>> +            if (gt->info.engine_mask & media_slices[n].engines)
>> +                drm_printf(p, "Media Slice%d Power Gate Status: 
>> %s\n", n,
>> +                       str_up_down(pg_status & 
>> media_slices[n].status_bit));
>> +    }
>> +    return 0;
>> +}
>> +
>>   static ssize_t name_show(struct device *dev,
>>                struct device_attribute *attr, char *buff)
>>   {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.h 
>> b/drivers/gpu/drm/xe/xe_gt_idle.h
>> index 554447b5d46d..4b8192d3aee0 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_idle.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_idle.h
>> @@ -8,6 +8,7 @@
>>   #include "xe_gt_idle_types.h"
>> +struct drm_printer;
>>   struct xe_gt;
>>   int xe_gt_idle_init(struct xe_gt_idle *gtidle);
>> @@ -15,5 +16,6 @@ void xe_gt_idle_enable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_disable_c6(struct xe_gt *gt);
>>   void xe_gt_idle_enable_pg(struct xe_gt *gt);
>>   void xe_gt_idle_disable_pg(struct xe_gt *gt);
>> +int xe_gt_idle_print(struct xe_gt *gt, struct drm_printer *p);
>>   #endif /* _XE_GT_IDLE_H_ */
