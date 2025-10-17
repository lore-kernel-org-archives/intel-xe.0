Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A614ACCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 15:41:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4910EC69;
	Fri, 17 Oct 2025 15:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OtdI9GYL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 987D910EC69
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 15:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760715674; x=1792251674;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=8mepiJDiNl8DOqNE/bda4S6V1ICPzeBa7oNSZ22TBYo=;
 b=OtdI9GYLpwk3/i51oHnniVeDajPG9deEeEewDHv+24fkyXhCS8Xnk1Vy
 t0Dl7cAmshz0Zcn4ddCi0+WDmShQBX4cHKMqco/3dKdoP/PwFs2NvFrSq
 xNxMVgK8OUM8MVgRBKcpYqNEGyXCtZm9WH8/xcZl2X07ZSwjbLht4iK3+
 YEo96rdAqPVU8WGYaAeAUo4/xrgjvNiFik57eqv4wpr37rGkMVFJgrZLU
 uZvLyCg4wiI85Y1XmuQgOu+8BV+mGRVFKJ/AoDj0VYaRSuCvF9wTz6LZF
 TTaLD30Xj2zkBYdpgokMR/Tkhk4qFK+YYhuZNAZUXqvo2ZWjSy0fUg0FX Q==;
X-CSE-ConnectionGUID: jxphSzCNQWSi7bS5piXw3w==
X-CSE-MsgGUID: 8H8nX+DYT7KUB6e9xWKBbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11585"; a="73601071"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="73601071"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:41:13 -0700
X-CSE-ConnectionGUID: 0QcF7P+iRMmJ3BEB74/N5g==
X-CSE-MsgGUID: 0set+mtBRt2LIdoG+tByvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="186790953"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 08:41:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:41:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 08:41:03 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.3) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 08:41:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gIRQL5qwLAi01JSJs53LABKsQo/+CV/3se05HzkUpEueYqfc2O+tDXrI+o5qthB89p8zYoS3ZBtigb9xUqbKnWKSDXsVyhsUXDSF4PV4jE+SsUl4YwraIhb/NdpITnYHiFAJZuTLg2pU+ebQUCH28GSpx1ao04g+20VedMfRZo6BkVr+8PV2DJW6zTHFAsiwbgK9NDLxF7DKJFKMElKseV4v3HTF5ZoClwj2QmL9ZLtupOFijukTfS2KiL54qZyaIKUfCM3sZoYwcRs3ahiGJLAkkbvroQHrsSur2dPRCzB6lkWhEHD6741xWcodA6GwGXuc0/t62mLXbVTiwWzavw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8Hu7pYn3wyhINrnBkB/f/O8J3RgdY5jktp+1hqpGls=;
 b=ov6FVHqXRerStnxNUXOT0J7ItsrjKkP/OeQQGyxgXZf4n9sThWJvMBlzxfUkPZ6r1RouTUdF/6TXje+xylNjDK0YC1Yy8luqosTQaojVrHUL2zkThC3zNPD5WYQQ5AR71XREMP4yAM1FKHGEYlbYsNepWWlAerH20Qb1EqPjg4ZND5OJHpD4MDVZJxRKGjPegZl73A19ANbE6dXGOsjb3svDYojtDwduicHhwFwf6mR09EjUXlEJONTr7NbW4t/Hrs4ifyvOaYnjQlwBWpxFQQjxCkkhIwaz248tI2Funw2LZLlOmar0Y4MJeCBSsOVtdIECwl5IHaoG2oIbNgvOhw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by SA1PR11MB5946.namprd11.prod.outlook.com (2603:10b6:806:23a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Fri, 17 Oct
 2025 15:41:01 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 15:41:01 +0000
Message-ID: <c6acc97c-7292-4a84-a4c7-a410350398e6@intel.com>
Date: Fri, 17 Oct 2025 17:40:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/5] drm/xe/vf: Fix GuC FW check for VF migration
 support
To: "Lis, Tomasz" <tomasz.lis@intel.com>, <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Satyanarayana K V P
 <satyanarayana.k.v.p@intel.com>
References: <20251016120511.856792-1-tomasz.lis@intel.com>
 <20251016120511.856792-3-tomasz.lis@intel.com>
 <ddf9bf4a-f7f3-4a1a-908f-2b8dd6d066da@intel.com>
 <a705eb88-0795-41b8-becb-cc41e2479785@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <a705eb88-0795-41b8-becb-cc41e2479785@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR07CA0162.eurprd07.prod.outlook.com
 (2603:10a6:802:16::49) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|SA1PR11MB5946:EE_
X-MS-Office365-Filtering-Correlation-Id: 6acf4796-3436-426a-4b89-08de0d939309
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dlQ0d2ZMc1A3R25NUkRKMkMxN2JDenRSeXNhM0tqK3V6Ty81VVJORktLRjNo?=
 =?utf-8?B?U1BjS0JpNFdLbEl3aHIwTDZPQkZwelBYNHBORUVLaXFuSUpFRHJtSjRiZFlC?=
 =?utf-8?B?VHgzelNsbkYxcUptK1hKVjN5ZGhIekZ1RTR5RzIzMmxuRzBhVGo5NG5VVE5S?=
 =?utf-8?B?MWxNV3BQR0ZNdFdUa3ZUTmh4RkNYV0RVR3FwSkF6dE5haWhYcis2UXdWVmFt?=
 =?utf-8?B?ZWtLejk0TUdQbTlqV3NCOHZOcnY5OHF2eGU5cFlkRUp2SzZhaXYyM3Vsamx2?=
 =?utf-8?B?U2JUV1ExTFloeXRnb0Y4WHlZMkF3alhHcjAwenRrOHpLWDNHaTRkbnI4NURy?=
 =?utf-8?B?NlVSNFlsczBhSlZuaTVkU1VzYWlydGxxSHdZdXF2dnVpaDllbTZzMjlrR2Jj?=
 =?utf-8?B?T1BRdGIwbGd3Mkhyb1R1cU9oUVJQSitXdkV6bXZBNGNGV2lweE9Ca2g5dHp1?=
 =?utf-8?B?cXJhTFU0VytzWS9xeU9hOE5HejFOSExLbG1WcklwVVZ4UnFLb3hKRnprcTZJ?=
 =?utf-8?B?emVlT2poM0JIOTcvQXJpQ3MrbksraDVRUGxnY3FTaXh4TDM1cGtXTG9DZUM0?=
 =?utf-8?B?dmZIeWE0cFU2b1VEczYvZ21IaDJUZVY0VmVtOXdDdWNpb3lZZE12TUN3UXFo?=
 =?utf-8?B?bmlPRExWa2tJS2JBWDZ6bEFNYlRUNTJRZG0wQUtVYnp6MWhGOTZiaFNxRVQ0?=
 =?utf-8?B?VW1MTTcyTkU1SWU4dXFEYkFhTUR6Qk54TnFCVytXM1VlMTRTQXV1YWVtMFdv?=
 =?utf-8?B?TFFYSTJTeHNveWUydVNTNzdra3hEY3d5N1VVV2hMRHdIL2dKSktEempZU1c5?=
 =?utf-8?B?ZG5KRHpSc090b2tlSkJmMWducGh1MjRlZ3pTaFl4di9KT09nRUdiOG1sNk1D?=
 =?utf-8?B?ZW1PYTJhLzdubU1xRVEybm5jY1Z5aVA0RHRHWkZtMHc4eDFIRUlVWWFoSzJW?=
 =?utf-8?B?czNsRkEybTdVSmxHbDJNYmVKbEl1VlFjYkp6VVpPRzFEZFhDVVp3WTRaSFBv?=
 =?utf-8?B?OFZLRkZJL1RKdXFRc1FWV1JQVzBiUSt6eThJUTdtNzFsSUN6SlRTYytSU3Vn?=
 =?utf-8?B?ZnY4MXpRbXFDbVlVVHZCeFMvcWN3Y2pWZENRZ1BlRFBldjZaOThIWm5ScEVZ?=
 =?utf-8?B?aEhPQkFxbXJIU1BvcWprZXloNlk5bi9kN1FUVU5XaWZ3N3NWZnB1eC9WUUpK?=
 =?utf-8?B?eFNQcVhvQUM0ay9uVUc1SzdGTVFvM2dEZXB4cGFrRmdiRnNiUElZUWd1Yk5U?=
 =?utf-8?B?MEdVelRkNGJBWjY2Q0JTSVZvdW5lczY4Z3oyTTNQODM1R3JrakRLdEVQeHMr?=
 =?utf-8?B?R3FnWi96bVZrc2pIem9DMEFtYmk0THFuRHAyNmloY21lTC9mZCtqaHJTSUc0?=
 =?utf-8?B?ZExXNjlpV20yKzZ1cVAwclVpS2RWa3VvK05NL2xyOUpKak93Kzd4bml2ZjR2?=
 =?utf-8?B?cE9waFozbHpaK1pRN0h1K0xxQmhJc0VSeXpScUphNml1cVlVK21Ycy9ZbXcr?=
 =?utf-8?B?bzRyaFE3TURqYWwyNGx1Mjc1U2ZodlZONDU2TWc4dlk2b1J2eFBOR1RwSmRz?=
 =?utf-8?B?SyszTVJ6ZVR0WTVVRVR6aVlPMTUxcWtoZTdPZHFyWmd0aUFqamVpTSsxWkg1?=
 =?utf-8?B?TWNacUdUQmN5NXFud055cjdMSnpPTUYzU2FoK3pqRlphTk5EcEJEbHJnVThY?=
 =?utf-8?B?SUVPWEJMTlIwOWphYWhaRFhzY1FoTVg3cGV5eDBFdWpieDRjQ2VHc09ldk1C?=
 =?utf-8?B?aUJieXJzQ2lIRXMyeGVpWUQxRCtiS3p3VmN6YmF4ME0vNjkrUFA5WTRaRTgr?=
 =?utf-8?B?VFRubnlybnV2MUVBOG5jclY1Znk5ajE5dFVVdWNDaFdCVnAxRE9iK0ppNjJV?=
 =?utf-8?B?ZER4M2Y4cWJMV3F2N3IrVEhZK1dCWE5CYkZDSGJlb1pPVnc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZlB4Umhrc3VLNHdHWkFsVy9NVkVlMzczYVc5bzlSTk1GYkhuMmxuOUJVRnVG?=
 =?utf-8?B?ek0rRFoybjZiY2g1T09IU2dWSHM2V2JJai96aFpOS3ZJcEQ5REJ0eG1vQTJi?=
 =?utf-8?B?UmhucHRKZXU5NHhhVjV2UXA0d2JmZkF4UElqRlkzeEhTYWZCYksyWU9jRDNt?=
 =?utf-8?B?dTVtZGFmcFlwOERpMjlNWmpKbndZZjh3UHViakRPUDhvdFI3UXI2Q1ZwTkxM?=
 =?utf-8?B?T0dEVTl2MUMzOFQ4SlVTKzNEOU4yUXM5S2NvL0pTMUR4K2swbEdpVXgrK3Iy?=
 =?utf-8?B?UU85OUhQRlBwMUNJSDd4eXlMNW04d3RsR1Rqa1NsSUxNQUsxMFdBaTRVY2li?=
 =?utf-8?B?STRFbmZaUmxxOFc1RldNL3hkQnU5dHY1a2lZQitVMGZ4ZnRaNkIzV0tDNW9m?=
 =?utf-8?B?Sk5rSEd2azRJZkxCV3REK2V5dDRyeEYzRjVUMSsrN0ZlbElNUkVlMldSNTVP?=
 =?utf-8?B?Y09vVTRLcVF3KzEwU2J0YUU0V2hQaXg4S21jZko4Z1lBZy9BL3VTTGhyZFZ0?=
 =?utf-8?B?eVNXTnBrR2dEMUhiU2F3RGZwdFNOa0p3NldYN011aVFwVUF6MCtRRHNmWkVC?=
 =?utf-8?B?ZEhOQ01YcGtJMUlFTGZxRzJrR1E3c3lHVk4rNnE3ZWZ6RGVwNU1WemszU01h?=
 =?utf-8?B?VzlJWmh2Sk9mZHdxZmVlSDBManArNUduU3M1K0I1RHA4cmJIVTh2UXFNQU0v?=
 =?utf-8?B?cjcxaml1OFQzYUY4T2ZvNm5jZHRSUWNyZGhNZG0va0xkV0V1MW10aC93RlE4?=
 =?utf-8?B?RTVIWG1QVEZHYjh4ZnlzODhCT29ZbkNwTm1tMWJXbVpOZFV1bGJpTzhrWDEw?=
 =?utf-8?B?bUlxTUIyK2tuanFtQjEyQk9pYnR3cHdLbGVPMUo2MTJ0dkNmaVdDa1ltd1RH?=
 =?utf-8?B?ZDZuTG1xdlVxUUVaY1plMittTGQ4c3lqeGtPOEpTdTVydDFmbnhrVStYaExn?=
 =?utf-8?B?NEZJR2Nsb1BhQ2JzcE5XdjNqK1BOWE1pbDNEZVZIWUpSNmk1RHNvN1hYTEZL?=
 =?utf-8?B?eXZjM0dkL0xtckV4dVNjUUN6OW1KRWZQNnFYOTBtb0pWbDNrQWxLSnNCSFVI?=
 =?utf-8?B?L215MkRHazZRU3RIbjFnSXBLNUtaY0JyZFhQS3g5N0tSYzdzMXIzMWtrcTdX?=
 =?utf-8?B?dlFYYTE0SzRuYlNrWHFtN0sxeUlublNVd2h3eEgrTlVZNzQzS3FHRGFOL0dL?=
 =?utf-8?B?MDBZVlA3QXZsL2xKd3FxZVdRNThPMjd5NEJBL3FRRy9JRXNoOHlYOUErSzc2?=
 =?utf-8?B?MHFFM1JmVktvY01UdlN4VGFtL01wSnc3MGNlYURKUVNqV0JlbUQyZEZ4S3Jq?=
 =?utf-8?B?dnR1RmZSWExFc3ZLNnBXQkt5UzVFWTNjK3BweUZGWmZ2OFVxT0l3UG1XTkp4?=
 =?utf-8?B?dzV4NWh6YnJQRDRtNnNtN1paNlZoUkZsNjFDMUQwNG94dGxtL3JmSHhiMHgw?=
 =?utf-8?B?UEF5VEJMUmJlckU4ZURGQlI3Q3dTV3lGWE9ncU1lTXFFZW5WZXpKdW5NaEE2?=
 =?utf-8?B?MkxRa1dobm9IMzNTU3BnZDZtQSswYW9rbEVKd2xLUTVpd3NtbHlsQ3VUSU91?=
 =?utf-8?B?eVZacUI1eUNMR3ZwcENDd1NvbkRTaXNoMDl0SmplTWtTM2R4Ny8zRjVGakFJ?=
 =?utf-8?B?WXBMSjh1MWFsdVgzNW0rUzRDc1RQam5hVTU1cmowRjJ0a2R6Z1JqOW5YSnpI?=
 =?utf-8?B?cWo2bFREMjFhTldFK3FrWFYweUZpMVR1L0tWLzV3RHRTVXBpVUtvcVFqMmF3?=
 =?utf-8?B?OWU3RVA3a043M0x2NytpNzNVMk53eGplc2JvNWV3ZVdCY3FpL0EzZmdxOGM5?=
 =?utf-8?B?UmdaNGx0TCsxMTVVekJsNG5PYzBncnZMQmtMaUluai94N2R5aE9BL241OEtR?=
 =?utf-8?B?OXFzLzkzYVVUNHN6REVyanJNZk03dTh2ZCtGUGJjd25wM1NwdjBKc2lmcmh1?=
 =?utf-8?B?RGJWMWg4aDR1Um5JcFJFeFhUZTlMQUUwc0FSZWxWTElkMDRyeCtRdnJGd1Vs?=
 =?utf-8?B?V2hkOHNneUR5aCtoV200Y3JPR09ta29aVUxFb0Fmdk9lQ2dIYnhOK3VrRSsr?=
 =?utf-8?B?RXBNWW9kNDBBdjMyU0JrMTRIaXRQNWZ2eXlJNUJiZktibDE4VEhmWVhuckVS?=
 =?utf-8?B?K3JFL1BCR21GWkg4VExLV3NiMzlFc2tYQUNtMS9tcVF4QkFWR3ZFQVFoTEZq?=
 =?utf-8?B?OUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6acf4796-3436-426a-4b89-08de0d939309
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 15:41:01.3866 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MA+Vd3K/jPHWpeH9rufNMHi+Rfp08DyBAtfuoxnT9ptDOkJj84V5FkATu7q13oYO5NFG2UbSlH40WX0S0geThYDPClNbLTg13pBZ/eDwV6M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5946
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



On 10/17/2025 5:31 PM, Lis, Tomasz wrote:
> 
> On 10/16/2025 11:55 PM, Michal Wajdeczko wrote:
>> On 10/16/2025 2:05 PM, Tomasz Lis wrote:
>>> The check was done before GuC ABI version could be acquired.
>>> Comparing only to zeros provides very stable results, though
>>> not the ones expected.
>> instead of above sentence, better say that this was triggering:
>>
>> <4> [174.830604] xe 0000:00:02.1: [drm] Assertion `gt->sriov.vf.guc_version.major` failed!
>> ...
> ok.
>>> This change dislodged part of the VF migration support check
>>> and moved it to after GuC handshake.
>> and describe your changes in imperative mood
>>
>> [1] https://docs.kernel.org/process/submitting-patches.html#describe-your-changes
> will do.
>>> v2: Use xe_sriov_vf_ccs_migration_bb_needed()
>> you can keep change log under ---
> ack.
>>> Tested-by: Matthew Brost <matthew.brost@intel.com>
>> I guess above was true for # rev1
> ack.
>>> Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/6349
>>> Fixes: be5590c384f3 ("drm/xe/vf: Enable CCS save/restore only on supported GUC versions")
>>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>>> ---
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c | 41 +++++++++++++++++++++++++++++
>>>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h |  1 +
>>>  drivers/gpu/drm/xe/xe_guc.c         |  2 ++
>>>  drivers/gpu/drm/xe/xe_sriov_vf.c    | 10 -------
>>>  4 files changed, 44 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> index 46518e629ba3..34c68de6e2f3 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>>> @@ -314,6 +314,47 @@ static int guc_action_vf_notify_resfix_done(struct xe_guc *guc)
>>>  	return ret > 0 ? -EPROTO : ret;
>>>  }
>>>  
>>> +static void vf_disable_migration(struct xe_gt *gt, const char *fmt, ...)
>>> +{
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> +	struct va_format vaf;
>>> +	va_list va_args;
>>> +
>>> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
>>> +
>>> +	va_start(va_args, fmt);
>>> +	vaf.fmt = fmt;
>>> +	vaf.va  = &va_args;
>>> +	xe_gt_sriov_notice(gt, "migration disabled: %pV\n", &vaf);
>>> +	va_end(va_args);
>>> +
>>> +	xe->sriov.vf.migration.enabled = false;
>> this looks like a layer violation
>>
>> and we already have a function that wraps that at the device level
>>
>> maybe just promote device-level vf_disable_migration(xe,...) from xe_sriov_vf.c
>> and call it from this gt-level place ?
>>
>> hmm, but see below [2]
>>
>>> +}
>>> +
>>> +/**
>>> + * xe_gt_sriov_vf_guc_check_migration_support - Check for disable migration due to GuC.
>>> + * @gt: the &xe_gt struct instance linked to target GuC
>>> + *
>>> + * Performs late disable of VF migration feature in case GuC FW cannot support it.
>>> + */
>>> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt)
>>> +{
>>> +	struct xe_device *xe = gt_to_xe(gt);
>>> +
>>> +	if (!xe_sriov_vf_migration_supported(xe))
>>> +		return;
>>> +
>>> +	if (xe_sriov_vf_ccs_migration_bb_needed(xe)) {
>>> +		struct xe_uc_fw_version guc_version;
>>> +
>>> +		xe_gt_sriov_vf_guc_versions(gt, NULL, &guc_version);
>>> +		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>>> +			return vf_disable_migration(gt,
>>> +				"CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>>> +				guc_version.major, guc_version.minor);
>> since we split migration checks from one place,
>> this CCS GuC ABI condition shall be placed in sriov_vf_ccs.c subcomponent
> will move.
>>> +	}
>>> +}
>>> +
>>>  /**
>>>   * vf_notify_resfix_done - Notify GuC about resource fixups apply completed.
>>>   * @gt: the &xe_gt struct instance linked to target GuC
>>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> index af40276790fa..60a3b9b05b20 100644
>>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>>> @@ -26,6 +26,7 @@ void xe_gt_sriov_vf_migrated_event_handler(struct xe_gt *gt);
>>>  int xe_gt_sriov_vf_init_early(struct xe_gt *gt);
>>>  int xe_gt_sriov_vf_init(struct xe_gt *gt);
>>>  bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt);
>>> +void xe_gt_sriov_vf_guc_check_migration_support(struct xe_gt *gt);
>>>  
>>>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>>>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
>>> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
>>> index d94490979adc..3c4e64233b3a 100644
>>> --- a/drivers/gpu/drm/xe/xe_guc.c
>>> +++ b/drivers/gpu/drm/xe/xe_guc.c
>>> @@ -713,6 +713,8 @@ static int vf_guc_init_noalloc(struct xe_guc *guc)
>>>  	if (err)
>>>  		return err;
>>>  
>>> +	xe_gt_sriov_vf_guc_check_migration_support(gt);
>>> +
>> [2] so this is now going through these layers:
>>
>> guc_vf    vf_guc_init_noalloc
>> gt_vf       xe_gt_sriov_vf_guc_check_migration_support
>> xe_vf         xe_sriov_vf_migration_supported
>> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
>> gt_vf         xe_gt_sriov_vf_guc_versions
>> gt_vf         vf_disable_migration
>> xe_vf           xe->sriov.vf.migration.enabled
>>
>> so maybe better leave this VF GuC init as-is and just make "late" checks
>> in xe_device_probe either in xe_sriov_init_late
>>
>> xe        xe_sriov_init_late
>> xe_vf       xe_sriov_vf_init_late
>> xe_vf         xe_sriov_vf_migration_supported
>> xe_vf_ccs     xe_sriov_vf_ccs_init_late
>> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
>> gt_vf           xe_gt_sriov_vf_guc_versions
>> xe_vf         vf_disable_migration
>>
>> or after for_each_gt/xe_gt_init_early loop
>>
>> xe        xe_device_probe
>> xe_vf       xe_sriov_vf_check_migration
>> xe_vf         xe_sriov_vf_migration_supported
>> xe_vf_ccs     xe_sriov_vf_ccs_init_late
>> xe_vf_ccs     xe_sriov_vf_ccs_migration_bb_needed
>> gt_vf           xe_gt_sriov_vf_guc_versions
>> xe_vf         vf_disable_migration
>>
>> or just make it as part of the xe_sriov_vf_ccs_init()
>> since before that point CCS migration is not working either
> 
> The check can be done later than where I put it; but it needs to be before IRQs are enabled. Both kinds of these are enabled in `xe_gt_init()`:
> 
> MEMIRQs in gt_init_with_gt_forcewake->xe_uc_init->xe_guc_enable_communication
> 
> MMIO IRQs in gt_init_with_gt_forcewake->xe_irq_enable_hwe
> 
> 
> The `xe_sriov_vf_ccs_init` is currently called after `xe_gt_init`. I'm not completely sure if this is correct placement .. it might be, if there are no CCS metadata set at that point.
> 
> GuC should have no problem assisting to migration without CCS metadata transfer, so that placement could be ok.
> 
> But that's definitely too late for figuring out whether we support migration at all.
> 
> So this eliminates the `xe_sriov_vf_init_late` and `xe_sriov_vf_ccs_init` options.
> 
> For the 2nd option - this can be done. But does it really make sense to put a single-platform workaround check directly in `xe_device_probe`?
> 
> I can do this - if you consider this option acceptable. Though personally I see no reason for trying to rip it out of `xe_gt_init_early`. It can be easily turned from per-gt check to single GT check (by checking only the primary GuC which will actually be responsible for scheduling the CCS save/restore BB execution), but that gives an option rather than a reason.
> 
> Any place between `xe_gt_init_early()` and `xe_gt_init()` is ok for me.
> 

on second thought, shouldn't we make GuC ABI check on the PF instead ?
then on the VF we could assume that minimal GuC ABI version is guaranteed 
and just have simple assert near the H2G that we expect to be available ?

> 
>>>  	err = xe_gt_sriov_vf_query_config(gt);
>>>  	if (err)
>>>  		return err;
>>> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf.c b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> index 911d5720917b..5fb042c05112 100644
>>> --- a/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> +++ b/drivers/gpu/drm/xe/xe_sriov_vf.c
>>> @@ -163,16 +163,6 @@ static void vf_migration_init_early(struct xe_device *xe)
>>>  		return vf_disable_migration(xe, "requires gfx version >= 20, but only %u found",
>>>  					    GRAPHICS_VER(xe));
>>>  
>>> -	if (!IS_DGFX(xe)) {
>>> -		struct xe_uc_fw_version guc_version;
>>> -
>>> -		xe_gt_sriov_vf_guc_versions(xe_device_get_gt(xe, 0), NULL, &guc_version);
>>> -		if (MAKE_GUC_VER_STRUCT(guc_version) < MAKE_GUC_VER(1, 23, 0))
>>> -			return vf_disable_migration(xe,
>>> -						    "CCS migration requires GuC ABI >= 1.23 but only %u.%u found",
>>> -						    guc_version.major, guc_version.minor);
>>> -	}
>>> -
>>>  	xe->sriov.vf.migration.enabled = true;
>>>  	xe_sriov_dbg(xe, "migration support enabled\n");
>> this would be non-reliable, as we might still disable migration later on
>>
>> so we should either remove it completely (assuming its "enabled" until explicitly disabled)
>> or reverse the logic and use this flag instead:
>>
>> 	xe->sriov.vf.migration.disabled
> 
> will remove, it doesn't make sense here.
> 
> -Tomasz
> 
>>>  }

