Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ADFC60A3832
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 12:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g3BN85bW
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC47D10EDC0;
	Mon,  2 Nov 2026 12:43:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C41710EDC1
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 12:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793623381; x=1825159381;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=6SJvKguI+kmUshCRF7RmcRgXzIbsr8wd7HbGjVYPjw4=;
 b=g3BN85bWg/Rq7NdIjqnd2LY6IVLcIY06GrJAgM2Mv51YL9DWVkWCFJbl
 gOTeb3XD+ILFKw81mZy7/BvuXg1MtDA6mLD07jLTiYWF+0G37YeG909Ei
 iKphwnvmvAfiRP4I9l4xHv2OzsGYUcI3d/V0HieNryksKR+s0qwjpr6Mx
 2bQCSNSz5HeDdAwoUDL5cwYpY8ApVgepBKsL43tO20K7ADTQyhCB9FJaI
 P2KsjjC6v48ah/04RVSmOxMg/Qi98GnTghkPu5gwLpQcfvsL3bQ0oXzil
 8pJ0SfGXHysgrsil88x3YRGFCaW9Ev806pwQJppilBjhV0em4GJ/95vhW A==;
X-CSE-ConnectionGUID: aMZ0lYK/RBOR/Lg7sphdvw==
X-CSE-MsgGUID: 7SVRR0EHSgmSJjCeiWOUiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2305709"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2305709"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:43:00 -0800
X-CSE-ConnectionGUID: 9R/u4+2ZRd2c+A1/yJ3R3A==
X-CSE-MsgGUID: +F6pBayzR6WNTTKfzM20/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6457802"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:43:01 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:43:00 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 04:43:00 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 04:42:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gBeNFKzXw4s8CNFpMi1P4JTDD2T3+tANyTZkSsh/60hkQkO6h/FwZljWdf5F/11tKO+HXXTaur6NmKzpYWHWCesDbiKNV9Bvc8uenlCkPNphvJ0NnPlqB2Ym2WqinIVH5uStA89iZ1vmaFXlFR/+bmLFGqRSTNu+jL/X8rznRCVNsxKuFVb19lLXpRHumJo+JYlQuz/tmTIZkvVl152eDgtmcfodOlmr9Ip8Iel9zooXiFTPRDe+NjwwGZ5HR91p5lX0Gt0wCUTsYH5WyeJemaC4ML6A9JVMMAfyzy6C2vf8NSVa8LtyHBrFYFRyMw8xbJ9300UagiBMGkfsL2uSfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOAh7aZ9c65S+EL74r1nDz/wVN1X3a4w+4oV2RvYmg0=;
 b=kZRjQqLD5cfHVMNCq1RUipwdQIverFPsK2NAFzzH2sWvAxSJxLb+iGyUvltQw2jSVpOvZTxkq3VFstPNOyHasAkZk1FLQhAiD8huk1Zzt6cvVudL2Zu3CnMxOuduym0oPNKXGhmw9YWANTsM4YX5pK82QnCAPMlHXvQqLZ+xEKL+3DW9ZIg1ra4nOkBGz6aq44NIc4lau9X4zz3djZVPNlBh2KjhSAn51Q1QW3m9FJBJYZ4fdwEZ4gWZF9hF3Z5jLbFB5Dse+2IIv8bobGn7gaAQQdLABhsClrd0izD4lcHqUOfEpF//XcjaPV0VMpFRPGeEnfdESasE+DpQDDzcEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by SJ0PR11MB6696.namprd11.prod.outlook.com (2603:10b6:a03:44f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 12:42:51 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 12:42:51 +0000
Date: Mon, 2 Nov 2026 18:12:43 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Gustavo Sousa <gustavo.sousa@intel.com>, <intel-xe@lists.freedesktop.org>
CC: "Tangudu, Tilak Tirumalesh" <tilak.tirumalesh.tangudu@intel.com>
Subject: Re: [PATCH v2 04/10] drm/xe: Factor out {min,max}_idledly_ps in
 adjust_idledly()
Message-ID: <auiFQzhrWnqYnoNE@bvivekan-mobl1>
References: <20261030-wa_16031259911-v2-0-919fa1c27070@intel.com>
 <20261030-wa_16031259911-v2-4-919fa1c27070@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20261030-wa_16031259911-v2-4-919fa1c27070@intel.com>
X-ClientProxiedBy: MA5PR01CA0293.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21b::17) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|SJ0PR11MB6696:EE_
X-MS-Office365-Filtering-Correlation-Id: 1090b4e2-a233-488d-448c-08df38dece5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|23010399003|366016|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|56012099006|261009223027099003|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: BTOEfAeBvOCtDmLCF3EDQyjHmWUOwOjuyS9Sn0SmGNRI8Lm1Dg9uka0UBwjFTTdVTL2higIrBP984UeRdRZYfPJAOwmlVw4fdOVfnsmemlE/UeBR3sYIpIc3o65Ztk+BT35LcDepoocwwK9zKirdHwDtQuyBdaM+vSCGNoOLLmm5STM2b4bxmSC/j9qaK+9XcgdTrdeE71vJ5q6WXW1xip0d80xzP96R1tCCtJIxCamn0WCel+IHUcjW+Q/al7kwkVPAXt/bCK8g57aPhRxnXvd0nWC/eVklUG+wT6wMjj2RcIQFtkQUfRkSOqaT6W9vJ2BoCiux5C0yX1znCgQtNOCm8tPLLDRWRO9Ioqg4ap2x+ik3AlA3nTtM6z9oa8V0zwORGbjHwTY3zBOvhtaxEpwITRdaA7KYbNJARBc45a2CafD55xsS6aUqnI/2Nub0CKNz2Jk5dnt/M491klw3PTio82AVMzVOnwyB54nplkeRsdZ9D4/ZUNASfrw+20y2dsYjMfcTvoID+LIL3p3Unqh/gKL6NqqlW8LpHiLAuFL60Xjz7gkCdUZ1tAobQ3TgOgEm5Mpfi1U20FgD0EOu8VDlEK7a8Lyio7ocQG1usUtS6hmLSu4Tdyy/73dM8XqOWWf+5M/OasEsfb11FWOhvYVZ+XV6H4fUWPHBnpuCQwI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(23010399003)(366016)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tzk0T3FGSkZQbjZLWUpCYm9UdnRiSnc1am9TWUxEL2gzOXgzSW5KMnk1aERs?=
 =?utf-8?B?aDRtK2J1WnM4NmdCNXhpVEVzZ2VjT3dIa2JwdThOUzJpYXozVk9sODkvTzVE?=
 =?utf-8?B?TG4rbGRCaEhJQVNMOXliT2laNStlQkhOTVJYNWlPSFpuZ0JiMFhhZ2pPNVhJ?=
 =?utf-8?B?VVhKcnpsdWtyYWl6aU5FMGoxc0FNYzMyVGk5azJRR05CVkFSUTk4dmtGYmtH?=
 =?utf-8?B?bWJpNDJNWHBkMElFWW90a1ZSOHVWaVFZOXJ5dkVNU2dpU3N0Z3BKc0VQMjd2?=
 =?utf-8?B?aXYzZUpNT28wTi9yaHN3eGtOdjl4b1N5bm5kcHg0NkJXNFhDTGR2RzFlZjhC?=
 =?utf-8?B?TzdzWnRPUVphRXZOdUtZVVI0QU1naThpeE5Pc25waExuQ1NnbHc1d25PaHJn?=
 =?utf-8?B?RVVvM01KazF4eDBDSTJ2QjlFRXFqT3o3Y3dHQkFNRGVJd0VnbFdtRmhUY0xN?=
 =?utf-8?B?WHBLZWZLT3RLQ1lBKzdxY1JrQXgzTU00M0NtL0ZZbXg1ZDJhZXBLQTB3Y3Fu?=
 =?utf-8?B?MTJ0M1ZpTGF5N1l1UUFha0lHTjhjelQydW9mVEJnWHYwM3JidjNnYlRZN3dG?=
 =?utf-8?B?blc2T3RqTUpUUUdXUGQrcDZ6cnJDWHpTZkMyQkNyOUNvWGdtYVMzS2lxdDVJ?=
 =?utf-8?B?OVdIMFdieS9RVlY4by90alRXajNNcXBpQzFnMmtKRDhiUjlHdmpNYWsxS3By?=
 =?utf-8?B?dlJ4RmIySGdSdW5XRjgrdTRjK1REK2tEUW9iZndnMmJGNEFMVkljQVRqQjVT?=
 =?utf-8?B?cmRTbGtBVVNsUWlPZmZuTWxpd3l0QTNZci9NWHdSdjBBZWZvQTB2Nk9XTEl1?=
 =?utf-8?B?TklPeTN4U0NhMVpZWDRXNVVSelNZT2dJM0RwSnBDSU45WDFDekdNRUtLZ0VQ?=
 =?utf-8?B?WEVzZ040bVhzdm0wVGQvQVZyeDRlOWRXSlpuRjVKczY2eStPd3hUVVhaTUpR?=
 =?utf-8?B?MENURyttN3ltKzlYYUVKQXBMR3pOeEJPNldOcjh1dFBDc1dPV1NzOGpNcHYw?=
 =?utf-8?B?TVBVWDBkRGJJamZTR2xtNVlsWTRlQitINldWM3VQRStqUFhQN2Rab3ZHMzVa?=
 =?utf-8?B?V1gwTkVZbEhJMWZ5VTZ4TlkwaUJPR1RFaE1SdTcxZGZzL1cwalBieC9nUk16?=
 =?utf-8?B?aG9EVHF1dU4wcEliVEcxUVBpZURDYWNWUnVoMC9CV3I0Q0lCOXBUcEZZallZ?=
 =?utf-8?B?VmQ2LzJ0UUZ4c0lvNGZPU0FwTWw0ekgzQ2JFWUwrSjZnYkc2dU84amplTlE3?=
 =?utf-8?B?R1daV3hpbWJxMklnUVBqQ0NHb0s0bjRCYXJvOFNqd0tLc3dnNlgzN3BMTmpt?=
 =?utf-8?B?dE9wVzJONDg0d0IxaUtRU3V2MU5JSHAxQ2F1TW5GSy9qb0dVR1lxa29XbDJo?=
 =?utf-8?B?cDBxL3pGWFg4MXdHS0IxQU1zQ2xYRDBuMHNReGw0dUZwWGdsTEpjcnR6dmhl?=
 =?utf-8?B?UzVZM3RSTEFhczVnL1lDUFlqUmtwZkovMFMrbFdtd3VGSUxoK2hNQ2pqa2dY?=
 =?utf-8?B?RWpCd1MwbS8zQWdvWnJKK3FuVitHelEyYllHZXhXejVuVUZkVGFrZHo4NHIy?=
 =?utf-8?B?QXFvRFRQMThvem5yZnJ4bFRaRGJ5dCs3Zy8zUVlOaGVNZ3VuU2IvTzExZVU2?=
 =?utf-8?B?dXQ2WGU4eVMrK2hTQk15MFkvY00rcVhrTVJpTE1OOTlvekxZYXlZTFp2QnRp?=
 =?utf-8?B?cU12SFJjMUtFaXRCeWE3cUozTHZXRzBSTE1uZUNWdXl5WGtUN3pTK01QTFQ3?=
 =?utf-8?B?Q2ZFc2tsUENyMnc3L3BuUW9xRUFyVEp6eS96NSs0SHdDdWlxRmx1WENYYlhI?=
 =?utf-8?B?NU5ZaGJXVVE5cXpwTldWYm9mblFPSXJLblg2NkcvVU9tQzRBbExwZ3A2VlNq?=
 =?utf-8?B?RjZwdERsU0I2UEVvUHlsRGJxMjJaMVpNaGhvanU5OGFLbnJ5N0VzYnVXZGFw?=
 =?utf-8?B?M1JxNjZmYnVqMTl6cnFFWGQ3QnROb0FjV25USE1uZllrVnNvUWhrc3FwdC9n?=
 =?utf-8?B?bmx4djNYR0FCYzB5SDM1N3VBVHNhMmMrc2JqOUpET1A3QXRZUDRZR2ZPSmti?=
 =?utf-8?B?LzgyVTB4emdCSXZDWm5VNktWdmdZUnBONy8yRTZTcnZ0Szh5SnN6cnYzOXh0?=
 =?utf-8?B?VDVkalhFTjlRQ2xhL2hBNTlYaGk2emN5ekNSN29ORmVaWXNsSEhFdXBGdVR4?=
 =?utf-8?B?M0V3bk83S2FPcGVhVkhIblZGNWwrdllqYmE3aFFpbCtvU1R3NllWOG9kYmhM?=
 =?utf-8?B?cXlkSE9mdmtWMTdZcGdoWC9ucVhDZlRaSzdySHZLYWdzWG1hLzNiUEhCaGhZ?=
 =?utf-8?B?L1FGbWRFLzlXRUdieW10TzdHWnJnMDZXSTZIdG5aYUlxdHpvSUE1N09FUGRF?=
 =?utf-8?Q?fG6FSfHT2/i+SjD3kimk0AtzSXgrynkz8/bcy?=
X-Exchange-RoutingPolicyChecked: pFnygB61Aaf0CyoYvX3TG6Z+ywkq5w8b85QM9daARSp5d2yXDYe32d5nMr/MxWBk3p1tgGWtFTx1jADrrXF2HHyBA/cAuYrzLO8FGMvHTWTtOh4P7SPc/RObv+qH7v3ME7d8guinCWhoN+xG7jkCoj9aAGPL98qKkdon2RBg8TQKdF+Dm2MhaQU9Og+fRNouxJUsAwSxPapf+LE+bFjfIQErOJJOXkk3C7c78QD3P6jZikRYI7dy2ldvE2zsTdQlgwAvymT5Twd5CWy4RyqufqpWlVdoy9bF5yeIGc2DkNVtBZVYa8JoUvQPZ8LkqHw8MXgUWvJN2VBXs5x7Mt72zg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1090b4e2-a233-488d-448c-08df38dece5e
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 12:42:50.9326 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EheZiBVF3t+NqMQN6W+n2lYv6AVN9pbq0DS+zgZew+vZ/0pK25SM7V6soi7C9ssIhA6f41jJHSLA/ut80dObwj5j3et0JCOnJsHJONGIlR6pf9SSgg7E2N6iVcp68tXw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6696
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 30.10.2026 19:57, Gustavo Sousa wrote:
> The function adjust_idledly() currently does the following adjustments
> to the IDLEDLY register:
> 
> - Wa_14025941587 defines a minimum value for the idle delay.
> 
> - Wa_16023105232 defines a maximum value for the idle delay and also
>   unsets INHIBIT_SWITCH_UNTIL_PREEMPTED.
> 
> We have an upcoming workaround that will also define a minimum idle
> delay.
> 
> Let's reorganize the logic in adjust_idledly() in a way to make it
> easier to reason about and also easier to extend.
> 
> Do that by having the workaround-specific logic only responsible for
> defining min_idledly_ps or max_idledly_ps, and then keeping the logic of
> how to apply them to the register field (with the right rounding up or
> down) separate.
> 
> This separation drops the helper function idledly_floor_ticks(), the
> clamped_below_maxcnt variable, and the extra quantization check,
> arguably making the code easier to follow.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_hw_engine.c | 100 ++++++++++++++++----------------------
>  1 file changed, 41 insertions(+), 59 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hw_engine.c b/drivers/gpu/drm/xe/xe_hw_engine.c
> index eb99284af3cc..01a7baf061eb 100644
> --- a/drivers/gpu/drm/xe/xe_hw_engine.c
> +++ b/drivers/gpu/drm/xe/xe_hw_engine.c
> @@ -596,99 +596,81 @@ static void hw_engine_init_early(struct xe_gt *gt, struct xe_hw_engine *hwe,
>  	xe_reg_whitelist_process_engine(hwe);
>  }
>  
> -static u32 idledly_floor_ticks(u64 idledly_ps, u64 idledly_units_ps)
> -{
> -	return DIV_ROUND_DOWN_ULL(idledly_ps, idledly_units_ps);
> -}
> -
>  static void adjust_idledly(struct xe_hw_engine *hwe)
>  {
>  	struct xe_gt *gt = hwe->gt;
> -	u32 idledly_reg_val, maxcnt_reg_val;
> +	u32 idledly_reg_val;
> +	u32 idledly;
>  	u64 idledly_units_ps = 8 * gt->info.timestamp_base;
> -	u64 maxcnt_units_ps = 640000;
>  	u64 idledly_ps, idledly_hw_ps;
> -	u64 maxcnt_ps;
> +	u64 min_idledly_ps = 0;
> +	u64 max_idledly_ps = -1;
>  	bool inhibit_switch = false;
>  	bool wa_applied = false;
> -	bool clamped_below_maxcnt = false;
>  
>  	if (IS_SRIOV_VF(gt_to_xe(gt)))
>  		return;
>  
>  	if (XE_GT_WA(gt, 16023105232) || XE_GT_WA(gt, 14025941587)) {
> -		u32 mincnt_idledly_ps = 5000000;
> -
>  		/* xe_gt_clock_init() warns and zeroes timestamp_base on unknown crystal clock. */
>  		if (!idledly_units_ps)
>  			return;
>  
>  		idledly_reg_val = xe_mmio_read32(&gt->mmio, RING_IDLEDLY(hwe->mmio_base));
>  		inhibit_switch = idledly_reg_val & INHIBIT_SWITCH_UNTIL_PREEMPTED;
> -		idledly_ps = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val) * idledly_units_ps;
> +		idledly = REG_FIELD_GET(IDLE_DELAY, idledly_reg_val);
> +		idledly_ps = idledly * idledly_units_ps;
>  		idledly_hw_ps = idledly_ps;
>  
> -		maxcnt_reg_val = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> -		maxcnt_ps = REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt_reg_val) * maxcnt_units_ps;
> -
> -		/*
> -		 * Wa_14025941587 is applied before Wa_16023105232, which takes
> -		 * priority if the two ever conflict (not expected in practice).
> -		 */
> -		if (XE_GT_WA(gt, 14025941587) &&
> -		    idledly_ps < mincnt_idledly_ps) {
> -			idledly_ps = mincnt_idledly_ps;
> -			wa_applied = true;
> -		}
> +		if (XE_GT_WA(gt, 14025941587))
> +			min_idledly_ps = max(min_idledly_ps, 5000000);

There is no need of check, we can directly assign 5000000.

+ Tilak

Regards,
Bala

>  
>  		if (XE_GT_WA(gt, 16023105232)) {
> +			u64 maxcnt_units_ps = 640000;
> +			u32 maxcnt = xe_mmio_read32(&gt->mmio, RING_PWRCTX_MAXCNT(hwe->mmio_base));
> +
> +			max_idledly_ps = min_t(u64,
> +					       max_idledly_ps,
> +					       REG_FIELD_GET(IDLE_WAIT_TIME, maxcnt) * maxcnt_units_ps);
> +
>  			/* Clear the inhibit switch without disturbing a valid delay. */
>  			if (inhibit_switch) {
>  				idledly_reg_val &= ~INHIBIT_SWITCH_UNTIL_PREEMPTED;
>  				wa_applied = true;
>  			}
> +		}
>  
> -			/* Warn only on the value read from hardware. */
> -			xe_gt_WARN_ON(gt, idledly_hw_ps >= maxcnt_ps);
> +		/*
> +		 * min_idledly_ps is applied before max_idledly_ps, which takes
> +		 * priority if the two ever conflict (not expected in practice).
> +		 */
> +		if (idledly_ps < min_idledly_ps) {
> +			idledly = DIV_ROUND_UP_ULL(min_idledly_ps, idledly_units_ps);
> +			idledly_ps = idledly * idledly_units_ps;
> +			wa_applied = true;
> +		}
>  
> -			if (idledly_ps >= maxcnt_ps) {
> -				/* maxcnt may be 0 if IDLE_WAIT_TIME is unprogrammed. */
> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> -				clamped_below_maxcnt = true;
> -				wa_applied = true;
> +		if (idledly_ps >= max_idledly_ps) {
> +			if (max_idledly_ps) {
> +				idledly = DIV_ROUND_DOWN_ULL(max_idledly_ps - 1, idledly_units_ps);
> +				idledly_ps = idledly * idledly_units_ps;
> +			} else {
> +				idledly = 0;
> +				idledly_ps = 0;
>  			}
> +
> +			wa_applied = true;
>  		}
>  
> -		if (wa_applied) {
> -			u32 idledly_ticks;
> -
> -			/*
> -			 * Wa_16023105232 requires idledly < maxcnt, so floor
> -			 * that clamp; otherwise round up to guarantee the
> -			 * Wa_14025941587 minimum survives tick quantization.
> -			 */
> -			if (clamped_below_maxcnt)
> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
> -			else
> -				idledly_ticks = DIV_ROUND_UP_ULL(idledly_ps, idledly_units_ps);
> -
> -			/*
> -			 * Tick quantization can still push the rounded-up value
> -			 * to/above maxcnt; re-floor here so Wa_16023105232 keeps
> -			 * priority even in that case.
> -			 */
> -			if (!clamped_below_maxcnt && XE_GT_WA(gt, 16023105232) &&
> -			    idledly_ticks * idledly_units_ps >= maxcnt_ps) {
> -				xe_gt_dbg(gt, "idledly %s: %u ticks would exceed maxcnt=%llups, so flooring\n",
> -					  hwe->name, idledly_ticks, maxcnt_ps);
> -				idledly_ps = maxcnt_ps ? maxcnt_ps - 1 : 0;
> -				idledly_ticks = idledly_floor_ticks(idledly_ps, idledly_units_ps);
> -			}
> +		/* Warn only if the value read from *hardware* exceeds the maximum. */
> +		xe_gt_WARN_ON(gt, idledly_hw_ps >= max_idledly_ps);
>  
> +		if (wa_applied) {
>  			idledly_reg_val &= ~IDLE_DELAY;
> -			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly_ticks);
> -			xe_gt_dbg(gt, "idledly %s: set %llups max=%llups inh=%u ts=%ups\n",
> -				  hwe->name, idledly_ps, maxcnt_ps,
> +			idledly_reg_val |= REG_FIELD_PREP(IDLE_DELAY, idledly);
> +
> +			xe_gt_dbg(gt, "idledly %s: set %llups min=%llups max=%llups inh=%u ts=%ups\n",
> +				  hwe->name, idledly_ps, min_idledly_ps, max_idledly_ps,
>  				  !!inhibit_switch, gt->info.timestamp_base);
>  			xe_mmio_write32(&gt->mmio,
>  					RING_IDLEDLY(hwe->mmio_base),
> 
> -- 
> 2.56.0
> 
