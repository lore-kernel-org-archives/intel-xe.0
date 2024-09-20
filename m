Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9862CF9C5F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 18:45:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BBB010E010;
	Fri, 20 Sep 2024 18:45:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nAiVMTKI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01D0910E010
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 18:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726857913; x=1758393913;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=+t7ef5ZbktsSId/amdBseQRKbIv7t8cYB9VVOGlihkM=;
 b=nAiVMTKIBu/PCgGXGiLekiwq6wBzCNgsrC3yTbg9oo07Y3MJy+yB+W58
 FD4LV6n3C52nC8VaYkWDEeRizH7W+239xLPvexX87EQ4PkxAasNB6Lr9+
 L68NKKTKkdorh1wni5F3M/NOUb7zMwm0UrcHd72tJqdjhKWi/qRc5bXJq
 qjnPDtDito9hAzvc/LvrM7I4oDsUlipgUWfQYOnt3/KMjl/R9bYMN4eRA
 GWW2wIR0aaZTRJnSMdiRNCeS7QHLDcNppjGRNvW5eLLNgYyhLiBRjWjVO
 SMoz4soYQge/OX2EcYyqvQcYOiE0/pD/KUSIqdQ0RZlunYiF5EqjVKzxp w==;
X-CSE-ConnectionGUID: p4GuBbVHQLCsNE28lhQt8w==
X-CSE-MsgGUID: Sp8CmUAmSCykuEZCKpRlEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="29604469"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="29604469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 11:45:11 -0700
X-CSE-ConnectionGUID: 9zI6jy+TTBKQCV7OV38GYw==
X-CSE-MsgGUID: p17lORbqRGOnHEinwTibdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; d="scan'208";a="70671538"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 11:45:11 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 11:45:10 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 11:45:10 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.101)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 11:45:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pzFTocp5H5rO5Jrwn2BfXZ7FA5LWjJI2E9RZMmI7WeHHrbVAjh5JPxXEPzRBeu1NxGIAHQPlprv7iu96uUG1O4T3I5xr0iLrD5IeGg2xhy/BUAYSPqss5oYc0T61XGCJvzMdrqtjQAdfryK6UyxaL0+IWn9KQUn34ai7yduVCO473pEeVPUfEtuOnAapSh8WeZTiELX2AuFlDrFd17DufKYAhPcIt5ycYy0Sw87ebd2kDuMLdtb24okCb4wmfYRO+u+dYCrWWnwbbHy69cfPwwvIHvacSEa3J5le2e9bN9N1cnwU+RD7mWC7ofhspKdPyJJhjiCjHFdGnLiiIJobHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LJ6BLgxkVmw+q0c+xQEmNTiEbo2dlbrFGdBzm1y59Y=;
 b=M6L7fx1sfCzKg4ZNb8HGvjKFnzA6ywtV2qpYIEpPrvSIT6+IWk7J8QsJ6H2wNTvCsgCMLu/NHcMebd5oLxx7zks0UeEPzi/gATpoPKc5NqPt2wHf1F19uMQiVMmjUVxNgc1YDd9XMjkIlqEkQo8Ka1kEqovDX21KTgiQ9A1pV5BlCaSg4zE9i2bl4gaXriz9boxzinXicguAv+1u8yYwN6FumFrL7o2f1jYG0IW8jZ2mLcI9UhAm/rYC+NnubTfD6SMXjXpkHB4BGKk84jokGQxzQzvz4C0LADj0Knwpi0lmhlxfhMHZ0PcOtbh/l1Obpz44G03d8pFM1nKpYmf2kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by IA1PR11MB6098.namprd11.prod.outlook.com (2603:10b6:208:3d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Fri, 20 Sep
 2024 18:45:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7982.022; Fri, 20 Sep 2024
 18:45:07 +0000
Date: Fri, 20 Sep 2024 18:43:22 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Zeng, Oak" <oak.zeng@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Message-ID: <Zu3CSjQyoh4BCOeg@DUT025-TGLU.fm.intel.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
 <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB3159727E185F70F6AD2C7974926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <BYAPR11MB3159727E185F70F6AD2C7974926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
X-ClientProxiedBy: BY5PR03CA0020.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::30) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|IA1PR11MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: c2ae7f15-ede9-44cf-70d9-08dcd9a45944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fEVr08W2lVwp8k/YNW2lW3aR9Tt3wwJ3gi/BcYMwUj/B+kI/gVqSVnwysEoR?=
 =?us-ascii?Q?fyP/jJ9uHJxIbULNd/JrZUwddMYZqCaGK/xxsQF2XqelwkycaN/86wOcuWUg?=
 =?us-ascii?Q?485s4CIz10yYZA3s8yPZF1jjN8Sha08aSEybcD3s2Ga+zwIlPt8nucXTSL3p?=
 =?us-ascii?Q?W08W49BGkB+gSkt+3a6YcJL6y1jtkoUrD/b08vW3L/mGDieBEG7xX72xZNUp?=
 =?us-ascii?Q?Xh8EcN1hUgg4/VMs6XEccTulgyRHxMpcnCiAXPsOeQ21F28dEEP7UljHnRQ3?=
 =?us-ascii?Q?tE2yi1hahMd/v52TyTVxi0WT/WsjvIg5LuDSrDmkPRfynhelulTeR77hG9OQ?=
 =?us-ascii?Q?UTV+omMlz6HfULaVlAnUIpmK84jZ1ixKYuHvIFyexgA0DMVK1GOjyFGn8oLE?=
 =?us-ascii?Q?oCq7Ap3xQZTPQL9U9gXbI0KNzK3zEqbP+WAVSbmhxiCUmzC17KVRvuDUD6Xu?=
 =?us-ascii?Q?tMcmNU8YowjhrD/RnYnO4n9gY2EDz1ZbwRu5Y/olqbIt23Cx3NOhlFjJWR8V?=
 =?us-ascii?Q?RBpUXSS0SKIEIc0Ijs42aq1pL/s7Lrjcu+TtlT/KeLGvB2ThvH2LzcQSB+lb?=
 =?us-ascii?Q?iqOfLbMhpzhkTy++2VUb+8sOGM2MAMyWYabeZBKYfoRezcy9i9GjzcK2jigI?=
 =?us-ascii?Q?Bk94k2cxchOnxmZntpDeyUWCHMpBDvlpvwvKDCEbRo1ma/PxlkfgYtLu4Jcq?=
 =?us-ascii?Q?k7U6Ok105aAmJH93wzUs02eU4y69IE4+zeBiwjVP1YVCLzGK9bxmcMoLr/Pi?=
 =?us-ascii?Q?HbFDQ5NR6YRsERND/NCgTLgVQ08O47CL/lofV8a3bGp4hE/vEAXj9vZA8CFB?=
 =?us-ascii?Q?nY7h173lvWFFDDNEyfVVcyDSZN7SMI6oai/orSPeWfh8woBTzIDPPVbA8qlR?=
 =?us-ascii?Q?jtwq1h7DX6D4QiuaH9sD4xheTAwYMDPwdFNAkzpQZd4jLKLnLc9i2LIb1f+6?=
 =?us-ascii?Q?tNEeFiFalTquhjJe5De7FCcj+tdQ8/eufMiv66NTj6pLrXxm8+GTDUg+5Mty?=
 =?us-ascii?Q?WqdHLvEHy5Bw/54AsMyiUpTlghW8qMnNw5uIwKsywKVx+lYqlLpkIZJQjB6W?=
 =?us-ascii?Q?zjSp0Y2wyPVQnGunp7DCB13wpGEAkDj97ooc7CDAmFXOx8E3Njwkq+eLjwFi?=
 =?us-ascii?Q?6I6/hSJSlrX2pdKe+ubM+i1glI+jxoBAKlRGUCPoIP4PvGVtRCIq1q7L5oqd?=
 =?us-ascii?Q?7C+ofdYlpkVxGmhmapw4VJ76za9WtYRaLgp6QYAfz5DVxKPuTP4lt7/PxoXx?=
 =?us-ascii?Q?1gLksotEvKAbe7UrEMi8gTGuddfeRoZ5v4xtQB2wUiDPM6lxSu9v/ns9aAz5?=
 =?us-ascii?Q?eUaV8S8b1D4hJBO6q2R0fP04?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dMr2cudeETE4BAzkNYkcJF4hdg8mk9c7pmHu2EtJkx7sJIIpsC+2PD2ow/0h?=
 =?us-ascii?Q?Ck5e6vizkkrFaEMRhyNDxTBOKvTX7eOSpQBR232lEktiQem9Fo5kTimxHU99?=
 =?us-ascii?Q?mjUAxGaYm8NzMUgz2P6IpWhbnVfqkEdAucLDQUww6U1Ef3FR5ZtOq1rAPWV9?=
 =?us-ascii?Q?jDC1E6DUiTgejQiGKqGUCzYhN5eDW1YKAWK+pR6d+6DCfFXziGwtgcIvp8kB?=
 =?us-ascii?Q?+/MUmS/36/eToufRG/stZq9LxQgJvwVQDVF+slWQNB0t6O8sDQHif/mXO8T0?=
 =?us-ascii?Q?mqJjQO8UWBakMmtay2vB5e6YVGKYcHwnOJF0L0qGGWCXedtoX5lYag6+fuix?=
 =?us-ascii?Q?9JSP3Gy886vG3MnpCmvvD3ty2tFvKnT/H4HOVWbklWzkAiBdIRUVRd6rjRjH?=
 =?us-ascii?Q?HTijk8gTmYxNKMsTnc3a6DHkg1k4hQY/0COVO8kgPelrbwFnLGP2mbU4hoWa?=
 =?us-ascii?Q?lzZVNQfK6KBr2Btymj2wNaCbXAs8PbliAN6LpVXKQAB6Krqn86ie+IKw6TGZ?=
 =?us-ascii?Q?IofUeQ64IHWh1hNbFnF65sN5cvKQPCDbqMrf++DqZDQjFuCJW7pWkMzyq7hN?=
 =?us-ascii?Q?jPEb0eZew3C2ht4wTXJw3sWB/WKuKflhIiJEsuY2I0mkyyAjfFXKEsnHJ5Bk?=
 =?us-ascii?Q?S3YpUyIEjNvSsj3jOeJck8y2qBlcABlOqnAA+qujpSln+1bDnaHBBReZz3na?=
 =?us-ascii?Q?AP6mlhWdxohG95JyrDChJdrV/Se6dUS5K0chFryFngHdKLJVl9M5vX1j9+wo?=
 =?us-ascii?Q?3mgnKXR+aAoxdO1BI5qxak10Rv26ve6yYXqVjcSOsTwXHUuMKcdYZQEHGC+1?=
 =?us-ascii?Q?Jy0RxLwIPdfNgwq7FG1TD9tlKVb6yFVWN1pW8nwf4VZDyRhGZ4RwueHPUN6q?=
 =?us-ascii?Q?Q4Tp9aI8rsf8m6iCft/xEWKCT3BvmsPrgPysq0OlDWPdKB2MKv18gk1ZNtiV?=
 =?us-ascii?Q?p8Rs1qok8G2V5U0OPEMDPBRkneQVTYkukc8thpQgYBhlBLwgTHb7FHPbCtaF?=
 =?us-ascii?Q?nD3R4OkEfe+mz2tRy/wQN2VvRu1lokBV5FIlx3bXG6dDjkcb5KbNfgQlLFDT?=
 =?us-ascii?Q?+UdFiw+tZvyF0E0GT0KCSGfXi/RuZUjf3edYeBWEuC6W+szM1vYhGCrkar4k?=
 =?us-ascii?Q?KPnxGnKPg+/XEWYy64L6wEF7cqumkSpJ49Mqne/dyBKfHpDtQ1/e9mOOeYHy?=
 =?us-ascii?Q?nWs5e6vpEtaNZYn+CTF/5U8KZ8dpo3eMAofiQ4MuR1jB4Lb8VuanVWR94svx?=
 =?us-ascii?Q?2a1te8F4eIZCHs0w4oPDTSMeyPkNy393/dal4o08wh1/gym5n4zF82L9PZhL?=
 =?us-ascii?Q?MmKdMIXLBDGzMhB6IOqmaSMgXj20YU8vZlyPROLYlXnjbhTNSF3anHJyMw2Q?=
 =?us-ascii?Q?VANvUWTYK+r8y/7u+WSqKQwVt0F1oOSCzBfI28IKa6cSk5LbAWnMs/V9cQPV?=
 =?us-ascii?Q?8QWqyxNWQ6AZYX9GtYdhNeC6KvF+HWBUaiNPB+KP1eFdd9CMjCOwBjMxeqh1?=
 =?us-ascii?Q?0xbJfw/4iCrxJttuMMFmgIct2gldRhl9eAv35KHGwhiP4gRDWiQskmk37igE?=
 =?us-ascii?Q?ryYBYCoRwaPFNL9nKvWifkRs5NrpzHkNOVwDuba2WiaSO84uj8sEBfqxEe1c?=
 =?us-ascii?Q?kA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c2ae7f15-ede9-44cf-70d9-08dcd9a45944
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2024 18:45:07.6984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /8Jy/at7s75qAxsVkX5/V8hG0p9zJpRX6nWRL09lvymzQrRj/WrQ2V8coix8bcZAFSaPcbwy8y3FMybJnvoSxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6098
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

On Fri, Sep 20, 2024 at 09:57:19AM -0600, Zeng, Oak wrote:
> 
> 
> > -----Original Message-----
> > From: Brost, Matthew <matthew.brost@intel.com>
> > Sent: Thursday, September 19, 2024 3:02 PM
> > To: Zeng, Oak <oak.zeng@intel.com>
> > Cc: intel-xe@lists.freedesktop.org
> > Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
> > 
> > On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> > > Add debugfs entry to display all the gpuva that is bound to the
> > > device. This is done by walking all the VMs created for each device
> > > process, and display va information of each VM. This is useful for
> > > gpuvm debugging. With this change, user can display gpuva info
> > > as below:
> > >
> > > root@DUT7279PVC:/home/gta# cat
> > /sys/kernel/debug/dri/0/gpuvas
> > > Process "your process name" GPU VA space
> > > DRM GPU VA space (Xe VM)
> > [0x0000000000000000;0x0200000000000000]
> > > Kernel reserved node [0x0000000000000000;0x0000000000000000]
> > >
> > >  VAs | start              | range              | end                | object             |
> > object offset
> > > -----------------------------------------------------------------------------------
> > --------------------------
> > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > >      | 0x00007ffff5db7000 | 0x0000000000001000 |
> > 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
> > >      | 0x00007ffff5db8000 | 0x00ff80000a248000 |
> > 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> > >
> > 
> > This looks useful. We may even want to extend wedged mode to
> > switch the
> > VM to a state where this is available after a hang which causes a
> > wedge
> > as this could useful. Can be done in a follow up later.
> > 
> > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_debugfs.c | 44
> > +++++++++++++++++++++++++++++++++
> > >  1 file changed, 44 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > index 1011e5d281fa..0c7bee1c2a8d 100644
> > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > @@ -9,6 +9,7 @@
> > >  #include <linux/string_helpers.h>
> > >
> > >  #include <drm/drm_debugfs.h>
> > > +#include <drm/drm_drv.h>
> > >
> > >  #include "xe_bo.h"
> > >  #include "xe_device.h"
> > > @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m, void
> > *data)
> > >  	return 0;
> > >  }
> > >
> > > +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file *m)
> > > +{
> > > +	int ret;
> > > +
> > > +	mutex_lock(&vm->snap_mutex);
> > > +	ret = drm_debugfs_gpuva_info(m, &vm->gpuvm);
> > > +	mutex_unlock(&vm->snap_mutex);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > > +static int show_each_vm(struct seq_file *m, void *arg)
> > > +{
> > > +	struct drm_info_node *node = (struct drm_info_node *)m-
> > >private;
> > > +	struct xe_device *xe = node_to_xe(node);
> > > +	struct drm_device *dev = &xe->drm;
> > > +	struct drm_file *file;
> > > +	struct xe_file *xef;
> > > +	int (*show)(struct xe_vm *, struct seq_file *) = node-
> > >info_ent->data;
> > > +	struct xe_vm *vm;
> > > +	unsigned long idx;
> > > +	int ret = 0;
> > > +
> > > +	mutex_lock(&dev->filelist_mutex);
> > > +	list_for_each_entry(file, &dev->filelist, lhead) {
> > > +		xef = (struct xe_file *)file->driver_priv;
> > > +		seq_printf(m, "Process %s GPU VA space\n", xef-
> > >process_name);
> > > +		mutex_lock(&xef->vm.lock);
> > > +		xa_for_each(&xef->vm.xa, idx, vm) {
> > 
> > Kinda a nit but I've said this in a few other places - the xef->vm.lock
> > read usage isn't right here. This look protects the xarray lookup and
> > ref to VM and nothing else. It is not designed to do anything else -
> > e.g. holding the lock then calling another function.
> 
> I don't see a problem calling a function holding xef->vm.lock. we require
> Vm to be alive while calling show_vm_gpuvas, and xef->vm.lock guarantees
> Vm is alive because it guarantee vm is on the xarray and as long as it is on
> The xarray we hold a vm ref.
> 

Your code works, it is about having well defined locks and not abusing
them.

To repeat - this lock protects the lookup and taking a ref. It is not
intended to be taken and do other things underneath it, certain not
intended to be an outer lock of sorts.

> > 
> > With that this loop should look like this.
> > 
> > mutex_lock(&xef->vm.lock);
> > xa_for_each(&xef->vm.xa, idx, vm) {
> 
> I don't think xa_for_each is safe againt removing items from xarray, 
> At least this is my understanding.
> 

It is [1]. The lock protects the ref to VM so after lookup it is not
immediately freed it does not protect the lookup itself, xa has locking
for that.

[1] https://elixir.bootlin.com/linux/v6.11/source/include/linux/xarray.h#L491

> > 	xe_vm_get(vm);
> > 	mutex_unlock(&xef->vm.lock);
> > 
> > 	/* Do something */
> > 
> > 	mutex_lock(&xef->vm.lock);
> > 	xe_vm_put(vm);
> > }
> > mutex_unlock(&xef->vm.lock);
> > 
> > This avoids unintentionally creating locking chains, in this case
> > xef->vm.lock -> snap_mutex. We should strive to only create well
> > defined
> > changes of locking. Once we start unintentionally creating locking
> > chains it hard to unwind in a driver.
> 
> Can we annotate the xef->vm.lock -> snap_mutex locking order?
> It is reasonable to me from the locking hierarchy here: xef->vm.lock
> Is at the xe file level, and snap_mutex is at vm level.  we can create
> multiple vms to one xe file, so the locking order seems natural to me.
> 
> the key point is, not be afraid of creating locking chain, instead, creating
> locking chain at reasonable order. Fortunately, the locking order in this
> case is very obvious.
> 

We could annotate it but I'd rather just avoid a chain. In general
creating chains is a bad idea and great way to have locking which can't
be understood or get inversions.

Again this works but it fairly easy to avoid creating this chain so
let's not do it.

The only place we really have chains in Xe is in memory management code
(VM and dma-resv locks) which absolutely required are very well defined.

> > 
> > Likewise I suspect we really shouldn't be holding dev->filelist_mutex
> > and doing things underneath it. Fixing that would likely require
> > converting &dev->filelist to an xarray or writing an iterator with a
> > hitch though so is a bit of a larger change. Looking at the usage of
> > this lock, I'd say this is kinda abusing this lock too and I don't think
> > anyone in the community would be all that happy about its usage
> > here.
> > I'd lean towards we need to properly fix this, or alternatively maybe
> > just maintain a per device storage of all the VMs.
> 
> Take a look at drm_client_info function. Holding filelist_mutex and doing

I don't see that function [2].

[2] https://elixir.bootlin.com/linux/v6.11/A/ident/drm_client_info`

I see drm_clients_info...

That function does take fpriv->master_lookup_lock in
drm_is_current_master but that IMO is well defined and within the DRM
layer too. We also shouldn't take a lock from different layer and make
rules of what we can with it.

I guess AMD and vmwgfx [3] take this lock in kinda similar ways but IMO
that is a bit abusive, in particular this usage [4].

[3] https://elixir.bootlin.com/linux/v6.11/A/ident/filelist_mutex
[4] https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c#L1771

> Things underneath, including hold another lock, seems fine. That codes have
> Been there for many years without a problem. It is just natural to hold

Again I think it works but that is not my point.

> Filelist_mutex to walk device's file list as this lock is designed to protect the
> File list. I don't think it is a abusing of this lock.
> 
> So I think it is reasonable to annotate a dev filelist_mutext->xef vm.lock->vm snap_mutex
> Locking order. This is the same order of creating device ->device file descriptor for device->gpuvm
> For a device file descriptor. Any reversed order locking is not reasonable thus a kernel driver
> Bug.
>

I disagree here and think it easy to have a well defined xarray + lock
of VMs attached to the device with same semantics as xef->vm.lock.

Now that I'm looking, we already have that xe_device.usm.asid*. Maybe
just repurpose that structure / lock to be non-usm specific (e.g. always
assign a VM a ASID and insert into it). Your loop here then would look
like the on described in my previous reply with taking a ref to the VM
and then dropping the lock for main part of the implementation. That
seems better.

Matt

> Oak
> 
> > 
> > Matt
> > 
> > > +			ret = show(vm, m);
> > > +			if (ret < 0)
> > > +				break;
> > > +
> > > +			seq_puts(m, "\n");
> > > +		}
> > > +		mutex_unlock(&xef->vm.lock);
> > > +	}
> > > +	mutex_unlock(&dev->filelist_mutex);
> > > +
> > > +	return ret;
> > > +}
> > > +
> > >  static const struct drm_info_list debugfs_list[] = {
> > >  	{"info", info, 0},
> > >  	{ .name = "sriov_info", .show = sriov_info, },
> > > +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm,
> > show_vm_gpuvas),
> > >  };
> > >
> > >  static int forcewake_open(struct inode *inode, struct file *file)
> > > --
> > > 2.26.3
> > >
