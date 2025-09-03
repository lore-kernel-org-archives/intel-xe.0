Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7355CA1012
	for <intel-xe@archiver.kernel.org>; Wed,  3 Sep 2025 19:47:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912CA10E206;
	Wed,  3 Sep 2025 19:47:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EXwRh16W";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73B6A10E206
 for <intel-xe@lists.freedesktop.org>; Wed,  3 Sep 2025 19:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756928850; x=1788464850;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=q1IsZ/P/Zi3sHf9h7fRAj9oFbAdw3ZSIEIhb1dCDGwE=;
 b=EXwRh16WgJOmOiyHb+5QxdTpLGznPkA5lnSex5KS+zfYLKg2IEheFc3n
 bA8loS87vvD/EYu4kN0Yiuc17vxIiHBJSs4e3083S3PSPfLSrxRcT9M2/
 uwg0iJuZ2lf95St7Ipsbgx4YMr3uVCwxciVwBrtqfV2+3hu55CT0/6Tfw
 cJdxYw0Dm1PHrJAJGuB3Crq0XKHSeJJCFBr+xaepLqvNhQQsZPqh/b9zF
 aoSzPpCWXCiyfJFzV5t54dUlfeHHTTUcKTTtcUV8NqGuJF9Gwh6/cGGph
 qryIcz7JIYLLJ6yPzwvssx7egjJ32zk10SVw0D4ls1oROKUbVdNe6PEuk g==;
X-CSE-ConnectionGUID: G9D9GK83RHyZfLzaqQun1Q==
X-CSE-MsgGUID: 5+uOMBj2Qmq0cQMhnbUZyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="76859355"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="76859355"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 12:47:29 -0700
X-CSE-ConnectionGUID: Fgnzpw16QGqFSq7sXwjB4Q==
X-CSE-MsgGUID: 1G0EIP0xT9GShXStLK0nfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; d="scan'208";a="171232059"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Sep 2025 12:47:29 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 12:47:28 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 3 Sep 2025 12:47:27 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 3 Sep 2025 12:47:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pG6SYYJzw7DzlhFHitfZekhk360JUhF8IG6yIw/9Vcs1l3zo0DvCqJLTyOBHamg+kGgdyqttvpVZS/ee0drnSlKBQF0ZqVCurmDblhylFf3xCiW4PpVd3hngDHMSjX5kXvJPIQR80IyFEqyW798c3gVxrRWd9eUXurJep8jdTePnfHKj5aIzUu49z/xImIM5UTLB/n0pv60dAzXZQe2XjBVEfbD7CsVCMPMjnptHFOav+3No2h2BVBX/lZqy5oquO7hVSygTV3TPzk7fMgTYlkA0vonWAL9lDf5YucQ8OWgS7OBEhnqQ0v6kKS8i4n2+C392yBsJmTvuesobO5C4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vFDTgT01wmgap/7yFWj8YGSKKzxme/slIlRVVKULbjc=;
 b=F8qcyb4xXrfps0GxJ5KXr/p4eRfyuX42kGRTWYgb8lAR0MZIdkrGXFkoGH/s5W2ibCSYfadlMLy0pG8DadN/nbk6jpWjCnr7skoPsEjBB3+Sb/ruKRgz72ImMcBFr9DH2k2uo6oEUCucZUnozphvQt7G3Hn2pr6UUzocTIozmv1DjKUxu27CRVKU3syQaQmhm18WXlSeBnbL1rLyhPDdo7ysQbx/ngrAqrA1LcMQu7s4DBJQtf/z2usPbmAPITyED9RPbP/ARkw4gRJIkfvsMLccW1upHAC8yl4P1necFfksdVkzoQVLfwGbEPzE4YKMJtfs839j8P4fQq8u3UUEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by DS0PR11MB7263.namprd11.prod.outlook.com (2603:10b6:8:13f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.24; Wed, 3 Sep
 2025 19:47:25 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9073.026; Wed, 3 Sep 2025
 19:47:25 +0000
Message-ID: <cb5df4ae-9c68-4887-a690-ed1cd196bde4@intel.com>
Date: Wed, 3 Sep 2025 21:47:23 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe/configfs: Don't touch survivability_mode on
 fini
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
References: <20250902131744.5076-1-michal.wajdeczko@intel.com>
 <20250902131744.5076-2-michal.wajdeczko@intel.com>
 <qeq32k6xksjwzg7saglvxlodqxkr75mofjnmfv2bx2dzanciol@2c7ouidjtxly>
 <12059b2e-e91b-4db6-9602-ac2b09b460b9@intel.com>
 <2f87bc32-f43b-4880-aae4-bce73778d9a4@intel.com>
 <3iqgbkqltxvairumtb6msmgi7xtrx4iqeq42qt3jql3r54drfd@oldwqas3rct6>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <3iqgbkqltxvairumtb6msmgi7xtrx4iqeq42qt3jql3r54drfd@oldwqas3rct6>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0011.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::23) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|DS0PR11MB7263:EE_
X-MS-Office365-Filtering-Correlation-Id: 6675ed9d-638e-4fce-b152-08ddeb22b500
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RWo2aGRMLy9mQWpUZE5RUXl3RStuNTI5ZXJoRXdPaHdRZnBzNXZyZ1ZhZU1C?=
 =?utf-8?B?bzJWelJsaEUrcnZzVmp1S3d3c0hFNnJDczBjVHRjZDMyZTNVZnhaOFo2R0h3?=
 =?utf-8?B?a2MrU3Q3WkxiekhUNWRBUnlnTjJMNDlwQXdjdElaeTc5dXArWE5XMXppUjh2?=
 =?utf-8?B?cGlIZ012bWxuMlRRWVBHdjloUUVhQzNmVmNTaDR0UmNyTlFXVFVyRENBYnQv?=
 =?utf-8?B?eG1ta2ZuTnVtMCtQME5SWjlYdjRiOHZwdlJwb2lkblBnWE5rRm43RWl1bkNJ?=
 =?utf-8?B?d2dPY0hjZWNvdi82UzgyaGZEcFJvRmpUK0UvbkF4U3NxL0pKSTJiZ0tvbFhD?=
 =?utf-8?B?bTU3UkE0TFY2Z2dyeHFEdEZDaW9wZEVwTjhqVld0V1ByaEtPY0dwNTAyZHUv?=
 =?utf-8?B?S2RkRGgwSDdNNWhpUmhVc1IwZ3ZpcVdlOVh1bE55WWhBUkU4aFZuSW5UU002?=
 =?utf-8?B?V2kxVzBLajlISWpGUkFJY2pMYUxtUG1QQ0xOeGxKa2s2a1VHbURJV2pyYm9M?=
 =?utf-8?B?MWgvUFhlRzIwOEx1dTZjeFdMeENqM2pwSkZML0FlZnQ4eHowWUEzMVlyc1R2?=
 =?utf-8?B?d2pIL3Y1bGZncUVYTk1nYXlwM0d3eXQ3dHNDUklOMCtRZXVZODJlcnE3OW9l?=
 =?utf-8?B?emI5NUt6ZXE3U1VFNDJsMFZ1YU9UVGtFUFBvNE5KQ2dNeWNzRGxUYm5SMnBU?=
 =?utf-8?B?OHBlQ2ZoWlg5and5T3I3aGd4WWxnOWVXMWdJWnZkZm9pOGZvakxhUWxnYUQ2?=
 =?utf-8?B?UE1pSUczUGhjWnpSd0xlM2YvZnJidEVRUXdHYS84YWxNSjU1czA5WWRIM1NR?=
 =?utf-8?B?OXV1aFZIOS9xQmErOTNXSUdiWm04blhWY2NjcWxUaURTNXhSMXlNa210QmxM?=
 =?utf-8?B?RHZHeGVWVnB6UkFZVTdhUldEL2tWSjdiNGNvQThkZWY0cllUbkI3cWVVQkdC?=
 =?utf-8?B?c21IYTMvNUJiWjFHSkEyVUVFOTVvREU1QzVXc1N4Sm94cU41M3N0ZUlOUStr?=
 =?utf-8?B?MHhXQnJsRGdGK0NuTFNmTEh0MDF5TTNZcDkyc25BZ2RKby9OekxQNUJrZFor?=
 =?utf-8?B?bllhTzZ0RmJuYXJJaXIrMkdRMUE5TVJRa2pzTFhvYWZ3eThLUnhITVVsdG1Z?=
 =?utf-8?B?R3pVdk9ZeEVFSzdQOStYMTdYRlNRcjk2OGNaQjJESnlMUnRmSDdSV2ZyVUxS?=
 =?utf-8?B?aDROTko0aGF1elV6YVpBSWZRam1mQW5CejhOTVhZa3N0MURZTFc5a2hzQVM2?=
 =?utf-8?B?MVpDaWc2QzlpTVZhTlpUWEs3MzdCMmZrWjFFbC9pOVAzNS9zOEthZ3lOM3JH?=
 =?utf-8?B?b1hyOWN1OTlsT3lWOVRINm90WlJRVWE0bzJML3d2RzVlN0dVdkw0ejFqNEdJ?=
 =?utf-8?B?YUxWSkNTeEY3YVRxZ2xYL2ZPNzRvcjZNbVlVaVBsRWdqWE4yb01ZMHlEaWlm?=
 =?utf-8?B?ZFc4ZmdJUWhLQXF6RHJtNktGRndkMDBqRlFtQm1ldmRrVDUxeEU5YnZLei9K?=
 =?utf-8?B?dFhRazVxL2NuOGZxZnFkVDJ0NHNvOXFWTzdMTTlVT0lDRkRHUDZtR0x6R3hv?=
 =?utf-8?B?U0lEekZXU3VtOVVUZjd1bE1Sc3FjR0o5QXNWMVdiYXBWNmNBZktZMzhiaGNw?=
 =?utf-8?B?RldLeTZpdUwzVWdjTG5BNGlOUitXeUVOU1oydlV0RHAxQzI5Y2U1eHgrU3g4?=
 =?utf-8?B?cnQ5Q3lmcG5BdFh1cU16WlM5ZlNGTmVDcGhuT3lFTXBqa0dDN0lyQWw2RDcv?=
 =?utf-8?B?bGc0QTdDOG8yYVNlb1loMGgwdGFJUnBXMHo1RHNDbm1GQk9vL0J6bVY5UUVh?=
 =?utf-8?B?NlkvQzN5U1VaZzBvSVk3UlkvNUVnMDRjUmtYVE9TZmp0cVRGUHBsT3V5b2hj?=
 =?utf-8?B?OE8yNSt2cDZIZjFsWDhoVTBZNS85azBiSks2ZlN6NWJXQzZIOXJ2WjBtbWY2?=
 =?utf-8?Q?VjA6VAY0X9g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFcvMS9iZlg5MFBHN3FVM0JCR08yMkdBK2RlY1kwMUlzUUYrR1lkQXRNaS9J?=
 =?utf-8?B?NVArbTkwZ1dVUzkwTkhEYU1yZXVEa21NRjRjUkJidnhmWEZhS3JDS3dUY2tW?=
 =?utf-8?B?ZlFBY2FzY29HVGtCMHhIQU1MOHpvSUtwU21TODk4RXlvYXNYZ0lTK2tPcjlG?=
 =?utf-8?B?aDE1MFErRkxHaUxMTVNqT25iSFgxN20yNWxZNFVmRHVJeDk1TU9KUmM4alht?=
 =?utf-8?B?aGM4WkRjcm9iWmE1dzF4bGdEc3d4bklHWHA4UEFxZlNkZ09xaXVmZ2FaczNF?=
 =?utf-8?B?NjF6TVkvK0EvVUJiWGFKTUpHMExHTzBWQ0Fic293NzRRZWhhalNDQ3dtSGdh?=
 =?utf-8?B?UHlkL2YvdW5GQlV3TGIvSFcvS3F3M2ZiVFlERTA2TUpXbVhkdHpvTHVscGpS?=
 =?utf-8?B?ZStRQ2hXMHpaV2Q5N3hOZ3FDMk9xS0o1b0NvVzliaW9xeGJ1MElHWHQrY2VN?=
 =?utf-8?B?aGpUZm1pRDl0L3AyOUFidHFXNDZuZk1KNi9Qb0JjUE5XNkhYenF3VXR3YXpl?=
 =?utf-8?B?aXhtRk5oTmgyaUc3TVkyWXRsSS9BbWh3a0crRWhLaDJmL1VSMnB4aU9mejEw?=
 =?utf-8?B?djdGcnhHTGFtdm1Hd2ZpMlFISFRVR0hGRVFQYzE0ajQ4QnBSdEJ3RzFwNnlz?=
 =?utf-8?B?T1Q0bXl0cncrUWdpU2VKQ0Q3cHA5MDB3RG9EZlZLVldicXVqb1A4ZWR2cFBM?=
 =?utf-8?B?L2ZqWGxkZEo1WjEzaUVYQitxOEs5TXZWZ01leEVLaDBKL3JqOGFQS1JzeXUy?=
 =?utf-8?B?eE1GWTB1U2w2dnF5ckhlOFFXY0dNY3lqL1ZxeUVJbnVHT2NKNmFDam5OQmJ1?=
 =?utf-8?B?VHQ1TTlQc1BMV0V3Q3FFZVMrUk1LTTR1TkpocU9HOW96aENYanlod1ZycTlE?=
 =?utf-8?B?NHM2cGNtY0RZWTR4Z1RxblNRbGdyRXd3QkdDZW5NbzVYVm5ZV053ZlBiSHpD?=
 =?utf-8?B?NW0ydm5Qb3J6OUtwR2RSZTJLMjRZaitqVGdXTENzTXFIUDM3aGd6aFo4SmIw?=
 =?utf-8?B?akFLLzZQcTk2ZU84VGVTQVNrMUJYY1hDNThFSVZXTSthcVFCa05nN2RJL21z?=
 =?utf-8?B?TTI2VGlYWmprVUloMERGOStXZkVBaHNaU0RCeTZ1MzJJRXF0U1dxOUthK24z?=
 =?utf-8?B?S3ZsTDd3VzY2aTJkQ2R1Z1ZhR1VNWXlud2xuWEFRdDkzMUVnSWtvTXBkblEr?=
 =?utf-8?B?TW1scVdTQlVlYUxKY3pIVVFDeWVZUkltTUxhcmdmbmRXamo1S3pBM21xdHFI?=
 =?utf-8?B?ZlZVNjBWU0F4QTF6eVo4TnhQY3pCdDRvSkRwYnhMdDZ1MDc2SklKR0hHR0JK?=
 =?utf-8?B?aU5QTW8yT0tXaHZGNllNYnZyQTZrZmYwbnR6UGxGZkh4V29halFWem5OU1dL?=
 =?utf-8?B?bXF5cnFiT2M0bm1MbFRTdnlFLzhZNXNTckdVeWtEbU5JWEV2Y0FHdHRBbzhm?=
 =?utf-8?B?YXorZTlvQ1VnZ1ZnWHJ4TDZCTlFVQ0wrK1l0THZobEdvRXllek9PbjBnZHpE?=
 =?utf-8?B?ZCtJdGJSWnZkZFRBSTVTekxqZTVmQXdCN0Q1VkhMY1pTV3piV3FVOWI1bzdS?=
 =?utf-8?B?SE51TWdtMVhQcGFQTXp4QU1BWjVBT1A0SFViNU1vYWg1ODdacHRFU0hPZ0lG?=
 =?utf-8?B?cFV6NHk4SWt5YmJnMk9GNWd4aktUY21HSEQ4aFZGWS8xSUUrYnozM1lzT25y?=
 =?utf-8?B?WUl1Y3AzemFvU2hFSkFLc3o5a2RlUG1jVm5DcWJZZTI3U1BJNTFzeXQ3Rmtt?=
 =?utf-8?B?REtiSkk1ZHIrbjBnMEFEQ0Fibk56OHdnd3UxRGp6YWwxMlVEaTB0ZFBSYnZE?=
 =?utf-8?B?S1djRkg2MDZuUXpEQ2lUaWFTNUtrdEFIOWkyM3VNdWpkNTBOOVZjK0ZEQXdk?=
 =?utf-8?B?dnJkUmRieEQzUmlQc3BSeTFBVExDN0FMU0orTmtkcE44UEFYMzZLNmJUOTF1?=
 =?utf-8?B?SGRhazFiY2Q5UURqamd4TThPUXRtQ1ZxUTdaMmJKN2ZVZXdlMXB3bGdWNW9q?=
 =?utf-8?B?TmtQLythTjBtNVgycEt4WkUvaFhRNXJCdExiUU1Cd2hzTDJ6RGt4RHg5dWh1?=
 =?utf-8?B?TTlnRUtGT1ljQTR3L05PcDFVQ3dneXpMZU1zK1FLaTExeG5uNWw4ZW5QSjdT?=
 =?utf-8?B?ZExZQ0lzYmhEelUxV1Z6OUsrS2ZXOGllM21FWUJYZ3VSQnpXYWRlNXBwVEFQ?=
 =?utf-8?B?Wnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6675ed9d-638e-4fce-b152-08ddeb22b500
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 19:47:25.7127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LGMCIVYoZM2nmHe6uRmnCt+hDcR5GRR20paCAd6QULjRHAyZLCQHbhNLY6Wza4TmwVF1K0MmQuGeAApT9btqYSffjjGW9c9G6/QLaYJmNyQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7263
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



On 9/3/2025 7:50 PM, Lucas De Marchi wrote:
> On Wed, Sep 03, 2025 at 07:49:39AM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 9/3/2025 7:39 AM, Riana Tauro wrote:
>>>
>>>
>>> On 9/2/2025 11:34 PM, Lucas De Marchi wrote:
>>>> On Tue, Sep 02, 2025 at 03:17:42PM +0200, Michal Wajdeczko wrote:
>>>>> This is a user controlled configfs attribute, we should not
>>>>> modify that outside the configfs attr.store() implementation.
>>>>
>>>> agreed... this was the first user of configfs and I don't think it was
>>>> the right to do it. However for such a change we should propagate it to

should I add then:

Fixes: bc417e54e24b ("drm/xe: Enable configfs support for survivability mode")

>>>> stable too. Riana, any possible issue in userspace? With this change
>>>> userspace should do a rmdir() before proceeding so it drops the
>>>> configuration.
>>>
>>> Survivability mode is enabled in early probe and is used for firmware flashing by admin. If this is not cleared while exiting the mode the driver keeps entering survivability mode on every unbind/bind till admin clears the mode in configfs.
>>
>> hmm, but shouldn't driver enter survivability_mode *only* when there were some issues?
> 
> entering survivability_mode via configfs was a user-initiated action. We
> shouldn't clear it on unbind.

I get that as Acked-by, right?

> 
>>
>>>
>>> rmdir is general and can affect other entries. For survivability mode,
>>> it's better to retain this clear.
>>
>> but it doesn't have to be rmdir
>>
>> mode could be cleared in similar way like it was enabled:
>>
>> # echo 0 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
>>
>> and since this user controlled config entry, I would let the user decide when to turn it off
> 
> correct. It's even worse if there are other configs needed for that
> platform, because then the user will play whac-a-mole if he has to
> unbind to set additional stuff example:
> 
> echo 1 > /sys/kernel/config/xe/0000:03:00.0/survivability_mode
> bind 0000:03:00.0
> # ... oops, forgot to set some additional things
> unbind 0000:03:00.0
> echo foobar > /sys/kernel/config/xe/0000:03:00.0/something_else
> bind 0000:03:00.0
> # ... oops, now it's not in survivability_mode anymore
> 
> Doing it the other way is very simple:
> 1) if all settings should be lost:  rmdir
> 2) if just survivability_mode should be lost, echo 0
> 
> Lucas De Marchi
> 
>>
>>>
>>> Thanks
>>> Riana
>>>>
>>>> Lucas De Marchi
>>>>
>>>>>
>>>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>>>> ---
>>>>> drivers/gpu/drm/xe/xe_survivability_mode.c | 1 -
>>>>> 1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/ drm/xe/xe_survivability_mode.c
>>>>> index 53c5af4b810c..79426ea46861 100644
>>>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>>>> @@ -180,7 +180,6 @@ static void xe_survivability_mode_fini(void *arg)
>>>>>     struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>>>>>     struct device *dev = &pdev->dev;
>>>>>
>>>>> -    xe_configfs_clear_survivability_mode(pdev);
>>>>>     sysfs_remove_file(&dev->kobj, &dev_attr_survivability_mode.attr);
>>>>> }
>>>>>
>>>>> -- 
>>>>> 2.47.1
>>>>>
>>>
>>

