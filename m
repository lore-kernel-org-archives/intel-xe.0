Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB465C77B7F
	for <intel-xe@archiver.kernel.org>; Thu, 26 Jun 2025 07:15:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894FC10E27E;
	Thu, 26 Jun 2025 07:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="McFwnDzz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3901810E27E
 for <intel-xe@lists.freedesktop.org>; Thu, 26 Jun 2025 07:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750922128; x=1782458128;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=E5yOy8A1uUbRVp3AroQqouG5LORTjTBuIWdtgbZ9qvo=;
 b=McFwnDzz4ezOL7oM67FqdPoJJxvn3ff0p1WMczNrjcMrH4JRFXRqYNSv
 aaLcFmKO+Bvz8UIDWL58OvbBUp54U8EwHJK8ATE0QQmgd2OEuQPQmnYQI
 1pHjpENsir57uPIE0u5OLjq+UZXycoVY1Pc17hLCMbbpOs1PxL47aCBz4
 KI9lc5+ydUg8sD3/hUhtNUY/ZIHnQztdB+9vnLWMvT3wUiudFpWizp8SF
 a8Qcz2mgjOE0Y3HmpN6ZvkxOG1sr+qgqhEWtUx7XHkchsYBFn+uVrn2v2
 G5gJ6jpYeVmDLanpieqbCthTavNfWRrRtV+XQy22ExgBw4MTU946Ou27a Q==;
X-CSE-ConnectionGUID: lmTgpqRDRVmD89Nn+LuXUw==
X-CSE-MsgGUID: /MQjDLfjQLCNxITWGqm9Lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="56991546"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="56991546"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:26 -0700
X-CSE-ConnectionGUID: EucqQsg+RCeiVIS93aTLNw==
X-CSE-MsgGUID: eWYVU8CbQzWpRnNkbhnziA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; d="scan'208";a="176097430"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jun 2025 00:15:21 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:17 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 26 Jun 2025 00:15:17 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.68) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Jun 2025 00:15:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RLDTdMSKmUF7vCpqApUxKEFltgmNWdWhLfo9Tsm5AqkwMXmnfzu349iHe7ooeB6gGdfP2rtCVc90t+TWB8L0BCHSTh9HvvFEXwCUErXY6uGOw+Y5zFiOdv4mGrDVdRag9Upl6bNAnPtPsfXn3B17dNgR8rUpKLFJFIxgf/E3FSGD04T+G8qzjS+A6GUkOoFQx91ajVw5JieAW1TE+xxcaSrQ//+NrG6d2dpBkazZtIX4boaiLzerpcKslb6I0p6JSVknJdIxE4xb8tI/DDmedl+LHjjkVrbWx7WRaYhZbXzWHdf0LfAEzEn5oXF2x5IyGYG0C3E5JuphkJg/NlJ7Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UMh6SkacUNWcZ6Fh9Iv7W2LDqN3ccR+jl+z858LFXDw=;
 b=UqvoQVM4BJzivjoY5IE6XT1t5HVn8RNtCGFxvyqW4L0OQBBgIQ/OiIgthkB+kXYyWbIJL707fcfiT1z7hIXoRX6afJWRpSvWnLsnuQ+NRvNLoeNGe3Kt6Ne7FbLWOJcmfDHMgG3kY3lUh1JKZwKO45Ra5qLdQHLlKVeDEJ+Znje1gy/I5fRvjFs+bjmJ7HtD4c8EswbxqbIQLfOIWVciCVkJgA2vWedH0g0ZqZAT1LKswQ7TCyy7HjsPSQsseoudGNGa0sespUOr/saacQIDRCbrQ+Vn1ZYGdiIE4r0xvxI5qSE5A07CBJBWmsJgSkN10fl2WR7MdcS5BXsReZniYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB8827.namprd11.prod.outlook.com (2603:10b6:8:254::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 07:14:49 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Thu, 26 Jun 2025
 07:14:49 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
Subject: [PATCH v6 2/4] drm/xe: Use dynamic allocation for tile and device
 VRAM region structures
Date: Thu, 26 Jun 2025 09:14:35 +0200
Message-ID: <20250626071437.3223888-3-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
References: <20250626071437.3223888-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0112.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::11) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB8827:EE_
X-MS-Office365-Filtering-Correlation-Id: b1c4187c-c2de-4c3c-2af0-08ddb4812324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RExCaWJnczNJdXVia3lSUCtmMEsvc0cvZWdjY1dQL3VkeEdVVFhVUVFONFJz?=
 =?utf-8?B?cFpwYmdvaTVkZEpHSkU0WjBrbGF2UDQrOUZrV0xFRFd2c0J5b1RUNy9pVUF3?=
 =?utf-8?B?QTN1MmIvekdHVm5SWS85SjRURG9NZ1JPWFpPcVNMeklxeDlsaTFSZk82Zk1q?=
 =?utf-8?B?ZG83Z1NLQ1prdkxCMk9DaHlIUC9ac2pLellmSmIwTjYraGlIamwycm8yODN4?=
 =?utf-8?B?aGlBbGkxNjJQM0I5VjcrTHBTSStGTWxNVkw4N2ZMWkQ5ek5ReGNqeThNMVl2?=
 =?utf-8?B?Nm9UdllPVXo4RjZkN3hDQzRTbHcvUVJRdjlxNU9DeUdwZW80WG9rckFMdXc1?=
 =?utf-8?B?d1QrZnZXWG5rYVlYVUFPWW1aaVEwcjZNeGFsZ29uSCt5WUpLT1FWL01WdWNy?=
 =?utf-8?B?dWtuQzhuVTdLS2pNMmtyRW1PZUlZdDFoWTZaV2RYemp5SXVQNXZGaXo0Sm9v?=
 =?utf-8?B?Wng1SDczaUphcWxZVmhvVTdyNTdubCtoaS8rOHlXb0k4U1FkN3o5ZDllRzZz?=
 =?utf-8?B?bXI4Wlp5VjVGYkpYVHlFS3dOdWhYdmVHWGpGUEZwZWd5OXRyTVBBcFh1QVF2?=
 =?utf-8?B?ZGMrc0FCbkVqcjl2K0NaNlJhc1ovU08vUUxvS3F0YXBSeXlCRjd3MzI2YzRX?=
 =?utf-8?B?RFRHUm55NVNOK2lhaXhjN2p3RzdTMUxwRmV2NFpEdGZJMjlkR2ljeHd1eU13?=
 =?utf-8?B?cFdaQ1FjZ3JQZk1DQ0RJTzZ4MmxUYUJWUUkvZGFZa25IaDVnUzMybHB1MjRP?=
 =?utf-8?B?UXdJM0xZNzRFME02dUw5N3F0U2Z3bzdJY0UraEQxakJmby8vdzNHWEhnVUcr?=
 =?utf-8?B?RmVaaEhSTnR0Z3ExTkJFNG43eVJ0RGxZZFFMbG9pRVduQ1NZdERETm1rOFZr?=
 =?utf-8?B?MDlIZFAyUkxCQUJjVEJ6Wnp4aWlSckU3dXlPdVlVb2M3VHU0dUQyc252ZGNR?=
 =?utf-8?B?MHQ5NlRFU3BKWkxoWnRzU3lmRU8xRFRRdC9xVUcxNjVoL0pZVkt3bmZPNGp5?=
 =?utf-8?B?aC90YWZ1R2hobUJjLzBrS3RiaS96T3c3RXpZeDlvcEljWW9ldEhpZDNuaTRn?=
 =?utf-8?B?VlVUdWlxcDVGeU9KOHl2eDl5NkF5TFpzUVI3dGR6MzVGYTB6ZVo0em9oY2RK?=
 =?utf-8?B?L3FmclAyWW9qMFlPelJNcEJ2STc5UWRvNnpsMjAvckpvcUNmQ1NobmZXNU9r?=
 =?utf-8?B?VWRzU1Q1TUl4S2dQS2VPZU40cGxVUFlod2RtMFFFZFVVeHZWR2MzVEtEYzgv?=
 =?utf-8?B?VlZQQW1vbURSU0daNUZRM1E4eVA5dmJmV3J2bmVLaFVUQ0twWjhTYkZzamsx?=
 =?utf-8?B?a1p5azNQZzlyLzVEelJkTTdheFhvd0tDU1pHdlUvUzV5NEVHL3hsL3RUQzBH?=
 =?utf-8?B?SzhxdDUwTEwrekc1UTBmVVdsQWR5WjRtZHE1QVhEeVdzaS9ZQ2hhcVg1M1ND?=
 =?utf-8?B?cGtUYXNqZE5TVkc1SEpXdDF3YWZ4MEd2NXpLUUc2Tlh3WXBsV0EyODRRRE9F?=
 =?utf-8?B?RTJGd0g1MFpsWlRKVkdNYW5tM21iMVg4Nlg3a3p3Yk13eTUyTWdGeFBlOWxN?=
 =?utf-8?B?OU9RcCtmS2F5STlNSzFYd1EvdEZnR2pQOVpUSzdzNVRGNFdjSWpkaFlMZzRS?=
 =?utf-8?B?U0JZM016QmxGUnRzMm9EbG11cndHYitlaUhqeU5TeWV1clNGL0NHUzdkdDA4?=
 =?utf-8?B?QTVaeFovMjJjUkE0Z3Q5K2dJNTVQdVJSNlIvdnJlK1FwNStVcjFoRm9ydWJ2?=
 =?utf-8?B?alFhUWVKS0RvOTRSUFdQTjFocGdKTFJBR3RsZ3N6dnB4WjMrK3h5RlptaFZi?=
 =?utf-8?B?KzdJbWJydVVQZnZlMk8xY0hpbDgvSE0xVTdXU1FWNFBmelhsVFpSTGo0OW5X?=
 =?utf-8?B?OWF2d3BSMkZGYWRidUExRmRWZ1FRQUNRUHV6eldnR2ZRVkZSd3ZxT0tOWDRG?=
 =?utf-8?Q?+5mrUe6v1cI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHVyY2UyTXdqQ1lUTFRzSzFpRWN5bzZWOWJydmYxZGJGQUNTSi9TN3RIa3Bn?=
 =?utf-8?B?dmQwdGJKTGdHem5yc0kxNy9ZaUVsbkl4dElveTFTSDFNbUlIeVFYYWZQZW5i?=
 =?utf-8?B?c1ZtcnF2SDlqK2ZuQU9YRk9DcG8vSVlBb1FrbHJTbmo2TzhkTUZCdUY5YzVa?=
 =?utf-8?B?a3J6Qmg1OFVJWExlVkNZSDE3bnc2eWF2dHZYVjI0c0RKM3RLY3lxb2hLTHV4?=
 =?utf-8?B?b3I4b1RSY2ZSOVVDUDYzWTBtNE1EUzVkOWFzVnY1My9pbHZNL3NUL3NDVU1S?=
 =?utf-8?B?RGdHd1llNHRKS0VEK1doek5FWlJmdFJKbTBtbzU3WlVuUzlpOE0xL29ycWVz?=
 =?utf-8?B?RDdoeGpzZXNkTFQzdmVIQk9iOW1tK0JLVFFPK1kxQkFuRzRNYktKbHBWU2Vs?=
 =?utf-8?B?WlQ1bWNFcnlFWDVHRjVoUnVVbUhTYmk0eVBXVzUxMktkOXdhbjJGZENLZ0l0?=
 =?utf-8?B?Nk13RTcybUdkVzZGcUlHTVgvUDF2UEtXcTl2aThYS2RHUFdBV3R0UUVoSlJM?=
 =?utf-8?B?MStZenIzcDBuTExFbkQvUm8ya1NHQitFakxBN3hjMW5QMnZuNHU1RGJEMlpu?=
 =?utf-8?B?ODZYQU9GUVRwYjVSY0VlS0lJeHJROG4xMkQvM2xna1E1R291ZzBNVkxYdnhN?=
 =?utf-8?B?ZjJmY3d6akNsU0RVcUk1eGRiTlg5NmpKNitjY1pna2Jnb3IxWWQzWG9oOGkv?=
 =?utf-8?B?T3ZmbjFzUFRqZm1XNXlqRFVqQmIwaVc4NmZQUmVpaE04SnpZWnYyM3g1UVd2?=
 =?utf-8?B?TU9iOXJ3YWN6emIwUHNrVnpHSWJ0QWtvUUs4R0d6NFJNbUZGNFhQNmliZmE0?=
 =?utf-8?B?Vk9nTXJ1U2paRGp0SHNtaUhGb3puRnN0SnJiQzdOWmF5Vk0rRXF3YzZHT0lR?=
 =?utf-8?B?c3lPQ0FpL2FxU1Y3NWxpSnFFQkVGcFZuc0ljZkQrbXlIbnRNbENrWWtaZHZ5?=
 =?utf-8?B?T1hlVGtOdHoxY1h5bWhPamcvRHB3WEpBY1lRQlVIL1lPUWxqRHNVZ1Z1MDFj?=
 =?utf-8?B?TjVYOVVBajFZWWt2Vnlva1o4ZUd5UDVvYXIrYTNQa05aQ0VKVityaWNoZVAz?=
 =?utf-8?B?bnZ4WUZWWHd3bHMzenpCa0t6MUZvcU1EU3pjQXVMaC9GdDNPRHRxK0hQTFUx?=
 =?utf-8?B?Y21DZ3ZoY2JmM0RDN0dQOVdpenhhTzd4Wm1qZEd2NTl4RFN6Znh1eGRNOTBJ?=
 =?utf-8?B?TFdwcWVTVGd1cUIzanhNc2ZlcnhhZ0FRcXZhUVU3MzFRU242TVp2WXBzMktW?=
 =?utf-8?B?WmEycWcxaEMzSXVaTmJpc1FMWWw0TGk1cG1LczRMMXRjeGlDR3gxUjFTWjZP?=
 =?utf-8?B?SE92NjgrNWNiYnBtTTFIcmoralEvOGN6OXJ3Yi94V05qZ0I2bHNaNHM3R0Zu?=
 =?utf-8?B?ZGFrcy9sSU0wbkYxYXFNQUpaQ2lRTDd4VEVoVUZoeVZhSVdBUnJCektibE10?=
 =?utf-8?B?cFZhREJVODJxUlNtRUlZaUxvSFRwMnZSOFE0M0RYdUNibVdsTnBBdXh4UEhx?=
 =?utf-8?B?Nk5pelR0NFlpYWZlbjdVS0xSa3pscjFJRC8yZytIWjAvSTFUVWY3MWg3VEg1?=
 =?utf-8?B?dmRicStmcVFPQ0xCcUkxK0lITExjeHU3eVpNVjJsQnFtKzIwOEpmNHUxWU5O?=
 =?utf-8?B?TzhzRjVodUVNQzFDNGJ1NTV6SlZqb2g1bHV0dEFEWnppa3cwSlNEVElCTFNo?=
 =?utf-8?B?NkhjaFZMOGxlb29XdnNtMXdQTEROUFdnYVJWbjdMejB1SFUrS3NMVDBjb3BO?=
 =?utf-8?B?cGN2cTREVHJTQW1ScEJXcVdnbW9HY0dhOU1VTWhUcS9JSUJzWm93cFNtd254?=
 =?utf-8?B?QjNuNHg2bXRTNWkyQThOZS9HOElvbEdmVURZempCSFJEUzV3cHJJNFc3TElo?=
 =?utf-8?B?TUFSWUNRbXJnNkZ2U0tHOVdyQmJIRzI2MEZuaGFXaGMzMW9PaTVSSUVNTlht?=
 =?utf-8?B?R2NYR2NiVS9uTDNZNkVlcmtrdXZXMXUzalJCUGo3c2h6NzBOSGtxd3B3UUtw?=
 =?utf-8?B?N1hoUU5UeDBrSE9ESUlSQklBdjFqci9YdjRiSThPYlorTC9DOXFFSmVmY01H?=
 =?utf-8?B?S2VIS3BnLzUwc1hzSGJXZFUxbVc1MUpWc0Y2ZG9HSTJUakpQNGMzSFJIOCtq?=
 =?utf-8?B?aWc2eC85UWY2OXZIb0tFOGF6bC9NdThDSW5ZZHFmSDVwWkQyandvcFNtN0Fv?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b1c4187c-c2de-4c3c-2af0-08ddb4812324
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 07:14:49.1504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1KY1UZw8ioE/eIeEwDEG/iKxHxBTaJYEnE8NGl7kjlHjQAXpsXJYUK8Rs+ikxktFUrwJr0AoNZphu1UNXQGWw78zPTgTR+5pq7ocTs8J2+0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB8827
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

In future platforms, we will need to represent the device and tile
VRAM regions in a more dynamic way, so let's abandon the static
allocation of these structures and start use a dynamic allocation.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
---
 drivers/gpu/drm/xe/display/xe_fb_pin.c        |  2 +-
 drivers/gpu/drm/xe/display/xe_plane_initial.c |  2 +-
 drivers/gpu/drm/xe/xe_assert.h                |  4 +-
 drivers/gpu/drm/xe/xe_device.c                | 19 ++++++
 drivers/gpu/drm/xe/xe_device_types.h          |  6 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    |  2 +-
 drivers/gpu/drm/xe/xe_migrate.c               | 18 +++---
 drivers/gpu/drm/xe/xe_pci.c                   |  6 ++
 drivers/gpu/drm/xe/xe_query.c                 |  2 +-
 drivers/gpu/drm/xe/xe_svm.c                   | 17 ++---
 drivers/gpu/drm/xe/xe_tile.c                  | 33 +++++++++-
 drivers/gpu/drm/xe/xe_tile.h                  |  2 +
 drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c        |  6 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |  4 +-
 drivers/gpu/drm/xe/xe_vram.c                  | 64 ++++++++++---------
 15 files changed, 122 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/xe/display/xe_fb_pin.c b/drivers/gpu/drm/xe/display/xe_fb_pin.c
index 5e846f0bec21..dc8547640d44 100644
--- a/drivers/gpu/drm/xe/display/xe_fb_pin.c
+++ b/drivers/gpu/drm/xe/display/xe_fb_pin.c
@@ -297,7 +297,7 @@ static struct i915_vma *__xe_pin_fb_vma(const struct intel_framebuffer *fb,
 		 * accessible.  This is important on small-bar systems where
 		 * only some subset of VRAM is CPU accessible.
 		 */
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size) {
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size) {
 			ret = -EINVAL;
 			goto err;
 		}
diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/drm/xe/display/xe_plane_initial.c
index b2ede3af9345..97b58c0ff39a 100644
--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
@@ -103,7 +103,7 @@ initial_plane_bo(struct xe_device *xe,
 		 * We don't currently expect this to ever be placed in the
 		 * stolen portion.
 		 */
-		if (phys_base >= tile0->mem.vram.usable_size) {
+		if (phys_base >= tile0->mem.vram->usable_size) {
 			drm_err(&xe->drm,
 				"Initial plane programming using invalid range, phys_base=%pa\n",
 				&phys_base);
diff --git a/drivers/gpu/drm/xe/xe_assert.h b/drivers/gpu/drm/xe/xe_assert.h
index 68fe70ce2be3..da357dd42546 100644
--- a/drivers/gpu/drm/xe/xe_assert.h
+++ b/drivers/gpu/drm/xe/xe_assert.h
@@ -145,7 +145,9 @@
 	const struct xe_tile *__tile = (tile);							\
 	char __buf[10] __maybe_unused;								\
 	xe_assert_msg(tile_to_xe(__tile), condition, "tile: %u VRAM %s\n" msg,			\
-		      __tile->id, ({ string_get_size(__tile->mem.vram.actual_physical_size, 1,	\
+		      __tile->id, ({ string_get_size(__tile->mem.vram ?				\
+						     __tile->mem.vram->actual_physical_size :	\
+						     0, 1,					\
 				     STRING_UNITS_2, __buf, sizeof(__buf)); __buf; }), ## arg);	\
 })
 
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index cd17c1354ab3..86f8ca6a96e9 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -686,6 +686,21 @@ static void sriov_update_device_info(struct xe_device *xe)
 	}
 }
 
+static int xe_device_vram_alloc(struct xe_device *xe)
+{
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	xe->mem.vram = vram;
+	return 0;
+}
+
 /**
  * xe_device_probe_early: Device early probe
  * @xe: xe device instance
@@ -730,6 +745,10 @@ int xe_device_probe_early(struct xe_device *xe)
 
 	xe->wedged.mode = xe_modparam.wedged_mode;
 
+	err = xe_device_vram_alloc(xe);
+	if (err)
+		return err;
+
 	return 0;
 }
 ALLOW_ERROR_INJECTION(xe_device_probe_early, ERRNO); /* See xe_pci_probe() */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 6aca4b1a2824..a7bcda67d05f 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -74,6 +74,8 @@ struct xe_pxp;
  * device, such as HBM memory or CXL extension memory.
  */
 struct xe_vram_region {
+	/** @tile: Backpointer to tile */
+	struct xe_tile *tile;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -213,7 +215,7 @@ struct xe_tile {
 		 * Although VRAM is associated with a specific tile, it can
 		 * still be accessed by all tiles' GTs.
 		 */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 
 		/** @mem.ggtt: Global graphics translation table */
 		struct xe_ggtt *ggtt;
@@ -394,7 +396,7 @@ struct xe_device {
 	/** @mem: memory info for device */
 	struct {
 		/** @mem.vram: VRAM info for device */
-		struct xe_vram_region vram;
+		struct xe_vram_region *vram;
 		/** @mem.sys_mgr: system TTM manager */
 		struct ttm_resource_manager sys_mgr;
 		/** @mem.sys_mgr: system memory shrinker. */
diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
index 3556c41c041b..a33a6f3a6731 100644
--- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
+++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
@@ -1574,7 +1574,7 @@ static u64 pf_query_free_lmem(struct xe_gt *gt)
 {
 	struct xe_tile *tile = gt->tile;
 
-	return xe_ttm_vram_get_avail(&tile->mem.vram.ttm.manager);
+	return xe_ttm_vram_get_avail(&tile->mem.vram->ttm.manager);
 }
 
 static u64 pf_query_max_lmem(struct xe_gt *gt)
diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
index 8f8e9fdfb2a8..c0bd23aaaa23 100644
--- a/drivers/gpu/drm/xe/xe_migrate.c
+++ b/drivers/gpu/drm/xe/xe_migrate.c
@@ -130,9 +130,9 @@ static u64 xe_migrate_vram_ofs(struct xe_device *xe, u64 addr, bool is_comp_pte)
 	u64 identity_offset = IDENTITY_OFFSET;
 
 	if (GRAPHICS_VER(xe) >= 20 && is_comp_pte)
-		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+		identity_offset += DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 
-	addr -= xe->mem.vram.dpa_base;
+	addr -= xe->mem.vram->dpa_base;
 	return addr + (identity_offset << xe_pt_shift(2));
 }
 
@@ -142,22 +142,22 @@ static void xe_migrate_program_identity(struct xe_device *xe, struct xe_vm *vm,
 	u64 pos, ofs, flags;
 	u64 entry;
 	/* XXX: Unclear if this should be usable_size? */
-	u64 vram_limit =  xe->mem.vram.actual_physical_size +
-		xe->mem.vram.dpa_base;
+	u64 vram_limit = xe->mem.vram->actual_physical_size +
+		xe->mem.vram->dpa_base;
 	u32 level = 2;
 
 	ofs = map_ofs + XE_PAGE_SIZE * level + vram_offset * 8;
 	flags = vm->pt_ops->pte_encode_addr(xe, 0, pat_index, level,
 					    true, 0);
 
-	xe_assert(xe, IS_ALIGNED(xe->mem.vram.usable_size, SZ_2M));
+	xe_assert(xe, IS_ALIGNED(xe->mem.vram->usable_size, SZ_2M));
 
 	/*
 	 * Use 1GB pages when possible, last chunk always use 2M
 	 * pages as mixing reserved memory (stolen, WOCPM) with a single
 	 * mapping is not allowed on certain platforms.
 	 */
-	for (pos = xe->mem.vram.dpa_base; pos < vram_limit;
+	for (pos = xe->mem.vram->dpa_base; pos < vram_limit;
 	     pos += SZ_1G, ofs += 8) {
 		if (pos + SZ_1G >= vram_limit) {
 			entry = vm->pt_ops->pde_encode_bo(bo, pt_2m_ofs,
@@ -310,7 +310,7 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 
 		xe_migrate_program_identity(xe, vm, bo, map_ofs, IDENTITY_OFFSET,
 					    pat_index, pt30_ofs);
-		xe_assert(xe, xe->mem.vram.actual_physical_size <=
+		xe_assert(xe, xe->mem.vram->actual_physical_size <=
 					(MAX_NUM_PTE - IDENTITY_OFFSET) * SZ_1G);
 
 		/*
@@ -320,10 +320,10 @@ static int xe_migrate_prepare_vm(struct xe_tile *tile, struct xe_migrate *m,
 		if (GRAPHICS_VER(xe) >= 20 && xe_device_has_flat_ccs(xe)) {
 			u16 comp_pat_index = xe->pat.idx[XE_CACHE_NONE_COMPRESSION];
 			u64 vram_offset = IDENTITY_OFFSET +
-				DIV_ROUND_UP_ULL(xe->mem.vram.actual_physical_size, SZ_1G);
+				DIV_ROUND_UP_ULL(xe->mem.vram->actual_physical_size, SZ_1G);
 			u64 pt31_ofs = bo->size - XE_PAGE_SIZE;
 
-			xe_assert(xe, xe->mem.vram.actual_physical_size <= (MAX_NUM_PTE -
+			xe_assert(xe, xe->mem.vram->actual_physical_size <= (MAX_NUM_PTE -
 						IDENTITY_OFFSET - IDENTITY_OFFSET / 2) * SZ_1G);
 			xe_migrate_program_identity(xe, vm, bo, map_ofs, vram_offset,
 						    comp_pat_index, pt31_ofs);
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 824461c31288..90494f16d3d8 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -714,12 +714,18 @@ static int xe_info_init(struct xe_device *xe,
 	 * All of these together determine the overall GT count.
 	 */
 	for_each_tile(tile, xe, id) {
+		int err;
+
 		gt = tile->primary_gt;
 		gt->info.id = xe->info.gt_count++;
 		gt->info.type = XE_GT_TYPE_MAIN;
 		gt->info.has_indirect_ring_state = graphics_desc->has_indirect_ring_state;
 		gt->info.engine_mask = graphics_desc->hw_engine_mask;
 
+		err = xe_tile_alloc_vram(tile);
+		if (err)
+			return err;
+
 		if (MEDIA_VER(xe) < 13 && media_desc)
 			gt->info.engine_mask |= media_desc->hw_engine_mask;
 
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index e8e1743dcb1e..ba9b7482605c 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -337,7 +337,7 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
 	config->num_params = num_params;
 	config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] =
 		xe->info.devid | (xe->info.revid << 16);
-	if (xe_device_get_root_tile(xe)->mem.vram.usable_size)
+	if (xe->mem.vram)
 		config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
 			DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM;
 	if (xe->info.has_usm && IS_ENABLED(CONFIG_DRM_XE_GPUSVM))
diff --git a/drivers/gpu/drm/xe/xe_svm.c b/drivers/gpu/drm/xe/xe_svm.c
index 26418e9bdff0..98d79c118e45 100644
--- a/drivers/gpu/drm/xe/xe_svm.c
+++ b/drivers/gpu/drm/xe/xe_svm.c
@@ -302,16 +302,11 @@ static struct xe_vram_region *page_to_vr(struct page *page)
 	return container_of(page_pgmap(page), struct xe_vram_region, pagemap);
 }
 
-static struct xe_tile *vr_to_tile(struct xe_vram_region *vr)
-{
-	return container_of(vr, struct xe_tile, mem.vram);
-}
-
 static u64 xe_vram_region_page_to_dpa(struct xe_vram_region *vr,
 				      struct page *page)
 {
 	u64 dpa;
-	struct xe_tile *tile = vr_to_tile(vr);
+	struct xe_tile *tile = vr->tile;
 	u64 pfn = page_to_pfn(page);
 	u64 offset;
 
@@ -366,7 +361,7 @@ static int xe_svm_copy(struct page **pages, dma_addr_t *dma_addr,
 
 		if (!vr && spage) {
 			vr = page_to_vr(spage);
-			tile = vr_to_tile(vr);
+			tile = vr->tile;
 		}
 		XE_WARN_ON(spage && page_to_vr(spage) != vr);
 
@@ -502,7 +497,7 @@ static u64 block_offset_to_pfn(struct xe_vram_region *vr, u64 offset)
 
 static struct drm_buddy *tile_to_buddy(struct xe_tile *tile)
 {
-	return &tile->mem.vram.ttm.mm;
+	return &tile->mem.vram->ttm.mm;
 }
 
 static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocation,
@@ -516,7 +511,7 @@ static int xe_svm_populate_devmem_pfn(struct drm_gpusvm_devmem *devmem_allocatio
 
 	list_for_each_entry(block, blocks, link) {
 		struct xe_vram_region *vr = block->private;
-		struct xe_tile *tile = vr_to_tile(vr);
+		struct xe_tile *tile = vr->tile;
 		struct drm_buddy *buddy = tile_to_buddy(tile);
 		u64 block_pfn = block_offset_to_pfn(vr, drm_buddy_block_offset(block));
 		int i;
@@ -679,7 +674,7 @@ u64 xe_svm_find_vma_start(struct xe_vm *vm, u64 start, u64 end, struct xe_vma *v
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 static struct xe_vram_region *tile_to_vr(struct xe_tile *tile)
 {
-	return &tile->mem.vram;
+	return tile->mem.vram;
 }
 
 /**
@@ -726,7 +721,7 @@ int xe_svm_alloc_vram(struct xe_vm *vm, struct xe_tile *tile,
 	drm_gpusvm_devmem_init(&bo->devmem_allocation,
 			       vm->xe->drm.dev, mm,
 			       &gpusvm_devmem_ops,
-			       &tile->mem.vram.dpagemap,
+			       &tile->mem.vram->dpagemap,
 			       xe_svm_range_size(range));
 
 	blocks = &to_xe_ttm_vram_mgr_resource(bo->ttm.resource)->blocks;
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 672faa0b67f1..c64a4d1a5bb9 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -94,6 +94,33 @@ static int xe_tile_alloc(struct xe_tile *tile)
 	return 0;
 }
 
+/**
+ * xe_tile_alloc_vram - Perform per-tile VRAM structs allocation
+ * @tile: Tile to perform allocations for
+ *
+ * Allocates VRAM per-tile data structures using DRM-managed allocations.
+ * Does not touch the hardware.
+ *
+ * Returns -ENOMEM if allocations fail, otherwise 0.
+ */
+int xe_tile_alloc_vram(struct xe_tile *tile)
+{
+	struct xe_device *xe = tile_to_xe(tile);
+	struct xe_vram_region *vram;
+
+	if (!IS_DGFX(xe))
+		return 0;
+
+	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return -ENOMEM;
+
+	vram->tile = tile;
+	tile->mem.vram = vram;
+
+	return 0;
+}
+
 /**
  * xe_tile_init_early - Initialize the tile and primary GT
  * @tile: Tile to initialize
@@ -131,8 +158,8 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 	struct xe_device *xe = tile_to_xe(tile);
 	int err;
 
-	if (tile->mem.vram.usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram.ttm);
+	if (tile->mem.vram->usable_size) {
+		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
 		if (err)
 			return err;
 		xe->info.mem_region_mask |= BIT(tile->id) << 1;
@@ -167,7 +194,7 @@ int xe_tile_init_noalloc(struct xe_tile *tile)
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
-		xe_devm_add(tile, &tile->mem.vram);
+		xe_devm_add(tile, tile->mem.vram);
 
 	return xe_tile_sysfs_init(tile);
 }
diff --git a/drivers/gpu/drm/xe/xe_tile.h b/drivers/gpu/drm/xe/xe_tile.h
index eb939316d55b..8dd87ccb2aca 100644
--- a/drivers/gpu/drm/xe/xe_tile.h
+++ b/drivers/gpu/drm/xe/xe_tile.h
@@ -14,6 +14,8 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id);
 int xe_tile_init_noalloc(struct xe_tile *tile);
 int xe_tile_init(struct xe_tile *tile);
 
+int xe_tile_alloc_vram(struct xe_tile *tile);
+
 void xe_tile_migrate_wait(struct xe_tile *tile);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
index d9c9d2547aad..19bfc22b9706 100644
--- a/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_stolen_mgr.c
@@ -89,8 +89,8 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 	u64 tile_offset;
 	u64 tile_size;
 
-	tile_offset = tile->mem.vram.io_start - xe->mem.vram.io_start;
-	tile_size = tile->mem.vram.actual_physical_size;
+	tile_offset = tile->mem.vram->io_start - xe->mem.vram->io_start;
+	tile_size = tile->mem.vram->actual_physical_size;
 
 	/* Use DSM base address instead for stolen memory */
 	mgr->stolen_base = (xe_mmio_read64_2x32(mmio, DSMBASE) & BDSM_MASK) - tile_offset;
@@ -107,7 +107,7 @@ static s64 detect_bar2_dgfx(struct xe_device *xe, struct xe_ttm_stolen_mgr *mgr)
 
 	/* Verify usage fits in the actual resource available */
 	if (mgr->stolen_base + stolen_size <= pci_resource_len(pdev, LMEM_BAR))
-		mgr->io_base = tile->mem.vram.io_start + mgr->stolen_base;
+		mgr->io_base = tile->mem.vram->io_start + mgr->stolen_base;
 
 	/*
 	 * There may be few KB of platform dependent reserved memory at the end
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 9e375a40aee9..d9afe0e22071 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -340,7 +340,7 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = &tile->mem.vram;
+	struct xe_vram_region *vram = tile->mem.vram;
 
 	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
 				      vram->usable_size, vram->io_size,
@@ -392,7 +392,7 @@ int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 	 */
 	xe_res_first(res, offset, length, &cursor);
 	for_each_sgtable_sg((*sgt), sg, i) {
-		phys_addr_t phys = cursor.start + tile->mem.vram.io_start;
+		phys_addr_t phys = cursor.start + tile->mem.vram->io_start;
 		size_t size = min_t(u64, cursor.size, SZ_2G);
 		dma_addr_t addr;
 
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index 3a4c84e9efc6..7e3980bcb4e6 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -147,17 +147,17 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram.io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram.io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram.io_size)
+	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
+	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!xe->mem.vram->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram.dpa_base = 0;
+	xe->mem.vram->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram.mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram.io_start,
-					       xe->mem.vram.io_size);
+	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
+						xe->mem.vram->io_size);
 
 	return 0;
 }
@@ -279,10 +279,10 @@ static void vram_fini(void *arg)
 	struct xe_tile *tile;
 	int id;
 
-	xe->mem.vram.mapping = NULL;
+	xe->mem.vram->mapping = NULL;
 
 	for_each_tile(tile, xe, id)
-		tile->mem.vram.mapping = NULL;
+		tile->mem.vram->mapping = NULL;
 }
 
 /**
@@ -318,10 +318,10 @@ int xe_vram_probe(struct xe_device *xe)
 	if (err)
 		return err;
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.io_size);
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->io_size);
 
-	io_size = xe->mem.vram.io_size;
+	io_size = xe->mem.vram->io_size;
 
 	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
@@ -329,44 +329,48 @@ int xe_vram_probe(struct xe_device *xe)
 		if (err)
 			return err;
 
-		tile->mem.vram.actual_physical_size = tile_size;
-		tile->mem.vram.io_start = xe->mem.vram.io_start + tile_offset;
-		tile->mem.vram.io_size = min_t(u64, vram_size, io_size);
+		tile->mem.vram->actual_physical_size = tile_size;
+		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
+		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
 
-		if (!tile->mem.vram.io_size) {
+		if (!tile->mem.vram->io_size) {
 			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
 			return -ENODEV;
 		}
 
-		tile->mem.vram.dpa_base = xe->mem.vram.dpa_base + tile_offset;
-		tile->mem.vram.usable_size = vram_size;
-		tile->mem.vram.mapping = xe->mem.vram.mapping + tile_offset;
+		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
+		tile->mem.vram->usable_size = vram_size;
+		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
 
-		if (tile->mem.vram.io_size < tile->mem.vram.usable_size)
+		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
 			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm, "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n", id,
-			 tile->id, &tile->mem.vram.actual_physical_size, &tile->mem.vram.usable_size, &tile->mem.vram.io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n", id, tile->id,
-			 &tile->mem.vram.dpa_base, tile->mem.vram.dpa_base + (u64)tile->mem.vram.actual_physical_size,
-			 &tile->mem.vram.io_start, tile->mem.vram.io_start + (u64)tile->mem.vram.io_size);
+		drm_info(&xe->drm,
+			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+			 id, tile->id, &tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
+		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+			 id, tile->id, &tile->mem.vram->dpa_base,
+			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
+			 &tile->mem.vram->io_start,
+			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
 
 		/* calculate total size using tile size to get the correct HW sizing */
 		total_size += tile_size;
 		available_size += vram_size;
 
-		if (total_size > xe->mem.vram.io_size) {
+		if (total_size > xe->mem.vram->io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram.io_size);
+				 &total_size, &xe->mem.vram->io_size);
 		}
 
 		io_size -= min_t(u64, tile_size, io_size);
 	}
 
-	xe->mem.vram.actual_physical_size = total_size;
+	xe->mem.vram->actual_physical_size = total_size;
 
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
-		 &xe->mem.vram.actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram.io_start,
+	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
+		 &xe->mem.vram->actual_physical_size);
+	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
 		 &available_size);
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
-- 
2.34.1

