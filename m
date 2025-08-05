Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E9C87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 03:11:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0560710E013;
	Tue,  5 Aug 2025 03:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGf0E0mJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECC010E013
 for <intel-xe@lists.freedesktop.org>; Tue,  5 Aug 2025 03:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754363492; x=1785899492;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=4RC8PfQhfgmsWbbgqDZsMGfhzuOcqgvYqzD6TogElhk=;
 b=mGf0E0mJskMxIo3cjmUIM3Td1JIWeI5KBCMWsGTTNO/ZhBgbM5gJNgH5
 iZyfnYCMZ0vFG7d24zF3c+spMcWNyBkQBYn1Rb/q/elHuCaxDlPzSAfQK
 GDyslTwwDZ/8q/WYAXfdWbEGTEdqPUcHgc3npcIftuvlkKi9PgCiktUid
 kH/UvEcc6gluFUD1CJT1OBQ4DdU937a0w37cIvTeX9BXsT1kkO3N33h9M
 bjdDOxlkSGADGJO8+fwHpaLkGXbdgBRpy9UpSVz4V3Qekr+EDQ3ZrRfAD
 VY0cOJJVT/lxHU9i52Aj56uXzfNAnTeIYK/57uoS3ITtuwr0/4WkyJ8Ux g==;
X-CSE-ConnectionGUID: v+FdGR7bRhqlgvyI2sBRAw==
X-CSE-MsgGUID: /um0MyOeTpiq8BiIViA4vQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="68013103"
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="68013103"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:11:31 -0700
X-CSE-ConnectionGUID: vAuMP1VQQkWcExBrh9ha5w==
X-CSE-MsgGUID: eZzGetaRTdCp44a03x8b1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,265,1747724400"; d="scan'208";a="164635596"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 20:11:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 20:11:31 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 20:11:31 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.42)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 4 Aug 2025 20:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZEqdu24zzw3ucU9Uo6V4sSL+YEyfUoLgBcvUlEVsktwqrmY1G+8zHUYBSjL+nKhtJ3KlIZMDuAkyLJM1OZWxQybvr9ztoW6a79xc3nfYdE/S9qjgwHXXp78pJrlCYLP6HvpPKsIxd/lXba+iDfcXROSvHvzaxWglTi/wv0ct6E4B+Ml51f1+Via6sg1A18/U2aZU2i9lIISiU2Js7Ah3lTt2FRIkRnPGGzxWwiISiCcy+C8c9ORV7dwk6Ca6WdaNcz2OlvoM14VZLzU1cjpjh/GYRzo9zWilzujRn/PMsvGsvz0l/zenyXvcH+l3Ipw0zRDLlMHH/Jo40Fr7SmTZrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uIZOOQSvituw0VqAQpB4NlKwaVNzpWeTjWf0z/Rys9Y=;
 b=H97nPHuplj/+MW0/vcPkory+x9dIbCvUIMU9NhGF35N4+xFXyshm7oTPkHWm4pLHbiOaUBsNnRNYr4DF/PkouwR44eHOD0AfW7aPosJAdpNXvWB57vg7AtRjaN9A6D8XjSadP8lccZO6x6WK/E3nZVOAlBsDdhkbuwbML3PsawU2YizqqAdEUOhup38VMQM2vo4bT7kMgScWOWIdqyfMxddzvJz8ybVVJqQHQ+FjCec4oEVysOeUB0GFymEl5V206XXFfr5pz13ZnhmGK5VmRxJoO2nRvGTgK0ug0owAt6rX/jkh+VRTDLMVr1vOedGxrml/Rs3VDtamb96vDzrHZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH0PR11MB5878.namprd11.prod.outlook.com (2603:10b6:510:14c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Tue, 5 Aug
 2025 03:11:28 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8989.018; Tue, 5 Aug 2025
 03:11:28 +0000
Date: Mon, 4 Aug 2025 20:11:25 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2 1/2] drm/xe/vf: Refactor CCS save/restore to use
 default migration context
Message-ID: <aJF2XY6TcVkZj0Y3@lstrano-desk.jf.intel.com>
References: <20250801132441.25463-1-satyanarayana.k.v.p@intel.com>
 <20250801132441.25463-2-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250801132441.25463-2-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: MW2PR16CA0045.namprd16.prod.outlook.com
 (2603:10b6:907:1::22) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH0PR11MB5878:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f894057-31a7-4858-819c-08ddd3cdc50d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MlQ0d0NxSzhvdUtUZ1J4NUFqOU1Hb2hjbnY3T1VEdVBQRGgzMUgwRURhYy9E?=
 =?utf-8?B?Z2o4K0hxWHJsYm5QeGVUUTFGNGtKc2Y0dFV4QVpjbTlPNEQxUnY0Nm94Q3BO?=
 =?utf-8?B?OEI3NjlYOE1EcmhwRHhWWkhvOWdZNGFabmY4TndQclZEcERjcStiRE82bDFn?=
 =?utf-8?B?eWpPTkphUzY5dTRObk5HU1dUdHBIaWowaVZrVWczQnJkZnhIWkpST2kvQ01G?=
 =?utf-8?B?bk85R2xxcENmcTh2TmtKR0ZlTWxKMVNwRkJTcTFDS2hiNmlxbmtWRUpWQ2g4?=
 =?utf-8?B?YlNxY2ZhYnFxcEZaRE9LRUJpVDJTdU13MDZmUzlLZGY2eVVHZlRpdzVRZ3Qv?=
 =?utf-8?B?d1RTMjlPWmlPcFh5blIrMkhrd04wdTMvNU1lQnRGYTJ1TUVSZzZTVTYyR1FR?=
 =?utf-8?B?czFPbVc3dmduT094dlFUamdseEJTT2IvcTRvMnp5L0UxaDV0UlU1L3I5a2dk?=
 =?utf-8?B?SFc1OGNBb2ZzSnR4MEN1Qm9WdG9pdFU3QjMvNFVhdXo0bVY1NHc0blM3TFR2?=
 =?utf-8?B?WWtZelBib2p3Tk5jZFVMZGE5Q3NPbkRTN2Vna2VneXdWWG93c3pDSTYvWmNn?=
 =?utf-8?B?cDcxTU1ma25saEFRVnJ3ZlRXdVF4V2R1TVdvakJFUlg0THc5U3JRWXFDMlZp?=
 =?utf-8?B?cmZwT0FVREhqVVFKeFlPbExFUkxRdldSbmpTRkt3Sy9BNjZsZi9WZHdZQi9r?=
 =?utf-8?B?RzUzd3dWOFAyVXVncnEyOVhHYjVCUCtaWVFsWDUrNzN4dHlWNnZqa0pUZkVK?=
 =?utf-8?B?cDZiK0JLeWlyR3hWNnhXek1yOE1xNS9DRXdweEZEVVpHNGJBeno3NDJiRXZT?=
 =?utf-8?B?bEpkR2VZUkhhcWRBS1dzbmlSamdlaDJUU2k2SmNXRmN4YU1WS1p6RXlzWWlh?=
 =?utf-8?B?cXBocldBS2hiaDViK1F1VlJLSHFHd05YYTM4cVNqVFN6alA3WEJNbkZaYjl3?=
 =?utf-8?B?M1l2WTY4YnJVR1RONW9Lcjg5dDdlUkNhSFhDNCt1NG1PeDNFbS9YMlFTeEZv?=
 =?utf-8?B?Mko5N1F2Y2lDSXBKSFc0SjdpdXNlcEJCSmRicU1WRFE1UXZOalpwU1Z0SnJm?=
 =?utf-8?B?bUF2QWFFOHp2dU0zaTl1bFpOZzdsSmRNUVVJV0FLbDVhNkM3WDFEcmFKbHQx?=
 =?utf-8?B?UVhXNkxXMXIzWXphVUxjTm1ja2ZGLzNLZkErYlJJS0NtNVNTVC91Z3lLNVND?=
 =?utf-8?B?OWUwWkNlN25oMzJCbElSQmpMRERud0JNNjdpZjh5Rm5LQllVUElCWHEydFR5?=
 =?utf-8?B?eGUxNVFEZVV0MWVhQ1BjK0I4elFNUmZ0RFpWRkt1dVNBd29Hck8xY3R3L1Ft?=
 =?utf-8?B?ZEYyaURScW14c2FBRWU2Z282YktpVEdVY1N5MzJUV3JVR1BHRVhGQWI0UDhF?=
 =?utf-8?B?dXRaekd1YUlKZEY4ZGsxY2JBUlBic2VtR1ozRFhzRmFtTWgxVlFCb2ZrWnVk?=
 =?utf-8?B?elM3TVpHbkRhZFZVTWdmbXQvdzFpd3g2c3RtOG1WNit3Z21aQ2IrZXFXbXFK?=
 =?utf-8?B?cE90YVVsaG42NXdWbThYdmcvMjRFdE9kN2NuUnR6ZGtWQ090MlZuTzNHQ1pT?=
 =?utf-8?B?QmdJTkU0MXRzNXZ5SWtldk14a0pybkdRNUNiMG1yU2oyTVhyRmg5TFJJU2FM?=
 =?utf-8?B?QjUxR2tIcitUd1I0dHlPR1Q4OFdaS2dlU25jaEJ2c1F3c1gzaXlBSVl2bTg3?=
 =?utf-8?B?bHFGU3k5aXRzZExyTWJIYTJaOHI2Y0ZsZUt0RFpOUmViUWlvYnpla2ZsdzJF?=
 =?utf-8?B?T01PTmxSUjBBUGx4dVNIamNiZENjYkJuVk9UZkROZytJaHBrOEwrR2x1aTEz?=
 =?utf-8?B?SWxMZzlyd1RLNjFJdi9tZmtxdm5kdEpiMHg1Zjh6cTdudDJHeXpzQzZOcjFw?=
 =?utf-8?B?SWxTTTQvM1Rwb1EzK2x5VUxBSHU3TlRTMFYvbzVBNzAxaVgyVlhXKzUxVjFo?=
 =?utf-8?Q?zReWSAWIeaw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OFdHYWlsc2t3REpGckhnN2lWNnFFdi93eFZVRVBvS3puSENHb2FlSFZJZTFl?=
 =?utf-8?B?VGZFSXVGSFI4ZHQvc3JvRGt6SHJvcjhqOHdYbEFvVXRjUGFhRkVPVS95Z3Zi?=
 =?utf-8?B?ZGljc1Q4a05kS3lBMDBPN2ptbWJaTi90c0c4akx4Y0l6bTUxSXZnUC9kZUdO?=
 =?utf-8?B?UVRNOHJwZGJTNFR5QVdBVmpFWnpuK2dxTlU3VTJFeTR1YnJJWld5QXpQbGZ0?=
 =?utf-8?B?cVBFNWRLKzU0cFRyUG8zY2NaVU43MVViU3VWb3k2Ry8xSlpLeTVMR3JVMG42?=
 =?utf-8?B?LzAyVW5qN0lUUit4b1B6V0VNeHhLZXNCNlZ5aXNtYzVVeWF2dy9EWVRQTkdY?=
 =?utf-8?B?MndPVitDa2ljQWtOYWpxd0ZCblVqdStNYTlML3BJbUxsSUsySEdINHY4Z3J6?=
 =?utf-8?B?V1o2WVVhQkxraWQvc2kwRnZqWkE4cTRPcGNoV0NTem5iNkttOElOOXRjVlk3?=
 =?utf-8?B?ajFnL1JrTzRhYUlCL3FRcDlDSXcwcXRmQ1U4bnQvajY2ZmZjcXlyUzhEWUpz?=
 =?utf-8?B?UUZhcWU5N1dvWmxMNW5TVGNhaHRBSWZDanFQeEtDV3ptVEp0UFd3YU9GdllV?=
 =?utf-8?B?andWRTlYOTU4b3lNU1JsSnRiVUJCMTAxSFFOWE1uNVFESlg1d1FyaEl3TFpz?=
 =?utf-8?B?TXV4Q0ZvZGpMdTdKanFNWkxmNXNtaUFOOFBXaUtQTFlLZzJreDVMNlp4aTF0?=
 =?utf-8?B?ZGM1eGRRWm52eGxDZTI3dXhNb2lCYXp6by9sUGlDc1pkd3VlRitiVVFQenNn?=
 =?utf-8?B?K2FESVA4aXJ5Q1FYYSt6TWU3MUxZQlA0eEZ6Y3FQeCtNZ0xkdEVVU1dKU0hZ?=
 =?utf-8?B?OVdXdnArQ1dmNWYrdHBobm9KdnIveHVBa0tNMkM3eFlkcHg0REZBeEdCc3lL?=
 =?utf-8?B?VmpScUhOOEVjSU1tc2tHMEMvTDd3VllYTTFzOGhNMjZmN25DV3lVZlZSSzJY?=
 =?utf-8?B?T0tWcGcyMFVSOWZOb1pManRHZE1uV29uZ3F4dzBqTVMyeEFjV3gxc1Fja21F?=
 =?utf-8?B?ZnN6TXZteDBJZ1JCM1dCTWRaRE5tQVZmTDEyY0V5cG9YRVp4Wm9pNW1xN1Ri?=
 =?utf-8?B?ZVRDaGdGZ2tXYVBVQ054Ym5ndnJRTjFiMk11WGRPNzN6NndyR2JGQnovVzB6?=
 =?utf-8?B?RGliSTZlcWJnYU9YTUdTZUcyanlUd1k1dm1sSFRrM0VlOTJPa3dSNGlNcEhj?=
 =?utf-8?B?Ujh2SjkxUzhHNjFadERuamR4aC92NnFYWmZaRDJKek9zTThCSVV2aXBhMFlI?=
 =?utf-8?B?elRwdjFyRXIxTUtyS0h6b285Rk52ak9NR3NKWFUwb3NnQjYyZ1MzZUNzQ25T?=
 =?utf-8?B?M2JkYTJScEZ4aDlhZ0pjdDlUTmNYMVdhWGwvOHFYUDRXS2Y4MmhsVjJ6WXZT?=
 =?utf-8?B?M2dTdkIxdDV1OVQvZFdYY1RaZ1pCWkt4WVRqMjRuajA2aDZteDRjZk1XeE8v?=
 =?utf-8?B?RGYzWjllMFV0c0M4cmkxMmNJRnN2eXY0bFJpZFVXM3JkYzNualNYTmZXZmFZ?=
 =?utf-8?B?RldqcW1INVZDRE45eXpmT2xuUXR2a3NiZmR2Nm1UYlZra2ZRY1hjTFQ1ZWZj?=
 =?utf-8?B?WmNIcFV3QndacGlKZWJPSDdibjlnZWxITFhucmprRGZCT1N5SUhxUnUzT2NB?=
 =?utf-8?B?dCtiMXFGT3ZNV2hJUzduVHVPOTczMUVRUDVpb0xZb3kzbFF4SUE3UEZVaTNS?=
 =?utf-8?B?bjlROGFuRDJYMkliODNhRC85alo2M2RwRVJYb0d4OVlOU1BBRWp3dkU5eVNN?=
 =?utf-8?B?eEV1Y0VuVmhKalVCTGh6bkFrZHJmODdrWDYyNjFiNmxUc0VubGpEcWpzYkFx?=
 =?utf-8?B?YzM0TzU4RERGZ200ZkpuTWdVaFFKOXFTRnNnRHJ5ZjRJcnhrcGc3TTdxa2tN?=
 =?utf-8?B?cjJQSHlPMERMcWc0NDI5SDRQOTcyKzNSZVFTNGZUM1YyQWhaNi9la3hJT2ZI?=
 =?utf-8?B?NXdGV3QyVUxTU2JNNTQ0SlpiNkNJU2tZTEJQb0RXNGRYbFFmVGNMTTVvd0s4?=
 =?utf-8?B?blE5MHAyK0VxTk1VUUx5b3E2MEFHazNnMXMvSDZMd0QvbTJGUW02YWYyWkJB?=
 =?utf-8?B?RS8zL2F0OWVxbWI1bmVxUlpSSG9xTTYzVmR4dkJVeHp6M2FkaS90YUdEY2VS?=
 =?utf-8?B?Wk5ZSHN6SWc5UUJSOEM3UFphTGxrRFFMcTdlZHNNMTB4RmgzbWZwYjlJYVd4?=
 =?utf-8?B?eUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f894057-31a7-4858-819c-08ddd3cdc50d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 03:11:28.7344 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M979Np43+1/eFePSLGfFyeyBEgQA52QWqi6tXaH7Z5XP8rSBHfM/RLzcH+An0RgpJtL4qztpDpHze7/C8TxBRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5878
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

On Fri, Aug 01, 2025 at 06:54:40PM +0530, Satyanarayana K V P wrote:
> Previously, CCS save/restore operations created separate migration
> contexts with new VM memory allocations, resulting in significant
> overhead.
> 
> This commit eliminates redundant context creation reusing the default
> migration context by registering new execution queues for CCS save and
> restore on the existing migrate VM.
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Suggested-by: Matthew Brost <matthew.brost@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> 
> ---
> V1 -> V2:
> - Fix kernel-doc issues reported by patchworks.
> ---
>  drivers/gpu/drm/xe/xe_migrate.c            | 18 ++++----
>  drivers/gpu/drm/xe/xe_migrate.h            |  2 +-
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs.c       | 49 ++++++++++++----------
>  drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h |  2 +
>  4 files changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_migrate.c b/drivers/gpu/drm/xe/xe_migrate.c
> index 3a276e2348a2..7d3c7c4e2185 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.c
> +++ b/drivers/gpu/drm/xe/xe_migrate.c
> @@ -960,14 +960,14 @@ struct xe_lrc *xe_migrate_lrc(struct xe_migrate *migrate)
>  	return migrate->q->lrc[0];
>  }
>  
> -static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
> +static int emit_flush_invalidate(struct xe_exec_queue *q, u32 *dw, int i,
>  				 u32 flags)
>  {
>  	dw[i++] = MI_FLUSH_DW | MI_INVALIDATE_TLB | MI_FLUSH_DW_OP_STOREDW |
>  		  MI_FLUSH_IMM_DW | flags;
> -	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m))) |
> +	dw[i++] = lower_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0])) |
>  		  MI_FLUSH_DW_USE_GTT;
> -	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(xe_migrate_lrc(m)));
> +	dw[i++] = upper_32_bits(xe_lrc_start_seqno_ggtt_addr(q->lrc[0]));
>  	dw[i++] = MI_NOOP;
>  	dw[i++] = MI_NOOP;
>  
> @@ -976,7 +976,8 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
>  
>  /**
>   * xe_migrate_ccs_rw_copy() - Copy content of TTM resources.
> - * @m: The migration context.
> + * @tile: Tile whose migration context to be used.
> + * @q : Execution to be used along with migration context.
>   * @src_bo: The buffer object @src is currently bound to.
>   * @read_write : Creates BB commands for CCS read/write.
>   *
> @@ -987,7 +988,7 @@ static int emit_flush_invalidate(struct xe_migrate *m, u32 *dw, int i,
>   *
>   * Return: 0 if successful, negative error code on failure.
>   */
> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write)
>  
> @@ -995,7 +996,8 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  	bool src_is_pltt = read_write == XE_SRIOV_VF_CCS_READ_CTX;
>  	bool dst_is_pltt = read_write == XE_SRIOV_VF_CCS_WRITE_CTX;
>  	struct ttm_resource *src = src_bo->ttm.resource;
> -	struct xe_gt *gt = m->tile->primary_gt;
> +	struct xe_migrate *m = tile->migrate;
> +	struct xe_gt *gt = tile->primary_gt;
>  	u32 batch_size, batch_size_allocated;
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct xe_res_cursor src_it, ccs_it;
> @@ -1078,11 +1080,11 @@ int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
>  
>  		emit_pte(m, bb, ccs_pt, false, false, &ccs_it, ccs_size, src);
>  
> -		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  		flush_flags = xe_migrate_ccs_copy(m, bb, src_L0_ofs, src_is_pltt,
>  						  src_L0_ofs, dst_is_pltt,
>  						  src_L0, ccs_ofs, true);
> -		bb->len = emit_flush_invalidate(m, bb->cs, bb->len, flush_flags);
> +		bb->len = emit_flush_invalidate(q, bb->cs, bb->len, flush_flags);
>  
>  		size -= src_L0;
>  	}
> diff --git a/drivers/gpu/drm/xe/xe_migrate.h b/drivers/gpu/drm/xe/xe_migrate.h
> index e81ea6b27fb5..9e20da6d58c2 100644
> --- a/drivers/gpu/drm/xe/xe_migrate.h
> +++ b/drivers/gpu/drm/xe/xe_migrate.h
> @@ -124,7 +124,7 @@ struct dma_fence *xe_migrate_copy(struct xe_migrate *m,
>  				  struct ttm_resource *dst,
>  				  bool copy_only_ccs);
>  
> -int xe_migrate_ccs_rw_copy(struct xe_migrate *m,
> +int xe_migrate_ccs_rw_copy(struct xe_tile *tile, struct xe_exec_queue *q,
>  			   struct xe_bo *src_bo,
>  			   enum xe_sriov_vf_ccs_rw_ctxs read_write);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> index bf9fa1238462..616fd57794a6 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs.c
> @@ -8,6 +8,7 @@
>  #include "xe_bb.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
> +#include "xe_exec_queue.h"
>  #include "xe_exec_queue_types.h"
>  #include "xe_guc_submit.h"
>  #include "xe_lrc.h"
> @@ -168,7 +169,7 @@ static int alloc_bb_pool(struct xe_tile *tile, struct xe_tile_vf_ccs *ctx)
>  
>  static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>  {
> -	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	struct xe_lrc *lrc = ctx->q[ctx->ctx_id]->lrc[0];
>  	u64 addr = ctx->mem.ccs_bb_pool->gpu_addr;
>  	u32 dw[10], i = 0;
>  
> @@ -183,13 +184,12 @@ static void ccs_rw_update_ring(struct xe_tile_vf_ccs *ctx)
>  	xe_lrc_set_ring_tail(lrc, lrc->ring.tail);
>  }
>  
> -static int register_save_restore_context(struct xe_migrate *m,
> -					 enum xe_sriov_vf_ccs_rw_ctxs ctx_id)
> +static int register_save_restore_context(struct xe_tile_vf_ccs *ctx)
>  {
>  	int err = -EINVAL;
>  	int ctx_type;
>  
> -	switch (ctx_id) {
> +	switch (ctx->ctx_id) {
>  	case XE_SRIOV_VF_CCS_READ_CTX:
>  		ctx_type = GUC_CONTEXT_COMPRESSION_SAVE;
>  		break;
> @@ -200,7 +200,7 @@ static int register_save_restore_context(struct xe_migrate *m,
>  		return err;
>  	}
>  
> -	xe_guc_register_exec_queue(xe_migrate_exec_queue(m), ctx_type);
> +	xe_guc_register_exec_queue(ctx->q[ctx->ctx_id], ctx_type);
>  	return 0;
>  }
>  
> @@ -225,7 +225,7 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  
>  	for_each_ccs_rw_ctx(ctx_id) {
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
> -		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		err = register_save_restore_context(ctx);
>  		if (err)
>  			return err;
>  	}
> @@ -236,13 +236,14 @@ int xe_sriov_vf_ccs_register_context(struct xe_device *xe)
>  static void xe_sriov_vf_ccs_fini(void *arg)
>  {
>  	struct xe_tile_vf_ccs *ctx = arg;
> -	struct xe_lrc *lrc = xe_migrate_lrc(ctx->migrate);
> +	struct xe_lrc *lrc = ctx->q[ctx->ctx_id]->lrc[0];
>  
>  	/*
>  	 * Make TAIL = HEAD in the ring so that no issues are seen if Guc
>  	 * submits this context to HW on VF pause after unbinding device.
>  	 */
>  	xe_lrc_set_ring_tail(lrc, xe_lrc_ring_head(lrc));
> +	xe_exec_queue_put(ctx->q[ctx->ctx_id]);
>  }
>  
>  /**
> @@ -258,8 +259,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  {
>  	struct xe_tile *tile = xe_device_get_root_tile(xe);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_migrate *migrate;
>  	struct xe_tile_vf_ccs *ctx;
> +	struct xe_exec_queue *q;
> +	u32 flags;
>  	int err;
>  
>  	xe_assert(xe, IS_SRIOV_VF(xe));
> @@ -270,27 +272,25 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  		ctx = &tile->sriov.vf.ccs[ctx_id];
>  		ctx->ctx_id = ctx_id;
>  
> -		migrate = xe_migrate_alloc(tile);
> -		if (IS_ERR(migrate)) {
> -			err = PTR_ERR(migrate);
> +		flags = EXEC_QUEUE_FLAG_KERNEL |
> +			EXEC_QUEUE_FLAG_PERMANENT |
> +			EXEC_QUEUE_FLAG_MIGRATE;
> +		q = xe_exec_queue_create_bind(xe, tile, flags, 0);
> +		if (IS_ERR(q)) {
> +			err = PTR_ERR(q);
>  			goto err_ret;
>  		}
> -
> -		err = xe_migrate_init(migrate);
> -		if (err)
> -			goto err_ret;
> -
> -		ctx->migrate = migrate;
> +		ctx->q[ctx_id] = q;
>  
>  		err = alloc_bb_pool(tile, ctx);
>  		if (err)
> -			goto err_ret;
> +			goto err_free_queue;
>  
>  		ccs_rw_update_ring(ctx);
>  
> -		err = register_save_restore_context(ctx->migrate, ctx_id);
> +		err = register_save_restore_context(ctx);
>  		if (err)
> -			goto err_ret;
> +			goto err_free_queue;
>  
>  		err = devm_add_action_or_reset(xe->drm.dev,
>  					       xe_sriov_vf_ccs_fini,
> @@ -301,6 +301,9 @@ int xe_sriov_vf_ccs_init(struct xe_device *xe)
>  
>  	return 0;
>  
> +err_free_queue:
> +	xe_exec_queue_put(q);
> +
>  err_ret:
>  	return err;
>  }
> @@ -319,7 +322,7 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>  {
>  	struct xe_device *xe = xe_bo_device(bo);
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
> -	struct xe_migrate *migrate;
> +	struct xe_tile_vf_ccs *ctx;
>  	struct xe_tile *tile;
>  	struct xe_bb *bb;
>  	int err = 0;
> @@ -334,8 +337,8 @@ int xe_sriov_vf_ccs_attach_bo(struct xe_bo *bo)
>  		/* bb should be NULL here. Assert if not NULL */
>  		xe_assert(xe, !bb);
>  
> -		migrate = tile->sriov.vf.ccs[ctx_id].migrate;
> -		err = xe_migrate_ccs_rw_copy(migrate, bo, ctx_id);
> +		ctx = &tile->sriov.vf.ccs[ctx_id];
> +		err = xe_migrate_ccs_rw_copy(tile, ctx->q[ctx_id], bo, ctx_id);

This looks odd. You use ctx_id to resolve xe_tile_vf_ccs, and then also
use ctx_id again to resolve the queue within xe_tile_vf_ccs.

Don’t you just need a single queue pointer in xe_tile_vf_ccs, similar to
the existing migrate structure?

Everything else in this patch looks good.

Matt

>  	}
>  	return err;
>  }
> diff --git a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> index e240f3fd18af..465db42f2e66 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_vf_ccs_types.h
> @@ -43,6 +43,8 @@ struct xe_tile_vf_ccs {
>  	enum xe_sriov_vf_ccs_rw_ctxs ctx_id;
>  	/** @migrate: Migration helper for save/restore of CCS data */
>  	struct xe_migrate *migrate;
> +	/** @q: exec queues used for migration */
> +	struct xe_exec_queue *q[XE_SRIOV_VF_CCS_CTX_COUNT];
>  
>  	struct {
>  		/** @ccs_rw_bb_pool: Pool from which batch buffers are allocated. */
> -- 
> 2.43.0
> 
