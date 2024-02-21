Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B046C48BF6
	for <intel-xe@archiver.kernel.org>; Wed, 21 Feb 2024 14:41:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D066110E771;
	Wed, 21 Feb 2024 14:41:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g0pas+rW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F8D10E771
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Feb 2024 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708526509; x=1740062509;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=RV7+E4E7tgbBj8HFNbYZ897i1D/gnLiq2z+74mDZUUE=;
 b=g0pas+rWXnVl0WCqTTlxNDZev/hzo41WPk3nlD4GpE+TzAnVAf2Cn/Bz
 yo/SuIDZWwdNllIVqRBXJvqBC1UAaidaftubDrXG01uNa9KG8mzbrqXdH
 5wrbYfTA5f8zk4r93xrXtdJrbQvIbbSSpMe2PJfjA2FzR/KXP1iGifm+w
 vFr/4qCbK2Zgn8DLES/BevKi2BIex3apjZWnjIg4OU5vAsiYNKAQi5V0H
 JfOzqvS7VD7qPKkEY+UMTQYfBe2ertt5MUHhvuZ1YH3MWV6iytBRi27Sp
 wDhsIpC0IwX46RM5m5NiKNpm+ONRJneABNPzdio7UhvNwb3mwvjvuCDet g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="20228763"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; d="scan'208";a="20228763"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 06:41:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5159391"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 21 Feb 2024 06:41:48 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:41:47 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 21 Feb 2024 06:41:46 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 21 Feb 2024 06:41:46 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 21 Feb 2024 06:41:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UGk5uJagwPgkrqszOlDNsUcW8H5xhiM29SG1gbvEXxlDsc4gC5K9uJm/K0OnQRC1oejB2ltIRt7XawrjFbBDmQb+lvNgBIdVcAYl17ylSSNtCTuucxvgw+9w8evAKZz70Y6d4LCURENSbwGoXey+spRDaVdmJdPgDCyra1PO7j1H5yICrFYNFOPVfP7uVKrKx23m2xlTQn1NCJQ1LEjivF9oKut2qGmgyFXrm5miPbSnXle2+aQry2vdlMVlAQ/J5f4j8AVyB+E+bVrwlb5ZYkLWqzBb8HHvLp7r5p3setK3v0o64CZlRgvs0sZ08IrBPj/cgY/EBoZVFZ4lzl07vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JYO7wIEWwbV5sVuHDDFXhTCu4i/P6FM5XBNmGu0BRzo=;
 b=UeQSJfkROPtHmOoT0YhSyEkpZMJB3nkrEiKMoeiydHEJm+9BIPQPqdfHbnIhx/TVVrHXkG0qKQtPnInwDxdSV0YFs4T+EDFMgXDQp+pHp0e+YjjHmPa9F0hBb6rEW4WHnzI/zAgNR9oTp1FvPjL1LrAZIcD4ud3+SQQJFsTmLNNWdY17wVFxUfWFU6+HIKRB6GM5mK5phHq/49MZV7E7xXMef0jSAvlB9R7sHR1tiw4j88oLbK4YMPvuIRa6AAy05XNG1LvRHSNKgGLsgi8cuirfE+LcCK8PJ5Fxny//RAgEiSaLxgMXrc7patTw0lSDRzvJvwc1bWkjYiCUrRAWIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SN7PR11MB7639.namprd11.prod.outlook.com (2603:10b6:806:32a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Wed, 21 Feb
 2024 14:41:44 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::35eb:1d4b:b90f:e584%3]) with mapi id 15.20.7292.033; Wed, 21 Feb 2024
 14:41:44 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Dugast, Francois" <francois.dugast@intel.com>, "Vivi, Rodrigo"
 <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Auld, 
 Matthew" <matthew.auld@intel.com>
Subject: RE: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Topic: [PATCH 01/14] drm/xe: Document Xe PM component
Thread-Index: AQHaYEYHfnvM7fqb+UaHLrAxq8puObEUvIoAgAAk86A=
Date: Wed, 21 Feb 2024 14:41:44 +0000
Message-ID: <CY5PR11MB621115DF0A46D62420E2859B95572@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240215193430.130106-1-rodrigo.vivi@intel.com>
 <ZdXngrtmc58-Zyfj@fdugast-desk.home>
In-Reply-To: <ZdXngrtmc58-Zyfj@fdugast-desk.home>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SN7PR11MB7639:EE_
x-ms-office365-filtering-correlation-id: e2b37008-1281-48c2-7e03-08dc32eb3972
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: heyqEJ9t3au63gGJGO5gq/s+M5ShjZp8CHPSqeKnew2w/5uylxYgsmsY8sCecOyaxMJaNKnoaxF8yVH5gyLEEXP6ZutDU3jRSYghyNVsxLEVgoW6dJo//6pGW9kX6ZAS6tU+jlu4u4MmfpI0vO04+9vtUIvvbGR2TjohlLATkL8xeQMHf9QFeFAW89Efp2YZ9HRa+co3oVEl4NYbV6rSvlygkQeIOm2SU/YnWNxRQofB52ln+xxnqJiyYc6gKWeE+rttuj5MGuihYqZ2aomRSwjZjLt4x28n7zgV2YnBtkqpPg9NXgGKR0IHm0Whq+Ac6Z3Oiqi6mr0VJmjPtg5k85vdVeqaKI3ZiCbSnDWN2k8IN9DqVjo96L1tLgQv6HhEVx4iFzJXfBZ04/JrHagbgVvcUPgIlDb8jUdCYBm8KXrQDzeX+WasrMt3hs+Xtauvv5jNc6y8TRs5MNrMdG9d0pSkA44gXord2AROwsrqjx7ubu55AsiUdyHzzNDFLUE6kxU1YtL6lti4zcJ1KiPIf1jLD638iIbHOaj2f/udLMyglslCb14fqb6A7pOtVSGi+pje5BkHFs5pU1YAGRB0lXOB48958qcFtqj/05/2Kidroaz51X0xCR6oofClNfjp
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?jcNH3Smy2kkDg/AhJLnnEZSjhCmavVJ/3psNxUCI92eKIHMejek1ogn6U4l1?=
 =?us-ascii?Q?yKPIJN8+PZ4VnqEMsHZ04ObufBu9XVnGJZb/nA6tWkvAD8suLJIXTu2rQ0mE?=
 =?us-ascii?Q?syGarP9vHNHiulGpam8OUOD4UNx3/Aj0Yg4XJjLZUowIx7yeI1strXD0WRLk?=
 =?us-ascii?Q?tmVLA2APZvxI27QhaTH5GPxjgAfCvFVX7HHqARXhg7fnyMODcBgN3zCyuxx6?=
 =?us-ascii?Q?ku1dlt86chMS2u/wWs/HOBKdEQf8w91G7yo/RHVN/cDI8TAJTa7FV8prMTsf?=
 =?us-ascii?Q?ux1xnaCj5w9yQ9A9BmMHwbMY4WmJKXwGuKwW1cAKFBY1AYgQ0Q4UbJtXQI9h?=
 =?us-ascii?Q?V7MuSio0nwR9XiutHI8MtW7AfsN77nJKpD3s+DKrNI7a9YTpe4+f0xbk5d8e?=
 =?us-ascii?Q?asgdL8M3ajwLHLQ+wXCTC5BhTapjmJE27LOrbNMY+vEBNxG9/c0i0VcboO2W?=
 =?us-ascii?Q?XHjr9Yb9DRaRFMFv/ArhFM4DeuViP8vYpO/PLgDmRFJTXABIcvACnEMoH3eD?=
 =?us-ascii?Q?//EEELCtfXcYE9kMrqxARNzWozXU+3u/rwsLsrqFALmIX97nZ6OHq12pPrIz?=
 =?us-ascii?Q?4YJm/nqE+T4PYSDoUGIJ8Ayb/Witf+nl2h3+/8ms5Y10XimeMWTmNepsQXiu?=
 =?us-ascii?Q?XSoEg46weQzL4+NyFIjG7u/uEvwpLTg71R29/C26l1gjUdgz60d1PQjOIkG6?=
 =?us-ascii?Q?V90maj7Xs+OOhMP5W9G3Tg+cYiGFXPBncNGxG0oc137hJ++sMLqU8BILeVHc?=
 =?us-ascii?Q?XnkjKDXp2pDpEAZEzLIC8vVzYHpob0jTslyP8fzh+bKci5Xa4zGx8z2NX8aY?=
 =?us-ascii?Q?xE5Id2Nj8IB0h1zXLcC/YZdCeHV5AdF2rBe6Ma9hdt99/M8dPocAEN42t72y?=
 =?us-ascii?Q?DfYAEB21HO0e6NkwaUkR5hPRwAGtDhnmGbO5z6wQqdiS7irI2p8ShXxaeP/u?=
 =?us-ascii?Q?u5qnDPQhG/P621X8HkF0DDU6toCnM0C8VLzNibyNcQxNggMi8Xy6tVc6QvbO?=
 =?us-ascii?Q?QM37zq/8K0vBwFum284FcRZNpEv0HlUt1wpbUcnicW9DnkYa3X2Dqdy4GPQN?=
 =?us-ascii?Q?zh6jnOmQ/+s2D3V9yYwskrV1gP8Oht84Nsza+s/DFmd0sC0rtFA/gjzrWxwI?=
 =?us-ascii?Q?XNUsQh0EFqmhIDVbP3Szmb/duC6Rmx5UHr++tAFr13XLGnjPp+tHXSbu0/IP?=
 =?us-ascii?Q?AxgS2ngjRsPsVYy8yQS2KR3X8rchqSZHAZd/D5OT6pCcP0pdjGXPm8odrYXW?=
 =?us-ascii?Q?kOzCywRthyBLOp/+pwQW+y1G6aT6tuVypy36lAT9gLTWHfjCfbUBnpjyxR0f?=
 =?us-ascii?Q?ajMEe+51JV+aExhXnBvGDX2R+aFQxnMnULtE8MVma0NNe1cBPgHevTh/1Dr3?=
 =?us-ascii?Q?KAfBOqMaGcFGkh6v4Ij3yASW9rDMhON65TWjmjHg7Jw3byWnkEmOKcY74MGn?=
 =?us-ascii?Q?7BzCPb0yhEw2Z2T0kfh1526DWSZ0jz8PtAMe8ZuQyJZH4G0gfcrzheeDKvJY?=
 =?us-ascii?Q?/d4lYEOXPQnyXekIsiaX352fu0P8abAPkkqnIasDApd/TcxSGteMG3++D/51?=
 =?us-ascii?Q?bs5sNpGF98DVjGDOvT0KhP0UHZqDmPkjWdKIetXj?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2b37008-1281-48c2-7e03-08dc32eb3972
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2024 14:41:44.1785 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 97FawaxG7YJ3TX+ZjABgQYrwTT8eIrP677z23oy5pnNFrIkap8tyukviQzc/jMz6tbfZramVUykQLD9uiGNxjyTPTlfLxm8f8agigAFlFec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7639
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
> From: Dugast, Francois <francois.dugast@intel.com>
> Sent: Wednesday, February 21, 2024 5:38 PM
> To: Vivi, Rodrigo <rodrigo.vivi@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Auld, Matthew <matthew.auld@intel.com=
>;
> Gupta, Anshuman <anshuman.gupta@intel.com>
> Subject: Re: [PATCH 01/14] drm/xe: Document Xe PM component
>=20
> On Thu, Feb 15, 2024 at 02:34:17PM -0500, Rodrigo Vivi wrote:
> > Replace outdated information with a proper PM documentation.
> > Already establish the rules for the runtime PM get and put that Xe
> > needs to follow.
> >
> > Also add missing function documentation to all the "exported" functions=
.
> >
> > v2: updated after Francois' feedback.
> >     s/grater/greater (Matt)
> >
> > Cc: Matthew Auld <matthew.auld@intel.com>
> > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > Acked-by: Francois Dugast <francois.dugast@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_pm.c | 108
> > +++++++++++++++++++++++++++++++++----
> >  1 file changed, 97 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > index ab283e9a8b4e..64ffb9a35448 100644
> > --- a/drivers/gpu/drm/xe/xe_pm.c
> > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > @@ -25,21 +25,46 @@
> >  /**
> >   * DOC: Xe Power Management
> >   *
> > - * Xe PM shall be guided by the simplicity.
> > - * Use the simplest hook options whenever possible.
> > - * Let's not reinvent the runtime_pm references and hooks.
> > - * Shall have a clear separation of display and gt underneath this com=
ponent.
> > + * Xe PM implements the main routines for both system level suspend
> > + states and
> > + * for the opportunistic runtime suspend states.
> >   *
> > - * What's next:
> > + * System Level Suspend (S-States) - In general this is OS initiated
> > + suspend
> > + * driven by ACPI for achieving S0ix (a.k.a. S2idle, freeze), S3
> > + (suspend to ram),
> > + * S4 (disk). The main functions here are `xe_pm_suspend` and
> > + `xe_pm_resume`. They
> > + * are the main point for the suspend to and resume from these states.
> >   *
> > - * For now s2idle and s3 are only working in integrated devices. The
> > next step
> > - * is to iterate through all VRAM's BO backing them up into the
> > system memory
> > - * before allowing the system suspend.
> > + * Runtime Suspend (D-States) - This is the opportunistic PCIe device
> > + low power
> > + * state D3. Xe PM component provides `xe_pm_runtime_suspend` and
> > + * `xe_pm_runtime_resume` systems that PCI subsystem will call before
> > + transition
> > + * to D3. Also, Xe PM provides get and put functions that Xe driver
> > + will use to
> > + * indicate activity. In order to avoid locking complications with
> > + the memory
> > + * management, whenever possible, these get and put functions needs
> > + to be called
> > + * from the higher/outer levels.
> >   *
> > - * Also runtime_pm needs to be here from the beginning.
> > + * The main cases that need to be protected from the outer levels
> > + are: IOCTL,
> > + * sysfs, debugfs, dma-buf sharing, GPU execution.
> >   *
> > - * RC6/RPS are also critical PM features. Let's start with GuCRC and
> > GuC SLPC
> > - * and no wait boost. Frequency optimizations should come on a next st=
age.
> > + * PCI D3 is special and can mean D3hot, where Vcc power is on for
> > + keeping memory
> > + * alive and quicker low latency resume or D3Cold where Vcc power is
> > + off for
> > + * better power savings.
> > + * The Vcc control of PCI hierarchy can only be controlled at the PCI
> > + root port
> > + * level, while the device driver can be behind multiple
> > + bridges/switches and
> > + * paired with other devices. For this reason, the PCI subsystem
> > + cannot perform
> > + * the transition towards D3Cold. The lowest runtime PM possible from
> > + the PCI
> > + * subsystem is D3hot. Then, if all these paired devices in the same
> > + root port
> > + * are in D3hot, ACPI will assist here and run its own methods (_PR3
> > + and _OFF)
> > + * to perform the transition from D3hot to D3cold. Xe may disallow
> > + this
> > + * transition by calling pci_d3cold_disable(root_pdev) before going
> > + to runtime
> > + * suspend. It will be based on runtime conditions such as VRAM usage
> > + for a
> > + * quick and low latency resume for instance.
> > + *
> > + * Intel systems are capable of taking the system to S0ix when
> > + devices are on
> > + * D3hot through the runtime PM. This is also called as 'opportunistic=
-S0iX'.
> > + * But in this case, the `xe_pm_suspend` and `xe_pm_resume` won't be
> > + called for
> > + * S0ix.
Hi Rodrigo,
Sorry of late review comment, was busy with other stuff.
we do need modify the doc slightly.
For integrated graphics D3hot is not necessary to achieve for the host s0ix=
, like with PSR panel
PCI device will be in D0 state as KMS CRTC will be active and will  held a =
device wakeref.

AFAIK for discrete card perspective, host s0ix requires PCIe link to be in =
low power state.
Thanks,
Anshuman Gupta.
> > + *
> > + * This component is no responsible for GT idleness (RC6) nor GT
> > + frequency
>=20
> Isn't it s/no/not/? Or s/no/neither/ + s/nor/nor for/? In any case:
>=20
> Reviewed-by: Francois Dugast <francois.dugast@intel.com>
>=20
> Francois
>=20
> > + * management (RPS).
> >   */
> >
> >  /**
> > @@ -178,6 +203,12 @@ void xe_pm_init_early(struct xe_device *xe)
> >  	drmm_mutex_init(&xe->drm, &xe->mem_access.vram_userfault.lock);
> >  }
> >
> > +/**
> > + * xe_pm_init - Initialize Xe Power Management
> > + * @xe: xe device instance
> > + *
> > + * This component is responsible for System and Device sleep states.
> > + */
> >  void xe_pm_init(struct xe_device *xe)  {
> >  	/* For now suspend/resume is only allowed with GuC */ @@ -196,6
> > +227,10 @@ void xe_pm_init(struct xe_device *xe)
> >  	xe_pm_runtime_init(xe);
> >  }
> >
> > +/**
> > + * xe_pm_runtime_fini - Finalize Runtime PM
> > + * @xe: xe device instance
> > + */
> >  void xe_pm_runtime_fini(struct xe_device *xe)  {
> >  	struct device *dev =3D xe->drm.dev;
> > @@ -225,6 +260,12 @@ struct task_struct *xe_pm_read_callback_task(struc=
t
> xe_device *xe)
> >  	return READ_ONCE(xe->pm_callback_task);  }
> >
> > +/**
> > + * xe_pm_runtime_suspend - Prepare our device for D3hot/D3Cold
> > + * @xe: xe device instance
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> >  int xe_pm_runtime_suspend(struct xe_device *xe)  {
> >  	struct xe_bo *bo, *on;
> > @@ -290,6 +331,12 @@ int xe_pm_runtime_suspend(struct xe_device *xe)
> >  	return err;
> >  }
> >
> > +/**
> > + * xe_pm_runtime_resume - Waking up from D3hot/D3Cold
> > + * @xe: xe device instance
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> >  int xe_pm_runtime_resume(struct xe_device *xe)  {
> >  	struct xe_gt *gt;
> > @@ -341,22 +388,47 @@ int xe_pm_runtime_resume(struct xe_device *xe)
> >  	return err;
> >  }
> >
> > +/**
> > + * xe_pm_runtime_get - Get a runtime_pm reference and resume
> > +synchronously
> > + * @xe: xe device instance
> > + *
> > + * Returns: Any number greater than or equal to 0 for success,
> > +negative error
> > + * code otherwise.
> > + */
> >  int xe_pm_runtime_get(struct xe_device *xe)  {
> >  	return pm_runtime_get_sync(xe->drm.dev);  }
> >
> > +/**
> > + * xe_pm_runtime_put - Put the runtime_pm reference back and mark as
> > +idle
> > + * @xe: xe device instance
> > + *
> > + * Returns: Any number greater than or equal to 0 for success,
> > +negative error
> > + * code otherwise.
> > + */
> >  int xe_pm_runtime_put(struct xe_device *xe)  {
> >  	pm_runtime_mark_last_busy(xe->drm.dev);
> >  	return pm_runtime_put(xe->drm.dev);
> >  }
> >
> > +/**
> > + * xe_pm_runtime_get_if_active - Get a runtime_pm reference if device
> > +active
> > + * @xe: xe device instance
> > + *
> > + * Returns: Any number greater than or equal to 0 for success,
> > +negative error
> > + * code otherwise.
> > + */
> >  int xe_pm_runtime_get_if_active(struct xe_device *xe)  {
> >  	return pm_runtime_get_if_active(xe->drm.dev, true);  }
> >
> > +/**
> > + * xe_pm_assert_unbounded_bridge - Disable PM on unbounded pcie
> > +parent bridge
> > + * @xe: xe device instance
> > + */
> >  void xe_pm_assert_unbounded_bridge(struct xe_device *xe)  {
> >  	struct pci_dev *pdev =3D to_pci_dev(xe->drm.dev); @@ -371,6 +443,13
> @@
> > void xe_pm_assert_unbounded_bridge(struct xe_device *xe)
> >  	}
> >  }
> >
> > +/**
> > + * xe_pm_set_vram_threshold - Set a vram threshold for
> > +allowing/blocking D3Cold
> > + * @xe: xe device instance
> > + * @threshold: VRAM size in bites for the D3cold threshold
> > + *
> > + * Returns 0 for success, negative error code otherwise.
> > + */
> >  int xe_pm_set_vram_threshold(struct xe_device *xe, u32 threshold)  {
> >  	struct ttm_resource_manager *man;
> > @@ -395,6 +474,13 @@ int xe_pm_set_vram_threshold(struct xe_device *xe,
> u32 threshold)
> >  	return 0;
> >  }
> >
> > +/**
> > + * xe_pm_d3cold_allowed_toggle - Check conditions to toggle
> > +d3cold.allowed
> > + * @xe: xe device instance
> > + *
> > + * To be called during runtime_pm idle callback.
> > + * Check for all the D3Cold conditions ahead of runtime suspend.
> > + */
> >  void xe_pm_d3cold_allowed_toggle(struct xe_device *xe)  {
> >  	struct ttm_resource_manager *man;
> > --
> > 2.43.0
> >
