Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E602E9B37E
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 17:00:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A60E10E570;
	Mon,  2 Mar 2026 17:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BGoRY5y9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AA5C10E570
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Mar 2026 17:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772470801; x=1804006801;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=RYV9rVjqmMPzkHF3Ur7MB894nJ30Ctiwqbl+ZLe9Aa8=;
 b=BGoRY5y9iFJuLMK/5NkUPpeyRjYtj3vPFBYPqMDpixTxEwKB3DnUo0wk
 WMpk4mGZpszwB2iYFYTUt4VxP2W0fKNupM6ufvOIV1FlSsV7Di2sVij9Q
 0yJNNhmlKmy0vDEJbpxqwOYHdZiVdOwgN0wZkdTRhK8aBOJk2cd8duQ3Y
 IaoZ5QSUHmXwUFqq5bTOov0EIt42AuY+2YNYWJ4qjW72USoASO0w2Wbsk
 Vl7T0R07gWB0nHY94DzBE4L3io3JzIQ7lu5jeAns83UG1rYGYIDmQZFEc
 hEy3zzrGx3iwayf0zTZm906iQswqmn/+GxDOGHLokGMBhiRvVYkQ94R/o g==;
X-CSE-ConnectionGUID: qXR1NNo0RoSYMdqjVumpaw==
X-CSE-MsgGUID: /sBPmISwTtaTF3fX7vWvSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="73391769"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="73391769"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:58:46 -0800
X-CSE-ConnectionGUID: PK+zcTHGRD6Y8W2mJUNOEQ==
X-CSE-MsgGUID: bHnhW24FQg2fZLQp1Z/rNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; d="scan'208";a="222707891"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2026 08:58:32 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 08:58:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 2 Mar 2026 08:58:15 -0800
Received: from CH4PR04CU002.outbound.protection.outlook.com (40.107.201.36) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 2 Mar 2026 08:58:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMy+dH6zk2U8xZAEK70uuaRti/QgR6Baj9ivudUyZgvdFyo4J3IiHkSGgLuJRZ1+XVJpY9f+92BI+XaYtT+oJq2a+SHlpjamJ5sEEi/koErdodaeozRiyIXPc4CxkeBxUF9X5wcTgHifN42f9yq8YCI95vIm4tJwShWP/csC/waD7or/gOgwbrgTwnYu6TEAdIHujdbXI73Vvy6WBFyZvR2Sk3bu6HE0dMBnOstJhJLQG6Ncp573ePC5tdKhnGtYYPrSzzHp4mQITvFMVZiPAKtzdTD2m1BtMu+AilueDbgabDmxIWhkvIakGCl/cp4sWsJHt7n2S5x1b1tcf10GJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=umWeR4RzaZsKQBCPSBRussmrTQymru1/1xnP7VNjCiQ=;
 b=p0pu5x+mFKMmr43Cyf0U+j6RsbkY4TZ6UORPFFy1iOZSL7rr+t3YiZWGz/aWWn52fvyaQaK85zqsZpfwPPPztRZf/SbeuSqdqf7Cv7QE91RvabuoJfjFbRrw8bfef8Zvl+fRvTXUoMS1fuYir2qAzr5ub97aowrUBmNR9rk7IS/dnSh9n2p4oZDZiir7dQprZpMI0afmhDqgB0icG63bOslwInEey8UpsLrGCA6jZ+TCgIUHpcMUmB3n5Q9nj5BOmLXyDWrcOG8d+eP40Pp3FagCzLDeYFjaqYzGtsM7ldfeEpnvcKu/w1/oWTlQyiVa5lx0wIVn/GZJaGjBuy3EVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by IA3PR11MB9225.namprd11.prod.outlook.com (2603:10b6:208:570::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.16; Mon, 2 Mar
 2026 16:58:13 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9654.020; Mon, 2 Mar 2026
 16:58:12 +0000
Date: Mon, 2 Mar 2026 11:58:08 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Raag Jadav <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "aravind.iddamsetty@linux.intel.com" <aravind.iddamsetty@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>, "Roper, Matthew D"
 <matthew.d.roper@intel.com>, "Brost, Matthew" <matthew.brost@intel.com>,
 "Winiarski, Michal" <michal.winiarski@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "maarten@lankhorst.se" <maarten@lankhorst.se>, "Tauro, Riana"
 <riana.tauro@intel.com>, "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: Re: [PATCH v2 9/9] drm/xe/pci: Introduce PCIe FLR
Message-ID: <aaXBoN5j124DudZt@intel.com>
References: <20260227170049.3418863-1-raag.jadav@intel.com>
 <20260227170049.3418863-10-raag.jadav@intel.com>
 <f6183892f5caac00192c83b213e3e22e5e9ad453.camel@intel.com>
 <aaJ8FOYU5fcV6b3e@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaJ8FOYU5fcV6b3e@black.igk.intel.com>
X-ClientProxiedBy: SJ0PR03CA0390.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::35) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|IA3PR11MB9225:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cb60e1e-2292-4276-8626-08de787ce37f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 4zNVAXsR+/NGupQ7iWBKRZJFJANQIyj/IwkHgLzOTBAHtc0qmWFmmQBtnVV+rr54hfFtwBfTdLgHyZAYhB0PgradAtTQ+cMIchs4xw5XCyEM1Yoc5I5vcwwUS5XFaMPQrHXbortS4NV8p+GTqjp5bbHS3ax5IOM2JBvlDU/SA53XDy0R7Ch3dPcCwh5MXyTdXhqUXlmbQN6onnZnmJ7tZ6UQQ4ZkmiAtFwWjOmXM3UlL98f1JWrWYrXdgvTg6ShzmCOLe89G1/WO0tUlWjmQaTJrPbHG/21XH+wWH/q7+6cjtTwuyvBsF1Yo8RBOhyKEa/Y0my3T2nTA6Aas0lBX3Lil+ZOnCErJ/GLY5Drj0q0NU2U6vkQre3QMICfVke+bpyF0kP/k3iSHShevyJkLYhh9CiGxGvZzy5/e4Lr9eu8OwG8cs9ulYkSwbCzpN5HwrWtLPGZfUfdiBIWNQ01Q/LgwUitu9eQMd4vfNDRYgNuMxc1TxNVQUi01MijQCcIcedAlSRpwDq4CNVmYtUKv3Cd8APsLwneI2BeNsn2BWQxtxhxo7w7f7OMQBR+HKe7YxuJJEZ1VB90dVo+QYLH3vvNiTYpqaL6QG/gkGbIb0ERIFrNItm4HnV7Pn+b16+Sr7uUAPKnPPoiE17ExpMVlSV+WwGmQRf3M67n9eurgQSqU59654LF+mxCIuNC2CzM60S12ngy0ugLZh+tvo0+ArUdvj1F/Ubtd+PqdrH2Mo1c=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1VUeXlhYWxPcWIxTUE3OXJyUE9hc0kvYjhFZDJhZkt4NnQ3Z2Vyc2pkNUhV?=
 =?utf-8?B?VUNBVng5R0Z5SkxMaFRLQys3UmJETVBIZlVNZTVWZGFJaGxPSVFvK0IxT3lH?=
 =?utf-8?B?cFNwaVpJeUVhYyt0b1dDVUthaWZMZjJtSDhBdGNKNVlEckR1TjkwbjJjSHZa?=
 =?utf-8?B?YmVHejFHMVZwZmUwa1pKTUZtRkw4Q0lkekc4K043NS84ZE10M1FKaHhpb0oz?=
 =?utf-8?B?RmpXWUZDNVZOTURvaytpanBVamNrTXNRNlJrQzFHNkN6V2NzbXJkb1V0Z1dn?=
 =?utf-8?B?czBSaUFoUEpmbmpVcml3YU9oRVhXNW1leUlpYkR2WWU4bGp6Zy9hZTFkSXhQ?=
 =?utf-8?B?ZlBHN3lUaENnT2RXQzlMZFNvTVhtK1gwSnpHeTBnMmdnZnRDSmN2c3F6Tmla?=
 =?utf-8?B?dm13MDRDcmJpTEhkME9ud0MxU0F0SmtQMVdjMlhWeHQzTHJiQ2dtWHpLZlBr?=
 =?utf-8?B?bkY2QkJlNUJITy9MeGM3UXl3cTRDRE5jZDRvNmtxcnppTWx4UHBHSEhnZW9C?=
 =?utf-8?B?K0xRSWlpTXZscjVPS3RNQkV6L0h6MFdRZjNCQjNNOUJ1bFNkaG5QTkFycEhs?=
 =?utf-8?B?bkVPaE9ZbGZqTUs3ckpXWGV0S0VLUHhLYlhTWHUzRm5Fa1lScWthd3dCY2M2?=
 =?utf-8?B?Q1FKb0pCY3A0aFhPSVVaMkJWUHBKSzNEcCtpejFNSlhBc2wzYXNhT0hpblpR?=
 =?utf-8?B?WGs5Ymx5M284cUJtL1o0OUhxMnU0WGQ0Wlo1SzFFMVdjZlhOcGU1WHVBYmtr?=
 =?utf-8?B?NVZCZXlBdVM0NVIxWW1jUWxsNTdDU3dBbXF6ZW1TVE5IQjZJdGN0dlkrOFE0?=
 =?utf-8?B?dHBnQUJ5WUpZcWJ6ZEpEalVmT1loRW1leE1BdzViRm1OeWE5NnZJc093RVlt?=
 =?utf-8?B?ZFZ6bzMzZEF6ZmN3NnFzNWdObVNyc01tWWFTSlpjUWJRZ2IxOE81L0ttanhZ?=
 =?utf-8?B?cm5yVkJZajVITHJkVVhmODFVZ21lMDROMFVzL0Z5WHgvNC9tTEVJOXdYZC9C?=
 =?utf-8?B?OFYrZlVlaTE3RWg3RzRrREQ0TCtpUXloM2ROSmFHWHJwOEVBS2lFd0M1Tm8z?=
 =?utf-8?B?clNQOWd3SXZtRFhJWTU4Mi85eWJVUGVMamdpQjMwVy82UUx6RFQ4eGQrUU1C?=
 =?utf-8?B?OXlvYXY4TWJsWkFrL0Y5K0hKR1E3WlZQTXliTWZvSEdBRWN4SXhXdWN4OWM5?=
 =?utf-8?B?L1RpcW9DaWV3V3ZQR3RPMWIvQkZVdVVRTGNKZnN5MDg5V1ZqK05aQUsvVEdt?=
 =?utf-8?B?aWxWNVpPVTVqcExTRGk5Y3dZTDVVMDg3dTQ4QTcxRnpkNWJ0Zk82MDRrMkZY?=
 =?utf-8?B?MGRoTVQ4SUkyUlJBcTYrMzQzYzIvcDZrclhLdUJTWTU3N0R3Q1cxMkJwdkM1?=
 =?utf-8?B?REp4eXpXelNtR0ptOTVqYy9wblR4T0ZhelNORi9YNko3dENZTGY3UmIwc0tm?=
 =?utf-8?B?MWZTMEJrbWRrZXVyeWQ2bkZ0RVA5UW9sUTNXdzRpSTRjNnVJd0M4UWozc0pV?=
 =?utf-8?B?K1pXMnpJMEpEN0dNNFd3ZUZLQzZTamZqbEZHM282d2N1WlRyTFVGOWRCVFpj?=
 =?utf-8?B?Q1kza2d1YkVIc1l0R0JrRzV6TURmKzY2cWFhSTh2U3BQbnZqMmJ1MmRYZTNi?=
 =?utf-8?B?MmNMSVZZN3BkZVhNVS9IUkM4VVhCQnB0d3BNd1hRRHMwelNsY1hCUlRZRkZo?=
 =?utf-8?B?VTMyeFZvKzJMejNtS1F0bVNCMERlYUpBdFFuakNXODBYWTdVRU1lOTBKZlQ4?=
 =?utf-8?B?MUl0bXZzWlNCd25tekpibis0bWdnc2I4WlhZa0xIUFNLbGJaeWVrMEFJRkdn?=
 =?utf-8?B?TFlVMlRXTDZNN2tpcit4WmowWlpYc0R6S3Vvd1lOZzBKdVNRS05adTRaWmUv?=
 =?utf-8?B?ZHhxRFcyL2YwMlkvRDFoMk45K3lYbXFFSU1qVE1UbkxjdmFYdTRSbTA0TlJ1?=
 =?utf-8?B?KytVQkNic2ZQQ0Faa1UyT1VLYXhaNUJRVmdpZm1WaEc4TlJHYjlidS9xRkdG?=
 =?utf-8?B?RjkvbVMvTWY1bTcrMDdtUzRUdnR2eEltbjh6VnpWVlU3WCs0STNwbTZmT2JP?=
 =?utf-8?B?S1hJdTZkTkY0cCtHSnpySVpmZUg3M21xcVR0TkowY1Z2c2pZNlRweGlLc1Jy?=
 =?utf-8?B?c2Raa3g4VmYwdEd4dVRWaFBENEh0bnVsVHpvdTdtVGdKTU9rbSs5RllEdExJ?=
 =?utf-8?B?czhoaHF2MFowMjdRbDdLUy80UGdEY3prZ2FKVnFGTHJMZzV1MUpLUkV3ZG5P?=
 =?utf-8?B?QlptRXZHSkt0VGx6U285Q2t2cWVxMzFXL1hudC9BMk1YZDYxUkVYZG1mdWlM?=
 =?utf-8?B?ZURRdm9haFBrN2pxajFUSVNYd3J6ZmhHUDQxZUp6emdEaDNPWGNzZz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cb60e1e-2292-4276-8626-08de787ce37f
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 16:58:12.4038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eh+0oNz1i61t0psC67Th74FePmLGaCwBc3z+uOJHSpIJ1XssrAOTG85kxOg5hsoQpI2yLlGZ8BCWPu6e2EYQGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9225
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

On Sat, Feb 28, 2026 at 06:24:36AM +0100, Raag Jadav wrote:
> On Fri, Feb 27, 2026 at 11:19:12PM +0530, Vivi, Rodrigo wrote:
> > On Fri, 2026-02-27 at 22:30 +0530, Raag Jadav wrote:
> > > With all the pieces in place, we can finally introduce PCIe Function
> > > Level
> > > Reset (FLR) handling which re-initializes hardware state without the
> > > need
> > > for reloading the driver from userspace. All VRAM contents are lost
> > > along
> > > with hardware state, so the driver takes care of recreating the
> > > required
> > > kernel bos as part of re-initialization, but user still needs to
> > > recreate
> > > user bos and reload context after PCIe FLR.
> > > 
> > > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > 
> > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > Cc: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
> > 
> > Do we really have everything in place? I'm missing the handling of VF
> > here. Hence we would have the same deadlock pointed out by Michal when
> > Aravind attempted it last time, no?!
> 
> There's a whole lot of TODOs in this file, so perhaps poor choice of words.
> 
> > We probably need to use the guc relay communication here so PF can
> > inform VF of the FLR, then stop all the workload and wedge the device,
> > before the AER triggers a kill of the VM, no?!
> 
> I was hoping to have the base functionality in place and build stuff on
> top, but I'll let you all make the final call here.

I definitely support this approach. Let's gets the basic in and build on top.

> 
> Raag
> 
> > > ---
> > > v2: Spell out Function Level Reset (Jani)
> > > ---
> > >  drivers/gpu/drm/xe/Makefile     |   1 +
> > >  drivers/gpu/drm/xe/xe_pci.c     |   1 +
> > >  drivers/gpu/drm/xe/xe_pci.h     |   2 +
> > >  drivers/gpu/drm/xe/xe_pci_err.c | 150
> > > ++++++++++++++++++++++++++++++++
> > >  4 files changed, 154 insertions(+)
> > >  create mode 100644 drivers/gpu/drm/xe/xe_pci_err.c
> > > 
> > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > b/drivers/gpu/drm/xe/Makefile
> > > index 7fc67c320086..bc468a9afc48 100644
> > > --- a/drivers/gpu/drm/xe/Makefile
> > > +++ b/drivers/gpu/drm/xe/Makefile
> > > @@ -99,6 +99,7 @@ xe-y += xe_bb.o \
> > >  	xe_page_reclaim.o \
> > >  	xe_pat.o \
> > >  	xe_pci.o \
> > > +	xe_pci_err.o \
> > >  	xe_pci_rebar.o \
> > >  	xe_pcode.o \
> > >  	xe_pm.o \
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.c
> > > b/drivers/gpu/drm/xe/xe_pci.c
> > > index 0a3bc5067a76..47a2f9de9d61 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.c
> > > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > > @@ -1301,6 +1301,7 @@ static struct pci_driver xe_pci_driver = {
> > >  #ifdef CONFIG_PM_SLEEP
> > >  	.driver.pm = &xe_pm_ops,
> > >  #endif
> > > +	.err_handler = &xe_pci_err_handlers,
> > >  };
> > >  
> > >  /**
> > > diff --git a/drivers/gpu/drm/xe/xe_pci.h
> > > b/drivers/gpu/drm/xe/xe_pci.h
> > > index 11bcc5fe2c5b..85e85e8508c3 100644
> > > --- a/drivers/gpu/drm/xe/xe_pci.h
> > > +++ b/drivers/gpu/drm/xe/xe_pci.h
> > > @@ -8,6 +8,8 @@
> > >  
> > >  struct pci_dev;
> > >  
> > > +extern const struct pci_error_handlers xe_pci_err_handlers;
> > > +
> > >  int xe_register_pci_driver(void);
> > >  void xe_unregister_pci_driver(void);
> > >  struct xe_device *xe_pci_to_pf_device(struct pci_dev *pdev);
> > > diff --git a/drivers/gpu/drm/xe/xe_pci_err.c
> > > b/drivers/gpu/drm/xe/xe_pci_err.c
> > > new file mode 100644
> > > index 000000000000..16fc6a9f8289
> > > --- /dev/null
> > > +++ b/drivers/gpu/drm/xe/xe_pci_err.c
> > > @@ -0,0 +1,150 @@
> > > +// SPDX-License-Identifier: MIT
> > > +/*
> > > + * Copyright © 2026 Intel Corporation
> > > + */
> > > +
> > > +#include "xe_bo_evict.h"
> > > +#include "xe_device.h"
> > > +#include "xe_gt.h"
> > > +#include "xe_gt_idle.h"
> > > +#include "xe_i2c.h"
> > > +#include "xe_irq.h"
> > > +#include "xe_late_bind_fw.h"
> > > +#include "xe_pci.h"
> > > +#include "xe_pcode.h"
> > > +#include "xe_printk.h"
> > > +#include "xe_pxp.h"
> > > +#include "xe_wa.h"
> > > +
> > > +static int xe_flr_prepare(struct xe_device *xe)
> > > +{
> > > +	struct xe_gt *gt;
> > > +	int err;
> > > +	u8 id;
> > > +
> > > +	err = xe_pxp_pm_suspend(xe->pxp);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	xe_late_bind_wait_for_worker_completion(&xe->late_bind);
> > > +
> > > +	for_each_gt(gt, xe, id)
> > > +		xe_gt_flr_prepare(gt);
> > > +
> > > +	xe_irq_disable(xe);
> > > +
> > > +	// TODO: Drop all user bos
> > > +	xe_bo_pci_dev_remove_pinned(xe);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int xe_flr_done(struct xe_device *xe)
> > > +{
> > > +	struct xe_tile *tile;
> > > +	struct xe_gt *gt;
> > > +	int err;
> > > +	u8 id;
> > > +
> > > +	for_each_gt(gt, xe, id)
> > > +		xe_gt_idle_disable_c6(gt);
> > > +
> > > +	for_each_tile(tile, xe, id)
> > > +		xe_wa_apply_tile_workarounds(tile);
> > > +
> > > +	err = xe_pcode_ready(xe, true);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	xe_device_assert_lmem_ready(xe);
> > > +
> > > +	err = xe_bo_restore_map(xe);
> > > +	if (err)
> > > +		return err;
> > > +
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_flr_done(gt);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	xe_i2c_pm_resume(xe, true);
> > > +
> > > +	xe_irq_resume(xe);
> > > +
> > > +	for_each_gt(gt, xe, id) {
> > > +		err = xe_gt_resume(gt);
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	xe_pxp_pm_resume(xe->pxp);
> > > +
> > > +	xe_late_bind_fw_load(&xe->late_bind);
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static void xe_pci_reset_prepare(struct pci_dev *pdev)
> > > +{
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	/* TODO: Extend support as a follow-up */
> > > +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) ||
> > > xe->info.probe_display) {
> > > +		xe_err(xe, "PCIe FLR not supported\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Wedge the device to prevent userspace access but don't
> > > send the event yet */
> > > +	atomic_set(&xe->wedged.flag, 1);
> > > +
> > > +	/*
> > > +	 * The hardware could be in corrupted state and access
> > > unreliable, but we try to
> > > +	 * update data structures and cleanup any pending work to
> > > avoid side effects during
> > > +	 * PCIe FLR. This will be similar to xe_pm_suspend() flow
> > > but without migration.
> > > +	 */
> > > +	if (xe_flr_prepare(xe)) {
> > > +		xe_err(xe, "Failed to prepare for PCIe FLR\n");
> > > +		return;
> > > +	}
> > > +
> > > +	xe_info(xe, "Prepared for PCIe FLR\n");
> > > +}
> > > +
> > > +static void xe_pci_reset_done(struct pci_dev *pdev)
> > > +{
> > > +	struct xe_device *xe = pdev_to_xe_device(pdev);
> > > +
> > > +	/* TODO: Extend support as a follow-up */
> > > +	if (!IS_DGFX(xe) || IS_SRIOV_VF(xe) || pci_num_vf(pdev) ||
> > > xe->info.probe_display)
> > > +		return;
> > > +
> > > +	if (!xe_device_wedged(xe)) {
> > > +		xe_err(xe, "Device in unexpected state, re-
> > > initialization aborted\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/*
> > > +	 * We already have the data structures intact, so try to re-
> > > initialize the device.
> > > +	 * This will be similar to xe_pm_resume() flow, except we'll
> > > also need to recreate
> > > +	 * all VRAM contents.
> > > +	 */
> > > +	if (xe_flr_done(xe)) {
> > > +		xe_err(xe, "Re-initialization failed\n");
> > > +		return;
> > > +	}
> > > +
> > > +	/* Unwedge to allow userspace access */
> > > +	atomic_set(&xe->wedged.flag, 0);
> > > +
> > > +	xe_info(xe, "Re-initialization success\n");
> > > +}
> > > +
> > > +/*
> > > + * PCIe Function Level Reset (FLR) support only.
> > > + * TODO: Add PCIe error handlers using similar flow.
> > > + */
> > > +const struct pci_error_handlers xe_pci_err_handlers = {
> > > +	.reset_prepare = xe_pci_reset_prepare,
> > > +	.reset_done = xe_pci_reset_done,
> > > +};
