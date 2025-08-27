Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7341DCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 14:42:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383AA10E11C;
	Wed, 27 Aug 2025 14:42:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DdaPQ/PG";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23E10E11C
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 14:42:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756305754; x=1787841754;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=mPmNR6oozAPJnE34sNtS2SSf1mQkjl3whMOFRPdoux8=;
 b=DdaPQ/PGB2sNM4Zu1OxomwLxavB1PsPAc2D3KY0/r9H9anuz+gEe7qcb
 bNXU8YzjZh0KKtioTLAgZ8kL3kxDLTlQAmmU5AOoKfKl5oNi3cSeIFo4m
 IYUWOKhtL/UZElp4ARJclfumWL9PgkzgC1kc7WswSYkYzGyABwFoGt7EE
 Ce1fTm0qXl8Jr4KkVNOGDCbJ5tiLfgLDd15P8nveCczoknRipLVGF7bEo
 KXxQ1zJPHfENGDUmiAPaR1DrrYVIpDZP9kNUG6AE4dlHntB6I5mGpy0og
 buCTlcnY3oNP6fRL9u57Rob9xeVEyfNRIRcYFs97OSZBGXaDHANMxK5e+ A==;
X-CSE-ConnectionGUID: Cod7mYqjQTS5Ywh6Ceq0TQ==
X-CSE-MsgGUID: cJ5Wr7oGRVaW4c3ReC6Z4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11535"; a="57578093"
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="57578093"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:42:34 -0700
X-CSE-ConnectionGUID: MniVDh9eSYKEr8FJ3rCkFQ==
X-CSE-MsgGUID: Vnonq+Z5QkWs6ZQeLvF68w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,214,1751266800"; d="scan'208";a="193511451"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 07:42:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:42:33 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 07:42:33 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.72)
 by edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 07:42:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgZqx2MTlOtm05tYYU48kbIJoiyGUNKFZ2Krjjv53dlupuShja8Kh/qMhekjM8DYq+TmiqMSDq7+KhGFp9u04Qh0kk/8mk0WQmtWJeN33+RIZy4L/tGXiWoTdSfaLjcpOQol94e8OiacxxWnJTlXSTmr2dIlN9LfXutq4RzD38ylC+sKv95+ylkjBFGEWowViHFzrXMn/CuR1+4OW2ebhawlXGp1fPTsyQf34h7SPj09g7DBuFfIKnYG3FF3NIQ9xsAtgpG4MQMj0ZT6nD+up35YHc7d2e28Kgy83oflBkpwAWE9J/4936yKunawb5GjFooqvcmdw+Qx82dGQL5lSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wy1LfNGUV5d2y//7Fio9Fr840bJUmgcWmQiUAYP4UFc=;
 b=tYqhkgn0eTKjzdvLfox1kRsH69Lc9vaLzuRYyyfXyNuc6is625vsT96kSreUdBdlTwleBbmmAfBmOumvmBB8qi7h0UAMaiKN6Eq+87tU93II371P4jtcHaTrFk9PLOORipawlE9esS/J9KfS9eRi/tgt0oDS/+gDdgYRzHaR9eO/EIbsC8sW0lpNOXuVy939NHvCktQu5pAl9lMJhoejz7cFZZ70AHBiCAB4ZA11JU4qyF8kyVkkWbyvV0t4b8J1DanNz1EhjHL8bKnieUBfCNt1+z1S0d+ylNlaQ0WIz+Yu89UvM8Y+8Ol/qjaHPIL8iZU1Xi0+EUHqmeye8evXSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA1PR11MB7920.namprd11.prod.outlook.com (2603:10b6:208:3fc::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 14:42:30 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9052.017; Wed, 27 Aug 2025
 14:42:30 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta, 
 saurabhg" <saurabhg.gupta@intel.com>, "Zuo, Alex" <alex.zuo@intel.com>,
 "Harrison, John C" <john.c.harrison@intel.com>, "Cavitt, Jonathan"
 <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v3 1/3] error_injection: Add error_injectable define
Thread-Topic: [PATCH v3 1/3] error_injection: Add error_injectable define
Thread-Index: AQHcFswhslDNf4cGm0a5Xl2OwYeD/7R13HEAgACz+bA=
Date: Wed, 27 Aug 2025 14:42:30 +0000
Message-ID: <CH0PR11MB54443ADC94FB9FA5C86FB4D8E538A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250826205758.235606-5-jonathan.cavitt@intel.com>
 <20250826205758.235606-6-jonathan.cavitt@intel.com>
 <aK5/VEoEamJzjtn6@lstrano-desk.jf.intel.com>
In-Reply-To: <aK5/VEoEamJzjtn6@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA1PR11MB7920:EE_
x-ms-office365-filtering-correlation-id: fb360aad-bb4d-41bf-a820-08dde577f378
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?is6USOw452AqekTK0SIBeY1OVH7wtMYP0LK2bDOm3RbTKfZjvo8hrRRB3gtK?=
 =?us-ascii?Q?0E46hHrkJIJi1IxHiKxcyy3/0RtCP+QS9xgzgJuwVpui3+IPrSlwutuxg81C?=
 =?us-ascii?Q?eZ1VkG3GHR53AUNQutU2jNOCh/FDhpqySzqHOVuLtgmHZSxcU1cn9Drq/ja3?=
 =?us-ascii?Q?maSNUpD3//QZukcGnk1CiH/GYuEM+lDvVOwl+GRBIlNdv3OLWJ66SN8ihxth?=
 =?us-ascii?Q?pFLR3C/e/y2Vhu3wU7jPiOj+Cet1LqOz+Oo8Yl8n77JU2Ruu/nXqJ/owHfJL?=
 =?us-ascii?Q?Whkbv0bmAWZFHWAcIL5+YwhUdT91LSnIZOL02vfwzf0queOyUGLZfCwLBCbb?=
 =?us-ascii?Q?qa30Nvq6O5IG8WtglqAXNA/rN0qJyZ8WhuUm9jYZzspy+28XyiqLSWJ6sGpD?=
 =?us-ascii?Q?6YD2IFtwZ+0u2i5gLbQoy2DEPTOD8/4bx+acdpoonPFbpZ3KH5/btwqms16r?=
 =?us-ascii?Q?XXfIPxTYVxkb18mRFS8DB9RDCLnDMowtBayJzLriZU/eucu1dNQ0sRd+Ed8s?=
 =?us-ascii?Q?UKS7D883/FjEGJmH7HILmpE5VigpCqXCCbJuO0Y3DvTt6o5/4gIdRkjbeIEI?=
 =?us-ascii?Q?aHpr0kIgu7u21oiPJKv0OzgPA3HVPIEliIv1bnjcx0jYBtVmKxHZNwc0ovnD?=
 =?us-ascii?Q?5emqMubhVXpPkIRGGR4qCMwwluu6RmVS05upwyiWbAW0IptQi6Qm3X8H5BKT?=
 =?us-ascii?Q?xRmD53nAhp2Tit5AAAxjoJYFlKLsLIJSYp88jnkP1/cMe2WvD7HROMxX23mZ?=
 =?us-ascii?Q?SR20Mac7fk87djn1fWpieeafTAqHE942BdYbNE38XQJh5uoKznscVCjALCDg?=
 =?us-ascii?Q?srDJItcUpwhAel3XCJzDsljsSVATArPT0MnIkurFqVPh4BwbhTaTF8sdFxdW?=
 =?us-ascii?Q?rMgfVnpZgwE2kke0EDyI/zycIwP+1jTfo//yBh2M9xGX/fW/2iR9uf401/cJ?=
 =?us-ascii?Q?ngpvJo10lPfyAU68C4Ni+Yi50RXVcVsg73Dkv9RmmVRsE7HcEhYpqARjPZAA?=
 =?us-ascii?Q?m9Kf2AIS2WwGjCOo1Aj37NOS5C8Vat3mxLIw+tgOs1uIdeAKBh+Wt7QWz3ga?=
 =?us-ascii?Q?ZHY6qj1uSmPtSLzfUH9td0tFhFGRWCzJDVdG8Hn0xYKh8Yta88N17yVayeBt?=
 =?us-ascii?Q?igW/jbhU6VthN+/G/u2ab3wZ+iUv8ONkeZ8OoPNdckUQgNlsDpdAlLqUT8nj?=
 =?us-ascii?Q?o3GAz8QqgQTzMTnP7TDyh8ueIijhD2mfj0emZTgsd09fdK3yxq99a1V1z/Wd?=
 =?us-ascii?Q?l6SiDnTokAP4eLTlMk77fUtdtIFvlLQE8i+r2lnbEBL3CBLg6VgcK1m9DI4r?=
 =?us-ascii?Q?rrpesWZ4j1jTv8azPDiadobHARZxsXykWh7NKnb97nYp5uss192Dm9FYRMgG?=
 =?us-ascii?Q?HuLwbQfNhEqdIQW4ksIVDWvz4Ny3u7+NY8mxpE/Tn1yKljEs0lj2g8AEQr6x?=
 =?us-ascii?Q?dVGZU7lJpEq4fdmiYEp7APatn9dwi5Lps3SjoWhzxIdTvetskpKszfhrXMw4?=
 =?us-ascii?Q?uem4uNxSYAobf8I=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Dxzo843h0PcJMDK24xSWRoFbSZRC96YnIfAzPpXOEE58NcXfKGERqknj+ZjY?=
 =?us-ascii?Q?EtdtQN2nvw4k2P8vn96Hw/jqNGhq8fsXKmMfuu2XTq+kbp2Plj6VGyB5AiS9?=
 =?us-ascii?Q?DOa412QKmJOSUrqbHvYshp/XiCKJcqdgV2uFAUdJjLiXXvIc8Gdo5AzULyT0?=
 =?us-ascii?Q?UWPQPc8UIzCvo1GjeSyPbSUujD8UVeHm6TQuS73MbhMDI/VswXjmUFNW5SeM?=
 =?us-ascii?Q?9M5QDNcHaEWW7hMdz1ppJ/555bg2EDIJuTssrfAyi45o6RxQRS82T0B0ojPU?=
 =?us-ascii?Q?cNgnKg8h6MrdK+f7PuZbN1ZUjwg0iK9Rg+h2pX6Pg/5KL9aDJ94tX3XyWFNA?=
 =?us-ascii?Q?y+Pr80YQlf9+283OWsGKqnR2AbfgG8an0rq+6cNBRX6WU9TWAWGp/FeA++qc?=
 =?us-ascii?Q?R78NfV3FVpmdU5Yet2cqtGnSW5tUHxokioAiJLtZkHV94UdWgwVdM8C8+uMa?=
 =?us-ascii?Q?YGCiUp7NS/hr7bw9T/ZTNM76k9/7BlhxaBoVtGxPtc5x/cy3l5QZnfB6e+4v?=
 =?us-ascii?Q?RD5ka849nchHfgw1WUEiE3tw+4Fm785Ad0zfzZN8JqqOqdSzBF9KQLr0BTTT?=
 =?us-ascii?Q?I18gR6ZLe7aYzcY7Me7PbrmGi6N5mhUIopp0jEIgn12cO6KbNh3u9a9TtJYB?=
 =?us-ascii?Q?CLFte2r4tjqMsAkpWwkS+1e7u3X56DtCUXNTQzsJeadMEWdgOOSQpUpA91oo?=
 =?us-ascii?Q?clD5weiTNfzfzMfVYZMH4jHPeVDsmBeGfD1lMB8U/BZrokSkM5wt8QDuLeuw?=
 =?us-ascii?Q?A8po9zOfH8iNngqrj3+zj4crhwX76D9HZclWnbzSlfk7Go5yS3nW95ceo6uk?=
 =?us-ascii?Q?ZrOgEAYMG34OViqmI8GDRtodFBiBFVKTjF/fMKYhDJCW3WmkMr2IxjaJ57Aa?=
 =?us-ascii?Q?6qeAGm4IoTTjQy+VnzrChTNCP52a9xvzcAZJBXIKTnRqMd/H38lXsz25YAaa?=
 =?us-ascii?Q?dthyunOA9sBQP5X5oWjD+icm4nGEm0SzSbTkBo8mOxj1tgCX2N8e7ieXv+/0?=
 =?us-ascii?Q?k9yktaWajSQ4VvltmyYxmAbhItgK+5ekyiqA2JfhiwWQ5KP5VAselWRzbNoI?=
 =?us-ascii?Q?0b1Bhkee4bskLX6aMK4Schp0ept05VHsZb9McGLF5wapxdZgbZg339+pquWH?=
 =?us-ascii?Q?LpOnCVvcfed8Gm4kBqllcfaXmGTFbqZkUBkEXeImWDNO1fVJxKz1R+UL4MYQ?=
 =?us-ascii?Q?Pr/wS3C1ppE5Kk0RdHbHDDXieNrjhwmUnuSyn/GgfDVqN7oAE27KoXEK3CrN?=
 =?us-ascii?Q?euswqRP773jDtDb4zpIV0u411oWGnY+eBEQKZ2BHReiJDaLLZPXFAMT6xQOF?=
 =?us-ascii?Q?3lezVl1MsJaG7aqyBsaDL6skTLcsgY0Xfu7y3Yz54gGZcgacZDP/qdz4CVpo?=
 =?us-ascii?Q?5nhsSzKB1oyB0Eme13+sH/DVD61c9ssrhjPlg0GR9925gHoGhXW5lJfjTZNi?=
 =?us-ascii?Q?4+XiY7QEiGupmXEwWpRQ64HTvJRjhR0xJAWlviUhRZdxsypD/qWNuLGkdVXO?=
 =?us-ascii?Q?uTz4v53ShxpYDQL07bl4dtqRDf8SrKjHAOUBKzFGJ+2Jq+capDQmVmVkx9ar?=
 =?us-ascii?Q?mAuYeWNycUCYM2IItdeaAOBYHubs3PLoZrSqf98a?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb360aad-bb4d-41bf-a820-08dde577f378
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Aug 2025 14:42:30.4827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bGOqM0poeosTfAN3w1U3aFvZZmRNLX9VhGs4SxGB6BNGLDE4yRuVXqTpzouudqkKysPT7FglmqrGdliDRi2HWqC9Wap/Rqf2yyK6M9aTydo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7920
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

-----Original Message-----
From: Brost, Matthew <matthew.brost@intel.com>=20
Sent: Tuesday, August 26, 2025 8:45 PM
To: Cavitt, Jonathan <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org; Gupta, saurabhg <saurabhg.gupta@intel.c=
om>; Zuo, Alex <alex.zuo@intel.com>; Harrison, John C <john.c.harrison@inte=
l.com>
Subject: Re: [PATCH v3 1/3] error_injection: Add error_injectable define
>=20
> On Tue, Aug 26, 2025 at 08:58:00PM +0000, Jonathan Cavitt wrote:
> > Add a declaration for the function attribute "error_injectable", which
> > appends noinline to functions tagged with ALLOW_ERROR_INJECTION only if
> > CONFIG_FUNCTION_ERROR_INJECTION is enabled.  This function attribute wa=
s
> > added to include/asm-generic/error-injection.h, and has been applied to
> > all Xe functions with ALLOW_ERROR_INJECTION enabled.
> >=20
> > Suggested-by: Matthew Brost <matthew.brost@intel.com>
> > Suggested-by: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c                |  8 ++++----
> >  drivers/gpu/drm/xe/xe_exec_queue.c            | 14 +++++++-------
> >  drivers/gpu/drm/xe/xe_ggtt.c                  |  2 +-
> >  drivers/gpu/drm/xe/xe_guc.c                   |  4 ++--
> >  drivers/gpu/drm/xe/xe_guc_ads.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_ct.c                | 14 +++++---------
> >  drivers/gpu/drm/xe/xe_guc_log.c               |  2 +-
> >  drivers/gpu/drm/xe/xe_guc_relay.c             |  2 +-
> >  drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c |  4 ++--
> >  drivers/gpu/drm/xe/xe_hw_engine_group.c       |  2 +-
> >  drivers/gpu/drm/xe/xe_mmio.c                  |  2 +-
> >  drivers/gpu/drm/xe/xe_oa.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_pcode.c                 |  2 +-
> >  drivers/gpu/drm/xe/xe_pm.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_pt.c                    |  8 ++++----
> >  drivers/gpu/drm/xe/xe_sriov.c                 |  2 +-
> >  drivers/gpu/drm/xe/xe_sync.c                  |  8 ++++----
> >  drivers/gpu/drm/xe/xe_tile.c                  |  2 +-
> >  drivers/gpu/drm/xe/xe_tuning.c                |  2 +-
> >  drivers/gpu/drm/xe/xe_uc_fw.c                 |  2 +-
> >  drivers/gpu/drm/xe/xe_vm.c                    | 14 +++++++-------
> >  drivers/gpu/drm/xe/xe_wa.c                    |  2 +-
> >  drivers/gpu/drm/xe/xe_wopcm.c                 |  2 +-
> >  include/asm-generic/error-injection.h         |  2 ++
> >  24 files changed, 52 insertions(+), 54 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index 9e4773a17ef8..30c1e4c1d487 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -417,8 +417,8 @@ static void xe_device_destroy(struct drm_device *de=
v, void *dummy)
> >  	ttm_device_fini(&xe->ttm);
> >  }
> > =20
> > -struct xe_device *xe_device_create(struct pci_dev *pdev,
> > -				   const struct pci_device_id *ent)
> > +error_injectable struct xe_device *xe_device_create(struct pci_dev *pd=
ev,
> > +						    const struct pci_device_id *ent)
> >  {
> >  	struct xe_device *xe;
> >  	int err;
> > @@ -634,7 +634,7 @@ static bool verify_lmem_ready(struct xe_device *xe)
> >  	return !!val;
> >  }
> > =20
> > -static int wait_for_lmem_ready(struct xe_device *xe)
> > +static error_injectable int wait_for_lmem_ready(struct xe_device *xe)
> >  {
> >  	unsigned long timeout, start;
> > =20
> > @@ -719,7 +719,7 @@ static int xe_device_vram_alloc(struct xe_device *x=
e)
> >   *
> >   * Return: 0 on success, error code on failure
> >   */
> > -int xe_device_probe_early(struct xe_device *xe)
> > +error_injectable int xe_device_probe_early(struct xe_device *xe)
> >  {
> >  	int err;
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe=
_exec_queue.c
> > index 2d10a53f701d..c8162ed3db52 100644
> > --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> > +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> > @@ -199,10 +199,10 @@ static int __xe_exec_queue_init(struct xe_exec_qu=
eue *q)
> >  	return err;
> >  }
> > =20
> > -struct xe_exec_queue *xe_exec_queue_create(struct xe_device *xe, struc=
t xe_vm *vm,
> > -					   u32 logical_mask, u16 width,
> > -					   struct xe_hw_engine *hwe, u32 flags,
> > -					   u64 extensions)
> > +error_injectable struct xe_exec_queue *xe_exec_queue_create(struct xe_=
device *xe, struct xe_vm *vm,
> > +							    u32 logical_mask, u16 width,
> > +							    struct xe_hw_engine *hwe, u32 flags,
> > +							    u64 extensions)
>=20
> Try to keep everything 80 lines or less if possible. Checkpatch allows 10=
0 but
> typically we keep everything under 80 lines.
>=20
> With that, I'd write all of changes line this...
>=20
> original code:
>=20
> ... foo(...)
> {
> 	...
> }
>=20
> Updated code:
>=20
> error_injectable
> ... foo(...)
> {
> 	...
> }
>=20
> That will also reduce the diff size and keep original authors of function=
s in
> the git blame.

I'll do this, but I will point out that this is stylistically unprecedented=
 with respect to the rest
of the code and, in my opinion, doesn't look quite right.

>=20
> >  {
> >  	struct xe_exec_queue *q;
> >  	int err;
> > @@ -282,9 +282,9 @@ struct xe_exec_queue *xe_exec_queue_create_class(st=
ruct xe_device *xe, struct xe
> >   *
> >   * Returns exec queue on success, ERR_PTR on failure
> >   */
> > -struct xe_exec_queue *xe_exec_queue_create_bind(struct xe_device *xe,
> > -						struct xe_tile *tile,
> > -						u32 flags, u64 extensions)
> > +error_injectable struct xe_exec_queue *xe_exec_queue_create_bind(struc=
t xe_device *xe,
> > +								 struct xe_tile *tile,
> > +								 u32 flags, u64 extensions)
> >  {
> >  	struct xe_gt *gt =3D tile->primary_gt;
> >  	struct xe_exec_queue *q;
> > diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.=
c
> > index e03222f5ac5a..683457ad9e66 100644
> > --- a/drivers/gpu/drm/xe/xe_ggtt.c
> > +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> > @@ -256,7 +256,7 @@ static void dev_fini_ggtt(void *arg)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> > +error_injectable int xe_ggtt_init_early(struct xe_ggtt *ggtt)
> >  {
> >  	struct xe_device *xe =3D tile_to_xe(ggtt->tile);
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> > index 37d06c51180c..d873ddfec16e 100644
> > --- a/drivers/gpu/drm/xe/xe_guc.c
> > +++ b/drivers/gpu/drm/xe/xe_guc.c
> > @@ -1405,8 +1405,8 @@ int xe_guc_auth_huc(struct xe_guc *guc, u32 rsa_a=
ddr)
> >  	return xe_guc_ct_send_block(&guc->ct, action, ARRAY_SIZE(action));
> >  }
> > =20
> > -int xe_guc_mmio_send_recv(struct xe_guc *guc, const u32 *request,
> > -			  u32 len, u32 *response_buf)
> > +error_injectable int xe_guc_mmio_send_recv(struct xe_guc *guc, const u=
32 *request,
> > +					   u32 len, u32 *response_buf)
> >  {
> >  	struct xe_device *xe =3D guc_to_xe(guc);
> >  	struct xe_gt *gt =3D guc_to_gt(guc);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_gu=
c_ads.c
> > index 5631722f34f5..524b6e89f1c0 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ads.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
> > @@ -386,7 +386,7 @@ static int calculate_waklv_size(struct xe_guc_ads *=
ads)
> > =20
> >  #define MAX_GOLDEN_LRC_SIZE	(SZ_4K * 64)
> > =20
> > -int xe_guc_ads_init(struct xe_guc_ads *ads)
> > +error_injectable int xe_guc_ads_init(struct xe_guc_ads *ads)
> >  {
> >  	struct xe_device *xe =3D ads_to_xe(ads);
> >  	struct xe_gt *gt =3D ads_to_gt(ads);
> > diff --git a/drivers/gpu/drm/xe/xe_guc_ct.c b/drivers/gpu/drm/xe/xe_guc=
_ct.c
> > index 3f4e6a46ff16..fef48b08baff 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_ct.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_ct.c
> > @@ -213,7 +213,7 @@ static void primelockdep(struct xe_guc_ct *ct)
> >  	fs_reclaim_release(GFP_KERNEL);
> >  }
> > =20
> > -int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> > +error_injectable int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe =3D ct_to_xe(ct);
> >  	struct xe_gt *gt =3D ct_to_gt(ct);
> > @@ -252,7 +252,7 @@ int xe_guc_ct_init_noalloc(struct xe_guc_ct *ct)
> >  }
> >  ALLOW_ERROR_INJECTION(xe_guc_ct_init_noalloc, ERRNO); /* See xe_pci_pr=
obe() */
> > =20
> > -int xe_guc_ct_init(struct xe_guc_ct *ct)
> > +error_injectable int xe_guc_ct_init(struct xe_guc_ct *ct)
> >  {
> >  	struct xe_device *xe =3D ct_to_xe(ct);
> >  	struct xe_gt *gt =3D ct_to_gt(ct);
> > @@ -1149,8 +1149,8 @@ static int guc_ct_send_recv(struct xe_guc_ct *ct,=
 const u32 *action, u32 len,
> >   *         DATA0 from `HXG Response`_ if &response_buffer was NULL, or
> >   *         a negative error code on failure.
> >   */
> > -int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u32 *action, u32 l=
en,
> > -			u32 *response_buffer)
> > +error_injectable int xe_guc_ct_send_recv(struct xe_guc_ct *ct, const u=
32 *action, u32 len,
> > +					 u32 *response_buffer)
> >  {
> >  	KUNIT_STATIC_STUB_REDIRECT(xe_guc_ct_send_recv, ct, action, len, resp=
onse_buffer);
> >  	return guc_ct_send_recv(ct, action, len, response_buffer, false);
> > @@ -2069,7 +2069,6 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struct=
 drm_printer *p, bool want_ctb)
> > =20
> >  #if IS_ENABLED(CONFIG_DRM_XE_DEBUG)
> > =20
> > -#ifdef CONFIG_FUNCTION_ERROR_INJECTION
> >  /*
> >   * This is a helper function which assists the driver in identifying i=
f a fault
> >   * injection test is currently active, allowing it to reduce unnecessa=
ry debug
> > @@ -2080,11 +2079,8 @@ void xe_guc_ct_print(struct xe_guc_ct *ct, struc=
t drm_printer *p, bool want_ctb)
> >   * attribute is applied. Compiler optimizes the static function define=
d in the
> >   * header file as an inline function.
> >   */
> > -noinline int xe_is_injection_active(void) { return 0; }
> > +error_injectable int xe_is_injection_active(void) { return 0; }
> >  ALLOW_ERROR_INJECTION(xe_is_injection_active, ERRNO);
> > -#else
> > -int xe_is_injection_active(void) { return 0; }
> > -#endif
> > =20
> >  static void ct_dead_capture(struct xe_guc_ct *ct, struct guc_ctb *ctb,=
 u32 reason_code)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/xe_gu=
c_log.c
> > index c01ccb35dc75..fd1f24cae4d2 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_log.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_log.c
> > @@ -251,7 +251,7 @@ void xe_guc_log_print(struct xe_guc_log *log, struc=
t drm_printer *p)
> >  	xe_guc_log_snapshot_free(snapshot);
> >  }
> > =20
> > -int xe_guc_log_init(struct xe_guc_log *log)
> > +error_injectable int xe_guc_log_init(struct xe_guc_log *log)
> >  {
> >  	struct xe_device *xe =3D log_to_xe(log);
> >  	struct xe_tile *tile =3D gt_to_tile(log_to_gt(log));
> > diff --git a/drivers/gpu/drm/xe/xe_guc_relay.c b/drivers/gpu/drm/xe/xe_=
guc_relay.c
> > index e5dc94f3e618..4e33a6d8c9ca 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_relay.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_relay.c
> > @@ -330,7 +330,7 @@ static void __fini_relay(struct drm_device *drm, vo=
id *arg)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_guc_relay_init(struct xe_guc_relay *relay)
> > +error_injectable int xe_guc_relay_init(struct xe_guc_relay *relay)
> >  {
> >  	const int XE_RELAY_MEMPOOL_MIN_NUM =3D 1;
> >  	struct xe_device *xe =3D relay_to_xe(relay);
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c b/drivers/gp=
u/drm/xe/xe_hw_engine_class_sysfs.c
> > index 640950172088..3d0ed0909ecd 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_class_sysfs.c
> > @@ -580,8 +580,8 @@ static void hw_engine_class_defaults_fini(void *arg=
)
> >  	kobject_put(kobj);
> >  }
> > =20
> > -static int xe_add_hw_engine_class_defaults(struct xe_device *xe,
> > -					   struct kobject *parent)
> > +static error_injectable int xe_add_hw_engine_class_defaults(struct xe_=
device *xe,
> > +							    struct kobject *parent)
> >  {
> >  	struct kobject *kobj;
> >  	int err =3D 0;
> > diff --git a/drivers/gpu/drm/xe/xe_hw_engine_group.c b/drivers/gpu/drm/=
xe/xe_hw_engine_group.c
> > index 58bee3ffe881..d794f512da0f 100644
> > --- a/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > +++ b/drivers/gpu/drm/xe/xe_hw_engine_group.c
> > @@ -119,7 +119,7 @@ int xe_hw_engine_setup_groups(struct xe_gt *gt)
> >   * Return: 0 on success,
> >   *	    -EINTR if the lock could not be acquired
> >   */
> > -int xe_hw_engine_group_add_exec_queue(struct xe_hw_engine_group *group=
, struct xe_exec_queue *q)
> > +error_injectable int xe_hw_engine_group_add_exec_queue(struct xe_hw_en=
gine_group *group, struct xe_exec_queue *q)
> >  {
> >  	int err;
> >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> > diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.=
c
> > index ef6f3ea573a2..7c13d7eff6d9 100644
> > --- a/drivers/gpu/drm/xe/xe_mmio.c
> > +++ b/drivers/gpu/drm/xe/xe_mmio.c
> > @@ -90,7 +90,7 @@ static void mmio_fini(void *arg)
> >  	root_tile->mmio.regs =3D NULL;
> >  }
> > =20
> > -int xe_mmio_probe_early(struct xe_device *xe)
> > +error_injectable int xe_mmio_probe_early(struct xe_device *xe)
> >  {
> >  	struct xe_tile *root_tile =3D xe_device_get_root_tile(xe);
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev);
> > diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> > index a188bad172ad..31d6fedf0791 100644
> > --- a/drivers/gpu/drm/xe/xe_oa.c
> > +++ b/drivers/gpu/drm/xe/xe_oa.c
> > @@ -2225,7 +2225,7 @@ static bool xe_oa_is_valid_config_reg_addr(struct=
 xe_oa *oa, u32 addr)
> >  		xe_oa_is_valid_mux_addr(oa, addr);
> >  }
> > =20
> > -static struct xe_oa_reg *
> > +static error_injectable struct xe_oa_reg *
> >  xe_oa_alloc_regs(struct xe_oa *oa, bool (*is_valid)(struct xe_oa *oa, =
u32 addr),
> >  		 u32 __user *regs, u32 n_regs)
> >  {
> > diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcod=
e.c
> > index 6a7ddb9005f9..175d4216de12 100644
> > --- a/drivers/gpu/drm/xe/xe_pcode.c
> > +++ b/drivers/gpu/drm/xe/xe_pcode.c
> > @@ -331,7 +331,7 @@ void xe_pcode_init(struct xe_tile *tile)
> >   *
> >   * Returns 0 on success, error code otherwise
> >   */
> > -int xe_pcode_probe_early(struct xe_device *xe)
> > +error_injectable int xe_pcode_probe_early(struct xe_device *xe)
> >  {
> >  	return xe_pcode_ready(xe, false);
> >  }
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index 51934d5dc44f..58996110d2ec 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -270,7 +270,7 @@ static void xe_pm_runtime_init(struct xe_device *xe=
)
> >  	pm_runtime_put(dev);
> >  }
> > =20
> > -int xe_pm_init_early(struct xe_device *xe)
> > +error_injectable int xe_pm_init_early(struct xe_device *xe)
> >  {
> >  	int err;
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index c0a70c80dff9..f1313d50f297 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -98,8 +98,8 @@ static void xe_pt_free(struct xe_pt *pt)
> >   * Return: A valid struct xe_pt pointer on success, Pointer error code=
 on
> >   * error.
> >   */
> > -struct xe_pt *xe_pt_create(struct xe_vm *vm, struct xe_tile *tile,
> > -			   unsigned int level)
> > +error_injectable struct xe_pt *xe_pt_create(struct xe_vm *vm, struct x=
e_tile *tile,
> > +					    unsigned int level)
> >  {
> >  	struct xe_pt *pt;
> >  	struct xe_bo *bo;
> > @@ -2132,7 +2132,7 @@ xe_pt_update_ops_init(struct xe_vm_pgtable_update=
_ops *pt_update_ops)
> >   *
> >   * Return: 0 on success, negative error code on error.
> >   */
> > -int xe_pt_update_ops_prepare(struct xe_tile *tile, struct xe_vma_ops *=
vops)
> > +error_injectable int xe_pt_update_ops_prepare(struct xe_tile *tile, st=
ruct xe_vma_ops *vops)
> >  {
> >  	struct xe_vm_pgtable_update_ops *pt_update_ops =3D
> >  		&vops->pt_update_ops[tile->id];
> > @@ -2364,7 +2364,7 @@ static const struct xe_migrate_pt_update_ops svm_=
migrate_ops;
> >   *
> >   * Return: fence on success, negative ERR_PTR on error.
> >   */
> > -struct dma_fence *
> > +error_injectable struct dma_fence *
> >  xe_pt_update_ops_run(struct xe_tile *tile, struct xe_vma_ops *vops)
> >  {
> >  	struct xe_vm *vm =3D vops->vm;
> > diff --git a/drivers/gpu/drm/xe/xe_sriov.c b/drivers/gpu/drm/xe/xe_srio=
v.c
> > index 87911fb4eea7..46fd51d3ec60 100644
> > --- a/drivers/gpu/drm/xe/xe_sriov.c
> > +++ b/drivers/gpu/drm/xe/xe_sriov.c
> > @@ -104,7 +104,7 @@ static void fini_sriov(struct drm_device *drm, void=
 *arg)
> >   *
> >   * Return: 0 on success or a negative error code on failure.
> >   */
> > -int xe_sriov_init(struct xe_device *xe)
> > +error_injectable int xe_sriov_init(struct xe_device *xe)
> >  {
> >  	if (!IS_SRIOV(xe))
> >  		return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_sync.c b/drivers/gpu/drm/xe/xe_sync.=
c
> > index 82872a51f098..c0eebd7bf774 100644
> > --- a/drivers/gpu/drm/xe/xe_sync.c
> > +++ b/drivers/gpu/drm/xe/xe_sync.c
> > @@ -110,10 +110,10 @@ static void user_fence_cb(struct dma_fence *fence=
, struct dma_fence_cb *cb)
> >  	kick_ufence(ufence, fence);
> >  }
> > =20
> > -int xe_sync_entry_parse(struct xe_device *xe, struct xe_file *xef,
> > -			struct xe_sync_entry *sync,
> > -			struct drm_xe_sync __user *sync_user,
> > -			unsigned int flags)
> > +error_injectable int xe_sync_entry_parse(struct xe_device *xe, struct =
xe_file *xef,
> > +					 struct xe_sync_entry *sync,
> > +					 struct drm_xe_sync __user *sync_user,
> > +					 unsigned int flags)
> >  {
> >  	struct drm_xe_sync sync_in;
> >  	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.=
c
> > index d49ba3401963..e1881373e0a8 100644
> > --- a/drivers/gpu/drm/xe/xe_tile.c
> > +++ b/drivers/gpu/drm/xe/xe_tile.c
> > @@ -138,7 +138,7 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
> >   *
> >   * Returns: 0 on success, negative error code on error.
> >   */
> > -int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 =
id)
> > +error_injectable int xe_tile_init_early(struct xe_tile *tile, struct x=
e_device *xe, u8 id)
> >  {
> >  	int err;
> > =20
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tun=
ing.c
> > index a524170a04d0..0b9ea7fbc710 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -148,7 +148,7 @@ static const struct xe_rtp_entry_sr lrc_tunings[] =
=3D {
> >   *
> >   * Returns 0 for success, negative error code otherwise.
> >   */
> > -int xe_tuning_init(struct xe_gt *gt)
> > +error_injectable int xe_tuning_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe =3D gt_to_xe(gt);
> >  	size_t n_lrc, n_engine, n_gt, total;
> > diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c b/drivers/gpu/drm/xe/xe_uc_f=
w.c
> > index a236f1d37248..5838798ad1de 100644
> > --- a/drivers/gpu/drm/xe/xe_uc_fw.c
> > +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
> > @@ -817,7 +817,7 @@ static int uc_fw_copy(struct xe_uc_fw *uc_fw, const=
 void *data, size_t size, u32
> >  	return err;
> >  }
> > =20
> > -int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> > +error_injectable int xe_uc_fw_init(struct xe_uc_fw *uc_fw)
> >  {
> >  	const struct firmware *fw =3D NULL;
> >  	int err;
> > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > index e913efa2057b..9cbe1256439d 100644
> > --- a/drivers/gpu/drm/xe/xe_vm.c
> > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > @@ -220,7 +220,7 @@ static void resume_and_reinstall_preempt_fences(str=
uct xe_vm *vm,
> >  	}
> >  }
> > =20
> > -int xe_vm_add_compute_exec_queue(struct xe_vm *vm, struct xe_exec_queu=
e *q)
> > +error_injectable int xe_vm_add_compute_exec_queue(struct xe_vm *vm, st=
ruct xe_exec_queue *q)
> >  {
> >  	struct drm_gpuvm_exec vm_exec =3D {
> >  		.vm =3D &vm->gpuvm,
> > @@ -781,7 +781,7 @@ int xe_vm_userptr_check_repin(struct xe_vm *vm)
> >  		list_empty_careful(&vm->userptr.invalidated)) ? 0 : -EAGAIN;
> >  }
> > =20
> > -static int xe_vma_ops_alloc(struct xe_vma_ops *vops, bool array_of_bin=
ds)
> > +static error_injectable int xe_vma_ops_alloc(struct xe_vma_ops *vops, =
bool array_of_binds)
> >  {
> >  	int i;
> > =20
> > @@ -1629,8 +1629,8 @@ static void vm_destroy_work_func(struct work_stru=
ct *w);
> >   *
> >   * Return: 0 on success, negative error code on error.
> >   */
> > -static int xe_vm_create_scratch(struct xe_device *xe, struct xe_tile *=
tile,
> > -				struct xe_vm *vm)
> > +static error_injectable int xe_vm_create_scratch(struct xe_device *xe,=
 struct xe_tile *tile,
> > +						 struct xe_vm *vm)
> >  {
> >  	u8 id =3D tile->id;
> >  	int i;
> > @@ -2422,7 +2422,7 @@ static void xe_svm_prefetch_gpuva_ops_fini(struct=
 drm_gpuva_ops *ops)
> >   * Create operations list from IOCTL arguments, setup operations field=
s so parse
> >   * and commit steps are decoupled from IOCTL arguments. This step can =
fail.
> >   */
> > -static struct drm_gpuva_ops *
> > +static error_injectable struct drm_gpuva_ops *
> >  vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
> >  			 struct xe_bo *bo, u64 bo_offset_or_userptr,
> >  			 u64 addr, u64 range,
> > @@ -3432,8 +3432,8 @@ static void vm_bind_ioctl_ops_fini(struct xe_vm *=
vm, struct xe_vma_ops *vops,
> >  	}
> >  }
> > =20
> > -static struct dma_fence *vm_bind_ioctl_ops_execute(struct xe_vm *vm,
> > -						   struct xe_vma_ops *vops)
> > +static error_injectable struct dma_fence *vm_bind_ioctl_ops_execute(st=
ruct xe_vm *vm,
> > +								    struct xe_vma_ops *vops)
> >  {
> >  	struct drm_exec exec;
> >  	struct dma_fence *fence;
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > index 52c7df4c3afd..4069c06c1476 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -1011,7 +1011,7 @@ int xe_wa_device_init(struct xe_device *xe)
> >   *
> >   * Returns 0 for success, negative error code otherwise.
> >   */
> > -int xe_wa_gt_init(struct xe_gt *gt)
> > +error_injectable int xe_wa_gt_init(struct xe_gt *gt)
> >  {
> >  	struct xe_device *xe =3D gt_to_xe(gt);
> >  	size_t n_oob, n_lrc, n_engine, n_gt, total;
> > diff --git a/drivers/gpu/drm/xe/xe_wopcm.c b/drivers/gpu/drm/xe/xe_wopc=
m.c
> > index ada0d0aa6b74..3d6781b2abf6 100644
> > --- a/drivers/gpu/drm/xe/xe_wopcm.c
> > +++ b/drivers/gpu/drm/xe/xe_wopcm.c
> > @@ -196,7 +196,7 @@ u32 xe_wopcm_size(struct xe_device *xe)
> >   * size. It will fail the WOPCM init if any of these checks fail, so t=
hat the
> >   * following WOPCM registers setup and GuC firmware uploading would be=
 aborted.
> >   */
> > -int xe_wopcm_init(struct xe_wopcm *wopcm)
> > +error_injectable int xe_wopcm_init(struct xe_wopcm *wopcm)
> >  {
> >  	struct xe_device *xe =3D wopcm_to_xe(wopcm);
> >  	struct xe_gt *gt =3D wopcm_to_gt(wopcm);
> > diff --git a/include/asm-generic/error-injection.h b/include/asm-generi=
c/error-injection.h
> > index b05253f68eaa..83e7acc7d49a 100644
> > --- a/include/asm-generic/error-injection.h
> > +++ b/include/asm-generic/error-injection.h
> > @@ -31,10 +31,12 @@ static struct error_injection_entry __used				\
> >  		.addr =3D (unsigned long)fname,				\
> >  		.etype =3D EI_ETYPE_##_etype,				\
> >  	}
> > +#define error_injectable noinline
>=20
> This would be eventual goal but we can't merge core kernel level patches =
through
> Xe / DRM branches nor can we change the core of the kernel without sendin=
g these
> to the proper mailing lists. I'd move this to xe header file first, next =
steps
> would be proper patch on the correct mailing list + an update to error in=
jection
> kernel doc explaining why this is needed + usage.

Which xe header file do you want me to add this function attribute to?
-Jonathan Cavitt

>=20
> Matt
>=20
> > =20
> >  void override_function_with_return(struct pt_regs *regs);
> >  #else
> >  #define ALLOW_ERROR_INJECTION(fname, _etype)
> > +#define error_injectable
> > =20
> >  static inline void override_function_with_return(struct pt_regs *regs)=
 { }
> >  #endif
> > --=20
> > 2.43.0
> >=20
>=20
