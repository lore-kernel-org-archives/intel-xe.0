Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AF1C27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 09:17:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D4610E882;
	Thu, 20 Jun 2024 09:17:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ku+IAmGT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4577110E882
 for <intel-xe@lists.freedesktop.org>; Thu, 20 Jun 2024 09:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718875074; x=1750411074;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TDazKadUbCXzJWVFVMVBzBYVsj+VfinOjTmrlibxMmw=;
 b=Ku+IAmGTSmiP6Dk9Jgr/h0SMfIPm4G6K7erVX8gGrEhPFdx3iIPUFDri
 VOkQgBUC2KW5AX0CigiqIyyiZvMSEI3wP/WJ+98Kx5TJQjSXYqe5h2Xy+
 MMbpsMNyOAEFFdOkt/uGIGYU/NulG0emmLYnmZQ0lAjiAhxOJbjNH2WfM
 26jOq7fD+4cltg0+l3jFg4y3aKs+JUPWBL82qFvWy3q3tvGq2pSUeIR3y
 JaTmjzLa+sNBdNfsRIj8OHwnODKLFJtB7OVPS4w7gTrOs2HzucbZ+cfBK
 aMtG4/JdF4WeeTmeIfKUixiB3RbRPEKwTh1eR7dXV6gprcBoZKNXZWp9o Q==;
X-CSE-ConnectionGUID: vVNJD0ULS7+v9GjS0MThhA==
X-CSE-MsgGUID: 3kD11UjZT4aeT4cl1SErFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="15813345"
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="15813345"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jun 2024 02:17:53 -0700
X-CSE-ConnectionGUID: LjeaIlKzSCiAnzXbyNGsfQ==
X-CSE-MsgGUID: L41efKSFSMykTgL5WVx3/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,251,1712646000"; d="scan'208";a="47091676"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Jun 2024 02:17:53 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:17:52 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 20 Jun 2024 02:17:51 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 20 Jun 2024 02:17:51 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 20 Jun 2024 02:17:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kSAhpWgiDcrLqBtaBrSWsUwNFmW03FEwaZn4JJzaBytF/Cd05/gOChbjgshA9/nEFCtWB6DebQyDMwrnBPgo9L0t1RT8JzNsTWz9yXTSM3dYaP92ExUm0gs3NcdV29bQOddufCF0BHCG/iC44LK4/ac1IIsojIfNLpO1qoj9bu+2YDUfo6Ii8LvmJ1XiGCzdXrWT1t3squWV/NpDq2eskaPJgxLZ+WR+iKg0X6sr+RE6nZGIFU3+/Yp7SBCNjegD6B+bLk/8ZeAbiCZPlwZ6c2zvaVwiN/U89zDtKKOX0e2v25OCqWyM3j7O3KJXF+9T3vcMrSFGk6rbM4qu6qDuXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=54fHki0piaYCQ/OyzSzp4iYFgmnsRPVXSz0CHUYBVbU=;
 b=C++r0DikHzSXftkyI2jIgLntQIT1GWOosXb8kytELxb9MUuEMRXpPgAXADCqGfZV8lCMctJT9ZrGOJrNSk6gbUgrDXcC2EmRYTgXz0ASKoutPmOehoy10XDH24/9p9zgejt4+jQmgwf9vTU8KnL0EakQUPiEmoPcOj8Fk04Mm42D1AVBpOm5stH/mRkiooi+rbHqSaY1wsOg18vOIef1MQg8+vtnPZHtvl072Pjne94QJZS0xn+9iJbVkFFnjpM9/X8/5PxTebXVcLEfB2g80ra0jT+epHEjIS+O0vJmfjbFzX+Kd4AYYo3eKnMqL8g9eMMoaDsizb9CaY0VZAKHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by MN0PR11MB6134.namprd11.prod.outlook.com (2603:10b6:208:3ca::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 09:17:44 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.7698.017; Thu, 20 Jun 2024
 09:17:44 +0000
Date: Thu, 20 Jun 2024 11:17:41 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 1/9] drm/xe/vf: Disable features that do not apply to VFs
Message-ID: <20240620091741.gbbfelgvbeoabjbd@intel.com>
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
 <20240619214557.905-2-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240619214557.905-2-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DB8PR06CA0009.eurprd06.prod.outlook.com
 (2603:10a6:10:100::22) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|MN0PR11MB6134:EE_
X-MS-Office365-Filtering-Correlation-Id: 957a1abe-f668-4272-285a-08dc9109d80f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230037|366013|376011|1800799021;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z2NvZE41Qk5ML2lyam9Ic1hXQzVuYTJUM0tacTNZR29PRWxYTndRQVh4RkRU?=
 =?utf-8?B?Tjk5eDkvbmRybHB4SkVWK1FQbGwyWlRYVkdBWjRaSGZXaEpzUlpHK081YklO?=
 =?utf-8?B?eGErb05xcnE0Rk5IR3dENnNOaUtsVDdrbEVraEpHc2tFbHNCbGpmLzdTMlpr?=
 =?utf-8?B?ekhKVzZBKzBzb3l3MUhTcjBFb0FEdk5Id3BwRlpETVN5a24yd1BBaStPYWNs?=
 =?utf-8?B?dGI5QVF0ZFl2cmN5SzJPdVJUVUJFd1l2STBteXFwU2hLSDM5ZkY3K0FNOTRY?=
 =?utf-8?B?ZWFQbG1Nd1BEWjFSVEhHakNveWttdVN3WXRzcXJHUHdsbWl5aGpDajlLblV4?=
 =?utf-8?B?QisrRUR0RXU5aWpsRVFQYTQrZzQ3NUx3TXhFckp5aml3cDdwTjVOa1gwYjgv?=
 =?utf-8?B?WTQ5U0dGZHgwem1JQzhXUlhzTWZHQjRCeko3Q0R6NmlZWUl0bkRFL0h5dVhX?=
 =?utf-8?B?TXltVHNMZ0Zzcjc3NEZObXZGWjdqWTNKYmJkS3AwcHFZUW5tSmR5MFFIdGZ4?=
 =?utf-8?B?MThpUmJqTjNJN0RGejl1bXg1b0lqOVgxNGtSZExIY2gzek00SjZUVTN6dUtR?=
 =?utf-8?B?WUdWNGhPT1ZINVhjM0VKZ3pXWllHdDJlYk9aalhUSk1WMytNelZ5VDNQZE5j?=
 =?utf-8?B?TFVYVnh3RDFXVmdUYUdCbUVSVVppWmk3aG00WTdxTUhrWUpvODBBM3A0YjRp?=
 =?utf-8?B?dFhpeFRLcnhaajBtZEJ2NE95VVFxVm82Y3U3NFlMQ1BSNW1QOFB2dlE0eVVh?=
 =?utf-8?B?RDNyNkRLQzhCcmphcmVENFU5SndrQ293SmhrWDZneHUzU01EaVowRDFVL2Jk?=
 =?utf-8?B?Uys3WWNjZFk4MDVKakVlaWZGU0dqelVuak9lMno0c25BejRONjRWNGZBVTdr?=
 =?utf-8?B?SmxDUG1ZVUdFTjlnU0k2bktsV21sTTBxM1RPLzRxMHFGVE9NNnJIYTAxUE91?=
 =?utf-8?B?dGRjMkFvbU5tS2ZBOC9EVG9YamxLQUZYOUwySVpoQzJrdlNpY2pGMnFZdXlP?=
 =?utf-8?B?ditKYnJDWjF6dGVpbWV2L2RlWE9JME16MjNGTVNLQ1VxMlRFOEZaN0I3NDBD?=
 =?utf-8?B?bnhMcWZUTVMrOWVLQVBQK0w3Rkp5eGJWTGFCV0dvbnJtVVV0UHJTTUszczZP?=
 =?utf-8?B?M2w0Um1maWo5cG01SUJCT0hPanpWR3FHTXVxbm9vV3J1R2NWL0JpMHNma1dR?=
 =?utf-8?B?VWlwWUllckI3U296UWZia3NNQjBSWjlaU3A3Z1J4Ukw1OXJjMmFWOXNwQS8v?=
 =?utf-8?B?NmVhZEdCcHVOT1RqeE9sRDdOQUZRcy9xaXU0ak9IMVh4cmVqaTFxL1F1aDgr?=
 =?utf-8?B?MzFua1FYeXd0SHlMY2ovWkwrcHJyK254S01PSThjNXdROW1oQU5yZjJPSXZt?=
 =?utf-8?B?eUJCM2hPMzVNRmRJV1VHcGxHRk5lU3MrbUd0d0FDK1V5YW5Cd3luc1JYcVQx?=
 =?utf-8?B?S2cxbFA5ZVhGSzZzQzBNWmRxTTkvRXZoMzJra1ZpOCtFZGh5YVlycmxJS25s?=
 =?utf-8?B?VHEvdzh2MXFDQUR2SExOTlRGTHlYU2dEY1N6elNpOVlaZnJYVzE5TENlM0dZ?=
 =?utf-8?B?ZjRFRXNMaXVjUi9xcllvVkpiYk9BRFRjeFZvT09Sb2gxSjZ2VGpXRUFoallS?=
 =?utf-8?B?YnpLNEhWVnk0QlhpMEdVeVpQRkhldTY2ZS9KZGVuWU1IeW1yZ1Rpc3lFTVFu?=
 =?utf-8?B?aEJrQzBEdDg1ekVJZXhzVnN1Y3JTblE1aSt1clZBbkRFSVN2bnl3VFFKUGtS?=
 =?utf-8?Q?IE04D1VIn2zjnKiGCuUW7DJZv2xME2fGnvN8ski?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(376011)(1800799021); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ny9xcnV1ZkZjdFRTVVZnczhDazVVQ3VGRWV1Q1dNcmpmSXlMMWJDMFBsKzNR?=
 =?utf-8?B?WlFUUGI3WlNMRElnWTh1NnQzbWlIenBqWGVreERZcmdjdGFWSDUyU3dEMFpN?=
 =?utf-8?B?cEl1ZW5TdUxKcGpzUUNadTBZMUtkREpWZ1pYWmFjd3FNclJuNGRWSFRPbHFO?=
 =?utf-8?B?MnlnYTBCUUFHVkgzam9UN3BYNVpoeisxa2d6VWEySUhhcFJzV0RvU3UxakRT?=
 =?utf-8?B?bXdCRm5xeXR6ZTBFTjBHR1NLOE0rR05ob2F1L2VzS2VnMVFkQTl1WGNyNEFu?=
 =?utf-8?B?TVF3TXZ0S1h3WWNCbFRUTnBYOXNDRlc3ZEh3d1RFRjhGaVRpRDM2WHN1T0FD?=
 =?utf-8?B?ZTZBcXBXaUtpV3BpeTBvbTc4Ull5WUdnRUpvUCtPdzJPOUR3N3FBSzZtMk44?=
 =?utf-8?B?SHg1YXIxejZTdlhEWE50eXRaMEdia2tYaHh6NlFWeWpXcjQxNWQ0U3FSSWZn?=
 =?utf-8?B?L0kzS3QzZjRSWXBQYVRzTWVBMHU4SHp6ZFM4eDZxdnJxS3VrcTc0WlhYaEM1?=
 =?utf-8?B?NG41aGVuUkg5Z1VVSmJOWlhoWko1SnRhRWpYYThZODByc0Z2R3ZtcUtmeFFU?=
 =?utf-8?B?c1pvU0hPZ2UwSzRCdUZDelMzY0I5blk1V1hCak1PU0tzLzQ5VXJkbkpZY1hu?=
 =?utf-8?B?SmZOREFaRkJXUytaam5YWkhwTTNLcDFNbUdLdWdGTGFxRXA2NXZTeTVVcXRF?=
 =?utf-8?B?NXRCODd4dXA5U1hKU1VEV3k3L3BPV0R1UVRQS1dNOGJnT1dGYWJweWl0NFl3?=
 =?utf-8?B?SmJLQ0ZtYTRtdGRIUXR4eXlhcFRuY0Y1SWg0N0pWVlpsZ1V5aGdxcHBVNWZK?=
 =?utf-8?B?UFlhQnF6VHN5NllheXE3ck43bWhtaWJPVHJBdXhHQnpyTUdsbVM0Mys1R2N1?=
 =?utf-8?B?YkZ5UDN5bjkvc2h3SGtvWm9ZYXVXcktPUnpyU3pxWXhDaFpJRmc1d2x4QjNj?=
 =?utf-8?B?OFZwblFWMkRiZVMrS0hHOE5Ydll0bDZZR29ld3o0dyt3eW9MZ2ZSV2FVWUxo?=
 =?utf-8?B?Q1pyWmZ3eE9UNUttRUZtVEw5MWFQVU10RFg3SnNEQ05DMXFmck9sWm5UN0t6?=
 =?utf-8?B?VEVvNmFESGh3V1MzTm5nQjZIdnFJajNCc0xlb3F2MU1hZVR3Rmt0aVlGc2dh?=
 =?utf-8?B?ZjI4Y2NQSEJJVHQwTlJYbzdrV1ArSllQQzR4TTM4cGNRcmFZZDN0ZklONXRa?=
 =?utf-8?B?RjA4VkFhVGxWOFJyVTRmVU1CdGhDdlhMOXZRSjZnOEI4Y1pvL3RQYUNja2NN?=
 =?utf-8?B?RkpnOXhtOXcxZHZtN29lK1FXOHhxajlqV1ZZVy9tOEpxVDFhdFc4WEVlWGJZ?=
 =?utf-8?B?eE0rajNkbVgxaGxFNlJKbGpZV3lrREFHdkJQcU1sMmd5bkhnOUUvNFdKL0Zh?=
 =?utf-8?B?dUVWMEdwNmxZSnpmcWlEdzE0RlhsUDA0QUdEVC9QRTFzVnVFU2E2aW1QUUtP?=
 =?utf-8?B?YzRGN1dWcndFUURqMjVNVVdmRmJvM01VMWQzTXc4Y216bGhLVWpQYW1MRUF2?=
 =?utf-8?B?TXRrU3RESnBJYmNhYWY4SXZOaDUrMTBwZHNWbHN1QytvSjVwMFpIeW4wNWow?=
 =?utf-8?B?ZSs4QlVmYW9lWjl6UWFBSmJveDdzVG1xN3VyZXpEZ0tkQ25KQ0taSDY5TWJY?=
 =?utf-8?B?Y2UydnlNaS9xV214Q3lIWUI3ZElxSDlVZWlMVTFJTDRFREt4UkZTdFhhbTVH?=
 =?utf-8?B?VWFmckl3djIxUm84QkloaHgyckJOZG5xYjJMSkJqY0k4NFpxbnArcTYzeHAy?=
 =?utf-8?B?V2ZOVDRTVkU4S3d6VFJoUktrcGhWSkVyS1NpTEgxbU83b3V2QUNvZU5YTGFB?=
 =?utf-8?B?blVtREFiODA0b1h1eWVwRVBPVUFXb1lqenhjbncySzk0U1c3REYxVWt1dUxZ?=
 =?utf-8?B?OVFwUmt1WEl5ZHRBclNGMzUvRk1EZWpWYTk3d2E3b3VaUVEzeDV4azByN1Ns?=
 =?utf-8?B?R3VqNzNBbjExZGc5UDliOTVqRzJUSEFWYklRVTJxN2J3VkxlSnZqR05sZTVy?=
 =?utf-8?B?K3JVaWNtM1luVXJ1bUUxdUJkS0lETHZINUxNalZzdk9DcWRYRTFnMUkzbW9Y?=
 =?utf-8?B?TEZYUHgwQlRJV1RMcWpoMmowaGh5VTFXT0d4aUo2ZmlxZ1JSMStWblBTWTZ0?=
 =?utf-8?B?TE5PNkhjZjVXQW9pZThJYnFwT2JQU0lyOVAyWlNhM2pjL1JUUmFUOGRpWGNj?=
 =?utf-8?B?TFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 957a1abe-f668-4272-285a-08dc9109d80f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 09:17:44.6543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +Lmv2mNAoD3GGGAehAhTROR/ooQM0WEZl9G6k6gbSS2ueLne4Mpb9bw8IJpAx82bAIs5ILMoseK6oewSE5bFCNLOak9NpFxVUdGXaezUUCQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6134
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2024-cze-19 23:45:49 +0200]:
> We already maintain several flags that control the availability
> of features on a given device. Disable features, like PCODE or
> GuC PC or GSC, that do not apply to a VF device.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 75d4c8ae9234..603e85da5748 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -486,6 +486,16 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  	return 0;
>  }
>  
> +static void update_device_info(struct xe_device *xe)
> +{
> +	/* disable features that are not available/applicable to VFs */
> +	if (IS_SRIOV_VF(xe)) {
> +		xe->info.has_heci_gscfi = 0;
> +		xe->info.skip_guc_pc = 1;
> +		xe->info.skip_pcode = 1;
> +	}
I have no objection to the current modifications of device_info on VF,
but it seems to me that the setting of has_diplay to false is missing here,
as VF does not support it.

Thanks,
Piotr

> +}
> +
>  /**
>   * xe_device_probe_early: Device early probe
>   * @xe: xe device instance
> @@ -506,6 +516,8 @@ int xe_device_probe_early(struct xe_device *xe)
>  
>  	xe_sriov_probe_early(xe);
>  
> +	update_device_info(xe);
> +
>  	err = xe_pcode_probe_early(xe);
>  	if (err)
>  		return err;

> -- 
> 2.43.0
> 

-- 
