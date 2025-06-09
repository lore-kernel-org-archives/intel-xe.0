Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4CA2C61CE8
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 16:02:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7871710E3E8;
	Mon,  9 Jun 2025 16:02:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ASaQAHNC";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811BF10E3E8
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 16:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749484958; x=1781020958;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=ympL1HloX6opcrUdS8x7fndoPEbJGaPEd+Gbx9mQ5ns=;
 b=ASaQAHNCn587rgPmX9HLqyk7BsxyckkXqv2CbXtIzHyi+rU1cE4BuERP
 XG7ycKunY6vYf4waFNn2gsdtgE3qndk1F8nPOrEoKkXuubgUnjx6kbgZV
 L5/LEaw03bLgWAOJEKvxdFNws8SBcd0u7A0N293Nalm7EWOXTgVZBvz2q
 H2QBj6egvJZxYqROraluA76NsGEfjexP6kQryevBKA2qiabufmGkYTTj/
 Yn1H7Y5NwwobB4O8vd0o5g+sBuHrlpVb1FASP1GB+X5wH85y05tbo0mBE
 c9tgOtusjnAYZtBE81RD/wWkfbVS8ZoJ+kmufNxPrq+p2rzfhsyukQ2rx A==;
X-CSE-ConnectionGUID: Lkyc90ckSN228kZeYfPnFA==
X-CSE-MsgGUID: n91ml3rNSOSTJm4J8HpTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55373872"
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="55373872"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:02:37 -0700
X-CSE-ConnectionGUID: g35uV1W1R3CUWj2mUXLWmA==
X-CSE-MsgGUID: AIClKfK8QPemRH2yXnOpjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,222,1744095600"; d="scan'208";a="146904799"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 09:02:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 09:02:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 09:02:35 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.73)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 09:02:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VDBV9T+IJO1lsjFTGPaUcP8fDoKjtAw5QcLBxFW7EZ+H4bXvLvo5XsjmR2chpDTq9SKW4nfSWX/KiQyL0Fne0E/nRCEbW4Lq7qOJUSbNKttKkuZo/PfTzGWj/K8NSRUkZpNY0VV3RV8CUM7gOXyRVHpwuXI6kB0LDPTlavZb3vbM/e2qh9WlV9iTT+aCr4Zi+LgTHylFxvAlJwBYSE4xPwszsbhr+3hjE3bmF9m8ZZNzzmcQVDgtfNOGc/s+89+GV19jIn2S8ZeHs6HAvz2xCHJ7lILNI8n/3k50E10N71Y37ONZvB7wNZEWr7rbr5L13+tqxadqScFry8mGWrRPeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FwN6RpH9yoe+kASw9ay8bcFIT4DtNQ7tmChlAohEV74=;
 b=WmU+/3WZ41NH13McXLVa528JtuE+jtBI7K5yyjuf0X/49uoKwnSPSzoIPLQnf0vCQ1iNa4yOcpC4oPRI4DpMxN4QgsyIcgx/GWRTYLAI/0sOWasOhmQCU6nCG2uoT0k44YI5DQlaGq9+vDoDUbrmz8mhFFHP78TqPh2NUYvP/QsPu6m2udkfsM79jjKz7x78BqWGayf5tTG+nVNGgmqGcg/8p5tq0dshXVjnMDtpmnuPDbR1IgS9rQSftUNYP68ibMwmwPuouNKUAPCC/Yv2pCMD8UIHFE48nALPUTx4VOQcNCgQhUMGXBUr6PFc0gdjtyuxQnaWOzLz2SNiYd0h/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6266.namprd11.prod.outlook.com (2603:10b6:208:3e6::12)
 by CYYPR11MB8360.namprd11.prod.outlook.com (2603:10b6:930:c3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 16:01:49 +0000
Received: from IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb]) by IA1PR11MB6266.namprd11.prod.outlook.com
 ([fe80::7f3a:914e:c90e:34fb%6]) with mapi id 15.20.8813.021; Mon, 9 Jun 2025
 16:01:49 +0000
From: "Bhadane, Dnyaneshwar" <dnyaneshwar.bhadane@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Thread-Topic: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for display
 30.02
Thread-Index: AQHb1xxoiqYCa0aAGkSBVcHdt38GoLP6bx8AgAAKYKCAAHkoAIAADTCQ
Date: Mon, 9 Jun 2025 16:01:49 +0000
Message-ID: <IA1PR11MB6266D0685572E77825E28F50E26BA@IA1PR11MB6266.namprd11.prod.outlook.com>
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
 <20250606195104.1771715-10-dnyaneshwar.bhadane@intel.com>
 <aEaKuotfceheCnFJ@bvivekan-mob1>
 <IA1PR11MB6266508D28B63129F76D069DE26BA@IA1PR11MB6266.namprd11.prod.outlook.com>
 <20250609150904.GM6239@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20250609150904.GM6239@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6266:EE_|CYYPR11MB8360:EE_
x-ms-office365-filtering-correlation-id: 8dd31cd0-bf77-4bf0-c034-08dda76ef177
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?er6wZEnwWiI/d8/UNwqBlpe+3h8E5mwLnM6KIAgEvKW9gxlTPaojZ7m7i1qR?=
 =?us-ascii?Q?xYOp2EsbFbkVjmXlR+qTbT30KgY+s/ZKfJz/D7PSZkb5nFVvZCzxATWG6R23?=
 =?us-ascii?Q?WhknG49PZItKGHpDc/9kDKkUxH6B55lLrb95bdD7jJHgk6dLp/iuPJjL7HbN?=
 =?us-ascii?Q?ltPkHxyB/lYfT9UIBhP2/cTtSXTB6avRuafFCEv0/LJL/ITaSEPqIwmcthEB?=
 =?us-ascii?Q?sVuzcK1AosZ3MvlHhQG1GFYS9L1bTY9ZnNNyXNzxqYngLf82EHeRCHEjGFCp?=
 =?us-ascii?Q?MgKm0vXygZRw0cFsfzyzMVXmjGvHGfaZppRuAcZfwgRqgqc1HNTwNmiRLBIp?=
 =?us-ascii?Q?AeVpZP+AaIudm85rKBL+06y8ulZICXchHjvL7XxZBmzA0DZ8XC2nYBxGse7H?=
 =?us-ascii?Q?xPOjuD3SmuTB7GOkr5CMnlBRxA+NpmEND95uioCdFFjyI8cW08KZXq4phVKY?=
 =?us-ascii?Q?DCWe52+P5uhEqRBQ8WcReiaPrFDP69qX1TpYuV6w8BBbe0S/y+9M+kjeV0J5?=
 =?us-ascii?Q?jHTh0YHiGYZhIP8wUjYAOErBnlEV/bHBltKvAC9O7JCnfpeExZtjDENEzM/2?=
 =?us-ascii?Q?uKzeJW6yX+SivrUXBIjmhctq4OW+U/maQbL91/tYcu4Ukmvum0I0u1Y8suRR?=
 =?us-ascii?Q?G8/NXMfAupSyKi5jUVP/w7KefHLDz8o2W+hpWYNxzoMFndaNdWPZsJzlYnYf?=
 =?us-ascii?Q?EfLu2zoAoMTHvoDE9ROrhqhKgWW65/EHMvYyTXv0/z9cNhmYdC2k++Z+VxRV?=
 =?us-ascii?Q?igFLC4/atsiV5AfCQj7ii+C4U4o/Gu4wLAxIx1TPbsviej36JSbJEe8B0Bc/?=
 =?us-ascii?Q?zowqHjF9DgDe3ecBOW9Fkd6mqDN6tNVcC52ON+rtdpaCaRnaYF2oUx/lgZ/s?=
 =?us-ascii?Q?Gxn4cSzu+IMe9PlIQ9nsSYLhBqMgracS/RmRfiGgElZHy2o65MHMHjFMGUzU?=
 =?us-ascii?Q?y7lFehDub7xzVqwuaeCWcrqSS9evScY64G/sSMlWHd/qk3n8tRuNvFY23bW7?=
 =?us-ascii?Q?vhcHwKkUDywsvFdRNv5Q76tFYyg6kaxb/cbK9UPTxol63eUwExNK+6DkCNwQ?=
 =?us-ascii?Q?+bnBRyugPhBHMxHqGnwz8IuG4Yq5WOERFEcBdrrxYRJNTc+BId55bCNPke3N?=
 =?us-ascii?Q?1B1rehkZxRVz7FuAkC8oPwlfVSdaavmSy0UXXF6S+Qx8qhwotGIecp7aq6a4?=
 =?us-ascii?Q?vyS0OMtYtbIbC9rwwNcjMUKeUd/YzjpOfrr8jNbbp3qIAVdI149pIMi0uuAB?=
 =?us-ascii?Q?jWTqUsuJhCUL9q7JijgOY2hWpGnfVzWR/0c6nhbhpBpcxcHfIr0Djz5rOvdm?=
 =?us-ascii?Q?lAqX4lLf6xQ5qFBxQpdrWUYRpPA46AUevP5Nuv0qxoFBNBksNtKsf6AUknLl?=
 =?us-ascii?Q?Uf+L4Nk7oKXmCafl6Zf+vyE+2s+SgpYBTOuE+pOr+vS2kizzJNKzJ+ypZpcn?=
 =?us-ascii?Q?vlykkJqZNz7etVDGAtfygy/9esr1MgJ7EYzZT0DoohzvUJIBT90b0NmNRvmk?=
 =?us-ascii?Q?iOD7Fo/hKARE9vs=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6266.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?i2eWOqANn+VSuWDmffQepFWf7NCkdmFcTKBuMPYqw6AE0EikaiKizWe16FRv?=
 =?us-ascii?Q?jVT0iOlB903/7WcROeKjqWTTUzJELsnP7tV/rhaXVbzPv7ZH3q5EFMSey7ZT?=
 =?us-ascii?Q?hybnZacYeJ05T3U5iDzjenMcmJaPHXocINHqlZafZjqxK3P+MjCiIC+gSXPG?=
 =?us-ascii?Q?xxFxjlgBIv8NEk4ddpcLvonJGqMVu1+2JLFYAutPIOy1lpmQfxZhpbGQyd81?=
 =?us-ascii?Q?PgSxSk9ZFj8YYCtk6cBSLVD+r4fTFQD3GlSvvJ1x2o8d2nR71bniyjQ4NRSv?=
 =?us-ascii?Q?sQKeMeUPIjHTl/TiZI9JV3BVEa2ZrmguaOLMTGGuHypwEoL4L+Qiq4wnqp+E?=
 =?us-ascii?Q?pglgtlrGLtwEuHXNUiWG/nctKu3SODX6KwJJxl+pOard/FyrkfmIFj1IMDnS?=
 =?us-ascii?Q?zzojGkDkGsyeTo4fX9wrOzwBXotxX8jPQSLhMZYaGhQHFoa8VrF9rCPHch9u?=
 =?us-ascii?Q?8u0MX1SwnoYYqzkgQpT4KxEecsnNotwcYbgCokvCrWa7cfb4Zcukq39+Rovj?=
 =?us-ascii?Q?4lk6vb/629mTEVwPiPesXKA3hYOW4uosOzISAo8Ri4xTmPaNt4RnCleEzZ2/?=
 =?us-ascii?Q?fGJ9YPFdE3u1aEIw2agSwTS7TS+yTasv6XmTaNcbPHgzEsXpQKjs7siE4OOa?=
 =?us-ascii?Q?EeyWEWvvjv0cci+n1WXVYWaBHtcUvlVDtNzSbIBbRoSqczwRWu1pgCUCs9SQ?=
 =?us-ascii?Q?cmsYgZNGb0rqP3WyOmCUABvQjmrfbDvY4QpecuxNcYz5hdCiDt/UNk65XZLx?=
 =?us-ascii?Q?YYF0kFudAtJswGUaw4hnNEQ25qLQmWr5cSmbHBbFtMNst5wF6qgHpF59N/yS?=
 =?us-ascii?Q?Xna0E3t6sRpOe/wjSlLgXpYROD7038zj2d9VpBkiVD2d3ExjLPTKGcMk6xPd?=
 =?us-ascii?Q?mO8Unr8lM/SkNrIidBJHGML/7nzh/Qen7TbkD5OlIotkBZSpmyIv7YTW7psn?=
 =?us-ascii?Q?m7qFuNBZvvFz+DSiKdjsObj3woqYDCGbHyYQnK9xvdDA9yp6u+ABUKaYSJwF?=
 =?us-ascii?Q?xNviIN9wiMx2znz6MS/fIHLp/TBMN7WiI0X8tF5TROszbRHZBfkkPXOehJWb?=
 =?us-ascii?Q?FU5vAIm0ryiOVqpZy0uyx7SpfROwdXuL3oY6qf2Q6BnmqIU1bQ+L02WIQftO?=
 =?us-ascii?Q?NCtFS+bN3EH7sKDFBN0CEkYYUl8KtvPL5HhqF3VpG0+ssNMR9mrL7oXfqVWj?=
 =?us-ascii?Q?01dEtKY6xlaIUf5Oq/qkdSARSK58IiPXcwDQdgt4EJC3SFKIrNmphtul8aB1?=
 =?us-ascii?Q?sIdUJb8vBBN+CmHu1MY+QLwcYmJcKagcRahyKWSk90SmV3sZyyNUg1e1txv1?=
 =?us-ascii?Q?6HCQ5rWrXsh5lm1rYSvweUUb5OU9FZWTExDsd7b2NZ9oJZ2DSHHIbhRUeyUW?=
 =?us-ascii?Q?fw8Nk+4UzuI+zcWa4uFUNXWCcfKZkUKeZ6bsz5kD4GOtV2bB4ZDbyFAyLa+e?=
 =?us-ascii?Q?djKcdE7iR4h8vQFqdEMvIVCNdaiXICdR3ll/wqxvKdTBAcPt02ZlPCEaWDUi?=
 =?us-ascii?Q?MPpo56/BupaJah6SkZauq/bjagfjAQhxAT1oZmuSyMg5aNCKBzJrFvwPseyc?=
 =?us-ascii?Q?Tugd8ezupuAtk0KCnLU3iz5IjgSxbegdvcnX6BGu7vHRvRhB+RxWlD7N3GDb?=
 =?us-ascii?Q?9A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6266.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dd31cd0-bf77-4bf0-c034-08dda76ef177
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 16:01:49.5335 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sPNSMJvf/oI2w0nk1p2nNI8BWbGc/dulor2Qyx+yKVOS1CZzp1n8q1KNYkwYvkQHfy379yCk72JS62zRXAYbC9fGOOy4dgdEmkITryDP1C4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8360
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



> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Monday, June 9, 2025 8:39 PM
> To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>
> Cc: Vivekanandan, Balasubramani <balasubramani.vivekanandan@intel.com>;
> intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for displ=
ay
> 30.02
>=20
> On Mon, Jun 09, 2025 at 08:21:20AM +0000, Bhadane, Dnyaneshwar wrote:
> >
> >
> > > -----Original Message-----
> > > From: Vivekanandan, Balasubramani
> > > <balasubramani.vivekanandan@intel.com>
> > > Sent: Monday, June 9, 2025 12:48 PM
> > > To: Bhadane, Dnyaneshwar <dnyaneshwar.bhadane@intel.com>; intel-
> > > xe@lists.freedesktop.org
> > > Subject: Re: [PATCH 9/9] drm/i915/xe3lpd: Extend WA 16023981245 for
> > > display
> > > 30.02
> > >
> > > On 07.06.2025 01:21, Dnyaneshwar Bhadane wrote:
> > > > wa_16023981245 need to be exteded for display version 30.02
> > > >
> > > > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/i915/display/intel_atomic_plane.c | 3 ++-
> > > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > index 15ede7678636..e0336c79c294 100644
> > > > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > > @@ -1085,7 +1085,8 @@ int intel_plane_check_src_coordinates(struct
> > > intel_plane_state *plane_state)
> > > >
> > > >  		/* Wa_16023981245 */
> > > >  		if ((DISPLAY_VERx100(display) =3D=3D 2000 ||
> > > > -		     DISPLAY_VERx100(display) =3D=3D 3000) &&
> > > > +		     DISPLAY_VERx100(display) =3D=3D 3000 ||
> > > > +		     DISPLAY_VERx100(display) =3D=3D 3002) &&
> > > You can simply the check to `DISPLAY_VER(display) =3D=3D 30`
> > Hi,
> > Thanks,
> > This is good idea to merge it as `DISPLAY_VER(display) =3D=3D 30`. I wi=
ll do in next
> revision.
>=20
> We try to avoid doing that for workarounds since we don't know whether th=
at
> will be correct for other 30.xx platforms that may show up in the future.=
  The
> workaround database gives very precise IP version numbers for each
> workaround so we try to just follow that, at least early on in the platfo=
rm's
> lifecycle.  Several years down the road once we've moved on to later
> generations and we're relatively confident that no more 30.xx platforms a=
re
> likely to show up, we might go back and consolidate some of the workaroun=
d
> conditions like this.
>
Thank you, Matt,=20
Noted for platform early life cycle, No further changes required as of now =
for this condition.=20

Dnyaneshwar,

>=20
> Matt
>=20
> >
> > Dnyaneshwar
> >
> > >
> > > Regards,
> > > Bala
> > > >  		     src_x % 2 !=3D 0)
> > > >  			hsub =3D 2;
> > > >  	} else {
> > > > --
> > > > 2.34.1
> > > >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
