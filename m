Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC17CA1007
	for <intel-xe@archiver.kernel.org>; Tue,  2 Sep 2025 18:19:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8979910E819;
	Tue,  2 Sep 2025 18:19:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fsUMBH9Y";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E13FF10E1E8
 for <intel-xe@lists.freedesktop.org>; Tue,  2 Sep 2025 18:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756837198; x=1788373198;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=tzBJoqGHPHVDSM1D4unhljHIfmgoKlBw+DHi3Bt6lU8=;
 b=fsUMBH9YTlGa5zd8pauMI1FsmZmIFXghdHAmceWS+Jxe6jTtOk2/0RLS
 8MNbrf5ueeseaE+Wl8tS1Vuoycg27L1Ke4SvtekDWJ4dTIBeKlu8mHCl2
 5Vxi4AjgVNvdqQTvVckmTNEvweIGhgMGyYdYpfsg/wtl1UNbIiPX88/cB
 v6brkZeeBVT93ohfj5w1oOuG+6dL25cV1RbZl4mG1PIl8k/SPeYAHbhpq
 a5lgitCOC+IAOQ/0NfrgWiuGmlfcMq5I7YIlLTW/S46t2uvyH3xdBFINL
 eiaidtCgchPaRsWAk/3h6SjvEQ0ckuSKFNfQGlObWezW+RP0IDUzxeFHH w==;
X-CSE-ConnectionGUID: pbKANYPHSWG9Su33ZCgaOQ==
X-CSE-MsgGUID: zMPfjmAkR6CY5dImvq7aGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11541"; a="69389093"
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="69389093"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:19:34 -0700
X-CSE-ConnectionGUID: sT+bsdpZTqmc6luO6eTsWQ==
X-CSE-MsgGUID: lHXONHiwQROmt4IOy5APzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,233,1751266800"; d="scan'208";a="171506682"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2025 11:19:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:19:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Tue, 2 Sep 2025 11:19:34 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Tue, 2 Sep 2025 11:19:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BZPX4lkohV8rtV8wZbRgkKq6p55+C0qNM1+nybiPAaWYW96zgrBRSjnKJrNX67PaazjEVQrQ4+4n+PDyuDIyTMx3zQPk1KuARw8Pqd6vr9gRQkP3iS6zwVoYrvf1ZFlhSWqoNXwnD3ds8mhmhidDeqY23XDlcbeJn7ENCw05ub50XeQf1NYlmGVNDlKSgHOgUH4lTp+dPvpL7n9yLjq/M8mMlK0lLaJwaL0CZXSZDR/s7ciNyStFAa0rPqARGp3l9jM/CpceJcLn2LM2Kw88bEwEG/eRs2G9+53LIK3FlcBM1LiJLW+bfCvDEAXb1D9+JwYFu/6P6ZppIfwdYLOdbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUEo5UStpFsHcKrPFvAOp44gbfbCHGmMQu3RjwoGFXY=;
 b=r4AvzOEq+Lc7UM8FFEmjvLF8aYYYZv/aVLnzj/ZuA6+Pnu9DeWRqbIsKh3PfXZlZNd3+ue0IsbhRq5sCKSH6Gx2ko8JQTqkLJqXopvE56/431ISkbgBKKlgr0bUZuWyGKvfY13kuLA4Qp88cgTjhDjVtzV8WoLGJ8OkN2ukvzqHSwuvPhTeMDkWvrQjVKz7M3EMOOt+nyrWmjWinPV3SCOPKHIXzDtU0FCpWDQwc1LK8h9FEYy4rAhh/gcQkp8m8emdV0H3fdCWAxvurncoTi03adj39q4C5Jw1IPaCXCgIRu4c4CGJ4Em9vU2ou1vFexgkiOb68/iQ5/LdVBFQ/5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by LV3PR11MB8483.namprd11.prod.outlook.com (2603:10b6:408:1b0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Tue, 2 Sep
 2025 18:19:32 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9073.026; Tue, 2 Sep 2025
 18:19:32 +0000
Date: Tue, 2 Sep 2025 13:19:29 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 6/7] drm/xe/kunit: Drop xe_wa_test_exit
Message-ID: <nx6q3n7vjy3fgeukd5a2j4nu6w2ivw7sspwebhaw5a635gkqzw@ly3tlfbs3vbr>
References: <20250829171922.572-1-michal.wajdeczko@intel.com>
 <20250829171922.572-7-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250829171922.572-7-michal.wajdeczko@intel.com>
X-ClientProxiedBy: SJ0PR05CA0036.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::11) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|LV3PR11MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: 64b7e57a-a675-4603-f322-08ddea4d4338
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MzXmuFDgPHSnIMezjWwW6iJirDvcH0cpEMX0YeyRDirTXYvJdjZS0KKHITT8?=
 =?us-ascii?Q?T502JNwTASm9lSx71snZkaDSKBrh1PpwtLDMB2N+LZLXm60mw4cOexcxmOLF?=
 =?us-ascii?Q?h3PNyIfBDVlotfCvwhRErPBadBoq89qEIMT7rbCRyyj/1xJ8c1G/TPDGb7I/?=
 =?us-ascii?Q?1D1KdtFLfn3Y0VEKzJ0+5uknZ9G+kwftBImhMZ/Ls7KnFi3OBVMo4ln9TvH1?=
 =?us-ascii?Q?9ZHpOkOou4/Wxf4+DHgc7DjVIjSF9eDKlqZGAmeP5zxs4gVsU+/BPJYVvVDb?=
 =?us-ascii?Q?hjQ7lOau4kW9Io5dbV8rBkVZG9XYsw2vXzVl7QIZKFD+pD5BpbNf8d67yBi3?=
 =?us-ascii?Q?NibhJDs5Z/7aeAfOP7jhdIn0NkTh3wPA1FQGZAXmb8JgmivNImWg/rTM8fuO?=
 =?us-ascii?Q?neCgEGJiUBLFHJs2jhQcODrhJ8UIfMpynwarJxl718dIM/Fi4+oE8Far2f2d?=
 =?us-ascii?Q?2zKgB0O/Oja4zimIZu1CKBf4ethca7t6WxvZZZnvLmGIF1DsWbP0ZQthTP9S?=
 =?us-ascii?Q?7OhmKJjnoElpcCrCEmPM6lWKZ6vRrYLPF2HzpHb7TIqdmhIuyYrSc4qggkEm?=
 =?us-ascii?Q?iw6KaMB0LXrin9GcpKeMZb748mEcSJUKLw3hsC4PKGNFVMbrKDt1Aey1CMST?=
 =?us-ascii?Q?nb8nDwQe8IBPLfLg4hY1OSSOX9WzOwFhyEKXAlGjjofuns6OA+G/7TH/XFJf?=
 =?us-ascii?Q?b9se6UR0Y0kQuOk5YcOkSzEOcR2ysujgYkb478b+pnArfkQeR/dipMdq/lDr?=
 =?us-ascii?Q?DzXufNGMHhd7CMzHQVOSulR684EMgqi60514j5JmjbZ72aqAdEw0wmVMERdx?=
 =?us-ascii?Q?LOLMKJCLT6rSPjRbX9NutjpjdN1FnB0vdh9nHRcH6bUllZl0EF+caMnsOimU?=
 =?us-ascii?Q?lNpfU9rjUNC6c6sBB2HNoVBWgQQN54M8P4aQr3L5TfNpj/2HPCGy4+ZwIymq?=
 =?us-ascii?Q?T5kKfVUYXMdbFd1kshEHyWg8++xgDMxyR0dl5udbsEi2G1gTUtWuERnA5st8?=
 =?us-ascii?Q?a+NLridjCsOuuC5YIw7hli6yXNtTaI7C+JNg9GzczZ2gRL7vZLtvldUIn/UQ?=
 =?us-ascii?Q?DiADOg3HIOamstxUFNwEGY+p6oDVuSxBDS1EQa25lW/E3fpOTsyGMzoANdep?=
 =?us-ascii?Q?MuD5mn8ZU61eKlj6E71J7maIGoa/J8gtMWLcwMS6wW7qXziNmmjw3D65kcma?=
 =?us-ascii?Q?7OmzoCHl12qWvp00udDH7Po1yf3U1I0AJOr53QXUFgVRNP4Ypjd/KE9CnTQd?=
 =?us-ascii?Q?kjTw2S+dlXU4LJSypkWrd0zzUdaBLmsGnc0KygGAl7+aQsQolqYA9eTbp487?=
 =?us-ascii?Q?k4kQo91CV7/iKxYyc0opcADvvh7jpiYKtCcp9gAcuyUBC9DW1aixGNKqlUGR?=
 =?us-ascii?Q?nrcdQkfpqMrcBNQ623GPrRC36o3dFTBczOuteTSDPiVDhFvfJS6g/fZ7Y/Pn?=
 =?us-ascii?Q?Jx/dUiheUEY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pvPsYaDjKa8maYYfsQj+QP8Z49cFyUYmiMw9T3AnVbawJAQsObPVdG1Slkao?=
 =?us-ascii?Q?KrWulIlwC+smoJa3IMt5d9RAytcTtGXSN4NuLXOBEZ/5E7RlPAlyIwv85XEo?=
 =?us-ascii?Q?FrnLdvibWgsLkOztwMBOxkWfH+KzJ0w6ZJ3d8bJT9KQX3q7y944jnJ/iTM61?=
 =?us-ascii?Q?3wCF1OXcXfJjIl7z91clwW/BkXaI5fekh+gJUsBhPAI6VL/SSKDbpoLE2GM+?=
 =?us-ascii?Q?SGjsAZcKnmi6/JTVH7BYyat7h6pdEx+xJZxGdklry7acPXrLUuDzZlue67T/?=
 =?us-ascii?Q?iK8230HsXsKjp+9FqzijXLAZPikcHescxuPJiETy2KKlBPYmHnPpOoqosqDa?=
 =?us-ascii?Q?Q74JCuaVtBjHicuhcTTfSB34PHArLLeUgQvXS/ClJ9e8a/E1R6Zl/lHYUnZE?=
 =?us-ascii?Q?p3/euhuSQkcyG+D+u8P4hxaFh0zkitNqhZHN7YyzBYbWtfamL+T5d40Qjyri?=
 =?us-ascii?Q?mGHihWb70kxVzwl3F7+Tc7/nyQbLmVrI0pOswBPoCh6SGLjhHjoZz8EmMzVh?=
 =?us-ascii?Q?vspNaiCh3jI/0jVDZjHV+hlZDn+WLa66hGC84s4qvi73CTb52lLBRs+7CUZ5?=
 =?us-ascii?Q?I5Cltf7k1m1Ek7Iii+MIkyHkGxWTKt1e3V66L4jZEqPy7b4LgsOq74A00z2B?=
 =?us-ascii?Q?eWfWL+eLXjL2FIR6LUfkGAg8QYlUYLq6F3fVdjV9UuO+P+p0u2FEUsFd6c8a?=
 =?us-ascii?Q?xbIxrYcvwTl4B4eDOmc1b8h3QVZJisLgKbkF1wX/BjjmtbtHnJIRwi4g7pZ4?=
 =?us-ascii?Q?ihMlJ4iUW94B+/j84fPlJmF4we/SQtm4hILJBLAjU/9grEvcjM1qp9SziKsP?=
 =?us-ascii?Q?QZNLelPnpLqDdd/K1q8Qdt4uH10UyIdG3/StzFEQDqBVBXOckcXQgUI80waf?=
 =?us-ascii?Q?Nu0zGmamKjjs3byta4QVCP/bxyeVPvRtzNdWaxWCn/OF5kbmkHjqpf5+CP/i?=
 =?us-ascii?Q?tEvgZ3VzOpifSZT43ZvouZHKrfqciBeeBwc+oX6W9r+R4yyX6qXQXQr6xAYv?=
 =?us-ascii?Q?toLFEP3uvhV5z2zFgu8ZdsxJ4iqJ07cQI5xUjnmWZIvHwIqbrYc/b92YTMFa?=
 =?us-ascii?Q?qJCUWkExri0ijMhQ180MrKVkJefc2vATU6d/yZvL4G9Fj4Twp6a0UYl4DU9k?=
 =?us-ascii?Q?+bVcPCNlVtrPhzqAx1/FAJH3RphT09HCWbxgU9Bn+EwIMj90Qb+KLnwKh+vh?=
 =?us-ascii?Q?wTBK9VJJRbCvbHOznpJdQGW+BKGZkWAWvHFTApGCA3RBAmM+hDXYyvlFEgzk?=
 =?us-ascii?Q?5421cXqhNxsu6y26WXnLZr/ayeTPwvUlOeTEQ678m9rlTDLhGxhyIEIWQu4p?=
 =?us-ascii?Q?vi/H8lu5vR3rKWvolHcXNpVlkpMiTYSOLC+pyt1yHR0CUsULru4GcJo2MKwA?=
 =?us-ascii?Q?96xzP2eNWLEY0LORCIWtllsLLwhCVj2lhbL3RJ+f6eLWzpaVMSlr7JlHbjQ4?=
 =?us-ascii?Q?REvf9JsayCQr8f8lWy+wMsIdbA1UVJkHd/SXosPbEMXmc273nl7gZPg9vAQR?=
 =?us-ascii?Q?0Re/o5Tupv3zLcCKfBT/2SsVGs3s92jMMFFSk+O0KLYmXYD8LwJSx/xrrrgS?=
 =?us-ascii?Q?SoAcwi7h4Qr7xUcEJCiZ5Yjy0JzwJkUNXULy2ulsgZ17GGCzVnF1hjacdTLQ?=
 =?us-ascii?Q?/A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 64b7e57a-a675-4603-f322-08ddea4d4338
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 18:19:31.9466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RBok9Kj33GpLqtNR5D/g2ZwWRfoWr9OEVchwA+J9mG3XgFoEm/okzAkK1zHhhppmeGpNtXcuInAHhuTuXx+Zx1MCZUAludd/ccN5v8Zkmr8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8483
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

On Fri, Aug 29, 2025 at 07:19:21PM +0200, Michal Wajdeczko wrote:
>Remove xe_wa_test_exit() as it could crach the KUnit kernel in
>case of hitting some asserts in xe_wa_test_init() as test->priv
>could not be pointing to expected data.
>
> |    # xe_wa_gt: ASSERTION FAILED at drivers/gpu/drm/xe/tests/xe_wa_test.c:34
> |    Expected ret == 0, but
> |        ret == -19 (0xffffffffffffffed)
> |Bus error - the host /dev/shm or /tmp mount likely just ran out of space
> |Kernel panic - not syncing: Kernel mode signal 7
>
>Note that there is no need to call drm_kunit_helper_free_device()
>since our fake device allocated by drm_kunit_helper_alloc_device()
>will be cleaned up automatically.
>
>Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Lucas De Marchi
