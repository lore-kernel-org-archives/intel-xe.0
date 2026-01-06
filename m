Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F33CDC192
	for <intel-xe@archiver.kernel.org>; Tue,  6 Jan 2026 12:44:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B02A010E4DC;
	Tue,  6 Jan 2026 12:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hA/KySVa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F02D10E4DC
 for <intel-xe@lists.freedesktop.org>; Tue,  6 Jan 2026 12:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767703488; x=1799239488;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xSjduKL7coZUcSQ3PlQY/IMrRDfj+4YjvptkO+mFZIw=;
 b=hA/KySVakktpIWqiXY9qhRXZa7uE6mEFCcDnlYhaFU5MUuq9ztf0KFD8
 NLxwfDitdJjbhVr52sskK7P/0JOQbASod/wNwfcHq+M2zywYAbuhWCERy
 xFjAsjZTTz2HXNlQ38CD9onVm6bHEhVH6tqKT5crpDyzowOEZy2+siTP4
 WKhamNk+1I7qzYTA7bgsSPqsgLDZppvC/DwOPBBgdTVfE5t0nUE7SP59O
 3bvl9rap/d/jinlcqEyk3g1q4fHGHxHkUv6AsmBQswhVR8T6PKm4ooNRl
 dHEVBRjhwLZnTH6lH16MSfScXuMvL9qKCo7svu8n2CFxHQ0DrCqD1owHY w==;
X-CSE-ConnectionGUID: /pqr7szgSheI1JVKzRJq2Q==
X-CSE-MsgGUID: FhPRsNBYQ3yosMUe9hwEsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="94536848"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="94536848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 04:44:45 -0800
X-CSE-ConnectionGUID: 6tbl2oJ8RFG+Bm3fKb5Xhw==
X-CSE-MsgGUID: iOfkZidJQtiTkLe+c5w3Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; d="scan'208";a="202422400"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 04:44:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 04:44:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Tue, 6 Jan 2026 04:44:44 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 6 Jan 2026 04:44:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DuAfzcd9hPZCOMN2O+uG8lTP6VMKODZOLnfQf+hqzdHp2z4NSUCzgZ+04FSB+aF6R0W+eFeNt1N//JkIXTF27Y6ExDaBqd+G6g4TGdkuyzjV6bHTkyA7yNXUKGknN/lFPWygirKgr/LGNDUdFvLPozN5/B7YY6BdRhmsn6tdd3EOquaXHtNBV0JG9R2V9KTD4xTYXvdN3hSCqARnd9/rbPDVUBvHZnY7sDR89qDsyUNXP4YBoS5vcgemJi3XF+vOvXlpLDGGUgC4IgzMyfXrT1e/6nHIR8Zuf0f1yYi2LGCbHWrIXO87wdmKFirMEmv72HRKDhCeNEAYSU2McU8Iow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r3whT8lfc+SfEXAUlngziwaPc59/ZlihwLLyGea+hos=;
 b=BUfTkqLFTmOfwnxg5boZcTPXMzbWB0uw/uhiVg/DDai5SJpxF+d+FSzIwkLOZGFw6A9ek8HsxSf6HGJuTzPpcEJSJ5bYSwq9Csc9UQWL4DlFGfyowinT85NsAv8fUP1UKUVe8rIUPNdMX72ACjbW02aPqUnrPMi8LC/5DDJVw5f1jOPwxZ5TJ2P9IMQ0PqbMpiwKjIm1jS/034YtmKJnhcj90xjJWHr7DSQmUx4c+vvqyEZqjtmGkdSHo40LBWj9rN5bvRKHJW1EuhtciCzV8Pceu49IG8XxH+JUBZmsn1zWZCw4NBnbv/SOWG3cQWbDHahsm229HDAwT9v+NHfE4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by CY5PR11MB6365.namprd11.prod.outlook.com (2603:10b6:930:3b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 12:44:37 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9478.004; Tue, 6 Jan 2026
 12:44:37 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Thread-Topic: [PATCH 2/4] drm/xe: Add explicit abort page reclaim list
Thread-Index: AQHcfpvUSSwvj80DuUK9AWcPoKVA6bVEabQAgACiPSA=
Date: Tue, 6 Jan 2026 12:44:37 +0000
Message-ID: <SA1PR11MB8839FF6F7FD5B106961281B3AA87A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20260105233351.3753716-6-brian3.nguyen@intel.com>
 <20260105233351.3753716-8-brian3.nguyen@intel.com>
 <aVxyKJf2fWBmISqL@lstrano-desk.jf.intel.com>
In-Reply-To: <aVxyKJf2fWBmISqL@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|CY5PR11MB6365:EE_
x-ms-office365-filtering-correlation-id: 92071925-6351-4a09-f3af-08de4d215a37
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?IXSmLMfND5F7RkqdCxbc3AzjFXVFQLj/zTsOfWHNI1ix7JkY41IU7vBh1X6z?=
 =?us-ascii?Q?rdwRVXcIo/TsKKNzJa2pIQEPPdyrVnyMOdSJ0q3KXaJsKfySf49U6e7pue/b?=
 =?us-ascii?Q?mmhE68Ky1MbwCtsWcVYK7/N5v7mBCGf9cEs28dm7bJKNHmP2CmGaUFhnc8q5?=
 =?us-ascii?Q?9E4JTbDcplf6EP3m/F7J97erDTWc7H8ZMBBMyC3/1FvAYM3Su7wwU+1Uh4hk?=
 =?us-ascii?Q?qXLbeL2hE4Yjf5hBp5NQT6aCA4TgTIvpCmgm9LgrA8Y7EUwW1306/ax1ciEa?=
 =?us-ascii?Q?r0853+YHPizbNVzP86UGrFOd/owXpN/EPKExfDmTs/ZOU7HPoZp2Ef1NjaEu?=
 =?us-ascii?Q?MgoVl1UnH6B86TknhW+EGh/aF/7cPNocEdH1lLDNIARM1zR7DbjFSV9AcDUz?=
 =?us-ascii?Q?yYmGAPWgDElUHXGU05LeTPnb5Ki6Pt+RHWDlfBi7U5Jnh4r2N47bTDx2CGLb?=
 =?us-ascii?Q?ltKV0QsNlGbkYyKe5fLzuEhHIiseuK24OrQy1rEd81xVFFWwxfwZVhaqKhaO?=
 =?us-ascii?Q?pV9nKQ0jWjKldvXY1E8GGETQb2eJ+NeijA8WpqUHbIQorematipNBffIyAgm?=
 =?us-ascii?Q?kXHQd8ZyC9aTM/oB0uDqzYnlelIe+ups1I4yaGWJez3SJ4HruCbOtD6N7UN2?=
 =?us-ascii?Q?VDK2zp/Ju26GGEFPbc/WNWXXMaFL9OHrpExRIBqk4I9AFRFuLObWXFG5PLcv?=
 =?us-ascii?Q?Cm5Eb1/P82CniEKAPc3yiIgXk2PbKlzvTQdh5crrHccP5d8BGSzmsHlP9E8h?=
 =?us-ascii?Q?ncWGaCQxzfSwuGeQCiWaNUbnpFaOzDEtemL7/FJgcmBF1MzsTvQ1UDvN4vZx?=
 =?us-ascii?Q?wdDU61X7docnAWfi5g8Pr4is9e9JymVH2EBiGG2W90+4zh83uRra1rqoHnY2?=
 =?us-ascii?Q?IJ6ddvYAtLzJFCdlOnJKO2WM/VmAf5OWzmWb1ALxW7+H1r4b8pUJrXQkgOdm?=
 =?us-ascii?Q?L5KIBooG2jEeZVXI3N/zgMop54lgsW+ajttUpB/dmUeUI4xDMDaSO6zgxm7a?=
 =?us-ascii?Q?8egFtb8hfv+xSsF+j1xODAVnAVBWuh5JIZUyA0PdiUTPQ5LqhdjZCLSQDg+o?=
 =?us-ascii?Q?bYyfKLZCPOGrsS7pH5WITXPp6bQLaApHB8MkFszAmp+KGoB3aUlBDkGr486u?=
 =?us-ascii?Q?LhV3Y/g74sN601irP+lDYtNADVN/EuczuUMwCzBl+EVtcGWlwIu3q/j1Ctra?=
 =?us-ascii?Q?S6La7YvRdJE+W/i/quxh7xA0uTtqeE4xP2LQs6lET2EwUo/sYmYDhLPL5AO+?=
 =?us-ascii?Q?X22zN1bU4Pv75Dym8wC1N+6pCDzhHNe9c7umSiNfTDtVqc/fPO87jXpC6HJ3?=
 =?us-ascii?Q?A7C+bPllLGNPOUL5HRpsmCUQ/6eE6KngeysZopzNanShzPL+QLEAug69Az0I?=
 =?us-ascii?Q?OGmTZXgumNH05l2aoSKoaTMVvpTbXka0H+0dwp+rpDhpea2wfnl8pytCiOzx?=
 =?us-ascii?Q?jZ7XoGe7cBA8D2ZOJMrel6RF95uwoN8WvMIrEoeY4bdAQLE+mfpT1keATD02?=
 =?us-ascii?Q?g394p4FrDrXxsDAlemtddIC338yKDE1RIA9T?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v0UMCiTJ6IJW/NvZYIFsIAyFFCcxO4ealnTkHzvPNNhpeS2NCAPH0A7Jhwde?=
 =?us-ascii?Q?Ry2X3kzPty3aHQA4Pm1D4csfRwBVflVz+OutnVmOdhKe37tPHma3ufnFCaxy?=
 =?us-ascii?Q?86szU6gCd3HmHgcDkRZeD3MB66TJ+dRZu59T5HQkZwbccDtL5MdPgM3eqojs?=
 =?us-ascii?Q?OnkHSwxeEeie4g5RZS5xnDaeP7Zg4Fl+h/nr7zD45A5DRROWxjDgwsDPfCeO?=
 =?us-ascii?Q?3w2Ks3kp3Ke7w8H7GSz/p4L+YvyimqOc0XRQ0v30Ih8yt60V+/5LgqnXfUTZ?=
 =?us-ascii?Q?XRGIlf8dS+swrgwM/mw+1JdnPBE1kyUp2EdcJCXzj7Xq60eIn2UXtjz8eghX?=
 =?us-ascii?Q?LnDojPUenf8eqKL05opJXziQ2t7qFjG6m9rGN1qscqXJ9rSLkBrES31rM0JE?=
 =?us-ascii?Q?aOqv6hrPqA24kCmJQ/ekq+e5kLstuX+q1Vn+idlwctHarFpalKVfRRYqqb3M?=
 =?us-ascii?Q?TFx0jdHqL+Ct7Hgehm+yHmFcbs5rp5TmfR4Aeix4Dh3tWAtiYuLosj/IZE4x?=
 =?us-ascii?Q?5ir8E5Nog5nLccd3RuM4AIpPehrO3LSG30SgzyEoGb31Ts4m6C60KvMs9/2q?=
 =?us-ascii?Q?w3w8l1oQCcPf6O3JUbx0oF+o6t2R+mNyBlQOsV+Qep02JfJSQPMadMFJToCA?=
 =?us-ascii?Q?/py2I8vILZal6GUmV426fR8x4S+SbLa/cauPC1imybxW9YEB+bpGyjLxmAYV?=
 =?us-ascii?Q?vS51Mb2E5oo8yiBYwJXZdeGJ7A0691qAI6cg+BT2EvZQ+qJQ2NpsAp7QXqa8?=
 =?us-ascii?Q?05cwlteSC44pdrt1YgfpSvYPTKtFUTxw0XXKgNxpiGDf7/lD0fiEy0bKEl/d?=
 =?us-ascii?Q?r7l3p0XJIPnIIcRchpb2XtbLhRilk1QGKTOIX17Lqnrv/2VF4t8R399quK5v?=
 =?us-ascii?Q?0xbumxZmtbuOLD4COYH5G56Lxz3B30zWy64wRQZ1TOiMu8Xk7V/u0NV/7dhq?=
 =?us-ascii?Q?99aqgIWNBzonNqT0OT9zJdjtIGyCSRD078hjyo81SmVNgHxkI1RMYKl1P4e+?=
 =?us-ascii?Q?LbGVw4CeyekOQtWzYhDrVeGSBodFNfBTeNjnw3UGVsEm3uqE9/Q8l00KPNsM?=
 =?us-ascii?Q?oVhvLPSf9FfRFOJrt4zdXRjRrn2rVSANPdjUwYcgKp4UPNmmY1tacEPOsW2b?=
 =?us-ascii?Q?qHSFKad5IyyqB+2mj6P/XZPRTX/v8kc5o8ftmLT18zcopphHlBj03d+hnPzi?=
 =?us-ascii?Q?0P234E6FCNM9unEoiwr3tQ5QH2rNXbea6eE40DqlBn6qCVcGz7KKpOlALrAO?=
 =?us-ascii?Q?2LD14Fa5iPJNdtt1V5wyEn2FmKj9YNmdVUjd1pCs2XeYFj89OkYhVMMNw9Lx?=
 =?us-ascii?Q?dN8mx9vzsJDFc/TDAMZve7bFpNq8cie7J1z7eRiC9NcIrbsDGWNrbvHMOZ6p?=
 =?us-ascii?Q?tGaoTrSE3rqQSNUQ4fB71jegca8TddMc7NFEdESzuZd0K8I1K7wwlszPiboe?=
 =?us-ascii?Q?pSbsyGqbHCnFG4reggaUoX5t9MARd/WeB7BTp7i0T5abCFrPpyzTx3yP1bgK?=
 =?us-ascii?Q?MSH/JpcwrEqmu5aj6xQLPuU2/7qVKw0FQASJ8so8JmEAGc9dxYL/NMnEvfPP?=
 =?us-ascii?Q?mBIjXpe0swZ0f5L95sczf/iZZClngrDxnEeuyj/wjytY4SnMSECfkXlNJh/7?=
 =?us-ascii?Q?6/Z2wDi+QdM+YzySdBGEW/rLRe5ykD3dZKWwj98H7QpTAMnyMDuDvkaHvVfp?=
 =?us-ascii?Q?eBjDRHLUitU+d4dxoAA+IrKeO7iuI37U+aIM/Kw+zZ7Y50YbSJ+K0S1NusQ3?=
 =?us-ascii?Q?LM3bij+P918vbzujCSw29AXtSbxp7THE1dtk5RTajyMmnSXhN3OQTVMIAop1?=
x-ms-exchange-antispam-messagedata-1: jDysTXX1z8A0OA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92071925-6351-4a09-f3af-08de4d215a37
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jan 2026 12:44:37.5739 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kqLJOWNZxtKpYXdX9KzXWFiRIit08uG9olUYO/Sn7ED580cFMwTfHlnCMNChxHY4UNRQhlTkyAd3YLAkIi2NHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6365
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

On Monday, January 5, 2026 6:24 PM, Matthew Brost wrote:
> On Tue, Jan 06, 2026 at 07:33:54AM +0800, Brian Nguyen wrote:
> > PRLs could be invalidated to indicate its getting dropped from current
> > scope but are still valid. So standardize calls and add abort to
> > clearly define when an invalidation is a real abort and PRL should fall=
back.
> >
> > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_page_reclaim.c  | 23 +++++++++++++++++++++++
> > drivers/gpu/drm/xe/xe_page_reclaim.h  |  3 +++
> >  drivers/gpu/drm/xe/xe_pt.c            | 21 +++++++++------------
> >  drivers/gpu/drm/xe/xe_tlb_inval_job.c |  2 +-
> >  4 files changed, 36 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > index 94d4608ebd74..9f086067a4a1 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.c
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.c
> > @@ -100,6 +100,29 @@ void xe_page_reclaim_list_invalidate(struct xe_pag=
e_reclaim_list *prl)
> >  	prl->num_entries =3D XE_PAGE_RECLAIM_INVALID_LIST;  }
> >
> > +/**
> > + * xe_page_reclaim_list_abort() - Abort a PRL, invalidate it, and log
> > + * @gt: GT associated with this PRL
> > + * @prl: Page reclaim list to invalidate
> > + * @format: printf-style format string for vm_dbg
>=20
> @fmt
>=20

Got it.

> > + *
> > + * This is intended for PRL abort paths where we want to track
> > +aborted PRLs  */ void xe_page_reclaim_list_abort(struct xe_gt *gt,
> > +struct xe_page_reclaim_list *prl,
> > +				const char *fmt, ...)
> > +{
> > +	struct va_format vaf;
> > +	va_list va_args;
> > +
> > +	xe_page_reclaim_list_invalidate(prl);
> > +
> > +	va_start(va_args, fmt);
>=20
> If vm_dbg calls va_start (it does in __drm_dev_dbg) this won't work as ca=
lling va_start start twice is undefined behavior. IIRC, this
> works on some compilers but not others so as soon as kernel test robot tr=
ies a certain build we will get bug reports. The W/A here is
> make make xe_page_reclaim_list_abort a macro.
>=20

Interesting... got it. Let me work on switching that to a macro. Thanks.

> > +	vaf.fmt =3D fmt;
> > +	vaf.va =3D &va_args;
> > +	vm_dbg(&gt_to_xe(gt)->drm, "PRL aborted: %pV", &vaf);
> > +	va_end(va_args);
> > +}
> > +
> >  /**
> >   * xe_page_reclaim_list_init() - Initialize a page reclaim list
> >   * @prl: Page reclaim list to initialize diff --git
> > a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > index a4f58e0ce9b4..2464268dba69 100644
> > --- a/drivers/gpu/drm/xe/xe_page_reclaim.h
> > +++ b/drivers/gpu/drm/xe/xe_page_reclaim.h
> > @@ -19,6 +19,7 @@
> >  struct xe_tlb_inval;
> >  struct xe_tlb_inval_fence;
> >  struct xe_tile;
> > +struct xe_gt;
> >  struct xe_vma;
> >
> >  struct xe_guc_page_reclaim_entry {
> > @@ -75,6 +76,8 @@ struct drm_suballoc *xe_page_reclaim_create_prl_bo(st=
ruct xe_tlb_inval *tlb_inva
> >  						   struct xe_page_reclaim_list *prl,
> >  						   struct xe_tlb_inval_fence *fence);  void
> > xe_page_reclaim_list_invalidate(struct xe_page_reclaim_list *prl);
> > +void xe_page_reclaim_list_abort(struct xe_gt *gt, struct xe_page_recla=
im_list *prl,
> > +				const char *format, ...);
>=20
> So I think here, make xe_page_reclaim_list_abort a macro in this header f=
ile.
>=20

Got it.

> >  void xe_page_reclaim_list_init(struct xe_page_reclaim_list *prl);
> > int xe_page_reclaim_list_alloc_entries(struct xe_page_reclaim_list
> > *prl);
> >  /**
> > diff --git a/drivers/gpu/drm/xe/xe_pt.c b/drivers/gpu/drm/xe/xe_pt.c
> > index 6cd78bb2b652..2752a5a48a97 100644
> > --- a/drivers/gpu/drm/xe/xe_pt.c
> > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > @@ -1618,10 +1618,9 @@ static int generate_reclaim_entry(struct xe_tile=
 *tile,
> >  	} else if (is_2m_pte(xe_child)) {
> >  		reclamation_size =3D COMPUTE_RECLAIM_ADDRESS_MASK(SZ_2M);  /* reclam=
ation_size =3D 9 */
> >  	} else {
> > -		xe_page_reclaim_list_invalidate(prl);
> > -		vm_dbg(&tile_to_xe(tile)->drm,
> > -		       "PRL invalidate: unsupported PTE level=3D%u pte=3D%#llx\n",
> > -		       xe_child->level, pte);
> > +		xe_page_reclaim_list_abort(tile->primary_gt, prl,
> > +					   "unsupported PTE level=3D%u pte=3D%#llx",
> > +					   xe_child->level, pte);
> >  		return -EINVAL;
> >  	}
> >
> > @@ -1670,10 +1669,9 @@ static int xe_pt_stage_unbind_entry(struct xe_pt=
w *parent, pgoff_t offset,
> >  					break;
> >  			} else {
> >  				/* overflow, mark as invalid */
> > -				xe_page_reclaim_list_invalidate(xe_walk->prl);
> > -				vm_dbg(&xe->drm,
> > -				       "PRL invalidate: overflow while adding pte=3D%#llx",
> > -				       pte);
> > +				xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl=
,
> > +							   "overflow while adding pte=3D%#llx",
> > +							   pte);
> >  				break;
> >  			}
> >  		}
> > @@ -1682,10 +1680,9 @@ static int xe_pt_stage_unbind_entry(struct xe_pt=
w *parent, pgoff_t offset,
> >  	/* If aborting page walk early, invalidate PRL since PTE may be dropp=
ed from this abort */
> >  	if (xe_pt_check_kill(addr, next, level - 1, xe_child, action, walk) &=
&
> >  	    xe_walk->prl && level > 1 && xe_child->base.children && xe_child-=
>num_live !=3D 0) {
> > -		xe_page_reclaim_list_invalidate(xe_walk->prl);
> > -		vm_dbg(&xe->drm,
> > -		       "PRL invalidate: kill at level=3D%u addr=3D%#llx next=3D%#llx=
 num_live=3D%u\n",
> > -		       level, addr, next, xe_child->num_live);
> > +		xe_page_reclaim_list_abort(xe_walk->tile->primary_gt, xe_walk->prl,
> > +					   "kill at level=3D%u addr=3D%#llx next=3D%#llx num_live=3D%u\n"=
,
> > +					   level, addr, next, xe_child->num_live);
> >  	}
> >
> >  	return 0;
> > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > index 6a7bd6315797..b8916552101c 100644
> > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > @@ -182,7 +182,7 @@ static void xe_tlb_inval_job_destroy(struct kref *r=
ef)
> >  	struct xe_vm *vm =3D job->vm;
> >
> >  	/* BO creation retains a copy (if used), so no longer needed */
> > -	xe_page_reclaim_entries_put(job->prl.entries);
> > +	xe_page_reclaim_list_invalidate(&job->prl);
>=20
> This doesn't look right or at minimum is unrelated to this patch.
>=20

It was a thought since we had an explicit abort func for PRL, I thought it =
would be better to use
xe_page_reclaim_list_invalidate to properly invalidate any PRL that we woul=
d no longer use since
it would've been left in a state where entries are freed but the num_entrie=
s still have some value.

This would just be mirroring the logic we have for page reclaim in xe_pt wh=
ere we invalidate the PRL
after passing the list to the tlb inval job. But I can remove it in next pa=
tch submission unless stated otherwise.

Brian

> Matt
>=20
> >
> >  	if (!job->fence_armed)
> >  		kfree(ifence);
> > --
> > 2.52.0
> >
