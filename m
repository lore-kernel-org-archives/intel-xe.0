Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA60C5CFC1
	for <intel-xe@archiver.kernel.org>; Fri, 14 Aug 2026 06:31:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B93D310E0D6;
	Fri, 14 Aug 2026 06:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cxp6PuND";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70A5D10E0D6
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Aug 2026 06:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786689081; x=1818225081;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LoKy7bUz7s2ZWLqSH7f57YB1cc0jp6/jj54w/BZc60g=;
 b=cxp6PuNDrzav0ad9z4taJQF/d1uPe1OUJaNTmsEnQEwpSYEry2JVqprg
 Hi4NfTZzUm04bwV3t21f1r083FsWnearoKXIpUA7lKnEiyei8pD/zPr4V
 0gaq0YYkGsZOcJ3YV1mW35Hrjmr3z4u5s4CJSJEZtFqN/YNxiI0CBljOJ
 FQzKEXnLQl348B2uo9afkfElXt2oJcqLM93p61phfjkGLDAuk9ZT39lBh
 /ol2NCebBfQfmywrfWW6Fm/dXbL6JQijJnEe2Jd2xuaQ84wuateqwd62m
 xGdLt9wtsm+X0xy4qs9e21LI8DtPa/V8ETbtunvsebSiuw6EvUhVCGolX g==;
X-CSE-ConnectionGUID: 6iN/RDPGRZaY2aNS86i1gQ==
X-CSE-MsgGUID: inzMefC0Qvmra8KD1nZipw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87193246"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="87193246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:31:21 -0700
X-CSE-ConnectionGUID: /us2wF8yS2qyoyvy1s+qAg==
X-CSE-MsgGUID: 4p87XMlyRWG7x9hGwcysyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; d="scan'208";a="267637024"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Aug 2026 23:31:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:31:20 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 23:31:20 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.58)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 23:31:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZXLb/5wV15DMS7wTvYwOb63ljGhTsqSm+YmmPtf13eZfkueWBwEuoZ28Ifyps99tm+yeb+8U3G309pdHp0GCsNHVM7VE6Iru7LffcRBroaB2wWByxIgOiLZNHVrL84k5nGbYV5NkGQPO/+pfxmO7Nyd/xA7K71b8Je01KVWajhHWNZpnoFrwEMb4DjUesrbElTTuanmRlHCiO6UTmueQSHedbf9z/uWIx3NMqWVUh5cDVj1/+V3tJA2b0u5YGnvU69kQQcyU2loWGyV8X/AIx7EdQNBaJ93hrzBKOsBP1sjqjCXd7txBw5I/6hGBj48fvH8OVsBKggCqejtDiK8UMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sU9McpLjm4kSSlu3LbHtfcpQqZp1PewvDg51knLGARg=;
 b=KlQEih7MoTnSnsssNPk9kfK73yRWYoDocV3URVkmwn0eHiI/Pw4H1mY3syatUJ7ye8BSf7dPCOJP0Z8DcFSRmjUVSzhgF2MtOenx/XkqzLo8q9CY2UTy4rXxTsfKFAYTlEKfvR4zBcd49PgFqecZgKQKseGUkVz8hjc4XkqvHH1yxjl/3iazixu1b26Od4byPFnQtOOV7F7lCbNw/mLiT5/eur0OZkvOeXNzkdR7QwBD3Jfyah4f6EEfPelR1belpucPNYtcOqY2lHB69HO7E58b6Cw264xPEzZ1emrKCDLoQxWXPbdKWO8axtvsGkmSpf0iq8a7rdRh7RbCyy+iog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DSVPR11MB9916.namprd11.prod.outlook.com (2603:10b6:8:45b::23) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.15; Fri, 14 Aug 2026 06:31:19 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 06:31:18 +0000
Message-ID: <5e6afb20-43d0-4ec5-81e4-c4568e1145d6@intel.com>
Date: Fri, 14 Aug 2026 12:01:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 22/32] drm/xe/survivability: Report 'Boot Mode enabled'
 status using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>, "Mallesh, Koujalagi"
 <mallesh.koujalagi@intel.com>, <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260812191450.11690-1-michal.wajdeczko@intel.com>
 <20260812191450.11690-23-michal.wajdeczko@intel.com>
 <f4c58382-6edf-4d8d-bba8-e7fc0c18b4de@intel.com>
 <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <8eac682d-bb57-46b6-8974-e7593ba9a620@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0160.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::11) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DSVPR11MB9916:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0a1b58-4784-49f6-40d2-08def9cda625
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|56012099006|10067099003|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: Edz5ZXIgH6BE6qEwsqc25HAQsDgDtUlJAIgLUWHBja7yiXgmzyPoaDh1ECUOKoQIzjakPrSTs3pq5Bnty0Vs9G1qtADPVNK7WoNLd8GgKDpod2WPthMj+8bqETqh3VdjlGPPAFEasTzNDiDpMh4YjzA3q+lm1IPMXake6FF8cBhHhKYw5Vo786w45igK0tTgsZJYswF7o9uPCsUq1AuG0LXakbsqb2L8CAxkGPozCmJLefTr4aDS3O3Kgt77vV4PXmVcZfhDxMXAbVjSqqjEv19mrpUEM2jwQ+ZyYxrlpmJi8WLJv4niGwTJFGmbGt90cl7frF9V7YOTwZydJTOABCN4A5aSB7Tfy7h5ijTyK5/UoKTjQ721baU0xqXiRvcAKEH37pEU0WFDzZQK0Cw59Xf3XksD9cePJxWFIOteeGHHG/P+jTRYmVpup2H3xoh1pD5bwsTFCpfgdb79CIZUaMk4x2mzUjvXIIpbTrf3GrjnYiBXCk4pedrumsEOJxq6ZQoAdGcLGYFv0FE2Dr1XSE4tkUBUqPC8y270vO0dtrRXARdKgfdpjDqJn89YqhlMO6RSZrUtWycVd5NonkRv6YJ6on+FUjJFeAD1RNUeIdKJ0bbJm1AJlHTBd/QJpgx/urTqle0lXd+5qluWzBVwqqw5dZYqTZ47LFL7ehxwpHs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(56012099006)(10067099003)(4143699003)(11063799006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RVJXUGY1QUFwQUU2ZUtkZXowNVdPTkVrMytUeU5tckNNM0pQU0U3T2UyVEdo?=
 =?utf-8?B?YjZOY3JlbVZZMFQrR2pRYlM2WUhGcEdHYTlCbGExc2V1eWl1MXZpb0xSVTBk?=
 =?utf-8?B?RmhESit5MVIxVVZHendva2l5cC9lUkpIYlVlZ2J5OFJjNUlHWlRGSFNrb1JB?=
 =?utf-8?B?akpkNmFtaG0rbHo0dG9XNE1rSGRQN2FWTVh3b2RDM2hwb0dtTENRRDh2RXJN?=
 =?utf-8?B?bnBpTmkzMHRiK09DVDRBR1czd1VsU3BjOTE3T2pZWnJFak9hbU53cWNuaktG?=
 =?utf-8?B?UXlIQnZteElmMHVCWjJsZWRmQ1NmMktOVjZTTzJnUnNDbFVLTnU2YTE4cG9U?=
 =?utf-8?B?RGpZSUZnTDJBakdMSitoc2dQVzBsYUt0YnoyWVdTQUF0NnVGMjVHbi9yN0xB?=
 =?utf-8?B?dW1FUjhVY1ZoKzRrRkllR1JDQ1dDcjZoclBSQVhGaUY5NmdYeVJ2L1pNL3U0?=
 =?utf-8?B?b2JnbFFQWEpkVDIwTzdVM045aTd3c3h5YWxFaU82QmZZcnVGRHB6KzdKdFpX?=
 =?utf-8?B?M0xZS1ZLTVJ5RDFlTXFNMjQzaWtsdFNjTWp1ajBDRmIzRkRpZFp3VldKSnIx?=
 =?utf-8?B?MXJWcFRwMCtWK2ZSRkVMZ1Fwbk9uNGpyeTVzcTV4Uy96T0RueWc2dVhJMFZV?=
 =?utf-8?B?MUw0bTh2V2RZQ3hCSDlUZ1NLeFAxS0dkbVZkaUxRS0p1QTczTUhUdTBOOE95?=
 =?utf-8?B?RExZVFlvelRiM1VGR2IvVlFCOHdpOFQwajNQam1CRWw3Tkx4SGF2SnQwYi9i?=
 =?utf-8?B?R3paS2g3U1hHdVVoZ3BDMkx4VXpkNXRWRDFaeWR4VTBDTjhLQUZDRTVQcVI4?=
 =?utf-8?B?bVV3YlRBTnVpWmZKdlErKyt1djBYd3JJdXN5aUREOU5scUF4b3R5WkxLSW0w?=
 =?utf-8?B?UTdhWUdjQjNpRVdjUUtpNkNJemwyQzgrZHVrOVZ3dFNOdjV6eXNJU2ZhSEND?=
 =?utf-8?B?S0lLU0tjbW1vWHE4SkN5eWUxM29UU0cxMnllNDRpRTZaWDdFN3Y4MHBZMmNG?=
 =?utf-8?B?S0h4aWZiQUlYMTFpSEQvU2VHWGgybDcvTW9vQ2RzdEZlNVpaY1oxSVp1MVA1?=
 =?utf-8?B?bkdFZEtzUkc3K3pmUkl2L1BLRHZHU3ErSHFiSGR5dGZhYXpTbXdsZkVGQjlu?=
 =?utf-8?B?OEE1clFzZ2VjcWUzSHRmSXZRQ2sxUFVqQklOc0RMZlRoM1JpNjBwdm15cmtr?=
 =?utf-8?B?UFJjS2EwZnEyM00yUkhpQVVWaGgybzNQUzBiWWE5L243UFNzRkxMVXhFMDRv?=
 =?utf-8?B?S2FiaWp4VXNYSUpWM3VMKzRUMTkyVS9IM05BRlk2WS9JaU50Sk1wZWdKeW5w?=
 =?utf-8?B?V1ZYU0JMU2FyeS9qdnlzbTJnVjhGNUZzcDRIcmJyaEZVaDUyOWhoVGRWT2xL?=
 =?utf-8?B?WXNRcWZhaGNWNFFwSVVqREZkb20yNDJYZHlGWGpXMS9tdUhVRVRGRVhvMGR3?=
 =?utf-8?B?VFp1MCtNaDdRWnRGVHB3eWdVeGY5VFk3c1lDUWZKMzZjTkNvaysvMFJPV1pE?=
 =?utf-8?B?bFM2WmtRQ0duVStodDQvdFhoWC84eG05THJlVHRkeWo2aGJVWHFjTDc1Q09u?=
 =?utf-8?B?eW94cHhQSkJ0cGdBZ1hkWjdTZUxZbjJuOURMdlJWVW02VG4rakRXTkQ3QnYw?=
 =?utf-8?B?WDRYdGNidTQveE42TVBCNnNFdGxuY2NCRTZvMlpGenk2UC9uTkcyQ0k0Um1S?=
 =?utf-8?B?a1lLWGdtQUpHcWlaN3lCQXg2SUtLOVdVcEE0NzJNNXFtTGhQY1RyUFNZU1Jp?=
 =?utf-8?B?NFZIcHhFeERIZWEvSnJYaS9EYjJkNXFPSllFZXhHbGF5TVJYTjh5c3ZPYVJ0?=
 =?utf-8?B?VTVZUFNORUxNMldQeDduYVJ6UmZsM2JJa0dQZmpid2VFcTgrQ1JUMG1Vb0VS?=
 =?utf-8?B?eHJVZnREMEhneGo2QTc0M2s3SFQ2akhKK2VzRGkzUHl1c2N6WUQ1MWN0eDUv?=
 =?utf-8?B?QjRaTC9GQ25XL3FLQ1lWOThKVVZwS21IdmY2UUFyaXJRS2t6a1UxZzhBQlhq?=
 =?utf-8?B?RWdtb0V2dUM0YlVuTWRVaWhINjlHSWFiS0hLa2tCWGt6bDBCTVhuMTdhaVhC?=
 =?utf-8?B?NW9oM3Q4RFRaVEdHZUZweHNpRmpmdDZIQXhEZmNNZnB0aUNKSGlvK2RiQ0lm?=
 =?utf-8?B?a3BnRXNhUG1wNmVrRkp5SDFLTThjL2pIaXR3UENwajUvMWYzRHVVRi8zby82?=
 =?utf-8?B?anRqb0ZSZFIrbVNjVVFXZ0xJUUp5T2hIOVgyblJnRnhyOTV4a2Ewa0ZBTHE2?=
 =?utf-8?B?M3g3Nklsc0hxUzhBL0d2MmtwTmZxNytMY2pCWkw1Z2hEUmNqclVmNXo1VEVW?=
 =?utf-8?B?L3FFSFR5N1VobzJBdGs1VVVWdVRTZEVGcHdEd1pSR203aUV2bDkvdz09?=
X-Exchange-RoutingPolicyChecked: H3AXcCfK9aflKSYvwL3AY5oTv+9zfP64WDkXZJ1S3uTkpLxV6K/Nm2jfh+XYhgYAbMdwLqoTa6Ylrgir6u89q1KeUQO4DohZm+7RBpiNt6uhkHlvs1Alolg/i0PM58eS9AColqWI77NmPsZSMgL6WLipaasmo0EtYtS/TowCz1WsguBhya+XnmKf/bX8DAaUvZF7RtCUT0UF+oQLd2ZY0y2KCyQQUSeWu4TWlto6vV4J9rg/nV6CdY2YziDFMKOSlYiUMsvZtmtHvdAUjX1D23AU4CqdDKchzioCqa1NqgwzS02G8u9ZWv9flRLCgKy9Sz2MJKB7l9nEZZMsOqJbPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0a1b58-4784-49f6-40d2-08def9cda625
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 06:31:18.7992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tf5MQe/eoVOqu2QwLcppGCgfcfJAAI55EqpmcVjf/Kd1FDWNA04F4MRSi1NQjeA/i4nx/8OzzeDhmY3CnIETHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR11MB9916
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


On 13-08-2026 16:31, Michal Wajdeczko wrote:
>
> On 8/13/2026 12:52 PM, Mallesh, Koujalagi wrote:
>> On 13-08-2026 12:44 am, Michal Wajdeczko wrote:
>>> Report 'Boot Mode' status or failure using various xe_log() helpers.
>>>
>>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Riana Tauro <riana.tauro@intel.com>
>>> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
>>> Cc: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>> ---
>>>    drivers/gpu/drm/xe/xe_survivability_mode.c | 21 +++++++++++++--------
>>>    1 file changed, 13 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> index 2d8c532157fd..ebd288986c11 100644
>>> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
>>> @@ -304,14 +304,13 @@ static int create_survivability_sysfs(struct pci_dev *pdev)
>>>      static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>    {
>>> -    struct device *dev = &pdev->dev;
>>>        struct xe_device *xe = pdev_to_xe_device(pdev);
>>>        struct xe_survivability *survivability = &xe->survivability;
>>> -    int ret = 0;
>>> +    int ret;
>>>          ret = create_survivability_sysfs(pdev);
>>>        if (ret)
>>> -        return ret;
>>> +        goto failed;
>>>          /* Make sure xe_heci_gsc_init() and xe_i2c_probe() are aware of survivability */
>>>        survivability->mode = true;
>>> @@ -323,19 +322,25 @@ static int enable_boot_survivability_mode(struct pci_dev *pdev)
>>>        if (survivability->fdo_mode) {
>>>            ret = xe_nvm_init(xe);
>>>            if (ret)
>>> -            goto err;
>>> +            goto failed;
>>>        }
>>>          ret = xe_i2c_probe(xe);
>>>        if (ret)
>>> -        goto err;
>>> +        goto failed;
>>>    -    dev_err(dev, "In Survivability Mode\n");
>>> +    if (check_boot_failure(xe))
>>> +        xe_log_comp_fatal(pdev, SURVIVABILITY,
>>> +                  &survivability->boot_status,
>>> +                  sizeof(survivability->boot_status),
>>> +                  "Boot Mode enabled!\n");
Do we need this check? This function is only called if it is a boot failure.

We can have a error log with the type here. We don't need if else.

How about something like this? and remove else


<3> xe 0000:03:00.0: [drm] *ERROR* SIGID=<N> FATAL (01000000) 
SURVIVABILITY: mode=Boot
>> In case of fatal, will make sense to return "0" OR we can add return as -ENXIO right? any thoughts?

Mallesh, you cannot change return codes here. This defeats the purpose 
of survivability mode

> you're a reviewer here ;)
>
> but seriously, enable_boot_survivability_mode() is called from
> xe_survivability_mode_boot_enable() which says:
>
>   * Return: 0 if boot survivability mode is enabled or not requested, negative error
>   * code otherwise.
>
> so returning 0 as success code in enabling boot mode is the correct one
> returning -ENXIO will be no different than failing to enter boot mode
>
> @Riana, this is your code, can you please confirm that
>
>> After handling fatal case
>>
>> Reviewed-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>
>>> +    else
>>> +        xe_log_info(pdev, SURVIVABILITY, "Boot Mode enabled!\n");
>>>          return 0;
>>>    -err:
>>> -    dev_err(dev, "Failed to enable Survivability Mode\n");
>>> +failed:
>>> +    xe_log_err_fatal(pdev, SURVIVABILITY, ret, "Failed to enable Boot Mode!\n");

Can we retain the previous dmesg?

Thanks
Riana

>>>        survivability->mode = false;
>>>        return ret;
>>>    }
