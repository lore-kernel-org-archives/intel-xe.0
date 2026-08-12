Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27155C5B567
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 06:40:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7A48924F;
	Wed, 12 Aug 2026 06:40:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="idb+kKV/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 953448924F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Aug 2026 06:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786516834; x=1818052834;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=nfg6WE1dnkdvRGPQ4z1UrG6s3gVwH8hUyEl/brO1usg=;
 b=idb+kKV/Wa/U0HapBVqKDfXU+fGPUBVZQreX3xvoBuNiA773tGDklZJj
 ta6XWapcghP0ldcHv6Lfdahtd2ZXv8CLrS05obNWhhriGEo8gbKDRxwDW
 C9epPc+JzSV5u/sfoYUPDdVvMLVDmtybpQpf1myQJUrJrwoCrI6zubFTa
 6RIx197e84MYjoWxoaSBVY+HEAUh0yHo3SoAw/nbHPiQra8NtkYgH30K8
 GcgEyOm0oRhwlvf7PNbVMARKov9hn8qmUMM1SKhrSiAKgL0f2Mb6L+sae
 n8PkUSeaf+dHKbWcTMhqxLEIjQ3j4f+QR8JvKB04uHA8OmL2d/R/PK3KR Q==;
X-CSE-ConnectionGUID: T9APNunHQQ+XmsAcxlf6aQ==
X-CSE-MsgGUID: F+G4eWMcQr6LmYWH9zSPGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="87133913"
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; d="scan'208,217";a="87133913"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:40:33 -0700
X-CSE-ConnectionGUID: qu44Idw7SaiOdpQBCX/gag==
X-CSE-MsgGUID: +MHlfX0sQiiOvezaBqYdsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,218,1779174000"; 
 d="scan'208,217";a="288281739"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2026 23:40:32 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:40:32 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 11 Aug 2026 23:40:32 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.6) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 11 Aug 2026 23:40:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZMNAhijYYyXrn6JJFDozXqcQnNxURZNidKXxy0y7UhlBPOR+0j+K6B/XYwifgIla8NTswRyLMJpkZJLIe/gMdEOncoemXN9X5EQ4rO3EH0fpP9ayxrX36RbQlXOMWZqqT9goKnbX8pXELa19A81pFTr86CizGIStatXUvzFRlcAwd75Ce3ceFNCg6d6//Pfr3GQHvj5LMk5tVFJH3ecw0t3aiwYxQ5cysUUVINYwGhS2MJ93janaZnx6e5IjXXk2zd9GmXxNGXNf4JMw4zRyO84gOgqeC7ncowcWle/ltOYJ3xhhwhO38u7W5v3wfpYfWjmpvHdHlvPCZVnsa2TS3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nXMeuaeHF9TMsjXYio6wd81R9neo17AKme+QaqD69yo=;
 b=EXdKdBfXFC3VuXilzkBYBPK4DRzEFkJzGhMC2IaU34FUQNK/aUVKErpy0mxw3CsXcTnV+1xEDOh9R80JxH636BHDRkpCnDN4QSLZOtZkafgAlUPSwLw+UasIG5ToqE1vBVJYDZbZ+aMIW2PrFQd0f/ZqT86GGp/bVQC9hdsZxI3AcSw0wkZ+Z6mtYtgo1TrmZDMyf37dJ4SdPWESN1D38eVsINlzRG7lLi5ZRJ7y+TcwgOkWsujVVXdqgdBvZrZd5n7zkLkzBrPNIAFLiWBIbnDdvuG6jiDp9cUulANoHrs1ZynWaKWfDzMVc48gOzo3/FdWKcOkG1rYqOOEcNqLTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6207.namprd11.prod.outlook.com (2603:10b6:208:3c5::21)
 by CH8PR11MB9458.namprd11.prod.outlook.com (2603:10b6:610:2bc::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Wed, 12 Aug
 2026 06:40:31 +0000
Received: from MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d]) by MN0PR11MB6207.namprd11.prod.outlook.com
 ([fe80::52eb:929f:a8b2:139d%5]) with mapi id 15.21.0292.024; Wed, 12 Aug 2026
 06:40:30 +0000
Content-Type: multipart/alternative;
 boundary="------------i00FYKPb9CEYE8Wap8u0YRBX"
Message-ID: <f6c40f1a-6a65-4256-acd5-cedb98bb8578@intel.com>
Date: Wed, 12 Aug 2026 12:10:23 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 22/23] drm/xe/gt: Report 'pagefault' errors using SIGID
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Daniele Ceraolo Spurio
 <daniele.ceraolospurio@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-23-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
In-Reply-To: <20260730152121.576-23-michal.wajdeczko@intel.com>
X-ClientProxiedBy: MA5PR01CA0149.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b9::14) To MN0PR11MB6207.namprd11.prod.outlook.com
 (2603:10b6:208:3c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6207:EE_|CH8PR11MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f503541-58e1-4687-2d86-08def83c9a69
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|22082099003|56012099006|11063799006|8096899003|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info: dKeh2aSaoccFCdIPvZoXDdcVovp9HVAR0lLG7Ndxtjjv4t8F5IhkUXAV1hbpscImudrtWiynyo2+pcujYQqbicPaHgriOA/kdg939yxO+6XaIMA843t2RDoUjC4PlUz82d4ZV88vAnHzuj6IlocA4xCABzM1xmxBBq20//RWyaQ9i0EqX22L4enuTrHwSZDVQlqrbs6I4s0vRhIjZUZ6awuK3KaJ91WmkGX2pXS0k2xME2rNpP/gKLswXvHQldEOF5b/8Oy6dDdz3r3Qe5rZWSVD2QCJQPhoUqPCB8monUJRbrYXvNoDFKsFqYz1Xltcr/2UdSFDF0hSiImeOahm2f7wck6YCwh3HLC5S0K38QYkzQoayQr6+Q1V2gp49vGhBflSOLi3RssFkkGUAAp55fFkT1nQIet0tZFlwbHBuSr8M32EfdHiwiZXVfrjuUnrLRGs6pgdWh0wEpo5ASzZlM2bF6jFOdT7T6ZeW5ToSqmT5As5CfRBVtEczcOd1sguYbu1QOvDn4Ratn0uGix0KhsPxauR1DHyFF6bTmkfJtCyFf+FfYaWALVjFnr/im3BeOp9uzIC7CqaSu6Re6U1W2kyO1jm3w9sCkRIPtu88uWnx+eWPnk+qbYfBxjvvYlJbPowvJ77OSQKV2/pdDh8onpws9GWGwSPLOdPd85QQDU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6207.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(8096899003)(4143699003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0xIQjdOWFRmSldhOVd0YWQweURuUDEwQzB4bVhxclU1OWU0TkhWODJSRlo5?=
 =?utf-8?B?dkk3L282S21ucjVjc3ZEbVJKWDM1R0hReGtjUE9vYkFEdTZTTzNCT3pUblVL?=
 =?utf-8?B?cm82NUEyeXdIeUIyWTRtejcyaUFIdkNQLzdyVmMxK1NycnI5UjFNSmdjUGNi?=
 =?utf-8?B?a3NGTTAyeDNCWXUvUVlsMFZ1WVJBbngwWnlYNEhyalBpT3dJNVVIVzlQRDRU?=
 =?utf-8?B?VjlkRyttb214ZXU5Q2xGWjlQdGJMYjJxWks4OUJaM2VOQWFmeXRoVktSemFD?=
 =?utf-8?B?NEhtMkpuUkFBcGJiV2RpN3J0cDRSWldXUFJtWTlmL3FFblZjcmhIRVMvNkg5?=
 =?utf-8?B?aDlrcy9CVStTL2x3K1NLYnh4S2JvOXFRZUxoUWN2T2k3aXc4OFN0WVdyeXZ6?=
 =?utf-8?B?aUFYZUZQamhQRlMxcEg5QlhHbjltZGxQSy9YcXI4Znp1enB5RTQ1eW9ZUUMw?=
 =?utf-8?B?aW53a01OcWlFOG5mRkt6RFh2b1p0TDBRZWZLOWpST2hmczM4S2dKTlg1N3o0?=
 =?utf-8?B?WWRud1dGcEhtT2xGMEs5NmpTeFFpeFo4dnI2TnQ5YkhVVTFNM0ZQcnU3emNG?=
 =?utf-8?B?dHZCSncrRnBLeVhDbUY2aXFJR3pEdWZkYng2Kys2RS9laHVXNVpVUHBqV2NW?=
 =?utf-8?B?emlUV0N5YVlzUkV5bnh2WWt6WVpGYjM1ZHpBU3p4MUNVTDNUREhsNTY1THdv?=
 =?utf-8?B?akQ1dlNVOEJ0MXZvc2VCN045R0J4ZDRic0pLMVNNTEZjc2RSVlAvai9ZaXNl?=
 =?utf-8?B?Y2J5SEx0cW93ekdJdmdYenR2bXMzOEluL3Z5Z2d5N016dHZSWFhJVDhwMWdB?=
 =?utf-8?B?OExsZFVuUU81bFJUQkl3VXBydmx3YlI5VUI2bU1abDlyUHBjbkJBeXVHcUlZ?=
 =?utf-8?B?YUY3NTk3OU5taVkwV2FmNG1pQ2txZXA1ZGw3c3cvbkdyRkMvY0I2ZHMzenZE?=
 =?utf-8?B?b29WZ2cyWGhqQ3BWYWxsNmNHMVJoK1RtbTZCZEt5dXlZT0d4SVloK1gwbXVH?=
 =?utf-8?B?dUtoM3p4Sng0V052WnpRb05sY2ZhTnI3bUZTYXBHMG5ldjIxRjJrV3lHUnNC?=
 =?utf-8?B?YnZKZzQyMC9BTXhMYjRoeTBwZzk4OFRpTi8rN2VPVEh6OXlYcGJxaURZNnpZ?=
 =?utf-8?B?NEVUYVMwTEpXOUxkdzU2aDlDQ2xlc1RDTGtrZEM1cnBPaldTOG16ZmZ3dkxQ?=
 =?utf-8?B?cElXY0pqb0VZYTJMVVMvZWprNUJ2RTROclBrcjRYcU5pcHlKU3k4S293cWZk?=
 =?utf-8?B?QzVpMDFaeVk4ZlBFeHFZeFVJbDVLZGRPU2h6TEJHaXJIQlhnSm1XMEtYNFJR?=
 =?utf-8?B?Sk9LYmYrR0g2WG55VXRiOGVISjR4MG1kODhoR0pqaEcwNVpNaU1WcHRBb29l?=
 =?utf-8?B?VnYxem44U21qT3lsWmNLMjJPdTJvWm1uQXpnSmg1WFhVSlBTMmhWZ0dtaEZ0?=
 =?utf-8?B?djN5L0dEKzYwdGhGMGtrQWUzekRKMS9vb3VpTmIrbHY2TDNOeCt3YnR6TGFi?=
 =?utf-8?B?dUdJUGdsV1h3MDlrdGsvV3FDUDR0MXdhS2tDUFh0cHVCMjdGR0g2T1N5R2Jq?=
 =?utf-8?B?R2tQbFFnbnlERURiRmxYN2dwTmtEemdkNTVONmI3SVBGRVRQalRoZDlFamVQ?=
 =?utf-8?B?SEttZUdrQVJsR0xNNGhIajNEOXVTOHVCbnozaVIveVJYY1MvRmFGRFpxT1dh?=
 =?utf-8?B?SEcrYW5ZekcyZnZ1RFd5SStiSkEwN29VT3NWTTJtYkZBWTRiSk9BM29yR0x0?=
 =?utf-8?B?ZTZZY1pJakR4di80OXh5ZVRXdlMrRVhrYXNvcno3QUhVVEhVVzhOTXVvVDRT?=
 =?utf-8?B?T0E4bmtRK2JDOUt5TmtCdndSd3A0UStwejI5K1lSSzc3REEvQUYyNmJqZ3RB?=
 =?utf-8?B?MGI4bVo5SkxFL0NmcTlBSTV1ZFJQb0U4N3luVzZLZ1RJUVhBSDU2K25rL3Nx?=
 =?utf-8?B?MXN5c08yT2pLb3Q2SERBdk9IZ2R3dmV4VWhKQmdvell1UDZPRi9oNUdyYi81?=
 =?utf-8?B?cWpVNk93SkNHZVpXL0pTUzB0Njl5UmdXMHpjT28rclZsOWw0UjkwQlkwVFE3?=
 =?utf-8?B?NTNHS082ekhIZWlMc2Z0TWRXSkljaVJTQTdNU0JXaHFWM0ltejM3cXgzeDMy?=
 =?utf-8?B?Tm5SZ0JWT3lJLzVUL0hVRlhXVTZkSFdzY3U4RWthMUNyTHh6aC9ESHhzTzEw?=
 =?utf-8?B?bGJiM2J6VFQwLy9VRlRhZEJqWFcxMGpMVTJQNlZQMXcveWQrVGpzamJNVHJs?=
 =?utf-8?B?aU4wYk56YWk5QkcyZW1zQWNwQm9BbjRXN3JkalYxSnIzWjE3d3F3UENUVnFj?=
 =?utf-8?B?UkZGU1EvMDhaWWFLQlFwNHhUMWFuVHZxMjJ5K2NrZDdFUG9ielAySVdudUR2?=
 =?utf-8?Q?tWrLpkG37MuFy1i4=3D?=
X-Exchange-RoutingPolicyChecked: lLACsLsfRdtfWSIu8KGfHJUPJALEfNoUzEJQ7v6Uh26GDbaxhd6hGSVngDxSpvmmizYuwvf4NZik2ykmh2bfiFoYH3sY6pfHAHuTxWm5lmZqLQ+3cqAU3gmCdx5CXs7vBfrSNxVCrnNdzvz0qyO7iAVtcBVpBARJ1gm+OuHk9PibRpGMv1PlX7PmskLoory3JR83YDnksQMRMBoSmAXP/rwMAgaFld0IYeZXtjtWJl2/0bLB57mK64tPN5Pxdnv4CaQDnsQuUCI0VZPk1PbOeAoHE7oqgL4jDeR7y/6PapC8olXgDYY06eTFWrvzzDVwsoptCUjM21jkd/xcim38JQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f503541-58e1-4687-2d86-08def83c9a69
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6207.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 06:40:30.7463 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rRAF3lBrABi+0UrihM7X6U5KwQIaMEYus2kKNjlojARV0ykHfQRIj7FcG1eHklH7ZRd+mr5BqSU6040/e84u7rlk12QX7coiAQgHsjx1fU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR11MB9458
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

--------------i00FYKPb9CEYE8Wap8u0YRBX
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-07-2026 08:51 pm, Michal Wajdeczko wrote:
> Report 'Queue full/Unsuccessful response' pagefault errors using
> xe_log() helpers.
>
> Signed-off-by: Michal Wajdeczko<michal.wajdeczko@intel.com>
> Cc: Rodrigo Vivi<rodrigo.vivi@intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>
> Cc: Daniele Ceraolo Spurio<daniele.ceraolospurio@intel.com>
> Cc: Aravind Iddamsetty<aravind.iddamsetty@intel.com>
> Cc: Mallesh Koujalagi<mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pagefault.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
> index dd3c068e1a39..e78c855759e1 100644
> --- a/drivers/gpu/drm/xe/xe_pagefault.c
> +++ b/drivers/gpu/drm/xe/xe_pagefault.c
> @@ -14,6 +14,7 @@
>   #include "xe_gt_types.h"
>   #include "xe_gt_stats.h"
>   #include "xe_hw_engine.h"
> +#include "xe_log.h"
>   #include "xe_pagefault.h"
>   #include "xe_pagefault_types.h"
>   #include "xe_svm.h" @@ -309,8 +310,7 @@ static void xe_pagefault_queue_work(struct 
> work_struct *w) xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &pf); if 
> (!(pf.consumer.access_type & XE_PAGEFAULT_ACCESS_PREFETCH)) { 
> xe_pagefault_print(&pf); - xe_gt_info(pf.gt, "Fault response: Unsuccessful %pe\n",
> -					   ERR_PTR(err));
> +				xe_log_err(pf.gt, PAGEFAULT, err, "Fault response: Unsuccessful\n");

Drop Fault in message, otherwise "Page Fault:  Fault response: Unsuccessful"

Thanks,

-/Mallesh

>   			} else {
>   				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
>   				xe_gt_dbg(pf.gt, "Prefetch Fault response: Unsuccessful %pe\n",
> @@ -487,9 +487,9 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
>   			pf_queue->size;
>   		queue_work(xe->usm.pf_wq, &pf_queue->worker);
>   	} else {
> -		drm_warn(&xe->drm,
> -			 "PageFault Queue (%d) full, shouldn't be possible\n",
> -			 pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
> +		xe_log_err(xe, PAGEFAULT, -ENOSPC,
> +			   "Queue (%d) full, shouldn't be possible\n",
> +			   pf->consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
>   	}
>   	spin_unlock_irqrestore(&pf_queue->lock, flags);
>   
--------------i00FYKPb9CEYE8Wap8u0YRBX
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-07-2026 08:51 pm, Michal
      Wajdeczko wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260730152121.576-23-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">Report 'Queue full/Unsuccessful response' pagefault errors using
xe_log() helpers.

Signed-off-by: Michal Wajdeczko <a class="moz-txt-link-rfc2396E" href="mailto:michal.wajdeczko@intel.com">&lt;michal.wajdeczko@intel.com&gt;</a>
Cc: Rodrigo Vivi <a class="moz-txt-link-rfc2396E" href="mailto:rodrigo.vivi@intel.com">&lt;rodrigo.vivi@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
Cc: Daniele Ceraolo Spurio <a class="moz-txt-link-rfc2396E" href="mailto:daniele.ceraolospurio@intel.com">&lt;daniele.ceraolospurio@intel.com&gt;</a>
Cc: Aravind Iddamsetty <a class="moz-txt-link-rfc2396E" href="mailto:aravind.iddamsetty@intel.com">&lt;aravind.iddamsetty@intel.com&gt;</a>
Cc: Mallesh Koujalagi <a class="moz-txt-link-rfc2396E" href="mailto:mallesh.koujalagi@intel.com">&lt;mallesh.koujalagi@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pagefault.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_pagefault.c b/drivers/gpu/drm/xe/xe_pagefault.c
index dd3c068e1a39..e78c855759e1 100644
--- a/drivers/gpu/drm/xe/xe_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_pagefault.c
@@ -14,6 +14,7 @@
 #include &quot;xe_gt_types.h&quot;
 #include &quot;xe_gt_stats.h&quot;
 #include &quot;xe_hw_engine.h&quot;
+#include &quot;xe_log.h&quot;
 #include &quot;xe_pagefault.h&quot;
 #include &quot;xe_pagefault_types.h&quot;
 #include &quot;xe_svm.h<a class="moz-txt-link-rfc2396E" href="mailto:@@-309,8+310,7@@staticvoidxe_pagefault_queue_work(structwork_struct*w)xe_pagefault_save_to_vm(gt_to_xe(pf.gt),&amp;pf);if(!(pf.consumer.access_type&amp;XE_PAGEFAULT_ACCESS_PREFETCH)){xe_pagefault_print(&amp;pf);-xe_gt_info(pf.gt,">&quot;
@@ -309,8 +310,7 @@ static void xe_pagefault_queue_work(struct work_struct *w)
 			xe_pagefault_save_to_vm(gt_to_xe(pf.gt), &amp;pf);
 			if (!(pf.consumer.access_type &amp; XE_PAGEFAULT_ACCESS_PREFETCH)) {
 				xe_pagefault_print(&amp;pf);
-				xe_gt_info(pf.gt, &quot;</a>Fault response: Unsuccessful %pe\n&quot;,
-					   ERR_PTR(err));
+				xe_log_err(pf.gt, PAGEFAULT, err, &quot;Fault response: Unsuccessful\n&quot;);</pre>
    </blockquote>
    <p>Drop Fault in message, otherwise &quot;Page Fault:&nbsp; Fault response:&nbsp;<span style="white-space: pre-wrap">Unsuccessful</span>&quot;</p>
    <p>Thanks,</p>
    <p>-/Mallesh</p>
    <blockquote type="cite" cite="mid:20260730152121.576-23-michal.wajdeczko@intel.com">
      <pre wrap="" class="moz-quote-pre">
 			} else {
 				xe_gt_stats_incr(pf.gt, XE_GT_STATS_ID_INVALID_PREFETCH_PAGEFAULT_COUNT, 1);
 				xe_gt_dbg(pf.gt, &quot;Prefetch Fault response: Unsuccessful %pe\n&quot;,
@@ -487,9 +487,9 @@ int xe_pagefault_handler(struct xe_device *xe, struct xe_pagefault *pf)
 			pf_queue-&gt;size;
 		queue_work(xe-&gt;usm.pf_wq, &amp;pf_queue-&gt;worker);
 	} else {
-		drm_warn(&amp;xe-&gt;drm,
-			 &quot;PageFault Queue (%d) full, shouldn't be possible\n&quot;,
-			 pf-&gt;consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
+		xe_log_err(xe, PAGEFAULT, -ENOSPC,
+			   &quot;Queue (%d) full, shouldn't be possible\n&quot;,
+			   pf-&gt;consumer.asid % XE_PAGEFAULT_QUEUE_COUNT);
 	}
 	spin_unlock_irqrestore(&amp;pf_queue-&gt;lock, flags);
 
</pre>
    </blockquote>
  </body>
</html>

--------------i00FYKPb9CEYE8Wap8u0YRBX--
