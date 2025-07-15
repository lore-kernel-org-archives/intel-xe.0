Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C81ECC83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 21:51:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63D4610E0BF;
	Tue, 15 Jul 2025 21:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ear+eBll";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8A010E0BF
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 21:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752616261; x=1784152261;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=TaIm3ona832Oqa77NdqEdgHhum9DwwvhrNDd+/TmYFo=;
 b=Ear+eBll5rRZR7BKIQVhlv4PvXIWRP9MQNyaWJTjOwXoKuQQgjBJyfvY
 Xi9E7TfQh7uDWlfIw+aD+Ri/6SUCtQVqIvSiM4Zqd4SmzMw4MrrvqsiyI
 +q/AnMrOlNV4v3kRIDXzErUqRfg6AK31Z1eBjLGTy558tl8WAL8w9g4Y1
 XuyNU8FiEpllZW8/5lVfev7cToBJhffa66MIt4OrqsRTumV6hjEL0kSDz
 LP4jQEl8k3teY4aYVR5+puDsqwbAFMyR3e9gkNoq60DNO0rcxEru++PDS
 /T7I7e4ENeafU45l+gbay8PBbUfhPDwbpwf3gFFHskW9WRzR/Lb2wQV9U g==;
X-CSE-ConnectionGUID: 6swbw4g9TfuBpwvaFvLE0A==
X-CSE-MsgGUID: fX+Da3r6SmOLGJMpdXw7hg==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="65111980"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="65111980"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:51:00 -0700
X-CSE-ConnectionGUID: EYQE2W8MRsOr5GNejQTvMA==
X-CSE-MsgGUID: SQ8qx/enR++IRS9sRdTyxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="188337741"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 14:51:00 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:50:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 14:50:59 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.72) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 14:50:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qONWLhbdUKlYzzMjkb+F27xSuSuDF9WocMrNN/ulmpAK1QL3rF6BGYUDrWUbc/L9jCMGQ7xvRvAg07Oj6TXitJ/vtsvTDphdbPTRLj0+jMbBrkXx95NfP7Ibh0DdNWQuOMEEy9ucBPYfCVHeLJFL3pdOuC2G583LMkg3JDadYW362LXLCehoxodK14LTg0+LKoM76MofLX0tXXHa7ZxyTUD4v6tacoGZntCC8f6tniAH5ohVVSpSqa0MU1aTozqZ/HVP/RmMAy26V5TpAx+sjDJjiCaqae3n4339pRZZ5NN3J1uBeeXlH0yPjI9S2G5ZxIrbHeGLExQxyV95tFJOEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/BI2SLaWpgg7urdheyTKzNXvSmBBXYo0TdV66+30u0=;
 b=qqikwI8IyeDRX5Q0iFsrijFt3/HUVoI3HaBS36Jr5S7ztVvIPtb/Rt8Tat5LhQTjnPE8vJYR8SwniBva8PddNkorQvF76gcbd39oc5lPSDhN2hROKEIXL+MPneThe/UeRIQAWgcM+KVg1rMHrd+VPYKRYHwWokIfoV1aGdBx/IztG80RjKyQjNZaQLnjK3fdrzoY6H/+otatvDjS3QTnMQDhoIaERqDXqY5dSbOwC9WpWxO5TMsgQv7lfcCXY1IgN0YGrgFgiiqTAzSO5W393m5WG3G/iHyY0ycLimI/I5J68B9Dc9uGe9eTb8kikIj5b72NYFDVJ4JozKdQgFsueQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by BY1PR11MB8007.namprd11.prod.outlook.com (2603:10b6:a03:525::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Tue, 15 Jul
 2025 21:50:28 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%7]) with mapi id 15.20.8880.021; Tue, 15 Jul 2025
 21:50:28 +0000
Date: Tue, 15 Jul 2025 14:52:12 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 5/9] drm/xe: Add dependency scheduler for GT TLB
 invalidations to bind queues
Message-ID: <aHbNjNGwbz+GRy76@lstrano-desk.jf.intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-6-matthew.brost@intel.com>
 <f70aa0a14c0a4c0e3fdc1570f42ca804705191c4.camel@intel.com>
 <aHbLpWs+xQT68C43@lstrano-desk.jf.intel.com>
 <a5faff54361576d0ba2eb30001122479f91a5756.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a5faff54361576d0ba2eb30001122479f91a5756.camel@intel.com>
X-ClientProxiedBy: BL0PR02CA0111.namprd02.prod.outlook.com
 (2603:10b6:208:35::16) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|BY1PR11MB8007:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c86b65b-a001-4c5c-5eec-08ddc3e99c9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?iw1VoZE2Z0oywFG7kGygvtVr/eB9ljIGTX+IKzNhnz9dbuNYoo6GexYL7p?=
 =?iso-8859-1?Q?9EWlCbZyuzv39zxieG+dmbnOOp8v7x2gQAzqX0jrYTIUonvJ3p/q+Fn1M1?=
 =?iso-8859-1?Q?bZJ7Hu/1TJ8aSUv1Y4n57EwQSzsxgcZW75CmWYMmxOAtMIAGHzsEiTwara?=
 =?iso-8859-1?Q?xz9nQp7Nm+kuml20LQfcYW3SNctkYyGD6VT0v3yUBzFocrZag7XejLNxwe?=
 =?iso-8859-1?Q?pfl3X1ZwJabVLp0jPYueWP6jpS3Ms9mZYUvZasF82WsVB0fqQv8K1zT3/7?=
 =?iso-8859-1?Q?9svZnWh2QRDwN7Ye64WiH2XdwwVu9i/g0cnktqyuEq0uCgTv4F2SXR2IOR?=
 =?iso-8859-1?Q?XBvuthHznJO01j/O+J0mZwrguzKooLLif0tbTLZxgoYH0awNFVSF7D/5nm?=
 =?iso-8859-1?Q?WfG2Q8OQ2NrTku84ivVnNmoWjMjc3afvukOGAueMjPJusaDW2O0cDQ1PvP?=
 =?iso-8859-1?Q?BQo1q8jRoRT5TxYpKSJOhnDIkQLEvvdkF5Adayn/mtPv4nvV07SurtrSEw?=
 =?iso-8859-1?Q?4nQBRxgPAwxfsC91xDFtHG6ap1/9a9WeX0U02lDPAHJaSXS+rUa38iAgoW?=
 =?iso-8859-1?Q?CcqY69vBH5qEpgjhewBXOML5a1ZvbDUB/FjjFwCCY7mnRB5UEvphs1TyhF?=
 =?iso-8859-1?Q?cfAd0zHG9955qxcGk8HvW/MDMYqoSggIN1FuUvZ2QFufws0e0p9mTjOpRI?=
 =?iso-8859-1?Q?0oKqABUuelOESi/b5djfJoO/zdUT00MZNsAOfPCIvcEwBlu12sIfFt3XaJ?=
 =?iso-8859-1?Q?6Rxr6TyPm+e03wbYHeO7FDOgmmz7BsyNFG38UZLeWPEUmYiVkMbUGcq2Vr?=
 =?iso-8859-1?Q?K+EXIcBITUjQ7gfvMFGIO7Nni17e3wkOJdSUmxbKor2Fk+bo8ayanw7YIU?=
 =?iso-8859-1?Q?66KkHNkKW6k0pM8zfGF0FVtc7uN9zZfngQllS9yh9DG2Tqnt/600n1qQ8l?=
 =?iso-8859-1?Q?46VHRO2idOPwek79Hxtf/vIs/BV39eDkx6hOPHCoNc63k1123i8t8waH9H?=
 =?iso-8859-1?Q?E3S/gameMVCta9KLI+Bb8wNGflA0keVjHcpuXFNWmp8OULz3s6S/2RJ9Hm?=
 =?iso-8859-1?Q?3Zd5YtiqCnVXFGrWNPE3i+T6Olq/PzdGYc+MjcuTEFIh7MAUEhcawAqO9N?=
 =?iso-8859-1?Q?Whro501c9m7x+ZP2APzcEFCh759YwK24IvsIGWu6VvQ0duOD7NTXvQrhWL?=
 =?iso-8859-1?Q?2B4Y4dVrK0JLiZNQgYXHxQq5f8QLqxMDUBCdDWE0kGAM7k026NlFNO4h9Y?=
 =?iso-8859-1?Q?0sqBkz3btcJ0iYqwXwxmrwmyajRnU5yTMKB6rRSIoRg8mUIlPCepkBei04?=
 =?iso-8859-1?Q?7TVSAi5Y/Xoh9L+gz/VdIyaDJ4xJfyk7SmKwrD9RCJYgVIzxdkEPO/z0Q0?=
 =?iso-8859-1?Q?thMUt8JzFZo7stUG91oLXZWFc9LnHB+8xu+BLPCCCNsscSiVfePdPDKtWJ?=
 =?iso-8859-1?Q?iLcqkudB2VuhEQEMPeZ9XNTn61QXs5934xl4+meNBeMzmKjU1fiUIJLu4g?=
 =?iso-8859-1?Q?Y=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?1FGZcO7KRtH7QxH23YD+e43EtJXjzt7LwTFM+TwR7tYFlZ1Yhqg4FqoYqx?=
 =?iso-8859-1?Q?SJ+F+MgS4Wkcq8Sk6QL35vz8uEWP+Da3EGPDwc12ejV71GV6uIcaeTRk9r?=
 =?iso-8859-1?Q?hHiVP+GmjRSYKCzBPjz22GMfOL/ETgfbsuF5sBLYH2KikdAplPOlBNV0cP?=
 =?iso-8859-1?Q?qoErWbih0uS7MeZwnSudSq2wJ6OM6jc6GgnKJb1Mcfvpi4+ZWjFgn3vvWv?=
 =?iso-8859-1?Q?4kdIRUpIKesQ/+lqQkLTz2b5u/AsNzwqDVy5dDpLqVsQoUZ2yGTecROt2a?=
 =?iso-8859-1?Q?nEv2hCndeGX5WCJDtO3tfj2dc9ZVATFieZKMLmR1kp0UzKBa1Nr1bv64dl?=
 =?iso-8859-1?Q?dsNjt9WiX0RZx0O7Um86ARcRnDOTn2Vxd3YPd/MO3SZNFVC6bAZd/YHJrk?=
 =?iso-8859-1?Q?9LGPpi3O0L/tYzIZOLUDwjn40B0NsmY9OL950YKe4rg+7hfZNVYL4iKcIj?=
 =?iso-8859-1?Q?EIb88CJnYFguwQtS1l5EDYENCrB6j0z1kWKK3MhhZnf+IMhX6RXYqtLDh1?=
 =?iso-8859-1?Q?Nhi7BMW56Y3uDVoG9VofE38ingtjQnar3H01Gdwg4eYYUt/WaquNbeF/ke?=
 =?iso-8859-1?Q?qwWnSv0mBYQWZYeKUUDslwmsvCILFfHe6/9/E0EkGUjpE3wMXjuXeYEs1a?=
 =?iso-8859-1?Q?XGsr7K7GOQjoaYKrK2pkVKcUKqi5Ra+hXuQriTu++AGdcBefiIxbSNpjOO?=
 =?iso-8859-1?Q?Z7KLR9ZnR8fYfkFTjTXUtLLLUGvBsFSlaZJHcDP2jXPH09vY0rZ1Kd5tE6?=
 =?iso-8859-1?Q?yxyBk2LFkt8k+Gv9g/slccXMSqQTfnjf9l17cL3jdFxr8Vhitugv6zer8t?=
 =?iso-8859-1?Q?RUshSwN1Oe4R63+oHwVeQeolVcSOF7jjBJBmT4kP3H8WxE5yaQk6WzWUQR?=
 =?iso-8859-1?Q?9h4rxggYXU/FsrDuLXM8oqsBqGoR1rPMksAwnIsdGI3bnE2VASHE9CNsHO?=
 =?iso-8859-1?Q?qXlrrECguoMdkdOuFaZfMolg4DV5r1sryUzUJMYrf7I+f/GkVzfpB4Smws?=
 =?iso-8859-1?Q?TZVVPrgSv/XCQvAeteCqnftXkM2WyEV5+LcyprY2548rA/b9RFHvP5lFnj?=
 =?iso-8859-1?Q?lVAhWha6gTWUPaONi/BwCrdWFI7kLrLe5M0XjTDc72z4p3F63kmz4EZU7C?=
 =?iso-8859-1?Q?X5HEc4j0OrxBLnipbx4XEUzABgkuWHZ4xNRopaoUkK9uOsW8508nl1U/UJ?=
 =?iso-8859-1?Q?V0pTfa+r4sFFZSlP50LRNR9oDnypNEc70s00559qbOU0s7IVEB21aZQHFm?=
 =?iso-8859-1?Q?1UwQZvjxeEKMh2DKVgWUnkgdEAWnzKRyTZARerTv7xlXlayOjYiNBMNvIa?=
 =?iso-8859-1?Q?FY4SuvFhtd/qEcV6oydrCR2+d5XN95Ng/ZJlhXVSI4t42Fww0jv1j9f/14?=
 =?iso-8859-1?Q?w/UFznTuZSQdyBP0NjVgBR2TvpAMuMgZ43WMSWv3sEkB//vlyY3ooKpjPu?=
 =?iso-8859-1?Q?EIr/ofG3WNuAJ6/JQmvv13wf/oXE+YEgvdkxbpqcFooDylP7PuiRkwGFZf?=
 =?iso-8859-1?Q?Ad3RZNQSyLMhQDjN6Aqey/FNXzjEL9rWmE08M9aUQSrui0QSlQlW4K/vUa?=
 =?iso-8859-1?Q?Y0C4Ay4a2ZvVRy9dU792Pkh03DKMueXFGAcAKHhe1kQuM5Y6ciKBzb7QmX?=
 =?iso-8859-1?Q?+V1jkgiDkLJX2lxg3g1fi8GVZWuR4gh8MZGinmjPsvFX/P+NRg+CcOqA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c86b65b-a001-4c5c-5eec-08ddc3e99c9c
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:50:28.1545 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tv9QEAag2nH9MuYzFNqEZvLHElH9CmeqLZ4SqhT5kmQ/tvQxekd9M9ExKBLp+Ilwtda6CXi7eJxvakw3K2pWjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB8007
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

On Tue, Jul 15, 2025 at 03:45:55PM -0600, Summers, Stuart wrote:
> On Tue, 2025-07-15 at 14:44 -0700, Matthew Brost wrote:
> > On Tue, Jul 15, 2025 at 03:34:29PM -0600, Summers, Stuart wrote:
> > > On Wed, 2025-07-02 at 16:42 -0700, Matthew Brost wrote:
> > > > Add a generic dependency scheduler for GT TLB invalidations, used
> > > > to
> > > > schedule jobs that issue GT TLB invalidations to bind queues.
> > > > 
> > > > v2:
> > > >  - Use shared GT TLB invalidation queue for dep scheduler
> > > >  - Break allocation of dep scheduler into its own function
> > > >  - Add define for max number tlb invalidations
> > > >  - Skip media if not present
> > > > 
> > > > Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> > > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_exec_queue.c       | 48
> > > > ++++++++++++++++++++++++
> > > >  drivers/gpu/drm/xe/xe_exec_queue_types.h | 13 +++++++
> > > >  2 files changed, 61 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > index fee22358cc09..7aaf669cf5fc 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > > > @@ -12,6 +12,7 @@
> > > >  #include <drm/drm_file.h>
> > > >  #include <uapi/drm/xe_drm.h>
> > > >  
> > > > +#include "xe_dep_scheduler.h"
> > > >  #include "xe_device.h"
> > > >  #include "xe_gt.h"
> > > >  #include "xe_hw_engine_class_sysfs.h"
> > > > @@ -39,6 +40,12 @@ static int exec_queue_user_extensions(struct
> > > > xe_device *xe, struct xe_exec_queue
> > > >  
> > > >  static void __xe_exec_queue_free(struct xe_exec_queue *q)
> > > >  {
> > > > +       int i;
> > > > +
> > > > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i)
> > > > +               if (q->tlb_inval[i].dep_scheduler)
> > > > +                       xe_dep_scheduler_fini(q-
> > > > > tlb_inval[i].dep_scheduler);
> > > > +
> > > >         if (xe_exec_queue_uses_pxp(q))
> > > >                 xe_pxp_exec_queue_remove(gt_to_xe(q->gt)->pxp,
> > > > q);
> > > >         if (q->vm)
> > > > @@ -50,6 +57,39 @@ static void __xe_exec_queue_free(struct
> > > > xe_exec_queue *q)
> > > >         kfree(q);
> > > >  }
> > > >  
> > > > +static int alloc_dep_schedulers(struct xe_device *xe, struct
> > > > xe_exec_queue *q)
> > > > +{
> > > > +       struct xe_tile *tile = gt_to_tile(q->gt);
> > > > +       int i;
> > > > +
> > > > +       for (i = 0; i < XE_EXEC_QUEUE_TLB_INVAL_COUNT; ++i) {
> > > > +               struct xe_dep_scheduler *dep_scheduler;
> > > > +               struct xe_gt *gt;
> > > > +               struct workqueue_struct *wq;
> > > > +
> > > > +               if (i == XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT)
> > > > +                       gt = tile->primary_gt;
> > > > +               else
> > > > +                       gt = tile->media_gt;
> > > > +
> > > > +               if (!gt)
> > > > +                       continue;
> > > > +
> > > > +               wq = gt->tlb_invalidation.job_wq;
> > > > +
> > > > +#define MAX_TLB_INVAL_JOBS     16      /* Picking a reasonable
> > > > value
> > > > */
> > > 
> > > So if we exceed tihs number, that means we won't get an
> > > invalidation of
> > > that range before a context switch to a new queue?

Sorry missed this.

No. This is just maximum number of TLB invalidations, on this queue,
which can be inflight to the hardware at once. If MAX_TLB_INVAL_JOBS is
exceeded, the scheduler just holds jobs until prior onces complete and
more job credits become available.

Context switching or other queues are not really related here. Think of
this a FIFO in which only MAX_TLB_INVAL_JOBS can be outstanding at time.

Matt

> > > 
> > > > +               dep_scheduler = xe_dep_scheduler_create(xe, wq,
> > > > q-
> > > > > name,
> > > > +                                                       MAX_TLB_I
> > > > NVAL
> > > > _JOBS);
> > > > +               if (IS_ERR(dep_scheduler))
> > > > +                       return PTR_ERR(dep_scheduler);
> > > > +
> > > > +               q->tlb_inval[i].dep_scheduler = dep_scheduler;
> > > > +       }
> > > > +#undef MAX_TLB_INVAL_JOBS
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  static struct xe_exec_queue *__xe_exec_queue_alloc(struct
> > > > xe_device
> > > > *xe,
> > > >                                                    struct xe_vm
> > > > *vm,
> > > >                                                    u32
> > > > logical_mask,
> > > > @@ -94,6 +134,14 @@ static struct xe_exec_queue
> > > > *__xe_exec_queue_alloc(struct xe_device *xe,
> > > >         else
> > > >                 q->sched_props.priority =
> > > > XE_EXEC_QUEUE_PRIORITY_NORMAL;
> > > 
> > > We want these to be high priority right? I.e. if another user
> > > creates a
> > > queue and submits at high priority can we get stale data on those
> > > executions if this one is blocked behind that high priority one?
> > 
> > I'm struggling with exactly what you are asking here.
> > 
> > The q->sched_props.priority is priority of exec queue being created
> > and is existing code. In the case of bind queues (i.e., ones that
> > call alloc_dep_schedulers) this maps to priority of the GuC context
> > which runs bind jobs on a hardware copy engine. 
> > 
> > dep_schedulers do not have priority, at least that is used in any
> > way.
> > This is just software queue which runs TLB invalidations once the
> > bind
> > jobs complete.
> > 
> > wrt high priority passing lower priority ones, that isn't possible if
> > there is a dependency chain. The driver holds any jobs in the KMD
> > until
> > all dependecies are resolved - high priority queues just get serviced
> > by
> > the GuC over low priority queues if both queues have runnable jobs.
> > 
> > TL;DR nothing is patch changes anything wrt to priorities.
> 
> You're right I think I read this wrong somehow :(, ignore my comment!
> 
> Still the minor question above about the max number of dependency jobs
> when you have time.
> 
> Thanks,
> Stuart
> 
> > 
> > Matt
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> > > >  
> > > > +       if (q->flags & (EXEC_QUEUE_FLAG_MIGRATE |
> > > > EXEC_QUEUE_FLAG_VM)) {
> > > > +               err = alloc_dep_schedulers(xe, q);
> > > > +               if (err) {
> > > > +                       __xe_exec_queue_free(q);
> > > > +                       return ERR_PTR(err);
> > > > +               }
> > > > +       }
> > > > +
> > > >         if (vm)
> > > >                 q->vm = xe_vm_get(vm);
> > > >  
> > > > diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > index abdf4a57e6e2..ba443a497b38 100644
> > > > --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> > > > @@ -134,6 +134,19 @@ struct xe_exec_queue {
> > > >                 struct list_head link;
> > > >         } lr;
> > > >  
> > > > +#define XE_EXEC_QUEUE_TLB_INVAL_PRIMARY_GT     0
> > > > +#define XE_EXEC_QUEUE_TLB_INVAL_MEDIA_GT       1
> > > > +#define
> > > > XE_EXEC_QUEUE_TLB_INVAL_COUNT          (XE_EXEC_QUEUE_TLB_INVAL_M
> > > > EDIA
> > > > _GT  + 1)
> > > > +
> > > > +       /** @tlb_inval: TLB invalidations exec queue state */
> > > > +       struct {
> > > > +               /**
> > > > +                * @tlb_inval.dep_scheduler: The TLB invalidation
> > > > +                * dependency scheduler
> > > > +                */
> > > > +               struct xe_dep_scheduler *dep_scheduler;
> > > > +       } tlb_inval[XE_EXEC_QUEUE_TLB_INVAL_COUNT];
> > > > +
> > > >         /** @pxp: PXP info tracking */
> > > >         struct {
> > > >                 /** @pxp.type: PXP session type used by this
> > > > queue */
> > > 
> 
