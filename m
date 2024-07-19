Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2BCC3DA5D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Jul 2024 06:53:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C5F10E84C;
	Fri, 19 Jul 2024 06:53:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XB0i7m6Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E941210E00A
 for <intel-xe@lists.freedesktop.org>; Fri, 19 Jul 2024 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1721372038; x=1752908038;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=dHG2nUa3RiKHqQ7UEtroq5bJr1lAMfa+D1uVdSlow/o=;
 b=XB0i7m6Z5xfG70isp/xhiNAn5juW+4m1T4LXMVuSCC2Sgwj+axtso9A9
 RTqpujrExp8i2Btg1OscERHzPi0zj+PHaatNAjxLdDNVmmYNlw3nSg2JT
 gKH7pQMZd2CXrGYbRCNcs8iFYEBjgOOpnfiBiE1SrV1m5sBbFoLsEIz8x
 CEvo60vuD0UokU8ayu698T7wyJ0mjQKU1Wy6ca4aYKLiFnp/dHgIuxSqJ
 DHAaKGOdshFfVxHFdQjAIDim4GKVQLnobUQmiJz0a3tlx8eF0XRPPTu0d
 f4rWfFlilYSBUak3e66ht06pOLqxa5A1gow6MK8b5Pmfy/Em4/JApNbQy g==;
X-CSE-ConnectionGUID: PR7nFLVORVOVDMfP1KrUQQ==
X-CSE-MsgGUID: dG1qe70AT5uYySaIwGKbgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11137"; a="44393449"
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="44393449"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jul 2024 23:53:58 -0700
X-CSE-ConnectionGUID: M5T4zyXPRZGY+dmPGNIAIw==
X-CSE-MsgGUID: 9DJpYGTuTemDUdUbo1SrUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,220,1716274800"; d="scan'208";a="51625441"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Jul 2024 23:53:57 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 23:53:56 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 18 Jul 2024 23:53:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 18 Jul 2024 23:53:40 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 18 Jul 2024 23:53:40 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mlwwPUeSLWGxM70BMVUT3AmLRoQooMHnkQGm6FhKiylFI4SWT5V/szxNcUiQXe3J/A91WIB/UJ63aUX60BbEBnXBstyVKA2BTbVWzYpxJ4e3pb/nZSOpgBlyJx2jHIY3jMNnAf/U2C+8KxBXTebYaffUeBpw48V3Sb+Xfed0T38+VRxRqk6K9BniWQos5v9BKajaPdTuZN/tNu+DMWd19JyBOLHc5B190cXo87c1NMwFPM7xDVL9u2TFylXQTNQja8weu1cfr0sIhQXhEuOasjDv7PcQOWh6AWCq+XpIZuWJ7Sxms5uYR0V2+qjVZmvMiDchmFvlJ2VmIbG7TDeCxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGLGYp8XBfB7poRxjpZn77bMxgdL9LX7gM98IeLnpYk=;
 b=roAxRfknT+JhDc77Uu78pPL5nDoSNQB6OzghI4v5QZfSxhyfD9XOfTrfCi6f0533Q6f16/NEMS4yak+ziaCtH7RQsNCMOhIwEkKX+hG7rfNKGksO7vqaYSat4dgwyQRCaoNwauVVwXL8A9DUaOtP4+3n14nX7kJ3NKZXdGaPRgBeK1xAEG3U+UgNT+RiE8EKKQ6H41ARVSgWXZADrSMCVT2XQ3b+dCpD2iaTiCzZQ2a5SoLIacpG4Y74mBoz/ZC+X7NB6l0SaM/bFUF2QKDZdLxBzKohW+ZrJ9A9rn0TLkYFDqBvnPeoDn+imMzsOrqLZriUKE6uD4iRNuJKtZ3fAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ0PR11MB5088.namprd11.prod.outlook.com (2603:10b6:a03:2df::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.27; Fri, 19 Jul
 2024 06:53:04 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7762.032; Fri, 19 Jul 2024
 06:53:04 +0000
Date: Fri, 19 Jul 2024 06:52:15 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe: Unlink client during vm close
Message-ID: <ZpoNHwGU6OXxmpqJ@DUT025-TGLU.fm.intel.com>
References: <20240718131752.3736689-1-tejas.upadhyay@intel.com>
 <Zpk7jBGDn3Eo9VoM@DUT025-TGLU.fm.intel.com>
 <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB62048D1E37A856E52AE40C4381AD2@SJ1PR11MB6204.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR03CA0183.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ0PR11MB5088:EE_
X-MS-Office365-Filtering-Correlation-Id: fa2d5007-a0e1-47ff-2553-08dca7bf6ff5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?73Xc4sDfWDGKoNzbVhedQdtwIPQqhmqJWwYU1OU0Mg0XIBkHXsyRSIfbSSdY?=
 =?us-ascii?Q?DaTb8tNNOPuwYQ83mawhuixxr++XKAkcvVNvjnUdNe+13Y5WBXOCPLm9rTbP?=
 =?us-ascii?Q?8z7WebmBFvjgMRdHQHa5BxX/nzDAN1Dq01TFUbJByaIxfCrM8ZZ7OoGgu0of?=
 =?us-ascii?Q?ag6ZkjWzxgM/ID7HYir14yBlEzYmJGzGKU2+vazUtIiAV7NmkDzw4mYA0pyb?=
 =?us-ascii?Q?KK00WekRcegpskUR68/iOP0Lm1pzH1l6BxUFmKyMIgQQNe5UaScRV9Oo9v0n?=
 =?us-ascii?Q?NFfFo1wbJjDWeM0xYVOWOycm+6w3mac8nWTbglK5Hj2jQRDvu6yhkSB2M8ux?=
 =?us-ascii?Q?JItjAwF3zpxPTARJsfItfrJ7Jj4luqKJ2nAQgFEW5838JKSDsqbBiGWkvMdl?=
 =?us-ascii?Q?aYdM3mEuvieExIXxZoK7ppeWdGbND5XPpamI2igGgQFcoiDNPA60yFC+PzxM?=
 =?us-ascii?Q?Ez+yiQQpnfX4tEpeMzWUOuWh5qHHGwpJaHOl6fqqNhBcRoUVb77N1yULDxnH?=
 =?us-ascii?Q?zeqWIFUWOAcSpYd3ROgME1D6EDgRnpIwM3peM5UAexHo8lM7A8q0Y3j6AS2R?=
 =?us-ascii?Q?zVVUdvOpg0pFCF1TJb06r7/PJDab1LHiHQ5Yqd/u1MNkJGFbIQC9UBQ8lxIh?=
 =?us-ascii?Q?RhKC+ckU2epcm7DmSWxngiGuAAGNs3noZjaDT9MFAHAH+7hIzC8rsLAQg3hc?=
 =?us-ascii?Q?aOvTcCm+xVT/pK8zctczn8w+c/PYKSqpyrKP7nkngC7RvA7scM2cJBcqOBWz?=
 =?us-ascii?Q?7VfufLTwMe865qdMBAA6URgOmQblxo+TxtPaSXazf9iHWzC4E7Zap7THAsbI?=
 =?us-ascii?Q?SsBWSfb4c0FI4CbnO3UU6uG8jtdMp2rV/P67yq5UXDikwZ9ejIq/JurfCpvW?=
 =?us-ascii?Q?EYtE4rlBdzixIq9QrEygLlEkuJteqyY5tiNm+BS9099I0ywXay+uq249sEH5?=
 =?us-ascii?Q?j+MzkIONCD7aEQPhUwjTw7ujhzSpf1LC4R4iT9dzs/bIEDg3QyMO3w380gRj?=
 =?us-ascii?Q?JACo8VJCwHzfe8L5fL9mTWue+N1rSb338VoCTCHyvAKEaE5xBzMDJKad95cb?=
 =?us-ascii?Q?kwzMxNtlhahZwwH43xisauyzzEFnEzwKv5jjCxFPr6eAZL2XdNe2C/OPA2Q0?=
 =?us-ascii?Q?bpKeBWLgkbw8Dj2SlyO2izB1GT7PQS4O8wbkoQYO3NaXRjc6uMqWNPuANHaF?=
 =?us-ascii?Q?0VfLhqJ1PcHAnchna/DSCtyGHdYbUBYqj4ZHaQE9dRGhXMKqVFVT6JPFfY6c?=
 =?us-ascii?Q?7my4uvJKCJ8hXZvXR9QM915grAhl8vbNf2Ly9JejuvWhTRwVjGk25hqnEMLn?=
 =?us-ascii?Q?aPI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YJk0tp5n9WUAXS8zXs4IhmDV2DcX7UBzWhjnjql0HDvBiM2iQk6ZK2QHwTK6?=
 =?us-ascii?Q?9PYU1clmSDRY/93DCRlNMY8TG/cj2atvEB3wKB12vu65E6tGcjt3VW5wNOBu?=
 =?us-ascii?Q?h4e0nwDREaaL0tKPvgyBd2CWmUK08OrVfpYgD6HEhhaGcugv4V9FM6cOUfr9?=
 =?us-ascii?Q?TSQpUtJI2lv5EuvTs5XevQcTIrHvZw6VFc9cs9lRQViB4TNgAqZdfua0gCSt?=
 =?us-ascii?Q?08c/1hhnhST+kbWtVyQQxUa1Jfwu1UqAL6PggR+95Jx1W2aDoqhGneg3fGZS?=
 =?us-ascii?Q?DYPWGVmS2fa1sbRc/BVMSgsp7IHaAaalJTLO5N7QJomA6jRQ3MAmhmjfgnnv?=
 =?us-ascii?Q?f0c8wj/FeOdYlu7T7i9q5Xrn/ZgmUtSAptdx7rp2sU1FAizX/CojG82857Td?=
 =?us-ascii?Q?CIEA5js5orC7F5g3yU80lpwcs6VX0OiFismUY2SMTwfDBSZ0AhWdZ62a3bXa?=
 =?us-ascii?Q?+syMr7yPo7itLfqFQF2QwxljxHb05TIYeUaxcabhW2xOqHdmDxZcV/ahzp7r?=
 =?us-ascii?Q?0+EHNwj3b43zhY5ZUK5VJwRwnb4OBUcuRxf9wZXm9tMh/Qk/gfH/DVBVy88q?=
 =?us-ascii?Q?rZMIbmjYStK7jInaO/vO378V2Sp6EqX4EYBDfT9bf1b2tHsGMym2lFLRh8tO?=
 =?us-ascii?Q?SRzfsxdiFLytaXn9DCmKbXV+6v2HTUpWIPwH+6W/YNUqgEGLKREJHGm4Ean6?=
 =?us-ascii?Q?TV5tXJoMyxnqZZJMP/schiXz5RX4rWFXMXOPDZbyudi6JpIpmm57h2ynQVok?=
 =?us-ascii?Q?cXN9RxG97PXxZlcyl3vjoJzW2YmJreeS76pRU2X1p0l/mj49GTu02y7LoC34?=
 =?us-ascii?Q?4yZPYuVWeCO40QhMEkdfYGiYz5d/wyq0Ihn9f66KOldqUazx9PHlDsEBAjZp?=
 =?us-ascii?Q?uUo1rqsNwRSIrvLiKUJtgiMJgvDk/XSDGRSH/lscBAbD5BhLnhxnJFRY1JyG?=
 =?us-ascii?Q?JgoX3iLmXITkdqyS0NFbCXr6z3Y5C3FiYMT+35mfASycLbCP+ukJYJOLceXQ?=
 =?us-ascii?Q?Vkatu3hwnUabXRmv4rt41JPf6IsoTOzftH80a/ZqiZq8XHpdUwV34uMdrmvi?=
 =?us-ascii?Q?2Mb+TZS3JoIYpJoUJ09gYm91kbnodbmUSCDBm7mgek2T+OyfS45LkqTJRaxs?=
 =?us-ascii?Q?O9DAU5aWcuRd4+IeLZB0cjLOjKy1bitopfHlN03jjGbLAkZ+rIv1oLGm2wXf?=
 =?us-ascii?Q?Tq2S8N4kVqaZC/l321foJqSoZ6VLKCATDSZdcVM20PnHaZaWB1JKjf+Svenj?=
 =?us-ascii?Q?NVoawP+Kf4HagZaqd0bH/DyDbyd8hXWEb8+CdogzF7dgxY9unKK1LGZtdzYq?=
 =?us-ascii?Q?AT1nxyhUAnkaLKX2S0bXGFrzIJCBXbfDQD02o/p/n1p9JgjfWgQ1+F1w6Fau?=
 =?us-ascii?Q?sd9UVbYpTAfvQUeXYU2ExGjrU23fKHUqb3aH7tipP4Cu7QICMmWunR5+Iwg7?=
 =?us-ascii?Q?xCOobooLyuy/1kyt6DBg5teSyKCuXs9oIR3uBPMHzO380eI80VLZ8QOCCoK6?=
 =?us-ascii?Q?Blw3OQVlfxRrGWp4+P7qOHSjkoYxgmw9LmPhRIBjUNyfgY/AWAw8P/5zRGI+?=
 =?us-ascii?Q?RKpNARXmi24WnMsxZlsmZDX8wcsPbhyUy4tSKsFKk41bk/rrCi1rudKM72t9?=
 =?us-ascii?Q?nA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fa2d5007-a0e1-47ff-2553-08dca7bf6ff5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 06:53:03.9757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1IqBgyKCwP0uzUmX8oPDKZsIlr4TQcw9QYR8NafRVCRe/IDbkiAko8owa0NHZ6mfpt1+EjQB4Bd4o+Yn/lV6RA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5088
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

On Thu, Jul 18, 2024 at 11:08:42PM -0600, Upadhyay, Tejas wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, July 18, 2024 9:28 PM
> > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe: Unlink client during vm close
> > 
> > On Thu, Jul 18, 2024 at 06:47:52PM +0530, Tejas Upadhyay wrote:
> > > We have async call which does not know if client unlinked from vm by
> > > the time it is accessed. Set client unlink early during xe_vm_close()
> > > so that async API do not touch closed client info.
> > >
> > > Also, debugs related to job timeout is not useful when its "no
> > > process" or client already unlinked.
> > >
> > 
> > It kernel exec queue timeout jobs, now the 'Timedout job' message will not
> > be displayed which is not ideal.
> > 
> > > Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/2273
> > 
> > Where is exactly is this access coming from?
> > BUG: kernel NULL pointer dereference, address: 0000000000000058
> 
> In guc_exec_queue_timedout_job() accessing "q->vm->xef->drm" after client closed fd causing crash. We cant take ref and keep client awake till jobs timedout is what I thought. 
> 

Taking ref to q->vm->xef is exactly what Umesh's series [1] here is
doing. I believe this is the correct behavior and based on you comment
above, I also I believe it will fix this issue. Please test with this
series. Hopefully Umesh gets this in soon.

[1] https://patchwork.freedesktop.org/series/135865/

> > 
> > Also btw, the correct tag for gitlab link is 'Closes', "Fixes' is the offending
> > kernel patch so the fixe can be pulled into stable kernels.
> 
> Ok
> 
> > 
> > > Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_guc_submit.c | 7 ++++---
> > >  drivers/gpu/drm/xe/xe_vm.c         | 1 +
> > >  2 files changed, 5 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > index 860405527115..1de141cb84c6 100644
> > > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > > @@ -1166,10 +1166,11 @@ guc_exec_queue_timedout_job(struct
> > drm_sched_job *drm_job)
> > >  			process_name = task->comm;
> > >  			pid = task->pid;
> > >  		}
> > > +		xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u,
> > lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > > +			     xe_sched_job_seqno(job),
> > xe_sched_job_lrc_seqno(job),
> > > +			     q->guc->id, q->flags, process_name, pid);
> > >  	}
> > > -	xe_gt_notice(guc_to_gt(guc), "Timedout job: seqno=%u,
> > lrc_seqno=%u, guc_id=%d, flags=0x%lx in %s [%d]",
> > > -		     xe_sched_job_seqno(job), xe_sched_job_lrc_seqno(job),
> > > -		     q->guc->id, q->flags, process_name, pid);
> > > +
> > >  	if (task)
> > >  		put_task_struct(task);
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index cf3aea5d8cdc..660b20e0e207 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -1537,6 +1537,7 @@ static void xe_vm_close(struct xe_vm *vm)  {
> > >  	down_write(&vm->lock);
> > >  	vm->size = 0;
> > > +	vm->xef = NULL;
> > 
> > This doesn't appear to be thread safe.
> 
> Would you please elaborate!
>

Sure.

vm->xef is to NULL under vm->lock in write while
guc_exec_queue_timedout_job doesn't hold the lock so the two can race.
If you wanted to be thread safe, the latter would at least need vm->lock
in read mode.

Anyways this patch is likely not needed based on my feedback above.

Matt
 
> Thanks,
> Tejas
> > 
> > Matt
> > 
> > >  	up_write(&vm->lock);
> > >  }
> > >
> > > --
> > > 2.25.1
> > >
