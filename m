Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3A21C87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 16:38:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CEB010E00E;
	Fri,  8 Aug 2025 16:38:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="d4ggYgZa";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7663410E00E
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 16:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754671136; x=1786207136;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FEI5hcgzqiKUCwLf0brGob/dxwQ7VmUdELM3RaeX2vA=;
 b=d4ggYgZaE2iNaTHc98iKVy3rxaVV5twclfBj2aEqkvOb0KQyixy1IfU/
 3oRQ6lrtDo57hLX6sTRzqfk7m3KeGBlMR9iXY6MR2lRWosm8f41gQF59R
 RWpEWXyGMvN0cQ3M1q7DvocKJwG9exZMFucFYzprxjMdBeZHh5qeagnJm
 oE9QiKNcYpVY2kKqNABPE/nvGG1zgHvu1+DjYo7Sfqc95xNFKNQ7+pCjm
 +g1XhR6BQKGX3rTvDYrDfiC1EBC7+08vXmWAio2F7EeTDIddDNG09bwWp
 qHy0G0qKwWmmmxquF4s/oADLFKFQVd+gpjh8q6SLc+2i+V/n92tl+Hd4l g==;
X-CSE-ConnectionGUID: hQiRielxRjKWnAnDBw9s9Q==
X-CSE-MsgGUID: sZEwagmaQeKdOl+23HSsAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="44615115"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="44615115"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 09:38:55 -0700
X-CSE-ConnectionGUID: nQLfqOc0T3+f5dVWmv798A==
X-CSE-MsgGUID: fkV/yXGNQC69bd2Yl3OQkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202546591"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 09:38:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 09:38:54 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 09:38:54 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.84) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 8 Aug 2025 09:38:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OwL+n5auuPyV9gSk91v8ekxr7LEnB8IDHljZW6vCu3r3dq7SqFP13D8kZpKr5hqBS7yloOi1OuFN1wcMYbW+RW90T5CXzYlwpK6a7pCIWKSCPfs1sOtRfyIZ42/TRVCWCcCr3bxWFsHE4NVnCthsUr2m18HT9VyT7Mj2V22PRe7nYuNzd9wHakwZUdLZaxfSqaQMb31p6EDUOuuoPbVKwNOjTgqCBlUSZ0K7CeOAh4a+0kFcBBRguDInSWxiTDVp5SUcHbqP8GmKw7TcZmiiHDuAPe2jvxlyV0eN7oflpOQIkRuhA/q7n/NYe9H77PJJJY5WV/4Zhj/tba47lIU7rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FsudHJY4foIiLuivBNNTua/yaPwnrCmivp55r45goPk=;
 b=p5trPMoJ35A31MzgKXuXyL5LHiYHHcNxzOom2u/GurY+hrkWmEQqh1lsNxMr6B3oThn1M2Q1FqfnRzIrmLYrtNfntcJ8Tu4KHUAgXci2QeH46hNbzXwSvQAsTy0Tx8QkubY3a83z3eCT+MagVx418w0Gofle52MDAMs6P6PaEGg7lDikVnqX+9Y6C1NusCQw67X8Z13nJsMFFjwDRdG1T4AZ6YuuehSfntj8J2yreHc4ecHkM1BKwly20OEcgifjLSHLbFgACi6fZdUpKso1Rr6n6cUr6DCDQ4k2GsVscLCgtRpiTiQ1nPw8BG1asCSR6n7674xgHHdtItlQXNZwCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by IA0PR11MB7354.namprd11.prod.outlook.com (2603:10b6:208:434::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 16:38:46 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 16:38:46 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Jadav, 
 Raag" <raag.jadav@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Topic: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
Thread-Index: AQHcCHpUiazjFaN2vUyl+0vlOLtOHrRY5ubA
Date: Fri, 8 Aug 2025 16:38:46 +0000
Message-ID: <CH0PR11MB5444BBA27D5721E678A79870E52FA@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250808153656.67098-1-stuart.summers@intel.com>
In-Reply-To: <20250808153656.67098-1-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|IA0PR11MB7354:EE_
x-ms-office365-filtering-correlation-id: 70e89c31-f911-4967-9b95-08ddd69a0b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|376014|7053199007|38070700018; 
x-microsoft-antispam-message-info: =?us-ascii?Q?zbXlgeZuThygUugnWAomcM0u4gO7ShnB6CGVksHkhyWUPyPicu30c4K5WAgN?=
 =?us-ascii?Q?FUpEvSx32CrGX/0bPvgR2FJdDucklJY94HFdKR7Fxc4c8/X6xEijBxLQTdK3?=
 =?us-ascii?Q?XfcKngy4iNl4HaDNuwberm5kPUkTD42XA7NlohXiV/LBfSW4wEOY/QBjM4Pv?=
 =?us-ascii?Q?J0Tdo28Fwb3ULT7Q9+9MhqVa+kHdrQtDdNe9xKY3gkSY3DMKkL8BKqtYcXEf?=
 =?us-ascii?Q?n8Skq0K5hGnnbuQo25gwCL344xfxaNtKjlCigwPmf90DgHnZB6GaaxbCyiSe?=
 =?us-ascii?Q?ce0whoTwv7Y6qDBN8LsCiUbNa4U5a6btYtKtx3pQzXC/yV1SB/RrZLU0mSfg?=
 =?us-ascii?Q?RDjTbaKKDa2wTv9e0JvaNqj6Q4ruSn6S0QhkxXIDV5e+8ZIbJsWzHd0Er+TD?=
 =?us-ascii?Q?g7cwkV8ZMGgmoWFSxp0qQNxoLAGiMVfwxau2zfbwMOvL+2PgZV4eM9iqafrO?=
 =?us-ascii?Q?eIQPQ+NPfqzc2jseG+bzMqAoOYyD4b1mhMb1TScUylTfTUP23+mhs3lnsb12?=
 =?us-ascii?Q?/G20x/DEyWpb6tvz51yc9vGo7TwGwoRX8i1bORzxmvAKlY1FhOnwbQ6VaoSF?=
 =?us-ascii?Q?MIIKp3qdjyHjqzmLQGrYndgzqkw7SB6FTW5QnYVjJKfDMfhKTu5lvTMfNlnQ?=
 =?us-ascii?Q?EKCxHX1QFZ0qRsDMn13uxbwmHTk9/E/2gXmj1t0U1xUb5gk6ep3SytuXRmYJ?=
 =?us-ascii?Q?0BGzIQfPtr5mFcPhL53EETQIRarERPEppnwMc8CJzfRi94LW/RuHUrR9/f5T?=
 =?us-ascii?Q?D6GPHoX5jP1HBND1DeArLAodh9IJ+HPqqPDU3z+2bljT+qJOzliQY5K1i+Sh?=
 =?us-ascii?Q?ZeVTP0t1GS677feXjp4e6lwrebmVhuJ3+c3KFR8/YLUw4dX8mutFvDyjXiZP?=
 =?us-ascii?Q?ioJg9KB8t46zzdS8jK8NJedbL/CVb/Q9aCxt//NcD4Q04q0xGcrCALxapfMi?=
 =?us-ascii?Q?xE2WXRCS/JMCVLmv5vJK2EqWHaY7pHtVzW9dKyrri0jFg4GyDyrZ1CDnftpl?=
 =?us-ascii?Q?D/vFOFpVXBBj3l6qTvqXWgR2WIyzyCHDYonNcdGioW+Ys9IDpM4kCGSp7JAj?=
 =?us-ascii?Q?3aiFpkvDyiKF6Gl0inS9SVk0iNfxXwATmLhzev+4j7l1VLb4InsEMI2UTkTK?=
 =?us-ascii?Q?jmkoDFh7TlY2CJX6/iPk5ONFrNeOyXFtUp4rgFd569OxVVEXXnfk8vAlnKYU?=
 =?us-ascii?Q?QjJV3Xsusozp17/80R8VJt4hBijtdW0r8rcU29WerhrrNwpTnKVULrg7DrJe?=
 =?us-ascii?Q?d/5t/9s5/V+J6G/iJxWsdDJS31HYyVlc4NczX+1fWWUqDftLorHoB9c4PEnX?=
 =?us-ascii?Q?yZPiaY0mjqM619aiO4TJxYNAYJWulCh4hu/vwho79FS+z9VJEZS8AIV/hKCN?=
 =?us-ascii?Q?MHGo//4LR8yR4EQVomALF1mXEO7wprw+LiLBa26nAHg1SRWM3rIkxq0TS9mC?=
 =?us-ascii?Q?7uaWN8HrwA6XRbgX5vxCXgp3pYSGp9q0TQYzbsbMHVISHvxGMH2D821c8NvJ?=
 =?us-ascii?Q?+bTwgWfKNQfu45s=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7053199007)(38070700018);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?D18h4Okz7nmi5x+TIa1UDAtZRRyo/fSobWHhY6efdpeVU/jICgvHQxc+YL3R?=
 =?us-ascii?Q?apClcBY771TN9hd4YAjqhjmrhoOscRNx+cYZnEd4fbQjkzouWWgcV8YU96wy?=
 =?us-ascii?Q?jWsXREkR2uoRc+gtHFUZ2oafXjtIKAg6ibA85YoShuV9Rw4G327lqmLTHMRI?=
 =?us-ascii?Q?pdjVELleiR71eTYf3FR9mVtJGSp3uH5qie+65w+HeLpKlusQ8o2VduBv3s32?=
 =?us-ascii?Q?f9+jvnTEIi1uyTVQCJ9EN9KBy+z8sT6cVsL3K4RDbFPdRHIDy0gVijlqqFJm?=
 =?us-ascii?Q?On3eOxNrC+iao2sclR9xelD0WtBugsLJtWhLvrmGaWHCxdoCuds3UlRU5HEt?=
 =?us-ascii?Q?oES9bGLu9sf2l702FZi/3/QdB35M/AJUzMb0m5+15XGL7nPgzxDf+bjZITRZ?=
 =?us-ascii?Q?aP3lngEPeMD95X0X5vSBjFC8eI/Pz4dtvHBoSkvP3XyIzRPKqmM2dKvRs2EY?=
 =?us-ascii?Q?d507PcW1d+RiYVODE31ENbXkHmX0dr0wwioPkN1WDi2ie8D/TgO19hT1wNKp?=
 =?us-ascii?Q?A4dlsk2s2YMgERay1hdQtC9NBhdRtMMNc3nX98FswVUp0p6NjdhAUAXX8LXL?=
 =?us-ascii?Q?AHEtZoERyd/JX+ZGWMZ7sCsEXmTpkX9mZog/7RFNe+Wmjh5lKA9CKSeVihSr?=
 =?us-ascii?Q?dG9m0C0tkLb0GOC7LdjVkbO8KqUmOy6cbl4z0GQvH7ULPv0fI/WkSt/K6hjf?=
 =?us-ascii?Q?VaSnTRX6tTgDMSJCoq9emPmPd0LX4E8XCBQ3TuHADQuHIIyweJuz99ZlzYx/?=
 =?us-ascii?Q?POOEG8gKFX8WU6KnDdbgOrojAWFb8hEt69RvmbYk0CulRrbfBenY6gIh6b3U?=
 =?us-ascii?Q?Djwb0dDXwBR/UpSH4q92Me2SBlB1AmpPKJeBJlafNPvfm/0jH+37MdIcOIq+?=
 =?us-ascii?Q?ArfIXCtkJ0nXFExOboMYNmF3oiv2EB9gGWiRaMzoGIbXx+F2/3XtjJYiliMQ?=
 =?us-ascii?Q?4kpQl6JPisEwZbwn+JyFD59sYkmVcNJAfBppn2G2Qjuje3qJeqf5ldTsMzSN?=
 =?us-ascii?Q?TerzuaDekgqxCeObYzM1V1JuQr1QyTaGTzbtJM8serpsPfvpeRcC00z4Vhcs?=
 =?us-ascii?Q?uRUEWwXhgcGABzwlWpDdP2hkS7mXIwycyX5qc3kN4BvTXWQRRzlv0Xj38dyo?=
 =?us-ascii?Q?6c2sl2nvPrKx1SYhcuSLHNV+kEgs+KFtppCOw5ci27dd+dqb8jsct31wmTKe?=
 =?us-ascii?Q?NYhRlAiVrjEjSrxUqqNHQyeKMckp9F1Qg9oiG0J8q5kyCh1UR7P6xJLlGX39?=
 =?us-ascii?Q?i7os5LFykH+9xY3CCESSMJN3hTbNeKC5Wb9z6aEVonIol5Z9vYef9WWkrIAj?=
 =?us-ascii?Q?CrzNDNf89S6JGeLZuzmw2B2wKpCFqVQvvlM2BPz2xPAePWpDzxscm5YLTODw?=
 =?us-ascii?Q?+x+k6XoY6pOtA5GchXo8CnZALlXxj1N07uM5a8GAoOKKW7Fgql+WPvHtOliV?=
 =?us-ascii?Q?VeOIswAZRTrxXPf2cPB2Dez5llvn4k5ZpgTsXQgYurws2rjbTsHlpvVHpZAN?=
 =?us-ascii?Q?Vvbc6bmVekY/eGw8jDpECA5uyvQ5yxgd5eLbhUABkKWaYFqMPLcNRPzFkht+?=
 =?us-ascii?Q?PrpMBi9a/ktTXvBg1cfaRFm2rfPA2ojHDDk2jxyNh3vfEk9f1qZJOxlI2joa?=
 =?us-ascii?Q?ioskANOKImyVaAObQ20/2MABUzkhYtLlaONb/t1NX22l?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70e89c31-f911-4967-9b95-08ddd69a0b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2025 16:38:46.3463 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0vd/aTtprqtEWHNoP5BjlcJndpGdAmuCWrixLQ9F5Z/wxNp8Rtp+vSzbDN+7fmSZX3dTVdvgoQ2rIodFn5kwAdV756ytG4PeYB3KRA+P5QU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7354
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
From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of stuart=
summers
Sent: Friday, August 8, 2025 8:37 AM
Cc: intel-xe@lists.freedesktop.org; Jadav, Raag <raag.jadav@intel.com>; Sum=
mers, Stuart <stuart.summers@intel.com>
Subject: [PATCH] drm/xe/pcode: Initialize data0 for pcode read routine
>=20
> There are two registered filled in when reading data from
> pcode besides the mailbox itself. Currently we allow a NULL
> value for the second of these two (data1) and assume the first
> is defined. However many of the routines that are calling
> this function assume that pcode will ignore the value being
> passed in and so leave that first value (data0) defined but
> uninitialized. To be safe, make sure this value is always
> initialized to something (0 generally) in the event pcode
> behavior changes and starts using this value.
>=20
> Signed-off-by: stuartsummers <stuart.summers@intel.com>

s/registered/registers

Debatably, you should also add commas after 'Currently' and
'However', but that's just a semantic nit-pick, and is basically
just splitting hairs at that point.  We're writing patches, after
all, not college papers...

---

Aside:
It looks like this patch is initializing some previously uninitialized vari=
ables to zero
as a guard against them not being set during xe_pcode_read.  This is a nece=
ssary
fix in the event we have the xe info skip_pcode flag set (as that causes th=
e pcode
reading function to return a success without actually doing anything).  But=
 in every
other case, I'm failing to see how the guards we currently have in place (n=
amely,
checking the return value and aborting the function if the read fails) aren=
't sufficient
to prevent us from using an uninitialized variable in the case of a read fa=
ilure.  And
if it's to guard against a future where the read function needs extra data,=
 I think I'd
rather we just create a new variable to store that extra data, rather than =
coopting
the data0 write location for that purpose.

Of course, the skip_pcode case is sufficient enough to warrant this change =
by itself,
so I'm not going to block this.  The skip_pcode flag is set to TRUE by defa=
ult for SRIOV
VF platforms, so I'm surprised breakages haven't been detected sooner given=
 the
uninitialized variables are quite liable to contain garbage data under some=
 (or most)
common kernel compiler configurations.

An explanation would be nice, but it's not necessary.  I mostly give these =
asides
as proof that I actually read the patch, rather than as blocking queries, s=
o you
can take my reviewed-by without any strings attached.  The grammar fixes ca=
n
be applied at merge time.

Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
-Jonathan Cavitt

> ---
>  drivers/gpu/drm/xe/xe_device_sysfs.c | 8 ++++----
>  drivers/gpu/drm/xe/xe_hwmon.c        | 8 ++++----
>  drivers/gpu/drm/xe/xe_vram_freq.c    | 4 ++--
>  3 files changed, 10 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe=
_device_sysfs.c
> index bd9015761aa0..6ee422594b56 100644
> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
> @@ -76,7 +76,7 @@ lb_fan_control_version_show(struct device *dev, struct =
device_attribute *attr, c
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root =3D xe_device_get_root_tile(xe);
> -	u32 cap, ver_low =3D FAN_TABLE, ver_high =3D FAN_TABLE;
> +	u32 cap =3D 0, ver_low =3D FAN_TABLE, ver_high =3D FAN_TABLE;
>  	u16 major =3D 0, minor =3D 0, hotfix =3D 0, build =3D 0;
>  	int ret;
> =20
> @@ -115,7 +115,7 @@ lb_voltage_regulator_version_show(struct device *dev,=
 struct device_attribute *a
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root =3D xe_device_get_root_tile(xe);
> -	u32 cap, ver_low =3D VR_CONFIG, ver_high =3D VR_CONFIG;
> +	u32 cap =3D 0, ver_low =3D VR_CONFIG, ver_high =3D VR_CONFIG;
>  	u16 major =3D 0, minor =3D 0, hotfix =3D 0, build =3D 0;
>  	int ret;
> =20
> @@ -153,7 +153,7 @@ static int late_bind_create_files(struct device *dev)
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root =3D xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap =3D 0;
>  	int ret;
> =20
>  	xe_pm_runtime_get(xe);
> @@ -186,7 +186,7 @@ static void late_bind_remove_files(struct device *dev=
)
>  {
>  	struct xe_device *xe =3D pdev_to_xe_device(to_pci_dev(dev));
>  	struct xe_tile *root =3D xe_device_get_root_tile(xe);
> -	u32 cap;
> +	u32 cap =3D 0;
>  	int ret;
> =20
>  	xe_pm_runtime_get(xe);
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.=
c
> index f08fc4377d25..17a324e9de82 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -179,7 +179,7 @@ static int xe_hwmon_pcode_rmw_power_limit(const struc=
t xe_hwmon *hwmon, u32 attr
>  					  u32 clr, u32 set)
>  {
>  	struct xe_tile *root_tile =3D xe_device_get_root_tile(hwmon->xe);
> -	u32 val0, val1;
> +	u32 val0 =3D 0, val1 =3D 0;
>  	int ret =3D 0;
> =20
>  	ret =3D xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
> @@ -719,7 +719,7 @@ static int xe_hwmon_power_curr_crit_read(struct xe_hw=
mon *hwmon, int channel,
>  					 long *value, u32 scale_factor)
>  {
>  	int ret;
> -	u32 uval;
> +	u32 uval =3D 0;
> =20
>  	mutex_lock(&hwmon->hwmon_lock);
> =20
> @@ -889,7 +889,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr=
, int channel, long val)
>  static umode_t
>  xe_hwmon_curr_is_visible(const struct xe_hwmon *hwmon, u32 attr, int cha=
nnel)
>  {
> -	u32 uval;
> +	u32 uval =3D 0;
> =20
>  	/* hwmon sysfs attribute of current available only for package */
>  	if (channel !=3D CHANNEL_PKG)
> @@ -991,7 +991,7 @@ xe_hwmon_energy_read(struct xe_hwmon *hwmon, u32 attr=
, int channel, long *val)
>  static umode_t
>  xe_hwmon_fan_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  {
> -	u32 uval;
> +	u32 uval =3D 0;
> =20
>  	if (!hwmon->xe->info.has_fan_control)
>  		return 0;
> diff --git a/drivers/gpu/drm/xe/xe_vram_freq.c b/drivers/gpu/drm/xe/xe_vr=
am_freq.c
> index b26e26d73dae..17bc84da4cdc 100644
> --- a/drivers/gpu/drm/xe/xe_vram_freq.c
> +++ b/drivers/gpu/drm/xe/xe_vram_freq.c
> @@ -34,7 +34,7 @@ static ssize_t max_freq_show(struct device *dev, struct=
 device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile =3D dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val =3D 0, mbox;
>  	int err;
> =20
>  	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> @@ -56,7 +56,7 @@ static ssize_t min_freq_show(struct device *dev, struct=
 device_attribute *attr,
>  			     char *buf)
>  {
>  	struct xe_tile *tile =3D dev_to_tile(dev);
> -	u32 val, mbox;
> +	u32 val =3D 0, mbox;
>  	int err;
> =20
>  	mbox =3D REG_FIELD_PREP(PCODE_MB_COMMAND, PCODE_FREQUENCY_CONFIG)
> --=20
> 2.34.1
>=20
>=20
