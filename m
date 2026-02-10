Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E9CEB2711
	for <intel-xe@archiver.kernel.org>; Tue, 10 Feb 2026 20:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82CBC89128;
	Tue, 10 Feb 2026 20:12:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iUZQMozn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A73710E092
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Feb 2026 20:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770754334; x=1802290334;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HRacQTfhG+eiInGAvJQn5dCIhvRfkCOg5eGv9ADjzRI=;
 b=iUZQMoznjh4vZHVf7cd8aFo8zxzfhadDOQRK6x/QYuFsruOFfNUUlfal
 6EPdVDRAncL8rsdNcT22W9dJ24I0PzQ0IE6aE/5jH2pUIxTufMnx/z9VP
 t0VGGVglm8ign0IZ4FTSsFRM8G6+ZoLFO4iXDZm7rfswpkVfwNem4sYSH
 lYJN/J2I63vpgGPZ5YeKmcPutodrXD1YqW4suGbPrHRnSoz2xJAqS7qZE
 oj0fMaFr6xUC4P/FFuRdHMStRqGWQIUPfeAqh8aaGb3G/u/MIOw/f5vEH
 6ha0yga56Aa6owFKuUhwvSmj0WY309pk4xF+k4MjuF+4ECUR7VDhTs2bz A==;
X-CSE-ConnectionGUID: mAalYrO1THaTJSmlPfT2gA==
X-CSE-MsgGUID: gTMX71emSx6rtD2ponGDDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="94536763"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="94536763"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:11:58 -0800
X-CSE-ConnectionGUID: LZAwIff0QUyYYsgrLu3wFQ==
X-CSE-MsgGUID: x7KQc7kgRhSvlzxMPgoRKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; d="scan'208";a="216186163"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2026 12:11:58 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:11:57 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 12:11:57 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.34) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 12:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qelx3Pobm9KYwKJxqegRFSpWQXNYivZwzJCLs2jdr8XnxNszhaMVsXZ+02QPBsKRI/seU+HDZmvfexkGH2iRW569R/gf6a7g65293mWurQ2+z4uj5b2XQn7ojkkYGowMmyKdN+fY1JxoZeGz1o+dDVUVHV8VVgY6jEyY1GjJfVGaRO8yfYJC7jTtBN37jizeGH1GlYtug8TpaplMezZPlqSE/ezPXVTLCjzo1e7dVpCbP1Hl5x4qLtI0bmSnK4zwTIt2Gi6Dq48xpgNF1KA4WGfEITKuZO1AzFooC9DJXu3Xyb9cUc4VXyWlWjFGQkToA799YOnXS3PJsscQc7G7FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeN57rC14Z9Vvh5/XysQqKxuBVazzv9FuxSnluukxAs=;
 b=nZQ9M0LGEwgoU2WGpQZrX3dZN30DeEvXxJTOdqLWBvihUdmrsW1tQI4z4WVdlnC3fB36jLEGiklk8MIqGldgAoKyKezy9HvIXcOg88YJxkq9b+6IFV8eDgJ8phAU1zG9UcyIBYwHLnDpnXwmPXk0hUH0RL8mpeh+FAeWlZAkVda0cJVvXuvxopamj6ExyID71WD1Vh83lGva7LFTUlAE8GF/oYz0oTTxYtYDe0ZdCf+cROEhw/2Dqpwyp0wYuyjela2NJq35lWMPZzUKmdoL/oE6t5lKtuyggUY1deVPT+rJUPJR0DPKcpp0JOnB/o4iMPAdL/fw7l/pYWHN13MjtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA3PR11MB9226.namprd11.prod.outlook.com (2603:10b6:208:574::13)
 by SA2PR11MB5212.namprd11.prod.outlook.com (2603:10b6:806:114::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Tue, 10 Feb
 2026 20:11:55 +0000
Received: from IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70]) by IA3PR11MB9226.namprd11.prod.outlook.com
 ([fe80::4efd:8324:f06f:5b70%6]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 20:11:55 +0000
Message-ID: <4f63d446-fe21-4c71-82a4-aef5c7acdcb3@intel.com>
Date: Tue, 10 Feb 2026 21:11:50 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] drm/xe/vf: Wait for default LRCs fixups before
 using
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?UTF-8?Q?Micha=C5=82_Winiarski?=
 <michal.winiarski@intel.com>, =?UTF-8?Q?Micha=C5=82_Wajdeczko?=
 <michal.wajdeczko@intel.com>, =?UTF-8?Q?Piotr_Pi=C3=B3rkowski?=
 <piotr.piorkowski@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20260206145334.674679-1-tomasz.lis@intel.com>
 <20260206145334.674679-4-tomasz.lis@intel.com>
 <aYYu7wFpES1UXoWm@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Lis, Tomasz" <tomasz.lis@intel.com>
In-Reply-To: <aYYu7wFpES1UXoWm@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR09CA0105.eurprd09.prod.outlook.com
 (2603:10a6:803:78::28) To IA3PR11MB9226.namprd11.prod.outlook.com
 (2603:10b6:208:574::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9226:EE_|SA2PR11MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 0706844f-a723-4bf7-e0e7-08de68e0a32f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Ry95K2NuVVdvbno0VHkySitJQUplemxHYzVmR0cvYllWR1NhWnJMV3pUTWhu?=
 =?utf-8?B?QlRjdS9MRXZYdGtZbHk4REY4TWE2VW0zMXpjaXhMNHdVZWJDZko4VGRhMktP?=
 =?utf-8?B?NlNBMVB0Yi9VZnhiblBpczlFZXVqWWJqZU5waGQ1OWhKWENFeExCTjY2MXVj?=
 =?utf-8?B?U1NJaDFKVDB1dnFXY2NUTFVFMkJvenQ3em9zeHFFb3lMS3Z2OThLcHJyczJh?=
 =?utf-8?B?cmdtQ3UwZVFKVjVqNjZ6OG5KM0QvWEJRRW03blhrbFQ0NWhxR1FjY0grcHpP?=
 =?utf-8?B?Zm9lM2hlZCtBcTMxQXhTR1Y4aG9rMEcyVHBwS2I3dVUrbUVaTjhxTXNwcTVQ?=
 =?utf-8?B?MU5xMlI0TFhZeS8wTTVlOUtYMDE5OHkzUjQxVVFBU3cwZ0JTcVd5WEZsZjJK?=
 =?utf-8?B?WWNHUTFjSG1FRjFwbld6WGJTSjJqL3BOVWN4NmdoOWpZSlArdnN3bUZKNVRC?=
 =?utf-8?B?WndidU9jOTUwNEdNZXFwb0ZvN2FzOFd5K1hScjBhWDdKVkNHRTd4NmJPVHVW?=
 =?utf-8?B?MVhhUUE1VldpamQxZDFJRlBnMG5Cay9pYS8zaHBJdVRqOFhCeXk4OExsZmxX?=
 =?utf-8?B?aEhxTmVxRTNQVnNRTlMzN2VQbWNjWnNhSStDL3RDak1aR0VZUzFJSVpHaUVo?=
 =?utf-8?B?dTU5ZmRKWnhtamt5L3VEaWgrZDhyVzFnUGJhYVB5NWRVZDJoSVJ2Y2dESFNk?=
 =?utf-8?B?a29aaGw5Z3FHdWR3VnRYUTl2c2p6Z1ZVWHpOSis4RGhyRmxwTTNmSG9zTSty?=
 =?utf-8?B?S2RQUlNXenBtMWZsWloyaFdIU0IxZFdndTVBN0hNa0wwcyt5bFhqZ1hET24z?=
 =?utf-8?B?Y1FhRnoyUE1MRUtQSXdmZnVJTkRWVzB3WUdQYVM1ams3OXZmbWtITWkrUzBY?=
 =?utf-8?B?M0FwSE0zazg0NEdMa3RmN3FvdS8wWVBsNktqWDhzTlFMRStMWVRralZTaXMr?=
 =?utf-8?B?OHRUMVQ5U3Uveld1T1VMRmwwTkt2MkVacjAzbGdEZllZdEFLSlpVbHdHVTBu?=
 =?utf-8?B?ZVVKUEFXaThmODNxaTJXQ01McEFSbjNPcFN0TEYvVnhjbG4vd29OT2FqUnh2?=
 =?utf-8?B?Q3paSHdBbjhoS1c3K1JTTG55S2NScDIxQy9JSFJlR1hiQkJZcDIzWVZQWUEr?=
 =?utf-8?B?aHBlNGpxMDlLVWZZL0d6WjFLUGNvT1FhSGU4OWd5QmQ1YnUxa3IxcU1nQjlT?=
 =?utf-8?B?SjlmYXY1S250VldudzAyNTdObFh4MDB6L3VTVzllRk5IcmJTZ2U0N01xVDFu?=
 =?utf-8?B?MFIySTdxVW84eGd4TytYdGR0VStiUVF1bmxDUGh3eldyRDdNOE44V0dIVnVO?=
 =?utf-8?B?SDRYRjdjN3FLU21kQUdXSkttMTJjVmF6cTdZbExWdC9QdS9Kb0ZWd1JBNW5P?=
 =?utf-8?B?aC8wNk5IRmRqcWw0enV0VVQrdTd2U01haHJpdHVzVGM5Y29Tc3B0SmNWSnpw?=
 =?utf-8?B?SE0rQ0xxSHoyT015bHdCNGFSN2x5SGN4OUFEdE10b1dUblVaRWIzaUFFVVlC?=
 =?utf-8?B?dThjdXdtUVIzRzNsWVZTTU92SEpldHM2UXUvOUtDK3JxN0Ewa3I0aTVGeEVD?=
 =?utf-8?B?aGErbkdHNEtQcW9kM3JHSDdRMC9QSHUzUUVUcjN2N01YZmhmVURQd3oyK0Zv?=
 =?utf-8?B?Qm5BdDNqZjlld1hxb2c4bmdmeFlUK1Qxb1ZXOElWeDJiNWpIZmtMWkpOU0kx?=
 =?utf-8?B?eExZUTQvMmhMK2hGT3hHTTNGZlppZFkyaDVySGJJb2xFYlgvZHBWeGRvME1y?=
 =?utf-8?B?a3Q1SndaR2N6SUxYVXc3VHd2RTBzUHZLaW5GWDZmMjJiSkYzTFkrZXlLb2J2?=
 =?utf-8?B?Slk0UlRGVFhUYVpxRFVPWEtFd2hvYkMxS3dsL1drSisrVW1icE83T1p6OTlO?=
 =?utf-8?B?ZnkrZGtsNGFGSG85N0hMdHFUazRDRlNsMWpIQnFSM0dEWVpvSWlucTcxK1hP?=
 =?utf-8?B?K0x6REc2OWJqRHRydEcrNmU1eXJOUmdoeHNTTG9xVHNaQUROVUlSbGc1SjFT?=
 =?utf-8?B?aEZYNWoxZEZjV0gzTkJLbk5TQlJSUzkwQzM4TzMyVXllcDNwOCthL1ZlMWxB?=
 =?utf-8?B?TkJwQm9jTktmR09WZ1hRNlZpT2JSUW8wTThFMFRWcXZGU1U5cFkyQ3NVL1dL?=
 =?utf-8?Q?albs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA3PR11MB9226.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjk0cVVqazZNMDNZNGx2M2hDVXV1Vm96Ri9UUzRJR1VLeUFYUHdoZE1Vd1F0?=
 =?utf-8?B?aHQwMjRCZnZ1MnBOVG1BVHdsNDhsWnZQcnF2Vk5LbVhGUkdTMUxiaFI3cEY3?=
 =?utf-8?B?TVZyVEUrRUNyeWZSK08wUUhKV0R5TUhORGoxWUVJYXYwTVJMeXhnWVFnV2Vy?=
 =?utf-8?B?Ry9YVlE1ZFFZNnZBWjRJYlVMdWJ3bFFHUjRFUERKRVlxak5hVk9ObkpPOUth?=
 =?utf-8?B?Qzk4K1VwTjFzRFFHZDJxRUl6Wkcrbm9XbGtsdGhPMTJWbC90OVJpNnBhQThm?=
 =?utf-8?B?cU4rbVBOeEQwczJJdVgwVC9MUDVqMFdqWkdrQkNhVENhaEZPTFljaU9jWith?=
 =?utf-8?B?aU41WnF3QTVOUnV5cFBFVGQxc3V6b2F2Q09OdzM3ekNrZUxkSlFheW9DMm9D?=
 =?utf-8?B?TjNocE1PTVNlaVFVeHh6eUhxTG85Y3hvaUtRcTF1Q0pVZElnaG1YdDQwMXcx?=
 =?utf-8?B?TE9jY1QxL05IeUxyOXZpU3dwajNjY1Rrcjl0NlZ0NEExelVVYkVpM1JnWWF5?=
 =?utf-8?B?eE82WUxQUHVVN29aM3NjZUdwS2xNeEJUdXpwd3U5TzM5OHhOdC9BZ2pXdWV2?=
 =?utf-8?B?VUg1YVU2UlJDeE9xUHZZYURmM2kvcmUxdC9RWWlESUoyYjJKcTZNSTFsUWoz?=
 =?utf-8?B?R2Z6cFJEaXhaM1owamVRNEhIeml0UTRZb2lsT055b1dYaEhIRnhLUmJhcUJZ?=
 =?utf-8?B?SGl5QkYxV29tbVBVOEhlWDBBYSs0NXZ2dldyZjdSZXVIQzJzdm1EV2k4S1dZ?=
 =?utf-8?B?U1NhSGpoVTRGRTh0TWg2cnJMN004YVY1QUhLVHJUVnVKbExGZksvK05hcUxP?=
 =?utf-8?B?VEQzZjJ0RFZqU21aWWNtVGdUMlQxVDhjZEZxanNoNmFKcXFTTEZ5OEtNOXVQ?=
 =?utf-8?B?SzJPOFlSQjhYY1RRK0JNMmJMYWJMR1ovbGZQYnNKQ2JRbUZCVjBwd3B5eTFM?=
 =?utf-8?B?TE5UNURRV3N6Z3ZlcmtHanFWNmV1Q3ByLzF2Z3N1Q09QdjA2V0tjcyttY0pT?=
 =?utf-8?B?ajI2V2J1TStFb2RSeGNKZnA1T0NNZXJYTDJ3N2pMV0ErVlJoQlRxWmxoWkhT?=
 =?utf-8?B?aXl4QjljeXRrTGdQYlFUaStXVURMeEZEbzd5RHNFZ1BUQWVYTDhZSkh2TGdV?=
 =?utf-8?B?ZlZXZFpIVjFsc1gzVEc4OE9pZ1czTGp6VGJKRTh6cFpHQkgxL0J3MEE5a1lD?=
 =?utf-8?B?NUhRbHNSekhBTXJKWk50bkoxZ1lUM2dtdHArekU5K05mYk1GcXdDa1ROOFlQ?=
 =?utf-8?B?UHgyREl6K0Z0Z25ZemU1ajB2U3VsbHdEVkh4ai9xcE53UVhkN0E0YTZsOXBM?=
 =?utf-8?B?UDhVTThRQlVUcnVENEJnMnFoTnBmRlpsbE4wK0tmcFNweXdnVThRZERObE9S?=
 =?utf-8?B?Q2tNWUNSQ0NLSEtrWjVXY2k3QmdwcUI4MFlraHp2aGVWY1MzSzMrQlNnL0N3?=
 =?utf-8?B?M1FzUUhZMFRWTjVqcFJRTHNGMzc2bnV3NDRreGJNNlp1Q2MwOFZnU0VXTVl4?=
 =?utf-8?B?QUJZZExtR3NFNkxUVmpLcGxxUWlaOHovSTR6MzFsNGlaTFVVSnRzZ1Bpbmdv?=
 =?utf-8?B?emt0YXBROEtSUk03cFA3QXNBeTR1eStONDI2OFgwOGp1NlErc1lTZlIxd2R3?=
 =?utf-8?B?MnVDQ21ublBTdmp5bXUxV2VTV2k2WmZWdTZIRVVtckRjenllU2VtYmIzLy8v?=
 =?utf-8?B?TkNlSFRjRVBoM0VDemM0RTFJWk5oU21HUlNUbzZEL3U2K0Q2a3hXa3k4Vnh0?=
 =?utf-8?B?WnVSV0haNDJrbTFFTTBnUFV4UWRORUVOSkxvK2xFUytYd2xmbFFHeS9zTTJI?=
 =?utf-8?B?WFc2L25HTmhyUHloeXJBMUpZMmhRTjUvME5mbGpVdjB1T05NS0xuUjd5Ylhp?=
 =?utf-8?B?MHRzTUcyZVBjamlFWnVla2M0ZERvZUsvMW5LL212V3FmZlpKaU1ZN0tXeVQ1?=
 =?utf-8?B?ZlNnMTNHcDJUU0NIT3lKNy9qSUZSZlcwOGdxQXprSG9DSzFSd0VnOGRXRGNo?=
 =?utf-8?B?ZlVGWVEvaGhUUTViTEMvb3ZQR29qSzRWTC82ajVuNmV6cE5ENDhuZWtJYkFx?=
 =?utf-8?B?RnphR0dsdXo3QmRHVk5hU3FPZXZYNW9OWEVBNWJQSmhpN2NQS1dmRVBiWGZX?=
 =?utf-8?B?bjRkM2d0b1RpcVNrMVZxdm5YcFEwdy9BZUpUcjdNOHhGNXhRRnBUVVVueDdF?=
 =?utf-8?B?SU5SVDZWNEtoYlFHMnZBWTB0MHVseVlBeTZ3TjNETFh6bkRESm9IZU1XZnpC?=
 =?utf-8?B?L1JnNmRuZ2cyL1pKRzV6V000dTVJSGQ0UFFnTFY1L2s5TVdTQVBtUHBnV1Bu?=
 =?utf-8?B?bEhGMDdqNGdUM1hkdGcvclhyQ1d6bFhtMmtQYlZXRXU2bSsvcjFSQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0706844f-a723-4bf7-e0e7-08de68e0a32f
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9226.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:11:55.4396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OnknkNtZKQL38MBYMktdnGPNDyjtxSBaUjpq4qlpe9YCXkVSNI2tRJ/mtDsFPAfC7EYbBEGH1xZRk2fSnFrTWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5212
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


On 2/6/2026 7:11 PM, Matthew Brost wrote:
> On Fri, Feb 06, 2026 at 03:53:33PM +0100, Tomasz Lis wrote:
>> When a context is being created during save/restore, the LRC creation
>> needs to wait for GGTT address space to be shifted. But it also needs
>> to have fixed default LRCs. This is mandatory to avoid the situation
>> where LRC will be created based on data from before the fixups, but
>> reference within exec queue will be set too late for fixups.
>>
>> This fixes an issue where contexts created during save/restore have
>> a large chance of having one unfixed LRC, due to the xe_lrc_create()
>> being synced for equal start to race with default LRC fixups.
>>
> This indeed looks like a potential problem.
>
> This whole flow is a bit weak (my fault — I meant to fix this but lost
> track of it). Maybe we should make this a bit more robust and ordered by
> the GuC backend.
>
> Roughly:
>
> - In guc_exec_queue_unpause_prepare, if at least one job has been
>    submitted, we fix the LRCs on the queue. This would happen prior to
>    emit_job. I believe the 'at least one job has been submited check' is
>    exec_queue_registered.
>
> - In guc_exec_queue_run_job, upon running the first job (hook in
>    register_exec_queue) and if VF migration is enabled, we fix the LRC.
>
> What do you think? I believe this would work, provide stronger ordering
> guarantees, and let us drop the READ_ONCE/WRITE_ONCE and wait‑queue
> semantics, which are questionable at best. We could probably revert the
> flipping of q->ops->init and the LRC creation order back to the original
> flow as well.

I have a vague suspicion that there maybe can be something more wrong 
with the LRC

than the GGTT references, if being created at the moment of VF 
migration. But maybe

I'm misinterpreting stuff, I can't point to a mechanism which could 
create such skewed LRCs.


We should create a POC, then do some intense testing. If it works, then 
my "vague suspicions"

were baseless. It does look like a good solution, even if less contained 
to the recovery worker.

Performance impact should be next to none, due to the fixups only 
happening once on new

context during normal VF driver operations. Creating a lot of contexts 
to do one, very small job

on each is not a flow used anywhere outside of tests (and even there, 
the impact wouldn't be

that noticeable).


Will work on the POC, and ping you in case of issues.

-Tomasz


> Matt
>
>> Signed-off-by: Tomasz Lis <tomasz.lis@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_exec_queue.c        |  2 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 24 +++++++++++------------
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |  2 +-
>>   drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |  4 ++--
>>   4 files changed, 15 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index e9396ad3390a..6eb561086e1c 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -309,7 +309,7 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>>   	for (i = 0; i < q->width; ++i) {
>>   		struct xe_lrc *lrc;
>>   
>> -		xe_gt_sriov_vf_wait_valid_ggtt(q->gt);
>> +		xe_gt_sriov_vf_wait_valid_default_lrc(q->gt);
>>   		lrc = xe_lrc_create(q->hwe, q->vm, q->replay_state,
>>   				    xe_lrc_ring_size(), q->msix_vec, flags);
>>   		if (IS_ERR(lrc)) {
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> index 30e8c2cf5f09..1edccee84c76 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
>> @@ -529,12 +529,6 @@ static int vf_get_ggtt_info(struct xe_gt *gt)
>>   		xe_tile_sriov_vf_fixup_ggtt_nodes_locked(gt_to_tile(gt), shift);
>>   	}
>>   
>> -	if (xe_sriov_vf_migration_supported(gt_to_xe(gt))) {
>> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>> -		smp_wmb();	/* Ensure above write visible before wake */
>> -		wake_up_all(&gt->sriov.vf.migration.wq);
>> -	}
>> -
>>   	return 0;
>>   }
>>   
>> @@ -837,6 +831,10 @@ static void xe_gt_sriov_vf_default_lrcs_hwsp_rebase(struct xe_gt *gt)
>>   
>>   	for_each_hw_engine(hwe, gt, id)
>>   		xe_default_lrc_update_memirq_regs_with_address(hwe);
>> +
>> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>> +	smp_wmb();	/* Ensure above write visible before wake */
>> +	wake_up_all(&gt->sriov.vf.migration.wq);
>>   }
>>   
>>   static void vf_start_migration_recovery(struct xe_gt *gt)
>> @@ -851,7 +849,7 @@ static void vf_start_migration_recovery(struct xe_gt *gt)
>>   	    !gt->sriov.vf.migration.recovery_teardown) {
>>   		gt->sriov.vf.migration.recovery_queued = true;
>>   		WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, true);
>> -		WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, true);
>> +		WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, true);
>>   		smp_wmb();	/* Ensure above writes visible before wake */
>>   
>>   		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
>> @@ -1296,7 +1294,7 @@ static void vf_post_migration_abort(struct xe_gt *gt)
>>   {
>>   	spin_lock_irq(&gt->sriov.vf.migration.lock);
>>   	WRITE_ONCE(gt->sriov.vf.migration.recovery_inprogress, false);
>> -	WRITE_ONCE(gt->sriov.vf.migration.ggtt_need_fixes, false);
>> +	WRITE_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes, false);
>>   	spin_unlock_irq(&gt->sriov.vf.migration.lock);
>>   
>>   	wake_up_all(&gt->sriov.vf.migration.wq);
>> @@ -1492,7 +1490,7 @@ bool xe_gt_sriov_vf_recovery_pending(struct xe_gt *gt)
>>   	return READ_ONCE(gt->sriov.vf.migration.recovery_inprogress);
>>   }
>>   
>> -static bool vf_valid_ggtt(struct xe_gt *gt)
>> +static bool vf_valid_default_lrc(struct xe_gt *gt)
>>   {
>>   	struct xe_memirq *memirq = &gt_to_tile(gt)->memirq;
>>   	bool irq_pending = xe_device_uses_memirq(gt_to_xe(gt)) &&
>> @@ -1500,17 +1498,17 @@ static bool vf_valid_ggtt(struct xe_gt *gt)
>>   
>>   	xe_gt_assert(gt, IS_SRIOV_VF(gt_to_xe(gt)));
>>   
>> -	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.ggtt_need_fixes))
>> +	if (irq_pending || READ_ONCE(gt->sriov.vf.migration.default_lrcs_need_fixes))
>>   		return false;
>>   
>>   	return true;
>>   }
>>   
>>   /**
>> - * xe_gt_sriov_vf_wait_valid_ggtt() - VF wait for valid GGTT addresses
>> + * xe_gt_sriov_vf_wait_valid_default_lrc() - wait for valid GGTT refs in default LRCs
>>    * @gt: the &xe_gt
>>    */
>> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt)
>>   {
>>   	int ret;
>>   
>> @@ -1519,7 +1517,7 @@ void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt)
>>   		return;
>>   
>>   	ret = wait_event_interruptible_timeout(gt->sriov.vf.migration.wq,
>> -					       vf_valid_ggtt(gt),
>> +					       vf_valid_default_lrc(gt),
>>   					       HZ * 5);
>>   	xe_gt_WARN_ON(gt, !ret);
>>   }
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> index 7d97189c2d3d..70232dc38f9a 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
>> @@ -39,6 +39,6 @@ void xe_gt_sriov_vf_print_config(struct xe_gt *gt, struct drm_printer *p);
>>   void xe_gt_sriov_vf_print_runtime(struct xe_gt *gt, struct drm_printer *p);
>>   void xe_gt_sriov_vf_print_version(struct xe_gt *gt, struct drm_printer *p);
>>   
>> -void xe_gt_sriov_vf_wait_valid_ggtt(struct xe_gt *gt);
>> +void xe_gt_sriov_vf_wait_valid_default_lrc(struct xe_gt *gt);
>>   
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> index 4ef881b9b662..8be181bf3cf3 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h
>> @@ -73,8 +73,8 @@ struct xe_gt_sriov_vf_migration {
>>   	bool recovery_queued;
>>   	/** @recovery_inprogress: VF post migration recovery in progress */
>>   	bool recovery_inprogress;
>> -	/** @ggtt_need_fixes: VF GGTT needs fixes */
>> -	bool ggtt_need_fixes;
>> +	/** @default_lrcs_need_fixes: GGTT refs within default LRCs need fixes */
>> +	bool default_lrcs_need_fixes;
>>   };
>>   
>>   /**
>> -- 
>> 2.25.1
>>
