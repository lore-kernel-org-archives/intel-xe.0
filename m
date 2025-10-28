Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0751ACCF9E0
	for <intel-xe@archiver.kernel.org>; Tue, 28 Oct 2025 16:21:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB46510E601;
	Tue, 28 Oct 2025 16:21:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Uacp+8F7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5841910E601
 for <intel-xe@lists.freedesktop.org>; Tue, 28 Oct 2025 16:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761668512; x=1793204512;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=OxXwEJkX8D/iRoQ3Mq/bTCkCx5nlIzuXDIBUEMdDGsU=;
 b=Uacp+8F7qiZYwsAB2YiNFVWSGOz5ZTdMWkKs8WCTaUv4AYxbI7jghvjp
 089FXYDVTInZEXAh7snCRzchKMREySG4MUH601meoi9qfdb3jXFjq14mV
 1d7AlyvmW725P0R7dzYp1UQcAUuXohvnbMoMfUP2NstRd4Ztr1yl23fwC
 cTxSCiFLqwcEVzV1fTScVE+4Y3SeUDYy1uC6TpMCpE9kK6EDWDGPXrIko
 A9QNZxlEVdN7FwprW/kYbUb90aLJvxYIuVRQv9vlIrRkXicRwX3uh3I5h
 PmjzStbkfg533DwGtJs6/g23cWPl+casRbP1Kvhb1CdigmzwwRvLDCaxw w==;
X-CSE-ConnectionGUID: GXgUTWT8RkSkyJX5XQMUJw==
X-CSE-MsgGUID: I+avJ+3gTtStFVBPHDl5Rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="75118143"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="75118143"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:21:52 -0700
X-CSE-ConnectionGUID: rPCTUg4fTSCis8ddXHbu7A==
X-CSE-MsgGUID: KTRO/xy9TkSj5KZfX3VnLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="208999887"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 09:21:52 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:21:52 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 28 Oct 2025 09:21:52 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.14) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 28 Oct 2025 09:21:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tbP7qwYW6dOY+Qwvasck5+kNCzGpivmXBDPyPTgD7BjlCmTgHF6BHb2FUs6U8lPDD/b+LSbvI1Emms0gl/6H3SXwZEuggfXKSRO6j6TQB9hrvFCZO6ei36FpqU7leKRO8zMQwvT/EMlw6oaka89ihJgz0shMhsM60lMWlebV0fq6dki9oYmQWt+FXVivYRWjLq4wUGiidw12FlbzWHd/n4ZiE6glxkLH4ZHlUNuAN5eOISyB+KqGSPn0HRUj8Nfr1Yd4Lj8dkA3YtY+PUmWmjgWQuSBNn+7efO5keSqfoIWwwAdAOVMGZ+jUSxUfgDAgYEJW5IyL3Uj6b3Kii3AP9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxXwEJkX8D/iRoQ3Mq/bTCkCx5nlIzuXDIBUEMdDGsU=;
 b=g9xN+s6d7N68+ALgoQ79DzqLCGLrcZ7Bb1oRcBEb3mMrtPPfc8CzgEq6oqVBHwsBv4UT3qEZkVg9AtBZpoIGbz+JmIAPEwulF+pF1v2yGnb2qKllVMCctjXoNDq5bq6uehoT7C+Jgye/FkfmcZC+nETGogRHC7LH8KAG+GHnZzCwKtu23XN8gU8Sqn+7eU1dpkR8m2bLgAtvIDAtvBXiR7QlL7vQhy92c19mUOJr7XHYvEzZtJOKvnD2FmA6bsx9+uew0ba9N83MHNSCewjSV1MSF+/n9yju5KJnsjRMDIgQR+ydjxSVOcY98HucNwuH0IItp9WxcYD0I0PP2le6IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by DS4PPFA424F92C2.namprd11.prod.outlook.com (2603:10b6:f:fc02::41)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 16:21:50 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5081:cd4:1a4b:a73e%5]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 16:21:50 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Gupta, saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex"
 <alex.zuo@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "Ceraolo Spurio, Daniele" <daniele.ceraolospurio@intel.com>, "Cavitt,
 Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v2] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Topic: [PATCH v2] drm/xe/xe_guc: Dynamically decide g2g buffer owner
Thread-Index: AQHcSCQTb3JsqPO1S0KG/ZoSsp0fDbTXvN6AgAAAYsA=
Date: Tue, 28 Oct 2025 16:21:50 +0000
Message-ID: <CH0PR11MB54442E8E41E0D1618A15A2CCE5FDA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20251028160028.69264-2-jonathan.cavitt@intel.com>
 <3f7be158-48e7-4b02-9094-24cf69563276@intel.com>
In-Reply-To: <3f7be158-48e7-4b02-9094-24cf69563276@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|DS4PPFA424F92C2:EE_
x-ms-office365-filtering-correlation-id: 9972caee-9988-4de9-1890-08de163e196f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|10070799003|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?S0U0TjFPazR1amt2djgxNFBZc2dtM3pwZlg5Q1RMbmpoM0l5cHFQaG1nZkxo?=
 =?utf-8?B?ekxTYlpadGhCTWRrM2FQc2x5ckRsVGNNbGx2VGR2QXlrSDFlTEE0T3BTcnFn?=
 =?utf-8?B?RlVqYkZLcXJOUWcwU3lQQ1hrbjlUbHNNUVNMaU8xSThRQlN3SlNuUGtScWpG?=
 =?utf-8?B?cU5PcUthdHpCMUZXSWk2MVdQM0lXQk1jQXZjM05uNTExRW5rRnk3Y2trVEQ4?=
 =?utf-8?B?YU1BMGw4MzZDMVkxbjhYKzlEZU9ibmdiMTY0MS9NNDRMV1k2RFRiOHExSStw?=
 =?utf-8?B?Wm1xZXBJTFYvT1pFbk5zNjBKakhpZTJaTEorYWxvTlIwM0xIeElTSzNRT2tv?=
 =?utf-8?B?SFNTRXl6a0d5YjB6Vk1QNmFiNC9paXJCZEMzTGIrSlAyTStkNGhpWU1mOGZC?=
 =?utf-8?B?NkREdEtxQ2lIM1ZQYW9BWmdJSENiZkduOEtSaW8wVnBWVWllVllsMmZObjBo?=
 =?utf-8?B?UEJwaGczL0Q1dEJUcS9XbFZwZmtMUjc2WURxeTU5WTdtMzFvRTlXOWlSTnJk?=
 =?utf-8?B?MHE1TFRwVFQ0VVFFYzlMUlRkZVpibWRrUjRXSmVFcjRYaVVqNGFvbTNjMnR2?=
 =?utf-8?B?KzFIWTNoN1JEZSs1OUpiN1ExZXZucGdLNE5XcGptUStrMi9qbkdla01tU3h6?=
 =?utf-8?B?RS85a3JYNTZGeWt4ZTR0a2JRVDh0KzNZYkhzSDhEdlBnM0s1aTcxbzBmUWFD?=
 =?utf-8?B?VWtSMjg0NmtFaW5tRHlDV2ZqbHk0TXhBTnVmc0VTWk5DcFU2WVF0bFJxV1c5?=
 =?utf-8?B?MWs3cVBtSlAxQ2lBdi8wZVBIMTlnV0tFV3RkU3M3QWgyVHFlUEoxWkpUV0NC?=
 =?utf-8?B?TWpnb3JWcVF2OWYzdVNDOHZ0eXFBUzB4MkRwUFNSN3hmT3JtaDVnMXU4bk9v?=
 =?utf-8?B?VlpCR3JXZjJLSkhSc2NvUHVZM0E4Q09FMVFYRnlsSTAzZnFUNk0xaUlZZnlx?=
 =?utf-8?B?ZTJEWThmdEtMb2ZHcGhhdUJwaWJDNTg0VXVGMHJRengxcXFodjdrSUQ1ZWNH?=
 =?utf-8?B?OTlzRVNnVGtXUkpFYTN1cUlNci9ZNWRqb1B6VlI5WnI4Z3hmdE9OVklLdGti?=
 =?utf-8?B?Yk9udk5pTGdaaDVjdVdwTGNlWHN1WUZrL3IrWDNDQkpjTkFGcHB1YmY4Nmxm?=
 =?utf-8?B?MHQ4REZCODcwRjMrQ1BhTEV3SS9CZ3AyUGlXUkJTZTRsWTlQd0tkSytQSktT?=
 =?utf-8?B?NlhXU1pwQXFQL21HUlRBMWRkRHRnaWV2cjM3b3ZETzBpOFhldDRGTHhIY1hq?=
 =?utf-8?B?bXNpU2Zxb1dqL1ZKYko2SHliM1pyVVlZVUJsVXRtd2ZBMFFnUVcwdFU2QTBH?=
 =?utf-8?B?ZmlPL09XVFd5N0wvYkx2UzFvZlV1V0d3ZnZlNUlSQUI5UmhvenRFeEpzOVVU?=
 =?utf-8?B?MXFJMzVYczNpdGtXUWVkSnBobVlPWUNJbTBaUHZpcW9BOU5VM0ZPSU4xWFAw?=
 =?utf-8?B?VUxldUF1ditzTThnOUEzUDBZKzNjTitDVWh3aUJLVXJ6S3FQTlVNWjgyell3?=
 =?utf-8?B?aVRGWFluVVphZEk2a0NxTi9LbUkwQjVGaXpmRWEwWnVUeTVIU253dXd6QVhC?=
 =?utf-8?B?VXl2bksxRXNQM3NiUXBrUm9sRWFzc1hCTTM5N01YRFcwM3BxUDc2bTlTN3FQ?=
 =?utf-8?B?QTU1ODR4WVpMNkllZHBia0UzVXdiNmFDTWFLVFZnckhkam14Si8vbWdydFdS?=
 =?utf-8?B?blR0TytIaU9MN0l5SE5BeUtQenJaT3NGU2ZNbm1aNEFLNi9zLzFZdTlKRnNw?=
 =?utf-8?B?S1dvaEVHVWVFeXJWMEg2MFNKS3hFSDRzM0VLd0xwcWl6NTB1eGI5N0JJUGFS?=
 =?utf-8?B?cEh4Q1doT0JFTWR3dFBwYUdEVWNPUEh3OGFobEdPcXoyZ1pha3dYYTZXSGhZ?=
 =?utf-8?B?WVlBeVRHenlHd3o3eG1LcFFTNGpiTi8xTy9yYjZjREtlM2VwK2s3VWhQM3JR?=
 =?utf-8?B?OThIbVVvbzZNbkJ0S2ZYRXNLTVdQdVZPMHd0SzNaWnVNNy9SZ3ZtWWdYMzk0?=
 =?utf-8?B?blhYYlJEVVlBTllJV0NXeUVqcnBMeEsrTnFaMXptRW9nc1RXVzB3R2RVY3lz?=
 =?utf-8?Q?U6HS79?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VUNVeGdCWkxRNGJKdEJXQUZhQmcrdzQxdG16YVJYaTZ0ZDhCcURIVjZiWVJF?=
 =?utf-8?B?Z0crdE05SHE4YnZUY0ZIdDdnUU40Ti82TVpIY3phTnZ3NXUwRWtlWW0vMFg3?=
 =?utf-8?B?MlFzaVVEdW9FbWJMd1NFdzBnV3hDMndlTVNaN21mU25XejMrN0tqU0svdWtv?=
 =?utf-8?B?YytDZ3NxY1k2STNQZVJhblNXWGtxdW82ZHozcWE3UHp6d3krUTJ6VXhmell0?=
 =?utf-8?B?bmdEcHdEOXdyZWNPaWRCcWFNdVJvM3FYT25XRzRTNzNTbGZMUG5GU1ZqVjRF?=
 =?utf-8?B?cm9IblJKU2JMSGhTY3p4SUFnN0h0NitUWHZDUWlsTEN5N0tDQUJick1iWjZw?=
 =?utf-8?B?SEQwYVlIanBsQy9mTnYrZWZ5UHVab0hHVVhkcGhtUzlNSE9TUitmbm13K1Fp?=
 =?utf-8?B?RnlyMlVZWGVYRHUrQkFPZEdSOC96amgyOURyUHhnRndqNlR0dDB5OU9OQURx?=
 =?utf-8?B?Nm95aHh5OHl4czlPTzlqZEdwQnl3VWtoYU9wVnNETVV5MDg1aXFTczJGdm1P?=
 =?utf-8?B?QnNQREN1VEpWN3RnaU9WSGdRZlVWUkZpMFN0bTc0YU9KNlYxZi9uT1lTNGI2?=
 =?utf-8?B?R1VHeUFoVXlNK1lXcFRBdWZ3NWpRWDh0YlpYUGN4cnpzeTlHWDZoTDZhOFF1?=
 =?utf-8?B?ZldOV2czSTRwUDg0QS9Za1VDNENaNGx3M3NJYWZHOVRMenh6Mk52RmpGVG9Q?=
 =?utf-8?B?cGU1Q1UzK2Q0QkdOMG5BZVdaYzVCelgwMndPYVg2bWZlcDNsZFB3Um9QMFRi?=
 =?utf-8?B?b3hPeG9tVXhNUVdLYmtOUEYwWnN2NE1Wcllhc0ZRSTRiNUxXRjlHQk52THl3?=
 =?utf-8?B?emtYUlZuMUFKaFkxTUY5ZFdRbmpJdWZiVmUydFdGNnJYSW1sUTRZWldMYVRN?=
 =?utf-8?B?ZUhxRmJnVGwyVXJON2Rib3V2bEdwR3dma0JuZUN0REZIdVVGNVBxMGNHcFVL?=
 =?utf-8?B?aWZyd1g3R2dvVG4rTFdsRzNUb1poMnBTVVJrUnBOVmw0VkJqR0l6cjhmMjQw?=
 =?utf-8?B?QndEOWh5dXdXbi9jUm80YWRNMUp6NFpYN2VVMWdxdGMwdGhac04zekxuMlRt?=
 =?utf-8?B?am9SbnZpMmI3TWJvTWlOeDBnck9sQmVaZ1pldlF5NTUxU1hqK0dIQjZ2aG40?=
 =?utf-8?B?UlBIUllqeFAyUWdBT2dXMTYycS91WW04WUlSWVlkQkIvcHN0bUdpdmZqRDJN?=
 =?utf-8?B?Szd3OVluc1BQS2RWdVRVOHU1dllpUkhrKzFlZ0pmU3pRL2VnZHFRZmlEcStX?=
 =?utf-8?B?UXUwaThJcHovNEx4TlZDUkYweDZ4MVg5WHNjM3dlTWZWZjVXR0N4NmVKb1pa?=
 =?utf-8?B?S1pIZTJ1bEhGeis3aXlqV0c2dkRIQTE5ajR3WDg5N0N6YXpTUFQ4cU9QbDg3?=
 =?utf-8?B?bmMyaXdNWWpvbnhLWWpTdnAwVWJQd3lSbVRHdElVZ2JaYk8rWjczZmpKR1d1?=
 =?utf-8?B?ak1wbStrY2pNZi9oYVcxMWhycDZXMkFDYWRjQmJmTlB3aktqYlNWQ2VVZ0to?=
 =?utf-8?B?V01HR3RNZE8rMDlmdXhvQU45cnQ5SEJIcVNrc0FVeTg1YkNNanpOWGJzajNt?=
 =?utf-8?B?aVRCTVBIZEdRaklqZW1rdk5xU3dTMUhqR0llQzFIQ1lqUnJ0WC9HYUhsdXhP?=
 =?utf-8?B?WS84RzA3eDBla01NSUxvOVFONmlCeGlEakZwNXgxcWw2TU1zTDcyM2ZicVRX?=
 =?utf-8?B?VjdMVWFoSXIzaEo4YitqeFhacSs1blo1RUcxM2NmWjhnQUJ2L3RNYUpuZUpx?=
 =?utf-8?B?S1l3WHNkaUVoSS9NR1lFRHRSYzJSVUNIYWhUTGdNaDh3dm1yVEIxZGdOMlhN?=
 =?utf-8?B?N3Z4ekt4dWZ0WVNJcjdrU2NIRjE4SldDWHF1cmdrYnhGNjhyN0gveTZDdUx5?=
 =?utf-8?B?aVI5WUM3QldncjlTV2ZQUVZkOGhWNFFMZVNJbVpOK1dBT2I2dHpDVkZtdXZM?=
 =?utf-8?B?QUgza2lUVG1JUHZXbDROVFlJc2VmR3Bwa2NaSGNua3phSmZvRytvNDZnYjR3?=
 =?utf-8?B?MjMyZWxnZ0x5ckloVWlTMzBpeUJ3Z3BJdXRjSUxNRU1vTm5FWlpFVlVCN1Uw?=
 =?utf-8?B?aWora25SWmtoZkNTbmkxSFNqbG1SRk9TV3REcVZFeGtPenlvMWEvVXNaM2x6?=
 =?utf-8?B?OU9pdE1jQUxDaEREV1NsOHhVRFRzQW9tYXYyNERLV3NCVnhBL3pzUnYrcjhs?=
 =?utf-8?Q?ApUvVIP250S/HGs3UkL6TGXhWvK5DUfIUXfkvmvSgI+N?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9972caee-9988-4de9-1890-08de163e196f
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Oct 2025 16:21:50.3413 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cvjvhqHz1uUvbBzwqGOec3mrmcb2nFwPYTlGv29NQzTAP0B+s0s0W+e6o0KEXh/K62LlOTt0GZbtdTrjxWn6+8g8t2tyfEh+IBtZlmpmP14=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFA424F92C2
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBUdWVzZGF5LCBPY3RvYmVyIDI4LCAyMDI1
IDk6MTkgQU0NClRvOiBDYXZpdHQsIEpvbmF0aGFuIDxqb25hdGhhbi5jYXZpdHRAaW50ZWwuY29t
PjsgaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQpDYzogR3VwdGEsIHNhdXJhYmhnIDxz
YXVyYWJoZy5ndXB0YUBpbnRlbC5jb20+OyBadW8sIEFsZXggPGFsZXguenVvQGludGVsLmNvbT47
IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+OyBDZXJhb2xvIFNw
dXJpbywgRGFuaWVsZSA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVsLmNvbT4NClN1YmplY3Q6
IFJlOiBbUEFUQ0ggdjJdIGRybS94ZS94ZV9ndWM6IER5bmFtaWNhbGx5IGRlY2lkZSBnMmcgYnVm
ZmVyIG93bmVyDQo+IA0KPiBPbiAxMC8yOC8yMDI1IDU6MDAgUE0sIEpvbmF0aGFuIENhdml0dCB3
cm90ZToNCj4gPiBPbiB0b2RheSdzIGRyaXZlciwgeGVfZGV2aWNlX2dldF9ndCh4ZSwgMCk7IGNh
biBuZXZlciByZXR1cm4gTlVMTC4NCj4gPiBIYXJkd2FyZS13aXNlIHRoZXJlJ3MgYWx3YXlzIGF0
IGxlYXN0IG9uZSB0aWxlLCBhbmQgZXZlcnkgdGlsaWUgaGFzIGENCj4gPiBwcmltYXJ5IEdULiAg
SWYgc29tZXRoaW5nIHdlbnQgd3JvbmcgZHVyaW5nIGluaXQgb2YgdGlsZSBvciBHVCBhbmQgd2UN
Cj4gPiBjb3VsZG4ndCBjcmVhdGUvaW5pdGlhbGl6ZSB0aGUgc3RydWN0dXJlcywgdGhlbiB3ZSBh
bHJlYWR5IGFib3J0ZWQgdGhlDQo+ID4gZGV2aWNlIHByb2JlIGltbWVkaWF0ZWx5IGFuZCB3ZSds
bCBuZXZlciBnZXQgZnVydGhlciBvbiB0byBwbGFjZXMgaW4gdGhlDQo+ID4gY29kZSB0aGF0IHdv
dWxkIGJlIGNoYXNpbmcgYSBOVUxMIHBvaW50ZXIuDQo+ID4gDQo+ID4gSG93ZXZlciwgdGhlcmUn
cyBjdXJyZW50bHkgb25nb2luZyB3b3JrIHRvIGFsbG93IHRoZSBwcmltYXJ5IEdUIHRvIGJlDQo+
ID4gZGlzYWJsZWQgdmlhIGNvbmZpZ2ZzIGZvciBkZWJ1Z2dpbmcgcHVycG9zZXMuICBPbmNlIHRo
YXQgbGFuZHMsIGl0IHdpbGwNCj4gPiBiZSBwb3NzaWJsZSBmb3IgdGhpcyBxdWVyeSB0byByZXR1
cm4gYSBOVUxMIHBvaW50ZXIuICBUaGlzIGNhbiBjYXVzZQ0KPiA+IHByb2JsZW1zIGluIGd1Y19n
MmdfYWxsb2MsIGFzIHRoaXMgcHJvY2VzcyBjdXJyZW50bHkgcmVsaWVzIG9uIHRoZQ0KPiA+IHBy
aW1hcnkgR1QgYWx3YXlzIGJlaW5nIHByZXNlbnQuDQo+IA0KPiBpbiBzdWNoIGNhc2UsIG1heWJl
IHdlIHNob3VsZCBqdXN0IHNraXAgdGhlIEcyRyB0ZXN0cyBpbnN0ZWFkIG9mIHRyeWluZw0KPiB0
byBmaXggc29tZXRoaW5nIHRoYXQgcHJvYmFibHkgd2lsbCBub3Qgd29yayBhbnl3YXksIG5vciBp
cyBhIGdvYWwgb2YNCj4gdGhpcyB0ZXN0IHN1aXRlDQoNClRoaXMgaXNuJ3QgYWJvdXQgdGhlIHRl
c3Qgc3VpdGUuICBUaGlzIGlzIGFib3V0IHRoZSBnZW5lcmFsIGNhc2UuICBUaGUgdGVzdCBzdWl0
ZQ0KYWx3YXlzIHJ1bnMgd2l0aCB0aGUgcHJpbWFyeSBHVCBlbmFibGVkIGFueXdheS4NCi1Kb25h
dGhhbiBDYXZpdHQNCg0KPiANCj4gYmVsb3cgZGlmZiBzaG91bGQgYmUgc3VmZmljaWVudCB0byBz
dXJ2aXZlIGJyb2tlbiAoZm9yIG90aGVyIGRlYnVnKSB4ZToNCj4gDQo+IEBAIC02ODMsNiArNjgz
LDkgQEAgc3RhdGljIHZvaWQgZzJnX2NoZWNrX3NraXAoc3RydWN0IGt1bml0ICp0ZXN0KQ0KPiAg
ICAgICAgIGlmICh4ZS0+aW5mby5ndF9jb3VudCA8PSAxKQ0KPiAgICAgICAgICAgICAgICAga3Vu
aXRfc2tpcCh0ZXN0LCAibm90IGVub3VnaCBHVHMiKTsNCj4gDQo+ICsgICAgICAgaWYgKCF4ZV9k
ZXZpY2VfZ2V0X2d0KHhlLCAwKSkNCj4gKyAgICAgICAgICAgICAgIGt1bml0X3NraXAodGVzdCwg
Im5vIEdUMCIpOw0KPiArDQo+ICAgICAgICAgZm9yX2VhY2hfZ3QoZ3QsIHhlLCBpKSB7DQo+ICAg
ICAgICAgICAgICAgICBzdHJ1Y3QgeGVfZ3VjICpndWMgPSAmZ3QtPnVjLmd1YzsNCj4gDQo+IA0K
PiANCj4gPiANCj4gPiBJbnN0ZWFkIG9mIG1ha2luZyB0aGUgcHJpbWFyeSBHVCB0aGUgZzJnIGJ1
ZmZlciBvd25lciwgbWFrZSB0aGUgZmlyc3QNCj4gPiBHdUMgcGFzc2VkIHRvIGd1Y19nMmdfYWxs
b2MgdGhlIGcyZyBidWZmZXIgb3duZXIuICBUaGlzIHJlcXVpcmVzIGtlZXBpbmcNCj4gPiB0cmFj
ayBvZiB0aGUgZzJnIGJ1ZmZlciBvd25lciBpbiB0aGUgeGUgZGV2aWNlIHNvIGVhY2ggR3VDIGNh
biBrbm93IGlmDQo+ID4gaXQncyB0aGUgb3duZXIgb3Igbm90IGR1cmluZyBpbml0aWFsaXphdGlv
bi4NCj4gPiANCj4gPiB2MjoNCj4gPiAtIFVwZGF0ZSB0aGUga3VuaXQgdGVzdHMgdG8gY2xlYXIg
YW5kIHJlc2V0IHRoZSBnMmdfb3duZXIgdmFyaWFibGUgYXMNCj4gPiAgIG5lZWRlZCAoRGFuaWVs
ZSkNCj4gPiANCj4gPiBTdWdnZXN0ZWQtYnk6IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBp
bnRlbC5jb20+DQo+ID4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5p
ZWxlLmNlcmFvbG9zcHVyaW9AaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEpvbmF0aGFu
IENhdml0dCA8am9uYXRoYW4uY2F2aXR0QGludGVsLmNvbT4NCj4gPiBDYzogTWljaGFsIFdhamRl
Y3prbyA8bWljaGFsLndhamRlY3prb0BpbnRlbC5jb20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS90ZXN0cy94ZV9ndWNfZzJnX3Rlc3QuYyB8IDIgKysNCj4gPiAgZHJpdmVycy9n
cHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oICAgICAgIHwgNCArKysrDQo+ID4gIGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9ndWMuYyAgICAgICAgICAgICAgICB8IDkgKysrKysrLS0tDQo+ID4gIDMg
ZmlsZXMgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4gPiANCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5j
IGIvZHJpdmVycy9ncHUvZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gaW5kZXgg
M2IyMTNmY2FlOTE2Li42NDQ2MjMyNDIyZTIgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3Rlc3RzL3hlX2d1Y19nMmdfdGVzdC5jDQo+ID4gQEAgLTM1OCw2ICszNTgsNyBAQCBzdGF0
aWMgdm9pZCBnMmdfZGlzdHJpYnV0ZShzdHJ1Y3Qga3VuaXQgKnRlc3QsIHN0cnVjdCB4ZV9kZXZp
Y2UgKnhlLCBzdHJ1Y3QgeGVfYg0KPiA+ICAJcm9vdF9ndCA9IHhlX2RldmljZV9nZXRfZ3QoeGUs
IDApOw0KPiA+ICAJcm9vdF9ndC0+dWMuZ3VjLmcyZy5ibyA9IGJvOw0KPiA+ICAJcm9vdF9ndC0+
dWMuZ3VjLmcyZy5vd25lZCA9IHRydWU7DQo+ID4gKwl4ZS0+ZzJnX293bmVyID0gJnJvb3RfZ3Qt
PnVjLmd1YzsNCj4gPiAgCWt1bml0X2luZm8odGVzdCwgIlslZC4lZF0gQXNzaWduZWQgMHglcFxu
IiwgZ3RfdG9fdGlsZShyb290X2d0KS0+aWQsIHJvb3RfZ3QtPmluZm8uaWQsIGJvKTsNCj4gPiAg
DQo+ID4gIAlmb3JfZWFjaF9ndChndCwgeGUsIGkpIHsNCj4gPiBAQCAtNDQ3LDYgKzQ0OCw3IEBA
IHN0YXRpYyB2b2lkIGcyZ19mcmVlKHN0cnVjdCBrdW5pdCAqdGVzdCwgc3RydWN0IHhlX2Rldmlj
ZSAqeGUpDQo+ID4gIA0KPiA+ICAJCWd0LT51Yy5ndWMuZzJnLmJvID0gTlVMTDsNCj4gPiAgCX0N
Cj4gPiArCXhlLT5nMmdfb3duZXIgPSBOVUxMOw0KPiA+ICB9DQo+ID4gIA0KPiA+ICBzdGF0aWMg
dm9pZCBnMmdfc3RvcChzdHJ1Y3Qga3VuaXQgKnRlc3QsIHN0cnVjdCB4ZV9kZXZpY2UgKnhlKQ0K
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmggYi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiBpbmRleCBhZjBjZTI3NWIw
MzIuLjkxZWM5YTI5NTIyNiAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZGV2aWNlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5
cGVzLmgNCj4gPiBAQCAtMzgsNiArMzgsNyBAQCBzdHJ1Y3QgZHJhbV9pbmZvOw0KPiA+ICBzdHJ1
Y3QgaW50ZWxfZGlzcGxheTsNCj4gPiAgc3RydWN0IGludGVsX2RnX252bV9kZXY7DQo+ID4gIHN0
cnVjdCB4ZV9nZ3R0Ow0KPiA+ICtzdHJ1Y3QgeGVfZ3VjOw0KPiA+ICBzdHJ1Y3QgeGVfaTJjOw0K
PiA+ICBzdHJ1Y3QgeGVfcGF0X29wczsNCj4gPiAgc3RydWN0IHhlX3B4cDsNCj4gPiBAQCAtNjI4
LDYgKzYyOSw5IEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPiA+ICAJYXRvbWljX3QgZzJnX3Rlc3Rf
Y291bnQ7DQo+ID4gICNlbmRpZg0KPiA+ICANCj4gPiArCS8qKiBAZzJnX293bmVyOiBQb2ludGVy
IHRvIHRoZSBHdUMgdGhhdCBpcyB0aGUgb3duZXIgb2YgdGhlIGcyZyBidWZmZXIgKi8NCj4gPiAr
CXN0cnVjdCB4ZV9ndWMgKmcyZ19vd25lcjsNCj4gPiArDQo+ID4gIAkvKiBwcml2YXRlOiAqLw0K
PiA+ICANCj4gPiAgI2lmIElTX0VOQUJMRUQoQ09ORklHX0RSTV9YRV9ESVNQTEFZKQ0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZ3VjLmMNCj4gPiBpbmRleCBlY2MzZTA5MWI4OWUuLmEzYTA5NjE0NTZkMCAxMDA2NDQN
Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfZ3VjLmMNCj4gPiBAQCAtNDY4LDkgKzQ2OCw4IEBAIHN0YXRpYyBpbnQg
Z3VjX2cyZ19hbGxvYyhzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4gIAlpZiAoZ3VjLT5nMmcuYm8p
DQo+ID4gIAkJcmV0dXJuIDA7DQo+ID4gIA0KPiA+IC0JaWYgKGd0LT5pbmZvLmlkICE9IDApIHsN
Cj4gPiAtCQlzdHJ1Y3QgeGVfZ3QgKnJvb3RfZ3QgPSB4ZV9kZXZpY2VfZ2V0X2d0KHhlLCAwKTsN
Cj4gPiAtCQlzdHJ1Y3QgeGVfZ3VjICpyb290X2d1YyA9ICZyb290X2d0LT51Yy5ndWM7DQo+ID4g
KwlpZiAoeGUtPmcyZ19vd25lcikgew0KPiA+ICsJCXN0cnVjdCB4ZV9ndWMgKnJvb3RfZ3VjID0g
eGUtPmcyZ19vd25lcjsNCj4gPiAgCQlzdHJ1Y3QgeGVfYm8gKmJvOw0KPiA+ICANCj4gPiAgCQli
byA9IHhlX2JvX2dldChyb290X2d1Yy0+ZzJnLmJvKTsNCj4gPiBAQCAtNDk1LDYgKzQ5NCw3IEBA
IHN0YXRpYyBpbnQgZ3VjX2cyZ19hbGxvYyhzdHJ1Y3QgeGVfZ3VjICpndWMpDQo+ID4gIAl4ZV9t
YXBfbWVtc2V0KHhlLCAmYm8tPnZtYXAsIDAsIDAsIGcyZ19zaXplKTsNCj4gPiAgCWd1Yy0+ZzJn
LmJvID0gYm87DQo+ID4gIAlndWMtPmcyZy5vd25lZCA9IHRydWU7DQo+ID4gKwl4ZS0+ZzJnX293
bmVyID0gZ3VjOw0KPiA+ICANCj4gPiAgCXJldHVybiAwOw0KPiA+ICB9DQo+ID4gQEAgLTUwNyw2
ICs1MDcsOSBAQCBzdGF0aWMgdm9pZCBndWNfZzJnX2Zpbmkoc3RydWN0IHhlX2d1YyAqZ3VjKQ0K
PiA+ICAJLyogVW5waW5uaW5nIHRoZSBvd25lZCBvYmplY3QgaXMgaGFuZGxlZCBieSBnZW5lcmlj
IHNodXRkb3duICovDQo+ID4gIAlpZiAoIWd1Yy0+ZzJnLm93bmVkKQ0KPiA+ICAJCXhlX2JvX3B1
dChndWMtPmcyZy5ibyk7DQo+ID4gKwkvKiBnMmcgb3duZXIgaXMgbm8gbG9uZ2VyIHZhbGlkLiAg
TWFyayBhcyBOVUxMIGluIHhlIGRldmljZSAqLw0KPiA+ICsJZWxzZQ0KPiA+ICsJCWd1Y190b194
ZShndWMpLT5nMmdfb3duZXIgPSBOVUxMOw0KPiA+ICANCj4gPiAgCWd1Yy0+ZzJnLmJvID0gTlVM
TDsNCj4gPiAgfQ0KPiANCj4gDQo=
