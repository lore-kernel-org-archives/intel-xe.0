Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73027C3DA60
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jul 2024 19:29:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1714B10E350;
	Wed, 17 Jul 2024 19:29:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ET1TSxnC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 833EA10E350
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Jul 2024 19:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721244556; x=1752780556;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=aEHRsCbxcvhWs6kRPx+lGcT6trQVgqV6BgivzDdlqmY=;
 b=ET1TSxnC6uyswTWcirCO2TVeL+1Kiw/4Rgu42KE2I5f6P7sOO5sBT8gL
 m9/LgU7cuC/4zZYUlQMVKq5Ya12tw4PFjG01jq/sLQ3+F8mO2LDEeGFRk
 U9FSsomKJVZFGkv+Q4ltutpw2oE1pwxkfpph2JmfKLlz17t+mSA7j8Bp4
 KVmwaDp73l8fLUz8sIT0Z7KFxC489weLLw1z9vNNrH8QOwUdulJGFUK1I
 HGSgc3HT0gYjGdqI8r4vxlalrpX2X9lP16ywA0G7nL6eaJQ94zjI+6ZJL
 kpyIeYXRU3wK8gNGf2Ku4GRHaHD7cA37WH5OxOM5NbKJ3+2P1sxJe6xeo g==;
X-CSE-ConnectionGUID: 92rUxRUBQziJk4YIPzkTUA==
X-CSE-MsgGUID: N1Af6mK5QKCOHpdJyItD1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11136"; a="36213085"
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="36213085"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jul 2024 12:29:16 -0700
X-CSE-ConnectionGUID: PaJ5BRquTkWZ4tstEyhvDA==
X-CSE-MsgGUID: oUPiwXqGQEyn0hKc5F6RvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,215,1716274800"; d="scan'208";a="50262157"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Jul 2024 12:29:14 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 17 Jul 2024 12:29:14 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 17 Jul 2024 12:29:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 17 Jul 2024 12:29:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZeHoESuvAnDpEjF4gec7nvTBpacoTej3lgEPz13EdEhKFUu5K6HTadk6FdTmF6NlXrNWr+TGj/ovujVhHbbCCcm0laN5pK5akSpRRM61igOoRarsqYnBivVQYxCOZDXw0Bxl7x/9KQfeoSPJt65/BIOEw+bSKCwI8oxRPHdc6oJyG0fBciNOactQkJWervEq+DFHj+oFcv2dOypyMWko6Ik7KMfnShj11+YjxlOBOlQyqyqtby3oB9ptL3DBTgaGQ9th0PHI42WGNTrCN3k8yzi53BkHDOhq5LEkVP2PkJZURpbwCQpqJd3ih+VXVrW+2ke1nQ6DtLPIRCZRTAI1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQZ9IaW9IKt78Wcyk+1mB7B7jUqbp0BBkbZHvtpe37s=;
 b=FUWC6CVANW/c8sIAsz/wWOgZHoD5ZAuAulQxLIg+hQ7dWXv2C7bnCT4Uur7BomHvqBy+j8C7SZycfLdzGBNCtvTbAciqzcbJKW94BZKM7Pb/fbhASOb9ZoIlbULXWYdaRsg6MTRZaHJlp3k0/93jvDJc23hCDZH4ZljRMepOyBNZ9bFqwCcbztI52eKLT0mmxJHZitw7+dM84O+RCVH/dYijMivtF9qvUht4IKNgG4B2FDQnNsXhcmWoJz8YC4491O1fFZXQfPnaHtfDf2S6IASzgRd08h4b421Ffc015PqLKyUp14SiTSNqso9SFBVVDeLK7IV8p5ccaMrfrPRdwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DM4PR11MB6478.namprd11.prod.outlook.com (2603:10b6:8:89::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Wed, 17 Jul
 2024 19:29:11 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.7784.013; Wed, 17 Jul 2024
 19:29:11 +0000
Date: Wed, 17 Jul 2024 14:29:08 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Koby Elbaz <kelbaz@habana.ai>, Moti Haimovski <mhaimovski@habana.ai>
Subject: Re: [PATCH] drm/xe: Refactor mmio setup for multi-tile
Message-ID: <urivbc2xveseh6szyp3a37fukyuntgv6symskfj25imdgpy5ve@sdoi2v4373i6>
References: <20240716195608.2819428-1-lucas.demarchi@intel.com>
 <145dbe6d-4493-4f2d-b723-f575c68109a1@intel.com>
 <qg5oxgencv5gtmzzbt3s3tcx6765dnun6524adgutbdmukfnth@ickveqdtm4ev>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <qg5oxgencv5gtmzzbt3s3tcx6765dnun6524adgutbdmukfnth@ickveqdtm4ev>
X-ClientProxiedBy: MW4PR03CA0331.namprd03.prod.outlook.com
 (2603:10b6:303:dc::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DM4PR11MB6478:EE_
X-MS-Office365-Filtering-Correlation-Id: 24314a5b-2329-4347-c120-08dca696bc5d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?l2qwSApIJRzVsd5EpMSqUJzn0oZc51v58qbgxZ8StIoc8KBMRW7si5or26kD?=
 =?us-ascii?Q?UytWI0vqECFShaoJhnDzuotLyhVM/QhzVWoDgLMudcFHSIzdAu/8KtBtTwdK?=
 =?us-ascii?Q?hhNemnT2fhTC28RxxJQtSRF+WE5tnVwg4qRtdRQiV7tnocF0fEBmnD/qz7vY?=
 =?us-ascii?Q?godSslNrka12xe0ddGwmU6k5AG2f3qePqZrRv3hnQFeAA79F2dqmMSRlFuDe?=
 =?us-ascii?Q?LR+BuXS01Y/eMCYmxbT8F8fB8Ynoay1mr5FprHtCsPE4lkXvK2pNMmC+QGZH?=
 =?us-ascii?Q?4MU8X5UkRUpcl4Y0gJmzOCSdJ9BAsy7RI/4POECsqfudn8Lx7+IdGRfOtRfm?=
 =?us-ascii?Q?j7kzjvCcUCC02Q0ED0uVtMSOAu3TwZ9qLPcYkN73Oy1vijRdplDC0FMFi7lo?=
 =?us-ascii?Q?oelbAeWZeptihqCAvFPG3ZoGTiwSS9liqc+LyE9KqllvJRBG/patYpRPSETs?=
 =?us-ascii?Q?tAKwJ290i7kYwVUwQsXiaimhlAT2/4FLNNFRxaD1E+xTx4DDgctEWtX3MpDz?=
 =?us-ascii?Q?+SC6PcANfcWjtdSyoCk1XVylX2zNk3HQNlELiXnGBHcmCk4Hrdsdyw3kcjP5?=
 =?us-ascii?Q?ieCFVXpIcU89taVfVxr/16DQH1rikXeFeP1ojww9wJhY/rCqZliT5fHDvvp6?=
 =?us-ascii?Q?aTuPkDIBPqA1q+rLqeYnvPrBtL4OET6/ePLwDY8SrwkVXuHw3fR4PWUR1HHL?=
 =?us-ascii?Q?OdgBxaO6rApYMx2KsVFspoZb5QMOD7Zw72PHPsEq1Ll7MHWXdoNzgGnhZkPE?=
 =?us-ascii?Q?qpd+3B+WpeGhUTJFkTzVJMBHy9mtG8d5U616mE2re46QJ6GbNRyRMe9ZwJBZ?=
 =?us-ascii?Q?aonJWP8bv0lEpHi86pq9LCdnTx44JOG3s6fHKILxVHMkx4dJM3cKvCUf1L6n?=
 =?us-ascii?Q?GkvBEHmhIPpPYPKEnKFx/knHg8z48doVkCACpDXdvctYsRDK5EcAThKSexU6?=
 =?us-ascii?Q?/pH8mWOoLIjBGZvTPHLV7X6eDZrY1kyFjiDpAkrh9uCInsV4euS/qzfTLTfD?=
 =?us-ascii?Q?Z7o2XwyvgYFHCJLU+csz8UUZcUDM7JO8AbDw9DG2yHDYb2xucbP0KkaDH1R+?=
 =?us-ascii?Q?odukUMF2QcI06c/drc7J7u1s6PmgUoJEyHvAY3wd9Z0a9EYh28T8Q0VVJmj5?=
 =?us-ascii?Q?4Rzk6+ncpjIFoENyf3gppwb7KZuq1Fv7bWAZWHV9kCK4ZtrKcTiR63ilhsSA?=
 =?us-ascii?Q?myqdCfwByYVijQp5CWtq2IC28JRPp7AJXQ8eW1Ym1owfk4zi3JMVWekg0ZkU?=
 =?us-ascii?Q?xzFqSzcNIGwjSTiz7taLP7FpUPAoK6Mz7A5YodCs5W+AGB75n9NBMzfb4N1U?=
 =?us-ascii?Q?68FDBUzTCUpBJJn53qhEi8F38nrVaHUDy/n/8ryq9Alu1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ToWy6R6EyKX59yrggfDMc5AMLnWNX8BeW4bXBAku6cRy6kMikqOq3Fd7lPSU?=
 =?us-ascii?Q?WODRWM2BTtyGCOulsrb0BmeqRF9u5PH8KkBNcVqkunL3SSTUsrMbEAYsjuoo?=
 =?us-ascii?Q?qc0TtVX6Fzr8QhRnJOIciQaNk75TTRGMM+J0M/sFIdo9TJuuYfONC5UKfmQH?=
 =?us-ascii?Q?xAyTLN5Yk+0uQEhndfjQTn0pvSBVUcVrY9sd7HtJeOqYlrD1G6TagD18H+e6?=
 =?us-ascii?Q?VhABSabqP9GMFVJOToizCoWJ8oSQ7BUXV9CqSVNUBejm2JZSj53yN6ipNtJp?=
 =?us-ascii?Q?bgi0fSU2+RuS88CDF5kGbh0rKo+4C6SehduggssjmqKG9k8mDFqb6ekTF6hE?=
 =?us-ascii?Q?ViqwXvW5OqUI9X6LUmJO9T4AlbuFQUmqjcU6sefIdk+7tio7vPtjN8Ln6jtc?=
 =?us-ascii?Q?4rNHv5/23rwBymZdm5LY6akDoh+NGY4suh15h4dQzbPD7btvjGw9htQfxijg?=
 =?us-ascii?Q?TS91T1JvHQ48P/7zxMPOVMZ6jVMsFC2s2FUnsoTgc4tDbPwbUAax3QauELQq?=
 =?us-ascii?Q?8FLlx5rfXwqxZ7lLX/kcJ/msInnfM7pUMeUpUcEXItuJdmwlRrS6eYk7oK/F?=
 =?us-ascii?Q?caV4X7ZUM4oBom+OmB2ZZR2z5cp7NaEvnXMr2IgueXYKhKO8P9iVucI0/yG3?=
 =?us-ascii?Q?bmDRW/J/apHCdWLsnzukQxbJfTn8s+fqDBfsKjjw2UyMQy+koFfRViGnpF+o?=
 =?us-ascii?Q?GW7ZdMA7BN9mt3hANoAQItnkH01yZRMZ1Ml8aubHu/vwrTxCYlYYYVFyVtUI?=
 =?us-ascii?Q?E6B/wfeQTxA/9gJVRcj6LQS5Yg1IdSAGo/5veaq2zgVKqz3AsoVARvz2MNX8?=
 =?us-ascii?Q?IU6sEaKsOnLH2QUw3yd2iif14MAe722Eu+cXpQlHEY/bwXM1xNEnV/c6LNJe?=
 =?us-ascii?Q?qm3IrW8uQKwmfmXZ5HrzfMwRXAZ22A81P7EoOFtjQDqKGn617YjiW+abz+mp?=
 =?us-ascii?Q?SImUxokA2w7kSVoBFI9JC34aKUMluG/IaYY4PJtmJjlPQuQsbSMPGyfZkevm?=
 =?us-ascii?Q?xGIu5SAnTqI1sNF5/UmYA6vMkdw/vbHMqD+2tgHPd5k2gJaC26YzucrjyPCY?=
 =?us-ascii?Q?5eCRGxOL+S4rgpbKo7lYoj9h1lXZWFCtu+ph3tzKZqhKgAUiTpOWYWB7Q2yl?=
 =?us-ascii?Q?83a1mkUv1lrLW27kohUxJsyBJAmoZKo8NuI9zRAII2y1krTn4/14EWT0Bk00?=
 =?us-ascii?Q?ZV6FO0d0USHeaD8dDfHcuZ99ebJP8e5ZaMBH0+01ZOSh+6y8NVCDeEDa54q6?=
 =?us-ascii?Q?vU6CeyNbYhxH5K4buIXtOn0PZUMas/aupIvD3uhgJxvIWaPKdLIEIVEZRFVf?=
 =?us-ascii?Q?sT+M3grUgBBVKPU2M6YfsVsNlaBPxdsWeDqDpbAZmbefmy3K5cmIFo+RF4Bi?=
 =?us-ascii?Q?G7YJkai5YzTv/zpQSljxhPRydOPwfW+ufDYOD/MBcuKTjThQusLyhoUJhlFK?=
 =?us-ascii?Q?C/4ONqHjZ7zqehRnIeWNYIOM0qHMkcDyaFR76cXX9CyQydqR3HKs/eTKH3e7?=
 =?us-ascii?Q?D6uNiPDxkzJ50Ipg/OGd/3YT9tiuWZMociVIXEkAsExybVvVdGe12dZZXSmF?=
 =?us-ascii?Q?ll0Q+jUhZbJ0oCyJ0mnW4jFaZsuvNvbiP6qavV3EOK60iBwV7xxDnjI6a7hv?=
 =?us-ascii?Q?jQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 24314a5b-2329-4347-c120-08dca696bc5d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 19:29:11.7249 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Nek5v35Ey4ZJCBljrkmLoXv1+9xfwGeNYF1aMFy1GOZtWWnirJMgvgAsLtuahcS7/jDL/sFa7DaWbAbov1vxSQn9Jb7ovpjeowPYnVjfCtk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6478
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

On Tue, Jul 16, 2024 at 05:03:42PM GMT, Lucas De Marchi wrote:
>On Tue, Jul 16, 2024 at 11:51:05PM GMT, Michal Wajdeczko wrote:
>>
>>
>>On 16.07.2024 21:54, Lucas De Marchi wrote:
>>>Extract functions to setup the multi-tile mmio space and extension
>>>space, while better documenting the final memory layout.  No change in
>>>behavior.
>>>
>>>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>>>---
>>>
>>>tested only on single-tile platforms for now. It shouldn't change the
>>>behavior, but it would be good to get some extra testing.
>>
>>hmm, but CI likely wont help here as our PVC are running with:
>>
>><6>[  149.783555] xe 0000:aa:00.0: [drm] tile_count: 2, reduced_tile_count 1
>
>yes... I will have to do some manual testing and also asking for help
>from original authors (Cc'ed) to check if it doesn't break their use
>case.

just tested here on a 2T PVC and it seems to work as well as before.

Lucas De Marchi
