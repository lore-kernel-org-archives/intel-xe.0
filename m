Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45BA6CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 21:26:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09BC710E0A0;
	Thu, 11 Sep 2025 21:26:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m5fhy7qv";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 768D310E0A0
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Sep 2025 21:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757625977; x=1789161977;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ihxmlElIdMWbefv7RDT5aWTFBrd2t2MerOHRFIHEgvE=;
 b=m5fhy7qv7fCaGvgBeUtwW+HNFGio2QK2guqITvlV9z5c1+2nLC0zQswy
 jukPbdf3YvF9puBlQsQrKYqCOHqLCIr1owR78WPpy3NmsnWwE2oAFIkEa
 j+A8ZTr1CNA+LF4m04JNOo7dH1Mb44mk7cLiXPu3nEnEZnjmCBUO5a0i5
 9MV6jW01O0y443mSFl37GIhW9ZGoa36hNl/ayB6F9F2C2/6S9Lb5rS1io
 XmdGaaGPp4Knz8YmWthaBokwBhiNih6whwJ2jNPCam7Z6jAkcdWifS0db
 dNx8PhmlbNJqVAAWDrrqXr/8dMyhrx687lhJpXsN2hM497ohO/yIe7h9j g==;
X-CSE-ConnectionGUID: 7QBFziEwQYqG2FdaBPdqew==
X-CSE-MsgGUID: eI7mnZeZSV+fSClP61jmpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11550"; a="70658498"
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="70658498"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:26:17 -0700
X-CSE-ConnectionGUID: 3IBi8SVYRD+u+SUOSdDf2g==
X-CSE-MsgGUID: 6e3f+misS/qBC/bB1ClADQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,258,1751266800"; d="scan'208";a="178988650"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 14:26:16 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:26:16 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Thu, 11 Sep 2025 14:26:16 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.88)
 by edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 11 Sep 2025 14:26:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l0toFNxXut91i1QG9LX7R0jjVR2zOf0Cydj6+MgMWWxG+pyd1+mcyCQm/y4u3G4s0j/64b3t2zppeUdecS4Nkz+0lkLojoD/l3ze+ghmGcq+J8dScK5IG9QhC9JCbnyTsMGG/Ll6i0nBtRicLxq+9IXe6rJseQxxe+5AtyF5bf0paukfAVhFzTWawJY5wG+FcgULiylP/8Mji9eTW4UVfvnLZD7QtQRloAAynybJuUp5Dtdo3PlRb8rtUSYM4zCok3k+VMU1EnX5KgZnBUwAHW8m6e0QOisxRLSU/M9VX/G/8sTcPCJ4KrGUDhfiM465Z16hHmbL/hF3LsHB+kWp0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImHV+qlJ0GhLf/47+PXhgxdAeO4oZ7nn+D2R3oLMPjw=;
 b=mcYGC29aixglIgYGu0T+kYZ4qPQxD32mdGxocWsBDeeAkNw4CqmMNxCMgRZoupzsyaeypXmIyLGZg2meA++rWKLwNqscbP7VnLHUIdG7OvheluLGkIoGTwdwzanZOBtgGkAABtA9TMIgHR7PPTYLcR/pO12SidBPRpIh+NyYxa5JQUT7g0I6eFECzTb0FNeC6+I1P32FI6ozHNMjZzrAZ41bV0j5foEr+ntsLvwS0Bc0UdwU9bPXWYsh+GGB/yWBbELdxeTeetFh0/l+9k2StHFvowf/4Yk+WM0fTXqxrehUuNuINClBXYMNISWA7Ru0GYACbzECEIqQgi11gjTsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by PH3PPFD01EAC3BA.namprd11.prod.outlook.com (2603:10b6:518:1::d4f) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 21:26:13 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%2]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 21:26:12 +0000
Message-ID: <a4a6351b-ea2c-46d6-8d0d-506dfddb06b9@intel.com>
Date: Thu, 11 Sep 2025 14:26:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Fix circular locking dependency
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>
References: <20250911212024.966757-2-rodrigo.vivi@intel.com>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <20250911212024.966757-2-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0340.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::15) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|PH3PPFD01EAC3BA:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8a2429-780b-49bb-f58c-08ddf179d547
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QnZURUFWbml6V1YrUS93dVBTUkhPZCtSRWZZZWpLcERHSmY2czBaVVhDUDl4?=
 =?utf-8?B?VXROencrZS80UjNPV2VqeVA4c3pIYVMyNU5HeTduSVlsRW9VMklvYlk2bDBN?=
 =?utf-8?B?WlhLRUQ2bWkvVUtXRG1FYlZNQUg3aDdEdHhLYUZjZkgvQ0NlY0g0cjVMUkd6?=
 =?utf-8?B?a1RWWGo1cVNxdzJyWTI2L2lHaURzWERWZWdSMFh2VlJVT05iYUVxcnp4QmJD?=
 =?utf-8?B?Vy9Ic3k2dDBhRFhJaTZBZVQ2a3oxR1RGVlVrbzNyOG1YQ0lqVVU1UUUvS3pC?=
 =?utf-8?B?QWdUZWYvbGFJUWdCd0MzUnZoUEo0VlEvZGV4WWJTUVJNMTFnckpEcWhITDUw?=
 =?utf-8?B?NkJSZDRORTd5b1d0Nzd5NFRQQ1VvNmFkSmxUcTU5cUQwNzlnMkJReTVvd2RY?=
 =?utf-8?B?ZmJnQkkvbnhqaG9HTFNzZmhvTUdGNE9qNUo5L29CYU1yMnBFb1dNYXgvMVRz?=
 =?utf-8?B?b2ZuM1hBTno0NmFSTW1rbjFjd0dXMXphUFFqMHRPUkZEOElUeDZ0ZWh3bmdz?=
 =?utf-8?B?bC9icGVTVkZBbTVZWCtpdjkrMWRYeEVsLzlXOFQwd0kzeGxrM1RYZEJNVi9u?=
 =?utf-8?B?aHpsckV5dGRhNGozSEJnRVFVSmJwTkQzTGRKT1hHcGxjVGZicmE0dXBFdGJ6?=
 =?utf-8?B?ZUVEZDdQZUQ4cXJtMExXaUxmRlB1clJFWjF4L3l0eFduS1pJVk1ML2VlNndy?=
 =?utf-8?B?eWdXMmZ3K1N5S3lIU0t1U2F4U0tGRUFIQ2NmK04vM2tETHlLbnpYMDQySXJQ?=
 =?utf-8?B?SkE0NDNqcFFUa3hseG1NOTB4ZUZCZmVueXpQaW1Hc3ZlZkJSYnZ1THMrVENm?=
 =?utf-8?B?U3A1czc0eWRwcjlPMHBxS3cvQnVzOURaYzA0QitQTnhYbWlXTlhyUS9mcmEr?=
 =?utf-8?B?VVJUZ2dzb1FTR29xaCtTQUNBLzVLWHJpSFBUNmhaMnRzNldpdGRKcFZyaVlB?=
 =?utf-8?B?ejBReUJ3bC9IMTFSVmJoNEErQjlCN3lLb1pVVGl2YndoNVI5Yjl2K3ZtRXhV?=
 =?utf-8?B?eVV1bS93YVpBcmJXV0ZkSlpnTWxZOEIxVHZubkFIcmZyOEhJYTdlQ0EyR203?=
 =?utf-8?B?akJCTzlVYktVbGpWYVJvd2xST0NxQmh1N1JScS9RUDg5bm0vYUFZTWRVNEx6?=
 =?utf-8?B?WTVaNFk3dlhLY0pOdXhlRnFuUmNuTmkwenhHS2NVRGFLK1NkdXN4NDRVTGVu?=
 =?utf-8?B?UzR6Y1U5OWZycWd5b2JzRlNLRTRhczNxUEYwWHluRXJUYXZ6L2pMTVBKMjNx?=
 =?utf-8?B?L0QrWTBCMHU2dkRhUXhjWUk3c20vby9EamVSRlBmU3o5Ry8yNXJ6ZEZXdGVW?=
 =?utf-8?B?MW1LRHR4WjkrQXhFOUl6UGFvQXFtZ2VENTBMdEc1cEpLUSsrWm05eXExclA2?=
 =?utf-8?B?RUorMVVxbkZaZ01pRjZDRmoyVHlnMlJFY3NMMXJ3MUhiTWdvcUlINXUxVlRY?=
 =?utf-8?B?NWZhM0VRVDEwcnVMWFlpYjFiRGVibFlKcEN6VUczbFhyQVVNMk1DSXlETjRH?=
 =?utf-8?B?U0oxQUQ3cjFqUHEzeHg0cXJWQ0M1bnZ2UUUrVXdlVitpeExCR2krMmZSMlVP?=
 =?utf-8?B?T0N3cDVNV0pXNWdUc2d0RjlLVTc5cHVjSEpVMnFUdmxHQXJobjg3REJ1ZWYy?=
 =?utf-8?B?NzNBL2tscDdQbHNGZ3BBaUM1cEhjQWllVFVsWlN2QUk0ZjAzSkFQbWhuWk9M?=
 =?utf-8?B?VWlsc3VlVmRrSDFRZ21keVZvaHlsWnhXSzVuVkY0NHhOWXlNVW8raGFpMDV6?=
 =?utf-8?B?YWxnR3VZRm85NnIxdi9NQUVRWHJrVHJTZU9TRWhidXh0ZTlIbUxuMDN6dElE?=
 =?utf-8?B?Z0RiUTNKRlkwcnZJZnAzaTl5NlFtdnE3MFVoWkIva2xlVnNyZEdQNXVFRkVQ?=
 =?utf-8?Q?2dQE1xpaIbBIz?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDJjRitXZ3V4bVhwMkJkcmZkVUl4VWxzcUtjYkZ5ZmZpcGtwamhQV2JWZnJl?=
 =?utf-8?B?UnRkZzMxaHo5QU5Nb2NKb0ZRVTU4b1dDMkIzOGd1dFZkU21tY000U2VqaDhR?=
 =?utf-8?B?SzZHTlI5ajJQRjdtSUw2TjN4Wms0bFJhbTVVT2hIUERtcUpLZ1ZIQ0tHa0Rq?=
 =?utf-8?B?L3h3T2NKSXN2U2puTlJDNWttWTVaTEFxT29aOEFDeUJJTS9kd2YrMzJDekhX?=
 =?utf-8?B?M3c1cFZBSEJyYWxWdXhCekl5b0htNlRJVDdBdlFnbDEvU2Q1YWVmeFkzbG0r?=
 =?utf-8?B?dEpnNzBpM1Y3VHArQkZoUkVRK01mRjlFcXdVMWJtMEU4OHVYclBteGxPK3Nk?=
 =?utf-8?B?R21sOU8zSG9iZU10M0NXREs4TURWNDRBbDB6Y21zLzV3Z0tpeVk2UzVXMDBQ?=
 =?utf-8?B?aSszUDRXQ0hmMVd6aStpbDhmVmQ4ejlSTklkNGp0NUtXZytmc2wrM2c3YTkw?=
 =?utf-8?B?L01hampkODlicjdkV2VwdTRzQmo3ZHVBdll2Q0tCenJuVStCcHR0OXpqYk5S?=
 =?utf-8?B?cExsaFlnOXo2MStsZFIzbDFSdUMyREc1TVpYUVR3TGNnVkdJeVlNN2pMc0pu?=
 =?utf-8?B?UTUrNVZjYjJRclpZbGVVZWZacXBkdEZUUW5xYTNMSEdLQ3o0eXhsVUk2L3BL?=
 =?utf-8?B?TVRaMGFhZGQrWkFOcEJqZUd5YlRJYkNlbVcyWUtyL0c4VGtZdjhBMmZTZEJ6?=
 =?utf-8?B?dEFCZXRDQ0g0TWdjWWVlTjVBRVBGb3FMWGxzemJpQm41TDVYWjhLUHpJZGk5?=
 =?utf-8?B?ODY5N1VHQTNScjhDbHdheHRTT0VUTGpHVm1US3RqK3hmelpRcCtvaWttUEJF?=
 =?utf-8?B?c05iQWlwclhCOUE4K0NGalM0MzR6MWQrcHk2YURRZXdsK1Z3TVl2UTNLQS9l?=
 =?utf-8?B?Q2dVN2FBWGFrK0MrSGRQVVpaRlE0RFUvczUvK2w3OFdIMnVsOXE3ZWZCR05V?=
 =?utf-8?B?a2hKQWNvOUc5ZWlqMzFsc1FCSHRIeVlLMWVYd3ZBQlN3WXhFbi9pRy9DVDM4?=
 =?utf-8?B?MWRLV0hZWjNkdlJsVjdHa1l4RWRDbFFuVDAwMXpVN1k1YVJFeWlQL28yOUpB?=
 =?utf-8?B?L2V4VnpRN3J1eVRGTFdqMTBVcDlUaUlVZTRtdUpqVzdXZmYwbEVDTnZMVXU0?=
 =?utf-8?B?WFFBVVdKOWJtRHlPWHpEYzlHbnNsZ3FDRkIxaS82a212K0M3QjlXVGFCQWVF?=
 =?utf-8?B?WnVFckJQcnVpazJGd1VpWnp0RjNrdk13NjEvTzB2elo2RC9CQTdiRVd0TUV3?=
 =?utf-8?B?c2tLZXZhdE9Yck40Nk9VUUNMWWpuSHBPM0djakR6ZTlOYkRMWnc0U0hldDBR?=
 =?utf-8?B?ekdVNW82cEpIMmtuSUR2TUJmTjZsZ0ErZ3lsdDJ2WGRaTmFBd0pnY3pvTzJv?=
 =?utf-8?B?SUxSRTV6eGpXSnNoZmxManhieWo1VFl2WjF2LzFUTVUvWGZvMTdRaldZTEFp?=
 =?utf-8?B?ZGxTcXVxWnRLV1AzODBacEJTcTkzMUFCZ1FVS2c4YVQveHZ6RVBobHhraWNR?=
 =?utf-8?B?NHlnQk05UnVKWjhxRzJzV1NJbWlZY0U0dU9VdFBFUS9OblNoNlRsdTRHM3g0?=
 =?utf-8?B?K1J1MWdBQTI4a213eE1xRU8vaGZJeFN5TnRDUFg4elNBQTY1aU9zc0N4MnF0?=
 =?utf-8?B?N3M0Z3NiSVFpeVYrTGFoSXdoOTFiQ01OMGRnWDFlMDNmaDJYS2IxaGZWOTNN?=
 =?utf-8?B?UFNHbWNCZmRPMm1mT3RjNjlBMXhZSXdnVWVWalkzTDlITm9lV25KTEVtK1NL?=
 =?utf-8?B?SmdqS2o4emNTbGtCaUtzTzk2RW9kZHJ4K2hPaDk4WTVlNVUzaXNyMzYrYXl0?=
 =?utf-8?B?YmhZaEJpSUpBazJjVWd6eUFwV2ZIaHRUTkJaSnlEMDZHUW5TeUZ1RVpPMFg0?=
 =?utf-8?B?cmZPRFEva1BpOTNqc2tVM25hN1I0NW4wSm5FOFViU1NXNFV2c3RvdkdrVExN?=
 =?utf-8?B?cDQwbjRLZ0JzYWVyMmVVUDFZNmpRanhFZkd0SkFKTjF3MW44Rjg5dW5WaWd2?=
 =?utf-8?B?R05iZlFSODE1R0RWdkwzMDFDSTJxcWpnN2dLMUswRnQ2MVdrSVVtWTd0bURN?=
 =?utf-8?B?VWZKb2pxOXNFL3hjUVJYdmg3cUgreHZtcGJZWmdLWW1vUmErR2RhQXFaRlJZ?=
 =?utf-8?B?emk5MlEvWEJZeDBkNDI5em1QUzZvQ0hSdG9PTytYOFRuY2VxUWlFRml1YS9S?=
 =?utf-8?B?K2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8a2429-780b-49bb-f58c-08ddf179d547
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 21:26:12.9059 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3tSoIZnEkTnIEr6xH0ULnDpsQrVGZLBuGhcbe0EhqBhykJ8qWPfDYzisiJqm8ZezTcNObeO1wo62s6nZTnqcXtQkzxBw6LDrVAH/PPf7DIc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD01EAC3BA
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


On 9/11/2025 2:20 PM, Rodrigo Vivi wrote:
> Fix this:
>
>   ======================================================
>   WARNING: possible circular locking dependency detected
>   6.17.0-rc4-lgci-xe-xe-pw-153723v2+ #1 Tainted: G S   U
>   ------------------------------------------------------
>   xe_pm/11324 is trying to acquire lock:
>   ffff8881085f22a0 (&pc->freq_lock){+.+.}-{3:3}, at:
>   		  xe_guc_pc_start+0x39f/0xf70 [xe]
>
> but task is already holding lock:
>
>   ffffffffa1020420 (xe_rpm_nod3cold_map){+.+.}-{0:0}, at:
>   		  xe_rpm_lockmap_acquire+0x1a/0x70 [xe]
>
> which lock already depends on the new lock.
>
> Possible unsafe locking scenario:
>        CPU0                    CPU1
>        ----                    ----
>   lock(xe_rpm_nod3cold_map);
>                                lock(&pc->freq_lock);
>                                lock(xe_rpm_nod3cold_map);
>   lock(&pc->freq_lock);
>
> Reported-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Closes: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153723v2/shard-bmg-8/igt@xe_pm@s2idle-d3hot-basic-exec.html#dmesg-warnings335
> Fixes: 60d2b7899142 ("drm/xe/guc: Add SLPC power profile interface")
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c | 2 ++
>   drivers/gpu/drm/xe/xe_guc_pc.c  | 2 +-
>   2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index 781e4890fb26..4ff1b6b58d6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -246,7 +246,9 @@ static ssize_t power_profile_store(struct kobject *kobj,
>   	struct xe_guc_pc *pc = dev_to_pc(dev);
>   	int err;
>   
> +	xe_pm_runtime_get(dev_to_xe(dev));
>   	err = xe_guc_pc_set_power_profile(pc, buff);
> +	xe_pm_runtime_put(dev_to_xe(dev));
>   
>   	return err ?: count;
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index 68a5bf8e3946..53fdf59524c4 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -1215,7 +1215,7 @@ int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf)
>   		return -EINVAL;
>   
>   	guard(mutex)(&pc->freq_lock);
> -	xe_pm_runtime_get(pc_to_xe(pc));
> +	xe_pm_runtime_get_noresume(pc_to_xe(pc));

LGTM,

Reviewed-by: Vinay Belgaumkar<vinay.belgaumkar@intel.com>

Tested-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>

>   
>   	ret = pc_action_set_param(pc,
>   				  SLPC_PARAM_POWER_PROFILE,
