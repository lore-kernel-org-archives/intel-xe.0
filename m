Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8CD606A33A
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cJnRb8E5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84C110E6F3;
	Mon,  2 Nov 2026 21:12:52 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C18F10E6F3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793653967; x=1825189967;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=cJnRb8E59O9rUSlU959bnwmDH/3ptWDgf6kxZWoBh0E0rEODH37gFcQC
 A3Nj1lYDXxb87tzr/k2zgAHnHX+yARvQlzoZUe55GJ2opspaOcScd5Sow
 kfctbOR0Iqjn8wBs5syBvn6DyiLwlY0zuWO5F8sbXPD5nP0zGGQ4sgDXL
 h4FTpKCGJzUQB7aasdvCA1/MG9XHjd0hJRPYdvYCj/JgL3zPb62zMU+Ag
 STtN4ZIMqrDzb3EqFz1OKv7QKDKCudYdHBSoZsEU/S1Z8e3oYKJzMGW3r
 vMZiLOkbt2kcXjxotp+4ZN/jpN1i1fsm28VwIOMmZgb5qX8nknkxRA3LY w==;
X-CSE-ConnectionGUID: ccegfi5eQqeJUSAi17K5/g==
X-CSE-MsgGUID: CKHJSTrPSdGxUAp+MTJDVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2245772"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2245772"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:12:46 -0800
X-CSE-ConnectionGUID: fG0Mld0KSEKZt7yvjrYW4g==
X-CSE-MsgGUID: oAqIA0HCSa6xB+VVITANSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6230772"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:12:46 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:45 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:12:45 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:45 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mxJ1jAp/4spuCsXmN+hOl8dua1lj+Yf4DejnEtmGTQDclElLahRqqu26tZnPJwuX+NGzp60PXQ/FHXSKUCzQcI1kiY2BKtq4Rk3PdssAknCNGWaERqcuYq9gpfr8IRNyRdx50vh4MiLmNQ0adbH6Omz3KtBRW4Ki9CdR0O037sxJH0W1yJJ5PVnauaSg03xJ+kVlcPs4KLRJaszRJfEoeSkZQxb7XjTF1qpdFpANRibyVy40MFA6GwAno4F4Eckjs7REnirhZytJcl7/7kclbPEUej2nkKk/GlfiQwGrmP505iyiWFcME8FJcGHNr6evu8O65406/uSfRR4PuDYCgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=BXoTJWeZTdM9V0pIfgRbFgIaTPeAejJgf7JMFl+1EDWBWafwx5uZuDynXLdbsTcJ428Ol6QcTESSH3IPnl1LzbX4Fj4o9qYxYi9kj8/k47dQQlyHqUAcpRyZ+3P+Tkh4c7sFQtOHbOeC8mFxlqXxd/+ZNhTHGsuWmDRJW4E2RIOtdQWEtE2yv7G5vWAozdtnzR1Mv+uidQZfdY6XOVNb6LieiLTJYUdg58uwrn+CWfnWzFiO5O/99vejBcpyeK+izgv1m0SIzDXT06mZr+GkufzvBy3Xr1uPE41TDVisEeyNSB312Q8IhkIJLs/R1rKcGgDC+7lkkhBXqBLrxbZaig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by SJ2PR11MB7476.namprd11.prod.outlook.com (2603:10b6:a03:4c4::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:12:43 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:12:42 +0000
Message-ID: <35610484-b2d4-4192-a57d-3233ceed66b3@intel.com>
Date: Mon, 2 Nov 2026 13:12:40 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] Revert "topic/for-xe-CI: drm/xe/cri: Define GuC
 firmware for CRI"
To: <intel-xe@lists.freedesktop.org>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
 <20261102163840.2231293-8-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261102163840.2231293-8-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0011.namprd02.prod.outlook.com
 (2603:10b6:303:16d::28) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|SJ2PR11MB7476:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c7d435-ea27-45f1-bb12-08df3926086a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|376014|1800799024|4143699003|11063799006|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: ndMvj1zIsbisB3aS3U9d2R2pSjwBVJXVTv3AZUzsb0Y7UkfWjeBY+Nl7ELgp9oQwsw9FbVyG39FY6v5GrzpZOfQ5Yil3P/vR8dMdgBhgGgrytHSbBoI3qR+d+82LhuIoBSXnKMGdT/RyXVWQLvYIBDPgMZUNZotQ0sSsVVDPHHDCNqjCTS4UTrffy/2ISN/nvoTTypgL03Uq2eiPTybqNYshlFpydWnLlhu9GPAVAyZHsSWRPO9Cala12C60ACwYzMr7CyCTZbw1FOqr36RA2WeWGNJFJxSMD3CGprB7c7REMYZLzXF6lhZLVtNpLYIQelAvYvq3zcipYTlF6gkYAHc8E/d1cMvy/B2u0LiufrVAZU03EYhFRshVIpwvXmQihHaVxsNZXW37HkTQ4ZLIbtCYD8+b/IqpAFezUG53Q1n3aQMmcP3egJNmPLwK+vFBySPjGniwCMTixiN+notYZ4RLz7NXoxcA2K/vo7I8VmAmL1AjehRgzYNAgkKG41bPgtAzyMqRdh7vrMgIIRQMhf8kIc4xv3p1bkJaFFScrLDwGDZCMczaxhj/DY2/susDUS5TNxYLH1oDghCSM//0WjR9pzZrfatnjfBZRDknUXw/TaB7XyQwJ8097+s0Q6yyuUBsym5XeQnqoP7r6YoZEPMLz9/z5v9JsYOXpSfUvRI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(4143699003)(11063799006)(10067099003)(56012099006)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b0VXN1loNmN1S3I0SlErczFyS2I4Zmx0Tkp6bFVvYTNOazJId3dycjJtRzgr?=
 =?utf-8?B?MGF2YmFwUTZVaytCdE9JYkc0RE5obDFVWi9xL0VnRjMwTGt2SHFiditzVzV4?=
 =?utf-8?B?K1BUWnozVGpnYlVnK001K0V4bWhlNHNBSzFiRHNaRmQ0SWNLNnRGRW9GOHIv?=
 =?utf-8?B?b0lhaGRZNnRnNllXT0h4cW54R003eFFzUGpFbmFmQmtRbTM1VDdlTzVzcEJy?=
 =?utf-8?B?WGdZcTVUYWtGZ2swTW9Yb0NnYWxFa21vd1o3dkJJNC9wUzh0U1dFRm84YjBK?=
 =?utf-8?B?RGl6d2x5T202amxJTExtcC9NRWxrenJkNUJPenUrNjZXanUwVFMzYm1adldl?=
 =?utf-8?B?alp3MTBxUTloTWRMUnVzdlBFUmpXQTIvVDV6MkVxeDF4ODk3Y2x6Wm9GeU5n?=
 =?utf-8?B?d3Z4aGs3RVVIWjJVSWxzTXRhcVZvMVhFc1U2Qks5dG91WkVXRVB4Q09QQkQ4?=
 =?utf-8?B?VG9IdlN6K1RXaHNIK1ZCMmRiNVIyMEVwR2VFMjdDYjhlVXpVdVV1WEZTdzJ3?=
 =?utf-8?B?MzNKZTdWTUc2cGpITlhZQVVESjlvU0hXME9idW9TM1BGMUJlVWpZWHlzWGli?=
 =?utf-8?B?eU15Q09oQXJ4YWgyUHNocDE3NW9iaXY0cDRESjNOd2p4ZWEzMnFzQThuV3hu?=
 =?utf-8?B?NVFmMjJ3aDZIdUhjMnJyQksyZ09DMDZPSU9FakxhbnN4SFVqKzZNY3NacE01?=
 =?utf-8?B?V2VvSnVGZk1ENmZraEhFMWNSTnlkKzZlUnJicGZabmZ3TzV0NFRCd3RKU0tL?=
 =?utf-8?B?cHpTYlRFRXFMYVNoMHRSMHBEc3NHcVJOZzZ4dmtZRk9FN2RYYnVRZnFTNXEx?=
 =?utf-8?B?eFBUM2I3aXZJUW0zb0xFVkd6ZzJTSVcwK2tYVkwxVjF1SUY1eWJCNllsR3lM?=
 =?utf-8?B?R09tSUhIRFpUcDd3Zk94Vk51aHVKS0ZIVGkxTEQyTlNtMWtvcjRMekZVZVlJ?=
 =?utf-8?B?V2w0NFhjYm4xZmh4eDZIUHNsenRsaHp6bXQ5MkZsbDZCdU9aeDV2N0ZJU2NH?=
 =?utf-8?B?NXp1S2FzUkdZQzhJc2ZaZlpMWkJvL1ljVVNUaDNCQ3Mrc3NocGZXZURqcUsy?=
 =?utf-8?B?SktzeTU4NEs2dndkbHVXOHpucEt0b3hkY2c0TzlabERnWVpoVXpyeUpHeERC?=
 =?utf-8?B?bU9zWUYxVUVGdytnU2RUSXJralM0ckxCZHRkWi9zY2RsZjV0UENmWFJzZDUv?=
 =?utf-8?B?Y0JueTE0N1k5RERvV25iM0JUcVVJK0F1RE1Id1FWSUxXaVM2ZVV4VXc0M1Ay?=
 =?utf-8?B?RGREclA3VzU0ZWpPVEVFNnY3bjhqSTljMXdqQmFXQjhLbXBmeDVYV05zNEVx?=
 =?utf-8?B?RGdHSmFFT0hxM3llZkRYYjZRMEFYRmlGaHRpbWk0emxrTGdZUGxwdHlvMXFr?=
 =?utf-8?B?ZTE1OCt3Z2ZHYkRSejFMVFVVd3J4U3VGcU91UitUVFhiS1kxb0ZzZHo1Nk44?=
 =?utf-8?B?Q25iaExFRXNhY2Y2c21laTZid0g0OVFTbWxDRTNUWG0xY0ZLRW90QXFRSGNZ?=
 =?utf-8?B?VURHd0tkTkNWK1hIREIwbzFPT0NHL2VSUXEveTZQWEdFNGI2eURCeVZGT1BW?=
 =?utf-8?B?ekxMSFpwTkpWcDVFbi83bnByNTVTWFJ4WGNHcWVTdENXR0NVRHprU29vcUQ4?=
 =?utf-8?B?MEptU1o1MHZibXRUTVEzR0NqZHNsV05XU3lGVVM2QUhCeC9lZWNmbDFxQ2xt?=
 =?utf-8?B?M2czd01xU3UrNFRPNy9iZDlVaGRvbGE5QUFNNklySUlPWUViZGdsNmRubEUy?=
 =?utf-8?B?Q0dyLzBCaFRlZmFXT0RzNUZnbGpqN3dNZUlyR1NBU0xnYVVoYm02SzdUY0N2?=
 =?utf-8?B?QVpYS3k4ZGNkZTMvaFRUblRReENVSnhmTVF0QnRHTlU1TlVlMXJyNi9RNXl0?=
 =?utf-8?B?S0JQeVRXT0pwRTZsUzdlZXBEbHhmODdFL0F5SjNKVjZrY2kzT3FXdHVIdURG?=
 =?utf-8?B?RVlxVklTb0U0dy9IN1UyRTJyRFpVUVdrWjBhWDVtUmhuYzJadEZzSys2dkZs?=
 =?utf-8?B?dmI5bmdHR2pkRXBIek1BRjlhc1pUcXk3OGpGN1dzZy9OUlZjcFc4YW5lV2R3?=
 =?utf-8?B?VVhTbFJ2U3NiTkQ0RVNDU1JKMW84KzRZZlZHQzd0Vng0UzZJK2hMbHdrSzll?=
 =?utf-8?B?dWprUFMydUpDSWxsYi8wTlFYbkZ5eTRabG9WM0ZDczF3MFJ0TGRYZW1VUlRJ?=
 =?utf-8?B?RXlKVUhkYVFBcW9aMEVxZ094STNWT05haWc4NGdDYUNDbE5QbTBTOEhsUFo4?=
 =?utf-8?B?bm1sT3ZHc29veHdtNXdLaXBKNWt6cXhQcXFtVmk0QXViUU1seFB0YnA0eTFy?=
 =?utf-8?B?OUNyVVo0QVZKbW9rczhlSHduV29VR1ZTeUo5Tk9uRGhDTkx5Mmk2Y2xRM0do?=
 =?utf-8?Q?MKAc4K0XOkHJCLO0=3D?=
X-Exchange-RoutingPolicyChecked: j9fUbsk0EP0/nHjnt6lbJmTmzN43s03+Skh0KPDJpbO7JsBUoLKfWhbOxy8vIJw8+74wbgLR5YIKyzMT7UawrndHPNIWaB4hNpYtfwnQpbMhhqErD3CJrrChcpBlLmvyllF/wxhUQ8+JnF5yzBQ2/nhzHZ08R1ZeZLdoiuOozsH8x9wluwKBms0B5jDUoihHXpDlapX10fPqB84kQlen/EeUEutoiuqMWm5BCXLC8OLOniEUEkpSGvq4reoDN8/6aOFc3oP2pFQBIRGwY9ybR7HDGz7XXP2wndbQh0+DCyHc+UK/f4mHb+Ldo1BqyT6D7RyfFsiwk3shkAESccSGIg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c7d435-ea27-45f1-bb12-08df3926086a
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:12:42.4381 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yn57EdqUnWZ2y6fhNR4iigosH/sP4zxVyO2dxkGitjvVNGPlHWJNljQOdZ4DvoCFqShM84XHiLtD7Hj0KDOf4Z/rGQxhTEn1NX7DR9FmW4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7476
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Acked-by: Julia Filipchuk <julia.filipchuk@intel.com>
