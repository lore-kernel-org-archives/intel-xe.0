Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1032BC25B5F
	for <intel-xe@archiver.kernel.org>; Mon,  6 May 2024 14:49:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF6F10E4FD;
	Mon,  6 May 2024 14:48:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="heulycLg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3152A10E4FD
 for <intel-xe@lists.freedesktop.org>; Mon,  6 May 2024 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715006938; x=1746542938;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=sBvF319r2SSzncSXUoYMUdAZjXXRnYfvm/ZMo28+6D8=;
 b=heulycLgIxTUb/fcYhR9dXNgkg5/WoVN6ET3o4W4yvGyDuAqYgu3IpqJ
 e7RXmXBKs0biWYD7J9JzJjr3KnQDWq9/tcAHZNNhc6y4jr1JLmgOf2hyo
 qShr7rNohkc7O6dRCyJtF3efJy/fKkhQD4v2gcrXHerVXe+HhpKv9Snr9
 CvAdLiXt56x4Y8EgMtgvSLD3nFrx+uodaVTrLsfSVoNVaO6AKR2GwVC8Y
 BlC8VDK+K8n7N+R6JAQm5WtQQNzeJkSErcD7vpK7OAMPuBMCOL1vrmv8k
 6EHiioXsGYYzKnObFT7AA1RRxjEn7DLyWDxpIJQxgiz2Bc1WbDjtrQ1ln Q==;
X-CSE-ConnectionGUID: /8PrfP22Qg+jnnKwFdwm8A==
X-CSE-MsgGUID: pCRIiI1sRy+YaYUGWMvUhA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="28230493"
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28230493"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2024 07:48:57 -0700
X-CSE-ConnectionGUID: CFozsHfeRSK8mV5eIOOzRg==
X-CSE-MsgGUID: MGdgx5WPSrqNX7OsFO47XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,258,1708416000"; d="scan'208";a="28776586"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 06 May 2024 07:48:56 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 6 May 2024 07:48:55 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 6 May 2024 07:48:55 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 6 May 2024 07:48:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an/gDnx+GfAOWP1p7nDF8qCrEBkVicqHv+ACf5rBp5EWmIGDexMGg3wQ+KYqLpZsmgnVc/aDniBsKb9YluQFJsT1+qZHXOuZ8JTkNgu9y5jxxncMFVndg3ecPnxmMDXO2QwLFjBvSOglVaIjHP2QycERPn6mCIVbgU+o2NGV2aoofrBeRkpOcj9LGsHJzL/XYpdn2vJVjTIjdBD0kZMrCf7R8k/bzI5ICwLrBYvXvNvfw0G2EuJiPKNZWlntFNx+1rouQ7HIiNv56rHppiYxPetLcp7AeCdwjSQOuw/xswo4+ej4AZ9CGf714LrKrS2LJDSytPWIcQ04S4Nlzht4ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sBvF319r2SSzncSXUoYMUdAZjXXRnYfvm/ZMo28+6D8=;
 b=HEGnMludfRvf4fpm/QN+GNL/fnUG/h0KniJaJuJjxwY7k789//O6YZloM6eOEJ0TG3SudnpTVxgSKeG+xNSug5Vc8TLfmMG11M05mO0yQb+yDBDgPW6SBWrfFc4DvfRXEUVtir6sCmRi56S7P9SD1x+jSkdue4TNiqghZYGlJzfHjd4CIIRjjjJ4NMr5Q0vQswR73bxIug3tjqyAhNq4r8VUUkf7mQYcsBCOVtWsqBkSzzIvFibR+SRVzzO2bFh9E2LMflWyQ9zofVtaAClHOfmPxBty4Q8Ed26IR1lJWaFOXSrccQGL7O6NINpVS1wovBfjitMFJzZLPUx/9/kYLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8590.namprd11.prod.outlook.com (2603:10b6:610:1b8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:48:49 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:48:49 +0000
Date: Mon, 6 May 2024 09:48:45 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <ramadevi.gandi@intel.com>,
 <matthew.d.roper@intel.com>
Subject: Re: [PATCH v5 2/2] drm/xe/mocs: Add debugfs node to dump mocs
Message-ID: <7jbb3ys4dyyhu3orjlt5tm7opzn25q4kanym4zvrbgfha57ev4@3hm6fopxztbb>
References: <20240503193902.2056202-1-janga.rahul.kumar@intel.com>
 <20240503193902.2056202-3-janga.rahul.kumar@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20240503193902.2056202-3-janga.rahul.kumar@intel.com>
X-ClientProxiedBy: MW4PR03CA0338.namprd03.prod.outlook.com
 (2603:10b6:303:dc::13) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8590:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae01148-f23a-4c1e-edf1-08dc6ddba3e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|376005|366007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PK5rbU1Ks+yWHQwmI4vvzOBFhhmMQgT3lq9lkS/AS20liUKnVobMdtKXjbd3?=
 =?us-ascii?Q?GulvpxGeVQTJX+ZtmH1GvBN4Xg7AyA51rg+H1Nd8Mq0ph8agLKwEY4p9j00f?=
 =?us-ascii?Q?1zb8Hf9RnOjmR2N+ciZ6oRwl53TE9/sSLOcpsa4ZJVRw87Wg5q7YA0QW4zBP?=
 =?us-ascii?Q?dcrknL34fkVYMEN1ra5NyFMes9FNj4TE0o9692qEs+Y4we7oIotkg36gVJSi?=
 =?us-ascii?Q?y/FV+V15UpnK9MxPqD3KH7GeZ/5qDOI9ZE1tGYxs4qA5/LkftJbAdT3ZUieZ?=
 =?us-ascii?Q?lSue5/UVKFoxhnRLCEf2+569jWJwJbM9dT6LADrgZekmYnFdr2KYAZ8aNLw/?=
 =?us-ascii?Q?uaGAzcLK5RLOAZ0b/KveMObVwlDoqHq77raVJr1FkeNhC/sdUI6mBF/zgVCE?=
 =?us-ascii?Q?WE7uya5TM1SwueVMkDGyc084hrQNffoKgX/7UTW/1aRu/XPAn0fffwB+UtxI?=
 =?us-ascii?Q?shVU3vBha/2EE5Lx2mR+9eqiFiK61SBuJFhmWiNtdP17aD7LH7I2bogKED62?=
 =?us-ascii?Q?F13JPD0U68Y6nWsv2gr5/jEylBKJni+E+tuKMTTrasMv3ZgIEbSQT1hei4c3?=
 =?us-ascii?Q?fJgGLgX7nQojTNRYA10TLulkZQgeX73MmxcUaNAtwbP3IzLeWeLuG2EAatC0?=
 =?us-ascii?Q?hyvD1o7nJHx6Jovpsq5tbYgf7SHeWs9Jrnrr5V3K0mN9Y5B49hyIOY19AlVd?=
 =?us-ascii?Q?26mMJGZ6uCqZeEyKaSzZ2WanzbEhQegGb5tZBCKJkX9GJLjU2ZHefkQa7dOB?=
 =?us-ascii?Q?qhWkAQ5PVQiDBlraOI8VsOIf3lBjKENu7RuLIWF3GjfgTal2OSjxf05h30aT?=
 =?us-ascii?Q?NUi92SPr6y05ZX6uVgKRL3fCtzrvVNpwjRxI7X7DGKsegnB5DNmn+6m1Gotd?=
 =?us-ascii?Q?doQ4xRu9qHyXgjzliDvFZ/3NmIY18AwkjA1DzuCGO33lO/1JGqKbfIYTXmU8?=
 =?us-ascii?Q?vMuCv4Lru9mQUoT8RewTXXOwESmeVvhXZpjIvTbfdpQX7emqZD235ObbDoCE?=
 =?us-ascii?Q?roRTptylMmZryO7EUy1FLFXTypXgzG2X3eRAyy0ATjo/ktnZ9wdBHLQ0SZv4?=
 =?us-ascii?Q?fVlkBPT3/1ZlQMdp3yBsrgeXAHseOoCl++cln4Pomo8SfBXaSt9HlbvWo19B?=
 =?us-ascii?Q?W9s/yXTALy+30XRL5tCtCqs+xIXJKzqXXcHdAjySaopbPJKenNfAKPNlD6rP?=
 =?us-ascii?Q?GCf8sxkz5tcfBL289EKpz1fGw9jZpMx7svBwg6nXs/j9AykfKppc+SIl8Wog?=
 =?us-ascii?Q?zV1KuHkjoUp1PhjfbcouoKuZMJdkQErolMRPkK9gzQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lHRuT3w+j6yp0IQZeLQ0GLy6Xl5fQNgwt1Hv4U13IWJvR7yNKHCgCtaawjTu?=
 =?us-ascii?Q?De3Rqi1oStZCwZjb/2zphXwPlSAhgFbrbrXa7syZwZJVqeDpYJCgtc8mfy4O?=
 =?us-ascii?Q?EkoUPp5vX3PD8Rw3TGjs1oSMIjESlnIsN6JU/TpRCEbMxMuyezz425mRZcIh?=
 =?us-ascii?Q?SH/o96ygdiZ2af8rxuOQalFfHeaGXraONVdg0xlbE3DtZOxAYfYlDPgobV1T?=
 =?us-ascii?Q?a0ko9FlvxfSar3dGQ7SgYeAZ4ObhMNc1rn650lVp0qdhq3ZN2wrXCwmtAU+b?=
 =?us-ascii?Q?9M+Mfi1d/XRhRxvRLD+DAtvXLLlp315DarjrV8s+wQv1cw8rjKFEoTBakEHu?=
 =?us-ascii?Q?xxgK2aGRWZ/a3FZy4UQNknhgOdRpeUOp9hZaZVHpu3Aty7unKUgimkpw9CMW?=
 =?us-ascii?Q?AxbU5VzUwRnbPIJ/sHlUSyjurXn6LKa2lRZXPa/43AGEYIEWk0s1YK4uzQn1?=
 =?us-ascii?Q?S6x4Lb7VzdqZT4qXQRvmkIzpM1WYdpSwU3LQSyVBG0okhah+JdLTNgvp3VqI?=
 =?us-ascii?Q?5ry0RJ5FSDW/UPiMA78yjPdUhbENTmqL77GSA1rMefxbHta2LkQSQLO4fVzd?=
 =?us-ascii?Q?1DUWpj/Iy2r9IQuuuPExiLgzy601wQsLNS2L/ewhv9DJ4UIW/NSV23I9ltiO?=
 =?us-ascii?Q?43NqHs2s/bt1OtU7JM4JAOw4a6RltmJeluN6VNBpTJ6kjE9YTnKmOdY9fg5E?=
 =?us-ascii?Q?xK8P4k5zP0uA95d4+KuesTe0XUaXdZ5X4NGgpksqrCQtgAsk4MvLMoAaqUeo?=
 =?us-ascii?Q?ElxC/KRUCzSUBY5rnXt0Zdf1Nfg0JFWWJZqzWvcxIDGEPkmfkytbjikQe0li?=
 =?us-ascii?Q?zoXplZr1Q/okb43zbyFmI34n+r6bPcroYeICQRkWJki1qsHbIR3WRBwDwhT8?=
 =?us-ascii?Q?g6XnjEwdTRcPL5TcWsssgzHwm8bCw22N/N1gPlbZFC3VcOMRgsVY1BgUR2Fr?=
 =?us-ascii?Q?D3lebVIS+dLQ5NzU+0UAs38NxgoU73r9Ges/6zgABNLs4fhE+/IIM2fkTM9i?=
 =?us-ascii?Q?x7v4S8AlPRiZOBkNPLYNe9IOa7VsBwFw4bzbATbqQmhtuNfxuZ1vbpSZCnSb?=
 =?us-ascii?Q?dwWjw+Dp8JiJJe+N2s7gdmugqh2ghflJyL6+Pm0OGRruCKn/ZCB/Th5x/BfI?=
 =?us-ascii?Q?mGhCvMR7hiBFib3Ed4gfaNrS/Jnyye8FcttcyAXeVx/W9Gj2iI1iZPfYReRL?=
 =?us-ascii?Q?8qcx4qWBduQwQRfLUwJxew7XpQoVP4Yz9TFyWakpiYr7/LTrvJhNX7assmpi?=
 =?us-ascii?Q?ZSiU99/Q4XwGk4t6q6EMG4TFNe0l9ZQJg0Gfm5NConbRUwUCOtavNI25bECs?=
 =?us-ascii?Q?V5ugbf36z79K1pmNIyybvymLLWXhcWIi0CSXbLrXcTiTGOlrfheBcbkabrmY?=
 =?us-ascii?Q?aXRaGeRF5KOrE3RpArMu+jtrI5FY2eRCFe2sk9ZmqjY4gKsZWczrbBD4EZHi?=
 =?us-ascii?Q?wNdUGaRuu1GFYLRSflbXlC4Jw3Cm0qA7G4AiwmrWy9rPPV1toI27/OxQShjC?=
 =?us-ascii?Q?OiCZyeclne1MEmWF/KLgc87ZdN5SV+rLpaTb6edIRmXKtNexf4p4KyUkuksv?=
 =?us-ascii?Q?/eFSSCLcaDTCBjWKgYUz7knwRCMooznhT9tuNpC2qv+bYLs9pxSrgXBl5IwO?=
 =?us-ascii?Q?Ew=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae01148-f23a-4c1e-edf1-08dc6ddba3e9
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2024 14:48:49.7142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3agzaEKExQNAoJXcSVdvkKXp2q65aWMilEFfH1yKdjTkGI4d22Kf9vVZCZlm83oIrVlsC0SwvNZqlB3O6la1GtXL1dWvtgOVbxmbnPPeOfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8590
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

On Sat, May 04, 2024 at 01:09:02AM GMT, Janga Rahul Kumar wrote:
>This is useful to check mocs configuration. Tests/Tools can use
>this debugfs entry to get mocs info.
>
>v2: Address review comments. Change debugfs output style similar
>to pat debugfs. (Lucas De Marchi)
>
>v3: rebase.
>
>v4: Address review comments. Use function pointer inside ops
>struct. Update Test-with links. Remove usage of flags wherever
>not required. (Lucas De Marchi)
>
>v5: Address review comments. Move register defines. Modify mocs
>info struct to avoid holes. (Luca De Marchi)
>
>Cc: Matt Roper <matthew.d.roper@intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: Janga Rahul Kumar <janga.rahul.kumar@intel.com>


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

thanks
Lucas De Marchi
