Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE027C4345F
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 03:22:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AFC112FF6;
	Tue, 23 Apr 2024 03:22:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CFGQpOAw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D03112FF6
 for <intel-xe@lists.freedesktop.org>; Tue, 23 Apr 2024 03:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713842526; x=1745378526;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zijtJfSxhzIMsKQQ165EI/SiH8BwXCD9IvAoTOwYw3Q=;
 b=CFGQpOAw4pqIZT08d+B8ihQVVi8ojndykJpy6Y3MRUv6C7wPSeqLn4cE
 2qBwv9e76ZaznkcbDj1906YNX0OV51KSJ9PdbRkhgKlh0a4d2MWFeWn/t
 qRVf9Kahicj8ypUSnh3UpTP1LO/YySygxs3TYJM/9KtDNiBOBjbU2CReZ
 owQ/ECLcIpEehJV4+/OINkGis0Gr3jGWypUlLaE7AxUw9B2geinbO6dgh
 JiXnXSWwb0/Lw4b/ZEDX96axCn3wkTgUWgWucGipB1EybN0i6znOrHDN4
 Y5Ucs4M8D+AIKK6l7JXWVhV3A+vCoVOesfcJBoPaE7HouGRAw06YcoROv Q==;
X-CSE-ConnectionGUID: lKRmCIpxTMapAxU8tY21XQ==
X-CSE-MsgGUID: 1tEtGKkYRzeiSXBlBsaHEw==
X-IronPort-AV: E=McAfee;i="6600,9927,11052"; a="9575634"
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; 
   d="scan'208";a="9575634"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2024 20:22:05 -0700
X-CSE-ConnectionGUID: SUHqSqRCQS6wDSi53F0FBw==
X-CSE-MsgGUID: LV1J73xnSPC98HnBEHd0ww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,222,1708416000"; d="scan'208";a="24737750"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 22 Apr 2024 20:22:06 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:22:05 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 22 Apr 2024 20:22:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 22 Apr 2024 20:22:05 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Mon, 22 Apr 2024 20:22:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P2GOSeIZJ6RFRlbxtRiFKR9RzQi/MCZSw6Ee0rfD9k7ZLiGM0HyIreUFEBleYV+7R9dvsNuozYW24X0sf7oE9/Jz+Cp7ZKE66WruXvjOPV3qGR8vKTUWFrBFO6AJW/ep7kDJjzatvzgAKDcUL4R2IECnpSmdL0Maqpa2M6YS9RBNrLVe/+zy30vJ5y8iMITAmQ2zQwYCodww/FsPanx3jGwf+/t9xAopFiYp40Blg03QKvnT+2lRrlR+9Ryf1W0xnW2bQUNDBOA3GiqHqSl7guGnih8mrRw/MTLNxoj5w/713NxMhuSim9dzNdfzPsJUpwk88KlqAhKQEWEo2mNgjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FztJa5aMecAtRgkXIJbXgrMd8HNmdN0qGuPesRqrtR4=;
 b=GMQLaqIZDgMoJzdSzfnQ/TlaV6ce4xddfrvoDxE21sN3pWRsaQrgMogEYVlDaWOrEYnYQjY8lMmIr26edr3U0Z8Im8dvqvxYvCWHO+95DGzkwqFQU3zBDaGHRf5aJxoCg1/dmZ58/+6FRfMOfR75lKnNMhZyiYa9R2j3IjGquRytKsnW8NJYIHXFIdPuxvn7uUQOtVt/JM1mLIym/PzIVcVPM2SRcEaAGrbT/FUXX+YHbj+pBKhGCg0JRhDXXHkImyCnLpjkka3yyhy7xWXQifvMd3C6qxmkw2Bv0x8XG0TxIqTWXntmniBv3Vv+iPVVdROMM4zB4GudNONIwiNhLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV8PR11MB8560.namprd11.prod.outlook.com (2603:10b6:408:1e7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.21; Tue, 23 Apr
 2024 03:22:03 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7519.018; Tue, 23 Apr 2024
 03:22:03 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Thread-Topic: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling and
 cleanup
Thread-Index: AQHaiwmj7RkRs+9qT0iFJ7ZvlRpfabFvCMvQgAD9Q4CABT6G8A==
Date: Tue, 23 Apr 2024 03:22:03 +0000
Message-ID: <SA1PR11MB69913E7BFA320CA75C883E7B92112@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240410054056.478023-1-matthew.brost@intel.com>
 <20240410054056.478023-7-matthew.brost@intel.com>
 <SA1PR11MB69913C608E671B3214835367920D2@SA1PR11MB6991.namprd11.prod.outlook.com>
 <ZiLDB87VSgVrBnFA@DUT025-TGLU.fm.intel.com>
In-Reply-To: <ZiLDB87VSgVrBnFA@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV8PR11MB8560:EE_
x-ms-office365-filtering-correlation-id: a5a961d3-e4c5-41a4-79fa-08dc63448bac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?us-ascii?Q?Mt2WbTQqZsCuU89E/2vnFtGh5ernAfJ6z0scc0djig+R0o2GgN7h9gkImTOr?=
 =?us-ascii?Q?xItdJdjTW23VDMdbuxunRiIIc3EZSavxzzh2kjnmNRPBQuhQvUx0ARMxDVOY?=
 =?us-ascii?Q?LglG7T4/D+G7ES8UjZeCUQuXvhA0EDD5nc3gTXVCZfYlKR+W+//QmG3Q4L9S?=
 =?us-ascii?Q?dN+daueVIrsbryGWOrt4H3dBksXfBVimWkWxrFY300mws5/8FnYPkgYiOfGg?=
 =?us-ascii?Q?eqS92cNHcgIeamQ69EorzOWrrdvBIqCje8O1pBgx7tiOj3DLSz72J1NYCv7H?=
 =?us-ascii?Q?2W1ITfPQyb5LIO25Jd180lZtz3115PC7I8rExiOsAIam/afp/t/6BKQj+eov?=
 =?us-ascii?Q?qYLCrzUV0pJvIDi4aJPvJY7jR5m0XLaQ0i0icqqW6WtmFZoZO1NZhaf4Lj16?=
 =?us-ascii?Q?1bVozKxWOu5XFUIT7qVfSzfI9j/gqGV7eD1+QADBQ9+iKY6tliZtmZAZCCoU?=
 =?us-ascii?Q?fqP7QjI3HQg7AJwZRnDJeRmXBfwb4g67tcO9zFaRbt2ZGq9tbGyjZI5KiOW6?=
 =?us-ascii?Q?F6JaLbCnsyvJKwL7r3tFQxEokCJ3IchVEdhPCkiaBPy83O6pfl7yvY5pFno3?=
 =?us-ascii?Q?SUJwGKxFeIaZ9lRwUpQCM4J+AlCf7U/2FA2KztNlTSUXAq2yorMV63dDKamC?=
 =?us-ascii?Q?br4woUgA7CgxqWyWwnkzv7r5Q0vzPJGMwiZNinr/3Mj/EdvbylSaftJ/6IqL?=
 =?us-ascii?Q?+qqnQVix982pt4gwIXe+B4Fa0AcNL2t/cJ8Y+tFzAGIZX+KkbxC8EEHMQWit?=
 =?us-ascii?Q?OIO2gZT6LbRnv+nVN91nbqFkiEsAV71gri9SAREicSpYBo+83AxOhEPTviIs?=
 =?us-ascii?Q?yZ9+eGhG5loOY1IX6u2i4IH/7aMgEIvx4Pm/pMs7C5ffqoehNcT3Hgpi3Mp4?=
 =?us-ascii?Q?dHPl4qIzU83r2bQvM70A1qqiLPynjNuXYxVzom+5skM/B4K9SEzY9mug8ovF?=
 =?us-ascii?Q?dXMoJKaq+Vp+d0fLB2HVzJqUY94PuPPXxNITyOQQAX2AVzm3kHqhcih8vKx9?=
 =?us-ascii?Q?lTDQHXHDDaWn1+BugLtQr20Qp7fWjh4OvwwEh9SF/J+8WYu8pCo1cvvJ6g4e?=
 =?us-ascii?Q?Caj+ULbHWOff6wmx35Mx45qwmko7Qjv36ZqVatMtgwqWR6ZY3AH6/WRSLEmi?=
 =?us-ascii?Q?boTL3dpiaPIyETY7piA7mtCfvb1nhNoq8bY21vs1QPt+B9o9ugc7qzNlEDIs?=
 =?us-ascii?Q?nibONtTV7+l+HhnVuFwYonaMBHBRAMjIstERGj8TW+XGTY2ikKoaaecmV/5Y?=
 =?us-ascii?Q?8kMbz8bV++bzv0SzIiv7V2TsPdoFaJc6mUueYe5WCqhfx6HW/ZTYk/VYjlHU?=
 =?us-ascii?Q?07l3OVXqjrSh4ISgiWxn4vv2JYNanCmWgMtzi+ZkHVndxg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?34zE4zpJnNIOkMhGTHbkN1bkGXRrzkSz+mSYOdA/ytrTlH3uBLB3Wh9Xs9qe?=
 =?us-ascii?Q?E+pQRkRMfVYHG45zhAwZXI9CYQp30zIk5TPo/eBWFi8mVASGnt1o562PnBVN?=
 =?us-ascii?Q?U552GyYVKCQ86Qt3oMBNnAW87f6eEcncXpQc5mdp/mL3gj57v60pbr7IgohY?=
 =?us-ascii?Q?Lr0LzghnuuyF1QjuL5MGbV2LhX9R0aG8Mgmgr27ofqsX/obGrEROz1orLQnd?=
 =?us-ascii?Q?Ov4a+ytCn1EnkTkgVMrOIT3zQCr+UPYCCyqhCpUwjkAo4E0TNjp2ZWrBmkBX?=
 =?us-ascii?Q?IUPboNSg8Q4xsGIx5xmPYZ2iGpIJZYq5WfvWil+O084NQWYyCLHJSaRyW05o?=
 =?us-ascii?Q?eSwIt3QoiekJPuYyGsrV2xBCFxPJxrEHbFvOQP37WGkJa3LgihrAZV4eAf4R?=
 =?us-ascii?Q?BQLEQ8wTdAiK+3IsFXDHFHelwqbiF8ZfNiy1CKE/20fERma5r1hRz8lgVwdJ?=
 =?us-ascii?Q?4bnQxXlfQjSWmnCgNETO0Q9tkwI3tyUNeK1B+DmFBJZRSfgKIEtOQBb/szXr?=
 =?us-ascii?Q?kkxaWMLJF0lmCPEZShx//PmIFBlP55et/fYnTb2/NvDMeDtT0GMqZ9pWNP8n?=
 =?us-ascii?Q?RKkLKOqEGXReTsOgsfjhGkTR3TwzPcqVNeatFgdbGQgjNTcrVwYlNQev62Zy?=
 =?us-ascii?Q?Kbu/kjTaIBAuHxvXqmRMA7kKkl4HqJgdjYjpTCwnKzBwLGjKLbPEO9HUFkUD?=
 =?us-ascii?Q?AIEiOOM4l0c87/yLYs04FYF+f/H3CqSaiagOji8gHvbW0MiHdsYfAVagXF0T?=
 =?us-ascii?Q?Dj7W5d43EtxqD713HkxQQea5XctltRt6mJmw4h31ax+yijewQjUZLIzxV8Of?=
 =?us-ascii?Q?yVubmiN0vmf/lXJjHOn4+WPx2+K7eAwZPq/V2EbWssrpJ13TmHUwtTg8Qzr1?=
 =?us-ascii?Q?glvLCAgKFgq/gX1PTV1zVNC5PUREAPjX1yY14uR1ceVxRdtidaG2lMuD6DaF?=
 =?us-ascii?Q?EU7E4L5Yo+qOW3l2ssGnFiq+YLQjligjpCNgeDoBTpcTSTvMSf8cOksSSwZq?=
 =?us-ascii?Q?dib1bHQf0TOxSqkFR99KeA6vyKaqC9jCtV/cgRF9fhNw/JMML7fwxi4uXQWJ?=
 =?us-ascii?Q?pNF6p390pYkNB1+fPS3u8U1P7SBKZfb1bJvntX4Z8EtFoxKq7043UwiDjWvR?=
 =?us-ascii?Q?DBXtG2mOngffwlqRrOCtbFd9OD5OfVE4zs4PQEcoG8I4pAFBSdjPv4HGMfLA?=
 =?us-ascii?Q?UiTwT8D1zt4yRx+cnPQ/qMKaYX2YW/72ooz1Ob1QSafc2pn8bDfJErJ3hgWh?=
 =?us-ascii?Q?bK77rJfgFO2UeG0Yrcqbqo/qsanRlXFu5+RbxHFmHnRcQOkmSZ38eJFNTH6w?=
 =?us-ascii?Q?aLNJlTp606cfDrMHTJOS/7gbbcnm8DmKuFfeGQtKdx7/JLk3Wf3ZLXsPfPPC?=
 =?us-ascii?Q?XVvCEHpNDbj38W34OiTUeMN+RKMHu+uLrBwOVWQ87cT2RQKdKUUBGzibIFt7?=
 =?us-ascii?Q?L4V14gOnCv7AG9R65RUONINaRE+Ds4Yh0PWCBEiDV/twc5U3kp9R1Lzj4/mC?=
 =?us-ascii?Q?PKqoQ1JNwdxPsQ+Mr/MbxERZplHnLU6IvW/fzRpFNWv0UOqC3ZelaNgl2ZV6?=
 =?us-ascii?Q?7QVGDIvUEqyAdwjfaFY=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a961d3-e4c5-41a4-79fa-08dc63448bac
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Apr 2024 03:22:03.2004 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8QXSXRtjlH71VoGDCasMEEgXfBHgUx3ZeZN90hr1q+822MB1bopP/YgcsKGYxTG3cwIMyJCp23+gBlEtnuP/1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8560
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
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Friday, April 19, 2024 3:16 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling
> and cleanup
>=20
> On Thu, Apr 18, 2024 at 10:19:04PM -0600, Zeng, Oak wrote:
> > It is a nice clean up. See one question inline
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, April 10, 2024 1:41 AM
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Brost, Matthew <matthew.brost@intel.com>; Zeng, Oak
> > > <oak.zeng@intel.com>
> > > Subject: [PATCH 06/13] drm/xe: Simplify VM bind IOCTL error handling
> and
> > > cleanup
> > >
> > > Clean up everything in VM bind IOCTL in 1 path for both errors and
> > > non-errors. Also move VM bind IOCTL cleanup from ops (also used by
> > > non-IOCTL binds) to the VM bind IOCTL.
> > >
> > > v2:
> > >  - Break ops_execute on error (Oak)
> > >
> > > Cc: Oak Zeng <oak.zeng@intel.com>
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_vm.c       | 67 ++++++------------------------=
--
> > >  drivers/gpu/drm/xe/xe_vm_types.h |  5 ---
> > >  2 files changed, 12 insertions(+), 60 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> > > index 9d82396cf5d5..8f5b24c8f6cd 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > @@ -842,8 +842,7 @@ static int xe_vm_ops_add_rebind(struct
> xe_vma_ops
> > > *vops, struct xe_vma *vma,
> > >  }
> > >
> > >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > > -				     struct xe_vma_ops *vops,
> > > -				     bool cleanup);
> > > +				     struct xe_vma_ops *vops);
> > >  static void xe_vma_ops_init(struct xe_vma_ops *vops);
> > >
> > >  int xe_vm_rebind(struct xe_vm *vm, bool rebind_worker)
> > > @@ -876,7 +875,7 @@ int xe_vm_rebind(struct xe_vm *vm, bool
> > > rebind_worker)
> > >  			goto free_ops;
> > >  	}
> > >
> > > -	fence =3D ops_execute(vm, &vops, false);
> > > +	fence =3D ops_execute(vm, &vops);
> > >  	if (IS_ERR(fence)) {
> > >  		err =3D PTR_ERR(fence);
> > >  	} else {
> > > @@ -2551,7 +2550,6 @@ static int vm_bind_ioctl_ops_parse(struct
> xe_vm
> > > *vm, struct xe_exec_queue *q,
> > >  	if (!last_op)
> > >  		return 0;
> > >
> > > -	last_op->ops =3D ops;
> > >  	if (last) {
> > >  		last_op->flags |=3D XE_VMA_OP_LAST;
> > >  		last_op->num_syncs =3D num_syncs;
> > > @@ -2721,25 +2719,6 @@ xe_vma_op_execute(struct xe_vm *vm,
> struct
> > > xe_vma_op *op)
> > >  	return fence;
> > >  }
> > >
> > > -static void xe_vma_op_cleanup(struct xe_vm *vm, struct xe_vma_op
> *op)
> > > -{
> > > -	bool last =3D op->flags & XE_VMA_OP_LAST;
> > > -
> > > -	if (last) {
> > > -		while (op->num_syncs--)
> > > -			xe_sync_entry_cleanup(&op->syncs[op-
> > > >num_syncs]);
> >
> > I understand all the other part of this function is not needed anymore.=
 But I
> didn't figure out why sync_entry_cleanup is not needed? You still have sy=
ncs,
> do you? They are allocated in bind_ioctl function and seems you didn't to=
uch
> it in this patch....Can you explain?
> >
>=20
> It is called in the main IOCTL code (xe_vm_bind_ioctl) now.
>=20
> See below.
>=20
> > Oak
> >
> >
> > > -		kfree(op->syncs);
> > > -		if (op->q)
> > > -			xe_exec_queue_put(op->q);
> > > -	}
> > > -	if (!list_empty(&op->link))
> > > -		list_del(&op->link);
> > > -	if (op->ops)
> > > -		drm_gpuva_ops_free(&vm->gpuvm, op->ops);
> > > -	if (last)
> > > -		xe_vm_put(vm);
> > > -}
> > > -
> > >  static void xe_vma_op_unwind(struct xe_vm *vm, struct xe_vma_op
> *op,
> > >  			     bool post_commit, bool prev_post_commit,
> > >  			     bool next_post_commit)
> > > @@ -2816,8 +2795,6 @@ static void vm_bind_ioctl_ops_unwind(struct
> > > xe_vm *vm,
> > >  					 op->flags &
> > > XE_VMA_OP_PREV_COMMITTED,
> > >  					 op->flags &
> > > XE_VMA_OP_NEXT_COMMITTED);
> > >  		}
> > > -
> > > -		drm_gpuva_ops_free(&vm->gpuvm, __ops);
> > >  	}
> > >  }
> > >
> > > @@ -2904,24 +2881,20 @@ static int
> > > vm_bind_ioctl_ops_lock_and_prep(struct drm_exec *exec,
> > >  }
> > >
> > >  static struct dma_fence *ops_execute(struct xe_vm *vm,
> > > -				     struct xe_vma_ops *vops,
> > > -				     bool cleanup)
> > > +				     struct xe_vma_ops *vops)
> > >  {
> > >  	struct xe_vma_op *op, *next;
> > >  	struct dma_fence *fence =3D NULL;
> > >
> > >  	list_for_each_entry_safe(op, next, &vops->list, link) {
> > > -		if (!IS_ERR(fence)) {
> > > -			dma_fence_put(fence);
> > > -			fence =3D xe_vma_op_execute(vm, op);
> > > -		}
> > > +		dma_fence_put(fence);
> > > +		fence =3D xe_vma_op_execute(vm, op);
> > >  		if (IS_ERR(fence)) {
> > >  			drm_warn(&vm->xe->drm, "VM op(%d) failed
> > > with %ld",
> > >  				 op->base.op, PTR_ERR(fence));
> > >  			fence =3D ERR_PTR(-ENOSPC);
> > > +			break;
> > >  		}
> > > -		if (cleanup)
> > > -			xe_vma_op_cleanup(vm, op);
> > >  	}
> > >
> > >  	return fence;
> > > @@ -2944,7 +2917,7 @@ static int vm_bind_ioctl_ops_execute(struct
> xe_vm
> > > *vm,
> > >  		if (err)
> > >  			goto unlock;
> > >
> > > -		fence =3D ops_execute(vm, vops, true);
> > > +		fence =3D ops_execute(vm, vops);
> > >  		if (IS_ERR(fence)) {
> > >  			err =3D PTR_ERR(fence);
> > >  			/* FIXME: Killing VM rather than proper error
> > > handling */
> > > @@ -3305,30 +3278,14 @@ int xe_vm_bind_ioctl(struct drm_device *dev,
> > > void *data, struct drm_file *file)
> > >  		goto unwind_ops;
> > >  	}
> > >
> > > -	xe_vm_get(vm);
> > > -	if (q)
> > > -		xe_exec_queue_get(q);
> > > -
> > >  	err =3D vm_bind_ioctl_ops_execute(vm, &vops);
> > >
> > > -	up_write(&vm->lock);
> > > -
> > > -	if (q)
> > > -		xe_exec_queue_put(q);
> > > -	xe_vm_put(vm);
> > > -
> > > -	for (i =3D 0; bos && i < args->num_binds; ++i)
> > > -		xe_bo_put(bos[i]);
> > > -
> > > -	kvfree(bos);
> > > -	kvfree(ops);
> > > -	if (args->num_binds > 1)
> > > -		kvfree(bind_ops);
> > > -
> > > -	return err;
> > > -
>=20
> We now fall throuh to the cleanup in both success and error paths...
>=20
> > >  unwind_ops:
> > > -	vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > +	if (err && err !=3D -ENODATA)
> > > +		vm_bind_ioctl_ops_unwind(vm, ops, args->num_binds);
> > > +	for (i =3D args->num_binds - 1; i >=3D 0; --i)
> > > +		if (ops[i])
> > > +			drm_gpuva_ops_free(&vm->gpuvm, ops[i]);
> > >  free_syncs:
> > >  	if (err =3D=3D -ENODATA)
> > >  		err =3D vm_bind_ioctl_signal_fences(vm, q, syncs, num_syncs);
>=20
> The next few lines of code call xe_sync_entry_cleanup.


Got it. Patch is:

Reviewed-by: Oak Zeng <oak.zeng@intel.com>
>=20
> Matt
>=20
> > > diff --git a/drivers/gpu/drm/xe/xe_vm_types.h
> > > b/drivers/gpu/drm/xe/xe_vm_types.h
> > > index 466b6c62d1f9..149ab892967e 100644
> > > --- a/drivers/gpu/drm/xe/xe_vm_types.h
> > > +++ b/drivers/gpu/drm/xe/xe_vm_types.h
> > > @@ -330,11 +330,6 @@ enum xe_vma_op_flags {
> > >  struct xe_vma_op {
> > >  	/** @base: GPUVA base operation */
> > >  	struct drm_gpuva_op base;
> > > -	/**
> > > -	 * @ops: GPUVA ops, when set call drm_gpuva_ops_free after this
> > > -	 * operations is processed
> > > -	 */
> > > -	struct drm_gpuva_ops *ops;
> > >  	/** @q: exec queue for this operation */
> > >  	struct xe_exec_queue *q;
> > >  	/**
> > > --
> > > 2.34.1
> >
