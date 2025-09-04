Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EF8CA1013
	for <intel-xe@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C66A10E27D;
	Thu,  4 Sep 2025 19:51:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="e50YR3vm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE2510E27D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Sep 2025 19:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757015489; x=1788551489;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=8TxC2EnNbdug6OPy2XKBYmfOH7kTYL1pFAoKn+2jHAU=;
 b=e50YR3vmhHNe5AOCDd1sfaQe0TCV4Pw0WZGwuQPH8VbzHiN5hiWOUp+w
 QMHi1rD3JWtx72F14LtQ4+GZkNKTnZCUAVPR4AHMN0TYj+3VT90jZAp+j
 soEKlGtYuhocEQgSIfas+y4pniuUOnmiZXMqMVkI+cNmAYRd7wmTBGdMJ
 YNBiGmbW8UdCtYbH6N+kU9ck97z5VtgAkQHrSKHZYWVd/qrEmlicq3Odn
 IPxaZbPzHLrBviMRrT7ezGxvKSBEnkbVMmikoCXsmusYT/l+AKoW67CbL
 jC2IVLA9UeVAeU4zwgdndW9lvI9C1AGr6NH9Q3MKSvFnCu41Svsdb8GD/ w==;
X-CSE-ConnectionGUID: hFNnaKMhSp2Zp0AOjXO41g==
X-CSE-MsgGUID: bVg+RTOjTPO0U8SlFJxztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11543"; a="59476875"
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="59476875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:51:29 -0700
X-CSE-ConnectionGUID: UIN2kWAJTlyJ85PXbnoBbA==
X-CSE-MsgGUID: kvIZ6K4RSh2UQVhSLEwLwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,239,1751266800"; d="scan'208";a="202824453"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2025 12:51:28 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:51:27 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 4 Sep 2025 12:51:27 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.43)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 4 Sep 2025 12:51:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pGoNevbSX+3THqWo8BznMtrFFuMFDJord0GaKw3dOmVSyQ+PCR8ySuOLGe1LcE7uTAfV0nf2clqOs+zaOmsbu/Hhx9nBU2OrwE7bb6Xr7CedoOWJEDutH0z4AxDitjIKtB6bnVyG9I/4jC3vNEDrZ0dg3zGA3O+ih4XFggEsDBgw0W9i9oNqjRTB8EYaRxNlsbTMrqZkxJTLBANLTStrpbVr55NBZ7sCRcljmdX3krHZoSAlU5CXkN4e0ufBmzUMqFPI1NpweDz3VFanIwgnKsJOm7iWHA67ITfzjIaNY1o25hzya35HOM/WZyaZ6HIqYiYg4ZLilFBUGzQWJJFsMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTLcqll9V4on7AXwZRXWopXyFskcyScvSgJ3lJkdA3U=;
 b=TvdT02BDKHQ9F9qp7sqWAm0YisryKqPtnGisObNMl3NSvbsQTLatHxSrr7zsbCG/OV4UVNb2OpM46bU3qjVDC8nf/VAMBN4RumXlIBkAdwNQRANyrb8pjhj/3nsNl8Vrstmw4FkjLE76sgIzXGGxY6n4Ha8yuFBIdoiF8s8Rj7UUVkvpz+bSuZA5BW7MEgieDYorh7ZDlF5TEFqmDaCx4kCWBrmu5dUmLqBqI81DZljXnyk7o6XLRm+Iqb7d8v3KE1QihnK8EoNn3sxYP3OWg5EH7TaeAK2FUE/qU2T0v8TzbcltW1MvSsUDyisSv8YmwumGmliKNP3tkBv049Q5TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by PH8PR11MB6802.namprd11.prod.outlook.com (2603:10b6:510:1ca::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.17; Thu, 4 Sep
 2025 19:51:25 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9073.026; Thu, 4 Sep 2025
 19:51:25 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250904185919.GB5752@mdroper-desk1.amr.corp.intel.com>
References: <20250731220143.72942-2-jonathan.cavitt@intel.com>
 <20250904185919.GB5752@mdroper-desk1.amr.corp.intel.com>
Subject: Re: [PATCH] drm/xe: Extend wa_13012615864 to additional Xe2 and Xe3
 platforms
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <saurabhg.gupta@intel.com>,
 <alex.zuo@intel.com>, <tilak.tirumalesh.tangudu@intel.com>,
 <michal.wajdeczko@intel.com>, <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
To: Jonathan Cavitt <jonathan.cavitt@intel.com>, Matt Roper
 <matthew.d.roper@intel.com>
Date: Thu, 4 Sep 2025 16:51:20 -0300
Message-ID: <175701548095.122246.4045616381403402733@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: SJ0PR03CA0369.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::14) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|PH8PR11MB6802:EE_
X-MS-Office365-Filtering-Correlation-Id: fadbc73f-9626-4bf3-2bb5-08ddebec6e29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dmxYajRIcDFJVFRUVGwveGoxTEhTa1NwNGpRYWRRcGNiK3pWTGVlNDlaS29V?=
 =?utf-8?B?dXQ5aWhrbTc4TzZzT0xnQy9wQ0pkZGVWVHBPeFYzNlJocnJuVzJlbkNTa0ZB?=
 =?utf-8?B?SFBDQ1JHTHd3TXhrVDlWaGNiVk1rUm04L3RnRWJCeFA1TWNpVDRrdzNSL3Jr?=
 =?utf-8?B?eHdqVXRZYmhSb2M4THpLMGZWV09xL09CamI5VW5Sak8yS09MOXlrQUoxdDND?=
 =?utf-8?B?R0pkKzRSeHNtUVE1REhNcktBZDcyUjA2RDFTK0RsaE5HamEvcHdsTFM5UmNP?=
 =?utf-8?B?UDhtMjNlQTlyQkZwbUJrNTJvWWhUSDBiTkhmazNONHV3aXFoWTd2dGdvS05N?=
 =?utf-8?B?aktKSU5PTzFsYmVpa0ZweGdSLzNLME5PSTBha1llY0RCOS9QOXlaN1pBSVJk?=
 =?utf-8?B?Q3FkWStCZGFrU2xWYmtGd2w2QTJtUHpPcFlIQmVtV2ZvbmFmcUVHRFVZckxM?=
 =?utf-8?B?cWgxa1QvOU10VE5OdkFYVjkzVFdOV2hDaTBJVWYrbWlPSDZXMlRXK2Q5WGJ3?=
 =?utf-8?B?Mk9CZjh1OVA4VUpLemhwVkFrT3VPUGViclV6TzVvK2N0VTVVUkNSbTRlSGJ1?=
 =?utf-8?B?WjBtRmxYNmpnb1QzNUt4SHlyNGVadGNLczVRa3d5V3dDMGZBNk5KY0tSallU?=
 =?utf-8?B?MWV5VXQ3RUUvZ2ZEaVpIUVg0S08yMzRncVdnZlJyeER6ZElJVkswVHNqSHB4?=
 =?utf-8?B?bjRjenhNN2tnSUk2R0VkNmxRcGZreW1DN1M0MUZwZU5XWERkM3pYekpkYi9S?=
 =?utf-8?B?UzJVZktaTFhWR3hRMDFjb3lreDNOZGZ6Unh5Z0xibTEzNXVaamRLanN1Mzdk?=
 =?utf-8?B?eE9qOVc3aUxPRmdTeVNGWEhEbHhMaWd1Yk0wc0lJWi9xcVpqWURDRXpXRXFn?=
 =?utf-8?B?WWRDME1JZ2ovaE5SOVFBdDhFbVJwMHlFWVNXUzYyK0NZVFNHSStkQWtlQXcr?=
 =?utf-8?B?dEpHUzc1bDFRN2orRElTMGxBZ2QzMVFGMk1vQ1RPaEVGQWJUc1BLSnRtY3Ar?=
 =?utf-8?B?b3FFUXc4TW1VOHR1YWprMVoxQUc3eWsrUXJSdHhudVFtcy82VkUvdCtsWUxq?=
 =?utf-8?B?R0tOTFZxckhWYitOYjc3c2JZRDZGSzY4TW9oaElyN3pmc2RPdmN4TWNVUHB1?=
 =?utf-8?B?YlZlYmc3S1NYdEk3SXJraEV6UEh2aytUNnl2VXhGeFRWOGxOa1AxeWFsM1Q4?=
 =?utf-8?B?bThhVnp2eWQ5b0Rucm1lUm1mckxQODIrL05kaHVYTXZOV2o3dVZUU1h6dmha?=
 =?utf-8?B?ODNNTmp5OWw4bWlNM3pVUjk3SUxiT0J2c1FPQzh6QUl3Sk9wKzlmMDgyMmNF?=
 =?utf-8?B?cEt4c2s2cFVvcFlzbHhvYmlSMnpSVThvTUxKV0p1VksreVNiRzRIZEd2c2xi?=
 =?utf-8?B?a3phOFVmM0QvMmVneHQ5TFlBWjc4cERlUDc0UEJRMVlwaG1OZTVNTmE2SEZB?=
 =?utf-8?B?cGw1b2xFeTNSZlFtUXlTMDFoL1AyclBjSXAxbUNRUEluVDVyRC9kVUJtNkhW?=
 =?utf-8?B?TkRyUEFvNkhwLzRNRWNWcUJBMFB4dUFTcmdkcmU1ZGdMMi9TQ0FXOTRFcHRI?=
 =?utf-8?B?Zk5oem43WW1uV2dENDFWQzZPRWZRZlNFTjVvQ1FSOWNyNXpFN1g5QndNTDZB?=
 =?utf-8?B?YXI4WTE3WGYrYUN2VVJtQWNGaVltOVZJQmk2MEQwSFB4aUFRWjZuSDIrSEkx?=
 =?utf-8?B?WW1Yd0tVV0cwYldmLzNBOVVqbWtrWEZjclNEMkZ0Z0g4U2lFRGg1OWsvYTRR?=
 =?utf-8?B?ZFZPTHlhRXByYmpkaC9sUUQ1UjdBdFFPeFV3WDY0aSt0aG5TQ1F2WkxUbzh5?=
 =?utf-8?B?NElOUEZsMWswQVFUaDQrSmdtdVFnejhLWEZtNlE3eW0xVmo0STg0eUtXRGhN?=
 =?utf-8?B?d05qM3B6WGU5TG9QN0xyWjJZTDR0YWY3cGdYTWR6cmtadHc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TlJjWDhNanBYdU11anFoTTBiOEJ0WTMxdVNQZEg0S0QxK0ttRWFCd0FWWU9K?=
 =?utf-8?B?OUlISHhaMWV6VDJsSkRUb1dXM3p2ZkpmdW83ZDNLZWdrZG5IeUo3dVBYWncr?=
 =?utf-8?B?ck5ZZmZ0YzI3TTByd2xISDJKYVhJbjlmRlBpVVFtakI2RmJZeVhoSzc2UzQv?=
 =?utf-8?B?R3IwYkFVQkFrNmRyOENUUWF5OUNTNFZQYnI5QmtUd1RtSENRd3JZb3J4RU5Y?=
 =?utf-8?B?ZXlhd0daZlJFKy9hWXY2eU5meW8rMmV2UEhYRzg4TWdaRCtDa1RCZ1pqdWNR?=
 =?utf-8?B?UGYrL2xtcFZRaEJVblBNZzgyaVd2VGZNT3dHZUNZdXJwRXBkTFJjNWNJZk13?=
 =?utf-8?B?R3RDV2xEbXZnVUY2bUYydzk1ZEFUaldHYVJYWDlWQUc4M0ozU3NRQnhKR21I?=
 =?utf-8?B?bG5sMm5raDdSdDFPNGppcG1LdmpYM1FyM2NGSE9oWTZZM2F1VXRVeU04MExr?=
 =?utf-8?B?bnNwUTEyNDZtZ3pHZDVXcDQ0VU9xb0Y0T3krU1VPQVRJd0ZiSWZqRzlmMFA2?=
 =?utf-8?B?SDVDQ3JENHFQRzNwU1BOaHdUczNsMFF4b2p2K0hCOXhheEdKNUxtcHloVWF2?=
 =?utf-8?B?TFdFeHpMaHlmajVsS1pab3V1Q1ZGdHpQUnZWeGl1VEQvRjY1MEM3L2VWYkt1?=
 =?utf-8?B?bFpQaE1zOW5JTFNzL2NJZE05RVpKa2Z2OHF3SUszOWRiNDZINTZiUmgxaGky?=
 =?utf-8?B?T3JBekFKUHEvSGFxV1FDV3h0ekwzMStZMnpkMDN6WFRhRk5uOWp4MGFKckZ6?=
 =?utf-8?B?dnNnMTVlbmxrVys0aXFrQVdzcWpCeHZFY0UwRWY3ZWc4MmxpL2pua0RiR0Uz?=
 =?utf-8?B?OXNjVFdrRUVuY0thNHYwbXlhVzYreEZ1L1BuUHVRSVpYNCt2MTJkZm9XUFNE?=
 =?utf-8?B?bVQ2L0NtUFhJMElvS3JNbmVlbkpHSE03bFZ1cEdjYjJVQkh5WitGVVFtbE9B?=
 =?utf-8?B?Q3MxdzRSUkhGSXJacm5ndzRKOTRKSjJid25PMTNxajcreitXSndWY1JzY3BZ?=
 =?utf-8?B?QmNJRVUzMHVSWHRucGRDMjczY2dGeHJIZllpZzlzazZHZzR1WWh3Qzd5MXA2?=
 =?utf-8?B?K2U0WW9vdjVLK2NySWF2ZzhqSjFvZE9xVUZyaklRcHRMV3VSMXhra2tFb2E2?=
 =?utf-8?B?ZElodWs4T0JCQkYzdHlNY3lSZVc1ckNYczBhSmYxV0R4bVZjVjNrcVZRZ3Yz?=
 =?utf-8?B?Z0dDRDlkVnBhRmNjQ05xa08yUzRhbUx2UXRrUDJMUWJxSGNJN0l5KzVWRHV1?=
 =?utf-8?B?YWIyU3U0RFNaZlFzWjdmMU1jOHlPaFFjNy9VT2tXZFNlNEVwOW9wYjFHU0Fo?=
 =?utf-8?B?d3VaeFA3c1owQ3FvTGtud0l0L1dBZmxiY1FjTG12ZmF3WUlNT2RZK29nRklp?=
 =?utf-8?B?RHFLN0g0SFRqbVB2a3V6Mlo2akpwYk9uT3hLN0NWSjhsQ0ZyaHY4Vllmd0wz?=
 =?utf-8?B?dERYWElGcDRHTVFwRW9KREZxb2pjMlRMZXp3YTE5STg1SG9GS0JrNUpQOUM2?=
 =?utf-8?B?SmEyZDRqUjgyZDUxSEFlMVU4NzViWHBWV2RqNW1ZWEVBUFp0RzBOVm5vV0Nj?=
 =?utf-8?B?SnhUTXYzRHowQ0JwK29MWk4xNFNDeFlaQ0REU2FMSVNYNGJTekxNdm82c1hn?=
 =?utf-8?B?bjlCdWRGYlpwbHpYWXBVZUFvUjJCSnVtZkFmS08yWHByTkVIT29mMStnYVRO?=
 =?utf-8?B?NEEydk5xS3RsdjQ2TWc0ZnpqNlQ5VXpLTE1aOG4vRnVoMkI2Zkp4N1IvdCtB?=
 =?utf-8?B?UmN5ekxKNWVSY2dwVEIvK2ZGdC9hanZPQmhON1ZVRDdwSnpaNFJRQ0UzTEhu?=
 =?utf-8?B?bUtGc0ErdWt3Vi9HcUlPcmZjbXFKdVRxUDEyVzZrS1d3NWpwTU1PekxvZ2Nu?=
 =?utf-8?B?T0R3WDVQQVpCVmhIZFVUbDRTU2tJNzVid2VHL2lxMWpQSzMwNExnVm5hQ3FJ?=
 =?utf-8?B?VTFHODVlOXFSWEpFOXBKU1dNR2tVZTl4eW9GMXZDVjNGTitEZkREM0laOE96?=
 =?utf-8?B?NVRTUVYxcG52VU9sQ3BFbGlabG9DNzZoeGk3NVZXVEgzNkNHUE41Z0lXM2JY?=
 =?utf-8?B?SFV0SE5CcHFjRzc5VVFvK3hEOXZhREZmblhoeDNYTHV0bVlaZzlZemFDYnQx?=
 =?utf-8?B?U0NQb2lYVms1OGVGMEdnZStmNTdzc1VXNHVtVjg0R2dTcllQdnF4OEluQ0Jl?=
 =?utf-8?B?VXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fadbc73f-9626-4bf3-2bb5-08ddebec6e29
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 19:51:25.1538 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: chVcPjkcPZeeJmimO8VnolG2cYFkWS872Ryt/Ewm/+y0u2PL3tO/9RQIsLRXzwwpi061gxPZaunWL5ae4fZTRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6802
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

Quoting Matt Roper (2025-09-04 15:59:19-03:00)
>On Thu, Jul 31, 2025 at 10:01:44PM +0000, Jonathan Cavitt wrote:
>> From: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.com>
>>=20
>> Extend WA 13012615864 to Graphics Versions 20.01,20.02,20.04
>> and 30.03.
>>=20
>> Signed-off-by: Tangudu Tilak Tirumalesh <tilak.tirumalesh.tangudu@intel.=
com>
>> Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_wa.c | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
>> index 22a98600fd8f..535067e7fb0c 100644
>> --- a/drivers/gpu/drm/xe/xe_wa.c
>> +++ b/drivers/gpu/drm/xe/xe_wa.c
>> @@ -538,6 +538,11 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
>>            XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
>>            XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DI=
SABLE))
>>          },
>> +        { XE_RTP_NAME("13012615864"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION(2004),
>> +                       FUNC(xe_rtp_match_first_render_or_compute)),
>> +          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>> +        },
>> =20
>>          /* Xe2_HPG */
>> =20
>> @@ -602,6 +607,11 @@ static const struct xe_rtp_entry_sr engine_was[] =
=3D {
>>                         FUNC(xe_rtp_match_first_render_or_compute)),
>>            XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, STK_ID_RESTRICT))
>>          },
>> +        { XE_RTP_NAME("13012615864"),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>> +                       FUNC(xe_rtp_match_first_render_or_compute)),
>> +          XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>> +        },
>> =20
>>          /* Xe2_LPM */
>> =20
>> @@ -647,7 +657,8 @@ static const struct xe_rtp_entry_sr engine_was[] =3D=
 {
>>            XE_RTP_ACTIONS(SET(TDL_CHICKEN, QID_WAIT_FOR_THREAD_NOT_RUN_D=
ISABLE))
>>          },
>>          { XE_RTP_NAME("13012615864"),
>> -          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001),
>> +          XE_RTP_RULES(GRAPHICS_VERSION_RANGE(3000, 3001), OR,
>> +                       GRAPHICS_VERSION(3003),
>>                         FUNC(xe_rtp_match_first_render_or_compute)),
>
>I don't think this works.  If the graphics version matches
>(30.00/30.01), then as soon as the parser in rule_matches() hits 'OR' we
>consider the rule to evaluate to true and apply the action, even though
>you haven't checked the engine yet.
>
>I.e., what you've written here gets treated as
>
>  ( 30.00/30.01 ) OR ( 30.03 AND first_render_compute )
>
>when the proper logic for this workaround should have been
>
>  ( 30.00/30.01 OR 30.03 ) AND first_render_compute

Oops. Right. Sorry for missing that during my review!

--
Gustavo Sousa

>
>So at the moment we're probably accidentally applying this to a bunch of
>engines that we didn't intend to on 30.00/30.01 platforms.
>
>
>Since the new version is non-contiguous you can just create another
>table entry for the new 30.03 version.  At some point farther down the
>road if it turns out no platform ever shows up to use the 30.02 version
>number then we consolidate the two entries into a single entry that
>spans 30.00 - 30.03, but we're not far enough past Xe3 (or even Xe2) to
>do those kinds of consolidation yet.
>
>
>Matt
>
>>            XE_RTP_ACTIONS(SET(TDL_TSL_CHICKEN, RES_CHK_SPR_DIS))
>>          },
>> --=20
>> 2.43.0
>>=20
>
>--=20
>Matt Roper
>Graphics Software Engineer
>Linux GPU Platform Enablement
>Intel Corporation
