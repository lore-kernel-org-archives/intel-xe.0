Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDD0CCD184
	for <intel-xe@archiver.kernel.org>; Sat, 11 Oct 2025 21:35:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65A010E058;
	Sat, 11 Oct 2025 21:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QcsNxFEL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 413BD10E058
 for <intel-xe@lists.freedesktop.org>; Sat, 11 Oct 2025 21:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760218540; x=1791754540;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=2kfqyYm0EkGFFhXdDzb9FugI/1ITViPyPI+AYzflBSc=;
 b=QcsNxFELK0G/pPFItjLtRIBVSY3GE6OVNitbXwYO6QVlAba1FV8G/Ovk
 sBUTduc7Ho42JfuQeOjeR1yTeYLZqBT7ia0+Nsh+nhtqrlUYdZ7CdeRlS
 rPNB/ysdutNvbUc9eqIqRyxfEV4XOtIj/oz7/JDVA4geP98AFYz0n/5Tu
 Lya/xzMOJ3W123e1NpzWC7mbCINL1f5gF0HM8qwqW2ceDHZxqEXoP3S/y
 veIlFEUfGV7fKo3MViw4GzGpLvj2DltPPu+t/A3sVLTEzDePevhcReMmA
 XSGnBG6sZaI/tvS9NuI5WYI+AFZAczng5cS7Kg+zQ9PHFYrfajhmHyQJ9 A==;
X-CSE-ConnectionGUID: wqKFw6q5TX2p/j+ygNT9Mw==
X-CSE-MsgGUID: cL5bjBfuRTqnmR6csDKt8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11579"; a="85028579"
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="85028579"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 14:35:39 -0700
X-CSE-ConnectionGUID: pZgOwSj5RRqsNeQ58diS3g==
X-CSE-MsgGUID: SIzgky3eRJarapa8vU3xFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,221,1754982000"; d="scan'208";a="185632732"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2025 14:35:38 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 14:35:37 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sat, 11 Oct 2025 14:35:37 -0700
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.50) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sat, 11 Oct 2025 14:35:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NwAggscyh1Hx9CyeMis1ELWHmC9WW1V9UObCzCM+JpCA3vk9ChtUnACqMh3N/YCh3aJ3F3HVI61nHoUbiGULjrgKhvYDfZjVf07y0rZ+5e3GLzxGguxX+T1J8HPv63mtaX9LyPQDr+kCw244p01U3dUjVvo/jZbfX+pyxd3jpAMxjeC7bqQVIcxqo1yzp0YjaRxLRNfmko+sBEP7Kb/Kr+jIJUViUGf77ttcDMB7GmwuZJoBcP5b8EM9eVqgtyhvcAykD9obgkVM/JFPXwZteOMX9965zQ3RTAyzZ55103IShCtIaXwbXsOb9eW+0S/5kJ4LggunkY/2k9OqnKEs6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJihnFveLimiEq21n4f3XrWsKmBwfnR7QpjmkEwBM8w=;
 b=OoYHpxdJQ5pO6vglUTdFRPdjBmHR9e/axWCj6h90GkmEd4BsYq+v7AsJYiPXpSdk2sBAayZdfyynmVIozvBPH2rXLgyzdGa4XfsWixb+dnWpVdDINyRIUevMnU3NrIBXb6f3vrt9heGlsMcOYvQpDHM4cs7mdbA0Rf+dXZNmPIzHW9qGjZZrvt4EnZGX8A0oIarl4e/SYsa1r3ovUejUScxYHQFpYurhIN7o3fEJjEVhZGgVseKTgp9d8t6W34aNcfl8o3txx4GzP/uFJMF2LG7hVf6Glz7mExjqaLmYzFTcsYr+ZJnr4aKOK5K7XmOt10Xvgp+hVtCNFQ0XWmgiUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by IA3PR11MB8940.namprd11.prod.outlook.com (2603:10b6:208:57e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Sat, 11 Oct
 2025 21:35:35 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9203.009; Sat, 11 Oct 2025
 21:35:35 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "De
 Marchi, Lucas" <lucas.demarchi@intel.com>, "Auld, Matthew"
 <matthew.auld@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Thread-Topic: [PATCH v2] drm/xe/guc: Check GuC running state before
 deregistering exec queue
Thread-Index: AQHcOgt07V6eeBEepki4Cp06wSlH47S9DvyAgABlIRA=
Date: Sat, 11 Oct 2025 21:35:34 +0000
Message-ID: <DM4PR11MB5456FF896510A5EABEB9A365EAECA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251004173033.2511250-2-shuicheng.lin@intel.com>
 <20251010172529.2967639-2-shuicheng.lin@intel.com>
 <aOpz/xRmpC+zQsrI@lstrano-desk.jf.intel.com>
In-Reply-To: <aOpz/xRmpC+zQsrI@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|IA3PR11MB8940:EE_
x-ms-office365-filtering-correlation-id: 376e4c26-496b-42d7-a3f9-08de090e1cd5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?fd+bEsD0pMhV6OA+TTk352S0VTtHbcaFI/NHQpQmLb3BkAOrQ69KV2bcwk0B?=
 =?us-ascii?Q?6uAmnFhJEO3QfaJFGyvYdMAfvZKP8WjLpS7IBIYCQpnGgz9+THeSJBqmAbi9?=
 =?us-ascii?Q?1HytEN60zULzgtBoWJiJp1lf64uLtzzQthPVRddSEmJpGwNCgDqsusNlukGp?=
 =?us-ascii?Q?dPuLMG+YM/xCK5G655xLi1UrEUtnI1dBDuhDWamMTvFUG7+Gtp5TM4Ahtoqm?=
 =?us-ascii?Q?zLGr7Zxlu+J6+cPJl9zc7I9zB60CeNqohKg0NxNvHpU2+PKO+OjJiW3k0Y+a?=
 =?us-ascii?Q?kpJIwBFQr7y/pPEwkYRqhpmBzYZzlGRFnGlYfGvoYLgg+EUlN2vR/YWCxBJS?=
 =?us-ascii?Q?1ByutIcmDD8x2vOaXgcp5a5vscAnT6NgqP2VFs8K1G3fmD4zU0Xl+TGfWA+s?=
 =?us-ascii?Q?sRyMKCTAzzx28OThrzlGC81oSaz9bj1w1obsKX5cj54T54CH/Z7hE84UhNn7?=
 =?us-ascii?Q?LJJiP1xpWdpkoOoS7fILkHyWpKJebVzJ+fSHBkom+5YvKeqHGcF2ZWn+yJQd?=
 =?us-ascii?Q?ns6n2CaM/8oQlGtKbrV9rFU7j/tXEyrajLHw/2Y4dIuuYxDbSGUnyez2pLH8?=
 =?us-ascii?Q?P0f97JdMlsFgcXBKfYRgY1HgG5KAy27YcKykwkyjqFIXKhaANs6CdK4fmEqo?=
 =?us-ascii?Q?+thDiyUZiYNSBBQ0OxuifcKOL+OrWeyNwzlictF9r00DHFEfVRUMLAVJQpsq?=
 =?us-ascii?Q?L9s944IpTznnkHCU3MB5zhb0Srewn0Pxr0uZX6fhgnwwUXvjT1zfMeUiNFTH?=
 =?us-ascii?Q?460AdDaEY7Vg+vs6TRyIRDQDPpSFSf7py/Flq9V15cD9psg0meAsxHrTgpkk?=
 =?us-ascii?Q?f0ANEHbkRrS21hA3tek2aJqJawordWbyOU5zY47O2tTd1PfDMt+hAtIpG5uk?=
 =?us-ascii?Q?nu1y2x2Uq/RdhyMiHy68QTeq0G9NZwg07I4iP7Y7mafdZDyoGtSYTKto+lwY?=
 =?us-ascii?Q?dYnIQrwqbZfK6X+1DKmHvZ8b9lwxZox3VguW5v6ySK1Fxn83+ELvrTz+B6U1?=
 =?us-ascii?Q?mwZT18NSHD3QxbMaxTjsRNLYqxdkEgkY1Oqtjw3raVWsNUKagpzmy3MY0RiH?=
 =?us-ascii?Q?wpMYYhchJHyYm7OIV2KCzkMYvAJolbFmFyAZTORubO/rwIIoGtPue1Y+7qg2?=
 =?us-ascii?Q?KNNQmaiuRN7jK+qbFH670f395MfIDyI9qRu07yz2bCRr24VzluCX+92kFq+a?=
 =?us-ascii?Q?5HvDS+CLYO+27GKutQnGCfuNguzQGrDtTrbXTjhDZ0IVFGwCQwzD/4P9qjUE?=
 =?us-ascii?Q?+UHASGil+HhQKdeaL1WRVqhi9hFCBDxOTuoDPxA3xKrrnvm6+/YFQ5oG8Hj+?=
 =?us-ascii?Q?aXul5kg87w55CR/nfgtZ7GXRfsPHmwJaOTrjEIawAaGMNFGmfpwV13jZwV0W?=
 =?us-ascii?Q?zd2SeoHw8VgnNPOGiMGDU/zxKSUHIOqjOirpGoNrwUu8hK9RBEt1mR73C5dj?=
 =?us-ascii?Q?g87HcSUXHnWF+6YvJWQ3Dz3YqA4x+CJQ4WR8ToIDpwRdyA94mV7D0TXiCW2B?=
 =?us-ascii?Q?YrhTMaLAEHUvR1GTgpLtIwAiji1jAuZqlfoa?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?eS00r2IKToB4CNqY+4kxj+89lwGRnj7kTzGNpLmm3HNd/gyHYgR+wC2feJEh?=
 =?us-ascii?Q?/lkatyR7I1nKWwbSHdw4qwAC62MRA4wzE7ONh2bGIYjE1sZnEyoOXt/+PTTe?=
 =?us-ascii?Q?lMFUbUb3KWmCuVWNscv1fXSnpuZJKWAzBYUA4DIg6XH/gNVLaRlPSLmyYbIF?=
 =?us-ascii?Q?7Hp3Yzaqjq7bs4HwxJcq9xECv5ThjEeLf82y4qLHIOhJipGfJgd/zOmMmXPP?=
 =?us-ascii?Q?ykRpLPp812sgq6AjWNu0PwWV7e+qKru7Rg58541KNH+gSpQkBWS5Ogmx82Z1?=
 =?us-ascii?Q?/sYg5A//5mO49p5WnzMIv1XIL4ToQo331+scwe4QKtdZwyi20OflW7wPMbbJ?=
 =?us-ascii?Q?HGw9RrSKA6ost3QAM+j1ca/he9fwpEyACcrKYUfTJL7+ZJy04EerJIEAHNm/?=
 =?us-ascii?Q?L4BhIwFURKFrperFsOnWqEd+Tf+M8vmibaWlDjvQ2FKoz5MEBXYH+IQLWg3b?=
 =?us-ascii?Q?YyHoDraNdCElz2O38hSi/VnkBPM0rB/8hc9K2pOgRjW5ArlDs4SZoBKt/XYw?=
 =?us-ascii?Q?WbyCBXbMtwvJqRqQfeuJ8wWEcM3cacNnxe6CAO1y3gGD5Oc6eamjUE+EFUQg?=
 =?us-ascii?Q?68YKVqVjdl1qUUKilJAwGWE13IZR82Ir913tLalyZL47INzXi9GDTlTLu5rP?=
 =?us-ascii?Q?Bl7i71Bxho3/0Y1sqbN1oNoGB5mJzHbzvOdtz5vQkTnXW0It9xpeehOfc/XW?=
 =?us-ascii?Q?mCVDlIKU8Ql6bT0B4WVxZ7CtUnU7IidM9V4IvhWeHTda4dGSGwVoT2i+mcwV?=
 =?us-ascii?Q?vo85RjmB8uwTHEcOERr/6qINJgu7n9PlmpsDy42Hgra081zm9kq13IUV4HB4?=
 =?us-ascii?Q?tqE1vuq/n00E0UL98di4qqELFmPiIC+pl4QXqGV1UeRFazDfGoMtjSa924T3?=
 =?us-ascii?Q?pX5b5l+h+KES3dydIxAsqW/roUS7OJwHcLUtcuIy9iJ1ANx0seqVswVnlbjV?=
 =?us-ascii?Q?m7oLpL5BkKMTmOYqNVtqkEBAjQok7KEezzQMvT7I1/2V0V0jkCRzUurh5Wkk?=
 =?us-ascii?Q?47fjEooXyjMl8J3QZhxfQWd/p6otIYMsri3cYiB+7psltG0OiIr7g47zE6/n?=
 =?us-ascii?Q?1PHl29lDcgrVtYGAWB9HBbr2OADsnHCuL1RfUEn9iQp7oT/lznrLLQGmcBdr?=
 =?us-ascii?Q?ISpTbSIKh5rbh+OmGAex/zy762dNm64HcKIzxyTG0/qkXjUe01KDKI3LgRlk?=
 =?us-ascii?Q?5yf5F3VLNo2MPfqZt3j5asapnP9ecLBWDBFDb/WLT0kVmWJM1hImPl8v8isk?=
 =?us-ascii?Q?TJQReYADUDejWR0/MPAh4fuZz+L9GeOdlVEP1kZEkkuKUVALbzT/fUIY5i5+?=
 =?us-ascii?Q?vNKAj1pE1sh8YhQfbZGJpHx1jJSfDOHPtw9vN3wTmf9jo2xacPsbgJv8ffKB?=
 =?us-ascii?Q?KosB0xeXfIwd07VC2rIxEAB6BsRiYBpC3wIyrlkSt8F1ESIzbbdKWxgxjmim?=
 =?us-ascii?Q?d1hn7w8wEISc64ICvzXQlF2n2DWAicahPyL8QBuzuarWU2eA/Pe6TPSLWcr3?=
 =?us-ascii?Q?jq3Ierbz1O7Kq75F7wpmJBtRtzthtyZRVAf7ovyvRWzuPdG7NRQpQ7jPejqa?=
 =?us-ascii?Q?DecL5LHb9V/h8BvoTrEZZhEwGtZ05Ide5mHELzc5?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 376e4c26-496b-42d7-a3f9-08de090e1cd5
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Oct 2025 21:35:35.0588 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: axf5pCoZGJ8W//EgSR+/thsBiPp/0COeLvJx1aCO0OQ/LNZx6rlDAulNv8gxWoFJVVeiLpmSI9z832FlxeRwQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8940
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

On Sat, Oct 11, 2025 8:13 AM Matthew Brost wrote:
> On Fri, Oct 10, 2025 at 05:25:29PM +0000, Shuicheng Lin wrote:
> > In normal operation, a registered exec queue is disabled and
> > deregistered through the GuC, and freed only after the GuC confirms
> > completion. However, if the driver is forced to unbind while the exec
> > queue is still running, the user may call exec_destroy() after the GuC
> > has already been stopped and CT communication disabled.
> >
> > In this case, the driver cannot receive a response from the GuC,
> > preventing proper cleanup of exec queue resources. Fix this by
> > directly releasing the resources when GuC is not running.
> >
> > Here is the failure dmesg log:
> > "
> > [  468.089581] ---[ end trace 0000000000000000 ]--- [  468.089608] pci
> > 0000:03:00.0: [drm] *ERROR* GT0: GUC ID manager unclean (1/65535)
> > [  468.090558] pci 0000:03:00.0: [drm] GT0:     total 65535
> > [  468.090562] pci 0000:03:00.0: [drm] GT0:     used 1
> > [  468.090564] pci 0000:03:00.0: [drm] GT0:     range 1..1 (1)
> > [  468.092716] ------------[ cut here ]------------ [  468.092719]
> > WARNING: CPU: 14 PID: 4775 at drivers/gpu/drm/xe/xe_ttm_vram_mgr.c:298
> > ttm_vram_mgr_fini+0xf8/0x130 [xe] "
>=20
> Does public bug for this exist, if so we need a Close + link in the commi=
t message.
>=20
> Also I believe this warrents a fixes tag - I can add one when merging thi=
s for you.
>=20

No. It was found during internal validation. I will share the bug number wi=
th you offline.

For the fix tag, the logic is implemented in the initial version of xe, the=
n the function is renamed later.=20
So this patch cannot be applied to the initial code directly and makes me n=
ot sure about the fix tag.
I will leave it to you. Thanks in advance for it.

Shuicheng

> I'll wait on answer to my first question before merging but this LGTM.
> Reviewed-by: Matthew Brost <matthew.brost@intel.com>
>=20
> >
> > v2: use xe_uc_fw_is_running() instead of xe_guc_ct_enabled().
> >     As CT may go down and come back during VF migration.
> >
> > Cc: Matthew Brost <matthew.brost@intel.com>
> > Signed-off-by: Shuicheng Lin <shuicheng.lin@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_guc_submit.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c
> > b/drivers/gpu/drm/xe/xe_guc_submit.c
> > index e9aa0625ce60..0ef67d3523a7 100644
> > --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> > @@ -44,6 +44,7 @@
> >  #include "xe_ring_ops_types.h"
> >  #include "xe_sched_job.h"
> >  #include "xe_trace.h"
> > +#include "xe_uc_fw.h"
> >  #include "xe_vm.h"
> >
> >  static struct xe_guc *
> > @@ -1501,7 +1502,17 @@ static void
> __guc_exec_queue_process_msg_cleanup(struct xe_sched_msg *msg)
> >  	xe_gt_assert(guc_to_gt(guc), !(q->flags &
> EXEC_QUEUE_FLAG_PERMANENT));
> >  	trace_xe_exec_queue_cleanup_entity(q);
> >
> > -	if (exec_queue_registered(q))
> > +	/*
> > +	 * Expected state transitions for cleanup:
> > +	 * - If the exec queue is registered and GuC firmware is running, we =
must
> first
> > +	 *   disable scheduling and deregister the queue to ensure proper
> teardown and
> > +	 *   resource release in the GuC, then destroy the exec queue on driv=
er
> side.
> > +	 * - If the GuC is already stopped (e.g., during driver unload or GPU=
 reset),
> > +	 *   we cannot expect a response for the deregister request. In this =
case,
> > +	 *   it is safe to directly destroy the exec queue on driver side, as=
 the GuC
> > +	 *   will not process further requests and all resources must be clea=
ned up
> locally.
> > +	 */
> > +	if (exec_queue_registered(q) && xe_uc_fw_is_running(&guc->fw))
> >  		disable_scheduling_deregister(guc, q);
> >  	else
> >  		__guc_exec_queue_destroy(guc, q);
> > --
> > 2.49.0
> >
