Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C2ACA5FB1
	for <intel-xe@archiver.kernel.org>; Wed, 30 Sep 2026 06:26:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB59510E10A;
	Wed, 30 Sep 2026 06:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CQiJzkpx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A58210E10A
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Sep 2026 06:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1790749612; x=1822285612;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=gR905rYzjm9dZgD7BUrHeWXY2fxVi59S36cxciQJ3Jk=;
 b=CQiJzkpx2OB/EUjveyeaDYUugcDXve9uJt1e6uXyMLOF6Odtp47Zi+65
 Wd4YyiLc8dzlZVdBYyPo3RrNz3rikEgCyTDkFt62j92UFqFjctZO9D8tC
 sRpTbl7sLDHuRZIt9MfkOF/C1lQ0MD8ZyAMjhqxshWs+N3Gro/CrC6QKO
 Sj7pS69mf3UtsfA1MHrCOxf4PSiDv4NsfogegAzJIXhOn8VSMN27i/qUf
 Wui1nanpMG7o+RXs0cf8Lpc7AObf3Kl4LgorbYBxnxoss1rPzXOKDDw88
 xu23h/7eNgWYBLOtadpsyaqj2qJRO6Ctla9t4VVXbdJ4Ml7HDc+4e0emg Q==;
X-CSE-ConnectionGUID: H/GeWK3aT0u4TEy/hE1jkQ==
X-CSE-MsgGUID: Azgvta4zTXmOIZncz/IRJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="107864428"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="107864428"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:26:51 -0700
X-CSE-ConnectionGUID: yYJeH/k8Q8e+OuQMG5jjEg==
X-CSE-MsgGUID: A+sEAVLsS5upziZZAxI+7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; d="scan'208";a="275152909"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2026 23:26:50 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Tue, 29 Sep 2026 23:26:49 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Tue, 29 Sep 2026 23:26:49 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.21) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Tue, 29 Sep 2026 23:26:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CD3xbCdWnj9K0UaowiZ0ZiYVQI5+bWUR8Mk3bxaqmSKywU/DKiq2vd0KvuBQ4jyW6LNtL6wbaUBrOn4ubH68Ja1GcSLKOJ2YPNtkNE8J62bd3VxZaCHZ/CC+PNhmzoAFerar+qxp2G1rjigHZVUfRf22MLsd6abQSsd60KY2GybkYy0Tz6nj7z+n9pHD/AWku9wnumD0VrIo6faTR3jdRZXpMHcGny1Lu20+VsUKzCzVMiRdeRy2tXvEfDgwmMdX49jH3G1AL+Vln4vLmwUQLCnPeD8If0V/QfMRRpXvwS3U0FRPOymMSyvfPkZgAe5kOzFExRvwzHFG3ggctwMzjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t41fLhfA/CIoIzCnoPgTIQiofcg9k+zJ3/zqPZNS5mg=;
 b=lRX51juYkE6MbZLzs79umE3FdijmZ8NAA4fKUpolyhEwAUo8AP9rxhtr5k148btOXrs2KAxwfH8+15ocBv93jNnEHzzL5/MsARIoR4VjDO1qnAZNmosIPd1GH79VoYsm6EhxIqYzVsnic2Tfzi6cgyshB/2XMPERjw6Rau2dVf5A/d5YGJsmok4BJkM23UnGFn4LTcejDYGXgmBDbdi0lWKrCoW2bgXMZpNmnOjLsH6JiLyoutT7BYVJd3h9//r1GuCkyNFyT2ffnxUj5XDiWduT1SNBe9DVIb0KmPXUncrgOPHXar5y5cnsyxx1AxyxyjH0PJKdH5Kp7auLdxQHAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5257.namprd11.prod.outlook.com (2603:10b6:408:132::18)
 by LVXPR11MB9756.namprd11.prod.outlook.com (2603:10b6:408:389::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Wed, 30 Sep
 2026 06:26:47 +0000
Received: from BN9PR11MB5257.namprd11.prod.outlook.com
 ([fe80::4186:14db:2be6:5f3f]) by BN9PR11MB5257.namprd11.prod.outlook.com
 ([fe80::4186:14db:2be6:5f3f%6]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 06:26:47 +0000
Message-ID: <ae716e09-1329-4f0a-a9df-0226ab7cdfc3@intel.com>
Date: Wed, 30 Sep 2026 11:56:39 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/guc: Let xe_guc_ct_send_locked() callers reserve
 G2H credit
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20260929050342.221789-1-sujaritha.sundaresan@intel.com>
 <arv/3gSXMjVFC0Fq@gsse-cloud1.jf.intel.com>
Content-Language: en-US
From: "Sundaresan, Sujaritha" <sujaritha.sundaresan@intel.com>
In-Reply-To: <arv/3gSXMjVFC0Fq@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0200.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b2::15) To BN9PR11MB5257.namprd11.prod.outlook.com
 (2603:10b6:408:132::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5257:EE_|LVXPR11MB9756:EE_
X-MS-Office365-Filtering-Correlation-Id: 7afd9b4d-9aff-42e9-205e-08df1ebbcda3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|376014|366016|11063799006|5023799004|10067099003|6133799003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info: pgdLYh9VJWzLE5n4BlcaXB4h+ktee53i+2d8agCzJ2Ql7HCm16lAEHEmH8RQLC3K/nBXMFcbhXZsXP79GHGRBao1yLVo9GzFK6wRo9YiCDQAquJ+UrH9KKZ3Apcs6IV6KjLJU5lPssbY51pVY3OKa436qSxJkI0UGX13IZ8vts1tg2brNM5yCroZN3h0yApe5c6gKoxxYl2hYgWVcDTJh6BhbMVBnBIWEJ22q7ZdgybL+BBQ8577R8vCpK9yhZ6eP0EYZxW1WvpY35jJUG3MCM3oL6TYyHg0qeojV0gahRhwGzCNxqMj4bgH6Bc1jXYmr2rLIoQVx6OyYX3aelJhaThB6s/sdhDwkUMABZ/takCdi6IEJhmmQbNh8G29M88VVAzqGtX9lzh1HUTPoFQps59W1WkamtqkANA4E5satUG7YsJtStCVurSTrRJoGuNaz03FhBZtQR/5T8jD84z62sjlAAx5UqZe8LHpqzE9UcGamwZi9e1eJU9qXhRdMOk3nz/e4tHMRsdLfDAZX3MABATlf2CI+JerzDRS32aC0altKpYKN0e4KEtsIeMz3x6RTt51N7yfogspj2oodhfjHqpy1j5OFBhpGSUbhmdkkE9BT/FLTqBuNn3xs2R/60yJm2hnoJuMxSTeAK3oLAQcqj/523Hk7z3X52c5our58hU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5257.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(376014)(366016)(11063799006)(5023799004)(10067099003)(6133799003)(56012099006)(18002099003)(22082099003)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhFZkZwUXVRcVZkOE9saVFxT1BLNUZFVGdqMC9KSHJ0cGpBbmlOM2llL1RG?=
 =?utf-8?B?R1FURlRQVVpHR3dwYmx2T2d6Q1ZoMFhPUDk5c0xKOFhHVjRiWkdzY3FBbjZU?=
 =?utf-8?B?THc3RnFEQWM0VXlwTklRZHdPdnVBQTFIWllNRTZFQXB4djJPd1NCRWlSbmV3?=
 =?utf-8?B?K01MWmxCRmlQcCtXb3FGd3NZR2N0MjNoWDIweXVqWVRxS0JuVmYvQWxwSnZW?=
 =?utf-8?B?RU9EemN3TWZ2L1JKQ2w5ajdqWU5VZzh4SG5kN3JFcElSZ3RnZU54VE9FVmZJ?=
 =?utf-8?B?WGFjTEtlY0VNcThHb0MzNlEzWkVOYmdUVis4c0dMOFhBNjdNWW0zM0FvdFkv?=
 =?utf-8?B?L3QxQTR2eDUzKzFpUTE4ZWp4eDloZHM0eEFnMld4MnlDUC9PVWd2UlNKTG84?=
 =?utf-8?B?ZWJFU1h4S0hjQXRUTzhoZ2hWME9nZGdveWhZTmI3QmZxTzRRTGdxWGlSd3FE?=
 =?utf-8?B?ekYrTHJVSExBM3pidTRZTGkraGZjdUs1ZVUvcGlwR2J1djVtK29jbzY5YVZM?=
 =?utf-8?B?dUVnQXFPbU9maGNKN0RxdGt3RlZENW9LV0lERG1MYkZWZmdZSmM0QWZ5N3V6?=
 =?utf-8?B?K1FwL2tpYUQ2dm9iWDcrYVU3OGRDYU00SXlyYXM1eHUwU1lqOTZQRWFpK2lz?=
 =?utf-8?B?Ny85UnJoNXY3blhYWEJPejg5UWE4V0V1RlpxbGhONmdNeGFGVEJsRkN1SXVY?=
 =?utf-8?B?VEZSei8xVWVBOEwwVTZHTFlGK05LbW1INXpYbk9RV3NLWk92VzNwMS9tcE83?=
 =?utf-8?B?ZllXNjdXd00wcEpvMVptd2lhL3BwdnB6ZjFKaVYwTzBUak5ORHlOdTJ1TjBQ?=
 =?utf-8?B?QjZzOS8xdSs4MGRNMTBCbThrbWF6T0ExSk56YkN1UFJOeGRaSDlhbGlyMWVM?=
 =?utf-8?B?dEhtVEF3aXplMmg5WVdDdC81U25UZlg4c1hOTFh2QnNCS0lBaWpBUzNzY0Zz?=
 =?utf-8?B?WjNCMTN0MHJIMjVlRFJNUnhMQzBRaFZnenNXZlpVcVZLNEYzWE04WWJpUmhr?=
 =?utf-8?B?Z2FkVzRqaTV0Y3JlMVV5VTlBK3pTNXVHSCtsMTFBL3E3eFp1c0RvUEYwWElF?=
 =?utf-8?B?TXZoK2poTmkvTDlVVkUzU3AvVlBqYjhRWVYxck5BSFlDWHZkYXRuOFkxMW1E?=
 =?utf-8?B?WGpJTmJhcSt5UG4zSSswNkZBUjVEd3RoVkJ2N1F0c2pibW9sdWk3ckorT1F6?=
 =?utf-8?B?dC9NcDBQSGNUWlZMZkl1b0xleHFYN01LSGl0VUFoVHI2cURKR2o5WnZ4b3pT?=
 =?utf-8?B?bmtSaXIrK2ZwOUgwZXZkMXRReVlRZkhMRzFtSWJXajJvQVpTZXIxeU1IRXdp?=
 =?utf-8?B?dDAvc2xjdzA2Y0ZuN0w3RTRxNVE5emxzUEI0WjhmT2RzZlI4aVBYL0RsWXFw?=
 =?utf-8?B?VW1KR24zN0czUldkN25sbGhtL0RJU0d0dU1Sak9hcUltYkNYeHUyeVBSZnhj?=
 =?utf-8?B?ZGwxNENkRmJNUVdsOHZOVTFRUUhBdDgwaXJhQ0o0Wm96Y1FidnJKTkErRVUr?=
 =?utf-8?B?dEVtdTYwTTgzM2FyaUN3Z2xJZ050UTJ3bTRhTmdBSk9TNjR1L3R4UHZ6SU1n?=
 =?utf-8?B?cmI2T1RWbUc1VzAxUVpBeVBOcTk0WHo0M0hWUGU3eGZKS1crMW1zK3hjUUhV?=
 =?utf-8?B?WXNvMkpaWFJGTDdBbnM1eXN1RlliMzZ4RWFFNTJlSE5KeFlmampSZldjZXhK?=
 =?utf-8?B?U0w2REx2RHRGaGFnQndiZXRHclgveTJKbzJmc2xjWjVteG1UcFBnT0FYMVRL?=
 =?utf-8?B?V1FPZHNpSFFtRW1hb3RYcGhqODlGZnVoQmlabzJyYmtUajNpSXRBc2FENm83?=
 =?utf-8?B?d21IaXVUT29wREJpRXJoM0FKTzB1bWVVVUFvQXNxV1ZGV3YvZ0ZkblAyRzNW?=
 =?utf-8?B?Zjh4Njc2dXhwZ3gzK1RlREswMENha2FhTytKRG5lVHVhT3BWMUtwNm5oNEdq?=
 =?utf-8?B?ZXRLYWI4RmV6bTRPMzBBWjVIODUzMnd6eklORU1UdFJjZGhRcWMvNHorNUl6?=
 =?utf-8?B?d0p6dk1NOFEyeHBXejVvaytodGRIdUJ1a2hMNDNtaS9vcHovL2hFUnZtZnFo?=
 =?utf-8?B?SEFvT2thK0lnWHNqZS9iVzVhbGYvN3A5dHRhM283UzdOSlV6cGFhVFlRcjE5?=
 =?utf-8?B?eUhOZnJVazhrdVdSWFFVSTFuc1lZL1dxVHFqMmdIZjNRcXF6YmNNbUVvV3Nk?=
 =?utf-8?B?WG53QmtLNml6aWgybVIva3NSOWdzS0MxQ0tBaEtNL2FjTFlselRWUXUzYkZU?=
 =?utf-8?B?bERnN1FDUlhqSFl5WGF6eXhMT3BQVGlqVm0yRjRkRmJSZGhPQ0xGMlNIQlMr?=
 =?utf-8?B?REYrSWg3MkhCUDdjWXQvVUoxNXR4WHhyZlI0Q1A1K0tpWm1zQXdPejhxQmNh?=
 =?utf-8?Q?zR6uVBESv+0z7eHA=3D?=
X-Exchange-RoutingPolicyChecked: d2KtN8f5q3yUFGL7JinH6CqrVhL9fPhoLr9F4eMq3M8yR/pGUg25GZGOtw6p3x0At+no+zWDIRnDSTx/re5T5oGbDp+9F18BOu1dN8BHea94G07BkOmRYQGMMhsvq6ej5JeyHlk+MMBAM94QeEd/T9Y+BTOnbQgnfhONOMq0VJ4nYduAiMeEjxErSRWR4KXiF6XM7/bp61dlTdrq/9FVBBAXBys85gtz4LaJ04BF1CdoLTEft4bmN/hCKL/kKPP5rnY1xrvUwBxvCBC7RfVa1nboj4kKiuE8zE9CgK4oyJjHIBSjk7I8EBdfldW2C2LfWiIcjtboBK+uXHg/cBRJjA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7afd9b4d-9aff-42e9-205e-08df1ebbcda3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5257.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 06:26:47.0826 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HIumdUZH0VbJeHsApxQHVZdtdAV5z6uiLsqIg8rEzaxblyAKIPc4hNCGYmHorsmbwp7vhVT8wjanTtfJ+OHTebzIC5XuBb0VPkQQlArlmtE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVXPR11MB9756
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


On 9/29/2026 11:43 PM, Matthew Brost wrote:
> On Tue, Sep 29, 2026 at 10:33:42AM +0530, Sujaritha Sundaresan wrote:
>> Commit d4a7e1611716 ("drm/xe: batch CT pagefault acks with periodic
>> flush") added a defer_flush argument to xe_guc_ct_send_locked(). At the
>> same time it dropped the g2h_len and num_g2h arguments, which had no
>> in-tree users, and hardcoded a zero G2H reservation.
>>
>> That leaves no way to send an H2G that expects a G2H reply while
>> already holding ct->lock. The G2H receive path (parse_g2h_event() and
>> g2h_fast_path()) releases credit unconditionally for replies such as
>> DEREGISTER_CONTEXT_DONE, SCHED_CONTEXT_MODE_DONE and
>> TLB_INVALIDATION_DONE. If the credit was never reserved,
>> __g2h_release_space() reports an "Invalid G2H release" and marks the CT
>> dead with CT_DEAD_G2H_RELEASE.
>>
>> Replacing two u32 arguments with a bool also means a caller written
>> against the old signature can silently change meaning when the two
>> reservation arguments get merged into one: the call still compiles,
>> still sends the H2G, and loses only the reservation.
>>
>> Add g2h_len and num_g2h back, ahead of defer_flush, so that the
>> function matches xe_guc_ct_send() and forwards both values to
>> guc_ct_send_locked(). The kernel-doc now says when a reservation is
>> required and that a non-zero reservation must not be made from a G2H
>> handler, because waiting for credit can dequeue G2H inline.
>>
>> The only existing caller, the pagefault ack path, does not expect a
>> reply. It passes 0, 0 and behaves exactly as before.
>>
>> Cc: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>

Thanks for the review. The CI failures are unrelated to the changes here.

- Sujaritha Sundaresan

>
>> Signed-off-by: Sujaritha Sundaresan <sujaritha.sundaresan@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_guc_ct.c        | 17 +++++++++++++++--
>>   drivers/gpu/drm/xe/xe_guc_ct.h        |  2 +-
>>   drivers/gpu/drm/xe/xe_guc_pagefault.c |  3 ++-
>>   3 files changed, 18 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
>> index 5c393aa29de3..da5ce97484b8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
>> @@ -1290,11 +1290,23 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>    * @ct: GuC CT object
>>    * @action: payload dwords (HxG header dword is expected at @action[-1])
>>    * @len: number of payload dwords in @action
>> + * @g2h_len: G2H response space to reserve in dwords, or 0
>> + * @num_g2h: number of G2H messages expected, or 0
>>    * @defer_flush: defer publishing/doorbell for batching
>>    *
>>    * Sends a single H2G message to the GuC CT buffer while the caller already
>>    * holds @ct->lock.
>>    *
>> + * Callers that expect the GuC to reply with a G2H message must reserve the
>> + * matching credit via @g2h_len / @num_g2h. The G2H receive path releases that
>> + * credit unconditionally when the reply arrives, so failing to reserve it here
>> + * corrupts the G2H accounting and kills the CT channel.
>> + *
>> + * Reserving G2H credit may wait for, and process, outstanding G2H messages, so
>> + * this must not be called with a non-zero @g2h_len from a G2H handler. Handlers
>> + * should use xe_guc_ct_send_g2h_handler(), with any reply credit reserved up
>> + * front by the H2G that triggered the handler.
>> + *
>>    * If @defer_flush is false, the function completes the submission immediately:
>>    * it makes the payload visible to the device, updates the H2G descriptor and
>>    * rings the GuC doorbell.
>> @@ -1312,11 +1324,12 @@ int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>    *   Must be called with @ct->lock held.
>>    */
>>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>> -			  bool defer_flush)
>> +			  u32 g2h_len, u32 num_g2h, bool defer_flush)
>>   {
>>   	int ret;
>>   
>> -	ret = guc_ct_send_locked(ct, action, len, 0, 0, NULL, defer_flush);
>> +	ret = guc_ct_send_locked(ct, action, len, g2h_len, num_g2h, NULL,
>> +				 defer_flush);
>>   	if (ret == -EDEADLK)
>>   		kick_reset(ct);
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.h b/drivers/gpu/drm/xe/xe_guc_ct.h
>> index 3ddc665ab84a..e2a33249d65d 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ct.h
>> +++ b/drivers/gpu/drm/xe/xe_guc_ct.h
>> @@ -56,7 +56,7 @@ static inline void xe_guc_ct_irq_handler(struct xe_guc_ct *ct)
>>   int xe_guc_ct_send(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   		   u32 g2h_len, u32 num_g2h);
>>   int xe_guc_ct_send_locked(struct xe_guc_ct *ct, const u32 *action, u32 len,
>> -			  bool defer_flush);
>> +			  u32 g2h_len, u32 num_g2h, bool defer_flush);
>>   int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 len,
>>   			u32 *response_buffer);
>>   static inline int
>> diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> index df237fd40551..6b48550e7579 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
>> @@ -55,7 +55,8 @@ static void guc_ack_fault(struct xe_pagefault *pf, int err)
>>   	bool write_only = guc->pagefault_ack_counter++ &
>>   		(XE_GUC_PAGEFAULT_FLUSH_PERIOD - 1);
>>   
>> -	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action),
>> +	/* Pagefault acks are fire-and-forget, no G2H reply expected. */
>> +	xe_guc_ct_send_locked(&guc->ct, action, ARRAY_SIZE(action), 0, 0,
>>   			      write_only);
>>   }
>>   
>> -- 
>> 2.34.1
>>
