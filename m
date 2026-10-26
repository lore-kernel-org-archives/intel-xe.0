Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755AF606A33B
	for <intel-xe@archiver.kernel.org>; Mon, 26 Oct 2026 21:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NedZqFYG
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F66910E183;
	Mon, 26 Oct 2026 21:54:05 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16E9A10E09A
 for <intel-xe@lists.freedesktop.org>; Mon, 26 Oct 2026 21:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793051639; x=1824587639;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=BTLacU7C8y47dVssQVQnZ8E/1qZCNCQbJ2XMwuNCoXQ=;
 b=NedZqFYG9o8Yy+iIThft+0AEnVPz+vEYSx1J2+WM5RJe8DJx4JhPE3jo
 o7R/j4Y6tWmxRqbrkVh0PraABLEYz39YkwgnaOCise4COXIOgLHjM++uY
 maNRnRWlF+6Cu/vZeEuAow87W9V2w2Atn7rFqA9/EfM9V4klcZGtiqKJ3
 IjEqBgIWYgul5l6Q7HLEfzvFLhJg8w1PKt9C1yEf3LuiGiUweFbT5WORe
 n9tn8DPL51fZ4fXCMXA/G+Fl6Rmd4vEIG/uJ/31rJ97ESCsAb+7tvYip0
 E7L2zlpWqh92OZlA/MIPE56PHdSRE2J2XQ2uHgo3OVBPqY9N5/FLv8iFO g==;
X-CSE-ConnectionGUID: 5S6X8TBeRQOVKSSAEtuPtg==
X-CSE-MsgGUID: 1jdB0wHoQZeRtcDdGeHzJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1631234"
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="1631234"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:53:59 -0700
X-CSE-ConnectionGUID: 3iHj98hCTQqiLHC/cVPbEw==
X-CSE-MsgGUID: DYORAprSSDiRELip5zC6HA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,180,1787036400"; 
   d="scan'208";a="6240089"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2026 14:53:59 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:53:58 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Mon, 26 Oct 2026 14:53:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.37)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Mon, 26 Oct 2026 14:53:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ioeqDqQBGP6AX/pMtuaxmcyuj1Osr6+nzNvFY/B5LylNbpP2YzWov2Wgv2h8xNCZwW1YAL/aTB9tyxKErOQzcKIhisYT7q94ffkoHwEH6tq3JvuL5MliTqbvnrOC4UcSmS9Vn7ACmc/Z5X8l8hKuWdpqLumGiGef1FyNDGGDOwqevBXh+Jq3O65NZdjpj7PNkI3F2sUqEZjK4KNJqXFYmMWs3gULU8+ebMOmE9aevVVbO3N/AsYbRUwcHS9US14yepwoPGIlr08pvrjOGsE2194Mgv5gtQpmUuyF2pqe5k9nKhvz/9X90hFifLOdNx8Z1bhbq73uVUD9+hi7DB4jWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AsCG2+0JY8sBnI+gepe20cdgzEC8Np46e5CbK1ExNjI=;
 b=J7KIFwnSTgxkUSb1/oQRdyb6Em5XItXVRgO8JX52gLrGBNAc1KSQqehTEZTwk+VOf76ki+Xkqwaf69wK4wZVGpEVjwezpPGNA3aZuJRxOAas8t3lRzgEf5XcPNOXMbDiaTyAw1y+itdnswpLgZKxhnjMfTafmPK4b7zthDJyXdjaa33cd2XIYMROeK6SxUttS8Dg/LcvZ5odLGWkjjriFFMwzk16hu3WTjb9m5Jf9l4Xc4PLpUgDjw6Skls4uq5zowX0GK7oArjNUB4XKRnst0fXKG8Qm+8V+B+DSRGSntli4SohfbN/MIWA4vLlJMbTLXMzx9j5mshWm9iHp0iKTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5395.namprd11.prod.outlook.com (2603:10b6:610:ba::6)
 by PH7PR11MB6834.namprd11.prod.outlook.com (2603:10b6:510:1ed::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 21:53:53 +0000
Received: from CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490]) by CH0PR11MB5395.namprd11.prod.outlook.com
 ([fe80::2e5f:eb:b663:a490%5]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 21:53:53 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Charles, Daniel" <daniel.charles@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Wang, X" <x.wang@intel.com>, "Yao, Jia" <jia.yao@intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 3/3] drm/xe: Synchronously wait for queue kill on FD
 close
Thread-Topic: [PATCH v4 3/3] drm/xe: Synchronously wait for queue kill on FD
 close
Thread-Index: AQHdXaluTYN8nLBArUKa88uepzZfALcQbYSA
Date: Mon, 26 Oct 2026 21:53:53 +0000
Message-ID: <CH0PR11MB5395868873D5E5880F7D593DE5612@CH0PR11MB5395.namprd11.prod.outlook.com>
References: <20261016195904.1377149-1-daniel.charles@intel.com>
 <20261016195904.1377149-4-daniel.charles@intel.com>
In-Reply-To: <20261016195904.1377149-4-daniel.charles@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5395:EE_|PH7PR11MB6834:EE_
x-ms-office365-filtering-correlation-id: df3539b3-cd5e-4cb0-d5f1-08df33aba07e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|261009223027099003|261021121427099003|261021123027099003|261022105027099003|261022075727099003|10067099003|56012099006|261026140227099003|6133799003|22082099003|18002099003|261026121527099003|11063799006|4143699003|38070700021;
x-microsoft-antispam-message-info: GuFGVjjYmJE/zJ5cKyoIdnQd/6jVvFNq0T9sgf9lfPl9EA8ZaHRhPyhY/+X2TnYMzI03cvcb51V6o1iL1f3nEkArUl7gcZTX4OdeaGn57yOvwLox5tV9OqQjJAxs4JDq+OYY3yo8vytqltrodQ5LgIWJF7rXCglLX288qW2t/wcN9Pcd1iLVh4HYd95OyVHJE1tysxOQ/1lncTTH4qAKqHHRagbE0ZRKBmBbhICm+ZykvwpFDnYH+Jj9H59wznHPOwTs2ZMRUOtexGyWLw4Yy2I+2FW2r2THzDX6bvgNbol5q2A0MEvZEsv7RInHuRLwJLCyaayOEWxT/tnk7IQumW2jSGy+zaXdDLHiaaWjuHW/z0SBtrkhY3TGs/ZFkfCdEEU8/jvqgOcFL+J3LYAsux1LiFod0pNqr5bu40K+l9W0XkMjDi4KAESGb9iEgRTJTVRncIhpBB8aDIKrynZKLS+t21RQ2rMbqxvyM3wvdLuPtNGxh0l8vkWlJ+xkj7dV1LMoZ1ahM54VwMvzZZr0MYujgf+gWksVaRzX+vvneYeAmYjcJj4VcgZPCxFPrECUI9XuH9Nj27FY5lBXRGWa/I6t80SMA+HtOY3B772bc5p+NJgZDSCKX8B3/Ax7EKMuET/bed/djr3pv20YAnUBTkQTMDT2Cdj2Ksp7PmS5RmEG6LI1fWt0f/Cx50iCWR35yIzeKZbXiAR5TsbcnNlwOazAN2Nxwj/zYVDAbKaIqf8=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5395.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(261009223027099003)(261021121427099003)(261021123027099003)(261022105027099003)(261022075727099003)(10067099003)(56012099006)(261026140227099003)(6133799003)(22082099003)(18002099003)(261026121527099003)(11063799006)(4143699003)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cwYFLHmnZP3mwhf+qkJYkpStdYxTQqNOQwPXqunWDJ7fbzMRc+oOnglNoYHs?=
 =?us-ascii?Q?bLN9pNj2qB056YNldnszVbhJmPts3GSy5thbcQYu1kzEw5GWn/xh9SD8Kukv?=
 =?us-ascii?Q?wrxrQaaw+KPHiRlrRAQDC+OHKL+sN8yBhWCe1R8HJrxI42pSnef14UB4uGWR?=
 =?us-ascii?Q?q4msc2jAVLO3LuWH7ebfzXAsTNj7CsRzPSbFgz05oaC/t1/hCxX2KN6AIMNo?=
 =?us-ascii?Q?DoLxvyW9DhqESGYS84zMWWKY0IR5V/s5fd7xiMTqpmk+zJQL53wMc6HJjHex?=
 =?us-ascii?Q?t2XIFm+uCz6hVVeuNiKKJPIMKiQWV1+XARrf4DLXPfr4VmsUCTUHFvv1NGGh?=
 =?us-ascii?Q?gmSqSCtMK3f9KpzBKcCS2HhFO1T8F0A55ZgMjQ9LOxi1mq34/x9UTlYnCiJa?=
 =?us-ascii?Q?zRUf/3aoPPNGBKLioBAuEQ/VuHdhwxQ67AFfTnLmWzk/1L2mxYzWG28epkc5?=
 =?us-ascii?Q?GIocdWbdrPHpnmx19ptmaNsqrnghbaf488BiM7oIO7E02ctGb2oB2bbMTT/5?=
 =?us-ascii?Q?EYQQy6KMnS/RZdX+G1RiaN54hQFbJ0rU8/y69eunimTx5Af/zT8c8SkJbhzc?=
 =?us-ascii?Q?Hu+4JDHAZyRI7FIKplXF7dCHJhP+NoVwyK+1EaLgS7mcRUtIxJcdvW5UO+LR?=
 =?us-ascii?Q?m5qOLa2uakZ1cMJDssQFS6UUNGTGKeLMJkX+xp1aHWG0QlrbFXXXrhN/PH8Y?=
 =?us-ascii?Q?BE0X3LMbBVYO2CIAKgt9sYJ28eeRYn441NbLB2gF+3qp5Mf3ioWCg6TV+kB2?=
 =?us-ascii?Q?fBsYV7XLHK66yLZcVpL6czCGEZf7/2+1/0glC8VBV1SDsvIt3bcU8vy/a9x7?=
 =?us-ascii?Q?m6Hg0ET96YxwRM2E/CzhDf5RatA8E+ApicS/8MU2TDWoJHd7q7A7+06EAPzF?=
 =?us-ascii?Q?+3NMWvsPf6z1Q1Rc8lTd3DiNNQ2KFhXOxQROqAaAufUvPYFASP21oySf5IXv?=
 =?us-ascii?Q?rynGsGBtU776ZDJVkTS6g6ekCkxPHJYJkm/GA7WRzt6YhvpjRWkSbnLKYA2t?=
 =?us-ascii?Q?Au5gxjLdQJ+4vJbFrEeP0dvR8WDD4n/x1bS4zo20EVomcvf2OuK5LAsU9tiw?=
 =?us-ascii?Q?NbKlfL32sisbRGdw1Y76+CDr2e05MuVelyzHacxTVTO+fqt4OEGifAnSi4IN?=
 =?us-ascii?Q?5b27ZeJexslyWXkOfZ/LmBkrfvmrL/5YIUL1nvwNSIg8qA95k4koPiWo/FMC?=
 =?us-ascii?Q?7qlAqb+HXI6Fxps9pm1G/OP4oNmkyzyRvkY9rIZSvC6aVeXmsVgBCJhTD5N9?=
 =?us-ascii?Q?IYrVp3D0vPUmmL9WPRA98dSjaFr9H6ZqSJPlOAdT8Bq+Q3MjZocT62YBOl9h?=
 =?us-ascii?Q?N47Grl06R3FyLeZoyRKotsH36R7Cppo0j/DKjlh5DadUwWLJQdyiP3rfhytk?=
 =?us-ascii?Q?8TIulPGFl8WRSgklNPuwL2vtsS8MFRxVL9VqRDA2kl9eqj0yzTuZaQTHQgxt?=
 =?us-ascii?Q?EEO0cz3iMPWkSMAmuyS9Xmf8mhpB9am/i6mmTeTmIyAYKtedc6GsXTsYMmCk?=
 =?us-ascii?Q?H2lhg4nkCZlHxVBoA0JpMYIb75aW+qtrtgRqtdMWkdwvOe8E5e9ek2oPP2SK?=
 =?us-ascii?Q?sArOqOF2cP2SoWpdjLUxO1Ql3gBy+ilQ6vQkp7BKHOZX/LcCOuxIkAGLMKNe?=
 =?us-ascii?Q?YmawCV8CGI0Gy4LP+IEPUVU6RwrVeWckQ4x8WfDZNIwXVTdiwFrA9aJUmk+M?=
 =?us-ascii?Q?i6LhIokvYNL/kDetWb9eFQSokZaR2SLyVeJHXVyD9DtQ1wfEpfaQpT7JSpNh?=
 =?us-ascii?Q?0u6oe2M/aA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: c2qMpzmvE013RRSyxZ9PuFKW6MuGCeyqniMYyUGz9QOR9IDzCS8tsgSWEFCxtMhBM7lCQmgI6MT3jo+AXJWTZF4pz4kkSZCrkerTUdU3hNoolyB4LFXNB6Vfx1jCwjne5r2Eg6aYLtHsEzMAwkOBBMiT9xRQqwPNbmFMzz9lAAY+XqT0Sl1nanwiWtM11AcxDDFstk+PG7Q8GVHAn9B/t6jNuawOKxxvWgqA0FrinKCyiQj30NZR3ultFBXBbhp9NT8DgvRJdxzCdu5YkNcgrbNGl116vlpLthXIS/4EJEGsyS38a8uGWQKC2rtG6wFn9JRaChrWsiszVqaZN6P5oQ==
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5395.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df3539b3-cd5e-4cb0-d5f1-08df33aba07e
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2026 21:53:53.4407 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LeTB9JrbKYJDgp3hXE/t1ffwx54sqEzr9BYw094lk77s2DOGk2emgJtWiep+dD9T8jlBdS4RqQc2zBTvuW1a7J/6IK2heObBOrkDZ7LPMis=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6834
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

-----Original Message-----
From: Charles, Daniel <daniel.charles@intel.com>=20
Sent: Friday, October 16, 2026 12:59 PM
To: intel-xe@lists.freedesktop.org
Cc: Wang, X <x.wang@intel.com>; Yao, Jia <jia.yao@intel.com>; Cavitt, Jonat=
han <jonathan.cavitt@intel.com>; Brost, Matthew <matthew.brost@intel.com>; =
Charles, Daniel <daniel.charles@intel.com>
Subject: [PATCH v4 3/3] drm/xe: Synchronously wait for queue kill on FD clo=
se
>=20
> The early KILL message disables GuC scheduling outside the serialized
> TDR path, but xe_file_close() does not wait for it to complete before
> dropping queue references. GuC may still schedule contexts whose page
> tables are being torn down, producing CAT errors and engine resets.
>=20
> Split FD close teardown into two passes: first kill every queue so all
> KILL messages are queued in parallel, then call the new
> xe_exec_queue_kill_sync() and drop the reference for each queue.
>=20
> The GuC backend implementation waits, with a timeout, for scheduling to
> be disabled with no pending enable/disable. The wait also completes when
> GuC submission is stopped, VF recovery is in progress, or the queue is
> wedged. If GuC does not respond within the timeout, a GT reset is
> triggered to stop GuC scheduling.
>=20
> The waiters sleep on a dedicated kill_wq rather than ct.wq. ct.wq is
> shared with every exec queue deregistration waiting for a pending
> enable/disable, and a workload destroying thousands of queues can have
> thousands of such waiters. Waking ct.wq for each scheduling-disable
> SCHED_DONE wakes all of them while the CT lock is held, stalling G2H
> processing until deregistration waits time out and trigger a GT reset.
> kill_wq is woken from SCHED_DONE handling, and on submission stop, wedge
> and VF migration recovery, only when it has sleepers.
>=20
> v2:
>  - Bound the wait with a timeout, GT reset on timeout (Sashiko, Matt B)
>  - Drop the flush_work() loop (Matt B)
>  - Use xe_assert() for the killed-queue check (Matt B)
>  - Merge the put loop into the kill_sync loop (Matt B)
> v3:
>  - Wait on a dedicated kill_wq instead of waking ct.wq on every
>    scheduling-disable SCHED_DONE (CI)
>=20
> Assisted-by: LLM
> Signed-off-by: Daniel Charles <daniel.charles@intel.com>

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device.c           |  5 +++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 13 +++++++
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 +
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c      |  1 +
>  drivers/gpu/drm/xe/xe_guc_submit.c       | 48 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_guc_submit.h       |  1 +
>  drivers/gpu/drm/xe/xe_guc_types.h        |  6 +++
>  8 files changed, 77 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_devic=
e.c
> index 8392c9fad3c48..cf75fa3b8fa4b 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -190,8 +190,13 @@ static void xe_file_close(struct drm_device *dev, st=
ruct drm_file *file)
>  		if (q->vm && q->hwe->hw_engine_group)
>  			xe_hw_engine_group_del_exec_queue(q->hwe->hw_engine_group, q);
>  		xe_exec_queue_kill(q);
> +	}
> +
> +	xa_for_each(&xef->exec_queue.xa, idx, q) {
> +		xe_exec_queue_kill_sync(q);
>  		xe_exec_queue_put(q);
>  	}
> +
>  	xa_for_each(&xef->vm.xa, idx, vm)
>  		xe_vm_close_and_put(vm);
> =20
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_e=
xec_queue.c
> index 9a8efa2bf2bfb..8ba2cf45694dd 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -1622,6 +1622,19 @@ void xe_exec_queue_kill(struct xe_exec_queue *q)
>  	xe_vm_remove_compute_exec_queue(q->vm, q);
>  }
> =20
> +/**
> + * xe_exec_queue_kill_sync() - Wait for queue scheduling to stop
> + * @q: The exec queue
> + *
> + * This function waits for the backend to finish stopping the queue afte=
r
> + * xe_exec_queue_kill(). It is safe to call multiple times.
> + */
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	if (q->ops->kill_sync)
> +		q->ops->kill_sync(q);
> +}
> +
>  /**
>   * xe_exec_queue_destroy_ioctl() - Destroy an exec queue via IOCTL
>   * @dev: DRM device
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_e=
xec_queue.h
> index e8963f85cabd9..4be023b9a4c6c 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
> @@ -119,6 +119,7 @@ bool xe_exec_queue_is_lr(struct xe_exec_queue *q);
>  bool xe_exec_queue_is_idle(struct xe_exec_queue *q, int extra_jobs);
> =20
>  void xe_exec_queue_kill(struct xe_exec_queue *q);
> +void xe_exec_queue_kill_sync(struct xe_exec_queue *q);
> =20
>  int xe_exec_queue_create_ioctl(struct drm_device *dev, void *data,
>  			       struct drm_file *file);
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/x=
e/xe_exec_queue_types.h
> index 48c05398b0168..4882eeccb9bd5 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -294,6 +294,8 @@ struct xe_exec_queue_ops {
>  	int (*init)(struct xe_exec_queue *q);
>  	/** @kill: Kill inflight submissions for backend */
>  	void (*kill)(struct xe_exec_queue *q);
> +	/** @kill_sync: Wait for the backend to stop queue scheduling */
> +	void (*kill_sync)(struct xe_exec_queue *q);
>  	/** @fini: Undoes the init() for submission backend */
>  	void (*fini)(struct xe_exec_queue *q);
>  	/**
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_=
gt_sriov_vf.c
> index 37899fcf5b227..bf41f80761f98 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -910,6 +910,7 @@ static void vf_start_migration_recovery(struct xe_gt =
*gt)
>  		smp_wmb();	/* Ensure above writes visible before wake */
> =20
>  		xe_guc_ct_wake_waiters(&gt->uc.guc.ct);
> +		xe_guc_submit_wake_kill_waiters(&gt->uc.guc);
> =20
>  		started =3D queue_work(gt->ordered_wq, &gt->sriov.vf.migration.worker)=
;
>  		xe_gt_sriov_info(gt, "VF migration recovery %s\n", started ?
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_g=
uc_submit.c
> index 97369d97ef51f..a124abdb1d46b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -316,6 +316,7 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned i=
nt num_ids)
>  	gt->exec_queue_ops =3D &guc_exec_queue_ops;
> =20
>  	xa_init(&guc->submission_state.exec_queue_lookup);
> +	init_waitqueue_head(&guc->submission_state.kill_wq);
> =20
>  	primelockdep(guc);
> =20
> @@ -551,6 +552,26 @@ static bool vf_recovery(struct xe_guc *guc)
>  	return xe_gt_recovery_pending(guc_to_gt(guc));
>  }
> =20
> +static void guc_wake_kill_waiters(struct xe_guc *guc)
> +{
> +	/* wq_has_sleeper() implies a full barrier, pairing with the waiter */
> +	if (wq_has_sleeper(&guc->submission_state.kill_wq))
> +		wake_up_all(&guc->submission_state.kill_wq);
> +}
> +
> +/**
> + * xe_guc_submit_wake_kill_waiters() - Wake exec queue kill_sync waiters
> + * @guc: the &xe_guc
> + *
> + * Wake any exec queue kill_sync waiters so they re-evaluate their wait
> + * condition, e.g. after VF migration recovery has started.
> + */
> +void xe_guc_submit_wake_kill_waiters(struct xe_guc *guc)
> +{
> +	if (guc->submission_state.initialized)
> +		guc_wake_kill_waiters(guc);
> +}
> +
>  static void xe_guc_exec_queue_trigger_cleanup(struct xe_exec_queue *q)
>  {
>  	struct xe_guc *guc =3D exec_queue_to_guc(q);
> @@ -1433,6 +1454,7 @@ void xe_guc_submit_wedge(struct xe_guc *guc)
>  			if (xe_exec_queue_get_unless_zero(q))
>  				set_exec_queue_wedged(q);
>  		mutex_unlock(&guc->submission_state.lock);
> +		guc_wake_kill_waiters(guc);
>  	} else {
>  		/* Forcefully kill any remaining exec queues, signal fences */
>  		guc_submit_reset_prepare(guc);
> @@ -2291,6 +2313,28 @@ static void guc_exec_queue_kill(struct xe_exec_que=
ue *q)
>  	xe_guc_exec_queue_trigger_cleanup(q);
>  }
> =20
> +static void guc_exec_queue_kill_sync(struct xe_exec_queue *q)
> +{
> +	struct xe_exec_queue *primary =3D xe_exec_queue_multi_queue_primary(q);
> +	struct xe_guc *guc =3D exec_queue_to_guc(primary);
> +	long ret;
> +
> +	xe_assert(guc_to_xe(guc), exec_queue_killed(q));
> +
> +	ret =3D wait_event_timeout(guc->submission_state.kill_wq,
> +				 (!exec_queue_enabled(primary) &&
> +				  !exec_queue_pending_disable(primary) &&
> +				  !exec_queue_pending_enable(primary)) ||
> +				 xe_guc_read_stopped(guc) ||
> +				 vf_recovery(guc) ||
> +				 exec_queue_wedged(primary), HZ * 5);
> +	if (!ret) {
> +		xe_gt_warn(q->gt, "Queue kill failed to respond, guc_id=3D%d\n",
> +			   primary->guc->id);
> +		xe_gt_reset_async(q->gt);
> +	}
> +}
> +
>  static void guc_exec_queue_add_msg(struct xe_exec_queue *q, struct xe_sc=
hed_msg *msg,
>  				   u32 opcode)
>  {
> @@ -2768,6 +2812,7 @@ static u64 guc_exec_queue_reset_status(struct xe_ex=
ec_queue *q)
>  static const struct xe_exec_queue_ops guc_exec_queue_ops =3D {
>  	.init =3D guc_exec_queue_init,
>  	.kill =3D guc_exec_queue_kill,
> +	.kill_sync =3D guc_exec_queue_kill_sync,
>  	.fini =3D guc_exec_queue_fini,
>  	.destroy =3D guc_exec_queue_destroy,
>  	.set_priority =3D guc_exec_queue_set_priority,
> @@ -2849,6 +2894,7 @@ static int guc_submit_reset_prepare(struct xe_guc *=
guc)
>  	ret =3D atomic_fetch_or(1, &guc->submission_state.stopped);
>  	smp_wmb();
>  	wake_up_all(&guc->ct.wq);
> +	guc_wake_kill_waiters(guc);
> =20
>  	return ret;
>  }
> @@ -3412,6 +3458,7 @@ static void handle_sched_done(struct xe_guc *guc, s=
truct xe_exec_queue *q,
>  		clear_exec_queue_pending_enable(q);
>  		smp_wmb();
>  		wake_up_all(&guc->ct.wq);
> +		guc_wake_kill_waiters(guc);
>  	} else {
>  		bool was_pending;
> =20
> @@ -3447,6 +3494,7 @@ static void handle_sched_done(struct xe_guc *guc, s=
truct xe_exec_queue *q,
>  				clear_exec_queue_pending_disable(q);
>  			}
>  		}
> +		guc_wake_kill_waiters(guc);
>  	}
>  }
> =20
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.h b/drivers/gpu/drm/xe/xe_g=
uc_submit.h
> index 29abf07d8f041..ab07d73b2b9e0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.h
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.h
> @@ -28,6 +28,7 @@ void xe_guc_submit_unpause(struct xe_guc *guc);
>  void xe_guc_submit_unpause_vf(struct xe_guc *guc);
>  void xe_guc_submit_unpause_prepare_vf(struct xe_guc *guc);
>  void xe_guc_submit_wedge(struct xe_guc *guc);
> +void xe_guc_submit_wake_kill_waiters(struct xe_guc *guc);
> =20
>  int xe_guc_read_stopped(struct xe_guc *guc);
>  int xe_guc_sched_done_handler(struct xe_guc *guc, u32 *msg, u32 len);
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_gu=
c_types.h
> index 3dbcb1331690e..3f3138d6750d8 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -93,6 +93,12 @@ struct xe_guc {
>  		atomic_t reset_blocked;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
> +		/**
> +		 * @submission_state.kill_wq: wait queue for exec queue kill_sync
> +		 * waiters, kept separate from &xe_guc_ct.wq so that waking them
> +		 * from the G2H handler does not wake every CT waiter.
> +		 */
> +		wait_queue_head_t kill_wq;
>  		/** @submission_state.enabled: submission is enabled */
>  		bool enabled;
>  		/**
> --=20
> 2.43.0
>=20
>=20
