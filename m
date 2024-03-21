Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97930C6FD1F
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 20:00:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC99112092;
	Thu, 21 Mar 2024 20:00:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nd+kfgIT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6D6112091
 for <intel-xe@lists.freedesktop.org>; Thu, 21 Mar 2024 20:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711051225; x=1742587225;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dgZ9sBps7CclueFrFJIMGGlU2hZISwPt8LPdXONnMlE=;
 b=nd+kfgITltKAPFk8GYSSVSx82kwuk3r3sGoUWqYaM7a/jrgIksricPDu
 0m80vW55zGgVYs7xQEjljxhWWf38tc2T9zZlIklBun5su0cq1px7+pj2g
 fyvsjcjICrjBtXVnAmutul1zeqvJEnyeeUIyOyj3nbfiVIsgKl6Fr5VU3
 HyVtMpWDORzLHbsiFsTFHRmaK4dGge6pa11FLxNM+Yf6/wvdLjeR9RHjF
 oR538lVUYdi4fI9W4gTJsx+Y8jZ9+015hXBD3zgjwTKlXkUqS+qPRmULH
 pI6SLr9x+5qP8yrhA2fuAI3zD4PgHP5DVZMNP1wOzl4pxKUC48mQAXP+F w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11020"; a="28542905"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="28542905"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Mar 2024 13:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; d="scan'208";a="37760772"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Mar 2024 13:00:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 21 Mar 2024 13:00:23 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 21 Mar 2024 13:00:23 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 21 Mar 2024 13:00:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d9AB9PBdZ6nvZy+YJ+xLorH8GcN+4NTF1jY6/1iKF0NtaDYmh7wCFbVVPCMsD8XbxLuvcOjD3afNTIHtW7Ml9OoGzWncyNfo3LpuMmPmbP+Vim9/jIiWw4zC+uNYwZzfqtquf/6n9vUfMV3z8XommAF7RA/3Fr/izbtVQNVUlLiOBXWev0nNL0e3/4rm1VxJQXzJu6akJrtAJETud6iQEvoWFHDPM3qEBqKIkhsWSLbZLrHzA9rjuDK/u7S5cYEwt7sTQCPuphsSwMTBMDHPajZGzLmbjYhYteYIJKvvy/+B5y0uUqqAi3qgc/HLDl637niGU/liFNcNiIi9Me9irg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EvLBejQ/lDr/j6RQ/Lz3Fql66W6YNvLe9WbSRc9IatQ=;
 b=Xb63ojiEZtI2sM3w9z7j+8fXeOJmy3Fd/PkDZWPp2Tc3Q74SZYI3QIZA5BZwpxUEnw9HALfYjxODbVzXJD84te41ZmVfUJ2aJzY5OGD8Fge47Yq4IyU6zn0vx51oz7nC+iart7ns6YLPB6SkpGHBnxAfPRyPFocaAeVGOPzPlMGcc2fo3fhk2GavUh8Gjetv3KwALy/V1K827k3cDVn8xMvS1S4T5PcUlFjO2Pb0reTv/STrPLHBvld8KTL9fhpc+JaPxh/JT3JG67no1RjouHMn1Ah0x75f+64npmJO+TJcuQDJ0wo70vLoUiY6Ajx6ePsfc73lJkbZa4QJ3c0pLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB6991.namprd11.prod.outlook.com (2603:10b6:806:2b8::21)
 by LV3PR11MB8744.namprd11.prod.outlook.com (2603:10b6:408:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.23; Thu, 21 Mar
 2024 20:00:20 +0000
Received: from SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d]) by SA1PR11MB6991.namprd11.prod.outlook.com
 ([fe80::c06c:bf95:b3f4:198d%5]) with mapi id 15.20.7362.017; Thu, 21 Mar 2024
 20:00:20 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Hellstrom, Thomas" <thomas.hellstrom@intel.com>, "Welty, Brian"
 <brian.welty@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
Subject: RE: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Topic: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
Thread-Index: AQHaezXx8ukTkUkttEKudqvoYNITzLFBh1kAgAC2QECAAC7pAIAACXVg
Date: Thu, 21 Mar 2024 20:00:20 +0000
Message-ID: <SA1PR11MB6991842B4F24CA71A7159B1B92322@SA1PR11MB6991.namprd11.prod.outlook.com>
References: <20240321022939.2279979-1-oak.zeng@intel.com>
 <20240321022939.2279979-5-oak.zeng@intel.com>
 <ZfunwkSUxdlFWmcn@DUT025-TGLU.fm.intel.com>
 <SA1PR11MB699154B66898A29896FFB5D192322@SA1PR11MB6991.namprd11.prod.outlook.com>
 <Zfxn/o1Qugq1hG6C@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zfxn/o1Qugq1hG6C@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB6991:EE_|LV3PR11MB8744:EE_
x-ms-office365-filtering-correlation-id: a49c1e50-da63-48a7-eec7-08dc49e189be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: jNOZ12QAeaEOckzUtv1xUBhe4GFf1pD5sP+2+ZuliDe8RSGgCpJIWi6AkTer0wM0vZ+dws5rgCr6iMyVL2vnk1rw5BWSSvYKghcIrijYfqeVPxQ+r/zzI1uR+8bQH6n44NjzXFMtNyxToTZw5QhXUstbmo1RnUgUBF1falUzMDT7KOChTMXPV1pNZZ1ufBkpCjbX5st62ERi+dJvQAhCiwHi/jrZmbPm59uI/VsyvXtkTB9sNuddZ21jvE2s3dQO16LO6sXOtFfe28A/bMsFlOne3fFRey29FuGezNfQsKm1LugJ8PLenEIPnP5T1ZnHn4fcZ4cDEqyn5U5pfW6PoEKk8DHvFdVDzJ9KVAgsht1pe3NZqycfjxTPF0pnHmnUb4KWXOgks4hxcgHZitYjI42EVKcp5rfas5Dl7ARTxhMRG361rD3s9vWc95uMhp+xuS5kdQg25DVPmw8cyz8A+llNWCkOtYtsbO6CVGPoQWbZMbsxPY15npTiRphSCumgkb+TBFn88dfwwjnMqSrPNn1oxzV2jdM1gGYGYMJvyELiskDC0JrJ/IH+bhkUw7JKd2HHC8UsraihrQKS7AWg7gtpPlkNTTwdlgf3NASzv3p6YDcw9l1Y3kvxUnaY7bu/QSeFDomg8zVv1qU1sD4ZxHzJz+eVGRZOIW3CW/LXpqA9gWc5kuWiKKvbXRbBUCVa
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB6991.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?5Y3RgReRqdWuaAZweUoUlw6/F1OsJ8eq2cc2BfOEqL6s7b2/g2zv3peshESc?=
 =?us-ascii?Q?wR6hfOxxP37IRuHFnTm5v82QPysOxW721nnj/xwM9tj+37haKXjqwgXwzkPI?=
 =?us-ascii?Q?nGqa5mGMc/3v1V5xNLwPCV+Rd65roVzW90N1A4a8jeDyQxl/qCsjVnbnagQ3?=
 =?us-ascii?Q?pgbCQnLxVB7MWkM23PBeP9WmpQa5TsHvxAJg1Hu4soprIVMUyssC5GEZhVyP?=
 =?us-ascii?Q?CBrA4apuptjAas/jlZuYIiWEsm342U99gyIgYE7QUPsVgQv0AgYP7WGaBwXt?=
 =?us-ascii?Q?df32DqnAKnodot++8aRhdc2tau3cIvBRyaNZ2bkvv4DBdfVQa4clfXeLcvZM?=
 =?us-ascii?Q?ivIbuW8O4BlERaV5gTE94YqpoDbF5/w3VYexc9bCWfcavdNOg5zztIXn/H8A?=
 =?us-ascii?Q?h+K+sfqfe4n7H1J1an5OE7fVTFL/F0m1XPnzzffuFASnPe40L2eFLt/ZY/BU?=
 =?us-ascii?Q?f9cVgyqhCOR0mqT7/blSAuGT3RU9MLCZhzTuJ2R3+VUL6tTDhm/25AlIw1KS?=
 =?us-ascii?Q?LKx+246IVtkiehdbsiF0Ld2nJxsFciMMyWmvho+B6WW+RbatNpcKR2nN4U8Z?=
 =?us-ascii?Q?iCHElWgz0LDUnI/u4u/8vpnGAORpR4khHV1OC+WN1twhSZ0K0ofhlzsmuo4h?=
 =?us-ascii?Q?yBuoCqWu1lYqCzk4e5QRviakgeZ9pN+PwyrZyEierC1zNZ1HqrYiEd7fD5Lo?=
 =?us-ascii?Q?v53CkcDSUiT56TaTCLIZop3Fdvg1wfNU2rj9gBGWJpKkfoqKHo55VYAJrXDG?=
 =?us-ascii?Q?3ACyO+fN1iCVl0L7TWNFFOag0QkjQrHwBjovTqYZ+tTH3dvnvcT4ikWkqefJ?=
 =?us-ascii?Q?go2D29zwU0E6tcKXIpR6m30wU+ABc+bnQSIultArUP3INLddCO2oyUkj05Bo?=
 =?us-ascii?Q?BotMbxbQeEXigc+eLXHXiucyZtGrW+7UdR9ThtzPhTpFEYPElIu1A3yuw52f?=
 =?us-ascii?Q?LA9E/M9Nu/Z3ORKQ6BdQqptjUFin53gMDkabk82/GZLhGuSRs+oMpbNVtapy?=
 =?us-ascii?Q?FMuhcF3F8JeVvkJeJDnfhSx+/nT+xB3OomO5Ax3RauCaAbCeCMNn4PeFv5an?=
 =?us-ascii?Q?gUZhfOA66jLSx9q4n3SIO3P2G7wbtLgzqFFvsy862m5peAFuXKrSq2PdgRFW?=
 =?us-ascii?Q?b4niRo+vhwEzCD1HD4KtcRIZ96faU+IZpUP4/FFz8t7nDklT5sYzZBQQiN+S?=
 =?us-ascii?Q?bKIAP3J08VN1g0HzlWPtCPg6kfGjzNq2/7kFjOA3TFMutM2GboMgg6xgjxzJ?=
 =?us-ascii?Q?aEqj7qNED0BJKpJvR+YHR2BTzqMrjRSjDDKL37UJiGVfrkVPdDQsNDu00Ir2?=
 =?us-ascii?Q?N6MskN5RkDjWMmy8Tx4zD2DUD2w5bSzd6yu6UIK7Bdu5o0wLjkv7BPD1wQQ9?=
 =?us-ascii?Q?j4rsQvtFvohBm/K3tA3HOzEyLMtgFv4XgfIXDpHKvfRZsvEHSd18bC/t2HLn?=
 =?us-ascii?Q?x0qsAhDYcaAgPua27ZG5r28PkAgi/Wu9FmE2LlmJ2LhrJMoDyDqmPzgLSpmk?=
 =?us-ascii?Q?oK6/mtiHgQMgQykO1TqyvxzD8JbWnIfF0ISlxhOe6loBvxuKjhLILO/0jC29?=
 =?us-ascii?Q?42svszWgom9eerSCyVE=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB6991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a49c1e50-da63-48a7-eec7-08dc49e189be
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Mar 2024 20:00:20.6677 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0A1xChW/tvHt46VbyhwGuu4ITJEyRBlaOnWSkVRUIff4HpzgdojkelqE/Zs4zg/fPxNQmK1LBDPcjeaKtWS72w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8744
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

Hi Matt,=20

Per yours and Thomas comments, most likely we want to keep the current beha=
vior. I will drop this patch.=20

I might still need this behavior for system allocator. But that will be lef=
t over to the system allocator patches.

See some comments inline just for discussion purpose.

> -----Original Message-----
> From: Brost, Matthew <matthew.brost@intel.com>
> Sent: Thursday, March 21, 2024 1:02 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>; Ghimi=
ray,
> Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> <lucas.demarchi@intel.com>
> Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
>=20
> On Thu, Mar 21, 2024 at 08:56:15AM -0600, Zeng, Oak wrote:
> > Hi Matt,
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Wednesday, March 20, 2024 11:22 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org; Hellstrom, Thomas
> > > <thomas.hellstrom@intel.com>; Welty, Brian <brian.welty@intel.com>;
> Ghimiray,
> > > Himal Prasad <himal.prasad.ghimiray@intel.com>; De Marchi, Lucas
> > > <lucas.demarchi@intel.com>
> > > Subject: Re: [PATCH 4/4] drm/xe: destroy userptr vma on UNMAP event
> > >
> > > On Wed, Mar 20, 2024 at 10:29:39PM -0400, Oak Zeng wrote:
> > > > When there is MMU_NOTIFY_UNMAP event happens, the userptr
> > > > is munmapped from CPU. There is no need to keep the xe_vma
> > > > for this userptr from GPU side. So we destroy it.
> > > >
> > > > But we can't destroy vma directly from the mmu notifier
> > > > callback function, because we need to remove mmu
> > > > notifier during vma destroy. If we remove mmu notifier
> > > > directly from mmu notifier callback, it is a deadlock.
> > > > xe_vma_destroy is modified to destroy vma in a worker
> > > > thread.
> > > >
> > > > Another reason of this change is, for the future
> > > > hmmptr codes, we destroy vma when hmmptr is unmapped
> > > > from CPU. We want to unify the hmmptr and userptr
> > > > code.
> > > >
> > > > I believe this is also the correct behavior for userptr.
> > >
> > > It is not, the user is still responsible for unmapping.
> >
> > Do you see a problem of the scheme I described? In that scheme, if user
> vm_unbind after userptr is freed/munmapped, we can return user an error
> "userptr is already freed". Is this a problem to you?
> >
>=20
> We did this until was merged - the next userpr pin pages would return
> -EFAULT.=20

That is a little different than my scheme. In my scheme, the user freed use=
rptr is destroyed completely. It won't be on any repin list - it won't be r=
epined anymore.


Turns out the compute apps call free / munmap on userptrs with
> bindings as the time for performance reasons. Thus the [1] we just
> invalidate the userptr if we can't pin the pages.

I understand the performance consideration. But in my scheme, it doesn't ha=
ve the performance problem either. My scheme allows user free without vm_un=
bind, with same performance perspective.

Thomas mentioned user can free the userptr, then malloc the same userptr, t=
hen use it for gpu workload. I wrote an email to confirm this behavior to U=
MD. If this is the case, then my scheme doesn't work.


>=20
> [1] https://patchwork.freedesktop.org/series/130935/
>=20
> > My thinking is, the xe_vma state for userptr depends on a valid userptr=
. When
> user free/munmap userptr, the userptr is gone, so the xe_vma should also =
be
> gone. Isn't this a general valid design principle? Xekmd itself seems app=
ly this
> principle a lot. For example, when we destroy a vm, all the exec queue of=
 this vm
> is destroyed, not requiring user explicitly destroy queues.
> >
>=20
> Not a wrong of thinking about it but see above.
>=20
> >
> > Even if this was
> > > the correct behavior we'd have to unmap from the GPU and update inter=
nal
> > > PT state before calling xe_vma_destroy.
> >
> > In vma_userptr_invalidate, we called xe_vm_invalidate_vma to zap PT sta=
te.
> But currently it is done only for fault mode. If we use my scheme, this s=
hould be
> done for both fault and non-fault mode during a MMU_NOTIFY_UNMAP event.
> >
>=20
> I'm unsure where it done in this patch - xe_vma_destroy free the KMD
> state / memory for the xe_vma. It does not remove / update the GPUVM
> state, the PT state or interact with the GPU to update the page tables.

I wasn't clear. It is not in this patch yet. I meant this behavior:

Regardless it is fault or non-fault mode, if user free/unmap userptr (aka M=
MU_NOTIFY_UNMAP event in the mmu notifier callback), we should always:

1) update GPUVM state/ZAP PTEs
2)destroy xe_vma for the userptr, also makes sure this xe_vma won't be on a=
ny repin list..

Again, this scheme depends on UMD behavior as said above.

>=20
> We only call xe_vm_invalidate_vma in notifier for fault because the
> other modes (dma-fence / preempt fence) it is call somewhere else (exec
> IOCTL / preempt rebind worker respectully). The dma-resv slots in these
> modes ensure that after vma_userptr_invalidate returns the GPU will not
> be touching the userptr. GPU exection is resumed in exec IOCTL or
> preempt rebind worker either the userptr is rebound or invalidated.
>=20
> Make sense?

For non-fault mode, what we have today (with your merged patch) works for m=
e. Let's keep the current behavior. Note my scheme would also work: in MMU_=
NOTIFY_UNMAP, we can do above 1) and 2) without pre-empt GPU workload - if =
GPU touch this userptr later, it is user program error and it is fatal. I a=
gree we keep the current behavior=20

>=20
> >
> > >
> > > The correct behavior in this is case just let the userptr page pin fa=
il
> > > and invalidate GPU mappings. This recently got merge in [1].
> >
> > This also works, but the design is not as clean as my scheme IMO.
> >
>=20
> The UMDs have requested the existing behavior.

Sure, lets keep it.

>=20
> > For hmmptr, there is no vm_bind (except the initial gigantic bind which=
 doesn't
> count). It is reasonable to destroy vma when user free/munmap, otherwise =
we
> left over a lot of zombie vmas. So at least for hmmptr we should apply my
> scheme. Whether we should unify the scheme for both userptr and hmmptr, I
> think it is still debatable.
> >
>=20
> The HMMPTR case, this concept is correct. Hence I implemented garbage
> collector in my PoC [2]. The implementation however, is not. See my
> comments above about what xe_vma_destroy does. Rather than calling that
> function - it should be addded to a list which a worker picks up and
> proper modifies all state (GPUVM, internal PT state, and GPU page
> tables) needed to destroy the VMA. The garbage collector can be thought
> od mini-IOCTL that only implements DRM_XE_VM_BIND_OP_UNMAP for the
> VMA.
> Hence in my PoC it calls the same functions the bind IOCTL calls albiet
> with slightly different arguments.
>=20
> Again, does this make sense?

Yes, that make sense.

Oak

>=20
> Matt
>=20
> [2] https://gitlab.freedesktop.org/mbrost/xe-kernel-driver-system-allocat=
or/-
> /commit/91cf8b38428ae9180c92435d3519193d074e837a
>=20
> > Oak
> >
> > >
> > > Have a pending test for this in [2].
> > >
> > > Matt
> > >
> > > [1] https://patchwork.freedesktop.org/series/130935/
> > > [2] https://patchwork.freedesktop.org/series/131211/
> > >
> > > > This patch is experimental for CI and open to discuss
> > > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_vm.c | 8 +++++++-
> > > >  1 file changed, 7 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.=
c
> > > > index 11a4bb9d5415..90d1163c1090 100644
> > > > --- a/drivers/gpu/drm/xe/xe_vm.c
> > > > +++ b/drivers/gpu/drm/xe/xe_vm.c
> > > > @@ -40,6 +40,8 @@
> > > >  #include "xe_wa.h"
> > > >  #include "xe_hmm.h"
> > > >
> > > > +static void xe_vma_destroy(struct xe_vma *vma, struct dma_fence
> *fence);
> > > > +
> > > >  static struct drm_gem_object *xe_vm_obj(struct xe_vm *vm)
> > > >  {
> > > >  	return vm->gpuvm.r_obj;
> > > > @@ -604,6 +606,9 @@ static bool vma_userptr_invalidate(struct
> > > mmu_interval_notifier *mni,
> > > >
> > > >  	trace_xe_vma_userptr_invalidate_complete(vma);
> > > >
> > > > +	if (range->event =3D=3D MMU_NOTIFY_UNMAP)
> > > > +		xe_vma_destroy(vma, NULL);
> > > > +
> > > >  	return true;
> > > >  }
> > > >
> > > > @@ -901,7 +906,8 @@ static void xe_vma_destroy(struct xe_vma *vma,
> struct
> > > dma_fence *fence)
> > > >  			xe_vma_destroy_late(vma);
> > > >  		}
> > > >  	} else {
> > > > -		xe_vma_destroy_late(vma);
> > > > +		INIT_WORK(&vma->destroy_work, vma_destroy_work_func);
> > > > +		queue_work(system_unbound_wq, &vma->destroy_work);
> > > >  	}
> > > >  }
> > > >
> > > > --
> > > > 2.26.3
> > > >
