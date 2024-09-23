Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0A6CF9C71
	for <intel-xe@archiver.kernel.org>; Mon, 23 Sep 2024 18:06:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF46A10E447;
	Mon, 23 Sep 2024 18:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nY1pFTti";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB9A10E447
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Sep 2024 18:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727114767; x=1758650767;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X5h1FLkfWq4ymljsNSloN443m43c7/XGTjEmE0RTAHo=;
 b=nY1pFTtiphR+9s+/KZzMfkM5gRdXa8X/O/xaDh9nVOaio0lgk0ko1p0x
 JCRltRfFuvwAvnUq+jS0clmetJZdghvzHNgbLqRC+q/+46+SNQi4aVcy+
 KJ5Ve0mplDz1k/Ei28BIOG1jgyjq3tiPcaOXZnAUOZ5G+2M4ZYqTcXATY
 I0z/T6Y0ziT2hY0R4/9wXDWWlBkoIL0O72j6mLxwKkqDTlwlcnpB36srU
 x25kWLzsA6f53YGZwG2QZzJboWmqfCf5P6yDV1r/vCVlAgMVfKz2xkQDO
 Mp3vbCFioylknFgJu/BHqcUZlK8VqvOumSuOPkCrF4yALanhLt0QxypTJ A==;
X-CSE-ConnectionGUID: Sm1VT0isQviO1epAvj1INA==
X-CSE-MsgGUID: As+0w+ifRZKENxDVThRsuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="25903722"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="25903722"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2024 11:05:47 -0700
X-CSE-ConnectionGUID: 1/bEm2I2RWGst6S1CiigqA==
X-CSE-MsgGUID: Qj0bF8jCQAibZI4gBclzag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; d="scan'208";a="70731680"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 23 Sep 2024 11:05:09 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 23 Sep 2024 11:05:08 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 23 Sep 2024 11:05:08 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 23 Sep 2024 11:05:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DCqn5++uVB8qqQgFmtBMxOAFkaofT9Q1fOp9nLGxi77CnAuhFXmf7Q+n2dkGjdTgB1zuJw0EGS7P+n2UC/v2L1XOktQJMcMf+TrFEAytsGFxAE/+ZuJOvG08j2iGXq8erdDO+Dql6O+lNVcUvlrz52FmozUMPn5AoNkrEpuHGY2pbhc66hpdGQ6Wh+0Fd2YhnvHvHn8NJtvn+2uH8O6Jf4hwvB4ABBHXuwkjCoksUmFN6DlvFT82Ctj6REXh9W7Qk/JuWOIp1XyZUSMLu9rVoYQTHYdX9UO+StyuKS9dSPrxCUQm+WBG+ekt8yppj0Sxxn8XGAvnBKz5M52m0q3y5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EC81ZlW7X2syJuEUOuvfSPcvMOyRcMtywAORoHDix6M=;
 b=AGvPQOj6Unxt/nxHzUBCTeidRE9uF4ImztpLsVn2Mlxpvbe8XnMcT/q2Y8cupVb/yhpVx7X3s16iuW5Si85IDeQemz5z5RT1omJ1KVtHOpAyNjBfBZUZ6nSpDmRu6OVL//kDQCNFWe9KHjLrBUrLg3xx9iCSm5c6c63sOnCdrJ2A/i8sMu4FrIUtm3rZN3a4Gei3TTf5+bLcRmjYzfSBQt7qkWSvFqrqvcCbYCJjb0JjQwI02kox6TPiuXU9HT4pDg00Tm9/b8JEVOBdifU8jmBYJdRNtZ5baOVOqO6wg7vzXzbrUKCCVMfING04XQ9eLOFzIMuBl+z84lzC5fOkFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by DS0PR11MB7736.namprd11.prod.outlook.com (2603:10b6:8:f1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Mon, 23 Sep
 2024 18:05:05 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.7962.022; Mon, 23 Sep 2024
 18:05:04 +0000
Date: Mon, 23 Sep 2024 14:05:01 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Matthew Brost <matthew.brost@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>
Subject: Re: [PATCH v2] drm/xe: Use fault injection infrastructure to find
 issues at probe time
Message-ID: <ZvGtzSXTmacUx-HV@intel.com>
References: <20240920131834.3368299-1-francois.dugast@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240920131834.3368299-1-francois.dugast@intel.com>
X-ClientProxiedBy: MW4PR03CA0037.namprd03.prod.outlook.com
 (2603:10b6:303:8e::12) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|DS0PR11MB7736:EE_
X-MS-Office365-Filtering-Correlation-Id: b2a9953d-6992-4cc6-c0d9-08dcdbfa403f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Q5ZL5H/oSsWSCPLlIZ7zvQ+r91YqdeEgkmXVt84uk3ehyhXk6n3JVmeDve?=
 =?iso-8859-1?Q?VeF1JzDU+OplteFo1+0ydFQ77vUax6USm2LhmEzqxdYClegOyro+2NMyta?=
 =?iso-8859-1?Q?b0BDY1/GUY294RdtQNykZCcVPJh9MQ4WXWYRFStORPqv/C+A6sl8S8xIul?=
 =?iso-8859-1?Q?SZDXZXjYioEskGN6v3+9kStBwDi4BmiyUKDXrFHmDKxHYm5k17eof5Uo41?=
 =?iso-8859-1?Q?FRRMTn5ccdsZV+5/TFPIfAYbQy1/91FBfGOy4KhsnF2ihZ9EbrgUE4qozh?=
 =?iso-8859-1?Q?jTWV/HEgrca1ikqt6POeINte5Jo6Bht/zzp3FZnJ8bLjvVK1lDvQ22Vc5L?=
 =?iso-8859-1?Q?kz30spvP3G5eP1x/alEivtSxcp55Vj+54oZDSmVhHI2Ew2uqveiouHnoLD?=
 =?iso-8859-1?Q?ywHy3L40sn7KUL8meAHcgUYr1qu1YonXmPzGsFpGdKrMSZqgYi9xgo3n05?=
 =?iso-8859-1?Q?+2aZxqGuTuXSajuEexNnoWd/3DmlP3Dqv0NH/AFKRqU+T7Jn5tlKFZ58u1?=
 =?iso-8859-1?Q?HF2oIYlS0MoTVwmoC+apebnzYSoUhFbnVSD1X5LfUnbz86/lKWXsk2Q8by?=
 =?iso-8859-1?Q?Ge2mM26zapwjBDwOixq9XHg39m6gltN1brUEex7LHKfyUi1Wc9FRO4GFrj?=
 =?iso-8859-1?Q?VVcc/e1Ct7NbFD6sTMV4lYnm9RHPWk/mGUukygZX4Qo5lQTQ2+PH3WWbp+?=
 =?iso-8859-1?Q?s2ioWYKTVU3VSoHZOCVWbtsDeT4O1/JKxfp2lKQq8XSloylyroQ8wUfbSL?=
 =?iso-8859-1?Q?z9MPz06Xw/bUZ6n6fFNtVEPSSYeqtYcElyZuYRncLNV7zIGvrTqS5D4K6M?=
 =?iso-8859-1?Q?jEtnv9Zr5GsliYkPSAnZfdlb2tHZl1MEv4DR+4NwqT1PhadDlTXdRnPMre?=
 =?iso-8859-1?Q?Lp3XKjttq3cATY4IdoYqO7f/9rckGe8DfEKPyLkJFIWOYJeZw3dOGr8xlY?=
 =?iso-8859-1?Q?FB0akQtjBI7gT8r1qBD9tHELwbF8RnDpukbch/QJqw3Kv1pwXIgmWyGFQF?=
 =?iso-8859-1?Q?7/fRD8TaGeAxmd0TFyvYXzYXnSQgIzDXKLeTCfAqmtIxANqGUKd8q8stUr?=
 =?iso-8859-1?Q?6/dH97wFrF6Uoujlo2vtUwPskduA6AOdI8IOmys9v/1Ei2THykHS9OGrPk?=
 =?iso-8859-1?Q?mmsRgvPjzmLjYYRyRIdKnoK6DldJfcH4Gx71Rco0FSuCUxj48koILLYim8?=
 =?iso-8859-1?Q?em/3HNnxx6tyN9rH52PV9/awSRpHENRa6OFsbm5TeBk3HOLQ2ZYTM8fqwg?=
 =?iso-8859-1?Q?atxVX+QCVLIA8X5cWopgnyL3/9peHSRsS7IqsvnEaNUV/lh44u02gF6rOQ?=
 =?iso-8859-1?Q?X34Wh+RdSQOl/T95+27xtpoPd3mOm8keUp6aUlastrOhtIX40ixGkkkmvc?=
 =?iso-8859-1?Q?l1FXHuuWIhfrBJBCCwQPCs+9bPt/RU5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?PGs5tyKoJQ9fBUXP0OTCGg2mymXHIRpyw4lGCLhuiKRZwOZ5j3dekI2Cuf?=
 =?iso-8859-1?Q?u6w13c8DgfYZufbOL7l7BjMcY+2mRp7Eb7UVUWRF2b04wWMmgKmaUkm8mW?=
 =?iso-8859-1?Q?Lf55I2I15ZeuyTFsRzQvePVtqBo6sYisbySxXvYICkLnS8JXaSHSIbrldY?=
 =?iso-8859-1?Q?oAKACIWmRuXlzXAyGlIrCzXM8ZoGXDkwMiRUPINrAbbYNlc0k08mdQU13B?=
 =?iso-8859-1?Q?XNHN3JltXx8Mnn4SxxK+xMeWpOaxk+Nj4k0l+hFutR1I8Cm7CijERUGGlH?=
 =?iso-8859-1?Q?CQRxN51A15CYbw0+qcaBzkCfcYWMOmlfMyUxM3xhbBVke40TKGkttVSWY4?=
 =?iso-8859-1?Q?/F/i7EznrhxZ6aVogw+yjUbGV7Tq5UNE6kQW7han78CfKbG+0wIXoiW/8M?=
 =?iso-8859-1?Q?4CrBPWe47/FmXhdKJuDPq50w7oIiMzQgHuCypUF/Yr1Plzhh6wndvoXkwW?=
 =?iso-8859-1?Q?eB1nrXIIwa7GnSi5Cf6PDhZHBoNC7jdAfA230a35LQDLyPvr4eG+dhO4ET?=
 =?iso-8859-1?Q?Q4bzDDDQFHTdHHCAhHyuwqxz3wBkgmpEZI75mKEDec2jscqyIBDziOZIMa?=
 =?iso-8859-1?Q?kNn4DMehn/4kItL2srdLJgE/3HoLn2MzVdJRUfGsj3lwR2dUy0xzNtM1eg?=
 =?iso-8859-1?Q?H7zbMBi2DjlepCwqyqQCSp+QINhBTTCJGojovsAicBZpd0e3eNEBq4Ce1I?=
 =?iso-8859-1?Q?EPFFN2/oRu3/TZeOQVAnjCqE9U84lc1ys3gtjxui59z+VnhqLy6+2CRL11?=
 =?iso-8859-1?Q?KHi8hlAb4ie3P4sYV3NpQZcNCtYH9r4r6O+kiGwUXWskHUbAAXatnymMwp?=
 =?iso-8859-1?Q?2u43mEHrhZlA7SB6KdYbwPzkO6DRN2/5RLw5U6jyfX1lUm5yOsTAi0hpw3?=
 =?iso-8859-1?Q?xBpXLxd+SXxpfc6DwBCNJAlrj1bnJ8tv6nyrI0rpA9m0HsjyEGVrM6YH+W?=
 =?iso-8859-1?Q?jUuqPkKXLPs0fscIEpNnfNS4YWEE4n4RCyUsPSzO1VFwefVAnuBwsWuH1e?=
 =?iso-8859-1?Q?UH068vBbrfnGn042uyvIZyov9nesasXP2qyiUXvqiGbaL5sgaXm28GXBXw?=
 =?iso-8859-1?Q?StW95cv15hVh+MM29FlA++nUtkRND5a7Xsr5zNx9sHkIPAwBrwCHosqwiK?=
 =?iso-8859-1?Q?CoSGpKawl/TY48L0Qs8IbiO7BNzrdKy/BJX+yuU4NtZF/HM/PZiZEvtipi?=
 =?iso-8859-1?Q?jm3UvUqpIRKARKIbYvOR0iRkeEuEhcG27bOt+GpR2ejiJvu9uxueUBwVK1?=
 =?iso-8859-1?Q?FTvsui44sMIqSXJ2ageH30oU9cbXc3k6Mret9hyRB3eTtW0D1mp/wc6zpn?=
 =?iso-8859-1?Q?59CI+oVvovpbfrw/YfnaOHW910zFBONXyC3Fv9x+AiJzfzAWiD+3bMstu0?=
 =?iso-8859-1?Q?HZh1LRmOPptrGy4ThP80Iusa2PBli4zHGfIBzpy669AJDW5sZZbp80/y2a?=
 =?iso-8859-1?Q?6j7s35O2MQ32Lo1CgOgPUFl5e0bWMFGnuNpRx33ncr3RGT+Zvzo7vplQgR?=
 =?iso-8859-1?Q?9vJaV+NSTacyN5Dchv/ctSEcYvm6gddOADhaA7+C73Ie+8zcCx4q2yoPdt?=
 =?iso-8859-1?Q?8S8I/z7Np9m88POAkcfbo+otVW5LATpQ55RHHnaRRWPaU2vUWlRY75F/Su?=
 =?iso-8859-1?Q?5nv9ogjt8RVaMlKkLC+NhsdzW5M3KXebQJK1oJGd3r1r+7EZfrxuhdOg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b2a9953d-6992-4cc6-c0d9-08dcdbfa403f
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2024 18:05:04.9013 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Clp0ziL048D+82rGQNvkNgFzxGmRaK5dhMITxWLXLUtVYvje64hWXpLFB+b9/MlB8+2Ui9RxzUM7rIwCBo/ZTA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7736
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

On Fri, Sep 20, 2024 at 03:18:34PM +0200, Francois Dugast wrote:
> The kernel fault injection infrastructure is used to test proper error
> handling during probe. In particular, ALLOW_ERROR_INJECTION() is added
> directly to functions which fullfill the injectable functions
> requirements:
> fault-injection.html#requirements-for-the-error-injectable-functions

Okay, I read this. This was my biggest initial question here...

> 
> Otherwise a helper function is added and called in the beginning of the
> function where the fault is to be injected.
> 
> The return code of the functions using ALLOW_ERROR_INJECTION() can be
> conditionnally modified at runtime by tuning some debugfs entries. This
> requires CONFIG_FUNCTION_ERROR_INJECTION (among others).
> 
> One way to use fault injection at probe time by making each of those
> functions fail one at a time is:
> 
>     FAILTYPE=fail_function
>     DEVICE="0000:00:08.0" # depends on the system
>     ERRNO=-12 # -ENOMEM, can depend on the function
> 
>     echo N > /sys/kernel/debug/$FAILTYPE/task-filter
>     echo 100 > /sys/kernel/debug/$FAILTYPE/probability
>     echo 0 > /sys/kernel/debug/$FAILTYPE/interval
>     echo -1 > /sys/kernel/debug/$FAILTYPE/times
>     echo 0 > /sys/kernel/debug/$FAILTYPE/space
>     echo 1 > /sys/kernel/debug/$FAILTYPE/verbose
> 
>     modprobe xe
>     echo $DEVICE > /sys/bus/pci/drivers/xe/unbind
> 
>     grep -oP "^.* \[xe\]" /sys/kernel/debug/$FAILTYPE/injectable | \
>     cut -d ' ' -f 1 | while read -r FUNCTION ; do
>         echo "Injecting fault in $FUNCTION"
>         echo "" > /sys/kernel/debug/$FAILTYPE/inject
>         echo $FUNCTION > /sys/kernel/debug/$FAILTYPE/inject
>         printf %#x $ERRNO > /sys/kernel/debug/$FAILTYPE/$FUNCTION/retval
>         echo $DEVICE > /sys/bus/pci/drivers/xe/bind
>     done
> 
>     rmmod xe
> 
> It will also be integrated into IGT for systematic execution by CI.
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c    | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_ggtt.c      |  2 ++
>  drivers/gpu/drm/xe/xe_guc_ads.c   | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_ct.c    | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_guc_log.c   | 13 +++++++++++++
>  drivers/gpu/drm/xe/xe_guc_relay.c | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_pm.c        | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_sriov.c     | 15 ++++++++++++++-
>  drivers/gpu/drm/xe/xe_tile.c      | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_uc_fw.c     | 11 +++++++++++
>  drivers/gpu/drm/xe/xe_wa.c        | 12 ++++++++++++
>  drivers/gpu/drm/xe/xe_wopcm.c     |  3 +++
>  12 files changed, 125 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index cb5a9fd820cf..d26352ecf75e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -6,6 +6,7 @@
>  #include "xe_device.h"
>  
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_aperture.h>
> @@ -300,12 +301,22 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> +static noinline int fault_inject_device_create(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_device_create, ERRNO);
> +
>  struct xe_device *xe_device_create(struct pci_dev *pdev,
>  				   const struct pci_device_id *ent)
>  {
>  	struct xe_device *xe;
>  	int err;
>  
> +	err = fault_inject_device_create();

But then I don't understand here. To me it looks like this function would
fulfill the criteria. It is not doing any clean up on the err goto,
nor changingn any state before the first error return.

Why can't we go directly?

Perhaps we should add a comment on each of this new fault_inject
functions to explain why that was chosen instead of the direct
macro assignment?

> +	if (err)
> +		return ERR_PTR(err);
> +
>  	xe_display_driver_set_hooks(&driver);
>  
>  	err = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &driver);
> @@ -548,6 +559,7 @@ static int wait_for_lmem_ready(struct xe_device *xe)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(wait_for_lmem_ready, ERRNO);
>  
>  static void update_device_info(struct xe_device *xe)
>  {
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index f68af56c3f86..4906e3f3150b 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_ggtt.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/sizes.h>
>  
> @@ -264,6 +265,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  
>  	return 0;
>  }
> +ALLOW_ERROR_INJECTION(xe_ggtt_init_early, ERRNO);
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
>  
> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
> index 66d4e5e95abd..e366043eb4b8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc_ads.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include <generated/xe_wa_oob.h>
> @@ -396,12 +398,23 @@ static int calculate_waklv_size(struct xe_guc_ads *ads)
>  
>  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
>  
> +static noinline int fault_inject_guc_ads_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_guc_ads_init, ERRNO);
> +
>  int xe_guc_ads_init(struct xe_guc_ads *ads)
>  {
>  	struct xe_device *xe = ads_to_xe(ads);
>  	struct xe_gt *gt = ads_to_gt(ads);
>  	struct xe_tile *tile = gt_to_tile(gt);
>  	struct xe_bo *bo;
> +	int ret;
> +
> +	ret = fault_inject_guc_ads_init();
> +	if (ret)
> +		return ret;
>  
>  	ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>  	ads->regset_size = calculate_regset_size(gt);
> diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc_ct.c
> index 4b95f75b1546..61967ddd319f 100644
> --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> @@ -8,6 +8,7 @@
>  #include <linux/bitfield.h>
>  #include <linux/circ_buf.h>
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  
>  #include <kunit/static_stub.h>
>  
> @@ -165,6 +166,12 @@ static void primelockdep(struct xe_guc_ct *ct)
>  	fs_reclaim_release(GFP_KERNEL);
>  }
>  
> +static noinline int fault_inject_guc_ct_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_guc_ct_init, ERRNO);
> +
>  int xe_guc_ct_init(struct xe_guc_ct *ct)
>  {
>  	struct xe_device *xe = ct_to_xe(ct);
> @@ -173,6 +180,10 @@ int xe_guc_ct_init(struct xe_guc_ct *ct)
>  	struct xe_bo *bo;
>  	int err;
>  
> +	err = fault_inject_guc_ct_init();
> +	if (err)
> +		return err;
> +
>  	xe_gt_assert(gt, !(guc_ct_size() % PAGE_SIZE));
>  
>  	ct->g2h_wq = alloc_ordered_workqueue("xe-g2h-wq", 0);
> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_guc_log.c
> index a37ee3419428..a3e54f1bb0c3 100644
> --- a/drivers/gpu/drm/xe/xe_guc_log.c
> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_guc_log.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_bo.h"
> @@ -77,11 +79,22 @@ void xe_guc_log_print(struct xe_guc_log *log, struct drm_printer *p)
>  	}
>  }
>  
> +static noinline int fault_inject_guc_log_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_guc_log_init, ERRNO);
> +
>  int xe_guc_log_init(struct xe_guc_log *log)
>  {
>  	struct xe_device *xe = log_to_xe(log);
>  	struct xe_tile *tile = gt_to_tile(log_to_gt(log));
>  	struct xe_bo *bo;
> +	int err;
> +
> +	err = fault_inject_guc_log_init();
> +	if (err)
> +		return err;
>  
>  	bo = xe_managed_bo_create_pin_map(xe, tile, guc_log_size(),
>  					  XE_BO_FLAG_SYSTEM |
> diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_guc_relay.c
> index ade6162dc259..ede7fd3e7785 100644
> --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> @@ -5,6 +5,7 @@
>  
>  #include <linux/bitfield.h>
>  #include <linux/delay.h>
> +#include <linux/fault-inject.h>
>  
>  #include <drm/drm_managed.h>
>  
> @@ -320,6 +321,12 @@ static void __fini_relay(struct drm_device *drm, void *arg)
>  	mempool_exit(&relay->pool);
>  }
>  
> +static noinline int fault_inject_guc_relay_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_guc_relay_init, ERRNO);
> +
>  /**
>   * xe_guc_relay_init - Initialize a &xe_guc_relay
>   * @relay: the &xe_guc_relay to initialize
> @@ -335,6 +342,10 @@ int xe_guc_relay_init(struct xe_guc_relay *relay)
>  	struct xe_device *xe = relay_to_xe(relay);
>  	int err;
>  
> +	err = fault_inject_guc_relay_init();
> +	if (err)
> +		return err;
> +
>  	relay_assert(relay, !relay_is_ready(relay));
>  
>  	if (!IS_SRIOV(xe))
> diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> index 33eb039053e4..87075aed885d 100644
> --- a/drivers/gpu/drm/xe/xe_pm.c
> +++ b/drivers/gpu/drm/xe/xe_pm.c
> @@ -5,6 +5,7 @@
>  
>  #include "xe_pm.h"
>  
> +#include <linux/fault-inject.h>
>  #include <linux/pm_runtime.h>
>  
>  #include <drm/drm_managed.h>
> @@ -247,10 +248,20 @@ static void xe_pm_runtime_init(struct xe_device *xe)
>  	pm_runtime_put(dev);
>  }
>  
> +static noinline int fault_inject_pm_init_early(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_pm_init_early, ERRNO);
> +
>  int xe_pm_init_early(struct xe_device *xe)
>  {
>  	int err;
>  
> +	err = fault_inject_pm_init_early();
> +	if (err)
> +		return err;
> +
>  	INIT_LIST_HEAD(&xe->mem_access.vram_userfault.list);
>  
>  	err = drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_sriov.c
> index 69a066ef20c0..f1dafcfd4eae 100644
> --- a/drivers/gpu/drm/xe/xe_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_sriov.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "regs/xe_regs.h"
> @@ -91,6 +93,12 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>  	xe->sriov.wq = NULL;
>  }
>  
> +static noinline int fault_inject_sriov_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_sriov_init, ERRNO);
> +
>  /**
>   * xe_sriov_init - Initialize SR-IOV specific data.
>   * @xe: the &xe_device to initialize
> @@ -102,11 +110,16 @@ static void fini_sriov(struct drm_device *drm, void *arg)
>   */
>  int xe_sriov_init(struct xe_device *xe)
>  {
> +	int err = fault_inject_sriov_init();
> +
> +	if (err)
> +		return err;
> +
>  	if (!IS_SRIOV(xe))
>  		return 0;
>  
>  	if (IS_SRIOV_PF(xe)) {
> -		int err = xe_sriov_pf_init_early(xe);
> +		err = xe_sriov_pf_init_early(xe);
>  
>  		if (err)
>  			return err;
> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
> index dda5268507d8..c82b4278c03e 100644
> --- a/drivers/gpu/drm/xe/xe_tile.c
> +++ b/drivers/gpu/drm/xe/xe_tile.c
> @@ -3,6 +3,8 @@
>   * Copyright © 2023 Intel Corporation
>   */
>  
> +#include <linux/fault-inject.h>
> +
>  #include <drm/drm_managed.h>
>  
>  #include "xe_device.h"
> @@ -99,6 +101,12 @@ static int xe_tile_alloc(struct xe_tile *tile)
>  	return 0;
>  }
>  
> +static noinline int fault_inject_tile_init_early(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_tile_init_early, ERRNO);
> +
>  /**
>   * xe_tile_init_early - Initialize the tile and primary GT
>   * @tile: Tile to initialize
> @@ -114,6 +122,10 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>  {
>  	int err;
>  
> +	err = fault_inject_tile_init_early();
> +	if (err)
> +		return err;
> +
>  	tile->xe = xe;
>  	tile->id = id;
>  
> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_fw.c
> index eab9456e051f..8fff0fd7c675 100644
> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> @@ -4,6 +4,7 @@
>   */
>  
>  #include <linux/bitfield.h>
> +#include <linux/fault-inject.h>
>  #include <linux/firmware.h>
>  
>  #include <drm/drm_managed.h>
> @@ -776,11 +777,21 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const void *data, size_t size, u32
>  	return err;
>  }
>  
> +static noinline int fault_inject_uc_fw_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_uc_fw_init, ERRNO);
> +
>  int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
>  {
>  	const struct firmware *fw = NULL;
>  	int err;
>  
> +	err = fault_inject_uc_fw_init();
> +	if (err)
> +		return err;
> +
>  	err = uc_fw_request(uc_fw, &fw);
>  	if (err)
>  		return err;
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index 22c148b1e996..121443b790bf 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -8,6 +8,7 @@
>  #include <drm/drm_managed.h>
>  #include <kunit/visibility.h>
>  #include <linux/compiler_types.h>
> +#include <linux/fault-inject.h>
>  
>  #include <generated/xe_wa_oob.h>
>  
> @@ -818,6 +819,12 @@ void xe_wa_process_lrc(struct xe_hw_engine *hwe)
>  	xe_rtp_process_to_sr(&ctx, lrc_was, &hwe->reg_lrc);
>  }
>  
> +static noinline int fault_inject_wa_init(void)
> +{
> +	return 0;
> +}
> +ALLOW_ERROR_INJECTION(fault_inject_wa_init, ERRNO);
> +
>  /**
>   * xe_wa_init - initialize gt with workaround bookkeeping
>   * @gt: GT instance to initialize
> @@ -829,6 +836,11 @@ int xe_wa_init(struct xe_gt *gt)
>  	struct xe_device *xe = gt_to_xe(gt);
>  	size_t n_oob, n_lrc, n_engine, n_gt, total;
>  	unsigned long *p;
> +	int err;
> +
> +	err = fault_inject_wa_init();
> +	if (err)
> +		return err;
>  
>  	n_gt = BITS_TO_LONGS(ARRAY_SIZE(gt_was));
>  	n_engine = BITS_TO_LONGS(ARRAY_SIZE(engine_was));
> diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopcm.c
> index 93c82825d896..88a201122a22 100644
> --- a/drivers/gpu/drm/xe/xe_wopcm.c
> +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> @@ -5,6 +5,8 @@
>  
>  #include "xe_wopcm.h"
>  
> +#include <linux/fault-inject.h>
> +
>  #include "regs/xe_guc_regs.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
> @@ -268,3 +270,4 @@ int xe_wopcm_init(struct xe_wopcm *wopcm)
>  
>  	return ret;
>  }
> +ALLOW_ERROR_INJECTION(xe_wopcm_init, ERRNO);
> -- 
> 2.43.0
> 
