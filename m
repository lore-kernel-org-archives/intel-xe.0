Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C27BC71136
	for <intel-xe@archiver.kernel.org>; Tue, 17 Jun 2025 21:14:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3C2B10E169;
	Tue, 17 Jun 2025 21:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bd2tJfz7";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EDA010E169
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Jun 2025 21:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750194896; x=1781730896;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=uNldKHM8CCgOv+DbGeqG/iNjJWuYI20K7k1J0Zqjscc=;
 b=bd2tJfz72KzB/65PFKLS9jbJ+0x0vm8cojl4+BPWCEEs+BmJNSFRRKOw
 s2CxtZlFDdAMxmeCXZLGtJkKckvF8YN/1txdW9BYVC0p9QThUX6mvabRc
 YxtTJ+8H+7kphVFHfitV9bMneL6Ldm3E+aqc1ptH43Vzss5+0WR5LfwBF
 NHO+sYjeaMjN9dvWaN1cTe8Iyj9UOED/t6x4OCz3DpKzBXFYG08cDTRgM
 pY7QIyo88vLC4OB4G59v7Kjr5QERYMi88f5XUtOE1eJ3A6yYeywkNxy1c
 6J2OcbovLEj0hxps2JkI9eVRf4KpDMs36t8ec986wtXrjWCfTY1GqVvh/ A==;
X-CSE-ConnectionGUID: RnBZrd89Tee3vfwaXdOXCQ==
X-CSE-MsgGUID: ypXlu/CBQJCrDzfSpbjbzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51501648"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="51501648"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 14:14:56 -0700
X-CSE-ConnectionGUID: IW8OPDmtSmG0ERXvS76WyA==
X-CSE-MsgGUID: e9i/pn1ZSb+WvrGk+WXN9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; d="scan'208";a="148820423"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jun 2025 14:14:56 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 14:14:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 17 Jun 2025 14:14:54 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.53) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 17 Jun 2025 14:14:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gzaIgrLkj4ZEt2rl9ProQKeMZA44GyRUkwaWOMpF3lcUMORNnplhWeWFjTUf2y+U73V1am9Dw0NvLHSVR+QImKeGYbJO7TUcW3mYlE5UI9iYdj3gmPq7LQXf5ZVOO+pnBcdvDHrYxvrn1ak/EYgt6bxBE5qgzmbqcjfaJ+SKYsDR5eK+XKP+UwtIyY6DLafEEt5UCV3h7zlCMT1vPxmLWmJD6NTMpNUsWejb3pl3M1ZC+AZzdaPudEEXDfbtvOjWSUIQmMM5qB0Mdx/aZTHiEzj28JqsxV2wJnpvY8k8pxYvu+dikc/WD+tFdLURAhP14Gy9GOGIoqQOs5hlt500qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ds7GcZIcbQA4XcLEe8WHdTp7hrK3pOfwEWvKNdBnDY0=;
 b=TEPv3X3jnar8DrHtI4MnHaeG5Wc8LZHXAKVsDKqzfckr9YyaMISYnTWbcVyWVkTWsX3StO2GifkdvVI+ohdAa6oQI16QIpuXWZpJS6ZqTHhw+ru7w2/WyxOBbnmo9HhpLRD5tkNaogp9cD2xjePvkPuHInvplKIayEXE1qaZ9L6VeSUF8b9RoCn6tJ6wSeC/77THAo3P+oB2Lia7BREP2Q1M/+uLO1UaM2XRGlzsRJlT0KQ7k11pkDdkvHqod/2t+d9fZgp9P8aY+Cvo/O8xDZXsa3+ugVVIlDZMS45doKsGjr/5uu0aAP8JzxzW3V0dybGC3RTjQlcncu+lZpvGgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by MW4PR11MB5872.namprd11.prod.outlook.com (2603:10b6:303:169::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Tue, 17 Jun
 2025 21:14:22 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8835.027; Tue, 17 Jun 2025
 21:14:22 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Purkait, Soham" <soham.purkait@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Gupta,
 Anshuman" <anshuman.gupta@intel.com>, "Nilawar, Badal"
 <badal.nilawar@intel.com>, "Poosa, Karthik" <karthik.poosa@intel.com>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Purkait, Soham"
 <soham.purkait@intel.com>, "Dixit, Ashutosh" <ashutosh.dixit@intel.com>,
 "Tauro, Riana" <riana.tauro@intel.com>, "Nikula, Jani"
 <jani.nikula@intel.com>, "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Thread-Topic: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie
 link state residency counters through debugfs
Thread-Index: AQHb36xiEC4Az2kbW02ntMkAyWy/CLQH2ATg
Date: Tue, 17 Jun 2025 21:14:21 +0000
Message-ID: <CH0PR11MB5444F254FE5668239A132D39E573A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250617171600.2905682-1-soham.purkait@intel.com>
 <20250617171600.2905682-2-soham.purkait@intel.com>
In-Reply-To: <20250617171600.2905682-2-soham.purkait@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|MW4PR11MB5872:EE_
x-ms-office365-filtering-correlation-id: 367c144b-ca69-4b32-f632-08ddade3ee02
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|10070799003|1800799024|366016|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?us-ascii?Q?VnQN+OIUcifaHxHyPh9swL+3nrzuzlZzSsbTvTzVODqxsFvxz3jObvZLvSjB?=
 =?us-ascii?Q?DeC3PSO03GnHvysmGOOImJJx9KpiaNHCczui84kGxq4Rdu27luoGXqK+VyOE?=
 =?us-ascii?Q?GGnpmRn/JoVReocmp1HcFJTNEVgBGIURkDUOpGj1HDvTK3FgedbgA6zd2KmK?=
 =?us-ascii?Q?vCb2lVmaQyNau2K9VntWyHuiPymfRQZuf+PqlcAY26bo5XAcY23Cgb/hMZfw?=
 =?us-ascii?Q?XIVIihqa1J6S4C2tPhCiCaolebv0Gd0Mkky7FI/ww9sGhig3pkWGUpsFD8Gx?=
 =?us-ascii?Q?tOTO6/x76+iSfY6uo+o51rjdYSbBQlRTLHsIIEQ/B1wwCqRmFHVRRnmvr2hm?=
 =?us-ascii?Q?g1xYhSdG3XmFUqdnPuAZaT9wjp30XqxFm4Pgyn3VpjIACPMJzfTi27OhJFo5?=
 =?us-ascii?Q?p6rOVIBH/poAWsZElBtCtGA/vs/DuLhQvUId098eoxwOT/lEsMye8z+LnrDz?=
 =?us-ascii?Q?KsNhPSKSbFmBf2ok5cKoc0fS8ZF6sz404KjZ0P17r503YoAuLhcCTiRNH/bz?=
 =?us-ascii?Q?X0nt+9pxtsYAt/ws2W8DzydXEX9vqb8VuLGZIqyFymXy216duOjFEMiHc6bI?=
 =?us-ascii?Q?CtHqK9jB9aLBlTE369KYMt3ZTY4GjQr+ScV8p+qAdfwYSgvc7Je6F6ZM6ozv?=
 =?us-ascii?Q?9sQNVttVfZNQDR49VuSRiLUe/PaRHJIBWS2Fon2fgPOwRXm9yxwhiHXZ/IRg?=
 =?us-ascii?Q?6kFjDKHBBU2CoUrT0HfsZMaRF+ekpCfKqFTD1a1ErOXZsyg4IUQomjN/k27f?=
 =?us-ascii?Q?PKVUNbYs2g0maQyI27WPgG3//V1v3Q21xeawB+o82SMkg2I4cFcotQ0OBDOk?=
 =?us-ascii?Q?0jqAUK7LiIIoN8pv5We8mu+wRQZRuqM9Sq2cg07b85IB/p8Ky5iVSFWMMuul?=
 =?us-ascii?Q?zGuVWUmjyZz1TKTrDD2B7A+JttyPknPbDR6T+7GTw+3QI7/IeaPV8mzyx1ar?=
 =?us-ascii?Q?C0KoOGcZ0INbrrPyLKucDpc2ixl1nolfUeL6X8W4hmIM4VUe1wJky0eHZAST?=
 =?us-ascii?Q?rjvs1f/cjkdcCsQGWkKVNhKlw+xqDY1whZlBDPTh3DnAeTwGsZXax6v09avc?=
 =?us-ascii?Q?lPKHHzuz0naqAE8EoSUFa2hOIRyLxKPWCniOrWwo0Gxx9f9rFe0LFjHZbwjB?=
 =?us-ascii?Q?my+iBQnKTytKs8cWLU8CFktPtN2cSG+0kt1td81mwDCFFMYLc3kJatQjppWC?=
 =?us-ascii?Q?gxj+hDgqxcq1knbEfLjkK6Lns5+z6a0+9U1GVDkeT9o9jaAocnQoTNNqBKyi?=
 =?us-ascii?Q?JWkqGpcrbJS8Lt81r3n0/X2L6NYR2/T0fGIRbzxD+dVpBAeqrTXXOtmHm9nx?=
 =?us-ascii?Q?gVlUT2ZlVx8maAkrVGvQsVq+P7E3VdRRb7fer1UiSXvdbkXiXGstIXZiuzQu?=
 =?us-ascii?Q?xve5phGX9AWDDjtzo1y9KL0muF+wRAaUDXJeIY7hiekzXltJCpBKvXf6Mq39?=
 =?us-ascii?Q?veRdwaG4zTn49tOsaaRQRU2pTYBwGhougTbBfQKHPuB0j5YOxdgrzYeobTfN?=
 =?us-ascii?Q?CqsEG2flo9rHuL0=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(10070799003)(1800799024)(366016)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?GZSE1LY4Qw6UMPahtEyjFN/ZMvSHewLdASPagjhu2DZA1tGYEOevNvh6ZzO/?=
 =?us-ascii?Q?vViI0zhcB08dzcTAcmFc2BVSy8+jMOMkkxoO+cBqQgkQKqbC1Y1m3zrhO2u2?=
 =?us-ascii?Q?DSyhmZ03FrMk3pmWtxMbPK6xDw8BliS08Y8scRCnpoYxEPqGRILVbdR62ZP1?=
 =?us-ascii?Q?+lX04kc1PZdYbb4Ez38mypSJ0ehM2rTWjdb6FpVv0KgI12UgTA1x2+9n+6v4?=
 =?us-ascii?Q?N9q9DpGjU8hud3verNPWPXmHmH8yxITJQQxJA47K5OpIq12tvLHr7bWqZ8py?=
 =?us-ascii?Q?ZBqTXqx937HzqaN6ORqaOrXTw4JnJxOfwHZKbU0/kdFR1q6QytyLG8oINZtz?=
 =?us-ascii?Q?SEeeOisAdI85vD5faynoQ9RR7jmF3Og5uzo487sQpjVgR2JZfnKh/0Aeh0lv?=
 =?us-ascii?Q?mm3gRMR2ZOMpA8tvtAU+PLXamqwh7QWXQIJJGmR7y/3I4nPEdxqabVNqnx58?=
 =?us-ascii?Q?XzAYx621/C4QdEHnHmEQ9nNZzP3P1G6F5lfCtFr/Roc93DmzfeIOwjBi2A+f?=
 =?us-ascii?Q?EnyklqrEb6nK8EWCT08E5FxPXH43OaEwUyvaoeRlZws6aMrnH6VOPzfizDoM?=
 =?us-ascii?Q?uhZQmH+1M1cOb2pyqwp39o/5v56KrkeUE0qK6QLJdtNXu/J6+n/nJ3aJ2FyA?=
 =?us-ascii?Q?GACiYANXeJ1odPmU5irE5ZaiITGCA3wVxpG5gU83lhZliYlAjZdhNCR+KKlg?=
 =?us-ascii?Q?dPnPZnB411HN5xnotseZ4CL+x0svm92xZOuUycGZhiZK69IciDDy+d0jL6ki?=
 =?us-ascii?Q?0SQH3blHiOr50GeuIxmjl8SxAYLLSruqN/Ralo+5/WZ2N3vga4VCSB80SiE/?=
 =?us-ascii?Q?UJ4ozJmsGMUfY3ycFKZvLUXl4yFycoHgKfYwXv8u/PnGRVlXc7mYt8nWc1hR?=
 =?us-ascii?Q?PbnirR2t8sMqDF/JSexkqKM503X7GMnD5Knl4X3ZLXjA9es6IkbrHMj0lqU4?=
 =?us-ascii?Q?CL4trckjdHZ1Cu0aiLISIzBfV2g2zEnvFzYRRXXc4N8HrtjTGdi6s57h7Kgf?=
 =?us-ascii?Q?vTH2vIz1PYhZpzpAxfYGLjInFCZCyXvT2e20vM2YbHHZbi3RJL9Vy2oCdOds?=
 =?us-ascii?Q?rXJnbYnwyoGQkBsgIKn4t7QsfSbtQtqvs+2AMIv/hDGsefArFzrVEho5ziA+?=
 =?us-ascii?Q?Dc15D141Kilta0GJrVU8pdxvfUqb0zJjxtShOCRvAMD2OeRicuBvz2QwqXdy?=
 =?us-ascii?Q?L5R5TudhNROyGtQxBlmJfHXhQodLIrK+Yb2i8CM6sjqI+anEovzo3wTr+pWZ?=
 =?us-ascii?Q?C2Ck7lfXiZdUSPuleACl5Fdk6fMTT+dLZ9195kj2/GS+ccuPlBfy6mEQF89a?=
 =?us-ascii?Q?q9MMH6tm0lYtIij7y9C1UnQrRy0fh3BcGtEBntY5KggISZKFumQ5C0A+ueuB?=
 =?us-ascii?Q?0/es9muYhRDAJrJsqI3GrQ8LTTR5C/RfE7NHuVLivuyxmOWdguODruXtP6KO?=
 =?us-ascii?Q?YtRAbDnlMh+DQTD5LRq3Uaj5fsKcoUz7aRQSse9+uA6NERFnGEx52CDAwoz/?=
 =?us-ascii?Q?zv9pAZgU6rKLbEqK7rOs2ZUVCJio95mIaj/DBp0DcfW9HPpLiyFvlymcwDPd?=
 =?us-ascii?Q?dHhlvSOgk3kJa471bAV0duheKC6Vz7trxG0Z7IKYA+tlk0TiXcQJfGV6RAvv?=
 =?us-ascii?Q?iytHAvuIWzYlbCXsLOuLUcuEMJNSM9qxD3WfjYHLAAmj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367c144b-ca69-4b32-f632-08ddade3ee02
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2025 21:14:21.8695 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YKIiTKqkhwnZ8V6erVUTKuLs2zisNbfy9TNBsrnyYaUaUdeogj2BDpXETjD9b6ar7jAziQ5Wa/3xndfxR5KolGpb1WqiKiYjXlGQB2mMC7s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5872
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Soham =
Purkait
Sent: Tuesday, June 17, 2025 10:16 AM
To: intel-xe@lists.freedesktop.org; Gupta, Anshuman <anshuman.gupta@intel.c=
om>; Nilawar, Badal <badal.nilawar@intel.com>; Poosa, Karthik <karthik.poos=
a@intel.com>
Cc: De Marchi, Lucas <lucas.demarchi@intel.com>; Purkait, Soham <soham.purk=
ait@intel.com>; Dixit, Ashutosh <ashutosh.dixit@intel.com>; Tauro, Riana <r=
iana.tauro@intel.com>; Nikula, Jani <jani.nikula@intel.com>
Subject: [PATCH v4 1/2] drm/xe/xe_debugfs: Exposure of G-State and pcie lin=
k state residency counters through debugfs
>=20
> Add two debugfs node named dgfx_pkg_residencies and dgfx_link_state_resid=
encys
> in order to obtain the G-State residency counter values for G2, G6, G8, G=
10 &
> ModS and the pcie link state residency counter values for L0, L1 & L1.2
> respectively.
>=20
> V1 : Expose all G-State residency counter values under dgfx_pkg_residenci=
es. (Anshuman)
>      Included runtime_get/put and removed drm_warn. (Riana)
>=20
> v2 : Moved dgfx_pkg_residencies from "/sys/kernel/debug/gtidle/" to "/sys=
/kernel/debug/".
>      Included dgfx_link_state_residencys for dgfx_link_state_residencys. =
      (Anshuman)
>=20
> v3 : Included check for BMG and dgfx and helper function for repetitive c=
ode.  (Riana)
>      Used drm_info_list to create the debugfs. (Karthik)
>=20
> Signed-off-by: Soham Purkait <soham.purkait@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_debugfs.c | 71 +++++++++++++++++++++++++++++++++
>  1 file changed, 71 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debu=
gfs.c
> index d83cd6ed3fa8..39c5fce3e4fd 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -11,16 +11,19 @@
> =20
>  #include <drm/drm_debugfs.h>
> =20
> +#include "regs/xe_pmt.h"
>  #include "xe_bo.h"
>  #include "xe_device.h"
>  #include "xe_force_wake.h"
>  #include "xe_gt_debugfs.h"
>  #include "xe_gt_printk.h"
>  #include "xe_guc_ads.h"
> +#include "xe_mmio.h"
>  #include "xe_pm.h"
>  #include "xe_pxp_debugfs.h"
>  #include "xe_sriov.h"
>  #include "xe_step.h"
> +#include "xe_vsec.h"
> =20
>  #ifdef CONFIG_DRM_XE_DEBUG
>  #include "xe_bo_evict.h"
> @@ -30,6 +33,23 @@
> =20
>  DECLARE_FAULT_ATTR(gt_reset_failure);
> =20
> +static int read_residency_counter(struct xe_device *xe, struct xe_mmio *=
mmio,
> +				  u32 offset, char *name, struct drm_printer *p)
> +{
> +	u64 residency =3D 0;
> +	int ret;
> +
> +	ret =3D xe_pmt_telem_read(to_pci_dev(xe->drm.dev),
> +				xe_mmio_read32(mmio, PUNIT_TELEMETRY_GUID),
> +				&residency, offset, sizeof(residency));
> +	drm_printf(p, "%s : %llu\n", name, residency);
> +
> +	if (ret !=3D sizeof(residency))
> +		drm_warn(&xe->drm, "%s counter failed to read, ret %d\n", name, ret);
> +
> +	return 0;
> +}
> +
>  static struct xe_device *node_to_xe(struct drm_info_node *node)
>  {
>  	return to_xe_device(node->minor->dev);
> @@ -82,11 +102,57 @@ static int sriov_info(struct seq_file *m, void *data=
)
>  	return 0;
>  }
> =20
> +static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe =3D node_to_xe(m->private);
> +	p =3D drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio =3D xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, BMG_G2_RESIDENCY_OFFSET, "Package G2",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G6_RESIDENCY_OFFSET, "Package G6",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G8_RESIDENCY_OFFSET, "Package G8",=
 &p);
> +	read_residency_counter(xe, mmio, BMG_G10_RESIDENCY_OFFSET, "Package G10=
", &p);
> +	read_residency_counter(xe, mmio, BMG_MODS_RESIDENCY_OFFSET, "Package Mo=
dS", &p);
> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
> +static int dgfx_link_state_residencies_show(struct seq_file *m, void *da=
ta)
> +{
> +	struct xe_device *xe;
> +	struct xe_mmio *mmio;
> +	struct drm_printer p;
> +
> +	xe =3D node_to_xe(m->private);
> +	p =3D drm_seq_file_printer(m);
> +	xe_pm_runtime_get(xe);
> +	mmio =3D xe_root_tile_mmio(xe);
> +
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L0 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1 RESIDENCY", &p);
> +	read_residency_counter(xe, mmio, PCIE_LINK_L0_RESIDENCY_COUNTER,
> +			       "PCIE LINK L1.2 RESIDENCY", &p);

Hmm... It looks like the various macros referenced here and in
dgfx_pkg_residencies_show are initialized in the next patch in this series.

We probably shouldn't be referencing macros that don't exist yet.  Please
swap the order of the two patches in this series.

You can add my reviewed-by to this patch after doing that:
Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> +	xe_pm_runtime_put(xe);
> +	return 0;
> +}
> +
>  static const struct drm_info_list debugfs_list[] =3D {
>  	{"info", info, 0},
>  	{ .name =3D "sriov_info", .show =3D sriov_info, },
>  };
> =20
> +static const struct drm_info_list debugfs_residencies[] =3D {
> +	{ .name =3D "dgfx_pkg_residencies", .show =3D dgfx_pkg_residencies_show=
, },
> +	{ .name =3D "dgfx_link_state_residencies", .show =3D dgfx_link_state_re=
sidencies_show, },
> +};
> +
>  static int forcewake_open(struct inode *inode, struct file *file)
>  {
>  	struct xe_device *xe =3D inode->i_private;
> @@ -240,6 +306,11 @@ void xe_debugfs_register(struct xe_device *xe)
>  				 ARRAY_SIZE(debugfs_list),
>  				 root, minor);
> =20
> +	if (IS_DGFX(xe) && xe->info.platform =3D=3D XE_BATTLEMAGE)
> +		drm_debugfs_create_files(debugfs_residencies,
> +					 ARRAY_SIZE(debugfs_residencies),
> +					 root, minor);
> +
>  	debugfs_create_file("forcewake_all", 0400, root, xe,
>  			    &forcewake_all_fops);
> =20
> --=20
> 2.34.1
>=20
>=20
