Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48041CF9C5F
	for <intel-xe@archiver.kernel.org>; Fri, 20 Sep 2024 20:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FD910E2B4;
	Fri, 20 Sep 2024 20:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C9iasvlW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD9910E2B4
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Sep 2024 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726862821; x=1758398821;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dv/kubMVxEsq2JNynPw9/sl0O3HjnbMvsVh4H0h1cWo=;
 b=C9iasvlWD5AVE7b35sL15HOcvDa1GQZjMADlTnI7FQ2J3sNjSW5zbgEV
 BJNbgyqaQ2v4dvfwfKb536/3B9Zjeez1GaD6WPPwu5p0JJjNOU/xF6B6R
 EQjerdgzzs4szgglorDwyl/fYMLAP7B31iH8f+H8ZWvEKb5EfeIXzawqd
 ceIsG7uf9bqCmP7wgF4ClQHfnArxga4RlaGh1vd9x8JfjznlGaBNotn3l
 BQ0DWDC0mXjwJHDy/qll628Ezez3x1kYaeBt5RraEobIBtSW6Bcyh4fgc
 sQZ5mO1LwYfafRT2OAOIsfjjmchBXQRVnvnQVZzKjPdFUeHPXDmtV7xvg A==;
X-CSE-ConnectionGUID: 7brjiO+XR9287WXUopBJHA==
X-CSE-MsgGUID: NkFwoAD/Q1qp9fUktbTHIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11201"; a="43354970"
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="43354970"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Sep 2024 13:04:01 -0700
X-CSE-ConnectionGUID: xwA2WrNTTc+phI2a5LuhhQ==
X-CSE-MsgGUID: RnayLh+5SKaLmVoMSDIB2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,245,1719903600"; d="scan'208";a="69992006"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Sep 2024 13:03:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:03:57 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 20 Sep 2024 13:03:57 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 20 Sep 2024 13:03:57 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 20 Sep 2024 13:03:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vWxSl9ZHqZD3eJWhxpgzPogjmxS2EPhEK+HIwsoCX1otRvrgVJXt3H/kK/umzbobX4e5N8f8nF2FSS2SZ1Paz0um2XAQsnKHUwOg+qhqWwM5Ji7/EuHFQ4hCsWyO6PNHCGH1Hu+Df8OqFoicmWhnNIOhB5nJbfbFL0D9MxVnfPGRlkhCs500qpkrIImjC/AvBOn4+/thgbFkCFXujqKT2AoatZoEcSn1WW/c/KDKh25WEEKuTgYm5DQEAsx/r+qibDdQL45j2RHK0uHnd87OYlNmO1uXcA0AoJo0kepir8f9z2zhio3OzTyI9kKxVF943FAR8XXzzmjAccrd3LLHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3GtPn4J6FBDAYKynOVR63vsI1YGDxUnC+0bGWscjS3I=;
 b=V3/E+Dk5jiCvM85FEMvOyrPxq35H4CdW/T4N/rOJurBth/bRSQ8qc3k3/zkla2fJcWY5V/WQWMou5MB09XcUcr90/WzYaj9jEJY7jYYhFZucW/sC1Q0HmEmggDXrZSa2b/OEdrJ6C/Fsvub52JchCyZ8XMxkMAGkLHZYpXXrm7HXg/g1PXj6eNRmPb3M874SL4XWtEvGchg587MRaRP56hRXmsUqQ5CIHeMa43Q/zcy3KBWNR/cRDqVagYplNuZ3BIGrvxs9kd72zXikf2i06yn7NSbSpNulf6VtCy8Q5DooI4RHXJCAL7plg8ZIhEm65m9RDGF+No8+rDoaXBGweQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BYAPR11MB3159.namprd11.prod.outlook.com (2603:10b6:a03:78::31)
 by DS0PR11MB8667.namprd11.prod.outlook.com (2603:10b6:8:1b3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Fri, 20 Sep
 2024 20:03:54 +0000
Received: from BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476]) by BYAPR11MB3159.namprd11.prod.outlook.com
 ([fe80::d07b:b67:3584:7476%4]) with mapi id 15.20.7962.022; Fri, 20 Sep 2024
 20:03:54 +0000
From: "Zeng, Oak" <oak.zeng@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Thread-Topic: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
Thread-Index: AQHbCehuuocj9nq8eEu4l4GR2eayVrJfePcAgAFFYjCAAEfFAIAACZhw
Date: Fri, 20 Sep 2024 20:03:54 +0000
Message-ID: <BYAPR11MB3159E9953DFEED24708E5A60926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
References: <20240918164545.3955824-1-oak.zeng@intel.com>
 <Zux1IqkPO2JgwVF9@DUT025-TGLU.fm.intel.com>
 <BYAPR11MB3159727E185F70F6AD2C7974926C2@BYAPR11MB3159.namprd11.prod.outlook.com>
 <Zu3CSjQyoh4BCOeg@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zu3CSjQyoh4BCOeg@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR11MB3159:EE_|DS0PR11MB8667:EE_
x-ms-office365-filtering-correlation-id: c3856707-c084-4f15-8fd1-08dcd9af5ae8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?us-ascii?Q?gcf6XWPK3JHd6Ntc6eTyL+J7xVYl9zOiZFYem/MZU+0u4r6IuOxp8nVFlhkd?=
 =?us-ascii?Q?+wSoJEfTDGmRt/BF8PEcGHlEINRgcBmz7yY8Q0zwlDR73DK1gwCyXQJ0bdjF?=
 =?us-ascii?Q?858//Vt60c679ikAtbw6z6u3M5LLuVkhKHeCotVrUZ5ILcS587DWZS0kUQG+?=
 =?us-ascii?Q?Oqi+ld5r8xe7ZseviR0Q3N9bW2x3dKY6QW/0qLMBhwgeaIt6sVRdICOBkoVg?=
 =?us-ascii?Q?roZy/q+4Ble3zxCrg8DOoJBfYyKFLZv8xtPJ9orxmuVRJ3Jflph8wWjNMRaF?=
 =?us-ascii?Q?H70JOV4FNIqwawj0za4J+erW0kelnrBAjC64Kg0yEMbOv1EM+/fUyJucE+rW?=
 =?us-ascii?Q?UGMzwaUl/OA6+YqbIrx67AX8rYQtMQ8PZWd2B8eahmGdEJP1+t7bXwvQ1KLJ?=
 =?us-ascii?Q?ZM+3dHyFJ5JaYiNOpZrcSWux4FZg6XmuWTOqHqF2Zod6ZD9oCXQ+vYpp1U7p?=
 =?us-ascii?Q?EZFf0pVmkkX/icXJyBtbzHeARt7dS8a6heAkimYQ+bZS7wMkiKeQm9ObI2Jz?=
 =?us-ascii?Q?+nyMjd29qHM7PA703bcfcV/ivgMmnnlHGCJV7bV2h2mXCW88zNVKWWA1HrN4?=
 =?us-ascii?Q?uYTguCoi6nxcgJxB8pxaiIDTIGhhyxsrtLN5qDfICGSZ9pk3TKXtiYh3aKcl?=
 =?us-ascii?Q?XRtVSS4e6xPI3KfamayLL42oaQ4Pb7C/dOVuABW2icSRPahEi72f8FvNp2YW?=
 =?us-ascii?Q?ehvkgW+bDpvHp+USfKaQTeF9InLpfcJsGuD0K7PyqJYjRg/MiOKy3g8Sd0jk?=
 =?us-ascii?Q?RllOA+SeEYBEqCM2NJEznR2MhpMMgrO8gGJu0/X82MNDguBpbhFl8fnXuXs5?=
 =?us-ascii?Q?EDo3cz6YqXQsMlieaIZStFyRyM8l9A4s04kghNkV9PVgrfzBx3mQgtSS1yzh?=
 =?us-ascii?Q?4LirNzH/vrEnFBQg0GoaqpX1VQ32iFhsHVLzBXDohMtWUDHeRDJ5NvexZlTQ?=
 =?us-ascii?Q?Vdl3heB9jW6pzd2DybqqXmZm48v8++OFlVFgu8+BINEgSD/ZVawwypbDoEGl?=
 =?us-ascii?Q?86xDvLqlqt3gyx0Ri0p9WQIEO7ZwlYZHRFAtE+6KwnJllQSzz0Pz6vZi+D6/?=
 =?us-ascii?Q?yb181dy1d4IdGnF/RLdUejb1gHIPX6+qwvMbDRAoMdOdF1Xtv4QTMpUN7Rsw?=
 =?us-ascii?Q?43JUkI8gquFqKeKEoXkACaOUbxOK/PkMps9jX/lH6ai4D3ncIn4FtexgOEtt?=
 =?us-ascii?Q?oNcsUKBQNRuMhfXKIbA7OdkV2ISPro704jtaZgxzevj/iNuW53IWNo4j3/VE?=
 =?us-ascii?Q?ZI9gNlPAr5E2JPDiU+4tIoOh5AA7RQbL4mZyDYFHut0d5BPZyFERzT3sTPmu?=
 =?us-ascii?Q?OS8=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR11MB3159.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?JEWQQpIt/0Ynrk14c96YysbSqkc+P6/Oj9Lv37m4WoFbAQviJoKFOr2yatGo?=
 =?us-ascii?Q?tKkayQUeSHwHglqdpgmpk0ZSs35qpQhAE2sNftbeIVwFuuyCjn/j6/Da+98Z?=
 =?us-ascii?Q?TGxxa9TR+fNSWIUOv0KPy1tA9/xoS0++wnPo4HEH+KZCFPKW5RjjTSOpbRc4?=
 =?us-ascii?Q?6ZupILZWwjRCp31c8HWxv3bi0TVb4rgod+2hy2MjJ7Z+QM/NjnxoCn/pwgs7?=
 =?us-ascii?Q?k28Onpqz/QpccGUwf8B+ictAJJFjYVDEEEQyL9wHs9rmU+D2OP2t3v1oA+GW?=
 =?us-ascii?Q?e43Ixu37wFCe73Nfy017LQ/MTdMPkg8K0b8hbOG5wtxjmehb8vii19Hm7Lme?=
 =?us-ascii?Q?tje+7Q6hLXlK24CX/FvPJCRfWAiSQaRpX7wcdjWfD4/8Fdw4s/prFcKzqd1J?=
 =?us-ascii?Q?qFhtofSKGKu3nUF6rrlmEUIx8BwYkOK3UD6FpU2hC6hfXHNESw2w9iZkfu0o?=
 =?us-ascii?Q?hwdDItYFfYkexPh9LJcMu+n2eKMqyk8l5UqGpBtDwhN5NlsgBa2gN/6ETaxs?=
 =?us-ascii?Q?rq7nJZE7XgUbO4cQgykHe2ZyUNCeADL4Zl377nDB2W8Qo7geyXJr1bdWOraJ?=
 =?us-ascii?Q?sQQ7LN3noxHKzSjn3IOn3hKd2ac0XMDhUtZF8tJ4wERdKUvZ5fbzhLdz7hfd?=
 =?us-ascii?Q?JYZXnqRG/Nftj2qWMc89AjN8RKr8fKFxWjEuh328iMmcgN4hakqt4FvtlZdf?=
 =?us-ascii?Q?3c0ksISNIdDOHTSzrHd9G1Rytzt+WhHRtMFvk7SLmwMRuCDVEHRbEF8T4CbS?=
 =?us-ascii?Q?nAHE1m9nVU9n8UVMxrRpjRjurxh9g9KJ1tY41pYuFfJoNVJtM0Wg+hsOEDIP?=
 =?us-ascii?Q?cRRMhegKPQf755TjYrKx3Z5SO8LizzcX7OVkzdeCr5Qt2fDD/mh9EMu79300?=
 =?us-ascii?Q?nDPlpAC55KINCBq6GerE1Ao/ReYeFrZwI+9mdDE4sJbiwxxixXkjHHCBWnnk?=
 =?us-ascii?Q?8FJgMKd/nlrEDYuiad+IIA3fRHtcwu0Kgdyb62R6TimDxanuhYpHVPvub2I6?=
 =?us-ascii?Q?iak8HQByuYlAMyL9tsH6aoMlc81p/dkrytxUhpzjR8/ZrC/Y2mrB/b8oJ03o?=
 =?us-ascii?Q?QI/6j+MZ6yAtkUNmNI0feEi8Hn7y7dJ9eWqOSQR5HReRquMT+v9Y4K1VK8Kb?=
 =?us-ascii?Q?8W2VUfJY6RhG5FKxwW5jHq7HZgypdLJK+M4RjM5vgHdNUxqZCI1syWrJXNOJ?=
 =?us-ascii?Q?5wz/vO4ECV7JG7v6b2/n1tmCvR7rt63ijnsEvXLTTNOrDnK89JD1Pt2jGd0x?=
 =?us-ascii?Q?IofvuYG5wv7HrrhR3YfocgdNR70rL8wx2FwuvcIiUkFw6s53exKLVsrMcMNJ?=
 =?us-ascii?Q?xbEMxRmC5qCewOuoBvZmTA5CIkO93ck4B3POXH543anQ6x+XDdPYP7794dQR?=
 =?us-ascii?Q?MpeeNLGFnNnX8H44dfLkyosvWrVb2bPxcLgXop6qA4pMXD/4FB7QHpKWakS8?=
 =?us-ascii?Q?qgtGWqMElu3tM26LnhqFyKh02FD0PaP8rizmgAa6lPHQp5nYrkexqB5k5yAr?=
 =?us-ascii?Q?V1mlwjk6luDej8xXi6s6Z0NXEigDeYzxUEjBIRwaNIutBcf5+n4MM+9CXi2Y?=
 =?us-ascii?Q?ykDTicT9igt/ph8ritg=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3159.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3856707-c084-4f15-8fd1-08dcd9af5ae8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 20:03:54.7331 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cMTDa9uQ8fDXYMJeZh71r7wBK4hRt50owDoMOmJXn+9MaDO9YZShv4ZMv7+Il8S39j2lEkxY068SQEKVkXUx7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8667
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
> Sent: Friday, September 20, 2024 2:43 PM
> To: Zeng, Oak <oak.zeng@intel.com>
> Cc: intel-xe@lists.freedesktop.org
> Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in debugfs
>=20
> On Fri, Sep 20, 2024 at 09:57:19AM -0600, Zeng, Oak wrote:
> >
> >
> > > -----Original Message-----
> > > From: Brost, Matthew <matthew.brost@intel.com>
> > > Sent: Thursday, September 19, 2024 3:02 PM
> > > To: Zeng, Oak <oak.zeng@intel.com>
> > > Cc: intel-xe@lists.freedesktop.org
> > > Subject: Re: [PATCH] drm/xe/debugfs: Display gpuva info in
> debugfs
> > >
> > > On Wed, Sep 18, 2024 at 12:45:45PM -0400, Oak Zeng wrote:
> > > > Add debugfs entry to display all the gpuva that is bound to the
> > > > device. This is done by walking all the VMs created for each
> device
> > > > process, and display va information of each VM. This is useful for
> > > > gpuvm debugging. With this change, user can display gpuva info
> > > > as below:
> > > >
> > > > root@DUT7279PVC:/home/gta# cat
> > > /sys/kernel/debug/dri/0/gpuvas
> > > > Process "your process name" GPU VA space
> > > > DRM GPU VA space (Xe VM)
> > > [0x0000000000000000;0x0200000000000000]
> > > > Kernel reserved node
> [0x0000000000000000;0x0000000000000000]
> > > >
> > > >  VAs | start              | range              | end               =
 | object             |
> > > object offset
> > > > -------------------------------------------------------------------=
-----------
> -----
> > > --------------------------
> > > >      | 0x0000000000000000 | 0x00007ffff5db7000 |
> > > 0x00007ffff5db7000 | 0x0000000000000000 | 0x0000000000000000
> > > >      | 0x00007ffff5db7000 | 0x0000000000001000 |
> > > 0x00007ffff5db8000 | 0x0000000000000000 | 0x00007ffff5db7000
> > > >      | 0x00007ffff5db8000 | 0x00ff80000a248000 |
> > > 0x0100000000000000 | 0x0000000000000000 | 0x0000000000000000
> > > >
> > >
> > > This looks useful. We may even want to extend wedged mode to
> > > switch the
> > > VM to a state where this is available after a hang which causes a
> > > wedge
> > > as this could useful. Can be done in a follow up later.
> > >
> > > > Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_debugfs.c | 44
> > > +++++++++++++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_debugfs.c
> > > b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > index 1011e5d281fa..0c7bee1c2a8d 100644
> > > > --- a/drivers/gpu/drm/xe/xe_debugfs.c
> > > > +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> > > > @@ -9,6 +9,7 @@
> > > >  #include <linux/string_helpers.h>
> > > >
> > > >  #include <drm/drm_debugfs.h>
> > > > +#include <drm/drm_drv.h>
> > > >
> > > >  #include "xe_bo.h"
> > > >  #include "xe_device.h"
> > > > @@ -84,9 +85,52 @@ static int sriov_info(struct seq_file *m,
> void
> > > *data)
> > > >  	return 0;
> > > >  }
> > > >
> > > > +static int show_vm_gpuvas(struct xe_vm *vm, struct seq_file
> *m)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&vm->snap_mutex);
> > > > +	ret =3D drm_debugfs_gpuva_info(m, &vm->gpuvm);
> > > > +	mutex_unlock(&vm->snap_mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int show_each_vm(struct seq_file *m, void *arg)
> > > > +{
> > > > +	struct drm_info_node *node =3D (struct drm_info_node *)m-
> > > >private;
> > > > +	struct xe_device *xe =3D node_to_xe(node);
> > > > +	struct drm_device *dev =3D &xe->drm;
> > > > +	struct drm_file *file;
> > > > +	struct xe_file *xef;
> > > > +	int (*show)(struct xe_vm *, struct seq_file *) =3D node-
> > > >info_ent->data;
> > > > +	struct xe_vm *vm;
> > > > +	unsigned long idx;
> > > > +	int ret =3D 0;
> > > > +
> > > > +	mutex_lock(&dev->filelist_mutex);
> > > > +	list_for_each_entry(file, &dev->filelist, lhead) {
> > > > +		xef =3D (struct xe_file *)file->driver_priv;
> > > > +		seq_printf(m, "Process %s GPU VA space\n", xef-
> > > >process_name);
> > > > +		mutex_lock(&xef->vm.lock);
> > > > +		xa_for_each(&xef->vm.xa, idx, vm) {
> > >
> > > Kinda a nit but I've said this in a few other places - the xef-
> >vm.lock
> > > read usage isn't right here. This look protects the xarray lookup
> and
> > > ref to VM and nothing else. It is not designed to do anything else -
> > > e.g. holding the lock then calling another function.
> >
> > I don't see a problem calling a function holding xef->vm.lock. we
> require
> > Vm to be alive while calling show_vm_gpuvas, and xef->vm.lock
> guarantees
> > Vm is alive because it guarantee vm is on the xarray and as long as it
> is on
> > The xarray we hold a vm ref.
> >
>=20
> Your code works, it is about having well defined locks and not abusing
> them.
>=20
> To repeat - this lock protects the lookup and taking a ref. It is not
> intended to be taken and do other things underneath it, certain not
> intended to be an outer lock of sorts.
>=20
> > >
> > > With that this loop should look like this.
> > >
> > > mutex_lock(&xef->vm.lock);
> > > xa_for_each(&xef->vm.xa, idx, vm) {
> >
> > I don't think xa_for_each is safe againt removing items from xarray,
> > At least this is my understanding.
> >
>=20
> It is [1]. The lock protects the ref to VM so after lookup it is not
> immediately freed it does not protect the lookup itself, xa has locking
> for that.

You are right. Now I agree xa_for_each is safe against xarray modification.

>=20
> [1]
> https://elixir.bootlin.com/linux/v6.11/source/include/linux/xarray.h#
> L491
>=20
> > > 	xe_vm_get(vm);
> > > 	mutex_unlock(&xef->vm.lock);
> > >
> > > 	/* Do something */
> > >
> > > 	mutex_lock(&xef->vm.lock);
> > > 	xe_vm_put(vm);
> > > }
> > > mutex_unlock(&xef->vm.lock);
> > >
> > > This avoids unintentionally creating locking chains, in this case
> > > xef->vm.lock -> snap_mutex. We should strive to only create well
> > > defined
> > > changes of locking. Once we start unintentionally creating locking
> > > chains it hard to unwind in a driver.
> >
> > Can we annotate the xef->vm.lock -> snap_mutex locking order?
> > It is reasonable to me from the locking hierarchy here: xef->vm.lock
> > Is at the xe file level, and snap_mutex is at vm level.  we can create
> > multiple vms to one xe file, so the locking order seems natural to
> me.
> >
> > the key point is, not be afraid of creating locking chain, instead,
> creating
> > locking chain at reasonable order. Fortunately, the locking order in
> this
> > case is very obvious.
> >
>=20
> We could annotate it but I'd rather just avoid a chain. In general
> creating chains is a bad idea and great way to have locking which can't
> be understood or get inversions.
>=20
> Again this works but it fairly easy to avoid creating this chain so
> let's not do it.

If you think this is better, I can change the codes as you indicated. Not a=
 big deal.

>=20
> The only place we really have chains in Xe is in memory management
> code
> (VM and dma-resv locks) which absolutely required are very well
> defined.
>=20
> > >
> > > Likewise I suspect we really shouldn't be holding dev-
> >filelist_mutex
> > > and doing things underneath it. Fixing that would likely require
> > > converting &dev->filelist to an xarray or writing an iterator with a
> > > hitch though so is a bit of a larger change. Looking at the usage of
> > > this lock, I'd say this is kinda abusing this lock too and I don't th=
ink
> > > anyone in the community would be all that happy about its usage
> > > here.
> > > I'd lean towards we need to properly fix this, or alternatively
> maybe
> > > just maintain a per device storage of all the VMs.
> >
> > Take a look at drm_client_info function. Holding filelist_mutex and
> doing
>=20
> I don't see that function [2].
>=20
> [2] https://elixir.bootlin.com/linux/v6.11/A/ident/drm_client_info`
>=20
> I see drm_clients_info...


Sorry it was a typo. I meant drm_clients_info. It is here:

https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/drm_debugfs.c=
#L73

This function not only takes a master_lookup_lock, but also a rcu_read_lock=
.

And it does a lot of things underneath.

Same behavior is demonstrated by amdgpu_debugfs_vm_info_show.

They are all correct usage of the lock. Very natural and straight forward
To me. Not at all an abusive.

So why you think differently? By carefully read your words, I found there a=
re
Very subtle different understanding of locks.

" This look protects the xarray lookup " - I understand it differently. I t=
hink the lock
Protect xarray itself, not lookup. Any modification or walking of the xarra=
y need
To hold this lock.

Those locks protect variables or data structure, not action.

So in my original codes, by using those locks in my original way, I basical=
ly say:
I am walking all the files in a device and all the vms in a file, please no=
body
Is allowed to modify file list and vm xarray.

(Of course you could argue there could be efficiency issue because you hold
Lock for long time. But this is just debugfs where you usually don't care m=
uch
About the efficiency. Of course this is also not the argument here.)

I think we should first agree on this point. So I am not going to reply to
What you said below.

Oak

>=20
> That function does take fpriv->master_lookup_lock in
> drm_is_current_master but that IMO is well defined and within the
> DRM
> layer too. We also shouldn't take a lock from different layer and make
> rules of what we can with it.
>=20
> I guess AMD and vmwgfx [3] take this lock in kinda similar ways but
> IMO
> that is a bit abusive, in particular this usage [4].
>=20
> [3] https://elixir.bootlin.com/linux/v6.11/A/ident/filelist_mutex
> [4]
> https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/amd/
> amdgpu/amdgpu_debugfs.c#L1771
>=20
> > Things underneath, including hold another lock, seems fine. That
> codes have
> > Been there for many years without a problem. It is just natural to
> hold
>=20
> Again I think it works but that is not my point.
>=20
> > Filelist_mutex to walk device's file list as this lock is designed to
> protect the
> > File list. I don't think it is a abusing of this lock.
> >
> > So I think it is reasonable to annotate a dev filelist_mutext->xef
> vm.lock->vm snap_mutex
> > Locking order. This is the same order of creating device ->device file
> descriptor for device->gpuvm
> > For a device file descriptor. Any reversed order locking is not
> reasonable thus a kernel driver
> > Bug.
> >
>=20
> I disagree here and think it easy to have a well defined xarray + lock
> of VMs attached to the device with same semantics as xef->vm.lock.
>=20
> Now that I'm looking, we already have that xe_device.usm.asid*.
> Maybe
> just repurpose that structure / lock to be non-usm specific (e.g.
> always
> assign a VM a ASID and insert into it). Your loop here then would look
> like the on described in my previous reply with taking a ref to the VM
> and then dropping the lock for main part of the implementation. That
> seems better.
>=20
> Matt
>=20
> > Oak
> >
> > >
> > > Matt
> > >
> > > > +			ret =3D show(vm, m);
> > > > +			if (ret < 0)
> > > > +				break;
> > > > +
> > > > +			seq_puts(m, "\n");
> > > > +		}
> > > > +		mutex_unlock(&xef->vm.lock);
> > > > +	}
> > > > +	mutex_unlock(&dev->filelist_mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > >  static const struct drm_info_list debugfs_list[] =3D {
> > > >  	{"info", info, 0},
> > > >  	{ .name =3D "sriov_info", .show =3D sriov_info, },
> > > > +	DRM_DEBUGFS_GPUVA_INFO(show_each_vm,
> > > show_vm_gpuvas),
> > > >  };
> > > >
> > > >  static int forcewake_open(struct inode *inode, struct file *file)
> > > > --
> > > > 2.26.3
> > > >
