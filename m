Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0273C02198
	for <intel-xe@archiver.kernel.org>; Mon, 10 Feb 2025 16:55:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87DC910E396;
	Mon, 10 Feb 2025 16:55:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NVpqReu9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C57E10E396
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Feb 2025 16:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739206521; x=1770742521;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=6dxiq4PjMB3dkRrwh1795ViFwBL9aNYE+Pl9rSp0m4Y=;
 b=NVpqReu9XStHjWow17a3M6yoFj4aZSAqanD5Ty52HvmsTQdXBE+muopZ
 WpvKtLIIZ5lCW9pVuP1H8M7a8W40ReKX2IbTdjLJCbKeUbn1/l2JkRp1N
 VzNJTVLcMV3LksSayBSVao+Mc862wyaZ6wdBZGKljRl6I6LwOhuOcAEEa
 IwaIXv22ilVhKBQcSvTHUVzpDE+rfEEaN3i+MnAusvW8aTV+PCK72efdK
 D5FjVnfbEYV27etii5yPxF8oxesCeac1qreI6TWheEE6V24oL+L4i3htA
 KlrtGQeOrk7YNMMCxNor31A+ButUAsRFqk9XrPStRjRKjR45164DagHsW g==;
X-CSE-ConnectionGUID: a3XDGh9oQumrz3+UzGrekw==
X-CSE-MsgGUID: zi34Kdy4TNewEXaaSFi3jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39910095"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="39910095"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 08:55:20 -0800
X-CSE-ConnectionGUID: K1MsByFDQ7SC2FiSbINUzg==
X-CSE-MsgGUID: hiBc5evrS6G46zhhZPsF0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="117263922"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Feb 2025 08:55:20 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 10 Feb 2025 08:55:19 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 10 Feb 2025 08:55:19 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 10 Feb 2025 08:55:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a+jb5LOAASc9QFlZNb7xH6PMD1hrt1/Xk/O9B5J3c+OGec8FiLJ281LvYD3ZSDDHZky2pUcvU+EgmpBCLMQK7Zk7NifMuHxJ1/F9y51NZ2pDtABEosld8kez9S494p7I3e8QJaI/TsKAJ5j0FEvMQGVPNPrd85zMP/8hQaEsLbKHZ8r68r0d2NkSf08VPr39IkPT1ykg+dZSZGkhHbXmp1f3WmtZTYVoer1QaiD+fEztQR691DCCWlb1Af3zUA4b+0ThNYaiACGsLsHiBUy3ATp/3C1rAhh6/YnDdIiGlrhy9YdfUK+Mz6HOxu2nSw3NVPN7WVxV/2lBirM6ifM7CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u1Wm9ancvziWGT0t8lDczrsG+3XKJpeSpWUZuHZf/yg=;
 b=K6+RvJu9rIvI/YwprHE+zq+F0VyMtUTpwU/6YAHqRxEjDGLcNkxFxwWEFSW+bGyqZMGMyzOegIuy6yEZRmhopVbOD+Zmg7+lf8tWdWJQclsM+Y2RQiKveG/IQV0EGRM7GCWPFob+zQmjTpU4rBPmrkEs91sbWeMniOf2VDMmy4rBs9BETE6th3DiMlfsrJxXWjZEAFtpzthrqLAy6b+iaVwgYXG+INve9bVePaDAsKBALyKYQlNBZeJ51tD9Wfp44i/WlRF1YVjcca1+mu2SuXqerzIzxdXr6QncUrvzGGFvD+Wk1ATSK9AeBofyt8t0zsMqvVsrGLYzeQ4eOyX37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB7498.namprd11.prod.outlook.com (2603:10b6:510:276::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.17; Mon, 10 Feb
 2025 16:54:32 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8422.015; Mon, 10 Feb 2025
 16:54:31 +0000
Message-ID: <815cc1a9-14ee-48cc-856d-694bdf7bdd1b@intel.com>
Date: Mon, 10 Feb 2025 22:24:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/13] drm/xe/hwmon: Stop ignoring errors on probe
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ashutosh.dixit@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Francois Dugast <francois.dugast@intel.com>,
 Matthew Auld <matthew.auld@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Karthik Poosa <karthik.poosa@intel.com>
References: <20250207221945.2878241-1-lucas.demarchi@intel.com>
 <20250207221945.2878241-14-lucas.demarchi@intel.com>
 <44030d2e-2921-407a-a32a-1c52e2b13062@intel.com>
 <uuvuoxdimp4iqy6m3o7q67z4ruh7nfmhsnxenbhjd4h7dlhbak@epph57yfuqxn>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <uuvuoxdimp4iqy6m3o7q67z4ruh7nfmhsnxenbhjd4h7dlhbak@epph57yfuqxn>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0PR01CA0095.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:af::6) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB7498:EE_
X-MS-Office365-Filtering-Correlation-Id: afa8dd18-9fc7-4222-d761-08dd49f3971c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alNTZklsS2dJdGxVUGx4U1FRU2gxZUs0UzBvUUU1VzNjUkpJUVFMdVVMNm1K?=
 =?utf-8?B?WnhudnZobG56ZmhxdVNnOUNWZnBkeUszby9ab2lyVXRFRW4xdkZVSDlWaXpR?=
 =?utf-8?B?Rmp3clRrcUduUEtrOEpTVTdrNS9HSW0xVGwxdEw1NjYxNll2M1p6TDZyYWQy?=
 =?utf-8?B?STJ0dzRsRnNlcXgzRFJtQm1EVytoODVoN09YMXZyYzltZmFnTVFJYWsrbnh0?=
 =?utf-8?B?dm1hWFQ0R2VHVlRFRzFYb0Fna3JNU1VHM1N5TkVUaVRkNE1vUGVuWTRJODBx?=
 =?utf-8?B?bmJHQkZmaWhVS3hka3dBRFBWVUtTTXZmTGg2YTlFZ2ZvbDUvME9FcDF3U0o4?=
 =?utf-8?B?OHp0NkQ1STJka2JiMnVsOUYvMjNFdVYxWXd1STFTdGd4T0Y5WS9vTHIzejBO?=
 =?utf-8?B?cVhJTFdVWTlpY3VieTRaYkkxK2lLa2duSTV2YTA3R1lnZU4xVFgzQWNXRkVW?=
 =?utf-8?B?Sms1YXRLRnp2K2l0Ty9ZYklhaHlyTUkvVWFYSk1tVVd3WVRqc1VidjlpWmhH?=
 =?utf-8?B?cXRaR2lpQVNra2dUZ0Q2Y2FzRmorQ2xiUnh0dU94R0FUcUVWZ08rZGxpK2w5?=
 =?utf-8?B?MjVPL0lpYUdKc1pDZklNcEwxQkdBbEZLeURsR0dJOVlyWk42WXJBRThnQnFj?=
 =?utf-8?B?SlBaQlordW1rdEk5bUllMTZRZ1QzbXRyZ3B1NnQyeUErUkN6RHpScVJtelJs?=
 =?utf-8?B?TTVxQXZINW50MXB3dHJ1emc4M2pwaVRJK0N1T21DejJSb2RZejdDR2dadWIr?=
 =?utf-8?B?eUV5ZnFCdGRnUUdpRW5CdHhpVHZKOWptb3hKemY0QURGSnNPcTY5YlBXZWdD?=
 =?utf-8?B?Q21PK0tDd3FZYXowdjRRTCtMMVh4RHlNZ01DL2tWZDczUmZCUTBLWWdTOHR3?=
 =?utf-8?B?RUZrdzAvaS80b205Rkt1V0Z2alVvMDdhNnpEblBaT3lSMTZ6K2JIOEIrM2pL?=
 =?utf-8?B?dS9UQnN1a1lBQWRFYXNyTEhYeXliTlJpdFJXNEFlWEdHTjRqZkJRQW9zZjNw?=
 =?utf-8?B?RzBEcVdUOWF1cS94RG1ZMXlPcG1mSVVpZFlkMlZEWjlDeURnQ1dhWmJzcGtD?=
 =?utf-8?B?RmFiR0FSWDJvNkx3dkFTZTBQU0Z2YTdQTG15R05GaXllMjIxeDlLZUMvK0E0?=
 =?utf-8?B?NU8rdXl1UFRvaXlNUVpBMlJyOEwzbE9ZVW1ZLzFKMkRhazNpelRTYWlBTnRM?=
 =?utf-8?B?NXBMS3ZBcDNFRnVMVjk3b3JQaHVqaWFQaTVUclhiRVljWTkxYTZqS3hzTXFM?=
 =?utf-8?B?MC9oSDhwOWhtQzlmQXZ3azc1WmswLzd2RDMyYlBQMzZwRVd1ZlpiWS9CeEVF?=
 =?utf-8?B?ODU0aTU2OE9qUllSUVJxL0xXZXFhL2k5WXdJQWVybW1KR01kWkpNV3NGeDZG?=
 =?utf-8?B?SjJpOHkzcXVSdFhnZ3MyN2lEODh3dEFlNmJaOE40Z0Z1SHg1WmxkcHNDemVi?=
 =?utf-8?B?c0dFK2hhNUxOSmp4MEl2VnVaWjR1ZGdPeW1VV0d1SGx6Q3BOR1hzeGZscnZu?=
 =?utf-8?B?azkrZkRpMXJUUkNpS1NMb0I4Ylhqbk9VMnRRREdWNmZNSVNMR1JpaHQ1R0VR?=
 =?utf-8?B?RjJrN0xyUWFzYjZqd283ZndGTSttTzJsY2gxeG5ZMTUzUG41Z3B5dFRIWkZi?=
 =?utf-8?B?R1lZRmlhdmJaRFFJV3dBTlZ6MlZzdlZGaVVBUjJacjhRR0IxNm90eUtSVUQy?=
 =?utf-8?B?U01UZ1l2TmduaEZDcFJCaTh5MWhoaSsrL3pRY0d2NHdWZUlNNFcvcVkyMURz?=
 =?utf-8?B?aFZlamVzWGpSNWc4OVFtdGJxMkpuZGx4QkZYa2Y1LzYvVHgvbk12YTB6ZnlM?=
 =?utf-8?B?UmFrOHV1Zlk4cGdLUFZFckp1MWpLUzVPMUxQTm5JUEpTcUFBdjlFcEUweDBX?=
 =?utf-8?Q?IY8E0Vs0ja0iS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHhHY2FBNFd5VTdwakg2MG9KMEk5YzRPRVdJZnhwMjlSN3huQkh3NS9GeldI?=
 =?utf-8?B?KzlnU1VrWjYyYnVmM1Q0cVNFdVQwa1djK1JJYTltQmVsZ0c4TzA2bHI4UzJK?=
 =?utf-8?B?akRIQjc4enkyMytlMkYxQ1pNSmplN0NOdCtOUXdUcjhWdU1rM0xxV20rbXJw?=
 =?utf-8?B?MHNHaVNQYkNDV3dHVi9EZUc0RVlQSVArelZTWGt3L3lWZ1llQ1ZaZDJLTjlr?=
 =?utf-8?B?dXFETkZWeWNoMzhodGtqdSs4b1VWRzRXYmxGWVVQWTBRamt0Z290aDdic2xo?=
 =?utf-8?B?TW5Xc1BiRkV1QytubElmWTJnVmRKNk9FNGZDL0RuaWVFVTFVNU51SDJkcTBG?=
 =?utf-8?B?UWticVl4dzFaTStYeHVxL01WekM4WXhPa3hKUlg5T01rQmszWjdzZ3NFWXFS?=
 =?utf-8?B?VC9mQlVTT3JlcmhzU24zelhUVWlncUx4OVZVVkkwNmVLWHFxUHpENUNhM2U1?=
 =?utf-8?B?WlM4VUs4R3dQOTBtZE9TdEovTjZCVzN4emhkZ3pIUjVaY2RLVmNjRkJzZTNx?=
 =?utf-8?B?ak01TG9pVkJUbG13NFZ1S3ZuQThWcmJ5RG1YWUorVlNGckRycEF6TWRYK0Y1?=
 =?utf-8?B?dmp0VUJ6bHNKdTM3U3JMekw4YzJudXIzZm5rNG9td0Y1bVVvOXFGWU9ibmRz?=
 =?utf-8?B?YWpDRDlyZzBHWlJ2TmlMSUNmbm9nQlhESGNLa1dsWTFWalhqWmI2TFlLNU5o?=
 =?utf-8?B?VUZKZHNHOFo5TmhKbFVQeCsrRDlib2pGTlE0dkE2d0JpaSt1TW5WRGZOSCtp?=
 =?utf-8?B?dE9GK1A3MUVDQ2pURCt0aGNLTUhvblhadUlMa0U0c2RPVzN1RUQrS2hUVVR3?=
 =?utf-8?B?ZGJrV1JKYUFOZnZIaVJDVi9YWlJSYS8yZktlcCtIVzZ3M3lWZFgrSTJsb1lJ?=
 =?utf-8?B?ZTFLbDhBRDZhRTBWdjVUMCs3NGw1b2VkY2JOTWtNYzhaK0pNckdQdVYxc29T?=
 =?utf-8?B?WGtpUVgyeU1FT1k2bG1wQnYzZ1RpK2Z3NEtPS28yeHJFNnJiemk5eWxSYnJS?=
 =?utf-8?B?aUpOZ0R6TlB5Mmh2QVdOZGd0Rm0zWXV6YmUxSjlOeTlSakxCNE9KeHNQUjls?=
 =?utf-8?B?VmlKU0FVT2pTU0FOSGlza0RxMUhGTy95blMwYWdHdXBUNmJtS25JbHM4MXM5?=
 =?utf-8?B?OHRrQ3lvbElSUUVGQ3BNMm90Z3piNnA5Vk4zdmIwRjFMK2VlYVB2N3JZWnl3?=
 =?utf-8?B?alJGZGRock8vcEJNQTF6ZVZjUWNiWlNFcDBmaytMUXpiSTB0OXBCWVdLWFhV?=
 =?utf-8?B?WTFteDRPdWc2Ky80MmZIazFVck9JSDMveUNuOHVTajVoRTRhMEFlMTA4QlBL?=
 =?utf-8?B?bmwrNkxJQi9pWEJ3NittNzJ3ekZsWmxxeHhlYWh3OWFUVkg3dmpZRXFhdlpT?=
 =?utf-8?B?K3lHTWZhK2ZJUlNzeFBMVW1OdjRHTFdRbEJWdWh5bUE5RnozM2NkSmtNWG84?=
 =?utf-8?B?SGIrNDl5YUtPd014Z0sxWVBwR2c2SGRzSnRsamNXdU16NlRGY0NFOVpSL2xO?=
 =?utf-8?B?Mk9jZFlhYWhvVXJ2dytTcU9hd3ZIK0ZhTkZwMnpiTS9tamlUdTF4THE2dzZP?=
 =?utf-8?B?U0JlQm1jMTRnSE5FNERBVlVFMy9WSE5UTHBnN3l3NENWVUh3VWhjck9YWkl2?=
 =?utf-8?B?MW5YSWlWcWFJalhaeDM5aFdHbytMcTBjZDYvcWErREt4NlU4M0UrelF0ci9l?=
 =?utf-8?B?WC9tWnUzVDdwd2VLT3JLUFdEVkZOTXZMd2NHMTNaRjVDWGlwaXczNGVHOXdt?=
 =?utf-8?B?S0szWGYxNkphYzN2Z0hSVzB6WTBBZGU3ZS9EYWxGQVY1N3BXalNIRjNZSWI5?=
 =?utf-8?B?YWtWdFUrU0JyTEl4WGFwaHRvWktkUTZkMXNsQUZ5RWs4UTFnRERKZUMwcGtT?=
 =?utf-8?B?SWc0eTRIMTdLV0dueENvbVBpbEo4cG9pVERGZ3dzZHk2VHFWbmgwYm5Hd2xF?=
 =?utf-8?B?SWtnSnNtUk4yWnFLMExyWUlHekFTTFh5SnZKamJGUTd4ZzFIMU1HTWdZVVhp?=
 =?utf-8?B?M08wTVdZaXVLWE1oeDRMa3B6cjBFRm9KWGdRQTcra0tVYW90bnBQck5pYmJU?=
 =?utf-8?B?UUVFek1QSURHUnpUelY1SnBtckNPR01QRnY3eVNKandTZ0ZMUnptTHpJMlB6?=
 =?utf-8?Q?AFdK98OuIxIEqJR+0TkQB2v60?=
X-MS-Exchange-CrossTenant-Network-Message-Id: afa8dd18-9fc7-4222-d761-08dd49f3971c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2025 16:54:31.8943 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBJTgfQ63mVR5ZYSPvho3HmJ5ZMZWjTyWYvqvFnjUO/aA+G1kia006NQqSXwHY86+VnEsr7ZngG2Xts/ln6KlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7498
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


On 10-02-2025 20:45, Lucas De Marchi wrote:
> On Mon, Feb 10, 2025 at 11:01:15AM +0530, Nilawar, Badal wrote:
>> Hi Lucas,
>>
>> On 08-02-2025 03:49, Lucas De Marchi wrote:
>>> Not registering hwmon because it's not available (SRIOV_VF and DGFX) is
>>> different from failing the initialization. Handle the errors
>>> appropriately.
>>>
>>> Cc: Badal Nilawar <badal.nilawar@intel.com>
>>> Cc: Karthik Poosa <karthik.poosa@intel.com>
>>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_device.c |  4 +++-
>>>  drivers/gpu/drm/xe/xe_hwmon.c  | 31 ++++++++++++++++---------------
>>>  drivers/gpu/drm/xe/xe_hwmon.h  |  4 ++--
>>>  3 files changed, 21 insertions(+), 18 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_device.c 
>>> b/drivers/gpu/drm/xe/xe_device.c
>>> index 002e066f5f288..2e6f42d1b1d01 100644
>>> --- a/drivers/gpu/drm/xe/xe_device.c
>>> +++ b/drivers/gpu/drm/xe/xe_device.c
>>> @@ -889,7 +889,9 @@ int xe_device_probe(struct xe_device *xe)
>>>      xe_debugfs_register(xe);
>>> -    xe_hwmon_register(xe);
>>> +    err = xe_hwmon_register(xe);
>>> +    if (err)
>>> +        goto err_unregister_display;
>>>      for_each_gt(gt, xe, id)
>>>          xe_gt_sanitize_freq(gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>>> b/drivers/gpu/drm/xe/xe_hwmon.c
>>> index 7f327e3342123..48d80ffdf7bb9 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>> @@ -839,10 +839,9 @@ static const struct hwmon_chip_info 
>>> hwmon_chip_info = {
>>>  };
>>>  static void
>>> -xe_hwmon_get_preregistration_info(struct xe_device *xe)
>>> +xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>>  {
>>> -    struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>> -    struct xe_hwmon *hwmon = xe->hwmon;
>>> +    struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>>      long energy;
>>>      u64 val_sku_unit = 0;
>>>      int channel;
>>> @@ -876,33 +875,34 @@ static void xe_hwmon_mutex_destroy(void *arg)
>>>      mutex_destroy(&hwmon->hwmon_lock);
>>>  }
>>> -void xe_hwmon_register(struct xe_device *xe)
>>> +int xe_hwmon_register(struct xe_device *xe)
>>>  {
>>>      struct device *dev = xe->drm.dev;
>>>      struct xe_hwmon *hwmon;
>>> +    int ret;
>>>      /* hwmon is available only for dGfx */
>>>      if (!IS_DGFX(xe))
>>> -        return;
>>> +        return 0;
>>>      /* hwmon is not available on VFs */
>>>      if (IS_SRIOV_VF(xe))
>>> -        return;
>>> +        return 0;
>>>      hwmon = devm_kzalloc(dev, sizeof(*hwmon), GFP_KERNEL);
>>>      if (!hwmon)
>>> -        return;
>>> -
>>> -    xe->hwmon = hwmon;
>>> +        return -ENOMEM;
>>>      mutex_init(&hwmon->hwmon_lock);
>>> -    if (devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, hwmon))
>>> -        return;
>>> +    ret = devm_add_action_or_reset(dev, xe_hwmon_mutex_destroy, 
>>> hwmon);
>>> +    if (ret)
>>> +        return ret;
>>>      /* There's only one instance of hwmon per device */
>>>      hwmon->xe = xe;
>>> +    xe->hwmon = hwmon;
>>> -    xe_hwmon_get_preregistration_info(xe);
>>> +    xe_hwmon_get_preregistration_info(hwmon);
>>>      drm_dbg(&xe->drm, "Register xe hwmon interface\n");
>>> @@ -910,11 +910,12 @@ void xe_hwmon_register(struct xe_device *xe)
>>>      hwmon->hwmon_dev = devm_hwmon_device_register_with_info(dev, 
>>> "xe", hwmon,
>>>                                  &hwmon_chip_info,
>>>                                  hwmon_groups);
>>> -
>>>      if (IS_ERR(hwmon->hwmon_dev)) {
>>> -        drm_warn(&xe->drm, "Failed to register xe hwmon (%pe)\n", 
>>> hwmon->hwmon_dev);
>>> +        drm_err(&xe->drm, "Failed to register xe hwmon (%pe)\n", 
>>> hwmon->hwmon_dev);
>>>          xe->hwmon = NULL;
>>> -        return;
>>> +        return PTR_ERR(hwmon->hwmon_dev);
>>
>> Hwmon is not part of drm subsystem so we didn't tie hwmon 
>> registration failure with xe probe.
>
> We don't want a half-initialized driver. We never did. The problem is
> that we added integration with other subsystems and brought this
> initialization-style from i915. We are just hiding bugs.

Fine, I agree with you.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal Nilawar

>
> Lucas De Marchi
>
>
>>
>> Regards,
>> Badal
>>
>>>      }
>>> +
>>> +    return 0;
>>>  }
>>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.h 
>>> b/drivers/gpu/drm/xe/xe_hwmon.h
>>> index c42a1de2cd7a2..d02c1bfe8c0a0 100644
>>> --- a/drivers/gpu/drm/xe/xe_hwmon.h
>>> +++ b/drivers/gpu/drm/xe/xe_hwmon.h
>>> @@ -11,9 +11,9 @@
>>>  struct xe_device;
>>>  #if IS_REACHABLE(CONFIG_HWMON)
>>> -void xe_hwmon_register(struct xe_device *xe);
>>> +int xe_hwmon_register(struct xe_device *xe);
>>>  #else
>>> -static inline void xe_hwmon_register(struct xe_device *xe) { };
>>> +static inline int xe_hwmon_register(struct xe_device *xe) { return 
>>> 0; };
>>>  #endif
>>>  #endif /* _XE_HWMON_H_ */
