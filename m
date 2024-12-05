Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844F3E77170
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 17:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 397EB10EF3D;
	Thu,  5 Dec 2024 17:25:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lSpScSGk";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51AE10EF48
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Dec 2024 17:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733419500; x=1764955500;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=LL2syxgAMX5jyzglnf6GmdY2LaN9fmeisTul4qDW7MA=;
 b=lSpScSGkn5YL1V1HUCgqNVukKJM+cwyl1gR0vik0ZSKaHXAv/9kUveEX
 hbv8vD78A5H4a6ha4leQ+2MDaBRTUQKIZEF2iFCtBc9JF5BIVgPXkRmyY
 b31zfbLvDYTmk+9X4YgR18qD66UF3ysFE9NHp9+T3xyjZ7Ny3L0JDzZGM
 pZCSjq0RtlktCzS9Zqns0uEf89IEtHHNSldUdCVLe0BX1JgBRS+uD8rdI
 4OQ0lQqvMtM0UAeBNs1Z5kjSVBO/HTnIOdgupnI6mRp2axxbRJSKTg3yu
 j/Cq6gVQ7LNGwz2E/HVvBr5sk8wOczB57VR1WRKtNRkLtMmXl+niEKlS6 Q==;
X-CSE-ConnectionGUID: 6yrSQaN0Rb6c/rX/ZQ1kwQ==
X-CSE-MsgGUID: GnSd5zDiSka/lOgI56WT8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="33076598"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="33076598"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 09:25:00 -0800
X-CSE-ConnectionGUID: ahAOCDG+TiqR8W8j2nhUFA==
X-CSE-MsgGUID: +71/u7JSSfKYgxCFtXZURA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93833789"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa006.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 05 Dec 2024 09:24:59 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 5 Dec 2024 09:24:58 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 5 Dec 2024 09:24:58 -0800
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.173)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 5 Dec 2024 09:24:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sCMDh2Mdjd3vMrOSNp6w4B13P1IKq44izkRMPvhO3w1gawAkGe7gq18KEs+IBTt9PEPZK+becmfKeZAo4SnkvGD7qQFTAjkIV4Sf1D8fMZoAoP+zHvs7FmrmV/kopRZUMu7HVi9G4sxz1lebBaBP/6NNgR8+5u8XirEnljD8u6zBKNjxJaIIawnm5Tz/J/fkbgNJh+H9cL/fN83adzsVjAQ4Tp4roqR3qwP9KzjpJqIEnxHWOMojNl3Dto+UAAdnzlnF1Ipvmi2nu9rxjHLE9wHmSqkOcqcwSoBhNBhXDczNfcf3rkQ465oJAB9m7lVTKigC2t6LEC1vZw/FBTp9rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhwzMw8zflTmLZ30I8nUi8pGywL+oY+6pL1KcPTThIc=;
 b=i6v/KVcAdKUk+RG71qTrFI/V6WtDhskKX/kGfdo9i65QWvHRARxW9+p/A9r/wt35UYGcHhjcLH9GQg8gZ9qmVTc7f69wh2nWXQnfamuyW8siczeipsd4SGHZJWSDE8YQdF9ew2bOmdotKp2WdqGqdF0SfbPFTCdlCosG3w7aXCgeEMtjEaPazjLoitlPjYrUAHl3gjftS5p05zaLovCQ+CKGj2rEfXzvvn9xONBMh+BtUMc7tb6yuQkMW2ymkGI3r6mpIrzEA+L9PJGb3UOTt0f7JbvyLp3Pinz7rZzRmg1fFmp36+vTVatZUQxQcOIggn9igSq+VyVB7oGzJ0kx9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB2854.namprd11.prod.outlook.com (2603:10b6:a02:c9::12)
 by SJ0PR11MB4992.namprd11.prod.outlook.com (2603:10b6:a03:2d4::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 17:24:56 +0000
Received: from BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42]) by BYAPR11MB2854.namprd11.prod.outlook.com
 ([fe80::8a98:4745:7147:ed42%5]) with mapi id 15.20.8207.014; Thu, 5 Dec 2024
 17:24:56 +0000
Date: Thu, 5 Dec 2024 12:24:52 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Levi, Ilia" <ilia.levi@intel.com>
CC: Piotr =?iso-8859-1?Q?Pi=F3rkowski?= <piotr.piorkowski@intel.com>,
 <matthew.auld@intel.com>, <intel-xe@lists.freedesktop.org>,
 <niranjana.vishwanathapura@intel.com>, <koby.elbaz@intel.com>,
 <yaron.avizrat@intel.com>
Subject: Re: [PATCH v5 1/5] drm/xe: Make irq enabled flag atomic
Message-ID: <Z1Hh5A2vcMj_Y1RK@intel.com>
References: <20241128125345.1115-1-ilia.levi@intel.com>
 <20241128125345.1115-2-ilia.levi@intel.com>
 <20241202183255.glrvcigzprouhklw@intel.com>
 <465360c2-8505-43a3-bd99-cceb2afe8ef5@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <465360c2-8505-43a3-bd99-cceb2afe8ef5@intel.com>
X-ClientProxiedBy: MW4PR03CA0066.namprd03.prod.outlook.com
 (2603:10b6:303:b6::11) To BYAPR11MB2854.namprd11.prod.outlook.com
 (2603:10b6:a02:c9::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB2854:EE_|SJ0PR11MB4992:EE_
X-MS-Office365-Filtering-Correlation-Id: f9f3e8bf-81e5-4499-f3bb-08dd1551bc56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?Jeg1eX1A4deqFQ/svyPErZwxQ8mdpi0vHZOL6uMAw0u5tDEnfLcXb3YsTz?=
 =?iso-8859-1?Q?rEj2ln1ijKscwKVTDrMFFbFHAXN6DrQ5gLjf35wxaHVJCjqeO1897a53JR?=
 =?iso-8859-1?Q?gmJzrO8QxZGFGDOwRCbg4yhBSmO1BpBjg4xYyPk/sVwaqHUYuEUl/DcnGA?=
 =?iso-8859-1?Q?MfqB17o9ffKrBswIqcs0r+1Vpq+r1w6t3/xCMdJCLD+y1EM5oGCEVs9onK?=
 =?iso-8859-1?Q?kGkbiDYNyBdQUVJSSNx9D2ZVVQ1jmRV/ZohDpn5NE8ureDSwEu7w1z0Nyv?=
 =?iso-8859-1?Q?Hw6vd4pYbt9dEKX6yjzepNJ411pCWmyWVPcaSF5e3XBpd8yUIXfArGP0ar?=
 =?iso-8859-1?Q?993xn2e9A2awmVAfCj41HbIXdTVJpvvffcRHy4a8FTpwh24XWWei5hD/RW?=
 =?iso-8859-1?Q?dyMyKNDAl/qN2IMiV0X4VRWB2km1Rgf1EvYg7V7reyKjw4TPeGR7kNekQa?=
 =?iso-8859-1?Q?5sCo4k1VFjsYOhC8NIs/l9sP7w8Zt3/ywN6ctFVt33FqBzYuSoKGxzkDJs?=
 =?iso-8859-1?Q?Wf4NhlBlG3hPzq6kJdiBKWTB/L3+XFvMpJpxEhTDKdKuWXPkt81URQ+98p?=
 =?iso-8859-1?Q?Q45GtHuNpF31BPNvdPlzix3rlAS7YLD1vW5s2ejFypAUaY4TxfkLXw/RpM?=
 =?iso-8859-1?Q?LO67afYX6zRqFK/SGkPv9DGEW/WSn6d4O4Un8jgq7SU7T7MLBEvogC3qTE?=
 =?iso-8859-1?Q?C3oNE7GnPaon0q1ADxtXvJwbFtacg4GSvBmlyIQwZK9u1u7vkZnZnVErZK?=
 =?iso-8859-1?Q?Nu4PdBl6XI/oDtMrYHr1zGrcRHwVs3i3In7mcQFiFkHOrtGrFVlJ7UeAM3?=
 =?iso-8859-1?Q?lP8VDcOUIbgA5jfal7s8+da2EbyqvhJ0gj/Z5WkC5yQWE6UC2Uja0IgDgQ?=
 =?iso-8859-1?Q?30dQKfHbmHZ2oushJ7eBMtkXkxQUzIQgtoEgVz7i5D6BX0m0gtvLLv7YJh?=
 =?iso-8859-1?Q?v9msMhjZ6igbp9XUQj+65ZFY3GqMrJPDDgVFPGOYoBFPnh8JzvBslWil+1?=
 =?iso-8859-1?Q?XLL0LTzot5n9Tod7TLV70PLGpwNn3Ns4YewWPCUOiyPN/D4jPO3lWYcPBC?=
 =?iso-8859-1?Q?gBmlrbZTMxXGWonVzBvwCo17wX8wc2/NN7gWyOjz4NQz0VR/znweDe8zzT?=
 =?iso-8859-1?Q?8NPBtTc+iyAQ6CjGpT38dOaKfmeyCkAc35vSsF11Bou6so3YuEktiQhzIj?=
 =?iso-8859-1?Q?cYhKCxj+XZKHUcy3xeRvXBOb/DOVpQR4sFVW7qu8NO0eG+Pt7DvVPxBujG?=
 =?iso-8859-1?Q?sUtp/BrWQsdQ5pGDkaPVFDdSfk70YIV25IDyuPY1wy7xTBnT6ayaw9fnD4?=
 =?iso-8859-1?Q?zC0m8QJer5UoH4AFj20hcvvU+z/1EEwc4IxHVBegVGOxG3dkR/Lth+reFa?=
 =?iso-8859-1?Q?6okxMqDCDysA5NYhhscyr0UOkZHAc1kQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB2854.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Pe2bjY6LEXjSizZeo9dx9+0/W3mmyihbyEr0+8r1sdnWHesfKmZhNOp//N?=
 =?iso-8859-1?Q?ayUEeCd5Qi4xo9HJyIw3BhHnwyieQh/rngDp15f0a4+nVNM9dO5YC/5AZI?=
 =?iso-8859-1?Q?bemJ2YSnpdF9AaaWd3fwtlgxQwyF6WJ6i2uJAshAlMqFB29LVKE5M9iqac?=
 =?iso-8859-1?Q?1glDzr8fkGPtQGvNyyDW6I7+S6IjFHHAhhC5cMMPws/8yV7Bs8n69TepDO?=
 =?iso-8859-1?Q?P0aS5soUWxtOS4R/u9AZLVrTbeLS7u50KRFP4syI6rPpsMMLn+LOJgAJN9?=
 =?iso-8859-1?Q?emHtJjtKCc3WjET0YWWTCuWzXcscfQpg1yakX1c3ygntLBf3SWO+ZJVOGL?=
 =?iso-8859-1?Q?I6ZvYeqNvVMUb6WSdjr55RoT/9xyr61ncXPaDf7YtferhSdT/DC7Nxnz+Y?=
 =?iso-8859-1?Q?5Ie+xzw8zPY3JLf6EAMmiXn4Uz+Irn9DVNIaoE1tIt5AGQoBvCBpeFGNx4?=
 =?iso-8859-1?Q?OuwsR96xvXkNOy1fJ9gkqm5iM9RtvfnuJ/UsILw4g2WfLwBGD1f/PMBLwl?=
 =?iso-8859-1?Q?en7OzzqtApPsx6NhXPWnVE5akWX+RmDcXnLEgPbAx0yLnaVLo/FhO282Br?=
 =?iso-8859-1?Q?ZcY9onVS7JvijY7jNQ3mXDE43DbxdH7w1mBZMTQkvR+lkcAQZ7ot+Ha/h2?=
 =?iso-8859-1?Q?3t0Arq+kWjA8C43iS2mARwcs1xe86RjZzI4bd35C0WHXpJ0nP6RyCe8mEc?=
 =?iso-8859-1?Q?Ab4wbGA+K9dWDcjWKeTKfSmfIrY/tGPUERJZ5wSNC8NctwIcq16+HCIofk?=
 =?iso-8859-1?Q?KVraBoFFnuF+CluaQm0gtwuLaN9KdQS7YVjq0Pxe9qVrIhsB8jENMUu3Sr?=
 =?iso-8859-1?Q?BFSqKZhQL4MRT6tFgTAdc/IkCEPpeMmDFBcWHcvETN5ftPeOYQFtw1Z/o6?=
 =?iso-8859-1?Q?0Ax1jPzeXlBotTcXiMefFYErty9uVs6L+KsIzuARHh7okUctODJZ0QnG/d?=
 =?iso-8859-1?Q?e/Oq1yEe8GDTuXFfcP4yXvr0qAfTOL63Xvqd0aJtkc3LikOYuQAseuVNa/?=
 =?iso-8859-1?Q?TghmPfAsS/N3QlRlafexwEXDjjCcCY5Csj1ke/k0WHqCdVZWGYL1YF8wKe?=
 =?iso-8859-1?Q?OerTAdJR/fUpibL1U/9O4sFeU11JcbJgr49V0Tz+H9X+1ozFe8g8r1pU6j?=
 =?iso-8859-1?Q?XYcB2La/zLfQ+VT0aLkeF4/82SJOSb1Tc/pWDoO9HwAw6fAD1iV9CER+hr?=
 =?iso-8859-1?Q?dLNewm+MSkzb2QVkYSFgOakusZU1hKaMIjUkl6fvrriFkVPEu8Ebi5nage?=
 =?iso-8859-1?Q?8svMojfjFsPsIgTHyOVXuYzaOs6poJMxvbnMpzRc1coEoQVA5+pUEe4lmV?=
 =?iso-8859-1?Q?pOaCa25QZFeutl2+65L+JUbBGKoeBGPTCDWfZtezrxlv0uuFRuYLnRUL1z?=
 =?iso-8859-1?Q?8cRrI/ZP43m6zVwH+fTxXHe9CdMjB8pPxZejvVPaBvbHKK0VchpvECgDAv?=
 =?iso-8859-1?Q?884TAEi1hHRlZwKP6zu8hNVbe6V/crJduL7MEYj45o5jwHxtRm+jrz6wyg?=
 =?iso-8859-1?Q?MqZi1S5C2b8xWPoMBNS/GJ28Sc1nSq00fRXspfIq7GLgYg9+5Mbhule9sb?=
 =?iso-8859-1?Q?3PqlyfJMBy3qzSVQz0nYJKC2wWClaftJS6+G+df3vd/q3EJbKP890TC37R?=
 =?iso-8859-1?Q?6DG46dqm+JCxNokHo91f/XlnBaiW3NEy12wCBPyUNW9fwGy6dzMBnDfA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f3e8bf-81e5-4499-f3bb-08dd1551bc56
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB2854.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 17:24:56.1393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9nLxOhn4pTeln1rHiWNBy4SPWp2OQcP3pF+6/buxpq7hhfgJCtORJfGovoXspzWItw55GU7jVK5j8HcJnz2prQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4992
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

On Tue, Dec 03, 2024 at 01:47:42PM +0200, Levi, Ilia wrote:
> On 02/12/2024 20:32, Piotr Piórkowski wrote:
> > Ilia Levi <ilia.levi@intel.com> wrote on czw [2024-lis-28 14:53:41 +0200]:
> >> The irq.enabled flag was protected by a spin lock (irq.lock).
> >> By making it atomic we no longer need to wait for the spin lock in
> >> irq handlers. This will become especially useful for MSI-X irq
> >> handlers to prevent lock contention between different interrupts.
> > I am not convinced that you can simply replace this spin_lock with an atomic.
> > Note that this spin lock is also used for whole blocks in the irq handler
> > (for example gt_irq_handler), and not only to access this flag.
> 
> Yes, I saw that. However, irq.enabled is not accessed within those blocks, so imho there is no need in mutual exclusion between checking the flag and those blocks.
> If I understand correctly, the role of irq.enabled flag is to prevent new irq handlers from running  once the interrupts have been turned off (e. g. as a result of suspension), while synchronize_irq waits for the already running irq handlers to finish. Making the flag atomic should achieve the same goal. I have left the spin lock to protect access to interrupt registers (and there's also some protection in xe_execlist_port_destroy), though I'm not sure when it is useful.
> 
> Adding Rodrigo and Matthew in case I'm missing something.

I believe Ilia is right here and I was over-protective trying to use
the spinlock to also protect the enabled and not just the irq data
itself as its intended doc says.

I was concerned about display code, but then looking again to the code,
on i915 the enabled is not protected as well and not even an atomic,
so an atomic is a bonus here.

But we do need to test this patch here with display enabled.
Please ensure you also convert the irq.enabled at
drivers/gpu/drm/xe/display/ext/i915_irq.c
and kill that XXX comment section that I had written there,
because after this patch that argument makes even less sense.

Thanks,
Rodrigo.

> Thanks,
> Ilia
> 
> >
> > Thanks,
> > Piotr
> >
> >
> >> Signed-off-by: Ilia Levi <ilia.levi@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/display/ext/i915_irq.c |  2 +-
> >>  drivers/gpu/drm/xe/xe_device_types.h      |  2 +-
> >>  drivers/gpu/drm/xe/xe_irq.c               | 29 ++++++-----------------
> >>  3 files changed, 9 insertions(+), 24 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/xe/display/ext/i915_irq.c b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> >> index a7dbc6554d69..0c0f4533c34f 100644
> >> --- a/drivers/gpu/drm/xe/display/ext/i915_irq.c
> >> +++ b/drivers/gpu/drm/xe/display/ext/i915_irq.c
> >> @@ -64,7 +64,7 @@ bool intel_irqs_enabled(struct xe_device *xe)
> >>  	 * But at this point the xe irq is better protected against races,
> >>  	 * although the full solution would be protecting the i915 side.
> >>  	 */
> >> -	return xe->irq.enabled;
> >> +	return atomic_read(&xe->irq.enabled);
> >>  }
> >>  
> >>  void intel_synchronize_irq(struct xe_device *xe)
> >> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> >> index 6a04f975ec16..7ee114c17552 100644
> >> --- a/drivers/gpu/drm/xe/xe_device_types.h
> >> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> >> @@ -347,7 +347,7 @@ struct xe_device {
> >>  		spinlock_t lock;
> >>  
> >>  		/** @irq.enabled: interrupts enabled on this device */
> >> -		bool enabled;
> >> +		atomic_t enabled;
> >>  	} irq;
> >>  
> >>  	/** @ttm: ttm device */
> >> diff --git a/drivers/gpu/drm/xe/xe_irq.c b/drivers/gpu/drm/xe/xe_irq.c
> >> index 7bf7201529ac..1c509e66694d 100644
> >> --- a/drivers/gpu/drm/xe/xe_irq.c
> >> +++ b/drivers/gpu/drm/xe/xe_irq.c
> >> @@ -348,12 +348,8 @@ static irqreturn_t xelp_irq_handler(int irq, void *arg)
> >>  	unsigned long intr_dw[2];
> >>  	u32 identity[32];
> >>  
> >> -	spin_lock(&xe->irq.lock);
> >> -	if (!xe->irq.enabled) {
> >> -		spin_unlock(&xe->irq.lock);
> >> +	if (!atomic_read(&xe->irq.enabled))
> >>  		return IRQ_NONE;
> >> -	}
> >> -	spin_unlock(&xe->irq.lock);
> >>  
> >>  	master_ctl = xelp_intr_disable(xe);
> >>  	if (!master_ctl) {
> >> @@ -417,12 +413,8 @@ static irqreturn_t dg1_irq_handler(int irq, void *arg)
> >>  
> >>  	/* TODO: This really shouldn't be copied+pasted */
> >>  
> >> -	spin_lock(&xe->irq.lock);
> >> -	if (!xe->irq.enabled) {
> >> -		spin_unlock(&xe->irq.lock);
> >> +	if (!atomic_read(&xe->irq.enabled))
> >>  		return IRQ_NONE;
> >> -	}
> >> -	spin_unlock(&xe->irq.lock);
> >>  
> >>  	master_tile_ctl = dg1_intr_disable(xe);
> >>  	if (!master_tile_ctl) {
> >> @@ -644,12 +636,8 @@ static irqreturn_t vf_mem_irq_handler(int irq, void *arg)
> >>  	struct xe_tile *tile;
> >>  	unsigned int id;
> >>  
> >> -	spin_lock(&xe->irq.lock);
> >> -	if (!xe->irq.enabled) {
> >> -		spin_unlock(&xe->irq.lock);
> >> +	if (!atomic_read(&xe->irq.enabled))
> >>  		return IRQ_NONE;
> >> -	}
> >> -	spin_unlock(&xe->irq.lock);
> >>  
> >>  	for_each_tile(tile, xe, id)
> >>  		xe_memirq_handler(&tile->memirq);
> >> @@ -674,10 +662,9 @@ static void irq_uninstall(void *arg)
> >>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> >>  	int irq;
> >>  
> >> -	if (!xe->irq.enabled)
> >> +	if (!atomic_xchg(&xe->irq.enabled, 0))
> >>  		return;
> >>  
> >> -	xe->irq.enabled = false;
> >>  	xe_irq_reset(xe);
> >>  
> >>  	irq = pci_irq_vector(pdev, 0);
> >> @@ -724,7 +711,7 @@ int xe_irq_install(struct xe_device *xe)
> >>  		return err;
> >>  	}
> >>  
> >> -	xe->irq.enabled = true;
> >> +	atomic_set(&xe->irq.enabled, 1);
> >>  
> >>  	xe_irq_postinstall(xe);
> >>  
> >> @@ -744,9 +731,7 @@ void xe_irq_suspend(struct xe_device *xe)
> >>  {
> >>  	int irq = to_pci_dev(xe->drm.dev)->irq;
> >>  
> >> -	spin_lock_irq(&xe->irq.lock);
> >> -	xe->irq.enabled = false; /* no new irqs */
> >> -	spin_unlock_irq(&xe->irq.lock);
> >> +	atomic_set(&xe->irq.enabled, 0); /* no new irqs */
> >>  
> >>  	synchronize_irq(irq); /* flush irqs */
> >>  	xe_irq_reset(xe); /* turn irqs off */
> >> @@ -762,7 +747,7 @@ void xe_irq_resume(struct xe_device *xe)
> >>  	 * 1. no irq will arrive before the postinstall
> >>  	 * 2. display is not yet resumed
> >>  	 */
> >> -	xe->irq.enabled = true;
> >> +	atomic_set(&xe->irq.enabled, 1);
> >>  	xe_irq_reset(xe);
> >>  	xe_irq_postinstall(xe); /* turn irqs on */
> >>  
> >> -- 
> >> 2.43.2
> >>
> 
