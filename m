Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96336C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 28 Jul 2025 16:33:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3825C10E53D;
	Mon, 28 Jul 2025 16:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jLpjqe2P";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B6D10E53D
 for <intel-xe@lists.freedesktop.org>; Mon, 28 Jul 2025 16:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753720402; x=1785256402;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=8Y+ltEUPgctiRfCR8tR66EvJHIpkTc4yKHPBAoQv4cQ=;
 b=jLpjqe2Pyoq0lpGKlsEBu2J05AVMu5NUkpdHFNDn+y9tbtOj3Z4Bn4c2
 R72bT7XwQxNAz4naOeCEVRys6cLnmN+12P2aeyOdXitHPH9bEfKgKq7MD
 Jkrk2Pt7r0Wq329CDGiMHnDS+NY7Wj4/034mg7NO39uaP/vKR6xYLJ5fp
 5AHEbGynWmtpep47hT0r17hqx9JRBCYEuUUPfMft3vFdiaB/0xlCL5HX8
 JfPTb5kN6ukWH1srGbHNPN0Du6NnB4nQPuk6yKE3raNYTEhO8wKALW+hF
 QMt9fYc4+VnRxlOHrINbG9yf4saJNvdU2I+07Jo/T4SJDa1V4IIjNPj3+ g==;
X-CSE-ConnectionGUID: KZPAbChjS92zhf1g909vTw==
X-CSE-MsgGUID: uDgomGDWRD+v8tEW3hyRxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11505"; a="56126725"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="56126725"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:33:14 -0700
X-CSE-ConnectionGUID: aRS3Dy1YR/26OpO517jxww==
X-CSE-MsgGUID: 7GgQ280IQzyxf/HoSNih+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; d="scan'208";a="162812374"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2025 09:33:13 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 09:33:12 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 28 Jul 2025 09:33:12 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.66)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 28 Jul 2025 09:33:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A6ZRSRd+v8hH57z6dKYtqkR+HXmCNvEI379+hEE9WjwNhFwyLcynzfBdAjwYW9y7gv9hsie8LtZmLeTSZZh/ayEkiBvB60zLheVtMWnCCBEZowsIv2nmoL/8k+z637pgh/W9mKbfzwCIJpRUcreub4BuEhIyj6g2nnrTzQ1mPs3x/2s1b9xU3SUEHtRxeo/JX9ZIuOlXrjvfDJLAnie0lAhOQzA58wNbfLasrXSYTipgcybBDglMIvGQxA2lahElXu7bD8ZepEz9O1J1ip4om0W7O9D/ohyAVGtgQt2Pnu20lbCdXr04M88qBU+albHAXwNm0Zzk9S4vOcVuU3t2Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+KFUgro11f1RDjmQq+/NFfri30VzOIUmz+xk/AfF9c=;
 b=Uzy3GZBzVXbdv61VrnFpKl/AxCuT2rfeDg7tSW1SD8Z9OqF+dqrUN+PNGdN+21mibRyY8g6NR1lhYTuD7EZDSOs+w6TWiXq5AHQ+eh18BCg6ZfS/8rdLXQORX7XMYKcknPxWigJAc39AKimkr150pmn2uQbE5rJ9QPRh69FL7v4898E0nm7amnMHTY4k8DHbBVlDkjstycA803LM1PwT5t4HAl3LMcsyJFm6TOVAbTLPk+exX6qKFIrB3yjI/BljPwWvyqyjtclk1SJeaGlmyY2VF1n1RC+4ibIIhMPiAUQ4I1Wo0HLGUiQzQGzKb4FXpgBp0FBU1Hjvi1jMMJp3xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by SJ0PR11MB6789.namprd11.prod.outlook.com (2603:10b6:a03:47f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.26; Mon, 28 Jul
 2025 16:32:41 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.8964.023; Mon, 28 Jul 2025
 16:32:41 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL1PR11MB54457CF0BCDF49B95235D47AE55FA@BL1PR11MB5445.namprd11.prod.outlook.com>
References: <20250723-gt_count-improvements-v1-0-3016134db9ea@intel.com>
 <20250723-gt_count-improvements-v1-1-3016134db9ea@intel.com>
 <BL1PR11MB54457CF0BCDF49B95235D47AE55FA@BL1PR11MB5445.namprd11.prod.outlook.com>
Subject: RE: [PATCH 1/2] drm/xe: Probe for tile count during device info
 initialization
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Mon, 28 Jul 2025 13:32:35 -0300
Message-ID: <175372035526.6473.13464833330415034724@intel.com>
User-Agent: alot/0.12.dev27+gd21c920b07eb
X-ClientProxiedBy: MW4PR04CA0274.namprd04.prod.outlook.com
 (2603:10b6:303:89::9) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|SJ0PR11MB6789:EE_
X-MS-Office365-Filtering-Correlation-Id: b7d2861f-7ecd-4a41-b2b1-08ddcdf45f1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZnpmN2o2UkV5WVFiSmJhSy9mc2djOGNFU3FKTkwvOXhueGhwZWU0SHB3KzhN?=
 =?utf-8?B?Y2lFeHhOaEJZTDNMNEt2bHBSaWNqbXVkbUYwb2NyeFFrc3c4UVAvcllrcjY0?=
 =?utf-8?B?OEZrcmsyMWVkNTdWSFpYV3RPUzJGUk1JdHFKclFHSDBWalN6N0dCR3FDRGhR?=
 =?utf-8?B?cGg1cEdnbTA5QktCaGxjc2xTc2ZSUE5tZkdtTlo3akF0MldzanhKTHRDVUVP?=
 =?utf-8?B?WFAyNDcvMkROWU5hdTJnRStqNlhYQS9FRjNpUHRZeXg3N3MrdVVTSmpoS2Nl?=
 =?utf-8?B?Y01RVlh3SVJOekdhcW44QkgzOVBKaklJRnIzU3JKNHRqbHBTYitwN2JTRVVa?=
 =?utf-8?B?SHdsSHIzNVJnQnhyN2FJRDRTRC9BakhiNDFQbFdGYkJWQ3JjSndPaU4wdTIr?=
 =?utf-8?B?M0lrMWx0MWh2MmRhbVNUZDBnQ3BnL1pNL0hnUTBUbVNCUWF1dTJ2RkkyZkFo?=
 =?utf-8?B?YUhpYmJZdjFPaHJTbDd1KzI5eDFoWDJtcW5GQ0tsK0E5WnF5VXliYWZQd1d6?=
 =?utf-8?B?N0FubENGaFVTRHhnNTFvb0RtLzU0SkhHaytTV0xyN2RvR213MFdRNzJGYWlX?=
 =?utf-8?B?SHI0K0sxTkhhOE4xQ1JIcTdoZ2pxanpFZ05oNUsrakNlaWwwWG56RU1CTEVm?=
 =?utf-8?B?VEYyYzRmbVBJNlJ6UWVmc0JMWHFwMTJmaVhOTURwSDdZWjBRdTlQL2djRU9u?=
 =?utf-8?B?SWFDNlAyNDY1VXVmLytSTjZtUXh3VHhMaUdHV01XRFZMWEQ2eVNlTll4cUhU?=
 =?utf-8?B?YUZBTE1wdWQyNFMvd2FMU3pWNmlqWGF6QUs1dW5kRllWSmFZY2R0Mjk0R0lu?=
 =?utf-8?B?VitSS0pZSDNmL1Rocm1zQjc2d3NWOXZ1dW1FdzdsbFo5SStQVnVDdFRzNmhn?=
 =?utf-8?B?QVdZMEtKZmpUZE5VVjdQTHBtd01jWDlZd0xBdDJLNE05NkViWWVBMFJFdUg1?=
 =?utf-8?B?blU4QlZMV1hMZGdBZGJrdDdYYjJoQjhOVGZscm9mLzA3SW5HWVYwSFdVT1RE?=
 =?utf-8?B?OFYwc1ZXdFNlRXBLN1lYeVJwdU9HdXBhVXJiYmdhcU5PNzV5SjBoZzl6aS9R?=
 =?utf-8?B?d0puQktVRGRwUnVJaWtmZWdsZCtyRitWS2FNTVhGbkhlV25DNTMyNGg0N24x?=
 =?utf-8?B?YlBXYWdhbmsyZnJ5M3BJL2pHdGlrMTM2ZWt6ZUlKOG4rN0hXMWVNUHJqM3dK?=
 =?utf-8?B?dVMwWlQvbm95M2hscHBDUGliek5NRXl3ZjFvdjdUeFV2ajZRSTRBWURpeVVW?=
 =?utf-8?B?dys5UDk5eEI3enEvbmtXcFdiME02RCtXRDJMREw3L01VUlJ3TVhNcjRyeWVF?=
 =?utf-8?B?cjhFNmgySGFqZHBuVUphTy81OS9OTmxpQVZLY2dMTmIvK1ArYkFseWU1VXQ1?=
 =?utf-8?B?VHZTNUlsQklsQUY4OXh0OVJJTTJra2c5eGRZRm9EOHJrZDNhbVdRNmloaWlC?=
 =?utf-8?B?TmdPQ3RCYWRWVDdESzJtcnZSNjhMZG5HSVBBRHZiN1lVRmRsdkxhZ0lMWFRt?=
 =?utf-8?B?cTZPVW1EVVNnRm9FMUNsaFNkLzdFQTVXZ2p6b0w5ZnRHcXFzODFLZnVHdWxq?=
 =?utf-8?B?NDc2OCswRVN1a2ZCVFpicFJQeFlkN1d6dmtUQzdrTEhHYVBTN0U3eG9LYXBs?=
 =?utf-8?B?RjM1NkdnakNpeDRweUd4cHpyZVhMQzJiNnUwTGhLZ0k0Ty9aejhiaVphNGZS?=
 =?utf-8?B?VFVrL3pwTjY5Z2hrckJSMHlveTlSR3ZEbTl2QXF4SlJIRzFDTjlKclFKcFRh?=
 =?utf-8?B?QUxEbGZiejl5a21icXNPcmNYTWtxMFlnNXlhNVhDUVlMNnJ0NXNHVjhES2tB?=
 =?utf-8?B?OHp3Qy9OQWdIcTEvRm91eVNSMkptT1hRdFV2dkd2Y09uVWFpS3dPTUwzUXEw?=
 =?utf-8?B?ZVBiK1NDbDZlVE9GNHRNcndMZ0g1NlZyYndNakVWU2VSRTcxK3Z2cDYrZ3BN?=
 =?utf-8?Q?eSruVno3dXE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SmYxdEVMcjNrOXJhYndyeVE5ZmlSWC95UXNGN2JvK3luN2V5MHkvNlY1b2NM?=
 =?utf-8?B?M2c2UkJDN1pNRVhxZXJPNTZMckZvUUR2K2dhWmJEUXcyMzhDRUx0c0ZwVUs4?=
 =?utf-8?B?cldORXRzdDI5NUZUMzlPZWF1UzlobkFGeFNONjI3YUphQVZuODZTU2JLU0hy?=
 =?utf-8?B?ZlR2b3FobHZUczNtTmlwSHpjaXhFNWFQUGEvSW9GZTUrMHRkNUwvT2wrb3V2?=
 =?utf-8?B?SmpWNlFQN084cUxPMmt1UFpLcHZKeXROVGErMXQ5VEVlT3RFUzJGeDhQTHhj?=
 =?utf-8?B?Tm1VNldTVTlQRkZlajEySm1tS3Q3TVIvU2hSYWU1aEJjTFZYRWZnREQwQzZK?=
 =?utf-8?B?YnRhbnNxVWF4SGJxOFUyTFdaWWFHcEpyaHFDNGc0eXhiUkJwQmFRRVhXVjR6?=
 =?utf-8?B?T21XZlJTT1RWNGJwVktORVV6MzdtbGYraGt0UkxGVXJKaDBtcURhMXV5UWh6?=
 =?utf-8?B?cDErdmZ6Z0p0RTcxQVREeS91UGEwOHpiM3g4RWpEaDVVa212dnJ5WEswejNv?=
 =?utf-8?B?RHlPcitDL1ByL2dqdWtVd08vZ09jbTlEdnNsNkRSc0pJUDB3eDVmSGhuVWdE?=
 =?utf-8?B?V0ZqYUpyZE0vdUpKZzdCS3Z2RCtBT1JzdFNNcHpYR0J6bmtIaXpya1RVeW84?=
 =?utf-8?B?Y1l0WlRBeGFCODduRjhaM2t5alFVVzg1MS9KR1NjMGxEVVg2OFdRMlkxblhG?=
 =?utf-8?B?YXg5YTdNVTlud2YrdCtZd3FmeGl5Rm1rZGJFU0lJOUo5TThCa2FQbHFmQjd3?=
 =?utf-8?B?Y1FSUFdDblBXaTQ4bm03Ny82dkV2ZmFQUnk5NmFXS2JWRDNUL2s4ZExqVWk4?=
 =?utf-8?B?bnlXSlMrSzNibU1CajRiNURkMnZzbTZoN29uRjk5MnFBL2lvaDFucXl2ZDFH?=
 =?utf-8?B?Q3F3cXB3RWZhU3V4NmdnUHYzQ2tkcS8yOHBkUEQ1UkE2Sng2QkE2VnF5YmpW?=
 =?utf-8?B?VldDSUFVSXJJRk5od1U4NFZNVjdrWldMd1ZKWGl4dnVUT25wcmlBUXgvVm11?=
 =?utf-8?B?RTRKVUZLTlhkeXJ1UWNBRjQ5TURWNDdnS3JFWEdpc2lXaUt0TGVITnM0ZmE0?=
 =?utf-8?B?WVQ4N0tIZ041aUpyWnhaODBFc0R1NStodmZxdmhlc1RQc3ZDQ2dVNFlOSzgz?=
 =?utf-8?B?RXFtdXhPbEpvMmovQTVIdHU0b09VR2ZLNHhhMnRlelNLUVFuTWk5ZkhrYkpQ?=
 =?utf-8?B?TVNrTk16ejhOMEV2TWhSR09lbHhuWEtIeVVBMW4yeTJpN3NSeXpzTVRwYVM3?=
 =?utf-8?B?LzFWRCtVczdBdkExOHJtT2U0a1NKaTh6R1Q0UW1lNUFjcTJKOE4wZUNDR3Q2?=
 =?utf-8?B?eWtkb2JReWxQRG9XdWNCMHZsR3daeWN6TlZsS1VLUU1zSGIrUXhkaVNSMkZV?=
 =?utf-8?B?RlNsMCtJRkdUY0lMdng4MmZyT25iSEpEQjNSUlI4NXpUTE5HZGpvUlFvbXF1?=
 =?utf-8?B?cm9QOHhqdW1OWVB0VVJKYlp6NTRySUluV01zNUhzSlJUK2V0Z1l6c1MxNW9h?=
 =?utf-8?B?SWkvRmcva2RQRXZFRXlvVU1Ta3FVdlM4cWVTcitncVJoazhZTnVyam5oQkt6?=
 =?utf-8?B?ZTBDSm5LYktQS1RUTVJ2UEJHMGVKZUJyOVNWWTRrd05XYmN6NUZSRWZMeXNu?=
 =?utf-8?B?UHBNYmlRNUwwRUJQSjlxYmZxWE0xNXpNUEE2RDFwOHFtWUdMd2dmVEZMSlpn?=
 =?utf-8?B?b3QxUVVGZjQ3WjBpWnJjTTR5enY2TEhOMUlnWHZWR1c5VlFZajBVSGtsbE1X?=
 =?utf-8?B?OW9CWVcvZ1ZGYnMyZ09TMXlRZ2Z5bG9MZy91L3l0REFMalJLd0s5L1dxbWxW?=
 =?utf-8?B?ajBFeUVxaCs5eURhMXdnM2xrbDRIa01UWWJ1OHhCbGloMHBMeEIrTlE5T2gv?=
 =?utf-8?B?L1J1aytKcWQzRlFkSHY5dlBJN3ROa25jS2ZJL0VnSnlqTzkrS2F4ZmJHdGNB?=
 =?utf-8?B?MzhXNzlydVhOZDJUQUxYNXJ6UmtkZGlpSmVmei9nVU85QkJLeFBiWGNzU2Nw?=
 =?utf-8?B?MjJRSXBvM0ptNnBJaWhVaVpnTkhkdnJhU3FteEZTVldjV3VNNzJyb3F4LzY3?=
 =?utf-8?B?clhMZWV6OHB1T3pFR3FYRkp1aFowVDFER0tNUmFaOVkrbStmbmxtYlo4VWl1?=
 =?utf-8?B?QzJqVWhnQmVvQkI3cmRQQURTY3dnSk1VdGFYWjNmZkZSMCtWVXVhOWtPSCsw?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7d2861f-7ecd-4a41-b2b1-08ddcdf45f1c
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 16:32:40.9814 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yLJQhDQcUSiiMl3b2ynkcX8v9V6KDi8cf4xWoPmqnBkvLpFJgjm4+bZYVfS0YBy/RzuAcGaLkHBvoxUDMVjL0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6789
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

Quoting Cavitt, Jonathan (2025-07-23 19:01:23-03:00)
>-----Original Message-----
>From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gusta=
vo Sousa
>Sent: Wednesday, July 23, 2025 1:20 PM
>To: intel-xe@lists.freedesktop.org
>Cc: Sousa, Gustavo <gustavo.sousa@intel.com>
>Subject: [PATCH 1/2] drm/xe: Probe for tile count during device info initi=
alization
>>=20
>> The function mmio_multi_tile_setup() does not look like the proper
>> location for probing for the number of existing tiles in the hardware.
>> It should not be that function's responsibility and such information
>> should instead be already available when it gets called.
>>=20
>> The fact that we need to adjust gt_count is a symptom of that.
>>=20
>> Move probing of available tile count to a dedicated function named
>> xe_info_probe_tile_count() and call it from xe_info_init(), which seems
>> like a more appropriate place for that.
>>=20
>> With that move, we don't need and should not adjust gt_count anymore,
>> because the function gets called before the original initialization of
>> that field.
>
>I'd maybe reword this sentence to say something like:
>
>"""
>With that move, we no longer need to adjust gt_count as a part of the

It is not only that we no longer need, but also that we should not
either, otherwise we would get the wrong value at the end. I'll try to
use what you suggested with a minor tweak.

Thanks!

--
Gustavo Sousa

>xe_info_probe_tile_count function, as that field will be initialized later
>in xe_info_init anyway.
>"""
>
>But other than that:
>Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>-Jonathan Cavitt
>
>>=20
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_mmio.c | 33 ---------------------------------
>>  drivers/gpu/drm/xe/xe_pci.c  | 32 ++++++++++++++++++++++++++++++++
>>  2 files changed, 32 insertions(+), 33 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>> index e4db8d58ea2d..ef6f3ea573a2 100644
>> --- a/drivers/gpu/drm/xe/xe_mmio.c
>> +++ b/drivers/gpu/drm/xe/xe_mmio.c
>> @@ -58,7 +58,6 @@ static void tiles_fini(void *arg)
>>  static void mmio_multi_tile_setup(struct xe_device *xe, size_t tile_mmi=
o_size)
>>  {
>>          struct xe_tile *tile;
>> -        struct xe_gt *gt;
>>          u8 id;
>> =20
>>          /*
>> @@ -68,38 +67,6 @@ static void mmio_multi_tile_setup(struct xe_device *x=
e, size_t tile_mmio_size)
>>          if (xe->info.tile_count =3D=3D 1)
>>                  return;
>> =20
>> -        /* Possibly override number of tile based on configuration regi=
ster */
>> -        if (!xe->info.skip_mtcfg) {
>> -                struct xe_mmio *mmio =3D xe_root_tile_mmio(xe);
>> -                u8 tile_count, gt_count;
>> -                u32 mtcfg;
>> -
>> -                /*
>> -                 * Although the per-tile mmio regs are not yet initiali=
zed, this
>> -                 * is fine as it's going to the root tile's mmio, that'=
s
>> -                 * guaranteed to be initialized earlier in xe_mmio_prob=
e_early()
>> -                 */
>> -                mtcfg =3D xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
>> -                tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>> -
>> -                if (tile_count < xe->info.tile_count) {
>> -                        drm_info(&xe->drm, "tile_count: %d, reduced_til=
e_count %d\n",
>> -                                 xe->info.tile_count, tile_count);
>> -                        xe->info.tile_count =3D tile_count;
>> -
>> -                        /*
>> -                         * We've already setup gt_count according to th=
e full
>> -                         * tile count.  Re-calculate it to only include=
 the GTs
>> -                         * that belong to the remaining tile(s).
>> -                         */
>> -                        gt_count =3D 0;
>> -                        for_each_gt(gt, xe, id)
>> -                                if (gt->info.id < tile_count * xe->info=
.max_gt_per_tile)
>> -                                        gt_count++;
>> -                        xe->info.gt_count =3D gt_count;
>> -                }
>> -        }
>> -
>>          for_each_remote_tile(tile, xe, id)
>>                  xe_mmio_init(&tile->mmio, tile, xe->mmio.regs + id * ti=
le_mmio_size, SZ_4M);
>>  }
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index f4ea13527945..4f5d4f0a8173 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -17,6 +17,7 @@
>> =20
>>  #include "display/xe_display.h"
>>  #include "regs/xe_gt_regs.h"
>> +#include "regs/xe_regs.h"
>>  #include "xe_device.h"
>>  #include "xe_drv.h"
>>  #include "xe_gt.h"
>> @@ -603,6 +604,35 @@ static int xe_info_init_early(struct xe_device *xe,
>>          return 0;
>>  }
>> =20
>> +/*
>> + * Possibly override number of tile based on configuration register.
>> + */
>> +static void xe_info_probe_tile_count(struct xe_device *xe)
>> +{
>> +        struct xe_mmio *mmio;
>> +        u8 tile_count;
>> +        u32 mtcfg;
>> +
>> +        if (xe->info.skip_mtcfg)
>> +                return;
>> +
>> +        mmio =3D xe_root_tile_mmio(xe);
>> +
>> +        /*
>> +         * Although the per-tile mmio regs are not yet initialized, thi=
s
>> +         * is fine as it's going to the root tile's mmio, that's
>> +         * guaranteed to be initialized earlier in xe_mmio_probe_early(=
)
>> +         */
>> +        mtcfg =3D xe_mmio_read32(mmio, XEHP_MTCFG_ADDR);
>> +        tile_count =3D REG_FIELD_GET(TILE_COUNT, mtcfg) + 1;
>> +
>> +        if (tile_count < xe->info.tile_count) {
>> +                drm_info(&xe->drm, "tile_count: %d, reduced_tile_count =
%d\n",
>> +                         xe->info.tile_count, tile_count);
>> +                xe->info.tile_count =3D tile_count;
>> +        }
>> +}
>> +
>>  /*
>>   * Initialize device info content that does require knowledge about
>>   * graphics / media IP version.
>> @@ -677,6 +707,8 @@ static int xe_info_init(struct xe_device *xe,
>>          xe->info.has_usm =3D graphics_desc->has_usm;
>>          xe->info.has_64bit_timestamp =3D graphics_desc->has_64bit_times=
tamp;
>> =20
>> +        xe_info_probe_tile_count(xe);
>> +
>>          for_each_remote_tile(tile, xe, id) {
>>                  int err;
>> =20
>>=20
>> --=20
>> 2.50.1
>>=20
>>
