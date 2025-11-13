Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5056CCD8C9D
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 18:05:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F7A110E918;
	Thu, 13 Nov 2025 18:05:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PBWCaEWW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EAC10E918
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 18:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763057137; x=1794593137;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=KJOZytyAcmitUKxZkMICaitGDOeKTRF3LVR+tVsCEXI=;
 b=PBWCaEWW8VE0a5FdYOmOfSijUf6aVSfn9txf8S8XwnCjGTAjWFw3TaaT
 qM/64FyNJnnjrIlZmUs6s3aDQ8BuDTpjt1R9jQkVpfUNMxlyd6I6kPPEv
 70yn0gTTE24+aJUrXyRLiHMlSlOubBCNUH0JixvlrGQh9392jNzHzzwA3
 LQ5YMfSFG1hAzGwR5zZMrWjzNjvtGcbAzYlkO4RYLijNrAweyqIe8yB45
 hQK5JPGqUWAV9di1TVFdaHvdhUAUr9ndSYdY+6qLHDqzUrqwFaGjlEotR
 q7VGfmSPGJA+nq4bdfmNg5UUz6xI6E9pkzskDQEa7omH4oMvpCUzPwsqN A==;
X-CSE-ConnectionGUID: KMTjXxV8RV+vgeUa0xULLw==
X-CSE-MsgGUID: XBqKRLR3R2qV88B5Pp0EWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="52711824"
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="52711824"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:05:37 -0800
X-CSE-ConnectionGUID: 6LX81PIEQJ+U+bFz6881wg==
X-CSE-MsgGUID: vnlthqoKSTyaEVReNauM6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="189574936"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 10:05:37 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:05:36 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 10:05:36 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.69) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 10:05:33 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N0JPABmhgxziro/SqsGQvGiDd38o+JDUjL4yOhY9kQvSl3uKjsiRkBDCpbN1OtZwj7YNsfTrFRHOaerp5NPqEWrfoFzMv+m8s1Zu5qUmDeKeSsZ5DVHBA663qhAVSAoOhBEFUYHfgsW+Q5xwizJHdYmO+T1zB29iojf00eb5JuJ3sqEbfmP2q2b/vzBxLKydWIzqG7rk48TuPiIVZ05urqHD9CD1UfIwIOjTnZcLU6yfm4limdCKk+IUgVvQJu0AuAUQqYtx/nsZ51+5UZRrQVX6mWoaEXqAt+Z6m56aTIIXw3EDnI0gcZTc38mJ2wxlM9PKXXVJlZnx8LYRz9G2dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kVkf73TeAiyWReE6gnblzkNLiTca9xD7J5+iJADK32o=;
 b=chxgTE0JqcY/sapnpfx0RSzKGt537MzF4lyeMAGZ36tS3dueGJi9ep4kBq4p24oASQYmq2Dj9127UIVwc5c+XhJK/yuvlqnlljUg2y3RZ6sCrRjuANgAE0Gp01SuRYZAZJyXOtNvdDFhJh0sefoWbjFvO3yiKexbOeIHih1Ai6qT0dSWcYAUSthG8DKCmmX+Uw5v2qo2AShHSltoFbL38JbdjKPWpnztrY11WL3LPPyL7OSxzAVIY+p71G2+6T13JDbIgeXPZl087QIZqmLLqpa75fsVCcUkqtJ/oD8PBu3fcThKuyYoIlahMPmEHVdB/QzWv/Waa/rnO1QPHvxdFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB8263.namprd11.prod.outlook.com (2603:10b6:806:26d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Thu, 13 Nov
 2025 18:05:30 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 18:05:30 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <176305687851.3698.10344878227335918535@intel.com>
References: <20251110232017.1475869-32-matthew.d.roper@intel.com>
 <20251110232017.1475869-58-matthew.d.roper@intel.com>
 <176305687851.3698.10344878227335918535@intel.com>
Subject: Re: [PATCH v2 26/30] drm/xe/hwmon: Use scope-based runtime PM
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 13 Nov 2025 15:05:08 -0300
Message-ID: <176305710840.3698.7900905081853806202@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:a03:333::11) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bbac3a5-282c-4be9-7b84-08de22df3b27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2tUSDFoZnEwQlQ4cEZtRXQ5ZnBPTitYell3RUloUFY4b3RIM0dMUFNHYnRp?=
 =?utf-8?B?L0ltTU1sRXpKU3N0NXhLTFA1UFEvUFYrQzNVZ0NvNWNMb2I0TEZWMXAwYTVa?=
 =?utf-8?B?T2FmVGxudk9kcTNqTnUyV2hWM085MExHSkNvUXV0WEVOeFVwS1MrNWVnVG1l?=
 =?utf-8?B?djZwNU5FU2hobkdEeUErdXZ1ZkRzV0tvZWdSbmRzMUZ0aEFqblRtbEZzcmNM?=
 =?utf-8?B?eFlOOXBHUFJnTVQ3dlRwbnIxYitHNHhlNzFmS3VFcHNTTUlIYytGTGtoeTF0?=
 =?utf-8?B?MXZ4alJVZFdiV2lBL1V0RWNXd3FMREZXWXdFQjUrSEVObTJCdXZGZXVQTEZI?=
 =?utf-8?B?NG5NQ3FoZ0ZtRUJFRkY2MnVvdW5hWW5PQ0xWT2d3aTRQL3Jjb0xSUVU5dVc1?=
 =?utf-8?B?aGRTeXcvVmo1cTh6Z3JJaE41MDAzVHExN0wvVjl2UEtEU2pZTFJ1RUdhcmlG?=
 =?utf-8?B?UlFPRGV4YlJxSnNLcVhvNnBIcDNIYW16SzVtdGJKczdMd3VnUTZXVFh5SU9C?=
 =?utf-8?B?cVBZUlJCQWVGRDRXUUlDa05xTlBXUVg4cnZjNmI2RmNnYmhrQ09weEczb2d2?=
 =?utf-8?B?NjZZOGgxajRmQWpNcHp6ZWZ1VnZwT3hPemFhN3ZUUFZvMlJxcUxiT1pXU3hJ?=
 =?utf-8?B?bWJydnNFaWpaSmh4amxuS3FuTUNZcGJrbXc0WC93YmYxRUIwa3VoQ05saGV3?=
 =?utf-8?B?UVVUYXRvUTNHMkE2NDI5L084c05kM2ZBTUQ1Qkd5eDY1ODRYcXEycytGQTNP?=
 =?utf-8?B?cTR3enNGWjN0QmtVRnh4dWhDejNmZHlQVEFOSUR2WVdUbUVKRkQ2VjdWRmYr?=
 =?utf-8?B?OFZabmJFYmhoQTN2eGxZMExnRStMQmU5eTJEU05HZm8vd3M0RkthdDBpWEVi?=
 =?utf-8?B?UXd3K1ExemtxeXpTVHEyRWxoeVRYSFRNVlZwVi9DZUxFVWlsVjZRRU9TeHNM?=
 =?utf-8?B?MGZmbmVsWUNZWHhvSnZnMjJQYVdjaWQrQ3FYNkxCQkpGdno1eWNTY1BUTW9K?=
 =?utf-8?B?SDBXcFJET0RPZ2ZFeFNTY3JRd29IbnR1N283M25rSE4zek5zU01BUHE1ZVc5?=
 =?utf-8?B?TS9vcDVPQlBQRW12N3RSRmN2cFZkcCtjMUNTRFdURnF3a294WEQ4Wmt4bmQ3?=
 =?utf-8?B?a2ZEM0JaOTlDTVZhZ0ZaTGpVbHFVZUw0emlQck1neVh3anNFMzk2OEdkZ2ZI?=
 =?utf-8?B?OWxuUTUyVHJYQnNIQytyTzZEY0IyODJGNGNoRGYxZTd6cnhkdlk3MkE1ckhV?=
 =?utf-8?B?NTV6MG82cGxiOXJ4K0tGdHZ5alBNS1FGNm44WDZJZXo4aDQ2MG5oelVYOGdx?=
 =?utf-8?B?ZVFiRDhsU3pxdTNQMHNkdmp1NVZXUXlRdTA2SDFIQ091M20vU3NRSnd6WXJt?=
 =?utf-8?B?YXhlVG5ueDM5QzIyT1poelZLVGJiOHVDTHZCZ1pnTFl0aU5SQlJsdGdkRmJm?=
 =?utf-8?B?SXlJQzNYWkZLZzNwaUxLd01MSDBBbXVOYlpOaEhJUDJjby9nZHVnZ3FPUG1F?=
 =?utf-8?B?dU1JQXZSb01QckVhUW4ySUdLSWZ1RVhSWWltZ2FOd0d1ckJPWHU4UHdTTy9F?=
 =?utf-8?B?d3IxUklObnMySWR6TnR0OWN1Z0o0QkV1NWxDdkNZUEhHRVBTU0EyanBDUG5W?=
 =?utf-8?B?WUREM2E4akxVMnBFOUl0Q1RKYmN1VGpMWkhoUVJOdkJWNktqNlVPVWxvbW1z?=
 =?utf-8?B?T2owSkZ6NXZsU1RUZ010d0J5Rm1aTnp4VDVKWUdjaVVTMmVJVGdjSkNPSE9J?=
 =?utf-8?B?alJSOU9DZlhEZmdHNlUrTVRDSzJvSFhsekEvUFBiUjdidW5tUnlKM3VwaXZo?=
 =?utf-8?B?ZHdaNEwzZ2drMjZ6MzYvS016SXRhOXVmZTROS2VqMm1JaSthaUUzY1J3ZzVo?=
 =?utf-8?B?RHhFaDBJdFhHeHdmTnoyYkwxMXJkU3ZreVoyV3o2SlZsZDNscGJlZDg1Tmtl?=
 =?utf-8?Q?1nVmfZjr8hPfAmADBBoAx0cciLl4YBQ5?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bnFjQ1hEVDQyc3MybnowamM5QnBQRjBwTm5Ga3ZPekJ4a2kveWlCNXFzd09n?=
 =?utf-8?B?RFgrZVFrTXhEVFJsaGlSYmVnWkRqY1kzQStmUDlsOXRNU3Y4Y3JqSjhQdWZi?=
 =?utf-8?B?Uzc5SGsxbUw2L2hLZEc0WWgzSmt5VXJXTisxVUxXZ0luUlI1b1BYa3o2YlMw?=
 =?utf-8?B?UFcycmhFVVZFenR6aFZYdnREaVpVUzBIWlRUMERBY3Y2bEFodXh5aWN3bnBw?=
 =?utf-8?B?NmlCelZaUngxRWwrZ2xTN3FuUVJNcHkyS0M4Yk52eWN6OXE3VmV4WktRUmlm?=
 =?utf-8?B?TCtHdlJYWTFFQ09Ic2FTRHpJRnVSdEVIU3QyWmkwb09vNG54K0loaGRac3dq?=
 =?utf-8?B?eVpEWFBSZnpaSUpMaWVXcVRZaitlUjlad0F3bmJLVzk2bWF0TlZqVFZDTU12?=
 =?utf-8?B?RXlwOVQrdmNsTjRmc1RUcGZwNlhNVVBDZjJzVk1KRjlBS0k0bTdlZjhmdThV?=
 =?utf-8?B?RGpxalRuWEZMVDVsRTBvUFRTTm5JMmdlamd6YnR1NnE3M3FEUTM2NTlYcmds?=
 =?utf-8?B?UUF1bTRWUVV6K0hOZlhJUXpwMllkVlJtRjBzeTNqTWFzOGpGL2wzZ1lRUlhC?=
 =?utf-8?B?aFdtd3Q3MExlMmNEY3lpRXY2MExhdlBuQmRyckVKSHBMU1ZqV0lpMjZHeFV6?=
 =?utf-8?B?dis4ZHFmSlc2cnlHTlJPNEJ5anpJK1kzaCtpUENBclo0amR2bE5QSTRRQkdy?=
 =?utf-8?B?Qjc3OHc2TWJMT2wrQmpGVnZaZmp0cTgxSUUwQlM1QzdTK05sdS9OOFNkK2FW?=
 =?utf-8?B?bkZQNmNEK0htbzZjajhldjlyUFpwZXVUQytwRW1PS3RBVmFVNVUyU1dURDhV?=
 =?utf-8?B?MGJNQ3pEdk9QUEVEVGZVa04vSU83ejNpSWFsczBuQS9wOERiSldYOXpIVHNj?=
 =?utf-8?B?K0dRb2pzMDBmOXRyUWd1WE92TEVRSkhCOERkVXdmSGhPMUxWcjM2NUVkcHZX?=
 =?utf-8?B?OFo3c2hXZ1FFS0VuelhDUENJMlFBazF5ZlRWT1pJTXFCVGRaYVFXUEZTMG1U?=
 =?utf-8?B?Z1lXQ0xnbmJoYkhRUnpmbHNPQWh5NnV2cWNrdHlwZEJsYVRFS3VaandPSC9N?=
 =?utf-8?B?V0l6WCtSZXV5ald0cUJUSTA4VGp5bmtuSjhDSElwSUxKMTJlM2doR1l3QTcv?=
 =?utf-8?B?dDRLa2pLVlN1dkRCSy9GREtYRDYyQ25NSEhVd05xSHNHMU5iMUx1Yjh1ZkhU?=
 =?utf-8?B?WkJaYUdqVUlSK0hwbEZpcS9xU1dmeVEvSFdwZWtWVmNPS0phbzdNY0lDejMv?=
 =?utf-8?B?aHBQYjVKd00xbjQ4QldrMWdReTFCN2w3OUFqYVc4U1BRMi81NjIrWndDWU94?=
 =?utf-8?B?OUtzNHltdWRqUE94WjVjWEhHZ1pzWk1tWGVNT2k3eExiRGpGajZrUVUxMjRH?=
 =?utf-8?B?UzhxS043YktyaUVEOTJVNmhEOEVLN2gxWWN4UmplQnJ6dk5INDVzOUtWOENJ?=
 =?utf-8?B?SGF5aEdjeHpWY3locUpCZGREcjdjNFgxeWFYTW0reC9LN3RWc3BLNkpDTWZ5?=
 =?utf-8?B?VGIzc0ZHblFSWm1SanVURHpoekFKaVBtQUwzbUxQWGhZUE1FWU8wOEpnbTBz?=
 =?utf-8?B?L0VlZzFhclBTZ2VsSWFrZ1c1NFZHcEhtQy9tdkU5THpyL1dkc2hVak1mUTk4?=
 =?utf-8?B?b25SSUxrdEgxTW00S01jdTlsT3ZldFNsdkpsemszNlVFVTVSNEgwL3RIS2Jj?=
 =?utf-8?B?YkRsSy9LSnJmTldkZlh4eUZObE8yeVorRXViWHo3RGV0QTFHZ3c0dnpQWG10?=
 =?utf-8?B?NERBSDYzcU1DdmtmZ0R4RUtmQWljNDlsdjVsaFd5dW52SWY0djRUV1EwenN3?=
 =?utf-8?B?N0pLVWNNdWhLL0d0RlZoOC9FZjhTdEJjVXdsd01HQWs5cHVjOWt3MTdjZjlC?=
 =?utf-8?B?VGxoMTQvRm0vYlYySldZUW1rcGdaSGVabHVLQ0lVZmxjazVTVFkrTTFsdXpi?=
 =?utf-8?B?V29sQWlIVDVpOVlISFZHK0QzNDcrVGpTTE5Tdk5kbDZVM2lzMXZkTmIvMXVQ?=
 =?utf-8?B?OHhTQWUzUWdFRlpmK3dPN2ZCTTIrUmdJMzA2NDdwejM5NE9uKzZQeWgxNzdO?=
 =?utf-8?B?cGRBeW1FdE94anlwSzhjN3hOLzdmdGs0UEtOQ1BHbytiSlpHQTZsbnI1TDl0?=
 =?utf-8?B?MVJqc1pWclBsZFA3bDBEajlWcUxzVVRGdVE1aHkrbkFkNTVOcmMxZkVhT1l5?=
 =?utf-8?B?Q3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bbac3a5-282c-4be9-7b84-08de22df3b27
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 18:05:30.1480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0mhija7teI34Dr8iXC2p/yginQkA06XaImXbSrUpCeEZLCcDXJTHM8Cz3q0YREBZM5omA3kgPfjhByVBJ+uhXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB8263
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

Quoting Gustavo Sousa (2025-11-13 15:01:18-03:00)
>Quoting Matt Roper (2025-11-10 20:20:44-03:00)
>>Use scope-based runtime power management in the hwmon code for
>>consistency with other parts of the driver.
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>
>Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

Ah, I just realized that functions xe_hwmon_read() and xe_hwmon_write()
can be simplified by dropping the variable ret and return directly.

--
Gustavo Sousa

>
>>---
>> drivers/gpu/drm/xe/xe_hwmon.c | 16 ++++------------
>> 1 file changed, 4 insertions(+), 12 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
>>index 97879daeefc1..5ad351fad6e2 100644
>>--- a/drivers/gpu/drm/xe/xe_hwmon.c
>>+++ b/drivers/gpu/drm/xe/xe_hwmon.c
>>@@ -502,7 +502,7 @@ xe_hwmon_power_max_interval_show(struct device *dev, =
struct device_attribute *at
>>=20
>>         int ret =3D 0;
>>=20
>>-        xe_pm_runtime_get(hwmon->xe);
>>+        guard(xe_pm_runtime)(hwmon->xe);
>>=20
>>         mutex_lock(&hwmon->hwmon_lock);
>>=20
>>@@ -521,8 +521,6 @@ xe_hwmon_power_max_interval_show(struct device *dev, =
struct device_attribute *at
>>=20
>>         mutex_unlock(&hwmon->hwmon_lock);
>>=20
>>-        xe_pm_runtime_put(hwmon->xe);
>>-
>>         x =3D REG_FIELD_GET(PWR_LIM_TIME_X, reg_val);
>>         y =3D REG_FIELD_GET(PWR_LIM_TIME_Y, reg_val);
>>=20
>>@@ -604,7 +602,7 @@ xe_hwmon_power_max_interval_store(struct device *dev,=
 struct device_attribute *a
>>         rxy =3D REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
>>                                REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>>=20
>>-        xe_pm_runtime_get(hwmon->xe);
>>+        guard(xe_pm_runtime)(hwmon->xe);
>>=20
>>         mutex_lock(&hwmon->hwmon_lock);
>>=20
>>@@ -616,8 +614,6 @@ xe_hwmon_power_max_interval_store(struct device *dev,=
 struct device_attribute *a
>>=20
>>         mutex_unlock(&hwmon->hwmon_lock);
>>=20
>>-        xe_pm_runtime_put(hwmon->xe);
>>-
>>         return count;
>> }
>>=20
>>@@ -1126,7 +1122,7 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor=
_types type, u32 attr,
>>         struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
>>         int ret;
>>=20
>>-        xe_pm_runtime_get(hwmon->xe);
>>+        guard(xe_pm_runtime)(hwmon->xe);
>>=20
>>         switch (type) {
>>         case hwmon_temp:
>>@@ -1152,8 +1148,6 @@ xe_hwmon_read(struct device *dev, enum hwmon_sensor=
_types type, u32 attr,
>>                 break;
>>         }
>>=20
>>-        xe_pm_runtime_put(hwmon->xe);
>>-
>>         return ret;
>> }
>>=20
>>@@ -1164,7 +1158,7 @@ xe_hwmon_write(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
>>         struct xe_hwmon *hwmon =3D dev_get_drvdata(dev);
>>         int ret;
>>=20
>>-        xe_pm_runtime_get(hwmon->xe);
>>+        guard(xe_pm_runtime)(hwmon->xe);
>>=20
>>         switch (type) {
>>         case hwmon_power:
>>@@ -1178,8 +1172,6 @@ xe_hwmon_write(struct device *dev, enum hwmon_senso=
r_types type, u32 attr,
>>                 break;
>>         }
>>=20
>>-        xe_pm_runtime_put(hwmon->xe);
>>-
>>         return ret;
>> }
>>=20
>>--=20
>>2.51.1
>>
