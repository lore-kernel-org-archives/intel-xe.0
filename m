Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28F32FCC9C8
	for <intel-xe@archiver.kernel.org>; Tue, 10 Mar 2026 06:22:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF8B710E1F5;
	Tue, 10 Mar 2026 06:22:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGZlq6m6";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4543210E1F5
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Mar 2026 06:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1773123735; x=1804659735;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5WQBOHoPZhKqByrKfE6a92sjdMmb+v7qeCnmWpKmqo4=;
 b=HGZlq6m6bkt3f5QzwpJ9xyBlnniLjZOSldS3wiOTiCAgCljQV1GrgfVw
 P/hQchUHbzxvLFU/Rfdi6fSdt9WvbwZN86BggO/KbAkXORV6hxkPUGWgD
 jRc8FEAq/2lk4xFXHTcJURVAuu1UaJvPWovsID7lHMnHHSSjdv4L55oFn
 PdmsRcb5kFfvrbYD1qjrSn1POhJVI1pGmw9AO7pXHgp5DnCJ7WGsUNLdR
 PyouZHLkDClKJE/hSsagumCDoowzhTjoPLq/zJnv2BOvD/j1d8/7Ihv1Z
 0KmDownGB11XpGaDjuXz5MCnLY1tpnp6Ay3cjzOI+m0xCqcTE7npuOa7B w==;
X-CSE-ConnectionGUID: yLB3PMuxQPSboVJx/4rirw==
X-CSE-MsgGUID: 8eWeJ3a0TZONNKkg34k//w==
X-IronPort-AV: E=McAfee;i="6800,10657,11724"; a="85517298"
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="85517298"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 23:22:15 -0700
X-CSE-ConnectionGUID: VgqmWfLQTlaTGpHDcaupPg==
X-CSE-MsgGUID: gDpdOyE3SViuX6YEKeRaxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,111,1770624000"; d="scan'208";a="222624533"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2026 23:22:15 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:22:14 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 9 Mar 2026 23:22:14 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.55) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 9 Mar 2026 23:22:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r5OIPqy7fsvEgChoVxb5OblMl0vQqSImUD6liNGThoC19eJAXOI5TEFFlVVu2QQsaJwBjwK6rKOizZ5uuJ/SGLxuyYrj6wqgas9EJrsP2EG4QtXJeAsrjsZ/bZpMqL/jExpQ7ki/P2mtgnbOx3pugSKQw1ll0AoPeNAJ8RjYJpJtnSqKOkkOd2kX5kRjzPwm/QuHHLVu8sVNu6q2kfukqtA+Kn1MDYk2MLI+sa82rWtUnW3nyc+TxBoPST+jfkvEhaKu2jpgsf3yjTCDfhbrG189Yh+oc5pKke8kKDpLLl7eLaTHW7V7PKek19Ak05IESmDcZWx7ifJaUoxjH1RawQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brvL3S2lEv81s9Oa/Iob/wD80tkYFgDa+X9qBhGbHY0=;
 b=M8ZE/5zmwjtONvoxGnSAS3M378/YowlJ3bRGrXNXc4km48k8tuIHvTB6MZA1mUJo+rhn1rjsiFP8mGPM9/PS0Yag2ofZs99/wGqDVInSNZZWP5kpn5xKzua4/dPO1I/hGYNKqo7gKuyjmn55l1WMQrOjv3R9nMdH/nWL56KzlPHadpwOQ/p5/f1TAOnwAmQEEhPbXwNRkZdOJ+yorwR+LboiOvhdXBYcLb0FiggHjX6Ebb3rD6OZZcFAktAw1uFYLqZuM1AiaDRhqVrxdhogXVcgPwfslOkt5nDjr9xgaS4wSjQt9GA1ALFgzJsLMrZniEByyBdTU8uarLoTkrBV3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by PH0PR11MB7613.namprd11.prod.outlook.com (2603:10b6:510:285::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.11; Tue, 10 Mar
 2026 06:22:06 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.20.9700.010; Tue, 10 Mar 2026
 06:22:06 +0000
Message-ID: <cf497488-d88f-4b6a-a90d-703db3c2ef96@intel.com>
Date: Tue, 10 Mar 2026 11:51:56 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] drm/xe/sysctrl: Add system controller event support
To: Raag Jadav <raag.jadav@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <matthew.brost@intel.com>, <rodrigo.vivi@intel.com>,
 <riana.tauro@intel.com>, <michal.wajdeczko@intel.com>,
 <matthew.d.roper@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <soham.purkait@intel.com>, <anoop.c.vijay@intel.com>
References: <20260213081644.2085314-1-raag.jadav@intel.com>
 <20260213081644.2085314-4-raag.jadav@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260213081644.2085314-4-raag.jadav@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::17) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|PH0PR11MB7613:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a7bc6b4-7474-485c-179b-08de7e6d59c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 3KjrOVBH+bniaFnjaAgNqW1WMR6AGIvgObNB5rr0fyADmmzhtHnCDiKcG58S7eNaZxADQPwWFNaD5Hh/yYBCXEnogrXMS6JfdyvubK5K9k2EeRenbM0anzLMIEadjAkAsBvPf2Ky+NPNbULO5X0h6tx+nei8r9AECZGz/zCBnkJph2XZM8skbmxQNsOdf3np+sQQIHFmuwqVqQxlpRIK+g8o/pj6M5/BPIPftJBL9ebndyBPfYyTo8wnjZR+k69+/BNq51emTY9af1Wxv/NFc0itM6gzvimiazoz64QYUFxNX0X/umTE8+A1C49GNlUCMz05tWKsOWvThad1HfHtdiDmRBniLmcsEPVAmuENiC75seJC/alZKua9gXmA5e3U3WfcFkNtsvKi7yG9YqzlBx2G+2nCjN42IGDB8Y5A0/FsfXQKzrWr+HmjLAw20iD59JEg5yL/sDhe8c9bdeFxNBACHeqhcQMPR15DSzHge+Sn1soTFjXuRW5oTwr6mN9+UrDEIKsB3rNmLFsbLeNGyHV108IRNWG6HTwUGjfOj8fW5EZ+xbk5aet4YgNhAqt3FICZK5URU2YrgrNSGbHcCW5D/o6KP3V56SxiG6eVdszRLz0ig9wN5ksbwTqwOLJ0hQpM/co2VFbKZGOPfq0WVWU4ipBaC2UPzrLG74TmiTxFsRfwl3pL8OB3CqaqoUVQDU99qEZQP+iIumw/Dx0xyoTiuA/fX0rtd8HMQjw5sJ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d0JBVjlzQVNUN3hMMHRrMWQwaXl6Um51dnpqYzZyL3llVXJvT3pBYWZVb1g4?=
 =?utf-8?B?clpNZCtPTGZjTVAvVmJnL0k0K2dGZitkcHRUK1Z1QTkyU0FGR1pQTEdNRTdL?=
 =?utf-8?B?bFp5Y2U4a2V5MFUrc2U5R2RjNjVFR1BwT29xUzY5VnM4eU9oNExLVDZBTXl2?=
 =?utf-8?B?Ukg4N2lmUGZWYmdDSWlTN2hPd3dIY28xYTJ6SFZyK2dTNXAxNFlMVTNTTUwz?=
 =?utf-8?B?RGF5dmRNRFBmRFRrZzFJUzFITjJuak9UN01ROFFaRjN0UVptQVhpUHhnQ1Fv?=
 =?utf-8?B?TEk0UUp6MFcwSnlGL2JabWQ1amhDeVE0T1NlTkZQQ1hXMC9aUFpRVzJaaTJH?=
 =?utf-8?B?YWszY0RqYmkzQS9DV1poUGY1TDdSOGdSNXg4V1NzbjllN0F5OFRhVjBtdG91?=
 =?utf-8?B?WVVOK0R3T3AvMFNnZFZ1V2Q0dENwemJQTmc4Mk4xbGdvY2hLWlpCdXdhTCtG?=
 =?utf-8?B?NzZ4elNISWpYL3RHUXBKZDZCYjNTSmE4bVpYSmpZR0t4OFVoOGNqVzVkQkFV?=
 =?utf-8?B?RjQ0eXFqbGNQbFlQYkp2cG1USGZ1Q09UeFR5dGY1YkpwVlhNY0ZPZ2xrNW1h?=
 =?utf-8?B?dVNQNkN4N3VNT3JpYVRnemRlTGQ5UHVnZ0J3bGgxR2tGMkpZYlBhMlZZeEJw?=
 =?utf-8?B?YktrNDNESFBWVTYyTHFxS1VORnZkaFE5ajVTRWVtNnJYSDErMDZpQmtnZElR?=
 =?utf-8?B?b0t0QU1kMmdoNjRwV05HMUQvMzgwa2FzSFNHeHZOenFmZjN4Z2NZaThneGF5?=
 =?utf-8?B?KzViVHU1TkphTStabGVHeTFpTU5rcnlIeVpBcFpvQ0pKTlkyc1F6RWtodlFC?=
 =?utf-8?B?TTU0NzB2cUtoSXRtYUdZRHpEdmZ1dFNld3g1TTFHYnlLRktueHVYaDVXbVlp?=
 =?utf-8?B?N05XcWdoM1Q2T0ZRY0JXRDZxVlkxSWp0bVYvU0kwamZLRWhpOU5ST1R2Nk9P?=
 =?utf-8?B?TGVlRXNJY0xDV0RRODdjNjJZaDh0OTM2b1cvNGFqT0t2WU5xb0MwTmRYVjIw?=
 =?utf-8?B?WHNMa2VLM1Z6d0ZGendJcURkbWFJZ3l4VWRVc1hzMzBiTlQzb0ZndGNkUGdj?=
 =?utf-8?B?c0RML0Qrb3kwQStpelJ6SDI0TUtTb1pEOHRpbmJnMEFWL3FFR1JoWE9oUUQw?=
 =?utf-8?B?OFd1TUs1SmxNRGNwODA2NlJoVnYrWWlZb1UvdTBSZ1Fwa2t0dmdkSTUwVnJQ?=
 =?utf-8?B?RmtNbnRRYW5RU1pvb0RtL0tvS050STFLRjZ2a0UvZzRKMnViRm4zbGF5K1dW?=
 =?utf-8?B?eldqeWZVcTJlbWJQYUgwdGRjdUdHSE5sVTVYaGJqWkl3Z2lzaDE5c3g4dHpH?=
 =?utf-8?B?OG00SE81SjJsN056SEJLblUvMHpwN3pOeTJzc04rUFY2V01QRHBJL2pCQlBJ?=
 =?utf-8?B?UjJnVDJ3ZzRNWXlBU2dDVEh1Slk0ZDl6YWFLNDhrc3FESlNDWDRnYmJPSTUz?=
 =?utf-8?B?VXhNSGtUYW1RN2RCcmRLcEhQM0lxS0I5aFFKeEdFYzJqRkdUMklEbSsrOXAv?=
 =?utf-8?B?QkdBKzk4QUhMWk5WcXlXampPTXlHM3hSNFk5aFRxTjQ0emRId0ZKSGJ4VHdH?=
 =?utf-8?B?K2NLWVNWdE4yamd3eEVFbVNrbzJqR3ZoeUJ3M2lObXFRVmwrbHJudEFaY01p?=
 =?utf-8?B?R05PMUJOdWRic2FjK2lqZTFmVkpBaUZ2bVdRNENHN3MyV1B5Y25lOXc3VEd5?=
 =?utf-8?B?UkxHcVpGRFNNYnBwNnRQZG1MY0ZWb0lNVXlKY1FuWEMvUnlLNUhKcDR2MUxG?=
 =?utf-8?B?OFR6bWZHK2swMm1EWDhRMi9JQVFjV1hyOEtiV1NEanoydDYyZFh5Wm9ub05p?=
 =?utf-8?B?UHkzcGNMcHg4TDMyMzVTeUw4V3VBQXNsRzZRQkxPQ0dHbW1WcEk0MlVQNmZ4?=
 =?utf-8?B?K3ltRUFzeHdHdUhJbnpRSnI3SGlDN0tSVFJUdTBVTmhhT3BsejdndCtScWhP?=
 =?utf-8?B?RitkcXh3Vjc0UStSY1NybnJhUDJQaUpta2hsWHpZYWEzUzhwZTZUZ295UERD?=
 =?utf-8?B?Smd6WlBaQ1JiL0YzcEx4MlJycjNlSUYrbWVrelBweEI4bjl4QjRhZG9neXpj?=
 =?utf-8?B?MGlUSTBUV1REMklmQVBRYnpONTRCWU02R3Fia01wOE0ydDFqMGxMTndIcnNx?=
 =?utf-8?B?bmtKZmlIbGovcFB6V3pZNXpobHNwdzBrZXlMd1pycUJkR09qeHVHMlFzTkla?=
 =?utf-8?B?MVN3MEhoS2J5RWxNUjRVK00rUUZXNnkxY1hxK0tqZUwrZm1Eb3I1ak4rVi9r?=
 =?utf-8?B?dmFERmxreWduY0pvM2FMVDdSY24rczhIQ1hyVkViaGFIajYxY1N3end1VDNw?=
 =?utf-8?B?M2s3RHN0cXI1TnBhaTZmZTBWV0FnZEF3cWlybEp6Q3UzWWgrUEVacHlpTHBJ?=
 =?utf-8?Q?RM08a4MZp47sZBAs=3D?=
X-Exchange-RoutingPolicyChecked: H7yysjnXAy2QOLMMg6kOjJADrzcw5+3G37wS3UcKIhLJOpEPkFZmnOSOH9CGFjY1Ukqkz1VPsU5dWQUSxLQPkDXauOyGkd14wvNd8OhBibv5Is4bwOy83CslicGrHkBHBSqMKtUmrVOOgi0FF5XLI8lEzlMUCoQTFjzYZpR5VWp4UsdprWsUOWaBq1/MFY7Oao7NFfYDR18ycfT0isfPWNoQ10jlquUTYvYLTWxt3mLI4pac+mhoNU+D7UHk2yMWtpVBQXdT102WCoi0CaY5ANFx8CZQDf3s4xrDZmHU30mRhIUTb1Zn0rme3DnzdfLQjP1xFM6QSJhmdR5PFBGZtQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a7bc6b4-7474-485c-179b-08de7e6d59c8
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 06:22:05.9616 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W5wuCbuwUzg3QARhrigEOMkunVBuRQcyUkg0BMSWwfQCPiqGP0BIcvBSdi/D3eTFuKE/l6DdCeUHYWL/2ydyaiF3WX3Oja2f4wkHfu9DGg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7613
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


On 13-02-2026 01:46 pm, Raag Jadav wrote:
> System controller reports different types of events to GFX endpoint for
> different usecases, add initial support for them. This will be further
> extended to service those usecases.
>
> v2: Handle unexpected response length (Mallesh)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile                 |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl.c             |  5 ++
>   drivers/gpu/drm/xe/xe_sysctrl.h             |  1 +
>   drivers/gpu/drm/xe/xe_sysctrl_event.c       | 76 +++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_event_types.h | 49 +++++++++++++
>   drivers/gpu/drm/xe/xe_sysctrl_mailbox.h     | 10 +++
>   6 files changed, 142 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event.c
>   create mode 100644 drivers/gpu/drm/xe/xe_sysctrl_event_types.h
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 8005293dc30f..59e083f90d7e 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -123,6 +123,7 @@ xe-y += xe_bb.o \
>   	xe_survivability_mode.o \
>   	xe_sync.o \
>   	xe_sysctrl.o \
> +	xe_sysctrl_event.o \
>   	xe_sysctrl_mailbox.o \
>   	xe_tile.o \
>   	xe_tile_sysfs.o \
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.c b/drivers/gpu/drm/xe/xe_sysctrl.c
> index aba2166650aa..bbfb737efc88 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.c
> @@ -31,6 +31,11 @@
>   
>   static void xe_sysctrl_work(struct work_struct *work)
>   {
> +	struct xe_sysctrl *sc = container_of(work, struct xe_sysctrl, work);
> +	struct xe_device *xe = container_of(sc, struct xe_device, sc);
> +
> +	guard(mutex)(&sc->work_lock);
> +	xe_sysctrl_event(xe);
>   }
>   
>   static void xe_sysctrl_fini(void *arg)
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl.h b/drivers/gpu/drm/xe/xe_sysctrl.h
> index 5919310b9db9..bd9acf575d14 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl.h
> @@ -12,5 +12,6 @@ struct xe_device;
>   
>   int xe_sysctrl_init(struct xe_device *xe);
>   void xe_sysctrl_irq_handler(struct xe_device *xe, u32 master_ctl);
> +void xe_sysctrl_event(struct xe_device *xe);
>   
>   #endif /* _XE_SYSCTRL_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event.c b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> new file mode 100644
> index 000000000000..7c3041f4196a
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event.c
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_assert.h"
> +#include "xe_device.h"
> +#include "xe_irq.h"
> +#include "xe_printk.h"
> +#include "xe_sysctrl.h"
> +#include "xe_sysctrl_event_types.h"
> +#include "xe_sysctrl_mailbox.h"
> +#include "xe_sysctrl_mailbox_types.h"
> +
> +static void xe_sysctrl_get_pending_event(struct xe_device *xe,
> +					 struct xe_sysctrl_mailbox_command *command)
> +{
> +	struct xe_sysctrl_event_response response;
> +	size_t len;
> +	int ret;
> +
> +	command->data_out = &response;
> +	command->data_out_len = sizeof(response);
> +
> +	do {
> +		memset(&response, 0, sizeof(response));
> +
> +		ret = xe_sysctrl_send_command(xe, command, &len);
> +		if (ret) {
> +			xe_err(xe, "sysctrl: failed to get pending event %d\n", ret);
> +			return;
> +		}
> +
> +		if (len != sizeof(response)) {
> +			xe_err(xe, "sysctrl: unexpected response length %ld\n", len);
> +			return;
> +		}
> +
> +		if (response.event == XE_SYSCTRL_EVENT_THRESHOLD_CROSSED) {
> +			xe_warn(xe, "[RAS]: error counter threshold crossed\n");
> +		} else {
> +			xe_err(xe, "sysctrl: unexpected event %#x\n", response.event);
What about remaining events in response.count?
> +			return;
> +		}
> +
> +		xe_dbg(xe, "sysctrl: %u events pending\n", response.count);

What happen when sysctrl continuously reports pending events, this could 
loop forever by monopolizing the work queue thread?

Thanks

-/Mallesh

> +	} while (response.count);
> +}
> +
> +static void xe_sysctrl_event_request_prep(struct xe_device *xe,
> +					  struct xe_sysctrl_mailbox_app_msg_hdr *header,
> +					  struct xe_sysctrl_event_request *request)
> +{
> +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> +
> +	header->data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, XE_SYSCTRL_GROUP_GFSP) |
> +		       REG_FIELD_PREP(APP_HDR_COMMAND_MASK, XE_SYSCTRL_CMD_GET_PENDING_EVENT);
> +
> +	request->vector = xe_device_has_msix(xe) ? XE_IRQ_DEFAULT_MSIX : 0;
> +	request->fn = PCI_FUNC(pdev->devfn);
> +}
> +
> +void xe_sysctrl_event(struct xe_device *xe)
> +{
> +	struct xe_sysctrl_mailbox_app_msg_hdr header = {};
> +	struct xe_sysctrl_mailbox_command command = {};
> +	struct xe_sysctrl_event_request request = {};
> +
> +	xe_sysctrl_event_request_prep(xe, &header, &request);
> +
> +	command.header = header;
> +	command.data_in = &request;
> +	command.data_in_len = sizeof(request);
> +
> +	xe_sysctrl_get_pending_event(xe, &command);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_event_types.h b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> new file mode 100644
> index 000000000000..9c5fb95c58f7
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_event_types.h
> @@ -0,0 +1,49 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_SYSCTRL_EVENT_TYPES_H_
> +#define _XE_SYSCTRL_EVENT_TYPES_H_
> +
> +#include <linux/types.h>
> +
> +#define XE_SYSCTRL_EVENT_DATA_LEN		68
> +
> +enum xe_sysctrl_event {
> +	XE_SYSCTRL_EVENT_THRESHOLD_CROSSED	= 0x01,
> +};
> +
> +/**
> + * struct xe_sysctrl_event_request - Request structure for pending event
> + */
> +struct xe_sysctrl_event_request {
> +	/** @vector: MSI-X vector that was triggered */
> +	u32 vector;
> +	/** @fn: Function index (0-7) of PCIe device */
> +	u8 fn;
> +	/** @reserved: Reserved for future use */
> +	u16 reserved;
> +	/** @reserved2: Reserved for future use */
> +	u32 reserved2[2];
> +} __packed;
> +
> +/**
> + * struct xe_sysctrl_event_response - Response structure for pending event
> + */
> +struct xe_sysctrl_event_response {
> +	/** @count: Number of pending events */
> +	u32 count;
> +	/** @event: Pending event */
> +	enum xe_sysctrl_event event;
> +	/** @timestamp: Timestamp of most recent event */
> +	u64 timestamp;
> +	/** @extended: Event has extended payload */
> +	u8 extended:1;
> +	/** @reserved: Reserved for future use */
> +	u32 reserved:23;
> +	/** @data: Generic event data */
> +	u32 data[XE_SYSCTRL_EVENT_DATA_LEN];
> +} __packed;
> +
> +#endif /* _XE_SYSCTRL_EVENT_TYPES_H_ */
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index 2b64165c8e76..f060be5124f2 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -27,6 +27,16 @@ struct xe_sysctrl_mailbox_command;
>   #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
>   	FIELD_GET(APP_HDR_VERSION_MASK, le32_to_cpu((hdr)->data))
>   
> +/* Command groups */
> +enum xe_sysctrl_group {
> +	XE_SYSCTRL_GROUP_GFSP			= 0x01,
> +};
> +
> +/* Commands supported by GFSP group */
> +enum xe_sysctrl_gfsp_cmd {
> +	XE_SYSCTRL_CMD_GET_PENDING_EVENT	= 0x07,
> +};
> +
>   void xe_sysctrl_mailbox_init(struct xe_sysctrl *sc);
>   int xe_sysctrl_send_command(struct xe_device *xe,
>   			    struct xe_sysctrl_mailbox_command *cmd,
