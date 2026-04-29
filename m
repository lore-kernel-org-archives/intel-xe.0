Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F9BCCFA13
	for <intel-xe@archiver.kernel.org>; Wed, 29 Apr 2026 16:22:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC80510E304;
	Wed, 29 Apr 2026 16:22:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hnO97/kB";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF9D10E304
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Apr 2026 16:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1777479756; x=1809015756;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MU0w0j9d+861tEINp90cDP/Ng9mrV/wbr7zelFhmj74=;
 b=hnO97/kBMdYoftJ/Q0xpEDxEpi5KaGVWFHEEndaj2xdtd6ILcWKqK2aH
 BcuHOaDXmv+OJYXg5zK2+I5kFm4BIotUTUkclTguuLi2V/SAtv+urMZpR
 Jd/iIBrSvYPxe+Ze0zeFPy33Clxsd8jVaSAmTQdJOc9/Td0RkKVoS+jSR
 xwL8R7XQ3QVFy6tHyitkMgMHgKUmv5ZC+LSe2SIqnslCjeBY9rWBkVSis
 cmIfee2DiPxSB99RqbPMGtjRwikLtgFisvq9gG11whhOD7SFgURDmaIU1
 EjbB2djc23PY2JqBAfGmMBFHmgdegYDqd1L8PseY2acrPDwzXJ23EahAh g==;
X-CSE-ConnectionGUID: v1hlMNKETE2SSjVJDqYDmA==
X-CSE-MsgGUID: qLtkXxEURgOfVnff8ikqCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89107741"
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="89107741"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 09:22:36 -0700
X-CSE-ConnectionGUID: 4iFrubdfShWUxvqq9KV5Eg==
X-CSE-MsgGUID: uROy2pcBS96yYqRgAqITig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,206,1770624000"; d="scan'208";a="233467921"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Apr 2026 09:22:36 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 09:22:35 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 29 Apr 2026 09:22:35 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.29) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 29 Apr 2026 09:22:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L9hwO/DMXlWgZrIo8Cng9ioPZ2DQ14lyMwSVDCr+o7r3yxIdyb7CgjGigktUdXtuILyWQBUsewFyLV/PFQozGtLFIn2NeSIBNtmxB9DA6dm9itc/V+rasxJMWTQEJYO6YbRYu5mRMp5uZEnCwTF9JlzKhllciudmIvq3vPq00fH3oFgtYVPNbpD7c4k3cwuh+dghHjw6ycqvBj2M5fesvDS8/Kh53xyyrS6vLmPu9PabeWBRJPPOXiHHXJ2RWkKAKpqY9lQ3LVj4Z4AnWxfIMSxUOrc/M5Awvsilf7CGNGDxUR5uOcm0CP1lVB4rkHuOUCY33K/of6tqRgCiBri+KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEgl9ZTjbZyImmNBQSTxSqwpkRASfZwI9aTPgc78o4c=;
 b=Ksnhus7Wu0CLF0bg5I/iq3qqeWawZihpjIMm8H7bsWqZEEvHBdPoG6IRanGpRSiTfM4dhh7K0i469DIbgt5zzXrKiqhFwQGr5Vi1cfGBBxFdNVU+wTQM+70ip+kXfNeOX1FuBbXaq+oD/XKFTckgfehLrC3Ulj/lxSol7Ru+H9Hb9HdNKglH7C2hoF1p32gMUFAkmfgnOtdR/LocJaztfEnKK+8LB5vjoMoHvVSZAcYjp+q2W6mIock4VxikxCOXwp2Yt05WvMqvQ5xJrFSDT0Avg/mDD4l/55E/igKGN/jeX58mldDtHcEiN1foeOeiqTbrT4zQ6HXLqxJ47420xQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY5PR11MB6488.namprd11.prod.outlook.com (2603:10b6:930:30::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Wed, 29 Apr
 2026 16:22:31 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9870.016; Wed, 29 Apr 2026
 16:22:30 +0000
Date: Wed, 29 Apr 2026 12:22:25 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 <intel-xe@lists.freedesktop.org>, <matthew.brost@intel.com>,
 <thomas.hellstrom@linux.intel.com>, <riana.tauro@intel.com>,
 <michal.wajdeczko@intel.com>, <matthew.d.roper@intel.com>,
 <michal.winiarski@intel.com>, <matthew.auld@intel.com>,
 <maarten@lankhorst.se>, <jani.nikula@intel.com>, <lukasz.laguna@intel.com>,
 <zhanjun.dong@intel.com>, <lukas@wunner.de>, <badal.nilawar@intel.com>
Subject: Re: [PATCH v6 8/8] drm/xe/pci: Introduce PCIe FLR
Message-ID: <afIwQWRZyZqM2lWl@intel.com>
References: <20260423100017.1051587-1-raag.jadav@intel.com>
 <20260423100017.1051587-9-raag.jadav@intel.com>
 <2de7d34d-6f47-4327-9290-7cebfd47a69d@intel.com>
 <afGKM1bKyORzPzJ-@black.igk.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <afGKM1bKyORzPzJ-@black.igk.intel.com>
X-ClientProxiedBy: BYAPR03CA0035.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::48) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY5PR11MB6488:EE_
X-MS-Office365-Filtering-Correlation-Id: bfa52754-dd27-427a-85ec-08dea60b8264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|56012099003|22082099003|18002099003; 
X-Microsoft-Antispam-Message-Info: 75A+RpVb+loUb4givNW8r1sBXEJTXxK5Ink1hPWIGBdbAFbPikhl9afIOGxFGvm2A83rEhzTgN8OFGeP8yswJtT8/U8vqG4ypMeTZ32AH5iMnN5xYTkFT/m9Ku6oNdsLqZ8gKMF7jdIp5Dub1geI2TrSQrfbPOjjYGjDDoNVl0JtaGFDIYUHOWR96uB8uGUS6KeozTXcIWX0FWhTCBXRUzqzJcoEtTdVu0c+ozQEYS8etI4yITV86xEUFd8HfdyKtVX4y2lKItpUm8uO9y0AcGwxb/n6Ue9PQijVjIOS7zUBmXR0XMUl+LzWcIsNihYQs1XLufnb8BKOO/DM1vg/7Ait/hDJYpueQGzDBwWFM2o/0J3PIgzz7JPnM/QOCUf4LABqRORpGeqYM4zCjqcLRuJzyO66y6pP9XSzuVsvT6YqY8dDTJkM9gH50EI7ddNczdVAHLy9vYRgwA/41PNRJm3ncPp6f+64OQa5JbWzx0FF2jkYChyXrc3bKmRmfHI+mRxoejXg9hvQbdbP5obZFqUPkKdahvXR6mH+afq2bGsG9Ve63AOEfRwoXobJE+QAOMQ8kFk8ZijVTRAIgAa2kvYsJWoNlauexknP9RWTn+j0S5io9OG2VukcRRDmrom68TEosIhoFkSETaUw+8Re7kYB21Z3bJ1kDf4oxbswx1jv32P5qExqICCbqK2Zi0+GOuBsdVsMlKTRI34f4yKUBK6yilwkIE7R3HMmAbTdkso=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GZq71uVxGKdXlsBK9rqbadv0K0QQttUiz5nndljKqN5cppUtL4ZsCOOt/J+T?=
 =?us-ascii?Q?Ghy24YQHHkNrjHdq8e2aU3aGKBOCKx2qFeyYEo6X2d1yIzT3jwtY00LNR9D8?=
 =?us-ascii?Q?g3lHi/BEAb2zzF2LJigRA+vvj7qlvOHUQAMoehWw9NZukFXAY5MiPx6W+dEc?=
 =?us-ascii?Q?38aAtsSQu+9i8xmnhmsdny+q2JYP4UkVXLYsc+o1mnf91M1jr5Tg4Auuxz0B?=
 =?us-ascii?Q?SqKuoFYbqDuODIj8gID2z7RWC7pwR0hSj9B/qSrf1eo30rkyedH9k9Z6EUhC?=
 =?us-ascii?Q?9eCDabU4461glXZA37uoNAC8RviIrByWKyiHVys1E+WfjhlJxguya8MqwlSq?=
 =?us-ascii?Q?i1owB/paqV4wVwfEF0DOcENihrDvhKnpKTvKFh1Jxo6n8ork0bThb8X0Ahk1?=
 =?us-ascii?Q?Javy66kEV9G8aNpPe5GkBPlEGjxMlmfWe26LGv5VG57uNZWGvZvBskjEthLv?=
 =?us-ascii?Q?843FvKeCs4/mYVpebgbO1qNyHZmv3SMv0ZnQwJuz3Dw9l/BasBaEk6dmWNbA?=
 =?us-ascii?Q?7Sx4dvMe0oUwG3VIMuJ0TfjOxCI/8WBShvqUTss2stE7GM5ceMPsHlXbBWIo?=
 =?us-ascii?Q?vGa4B1oyKbv124onRfM/1grjS2D5YYkQAX41BZI/G+G3k9exTKPcUOQrrxU5?=
 =?us-ascii?Q?ezkPQY8hQ4um+jj3UCKK5VRdNDlNlX0uZu7a3JpfmsL7dnRD6MTfRVeO3TE8?=
 =?us-ascii?Q?43NgviWNnSfEH/B4CeyVMUwfkhHUgk4gF1w2YOvni6w24s4JEW4b5p0zIMdB?=
 =?us-ascii?Q?c26+1c0SqxeTwvrkkrSrAWcyTKMH6999nfuJvcodfUtbBR3vt6NkVKWtDJbz?=
 =?us-ascii?Q?+fXVYNqrILECZFbcMS1gOuskobijTNoxDlksL7fI/6+ZYD/I1tiel2jE8Rfs?=
 =?us-ascii?Q?SfvO6qiFvRtV6LpjNjbdxD9YGQPHp6H0KbSozCTUob1go0V8cBylEWATBx/0?=
 =?us-ascii?Q?YhT2wyr43xh8Xu9Icc1zIn8kjnJUzfmjGNfnGYuv1W5qKfcgBuDKbtAoPTU9?=
 =?us-ascii?Q?SfzEmhvQEcvQKRHjhCu//LiCtR9exVJBLNw7g3Y+IsvdF2EQio1RBweCeGmW?=
 =?us-ascii?Q?thgnnZtEKl9C9P9im3YyOgNMxBsgSSc7ABW0S555xVVvMeXiXwQeSeUh2/Mf?=
 =?us-ascii?Q?WOjNe6DCeycw2/RtWg+Ra/WPqHUXtrVOATO73hLaM77gBMkPkl8ZF+6axX0m?=
 =?us-ascii?Q?KNi3ZReN74bohecI6yfOOtmnfaM3s2nAmitEZn/9g/JlaCoPynziOgRHAnTP?=
 =?us-ascii?Q?K0mGXZifcmuO5lLTH2cG9d+F5oZdlyfwHgM/2oS1yGX0EMpnUkRoXj7OZ05Z?=
 =?us-ascii?Q?YnsRWQ7M3jw8pKNRa/LvaXPtmncQPdljqAleWymh7jBRa6m5WtY3DRjwmnOk?=
 =?us-ascii?Q?FyBcTWaD+Y+MzsGANmJx+VSBTI9+q4HDvXXrJ/teTKrmjh5k0waqOWVWxM/3?=
 =?us-ascii?Q?9tNCt9vcQPWV7DNZhENi7uAbwpYTOJXBq+HgYGdff0/bkqbBwFN2GaJ9whs9?=
 =?us-ascii?Q?oTlMpYXiMgm8ZKhP5AiobSFu7IVARmmT4KRKgDJOr5nvqJVtNe9lLfV5EKOZ?=
 =?us-ascii?Q?2+chdyxr1paWaj24MHRnDQsHVdAIPQp3onJ3FM5fwiUtmUkAOrssCGtrhosM?=
 =?us-ascii?Q?1RoHlhqdMLFIP1pAgmmNV+zDDMcEBAvwebtsFEFrdAn6Xaane5WnaZVpmgd+?=
 =?us-ascii?Q?LEIV3O601HeJ0oaPj4sdo+UJ5N9t/5lTXcgzKyBYyetso/8ACEZWVMQcVsxg?=
 =?us-ascii?Q?GQ6DXrP3Hg=3D=3D?=
X-Exchange-RoutingPolicyChecked: pdo7Gn6MfHUU09EGYP8Go9D0VGpNKyI/1jVbF0mdIVfmXQQVbitTJ1nBA9fUb7YVmSZUGwK80awnsn75Tm7Am8XUqSlQtK3ugvYRPB/d46twp5oBlsLl3169i+UvMRWmPTWqTxTaKoW+Jm4BNaQ1kW6iuTpJTYtVwjlH1yNGTyyfbglMXz5V/IYKSBKTzepUaC+Z0LIAaBanvi2McXUYlIL/A8Nrxc6M9EsYzLIngnQBDWRKwk/XtewfQIC04dBw9g4QFyTzs1C+vAeQu5AiHEPLeVR8xS+lbbQgVw4FDPILD1OKBVJPCicwlVr6BUgvxC1MjsBF2ry/rWc+ZkHY1A==
X-MS-Exchange-CrossTenant-Network-Message-Id: bfa52754-dd27-427a-85ec-08dea60b8264
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2026 16:22:29.9241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0yMKNtOdkihKiG4etHlGKtg3AxnO0tikX5+vqF+uek/NTOKEMRrriwutWyRUpwPN9xnm/Lo5s92Ro/Wvl8WZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6488
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

On Wed, Apr 29, 2026 at 06:33:55AM +0200, Raag Jadav wrote:
> On Tue, Apr 28, 2026 at 04:28:15PM -0700, Daniele Ceraolo Spurio wrote:
> > <snip>
> > 
> > I haven't gone through the code yet, but I wanted to ask some questions
> > regarding the approach first.
> 
> Sure.
> 
> > > +
> > > +/**
> > > + * DOC: PCI Error Handling
> > > + *
> > > + * Xe driver registers PCI callbacks which are called by PCI core in case of
> > > + * bus errors or resets.
> > > + *
> > > + * Currently only PCI Function Level Reset (FLR) callbacks are supported. Since
> > > + * most of the Endpoint Function state is lost on PCIe FLR, the flow is pretty
> > > + * much similar to system suspend/resume flow with a few notable exceptions.
> > 
> > IMO we need a couple of lines to describe what the impact of FLR is on the
> > HW. Something like:
> > 
> > "PCI FLR clears VRAM and resets the state of all the HW units. Therefore,
> > the contents of all exec queues and BOs in VRAM are lost and the HW needs a
> > full re-init".
> 
> Makes sense.
> 
> > > + *
> > > + * Prepare phase:
> > > + * - Temporarily wedge the device to prevent userspace access
> > 
> > I'm not convinced that wedging is the correct approach here, because the
> > expectation from the apps POV is that wedging is permanent, so they won't
> > try again later. Maybe we can have a separate flr_in_progress flag and
> > return something like -EBUSY or -EAGAIN when the FLR is in progress?
> 
> This was my initial plan but during implementation I realized that much
> of the code paths that need handling based new flag are already handled
> by wedged flag. Like IOCTLs, dummy page faulting, GT reset worker, GuC
> submission, GuC PC and TLB invalidation corner cases, SRIOV races and so
> on. So I decided to reuse it here.
> 
> In my understand wedging is permanent only when we choose to send the
> uevent and expect device recovery from userspace, which IIUC we're not.
> So I hope that's okay?

Right, it should be okay.

But we have 2 different users on top.

Runtime (NEO/Level0-core and Apps):

UMDs will send DEVICE_LOST to application in the case of any kind of reset.
Nothing prevents App to go and try it again. It will just receive error.

Admin (Level0-sysman and XPUManager):

As Raag told, to them it is only permanent if we ask for help through the
wedge uevent hints. Otherwise they should still be able to re-enumerate
the devices whenever needed.

> 
> > > + * - Stop accepting new submissions
> > 
> > This is done as part of the above step and it isn't a separate one, right?
> 
> We explicitly xe_guc_submit_disable() inside flr_prepare() so I thought it
> was worth spelling out. Will drop.
> 
> > > + * - Kill exec queues which signals all fences and frees in-flight jobs
> > > + * - Skip memory eviction due to untrustworthy VRAM contents
> > 
> > Note that the VRAM contents are not necessarily untrustworthy at this points
> > since the FLR hasn't happened yet. However, if the admin is triggering an
> > FLR it is likely that something is broken (whether memory, GuC, GT or
> > something else), so we shouldn't try to touch the HW anyway.
> 
> Yes, that's what I meant here but your phrasing is better. Will update.
> 
> > > + * - Remove all memory mappings since VRAM contents will be lost
> > 
> > Dumb question, but what happens if a userspace app has an object mapped and
> > they try to access it from the CPU after this step?
> 
> I'm not much familiar with MM parts but from what I understand it'll
> cause a fault which should be redirected to dummy page. I've tried to
> handle it with commit c020fff70d75 but I'm not sure if that's sufficient.
> This is why I've marked MM corner cases as TODO.
> 
> > > + *
> > > + * Re-initialization phase:
> > > + * - Recreate kernel bos due to skipped eviction in prepare phase
> > > + * - Restore kernel queues which were killed in prepare phase
> > > + * - Reload all uC firmwares
> > > + * - Bring up GT and unwedge to allow userspace access
> > > + *
> > > + * Since VRAM contents are lost, the user is expected to recreate user memory
> > > + * and reload context.
> > 
> > How is the user expected to realize that they need to re-create their BOs? A
> > queue can be killed for different reasons and normally that doesn't imply
> > that any associated BO is now invalid.
> 
> We return -ECANCELED if wedged flag is set and the dummy page data will
> read all 0s. This would be the indication to the application that it needs
> to recreate user memory and reload context.
> 
> Raag
> 
> > > + *
> > > + * TODO: Add PCIe error handling callbacks using similar flow.
> > > + *
> > > + * Current implementation is only limited to re-initializing GT.
> > > + * This needs to be extended for a lot of components listed below.
> > > + *
> > > + * - Proper re-initialization of GSC and PXP for integrated platforms
> > > + * - SRIOV cases which need synchronization between PF and VF
> > > + * - Re-initialization of all child devices of Xe
> > > + * - User memory handling and MM corner cases
> > > + * - Display
> > > + */
> > > +
> > > 
> > 
