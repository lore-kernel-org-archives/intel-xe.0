Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C624C4167B
	for <intel-xe@archiver.kernel.org>; Mon, 27 Nov 2023 18:45:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A19A10E301;
	Mon, 27 Nov 2023 18:45:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33ED10E301
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Nov 2023 18:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701110732; x=1732646732;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Qtz/PoJ+BM4MiBsBx+ZG7FwueGKgOORPEecXdeY3r2Y=;
 b=VAQAV0bsEx3sd6xh2iJ2B94QTOpZ5loO2/e0WQda20ZaANxme6TWeOus
 kK5gIkkXSUaSid5OP2+pGpmo9MgQ9xaf/9VJ6QQMvUvzB0dH1FfxJIiSO
 i/d9D3FDffKUsOWgZj89I/kKsywiE1YEz/gclx3y0kr+rO+KrnrNnMchA
 pgZksSnF14AEiysodtsQViNCpAYzWnwDU1UkgyoY+SMlYnWc484ZqgjEm
 AFO4QWrkiqQSfr0iuRwzJ+CHKvPA1SjzOUd6jAFjbn1Wc7KRHiDcqsHc9
 ieURqklHrSHCd+LGsP0v9AuRUzJ83OWCiMT7mQTO43SUC3VdrobdTIo5Y Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="389920495"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="389920495"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 10:45:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="16375401"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Nov 2023 10:45:30 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 27 Nov 2023 10:45:29 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 27 Nov 2023 10:45:29 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 27 Nov 2023 10:45:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jp7qs2XGi5Fse3BhRhICgynzsSrP9tgB0UokqcsSSn1bW/VHW4hQiL+QYHtfC2RP2AId56uKLf4F9e2Tp9qy/ekVPCyirk42qcLeQcNsVs480ZN7sp6qt7WHR4rLQLtHiY9SGmNR0hkVv9EKINkN9R007HaY9EVx61BKJlcJ2xXKnMwDVpm6LK6AIynzto9Vq0kLeMSvRkWYv+Caj0ykmuoIlmrp8qG0qHwmHtlAHsLzOGoQlhUhrl/HyKu/bFmsGK3hxolgJWHKIutkolANViMhol28JXErwIIgOcVblXOZRD3pX6N+41476J87u2YOh9MUgQNn+9msqGppT3FhkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0FyZxSAYOq4i7P9dUQIAY0ONOWDCrbukyYzkPQf3C9A=;
 b=JAA3txmAYSylm8jlRLeDeuKyZVDJoWF0umANhDNUdOfczNr4YI0fJVe4lM40CZLvrCqImrEzV9SAfahYMfd5OAWMY3y9yrHSDRsZGzxQDvj0MG1Z50wcK4KC1YGMkeor1YhYWYH8UdrbDBZ3SSmODPIqTty66cIlAIKIGdLHvZpcG+uKmjvvRxU/96y1/LTkuQISlK786abajEvdvN/PZAyjawXldIkxh5ToIeq/9YvmFYR4uWYtJyeq/Vp9lN/cx2U77I5LSkiAgvA2N7GdFrn87RDEpwKy40M3WEyZtnU48JVVCwJ9EomWNRaxAchv2/mNQDQ9GRHa1Zjnv1aLuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by DS7PR11MB6039.namprd11.prod.outlook.com (2603:10b6:8:76::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.27; Mon, 27 Nov 2023 18:45:08 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7025.022; Mon, 27 Nov 2023
 18:45:07 +0000
Date: Mon, 27 Nov 2023 12:45:05 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>
Message-ID: <au2vye6reyaxi7i6bzubk4p7ighorbvctdk52iwvjpqpy2atm6@rayk42kvk3ow>
References: <20231121195209.802235-1-lucas.demarchi@intel.com>
 <20231121195209.802235-2-lucas.demarchi@intel.com>
 <20231122183254.GN1327160@mdroper-desk1.amr.corp.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231122183254.GN1327160@mdroper-desk1.amr.corp.intel.com>
X-ClientProxiedBy: SJ0PR03CA0387.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|DS7PR11MB6039:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fb1deed-dadf-44ae-2df8-08dbef78fa26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZUHvNVP0UFw/ibsUY1gAk9K8z7rX3W7CKLA8lWwbGcZ8g7QgcTUmnPu0pfdtxpsc7BTWqqbh0YnMiURft4PRz+JStedcqPMlhHCLzzsZWG7itcu4OVWxV7HwoWNjuPBZMt44ZdsX095kncD/n1aIH9daO1rpigLgTeVu9zZM35681nzWnGbYpydxHSpNNiaEKx8sCY3dLHyopviN5tEJLhtsOEtL5ReSBwsOMCaA5vG+SrjUb6ope9gkXh41HK9WCH3VRGIIwq28JZutXeF82v7l4OXKcC3Nd23TGPprlgUsHGfLMnGuVJQ2YcQ48qMJkxmWF9dvusbP5FmwnptsjHgnMRBgwt4NyX2Ty37gcWThrFl/MdZ8Ng8shFEbTcXUpd9JgN3v3c4z5E0cHi9PzgqHAF2Vlnxv/d2k42HVZHtb0FonjJk0ExmtJTsvHNF/odlf+/OvIV8caFh+9MripbDCYiDYeaoDF3jejDUxJg5yoyuKXa9riemA956Cf07fdMFRbJs2zeIxjXcfM6heiTPrzePJRMTRU9iK7s8hP+V8Ox8BLbXRu9/KvL1Aqqdt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(366004)(39860400002)(396003)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(41300700001)(33716001)(4744005)(83380400001)(5660300002)(82960400001)(26005)(86362001)(2906002)(66476007)(9686003)(6512007)(6506007)(8936002)(8676002)(6862004)(4326008)(478600001)(6486002)(6636002)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4dTQtniYTnKznFPovaVFkCBGPHsS8aU8Q5XyosT5+/DsdYhriNuA9IA6vStW?=
 =?us-ascii?Q?gLa74cWH5SdGOo/IXRVnkuYhaRaI257909MV0KBjkcBNcs+U1OwlImUrhdgo?=
 =?us-ascii?Q?Q3EusFFpeUywxJ3Cgpg4Uk4+kmALpHo5CzreDvwcOJZ2oW7ImHbQGhfYKK9r?=
 =?us-ascii?Q?RIB+t0O00yKD56itv5PkGyGc7wMC2ZqCyBLlMNipl4AWgM/nPdI0mfDfW0nf?=
 =?us-ascii?Q?NLMWwwhVwvJZXGVT2t+hS55tG9AxosUciTXqYr86f1s1Fn70DAq4RsaFpMox?=
 =?us-ascii?Q?iFGZXV0MA9qf6mAmHotx1+sBZ1XA9GIqK7TZRZOVInh2J7h0ECAqZ/aeymCd?=
 =?us-ascii?Q?PENYHgbGQixiy+c9A4MfmtpWYMB6V88PzBYoJCVTrlX2rDCxLSVYo9TTaVzi?=
 =?us-ascii?Q?qagbOSWElswQ8DPcW/2lElUpV9cCT71pXdnFYs/CDV+RPPExp8rwztnmpFgp?=
 =?us-ascii?Q?sqW4onaG6uNPpSyHce8e5+PNMg6qngAuYSmcpGLdiAaEthhvsruo5AAf6k+w?=
 =?us-ascii?Q?fLs7IqjE5/wuHAB0gdJ2wNyhRn6Tj3TgS1T6O/d8kGX1zbieCFQ88wb0NB/G?=
 =?us-ascii?Q?1E8RW7XNmPjU6oQs6jRn2xOQfsCsXDWU16XK8EjGglTTJY6MRXlyygVZU/Zz?=
 =?us-ascii?Q?JM57sn65L/ieKGMtGiifQC7eQVPbHlFxRGPKB3dgR73pWlrur+aY1MlaGkUQ?=
 =?us-ascii?Q?1XoSFGc8iDpVibVbfsQFHXY3ZIJ8tybcahQ+rFrR6nCQ/Db3KK/eZ75vjIkJ?=
 =?us-ascii?Q?I8mLhotkNjgpEQk8Sj6uS2R/ypA/VxACToioQ/a1Hmbcuph5/pPbDuKdtPm7?=
 =?us-ascii?Q?AcwFacMp7Jj+kVPxTLW5QcnLuoo80VJx9M3/ZnuZjXSFIFKePK2z7QNI+/gC?=
 =?us-ascii?Q?372idCoZJX17htxEMvj7GTlAJK8ALWU4c+joSkrCm3t+8fksFkiFrWzVdQF8?=
 =?us-ascii?Q?m8mgKhKHZ+FDDKlEMHFp5UNiPCC3PZTgmSDnHZzQDG0s7i4bHKxeXlaOy1OS?=
 =?us-ascii?Q?D/XmmDp8773VhHUZ2Z/M2zM5b5TPfU8BuqxGAGJjXPFiuXp8tc9thzpYAI6r?=
 =?us-ascii?Q?BgEqjrDDAftL3hi9wGsWHR0zKtC0bejLqA/xx/WSBrxsQqHZha9ACIaYCk60?=
 =?us-ascii?Q?GQmikADS5PT9kpwGMxZSrM2qtlK4c5P4VvjF6XW7kWlzXG0Cyj1DzT5ovQKX?=
 =?us-ascii?Q?tn13mlxCsopZFl32FlEQIE7cGvCrDAM/3DhBWAeuw4WmqVhHbkDYIUeQTHye?=
 =?us-ascii?Q?243+o3JysT4sfzoGipL+5jO5OduCwOpnQS5ycIe+AYefkSvkzGdKQvGD1IM0?=
 =?us-ascii?Q?3t7Jj8EnJ9myRZ14vhPM5S4DYTlPNf0k8Z7RLtWp0ow1PiImWcerWzuqhGTK?=
 =?us-ascii?Q?GNyweS6NpKwzVq/NQ/3Zqb+EbM6LJ+F1jEVaPe1++bDPJ3mbUiGF9NH/SuOt?=
 =?us-ascii?Q?9NE7FZ1K8QQ5IGY+Tl7a2RVBQkF1cC1LzLYs2+VVFnLd5gtNjS5yYS4gehD6?=
 =?us-ascii?Q?q5cGXaVr9mXhPeXj3hxJWjGc98sUAM7jjawQJo2uBjkvqM5D7+JvEczsd3I6?=
 =?us-ascii?Q?qifOfscEhS+ghxR26j0EDBg5f86v7XS21LO7GrFeRG/wKSWfiLQ0T1NjX3OA?=
 =?us-ascii?Q?zw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb1deed-dadf-44ae-2df8-08dbef78fa26
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2023 18:45:07.6989 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IHs96i3rHMDT2srNGWF5rVANmTetIivBIPzzH9voqL1MnY5xwb9lTK1e1d97sM7DGUgXKZY7+dWxN/oa5vtTJtSddu/6GuQzHVWsn1FASuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6039
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 2/2] drm/xe: Sync MTL PCI IDs with i915
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 22, 2023 at 10:32:54AM -0800, Matt Roper wrote:
>On Tue, Nov 21, 2023 at 11:52:09AM -0800, Lucas De Marchi wrote:
>> For Xe1 platforms, it's better to follow the way i915 adds the PCI IDs
>> to the header, so it's easier to catch up when there is an update. This
>> brings the same logic applied in commit 2e3c369f23a7 ("drm/i915/mtl:
>> Eliminate subplatforms") to the equivalent xe header.
>>
>> The end result of this header for Xe1 platforms is now in sync with i915
>> as of commit 5032c607e886 ("drm/i915: ATS-M device ID update"). This can
>> be seen by
>>
>> 	$ git show 5032c607e886:include/drm/i915_pciids.h > a.h
>> 	$ git diff --color-words  --no-index a.h include/drm/xe_pciids.h
>>
>> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
>
>Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

Both patches applied to drm-xe-next. Thanks for the review.

Lucas De Marchi
