Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D14EEC2A5
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 22:35:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6427510E45A;
	Mon, 23 Feb 2026 22:35:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bgEV35Dr";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CEF910E45A
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 22:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771886131; x=1803422131;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oG2ybrtoxY7eP74++P7/55zghSg0QT1fPw+usZVl2Ew=;
 b=bgEV35DrRH7rAnCiO1bj8r7lcsQqDnNWkucRtzd2rEqMLMsCZKJ7KFN1
 S872Qi33+4/icEpETer6iXU7bLgBSrtIbQtay6B8vrJWLbT5yQPwNgLJY
 YRQm0a/FjJzQqf6OFO3WMUHlzDcRDkyA5BwcLRhFY8E1XuljZcxBCULj5
 iaQsP6p1gweNKXkT+avu/9jtg2BdjVvHvBW8EZl3jxPFHpSIJD6Yr0bAO
 y+2six/PavoGkZy5gQw73yQDpCyAzKDAr3rxNkmOaqRSgys0YduOnE374
 GZXhOexLz6TAOdVgtcOf4WhHAALB/57wTj7bCcxHCpx5A905lBNikqoJM Q==;
X-CSE-ConnectionGUID: YHtKCIr0ROaA5m5xpUaxRg==
X-CSE-MsgGUID: nsdZ7dzqQqe0fceknWKYQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="84347492"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="84347492"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:35:31 -0800
X-CSE-ConnectionGUID: 3CFlU5qdRSimD6lbp6UGIw==
X-CSE-MsgGUID: vMimuXevTiSP4LifZVBR3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="214006665"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 14:35:30 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:35:30 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 14:35:30 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.25) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 14:35:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CsJeHqoBlWU06WibgSHOefwvPcQFLM/nxWYcVeEW38pwDF/uWTPxdu9YwSudQT9oZPfBj3gfUyyXADk+X9xHPr6S6+tJtqQ7Jb3ZTU2OfPrjQD5neTwOWwIz4OXvPD+CmMS2mwV3fQlQsiLwOS+7IAf3xTaDsYgCWRjjSh26UIRS2h9wZCEe67SObquMzXRRN3PPsQjngwLwJqIo1vCXOwwoml88bur1dzJqjThQ9ZVoFPyGkGhTXm01TjgTVXuZ49KhT5FAMnA32VDlDsR/agZYvKhwxxfq6tKjTZnaL9ijOLuQmaRnGTtXB+tDizpbtEaB0bsR5L4F6p/gEXAqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LG9E1X6ZDxd6quL3snRxTEjT9HJzM4bInjJHkI7cKPY=;
 b=ekIgJwZ0ol0O7+4ZEUdPRrF+A9qG+uRKND/0HzWkKogcwZalUI4sfGiaBqgLJp2lwBlVK/HDuQ0UZ6glXYp+XkwI7FbC26Q+HXcP2JZ/ZcVGZebcFJ16Osc6ih/yChhETJfu7JTxLZJE1EKPM6P14yafLhZKnktC6CoKwD/vhlCVHhwVdUfALa7r8sF49fI7Bwm+lGI9UJOMh0vNeE9zL91lsoFT4dpZw3oFfhEdkvuBlTHskUAjM861OSqgBbeWVU/QTKBhodGyhgpEdhg65of3NHlUPaB3CfS5Z05Vhb+uFPYbSNxAH7lK1n3G2sEwVhbr4xW/e+dIWOu/KYLFeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by CY5PR11MB6235.namprd11.prod.outlook.com (2603:10b6:930:24::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 22:35:27 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 22:35:27 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
Thread-Topic: [PATCH v2 16/23] drm/xe: Consolidate workaround entries for
 Wa_14019877138
Thread-Index: AQHcoo5vLfSgJll8VUqqtxFLMOBDLrWQrl0QgAAmwwCAAA5QkA==
Date: Mon, 23 Feb 2026 22:35:27 +0000
Message-ID: <DM4PR11MB5456B8E9E80D79A854D9136FEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-16-b12005a05af6@intel.com>
 <DM4PR11MB5456A6363D05A35429F44AEAEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
 <20260223214108.GH4694@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20260223214108.GH4694@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|CY5PR11MB6235:EE_
x-ms-office365-filtering-correlation-id: 8d43fe20-598d-46f5-c9e7-08de732bd810
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?wu12XMc10Npnz8MDe5Xl0komgt5NQTarMvWAXmAbGyp3Ld3ujEnSc1TQNogA?=
 =?us-ascii?Q?l8jAkoKCYqQQ3993d7nulb6ljChlSUxN1ZOZRn9cN7aDoEzOxkA2D3xG/s4O?=
 =?us-ascii?Q?zJB/jbiiILtlRwMed/z2qQYjK25CiQMIad5DqCFljt5DDRSawuBtgx4WIflc?=
 =?us-ascii?Q?S3U2nwfGGJAeTIIeUzLCnswLCZF5bBMZc9b6kTtP9pQQOyVzJGGHNmpGlOOF?=
 =?us-ascii?Q?v3/gGevyGf0pJTQqIywjvv4KbUMSX10+zve0VT6ghwjTr13Abc63A+wRuWvj?=
 =?us-ascii?Q?QEWonCkIOYWCqZRFhDg5PmTHNkSeBVs6bgxyUMQHKu1/dmMqg5f1rQiaFLbh?=
 =?us-ascii?Q?YQdUzAFC534ZjuskPp7MUnj7v1s+JMr+xzenZ4/PMnX5i69atXcPIHZp0uuM?=
 =?us-ascii?Q?v9nkNamOtU8rpdq4HgRi+rqPLFtgEN2/UJFjLI1juHdYQbF5z8uaP342im5k?=
 =?us-ascii?Q?jdH0VKWL+4XXbay1nou/+0ZP6j7B/2RfIjb5WuwuIsMT3ypihEk659zmda2e?=
 =?us-ascii?Q?Q9o8pvxqY/ojkUs7ubx72DPkHkXSeSlwsET1b6YBLdhoZoumCkUSiT1ihPXE?=
 =?us-ascii?Q?tgnsgLUhf73gF/m6hy1fhEYtFZcGjyMkESR8h+nxJB57JoCQRC6tQBMoZsD/?=
 =?us-ascii?Q?lcvp1Bulkemcoq2JcQzAb4DpJzNOjP1nfWMYdNQZm88uZuBWeCh9XPPu2iz5?=
 =?us-ascii?Q?XPAVK3Nzl4nQVRWbx3j+ZGLslHiQOY98rw2Asme3vKni2KsfHHHa1X428OsK?=
 =?us-ascii?Q?kSNTOiEsKE21Q+Z2eFCmTkuYDqPLYmvcXH8RsyjU977XfI6s57mSs5AEJPDj?=
 =?us-ascii?Q?k4+7Y6ZGMPqMvC+0fBQc9satBhsL3d1fnrbf3Ybup4MXJapHbm9OxW3QD7xQ?=
 =?us-ascii?Q?LVZNbY+jo4MXUoTLPrBvJ5Zjl43ew7/VWBncw3UIjPU8AMJ+ECQxItP3+9LG?=
 =?us-ascii?Q?4UrYZDxQW2gB8vbmO2qXV4iDR+Y1007nx1WXfcI+RoevASH3w9k7JxXcrFO1?=
 =?us-ascii?Q?Za4r0v26Gf3cwNee/bAMtXpHCVqJOjIxLmDddxatvAF7x5+hyPZyZOPSV1w2?=
 =?us-ascii?Q?kB7840utpgkWQu2QLSrwSKY4hNDnWlxG3dv9mW3gp4iPSSga4yvCunp+gfdZ?=
 =?us-ascii?Q?O1ThDQ07RxRrTheR+v8VQUElc90hwc6meszJ1wpCLXjOQ78nybB7ZHt7+ye+?=
 =?us-ascii?Q?TMgB6cUSmzrLvq16pU76kQL/u1o9inn3R8PLhmjO25Pme2/R7YrV7H/ZUHCe?=
 =?us-ascii?Q?A3Xz29P3Mc1adDSU6PfQeBiUGEEZmi8cVX0iGoL0yYXBrApMbGUPqBKqMkkJ?=
 =?us-ascii?Q?7zu0Q+P0emdBgDZhsliG1zjhT6mqEAqu4rDDKWxXVtihvXK/vdBXNuNXFJI7?=
 =?us-ascii?Q?3DT5LmPkkW+sUqXJXlJymVq5pdvYy0dqXAB4clBBh4+Tk1q9GGlJ4MbIs/9n?=
 =?us-ascii?Q?y5PvhZhQVYggwouVmPcaNbAkXV9pdGf4UWdjUBZoM/8FmFyO2fKool5PHX6Y?=
 =?us-ascii?Q?Dh2I1QUegKEleomFWQHy62r33uTFYg5wgVmz8J9L8TlTx7Hf8kqjdLb8wNZK?=
 =?us-ascii?Q?HRcQdRzVFqG/6R5cli7gMfsBpkvP7wh4i2eMCqX7aH/6UrOE0EL4XYeF3zkR?=
 =?us-ascii?Q?ctmmBCvGqUJxLguXdt0aLXo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?V/GxV4jRnoWg7ec4aFh6hRqGNwby1O/LhFPzIhCsPDv8wyANWwpVqAiLXn3r?=
 =?us-ascii?Q?XB/bT/MPwVzAxg0HsZxYBrDkMa0mMcTIuDZX4aKGG+hLpW3Ki5SFZFEnA0Yx?=
 =?us-ascii?Q?t4mGpDdhn2l0v3f2tLD5ZaIaANrMJms4S9XSg9RascjCjUcwI/RxjsclmkoL?=
 =?us-ascii?Q?eFYui7VLFNzzWqoi0ijY30DVOjNlwY1IHvd7YxhTsrGcWsZrwNsnS41BqPpH?=
 =?us-ascii?Q?zxuptVb0hkxtsYnuM/hPfzILKBCjQbeFUFDfKs3fTVyWwsIBhVmbryCCLBkP?=
 =?us-ascii?Q?/1QBVWstHHo5NYt0m/9Jva8S36rFr7Qwks6DKQN87ubosSpIQ09lJpZSSRQM?=
 =?us-ascii?Q?Tt0ju4zMXS4C52ONrlEmFVYNiuwn2QH4jUH0OHvlfRZ9C6vyDM+LeyShm54c?=
 =?us-ascii?Q?GbArteBCNHFgjKI9VN60PYk/bgDwrqBDxmrEFCsw1jCftpaC1PH4sITS3WKd?=
 =?us-ascii?Q?Yjobckvk9UNoXsA7rX9Mz098zd9ZB+kjBTmOuwjrhC2FI0JbaCA3GsNXEuGU?=
 =?us-ascii?Q?JcQLPQ9w4xNEa0v2prZbqsNHtjMadXDtROCybr9WdSZYTxKz5plhQT7qxHvL?=
 =?us-ascii?Q?4rBA6FPu7bWcR/u7jjeQ1RgwzQdXBa89xp1N6rdm2hmDV3WF8N41jhDZDh1Y?=
 =?us-ascii?Q?Wf/29wKPqG5Hy6XRMO0858RKMiEm7H0pkIeABnZcmg0P2nt5wVrVoqoDQ+em?=
 =?us-ascii?Q?2h7iy0kni4R4km/ML+9Ej9GIUHVgtRPgBq6+RQG0oZlurNDXfrWk4xXf8Yhn?=
 =?us-ascii?Q?P4EDc10oegHGl6mX4SvCxEkm0eYxCTUQwwaGOnF9sF+0QayeqIaSWZCLNHV4?=
 =?us-ascii?Q?DYFIBvcYW1/mm4+AiHfRRzeads/noyrFUTz7AR9Wx1zXbvZ1EIvkrXI5dji2?=
 =?us-ascii?Q?Itex7m6BI2esAD2p34d+Xe1w9WsqvHxXka4xLYoGQJUpjzSpvPZd4NzKhIAE?=
 =?us-ascii?Q?EQblo2hOLTFPM8sNuuaqqBh6xPCLQ9Akwbx68pkBhDudxrb167aQlD4sC2o4?=
 =?us-ascii?Q?tU//kRMU8xfCV4VkodAQcSD2PGkTKg316A8xvEkvBbHxG6hKc1gq2pR49+7X?=
 =?us-ascii?Q?AGQ/GYAgKlrFspFYzoF6cJx9C6G3bAIIOZZQPrCq9WeVLIxmb2zTvsBMRWZd?=
 =?us-ascii?Q?gVWaWW7mfP0wKkOh9PnyncqmULjamiYLZnJcS1pn46eWRM9ZxpTsdIy+7WN6?=
 =?us-ascii?Q?+cjRnUvwHf1BtM/y7NiM/xqViU21RsR+ON2b540a0lVtop5nEenn7ioRlUjP?=
 =?us-ascii?Q?kVgrIOY2PpASFtZ10FlaTzyxIEN6t4Wyua+zvA6Ep+FPJvx0wTBj8R5h2rZL?=
 =?us-ascii?Q?kfWmVST1DutZ+JsgCOPJ0hzuqvQmizNgkMW5rsCS1j1QWdw4MEPA6WcoHdw7?=
 =?us-ascii?Q?SYb0Rw1iCWVJaA++rqT+QEs7O5NOD+VxITo5m4ckRaY0o7Z6xlKk7vaZdCqH?=
 =?us-ascii?Q?1Isr7AP5bfzAmnG97dq1cVrDDhaBsau0cOkxOB+VFUM0s1CDxQ2LEAxnXAFQ?=
 =?us-ascii?Q?5NS8JrVJ46hSFBgDJDF7jON8yWNfQExdXfbSYHl6psNbhYA/N4PJQgjBzweF?=
 =?us-ascii?Q?HOOALVW18a8a0YIWLuHHW3TZlVVonm3DwPkVSfqvDmRhYJV6EF0BfPXfDxqF?=
 =?us-ascii?Q?HiC5IgT3ue9ZIHo3JSARlcuxVThRS2DoNMZsYXoc+XpUtU9Q5TFVGgxYJsdI?=
 =?us-ascii?Q?HQIwNDVdkEg+8Wmfgw9pGIsgYANiN6fA322wW4cg+fqA5ph/4q/5avwCVjz2?=
 =?us-ascii?Q?a/pR6CvjJQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d43fe20-598d-46f5-c9e7-08de732bd810
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 22:35:27.8930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0GfMGOh42Tl1CyoXAKZ8dpMa0NNq1r4x4tL0WWfv5nJf0Cbd4PCnzwfrX264fB50LCBD0vs0MIWm++OndKhZ8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6235
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

On Mon, Feb 23, 2026 1:41 PM Matt Roper wrote:
> On Mon, Feb 23, 2026 at 01:33:37PM -0800, Lin, Shuicheng wrote:
> > On Fri, Feb 20, 2026 9:28 AM Matt Roper wrote:
> > > Wa_14019877138 applies to all graphics versions from 12.55 through
> > > 20.04
> > > (inclusive) that have a render engine.  Consolidate the RTP entries
> > > into a single range-based entry.
> >
> > 12.60 is included in this range, which is for PVC that doesn't have ren=
der
> engine.
> > LGTM.
> > Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
> >
> > >
> > > Note that the DG2 entry for this workaround was missing an
> > > ENGINE_CLASS(RENDER) rule; that mistake is fixed by this consolidatio=
n.
> >
> > Should we fix it in the stable kernel also?
> > This is a pixel shader related register; the setting should not affect =
other
> engines.
> > So it seems this mistake should not have side effects.
> > Is my understanding correct?
>=20
> Missing the ENGINE_CLASS(RENDER) rule will cause us to emit the register =
as
> part of the LRI setup for the default context on other engines, but since=
 the
> register isn't part of those engines' LRCs, when the LRC is saved out to =
memory
> at context switch it won't have any effect on the context that gets saved=
.  So
> it's a bug, but a harmless one.  The documentation in
> Documentation/process/stable-kernel-rules.rst indicates that only importa=
nt
> problems should go to the stable kernel, not theoretical/harmless ones, s=
o this
> wouldn't qualify.
>=20
> Also, the Xe driver doesn't officially support DG2 anyway (the support we
> have is just for driver developers, and will taint the kernel if an end u=
ser tries to
> force the driver to load on DG2), so it's especially not relevant to the =
stable
> kernel.

Yes. Got it.
Thanks for the detail explanation.

Shuicheng

>=20
>=20
> Matt
>=20
> > Thanks.
> >
> > Shuicheng
> >
> > >
> > > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_wa.c | 20 ++++----------------
> > >  1 file changed, 4 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> > > index
> 83318a4ebcb51e004497e2cb9460e95691b5d9ff..21af997447e78951dd6d
> > > 40c87454e8ef69343006 100644
> > > --- a/drivers/gpu/drm/xe/xe_wa.c
> > > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > > @@ -637,6 +637,10 @@ static const struct xe_rtp_entry_sr lrc_was[] =
=3D {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(1200)),
> > >  	  XE_RTP_ACTIONS(SET(COMMON_SLICE_CHICKEN4,
> > > DISABLE_TDC_LOAD_BALANCING_CALC))
> > >  	},
> > > +	{ XE_RTP_NAME("14019877138"),
> > > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1255, 2004),
> > > ENGINE_CLASS(RENDER)),
> > > +	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > > +	},
> > >
> > >  	/* DG1 */
> > >
> > > @@ -673,10 +677,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =
=3D {
> > >  	  XE_RTP_RULES(PLATFORM(DG2)),
> > >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> > > MSAA_OPTIMIZATION_REDUC_DISABLE))
> > >  	},
> > > -	{ XE_RTP_NAME("14019877138"),
> > > -	  XE_RTP_RULES(PLATFORM(DG2)),
> > > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > > -	},
> > >
> > >  	/* PVC */
> > >
> > > @@ -694,10 +694,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =
=3D {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274)),
> > >  	  XE_RTP_ACTIONS(SET(CACHE_MODE_1,
> > > MSAA_OPTIMIZATION_REDUC_DISABLE))
> > >  	},
> > > -	{ XE_RTP_NAME("14019877138"),
> > > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1270, 1274),
> > > ENGINE_CLASS(RENDER)),
> > > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > > -	},
> > >
> > >  	/* Xe2_LPG */
> > >
> > > @@ -705,10 +701,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =
=3D {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > ENGINE_CLASS(RENDER)),
> > >  	  XE_RTP_ACTIONS(SET(VF_SCRATCHPAD,
> > > XE2_VFG_TED_CREDIT_INTERFACE_DISABLE))
> > >  	},
> > > -	{ XE_RTP_NAME("14019877138"),
> > > -	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > ENGINE_CLASS(RENDER)),
> > > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > > -	},
> > >  	{ XE_RTP_NAME("14019988906"),
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2004),
> > > ENGINE_CLASS(RENDER)),
> > >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> @@
> > > -758,10 +750,6 @@ static const struct xe_rtp_entry_sr lrc_was[] =3D {
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > > ENGINE_CLASS(RENDER)),
> > >  	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FLSH_IGNORES_PSD))
> > >  	},
> > > -	{ XE_RTP_NAME("14019877138"),
> > > -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> > > ENGINE_CLASS(RENDER)),
> > > -	  XE_RTP_ACTIONS(SET(XEHP_PSS_CHICKEN, FD_END_COLLECT))
> > > -	},
> > >  	{ XE_RTP_NAME("14021490052"),
> > >  	  XE_RTP_RULES(GRAPHICS_VERSION(2001),
> > > ENGINE_CLASS(RENDER)),
> > >  	  XE_RTP_ACTIONS(SET(FF_MODE,
> > >
> > > --
> > > 2.53.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
