Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C861C021B8
	for <intel-xe@archiver.kernel.org>; Wed, 26 Feb 2025 19:58:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44F5710E2F2;
	Wed, 26 Feb 2025 19:58:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wmyb0vvY";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 435F310E2F2
 for <intel-xe@lists.freedesktop.org>; Wed, 26 Feb 2025 19:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740599881; x=1772135881;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=9ha3PPTh4YAI7C+RpA+D9yQPeWbSZI7W9BLkO8Qv1UM=;
 b=Wmyb0vvYPXKHN+T/6WCfyswrGOi/3j79ZNRusY0P9BAdc53M6DZEqJ8F
 zQlNIm2lhogydJJH5ltGbgwrLtQSet96Aa9iPAi8yf+mB3XK9kxT12pjw
 v149AXf0Td+PGuh52doqS+1QuhjCEZv9LPNw5YVk0L2XaHZVEAhi6P0UY
 Bb73u0sgCsB3hHHjFOdVFJSnv/7NaDBn00P6cqj4eE/VqBu8lRxEmiTKM
 t4OaMK/IqapC/G+q02OcUsRQhVJuHKnCIfAgFLlzE+cQrx8MMygVpZeNj
 ZlcoOepa+dvWSrMEYkBL0eaH/+ysayyGXh504VuFH0HYd1vLamme7O0EP w==;
X-CSE-ConnectionGUID: qKP/xGliTr6hOwPAm86Tgg==
X-CSE-MsgGUID: xWxe9cKXQFyc+fZoUwxIGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41598162"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="41598162"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 11:58:01 -0800
X-CSE-ConnectionGUID: lRHhrwSHTweYLajtRTw4qw==
X-CSE-MsgGUID: Unu3MelkRmeltO4ms1iSsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="116978914"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 11:58:00 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Wed, 26 Feb 2025 11:58:00 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Wed, 26 Feb 2025 11:58:00 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.174)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Wed, 26 Feb 2025 11:57:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=STCaeWQRHO4oZ1RSPyXkl2CELQGC7PQKHPowu8eeyIWMavhwZIsNb1bvpPYWzuP5Tx1C7buxuqREPGYfv9pY6Xvig4yObD327QPr1Eld00pJQmtucj+7UnyXghrA8CPe8mEu5L+vMP9N7nRW1hInMPhOWrltaUukLZW76zpZzCPh+MJdry/JeaTb8vjRGeKEChnyWML5XGP+24PqGAl1XhlD/s+ltUa7ZrUKrhNQEH+94gF3g5q9WtOO968Z2t22ZC4ChgzuxLpXyit8yymQ+HVzgKDsnzS6bYrQYOi6TjshPHiFeIOLA/Uk1BZ4fkRaxq+KG9WAsAJOJHVu5NdU4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkQtDpH9XDAJfqy2OFArJ0W7TohnwPAr+Yk9gNG48pc=;
 b=KCoriO7Vali36CD5+gt7V5/GaE2chUPJmWEuPmsJmvfW2ATcNrFLmUnrhSj7Fg+JjxLIlsPnNcIY3CLQujKueCBKJbm2KW+V1Eo4eSJE4S7E3giQb8IMH45EdxddUtf/EqAV2Ydj8oUflp6vhmDOLIzOuMax4tOmnePb0/uH25zxZ2aK3sc3TA5BsiRBRpSjw2JMIQ078NRy9LWAn2HsmQSi4GCrGqmwbvPXD3909WcGabbc1lLJ7DBOTIYeGq0krrolbZe2cAn0MoVdEzhvOV7uzeT/NH/93yM/gFTBNYjWrSoflblVahOahL/b4NUcrvWGwQCa8WP4OKZUIOAkIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SN7PR11MB6923.namprd11.prod.outlook.com (2603:10b6:806:2aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Wed, 26 Feb
 2025 19:57:57 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.8466.016; Wed, 26 Feb 2025
 19:57:51 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ekcbjeapswo73vrk5o6c2rrokyu3csujwtmdkzt5l5uapwzcnm@lbsee67yzjjj>
References: <20250226112106.28173-1-tvrtko.ursulin@igalia.com>
 <20250226112106.28173-3-tvrtko.ursulin@igalia.com>
 <ekcbjeapswo73vrk5o6c2rrokyu3csujwtmdkzt5l5uapwzcnm@lbsee67yzjjj>
Subject: Re: [PATCH 2/4] drm/xe/gen12: Add Wa_1604555607
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>, Matt Roper
 <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Date: Wed, 26 Feb 2025 16:57:44 -0300
Message-ID: <174059986484.3253.3020544858778690611@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR03CA0185.namprd03.prod.outlook.com
 (2603:10b6:303:b8::10) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SN7PR11MB6923:EE_
X-MS-Office365-Filtering-Correlation-Id: 67cd34c8-d2f0-483c-7540-08dd569fd9ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?L0RDZGZ0Vmd5ZjZ0dHNKd3YwV2RzRGRBU1dZL29SU3FyZVBKcHRqTk9vTnlQ?=
 =?utf-8?B?QkE4cUNnMFo4a0lDekluc2RudkVpa1ptNllOMWdzaHVpUTlMQ1h5ZUhRSFFM?=
 =?utf-8?B?aUpzNXpqSlNGVXF6d3lYV2d4cXB5V0VUZDc4V09qWDJ5ZCtGS3pUOVhrTWh2?=
 =?utf-8?B?YW1ucmlNM1ZuNFlRUmVDeHU5QjhQaW1ubi92WXRiNklYRmo4Vms1cnhZWGhM?=
 =?utf-8?B?dTBSSEtSR3JQQnJqZkw0QjRtZlFSQ2pRdGlYYkRYY0lSR29DK2hPVEVBYktF?=
 =?utf-8?B?dkhzYXJDM1FlSmtKU05IaHlBdjFuYWYycUd2cC9INHBYMlcyUWVXUjJSNU1O?=
 =?utf-8?B?VkZJT3VpTGlxcmRyQUs3aHBDUUdkTVVxWG1DYXhKR0NYQ2p1QTJMTDVzT2hh?=
 =?utf-8?B?bS9vZWZMd3BOWGUvUGtYMTcxdkVqTE1tdEpwdDI1RU5jbGZmSnNNM2VRZkd4?=
 =?utf-8?B?RlNKclBibWJCSVY5Y0tJZkwrUHRxTTB5MXl2ZHRBdWI2VEc1YklMVlFZVFRY?=
 =?utf-8?B?dCtEYXhVdEt2TllzV1VZa0tuWXcwQUIxc1d2dHcyamZQNVJPalNFdUV2QkxT?=
 =?utf-8?B?RkZkN1BDdkNqNGpGTkp4ZHlUOTdzN0tHQXA4U0NCSmxqYXVXYzN3MXM2M0hy?=
 =?utf-8?B?cFk4N0NQcmpXcGl0SzZqQW83WXFTU2pYOWE3UGlLOFZSM09nZnN6QnBEQzFI?=
 =?utf-8?B?dDhKZngwVHhwcHZWajY1OWZQemdRZWs5Q2ZHTjk5RlZaNEhaM2Rhb283NUlV?=
 =?utf-8?B?Rnl5MjBDejRvM1VnYytKZnJ2VmJIRlJHYXFxV3pkQ0d6VmhhVFlzYVNPa0ZM?=
 =?utf-8?B?bUxpVnBnNGF6cmJlYk83TjE2cDFJdWhEcGFNaVR5dmNLQU1qYjJVckNDM3Bj?=
 =?utf-8?B?eVpPN21vMnhVOUJQOHpxSVRsVU0wYmJ0U1R1cy9kOG1qcFJ1Q0NFdFRQQkJv?=
 =?utf-8?B?V2drR29MYnJsL2Q0Ly9RZnNlS1JaMC9WM0ljUW9pMzdXSk02aTFXQVhpU2wx?=
 =?utf-8?B?dUx3aXRFd0JlT2kvZmkvT2owMk9lcHg5SmpFYUlFazkvQ3pBWXRSZWxyWTd3?=
 =?utf-8?B?aFZFOWo3VEJ0NElSOVdtK043T2s3cU02TG5QZTJzRXV0ZTVwQ1c5SE92MStE?=
 =?utf-8?B?Z3pRSlI5S2N4QzR6K3NBTHpiYzMvL1BtaDF1L20wQTBvWnp1K3dmVUozYWV3?=
 =?utf-8?B?WUNiY2thTzZpcDlhcEp1Sk9jTi81MVV3MmF0MmRmL3dkbnEreGJSV3FHeGcr?=
 =?utf-8?B?Z1FTbkNYNXNLVXEyUG1QYlczNTBka2pXM01CNHR0cE5RRlAzTmY4eUVoSWhG?=
 =?utf-8?B?WGw5OTZ1emcyVHNEcEs3VGszRjliYk53US9zbWVOdWNJUFp2R2tlVityTzJ4?=
 =?utf-8?B?VWVQYzZvcGF0UGZuTU04ZjRHU0lxdmtxei83Z2NWUkd0ZFFKeGh6RGxNNGk0?=
 =?utf-8?B?alBJYUpFdnNIK0NRYUJlQWpQT0ZMaDh3bUI3angycnQzNlRHdGlHY3A2M3Jq?=
 =?utf-8?B?ZDcydlVOc0QzY0hzRVkxOURhUjQ0ZnBJbnR1Y2VzYTdTYk1lMmR5QmpIZVNZ?=
 =?utf-8?B?aFhqZFpKcDV6bWxHRzV2ZVlCQWNISk9QWUo4TmVNaGhWUVlWdU42ekxyS0xR?=
 =?utf-8?B?WmlySkwvR2hPVGhYOFhkNk5lZ1RJWHFCN2R4UXdWWFd1RncyajZwd2Z2c2Z0?=
 =?utf-8?B?Wi9haFVxVUI0dy9pMkhJRm9vemNaSWFGMHM2UVpMZG01U3kyRzRLM1hoOHJF?=
 =?utf-8?B?R0pCd1VsdElWY3BvU1lsd3JDM2JRVUJjanpKbVl6cThSMVpTQWNxTE9MdlhB?=
 =?utf-8?B?MHl3dnE2YjVqZFVldmpSbG05aVBhRVpyK3dodmVDWHVlUzVCQmU1UmQvdjJJ?=
 =?utf-8?Q?M3oe/C99QIBHi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFhNWVIrSzNoTUhFaHBFZ3ZVRnpFMEZ5dzNkaDFDZ21mK1c5ajNvelgvNElU?=
 =?utf-8?B?bWNyOGp5UVpLaG10WE92RXMwbmhwN0tScmh1amk5dHhnWWd6RFlIS0xZSmlm?=
 =?utf-8?B?R3pPYWhTdHVUMmZHcG0vUkVDTEwvalBJMVNHSTR3bG1xMW4zdElZeVdoUm9O?=
 =?utf-8?B?ZTNHc1JPSTJTVzV6MldsZDdXbXdPcFFlcGpobkRCZ0pPRlh6QkJBZktZNlBU?=
 =?utf-8?B?TTEvc0VmTU5uaEpjdFRwN0diOC9wSEhGV0Rna3pYK252VEV1THJqblorVlNS?=
 =?utf-8?B?TG8waGxlOVRGTXBBQ1pQVHZpRWhYMS9RYzg5c29YMVlzcDVtdDVNc2JjN29F?=
 =?utf-8?B?T2tHZXFIWkxuNWZPa2pyR3lHa0tHMUYwMFI4ZHZsSW1CSzZtNThNOVJSeERB?=
 =?utf-8?B?emtqMTVwaldvZjh3eGthTVhPRk1IVXd1WkZpYktPRHlOOFF1RTRQc0wxbVRL?=
 =?utf-8?B?RkdqZ285NWN6WnQ5ek9kK1lodkRmdEJVR0hCN1JwY0FOaTlXbzJLOXRCbzEv?=
 =?utf-8?B?V3hxd20xdGVibkRWa3E3eHFGVkUvaHJnSGpuaWRIZW1JRlZHY0IvNUdYNjBx?=
 =?utf-8?B?STFLODRJWENrSDhqeTlxMjNsenZRT2JYTDB5ZU9LQjRIRnVaS2NXVHJVWnV6?=
 =?utf-8?B?SFI5MGxyTUFHUjBHczZyYmZxTTN5b2UwQ21CdkY0SEEvMFBIT1lYTFNUN2pJ?=
 =?utf-8?B?a21SWDBWcDY0bzdPelZjOVF0eDlpT3FRTTRvQTB2bEUwRCtKWENrQzdGVlJx?=
 =?utf-8?B?TUFVbUxOS3ZsWFRwVXVIeHhVWnR0a1dBYXMxK0t2L0k1d1R2VmVLS3V2Y0RL?=
 =?utf-8?B?OElBaEcwL25HTlNETWs5eUt4QkpLWExsWkt0OXcvNk1wL1E2RXAvSnNEY1JB?=
 =?utf-8?B?MlUwbkNTNnZVZFQ4MkZMcWpwT2I4VmdDMDI0b0NaaGpJL3N4bk1YY0NSYVk3?=
 =?utf-8?B?dXdhd2VxZjQzY2ZDdkQ2NDlZNzU3Y3RrSWQvNnRGWk54MjRqRWpsU1Q4Mm9V?=
 =?utf-8?B?ZUlsMEFUOUtJMVlBV0x5UTVuWnRVb3EyWUdWWUNBWHZEN0hQOE9Yd1A4NXU2?=
 =?utf-8?B?dVMyRTlBMFNOdTZTSXgySGYzKzNlVklsd1laTWtvcCtTTVlVRXZwNXJ5c3JW?=
 =?utf-8?B?VnlWWVJwYksxaW1mQ2VidWdFKzM2ZnF6TUpNR0ZhV2JBRzk5bUE3UldyWE9T?=
 =?utf-8?B?Um10U1VUbmNjZTE4ci9BVlU1QVA5MmdnMzVwdmhHVk45RGZkTXYwSGxYT0I2?=
 =?utf-8?B?dm1mUnpiZCtTT005Z1lySmIrREZub015bDVacWtzRC8vRUpXRFJpck05TVJs?=
 =?utf-8?B?MDhXYXRoQUkzY3NJYWRQYWwxZG96akFMOHBBZkd5Z2RzaXZqQzJKamF2QU9T?=
 =?utf-8?B?bzFiZkpHMUtnRU13M0tqZmJCdU4yU1V1cDZCV3doRHI0QmtjaWwvRFlNc3cw?=
 =?utf-8?B?eWZISnhxRmhGTmFjSDNhY2ZnM0VTaGx0d1BqZXpGWGZiYW0wOFp2NnRFdTRl?=
 =?utf-8?B?dFA0RmtDZ0dXdmNrT2pBZCtGVWNSdjhETDFmZ2pjb3ZieFpJdEYydVpha0w0?=
 =?utf-8?B?ZVJQejhpQXZuWitaYTk1RUNmTDBPbVZnams4SW9SMmxyZlRTWTI2TzZaUzRD?=
 =?utf-8?B?WXM4K21jNTBaZTU3ZzRGOWdnYVZPSHErQVZTRDZXNDNQYmNINWZQUGM5eUM5?=
 =?utf-8?B?eDZsUTUreGRSbXZxQ1JuSE04dVFMUEFHa1hLSWsrRkhUM3Y2RXpFREphSnM3?=
 =?utf-8?B?UjBDMDkrT0RCZDhoYTBtb0lBaXVxZ0dYVnh1cFdvbzNjT3orNXBFZzlMSU1n?=
 =?utf-8?B?RzcrRitZSTVRdm9qKys0R3dmRVVhZEZjZmQ2OGhtUm5GQ0RTdGlhbmcvY2Rl?=
 =?utf-8?B?bkdxbzUzMmdWQS8yN1R0cUtRTjROVGdkRG1Db3l3eWNTNGtrSFRUWVQ5T01G?=
 =?utf-8?B?OGQyMSt3NUtQS2dxN0J0bTh2cjlJdkF5TjNMOTE0WE9PWUMwYi90YzdjRytN?=
 =?utf-8?B?aDdGRGNjYzdGbngzWEM1Mm85SXIvQVZVSFhVamhFdGp1cHJ6Mzd4clhwREhv?=
 =?utf-8?B?Sk5VUHZZRlBTZDg4MHVlSkJlUUlXMmx2VE5EN3RZZUF3WXYrM0k1M0t4TmxC?=
 =?utf-8?B?S29ZdFBHN1E3WDF4emFoMmJQSVhFQTBwRFQ3UlBEMjZBc3RaNmkvUUN0U0lv?=
 =?utf-8?B?VUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 67cd34c8-d2f0-483c-7540-08dd569fd9ae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 19:57:51.1041 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vmqh51bqOTygYlBtL07e/TfgjSDWf6Uq0iIlxwuuAn62kIghac7jqa3hD08afKV98tSvICec+jLDxYzLXt2r3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6923
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

Quoting Lucas De Marchi (2025-02-26 15:05:37-03:00)
>On Wed, Feb 26, 2025 at 11:21:04AM +0000, Tvrtko Ursulin wrote:
>>According to the i915 code base, apart from setting the GS timer, all
>>Gen12 platforms should also set the TDS timer. Make it so.
>>
>>Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>References: 2b5298b0aa09 ("drm/i915/gen12: Add recommended hardware tunin=
g value")
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Matt Roper <matthew.d.roper@intel.com>
>>---
>>This needs checking by someone with access to the proper docs and proper
>>workaround database.
>
>Tuning and WA db are 2 different things. Digging through it...
>
>Tuning:
>        Bspec 31870 only tells to program TDS (bits 23:16) to value of 4. =
There is no
>        **recommended tuning** saying to program other bits.
>
>        That is FF_MODE2_TDS_TIMER_MASK =3D FF_MODE2_TDS_TIMER_128.
>
>        Same bits are also recommended for DG2 in Bspec 68331 covering DG2=
 and
>        MTL (however in these platforms the register is  multicast).
>
> From the WA db:
>        TDS is documented to be programmed in WA 1604555607,
>        to the same value as the tuning, for graphics versions 12.00 and 1=
2.10
>        (I'd have to dig more for 12.55).
>
>        GS (bits 31:24) is documented to be programmed in WA 16011163337
>        for graphics versions 12.00 and 12.10
>
>
>>---
>> drivers/gpu/drm/xe/xe_tuning.c | 8 +++++---
>> 1 file changed, 5 insertions(+), 3 deletions(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tunin=
g.c
>>index d449de0fb6ec..9e7ec36dbd47 100644
>>--- a/drivers/gpu/drm/xe/xe_tuning.c
>>+++ b/drivers/gpu/drm/xe/xe_tuning.c
>>@@ -97,12 +97,14 @@ static const struct xe_rtp_entry_sr engine_tunings[] =
=3D {
>> };
>>
>> static const struct xe_rtp_entry_sr lrc_tunings[] =3D {
>>-        { XE_RTP_NAME("Tuning: ganged timer, also known as 16011163337")=
,
>>+        { XE_RTP_NAME("Tuning: ganged timers, also known as 16011163337 =
and 1604555607"),
>>           XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1210), ENGINE_CLASS(=
RENDER)),
>>           /* read verification is ignored due to 1608008084. */
>>           XE_RTP_ACTIONS(FIELD_SET_NO_READ_MASK(FF_MODE2,
>>-                                                FF_MODE2_GS_TIMER_MASK,
>>-                                                FF_MODE2_GS_TIMER_224))
>>+                                                FF_MODE2_GS_TIMER_MASK |
>>+                                                FF_MODE2_TDS_TIMER_MASK,
>>+                                                FF_MODE2_GS_TIMER_224 |
>>+                                                FF_MODE2_TDS_TIMER_128))
>
>so... I think this should be only about TDS, also known as 1604555607.
>then in xe_wa.c, the GS programming added for 16011163337.
>
>Matt, Gustavo, can you double check that?

Your assessment seems correct to me.

--
Gustavo Sousa

>
>
>thanks
>Lucas De Marchi
>
>
>>         },
>>
>>         /* DG2 */
>>--=20
>>2.48.0
>>
